Rules = class()

function Rules:init()

    self.inertie = 0

    self.scrollMax = 1719*7 + 800
    self.opacity = 0       
    self.y = 0
    
    self.ox = WIDTH/2
    self.oy = HEIGHT/2
            
end

function Rules:draw()

    if (self.opacity < 255) then
        self.opacity = self.opacity + 1
        tint(self.opacity)
    end

    sprite("Asteroyds:espace",WIDTH/2, HEIGHT/2)
   
    font("Futura-CondensedExtraBold")
    fontSize(20)

	if lang == VF then
    	sprite("Asteroyds:page_1", WIDTH/2, self.y - 50 , WIDTH, 1719)
    	sprite("Asteroyds:page_2", WIDTH/2, self.y - 1719, WIDTH, 1719 )
    	sprite("Asteroyds:page_3", WIDTH/2, self.y - 2*1719, WIDTH, 1719)
    	sprite("Asteroyds:page_4", WIDTH/2, self.y - 3*1719, WIDTH, 1719)
    	sprite("Asteroyds:page_5", WIDTH/2, self.y - 4*1719, WIDTH, 1719)
    	sprite("Asteroyds:page_6", WIDTH/2, self.y - 5*1719, WIDTH, 1719)
    	sprite("Asteroyds:page_7", WIDTH/2, self.y - 6*1719, WIDTH, 1719)
    	sprite("Asteroyds:page_8", WIDTH/2, self.y - 7*1719, WIDTH, 1719)
    else
    	sprite("Asteroyds:page_1US", WIDTH/2, self.y - 50 , WIDTH, 1719)
    	sprite("Asteroyds:page_2US", WIDTH/2, self.y - 1719, WIDTH, 1719 )
    	sprite("Asteroyds:page_3US", WIDTH/2, self.y - 2*1719, WIDTH, 1719)
    	sprite("Asteroyds:page_4US", WIDTH/2, self.y - 3*1719, WIDTH, 1719)
    	sprite("Asteroyds:page_5US", WIDTH/2, self.y - 4*1719, WIDTH, 1719)
    	sprite("Asteroyds:page_6US", WIDTH/2, self.y - 5*1719, WIDTH, 1719)
    	sprite("Asteroyds:page_7US", WIDTH/2, self.y - 6*1719, WIDTH, 1719)
    	sprite("Asteroyds:page_8US", WIDTH/2, self.y - 7*1719, WIDTH, 1719)
    end

    text("1",25,8*HEIGHT/9)
    text("2",25,7*HEIGHT/9)
    text("3",25,6*HEIGHT/9)
    text("4",25,5*HEIGHT/9)
    text("5",25,4*HEIGHT/9)
    text("6",25,3*HEIGHT/9)
    text("7",25,2*HEIGHT/9)
    text("8",25,1*HEIGHT/9)

    if (CurrentTouch.x < 50) then

        if (CurrentTouch.y < 8*HEIGHT/9 + 10 and CurrentTouch.y > 8*HEIGHT/9 - 10) then
            self.y = 0
        end
        if (CurrentTouch.y < 7*HEIGHT/9 + 10 and CurrentTouch.y > 7*HEIGHT/9 - 10) then
            self.y = 1719 - 50
        end
        if (CurrentTouch.y < 6*HEIGHT/9 + 10 and CurrentTouch.y > 6*HEIGHT/9 - 10) then
            self.y = 2*1719 - 50
        end
        if (CurrentTouch.y < 5*HEIGHT/9 + 10 and CurrentTouch.y > 5*HEIGHT/9 - 10) then
            self.y = 3*1719 - 50
        end
        if (CurrentTouch.y < 4*HEIGHT/9 + 10 and CurrentTouch.y > 4*HEIGHT/9 - 10) then
            self.y = 4*1719 - 50
        end
        if (CurrentTouch.y < 3*HEIGHT/9 + 10 and CurrentTouch.y > 3*HEIGHT/9 - 10) then
            self.y = 5*1719 - 50
        end
        if (CurrentTouch.y < 2*HEIGHT/9 + 10 and CurrentTouch.y > 2*HEIGHT/9 - 10) then
            self.y = 6*1719 - 50
        end
        if (CurrentTouch.y < 1*HEIGHT/9 + 10 and CurrentTouch.y > 1*HEIGHT/9 - 10) then
            self.y = 7*1719 - 50
        end                                                        
    end

	if lang == VF then
    	text("RETOUR", WIDTH - 50, HEIGHT - 25)
    else
    	text("BACK", WIDTH - 50, HEIGHT - 25)
    end
   
    if (CurrentTouch.state == ENDED and CurrentTouch.x > 900 and CurrentTouch.y > 700) then
        RULES = false    
        I1 = true    
    end
    
    if (CurrentTouch.state == BEGAN ) then
        self.ox = CurrentTouch.x
        self.oy = CurrentTouch.y 
    end    
    if (CurrentTouch.state == MOVING or CurrentTouch.state == ENDED) then
        if (CurrentTouch.state == MOVING) then
            self.inertie = 0           
            self.y = self.y + (-self.oy + CurrentTouch.prevY)/10
        end
        
        if (CurrentTouch.state == ENDED and self.oy < CurrentTouch.prevY and
            self.inertie < (-self.oy + CurrentTouch.prevY)/10 - 1) then
            self.inertie = self.inertie + 0.5   
            self.y = self.y + (-self.oy + CurrentTouch.prevY)/10 - self.inertie
        end        

        if (CurrentTouch.state == ENDED and self.oy > CurrentTouch.prevY and
            self.inertie > (-self.oy + CurrentTouch.prevY)/10 + 1) then
            self.inertie = self.inertie - 0.5   
            self.y = self.y + (-self.oy + CurrentTouch.prevY)/10 - self.inertie
        end
                
        if (self.y < 0) then
            self.y = 0
        end
        if (self.y > self.scrollMax) then
            self.y = self.scrollMax
        end        
    end  

    if (self.y > 0) then
        strokeWidth(10)
        stroke(255, 255, 255, 255)
        line(50, 700, 50, 750)
        line(50, 750, 25, 725)
        line(50, 750, 75, 725)
    end
    if (self.y < self.scrollMax) then
        strokeWidth(10)
        stroke(255, 255, 255, 255)
        line(50, 15, 50, 65)
        line(50, 15, 25, 30)
        line(50, 15, 75, 30)
    end        
              
end

