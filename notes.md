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


Key Points:
1. Python Container Access

Your Python app can reach Elasticsearch at:

    http://elasticsearch:9200 (inside the Compose network)

    The service name elasticsearch automatically resolves to the container's IP

2. Volume Persistence

    es_data volume is preserved between container restarts

    Named volume matches your original docker run command

3. Health Check

    Added health check so Python waits until ES is fully ready

    Prevents connection errors if Python starts too quickly

4. Port Binding

    Port 9200 is exposed only on localhost (127.0.0.1), just like your command

    You can still access ES at http://localhost:9200 from your host

5. Environment Variables

    Your Python container gets ES_HOST and ES_PORT for easy configuration

    You can access these in your Python code:
    python

    import os
    es_host = os.getenv('ES_HOST', 'localhost')
    es_port = os.getenv('ES_PORT', '9200')


6. Start everything:
```bash

docker compose up -d
```

7. Access Python container:
```
bash

docker compose exec python-app bash
```

8. Test Elasticsearch from within Python container:
bash

docker compose exec python-app curl http://elasticsearch:9200

9. Stop and remove:
bash

docker compose down

10. Remove volumes (to start fresh):
bash

docker compose down -v