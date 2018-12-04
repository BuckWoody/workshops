![](graphics/microsoftlogo.png)

# Workshop: Microsoft SQL Server Big Data Clusters Architecture

#### <i>A Microsoft Course from the SQL Server team</i>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px; height: 20;" src="./graphics/thinking.jpg">About this Course</h2>

Welcome to this Microsoft Solutions course on *Microsoft SQL Server Big Data Clusters Architecture*. In this course, you'll learn how SQL Server big data clusters implements machine learning, and how to select and plan for the proper architecture to enable machine learning to train your models using Python, R, Java or SparkML to operationalize these models, and how to deploy your intelligent apps side-by-side with their data.

The focus of this course is to understand how to deploy an on-premise, hybrid or local environments of a big data cluster, and understanding the components of the big data solution architecture.

You'll start by understanding the concepts of big data analytics and data virtualization in SQL Server, and you'll get an overview of the technologies (such as containers, Kubernetes, Spark and HDFS, machine learning, and when to use which language) that you will use throughout the course. You'll also learn how to create external tables over other data sources to unify your data, and how to use Spark to run big queries over your data in HDFS or do data prep. You'll learn to extrapolate what you have learned to create other solutions on your own.

This README.MD file explains how the course is laid out, what you will learn, and the technologies you will use in this solution.

