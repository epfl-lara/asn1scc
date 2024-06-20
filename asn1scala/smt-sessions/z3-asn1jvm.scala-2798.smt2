; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67370 () Bool)

(assert start!67370)

(declare-fun res!249009 () Bool)

(declare-fun e!217532 () Bool)

(assert (=> start!67370 (=> (not res!249009) (not e!217532))))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18370 0))(
  ( (array!18371 (arr!9062 (Array (_ BitVec 32) (_ BitVec 8))) (size!7979 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18370)

(declare-fun a2!948 () array!18370)

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> start!67370 (= res!249009 (and (bvsle (size!7979 a1!948) (size!7979 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67370 e!217532))

(assert (=> start!67370 true))

(declare-fun array_inv!7591 (array!18370) Bool)

(assert (=> start!67370 (array_inv!7591 a1!948)))

(assert (=> start!67370 (array_inv!7591 a2!948)))

(declare-fun b!302549 () Bool)

(declare-fun e!217531 () Bool)

(assert (=> b!302549 (= e!217532 e!217531)))

(declare-fun res!249007 () Bool)

(assert (=> b!302549 (=> (not res!249007) (not e!217531))))

(declare-fun lt!437298 () (_ BitVec 64))

(assert (=> b!302549 (= res!249007 (and (bvsle toBit!258 lt!437298) (bvsle fromBit!258 lt!437298)))))

(assert (=> b!302549 (= lt!437298 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7979 a1!948))))))

(declare-fun b!302550 () Bool)

(declare-fun res!249008 () Bool)

(assert (=> b!302550 (=> (not res!249008) (not e!217531))))

(declare-fun arrayBitRangesEq!0 (array!18370 array!18370 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302550 (= res!249008 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302551 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302551 (= e!217531 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437298) (not (= fromSlice!52 toSlice!52)) (bvslt (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (= (and start!67370 res!249009) b!302549))

(assert (= (and b!302549 res!249007) b!302550))

(assert (= (and b!302550 res!249008) b!302551))

(declare-fun m!441369 () Bool)

(assert (=> start!67370 m!441369))

(declare-fun m!441371 () Bool)

(assert (=> start!67370 m!441371))

(declare-fun m!441373 () Bool)

(assert (=> b!302550 m!441373))

(check-sat (not b!302550) (not start!67370))
(check-sat)
