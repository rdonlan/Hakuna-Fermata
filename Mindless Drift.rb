# Welcome to Sonic Pi
# Here is the code to my song

##| method to invert a chord created by Professor Harmon
define :invert_it do |some_chord|
  return some_chord[1..100] + [some_chord[0] + 12]
end

##| This loop plays an echo-ey guitar sample
in_thread do
  16.times do
    with_fx :echo, mix: 0.3, phase: 0.25, amp: 0.4 do
      sample :guit_em9, rate: 0.75, amp: 0.35
    end
    sleep 8
  end
end

##| This loop plays that same echo-ey guitar sample but in reverse
in_thread do
  sleep 8
  8.times do
    sample :guit_em9, rate: -0.5, amp: 0.10
    sleep 8
  end
end

##| This loop plays some inverted chords
in_thread do
  sleep 96
  cmaj = chord(:d, :major7)
  inv_cmaj = invert_it(cmaj)
  inv_inv_cmaj = invert_it(cmaj)
  use_synth :dark_ambience
  
  6.times do
    play cmaj, attack: 2, release: 8, amp: 0.9
    sleep(8)
    play inv_cmaj, attack: 2, release: 8, amp: 0.9
    sleep(8)
    play inv_inv_cmaj, attack: 2, release: 8, amp: 0.9
    sleep(8)
  end
end

##| This loop plays some other sample noises that are calming
in_thread do
  sleep 160
  6.times do
    sample :ambi_glass_hum, amp: 0.5, attack: 4, decay: 8, release: 8
    sleep 8
    sample :ambi_dark_woosh, attack: 4, sustain: 8, release: 8, amp: 0.5
    sleep 8
  end
end

##| these few lines provide a bridge to the last section of the song
in_thread do
  sleep 248
  sample :ambi_glass_hum, amp: 0.5, attack: 4, decay: 8, release: 8
  sleep 8
  sample :ambi_glass_hum, amp: 0.5, attack: 4, decay: 8, release: 8
end

##| This loop plays the choir sample in very short intervals to make it sound like lots
##| of notes are being hit at very close together
in_thread do
  sleep 264
  16.times do
    r = [0.25, 0.33, 0.42].choose
    8.times do
      sample :ambi_choir, rate: r, pan: rrand(-1, 1), amp: 0.1
      sleep 0.5
    end
  end
end








