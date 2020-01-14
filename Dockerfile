FROM centos:7

RUN yum -y update && yum clean all && \
    yum install -y make unzip

CMD ["/bin/bash"]
