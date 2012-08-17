Function Check_play()

    play = CreateObject("roURLTransfer")
    play.setURL("http://107.21.234.150/GIT/account/webservice/Player/getDeviceStatus.php?device_id=" + getID())
    'create a simple URL transfer for the http POST
    raw = play.GetToString()
    print raw
    'prints the raw xml, really only useful for debugging
    
    xml = CreateObject("roXMLElement")
    xml.Parse(raw)
    'parse the raw xml into something to be used
    stat = xml.status.getText()
    'parse for the "satus" tag and return the text as a string to be compared
    
    if (stat = "1")
        return true
        else
            return false
            'this makes it so if the xml dies it won't infinite loop
        end if
        'if status returns "1" the method will return true

End Function
'Method Requests the web-service and returns a boolean to see if it has given the "Ok" 
'to start playing. This simulates the vision that on can control the roku from the web-service.