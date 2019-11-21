app @ application

app:setBackgroundColor(0x323232)

local sw = app:getContentWidth()
local sh = app:getContentHeight()

local el = SuperShape.new(SuperShape.ELLIPSE, math.random(0xffffff), 200)
el:build(100, 70, 0.4, 2)
el:setPosition(sw / 5, sh / 2)
stage:addChild(el)

local ss = SuperShape.new(SuperShape.SHAPE, math.random(0xffffff), 200)
ss:build(100, 1, 1, 5, 0.1,1.7,1.7)
ss:setPosition(sw - sw / 5, sh / 2)
stage:addChild(ss)

local sc = SuperShape.new(SuperShape.CIRCLE, math.random(0xffffff), 200)
sc:build(25)
sc:setPosition(sw /2 , sh / 2)
stage:addChild(sc)

local v = 0
function animate(e)
	local dt = e.deltaTime
	
	v += dt
	
	local sinv = math.sin(v)
	local cosv = math.cos(v)
	local norms = (sinv+1)/2
	local normc = (cosv+1)/2
	
	el:build(100, 70, norms*2, normc)
	ss:build(100, 1, 1, 5, norms+0.2,1.7,1.7)
	sc:build(25 + norms*25)
end
--

stage:addEventListener("enterFrame", animate)
