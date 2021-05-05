use_bpm 120

chords = (ring 1,4,2,5)

live_loop :piano do
  use_synth :piano
  tick
  4.times do
    play_chord (chord_degree chords.look, :A2, :major), release: 1.125
    sleep 1
  end
end

live_loop :cymbal1 do
  sample :drum_cymbal_closed if spread(7,16).tick
  sleep 0.5
end

live_loop :snare do
  sync :cymbal1
  sample :drum_snare_hard if spread(4,16).tick
end

live_loop :bd do
  sync :snare
  sample :bd_ada if spread(10,16).tick
  sleep 0.25
end

live_loop :cymbal2 do
  sync :bd
  sample :drum_cymbal_pedal if spread(4,16).tick
end

live_loop :sounds do
  sync :piano
  sample :ambi_swoosh, amp: 3
  sleep 5
end

##| live_loop :more_drums do
##|   sample :drum_heavy_kick
##|   sleep 0.25
##|   sample :drum_tom_hi_soft
##|   sleep 1
##| end


live_loop :guitar do
  use_synth :dtri
  play (chord :A, :major).choose, release: 0.125, cutoff: rrand(60, 110)
  sleep 0.25
end










