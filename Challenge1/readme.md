
Architecture Explanation

The architecture consist of a Virtual Network with four subnets: Gateway Subnet, Websubnet, Appsubnet and DBsubnet
Gateway subnet is used to deploy an azure application gateway, which act as an application loadbalancer with a public front end. The web virtual machines are configured as the backend pool for application gateway.
Websubnet is used to deploy web virtual machines, in an availability set. This ensures redundancy and availability of web virtual machines.
Appsubnet is used to deploy app virtual machines, in an availability set. This ensures redundancy and availability of app virtual machines. An azure load balancer is configured as an internal loadbalancer to distribute traffic to both these VMs.
DBsubnet is used to deploy db virtual machines, in an availability set. This ensures redundancy and availability of db virtual machines. An azure load balancer is configured as an internal loadbalancer to distribute traffic to both these VMs.
NSGs are attached to each of the above subnets to control traffic flow.

Implementation steps

The above setup is implemented by using Azure ARM templates. 

Step 1. The first template deploynetworkresources.json is deployed first to create vnet, subnets and nsgs. 
Step 2. The second template deployvirtualmachines.json is deployed to create virtual machines and availabilitysets in web, app and db tiers. An existing keyvault reference can be added in the parameter file, to avoid hardcoding vm passwords within the templates.
Step3. The third template deployloadbalancers.json is deployed to create application gateway and loadbalancers.



