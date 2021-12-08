# Get the procs sorted by the number of inotify watches

usage(){
    cat << EOF
Usage: $0 [--help|--limits]
    -l, --limits    Will print the current related limits and how to change them
    -h, --help      Show this help
EOF
}

limits(){
    printf "\nCurrent limits\n-------------\n"
    sysctl fs.inotify.max_user_instances fs.inotify.max_user_watches

    cat <<- EOF
Changing settings permanently
-----------------------------
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
sudo sysctl -p # re-read config
EOF
}

if [ "$1" = "--limits" -o "$1" = "-l" ]; then
    limits
    exit 0
fi

if [ "$1" = "--help" -o "$1" = "-h" ]; then
    usage 
    exit 0
fi

if [ -n "$1" ]; then
    printf "\nUnknown parameter '$1'\n" >&2
    usage
    exit 1
fi

generateData(){
    local -i PROC
    local -i PID
    local -i CNT
    local -i TOT
    # read process list into cache
    local PSLIST="$(ps ax -o pid,user,command --columns $(( COLS - WLEN )))"
    IFS=","
    find /proc/*/fd -lname anon_inode:inotify 2> /dev/null |
        cut -d "/" -f 3 |                # get list of processes
        uniq |
        {
            while read -rs PROC; do      # count watches of processes found
                echo "${PROC},$(grep -c "^inotify" < <(cat /proc/${PROC}/fdinfo/* 2> /dev/null))"
            done
        } |
        grep -v ",0$" |                  # remove entires without watches
        sort -n -t "," -k 2 -r |         # sort to begin with highest numbers
        {                                # group commands so that $TOT is visible in the printf
            while read -rs PID CNT; do   # show watches and corresponding process info
                printf "%$(( WLEN - 2 ))d  %s\n" "$CNT" "$(grep -e "^\ *${PID}\ " <<< "$PSLIST")"
                TOT=$(( TOT + CNT ))
            done
            printf "\n%$(( WLEN - 2 ))d  %s\n" "$TOT" "WATCHES TOTAL COUNT"
        }
}


# get terminal width
declare -i COLS=$(tput cols)
declare -i WLEN=10

printf "\n%${WLEN}s\n" "INOTIFY"
printf "%${WLEN}s\n" "WATCHES"
printf "%${WLEN}s    %s\n" " COUNT " "PID USER     COMMAND"
printf -- "--------------------------------------\n"
generateData

# not fully implemented with command line switch, so just a executable note:
# print the # of instances (not watches)
if [ -n "$PRINT_INSTANCES" ]; then
    FIL=$(mktemp)
    for foo in /proc/\*/fd/*; do readlink -f $foo; done |grep '^/proc/.*inotify' |cut -d/ -f3 | xargs -I '{}' -- ps --no-headers -o '%p %U %a' -p '{}' |uniq -c |sort -n > $FIL
    cat $FIL 
    cat "TOTAL = $(total=0 cat ut | cut -f7 -d' ' | { while read num; do let total+=$num; done; echo $total; })"
fi
