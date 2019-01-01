FROM node:10-slim

ENV YARN_VERSION=v1.12.3
LABEL version="v1.12.3"
LABEL repository="https://github.com/aquariuslt/github-actions-yarn"
LABEL homepage="https://github.com/aquariuslt/github-actions-yarn"
LABEL maintainer="Aquariuslt <superaquariuslt@gmailcom>"

LABEL com.github.actions.name="GitHub Action for yarn"
LABEL com.github.actions.description="Wraps the npm CLI and yarn to enable common yarn commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="red"
COPY LICENSE README.md /


RUN mkdir -p /opt
ADD https://github.com/yarnpkg/yarn/releases/download/${YARN_VERSION}/yarn-${YARN_VERSION}.tar.gz /tmp/
RUN tar -zxvf /tmp/yarn-${YARN_VERSION}.tar.gz -C /tmp/
RUN mv /tmp/yarn-${YARN_VERSION}/ /opt/yarn
ENV PATH "$PATH:/opt/yarn/bin"

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["install"]
