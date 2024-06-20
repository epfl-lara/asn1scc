; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15964 () Bool)

(assert start!15964)

(declare-fun b!80644 () Bool)

(declare-fun e!53024 () Bool)

(declare-fun lt!127661 () (_ BitVec 64))

(assert (=> b!80644 (= e!53024 (bvsge lt!127661 #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun b!80645 () Bool)

(declare-fun res!66715 () Bool)

(declare-fun e!53025 () Bool)

(assert (=> b!80645 (=> (not res!66715) (not e!53025))))

(declare-datatypes ((array!3549 0))(
  ( (array!3550 (arr!2248 (Array (_ BitVec 32) (_ BitVec 8))) (size!1638 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2838 0))(
  ( (BitStream!2839 (buf!2028 array!3549) (currentByte!3926 (_ BitVec 32)) (currentBit!3921 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2838)

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80645 (= res!66715 (validate_offset_bits!1 ((_ sign_extend 32) (size!1638 (buf!2028 thiss!1716))) ((_ sign_extend 32) (currentByte!3926 thiss!1716)) ((_ sign_extend 32) (currentBit!3921 thiss!1716)) nBits!516))))

(declare-fun b!80646 () Bool)

(declare-fun res!66716 () Bool)

(assert (=> b!80646 (=> (not res!66716) (not e!53024))))

(declare-datatypes ((Unit!5334 0))(
  ( (Unit!5335) )
))
(declare-datatypes ((tuple3!312 0))(
  ( (tuple3!313 (_1!3747 Unit!5334) (_2!3747 BitStream!2838) (_3!177 array!3549)) )
))
(declare-fun lt!127662 () tuple3!312)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80646 (= res!66716 (invariant!0 (currentBit!3921 (_2!3747 lt!127662)) (currentByte!3926 (_2!3747 lt!127662)) (size!1638 (buf!2028 (_2!3747 lt!127662)))))))

(declare-fun b!80647 () Bool)

(assert (=> b!80647 (= e!53025 e!53024)))

(declare-fun res!66717 () Bool)

(assert (=> b!80647 (=> (not res!66717) (not e!53024))))

(assert (=> b!80647 (= res!66717 (= (buf!2028 (_2!3747 lt!127662)) (buf!2028 thiss!1716)))))

(declare-fun readBitsLoop!0 (BitStream!2838 (_ BitVec 64) array!3549 (_ BitVec 64) (_ BitVec 64)) tuple3!312)

(assert (=> b!80647 (= lt!127662 (readBitsLoop!0 thiss!1716 nBits!516 (array!3550 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) lt!127661)) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!80647 (= lt!127661 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!80649 () Bool)

(declare-fun e!53022 () Bool)

(declare-fun array_inv!1484 (array!3549) Bool)

(assert (=> b!80649 (= e!53022 (array_inv!1484 (buf!2028 thiss!1716)))))

(declare-fun b!80648 () Bool)

(declare-fun res!66718 () Bool)

(assert (=> b!80648 (=> (not res!66718) (not e!53024))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80648 (= res!66718 (= (bvadd (bitIndex!0 (size!1638 (buf!2028 thiss!1716)) (currentByte!3926 thiss!1716) (currentBit!3921 thiss!1716)) nBits!516) (bitIndex!0 (size!1638 (buf!2028 (_2!3747 lt!127662))) (currentByte!3926 (_2!3747 lt!127662)) (currentBit!3921 (_2!3747 lt!127662)))))))

(declare-fun res!66714 () Bool)

(assert (=> start!15964 (=> (not res!66714) (not e!53025))))

(assert (=> start!15964 (= res!66714 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15964 e!53025))

(assert (=> start!15964 true))

(declare-fun inv!12 (BitStream!2838) Bool)

(assert (=> start!15964 (and (inv!12 thiss!1716) e!53022)))

(assert (= (and start!15964 res!66714) b!80645))

(assert (= (and b!80645 res!66715) b!80647))

(assert (= (and b!80647 res!66717) b!80648))

(assert (= (and b!80648 res!66718) b!80646))

(assert (= (and b!80646 res!66716) b!80644))

(assert (= start!15964 b!80649))

(declare-fun m!126143 () Bool)

(assert (=> b!80647 m!126143))

(declare-fun m!126145 () Bool)

(assert (=> b!80645 m!126145))

(declare-fun m!126147 () Bool)

(assert (=> b!80646 m!126147))

(declare-fun m!126149 () Bool)

(assert (=> b!80649 m!126149))

(declare-fun m!126151 () Bool)

(assert (=> start!15964 m!126151))

(declare-fun m!126153 () Bool)

(assert (=> b!80648 m!126153))

(declare-fun m!126155 () Bool)

(assert (=> b!80648 m!126155))

(check-sat (not b!80646) (not b!80645) (not b!80648) (not start!15964) (not b!80649) (not b!80647))
(check-sat)
