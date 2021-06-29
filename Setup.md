# How to set up
## Editing the Waterfall JAR
- Download the latest release of Waterfall: https://papermc.io/downloads#Waterfall
- Extract the messages.propertis from the JAR with an archiver application.

   ![Screenshot_20210629_195612](https://user-images.githubusercontent.com/33175205/123845085-10d68680-d914-11eb-8d09-160bd86f9f3d.png)
   
- Open up the extracted pessages.properties in a text editor. 
- Find the "fallback_kick" option and change the message to make it clear that the player has to reconnect in a bit. Example:

   ![Screenshot_20210629_200353](https://user-images.githubusercontent.com/33175205/123845997-239d8b00-d915-11eb-9e30-c80b66317e56.png)
- Now search for the "ping_cannot_connect" option and change it. This is going to be the MOTD that is displayed, when the server _isn't_ running. (Tipp: You can use an online MOTD generator.) I'd recommend making it clear in the MOTD that the player has to join to start the server. Example:

   ![Screenshot_20210629_200929](https://user-images.githubusercontent.com/33175205/123846635-eb4a7c80-d915-11eb-81d6-e96d74f1229f.png)
- Change other messages if you so desire :)
- Save the file.
- Now we have to put your altered version of "messages.propertis" back into the JAR. For that we can use the following command in the terminal: "jar uf waterfall-*.jar messages.properties"
