cd "C:\Repos\Sessions\Creating a hybrid and multi-cloud strategy using Azure API Management\assets"

docker stop SelfHostedGatewayLocal

docker container rm 8addec9b8bc0440b8fab4dc8676d87014eed0a4d39720f63bfac1b4a35bba136

docker run -d -p 80:8080 -p 443:8081 --name SelfHostedGatewayLocal --net HostedGatewayNetwork --env-file env.conf mcr.microsoft.com/azure-api-management/gateway:beta