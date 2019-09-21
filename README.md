kubectl run gs-spring-boot --image=afsw/gs-spring-boot:latest --port 8080 

kubectl expose deployment gs-spring-boot --type=LoadBalancer --name=gs-spring-boot 

#for Minikube
kubectl expose deployment gs-spring-boot --type=NodePort --name=gs-spring-boot 

minikube service gs-spring-boot

