; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35084 () Bool)

(assert start!35084)

(declare-fun res!137471 () Bool)

(declare-fun e!114137 () Bool)

(assert (=> start!35084 (=> (not res!137471) (not e!114137))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35084 (= res!137471 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35084 e!114137))

(assert (=> start!35084 true))

(declare-datatypes ((array!8337 0))(
  ( (array!8338 (arr!4648 (Array (_ BitVec 32) (_ BitVec 8))) (size!3727 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6610 0))(
  ( (BitStream!6611 (buf!4179 array!8337) (currentByte!7807 (_ BitVec 32)) (currentBit!7802 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6610)

(declare-fun e!114136 () Bool)

(declare-fun inv!12 (BitStream!6610) Bool)

(assert (=> start!35084 (and (inv!12 thiss!1577) e!114136)))

(declare-fun b!165019 () Bool)

(declare-fun res!137470 () Bool)

(assert (=> b!165019 (=> (not res!137470) (not e!114137))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165019 (= res!137470 (validate_offset_bits!1 ((_ sign_extend 32) (size!3727 (buf!4179 thiss!1577))) ((_ sign_extend 32) (currentByte!7807 thiss!1577)) ((_ sign_extend 32) (currentBit!7802 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165020 () Bool)

(assert (=> b!165020 (= e!114137 (and (bvsle (bvadd (currentBit!7802 thiss!1577) nBits!511) #b00000000000000000000000000001000) (bvsge (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7802 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7802 thiss!1577) nBits!511))))) #b00000000000000000000000010000000)))))

(declare-fun b!165021 () Bool)

(declare-fun array_inv!3468 (array!8337) Bool)

(assert (=> b!165021 (= e!114136 (array_inv!3468 (buf!4179 thiss!1577)))))

(assert (= (and start!35084 res!137471) b!165019))

(assert (= (and b!165019 res!137470) b!165020))

(assert (= start!35084 b!165021))

(declare-fun m!262369 () Bool)

(assert (=> start!35084 m!262369))

(declare-fun m!262371 () Bool)

(assert (=> b!165019 m!262371))

(declare-fun m!262373 () Bool)

(assert (=> b!165020 m!262373))

(declare-fun m!262375 () Bool)

(assert (=> b!165020 m!262375))

(declare-fun m!262377 () Bool)

(assert (=> b!165021 m!262377))

(push 1)

(assert (not b!165021))

(assert (not start!35084))

(assert (not b!165019))

(check-sat)

(pop 1)

(push 1)

(check-sat)

