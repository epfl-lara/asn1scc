; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34468 () Bool)

(assert start!34468)

(declare-fun b!163516 () Bool)

(declare-fun e!112950 () Bool)

(declare-fun e!112947 () Bool)

(assert (=> b!163516 (= e!112950 (not e!112947))))

(declare-fun res!136250 () Bool)

(assert (=> b!163516 (=> res!136250 e!112947)))

(declare-datatypes ((array!8140 0))(
  ( (array!8141 (arr!4566 (Array (_ BitVec 32) (_ BitVec 8))) (size!3645 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6446 0))(
  ( (BitStream!6447 (buf!4097 array!8140) (currentByte!7650 (_ BitVec 32)) (currentBit!7645 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6446)

(declare-fun lt!256656 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163516 (= res!136250 (not (byteRangesEq!0 (select (arr!4566 (buf!4097 thiss!1577)) (currentByte!7650 thiss!1577)) lt!256656 #b00000000000000000000000000000000 (currentBit!7645 thiss!1577))))))

(declare-fun lt!256651 () array!8140)

(declare-fun arrayRangesEq!579 (array!8140 array!8140 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163516 (arrayRangesEq!579 (buf!4097 thiss!1577) lt!256651 #b00000000000000000000000000000000 (currentByte!7650 thiss!1577))))

(declare-datatypes ((Unit!11346 0))(
  ( (Unit!11347) )
))
(declare-fun lt!256654 () Unit!11346)

(declare-fun arrayUpdatedAtPrefixLemma!187 (array!8140 (_ BitVec 32) (_ BitVec 8)) Unit!11346)

(assert (=> b!163516 (= lt!256654 (arrayUpdatedAtPrefixLemma!187 (buf!4097 thiss!1577) (currentByte!7650 thiss!1577) lt!256656))))

(assert (=> b!163516 (= lt!256651 (array!8141 (store (arr!4566 (buf!4097 thiss!1577)) (currentByte!7650 thiss!1577) lt!256656) (size!3645 (buf!4097 thiss!1577))))))

(declare-fun lt!256653 () (_ BitVec 32))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163516 (= lt!256656 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4566 (buf!4097 thiss!1577)) (currentByte!7650 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7645 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256653)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256653))))))

(assert (=> b!163516 (= lt!256653 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7645 thiss!1577) nBits!511)))))

(declare-fun b!163517 () Bool)

(declare-fun e!112949 () Bool)

(assert (=> b!163517 (= e!112949 true)))

(declare-fun lt!256655 () Bool)

(declare-datatypes ((tuple2!14514 0))(
  ( (tuple2!14515 (_1!7848 Unit!11346) (_2!7848 BitStream!6446)) )
))
(declare-fun lt!256652 () tuple2!14514)

(declare-fun isPrefixOf!0 (BitStream!6446 BitStream!6446) Bool)

(assert (=> b!163517 (= lt!256655 (isPrefixOf!0 thiss!1577 (_2!7848 lt!256652)))))

(declare-fun b!163518 () Bool)

(declare-fun e!112951 () Bool)

(declare-fun array_inv!3386 (array!8140) Bool)

(assert (=> b!163518 (= e!112951 (array_inv!3386 (buf!4097 thiss!1577)))))

(declare-fun b!163519 () Bool)

(declare-fun res!136254 () Bool)

(assert (=> b!163519 (=> (not res!136254) (not e!112950))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163519 (= res!136254 (validate_offset_bits!1 ((_ sign_extend 32) (size!3645 (buf!4097 thiss!1577))) ((_ sign_extend 32) (currentByte!7650 thiss!1577)) ((_ sign_extend 32) (currentBit!7645 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163520 () Bool)

(declare-fun res!136253 () Bool)

(assert (=> b!163520 (=> (not res!136253) (not e!112950))))

(assert (=> b!163520 (= res!136253 (bvsle (bvadd (currentBit!7645 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!136252 () Bool)

(assert (=> start!34468 (=> (not res!136252) (not e!112950))))

(assert (=> start!34468 (= res!136252 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34468 e!112950))

(assert (=> start!34468 true))

(declare-fun inv!12 (BitStream!6446) Bool)

(assert (=> start!34468 (and (inv!12 thiss!1577) e!112951)))

(declare-fun b!163521 () Bool)

(assert (=> b!163521 (= e!112947 e!112949)))

(declare-fun res!136251 () Bool)

(assert (=> b!163521 (=> res!136251 e!112949)))

(assert (=> b!163521 (= res!136251 (not (= (size!3645 (buf!4097 thiss!1577)) (size!3645 (buf!4097 (_2!7848 lt!256652))))))))

(declare-fun moveBitIndex!0 (BitStream!6446 (_ BitVec 64)) tuple2!14514)

(assert (=> b!163521 (= lt!256652 (moveBitIndex!0 (BitStream!6447 lt!256651 (currentByte!7650 thiss!1577) (currentBit!7645 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163522 () Bool)

(declare-fun res!136249 () Bool)

(assert (=> b!163522 (=> res!136249 e!112949)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!163522 (= res!136249 (not (= (bitIndex!0 (size!3645 (buf!4097 (_2!7848 lt!256652))) (currentByte!7650 (_2!7848 lt!256652)) (currentBit!7645 (_2!7848 lt!256652))) (bvadd (bitIndex!0 (size!3645 (buf!4097 thiss!1577)) (currentByte!7650 thiss!1577) (currentBit!7645 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(assert (= (and start!34468 res!136252) b!163519))

(assert (= (and b!163519 res!136254) b!163520))

(assert (= (and b!163520 res!136253) b!163516))

(assert (= (and b!163516 (not res!136250)) b!163521))

(assert (= (and b!163521 (not res!136251)) b!163522))

(assert (= (and b!163522 (not res!136249)) b!163517))

(assert (= start!34468 b!163518))

(declare-fun m!259563 () Bool)

(assert (=> b!163522 m!259563))

(declare-fun m!259565 () Bool)

(assert (=> b!163522 m!259565))

(declare-fun m!259567 () Bool)

(assert (=> b!163519 m!259567))

(declare-fun m!259569 () Bool)

(assert (=> b!163516 m!259569))

(declare-fun m!259571 () Bool)

(assert (=> b!163516 m!259571))

(assert (=> b!163516 m!259571))

(declare-fun m!259573 () Bool)

(assert (=> b!163516 m!259573))

(declare-fun m!259575 () Bool)

(assert (=> b!163516 m!259575))

(declare-fun m!259577 () Bool)

(assert (=> b!163516 m!259577))

(declare-fun m!259579 () Bool)

(assert (=> b!163516 m!259579))

(declare-fun m!259581 () Bool)

(assert (=> b!163516 m!259581))

(declare-fun m!259583 () Bool)

(assert (=> b!163516 m!259583))

(declare-fun m!259585 () Bool)

(assert (=> start!34468 m!259585))

(declare-fun m!259587 () Bool)

(assert (=> b!163518 m!259587))

(declare-fun m!259589 () Bool)

(assert (=> b!163517 m!259589))

(declare-fun m!259591 () Bool)

(assert (=> b!163521 m!259591))

(push 1)

