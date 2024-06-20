; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35088 () Bool)

(assert start!35088)

(declare-fun res!137482 () Bool)

(declare-fun e!114154 () Bool)

(assert (=> start!35088 (=> (not res!137482) (not e!114154))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35088 (= res!137482 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35088 e!114154))

(assert (=> start!35088 true))

(declare-datatypes ((array!8341 0))(
  ( (array!8342 (arr!4650 (Array (_ BitVec 32) (_ BitVec 8))) (size!3729 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6614 0))(
  ( (BitStream!6615 (buf!4181 array!8341) (currentByte!7809 (_ BitVec 32)) (currentBit!7804 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6614)

(declare-fun e!114155 () Bool)

(declare-fun inv!12 (BitStream!6614) Bool)

(assert (=> start!35088 (and (inv!12 thiss!1577) e!114155)))

(declare-fun b!165037 () Bool)

(declare-fun res!137483 () Bool)

(assert (=> b!165037 (=> (not res!137483) (not e!114154))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165037 (= res!137483 (validate_offset_bits!1 ((_ sign_extend 32) (size!3729 (buf!4181 thiss!1577))) ((_ sign_extend 32) (currentByte!7809 thiss!1577)) ((_ sign_extend 32) (currentBit!7804 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165038 () Bool)

(assert (=> b!165038 (= e!114154 (and (bvsle (bvadd (currentBit!7804 thiss!1577) nBits!511) #b00000000000000000000000000001000) (bvsge (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7804 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7804 thiss!1577) nBits!511))))) #b00000000000000000000000010000000)))))

(declare-fun b!165039 () Bool)

(declare-fun array_inv!3470 (array!8341) Bool)

(assert (=> b!165039 (= e!114155 (array_inv!3470 (buf!4181 thiss!1577)))))

(assert (= (and start!35088 res!137482) b!165037))

(assert (= (and b!165037 res!137483) b!165038))

(assert (= start!35088 b!165039))

(declare-fun m!262389 () Bool)

(assert (=> start!35088 m!262389))

(declare-fun m!262391 () Bool)

(assert (=> b!165037 m!262391))

(declare-fun m!262393 () Bool)

(assert (=> b!165038 m!262393))

(declare-fun m!262395 () Bool)

(assert (=> b!165038 m!262395))

(declare-fun m!262397 () Bool)

(assert (=> b!165039 m!262397))

(push 1)

(assert (not b!165039))

(assert (not start!35088))

(assert (not b!165037))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

