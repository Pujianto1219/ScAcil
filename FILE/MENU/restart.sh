#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/Pujianto1219/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m" 
COLOR1="$(cat /etc/Pujianto1219/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/Pujianto1219/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"  
WH='\033[1;37m'                  
###########- DENDI KUSNANDI -##########
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• SERVER STATUS •               ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}"
systemctl daemon-reload
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Starting ...                        $COLOR1 ${NC}"
sleep 1
systemctl restart ssh
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Restarting SSH Services             $COLOR1 ${NC}"
sleep 1
systemctl restart squid
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Restarting Squid Services           $COLOR1 ${NC}"
sleep 1
systemctl restart openvpn
systemctl restart --now openvpn-server@server-tcp-1194
systemctl restart --now openvpn-server@server-udp-2200
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Restarting OpenVPN Services         $COLOR1 ${NC}"
sleep 1
systemctl restart nginx
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Restarting Nginx Services           $COLOR1 ${NC}"
sleep 1
systemctl restart dropbear
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Restarting Dropbear Services        $COLOR1 ${NC}"
sleep 1
systemctl restart ws-dropbear
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Restarting Ws-Dropbear Services     $COLOR1 ${NC}"
sleep 1
systemctl restart ws-stunnel
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Restarting Ws-Stunnel Services      $COLOR1 ${NC}"
sleep 1
systemctl restart stunnel4
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Restarting Stunnel4 Services        $COLOR1 ${NC}"
sleep 1
systemctl restart xray
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Restarting Xray Services            $COLOR1 ${NC}"
sleep 1
systemctl restart cron
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Restarting Cron Services            $COLOR1 ${NC}"
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}All Services Restates Successfully  $COLOR1 ${NC}"
sleep 1
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• DENDI KUSNANDI •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
menu
esac
