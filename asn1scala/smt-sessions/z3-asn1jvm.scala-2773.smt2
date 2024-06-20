; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67002 () Bool)

(assert start!67002)

(declare-fun b!299946 () Bool)

(declare-datatypes ((Unit!20969 0))(
  ( (Unit!20970) )
))
(declare-fun e!215374 () Unit!20969)

(declare-fun lt!435645 () Unit!20969)

(assert (=> b!299946 (= e!215374 lt!435645)))

(declare-datatypes ((tuple4!1016 0))(
  ( (tuple4!1017 (_1!13163 (_ BitVec 32)) (_2!13163 (_ BitVec 32)) (_3!1465 (_ BitVec 32)) (_4!508 (_ BitVec 32))) )
))
(declare-fun lt!435643 () tuple4!1016)

(declare-fun lt!435651 () tuple4!1016)

(declare-datatypes ((array!18202 0))(
  ( (array!18203 (arr!8987 (Array (_ BitVec 32) (_ BitVec 8))) (size!7904 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18202)

(declare-fun a2!948 () array!18202)

(declare-fun arrayRangesEqImpliesEq!221 (array!18202 array!18202 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20969)

(assert (=> b!299946 (= lt!435645 (arrayRangesEqImpliesEq!221 a1!948 a2!948 (_1!13163 lt!435643) (_3!1465 lt!435651) (_2!13163 lt!435643)))))

(assert (=> b!299946 (= (select (arr!8987 a1!948) (_3!1465 lt!435651)) (select (arr!8987 a2!948) (_3!1465 lt!435651)))))

(declare-fun b!299947 () Bool)

(declare-fun e!215379 () Unit!20969)

(declare-fun Unit!20971 () Unit!20969)

(assert (=> b!299947 (= e!215379 Unit!20971)))

(declare-fun b!299948 () Bool)

(declare-fun res!247406 () Bool)

(declare-fun e!215372 () Bool)

(assert (=> b!299948 (=> (not res!247406) (not e!215372))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!435646 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299948 (= res!247406 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435646) (not (= fromSlice!52 toSlice!52))))))

(declare-fun res!247408 () Bool)

(declare-fun e!215376 () Bool)

(assert (=> start!67002 (=> (not res!247408) (not e!215376))))

(assert (=> start!67002 (= res!247408 (and (bvsle (size!7904 a1!948) (size!7904 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67002 e!215376))

(assert (=> start!67002 true))

(declare-fun array_inv!7516 (array!18202) Bool)

(assert (=> start!67002 (array_inv!7516 a1!948)))

(assert (=> start!67002 (array_inv!7516 a2!948)))

(declare-fun b!299949 () Bool)

(assert (=> b!299949 (= e!215376 e!215372)))

(declare-fun res!247411 () Bool)

(assert (=> b!299949 (=> (not res!247411) (not e!215372))))

(assert (=> b!299949 (= res!247411 (and (bvsle toBit!258 lt!435646) (bvsle fromBit!258 lt!435646)))))

(assert (=> b!299949 (= lt!435646 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7904 a1!948))))))

(declare-fun b!299950 () Bool)

(declare-fun res!247410 () Bool)

(declare-fun lt!435647 () (_ BitVec 32))

(assert (=> b!299950 (= res!247410 (= lt!435647 #b00000000000000000000000000000000))))

(declare-fun e!215378 () Bool)

(assert (=> b!299950 (=> res!247410 e!215378)))

(declare-fun e!215371 () Bool)

(assert (=> b!299950 (= e!215371 e!215378)))

(declare-fun b!299951 () Bool)

(declare-fun e!215375 () Bool)

(assert (=> b!299951 (= e!215375 e!215371)))

(declare-fun lt!435648 () (_ BitVec 32))

(declare-fun res!247407 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299951 (= res!247407 (byteRangesEq!0 (select (arr!8987 a1!948) (_3!1465 lt!435643)) (select (arr!8987 a2!948) (_3!1465 lt!435643)) lt!435648 #b00000000000000000000000000000111))))

(assert (=> b!299951 (=> (not res!247407) (not e!215371))))

(declare-fun b!299952 () Bool)

(declare-fun Unit!20972 () Unit!20969)

(assert (=> b!299952 (= e!215374 Unit!20972)))

(declare-fun b!299953 () Bool)

(declare-fun call!5345 () Bool)

(assert (=> b!299953 (= e!215375 call!5345)))

(declare-fun b!299954 () Bool)

(declare-fun res!247412 () Bool)

(assert (=> b!299954 (=> (not res!247412) (not e!215372))))

(declare-fun arrayBitRangesEq!0 (array!18202 array!18202 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299954 (= res!247412 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299955 () Bool)

(declare-fun lt!435649 () Unit!20969)

(assert (=> b!299955 (= e!215379 lt!435649)))

(declare-fun arrayRangesEqSlicedLemma!176 (array!18202 array!18202 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20969)

(assert (=> b!299955 (= lt!435649 (arrayRangesEqSlicedLemma!176 a1!948 a2!948 (_1!13163 lt!435643) (_2!13163 lt!435643) (_1!13163 lt!435651) (_2!13163 lt!435651)))))

(declare-fun arrayRangesEq!1566 (array!18202 array!18202 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299955 (arrayRangesEq!1566 a1!948 a2!948 (_1!13163 lt!435651) (_2!13163 lt!435651))))

(declare-fun b!299956 () Bool)

(assert (=> b!299956 (= e!215378 call!5345)))

(declare-fun b!299957 () Bool)

(declare-fun e!215370 () Bool)

(assert (=> b!299957 (= e!215370 false)))

(declare-fun lt!435644 () Unit!20969)

(assert (=> b!299957 (= lt!435644 e!215374)))

(declare-fun c!13854 () Bool)

(assert (=> b!299957 (= c!13854 (and (bvslt (_3!1465 lt!435643) (_3!1465 lt!435651)) (bvslt (_3!1465 lt!435651) (_4!508 lt!435643))))))

(declare-fun b!299958 () Bool)

(assert (=> b!299958 (= e!215372 e!215370)))

(declare-fun res!247409 () Bool)

(assert (=> b!299958 (=> (not res!247409) (not e!215370))))

(assert (=> b!299958 (= res!247409 e!215375)))

(declare-fun c!13852 () Bool)

(assert (=> b!299958 (= c!13852 (= (_3!1465 lt!435643) (_4!508 lt!435643)))))

(declare-fun lt!435650 () Unit!20969)

(assert (=> b!299958 (= lt!435650 e!215379)))

(declare-fun c!13853 () Bool)

(assert (=> b!299958 (= c!13853 (bvslt (_1!13163 lt!435651) (_2!13163 lt!435651)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1016)

(assert (=> b!299958 (= lt!435651 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!299958 (= lt!435647 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299958 (= lt!435648 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299958 (= lt!435643 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun bm!5342 () Bool)

(assert (=> bm!5342 (= call!5345 (byteRangesEq!0 (ite c!13852 (select (arr!8987 a1!948) (_3!1465 lt!435643)) (select (arr!8987 a1!948) (_4!508 lt!435643))) (ite c!13852 (select (arr!8987 a2!948) (_3!1465 lt!435643)) (select (arr!8987 a2!948) (_4!508 lt!435643))) (ite c!13852 lt!435648 #b00000000000000000000000000000000) lt!435647))))

(assert (= (and start!67002 res!247408) b!299949))

(assert (= (and b!299949 res!247411) b!299954))

(assert (= (and b!299954 res!247412) b!299948))

(assert (= (and b!299948 res!247406) b!299958))

(assert (= (and b!299958 c!13853) b!299955))

(assert (= (and b!299958 (not c!13853)) b!299947))

(assert (= (and b!299958 c!13852) b!299953))

(assert (= (and b!299958 (not c!13852)) b!299951))

(assert (= (and b!299951 res!247407) b!299950))

(assert (= (and b!299950 (not res!247410)) b!299956))

(assert (= (or b!299953 b!299956) bm!5342))

(assert (= (and b!299958 res!247409) b!299957))

(assert (= (and b!299957 c!13854) b!299946))

(assert (= (and b!299957 (not c!13854)) b!299952))

(declare-fun m!438999 () Bool)

(assert (=> b!299955 m!438999))

(declare-fun m!439001 () Bool)

(assert (=> b!299955 m!439001))

(declare-fun m!439003 () Bool)

(assert (=> start!67002 m!439003))

(declare-fun m!439005 () Bool)

(assert (=> start!67002 m!439005))

(declare-fun m!439007 () Bool)

(assert (=> b!299958 m!439007))

(declare-fun m!439009 () Bool)

(assert (=> b!299958 m!439009))

(declare-fun m!439011 () Bool)

(assert (=> b!299951 m!439011))

(declare-fun m!439013 () Bool)

(assert (=> b!299951 m!439013))

(assert (=> b!299951 m!439011))

(assert (=> b!299951 m!439013))

(declare-fun m!439015 () Bool)

(assert (=> b!299951 m!439015))

(declare-fun m!439017 () Bool)

(assert (=> b!299946 m!439017))

(declare-fun m!439019 () Bool)

(assert (=> b!299946 m!439019))

(declare-fun m!439021 () Bool)

(assert (=> b!299946 m!439021))

(assert (=> bm!5342 m!439013))

(declare-fun m!439023 () Bool)

(assert (=> bm!5342 m!439023))

(declare-fun m!439025 () Bool)

(assert (=> bm!5342 m!439025))

(assert (=> bm!5342 m!439011))

(declare-fun m!439027 () Bool)

(assert (=> bm!5342 m!439027))

(declare-fun m!439029 () Bool)

(assert (=> b!299954 m!439029))

(check-sat (not b!299946) (not b!299954) (not bm!5342) (not b!299951) (not b!299955) (not start!67002) (not b!299958))
(check-sat)
