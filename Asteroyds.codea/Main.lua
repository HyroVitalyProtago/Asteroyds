-- pour tests, I0 false and GAME true
I0 = true
I1 = false
RULES = false
MENU1 = false
MENU2P = false
MENU3P = false
MENU4P = false
GAME = false
END = false
MENUENCONSTRUCTION = false
JOUEURS = 0
NBJOUEURSINGAME = 0
-- langages
EN = 0
VF = 1
lang = VF

function setup()
    --Gestion du mode d'affichage
    displayMode(FULLSCREEN)
    supportedOrientations(LANDSCAPE_ANY)
    
    -- initialisation des classes
    interface = Interface()
    menu = Menu()
    rules = Rules()
    plateau = Plateau()
    pilote = Pilote()
    vaisseaux = Vaisseaux()
    chrono = Chrono()
    des = Des()
    asteroyds = Asteroyds()
    oa = OrientationAsteroyds()
    move = Move()
    anotherMove = AnotherMove()
    moveA = MoveA()

    -- Amelioration de la rapidite d'affichage des rules    
    -- CHARGEMENT ...    
    if (I0) then
        sprite("Asteroyds:page_1", 0, 0)
        sprite("Asteroyds:page_2", 0, 0)
        sprite("Asteroyds:page_3", 0, 0)
        sprite("Asteroyds:page_4", 0, 0)
        sprite("Asteroyds:page_5", 0, 0)
        sprite("Asteroyds:page_6", 0, 0)
        sprite("Asteroyds:page_7", 0, 0)
        sprite("Asteroyds:page_8", 0, 0)
        sprite("Asteroyds:page_1US", 0, 0)
        sprite("Asteroyds:page_2US", 0, 0)
        sprite("Asteroyds:page_3US", 0, 0)
        sprite("Asteroyds:page_4US", 0, 0)
        sprite("Asteroyds:page_5US", 0, 0)
        sprite("Asteroyds:page_6US", 0, 0)
        sprite("Asteroyds:page_7US", 0, 0)
        sprite("Asteroyds:page_8US", 0, 0)
    end

    -- initialisation du joueur ...
    joueur = 1

    -- gestion de l'initialisation de l'interface
    OK = true --animation du menu
    ok = false --gestion des boutons
    
    debutMoov = false
    nbMoov = 2
    go = false
    attente = false
    stop = false
    finTour = false
    finMoveV = false
    jOueur = 1
end

function draw()
 
    background(0, 0, 0, 255)
    
    if (I0) then -- Intro
        interface:draw1()        
    end

    if (I1) then -- Menu Racine
        if (OK) then
            SHIPA = true
            SHIPB = false
            SHIPD = false
            SHIPE = false
            interface.x = 0
            interface.y = math.random(HEIGHT)
            OK = false
        end        
        interface:draw2()
        rules.opacity = 0  
        rules.y = 0   
    end

    if (RULES) then
        -- Affichage des règles
        rules:draw()  
    end

    if (MENU1) then
        -- Choix du mode
        noTint()
        menu:draw1()
    end

    if (MENU2P) then
        -- Saisie du nom des joueurs
        noTint()
        menu:Mod2P()
    end

    if (MENU3P) then
        -- Saisie du nom des joueurs
        noTint()
        menu:Mod3P()
    end

    if (MENU4P) then
        -- Saisie du nom des joueurs
        noTint()
        menu:Mod4P()
    end

    if (MENUENCONSTRUCTION) then
        -- Affichage du Menu
        noTint()
        menu:draw3()
    end

    if (GAME) then
        -- Affichage du plateau
        noTint()
        plateau:draw()
        -- Affichage du score du joueur
        pilote:draw()
        -- Affichage des asteroyds
        asteroyds:draw()
        --Vaisseaux
        noTint()
        vaisseaux:draw()
        -- Gestion du chrono et des dés
        chrono:draw()
        chrono:PassBouton()
        des:draw()
        
        if (CurrentTouch.y > 650 and CurrentTouch.x > 4*WIDTH/5 - 50 and  
                CurrentTouch.x < 4*WIDTH/5 + 50 and CurrentTouch.state == BEGAN and 
                    not ok and not termin) then
            ok = true
                decompte = 3
                finTour = false
                nbMoov = 2
                debutMoov = false
                finMove = false
                
                stop = false
                finMoveV = false
                --jOueur = 1
                jOueur = FirstPilote()
                
                pilote:InitChoix()
                
                secondes = 30
            go = true -- depart du chrono
        end

        if go == true then --3 secondes pour lancer les des
            chrono:touched()
            des:touched()        
        end
               
        if termin == true then 
            --30 secondes pour permettre au joueur de programmer son deplacement
            chrono:decompte2()
            if secondes > 0 then
                chrono:TouchPassBouton() 
                pilote:touched()        
            end
            go = false           
        end
        
        Time = os.date("*t").sec
        Time = Time + 60 * os.date("*t").min
        Time = Time + 3600 * os.date("*t").hour
        Time = Time + 86400 * os.date("*t").day

    if (joueur == LastPilote()) then
        finTour = true
    end

        if (secondes == 0 and not attente) then
            if (joueur < LastPilote() and not finTour) then 
                -- attente entre les joueurs + securite 2s
                joueur = joueur + 1
                while not JOUEURINGAME[joueur] do
                    joueur = joueur + 1
                end
                attente = true
                
                DebutTime = os.date("*t").sec
                DebutTime = DebutTime + 60 * os.date("*t").min
                DebutTime = DebutTime + 3600 * os.date("*t").hour
                DebutTime = DebutTime + 86400 * os.date("*t").day
            elseif (not stop) then -- mouvement des asteroyds
                moveA:DesOrient()
            elseif (stop and not finMoveV and not finMove) then -- mouvement des vaisseaux
                joueur = jOueur
                vaisseaux:moveV()
                if (jOueur == LastPilote() and finMove) then
                    finMoveV = true
                end
            elseif (finMove and jOueur < LastPilote() and not finMoveV) then 
                -- passage au joueur suivant
                nbMoov = 2
                debutMoov = false
                finMove = false
                jOueur = jOueur + 1
            elseif (finMove and finMoveV) then --reinitialisation
                joueur = FirstPilote()
                if (win()) then
                    END = true
                    GAME = false
                end
                go = false
                termin = false
            end
        end
        
        if (attente) then -- affichage de la 'zone' d'attente
            
            chrono.DebutTime = os.date("*t").sec
            chrono.DebutTime = chrono.DebutTime + 60 * os.date("*t").min
            chrono.DebutTime = chrono.DebutTime + 3600 * os.date("*t").hour
            chrono.DebutTime = chrono.DebutTime + 86400 * os.date("*t").day
            
            pushMatrix()
            zLevel(5)
            --test cache des
                sprite("Tyrian Remastered:Bad Case",800,730,200,120)
            --sprite("Asteroyds:espace",WIDTH/2,HEIGHT/2)
            
            --sprite(menu.images[menu.imageJoueur[joueur]],WIDTH/2,HEIGHT - 400)
            
            --fill(255, 255, 255, 255)
            --font("Copperplate-Light")
            --fontSize(50)
            --text("" .. nomPilote[joueur],WIDTH/2,8*HEIGHT/9)
            popMatrix()
            
            if (CurrentTouch.state == BEGAN and not ok and Time > DebutTime + 2) then
                -- Sortie de la zone d'attente 
                ok = true
                secondes = 30
                attente = false
            end
        end
        
     end

    if (END) then
        
        if CurrentTouch.state == BEGAN and not ok then
            END = false
            ok = true
            pilote = Pilote()
            vaisseaux = Vaisseaux()
            chrono = Chrono()
            asteroyds = Asteroyds()
            oa = OrientationAsteroyds()
            move = Move()
            anotherMove = AnotherMove()
            moveA = MoveA()
            
            debutMoov = false
            nbMoov = 2
            go = false
            attente = false
            stop = false
            finTour = false
            finMoveV = false
            jOueur = 1
            I1 = true            
        end
        
        sprite("Asteroyds:espace2",WIDTH/2,HEIGHT/2)
        for i = 1,JOUEURS do
            fontSize(75)
            fill(255, 255, 255, 255)
            text("" .. nomPilote[i],WIDTH/3,i*HEIGHT/(JOUEURS+1))
            if (not JOUEURINGAME[i]) then
                text("Mort",2*WIDTH/3,i*HEIGHT/(JOUEURS+1))
            else
                text("Vivant ...",2*WIDTH/3,i*HEIGHT/(JOUEURS+1))
            end
            noFill()
        end
    end

    if (CurrentTouch.state == ENDED) then -- gestion des touches (boutons)
        ok = false
    end

