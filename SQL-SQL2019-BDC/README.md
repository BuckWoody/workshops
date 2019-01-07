![](graphics/microsoftlogo.png)

# Workshop: Microsoft SQL Server Big Data Clusters Architecture

#### <i>A Microsoft Course from the SQL Server team</i>

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="./graphics/textbubble.png"> <h2>About this Workshop</h2>

Welcome to this Microsoft solutions workshop on *Microsoft SQL Server Big Data Clusters Architecture*. In this workshop, you'll learn how SQL Server big data clusters implements large-scale data processing and machine learning, and how to select and plan for the proper architecture to enable machine learning to train your models using Python, R, Java or SparkML to operationalize these models, and how to deploy your intelligent apps side-by-side with their data.

The focus of this workshop is to understand how to deploy an on-premise, hybrid or local environment of a big data cluster, and understanding the components of the big data solution architecture.

You'll start by understanding the concepts of big data analytics, and you'll get an overview of the technologies (such as containers, Kubernetes, Spark and HDFS, machine learning, and other technologies) that you will use throughout the workshop. Next, you'll understand the architecture of SQL Server Big Data Clusters. You'll learn how to create external tables over other data sources to unify your data, and how to use Spark to run big queries over your data in HDFS or do data preparation. You'll review a complete solution for an end-to-end sceanario, with a focus on how to extrapolate what you have learned to create other solutions for your organization.

This README.MD file explains how the workshop is laid out, what you will learn, and the technologies you will use in this solution.

