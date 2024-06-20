; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10006 () Bool)

(assert start!10006)

(declare-fun b!50350 () Bool)

(declare-fun e!33245 () Bool)

(declare-fun e!33244 () Bool)

(assert (=> b!50350 (= e!33245 e!33244)))

(declare-fun res!42127 () Bool)

(assert (=> b!50350 (=> res!42127 e!33244)))

(declare-datatypes ((array!2328 0))(
  ( (array!2329 (arr!1587 (Array (_ BitVec 32) (_ BitVec 8))) (size!1058 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1830 0))(
  ( (BitStream!1831 (buf!1413 array!2328) (currentByte!2936 (_ BitVec 32)) (currentBit!2931 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3491 0))(
  ( (Unit!3492) )
))
(declare-datatypes ((tuple2!4648 0))(
  ( (tuple2!4649 (_1!2429 Unit!3491) (_2!2429 BitStream!1830)) )
))
(declare-fun lt!78145 () tuple2!4648)

(declare-fun lt!78150 () tuple2!4648)

(assert (=> b!50350 (= res!42127 (not (= (size!1058 (buf!1413 (_2!2429 lt!78145))) (size!1058 (buf!1413 (_2!2429 lt!78150))))))))

(declare-fun e!33250 () Bool)

(assert (=> b!50350 e!33250))

(declare-fun res!42131 () Bool)

(assert (=> b!50350 (=> (not res!42131) (not e!33250))))

(declare-fun thiss!1379 () BitStream!1830)

(assert (=> b!50350 (= res!42131 (= (size!1058 (buf!1413 (_2!2429 lt!78150))) (size!1058 (buf!1413 thiss!1379))))))

(declare-fun srcBuffer!2 () array!2328)

(declare-fun b!50351 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun e!33246 () Bool)

(declare-datatypes ((tuple2!4650 0))(
  ( (tuple2!4651 (_1!2430 BitStream!1830) (_2!2430 BitStream!1830)) )
))
(declare-fun lt!78154 () tuple2!4650)

(declare-datatypes ((List!556 0))(
  ( (Nil!553) (Cons!552 (h!671 Bool) (t!1306 List!556)) )
))
(declare-fun head!375 (List!556) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1830 array!2328 (_ BitVec 64) (_ BitVec 64)) List!556)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1830 BitStream!1830 (_ BitVec 64)) List!556)

(assert (=> b!50351 (= e!33246 (= (head!375 (byteArrayBitContentToList!0 (_2!2429 lt!78145) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!375 (bitStreamReadBitsIntoList!0 (_2!2429 lt!78145) (_1!2430 lt!78154) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!42130 () Bool)

(declare-fun e!33240 () Bool)

(assert (=> start!10006 (=> (not res!42130) (not e!33240))))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10006 (= res!42130 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1058 srcBuffer!2))))))))

(assert (=> start!10006 e!33240))

(assert (=> start!10006 true))

(declare-fun array_inv!968 (array!2328) Bool)

(assert (=> start!10006 (array_inv!968 srcBuffer!2)))

(declare-fun e!33241 () Bool)

(declare-fun inv!12 (BitStream!1830) Bool)

(assert (=> start!10006 (and (inv!12 thiss!1379) e!33241)))

(declare-fun b!50352 () Bool)

(declare-fun res!42133 () Bool)

(assert (=> b!50352 (=> res!42133 e!33244)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!50352 (= res!42133 (not (invariant!0 (currentBit!2931 (_2!2429 lt!78145)) (currentByte!2936 (_2!2429 lt!78145)) (size!1058 (buf!1413 (_2!2429 lt!78150))))))))

(declare-fun b!50353 () Bool)

(declare-fun e!33251 () Bool)

(declare-fun e!33243 () Bool)

(assert (=> b!50353 (= e!33251 e!33243)))

(declare-fun res!42135 () Bool)

(assert (=> b!50353 (=> res!42135 e!33243)))

(declare-fun isPrefixOf!0 (BitStream!1830 BitStream!1830) Bool)

(assert (=> b!50353 (= res!42135 (not (isPrefixOf!0 (_2!2429 lt!78145) (_2!2429 lt!78150))))))

(assert (=> b!50353 (isPrefixOf!0 thiss!1379 (_2!2429 lt!78150))))

(declare-fun lt!78147 () Unit!3491)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1830 BitStream!1830 BitStream!1830) Unit!3491)

