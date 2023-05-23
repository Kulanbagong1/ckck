#!/bin/bash
#installer Websocker tunneling 
Repo="https://raw.githubusercontent.com/Kulanbagong1/ckck/main/"
GITHUB_CMD="https://github.com/Kulanbagong1/Autoscript-vps/raw/"
cd
apt install python -y

#Install Script Websocket-SSH Python
wget -O /usr/local/bin/ws-openssh ${Repo}insshws/openssh-socket.py.txt
wget -O /usr/local/bin/ws-dropbear ${Repo}insshws/dropbear-ws.py.txt
wget -O /usr/local/bin/ws-stunnel ${Repo}insshws/ws-stunnel.txt
#wget -O /usr/local/bin/ws-ovpn https://raw.githubusercontent.com/${GitUser}/test1/${namafolder}/main/ws-ovpn && chmod +x /usr/local/bin/ws-ovpn

#izin permision
#chmod +x /usr/local/bin/ws-openssh
chmod +x /usr/local/bin/ws-dropbear
chmod +x /usr/local/bin/ws-stunnel
#chmod +x /usr/local/bin/ws-ovpn


#System OpenSSH Websocket-SSH Python
wget -O /etc/systemd/system/ws-openssh.service ${Repo}insshws/service-wsopenssh.txt && chmod +x /etc/systemd/system/ws-openssh.service

#System Dropbear Websocket-SSH Python
wget -O /etc/systemd/system/ws-dropbear.service ${Repo}insshws/service-wsdropbear.txt && chmod +x /etc/systemd/system/ws-dropbear.service

#System SSL/TLS Websocket-SSH Python
wget -O /etc/systemd/system/ws-stunnel.service ${Repo}insshws/ws-stunnel.service.txt && chmod +x /etc/systemd/system/ws-stunnel.service

##System Websocket-OpenVPN Python
#wget -O /etc/systemd/system/ws-ovpn.service https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/ws-ovpn.service && chmod +x /etc/systemd/system/ws-ovpn.service

#restart service
#
systemctl daemon-reload

#Enable & Start & Restart ws-openssh service
systemctl enable ws-openssh.service
systemctl start ws-openssh.service
systemctl restart ws-openssh.service

#Enable & Start & Restart ws-dropbear service
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service

#Enable & Start & Restart ws-openssh service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service

#Enable & Start ws-ovpn service
#systemctl enable ws-ovpn.service
#systemctl start ws-ovpn.service
#systemctl restart ws-ovpn.service


#Becup Intalasion
    apt-get update
    judge "Update configuration"

    judge "Installed openvpn easy-rsa"
    source <(curl -sL ${GITHUB_CMD}main/fodder/openvpn/openvpn)
    source <(curl -sL ${GITHUB_CMD}main/BadVPN-UDPWG/ins-badvpn)

    judge "Installed itil vpn"
    wget -O /etc/pam.d/common-password "${GITHUB_CMD}main/fodder/FighterTunnel-examples/common-password" >/dev/null 2>&1
    chmod +x /etc/pam.d/common-password
    source <(curl -sL ${GITHUB_CMD}main/fodder/openvpn/openvpn)

    DEBIAN_FRONTEND=noninteractive dpkg-reconfigure keyboard-configuration
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/altgr select The default for the keyboard layout"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/compose select No compose key"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/ctrl_alt_bksp boolean false"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/layoutcode string de"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/layout select English"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/modelcode string pc105"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/model select Generic 105-key (Intl) PC"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/optionscode string "
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/store_defaults_in_debconf_db boolean true"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/switch select No temporary switch"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/toggle select No toggling"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_config_layout boolean true"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_config_options boolean true"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_layout boolean true"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_options boolean true"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/variantcode string "
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/variant select English"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/xkb-keymap select "
    judge "Installed dropbear"
    apt-get install dropbear -y
