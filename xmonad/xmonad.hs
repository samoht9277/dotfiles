-- Data
import Data.Monoid
import Data.Tree
import System.Exit (exitSuccess)
import System.IO (hPutStrLn)
import XMonad
import XMonad.Actions.CopyWindow (kill1)
import XMonad.Actions.CycleWS (nextScreen, prevScreen)
import XMonad.Actions.MouseResize
import XMonad.Actions.WithAll (sinkAll)
import XMonad.Actions.UpdatePointer

-- Hooks
import XMonad.Hooks.DynamicLog (PP (..), dynamicLogWithPP, shorten, wrap, xmobarColor, xmobarPP)
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageDocks (ToggleStruts (..), avoidStruts, docksEventHook, manageDocks)
import XMonad.Hooks.ManageHelpers (doFullFloat, isFullscreen)
import XMonad.Hooks.SetWMName
import XMonad.Hooks.WorkspaceHistory
import XMonad.Hooks.InsertPosition

-- Layouts
import XMonad.Layout.GridVariants (Grid (Grid))
import XMonad.Layout.LayoutModifier
import XMonad.Layout.LimitWindows (limitWindows)
import XMonad.Layout.MultiToggle ((??), EOT (EOT), mkToggle, single)
import qualified XMonad.Layout.MultiToggle as MT (Toggle (..))
import XMonad.Layout.MultiToggle.Instances (StdTransformers (MIRROR, NBFULL, NOBORDERS))
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed (Rename (Replace), renamed)
import XMonad.Layout.ResizableTile
import XMonad.Layout.ShowWName
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns
import qualified XMonad.Layout.ToggleLayouts as T (ToggleLayout (Toggle), toggleLayouts)
import XMonad.Layout.WindowArranger (WindowArrangerMsg (..), windowArrange)
import qualified XMonad.StackSet as W

-- Utilities
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.SpawnOnce

myModMask = mod4Mask :: KeyMask

myTerminal = "alacritty --option font.size=12":: String

myBorderWidth = 2 :: Dimension

myNormColor = "#AEAEAE" :: String

myFocusColor = "#FFFFFF" :: String

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

myStartupHook :: X ()
myStartupHook = do
    spawnOnce "bash ~/.xmonad/start.sh"
    spawnOnce "sleep 5 && nm-applet &"
    setWMName "XMonad"

mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

-- Layouts definition

tall = renamed [Replace "\xfb3f"]
    $ limitWindows 6
    $ mySpacing 4
    $ ResizableTall 1 (3 / 100) (1 / 2) []

grid = renamed [Replace "\xfa6f"]
    $ limitWindows 4
    $ mySpacing 4
    $ mkToggle (single MIRROR)
    $ Grid (16 / 10)

threeCol = renamed [Replace "\xfa6b"]
    $ limitWindows 7
    $ mySpacing 4
    $ ThreeCol 1 (3 / 100) (1 / 3)

floats = renamed [Replace "float"] 
    $ limitWindows 20 simplestFloat

-- Layout hook

myLayoutHook = avoidStruts 
    $ smartBorders
    $ mouseResize
    $ windowArrange
    $ T.toggleLayouts floats
    $ mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefaultLayout
  where
    myDefaultLayout = 
        tall
        ||| threeCol
        ||| grid

xmobarEscape :: String -> String
xmobarEscape = concatMap doubleLts
  where
    doubleLts '<' = "<<"
    doubleLts x = [x]

