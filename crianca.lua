
function resetarCrianca()
    crianca.x = 900
    crianca.y = 800
    crianca.gravity = -5
    crianca.accel = 0
    crianca.estaVivo = true
    crianca:play()
    crianca.rotation = 0
end

function correCrianca()
    crianca:translate(11, 0)
end


local options =
{   frames = 
    {
        {
            -- 01
            x=1,
            y=1,
            width=130,
            height=161,

            sourceX = 5,
            sourceY = 9,
            sourceWidth = 162,
            sourceHeight = 177
        },
        {
            -- 02
            x=133,
            y=1,
            width=116,
            height=161,

            sourceX = 19,
            sourceY = 8,
            sourceWidth = 162,
            sourceHeight = 177
        },
        {
            -- 03
            x=251,
            y=1,
            width=110,
            height=163,

            sourceX = 25,
            sourceY = 9,
            sourceWidth = 162,
            sourceHeight = 177
        },
        {
            -- 04
            x=363,
            y=1,
            width=122,
            height=161,

            sourceX = 13,
            sourceY = 8,
            sourceWidth = 162,
            sourceHeight = 177
        },
        {
            -- 05
            x=487,
            y=1,
            width=120,
            height=165,

            sourceX = 29,
            sourceY = 7,
            sourceWidth = 162,
            sourceHeight = 177
        },
        {
            -- 06
            x=609,
            y=1,
            width=114,
            height=165,

            sourceX = 35,
            sourceY = 7,
            sourceWidth = 162,
            sourceHeight = 177
        },
        {
            -- 07
            x=725,
            y=1,
            width=116,
            height=161,

            sourceX = 19,
            sourceY = 8,
            sourceWidth = 162,
            sourceHeight = 177
        },
    		
    }
}


local imageSheet = graphics.newImageSheet( "images/criancaSprites.png", options )
local sequenceData ={name="crianca", start=1, count=7, time=700}
crianca = display.newSprite( imageSheet, sequenceData )
resetarCrianca()

return sheetData
