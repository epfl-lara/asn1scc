; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52632 () Bool)

(assert start!52632)

(declare-fun b!243400 () Bool)

(declare-fun res!203355 () Bool)

(declare-fun e!168728 () Bool)

(assert (=> b!243400 (=> (not res!203355) (not e!168728))))

(declare-datatypes ((array!13344 0))(
  ( (array!13345 (arr!6837 (Array (_ BitVec 32) (_ BitVec 8))) (size!5850 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10622 0))(
  ( (BitStream!10623 (buf!6319 array!13344) (currentByte!11691 (_ BitVec 32)) (currentBit!11686 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10622)

(declare-datatypes ((Unit!17789 0))(
  ( (Unit!17790) )
))
(declare-datatypes ((tuple2!20856 0))(
  ( (tuple2!20857 (_1!11350 Unit!17789) (_2!11350 BitStream!10622)) )
))
(declare-fun lt!379298 () tuple2!20856)

(declare-fun isPrefixOf!0 (BitStream!10622 BitStream!10622) Bool)

(assert (=> b!243400 (= res!203355 (isPrefixOf!0 thiss!1005 (_2!11350 lt!379298)))))

(declare-fun b!243401 () Bool)

(declare-fun e!168729 () Bool)

(declare-fun lt!379302 () tuple2!20856)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243401 (= e!168729 (invariant!0 (currentBit!11686 thiss!1005) (currentByte!11691 thiss!1005) (size!5850 (buf!6319 (_2!11350 lt!379302)))))))

(declare-fun b!243402 () Bool)

(declare-fun res!203346 () Bool)

(declare-fun e!168723 () Bool)

(assert (=> b!243402 (=> (not res!203346) (not e!168723))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!243402 (= res!203346 (validate_offset_bits!1 ((_ sign_extend 32) (size!5850 (buf!6319 thiss!1005))) ((_ sign_extend 32) (currentByte!11691 thiss!1005)) ((_ sign_extend 32) (currentBit!11686 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!243403 () Bool)

(declare-fun e!168730 () Bool)

(declare-datatypes ((tuple2!20858 0))(
  ( (tuple2!20859 (_1!11351 BitStream!10622) (_2!11351 Bool)) )
))
(declare-fun lt!379306 () tuple2!20858)

(declare-fun lt!379314 () tuple2!20858)

(assert (=> b!243403 (= e!168730 (= (_2!11351 lt!379306) (_2!11351 lt!379314)))))

(declare-fun res!203358 () Bool)

(assert (=> start!52632 (=> (not res!203358) (not e!168723))))

(assert (=> start!52632 (= res!203358 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52632 e!168723))

(assert (=> start!52632 true))

(declare-fun e!168724 () Bool)

(declare-fun inv!12 (BitStream!10622) Bool)

(assert (=> start!52632 (and (inv!12 thiss!1005) e!168724)))

(declare-fun b!243404 () Bool)

(declare-fun res!203357 () Bool)

(assert (=> b!243404 (=> (not res!203357) (not e!168729))))

(assert (=> b!243404 (= res!203357 (invariant!0 (currentBit!11686 thiss!1005) (currentByte!11691 thiss!1005) (size!5850 (buf!6319 (_2!11350 lt!379298)))))))

(declare-fun b!243405 () Bool)

(declare-fun array_inv!5591 (array!13344) Bool)

(assert (=> b!243405 (= e!168724 (array_inv!5591 (buf!6319 thiss!1005)))))

(declare-fun b!243406 () Bool)

(declare-fun e!168722 () Bool)

(declare-fun lt!379303 () tuple2!20858)

(declare-fun lt!379310 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!243406 (= e!168722 (= (bitIndex!0 (size!5850 (buf!6319 (_1!11351 lt!379303))) (currentByte!11691 (_1!11351 lt!379303)) (currentBit!11686 (_1!11351 lt!379303))) lt!379310))))

(declare-fun b!243407 () Bool)

(assert (=> b!243407 (= e!168723 (not true))))

(assert (=> b!243407 (validate_offset_bits!1 ((_ sign_extend 32) (size!5850 (buf!6319 (_2!11350 lt!379302)))) ((_ sign_extend 32) (currentByte!11691 thiss!1005)) ((_ sign_extend 32) (currentBit!11686 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!379311 () Unit!17789)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10622 array!13344 (_ BitVec 64)) Unit!17789)

(assert (=> b!243407 (= lt!379311 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6319 (_2!11350 lt!379302)) (bvsub nBits!297 from!289)))))

(declare-datatypes ((tuple2!20860 0))(
  ( (tuple2!20861 (_1!11352 BitStream!10622) (_2!11352 BitStream!10622)) )
))
(declare-fun lt!379308 () tuple2!20860)

(declare-fun bit!26 () Bool)

(declare-fun readBitPure!0 (BitStream!10622) tuple2!20858)

(assert (=> b!243407 (= (_2!11351 (readBitPure!0 (_1!11352 lt!379308))) bit!26)))

(declare-fun lt!379312 () tuple2!20860)

(declare-fun reader!0 (BitStream!10622 BitStream!10622) tuple2!20860)

(assert (=> b!243407 (= lt!379312 (reader!0 (_2!11350 lt!379298) (_2!11350 lt!379302)))))

(assert (=> b!243407 (= lt!379308 (reader!0 thiss!1005 (_2!11350 lt!379302)))))

(assert (=> b!243407 e!168730))

(declare-fun res!203356 () Bool)

(assert (=> b!243407 (=> (not res!203356) (not e!168730))))

(assert (=> b!243407 (= res!203356 (= (bitIndex!0 (size!5850 (buf!6319 (_1!11351 lt!379306))) (currentByte!11691 (_1!11351 lt!379306)) (currentBit!11686 (_1!11351 lt!379306))) (bitIndex!0 (size!5850 (buf!6319 (_1!11351 lt!379314))) (currentByte!11691 (_1!11351 lt!379314)) (currentBit!11686 (_1!11351 lt!379314)))))))

(declare-fun lt!379307 () Unit!17789)

(declare-fun lt!379305 () BitStream!10622)

(declare-fun readBitPrefixLemma!0 (BitStream!10622 BitStream!10622) Unit!17789)

(assert (=> b!243407 (= lt!379307 (readBitPrefixLemma!0 lt!379305 (_2!11350 lt!379302)))))

(assert (=> b!243407 (= lt!379314 (readBitPure!0 (BitStream!10623 (buf!6319 (_2!11350 lt!379302)) (currentByte!11691 thiss!1005) (currentBit!11686 thiss!1005))))))

(assert (=> b!243407 (= lt!379306 (readBitPure!0 lt!379305))))

(assert (=> b!243407 (= lt!379305 (BitStream!10623 (buf!6319 (_2!11350 lt!379298)) (currentByte!11691 thiss!1005) (currentBit!11686 thiss!1005)))))

(assert (=> b!243407 e!168729))

(declare-fun res!203351 () Bool)

(assert (=> b!243407 (=> (not res!203351) (not e!168729))))

(assert (=> b!243407 (= res!203351 (isPrefixOf!0 thiss!1005 (_2!11350 lt!379302)))))

(declare-fun lt!379297 () Unit!17789)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10622 BitStream!10622 BitStream!10622) Unit!17789)

(assert (=> b!243407 (= lt!379297 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11350 lt!379298) (_2!11350 lt!379302)))))

(declare-fun e!168727 () Bool)

(assert (=> b!243407 e!168727))

(declare-fun res!203349 () Bool)

(assert (=> b!243407 (=> (not res!203349) (not e!168727))))

(assert (=> b!243407 (= res!203349 (= (size!5850 (buf!6319 (_2!11350 lt!379298))) (size!5850 (buf!6319 (_2!11350 lt!379302)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10622 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20856)

(assert (=> b!243407 (= lt!379302 (appendNBitsLoop!0 (_2!11350 lt!379298) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243407 (validate_offset_bits!1 ((_ sign_extend 32) (size!5850 (buf!6319 (_2!11350 lt!379298)))) ((_ sign_extend 32) (currentByte!11691 (_2!11350 lt!379298))) ((_ sign_extend 32) (currentBit!11686 (_2!11350 lt!379298))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!379304 () Unit!17789)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10622 BitStream!10622 (_ BitVec 64) (_ BitVec 64)) Unit!17789)

(assert (=> b!243407 (= lt!379304 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11350 lt!379298) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!168725 () Bool)

(assert (=> b!243407 e!168725))

(declare-fun res!203352 () Bool)

(assert (=> b!243407 (=> (not res!203352) (not e!168725))))

(assert (=> b!243407 (= res!203352 (= (size!5850 (buf!6319 thiss!1005)) (size!5850 (buf!6319 (_2!11350 lt!379298)))))))

(declare-fun appendBit!0 (BitStream!10622 Bool) tuple2!20856)

(assert (=> b!243407 (= lt!379298 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!243408 () Bool)

(assert (=> b!243408 (= e!168728 e!168722)))

(declare-fun res!203353 () Bool)

(assert (=> b!243408 (=> (not res!203353) (not e!168722))))

(assert (=> b!243408 (= res!203353 (and (= (_2!11351 lt!379303) bit!26) (= (_1!11351 lt!379303) (_2!11350 lt!379298))))))

(declare-fun readerFrom!0 (BitStream!10622 (_ BitVec 32) (_ BitVec 32)) BitStream!10622)

(assert (=> b!243408 (= lt!379303 (readBitPure!0 (readerFrom!0 (_2!11350 lt!379298) (currentBit!11686 thiss!1005) (currentByte!11691 thiss!1005))))))

(declare-fun b!243409 () Bool)

(declare-fun res!203354 () Bool)

(declare-fun e!168731 () Bool)

(assert (=> b!243409 (=> (not res!203354) (not e!168731))))

(assert (=> b!243409 (= res!203354 (isPrefixOf!0 (_2!11350 lt!379298) (_2!11350 lt!379302)))))

(declare-fun b!243410 () Bool)

(declare-fun lt!379301 () tuple2!20858)

(declare-fun lt!379309 () tuple2!20860)

(assert (=> b!243410 (= e!168731 (not (or (not (_2!11351 lt!379301)) (not (= (_1!11351 lt!379301) (_2!11352 lt!379309))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10622 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20858)

(assert (=> b!243410 (= lt!379301 (checkBitsLoopPure!0 (_1!11352 lt!379309) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!379299 () (_ BitVec 64))

(assert (=> b!243410 (validate_offset_bits!1 ((_ sign_extend 32) (size!5850 (buf!6319 (_2!11350 lt!379302)))) ((_ sign_extend 32) (currentByte!11691 (_2!11350 lt!379298))) ((_ sign_extend 32) (currentBit!11686 (_2!11350 lt!379298))) lt!379299)))

(declare-fun lt!379300 () Unit!17789)

(assert (=> b!243410 (= lt!379300 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11350 lt!379298) (buf!6319 (_2!11350 lt!379302)) lt!379299))))

(assert (=> b!243410 (= lt!379309 (reader!0 (_2!11350 lt!379298) (_2!11350 lt!379302)))))

(declare-fun b!243411 () Bool)

(assert (=> b!243411 (= e!168725 e!168728)))

(declare-fun res!203348 () Bool)

(assert (=> b!243411 (=> (not res!203348) (not e!168728))))

(declare-fun lt!379313 () (_ BitVec 64))

(assert (=> b!243411 (= res!203348 (= lt!379310 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!379313)))))

(assert (=> b!243411 (= lt!379310 (bitIndex!0 (size!5850 (buf!6319 (_2!11350 lt!379298))) (currentByte!11691 (_2!11350 lt!379298)) (currentBit!11686 (_2!11350 lt!379298))))))

(assert (=> b!243411 (= lt!379313 (bitIndex!0 (size!5850 (buf!6319 thiss!1005)) (currentByte!11691 thiss!1005) (currentBit!11686 thiss!1005)))))

(declare-fun b!243412 () Bool)

(assert (=> b!243412 (= e!168727 e!168731)))

(declare-fun res!203350 () Bool)

(assert (=> b!243412 (=> (not res!203350) (not e!168731))))

(assert (=> b!243412 (= res!203350 (= (bitIndex!0 (size!5850 (buf!6319 (_2!11350 lt!379302))) (currentByte!11691 (_2!11350 lt!379302)) (currentBit!11686 (_2!11350 lt!379302))) (bvadd (bitIndex!0 (size!5850 (buf!6319 (_2!11350 lt!379298))) (currentByte!11691 (_2!11350 lt!379298)) (currentBit!11686 (_2!11350 lt!379298))) lt!379299)))))

(assert (=> b!243412 (= lt!379299 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!243413 () Bool)

(declare-fun res!203347 () Bool)

(assert (=> b!243413 (=> (not res!203347) (not e!168723))))

(assert (=> b!243413 (= res!203347 (bvslt from!289 nBits!297))))

(assert (= (and start!52632 res!203358) b!243402))

(assert (= (and b!243402 res!203346) b!243413))

(assert (= (and b!243413 res!203347) b!243407))

(assert (= (and b!243407 res!203352) b!243411))

(assert (= (and b!243411 res!203348) b!243400))

(assert (= (and b!243400 res!203355) b!243408))

(assert (= (and b!243408 res!203353) b!243406))

(assert (= (and b!243407 res!203349) b!243412))

(assert (= (and b!243412 res!203350) b!243409))

(assert (= (and b!243409 res!203354) b!243410))

(assert (= (and b!243407 res!203351) b!243404))

(assert (= (and b!243404 res!203357) b!243401))

(assert (= (and b!243407 res!203356) b!243403))

(assert (= start!52632 b!243405))

(declare-fun m!366721 () Bool)

(assert (=> b!243400 m!366721))

(declare-fun m!366723 () Bool)

(assert (=> start!52632 m!366723))

(declare-fun m!366725 () Bool)

(assert (=> b!243404 m!366725))

(declare-fun m!366727 () Bool)

(assert (=> b!243411 m!366727))

(declare-fun m!366729 () Bool)

(assert (=> b!243411 m!366729))

(declare-fun m!366731 () Bool)

(assert (=> b!243408 m!366731))

(assert (=> b!243408 m!366731))

(declare-fun m!366733 () Bool)

(assert (=> b!243408 m!366733))

(declare-fun m!366735 () Bool)

(assert (=> b!243409 m!366735))

(declare-fun m!366737 () Bool)

(assert (=> b!243410 m!366737))

(declare-fun m!366739 () Bool)

(assert (=> b!243410 m!366739))

(declare-fun m!366741 () Bool)

(assert (=> b!243410 m!366741))

(declare-fun m!366743 () Bool)

(assert (=> b!243410 m!366743))

(declare-fun m!366745 () Bool)

(assert (=> b!243412 m!366745))

(assert (=> b!243412 m!366727))

(declare-fun m!366747 () Bool)

(assert (=> b!243406 m!366747))

(declare-fun m!366749 () Bool)

(assert (=> b!243407 m!366749))

(declare-fun m!366751 () Bool)

(assert (=> b!243407 m!366751))

(declare-fun m!366753 () Bool)

(assert (=> b!243407 m!366753))

(declare-fun m!366755 () Bool)

(assert (=> b!243407 m!366755))

(declare-fun m!366757 () Bool)

(assert (=> b!243407 m!366757))

(declare-fun m!366759 () Bool)

(assert (=> b!243407 m!366759))

(assert (=> b!243407 m!366743))

(declare-fun m!366761 () Bool)

(assert (=> b!243407 m!366761))

(declare-fun m!366763 () Bool)

(assert (=> b!243407 m!366763))

(declare-fun m!366765 () Bool)

(assert (=> b!243407 m!366765))

(declare-fun m!366767 () Bool)

(assert (=> b!243407 m!366767))

(declare-fun m!366769 () Bool)

(assert (=> b!243407 m!366769))

(declare-fun m!366771 () Bool)

(assert (=> b!243407 m!366771))

(declare-fun m!366773 () Bool)

(assert (=> b!243407 m!366773))

(declare-fun m!366775 () Bool)

(assert (=> b!243407 m!366775))

(declare-fun m!366777 () Bool)

(assert (=> b!243407 m!366777))

(declare-fun m!366779 () Bool)

(assert (=> b!243401 m!366779))

(declare-fun m!366781 () Bool)

(assert (=> b!243405 m!366781))

(declare-fun m!366783 () Bool)

(assert (=> b!243402 m!366783))

(push 1)

(assert (not b!243411))

(assert (not b!243400))

(assert (not b!243402))

(assert (not b!243409))

(assert (not b!243410))

(assert (not b!243408))

(assert (not b!243412))

(assert (not b!243405))

(assert (not b!243407))

(assert (not b!243404))

(assert (not start!52632))

(assert (not b!243401))

(assert (not b!243406))

(check-sat)

(pop 1)