myWorkspaces :: [String]
myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myKeys :: [(String, X ())]
myKeys = 
    [
    ------------------ Window configs ------------------

    -- Move focus to the next window
    ("M-j", windows W.focusDown),
    -- Move focus to the previous window
    ("M-k", windows W.focusUp),
    -- Swap focused window with next window
    ("M-S-j", windows W.swapDown),
    -- Swap focused window with prev window
    ("M-S-k", windows W.swapUp),
    -- Kill window
    ("M-S-w", kill1),
    -- Restart xmonad
    ("M-C-r", spawn "xmonad --restart"),
    -- Quit xmonad
    ("M-C-<Esc>", io exitSuccess),

    ----------------- Swapping Screen Focus -------------
    ("M-`", nextScreen),

    ----------------- Floating windows ------------------

    -- Toggles 'floats' layout
    ("M-f", sendMessage (T.Toggle "float")),
    -- Push floating window back to tile
    ("M-S-f", withFocused $ windows . W.sink),
    -- Push all floating windows to tile
    ("M-C-f", sinkAll),

    ---------------------- Layouts ----------------------

    -- Switch to next layout
    ("M-<Tab>", sendMessage NextLayout),
    -- Switch to first layout
    ("M-S-<Tab>", sendMessage FirstLayout),
    -- Toggles noborder/full
    ("M-<Space>", sendMessage (MT.Toggle NBFULL) >> sendMessage ToggleStruts),
    -- Toggles noborder
    ("M-S-n", sendMessage $ MT.Toggle NOBORDERS),
    -- Shrink horizontal window width
    ("M-S-h", sendMessage Shrink),
    -- Expand horizontal window width
    ("M-S-l", sendMessage Expand),
    -- Shrink vertical window width
    ("M-C-j", sendMessage MirrorShrink),
    -- Exoand vertical window width
    ("M-C-k", sendMessage MirrorExpand),

    -------------------- App configs --------------------

    -- Browser
    ("M-b", spawn "firefox"),
    -- Private Browser
    ("M-S-b", spawn "firefox --private-window"),
    -- File explorer
    ("M-e", spawn "thunar ~/"),
    -- Terminal
    ("M-<Return>", spawn myTerminal),
    -- Power Menu
    ("M-<Esc>", spawn "~/.config/rofi/powermenu/powermenu.sh"),
    ("M-m", spawn "~/.config/rofi/launchers/text/launcher.sh"),
    ("M-S-q", spawn "~/.config/rofi/powermenu/powermenu.sh"),

    --------------------- Hardware ---------------------

    -- Multimedia
    ("<XF86AudioPlay>", spawn "playerctl play-pause"),
    ("<XF86AudioPrev>", spawn "playerctl previous"),
    ("<XF86AudioNext>", spawn "playerctl next"),
    ("C-<XF86AudioPlay>", spawn "/home/tomi/code/xmonad/audio/songrec/scan.sh"),

    -- Print
    ("<Print>", spawn "bash ~/code/xmonad/screen/screenshot.sh crop"),
    ("M-<Print>", spawn "bash /home/tomi/code/xmonad/screen/screenshot.sh"),

    -- Toggle Compositor
    ("<Pause>", spawn "/home/tomi/code/xmonad/compositor/toggle.sh"),

    -- Volume
    ("<XF86AudioLowerVolume>", spawn "~/code/xmonad/audio/volume.sh down"),
    ("<XF86AudioRaiseVolume>", spawn "~/code/xmonad/audio/volume.sh up"),
    ("<XF86AudioMute>", spawn "~/code/xmonad/audio/mute.sh" ),
    
    -- HUE
    ("C-<XF86AudioMute>", spawn "~/code/xmonad/light/OnOff.sh"),
    ("C-<XF86AudioRaiseVolume>", spawn "~/code/xmonad/light/Brightness.sh + 50"),
    ("C-<XF86AudioLowerVolume>", spawn "~/code/xmonad/light/Brightness.sh - 50"),

    -- Microphone
    ("M-S-<XF86AudioMute>", spawn "~/code/xmonad/microphone/microphone.sh")
    ]

main :: IO ()
main = do
    -- Xmobar
    xmobarMonitorLG <- spawnPipe "xmobar -x 0 ~/.config/xmobar/primary.hs"
    xmobarMonitorSG <- spawnPipe "xmobar -x 1 ~/.config/xmobar/secondary.hs"
    -- Xmonad
    xmonad $ ewmh def {
        manageHook = (isFullscreen --> doFullFloat) <+> manageDocks <+> insertPosition Below Newer,
        handleEventHook = docksEventHook,
        modMask = myModMask,
        terminal = myTerminal,
        startupHook = myStartupHook,
        layoutHook = myLayoutHook,
        workspaces = myWorkspaces,
        borderWidth = myBorderWidth,
        normalBorderColor = myNormColor,
        focusedBorderColor = myFocusColor,
        -- Log hook
        logHook = workspaceHistoryHook <+> dynamicLogWithPP xmobarPP {
            ppOutput = \x -> hPutStrLn xmobarMonitorLG x >> hPutStrLn xmobarMonitorSG x,
            ppCurrent = xmobarColor "#FFFFFF" "" . \s -> " \xf111 ",
            ppVisible = xmobarColor "#FFFFFF" "" . \s  -> " \xf192 ",
            ppHidden = xmobarColor "#FFFFFF" "" . \s -> " \xf1db ",
            ppHiddenNoWindows = xmobarColor "#515151" "" . \s -> " \xf1db ",
            ppExtras = [],
            ppSep = "<fc=#666666> | </fc>",
            ppOrder = \(ws : l : _ : ex ) -> [ws,l] ++ ex
        } >> updatePointer (0.5, 0.5) (0.5, 0.5) 
} `additionalKeysP` myKeys
