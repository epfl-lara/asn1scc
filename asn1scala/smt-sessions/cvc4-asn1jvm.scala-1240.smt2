; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35100 () Bool)

(assert start!35100)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun b!165101 () Bool)

(declare-datatypes ((array!8353 0))(
  ( (array!8354 (arr!4656 (Array (_ BitVec 32) (_ BitVec 8))) (size!3735 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6626 0))(
  ( (BitStream!6627 (buf!4187 array!8353) (currentByte!7815 (_ BitVec 32)) (currentBit!7810 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6626)

(declare-fun lt!258534 () (_ BitVec 32))

(declare-fun e!114210 () Bool)

(declare-fun v!206 () (_ BitVec 8))

(declare-fun inv!12 (BitStream!6626) Bool)

(assert (=> b!165101 (= e!114210 (not (inv!12 (BitStream!6627 (array!8354 (store (arr!4656 (buf!4187 thiss!1577)) (currentByte!7815 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4656 (buf!4187 thiss!1577)) (currentByte!7815 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7810 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258534)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258534)))) (size!3735 (buf!4187 thiss!1577))) (currentByte!7815 thiss!1577) (currentBit!7810 thiss!1577)))))))

(assert (=> b!165101 (= lt!258534 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7810 thiss!1577) nBits!511)))))

(declare-fun b!165100 () Bool)

(declare-fun res!137527 () Bool)

(assert (=> b!165100 (=> (not res!137527) (not e!114210))))

(assert (=> b!165100 (= res!137527 (bvsle (bvadd (currentBit!7810 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!137526 () Bool)

(assert (=> start!35100 (=> (not res!137526) (not e!114210))))

(assert (=> start!35100 (= res!137526 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35100 e!114210))

(assert (=> start!35100 true))

(declare-fun e!114208 () Bool)

(assert (=> start!35100 (and (inv!12 thiss!1577) e!114208)))

(declare-fun b!165102 () Bool)

(declare-fun array_inv!3476 (array!8353) Bool)

(assert (=> b!165102 (= e!114208 (array_inv!3476 (buf!4187 thiss!1577)))))

(declare-fun b!165099 () Bool)

(declare-fun res!137528 () Bool)

(assert (=> b!165099 (=> (not res!137528) (not e!114210))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165099 (= res!137528 (validate_offset_bits!1 ((_ sign_extend 32) (size!3735 (buf!4187 thiss!1577))) ((_ sign_extend 32) (currentByte!7815 thiss!1577)) ((_ sign_extend 32) (currentBit!7810 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!35100 res!137526) b!165099))

(assert (= (and b!165099 res!137528) b!165100))

(assert (= (and b!165100 res!137527) b!165101))

(assert (= start!35100 b!165102))

(declare-fun m!262465 () Bool)

(assert (=> b!165101 m!262465))

(declare-fun m!262467 () Bool)

(assert (=> b!165101 m!262467))

(declare-fun m!262469 () Bool)

(assert (=> b!165101 m!262469))

(declare-fun m!262471 () Bool)

(assert (=> b!165101 m!262471))

(declare-fun m!262473 () Bool)

(assert (=> b!165101 m!262473))

(declare-fun m!262475 () Bool)

(assert (=> b!165101 m!262475))

(declare-fun m!262477 () Bool)

(assert (=> start!35100 m!262477))

(declare-fun m!262479 () Bool)

(assert (=> b!165102 m!262479))

(declare-fun m!262481 () Bool)

(assert (=> b!165099 m!262481))

(push 1)

(assert (not start!35100))

(assert (not b!165101))

(assert (not b!165099))

(assert (not b!165102))

(check-sat)

(pop 1)

(push 1)

(check-sat)

