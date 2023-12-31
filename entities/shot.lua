function drawShots()
 for s in all(shots) do
  spr(s.sani[flr(s.si)],s.x,s.y,1,s.sh)
 end

	for m in all(muzz) do
		spr(m.sani[flr(m.si)],px+m.x,py+m.y,2,2)
	end
end

function updateShots()
	shotwait=max(0,shotwait-1) -- countdown shotwait
 if btn(❎) then
  if wep==1 then
   shot_raiden()
  elseif wep==2 then
   shot_ddp()
		elseif wep==3 then
   shot_water()
  end
 end

 -- doShots()
	for s in all(shots) do
  s.x+=s.sx
  s.y+=s.sy
		s.si+=s.sstep
		if	flr(s.si)>#s.sani then
			s.si=1
		end

  if s.y< -16 or s.y>128 then
   del(shots,s)
  end
 end

	-- doMuzz()
	for m in all(muzz) do
		m.si+=1
		if flr(m.si)>#m.sani then
			del(muzz,m)
		end
	end
end


-- add(shots,{
-- 	x=px+3, 
-- 	y=py,
-- 	sx=0, -- horizontal speed
-- 	sy=shotspd, -- vertical speed
-- 	sani={11}, -- the sprite animation frames can be 1 or more
-- 	si=1, -- sprite animation index
-- 	sstep=0.5, -- sprite animation speed
-- 	sh=1 -- sprite height
-- })
function shot_raiden()
	if shotwait <=0 and #shots<6 then
		local shotspd=-3.5
		shotwait=4
		add(shots,{
				x=px+3,
				y=py,
				sx=0,
				sy=shotspd,
				sani={11},
				si=1,
				sstep=0.5,
				sh=1
		})
		add(shots,{
				x=px+9,
				y=py,
				sx=0,
				sy=shotspd,
				sani={11},
				si=1,
				sstep=0.5,
				sh=1
		})

		add(muzz,{
			x=-4,
			y=-8,
   sani={35, 37,	39, 41},
			si=0,
	 })

		add(muzz,{
			x=4,
			y=-8,
			sani={35, 37,	39, 41},
			si=0,
		})
		sfx(0)
	end
end

function shot_ddp()
	if shotwait <=0 and #shots<100 then
		local shotspd=-6
		shotwait=3
		add(shots,{
				x=px,
				y=py-5,
				sx=0,
				sy=shotspd,
				sani={32,33,34},
				si=(t\2)%3+1,
				sstep=0.5,
				sh=2
		})
		add(shots,{
				x=px+8,
				y=py-5,
				sx=0,
				sy=shotspd,
				sani={32,33,34},
				si=(t\2)%3+1,
				sstep=0.5,
				sh=2
		})

		add(muzz,{
			x=-4,
			y=-8,
   sani={35, 37,	39, 41},
			si=0,
	 })

		add(muzz,{
			x=4,
			y=-8,
			sani={35, 37,	39, 41},
			si=0,
		})
		sfx(0)
	end
end

function shot_water()
	if shotwait <=0 and #shots<100 then
		local shotspd=-4
		shotwait=2
		add(shots,{
				x=px,
				y=py,
				sx=0,
				sy=shotspd,
				sani={27,28,29},
				si=(t\2)%3+1,
				sstep=0.5,
				sh=1
		})
		add(shots,{
				x=px+8,
				y=py,
				sx=0,
				sy=shotspd,
				sani={27,28,29},
				si=(t\2)%3+1,
				sstep=0.5,
				sh=1
		})

		add(muzz,{
			x=-4,
			y=-8,
   sani={35, 37,	39, 41},
			si=0,
	 })

		add(muzz,{
			x=4,
			y=-8,
			sani={35, 37,	39, 41},
			si=0,
		})
		sfx(1)
	end
end