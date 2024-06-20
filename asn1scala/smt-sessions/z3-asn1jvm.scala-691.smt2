; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19410 () Bool)

(assert start!19410)

(declare-fun b!96941 () Bool)

(declare-fun e!63552 () Bool)

(declare-datatypes ((array!4536 0))(
  ( (array!4537 (arr!2668 (Array (_ BitVec 32) (_ BitVec 8))) (size!2075 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3624 0))(
  ( (BitStream!3625 (buf!2421 array!4536) (currentByte!4828 (_ BitVec 32)) (currentBit!4823 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5872 0))(
  ( (Unit!5873) )
))
(declare-datatypes ((tuple2!7750 0))(
  ( (tuple2!7751 (_1!4127 Unit!5872) (_2!4127 BitStream!3624)) )
))
(declare-fun lt!139883 () tuple2!7750)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!96941 (= e!63552 (not (invariant!0 (currentBit!4823 (_2!4127 lt!139883)) (currentByte!4828 (_2!4127 lt!139883)) (size!2075 (buf!2421 (_2!4127 lt!139883))))))))

(declare-fun b!96942 () Bool)

(declare-fun e!63553 () Bool)

(declare-fun thiss!1288 () BitStream!3624)

(declare-fun array_inv!1877 (array!4536) Bool)

(assert (=> b!96942 (= e!63553 (array_inv!1877 (buf!2421 thiss!1288)))))

(declare-fun b!96943 () Bool)

(declare-fun res!79560 () Bool)

(declare-fun e!63555 () Bool)

(assert (=> b!96943 (=> (not res!79560) (not e!63555))))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!96943 (= res!79560 (validate_offset_bits!1 ((_ sign_extend 32) (size!2075 (buf!2421 thiss!1288))) ((_ sign_extend 32) (currentByte!4828 thiss!1288)) ((_ sign_extend 32) (currentBit!4823 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun res!79561 () Bool)

(assert (=> start!19410 (=> (not res!79561) (not e!63555))))

(assert (=> start!19410 (= res!79561 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19410 e!63555))

(assert (=> start!19410 true))

(declare-fun inv!12 (BitStream!3624) Bool)

(assert (=> start!19410 (and (inv!12 thiss!1288) e!63553)))

(declare-fun b!96944 () Bool)

(assert (=> b!96944 (= e!63555 e!63552)))

(declare-fun res!79558 () Bool)

(assert (=> b!96944 (=> (not res!79558) (not e!63552))))

(assert (=> b!96944 (= res!79558 (= (size!2075 (buf!2421 thiss!1288)) (size!2075 (buf!2421 (_2!4127 lt!139883)))))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3624 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7750)

(assert (=> b!96944 (= lt!139883 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!96945 () Bool)

(declare-fun res!79559 () Bool)

(assert (=> b!96945 (=> (not res!79559) (not e!63555))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!96945 (= res!79559 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(assert (= (and start!19410 res!79561) b!96943))

(assert (= (and b!96943 res!79560) b!96945))

(assert (= (and b!96945 res!79559) b!96944))

(assert (= (and b!96944 res!79558) b!96941))

(assert (= start!19410 b!96942))

(declare-fun m!140565 () Bool)

(assert (=> b!96943 m!140565))

(declare-fun m!140567 () Bool)

(assert (=> b!96945 m!140567))

(declare-fun m!140569 () Bool)

(assert (=> b!96941 m!140569))

(declare-fun m!140571 () Bool)

(assert (=> start!19410 m!140571))

(declare-fun m!140573 () Bool)

(assert (=> b!96944 m!140573))

(declare-fun m!140575 () Bool)

(assert (=> b!96942 m!140575))

(check-sat (not b!96944) (not b!96941) (not b!96945) (not b!96943) (not start!19410) (not b!96942))
(check-sat)
(get-model)

(declare-fun d!30436 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!30436 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2075 (buf!2421 thiss!1288))) ((_ sign_extend 32) (currentByte!4828 thiss!1288)) ((_ sign_extend 32) (currentBit!4823 thiss!1288)) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2075 (buf!2421 thiss!1288))) ((_ sign_extend 32) (currentByte!4828 thiss!1288)) ((_ sign_extend 32) (currentBit!4823 thiss!1288))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7442 () Bool)

(assert (= bs!7442 d!30436))

(declare-fun m!140597 () Bool)

(assert (=> bs!7442 m!140597))

(assert (=> b!96943 d!30436))

(declare-fun d!30438 () Bool)

(assert (=> d!30438 (= (array_inv!1877 (buf!2421 thiss!1288)) (bvsge (size!2075 (buf!2421 thiss!1288)) #b00000000000000000000000000000000))))

(assert (=> b!96942 d!30438))

(declare-fun d!30440 () Bool)

(assert (=> d!30440 (= (invariant!0 (currentBit!4823 (_2!4127 lt!139883)) (currentByte!4828 (_2!4127 lt!139883)) (size!2075 (buf!2421 (_2!4127 lt!139883)))) (and (bvsge (currentBit!4823 (_2!4127 lt!139883)) #b00000000000000000000000000000000) (bvslt (currentBit!4823 (_2!4127 lt!139883)) #b00000000000000000000000000001000) (bvsge (currentByte!4828 (_2!4127 lt!139883)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4828 (_2!4127 lt!139883)) (size!2075 (buf!2421 (_2!4127 lt!139883)))) (and (= (currentBit!4823 (_2!4127 lt!139883)) #b00000000000000000000000000000000) (= (currentByte!4828 (_2!4127 lt!139883)) (size!2075 (buf!2421 (_2!4127 lt!139883))))))))))

(assert (=> b!96941 d!30440))

(declare-fun d!30442 () Bool)

(assert (=> d!30442 (= (inv!12 thiss!1288) (invariant!0 (currentBit!4823 thiss!1288) (currentByte!4828 thiss!1288) (size!2075 (buf!2421 thiss!1288))))))

(declare-fun bs!7443 () Bool)

(assert (= bs!7443 d!30442))

(declare-fun m!140599 () Bool)

(assert (=> bs!7443 m!140599))

(assert (=> start!19410 d!30442))

(declare-fun d!30444 () Bool)

(assert (=> d!30444 (= (onesLSBLong!0 nBits!388) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!388))))))

(assert (=> b!96945 d!30444))

(declare-fun d!30446 () Bool)

(declare-fun e!63630 () Bool)

(assert (=> d!30446 e!63630))

(declare-fun res!79648 () Bool)

(assert (=> d!30446 (=> (not res!79648) (not e!63630))))

(declare-fun lt!140255 () tuple2!7750)

(assert (=> d!30446 (= res!79648 (= (size!2075 (buf!2421 thiss!1288)) (size!2075 (buf!2421 (_2!4127 lt!140255)))))))

(declare-fun e!63627 () tuple2!7750)

(assert (=> d!30446 (= lt!140255 e!63627)))

(declare-fun c!6138 () Bool)

(assert (=> d!30446 (= c!6138 (bvslt #b00000000000000000000000000000000 nBits!388))))

(assert (=> d!30446 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!388) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!30446 (= (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000) lt!140255)))

(declare-fun b!97065 () Bool)

(declare-fun res!79647 () Bool)

(assert (=> b!97065 (=> (not res!79647) (not e!63630))))

(declare-fun lt!140279 () (_ BitVec 64))

(declare-fun lt!140277 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97065 (= res!79647 (= (bitIndex!0 (size!2075 (buf!2421 (_2!4127 lt!140255))) (currentByte!4828 (_2!4127 lt!140255)) (currentBit!4823 (_2!4127 lt!140255))) (bvadd lt!140279 lt!140277)))))

(assert (=> b!97065 (or (not (= (bvand lt!140279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140277 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!140279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!140279 lt!140277) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97065 (= lt!140277 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!97065 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!97065 (= lt!140279 (bitIndex!0 (size!2075 (buf!2421 thiss!1288)) (currentByte!4828 thiss!1288) (currentBit!4823 thiss!1288)))))

(declare-fun b!97066 () Bool)

(declare-fun e!63629 () Bool)

(declare-datatypes ((tuple2!7766 0))(
  ( (tuple2!7767 (_1!4135 BitStream!3624) (_2!4135 Bool)) )
))
(declare-fun lt!140289 () tuple2!7766)

(declare-fun lt!140287 () tuple2!7766)

(assert (=> b!97066 (= e!63629 (= (_2!4135 lt!140289) (_2!4135 lt!140287)))))

(declare-fun b!97067 () Bool)

(declare-fun lt!140273 () tuple2!7750)

(declare-fun Unit!5888 () Unit!5872)

(assert (=> b!97067 (= e!63627 (tuple2!7751 Unit!5888 (_2!4127 lt!140273)))))

(declare-fun lt!140248 () Bool)

(assert (=> b!97067 (= lt!140248 (not (= (bvand v!196 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!140276 () tuple2!7750)

(declare-fun appendBit!0 (BitStream!3624 Bool) tuple2!7750)

(assert (=> b!97067 (= lt!140276 (appendBit!0 thiss!1288 lt!140248))))

(declare-fun res!79651 () Bool)

(assert (=> b!97067 (= res!79651 (= (size!2075 (buf!2421 thiss!1288)) (size!2075 (buf!2421 (_2!4127 lt!140276)))))))

(declare-fun e!63624 () Bool)

(assert (=> b!97067 (=> (not res!79651) (not e!63624))))

(assert (=> b!97067 e!63624))

(declare-fun lt!140271 () tuple2!7750)

(assert (=> b!97067 (= lt!140271 lt!140276)))

(assert (=> b!97067 (= lt!140273 (appendNLeastSignificantBitsLoop!0 (_2!4127 lt!140271) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!140262 () Unit!5872)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3624 BitStream!3624 BitStream!3624) Unit!5872)

(assert (=> b!97067 (= lt!140262 (lemmaIsPrefixTransitive!0 thiss!1288 (_2!4127 lt!140271) (_2!4127 lt!140273)))))

(declare-fun isPrefixOf!0 (BitStream!3624 BitStream!3624) Bool)

(assert (=> b!97067 (isPrefixOf!0 thiss!1288 (_2!4127 lt!140273))))

(declare-fun lt!140285 () Unit!5872)

(assert (=> b!97067 (= lt!140285 lt!140262)))

(assert (=> b!97067 (invariant!0 (currentBit!4823 thiss!1288) (currentByte!4828 thiss!1288) (size!2075 (buf!2421 (_2!4127 lt!140271))))))

(declare-fun lt!140264 () BitStream!3624)

(assert (=> b!97067 (= lt!140264 (BitStream!3625 (buf!2421 (_2!4127 lt!140271)) (currentByte!4828 thiss!1288) (currentBit!4823 thiss!1288)))))

(assert (=> b!97067 (invariant!0 (currentBit!4823 lt!140264) (currentByte!4828 lt!140264) (size!2075 (buf!2421 (_2!4127 lt!140273))))))

(declare-fun lt!140256 () BitStream!3624)

(assert (=> b!97067 (= lt!140256 (BitStream!3625 (buf!2421 (_2!4127 lt!140273)) (currentByte!4828 lt!140264) (currentBit!4823 lt!140264)))))

(declare-fun readBitPure!0 (BitStream!3624) tuple2!7766)

(assert (=> b!97067 (= lt!140289 (readBitPure!0 lt!140264))))

(assert (=> b!97067 (= lt!140287 (readBitPure!0 lt!140256))))

(declare-fun lt!140283 () Unit!5872)

(declare-fun readBitPrefixLemma!0 (BitStream!3624 BitStream!3624) Unit!5872)

(assert (=> b!97067 (= lt!140283 (readBitPrefixLemma!0 lt!140264 (_2!4127 lt!140273)))))

(declare-fun res!79649 () Bool)

(assert (=> b!97067 (= res!79649 (= (bitIndex!0 (size!2075 (buf!2421 (_1!4135 lt!140289))) (currentByte!4828 (_1!4135 lt!140289)) (currentBit!4823 (_1!4135 lt!140289))) (bitIndex!0 (size!2075 (buf!2421 (_1!4135 lt!140287))) (currentByte!4828 (_1!4135 lt!140287)) (currentBit!4823 (_1!4135 lt!140287)))))))

(assert (=> b!97067 (=> (not res!79649) (not e!63629))))

(assert (=> b!97067 e!63629))

(declare-fun lt!140260 () Unit!5872)

(assert (=> b!97067 (= lt!140260 lt!140283)))

(declare-datatypes ((tuple2!7768 0))(
  ( (tuple2!7769 (_1!4136 BitStream!3624) (_2!4136 BitStream!3624)) )
))
(declare-fun lt!140278 () tuple2!7768)

(declare-fun reader!0 (BitStream!3624 BitStream!3624) tuple2!7768)

(assert (=> b!97067 (= lt!140278 (reader!0 thiss!1288 (_2!4127 lt!140273)))))

(declare-fun lt!140269 () tuple2!7768)

(assert (=> b!97067 (= lt!140269 (reader!0 (_2!4127 lt!140271) (_2!4127 lt!140273)))))

(declare-fun lt!140275 () tuple2!7766)

(assert (=> b!97067 (= lt!140275 (readBitPure!0 (_1!4136 lt!140278)))))

(assert (=> b!97067 (= (_2!4135 lt!140275) lt!140248)))

(declare-fun lt!140282 () Unit!5872)

(declare-fun Unit!5889 () Unit!5872)

(assert (=> b!97067 (= lt!140282 Unit!5889)))

(declare-fun lt!140250 () (_ BitVec 64))

(assert (=> b!97067 (= lt!140250 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(declare-fun lt!140247 () (_ BitVec 64))

(assert (=> b!97067 (= lt!140247 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(declare-fun lt!140270 () Unit!5872)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3624 array!4536 (_ BitVec 64)) Unit!5872)

(assert (=> b!97067 (= lt!140270 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2421 (_2!4127 lt!140273)) lt!140247))))

(assert (=> b!97067 (validate_offset_bits!1 ((_ sign_extend 32) (size!2075 (buf!2421 (_2!4127 lt!140273)))) ((_ sign_extend 32) (currentByte!4828 thiss!1288)) ((_ sign_extend 32) (currentBit!4823 thiss!1288)) lt!140247)))

(declare-fun lt!140291 () Unit!5872)

(assert (=> b!97067 (= lt!140291 lt!140270)))

(declare-datatypes ((tuple2!7770 0))(
  ( (tuple2!7771 (_1!4137 BitStream!3624) (_2!4137 (_ BitVec 64))) )
))
(declare-fun lt!140267 () tuple2!7770)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3624 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!7770)

(assert (=> b!97067 (= lt!140267 (readNLeastSignificantBitsLoopPure!0 (_1!4136 lt!140278) nBits!388 #b00000000000000000000000000000000 lt!140250))))

(declare-fun lt!140253 () (_ BitVec 64))

(assert (=> b!97067 (= lt!140253 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!140257 () Unit!5872)

(assert (=> b!97067 (= lt!140257 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4127 lt!140271) (buf!2421 (_2!4127 lt!140273)) lt!140253))))

(assert (=> b!97067 (validate_offset_bits!1 ((_ sign_extend 32) (size!2075 (buf!2421 (_2!4127 lt!140273)))) ((_ sign_extend 32) (currentByte!4828 (_2!4127 lt!140271))) ((_ sign_extend 32) (currentBit!4823 (_2!4127 lt!140271))) lt!140253)))

(declare-fun lt!140284 () Unit!5872)

(assert (=> b!97067 (= lt!140284 lt!140257)))

(declare-fun lt!140274 () tuple2!7770)

(assert (=> b!97067 (= lt!140274 (readNLeastSignificantBitsLoopPure!0 (_1!4136 lt!140269) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!140250 (ite (_2!4135 lt!140275) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!140281 () tuple2!7770)

(assert (=> b!97067 (= lt!140281 (readNLeastSignificantBitsLoopPure!0 (_1!4136 lt!140278) nBits!388 #b00000000000000000000000000000000 lt!140250))))

(declare-fun c!6137 () Bool)

(assert (=> b!97067 (= c!6137 (_2!4135 (readBitPure!0 (_1!4136 lt!140278))))))

(declare-fun lt!140280 () tuple2!7770)

(declare-fun e!63628 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3624 (_ BitVec 64)) BitStream!3624)

(assert (=> b!97067 (= lt!140280 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4136 lt!140278) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!140250 e!63628)))))

(declare-fun lt!140254 () Unit!5872)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3624 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!5872)

(assert (=> b!97067 (= lt!140254 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4136 lt!140278) nBits!388 #b00000000000000000000000000000000 lt!140250))))

(assert (=> b!97067 (and (= (_2!4137 lt!140281) (_2!4137 lt!140280)) (= (_1!4137 lt!140281) (_1!4137 lt!140280)))))

(declare-fun lt!140263 () Unit!5872)

(assert (=> b!97067 (= lt!140263 lt!140254)))

(assert (=> b!97067 (= (_1!4136 lt!140278) (withMovedBitIndex!0 (_2!4136 lt!140278) (bvsub (bitIndex!0 (size!2075 (buf!2421 thiss!1288)) (currentByte!4828 thiss!1288) (currentBit!4823 thiss!1288)) (bitIndex!0 (size!2075 (buf!2421 (_2!4127 lt!140273))) (currentByte!4828 (_2!4127 lt!140273)) (currentBit!4823 (_2!4127 lt!140273))))))))

(declare-fun lt!140266 () Unit!5872)

(declare-fun Unit!5890 () Unit!5872)

(assert (=> b!97067 (= lt!140266 Unit!5890)))

(assert (=> b!97067 (= (_1!4136 lt!140269) (withMovedBitIndex!0 (_2!4136 lt!140269) (bvsub (bitIndex!0 (size!2075 (buf!2421 (_2!4127 lt!140271))) (currentByte!4828 (_2!4127 lt!140271)) (currentBit!4823 (_2!4127 lt!140271))) (bitIndex!0 (size!2075 (buf!2421 (_2!4127 lt!140273))) (currentByte!4828 (_2!4127 lt!140273)) (currentBit!4823 (_2!4127 lt!140273))))))))

(declare-fun lt!140290 () Unit!5872)

(declare-fun Unit!5891 () Unit!5872)

(assert (=> b!97067 (= lt!140290 Unit!5891)))

(assert (=> b!97067 (= (bitIndex!0 (size!2075 (buf!2421 thiss!1288)) (currentByte!4828 thiss!1288) (currentBit!4823 thiss!1288)) (bvsub (bitIndex!0 (size!2075 (buf!2421 (_2!4127 lt!140271))) (currentByte!4828 (_2!4127 lt!140271)) (currentBit!4823 (_2!4127 lt!140271))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!140288 () Unit!5872)

(declare-fun Unit!5892 () Unit!5872)

(assert (=> b!97067 (= lt!140288 Unit!5892)))

(assert (=> b!97067 (= (_2!4137 lt!140267) (_2!4137 lt!140274))))

(declare-fun lt!140272 () Unit!5872)

(declare-fun Unit!5893 () Unit!5872)

(assert (=> b!97067 (= lt!140272 Unit!5893)))

(assert (=> b!97067 (= (_1!4137 lt!140267) (_2!4136 lt!140278))))

(declare-fun bm!1190 () Bool)

(declare-fun call!1193 () Bool)

(declare-fun lt!140286 () BitStream!3624)

(assert (=> bm!1190 (= call!1193 (isPrefixOf!0 (ite c!6138 thiss!1288 lt!140286) (ite c!6138 (_2!4127 lt!140276) lt!140286)))))

(declare-fun b!97068 () Bool)

(declare-fun res!79652 () Bool)

(assert (=> b!97068 (= res!79652 call!1193)))

(assert (=> b!97068 (=> (not res!79652) (not e!63624))))

(declare-fun b!97069 () Bool)

(declare-fun lt!140258 () tuple2!7766)

(declare-fun readerFrom!0 (BitStream!3624 (_ BitVec 32) (_ BitVec 32)) BitStream!3624)

(assert (=> b!97069 (= lt!140258 (readBitPure!0 (readerFrom!0 (_2!4127 lt!140276) (currentBit!4823 thiss!1288) (currentByte!4828 thiss!1288))))))

(declare-fun res!79650 () Bool)

(assert (=> b!97069 (= res!79650 (and (= (_2!4135 lt!140258) lt!140248) (= (_1!4135 lt!140258) (_2!4127 lt!140276))))))

(declare-fun e!63626 () Bool)

(assert (=> b!97069 (=> (not res!79650) (not e!63626))))

(assert (=> b!97069 (= e!63624 e!63626)))

(declare-fun b!97070 () Bool)

(declare-fun res!79654 () Bool)

(assert (=> b!97070 (=> (not res!79654) (not e!63630))))

(assert (=> b!97070 (= res!79654 (isPrefixOf!0 thiss!1288 (_2!4127 lt!140255)))))

(declare-fun b!97071 () Bool)

(declare-fun res!79646 () Bool)

(assert (=> b!97071 (= res!79646 (= (bitIndex!0 (size!2075 (buf!2421 (_2!4127 lt!140276))) (currentByte!4828 (_2!4127 lt!140276)) (currentBit!4823 (_2!4127 lt!140276))) (bvadd (bitIndex!0 (size!2075 (buf!2421 thiss!1288)) (currentByte!4828 thiss!1288) (currentBit!4823 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!97071 (=> (not res!79646) (not e!63624))))

(declare-fun b!97072 () Bool)

(declare-fun lt!140251 () Unit!5872)

(assert (=> b!97072 (= e!63627 (tuple2!7751 lt!140251 thiss!1288))))

(assert (=> b!97072 (= lt!140286 thiss!1288)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3624) Unit!5872)

(assert (=> b!97072 (= lt!140251 (lemmaIsPrefixRefl!0 lt!140286))))

(assert (=> b!97072 call!1193))

(declare-fun b!97073 () Bool)

(assert (=> b!97073 (= e!63626 (= (bitIndex!0 (size!2075 (buf!2421 (_1!4135 lt!140258))) (currentByte!4828 (_1!4135 lt!140258)) (currentBit!4823 (_1!4135 lt!140258))) (bitIndex!0 (size!2075 (buf!2421 (_2!4127 lt!140276))) (currentByte!4828 (_2!4127 lt!140276)) (currentBit!4823 (_2!4127 lt!140276)))))))

(declare-fun b!97074 () Bool)

(assert (=> b!97074 (= e!63628 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!97075 () Bool)

(declare-fun e!63625 () Bool)

(declare-fun lt!140268 () (_ BitVec 64))

(assert (=> b!97075 (= e!63625 (validate_offset_bits!1 ((_ sign_extend 32) (size!2075 (buf!2421 thiss!1288))) ((_ sign_extend 32) (currentByte!4828 thiss!1288)) ((_ sign_extend 32) (currentBit!4823 thiss!1288)) lt!140268))))

(declare-fun b!97076 () Bool)

(assert (=> b!97076 (= e!63628 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!140259 () tuple2!7770)

(declare-fun b!97077 () Bool)

(declare-fun lt!140252 () tuple2!7768)

(assert (=> b!97077 (= e!63630 (and (= (_2!4137 lt!140259) v!196) (= (_1!4137 lt!140259) (_2!4136 lt!140252))))))

(declare-fun lt!140249 () (_ BitVec 64))

(assert (=> b!97077 (= lt!140259 (readNLeastSignificantBitsLoopPure!0 (_1!4136 lt!140252) nBits!388 #b00000000000000000000000000000000 lt!140249))))

(declare-fun lt!140261 () Unit!5872)

(declare-fun lt!140265 () Unit!5872)

(assert (=> b!97077 (= lt!140261 lt!140265)))

(assert (=> b!97077 (validate_offset_bits!1 ((_ sign_extend 32) (size!2075 (buf!2421 (_2!4127 lt!140255)))) ((_ sign_extend 32) (currentByte!4828 thiss!1288)) ((_ sign_extend 32) (currentBit!4823 thiss!1288)) lt!140268)))

(assert (=> b!97077 (= lt!140265 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2421 (_2!4127 lt!140255)) lt!140268))))

(assert (=> b!97077 e!63625))

(declare-fun res!79653 () Bool)

(assert (=> b!97077 (=> (not res!79653) (not e!63625))))

(assert (=> b!97077 (= res!79653 (and (= (size!2075 (buf!2421 thiss!1288)) (size!2075 (buf!2421 (_2!4127 lt!140255)))) (bvsge lt!140268 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97077 (= lt!140268 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!97077 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!97077 (= lt!140249 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(assert (=> b!97077 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!97077 (= lt!140252 (reader!0 thiss!1288 (_2!4127 lt!140255)))))

(assert (= (and d!30446 c!6138) b!97067))

(assert (= (and d!30446 (not c!6138)) b!97072))

(assert (= (and b!97067 res!79651) b!97071))

(assert (= (and b!97071 res!79646) b!97068))

(assert (= (and b!97068 res!79652) b!97069))

(assert (= (and b!97069 res!79650) b!97073))

(assert (= (and b!97067 res!79649) b!97066))

(assert (= (and b!97067 c!6137) b!97074))

(assert (= (and b!97067 (not c!6137)) b!97076))

(assert (= (or b!97068 b!97072) bm!1190))

(assert (= (and d!30446 res!79648) b!97065))

(assert (= (and b!97065 res!79647) b!97070))

(assert (= (and b!97070 res!79654) b!97077))

(assert (= (and b!97077 res!79653) b!97075))

(declare-fun m!140769 () Bool)

(assert (=> b!97077 m!140769))

(declare-fun m!140771 () Bool)

(assert (=> b!97077 m!140771))

(declare-fun m!140773 () Bool)

(assert (=> b!97077 m!140773))

(declare-fun m!140775 () Bool)

(assert (=> b!97077 m!140775))

(declare-fun m!140777 () Bool)

(assert (=> b!97077 m!140777))

(declare-fun m!140779 () Bool)

(assert (=> b!97065 m!140779))

(declare-fun m!140781 () Bool)

(assert (=> b!97065 m!140781))

(declare-fun m!140783 () Bool)

(assert (=> b!97070 m!140783))

(declare-fun m!140785 () Bool)

(assert (=> b!97069 m!140785))

(assert (=> b!97069 m!140785))

(declare-fun m!140787 () Bool)

(assert (=> b!97069 m!140787))

(declare-fun m!140789 () Bool)

(assert (=> b!97071 m!140789))

(assert (=> b!97071 m!140781))

(declare-fun m!140791 () Bool)

(assert (=> b!97072 m!140791))

(declare-fun m!140793 () Bool)

(assert (=> b!97067 m!140793))

(assert (=> b!97067 m!140775))

(declare-fun m!140795 () Bool)

(assert (=> b!97067 m!140795))

(declare-fun m!140797 () Bool)

(assert (=> b!97067 m!140797))

(declare-fun m!140799 () Bool)

(assert (=> b!97067 m!140799))

(declare-fun m!140801 () Bool)

(assert (=> b!97067 m!140801))

(declare-fun m!140803 () Bool)

(assert (=> b!97067 m!140803))

(declare-fun m!140805 () Bool)

(assert (=> b!97067 m!140805))

(declare-fun m!140807 () Bool)

(assert (=> b!97067 m!140807))

(declare-fun m!140809 () Bool)

(assert (=> b!97067 m!140809))

(declare-fun m!140811 () Bool)

(assert (=> b!97067 m!140811))

(declare-fun m!140813 () Bool)

(assert (=> b!97067 m!140813))

(declare-fun m!140815 () Bool)

(assert (=> b!97067 m!140815))

(declare-fun m!140817 () Bool)

(assert (=> b!97067 m!140817))

(declare-fun m!140819 () Bool)

(assert (=> b!97067 m!140819))

(declare-fun m!140821 () Bool)

(assert (=> b!97067 m!140821))

(declare-fun m!140823 () Bool)

(assert (=> b!97067 m!140823))

(declare-fun m!140825 () Bool)

(assert (=> b!97067 m!140825))

(declare-fun m!140827 () Bool)

(assert (=> b!97067 m!140827))

(declare-fun m!140829 () Bool)

(assert (=> b!97067 m!140829))

(assert (=> b!97067 m!140781))

(declare-fun m!140831 () Bool)

(assert (=> b!97067 m!140831))

(declare-fun m!140833 () Bool)

(assert (=> b!97067 m!140833))

(declare-fun m!140835 () Bool)

(assert (=> b!97067 m!140835))

(declare-fun m!140837 () Bool)

(assert (=> b!97067 m!140837))

(declare-fun m!140839 () Bool)

(assert (=> b!97067 m!140839))

(declare-fun m!140841 () Bool)

(assert (=> b!97067 m!140841))

(declare-fun m!140843 () Bool)

(assert (=> b!97067 m!140843))

(declare-fun m!140845 () Bool)

(assert (=> b!97067 m!140845))

(assert (=> b!97067 m!140811))

(declare-fun m!140847 () Bool)

(assert (=> bm!1190 m!140847))

(declare-fun m!140849 () Bool)

(assert (=> b!97075 m!140849))

(declare-fun m!140851 () Bool)

(assert (=> b!97073 m!140851))

(assert (=> b!97073 m!140789))

(assert (=> b!96944 d!30446))

(check-sat (not b!97065) (not d!30436) (not b!97073) (not bm!1190) (not b!97067) (not b!97069) (not b!97072) (not b!97075) (not b!97070) (not b!97077) (not b!97071) (not d!30442))
(check-sat)
