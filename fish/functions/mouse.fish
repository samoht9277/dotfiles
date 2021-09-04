function mouse --description "mouse <interval> <pixels>"
	if test (count $argv) -ne 2 
		echo "Error: wrong arguments. (Usage: mouse <interval> <pixels>"
		kill -INT $fish_pid
	end
	set seconds_count $argv[1]
	set pixel_count $argv[2]
	echo "Moving mouse by $pixel_count pixels every $seconds_count seconds"
	while true; xdotool mousemove_relative -- (seq -$pixel_count $pixel_count | shuf -n 1) (seq -$pixel_count $pixel_count | shuf -n 1) && sleep 5; end
end