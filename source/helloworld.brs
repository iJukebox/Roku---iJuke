Sub Main()

    initTheme() 
    screenFacade = CreateObject("roPosterScreen")
    screenFacade.show()
    
    ' set's up the basic background screen
    
    itemVenter = { ContentType:"episode" 'just controls how the icon looks, looks better as an episode
               SDPosterUrl:"file://pkg:/images/iJuke_logo.png"
               'set a standard definition image to use
               HDPosterUrl:"file://pkg:/images/iJuke_logo.png"
               'set a high definition image to use
               IsHD:False
               HDBranded:False
               ShortDescriptionLine1:"What will you do?"
               ShortDescriptionLine2:""
               Description:"iJuke has come to the Roku, because we are just that determined to bring the music to you"
               Title:"Fire it up!"
               }
    
    showSpringboardScreen(itemVenter)
    screenFacade.showMessage("")
    sleep(25)
End Sub

Sub initTheme()

    app = CreateObject("roAppManager")
    theme = CreateObject("roAssociativeArray")

    theme.OverhangPrimaryLogoOffsetSD_X = "72"
    theme.OverhangPrimaryLogoOffsetSD_Y = "15"
    theme.OverhangSliceSD = "pkg:/images/16.jpg"
    theme.OverhangPrimaryLogoSD  = "pkg:/images/16.jpg"

    theme.OverhangPrimaryLogoOffsetHD_X = "123"
    theme.OverhangPrimaryLogoOffsetHD_Y = "20"
    theme.OverhangSliceHD = "pkg:/images/big_dark.png"
    theme.OverhangPrimaryLogoHD  = "pkg:/images/playlist_logo_placeholder.png"
    
    app.SetTheme(theme)

End Sub

Function showSpringboardScreen(item as object) As Boolean
    port = CreateObject("roMessagePort")
    screen = CreateObject("roSpringboardScreen")
    
    print "showSpringboardScreen"
    
    screen.SetMessagePort(port)
    screen.AllowUpdates(false)
    if item <> invalid and type(item) = "roAssociativeArray"
        screen.SetContent(item)
    endif
    
           
    req = ("http://107.21.234.150/GIT/account/webservice/Player/login.php?device_id=" + getId())
    Host_Data = CreateObject("roAssociativeArray")
    Host_Data = Host_Request(req)                                    
    'media_req = "http://107.21.234.150/GIT/account/webservice/Player/getNextSong.php?host_id=" + aa["host_id"] + "&session_id=" + aa["session_id"]  
   ' media_loc = MLocation_Request(media_req) ' returns the media location to be used for the player
   ' played = "1"
   ' now_playing = "3"
    'need to make these strings, passing integers adds a space to it, which throws off the url
    
    screen.SetBreadcrumbText("iJukeBox", "Get Excited")
    screen.ClearButtons()
   ' screen.AddButton(1, "Fire it up!")'aa["host_id"]
    'screen.AddButton(2, getID())'aa["session_id"]
    screen.SetStaticRatingEnabled(false)
    screen.AllowUpdates(true)
    screen.Show()
    'set's the background text and whatnot
    downKey=3
    selectKey=6
 
    while true
        if (Check_Play())
            displayVideo(Host_Data)'media_loc,
            print "yo"
            else
                sleep(5000)
                'the number of seconds (in milliseconds) for the loop to wait upon receiving a false
                print "haha, Peter you're the greatest"
                'because it's true
        end if 
        ' a conditional based on the boolean of Check_play() which sees if it is okay to start playing
     
    end while
    'magical loop that makes the roku request the web service every so many seconds to see if it
    'should start playing, and after every song is played to see if it should stop playing.

End Function


