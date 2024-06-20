; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22624 () Bool)

(assert start!22624)

(declare-fun b!114344 () Bool)

(declare-fun res!94480 () Bool)

(declare-fun e!74981 () Bool)

(assert (=> b!114344 (=> (not res!94480) (not e!74981))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!114344 (= res!94480 (bvslt i!615 nBits!396))))

(declare-fun b!114345 () Bool)

(declare-fun res!94471 () Bool)

(assert (=> b!114345 (=> (not res!94471) (not e!74981))))

(declare-datatypes ((array!5187 0))(
  ( (array!5188 (arr!2948 (Array (_ BitVec 32) (_ BitVec 8))) (size!2355 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4184 0))(
  ( (BitStream!4185 (buf!2763 array!5187) (currentByte!5370 (_ BitVec 32)) (currentBit!5365 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4184)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!114345 (= res!94471 (validate_offset_bits!1 ((_ sign_extend 32) (size!2355 (buf!2763 thiss!1305))) ((_ sign_extend 32) (currentByte!5370 thiss!1305)) ((_ sign_extend 32) (currentBit!5365 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!114346 () Bool)

(declare-fun e!74984 () Bool)

(declare-fun e!74983 () Bool)

(assert (=> b!114346 (= e!74984 e!74983)))

(declare-fun res!94478 () Bool)

(assert (=> b!114346 (=> (not res!94478) (not e!74983))))

(declare-fun lt!173909 () Bool)

(declare-datatypes ((Unit!7031 0))(
  ( (Unit!7032) )
))
(declare-datatypes ((tuple2!9434 0))(
  ( (tuple2!9435 (_1!4979 Unit!7031) (_2!4979 BitStream!4184)) )
))
(declare-fun lt!173907 () tuple2!9434)

(declare-datatypes ((tuple2!9436 0))(
  ( (tuple2!9437 (_1!4980 BitStream!4184) (_2!4980 Bool)) )
))
(declare-fun lt!173908 () tuple2!9436)

(assert (=> b!114346 (= res!94478 (and (= (_2!4980 lt!173908) lt!173909) (= (_1!4980 lt!173908) (_2!4979 lt!173907))))))

(declare-fun readBitPure!0 (BitStream!4184) tuple2!9436)

(declare-fun readerFrom!0 (BitStream!4184 (_ BitVec 32) (_ BitVec 32)) BitStream!4184)

(assert (=> b!114346 (= lt!173908 (readBitPure!0 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305))))))

(declare-fun b!114347 () Bool)

(declare-fun lt!173904 () tuple2!9434)

(declare-fun e!74980 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5187 array!5187 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!114347 (= e!74980 (arrayBitRangesEq!0 (buf!2763 (_2!4979 lt!173907)) (buf!2763 (_2!4979 lt!173904)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305)))))))

(declare-fun b!114348 () Bool)

(declare-fun e!74978 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!114348 (= e!74978 (invariant!0 (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305) (size!2355 (buf!2763 (_2!4979 lt!173907)))))))

(declare-fun b!114349 () Bool)

(declare-fun res!94473 () Bool)

(assert (=> b!114349 (=> res!94473 e!74980)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!114349 (= res!94473 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!173907)))) ((_ sign_extend 32) (currentByte!5370 thiss!1305)) ((_ sign_extend 32) (currentBit!5365 thiss!1305)))))))

(declare-fun b!114350 () Bool)

(declare-fun res!94479 () Bool)

(assert (=> b!114350 (=> (not res!94479) (not e!74981))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!114350 (= res!94479 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!94474 () Bool)

(assert (=> start!22624 (=> (not res!94474) (not e!74981))))

(assert (=> start!22624 (= res!94474 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22624 e!74981))

(assert (=> start!22624 true))

(declare-fun e!74979 () Bool)

(declare-fun inv!12 (BitStream!4184) Bool)

(assert (=> start!22624 (and (inv!12 thiss!1305) e!74979)))

(declare-fun b!114351 () Bool)

(declare-fun e!74985 () Bool)

(assert (=> b!114351 (= e!74985 e!74984)))

(declare-fun res!94477 () Bool)

(assert (=> b!114351 (=> (not res!94477) (not e!74984))))

(declare-fun lt!173906 () (_ BitVec 64))

(declare-fun lt!173903 () (_ BitVec 64))

(assert (=> b!114351 (= res!94477 (= lt!173906 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!173903)))))

(assert (=> b!114351 (= lt!173906 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))))))

(assert (=> b!114351 (= lt!173903 (bitIndex!0 (size!2355 (buf!2763 thiss!1305)) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305)))))

(declare-fun b!114352 () Bool)

(assert (=> b!114352 (= e!74981 (not e!74980))))

(declare-fun res!94481 () Bool)

(assert (=> b!114352 (=> res!94481 e!74980)))

(assert (=> b!114352 (= res!94481 (not (= (size!2355 (buf!2763 (_2!4979 lt!173907))) (size!2355 (buf!2763 (_2!4979 lt!173904))))))))

(assert (=> b!114352 e!74978))

(declare-fun res!94476 () Bool)

(assert (=> b!114352 (=> (not res!94476) (not e!74978))))

(declare-fun isPrefixOf!0 (BitStream!4184 BitStream!4184) Bool)

(assert (=> b!114352 (= res!94476 (isPrefixOf!0 thiss!1305 (_2!4979 lt!173904)))))

(declare-fun lt!173905 () Unit!7031)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4184 BitStream!4184 BitStream!4184) Unit!7031)

(assert (=> b!114352 (= lt!173905 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4979 lt!173907) (_2!4979 lt!173904)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4184 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9434)

(assert (=> b!114352 (= lt!173904 (appendNLeastSignificantBitsLoop!0 (_2!4979 lt!173907) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!114352 e!74985))

(declare-fun res!94475 () Bool)

(assert (=> b!114352 (=> (not res!94475) (not e!74985))))

(assert (=> b!114352 (= res!94475 (= (size!2355 (buf!2763 thiss!1305)) (size!2355 (buf!2763 (_2!4979 lt!173907)))))))

(declare-fun appendBit!0 (BitStream!4184 Bool) tuple2!9434)

(assert (=> b!114352 (= lt!173907 (appendBit!0 thiss!1305 lt!173909))))

(assert (=> b!114352 (= lt!173909 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!114353 () Bool)

(assert (=> b!114353 (= e!74983 (= (bitIndex!0 (size!2355 (buf!2763 (_1!4980 lt!173908))) (currentByte!5370 (_1!4980 lt!173908)) (currentBit!5365 (_1!4980 lt!173908))) lt!173906))))

(declare-fun b!114354 () Bool)

(declare-fun res!94472 () Bool)

(assert (=> b!114354 (=> (not res!94472) (not e!74984))))

(assert (=> b!114354 (= res!94472 (isPrefixOf!0 thiss!1305 (_2!4979 lt!173907)))))

(declare-fun b!114355 () Bool)

(declare-fun array_inv!2157 (array!5187) Bool)

(assert (=> b!114355 (= e!74979 (array_inv!2157 (buf!2763 thiss!1305)))))

(assert (= (and start!22624 res!94474) b!114345))

(assert (= (and b!114345 res!94471) b!114350))

(assert (= (and b!114350 res!94479) b!114344))

(assert (= (and b!114344 res!94480) b!114352))

(assert (= (and b!114352 res!94475) b!114351))

(assert (= (and b!114351 res!94477) b!114354))

(assert (= (and b!114354 res!94472) b!114346))

(assert (= (and b!114346 res!94478) b!114353))

(assert (= (and b!114352 res!94476) b!114348))

(assert (= (and b!114352 (not res!94481)) b!114349))

(assert (= (and b!114349 (not res!94473)) b!114347))

(assert (= start!22624 b!114355))

(declare-fun m!170719 () Bool)

(assert (=> b!114351 m!170719))

(declare-fun m!170721 () Bool)

(assert (=> b!114351 m!170721))

(declare-fun m!170723 () Bool)

(assert (=> b!114348 m!170723))

(declare-fun m!170725 () Bool)

(assert (=> b!114346 m!170725))

(assert (=> b!114346 m!170725))

(declare-fun m!170727 () Bool)

(assert (=> b!114346 m!170727))

(declare-fun m!170729 () Bool)

(assert (=> b!114355 m!170729))

(declare-fun m!170731 () Bool)

(assert (=> start!22624 m!170731))

(declare-fun m!170733 () Bool)

(assert (=> b!114352 m!170733))

(declare-fun m!170735 () Bool)

(assert (=> b!114352 m!170735))

(declare-fun m!170737 () Bool)

(assert (=> b!114352 m!170737))

(declare-fun m!170739 () Bool)

(assert (=> b!114352 m!170739))

(declare-fun m!170741 () Bool)

(assert (=> b!114353 m!170741))

(declare-fun m!170743 () Bool)

(assert (=> b!114354 m!170743))

(declare-fun m!170745 () Bool)

(assert (=> b!114350 m!170745))

(declare-fun m!170747 () Bool)

(assert (=> b!114347 m!170747))

(declare-fun m!170749 () Bool)

(assert (=> b!114347 m!170749))

(declare-fun m!170751 () Bool)

(assert (=> b!114345 m!170751))

(declare-fun m!170753 () Bool)

(assert (=> b!114349 m!170753))

(push 1)

(assert (not b!114352))

(assert (not b!114354))

(assert (not b!114355))

(assert (not b!114346))

(assert (not b!114349))

(assert (not start!22624))

(assert (not b!114351))

(assert (not b!114347))

(assert (not b!114353))

(assert (not b!114345))

(assert (not b!114350))

(assert (not b!114348))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!36726 () Bool)

(assert (=> d!36726 (= (invariant!0 (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305) (size!2355 (buf!2763 (_2!4979 lt!173907)))) (and (bvsge (currentBit!5365 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5365 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5370 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5370 thiss!1305) (size!2355 (buf!2763 (_2!4979 lt!173907)))) (and (= (currentBit!5365 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5370 thiss!1305) (size!2355 (buf!2763 (_2!4979 lt!173907))))))))))

(assert (=> b!114348 d!36726))

(declare-fun d!36730 () Bool)

(assert (=> d!36730 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305) (size!2355 (buf!2763 thiss!1305))))))

(declare-fun bs!8913 () Bool)

(assert (= bs!8913 d!36730))

(declare-fun m!170813 () Bool)

(assert (=> bs!8913 m!170813))

(assert (=> start!22624 d!36730))

(declare-fun b!114436 () Bool)

(declare-datatypes ((tuple4!86 0))(
  ( (tuple4!87 (_1!4988 (_ BitVec 32)) (_2!4988 (_ BitVec 32)) (_3!264 (_ BitVec 32)) (_4!43 (_ BitVec 32))) )
))
(declare-fun lt!173988 () tuple4!86)

(declare-fun e!75049 () Bool)

(declare-fun arrayRangesEq!44 (array!5187 array!5187 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!114436 (= e!75049 (arrayRangesEq!44 (buf!2763 (_2!4979 lt!173907)) (buf!2763 (_2!4979 lt!173904)) (_1!4988 lt!173988) (_2!4988 lt!173988)))))

(declare-fun b!114438 () Bool)

(declare-fun e!75048 () Bool)

(declare-fun lt!173989 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!114438 (= e!75048 (byteRangesEq!0 (select (arr!2948 (buf!2763 (_2!4979 lt!173907))) (_4!43 lt!173988)) (select (arr!2948 (buf!2763 (_2!4979 lt!173904))) (_4!43 lt!173988)) #b00000000000000000000000000000000 lt!173989))))

(declare-fun b!114439 () Bool)

(declare-fun e!75045 () Bool)

(declare-fun e!75044 () Bool)

(assert (=> b!114439 (= e!75045 e!75044)))

(declare-fun res!94557 () Bool)

(declare-fun call!1472 () Bool)

(assert (=> b!114439 (= res!94557 call!1472)))

(assert (=> b!114439 (=> (not res!94557) (not e!75044))))

(declare-fun b!114440 () Bool)

(declare-fun res!94554 () Bool)

(assert (=> b!114440 (= res!94554 (= lt!173989 #b00000000000000000000000000000000))))

(assert (=> b!114440 (=> res!94554 e!75048)))

(assert (=> b!114440 (= e!75044 e!75048)))

(declare-fun b!114441 () Bool)

(declare-fun e!75046 () Bool)

(assert (=> b!114441 (= e!75046 e!75045)))

(declare-fun c!6931 () Bool)

(assert (=> b!114441 (= c!6931 (= (_3!264 lt!173988) (_4!43 lt!173988)))))

(declare-fun d!36732 () Bool)

(declare-fun res!94556 () Bool)

(declare-fun e!75047 () Bool)

(assert (=> d!36732 (=> res!94556 e!75047)))

(assert (=> d!36732 (= res!94556 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305)))))))

(assert (=> d!36732 (= (arrayBitRangesEq!0 (buf!2763 (_2!4979 lt!173907)) (buf!2763 (_2!4979 lt!173904)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305)))) e!75047)))

(declare-fun b!114437 () Bool)

(assert (=> b!114437 (= e!75047 e!75046)))

(declare-fun res!94555 () Bool)

(assert (=> b!114437 (=> (not res!94555) (not e!75046))))

(assert (=> b!114437 (= res!94555 e!75049)))

(declare-fun res!94553 () Bool)

(assert (=> b!114437 (=> res!94553 e!75049)))

(assert (=> b!114437 (= res!94553 (bvsge (_1!4988 lt!173988) (_2!4988 lt!173988)))))

(assert (=> b!114437 (= lt!173989 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!173990 () (_ BitVec 32))

(assert (=> b!114437 (= lt!173990 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!86)

(assert (=> b!114437 (= lt!173988 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305)))))))

(declare-fun bm!1469 () Bool)

(assert (=> bm!1469 (= call!1472 (byteRangesEq!0 (select (arr!2948 (buf!2763 (_2!4979 lt!173907))) (_3!264 lt!173988)) (select (arr!2948 (buf!2763 (_2!4979 lt!173904))) (_3!264 lt!173988)) lt!173990 (ite c!6931 lt!173989 #b00000000000000000000000000001000)))))

(declare-fun b!114442 () Bool)

(assert (=> b!114442 (= e!75045 call!1472)))

(assert (= (and d!36732 (not res!94556)) b!114437))

(assert (= (and b!114437 (not res!94553)) b!114436))

(assert (= (and b!114437 res!94555) b!114441))

(assert (= (and b!114441 c!6931) b!114442))

(assert (= (and b!114441 (not c!6931)) b!114439))

(assert (= (and b!114439 res!94557) b!114440))

(assert (= (and b!114440 (not res!94554)) b!114438))

(assert (= (or b!114442 b!114439) bm!1469))

(declare-fun m!170815 () Bool)

(assert (=> b!114436 m!170815))

(declare-fun m!170817 () Bool)

(assert (=> b!114438 m!170817))

(declare-fun m!170819 () Bool)

(assert (=> b!114438 m!170819))

(assert (=> b!114438 m!170817))

(assert (=> b!114438 m!170819))

(declare-fun m!170821 () Bool)

(assert (=> b!114438 m!170821))

(declare-fun m!170823 () Bool)

(assert (=> b!114437 m!170823))

(declare-fun m!170825 () Bool)

(assert (=> bm!1469 m!170825))

(declare-fun m!170827 () Bool)

(assert (=> bm!1469 m!170827))

(assert (=> bm!1469 m!170825))

(assert (=> bm!1469 m!170827))

(declare-fun m!170829 () Bool)

(assert (=> bm!1469 m!170829))

(assert (=> b!114347 d!36732))

(declare-fun d!36734 () Bool)

(declare-fun e!75052 () Bool)

(assert (=> d!36734 e!75052))

(declare-fun res!94562 () Bool)

(assert (=> d!36734 (=> (not res!94562) (not e!75052))))

(declare-fun lt!174003 () (_ BitVec 64))

(declare-fun lt!174005 () (_ BitVec 64))

(declare-fun lt!174004 () (_ BitVec 64))

(assert (=> d!36734 (= res!94562 (= lt!174004 (bvsub lt!174003 lt!174005)))))

(assert (=> d!36734 (or (= (bvand lt!174003 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174005 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174003 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174003 lt!174005) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!36734 (= lt!174005 (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!173907)))) ((_ sign_extend 32) (currentByte!5370 thiss!1305)) ((_ sign_extend 32) (currentBit!5365 thiss!1305))))))

(declare-fun lt!174007 () (_ BitVec 64))

(declare-fun lt!174006 () (_ BitVec 64))

(assert (=> d!36734 (= lt!174003 (bvmul lt!174007 lt!174006))))

(assert (=> d!36734 (or (= lt!174007 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!174006 (bvsdiv (bvmul lt!174007 lt!174006) lt!174007)))))

(assert (=> d!36734 (= lt!174006 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36734 (= lt!174007 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!173907)))))))

(assert (=> d!36734 (= lt!174004 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5370 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5365 thiss!1305))))))

(assert (=> d!36734 (invariant!0 (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305) (size!2355 (buf!2763 (_2!4979 lt!173907))))))

(assert (=> d!36734 (= (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305)) lt!174004)))

(declare-fun b!114447 () Bool)

(declare-fun res!94563 () Bool)

(assert (=> b!114447 (=> (not res!94563) (not e!75052))))

(assert (=> b!114447 (= res!94563 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!174004))))

(declare-fun b!114448 () Bool)

(declare-fun lt!174008 () (_ BitVec 64))

(assert (=> b!114448 (= e!75052 (bvsle lt!174004 (bvmul lt!174008 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114448 (or (= lt!174008 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!174008 #b0000000000000000000000000000000000000000000000000000000000001000) lt!174008)))))

(assert (=> b!114448 (= lt!174008 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!173907)))))))

(assert (= (and d!36734 res!94562) b!114447))

(assert (= (and b!114447 res!94563) b!114448))

(declare-fun m!170831 () Bool)

(assert (=> d!36734 m!170831))

(assert (=> d!36734 m!170723))

(assert (=> b!114347 d!36734))

(declare-fun d!36736 () Bool)

(declare-datatypes ((tuple2!9450 0))(
  ( (tuple2!9451 (_1!4990 Bool) (_2!4990 BitStream!4184)) )
))
(declare-fun lt!174011 () tuple2!9450)

(declare-fun readBit!0 (BitStream!4184) tuple2!9450)

(assert (=> d!36736 (= lt!174011 (readBit!0 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305))))))

(assert (=> d!36736 (= (readBitPure!0 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305))) (tuple2!9437 (_2!4990 lt!174011) (_1!4990 lt!174011)))))

(declare-fun bs!8914 () Bool)

(assert (= bs!8914 d!36736))

(assert (=> bs!8914 m!170725))

(declare-fun m!170833 () Bool)

(assert (=> bs!8914 m!170833))

(assert (=> b!114346 d!36736))

(declare-fun d!36738 () Bool)

(declare-fun e!75055 () Bool)

(assert (=> d!36738 e!75055))

(declare-fun res!94567 () Bool)

(assert (=> d!36738 (=> (not res!94567) (not e!75055))))

(assert (=> d!36738 (= res!94567 (invariant!0 (currentBit!5365 (_2!4979 lt!173907)) (currentByte!5370 (_2!4979 lt!173907)) (size!2355 (buf!2763 (_2!4979 lt!173907)))))))

(assert (=> d!36738 (= (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305)) (BitStream!4185 (buf!2763 (_2!4979 lt!173907)) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305)))))

(declare-fun b!114451 () Bool)

(assert (=> b!114451 (= e!75055 (invariant!0 (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305) (size!2355 (buf!2763 (_2!4979 lt!173907)))))))

(assert (= (and d!36738 res!94567) b!114451))

(declare-fun m!170835 () Bool)

(assert (=> d!36738 m!170835))

(assert (=> b!114451 m!170723))

(assert (=> b!114346 d!36738))

(declare-fun d!36740 () Bool)

(assert (=> d!36740 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2355 (buf!2763 thiss!1305))) ((_ sign_extend 32) (currentByte!5370 thiss!1305)) ((_ sign_extend 32) (currentBit!5365 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 thiss!1305))) ((_ sign_extend 32) (currentByte!5370 thiss!1305)) ((_ sign_extend 32) (currentBit!5365 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8915 () Bool)

(assert (= bs!8915 d!36740))

(declare-fun m!170837 () Bool)

(assert (=> bs!8915 m!170837))

(assert (=> b!114345 d!36740))

(declare-fun d!36742 () Bool)

(assert (=> d!36742 (= (array_inv!2157 (buf!2763 thiss!1305)) (bvsge (size!2355 (buf!2763 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!114355 d!36742))

(declare-fun d!36744 () Bool)

(declare-fun res!94575 () Bool)

(declare-fun e!75061 () Bool)

(assert (=> d!36744 (=> (not res!94575) (not e!75061))))

(assert (=> d!36744 (= res!94575 (= (size!2355 (buf!2763 thiss!1305)) (size!2355 (buf!2763 (_2!4979 lt!173907)))))))

(assert (=> d!36744 (= (isPrefixOf!0 thiss!1305 (_2!4979 lt!173907)) e!75061)))

(declare-fun b!114458 () Bool)

(declare-fun res!94574 () Bool)

(assert (=> b!114458 (=> (not res!94574) (not e!75061))))

(assert (=> b!114458 (= res!94574 (bvsle (bitIndex!0 (size!2355 (buf!2763 thiss!1305)) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305)) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907)))))))

(declare-fun b!114459 () Bool)

(declare-fun e!75060 () Bool)

(assert (=> b!114459 (= e!75061 e!75060)))

(declare-fun res!94576 () Bool)

(assert (=> b!114459 (=> res!94576 e!75060)))

(assert (=> b!114459 (= res!94576 (= (size!2355 (buf!2763 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!114460 () Bool)

(assert (=> b!114460 (= e!75060 (arrayBitRangesEq!0 (buf!2763 thiss!1305) (buf!2763 (_2!4979 lt!173907)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2355 (buf!2763 thiss!1305)) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305))))))

(assert (= (and d!36744 res!94575) b!114458))

(assert (= (and b!114458 res!94574) b!114459))

(assert (= (and b!114459 (not res!94576)) b!114460))

(assert (=> b!114458 m!170721))

(assert (=> b!114458 m!170719))

(assert (=> b!114460 m!170721))

(assert (=> b!114460 m!170721))

(declare-fun m!170839 () Bool)

(assert (=> b!114460 m!170839))

(assert (=> b!114354 d!36744))

(declare-fun d!36746 () Bool)

(declare-fun e!75062 () Bool)

(assert (=> d!36746 e!75062))

(declare-fun res!94577 () Bool)

(assert (=> d!36746 (=> (not res!94577) (not e!75062))))

(declare-fun lt!174012 () (_ BitVec 64))

(declare-fun lt!174013 () (_ BitVec 64))

(declare-fun lt!174014 () (_ BitVec 64))

(assert (=> d!36746 (= res!94577 (= lt!174013 (bvsub lt!174012 lt!174014)))))

(assert (=> d!36746 (or (= (bvand lt!174012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174014 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174012 lt!174014) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36746 (= lt!174014 (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_1!4980 lt!173908)))) ((_ sign_extend 32) (currentByte!5370 (_1!4980 lt!173908))) ((_ sign_extend 32) (currentBit!5365 (_1!4980 lt!173908)))))))

(declare-fun lt!174016 () (_ BitVec 64))

(declare-fun lt!174015 () (_ BitVec 64))

(assert (=> d!36746 (= lt!174012 (bvmul lt!174016 lt!174015))))

(assert (=> d!36746 (or (= lt!174016 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!174015 (bvsdiv (bvmul lt!174016 lt!174015) lt!174016)))))

(assert (=> d!36746 (= lt!174015 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36746 (= lt!174016 ((_ sign_extend 32) (size!2355 (buf!2763 (_1!4980 lt!173908)))))))

(assert (=> d!36746 (= lt!174013 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5370 (_1!4980 lt!173908))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5365 (_1!4980 lt!173908)))))))

(assert (=> d!36746 (invariant!0 (currentBit!5365 (_1!4980 lt!173908)) (currentByte!5370 (_1!4980 lt!173908)) (size!2355 (buf!2763 (_1!4980 lt!173908))))))

(assert (=> d!36746 (= (bitIndex!0 (size!2355 (buf!2763 (_1!4980 lt!173908))) (currentByte!5370 (_1!4980 lt!173908)) (currentBit!5365 (_1!4980 lt!173908))) lt!174013)))

(declare-fun b!114461 () Bool)

(declare-fun res!94578 () Bool)

(assert (=> b!114461 (=> (not res!94578) (not e!75062))))

(assert (=> b!114461 (= res!94578 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!174013))))

(declare-fun b!114462 () Bool)

(declare-fun lt!174017 () (_ BitVec 64))

