Function Change_Content(player, Host_Data)
        'req = ("http://107.21.234.150/GIT/account/webservice/Player/login.php?device_id=" + getId())                                
        media_req = "http://107.21.234.150/GIT/account/webservice/Player/getNextSong.php?host_id=" + Host_Data["host_id"] + "&session_id=" + Host_Data["session_id"]
        media_loc = MLocation_Request(media_req)
        player.setContent({
        stream: {
            url: media_loc["location"]
                }
            streamFormat: "mp4"
                        })
    print "this is the change loop"
    print media_loc["location"]
    print media_loc["track_id"]
    now_playing = "3"
    Update_Status(Host_Data["host_id"], media_loc, now_playing)
   return media_loc

End Function