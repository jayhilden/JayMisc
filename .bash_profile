#general linux stuff
alias dir="ls -la"
alias docker="sudo docker"


#git stuff
alias flow="git flow"
alias go="cd c:\_GIT"
alias stat="git status"
alias fetch="git fetch"
alias add="git add -A"
alias commit="git commit -am"
alias scc="cd c:/_GIT/SecureCodeControl"
alias workflow="cd C:/_GIT/VerifyPlatformWorkflow"
alias vp="cd C:/_GIT/VerifyPlatform"
alias elmah="cd C:/_GIT/Elmah.Io.ElasticSearch"
alias diff="git diff"
alias pull="git pull"
alias push="git push"
alias develop="git checkout develop;pull"
alias master="git checkout master;pull"
alias reset="git reset --hard"
alias ct="cd c:/_GIT/VerifyClaimTransformer"
alias identity="cd c:/_GIT/VerifyIdentity"
alias co="git checkout"
alias start="git flow feature start"
alias publish="git flow feature publish"
alias branchcleanup='git branch --merged develop | egrep -v "develop|master" | xargs -n 1 git branch -d'
