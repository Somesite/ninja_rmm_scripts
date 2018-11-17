# Script:	Download Anything.ps1
# Purpose:  Downloads a file from the web to the specified file path.
# Notes:    Simply change the "URL" on line 7 to the direct download path and the "PATH" on line 8 to the path and filename where you wish to save the download. Must keep quotes.
#			-Get-URL http://website.com/downloads/Iwantthisfile.txt thisfile.txt
#			-Get-URL http://website.com/downloads/Iwantthisfile.txt C:\myfolder\thisfile.txt

    $url = "http://website.com/downloads/Iwantthisfile.txt"
    $path = "C:\temp\thisisthefile.txt"
   # param([string]$url, [string]$path)
     
    if(!(Split-Path -parent $path) -or !(Test-Path -pathType Container (Split-Path -parent $path))) {
      $path = Join-Path $pwd (Split-Path -leaf $path)
    }
     
    "Downloading [$url]`nSaving at [$path]"
    $client = new-object System.Net.WebClient
    $client.DownloadFile($url, $path)
    #$client.DownloadData($url, $path)
     
    $path