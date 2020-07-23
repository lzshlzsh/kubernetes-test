#!/bin/bash
# install.sh <template> <cluster-id> <region>
if [ $# != 3 ] ; then
echo "Usage: install.sh <template> <cluster-id> <region>"
echo "Example: install.sh template.yaml cls-xxxxxxxx ap-beijing"
fi
template=$1
clusterId=$2
region=$3
cp $template .$template
sed -i "s/{{.ClusterID}}/$clusterId/g" .$template
sed -i "s/{{.Region}}/$region/g" .$template
kubectl apply -f .$template
#rm .$template

