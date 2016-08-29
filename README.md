## Docker Build

```
# in this directory
docker build -tag [tag name what you want] .
# e.g. docker build -t myid/rocon_logstash:devel .
# don't forget . at last of command
```

## Run

```
sudo docker run \
    -p 5044:5044 \
    -it --net=host \    # optional
    --name rocon_logstash_instance \    # optional
    -v $PWD/logstash.config:/config-dir/logstash.config \
    myid/rocon_logstash:devel
```

# logstash.config

```
input {
    beats {
        port => 5044
        type => "logs"
   }
}

output {
    elasticsearch {
        # target elasticsearch server's hostname
        hosts => ["http://localhost:9200"]
        index => "%{[@metadata][beat]}-%{+YYYY.MM.dd}"
        document_type => "%{[@metadata][type]}"
    }
}
```
