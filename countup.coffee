$ () ->
  fzero = (n) ->
    if n < 10
      n = "0" + n
    n

  class Timer
    constructor: () ->
      @timer = this
      @counter = 0
      @running = false
      @tid = null
    toggle: (f) =>
      if @running
        @timer.stop()
      else
        @timer.start(f)
      @running
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
  l = () ->
    c = timer.counter
    if c > 0
      c_logs.prepend $("<li data=\"#{c}\">#{timer.display()}</li>")
      sum = 0
      logs = c_logs.children()
      if logs.length > 0
        for n in logs
          sum += ($(n).attr('data') * 1)
        avg = sum / logs.length
        console.log {
          logs: logs
          ll: logs.length
          sum: sum
          avg: avg
          td: timer.display avg
        }
        c_avg.html timer.display avg
  c_update = () ->
    t timer.display()

  c = $('<div id="countup">').appendTo 'body'
  c_display = $('<div id="countup-display">').appendTo c
  c_toggler = () ->
    if (timer.toggle () -> t timer.display())
      c_toggle.attr "value", "Stop"
    else
      c_toggle.attr "value", "Start"
  c_toggle = $('<input type="button" value="Start" id="countup-start" />').appendTo(c).click c_toggler
  c_reset = $('<input type="button" value="Reset/Log" id="countup-reset" />').appendTo(c).click (e) ->
    l()
    timer.reset()
    c_toggle.attr "value", "Start"
    c_update()
  c_log_clear = $('<input type="button" value="Clear Logs" id="countup-log-clear" />').appendTo(c).click (e) ->
    c_avg.html ""
    c_logs.html ""
  c_avg = $('<div id="countup-average">').appendTo c
  c_logs = $('<ul id="countup-logs">').appendTo c

  timer = new Timer
  c_update()
