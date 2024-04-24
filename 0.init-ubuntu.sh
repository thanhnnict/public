### Initial Ubuntu ###
#. I. update system
sudo apt update -y && sudo apt upgrade -y
sudo apt-get install bash-completion -y
#. II. Install docker lastest
# 1. Remove old docker installed 
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg -y; done
# ---
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh &


### final enable docker and grant docker command for user ###
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
# ## newgrp docker &

#. III. Install kubernetes client tools
#1. Kubectl
# curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
   

# curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
   
# echo "$(cat kubectl.sha256) kubectl" | sha256sum --check

# sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

#From <https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/> 
sudo snap install kubectl --classic

#install helm linux
#Saturday, May 27, 2023
#5:39 PM
#1. Windows - install via choco - view HELM choco tab
#2. Linux
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
sudo ./get_helm.sh

#. IV. link folder

ln -s /mnt/c/Users/goku-/01-OneDrive-NGS ~/01-OneDrive-NGS
ln -s  /mnt/c/Users/goku-/.kube ~/.kube

# V. completion
### completion ###
mv ~/.vimrc ~/bk`date +%y%m%d-%H%M`.vimrc
cat << EOF >> ~/.vimrc
syntax on
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set bg=dark
set nowrap
set paste
set expandtab
EOF

cp ~/.bashrc ~/bk`date +%y%m%d-%H%M`.bashrc 
cat << EOF >> ~/.bashrc
# completion kubernetes
export do='--dry-run=client -o yaml'
export now='--force --grace-period 0'
export try='--restart=Never --rm -it'
source /etc/bash_completion
source <(kubectl completion bash)
source <(helm completion bash)
alias k=kubectl
complete -F __start_kubectl k
alias kc='kubectl config'
alias kcl='kubectl config get-contexts'
alias kcn='kubectl config set-context --current --namespace '
alias kcc='kubectl config use-context '
alias vi=vim
alias now='date +%y%m%d-%H%M'
# kubectl edit with vscode
export KUBE_EDITOR='code --wait'

EOF
# source ~/.bashrc
touch ~/.persistent.pwd
cat << EOF >> ~/.bashrc
# Shortcut for mycloud
alias goku='cd /mnt/c/Users/goku-'
alias gohelm='cd ~/01-OneDrive-NGS/1.Infrastructure/1.DevOps/3.Helm-addons'
alias go-gcp='cd ~/01-OneDrive-NGS/1.Infrastructure/2.Resource-compute/10.terraform/'

## Persistent environment ###
alias gopwd='cd "\`cat ~/.persistent.pwd\`"'
alias getpwd='cat ~/.persistent.pwd'
alias setpwd="pwd > ~/.persistent.pwd"

# Alias for docker
alias dce="docker compose"

EOF
source ~/.bashrc
