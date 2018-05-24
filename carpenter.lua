function MatarCarpenter()
    carpenter.estaVivo = false
end

function resetarCarpenter()
    carpenter.x = 150
    carpenter.y = 750
    carpenter.gravity = -5
    carpenter.accel = 0
    carpenter.accelAux = 35
    carpenter.estaVivo = true
    carpenter:play()
    carpenter.rotation = 0
end
 
local options =
{   frames = 
    {
        {
            -- 01
            x=1,
            y=1,
            width=176,
            height=223,

            sourceX = 1,
            sourceY = 4,
            sourceWidth = 220,
            sourceHeight = 237
        },
        {
            -- 02
            x=179,
            y=1,
            width=152,
            height=227,

            sourceX = 19,
            sourceY = 3,
            sourceWidth = 220,
            sourceHeight = 237
        },
        {
            -- 03
            x=333,
            y=1,
            width=150,
            height=229,

            sourceX = 22,
            sourceY = 3,
            sourceWidth = 220,
            sourceHeight = 237
        },
        {
            -- 04
            x=485,
            y=1,
            width=166,
            height=227,

            sourceX = 7,
            sourceY = 2,
            sourceWidth = 220,
            sourceHeight = 237
        },
        {
            -- 05
            x=653,
            y=1,
            width=138,
            height=229,

            sourceX = 33,
            sourceY = 3,
            sourceWidth = 220,
            sourceHeight = 237
        },
        {
            -- 06
            x=793,
            y=1,
            width=130,
            height=229,

            sourceX = 41,
            sourceY = 4,
            sourceWidth = 220,
            sourceHeight = 237
        },
        {
            -- 07
            x=925,
            y=1,
            width=156,
            height=233,

            sourceX = 15,
            sourceY = 0,
            sourceWidth = 220,
            sourceHeight = 237
        },
        {
            -- 08
            x=1083,
            y=1,
            width=214,
            height=225,

            sourceX = 2,
            sourceY = 2,
            sourceWidth = 220,
            sourceHeight = 237
        },
    		
    }
}


local imageSheet = graphics.newImageSheet( "images/carpenterSprites.png", options )
local sequenceData ={{name="carpenter", start=1, count=6, time=500},
                     {name="pular", start=7, count=1, time=700},
                     {name="colisao", start=7, count=1, time=500},
                     {name="bater", start=8, count=1, time=500}}
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
            carpenter:setSequence("pular")
            carpenter:play()
            carpenter.accel = carpenter.accel - 1
            carpenter.y = carpenter.y - carpenter.accel 
            carpenter.y = carpenter.y - carpenter.gravity   
        else
            if carpenter.y < 750 then 
                carpenter.x = 150
                carpenter.y = carpenter.y + 15
                if carpenter.y > 700 then 
                    carpenter:setSequence("carpenter")
                    carpenter:play() 
                end
            end       
        end

    end
    collisionRect.y = carpenter.y
end

return sheetData
