; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67328 () Bool)

(assert start!67328)

(declare-fun res!248820 () Bool)

(declare-fun e!217279 () Bool)

(assert (=> start!67328 (=> (not res!248820) (not e!217279))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18328 0))(
  ( (array!18329 (arr!9041 (Array (_ BitVec 32) (_ BitVec 8))) (size!7958 (_ BitVec 32))) )
))
(declare-fun a2!948 () array!18328)

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun a1!948 () array!18328)

(assert (=> start!67328 (= res!248820 (and (bvsle (size!7958 a1!948) (size!7958 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67328 e!217279))

(assert (=> start!67328 true))

(declare-fun array_inv!7570 (array!18328) Bool)

(assert (=> start!67328 (array_inv!7570 a1!948)))

(assert (=> start!67328 (array_inv!7570 a2!948)))

(declare-fun b!302360 () Bool)

(declare-fun e!217282 () Bool)

(assert (=> b!302360 (= e!217279 e!217282)))

(declare-fun res!248818 () Bool)

(assert (=> b!302360 (=> (not res!248818) (not e!217282))))

(declare-fun lt!437235 () (_ BitVec 64))

(assert (=> b!302360 (= res!248818 (and (bvsle toBit!258 lt!437235) (bvsle fromBit!258 lt!437235)))))

(assert (=> b!302360 (= lt!437235 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7958 a1!948))))))

(declare-fun b!302361 () Bool)

(declare-fun res!248819 () Bool)

(assert (=> b!302361 (=> (not res!248819) (not e!217282))))

(declare-fun arrayBitRangesEq!0 (array!18328 array!18328 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302361 (= res!248819 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302362 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302362 (= e!217282 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437235) (not (= fromSlice!52 toSlice!52)) (bvsge (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000)))))

(assert (= (and start!67328 res!248820) b!302360))

(assert (= (and b!302360 res!248818) b!302361))

(assert (= (and b!302361 res!248819) b!302362))

(declare-fun m!441243 () Bool)

(assert (=> start!67328 m!441243))

(declare-fun m!441245 () Bool)

(assert (=> start!67328 m!441245))

(declare-fun m!441247 () Bool)

(assert (=> b!302361 m!441247))

(check-sat (not b!302361) (not start!67328))
(check-sat)
