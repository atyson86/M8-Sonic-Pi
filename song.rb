use_bpm 109

live_loop :cymbal1 do
  sample :drum_cymbal_closed if spread(4,16).tick
  sleep 0.25
end

live_loop :snare do
  sync :cymbal1
  sample :drum_snare_hard if spread(6,16).tick
end

live_loop :bd do
  sync :snare
  sample :bd_ada if spread(10,16).tick
  sleep 0.25
end

live_loop :cymbal2 do
  sync :bd
  sample :drum_cymbal_pedal if spread(1,16).tick
  sleep 0.25
end

chords = (ring 1,1,4,2,5)
live_loop :bassline do
  use_synth :fm
  play (chord_degree chords.look, :A2, :major)[0]
  sleep 1
  play (chord_degree chords.look, :A2, :major,5).choose
  sleep 1
  play (chord_degree chords.look, :A2, :major)[ring(1,2,3).choose]
  sleep 1
  play (chord_degree chords[look + 1], :A2, :major)[0] + (ring -2,-1,1,2).choose
  sleep 1
end







