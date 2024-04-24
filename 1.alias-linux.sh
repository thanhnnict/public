#. IV. link folder

# ln -s /mnt/c/Users/goku-/01-OneDrive-NGS ~/01-OneDrive-NGS
# ln -s  /mnt/c/Users/goku-/.kube ~/.kube

# V. completion
### completion ###
mv ~/.vimrc ~/bk`date +%y%m%d-%H%M`.vimrc
cat << EOF >> ~/.vimrc
set backspace=indent,eol,start
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

cp ~/.bashrc ~/bk`date +%Y%m%d-%H%M`.bashrc 
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
source ~/.bashrc
touch ~/.persistent.pwd
cat << EOF >> ~/.bashrc
# Shortcut for mycloud
alias goku='cd /mnt/c/Users/goku-'
alias gohelm='cd ~/01-OneDrive-NGS/1.Infrastructure/1.DevOps/3.Helm-addons'
alias go-gcp='cd ~/01-OneDrive-NGS/1.Infrastructure/2.Resource-compute/10.terraform/'

# ## Persistent environment ###
# alias gopwd='cd "\`cat ~/.persistent.pwd\`"'
# alias getpwd='cat ~/.persistent.pwd'
# alias setpwd="pwd > ~/.persistent.pwd"
## Persistent environment ###
alias gopwd='eval "cd \`cat ~/01-OneDrive-NGS/.persistent.pwd\`"'
alias getpwd='cat ~/01-OneDrive-NGS/.persistent.pwd'
# alias setpwd="pwd | sed -e 's/\\/Users\\/goku/\\\$HOME/g' > ~/01-OneDrive-NGS/.persistent.pwd"
alias setpwd="pwd | sed -e 's/\\/Users\\/goku/~/g' > ~/01-OneDrive-NGS/.persistent.pwd"

# Alias for docker
alias dce="docker compose"

EOF
source ~/.bashrc
