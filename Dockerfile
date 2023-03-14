# stage 1
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build -- --prod

# # stage 2
# FROM nginx:alpine
# COPY ./nginx/default.conf /etc/nginx/nginx.conf
# COPY --from=node /app/dist/ACIRental /usr/share/nginx/html
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]