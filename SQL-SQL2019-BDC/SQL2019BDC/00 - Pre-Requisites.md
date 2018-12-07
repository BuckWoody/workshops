![](../graphics/microsoftlogo.png)

# Workshop: Microsoft SQL Server Big Data Clusters Architecture

#### <i>A Microsoft Course from the SQL Server team</i>

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/textbubble.png"> <h2>00 Pre-Requisites</h2>

The "Microsoft SQL Server Big Data Clusters Architecture" course is taught using the following components, which you will install and configure in the sections that follow. For this course, you will use Microsoft Windows as the base workstation, altough Apple and Linux operating systems can be used in production:

- **Microsoft Azure**: This workshop uses the Microsoft Azure platform to host the Kubernetes cluster (using the Azure Kubernetes Service), and optionally you can deploy a system there to act as a workstation. You can use a free Azure account, an MSDN Account, your own account, or potentially one provided for you, as long as you can create about $80.00 (U.S.) worth of assets.
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

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity 2: Prepare Your Workstation</b></p>

<br>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/checkbox.png">Updates<p>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/checkbox.png">Chocklaty</p>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/checkbox.png">Environment Variables</p>

TODO: Explain install and configuration

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity 3: Install Azure CLI</b></p>

TODO: Explain install and configuration

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity 4: Install Python 3 and pip3</b></p>

TODO: Explain install and configuration

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity 5: Install kubctl</b></p>

TODO: Explain install and configuration

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity 6: Install mssqlctl</b></p>

TODO: Explain install and configuration


<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity 7: Install Azure Data Studio and Extensions</b></p>

TODO: Explain install and configuration



**Note: Power off the Virtual Machine using the Azure Portal every time you are done with it. Turning off the VM using just the Windows power off in the VM only stops it running, but you are still charged for the VM if you do not stop it from the Portal. Stop the VM from the Portal unless you are actively using it.**

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/owl.png"><b>For Further Study</b></p>
<ul>
    <li><a href="https://docs.microsoft.com/en-us/sql/big-data-cluster/quickstart-big-data-cluster-deploy?view=sqlallproducts-allversions" target="_blank">Official Documentation for this section</a></li>
</ul>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/geopin.png"><b >Next Steps</b></p>

Next, Continue to <a href="01%20-%20The%20Big%20Data%20Landscape.md" target="_blank"><i> 01 - The Big Data Landscape</i></a>.
