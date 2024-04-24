#TODO
NAMESPACE='sre'
DEPLOYMENT_NAME='swype-app'
MAX_RESTARTS=5
restarts='kubectl get pods -n ${NAMESPACE} -l app=${DEPLOYMENT_NAME} -o jsonpath="{.items[0].status.containerStatuses[0].restartCount}"'

while true; do 
   echo "Current number of restarts: ${restarts}"
   
   if (( ${restarts} > MAX_RESTARTS)); then
       echo "Max number of restarts exceeded. Scaling down deployment..."
       kubectl scale --replicas=0 deployment/${DEPLOYMENT_NAME} -n ${NAMESPACE}
       break
   fi

   sleep 60
done 
