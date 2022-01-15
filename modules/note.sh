notecommands=()

function noteadd() {
    notecommands+=("$1")
}

# rbot = remove bottom
function noterbot() {
    notecommands=("${notecommands[@]:1}")
}

function notedraw() {
    # Put all the outputs in a string, separated by "---" .
    local bulkstr=$(eval ${notecommands[0]})

    # Find the longest line of the outputs.
    local maxlen=$(echo "$bulkstr" | wc -L)

    # Divide the string in an array (delimiter is newline)
    readarray -t arraystr <<< "$bulkstr"

    # Print a blank page, then the thing.
    local y=0

    tput sc
    tput bold
    tput setaf 4
    tput setab 7

    # I hate bash syntax.
    for((i=0; i<$((${#arraystr[@]}+2)); i++)); do
        tput cup $y $(($(tput cols) - $(($maxlen + 4))))
        printf "  %-${maxlen}s  " ''
        y=$(($y+1))
    done

    y=1
    for str in "${arraystr[@]}"; do
        tput cup $y $(($(tput cols) - $(($maxlen + 4))))
        printf "  $str"
        y=$(($y+1))
    done

    tput rc
}
