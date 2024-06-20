; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53726 () Bool)

(assert start!53726)

(declare-fun b!250014 () Bool)

(declare-fun res!209273 () Bool)

(declare-fun e!173290 () Bool)

(assert (=> b!250014 (=> (not res!209273) (not e!173290))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-datatypes ((array!13635 0))(
  ( (array!13636 (arr!6968 (Array (_ BitVec 32) (_ BitVec 8))) (size!5981 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10884 0))(
  ( (BitStream!10885 (buf!6474 array!13635) (currentByte!11905 (_ BitVec 32)) (currentBit!11900 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10884)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250014 (= res!209273 (validate_offset_bits!1 ((_ sign_extend 32) (size!5981 (buf!6474 thiss!1005))) ((_ sign_extend 32) (currentByte!11905 thiss!1005)) ((_ sign_extend 32) (currentBit!11900 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!250015 () Bool)

(declare-fun e!173283 () Bool)

(declare-datatypes ((tuple2!21438 0))(
  ( (tuple2!21439 (_1!11644 BitStream!10884) (_2!11644 Bool)) )
))
(declare-fun lt!388606 () tuple2!21438)

(declare-fun lt!388601 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!250015 (= e!173283 (= (bitIndex!0 (size!5981 (buf!6474 (_1!11644 lt!388606))) (currentByte!11905 (_1!11644 lt!388606)) (currentBit!11900 (_1!11644 lt!388606))) lt!388601))))

(declare-fun b!250016 () Bool)

(declare-fun e!173289 () Bool)

(assert (=> b!250016 (= e!173289 e!173283)))

(declare-fun res!209279 () Bool)

(assert (=> b!250016 (=> (not res!209279) (not e!173283))))

(declare-datatypes ((Unit!18098 0))(
  ( (Unit!18099) )
))
(declare-datatypes ((tuple2!21440 0))(
  ( (tuple2!21441 (_1!11645 Unit!18098) (_2!11645 BitStream!10884)) )
))
(declare-fun lt!388602 () tuple2!21440)

(declare-fun bit!26 () Bool)

(assert (=> b!250016 (= res!209279 (and (= (_2!11644 lt!388606) bit!26) (= (_1!11644 lt!388606) (_2!11645 lt!388602))))))

(declare-fun readBitPure!0 (BitStream!10884) tuple2!21438)

(declare-fun readerFrom!0 (BitStream!10884 (_ BitVec 32) (_ BitVec 32)) BitStream!10884)

(assert (=> b!250016 (= lt!388606 (readBitPure!0 (readerFrom!0 (_2!11645 lt!388602) (currentBit!11900 thiss!1005) (currentByte!11905 thiss!1005))))))

(declare-fun b!250017 () Bool)

(declare-fun res!209270 () Bool)

(assert (=> b!250017 (=> (not res!209270) (not e!173289))))

(declare-fun isPrefixOf!0 (BitStream!10884 BitStream!10884) Bool)

(assert (=> b!250017 (= res!209270 (isPrefixOf!0 thiss!1005 (_2!11645 lt!388602)))))

(declare-fun b!250018 () Bool)

(declare-fun e!173291 () Bool)

(assert (=> b!250018 (= e!173290 (not e!173291))))

(declare-fun res!209275 () Bool)

(assert (=> b!250018 (=> res!209275 e!173291)))

(assert (=> b!250018 (= res!209275 (not (isPrefixOf!0 thiss!1005 (_2!11645 lt!388602))))))

(declare-fun e!173285 () Bool)

(assert (=> b!250018 e!173285))

(declare-fun res!209277 () Bool)

(assert (=> b!250018 (=> (not res!209277) (not e!173285))))

(declare-fun lt!388603 () tuple2!21440)

(assert (=> b!250018 (= res!209277 (= (size!5981 (buf!6474 (_2!11645 lt!388602))) (size!5981 (buf!6474 (_2!11645 lt!388603)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10884 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21440)

(assert (=> b!250018 (= lt!388603 (appendNBitsLoop!0 (_2!11645 lt!388602) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250018 (validate_offset_bits!1 ((_ sign_extend 32) (size!5981 (buf!6474 (_2!11645 lt!388602)))) ((_ sign_extend 32) (currentByte!11905 (_2!11645 lt!388602))) ((_ sign_extend 32) (currentBit!11900 (_2!11645 lt!388602))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388608 () Unit!18098)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10884 BitStream!10884 (_ BitVec 64) (_ BitVec 64)) Unit!18098)

(assert (=> b!250018 (= lt!388608 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11645 lt!388602) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!173286 () Bool)

(assert (=> b!250018 e!173286))

(declare-fun res!209280 () Bool)

(assert (=> b!250018 (=> (not res!209280) (not e!173286))))

(assert (=> b!250018 (= res!209280 (= (size!5981 (buf!6474 thiss!1005)) (size!5981 (buf!6474 (_2!11645 lt!388602)))))))

(declare-fun appendBit!0 (BitStream!10884 Bool) tuple2!21440)

(assert (=> b!250018 (= lt!388602 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!250019 () Bool)

(declare-fun e!173287 () Bool)

(declare-fun lt!388605 () tuple2!21438)

(declare-datatypes ((tuple2!21442 0))(
  ( (tuple2!21443 (_1!11646 BitStream!10884) (_2!11646 BitStream!10884)) )
))
(declare-fun lt!388607 () tuple2!21442)

(assert (=> b!250019 (= e!173287 (not (or (not (_2!11644 lt!388605)) (not (= (_1!11644 lt!388605) (_2!11646 lt!388607))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10884 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21438)

(assert (=> b!250019 (= lt!388605 (checkBitsLoopPure!0 (_1!11646 lt!388607) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!388599 () (_ BitVec 64))

(assert (=> b!250019 (validate_offset_bits!1 ((_ sign_extend 32) (size!5981 (buf!6474 (_2!11645 lt!388603)))) ((_ sign_extend 32) (currentByte!11905 (_2!11645 lt!388602))) ((_ sign_extend 32) (currentBit!11900 (_2!11645 lt!388602))) lt!388599)))

(declare-fun lt!388604 () Unit!18098)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10884 array!13635 (_ BitVec 64)) Unit!18098)

(assert (=> b!250019 (= lt!388604 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11645 lt!388602) (buf!6474 (_2!11645 lt!388603)) lt!388599))))

(declare-fun reader!0 (BitStream!10884 BitStream!10884) tuple2!21442)

(assert (=> b!250019 (= lt!388607 (reader!0 (_2!11645 lt!388602) (_2!11645 lt!388603)))))

(declare-fun b!250020 () Bool)

(declare-fun e!173284 () Bool)

(declare-fun array_inv!5722 (array!13635) Bool)

(assert (=> b!250020 (= e!173284 (array_inv!5722 (buf!6474 thiss!1005)))))

(declare-fun b!250021 () Bool)

(declare-fun res!209278 () Bool)

(assert (=> b!250021 (=> (not res!209278) (not e!173287))))

(assert (=> b!250021 (= res!209278 (isPrefixOf!0 (_2!11645 lt!388602) (_2!11645 lt!388603)))))

(declare-fun b!250022 () Bool)

(declare-fun res!209272 () Bool)

(assert (=> b!250022 (=> (not res!209272) (not e!173290))))

(assert (=> b!250022 (= res!209272 (bvslt from!289 nBits!297))))

(declare-fun b!250023 () Bool)

(assert (=> b!250023 (= e!173286 e!173289)))

(declare-fun res!209274 () Bool)

(assert (=> b!250023 (=> (not res!209274) (not e!173289))))

(declare-fun lt!388600 () (_ BitVec 64))

(assert (=> b!250023 (= res!209274 (= lt!388601 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388600)))))

(assert (=> b!250023 (= lt!388601 (bitIndex!0 (size!5981 (buf!6474 (_2!11645 lt!388602))) (currentByte!11905 (_2!11645 lt!388602)) (currentBit!11900 (_2!11645 lt!388602))))))

(assert (=> b!250023 (= lt!388600 (bitIndex!0 (size!5981 (buf!6474 thiss!1005)) (currentByte!11905 thiss!1005) (currentBit!11900 thiss!1005)))))

(declare-fun res!209276 () Bool)

(assert (=> start!53726 (=> (not res!209276) (not e!173290))))

(assert (=> start!53726 (= res!209276 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53726 e!173290))

(assert (=> start!53726 true))

(declare-fun inv!12 (BitStream!10884) Bool)

(assert (=> start!53726 (and (inv!12 thiss!1005) e!173284)))

(declare-fun b!250024 () Bool)

(assert (=> b!250024 (= e!173285 e!173287)))

(declare-fun res!209271 () Bool)

(assert (=> b!250024 (=> (not res!209271) (not e!173287))))

(assert (=> b!250024 (= res!209271 (= (bitIndex!0 (size!5981 (buf!6474 (_2!11645 lt!388603))) (currentByte!11905 (_2!11645 lt!388603)) (currentBit!11900 (_2!11645 lt!388603))) (bvadd (bitIndex!0 (size!5981 (buf!6474 (_2!11645 lt!388602))) (currentByte!11905 (_2!11645 lt!388602)) (currentBit!11900 (_2!11645 lt!388602))) lt!388599)))))

(assert (=> b!250024 (= lt!388599 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!250025 () Bool)

(assert (=> b!250025 (= e!173291 (isPrefixOf!0 (_2!11645 lt!388602) (_2!11645 lt!388603)))))

(assert (= (and start!53726 res!209276) b!250014))

(assert (= (and b!250014 res!209273) b!250022))

(assert (= (and b!250022 res!209272) b!250018))

(assert (= (and b!250018 res!209280) b!250023))

(assert (= (and b!250023 res!209274) b!250017))

(assert (= (and b!250017 res!209270) b!250016))

(assert (= (and b!250016 res!209279) b!250015))

(assert (= (and b!250018 res!209277) b!250024))

(assert (= (and b!250024 res!209271) b!250021))

(assert (= (and b!250021 res!209278) b!250019))

(assert (= (and b!250018 (not res!209275)) b!250025))

(assert (= start!53726 b!250020))

(declare-fun m!376409 () Bool)

(assert (=> b!250024 m!376409))

(declare-fun m!376411 () Bool)

(assert (=> b!250024 m!376411))

(declare-fun m!376413 () Bool)

(assert (=> b!250016 m!376413))

(assert (=> b!250016 m!376413))

(declare-fun m!376415 () Bool)

(assert (=> b!250016 m!376415))

(declare-fun m!376417 () Bool)

(assert (=> start!53726 m!376417))

(declare-fun m!376419 () Bool)

(assert (=> b!250025 m!376419))

(declare-fun m!376421 () Bool)

(assert (=> b!250018 m!376421))

(declare-fun m!376423 () Bool)

(assert (=> b!250018 m!376423))

(declare-fun m!376425 () Bool)

(assert (=> b!250018 m!376425))

(declare-fun m!376427 () Bool)

(assert (=> b!250018 m!376427))

(declare-fun m!376429 () Bool)

(assert (=> b!250018 m!376429))

(assert (=> b!250021 m!376419))

(declare-fun m!376431 () Bool)

(assert (=> b!250015 m!376431))

(assert (=> b!250017 m!376423))

(declare-fun m!376433 () Bool)

(assert (=> b!250014 m!376433))

(assert (=> b!250023 m!376411))

(declare-fun m!376435 () Bool)

(assert (=> b!250023 m!376435))

(declare-fun m!376437 () Bool)

(assert (=> b!250020 m!376437))

(declare-fun m!376439 () Bool)

(assert (=> b!250019 m!376439))

(declare-fun m!376441 () Bool)

(assert (=> b!250019 m!376441))

(declare-fun m!376443 () Bool)

(assert (=> b!250019 m!376443))

(declare-fun m!376445 () Bool)

(assert (=> b!250019 m!376445))

(check-sat (not b!250021) (not b!250024) (not b!250020) (not b!250023) (not b!250016) (not start!53726) (not b!250019) (not b!250018) (not b!250015) (not b!250017) (not b!250014) (not b!250025))
