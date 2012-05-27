t = (s) ->
  document.body.textContent = s

# format milliseconds
fms = (ms) ->
  (ms/10).toFixed(1)

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
    t fms counter++
    delay 100, cycle
  cycle()

main()
