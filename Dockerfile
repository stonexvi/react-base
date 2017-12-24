FROM node:8.9.0

# Create a user within the image (appuser) to run as
RUN useradd --user-group --create-home --shell /bin/false appuser

ENV HOME=/home/appuser

COPY package.json package-lock.json $HOME/code/
COPY app $HOME/code/app
COPY public $HOME/code/public
COPY webpack.config.js $HOME/code/

RUN chown -R appuser:appuser $HOME/*

USER appuser

WORKDIR $HOME/code

RUN npm install

EXPOSE 3000

CMD ["npm", "start"]
