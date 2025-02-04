#!/bin/bash

if [ $# -eq 0 ]; then
    echo "예: $0 cpu,alloc,lock,wall"
    exit 1
fi

TYPE=$1

VALID_TYPES=("cpu" "alloc" "lock" "wall")
if [[ ! " ${VALID_TYPES[@]} " =~ " ${TYPE} " ]]; then
    echo "유효하지 않은 타입입니다. 가능한 타입: cpu, alloc, lock, wall"
    exit 1
fi

CONTAINER_ID=$(docker ps -qf "name=backend")
if [ -z "$CONTAINER_ID" ]; then
    echo "백엔드 컨테이너를 찾을 수 없습니다."
    exit 1
fi

PROFILER="/opt/async-profiler-2.9-linux-x64/profiler.sh"
OUTPUT_FILE="/tmp/profile-$TYPE.html"

docker exec -it $CONTAINER_ID $PROFILER -d 30 -f $OUTPUT_FILE -e $TYPE jps

echo "프로파일링 완료. 결과는 $OUTPUT_FILE 에서 확인할 수 있습니다."
