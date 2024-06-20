; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17236 () Bool)

(assert start!17236)

(declare-fun lt!133770 () (_ BitVec 64))

(declare-fun b!83837 () Bool)

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun lt!133767 () (_ BitVec 64))

(declare-fun e!55887 () Bool)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun lt!133772 () (_ BitVec 64))

(assert (=> b!83837 (= e!55887 (or (not (= lt!133767 (bvsub lt!133770 lt!133772))) (bvslt lt!133767 (bvsub b1ValidateOffsetBits!11 b1b2Diff!1)) (= (bvand b1ValidateOffsetBits!11 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand b1b2Diff!1 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand b1ValidateOffsetBits!11 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub b1ValidateOffsetBits!11 b1b2Diff!1) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!133771 () (_ BitVec 64))

(assert (=> b!83837 (= lt!133767 (bvsub lt!133770 lt!133771))))

(declare-datatypes ((array!3881 0))(
  ( (array!3882 (arr!2400 (Array (_ BitVec 32) (_ BitVec 8))) (size!1763 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3088 0))(
  ( (BitStream!3089 (buf!2153 array!3881) (currentByte!4283 (_ BitVec 32)) (currentBit!4278 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3088)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83837 (= lt!133767 (remainingBits!0 ((_ sign_extend 32) (size!1763 (buf!2153 b2!98))) ((_ sign_extend 32) (currentByte!4283 b2!98)) ((_ sign_extend 32) (currentBit!4278 b2!98))))))

(assert (=> b!83837 (= lt!133770 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1763 (buf!2153 b2!98)))))))

(declare-datatypes ((Unit!5629 0))(
  ( (Unit!5630) )
))
(declare-fun lt!133769 () Unit!5629)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3088) Unit!5629)

(assert (=> b!83837 (= lt!133769 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!83838 () Bool)

(declare-fun e!55885 () Bool)

(declare-fun array_inv!1609 (array!3881) Bool)

(assert (=> b!83838 (= e!55885 (array_inv!1609 (buf!2153 b2!98)))))

(declare-fun res!68911 () Bool)

(declare-fun e!55883 () Bool)

(assert (=> start!17236 (=> (not res!68911) (not e!55883))))

(declare-fun b1!98 () BitStream!3088)

(assert (=> start!17236 (= res!68911 (and (= (size!1763 (buf!2153 b1!98)) (size!1763 (buf!2153 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17236 e!55883))

(declare-fun e!55881 () Bool)

(declare-fun inv!12 (BitStream!3088) Bool)

(assert (=> start!17236 (and (inv!12 b1!98) e!55881)))

(assert (=> start!17236 (and (inv!12 b2!98) e!55885)))

(assert (=> start!17236 true))

(declare-fun b!83839 () Bool)

(assert (=> b!83839 (= e!55881 (array_inv!1609 (buf!2153 b1!98)))))

(declare-fun b!83840 () Bool)

(declare-fun res!68908 () Bool)

(assert (=> b!83840 (=> (not res!68908) (not e!55883))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83840 (= res!68908 (validate_offset_bits!1 ((_ sign_extend 32) (size!1763 (buf!2153 b1!98))) ((_ sign_extend 32) (currentByte!4283 b1!98)) ((_ sign_extend 32) (currentBit!4278 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83841 () Bool)

(declare-fun e!55886 () Bool)

(assert (=> b!83841 (= e!55883 e!55886)))

(declare-fun res!68909 () Bool)

(assert (=> b!83841 (=> (not res!68909) (not e!55886))))

(assert (=> b!83841 (= res!68909 (= lt!133772 lt!133771))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83841 (= lt!133771 (bitIndex!0 (size!1763 (buf!2153 b2!98)) (currentByte!4283 b2!98) (currentBit!4278 b2!98)))))

(declare-fun lt!133766 () (_ BitVec 64))

(assert (=> b!83841 (= lt!133772 (bvadd lt!133766 b1b2Diff!1))))

(assert (=> b!83841 (= lt!133766 (bitIndex!0 (size!1763 (buf!2153 b1!98)) (currentByte!4283 b1!98) (currentBit!4278 b1!98)))))

(declare-fun b!83842 () Bool)

(assert (=> b!83842 (= e!55886 (not e!55887))))

(declare-fun res!68910 () Bool)

(assert (=> b!83842 (=> res!68910 e!55887)))

(declare-fun lt!133773 () (_ BitVec 64))

(assert (=> b!83842 (= res!68910 (bvsgt lt!133766 (bvsub lt!133773 b1ValidateOffsetBits!11)))))

(assert (=> b!83842 (= (remainingBits!0 ((_ sign_extend 32) (size!1763 (buf!2153 b1!98))) ((_ sign_extend 32) (currentByte!4283 b1!98)) ((_ sign_extend 32) (currentBit!4278 b1!98))) (bvsub lt!133773 lt!133766))))

(assert (=> b!83842 (= lt!133773 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1763 (buf!2153 b1!98)))))))

(declare-fun lt!133768 () Unit!5629)

(assert (=> b!83842 (= lt!133768 (remainingBitsBitIndexLemma!0 b1!98))))

(assert (= (and start!17236 res!68911) b!83840))

(assert (= (and b!83840 res!68908) b!83841))

(assert (= (and b!83841 res!68909) b!83842))

(assert (= (and b!83842 (not res!68910)) b!83837))

(assert (= start!17236 b!83839))

(assert (= start!17236 b!83838))

(declare-fun m!130473 () Bool)

(assert (=> b!83841 m!130473))

(declare-fun m!130475 () Bool)

(assert (=> b!83841 m!130475))

(declare-fun m!130477 () Bool)

(assert (=> b!83842 m!130477))

(declare-fun m!130479 () Bool)

(assert (=> b!83842 m!130479))

(declare-fun m!130481 () Bool)

(assert (=> start!17236 m!130481))

(declare-fun m!130483 () Bool)

(assert (=> start!17236 m!130483))

(declare-fun m!130485 () Bool)

(assert (=> b!83838 m!130485))

(declare-fun m!130487 () Bool)

(assert (=> b!83839 m!130487))

(declare-fun m!130489 () Bool)

(assert (=> b!83837 m!130489))

(declare-fun m!130491 () Bool)

(assert (=> b!83837 m!130491))

(declare-fun m!130493 () Bool)

(assert (=> b!83840 m!130493))

(push 1)

(assert (not b!83840))

(assert (not b!83841))

(assert (not b!83837))

(assert (not b!83842))

(assert (not b!83838))

(assert (not start!17236))

(assert (not b!83839))

(check-sat)

(pop 1)

(push 1)

(check-sat)

