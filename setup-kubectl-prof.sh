#!/bin/bash

# kubectl-prof 설치
curl -Lo kubectl-prof.tar.gz https://github.com/josepdcs/kubectl-prof/releases/latest/download/kubectl-prof_Linux_x86_64.tar.gz
tar -xzf kubectl-prof.tar.gz
chmod +x kubectl-prof
sudo mv kubectl-prof /usr/local/bin/

# kubectl-prof 사용 예시
echo "kubectl-prof가 설치되었습니다. 다음 명령어로 프로파일링을 시작할 수 있습니다:"
echo "kubectl prof <pod-name> -t 5m -l java -o flamegraph --local-path=/tmp"
