curl -ks -H "X-Nuage-Organization: csp" -H "Content-Type: application/json" -H "Authorization: XREST $1" \
https://$2:8443/nuage/api/v4_0/ingressaclentrytemplates/$3 -X "DELETE"