(You can view all of the [source files for this workshop on this github site, along with other workshops as well. Open this link in a new tab to find out more.](https://github.com/BuckWoody/workshops))

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="./graphics/checkmark.png"> <h3>Learning Objectives</h3>

In this workshop you'll learn:
<br>

- When to use Big Data technology
- The components and technologies of Big Data processing
- Abstractions such as Containers and Container Management as they relate to SQL Server and Big Data
- Planning and architecting an on-premises, in-cloud, or hybrid big data solution with SQL Server
- How to install SQL Server Big Data Clusters on-premises and in the Azure Kubernetes Service (AKS)
- How to work with Apache Spark
- The Data Science Process to create an end-to-end solution
- How to work with the tooling for SQL Server Big Data Clusters (Azure Data Studio)
- Monitoring and managing SQL Server Big Data Clusters
- Security considerations for SQL Server Big Data Clusters

Starting in SQL Server 2019, Big Data Clusters allows for large-scale, near real-time processing of data over the HDFS file system and other data sources. It also leverages the Apache Spark framework which is integrated into one environment for management, monitoring and security of your environment. This means that organizations can implement everything from queries to analysis to Machine Learning and Artificial Intelligence within SQL Server, over large-scale, heterogeneous data. SQL Server Big Data Clusters can be implemented fully on-premises, in the cloud using a Kubernetes service such as Azure's AKS, and in a hybrid fashion. This allows for full, partial, and mixed security and control as desired.

The goal of this workshop is to train the team tasked with architecting and implementing SQL Server Big Data Clusters in the planning, creation, and delivery of a system designed to be used for large-scale data analytics. Since there are multiple technologies and concepts within this solution, the workshop uses multiple types of exercises to prepare the students for this implementation.

The concepts and skills taught in this workshop form the starting points for:

    Data Professionals and DevOps teams that will implement and operate a SQL Server Big Data Cluster system.
    Solution Architects and Developers, to understand how to put together an end to end solution.
    Data Scientists, to understand the environment used to analyze and solve specific predictive problems.

<p style="border-bottom: 1px solid lightgrey;"></p>
<img style="float: left; margin: 0px 15px 15px 0px;" src="./graphics/building1.png"> <h2>Business Applications of this Workshop</h2>

Businesses require near real-time insights from ever-larger sets of data from a variety of sources. Large-scale data ingestion requires scale-out storage and processing in ways that allow fast response times. In addition to simply querying this data, organizations want full analysis and even predictive capabilities over their data. 

Some industry examples of big data processing are in Retail (*Demand Prediction, Market-Basket Analysis*), Finance (*Fraud detection, customer segmentation*), Healthcare (*Fiscal control analytics, Disease Prevention prediction and classification, Clinical Trials optimization*), Public Sector (*Revenue prediction, Education effectiveness analysis*), Manufacturing (*Predictive Maintenance, Anomaly Detection*) and Agriculture (*Food Safety analysis, Crop forecasting*) to name just a few.

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="./graphics/listcheck.png"> <h2>Technologies used in this Workshop</h2>

The solution includes the following technologies - although you are not limited to these, they form the basis of the workshop. At the end of the workshop you will learn how to extrapolate these components into other solutions. You will cover these at an overview level, with references to much deeper training provided.

 <table style="tr:nth-child(even) {background-color: #f2f2f2;}; text-align: left; display: table; border-collapse: collapse; border-spacing: 2px; border-color: gray;">

  <tr><th style="background-color: #1b20a1; color: white;">Technology</th> <th style="background-color: #1b20a1; color: white;">Description</th></tr>

  <tr><td><i>Linux</i></td><td>Operating system used in Containers and Container management (Kubernetes)</td></tr>
  <tr><td><i>git</i></td><td>Source control management system</td></tr>
  <tr><td><i>Containers</i></td><td>Encapsulation level for the SQL Server Big Data Cluster architecture</td></tr>
  <tr><td><i>Kubernetes</i></td><td>Management, control plane and security for Containers</td></tr>
  <tr><td>Microsoft Azure</td><td>Cloud environment for services</td></tr>
  <tr><td>Azure Container Service (AKS)</td><td>Kubernetes as a Service</td></tr>
  <tr><td><i>Apache HDFS</i></td><td>Scale-out storage subsystem</td></tr>
  <tr><td><i>Apache Knox</i></td><td>The Knox Gateway provides a single access point for all REST and HTTP interactions with Apache Hadoop clusters, used for security </td></tr>
  <tr><td><i>Apache Ranger</i></td><td>A centralized security framework for providing authorization and auditing of Hadoop components</td></tr>
  <tr><td><i>Apache Spark</i></td><td>In-memory large-scale, scale-out data processing architecture used by SQL Server </i></td></tr>
  <tr><td><i>Python, R, Java, SparkML</i></td><td><i>ML/AI programming languages used for Machine Learning and AI Model creation</i></td></tr>
  <tr><td>Azure Data Studio</td><td>Tooling for SQL Server, HDFS, Kubernetes cluster management, T-SQL, R, Python, and SparkML languages</td></tr>
  <tr><td>SQL Server Machine Learning Services</td><td>R, Python and Java extensions for SQL Server</td></tr>
  <tr><td>Microsoft Data Science Process (TDSP)</td><td>Project, Development, Control and Management framework</td></tr>
  <tr><td><i>Monitoring and Management</i></td><td>Dashboards, logs, API's and other constructs to manage and monitor the solution<td><i></i></td></tr>
  <tr><td><i>Security</i></td><td>RBAC, Keys, Secrets, VNETs and Compliance for the solution<td><i></i></td></tr>

</table>

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="./graphics/owl.png"> <h2>Before Taking this Workshop</h2>

You'll need a local system that you are able to install software on. The workshop demonstrations use Microsoft Windows as an operating system and all examples use Windows for the workshop. Optionally, you can use a Microsoft Azure Virtual Machine (VM) to install the software on and work with the solution.

You must have a Microsoft Azure account with the ability to create assets, specifically the Azure Container Service (AKS).

This workshop expects that you understand data structures and working with SQL Server and computer networks. This workshop does not expect you to have any prior data science knowledge. For the Data Science content, basic knowledge of statistics and data science is helpful. Knowledge of SQL Server, Azure Data and AI services, Python, and Jupyter Notebooks is recommended. AI techniques are implemented in Python packages. Solution templates are implemented using Azure services, development tools, and SDKs. You should have a basic understanding of working with the Microsoft Azure Platform.

If you are new to these, here are a few references you can complete prior to class:

-  [Microsoft SQL Server](https://docs.microsoft.com/en-us/sql/relational-databases/database-engine-tutorials?view=sql-server-2017)
-  [Microsoft Azure](https://docs.microsoft.com/en-us/learn/paths/azure-fundamentals/)


<img style="float: left; margin: 0px 15px 15px 0px;" src="./graphics/bulletlist.png"> <h3>Setup</h3>

<a href="ML%20Services%20for%20SQL%20Server/00%20Pre-Requisites.md" target="_blank">A full pre-requisites document is located here</a>. These instructions should be completed before the workshop starts, since you will not have time to cover these in class. <i>Remember to turn off any Virtual Machines from the Azure Portal when not taking the class so that you do incur charges (shutting down the machine in the VM itself is not sufficient)</i>.

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="./graphics/education1.png"> <h2>Workshop Details</h2>

This workshop uses Azure Data Studio, Microsoft Azure AKS, and SQL Server (2019 and higher) with a focus on architecture and implementation.

<table style="tr:nth-child(even) {background-color: #f2f2f2;}; text-align: left; display: table; border-collapse: collapse; border-spacing: 5px; border-color: gray;">

  <tr><td style="background-color: Cornsilk; color: black; padding: 5px 5px;">Primary Audience:</td><td style="background-color: Cornsilk; color: black; padding: 5px 5px;">System Architects and Data Professionals tasked with implementing Big Data, Machine Learning and AI solutions</td></tr>
  <tr><td>Secondary Audience:</td><td> Security Architects, Developers, and Data Scientists</td></tr>
  <tr><td style="background-color: Cornsilk; color: black; padding: 5px 5px;">Level: </td><td style="background-color: Cornsilk; color: black; padding: 5px 5px0;"> 300</td></tr>
  <tr><td>Type:</td><td>In-Person</td></tr>
  <tr><td style="background-color: Cornsilk; color: black; padding: 5px 5px;">Length: </td><td style="background-color: Cornsilk; color: black; padding: 5px 5px;">8-9 hours</td></tr>

</table>

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="./graphics/pinmap.png"> <h2>Related Workshops</h2>

 - [Technical guide to the Cortana Intelligence Solution Template for predictive maintenance in aerospace and other businesses](https://docs.microsoft.com/en-us/azure/machine-learning/team-data-science-process/cortana-analytics-technical-guide-predictive-maintenance)

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="./graphics/bookpencil.png"> <h2>Workshop Modules</h2>

This is a modular workshop, and in each section, you'll learn concepts, technologies and processes to help you complete the solution.

<table style="tr:nth-child(even) {background-color: #f2f2f2;}; text-align: left; display: table; border-collapse: collapse; border-spacing: 5px; border-color: gray;">

  <tr><td style="background-color: AliceBlue; color: black;"><b>Module</b></td><td style="background-color: AliceBlue; color: black;"><b>Topics</b></td></tr>

  <tr><td><a href="SQL2019BDC/01%20-%20The%20Big%20Data%20Landscape.md" target="_blank">01 - The Big Data Landscape </a></td><td> Overview of the workshop, problem space, solution options and architectures</td></tr>
  <tr><td style="background-color: AliceBlue; color: black;"><a href="SQL2019BDC/02%20-%20SQL%20Server%20BDC%20Components.md" target="_blank">02 - SQL Server BDC Components</a> </td><td td style="background-color: AliceBlue; color: black;"> Abstraction levels, frameworks, architectures and components within SQL Server Big Data Clusters</td></tr>
  <tr><td><a href="SQL2019BDC/03%20-%20Planning,%20Installation%20and%20Configuration.md" target="_blank">03 - Planning, Installation<br> and Configuration</a> </td><td> Mapping the requirements to the architecture design, constraints, and diagrams</td></tr>
  <tr><td style="background-color: AliceBlue; color: black;"><a href="SQL2019BDC/04%20-%20Operationalization.md" target="_blank">04 - Operationalization</a> </td><td style="background-color: AliceBlue; color: black;"> Connecting applications to the solution; DDL, DML, DCL</td></tr>
  <tr><td><a href="SQL2019BDC/05%20-%20Management%20and%20Monitoring.md" target="_blank">05 - Management and <br> Monitoring</a> </td><td> Tools and processes to manage the Big Data Cluster</td></tr>
  <tr><td style="background-color: AliceBlue; color: black;"><a href="SQL2019BDC/06%20-%20Security.md" target="_blank">06 - Security</a> </td><td style="background-color: AliceBlue; color: black;"> Access and Authentication to the various levels of the solution</td></tr>

</table>

<p style="border-bottom: 1px solid lightgrey;"></p>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="./graphics/geopin.png"><b>Next Steps</b></p>

Next, Continue to <a href="SQL2019BDC/00%20-%20Pre-Requisites.md" target="_blank"><i> Pre-Requisites</i></a>