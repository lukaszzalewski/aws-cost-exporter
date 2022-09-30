NAME:='aws-cost-exporter'
VERSION:=0.3.6
DOCKER_PUSH_NAME:=912561963746.dkr.ecr.us-east-1.amazonaws.com/aws-cost-exporter

working-dir:
	@mkdir -p output
	@rm -fr output/*

build: working-dir
	@cd cmd/${NAME} && \
	 CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' -o ${NAME}

dockerize: build
	@mv cmd/${NAME}/${NAME} output/ && cp Dockerfile output/ && cp -r configs/queries output/
	@cd output && docker build -t ${NAME}:${VERSION} .

docker-upload: dockerize
	@docker tag ${NAME}:${VERSION} ${DOCKER_PUSH_NAME}:${VERSION}
	@docker push ${DOCKER_PUSH_NAME}:${VERSION}