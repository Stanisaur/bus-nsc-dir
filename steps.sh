#press enter for all options that come up
nsc init
nsc edit operator --account-jwt-server-url nats://nats:4222 
nsc add account Buses --allow-pub "FG.FGLA.*"
nsc edit account Buses --conns 50000
nsc add account WebClients --allow-sub "FG.FGLA.*"

nsc add export --account "Buses" --subject "FG.FGLA.*" --name "updates" --account-token-position 0
nsc add import --account "WebClients" --src-account "Buses" --name "updates" --remote-subject "FG.FGLA.*"

nsc add user --account Buses --name "genericBus" --allow-pub "FG.FGLA.*"
nsc add user --account WebClients --name "genericClient" --allow-sub "FG.FGLA.*"