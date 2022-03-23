function keep-alive { 

begin{ write-host "Starting.."
       Start-Process "https://en.wikipedia.org/wiki/Special:Random#/random" -WindowStyle Maximized
      }   

process{

while ( 1 -gt 0 ) {

$NameList='en.wikipedia.org',’www.facebook.com’,'twitter.com',’www.amazon.com’,'www.youtube.com','www.google.com','www.microsoft.com','vpn.pgh2o.com'

$ServerName = Get-Random -InputObject $NameList

#$ServerName 

    if (Test-Connection -computername $ServerName -Count 1 -Quiet)
    { #cls
    write-host (Get-Date -format "HH:mm:ss")  $ServerName "is okay."
    }
    else 
    {
    write-host (Get-Date -format "HH:mm:ss")  $ServerName "is unreachable."
    }

  $KeyList = "{HOME}","{END}","{ESC}","{F5}","{PGDN}","{PGUP}"
  $KeyStoke = Get-Random -InputObject $KeyList
  $myshell = New-Object -com "Wscript.Shell"
  $myshell.sendkeys($KeyStoke)

  Start-Sleep -Seconds 3
}
}

}

keep-alive
