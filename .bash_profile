. .bashrc
alias dir="ls -la"
alias stat="git status"
alias fetch="git fetch"
alias add="git add -A"
#alias commit="git commit -m"
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

commit () {
  local branch=$(git rev-parse --abbrev-ref HEAD);
  local fullmsg;
  if [[ $branch == *"DE"* || $branch == *"US"* ]];
    then fullmsg="$branch $1";
  else
    fullmsg=$1;
  fi;
  git commit -m "$fullmsg";
}

#vplocalconfig() {
#    sed -bi 's/@dtipp-rabbitmq.verifybrand.com/@localhost/' src/Application/WindowsService/App.config src/Application/Website/Web.config
#}
