Pilote = class()

function Pilote:init()

    self.score = {}

    for i = 1,4 do    
        self.score[i] = {}
        for j = 1,4 do
            self.score[i][j] = false
        end       
    end   

    degats = {}
    for i = 1,4 do
        degats[i] = 0   
    end
 
    choix = {}
    for i = 1,4 do
        choix[i] = {} 
        for j = 1,7 do
            spawn = {false,false,false,false,false,false,false}
            table.insert(choix[i],spawn)                  
        end
        choix[i][7][1] = true
    end
    

end

function Pilote:draw()

    self.pilote1 = readLocalData('pilote1', "")
    self.pilote2 = readLocalData('pilote2', "")
    self.pilote3 = readLocalData('pilote3', "")
    self.pilote4 = readLocalData('pilote4', "")

    nomPilote = {}
    nomPilote[1] = self.pilote1
    nomPilote[2] = self.pilote2
    nomPilote[3] = self.pilote3
    nomPilote[4] = self.pilote4
   
    --Affiche le score du joueur
    
    fill(255, 255, 255, 255)
    font("Copperplate-Light")
    fontSize(50 - 2*string.len(nomPilote[joueur]))
    text("" .. nomPilote[joueur],6*WIDTH/8,2*HEIGHT/5)
    if (self.score[joueur][1]) then
        noTint()
        sprite("Asteroyds:J1",8*WIDTH/10,3*HEIGHT/5,80)
        fill(255, 255, 255, 0)
        ellipse(8*WIDTH/10,3*HEIGHT/5,80)
    end
    
    if (self.score[joueur][2]) then
        noTint()
        sprite("Asteroyds:J2",7.2*WIDTH/10,3*HEIGHT/5,80)
        fill(255, 255, 255, 0)
        ellipse(7.2*WIDTH/10,3*HEIGHT/5,80)
    end
    
    if (self.score[joueur][3]) then
        noTint()
        sprite("Asteroyds:J3",8*WIDTH/10,2.45*HEIGHT/5,80)
        fill(255, 255, 255, 0)
        ellipse(8*WIDTH/10,2.45*HEIGHT/5,80)
    end
    
    if (self.score[joueur][4]) then
        noTint()
        sprite("Asteroyds:J4",7.2*WIDTH/10,2.45*HEIGHT/5,80)
        fill(255, 255, 255, 0)
        ellipse(7.2*WIDTH/10,2.45*HEIGHT/5,80)
    end    
    fontSize(50)
    noFill()    
    noTint()
    --number(900,460,self.score[joueur],30)    
    --sprite("Tyrian Remastered:Ring",950,460,30)
    sprite("Asteroyds:Choix",WIDTH - 170,135,310,270)
    sprite(menu.images[menu.imageJoueur[joueur]],WIDTH - 100,HEIGHT - 375,75,200)

    sprite(menu.vaisseau[joueur],WIDTH - 375,30,40)

    self.choix()
    self.dessin()

end

function Pilote:choix()            
     
    strokeWidth(3)
    fill(255, 255, 255, 176)
    stroke(18, 0, 255, 255)
    ellipse(723 + degats[joueur]*43.7 , 24, 40)
    
    if degats[joueur] >= 6 then
        JOUEURINGAME[joueur] = false
        NBJOUEURSINGAME = NBJOUEURSINGAME - 1
    end   
                    
end


function Pilote:touched(touch)

  for c = 1, 7 do      
    if CurrentTouch.x > 700 + (c-1)*45 and CurrentTouch.x < 735 + (c-1)*45 and
        CurrentTouch.y > 50 and CurrentTouch.y < 80 then
        for j = 1, 5 do 
            choix[joueur][c][j] = false            
        end            
        choix[joueur][c][1] = true  
    end

    if CurrentTouch.x > 700 + (c-1)*45 and CurrentTouch.x < 735 + (c-1)*45 and
        CurrentTouch.y > 100 and CurrentTouch.y < 130 then
        for j = 1, 5 do 
            choix[joueur][c][j] = false            
        end 
        choix[joueur][c][2] = true  
    end

    if CurrentTouch.x > 700 + (c-1)*45 and CurrentTouch.x < 735 + (c-1)*45 and
        CurrentTouch.y > 150 and CurrentTouch.y < 180 then
        for j = 1, 5 do 
            choix[joueur][c][j] = false            
        end 
        choix[joueur][c][3] = true  
    end

    if CurrentTouch.x > 700 + (c-1)*45 and CurrentTouch.x < 735 + (c-1)*45 and
        CurrentTouch.y > 200 and CurrentTouch.y < 230 then
        for j = 1, 5 do 
            choix[joueur][c][j] = false            
        end 
        choix[joueur][c][4] = true  
    end    

    if CurrentTouch.x > 700 + (c-1)*45 and CurrentTouch.x < 735 + (c-1)*45 and
        CurrentTouch.y > 240 and CurrentTouch.y < 270 then
        if choix[joueur][c][5] == true then        
            remove = true  
        end
        for j = 1, 5 do 
            choix[joueur][c][j] = false            
        end 
        choix[joueur][c][5] = true 
    end
    
    if CurrentTouch.x > 700 + (c-1)*45 and CurrentTouch.x < 735 + (c-1)*45 and
        CurrentTouch.y > 270 and CurrentTouch.y < 300 then
        for j = 1, 5 do 
            choix[joueur][c][j] = false            
        end            
    end
  end     

end

function Pilote:dessin()
    
    noStroke()
    fill(255, 255, 255, 159)
    for i = 1, 7 do
        for j = 1, 5 do
            if choix[joueur][i][j] then
                ellipse(723 + (i-1)*43.7,75 + (j-1)*43.4,30)
            end                                    
        end
    end
    
end

function Pilote:InitChoix()

    for i = 1,4 do
        for j = 1,7 do
            for k = 1,5 do
                choix[i][j][k] = false
            end
        end
        choix[i][7][1] = true
    end
        
end
