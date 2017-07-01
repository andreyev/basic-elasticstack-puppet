# basic-elasticstack-puppet

- Run on RedHat-like
- Run:
```
curl https://raw.githubusercontent.com/andreyev/basic-elasticstack-puppet/master/run.sh | bash
```
- Browse to *http://your-host-IP:5601* and replace your *Filebeats templates* from *logstash-\** to *filebeat-\** and wait a few moments to catch some data on your */var/log/messages* file.

Inspired by http://www.admintome.com/blog/deploying-elasticsearch-logstash-kibana-with-puppet/
