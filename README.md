Android Debug Bridge Bash Completition
======================================
This script is a simple bash completition file, which allows you to easier work with `adb`.
For example you can now:

```
ktoso@dynames $ adb -s 
037c70c44240f517  HT9C3L902456      

ktoso@dynames $ adb -s H<TAB>
ktoso@dynames $ adb -s HT9C3L902456 <TAB>
bugreport        disconnect       get-serialno     install          logcat           push             remount          start-server     uninstall        wait-for-device  
connect          emu              get-state        jdwp             ppp              rcpip            root             status-window    usb              
devices          forward          help             kill-server      pull             reboot           shell            sync             version          
ktoso@dynames $ adb -s HT9C3L902456 sh<TAB>
ktoso@dynames $ adb -s HT9C3L902456 shell 
$ 
```

Install How-To
--------------
Installation is fairly simple, just make sure you have bash-completition installed and then:

```
ktoso $ su - 
root # cd /etc/bash_completion.d/
root # wget https://github.com/ktoso/adb-bash_autocomplete/raw/master/adb
root # exit
ktoso $ echo "done!"
```
