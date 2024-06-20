; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18958 () Bool)

(assert start!18958)

(declare-fun b!94685 () Bool)

(declare-fun res!78006 () Bool)

(declare-fun e!62106 () Bool)

(assert (=> b!94685 (=> (not res!78006) (not e!62106))))

(declare-datatypes ((array!4427 0))(
  ( (array!4428 (arr!2623 (Array (_ BitVec 32) (_ BitVec 8))) (size!2015 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3534 0))(
  ( (BitStream!3535 (buf!2376 array!4427) (currentByte!4739 (_ BitVec 32)) (currentBit!4734 (_ BitVec 32))) )
))
(declare-fun base!8 () BitStream!3534)

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!94685 (= res!78006 (bvslt (bitIndex!0 (size!2015 (buf!2376 base!8)) (currentByte!4739 base!8) (currentBit!4734 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!94686 () Bool)

(declare-fun e!62103 () Bool)

(declare-fun bitStream2!8 () BitStream!3534)

(declare-fun array_inv!1832 (array!4427) Bool)

(assert (=> b!94686 (= e!62103 (array_inv!1832 (buf!2376 bitStream2!8)))))

(declare-fun b!94687 () Bool)

(declare-fun res!78003 () Bool)

(assert (=> b!94687 (=> (not res!78003) (not e!62106))))

(declare-fun bitStream1!8 () BitStream!3534)

(assert (=> b!94687 (= res!78003 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2015 (buf!2376 bitStream1!8)) (currentByte!4739 bitStream1!8) (currentBit!4734 bitStream1!8))) (bitIndex!0 (size!2015 (buf!2376 bitStream2!8)) (currentByte!4739 bitStream2!8) (currentBit!4734 bitStream2!8))))))

(declare-fun b!94688 () Bool)

(declare-fun e!62100 () Bool)

(assert (=> b!94688 (= e!62100 (array_inv!1832 (buf!2376 bitStream1!8)))))

(declare-fun b!94689 () Bool)

(declare-fun res!78004 () Bool)

(assert (=> b!94689 (=> (not res!78004) (not e!62106))))

(declare-datatypes ((List!873 0))(
  ( (Nil!870) (Cons!869 (h!988 Bool) (t!1623 List!873)) )
))
(declare-fun listBits!13 () List!873)

(declare-fun thiss!1534 () BitStream!3534)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3534 BitStream!3534 (_ BitVec 64)) List!873)

(assert (=> b!94689 (= res!78004 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!94690 () Bool)

(declare-fun res!78000 () Bool)

(assert (=> b!94690 (=> (not res!78000) (not e!62106))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94690 (= res!78000 (validate_offset_bits!1 ((_ sign_extend 32) (size!2015 (buf!2376 bitStream1!8))) ((_ sign_extend 32) (currentByte!4739 bitStream1!8)) ((_ sign_extend 32) (currentBit!4734 bitStream1!8)) nBits!484))))

(declare-fun b!94691 () Bool)

(declare-fun res!77996 () Bool)

(assert (=> b!94691 (=> (not res!77996) (not e!62106))))

(assert (=> b!94691 (= res!77996 (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94692 () Bool)

(declare-fun res!78005 () Bool)

(assert (=> b!94692 (=> (not res!78005) (not e!62106))))

(declare-fun isPrefixOf!0 (BitStream!3534 BitStream!3534) Bool)

(assert (=> b!94692 (= res!78005 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!94693 () Bool)

(assert (=> b!94693 (= e!62106 false)))

(declare-datatypes ((tuple2!7662 0))(
  ( (tuple2!7663 (_1!4078 BitStream!3534) (_2!4078 Bool)) )
))
(declare-fun lt!138846 () tuple2!7662)

(declare-fun readBitPure!0 (BitStream!3534) tuple2!7662)

(assert (=> b!94693 (= lt!138846 (readBitPure!0 bitStream1!8))))

(declare-fun b!94694 () Bool)

(declare-fun res!77995 () Bool)

(assert (=> b!94694 (=> (not res!77995) (not e!62106))))

(assert (=> b!94694 (= res!77995 (and (= (buf!2376 bitStream1!8) (buf!2376 bitStream2!8)) (= (buf!2376 bitStream1!8) (buf!2376 base!8))))))

(declare-fun b!94695 () Bool)

(declare-fun res!78001 () Bool)

(assert (=> b!94695 (=> (not res!78001) (not e!62106))))

(assert (=> b!94695 (= res!78001 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!94696 () Bool)

(declare-fun e!62098 () Bool)

(assert (=> b!94696 (= e!62098 (array_inv!1832 (buf!2376 base!8)))))

(declare-fun b!94697 () Bool)

(declare-fun e!62105 () Bool)

(assert (=> b!94697 (= e!62105 (array_inv!1832 (buf!2376 thiss!1534)))))

(declare-fun b!94698 () Bool)

(declare-fun res!77998 () Bool)

(assert (=> b!94698 (=> (not res!77998) (not e!62106))))

(assert (=> b!94698 (= res!77998 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!94699 () Bool)

(declare-fun res!77997 () Bool)

(assert (=> b!94699 (=> (not res!77997) (not e!62106))))

(declare-fun length!464 (List!873) Int)

(assert (=> b!94699 (= res!77997 (> (length!464 listBits!13) 0))))

(declare-fun b!94700 () Bool)

(declare-fun res!77999 () Bool)

(assert (=> b!94700 (=> (not res!77999) (not e!62106))))

(assert (=> b!94700 (= res!77999 (validate_offset_bits!1 ((_ sign_extend 32) (size!2015 (buf!2376 bitStream2!8))) ((_ sign_extend 32) (currentByte!4739 bitStream2!8)) ((_ sign_extend 32) (currentBit!4734 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!78002 () Bool)

(assert (=> start!18958 (=> (not res!78002) (not e!62106))))

(assert (=> start!18958 (= res!78002 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18958 e!62106))

(assert (=> start!18958 true))

(declare-fun inv!12 (BitStream!3534) Bool)

(assert (=> start!18958 (and (inv!12 bitStream1!8) e!62100)))

(assert (=> start!18958 (and (inv!12 bitStream2!8) e!62103)))

(assert (=> start!18958 (and (inv!12 base!8) e!62098)))

(assert (=> start!18958 (and (inv!12 thiss!1534) e!62105)))

(assert (= (and start!18958 res!78002) b!94699))

(assert (= (and b!94699 res!77997) b!94695))

(assert (= (and b!94695 res!78001) b!94692))

(assert (= (and b!94692 res!78005) b!94698))

(assert (= (and b!94698 res!77998) b!94694))

(assert (= (and b!94694 res!77995) b!94685))

(assert (= (and b!94685 res!78006) b!94687))

(assert (= (and b!94687 res!78003) b!94690))

(assert (= (and b!94690 res!78000) b!94700))

(assert (= (and b!94700 res!77999) b!94689))

(assert (= (and b!94689 res!78004) b!94691))

(assert (= (and b!94691 res!77996) b!94693))

(assert (= start!18958 b!94688))

(assert (= start!18958 b!94686))

(assert (= start!18958 b!94696))

(assert (= start!18958 b!94697))

(declare-fun m!138229 () Bool)

(assert (=> b!94697 m!138229))

(declare-fun m!138231 () Bool)

(assert (=> b!94698 m!138231))

(declare-fun m!138233 () Bool)

(assert (=> start!18958 m!138233))

(declare-fun m!138235 () Bool)

(assert (=> start!18958 m!138235))

(declare-fun m!138237 () Bool)

(assert (=> start!18958 m!138237))

(declare-fun m!138239 () Bool)

(assert (=> start!18958 m!138239))

(declare-fun m!138241 () Bool)

(assert (=> b!94699 m!138241))

(declare-fun m!138243 () Bool)

(assert (=> b!94685 m!138243))

(declare-fun m!138245 () Bool)

(assert (=> b!94692 m!138245))

(declare-fun m!138247 () Bool)

(assert (=> b!94700 m!138247))

(declare-fun m!138249 () Bool)

(assert (=> b!94687 m!138249))

(declare-fun m!138251 () Bool)

(assert (=> b!94687 m!138251))

(declare-fun m!138253 () Bool)

(assert (=> b!94693 m!138253))

(declare-fun m!138255 () Bool)

(assert (=> b!94690 m!138255))

(declare-fun m!138257 () Bool)

(assert (=> b!94689 m!138257))

(declare-fun m!138259 () Bool)

(assert (=> b!94695 m!138259))

(declare-fun m!138261 () Bool)

(assert (=> b!94688 m!138261))

(declare-fun m!138263 () Bool)

(assert (=> b!94686 m!138263))

(declare-fun m!138265 () Bool)

(assert (=> b!94696 m!138265))

(check-sat (not b!94697) (not b!94696) (not b!94699) (not b!94693) (not b!94692) (not b!94689) (not b!94690) (not b!94695) (not b!94686) (not b!94685) (not b!94687) (not start!18958) (not b!94688) (not b!94700) (not b!94698))
