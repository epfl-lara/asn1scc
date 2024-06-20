; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35538 () Bool)

(assert start!35538)

(declare-fun res!138421 () Bool)

(declare-fun e!115072 () Bool)

(assert (=> start!35538 (=> (not res!138421) (not e!115072))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35538 (= res!138421 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35538 e!115072))

(assert (=> start!35538 true))

(declare-datatypes ((array!8441 0))(
  ( (array!8442 (arr!4688 (Array (_ BitVec 32) (_ BitVec 8))) (size!3767 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6690 0))(
  ( (BitStream!6691 (buf!4219 array!8441) (currentByte!7913 (_ BitVec 32)) (currentBit!7908 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6690)

(declare-fun e!115074 () Bool)

(declare-fun inv!12 (BitStream!6690) Bool)

(assert (=> start!35538 (and (inv!12 thiss!1577) e!115074)))

(declare-fun b!166195 () Bool)

(declare-fun res!138422 () Bool)

(assert (=> b!166195 (=> (not res!138422) (not e!115072))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166195 (= res!138422 (validate_offset_bits!1 ((_ sign_extend 32) (size!3767 (buf!4219 thiss!1577))) ((_ sign_extend 32) (currentByte!7913 thiss!1577)) ((_ sign_extend 32) (currentBit!7908 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166196 () Bool)

(assert (=> b!166196 (= e!115072 (and (bvsgt (bvadd (currentBit!7908 thiss!1577) nBits!511) #b00000000000000000000000000001000) (let ((bdg!10011 (bvand (bvadd (currentBit!7908 thiss!1577) nBits!511) #b10000000000000000000000000000000))) (and (not (= bdg!10011 #b00000000000000000000000000000000)) (not (= bdg!10011 (bvand (bvsub (bvadd (currentBit!7908 thiss!1577) nBits!511) #b00000000000000000000000000001000) #b10000000000000000000000000000000)))))))))

(declare-fun b!166197 () Bool)

(declare-fun array_inv!3508 (array!8441) Bool)

(assert (=> b!166197 (= e!115074 (array_inv!3508 (buf!4219 thiss!1577)))))

(assert (= (and start!35538 res!138421) b!166195))

(assert (= (and b!166195 res!138422) b!166196))

(assert (= start!35538 b!166197))

(declare-fun m!264109 () Bool)

(assert (=> start!35538 m!264109))

(declare-fun m!264111 () Bool)

(assert (=> b!166195 m!264111))

(declare-fun m!264113 () Bool)

(assert (=> b!166197 m!264113))

(check-sat (not b!166197) (not start!35538) (not b!166195))
(check-sat)
