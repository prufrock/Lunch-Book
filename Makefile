REPO = dkanen
VERSION = v0.01
IMAGE=lunch-book

build: build-image

push: push-image

release: build push

clean:
		@docker images --format '{{.Repository}} {{.ID}}' | grep "$(REPO)/$(IMAGE)" | awk '{print $$2}' | xargs -n 1 docker rmi -f 2>/dev/null || true;
		@echo clean: done

build-image:
		docker build --rm -t $(REPO)/$(IMAGE) .
		docker tag $(REPO)/$(IMAGE) $(REPO)/$(IMAGE):$(VERSION)

push-imgae:
		docker push $(REPO)/$(IMAGE):$(VERSION)
		docker push $(REPO)/$(IMAGE):latest
