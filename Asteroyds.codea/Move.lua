Move = class()

function Move:init()
  self.frame = 0
  finMove = false
end

function Move:draw(j)

    numLigne = vaisseauxJoueurs[joueur][1] 
    numColonne = vaisseauxJoueurs[joueur][2]
    orientation = vaisseauxJoueurs[joueur][3]

   --for j = 1,7 do

       if finMove == false then
           if choix[joueur][j][1] and j < 7 then
               if orientation > 3 then
                   orientation = orientation -3
               else
                   orientation = orientation + 3
               end
           elseif choix[joueur][j][2] then
               if orientation < 6 then
                   orientation = orientation + 1
               else
                   orientation = 1
               end
               self.avance()
           elseif choix[joueur][j][3] then
               if orientation > 1 then
                   orientation = orientation -1
               else
                   orientation = 6
               end
               self.avance()
           elseif choix[joueur][j][4] then
               self.avance()
           elseif choix[joueur][j][5] then
               --gestion des tirs, mine, etc...
           else
               finMove = true
           end
       end

        vaisseauxJoueurs[joueur][1] = numLigne
        vaisseauxJoueurs[joueur][2] = numColonne
        vaisseauxJoueurs[joueur][3] = orientation
    
   --end

   --stop = true

end

--gestion du mouvement du vaisseau du pilote
function Move:avance()

    --gestion du bouclier
   if choix[joueur][7][1] == true then
       bouclier = 1
   else
       bouclier = 0
   end

   grid[numColonne][numLigne][joueur] = 0

   if orientation == 1 then
       if numLigne + 1 > 11 then
           FoncFinMove()
       elseif grid[numColonne][numLigne+1][5] > 1 then
           presencePorte(0, 1)
       else
           numLigne = numLigne + 1
       end

   elseif orientation == 2 then

       if numColonne%2 == 0 then
           if numColonne -1 < 1 then
               FoncFinMove()
        elseif grid[numColonne -1][numLigne][5] > 1 then
               presencePorte(-1, 0)
           else
               numColonne = numColonne -1
           end
       else
           if numLigne + 1 > 11 or numColonne -1 < 1 then
               FoncFinMove()
           elseif grid[numColonne -1 ][numLigne+1][5] > 1 then
               presencePorte(-1, 1)
           else
               numLigne = numLigne + 1
               numColonne = numColonne -1
           end
       end

   elseif orientation == 3 then

       if numColonne%2 == 0 then
           if numLigne -1 < 1 or numColonne -1 < 1 then
               FoncFinMove()
           elseif grid[numColonne -1][numLigne -1][5] > 1 then
               presencePorte(-1, -1)
           else
               numColonne = numColonne -1
               numLigne = numLigne -1
           end
       else
           if numColonne -1 < 1 then
               FoncFinMove()
           elseif grid[numColonne -1 ][numLigne][5] > 1 then
               presencePorte(-1, 0)
           else
               numColonne = numColonne -1
           end
       end        

   elseif orientation == 4 then

       if numLigne -1 < 1 then
           FoncFinMove()
       elseif grid[numColonne][numLigne -1][5] > 1 then
           presencePorte(0, -1)
       else
           numLigne = numLigne -1
       end

   elseif orientation == 5 then

       if numColonne%2 == 0 then
           if numLigne -1 < 1 or numColonne + 1 > 13 then
               FoncFinMove()
           elseif grid[numColonne +1][numLigne -1][5] > 1 then
               presencePorte(1, -1)
           else
               numColonne = numColonne +1
               numLigne = numLigne -1
           end
       else
           if numColonne + 1 > 13 then
               FoncFinMove()
           elseif grid[numColonne +1][numLigne][5] > 1 then
               presencePorte(1, 0)
           else
               numColonne = numColonne +1
           end
       end

   elseif orientation == 6 then

       if numColonne%2 == 0 then
           if numColonne + 1 > 13 then
               FoncFinMove()
           elseif grid[numColonne +1][numLigne][5] > 1 then
               presencePorte(1, 0)
           else
               numColonne = numColonne +1
           end
       else
           if numColonne + 1 > 13 or numLigne + 1 > 11 then
               FoncFinMove()
           elseif grid[numColonne +1][numLigne +1][5] > 1 then
               presencePorte(1, 1)
           else
               numColonne = numColonne +1
               numLigne = numLigne +1
           end
       end
       
   end

   grid[numColonne][numLigne][joueur] = joueur

end

function presencePorte(i ,j)
   colonne = i
   ligne = j
   
   if grid[numColonne + i][numLigne + j][5] > 700 then
        if grid[numColonne + i][numLigne + j][5] == 901 and not pilote.score[joueur][1] then
            sound(SOUND_PICKUP, 38729)
            pilote.score[joueur][1] = true
        elseif grid[numColonne + i][numLigne + j][5] == 902 and not pilote.score[joueur][2] then
            sound(SOUND_PICKUP, 38729)
            pilote.score[joueur][2] = true
        elseif grid[numColonne + i][numLigne + j][5] == 801 and not pilote.score[joueur][3] then
            sound(SOUND_PICKUP, 38729)
            pilote.score[joueur][3] = true
        elseif grid[numColonne + i][numLigne + j][5] == 802 and not pilote.score[joueur][4] then
            sound(SOUND_PICKUP, 38729)
            pilote.score[joueur][4] = true    
        end
       numColonne = numColonne + i
       numLigne = numLigne + j
   else
       FoncFinMove()
   end
end

function FoncFinMove()
   degats[joueur] = degats[joueur] + 2 - bouclier
   finMove = true
   sound(SOUND_EXPLODE, 80)
end



