; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35856 () Bool)

(assert start!35856)

(declare-fun res!138653 () Bool)

(declare-fun e!115379 () Bool)

(assert (=> start!35856 (=> (not res!138653) (not e!115379))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35856 (= res!138653 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35856 e!115379))

(assert (=> start!35856 true))

(declare-datatypes ((array!8536 0))(
  ( (array!8537 (arr!4722 (Array (_ BitVec 32) (_ BitVec 8))) (size!3801 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6758 0))(
  ( (BitStream!6759 (buf!4253 array!8536) (currentByte!8018 (_ BitVec 32)) (currentBit!8013 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6758)

(declare-fun e!115380 () Bool)

(declare-fun inv!12 (BitStream!6758) Bool)

(assert (=> start!35856 (and (inv!12 thiss!1577) e!115380)))

(declare-fun b!166528 () Bool)

(declare-fun res!138652 () Bool)

(assert (=> b!166528 (=> (not res!138652) (not e!115379))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166528 (= res!138652 (validate_offset_bits!1 ((_ sign_extend 32) (size!3801 (buf!4253 thiss!1577))) ((_ sign_extend 32) (currentByte!8018 thiss!1577)) ((_ sign_extend 32) (currentBit!8013 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166529 () Bool)

(assert (=> b!166529 (= e!115379 (and (bvsgt (bvadd (currentBit!8013 thiss!1577) nBits!511) #b00000000000000000000000000001000) (bvsgt (bvsub #b00000000000000000000000000001000 (bvsub (bvadd (currentBit!8013 thiss!1577) nBits!511) #b00000000000000000000000000001000)) #b00000000000000000000000000100000)))))

(declare-fun b!166530 () Bool)

(declare-fun array_inv!3542 (array!8536) Bool)

(assert (=> b!166530 (= e!115380 (array_inv!3542 (buf!4253 thiss!1577)))))

(assert (= (and start!35856 res!138653) b!166528))

(assert (= (and b!166528 res!138652) b!166529))

(assert (= start!35856 b!166530))

(declare-fun m!264547 () Bool)

(assert (=> start!35856 m!264547))

(declare-fun m!264549 () Bool)

(assert (=> b!166528 m!264549))

(declare-fun m!264551 () Bool)

(assert (=> b!166530 m!264551))

(push 1)

(assert (not b!166530))

(assert (not b!166528))

(assert (not start!35856))

(check-sat)

(pop 1)

(push 1)

(check-sat)

