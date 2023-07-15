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
shipspr=3.5
 
function _init()
 px,py=64,64
 spd=1.4
 lastdir=0

end

function _draw()
 cls(14)
 drawPlayer()
 
 -- this crazy value '&0b1111'
 local btnv=btn()&0b1111
 print(btn(),5,4,7)
 print(btnv,5,10,7)
 print(butarr[btnv],5,16,7)
end

function _update60()
 local dir=butarr[btn()&0b1111]
 
 if lastdir!=dir and dir>=5 then
  --anti-cobblestone
  px=flr(px)+0.5
  py=flr(py)+0.5
 end
 
 local dshipspr=3.5
 if dir>0 then
  px+=dirx[dir]*spd
  py+=diry[dir]*spd

  if dirx[dir]<0 then
    dshipspr=1
  elseif dirx[dir]>0 then
    dshipspr=5.95
  end
 end
 
 local bankspd=0.5
 if dshipspr<shipspr then
  shipspr-=bankspd
 elseif dshipspr>shipspr then
  shipspr+=bankspd
 end
 shipspr=mid(1.95,shipspr,5)

 lastdir=dir
end