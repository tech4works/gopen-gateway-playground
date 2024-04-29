.SILENT:

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

# Comando para executar a API Gateway via docker
run:
	echo "Checking you operation system..."
	echo "Operating System: $(UNAME_S)"

	echo "Getting env name argument..."

	# Obtemos o nome do ambiente passado no primeiro argumento no terminal
	$(eval ENV_NAME := $(filter-out $@,$(MAKECMDGOALS)))
	@if [ -z "$(ENV_NAME)" ]; then \
		echo "Error: No argument provided. Usage: make run {env name}"; \
		exit 1; \
	fi

	echo "Checking if json ./gopen/$(ENV_NAME)/.json exists..."

	# Verificamos se o json de configuração existe pelo nome do ambiente passado
	@if [ ! -f "./gopen/$(ENV_NAME)/.json" ]; then \
		echo "Error: File ./gopen/$(ENV_NAME)/.json does not exist"; \
		exit 1; \
	fi

	echo "Getting port from json ./gopen/$(ENV_NAME)/.json..."

	# Obtemos a porta configurada no json, através do binário do sistema operacional
	$(eval PORT := $(shell ./$(READPORT) ./gopen/$(ENV_NAME)/.json))

	echo "Starting docker with ENV_NAME=$(ENV_NAME) and PORT=$(PORT)..."

	# Inicializamos o docker-compose com o nome do ambiente e a porta configurada
	ENV_NAME=$(ENV_NAME) PORT=$(PORT)  docker-compose up
%:
	@: