; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25166 () Bool)

(assert start!25166)

(declare-fun b!127583 () Bool)

(declare-fun e!84278 () Bool)

(declare-fun e!84277 () Bool)

(assert (=> b!127583 (= e!84278 (not e!84277))))

(declare-fun res!105783 () Bool)

(assert (=> b!127583 (=> res!105783 e!84277)))

(declare-datatypes ((array!5791 0))(
  ( (array!5792 (arr!3238 (Array (_ BitVec 32) (_ BitVec 8))) (size!2621 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4566 0))(
  ( (BitStream!4567 (buf!3009 array!5791) (currentByte!5754 (_ BitVec 32)) (currentBit!5749 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10774 0))(
  ( (tuple2!10775 (_1!5675 BitStream!4566) (_2!5675 array!5791)) )
))
(declare-fun lt!198924 () tuple2!10774)

(declare-datatypes ((tuple2!10776 0))(
  ( (tuple2!10777 (_1!5676 BitStream!4566) (_2!5676 BitStream!4566)) )
))
(declare-fun lt!198929 () tuple2!10776)

(declare-fun arr!227 () array!5791)

(assert (=> b!127583 (= res!105783 (or (not (= (size!2621 (_2!5675 lt!198924)) (size!2621 arr!227))) (not (= (_1!5675 lt!198924) (_2!5676 lt!198929)))))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4566 array!5791 (_ BitVec 32) (_ BitVec 32)) tuple2!10774)

(assert (=> b!127583 (= lt!198924 (readByteArrayLoopPure!0 (_1!5676 lt!198929) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-datatypes ((Unit!7845 0))(
  ( (Unit!7846) )
))
(declare-datatypes ((tuple2!10778 0))(
  ( (tuple2!10779 (_1!5677 Unit!7845) (_2!5677 BitStream!4566)) )
))
(declare-fun lt!198923 () tuple2!10778)

(declare-fun thiss!1614 () BitStream!4566)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!127583 (validate_offset_bits!1 ((_ sign_extend 32) (size!2621 (buf!3009 (_2!5677 lt!198923)))) ((_ sign_extend 32) (currentByte!5754 thiss!1614)) ((_ sign_extend 32) (currentBit!5749 thiss!1614)) ((_ sign_extend 32) noOfBytes!1))))

(declare-fun lt!198922 () Unit!7845)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4566 array!5791 (_ BitVec 64)) Unit!7845)

(assert (=> b!127583 (= lt!198922 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!3009 (_2!5677 lt!198923)) ((_ sign_extend 32) noOfBytes!1)))))

(declare-fun reader!0 (BitStream!4566 BitStream!4566) tuple2!10776)

(assert (=> b!127583 (= lt!198929 (reader!0 thiss!1614 (_2!5677 lt!198923)))))

(declare-fun b!127584 () Bool)

(declare-fun res!105784 () Bool)

(declare-fun e!84274 () Bool)

(assert (=> b!127584 (=> (not res!105784) (not e!84274))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127584 (= res!105784 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2621 (buf!3009 thiss!1614))) ((_ sign_extend 32) (currentByte!5754 thiss!1614)) ((_ sign_extend 32) (currentBit!5749 thiss!1614)) noOfBytes!1))))

(declare-fun b!127586 () Bool)

(declare-fun res!105787 () Bool)

(declare-fun e!84276 () Bool)

(assert (=> b!127586 (=> (not res!105787) (not e!84276))))

(declare-fun isPrefixOf!0 (BitStream!4566 BitStream!4566) Bool)

(assert (=> b!127586 (= res!105787 (isPrefixOf!0 thiss!1614 (_2!5677 lt!198923)))))

(declare-fun b!127587 () Bool)

(declare-fun e!84273 () Bool)

(assert (=> b!127587 (= e!84273 e!84276)))

(declare-fun res!105780 () Bool)

(assert (=> b!127587 (=> (not res!105780) (not e!84276))))

(declare-fun lt!198927 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!127587 (= res!105780 (= (bitIndex!0 (size!2621 (buf!3009 (_2!5677 lt!198923))) (currentByte!5754 (_2!5677 lt!198923)) (currentBit!5749 (_2!5677 lt!198923))) (bvadd (bitIndex!0 (size!2621 (buf!3009 thiss!1614)) (currentByte!5754 thiss!1614) (currentBit!5749 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198927))))))

