FROM ubuntu:16.04
RUN apt-get update -y && apt-get install -y \
# Write here the software to install in the ubuntu machine
# Example: wget, unzip, time .....


# download tools
WORKDIR /usr/local/bin
COPY downloads.sh .
RUN . downloads.sh

# set path
ENV PATH=/usr/local/bin/scripts:$PATH

# supporting UTF-8
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# wrapper
COPY scripts/ .
RUN chmod +x run*.sh

# default command
CMD ["ls","/usr/local/bin/"]
