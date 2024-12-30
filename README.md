# NPM Scripts Autocomplete

## How to use it?

You can either use the `install.sh` script or run each of these commands manually.

### 1. Clone the repository:
```bash
sudo git clone git@github.com:giovannism20/complete-based-package-json.git /opt/complete-based-package-json
```

### 2. Update script permission:
```
sudo chmod +x /opt/complete-based-package=json/npm-run-autocomplete.sh
```

### 3. Add to .bashrc or .zshrc:
### Bash users:
```
echo "source /opt/complete-based-package-json/npm-run-autocomplete.sh" >> ~/.bashrc
```
### ZSH users:
```
echo "source /opt/complete-based-package-json/npm-run-autocomplete.sh" >> ~/.zshrc
```

### 4. Or run install.sh:
```
sudo sh /opt/complete-based-package-json/install.sh
```

### Dependencies:
### You maybe need to install `jq` which is used to read scripts key
### On debian-based distros run: ```sudo apt install jq```
### On red hat-based distros run: ```sudo dnf install jq```
### On mac with homebrew: ```brew install jq```