(assert (=> b!114462 (= e!75062 (bvsle lt!174013 (bvmul lt!174017 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114462 (or (= lt!174017 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!174017 #b0000000000000000000000000000000000000000000000000000000000001000) lt!174017)))))

(assert (=> b!114462 (= lt!174017 ((_ sign_extend 32) (size!2355 (buf!2763 (_1!4980 lt!173908)))))))

(assert (= (and d!36746 res!94577) b!114461))

(assert (= (and b!114461 res!94578) b!114462))

(declare-fun m!170841 () Bool)

(assert (=> d!36746 m!170841))

(declare-fun m!170843 () Bool)

(assert (=> d!36746 m!170843))

(assert (=> b!114353 d!36746))

(declare-fun d!36748 () Bool)

(declare-fun res!94580 () Bool)

(declare-fun e!75064 () Bool)

(assert (=> d!36748 (=> (not res!94580) (not e!75064))))

(assert (=> d!36748 (= res!94580 (= (size!2355 (buf!2763 thiss!1305)) (size!2355 (buf!2763 (_2!4979 lt!173904)))))))

(assert (=> d!36748 (= (isPrefixOf!0 thiss!1305 (_2!4979 lt!173904)) e!75064)))

(declare-fun b!114463 () Bool)

(declare-fun res!94579 () Bool)

(assert (=> b!114463 (=> (not res!94579) (not e!75064))))

(assert (=> b!114463 (= res!94579 (bvsle (bitIndex!0 (size!2355 (buf!2763 thiss!1305)) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305)) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173904))) (currentByte!5370 (_2!4979 lt!173904)) (currentBit!5365 (_2!4979 lt!173904)))))))

(declare-fun b!114464 () Bool)

(declare-fun e!75063 () Bool)

(assert (=> b!114464 (= e!75064 e!75063)))

(declare-fun res!94581 () Bool)

(assert (=> b!114464 (=> res!94581 e!75063)))

(assert (=> b!114464 (= res!94581 (= (size!2355 (buf!2763 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!114465 () Bool)

(assert (=> b!114465 (= e!75063 (arrayBitRangesEq!0 (buf!2763 thiss!1305) (buf!2763 (_2!4979 lt!173904)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2355 (buf!2763 thiss!1305)) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305))))))

(assert (= (and d!36748 res!94580) b!114463))

(assert (= (and b!114463 res!94579) b!114464))

(assert (= (and b!114464 (not res!94581)) b!114465))

(assert (=> b!114463 m!170721))

(declare-fun m!170845 () Bool)

(assert (=> b!114463 m!170845))

(assert (=> b!114465 m!170721))

(assert (=> b!114465 m!170721))

(declare-fun m!170847 () Bool)

(assert (=> b!114465 m!170847))

(assert (=> b!114352 d!36748))

(declare-fun d!36750 () Bool)

(assert (=> d!36750 (isPrefixOf!0 thiss!1305 (_2!4979 lt!173904))))

(declare-fun lt!174020 () Unit!7031)

(declare-fun choose!30 (BitStream!4184 BitStream!4184 BitStream!4184) Unit!7031)

(assert (=> d!36750 (= lt!174020 (choose!30 thiss!1305 (_2!4979 lt!173907) (_2!4979 lt!173904)))))

(assert (=> d!36750 (isPrefixOf!0 thiss!1305 (_2!4979 lt!173907))))

(assert (=> d!36750 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4979 lt!173907) (_2!4979 lt!173904)) lt!174020)))

(declare-fun bs!8916 () Bool)

(assert (= bs!8916 d!36750))

(assert (=> bs!8916 m!170733))

(declare-fun m!170849 () Bool)

(assert (=> bs!8916 m!170849))

(assert (=> bs!8916 m!170743))

(assert (=> b!114352 d!36750))

(declare-datatypes ((tuple2!9452 0))(
  ( (tuple2!9453 (_1!4991 BitStream!4184) (_2!4991 (_ BitVec 64))) )
))
(declare-fun lt!174449 () tuple2!9452)

(declare-fun e!75162 () Bool)

(declare-fun b!114626 () Bool)

(declare-datatypes ((tuple2!9454 0))(
  ( (tuple2!9455 (_1!4992 BitStream!4184) (_2!4992 BitStream!4184)) )
))
(declare-fun lt!174464 () tuple2!9454)

(assert (=> b!114626 (= e!75162 (and (= (_2!4991 lt!174449) v!199) (= (_1!4991 lt!174449) (_2!4992 lt!174464))))))

(declare-fun lt!174458 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9452)

(assert (=> b!114626 (= lt!174449 (readNLeastSignificantBitsLoopPure!0 (_1!4992 lt!174464) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174458))))

(declare-fun lt!174441 () Unit!7031)

(declare-fun lt!174444 () Unit!7031)

(assert (=> b!114626 (= lt!174441 lt!174444)))

(declare-fun lt!174474 () tuple2!9434)

(declare-fun lt!174461 () (_ BitVec 64))

(assert (=> b!114626 (validate_offset_bits!1 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174474)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!173907))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!173907))) lt!174461)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4184 array!5187 (_ BitVec 64)) Unit!7031)

(assert (=> b!114626 (= lt!174444 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4979 lt!173907) (buf!2763 (_2!4979 lt!174474)) lt!174461))))

(declare-fun e!75160 () Bool)

(assert (=> b!114626 e!75160))

(declare-fun res!94705 () Bool)

(assert (=> b!114626 (=> (not res!94705) (not e!75160))))

(assert (=> b!114626 (= res!94705 (and (= (size!2355 (buf!2763 (_2!4979 lt!173907))) (size!2355 (buf!2763 (_2!4979 lt!174474)))) (bvsge lt!174461 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114626 (= lt!174461 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!114626 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!114626 (= lt!174458 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!114626 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!4184 BitStream!4184) tuple2!9454)

(assert (=> b!114626 (= lt!174464 (reader!0 (_2!4979 lt!173907) (_2!4979 lt!174474)))))

(declare-fun b!114627 () Bool)

(declare-fun e!75157 () Bool)

(declare-fun lt!174455 () tuple2!9436)

(declare-fun lt!174477 () tuple2!9434)

(assert (=> b!114627 (= e!75157 (= (bitIndex!0 (size!2355 (buf!2763 (_1!4980 lt!174455))) (currentByte!5370 (_1!4980 lt!174455)) (currentBit!5365 (_1!4980 lt!174455))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174477))) (currentByte!5370 (_2!4979 lt!174477)) (currentBit!5365 (_2!4979 lt!174477)))))))

(declare-fun b!114628 () Bool)

(declare-fun e!75158 () (_ BitVec 64))

(assert (=> b!114628 (= e!75158 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun d!36752 () Bool)

(assert (=> d!36752 e!75162))

(declare-fun res!94703 () Bool)

(assert (=> d!36752 (=> (not res!94703) (not e!75162))))

(assert (=> d!36752 (= res!94703 (= (size!2355 (buf!2763 (_2!4979 lt!173907))) (size!2355 (buf!2763 (_2!4979 lt!174474)))))))

(declare-fun e!75159 () tuple2!9434)

(assert (=> d!36752 (= lt!174474 e!75159)))

(declare-fun c!6952 () Bool)

(assert (=> d!36752 (= c!6952 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!36752 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!36752 (= (appendNLeastSignificantBitsLoop!0 (_2!4979 lt!173907) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!174474)))

(declare-fun b!114629 () Bool)

(declare-fun res!94708 () Bool)

(assert (=> b!114629 (= res!94708 (= (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174477))) (currentByte!5370 (_2!4979 lt!174477)) (currentBit!5365 (_2!4979 lt!174477))) (bvadd (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!75161 () Bool)

(assert (=> b!114629 (=> (not res!94708) (not e!75161))))

(declare-fun b!114630 () Bool)

(assert (=> b!114630 (= lt!174455 (readBitPure!0 (readerFrom!0 (_2!4979 lt!174477) (currentBit!5365 (_2!4979 lt!173907)) (currentByte!5370 (_2!4979 lt!173907)))))))

(declare-fun res!94704 () Bool)

(declare-fun lt!174468 () Bool)

(assert (=> b!114630 (= res!94704 (and (= (_2!4980 lt!174455) lt!174468) (= (_1!4980 lt!174455) (_2!4979 lt!174477))))))

(assert (=> b!114630 (=> (not res!94704) (not e!75157))))

(assert (=> b!114630 (= e!75161 e!75157)))

(declare-fun b!114631 () Bool)

(assert (=> b!114631 (= e!75158 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun lt!174436 () BitStream!4184)

(declare-fun bm!1481 () Bool)

(declare-fun call!1484 () Bool)

(assert (=> bm!1481 (= call!1484 (isPrefixOf!0 (ite c!6952 (_2!4979 lt!173907) lt!174436) (ite c!6952 (_2!4979 lt!174477) lt!174436)))))

(declare-fun b!114632 () Bool)

(declare-fun lt!174475 () Unit!7031)

(assert (=> b!114632 (= e!75159 (tuple2!9435 lt!174475 (_2!4979 lt!173907)))))

(assert (=> b!114632 (= lt!174436 (_2!4979 lt!173907))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4184) Unit!7031)

(assert (=> b!114632 (= lt!174475 (lemmaIsPrefixRefl!0 lt!174436))))

(assert (=> b!114632 call!1484))

(declare-fun b!114633 () Bool)

(declare-fun res!94711 () Bool)

(assert (=> b!114633 (=> (not res!94711) (not e!75162))))

(assert (=> b!114633 (= res!94711 (isPrefixOf!0 (_2!4979 lt!173907) (_2!4979 lt!174474)))))

(declare-fun b!114634 () Bool)

(assert (=> b!114634 (= e!75160 (validate_offset_bits!1 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!173907)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!173907))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!173907))) lt!174461))))

(declare-fun b!114635 () Bool)

(declare-fun res!94709 () Bool)

(assert (=> b!114635 (= res!94709 call!1484)))

(assert (=> b!114635 (=> (not res!94709) (not e!75161))))

(declare-fun b!114636 () Bool)

(declare-fun lt!174452 () tuple2!9434)

(declare-fun Unit!7045 () Unit!7031)

(assert (=> b!114636 (= e!75159 (tuple2!9435 Unit!7045 (_2!4979 lt!174452)))))

(assert (=> b!114636 (= lt!174468 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114636 (= lt!174477 (appendBit!0 (_2!4979 lt!173907) lt!174468))))

(declare-fun res!94706 () Bool)

(assert (=> b!114636 (= res!94706 (= (size!2355 (buf!2763 (_2!4979 lt!173907))) (size!2355 (buf!2763 (_2!4979 lt!174477)))))))

(assert (=> b!114636 (=> (not res!94706) (not e!75161))))

(assert (=> b!114636 e!75161))

(declare-fun lt!174469 () tuple2!9434)

(assert (=> b!114636 (= lt!174469 lt!174477)))

(assert (=> b!114636 (= lt!174452 (appendNLeastSignificantBitsLoop!0 (_2!4979 lt!174469) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!174443 () Unit!7031)

(assert (=> b!114636 (= lt!174443 (lemmaIsPrefixTransitive!0 (_2!4979 lt!173907) (_2!4979 lt!174469) (_2!4979 lt!174452)))))

(assert (=> b!114636 (isPrefixOf!0 (_2!4979 lt!173907) (_2!4979 lt!174452))))

(declare-fun lt!174478 () Unit!7031)

(assert (=> b!114636 (= lt!174478 lt!174443)))

(assert (=> b!114636 (invariant!0 (currentBit!5365 (_2!4979 lt!173907)) (currentByte!5370 (_2!4979 lt!173907)) (size!2355 (buf!2763 (_2!4979 lt!174469))))))

(declare-fun lt!174466 () BitStream!4184)

(assert (=> b!114636 (= lt!174466 (BitStream!4185 (buf!2763 (_2!4979 lt!174469)) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))))))

(assert (=> b!114636 (invariant!0 (currentBit!5365 lt!174466) (currentByte!5370 lt!174466) (size!2355 (buf!2763 (_2!4979 lt!174452))))))

(declare-fun lt!174463 () BitStream!4184)

(assert (=> b!114636 (= lt!174463 (BitStream!4185 (buf!2763 (_2!4979 lt!174452)) (currentByte!5370 lt!174466) (currentBit!5365 lt!174466)))))

(declare-fun lt!174440 () tuple2!9436)

(assert (=> b!114636 (= lt!174440 (readBitPure!0 lt!174466))))

(declare-fun lt!174467 () tuple2!9436)

(assert (=> b!114636 (= lt!174467 (readBitPure!0 lt!174463))))

(declare-fun lt!174465 () Unit!7031)

(declare-fun readBitPrefixLemma!0 (BitStream!4184 BitStream!4184) Unit!7031)

(assert (=> b!114636 (= lt!174465 (readBitPrefixLemma!0 lt!174466 (_2!4979 lt!174452)))))

(declare-fun res!94710 () Bool)

(assert (=> b!114636 (= res!94710 (= (bitIndex!0 (size!2355 (buf!2763 (_1!4980 lt!174440))) (currentByte!5370 (_1!4980 lt!174440)) (currentBit!5365 (_1!4980 lt!174440))) (bitIndex!0 (size!2355 (buf!2763 (_1!4980 lt!174467))) (currentByte!5370 (_1!4980 lt!174467)) (currentBit!5365 (_1!4980 lt!174467)))))))

(declare-fun e!75163 () Bool)

(assert (=> b!114636 (=> (not res!94710) (not e!75163))))

(assert (=> b!114636 e!75163))

(declare-fun lt!174459 () Unit!7031)

(assert (=> b!114636 (= lt!174459 lt!174465)))

(declare-fun lt!174456 () tuple2!9454)

(assert (=> b!114636 (= lt!174456 (reader!0 (_2!4979 lt!173907) (_2!4979 lt!174452)))))

(declare-fun lt!174460 () tuple2!9454)

(assert (=> b!114636 (= lt!174460 (reader!0 (_2!4979 lt!174469) (_2!4979 lt!174452)))))

(declare-fun lt!174471 () tuple2!9436)

(assert (=> b!114636 (= lt!174471 (readBitPure!0 (_1!4992 lt!174456)))))

(assert (=> b!114636 (= (_2!4980 lt!174471) lt!174468)))

(declare-fun lt!174447 () Unit!7031)

(declare-fun Unit!7046 () Unit!7031)

(assert (=> b!114636 (= lt!174447 Unit!7046)))

(declare-fun lt!174437 () (_ BitVec 64))

(assert (=> b!114636 (= lt!174437 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!174472 () (_ BitVec 64))

(assert (=> b!114636 (= lt!174472 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!174446 () Unit!7031)

(assert (=> b!114636 (= lt!174446 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4979 lt!173907) (buf!2763 (_2!4979 lt!174452)) lt!174472))))

(assert (=> b!114636 (validate_offset_bits!1 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174452)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!173907))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!173907))) lt!174472)))

(declare-fun lt!174476 () Unit!7031)

(assert (=> b!114636 (= lt!174476 lt!174446)))

(declare-fun lt!174473 () tuple2!9452)

(assert (=> b!114636 (= lt!174473 (readNLeastSignificantBitsLoopPure!0 (_1!4992 lt!174456) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174437))))

(declare-fun lt!174450 () (_ BitVec 64))

(assert (=> b!114636 (= lt!174450 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!174451 () Unit!7031)

(assert (=> b!114636 (= lt!174451 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4979 lt!174469) (buf!2763 (_2!4979 lt!174452)) lt!174450))))

(assert (=> b!114636 (validate_offset_bits!1 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174452)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!174469))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!174469))) lt!174450)))

(declare-fun lt!174453 () Unit!7031)

(assert (=> b!114636 (= lt!174453 lt!174451)))

(declare-fun lt!174470 () tuple2!9452)

(assert (=> b!114636 (= lt!174470 (readNLeastSignificantBitsLoopPure!0 (_1!4992 lt!174460) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!174437 (ite (_2!4980 lt!174471) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!174454 () tuple2!9452)

(assert (=> b!114636 (= lt!174454 (readNLeastSignificantBitsLoopPure!0 (_1!4992 lt!174456) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174437))))

(declare-fun c!6951 () Bool)

(assert (=> b!114636 (= c!6951 (_2!4980 (readBitPure!0 (_1!4992 lt!174456))))))

(declare-fun lt!174448 () tuple2!9452)

(declare-fun withMovedBitIndex!0 (BitStream!4184 (_ BitVec 64)) BitStream!4184)

(assert (=> b!114636 (= lt!174448 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4992 lt!174456) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!174437 e!75158)))))

(declare-fun lt!174462 () Unit!7031)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7031)

(assert (=> b!114636 (= lt!174462 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4992 lt!174456) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174437))))

(assert (=> b!114636 (and (= (_2!4991 lt!174454) (_2!4991 lt!174448)) (= (_1!4991 lt!174454) (_1!4991 lt!174448)))))

(declare-fun lt!174445 () Unit!7031)

(assert (=> b!114636 (= lt!174445 lt!174462)))

(assert (=> b!114636 (= (_1!4992 lt!174456) (withMovedBitIndex!0 (_2!4992 lt!174456) (bvsub (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174452))) (currentByte!5370 (_2!4979 lt!174452)) (currentBit!5365 (_2!4979 lt!174452))))))))

(declare-fun lt!174457 () Unit!7031)

(declare-fun Unit!7047 () Unit!7031)

(assert (=> b!114636 (= lt!174457 Unit!7047)))

(assert (=> b!114636 (= (_1!4992 lt!174460) (withMovedBitIndex!0 (_2!4992 lt!174460) (bvsub (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174469))) (currentByte!5370 (_2!4979 lt!174469)) (currentBit!5365 (_2!4979 lt!174469))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174452))) (currentByte!5370 (_2!4979 lt!174452)) (currentBit!5365 (_2!4979 lt!174452))))))))

(declare-fun lt!174435 () Unit!7031)

(declare-fun Unit!7048 () Unit!7031)

(assert (=> b!114636 (= lt!174435 Unit!7048)))

(assert (=> b!114636 (= (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))) (bvsub (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174469))) (currentByte!5370 (_2!4979 lt!174469)) (currentBit!5365 (_2!4979 lt!174469))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!174438 () Unit!7031)

(declare-fun Unit!7049 () Unit!7031)

(assert (=> b!114636 (= lt!174438 Unit!7049)))

(assert (=> b!114636 (= (_2!4991 lt!174473) (_2!4991 lt!174470))))

(declare-fun lt!174479 () Unit!7031)

(declare-fun Unit!7050 () Unit!7031)

(assert (=> b!114636 (= lt!174479 Unit!7050)))

(assert (=> b!114636 (= (_1!4991 lt!174473) (_2!4992 lt!174456))))

(declare-fun b!114637 () Bool)

(assert (=> b!114637 (= e!75163 (= (_2!4980 lt!174440) (_2!4980 lt!174467)))))

(declare-fun b!114638 () Bool)

(declare-fun res!94707 () Bool)

(assert (=> b!114638 (=> (not res!94707) (not e!75162))))

(declare-fun lt!174439 () (_ BitVec 64))

(declare-fun lt!174442 () (_ BitVec 64))

(assert (=> b!114638 (= res!94707 (= (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174474))) (currentByte!5370 (_2!4979 lt!174474)) (currentBit!5365 (_2!4979 lt!174474))) (bvadd lt!174442 lt!174439)))))

(assert (=> b!114638 (or (not (= (bvand lt!174442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174439 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!174442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!174442 lt!174439) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114638 (= lt!174439 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!114638 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!114638 (= lt!174442 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))))))

(assert (= (and d!36752 c!6952) b!114636))

(assert (= (and d!36752 (not c!6952)) b!114632))

(assert (= (and b!114636 res!94706) b!114629))

(assert (= (and b!114629 res!94708) b!114635))

(assert (= (and b!114635 res!94709) b!114630))

(assert (= (and b!114630 res!94704) b!114627))

(assert (= (and b!114636 res!94710) b!114637))

(assert (= (and b!114636 c!6951) b!114631))

(assert (= (and b!114636 (not c!6951)) b!114628))

(assert (= (or b!114635 b!114632) bm!1481))

(assert (= (and d!36752 res!94703) b!114638))

(assert (= (and b!114638 res!94707) b!114633))

(assert (= (and b!114633 res!94711) b!114626))

(assert (= (and b!114626 res!94705) b!114634))

(declare-fun m!171065 () Bool)

(assert (=> b!114627 m!171065))

(declare-fun m!171067 () Bool)

(assert (=> b!114627 m!171067))

(assert (=> b!114629 m!171067))

(assert (=> b!114629 m!170719))

(declare-fun m!171069 () Bool)

(assert (=> b!114636 m!171069))

(declare-fun m!171071 () Bool)

(assert (=> b!114636 m!171071))

(declare-fun m!171073 () Bool)

(assert (=> b!114636 m!171073))

(assert (=> b!114636 m!170719))

(declare-fun m!171075 () Bool)

(assert (=> b!114636 m!171075))

(declare-fun m!171077 () Bool)

(assert (=> b!114636 m!171077))

(declare-fun m!171079 () Bool)

(assert (=> b!114636 m!171079))

(declare-fun m!171081 () Bool)

(assert (=> b!114636 m!171081))

(declare-fun m!171083 () Bool)

(assert (=> b!114636 m!171083))

(declare-fun m!171085 () Bool)

(assert (=> b!114636 m!171085))

(declare-fun m!171087 () Bool)

(assert (=> b!114636 m!171087))

(declare-fun m!171089 () Bool)

(assert (=> b!114636 m!171089))

(assert (=> b!114636 m!171079))

(declare-fun m!171091 () Bool)

(assert (=> b!114636 m!171091))

(declare-fun m!171093 () Bool)

(assert (=> b!114636 m!171093))

(declare-fun m!171095 () Bool)

(assert (=> b!114636 m!171095))

(declare-fun m!171097 () Bool)

(assert (=> b!114636 m!171097))

(declare-fun m!171099 () Bool)

(assert (=> b!114636 m!171099))

(declare-fun m!171101 () Bool)

(assert (=> b!114636 m!171101))

(declare-fun m!171103 () Bool)

(assert (=> b!114636 m!171103))

(declare-fun m!171105 () Bool)

(assert (=> b!114636 m!171105))

(declare-fun m!171107 () Bool)

(assert (=> b!114636 m!171107))

(declare-fun m!171109 () Bool)

(assert (=> b!114636 m!171109))

(declare-fun m!171111 () Bool)

(assert (=> b!114636 m!171111))

(declare-fun m!171113 () Bool)

(assert (=> b!114636 m!171113))

(declare-fun m!171115 () Bool)

(assert (=> b!114636 m!171115))

(declare-fun m!171117 () Bool)

(assert (=> b!114636 m!171117))

(declare-fun m!171119 () Bool)

(assert (=> b!114636 m!171119))

(declare-fun m!171121 () Bool)

(assert (=> b!114636 m!171121))

(declare-fun m!171123 () Bool)

(assert (=> b!114636 m!171123))

(declare-fun m!171125 () Bool)

(assert (=> b!114633 m!171125))

(declare-fun m!171127 () Bool)

(assert (=> b!114630 m!171127))

(assert (=> b!114630 m!171127))

(declare-fun m!171129 () Bool)

(assert (=> b!114630 m!171129))

(declare-fun m!171131 () Bool)

(assert (=> b!114638 m!171131))

(assert (=> b!114638 m!170719))

(declare-fun m!171133 () Bool)

(assert (=> b!114634 m!171133))

(declare-fun m!171135 () Bool)

(assert (=> bm!1481 m!171135))

(declare-fun m!171137 () Bool)

(assert (=> b!114632 m!171137))

(declare-fun m!171139 () Bool)

(assert (=> b!114626 m!171139))

(declare-fun m!171141 () Bool)

(assert (=> b!114626 m!171141))

(declare-fun m!171143 () Bool)

(assert (=> b!114626 m!171143))

(declare-fun m!171145 () Bool)

(assert (=> b!114626 m!171145))

(assert (=> b!114626 m!171123))

(assert (=> b!114352 d!36752))

(declare-fun b!114649 () Bool)

(declare-fun res!94721 () Bool)

(declare-fun e!75168 () Bool)

(assert (=> b!114649 (=> (not res!94721) (not e!75168))))

(declare-fun lt!174491 () tuple2!9434)

(assert (=> b!114649 (= res!94721 (isPrefixOf!0 thiss!1305 (_2!4979 lt!174491)))))

(declare-fun d!36774 () Bool)

(assert (=> d!36774 e!75168))

(declare-fun res!94722 () Bool)

(assert (=> d!36774 (=> (not res!94722) (not e!75168))))

(assert (=> d!36774 (= res!94722 (= (size!2355 (buf!2763 thiss!1305)) (size!2355 (buf!2763 (_2!4979 lt!174491)))))))

(declare-fun choose!16 (BitStream!4184 Bool) tuple2!9434)

(assert (=> d!36774 (= lt!174491 (choose!16 thiss!1305 lt!173909))))

(assert (=> d!36774 (validate_offset_bit!0 ((_ sign_extend 32) (size!2355 (buf!2763 thiss!1305))) ((_ sign_extend 32) (currentByte!5370 thiss!1305)) ((_ sign_extend 32) (currentBit!5365 thiss!1305)))))

(assert (=> d!36774 (= (appendBit!0 thiss!1305 lt!173909) lt!174491)))

(declare-fun b!114650 () Bool)

(declare-fun e!75169 () Bool)

(assert (=> b!114650 (= e!75168 e!75169)))

(declare-fun res!94720 () Bool)

(assert (=> b!114650 (=> (not res!94720) (not e!75169))))

(declare-fun lt!174490 () tuple2!9436)

(assert (=> b!114650 (= res!94720 (and (= (_2!4980 lt!174490) lt!173909) (= (_1!4980 lt!174490) (_2!4979 lt!174491))))))

(assert (=> b!114650 (= lt!174490 (readBitPure!0 (readerFrom!0 (_2!4979 lt!174491) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305))))))

(declare-fun b!114648 () Bool)

(declare-fun res!94723 () Bool)

(assert (=> b!114648 (=> (not res!94723) (not e!75168))))

(declare-fun lt!174489 () (_ BitVec 64))

