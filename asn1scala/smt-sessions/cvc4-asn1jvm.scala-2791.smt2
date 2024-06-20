; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67330 () Bool)

(assert start!67330)

(declare-fun res!248829 () Bool)

(declare-fun e!217291 () Bool)

(assert (=> start!67330 (=> (not res!248829) (not e!217291))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18330 0))(
  ( (array!18331 (arr!9042 (Array (_ BitVec 32) (_ BitVec 8))) (size!7959 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18330)

(declare-fun a2!948 () array!18330)

(assert (=> start!67330 (= res!248829 (and (bvsle (size!7959 a1!948) (size!7959 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67330 e!217291))

(assert (=> start!67330 true))

(declare-fun array_inv!7571 (array!18330) Bool)

(assert (=> start!67330 (array_inv!7571 a1!948)))

(assert (=> start!67330 (array_inv!7571 a2!948)))

(declare-fun b!302369 () Bool)

(declare-fun e!217294 () Bool)

(assert (=> b!302369 (= e!217291 e!217294)))

(declare-fun res!248828 () Bool)

(assert (=> b!302369 (=> (not res!248828) (not e!217294))))

(declare-fun lt!437238 () (_ BitVec 64))

(assert (=> b!302369 (= res!248828 (and (bvsle toBit!258 lt!437238) (bvsle fromBit!258 lt!437238)))))

(assert (=> b!302369 (= lt!437238 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7959 a1!948))))))

(declare-fun b!302370 () Bool)

(declare-fun res!248827 () Bool)

(assert (=> b!302370 (=> (not res!248827) (not e!217294))))

(declare-fun arrayBitRangesEq!0 (array!18330 array!18330 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302370 (= res!248827 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302371 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302371 (= e!217294 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437238) (not (= fromSlice!52 toSlice!52)) (bvsge (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000)))))

(assert (= (and start!67330 res!248829) b!302369))

(assert (= (and b!302369 res!248828) b!302370))

(assert (= (and b!302370 res!248827) b!302371))

(declare-fun m!441249 () Bool)

(assert (=> start!67330 m!441249))

(declare-fun m!441251 () Bool)

(assert (=> start!67330 m!441251))

(declare-fun m!441253 () Bool)

(assert (=> b!302370 m!441253))

(push 1)

(assert (not start!67330))

(assert (not b!302370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

