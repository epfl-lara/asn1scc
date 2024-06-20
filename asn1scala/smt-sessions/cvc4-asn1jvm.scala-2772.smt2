; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66998 () Bool)

(assert start!66998)

(declare-fun b!299868 () Bool)

(declare-datatypes ((Unit!20961 0))(
  ( (Unit!20962) )
))
(declare-fun e!215311 () Unit!20961)

(declare-fun Unit!20963 () Unit!20961)

(assert (=> b!299868 (= e!215311 Unit!20963)))

(declare-fun b!299869 () Bool)

(declare-fun e!215313 () Unit!20961)

(declare-fun Unit!20964 () Unit!20961)

(assert (=> b!299869 (= e!215313 Unit!20964)))

(declare-fun b!299870 () Bool)

(declare-fun res!247370 () Bool)

(declare-fun e!215312 () Bool)

(assert (=> b!299870 (=> (not res!247370) (not e!215312))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18198 0))(
  ( (array!18199 (arr!8985 (Array (_ BitVec 32) (_ BitVec 8))) (size!7902 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18198)

(declare-fun a2!948 () array!18198)

(declare-fun arrayBitRangesEq!0 (array!18198 array!18198 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299870 (= res!247370 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299871 () Bool)

(declare-fun lt!435590 () Unit!20961)

(assert (=> b!299871 (= e!215311 lt!435590)))

(declare-datatypes ((tuple4!1012 0))(
  ( (tuple4!1013 (_1!13161 (_ BitVec 32)) (_2!13161 (_ BitVec 32)) (_3!1463 (_ BitVec 32)) (_4!506 (_ BitVec 32))) )
))
(declare-fun lt!435595 () tuple4!1012)

(declare-fun lt!435591 () tuple4!1012)

(declare-fun arrayRangesEqImpliesEq!219 (array!18198 array!18198 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20961)

(assert (=> b!299871 (= lt!435590 (arrayRangesEqImpliesEq!219 a1!948 a2!948 (_1!13161 lt!435591) (_3!1463 lt!435595) (_2!13161 lt!435591)))))

(assert (=> b!299871 (= (select (arr!8985 a1!948) (_3!1463 lt!435595)) (select (arr!8985 a2!948) (_3!1463 lt!435595)))))

(declare-fun b!299872 () Bool)

(declare-fun lt!435589 () Unit!20961)

(assert (=> b!299872 (= e!215313 lt!435589)))

(declare-fun arrayRangesEqSlicedLemma!174 (array!18198 array!18198 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20961)

(assert (=> b!299872 (= lt!435589 (arrayRangesEqSlicedLemma!174 a1!948 a2!948 (_1!13161 lt!435591) (_2!13161 lt!435591) (_1!13161 lt!435595) (_2!13161 lt!435595)))))

(declare-fun arrayRangesEq!1564 (array!18198 array!18198 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299872 (arrayRangesEq!1564 a1!948 a2!948 (_1!13161 lt!435595) (_2!13161 lt!435595))))

(declare-fun b!299873 () Bool)

(declare-fun e!215314 () Bool)

(assert (=> b!299873 (= e!215314 false)))

(declare-fun lt!435596 () Unit!20961)

(assert (=> b!299873 (= lt!435596 e!215311)))

(declare-fun c!13835 () Bool)

(assert (=> b!299873 (= c!13835 (and (bvslt (_3!1463 lt!435591) (_3!1463 lt!435595)) (bvslt (_3!1463 lt!435595) (_4!506 lt!435591))))))

(declare-fun b!299874 () Bool)

(declare-fun e!215317 () Bool)

(declare-fun e!215310 () Bool)

(assert (=> b!299874 (= e!215317 e!215310)))

(declare-fun res!247369 () Bool)

(declare-fun call!5339 () Bool)

(assert (=> b!299874 (= res!247369 call!5339)))

(assert (=> b!299874 (=> (not res!247369) (not e!215310))))

(declare-fun b!299875 () Bool)

(declare-fun res!247367 () Bool)

(assert (=> b!299875 (=> (not res!247367) (not e!215312))))

(declare-fun lt!435594 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299875 (= res!247367 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435594) (not (= fromSlice!52 toSlice!52))))))

(declare-fun res!247368 () Bool)

(declare-fun e!215318 () Bool)

(assert (=> start!66998 (=> (not res!247368) (not e!215318))))

(assert (=> start!66998 (= res!247368 (and (bvsle (size!7902 a1!948) (size!7902 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66998 e!215318))

(assert (=> start!66998 true))

(declare-fun array_inv!7514 (array!18198) Bool)

(assert (=> start!66998 (array_inv!7514 a1!948)))

(assert (=> start!66998 (array_inv!7514 a2!948)))

(declare-fun b!299876 () Bool)

(declare-fun res!247365 () Bool)

(declare-fun lt!435597 () (_ BitVec 32))

(assert (=> b!299876 (= res!247365 (= lt!435597 #b00000000000000000000000000000000))))

(declare-fun e!215315 () Bool)

(assert (=> b!299876 (=> res!247365 e!215315)))

(assert (=> b!299876 (= e!215310 e!215315)))

(declare-fun b!299877 () Bool)

(assert (=> b!299877 (= e!215312 e!215314)))

(declare-fun res!247366 () Bool)

(assert (=> b!299877 (=> (not res!247366) (not e!215314))))

(assert (=> b!299877 (= res!247366 e!215317)))

(declare-fun c!13834 () Bool)

(assert (=> b!299877 (= c!13834 (= (_3!1463 lt!435591) (_4!506 lt!435591)))))

(declare-fun lt!435593 () Unit!20961)

(assert (=> b!299877 (= lt!435593 e!215313)))

(declare-fun c!13836 () Bool)

(assert (=> b!299877 (= c!13836 (bvslt (_1!13161 lt!435595) (_2!13161 lt!435595)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1012)

(assert (=> b!299877 (= lt!435595 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!299877 (= lt!435597 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!435592 () (_ BitVec 32))

(assert (=> b!299877 (= lt!435592 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299877 (= lt!435591 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299878 () Bool)

(assert (=> b!299878 (= e!215318 e!215312)))

(declare-fun res!247364 () Bool)

(assert (=> b!299878 (=> (not res!247364) (not e!215312))))

(assert (=> b!299878 (= res!247364 (and (bvsle toBit!258 lt!435594) (bvsle fromBit!258 lt!435594)))))

(assert (=> b!299878 (= lt!435594 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7902 a1!948))))))

(declare-fun b!299879 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299879 (= e!215315 (byteRangesEq!0 (select (arr!8985 a1!948) (_4!506 lt!435591)) (select (arr!8985 a2!948) (_4!506 lt!435591)) #b00000000000000000000000000000000 lt!435597))))

(declare-fun bm!5336 () Bool)

(assert (=> bm!5336 (= call!5339 (byteRangesEq!0 (select (arr!8985 a1!948) (_3!1463 lt!435591)) (select (arr!8985 a2!948) (_3!1463 lt!435591)) lt!435592 (ite c!13834 lt!435597 #b00000000000000000000000000000111)))))

(declare-fun b!299880 () Bool)

(assert (=> b!299880 (= e!215317 call!5339)))

(assert (= (and start!66998 res!247368) b!299878))

(assert (= (and b!299878 res!247364) b!299870))

(assert (= (and b!299870 res!247370) b!299875))

(assert (= (and b!299875 res!247367) b!299877))

(assert (= (and b!299877 c!13836) b!299872))

(assert (= (and b!299877 (not c!13836)) b!299869))

(assert (= (and b!299877 c!13834) b!299880))

(assert (= (and b!299877 (not c!13834)) b!299874))

(assert (= (and b!299874 res!247369) b!299876))

(assert (= (and b!299876 (not res!247365)) b!299879))

(assert (= (or b!299880 b!299874) bm!5336))

(assert (= (and b!299877 res!247366) b!299873))

(assert (= (and b!299873 c!13835) b!299871))

(assert (= (and b!299873 (not c!13835)) b!299868))

(declare-fun m!438935 () Bool)

(assert (=> b!299871 m!438935))

(declare-fun m!438937 () Bool)

(assert (=> b!299871 m!438937))

(declare-fun m!438939 () Bool)

(assert (=> b!299871 m!438939))

(declare-fun m!438941 () Bool)

(assert (=> bm!5336 m!438941))

(declare-fun m!438943 () Bool)

(assert (=> bm!5336 m!438943))

(assert (=> bm!5336 m!438941))

(assert (=> bm!5336 m!438943))

(declare-fun m!438945 () Bool)

(assert (=> bm!5336 m!438945))

(declare-fun m!438947 () Bool)

(assert (=> b!299879 m!438947))

(declare-fun m!438949 () Bool)

(assert (=> b!299879 m!438949))

(assert (=> b!299879 m!438947))

(assert (=> b!299879 m!438949))

(declare-fun m!438951 () Bool)

(assert (=> b!299879 m!438951))

(declare-fun m!438953 () Bool)

(assert (=> b!299877 m!438953))

(declare-fun m!438955 () Bool)

(assert (=> b!299877 m!438955))

(declare-fun m!438957 () Bool)

(assert (=> start!66998 m!438957))

(declare-fun m!438959 () Bool)

(assert (=> start!66998 m!438959))

(declare-fun m!438961 () Bool)

(assert (=> b!299870 m!438961))

(declare-fun m!438963 () Bool)

(assert (=> b!299872 m!438963))

(declare-fun m!438965 () Bool)

(assert (=> b!299872 m!438965))

(push 1)

(assert (not b!299871))

(assert (not b!299870))

(assert (not b!299872))

(assert (not bm!5336))

(assert (not b!299877))

(assert (not b!299879))

(assert (not start!66998))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

