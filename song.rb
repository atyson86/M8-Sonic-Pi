use_bpm 120

chords = (ring 1,4,2,5)

live_loop :piano do
  ##| stop
  use_synth :piano
  tick
  4.times do
    play_chord (chord_degree chords.look, :A2, :major), attack: 0.25, release: 1.25
    sleep 1
  end
end

live_loop :cymbal1 do
  ##| stop
  sample :drum_cymbal_closed if spread(7,16).tick
  sleep 0.5
end

live_loop :snare do
  ##| stop
  sync :cymbal1
  sample :drum_snare_hard if spread(4,16).tick
end

live_loop :bd do
  ##| stop
  sync :snare
  sample :bd_ada if spread(10,16).tick
  sleep 0.25
end

live_loop :cymbal2 do
  ##| stop
  sync :bd
  sample :drum_cymbal_pedal if spread(4,16).tick
end

live_loop :sounds do
  ##| stop
  sync :piano
  sample :ambi_swoosh, amp: 3
  sleep 5
end

live_loop :more_drums do
  ##| stop
  sync :bd
  sample :drum_tom_hi_soft if spread(9,16).tick
  sleep 0.25
end

live_loop :beeps do
  ##| stop
  use_synth :dtri
  play (chord :A, :major).choose, release: 0.25, cutoff: rrand(60, 110), amp: 5
  sleep [0.5,1,2,3,4].choose
end

live_loop :hum do
  ##| stop
  sync :bd
  sample :ambi_glass_hum, amp: 0.5
  sleep 5
end

live_loop :melody do
  ##| stop
  use_synth :kalimba
  tick
  play [45,47,49,50,52,54,56,57].choose, amp: 3
  sleep 0.25
end











