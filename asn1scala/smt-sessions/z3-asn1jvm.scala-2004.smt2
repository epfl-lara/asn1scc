; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51266 () Bool)

(assert start!51266)

(declare-fun res!199833 () Bool)

(declare-fun e!165336 () Bool)

(assert (=> start!51266 (=> (not res!199833) (not e!165336))))

(declare-datatypes ((array!12825 0))(
  ( (array!12826 (arr!6620 (Array (_ BitVec 32) (_ BitVec 8))) (size!5633 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10188 0))(
  ( (BitStream!10189 (buf!6087 array!12825) (currentByte!11284 (_ BitVec 32)) (currentBit!11279 (_ BitVec 32))) )
))
(declare-fun thiss!1857 () BitStream!10188)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51266 (= res!199833 (validate_offset_byte!0 ((_ sign_extend 32) (size!5633 (buf!6087 thiss!1857))) ((_ sign_extend 32) (currentByte!11284 thiss!1857)) ((_ sign_extend 32) (currentBit!11279 thiss!1857))))))

(assert (=> start!51266 e!165336))

(declare-fun e!165337 () Bool)

(declare-fun inv!12 (BitStream!10188) Bool)

(assert (=> start!51266 (and (inv!12 thiss!1857) e!165337)))

(declare-fun b!239140 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!239140 (= e!165336 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5633 (buf!6087 thiss!1857))) ((_ sign_extend 32) (currentByte!11284 thiss!1857)) ((_ sign_extend 32) (currentBit!11279 thiss!1857)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!239141 () Bool)

(declare-fun array_inv!5374 (array!12825) Bool)

(assert (=> b!239141 (= e!165337 (array_inv!5374 (buf!6087 thiss!1857)))))

(assert (= (and start!51266 res!199833) b!239140))

(assert (= start!51266 b!239141))

(declare-fun m!361175 () Bool)

(assert (=> start!51266 m!361175))

(declare-fun m!361177 () Bool)

(assert (=> start!51266 m!361177))

(declare-fun m!361179 () Bool)

(assert (=> b!239140 m!361179))

(declare-fun m!361181 () Bool)

(assert (=> b!239141 m!361181))

(check-sat (not b!239141) (not b!239140) (not start!51266))
(check-sat)
(get-model)

(declare-fun d!80460 () Bool)

(assert (=> d!80460 (= (array_inv!5374 (buf!6087 thiss!1857)) (bvsge (size!5633 (buf!6087 thiss!1857)) #b00000000000000000000000000000000))))

(assert (=> b!239141 d!80460))

(declare-fun d!80462 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

