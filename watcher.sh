#TODO
NAMESPACE='sre'
DEPLOYMENT_NAME='swype-app'
MAX_RESTARTS=5
restarts='kubectl get pods -n ${NAMESPACE} -l app=${DEPLOYMENT_NAME} -o jsonpath="{.items[0].status.containerStatuses[0].restartCount}"'

while [[ $restarts -le $MAX_RESTARTS ]]; do 
   echo "Current number of restarts: ${restarts}"
   sleep 60
done 
echo "Max number of restarts exceeded. Scaling down deployment..."
kubectl scale --replicas=0 deployment/${DEPLOYMENT_NAME} -n ${NAMESPACE}
