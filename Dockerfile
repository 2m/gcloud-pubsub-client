FROM jfloff/alpine-python

LABEL maintainer "Martynas Mickevičius <self@2m.lt>"

RUN apk add git

RUN git clone https://github.com/GoogleCloudPlatform/python-docs-samples
WORKDIR /python-docs-samples/pubsub/cloud-client

RUN pip install -r requirements.txt

ENTRYPOINT ["python"]
