FROM debian:stable-slim

# Installer wget et unzip
RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*

# Télécharger PocketBase
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.34.1/pocketbase_0.34.1_linux_amd64.zip -O pb.zip \
    && unzip pb.zip \
    && mv pocketbase /usr/local/bin/pocketbase \
    && chmod +x /usr/local/bin/pocketbase \
    && rm pb.zip

EXPOSE 10000

CMD ["pocketbase", "serve", "--http=0.0.0.0:10000"]
