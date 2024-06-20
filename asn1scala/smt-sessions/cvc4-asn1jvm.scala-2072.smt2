; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52494 () Bool)

(assert start!52494)

(declare-fun res!202421 () Bool)

(declare-fun e!168041 () Bool)

(assert (=> start!52494 (=> (not res!202421) (not e!168041))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!52494 (= res!202421 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52494 e!168041))

(assert (=> start!52494 true))

(declare-datatypes ((array!13305 0))(
  ( (array!13306 (arr!6819 (Array (_ BitVec 32) (_ BitVec 8))) (size!5832 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10586 0))(
  ( (BitStream!10587 (buf!6298 array!13305) (currentByte!11661 (_ BitVec 32)) (currentBit!11656 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10586)

(declare-fun e!168049 () Bool)

(declare-fun inv!12 (BitStream!10586) Bool)

(assert (=> start!52494 (and (inv!12 thiss!1005) e!168049)))

(declare-fun b!242389 () Bool)

(declare-fun e!168044 () Bool)

(declare-datatypes ((tuple2!20742 0))(
  ( (tuple2!20743 (_1!11293 BitStream!10586) (_2!11293 Bool)) )
))
(declare-fun lt!377803 () tuple2!20742)

(declare-datatypes ((tuple2!20744 0))(
  ( (tuple2!20745 (_1!11294 BitStream!10586) (_2!11294 BitStream!10586)) )
))
(declare-fun lt!377812 () tuple2!20744)

(assert (=> b!242389 (= e!168044 (not (or (not (_2!11293 lt!377803)) (not (= (_1!11293 lt!377803) (_2!11294 lt!377812))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10586 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20742)

(assert (=> b!242389 (= lt!377803 (checkBitsLoopPure!0 (_1!11294 lt!377812) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!17747 0))(
  ( (Unit!17748) )
))
(declare-datatypes ((tuple2!20746 0))(
  ( (tuple2!20747 (_1!11295 Unit!17747) (_2!11295 BitStream!10586)) )
))
(declare-fun lt!377807 () tuple2!20746)

(declare-fun lt!377816 () tuple2!20746)

(declare-fun lt!377804 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242389 (validate_offset_bits!1 ((_ sign_extend 32) (size!5832 (buf!6298 (_2!11295 lt!377807)))) ((_ sign_extend 32) (currentByte!11661 (_2!11295 lt!377816))) ((_ sign_extend 32) (currentBit!11656 (_2!11295 lt!377816))) lt!377804)))

(declare-fun lt!377811 () Unit!17747)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10586 array!13305 (_ BitVec 64)) Unit!17747)

(assert (=> b!242389 (= lt!377811 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11295 lt!377816) (buf!6298 (_2!11295 lt!377807)) lt!377804))))

(declare-fun reader!0 (BitStream!10586 BitStream!10586) tuple2!20744)

(assert (=> b!242389 (= lt!377812 (reader!0 (_2!11295 lt!377816) (_2!11295 lt!377807)))))

(declare-fun b!242390 () Bool)

(declare-fun e!168046 () Bool)

(declare-fun e!168048 () Bool)

(assert (=> b!242390 (= e!168046 e!168048)))

(declare-fun res!202422 () Bool)

(assert (=> b!242390 (=> (not res!202422) (not e!168048))))

(declare-fun lt!377817 () (_ BitVec 64))

(declare-fun lt!377808 () (_ BitVec 64))

(assert (=> b!242390 (= res!202422 (= lt!377817 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377808)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!242390 (= lt!377817 (bitIndex!0 (size!5832 (buf!6298 (_2!11295 lt!377816))) (currentByte!11661 (_2!11295 lt!377816)) (currentBit!11656 (_2!11295 lt!377816))))))

(assert (=> b!242390 (= lt!377808 (bitIndex!0 (size!5832 (buf!6298 thiss!1005)) (currentByte!11661 thiss!1005) (currentBit!11656 thiss!1005)))))

(declare-fun b!242391 () Bool)

(declare-fun e!168042 () Bool)

(assert (=> b!242391 (= e!168042 e!168044)))

(declare-fun res!202424 () Bool)

(assert (=> b!242391 (=> (not res!202424) (not e!168044))))

(assert (=> b!242391 (= res!202424 (= (bitIndex!0 (size!5832 (buf!6298 (_2!11295 lt!377807))) (currentByte!11661 (_2!11295 lt!377807)) (currentBit!11656 (_2!11295 lt!377807))) (bvadd (bitIndex!0 (size!5832 (buf!6298 (_2!11295 lt!377816))) (currentByte!11661 (_2!11295 lt!377816)) (currentBit!11656 (_2!11295 lt!377816))) lt!377804)))))

(assert (=> b!242391 (= lt!377804 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!242392 () Bool)

(declare-fun array_inv!5573 (array!13305) Bool)

(assert (=> b!242392 (= e!168049 (array_inv!5573 (buf!6298 thiss!1005)))))

(declare-fun b!242393 () Bool)

(declare-fun res!202415 () Bool)

(assert (=> b!242393 (=> (not res!202415) (not e!168041))))

(assert (=> b!242393 (= res!202415 (validate_offset_bits!1 ((_ sign_extend 32) (size!5832 (buf!6298 thiss!1005))) ((_ sign_extend 32) (currentByte!11661 thiss!1005)) ((_ sign_extend 32) (currentBit!11656 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!242394 () Bool)

(declare-fun res!202419 () Bool)

(assert (=> b!242394 (=> (not res!202419) (not e!168048))))

(declare-fun isPrefixOf!0 (BitStream!10586 BitStream!10586) Bool)

(assert (=> b!242394 (= res!202419 (isPrefixOf!0 thiss!1005 (_2!11295 lt!377816)))))

(declare-fun b!242395 () Bool)

(declare-fun e!168043 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242395 (= e!168043 (invariant!0 (currentBit!11656 thiss!1005) (currentByte!11661 thiss!1005) (size!5832 (buf!6298 (_2!11295 lt!377807)))))))

(declare-fun b!242396 () Bool)

(assert (=> b!242396 (= e!168041 (not true))))

(declare-fun e!168050 () Bool)

(assert (=> b!242396 e!168050))

(declare-fun res!202416 () Bool)

(assert (=> b!242396 (=> (not res!202416) (not e!168050))))

(declare-fun lt!377805 () tuple2!20742)

(declare-fun lt!377813 () tuple2!20742)

(assert (=> b!242396 (= res!202416 (= (bitIndex!0 (size!5832 (buf!6298 (_1!11293 lt!377805))) (currentByte!11661 (_1!11293 lt!377805)) (currentBit!11656 (_1!11293 lt!377805))) (bitIndex!0 (size!5832 (buf!6298 (_1!11293 lt!377813))) (currentByte!11661 (_1!11293 lt!377813)) (currentBit!11656 (_1!11293 lt!377813)))))))

(declare-fun lt!377810 () Unit!17747)

(declare-fun lt!377809 () BitStream!10586)

(declare-fun readBitPrefixLemma!0 (BitStream!10586 BitStream!10586) Unit!17747)

(assert (=> b!242396 (= lt!377810 (readBitPrefixLemma!0 lt!377809 (_2!11295 lt!377807)))))

(declare-fun readBitPure!0 (BitStream!10586) tuple2!20742)

(assert (=> b!242396 (= lt!377813 (readBitPure!0 (BitStream!10587 (buf!6298 (_2!11295 lt!377807)) (currentByte!11661 thiss!1005) (currentBit!11656 thiss!1005))))))

(assert (=> b!242396 (= lt!377805 (readBitPure!0 lt!377809))))

(assert (=> b!242396 (= lt!377809 (BitStream!10587 (buf!6298 (_2!11295 lt!377816)) (currentByte!11661 thiss!1005) (currentBit!11656 thiss!1005)))))

(assert (=> b!242396 e!168043))

(declare-fun res!202423 () Bool)

(assert (=> b!242396 (=> (not res!202423) (not e!168043))))

(assert (=> b!242396 (= res!202423 (isPrefixOf!0 thiss!1005 (_2!11295 lt!377807)))))

(declare-fun lt!377806 () Unit!17747)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10586 BitStream!10586 BitStream!10586) Unit!17747)

(assert (=> b!242396 (= lt!377806 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11295 lt!377816) (_2!11295 lt!377807)))))

(assert (=> b!242396 e!168042))

(declare-fun res!202413 () Bool)

(assert (=> b!242396 (=> (not res!202413) (not e!168042))))

(assert (=> b!242396 (= res!202413 (= (size!5832 (buf!6298 (_2!11295 lt!377816))) (size!5832 (buf!6298 (_2!11295 lt!377807)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10586 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20746)

(assert (=> b!242396 (= lt!377807 (appendNBitsLoop!0 (_2!11295 lt!377816) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242396 (validate_offset_bits!1 ((_ sign_extend 32) (size!5832 (buf!6298 (_2!11295 lt!377816)))) ((_ sign_extend 32) (currentByte!11661 (_2!11295 lt!377816))) ((_ sign_extend 32) (currentBit!11656 (_2!11295 lt!377816))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377814 () Unit!17747)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10586 BitStream!10586 (_ BitVec 64) (_ BitVec 64)) Unit!17747)

(assert (=> b!242396 (= lt!377814 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11295 lt!377816) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!242396 e!168046))

(declare-fun res!202417 () Bool)

(assert (=> b!242396 (=> (not res!202417) (not e!168046))))

(assert (=> b!242396 (= res!202417 (= (size!5832 (buf!6298 thiss!1005)) (size!5832 (buf!6298 (_2!11295 lt!377816)))))))

(declare-fun appendBit!0 (BitStream!10586 Bool) tuple2!20746)

(assert (=> b!242396 (= lt!377816 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!242397 () Bool)

(declare-fun res!202425 () Bool)

(assert (=> b!242397 (=> (not res!202425) (not e!168043))))

(assert (=> b!242397 (= res!202425 (invariant!0 (currentBit!11656 thiss!1005) (currentByte!11661 thiss!1005) (size!5832 (buf!6298 (_2!11295 lt!377816)))))))

(declare-fun b!242398 () Bool)

(declare-fun e!168047 () Bool)

(assert (=> b!242398 (= e!168048 e!168047)))

(declare-fun res!202418 () Bool)

(assert (=> b!242398 (=> (not res!202418) (not e!168047))))

(declare-fun lt!377815 () tuple2!20742)

(assert (=> b!242398 (= res!202418 (and (= (_2!11293 lt!377815) bit!26) (= (_1!11293 lt!377815) (_2!11295 lt!377816))))))

(declare-fun readerFrom!0 (BitStream!10586 (_ BitVec 32) (_ BitVec 32)) BitStream!10586)

(assert (=> b!242398 (= lt!377815 (readBitPure!0 (readerFrom!0 (_2!11295 lt!377816) (currentBit!11656 thiss!1005) (currentByte!11661 thiss!1005))))))

(declare-fun b!242399 () Bool)

(assert (=> b!242399 (= e!168047 (= (bitIndex!0 (size!5832 (buf!6298 (_1!11293 lt!377815))) (currentByte!11661 (_1!11293 lt!377815)) (currentBit!11656 (_1!11293 lt!377815))) lt!377817))))

(declare-fun b!242400 () Bool)

(assert (=> b!242400 (= e!168050 (= (_2!11293 lt!377805) (_2!11293 lt!377813)))))

(declare-fun b!242401 () Bool)

(declare-fun res!202420 () Bool)

(assert (=> b!242401 (=> (not res!202420) (not e!168044))))

(assert (=> b!242401 (= res!202420 (isPrefixOf!0 (_2!11295 lt!377816) (_2!11295 lt!377807)))))

(declare-fun b!242402 () Bool)

(declare-fun res!202414 () Bool)

(assert (=> b!242402 (=> (not res!202414) (not e!168041))))

(assert (=> b!242402 (= res!202414 (bvslt from!289 nBits!297))))

(assert (= (and start!52494 res!202421) b!242393))

(assert (= (and b!242393 res!202415) b!242402))

(assert (= (and b!242402 res!202414) b!242396))

(assert (= (and b!242396 res!202417) b!242390))

(assert (= (and b!242390 res!202422) b!242394))

(assert (= (and b!242394 res!202419) b!242398))

(assert (= (and b!242398 res!202418) b!242399))

(assert (= (and b!242396 res!202413) b!242391))

(assert (= (and b!242391 res!202424) b!242401))

(assert (= (and b!242401 res!202420) b!242389))

(assert (= (and b!242396 res!202423) b!242397))

(assert (= (and b!242397 res!202425) b!242395))

(assert (= (and b!242396 res!202416) b!242400))

(assert (= start!52494 b!242392))

(declare-fun m!365211 () Bool)

(assert (=> b!242401 m!365211))

(declare-fun m!365213 () Bool)

(assert (=> b!242390 m!365213))

(declare-fun m!365215 () Bool)

(assert (=> b!242390 m!365215))

(declare-fun m!365217 () Bool)

(assert (=> b!242395 m!365217))

(declare-fun m!365219 () Bool)

(assert (=> b!242392 m!365219))

(declare-fun m!365221 () Bool)

(assert (=> b!242397 m!365221))

(declare-fun m!365223 () Bool)

(assert (=> b!242396 m!365223))

(declare-fun m!365225 () Bool)

(assert (=> b!242396 m!365225))

(declare-fun m!365227 () Bool)

(assert (=> b!242396 m!365227))

(declare-fun m!365229 () Bool)

(assert (=> b!242396 m!365229))

(declare-fun m!365231 () Bool)

(assert (=> b!242396 m!365231))

(declare-fun m!365233 () Bool)

(assert (=> b!242396 m!365233))

(declare-fun m!365235 () Bool)

(assert (=> b!242396 m!365235))

(declare-fun m!365237 () Bool)

(assert (=> b!242396 m!365237))

(declare-fun m!365239 () Bool)

(assert (=> b!242396 m!365239))

(declare-fun m!365241 () Bool)

(assert (=> b!242396 m!365241))

(declare-fun m!365243 () Bool)

(assert (=> b!242396 m!365243))

(declare-fun m!365245 () Bool)

(assert (=> b!242389 m!365245))

(declare-fun m!365247 () Bool)

(assert (=> b!242389 m!365247))

(declare-fun m!365249 () Bool)

(assert (=> b!242389 m!365249))

(declare-fun m!365251 () Bool)

(assert (=> b!242389 m!365251))

(declare-fun m!365253 () Bool)

(assert (=> b!242399 m!365253))

(declare-fun m!365255 () Bool)

(assert (=> b!242391 m!365255))

(assert (=> b!242391 m!365213))

(declare-fun m!365257 () Bool)

(assert (=> b!242394 m!365257))

(declare-fun m!365259 () Bool)

(assert (=> b!242393 m!365259))

(declare-fun m!365261 () Bool)

(assert (=> start!52494 m!365261))

(declare-fun m!365263 () Bool)

(assert (=> b!242398 m!365263))

(assert (=> b!242398 m!365263))

(declare-fun m!365265 () Bool)

(assert (=> b!242398 m!365265))

(push 1)

(assert (not b!242393))

(assert (not b!242389))