(declare-fun lt!174488 () (_ BitVec 64))

(assert (=> b!114648 (= res!94723 (= (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174491))) (currentByte!5370 (_2!4979 lt!174491)) (currentBit!5365 (_2!4979 lt!174491))) (bvadd lt!174489 lt!174488)))))

(assert (=> b!114648 (or (not (= (bvand lt!174489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174488 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!174489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!174489 lt!174488) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114648 (= lt!174488 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!114648 (= lt!174489 (bitIndex!0 (size!2355 (buf!2763 thiss!1305)) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305)))))

(declare-fun b!114651 () Bool)

(assert (=> b!114651 (= e!75169 (= (bitIndex!0 (size!2355 (buf!2763 (_1!4980 lt!174490))) (currentByte!5370 (_1!4980 lt!174490)) (currentBit!5365 (_1!4980 lt!174490))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174491))) (currentByte!5370 (_2!4979 lt!174491)) (currentBit!5365 (_2!4979 lt!174491)))))))

(assert (= (and d!36774 res!94722) b!114648))

(assert (= (and b!114648 res!94723) b!114649))

(assert (= (and b!114649 res!94721) b!114650))

(assert (= (and b!114650 res!94720) b!114651))

(declare-fun m!171147 () Bool)

(assert (=> b!114648 m!171147))

(assert (=> b!114648 m!170721))

(declare-fun m!171149 () Bool)

(assert (=> b!114650 m!171149))

(assert (=> b!114650 m!171149))

(declare-fun m!171151 () Bool)

(assert (=> b!114650 m!171151))

(declare-fun m!171153 () Bool)

(assert (=> b!114649 m!171153))

(declare-fun m!171155 () Bool)

(assert (=> b!114651 m!171155))

(assert (=> b!114651 m!171147))

(declare-fun m!171157 () Bool)

(assert (=> d!36774 m!171157))

(declare-fun m!171159 () Bool)

(assert (=> d!36774 m!171159))

(assert (=> b!114352 d!36774))

(declare-fun d!36776 () Bool)

(declare-fun e!75170 () Bool)

(assert (=> d!36776 e!75170))

(declare-fun res!94724 () Bool)

(assert (=> d!36776 (=> (not res!94724) (not e!75170))))

(declare-fun lt!174494 () (_ BitVec 64))

(declare-fun lt!174493 () (_ BitVec 64))

(declare-fun lt!174492 () (_ BitVec 64))

(assert (=> d!36776 (= res!94724 (= lt!174493 (bvsub lt!174492 lt!174494)))))

(assert (=> d!36776 (or (= (bvand lt!174492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174494 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174492 lt!174494) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36776 (= lt!174494 (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!173907)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!173907))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!173907)))))))

(declare-fun lt!174496 () (_ BitVec 64))

(declare-fun lt!174495 () (_ BitVec 64))

(assert (=> d!36776 (= lt!174492 (bvmul lt!174496 lt!174495))))

(assert (=> d!36776 (or (= lt!174496 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!174495 (bvsdiv (bvmul lt!174496 lt!174495) lt!174496)))))

(assert (=> d!36776 (= lt!174495 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36776 (= lt!174496 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!173907)))))))

(assert (=> d!36776 (= lt!174493 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!173907))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!173907)))))))

(assert (=> d!36776 (invariant!0 (currentBit!5365 (_2!4979 lt!173907)) (currentByte!5370 (_2!4979 lt!173907)) (size!2355 (buf!2763 (_2!4979 lt!173907))))))

(assert (=> d!36776 (= (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))) lt!174493)))

(declare-fun b!114652 () Bool)

(declare-fun res!94725 () Bool)

(assert (=> b!114652 (=> (not res!94725) (not e!75170))))

(assert (=> b!114652 (= res!94725 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!174493))))

(declare-fun b!114653 () Bool)

(declare-fun lt!174497 () (_ BitVec 64))

(assert (=> b!114653 (= e!75170 (bvsle lt!174493 (bvmul lt!174497 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114653 (or (= lt!174497 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!174497 #b0000000000000000000000000000000000000000000000000000000000001000) lt!174497)))))

(assert (=> b!114653 (= lt!174497 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!173907)))))))

(assert (= (and d!36776 res!94724) b!114652))

(assert (= (and b!114652 res!94725) b!114653))

(declare-fun m!171161 () Bool)

(assert (=> d!36776 m!171161))

(assert (=> d!36776 m!170835))

(assert (=> b!114351 d!36776))

(declare-fun d!36778 () Bool)

(declare-fun e!75171 () Bool)

(assert (=> d!36778 e!75171))

(declare-fun res!94726 () Bool)

(assert (=> d!36778 (=> (not res!94726) (not e!75171))))

(declare-fun lt!174498 () (_ BitVec 64))

(declare-fun lt!174500 () (_ BitVec 64))

(declare-fun lt!174499 () (_ BitVec 64))

(assert (=> d!36778 (= res!94726 (= lt!174499 (bvsub lt!174498 lt!174500)))))

(assert (=> d!36778 (or (= (bvand lt!174498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174500 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174498 lt!174500) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36778 (= lt!174500 (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 thiss!1305))) ((_ sign_extend 32) (currentByte!5370 thiss!1305)) ((_ sign_extend 32) (currentBit!5365 thiss!1305))))))

(declare-fun lt!174502 () (_ BitVec 64))

(declare-fun lt!174501 () (_ BitVec 64))

(assert (=> d!36778 (= lt!174498 (bvmul lt!174502 lt!174501))))

(assert (=> d!36778 (or (= lt!174502 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!174501 (bvsdiv (bvmul lt!174502 lt!174501) lt!174502)))))

(assert (=> d!36778 (= lt!174501 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36778 (= lt!174502 ((_ sign_extend 32) (size!2355 (buf!2763 thiss!1305))))))

(assert (=> d!36778 (= lt!174499 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5370 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5365 thiss!1305))))))

(assert (=> d!36778 (invariant!0 (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305) (size!2355 (buf!2763 thiss!1305)))))

(assert (=> d!36778 (= (bitIndex!0 (size!2355 (buf!2763 thiss!1305)) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305)) lt!174499)))

(declare-fun b!114654 () Bool)

(declare-fun res!94727 () Bool)

(assert (=> b!114654 (=> (not res!94727) (not e!75171))))

(assert (=> b!114654 (= res!94727 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!174499))))

(declare-fun b!114655 () Bool)

(declare-fun lt!174503 () (_ BitVec 64))

(assert (=> b!114655 (= e!75171 (bvsle lt!174499 (bvmul lt!174503 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114655 (or (= lt!174503 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!174503 #b0000000000000000000000000000000000000000000000000000000000001000) lt!174503)))))

(assert (=> b!114655 (= lt!174503 ((_ sign_extend 32) (size!2355 (buf!2763 thiss!1305))))))

(assert (= (and d!36778 res!94726) b!114654))

(assert (= (and b!114654 res!94727) b!114655))

(assert (=> d!36778 m!170837))

(assert (=> d!36778 m!170813))

(assert (=> b!114351 d!36778))

(declare-fun d!36780 () Bool)

(assert (=> d!36780 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!114350 d!36780))

(declare-fun d!36782 () Bool)

(assert (=> d!36782 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!173907)))) ((_ sign_extend 32) (currentByte!5370 thiss!1305)) ((_ sign_extend 32) (currentBit!5365 thiss!1305))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!173907)))) ((_ sign_extend 32) (currentByte!5370 thiss!1305)) ((_ sign_extend 32) (currentBit!5365 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!8918 () Bool)

(assert (= bs!8918 d!36782))

(assert (=> bs!8918 m!170831))

(assert (=> b!114349 d!36782))

(push 1)

(assert (not d!36746))

(assert (not b!114627))

(assert (not b!114638))

(assert (not b!114463))

(assert (not d!36734))

(assert (not d!36736))

(assert (not d!36782))

(assert (not b!114650))

(assert (not d!36740))

(assert (not b!114649))

(assert (not b!114465))

(assert (not d!36750))

(assert (not bm!1481))

(assert (not b!114438))

(assert (not d!36776))

(assert (not b!114460))

(assert (not b!114633))

(assert (not b!114630))

(assert (not b!114436))

(assert (not b!114629))

(assert (not d!36738))

(assert (not bm!1469))

(assert (not d!36730))

(assert (not b!114626))

(assert (not b!114437))

(assert (not b!114648))

(assert (not b!114651))

(assert (not b!114632))

(assert (not d!36774))

(assert (not b!114634))

(assert (not d!36778))

(assert (not b!114451))

(assert (not b!114636))

(assert (not b!114458))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> b!114458 d!36778))

(assert (=> b!114458 d!36776))

(declare-fun d!36784 () Bool)

(declare-fun e!75172 () Bool)

(assert (=> d!36784 e!75172))

(declare-fun res!94728 () Bool)

(assert (=> d!36784 (=> (not res!94728) (not e!75172))))

(declare-fun lt!174504 () (_ BitVec 64))

(declare-fun lt!174506 () (_ BitVec 64))

(declare-fun lt!174505 () (_ BitVec 64))

(assert (=> d!36784 (= res!94728 (= lt!174505 (bvsub lt!174504 lt!174506)))))

(assert (=> d!36784 (or (= (bvand lt!174504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174506 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174504 lt!174506) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36784 (= lt!174506 (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_1!4980 lt!174490)))) ((_ sign_extend 32) (currentByte!5370 (_1!4980 lt!174490))) ((_ sign_extend 32) (currentBit!5365 (_1!4980 lt!174490)))))))

(declare-fun lt!174508 () (_ BitVec 64))

(declare-fun lt!174507 () (_ BitVec 64))

(assert (=> d!36784 (= lt!174504 (bvmul lt!174508 lt!174507))))

(assert (=> d!36784 (or (= lt!174508 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!174507 (bvsdiv (bvmul lt!174508 lt!174507) lt!174508)))))

(assert (=> d!36784 (= lt!174507 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36784 (= lt!174508 ((_ sign_extend 32) (size!2355 (buf!2763 (_1!4980 lt!174490)))))))

(assert (=> d!36784 (= lt!174505 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5370 (_1!4980 lt!174490))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5365 (_1!4980 lt!174490)))))))

(assert (=> d!36784 (invariant!0 (currentBit!5365 (_1!4980 lt!174490)) (currentByte!5370 (_1!4980 lt!174490)) (size!2355 (buf!2763 (_1!4980 lt!174490))))))

(assert (=> d!36784 (= (bitIndex!0 (size!2355 (buf!2763 (_1!4980 lt!174490))) (currentByte!5370 (_1!4980 lt!174490)) (currentBit!5365 (_1!4980 lt!174490))) lt!174505)))

(declare-fun b!114656 () Bool)

(declare-fun res!94729 () Bool)

(assert (=> b!114656 (=> (not res!94729) (not e!75172))))

(assert (=> b!114656 (= res!94729 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!174505))))

(declare-fun b!114657 () Bool)

(declare-fun lt!174509 () (_ BitVec 64))

(assert (=> b!114657 (= e!75172 (bvsle lt!174505 (bvmul lt!174509 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114657 (or (= lt!174509 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!174509 #b0000000000000000000000000000000000000000000000000000000000001000) lt!174509)))))

(assert (=> b!114657 (= lt!174509 ((_ sign_extend 32) (size!2355 (buf!2763 (_1!4980 lt!174490)))))))

(assert (= (and d!36784 res!94728) b!114656))

(assert (= (and b!114656 res!94729) b!114657))

(declare-fun m!171163 () Bool)

(assert (=> d!36784 m!171163))

(declare-fun m!171165 () Bool)

(assert (=> d!36784 m!171165))

(assert (=> b!114651 d!36784))

(declare-fun d!36786 () Bool)

(declare-fun e!75173 () Bool)

(assert (=> d!36786 e!75173))

(declare-fun res!94730 () Bool)

(assert (=> d!36786 (=> (not res!94730) (not e!75173))))

(declare-fun lt!174510 () (_ BitVec 64))

(declare-fun lt!174512 () (_ BitVec 64))

(declare-fun lt!174511 () (_ BitVec 64))

(assert (=> d!36786 (= res!94730 (= lt!174511 (bvsub lt!174510 lt!174512)))))

(assert (=> d!36786 (or (= (bvand lt!174510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174512 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174510 lt!174512) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36786 (= lt!174512 (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174491)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!174491))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!174491)))))))

(declare-fun lt!174514 () (_ BitVec 64))

(declare-fun lt!174513 () (_ BitVec 64))

(assert (=> d!36786 (= lt!174510 (bvmul lt!174514 lt!174513))))

(assert (=> d!36786 (or (= lt!174514 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!174513 (bvsdiv (bvmul lt!174514 lt!174513) lt!174514)))))

(assert (=> d!36786 (= lt!174513 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36786 (= lt!174514 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174491)))))))

(assert (=> d!36786 (= lt!174511 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!174491))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!174491)))))))

(assert (=> d!36786 (invariant!0 (currentBit!5365 (_2!4979 lt!174491)) (currentByte!5370 (_2!4979 lt!174491)) (size!2355 (buf!2763 (_2!4979 lt!174491))))))

(assert (=> d!36786 (= (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174491))) (currentByte!5370 (_2!4979 lt!174491)) (currentBit!5365 (_2!4979 lt!174491))) lt!174511)))

(declare-fun b!114658 () Bool)

(declare-fun res!94731 () Bool)

(assert (=> b!114658 (=> (not res!94731) (not e!75173))))

(assert (=> b!114658 (= res!94731 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!174511))))

(declare-fun b!114659 () Bool)

(declare-fun lt!174515 () (_ BitVec 64))

(assert (=> b!114659 (= e!75173 (bvsle lt!174511 (bvmul lt!174515 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114659 (or (= lt!174515 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!174515 #b0000000000000000000000000000000000000000000000000000000000001000) lt!174515)))))

(assert (=> b!114659 (= lt!174515 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174491)))))))

(assert (= (and d!36786 res!94730) b!114658))

(assert (= (and b!114658 res!94731) b!114659))

(declare-fun m!171167 () Bool)

(assert (=> d!36786 m!171167))

(declare-fun m!171169 () Bool)

(assert (=> d!36786 m!171169))

(assert (=> b!114651 d!36786))

(assert (=> b!114451 d!36726))

(declare-fun d!36788 () Bool)

(declare-fun lt!174516 () tuple2!9450)

(assert (=> d!36788 (= lt!174516 (readBit!0 (readerFrom!0 (_2!4979 lt!174491) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305))))))

(assert (=> d!36788 (= (readBitPure!0 (readerFrom!0 (_2!4979 lt!174491) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305))) (tuple2!9437 (_2!4990 lt!174516) (_1!4990 lt!174516)))))

(declare-fun bs!8919 () Bool)

(assert (= bs!8919 d!36788))

(assert (=> bs!8919 m!171149))

(declare-fun m!171171 () Bool)

(assert (=> bs!8919 m!171171))

(assert (=> b!114650 d!36788))

(declare-fun d!36790 () Bool)

(declare-fun e!75174 () Bool)

(assert (=> d!36790 e!75174))

(declare-fun res!94732 () Bool)

(assert (=> d!36790 (=> (not res!94732) (not e!75174))))

(assert (=> d!36790 (= res!94732 (invariant!0 (currentBit!5365 (_2!4979 lt!174491)) (currentByte!5370 (_2!4979 lt!174491)) (size!2355 (buf!2763 (_2!4979 lt!174491)))))))

(assert (=> d!36790 (= (readerFrom!0 (_2!4979 lt!174491) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305)) (BitStream!4185 (buf!2763 (_2!4979 lt!174491)) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305)))))

(declare-fun b!114660 () Bool)

(assert (=> b!114660 (= e!75174 (invariant!0 (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305) (size!2355 (buf!2763 (_2!4979 lt!174491)))))))

(assert (= (and d!36790 res!94732) b!114660))

(assert (=> d!36790 m!171169))

(declare-fun m!171173 () Bool)

(assert (=> b!114660 m!171173))

(assert (=> b!114650 d!36790))

(assert (=> b!114648 d!36786))

(assert (=> b!114648 d!36778))

(declare-fun d!36792 () Bool)

(assert (=> d!36792 (= (byteRangesEq!0 (select (arr!2948 (buf!2763 (_2!4979 lt!173907))) (_3!264 lt!173988)) (select (arr!2948 (buf!2763 (_2!4979 lt!173904))) (_3!264 lt!173988)) lt!173990 (ite c!6931 lt!173989 #b00000000000000000000000000001000)) (or (= lt!173990 (ite c!6931 lt!173989 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2948 (buf!2763 (_2!4979 lt!173907))) (_3!264 lt!173988))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!6931 lt!173989 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!173990)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2948 (buf!2763 (_2!4979 lt!173904))) (_3!264 lt!173988))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!6931 lt!173989 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!173990)))) #b00000000000000000000000011111111))))))

(declare-fun bs!8920 () Bool)

(assert (= bs!8920 d!36792))

(declare-fun m!171175 () Bool)

(assert (=> bs!8920 m!171175))

(declare-fun m!171177 () Bool)

(assert (=> bs!8920 m!171177))

(assert (=> bm!1469 d!36792))

(declare-fun d!36794 () Bool)

(declare-fun res!94734 () Bool)

(declare-fun e!75176 () Bool)

(assert (=> d!36794 (=> (not res!94734) (not e!75176))))

(assert (=> d!36794 (= res!94734 (= (size!2355 (buf!2763 thiss!1305)) (size!2355 (buf!2763 (_2!4979 lt!174491)))))))

(assert (=> d!36794 (= (isPrefixOf!0 thiss!1305 (_2!4979 lt!174491)) e!75176)))

(declare-fun b!114661 () Bool)

(declare-fun res!94733 () Bool)

(assert (=> b!114661 (=> (not res!94733) (not e!75176))))

(assert (=> b!114661 (= res!94733 (bvsle (bitIndex!0 (size!2355 (buf!2763 thiss!1305)) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305)) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174491))) (currentByte!5370 (_2!4979 lt!174491)) (currentBit!5365 (_2!4979 lt!174491)))))))

(declare-fun b!114662 () Bool)

(declare-fun e!75175 () Bool)

(assert (=> b!114662 (= e!75176 e!75175)))

(declare-fun res!94735 () Bool)

(assert (=> b!114662 (=> res!94735 e!75175)))

(assert (=> b!114662 (= res!94735 (= (size!2355 (buf!2763 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!114663 () Bool)

(assert (=> b!114663 (= e!75175 (arrayBitRangesEq!0 (buf!2763 thiss!1305) (buf!2763 (_2!4979 lt!174491)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2355 (buf!2763 thiss!1305)) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305))))))

(assert (= (and d!36794 res!94734) b!114661))

(assert (= (and b!114661 res!94733) b!114662))

(assert (= (and b!114662 (not res!94735)) b!114663))

(assert (=> b!114661 m!170721))

(assert (=> b!114661 m!171147))

(assert (=> b!114663 m!170721))

(assert (=> b!114663 m!170721))

(declare-fun m!171179 () Bool)

(assert (=> b!114663 m!171179))

(assert (=> b!114649 d!36794))

(declare-fun d!36796 () Bool)

(declare-fun e!75177 () Bool)

(assert (=> d!36796 e!75177))

(declare-fun res!94736 () Bool)

(assert (=> d!36796 (=> (not res!94736) (not e!75177))))

(declare-fun lt!174519 () (_ BitVec 64))

(declare-fun lt!174517 () (_ BitVec 64))

(declare-fun lt!174518 () (_ BitVec 64))

(assert (=> d!36796 (= res!94736 (= lt!174518 (bvsub lt!174517 lt!174519)))))

(assert (=> d!36796 (or (= (bvand lt!174517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174519 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174517 lt!174519) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36796 (= lt!174519 (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174474)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!174474))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!174474)))))))

(declare-fun lt!174521 () (_ BitVec 64))

(declare-fun lt!174520 () (_ BitVec 64))

(assert (=> d!36796 (= lt!174517 (bvmul lt!174521 lt!174520))))

(assert (=> d!36796 (or (= lt!174521 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!174520 (bvsdiv (bvmul lt!174521 lt!174520) lt!174521)))))

(assert (=> d!36796 (= lt!174520 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36796 (= lt!174521 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174474)))))))

(assert (=> d!36796 (= lt!174518 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!174474))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!174474)))))))

(assert (=> d!36796 (invariant!0 (currentBit!5365 (_2!4979 lt!174474)) (currentByte!5370 (_2!4979 lt!174474)) (size!2355 (buf!2763 (_2!4979 lt!174474))))))

(assert (=> d!36796 (= (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174474))) (currentByte!5370 (_2!4979 lt!174474)) (currentBit!5365 (_2!4979 lt!174474))) lt!174518)))

(declare-fun b!114664 () Bool)

(declare-fun res!94737 () Bool)

(assert (=> b!114664 (=> (not res!94737) (not e!75177))))

(assert (=> b!114664 (= res!94737 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!174518))))

(declare-fun b!114665 () Bool)

(declare-fun lt!174522 () (_ BitVec 64))

