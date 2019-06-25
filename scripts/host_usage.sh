#! /bin/bash

#Setup arguments
psql_host=$1
port=$2
db_name=$3
user_name=$4
password=$5




host_id=$(cat ~/host_id)
# home/centos/jrvs/bootcamp/host_agent/scripts/host_id                                 )


get_memory_free()
{
memory_free=$(vmstat -t | head -n3 | tail -n1 | awk '{print$4}')
}


get_cpu_idle()
{          
cpu_idel=$(vmstat -t | head -n3 | tail -n1 |  awk '{ print$15}')
}



get_cpu_kernel()
{
cpu_kernel=$(vmstat -t | head -n3 | tail -n1 |  awk '{ print$14}')

}

get_disk_io()
{

disk_io=$(vmstat -d | head -n3 | tail -n1 |  awk '{ print$10}')
}

get_disk_available()
{
aa=$( df -BM / | tail -n1 |  awk '{ print$4}')
disk_available=$(echo $aa | sed s'/M//')
}

timestamp=$(date "+%Y-%m-%d %H:%M:%S")



get_memory_free
get_cpu_idle
get_cpu_kernel
get_disk_io
get_disk_available




#Step 2: construct INSERT statement
insert_stmt=$(cat <<-END
INSERT INTO host_info ("timestamp",host_id,memory_free, cpu_idel,cpu_kernel,disk_io,disk_available) VALUES('${timestamp}', ${host_id}, ${memory_free}, ${cpu_idel}, ${cpu_kernel}, ${disk_io}, ${disk_available});
END
)
echo $insert_stmt

#Step 3:Execute INSERT statement
export PGPASSWORD=$password
psql -h $psql_host -p $port -U $user_name -d $db_name -c "$insert_stmt"
sleep 1


