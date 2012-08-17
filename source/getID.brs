Function getID()

    di = CreateObject("roDeviceInfo")
    return di.GetDeviceUniqueId()

End Function
'Simple method, returns the unique Roku Identifier for each individual box. The uniqueId is actually
'the Roku's serial number, in case you were wondering