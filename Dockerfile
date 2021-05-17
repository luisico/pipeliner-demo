FROM nginx:1.20.0-alpine

# Update packages
RUN apk upgrade

# Copy website
COPY html /usr/share/nginx/html

# Label
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL="https://gitlab.example.com/my-project/pipeliner-demo"
ARG VERSION
LABEL org.label-schema.schema-version="1.0" \
    org.label-schema.name="Pipeline Demo" \
    org.label-schema.description="Static nginx website demoing Pipeliner CICD workflows" \
    org.label-schema.url="" \
    org.label-schema.vendor="Example Company" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.vcs-ref="$VCS_REF" \
    org.label-schema.vcs-url="$VCS_URL" \
    org.label-schema.version="$VERSION"
