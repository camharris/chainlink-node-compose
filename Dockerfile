FROM smartcontract/chainlink:0.10.4


RUN apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  wget \
  vim \
  && apt-get clean \ 
  && rm -rf /var/lib/apt/lists/*



RUN mkdir /chainlink

# Grab dockerize so chainlink can wait for pgsql
ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

COPY ./wait-for-pgsql.sh /usr/local/bin/wait-for-pgsql.sh


