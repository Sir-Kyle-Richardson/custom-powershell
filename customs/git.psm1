function gitDeleteAllBranchesLike($branchNamePart) {
    git branch -D ((git branch | Select-String -Pattern $branchNamePart) | foreach { $_.ToString().Trim() });
}

function gitCheckoutBranchLike($branchNamePart) {
    git checkout ((git branch | Select-String -Pattern $branchNamePart) | foreach { $_.ToString().Trim() });
}

function gitCurrentBranch() {
    git rev-parse --abbrev-ref HEAD;
}

function fetchMerge($branch) {
    git fetch -p origin;
    git merge origin/$branch;
}

function openBranchInBrowser() {
    $currentBranch = gitCurrentBranch;
    $originUrl = gitOriginUrl;
    start chrome "$originUrl/tree/$currentBranch";
}

function gitPushOrPullCurrent($pushOrPull) {
    git $pushOrPull origin (gitCurrentBranch);
}

function gitOriginUrl {
    git remote get-url origin;
}

function gitStats {
    git diff --stat 4b825dc642cb6eb9a060e54bf8d69288fbee4904
}

Export-ModuleMember -Variable * -Function * -Alias *