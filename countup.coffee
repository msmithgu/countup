$ () ->
  fzero = (n) ->
    if n < 10
      n = "0" + n
    n

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
    display: (n) ->
      n ?= @counter
      hours   = Math.floor(n/36000)
      minutes = Math.floor((n - (hours*36000))/600)
      seconds = ((n - (hours*36000) - (minutes*600))/10).toFixed(1)
      "#{fzero hours}:#{fzero minutes}:#{fzero seconds}"

  t = (s) ->
    c_display.html s
  c_logs_raw = new Array()
  l = () ->
    c_logs_raw.push timer.counter
    c_logs.prepend $("<li>#{timer.display()}</li>")
    sum = 0
    for n in c_logs_raw
      sum += n
    avg = sum / c_logs_raw.length
    c_avg.html timer.display Math.round avg
  c_update = () ->
    t timer.display()

  c = $('<div id="countup">').appendTo 'body'
  c_display = $('<div id="countup-display">').appendTo c
  c_start = $('<input type="button" value="Start" id="countup-start" />').appendTo(c).click (e) ->
    timer.start () ->
      t timer.display()
  c_stop = $('<input type="button" value="Stop" id="countup-stop" />').appendTo(c).click (e) ->
    timer.stop()
  c_reset = $('<input type="button" value="Reset" id="countup-reset" />').appendTo(c).click (e) ->
    l()
    timer.reset()
    c_update()
  c_log_clear = $('<input type="button" value="Clear Logs" id="countup-log-clear" />').appendTo(c).click (e) ->
    c_logs.html ""
  c_avg = $('<div id="countup-average">').appendTo c
  c_logs = $('<ul id="countup-logs">').appendTo c

  timer = new Timer
  c_update()
