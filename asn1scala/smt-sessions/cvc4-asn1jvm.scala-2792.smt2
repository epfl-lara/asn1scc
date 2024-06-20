; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67336 () Bool)

(assert start!67336)

(declare-fun res!248856 () Bool)

(declare-fun e!217328 () Bool)

(assert (=> start!67336 (=> (not res!248856) (not e!217328))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18336 0))(
  ( (array!18337 (arr!9045 (Array (_ BitVec 32) (_ BitVec 8))) (size!7962 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18336)

(declare-fun a2!948 () array!18336)

(assert (=> start!67336 (= res!248856 (and (bvsle (size!7962 a1!948) (size!7962 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67336 e!217328))

(assert (=> start!67336 true))

(declare-fun array_inv!7574 (array!18336) Bool)

(assert (=> start!67336 (array_inv!7574 a1!948)))

(assert (=> start!67336 (array_inv!7574 a2!948)))

(declare-fun b!302396 () Bool)

(declare-fun e!217330 () Bool)

(assert (=> b!302396 (= e!217328 e!217330)))

(declare-fun res!248854 () Bool)

(assert (=> b!302396 (=> (not res!248854) (not e!217330))))

(declare-fun lt!437247 () (_ BitVec 64))

(assert (=> b!302396 (= res!248854 (and (bvsle toBit!258 lt!437247) (bvsle fromBit!258 lt!437247)))))

(assert (=> b!302396 (= lt!437247 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7962 a1!948))))))

(declare-fun b!302397 () Bool)

(declare-fun res!248855 () Bool)

(assert (=> b!302397 (=> (not res!248855) (not e!217330))))

(declare-fun arrayBitRangesEq!0 (array!18336 array!18336 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302397 (= res!248855 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302398 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302398 (= e!217330 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437247) (not (= fromSlice!52 toSlice!52)) (bvslt (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (= (and start!67336 res!248856) b!302396))

(assert (= (and b!302396 res!248854) b!302397))

(assert (= (and b!302397 res!248855) b!302398))

(declare-fun m!441267 () Bool)

(assert (=> start!67336 m!441267))

(declare-fun m!441269 () Bool)

(assert (=> start!67336 m!441269))

(declare-fun m!441271 () Bool)

(assert (=> b!302397 m!441271))

(push 1)

(assert (not b!302397))

(assert (not start!67336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

