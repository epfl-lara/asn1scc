; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17240 () Bool)

(assert start!17240)

(declare-fun b!83873 () Bool)

(declare-fun lt!133816 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun e!55923 () Bool)

(declare-fun lt!133815 () (_ BitVec 64))

(declare-fun lt!133814 () (_ BitVec 64))

(assert (=> b!83873 (= e!55923 (or (not (= lt!133815 (bvsub lt!133816 lt!133814))) (bvslt lt!133815 (bvsub b1ValidateOffsetBits!11 b1b2Diff!1)) (= (bvand b1ValidateOffsetBits!11 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand b1b2Diff!1 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand b1ValidateOffsetBits!11 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub b1ValidateOffsetBits!11 b1b2Diff!1) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!133820 () (_ BitVec 64))

(assert (=> b!83873 (= lt!133815 (bvsub lt!133816 lt!133820))))

(declare-datatypes ((array!3885 0))(
  ( (array!3886 (arr!2402 (Array (_ BitVec 32) (_ BitVec 8))) (size!1765 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3092 0))(
  ( (BitStream!3093 (buf!2155 array!3885) (currentByte!4285 (_ BitVec 32)) (currentBit!4280 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3092)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83873 (= lt!133815 (remainingBits!0 ((_ sign_extend 32) (size!1765 (buf!2155 b2!98))) ((_ sign_extend 32) (currentByte!4285 b2!98)) ((_ sign_extend 32) (currentBit!4280 b2!98))))))

(assert (=> b!83873 (= lt!133816 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1765 (buf!2155 b2!98)))))))

(declare-datatypes ((Unit!5633 0))(
  ( (Unit!5634) )
))
(declare-fun lt!133818 () Unit!5633)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3092) Unit!5633)

(assert (=> b!83873 (= lt!133818 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun res!68933 () Bool)

(declare-fun e!55924 () Bool)

(assert (=> start!17240 (=> (not res!68933) (not e!55924))))

(declare-fun b1!98 () BitStream!3092)

(assert (=> start!17240 (= res!68933 (and (= (size!1765 (buf!2155 b1!98)) (size!1765 (buf!2155 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17240 e!55924))

(declare-fun e!55925 () Bool)

(declare-fun inv!12 (BitStream!3092) Bool)

(assert (=> start!17240 (and (inv!12 b1!98) e!55925)))

(declare-fun e!55928 () Bool)

(assert (=> start!17240 (and (inv!12 b2!98) e!55928)))

(assert (=> start!17240 true))

(declare-fun b!83874 () Bool)

(declare-fun array_inv!1611 (array!3885) Bool)

(assert (=> b!83874 (= e!55928 (array_inv!1611 (buf!2155 b2!98)))))

(declare-fun b!83875 () Bool)

(assert (=> b!83875 (= e!55925 (array_inv!1611 (buf!2155 b1!98)))))

(declare-fun b!83876 () Bool)

(declare-fun e!55927 () Bool)

(assert (=> b!83876 (= e!55927 (not e!55923))))

(declare-fun res!68935 () Bool)

(assert (=> b!83876 (=> res!68935 e!55923)))

(declare-fun lt!133821 () (_ BitVec 64))

(declare-fun lt!133819 () (_ BitVec 64))

(assert (=> b!83876 (= res!68935 (bvsgt lt!133819 (bvsub lt!133821 b1ValidateOffsetBits!11)))))

(assert (=> b!83876 (= (remainingBits!0 ((_ sign_extend 32) (size!1765 (buf!2155 b1!98))) ((_ sign_extend 32) (currentByte!4285 b1!98)) ((_ sign_extend 32) (currentBit!4280 b1!98))) (bvsub lt!133821 lt!133819))))

(assert (=> b!83876 (= lt!133821 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1765 (buf!2155 b1!98)))))))

(declare-fun lt!133817 () Unit!5633)

(assert (=> b!83876 (= lt!133817 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83877 () Bool)

(declare-fun res!68934 () Bool)

(assert (=> b!83877 (=> (not res!68934) (not e!55924))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83877 (= res!68934 (validate_offset_bits!1 ((_ sign_extend 32) (size!1765 (buf!2155 b1!98))) ((_ sign_extend 32) (currentByte!4285 b1!98)) ((_ sign_extend 32) (currentBit!4280 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83878 () Bool)

(assert (=> b!83878 (= e!55924 e!55927)))

(declare-fun res!68932 () Bool)

(assert (=> b!83878 (=> (not res!68932) (not e!55927))))

(assert (=> b!83878 (= res!68932 (= lt!133814 lt!133820))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83878 (= lt!133820 (bitIndex!0 (size!1765 (buf!2155 b2!98)) (currentByte!4285 b2!98) (currentBit!4280 b2!98)))))

(assert (=> b!83878 (= lt!133814 (bvadd lt!133819 b1b2Diff!1))))

(assert (=> b!83878 (= lt!133819 (bitIndex!0 (size!1765 (buf!2155 b1!98)) (currentByte!4285 b1!98) (currentBit!4280 b1!98)))))

(assert (= (and start!17240 res!68933) b!83877))

(assert (= (and b!83877 res!68934) b!83878))

(assert (= (and b!83878 res!68932) b!83876))

(assert (= (and b!83876 (not res!68935)) b!83873))

(assert (= start!17240 b!83875))

(assert (= start!17240 b!83874))

(declare-fun m!130517 () Bool)

(assert (=> b!83874 m!130517))

(declare-fun m!130519 () Bool)

(assert (=> b!83876 m!130519))

(declare-fun m!130521 () Bool)

(assert (=> b!83876 m!130521))

(declare-fun m!130523 () Bool)

(assert (=> b!83873 m!130523))

(declare-fun m!130525 () Bool)

(assert (=> b!83873 m!130525))

(declare-fun m!130527 () Bool)

(assert (=> b!83877 m!130527))

(declare-fun m!130529 () Bool)

(assert (=> b!83875 m!130529))

(declare-fun m!130531 () Bool)

(assert (=> b!83878 m!130531))

(declare-fun m!130533 () Bool)

(assert (=> b!83878 m!130533))

(declare-fun m!130535 () Bool)

(assert (=> start!17240 m!130535))

(declare-fun m!130537 () Bool)

(assert (=> start!17240 m!130537))

(push 1)

(assert (not b!83878))

(assert (not b!83877))

(assert (not b!83873))

(assert (not b!83876))

(assert (not b!83875))

(assert (not b!83874))

(assert (not start!17240))

(check-sat)

(pop 1)

(push 1)

(check-sat)

