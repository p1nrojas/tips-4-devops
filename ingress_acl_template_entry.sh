curl -ks -H "X-Nuage-Organization: csp" -H "Content-Type: application/json" -H "Authorization: XREST $1" \
https://$2:8443/nuage/api/v4_0/ingressacltemplates/$3/ingressaclentrytemplates?responseChoice=1 -d @$4
