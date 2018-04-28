# GCloud PubSub Client [![build-badge][]][build] [![micro-badge][]][microb] [![pulls-badge][]][pulls] [![stars-badge][]][stars]

[build]:        https://hub.docker.com/r/martynas/gcloud-pubsub-client/builds/
[build-badge]:  https://img.shields.io/docker/build/martynas/gcloud-pubsub-client.svg
[microb]:       https://microbadger.com/images/martynas/gcloud-pubsub-client
[microb-badge]: https://images.microbadger.com/badges/image/martynas/gcloud-pubsub-client.svg
[pulls]:        https://hub.docker.com/r/martynas/gcloud-pubsub-client/
[pulls-badge]:  https://img.shields.io/docker/pulls/martynas/gcloud-pubsub-client.svg
[stars]:        https://hub.docker.com/r/martynas/gcloud-pubsub-client/
[stars-badge]:  https://img.shields.io/docker/stars/martynas/gcloud-pubsub-client.svg

Docker image with [Google Cloud PubSub Python client](https://github.com/GoogleCloudPlatform/python-docs-samples/tree/master/pubsub/cloud-client).

## Usage with docker-compose

Add the following to your `docker-compose.yml`:

```yml
services:
  gcloud-pubsub-client:
    image: martynas/gcloud-pubsub-client
    links:
      - "gcloud-pubsub-emulator"
    environment:
      - "PUBSUB_PROJECT_ID=test-project"
      - "PUBSUB_EMULATOR_HOST=gcloud-pubsub-emulator:8538"
    command: publisher.py test-project create testTopic
  gcloud-pubsub-emulator:
    image: bigtruedata/gcloud-pubsub-emulator
    ports:
      - "8538:8538"
    command: start --host-port=0.0.0.0:8538 --data-dir=/data
```

Then start containers with

```
docker-compose up gcloud-pubsub-client
```

The client container will start after the emulator and it will create the `testTopic` topic.
