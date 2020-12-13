

#Input object
$inputObj = [PSCustomObject]@{
  Basicdetails = [PSCustomObject]@{
    Name = "Myec2"
    InstanceType = "t2.micro"
        NetworkInterfaces = [PSCustomObject]@{
          Name = "mynic"
          Id = "nic-01c56dec112b56f7c"
            IPAddresses = [PSCustomObject]@{
            privateip = "10.0.0.44"
            publicip = "3.112.197.65"
            }
       }
   }
}

#example input key
$key = "Basicdetails/NetworkInterfaces/IPAddresses/Privateip"


function find-value ($outObj,$key) {
    #add key pattern check
    $temp_key = $null
    $countmax = ($key.split('/').count)-1
    foreach($_ in 0..$countmax){
    $temp_key  = $key.Split("/")[$_]
    $outObj = $outObj.$temp_key
    if ($outObj -eq $null){
    #valuecheck
    Write-Output "No Matching keys Found. Enter a Valid key" 
    break;
    }
    if($_ -eq $countmax){write-output "The Value corresponding to the Key $key is $outObj" }
    }
	}
    #null check
    if(([string]::IsNullOrEmpty($key))) { Write-Output "Key cannot be null. Enter a Valid key"}
    elseif (([string]::IsNullOrEmpty($inputObj))){write-output "Input Object cannot be null. Enter a Valid object"}
    elseif($key -notlike ("*/*")){write-output "Key Not matching required pattern. Enter a valid key"}
    else {
    find-value -outObj $inputObj -key $key
    }




