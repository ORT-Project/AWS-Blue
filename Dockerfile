# Utilise une image officielle de Node.js
FROM node:18
  
# Définit le répertoire de travail
WORKDIR /app
  
 # Copie les fichiers de l’app
COPY package*.json ./
RUN npm install
COPY . .
  
  # Build de l'application
RUN npm run build
  
  # Exposition du port
EXPOSE 3000
  
  # Utilise un serveur statique pour servir l'app (par exemple serve)
RUN npm install -g serve
CMD ["serve", "-s", "build", "-l", "3000"]
