; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35090 () Bool)

(assert start!35090)

(declare-fun res!137489 () Bool)

(declare-fun e!114165 () Bool)

(assert (=> start!35090 (=> (not res!137489) (not e!114165))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35090 (= res!137489 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35090 e!114165))

(assert (=> start!35090 true))

(declare-datatypes ((array!8343 0))(
  ( (array!8344 (arr!4651 (Array (_ BitVec 32) (_ BitVec 8))) (size!3730 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6616 0))(
  ( (BitStream!6617 (buf!4182 array!8343) (currentByte!7810 (_ BitVec 32)) (currentBit!7805 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6616)

(declare-fun e!114163 () Bool)

(declare-fun inv!12 (BitStream!6616) Bool)

(assert (=> start!35090 (and (inv!12 thiss!1577) e!114163)))

(declare-fun b!165046 () Bool)

(declare-fun res!137488 () Bool)

(assert (=> b!165046 (=> (not res!137488) (not e!114165))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165046 (= res!137488 (validate_offset_bits!1 ((_ sign_extend 32) (size!3730 (buf!4182 thiss!1577))) ((_ sign_extend 32) (currentByte!7810 thiss!1577)) ((_ sign_extend 32) (currentBit!7805 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165047 () Bool)

(assert (=> b!165047 (= e!114165 (and (bvsle (bvadd (currentBit!7805 thiss!1577) nBits!511) #b00000000000000000000000000001000) (let ((bdg!9977 (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7805 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7805 thiss!1577) nBits!511))))))) (and (bvslt bdg!9977 #b00000000000000000000000010000000) (bvslt bdg!9977 #b11111111111111111111111110000000)))))))

(declare-fun b!165048 () Bool)

(declare-fun array_inv!3471 (array!8343) Bool)

(assert (=> b!165048 (= e!114163 (array_inv!3471 (buf!4182 thiss!1577)))))

(assert (= (and start!35090 res!137489) b!165046))

(assert (= (and b!165046 res!137488) b!165047))

(assert (= start!35090 b!165048))

(declare-fun m!262399 () Bool)

(assert (=> start!35090 m!262399))

(declare-fun m!262401 () Bool)

(assert (=> b!165046 m!262401))

(declare-fun m!262403 () Bool)

(assert (=> b!165047 m!262403))

(declare-fun m!262405 () Bool)

(assert (=> b!165047 m!262405))

(declare-fun m!262407 () Bool)

(assert (=> b!165048 m!262407))

(push 1)

(assert (not b!165048))

(assert (not b!165046))

(assert (not start!35090))

(check-sat)

(pop 1)

(push 1)

(check-sat)

