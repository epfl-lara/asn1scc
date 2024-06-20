; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66960 () Bool)

(assert start!66960)

(declare-fun b!299407 () Bool)

(declare-datatypes ((Unit!20899 0))(
  ( (Unit!20900) )
))
(declare-fun e!214944 () Unit!20899)

(declare-fun lt!435240 () Unit!20899)

(assert (=> b!299407 (= e!214944 lt!435240)))

(declare-datatypes ((array!18160 0))(
  ( (array!18161 (arr!8966 (Array (_ BitVec 32) (_ BitVec 8))) (size!7883 (_ BitVec 32))) )
))
(declare-fun a2!948 () array!18160)

(declare-datatypes ((tuple4!974 0))(
  ( (tuple4!975 (_1!13142 (_ BitVec 32)) (_2!13142 (_ BitVec 32)) (_3!1444 (_ BitVec 32)) (_4!487 (_ BitVec 32))) )
))
(declare-fun lt!435237 () tuple4!974)

(declare-fun a1!948 () array!18160)

(declare-fun lt!435236 () tuple4!974)

(declare-fun arrayRangesEqSlicedLemma!155 (array!18160 array!18160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20899)

(assert (=> b!299407 (= lt!435240 (arrayRangesEqSlicedLemma!155 a1!948 a2!948 (_1!13142 lt!435236) (_2!13142 lt!435236) (_1!13142 lt!435237) (_2!13142 lt!435237)))))

(declare-fun arrayRangesEq!1545 (array!18160 array!18160 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299407 (arrayRangesEq!1545 a1!948 a2!948 (_1!13142 lt!435237) (_2!13142 lt!435237))))

(declare-fun b!299408 () Bool)

(declare-fun e!214941 () Bool)

(assert (=> b!299408 (= e!214941 false)))

(declare-fun lt!435239 () Unit!20899)

(assert (=> b!299408 (= lt!435239 e!214944)))

(declare-fun c!13743 () Bool)

(assert (=> b!299408 (= c!13743 (bvslt (_1!13142 lt!435237) (_2!13142 lt!435237)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!974)

(assert (=> b!299408 (= lt!435237 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!299408 (= lt!435236 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299409 () Bool)

(declare-fun e!214940 () Bool)

(assert (=> b!299409 (= e!214940 e!214941)))

(declare-fun res!247088 () Bool)

(assert (=> b!299409 (=> (not res!247088) (not e!214941))))

(declare-fun lt!435238 () (_ BitVec 64))

(assert (=> b!299409 (= res!247088 (and (bvsle toBit!258 lt!435238) (bvsle fromBit!258 lt!435238)))))

(assert (=> b!299409 (= lt!435238 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7883 a1!948))))))

(declare-fun b!299410 () Bool)

(declare-fun res!247086 () Bool)

(assert (=> b!299410 (=> (not res!247086) (not e!214941))))

(assert (=> b!299410 (= res!247086 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435238) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299411 () Bool)

(declare-fun Unit!20901 () Unit!20899)

(assert (=> b!299411 (= e!214944 Unit!20901)))

(declare-fun res!247085 () Bool)

(assert (=> start!66960 (=> (not res!247085) (not e!214940))))

(assert (=> start!66960 (= res!247085 (and (bvsle (size!7883 a1!948) (size!7883 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66960 e!214940))

(assert (=> start!66960 true))

(declare-fun array_inv!7495 (array!18160) Bool)

(assert (=> start!66960 (array_inv!7495 a1!948)))

(assert (=> start!66960 (array_inv!7495 a2!948)))

(declare-fun b!299412 () Bool)

(declare-fun res!247087 () Bool)

(assert (=> b!299412 (=> (not res!247087) (not e!214941))))

(declare-fun arrayBitRangesEq!0 (array!18160 array!18160 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299412 (= res!247087 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(assert (= (and start!66960 res!247085) b!299409))

(assert (= (and b!299409 res!247088) b!299412))

(assert (= (and b!299412 res!247087) b!299410))

(assert (= (and b!299410 res!247086) b!299408))

(assert (= (and b!299408 c!13743) b!299407))

(assert (= (and b!299408 (not c!13743)) b!299411))

(declare-fun m!438579 () Bool)

(assert (=> b!299407 m!438579))

(declare-fun m!438581 () Bool)

(assert (=> b!299407 m!438581))

(declare-fun m!438583 () Bool)

(assert (=> b!299408 m!438583))

(declare-fun m!438585 () Bool)

(assert (=> b!299408 m!438585))

(declare-fun m!438587 () Bool)

(assert (=> start!66960 m!438587))

(declare-fun m!438589 () Bool)

(assert (=> start!66960 m!438589))

(declare-fun m!438591 () Bool)

(assert (=> b!299412 m!438591))

(check-sat (not b!299412) (not b!299407) (not start!66960) (not b!299408))
