; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67516 () Bool)

(assert start!67516)

(declare-fun res!249501 () Bool)

(declare-fun e!218092 () Bool)

(assert (=> start!67516 (=> (not res!249501) (not e!218092))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18423 0))(
  ( (array!18424 (arr!9081 (Array (_ BitVec 32) (_ BitVec 8))) (size!7998 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18423)

(declare-fun a2!948 () array!18423)

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> start!67516 (= res!249501 (and (bvsle (size!7998 a1!948) (size!7998 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67516 e!218092))

(assert (=> start!67516 true))

(declare-fun array_inv!7610 (array!18423) Bool)

(assert (=> start!67516 (array_inv!7610 a1!948)))

(assert (=> start!67516 (array_inv!7610 a2!948)))

(declare-fun b!303167 () Bool)

(declare-datatypes ((Unit!21175 0))(
  ( (Unit!21176) )
))
(declare-fun e!218095 () Unit!21175)

(declare-fun Unit!21177 () Unit!21175)

(assert (=> b!303167 (= e!218095 Unit!21177)))

(declare-fun b!303168 () Bool)

(declare-fun e!218094 () Bool)

(declare-datatypes ((tuple4!1138 0))(
  ( (tuple4!1139 (_1!13224 (_ BitVec 32)) (_2!13224 (_ BitVec 32)) (_3!1526 (_ BitVec 32)) (_4!569 (_ BitVec 32))) )
))
(declare-fun lt!437639 () tuple4!1138)

(assert (=> b!303168 (= e!218094 (and (= (_3!1526 lt!437639) (_4!569 lt!437639)) (or (bvslt (_3!1526 lt!437639) #b00000000000000000000000000000000) (bvsge (_3!1526 lt!437639) (size!7998 a2!948)))))))

(declare-fun lt!437640 () Unit!21175)

(assert (=> b!303168 (= lt!437640 e!218095)))

(declare-fun c!14415 () Bool)

(declare-fun lt!437642 () tuple4!1138)

(assert (=> b!303168 (= c!14415 (bvslt (_1!13224 lt!437642) (_2!13224 lt!437642)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1138)

(assert (=> b!303168 (= lt!437642 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!303168 (= lt!437639 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303169 () Bool)

(assert (=> b!303169 (= e!218092 e!218094)))

(declare-fun res!249503 () Bool)

(assert (=> b!303169 (=> (not res!249503) (not e!218094))))

(declare-fun lt!437643 () (_ BitVec 64))

(assert (=> b!303169 (= res!249503 (and (bvsle toBit!258 lt!437643) (bvsle fromBit!258 lt!437643)))))

(assert (=> b!303169 (= lt!437643 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7998 a1!948))))))

(declare-fun b!303170 () Bool)

(declare-fun res!249502 () Bool)

(assert (=> b!303170 (=> (not res!249502) (not e!218094))))

(declare-fun arrayBitRangesEq!0 (array!18423 array!18423 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!303170 (= res!249502 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!303171 () Bool)

(declare-fun res!249504 () Bool)

(assert (=> b!303171 (=> (not res!249504) (not e!218094))))

(assert (=> b!303171 (= res!249504 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437643) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!303172 () Bool)

(declare-fun lt!437641 () Unit!21175)

(assert (=> b!303172 (= e!218095 lt!437641)))

(declare-fun arrayRangesEqSlicedLemma!222 (array!18423 array!18423 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21175)

(assert (=> b!303172 (= lt!437641 (arrayRangesEqSlicedLemma!222 a1!948 a2!948 (_1!13224 lt!437639) (_2!13224 lt!437639) (_1!13224 lt!437642) (_2!13224 lt!437642)))))

(declare-fun arrayRangesEq!1627 (array!18423 array!18423 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303172 (arrayRangesEq!1627 a1!948 a2!948 (_1!13224 lt!437642) (_2!13224 lt!437642))))

(assert (= (and start!67516 res!249501) b!303169))

(assert (= (and b!303169 res!249503) b!303170))

(assert (= (and b!303170 res!249502) b!303171))

(assert (= (and b!303171 res!249504) b!303168))

(assert (= (and b!303168 c!14415) b!303172))

(assert (= (and b!303168 (not c!14415)) b!303167))

(declare-fun m!441829 () Bool)

(assert (=> start!67516 m!441829))

(declare-fun m!441831 () Bool)

(assert (=> start!67516 m!441831))

(declare-fun m!441833 () Bool)

(assert (=> b!303168 m!441833))

(declare-fun m!441835 () Bool)

(assert (=> b!303168 m!441835))

(declare-fun m!441837 () Bool)

(assert (=> b!303170 m!441837))

(declare-fun m!441839 () Bool)

(assert (=> b!303172 m!441839))

(declare-fun m!441841 () Bool)

(assert (=> b!303172 m!441841))

(push 1)

(assert (not b!303168))

(assert (not start!67516))

(assert (not b!303172))

(assert (not b!303170))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101286 () Bool)

(assert (=> d!101286 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1139 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303168 d!101286))

(declare-fun d!101292 () Bool)

(assert (=> d!101292 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1139 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303168 d!101292))

(declare-fun d!101294 () Bool)

(assert (=> d!101294 (= (array_inv!7610 a1!948) (bvsge (size!7998 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67516 d!101294))

(declare-fun d!101296 () Bool)

(assert (=> d!101296 (= (array_inv!7610 a2!948) (bvsge (size!7998 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67516 d!101296))

(declare-fun d!101298 () Bool)

(assert (=> d!101298 (arrayRangesEq!1627 a1!948 a2!948 (_1!13224 lt!437642) (_2!13224 lt!437642))))

(declare-fun lt!437658 () Unit!21175)

(declare-fun choose!553 (array!18423 array!18423 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21175)

(assert (=> d!101298 (= lt!437658 (choose!553 a1!948 a2!948 (_1!13224 lt!437639) (_2!13224 lt!437639) (_1!13224 lt!437642) (_2!13224 lt!437642)))))

(assert (=> d!101298 (and (bvsle #b00000000000000000000000000000000 (_1!13224 lt!437639)) (bvsle (_1!13224 lt!437639) (_2!13224 lt!437639)))))

(assert (=> d!101298 (= (arrayRangesEqSlicedLemma!222 a1!948 a2!948 (_1!13224 lt!437639) (_2!13224 lt!437639) (_1!13224 lt!437642) (_2!13224 lt!437642)) lt!437658)))

(declare-fun bs!26129 () Bool)

(assert (= bs!26129 d!101298))

(assert (=> bs!26129 m!441841))

(declare-fun m!441859 () Bool)

(assert (=> bs!26129 m!441859))

(assert (=> b!303172 d!101298))

(declare-fun d!101300 () Bool)

(declare-fun res!249531 () Bool)

(declare-fun e!218124 () Bool)

(assert (=> d!101300 (=> res!249531 e!218124)))

(assert (=> d!101300 (= res!249531 (= (_1!13224 lt!437642) (_2!13224 lt!437642)))))

(assert (=> d!101300 (= (arrayRangesEq!1627 a1!948 a2!948 (_1!13224 lt!437642) (_2!13224 lt!437642)) e!218124)))

(declare-fun b!303203 () Bool)

(declare-fun e!218125 () Bool)

(assert (=> b!303203 (= e!218124 e!218125)))

(declare-fun res!249532 () Bool)

(assert (=> b!303203 (=> (not res!249532) (not e!218125))))

(assert (=> b!303203 (= res!249532 (= (select (arr!9081 a1!948) (_1!13224 lt!437642)) (select (arr!9081 a2!948) (_1!13224 lt!437642))))))

(declare-fun b!303204 () Bool)

(assert (=> b!303204 (= e!218125 (arrayRangesEq!1627 a1!948 a2!948 (bvadd (_1!13224 lt!437642) #b00000000000000000000000000000001) (_2!13224 lt!437642)))))

(assert (= (and d!101300 (not res!249531)) b!303203))

(assert (= (and b!303203 res!249532) b!303204))

(declare-fun m!441861 () Bool)

(assert (=> b!303203 m!441861))

(declare-fun m!441863 () Bool)

(assert (=> b!303203 m!441863))

(declare-fun m!441865 () Bool)

(assert (=> b!303204 m!441865))

(assert (=> b!303172 d!101300))

(declare-fun b!303247 () Bool)

(declare-fun e!218164 () Bool)

(declare-fun e!218163 () Bool)

(assert (=> b!303247 (= e!218164 e!218163)))

(declare-fun res!249566 () Bool)

(declare-fun call!5576 () Bool)

(assert (=> b!303247 (= res!249566 call!5576)))

(assert (=> b!303247 (=> (not res!249566) (not e!218163))))

(declare-fun d!101302 () Bool)

(declare-fun res!249565 () Bool)

(declare-fun e!218162 () Bool)

(assert (=> d!101302 (=> res!249565 e!218162)))

(assert (=> d!101302 (= res!249565 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101302 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218162)))

(declare-fun lt!437678 () (_ BitVec 32))

(declare-fun bm!5573 () Bool)

(declare-fun lt!437677 () tuple4!1138)

(declare-fun lt!437679 () (_ BitVec 32))

(declare-fun c!14424 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5573 (= call!5576 (byteRangesEq!0 (select (arr!9081 a1!948) (_3!1526 lt!437677)) (select (arr!9081 a2!948) (_3!1526 lt!437677)) lt!437679 (ite c!14424 lt!437678 #b00000000000000000000000000001000)))))

(declare-fun b!303248 () Bool)

(declare-fun e!218165 () Bool)

(assert (=> b!303248 (= e!218162 e!218165)))

(declare-fun res!249564 () Bool)

(assert (=> b!303248 (=> (not res!249564) (not e!218165))))

(declare-fun e!218167 () Bool)

(assert (=> b!303248 (= res!249564 e!218167)))

(declare-fun res!249567 () Bool)

(assert (=> b!303248 (=> res!249567 e!218167)))

(assert (=> b!303248 (= res!249567 (bvsge (_1!13224 lt!437677) (_2!13224 lt!437677)))))

(assert (=> b!303248 (= lt!437678 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303248 (= lt!437679 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303248 (= lt!437677 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303249 () Bool)

(assert (=> b!303249 (= e!218164 call!5576)))

(declare-fun b!303250 () Bool)

(declare-fun res!249563 () Bool)

(assert (=> b!303250 (= res!249563 (= lt!437678 #b00000000000000000000000000000000))))

(declare-fun e!218166 () Bool)

(assert (=> b!303250 (=> res!249563 e!218166)))

(assert (=> b!303250 (= e!218163 e!218166)))

(declare-fun b!303251 () Bool)

(assert (=> b!303251 (= e!218167 (arrayRangesEq!1627 a1!948 a2!948 (_1!13224 lt!437677) (_2!13224 lt!437677)))))

(declare-fun b!303252 () Bool)

(assert (=> b!303252 (= e!218166 (byteRangesEq!0 (select (arr!9081 a1!948) (_4!569 lt!437677)) (select (arr!9081 a2!948) (_4!569 lt!437677)) #b00000000000000000000000000000000 lt!437678))))

(declare-fun b!303253 () Bool)

(assert (=> b!303253 (= e!218165 e!218164)))

(assert (=> b!303253 (= c!14424 (= (_3!1526 lt!437677) (_4!569 lt!437677)))))

(assert (= (and d!101302 (not res!249565)) b!303248))

(assert (= (and b!303248 (not res!249567)) b!303251))

(assert (= (and b!303248 res!249564) b!303253))

(assert (= (and b!303253 c!14424) b!303249))

(assert (= (and b!303253 (not c!14424)) b!303247))

(assert (= (and b!303247 res!249566) b!303250))

(assert (= (and b!303250 (not res!249563)) b!303252))

(assert (= (or b!303249 b!303247) bm!5573))

(declare-fun m!441895 () Bool)

(assert (=> bm!5573 m!441895))

(declare-fun m!441897 () Bool)

(assert (=> bm!5573 m!441897))

(assert (=> bm!5573 m!441895))

(assert (=> bm!5573 m!441897))

(declare-fun m!441899 () Bool)

(assert (=> bm!5573 m!441899))

(assert (=> b!303248 m!441835))

(declare-fun m!441901 () Bool)

(assert (=> b!303251 m!441901))

(declare-fun m!441903 () Bool)

(assert (=> b!303252 m!441903))

(declare-fun m!441905 () Bool)

(assert (=> b!303252 m!441905))

(assert (=> b!303252 m!441903))

(assert (=> b!303252 m!441905))

(declare-fun m!441907 () Bool)

(assert (=> b!303252 m!441907))

(assert (=> b!303170 d!101302))

(push 1)

(assert (not bm!5573))

(assert (not d!101298))

(assert (not b!303252))

(assert (not b!303248))

(assert (not b!303204))

(assert (not b!303251))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

