var p = get_integer("P:", ang_pid.p * 100) / 100
var i = get_integer("I:", ang_pid.i * 100) / 100
var d = get_integer("D:", ang_pid.d * 100) / 100
var max_i = get_integer("Max i:", ang_pid.max_integration * 100) / 100
ang_pid = new pid(p, i, d, max_i)