
base="base_conf.ini"
config="config.ini"
cave_prefix="_cave_"

cat "$base" > "$config"

write() {
    echo "$1" >> "$config"
}

write ""

for world in prep/*
do
    world_name="$(basename "$world")"
    write "[world:$world_name]"
    write "input_dir = $world"
    if [[ "$world_name" == *nether* ]]
    then
        write "crop_max_y = 55"
    fi
    write ""
    write "[map:$world_name]"
    write "world = $world_name"
    if [[ "$world_name" == *end* ]]
    then
        write "render_mode = plain"
    fi

    write ""

    write "[world:$cave_prefix$world_name]"
    write "input_dir = $world"
    write ""
    write "[map:$cave_prefix$world_name]"
    write "world = $cave_prefix$world_name"
    write "render_mode = cave"

    write ""

done
