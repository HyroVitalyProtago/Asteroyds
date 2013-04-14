AnotherMove = class()

function AnotherMove:init()
end

function VerifPosLibre(a,b)

    if grid[a][b][5] == 0 and grid[a][b][4] == 0 and grid[a][b][3] == 0 and grid[a][b][2] == 0 
        and grid[a][b][1] == 0 then
            
        return true
    else
        return false
    end

end

function VerifPosNoLibre(a,b)

    if grid[a][b][5] > 0 or grid[a][b][4] > 0 or grid[a][b][3] > 0 or grid[a][b][2] > 0 
        or grid[a][b][1] > 0 then
            
        return true
    else
        return false
    end

end

function AnotherMove:draw()
   --draw for blue asteroids

   numColonneA = ncA
   numLigneA = nlA

   grid[numColonneA][numLigneA][5] = 0

   if orientationA == 1 then

       if numLigneA + 1 < 12 then 
           if VerifPosNoLibre(numColonneA,numLigneA + 1) then
            if grid[numColonneA][numLigneA + 1][5] > 0 then
               if numLigneA + 2 < 12 and VerifPosLibre(numColonneA,numLigneA + 2) then               
                   grid[numColonneA][numLigneA + 2][5] = grid[numColonneA][numLigneA + 1][5]
                   numLigneA = numLigneA + 1                           
               end
            end
           else
               numLigneA = numLigneA + 1
           end
       end

   elseif orientationA == 2 then
   
       if numColonneA%2 == 0 then
       
           if numColonneA - 1 > 0 then
               if VerifPosNoLibre(numColonneA - 1,numLigneA) then
                if grid[numColonneA - 1][numLigneA][5] > 0 then
                   if numColonneA - 2 > 0 and numLigneA + 1 < 12 and 
                        VerifPosLibre(numColonneA - 2,numLigneA + 1) then
                   
                     grid[numColonneA - 2][numLigneA + 1][5] = grid[numColonneA - 1][numLigneA][5]
                     numColonneA = numColonneA - 1
                   end
                end
               else
                   numColonneA = numColonneA - 1
               end
           end
           
       else
       
           if numLigneA + 1 < 12 and numColonneA - 1 > 0 then
               if VerifPosNoLibre(numColonneA - 1 ,numLigneA + 1) then
                if grid[numColonneA - 1][numLigneA + 1][5] > 0 then
                   if numColonneA - 2 > 0 and numLigneA + 1 < 12 and 
                        VerifPosLibre(numColonneA - 2,numLigneA + 1) then
                           
              grid[numColonneA - 2][numLigneA + 1][5] = grid[numColonneA - 1][numLigneA + 1][5]
                       numColonneA = numColonneA - 1
                       numLigneA = numLigneA + 1
                   end
                end
               else
                   numLigneA = numLigneA + 1
                   numColonneA = numColonneA - 1
               end
           end
               
       end
       
   elseif orientationA == 3 then
   
       if numColonneA%2 == 0 then
       
           if numLigneA - 1 > 0 and numColonneA - 1 > 0 then
               if VerifPosNoLibre(numColonneA - 1 ,numLigneA - 1 ) then
                if grid[numColonneA - 1][numLigneA - 1][5] > 0 then
                   if numColonneA - 2 > 0 and numLigneA - 1 > 0 and
                        VerifPosLibre(numColonneA - 2,numLigneA - 1) then
                           
            grid[numColonneA - 2][numLigneA - 1][5] = grid[numColonneA - 1][numLigneA - 1][5]
                       numColonneA = numColonneA - 1
                       numLigneA = numLigneA - 1
                   end
                end
               else
                   numColonneA = numColonneA - 1
                   numLigneA = numLigneA - 1
               end
           end

       else

           if numColonneA - 1 > 0 then
               if VerifPosNoLibre(numColonneA - 1,numLigneA) then
                if grid[numColonneA - 1][numLigneA][5] > 0 then
                   if numColonneA - 2 > 0 and numLigneA - 1 > 0 and
                        VerifPosLibre(numColonneA - 2,numLigneA - 1) then
                       
                    grid[numColonneA - 2][numLigneA - 1][5] = grid[numColonneA - 1][numLigneA][5]
                       numColonneA = numColonneA - 1
                   end
                end
               else
                   numColonneA = numColonneA - 1
               end
           end

       end

   elseif orientationA == 4 then
   
       if numLigneA - 1 > 0 then
           if VerifPosNoLibre(numColonneA,numLigneA - 1) then
            if grid[numColonneA][numLigneA - 1][5] > 0 then
               if numLigneA - 2 > 0 and VerifPosLibre(numColonneA,numLigneA - 2) then
                   grid[numColonneA][numLigneA - 2][5] = grid[numColonneA][numLigneA - 1][5]
                   numLigneA = numLigneA - 1
               end
            end
           else
               numLigneA = numLigneA - 1
           end
       end

   elseif orientationA == 5 then
   
       if numColonneA%2 == 0 then
       
           if numLigneA - 1 > 0 and numColonneA + 1 < 14 then
               if VerifPosNoLibre(numColonneA + 1 ,numLigneA - 1) then
                if grid[numColonneA + 1][numLigneA - 1][5] > 0 then
                   if numColonneA + 2 < 14 and numLigneA - 1 > 0 and
                        VerifPosLibre(numColonneA + 2,numLigneA - 1) then
                           
            grid[numColonneA + 2][numLigneA - 1][5] = grid[numColonneA + 1][numLigneA - 1][5]
                       numColonneA = numColonneA + 1
                       numLigneA = numLigneA -1
                   end
                end
               else
                   numColonneA = numColonneA + 1
                   numLigneA = numLigneA - 1
               end
           end
               
       else
       
           if numColonneA + 1 < 14 then 
               if VerifPosNoLibre(numColonneA + 1,numLigneA) then
                if grid[numColonneA + 1][numLigneA][5] > 0 then
                   if numColonneA + 2 < 14 and numLigneA - 1 > 0 and
                            VerifPosLibre(numColonneA + 2,numLigneA - 1) then
                     grid[numColonneA + 2][numLigneA - 1][5] = grid[numColonneA + 1][numLigneA][5]
                       numColonneA = numColonneA + 1
                   end
                end
               else
                   numColonneA = numColonneA + 1
               end
           end
           
       end

   elseif orientationA == 6 then
   
       if numColonneA%2 == 0 then
       
           if numColonneA + 1 < 14 then 
               if VerifPosNoLibre(numColonneA + 1,numLigneA) then
                if grid[numColonneA + 1][numLigneA][5] > 0 then
                   if numColonneA + 2 < 14 and numLigneA + 1 < 12 and
                        VerifPosLibre(numColonneA + 2,numLigneA + 1) then
                     grid[numColonneA + 2][numLigneA + 1][5] = grid[numColonneA + 1][numLigneA][5]
                       numColonneA = numColonneA + 1
                   end
                end
               else
                   numColonneA = numColonneA + 1
               end
           end
           
       else
       
           if numLigneA + 1 < 12 and numColonneA + 1 < 14 then 
               if VerifPosNoLibre(numColonneA + 1 ,numLigneA + 1) then
                if grid[numColonneA + 1][numLigneA + 1][5] > 0 then
                   if numColonneA + 2 < 14 and numLigneA + 1 < 12 and
                        VerifPosLibre(numColonneA + 2,numLigneA + 1) then
                grid[numColonneA + 2][numLigneA + 1][5] = grid[numColonneA + 1][numLigneA + 1][5]
                       numColonneA = numColonneA + 1
                       numLigneA = numLigneA + 1
                   end
                end
               else
                   numColonneA = numColonneA + 1
                   numLigneA = numLigneA + 1
               end
           end
           
       end

   end

   finMoveA = true

   grid[numColonneA][numLigneA][5] = idA


