# Usage: ask TITLE questions...

function ask () {
    local title="$1"
    shift

    local questions=()
    while [[ -n $1 ]]; do
        questions+=("$1")
        shift
    done

    echo " --- ${title} ---"
    for i in ${!questions[@]}; do
        echo "$((i+1)). ${questions[$i]}"
    done

    local r
    function loop () {
        read -p "Choose: " r

        if [[ -z "${r##*[0-9]*}" ]]; then
            if [[ $r -gt ${#questions[@]} ]] || [[ $r -lt 1 ]]; then
                echo "Answer out of range."
                loop
            fi
        else
            echo "Answer is not a number."
            loop
        fi
    }

    loop

    return $r
}
