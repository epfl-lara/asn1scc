; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8392 () Bool)

(assert start!8392)

(declare-datatypes ((array!2144 0))(
  ( (array!2145 (arr!1469 (Array (_ BitVec 32) (_ BitVec 8))) (size!970 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1684 0))(
  ( (BitStream!1685 (buf!1298 array!2144) (currentByte!2750 (_ BitVec 32)) (currentBit!2745 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!4102 0))(
  ( (tuple2!4103 (_1!2141 BitStream!1684) (_2!2141 BitStream!1684)) )
))
(declare-fun lt!63188 () tuple2!4102)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!42011 () Bool)

(declare-fun e!27983 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42011 (= e!27983 (validate_offset_bits!1 ((_ sign_extend 32) (size!970 (buf!1298 (_1!2141 lt!63188)))) ((_ sign_extend 32) (currentByte!2750 (_1!2141 lt!63188))) ((_ sign_extend 32) (currentBit!2745 (_1!2141 lt!63188))) (bvsub to!314 i!635)))))

(declare-fun thiss!1379 () BitStream!1684)

(declare-datatypes ((Unit!2991 0))(
  ( (Unit!2992) )
))
(declare-fun lt!63189 () Unit!2991)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1684 array!2144 (_ BitVec 64)) Unit!2991)

(assert (=> b!42011 (= lt!63189 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1298 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!2144)

(declare-datatypes ((tuple2!4104 0))(
  ( (tuple2!4105 (_1!2142 array!2144) (_2!2142 BitStream!1684)) )
))
(declare-fun lt!63187 () tuple2!4104)

(declare-fun checkByteArrayBitContent!0 (BitStream!1684 array!2144 array!2144 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42011 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2142 lt!63187) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun res!35731 () Bool)

(declare-fun e!27980 () Bool)

(assert (=> start!8392 (=> (not res!35731) (not e!27980))))

(assert (=> start!8392 (= res!35731 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!970 srcBuffer!2))))))))

(assert (=> start!8392 e!27980))

(assert (=> start!8392 true))

(declare-fun array_inv!895 (array!2144) Bool)

(assert (=> start!8392 (array_inv!895 srcBuffer!2)))

(declare-fun e!27982 () Bool)

(declare-fun inv!12 (BitStream!1684) Bool)

(assert (=> start!8392 (and (inv!12 thiss!1379) e!27982)))

(declare-fun b!42012 () Bool)

(declare-fun e!27985 () Bool)

(assert (=> b!42012 (= e!27985 e!27983)))

(declare-fun res!35732 () Bool)

(assert (=> b!42012 (=> res!35732 e!27983)))

