cd "C:\Repos\Sessions\Creating a hybrid and multi-cloud strategy using Azure API Management\Assets\RetrieveRegistration"

docker stop RetrieveRegistrationFunction

docker container rm d77824c4c0a42c05a49c19db3ae256b5ed6bc9f79ef680f065fe635c60021b07

docker build .\ -t retrieveregistration

docker run --name RetrieveRegistrationFunction --net HostedGatewayNetwork --env-file .\MyVirtualMachine.env retrieveregistration