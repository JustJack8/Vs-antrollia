function setDefault(id)
	_G['defaultStrum'..id..'X'] = getActorX(id)
end


function start (song)

end

function stepHit (beat)
	if curStep >= 1135 and curStep < 1136 then
        for i = 4, 7 do
          tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 275,getActorAngle(i) + 0, 0.1, 'setDefault')
      end
        for i = 0, 3 do 
          tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 900,getActorAngle(i) + 0, 0.1, 'setDefault')
      end
    end
end


function update (elapsed)
	if curStep >= 1695 and curStep < 1696 then
		local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 16 * math.sin((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 16 * math.cos((currentBeat + i*0.25) * math.pi), i)
      showOnlyStrums = false
    for i=0,3 do 
		tweenFadeIn(i,0,0.6)
  end 
end
else
        	for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'],i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
        	end
    	end
	if curStep >= 63 and curStep < 1695 then
		local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 16 * math.sin((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 16 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
	else
        	for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'],i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
        	end
    	end
end