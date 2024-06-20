; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53112 () Bool)

(assert start!53112)

(declare-fun b!246355 () Bool)

(declare-fun res!206076 () Bool)

(declare-fun e!170678 () Bool)

(assert (=> b!246355 (=> res!206076 e!170678)))

(declare-datatypes ((array!13440 0))(
  ( (array!13441 (arr!6879 (Array (_ BitVec 32) (_ BitVec 8))) (size!5892 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10706 0))(
  ( (BitStream!10707 (buf!6373 array!13440) (currentByte!11769 (_ BitVec 32)) (currentBit!11764 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21132 0))(
  ( (tuple2!21133 (_1!11488 BitStream!10706) (_2!11488 BitStream!10706)) )
))
(declare-fun lt!384339 () tuple2!21132)

(declare-fun lt!384333 () tuple2!21132)

(declare-fun withMovedBitIndex!0 (BitStream!10706 (_ BitVec 64)) BitStream!10706)

(assert (=> b!246355 (= res!206076 (not (= (_1!11488 lt!384339) (withMovedBitIndex!0 (_1!11488 lt!384333) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!246356 () Bool)

(declare-fun res!206078 () Bool)

(declare-fun e!170679 () Bool)

(assert (=> b!246356 (=> (not res!206078) (not e!170679))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun thiss!1005 () BitStream!10706)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!246356 (= res!206078 (validate_offset_bits!1 ((_ sign_extend 32) (size!5892 (buf!6373 thiss!1005))) ((_ sign_extend 32) (currentByte!11769 thiss!1005)) ((_ sign_extend 32) (currentBit!11764 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!246357 () Bool)

(declare-fun res!206088 () Bool)

(declare-fun e!170675 () Bool)

(assert (=> b!246357 (=> (not res!206088) (not e!170675))))

(declare-datatypes ((Unit!17896 0))(
  ( (Unit!17897) )
))
(declare-datatypes ((tuple2!21134 0))(
  ( (tuple2!21135 (_1!11489 Unit!17896) (_2!11489 BitStream!10706)) )
))
(declare-fun lt!384329 () tuple2!21134)

(declare-fun isPrefixOf!0 (BitStream!10706 BitStream!10706) Bool)

(assert (=> b!246357 (= res!206088 (isPrefixOf!0 thiss!1005 (_2!11489 lt!384329)))))

(declare-fun b!246358 () Bool)

(declare-fun e!170681 () Bool)

(assert (=> b!246358 (= e!170681 e!170675)))

(declare-fun res!206091 () Bool)

(assert (=> b!246358 (=> (not res!206091) (not e!170675))))

(declare-fun lt!384326 () (_ BitVec 64))

(declare-fun lt!384328 () (_ BitVec 64))

(assert (=> b!246358 (= res!206091 (= lt!384326 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!384328)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!246358 (= lt!384326 (bitIndex!0 (size!5892 (buf!6373 (_2!11489 lt!384329))) (currentByte!11769 (_2!11489 lt!384329)) (currentBit!11764 (_2!11489 lt!384329))))))

(assert (=> b!246358 (= lt!384328 (bitIndex!0 (size!5892 (buf!6373 thiss!1005)) (currentByte!11769 thiss!1005) (currentBit!11764 thiss!1005)))))

(declare-fun b!246359 () Bool)

(declare-fun e!170676 () Bool)

(declare-fun array_inv!5633 (array!13440) Bool)

(assert (=> b!246359 (= e!170676 (array_inv!5633 (buf!6373 thiss!1005)))))

(declare-fun b!246360 () Bool)

(declare-fun e!170672 () Bool)

(declare-fun lt!384337 () tuple2!21134)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246360 (= e!170672 (invariant!0 (currentBit!11764 thiss!1005) (currentByte!11769 thiss!1005) (size!5892 (buf!6373 (_2!11489 lt!384337)))))))

(declare-fun b!246361 () Bool)

(assert (=> b!246361 (= e!170679 (not e!170678))))

(declare-fun res!206077 () Bool)

(assert (=> b!246361 (=> res!206077 e!170678)))

(declare-datatypes ((tuple2!21136 0))(
  ( (tuple2!21137 (_1!11490 BitStream!10706) (_2!11490 Bool)) )
))
(declare-fun lt!384320 () tuple2!21136)

(assert (=> b!246361 (= res!206077 (not (= (_1!11490 lt!384320) (_2!11488 lt!384339))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10706 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21136)

(assert (=> b!246361 (= lt!384320 (checkBitsLoopPure!0 (_1!11488 lt!384339) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384334 () (_ BitVec 64))

(assert (=> b!246361 (validate_offset_bits!1 ((_ sign_extend 32) (size!5892 (buf!6373 (_2!11489 lt!384337)))) ((_ sign_extend 32) (currentByte!11769 (_2!11489 lt!384329))) ((_ sign_extend 32) (currentBit!11764 (_2!11489 lt!384329))) lt!384334)))

(declare-fun lt!384322 () Unit!17896)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10706 array!13440 (_ BitVec 64)) Unit!17896)

(assert (=> b!246361 (= lt!384322 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11489 lt!384329) (buf!6373 (_2!11489 lt!384337)) lt!384334))))

(declare-fun lt!384327 () tuple2!21136)

(assert (=> b!246361 (= lt!384327 (checkBitsLoopPure!0 (_1!11488 lt!384333) nBits!297 bit!26 from!289))))

(assert (=> b!246361 (validate_offset_bits!1 ((_ sign_extend 32) (size!5892 (buf!6373 (_2!11489 lt!384337)))) ((_ sign_extend 32) (currentByte!11769 thiss!1005)) ((_ sign_extend 32) (currentBit!11764 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!384324 () Unit!17896)

(assert (=> b!246361 (= lt!384324 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6373 (_2!11489 lt!384337)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10706) tuple2!21136)

(assert (=> b!246361 (= (_2!11490 (readBitPure!0 (_1!11488 lt!384333))) bit!26)))

(declare-fun reader!0 (BitStream!10706 BitStream!10706) tuple2!21132)

(assert (=> b!246361 (= lt!384339 (reader!0 (_2!11489 lt!384329) (_2!11489 lt!384337)))))

(assert (=> b!246361 (= lt!384333 (reader!0 thiss!1005 (_2!11489 lt!384337)))))

(declare-fun e!170674 () Bool)

(assert (=> b!246361 e!170674))

(declare-fun res!206086 () Bool)

(assert (=> b!246361 (=> (not res!206086) (not e!170674))))

(declare-fun lt!384342 () tuple2!21136)

(declare-fun lt!384340 () tuple2!21136)

(assert (=> b!246361 (= res!206086 (= (bitIndex!0 (size!5892 (buf!6373 (_1!11490 lt!384342))) (currentByte!11769 (_1!11490 lt!384342)) (currentBit!11764 (_1!11490 lt!384342))) (bitIndex!0 (size!5892 (buf!6373 (_1!11490 lt!384340))) (currentByte!11769 (_1!11490 lt!384340)) (currentBit!11764 (_1!11490 lt!384340)))))))

(declare-fun lt!384335 () Unit!17896)

(declare-fun lt!384319 () BitStream!10706)

(declare-fun readBitPrefixLemma!0 (BitStream!10706 BitStream!10706) Unit!17896)

(assert (=> b!246361 (= lt!384335 (readBitPrefixLemma!0 lt!384319 (_2!11489 lt!384337)))))

(assert (=> b!246361 (= lt!384340 (readBitPure!0 (BitStream!10707 (buf!6373 (_2!11489 lt!384337)) (currentByte!11769 thiss!1005) (currentBit!11764 thiss!1005))))))

(assert (=> b!246361 (= lt!384342 (readBitPure!0 lt!384319))))

(assert (=> b!246361 (= lt!384319 (BitStream!10707 (buf!6373 (_2!11489 lt!384329)) (currentByte!11769 thiss!1005) (currentBit!11764 thiss!1005)))))

(assert (=> b!246361 e!170672))

(declare-fun res!206081 () Bool)

(assert (=> b!246361 (=> (not res!206081) (not e!170672))))

(assert (=> b!246361 (= res!206081 (isPrefixOf!0 thiss!1005 (_2!11489 lt!384337)))))

(declare-fun lt!384321 () Unit!17896)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10706 BitStream!10706 BitStream!10706) Unit!17896)

(assert (=> b!246361 (= lt!384321 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11489 lt!384329) (_2!11489 lt!384337)))))

(declare-fun e!170677 () Bool)

(assert (=> b!246361 e!170677))

(declare-fun res!206083 () Bool)

(assert (=> b!246361 (=> (not res!206083) (not e!170677))))

(assert (=> b!246361 (= res!206083 (= (size!5892 (buf!6373 (_2!11489 lt!384329))) (size!5892 (buf!6373 (_2!11489 lt!384337)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10706 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21134)

(assert (=> b!246361 (= lt!384337 (appendNBitsLoop!0 (_2!11489 lt!384329) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246361 (validate_offset_bits!1 ((_ sign_extend 32) (size!5892 (buf!6373 (_2!11489 lt!384329)))) ((_ sign_extend 32) (currentByte!11769 (_2!11489 lt!384329))) ((_ sign_extend 32) (currentBit!11764 (_2!11489 lt!384329))) lt!384334)))

(assert (=> b!246361 (= lt!384334 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!384336 () Unit!17896)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10706 BitStream!10706 (_ BitVec 64) (_ BitVec 64)) Unit!17896)

(assert (=> b!246361 (= lt!384336 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11489 lt!384329) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!246361 e!170681))

(declare-fun res!206087 () Bool)

(assert (=> b!246361 (=> (not res!206087) (not e!170681))))

(assert (=> b!246361 (= res!206087 (= (size!5892 (buf!6373 thiss!1005)) (size!5892 (buf!6373 (_2!11489 lt!384329)))))))

(declare-fun appendBit!0 (BitStream!10706 Bool) tuple2!21134)

(assert (=> b!246361 (= lt!384329 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!246362 () Bool)

(declare-fun res!206085 () Bool)

(assert (=> b!246362 (=> (not res!206085) (not e!170672))))

(assert (=> b!246362 (= res!206085 (invariant!0 (currentBit!11764 thiss!1005) (currentByte!11769 thiss!1005) (size!5892 (buf!6373 (_2!11489 lt!384329)))))))

(declare-fun b!246363 () Bool)

(declare-fun res!206082 () Bool)

(assert (=> b!246363 (=> (not res!206082) (not e!170679))))

(assert (=> b!246363 (= res!206082 (bvslt from!289 nBits!297))))

(declare-fun b!246364 () Bool)

(declare-fun e!170680 () Bool)

(assert (=> b!246364 (= e!170677 e!170680)))

(declare-fun res!206079 () Bool)

(assert (=> b!246364 (=> (not res!206079) (not e!170680))))

(declare-fun lt!384323 () (_ BitVec 64))

(assert (=> b!246364 (= res!206079 (= (bitIndex!0 (size!5892 (buf!6373 (_2!11489 lt!384337))) (currentByte!11769 (_2!11489 lt!384337)) (currentBit!11764 (_2!11489 lt!384337))) (bvadd (bitIndex!0 (size!5892 (buf!6373 (_2!11489 lt!384329))) (currentByte!11769 (_2!11489 lt!384329)) (currentBit!11764 (_2!11489 lt!384329))) lt!384323)))))

(assert (=> b!246364 (= lt!384323 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!246365 () Bool)

(declare-fun res!206089 () Bool)

(assert (=> b!246365 (=> (not res!206089) (not e!170680))))

(assert (=> b!246365 (= res!206089 (isPrefixOf!0 (_2!11489 lt!384329) (_2!11489 lt!384337)))))

(declare-fun b!246366 () Bool)

(declare-fun e!170670 () Bool)

(declare-fun lt!384338 () tuple2!21136)

(assert (=> b!246366 (= e!170670 (= (bitIndex!0 (size!5892 (buf!6373 (_1!11490 lt!384338))) (currentByte!11769 (_1!11490 lt!384338)) (currentBit!11764 (_1!11490 lt!384338))) lt!384326))))

(declare-fun res!206090 () Bool)

(assert (=> start!53112 (=> (not res!206090) (not e!170679))))

(assert (=> start!53112 (= res!206090 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53112 e!170679))

(assert (=> start!53112 true))

(declare-fun inv!12 (BitStream!10706) Bool)

(assert (=> start!53112 (and (inv!12 thiss!1005) e!170676)))

(declare-fun b!246367 () Bool)

(declare-fun e!170671 () Bool)

(assert (=> b!246367 (= e!170671 true)))

(declare-fun lt!384325 () (_ BitVec 64))

(assert (=> b!246367 (= lt!384325 (bitIndex!0 (size!5892 (buf!6373 (_2!11489 lt!384337))) (currentByte!11769 (_2!11489 lt!384337)) (currentBit!11764 (_2!11489 lt!384337))))))

(declare-fun lt!384331 () (_ BitVec 64))

(assert (=> b!246367 (= lt!384331 (bitIndex!0 (size!5892 (buf!6373 thiss!1005)) (currentByte!11769 thiss!1005) (currentBit!11764 thiss!1005)))))

(declare-fun b!246368 () Bool)

(assert (=> b!246368 (= e!170674 (= (_2!11490 lt!384342) (_2!11490 lt!384340)))))

(declare-fun b!246369 () Bool)

(assert (=> b!246369 (= e!170678 e!170671)))

(declare-fun res!206084 () Bool)

(assert (=> b!246369 (=> res!206084 e!170671)))

(assert (=> b!246369 (= res!206084 (not (= (size!5892 (buf!6373 thiss!1005)) (size!5892 (buf!6373 (_2!11489 lt!384337))))))))

(assert (=> b!246369 (and (= (_2!11490 lt!384327) (_2!11490 lt!384320)) (= (_1!11490 lt!384327) (_2!11488 lt!384333)))))

(declare-fun b!246370 () Bool)

(declare-fun lt!384330 () tuple2!21136)

(declare-fun lt!384341 () tuple2!21132)

(assert (=> b!246370 (= e!170680 (not (or (not (_2!11490 lt!384330)) (not (= (_1!11490 lt!384330) (_2!11488 lt!384341))))))))

(assert (=> b!246370 (= lt!384330 (checkBitsLoopPure!0 (_1!11488 lt!384341) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246370 (validate_offset_bits!1 ((_ sign_extend 32) (size!5892 (buf!6373 (_2!11489 lt!384337)))) ((_ sign_extend 32) (currentByte!11769 (_2!11489 lt!384329))) ((_ sign_extend 32) (currentBit!11764 (_2!11489 lt!384329))) lt!384323)))

(declare-fun lt!384332 () Unit!17896)

(assert (=> b!246370 (= lt!384332 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11489 lt!384329) (buf!6373 (_2!11489 lt!384337)) lt!384323))))

(assert (=> b!246370 (= lt!384341 (reader!0 (_2!11489 lt!384329) (_2!11489 lt!384337)))))

(declare-fun b!246371 () Bool)

(assert (=> b!246371 (= e!170675 e!170670)))

(declare-fun res!206080 () Bool)

(assert (=> b!246371 (=> (not res!206080) (not e!170670))))

(assert (=> b!246371 (= res!206080 (and (= (_2!11490 lt!384338) bit!26) (= (_1!11490 lt!384338) (_2!11489 lt!384329))))))

(declare-fun readerFrom!0 (BitStream!10706 (_ BitVec 32) (_ BitVec 32)) BitStream!10706)

(assert (=> b!246371 (= lt!384338 (readBitPure!0 (readerFrom!0 (_2!11489 lt!384329) (currentBit!11764 thiss!1005) (currentByte!11769 thiss!1005))))))

(assert (= (and start!53112 res!206090) b!246356))

(assert (= (and b!246356 res!206078) b!246363))

(assert (= (and b!246363 res!206082) b!246361))

(assert (= (and b!246361 res!206087) b!246358))

(assert (= (and b!246358 res!206091) b!246357))

(assert (= (and b!246357 res!206088) b!246371))

(assert (= (and b!246371 res!206080) b!246366))

(assert (= (and b!246361 res!206083) b!246364))

(assert (= (and b!246364 res!206079) b!246365))

(assert (= (and b!246365 res!206089) b!246370))

(assert (= (and b!246361 res!206081) b!246362))

(assert (= (and b!246362 res!206085) b!246360))

(assert (= (and b!246361 res!206086) b!246368))

(assert (= (and b!246361 (not res!206077)) b!246355))

(assert (= (and b!246355 (not res!206076)) b!246369))

(assert (= (and b!246369 (not res!206084)) b!246367))

(assert (= start!53112 b!246359))

(declare-fun m!371553 () Bool)

(assert (=> b!246360 m!371553))

(declare-fun m!371555 () Bool)

(assert (=> b!246356 m!371555))

(declare-fun m!371557 () Bool)

(assert (=> b!246357 m!371557))

(declare-fun m!371559 () Bool)

(assert (=> b!246364 m!371559))

(declare-fun m!371561 () Bool)

(assert (=> b!246364 m!371561))

(declare-fun m!371563 () Bool)

(assert (=> b!246355 m!371563))

(declare-fun m!371565 () Bool)

(assert (=> b!246359 m!371565))

(declare-fun m!371567 () Bool)

(assert (=> b!246371 m!371567))

(assert (=> b!246371 m!371567))

(declare-fun m!371569 () Bool)

(assert (=> b!246371 m!371569))

(declare-fun m!371571 () Bool)

(assert (=> b!246370 m!371571))

(declare-fun m!371573 () Bool)

(assert (=> b!246370 m!371573))

(declare-fun m!371575 () Bool)

(assert (=> b!246370 m!371575))

(declare-fun m!371577 () Bool)

(assert (=> b!246370 m!371577))

(declare-fun m!371579 () Bool)

(assert (=> b!246366 m!371579))

(declare-fun m!371581 () Bool)

(assert (=> start!53112 m!371581))

(assert (=> b!246358 m!371561))

(declare-fun m!371583 () Bool)

(assert (=> b!246358 m!371583))

(declare-fun m!371585 () Bool)

(assert (=> b!246365 m!371585))

(declare-fun m!371587 () Bool)

(assert (=> b!246361 m!371587))

(declare-fun m!371589 () Bool)

(assert (=> b!246361 m!371589))

(declare-fun m!371591 () Bool)

(assert (=> b!246361 m!371591))

(declare-fun m!371593 () Bool)

(assert (=> b!246361 m!371593))

(declare-fun m!371595 () Bool)

(assert (=> b!246361 m!371595))

(declare-fun m!371597 () Bool)

(assert (=> b!246361 m!371597))

(assert (=> b!246361 m!371577))

(declare-fun m!371599 () Bool)

(assert (=> b!246361 m!371599))

(declare-fun m!371601 () Bool)

(assert (=> b!246361 m!371601))

(declare-fun m!371603 () Bool)

(assert (=> b!246361 m!371603))

(declare-fun m!371605 () Bool)

(assert (=> b!246361 m!371605))

(declare-fun m!371607 () Bool)

(assert (=> b!246361 m!371607))

(declare-fun m!371609 () Bool)

(assert (=> b!246361 m!371609))

(declare-fun m!371611 () Bool)

(assert (=> b!246361 m!371611))

(declare-fun m!371613 () Bool)

(assert (=> b!246361 m!371613))

(declare-fun m!371615 () Bool)

(assert (=> b!246361 m!371615))

(declare-fun m!371617 () Bool)

(assert (=> b!246361 m!371617))

(declare-fun m!371619 () Bool)

(assert (=> b!246361 m!371619))

(declare-fun m!371621 () Bool)

(assert (=> b!246361 m!371621))

(declare-fun m!371623 () Bool)

(assert (=> b!246361 m!371623))

(declare-fun m!371625 () Bool)

(assert (=> b!246362 m!371625))

(assert (=> b!246367 m!371559))

(assert (=> b!246367 m!371583))

(push 1)

(assert (not b!246366))

(assert (not b!246360))

(assert (not start!53112))

(assert (not b!246365))

(assert (not b!246356))

(assert (not b!246358))

(assert (not b!246355))

(assert (not b!246367))

(assert (not b!246361))

(assert (not b!246371))

(assert (not b!246362))

(assert (not b!246359))

(assert (not b!246364))

(assert (not b!246357))

(assert (not b!246370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

