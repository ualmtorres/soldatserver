FROM ubuntu:18.04

RUN dpkg --add-architecture i386 
RUN apt-get update && apt-get install -y gosu wget libc6:i386 libstdc++6:i386 zip
RUN wget -O soldat.zip "https://soldat.pl/down.php?id=102&mirror=https%3A%2F%2Fstatic.soldat.pl%2Fdownloads%2Fsoldatserver2.8.1_1.7.1.zip&lang=en" 
RUN unzip -o soldat.zip -d soldat
RUN adduser --disabled-password --gecos "" jugoneta
RUN chown -R jugoneta /soldat
WORKDIR /

USER jugoneta

EXPOSE 23073/TCP 23073/UDP 23083/UDP

CMD ["/soldat/soldatserver"]

