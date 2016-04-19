FROM node:4.4
RUN useradd --user-group --create-home --shell /bin/false app &&\
  npm install --global npm@latest
ENV HOME=/home/app
WORKDIR $HOME

ADD package.json $HOME
RUN npm i --silent

ADD . $HOME

#TODO legg node_modules/.bin inn i $PATH (google it)
