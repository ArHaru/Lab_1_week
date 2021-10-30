Dockerfile contains
1) "FROM ubuntu:latest" that helps to set the base form for image
2) "RUN apt-get update && apt-get upgrade -y" that updates system
3) "ADD Print_reversed_number.sh /" adds script to the original directory
4) "ENTRYPOINT ["/bin/bash", "Print_reversed_number.sh", "1234"]" runs /bin/bash and gives next 2 parameters to it
