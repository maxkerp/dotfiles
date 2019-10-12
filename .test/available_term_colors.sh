#!/bin/bash
#   Original Author: Daniel Crisman
#   This file echoes a bunch of color codes to the 
#   terminal to demonstrate what's available.  Each 
#   line is the color code of one forground color,
#   out of 17 (default + 16 escapes), followed by a 
#   test use of that color on all nine background 
#   colors (default + 8 escapes).
#
#   Further Explaination (Maximilian Kerp)
#
#   Setting the color of text in a terminal is done by using
#   escape sequences. The pattern for a color escape sequence
#   is \[\033[$color\] . Any text after the escape sequence
#   will be in the color of $color. This also means, that if 
#   you don't want the rest of your prompt or text to be in this
#   specific color, you need to append the escape sequence for the
#   default color after whatever text it is you want to colorize.
#
#   The values for $color is a code which tells the terminal 
#   which 'type of color' you want the following text to be.
#   Note, type of text describes a variable e.g Light Blue,
#   but is not the actual value for that color. Most terminal
#   emulators have profile preferences (like gnome-termnial)
#   where the actual value for a color can be set.
#
#   There are three types of color codes, foreground normal,
#   foreground bold, and background color.
#
#   Here are the codes:
#   
#   Default 0m      Bold Default 1m  
#   Black   0;30m   Bold Grey    1;30m   Bg Black   40m
#   Red     0;31m   Bold Red     1;31m   Bg Red     41m
#   Green   0;32m   Bold Green   1;32m   Bg Green   42m
#   Yellow  0;33m   Bold Yellow  1;33m   Bg Yellow  43m 
#   Blue    0;34m   Bold Blue    1;34m   Bg Blue    44m
#   Purple  0;35m   Bold Purple  1;35m   Bg Purple  45m
#   Cyan    0;36m   Bold Cyan    1;36m   Bg Cyan    46m
#   Grey    0;37m   Bold Whihte  1;37m   Bg Grey    47m
#





T='gYw'   # The test text

echo -e "\n                 40m     41m     42m     43m\
     44m     45m     46m     47m";

for FGs in '   0m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
           '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
           '  36m' '1;36m' '  37m' '1;37m';
  do FG=${FGs// /}
  echo -en " $FGs \033[$FG  $T  "
  for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
                 #set FG   set BG       set default
    do echo -en " \033[$FG\033[$BG  $T  \033[0m";
  done
  echo;
done
echo

