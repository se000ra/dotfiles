#!/bin/sh
i3status --config /home/van/.i3/i3status.conf | while :
#do
    #read line
    #echo "TODO:$(task ls | sed -n '4s/[[:blank:]]\+/ /pg' )\
#| LG: $(setxkbmap -print | grep xkb_symbols | awk -F"+" '{print $2}') \
#| $line" || exit 1
#done
do
    read line
    punin=$(python /home/van/src/punch-time-tracking-1.3/Punch.py wh)
    #LG=$(setxkbmap -print | grep xkb_symbols | awk -F"+" '{print $2}') 
    #pycom=$(/home/xtd8865/.i3/pys.py)
    #todo=$(task ls | sed -n '4s/[[:blank:]]\+/ /pg' )
    todo=$(todo.sh -d /home/van/pr/todo/todo.cfg ls | head -1)
    tt=$(t_since_awake)
    #echo "TODO:$todo | LG: $LG | $pycom | $line" || exit 1
    echo "TODO:$todo |>> $tt <<|>$punin |  $line" || exit 1
done

