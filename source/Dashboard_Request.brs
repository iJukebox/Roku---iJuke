Function Host_Request(url)

    xfer = CreateObject("roURLTransfer")
    'xfer.setCertificatesFile("pkg:/source/cacert.pem")
    'xfer.InitClientCertificates()
    'there may need to be a certificates file to be used for each http POST if we decide to add
    'more security. this is how it would be done.
    xfer.setURL(url)
    'create a url transfer object to make the http POST
    urlresponse = xfer.GetToString()
    'makes the post and returns the raw string
    return xml_parse(urlresponse)
    'pass the string to the xml parser
End Function


Function xml_parse(response)
    xml = CreateObject("roXMLElement")
    'creates and object of type xml
    if xml.Parse(response)
        Ids = CreateObject("roAssociativeArray")
        Ids["host_id"] = xml.host_id.getText()
        Ids["session_id"] = xml.mn_session_id.getText()
        return Ids
            else 
                return getID()
        end if
        'if the xml parses returns an array of session and host data, else it returns the uniqueID
End Function

