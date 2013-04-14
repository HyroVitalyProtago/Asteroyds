Menu = class()

function Menu:init()   

    self.pilote1 = readLocalData('pilote1', "")
    self.pilote2 = readLocalData('pilote2', "")
    self.pilote3 = readLocalData('pilote3', "")
    self.pilote4 = readLocalData('pilote4', "")
    
    self.state = false
    self.HideK = true
    self.showK = false

    self.begin = false
    self.vaisseau = {"Tyrian Remastered:Ship A","Tyrian Remastered:Ship B",
    "Tyrian Remastered:Ship D","Tyrian Remastered:Ship E"}
    self.images = {"Asteroyds:P1","Asteroyds:P2","Asteroyds:P3","Asteroyds:P4",
        "Asteroyds:P5","Asteroyds:P6"}

    self.imageJoueur = {readLocalData('ImagePilote1',6),readLocalData('ImagePilote2',3),
        readLocalData('ImagePilote3',2),readLocalData('ImagePilote4',1)}   
     
    self.left = {1,4,7,10}
    self.ImagesValidate = true   
end

function Menu:draw3()
    pushStyle()
    sprite("Asteroyds:espace",WIDTH/2,HEIGHT/2)    
    font("Futura-CondensedExtraBold")
    fontSize(20)
    if (lang == VF) then
        text("RETOUR", WIDTH - 75, HEIGHT - 30)
    else
        text("BACK", WIDTH - 75, HEIGHT - 30)
    end 
    
    if (lang == VF) then
        text("En Travaux ...",WIDTH/2,HEIGHT/2)
    else
        text("In Work ...",WIDTH/2,HEIGHT/2)
    end

    if (CurrentTouch.state == BEGAN and CurrentTouch.x > 900 and CurrentTouch.y > 700 and
            not ok) then
        ok = true
        MENUENCONSTRUCTION = false    
        MENU1 = true    
    end
    
    popStyle()
end

function Menu:draw1()

    pushStyle()
    
    sprite("Asteroyds:espace",WIDTH/2,HEIGHT/2)

    font("Futura-CondensedExtraBold")
    fontSize(50)
    fill(255, 255, 255, 255)
    
    if (lang == VF) then
        text("Tutoriel", WIDTH/2, 5*(HEIGHT/6))
        text("Entrainement", WIDTH/2, 4*(HEIGHT/6))
        text("2 Joueurs", WIDTH/2, 3*(HEIGHT/6))
        text("3 Joueurs", WIDTH/2, 2*(HEIGHT/6))
        text("4 Joueurs", WIDTH/2, HEIGHT/6)
    else
        text("Tutorial", WIDTH/2, 5*(HEIGHT/6))
        text("Training", WIDTH/2, 4*(HEIGHT/6))
        text("2 Players", WIDTH/2, 3*(HEIGHT/6))
        text("3 Players", WIDTH/2, 2*(HEIGHT/6))
        text("4 Players", WIDTH/2, HEIGHT/6)
    end
    
    font("Futura-CondensedExtraBold")
    fontSize(20)
    if (lang == VF) then
        text("RETOUR", WIDTH - 75, HEIGHT - 30)
    else
        text("BACK", WIDTH - 75, HEIGHT - 30)
    end    
    if (CurrentTouch.state == BEGAN and CurrentTouch.x > 900 and CurrentTouch.y > 700 and
            not ok) then
        ok = true
        MENU1 = false    
        I1 = true
    end

    if (CurrentTouch.state == BEGAN and CurrentTouch.x < 600 and CurrentTouch.x > 450 and
        not ok) then
            
        if (CurrentTouch.y > 5*(HEIGHT/6) - 25 and CurrentTouch.y < 5*(HEIGHT/6) + 25) then
            ok = true
            MENU1 = false
            MENUENCONSTRUCTION = true
        end
        if (CurrentTouch.y > 4*(HEIGHT/6) - 25 and CurrentTouch.y < 4*(HEIGHT/6) + 25) then
            ok = true
            MENU1 = false
            MENUENCONSTRUCTION = true
        end     
        if (CurrentTouch.y > 3*(HEIGHT/6) - 25 and CurrentTouch.y < 3*(HEIGHT/6) + 25) then
            ok = true
            MENU1 = false
            MENU2P = true
        end
        if (CurrentTouch.y > 2*(HEIGHT/6) - 25 and CurrentTouch.y < 2*(HEIGHT/6) + 25) then
            ok = true
            MENU1 = false
            MENU3P = true
        end     
        if (CurrentTouch.y > HEIGHT/6 - 50 and CurrentTouch.y < HEIGHT/6 ) then
            ok = true
            MENU1 = false
            MENU4P = true
        end                      
  end
    popStyle()

