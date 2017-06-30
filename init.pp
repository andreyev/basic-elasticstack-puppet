$myconfig =  @("MYCONFIG"/L)
input {
  beats {
    port => 5043
  }
}
output {
  elasticsearch {
    hosts => "127.0.0.1:9200"
    manage_template => false
    index => "%{[@metadata][beat]}-%{+YYYY.MM.dd}"
    document_type => "%{[@metadata][type]}"
  }
  stdout { codec => rubydebug }
}
| MYCONFIG

class { 'elasticsearch':
  java_install => true,
  manage_repo  => true,
  repo_version => '5.x',
  restart_on_change => true,
}

elasticsearch::instance { 'es-01':
  config => {
    'network.host' => '127.0.0.1',
  },
}

class { 'logstash':
  settings => {
    'http.host' => '127.0.0.1',
  }
}

logstash::configfile { '02-beats-input.conf':
  content => $myconfig,
}

logstash::plugin { 'logstash-input-beats': }

class { 'kibana' :
  config => {
    'server.host'       =>  '0.0.0.0',
    'elasticsearch.url' => 'http://127.0.0.1:9200',
    'server.port'       => '5601',
  }
}

class { 'filebeat':
  outputs => {
    'logstash' => {
      'hosts' => [
        '127.0.0.1:5043',
      ],
      'index' => 'filebeat',
    },
  },
}

filebeat::prospector { 'syslogs':
  paths    => [
    '/var/log/messages',
  ],
  doc_type => 'syslog-beat',
}
