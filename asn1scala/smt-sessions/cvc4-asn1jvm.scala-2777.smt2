; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67070 () Bool)

(assert start!67070)

(declare-fun b!300568 () Bool)

(declare-fun e!215859 () Bool)

(declare-fun e!215855 () Bool)

(assert (=> b!300568 (= e!215859 e!215855)))

(declare-datatypes ((tuple4!1042 0))(
  ( (tuple4!1043 (_1!13176 (_ BitVec 32)) (_2!13176 (_ BitVec 32)) (_3!1478 (_ BitVec 32)) (_4!521 (_ BitVec 32))) )
))
(declare-fun lt!436103 () tuple4!1042)

(declare-datatypes ((array!18231 0))(
  ( (array!18232 (arr!9000 (Array (_ BitVec 32) (_ BitVec 8))) (size!7917 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18231)

(declare-fun a2!948 () array!18231)

(declare-fun res!247745 () Bool)

(declare-fun lt!436098 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300568 (= res!247745 (byteRangesEq!0 (select (arr!9000 a1!948) (_3!1478 lt!436103)) (select (arr!9000 a2!948) (_3!1478 lt!436103)) lt!436098 #b00000000000000000000000000000111))))

(assert (=> b!300568 (=> (not res!247745) (not e!215855))))

(declare-fun b!300569 () Bool)

(declare-datatypes ((Unit!21026 0))(
  ( (Unit!21027) )
))
(declare-fun e!215849 () Unit!21026)

(declare-fun Unit!21028 () Unit!21026)

(assert (=> b!300569 (= e!215849 Unit!21028)))

(declare-fun b!300570 () Bool)

(declare-fun res!247748 () Bool)

(declare-fun e!215856 () Bool)

(assert (=> b!300570 (=> (not res!247748) (not e!215856))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!436100 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!300570 (= res!247748 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436100) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!300571 () Bool)

(declare-fun lt!436099 () Unit!21026)

(assert (=> b!300571 (= e!215849 lt!436099)))

(declare-fun lt!436096 () tuple4!1042)

(declare-fun arrayRangesEqImpliesEq!234 (array!18231 array!18231 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21026)

(assert (=> b!300571 (= lt!436099 (arrayRangesEqImpliesEq!234 a1!948 a2!948 (_1!13176 lt!436103) (_4!521 lt!436096) (_2!13176 lt!436103)))))

(assert (=> b!300571 (= (select (arr!9000 a1!948) (_4!521 lt!436096)) (select (arr!9000 a2!948) (_4!521 lt!436096)))))

(declare-fun b!300573 () Bool)

(declare-fun e!215851 () Unit!21026)

(declare-fun lt!436102 () Unit!21026)

(assert (=> b!300573 (= e!215851 lt!436102)))

(declare-fun arrayRangesEqSlicedLemma!189 (array!18231 array!18231 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21026)

(assert (=> b!300573 (= lt!436102 (arrayRangesEqSlicedLemma!189 a1!948 a2!948 (_1!13176 lt!436103) (_2!13176 lt!436103) (_1!13176 lt!436096) (_2!13176 lt!436096)))))

(declare-fun arrayRangesEq!1579 (array!18231 array!18231 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300573 (arrayRangesEq!1579 a1!948 a2!948 (_1!13176 lt!436096) (_2!13176 lt!436096))))

(declare-fun b!300574 () Bool)

(declare-fun Unit!21029 () Unit!21026)

(assert (=> b!300574 (= e!215851 Unit!21029)))

(declare-fun call!5393 () Bool)

(declare-fun bm!5390 () Bool)

(declare-fun c!13997 () Bool)

(declare-fun lt!436097 () (_ BitVec 32))

(assert (=> bm!5390 (= call!5393 (byteRangesEq!0 (ite c!13997 (select (arr!9000 a1!948) (_3!1478 lt!436103)) (select (arr!9000 a1!948) (_4!521 lt!436103))) (ite c!13997 (select (arr!9000 a2!948) (_3!1478 lt!436103)) (select (arr!9000 a2!948) (_4!521 lt!436103))) (ite c!13997 lt!436098 #b00000000000000000000000000000000) lt!436097))))

(declare-fun b!300575 () Bool)

(declare-fun res!247747 () Bool)

(assert (=> b!300575 (= res!247747 (= lt!436097 #b00000000000000000000000000000000))))

(declare-fun e!215858 () Bool)

(assert (=> b!300575 (=> res!247747 e!215858)))

(assert (=> b!300575 (= e!215855 e!215858)))

(declare-fun b!300576 () Bool)

(assert (=> b!300576 (= e!215858 call!5393)))

(declare-fun b!300577 () Bool)

(declare-fun e!215850 () Bool)

(assert (=> b!300577 (= e!215850 false)))

(declare-fun lt!436095 () Unit!21026)

(assert (=> b!300577 (= lt!436095 e!215849)))

(declare-fun c!13998 () Bool)

(assert (=> b!300577 (= c!13998 (and (bvslt (_4!521 lt!436096) (_4!521 lt!436103)) (bvslt (_3!1478 lt!436103) (_4!521 lt!436096))))))

(declare-fun lt!436101 () Unit!21026)

(declare-fun e!215852 () Unit!21026)

(assert (=> b!300577 (= lt!436101 e!215852)))

(declare-fun c!13996 () Bool)

(assert (=> b!300577 (= c!13996 (and (bvslt (_3!1478 lt!436103) (_3!1478 lt!436096)) (bvslt (_3!1478 lt!436096) (_4!521 lt!436103))))))

(declare-fun b!300578 () Bool)

(declare-fun e!215854 () Bool)

(assert (=> b!300578 (= e!215854 e!215856)))

(declare-fun res!247743 () Bool)

(assert (=> b!300578 (=> (not res!247743) (not e!215856))))

(assert (=> b!300578 (= res!247743 (and (bvsle toBit!258 lt!436100) (bvsle fromBit!258 lt!436100)))))

(assert (=> b!300578 (= lt!436100 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7917 a1!948))))))

(declare-fun b!300579 () Bool)

(assert (=> b!300579 (= e!215856 e!215850)))

(declare-fun res!247746 () Bool)

(assert (=> b!300579 (=> (not res!247746) (not e!215850))))

(assert (=> b!300579 (= res!247746 e!215859)))

(assert (=> b!300579 (= c!13997 (= (_3!1478 lt!436103) (_4!521 lt!436103)))))

(declare-fun lt!436094 () Unit!21026)

(assert (=> b!300579 (= lt!436094 e!215851)))

(declare-fun c!13995 () Bool)

(assert (=> b!300579 (= c!13995 (bvslt (_1!13176 lt!436096) (_2!13176 lt!436096)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1042)

(assert (=> b!300579 (= lt!436096 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!300579 (= lt!436097 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300579 (= lt!436098 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300579 (= lt!436103 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!300580 () Bool)

(declare-fun Unit!21030 () Unit!21026)

(assert (=> b!300580 (= e!215852 Unit!21030)))

(declare-fun b!300572 () Bool)

(declare-fun res!247742 () Bool)

(assert (=> b!300572 (=> (not res!247742) (not e!215856))))

(declare-fun arrayBitRangesEq!0 (array!18231 array!18231 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!300572 (= res!247742 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun res!247744 () Bool)

(assert (=> start!67070 (=> (not res!247744) (not e!215854))))

(assert (=> start!67070 (= res!247744 (and (bvsle (size!7917 a1!948) (size!7917 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67070 e!215854))

(assert (=> start!67070 true))

(declare-fun array_inv!7529 (array!18231) Bool)

(assert (=> start!67070 (array_inv!7529 a1!948)))

(assert (=> start!67070 (array_inv!7529 a2!948)))

(declare-fun b!300581 () Bool)

(declare-fun lt!436104 () Unit!21026)

(assert (=> b!300581 (= e!215852 lt!436104)))

(assert (=> b!300581 (= lt!436104 (arrayRangesEqImpliesEq!234 a1!948 a2!948 (_1!13176 lt!436103) (_3!1478 lt!436096) (_2!13176 lt!436103)))))

(assert (=> b!300581 (= (select (arr!9000 a1!948) (_3!1478 lt!436096)) (select (arr!9000 a2!948) (_3!1478 lt!436096)))))

(declare-fun b!300582 () Bool)

(assert (=> b!300582 (= e!215859 call!5393)))

(assert (= (and start!67070 res!247744) b!300578))

(assert (= (and b!300578 res!247743) b!300572))

(assert (= (and b!300572 res!247742) b!300570))

(assert (= (and b!300570 res!247748) b!300579))

(assert (= (and b!300579 c!13995) b!300573))

(assert (= (and b!300579 (not c!13995)) b!300574))

(assert (= (and b!300579 c!13997) b!300582))

(assert (= (and b!300579 (not c!13997)) b!300568))

(assert (= (and b!300568 res!247745) b!300575))

(assert (= (and b!300575 (not res!247747)) b!300576))

(assert (= (or b!300582 b!300576) bm!5390))

(assert (= (and b!300579 res!247746) b!300577))

(assert (= (and b!300577 c!13996) b!300581))

(assert (= (and b!300577 (not c!13996)) b!300580))

(assert (= (and b!300577 c!13998) b!300571))

(assert (= (and b!300577 (not c!13998)) b!300569))

(declare-fun m!439547 () Bool)

(assert (=> b!300581 m!439547))

(declare-fun m!439549 () Bool)

(assert (=> b!300581 m!439549))

(declare-fun m!439551 () Bool)

(assert (=> b!300581 m!439551))

(declare-fun m!439553 () Bool)

(assert (=> b!300572 m!439553))

(declare-fun m!439555 () Bool)

(assert (=> b!300568 m!439555))

(declare-fun m!439557 () Bool)

(assert (=> b!300568 m!439557))

(assert (=> b!300568 m!439555))

(assert (=> b!300568 m!439557))

(declare-fun m!439559 () Bool)

(assert (=> b!300568 m!439559))

(declare-fun m!439561 () Bool)

(assert (=> bm!5390 m!439561))

(assert (=> bm!5390 m!439555))

(declare-fun m!439563 () Bool)

(assert (=> bm!5390 m!439563))

(assert (=> bm!5390 m!439557))

(declare-fun m!439565 () Bool)

(assert (=> bm!5390 m!439565))

(declare-fun m!439567 () Bool)

(assert (=> b!300579 m!439567))

(declare-fun m!439569 () Bool)

(assert (=> b!300579 m!439569))

(declare-fun m!439571 () Bool)

(assert (=> b!300571 m!439571))

(declare-fun m!439573 () Bool)

(assert (=> b!300571 m!439573))

(declare-fun m!439575 () Bool)

(assert (=> b!300571 m!439575))

(declare-fun m!439577 () Bool)

(assert (=> b!300573 m!439577))

(declare-fun m!439579 () Bool)

(assert (=> b!300573 m!439579))

(declare-fun m!439581 () Bool)

(assert (=> start!67070 m!439581))

(declare-fun m!439583 () Bool)

(assert (=> start!67070 m!439583))

(push 1)

