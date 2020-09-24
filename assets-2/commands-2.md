# Commands

## Docker

docker ps -a

docker image ls

docker network create HostedGatewayNetwork

docker inspect -f '{{ range $name, $element := .NetworkSettings.Networks }}{{ $name }} {{ end }}' RetrieveRegistrationFunction

docker exec ad17fdb30e58 apt-get update

docker exec ad17fdb30e58 apt-get install -y curl

## API Management

docker container rm SelfHostedGatewayAws

docker run -d -p 80:8080 -p 443:8081 --name SelfHostedGatewayAws --net HostedGatewayNetwork --env-file env.conf mcr.microsoft.com/azure-api-management/gateway:beta

docker container logs SelfHostedGatewayAws -f

docker exec -it SelfHostedGatewayAws /bin/bash

## Functions

npm install -g azure-functions-core-tools

func start --build

docker build "C:\Repos\Sessions\Creating a hybrid and multi-cloud strategy using Azure API Management\assets\retrieve-registration" -t retrieveregistration

cd "C:\Repos\Sessions\Creating a hybrid and multi-cloud strategy using Azure API Management\assets\retrieve-registration"

docker run --name RetrieveRegistrationFunction --net HostedGatewayNetwork --env-file .\AWS.env retrieveregistration

<http://localhost:8083/api/RetrieveRegistration?name=Eldert>

docker exec -it RetrieveRegistrationFunction /bin/bash

docker exec -it RetrieveRegistrationFunction apt-get update

docker exec -it RetrieveRegistrationFunction apt-get install iputils-ping

docker exec -it RetrieveRegistrationFunction apt-get install telnet

docker exec -it RetrieveRegistrationFunction telnet vm-hybrid-1.westeurope.cloudapp.azure.com 49172

ls /home/site/wwwroot

## SQL

CREATE DATABASE [db-hybrid-multi-cloud-strategy];
GO

USE [db-hybrid-multi-cloud-strategy];
GO

CREATE TABLE Registrations (
    ID int IDENTITY(1,1) PRIMARY KEY,
    AttendeeName nvarchar(255) NOT NULL,
    EventName nvarchar(255) NOT NULL,
    PaymentDone bit NOT NULL
);
GO

INSERT INTO Registrations VALUES (
    'Eldert Grootenboer',
    'Microsoft Ignite The Tour',
    1
)
GO

INSERT INTO Registrations VALUES (
    'Jane Doe',
    'Microsoft Ignite The Tour',
    1
)
GO