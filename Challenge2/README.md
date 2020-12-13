Question
---------
We need to write code that will query the meta data of an instance within AWS and provide a json formatted output. The choice of language and implementation is up to you.

Answer Explanation
-------------------
* Details about an EC2 instance can be queried using AWS CLI. 
* We can use the command "aws ec2 describe-instances" to retrieve EC2 details by using instanceid as a parameter input
* Additional filters can be added to the same command using --filters parameter
* To findout the value corresponding to a single key --query parameter can be used.
* If we need to retrieve EC2 metadata by running commands inside an EC2 instance an API call can be done using Invoke-RestMethod or curl at the URI "http://169.254.169.254/latest/meta-data/"

Please refer the CLI script for more details
