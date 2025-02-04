#!/bin/bash

CONTAINER_ID=$(docker ps -qf "name=backend")
PROFILER="/opt/async-profiler-2.9-linux-x64/profiler.sh"
OUTPUT_FILE="/tmp/profile.html"

# 프로파일링 실행, e: cpu or alloc or lock
docker exec -it $CONTAINER_ID $PROFILER -d 30 -f $OUTPUT_FILE -e cpu,alloc,lock jps

echo "프로파일링 완료. 결과는 $OUTPUT_FILE 에서 확인할 수 있습니다."