(assert (=> b!114665 (= e!75177 (bvsle lt!174518 (bvmul lt!174522 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114665 (or (= lt!174522 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!174522 #b0000000000000000000000000000000000000000000000000000000000001000) lt!174522)))))

(assert (=> b!114665 (= lt!174522 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174474)))))))

(assert (= (and d!36796 res!94736) b!114664))

(assert (= (and b!114664 res!94737) b!114665))

(declare-fun m!171181 () Bool)

(assert (=> d!36796 m!171181))

(declare-fun m!171183 () Bool)

(assert (=> d!36796 m!171183))

(assert (=> b!114638 d!36796))

(assert (=> b!114638 d!36776))

(declare-fun d!36798 () Bool)

(assert (=> d!36798 (= (invariant!0 (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305) (size!2355 (buf!2763 thiss!1305))) (and (bvsge (currentBit!5365 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5365 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5370 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5370 thiss!1305) (size!2355 (buf!2763 thiss!1305))) (and (= (currentBit!5365 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5370 thiss!1305) (size!2355 (buf!2763 thiss!1305)))))))))

(assert (=> d!36730 d!36798))

(assert (=> d!36750 d!36748))

(declare-fun d!36800 () Bool)

(assert (=> d!36800 (isPrefixOf!0 thiss!1305 (_2!4979 lt!173904))))

(assert (=> d!36800 true))

(declare-fun _$15!186 () Unit!7031)

(assert (=> d!36800 (= (choose!30 thiss!1305 (_2!4979 lt!173907) (_2!4979 lt!173904)) _$15!186)))

(declare-fun bs!8921 () Bool)

(assert (= bs!8921 d!36800))

(assert (=> bs!8921 m!170733))

(assert (=> d!36750 d!36800))

(assert (=> d!36750 d!36744))

(declare-fun d!36802 () Bool)

(assert (=> d!36802 (= (invariant!0 (currentBit!5365 (_2!4979 lt!173907)) (currentByte!5370 (_2!4979 lt!173907)) (size!2355 (buf!2763 (_2!4979 lt!174469)))) (and (bvsge (currentBit!5365 (_2!4979 lt!173907)) #b00000000000000000000000000000000) (bvslt (currentBit!5365 (_2!4979 lt!173907)) #b00000000000000000000000000001000) (bvsge (currentByte!5370 (_2!4979 lt!173907)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5370 (_2!4979 lt!173907)) (size!2355 (buf!2763 (_2!4979 lt!174469)))) (and (= (currentBit!5365 (_2!4979 lt!173907)) #b00000000000000000000000000000000) (= (currentByte!5370 (_2!4979 lt!173907)) (size!2355 (buf!2763 (_2!4979 lt!174469))))))))))

(assert (=> b!114636 d!36802))

(declare-fun d!36804 () Bool)

(declare-fun e!75180 () Bool)

(assert (=> d!36804 e!75180))

(declare-fun res!94740 () Bool)

(assert (=> d!36804 (=> (not res!94740) (not e!75180))))

(declare-fun lt!174528 () (_ BitVec 64))

(declare-fun lt!174527 () BitStream!4184)

(assert (=> d!36804 (= res!94740 (= (bvadd lt!174528 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2355 (buf!2763 lt!174527)) (currentByte!5370 lt!174527) (currentBit!5365 lt!174527))))))

(assert (=> d!36804 (or (not (= (bvand lt!174528 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!174528 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!174528 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36804 (= lt!174528 (bitIndex!0 (size!2355 (buf!2763 (_1!4992 lt!174456))) (currentByte!5370 (_1!4992 lt!174456)) (currentBit!5365 (_1!4992 lt!174456))))))

(declare-fun moveBitIndex!0 (BitStream!4184 (_ BitVec 64)) tuple2!9434)

(assert (=> d!36804 (= lt!174527 (_2!4979 (moveBitIndex!0 (_1!4992 lt!174456) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4184 (_ BitVec 64)) Bool)

(assert (=> d!36804 (moveBitIndexPrecond!0 (_1!4992 lt!174456) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!36804 (= (withMovedBitIndex!0 (_1!4992 lt!174456) #b0000000000000000000000000000000000000000000000000000000000000001) lt!174527)))

(declare-fun b!114668 () Bool)

(assert (=> b!114668 (= e!75180 (= (size!2355 (buf!2763 (_1!4992 lt!174456))) (size!2355 (buf!2763 lt!174527))))))

(assert (= (and d!36804 res!94740) b!114668))

(declare-fun m!171185 () Bool)

(assert (=> d!36804 m!171185))

(declare-fun m!171187 () Bool)

(assert (=> d!36804 m!171187))

(declare-fun m!171189 () Bool)

(assert (=> d!36804 m!171189))

(declare-fun m!171191 () Bool)

(assert (=> d!36804 m!171191))

(assert (=> b!114636 d!36804))

(declare-fun d!36806 () Bool)

(declare-datatypes ((tuple2!9456 0))(
  ( (tuple2!9457 (_1!4993 (_ BitVec 64)) (_2!4993 BitStream!4184)) )
))
(declare-fun lt!174531 () tuple2!9456)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9456)

(assert (=> d!36806 (= lt!174531 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4992 lt!174456) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!174437 e!75158)))))

(assert (=> d!36806 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4992 lt!174456) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!174437 e!75158)) (tuple2!9453 (_2!4993 lt!174531) (_1!4993 lt!174531)))))

(declare-fun bs!8922 () Bool)

(assert (= bs!8922 d!36806))

(assert (=> bs!8922 m!171079))

(declare-fun m!171193 () Bool)

(assert (=> bs!8922 m!171193))

(assert (=> b!114636 d!36806))

(assert (=> b!114636 d!36776))

(declare-fun d!36808 () Bool)

(declare-fun e!75183 () Bool)

(assert (=> d!36808 e!75183))

(declare-fun res!94743 () Bool)

(assert (=> d!36808 (=> (not res!94743) (not e!75183))))

(declare-fun lt!174543 () tuple2!9436)

(declare-fun lt!174541 () tuple2!9436)

(assert (=> d!36808 (= res!94743 (= (bitIndex!0 (size!2355 (buf!2763 (_1!4980 lt!174543))) (currentByte!5370 (_1!4980 lt!174543)) (currentBit!5365 (_1!4980 lt!174543))) (bitIndex!0 (size!2355 (buf!2763 (_1!4980 lt!174541))) (currentByte!5370 (_1!4980 lt!174541)) (currentBit!5365 (_1!4980 lt!174541)))))))

(declare-fun lt!174542 () Unit!7031)

(declare-fun lt!174540 () BitStream!4184)

(declare-fun choose!50 (BitStream!4184 BitStream!4184 BitStream!4184 tuple2!9436 tuple2!9436 BitStream!4184 Bool tuple2!9436 tuple2!9436 BitStream!4184 Bool) Unit!7031)

(assert (=> d!36808 (= lt!174542 (choose!50 lt!174466 (_2!4979 lt!174452) lt!174540 lt!174543 (tuple2!9437 (_1!4980 lt!174543) (_2!4980 lt!174543)) (_1!4980 lt!174543) (_2!4980 lt!174543) lt!174541 (tuple2!9437 (_1!4980 lt!174541) (_2!4980 lt!174541)) (_1!4980 lt!174541) (_2!4980 lt!174541)))))

(assert (=> d!36808 (= lt!174541 (readBitPure!0 lt!174540))))

(assert (=> d!36808 (= lt!174543 (readBitPure!0 lt!174466))))

(assert (=> d!36808 (= lt!174540 (BitStream!4185 (buf!2763 (_2!4979 lt!174452)) (currentByte!5370 lt!174466) (currentBit!5365 lt!174466)))))

(assert (=> d!36808 (invariant!0 (currentBit!5365 lt!174466) (currentByte!5370 lt!174466) (size!2355 (buf!2763 (_2!4979 lt!174452))))))

(assert (=> d!36808 (= (readBitPrefixLemma!0 lt!174466 (_2!4979 lt!174452)) lt!174542)))

(declare-fun b!114671 () Bool)

(assert (=> b!114671 (= e!75183 (= (_2!4980 lt!174543) (_2!4980 lt!174541)))))

(assert (= (and d!36808 res!94743) b!114671))

(assert (=> d!36808 m!171099))

(declare-fun m!171195 () Bool)

(assert (=> d!36808 m!171195))

(assert (=> d!36808 m!171095))

(declare-fun m!171197 () Bool)

(assert (=> d!36808 m!171197))

(declare-fun m!171199 () Bool)

(assert (=> d!36808 m!171199))

(declare-fun m!171201 () Bool)

(assert (=> d!36808 m!171201))

(assert (=> b!114636 d!36808))

(declare-fun d!36810 () Bool)

(declare-fun lt!174544 () tuple2!9450)

(assert (=> d!36810 (= lt!174544 (readBit!0 lt!174466))))

(assert (=> d!36810 (= (readBitPure!0 lt!174466) (tuple2!9437 (_2!4990 lt!174544) (_1!4990 lt!174544)))))

(declare-fun bs!8923 () Bool)

(assert (= bs!8923 d!36810))

(declare-fun m!171203 () Bool)

(assert (=> bs!8923 m!171203))

(assert (=> b!114636 d!36810))

(declare-fun b!114673 () Bool)

(declare-fun res!94745 () Bool)

(declare-fun e!75184 () Bool)

(assert (=> b!114673 (=> (not res!94745) (not e!75184))))

(declare-fun lt!174548 () tuple2!9434)

(assert (=> b!114673 (= res!94745 (isPrefixOf!0 (_2!4979 lt!173907) (_2!4979 lt!174548)))))

(declare-fun d!36812 () Bool)

(assert (=> d!36812 e!75184))

(declare-fun res!94746 () Bool)

(assert (=> d!36812 (=> (not res!94746) (not e!75184))))

(assert (=> d!36812 (= res!94746 (= (size!2355 (buf!2763 (_2!4979 lt!173907))) (size!2355 (buf!2763 (_2!4979 lt!174548)))))))

(assert (=> d!36812 (= lt!174548 (choose!16 (_2!4979 lt!173907) lt!174468))))

(assert (=> d!36812 (validate_offset_bit!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!173907)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!173907))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!173907))))))

(assert (=> d!36812 (= (appendBit!0 (_2!4979 lt!173907) lt!174468) lt!174548)))

(declare-fun b!114674 () Bool)

(declare-fun e!75185 () Bool)

(assert (=> b!114674 (= e!75184 e!75185)))

(declare-fun res!94744 () Bool)

(assert (=> b!114674 (=> (not res!94744) (not e!75185))))

(declare-fun lt!174547 () tuple2!9436)

(assert (=> b!114674 (= res!94744 (and (= (_2!4980 lt!174547) lt!174468) (= (_1!4980 lt!174547) (_2!4979 lt!174548))))))

(assert (=> b!114674 (= lt!174547 (readBitPure!0 (readerFrom!0 (_2!4979 lt!174548) (currentBit!5365 (_2!4979 lt!173907)) (currentByte!5370 (_2!4979 lt!173907)))))))

(declare-fun b!114672 () Bool)

(declare-fun res!94747 () Bool)

(assert (=> b!114672 (=> (not res!94747) (not e!75184))))

(declare-fun lt!174546 () (_ BitVec 64))

(declare-fun lt!174545 () (_ BitVec 64))

(assert (=> b!114672 (= res!94747 (= (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174548))) (currentByte!5370 (_2!4979 lt!174548)) (currentBit!5365 (_2!4979 lt!174548))) (bvadd lt!174546 lt!174545)))))

(assert (=> b!114672 (or (not (= (bvand lt!174546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174545 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!174546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!174546 lt!174545) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114672 (= lt!174545 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!114672 (= lt!174546 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))))))

(declare-fun b!114675 () Bool)

(assert (=> b!114675 (= e!75185 (= (bitIndex!0 (size!2355 (buf!2763 (_1!4980 lt!174547))) (currentByte!5370 (_1!4980 lt!174547)) (currentBit!5365 (_1!4980 lt!174547))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174548))) (currentByte!5370 (_2!4979 lt!174548)) (currentBit!5365 (_2!4979 lt!174548)))))))

(assert (= (and d!36812 res!94746) b!114672))

(assert (= (and b!114672 res!94747) b!114673))

(assert (= (and b!114673 res!94745) b!114674))

(assert (= (and b!114674 res!94744) b!114675))

(declare-fun m!171205 () Bool)

(assert (=> b!114672 m!171205))

(assert (=> b!114672 m!170719))

(declare-fun m!171207 () Bool)

(assert (=> b!114674 m!171207))

(assert (=> b!114674 m!171207))

(declare-fun m!171209 () Bool)

(assert (=> b!114674 m!171209))

(declare-fun m!171211 () Bool)

(assert (=> b!114673 m!171211))

(declare-fun m!171213 () Bool)

(assert (=> b!114675 m!171213))

(assert (=> b!114675 m!171205))

(declare-fun m!171215 () Bool)

(assert (=> d!36812 m!171215))

(declare-fun m!171217 () Bool)

(assert (=> d!36812 m!171217))

(assert (=> b!114636 d!36812))

(declare-fun d!36814 () Bool)

(declare-fun e!75186 () Bool)

(assert (=> d!36814 e!75186))

(declare-fun res!94748 () Bool)

(assert (=> d!36814 (=> (not res!94748) (not e!75186))))

(declare-fun lt!174550 () (_ BitVec 64))

(declare-fun lt!174549 () (_ BitVec 64))

(declare-fun lt!174551 () (_ BitVec 64))

(assert (=> d!36814 (= res!94748 (= lt!174550 (bvsub lt!174549 lt!174551)))))

(assert (=> d!36814 (or (= (bvand lt!174549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174551 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174549 lt!174551) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36814 (= lt!174551 (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174452)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!174452))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!174452)))))))

(declare-fun lt!174553 () (_ BitVec 64))

(declare-fun lt!174552 () (_ BitVec 64))

(assert (=> d!36814 (= lt!174549 (bvmul lt!174553 lt!174552))))

(assert (=> d!36814 (or (= lt!174553 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!174552 (bvsdiv (bvmul lt!174553 lt!174552) lt!174553)))))

(assert (=> d!36814 (= lt!174552 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36814 (= lt!174553 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174452)))))))

(assert (=> d!36814 (= lt!174550 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!174452))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!174452)))))))

(assert (=> d!36814 (invariant!0 (currentBit!5365 (_2!4979 lt!174452)) (currentByte!5370 (_2!4979 lt!174452)) (size!2355 (buf!2763 (_2!4979 lt!174452))))))

(assert (=> d!36814 (= (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174452))) (currentByte!5370 (_2!4979 lt!174452)) (currentBit!5365 (_2!4979 lt!174452))) lt!174550)))

(declare-fun b!114676 () Bool)

(declare-fun res!94749 () Bool)

(assert (=> b!114676 (=> (not res!94749) (not e!75186))))

(assert (=> b!114676 (= res!94749 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!174550))))

(declare-fun b!114677 () Bool)

(declare-fun lt!174554 () (_ BitVec 64))

(assert (=> b!114677 (= e!75186 (bvsle lt!174550 (bvmul lt!174554 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114677 (or (= lt!174554 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!174554 #b0000000000000000000000000000000000000000000000000000000000001000) lt!174554)))))

(assert (=> b!114677 (= lt!174554 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174452)))))))

(assert (= (and d!36814 res!94748) b!114676))

(assert (= (and b!114676 res!94749) b!114677))

(declare-fun m!171219 () Bool)

(assert (=> d!36814 m!171219))

(declare-fun m!171221 () Bool)

(assert (=> d!36814 m!171221))

(assert (=> b!114636 d!36814))

(declare-fun d!36816 () Bool)

(declare-fun e!75192 () Bool)

(assert (=> d!36816 e!75192))

(declare-fun res!94758 () Bool)

(assert (=> d!36816 (=> (not res!94758) (not e!75192))))

(declare-fun lt!174612 () tuple2!9454)

(assert (=> d!36816 (= res!94758 (isPrefixOf!0 (_1!4992 lt!174612) (_2!4992 lt!174612)))))

(declare-fun lt!174602 () BitStream!4184)

(assert (=> d!36816 (= lt!174612 (tuple2!9455 lt!174602 (_2!4979 lt!174452)))))

(declare-fun lt!174595 () Unit!7031)

(declare-fun lt!174609 () Unit!7031)

(assert (=> d!36816 (= lt!174595 lt!174609)))

(assert (=> d!36816 (isPrefixOf!0 lt!174602 (_2!4979 lt!174452))))

(assert (=> d!36816 (= lt!174609 (lemmaIsPrefixTransitive!0 lt!174602 (_2!4979 lt!174452) (_2!4979 lt!174452)))))

(declare-fun lt!174604 () Unit!7031)

(declare-fun lt!174610 () Unit!7031)

(assert (=> d!36816 (= lt!174604 lt!174610)))

(assert (=> d!36816 (isPrefixOf!0 lt!174602 (_2!4979 lt!174452))))

(assert (=> d!36816 (= lt!174610 (lemmaIsPrefixTransitive!0 lt!174602 (_2!4979 lt!174469) (_2!4979 lt!174452)))))

(declare-fun lt!174603 () Unit!7031)

(declare-fun e!75191 () Unit!7031)

(assert (=> d!36816 (= lt!174603 e!75191)))

(declare-fun c!6955 () Bool)

(assert (=> d!36816 (= c!6955 (not (= (size!2355 (buf!2763 (_2!4979 lt!174469))) #b00000000000000000000000000000000)))))

(declare-fun lt!174611 () Unit!7031)

(declare-fun lt!174606 () Unit!7031)

(assert (=> d!36816 (= lt!174611 lt!174606)))

(assert (=> d!36816 (isPrefixOf!0 (_2!4979 lt!174452) (_2!4979 lt!174452))))

(assert (=> d!36816 (= lt!174606 (lemmaIsPrefixRefl!0 (_2!4979 lt!174452)))))

(declare-fun lt!174614 () Unit!7031)

(declare-fun lt!174597 () Unit!7031)

(assert (=> d!36816 (= lt!174614 lt!174597)))

(assert (=> d!36816 (= lt!174597 (lemmaIsPrefixRefl!0 (_2!4979 lt!174452)))))

(declare-fun lt!174599 () Unit!7031)

(declare-fun lt!174596 () Unit!7031)

(assert (=> d!36816 (= lt!174599 lt!174596)))

(assert (=> d!36816 (isPrefixOf!0 lt!174602 lt!174602)))

(assert (=> d!36816 (= lt!174596 (lemmaIsPrefixRefl!0 lt!174602))))

(declare-fun lt!174601 () Unit!7031)

(declare-fun lt!174598 () Unit!7031)

(assert (=> d!36816 (= lt!174601 lt!174598)))

(assert (=> d!36816 (isPrefixOf!0 (_2!4979 lt!174469) (_2!4979 lt!174469))))

(assert (=> d!36816 (= lt!174598 (lemmaIsPrefixRefl!0 (_2!4979 lt!174469)))))

(assert (=> d!36816 (= lt!174602 (BitStream!4185 (buf!2763 (_2!4979 lt!174452)) (currentByte!5370 (_2!4979 lt!174469)) (currentBit!5365 (_2!4979 lt!174469))))))

(assert (=> d!36816 (isPrefixOf!0 (_2!4979 lt!174469) (_2!4979 lt!174452))))

(assert (=> d!36816 (= (reader!0 (_2!4979 lt!174469) (_2!4979 lt!174452)) lt!174612)))

(declare-fun b!114688 () Bool)

(declare-fun res!94756 () Bool)

(assert (=> b!114688 (=> (not res!94756) (not e!75192))))

(assert (=> b!114688 (= res!94756 (isPrefixOf!0 (_1!4992 lt!174612) (_2!4979 lt!174469)))))

(declare-fun b!114689 () Bool)

(declare-fun Unit!7051 () Unit!7031)

(assert (=> b!114689 (= e!75191 Unit!7051)))

(declare-fun b!114690 () Bool)

(declare-fun lt!174608 () (_ BitVec 64))

(declare-fun lt!174613 () (_ BitVec 64))

(assert (=> b!114690 (= e!75192 (= (_1!4992 lt!174612) (withMovedBitIndex!0 (_2!4992 lt!174612) (bvsub lt!174608 lt!174613))))))

(assert (=> b!114690 (or (= (bvand lt!174608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174613 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174608 lt!174613) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114690 (= lt!174613 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174452))) (currentByte!5370 (_2!4979 lt!174452)) (currentBit!5365 (_2!4979 lt!174452))))))

(assert (=> b!114690 (= lt!174608 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174469))) (currentByte!5370 (_2!4979 lt!174469)) (currentBit!5365 (_2!4979 lt!174469))))))

(declare-fun b!114691 () Bool)

(declare-fun lt!174605 () Unit!7031)

(assert (=> b!114691 (= e!75191 lt!174605)))

(declare-fun lt!174607 () (_ BitVec 64))

(assert (=> b!114691 (= lt!174607 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!174600 () (_ BitVec 64))

(assert (=> b!114691 (= lt!174600 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174469))) (currentByte!5370 (_2!4979 lt!174469)) (currentBit!5365 (_2!4979 lt!174469))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5187 array!5187 (_ BitVec 64) (_ BitVec 64)) Unit!7031)

(assert (=> b!114691 (= lt!174605 (arrayBitRangesEqSymmetric!0 (buf!2763 (_2!4979 lt!174469)) (buf!2763 (_2!4979 lt!174452)) lt!174607 lt!174600))))

(assert (=> b!114691 (arrayBitRangesEq!0 (buf!2763 (_2!4979 lt!174452)) (buf!2763 (_2!4979 lt!174469)) lt!174607 lt!174600)))

(declare-fun b!114692 () Bool)

(declare-fun res!94757 () Bool)

(assert (=> b!114692 (=> (not res!94757) (not e!75192))))

(assert (=> b!114692 (= res!94757 (isPrefixOf!0 (_2!4992 lt!174612) (_2!4979 lt!174452)))))

(assert (= (and d!36816 c!6955) b!114691))

(assert (= (and d!36816 (not c!6955)) b!114689))

(assert (= (and d!36816 res!94758) b!114688))

(assert (= (and b!114688 res!94756) b!114692))

(assert (= (and b!114692 res!94757) b!114690))

(declare-fun m!171223 () Bool)

(assert (=> b!114690 m!171223))

(assert (=> b!114690 m!171097))

(assert (=> b!114690 m!171075))

(declare-fun m!171225 () Bool)

(assert (=> b!114688 m!171225))

(declare-fun m!171227 () Bool)

(assert (=> d!36816 m!171227))

(declare-fun m!171229 () Bool)

(assert (=> d!36816 m!171229))

(declare-fun m!171231 () Bool)

(assert (=> d!36816 m!171231))

(declare-fun m!171233 () Bool)

(assert (=> d!36816 m!171233))

(declare-fun m!171235 () Bool)

(assert (=> d!36816 m!171235))

(declare-fun m!171237 () Bool)

(assert (=> d!36816 m!171237))

(declare-fun m!171239 () Bool)

(assert (=> d!36816 m!171239))

(declare-fun m!171241 () Bool)

(assert (=> d!36816 m!171241))

(declare-fun m!171243 () Bool)

(assert (=> d!36816 m!171243))

(declare-fun m!171245 () Bool)

(assert (=> d!36816 m!171245))

(declare-fun m!171247 () Bool)

(assert (=> d!36816 m!171247))

(declare-fun m!171249 () Bool)

(assert (=> b!114692 m!171249))

(assert (=> b!114691 m!171075))

(declare-fun m!171251 () Bool)

(assert (=> b!114691 m!171251))

(declare-fun m!171253 () Bool)

(assert (=> b!114691 m!171253))

(assert (=> b!114636 d!36816))

(declare-fun d!36818 () Bool)

(declare-fun res!94760 () Bool)

(declare-fun e!75194 () Bool)

(assert (=> d!36818 (=> (not res!94760) (not e!75194))))

(assert (=> d!36818 (= res!94760 (= (size!2355 (buf!2763 (_2!4979 lt!173907))) (size!2355 (buf!2763 (_2!4979 lt!174452)))))))

(assert (=> d!36818 (= (isPrefixOf!0 (_2!4979 lt!173907) (_2!4979 lt!174452)) e!75194)))

(declare-fun b!114693 () Bool)

(declare-fun res!94759 () Bool)

(assert (=> b!114693 (=> (not res!94759) (not e!75194))))

(assert (=> b!114693 (= res!94759 (bvsle (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174452))) (currentByte!5370 (_2!4979 lt!174452)) (currentBit!5365 (_2!4979 lt!174452)))))))

(declare-fun b!114694 () Bool)

(declare-fun e!75193 () Bool)

(assert (=> b!114694 (= e!75194 e!75193)))

(declare-fun res!94761 () Bool)

(assert (=> b!114694 (=> res!94761 e!75193)))

(assert (=> b!114694 (= res!94761 (= (size!2355 (buf!2763 (_2!4979 lt!173907))) #b00000000000000000000000000000000))))

(declare-fun b!114695 () Bool)

(assert (=> b!114695 (= e!75193 (arrayBitRangesEq!0 (buf!2763 (_2!4979 lt!173907)) (buf!2763 (_2!4979 lt!174452)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907)))))))

(assert (= (and d!36818 res!94760) b!114693))

(assert (= (and b!114693 res!94759) b!114694))

(assert (= (and b!114694 (not res!94761)) b!114695))

(assert (=> b!114693 m!170719))

(assert (=> b!114693 m!171097))

(assert (=> b!114695 m!170719))

(assert (=> b!114695 m!170719))

(declare-fun m!171255 () Bool)

(assert (=> b!114695 m!171255))

(assert (=> b!114636 d!36818))

(declare-fun d!36820 () Bool)

(declare-fun e!75195 () Bool)

(assert (=> d!36820 e!75195))

(declare-fun res!94762 () Bool)

(assert (=> d!36820 (=> (not res!94762) (not e!75195))))

(declare-fun lt!174615 () BitStream!4184)

(declare-fun lt!174616 () (_ BitVec 64))

(assert (=> d!36820 (= res!94762 (= (bvadd lt!174616 (bvsub (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174452))) (currentByte!5370 (_2!4979 lt!174452)) (currentBit!5365 (_2!4979 lt!174452))))) (bitIndex!0 (size!2355 (buf!2763 lt!174615)) (currentByte!5370 lt!174615) (currentBit!5365 lt!174615))))))

(assert (=> d!36820 (or (not (= (bvand lt!174616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174452))) (currentByte!5370 (_2!4979 lt!174452)) (currentBit!5365 (_2!4979 lt!174452)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!174616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!174616 (bvsub (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174452))) (currentByte!5370 (_2!4979 lt!174452)) (currentBit!5365 (_2!4979 lt!174452))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36820 (= lt!174616 (bitIndex!0 (size!2355 (buf!2763 (_2!4992 lt!174456))) (currentByte!5370 (_2!4992 lt!174456)) (currentBit!5365 (_2!4992 lt!174456))))))

(assert (=> d!36820 (= lt!174615 (_2!4979 (moveBitIndex!0 (_2!4992 lt!174456) (bvsub (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174452))) (currentByte!5370 (_2!4979 lt!174452)) (currentBit!5365 (_2!4979 lt!174452)))))))))

(assert (=> d!36820 (moveBitIndexPrecond!0 (_2!4992 lt!174456) (bvsub (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174452))) (currentByte!5370 (_2!4979 lt!174452)) (currentBit!5365 (_2!4979 lt!174452)))))))

(assert (=> d!36820 (= (withMovedBitIndex!0 (_2!4992 lt!174456) (bvsub (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174452))) (currentByte!5370 (_2!4979 lt!174452)) (currentBit!5365 (_2!4979 lt!174452))))) lt!174615)))

(declare-fun b!114696 () Bool)

(assert (=> b!114696 (= e!75195 (= (size!2355 (buf!2763 (_2!4992 lt!174456))) (size!2355 (buf!2763 lt!174615))))))

(assert (= (and d!36820 res!94762) b!114696))

(declare-fun m!171257 () Bool)

(assert (=> d!36820 m!171257))

(declare-fun m!171259 () Bool)

(assert (=> d!36820 m!171259))

(declare-fun m!171261 () Bool)

(assert (=> d!36820 m!171261))

(declare-fun m!171263 () Bool)

(assert (=> d!36820 m!171263))

(assert (=> b!114636 d!36820))

(declare-fun d!36822 () Bool)

(declare-fun lt!174617 () tuple2!9450)

(assert (=> d!36822 (= lt!174617 (readBit!0 (_1!4992 lt!174456)))))

(assert (=> d!36822 (= (readBitPure!0 (_1!4992 lt!174456)) (tuple2!9437 (_2!4990 lt!174617) (_1!4990 lt!174617)))))

(declare-fun bs!8924 () Bool)

(assert (= bs!8924 d!36822))

(declare-fun m!171265 () Bool)

(assert (=> bs!8924 m!171265))

(assert (=> b!114636 d!36822))

(declare-fun d!36824 () Bool)

(declare-fun lt!174618 () tuple2!9456)

(assert (=> d!36824 (= lt!174618 (readNLeastSignificantBitsLoop!0 (_1!4992 lt!174456) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174437))))

(assert (=> d!36824 (= (readNLeastSignificantBitsLoopPure!0 (_1!4992 lt!174456) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174437) (tuple2!9453 (_2!4993 lt!174618) (_1!4993 lt!174618)))))

(declare-fun bs!8925 () Bool)

(assert (= bs!8925 d!36824))

(declare-fun m!171267 () Bool)

(assert (=> bs!8925 m!171267))

(assert (=> b!114636 d!36824))

(declare-fun d!36826 () Bool)

(declare-fun e!75196 () Bool)

(assert (=> d!36826 e!75196))

(declare-fun res!94763 () Bool)

(assert (=> d!36826 (=> (not res!94763) (not e!75196))))

(declare-fun lt!174620 () (_ BitVec 64))

