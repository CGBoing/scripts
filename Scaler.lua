-- ============================================================================
-- (c) 2020 Jopi J. W. Mikkonen
-- ============================================================================

-- ============================================================================
-- UI ELEMENTS
-- ============================================================================
CENTER = 360
XGRID = 115
YGRID = 25

math.randomseed(999)

rootMenu = Menu("Root", {"C","C#","D","D#","E","F","F#","G","G#","A","A#","B"})
scaleMenu = Menu("Scale", {"Lyd-d4","Ion-d7","Mix-d3","Dor-d6","Aeol-d2","Phr-d5"})
minorButton = MultiStateButton("Minor", {"Natural","Harm-a3-d7","Mel-n2-a3-d6-d7"})

rootMenu.x, rootMenu.y, scaleMenu.x, scaleMenu.y = CENTER-0*XGRID, 0*YGRID, CENTER+1*XGRID, 0*YGRID
minorButton.x = 2 * XGRID + CENTER
minorButton.y = 0 * YGRID

sustainButton = OnOffButton("Sustain", false)
sustainButton.x = -3 * XGRID + CENTER
sustainButton.y = 1 * YGRID

od3 = OnOffButton("ThreeDown", false)
od2 = OnOffButton("TwoDown", false)
od1 = OnOffButton("OneDown", false)
ou1 = OnOffButton("OneUp", false)
ou2 = OnOffButton("TwoUp", false)
ou3 = OnOffButton("ThreeUp", false)

od3.x, od2.x, od1.x = CENTER-3*XGRID, CENTER-2*XGRID, CENTER-XGRID
ou1.x, ou2.x, ou3.x = CENTER, CENTER+XGRID, CENTER+2*XGRID
od3.y, od2.y, od1.y = 2*YGRID, 2*YGRID, 2*YGRID
ou1.y, ou2.y, ou3.y = od3.y, od2.y, od1.y

ofd3 = OnOffButton("FThreeDown", false)
ofd2 = OnOffButton("FTwoDown", false)
ofd1 = OnOffButton("FOneDown", false)
ofu1 = OnOffButton("FOneUp", false)
ofu2 = OnOffButton("FTwoUp", false)
ofu3 = OnOffButton("FThreeUp", false)

ofd3.x, ofd2.x, ofd1.x = CENTER-3*XGRID, CENTER-2*XGRID, CENTER-XGRID
ofu1.x, ofu2.x, ofu3.x = CENTER, CENTER+XGRID, CENTER+2*XGRID
ofd3.y, ofd2.y, ofd1.y = 3*YGRID, 3*YGRID, 3*YGRID
ofu1.y, ofu2.y, ofu3.y = ofd3.y, ofd2.y, ofd1.y

-- ============================================================================
-- ALTER NOTE FUNCTION
-- ============================================================================
function alterNote(note)

   local function rootTranspose(rootMenuValue)
      if (rootMenuValue <= 6) then return rootMenuValue - 1
      else return rootMenuValue - 13
      end
   end

   if (scaleMenu.value == 1) then
      if note % 12 == 5 then return rootTranspose(rootMenu.value) + 1 end
   elseif (scaleMenu.value == 3) then
      if note % 12 == 11 then return rootTranspose(rootMenu.value) - 1 end
   elseif (scaleMenu.value == 4) then
      if (note % 12 == 11 and minorButton.value == 1) then return rootTranspose(rootMenu.value) - 1
      elseif note % 12 == 4 then return rootTranspose(rootMenu.value) - 1
      end
   elseif (scaleMenu.value == 5) then
      if (note % 12 == 11 and minorButton.value == 1) then return rootTranspose(rootMenu.value) - 1
      elseif note % 12 == 4 then return rootTranspose(rootMenu.value) - 1
      elseif (note % 12 == 9 and minorButton.value < 3) then return rootTranspose(rootMenu.value) - 1
      end
   elseif (scaleMenu.value == 6) then
      if (note % 12 == 11 and minorButton.value == 1) then return rootTranspose(rootMenu.value) - 1
      elseif note % 12 == 4 then return rootTranspose(rootMenu.value) - 1
      elseif (note % 12 == 9 and minorButton.value < 3) then return rootTranspose(rootMenu.value) - 1
      elseif note % 12 == 2 then return rootTranspose(rootMenu.value) - 1
      end
   end
   return rootTranspose(rootMenu.value)

end

sustainButton.changed = function(self)
   if (sustainButton.value == true) then
      controlChange(64, 127)
   else
      controlChange(64, 1)
   end
end

-- ============================================================================
-- NOTE CALLBACK
-- ============================================================================
function onNote(n)

   if (sustainButton.value == true) then
      controlChange(64, 127)
   end

   local transpose = alterNote(n.note)

   local id = playNote(n.note + transpose, n.velocity, n.duration)
   if od3.value then playNote(n.note + transpose - 36, n.velocity, n.duration) end
   if od2.value then playNote(n.note + transpose - 24, n.velocity, n.duration) end
   if od1.value then playNote(n.note + transpose - 12, n.velocity, n.duration) end
   if ou1.value then playNote(n.note + transpose + 12, n.velocity, n.duration) end
   if ou2.value then playNote(n.note + transpose + 24, n.velocity, n.duration) end
   if ou3.value then playNote(n.note + transpose + 36, n.velocity, n.duration) end

   if ofd3.value then playNote(n.note + transpose - 29, n.velocity, n.duration) end
   if ofd2.value then playNote(n.note + transpose - 17, n.velocity, n.duration) end
   if ofd1.value then playNote(n.note + transpose - 5, n.velocity, n.duration) end
   if ofu1.value then playNote(n.note + transpose + 7, n.velocity, n.duration) end
   if ofu2.value then playNote(n.note + transpose + 19, n.velocity, n.duration) end
   if ofu3.value then playNote(n.note + transpose + 31, n.velocity, n.duration) end

end
