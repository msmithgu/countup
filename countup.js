(function() {
  var delay, main, makedelay, startcycle, t;

  t = function(s) {
    return document.body.textContent = s;
  };

  delay = function(ms, f) {
    return setTimeout(f, ms);
  };

  makedelay = function(ms) {
    return function(f) {
      return delay(ms, f);
    };
  };

  startcycle = function(ms, f) {
    var cycledelay, cyclef;
    cycledelay = makedelay(ms);
    cyclef = function(f) {
      f();
      return cycledelay(f);
    };
    return cyclef(f);
  };

  main = function() {
    var counter, cycle;
    counter = 0;
    t(counter);
    cycle = function() {
      t(((counter++) / 10).toFixed(1));
      return delay(100, cycle);
    };
    return cycle();
  };

  main();

}).call(this);