end

function win()
    
    gagne = false
    i = 1
    score = pilote.score
    while i < JOUEURS and not gagne do
        if score[i][1] and score[i][2] and score[i][3] and score[i][4] then
            gagne = true
        end
        i = i + 1
    end
    
    return gagne
    
end

function keyboard(key) -- gestion du clavier
        if key ~= nil then
            if string.byte(key) == 10 then
                hideKeyboard()
                menu.HideK = true
                menu.showK = false
            elseif string.byte(key) == nil then
              if (menu.joueur1) then
                if string.len(menu.pilote1) > 0 then
                    menu.pilote1 = string.sub(menu.pilote1, 1, string.len(menu.pilote1) - 1)
                end
              elseif (menu.joueur2) then
                if string.len(menu.pilote2) > 0 then
                    menu.pilote2 = string.sub(menu.pilote2, 1, string.len(menu.pilote2) - 1)
                end
              elseif (menu.joueur3) then
                if string.len(menu.pilote3) > 0 then
                    menu.pilote3 = string.sub(menu.pilote3, 1, string.len(menu.pilote3) - 1)
                end
              elseif (menu.joueur4) then
                if string.len(menu.pilote4) > 0 then
                    menu.pilote4 = string.sub(menu.pilote4, 1, string.len(menu.pilote4) - 1)
                end
              end
            else
              if (menu.joueur1 and string.len(menu.pilote1) < 16) then
                menu.pilote1 = menu.pilote1..key
              elseif (menu.joueur2 and string.len(menu.pilote2) < 16) then
                menu.pilote2 = menu.pilote2..key
              elseif (menu.joueur3 and string.len(menu.pilote3) < 16) then
                menu.pilote3 = menu.pilote3..key
              elseif (menu.joueur4 and string.len(menu.pilote4) < 16) then
                menu.pilote4 = menu.pilote4..key
              end
            end
        end
end

function FirstPilote()
    if JOUEURINGAME[1] then
        return 1
    elseif JOUEURINGAME[2] then
        return 2
    elseif JOUEURINGAME[3] then
        return 3
    elseif JOUEURINGAME[4] then
        return 4
    else
        GAME = false
        END = true
        return 1
    end
end

function LastPilote()
    if JOUEURINGAME[4] then
        return 4
    elseif JOUEURINGAME[3] then
        return 3
    elseif JOUEURINGAME[2] then
        return 2
    elseif JOUEURINGAME[1] then
        return 1
    else
        GAME = false
        END = true
        return 1
    end
end