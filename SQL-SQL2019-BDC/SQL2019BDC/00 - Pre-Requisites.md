![](../graphics/microsoftlogo.png)

# Workshop: Microsoft SQL Server Big Data Clusters Architecture

#### <i>A Microsoft Course from the SQL Server team</i>

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/textbubble.png"> <h2>00 Pre-Requisites</h2>

The "Microsoft SQL Server Big Data Clusters Architecture" course is taught using the following components, which you will install and configure in the sections that follow. For this course, you will use Microsoft Windows as the base workstation, altough Apple and Linux operating systems can be used in production:

- **Microsoft Azure**: This workshop uses the Microsoft Azure platform to host the Kubernetes cluster (using the Azure Kubernetes Service), and optionally you can deploy a system there to act as a workstation. You can use a free Azure account, an MSDN Account, your own account, or potentially one provided for you, as long as you can create about $80.00 (U.S.) worth of assets.
- **SQL Server Big Data Cluster credentials** - As of this writing, you must have an invitation code to install and configure SQL Server Big Data Clusters.
- **Azure Command Line Interface**: The Azure CLI allows you to work from the command line on multiple platforms to interact with your Azure subscription, and also has control statements for AKS.
- **Python (3)**: Python version 3.5 is used by the SQL Server programs to deploy and manage a SQL Server Big Data Cluster.
- **The pip3 Package**: The Python package manager *pip3* is used to install various SQL Server BDC deployment and configuraton tools. 
- **The kubectl program**: The *kubectl* program is the commnad-line control feature for Kubernetes.
- **The mssqlctl program**: The *mssqlctl* program is the deployment and configuration tool for SQL Server Big Data Clusters.
- **Azure Data Studio**: The *Azure Data Studio*, along with various Extensions, is used for both the query and management of SQL Server BDC. In addition, you will use this tool to participate in the workshop.

*Note that all following activities must be completed prior to class - there will not be time to perform these operations during the workshop.*

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity 1: Set up a Microsoft Azure Account</b></p>

You have multiple options for setting up Microsoft Azure account to complete this course. You can use a free account, a Microsoft Developer Network (MSDN) account, a personal or corporate account, or in some cases a pass may be provided by the instructor. (Note: for most classes, the MSDN account is best)

**Unless you are explicitly told you will be provided an account by the instructor in the invitation to this course, you must have your Microsoft Azure account and Data Science Virutal Machine set up before you arrive at class.**

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/checkbox.png"><b>Option 1 - Free Account</b></p>

The free account gives you twelve months of time, and a limited amount of resources. Set this up prior to coming to class, and ensure you can access it from the system you will bring to the class.

