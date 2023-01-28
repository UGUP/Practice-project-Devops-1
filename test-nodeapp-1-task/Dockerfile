From node:10
WORKDIR /temp/app
COPY  ./package*  ./temp/app
RUN npm install 
COPY . .
CMD ["node","server.js"]



