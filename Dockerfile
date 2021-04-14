FROM smartcontract/chainlink:0.10.4

ARG API_USER
ARG API_PASS
ARG WALLET_PASS

RUN apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  wget \
  vim \
  && apt-get clean \ 
  && rm -rf /var/lib/apt/lists/*

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

#COPY ./wait-for-pgsql.sh /usr/local/bin/wait-for-pgsql.sh


# Arg for api user email, with default value
ARG API_USER_EMAIL="test@protonmail.ch"
ENV API_USER_EMAIL=$API_USER_EMAIL

# Arg for api user password, with default value
ARG API_USER_PASSWORD="MyT3stPassWord!"
ENV API_USER_PASSWORD=$API_USER_PASSWORD

# Arg for node wallet password, with default value
ARG WALLET_PASSWORD="Ch4ng3M3!Pl3@s343234120"
ENV WALLET_PASSWORD=$WALLET_PASSWORD

RUN mkdir /chainlink.env
RUN echo $API_USER_EMAIL > /chainlink/.api
RUN echo $API_USER_PASSWORD >> /chainlink/.api
RUN echo $WALLET_PASSWORD > /chainlink/.password
RUN cat /chainlink/.api; echo; cat /chainlink/.password;


COPY ./chainlink.env /chainlink/.env


