AddEventHandler( 'chatMessage', function( source, n, msg )
    msg = string.lower( msg )
    if ( msg == "/masca" or msg == "/maskon" ) then 
        CancelEvent() 
        TriggerClientEvent( 'maskon', source )
    end
end )


