Cls
if ((Get-ExecutionPolicy) -ne "RemoteSigned")
{
	Set-ExecutionPolicy RemoteSigned -Scope Process -Force
}

Get-ExecutionPolicy -List

Initialize-AWSDefaults
if (!(Import-Module AWSPowerShell)){ Import-Module AWSPowershell}

get-module
echo $profile

Set-AWSCredentials -AccessKey _add_the_access_key_code -SecretKey /_add_secretkey_ -StoreAs xxxxxx_id.dkr.ecr.us-east-1.amazonaws.com/ubuntu1804netcore_sample

Get-AWSCredentials -ListProfileDetail

Initialize-AWSDefaults -ProfileName xxxxxx_id.dkr.ecr.us-east-1.amazonaws.com/ubuntu1804netcore_sample -Region us-east-1



#---- Proceso de copia de una imagen a ECR ---------------------------------------

Invoke-Expression -Command (Get-ECRLoginCommand -Region us-east-1).Command

docker tag ubuntucore:18.04 xxxxxx_id.dkr.ecr.us-east-1.amazonaws.com/ubuntu1804netcore_sample:latest
docker push xxxxxx_id.dkr.ecr.us-east-1.amazonaws.com/ubuntu1804netcore_sample:latest




