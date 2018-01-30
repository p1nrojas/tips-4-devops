  484  docker build -t p1nrojas/itau-nuage:v0.1 .
  485  docker run -d --name itau-nuage-ansible-data-only p1nrojas/itau-nuage:v0.1
  486  docker run -d -i -t --volumes-from itau-nuage-ansible-data-only --name itau-nuage-ansible p1nrojas/itau-nuage:v0.1
