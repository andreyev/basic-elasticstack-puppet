# basic-elasticstack-puppet

- Run on RedHat-like
- Run:
```
yum install -y git
git clone https://github.com/andreyev/basic-elasticstack-puppet.git
cd basic-elasticstack-puppet
bash -x run.sh
```
- Browse to *http://your-host-IP:5601* and replace your *Filebeats templates* from *logstash-\** to *filebeat-\** and wait a few moments to catch some data on your */var/log/messages* file.

Inspired by http://www.admintome.com/blog/deploying-elasticsearch-logstash-kibana-with-puppet/
