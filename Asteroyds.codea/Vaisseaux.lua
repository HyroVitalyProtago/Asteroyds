Vaisseaux = class()

function Vaisseaux:init()

    --orientation : 1=haut 2=haut-gauche 3=bas-gauche 4=bas 5=bas-droite 6=haut-droite         
    for i = 1,4 do
        grid[4 + (i - 1)*2][1][i] = i
    end
        
    vaisseauxJoueurs = {}
    for i = 1,4 do
        vaisseauxJoueurs[i] = {}
        vaisseauxJoueurs[i][1] = 1
        vaisseauxJoueurs[i][2] = 4 + (i - 1)*2
        vaisseauxJoueurs[i][3] = 1
    end

end

function Vaisseaux:draw()

for nbJoueur = 1,4 do
  if JOUEURINGAME[nbJoueur] then
    for i = 1,13 do
        for j = 1,11 do
            if grid[i][j][nbJoueur] == nbJoueur then
                self.x = 30 + (i-1)*50
                if i%2 == 0 then
                    self.y = 50 + (j-1)*60
                else
                    self.y = 80 + (j-1)*60
                end

            end
        end  
    end    

    pushMatrix()
    translate(self.x+10,self.y+20)
    
    if nbJoueur == joueur then
        fill(255, 0, 0, 0)
        stroke(15, 255, 0, 195)
        strokeWidth(4)
        ellipse(0,0,60)
        fill(255, 255, 255, 255)
    end
    
    if choix[nbJoueur][7][1] == true then
        fill(255, 0, 0, 0)
        stroke(255, 0, 0, 196)
        strokeWidth(2)
        ellipse(0,0,50)
        fill(255, 255, 255, 255)
    end
    
    --pas de verification pour l'orientation 1 car il n'y a rien a faire de plus
    if vaisseauxJoueurs[nbJoueur][3] == 2 then     
        rotate(45)
    elseif vaisseauxJoueurs[nbJoueur][3] == 3 then     
        rotate(135)
    elseif vaisseauxJoueurs[nbJoueur][3] == 4 then    
        rotate(180)
    elseif vaisseauxJoueurs[nbJoueur][3] == 5 then     
        rotate(225)
    elseif vaisseauxJoueurs[nbJoueur][3] == 6 then     
        rotate(315)
    end   
    
    if (nbJoueur == joueur) then
        zLevel(1)
    end       
    
    sprite(menu.vaisseau[nbJoueur],0,0,30)
    
    popMatrix()
  end
end
   
end

function Vaisseaux:moveV()
    
        if (not debutMoov) then 
            ok = true
            move:draw(1)
            debutMoov = true
            DebutTime = os.date("*t").sec
            DebutTime = DebutTime + 60 * os.date("*t").min
            DebutTime = DebutTime + 3600 * os.date("*t").hour
            DebutTime = DebutTime + 86400 * os.date("*t").day
        end
        if (debutMoov and Time == DebutTime + 1 and not finMove) then
            DebutTime = os.date("*t").sec
            DebutTime = DebutTime + 60 * os.date("*t").min
            DebutTime = DebutTime + 3600 * os.date("*t").hour
            DebutTime = DebutTime + 86400 * os.date("*t").day
            move:draw(nbMoov)
            nbMoov = nbMoov + 1
            if (nbMoov == 8) then
                finMove = true
            end
        end
            
end
