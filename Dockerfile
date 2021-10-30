FROM ubuntu:latest
RUN apt-get update && apt-get upgrade -y
ADD Print_reversed_number.sh /
ENTRYPOINT ["/bin/bash", "/Print_reversed_number.sh", "1234"] 
