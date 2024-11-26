# compute-engine-init

## CentOS Stream 9 init

### 1. Add SSH key to remote server

```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub chicunic@<remote-server>
```

### 2. Disable sudo password

```bash
sudo visudo
```

### 3. Disable root password & password authentication

Update `/etc/ssh/sshd_config`

```txt
PermitRootLogin no
PasswordAuthentication no
```

### 4. Install useful packages

Execute `1-init.sh`

### 5. Install oh-my-zsh

Switch to root user for the following commands

```bash
sudo su
```

Install oh-my-zsh

```bash
dnf install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install p10k

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Set `ZSH_THEME="powerlevel10k/powerlevel10k"` in `~/.zshrc`

Copy `.p10k.zsh` in home folder and add the followings in `~/.zshrc`

```txt
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
```
