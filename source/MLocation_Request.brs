Function MLocation_Request(url)
    
    mxfer = CreateObject("roURLTransfer")  
    mxfer.setURL(url)
    ' create a url transfer for http POST's to the web service
    
    xmlraw = mxfer.GetToString()
    print xmlraw
    regex = CreateObject("roRegEx", "&", "")
    xml = regex.ReplaceAll(xmlraw,"&amp;")
    'replace the &'s with an &amp; for the raw xml so that the parser can read it. 
    
    med_xml = CreateObject("roXMLElement")
    med_xml.Parse(xml)
    'create a parser like normal
    
    final_arr = CreateObject("roAssociativeArray")
    ' return an array of data about the song and media_location
    
    rough =  med_xml.media_location.getText()
    reg2 = CreateObject("roRegEx", "&amp", "")
    final_loc = reg2.ReplaceAll(rough, "&")
    ' replace the &amp's with a & now that the parser has read it, so that the media location is
    'valid
    
    final_arr["location"] = final_loc
    final_arr["queue_id"] = med_xml.queue_id.getText()
    final_arr["track_id"] = med_xml.track_id.getText()
    final_arr["requested"] = med_xml.requested.getText()
    print final_arr
    return final_arr
    
End Function
'This is complicated, but it returns the media location, queue id, track id, and the flag for 
'whether the song was requested or not for the player. It takes in data of the url
'with the host id and the location and the session ID. This had to be hack so that the roku could
'read the xml. For future reference the xml parser cannot read the & symbol. It must be replaced with 
' an &amp;. Using the roRegex (regular expression) it is possible to replace the & with &amp and then
'replace the &amp with an & before sending the media request to the player.