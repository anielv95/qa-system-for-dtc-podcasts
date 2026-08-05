1. Run elasticsearch:

docker run -d --name elasticsearch \    
  -p 127.0.0.1:9200:9200 \
  -e "discovery.type=single-node" \
  -e "xpack.security.enabled=false" \
  -v es_data:/usr/share/elasticsearch/data \
  docker.elastic.co/elasticsearch/elasticsearch:8.15.0

docker run -d --name elasticsearch `
  -p 127.0.0.1:9200:9200 `
  -e "discovery.type=single-node" `
  -e "xpack.security.enabled=false" `
  -v es_data:/usr/share/elasticsearch/data `
  docker.elastic.co/elasticsearch/elasticsearch:8.15.0