; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25382 () Bool)

(assert start!25382)

(declare-fun b!128200 () Bool)

(declare-fun e!85010 () Bool)

(declare-datatypes ((array!5918 0))(
  ( (array!5919 (arr!3293 (Array (_ BitVec 32) (_ BitVec 8))) (size!2676 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4616 0))(
  ( (BitStream!4617 (buf!3034 array!5918) (currentByte!5786 (_ BitVec 32)) (currentBit!5781 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4616)

(declare-fun array_inv!2465 (array!5918) Bool)

(assert (=> b!128200 (= e!85010 (array_inv!2465 (buf!3034 thiss!1634)))))

(declare-fun b!128201 () Bool)

(declare-fun res!106089 () Bool)

(declare-fun e!85009 () Bool)

(assert (=> b!128201 (=> (not res!106089) (not e!85009))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128201 (= res!106089 (invariant!0 (currentBit!5781 thiss!1634) (currentByte!5786 thiss!1634) (size!2676 (buf!3034 thiss!1634))))))

(declare-fun b!128202 () Bool)

(declare-fun res!106091 () Bool)

(declare-fun e!85007 () Bool)

(assert (=> b!128202 (=> (not res!106091) (not e!85007))))

(declare-datatypes ((Unit!7954 0))(
  ( (Unit!7955) )
))
(declare-datatypes ((tuple2!10816 0))(
  ( (tuple2!10817 (_1!5705 Unit!7954) (_2!5705 BitStream!4616)) )
))
(declare-fun lt!199087 () tuple2!10816)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128202 (= res!106091 (= (bitIndex!0 (size!2676 (buf!3034 (_2!5705 lt!199087))) (currentByte!5786 (_2!5705 lt!199087)) (currentBit!5781 (_2!5705 lt!199087))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2676 (buf!3034 thiss!1634)) (currentByte!5786 thiss!1634) (currentBit!5781 thiss!1634)))))))

(declare-datatypes ((tuple2!10818 0))(
  ( (tuple2!10819 (_1!5706 BitStream!4616) (_2!5706 BitStream!4616)) )
))
(declare-fun lt!199086 () tuple2!10818)

(declare-datatypes ((tuple2!10820 0))(
  ( (tuple2!10821 (_1!5707 BitStream!4616) (_2!5707 (_ BitVec 8))) )
))
(declare-fun lt!199088 () tuple2!10820)

(declare-fun arr!237 () array!5918)

(declare-fun b!128203 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!128203 (= e!85007 (and (= (_2!5707 lt!199088) (select (arr!3293 arr!237) from!447)) (= (_1!5707 lt!199088) (_2!5706 lt!199086))))))

(declare-fun readBytePure!0 (BitStream!4616) tuple2!10820)

(assert (=> b!128203 (= lt!199088 (readBytePure!0 (_1!5706 lt!199086)))))

(declare-fun reader!0 (BitStream!4616 BitStream!4616) tuple2!10818)

(assert (=> b!128203 (= lt!199086 (reader!0 thiss!1634 (_2!5705 lt!199087)))))

(declare-fun b!128204 () Bool)

(declare-fun res!106093 () Bool)

(assert (=> b!128204 (=> (not res!106093) (not e!85009))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128204 (= res!106093 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2676 (buf!3034 thiss!1634))) ((_ sign_extend 32) (currentByte!5786 thiss!1634)) ((_ sign_extend 32) (currentBit!5781 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128205 () Bool)

(declare-fun res!106087 () Bool)

(assert (=> b!128205 (=> (not res!106087) (not e!85009))))

(assert (=> b!128205 (= res!106087 (bvslt from!447 to!404))))

(declare-fun res!106092 () Bool)

(assert (=> start!25382 (=> (not res!106092) (not e!85009))))

(assert (=> start!25382 (= res!106092 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2676 arr!237))))))

(assert (=> start!25382 e!85009))

(assert (=> start!25382 true))

(assert (=> start!25382 (array_inv!2465 arr!237)))

(declare-fun inv!12 (BitStream!4616) Bool)

(assert (=> start!25382 (and (inv!12 thiss!1634) e!85010)))

(declare-fun b!128206 () Bool)

(declare-fun res!106090 () Bool)

(assert (=> b!128206 (=> (not res!106090) (not e!85007))))

(declare-fun isPrefixOf!0 (BitStream!4616 BitStream!4616) Bool)

