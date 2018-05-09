function MatarCarpenter()
    carpenter.estaVivo = false
end

function resetarCarpenter()
    carpenter.x = 50
    carpenter.y = 200
    carpenter.gravity = -5
    carpenter.accel = 0
    carpenter.estaVivo = true
    carpenter:play()
    carpenter.rotation = 0
end


local options =
{   frames = 
    {
        {
            -- Per_00
            x=1,
            y=1,
            width=77,
            height=99,

            sourceX = 8,
            sourceY = 5,
            sourceWidth = 95,
            sourceHeight = 111
        },
        {
            -- Per_01
            x=80,
            y=1,
            width=67,
            height=99,

            sourceX = 16,
            sourceY = 5,
            sourceWidth = 95,
            sourceHeight = 111
        },

        {
            -- Per_02
            x=149,
            y=1,
            width=65,
            height=99,

            sourceX = 18,
            sourceY = 5,
            sourceWidth = 95,
            sourceHeight = 111
        },

        {
            -- Per_03
            x=216,
            y=1,
            width=71,
            height=97,

            sourceX = 12,
            sourceY = 6,
            sourceWidth = 95,
            sourceHeight = 111
        },

        {
            -- Per_04
            x=289,
            y=1,
            width=61,
            height=101,

            sourceX = 22,
            sourceY = 5,
            sourceWidth = 95,
            sourceHeight = 111
        },

        {
            -- Per_05
            x=352,
            y=1,
            width=57,
            height=99,

            sourceX = 26,
            sourceY = 6,
            sourceWidth = 95,
            sourceHeight = 111
        },
    		
    }
}


local imageSheet = graphics.newImageSheet( "images/spriteCarpenter.png", options )
local sequenceData ={name="carpenter", start=1, count=6, time=500}
carpenter = display.newSprite( imageSheet, sequenceData )
resetarCarpenter()

collisionRect = display.newRect(carpenter.x + 22, carpenter.y, 1, 70)
collisionRect.strokeWidth = 1
collisionRect:setFillColor(140, 140, 140)
collisionRect:setStrokeColor(180, 180, 180)
collisionRect.alpha = 0

personagem = display.newGroup()
personagem:insert(carpenter)
personagem:insert(collisionRect)

personagens:insert(personagem)

function updateCarpenter()
    if(carpenter.estaVivo == true) then  

        if(carpenter.accel > 0) then
            carpenter.accel = carpenter.accel - 1
            carpenter.y = carpenter.y - carpenter.accel 
            carpenter.y = carpenter.y - carpenter.gravity   
        else
            carpenter.x = 50
            carpenter.y = 200        
        end

    end
    collisionRect.y = carpenter.y
end

return sheetData
