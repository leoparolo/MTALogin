Este resource necesita permisos para poder crear usuarios por lo que hay que:

1) modificar acl.xml del servidor agregando:
 a)     <group name="LoginResources">
        <acl name="login-permissions"></acl>
        <object name="resource.login"></object>
    </group>

 b) <acl name="login-permissions">
        <right name="function.addAccount" access="true"></right>
        <right name="function.logIn" access="true"></right>
        <right name="general.adminpanel" access="false"></right>
        <right name="general.tab_players" access="false"></right>
        <right name="general.tab_resources" access="false"></right>
        <right name="general.tab_maps" access="false"></right>
        <right name="general.tab_server" access="false"></right>
        <right name="general.tab_bans" access="false"></right>
        <right name="general.tab_adminchat" access="false"></right>
        <right name="command.kick" access="false"></right>
        <right name="command.freeze" access="false"></right>
        <right name="command.mute" access="false"></right>
        <right name="command.setnick" access="false"></right>
        <right name="command.shout" access="false"></right>
        <right name="command.spectate" access="false"></right>
        <right name="command.slap" access="false"></right>
        <right name="command.setgroup" access="false"></right>
        <right name="command.sethealth" access="false"></right>
        <right name="command.setarmour" access="false"></right>
        <right name="command.setmoney" access="false"></right>
        <right name="command.setskin" access="false"></right>
        <right name="command.setteam" access="false"></right>
        <right name="command.giveweapon" access="false"></right>
        <right name="command.setstat" access="false"></right>
        <right name="command.jetpack" access="false"></right>
        <right name="command.warp" access="false"></right>
        <right name="command.setdimension" access="false"></right>
        <right name="command.setinterior" access="false"></right>
        <right name="command.createteam" access="false"></right>
        <right name="command.destroyteam" access="false"></right>
        <right name="command.givevehicle" access="false"></right>
        <right name="command.repair" access="false"></right>
        <right name="command.blowvehicle" access="false"></right>
        <right name="command.destroyvehicle" access="false"></right>
        <right name="command.customize" access="false"></right>
        <right name="command.setcolor" access="false"></right>
        <right name="command.setpaintjob" access="false"></right>
        <right name="command.listmessages" access="false"></right>
        <right name="command.readmessage" access="false"></right>
        <right name="command.listresources" access="false"></right>
        <right name="command.start" access="false"></right>
        <right name="command.stop" access="false"></right>
        <right name="command.stopall" access="false"></right>
        <right name="command.delete" access="false"></right>
        <right name="command.restart" access="false"></right>
        <right name="command.aclmanager" access="false"></right>
        <right name="command.aclcreate" access="false"></right>
        <right name="command.acldestroy" access="false"></right>
        <right name="command.acladd" access="false"></right>
        <right name="command.aclremove" access="false"></right>
        <right name="command.setpassword" access="false"></right>
        <right name="command.setwelcome" access="false"></right>
        <right name="command.setgame" access="false"></right>
        <right name="command.setmap" access="false"></right>
        <right name="command.setweather" access="false"></right>
        <right name="command.blendweather" access="false"></right>
        <right name="command.setblurlevel" access="false"></right>
        <right name="command.setwaveheight" access="false"></right>
        <right name="command.setskygradient" access="false"></right>
        <right name="command.setgamespeed" access="false"></right>
        <right name="command.setgravity" access="false"></right>
        <right name="command.settime" access="false"></right>
        <right name="command.setfpslimit" access="false"></right>
        <right name="function.shutdown" access="false"></right>
        <right name="command.clearchat" access="false"></right>
        <right name="command.ban" access="false"></right>
        <right name="command.unban" access="false"></right>
        <right name="command.banip" access="false"></right>
        <right name="command.unbanip" access="false"></right>
        <right name="command.banserial" access="false"></right>
        <right name="command.unbanserial" access="false"></right>
        <right name="command.listbans" access="false"></right>
        <right name="command.takescreenshot" access="false"></right>
        <right name="command.deletescreenshot" access="false"></right>
        <right name="command.viewscreenshot" access="false"></right>
        <right name="command.listscreenshots" access="false"></right>
    </acl>