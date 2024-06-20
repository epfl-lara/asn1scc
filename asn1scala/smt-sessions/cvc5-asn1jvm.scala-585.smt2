; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16812 () Bool)

(assert start!16812)

(declare-fun b!82747 () Bool)

(declare-fun e!54774 () Bool)

(declare-datatypes ((array!3752 0))(
  ( (array!3753 (arr!2349 (Array (_ BitVec 32) (_ BitVec 8))) (size!1712 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2986 0))(
  ( (BitStream!2987 (buf!2102 array!3752) (currentByte!4150 (_ BitVec 32)) (currentBit!4145 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2986)

(declare-fun array_inv!1558 (array!3752) Bool)

(assert (=> b!82747 (= e!54774 (array_inv!1558 (buf!2102 b2!98)))))

(declare-fun b!82748 () Bool)

(declare-fun res!68151 () Bool)

(declare-fun e!54773 () Bool)

(assert (=> b!82748 (=> (not res!68151) (not e!54773))))

(declare-fun b1!98 () BitStream!2986)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82748 (= res!68151 (validate_offset_bits!1 ((_ sign_extend 32) (size!1712 (buf!2102 b1!98))) ((_ sign_extend 32) (currentByte!4150 b1!98)) ((_ sign_extend 32) (currentBit!4145 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun res!68152 () Bool)

(assert (=> start!16812 (=> (not res!68152) (not e!54773))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> start!16812 (= res!68152 (and (= (size!1712 (buf!2102 b1!98)) (size!1712 (buf!2102 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16812 e!54773))

(declare-fun e!54772 () Bool)

(declare-fun inv!12 (BitStream!2986) Bool)

(assert (=> start!16812 (and (inv!12 b1!98) e!54772)))

(assert (=> start!16812 (and (inv!12 b2!98) e!54774)))

(assert (=> start!16812 true))

(declare-fun b!82749 () Bool)

(declare-fun e!54770 () Bool)

(declare-fun e!54768 () Bool)

(assert (=> b!82749 (= e!54770 (not e!54768))))

(declare-fun res!68149 () Bool)

(assert (=> b!82749 (=> res!68149 e!54768)))

(declare-fun lt!131844 () (_ BitVec 64))

(declare-fun lt!131843 () (_ BitVec 64))

(assert (=> b!82749 (= res!68149 (bvsgt lt!131844 (bvsub lt!131843 b1ValidateOffsetBits!11)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82749 (= (remainingBits!0 ((_ sign_extend 32) (size!1712 (buf!2102 b1!98))) ((_ sign_extend 32) (currentByte!4150 b1!98)) ((_ sign_extend 32) (currentBit!4145 b1!98))) (bvsub lt!131843 lt!131844))))

(assert (=> b!82749 (= lt!131843 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1712 (buf!2102 b1!98)))))))

(declare-datatypes ((Unit!5533 0))(
  ( (Unit!5534) )
))
(declare-fun lt!131842 () Unit!5533)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2986) Unit!5533)

(assert (=> b!82749 (= lt!131842 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun lt!131841 () (_ BitVec 64))

(declare-fun b!82750 () Bool)

(declare-fun lt!131840 () (_ BitVec 64))

(declare-fun lt!131837 () (_ BitVec 64))

(assert (=> b!82750 (= e!54768 (or (not (= lt!131841 (bvsub lt!131837 lt!131840))) (bvslt lt!131841 (bvsub b1ValidateOffsetBits!11 b1b2Diff!1)) (and (bvsle ((_ sign_extend 32) (size!1712 (buf!2102 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4150 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4145 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111))))))

(declare-fun lt!131838 () (_ BitVec 64))

(assert (=> b!82750 (= lt!131841 (bvsub lt!131837 lt!131838))))

(assert (=> b!82750 (= lt!131841 (remainingBits!0 ((_ sign_extend 32) (size!1712 (buf!2102 b2!98))) ((_ sign_extend 32) (currentByte!4150 b2!98)) ((_ sign_extend 32) (currentBit!4145 b2!98))))))

(assert (=> b!82750 (= lt!131837 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1712 (buf!2102 b2!98)))))))

(declare-fun lt!131839 () Unit!5533)

(assert (=> b!82750 (= lt!131839 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!82751 () Bool)

(assert (=> b!82751 (= e!54773 e!54770)))

(declare-fun res!68150 () Bool)

(assert (=> b!82751 (=> (not res!68150) (not e!54770))))

(assert (=> b!82751 (= res!68150 (= lt!131840 lt!131838))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82751 (= lt!131838 (bitIndex!0 (size!1712 (buf!2102 b2!98)) (currentByte!4150 b2!98) (currentBit!4145 b2!98)))))

(assert (=> b!82751 (= lt!131840 (bvadd lt!131844 b1b2Diff!1))))

(assert (=> b!82751 (= lt!131844 (bitIndex!0 (size!1712 (buf!2102 b1!98)) (currentByte!4150 b1!98) (currentBit!4145 b1!98)))))

(declare-fun b!82752 () Bool)

(assert (=> b!82752 (= e!54772 (array_inv!1558 (buf!2102 b1!98)))))

(assert (= (and start!16812 res!68152) b!82748))

(assert (= (and b!82748 res!68151) b!82751))

(assert (= (and b!82751 res!68150) b!82749))

(assert (= (and b!82749 (not res!68149)) b!82750))

(assert (= start!16812 b!82752))

(assert (= start!16812 b!82747))

(declare-fun m!129237 () Bool)

(assert (=> b!82749 m!129237))

(declare-fun m!129239 () Bool)

(assert (=> b!82749 m!129239))

(declare-fun m!129241 () Bool)

(assert (=> b!82751 m!129241))

(declare-fun m!129243 () Bool)

(assert (=> b!82751 m!129243))

(declare-fun m!129245 () Bool)

(assert (=> b!82747 m!129245))

(declare-fun m!129247 () Bool)

(assert (=> b!82748 m!129247))

(declare-fun m!129249 () Bool)

(assert (=> start!16812 m!129249))

(declare-fun m!129251 () Bool)

(assert (=> start!16812 m!129251))

(declare-fun m!129253 () Bool)

(assert (=> b!82752 m!129253))

(declare-fun m!129255 () Bool)

(assert (=> b!82750 m!129255))

(declare-fun m!129257 () Bool)

(assert (=> b!82750 m!129257))

(push 1)

(assert (not b!82752))

(assert (not b!82749))

(assert (not start!16812))

(assert (not b!82747))

(assert (not b!82750))

(assert (not b!82748))

(assert (not b!82751))

(check-sat)

(pop 1)

(push 1)

(check-sat)