(assert (=> b!128206 (= res!106090 (isPrefixOf!0 thiss!1634 (_2!5705 lt!199087)))))

(declare-fun b!128207 () Bool)

(assert (=> b!128207 (= e!85009 (not (or (bvsgt ((_ sign_extend 32) (size!2676 (buf!3034 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!5786 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!5781 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (and (bvsge ((_ sign_extend 32) (size!2676 (buf!3034 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!5786 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!5781 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!128207 e!85007))

(declare-fun res!106088 () Bool)

(assert (=> b!128207 (=> (not res!106088) (not e!85007))))

(assert (=> b!128207 (= res!106088 (= (size!2676 (buf!3034 thiss!1634)) (size!2676 (buf!3034 (_2!5705 lt!199087)))))))

(declare-fun appendByte!0 (BitStream!4616 (_ BitVec 8)) tuple2!10816)

(assert (=> b!128207 (= lt!199087 (appendByte!0 thiss!1634 (select (arr!3293 arr!237) from!447)))))

(assert (= (and start!25382 res!106092) b!128204))

(assert (= (and b!128204 res!106093) b!128205))

(assert (= (and b!128205 res!106087) b!128201))

(assert (= (and b!128201 res!106089) b!128207))

(assert (= (and b!128207 res!106088) b!128202))

(assert (= (and b!128202 res!106091) b!128206))

(assert (= (and b!128206 res!106090) b!128203))

(assert (= start!25382 b!128200))

(declare-fun m!193963 () Bool)

(assert (=> b!128203 m!193963))

(declare-fun m!193965 () Bool)

(assert (=> b!128203 m!193965))

(declare-fun m!193967 () Bool)

(assert (=> b!128203 m!193967))

(declare-fun m!193969 () Bool)

(assert (=> b!128200 m!193969))

(declare-fun m!193971 () Bool)

(assert (=> b!128206 m!193971))

(declare-fun m!193973 () Bool)

(assert (=> start!25382 m!193973))

(declare-fun m!193975 () Bool)

(assert (=> start!25382 m!193975))

(assert (=> b!128207 m!193963))

(assert (=> b!128207 m!193963))

(declare-fun m!193977 () Bool)

(assert (=> b!128207 m!193977))

(declare-fun m!193979 () Bool)

(assert (=> b!128204 m!193979))

(declare-fun m!193981 () Bool)

(assert (=> b!128202 m!193981))

(declare-fun m!193983 () Bool)

(assert (=> b!128202 m!193983))

(declare-fun m!193985 () Bool)

(assert (=> b!128201 m!193985))

(push 1)

(assert (not b!128203))

(assert (not b!128207))

(assert (not b!128204))

(assert (not b!128200))

(assert (not b!128202))

(assert (not start!25382))

(assert (not b!128206))

(assert (not b!128201))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!41422 () Bool)

(declare-fun res!106109 () Bool)

(declare-fun e!85019 () Bool)

(assert (=> d!41422 (=> (not res!106109) (not e!85019))))

(assert (=> d!41422 (= res!106109 (= (size!2676 (buf!3034 thiss!1634)) (size!2676 (buf!3034 (_2!5705 lt!199087)))))))

(assert (=> d!41422 (= (isPrefixOf!0 thiss!1634 (_2!5705 lt!199087)) e!85019)))

(declare-fun b!128222 () Bool)

(declare-fun res!106108 () Bool)

(assert (=> b!128222 (=> (not res!106108) (not e!85019))))

(assert (=> b!128222 (= res!106108 (bvsle (bitIndex!0 (size!2676 (buf!3034 thiss!1634)) (currentByte!5786 thiss!1634) (currentBit!5781 thiss!1634)) (bitIndex!0 (size!2676 (buf!3034 (_2!5705 lt!199087))) (currentByte!5786 (_2!5705 lt!199087)) (currentBit!5781 (_2!5705 lt!199087)))))))

(declare-fun b!128223 () Bool)

(declare-fun e!85020 () Bool)

(assert (=> b!128223 (= e!85019 e!85020)))

(declare-fun res!106110 () Bool)

(assert (=> b!128223 (=> res!106110 e!85020)))

(assert (=> b!128223 (= res!106110 (= (size!2676 (buf!3034 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!128224 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5918 array!5918 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!128224 (= e!85020 (arrayBitRangesEq!0 (buf!3034 thiss!1634) (buf!3034 (_2!5705 lt!199087)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2676 (buf!3034 thiss!1634)) (currentByte!5786 thiss!1634) (currentBit!5781 thiss!1634))))))

(assert (= (and d!41422 res!106109) b!128222))

(assert (= (and b!128222 res!106108) b!128223))

(assert (= (and b!128223 (not res!106110)) b!128224))

(assert (=> b!128222 m!193983))

(assert (=> b!128222 m!193981))

(assert (=> b!128224 m!193983))

(assert (=> b!128224 m!193983))

(declare-fun m!193995 () Bool)

(assert (=> b!128224 m!193995))

(assert (=> b!128206 d!41422))

(declare-fun d!41428 () Bool)

(assert (=> d!41428 (= (invariant!0 (currentBit!5781 thiss!1634) (currentByte!5786 thiss!1634) (size!2676 (buf!3034 thiss!1634))) (and (bvsge (currentBit!5781 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5781 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5786 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5786 thiss!1634) (size!2676 (buf!3034 thiss!1634))) (and (= (currentBit!5781 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5786 thiss!1634) (size!2676 (buf!3034 thiss!1634)))))))))

(assert (=> b!128201 d!41428))

(declare-fun d!41430 () Bool)

(assert (=> d!41430 (= (array_inv!2465 (buf!3034 thiss!1634)) (bvsge (size!2676 (buf!3034 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!128200 d!41430))

(declare-fun d!41432 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!41432 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2676 (buf!3034 thiss!1634))) ((_ sign_extend 32) (currentByte!5786 thiss!1634)) ((_ sign_extend 32) (currentBit!5781 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2676 (buf!3034 thiss!1634))) ((_ sign_extend 32) (currentByte!5786 thiss!1634)) ((_ sign_extend 32) (currentBit!5781 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10078 () Bool)

(assert (= bs!10078 d!41432))

(declare-fun m!193997 () Bool)

(assert (=> bs!10078 m!193997))

(assert (=> b!128204 d!41432))

(declare-fun d!41434 () Bool)

(declare-datatypes ((tuple2!10824 0))(
  ( (tuple2!10825 (_1!5709 (_ BitVec 8)) (_2!5709 BitStream!4616)) )
))
(declare-fun lt!199118 () tuple2!10824)

(declare-fun readByte!0 (BitStream!4616) tuple2!10824)

(assert (=> d!41434 (= lt!199118 (readByte!0 (_1!5706 lt!199086)))))

(assert (=> d!41434 (= (readBytePure!0 (_1!5706 lt!199086)) (tuple2!10821 (_2!5709 lt!199118) (_1!5709 lt!199118)))))

(declare-fun bs!10079 () Bool)

(assert (= bs!10079 d!41434))

(declare-fun m!193999 () Bool)

(assert (=> bs!10079 m!193999))

(assert (=> b!128203 d!41434))

(declare-fun lt!199256 () (_ BitVec 64))

(declare-fun e!85042 () Bool)

(declare-fun lt!199253 () (_ BitVec 64))

(declare-fun b!128267 () Bool)

(declare-fun lt!199257 () tuple2!10818)

(declare-fun withMovedBitIndex!0 (BitStream!4616 (_ BitVec 64)) BitStream!4616)

(assert (=> b!128267 (= e!85042 (= (_1!5706 lt!199257) (withMovedBitIndex!0 (_2!5706 lt!199257) (bvsub lt!199253 lt!199256))))))

(assert (=> b!128267 (or (= (bvand lt!199253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!199256 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!199253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!199253 lt!199256) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128267 (= lt!199256 (bitIndex!0 (size!2676 (buf!3034 (_2!5705 lt!199087))) (currentByte!5786 (_2!5705 lt!199087)) (currentBit!5781 (_2!5705 lt!199087))))))

(assert (=> b!128267 (= lt!199253 (bitIndex!0 (size!2676 (buf!3034 thiss!1634)) (currentByte!5786 thiss!1634) (currentBit!5781 thiss!1634)))))

(declare-fun b!128268 () Bool)

(declare-fun res!106144 () Bool)

(assert (=> b!128268 (=> (not res!106144) (not e!85042))))

(assert (=> b!128268 (= res!106144 (isPrefixOf!0 (_1!5706 lt!199257) thiss!1634))))

(declare-fun d!41436 () Bool)

(assert (=> d!41436 e!85042))

(declare-fun res!106143 () Bool)

(assert (=> d!41436 (=> (not res!106143) (not e!85042))))

(assert (=> d!41436 (= res!106143 (isPrefixOf!0 (_1!5706 lt!199257) (_2!5706 lt!199257)))))

(declare-fun lt!199244 () BitStream!4616)

(assert (=> d!41436 (= lt!199257 (tuple2!10819 lt!199244 (_2!5705 lt!199087)))))

(declare-fun lt!199258 () Unit!7954)

(declare-fun lt!199259 () Unit!7954)

(assert (=> d!41436 (= lt!199258 lt!199259)))

(assert (=> d!41436 (isPrefixOf!0 lt!199244 (_2!5705 lt!199087))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4616 BitStream!4616 BitStream!4616) Unit!7954)

(assert (=> d!41436 (= lt!199259 (lemmaIsPrefixTransitive!0 lt!199244 (_2!5705 lt!199087) (_2!5705 lt!199087)))))

(declare-fun lt!199246 () Unit!7954)

(declare-fun lt!199251 () Unit!7954)

(assert (=> d!41436 (= lt!199246 lt!199251)))

(assert (=> d!41436 (isPrefixOf!0 lt!199244 (_2!5705 lt!199087))))

(assert (=> d!41436 (= lt!199251 (lemmaIsPrefixTransitive!0 lt!199244 thiss!1634 (_2!5705 lt!199087)))))

(declare-fun lt!199243 () Unit!7954)

(declare-fun e!85041 () Unit!7954)

(assert (=> d!41436 (= lt!199243 e!85041)))

(declare-fun c!7536 () Bool)

(assert (=> d!41436 (= c!7536 (not (= (size!2676 (buf!3034 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!199260 () Unit!7954)

(declare-fun lt!199262 () Unit!7954)

(assert (=> d!41436 (= lt!199260 lt!199262)))

(assert (=> d!41436 (isPrefixOf!0 (_2!5705 lt!199087) (_2!5705 lt!199087))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4616) Unit!7954)

(assert (=> d!41436 (= lt!199262 (lemmaIsPrefixRefl!0 (_2!5705 lt!199087)))))

(declare-fun lt!199250 () Unit!7954)

(declare-fun lt!199247 () Unit!7954)

(assert (=> d!41436 (= lt!199250 lt!199247)))

(assert (=> d!41436 (= lt!199247 (lemmaIsPrefixRefl!0 (_2!5705 lt!199087)))))

(declare-fun lt!199252 () Unit!7954)

(declare-fun lt!199248 () Unit!7954)

(assert (=> d!41436 (= lt!199252 lt!199248)))

(assert (=> d!41436 (isPrefixOf!0 lt!199244 lt!199244)))

(assert (=> d!41436 (= lt!199248 (lemmaIsPrefixRefl!0 lt!199244))))

(declare-fun lt!199254 () Unit!7954)

(declare-fun lt!199245 () Unit!7954)

(assert (=> d!41436 (= lt!199254 lt!199245)))

(assert (=> d!41436 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!41436 (= lt!199245 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!41436 (= lt!199244 (BitStream!4617 (buf!3034 (_2!5705 lt!199087)) (currentByte!5786 thiss!1634) (currentBit!5781 thiss!1634)))))

(assert (=> d!41436 (isPrefixOf!0 thiss!1634 (_2!5705 lt!199087))))

(assert (=> d!41436 (= (reader!0 thiss!1634 (_2!5705 lt!199087)) lt!199257)))

(declare-fun b!128269 () Bool)

(declare-fun lt!199261 () Unit!7954)

(assert (=> b!128269 (= e!85041 lt!199261)))

(declare-fun lt!199249 () (_ BitVec 64))

(assert (=> b!128269 (= lt!199249 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!199255 () (_ BitVec 64))

(assert (=> b!128269 (= lt!199255 (bitIndex!0 (size!2676 (buf!3034 thiss!1634)) (currentByte!5786 thiss!1634) (currentBit!5781 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5918 array!5918 (_ BitVec 64) (_ BitVec 64)) Unit!7954)

(assert (=> b!128269 (= lt!199261 (arrayBitRangesEqSymmetric!0 (buf!3034 thiss!1634) (buf!3034 (_2!5705 lt!199087)) lt!199249 lt!199255))))

(assert (=> b!128269 (arrayBitRangesEq!0 (buf!3034 (_2!5705 lt!199087)) (buf!3034 thiss!1634) lt!199249 lt!199255)))

(declare-fun b!128270 () Bool)

(declare-fun Unit!7957 () Unit!7954)

(assert (=> b!128270 (= e!85041 Unit!7957)))

(declare-fun b!128271 () Bool)

(declare-fun res!106145 () Bool)

(assert (=> b!128271 (=> (not res!106145) (not e!85042))))

(assert (=> b!128271 (= res!106145 (isPrefixOf!0 (_2!5706 lt!199257) (_2!5705 lt!199087)))))

(assert (= (and d!41436 c!7536) b!128269))

(assert (= (and d!41436 (not c!7536)) b!128270))

(assert (= (and d!41436 res!106143) b!128268))

(assert (= (and b!128268 res!106144) b!128271))

(assert (= (and b!128271 res!106145) b!128267))

(declare-fun m!194039 () Bool)

(assert (=> b!128267 m!194039))

(assert (=> b!128267 m!193981))

(assert (=> b!128267 m!193983))

(declare-fun m!194041 () Bool)

(assert (=> b!128271 m!194041))

(declare-fun m!194043 () Bool)

(assert (=> d!41436 m!194043))

(declare-fun m!194045 () Bool)

(assert (=> d!41436 m!194045))

(declare-fun m!194047 () Bool)

(assert (=> d!41436 m!194047))

(declare-fun m!194049 () Bool)

(assert (=> d!41436 m!194049))

(declare-fun m!194051 () Bool)

(assert (=> d!41436 m!194051))

(declare-fun m!194053 () Bool)

(assert (=> d!41436 m!194053))

(declare-fun m!194055 () Bool)

(assert (=> d!41436 m!194055))

(assert (=> d!41436 m!193971))

(declare-fun m!194057 () Bool)

(assert (=> d!41436 m!194057))

(declare-fun m!194059 () Bool)

(assert (=> d!41436 m!194059))

(declare-fun m!194061 () Bool)

(assert (=> d!41436 m!194061))

(declare-fun m!194063 () Bool)

(assert (=> b!128268 m!194063))

(assert (=> b!128269 m!193983))

(declare-fun m!194065 () Bool)

(assert (=> b!128269 m!194065))

(declare-fun m!194067 () Bool)

(assert (=> b!128269 m!194067))

(assert (=> b!128203 d!41436))

(declare-fun d!41460 () Bool)

(assert (=> d!41460 (= (array_inv!2465 arr!237) (bvsge (size!2676 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!25382 d!41460))

(declare-fun d!41462 () Bool)

(assert (=> d!41462 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5781 thiss!1634) (currentByte!5786 thiss!1634) (size!2676 (buf!3034 thiss!1634))))))

(declare-fun bs!10082 () Bool)

(assert (= bs!10082 d!41462))

(assert (=> bs!10082 m!193985))

(assert (=> start!25382 d!41462))

(declare-fun d!41464 () Bool)

(declare-fun e!85049 () Bool)

(assert (=> d!41464 e!85049))

(declare-fun res!106162 () Bool)

(assert (=> d!41464 (=> (not res!106162) (not e!85049))))

(declare-fun lt!199298 () (_ BitVec 64))

(declare-fun lt!199295 () (_ BitVec 64))

(declare-fun lt!199300 () (_ BitVec 64))

(assert (=> d!41464 (= res!106162 (= lt!199300 (bvsub lt!199295 lt!199298)))))

(assert (=> d!41464 (or (= (bvand lt!199295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!199298 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!199295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!199295 lt!199298) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41464 (= lt!199298 (remainingBits!0 ((_ sign_extend 32) (size!2676 (buf!3034 (_2!5705 lt!199087)))) ((_ sign_extend 32) (currentByte!5786 (_2!5705 lt!199087))) ((_ sign_extend 32) (currentBit!5781 (_2!5705 lt!199087)))))))

(declare-fun lt!199297 () (_ BitVec 64))

(declare-fun lt!199296 () (_ BitVec 64))

(assert (=> d!41464 (= lt!199295 (bvmul lt!199297 lt!199296))))

(assert (=> d!41464 (or (= lt!199297 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!199296 (bvsdiv (bvmul lt!199297 lt!199296) lt!199297)))))

(assert (=> d!41464 (= lt!199296 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41464 (= lt!199297 ((_ sign_extend 32) (size!2676 (buf!3034 (_2!5705 lt!199087)))))))

(assert (=> d!41464 (= lt!199300 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5786 (_2!5705 lt!199087))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5781 (_2!5705 lt!199087)))))))

(assert (=> d!41464 (invariant!0 (currentBit!5781 (_2!5705 lt!199087)) (currentByte!5786 (_2!5705 lt!199087)) (size!2676 (buf!3034 (_2!5705 lt!199087))))))

(assert (=> d!41464 (= (bitIndex!0 (size!2676 (buf!3034 (_2!5705 lt!199087))) (currentByte!5786 (_2!5705 lt!199087)) (currentBit!5781 (_2!5705 lt!199087))) lt!199300)))

(declare-fun b!128288 () Bool)

(declare-fun res!106163 () Bool)

(assert (=> b!128288 (=> (not res!106163) (not e!85049))))

(assert (=> b!128288 (= res!106163 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!199300))))

(declare-fun b!128289 () Bool)

(declare-fun lt!199299 () (_ BitVec 64))

(assert (=> b!128289 (= e!85049 (bvsle lt!199300 (bvmul lt!199299 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!128289 (or (= lt!199299 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!199299 #b0000000000000000000000000000000000000000000000000000000000001000) lt!199299)))))

(assert (=> b!128289 (= lt!199299 ((_ sign_extend 32) (size!2676 (buf!3034 (_2!5705 lt!199087)))))))

(assert (= (and d!41464 res!106162) b!128288))

(assert (= (and b!128288 res!106163) b!128289))

(declare-fun m!194069 () Bool)

(assert (=> d!41464 m!194069))

(declare-fun m!194071 () Bool)

(assert (=> d!41464 m!194071))

(assert (=> b!128202 d!41464))

(declare-fun d!41466 () Bool)

(declare-fun e!85051 () Bool)

(assert (=> d!41466 e!85051))

(declare-fun res!106167 () Bool)

(assert (=> d!41466 (=> (not res!106167) (not e!85051))))

(declare-fun lt!199311 () (_ BitVec 64))

(declare-fun lt!199306 () (_ BitVec 64))

(declare-fun lt!199309 () (_ BitVec 64))

(assert (=> d!41466 (= res!106167 (= lt!199311 (bvsub lt!199306 lt!199309)))))

(assert (=> d!41466 (or (= (bvand lt!199306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!199309 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!199306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!199306 lt!199309) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41466 (= lt!199309 (remainingBits!0 ((_ sign_extend 32) (size!2676 (buf!3034 thiss!1634))) ((_ sign_extend 32) (currentByte!5786 thiss!1634)) ((_ sign_extend 32) (currentBit!5781 thiss!1634))))))

(declare-fun lt!199308 () (_ BitVec 64))

(declare-fun lt!199307 () (_ BitVec 64))

(assert (=> d!41466 (= lt!199306 (bvmul lt!199308 lt!199307))))

(assert (=> d!41466 (or (= lt!199308 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!199307 (bvsdiv (bvmul lt!199308 lt!199307) lt!199308)))))

(assert (=> d!41466 (= lt!199307 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41466 (= lt!199308 ((_ sign_extend 32) (size!2676 (buf!3034 thiss!1634))))))

(assert (=> d!41466 (= lt!199311 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5786 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5781 thiss!1634))))))

(assert (=> d!41466 (invariant!0 (currentBit!5781 thiss!1634) (currentByte!5786 thiss!1634) (size!2676 (buf!3034 thiss!1634)))))

(assert (=> d!41466 (= (bitIndex!0 (size!2676 (buf!3034 thiss!1634)) (currentByte!5786 thiss!1634) (currentBit!5781 thiss!1634)) lt!199311)))

(declare-fun b!128293 () Bool)

(declare-fun res!106168 () Bool)

(assert (=> b!128293 (=> (not res!106168) (not e!85051))))

(assert (=> b!128293 (= res!106168 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!199311))))

(declare-fun b!128294 () Bool)

(declare-fun lt!199310 () (_ BitVec 64))

(assert (=> b!128294 (= e!85051 (bvsle lt!199311 (bvmul lt!199310 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!128294 (or (= lt!199310 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!199310 #b0000000000000000000000000000000000000000000000000000000000001000) lt!199310)))))

(assert (=> b!128294 (= lt!199310 ((_ sign_extend 32) (size!2676 (buf!3034 thiss!1634))))))

(assert (= (and d!41466 res!106167) b!128293))

(assert (= (and b!128293 res!106168) b!128294))

(assert (=> d!41466 m!193997))

(assert (=> d!41466 m!193985))

(assert (=> b!128202 d!41466))

(declare-fun d!41468 () Bool)

(declare-fun e!85061 () Bool)

(assert (=> d!41468 e!85061))

(declare-fun res!106189 () Bool)

(assert (=> d!41468 (=> (not res!106189) (not e!85061))))

(declare-fun lt!199334 () tuple2!10816)

(assert (=> d!41468 (= res!106189 (= (size!2676 (buf!3034 thiss!1634)) (size!2676 (buf!3034 (_2!5705 lt!199334)))))))

(declare-fun choose!6 (BitStream!4616 (_ BitVec 8)) tuple2!10816)

(assert (=> d!41468 (= lt!199334 (choose!6 thiss!1634 (select (arr!3293 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!41468 (validate_offset_byte!0 ((_ sign_extend 32) (size!2676 (buf!3034 thiss!1634))) ((_ sign_extend 32) (currentByte!5786 thiss!1634)) ((_ sign_extend 32) (currentBit!5781 thiss!1634)))))

(assert (=> d!41468 (= (appendByte!0 thiss!1634 (select (arr!3293 arr!237) from!447)) lt!199334)))

(declare-fun b!128313 () Bool)

(declare-fun res!106188 () Bool)

(assert (=> b!128313 (=> (not res!106188) (not e!85061))))

(declare-fun lt!199331 () (_ BitVec 64))

(declare-fun lt!199332 () (_ BitVec 64))

(assert (=> b!128313 (= res!106188 (= (bitIndex!0 (size!2676 (buf!3034 (_2!5705 lt!199334))) (currentByte!5786 (_2!5705 lt!199334)) (currentBit!5781 (_2!5705 lt!199334))) (bvadd lt!199332 lt!199331)))))

(assert (=> b!128313 (or (not (= (bvand lt!199332 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!199331 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!199332 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!199332 lt!199331) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128313 (= lt!199331 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!128313 (= lt!199332 (bitIndex!0 (size!2676 (buf!3034 thiss!1634)) (currentByte!5786 thiss!1634) (currentBit!5781 thiss!1634)))))

(declare-fun b!128314 () Bool)

(declare-fun res!106187 () Bool)

(assert (=> b!128314 (=> (not res!106187) (not e!85061))))

(assert (=> b!128314 (= res!106187 (isPrefixOf!0 thiss!1634 (_2!5705 lt!199334)))))

(declare-fun b!128315 () Bool)

(declare-fun lt!199333 () tuple2!10820)

(declare-fun lt!199330 () tuple2!10818)

(assert (=> b!128315 (= e!85061 (and (= (_2!5707 lt!199333) (select (arr!3293 arr!237) from!447)) (= (_1!5707 lt!199333) (_2!5706 lt!199330))))))

(assert (=> b!128315 (= lt!199333 (readBytePure!0 (_1!5706 lt!199330)))))

(assert (=> b!128315 (= lt!199330 (reader!0 thiss!1634 (_2!5705 lt!199334)))))

(assert (= (and d!41468 res!106189) b!128313))

(assert (= (and b!128313 res!106188) b!128314))

(assert (= (and b!128314 res!106187) b!128315))

(assert (=> d!41468 m!193963))

(declare-fun m!194101 () Bool)

(assert (=> d!41468 m!194101))

(declare-fun m!194103 () Bool)

(assert (=> d!41468 m!194103))

(declare-fun m!194105 () Bool)

(assert (=> b!128313 m!194105))

(assert (=> b!128313 m!193983))

(declare-fun m!194107 () Bool)

(assert (=> b!128314 m!194107))

(declare-fun m!194109 () Bool)

(assert (=> b!128315 m!194109))

(declare-fun m!194111 () Bool)

(assert (=> b!128315 m!194111))

(assert (=> b!128207 d!41468))

(push 1)

(assert (not b!128314))

(assert (not d!41434))

(assert (not b!128269))

(assert (not d!41436))

(assert (not d!41466))

(assert (not b!128268))

(assert (not b!128267))

(assert (not d!41432))

(assert (not b!128315))

(assert (not b!128222))

(assert (not b!128224))

(assert (not b!128313))

(assert (not d!41468))

(assert (not d!41462))

(assert (not d!41464))

(assert (not b!128271))

(check-sat)

(pop 1)

(push 1)

(check-sat)

