# Purpose
Set up a monitoring environment for the Java application using Grafana and Prometheus, with various conditions

# ENV
JDK v21
Node v22

# Service
## Swagger
http://localhost:8080/swagger-ui/index.html

## Prometheus
http://localhost:9090/

## Grafana
http://localhost:3000/

## Web
http://localhost/

# Grafana Setup
# Add the Prometheus datasource to the Grafana
Datasource > ADD

URL:
ex)
http://java_prometheus-prometheus-1:9090
or
http://host.docker.internal:9090


# Add JVM Dashboard
https://grafana.com/grafana/dashboards/4701-jvm-micrometer/

Copy the Dashboard ID from the URL
Dashboard > New > Import > Past the ID on the Grafana 


# Command

## Docker Compose Build & Up
```bash
docker-compose up --build
```

## Docker Processors
```bash
docker ps
```
You can get the names of the docker containers

## Docker Async Profiler
```bash
chmod +x async-profiler.sh
./async-profiler.sh
```

## Docker Async Profiler in Powershell 
```bash
Set-ExecutionPolicy RemoteSigned
.\async-profiler.ps1
```