(assert (=> b!42012 (= res!35732 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!1684 (_ BitVec 64)) tuple2!4104)

(assert (=> b!42012 (= lt!63187 (readBits!0 (_1!2141 lt!63188) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!1684 BitStream!1684) tuple2!4102)

(assert (=> b!42012 (= lt!63188 (reader!0 thiss!1379 thiss!1379))))

(declare-fun b!42013 () Bool)

(declare-fun res!35730 () Bool)

(assert (=> b!42013 (=> res!35730 e!27985)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!42013 (= res!35730 (not (invariant!0 (currentBit!2745 thiss!1379) (currentByte!2750 thiss!1379) (size!970 (buf!1298 thiss!1379)))))))

(declare-fun b!42014 () Bool)

(assert (=> b!42014 (= e!27982 (array_inv!895 (buf!1298 thiss!1379)))))

(declare-fun b!42015 () Bool)

(assert (=> b!42015 (= e!27980 (not e!27985))))

(declare-fun res!35729 () Bool)

(assert (=> b!42015 (=> res!35729 e!27985)))

(declare-fun lt!63186 () (_ BitVec 64))

(assert (=> b!42015 (= res!35729 (or (bvslt i!635 to!314) (not (= lt!63186 (bvsub (bvadd lt!63186 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1684 BitStream!1684) Bool)

(assert (=> b!42015 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!63190 () Unit!2991)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1684) Unit!2991)

(assert (=> b!42015 (= lt!63190 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42015 (= lt!63186 (bitIndex!0 (size!970 (buf!1298 thiss!1379)) (currentByte!2750 thiss!1379) (currentBit!2745 thiss!1379)))))

(declare-fun b!42016 () Bool)

(declare-fun res!35733 () Bool)

(assert (=> b!42016 (=> (not res!35733) (not e!27980))))

(assert (=> b!42016 (= res!35733 (validate_offset_bits!1 ((_ sign_extend 32) (size!970 (buf!1298 thiss!1379))) ((_ sign_extend 32) (currentByte!2750 thiss!1379)) ((_ sign_extend 32) (currentBit!2745 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8392 res!35731) b!42016))

(assert (= (and b!42016 res!35733) b!42015))

(assert (= (and b!42015 (not res!35729)) b!42013))

(assert (= (and b!42013 (not res!35730)) b!42012))

(assert (= (and b!42012 (not res!35732)) b!42011))

(assert (= start!8392 b!42014))

(declare-fun m!63829 () Bool)

(assert (=> b!42016 m!63829))

(declare-fun m!63831 () Bool)

(assert (=> start!8392 m!63831))

(declare-fun m!63833 () Bool)

(assert (=> start!8392 m!63833))

(declare-fun m!63835 () Bool)

(assert (=> b!42011 m!63835))

(declare-fun m!63837 () Bool)

(assert (=> b!42011 m!63837))

(declare-fun m!63839 () Bool)

(assert (=> b!42011 m!63839))

(declare-fun m!63841 () Bool)

(assert (=> b!42013 m!63841))

(declare-fun m!63843 () Bool)

(assert (=> b!42015 m!63843))

(declare-fun m!63845 () Bool)

(assert (=> b!42015 m!63845))

(declare-fun m!63847 () Bool)

(assert (=> b!42015 m!63847))

(declare-fun m!63849 () Bool)

(assert (=> b!42014 m!63849))

(declare-fun m!63851 () Bool)

(assert (=> b!42012 m!63851))

(declare-fun m!63853 () Bool)

(assert (=> b!42012 m!63853))

(push 1)

(assert (not b!42015))

(assert (not b!42016))

(assert (not b!42013))

(assert (not start!8392))

(assert (not b!42014))

(assert (not b!42011))

(assert (not b!42012))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!12192 () Bool)

(declare-fun e!28048 () Bool)

(assert (=> d!12192 e!28048))

(declare-fun res!35811 () Bool)

(assert (=> d!12192 (=> (not res!35811) (not e!28048))))

(declare-fun lt!63285 () tuple2!4104)

(assert (=> d!12192 (= res!35811 (= (buf!1298 (_2!2142 lt!63285)) (buf!1298 (_1!2141 lt!63188))))))

(declare-datatypes ((tuple3!166 0))(
  ( (tuple3!167 (_1!2147 Unit!2991) (_2!2147 BitStream!1684) (_3!90 array!2144)) )
))
(declare-fun lt!63290 () tuple3!166)

(assert (=> d!12192 (= lt!63285 (tuple2!4105 (_3!90 lt!63290) (_2!2147 lt!63290)))))

(declare-fun readBitsLoop!0 (BitStream!1684 (_ BitVec 64) array!2144 (_ BitVec 64) (_ BitVec 64)) tuple3!166)

(assert (=> d!12192 (= lt!63290 (readBitsLoop!0 (_1!2141 lt!63188) (bvsub to!314 i!635) (array!2145 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!12192 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!12192 (= (readBits!0 (_1!2141 lt!63188) (bvsub to!314 i!635)) lt!63285)))

(declare-fun b!42099 () Bool)

(declare-fun res!35812 () Bool)

(assert (=> b!42099 (=> (not res!35812) (not e!28048))))

(assert (=> b!42099 (= res!35812 (invariant!0 (currentBit!2745 (_2!2142 lt!63285)) (currentByte!2750 (_2!2142 lt!63285)) (size!970 (buf!1298 (_2!2142 lt!63285)))))))

(declare-fun b!42100 () Bool)

(declare-datatypes ((List!489 0))(
  ( (Nil!486) (Cons!485 (h!604 Bool) (t!1239 List!489)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!1684 array!2144 (_ BitVec 64) (_ BitVec 64)) List!489)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1684 BitStream!1684 (_ BitVec 64)) List!489)

(assert (=> b!42100 (= e!28048 (= (byteArrayBitContentToList!0 (_2!2142 lt!63285) (_1!2142 lt!63285) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!2142 lt!63285) (_1!2141 lt!63188) (bvsub to!314 i!635))))))

(declare-fun b!42101 () Bool)

(declare-fun res!35810 () Bool)

(assert (=> b!42101 (=> (not res!35810) (not e!28048))))

(declare-fun lt!63291 () (_ BitVec 64))

(assert (=> b!42101 (= res!35810 (= (size!970 (_1!2142 lt!63285)) ((_ extract 31 0) lt!63291)))))

(assert (=> b!42101 (and (bvslt lt!63291 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!63291 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!63284 () (_ BitVec 64))

(declare-fun lt!63292 () (_ BitVec 64))

(assert (=> b!42101 (= lt!63291 (bvsdiv lt!63284 lt!63292))))

(assert (=> b!42101 (and (not (= lt!63292 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!63284 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!63292 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!42101 (= lt!63292 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!63286 () (_ BitVec 64))

(declare-fun lt!63287 () (_ BitVec 64))

(assert (=> b!42101 (= lt!63284 (bvsub lt!63286 lt!63287))))

(assert (=> b!42101 (or (= (bvand lt!63286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!63287 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!63286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!63286 lt!63287) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42101 (= lt!63287 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!63288 () (_ BitVec 64))

(assert (=> b!42101 (= lt!63286 (bvadd (bvsub to!314 i!635) lt!63288))))

(assert (=> b!42101 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!63288 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!63288) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42101 (= lt!63288 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!42102 () Bool)

(declare-fun res!35813 () Bool)

(assert (=> b!42102 (=> (not res!35813) (not e!28048))))

(declare-fun lt!63289 () (_ BitVec 64))

(assert (=> b!42102 (= res!35813 (= (bvadd lt!63289 (bvsub to!314 i!635)) (bitIndex!0 (size!970 (buf!1298 (_2!2142 lt!63285))) (currentByte!2750 (_2!2142 lt!63285)) (currentBit!2745 (_2!2142 lt!63285)))))))

(assert (=> b!42102 (or (not (= (bvand lt!63289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!63289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!63289 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42102 (= lt!63289 (bitIndex!0 (size!970 (buf!1298 (_1!2141 lt!63188))) (currentByte!2750 (_1!2141 lt!63188)) (currentBit!2745 (_1!2141 lt!63188))))))

(declare-fun b!42103 () Bool)

(declare-fun res!35814 () Bool)

(assert (=> b!42103 (=> (not res!35814) (not e!28048))))

(assert (=> b!42103 (= res!35814 (bvsle (currentByte!2750 (_1!2141 lt!63188)) (currentByte!2750 (_2!2142 lt!63285))))))

(assert (= (and d!12192 res!35811) b!42102))

(assert (= (and b!42102 res!35813) b!42099))

(assert (= (and b!42099 res!35812) b!42101))

(assert (= (and b!42101 res!35810) b!42103))

(assert (= (and b!42103 res!35814) b!42100))

(declare-fun m!63933 () Bool)

(assert (=> d!12192 m!63933))

(declare-fun m!63935 () Bool)

(assert (=> b!42099 m!63935))

(declare-fun m!63937 () Bool)

(assert (=> b!42100 m!63937))

(declare-fun m!63939 () Bool)

(assert (=> b!42100 m!63939))

(declare-fun m!63941 () Bool)

(assert (=> b!42102 m!63941))

(declare-fun m!63943 () Bool)

(assert (=> b!42102 m!63943))

(assert (=> b!42012 d!12192))

(declare-fun b!42135 () Bool)

(declare-fun res!35843 () Bool)

(declare-fun e!28063 () Bool)

(assert (=> b!42135 (=> (not res!35843) (not e!28063))))

(declare-fun lt!63364 () tuple2!4102)

(assert (=> b!42135 (= res!35843 (isPrefixOf!0 (_2!2141 lt!63364) thiss!1379))))

(declare-fun b!42136 () Bool)

(declare-fun e!28062 () Unit!2991)

(declare-fun Unit!2997 () Unit!2991)

(assert (=> b!42136 (= e!28062 Unit!2997)))

(declare-fun b!42137 () Bool)

(declare-fun res!35844 () Bool)

(assert (=> b!42137 (=> (not res!35844) (not e!28063))))

(assert (=> b!42137 (= res!35844 (isPrefixOf!0 (_1!2141 lt!63364) thiss!1379))))

(declare-fun lt!63365 () (_ BitVec 64))

(declare-fun lt!63380 () (_ BitVec 64))

(declare-fun b!42138 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1684 (_ BitVec 64)) BitStream!1684)

(assert (=> b!42138 (= e!28063 (= (_1!2141 lt!63364) (withMovedBitIndex!0 (_2!2141 lt!63364) (bvsub lt!63380 lt!63365))))))

(assert (=> b!42138 (or (= (bvand lt!63380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!63365 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!63380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!63380 lt!63365) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42138 (= lt!63365 (bitIndex!0 (size!970 (buf!1298 thiss!1379)) (currentByte!2750 thiss!1379) (currentBit!2745 thiss!1379)))))

(assert (=> b!42138 (= lt!63380 (bitIndex!0 (size!970 (buf!1298 thiss!1379)) (currentByte!2750 thiss!1379) (currentBit!2745 thiss!1379)))))

(declare-fun d!12216 () Bool)

(assert (=> d!12216 e!28063))

(declare-fun res!35842 () Bool)

(assert (=> d!12216 (=> (not res!35842) (not e!28063))))

(assert (=> d!12216 (= res!35842 (isPrefixOf!0 (_1!2141 lt!63364) (_2!2141 lt!63364)))))

(declare-fun lt!63381 () BitStream!1684)

(assert (=> d!12216 (= lt!63364 (tuple2!4103 lt!63381 thiss!1379))))

(declare-fun lt!63379 () Unit!2991)

(declare-fun lt!63376 () Unit!2991)

(assert (=> d!12216 (= lt!63379 lt!63376)))

(assert (=> d!12216 (isPrefixOf!0 lt!63381 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1684 BitStream!1684 BitStream!1684) Unit!2991)

(assert (=> d!12216 (= lt!63376 (lemmaIsPrefixTransitive!0 lt!63381 thiss!1379 thiss!1379))))

(declare-fun lt!63371 () Unit!2991)

(declare-fun lt!63370 () Unit!2991)

(assert (=> d!12216 (= lt!63371 lt!63370)))

(assert (=> d!12216 (isPrefixOf!0 lt!63381 thiss!1379)))

(assert (=> d!12216 (= lt!63370 (lemmaIsPrefixTransitive!0 lt!63381 thiss!1379 thiss!1379))))

(declare-fun lt!63363 () Unit!2991)

(assert (=> d!12216 (= lt!63363 e!28062)))

(declare-fun c!2772 () Bool)

(assert (=> d!12216 (= c!2772 (not (= (size!970 (buf!1298 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!63375 () Unit!2991)

(declare-fun lt!63378 () Unit!2991)

(assert (=> d!12216 (= lt!63375 lt!63378)))

(assert (=> d!12216 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12216 (= lt!63378 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!63368 () Unit!2991)

(declare-fun lt!63366 () Unit!2991)

(assert (=> d!12216 (= lt!63368 lt!63366)))

(assert (=> d!12216 (= lt!63366 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!63373 () Unit!2991)

(declare-fun lt!63374 () Unit!2991)

(assert (=> d!12216 (= lt!63373 lt!63374)))

(assert (=> d!12216 (isPrefixOf!0 lt!63381 lt!63381)))

(assert (=> d!12216 (= lt!63374 (lemmaIsPrefixRefl!0 lt!63381))))

(declare-fun lt!63372 () Unit!2991)

(declare-fun lt!63367 () Unit!2991)

(assert (=> d!12216 (= lt!63372 lt!63367)))

(assert (=> d!12216 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12216 (= lt!63367 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12216 (= lt!63381 (BitStream!1685 (buf!1298 thiss!1379) (currentByte!2750 thiss!1379) (currentBit!2745 thiss!1379)))))

(assert (=> d!12216 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12216 (= (reader!0 thiss!1379 thiss!1379) lt!63364)))

(declare-fun b!42139 () Bool)

(declare-fun lt!63369 () Unit!2991)

(assert (=> b!42139 (= e!28062 lt!63369)))

(declare-fun lt!63382 () (_ BitVec 64))

(assert (=> b!42139 (= lt!63382 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63377 () (_ BitVec 64))

(assert (=> b!42139 (= lt!63377 (bitIndex!0 (size!970 (buf!1298 thiss!1379)) (currentByte!2750 thiss!1379) (currentBit!2745 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2144 array!2144 (_ BitVec 64) (_ BitVec 64)) Unit!2991)

(assert (=> b!42139 (= lt!63369 (arrayBitRangesEqSymmetric!0 (buf!1298 thiss!1379) (buf!1298 thiss!1379) lt!63382 lt!63377))))

(declare-fun arrayBitRangesEq!0 (array!2144 array!2144 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42139 (arrayBitRangesEq!0 (buf!1298 thiss!1379) (buf!1298 thiss!1379) lt!63382 lt!63377)))

(assert (= (and d!12216 c!2772) b!42139))

(assert (= (and d!12216 (not c!2772)) b!42136))

(assert (= (and d!12216 res!35842) b!42137))

(assert (= (and b!42137 res!35844) b!42135))

(assert (= (and b!42135 res!35843) b!42138))

(declare-fun m!63971 () Bool)

(assert (=> b!42135 m!63971))

(assert (=> b!42139 m!63847))

(declare-fun m!63973 () Bool)

(assert (=> b!42139 m!63973))

(declare-fun m!63975 () Bool)

(assert (=> b!42139 m!63975))

(declare-fun m!63977 () Bool)

(assert (=> b!42138 m!63977))

(assert (=> b!42138 m!63847))

(assert (=> b!42138 m!63847))

(assert (=> d!12216 m!63845))

(assert (=> d!12216 m!63843))

(declare-fun m!63979 () Bool)

(assert (=> d!12216 m!63979))

(assert (=> d!12216 m!63843))

(assert (=> d!12216 m!63843))

(declare-fun m!63981 () Bool)

(assert (=> d!12216 m!63981))

(declare-fun m!63983 () Bool)

(assert (=> d!12216 m!63983))

(declare-fun m!63985 () Bool)

(assert (=> d!12216 m!63985))

(assert (=> d!12216 m!63983))

(declare-fun m!63987 () Bool)

(assert (=> d!12216 m!63987))

(assert (=> d!12216 m!63845))

(declare-fun m!63989 () Bool)

(assert (=> b!42137 m!63989))

(assert (=> b!42012 d!12216))

(declare-fun d!12232 () Bool)

(assert (=> d!12232 (= (invariant!0 (currentBit!2745 thiss!1379) (currentByte!2750 thiss!1379) (size!970 (buf!1298 thiss!1379))) (and (bvsge (currentBit!2745 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2745 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2750 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2750 thiss!1379) (size!970 (buf!1298 thiss!1379))) (and (= (currentBit!2745 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2750 thiss!1379) (size!970 (buf!1298 thiss!1379)))))))))

(assert (=> b!42013 d!12232))

(declare-fun d!12234 () Bool)

(assert (=> d!12234 (= (array_inv!895 srcBuffer!2) (bvsge (size!970 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8392 d!12234))

(declare-fun d!12236 () Bool)

(assert (=> d!12236 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2745 thiss!1379) (currentByte!2750 thiss!1379) (size!970 (buf!1298 thiss!1379))))))

(declare-fun bs!3291 () Bool)

(assert (= bs!3291 d!12236))

(assert (=> bs!3291 m!63841))

(assert (=> start!8392 d!12236))

(declare-fun d!12238 () Bool)

(assert (=> d!12238 (= (array_inv!895 (buf!1298 thiss!1379)) (bvsge (size!970 (buf!1298 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!42014 d!12238))

(declare-fun d!12240 () Bool)

(declare-fun res!35852 () Bool)

(declare-fun e!28069 () Bool)

(assert (=> d!12240 (=> (not res!35852) (not e!28069))))

(assert (=> d!12240 (= res!35852 (= (size!970 (buf!1298 thiss!1379)) (size!970 (buf!1298 thiss!1379))))))

(assert (=> d!12240 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!28069)))

(declare-fun b!42146 () Bool)

(declare-fun res!35851 () Bool)

(assert (=> b!42146 (=> (not res!35851) (not e!28069))))

(assert (=> b!42146 (= res!35851 (bvsle (bitIndex!0 (size!970 (buf!1298 thiss!1379)) (currentByte!2750 thiss!1379) (currentBit!2745 thiss!1379)) (bitIndex!0 (size!970 (buf!1298 thiss!1379)) (currentByte!2750 thiss!1379) (currentBit!2745 thiss!1379))))))

(declare-fun b!42147 () Bool)

(declare-fun e!28068 () Bool)

(assert (=> b!42147 (= e!28069 e!28068)))

(declare-fun res!35853 () Bool)

(assert (=> b!42147 (=> res!35853 e!28068)))

(assert (=> b!42147 (= res!35853 (= (size!970 (buf!1298 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!42148 () Bool)

(assert (=> b!42148 (= e!28068 (arrayBitRangesEq!0 (buf!1298 thiss!1379) (buf!1298 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!970 (buf!1298 thiss!1379)) (currentByte!2750 thiss!1379) (currentBit!2745 thiss!1379))))))

(assert (= (and d!12240 res!35852) b!42146))

(assert (= (and b!42146 res!35851) b!42147))

(assert (= (and b!42147 (not res!35853)) b!42148))

(assert (=> b!42146 m!63847))

(assert (=> b!42146 m!63847))

(assert (=> b!42148 m!63847))

(assert (=> b!42148 m!63847))

(declare-fun m!63991 () Bool)

(assert (=> b!42148 m!63991))

(assert (=> b!42015 d!12240))

(declare-fun d!12242 () Bool)

(assert (=> d!12242 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!63385 () Unit!2991)

(declare-fun choose!11 (BitStream!1684) Unit!2991)

(assert (=> d!12242 (= lt!63385 (choose!11 thiss!1379))))

(assert (=> d!12242 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!63385)))

(declare-fun bs!3293 () Bool)

(assert (= bs!3293 d!12242))

(assert (=> bs!3293 m!63843))

(declare-fun m!63993 () Bool)

(assert (=> bs!3293 m!63993))

(assert (=> b!42015 d!12242))

(declare-fun d!12244 () Bool)

(declare-fun e!28080 () Bool)

(assert (=> d!12244 e!28080))

(declare-fun res!35878 () Bool)

(assert (=> d!12244 (=> (not res!35878) (not e!28080))))

(declare-fun lt!63481 () (_ BitVec 64))

(declare-fun lt!63479 () (_ BitVec 64))

(declare-fun lt!63480 () (_ BitVec 64))

(assert (=> d!12244 (= res!35878 (= lt!63480 (bvsub lt!63479 lt!63481)))))

(assert (=> d!12244 (or (= (bvand lt!63479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!63481 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!63479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!63479 lt!63481) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12244 (= lt!63481 (remainingBits!0 ((_ sign_extend 32) (size!970 (buf!1298 thiss!1379))) ((_ sign_extend 32) (currentByte!2750 thiss!1379)) ((_ sign_extend 32) (currentBit!2745 thiss!1379))))))

(declare-fun lt!63477 () (_ BitVec 64))

(declare-fun lt!63478 () (_ BitVec 64))

(assert (=> d!12244 (= lt!63479 (bvmul lt!63477 lt!63478))))

(assert (=> d!12244 (or (= lt!63477 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!63478 (bvsdiv (bvmul lt!63477 lt!63478) lt!63477)))))

(assert (=> d!12244 (= lt!63478 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12244 (= lt!63477 ((_ sign_extend 32) (size!970 (buf!1298 thiss!1379))))))

(assert (=> d!12244 (= lt!63480 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2750 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2745 thiss!1379))))))

(assert (=> d!12244 (invariant!0 (currentBit!2745 thiss!1379) (currentByte!2750 thiss!1379) (size!970 (buf!1298 thiss!1379)))))

(assert (=> d!12244 (= (bitIndex!0 (size!970 (buf!1298 thiss!1379)) (currentByte!2750 thiss!1379) (currentBit!2745 thiss!1379)) lt!63480)))

(declare-fun b!42178 () Bool)

(declare-fun res!35877 () Bool)

(assert (=> b!42178 (=> (not res!35877) (not e!28080))))

(assert (=> b!42178 (= res!35877 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!63480))))

(declare-fun b!42179 () Bool)

(declare-fun lt!63476 () (_ BitVec 64))

(assert (=> b!42179 (= e!28080 (bvsle lt!63480 (bvmul lt!63476 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!42179 (or (= lt!63476 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!63476 #b0000000000000000000000000000000000000000000000000000000000001000) lt!63476)))))

(assert (=> b!42179 (= lt!63476 ((_ sign_extend 32) (size!970 (buf!1298 thiss!1379))))))

(assert (= (and d!12244 res!35878) b!42178))

(assert (= (and b!42178 res!35877) b!42179))

(declare-fun m!64015 () Bool)

(assert (=> d!12244 m!64015))

(assert (=> d!12244 m!63841))

(assert (=> b!42015 d!12244))

(declare-fun d!12250 () Bool)

(assert (=> d!12250 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!970 (buf!1298 (_1!2141 lt!63188)))) ((_ sign_extend 32) (currentByte!2750 (_1!2141 lt!63188))) ((_ sign_extend 32) (currentBit!2745 (_1!2141 lt!63188))) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!970 (buf!1298 (_1!2141 lt!63188)))) ((_ sign_extend 32) (currentByte!2750 (_1!2141 lt!63188))) ((_ sign_extend 32) (currentBit!2745 (_1!2141 lt!63188)))) (bvsub to!314 i!635)))))

(declare-fun bs!3295 () Bool)

(assert (= bs!3295 d!12250))

(declare-fun m!64017 () Bool)

(assert (=> bs!3295 m!64017))

(assert (=> b!42011 d!12250))

(declare-fun d!12252 () Bool)

(assert (=> d!12252 (validate_offset_bits!1 ((_ sign_extend 32) (size!970 (buf!1298 thiss!1379))) ((_ sign_extend 32) (currentByte!2750 thiss!1379)) ((_ sign_extend 32) (currentBit!2745 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!63493 () Unit!2991)

(declare-fun choose!9 (BitStream!1684 array!2144 (_ BitVec 64) BitStream!1684) Unit!2991)

(assert (=> d!12252 (= lt!63493 (choose!9 thiss!1379 (buf!1298 thiss!1379) (bvsub to!314 i!635) (BitStream!1685 (buf!1298 thiss!1379) (currentByte!2750 thiss!1379) (currentBit!2745 thiss!1379))))))

(assert (=> d!12252 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1298 thiss!1379) (bvsub to!314 i!635)) lt!63493)))

(declare-fun bs!3296 () Bool)

(assert (= bs!3296 d!12252))

(assert (=> bs!3296 m!63829))

(declare-fun m!64031 () Bool)

(assert (=> bs!3296 m!64031))

(assert (=> b!42011 d!12252))

(declare-fun d!12256 () Bool)

(declare-fun res!35888 () Bool)

(declare-fun e!28086 () Bool)

(assert (=> d!12256 (=> res!35888 e!28086)))

(assert (=> d!12256 (= res!35888 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12256 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2142 lt!63187) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!28086)))

(declare-fun b!42189 () Bool)

(declare-fun e!28087 () Bool)

(assert (=> b!42189 (= e!28086 e!28087)))

(declare-fun res!35889 () Bool)

(assert (=> b!42189 (=> (not res!35889) (not e!28087))))

(assert (=> b!42189 (= res!35889 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!1469 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!1469 (_1!2142 lt!63187)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!42190 () Bool)

(assert (=> b!42190 (= e!28087 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2142 lt!63187) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!12256 (not res!35888)) b!42189))

(assert (= (and b!42189 res!35889) b!42190))

(declare-fun m!64033 () Bool)

(assert (=> b!42189 m!64033))

(declare-fun m!64035 () Bool)

(assert (=> b!42189 m!64035))

(declare-fun m!64037 () Bool)

(assert (=> b!42189 m!64037))

(declare-fun m!64039 () Bool)

(assert (=> b!42189 m!64039))

(declare-fun m!64041 () Bool)

(assert (=> b!42190 m!64041))

(assert (=> b!42011 d!12256))

(declare-fun d!12258 () Bool)

(assert (=> d!12258 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!970 (buf!1298 thiss!1379))) ((_ sign_extend 32) (currentByte!2750 thiss!1379)) ((_ sign_extend 32) (currentBit!2745 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!970 (buf!1298 thiss!1379))) ((_ sign_extend 32) (currentByte!2750 thiss!1379)) ((_ sign_extend 32) (currentBit!2745 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3297 () Bool)

(assert (= bs!3297 d!12258))

(assert (=> bs!3297 m!64015))

(assert (=> b!42016 d!12258))

(push 1)

(assert (not b!42099))

(assert (not d!12192))

(assert (not b!42138))

(assert (not b!42190))

(assert (not d!12250))

(assert (not d!12252))

(assert (not b!42137))

(assert (not b!42102))

(assert (not b!42148))

(assert (not d!12258))

(assert (not b!42135))

(assert (not d!12216))

(assert (not d!12242))

(assert (not d!12236))

(assert (not d!12244))

(assert (not b!42146))

(assert (not b!42100))

(assert (not b!42139))

(check-sat)

(pop 1)

(push 1)

(check-sat)

