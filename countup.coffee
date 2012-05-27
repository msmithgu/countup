t = (s) ->
  document.body.textContent = s

fzero = (n) ->
  if n < 10
    n = "0" + n
  n

# format time
ft = (cs) ->
  # (cs/10).toFixed(1)
  minutes = Math.floor(cs/600)
  seconds = ((cs - (minutes*600))/10).toFixed(1)
  "#{fzero minutes}:#{fzero seconds}"

delay = (ms, f) ->
  setTimeout f, ms

makedelay = (ms) ->
  (f) ->
    delay ms, f

startcycle = (ms, f) ->
  cycledelay = makedelay ms
  cyclef = (f) ->
    f()
    cycledelay f
  cyclef(f)

main = () ->
  counter = 0
  t counter
  cycle = () ->
    t ft counter++
    delay 100, cycle
  cycle()

main()
