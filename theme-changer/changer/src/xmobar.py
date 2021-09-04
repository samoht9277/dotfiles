from read import Reader

class Xmobar():
    
    def __init(self, choice):
        from re import findall
        config = self.__get_config(choice)
        self.__replace_colors(findall("#......", config))
        self.__replace_to_file(Reader().read_colorcheme(), choice)

    def __get_config(self, choice):
        return Reader().read('/home/tomi/.config/xmobar/{0}.hs'.format(choice))

    def __replace_colors(self, array):
        color_scheme = Reader().read_colorcheme()
        new = []
        for i in array:
            new.append(color_scheme[str(i)])

    def __replace_to_file(self, color_scheme, choice):
        from re import finditer
        with open('/home/tomi/.config/xmobar/{0}.hs'.format(choice), 'r+') as file:
            f = str(file.read())
            matches = finditer("#......", f)
            for matchNum, match in enumerate(matches, start=1):
                f.replace(str(match.group()), color_scheme[str(match.group())]) ### TODO FIX replace() not replacing properly the new string passed ###
                print(f)

    def primary(self):
        self.__init("primary")

    def secondary(self):
        self.__init("secondary")

Xmobar().primary()