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
 
function _init()
 px,py=64,64
 spd=1.4
 lastdir=0

end

function _draw()
 cls(12)
 drawPlayer()
 
 for s in all(shots) do
  spr(11,s.x,s.y)
 end

 -- this crazy value '&0b1111'
 local btnv=btn()&0b1111
 print(btn(),5,4,7)
 print(btnv,5,10,7)
 print(butarr[btnv],5,16,7)
 print(shipspr,5,23,7)
end

function _update60()
 local dir=butarr[btn()&0b1111]
 
 if lastdir!=dir and dir>=5 then
  --anti-cobblestone
  px=flr(px)+0.5
  py=flr(py)+0.5
 end
 
 -- this is the destination sprite value
 local dshipspr=0
 if dir>0 then
  px+=dirx[dir]*spd
  py+=diry[dir]*spd

  dshipspr=mysgn(dirx[dir])
 end
 
 shipspr+=mysgn(dshipspr-shipspr)*0.15
 shipspr=mid(-1,shipspr,1)

 lastdir=dir

 shotwait=max(0,shotwait-1) -- countdown shotwait
 if btn(❎) and shotwait <=0 then
  add(shots,{
    x=px+6,
    y=py-4,
    sx=0,
    sy=-2,
  })
  shotwait=12
 end

 doshots()
end

function doshots()
 for s in all(shots) do
  s.x+=s.sx
  s.y+=s.sy
 end
end

function mysgn(v)
  --this is used to fix the sign function in lua
  --so that it returns 1 for 0
  return v==0 and 0 or sgn(v)
end