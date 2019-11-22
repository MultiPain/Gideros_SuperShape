local cos,sin,abs,pi = math.cos,math.sin,math.abs,math.pi
local pi2 = pi*2
SuperShape = Core.class(Mesh)

SuperShape.SHAPE = "Shape"
SuperShape.ELLIPSE = "Ellipse"
SuperShape.CIRCLE = "Circle"
SuperShape.HEART = "Heart"

local function sign(v) return v < 0 and -1 or v > 0 and 1 or 0 end

function SuperShape:init(type, color, total)
	self.type = type or SuperShape.SHAPE
	self.color = color or 0xffffff
	self.total = total or 128
end
--
function SuperShape:build(...)
	local inc = pi2 / self.total

	self:setVertex(1, 0, 0)
	self:setColor(1, self.color, 1)

	local ind = 1
	local prev = 2
	local i = 1
	for j = 0, pi2, inc do 		
		local x, y = self["build"..self.type](self, j, ...)
		
		self:setVertex(i+1, x, y)
		self:setColor(i+1, self.color, 1)
		
		self:setIndex(ind, 1)
		self:setIndex(ind+1, prev)
		if (prev+1 > self.total+1) then 
			self:setIndex(ind+2, 2)
		else
			self:setIndex(ind+2, prev+1)
		end
		
		prev += 1
		ind += 3
		i+=1
	end
end
--
function SuperShape:buildShape(theta, r, a, b, m, n1, n2, n3)
	local cosa = cos(theta)
	local sina = sin(theta)
	local av = theta * m / 4
	local v = (abs(1 / a * cos(av))^n2 + abs(1 / b * sin(av))^n3)^(1 / n1)
	local cr = 1 / v
	
	local x = r * cr * cosa
	local y = r * cr * sina
	
	return x, y
end
--
function SuperShape:buildEllipse(theta, a, b, m, n)
	local cosa = cos(theta)
	local sina = sin(theta)
	
	local x = abs(cosa)^(2/n) * a * sign(cosa)
	local y = abs(sina)^(2/m) * b * sign(sina)
	
	return x, y
end
--
function SuperShape:buildCircle(theta, r)
	local cosa = cos(theta)
	local sina = sin(theta)
	
	local x = r * cosa
	local y = r * sina
	
	return x, y
end
--
function SuperShape:buildHeart(theta, r)
	local cosa = cos(theta)
	local sina = sin(theta)
	
	local x = r * 16 * sina^3
	local y = r * -(13 * cosa - 5*cos(2*theta)-2*cos(3*theta)-cos(4*theta))
	
	return x, y
end
