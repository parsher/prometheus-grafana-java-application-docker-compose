# Purpose
Set up a monitoring environment for the Java application using Grafana and Prometheus, with various conditions

# Prerequisite
You need to install Docker

# Environment In Docker
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
./async-profiler.sh -type cpu
```

## Docker Async Profiler in Powershell 
```bash
Set-ExecutionPolicy RemoteSigned
.\async-profiler.ps1 -type cpu
```

### type
CPU 프로파일링 (cpu): 메서드의 CPU 실행 시간을 측정합니다.
월 클록 프로파일링 (wall): 대기 및 슬립 시간을 포함한 총 실행 시간을 측정합니다.
할당 프로파일링 (alloc): 메모리 할당을 분석합니다.
락 프로파일링 (lock): 동기화 문제를 식별합니다.