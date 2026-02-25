build:
	docker build -t opencode-container -f Containerfile .
	$(MAKE) addbin addbin-auth addbin-git

build-java:
	docker build -t opencode-container-java -f Containerfile-java .
	$(MAKE) addbin addbin-auth addbin-git addbin-java addbin-java-git
	
addbin: ensure-local-bin
	echo "Adding opencode to ~/.local/bin/opencode"
	cp scripts/opencode ~/.local/bin/opencode
	chmod +x ~/.local/bin/opencode

addbin-git: ensure-local-bin
	echo "Adding opencode-git to ~/.local/bin/opencode-git"
	cp scripts/opencode-git ~/.local/bin/opencode-git
	chmod +x ~/.local/bin/opencode-git

addbin-auth: ensure-local-bin
	echo "Adding opencode-auth to ~/.local/bin/opencode-auth"
	cp scripts/opencode-auth ~/.local/bin/opencode-auth
	chmod +x ~/.local/bin/opencode-auth

addbin-java: ensure-local-bin
	echo "Adding opencode-java to ~/.local/bin/opencode-java"
	cp scripts/opencode-java ~/.local/bin/opencode-java
	chmod +x ~/.local/bin/opencode-java

addbin-java-git: ensure-local-bin
	echo "Adding opencode-java-git to ~/.local/bin/opencode-java-git"
	cp scripts/opencode-java-git ~/.local/bin/opencode-java-git
	chmod +x ~/.local/bin/opencode-java-git


ensure-local-bin:
	mkdir -p ~/.local/bin

removebin:
	rm -f ~/.local/bin/opencode
	rm -f ~/.local/bin/opencode-auth
	rm -f ~/.local/bin/opencode-git
	rm -f ~/.local/bin/opencode-java
	rm -f ~/.local/bin/opencode-java-git
