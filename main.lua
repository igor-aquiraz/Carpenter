
local composer = require( "composer" ) 

--Hide status bar
display.setStatusBar( display.HiddenStatusBar )

audio.reserveChannels( 1 )
audio.reserveChannels( 2 )
audio.reserveChannels( 3 )
audio.setVolume( 0.1, { channel=1 } )
audio.setVolume( 0.1, { channel=2 } )
audio.setVolume( 0.1, { channel=3 } )

--Go to the menu screen
composer.gotoScene( "scene.menu" )







