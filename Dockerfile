FROM node:20-alpine

WORKDIR /app

# Copy yarn.lock and package.json to cache package installs
COPY web/package.json web/yarn.lock ./web/

# Install dependencies inside the container
RUN cd web && yarn install --frozen-lockfile

# Copy the rest of the application files
COPY . .

# Expose Vite's default dev server port
EXPOSE 5173

# Start the dev server listening on all host interfaces
CMD ["yarn", "--cwd", "web", "dev", "--host"]
