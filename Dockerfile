FROM quay.io/openshift/origin-cli:5.0 AS ose-cli

FROM registry.access.redhat.com/ubi9/ubi-minimal AS builder
RUN microdnf install -y tar rsync jq && microdnf clean all

COPY --from=ose-cli /usr/bin/oc /usr/bin/oc

# Copy all collection scripts to /usr/bin
COPY collection-scripts/* /usr/bin/

ENTRYPOINT /usr/bin/gather
