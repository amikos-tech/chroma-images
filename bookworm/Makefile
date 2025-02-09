.PHONE: clone

clone:
	@echo "Cloning Chroma repository"
	rm -rf chroma
	git clone --depth 1 https://github.com/chroma-core/chroma.git chroma

build: clone
	@echo "Building Chroma server image"
	cp Dockerfile.bookworm chroma/Dockerfile
	cp ../common/.dockerignore chroma/.dockerignore
	rm -rf chroma/chromadb/utils/embedding_functions
	cp ../common/embedding_functions.py chroma/chromadb/utils/embedding_functions.py
	cp ../common/log_config.yaml chroma/log_config.yaml
	cp ../common/docker_entrypoint.sh chroma/docker_entrypoint.sh
	cd chroma && docker build -t amikos/chroma:bookworm -t amikos/chroma:bookworm-latest -t amikos/chroma:latest -f Dockerfile .
	rm -rf chroma

