Question
--------
We have a nested object, we would like a function that you pass in the object and a key and get
back the value. How this is implemented is up to you.

Answer Explanation
-------------------
* The scenario is implemented by using a PowerShell script. 
* Nested Object
	* A PowerShell nested object is assigned to $inputObj. 
	* This Object contains another object "Basicdetails". 
	* "Basicdetails" object contains another object "NetworkInterfaces"
	* "NetworkInterfaces" object contains another object "IPAddresses"
* The keys that need to be searched should be entered in a / separated format. (key1/key2/key3...) 
* Function find-value will accept the object and the key and it will search for the value that matches the key. 
* Various input conditions and their output is as shown

1. key = "Basicdetails/Name"  
   Output:  
   The search is performed for "Basicdetails" key. Within $inputObj "Basicdetails" has another object assigned to it. Hence the function will search inside that nested object for the second key "Name". The Key "Name" has a value "MyEC2" within "Basicdetails". So the output will be displayed as "The Value corresponding to the Key Basicdetails/Name is Myec2"

2. key = "Basicdetails/NetworkInterfaces/Name"  
   Output:  
   The search is performed for "Basicdetails" key. Within $inputObj "Basicdetails" has another object assigned to it. Hence the function will search inside that nested object for the second key "NetworkInterfaces". Within "Basicdetails", "NetworkInterfaces" has another object assigned to it. Hence the function will search inside that nested object for the third key "Name". The Key "Name" has a value "mynic" within "NetworkInterfaces". So the output will be displayed as " The Value corresponding to the Key Basicdetails/NetworkInterfaces/Name is mynic"

3. key = "Basicdetails/NetworkInterfaces/IPAddresses/Privateip"  
   Output:  
   The search is performed for "Basicdetails" key. Within $inputObj "Basicdetails" has another object assigned to it. Hence the function will search inside that nested object for the second key "NetworkInterfaces". Within "Basicdetails", "NetworkInterfaces" has another object assigned to it. Hence the function will search inside that nested object for the third key "IPAddresses". Within "NetworkInterfaces", "IPAddresses" has another object assigned to it. Hence the function will search inside that nested object for the fourth key "Privateip". The Key "Privateip" has a value "10.0.0.44" within "IPAddresses". So the output will be displayed as "The Value corresponding to the Key Basicdetails/NetworkInterfaces/IPAddresses/Privateip is 10.0.0.44"

4. key = "" or $key = $null   
   Output:  
   Here the key is not valid. This would be validated by using [string]::IsNullOrEmpty on the entered key and output will be displayed as "Key cannot be null. Enter a Valid key"

5. inputObj = "" or $inputObj = $null   
   Output:  
   Here the object is not valid. This would be validated by using [string]::IsNullOrEmpty on the entered object and output will be displayed as "Input Object cannot be null. Enter a Valid object"

6. key = "Basicdetails/NetworkInterfacesName"   
   Output:  
   Here part of the key NetworkInterfacesName donot exist in the object. This would result in an output "No Matching keys Found. Enter a Valid key" 
   
   
