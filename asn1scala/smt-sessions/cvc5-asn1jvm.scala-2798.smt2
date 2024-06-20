; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67368 () Bool)

(assert start!67368)

(declare-fun res!248999 () Bool)

(declare-fun e!217520 () Bool)

(assert (=> start!67368 (=> (not res!248999) (not e!217520))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18368 0))(
  ( (array!18369 (arr!9061 (Array (_ BitVec 32) (_ BitVec 8))) (size!7978 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18368)

(declare-fun a2!948 () array!18368)

(assert (=> start!67368 (= res!248999 (and (bvsle (size!7978 a1!948) (size!7978 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67368 e!217520))

(assert (=> start!67368 true))

(declare-fun array_inv!7590 (array!18368) Bool)

(assert (=> start!67368 (array_inv!7590 a1!948)))

(assert (=> start!67368 (array_inv!7590 a2!948)))

(declare-fun b!302540 () Bool)

(declare-fun e!217522 () Bool)

(assert (=> b!302540 (= e!217520 e!217522)))

(declare-fun res!249000 () Bool)

(assert (=> b!302540 (=> (not res!249000) (not e!217522))))

(declare-fun lt!437295 () (_ BitVec 64))

(assert (=> b!302540 (= res!249000 (and (bvsle toBit!258 lt!437295) (bvsle fromBit!258 lt!437295)))))

(assert (=> b!302540 (= lt!437295 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7978 a1!948))))))

(declare-fun b!302541 () Bool)

(declare-fun res!248998 () Bool)

(assert (=> b!302541 (=> (not res!248998) (not e!217522))))

(declare-fun arrayBitRangesEq!0 (array!18368 array!18368 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302541 (= res!248998 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302542 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302542 (= e!217522 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437295) (not (= fromSlice!52 toSlice!52)) (bvslt (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (= (and start!67368 res!248999) b!302540))

(assert (= (and b!302540 res!249000) b!302541))

(assert (= (and b!302541 res!248998) b!302542))

(declare-fun m!441363 () Bool)

(assert (=> start!67368 m!441363))

(declare-fun m!441365 () Bool)

(assert (=> start!67368 m!441365))

(declare-fun m!441367 () Bool)

(assert (=> b!302541 m!441367))

(push 1)

(assert (not b!302541))

(assert (not start!67368))

(check-sat)

(pop 1)

(push 1)

(check-sat)

