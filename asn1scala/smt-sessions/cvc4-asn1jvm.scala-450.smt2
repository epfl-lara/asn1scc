; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11896 () Bool)

(assert start!11896)

(declare-fun b!60446 () Bool)

(declare-fun res!50411 () Bool)

(declare-fun e!40336 () Bool)

(assert (=> b!60446 (=> res!50411 e!40336)))

(declare-datatypes ((array!2753 0))(
  ( (array!2754 (arr!1816 (Array (_ BitVec 32) (_ BitVec 8))) (size!1252 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2192 0))(
  ( (BitStream!2193 (buf!1633 array!2753) (currentByte!3251 (_ BitVec 32)) (currentBit!3246 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4127 0))(
  ( (Unit!4128) )
))
(declare-datatypes ((tuple2!5506 0))(
  ( (tuple2!5507 (_1!2864 Unit!4127) (_2!2864 BitStream!2192)) )
))
(declare-fun lt!94318 () tuple2!5506)

(declare-fun lt!94315 () tuple2!5506)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!60446 (= res!50411 (not (invariant!0 (currentBit!3246 (_2!2864 lt!94318)) (currentByte!3251 (_2!2864 lt!94318)) (size!1252 (buf!1633 (_2!2864 lt!94315))))))))

(declare-fun res!50413 () Bool)

(declare-fun e!40335 () Bool)

(assert (=> start!11896 (=> (not res!50413) (not e!40335))))

(declare-fun srcBuffer!2 () array!2753)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> start!11896 (= res!50413 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1252 srcBuffer!2))))))))

(assert (=> start!11896 e!40335))

(assert (=> start!11896 true))

(declare-fun array_inv!1155 (array!2753) Bool)

(assert (=> start!11896 (array_inv!1155 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!2192)

(declare-fun e!40342 () Bool)

(declare-fun inv!12 (BitStream!2192) Bool)

(assert (=> start!11896 (and (inv!12 thiss!1379) e!40342)))

(declare-fun b!60447 () Bool)

(declare-fun res!50410 () Bool)

(declare-fun e!40332 () Bool)

(assert (=> b!60447 (=> res!50410 e!40332)))

(assert (=> b!60447 (= res!50410 (not (= (size!1252 (buf!1633 thiss!1379)) (size!1252 (buf!1633 (_2!2864 lt!94315))))))))

(declare-fun b!60448 () Bool)

(assert (=> b!60448 (= e!40332 e!40336)))

(declare-fun res!50407 () Bool)

(assert (=> b!60448 (=> res!50407 e!40336)))

(assert (=> b!60448 (= res!50407 (not (= (size!1252 (buf!1633 (_2!2864 lt!94318))) (size!1252 (buf!1633 (_2!2864 lt!94315))))))))

(declare-fun e!40333 () Bool)

(assert (=> b!60448 e!40333))

(declare-fun res!50404 () Bool)

(assert (=> b!60448 (=> (not res!50404) (not e!40333))))

(assert (=> b!60448 (= res!50404 (= (size!1252 (buf!1633 (_2!2864 lt!94315))) (size!1252 (buf!1633 thiss!1379))))))

(declare-fun b!60449 () Bool)

(assert (=> b!60449 (= e!40342 (array_inv!1155 (buf!1633 thiss!1379)))))

(declare-fun b!60450 () Bool)

(declare-fun e!40343 () Bool)

(assert (=> b!60450 (= e!40335 (not e!40343))))

(declare-fun res!50412 () Bool)

(assert (=> b!60450 (=> res!50412 e!40343)))

(assert (=> b!60450 (= res!50412 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2192 BitStream!2192) Bool)

(assert (=> b!60450 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!94322 () Unit!4127)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2192) Unit!4127)

(assert (=> b!60450 (= lt!94322 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!94319 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!60450 (= lt!94319 (bitIndex!0 (size!1252 (buf!1633 thiss!1379)) (currentByte!3251 thiss!1379) (currentBit!3246 thiss!1379)))))

(declare-fun e!40341 () Bool)

(declare-fun b!60451 () Bool)

(declare-datatypes ((tuple2!5508 0))(
  ( (tuple2!5509 (_1!2865 BitStream!2192) (_2!2865 BitStream!2192)) )
))
(declare-fun lt!94325 () tuple2!5508)

(declare-datatypes ((List!671 0))(
  ( (Nil!668) (Cons!667 (h!786 Bool) (t!1421 List!671)) )
))
(declare-fun head!490 (List!671) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2192 array!2753 (_ BitVec 64) (_ BitVec 64)) List!671)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2192 BitStream!2192 (_ BitVec 64)) List!671)