end

function Menu:Mod4P()

    pushStyle()

    textMode(CORNER)               

    sprite("Asteroyds:espace",WIDTH/2,HEIGHT/2)

    fill(255, 255, 255, 255)
    font("AcademyEngravedLetPlain")
    fontSize(80)
    textWrapWidth(WIDTH)
    sprite("Asteroyds:TitreAsteroyds",WIDTH/2, 7*(HEIGHT/8), 600)
    fontSize(30)
    text("Pilote 1 :", WIDTH/5, HEIGHT - 250) 
    sprite("Tyrian Remastered:Ship A",WIDTH/7, HEIGHT - 225,35)
    text("Pilote 2 :", WIDTH/5, HEIGHT - 300)
    sprite("Tyrian Remastered:Ship B",WIDTH/7, HEIGHT - 275,35)
    text("Pilote 3 :", WIDTH/5, HEIGHT - 350)
    sprite("Tyrian Remastered:Ship D",WIDTH/7, HEIGHT - 325,35)
    text("Pilote 4 :", WIDTH/5, HEIGHT - 400)
    sprite("Tyrian Remastered:Ship E",WIDTH/7, HEIGHT - 375,35)

    -- affichage des images des joueurs
    sprite("Tyrian Remastered:Arrow Left",WIDTH/13,HEIGHT/4,30)
    if (self.imageJoueur[1] == 2) then
        sprite(self.images[self.imageJoueur[1]],2*WIDTH/13,HEIGHT/4,80,300)
    else
        sprite(self.images[self.imageJoueur[1]],2*WIDTH/13,HEIGHT/4,110,300)
    end
    sprite("Tyrian Remastered:Arrow Right",3*WIDTH/13,HEIGHT/4,30) 
    sprite("Tyrian Remastered:Arrow Left",4*WIDTH/13,HEIGHT/4,30)  
    if (self.imageJoueur[2] == 2) then
        sprite(self.images[self.imageJoueur[2]],5*WIDTH/13,HEIGHT/4,80,300)
    else    
        sprite(self.images[self.imageJoueur[2]],5*WIDTH/13,HEIGHT/4,110,300)
    end
    sprite("Tyrian Remastered:Arrow Right",6*WIDTH/13,HEIGHT/4,30) 
    sprite("Tyrian Remastered:Arrow Left",7*WIDTH/13,HEIGHT/4,30)  
    if (self.imageJoueur[3] == 2) then
        sprite(self.images[self.imageJoueur[3]],8*WIDTH/13,HEIGHT/4,80,300)
    else    
        sprite(self.images[self.imageJoueur[3]],8*WIDTH/13,HEIGHT/4,110,300)
    end
    sprite("Tyrian Remastered:Arrow Right",9*WIDTH/13,HEIGHT/4,30) 
    sprite("Tyrian Remastered:Arrow Left",10*WIDTH/13,HEIGHT/4,30) 
    if (self.imageJoueur[4] == 2) then
        sprite(self.images[self.imageJoueur[4]],11*WIDTH/13,HEIGHT/4,80,300)
    else     
        sprite(self.images[self.imageJoueur[4]],11*WIDTH/13,HEIGHT/4,110,300)
    end
    sprite("Tyrian Remastered:Arrow Right",12*WIDTH/13,HEIGHT/4,30) 

    -- verifie que les images des joueurs sont differentes
    self.ImagesValidate = true
    i = 1  
    j = 2
    while ( i ~= 4 ) do
        if (self.imageJoueur[i] == self.imageJoueur[j] ) then
            self.ImagesValidate = false
        end
        j = j + 1
        if (j == 5) then
            i = i + 1
            j = i + 1
        end
    end

    -- gestion de la selection des images des joueurs
    if (CurrentTouch.y < HEIGHT/4 + 30 and CurrentTouch.y > HEIGHT/4 - 30 ) then
      for i = 1,4 do
        if (CurrentTouch.x < self.left[i]*WIDTH/13 + 30 and 
            CurrentTouch.x > self.left[i]*WIDTH/13 - 30 and CurrentTouch.state == BEGAN 
            and not ok) then
                
            if (self.imageJoueur[i] > 1) then
                self.imageJoueur[i] = self.imageJoueur[i] - 1
            else
                self.imageJoueur[i] = 6
            end
            ok = true 
        end 
        if (CurrentTouch.x < i*3*WIDTH/13 + 30 and CurrentTouch.x > i*3*WIDTH/13 - 30 and 
          CurrentTouch.state == BEGAN and not ok) then
            if (self.imageJoueur[i] < 6) then
                self.imageJoueur[i] = self.imageJoueur[i] + 1
            else
                self.imageJoueur[i] = 1
            end
            ok = true 
        end
      end               
    end

    -- gestion de l'affichage du clavier pour la saisie des noms des joueurs    
    if (CurrentTouch.x < 700 and CurrentTouch.x > 300 and CurrentTouch.state == BEGAN ) then
        
        if (CurrentTouch.y < 550 and CurrentTouch.y > 500 and self.state == false) then
            self.joueur1 = true
            self.joueur2 = false
            self.joueur3 = false
            self.joueur4 = false
            self.state = true
            if (self.HideK) then
                showKeyboard()
                self.HideK = false
                self.showK = true              
            else
                hideKeyboard()
                self.HideK = true
                self.showK = false                               
            end
        end
        
        if (CurrentTouch.y < 500 and CurrentTouch.y > 450 and self.state == false) then
            self.joueur1 = false
            self.joueur2 = true
            self.joueur3 = false
            self.joueur4 = false
            self.state = true
            if (self.HideK) then
                showKeyboard()
                self.HideK = false
                self.showK = true              
            else
                hideKeyboard()
                self.HideK = true
                self.showK = false                               
            end
        end                                           
        

        if (CurrentTouch.y < 450 and CurrentTouch.y > 400 and self.state == false) then
            self.joueur1 = false
            self.joueur2 = false
            self.joueur3 = true
            self.joueur4 = false
            self.state = true
            if (self.HideK) then
                showKeyboard()
                self.HideK = false
                self.showK = true              
            else
                hideKeyboard()
                self.HideK = true
                self.showK = false                               
            end
        end        


        if (CurrentTouch.y < 400 and CurrentTouch.y > 350 and self.state == false) then
            self.joueur1 = false
            self.joueur2 = false
            self.joueur3 = false
            self.joueur4 = true
            self.state = true
            if (self.HideK) then
                showKeyboard()
                self.HideK = false
                self.showK = true              
            else
                hideKeyboard()
                self.HideK = true
                self.showK = false                               
            end
        end        
            
    else
        self.state = false
    end    

    -- affichage du nom des joueurs                     
    text(self.pilote1, 350, HEIGHT - 250)
    text(self.pilote2, 350, HEIGHT - 300)
    text(self.pilote3, 350, HEIGHT - 350)
    text(self.pilote4, 350, HEIGHT - 400)    

    -- Bouton Play
    font("Futura-CondensedExtraBold")
    fontSize(50)
    text("Play",4*WIDTH/5,3*HEIGHT/5)
    if (CurrentTouch.x < WIDTH and CurrentTouch.x > 800 and CurrentTouch.y < 3*HEIGHT/5 + 50 and
         CurrentTouch.y > 3*HEIGHT/5 - 50 and self.ImagesValidate
        and string.len(self.pilote1) > 0 and string.len(self.pilote2) > 0 and 
            string.len(self.pilote3) > 0 and string.len(self.pilote4) > 0) then
                
        saveLocalData('pilote1', self.pilote1)
        saveLocalData('pilote2', self.pilote2)
        saveLocalData('pilote3', self.pilote3)
        saveLocalData('pilote4', self.pilote4)
        
        saveLocalData('ImagePilote1', self.imageJoueur[1])
        saveLocalData('ImagePilote2', self.imageJoueur[2])
        saveLocalData('ImagePilote3', self.imageJoueur[3])
        saveLocalData('ImagePilote4', self.imageJoueur[4])
        
        JOUEURS = 4
        NBJOUEURSINGAME = 4
                
        JOUEURINGAME = {}
        for i = 1,4 do
            JOUEURINGAME[i] = true
        end
        MENU4P = false
        GAME = true    
    end

    --Bouton Retour
    font("Futura-CondensedExtraBold")
    fontSize(20)
    fill(255, 255, 255, 255)
    textMode(CENTER)               
    if (lang == VF) then
        text("RETOUR", WIDTH - 75, HEIGHT - 30)
    else
        text("BACK", WIDTH - 75, HEIGHT - 30)
    end   
    if (CurrentTouch.state == BEGAN and CurrentTouch.x > 900 and CurrentTouch.y > 700 and
            not ok) then

        ok = true
        MENU4P = false    
        MENU1 = true   
        hideKeyboard() 
    end            
    
    popStyle()
         
