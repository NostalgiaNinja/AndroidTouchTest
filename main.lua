
--initialization (pre-function)
local imgSplash         -- displays a splash on current draw of screen touch.
local tblSplash = {}    -- splash(frames)
local splashActFPS      -- splash(active frame)
local splashCurrFPS = 1 -- splash(current frame)
local elapsedTime = 0   -- current elapsed time for sprite loop


function love.load()
    imgSplash = love.graphics.newImage('splash.png')  --assign the splash sprite
    tblSplash[1] = love.graphics.newQuad(0,0,32,32,imgSplash:getDimensions())  --[index]frame of sprite
    tblSplash[2] = love.graphics.newQuad(32,0,32,32,imgSplash:getDimensions())
    tblSplash[3] = love.graphics.newQuad(64,0,32,32,imgSplash:getDimensions())
    tblSplash[4] = love.graphics.newQuad(96,0,32,32,imgSplash:getDimensions())
    tblSplash[5] = love.graphics.newQuad(128,0,32,32,imgSplash:getDimensions())
    tblSplash[6] = love.graphics.newQuad(160,0,32,32,imgSplash:getDimensions())

    splashActFPS = tblSplash[splashCurrFPS]
end

function love.draw()
    love.graphics.print("Android Touch Splash 1.0",0,0)

    local touches = love.touch.getTouches()

    for i, id in ipairs(touches) do
       local tchx,tchy = love.touch.getPosition(id)
        love.graphics.draw(imgSplash,splashActFPS,tchx,tchy,0,3,3,16,16)
    end

end


function love.update(dt)
    elapsedTime = elapsedTime + dt

    if (elapsedTime > 0.5) then
        if (splashCurrFPS < 6) then
            splashCurrFPS = splashCurrFPS + 1
        else
            splashCurrFPS = 1
        end
        splashActFPS = tblSplash[splashCurrFPS]
        elapsedTime = 0
    end
end

function love.exit()

end

