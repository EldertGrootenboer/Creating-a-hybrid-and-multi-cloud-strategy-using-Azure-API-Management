cd "C:\Sessions\Creating a hybrid and multi-cloud strategy using Azure API Management\assets"

docker stop SelfHostedGatewayAws

docker container rm 98b25aebfd8c956f1e261e5f50f910af068b5e09ff88fb5e5760f9bd4ab35e99

docker run -d -p 80:8080 -p 443:8081 --name SelfHostedGatewayAws --net HostedGatewayNetwork --env-file env.conf mcr.microsoft.com/azure-api-management/gateway:beta