(declare-fun lt!174619 () BitStream!4184)

(assert (=> d!36826 (= res!94763 (= (bvadd lt!174620 (bvsub (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174469))) (currentByte!5370 (_2!4979 lt!174469)) (currentBit!5365 (_2!4979 lt!174469))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174452))) (currentByte!5370 (_2!4979 lt!174452)) (currentBit!5365 (_2!4979 lt!174452))))) (bitIndex!0 (size!2355 (buf!2763 lt!174619)) (currentByte!5370 lt!174619) (currentBit!5365 lt!174619))))))

(assert (=> d!36826 (or (not (= (bvand lt!174620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174469))) (currentByte!5370 (_2!4979 lt!174469)) (currentBit!5365 (_2!4979 lt!174469))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174452))) (currentByte!5370 (_2!4979 lt!174452)) (currentBit!5365 (_2!4979 lt!174452)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!174620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!174620 (bvsub (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174469))) (currentByte!5370 (_2!4979 lt!174469)) (currentBit!5365 (_2!4979 lt!174469))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174452))) (currentByte!5370 (_2!4979 lt!174452)) (currentBit!5365 (_2!4979 lt!174452))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36826 (= lt!174620 (bitIndex!0 (size!2355 (buf!2763 (_2!4992 lt!174460))) (currentByte!5370 (_2!4992 lt!174460)) (currentBit!5365 (_2!4992 lt!174460))))))

(assert (=> d!36826 (= lt!174619 (_2!4979 (moveBitIndex!0 (_2!4992 lt!174460) (bvsub (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174469))) (currentByte!5370 (_2!4979 lt!174469)) (currentBit!5365 (_2!4979 lt!174469))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174452))) (currentByte!5370 (_2!4979 lt!174452)) (currentBit!5365 (_2!4979 lt!174452)))))))))

(assert (=> d!36826 (moveBitIndexPrecond!0 (_2!4992 lt!174460) (bvsub (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174469))) (currentByte!5370 (_2!4979 lt!174469)) (currentBit!5365 (_2!4979 lt!174469))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174452))) (currentByte!5370 (_2!4979 lt!174452)) (currentBit!5365 (_2!4979 lt!174452)))))))

(assert (=> d!36826 (= (withMovedBitIndex!0 (_2!4992 lt!174460) (bvsub (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174469))) (currentByte!5370 (_2!4979 lt!174469)) (currentBit!5365 (_2!4979 lt!174469))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174452))) (currentByte!5370 (_2!4979 lt!174452)) (currentBit!5365 (_2!4979 lt!174452))))) lt!174619)))

(declare-fun b!114697 () Bool)

(assert (=> b!114697 (= e!75196 (= (size!2355 (buf!2763 (_2!4992 lt!174460))) (size!2355 (buf!2763 lt!174619))))))

(assert (= (and d!36826 res!94763) b!114697))

(declare-fun m!171269 () Bool)

(assert (=> d!36826 m!171269))

(declare-fun m!171271 () Bool)

(assert (=> d!36826 m!171271))

(declare-fun m!171273 () Bool)

(assert (=> d!36826 m!171273))

(declare-fun m!171275 () Bool)

(assert (=> d!36826 m!171275))

(assert (=> b!114636 d!36826))

(declare-fun d!36828 () Bool)

(assert (=> d!36828 (validate_offset_bits!1 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174452)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!173907))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!173907))) lt!174472)))

(declare-fun lt!174623 () Unit!7031)

(declare-fun choose!9 (BitStream!4184 array!5187 (_ BitVec 64) BitStream!4184) Unit!7031)

(assert (=> d!36828 (= lt!174623 (choose!9 (_2!4979 lt!173907) (buf!2763 (_2!4979 lt!174452)) lt!174472 (BitStream!4185 (buf!2763 (_2!4979 lt!174452)) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907)))))))

(assert (=> d!36828 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4979 lt!173907) (buf!2763 (_2!4979 lt!174452)) lt!174472) lt!174623)))

(declare-fun bs!8926 () Bool)

(assert (= bs!8926 d!36828))

(assert (=> bs!8926 m!171111))

(declare-fun m!171277 () Bool)

(assert (=> bs!8926 m!171277))

(assert (=> b!114636 d!36828))

(declare-fun d!36830 () Bool)

(declare-fun lt!174640 () tuple2!9452)

(declare-fun lt!174636 () tuple2!9452)

(assert (=> d!36830 (and (= (_2!4991 lt!174640) (_2!4991 lt!174636)) (= (_1!4991 lt!174640) (_1!4991 lt!174636)))))

(declare-fun lt!174637 () (_ BitVec 64))

(declare-fun lt!174638 () BitStream!4184)

(declare-fun lt!174639 () Bool)

(declare-fun lt!174641 () Unit!7031)

(declare-fun choose!45 (BitStream!4184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!9452 tuple2!9452 BitStream!4184 (_ BitVec 64) Bool BitStream!4184 (_ BitVec 64) tuple2!9452 tuple2!9452 BitStream!4184 (_ BitVec 64)) Unit!7031)

(assert (=> d!36830 (= lt!174641 (choose!45 (_1!4992 lt!174456) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174437 lt!174640 (tuple2!9453 (_1!4991 lt!174640) (_2!4991 lt!174640)) (_1!4991 lt!174640) (_2!4991 lt!174640) lt!174639 lt!174638 lt!174637 lt!174636 (tuple2!9453 (_1!4991 lt!174636) (_2!4991 lt!174636)) (_1!4991 lt!174636) (_2!4991 lt!174636)))))

(assert (=> d!36830 (= lt!174636 (readNLeastSignificantBitsLoopPure!0 lt!174638 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!174637))))

(assert (=> d!36830 (= lt!174637 (bvor lt!174437 (ite lt!174639 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36830 (= lt!174638 (withMovedBitIndex!0 (_1!4992 lt!174456) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!36830 (= lt!174639 (_2!4980 (readBitPure!0 (_1!4992 lt!174456))))))

(assert (=> d!36830 (= lt!174640 (readNLeastSignificantBitsLoopPure!0 (_1!4992 lt!174456) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174437))))

(assert (=> d!36830 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4992 lt!174456) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174437) lt!174641)))

(declare-fun bs!8928 () Bool)

(assert (= bs!8928 d!36830))

(declare-fun m!171279 () Bool)

(assert (=> bs!8928 m!171279))

(declare-fun m!171281 () Bool)

(assert (=> bs!8928 m!171281))

(assert (=> bs!8928 m!171079))

(assert (=> bs!8928 m!171117))

(assert (=> bs!8928 m!171071))

(assert (=> b!114636 d!36830))

(declare-fun d!36832 () Bool)

(assert (=> d!36832 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174452)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!174469))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!174469))) lt!174450) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174452)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!174469))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!174469)))) lt!174450))))

(declare-fun bs!8929 () Bool)

(assert (= bs!8929 d!36832))

(declare-fun m!171283 () Bool)

(assert (=> bs!8929 m!171283))

(assert (=> b!114636 d!36832))

(declare-fun d!36834 () Bool)

(declare-fun e!75197 () Bool)

(assert (=> d!36834 e!75197))

(declare-fun res!94764 () Bool)

(assert (=> d!36834 (=> (not res!94764) (not e!75197))))

(declare-fun lt!174644 () (_ BitVec 64))

(declare-fun lt!174642 () (_ BitVec 64))

(declare-fun lt!174643 () (_ BitVec 64))

(assert (=> d!36834 (= res!94764 (= lt!174643 (bvsub lt!174642 lt!174644)))))

(assert (=> d!36834 (or (= (bvand lt!174642 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174644 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174642 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174642 lt!174644) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36834 (= lt!174644 (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_1!4980 lt!174467)))) ((_ sign_extend 32) (currentByte!5370 (_1!4980 lt!174467))) ((_ sign_extend 32) (currentBit!5365 (_1!4980 lt!174467)))))))

(declare-fun lt!174646 () (_ BitVec 64))

(declare-fun lt!174645 () (_ BitVec 64))

(assert (=> d!36834 (= lt!174642 (bvmul lt!174646 lt!174645))))

(assert (=> d!36834 (or (= lt!174646 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!174645 (bvsdiv (bvmul lt!174646 lt!174645) lt!174646)))))

(assert (=> d!36834 (= lt!174645 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36834 (= lt!174646 ((_ sign_extend 32) (size!2355 (buf!2763 (_1!4980 lt!174467)))))))

(assert (=> d!36834 (= lt!174643 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5370 (_1!4980 lt!174467))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5365 (_1!4980 lt!174467)))))))

(assert (=> d!36834 (invariant!0 (currentBit!5365 (_1!4980 lt!174467)) (currentByte!5370 (_1!4980 lt!174467)) (size!2355 (buf!2763 (_1!4980 lt!174467))))))

(assert (=> d!36834 (= (bitIndex!0 (size!2355 (buf!2763 (_1!4980 lt!174467))) (currentByte!5370 (_1!4980 lt!174467)) (currentBit!5365 (_1!4980 lt!174467))) lt!174643)))

(declare-fun b!114698 () Bool)

(declare-fun res!94765 () Bool)

(assert (=> b!114698 (=> (not res!94765) (not e!75197))))

(assert (=> b!114698 (= res!94765 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!174643))))

(declare-fun b!114699 () Bool)

(declare-fun lt!174647 () (_ BitVec 64))

(assert (=> b!114699 (= e!75197 (bvsle lt!174643 (bvmul lt!174647 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114699 (or (= lt!174647 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!174647 #b0000000000000000000000000000000000000000000000000000000000001000) lt!174647)))))

(assert (=> b!114699 (= lt!174647 ((_ sign_extend 32) (size!2355 (buf!2763 (_1!4980 lt!174467)))))))

(assert (= (and d!36834 res!94764) b!114698))

(assert (= (and b!114698 res!94765) b!114699))

(declare-fun m!171285 () Bool)

(assert (=> d!36834 m!171285))

(declare-fun m!171287 () Bool)

(assert (=> d!36834 m!171287))

(assert (=> b!114636 d!36834))

(declare-fun lt!174648 () tuple2!9456)

(declare-fun d!36836 () Bool)

(assert (=> d!36836 (= lt!174648 (readNLeastSignificantBitsLoop!0 (_1!4992 lt!174460) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!174437 (ite (_2!4980 lt!174471) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!36836 (= (readNLeastSignificantBitsLoopPure!0 (_1!4992 lt!174460) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!174437 (ite (_2!4980 lt!174471) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!9453 (_2!4993 lt!174648) (_1!4993 lt!174648)))))

(declare-fun bs!8930 () Bool)

(assert (= bs!8930 d!36836))

(declare-fun m!171289 () Bool)

(assert (=> bs!8930 m!171289))

(assert (=> b!114636 d!36836))

(declare-fun d!36838 () Bool)

(declare-fun e!75198 () Bool)

(assert (=> d!36838 e!75198))

(declare-fun res!94766 () Bool)

(assert (=> d!36838 (=> (not res!94766) (not e!75198))))

(declare-fun lt!174649 () (_ BitVec 64))

(declare-fun lt!174651 () (_ BitVec 64))

(declare-fun lt!174650 () (_ BitVec 64))

(assert (=> d!36838 (= res!94766 (= lt!174650 (bvsub lt!174649 lt!174651)))))

(assert (=> d!36838 (or (= (bvand lt!174649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174651 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174649 lt!174651) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36838 (= lt!174651 (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_1!4980 lt!174440)))) ((_ sign_extend 32) (currentByte!5370 (_1!4980 lt!174440))) ((_ sign_extend 32) (currentBit!5365 (_1!4980 lt!174440)))))))

(declare-fun lt!174653 () (_ BitVec 64))

(declare-fun lt!174652 () (_ BitVec 64))

(assert (=> d!36838 (= lt!174649 (bvmul lt!174653 lt!174652))))

(assert (=> d!36838 (or (= lt!174653 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!174652 (bvsdiv (bvmul lt!174653 lt!174652) lt!174653)))))

(assert (=> d!36838 (= lt!174652 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36838 (= lt!174653 ((_ sign_extend 32) (size!2355 (buf!2763 (_1!4980 lt!174440)))))))

(assert (=> d!36838 (= lt!174650 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5370 (_1!4980 lt!174440))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5365 (_1!4980 lt!174440)))))))

(assert (=> d!36838 (invariant!0 (currentBit!5365 (_1!4980 lt!174440)) (currentByte!5370 (_1!4980 lt!174440)) (size!2355 (buf!2763 (_1!4980 lt!174440))))))

(assert (=> d!36838 (= (bitIndex!0 (size!2355 (buf!2763 (_1!4980 lt!174440))) (currentByte!5370 (_1!4980 lt!174440)) (currentBit!5365 (_1!4980 lt!174440))) lt!174650)))

(declare-fun b!114700 () Bool)

(declare-fun res!94767 () Bool)

(assert (=> b!114700 (=> (not res!94767) (not e!75198))))

(assert (=> b!114700 (= res!94767 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!174650))))

(declare-fun b!114701 () Bool)

(declare-fun lt!174654 () (_ BitVec 64))

(assert (=> b!114701 (= e!75198 (bvsle lt!174650 (bvmul lt!174654 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114701 (or (= lt!174654 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!174654 #b0000000000000000000000000000000000000000000000000000000000001000) lt!174654)))))

(assert (=> b!114701 (= lt!174654 ((_ sign_extend 32) (size!2355 (buf!2763 (_1!4980 lt!174440)))))))

(assert (= (and d!36838 res!94766) b!114700))

(assert (= (and b!114700 res!94767) b!114701))

(declare-fun m!171291 () Bool)

(assert (=> d!36838 m!171291))

(declare-fun m!171293 () Bool)

(assert (=> d!36838 m!171293))

(assert (=> b!114636 d!36838))

(declare-fun d!36840 () Bool)

(assert (=> d!36840 (= (invariant!0 (currentBit!5365 lt!174466) (currentByte!5370 lt!174466) (size!2355 (buf!2763 (_2!4979 lt!174452)))) (and (bvsge (currentBit!5365 lt!174466) #b00000000000000000000000000000000) (bvslt (currentBit!5365 lt!174466) #b00000000000000000000000000001000) (bvsge (currentByte!5370 lt!174466) #b00000000000000000000000000000000) (or (bvslt (currentByte!5370 lt!174466) (size!2355 (buf!2763 (_2!4979 lt!174452)))) (and (= (currentBit!5365 lt!174466) #b00000000000000000000000000000000) (= (currentByte!5370 lt!174466) (size!2355 (buf!2763 (_2!4979 lt!174452))))))))))

(assert (=> b!114636 d!36840))

(declare-fun e!75204 () Bool)

(declare-fun b!114702 () Bool)

(declare-fun lt!174684 () tuple2!9454)

(declare-fun lt!174669 () tuple2!9452)

(assert (=> b!114702 (= e!75204 (and (= (_2!4991 lt!174669) v!199) (= (_1!4991 lt!174669) (_2!4992 lt!174684))))))

(declare-fun lt!174678 () (_ BitVec 64))

(assert (=> b!114702 (= lt!174669 (readNLeastSignificantBitsLoopPure!0 (_1!4992 lt!174684) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!174678))))

(declare-fun lt!174661 () Unit!7031)

(declare-fun lt!174664 () Unit!7031)

(assert (=> b!114702 (= lt!174661 lt!174664)))

(declare-fun lt!174694 () tuple2!9434)

(declare-fun lt!174681 () (_ BitVec 64))

(assert (=> b!114702 (validate_offset_bits!1 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174694)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!174469))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!174469))) lt!174681)))

(assert (=> b!114702 (= lt!174664 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4979 lt!174469) (buf!2763 (_2!4979 lt!174694)) lt!174681))))

(declare-fun e!75202 () Bool)

(assert (=> b!114702 e!75202))

(declare-fun res!94770 () Bool)

(assert (=> b!114702 (=> (not res!94770) (not e!75202))))

(assert (=> b!114702 (= res!94770 (and (= (size!2355 (buf!2763 (_2!4979 lt!174469))) (size!2355 (buf!2763 (_2!4979 lt!174694)))) (bvsge lt!174681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114702 (= lt!174681 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!114702 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!114702 (= lt!174678 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(assert (=> b!114702 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!114702 (= lt!174684 (reader!0 (_2!4979 lt!174469) (_2!4979 lt!174694)))))

(declare-fun b!114703 () Bool)

(declare-fun e!75199 () Bool)

(declare-fun lt!174675 () tuple2!9436)

(declare-fun lt!174697 () tuple2!9434)

(assert (=> b!114703 (= e!75199 (= (bitIndex!0 (size!2355 (buf!2763 (_1!4980 lt!174675))) (currentByte!5370 (_1!4980 lt!174675)) (currentBit!5365 (_1!4980 lt!174675))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174697))) (currentByte!5370 (_2!4979 lt!174697)) (currentBit!5365 (_2!4979 lt!174697)))))))

(declare-fun b!114704 () Bool)

(declare-fun e!75200 () (_ BitVec 64))

(assert (=> b!114704 (= e!75200 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun d!36842 () Bool)

(assert (=> d!36842 e!75204))

(declare-fun res!94768 () Bool)

(assert (=> d!36842 (=> (not res!94768) (not e!75204))))

(assert (=> d!36842 (= res!94768 (= (size!2355 (buf!2763 (_2!4979 lt!174469))) (size!2355 (buf!2763 (_2!4979 lt!174694)))))))

(declare-fun e!75201 () tuple2!9434)

(assert (=> d!36842 (= lt!174694 e!75201)))

(declare-fun c!6957 () Bool)

(assert (=> d!36842 (= c!6957 (bvslt (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396))))

(assert (=> d!36842 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!36842 (= (appendNLeastSignificantBitsLoop!0 (_2!4979 lt!174469) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) lt!174694)))

(declare-fun b!114705 () Bool)

(declare-fun res!94773 () Bool)

(assert (=> b!114705 (= res!94773 (= (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174697))) (currentByte!5370 (_2!4979 lt!174697)) (currentBit!5365 (_2!4979 lt!174697))) (bvadd (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174469))) (currentByte!5370 (_2!4979 lt!174469)) (currentBit!5365 (_2!4979 lt!174469))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!75203 () Bool)

(assert (=> b!114705 (=> (not res!94773) (not e!75203))))

(declare-fun b!114706 () Bool)

(assert (=> b!114706 (= lt!174675 (readBitPure!0 (readerFrom!0 (_2!4979 lt!174697) (currentBit!5365 (_2!4979 lt!174469)) (currentByte!5370 (_2!4979 lt!174469)))))))

(declare-fun lt!174688 () Bool)

(declare-fun res!94769 () Bool)

(assert (=> b!114706 (= res!94769 (and (= (_2!4980 lt!174675) lt!174688) (= (_1!4980 lt!174675) (_2!4979 lt!174697))))))

(assert (=> b!114706 (=> (not res!94769) (not e!75199))))

(assert (=> b!114706 (= e!75203 e!75199)))

(declare-fun b!114707 () Bool)

(assert (=> b!114707 (= e!75200 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))))

(declare-fun bm!1482 () Bool)

(declare-fun lt!174656 () BitStream!4184)

(declare-fun call!1485 () Bool)

(assert (=> bm!1482 (= call!1485 (isPrefixOf!0 (ite c!6957 (_2!4979 lt!174469) lt!174656) (ite c!6957 (_2!4979 lt!174697) lt!174656)))))

(declare-fun b!114708 () Bool)

(declare-fun lt!174695 () Unit!7031)

(assert (=> b!114708 (= e!75201 (tuple2!9435 lt!174695 (_2!4979 lt!174469)))))

(assert (=> b!114708 (= lt!174656 (_2!4979 lt!174469))))

(assert (=> b!114708 (= lt!174695 (lemmaIsPrefixRefl!0 lt!174656))))

(assert (=> b!114708 call!1485))

(declare-fun b!114709 () Bool)

(declare-fun res!94776 () Bool)

(assert (=> b!114709 (=> (not res!94776) (not e!75204))))

(assert (=> b!114709 (= res!94776 (isPrefixOf!0 (_2!4979 lt!174469) (_2!4979 lt!174694)))))

(declare-fun b!114710 () Bool)

(assert (=> b!114710 (= e!75202 (validate_offset_bits!1 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174469)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!174469))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!174469))) lt!174681))))

(declare-fun b!114711 () Bool)

(declare-fun res!94774 () Bool)

(assert (=> b!114711 (= res!94774 call!1485)))

(assert (=> b!114711 (=> (not res!94774) (not e!75203))))

(declare-fun b!114712 () Bool)

(declare-fun lt!174672 () tuple2!9434)

(declare-fun Unit!7052 () Unit!7031)

(assert (=> b!114712 (= e!75201 (tuple2!9435 Unit!7052 (_2!4979 lt!174672)))))

(assert (=> b!114712 (= lt!174688 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114712 (= lt!174697 (appendBit!0 (_2!4979 lt!174469) lt!174688))))

(declare-fun res!94771 () Bool)

(assert (=> b!114712 (= res!94771 (= (size!2355 (buf!2763 (_2!4979 lt!174469))) (size!2355 (buf!2763 (_2!4979 lt!174697)))))))

(assert (=> b!114712 (=> (not res!94771) (not e!75203))))

(assert (=> b!114712 e!75203))

(declare-fun lt!174689 () tuple2!9434)

(assert (=> b!114712 (= lt!174689 lt!174697)))

(assert (=> b!114712 (= lt!174672 (appendNLeastSignificantBitsLoop!0 (_2!4979 lt!174689) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!174663 () Unit!7031)

(assert (=> b!114712 (= lt!174663 (lemmaIsPrefixTransitive!0 (_2!4979 lt!174469) (_2!4979 lt!174689) (_2!4979 lt!174672)))))

(assert (=> b!114712 (isPrefixOf!0 (_2!4979 lt!174469) (_2!4979 lt!174672))))

(declare-fun lt!174698 () Unit!7031)

(assert (=> b!114712 (= lt!174698 lt!174663)))

(assert (=> b!114712 (invariant!0 (currentBit!5365 (_2!4979 lt!174469)) (currentByte!5370 (_2!4979 lt!174469)) (size!2355 (buf!2763 (_2!4979 lt!174689))))))

(declare-fun lt!174686 () BitStream!4184)

(assert (=> b!114712 (= lt!174686 (BitStream!4185 (buf!2763 (_2!4979 lt!174689)) (currentByte!5370 (_2!4979 lt!174469)) (currentBit!5365 (_2!4979 lt!174469))))))

(assert (=> b!114712 (invariant!0 (currentBit!5365 lt!174686) (currentByte!5370 lt!174686) (size!2355 (buf!2763 (_2!4979 lt!174672))))))

(declare-fun lt!174683 () BitStream!4184)

(assert (=> b!114712 (= lt!174683 (BitStream!4185 (buf!2763 (_2!4979 lt!174672)) (currentByte!5370 lt!174686) (currentBit!5365 lt!174686)))))

(declare-fun lt!174660 () tuple2!9436)

(assert (=> b!114712 (= lt!174660 (readBitPure!0 lt!174686))))

(declare-fun lt!174687 () tuple2!9436)

(assert (=> b!114712 (= lt!174687 (readBitPure!0 lt!174683))))

(declare-fun lt!174685 () Unit!7031)

(assert (=> b!114712 (= lt!174685 (readBitPrefixLemma!0 lt!174686 (_2!4979 lt!174672)))))

(declare-fun res!94775 () Bool)

(assert (=> b!114712 (= res!94775 (= (bitIndex!0 (size!2355 (buf!2763 (_1!4980 lt!174660))) (currentByte!5370 (_1!4980 lt!174660)) (currentBit!5365 (_1!4980 lt!174660))) (bitIndex!0 (size!2355 (buf!2763 (_1!4980 lt!174687))) (currentByte!5370 (_1!4980 lt!174687)) (currentBit!5365 (_1!4980 lt!174687)))))))

(declare-fun e!75205 () Bool)

(assert (=> b!114712 (=> (not res!94775) (not e!75205))))

(assert (=> b!114712 e!75205))

(declare-fun lt!174679 () Unit!7031)

(assert (=> b!114712 (= lt!174679 lt!174685)))

(declare-fun lt!174676 () tuple2!9454)

(assert (=> b!114712 (= lt!174676 (reader!0 (_2!4979 lt!174469) (_2!4979 lt!174672)))))

(declare-fun lt!174680 () tuple2!9454)

(assert (=> b!114712 (= lt!174680 (reader!0 (_2!4979 lt!174689) (_2!4979 lt!174672)))))

(declare-fun lt!174691 () tuple2!9436)

(assert (=> b!114712 (= lt!174691 (readBitPure!0 (_1!4992 lt!174676)))))

(assert (=> b!114712 (= (_2!4980 lt!174691) lt!174688)))

(declare-fun lt!174667 () Unit!7031)

(declare-fun Unit!7053 () Unit!7031)

(assert (=> b!114712 (= lt!174667 Unit!7053)))

(declare-fun lt!174657 () (_ BitVec 64))

(assert (=> b!114712 (= lt!174657 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(declare-fun lt!174692 () (_ BitVec 64))

(assert (=> b!114712 (= lt!174692 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(declare-fun lt!174666 () Unit!7031)

(assert (=> b!114712 (= lt!174666 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4979 lt!174469) (buf!2763 (_2!4979 lt!174672)) lt!174692))))

(assert (=> b!114712 (validate_offset_bits!1 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174672)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!174469))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!174469))) lt!174692)))

(declare-fun lt!174696 () Unit!7031)

(assert (=> b!114712 (= lt!174696 lt!174666)))

(declare-fun lt!174693 () tuple2!9452)

(assert (=> b!114712 (= lt!174693 (readNLeastSignificantBitsLoopPure!0 (_1!4992 lt!174676) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!174657))))

(declare-fun lt!174670 () (_ BitVec 64))

(assert (=> b!114712 (= lt!174670 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!174671 () Unit!7031)

(assert (=> b!114712 (= lt!174671 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4979 lt!174689) (buf!2763 (_2!4979 lt!174672)) lt!174670))))

(assert (=> b!114712 (validate_offset_bits!1 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174672)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!174689))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!174689))) lt!174670)))

(declare-fun lt!174673 () Unit!7031)

(assert (=> b!114712 (= lt!174673 lt!174671)))

(declare-fun lt!174690 () tuple2!9452)

(assert (=> b!114712 (= lt!174690 (readNLeastSignificantBitsLoopPure!0 (_1!4992 lt!174680) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!174657 (ite (_2!4980 lt!174691) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!174674 () tuple2!9452)

(assert (=> b!114712 (= lt!174674 (readNLeastSignificantBitsLoopPure!0 (_1!4992 lt!174676) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!174657))))

(declare-fun c!6956 () Bool)

(assert (=> b!114712 (= c!6956 (_2!4980 (readBitPure!0 (_1!4992 lt!174676))))))

(declare-fun lt!174668 () tuple2!9452)

(assert (=> b!114712 (= lt!174668 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4992 lt!174676) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!174657 e!75200)))))

(declare-fun lt!174682 () Unit!7031)

(assert (=> b!114712 (= lt!174682 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4992 lt!174676) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!174657))))

(assert (=> b!114712 (and (= (_2!4991 lt!174674) (_2!4991 lt!174668)) (= (_1!4991 lt!174674) (_1!4991 lt!174668)))))

(declare-fun lt!174665 () Unit!7031)

(assert (=> b!114712 (= lt!174665 lt!174682)))

(assert (=> b!114712 (= (_1!4992 lt!174676) (withMovedBitIndex!0 (_2!4992 lt!174676) (bvsub (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174469))) (currentByte!5370 (_2!4979 lt!174469)) (currentBit!5365 (_2!4979 lt!174469))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174672))) (currentByte!5370 (_2!4979 lt!174672)) (currentBit!5365 (_2!4979 lt!174672))))))))

