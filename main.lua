local gfx = playdate.graphics
local geom = playdate.geometry

gfx.setColor(gfx.kColorBlack)

local input_vector = geom.vector2D.new(0, 0)
local background = gfx.image.new('big_image')
local bg_x, bg_y = background:getSize()
local screen_width, screen_height = 400, 240
local sourceRect = geom.rect.new(bg_x/2, bg_y/2, screen_width, screen_height) -- start sourceRect near the middle of background

function playdate.update()
    
    gfx.clear()
    sourceRect:offset(input_vector.dx * 2, -input_vector.dy * 2)
    background:draw(0, 0, gfx.kImageUnflipped, sourceRect)
    playdate.drawFPS(0,0)
    
end

-- input callbacks
function playdate.leftButtonDown() input_vector.dx = -1 end
function playdate.leftButtonUp() input_vector.dx = 0 end
function playdate.rightButtonDown() input_vector.dx = 1 end
function playdate.rightButtonUp() input_vector.dx = 0 end
function playdate.upButtonDown() input_vector.dy = 1 end
function playdate.upButtonUp() input_vector.dy = 0 end
function playdate.downButtonDown() input_vector.dy = -1 end
function playdate.downButtonUp() input_vector.dy = 0 end
function playdate.AButtonDown() aDown = true end
function playdate.AButtonHeld() aHeld = true end
function playdate.AButtonUp() aDown = false aHeld = false end
function playdate.BButtonDown() bDown = true end
function playdate.BButtonHeld() bHeld = true end
function playdate.BButtonUp() bDown = false bHeld = false end