- [Open this resource, and click the "Start Free" button you see there](https://azure.microsoft.com/en-us/free/)

**NOTE: You can only use the Free subscription once, and it expires in 12 months. Set up your account and create the DSVM per the instructions below, but ensure that you turn off the VM in the Portal to ensure that you do no exceed the cost limits on this account. You will turn it off and on in the classroom per the instructor's directions.**

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/checkbox.png"><b>Option 2 - Microsoft Developer Network Account (MSDN) Account</b></p>

The best way to take this course is to use your [Microsoft Developer Network (MSDN) benefits if you have a subscription](https://marketplace.visualstudio.com/subscriptions).

- [Open this resource and click the "Activate your monthly Azure credit" button](https://azure.microsoft.com/en-us/pricing/member-offers/credit-for-visual-studio-subscribers/)

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/checkbox.png"><b>Option 3 - Use Your Own Account</b></p>

You can also use your own account or one provided to you by your organization, but you must be able to create a resource group and create, start, and manage a Data Science Virtual Machine (DSVM). More on that product below.

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/checkbox.png"><b>Option 4 - Use an account provided by your instructor</b></p>

Your course invitation may have instructed you that they will provide a Microsoft Azure account for you to use. If so, you will receive instructions that it will be provided.

**Unless you received explicit instructions in your course invitations, you much create either a free, MSDN or Personal account. You must have an account prior to the course.**

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity 2: Request Access Credentials to SQL Server 2019 BDC features</b></p>
<br>
As of this writing, the SQL Server Big Data Cluster feature is enabled for preview customers. You can request access at this site:

https://aka.ms/eapsignup 

When you access that site, put the words **Purpose: Workshop** in the *Please describe the specific application or workload that you will be testing with SQL Server 2019?* box. You will be automatically approved. For the *Platform*, select **Azure Kubernetes Service (AKS)**.

You will use these credentials in a subsequent step. It can take up to a week to receive your code. 


<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity 2: Prepare Your Workstation</b></p>
<br>
The instructions that follow are the same for either a "base metal" workstation or laptop, or a Virtual Machine. It's best to have at least 4MB or RAM on the management system, and these instructions assume that you are not planning to run the database server or any Containers on the workstation. It's also assumed that you are using a current version of Windows, either desktop or server.

You can copy and paste all of the commands that follow in a PowerShell window that you run as Admistrator. 

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/checkbox.png">Updates<p>

First, ensure all of your updates are current. You can use the following commands to do that in an Administrator PowerShell session:

<pre>
$host.UI.RawUI.WindowTitle = "Standard Install for Windows. Classroom or test system only - use at your own risk!"
[console]::BackgroundColor = "Black"
Set-ExecutionPolicy RemoteSigned
pause

[console]::ForegroundColor = "Red"
write-host "Update Windows"
Install-Module PSWindowsUpdate
Import-Module PSWindowsUpdate
Get-WindowsUpdate
Install-WindowsUpdate
pause
</pre>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/checkbox.png">Install Chocolaty Windows package Manager</p>

Next, install the Chocolaty Windows Package manager to aid in command-line installations:

<pre>
[console]::ForegroundColor = "Blue"
write-host "Install Chocolaty" 
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation
pause

</pre>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/checkbox.png">Environment Variables</p>

Your environment variables control how the cluster will be built. 
<p><a href="https://docs.microsoft.com/en-us/sql/big-data-cluster/quickstart-big-data-cluster-deploy?view=sqlallproducts-allversions#define-environment-variables" target="_blank">Refer to this documentation for both the latest statements to run, and for what they need to be set to.</a></p> The variables for name, password and e-mail for the Big Data Cluster is provided to you when you request access to the Early Adopter program. 

(Note that in production, you'll set these environment variables permanently using the Control Panel or by adding them with a Registry command)

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity 3: Install Azure CLI</b></p>

The Azure Command Line Utility is used to set up and control Azure resources. Run the following commands in your elevated PowerShell window:

<pre>
[console]::ForegroundColor = "Green"
write-host "Install Azure CLI"
start "https://aka.ms/installazurecliwindows"
pause 
</pre>

You'll need to click the MSI file once it downloads, take all defaults. 

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity 4: Install Python 3, pip3 and git</b></p>

While `git` has not been mentioned as a requirement for SQL Server, it's used for the course. 

<pre>
[console]::ForegroundColor = "DarkCyan"
write-host "Install Python 3"
choco install python3 
pause


[console]::ForegroundColor = "Red"
write-host "Install git"
choco install git
pause 

</pre>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity 5: Install kubectl</b></p>

The `kubectl` program is used to deploy, configure and manage Kubernetes Clusters. It is used in several parts of the Big Data Clusters program.

[console]::ForegroundColor = "Cyan"
write-host "Install kubectl"
choco install kubernetes-cli 
pause

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity 6: Install mssqlctl</b></p>

the `mssqlctl` program then deploys the SQL Server Big Data Cluster environment onto Kubernetes. 

write-host "Install mssqlctl"
C:\python37\python.exe -m pip install --upgrade pip
C:\Python37\Scripts\pip3 install --extra-index-url https://private-repo.microsoft.com/python/ctp-2.1 mssqlctl 
pause

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity 7: Install Azure Data Studio and Extensions</b></p>

The primary management tool for working with SQL Server Big Data Clusters is Azure Data Studio. You will also use this tool in your course.

[console]::ForegroundColor = "DarkRed"
write-host "Install Azure Data Studio" 
start "https://go.microsoft.com/fwlink/?linkid=2038320"
pause
		
[console]::ForegroundColor = "Red"
write-host "Re-Update Windows"
Get-WindowsUpdate
Install-WindowsUpdate
pause

**Note: If you are using a Virtual Machine in Azure, power off the Virtual Machine using the Azure Portal every time you are done with it. Turning off the VM using just the Windows power off in the VM only stops it running, but you are still charged for the VM if you do not stop it from the Portal. Stop the VM from the Portal unless you are actively using it.**

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/owl.png"><b>For Further Study</b></p>
<ul>
    <li><a href="https://docs.microsoft.com/en-us/sql/big-data-cluster/quickstart-big-data-cluster-deploy?view=sqlallproducts-allversions" target="_blank">Official Documentation for this section</a></li>
</ul>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/geopin.png"><b >Next Steps</b></p>

Next, Continue to <a href="01%20-%20The%20Big%20Data%20Landscape.md" target="_blank"><i> 01 - The Big Data Landscape</i></a>.