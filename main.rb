
def play()
  count = 0
  this = rand(1..9)
  bank = ["P1", "P2"].to_a.zip([this, 10 - this]).to_h
  win = 0 
  until bank["P1"] == 0 || bank["P2"] == 0 
    rand() <= 0.7 ? (bank["P1"] += 1; bank["P2"] -= 1) : (bank["P1"] -= 1; bank["P2"] += 1)
    count += 1
  end
  win =  bank["P1"] == 0 ? 0 : 1
  return [count, win]
end

def bust(n)
  runs = {}
  wins = [0, 0]
  n.times do 
    win = play().last
    count = play().first
    win == 1 ? wins[0] += 1 : wins[1] += 1
    runs.key?(count) ? runs[count] += 1 : runs[count] = 1 
  end
  avg = 0
  runs.each {|key, value| avg += (key.to_f*value.to_f)}
  print("Player 1: %d wins\nPlayer 2: %d wins\nAverage time to bust: %f rounds" % [wins[0], wins[1], avg / runs.length])
end

bust(100)