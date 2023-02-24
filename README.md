# Objective 

![MicrosoftTeams-image (14)](https://user-images.githubusercontent.com/118529639/221258670-118ff3df-94f0-4cc2-a2d1-9149144af381.png)


## Steps:
1- Build the infrastructure on GCP
```
git clone https://github.com/Radwa-Hesham22/GCP-Project.git
terraform init 
terraform plan
terraform apply 
```
- Vpc created

![1](https://user-images.githubusercontent.com/118529639/220355607-09c28247-61e0-4f2e-926e-0dc7c3cb75bc.PNG)

-  2 Subnets created (managed and restricted )

![2](https://user-images.githubusercontent.com/118529639/220356132-ae6f6e8f-67da-43e0-a636-1e22c78e8ad5.PNG)

- Private vm created in managed subnet 

![5](https://user-images.githubusercontent.com/118529639/220356517-dd9863cf-6a09-425f-86ab-074785cb9550.PNG)

- Firewall rule that allows ssh to private vm

![3](https://user-images.githubusercontent.com/118529639/220356629-bb0f27cc-ec23-4cb9-a88a-a1d9de96a83f.PNG)

- Nat gateway 

- ![image](https://user-images.githubusercontent.com/118529639/221254356-1047a4c8-1d16-4281-959f-a5576ec2aa24.png)


- Service account created

![9](https://user-images.githubusercontent.com/118529639/220357175-cf5471e0-9959-458e-a826-7332eff6763e.PNG)

- GKE cluster created in restricted subnet

![6](https://user-images.githubusercontent.com/118529639/220357523-26333147-4731-47c5-958a-f8cf7bf0fd77.PNG)

![7](https://user-images.githubusercontent.com/118529639/220358184-80f3845d-4fb9-4da1-af71-02aea6d7f462.PNG)


2- ssh to the private vm 
```
gcloud compute ssh --zone "asia-east1-b" "private-vm"  --tunnel-through-iap --project "quick-asset-377911"
```
3- Credentials to control plane
```
gcloud container clusters get-credentials primary --zone asia-east1-b --project quick-asset-377911
kubectl create namespace devops-tools
```
4- Apply yaml files
```
vim servuceAccount.yaml
kubectl apply -f serviceAccount.yaml -n devops-tools
vim volume.yaml
kubectl apply -f volume.yaml -n devops-tools
vim deployment.yaml 
kubectl apply -f deployment.yaml -n devops-tools
vim slave-deployment.yml
kubectl apply -f slave-deployment.yml -n devops-tools
vim slave-svc.yml 
kubectl apply -f slave-svc.yml -n devops-tools
kubectl get svc -n devops-tools
```
5- Check it on your browser

External ip:8080