(declare-fun lt!174677 () Unit!7031)

(declare-fun Unit!7054 () Unit!7031)

(assert (=> b!114712 (= lt!174677 Unit!7054)))

(assert (=> b!114712 (= (_1!4992 lt!174680) (withMovedBitIndex!0 (_2!4992 lt!174680) (bvsub (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174689))) (currentByte!5370 (_2!4979 lt!174689)) (currentBit!5365 (_2!4979 lt!174689))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174672))) (currentByte!5370 (_2!4979 lt!174672)) (currentBit!5365 (_2!4979 lt!174672))))))))

(declare-fun lt!174655 () Unit!7031)

(declare-fun Unit!7055 () Unit!7031)

(assert (=> b!114712 (= lt!174655 Unit!7055)))

(assert (=> b!114712 (= (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174469))) (currentByte!5370 (_2!4979 lt!174469)) (currentBit!5365 (_2!4979 lt!174469))) (bvsub (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174689))) (currentByte!5370 (_2!4979 lt!174689)) (currentBit!5365 (_2!4979 lt!174689))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!174658 () Unit!7031)

(declare-fun Unit!7056 () Unit!7031)

(assert (=> b!114712 (= lt!174658 Unit!7056)))

(assert (=> b!114712 (= (_2!4991 lt!174693) (_2!4991 lt!174690))))

(declare-fun lt!174699 () Unit!7031)

(declare-fun Unit!7057 () Unit!7031)

(assert (=> b!114712 (= lt!174699 Unit!7057)))

(assert (=> b!114712 (= (_1!4991 lt!174693) (_2!4992 lt!174676))))

(declare-fun b!114713 () Bool)

(assert (=> b!114713 (= e!75205 (= (_2!4980 lt!174660) (_2!4980 lt!174687)))))

(declare-fun b!114714 () Bool)

(declare-fun res!94772 () Bool)

(assert (=> b!114714 (=> (not res!94772) (not e!75204))))

(declare-fun lt!174659 () (_ BitVec 64))

(declare-fun lt!174662 () (_ BitVec 64))

(assert (=> b!114714 (= res!94772 (= (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174694))) (currentByte!5370 (_2!4979 lt!174694)) (currentBit!5365 (_2!4979 lt!174694))) (bvadd lt!174662 lt!174659)))))

(assert (=> b!114714 (or (not (= (bvand lt!174662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174659 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!174662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!174662 lt!174659) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114714 (= lt!174659 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!114714 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!114714 (= lt!174662 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174469))) (currentByte!5370 (_2!4979 lt!174469)) (currentBit!5365 (_2!4979 lt!174469))))))

(assert (= (and d!36842 c!6957) b!114712))

(assert (= (and d!36842 (not c!6957)) b!114708))

(assert (= (and b!114712 res!94771) b!114705))

(assert (= (and b!114705 res!94773) b!114711))

(assert (= (and b!114711 res!94774) b!114706))

(assert (= (and b!114706 res!94769) b!114703))

(assert (= (and b!114712 res!94775) b!114713))

(assert (= (and b!114712 c!6956) b!114707))

(assert (= (and b!114712 (not c!6956)) b!114704))

(assert (= (or b!114711 b!114708) bm!1482))

(assert (= (and d!36842 res!94768) b!114714))

(assert (= (and b!114714 res!94772) b!114709))

(assert (= (and b!114709 res!94776) b!114702))

(assert (= (and b!114702 res!94770) b!114710))

(declare-fun m!171295 () Bool)

(assert (=> b!114703 m!171295))

(declare-fun m!171297 () Bool)

(assert (=> b!114703 m!171297))

(assert (=> b!114705 m!171297))

(assert (=> b!114705 m!171075))

(declare-fun m!171299 () Bool)

(assert (=> b!114712 m!171299))

(declare-fun m!171301 () Bool)

(assert (=> b!114712 m!171301))

(declare-fun m!171303 () Bool)

(assert (=> b!114712 m!171303))

(assert (=> b!114712 m!171075))

(declare-fun m!171305 () Bool)

(assert (=> b!114712 m!171305))

(declare-fun m!171307 () Bool)

(assert (=> b!114712 m!171307))

(declare-fun m!171309 () Bool)

(assert (=> b!114712 m!171309))

(declare-fun m!171311 () Bool)

(assert (=> b!114712 m!171311))

(declare-fun m!171313 () Bool)

(assert (=> b!114712 m!171313))

(declare-fun m!171315 () Bool)

(assert (=> b!114712 m!171315))

(declare-fun m!171317 () Bool)

(assert (=> b!114712 m!171317))

(declare-fun m!171319 () Bool)

(assert (=> b!114712 m!171319))

(assert (=> b!114712 m!171309))

(declare-fun m!171321 () Bool)

(assert (=> b!114712 m!171321))

(declare-fun m!171323 () Bool)

(assert (=> b!114712 m!171323))

(declare-fun m!171325 () Bool)

(assert (=> b!114712 m!171325))

(declare-fun m!171327 () Bool)

(assert (=> b!114712 m!171327))

(declare-fun m!171329 () Bool)

(assert (=> b!114712 m!171329))

(declare-fun m!171331 () Bool)

(assert (=> b!114712 m!171331))

(declare-fun m!171333 () Bool)

(assert (=> b!114712 m!171333))

(declare-fun m!171335 () Bool)

(assert (=> b!114712 m!171335))

(declare-fun m!171337 () Bool)

(assert (=> b!114712 m!171337))

(declare-fun m!171339 () Bool)

(assert (=> b!114712 m!171339))

(declare-fun m!171341 () Bool)

(assert (=> b!114712 m!171341))

(declare-fun m!171343 () Bool)

(assert (=> b!114712 m!171343))

(declare-fun m!171345 () Bool)

(assert (=> b!114712 m!171345))

(declare-fun m!171347 () Bool)

(assert (=> b!114712 m!171347))

(declare-fun m!171349 () Bool)

(assert (=> b!114712 m!171349))

(declare-fun m!171351 () Bool)

(assert (=> b!114712 m!171351))

(declare-fun m!171353 () Bool)

(assert (=> b!114712 m!171353))

(declare-fun m!171355 () Bool)

(assert (=> b!114709 m!171355))

(declare-fun m!171357 () Bool)

(assert (=> b!114706 m!171357))

(assert (=> b!114706 m!171357))

(declare-fun m!171359 () Bool)

(assert (=> b!114706 m!171359))

(declare-fun m!171361 () Bool)

(assert (=> b!114714 m!171361))

(assert (=> b!114714 m!171075))

(declare-fun m!171363 () Bool)

(assert (=> b!114710 m!171363))

(declare-fun m!171365 () Bool)

(assert (=> bm!1482 m!171365))

(declare-fun m!171367 () Bool)

(assert (=> b!114708 m!171367))

(declare-fun m!171369 () Bool)

(assert (=> b!114702 m!171369))

(declare-fun m!171371 () Bool)

(assert (=> b!114702 m!171371))

(declare-fun m!171373 () Bool)

(assert (=> b!114702 m!171373))

(declare-fun m!171375 () Bool)

(assert (=> b!114702 m!171375))

(assert (=> b!114702 m!171353))

(assert (=> b!114636 d!36842))

(declare-fun d!36844 () Bool)

(declare-fun lt!174700 () tuple2!9450)

(assert (=> d!36844 (= lt!174700 (readBit!0 lt!174463))))

(assert (=> d!36844 (= (readBitPure!0 lt!174463) (tuple2!9437 (_2!4990 lt!174700) (_1!4990 lt!174700)))))

(declare-fun bs!8931 () Bool)

(assert (= bs!8931 d!36844))

(declare-fun m!171377 () Bool)

(assert (=> bs!8931 m!171377))

(assert (=> b!114636 d!36844))

(declare-fun d!36846 () Bool)

(assert (=> d!36846 (validate_offset_bits!1 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174452)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!174469))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!174469))) lt!174450)))

(declare-fun lt!174701 () Unit!7031)

(assert (=> d!36846 (= lt!174701 (choose!9 (_2!4979 lt!174469) (buf!2763 (_2!4979 lt!174452)) lt!174450 (BitStream!4185 (buf!2763 (_2!4979 lt!174452)) (currentByte!5370 (_2!4979 lt!174469)) (currentBit!5365 (_2!4979 lt!174469)))))))

(assert (=> d!36846 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4979 lt!174469) (buf!2763 (_2!4979 lt!174452)) lt!174450) lt!174701)))

(declare-fun bs!8932 () Bool)

(assert (= bs!8932 d!36846))

(assert (=> bs!8932 m!171087))

(declare-fun m!171379 () Bool)

(assert (=> bs!8932 m!171379))

(assert (=> b!114636 d!36846))

(declare-fun d!36848 () Bool)

(declare-fun e!75206 () Bool)

(assert (=> d!36848 e!75206))

(declare-fun res!94777 () Bool)

(assert (=> d!36848 (=> (not res!94777) (not e!75206))))

(declare-fun lt!174702 () (_ BitVec 64))

(declare-fun lt!174704 () (_ BitVec 64))

(declare-fun lt!174703 () (_ BitVec 64))

(assert (=> d!36848 (= res!94777 (= lt!174703 (bvsub lt!174702 lt!174704)))))

(assert (=> d!36848 (or (= (bvand lt!174702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174704 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174702 lt!174704) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36848 (= lt!174704 (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174469)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!174469))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!174469)))))))

(declare-fun lt!174706 () (_ BitVec 64))

(declare-fun lt!174705 () (_ BitVec 64))

(assert (=> d!36848 (= lt!174702 (bvmul lt!174706 lt!174705))))

(assert (=> d!36848 (or (= lt!174706 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!174705 (bvsdiv (bvmul lt!174706 lt!174705) lt!174706)))))

(assert (=> d!36848 (= lt!174705 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36848 (= lt!174706 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174469)))))))

(assert (=> d!36848 (= lt!174703 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!174469))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!174469)))))))

(assert (=> d!36848 (invariant!0 (currentBit!5365 (_2!4979 lt!174469)) (currentByte!5370 (_2!4979 lt!174469)) (size!2355 (buf!2763 (_2!4979 lt!174469))))))

(assert (=> d!36848 (= (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174469))) (currentByte!5370 (_2!4979 lt!174469)) (currentBit!5365 (_2!4979 lt!174469))) lt!174703)))

(declare-fun b!114715 () Bool)

(declare-fun res!94778 () Bool)

(assert (=> b!114715 (=> (not res!94778) (not e!75206))))

(assert (=> b!114715 (= res!94778 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!174703))))

(declare-fun b!114716 () Bool)

(declare-fun lt!174707 () (_ BitVec 64))

(assert (=> b!114716 (= e!75206 (bvsle lt!174703 (bvmul lt!174707 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114716 (or (= lt!174707 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!174707 #b0000000000000000000000000000000000000000000000000000000000001000) lt!174707)))))

(assert (=> b!114716 (= lt!174707 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174469)))))))

(assert (= (and d!36848 res!94777) b!114715))

(assert (= (and b!114715 res!94778) b!114716))

(declare-fun m!171381 () Bool)

(assert (=> d!36848 m!171381))

(declare-fun m!171383 () Bool)

(assert (=> d!36848 m!171383))

(assert (=> b!114636 d!36848))

(declare-fun d!36850 () Bool)

(assert (=> d!36850 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174452)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!173907))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!173907))) lt!174472) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174452)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!173907))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!173907)))) lt!174472))))

(declare-fun bs!8933 () Bool)

(assert (= bs!8933 d!36850))

(declare-fun m!171385 () Bool)

(assert (=> bs!8933 m!171385))

(assert (=> b!114636 d!36850))

(declare-fun d!36852 () Bool)

(declare-fun e!75208 () Bool)

(assert (=> d!36852 e!75208))

(declare-fun res!94781 () Bool)

(assert (=> d!36852 (=> (not res!94781) (not e!75208))))

(declare-fun lt!174725 () tuple2!9454)

(assert (=> d!36852 (= res!94781 (isPrefixOf!0 (_1!4992 lt!174725) (_2!4992 lt!174725)))))

(declare-fun lt!174715 () BitStream!4184)

(assert (=> d!36852 (= lt!174725 (tuple2!9455 lt!174715 (_2!4979 lt!174452)))))

(declare-fun lt!174708 () Unit!7031)

(declare-fun lt!174722 () Unit!7031)

(assert (=> d!36852 (= lt!174708 lt!174722)))

(assert (=> d!36852 (isPrefixOf!0 lt!174715 (_2!4979 lt!174452))))

(assert (=> d!36852 (= lt!174722 (lemmaIsPrefixTransitive!0 lt!174715 (_2!4979 lt!174452) (_2!4979 lt!174452)))))

(declare-fun lt!174717 () Unit!7031)

(declare-fun lt!174723 () Unit!7031)

(assert (=> d!36852 (= lt!174717 lt!174723)))

(assert (=> d!36852 (isPrefixOf!0 lt!174715 (_2!4979 lt!174452))))

(assert (=> d!36852 (= lt!174723 (lemmaIsPrefixTransitive!0 lt!174715 (_2!4979 lt!173907) (_2!4979 lt!174452)))))

(declare-fun lt!174716 () Unit!7031)

(declare-fun e!75207 () Unit!7031)

(assert (=> d!36852 (= lt!174716 e!75207)))

(declare-fun c!6958 () Bool)

(assert (=> d!36852 (= c!6958 (not (= (size!2355 (buf!2763 (_2!4979 lt!173907))) #b00000000000000000000000000000000)))))

(declare-fun lt!174724 () Unit!7031)

(declare-fun lt!174719 () Unit!7031)

(assert (=> d!36852 (= lt!174724 lt!174719)))

(assert (=> d!36852 (isPrefixOf!0 (_2!4979 lt!174452) (_2!4979 lt!174452))))

(assert (=> d!36852 (= lt!174719 (lemmaIsPrefixRefl!0 (_2!4979 lt!174452)))))

(declare-fun lt!174727 () Unit!7031)

(declare-fun lt!174710 () Unit!7031)

(assert (=> d!36852 (= lt!174727 lt!174710)))

(assert (=> d!36852 (= lt!174710 (lemmaIsPrefixRefl!0 (_2!4979 lt!174452)))))

(declare-fun lt!174712 () Unit!7031)

(declare-fun lt!174709 () Unit!7031)

(assert (=> d!36852 (= lt!174712 lt!174709)))

(assert (=> d!36852 (isPrefixOf!0 lt!174715 lt!174715)))

(assert (=> d!36852 (= lt!174709 (lemmaIsPrefixRefl!0 lt!174715))))

(declare-fun lt!174714 () Unit!7031)

(declare-fun lt!174711 () Unit!7031)

(assert (=> d!36852 (= lt!174714 lt!174711)))

(assert (=> d!36852 (isPrefixOf!0 (_2!4979 lt!173907) (_2!4979 lt!173907))))

(assert (=> d!36852 (= lt!174711 (lemmaIsPrefixRefl!0 (_2!4979 lt!173907)))))

(assert (=> d!36852 (= lt!174715 (BitStream!4185 (buf!2763 (_2!4979 lt!174452)) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))))))

(assert (=> d!36852 (isPrefixOf!0 (_2!4979 lt!173907) (_2!4979 lt!174452))))

(assert (=> d!36852 (= (reader!0 (_2!4979 lt!173907) (_2!4979 lt!174452)) lt!174725)))

(declare-fun b!114717 () Bool)

(declare-fun res!94779 () Bool)

(assert (=> b!114717 (=> (not res!94779) (not e!75208))))

(assert (=> b!114717 (= res!94779 (isPrefixOf!0 (_1!4992 lt!174725) (_2!4979 lt!173907)))))

(declare-fun b!114718 () Bool)

(declare-fun Unit!7058 () Unit!7031)

(assert (=> b!114718 (= e!75207 Unit!7058)))

(declare-fun lt!174721 () (_ BitVec 64))

(declare-fun lt!174726 () (_ BitVec 64))

(declare-fun b!114719 () Bool)

(assert (=> b!114719 (= e!75208 (= (_1!4992 lt!174725) (withMovedBitIndex!0 (_2!4992 lt!174725) (bvsub lt!174721 lt!174726))))))

(assert (=> b!114719 (or (= (bvand lt!174721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174726 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174721 lt!174726) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114719 (= lt!174726 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174452))) (currentByte!5370 (_2!4979 lt!174452)) (currentBit!5365 (_2!4979 lt!174452))))))

(assert (=> b!114719 (= lt!174721 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))))))

(declare-fun b!114720 () Bool)

(declare-fun lt!174718 () Unit!7031)

(assert (=> b!114720 (= e!75207 lt!174718)))

(declare-fun lt!174720 () (_ BitVec 64))

(assert (=> b!114720 (= lt!174720 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!174713 () (_ BitVec 64))

(assert (=> b!114720 (= lt!174713 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))))))

(assert (=> b!114720 (= lt!174718 (arrayBitRangesEqSymmetric!0 (buf!2763 (_2!4979 lt!173907)) (buf!2763 (_2!4979 lt!174452)) lt!174720 lt!174713))))

(assert (=> b!114720 (arrayBitRangesEq!0 (buf!2763 (_2!4979 lt!174452)) (buf!2763 (_2!4979 lt!173907)) lt!174720 lt!174713)))

(declare-fun b!114721 () Bool)

(declare-fun res!94780 () Bool)

(assert (=> b!114721 (=> (not res!94780) (not e!75208))))

(assert (=> b!114721 (= res!94780 (isPrefixOf!0 (_2!4992 lt!174725) (_2!4979 lt!174452)))))

(assert (= (and d!36852 c!6958) b!114720))

(assert (= (and d!36852 (not c!6958)) b!114718))

(assert (= (and d!36852 res!94781) b!114717))

(assert (= (and b!114717 res!94779) b!114721))

(assert (= (and b!114721 res!94780) b!114719))

(declare-fun m!171387 () Bool)

(assert (=> b!114719 m!171387))

(assert (=> b!114719 m!171097))

(assert (=> b!114719 m!170719))

(declare-fun m!171389 () Bool)

(assert (=> b!114717 m!171389))

(declare-fun m!171391 () Bool)

(assert (=> d!36852 m!171391))

(assert (=> d!36852 m!171229))

(assert (=> d!36852 m!171083))

(declare-fun m!171393 () Bool)

(assert (=> d!36852 m!171393))

(declare-fun m!171395 () Bool)

(assert (=> d!36852 m!171395))

(declare-fun m!171397 () Bool)

(assert (=> d!36852 m!171397))

(declare-fun m!171399 () Bool)

(assert (=> d!36852 m!171399))

(declare-fun m!171401 () Bool)

(assert (=> d!36852 m!171401))

(declare-fun m!171403 () Bool)

(assert (=> d!36852 m!171403))

(declare-fun m!171405 () Bool)

(assert (=> d!36852 m!171405))

(assert (=> d!36852 m!171247))

(declare-fun m!171407 () Bool)

(assert (=> b!114721 m!171407))

(assert (=> b!114720 m!170719))

(declare-fun m!171409 () Bool)

(assert (=> b!114720 m!171409))

(declare-fun m!171411 () Bool)

(assert (=> b!114720 m!171411))

(assert (=> b!114636 d!36852))

(declare-fun d!36854 () Bool)

(assert (=> d!36854 (isPrefixOf!0 (_2!4979 lt!173907) (_2!4979 lt!174452))))

(declare-fun lt!174728 () Unit!7031)

(assert (=> d!36854 (= lt!174728 (choose!30 (_2!4979 lt!173907) (_2!4979 lt!174469) (_2!4979 lt!174452)))))

(assert (=> d!36854 (isPrefixOf!0 (_2!4979 lt!173907) (_2!4979 lt!174469))))

(assert (=> d!36854 (= (lemmaIsPrefixTransitive!0 (_2!4979 lt!173907) (_2!4979 lt!174469) (_2!4979 lt!174452)) lt!174728)))

(declare-fun bs!8934 () Bool)

(assert (= bs!8934 d!36854))

(assert (=> bs!8934 m!171083))

(declare-fun m!171413 () Bool)

(assert (=> bs!8934 m!171413))

(declare-fun m!171415 () Bool)

(assert (=> bs!8934 m!171415))

(assert (=> b!114636 d!36854))

(declare-fun d!36856 () Bool)

(assert (=> d!36856 (= (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!114636 d!36856))

(declare-fun b!114733 () Bool)

(declare-fun res!94790 () Bool)

(declare-fun e!75218 () Bool)

(assert (=> b!114733 (=> (not res!94790) (not e!75218))))

(declare-fun _$19!111 () tuple2!9434)

(assert (=> b!114733 (= res!94790 (= (bitIndex!0 (size!2355 (buf!2763 (_2!4979 _$19!111))) (currentByte!5370 (_2!4979 _$19!111)) (currentBit!5365 (_2!4979 _$19!111))) (bvadd (bitIndex!0 (size!2355 (buf!2763 thiss!1305)) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!114734 () Bool)

(declare-fun res!94793 () Bool)

(assert (=> b!114734 (=> (not res!94793) (not e!75218))))

(assert (=> b!114734 (= res!94793 (isPrefixOf!0 thiss!1305 (_2!4979 _$19!111)))))

(declare-fun b!114735 () Bool)

(declare-fun e!75217 () Bool)

(declare-fun lt!174731 () tuple2!9436)

(assert (=> b!114735 (= e!75217 (= (bitIndex!0 (size!2355 (buf!2763 (_1!4980 lt!174731))) (currentByte!5370 (_1!4980 lt!174731)) (currentBit!5365 (_1!4980 lt!174731))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 _$19!111))) (currentByte!5370 (_2!4979 _$19!111)) (currentBit!5365 (_2!4979 _$19!111)))))))

(declare-fun b!114736 () Bool)

(assert (=> b!114736 (= e!75218 e!75217)))

(declare-fun res!94792 () Bool)

(assert (=> b!114736 (=> (not res!94792) (not e!75217))))

(assert (=> b!114736 (= res!94792 (and (= (_2!4980 lt!174731) lt!173909) (= (_1!4980 lt!174731) (_2!4979 _$19!111))))))

(assert (=> b!114736 (= lt!174731 (readBitPure!0 (readerFrom!0 (_2!4979 _$19!111) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305))))))

(declare-fun d!36858 () Bool)

(assert (=> d!36858 e!75218))

(declare-fun res!94791 () Bool)

(assert (=> d!36858 (=> (not res!94791) (not e!75218))))

(assert (=> d!36858 (= res!94791 (= (size!2355 (buf!2763 thiss!1305)) (size!2355 (buf!2763 (_2!4979 _$19!111)))))))

(declare-fun e!75220 () Bool)

(assert (=> d!36858 (and (inv!12 (_2!4979 _$19!111)) e!75220)))

(assert (=> d!36858 (= (choose!16 thiss!1305 lt!173909) _$19!111)))

(declare-fun b!114737 () Bool)

(assert (=> b!114737 (= e!75220 (array_inv!2157 (buf!2763 (_2!4979 _$19!111))))))

(assert (= d!36858 b!114737))

(assert (= (and d!36858 res!94791) b!114733))

(assert (= (and b!114733 res!94790) b!114734))

(assert (= (and b!114734 res!94793) b!114736))

(assert (= (and b!114736 res!94792) b!114735))

(declare-fun m!171417 () Bool)

(assert (=> b!114735 m!171417))

(declare-fun m!171419 () Bool)

(assert (=> b!114735 m!171419))

(declare-fun m!171421 () Bool)

(assert (=> b!114734 m!171421))

(declare-fun m!171423 () Bool)

(assert (=> b!114737 m!171423))

(assert (=> b!114733 m!171419))

(assert (=> b!114733 m!170721))

(declare-fun m!171425 () Bool)

(assert (=> b!114736 m!171425))

(assert (=> b!114736 m!171425))

(declare-fun m!171427 () Bool)

(assert (=> b!114736 m!171427))

(declare-fun m!171429 () Bool)

(assert (=> d!36858 m!171429))

(assert (=> d!36774 d!36858))

(declare-fun d!36860 () Bool)

(assert (=> d!36860 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2355 (buf!2763 thiss!1305))) ((_ sign_extend 32) (currentByte!5370 thiss!1305)) ((_ sign_extend 32) (currentBit!5365 thiss!1305))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 thiss!1305))) ((_ sign_extend 32) (currentByte!5370 thiss!1305)) ((_ sign_extend 32) (currentBit!5365 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!8935 () Bool)

(assert (= bs!8935 d!36860))

(assert (=> bs!8935 m!170837))

(assert (=> d!36774 d!36860))

(declare-fun d!36862 () Bool)

(assert (=> d!36862 (= (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!173907)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!173907))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!173907)))) (bvsub (bvmul ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!173907)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!173907))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!173907))))))))

