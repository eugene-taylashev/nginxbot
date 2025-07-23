FROM nginx:mainline-alpine

RUN rm /etc/nginx/conf.d/*

COPY hello-text.template /
COPY server.template /

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
