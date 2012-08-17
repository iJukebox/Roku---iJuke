Function Update_Status(host_id, media, num)
    
    xfer = CreateObject("roURLTransfer")
    xfer.setURL("http://107.21.234.150/GIT/account/webservice/Player/updateSongStatus.php?host_id=" + host_id + "&track_id=" + media["track_id"] + "&queue_id=" + media["queue_id"] + "&requested=" + media["requested"] + "&status=" + num)
    'create a simple URL transfer to make the http POST to the webservice
    xmlraw = xfer.GetToString()
    'mainly used to make the POST and return the raw string, nothing needs to be done with this for
    'now
    print xmlraw
    'can pring the raw xml to the debugger, useful for debugging
End Function
'Method Simply update's the status of the song played, either to 3 for now playing, or 1 for played