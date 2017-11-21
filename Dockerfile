# Build and publish source code in container image "builder "

FROM microsoft/aspnetcore-build:2.0 AS builder
WORKDIR /src

COPY *.sln ./
COPY docker-compose.dcproj ./
COPY SDP-Docker/SDP-Docker.csproj SDP-Docker/

RUN dotnet restore SDP-Docker.sln
COPY . .
WORKDIR /src/SDP-Docker
#RUN dotnet build -c Release -o /app
RUN dotnet publish -c Release -o /app

# Build actual runtime container image
FROM microsoft/aspnetcore:2.0
WORKDIR /app
EXPOSE 80
WORKDIR /app
COPY --from=builder /app .
ENTRYPOINT ["dotnet", "SDP-Docker.dll"]


# docker build -t sdp-img .