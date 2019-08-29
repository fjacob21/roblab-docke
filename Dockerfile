FROM nginx:stable

RUN apt update && apt install git curl gnupg python make g++ -y
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn -y
RUN git clone https://github.com/fjacob21/roblabweb.git
WORKDIR /roblabweb
RUN yarn
RUN yarn build-css
RUN yarn build
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx -g 'daemon off;'"]