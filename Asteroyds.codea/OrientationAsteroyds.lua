OrientationAsteroyds = class()

function OrientationAsteroyds:desAs()

    fill(255, 255, 255, 255)
        
    for j = 1, nbA -1 do
        if dA[j][1] == ident then
            orientationA = dA[j][2] 
        end
    end
    
    if orientationA == 1 then   
        ellipse(asx+10,asy+43,3)
        
        ellipse(asx -13,asy +11,3)
        ellipse(asx -7,asy+3,3)
        
        ellipse(asx+26,asy+2,3)
        ellipse(asx+30,asy+8,3)
        ellipse(asx+34,asy+14,3)
        
        ellipse(asx+-8,asy+36,3)
        ellipse(asx+-12,asy+29,3)
        ellipse(asx+-3,asy+33,3)
        ellipse(asx+-6,asy+26,3)
        
        ellipse(asx+28,asy+36,3)
        ellipse(asx+32,asy+29,3)
        ellipse(asx+23,asy+33,3)
        ellipse(asx+26,asy+26,3)
        ellipse(asx+28,asy+31,3)
        
        ellipse(asx+5,asy -4,3)
        ellipse(asx+10,asy -4,3)
        ellipse(asx+15,asy -4,3)
        ellipse(asx+5,asy,3)
        ellipse(asx+10,asy,3)
        ellipse(asx+15,asy,3)                                           
    end  
    if orientationA == 2 then   
        ellipse(asx+-10,asy+33,3)
        
        ellipse(asx +5,asy -6,3)
        ellipse(asx +13,asy -6,3)
        
        ellipse(asx+26,asy+40,3)
        ellipse(asx+30,asy+33,3)
        ellipse(asx+34,asy+27,3)
        
        ellipse(asx+-8,asy+14,3)
        ellipse(asx+-13,asy+11,3)
        ellipse(asx+-3,asy+8,3)
        ellipse(asx+-8,asy+4,3)
        
        ellipse(asx+5,asy+45,3)
        ellipse(asx+15,asy+45,3)
        ellipse(asx+5,asy+40,3)
        ellipse(asx+15,asy+40,3)
        ellipse(asx+10,asy+43,3)
        
        ellipse(asx+28,asy +3,3)
        ellipse(asx+31,asy +8,3)
        ellipse(asx+35,asy +13,3)
        ellipse(asx+24,asy +5,3)
        ellipse(asx+27,asy +10,3)
        ellipse(asx+30,asy +15,3)                                       
    end 
    if orientationA == 3 then   
        ellipse(asx+-10,asy+6,3)
        
        ellipse(asx +30,asy +8,3)
        ellipse(asx +32,asy +12,3)
        
        ellipse(asx+4,asy+45,3)
        ellipse(asx+9,asy+45,3)
        ellipse(asx+14,asy+45,3)
        
        ellipse(asx+5,asy+-6,3)
        ellipse(asx+13,asy+-6,3)
        ellipse(asx+5,asy+0,3)
        ellipse(asx+13,asy+0,3)
        
        ellipse(asx+-7,asy+32,3)
        ellipse(asx+-12,asy+28,3)        
        ellipse(asx+-1,asy+34,3)
        ellipse(asx+-6,asy+25,3)
        ellipse(asx+-7,asy+38,3)
        
        ellipse(asx+28,asy +35,3)
        ellipse(asx+31,asy +30,3)
        ellipse(asx+35,asy +25,3)
        ellipse(asx+24,asy +32,3)
        ellipse(asx+27,asy +28,3)
        ellipse(asx+30,asy +24,3)                                       
    end
    if orientationA == 4 then   
        ellipse(asx+10,asy+-4,3)
        
        ellipse(asx +28,asy +36,3)
        ellipse(asx +32,asy+29,3)
        
        ellipse(asx+-8,asy+38,3)
        ellipse(asx+-10,asy+34,3)
        ellipse(asx+-13,asy+29,3)
        
        ellipse(asx+30,asy+14,3)
        ellipse(asx+34,asy+11,3)
        ellipse(asx+26,asy+9,3)
        ellipse(asx+30,asy+6,3)
        
        ellipse(asx+-8,asy+4,3)
        ellipse(asx+-12,asy+10,3)
        ellipse(asx+-7,asy+9,3)
        ellipse(asx+-7,asy+13,3)
        ellipse(asx+-3,asy+6,3)
        
        ellipse(asx+5,asy +45,3)
        ellipse(asx+10,asy +45,3)
        ellipse(asx+15,asy +45,3)
        ellipse(asx+5,asy+40,3)
        ellipse(asx+10,asy+40,3)
        ellipse(asx+15,asy+40,3)                                             
    end  
    if orientationA == 5 then   
        ellipse(asx+31,asy+8,3)
        
        ellipse(asx +5,asy +45,3)
        ellipse(asx +13,asy +45,3)
        
        ellipse(asx+-14,asy+11,3)
        ellipse(asx+-11,asy+7,3)
        ellipse(asx+-8,asy+3,3)
        
        ellipse(asx+29,asy+37,3)
        ellipse(asx+33,asy+31,3)
        ellipse(asx+25,asy+34,3)
        ellipse(asx+29,asy+29,3)
        
        ellipse(asx+5,asy+-5,3)
        ellipse(asx+15,asy+-5,3)
        ellipse(asx+5,asy+0,3)
        ellipse(asx+15,asy+0,3)
        ellipse(asx+10,asy+-3,3)
        
        ellipse(asx+-8,asy +38,3)
        ellipse(asx+-10,asy +34,3)
        ellipse(asx+-12,asy +29,3)
        ellipse(asx+-8,asy +27,3)
        ellipse(asx+-6,asy +31,3)
        ellipse(asx+-4,asy +35,3)                                       
    end 
    if orientationA == 6 then   
        ellipse(asx+31,asy+30,3)
        
        ellipse(asx +-8,asy +37,3)
        ellipse(asx +-11,asy +31,3)
        
        ellipse(asx+4,asy+-5,3)
        ellipse(asx+9,asy+-5,3)
        ellipse(asx+14,asy+-5,3)
        
        ellipse(asx+5,asy+45,3)
        ellipse(asx+13,asy+45,3)
        ellipse(asx+5,asy+41,3)
        ellipse(asx+13,asy+41,3)
        
        ellipse(asx+25,asy+8,3)
        ellipse(asx+29,asy+11,3)
        ellipse(asx+34,asy+14,3)
        ellipse(asx+29,asy+5,3)
        ellipse(asx+29,asy+16,3)
        
        ellipse(asx+-13,asy +10,3)
        ellipse(asx+-9,asy +13,3)
        ellipse(asx+-10,asy +6,3)
        ellipse(asx+-6,asy +10,3)
        ellipse(asx+-6,asy +2,3)
        ellipse(asx+-3,asy +6,3)                                             
    end    
     
end
