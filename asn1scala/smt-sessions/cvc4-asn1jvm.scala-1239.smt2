; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35094 () Bool)

(assert start!35094)

(declare-fun res!137500 () Bool)

(declare-fun e!114183 () Bool)

(assert (=> start!35094 (=> (not res!137500) (not e!114183))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35094 (= res!137500 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35094 e!114183))

(assert (=> start!35094 true))

(declare-datatypes ((array!8347 0))(
  ( (array!8348 (arr!4653 (Array (_ BitVec 32) (_ BitVec 8))) (size!3732 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6620 0))(
  ( (BitStream!6621 (buf!4184 array!8347) (currentByte!7812 (_ BitVec 32)) (currentBit!7807 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6620)

(declare-fun e!114182 () Bool)

(declare-fun inv!12 (BitStream!6620) Bool)

(assert (=> start!35094 (and (inv!12 thiss!1577) e!114182)))

(declare-fun b!165064 () Bool)

(declare-fun res!137501 () Bool)

(assert (=> b!165064 (=> (not res!137501) (not e!114183))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165064 (= res!137501 (validate_offset_bits!1 ((_ sign_extend 32) (size!3732 (buf!4184 thiss!1577))) ((_ sign_extend 32) (currentByte!7812 thiss!1577)) ((_ sign_extend 32) (currentBit!7807 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165065 () Bool)

(assert (=> b!165065 (= e!114183 (and (bvsle (bvadd (currentBit!7807 thiss!1577) nBits!511) #b00000000000000000000000000001000) (let ((bdg!9977 (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7807 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7807 thiss!1577) nBits!511))))))) (and (bvslt bdg!9977 #b00000000000000000000000010000000) (bvslt bdg!9977 #b11111111111111111111111110000000)))))))

(declare-fun b!165066 () Bool)

(declare-fun array_inv!3473 (array!8347) Bool)

(assert (=> b!165066 (= e!114182 (array_inv!3473 (buf!4184 thiss!1577)))))

(assert (= (and start!35094 res!137500) b!165064))

(assert (= (and b!165064 res!137501) b!165065))

(assert (= start!35094 b!165066))

(declare-fun m!262419 () Bool)

(assert (=> start!35094 m!262419))

(declare-fun m!262421 () Bool)

(assert (=> b!165064 m!262421))

(declare-fun m!262423 () Bool)

(assert (=> b!165065 m!262423))

(declare-fun m!262425 () Bool)

(assert (=> b!165065 m!262425))

(declare-fun m!262427 () Bool)

(assert (=> b!165066 m!262427))

(push 1)

(assert (not b!165066))

(assert (not b!165064))

(assert (not start!35094))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

