#!/bin/bash

# Define Go version
GO_VERSION=1.22.1

# Download Go tarball
wget https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz

# Extract the tarball to /usr/local
sudo tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz

# Add Go to PATH in .profile or .bashrc
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile
echo "export PATH=\$(go env GOPATH)/bin:$PATH" >> ~/.profile
source ~/.profile

# Remove the downloaded tarball
rm go${GO_VERSION}.linux-amd64.tar.gz

# Verify installation
echo "Go version: $(go version)"

# Install xk6
go install go.k6.io/xk6/cmd/xk6@latest

# Install k6
xk6 build v0.46.0 --with github.com/avitalique/xk6-file@latest

# Verify installation
echo "k6 version: $(./k6 version)"

# move k6 to /usr/local/bin
sudo mv ./k6 /usr/local/bin
