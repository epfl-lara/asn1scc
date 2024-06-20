; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42728 () Bool)

(assert start!42728)

(declare-fun b!201462 () Bool)

(declare-fun res!168670 () Bool)

(declare-fun e!138171 () Bool)

(assert (=> b!201462 (=> (not res!168670) (not e!138171))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!10231 0))(
  ( (array!10232 (arr!5435 (Array (_ BitVec 32) (_ BitVec 8))) (size!4505 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8118 0))(
  ( (BitStream!8119 (buf!5010 array!10231) (currentByte!9414 (_ BitVec 32)) (currentBit!9409 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8118)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201462 (= res!168670 (validate_offset_bits!1 ((_ sign_extend 32) (size!4505 (buf!5010 thiss!1204))) ((_ sign_extend 32) (currentByte!9414 thiss!1204)) ((_ sign_extend 32) (currentBit!9409 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201465 () Bool)

(declare-fun e!138169 () Bool)

(declare-fun array_inv!4246 (array!10231) Bool)

(assert (=> b!201465 (= e!138169 (array_inv!4246 (buf!5010 thiss!1204)))))

(declare-fun b!201464 () Bool)

(assert (=> b!201464 (= e!138171 (and (not (= i!590 nBits!348)) (or (bvslt ((_ sign_extend 32) i!590) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) i!590) #b0000000000000000000000000000000000000000000000000000000001000000))))))

(declare-fun b!201463 () Bool)

(declare-fun res!168669 () Bool)

(assert (=> b!201463 (=> (not res!168669) (not e!138171))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201463 (= res!168669 (invariant!0 (currentBit!9409 thiss!1204) (currentByte!9414 thiss!1204) (size!4505 (buf!5010 thiss!1204))))))

(declare-fun res!168671 () Bool)

(assert (=> start!42728 (=> (not res!168671) (not e!138171))))

(assert (=> start!42728 (= res!168671 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42728 e!138171))

(assert (=> start!42728 true))

(declare-fun inv!12 (BitStream!8118) Bool)

(assert (=> start!42728 (and (inv!12 thiss!1204) e!138169)))

(assert (= (and start!42728 res!168671) b!201462))

(assert (= (and b!201462 res!168670) b!201463))

(assert (= (and b!201463 res!168669) b!201464))

(assert (= start!42728 b!201465))

(declare-fun m!312071 () Bool)

(assert (=> b!201462 m!312071))

(declare-fun m!312073 () Bool)

(assert (=> b!201465 m!312073))

(declare-fun m!312075 () Bool)

(assert (=> b!201463 m!312075))

(declare-fun m!312077 () Bool)

(assert (=> start!42728 m!312077))

(check-sat (not b!201463) (not b!201462) (not start!42728) (not b!201465))
(check-sat)
