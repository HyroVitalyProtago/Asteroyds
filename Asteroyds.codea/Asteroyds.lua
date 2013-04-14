Asteroyds = class()

function Asteroyds:init()

    -- 1-rouge 2-blanc 3-bleu 4-rougeBlanc 5-bleuBlanc 6-Pod 7-platesFormes 8-portesBlanches
        -- 9-portesRouges

    --Initialisation des asteroides

    --for etage = 1,5 do
    etage = 5
        grid[3][2][etage] = 101
        grid[5][11][etage] = 102
        grid[7][9][etage] = 103
        grid[10][5][etage] = 104
        grid[13][8][etage] = 105
        grid[2][8][etage] = 201
        grid[3][10][etage] = 202
        grid[4][6][etage] = 203
        grid[8][5][etage] = 204
        grid[10][11][etage] = 205
        grid[13][4][etage] = 206
        grid[1][3][etage] = 301
        grid[5][6][etage] = 302
        grid[10][2][etage] = 303
        grid[10][8][etage] = 304
        grid[13][11][etage] = 305
        grid[2][6][etage] = 401
        grid[5][8][etage] = 402
        grid[9][2][etage] = 403
        grid[12][10][etage] = 404
        grid[1][10][etage] = 501
        grid[5][3][etage] = 502
        grid[8][8][etage] = 503
        grid[11][6][etage] = 504
        
        grid[7][5][etage] = 601
        grid[7][6][etage] = 601
        grid[7][7][etage] = 601
        grid[6][6][etage] = 601
        grid[6][7][etage] = 601
        grid[8][6][etage] = 601
        grid[8][7][etage] = 601

    --end

    nbA = 1
    dA = {} -- Donnees Asteroyds
   
    dA[nbA] = {101,math.random(6),50}
    nbA = nbA + 1    
    dA[nbA] = {102,math.random(6),50}
    nbA = nbA + 1    
    dA[nbA] = {103,math.random(6),50}
    nbA = nbA + 1    
    dA[nbA] = {104,math.random(6),50}
    nbA = nbA + 1    
    dA[nbA] = {105,math.random(6),50}
    nbA = nbA + 1
    
    dA[nbA] = {201,math.random(6),50}
    nbA = nbA + 1    
    dA[nbA] = {202,math.random(6),50}
    nbA = nbA + 1
    dA[nbA] = {203,math.random(6),50}
    nbA = nbA + 1    
    dA[nbA] = {204,math.random(6),50}
    nbA = nbA + 1    
    dA[nbA] = {205,math.random(6),50}
    nbA = nbA + 1   
    dA[nbA] = {206,math.random(6),50}
    nbA = nbA + 1

    dA[nbA] = {301,math.random(6),50}
    nbA = nbA + 1
    dA[nbA] = {302,math.random(6),50}
    nbA = nbA + 1
    dA[nbA] = {303,math.random(6),50}
    nbA = nbA + 1
    dA[nbA] = {304,math.random(6),50}
    nbA = nbA + 1
    dA[nbA] = {305,math.random(6),50}
    nbA = nbA + 1

    
    dA[nbA] = {401,math.random(6),50}
    nbA = nbA + 1
    dA[nbA] = {402,math.random(6),50}
    nbA = nbA + 1
    dA[nbA] = {403,math.random(6),50}
    nbA = nbA + 1
    dA[nbA] = {404,math.random(6),50}
    nbA = nbA + 1

    dA[nbA] = {501,math.random(6),50}
    nbA = nbA + 1
    dA[nbA] = {502,math.random(6),50}
    nbA = nbA + 1
    dA[nbA] = {503,math.random(6),50}
    nbA = nbA + 1
    dA[nbA] = {504,math.random(6),50}
    nbA = nbA + 1

    -- portes
    grid[3][3][5] = 801
    dA[nbA] = {801,math.random(6),50}
    nbA = nbA + 1
    grid[11][9][5] = 802
    dA[nbA] = {802,math.random(6),50}
    nbA = nbA + 1

    grid[3][9][5] = 901
    dA[nbA] = {901,math.random(6),50}
    nbA = nbA + 1
    grid[11][3][5] = 902
    dA[nbA] = {902,math.random(6),50}
    nbA = nbA + 1

    grid[4][1][5] = 701
    grid[6][1][5] = 701
    grid[8][1][5] = 701
    grid[10][1][5] = 701        

end

function Asteroyds:draw()
    
    for i = 1,13 do
        for j = 1,11 do
            if grid[i][j][5] > 4 then
                asx = 30 + (i-1)*50
                if i%2 == 0 then
                    asy = 50 + (j-1)*60
                else
                    asy = 80 + (j-1)*60
                end
            end

            ident = grid[i][j][5]

            if grid[i][j][5] > 100 and grid[i][j][5] < 200  then
                tint(255, 0, 0, 255)
                sprite("Tyrian Remastered:Rock 3",asx+10,asy+20, 33)
                oa.desAs()
            end

            if grid[i][j][5] > 200 and grid[i][j][5] < 300 then
                tint(255, 255, 255, 255)
                sprite("Tyrian Remastered:Rock 4",asx+10,asy+20, 33)
                oa.desAs()
            end

            if grid[i][j][5] > 300 and grid[i][j][5] < 400 then
                tint(0, 0, 255, 255)
                sprite("Tyrian Remastered:Rock 5",asx+10,asy+20, 33)
                oa.desAs()
            end

            if grid[i][j][5] > 400 and grid[i][j][5] < 500 then
                noTint()
                sprite("Tyrian Remastered:Firestroid",asx+10,asy+20, 33)
                oa.desAs()
            end

            if grid[i][j][5] > 500 and grid[i][j][5] < 600 then
                noTint()
                sprite("Tyrian Remastered:Space Ice 5",asx+10,asy+20, 30)
                oa.desAs()
            end

            if grid[i][j][5] > 600 and grid[i][j][5] < 700 then
                noTint()
                sprite("Asteroyds:Pod3",asx+12,asy+20, 60)
            end

            if grid[i][j][5] > 700 and grid[i][j][5] < 800 then
                noTint()
                sprite("Asteroyds:Platforme",asx+9,asy+20, 62)
            end

            if grid[i][j][5] > 800 and grid[i][j][5] < 900 then
                noTint()
                if (grid[i][j][5] == 801) then
                    sprite("Asteroyds:Porte3",asx+10,asy+20, 70)
                elseif (grid[i][j][5] == 802) then
                    sprite("Asteroyds:Porte4",asx+10,asy+20, 70)
                end
                oa.desAs()
            end

            if grid[i][j][5] > 900 and grid[i][j][5] < 1000 then
                noTint()
                if (grid[i][j][5] == 901) then
                    sprite("Asteroyds:testGimp2",asx+10,asy+20, 67)
                elseif (grid[i][j][5] == 902) then
                    sprite("Asteroyds:Porte2",asx+10,asy+20, 67)
                end
                oa.desAs()
            end

        end
    end

end