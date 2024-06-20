; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67088 () Bool)

(assert start!67088)

(declare-fun b!301007 () Bool)

(declare-fun e!216173 () Bool)

(declare-fun call!5420 () Bool)

(assert (=> b!301007 (= e!216173 call!5420)))

(declare-fun b!301008 () Bool)

(declare-datatypes ((Unit!21071 0))(
  ( (Unit!21072) )
))
(declare-fun e!216172 () Unit!21071)

(declare-fun lt!436410 () Unit!21071)

(assert (=> b!301008 (= e!216172 lt!436410)))

(declare-datatypes ((tuple4!1060 0))(
  ( (tuple4!1061 (_1!13185 (_ BitVec 32)) (_2!13185 (_ BitVec 32)) (_3!1487 (_ BitVec 32)) (_4!530 (_ BitVec 32))) )
))
(declare-fun lt!436419 () tuple4!1060)

(declare-datatypes ((array!18249 0))(
  ( (array!18250 (arr!9009 (Array (_ BitVec 32) (_ BitVec 8))) (size!7926 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18249)

(declare-fun a2!948 () array!18249)

(declare-fun lt!436414 () tuple4!1060)

(declare-fun arrayRangesEqImpliesEq!243 (array!18249 array!18249 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21071)

(assert (=> b!301008 (= lt!436410 (arrayRangesEqImpliesEq!243 a1!948 a2!948 (_1!13185 lt!436414) (_4!530 lt!436419) (_2!13185 lt!436414)))))

(assert (=> b!301008 (= (select (arr!9009 a1!948) (_4!530 lt!436419)) (select (arr!9009 a2!948) (_4!530 lt!436419)))))

(declare-fun b!301009 () Bool)

(declare-fun res!247965 () Bool)

(declare-fun lt!436415 () (_ BitVec 32))

(assert (=> b!301009 (= res!247965 (= lt!436415 #b00000000000000000000000000000000))))

(declare-fun e!216164 () Bool)

(assert (=> b!301009 (=> res!247965 e!216164)))

(declare-fun e!216166 () Bool)

(assert (=> b!301009 (= e!216166 e!216164)))

(declare-fun b!301010 () Bool)

(declare-fun res!247970 () Bool)

(declare-fun e!216168 () Bool)

(assert (=> b!301010 (=> (not res!247970) (not e!216168))))

(declare-fun lt!436418 () (_ BitVec 64))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!301010 (= res!247970 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436418) (not (= fromSlice!52 toSlice!52))))))

(declare-fun res!247966 () Bool)

(declare-fun e!216163 () Bool)

(assert (=> start!67088 (=> (not res!247966) (not e!216163))))

(assert (=> start!67088 (= res!247966 (and (bvsle (size!7926 a1!948) (size!7926 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67088 e!216163))

(assert (=> start!67088 true))

(declare-fun array_inv!7538 (array!18249) Bool)

(assert (=> start!67088 (array_inv!7538 a1!948)))

(assert (=> start!67088 (array_inv!7538 a2!948)))

(declare-fun b!301011 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301011 (= e!216164 (byteRangesEq!0 (select (arr!9009 a1!948) (_4!530 lt!436414)) (select (arr!9009 a2!948) (_4!530 lt!436414)) #b00000000000000000000000000000000 lt!436415))))

(declare-fun b!301012 () Bool)

(declare-fun e!216165 () Bool)

(assert (=> b!301012 (= e!216168 e!216165)))

(declare-fun res!247969 () Bool)

(assert (=> b!301012 (=> (not res!247969) (not e!216165))))

(assert (=> b!301012 (= res!247969 e!216173)))

(declare-fun c!14104 () Bool)

(assert (=> b!301012 (= c!14104 (= (_3!1487 lt!436414) (_4!530 lt!436414)))))

(declare-fun lt!436417 () Unit!21071)

(declare-fun e!216170 () Unit!21071)

(assert (=> b!301012 (= lt!436417 e!216170)))

(declare-fun c!14105 () Bool)

(assert (=> b!301012 (= c!14105 (bvslt (_1!13185 lt!436419) (_2!13185 lt!436419)))))

(declare-fun lt!436416 () (_ BitVec 32))

(assert (=> b!301012 (= lt!436416 ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1060)

(assert (=> b!301012 (= lt!436419 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!301012 (= lt!436415 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!436411 () (_ BitVec 32))

(assert (=> b!301012 (= lt!436411 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301012 (= lt!436414 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!301013 () Bool)

(assert (=> b!301013 (= e!216173 e!216166)))

(declare-fun res!247967 () Bool)

(assert (=> b!301013 (= res!247967 call!5420)))

(assert (=> b!301013 (=> (not res!247967) (not e!216166))))

(declare-fun b!301014 () Bool)

(declare-fun res!247968 () Bool)

(assert (=> b!301014 (=> (not res!247968) (not e!216168))))

(declare-fun arrayBitRangesEq!0 (array!18249 array!18249 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!301014 (= res!247968 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun bm!5417 () Bool)

(assert (=> bm!5417 (= call!5420 (byteRangesEq!0 (select (arr!9009 a1!948) (_3!1487 lt!436414)) (select (arr!9009 a2!948) (_3!1487 lt!436414)) lt!436411 (ite c!14104 lt!436415 #b00000000000000000000000000000111)))))

(declare-fun b!301015 () Bool)

(assert (=> b!301015 (= e!216163 e!216168)))

(declare-fun res!247971 () Bool)

(assert (=> b!301015 (=> (not res!247971) (not e!216168))))

(assert (=> b!301015 (= res!247971 (and (bvsle toBit!258 lt!436418) (bvsle fromBit!258 lt!436418)))))

(assert (=> b!301015 (= lt!436418 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7926 a1!948))))))

(declare-fun b!301016 () Bool)

(declare-fun Unit!21073 () Unit!21071)

(assert (=> b!301016 (= e!216170 Unit!21073)))

(declare-fun b!301017 () Bool)

(declare-fun e!216174 () Bool)

(assert (=> b!301017 (= e!216165 e!216174)))

(declare-fun res!247973 () Bool)

(assert (=> b!301017 (=> (not res!247973) (not e!216174))))

(assert (=> b!301017 (= res!247973 (not (= (_3!1487 lt!436419) (_4!530 lt!436419))))))

(declare-fun lt!436408 () Unit!21071)

(assert (=> b!301017 (= lt!436408 e!216172)))

(declare-fun c!14103 () Bool)

(assert (=> b!301017 (= c!14103 (and (bvslt (_4!530 lt!436419) (_4!530 lt!436414)) (bvslt (_3!1487 lt!436414) (_4!530 lt!436419))))))

(declare-fun lt!436409 () Unit!21071)

(declare-fun e!216171 () Unit!21071)

(assert (=> b!301017 (= lt!436409 e!216171)))

(declare-fun c!14106 () Bool)

(assert (=> b!301017 (= c!14106 (and (bvslt (_3!1487 lt!436414) (_3!1487 lt!436419)) (bvslt (_3!1487 lt!436419) (_4!530 lt!436414))))))

(declare-fun b!301018 () Bool)

(declare-fun Unit!21074 () Unit!21071)

(assert (=> b!301018 (= e!216171 Unit!21074)))

(declare-fun b!301019 () Bool)

(declare-fun res!247972 () Bool)

(assert (=> b!301019 (=> (not res!247972) (not e!216174))))

(assert (=> b!301019 (= res!247972 (byteRangesEq!0 (select (arr!9009 a1!948) (_3!1487 lt!436419)) (select (arr!9009 a2!948) (_3!1487 lt!436419)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun b!301020 () Bool)

(assert (=> b!301020 (= e!216174 (and (not (= lt!436416 #b00000000000000000000000000000000)) (or (bvsgt #b00000000000000000000000000000000 lt!436416) (bvsgt lt!436416 #b00000000000000000000000000001000))))))

(declare-fun b!301021 () Bool)

(declare-fun lt!436412 () Unit!21071)

(assert (=> b!301021 (= e!216170 lt!436412)))

(declare-fun arrayRangesEqSlicedLemma!198 (array!18249 array!18249 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21071)

(assert (=> b!301021 (= lt!436412 (arrayRangesEqSlicedLemma!198 a1!948 a2!948 (_1!13185 lt!436414) (_2!13185 lt!436414) (_1!13185 lt!436419) (_2!13185 lt!436419)))))

(declare-fun arrayRangesEq!1588 (array!18249 array!18249 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301021 (arrayRangesEq!1588 a1!948 a2!948 (_1!13185 lt!436419) (_2!13185 lt!436419))))

(declare-fun b!301022 () Bool)

(declare-fun Unit!21075 () Unit!21071)

(assert (=> b!301022 (= e!216172 Unit!21075)))

(declare-fun b!301023 () Bool)

(declare-fun lt!436413 () Unit!21071)

(assert (=> b!301023 (= e!216171 lt!436413)))

(assert (=> b!301023 (= lt!436413 (arrayRangesEqImpliesEq!243 a1!948 a2!948 (_1!13185 lt!436414) (_3!1487 lt!436419) (_2!13185 lt!436414)))))

(assert (=> b!301023 (= (select (arr!9009 a1!948) (_3!1487 lt!436419)) (select (arr!9009 a2!948) (_3!1487 lt!436419)))))

(assert (= (and start!67088 res!247966) b!301015))

(assert (= (and b!301015 res!247971) b!301014))

(assert (= (and b!301014 res!247968) b!301010))

(assert (= (and b!301010 res!247970) b!301012))

(assert (= (and b!301012 c!14105) b!301021))

(assert (= (and b!301012 (not c!14105)) b!301016))

(assert (= (and b!301012 c!14104) b!301007))

(assert (= (and b!301012 (not c!14104)) b!301013))

(assert (= (and b!301013 res!247967) b!301009))

(assert (= (and b!301009 (not res!247965)) b!301011))

(assert (= (or b!301007 b!301013) bm!5417))

(assert (= (and b!301012 res!247969) b!301017))

(assert (= (and b!301017 c!14106) b!301023))

(assert (= (and b!301017 (not c!14106)) b!301018))

(assert (= (and b!301017 c!14103) b!301008))

(assert (= (and b!301017 (not c!14103)) b!301022))

(assert (= (and b!301017 res!247973) b!301019))

(assert (= (and b!301019 res!247972) b!301020))

(declare-fun m!439899 () Bool)

(assert (=> b!301023 m!439899))

(declare-fun m!439901 () Bool)

(assert (=> b!301023 m!439901))

(declare-fun m!439903 () Bool)

(assert (=> b!301023 m!439903))

(declare-fun m!439905 () Bool)

(assert (=> bm!5417 m!439905))

(declare-fun m!439907 () Bool)

(assert (=> bm!5417 m!439907))

(assert (=> bm!5417 m!439905))

(assert (=> bm!5417 m!439907))

(declare-fun m!439909 () Bool)

(assert (=> bm!5417 m!439909))

(assert (=> b!301019 m!439901))

(assert (=> b!301019 m!439903))

(assert (=> b!301019 m!439901))

(assert (=> b!301019 m!439903))

(declare-fun m!439911 () Bool)

(assert (=> b!301019 m!439911))

(declare-fun m!439913 () Bool)

(assert (=> b!301008 m!439913))

(declare-fun m!439915 () Bool)

(assert (=> b!301008 m!439915))

(declare-fun m!439917 () Bool)

(assert (=> b!301008 m!439917))

(declare-fun m!439919 () Bool)

(assert (=> b!301012 m!439919))

(declare-fun m!439921 () Bool)

(assert (=> b!301012 m!439921))

(declare-fun m!439923 () Bool)

(assert (=> b!301021 m!439923))

(declare-fun m!439925 () Bool)

(assert (=> b!301021 m!439925))

(declare-fun m!439927 () Bool)

(assert (=> b!301011 m!439927))

(declare-fun m!439929 () Bool)

(assert (=> b!301011 m!439929))

(assert (=> b!301011 m!439927))

(assert (=> b!301011 m!439929))

(declare-fun m!439931 () Bool)

(assert (=> b!301011 m!439931))

(declare-fun m!439933 () Bool)

(assert (=> b!301014 m!439933))

(declare-fun m!439935 () Bool)

(assert (=> start!67088 m!439935))

(declare-fun m!439937 () Bool)

(assert (=> start!67088 m!439937))

(push 1)

(assert (not b!301012))

(assert (not b!301014))

(assert (not b!301019))

(assert (not b!301011))

(assert (not bm!5417))

(assert (not start!67088))

(assert (not b!301021))

(assert (not b!301023))

(assert (not b!301008))

(check-sat)

(pop 1)

(push 1)

(check-sat)

