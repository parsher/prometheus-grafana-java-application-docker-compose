# 컨테이너 ID 찾기
$containerId = docker ps -qf "name=backend"

# 프로파일링 실행, e: cpu or alloc or lock
docker exec -it $containerId /opt/async-profiler-2.9-linux-x64/profiler.sh -d 30 -f /tmp/profile.html -e cpu jps

Write-Host "프로파일링 완료. 결과는 컨테이너 내부의 /tmp/profile.html 에서 확인할 수 있습니다."

# 결과 파일을 호스트로 복사 (선택사항)
docker cp ${containerId}:/tmp/profile.html ./profile.html
Write-Host "프로파일 결과가 현재 디렉토리의 profile.html로 복사되었습니다."
