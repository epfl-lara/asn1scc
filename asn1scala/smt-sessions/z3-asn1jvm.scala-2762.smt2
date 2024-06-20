; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66906 () Bool)

(assert start!66906)

(declare-fun res!246866 () Bool)

(declare-fun e!214686 () Bool)

(assert (=> start!66906 (=> (not res!246866) (not e!214686))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18133 0))(
  ( (array!18134 (arr!8954 (Array (_ BitVec 32) (_ BitVec 8))) (size!7871 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18133)

(declare-fun a2!948 () array!18133)

(assert (=> start!66906 (= res!246866 (and (bvsle (size!7871 a1!948) (size!7871 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66906 e!214686))

(assert (=> start!66906 true))

(declare-fun array_inv!7483 (array!18133) Bool)

(assert (=> start!66906 (array_inv!7483 a1!948)))

(assert (=> start!66906 (array_inv!7483 a2!948)))

(declare-fun b!299104 () Bool)

(declare-fun e!214685 () Bool)

(assert (=> b!299104 (= e!214686 e!214685)))

(declare-fun res!246865 () Bool)

(assert (=> b!299104 (=> (not res!246865) (not e!214685))))

(declare-fun lt!435000 () (_ BitVec 64))

(assert (=> b!299104 (= res!246865 (and (bvsle toBit!258 lt!435000) (bvsle fromBit!258 lt!435000)))))

(assert (=> b!299104 (= lt!435000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7871 a1!948))))))

(declare-fun b!299105 () Bool)

(declare-fun res!246864 () Bool)

(assert (=> b!299105 (=> (not res!246864) (not e!214685))))

(declare-fun arrayBitRangesEq!0 (array!18133 array!18133 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299105 (= res!246864 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299106 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299106 (= e!214685 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435000) (not (= fromSlice!52 toSlice!52)) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 fromSlice!52) (bvsgt toSlice!52 #b0000000000000000000000000000001111111111111111111111111111111000))))))

(assert (= (and start!66906 res!246866) b!299104))

(assert (= (and b!299104 res!246865) b!299105))

(assert (= (and b!299105 res!246864) b!299106))

(declare-fun m!438343 () Bool)

(assert (=> start!66906 m!438343))

(declare-fun m!438345 () Bool)

(assert (=> start!66906 m!438345))

(declare-fun m!438347 () Bool)

(assert (=> b!299105 m!438347))

(check-sat (not b!299105) (not start!66906))
(check-sat)
