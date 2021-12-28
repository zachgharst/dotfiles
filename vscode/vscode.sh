# Install the apt repository
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# Install VSCode
sudo apt install apt-transport-https
sudo apt update
sudo apt install code

# Install VSCode extensions
code --install-extension cmstead.js-codeformer
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension dbaeumer.vscode-eslint
code --install-extension donjayamanne.githistory
code --install-extension eamodio.gitlens
code --install-extension golang.go
code --install-extension GrapeCity.gc-excelviewer
code --install-extension GraphQL.vscode-graphql
code --install-extension humao.rest-client
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension vscodevim.vim

# Disable all extensions and enable them per workspace
code --disable-extensions