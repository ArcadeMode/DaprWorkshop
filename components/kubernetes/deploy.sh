kubectl apply -f cron.yaml
kubectl apply -f email.yaml
kubectl apply -f redis-pubsub.yaml
kubectl apply -f redis-statestore.yaml
kubectl apply -f appconfig.yaml

kubectl create secret generic catalogconnectionstring --from-literal=catalogconnectionstring="Event Catalog Connection String from Kubernetes"
kubectl apply -f kubernetes-secretstore.yaml 

docker tag catalog local/globoticket-dapr-catalog:latest
kubectl replace -f catalog.yaml --force

docker tag ordering local/globoticket-dapr-ordering:latest
kubectl replace -f ordering.yaml --force

docker tag frontend local/globoticket-dapr-frontend:latest
kubectl replace -f frontend.yaml --force

