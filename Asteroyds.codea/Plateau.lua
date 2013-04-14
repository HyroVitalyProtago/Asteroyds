Plateau = class()

function Plateau:init()
    -- Creation du plateau

    x = 25
    y = 70
    ix = 20 
    
    grid = {}
    for i = 1,13 do
        grid[i] = {}
        for j = 1,11 do
            grid[i][j] = {}
            for k = 1,5 do
                grid[i][j][k] = 0
            end
        end  
    end
    
    self.hexagone = {}     
    for j = 1,11 do
        for i = 1,13 do
            spawn = vec2(x,y)
            table.insert(self.hexagone,spawn)
            x = x + 50
            if i%2 == 0  then  
                y = y + 30
            else
                y = y - 30
            end
       end
        y = y + 90
        x = 25
    end
   
end

function Plateau:draw()
    -- Affichage du plateau

    -- Dessin des hexagones representant l'espace
    for i,v in ipairs(self.hexagone) do
        stroke(87, 86, 86, 255)
        strokeWidth(5)
    
        line(v.x,v.y,v.x + 30, v.y)
        line(v.x + 30 ,v.y,v.x + 50, v.y + 30  )
        line(v.x + 50 ,v.y + 30 ,v.x + 30 , v.y +60   )
        line(v.x + 30 ,v.y + 60 ,v.x , v.y +60 )
        line(v.x,v.y + 60 ,v.x - 20, v.y + 30 )
        line(v.x - 20 ,v.y + 30 ,v.x,v.y )                
    end

    --affichage de l'aide de jeu des asteroyds    
    strokeWidth(2)
    fill(135, 130, 130, 107)        
    rect(ix + 678,520,150,160)            
    tint(255, 0, 0, 255)
    sprite("Tyrian Remastered:Rock 3",ix + 700,650, 40)
    stroke(255, 0, 0, 255)
    strokeWidth(5)    
    line(ix + 730,665,ix + 730, 635)
    line(ix + 730,665,ix + 755, 650)
    line(ix + 730,635,ix + 755, 650)    
    line(ix + 760,665,ix + 760, 635)
    line(ix + 760,665,ix + 785, 650)
    line(ix + 760,635,ix + 785, 650)            
    tint(255, 255, 255, 255)
    sprite("Tyrian Remastered:Rock 4",ix + 700,600, 40)
    stroke(255, 255, 255, 255)
    strokeWidth(5)    
    line(ix + 730,615,ix + 730, 585)
    line(ix + 730,615,ix + 755, 602)
    line(ix + 730,585,ix + 755, 602)        
    tint(0, 0, 255, 255)
    sprite("Tyrian Remastered:Rock 5",ix + 700,550, 40)    
    stroke(0, 0, 255, 255)
    strokeWidth(5)    
    line(ix + 730,570,ix + 730, 540)
    line(ix + 730,570,ix + 755, 555)
    line(ix + 730,540,ix + 755, 555)
    fill(92, 85, 85, 107)
    ellipse(ix + 780,555,30)
    line(ix + 770,555,ix + 810, 555)
    line(ix + 810,555,ix + 800, 545)
    line(ix + 810,555,ix + 800, 565)
         
end
