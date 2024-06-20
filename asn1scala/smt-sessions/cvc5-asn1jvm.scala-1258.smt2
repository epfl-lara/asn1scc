; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35742 () Bool)

(assert start!35742)

(declare-fun res!138560 () Bool)

(declare-fun e!115253 () Bool)

(assert (=> start!35742 (=> (not res!138560) (not e!115253))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35742 (= res!138560 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35742 e!115253))

(assert (=> start!35742 true))

(declare-datatypes ((array!8499 0))(
  ( (array!8500 (arr!4708 (Array (_ BitVec 32) (_ BitVec 8))) (size!3787 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6730 0))(
  ( (BitStream!6731 (buf!4239 array!8499) (currentByte!7979 (_ BitVec 32)) (currentBit!7974 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6730)

(declare-fun e!115252 () Bool)

(declare-fun inv!12 (BitStream!6730) Bool)

(assert (=> start!35742 (and (inv!12 thiss!1577) e!115252)))

(declare-fun b!166393 () Bool)

(declare-fun res!138559 () Bool)

(assert (=> b!166393 (=> (not res!138559) (not e!115253))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166393 (= res!138559 (validate_offset_bits!1 ((_ sign_extend 32) (size!3787 (buf!4239 thiss!1577))) ((_ sign_extend 32) (currentByte!7979 thiss!1577)) ((_ sign_extend 32) (currentBit!7974 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166394 () Bool)

(assert (=> b!166394 (= e!115253 (and (bvsgt (bvadd (currentBit!7974 thiss!1577) nBits!511) #b00000000000000000000000000001000) (let ((bdg!10014 (bvsub (bvadd (currentBit!7974 thiss!1577) nBits!511) #b00000000000000000000000000001000))) (and (not (= #b00000000000000000000000000000000 (bvand bdg!10014 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 bdg!10014) #b10000000000000000000000000000000)))))))))

(declare-fun b!166395 () Bool)

(declare-fun array_inv!3528 (array!8499) Bool)

(assert (=> b!166395 (= e!115252 (array_inv!3528 (buf!4239 thiss!1577)))))

(assert (= (and start!35742 res!138560) b!166393))

(assert (= (and b!166393 res!138559) b!166394))

(assert (= start!35742 b!166395))

(declare-fun m!264373 () Bool)

(assert (=> start!35742 m!264373))

(declare-fun m!264375 () Bool)

(assert (=> b!166393 m!264375))

(declare-fun m!264377 () Bool)

(assert (=> b!166395 m!264377))

(push 1)

(assert (not start!35742))

(assert (not b!166393))

(assert (not b!166395))

(check-sat)

(pop 1)

(push 1)

(check-sat)

