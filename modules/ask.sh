# Usage: ask TITLE questions...

function askopt () {
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

function askyn () {
    local question="$1"

    local r

    function loop () {
        read -p " --- $question [Y/n] --> " r

        if [[ -z $r ]]; then
            r=1
        else
            local normr=$(echo "$r" | awk '{print tolower($0)}')

            if [[ $normr != "y" ]] && [[ $normr != "n" ]]; then
                echo "Answer different from \"y\" or \"n\"."
                loop
            fi

            if [[ $normr = "y" ]]; then
                r=1
            else
                r=0
            fi
        fi
    }

    loop

    return $r
}
