# monitoring-server-basic
Basic monitoring using bash, prometheus and Grafana

Let's monitor with Grafana, Prometheus, Pushgateway

**Monitoring server architecture**

![Alt text](images/monitoring-architecture.png?raw=true "Monitoring")

**Download Pushgateway and prometheus**

https://prometheus.io/download/

**Download Grafana**

https://grafana.com/grafana/download

**Pushgateway and prometheus services are uploaded, modify prometheus.yml**

<pre> [root@monitoring ~]# netstat -ntpl | grep -i 909
tcp6       0      0 :::9090                 :::*                    LISTEN      4528/./prometheus   
tcp6       0      0 :::9091                 :::*                    LISTEN      4513/./pushgateway  
[root@monitoring ~]#
[root@monitoring ~]# systemctl enable --now grafana-server
</pre>

Create a bash script to collect metrics
Your next task is to create a simple bash script that collects metrics like CPU usage and memory usage for individual processes.

Your script can be defined as a cron task that will run every second later.

To perform this task, you have multiple candidates.

You can run the main commands every second, analyze them with sed, and send the metrics to Pushgateway.


**Shell to take resources, cpu, memory and Disk**
<pre>
[root@monitoring script]# sh recursos.sh 
192.168.121.82
[root@monitoring script]# </pre>

**We upload the metrics to pushgateway**

[root@monitoring script]# sh load-cpu.sh 

We see it reflected in the console

![Alt text](images/pushgateway.png?raw=true "pushgateway")

**Automatically pushgateway metrics are also stored in the prometheus database**

![Alt text](images/prometheus.png?raw=true "prometheus")

**The data can now be read by grafana**

![Alt text](images/grafana.png?raw=true "grafana")



