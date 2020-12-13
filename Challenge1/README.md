Question
---------
A 3-tier environment is a common setup. Use a tool of your choosing/familiarity create these resources.

Architecture Explanation
-------------------------
* The architecture consist of a Virtual Network with four subnets: Gateway Subnet, Websubnet, Appsubnet and DBsubnet.
* Gateway subnet is used to deploy Azure Application Gateway, which act as an application loadbalancer with a public front end. The web Virtual Machines are configured as the backend pool for application gateway.
* Websubnet is used to deploy web Virtual Machines in an availability set. This ensures redundancy and availability of web Virtual Machines.
* Appsubnet is used to deploy app Virtual Machines in an availability set. This ensures redundancy and availability of app Virtual Machines. An Azure Load Balancer is configured as an internal loadbalancer to distribute traffic to both these VMs.
* DBsubnet is used to deploy db Virtual Machines in an availability set. This ensures redundancy and availability of db virtual machines. An Azure Load Balancer is configured as an internal loadbalancer to distribute traffic to both these VMs.
* NSGs are attached to each of the above subnets to control traffic flow.

Implementation steps
---------------------
The above setup is implemented by using Azure ARM templates. 

* Step 1: The first template deploynetworkresources.json and its parameterfile is deployed to create Vnet, Subnets and NSGs. 
* Step 2: The second template deployvirtualmachines.json and its parameterfile is deployed to create Virtual machines and Availability Sets in web, app and db tiers. An existing KeyVault reference can be added in the parameter file, to avoid hardcoding VM passwords within the template file.
* Step 3: The third template deployloadbalancers.json and its parameterfile is deployed to create Application Gateway and LoadBalancers.



