; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17140 () Bool)

(assert start!17140)

(declare-fun b!83567 () Bool)

(declare-fun e!55608 () Bool)

(declare-fun e!55607 () Bool)

(assert (=> b!83567 (= e!55608 e!55607)))

(declare-fun res!68719 () Bool)

(assert (=> b!83567 (=> (not res!68719) (not e!55607))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun lt!133240 () (_ BitVec 64))

(declare-fun lt!133241 () (_ BitVec 64))

(assert (=> b!83567 (= res!68719 (= (bvadd lt!133241 b1b2Diff!1) lt!133240))))

(declare-datatypes ((array!3851 0))(
  ( (array!3852 (arr!2388 (Array (_ BitVec 32) (_ BitVec 8))) (size!1751 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3064 0))(
  ( (BitStream!3065 (buf!2141 array!3851) (currentByte!4253 (_ BitVec 32)) (currentBit!4248 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3064)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83567 (= lt!133240 (bitIndex!0 (size!1751 (buf!2141 b2!98)) (currentByte!4253 b2!98) (currentBit!4248 b2!98)))))

(declare-fun b1!98 () BitStream!3064)

(assert (=> b!83567 (= lt!133241 (bitIndex!0 (size!1751 (buf!2141 b1!98)) (currentByte!4253 b1!98) (currentBit!4248 b1!98)))))

(declare-fun b!83568 () Bool)

(declare-fun e!55609 () Bool)

(assert (=> b!83568 (= e!55607 (not e!55609))))

(declare-fun res!68717 () Bool)

(assert (=> b!83568 (=> res!68717 e!55609)))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun lt!133242 () (_ BitVec 64))

(assert (=> b!83568 (= res!68717 (bvsgt lt!133241 (bvsub lt!133242 b1ValidateOffsetBits!11)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83568 (= (remainingBits!0 ((_ sign_extend 32) (size!1751 (buf!2141 b1!98))) ((_ sign_extend 32) (currentByte!4253 b1!98)) ((_ sign_extend 32) (currentBit!4248 b1!98))) (bvsub lt!133242 lt!133241))))

(assert (=> b!83568 (= lt!133242 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1751 (buf!2141 b1!98)))))))

(declare-datatypes ((Unit!5605 0))(
  ( (Unit!5606) )
))
(declare-fun lt!133239 () Unit!5605)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3064) Unit!5605)

(assert (=> b!83568 (= lt!133239 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83569 () Bool)

(declare-fun e!55611 () Bool)

(declare-fun array_inv!1597 (array!3851) Bool)

(assert (=> b!83569 (= e!55611 (array_inv!1597 (buf!2141 b2!98)))))

(declare-fun b!83571 () Bool)

(declare-fun e!55606 () Bool)

(assert (=> b!83571 (= e!55606 (array_inv!1597 (buf!2141 b1!98)))))

(declare-fun b!83572 () Bool)

(declare-fun res!68716 () Bool)

(assert (=> b!83572 (=> (not res!68716) (not e!55608))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83572 (= res!68716 (validate_offset_bits!1 ((_ sign_extend 32) (size!1751 (buf!2141 b1!98))) ((_ sign_extend 32) (currentByte!4253 b1!98)) ((_ sign_extend 32) (currentBit!4248 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun res!68718 () Bool)

(assert (=> start!17140 (=> (not res!68718) (not e!55608))))

(assert (=> start!17140 (= res!68718 (and (= (size!1751 (buf!2141 b1!98)) (size!1751 (buf!2141 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17140 e!55608))

(declare-fun inv!12 (BitStream!3064) Bool)

(assert (=> start!17140 (and (inv!12 b1!98) e!55606)))

(assert (=> start!17140 (and (inv!12 b2!98) e!55611)))

(assert (=> start!17140 true))

(declare-fun b!83570 () Bool)

(declare-fun lt!133237 () (_ BitVec 64))

(assert (=> b!83570 (= e!55609 (or (= ((_ sign_extend 32) (size!1751 (buf!2141 b2!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!133237 ((_ sign_extend 32) (size!1751 (buf!2141 b2!98)))))))))

(assert (=> b!83570 (= (remainingBits!0 ((_ sign_extend 32) (size!1751 (buf!2141 b2!98))) ((_ sign_extend 32) (currentByte!4253 b2!98)) ((_ sign_extend 32) (currentBit!4248 b2!98))) (bvsub lt!133237 lt!133240))))

(assert (=> b!83570 (= lt!133237 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1751 (buf!2141 b2!98)))))))

(declare-fun lt!133238 () Unit!5605)

(assert (=> b!83570 (= lt!133238 (remainingBitsBitIndexLemma!0 b2!98))))

(assert (= (and start!17140 res!68718) b!83572))

(assert (= (and b!83572 res!68716) b!83567))

(assert (= (and b!83567 res!68719) b!83568))

(assert (= (and b!83568 (not res!68717)) b!83570))

(assert (= start!17140 b!83571))

(assert (= start!17140 b!83569))

(declare-fun m!130161 () Bool)

(assert (=> b!83572 m!130161))

(declare-fun m!130163 () Bool)

(assert (=> start!17140 m!130163))

(declare-fun m!130165 () Bool)

(assert (=> start!17140 m!130165))

(declare-fun m!130167 () Bool)

(assert (=> b!83570 m!130167))

(declare-fun m!130169 () Bool)

(assert (=> b!83570 m!130169))

(declare-fun m!130171 () Bool)

(assert (=> b!83568 m!130171))

(declare-fun m!130173 () Bool)

(assert (=> b!83568 m!130173))

(declare-fun m!130175 () Bool)

(assert (=> b!83567 m!130175))

(declare-fun m!130177 () Bool)

(assert (=> b!83567 m!130177))

(declare-fun m!130179 () Bool)

(assert (=> b!83569 m!130179))

(declare-fun m!130181 () Bool)

(assert (=> b!83571 m!130181))

(push 1)

(assert (not b!83571))

(assert (not b!83569))

(assert (not b!83568))

(assert (not b!83572))

(assert (not b!83567))

(assert (not start!17140))

(assert (not b!83570))

(check-sat)

(pop 1)

(push 1)

(check-sat)

