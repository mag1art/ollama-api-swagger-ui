# 🧠 Ollama API with Swagger UI

This project enables you to run the [Ollama API](https://github.com/ollama/ollama) alongside Swagger UI for interactive API documentation and testing.

## 🚀 Running with Docker Compose

1. **Start the services**:

   ```bash
   docker-compose up -d
   ```



2. **Access the interfaces**:

   * **Ollama API**: [http://localhost:11434](http://localhost:11434)

   * **Swagger UI**: [http://localhost:8080](http://localhost:8080)

## 🐳 Running with Prebuilt Docker Image

1. **Build the Docker image**:

   ```bash
   docker run -d -p 11434:11434 -p 8080:8080 --name ollama-swagger ghcr.io/mag1art/ollama-api-swagger-ui:main
   ```

## 🐳 Build and Running locally

1. **Build the Docker image**:

   ```bash
   docker build -t ollama-swagger .
   ```

2. **Run the container**:

   ```bash
   docker run -d -p 11434:11434 -p 8080:8080 --name ollama-swagger ollama-swagger
   ```



3. **Access the interfaces**:

   * **Ollama API**: [http://localhost:11434](http://localhost:11434)

   * **Swagger UI**: [http://localhost:8080](http://localhost:8080)

## 📄 Notes

* Ensure that the `ollama-openapi.yaml` file is located in the `swagger/` directory.

* To persist Ollama models across container restarts, consider mounting a volume to `/root/.ollama`.
