#!/bin/bash
echo -e "
"
date
echo ""
domain=$(cat /root/domain)
domain=$(cat /etc/xray/domain)
domain=$(cat /etc/v2ray/domain)
sleep 1

UDPCORE="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"

wget --load-cookies /tmp/cookies.txt ${UDPCORE} -O install-udp && rm -rf /tmp/cookies.txt && chmod +x install-udp && ./install-udp

echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}               • AKUN UDP•              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "      Port UDP         : 54-65535"
echo -e "      Account UDP      "
echo -e "      $domain:54-65535@$LOGIN:$PASSWD"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
