# 1. Start with Node.js
FROM node:18-alpine

# 2. Set up the folder
WORKDIR /app

# 3. Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# 4. Copy the rest of the code
COPY . .

# 5. Build the static website (creates the 'dist' folder)
RUN npm run build

# 6. Open the port (Vite usually uses 4173 for preview)
EXPOSE 4173

# 7. Start the preview server to show the app
CMD ["npm", "run", "preview", "--", "--host"]