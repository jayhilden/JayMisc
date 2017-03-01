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
alias dns="cd C:/_GIT/Verify.Lexmark.CloudAuthentication"
alias inv="cd C:/_GIT/Verify.Microsite.InvestigatorMobileApp"
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
alias pi="cd c:/_GIT/Verify.PartnerIntegration"
alias domain="cd c:/_GIT/Verify.Shared.Domain"
alias api="cd c:/_GIT/Verify.Shared.API"
alias co="git checkout"
alias start="git flow feature start"
alias branch="git checkout -b"
alias branchcleanup='git branch --merged develop | egrep -v "develop|master" | xargs -n 1 git branch -d'

publish () {
  git push -u origin $(git rev-parse --abbrev-ref HEAD);
}

vplocalconfig() {
    sed -bi 's/@dtipp-rabbitmq.verifybrand.com/@localhost/' src/Application/WindowsService/App.config src/Application/Website/Web.config
}
