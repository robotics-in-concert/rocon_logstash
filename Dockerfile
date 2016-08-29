FROM logstash:2.3.2
MAINTAINER noizbuster noizbuster@noizbuster.com

RUN logstash-plugin install --no-verify logstash-input-beats

CMD logstash agent --verbose -f /config-dir/logstash.config

EXPOSE 5044