(assert (=> b!50353 (= lt!78147 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2429 lt!78145) (_2!2429 lt!78150)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1830 array!2328 (_ BitVec 64) (_ BitVec 64)) tuple2!4648)

(assert (=> b!50353 (= lt!78150 (appendBitsMSBFirstLoop!0 (_2!2429 lt!78145) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!50353 e!33246))

(declare-fun res!42141 () Bool)

(assert (=> b!50353 (=> (not res!42141) (not e!33246))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!50353 (= res!42141 (validate_offset_bits!1 ((_ sign_extend 32) (size!1058 (buf!1413 (_2!2429 lt!78145)))) ((_ sign_extend 32) (currentByte!2936 thiss!1379)) ((_ sign_extend 32) (currentBit!2931 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78153 () Unit!3491)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1830 array!2328 (_ BitVec 64)) Unit!3491)

(assert (=> b!50353 (= lt!78153 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1413 (_2!2429 lt!78145)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1830 BitStream!1830) tuple2!4650)

(assert (=> b!50353 (= lt!78154 (reader!0 thiss!1379 (_2!2429 lt!78145)))))

(declare-fun b!50354 () Bool)

(declare-fun e!33248 () Bool)

(assert (=> b!50354 (= e!33240 (not e!33248))))

(declare-fun res!42139 () Bool)

(assert (=> b!50354 (=> res!42139 e!33248)))

(assert (=> b!50354 (= res!42139 (bvsge i!635 to!314))))

(assert (=> b!50354 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!78142 () Unit!3491)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1830) Unit!3491)

(assert (=> b!50354 (= lt!78142 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!78148 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!50354 (= lt!78148 (bitIndex!0 (size!1058 (buf!1413 thiss!1379)) (currentByte!2936 thiss!1379) (currentBit!2931 thiss!1379)))))

(declare-fun b!50355 () Bool)

(declare-fun res!42137 () Bool)

(declare-fun e!33247 () Bool)

(assert (=> b!50355 (=> res!42137 e!33247)))

(declare-fun lt!78141 () List!556)

(declare-fun length!251 (List!556) Int)

(assert (=> b!50355 (= res!42137 (<= (length!251 lt!78141) 0))))

(declare-fun b!50356 () Bool)

(assert (=> b!50356 (= e!33244 e!33247)))

(declare-fun res!42140 () Bool)

(assert (=> b!50356 (=> res!42140 e!33247)))

(assert (=> b!50356 (= res!42140 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!78149 () (_ BitVec 64))

(declare-fun lt!78138 () List!556)

(declare-fun lt!78139 () tuple2!4650)

(assert (=> b!50356 (= lt!78138 (bitStreamReadBitsIntoList!0 (_2!2429 lt!78150) (_1!2430 lt!78139) lt!78149))))

(declare-fun lt!78144 () tuple2!4650)

(assert (=> b!50356 (= lt!78141 (bitStreamReadBitsIntoList!0 (_2!2429 lt!78150) (_1!2430 lt!78144) (bvsub to!314 i!635)))))

(assert (=> b!50356 (validate_offset_bits!1 ((_ sign_extend 32) (size!1058 (buf!1413 (_2!2429 lt!78150)))) ((_ sign_extend 32) (currentByte!2936 (_2!2429 lt!78145))) ((_ sign_extend 32) (currentBit!2931 (_2!2429 lt!78145))) lt!78149)))

(declare-fun lt!78140 () Unit!3491)

(assert (=> b!50356 (= lt!78140 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2429 lt!78145) (buf!1413 (_2!2429 lt!78150)) lt!78149))))

(assert (=> b!50356 (= lt!78139 (reader!0 (_2!2429 lt!78145) (_2!2429 lt!78150)))))

(assert (=> b!50356 (validate_offset_bits!1 ((_ sign_extend 32) (size!1058 (buf!1413 (_2!2429 lt!78150)))) ((_ sign_extend 32) (currentByte!2936 thiss!1379)) ((_ sign_extend 32) (currentBit!2931 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!78151 () Unit!3491)

(assert (=> b!50356 (= lt!78151 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1413 (_2!2429 lt!78150)) (bvsub to!314 i!635)))))

(assert (=> b!50356 (= lt!78144 (reader!0 thiss!1379 (_2!2429 lt!78150)))))

(declare-fun b!50357 () Bool)

(assert (=> b!50357 (= e!33248 e!33251)))

(declare-fun res!42138 () Bool)

(assert (=> b!50357 (=> res!42138 e!33251)))

(assert (=> b!50357 (= res!42138 (not (isPrefixOf!0 thiss!1379 (_2!2429 lt!78145))))))

(assert (=> b!50357 (validate_offset_bits!1 ((_ sign_extend 32) (size!1058 (buf!1413 (_2!2429 lt!78145)))) ((_ sign_extend 32) (currentByte!2936 (_2!2429 lt!78145))) ((_ sign_extend 32) (currentBit!2931 (_2!2429 lt!78145))) lt!78149)))

(assert (=> b!50357 (= lt!78149 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78152 () Unit!3491)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1830 BitStream!1830 (_ BitVec 64) (_ BitVec 64)) Unit!3491)

(assert (=> b!50357 (= lt!78152 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2429 lt!78145) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1830 (_ BitVec 8) (_ BitVec 32)) tuple2!4648)

(assert (=> b!50357 (= lt!78145 (appendBitFromByte!0 thiss!1379 (select (arr!1587 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!50358 () Bool)

(declare-fun res!42129 () Bool)

(assert (=> b!50358 (=> res!42129 e!33245)))

(assert (=> b!50358 (= res!42129 (not (invariant!0 (currentBit!2931 (_2!2429 lt!78150)) (currentByte!2936 (_2!2429 lt!78150)) (size!1058 (buf!1413 (_2!2429 lt!78150))))))))

(declare-fun b!50359 () Bool)

(declare-fun lt!78143 () (_ BitVec 64))

(assert (=> b!50359 (= e!33250 (= lt!78143 (bvsub (bvsub (bvadd (bitIndex!0 (size!1058 (buf!1413 (_2!2429 lt!78145))) (currentByte!2936 (_2!2429 lt!78145)) (currentBit!2931 (_2!2429 lt!78145))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!50360 () Bool)

(declare-fun res!42128 () Bool)

(assert (=> b!50360 (=> (not res!42128) (not e!33240))))

(assert (=> b!50360 (= res!42128 (validate_offset_bits!1 ((_ sign_extend 32) (size!1058 (buf!1413 thiss!1379))) ((_ sign_extend 32) (currentByte!2936 thiss!1379)) ((_ sign_extend 32) (currentBit!2931 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!50361 () Bool)

(assert (=> b!50361 (= e!33243 e!33245)))

(declare-fun res!42134 () Bool)

(assert (=> b!50361 (=> res!42134 e!33245)))

(assert (=> b!50361 (= res!42134 (not (= lt!78143 (bvsub (bvadd lt!78148 to!314) i!635))))))

(assert (=> b!50361 (= lt!78143 (bitIndex!0 (size!1058 (buf!1413 (_2!2429 lt!78150))) (currentByte!2936 (_2!2429 lt!78150)) (currentBit!2931 (_2!2429 lt!78150))))))

(declare-fun b!50362 () Bool)

(assert (=> b!50362 (= e!33247 true)))

(declare-fun tail!242 (List!556) List!556)

(assert (=> b!50362 (= lt!78138 (tail!242 lt!78141))))

(declare-fun lt!78146 () Unit!3491)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1830 BitStream!1830 BitStream!1830 BitStream!1830 (_ BitVec 64) List!556) Unit!3491)

(assert (=> b!50362 (= lt!78146 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2429 lt!78150) (_2!2429 lt!78150) (_1!2430 lt!78144) (_1!2430 lt!78139) (bvsub to!314 i!635) lt!78141))))

(declare-fun b!50363 () Bool)

(declare-fun res!42132 () Bool)

(assert (=> b!50363 (=> res!42132 e!33245)))

(assert (=> b!50363 (= res!42132 (not (= (size!1058 (buf!1413 thiss!1379)) (size!1058 (buf!1413 (_2!2429 lt!78150))))))))

(declare-fun b!50364 () Bool)

(declare-fun res!42136 () Bool)

(assert (=> b!50364 (=> res!42136 e!33244)))

(assert (=> b!50364 (= res!42136 (not (invariant!0 (currentBit!2931 (_2!2429 lt!78145)) (currentByte!2936 (_2!2429 lt!78145)) (size!1058 (buf!1413 (_2!2429 lt!78145))))))))

(declare-fun b!50365 () Bool)

(assert (=> b!50365 (= e!33241 (array_inv!968 (buf!1413 thiss!1379)))))

(assert (= (and start!10006 res!42130) b!50360))

(assert (= (and b!50360 res!42128) b!50354))

(assert (= (and b!50354 (not res!42139)) b!50357))

(assert (= (and b!50357 (not res!42138)) b!50353))

(assert (= (and b!50353 res!42141) b!50351))

(assert (= (and b!50353 (not res!42135)) b!50361))

(assert (= (and b!50361 (not res!42134)) b!50358))

(assert (= (and b!50358 (not res!42129)) b!50363))

(assert (= (and b!50363 (not res!42132)) b!50350))

(assert (= (and b!50350 res!42131) b!50359))

(assert (= (and b!50350 (not res!42127)) b!50364))

(assert (= (and b!50364 (not res!42136)) b!50352))

(assert (= (and b!50352 (not res!42133)) b!50356))

(assert (= (and b!50356 (not res!42140)) b!50355))

(assert (= (and b!50355 (not res!42137)) b!50362))

(assert (= start!10006 b!50365))

(declare-fun m!79215 () Bool)

(assert (=> b!50355 m!79215))

(declare-fun m!79217 () Bool)

(assert (=> b!50365 m!79217))

(declare-fun m!79219 () Bool)

(assert (=> b!50359 m!79219))

(declare-fun m!79221 () Bool)

(assert (=> b!50351 m!79221))

(assert (=> b!50351 m!79221))

(declare-fun m!79223 () Bool)

(assert (=> b!50351 m!79223))

(declare-fun m!79225 () Bool)

(assert (=> b!50351 m!79225))

(assert (=> b!50351 m!79225))

(declare-fun m!79227 () Bool)

(assert (=> b!50351 m!79227))

(declare-fun m!79229 () Bool)

(assert (=> b!50356 m!79229))

(declare-fun m!79231 () Bool)

(assert (=> b!50356 m!79231))

(declare-fun m!79233 () Bool)

(assert (=> b!50356 m!79233))

(declare-fun m!79235 () Bool)

(assert (=> b!50356 m!79235))

(declare-fun m!79237 () Bool)

(assert (=> b!50356 m!79237))

(declare-fun m!79239 () Bool)

(assert (=> b!50356 m!79239))

(declare-fun m!79241 () Bool)

(assert (=> b!50356 m!79241))

(declare-fun m!79243 () Bool)

(assert (=> b!50356 m!79243))

(declare-fun m!79245 () Bool)

(assert (=> b!50357 m!79245))

(declare-fun m!79247 () Bool)

(assert (=> b!50357 m!79247))

(declare-fun m!79249 () Bool)

(assert (=> b!50357 m!79249))

(declare-fun m!79251 () Bool)

(assert (=> b!50357 m!79251))

(assert (=> b!50357 m!79247))

(declare-fun m!79253 () Bool)

(assert (=> b!50357 m!79253))

(declare-fun m!79255 () Bool)

(assert (=> b!50362 m!79255))

(declare-fun m!79257 () Bool)

(assert (=> b!50362 m!79257))

(declare-fun m!79259 () Bool)

(assert (=> b!50352 m!79259))

(declare-fun m!79261 () Bool)

(assert (=> b!50361 m!79261))

(declare-fun m!79263 () Bool)

(assert (=> b!50353 m!79263))

(declare-fun m!79265 () Bool)

(assert (=> b!50353 m!79265))

(declare-fun m!79267 () Bool)

(assert (=> b!50353 m!79267))

(declare-fun m!79269 () Bool)

(assert (=> b!50353 m!79269))

(declare-fun m!79271 () Bool)

(assert (=> b!50353 m!79271))

(declare-fun m!79273 () Bool)

(assert (=> b!50353 m!79273))

(declare-fun m!79275 () Bool)

(assert (=> b!50353 m!79275))

(declare-fun m!79277 () Bool)

(assert (=> b!50364 m!79277))

(declare-fun m!79279 () Bool)

(assert (=> b!50354 m!79279))

(declare-fun m!79281 () Bool)

(assert (=> b!50354 m!79281))

(declare-fun m!79283 () Bool)

(assert (=> b!50354 m!79283))

(declare-fun m!79285 () Bool)

(assert (=> b!50358 m!79285))

(declare-fun m!79287 () Bool)

(assert (=> start!10006 m!79287))

(declare-fun m!79289 () Bool)

(assert (=> start!10006 m!79289))

(declare-fun m!79291 () Bool)

(assert (=> b!50360 m!79291))

(check-sat (not b!50365) (not b!50353) (not b!50360) (not b!50355) (not b!50358) (not b!50352) (not b!50362) (not start!10006) (not b!50361) (not b!50356) (not b!50364) (not b!50357) (not b!50354) (not b!50359) (not b!50351))
