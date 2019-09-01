build:
	docker build -t pgoodjohn/node:12.9 .

push: build
	docker push pgoodjohn/node:12.9


# For every dockerfile we create and push the image
# VERSION=$(echo $1 | sed -e "s/Dockerfile-//g")

# echo "Building $1 to $REPOSITORY/$NAME:$VERSION"
# docker build -t $REPOSITORY/$NAME:$VERSION .

# docker push $REPOSITORY/$NAME:$VERSION
