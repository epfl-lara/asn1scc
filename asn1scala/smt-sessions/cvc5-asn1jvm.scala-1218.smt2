; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34572 () Bool)

(assert start!34572)

(declare-fun res!136646 () Bool)

(declare-fun e!113276 () Bool)

(assert (=> start!34572 (=> (not res!136646) (not e!113276))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34572 (= res!136646 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34572 e!113276))

(assert (=> start!34572 true))

(declare-datatypes ((array!8187 0))(
  ( (array!8188 (arr!4588 (Array (_ BitVec 32) (_ BitVec 8))) (size!3667 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6490 0))(
  ( (BitStream!6491 (buf!4119 array!8187) (currentByte!7678 (_ BitVec 32)) (currentBit!7673 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6490)

(declare-fun e!113278 () Bool)

(declare-fun inv!12 (BitStream!6490) Bool)

(assert (=> start!34572 (and (inv!12 thiss!1577) e!113278)))

(declare-fun b!163999 () Bool)

(declare-fun array_inv!3408 (array!8187) Bool)

(assert (=> b!163999 (= e!113278 (array_inv!3408 (buf!4119 thiss!1577)))))

(declare-fun b!163998 () Bool)

(assert (=> b!163998 (= e!113276 (not true))))

(declare-fun lt!257388 () array!8187)

(declare-fun lt!257386 () (_ BitVec 32))

(declare-fun lt!257382 () (_ BitVec 32))

(declare-fun lt!257384 () (_ BitVec 8))

(declare-fun arrayRangesEq!601 (array!8187 array!8187 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163998 (arrayRangesEq!601 lt!257388 (array!8188 (store (store (arr!4588 (buf!4119 thiss!1577)) (currentByte!7678 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4588 (buf!4119 thiss!1577)) (currentByte!7678 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7673 thiss!1577)))))))) (bvlshr (bvand lt!257382 #b00000000000000000000000011111111) lt!257386)))) (bvadd #b00000000000000000000000000000001 (currentByte!7678 thiss!1577)) lt!257384) (size!3667 (buf!4119 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7678 thiss!1577)))))

(declare-datatypes ((Unit!11411 0))(
  ( (Unit!11412) )
))
(declare-fun lt!257387 () Unit!11411)

(declare-fun arrayUpdatedAtPrefixLemma!209 (array!8187 (_ BitVec 32) (_ BitVec 8)) Unit!11411)

(assert (=> b!163998 (= lt!257387 (arrayUpdatedAtPrefixLemma!209 lt!257388 (bvadd #b00000000000000000000000000000001 (currentByte!7678 thiss!1577)) lt!257384))))

(assert (=> b!163998 (arrayRangesEq!601 (buf!4119 thiss!1577) (array!8188 (store (arr!4588 (buf!4119 thiss!1577)) (currentByte!7678 thiss!1577) (select (store (store (arr!4588 (buf!4119 thiss!1577)) (currentByte!7678 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4588 (buf!4119 thiss!1577)) (currentByte!7678 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7673 thiss!1577)))))))) (bvlshr (bvand lt!257382 #b00000000000000000000000011111111) lt!257386)))) (bvadd #b00000000000000000000000000000001 (currentByte!7678 thiss!1577)) lt!257384) (currentByte!7678 thiss!1577))) (size!3667 (buf!4119 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7678 thiss!1577))))

(declare-fun lt!257383 () Unit!11411)

(assert (=> b!163998 (= lt!257383 (arrayUpdatedAtPrefixLemma!209 (buf!4119 thiss!1577) (currentByte!7678 thiss!1577) (select (store (store (arr!4588 (buf!4119 thiss!1577)) (currentByte!7678 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4588 (buf!4119 thiss!1577)) (currentByte!7678 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7673 thiss!1577)))))))) (bvlshr (bvand lt!257382 #b00000000000000000000000011111111) lt!257386)))) (bvadd #b00000000000000000000000000000001 (currentByte!7678 thiss!1577)) lt!257384) (currentByte!7678 thiss!1577))))))

(declare-fun lt!257385 () (_ BitVec 32))

(assert (=> b!163998 (= lt!257384 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4588 (buf!4119 thiss!1577)) (currentByte!7678 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4588 (buf!4119 thiss!1577)) (currentByte!7678 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7673 thiss!1577)))))))) (bvlshr (bvand lt!257382 #b00000000000000000000000011111111) lt!257386)))) (bvadd #b00000000000000000000000000000001 (currentByte!7678 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257385))) (bvshl lt!257382 lt!257385))))))

(assert (=> b!163998 (= lt!257385 (bvsub #b00000000000000000000000000001000 lt!257386))))

(assert (=> b!163998 (= lt!257388 (array!8188 (store (arr!4588 (buf!4119 thiss!1577)) (currentByte!7678 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4588 (buf!4119 thiss!1577)) (currentByte!7678 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7673 thiss!1577)))))))) (bvlshr (bvand lt!257382 #b00000000000000000000000011111111) lt!257386)))) (size!3667 (buf!4119 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163998 (= lt!257382 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!163998 (= lt!257386 (bvsub (bvadd (currentBit!7673 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163997 () Bool)

(declare-fun res!136645 () Bool)

(assert (=> b!163997 (=> (not res!136645) (not e!113276))))

(assert (=> b!163997 (= res!136645 (bvsgt (bvadd (currentBit!7673 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163996 () Bool)

(declare-fun res!136647 () Bool)

(assert (=> b!163996 (=> (not res!136647) (not e!113276))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163996 (= res!136647 (validate_offset_bits!1 ((_ sign_extend 32) (size!3667 (buf!4119 thiss!1577))) ((_ sign_extend 32) (currentByte!7678 thiss!1577)) ((_ sign_extend 32) (currentBit!7673 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!34572 res!136646) b!163996))

(assert (= (and b!163996 res!136647) b!163997))

(assert (= (and b!163997 res!136645) b!163998))

(assert (= start!34572 b!163999))

(declare-fun m!260445 () Bool)

(assert (=> start!34572 m!260445))

(declare-fun m!260447 () Bool)

(assert (=> b!163999 m!260447))

(declare-fun m!260449 () Bool)

(assert (=> b!163998 m!260449))

(declare-fun m!260451 () Bool)

(assert (=> b!163998 m!260451))

(declare-fun m!260453 () Bool)

(assert (=> b!163998 m!260453))

(declare-fun m!260455 () Bool)

(assert (=> b!163998 m!260455))

(declare-fun m!260457 () Bool)

(assert (=> b!163998 m!260457))

(declare-fun m!260459 () Bool)

(assert (=> b!163998 m!260459))

(assert (=> b!163998 m!260451))

(declare-fun m!260461 () Bool)

(assert (=> b!163998 m!260461))

(declare-fun m!260463 () Bool)

(assert (=> b!163998 m!260463))

(declare-fun m!260465 () Bool)

(assert (=> b!163998 m!260465))

(declare-fun m!260467 () Bool)

(assert (=> b!163998 m!260467))

(declare-fun m!260469 () Bool)

(assert (=> b!163998 m!260469))

(declare-fun m!260471 () Bool)

(assert (=> b!163998 m!260471))

(declare-fun m!260473 () Bool)

(assert (=> b!163998 m!260473))

(declare-fun m!260475 () Bool)

(assert (=> b!163996 m!260475))

(push 1)

(assert (not b!163996))

(assert (not start!34572))

(assert (not b!163999))

(assert (not b!163998))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

