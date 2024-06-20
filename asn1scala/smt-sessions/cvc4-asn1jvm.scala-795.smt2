; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22992 () Bool)

(assert start!22992)

(declare-fun b!116594 () Bool)

(declare-fun e!76436 () Bool)

(declare-datatypes ((array!5256 0))(
  ( (array!5257 (arr!2978 (Array (_ BitVec 32) (_ BitVec 8))) (size!2385 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4244 0))(
  ( (BitStream!4245 (buf!2795 array!5256) (currentByte!5432 (_ BitVec 32)) (currentBit!5427 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4244)

(declare-datatypes ((Unit!7175 0))(
  ( (Unit!7176) )
))
(declare-datatypes ((tuple2!9680 0))(
  ( (tuple2!9681 (_1!5105 Unit!7175) (_2!5105 BitStream!4244)) )
))
(declare-fun lt!178172 () tuple2!9680)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116594 (= e!76436 (invariant!0 (currentBit!5427 thiss!1305) (currentByte!5432 thiss!1305) (size!2385 (buf!2795 (_2!5105 lt!178172)))))))

(declare-fun b!116595 () Bool)

(declare-fun e!76439 () Bool)

(declare-fun e!76434 () Bool)

(assert (=> b!116595 (= e!76439 e!76434)))

(declare-fun res!96415 () Bool)

(assert (=> b!116595 (=> (not res!96415) (not e!76434))))

(declare-fun lt!178170 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116595 (= res!96415 (validate_offset_bits!1 ((_ sign_extend 32) (size!2385 (buf!2795 thiss!1305))) ((_ sign_extend 32) (currentByte!5432 thiss!1305)) ((_ sign_extend 32) (currentBit!5427 thiss!1305)) lt!178170))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!116595 (= lt!178170 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!116596 () Bool)

(declare-fun e!76432 () Bool)

(declare-fun e!76437 () Bool)

(assert (=> b!116596 (= e!76432 e!76437)))

(declare-fun res!96414 () Bool)

(assert (=> b!116596 (=> (not res!96414) (not e!76437))))

(declare-fun lt!178161 () (_ BitVec 64))

(declare-fun lt!178160 () (_ BitVec 64))

(assert (=> b!116596 (= res!96414 (= lt!178161 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!178160)))))

(declare-fun lt!178173 () tuple2!9680)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116596 (= lt!178161 (bitIndex!0 (size!2385 (buf!2795 (_2!5105 lt!178173))) (currentByte!5432 (_2!5105 lt!178173)) (currentBit!5427 (_2!5105 lt!178173))))))

(assert (=> b!116596 (= lt!178160 (bitIndex!0 (size!2385 (buf!2795 thiss!1305)) (currentByte!5432 thiss!1305) (currentBit!5427 thiss!1305)))))

(declare-fun res!96421 () Bool)

(assert (=> start!22992 (=> (not res!96421) (not e!76439))))

(assert (=> start!22992 (= res!96421 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22992 e!76439))

(assert (=> start!22992 true))

(declare-fun e!76435 () Bool)

(declare-fun inv!12 (BitStream!4244) Bool)

(assert (=> start!22992 (and (inv!12 thiss!1305) e!76435)))

(declare-fun b!116597 () Bool)

(declare-fun e!76438 () Bool)

(assert (=> b!116597 (= e!76437 e!76438)))

(declare-fun res!96413 () Bool)

(assert (=> b!116597 (=> (not res!96413) (not e!76438))))

(declare-fun lt!178159 () Bool)

(declare-datatypes ((tuple2!9682 0))(
  ( (tuple2!9683 (_1!5106 BitStream!4244) (_2!5106 Bool)) )
))
(declare-fun lt!178171 () tuple2!9682)

(assert (=> b!116597 (= res!96413 (and (= (_2!5106 lt!178171) lt!178159) (= (_1!5106 lt!178171) (_2!5105 lt!178173))))))

(declare-fun readBitPure!0 (BitStream!4244) tuple2!9682)

(declare-fun readerFrom!0 (BitStream!4244 (_ BitVec 32) (_ BitVec 32)) BitStream!4244)

(assert (=> b!116597 (= lt!178171 (readBitPure!0 (readerFrom!0 (_2!5105 lt!178173) (currentBit!5427 thiss!1305) (currentByte!5432 thiss!1305))))))

(declare-fun b!116598 () Bool)

(declare-fun res!96417 () Bool)

(assert (=> b!116598 (=> (not res!96417) (not e!76436))))

(assert (=> b!116598 (= res!96417 (invariant!0 (currentBit!5427 thiss!1305) (currentByte!5432 thiss!1305) (size!2385 (buf!2795 (_2!5105 lt!178173)))))))

(declare-fun b!116599 () Bool)

(declare-fun res!96423 () Bool)

(assert (=> b!116599 (=> (not res!96423) (not e!76437))))

(declare-fun isPrefixOf!0 (BitStream!4244 BitStream!4244) Bool)

(assert (=> b!116599 (= res!96423 (isPrefixOf!0 thiss!1305 (_2!5105 lt!178173)))))

(declare-fun b!116600 () Bool)

(declare-fun res!96422 () Bool)

(assert (=> b!116600 (=> (not res!96422) (not e!76434))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116600 (= res!96422 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!116601 () Bool)

(declare-fun e!76433 () Bool)

(declare-fun lt!178163 () tuple2!9682)

(declare-fun lt!178165 () tuple2!9682)

(assert (=> b!116601 (= e!76433 (= (_2!5106 lt!178163) (_2!5106 lt!178165)))))

(declare-fun b!116602 () Bool)

(declare-fun array_inv!2187 (array!5256) Bool)

(assert (=> b!116602 (= e!76435 (array_inv!2187 (buf!2795 thiss!1305)))))

(declare-fun b!116603 () Bool)

(assert (=> b!116603 (= e!76438 (= (bitIndex!0 (size!2385 (buf!2795 (_1!5106 lt!178171))) (currentByte!5432 (_1!5106 lt!178171)) (currentBit!5427 (_1!5106 lt!178171))) lt!178161))))

(declare-fun b!116604 () Bool)

(declare-fun res!96420 () Bool)

(assert (=> b!116604 (=> (not res!96420) (not e!76434))))

(assert (=> b!116604 (= res!96420 (bvslt i!615 nBits!396))))

(declare-fun b!116605 () Bool)

(assert (=> b!116605 (= e!76434 (not (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!9684 0))(
  ( (tuple2!9685 (_1!5107 BitStream!4244) (_2!5107 (_ BitVec 64))) )
))
(declare-fun lt!178162 () tuple2!9684)

(declare-datatypes ((tuple2!9686 0))(
  ( (tuple2!9687 (_1!5108 BitStream!4244) (_2!5108 BitStream!4244)) )
))
(declare-fun lt!178166 () tuple2!9686)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4244 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9684)

(assert (=> b!116605 (= lt!178162 (readNLeastSignificantBitsLoopPure!0 (_1!5108 lt!178166) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> b!116605 (validate_offset_bits!1 ((_ sign_extend 32) (size!2385 (buf!2795 (_2!5105 lt!178172)))) ((_ sign_extend 32) (currentByte!5432 thiss!1305)) ((_ sign_extend 32) (currentBit!5427 thiss!1305)) lt!178170)))

(declare-fun lt!178169 () Unit!7175)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4244 array!5256 (_ BitVec 64)) Unit!7175)

(assert (=> b!116605 (= lt!178169 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2795 (_2!5105 lt!178172)) lt!178170))))

(assert (=> b!116605 (= (_2!5106 (readBitPure!0 (_1!5108 lt!178166))) lt!178159)))

(declare-fun lt!178164 () tuple2!9686)

(declare-fun reader!0 (BitStream!4244 BitStream!4244) tuple2!9686)

(assert (=> b!116605 (= lt!178164 (reader!0 (_2!5105 lt!178173) (_2!5105 lt!178172)))))

(assert (=> b!116605 (= lt!178166 (reader!0 thiss!1305 (_2!5105 lt!178172)))))

(assert (=> b!116605 e!76433))

(declare-fun res!96416 () Bool)

(assert (=> b!116605 (=> (not res!96416) (not e!76433))))

(assert (=> b!116605 (= res!96416 (= (bitIndex!0 (size!2385 (buf!2795 (_1!5106 lt!178163))) (currentByte!5432 (_1!5106 lt!178163)) (currentBit!5427 (_1!5106 lt!178163))) (bitIndex!0 (size!2385 (buf!2795 (_1!5106 lt!178165))) (currentByte!5432 (_1!5106 lt!178165)) (currentBit!5427 (_1!5106 lt!178165)))))))

(declare-fun lt!178168 () Unit!7175)

(declare-fun lt!178158 () BitStream!4244)

(declare-fun readBitPrefixLemma!0 (BitStream!4244 BitStream!4244) Unit!7175)

(assert (=> b!116605 (= lt!178168 (readBitPrefixLemma!0 lt!178158 (_2!5105 lt!178172)))))

(assert (=> b!116605 (= lt!178165 (readBitPure!0 (BitStream!4245 (buf!2795 (_2!5105 lt!178172)) (currentByte!5432 thiss!1305) (currentBit!5427 thiss!1305))))))

(assert (=> b!116605 (= lt!178163 (readBitPure!0 lt!178158))))

(assert (=> b!116605 (= lt!178158 (BitStream!4245 (buf!2795 (_2!5105 lt!178173)) (currentByte!5432 thiss!1305) (currentBit!5427 thiss!1305)))))

(assert (=> b!116605 e!76436))

(declare-fun res!96419 () Bool)

(assert (=> b!116605 (=> (not res!96419) (not e!76436))))

(assert (=> b!116605 (= res!96419 (isPrefixOf!0 thiss!1305 (_2!5105 lt!178172)))))

(declare-fun lt!178167 () Unit!7175)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4244 BitStream!4244 BitStream!4244) Unit!7175)

(assert (=> b!116605 (= lt!178167 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5105 lt!178173) (_2!5105 lt!178172)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4244 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9680)

(assert (=> b!116605 (= lt!178172 (appendNLeastSignificantBitsLoop!0 (_2!5105 lt!178173) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!116605 e!76432))

(declare-fun res!96418 () Bool)

(assert (=> b!116605 (=> (not res!96418) (not e!76432))))

(assert (=> b!116605 (= res!96418 (= (size!2385 (buf!2795 thiss!1305)) (size!2385 (buf!2795 (_2!5105 lt!178173)))))))

(declare-fun appendBit!0 (BitStream!4244 Bool) tuple2!9680)

(assert (=> b!116605 (= lt!178173 (appendBit!0 thiss!1305 lt!178159))))

(assert (=> b!116605 (= lt!178159 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!22992 res!96421) b!116595))

(assert (= (and b!116595 res!96415) b!116600))

(assert (= (and b!116600 res!96422) b!116604))

(assert (= (and b!116604 res!96420) b!116605))

(assert (= (and b!116605 res!96418) b!116596))

(assert (= (and b!116596 res!96414) b!116599))

(assert (= (and b!116599 res!96423) b!116597))

(assert (= (and b!116597 res!96413) b!116603))

(assert (= (and b!116605 res!96419) b!116598))

(assert (= (and b!116598 res!96417) b!116594))

(assert (= (and b!116605 res!96416) b!116601))

(assert (= start!22992 b!116602))

(declare-fun m!174603 () Bool)

(assert (=> b!116598 m!174603))

(declare-fun m!174605 () Bool)

(assert (=> b!116596 m!174605))

(declare-fun m!174607 () Bool)

(assert (=> b!116596 m!174607))

(declare-fun m!174609 () Bool)

(assert (=> b!116603 m!174609))

(declare-fun m!174611 () Bool)

(assert (=> b!116605 m!174611))

(declare-fun m!174613 () Bool)

(assert (=> b!116605 m!174613))

(declare-fun m!174615 () Bool)

(assert (=> b!116605 m!174615))

(declare-fun m!174617 () Bool)

(assert (=> b!116605 m!174617))

(declare-fun m!174619 () Bool)

(assert (=> b!116605 m!174619))

(declare-fun m!174621 () Bool)

(assert (=> b!116605 m!174621))

(declare-fun m!174623 () Bool)

(assert (=> b!116605 m!174623))

(declare-fun m!174625 () Bool)

(assert (=> b!116605 m!174625))

(declare-fun m!174627 () Bool)

(assert (=> b!116605 m!174627))

(declare-fun m!174629 () Bool)

(assert (=> b!116605 m!174629))

(declare-fun m!174631 () Bool)

(assert (=> b!116605 m!174631))

(declare-fun m!174633 () Bool)

(assert (=> b!116605 m!174633))

(declare-fun m!174635 () Bool)

(assert (=> b!116605 m!174635))

(declare-fun m!174637 () Bool)

(assert (=> b!116605 m!174637))

(declare-fun m!174639 () Bool)

(assert (=> b!116605 m!174639))

(declare-fun m!174641 () Bool)

(assert (=> b!116605 m!174641))

(declare-fun m!174643 () Bool)

(assert (=> b!116595 m!174643))

(declare-fun m!174645 () Bool)

(assert (=> b!116602 m!174645))

(declare-fun m!174647 () Bool)

(assert (=> b!116594 m!174647))

(declare-fun m!174649 () Bool)

(assert (=> b!116597 m!174649))

(assert (=> b!116597 m!174649))

(declare-fun m!174651 () Bool)

(assert (=> b!116597 m!174651))

(declare-fun m!174653 () Bool)

(assert (=> b!116599 m!174653))

(declare-fun m!174655 () Bool)

(assert (=> start!22992 m!174655))

(declare-fun m!174657 () Bool)

(assert (=> b!116600 m!174657))

(push 1)

(assert (not b!116594))

(assert (not b!116603))

(assert (not b!116596))

(assert (not b!116605))

(assert (not start!22992))

(assert (not b!116599))

(assert (not b!116595))

(assert (not b!116602))

(assert (not b!116600))

(assert (not b!116597))

(assert (not b!116598))

(check-sat)

(pop 1)

(push 1)

(check-sat)

