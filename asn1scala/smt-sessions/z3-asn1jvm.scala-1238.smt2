; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35086 () Bool)

(assert start!35086)

(declare-fun res!137476 () Bool)

(declare-fun e!114146 () Bool)

(assert (=> start!35086 (=> (not res!137476) (not e!114146))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35086 (= res!137476 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35086 e!114146))

(assert (=> start!35086 true))

(declare-datatypes ((array!8339 0))(
  ( (array!8340 (arr!4649 (Array (_ BitVec 32) (_ BitVec 8))) (size!3728 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6612 0))(
  ( (BitStream!6613 (buf!4180 array!8339) (currentByte!7808 (_ BitVec 32)) (currentBit!7803 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6612)

(declare-fun e!114147 () Bool)

(declare-fun inv!12 (BitStream!6612) Bool)

(assert (=> start!35086 (and (inv!12 thiss!1577) e!114147)))

(declare-fun b!165028 () Bool)

(declare-fun res!137477 () Bool)

(assert (=> b!165028 (=> (not res!137477) (not e!114146))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165028 (= res!137477 (validate_offset_bits!1 ((_ sign_extend 32) (size!3728 (buf!4180 thiss!1577))) ((_ sign_extend 32) (currentByte!7808 thiss!1577)) ((_ sign_extend 32) (currentBit!7803 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165029 () Bool)

(assert (=> b!165029 (= e!114146 (and (bvsle (bvadd (currentBit!7803 thiss!1577) nBits!511) #b00000000000000000000000000001000) (bvsge (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7803 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7803 thiss!1577) nBits!511))))) #b00000000000000000000000010000000)))))

(declare-fun b!165030 () Bool)

(declare-fun array_inv!3469 (array!8339) Bool)

(assert (=> b!165030 (= e!114147 (array_inv!3469 (buf!4180 thiss!1577)))))

(assert (= (and start!35086 res!137476) b!165028))

(assert (= (and b!165028 res!137477) b!165029))

(assert (= start!35086 b!165030))

(declare-fun m!262379 () Bool)

(assert (=> start!35086 m!262379))

(declare-fun m!262381 () Bool)

(assert (=> b!165028 m!262381))

(declare-fun m!262383 () Bool)

(assert (=> b!165029 m!262383))

(declare-fun m!262385 () Bool)

(assert (=> b!165029 m!262385))

(declare-fun m!262387 () Bool)

(assert (=> b!165030 m!262387))

(check-sat (not b!165028) (not start!35086) (not b!165030))
(check-sat)
