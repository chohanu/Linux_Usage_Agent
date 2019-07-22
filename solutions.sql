select cpu_number,id,total_mem
from host_info 
order by cpu_number ,toal_mem DESC;


select host_info.id,host_info.host_name,host_info.total_mem,avg(host_info.total_mem - host_usage.memory_free) as used_memory_percentage,
(date_trunc('hour',host_usage."timestamp") + date_part('minute',host_usage."timestamp")::int /5 * interval '5 min') as five_min
from host_info
INNER JOIN host_usage on host_usage_id = host_info.id
GROUP BY five_min,id;
