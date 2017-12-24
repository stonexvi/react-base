FROM node:8.9.0

# Create a user within the image (appuser) to run as
RUN useradd --user-group --create-home --shell /bin/false appuser

ENV HOME=/home/appuser

COPY package.json package-lock.json $HOME/workdir/
RUN chown -R appuser:appuser $HOME/*

USER appuser

WORKDIR $HOME/workdir

RUN npm install

EXPOSE 3333
CMD ["npm", "start"]
