; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52764 () Bool)

(assert start!52764)

(declare-fun b!244411 () Bool)

(declare-fun e!169405 () Bool)

(declare-fun e!169412 () Bool)

(assert (=> b!244411 (= e!169405 e!169412)))

(declare-fun res!204282 () Bool)

(assert (=> b!244411 (=> (not res!204282) (not e!169412))))

(declare-datatypes ((array!13383 0))(
  ( (array!13384 (arr!6855 (Array (_ BitVec 32) (_ BitVec 8))) (size!5868 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10658 0))(
  ( (BitStream!10659 (buf!6340 array!13383) (currentByte!11718 (_ BitVec 32)) (currentBit!11713 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20970 0))(
  ( (tuple2!20971 (_1!11407 BitStream!10658) (_2!11407 Bool)) )
))
(declare-fun lt!380911 () tuple2!20970)

(declare-fun bit!26 () Bool)

(declare-datatypes ((Unit!17831 0))(
  ( (Unit!17832) )
))
(declare-datatypes ((tuple2!20972 0))(
  ( (tuple2!20973 (_1!11408 Unit!17831) (_2!11408 BitStream!10658)) )
))
(declare-fun lt!380925 () tuple2!20972)

(assert (=> b!244411 (= res!204282 (and (= (_2!11407 lt!380911) bit!26) (= (_1!11407 lt!380911) (_2!11408 lt!380925))))))

(declare-fun thiss!1005 () BitStream!10658)

(declare-fun readBitPure!0 (BitStream!10658) tuple2!20970)

(declare-fun readerFrom!0 (BitStream!10658 (_ BitVec 32) (_ BitVec 32)) BitStream!10658)

(assert (=> b!244411 (= lt!380911 (readBitPure!0 (readerFrom!0 (_2!11408 lt!380925) (currentBit!11713 thiss!1005) (currentByte!11718 thiss!1005))))))

(declare-fun b!244412 () Bool)

(declare-fun res!204291 () Bool)

(assert (=> b!244412 (=> (not res!204291) (not e!169405))))

(declare-fun isPrefixOf!0 (BitStream!10658 BitStream!10658) Bool)

(assert (=> b!244412 (= res!204291 (isPrefixOf!0 thiss!1005 (_2!11408 lt!380925)))))

(declare-fun b!244413 () Bool)

(declare-fun e!169407 () Bool)

(declare-fun lt!380906 () tuple2!20970)

(declare-datatypes ((tuple2!20974 0))(
  ( (tuple2!20975 (_1!11409 BitStream!10658) (_2!11409 BitStream!10658)) )
))
(declare-fun lt!380913 () tuple2!20974)

(assert (=> b!244413 (= e!169407 (not (or (not (_2!11407 lt!380906)) (not (= (_1!11407 lt!380906) (_2!11409 lt!380913))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10658 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20970)

(assert (=> b!244413 (= lt!380906 (checkBitsLoopPure!0 (_1!11409 lt!380913) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!380914 () tuple2!20972)

(declare-fun lt!380922 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!244413 (validate_offset_bits!1 ((_ sign_extend 32) (size!5868 (buf!6340 (_2!11408 lt!380914)))) ((_ sign_extend 32) (currentByte!11718 (_2!11408 lt!380925))) ((_ sign_extend 32) (currentBit!11713 (_2!11408 lt!380925))) lt!380922)))

(declare-fun lt!380907 () Unit!17831)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10658 array!13383 (_ BitVec 64)) Unit!17831)

(assert (=> b!244413 (= lt!380907 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11408 lt!380925) (buf!6340 (_2!11408 lt!380914)) lt!380922))))

(declare-fun reader!0 (BitStream!10658 BitStream!10658) tuple2!20974)

(assert (=> b!244413 (= lt!380913 (reader!0 (_2!11408 lt!380925) (_2!11408 lt!380914)))))

(declare-fun b!244414 () Bool)

(declare-fun lt!380910 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!244414 (= e!169412 (= (bitIndex!0 (size!5868 (buf!6340 (_1!11407 lt!380911))) (currentByte!11718 (_1!11407 lt!380911)) (currentBit!11713 (_1!11407 lt!380911))) lt!380910))))

(declare-fun b!244415 () Bool)

(declare-fun e!169406 () Bool)

(declare-fun array_inv!5609 (array!13383) Bool)

(assert (=> b!244415 (= e!169406 (array_inv!5609 (buf!6340 thiss!1005)))))

(declare-fun b!244416 () Bool)

(declare-fun e!169410 () Bool)

(assert (=> b!244416 (= e!169410 e!169405)))

(declare-fun res!204287 () Bool)

(assert (=> b!244416 (=> (not res!204287) (not e!169405))))

(declare-fun lt!380916 () (_ BitVec 64))

(assert (=> b!244416 (= res!204287 (= lt!380910 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!380916)))))

(assert (=> b!244416 (= lt!380910 (bitIndex!0 (size!5868 (buf!6340 (_2!11408 lt!380925))) (currentByte!11718 (_2!11408 lt!380925)) (currentBit!11713 (_2!11408 lt!380925))))))

(assert (=> b!244416 (= lt!380916 (bitIndex!0 (size!5868 (buf!6340 thiss!1005)) (currentByte!11718 thiss!1005) (currentBit!11713 thiss!1005)))))

(declare-fun b!244417 () Bool)

(declare-fun res!204279 () Bool)

(assert (=> b!244417 (=> (not res!204279) (not e!169407))))

(assert (=> b!244417 (= res!204279 (isPrefixOf!0 (_2!11408 lt!380925) (_2!11408 lt!380914)))))

(declare-fun b!244419 () Bool)

(declare-fun e!169409 () Bool)

(assert (=> b!244419 (= e!169409 (not true))))

(declare-fun lt!380921 () (_ BitVec 64))

(assert (=> b!244419 (validate_offset_bits!1 ((_ sign_extend 32) (size!5868 (buf!6340 (_2!11408 lt!380914)))) ((_ sign_extend 32) (currentByte!11718 (_2!11408 lt!380925))) ((_ sign_extend 32) (currentBit!11713 (_2!11408 lt!380925))) lt!380921)))

(declare-fun lt!380923 () Unit!17831)

(assert (=> b!244419 (= lt!380923 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11408 lt!380925) (buf!6340 (_2!11408 lt!380914)) lt!380921))))

(declare-fun lt!380915 () tuple2!20970)

(declare-fun lt!380905 () tuple2!20974)

(assert (=> b!244419 (= lt!380915 (checkBitsLoopPure!0 (_1!11409 lt!380905) nBits!297 bit!26 from!289))))

(assert (=> b!244419 (validate_offset_bits!1 ((_ sign_extend 32) (size!5868 (buf!6340 (_2!11408 lt!380914)))) ((_ sign_extend 32) (currentByte!11718 thiss!1005)) ((_ sign_extend 32) (currentBit!11713 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!380917 () Unit!17831)

(assert (=> b!244419 (= lt!380917 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6340 (_2!11408 lt!380914)) (bvsub nBits!297 from!289)))))

(assert (=> b!244419 (= (_2!11407 (readBitPure!0 (_1!11409 lt!380905))) bit!26)))

(declare-fun lt!380924 () tuple2!20974)

(assert (=> b!244419 (= lt!380924 (reader!0 (_2!11408 lt!380925) (_2!11408 lt!380914)))))

(assert (=> b!244419 (= lt!380905 (reader!0 thiss!1005 (_2!11408 lt!380914)))))

(declare-fun e!169403 () Bool)

(assert (=> b!244419 e!169403))

(declare-fun res!204283 () Bool)

(assert (=> b!244419 (=> (not res!204283) (not e!169403))))

(declare-fun lt!380920 () tuple2!20970)

(declare-fun lt!380918 () tuple2!20970)

(assert (=> b!244419 (= res!204283 (= (bitIndex!0 (size!5868 (buf!6340 (_1!11407 lt!380920))) (currentByte!11718 (_1!11407 lt!380920)) (currentBit!11713 (_1!11407 lt!380920))) (bitIndex!0 (size!5868 (buf!6340 (_1!11407 lt!380918))) (currentByte!11718 (_1!11407 lt!380918)) (currentBit!11713 (_1!11407 lt!380918)))))))

(declare-fun lt!380919 () Unit!17831)

(declare-fun lt!380908 () BitStream!10658)

(declare-fun readBitPrefixLemma!0 (BitStream!10658 BitStream!10658) Unit!17831)

(assert (=> b!244419 (= lt!380919 (readBitPrefixLemma!0 lt!380908 (_2!11408 lt!380914)))))

(assert (=> b!244419 (= lt!380918 (readBitPure!0 (BitStream!10659 (buf!6340 (_2!11408 lt!380914)) (currentByte!11718 thiss!1005) (currentBit!11713 thiss!1005))))))

(assert (=> b!244419 (= lt!380920 (readBitPure!0 lt!380908))))

(assert (=> b!244419 (= lt!380908 (BitStream!10659 (buf!6340 (_2!11408 lt!380925)) (currentByte!11718 thiss!1005) (currentBit!11713 thiss!1005)))))

(declare-fun e!169404 () Bool)

(assert (=> b!244419 e!169404))

(declare-fun res!204286 () Bool)

(assert (=> b!244419 (=> (not res!204286) (not e!169404))))

(assert (=> b!244419 (= res!204286 (isPrefixOf!0 thiss!1005 (_2!11408 lt!380914)))))

(declare-fun lt!380909 () Unit!17831)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10658 BitStream!10658 BitStream!10658) Unit!17831)

(assert (=> b!244419 (= lt!380909 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11408 lt!380925) (_2!11408 lt!380914)))))

(declare-fun e!169408 () Bool)

(assert (=> b!244419 e!169408))

(declare-fun res!204284 () Bool)

(assert (=> b!244419 (=> (not res!204284) (not e!169408))))

(assert (=> b!244419 (= res!204284 (= (size!5868 (buf!6340 (_2!11408 lt!380925))) (size!5868 (buf!6340 (_2!11408 lt!380914)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10658 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20972)

(assert (=> b!244419 (= lt!380914 (appendNBitsLoop!0 (_2!11408 lt!380925) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244419 (validate_offset_bits!1 ((_ sign_extend 32) (size!5868 (buf!6340 (_2!11408 lt!380925)))) ((_ sign_extend 32) (currentByte!11718 (_2!11408 lt!380925))) ((_ sign_extend 32) (currentBit!11713 (_2!11408 lt!380925))) lt!380921)))

(assert (=> b!244419 (= lt!380921 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!380912 () Unit!17831)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10658 BitStream!10658 (_ BitVec 64) (_ BitVec 64)) Unit!17831)

(assert (=> b!244419 (= lt!380912 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11408 lt!380925) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!244419 e!169410))

(declare-fun res!204281 () Bool)

(assert (=> b!244419 (=> (not res!204281) (not e!169410))))

(assert (=> b!244419 (= res!204281 (= (size!5868 (buf!6340 thiss!1005)) (size!5868 (buf!6340 (_2!11408 lt!380925)))))))

(declare-fun appendBit!0 (BitStream!10658 Bool) tuple2!20972)

(assert (=> b!244419 (= lt!380925 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!244420 () Bool)

(assert (=> b!244420 (= e!169403 (= (_2!11407 lt!380920) (_2!11407 lt!380918)))))

(declare-fun b!244421 () Bool)

(assert (=> b!244421 (= e!169408 e!169407)))

(declare-fun res!204289 () Bool)

(assert (=> b!244421 (=> (not res!204289) (not e!169407))))

(assert (=> b!244421 (= res!204289 (= (bitIndex!0 (size!5868 (buf!6340 (_2!11408 lt!380914))) (currentByte!11718 (_2!11408 lt!380914)) (currentBit!11713 (_2!11408 lt!380914))) (bvadd (bitIndex!0 (size!5868 (buf!6340 (_2!11408 lt!380925))) (currentByte!11718 (_2!11408 lt!380925)) (currentBit!11713 (_2!11408 lt!380925))) lt!380922)))))

(assert (=> b!244421 (= lt!380922 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!244422 () Bool)

(declare-fun res!204285 () Bool)

(assert (=> b!244422 (=> (not res!204285) (not e!169409))))

(assert (=> b!244422 (= res!204285 (validate_offset_bits!1 ((_ sign_extend 32) (size!5868 (buf!6340 thiss!1005))) ((_ sign_extend 32) (currentByte!11718 thiss!1005)) ((_ sign_extend 32) (currentBit!11713 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!244423 () Bool)

(declare-fun res!204280 () Bool)

(assert (=> b!244423 (=> (not res!204280) (not e!169404))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244423 (= res!204280 (invariant!0 (currentBit!11713 thiss!1005) (currentByte!11718 thiss!1005) (size!5868 (buf!6340 (_2!11408 lt!380925)))))))

(declare-fun b!244424 () Bool)

(assert (=> b!244424 (= e!169404 (invariant!0 (currentBit!11713 thiss!1005) (currentByte!11718 thiss!1005) (size!5868 (buf!6340 (_2!11408 lt!380914)))))))

(declare-fun b!244418 () Bool)

(declare-fun res!204290 () Bool)

(assert (=> b!244418 (=> (not res!204290) (not e!169409))))

(assert (=> b!244418 (= res!204290 (bvslt from!289 nBits!297))))

(declare-fun res!204288 () Bool)

(assert (=> start!52764 (=> (not res!204288) (not e!169409))))

(assert (=> start!52764 (= res!204288 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52764 e!169409))

(assert (=> start!52764 true))

(declare-fun inv!12 (BitStream!10658) Bool)

(assert (=> start!52764 (and (inv!12 thiss!1005) e!169406)))

(assert (= (and start!52764 res!204288) b!244422))

(assert (= (and b!244422 res!204285) b!244418))

(assert (= (and b!244418 res!204290) b!244419))

(assert (= (and b!244419 res!204281) b!244416))

(assert (= (and b!244416 res!204287) b!244412))

(assert (= (and b!244412 res!204291) b!244411))

(assert (= (and b!244411 res!204282) b!244414))

(assert (= (and b!244419 res!204284) b!244421))

(assert (= (and b!244421 res!204289) b!244417))

(assert (= (and b!244417 res!204279) b!244413))

(assert (= (and b!244419 res!204286) b!244423))

(assert (= (and b!244423 res!204280) b!244424))

(assert (= (and b!244419 res!204283) b!244420))

(assert (= start!52764 b!244415))

(declare-fun m!368359 () Bool)

(assert (=> b!244411 m!368359))

(assert (=> b!244411 m!368359))

(declare-fun m!368361 () Bool)

(assert (=> b!244411 m!368361))

(declare-fun m!368363 () Bool)

(assert (=> b!244419 m!368363))

(declare-fun m!368365 () Bool)

(assert (=> b!244419 m!368365))

(declare-fun m!368367 () Bool)

(assert (=> b!244419 m!368367))

(declare-fun m!368369 () Bool)

(assert (=> b!244419 m!368369))

(declare-fun m!368371 () Bool)

(assert (=> b!244419 m!368371))

(declare-fun m!368373 () Bool)

(assert (=> b!244419 m!368373))

(declare-fun m!368375 () Bool)

(assert (=> b!244419 m!368375))

(declare-fun m!368377 () Bool)

(assert (=> b!244419 m!368377))

(declare-fun m!368379 () Bool)

(assert (=> b!244419 m!368379))

(declare-fun m!368381 () Bool)

(assert (=> b!244419 m!368381))

(declare-fun m!368383 () Bool)

(assert (=> b!244419 m!368383))

(declare-fun m!368385 () Bool)

(assert (=> b!244419 m!368385))

(declare-fun m!368387 () Bool)

(assert (=> b!244419 m!368387))

(declare-fun m!368389 () Bool)

(assert (=> b!244419 m!368389))

(declare-fun m!368391 () Bool)

(assert (=> b!244419 m!368391))

(declare-fun m!368393 () Bool)

(assert (=> b!244419 m!368393))

(declare-fun m!368395 () Bool)

(assert (=> b!244419 m!368395))

(declare-fun m!368397 () Bool)

(assert (=> b!244419 m!368397))

(declare-fun m!368399 () Bool)

(assert (=> b!244419 m!368399))

(declare-fun m!368401 () Bool)

(assert (=> b!244416 m!368401))

(declare-fun m!368403 () Bool)

(assert (=> b!244416 m!368403))

(declare-fun m!368405 () Bool)

(assert (=> b!244415 m!368405))

(declare-fun m!368407 () Bool)

(assert (=> b!244424 m!368407))

(declare-fun m!368409 () Bool)

(assert (=> b!244421 m!368409))

(assert (=> b!244421 m!368401))

(declare-fun m!368411 () Bool)

(assert (=> b!244417 m!368411))

(declare-fun m!368413 () Bool)

(assert (=> b!244423 m!368413))

(declare-fun m!368415 () Bool)

(assert (=> b!244422 m!368415))

(declare-fun m!368417 () Bool)

(assert (=> b!244414 m!368417))

(declare-fun m!368419 () Bool)

(assert (=> b!244412 m!368419))

(declare-fun m!368421 () Bool)

(assert (=> b!244413 m!368421))

(declare-fun m!368423 () Bool)

(assert (=> b!244413 m!368423))

(declare-fun m!368425 () Bool)

(assert (=> b!244413 m!368425))

(assert (=> b!244413 m!368363))

(declare-fun m!368427 () Bool)

(assert (=> start!52764 m!368427))

(push 1)

(assert (not b!244414))

(assert (not b!244411))

(assert (not b!244421))

(assert (not b!244417))

(assert (not b!244424))

(assert (not b!244416))

(assert (not start!52764))

(assert (not b!244419))

(assert (not b!244412))

(assert (not b!244413))

(assert (not b!244423))

