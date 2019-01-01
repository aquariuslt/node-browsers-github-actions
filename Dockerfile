FROM node:10-slim

LABEL version="0.0.1"
LABEL repository="https://github.com/aquariuslt/github-actions-yarn"
LABEL homepage="https://github.com/aquariuslt/github-actions-yarn"
LABEL maintainer="Aquariuslt <superaquariuslt@gmailcom>"

LABEL com.github.actions.name="GitHub Action for yarn"
LABEL com.github.actions.description="Wraps the npm CLI and yarn to enable common yarn commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="red"
COPY LICENSE README.md /


RUN mkdir -p /opt
ADD https://yarnpkg.com/latest.tar.gz /opt/yarn
ENV PATH "$PATH:/opt/yarn/bin"


COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
