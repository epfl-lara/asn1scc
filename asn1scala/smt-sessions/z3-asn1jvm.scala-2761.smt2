; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66900 () Bool)

(assert start!66900)

(declare-fun res!246839 () Bool)

(declare-fun e!214647 () Bool)

(assert (=> start!66900 (=> (not res!246839) (not e!214647))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18127 0))(
  ( (array!18128 (arr!8951 (Array (_ BitVec 32) (_ BitVec 8))) (size!7868 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18127)

(declare-fun a2!948 () array!18127)

(assert (=> start!66900 (= res!246839 (and (bvsle (size!7868 a1!948) (size!7868 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66900 e!214647))

(assert (=> start!66900 true))

(declare-fun array_inv!7480 (array!18127) Bool)

(assert (=> start!66900 (array_inv!7480 a1!948)))

(assert (=> start!66900 (array_inv!7480 a2!948)))

(declare-fun b!299077 () Bool)

(declare-fun e!214650 () Bool)

(assert (=> b!299077 (= e!214647 e!214650)))

(declare-fun res!246838 () Bool)

(assert (=> b!299077 (=> (not res!246838) (not e!214650))))

(declare-fun lt!434991 () (_ BitVec 64))

(assert (=> b!299077 (= res!246838 (and (bvsle toBit!258 lt!434991) (bvsle fromBit!258 lt!434991)))))

(assert (=> b!299077 (= lt!434991 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7868 a1!948))))))

(declare-fun b!299078 () Bool)

(declare-fun res!246837 () Bool)

(assert (=> b!299078 (=> (not res!246837) (not e!214650))))

(declare-fun arrayBitRangesEq!0 (array!18127 array!18127 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299078 (= res!246837 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299079 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299079 (= e!214650 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!434991) (not (= fromSlice!52 toSlice!52)) (bvsgt toBit!258 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (= (and start!66900 res!246839) b!299077))

(assert (= (and b!299077 res!246838) b!299078))

(assert (= (and b!299078 res!246837) b!299079))

(declare-fun m!438325 () Bool)

(assert (=> start!66900 m!438325))

(declare-fun m!438327 () Bool)

(assert (=> start!66900 m!438327))

(declare-fun m!438329 () Bool)

(assert (=> b!299078 m!438329))

(check-sat (not start!66900) (not b!299078))
(check-sat)
