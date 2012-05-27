t = (s) ->
  document.body.textContent = s

fzero = (n) ->
  if n < 10
    n = "0" + n
  n

# format time
ft = (cs) ->
  # (cs/10).toFixed(1)
  hours   = Math.floor(cs/36000)
  minutes = Math.floor((cs - (hours*36000))/600)
  seconds = ((cs - (minutes*600))/10).toFixed(1)
  "#{fzero hours}:#{fzero minutes}:#{fzero seconds}"

cycle = (interval, f) ->
  setInterval f, interval

main = () ->
  counter = 0
  t counter
  tid = cycle 100, () ->
    t ft counter++

main()
