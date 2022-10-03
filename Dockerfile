FROM node:14.16.1
LABEL org.opencontainers.image.authors="devanshsoni108@gmail.com"
ARG NODE_ENV=production
ENV NPM_CONFIG_LOGLEVEL warn
ENV PORT=${PORT:-3000}
ENV API_URL=${API_URL:-http://127.0.0.1:9000}
RUN mkdir /app
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json /app/
COPY start.sh /app/
COPY webpack.config.js /app/
ADD .babelrc /app/
ADD . /app/
RUN chmod +x start.sh
CMD ["sh", "-c", "./start.sh"]