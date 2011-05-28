# bash completion for adb

_adb()
{
    local cur prev buildfile i

    COMPREPLY=()
    _get_comp_words_by_ref cur prev

    case $prev in
        -install)
            COMPREPLY=( $( compgen -W '-l -r -s' -- "$cur" ) )
            return 0
            ;;
        -s)
            if [[ $cur != "" && `expr length $cur` > 0 ]]; then 
                COMPREPLY=( $( adb devices | grep "device" | sed 1d | awk '{ print $1 }' | grep "^$cur" ) )
            else 
                COMPREPLY=( $( adb devices | grep "device" | sed 1d | awk '{ print $1 }'  ) )
            fi
            return 0
            ;;
    esac

    if [[ "$cur" == '-s *' ]]; then
            COMPREPLY=( $( adb devices | grep "device" | sed 1d | awk '{ print $1 }' | grep "^$cur" ) )
        return 0
    fi

    if [[ "$cur" == -* ]]; then
        COMPREPLY=( $( compgen -W '-d -e -s -p -w' -- "$cur" ) )
        return 0
    else
        COMPREPLY=( $( compgen -W 'wait-for-device start-server kill-server \
            get-state get-serialno status-window remount reboot root usb emu \
            rcpip ppp version help bugreport uninstall install jdwp forward \
            logcat emu shell sync pull push devices connect disconnect' \
            -- "$cur" ) )
        return 0
    fi
}

complete -F _adb adb

# Local variables:
# mode: shell-script
# sh-basic-offset: 4
# sh-indent-comment: t
# indent-tabs-mode: nil
# End:
# ex: ts=4 sw=4 et filetype=sh
