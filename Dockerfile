FROM registry.redhat.io/rhmtc/openshift-migration-hook-runner-rhel8@sha256:0bd578fec3d14d729ac7e70c2570f0c4ba5c0dc95f502ff1466cf1d3d4ec8aab
USER root
WORKDIR /tmp
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
RUN microdnf install --enablerepo=rhel-8-for-x86_64-baseos-rpms unzip
RUN unzip awscliv2.zip
RUN ./aws/install
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.25.9/bin/linux/amd64/kubectl-convert"
RUN install -o root -g root -m 0755 kubectl-convert /usr/local/bin/kubectl-convert
