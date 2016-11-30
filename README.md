1.	Dsc script has a fixed schema and you cannot change it : (it must contain configuration) – without it ,it is just a plain script.

configuration ScriptTest {
    node localhost {
       $MyHashtable = @{
           Key1 = 'This was created'
           Key2 = 'on the machine where the MOF was compiled'
       }
       Script test {
           GetScript = {$using:MyHashtable}
           TestScript = {$true}
           SetScript = { }
       }
    }
}

Since you wanted to run ps scripts on your dsc resource : you will need to use the script resource :

          Please read about it here :
Get-DscResource Script -Syntax
 
<#
Script [String] #ResourceName
{
    GetScript = [string]
    SetScript = [string]
    TestScript = [string]
    [Credential = [PSCredential]]
    [DependsOn = [string[]]]
}
#>

2 .here is how to test the dsc resources on localhost :

-	First run the function from powershell
-	Once it ran you will have a MOF file in the same directory – this file has all the needed parameter.
-	To execute on the local host : start-dscconfiguration -wait -path .\diskconfig -verbose -force.
-	Look at the screen for the results.

Once all is ok you can run this on azure :

1.	First publish your dsc file :
Publish-AzureRmVMDscConfiguration -ResourceGroupName sql1 -ConfigurationPath C:\Users\digeler\Desktop\customer\dsc-philip\initializedisks\initdisk.ps1 -ContainerName dsc -StorageAccountName dintestvmsto01 -Force

2.	Than you can use the template https://github.com/digeler/DSC/blob/master/azuredeploy.json
3.	 The zip file is also there : 
4.	 To deploy using powershell run : New-AzureRmResourceGroupDeployment -ResourceGroupName sql1 -Name dsc -TemplateFile "C:\Users\digeler\documents\visual studio 2015\Projects\AzureResourceGroup24\AzureResourceGroup24\Templates\azuredeploy.json" -Verbose