(assert (=> d!36776 d!36862))

(declare-fun d!36864 () Bool)

(assert (=> d!36864 (= (invariant!0 (currentBit!5365 (_2!4979 lt!173907)) (currentByte!5370 (_2!4979 lt!173907)) (size!2355 (buf!2763 (_2!4979 lt!173907)))) (and (bvsge (currentBit!5365 (_2!4979 lt!173907)) #b00000000000000000000000000000000) (bvslt (currentBit!5365 (_2!4979 lt!173907)) #b00000000000000000000000000001000) (bvsge (currentByte!5370 (_2!4979 lt!173907)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5370 (_2!4979 lt!173907)) (size!2355 (buf!2763 (_2!4979 lt!173907)))) (and (= (currentBit!5365 (_2!4979 lt!173907)) #b00000000000000000000000000000000) (= (currentByte!5370 (_2!4979 lt!173907)) (size!2355 (buf!2763 (_2!4979 lt!173907))))))))))

(assert (=> d!36776 d!36864))

(declare-fun d!36866 () Bool)

(assert (=> d!36866 (= (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 thiss!1305))) ((_ sign_extend 32) (currentByte!5370 thiss!1305)) ((_ sign_extend 32) (currentBit!5365 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2355 (buf!2763 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5370 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5365 thiss!1305)))))))

(assert (=> d!36778 d!36866))

(assert (=> d!36778 d!36798))

(declare-fun d!36868 () Bool)

(assert (=> d!36868 (= (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!173907)))) ((_ sign_extend 32) (currentByte!5370 thiss!1305)) ((_ sign_extend 32) (currentBit!5365 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!173907)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5370 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5365 thiss!1305)))))))

(assert (=> d!36734 d!36868))

(assert (=> d!36734 d!36726))

(declare-fun d!36870 () Bool)

(declare-fun e!75227 () Bool)

(assert (=> d!36870 e!75227))

(declare-fun res!94796 () Bool)

(assert (=> d!36870 (=> (not res!94796) (not e!75227))))

(declare-fun increaseBitIndex!0 (BitStream!4184) tuple2!9434)

(assert (=> d!36870 (= res!94796 (= (buf!2763 (_2!4979 (increaseBitIndex!0 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305))))) (buf!2763 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305)))))))

(declare-fun lt!174749 () Bool)

(assert (=> d!36870 (= lt!174749 (not (= (bvand ((_ sign_extend 24) (select (arr!2948 (buf!2763 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305)))) (currentByte!5370 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5365 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!174752 () tuple2!9450)

(assert (=> d!36870 (= lt!174752 (tuple2!9451 (not (= (bvand ((_ sign_extend 24) (select (arr!2948 (buf!2763 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305)))) (currentByte!5370 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5365 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!4979 (increaseBitIndex!0 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305))))))))

(assert (=> d!36870 (validate_offset_bit!0 ((_ sign_extend 32) (size!2355 (buf!2763 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305))))) ((_ sign_extend 32) (currentByte!5370 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305)))) ((_ sign_extend 32) (currentBit!5365 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305)))))))

(assert (=> d!36870 (= (readBit!0 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305))) lt!174752)))

(declare-fun lt!174747 () (_ BitVec 64))

(declare-fun b!114740 () Bool)

(declare-fun lt!174751 () (_ BitVec 64))

(assert (=> b!114740 (= e!75227 (= (bitIndex!0 (size!2355 (buf!2763 (_2!4979 (increaseBitIndex!0 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305)))))) (currentByte!5370 (_2!4979 (increaseBitIndex!0 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305))))) (currentBit!5365 (_2!4979 (increaseBitIndex!0 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305)))))) (bvadd lt!174747 lt!174751)))))

(assert (=> b!114740 (or (not (= (bvand lt!174747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174751 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!174747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!174747 lt!174751) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114740 (= lt!174751 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!114740 (= lt!174747 (bitIndex!0 (size!2355 (buf!2763 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305)))) (currentByte!5370 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305))) (currentBit!5365 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305)))))))

(declare-fun lt!174748 () Bool)

(assert (=> b!114740 (= lt!174748 (not (= (bvand ((_ sign_extend 24) (select (arr!2948 (buf!2763 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305)))) (currentByte!5370 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5365 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!174746 () Bool)

(assert (=> b!114740 (= lt!174746 (not (= (bvand ((_ sign_extend 24) (select (arr!2948 (buf!2763 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305)))) (currentByte!5370 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5365 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!174750 () Bool)

(assert (=> b!114740 (= lt!174750 (not (= (bvand ((_ sign_extend 24) (select (arr!2948 (buf!2763 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305)))) (currentByte!5370 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5365 (readerFrom!0 (_2!4979 lt!173907) (currentBit!5365 thiss!1305) (currentByte!5370 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!36870 res!94796) b!114740))

(assert (=> d!36870 m!170725))

(declare-fun m!171431 () Bool)

(assert (=> d!36870 m!171431))

(declare-fun m!171433 () Bool)

(assert (=> d!36870 m!171433))

(declare-fun m!171435 () Bool)

(assert (=> d!36870 m!171435))

(declare-fun m!171437 () Bool)

(assert (=> d!36870 m!171437))

(assert (=> b!114740 m!170725))

(assert (=> b!114740 m!171431))

(declare-fun m!171439 () Bool)

(assert (=> b!114740 m!171439))

(declare-fun m!171441 () Bool)

(assert (=> b!114740 m!171441))

(assert (=> b!114740 m!171433))

(assert (=> b!114740 m!171435))

(assert (=> d!36736 d!36870))

(declare-fun d!36872 () Bool)

(declare-fun res!94798 () Bool)

(declare-fun e!75229 () Bool)

(assert (=> d!36872 (=> (not res!94798) (not e!75229))))

(assert (=> d!36872 (= res!94798 (= (size!2355 (buf!2763 (_2!4979 lt!173907))) (size!2355 (buf!2763 (_2!4979 lt!174474)))))))

(assert (=> d!36872 (= (isPrefixOf!0 (_2!4979 lt!173907) (_2!4979 lt!174474)) e!75229)))

(declare-fun b!114741 () Bool)

(declare-fun res!94797 () Bool)

(assert (=> b!114741 (=> (not res!94797) (not e!75229))))

(assert (=> b!114741 (= res!94797 (bvsle (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))) (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174474))) (currentByte!5370 (_2!4979 lt!174474)) (currentBit!5365 (_2!4979 lt!174474)))))))

(declare-fun b!114742 () Bool)

(declare-fun e!75228 () Bool)

(assert (=> b!114742 (= e!75229 e!75228)))

(declare-fun res!94799 () Bool)

(assert (=> b!114742 (=> res!94799 e!75228)))

(assert (=> b!114742 (= res!94799 (= (size!2355 (buf!2763 (_2!4979 lt!173907))) #b00000000000000000000000000000000))))

(declare-fun b!114743 () Bool)

(assert (=> b!114743 (= e!75228 (arrayBitRangesEq!0 (buf!2763 (_2!4979 lt!173907)) (buf!2763 (_2!4979 lt!174474)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907)))))))

(assert (= (and d!36872 res!94798) b!114741))

(assert (= (and b!114741 res!94797) b!114742))

(assert (= (and b!114742 (not res!94799)) b!114743))

(assert (=> b!114741 m!170719))

(assert (=> b!114741 m!171131))

(assert (=> b!114743 m!170719))

(assert (=> b!114743 m!170719))

(declare-fun m!171443 () Bool)

(assert (=> b!114743 m!171443))

(assert (=> b!114633 d!36872))

(declare-fun d!36874 () Bool)

(assert (=> d!36874 (= (byteRangesEq!0 (select (arr!2948 (buf!2763 (_2!4979 lt!173907))) (_4!43 lt!173988)) (select (arr!2948 (buf!2763 (_2!4979 lt!173904))) (_4!43 lt!173988)) #b00000000000000000000000000000000 lt!173989) (or (= #b00000000000000000000000000000000 lt!173989) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2948 (buf!2763 (_2!4979 lt!173907))) (_4!43 lt!173988))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!173989))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2948 (buf!2763 (_2!4979 lt!173904))) (_4!43 lt!173988))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!173989))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!8936 () Bool)

(assert (= bs!8936 d!36874))

(declare-fun m!171445 () Bool)

(assert (=> bs!8936 m!171445))

(declare-fun m!171447 () Bool)

(assert (=> bs!8936 m!171447))

(assert (=> b!114438 d!36874))

(declare-fun d!36876 () Bool)

(assert (=> d!36876 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!173907)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!173907))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!173907))) lt!174461) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!173907)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!173907))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!173907)))) lt!174461))))

(declare-fun bs!8937 () Bool)

(assert (= bs!8937 d!36876))

(assert (=> bs!8937 m!171161))

(assert (=> b!114634 d!36876))

(declare-fun d!36878 () Bool)

(assert (=> d!36878 (isPrefixOf!0 lt!174436 lt!174436)))

(declare-fun lt!174755 () Unit!7031)

(declare-fun choose!11 (BitStream!4184) Unit!7031)

(assert (=> d!36878 (= lt!174755 (choose!11 lt!174436))))

(assert (=> d!36878 (= (lemmaIsPrefixRefl!0 lt!174436) lt!174755)))

(declare-fun bs!8939 () Bool)

(assert (= bs!8939 d!36878))

(declare-fun m!171449 () Bool)

(assert (=> bs!8939 m!171449))

(declare-fun m!171451 () Bool)

(assert (=> bs!8939 m!171451))

(assert (=> b!114632 d!36878))

(declare-fun d!36880 () Bool)

(assert (=> d!36880 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305)))) (tuple4!87 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!114437 d!36880))

(declare-fun d!36882 () Bool)

(declare-fun res!94804 () Bool)

(declare-fun e!75234 () Bool)

(assert (=> d!36882 (=> res!94804 e!75234)))

(assert (=> d!36882 (= res!94804 (= (_1!4988 lt!173988) (_2!4988 lt!173988)))))

(assert (=> d!36882 (= (arrayRangesEq!44 (buf!2763 (_2!4979 lt!173907)) (buf!2763 (_2!4979 lt!173904)) (_1!4988 lt!173988) (_2!4988 lt!173988)) e!75234)))

(declare-fun b!114748 () Bool)

(declare-fun e!75235 () Bool)

(assert (=> b!114748 (= e!75234 e!75235)))

(declare-fun res!94805 () Bool)

(assert (=> b!114748 (=> (not res!94805) (not e!75235))))

(assert (=> b!114748 (= res!94805 (= (select (arr!2948 (buf!2763 (_2!4979 lt!173907))) (_1!4988 lt!173988)) (select (arr!2948 (buf!2763 (_2!4979 lt!173904))) (_1!4988 lt!173988))))))

(declare-fun b!114749 () Bool)

(assert (=> b!114749 (= e!75235 (arrayRangesEq!44 (buf!2763 (_2!4979 lt!173907)) (buf!2763 (_2!4979 lt!173904)) (bvadd (_1!4988 lt!173988) #b00000000000000000000000000000001) (_2!4988 lt!173988)))))

(assert (= (and d!36882 (not res!94804)) b!114748))

(assert (= (and b!114748 res!94805) b!114749))

(declare-fun m!171453 () Bool)

(assert (=> b!114748 m!171453))

(declare-fun m!171455 () Bool)

(assert (=> b!114748 m!171455))

(declare-fun m!171457 () Bool)

(assert (=> b!114749 m!171457))

(assert (=> b!114436 d!36882))

(declare-fun lt!174756 () tuple4!86)

(declare-fun b!114750 () Bool)

(declare-fun e!75241 () Bool)

(assert (=> b!114750 (= e!75241 (arrayRangesEq!44 (buf!2763 thiss!1305) (buf!2763 (_2!4979 lt!173904)) (_1!4988 lt!174756) (_2!4988 lt!174756)))))

(declare-fun lt!174757 () (_ BitVec 32))

(declare-fun b!114752 () Bool)

(declare-fun e!75240 () Bool)

(assert (=> b!114752 (= e!75240 (byteRangesEq!0 (select (arr!2948 (buf!2763 thiss!1305)) (_4!43 lt!174756)) (select (arr!2948 (buf!2763 (_2!4979 lt!173904))) (_4!43 lt!174756)) #b00000000000000000000000000000000 lt!174757))))

(declare-fun b!114753 () Bool)

(declare-fun e!75237 () Bool)

(declare-fun e!75236 () Bool)

(assert (=> b!114753 (= e!75237 e!75236)))

(declare-fun res!94810 () Bool)

(declare-fun call!1486 () Bool)

(assert (=> b!114753 (= res!94810 call!1486)))

(assert (=> b!114753 (=> (not res!94810) (not e!75236))))

(declare-fun b!114754 () Bool)

(declare-fun res!94807 () Bool)

(assert (=> b!114754 (= res!94807 (= lt!174757 #b00000000000000000000000000000000))))

(assert (=> b!114754 (=> res!94807 e!75240)))

(assert (=> b!114754 (= e!75236 e!75240)))

(declare-fun b!114755 () Bool)

(declare-fun e!75238 () Bool)

(assert (=> b!114755 (= e!75238 e!75237)))

(declare-fun c!6959 () Bool)

(assert (=> b!114755 (= c!6959 (= (_3!264 lt!174756) (_4!43 lt!174756)))))

(declare-fun d!36884 () Bool)

(declare-fun res!94809 () Bool)

(declare-fun e!75239 () Bool)

(assert (=> d!36884 (=> res!94809 e!75239)))

(assert (=> d!36884 (= res!94809 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2355 (buf!2763 thiss!1305)) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305))))))

(assert (=> d!36884 (= (arrayBitRangesEq!0 (buf!2763 thiss!1305) (buf!2763 (_2!4979 lt!173904)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2355 (buf!2763 thiss!1305)) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305))) e!75239)))

(declare-fun b!114751 () Bool)

(assert (=> b!114751 (= e!75239 e!75238)))

(declare-fun res!94808 () Bool)

(assert (=> b!114751 (=> (not res!94808) (not e!75238))))

(assert (=> b!114751 (= res!94808 e!75241)))

(declare-fun res!94806 () Bool)

(assert (=> b!114751 (=> res!94806 e!75241)))

(assert (=> b!114751 (= res!94806 (bvsge (_1!4988 lt!174756) (_2!4988 lt!174756)))))

(assert (=> b!114751 (= lt!174757 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2355 (buf!2763 thiss!1305)) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!174758 () (_ BitVec 32))

(assert (=> b!114751 (= lt!174758 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114751 (= lt!174756 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2355 (buf!2763 thiss!1305)) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305))))))

(declare-fun bm!1483 () Bool)

(assert (=> bm!1483 (= call!1486 (byteRangesEq!0 (select (arr!2948 (buf!2763 thiss!1305)) (_3!264 lt!174756)) (select (arr!2948 (buf!2763 (_2!4979 lt!173904))) (_3!264 lt!174756)) lt!174758 (ite c!6959 lt!174757 #b00000000000000000000000000001000)))))

(declare-fun b!114756 () Bool)

(assert (=> b!114756 (= e!75237 call!1486)))

(assert (= (and d!36884 (not res!94809)) b!114751))

(assert (= (and b!114751 (not res!94806)) b!114750))

(assert (= (and b!114751 res!94808) b!114755))

(assert (= (and b!114755 c!6959) b!114756))

(assert (= (and b!114755 (not c!6959)) b!114753))

(assert (= (and b!114753 res!94810) b!114754))

(assert (= (and b!114754 (not res!94807)) b!114752))

(assert (= (or b!114756 b!114753) bm!1483))

(declare-fun m!171459 () Bool)

(assert (=> b!114750 m!171459))

(declare-fun m!171461 () Bool)

(assert (=> b!114752 m!171461))

(declare-fun m!171463 () Bool)

(assert (=> b!114752 m!171463))

(assert (=> b!114752 m!171461))

(assert (=> b!114752 m!171463))

(declare-fun m!171465 () Bool)

(assert (=> b!114752 m!171465))

(assert (=> b!114751 m!170721))

(declare-fun m!171467 () Bool)

(assert (=> b!114751 m!171467))

(declare-fun m!171469 () Bool)

(assert (=> bm!1483 m!171469))

(declare-fun m!171471 () Bool)

(assert (=> bm!1483 m!171471))

(assert (=> bm!1483 m!171469))

(assert (=> bm!1483 m!171471))

(declare-fun m!171473 () Bool)

(assert (=> bm!1483 m!171473))

(assert (=> b!114465 d!36884))

(assert (=> b!114465 d!36778))

(assert (=> d!36782 d!36868))

(declare-fun d!36886 () Bool)

(declare-fun res!94812 () Bool)

(declare-fun e!75243 () Bool)

(assert (=> d!36886 (=> (not res!94812) (not e!75243))))

(assert (=> d!36886 (= res!94812 (= (size!2355 (buf!2763 (ite c!6952 (_2!4979 lt!173907) lt!174436))) (size!2355 (buf!2763 (ite c!6952 (_2!4979 lt!174477) lt!174436)))))))

(assert (=> d!36886 (= (isPrefixOf!0 (ite c!6952 (_2!4979 lt!173907) lt!174436) (ite c!6952 (_2!4979 lt!174477) lt!174436)) e!75243)))

(declare-fun b!114757 () Bool)

(declare-fun res!94811 () Bool)

(assert (=> b!114757 (=> (not res!94811) (not e!75243))))

(assert (=> b!114757 (= res!94811 (bvsle (bitIndex!0 (size!2355 (buf!2763 (ite c!6952 (_2!4979 lt!173907) lt!174436))) (currentByte!5370 (ite c!6952 (_2!4979 lt!173907) lt!174436)) (currentBit!5365 (ite c!6952 (_2!4979 lt!173907) lt!174436))) (bitIndex!0 (size!2355 (buf!2763 (ite c!6952 (_2!4979 lt!174477) lt!174436))) (currentByte!5370 (ite c!6952 (_2!4979 lt!174477) lt!174436)) (currentBit!5365 (ite c!6952 (_2!4979 lt!174477) lt!174436)))))))

(declare-fun b!114758 () Bool)

(declare-fun e!75242 () Bool)

(assert (=> b!114758 (= e!75243 e!75242)))

(declare-fun res!94813 () Bool)

(assert (=> b!114758 (=> res!94813 e!75242)))

(assert (=> b!114758 (= res!94813 (= (size!2355 (buf!2763 (ite c!6952 (_2!4979 lt!173907) lt!174436))) #b00000000000000000000000000000000))))

(declare-fun b!114759 () Bool)

(assert (=> b!114759 (= e!75242 (arrayBitRangesEq!0 (buf!2763 (ite c!6952 (_2!4979 lt!173907) lt!174436)) (buf!2763 (ite c!6952 (_2!4979 lt!174477) lt!174436)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2355 (buf!2763 (ite c!6952 (_2!4979 lt!173907) lt!174436))) (currentByte!5370 (ite c!6952 (_2!4979 lt!173907) lt!174436)) (currentBit!5365 (ite c!6952 (_2!4979 lt!173907) lt!174436)))))))

(assert (= (and d!36886 res!94812) b!114757))

(assert (= (and b!114757 res!94811) b!114758))

(assert (= (and b!114758 (not res!94813)) b!114759))

(declare-fun m!171475 () Bool)

(assert (=> b!114757 m!171475))

(declare-fun m!171477 () Bool)

(assert (=> b!114757 m!171477))

(assert (=> b!114759 m!171475))

(assert (=> b!114759 m!171475))

(declare-fun m!171479 () Bool)

(assert (=> b!114759 m!171479))

(assert (=> bm!1481 d!36886))

(declare-fun d!36888 () Bool)

(declare-fun lt!174759 () tuple2!9450)

(assert (=> d!36888 (= lt!174759 (readBit!0 (readerFrom!0 (_2!4979 lt!174477) (currentBit!5365 (_2!4979 lt!173907)) (currentByte!5370 (_2!4979 lt!173907)))))))

(assert (=> d!36888 (= (readBitPure!0 (readerFrom!0 (_2!4979 lt!174477) (currentBit!5365 (_2!4979 lt!173907)) (currentByte!5370 (_2!4979 lt!173907)))) (tuple2!9437 (_2!4990 lt!174759) (_1!4990 lt!174759)))))

(declare-fun bs!8940 () Bool)

(assert (= bs!8940 d!36888))

(assert (=> bs!8940 m!171127))

(declare-fun m!171481 () Bool)

(assert (=> bs!8940 m!171481))

(assert (=> b!114630 d!36888))

(declare-fun d!36890 () Bool)

(declare-fun e!75244 () Bool)

(assert (=> d!36890 e!75244))

(declare-fun res!94814 () Bool)

(assert (=> d!36890 (=> (not res!94814) (not e!75244))))

(assert (=> d!36890 (= res!94814 (invariant!0 (currentBit!5365 (_2!4979 lt!174477)) (currentByte!5370 (_2!4979 lt!174477)) (size!2355 (buf!2763 (_2!4979 lt!174477)))))))

(assert (=> d!36890 (= (readerFrom!0 (_2!4979 lt!174477) (currentBit!5365 (_2!4979 lt!173907)) (currentByte!5370 (_2!4979 lt!173907))) (BitStream!4185 (buf!2763 (_2!4979 lt!174477)) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))))))

(declare-fun b!114760 () Bool)

(assert (=> b!114760 (= e!75244 (invariant!0 (currentBit!5365 (_2!4979 lt!173907)) (currentByte!5370 (_2!4979 lt!173907)) (size!2355 (buf!2763 (_2!4979 lt!174477)))))))

(assert (= (and d!36890 res!94814) b!114760))

(declare-fun m!171483 () Bool)

(assert (=> d!36890 m!171483))

(declare-fun m!171485 () Bool)

(assert (=> b!114760 m!171485))

(assert (=> b!114630 d!36890))

(assert (=> b!114463 d!36778))

(declare-fun d!36892 () Bool)

(declare-fun e!75245 () Bool)

(assert (=> d!36892 e!75245))

(declare-fun res!94815 () Bool)

(assert (=> d!36892 (=> (not res!94815) (not e!75245))))

(declare-fun lt!174762 () (_ BitVec 64))

(declare-fun lt!174760 () (_ BitVec 64))

(declare-fun lt!174761 () (_ BitVec 64))

(assert (=> d!36892 (= res!94815 (= lt!174761 (bvsub lt!174760 lt!174762)))))

(assert (=> d!36892 (or (= (bvand lt!174760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174762 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174760 lt!174762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36892 (= lt!174762 (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!173904)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!173904))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!173904)))))))

(declare-fun lt!174764 () (_ BitVec 64))

(declare-fun lt!174763 () (_ BitVec 64))

(assert (=> d!36892 (= lt!174760 (bvmul lt!174764 lt!174763))))

(assert (=> d!36892 (or (= lt!174764 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!174763 (bvsdiv (bvmul lt!174764 lt!174763) lt!174764)))))

(assert (=> d!36892 (= lt!174763 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36892 (= lt!174764 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!173904)))))))

(assert (=> d!36892 (= lt!174761 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!173904))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!173904)))))))

(assert (=> d!36892 (invariant!0 (currentBit!5365 (_2!4979 lt!173904)) (currentByte!5370 (_2!4979 lt!173904)) (size!2355 (buf!2763 (_2!4979 lt!173904))))))

(assert (=> d!36892 (= (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173904))) (currentByte!5370 (_2!4979 lt!173904)) (currentBit!5365 (_2!4979 lt!173904))) lt!174761)))

(declare-fun b!114761 () Bool)

(declare-fun res!94816 () Bool)

(assert (=> b!114761 (=> (not res!94816) (not e!75245))))

(assert (=> b!114761 (= res!94816 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!174761))))

(declare-fun b!114762 () Bool)

(declare-fun lt!174765 () (_ BitVec 64))