end

function AnotherMove:draw2()
   --Draw for doors

   tmp = porte
   numColonneA = ncA
   numLigneA = nlA

   grid[numColonneA][numLigneA][5] = 0

   if orientationA == 1 then
   
       if numLigneA + 1 < 12 then
           if grid[numColonneA][numLigneA + 1][5] == 0 then
               numLigneA = numLigneA + 1        
           elseif grid[numColonneA][numLigneA + 1][5] == 1 then
               porte = porte + 1
           end        
       end

   elseif orientationA == 2 then
   
       if numColonneA%2 == 0 then
       
           if numColonneA - 1 > 0 then
               if grid[numColonneA - 1][numLigneA][5] == 0 then
                   numColonneA = numColonneA - 1
               elseif grid[numColonneA - 1][numLigneA][5] == 1 then
                   porte = porte + 1
               end           
           end
               
       else
       
           if numLigneA + 1 < 12 and numColonneA - 1 > 0 then
               if grid[numColonneA - 1][numLigneA + 1][5] == 0 then
                   numLigneA = numLigneA + 1
                   numColonneA = numColonneA - 1                
               elseif grid[numColonneA - 1][numLigneA + 1][5] == 1 then
                   porte = porte + 1
               end
           end
       end
       
   elseif orientationA == 3 then
   
       if numColonneA%2 == 0 then
       
           if numLigneA - 1 > 0 and numColonneA - 1 > 0 then
               if grid[numColonneA - 1][numLigneA - 1][5] == 0 then
                   numColonneA = numColonneA - 1
                   numLigneA = numLigneA - 1
               elseif grid[numColonneA - 1][numLigneA - 1][5] == 1 then
                   porte = porte + 1
               end
           end
               
       else
       
           if numColonneA - 1 > 0 then
               if grid[numColonneA - 1][numLigneA][5] == 0 then
                   numColonneA = numColonneA - 1
               elseif grid[numColonneA - 1][numLigneA][5] == 1 then
                   porte = porte + 1
               end
           end
           
       end

   elseif orientationA == 4 then
   
       if numLigneA - 1 > 0 then 
           if grid[numColonneA ][numLigneA - 1][5] == 0 then
               numLigneA = numLigneA - 1
           elseif grid[numColonneA ][numLigneA - 1][5] == 1 then
               porte = porte + 1
           end
       end
       
   elseif orientationA == 5 then
   
       if numColonneA%2 == 0 then
       
           if numLigneA - 1 > 0 and numColonneA + 1 < 14 then
               if grid[numColonneA + 1][numLigneA - 1][5] == 0 then
                   numColonneA = numColonneA + 1
                   numLigneA = numLigneA - 1
               elseif grid[numColonneA + 1][numLigneA - 1][5] == 1 then
                   porte = porte + 1
               end       
           end
           
       else
       
           if numColonneA + 1 < 14 then
               if grid[numColonneA + 1][numLigneA][5] == 0 then
                   numColonneA = numColonneA + 1
               elseif grid[numColonneA + 1][numLigneA][5] == 1 then
                   porte = porte + 1
               end       
           end
           
       end

   elseif orientationA == 6 then
   
       if numColonneA%2 == 0 then
       
           if numColonneA + 1 < 14 then
               if grid[numColonneA + 1][numLigneA][5] == 0 then
                   numColonneA = numColonneA + 1                
               elseif grid[numColonneA + 1][numLigneA][5] == 1 then
                   porte = porte + 1
               end
           end

       else
       
           if numLigneA + 1 < 12 and numColonneA + 1 < 14 then
               if grid[numColonneA + 1][numLigneA + 1][5] == 0 then
                   numColonneA = numColonneA + 1
                   numLigneA = numLigneA + 1                
               elseif grid[numColonneA + 1][numLigneA + 1][5] == 1 then
                   porte = porte + 1
               end               
           end
           
       end
       
   end

   if  tmp == porte then
       grid[numColonneA][numLigneA][5] = idA
   end

   finMoveA = true

end
