#Building a Docker image
sudo docker build . -t afsw/gs-spring-boot:latest
#Pushing the image to a Docker registry
sudo docker push  afsw/gs-spring-boot:latest
# Testing the image 
sudo docker run -it -p 8080:8080 afsw/gs-spring-boot:latest

#Deploying the imagem in the Kubernetes Cluster
kubectl run gs-spring-boot --image=afsw/gs-spring-boot:latest --port 8080 
# Expose the service on a K8s Cluster
kubectl expose deployment gs-spring-boot --type=LoadBalancer --name=gs-spring-boot 

#for Minikube
kubectl expose deployment gs-spring-boot --type=NodePort --name=gs-spring-boot 

minikube service gs-spring-boot

