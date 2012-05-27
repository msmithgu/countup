$ () ->
  class Timer
    constructor: () ->
      @counter = 0
      @running = false
      @tid = null
    start: (f) =>
      if not @running
        @tid = setInterval (() =>
          @counter++
          f()
        ), 100
        @running = true
    stop: () ->
      clearInterval @tid
      @running = false
    reset: () ->
      clearInterval @tid
      @running = false
      @counter = 0
    display: () ->
      fzero = (n) ->
        if n < 10
          n = "0" + n
        n
      hours   = Math.floor(@counter/36000)
      minutes = Math.floor((@counter - (hours*36000))/600)
      seconds = ((@counter - (hours*36000) - (minutes*600))/10).toFixed(1)
      "#{fzero hours}:#{fzero minutes}:#{fzero seconds}"

  t = (s) ->
    c_display.html s
  c_update = () ->
    t timer.display()

  c = $('<div>').appendTo 'body'
  c_display = $('<div>').appendTo c
  c_start = $('<input type="button" value="Start" />').appendTo(c).click (e) ->
    timer.start () ->
      t timer.display()
  c_stop = $('<input type="button" value="Stop" />').appendTo(c).click (e) ->
    timer.stop()
  c_reset = $('<input type="button" value="Reset" />').appendTo(c).click (e) ->
    timer.reset()
    c_update()

  timer = new Timer
  c_update()
