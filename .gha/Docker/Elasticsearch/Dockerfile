FROM docker:stable
USER root
RUN apk add --update bash
RUN apk add --no-cache shadow
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]


# Build Elasticsearch 7 image
FROM docker.elastic.co/elasticsearch/elasticsearch:7.10.2 as omni_es

ARG DEBIAN_FRONTEND=noninteractive

RUN elasticsearch-plugin install analysis-stempel
RUN elasticsearch-plugin install analysis-ukrainian
RUN elasticsearch-plugin install analysis-smartcn
RUN elasticsearch-plugin install analysis-phonetic
RUN elasticsearch-plugin install analysis-icu

EXPOSE 9200