(assert (=> b!114762 (= e!75245 (bvsle lt!174761 (bvmul lt!174765 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114762 (or (= lt!174765 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!174765 #b0000000000000000000000000000000000000000000000000000000000001000) lt!174765)))))

(assert (=> b!114762 (= lt!174765 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!173904)))))))

(assert (= (and d!36892 res!94815) b!114761))

(assert (= (and b!114761 res!94816) b!114762))

(declare-fun m!171487 () Bool)

(assert (=> d!36892 m!171487))

(declare-fun m!171489 () Bool)

(assert (=> d!36892 m!171489))

(assert (=> b!114463 d!36892))

(declare-fun d!36894 () Bool)

(declare-fun e!75246 () Bool)

(assert (=> d!36894 e!75246))

(declare-fun res!94817 () Bool)

(assert (=> d!36894 (=> (not res!94817) (not e!75246))))

(declare-fun lt!174766 () (_ BitVec 64))

(declare-fun lt!174767 () (_ BitVec 64))

(declare-fun lt!174768 () (_ BitVec 64))

(assert (=> d!36894 (= res!94817 (= lt!174767 (bvsub lt!174766 lt!174768)))))

(assert (=> d!36894 (or (= (bvand lt!174766 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174768 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174766 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174766 lt!174768) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36894 (= lt!174768 (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174477)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!174477))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!174477)))))))

(declare-fun lt!174770 () (_ BitVec 64))

(declare-fun lt!174769 () (_ BitVec 64))

(assert (=> d!36894 (= lt!174766 (bvmul lt!174770 lt!174769))))

(assert (=> d!36894 (or (= lt!174770 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!174769 (bvsdiv (bvmul lt!174770 lt!174769) lt!174770)))))

(assert (=> d!36894 (= lt!174769 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36894 (= lt!174770 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174477)))))))

(assert (=> d!36894 (= lt!174767 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!174477))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!174477)))))))

(assert (=> d!36894 (invariant!0 (currentBit!5365 (_2!4979 lt!174477)) (currentByte!5370 (_2!4979 lt!174477)) (size!2355 (buf!2763 (_2!4979 lt!174477))))))

(assert (=> d!36894 (= (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174477))) (currentByte!5370 (_2!4979 lt!174477)) (currentBit!5365 (_2!4979 lt!174477))) lt!174767)))

(declare-fun b!114763 () Bool)

(declare-fun res!94818 () Bool)

(assert (=> b!114763 (=> (not res!94818) (not e!75246))))

(assert (=> b!114763 (= res!94818 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!174767))))

(declare-fun b!114764 () Bool)

(declare-fun lt!174771 () (_ BitVec 64))

(assert (=> b!114764 (= e!75246 (bvsle lt!174767 (bvmul lt!174771 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114764 (or (= lt!174771 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!174771 #b0000000000000000000000000000000000000000000000000000000000001000) lt!174771)))))

(assert (=> b!114764 (= lt!174771 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174477)))))))

(assert (= (and d!36894 res!94817) b!114763))

(assert (= (and b!114763 res!94818) b!114764))

(declare-fun m!171491 () Bool)

(assert (=> d!36894 m!171491))

(assert (=> d!36894 m!171483))

(assert (=> b!114629 d!36894))

(assert (=> b!114629 d!36776))

(declare-fun d!36896 () Bool)

(assert (=> d!36896 (= (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_1!4980 lt!173908)))) ((_ sign_extend 32) (currentByte!5370 (_1!4980 lt!173908))) ((_ sign_extend 32) (currentBit!5365 (_1!4980 lt!173908)))) (bvsub (bvmul ((_ sign_extend 32) (size!2355 (buf!2763 (_1!4980 lt!173908)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5370 (_1!4980 lt!173908))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5365 (_1!4980 lt!173908))))))))

(assert (=> d!36746 d!36896))

(declare-fun d!36898 () Bool)

(assert (=> d!36898 (= (invariant!0 (currentBit!5365 (_1!4980 lt!173908)) (currentByte!5370 (_1!4980 lt!173908)) (size!2355 (buf!2763 (_1!4980 lt!173908)))) (and (bvsge (currentBit!5365 (_1!4980 lt!173908)) #b00000000000000000000000000000000) (bvslt (currentBit!5365 (_1!4980 lt!173908)) #b00000000000000000000000000001000) (bvsge (currentByte!5370 (_1!4980 lt!173908)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5370 (_1!4980 lt!173908)) (size!2355 (buf!2763 (_1!4980 lt!173908)))) (and (= (currentBit!5365 (_1!4980 lt!173908)) #b00000000000000000000000000000000) (= (currentByte!5370 (_1!4980 lt!173908)) (size!2355 (buf!2763 (_1!4980 lt!173908))))))))))

(assert (=> d!36746 d!36898))

(declare-fun lt!174772 () tuple2!9456)

(declare-fun d!36900 () Bool)

(assert (=> d!36900 (= lt!174772 (readNLeastSignificantBitsLoop!0 (_1!4992 lt!174464) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174458))))

(assert (=> d!36900 (= (readNLeastSignificantBitsLoopPure!0 (_1!4992 lt!174464) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174458) (tuple2!9453 (_2!4993 lt!174772) (_1!4993 lt!174772)))))

(declare-fun bs!8941 () Bool)

(assert (= bs!8941 d!36900))

(declare-fun m!171493 () Bool)

(assert (=> bs!8941 m!171493))

(assert (=> b!114626 d!36900))

(declare-fun d!36902 () Bool)

(assert (=> d!36902 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174474)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!173907))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!173907))) lt!174461) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174474)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!173907))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!173907)))) lt!174461))))

(declare-fun bs!8942 () Bool)

(assert (= bs!8942 d!36902))

(declare-fun m!171495 () Bool)

(assert (=> bs!8942 m!171495))

(assert (=> b!114626 d!36902))

(assert (=> b!114626 d!36856))

(declare-fun d!36904 () Bool)

(assert (=> d!36904 (validate_offset_bits!1 ((_ sign_extend 32) (size!2355 (buf!2763 (_2!4979 lt!174474)))) ((_ sign_extend 32) (currentByte!5370 (_2!4979 lt!173907))) ((_ sign_extend 32) (currentBit!5365 (_2!4979 lt!173907))) lt!174461)))

(declare-fun lt!174773 () Unit!7031)

(assert (=> d!36904 (= lt!174773 (choose!9 (_2!4979 lt!173907) (buf!2763 (_2!4979 lt!174474)) lt!174461 (BitStream!4185 (buf!2763 (_2!4979 lt!174474)) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907)))))))

(assert (=> d!36904 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4979 lt!173907) (buf!2763 (_2!4979 lt!174474)) lt!174461) lt!174773)))

(declare-fun bs!8943 () Bool)

(assert (= bs!8943 d!36904))

(assert (=> bs!8943 m!171139))

(declare-fun m!171497 () Bool)

(assert (=> bs!8943 m!171497))

(assert (=> b!114626 d!36904))

(declare-fun d!36906 () Bool)

(declare-fun e!75248 () Bool)

(assert (=> d!36906 e!75248))

(declare-fun res!94821 () Bool)

(assert (=> d!36906 (=> (not res!94821) (not e!75248))))

(declare-fun lt!174791 () tuple2!9454)

(assert (=> d!36906 (= res!94821 (isPrefixOf!0 (_1!4992 lt!174791) (_2!4992 lt!174791)))))

(declare-fun lt!174781 () BitStream!4184)

(assert (=> d!36906 (= lt!174791 (tuple2!9455 lt!174781 (_2!4979 lt!174474)))))

(declare-fun lt!174774 () Unit!7031)

(declare-fun lt!174788 () Unit!7031)

(assert (=> d!36906 (= lt!174774 lt!174788)))

(assert (=> d!36906 (isPrefixOf!0 lt!174781 (_2!4979 lt!174474))))

(assert (=> d!36906 (= lt!174788 (lemmaIsPrefixTransitive!0 lt!174781 (_2!4979 lt!174474) (_2!4979 lt!174474)))))

(declare-fun lt!174783 () Unit!7031)

(declare-fun lt!174789 () Unit!7031)

(assert (=> d!36906 (= lt!174783 lt!174789)))

(assert (=> d!36906 (isPrefixOf!0 lt!174781 (_2!4979 lt!174474))))

(assert (=> d!36906 (= lt!174789 (lemmaIsPrefixTransitive!0 lt!174781 (_2!4979 lt!173907) (_2!4979 lt!174474)))))

(declare-fun lt!174782 () Unit!7031)

(declare-fun e!75247 () Unit!7031)

(assert (=> d!36906 (= lt!174782 e!75247)))

(declare-fun c!6960 () Bool)

(assert (=> d!36906 (= c!6960 (not (= (size!2355 (buf!2763 (_2!4979 lt!173907))) #b00000000000000000000000000000000)))))

(declare-fun lt!174790 () Unit!7031)

(declare-fun lt!174785 () Unit!7031)

(assert (=> d!36906 (= lt!174790 lt!174785)))

(assert (=> d!36906 (isPrefixOf!0 (_2!4979 lt!174474) (_2!4979 lt!174474))))

(assert (=> d!36906 (= lt!174785 (lemmaIsPrefixRefl!0 (_2!4979 lt!174474)))))

(declare-fun lt!174793 () Unit!7031)

(declare-fun lt!174776 () Unit!7031)

(assert (=> d!36906 (= lt!174793 lt!174776)))

(assert (=> d!36906 (= lt!174776 (lemmaIsPrefixRefl!0 (_2!4979 lt!174474)))))

(declare-fun lt!174778 () Unit!7031)

(declare-fun lt!174775 () Unit!7031)

(assert (=> d!36906 (= lt!174778 lt!174775)))

(assert (=> d!36906 (isPrefixOf!0 lt!174781 lt!174781)))

(assert (=> d!36906 (= lt!174775 (lemmaIsPrefixRefl!0 lt!174781))))

(declare-fun lt!174780 () Unit!7031)

(declare-fun lt!174777 () Unit!7031)

(assert (=> d!36906 (= lt!174780 lt!174777)))

(assert (=> d!36906 (isPrefixOf!0 (_2!4979 lt!173907) (_2!4979 lt!173907))))

(assert (=> d!36906 (= lt!174777 (lemmaIsPrefixRefl!0 (_2!4979 lt!173907)))))

(assert (=> d!36906 (= lt!174781 (BitStream!4185 (buf!2763 (_2!4979 lt!174474)) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))))))

(assert (=> d!36906 (isPrefixOf!0 (_2!4979 lt!173907) (_2!4979 lt!174474))))

(assert (=> d!36906 (= (reader!0 (_2!4979 lt!173907) (_2!4979 lt!174474)) lt!174791)))

(declare-fun b!114765 () Bool)

(declare-fun res!94819 () Bool)

(assert (=> b!114765 (=> (not res!94819) (not e!75248))))

(assert (=> b!114765 (= res!94819 (isPrefixOf!0 (_1!4992 lt!174791) (_2!4979 lt!173907)))))

(declare-fun b!114766 () Bool)

(declare-fun Unit!7059 () Unit!7031)

(assert (=> b!114766 (= e!75247 Unit!7059)))

(declare-fun lt!174792 () (_ BitVec 64))

(declare-fun b!114767 () Bool)

(declare-fun lt!174787 () (_ BitVec 64))

(assert (=> b!114767 (= e!75248 (= (_1!4992 lt!174791) (withMovedBitIndex!0 (_2!4992 lt!174791) (bvsub lt!174787 lt!174792))))))

(assert (=> b!114767 (or (= (bvand lt!174787 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174792 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174787 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174787 lt!174792) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114767 (= lt!174792 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!174474))) (currentByte!5370 (_2!4979 lt!174474)) (currentBit!5365 (_2!4979 lt!174474))))))

(assert (=> b!114767 (= lt!174787 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))))))

(declare-fun b!114768 () Bool)

(declare-fun lt!174784 () Unit!7031)

(assert (=> b!114768 (= e!75247 lt!174784)))

(declare-fun lt!174786 () (_ BitVec 64))

(assert (=> b!114768 (= lt!174786 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!174779 () (_ BitVec 64))

(assert (=> b!114768 (= lt!174779 (bitIndex!0 (size!2355 (buf!2763 (_2!4979 lt!173907))) (currentByte!5370 (_2!4979 lt!173907)) (currentBit!5365 (_2!4979 lt!173907))))))

(assert (=> b!114768 (= lt!174784 (arrayBitRangesEqSymmetric!0 (buf!2763 (_2!4979 lt!173907)) (buf!2763 (_2!4979 lt!174474)) lt!174786 lt!174779))))

(assert (=> b!114768 (arrayBitRangesEq!0 (buf!2763 (_2!4979 lt!174474)) (buf!2763 (_2!4979 lt!173907)) lt!174786 lt!174779)))

(declare-fun b!114769 () Bool)

(declare-fun res!94820 () Bool)

(assert (=> b!114769 (=> (not res!94820) (not e!75248))))

(assert (=> b!114769 (= res!94820 (isPrefixOf!0 (_2!4992 lt!174791) (_2!4979 lt!174474)))))

(assert (= (and d!36906 c!6960) b!114768))

(assert (= (and d!36906 (not c!6960)) b!114766))

(assert (= (and d!36906 res!94821) b!114765))

(assert (= (and b!114765 res!94819) b!114769))

(assert (= (and b!114769 res!94820) b!114767))

(declare-fun m!171499 () Bool)

(assert (=> b!114767 m!171499))

(assert (=> b!114767 m!171131))

(assert (=> b!114767 m!170719))

(declare-fun m!171501 () Bool)

(assert (=> b!114765 m!171501))

(declare-fun m!171503 () Bool)

(assert (=> d!36906 m!171503))

(declare-fun m!171505 () Bool)

(assert (=> d!36906 m!171505))

(assert (=> d!36906 m!171125))

(assert (=> d!36906 m!171393))

(declare-fun m!171507 () Bool)

(assert (=> d!36906 m!171507))

(assert (=> d!36906 m!171397))

(declare-fun m!171509 () Bool)

(assert (=> d!36906 m!171509))

(declare-fun m!171511 () Bool)

(assert (=> d!36906 m!171511))

(declare-fun m!171513 () Bool)

(assert (=> d!36906 m!171513))

(declare-fun m!171515 () Bool)

(assert (=> d!36906 m!171515))

(declare-fun m!171517 () Bool)

(assert (=> d!36906 m!171517))

(declare-fun m!171519 () Bool)

(assert (=> b!114769 m!171519))

(assert (=> b!114768 m!170719))

(declare-fun m!171521 () Bool)

(assert (=> b!114768 m!171521))

(declare-fun m!171523 () Bool)

(assert (=> b!114768 m!171523))

(assert (=> b!114626 d!36906))

(declare-fun d!36908 () Bool)

(declare-fun e!75249 () Bool)

(assert (=> d!36908 e!75249))

(declare-fun res!94822 () Bool)

(assert (=> d!36908 (=> (not res!94822) (not e!75249))))

(declare-fun lt!174795 () (_ BitVec 64))

(declare-fun lt!174794 () (_ BitVec 64))

(declare-fun lt!174796 () (_ BitVec 64))

(assert (=> d!36908 (= res!94822 (= lt!174795 (bvsub lt!174794 lt!174796)))))

(assert (=> d!36908 (or (= (bvand lt!174794 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174796 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174794 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174794 lt!174796) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36908 (= lt!174796 (remainingBits!0 ((_ sign_extend 32) (size!2355 (buf!2763 (_1!4980 lt!174455)))) ((_ sign_extend 32) (currentByte!5370 (_1!4980 lt!174455))) ((_ sign_extend 32) (currentBit!5365 (_1!4980 lt!174455)))))))

(declare-fun lt!174798 () (_ BitVec 64))

(declare-fun lt!174797 () (_ BitVec 64))

(assert (=> d!36908 (= lt!174794 (bvmul lt!174798 lt!174797))))

(assert (=> d!36908 (or (= lt!174798 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!174797 (bvsdiv (bvmul lt!174798 lt!174797) lt!174798)))))

(assert (=> d!36908 (= lt!174797 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36908 (= lt!174798 ((_ sign_extend 32) (size!2355 (buf!2763 (_1!4980 lt!174455)))))))

(assert (=> d!36908 (= lt!174795 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5370 (_1!4980 lt!174455))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5365 (_1!4980 lt!174455)))))))

(assert (=> d!36908 (invariant!0 (currentBit!5365 (_1!4980 lt!174455)) (currentByte!5370 (_1!4980 lt!174455)) (size!2355 (buf!2763 (_1!4980 lt!174455))))))

(assert (=> d!36908 (= (bitIndex!0 (size!2355 (buf!2763 (_1!4980 lt!174455))) (currentByte!5370 (_1!4980 lt!174455)) (currentBit!5365 (_1!4980 lt!174455))) lt!174795)))

(declare-fun b!114770 () Bool)

(declare-fun res!94823 () Bool)

(assert (=> b!114770 (=> (not res!94823) (not e!75249))))

(assert (=> b!114770 (= res!94823 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!174795))))

(declare-fun b!114771 () Bool)

(declare-fun lt!174799 () (_ BitVec 64))

(assert (=> b!114771 (= e!75249 (bvsle lt!174795 (bvmul lt!174799 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114771 (or (= lt!174799 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!174799 #b0000000000000000000000000000000000000000000000000000000000001000) lt!174799)))))

(assert (=> b!114771 (= lt!174799 ((_ sign_extend 32) (size!2355 (buf!2763 (_1!4980 lt!174455)))))))

(assert (= (and d!36908 res!94822) b!114770))

(assert (= (and b!114770 res!94823) b!114771))

(declare-fun m!171525 () Bool)

(assert (=> d!36908 m!171525))

(declare-fun m!171527 () Bool)

(assert (=> d!36908 m!171527))

(assert (=> b!114627 d!36908))

(assert (=> b!114627 d!36894))

(assert (=> d!36738 d!36864))

(declare-fun b!114772 () Bool)

(declare-fun e!75255 () Bool)

(declare-fun lt!174800 () tuple4!86)

(assert (=> b!114772 (= e!75255 (arrayRangesEq!44 (buf!2763 thiss!1305) (buf!2763 (_2!4979 lt!173907)) (_1!4988 lt!174800) (_2!4988 lt!174800)))))

(declare-fun e!75254 () Bool)

(declare-fun b!114774 () Bool)

(declare-fun lt!174801 () (_ BitVec 32))

(assert (=> b!114774 (= e!75254 (byteRangesEq!0 (select (arr!2948 (buf!2763 thiss!1305)) (_4!43 lt!174800)) (select (arr!2948 (buf!2763 (_2!4979 lt!173907))) (_4!43 lt!174800)) #b00000000000000000000000000000000 lt!174801))))

(declare-fun b!114775 () Bool)

(declare-fun e!75251 () Bool)

(declare-fun e!75250 () Bool)

(assert (=> b!114775 (= e!75251 e!75250)))

(declare-fun res!94828 () Bool)

(declare-fun call!1487 () Bool)

(assert (=> b!114775 (= res!94828 call!1487)))

(assert (=> b!114775 (=> (not res!94828) (not e!75250))))

(declare-fun b!114776 () Bool)

(declare-fun res!94825 () Bool)

(assert (=> b!114776 (= res!94825 (= lt!174801 #b00000000000000000000000000000000))))

(assert (=> b!114776 (=> res!94825 e!75254)))

(assert (=> b!114776 (= e!75250 e!75254)))

(declare-fun b!114777 () Bool)

(declare-fun e!75252 () Bool)

(assert (=> b!114777 (= e!75252 e!75251)))

(declare-fun c!6961 () Bool)

(assert (=> b!114777 (= c!6961 (= (_3!264 lt!174800) (_4!43 lt!174800)))))

(declare-fun d!36910 () Bool)

(declare-fun res!94827 () Bool)

(declare-fun e!75253 () Bool)

(assert (=> d!36910 (=> res!94827 e!75253)))

(assert (=> d!36910 (= res!94827 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2355 (buf!2763 thiss!1305)) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305))))))

(assert (=> d!36910 (= (arrayBitRangesEq!0 (buf!2763 thiss!1305) (buf!2763 (_2!4979 lt!173907)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2355 (buf!2763 thiss!1305)) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305))) e!75253)))

(declare-fun b!114773 () Bool)

(assert (=> b!114773 (= e!75253 e!75252)))

(declare-fun res!94826 () Bool)

(assert (=> b!114773 (=> (not res!94826) (not e!75252))))

(assert (=> b!114773 (= res!94826 e!75255)))

(declare-fun res!94824 () Bool)

(assert (=> b!114773 (=> res!94824 e!75255)))

(assert (=> b!114773 (= res!94824 (bvsge (_1!4988 lt!174800) (_2!4988 lt!174800)))))

(assert (=> b!114773 (= lt!174801 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2355 (buf!2763 thiss!1305)) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!174802 () (_ BitVec 32))

(assert (=> b!114773 (= lt!174802 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114773 (= lt!174800 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2355 (buf!2763 thiss!1305)) (currentByte!5370 thiss!1305) (currentBit!5365 thiss!1305))))))

(declare-fun bm!1484 () Bool)

(assert (=> bm!1484 (= call!1487 (byteRangesEq!0 (select (arr!2948 (buf!2763 thiss!1305)) (_3!264 lt!174800)) (select (arr!2948 (buf!2763 (_2!4979 lt!173907))) (_3!264 lt!174800)) lt!174802 (ite c!6961 lt!174801 #b00000000000000000000000000001000)))))

(declare-fun b!114778 () Bool)

(assert (=> b!114778 (= e!75251 call!1487)))

(assert (= (and d!36910 (not res!94827)) b!114773))

(assert (= (and b!114773 (not res!94824)) b!114772))

(assert (= (and b!114773 res!94826) b!114777))

(assert (= (and b!114777 c!6961) b!114778))

(assert (= (and b!114777 (not c!6961)) b!114775))

(assert (= (and b!114775 res!94828) b!114776))

(assert (= (and b!114776 (not res!94825)) b!114774))

(assert (= (or b!114778 b!114775) bm!1484))

(declare-fun m!171529 () Bool)

(assert (=> b!114772 m!171529))

(declare-fun m!171531 () Bool)

(assert (=> b!114774 m!171531))

(declare-fun m!171533 () Bool)

(assert (=> b!114774 m!171533))

(assert (=> b!114774 m!171531))

(assert (=> b!114774 m!171533))

(declare-fun m!171535 () Bool)

(assert (=> b!114774 m!171535))

(assert (=> b!114773 m!170721))

(assert (=> b!114773 m!171467))

(declare-fun m!171537 () Bool)

(assert (=> bm!1484 m!171537))

(declare-fun m!171539 () Bool)

(assert (=> bm!1484 m!171539))

(assert (=> bm!1484 m!171537))

(assert (=> bm!1484 m!171539))

(declare-fun m!171541 () Bool)

(assert (=> bm!1484 m!171541))

(assert (=> b!114460 d!36910))

(assert (=> b!114460 d!36778))

(assert (=> d!36740 d!36866))

(push 1)

(assert (not d!36808))

(assert (not b!114714))

(assert (not d!36814))

(assert (not d!36908))

(assert (not b!114774))

(assert (not b!114767))

(assert (not b!114688))

(assert (not d!36836))

(assert (not d!36852))

(assert (not d!36900))

(assert (not b!114720))

(assert (not b!114708))

(assert (not b!114759))

(assert (not b!114672))

(assert (not d!36892))

(assert (not b!114692))

(assert (not b!114743))

(assert (not b!114709))

(assert (not d!36904))

(assert (not d!36826))

(assert (not d!36804))

(assert (not b!114736))

(assert (not b!114705))

(assert (not b!114660))

(assert (not b!114706))

(assert (not d!36820))

(assert (not b!114760))

(assert (not d!36870))

(assert (not b!114674))

(assert (not b!114691))

(assert (not b!114661))

(assert (not b!114757))

(assert (not d!36810))

(assert (not b!114719))

(assert (not b!114712))

(assert (not b!114675))

(assert (not b!114750))

(assert (not b!114703))

(assert (not bm!1483))

(assert (not d!36788))

(assert (not d!36894))

(assert (not b!114768))

(assert (not d!36854))

(assert (not b!114751))

(assert (not b!114769))

(assert (not b!114673))

(assert (not d!36876))

(assert (not b!114740))

(assert (not b!114695))

(assert (not d!36832))

(assert (not d!36800))

(assert (not b!114772))

(assert (not b!114721))

(assert (not d!36824))

(assert (not b!114749))

(assert (not bm!1482))

(assert (not b!114693))

(assert (not b!114690))

(assert (not d!36834))

(assert (not d!36890))

(assert (not d!36860))

(assert (not d!36850))

(assert (not b!114702))

(assert (not d!36812))

(assert (not d!36878))

(assert (not d!36816))

(assert (not b!114733))

(assert (not b!114734))

(assert (not d!36848))

(assert (not d!36784))

(assert (not b!114710))

(assert (not d!36828))

(assert (not b!114735))

(assert (not d!36888))

(assert (not d!36858))

(assert (not d!36844))

(assert (not bm!1484))

(assert (not b!114741))

(assert (not d!36838))

(assert (not d!36902))

(assert (not d!36846))

(assert (not b!114737))

(assert (not d!36786))

(assert (not b!114773))

(assert (not b!114717))

(assert (not b!114663))

(assert (not b!114765))

(assert (not d!36806))

(assert (not d!36796))

(assert (not d!36830))

(assert (not d!36906))

(assert (not b!114752))

(assert (not d!36790))

(assert (not d!36822))

(check-sat)

(pop 1)

(push 1)

(check-sat)

