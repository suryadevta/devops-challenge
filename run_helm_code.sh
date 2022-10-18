#!/bin/bash

set -e

prepare() {
echo "[INFO]: Logged into the minikube docker environment";

docker build -t acceleration-a  ./acceleration-a
docker build -t acceleration-calc ./acceleration-calc
docker build -t acceleration-dv ./acceleration-dv

echo "[Success]: All images are successfully builded";

runmyapp
}

runmyapp(){
sleep 2;
echo "[INFO]: Enabling Addon Ingress for Minikube";
minikube addons enable ingress
echo "[INFO]: Starting the Acceleration Application using Helm";
helm install test acceleration-helm
sleep 5;
echo "[Success]: Acceleration App Deployed";
printf "\n\n"
echo "[Success]: Browse http://`minikube ip`/calc?vf=200&vi=5&t=123"
printf "\n\n"
}
prepare
