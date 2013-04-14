Interface = class()

function Interface:init()

    self.DebutTime = os.date("*t").sec
    self.DebutTime = self.DebutTime + 60 * os.date("*t").min
    self.DebutTime = self.DebutTime + 3600 * os.date("*t").hour
    self.DebutTime = self.DebutTime + 86400 * os.date("*t").day

    self.y = -10
    
    self.opacity = 255    
    self.tx1 = -100
    self.ty1 = HEIGHT - 20  
    self.tx2 = WIDTH + 95
    self.ty2 = HEIGHT - 40
    self.tx3 = WIDTH/2
    self.ty3 = 20

    self.taille = 505 
   
end

function Interface:draw1()

    self.Time = os.date("*t").sec
    self.Time = self.Time + 60 * os.date("*t").min
    self.Time = self.Time + 3600 * os.date("*t").hour
    self.Time = self.Time + 86400 * os.date("*t").day
            
    sprite("Asteroyds:espace",WIDTH/2, HEIGHT/2)

    if (self.taille > 0) then

        if (self.taille < 50 and self.opacity > 0) then
            self.opacity = self.opacity - 5
        end    
               
        font("AmericanTypewriter")
        fill(255, 255, 255, self.opacity)       
        text("Un jeu de G.Blossier & F.Henry - illustré par Nicolas Fructus",self.tx1 ,self.ty1)
        text("Editeur : Ystari",self.tx2 ,self.ty2)
        text("Programmeur : Ludovic DAVID",self.tx3 ,self.ty3)
        
        if (self.tx1 < WIDTH/2) then        
            self.tx1 = self.tx1 + 2
        end
        
        if (self.tx2 > WIDTH/2) then        
            self.tx2 = self.tx2 - 2
        end
                
        if (self.Time > self.DebutTime + 5) then
            self.taille = self.taille - 1
        end
                
        sprite("Asteroyds:asteroyds",WIDTH/2, HEIGHT/2, self.taille ) 
                
    end
    
    if (self.taille <= 0 and self.y < HEIGHT + 75) then
        self.y = self.y + 4
        sprite("Tyrian Remastered:Ship A",WIDTH/5, self.y, 35)
        sprite("Tyrian Remastered:Ship B",2*(WIDTH/5), self.y, 35)
        sprite("Tyrian Remastered:Ship D",3*(WIDTH/5), self.y, 35)
        sprite("Tyrian Remastered:Ship E",4*(WIDTH/5), self.y, 35)
    end

    if (CurrentTouch.state == BEGAN or self.y > HEIGHT + 70 and not ok and
            self.Time > self.DebutTime + 5) then
        I0 = false
        I1 = true
        ok = true
    end
        
end

function Interface:draw2()

    textMode(CENTER)

    if (self.x > WIDTH + 20) then
        if (SHIPA) then
            SHIPA = false
            SHIPB = true
        else
            SHIPD = false
            SHIPE = true           
        end 
        self.x = WIDTH + 15  
        self.y = math.random(HEIGHT - 10) + 10  
    end
    if (self.x < -20) then
        if (SHIPB) then
            SHIPB = false
            SHIPD = true
        else
            SHIPE = false
            SHIPA = true
        end 
        self.x = -15  
        self.y = math.random(HEIGHT - 10) + 10  
    end    
   
    noTint()     
    sprite("Asteroyds:espace",WIDTH/2, HEIGHT/2)

    if (self.opacity < 255) then
        self.opacity = self.opacity + 1
        tint(self.opacity)
    end
    
    sprite("Asteroyds:TitreAsteroyds",WIDTH/2, 7*(HEIGHT/8), 600)

    font("Futura-CondensedExtraBold")
    fill(255, 255, 255, self.opacity)
    
    fontSize(25)
    if (lang == VF) then
        text("Anglais",WIDTH/15,HEIGHT - HEIGHT/15)
    else
        text("French",WIDTH/15,HEIGHT - HEIGHT/15)
    end  

    if CurrentTouch.state == BEGAN and CurrentTouch.x < WIDTH/10 and 
            CurrentTouch.y > HEIGHT - HEIGHT/10 and not ok then
        
        ok = true
        
        if (lang == VF) then
            lang = EN
        else
            lang = VF
        end
    end

    fontSize(50)
    if (lang == VF) then
        text("Jouer", WIDTH/2, 5*(HEIGHT/8))
        text("Classement", WIDTH/2, 4*(HEIGHT/8))
        text("Règles", WIDTH/2, 3*(HEIGHT/8))
        text("Options", WIDTH/2, 2*(HEIGHT/8))
        text("Quitter", WIDTH/2, HEIGHT/8)
    else
        text("Play", WIDTH/2, 5*(HEIGHT/8))
        text("Podium", WIDTH/2, 4*(HEIGHT/8))
        text("Rules", WIDTH/2, 3*(HEIGHT/8))
        text("Options", WIDTH/2, 2*(HEIGHT/8))
        text("Exit", WIDTH/2, HEIGHT/8)
    end

    if (SHIPA or SHIPD) then
        self.x = self.x + 5
    elseif (SHIPB or SHIPE) then
        self.x = self.x - 5
    end

    translate(self.x,self.y)
    
    if (SHIPA) then
        rotate(-90)
        sprite("Tyrian Remastered:Ship A", 0, 0, 35)
    elseif (SHIPB) then
        rotate(90)
        sprite("Tyrian Remastered:Ship B", 0, 0, 35)
    elseif (SHIPD) then
        rotate(-90)
        sprite("Tyrian Remastered:Ship D", 0, 0, 35)
    elseif (SHIPE) then
        rotate(90)
        sprite("Tyrian Remastered:Ship E", 0, 0, 35)
    end   
            
    if (CurrentTouch.state == BEGAN and CurrentTouch.x < 600 and CurrentTouch.x > 450 and
            not ok) then     
        if (CurrentTouch.y > 3*(HEIGHT/8) - 50 and CurrentTouch.y < 3*(HEIGHT/8) ) then
            I1 = false
            RULES = true
            ok = true
        end
        if (CurrentTouch.y > 5*(HEIGHT/8) - 50 and CurrentTouch.y < 5*(HEIGHT/8) ) then
            I1 = false
            MENU1 = true
            ok = true
        end        
        if (CurrentTouch.y > HEIGHT/8 - 50 and CurrentTouch.y < HEIGHT/8 ) then
            close()
        end        
    end
    
end