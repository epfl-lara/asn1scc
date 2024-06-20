; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35746 () Bool)

(assert start!35746)

(declare-fun res!138571 () Bool)

(declare-fun e!115271 () Bool)

(assert (=> start!35746 (=> (not res!138571) (not e!115271))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35746 (= res!138571 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35746 e!115271))

(assert (=> start!35746 true))

(declare-datatypes ((array!8503 0))(
  ( (array!8504 (arr!4710 (Array (_ BitVec 32) (_ BitVec 8))) (size!3789 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6734 0))(
  ( (BitStream!6735 (buf!4241 array!8503) (currentByte!7981 (_ BitVec 32)) (currentBit!7976 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6734)

(declare-fun e!115272 () Bool)

(declare-fun inv!12 (BitStream!6734) Bool)

(assert (=> start!35746 (and (inv!12 thiss!1577) e!115272)))

(declare-fun b!166411 () Bool)

(declare-fun res!138572 () Bool)

(assert (=> b!166411 (=> (not res!138572) (not e!115271))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166411 (= res!138572 (validate_offset_bits!1 ((_ sign_extend 32) (size!3789 (buf!4241 thiss!1577))) ((_ sign_extend 32) (currentByte!7981 thiss!1577)) ((_ sign_extend 32) (currentBit!7976 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166412 () Bool)

(assert (=> b!166412 (= e!115271 (and (bvsgt (bvadd (currentBit!7976 thiss!1577) nBits!511) #b00000000000000000000000000001000) (let ((bdg!10014 (bvsub (bvadd (currentBit!7976 thiss!1577) nBits!511) #b00000000000000000000000000001000))) (and (not (= #b00000000000000000000000000000000 (bvand bdg!10014 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 bdg!10014) #b10000000000000000000000000000000)))))))))

(declare-fun b!166413 () Bool)

(declare-fun array_inv!3530 (array!8503) Bool)

(assert (=> b!166413 (= e!115272 (array_inv!3530 (buf!4241 thiss!1577)))))

(assert (= (and start!35746 res!138571) b!166411))

(assert (= (and b!166411 res!138572) b!166412))

(assert (= start!35746 b!166413))

(declare-fun m!264385 () Bool)

(assert (=> start!35746 m!264385))

(declare-fun m!264387 () Bool)

(assert (=> b!166411 m!264387))

(declare-fun m!264389 () Bool)

(assert (=> b!166413 m!264389))

(push 1)

(assert (not start!35746))

(assert (not b!166411))

(assert (not b!166413))

(check-sat)

(pop 1)

(push 1)

(check-sat)

