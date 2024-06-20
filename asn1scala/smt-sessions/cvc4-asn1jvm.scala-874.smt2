; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25168 () Bool)

(assert start!25168)

(declare-fun b!127613 () Bool)

(declare-fun e!84301 () Bool)

(declare-datatypes ((array!5793 0))(
  ( (array!5794 (arr!3239 (Array (_ BitVec 32) (_ BitVec 8))) (size!2622 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4568 0))(
  ( (BitStream!4569 (buf!3010 array!5793) (currentByte!5755 (_ BitVec 32)) (currentBit!5750 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4568)

(declare-fun array_inv!2411 (array!5793) Bool)

(assert (=> b!127613 (= e!84301 (array_inv!2411 (buf!3010 thiss!1614)))))

(declare-fun b!127614 () Bool)

(declare-fun e!84304 () Bool)

(declare-fun e!84302 () Bool)

(assert (=> b!127614 (= e!84304 (not e!84302))))

(declare-fun res!105808 () Bool)

(assert (=> b!127614 (=> res!105808 e!84302)))

(declare-datatypes ((tuple2!10780 0))(
  ( (tuple2!10781 (_1!5678 BitStream!4568) (_2!5678 array!5793)) )
))
(declare-fun lt!198946 () tuple2!10780)

(declare-datatypes ((tuple2!10782 0))(
  ( (tuple2!10783 (_1!5679 BitStream!4568) (_2!5679 BitStream!4568)) )
))
(declare-fun lt!198948 () tuple2!10782)

(declare-fun arr!227 () array!5793)

(assert (=> b!127614 (= res!105808 (or (not (= (size!2622 (_2!5678 lt!198946)) (size!2622 arr!227))) (not (= (_1!5678 lt!198946) (_2!5679 lt!198948)))))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4568 array!5793 (_ BitVec 32) (_ BitVec 32)) tuple2!10780)

(assert (=> b!127614 (= lt!198946 (readByteArrayLoopPure!0 (_1!5679 lt!198948) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-datatypes ((Unit!7847 0))(
  ( (Unit!7848) )
))
(declare-datatypes ((tuple2!10784 0))(
  ( (tuple2!10785 (_1!5680 Unit!7847) (_2!5680 BitStream!4568)) )
))
(declare-fun lt!198951 () tuple2!10784)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!127614 (validate_offset_bits!1 ((_ sign_extend 32) (size!2622 (buf!3010 (_2!5680 lt!198951)))) ((_ sign_extend 32) (currentByte!5755 thiss!1614)) ((_ sign_extend 32) (currentBit!5750 thiss!1614)) ((_ sign_extend 32) noOfBytes!1))))

(declare-fun lt!198952 () Unit!7847)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4568 array!5793 (_ BitVec 64)) Unit!7847)

(assert (=> b!127614 (= lt!198952 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!3010 (_2!5680 lt!198951)) ((_ sign_extend 32) noOfBytes!1)))))

(declare-fun reader!0 (BitStream!4568 BitStream!4568) tuple2!10782)

(assert (=> b!127614 (= lt!198948 (reader!0 thiss!1614 (_2!5680 lt!198951)))))

(declare-fun b!127615 () Bool)

(declare-fun res!105810 () Bool)

(declare-fun e!84306 () Bool)

(assert (=> b!127615 (=> (not res!105810) (not e!84306))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127615 (= res!105810 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2622 (buf!3010 thiss!1614))) ((_ sign_extend 32) (currentByte!5755 thiss!1614)) ((_ sign_extend 32) (currentBit!5750 thiss!1614)) noOfBytes!1))))

(declare-fun b!127616 () Bool)

(assert (=> b!127616 (= e!84306 (not e!84304))))

(declare-fun res!105813 () Bool)

(assert (=> b!127616 (=> (not res!105813) (not e!84304))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!127616 (= res!105813 (= (bitIndex!0 (size!2622 (buf!3010 (_2!5680 lt!198951))) (currentByte!5755 (_2!5680 lt!198951)) (currentBit!5750 (_2!5680 lt!198951))) (bvadd (bitIndex!0 (size!2622 (buf!3010 thiss!1614)) (currentByte!5755 thiss!1614) (currentBit!5750 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1)))))))

(declare-fun e!84303 () Bool)

(assert (=> b!127616 e!84303))

(declare-fun res!105812 () Bool)

(assert (=> b!127616 (=> (not res!105812) (not e!84303))))

