; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35092 () Bool)

(assert start!35092)

(declare-fun res!137495 () Bool)

(declare-fun e!114173 () Bool)

(assert (=> start!35092 (=> (not res!137495) (not e!114173))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35092 (= res!137495 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35092 e!114173))

(assert (=> start!35092 true))

(declare-datatypes ((array!8345 0))(
  ( (array!8346 (arr!4652 (Array (_ BitVec 32) (_ BitVec 8))) (size!3731 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6618 0))(
  ( (BitStream!6619 (buf!4183 array!8345) (currentByte!7811 (_ BitVec 32)) (currentBit!7806 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6618)

(declare-fun e!114174 () Bool)

(declare-fun inv!12 (BitStream!6618) Bool)

(assert (=> start!35092 (and (inv!12 thiss!1577) e!114174)))

(declare-fun b!165055 () Bool)

(declare-fun res!137494 () Bool)

(assert (=> b!165055 (=> (not res!137494) (not e!114173))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165055 (= res!137494 (validate_offset_bits!1 ((_ sign_extend 32) (size!3731 (buf!4183 thiss!1577))) ((_ sign_extend 32) (currentByte!7811 thiss!1577)) ((_ sign_extend 32) (currentBit!7806 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165056 () Bool)

(assert (=> b!165056 (= e!114173 (and (bvsle (bvadd (currentBit!7806 thiss!1577) nBits!511) #b00000000000000000000000000001000) (let ((bdg!9977 (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7806 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7806 thiss!1577) nBits!511))))))) (and (bvslt bdg!9977 #b00000000000000000000000010000000) (bvslt bdg!9977 #b11111111111111111111111110000000)))))))

(declare-fun b!165057 () Bool)

(declare-fun array_inv!3472 (array!8345) Bool)

(assert (=> b!165057 (= e!114174 (array_inv!3472 (buf!4183 thiss!1577)))))

(assert (= (and start!35092 res!137495) b!165055))

(assert (= (and b!165055 res!137494) b!165056))

(assert (= start!35092 b!165057))

(declare-fun m!262409 () Bool)

(assert (=> start!35092 m!262409))

(declare-fun m!262411 () Bool)

(assert (=> b!165055 m!262411))

(declare-fun m!262413 () Bool)

(assert (=> b!165056 m!262413))

(declare-fun m!262415 () Bool)

(assert (=> b!165056 m!262415))

(declare-fun m!262417 () Bool)

(assert (=> b!165057 m!262417))

(check-sat (not start!35092) (not b!165055) (not b!165057))
(check-sat)
