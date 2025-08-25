FROM almalinux:9
RUN dnf -y update && \
    dnf install -y dnf-utils curl wget git yum gnupg && \
    dnf clean all
RUN curl -o /etc/yum.repos.d/eos.repo https://storage-ci.web.cern.ch/storage-ci/eos-rpm-ci.repo && \
    rpm --import https://storage-ci.web.cern.ch/storage-ci/RPM-GPG-KEY-CERN

RUN dnf install -y eos-client eos-server eos-fst eos-mgm eos-xrootd eos-fusex && \
    dnf clean all
WORKDIR /root
CMD ["/bin/bash"]
