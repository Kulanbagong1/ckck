#!/bin/bash
# =========================================
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"

trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let tra=$trx/2
ssx=$(grep -c -E "^## " "/etc/xray/config.json")
let ssa=$ssx/2
Repo="https://raw.githubusercontent.com/Kulanbagong1/ckck/main/"
#Repo1="https://raw.githubusercontent.com/Kulanbagong1/izinn/main/"
COLOR1='\033[0;35m'
COLOR2='\033[0;39m'

#Polder
UDPCORE="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
clear
# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Exporting URL Host
export Server_URL="autosc.me/aio"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="JENGKOLONLINE-VPN"

# // Root Checking
if [ "${EUID}" -ne 0 ]; then
                echo -e "${EROR} Please Run This Script As Root User !"
                exit 1
fi
tomem="$(free | awk '{print $2}' | head -2 | tail -n 1 )"
usmem="$(free | awk '{print $3}' | head -2 | tail -n 1 )"
cpu1="$(mpstat | awk '{print $4}' | head -4 |tail -n 1)"
cpu2="$(mpstat | awk '{print $6}' | head -4 |tail -n 1)"

persenmemori="$(echo "scale=2; $usmem*100/$tomem" | bc)"
#persencpu=
persencpu="$(echo "scale=2; $cpu1+$cpu2" | bc)"
# // Exporting IP Address
export MYIP=$( curl -s https://ipinfo.io/ip/ )
#Name=$(curl -sS ${Repo1}ip | grep $MYIP | awk '{print $2}')
#Exp=$(curl -sS ${Repo1}ip | grep $MYIP | awk '{print $3}')

# // nginx
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}ON${NC}"
else
    status_nginx="${RED}OFF${NC}"
fi

# // SSH Websocket Proxy
xray=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray == "running" ]]; then
    status_xray="${GREEN}ON${NC}"
else
    status_xray="${RED}OFF${NC}"
fi
ttoday="$(vnstat | grep today | awk '{print $8" "substr ($9, 1, 3)}' | head -1)"
tmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $8" "substr ($9, 1 ,3)}' | head -1)"

clear
echo -e "$COLOR1┌────────────────────────────────────────────────────────────┐${NC}"
echo -e "                     << INFORMASI VPS >>                    \E[0m"
echo -e "$COLOR1────────────────────────────────────────────────────────────${NC}"
echo -e "• Current Time        = $( date -d "0 days" +"%d-%m-%Y | %X" )"
echo -e "• ISP                 = $(cat /root/.isp)${NC}"
echo -e "• Server Resource     = RAM = $persenmemori% | CPU = $persencpu%"
echo -e "• Status Hari ini     = SELALU BERSUKUR ATAS APA YG DIBERIKAN TUHAN HARI INI"
echo -e "$COLOR1└────────────────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────────────────────────────────────────────┐${NC}"
echo -e " ${COLOR2}[ SSH WebSocket${NC}: ${GREEN}ON ${NC}]  [ NGINX${NC}: ${status_nginx} ] ${COLOR2}[ Today  : $ttoday ]"
echo -e " [ XRAY${NC}         : ${status_xray} ]                ${COLOR2}[ Monthly: $tmon ]"
echo -e "$COLOR1────────────────────────────────────────────────────────────${NC}"
echo -e "$COLOR1   \033[0m ${BOLD}${YELLOW}SSH     VMESS       VLESS      TROJAN       SHADOWSOCKS$NC  $COLOR1"
echo -e "$COLOR1   \033[0m ${Blue} $ssh1        $vma           $vla          $tra               $ssa   $NC    $COLOR1"
echo -e "$COLOR1└────────────────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -e "$COLOR1┌────────────────────────────────────────────────────────────┐${NC}"
echo -e "      $COLOR1│${NC}            •  JENGKOLONLINE VPN MENU •          $COLOR1│$NC"
echo -e "$COLOR1────────────────────────────────────────────────────────────${NC}"
echo -e " ${CYAN}[01]${NC} • [SSH MENU${NC}]     ${CYAN}[04]${NC} • [TROJAN${NC}]"
echo -e " ${CYAN}[02]${NC} • [VMESS${NC}]        ${CYAN}[05]${NC} • [SSWS ${NC}]"
echo -e " ${CYAN}[03]${NC} • [VLESS${NC}]        ${CYAN}[06]${NC} • [Trojan Go ${NC}]"
echo -e " ${CYAN}[07]${NC} • [INSTALL UDP{NC}] ${CYAN}[70]${NC} • [DNS AKUN{NC}]"
echo -e "$COLOR1────────────────────────────────────────────────────────────${NC}"
echo -e " ${CYAN}[08]${NC} • [ADD-HOST${NC}]          ${CYAN}[15]${NC} • [RESTART SERVICE${NC}]     "
echo -e " ${CYAN}[09]${NC} • [GEN-CERT${NC}]          ${CYAN}[16]${NC} • [AUTO-POINTING${NC}] "
echo -e " ${CYAN}[10]${NC} • [INSTALL ADS-BLOCK${NC}] ${CYAN}[17]${NC} • [RUNNING${NC}]"
echo -e " ${CYAN}[11]${NC} • [ADS-BLOCK MENU${NC}]    ${CYAN}[18]${NC} • [SPEEDTEST${NC}]"
echo -e " ${CYAN}[12]${NC} • [CEK-TRAFIK${NC}]        ${CYAN}[19]${NC} • [INFO${NC}]"
echo -e " ${CYAN}[13]${NC} • [CEK BANDWIDTH${NC}]     ${CYAN}[20]${NC} • [CLEARLOG${NC}]"
echo -e " ${CYAN}[14]${NC} • [UPDATE-SCRIPT${NC}]     ${CYAN}[21]${NC} • [REBOOT${NC}]"
echo -e "$COLOR1└────────────────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────────────────────────────────────────────┐${NC}"
echo -e "• Current Domain      = $( cat /etc/xray/domain )"
echo -e "• Server IP           = $MYIP"
echo -e "• Clients Name        = JKLOVPN"
echo -e "• Expired Script VPS  = LIFETIME"
echo -e "$COLOR1└────────────────────────────────────────────────────────────┘${NC}"
echo -e " [X]${NC} • [PRESS X TO EXIT]"
echo -e ""
echo -ne " Select menu : "; read opt
case $opt in
1) clear ; menussh ;;
2) clear ; menuv ;;
3) clear ; menul ;;
4) clear ; menut ;;
5) clear ; menus ;;
6) clear ; menugo ;;
7) clear ; wget --load-cookies /tmp/cookies.txt ${UDPCORE} -O install-udp && rm -rf /tmp/cookies.txt && chmod +x install-udp && ./install-udp ;;
8) clear ; add-host ;;
9) clear ; genssl ;;
10) clear ; rm -rf /usr/local/sbin/helium && wget -q -O /usr/local/sbin/helium https://raw.githubusercontent.com/abidarwish/helium/main/helium.sh && chmod +x /usr/local/sbin/helium && helium ;;
11) clear ; helium ;;
12) clear ; cek-trafik ;;
13) clear ; cek-bandwidth ;;
14) clear ; updatsc ;;
15) clear ; restartsc ;;
16) clear ; domaingratis ;;
17) clear ; running ;;
18) clear ; cek-speed ;;
19) clear ; cat /root/log-install.txt ;;
20) clear ; clearlog ;;
21) clear ; reboot ;;
0) clear ; menu ;;
x) exit ;;
*) clear ; menu ;;
esac
