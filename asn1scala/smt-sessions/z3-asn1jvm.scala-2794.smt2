; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67346 () Bool)

(assert start!67346)

(declare-fun res!248899 () Bool)

(declare-fun e!217388 () Bool)

(assert (=> start!67346 (=> (not res!248899) (not e!217388))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18346 0))(
  ( (array!18347 (arr!9050 (Array (_ BitVec 32) (_ BitVec 8))) (size!7967 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18346)

(declare-fun a2!948 () array!18346)

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> start!67346 (= res!248899 (and (bvsle (size!7967 a1!948) (size!7967 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67346 e!217388))

(assert (=> start!67346 true))

(declare-fun array_inv!7579 (array!18346) Bool)

(assert (=> start!67346 (array_inv!7579 a1!948)))

(assert (=> start!67346 (array_inv!7579 a2!948)))

(declare-fun b!302441 () Bool)

(declare-fun e!217390 () Bool)

(assert (=> b!302441 (= e!217388 e!217390)))

(declare-fun res!248901 () Bool)

(assert (=> b!302441 (=> (not res!248901) (not e!217390))))

(declare-fun lt!437262 () (_ BitVec 64))

(assert (=> b!302441 (= res!248901 (and (bvsle toBit!258 lt!437262) (bvsle fromBit!258 lt!437262)))))

(assert (=> b!302441 (= lt!437262 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7967 a1!948))))))

(declare-fun b!302442 () Bool)

(declare-fun res!248900 () Bool)

(assert (=> b!302442 (=> (not res!248900) (not e!217390))))

(declare-fun arrayBitRangesEq!0 (array!18346 array!18346 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302442 (= res!248900 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302443 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302443 (= e!217390 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437262) (not (= fromSlice!52 toSlice!52)) (bvslt (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (= (and start!67346 res!248899) b!302441))

(assert (= (and b!302441 res!248901) b!302442))

(assert (= (and b!302442 res!248900) b!302443))

(declare-fun m!441297 () Bool)

(assert (=> start!67346 m!441297))

(declare-fun m!441299 () Bool)

(assert (=> start!67346 m!441299))

(declare-fun m!441301 () Bool)

(assert (=> b!302442 m!441301))

(check-sat (not start!67346) (not b!302442))
(check-sat)
