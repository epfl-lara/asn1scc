; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35096 () Bool)

(assert start!35096)

(declare-fun b!165075 () Bool)

(declare-fun res!137509 () Bool)

(declare-fun e!114192 () Bool)

(assert (=> b!165075 (=> (not res!137509) (not e!114192))))

(declare-datatypes ((array!8349 0))(
  ( (array!8350 (arr!4654 (Array (_ BitVec 32) (_ BitVec 8))) (size!3733 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6622 0))(
  ( (BitStream!6623 (buf!4185 array!8349) (currentByte!7813 (_ BitVec 32)) (currentBit!7808 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6622)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165075 (= res!137509 (validate_offset_bits!1 ((_ sign_extend 32) (size!3733 (buf!4185 thiss!1577))) ((_ sign_extend 32) (currentByte!7813 thiss!1577)) ((_ sign_extend 32) (currentBit!7808 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165078 () Bool)

(declare-fun e!114190 () Bool)

(declare-fun array_inv!3474 (array!8349) Bool)

(assert (=> b!165078 (= e!114190 (array_inv!3474 (buf!4185 thiss!1577)))))

(declare-fun res!137510 () Bool)

(assert (=> start!35096 (=> (not res!137510) (not e!114192))))

(assert (=> start!35096 (= res!137510 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35096 e!114192))

(assert (=> start!35096 true))

(declare-fun inv!12 (BitStream!6622) Bool)

(assert (=> start!35096 (and (inv!12 thiss!1577) e!114190)))

(declare-fun b!165076 () Bool)

(declare-fun res!137508 () Bool)

(assert (=> b!165076 (=> (not res!137508) (not e!114192))))

(assert (=> b!165076 (= res!137508 (bvsle (bvadd (currentBit!7808 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun lt!258528 () (_ BitVec 32))

(declare-fun b!165077 () Bool)

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!165077 (= e!114192 (not (inv!12 (BitStream!6623 (array!8350 (store (arr!4654 (buf!4185 thiss!1577)) (currentByte!7813 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4654 (buf!4185 thiss!1577)) (currentByte!7813 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7808 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258528)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258528)))) (size!3733 (buf!4185 thiss!1577))) (currentByte!7813 thiss!1577) (currentBit!7808 thiss!1577)))))))

(assert (=> b!165077 (= lt!258528 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7808 thiss!1577) nBits!511)))))

(assert (= (and start!35096 res!137510) b!165075))

(assert (= (and b!165075 res!137509) b!165076))

(assert (= (and b!165076 res!137508) b!165077))

(assert (= start!35096 b!165078))

(declare-fun m!262429 () Bool)

(assert (=> b!165075 m!262429))

(declare-fun m!262431 () Bool)

(assert (=> b!165078 m!262431))

(declare-fun m!262433 () Bool)

(assert (=> start!35096 m!262433))

(declare-fun m!262435 () Bool)

(assert (=> b!165077 m!262435))

(declare-fun m!262437 () Bool)

(assert (=> b!165077 m!262437))

(declare-fun m!262439 () Bool)

(assert (=> b!165077 m!262439))

(declare-fun m!262441 () Bool)

(assert (=> b!165077 m!262441))

(declare-fun m!262443 () Bool)

(assert (=> b!165077 m!262443))

(declare-fun m!262445 () Bool)

(assert (=> b!165077 m!262445))

(push 1)

(assert (not b!165075))

(assert (not start!35096))

(assert (not b!165077))

(assert (not b!165078))

(check-sat)

(pop 1)

(push 1)

(check-sat)

