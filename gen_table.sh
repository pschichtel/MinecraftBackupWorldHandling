
base_url="http://example.org"
table="maps.csv"

rm "$table"

write() {
    echo "$1" >> "$table"
}

today="$(date --iso-8601)"

write "generated_name,proper_name,rough_date,comment,link"
for world in prep/*
do
    world_name="$(basename "$world")"
    write "$world_name,$world_name,$today,no comment,$base_url/index.html#$world_name/0/0/200/-184/64"
done
