; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17232 () Bool)

(assert start!17232)

(declare-fun res!68887 () Bool)

(declare-fun e!55842 () Bool)

(assert (=> start!17232 (=> (not res!68887) (not e!55842))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3877 0))(
  ( (array!3878 (arr!2398 (Array (_ BitVec 32) (_ BitVec 8))) (size!1761 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3084 0))(
  ( (BitStream!3085 (buf!2151 array!3877) (currentByte!4281 (_ BitVec 32)) (currentBit!4276 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3084)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!3084)

(assert (=> start!17232 (= res!68887 (and (= (size!1761 (buf!2151 b1!98)) (size!1761 (buf!2151 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17232 e!55842))

(declare-fun e!55841 () Bool)

(declare-fun inv!12 (BitStream!3084) Bool)

(assert (=> start!17232 (and (inv!12 b1!98) e!55841)))

(declare-fun e!55839 () Bool)

(assert (=> start!17232 (and (inv!12 b2!98) e!55839)))

(assert (=> start!17232 true))

(declare-fun b!83801 () Bool)

(declare-fun array_inv!1607 (array!3877) Bool)

(assert (=> b!83801 (= e!55839 (array_inv!1607 (buf!2151 b2!98)))))

(declare-fun b!83802 () Bool)

(declare-fun e!55844 () Bool)

(declare-fun e!55840 () Bool)

(assert (=> b!83802 (= e!55844 (not e!55840))))

(declare-fun res!68886 () Bool)

(assert (=> b!83802 (=> res!68886 e!55840)))

(declare-fun lt!133724 () (_ BitVec 64))

(declare-fun lt!133721 () (_ BitVec 64))

(assert (=> b!83802 (= res!68886 (bvsgt lt!133724 (bvsub lt!133721 b1ValidateOffsetBits!11)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83802 (= (remainingBits!0 ((_ sign_extend 32) (size!1761 (buf!2151 b1!98))) ((_ sign_extend 32) (currentByte!4281 b1!98)) ((_ sign_extend 32) (currentBit!4276 b1!98))) (bvsub lt!133721 lt!133724))))

(assert (=> b!83802 (= lt!133721 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1761 (buf!2151 b1!98)))))))

(declare-datatypes ((Unit!5625 0))(
  ( (Unit!5626) )
))
(declare-fun lt!133718 () Unit!5625)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3084) Unit!5625)

(assert (=> b!83802 (= lt!133718 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83803 () Bool)

(declare-fun res!68884 () Bool)

(assert (=> b!83803 (=> (not res!68884) (not e!55842))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83803 (= res!68884 (validate_offset_bits!1 ((_ sign_extend 32) (size!1761 (buf!2151 b1!98))) ((_ sign_extend 32) (currentByte!4281 b1!98)) ((_ sign_extend 32) (currentBit!4276 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83804 () Bool)

(assert (=> b!83804 (= e!55841 (array_inv!1607 (buf!2151 b1!98)))))

(declare-fun b!83805 () Bool)

(assert (=> b!83805 (= e!55842 e!55844)))

(declare-fun res!68885 () Bool)

(assert (=> b!83805 (=> (not res!68885) (not e!55844))))

(declare-fun lt!133720 () (_ BitVec 64))

(declare-fun lt!133722 () (_ BitVec 64))

(assert (=> b!83805 (= res!68885 (= lt!133720 lt!133722))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83805 (= lt!133722 (bitIndex!0 (size!1761 (buf!2151 b2!98)) (currentByte!4281 b2!98) (currentBit!4276 b2!98)))))

(assert (=> b!83805 (= lt!133720 (bvadd lt!133724 b1b2Diff!1))))

(assert (=> b!83805 (= lt!133724 (bitIndex!0 (size!1761 (buf!2151 b1!98)) (currentByte!4281 b1!98) (currentBit!4276 b1!98)))))

(declare-fun lt!133719 () (_ BitVec 64))

(declare-fun lt!133723 () (_ BitVec 64))

(declare-fun b!83806 () Bool)

(assert (=> b!83806 (= e!55840 (or (not (= lt!133723 (bvsub lt!133719 lt!133720))) (= (bvand b1ValidateOffsetBits!11 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand b1b2Diff!1 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand b1ValidateOffsetBits!11 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub b1ValidateOffsetBits!11 b1b2Diff!1) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!83806 (= lt!133723 (bvsub lt!133719 lt!133722))))

(assert (=> b!83806 (= lt!133723 (remainingBits!0 ((_ sign_extend 32) (size!1761 (buf!2151 b2!98))) ((_ sign_extend 32) (currentByte!4281 b2!98)) ((_ sign_extend 32) (currentBit!4276 b2!98))))))

(assert (=> b!83806 (= lt!133719 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1761 (buf!2151 b2!98)))))))

(declare-fun lt!133725 () Unit!5625)

(assert (=> b!83806 (= lt!133725 (remainingBitsBitIndexLemma!0 b2!98))))

(assert (= (and start!17232 res!68887) b!83803))

(assert (= (and b!83803 res!68884) b!83805))

(assert (= (and b!83805 res!68885) b!83802))

(assert (= (and b!83802 (not res!68886)) b!83806))

(assert (= start!17232 b!83804))

(assert (= start!17232 b!83801))

(declare-fun m!130429 () Bool)

(assert (=> b!83803 m!130429))

(declare-fun m!130431 () Bool)

(assert (=> start!17232 m!130431))

(declare-fun m!130433 () Bool)

(assert (=> start!17232 m!130433))

(declare-fun m!130435 () Bool)

(assert (=> b!83802 m!130435))

(declare-fun m!130437 () Bool)

(assert (=> b!83802 m!130437))

(declare-fun m!130439 () Bool)

(assert (=> b!83806 m!130439))

(declare-fun m!130441 () Bool)

(assert (=> b!83806 m!130441))

(declare-fun m!130443 () Bool)

(assert (=> b!83805 m!130443))

(declare-fun m!130445 () Bool)

(assert (=> b!83805 m!130445))

(declare-fun m!130447 () Bool)

(assert (=> b!83801 m!130447))

(declare-fun m!130449 () Bool)

(assert (=> b!83804 m!130449))

(check-sat (not start!17232) (not b!83806) (not b!83804) (not b!83801) (not b!83805) (not b!83802) (not b!83803))
(check-sat)
