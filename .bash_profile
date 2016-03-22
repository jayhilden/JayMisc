#general linux stuff
alias dir="ls -la"
alias docker="sudo docker"

# git stuff
alias flow="git flow"
alias dir="ls -la"
alias go="cd c:\_GIT"
alias stat="git status"
alias fetch="git fetch"
alias add="git add -A"
alias commit="git commit -m"
alias sfcm="cd c:/_GIT/Verify.SFCM"
alias workflow="cd C:/_GIT/Verify.Workflow"
alias vp="cd C:/_GIT/Verify.Platform"
alias resetconfig="git checkout -- src/Application/Website/Web.config src/Application/WindowsService/App.config"
alias elmah="cd C:/_GIT/Elmah.Io.ElasticSearch"
alias diff="git diff"
alias pull="git pull"
alias push="git push"
alias develop="git checkout develop;pull"
alias master="git checkout master;pull"
alias reset="git reset --hard"
alias ct="cd c:/_GIT/Verify.ClaimTransformer"
alias identity="cd c:/_GIT/Verify.Identity"
alias co="git checkout"
alias start="git flow feature start"
alias branch="git checkout -b"
alias branchcleanup='git branch --merged develop | egrep -v "develop|master" | xargs -n 1 git branch -d'

publish () {
  git push -u origin $(git rev-parse --abbrev-ref HEAD);
}

