## try first authentication 

Create file with the follwoing content
```
{
    "auth": {
        "identity": {
            "methods": [
                "password"
            ],
            "password": {
                "user": {
                    "domain": {
                        "name": "Default"
                    },
                    "name": "nova",
                    "password": "6ad1c4f2d6404c4c"
                }
            }
        },
        "scope": {
            "project": {
                "domain": {
                    "name": "Default"
                },
                "name": "services"
            }
        }
    }
}
```

and the execute:

```
curl -si -d @token-request.json -H "Content-type: application/json" http://147.75.73.249:5000/v2/auth/tokens | awk '/X-Subject-Token/ {print $2}'
```

If you get the token, the auth was succesfull

##Change the paremeters in your nuage-metada-agent

like the following:
```
METADATA_PORT=9697
NOVA_METADATA_IP=147.75.73.249
NOVA_METADATA_PORT=8775
METADATA_PROXY_SHARED_SECRET="NuageNetworksSharedSecret"
NOVA_CLIENT_VERSION=2
NOVA_OS_USERNAME=nova
NOVA_OS_PASSWORD=6ad1c4f2d6404c4c
NOVA_OS_TENANT_NAME=services
NOVA_OS_AUTH_URL=http://147.75.73.249:5000/v3
#NOVA_OS_AUTH_URL=http://147.75.73.249:35357/v3
NUAGE_METADATA_AGENT_START_WITH_OVS=true
NOVA_API_ENDPOINT_TYPE=publicURL
NOVA_REGION_NAME=RegionOne
ARP_REPLY=yes
NOVA_PROJECT_NAME=services
NOVA_USER_DOMAIN_NAME=default
NOVA_PROJECT_DOMAIN_NAME=default
IDENTITY_URL_VERSION=3
NOVA_OS_KEYSTONE_USERNAME=nova
```

Restart openvswitch and try the follwing from a VM into the compute that was configured

```
curl http://169.254.169.254/latest/meta-data
```
