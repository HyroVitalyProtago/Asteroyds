Des = class()

function Des:init()
    taille = 20 
    r = 1
    b = 1
    w = 1
end

function Des:draw()
    noStroke()
--red    
    fill(255, 0, 0, 255)
    rect(700,700,60,60)
    fill(255, 255, 255, 255)
    x = 700
    num = r  
    self.nombre()
--blue
    fill(0, 0, 255, 255)
    rect(840,700,60,60)
    fill(255, 255, 255, 255)   
    x = 840
    num = b
    self.nombre()    
--white
    fill(255, 255, 255, 255)
    rect(770,700,60,60)
    fill(0, 0, 0, 255)     
    x = 770
    num = w
    self.nombre()

end

function Des:touched(touch)

    r = math.random(1000)    
    while r < 1 or r > 6 do      
        r = math.random(1000)
    end
    b  = math.random(1000)
    while b < 1 or b > 6 do      
        b = math.random(1000)
    end    
    w = math.random(1000)
    while w < 1 or w > 6 do      
        w = math.random(1000)
    end      
end

function Des:nombre()
    if num == 1 then
        ellipse(x + 30 ,730,taille * 1.5)
    elseif num == 2 then   
        ellipse(x + 30,717,taille)
        ellipse(x + 30,742,taille)
    elseif num == 3 then
        ellipse(x + 47,712,taille)
        ellipse(x + 30,730,taille)
        ellipse(x + 12,747,taille)                
    elseif num == 4 then
        ellipse(x + 47,712,taille)
        ellipse(x + 47,747,taille)
        ellipse(x + 12,712,taille)
        ellipse(x + 12,747,taille)                
    elseif num == 5 then
        ellipse(x + 47,712,taille)
        ellipse(x + 47,747,taille)
        ellipse(x + 12,712,taille)
        ellipse(x + 12,747,taille)
        ellipse(x + 30,730,taille)                        
    else
        ellipse(x + 20,712,taille - taille/8 )
        ellipse(x + 20,730,taille - taille/8 )
        ellipse(x + 20,748,taille - taille/8 )
        ellipse(x + 40,712,taille - taille/8 )
        ellipse(x + 40,730,taille - taille/8 )
        ellipse(x + 40,748,taille - taille/8 )                        
    end
end
