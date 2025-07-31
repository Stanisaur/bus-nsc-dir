nsc add account -n SYS
nsc edit operator --system-account SYS
nsc edit operator --account-jwt-server-url nats://localhost:4222
#conns not supported yet nsc add account Buses --allow-pub "FG.FGLA.*" --conns 50000
nsc add account Buses --allow-pub "FG.FGLA.*"
nsc add account WebClients --allow-sub "FG.FGLA.*"

nsc add export --account "Buses" --subject "FG.FGLA.*" --name "updates" --account-token-position 0
nsc add import --account "WebClients" --src-account "Buses" --name "updates" --remote-subject "FG.FGLA.*"

nsc add user --account Buses --name "genericBus" --allow-pub "FG.FGLA.*"
nsc add user --account WebClients --name "genericClient" --allow-sub "FG.FGLA.*"