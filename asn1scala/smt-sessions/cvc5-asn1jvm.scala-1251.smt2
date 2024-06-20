; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35536 () Bool)

(assert start!35536)

(declare-fun res!138416 () Bool)

(declare-fun e!115064 () Bool)

(assert (=> start!35536 (=> (not res!138416) (not e!115064))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35536 (= res!138416 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35536 e!115064))

(assert (=> start!35536 true))

(declare-datatypes ((array!8439 0))(
  ( (array!8440 (arr!4687 (Array (_ BitVec 32) (_ BitVec 8))) (size!3766 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6688 0))(
  ( (BitStream!6689 (buf!4218 array!8439) (currentByte!7912 (_ BitVec 32)) (currentBit!7907 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6688)

(declare-fun e!115065 () Bool)

(declare-fun inv!12 (BitStream!6688) Bool)

(assert (=> start!35536 (and (inv!12 thiss!1577) e!115065)))

(declare-fun b!166186 () Bool)

(declare-fun res!138415 () Bool)

(assert (=> b!166186 (=> (not res!138415) (not e!115064))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166186 (= res!138415 (validate_offset_bits!1 ((_ sign_extend 32) (size!3766 (buf!4218 thiss!1577))) ((_ sign_extend 32) (currentByte!7912 thiss!1577)) ((_ sign_extend 32) (currentBit!7907 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166187 () Bool)

(assert (=> b!166187 (= e!115064 (and (bvsgt (bvadd (currentBit!7907 thiss!1577) nBits!511) #b00000000000000000000000000001000) (let ((bdg!10011 (bvand (bvadd (currentBit!7907 thiss!1577) nBits!511) #b10000000000000000000000000000000))) (and (not (= bdg!10011 #b00000000000000000000000000000000)) (not (= bdg!10011 (bvand (bvsub (bvadd (currentBit!7907 thiss!1577) nBits!511) #b00000000000000000000000000001000) #b10000000000000000000000000000000)))))))))

(declare-fun b!166188 () Bool)

(declare-fun array_inv!3507 (array!8439) Bool)

(assert (=> b!166188 (= e!115065 (array_inv!3507 (buf!4218 thiss!1577)))))

(assert (= (and start!35536 res!138416) b!166186))

(assert (= (and b!166186 res!138415) b!166187))

(assert (= start!35536 b!166188))

(declare-fun m!264103 () Bool)

(assert (=> start!35536 m!264103))

(declare-fun m!264105 () Bool)

(assert (=> b!166186 m!264105))

(declare-fun m!264107 () Bool)

(assert (=> b!166188 m!264107))

(push 1)

(assert (not b!166188))

(assert (not b!166186))

(assert (not start!35536))

(check-sat)

(pop 1)

(push 1)

(check-sat)

