if [[ $# < 2 ]]
then
    counter_file="$(mktemp)"
    echo -n "1" > "$counter_file"
    find -type f -iname level.dat -exec bash "$0" "{}" "$counter_file" \;
    rm "$counter_file"
else
    level_dat="$1"
    counter_file="$2"
    counter=$(cat $counter_file)
    echo -n "$(($counter + 1))" > "$counter_file"
    map_dir="$(dirname "$level_dat")"
    normalized="$(printf '%03d' $counter)_$(sed -r 's/\W/_/g' <<< "$map_dir" | sed -r 's/^__//g' | sed 's!/!_!g')"
    echo "$map_dir"
    echo "$normalized"

    mv "$map_dir" "$normalized"
fi


