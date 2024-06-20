; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35540 () Bool)

(assert start!35540)

(declare-fun res!138427 () Bool)

(declare-fun e!115082 () Bool)

(assert (=> start!35540 (=> (not res!138427) (not e!115082))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35540 (= res!138427 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35540 e!115082))

(assert (=> start!35540 true))

(declare-datatypes ((array!8443 0))(
  ( (array!8444 (arr!4689 (Array (_ BitVec 32) (_ BitVec 8))) (size!3768 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6692 0))(
  ( (BitStream!6693 (buf!4220 array!8443) (currentByte!7914 (_ BitVec 32)) (currentBit!7909 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6692)

(declare-fun e!115083 () Bool)

(declare-fun inv!12 (BitStream!6692) Bool)

(assert (=> start!35540 (and (inv!12 thiss!1577) e!115083)))

(declare-fun b!166204 () Bool)

(declare-fun res!138428 () Bool)

(assert (=> b!166204 (=> (not res!138428) (not e!115082))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166204 (= res!138428 (validate_offset_bits!1 ((_ sign_extend 32) (size!3768 (buf!4220 thiss!1577))) ((_ sign_extend 32) (currentByte!7914 thiss!1577)) ((_ sign_extend 32) (currentBit!7909 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166205 () Bool)

(assert (=> b!166205 (= e!115082 (and (bvsgt (bvadd (currentBit!7909 thiss!1577) nBits!511) #b00000000000000000000000000001000) (let ((bdg!10011 (bvand (bvadd (currentBit!7909 thiss!1577) nBits!511) #b10000000000000000000000000000000))) (and (not (= bdg!10011 #b00000000000000000000000000000000)) (not (= bdg!10011 (bvand (bvsub (bvadd (currentBit!7909 thiss!1577) nBits!511) #b00000000000000000000000000001000) #b10000000000000000000000000000000)))))))))

(declare-fun b!166206 () Bool)

(declare-fun array_inv!3509 (array!8443) Bool)

(assert (=> b!166206 (= e!115083 (array_inv!3509 (buf!4220 thiss!1577)))))

(assert (= (and start!35540 res!138427) b!166204))

(assert (= (and b!166204 res!138428) b!166205))

(assert (= start!35540 b!166206))

(declare-fun m!264115 () Bool)

(assert (=> start!35540 m!264115))

(declare-fun m!264117 () Bool)

(assert (=> b!166204 m!264117))

(declare-fun m!264119 () Bool)

(assert (=> b!166206 m!264119))

(push 1)

(assert (not b!166206))

