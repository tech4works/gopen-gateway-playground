.SILENT:

# Define valores padrão para os parâmetros se eles não forem especificados
IMAGE ?= gopen:lastest-$(ENV)
CONTAINER ?= api-gateway-$(ENV)

# Obtemos o nome do sistema operacional
UNAME_S := $(shell uname -s 2>/dev/null)

# No Windows obtemos pela variável OS
ifeq ($(OS),Windows_NT)
	# Obtemos o bin de leitura de porta para windows
	READPORT := ./bin/readport-windows-amd64.exe
else ifeq ($(UNAME_S),Linux)
	# Obtemos o bin de leitura de porta para linux
	READPORT := ./bin/readport-linux-amd64
else ifeq ($(UNAME_S),Darwin)
	# Obtemos o bin de leitura de porta para darwin (MacOS)
	READPORT := ./bin/readport-darwin-amd64
else
	# Imprimimos um erro de sistema operacional não reconhecido
	$(error Unknown operating system: $(UNAME_S))
endif

define check_env_param
	@echo "Getting env name argument..."

	# Verificamos a ENV passada no argumento
	@if [ -z "$(ENV)" ]; then \
		@echo "Error: No ENV argument provided. Usage: make run ENV=value"; \
		exit 1; \
	fi
endef

define check_json_exists
	echo "Checking if json ./gopen/$(ENV)/.json exists..."

	# Verificamos se o json de configuração existe pelo nome do ambiente passado
	@if [ ! -f "./gopen/$(ENV)/.json" ]; then \
		echo "Error: File ./gopen/$(ENV)/.json does not exist"; \
		exit 1; \
	fi
endef

define get_port_by_json
	echo "Getting port from json ./gopen/$(ENV)/.json..."

	# Definindo uma variável temporária para armazenar a saída do comando
	$(eval TEMP_PORT := $(shell ./$(READPORT) ./gopen/$(ENV)/.json 2>/dev/null))

	# Verifica se o comando foi bem-sucedido e a variável TEMP_PORT não está vazia
	$(eval PORT := $(if $(TEMP_PORT),$(TEMP_PORT),$(error Error to read port on ./gopen/$(ENV)/.json)))
endef

define docker_build
	echo "Starting docker build with ENV=$(ENV) and IMAGE=$(IMAGE)"

	# Inicializamos o build do dockerfile
	docker build -t $(IMAGE) .
endef

define docker_run
	echo "Starting docker container with ENV=$(ENV), PORT=$(PORT), IMAGE=$(IMAGE) and CONTAINER=$(CONTAINER)..."

	docker run --name $(CONTAINER) -p $(PORT):$(PORT) -e ENV_NAME=$(ENV) $(IMAGE)
endef

define docker_compose
	echo "Starting docker-compose with ENV=$(ENV) and PORT=$(PORT)..."

	# Inicializamos o docker-compose com o nome do ambiente e a porta configurada
	ENV_NAME=$(ENV) PORT=$(PORT) docker-compose up
endef

# Comando para gerar imagem
build:
	$(call check_env_param)
	$(call check_json_exists)
	$(call docker_build)

# Comando para gerar imagem e executar ela em container local
deploy:
	$(call check_env_param)
	$(call check_json_exists)
	$(call docker_build)
	$(call get_port_by_json)
	$(call docker_run)

# Comando para executar a API Gateway via docker
run:
	$(call check_env_param)
	$(call check_json_exists)
	$(call get_port_by_json)
	$(call docker_compose)