(You can view all of the [source files for this course on this github site, along with other courses as well. Open this link in a new tab to find out more.](https://github.com/BuckWoody/presentations))

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px; height: 35;" src="./graphics/brain.png">Learning Objectives</h2>

In this course you'll learn:

<br>

- When to use Big Data technology
- The components and landscape of Big Data technologies
- Abstractions such as Containers and Container Management as they relate to SQL Server
- Planning and architecting an on-premises, in-cloud, or hybrid solution with SQL Server
- How to install SQL Server Big Data Clusters on-premises and in the Azure Kubernetes Service (AKS)
- How to work with Apache Spark
- The Data Science Process to create an end-to-end solution
- When and how to use R, Python, T-SQL and SparkML to create a Machine Learning Model
- How to work with the tooling for SQL Server Big Data Clusters (Azure Data Studio)
- Monitoring and managing SQL Server Big Data Clusters
- Security considerations for SQL Server Big Data Clusters

<p style="border-bottom: 1px solid lightgrey;"></p>

<h3>Data Science and Business Applications of this course</h3>

Businesses require near real-time insights from ever-larger sets of data. In particular, logs and device telemetry ingestion requires storage and processing of large amounts of data each day. In addition to simply querying this data, organizations want full analysis and even predictive capabilities over their data.

While large-scale data processing exists, it's often batch-based, which has a lag in the time from query to response. Also, batch systems such as Hadoop are complicated to set up and manage. Operational data is often stored in SQL Server databases, and joining that data to larger-scale systems exposes security weaknesses and brittle architectures.

Starting in SQL Server 2019, the Big Data Clusters feature allows for large-scale, near real-time processing of data over the HDFS file system and also using Apache Spark, integrated into one platform for management, monitoring and security. This means that organizations can implement everything from queries to analysis to Machine Learning and Artificial Intelligence within SQL Server. SQL Server Big Data Clusters can be implemented fully on-premises, in the cloud using a Kubernetes service such as Azure's AKS, and in a hybrid fashion. This allows for full, partial, and mixed security as required.

The goal of this course is to train the team tasked with architecting and implementing SQL Server Big Data Clusters in the planning, creation, and delivery of a system designed to be used for large-scale data analytics. Since there are multiple technologies and concepts within this solution, the workshop uses multiple types of exercises to prepare the students for this implementation.

The concepts and skills taught in this workshop form the starting points for:

    Data Professionals that will implement and operate a SQL Server Big Data Cluster system.
    Solution Architects and Developers, to put together an end to end solution.
    Data Scientists, to understand the environment used to analyze and solve specific predictive problems.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h3>Solution Diagram</h3>

This solution uses an example of <TODO> , but it has many applications.

In this diagram, the solution is <TODO>.

<img style="height: 600; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" src="./graphics/solutiondiagram.png">

<p style="border-bottom: 1px solid lightgrey;"></p>

<h3>Sample Solution Output</h3>

 As an example, <TODO>:

<img style="height: 300; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" src="./graphics/solutiondiagram.png">


<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px; height: 20;" src="./graphics/keyboard.jpg">Technologies</h2>

This solution includes the following technologies - although you are not limited to these, they form the basis of the course. At the end of the course you will learn how to extrapolate these components into other solutions. You will cover these at an overview level, with references to much deeper training provided.

 <table style="tr:nth-child(even) {background-color: #f2f2f2;}; text-align: left; display: table; border-collapse: collapse; border-spacing: 2px; border-color: gray;">

  <tr><th style="background-color: #1b20a1; color: white;">Technology</th> <th>Description</th></tr>
  <tr><td>Linux</td><td>Operating system used in Containers and Container management (Kubernetes)</td></tr>
  <tr><td><i>git</i></td><td>Source control management system</td></tr>
  <tr><td><i>Containers</i></td><td>Encapsulation level for the SQL Server Big Data Cluster architecture</td></tr>
  <tr><td><i>Kubernetes</i></td><td>Management, control plane and security for Containers</td></tr>
  <tr><td>Microsoft Azure</td><td>Cloud environment for services</td></tr>
  <tr><td>Azure Container Service (AKS)</td><td>Kubernetes as a Service</td></tr>
  <tr><td><i>Apache HDFS</i></td><td>Scale-out storage subsystem</td></tr>
  <tr><td><i>Apache Spark</i></td><td>In-memory large-scale, scale-out data processing architecture used by SQL Server </i></td></tr>
  <tr><td><i>Python, R, Java, SparkML</i></td><td><i>ML/AI programming languages used for Machine Learning and AI Model creation</i></td></tr>
  <tr><td>Azure Data Studio</td><td>Tooling for SQL Server, HDFS, Kubernetes cluster management, T-SQL, R, Python, and SparkML languages</td></tr>
  <tr><td>SQL Server Machine Learning Services</td><td>R, Python and Java extensions for SQL Server</td></tr>
  <tr><td>Microsoft Data Science Process (TDSP)</td><td>Project, Development, Control and Management framework</td></tr>
  <tr><td><i>Monitoring and Management</i></td><td>Dashboards, logs, API's and other constructs to manage and monitor the solution<td><i></i></td></tr>
  <tr><td><i>Security</i></td><td>RBAC, Keys, Secrets, VNETs and Compliance for the solution<td><i></i></td></tr>

</table>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px; height: 20;" src="./graphics/aml-logo.png">Industries</h2>

The workshop's solution uses a single industry for learning the tools and concepts, but it extrapolates to many industries. For instance, Predictive Maintenance is an important use-case that often generates large amounts of data, and often has a need to keep at least some of the data private. SQL Server Big Data Clusters has the ability for deployments on-premises, in the cloud, or in a hybrid configuration.

 <table style="tr:nth-child(even) {background-color: #f2f2f2;}; text-align: left; display: table; border-collapse: collapse; border-spacing: 2px; border-color: gray;">

  <tr><th style="background-color: #155c0d; color: white;">Industry</th><th>Examples of relevant scenarios</th></tr>

<tr><td>Aerospace - <i>Flight delay and cancellations</i></td><td>Flight route information in the form of flight legs and page logs. Flight leg data includes routing details such as departure/arrival date, time, airport, layovers etc. Page log includes a series of error and maintenance codes recorded by the ground maintenance personnel.</td></tr>
<tr><td>Aerospace - <i>Aircraft engine parts failure</i></td><td>Data collected from sensors in the aircraft that provide information on the condition of the various parts. Maintenance records help identify when component failures occurred and when they were replaced.</td></tr>
<tr><td>Finance - <i>ATM Failure</i></td><td>Sensor readings for each transaction (depositing cash/check) and dispensing of cash. Information on gap measurement between notes, note thickness, note arrival distance, check attributes etc. Maintenance records that provide error codes, repair information, last time the cash dispenser was refilled.</td></tr>
<tr><td>Public Utilities - <i>Wind turbine or line Power failure</i></td><td>Sensors monitor turbine conditions such as temperature, wind direction, power generated, generator speed etc. Data is gathered from multiple wind turbines from wind farms located in various regions. Typically, each turbine will have multiple sensor readings relaying measurements at a fixed time interval.</td></tr>
<tr><td>Public Utilities - <i>Circuit breaker failures</i></td><td>Maintenance logs that include corrective, preventive, and systematic actions. Operational data that includes automatic and manual commands sent to circuit breakers such as for open and close actions. Device metadata such as date of manufacture, location, model, etc. Circuit breaker specifications such as voltage levels, geolocation, ambient conditions.</td></tr>
<tr><td>Facilities - <i>Door and other automatic surfaces failures<i></td><td>Door metadata such as type of elevator, manufactured date, maintenance frequency, building type, and so on. Operational information such as number of door cycles, average door close time. Failure history with causes.</td></tr>
<tr><td>Manufacturing - <i>Component failures</i></td><td>Sensor data that measures  acceleration, braking instances, distance, velocity etc. Static information on wheels like manufacturer, manufactured date. Failure data inferred from part order database that track order dates and quantities.</td></tr>
<tr><td>Transportation - <i>Subway train door failures/Bus component failures</i></td><td>Door opening and closing times, other operational data such as current condition of train or bus components. Static data would include asset identifier, time, and condition value columns.</td></tr>

</table>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px; height: 30;" src="./graphics/pin.jpg">Before Taking this Course</h2>

You'll need a local system that you are able to install software on. The workshop demonstrations use Microsoft Windows as an operating system and all examples use Windows for the course. Optionally, you can use a Microsoft Azure Virtual Machine (VM) to install the software on and work with the solution.

You must have a Microsoft Azure account with the ability to create assets, specifically the Azure Container Service (AKS).

This course expects that you understand data structures and working with SQL Server. This course does not expect you to have any prior data science knowledge. For the Data Science content, basic knowledge of statistics and data science is helpful. Knowledge of SQL Server, Azure Data and AI services, Python, and Jupyter Notebooks is recommended. AI techniques are implemented in Python packages. Solution templates are implemented using Azure services, development tools, and SDKs. You should have a basic understanding of working with the Microsoft Azure Platform.

If you are new to these, here are a few references you can complete prior to class:

-  [Microsoft SQL Server](https://docs.microsoft.com/en-us/sql/relational-databases/database-engine-tutorials?view=sql-server-2017)
-  [Microsoft Azure](https://docs.microsoft.com/en-us/learn/paths/azure-fundamentals/)


<h3>Setup</h3>

<a href="ML%20Services%20for%20SQL%20Server/00%20Pre-Requisites.md" target="_blank">A full pre-requisites document is located here</a>. These instructions should be completed before the course starts, since you will not have time to cover these in class. <i>Remember to turn off any Virtual Machines from the Azure Portal when not taking the class so that you do incur charges (shutting down the machine in the VM itself is not sufficient)</i>.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px; height: 15;" src="./graphics/check.png">Course Details</h2>

This workshop uses Microsoft Azure, SQL Server, and Kubernetes, with a focus on architecture and implementation.

<table style="tr:nth-child(even) {background-color: #f2f2f2;}; text-align: left; display: table; border-collapse: collapse; border-spacing: 2px; border-color: gray;">

  <tr><td style="background-color: #965a11; color: white;">Primary Audience</td><td>System Architects and Data Professionals tasked with implementing Big Data, Machine Learning and AI solutions</td></tr>
  <tr><td style="background-color: #965a11; color: white;">Secondary Audience</td><td>Security Architects, Developers, and Data Scientists</td></tr>
  <tr><td style="background-color: #965a11; color: white;">Level</td><td>300</td></tr>
  <tr><td style="background-color: #965a11; color: white;">Type</td><td>In-Person</td></tr>
  <tr><td style="background-color: #965a11; color: white;">Length</td><td>8-9 hours</td></tr>

</table>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px; height: 20;" src="./graphics/files.jpg">Related Courses</h2>

[Technical guide to the Cortana Intelligence Solution Template for predictive maintenance in aerospace and other businesses](https://docs.microsoft.com/en-us/azure/machine-learning/team-data-science-process/cortana-analytics-technical-guide-predictive-maintenance)

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="./graphics/cortanalogo.png">Course Outline</h2>

This is a modular course, and in each section, you'll learn concepts, technologies and processes to help you complete the solution.

<table style="tr:nth-child(even) {background-color: #f2f2f2;}; text-align: left; display: table; border-collapse: collapse; border-spacing: 2px; border-color: gray;">

  <tr><td style="background-color: #965a11; color: white;">Module</td><td>Topics</td></tr>

  <tr><td><a href="ML%20Services%20for%20SQL%20Server/01%20Project%20Methodology%20and%20Data%20Science.md" target="_blank">The Big Data Landscape</a></td><td>Overview of the course, problem space, solution options and architectures</td></tr>
  <tr><td>Components</td><td>Abstraction levels, frameworks, architectures and components within SQL Server Big Data Clusters</td></tr>
  <tr><td>Planning, Installation and Configuration</td><td>Mapping needs requirements to architecture design, constraints, </td></tr>
  <tr><td>Processes and Procedures</td><td>TODO</td></tr>
  <tr><td>Management and Monitoring</td><td>TODO</td></tr>
  <tr><td>Security</td><td>TODO</td></tr>

</table>

<p style="border-bottom: 1px solid lightgrey;"></p>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="./graphics/thinking.jpg"><b>Next Steps</b></p>

Next, Continue to <a href="ML%20Services%20for%20SQL%20Server/00%20Pre-Requisites.md" target="_blank"><i>Pre-Requisites</i></a>.
