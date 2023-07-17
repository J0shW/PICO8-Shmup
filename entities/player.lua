function drawPlayer()
 -- draw shots
 drawShots()

 --draw player
 spr(shiparr[flr(shipspr*2.4+3.5)],px,py,2,2)
 
 --draw flame animation
 local flamearr={12,13,14,12}

 local fframe=flamearr[(t\4)%#flamearr+1]
 spr(fframe,px+3,py+15)
 spr(fframe,px+6,py+15)
end

function updatePlayer()
 if btnp(🅾️) then
  wep=wep==3 and 1 or wep+1
 end
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

 updateShots()
end