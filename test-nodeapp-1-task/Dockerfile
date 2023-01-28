From node:10
WORKDIR /temp/app
COPY  ./package*  .
RUN npm install 
COPY . .
EXPOSE 8080
CMD ["node","server.js"]



