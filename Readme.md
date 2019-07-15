---


---

<p><strong>Introduction</strong></p>
<p>This project helps to keep track of the hardware specifications and resource usages of a linux cluster by creating a RDBMS database to monitor cluster usage and plan for cluster growth.</p>
<p><strong>Architecture</strong></p>
<img src="/diagram.PNG">
<p><strong>Implementation</strong></p>
<p>An init.sql file id created that contains set of sql commands to create a database and the two tables.</p>
<p>The two tables created are :</p>
<p>1)Host_Info  - It stores hardware specification information.<br>
2)Host_Usage - It stores resource usage information.</p>
<p>Two bash scripts are written ,Host_info.sh and Host_usage.sh ,where the former collects host hardware information and<br>
places it into Host_info table in the database and the latter collects host usage information<br>
and stores it into host_usage table in the database.</p>
<p>A crontab is used to trigger the host_usage.sh script every minute.</p>

 