(assert (=> b!127616 (= res!105812 (= (size!2622 (buf!3010 thiss!1614)) (size!2622 (buf!3010 (_2!5680 lt!198951)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4568 array!5793 (_ BitVec 32) (_ BitVec 32)) tuple2!10784)

(assert (=> b!127616 (= lt!198951 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!198950 () tuple2!10780)

(declare-fun e!84300 () Bool)

(declare-fun b!127617 () Bool)

(declare-fun arrayRangesEq!106 (array!5793 array!5793 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127617 (= e!84300 (not (arrayRangesEq!106 arr!227 (_2!5678 lt!198950) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!127618 () Bool)

(assert (=> b!127618 (= e!84302 (not (arrayRangesEq!106 arr!227 (_2!5678 lt!198946) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!127619 () Bool)

(declare-fun res!105807 () Bool)

(assert (=> b!127619 (=> (not res!105807) (not e!84304))))

(declare-fun isPrefixOf!0 (BitStream!4568 BitStream!4568) Bool)

(assert (=> b!127619 (= res!105807 (isPrefixOf!0 thiss!1614 (_2!5680 lt!198951)))))

(declare-fun res!105811 () Bool)

(assert (=> start!25168 (=> (not res!105811) (not e!84306))))

(assert (=> start!25168 (= res!105811 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2622 arr!227))))))

(assert (=> start!25168 e!84306))

(assert (=> start!25168 true))

(assert (=> start!25168 (array_inv!2411 arr!227)))

(declare-fun inv!12 (BitStream!4568) Bool)

(assert (=> start!25168 (and (inv!12 thiss!1614) e!84301)))

(declare-fun b!127620 () Bool)

(declare-fun e!84307 () Bool)

(assert (=> b!127620 (= e!84303 e!84307)))

(declare-fun res!105814 () Bool)

(assert (=> b!127620 (=> (not res!105814) (not e!84307))))

(declare-fun lt!198949 () (_ BitVec 64))

(assert (=> b!127620 (= res!105814 (= (bitIndex!0 (size!2622 (buf!3010 (_2!5680 lt!198951))) (currentByte!5755 (_2!5680 lt!198951)) (currentBit!5750 (_2!5680 lt!198951))) (bvadd (bitIndex!0 (size!2622 (buf!3010 thiss!1614)) (currentByte!5755 thiss!1614) (currentBit!5750 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198949))))))

(assert (=> b!127620 (= lt!198949 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!127621 () Bool)

(declare-fun res!105806 () Bool)

(assert (=> b!127621 (=> (not res!105806) (not e!84307))))

(assert (=> b!127621 (= res!105806 (isPrefixOf!0 thiss!1614 (_2!5680 lt!198951)))))

(declare-fun b!127622 () Bool)

(assert (=> b!127622 (= e!84307 (not e!84300))))

(declare-fun res!105809 () Bool)

(assert (=> b!127622 (=> res!105809 e!84300)))

(declare-fun lt!198953 () tuple2!10782)

(assert (=> b!127622 (= res!105809 (or (not (= (size!2622 (_2!5678 lt!198950)) (size!2622 arr!227))) (not (= (_1!5678 lt!198950) (_2!5679 lt!198953)))))))

(assert (=> b!127622 (= lt!198950 (readByteArrayLoopPure!0 (_1!5679 lt!198953) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> b!127622 (validate_offset_bits!1 ((_ sign_extend 32) (size!2622 (buf!3010 (_2!5680 lt!198951)))) ((_ sign_extend 32) (currentByte!5755 thiss!1614)) ((_ sign_extend 32) (currentBit!5750 thiss!1614)) lt!198949)))

(declare-fun lt!198947 () Unit!7847)

(assert (=> b!127622 (= lt!198947 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!3010 (_2!5680 lt!198951)) lt!198949))))

(assert (=> b!127622 (= lt!198953 (reader!0 thiss!1614 (_2!5680 lt!198951)))))

(assert (= (and start!25168 res!105811) b!127615))

(assert (= (and b!127615 res!105810) b!127616))

(assert (= (and b!127616 res!105812) b!127620))

(assert (= (and b!127620 res!105814) b!127621))

(assert (= (and b!127621 res!105806) b!127622))

(assert (= (and b!127622 (not res!105809)) b!127617))

(assert (= (and b!127616 res!105813) b!127619))

(assert (= (and b!127619 res!105807) b!127614))

(assert (= (and b!127614 (not res!105808)) b!127618))

(assert (= start!25168 b!127613))

(declare-fun m!193307 () Bool)

(assert (=> b!127613 m!193307))

(declare-fun m!193309 () Bool)

(assert (=> b!127619 m!193309))

(declare-fun m!193311 () Bool)

(assert (=> b!127617 m!193311))

(declare-fun m!193313 () Bool)

(assert (=> b!127616 m!193313))

(declare-fun m!193315 () Bool)

(assert (=> b!127616 m!193315))

(declare-fun m!193317 () Bool)

(assert (=> b!127616 m!193317))

(assert (=> b!127621 m!193309))

(assert (=> b!127620 m!193313))

(assert (=> b!127620 m!193315))

(declare-fun m!193319 () Bool)

(assert (=> b!127615 m!193319))

(declare-fun m!193321 () Bool)

(assert (=> b!127622 m!193321))

(declare-fun m!193323 () Bool)

(assert (=> b!127622 m!193323))

(declare-fun m!193325 () Bool)

(assert (=> b!127622 m!193325))

(declare-fun m!193327 () Bool)

(assert (=> b!127622 m!193327))

(declare-fun m!193329 () Bool)

(assert (=> b!127618 m!193329))

(declare-fun m!193331 () Bool)

(assert (=> b!127614 m!193331))

(declare-fun m!193333 () Bool)

(assert (=> b!127614 m!193333))

(declare-fun m!193335 () Bool)

(assert (=> b!127614 m!193335))

(assert (=> b!127614 m!193327))

(declare-fun m!193337 () Bool)

(assert (=> start!25168 m!193337))

(declare-fun m!193339 () Bool)

(assert (=> start!25168 m!193339))

(push 1)

(assert (not b!127621))

(assert (not b!127619))

(assert (not b!127613))

(assert (not b!127615))

(assert (not b!127617))

(assert (not b!127614))

(assert (not b!127616))

(assert (not b!127620))

(assert (not b!127622))

(assert (not b!127618))

(assert (not start!25168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

