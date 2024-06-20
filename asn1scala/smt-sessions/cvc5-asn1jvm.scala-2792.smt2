; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67332 () Bool)

(assert start!67332)

(declare-fun res!248836 () Bool)

(declare-fun e!217306 () Bool)

(assert (=> start!67332 (=> (not res!248836) (not e!217306))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18332 0))(
  ( (array!18333 (arr!9043 (Array (_ BitVec 32) (_ BitVec 8))) (size!7960 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18332)

(declare-fun a2!948 () array!18332)

(assert (=> start!67332 (= res!248836 (and (bvsle (size!7960 a1!948) (size!7960 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67332 e!217306))

(assert (=> start!67332 true))

(declare-fun array_inv!7572 (array!18332) Bool)

(assert (=> start!67332 (array_inv!7572 a1!948)))

(assert (=> start!67332 (array_inv!7572 a2!948)))

(declare-fun b!302378 () Bool)

(declare-fun e!217303 () Bool)

(assert (=> b!302378 (= e!217306 e!217303)))

(declare-fun res!248837 () Bool)

(assert (=> b!302378 (=> (not res!248837) (not e!217303))))

(declare-fun lt!437241 () (_ BitVec 64))

(assert (=> b!302378 (= res!248837 (and (bvsle toBit!258 lt!437241) (bvsle fromBit!258 lt!437241)))))

(assert (=> b!302378 (= lt!437241 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7960 a1!948))))))

(declare-fun b!302379 () Bool)

(declare-fun res!248838 () Bool)

(assert (=> b!302379 (=> (not res!248838) (not e!217303))))

(declare-fun arrayBitRangesEq!0 (array!18332 array!18332 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302379 (= res!248838 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302380 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302380 (= e!217303 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437241) (not (= fromSlice!52 toSlice!52)) (bvslt (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (= (and start!67332 res!248836) b!302378))

(assert (= (and b!302378 res!248837) b!302379))

(assert (= (and b!302379 res!248838) b!302380))

(declare-fun m!441255 () Bool)

(assert (=> start!67332 m!441255))

(declare-fun m!441257 () Bool)

(assert (=> start!67332 m!441257))

(declare-fun m!441259 () Bool)

(assert (=> b!302379 m!441259))

(push 1)

(assert (not start!67332))

(assert (not b!302379))

(check-sat)

(pop 1)

(push 1)

(check-sat)

