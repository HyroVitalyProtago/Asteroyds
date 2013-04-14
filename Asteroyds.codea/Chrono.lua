Chrono = class()

function Chrono:init()
    minutes = 1 
    secondes = 30 
    frame = 0
    frame2 = 0 
    decompte = 3     
end

function Chrono:draw()
    -- affichage du temps
    if (secondes > 9) then
        text("" .. secondes, WIDTH - 65, HEIGHT - 30)
    else
        text("0" .. secondes, WIDTH - 65, HEIGHT - 30)
    end
end

function Chrono:touched(touch)    
    -- activation du chronometre
    frame = (frame+2)%128

    if frame%10 == 0 and decompte > 0 then        
        sound(SOUND_BLIT,50)
        decompte = decompte -1    
    end    
    if decompte == 0 then         
        sound(SOUND_BLIT,65)
        self.DebutTime = os.date("*t").sec
        self.DebutTime = self.DebutTime + 60 * os.date("*t").min
        self.DebutTime = self.DebutTime + 3600 * os.date("*t").hour
        self.DebutTime = self.DebutTime + 86400 * os.date("*t").day         
        termin = true                 
    end    
end

function Chrono:decompte2()
    -- activation du chronometre    
    --frame2 = (frame2+1)%20
    --if frame2%5 == 0 and secondes > 0 then         
    --    secondes = secondes -1            
    --end    
    self.Time = os.date("*t").sec
    self.Time = self.Time + 60 * os.date("*t").min
    self.Time = self.Time + 3600 * os.date("*t").hour
    self.Time = self.Time + 86400 * os.date("*t").day
    
    if secondes > 0 then
        secondes = self.DebutTime - self.Time + 30
    end
    
end

function Chrono:PassBouton()
    --affichage du bouton pour passer
    fill(58, 53, 215, 99)
    rect(6*WIDTH/7 ,4*HEIGHT/5 , 100,50)
    fill(255, 255, 255, 255)
    fontSize(20)
    text("Passer",6*WIDTH/7 + 50,4*HEIGHT/5 + 25)
end

function Chrono:TouchPassBouton()
    if (CurrentTouch.state == BEGAN and CurrentTouch.x > 6*WIDTH/7 and CurrentTouch.x <
        6*WIDTH/7 + 100 and CurrentTouch.y > 4*HEIGHT/5 and CurrentTouch.y < 4*HEIGHT/5 + 50 and
            not ok) then
        ok = true
        secondes = 0   
    end
end
