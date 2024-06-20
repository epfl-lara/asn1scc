; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35006 () Bool)

(assert start!35006)

(declare-fun res!137417 () Bool)

(declare-fun e!114055 () Bool)

(assert (=> start!35006 (=> (not res!137417) (not e!114055))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35006 (= res!137417 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35006 e!114055))

(assert (=> start!35006 true))

(declare-datatypes ((array!8313 0))(
  ( (array!8314 (arr!4639 (Array (_ BitVec 32) (_ BitVec 8))) (size!3718 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6592 0))(
  ( (BitStream!6593 (buf!4170 array!8313) (currentByte!7780 (_ BitVec 32)) (currentBit!7775 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6592)

(declare-fun e!114056 () Bool)

(declare-fun inv!12 (BitStream!6592) Bool)

(assert (=> start!35006 (and (inv!12 thiss!1577) e!114056)))

(declare-fun b!164938 () Bool)

(declare-fun res!137416 () Bool)

(assert (=> b!164938 (=> (not res!137416) (not e!114055))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164938 (= res!137416 (validate_offset_bits!1 ((_ sign_extend 32) (size!3718 (buf!4170 thiss!1577))) ((_ sign_extend 32) (currentByte!7780 thiss!1577)) ((_ sign_extend 32) (currentBit!7775 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164939 () Bool)

(declare-fun lt!258519 () (_ BitVec 32))

(assert (=> b!164939 (= e!114055 (and (bvslt lt!258519 #b00000000000000000000000010000000) (bvslt lt!258519 #b11111111111111111111111110000000)))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164939 (= lt!258519 (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))

(declare-fun b!164940 () Bool)

(declare-fun array_inv!3459 (array!8313) Bool)

(assert (=> b!164940 (= e!114056 (array_inv!3459 (buf!4170 thiss!1577)))))

(assert (= (and start!35006 res!137417) b!164938))

(assert (= (and b!164938 res!137416) b!164939))

(assert (= start!35006 b!164940))

(declare-fun m!262285 () Bool)

(assert (=> start!35006 m!262285))

(declare-fun m!262287 () Bool)

(assert (=> b!164938 m!262287))

(declare-fun m!262289 () Bool)

(assert (=> b!164939 m!262289))

(declare-fun m!262291 () Bool)

(assert (=> b!164940 m!262291))

(push 1)

(assert (not b!164940))

(assert (not start!35006))

(assert (not b!164938))

(check-sat)

(pop 1)

(push 1)

(check-sat)

