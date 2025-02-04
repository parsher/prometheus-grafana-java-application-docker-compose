# ENV
JDK v21
Node v22

# Build & up
```bash
docker-compose up --build
```

# Docker Processors
```bash
docker ps
```
You can get the names of the docker containers

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

# Docker Async Profiler
```bash
chmod +x async-profiler.sh
./async-profiler.sh
```

# Docker Async Profiler in Powershell 
```bash
Set-ExecutionPolicy RemoteSigned
.\async-profiler.ps1
```

# Java application profiling with kubectl-prof

```bash
kubectl prof <pod-name> -t 5m -l java -o flamegraph --local-path=/tmp
```