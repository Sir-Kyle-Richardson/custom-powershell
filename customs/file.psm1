function open-test($file) {
    $baseDir = Get-Location;
    $result = Get-ChildItem -Path $baseDir -Recurse -Filter "*test*"  | where { 
        $_.FullName -match $file;
    }

    Write-Output $result.FullName;

    code $result.FullName;
}

function open-file($file) {
    $baseDir = Get-Location;
    $result = Get-ChildItem -Path $baseDir -Recurse | where { 
        $_.FullName -match $file;
    }

    Write-Output $result.FullName;

    code $result.FullName;
}

function make-and-open($path) {
    New-Item $path;
    code $path;
}