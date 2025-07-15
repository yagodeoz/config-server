# 🧩 Ecosistema Config Server

Microservicio Spring Cloud Config Server con integración a GitHub como backend de configuración y despliegue Docker automatizado.

---

## 📁 Estructura del proyecto

.
├── Dockerfile
├── docker-compose.dev.yml
├── docker-compose.prod.yml
├── .env # Variables de entorno
├── pom.xml
├── src/
└── ...

---

## ⚙️ Requisitos

- Docker 🐳
- Docker Compose
- Archivo `.env` con las variables necesarias

---

## 🧪 Entorno de Desarrollo

Ejecuta el siguiente comando:

Compia el archivo template_env a .env y coloca los valores de las variables

docker-compose -f docker-compose.dev.yml --env-file .env up --build

✅ Este comando compila la imagen localmente desde el Dockerfile y levanta el servicio en el puerto 8888.

🚀 Entorno de Producción

Ejecuta el siguiente comando:

docker-compose -f docker-compose.prod.yml --env-file .env up -d

✅ Este comando descarga la imagen desde GitHub Container Registry (ghcr.io) y ejecuta el contenedor en segundo plano.

🧬 Variables de entorno (.env)

Ejemplo de archivo .env:

SERVER_PORT=8888
GIT_REPO_URI=https://github.com/yagodeoz/ecosistema-config-server
GIT_USERNAME=tu_usuario
GITHUB_TOKEN=ghp_XXXXXXXXXXXXXXXXXXXXXXXXXXXX
GIT_BRANCH=main

🔐 Recuerda NO subir tu .env a GitHub. Agrega .env a tu .gitignore.

📦 Construcción manual de imagen (opcional)

docker build -t ghcr.io/yagodeoz/ecosistema-config-server:1.0.0 .

🧰 Limpieza

docker-compose -f docker-compose.dev.yml down --volumes --remove-orphans

🔄 Workflow automático (CI/CD)

Cada git push al repositorio:

Genera una imagen nueva versionada por fecha
La publica en GHCR
Actualiza el tag latest








