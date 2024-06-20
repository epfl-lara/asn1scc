; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15958 () Bool)

(assert start!15958)

(declare-fun b!80594 () Bool)

(declare-fun res!66676 () Bool)

(declare-fun e!52987 () Bool)

(assert (=> b!80594 (=> res!66676 e!52987)))

(declare-datatypes ((array!3543 0))(
  ( (array!3544 (arr!2245 (Array (_ BitVec 32) (_ BitVec 8))) (size!1635 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2832 0))(
  ( (BitStream!2833 (buf!2025 array!3543) (currentByte!3923 (_ BitVec 32)) (currentBit!3918 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2832)

(declare-fun nBits!516 () (_ BitVec 64))

(declare-datatypes ((Unit!5328 0))(
  ( (Unit!5329) )
))
(declare-datatypes ((tuple3!306 0))(
  ( (tuple3!307 (_1!3744 Unit!5328) (_2!3744 BitStream!2832) (_3!174 array!3543)) )
))
(declare-fun lt!127644 () tuple3!306)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80594 (= res!66676 (not (= (bvadd (bitIndex!0 (size!1635 (buf!2025 thiss!1716)) (currentByte!3923 thiss!1716) (currentBit!3918 thiss!1716)) nBits!516) (bitIndex!0 (size!1635 (buf!2025 (_2!3744 lt!127644))) (currentByte!3923 (_2!3744 lt!127644)) (currentBit!3918 (_2!3744 lt!127644))))))))

(declare-fun b!80596 () Bool)

(declare-fun res!66673 () Bool)

(declare-fun e!52989 () Bool)

(assert (=> b!80596 (=> (not res!66673) (not e!52989))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80596 (= res!66673 (validate_offset_bits!1 ((_ sign_extend 32) (size!1635 (buf!2025 thiss!1716))) ((_ sign_extend 32) (currentByte!3923 thiss!1716)) ((_ sign_extend 32) (currentBit!3918 thiss!1716)) nBits!516))))

(declare-fun b!80597 () Bool)

(declare-fun e!52988 () Bool)

(declare-fun array_inv!1481 (array!3543) Bool)

(assert (=> b!80597 (= e!52988 (array_inv!1481 (buf!2025 thiss!1716)))))

(declare-fun b!80598 () Bool)

(assert (=> b!80598 (= e!52989 false)))

(declare-fun lt!127643 () Bool)

(assert (=> b!80598 (= lt!127643 e!52987)))

(declare-fun res!66675 () Bool)

(assert (=> b!80598 (=> res!66675 e!52987)))

(assert (=> b!80598 (= res!66675 (not (= (buf!2025 (_2!3744 lt!127644)) (buf!2025 thiss!1716))))))

(declare-fun readBitsLoop!0 (BitStream!2832 (_ BitVec 64) array!3543 (_ BitVec 64) (_ BitVec 64)) tuple3!306)

(assert (=> b!80598 (= lt!127644 (readBitsLoop!0 thiss!1716 nBits!516 (array!3544 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(declare-fun b!80595 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80595 (= e!52987 (not (invariant!0 (currentBit!3918 (_2!3744 lt!127644)) (currentByte!3923 (_2!3744 lt!127644)) (size!1635 (buf!2025 (_2!3744 lt!127644))))))))

(declare-fun res!66674 () Bool)

(assert (=> start!15958 (=> (not res!66674) (not e!52989))))

(assert (=> start!15958 (= res!66674 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15958 e!52989))

(assert (=> start!15958 true))

(declare-fun inv!12 (BitStream!2832) Bool)

(assert (=> start!15958 (and (inv!12 thiss!1716) e!52988)))

(assert (= (and start!15958 res!66674) b!80596))

(assert (= (and b!80596 res!66673) b!80598))

(assert (= (and b!80598 (not res!66675)) b!80594))

(assert (= (and b!80594 (not res!66676)) b!80595))

(assert (= start!15958 b!80597))

(declare-fun m!126101 () Bool)

(assert (=> b!80596 m!126101))

(declare-fun m!126103 () Bool)

(assert (=> b!80597 m!126103))

(declare-fun m!126105 () Bool)

(assert (=> b!80594 m!126105))

(declare-fun m!126107 () Bool)

(assert (=> b!80594 m!126107))

(declare-fun m!126109 () Bool)

(assert (=> b!80598 m!126109))

(declare-fun m!126111 () Bool)

(assert (=> b!80595 m!126111))

(declare-fun m!126113 () Bool)

(assert (=> start!15958 m!126113))

(check-sat (not b!80594) (not b!80596) (not b!80598) (not b!80595) (not b!80597) (not start!15958))
