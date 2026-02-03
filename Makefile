build:
	docker build -t opencode-container -f Containerfile .
	$(MAKE) addbin addbin-git
	
addbin:
	echo "Adding opencode to ~/.local/bin/opencode"
	cp scripts/opencode ~/.local/bin/opencode
	chmod +x ~/.local/bin/opencode

addbin-git:
	echo "Adding opencode-git to ~/.local/bin/opencode-git"
	cp scripts/opencode-git ~/.local/bin/opencode-git
	chmod +x ~/.local/bin/opencode-git

removebin:
	rm -f ~/.local/bin/opencode
	rm -f ~/.local/bin/opencode-git
