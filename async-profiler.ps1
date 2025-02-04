param (
    [Parameter(Mandatory=$true)]
    [string]$type
)

$validTypes = @("cpu", "alloc", "lock", "wall")
if ($validTypes -notcontains $type) {
    Write-Host "유효하지 않은 타입입니다. 가능한 타입: cpu, alloc, lock, wall"
    exit 1
}

$containerId = docker ps -qf "name=backend"
if (-not $containerId) {
    Write-Host "백엔드 컨테이너를 찾을 수 없습니다."
    exit 1
}

docker exec -it $containerId /opt/async-profiler-2.9-linux-x64/profiler.sh -d 30 -f /tmp/profile.html -e $type jps

Write-Host "프로파일링 완료. 결과는 컨테이너 내부의 /tmp/profile.html 에서 확인할 수 있습니다."

docker cp ${containerId}:/tmp/profile.html ./profile-${type}.html
Write-Host "프로파일 결과가 현재 디렉토리의 profile.html로 복사되었습니다."