(assert (=> b!60451 (= e!40341 (= (head!490 (byteArrayBitContentToList!0 (_2!2864 lt!94318) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!490 (bitStreamReadBitsIntoList!0 (_2!2864 lt!94318) (_1!2865 lt!94325) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!60452 () Bool)

(declare-fun res!50409 () Bool)

(assert (=> b!60452 (=> (not res!50409) (not e!40335))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!60452 (= res!50409 (validate_offset_bits!1 ((_ sign_extend 32) (size!1252 (buf!1633 thiss!1379))) ((_ sign_extend 32) (currentByte!3251 thiss!1379)) ((_ sign_extend 32) (currentBit!3246 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!60453 () Bool)

(declare-fun e!40340 () Bool)

(assert (=> b!60453 (= e!40343 e!40340)))

(declare-fun res!50402 () Bool)

(assert (=> b!60453 (=> res!50402 e!40340)))

(assert (=> b!60453 (= res!50402 (not (isPrefixOf!0 thiss!1379 (_2!2864 lt!94318))))))

(declare-fun lt!94326 () (_ BitVec 64))

(assert (=> b!60453 (validate_offset_bits!1 ((_ sign_extend 32) (size!1252 (buf!1633 (_2!2864 lt!94318)))) ((_ sign_extend 32) (currentByte!3251 (_2!2864 lt!94318))) ((_ sign_extend 32) (currentBit!3246 (_2!2864 lt!94318))) lt!94326)))

(assert (=> b!60453 (= lt!94326 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94320 () Unit!4127)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2192 BitStream!2192 (_ BitVec 64) (_ BitVec 64)) Unit!4127)

(assert (=> b!60453 (= lt!94320 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2864 lt!94318) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2192 (_ BitVec 8) (_ BitVec 32)) tuple2!5506)

(assert (=> b!60453 (= lt!94318 (appendBitFromByte!0 thiss!1379 (select (arr!1816 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!60454 () Bool)

(declare-fun e!40334 () Bool)

(assert (=> b!60454 (= e!40340 e!40334)))

(declare-fun res!50405 () Bool)

(assert (=> b!60454 (=> res!50405 e!40334)))

(assert (=> b!60454 (= res!50405 (not (isPrefixOf!0 (_2!2864 lt!94318) (_2!2864 lt!94315))))))

(assert (=> b!60454 (isPrefixOf!0 thiss!1379 (_2!2864 lt!94315))))

(declare-fun lt!94313 () Unit!4127)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2192 BitStream!2192 BitStream!2192) Unit!4127)

(assert (=> b!60454 (= lt!94313 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2864 lt!94318) (_2!2864 lt!94315)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2192 array!2753 (_ BitVec 64) (_ BitVec 64)) tuple2!5506)

(assert (=> b!60454 (= lt!94315 (appendBitsMSBFirstLoop!0 (_2!2864 lt!94318) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!60454 e!40341))

(declare-fun res!50415 () Bool)

(assert (=> b!60454 (=> (not res!50415) (not e!40341))))

(assert (=> b!60454 (= res!50415 (validate_offset_bits!1 ((_ sign_extend 32) (size!1252 (buf!1633 (_2!2864 lt!94318)))) ((_ sign_extend 32) (currentByte!3251 thiss!1379)) ((_ sign_extend 32) (currentBit!3246 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94327 () Unit!4127)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2192 array!2753 (_ BitVec 64)) Unit!4127)

(assert (=> b!60454 (= lt!94327 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1633 (_2!2864 lt!94318)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2192 BitStream!2192) tuple2!5508)

(assert (=> b!60454 (= lt!94325 (reader!0 thiss!1379 (_2!2864 lt!94318)))))

(declare-fun b!60455 () Bool)

(declare-fun res!50408 () Bool)

(assert (=> b!60455 (=> res!50408 e!40336)))

(assert (=> b!60455 (= res!50408 (not (invariant!0 (currentBit!3246 (_2!2864 lt!94318)) (currentByte!3251 (_2!2864 lt!94318)) (size!1252 (buf!1633 (_2!2864 lt!94318))))))))

(declare-fun b!60456 () Bool)

(assert (=> b!60456 (= e!40334 e!40332)))

(declare-fun res!50406 () Bool)

(assert (=> b!60456 (=> res!50406 e!40332)))

(declare-fun lt!94312 () (_ BitVec 64))

(assert (=> b!60456 (= res!50406 (not (= lt!94312 (bvsub (bvadd lt!94319 to!314) i!635))))))

(assert (=> b!60456 (= lt!94312 (bitIndex!0 (size!1252 (buf!1633 (_2!2864 lt!94315))) (currentByte!3251 (_2!2864 lt!94315)) (currentBit!3246 (_2!2864 lt!94315))))))

(declare-fun b!60457 () Bool)

(declare-fun res!50414 () Bool)

(assert (=> b!60457 (=> res!50414 e!40332)))

(assert (=> b!60457 (= res!50414 (not (invariant!0 (currentBit!3246 (_2!2864 lt!94315)) (currentByte!3251 (_2!2864 lt!94315)) (size!1252 (buf!1633 (_2!2864 lt!94315))))))))

(declare-fun b!60458 () Bool)

(assert (=> b!60458 (= e!40333 (= lt!94312 (bvsub (bvsub (bvadd (bitIndex!0 (size!1252 (buf!1633 (_2!2864 lt!94318))) (currentByte!3251 (_2!2864 lt!94318)) (currentBit!3246 (_2!2864 lt!94318))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!60459 () Bool)

(declare-fun e!40338 () Bool)

(assert (=> b!60459 (= e!40338 true)))

(declare-fun lt!94316 () Int)

(declare-fun lt!94323 () List!671)

(declare-fun length!299 (List!671) Int)

(assert (=> b!60459 (= lt!94316 (length!299 lt!94323))))

(declare-fun b!60460 () Bool)

(assert (=> b!60460 (= e!40336 e!40338)))

(declare-fun res!50403 () Bool)

(assert (=> b!60460 (=> res!50403 e!40338)))

(assert (=> b!60460 (= res!50403 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!94324 () List!671)

(declare-fun lt!94317 () tuple2!5508)

(assert (=> b!60460 (= lt!94324 (bitStreamReadBitsIntoList!0 (_2!2864 lt!94315) (_1!2865 lt!94317) lt!94326))))

(declare-fun lt!94321 () tuple2!5508)

(assert (=> b!60460 (= lt!94323 (bitStreamReadBitsIntoList!0 (_2!2864 lt!94315) (_1!2865 lt!94321) (bvsub to!314 i!635)))))

(assert (=> b!60460 (validate_offset_bits!1 ((_ sign_extend 32) (size!1252 (buf!1633 (_2!2864 lt!94315)))) ((_ sign_extend 32) (currentByte!3251 (_2!2864 lt!94318))) ((_ sign_extend 32) (currentBit!3246 (_2!2864 lt!94318))) lt!94326)))

(declare-fun lt!94314 () Unit!4127)

(assert (=> b!60460 (= lt!94314 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2864 lt!94318) (buf!1633 (_2!2864 lt!94315)) lt!94326))))

(assert (=> b!60460 (= lt!94317 (reader!0 (_2!2864 lt!94318) (_2!2864 lt!94315)))))

(assert (=> b!60460 (validate_offset_bits!1 ((_ sign_extend 32) (size!1252 (buf!1633 (_2!2864 lt!94315)))) ((_ sign_extend 32) (currentByte!3251 thiss!1379)) ((_ sign_extend 32) (currentBit!3246 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!94311 () Unit!4127)

(assert (=> b!60460 (= lt!94311 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1633 (_2!2864 lt!94315)) (bvsub to!314 i!635)))))

(assert (=> b!60460 (= lt!94321 (reader!0 thiss!1379 (_2!2864 lt!94315)))))

(assert (= (and start!11896 res!50413) b!60452))

(assert (= (and b!60452 res!50409) b!60450))

(assert (= (and b!60450 (not res!50412)) b!60453))

(assert (= (and b!60453 (not res!50402)) b!60454))

(assert (= (and b!60454 res!50415) b!60451))

(assert (= (and b!60454 (not res!50405)) b!60456))

(assert (= (and b!60456 (not res!50406)) b!60457))

(assert (= (and b!60457 (not res!50414)) b!60447))

(assert (= (and b!60447 (not res!50410)) b!60448))

(assert (= (and b!60448 res!50404) b!60458))

(assert (= (and b!60448 (not res!50407)) b!60455))

(assert (= (and b!60455 (not res!50408)) b!60446))

(assert (= (and b!60446 (not res!50411)) b!60460))

(assert (= (and b!60460 (not res!50403)) b!60459))

(assert (= start!11896 b!60449))

(declare-fun m!95243 () Bool)

(assert (=> b!60456 m!95243))

(declare-fun m!95245 () Bool)

(assert (=> b!60459 m!95245))

(declare-fun m!95247 () Bool)

(assert (=> b!60457 m!95247))

(declare-fun m!95249 () Bool)

(assert (=> b!60451 m!95249))

(assert (=> b!60451 m!95249))

(declare-fun m!95251 () Bool)

(assert (=> b!60451 m!95251))

(declare-fun m!95253 () Bool)

(assert (=> b!60451 m!95253))

(assert (=> b!60451 m!95253))

(declare-fun m!95255 () Bool)

(assert (=> b!60451 m!95255))

(declare-fun m!95257 () Bool)

(assert (=> b!60454 m!95257))

(declare-fun m!95259 () Bool)

(assert (=> b!60454 m!95259))

(declare-fun m!95261 () Bool)

(assert (=> b!60454 m!95261))

(declare-fun m!95263 () Bool)

(assert (=> b!60454 m!95263))

(declare-fun m!95265 () Bool)

(assert (=> b!60454 m!95265))

(declare-fun m!95267 () Bool)

(assert (=> b!60454 m!95267))

(declare-fun m!95269 () Bool)

(assert (=> b!60454 m!95269))

(declare-fun m!95271 () Bool)

(assert (=> b!60452 m!95271))

(declare-fun m!95273 () Bool)

(assert (=> b!60460 m!95273))

(declare-fun m!95275 () Bool)

(assert (=> b!60460 m!95275))

(declare-fun m!95277 () Bool)

(assert (=> b!60460 m!95277))

(declare-fun m!95279 () Bool)

(assert (=> b!60460 m!95279))

(declare-fun m!95281 () Bool)

(assert (=> b!60460 m!95281))

(declare-fun m!95283 () Bool)

(assert (=> b!60460 m!95283))

(declare-fun m!95285 () Bool)

(assert (=> b!60460 m!95285))

(declare-fun m!95287 () Bool)

(assert (=> b!60460 m!95287))

(declare-fun m!95289 () Bool)

(assert (=> b!60455 m!95289))

(declare-fun m!95291 () Bool)

(assert (=> b!60446 m!95291))

(declare-fun m!95293 () Bool)

(assert (=> start!11896 m!95293))

(declare-fun m!95295 () Bool)

(assert (=> start!11896 m!95295))

(declare-fun m!95297 () Bool)

(assert (=> b!60453 m!95297))

(declare-fun m!95299 () Bool)

(assert (=> b!60453 m!95299))

(declare-fun m!95301 () Bool)

(assert (=> b!60453 m!95301))

(declare-fun m!95303 () Bool)

(assert (=> b!60453 m!95303))

(assert (=> b!60453 m!95297))

(declare-fun m!95305 () Bool)

(assert (=> b!60453 m!95305))

(declare-fun m!95307 () Bool)

(assert (=> b!60450 m!95307))

(declare-fun m!95309 () Bool)

(assert (=> b!60450 m!95309))

(declare-fun m!95311 () Bool)

(assert (=> b!60450 m!95311))

(declare-fun m!95313 () Bool)

(assert (=> b!60449 m!95313))

(declare-fun m!95315 () Bool)

(assert (=> b!60458 m!95315))

(push 1)

(assert (not b!60450))

(assert (not b!60453))

(assert (not b!60455))

(assert (not start!11896))

(assert (not b!60449))

(assert (not b!60456))

(assert (not b!60454))

(assert (not b!60460))

(assert (not b!60458))

(assert (not b!60457))

(assert (not b!60452))

(assert (not b!60459))

(assert (not b!60446))

(assert (not b!60451))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

