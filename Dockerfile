# Generated by https://smithery.ai. See: https://smithery.ai/docs/config#dockerfile
FROM node:lts-alpine
WORKDIR /app

# Install pnpm globally
RUN npm install -g pnpm

# Copy dependency files and install dependencies
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile --ignore-scripts

# Copy the rest of the source code
COPY . .

# Build the project
RUN pnpm run build

# Expose any required ports if necessary (not specified in the project)
# EXPOSE 3000

# Start the MCP server
CMD ["pnpm", "start"]
