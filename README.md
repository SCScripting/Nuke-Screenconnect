Used for removing Malicious Embedded Screenconnect instances

Sometimes these malicious instances will use an exploit (related to the domain deployment credential process) to embed screenconnect with certain core windows systems. 
Normally, standard uninstall fails, deleting files are forbidden, and any sort of forced registry or Powershell commands will brick Windows. 
This process will force remove ALL Screenconnect instances without damaging Windows. 

(Original process: https://silentinstallhq.com/connectwise-control-screenconnect-silent-uninstall-powershell/)



****HOW TO: ****

Download files to C:\Downloads (not C:\Users\%users%\Downloads, it will not work there)
Run "NukeScreenconnect.ps1"
Await output showing success. 

**WARNING**
This will remove ALL Screenconnect instances. If you are using screenconnect for remote access, verify that alternate remote access is installed. 
Or not, I can't tell you how to live your life. 

At some point in the future I will automate it into a single line run. This is just a repository for internal tools. 
