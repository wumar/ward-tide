# ward-tide
PIA wiregaurd, qbittorrent and k8s

A Dockerfile and Kustomise app that bring together PIAs scripts for connecting via 
wireguard to their VPN, tinyproxy and qbittorrent. Pretty simple stuff.

If you want to run this using docker its best to mount an env file containing all required
variables for PIA connection they are as follows

| Variable     |   Description  |
|-----------------------------------------------|
| PIA_USER     | Username |
| PIA_PASS     | Password |
| PIA_DNS      | Boolean: use PIA DNS |
| PIA_PF       | Boolean: port forwarding  
| AUTOCONNECT  | Boolean: connect automatically |
| VPN_PROTOCOL | wireguard |
| DISABLE_IPV6 | Boolean |

If you want to use this with kubernetes, edit the kustomization file as needed both for the config
map which contains non-sensitive values and include a file called vars.env that contains the user and password
information in the same direction when applying.

## Known Issues: 
Some setups involving Microk8s and wiregaurd will have a broken ip tables 
setup that shuts off internet as soon as connected to wireguard. This is more about your
micork8s and wireguard conflict that it is about this repo.
