FROM centos:7

RUN for user in frank; do useradd $user; echo "srijan" | passwd $user --stdin; done
RUN yum 
