package p1

abstract type u = int

function u to_u(int x) { x }

function int from_u(u x) { x }

// Legal since we are in the defining package: we see u's internals.
_ = 1 + ((u) 1)
