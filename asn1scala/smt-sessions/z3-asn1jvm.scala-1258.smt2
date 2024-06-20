; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35744 () Bool)

(assert start!35744)

(declare-fun res!138565 () Bool)

(declare-fun e!115261 () Bool)

(assert (=> start!35744 (=> (not res!138565) (not e!115261))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35744 (= res!138565 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35744 e!115261))

(assert (=> start!35744 true))

(declare-datatypes ((array!8501 0))(
  ( (array!8502 (arr!4709 (Array (_ BitVec 32) (_ BitVec 8))) (size!3788 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6732 0))(
  ( (BitStream!6733 (buf!4240 array!8501) (currentByte!7980 (_ BitVec 32)) (currentBit!7975 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6732)

(declare-fun e!115263 () Bool)

(declare-fun inv!12 (BitStream!6732) Bool)

(assert (=> start!35744 (and (inv!12 thiss!1577) e!115263)))

(declare-fun b!166402 () Bool)

(declare-fun res!138566 () Bool)

(assert (=> b!166402 (=> (not res!138566) (not e!115261))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166402 (= res!138566 (validate_offset_bits!1 ((_ sign_extend 32) (size!3788 (buf!4240 thiss!1577))) ((_ sign_extend 32) (currentByte!7980 thiss!1577)) ((_ sign_extend 32) (currentBit!7975 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166403 () Bool)

(assert (=> b!166403 (= e!115261 (and (bvsgt (bvadd (currentBit!7975 thiss!1577) nBits!511) #b00000000000000000000000000001000) (let ((bdg!10014 (bvsub (bvadd (currentBit!7975 thiss!1577) nBits!511) #b00000000000000000000000000001000))) (and (not (= #b00000000000000000000000000000000 (bvand bdg!10014 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 bdg!10014) #b10000000000000000000000000000000)))))))))

(declare-fun b!166404 () Bool)

(declare-fun array_inv!3529 (array!8501) Bool)

(assert (=> b!166404 (= e!115263 (array_inv!3529 (buf!4240 thiss!1577)))))

(assert (= (and start!35744 res!138565) b!166402))

(assert (= (and b!166402 res!138566) b!166403))

(assert (= start!35744 b!166404))

(declare-fun m!264379 () Bool)

(assert (=> start!35744 m!264379))

(declare-fun m!264381 () Bool)

(assert (=> b!166402 m!264381))

(declare-fun m!264383 () Bool)

(assert (=> b!166404 m!264383))

(check-sat (not start!35744) (not b!166402) (not b!166404))
(check-sat)
