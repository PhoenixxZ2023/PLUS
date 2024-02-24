#!/bin/bash

fun_bar () {
    comando[0]="$1"
    comando[1]="$2"
    (
    [[ -e $HOME/fim ]] && rm $HOME/fim
    ${comando[0]} -y > /dev/null 2>&1
    ${comando[1]} -y > /dev/null 2>&1
    touch $HOME/fim
    ) > /dev/null 2>&1 &
    tput civis
    echo -ne "\033[1;33m["
    while true; do
        for((i=0; i<18; i++)); do
            echo -ne "\033[1;31m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[1;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "\033[1;33m["
    done
    echo -e "\033[1;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}

menu () {
    velocity () {
        aguarde () {
            comando[0]="$1"
            comando[1]="$2"
            (
            [[ -e $HOME/fim ]] && rm $HOME/fim
            ${comando[0]} > /dev/null 2>&1
            ${comando[1]} > /dev/null 2>&1
            touch $HOME/fim
            ) > /dev/null 2>&1 &
            tput civis
            echo -ne "  \033[1;33mAGUARDE \033[1;37m- \033[1;33m["
            while true; do
                for((i=0; i<18; i++)); do
                    echo -ne "\033[1;31m#"
                    sleep 0.1s
                done
                [[ -e $HOME/fim ]] && rm $HOME/fim && break
                echo -e "\033[1;33m]"
                sleep 1s
                tput cuu1
                tput dl1
                echo -ne "  \033[1;33mAGUARDE \033[1;37m- \033[1;33m["
            done
            echo -e "\033[1;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
            tput cnorm
        }
        
        fun_tst () {
            speedtest --share > speed
        }
        
        echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "   \033[1;32mTESTANDO A VELOCIDADE DO SERVIDOR !\033[0m"
        echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        aguarde 'fun_tst'
        echo ""
        awk -F ': ' '/PING/ {ping=$2} /DOWNLOAD/ {down=$2} /UPLOAD/ {up=$2} /LINK/ {link=$2} END {print "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m\n\033[1;32mPING (LATENCIA): \033[1;37m"ping"\n\033[1;32mDOWNLOAD: \033[1;37m"down"\n\033[1;32mUPLOAD: \033[1;37m"up"\n\033[1;32mLINK: \033[1;36m"link"\033[0m\n\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        rm -rf speed
    }

    velocity
}

menu
