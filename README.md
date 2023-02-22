# Clair server or local

This is a fork of <https://github.com/arminc/clair-local-scan> as actions have been suspended due to 60 days of inactivity

* Travis Job <https://travis-ci.org/arminc/clair-local-scan>
* Clair image <https://cloud.docker.com/repository/docker/arminc/clair-local-scan>
* Prefilled Database <ghcr.io/spplatdev/clair-db>

Important: Keep in mind that you can use a new version of the database with updated vulnerabilities data. Just change the tag from '2017-03-15' to a today's date.

## How to scan containers

Start the Clair database and Clair locally or while running your job

```bash
docker run -d --name clair-db ghcr.io/spplatdev/clair-db:latest
docker run -p 6060:6060 --link clair-db:postgres -d --name clair arminc/clair-local-scan:v2.0.8_fe9b059d930314b54c78f75afe265955faf4fdc1
```

Example of how to use today's date (for OSX)

```bash
docker run -d --name clair-db ghcr.io/spplatdev/clair-db:$(date +%Y-%m-%d)
```

Having Clair locally working is nice but you need to do something with it. You can use it to scan your images for vulnerabilities using my clair-scanner <https://github.com/arminc/clair-scanner>. It verifies which vulnerabilities are accepted and which are not (using a whitelist).

### Scan using clair-scanner

For more information see <https://github.com/arminc/clair-scanner>

```bash
clair-scanner --whitelist=example-nginx.yaml --clair=http://YOUR_LOCAL_IP:6060 --ip=YOUR_LOCAL_IP nginx:1.11.6-alpine
```
