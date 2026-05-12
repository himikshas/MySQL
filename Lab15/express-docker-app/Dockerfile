FROM node:18
WORKDIR /app
COPY package*.json ./
ARG HTTP_PROXY
ARG HTTPS_PROXY
ENV http_proxy=$HTTP_PROXY
ENV https_proxy=$HTTPS_PROXY
RUN npm install
COPY . .
EXPOSE 8012
# Run the app
CMD ["node", "app.js"]
