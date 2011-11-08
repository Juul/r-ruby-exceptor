
baz = function(c) {
  stop("bad stuff happened")
  return(c+1)
}

bar = function(b) {
  return(baz(b))
}
foo = function(a) {
  return(bar(a))
}