(assert (=> b!127587 (= lt!198927 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!127588 () Bool)

(declare-fun res!105781 () Bool)

(assert (=> b!127588 (=> (not res!105781) (not e!84278))))

(assert (=> b!127588 (= res!105781 (isPrefixOf!0 thiss!1614 (_2!5677 lt!198923)))))

(declare-fun b!127589 () Bool)

(declare-fun e!84279 () Bool)

(declare-fun array_inv!2410 (array!5791) Bool)

(assert (=> b!127589 (= e!84279 (array_inv!2410 (buf!3009 thiss!1614)))))

(declare-fun b!127590 () Bool)

(declare-fun arrayRangesEq!105 (array!5791 array!5791 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127590 (= e!84277 (not (arrayRangesEq!105 arr!227 (_2!5675 lt!198924) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!127591 () Bool)

(assert (=> b!127591 (= e!84274 (not e!84278))))

(declare-fun res!105785 () Bool)

(assert (=> b!127591 (=> (not res!105785) (not e!84278))))

(assert (=> b!127591 (= res!105785 (= (bitIndex!0 (size!2621 (buf!3009 (_2!5677 lt!198923))) (currentByte!5754 (_2!5677 lt!198923)) (currentBit!5749 (_2!5677 lt!198923))) (bvadd (bitIndex!0 (size!2621 (buf!3009 thiss!1614)) (currentByte!5754 thiss!1614) (currentBit!5749 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1)))))))

(assert (=> b!127591 e!84273))

(declare-fun res!105782 () Bool)

(assert (=> b!127591 (=> (not res!105782) (not e!84273))))

(assert (=> b!127591 (= res!105782 (= (size!2621 (buf!3009 thiss!1614)) (size!2621 (buf!3009 (_2!5677 lt!198923)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4566 array!5791 (_ BitVec 32) (_ BitVec 32)) tuple2!10778)

(assert (=> b!127591 (= lt!198923 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!127592 () Bool)

(declare-fun e!84280 () Bool)

(assert (=> b!127592 (= e!84276 (not e!84280))))

(declare-fun res!105786 () Bool)

(assert (=> b!127592 (=> res!105786 e!84280)))

(declare-fun lt!198928 () tuple2!10774)

(declare-fun lt!198926 () tuple2!10776)

(assert (=> b!127592 (= res!105786 (or (not (= (size!2621 (_2!5675 lt!198928)) (size!2621 arr!227))) (not (= (_1!5675 lt!198928) (_2!5676 lt!198926)))))))

(assert (=> b!127592 (= lt!198928 (readByteArrayLoopPure!0 (_1!5676 lt!198926) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> b!127592 (validate_offset_bits!1 ((_ sign_extend 32) (size!2621 (buf!3009 (_2!5677 lt!198923)))) ((_ sign_extend 32) (currentByte!5754 thiss!1614)) ((_ sign_extend 32) (currentBit!5749 thiss!1614)) lt!198927)))

(declare-fun lt!198925 () Unit!7845)

(assert (=> b!127592 (= lt!198925 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!3009 (_2!5677 lt!198923)) lt!198927))))

(assert (=> b!127592 (= lt!198926 (reader!0 thiss!1614 (_2!5677 lt!198923)))))

(declare-fun b!127585 () Bool)

(assert (=> b!127585 (= e!84280 (not (arrayRangesEq!105 arr!227 (_2!5675 lt!198928) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun res!105779 () Bool)

(assert (=> start!25166 (=> (not res!105779) (not e!84274))))

(assert (=> start!25166 (= res!105779 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2621 arr!227))))))

(assert (=> start!25166 e!84274))

(assert (=> start!25166 true))

(assert (=> start!25166 (array_inv!2410 arr!227)))

(declare-fun inv!12 (BitStream!4566) Bool)

(assert (=> start!25166 (and (inv!12 thiss!1614) e!84279)))

(assert (= (and start!25166 res!105779) b!127584))

(assert (= (and b!127584 res!105784) b!127591))

(assert (= (and b!127591 res!105782) b!127587))

(assert (= (and b!127587 res!105780) b!127586))

(assert (= (and b!127586 res!105787) b!127592))

(assert (= (and b!127592 (not res!105786)) b!127585))

(assert (= (and b!127591 res!105785) b!127588))

(assert (= (and b!127588 res!105781) b!127583))

(assert (= (and b!127583 (not res!105783)) b!127590))

(assert (= start!25166 b!127589))

(declare-fun m!193273 () Bool)

(assert (=> b!127588 m!193273))

(declare-fun m!193275 () Bool)

(assert (=> b!127589 m!193275))

(declare-fun m!193277 () Bool)

(assert (=> b!127592 m!193277))

(declare-fun m!193279 () Bool)

(assert (=> b!127592 m!193279))

(declare-fun m!193281 () Bool)

(assert (=> b!127592 m!193281))

(declare-fun m!193283 () Bool)

(assert (=> b!127592 m!193283))

(declare-fun m!193285 () Bool)

(assert (=> b!127587 m!193285))

(declare-fun m!193287 () Bool)

(assert (=> b!127587 m!193287))

(declare-fun m!193289 () Bool)

(assert (=> b!127590 m!193289))

(declare-fun m!193291 () Bool)

(assert (=> b!127584 m!193291))

(declare-fun m!193293 () Bool)

(assert (=> b!127585 m!193293))

(declare-fun m!193295 () Bool)

(assert (=> b!127583 m!193295))

(declare-fun m!193297 () Bool)

(assert (=> b!127583 m!193297))

(declare-fun m!193299 () Bool)

(assert (=> b!127583 m!193299))

(assert (=> b!127583 m!193283))

(assert (=> b!127586 m!193273))

(assert (=> b!127591 m!193285))

(assert (=> b!127591 m!193287))

(declare-fun m!193301 () Bool)

(assert (=> b!127591 m!193301))

(declare-fun m!193303 () Bool)

(assert (=> start!25166 m!193303))

(declare-fun m!193305 () Bool)

(assert (=> start!25166 m!193305))

(check-sat (not b!127585) (not b!127588) (not b!127592) (not b!127590) (not b!127583) (not b!127591) (not b!127584) (not start!25166) (not b!127586) (not b!127587) (not b!127589))
