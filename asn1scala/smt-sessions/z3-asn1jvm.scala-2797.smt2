; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67364 () Bool)

(assert start!67364)

(declare-fun res!248980 () Bool)

(declare-fun e!217498 () Bool)

(assert (=> start!67364 (=> (not res!248980) (not e!217498))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18364 0))(
  ( (array!18365 (arr!9059 (Array (_ BitVec 32) (_ BitVec 8))) (size!7976 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18364)

(declare-fun a2!948 () array!18364)

(assert (=> start!67364 (= res!248980 (and (bvsle (size!7976 a1!948) (size!7976 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67364 e!217498))

(assert (=> start!67364 true))

(declare-fun array_inv!7588 (array!18364) Bool)

(assert (=> start!67364 (array_inv!7588 a1!948)))

(assert (=> start!67364 (array_inv!7588 a2!948)))

(declare-fun b!302522 () Bool)

(declare-fun e!217497 () Bool)

(assert (=> b!302522 (= e!217498 e!217497)))

(declare-fun res!248981 () Bool)

(assert (=> b!302522 (=> (not res!248981) (not e!217497))))

(declare-fun lt!437289 () (_ BitVec 64))

(assert (=> b!302522 (= res!248981 (and (bvsle toBit!258 lt!437289) (bvsle fromBit!258 lt!437289)))))

(assert (=> b!302522 (= lt!437289 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7976 a1!948))))))

(declare-fun b!302523 () Bool)

(declare-fun res!248982 () Bool)

(assert (=> b!302523 (=> (not res!248982) (not e!217497))))

(declare-fun arrayBitRangesEq!0 (array!18364 array!18364 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302523 (= res!248982 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302524 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302524 (= e!217497 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437289) (not (= fromSlice!52 toSlice!52)) (bvsge (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000)))))

(assert (= (and start!67364 res!248980) b!302522))

(assert (= (and b!302522 res!248981) b!302523))

(assert (= (and b!302523 res!248982) b!302524))

(declare-fun m!441351 () Bool)

(assert (=> start!67364 m!441351))

(declare-fun m!441353 () Bool)

(assert (=> start!67364 m!441353))

(declare-fun m!441355 () Bool)

(assert (=> b!302523 m!441355))

(check-sat (not b!302523) (not start!67364))
(check-sat)
