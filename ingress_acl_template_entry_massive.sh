for i in `seq 10 1010`; do
curl -ks -H "X-Nuage-Organization: csp" -H "Content-Type: application/json" -H "Authorization: XREST $1" \
https://$2:8443/nuage/api/v4_0/ingressacltemplates/$3/ingressaclentrytemplates?responseChoice=1 -d "{ \
    \"policyState\": \"DRAFT\", \
    \"action\": \"FORWARD\", \
    \"description\": \"any_2_any_drop_$i\", \
    \"sourcePort\": \"*\", \
    \"destinationPort\": \"$i\", \
    \"protocol\": \"6\", \
    \"priority\": \"$i\", \
    \"policyState\": \"DRAFT\", \
    \"reflexive\": \"false\", \
    \"stateful\": \"false\", \
    \"locationType\": \"ANY\", \
    \"networkType\": \"ANY\", \
    \"etherType\": \"0x0800\", \
    \"DSCP\": \"*\" \
}"
done
