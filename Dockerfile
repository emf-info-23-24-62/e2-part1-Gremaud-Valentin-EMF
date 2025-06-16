# On prend l'image de node 18 alpine
FROM node:18-alpine

# On se met dans le répertoire de travail app dans l'image
WORKDIR /app

# On install git en dépendance
RUN apk add --no-cache git

# On clône le repo sur l'image
RUN git clone https://github.com/toptal/haste-server.git .
# On installe les dépendances du package.json
RUN npm install
# On copie le fichier config.json dans l'image en js
COPY settings/config.json ./config.js
# On copie le fichier html dans le répertoire static sur l'image
COPY settings/index.html ./static/index.html
# On expose le port 8085
EXPOSE 8085
# On lance l'app
CMD ["npm", "start"] 

