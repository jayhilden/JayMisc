. .bashrc
alias dir="ls -la"
alias stat="git status"
alias fetch="git fetch"
alias add="git add -A"
alias commit="git commit -m"
alias diff="git diff"
alias pull="git pull"
alias push="git push"
alias mainline="git checkout mainline;pull"
alias reset="git reset --hard"
alias co="git checkout"
alias branch="git checkout -b"
alias branchcleanup='git branch --merged develop | egrep -v "develop|master" | xargs -n 1 git branch -d'

publish () {
  git push -u origin $(git rev-parse --abbrev-ref HEAD);
}

#vplocalconfig() {
#    sed -bi 's/@dtipp-rabbitmq.verifybrand.com/@localhost/' src/Application/WindowsService/App.config src/Application/Website/Web.config
#}
