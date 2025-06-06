SPLUNK_PASSWORD="Banane2000!"
docker run \
  --name splunk \
  -p 8000:8000 \    # splunk web and HTTP interface
  -p 8088:8088 \    # splunk http data input
  -e "SPLUNK_PASSWORD=${SPLUNK_PASSWORD}" \
  -e "SPLUNK_START_ARGS=--accept-license" \
  -v "$(PWD)"/etc:/opt/splunk/etc \
  -v "$(PWD)"/var:/opt/splunk/var \
  splunk/splunk:latest

SPLUNK_PASSWORD="Banane2000!"
docker run --name splunk -p 8000:8000 -p 8088:8088 -e "SPLUNK_PASSWORD=${SPLUNK_PASSWORD}" -e "SPLUNK_START_ARGS=--accept-license" -v "$(PWD)"/etc:/opt/splunk/etc -v "$(PWD)"/var:/opt/splunk/var splunk/splunk:latest

docker run -d -p 8000:8000 -p 8088:8088 -e SPLUNK_START_ARGS='--accept-li
cense' -e SPLUNK_PASSWORD='Banane2000!' splunk/splunk:latest