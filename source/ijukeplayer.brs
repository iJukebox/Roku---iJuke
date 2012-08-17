Function displayVideo(Host_Data) as Object
    
        screen = CreateObject("roVideoScreen")
        screen.SetMessagePort(CreateObject("roMessagePort"))
        
        media_loc = Change_Content(screen, Host_Data)
        'req = ("http://107.21.234.150/GIT/account/webservice/Player/login.php?device_id=" + getId())                                
        'media_req = "http://107.21.234.150/GIT/account/webservice/Player/getNextSong.php?host_id=" + Host_Data["host_id"] + "&session_id=" + Host_Data["session_id"]
        'media_loc = MLocation_Request(media_req)
        'thinking about breaking this into a function to avoid having to this data so often.
        'this reacreates the media location, so that when this function is called, it's getting 
        'a new updated media_location each time. This avoid's it calling the same one.

        'screen.SetContent({
        'stream: {
         '   url: media_loc["location"]
          '      }
        'streamFormat: "mp4"
         '               })
       ' print media_loc["location"]
        'print media_loc["track_id"] 
        'really only useful for debugging purposes to made sure the media-locations are returning anything
        
        played = "1" 
        now_playing = "3" 
        'statuses to be used for the update song function
        'need to pass these as strings, passing as an integer adds a space into it which throws-up the
        'http POST later.
        
        'Update_Status(Host_Data["host_id"], media_loc, now_playing)'maybe need to rearrange this funky code... maybe.. YOYOYO
        
        screen.Show()
        
        while (1)
            msg = wait(0, screen.GetMessagePort())
            if msg <> invalid
                'if msg.isFullResult()
                 '   print "this has been paused, yo" 
                        'Update_Status(played, media_loc, aa["host_id"])
                  '      Update_Status(Host_Data["host_id"], media_loc, played)
                        
                        
                        'displayVideo(Host_Data)'MLocation_Request(media_req)["location"],
                       ' media_loc = Change_Content(screen, Host_Data)
                        'Update_Status(Host_Data["host_id"], media_loc, now_playing)
                       ' screen.Show()
                        'Update_Status(now_playing, media_loc, aa["host_id"])
                        'screen.Close()
'                        print "yo"
                     ' when the song ends, this happens
                         if msg.isScreenClosed()
                            Update_Status(Host_Data["host_id"], media_loc, played)
                            print "done"
                            exit while
                             '   if (Check_Play() = false)
                              '      screen.Close()
                               '     exit while
                            'end if
                            
                            'maybe set the update status here as well    
                         end if
                end if
       end while
 
End Function
'This is the tricky method. This creates the player and there was a fair bit of brute force to make
'this work like it does. As of now the best I could do was break it down into as many method's as
'possible to make tracing a little easier... sorry about that. Anyways this is the player. It is 
'created and used to play the song in a loop that listens for event listeners. When the song is ended
'it updates the status of the song, and checks to see if it should continue playing.