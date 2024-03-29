# How to:
### ATENTION! This guide is assuming that you are running the Server on a Linux system! Steps will be different on other OSes.
- You should also already know how to setup a PamerMC/Spigot Minecraft Server and Waterfall/Bungeecord.
- Being somewhat familiar with Linux will also help a lot.
## Setting up the real server
- Enable WoL on your server PC you plan to wake up. Depends from PC to PC so you are on your own.
- Setup your Server. I'm using Paper in this guide so I'll use it to explain from now on! You can get PaperMC here: https://papermc.io/downloads Instructions to set up: https://paper.readthedocs.io/en/latest/server/index.html
- Make a start script for the server. We'll need it later!
- Now you should have a regular PaperMC Minecraft server. In this guide we will set this Server up to be run automatically when the PC boots up and powers off after a while when no one is connected anymore.
- To do this I use the "AutoStop" Plugin: https://github.com/pmdevita/AutoStop/releases
- Download and install this plugin. Change the config as you desire.
- Now your Server should automatically stop when noone is connected for a while. We want it to power off though! You should have a Shell script to start your Server. You have to add the "poweroff" (or different command dapending on your init system. If you dont know what I'm talking about, you are probably running systemd and can use said previous command.) to the bottom of the file. This should power off the PC when the Minecraft Server stops.
- I recommend adding a delay before powering off so you can cancel it to maintain your PC for example. For this add something like "sleep 15" on a line before the "poweroff" command. Additionally you can use the echo command to print to the console that it's about to power off.


## Editing the Waterfall JAR
- Download the latest release of Waterfall: https://papermc.io/downloads#Waterfall
- Extract the messages.properties from the JAR with an archiver application.

   ![Screenshot_20210629_195612](https://user-images.githubusercontent.com/33175205/123845085-10d68680-d914-11eb-8d09-160bd86f9f3d.png)
   
- Open up the extracted messages.properties in a text editor. 
- Find the "fallback_kick" option and change the message to make it clear that the player has to reconnect in a bit. Example:

   ![Screenshot_20210629_200353](https://user-images.githubusercontent.com/33175205/123845997-239d8b00-d915-11eb-9e30-c80b66317e56.png)
- Now search for the "ping_cannot_connect" option and change it. This is going to be the MOTD that is displayed, when the server _isn't_ running. (Tipp: You can use an online MOTD generator.) I'd recommend making it clear in the MOTD that the player has to join to start the server. Example:

   ![Screenshot_20210629_200929](https://user-images.githubusercontent.com/33175205/123846635-eb4a7c80-d915-11eb-81d6-e96d74f1229f.png)
- Change other messages if you so desire :)
- Save the file.
- Now we have to put your altered version of "messages.properties" back into the JAR. For that we can use the following command in the terminal: "jar of waterfall-*.jar messages.properties".

## Configuring Waterfall (to connect to the real server)
- Now configure waterfall as usual to start and connect to your server. If you don't know how, here's some links that might help you: 
  - https://paper.readthedocs.io/en/latest/waterfall/index.html
  - https://www.spigotmc.org/wiki/bungeecord-configuration-guide/

## Wake the Server when a player joins
- Hopefully you now have a working waterfall configuration which you can join if the real Server PC is already running.
- Now we have to start the real PC automatically when someone joins. Put the WakeServerOnJoin.sh script into the foler you previously setup waterfall in.
- Open the script in a text editor and adjust the values. Put the MAC adress of the PC you want to start when someone joins and the path to waterfalls logfile. Example:
![Screenshot from 2021-11-21 11-35-47](https://user-images.githubusercontent.com/33175205/142758500-d7a9bfa1-4c16-4baa-abc5-fcac4fc2455b.png)
- Uncomment which command you want to use to send a WoL signal. "wakeonlan" is uncommented by default!
![Screenshot from 2021-11-21 11-47-49](https://user-images.githubusercontent.com/33175205/142758834-43cec19c-d937-46b7-be87-e271802ffa33.png)
- Save the file and give it permissions to run: "chmod +x WakeServerOnJoin.sh"
- Run it with "./WakeServerOnJoin.sh" (Make sure that Waterfall is already running!)
- If everything worked the real server schould now start. After waiting a short amount of time you should be able to reconnect and be forwarded to the real Server. Bravo! You are done.
