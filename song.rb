use_bpm 55

a = [0,1,0,0,0,1,0,0,0,2,1,0,0,1,0,0,0,1,0,0,0,1,0,0]
live_loop :cymbal1 do
  24.times do |i|
    sample :drum_cymbal_closed if a[i] == 1
    sample :drum_cymbal_pedal if a[i] == 2
    sleep 0.25
  end
end



##| live_loop :kickdrum do
##|   sync :cymbal
##|   sample :bd_fat if spread(1,4).tick
##|   sleep 0.25
##| end

##| live_loop :snaredrum do
##|   sample :drum_snare_soft
##|   sleep 0.25
##| end






