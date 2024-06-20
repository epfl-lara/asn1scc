; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17238 () Bool)

(assert start!17238)

(declare-fun b!83855 () Bool)

(declare-fun res!68923 () Bool)

(declare-fun e!55904 () Bool)

(assert (=> b!83855 (=> (not res!68923) (not e!55904))))

(declare-datatypes ((array!3883 0))(
  ( (array!3884 (arr!2401 (Array (_ BitVec 32) (_ BitVec 8))) (size!1764 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3090 0))(
  ( (BitStream!3091 (buf!2154 array!3883) (currentByte!4284 (_ BitVec 32)) (currentBit!4279 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3090)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83855 (= res!68923 (validate_offset_bits!1 ((_ sign_extend 32) (size!1764 (buf!2154 b1!98))) ((_ sign_extend 32) (currentByte!4284 b1!98)) ((_ sign_extend 32) (currentBit!4279 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun lt!133797 () (_ BitVec 64))

(declare-fun lt!133791 () (_ BitVec 64))

(declare-fun e!55907 () Bool)

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b!83856 () Bool)

(declare-fun lt!133796 () (_ BitVec 64))

(assert (=> b!83856 (= e!55907 (or (not (= lt!133796 (bvsub lt!133797 lt!133791))) (bvslt lt!133796 (bvsub b1ValidateOffsetBits!11 b1b2Diff!1)) (= (bvand b1ValidateOffsetBits!11 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand b1b2Diff!1 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand b1ValidateOffsetBits!11 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub b1ValidateOffsetBits!11 b1b2Diff!1) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!133795 () (_ BitVec 64))

(assert (=> b!83856 (= lt!133796 (bvsub lt!133797 lt!133795))))

(declare-fun b2!98 () BitStream!3090)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83856 (= lt!133796 (remainingBits!0 ((_ sign_extend 32) (size!1764 (buf!2154 b2!98))) ((_ sign_extend 32) (currentByte!4284 b2!98)) ((_ sign_extend 32) (currentBit!4279 b2!98))))))

(assert (=> b!83856 (= lt!133797 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1764 (buf!2154 b2!98)))))))

(declare-datatypes ((Unit!5631 0))(
  ( (Unit!5632) )
))
(declare-fun lt!133790 () Unit!5631)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3090) Unit!5631)

(assert (=> b!83856 (= lt!133790 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!83857 () Bool)

(declare-fun e!55902 () Bool)

(assert (=> b!83857 (= e!55902 (not e!55907))))

(declare-fun res!68922 () Bool)

(assert (=> b!83857 (=> res!68922 e!55907)))

(declare-fun lt!133792 () (_ BitVec 64))

(declare-fun lt!133794 () (_ BitVec 64))

(assert (=> b!83857 (= res!68922 (bvsgt lt!133792 (bvsub lt!133794 b1ValidateOffsetBits!11)))))

(assert (=> b!83857 (= (remainingBits!0 ((_ sign_extend 32) (size!1764 (buf!2154 b1!98))) ((_ sign_extend 32) (currentByte!4284 b1!98)) ((_ sign_extend 32) (currentBit!4279 b1!98))) (bvsub lt!133794 lt!133792))))

(assert (=> b!83857 (= lt!133794 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1764 (buf!2154 b1!98)))))))

(declare-fun lt!133793 () Unit!5631)

(assert (=> b!83857 (= lt!133793 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83858 () Bool)

(declare-fun e!55903 () Bool)

(declare-fun array_inv!1610 (array!3883) Bool)

(assert (=> b!83858 (= e!55903 (array_inv!1610 (buf!2154 b1!98)))))

(declare-fun b!83859 () Bool)

(declare-fun e!55908 () Bool)

(assert (=> b!83859 (= e!55908 (array_inv!1610 (buf!2154 b2!98)))))

(declare-fun b!83860 () Bool)

(assert (=> b!83860 (= e!55904 e!55902)))

(declare-fun res!68920 () Bool)

(assert (=> b!83860 (=> (not res!68920) (not e!55902))))

(assert (=> b!83860 (= res!68920 (= lt!133791 lt!133795))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83860 (= lt!133795 (bitIndex!0 (size!1764 (buf!2154 b2!98)) (currentByte!4284 b2!98) (currentBit!4279 b2!98)))))

(assert (=> b!83860 (= lt!133791 (bvadd lt!133792 b1b2Diff!1))))

(assert (=> b!83860 (= lt!133792 (bitIndex!0 (size!1764 (buf!2154 b1!98)) (currentByte!4284 b1!98) (currentBit!4279 b1!98)))))

(declare-fun res!68921 () Bool)

(assert (=> start!17238 (=> (not res!68921) (not e!55904))))

(assert (=> start!17238 (= res!68921 (and (= (size!1764 (buf!2154 b1!98)) (size!1764 (buf!2154 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17238 e!55904))

(declare-fun inv!12 (BitStream!3090) Bool)

(assert (=> start!17238 (and (inv!12 b1!98) e!55903)))

(assert (=> start!17238 (and (inv!12 b2!98) e!55908)))

(assert (=> start!17238 true))

(assert (= (and start!17238 res!68921) b!83855))

(assert (= (and b!83855 res!68923) b!83860))

(assert (= (and b!83860 res!68920) b!83857))

(assert (= (and b!83857 (not res!68922)) b!83856))

(assert (= start!17238 b!83858))

(assert (= start!17238 b!83859))

(declare-fun m!130495 () Bool)

(assert (=> start!17238 m!130495))

(declare-fun m!130497 () Bool)

(assert (=> start!17238 m!130497))

(declare-fun m!130499 () Bool)

(assert (=> b!83857 m!130499))

(declare-fun m!130501 () Bool)

(assert (=> b!83857 m!130501))

(declare-fun m!130503 () Bool)

(assert (=> b!83860 m!130503))

(declare-fun m!130505 () Bool)

(assert (=> b!83860 m!130505))

(declare-fun m!130507 () Bool)

(assert (=> b!83858 m!130507))

(declare-fun m!130509 () Bool)

(assert (=> b!83855 m!130509))

(declare-fun m!130511 () Bool)

(assert (=> b!83859 m!130511))

(declare-fun m!130513 () Bool)

(assert (=> b!83856 m!130513))

(declare-fun m!130515 () Bool)

(assert (=> b!83856 m!130515))

(check-sat (not b!83858) (not start!17238) (not b!83855) (not b!83860) (not b!83857) (not b!83859) (not b!83856))
(check-sat)
