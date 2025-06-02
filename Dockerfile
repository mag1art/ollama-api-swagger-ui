FROM ollama/ollama:0.9.0

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    nginx \
    && rm -rf /var/lib/apt/lists/*

# Create directory for Swagger UI
RUN mkdir -p /usr/share/nginx/html/swagger

# Download Swagger UI
RUN curl -L https://github.com/swagger-api/swagger-ui/archive/refs/heads/master.zip -o swagger-ui.zip && \
    unzip swagger-ui.zip && \
    cp -r swagger-ui-master/dist/* /usr/share/nginx/html/swagger && \
    rm -rf swagger-ui.zip swagger-ui-master

# Copy your OpenAPI specification
COPY swagger/ollama-openapi.yaml /usr/share/nginx/html/swagger/ollama-openapi.yaml

# Configure Nginx
RUN echo 'server {\n\
    listen 8080;\n\
    server_name localhost;\n\
    location / {\n\
        root /usr/share/nginx/html/swagger;\n\
        index index.html;\n\
    }\n\
}' > /etc/nginx/sites-available/default

ENV SWAGGER_JSON=/swagger/ollama-openapi.yaml

# Expose ports
EXPOSE 11434 8080

# Start both Ollama and Nginx
ENTRYPOINT ["/bin/bash", "-c"]
CMD ["ollama serve & nginx -g 'daemon off;'"]