end

function Menu:Mod3P()

    pushStyle()

    textMode(CORNER)               

    sprite("Asteroyds:espace",WIDTH/2,HEIGHT/2)

    fill(255, 255, 255, 255)
    font("AcademyEngravedLetPlain")
    fontSize(80)
    textWrapWidth(WIDTH)
    sprite("Asteroyds:TitreAsteroyds",WIDTH/2, 7*(HEIGHT/8), 600)
    fontSize(30)
    text("Pilote 1 :", WIDTH/5, HEIGHT - 250) 
    sprite("Tyrian Remastered:Ship A",WIDTH/7, HEIGHT - 225,35)
    text("Pilote 2 :", WIDTH/5, HEIGHT - 300)
    sprite("Tyrian Remastered:Ship B",WIDTH/7, HEIGHT - 275,35)
    text("Pilote 3 :", WIDTH/5, HEIGHT - 350)
    sprite("Tyrian Remastered:Ship D",WIDTH/7, HEIGHT - 325,35)

    -- affichage des images des joueurs
    sprite("Tyrian Remastered:Arrow Left",WIDTH/10,HEIGHT/4,30)
    if (self.imageJoueur[1] == 2) then
        sprite(self.images[self.imageJoueur[1]],2*WIDTH/10,HEIGHT/4,80,300)
    else
        sprite(self.images[self.imageJoueur[1]],2*WIDTH/10,HEIGHT/4,110,300)
    end
    sprite("Tyrian Remastered:Arrow Right",3*WIDTH/10,HEIGHT/4,30) 
    sprite("Tyrian Remastered:Arrow Left",4*WIDTH/10,HEIGHT/4,30)  
    if (self.imageJoueur[2] == 2) then
        sprite(self.images[self.imageJoueur[2]],5*WIDTH/10,HEIGHT/4,80,300)
    else    
        sprite(self.images[self.imageJoueur[2]],5*WIDTH/10,HEIGHT/4,110,300)
    end
    sprite("Tyrian Remastered:Arrow Right",6*WIDTH/10,HEIGHT/4,30) 
    sprite("Tyrian Remastered:Arrow Left",7*WIDTH/10,HEIGHT/4,30)  
    if (self.imageJoueur[3] == 2) then
        sprite(self.images[self.imageJoueur[3]],8*WIDTH/10,HEIGHT/4,80,300)
    else    
        sprite(self.images[self.imageJoueur[3]],8*WIDTH/10,HEIGHT/4,110,300)
    end
    sprite("Tyrian Remastered:Arrow Right",9*WIDTH/10,HEIGHT/4,30) 

    -- verifie que les images des joueurs sont differentes
    self.ImagesValidate = true
    i = 1  
    j = 2
    while ( i ~= 3 ) do
        if (self.imageJoueur[i] == self.imageJoueur[j] ) then
            self.ImagesValidate = false
        end
        j = j + 1
        if (j == 4) then
            i = i + 1
            j = i + 1
        end
    end

    -- gestion de la selection des images des joueurs
    if (CurrentTouch.y < HEIGHT/4 + 30 and CurrentTouch.y > HEIGHT/4 - 30 ) then
      for i = 1,3 do
        if (CurrentTouch.x < self.left[i]*WIDTH/10 + 30 and 
            CurrentTouch.x > self.left[i]*WIDTH/10 - 30 and CurrentTouch.state == BEGAN 
            and not ok) then
                
            if (self.imageJoueur[i] > 1) then
                self.imageJoueur[i] = self.imageJoueur[i] - 1
            else
                self.imageJoueur[i] = 6
            end
            ok = true 
        end 
        if (CurrentTouch.x < i*3*WIDTH/10 + 30 and CurrentTouch.x > i*3*WIDTH/10 - 30 and 
          CurrentTouch.state == BEGAN and not ok) then
            if (self.imageJoueur[i] < 6) then
                self.imageJoueur[i] = self.imageJoueur[i] + 1
            else
                self.imageJoueur[i] = 1
            end
            ok = true 
        end
      end               
    end

    -- gestion de l'affichage du clavier pour la saisie des noms des joueurs    
    if (CurrentTouch.x < 700 and CurrentTouch.x > 300 and CurrentTouch.state == BEGAN ) then
        
        if (CurrentTouch.y < 550 and CurrentTouch.y > 500 and self.state == false) then
            self.joueur1 = true
            self.joueur2 = false
            self.joueur3 = false
            self.state = true
            if (self.HideK) then
                showKeyboard()
                self.HideK = false
                self.showK = true              
            else
                hideKeyboard()
                self.HideK = true
                self.showK = false                               
            end
        end
        
        if (CurrentTouch.y < 500 and CurrentTouch.y > 450 and self.state == false) then
            self.joueur1 = false
            self.joueur2 = true
            self.joueur3 = false
            self.state = true
            if (self.HideK) then
                showKeyboard()
                self.HideK = false
                self.showK = true              
            else
                hideKeyboard()
                self.HideK = true
                self.showK = false                               
            end
        end                                           
        

        if (CurrentTouch.y < 450 and CurrentTouch.y > 400 and self.state == false) then
            self.joueur1 = false
            self.joueur2 = false
            self.joueur3 = true
            self.state = true
            if (self.HideK) then
                showKeyboard()
                self.HideK = false
                self.showK = true              
            else
                hideKeyboard()
                self.HideK = true
                self.showK = false                               
            end
        end        
            
    else
        self.state = false
    end    

    -- affichage du nom des joueurs                     
    text(self.pilote1, 350, HEIGHT - 250)
    text(self.pilote2, 350, HEIGHT - 300)
    text(self.pilote3, 350, HEIGHT - 350)

    -- Bouton Play
    font("Futura-CondensedExtraBold")
    fontSize(50)
    text("Play",4*WIDTH/5,3*HEIGHT/5)
    if (CurrentTouch.x < WIDTH and CurrentTouch.x > 800 and CurrentTouch.y < 3*HEIGHT/5 + 50 and
         CurrentTouch.y > 3*HEIGHT/5 - 50 and self.ImagesValidate
        and string.len(self.pilote1) > 0 and string.len(self.pilote2) > 0 and 
            string.len(self.pilote3) > 0 ) then
                
        saveLocalData('pilote1', self.pilote1)
        saveLocalData('pilote2', self.pilote2)
        saveLocalData('pilote3', self.pilote3)
        
        saveLocalData('ImagePilote1', self.imageJoueur[1])
        saveLocalData('ImagePilote2', self.imageJoueur[2])
        saveLocalData('ImagePilote3', self.imageJoueur[3])
        
        JOUEURS = 3
        NBJOUEURSINGAME = 3
                
        JOUEURINGAME = {}
        for i = 1,3 do
            JOUEURINGAME[i] = true
        end
        JOUEURINGAME[4] = false
        MENU3P = false
        GAME = true    
    end

    --Bouton Retour
    font("Futura-CondensedExtraBold")
    fontSize(20)
    fill(255, 255, 255, 255)
    textMode(CENTER)               
    if (lang == VF) then
        text("RETOUR", WIDTH - 75, HEIGHT - 30)
    else
        text("BACK", WIDTH - 75, HEIGHT - 30)
    end   
    if (CurrentTouch.state == BEGAN and CurrentTouch.x > 900 and CurrentTouch.y > 700 and
            not ok) then

        ok = true
        MENU3P = false    
        MENU1 = true   
        hideKeyboard() 
    end            
    
    popStyle()
         
