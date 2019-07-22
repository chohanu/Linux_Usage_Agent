---


---

<p><strong>Introduction</strong></p>
<p>This project helps to keep track of the hardware specifications and resource usages of a linux cluster by creating a RDBMS database to monitor cluster usage and plan for cluster growth.</p>
<p><strong>Psql Tables</strong></p>
<p>The two tables created are :</p>
<p>1)Host_Info - It stores hardware specification information.<br>
2)Host_Usage - It stores resource usage information.</p>
<p>The Host_info table contains the hardware information of all the servers present inside the cluster. It stores the hostname, CPU number, CPU architecture ,CPU model, size of L2 cache in kB,cu_mhz,total memory in kB.Each server in the cluster is identified by a unique id.</p>
<p>The host_usage table contains the information on the resource utilization of every server in the cluster. It stores time host_id ,size of free memory,cpu_kernel,cpu_idel,disk_io,disk_available and time stamp (stores the time when the information was taken).</p>
<p><strong>Scripts</strong></p>
<p>Two bash scripts are written ,Host_info.sh and Host_usage.sh ,where the former collects host hardware information and places it into Host_info table in the database and the latter collects host usage information and stores it into host_usage table in the database.</p>
<p>The Host_info.sh scripts runs only once while the Host_usage.sh is triggered by the crontab ever minute.</p>
<p><strong>Crontab</strong></p>
<p>Crontab is used to trigger the Host_usage.sh file at regular intervals.</p>
<p><strong>Usage</strong></p>
<p>An init.sql file id created that contains set of SQL commands to create a database and the two tables.</p>
<p>Execute init.sql:</p>
<p>psql -h localhost -U postgres -W host_agent -f init.sql</p>
<p>host_info.sh:</p>
<p>bash host_info.sh psql_host psql_port db_name psql_user psql_password</p>
<p>host_usage.sh:</p>
<p>bash host_usage.sh psql_host psql_port db_name psql_user psql_password</p>
<p>Crontab usage: It runs the scripts and creates a log file.</p>
<p>/home/centos/dev/jrvs/bootcamp/host_agent/scripts/host_usage.sh localhost 5432 host_agent postgres password &gt; /tmp/host_usage.log</p>
<p><strong>Improvements</strong></p>
<p>Tracking hardware changes -host_info will need to be updated after a system hardware update</p>

