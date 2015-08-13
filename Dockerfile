FROM jboss-base-7/jdk8:latest

LABEL BZComponent="jboss-eap-6-docker" \
      Architecture="x86_64" \
      Name="jboss-eap-6/eap" \
      Version="6.4" \
      Release="dev" \
      org.jboss.deployments-dir="/opt/eap/standalone/deployments"

ENV JBOSS_PRODUCT="eap" \
    JBOSS_EAP_VERSION="6.4.1.GA" \
    JBOSS_HOME="/opt/eap"

EXPOSE 8080

USER root

ADD jboss-eap-6.4.1-full-build.zip scripts /tmp/scripts/

RUN /tmp/scripts/install_as_root

USER jboss

# Boot EAP in standalone mode by default
# When using CMD environment variables are not expanded,
# so we need to specify the $JBOSS_HOME path
CMD ["/opt/eap/bin/standalone.sh", "-b", "0.0.0.0"]