end

function Menu:Mod2P()

    pushStyle()

    textMode(CORNER)               

    sprite("Asteroyds:espace",WIDTH/2,HEIGHT/2)

    fill(255, 255, 255, 255)
    font("AcademyEngravedLetPlain")
    fontSize(80)
    textWrapWidth(WIDTH)
    sprite("Asteroyds:TitreAsteroyds",WIDTH/2, 7*(HEIGHT/8), 600)
    fontSize(30)
    text("Pilote 1 :", WIDTH/5, HEIGHT - 250) 
    sprite("Tyrian Remastered:Ship A",WIDTH/7, HEIGHT - 225,35)
    text("Pilote 2 :", WIDTH/5, HEIGHT - 300)
    sprite("Tyrian Remastered:Ship B",WIDTH/7, HEIGHT - 275,35)

    -- affichage des images des joueurs
    sprite("Tyrian Remastered:Arrow Left",WIDTH/7,HEIGHT/4,30)
    if (self.imageJoueur[1] == 2) then
        sprite(self.images[self.imageJoueur[1]],2*WIDTH/7,HEIGHT/4,80,300)
    else
        sprite(self.images[self.imageJoueur[1]],2*WIDTH/7,HEIGHT/4,110,300)
    end
    sprite("Tyrian Remastered:Arrow Right",3*WIDTH/7,HEIGHT/4,30) 
    sprite("Tyrian Remastered:Arrow Left",4*WIDTH/7,HEIGHT/4,30)  
    if (self.imageJoueur[2] == 2) then
        sprite(self.images[self.imageJoueur[2]],5*WIDTH/7,HEIGHT/4,80,300)
    else    
        sprite(self.images[self.imageJoueur[2]],5*WIDTH/7,HEIGHT/4,110,300)
    end
    sprite("Tyrian Remastered:Arrow Right",6*WIDTH/7,HEIGHT/4,30) 

    -- verifie que les images des joueurs sont differentes
    self.ImagesValidate = true
    i = 1  
    j = 2
    while ( i ~= 2 ) do
        if (self.imageJoueur[i] == self.imageJoueur[j] ) then
            self.ImagesValidate = false
        end
        j = j + 1
        if (j == 3) then
            i = i + 1
            j = i + 1
        end
    end

    -- gestion de la selection des images des joueurs
    if (CurrentTouch.y < HEIGHT/4 + 30 and CurrentTouch.y > HEIGHT/4 - 30 ) then
      for i = 1,2 do
        if (CurrentTouch.x < self.left[i]*WIDTH/7 + 30 and 
            CurrentTouch.x > self.left[i]*WIDTH/7 - 30 and CurrentTouch.state == BEGAN 
            and not ok) then
                
            if (self.imageJoueur[i] > 1) then
                self.imageJoueur[i] = self.imageJoueur[i] - 1
            else
                self.imageJoueur[i] = 6
            end
            ok = true 
        end 
        if (CurrentTouch.x < i*3*WIDTH/7 + 30 and CurrentTouch.x > i*3*WIDTH/7 - 30 and 
          CurrentTouch.state == BEGAN and not ok) then
            if (self.imageJoueur[i] < 6) then
                self.imageJoueur[i] = self.imageJoueur[i] + 1
            else
                self.imageJoueur[i] = 1
            end
            ok = true 
        end
      end               
    end

    -- gestion de l'affichage du clavier pour la saisie des noms des joueurs    
    if (CurrentTouch.x < 700 and CurrentTouch.x > 300 and CurrentTouch.state == BEGAN ) then
        
        if (CurrentTouch.y < 550 and CurrentTouch.y > 500 and self.state == false) then
            self.joueur1 = true
            self.joueur2 = false
            self.state = true
            if (self.HideK) then
                showKeyboard()
                self.HideK = false
                self.showK = true              
            else
                hideKeyboard()
                self.HideK = true
                self.showK = false                               
            end
        end
        
        if (CurrentTouch.y < 500 and CurrentTouch.y > 450 and self.state == false) then
            self.joueur1 = false
            self.joueur2 = true
            self.state = true
            if (self.HideK) then
                showKeyboard()
                self.HideK = false
                self.showK = true              
            else
                hideKeyboard()
                self.HideK = true
                self.showK = false                               
            end
        end
            
    else
        self.state = false
    end    

    -- affichage du nom des joueurs                     
    text(self.pilote1, 350, HEIGHT - 250)
    text(self.pilote2, 350, HEIGHT - 300)

    -- Bouton Play
    font("Futura-CondensedExtraBold")
    fontSize(50)
    text("Play",4*WIDTH/5,3*HEIGHT/5)
    if (CurrentTouch.x < WIDTH and CurrentTouch.x > 800 and CurrentTouch.y < 3*HEIGHT/5 + 50 and
         CurrentTouch.y > 3*HEIGHT/5 - 50 and self.ImagesValidate
        and string.len(self.pilote1) > 0 and string.len(self.pilote2) > 0 ) then
                
        saveLocalData('pilote1', self.pilote1)
        saveLocalData('pilote2', self.pilote2)
        
        saveLocalData('ImagePilote1', self.imageJoueur[1])
        saveLocalData('ImagePilote2', self.imageJoueur[2])
        
        JOUEURS = 2
        NBJOUEURSINGAME = 2
        
        JOUEURINGAME = {}
        for i = 1,2 do
            JOUEURINGAME[i] = true
        end
        JOUEURINGAME[3] = false
        JOUEURINGAME[4] = false
        MENU2P = false
        GAME = true    
    end

    --Bouton Retour
    font("Futura-CondensedExtraBold")
    fontSize(20)
    fill(255, 255, 255, 255)
    textMode(CENTER)               
    if (lang == VF) then
        text("RETOUR", WIDTH - 75, HEIGHT - 30)
    else
        text("BACK", WIDTH - 75, HEIGHT - 30)
    end   
    if (CurrentTouch.state == BEGAN and CurrentTouch.x > 900 and CurrentTouch.y > 700 and
            not ok) then

        ok = true
        MENU2P = false    
        MENU1 = true   
        hideKeyboard() 
    end            
    
    popStyle()
         
end
