-- 0 - stop
-- 1 - ⬅️
-- 2 - ➡️
-- 3 - ⬆️
-- 4 - ⬇️
-- diagonals
-- 5 - ⬅️⬆️
-- 6 - ⬆️➡️
-- 7 - ➡️⬇️
-- 8 - ⬇️⬅️

t=0
butarr={1,2,0,3,5,6,3,4,8,7,4,0,1,2,0}
diagOffset=0.7
dirx={-1,1, 0,0,-diagOffset, diagOffset,diagOffset,-diagOffset}
diry={0, 0,-1,1,-diagOffset,-diagOffset,diagOffset, diagOffset}

butarr[0]=0

-- ship sprite array
shiparr={1,3,5,7,9}
shipspr=0

shots={}
shotwait=0

wep=1

muzz={}
 
function _init()
 px,py=56,56
 spd=1.4
 lastdir=0

end

function _draw()
 cls(15)
 map(0,0,0,0,16,16)
 drawPlayer()

 -- this crazy value '&0b1111'
 local btnv=btn()&0b1111
 print("t:"..t,5,4,7)
 print(shotwait,5,10,7)
 print("shots: "..#shots,5,17,7)
end

function _update60()
 t+=1
 updatePlayer()
end



function mysgn(v)
  --this is used to fix the sign function in lua
  --so that it returns 1 for 0
  return v==0 and 0 or sgn(v)
end