MoveA = class()

function MoveA:init()
    
  ncA = 0
  nlA = 0
  concordance = {}

  for i = 1,6 do
     concordance[i] = {}
  end
  x = 1
  concordance[x][1] = 1
  concordance[x][2] = 3
  concordance[x][3] = 5
  concordance[x][4] = 2
  concordance[x][5] = 6
  concordance[x][6] = 4
  x = 2
  concordance[x][1] = 2
  concordance[x][2] = 4
  concordance[x][3] = 6
  concordance[x][4] = 3
  concordance[x][5] = 1
  concordance[x][6] = 5
  x = 3
  concordance[x][1] = 3
  concordance[x][2] = 5
  concordance[x][3] = 1
  concordance[x][4] = 4
  concordance[x][5] = 2
  concordance[x][6] = 6
  x = 4
  concordance[x][1] = 4
  concordance[x][2] = 6
  concordance[x][3] = 2
  concordance[x][4] = 5
  concordance[x][5] = 3
  concordance[x][6] = 1
  x = 5
  concordance[x][1] = 5
  concordance[x][2] = 1
  concordance[x][3] = 3
  concordance[x][4] = 6
  concordance[x][5] = 4
  concordance[x][6] = 2
  x = 6
  concordance[x][1] = 6
  concordance[x][2] = 2
  concordance[x][3] = 4
  concordance[x][4] = 1
  concordance[x][5] = 5
  concordance[x][6] = 3

  finMoveA = false

end

function VerifPosLibre(a,b)

    if grid[a][b][5] == 0 and grid[a][b][4] == 0 and grid[a][b][3] == 0 and grid[a][b][2] == 0 
        and grid[a][b][1] == 0 then
            
        return true
    else
        return false
    end

end

function MoveA:draw()

   numColonneA = ncA
   numLigneA = nlA

   grid[numColonneA][numLigneA][5] = 0

   if orientationA == 1 then
   
       if numLigneA + 1 < 12 and VerifPosLibre(numColonneA,numLigneA +1) then
           numLigneA = numLigneA + 1
       end

   elseif orientationA == 2 then
   
       if numColonneA%2 == 0 then
       
           if numColonneA -1 > 0 and VerifPosLibre(numColonneA -1,numLigneA) then
               numColonneA = numColonneA -1
           end
           
       else
       
           if numLigneA + 1 < 12 and numColonneA -1 > 0 and 
                VerifPosLibre(numColonneA -1,numLigneA +1) then
               numLigneA = numLigneA + 1
               numColonneA = numColonneA -1
           end
           
       end

   elseif orientationA == 3 then
   
       if numColonneA%2 == 0 then
       
           if numLigneA -1 > 0 and numColonneA -1 > 0 and 
                VerifPosLibre(numColonneA -1 ,numLigneA -1) then
               numColonneA = numColonneA -1
               numLigneA = numLigneA -1
           end
           
       else
       
           if numColonneA -1 > 0 and VerifPosLibre(numColonneA -1 ,numLigneA) then
               numColonneA = numColonneA -1
           end
           
       end
       
   elseif orientationA == 4 then
   
       if numLigneA -1 > 0 and VerifPosLibre(numColonneA,numLigneA -1) then
           numLigneA = numLigneA - 1
       end
       
   elseif orientationA == 5 then
   
       if numColonneA%2 == 0 then
       
           if numLigneA -1 > 0 and numColonneA +1 < 14 and 
                VerifPosLibre(numColonneA +1 ,numLigneA -1) then
               numColonneA = numColonneA + 1
               numLigneA = numLigneA -1
           end
           
       else
       
           if numColonneA +1 < 14 and VerifPosLibre(numColonneA +1 ,numLigneA) then
               numColonneA = numColonneA + 1
           end
           
       end
       
   elseif orientationA == 6 then

       if numColonneA%2 == 0 then

           if numColonneA +1 < 14 and VerifPosLibre(numColonneA +1 ,numLigneA) then
               numColonneA = numColonneA + 1
           end

       else

           if numLigneA +1 < 12 and numColonneA +1 < 14 and
                VerifPosLibre(numColonneA +1 ,numLigneA +1) then
               numColonneA = numColonneA + 1
               numLigneA = numLigneA + 1
           end

       end

   end

   finMoveA = true

   grid[numColonneA][numLigneA][5] = idA

end

function MoveA:DesOrient()

   for j = 1,nbA  -1 do
      idA = dA[j][1]
      for numColonneA = 1,13 do
          for numLigneA = 1,11 do
              if grid[numColonneA][numLigneA][5] == idA then
              end
          end
      end
   end

   for j = 1,nbA  -1 do
      finMoveA = false
      idA = dA[j][1]
      numOrient = dA[j][2]
                               
      for numColonneA = 1,13 do
          for numLigneA = 1,11 do
              if grid[numColonneA][numLigneA][5] == idA and finMoveA == false then
                  if (idA > 100 and idA < 200) or (idA > 400
                       and idA < 500) or (idA > 900 and idA < 1000) then
                      ncA = numColonneA
                      nlA = numLigneA
                      orientationA = concordance[numOrient][r]
                      if idA < 900 then
                          self.draw()
                      else
                          AnotherMove:draw2()
                      end
                  end
              end
          end
       end
   end
   for j = 1,nbA  -1 do
      finMoveA = false
      idA = dA[j][1]
      numOrient = dA[j][2]
      for numColonneA = 1,13 do
          for numLigneA = 1,11 do
              if grid[numColonneA][numLigneA][5] == idA and finMoveA == false then
                  if (idA > 100 and idA < 200) or (idA > 400
                       and idA < 500) or (idA > 900 and idA < 1000) then
                      ncA = numColonneA
                      nlA = numLigneA
                      orientationA = concordance[numOrient][r]
                      if idA < 900 then
                          self.draw()
                      else
                          AnotherMove:draw2()
                      end
                  end
              end
          end
      end
   end
   
   for j = 1,nbA  -1 do
      finMoveA = false
      idA = dA[j][1]
      numOrient = dA[j][2]
      for numColonneA = 1,13 do
          for numLigneA = 1,11 do
              if grid[numColonneA][numLigneA][5] == idA and finMoveA == false then
                  if (idA > 200 and idA < 300) or (idA > 400 and idA < 500) or
                      (idA > 500 and idA < 600) or (idA > 800 and idA < 900) then
                      ncA = numColonneA
                      nlA = numLigneA
                      orientationA = concordance[numOrient][w]
                      if idA < 800 then
                          self.draw()
                      else
                          AnotherMove:draw2()
                      end
                  end
              end
          end
      end
   end
   
   for j = 1,nbA  -1 do
      finMoveA = false
      idA = dA[j][1]
      numOrient = dA[j][2]
      for numColonneA = 1,13 do
          for numLigneA = 1,11 do
              if grid[numColonneA][numLigneA][5] == idA and finMoveA == false then
                  if (idA > 300 and idA < 400) or (idA > 500
                       and idA < 600) then
                      ncA = numColonneA
                      nlA = numLigneA
                      orientationA = concordance[numOrient][b]
                      AnotherMove:draw()
                  end
              end
          end
      end
   end

    stop = true

end
