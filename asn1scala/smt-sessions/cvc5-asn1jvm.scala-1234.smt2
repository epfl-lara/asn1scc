; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35000 () Bool)

(assert start!35000)

(declare-fun res!137399 () Bool)

(declare-fun e!114029 () Bool)

(assert (=> start!35000 (=> (not res!137399) (not e!114029))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35000 (= res!137399 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35000 e!114029))

(assert (=> start!35000 true))

(declare-datatypes ((array!8307 0))(
  ( (array!8308 (arr!4636 (Array (_ BitVec 32) (_ BitVec 8))) (size!3715 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6586 0))(
  ( (BitStream!6587 (buf!4167 array!8307) (currentByte!7777 (_ BitVec 32)) (currentBit!7772 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6586)

(declare-fun e!114028 () Bool)

(declare-fun inv!12 (BitStream!6586) Bool)

(assert (=> start!35000 (and (inv!12 thiss!1577) e!114028)))

(declare-fun b!164911 () Bool)

(declare-fun res!137398 () Bool)

(assert (=> b!164911 (=> (not res!137398) (not e!114029))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164911 (= res!137398 (validate_offset_bits!1 ((_ sign_extend 32) (size!3715 (buf!4167 thiss!1577))) ((_ sign_extend 32) (currentByte!7777 thiss!1577)) ((_ sign_extend 32) (currentBit!7772 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164912 () Bool)

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164912 (= e!114029 (bvsge (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))) #b00000000000000000000000010000000))))

(declare-fun b!164913 () Bool)

(declare-fun array_inv!3456 (array!8307) Bool)

(assert (=> b!164913 (= e!114028 (array_inv!3456 (buf!4167 thiss!1577)))))

(assert (= (and start!35000 res!137399) b!164911))

(assert (= (and b!164911 res!137398) b!164912))

(assert (= start!35000 b!164913))

(declare-fun m!262261 () Bool)

(assert (=> start!35000 m!262261))

(declare-fun m!262263 () Bool)

(assert (=> b!164911 m!262263))

(declare-fun m!262265 () Bool)

(assert (=> b!164912 m!262265))

(declare-fun m!262267 () Bool)

(assert (=> b!164913 m!262267))

(push 1)

(assert (not start!35000))

(assert (not b!164913))

(assert (not b!164911))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

