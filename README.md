# ward-tide
PIA wiregaurd, qbittorrent and k8s

A Dockerfile and Kustomise app that bring together PIAs scripts 
(https://github.com/pia-foss/manual-connections.git)
for connecting via wireguard to their VPN, tinyproxy and qbittorrent. Pretty simple stuff.

If you want to run this using docker its best to mount an env file containing all required
variables for PIA connection they are as follows. Could never get resolvconf to work properly in all setups
so I just ended up manually adding PIA DNS to resolv.conf. All advice welcome.

| Variable     |   Description  |
| ------------ | -------------- |
| PIA_USER     | Username |
| PIA_PASS     | Password |
| PIA_DNS      | Boolean: use PIA DNS |
| PIA_PF       | Boolean: port forwarding  
| AUTOCONNECT  | Boolean: connect automatically |
| VPN_PROTOCOL | wireguard |
| DISABLE_IPV6 | Boolean |

If you want to use this with kubernetes, edit the kustomization file as needed both for the config
map which contains non-sensitive values and include a sealed secret for you pia user name and password.
Therefore it is dependant on sealed secrets from bitnami. https://github.com/bitnami-labs/sealed-secrets.

