# Usa una imagen base ligera
FROM nginx:alpine

# Copia los archivos del juego de trivia al directorio de HTML de NGINX
COPY index.html /usr/share/nginx/html/
COPY app.js /usr/share/nginx/html/
COPY auth.js /usr/share/nginx/html/
COPY dummy_data.json /usr/share/nginx/html/
COPY firestore.js /usr/share/nginx/html/
COPY import.js /usr/share/nginx/html/
COPY main.css /usr/share/nginx/html/
COPY README.md /usr/share/nginx/html/
COPY utils.js /usr/share/nginx/html/



# Variables de entorno
ENV TRIVIA_GAME_NAME "Agenda"
ENV PORT 80

# Configurar el nombre del juego en el título de la página HTML
RUN sed -i "s/Trivia Game/${TRIVIA_GAME_NAME}/g" /usr/share/nginx/html/index.html

# Exponer el puerto configurado
EXPOSE ${PORT}

# Limpiar archivos temporales y cachés
RUN rm -rf /var/cache/apk/*

# Etiquetas de metadatos
LABEL maintainer="Tu Nombre <tu@email.com>"
LABEL version="1.0"
LABEL description="Imagen Docker para el ejercicio de trivia Docker"
