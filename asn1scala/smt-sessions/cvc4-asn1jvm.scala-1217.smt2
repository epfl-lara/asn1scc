; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34570 () Bool)

(assert start!34570)

(declare-fun b!163987 () Bool)

(declare-fun e!113267 () Bool)

(declare-datatypes ((array!8185 0))(
  ( (array!8186 (arr!4587 (Array (_ BitVec 32) (_ BitVec 8))) (size!3666 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6488 0))(
  ( (BitStream!6489 (buf!4118 array!8185) (currentByte!7677 (_ BitVec 32)) (currentBit!7672 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6488)

(declare-fun array_inv!3407 (array!8185) Bool)

(assert (=> b!163987 (= e!113267 (array_inv!3407 (buf!4118 thiss!1577)))))

(declare-fun b!163984 () Bool)

(declare-fun res!136636 () Bool)

(declare-fun e!113269 () Bool)

(assert (=> b!163984 (=> (not res!136636) (not e!113269))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163984 (= res!136636 (validate_offset_bits!1 ((_ sign_extend 32) (size!3666 (buf!4118 thiss!1577))) ((_ sign_extend 32) (currentByte!7677 thiss!1577)) ((_ sign_extend 32) (currentBit!7672 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163986 () Bool)

(assert (=> b!163986 (= e!113269 (not true))))

(declare-fun lt!257364 () (_ BitVec 32))

(declare-fun lt!257362 () (_ BitVec 32))

(declare-fun lt!257366 () (_ BitVec 8))

(declare-fun lt!257363 () array!8185)

(declare-fun arrayRangesEq!600 (array!8185 array!8185 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163986 (arrayRangesEq!600 lt!257363 (array!8186 (store (store (arr!4587 (buf!4118 thiss!1577)) (currentByte!7677 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4587 (buf!4118 thiss!1577)) (currentByte!7677 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7672 thiss!1577)))))))) (bvlshr (bvand lt!257364 #b00000000000000000000000011111111) lt!257362)))) (bvadd #b00000000000000000000000000000001 (currentByte!7677 thiss!1577)) lt!257366) (size!3666 (buf!4118 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7677 thiss!1577)))))

(declare-datatypes ((Unit!11409 0))(
  ( (Unit!11410) )
))
(declare-fun lt!257367 () Unit!11409)

(declare-fun arrayUpdatedAtPrefixLemma!208 (array!8185 (_ BitVec 32) (_ BitVec 8)) Unit!11409)

(assert (=> b!163986 (= lt!257367 (arrayUpdatedAtPrefixLemma!208 lt!257363 (bvadd #b00000000000000000000000000000001 (currentByte!7677 thiss!1577)) lt!257366))))

(assert (=> b!163986 (arrayRangesEq!600 (buf!4118 thiss!1577) (array!8186 (store (arr!4587 (buf!4118 thiss!1577)) (currentByte!7677 thiss!1577) (select (store (store (arr!4587 (buf!4118 thiss!1577)) (currentByte!7677 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4587 (buf!4118 thiss!1577)) (currentByte!7677 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7672 thiss!1577)))))))) (bvlshr (bvand lt!257364 #b00000000000000000000000011111111) lt!257362)))) (bvadd #b00000000000000000000000000000001 (currentByte!7677 thiss!1577)) lt!257366) (currentByte!7677 thiss!1577))) (size!3666 (buf!4118 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7677 thiss!1577))))

(declare-fun lt!257365 () Unit!11409)

(assert (=> b!163986 (= lt!257365 (arrayUpdatedAtPrefixLemma!208 (buf!4118 thiss!1577) (currentByte!7677 thiss!1577) (select (store (store (arr!4587 (buf!4118 thiss!1577)) (currentByte!7677 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4587 (buf!4118 thiss!1577)) (currentByte!7677 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7672 thiss!1577)))))))) (bvlshr (bvand lt!257364 #b00000000000000000000000011111111) lt!257362)))) (bvadd #b00000000000000000000000000000001 (currentByte!7677 thiss!1577)) lt!257366) (currentByte!7677 thiss!1577))))))

(declare-fun lt!257361 () (_ BitVec 32))

(assert (=> b!163986 (= lt!257366 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4587 (buf!4118 thiss!1577)) (currentByte!7677 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4587 (buf!4118 thiss!1577)) (currentByte!7677 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7672 thiss!1577)))))))) (bvlshr (bvand lt!257364 #b00000000000000000000000011111111) lt!257362)))) (bvadd #b00000000000000000000000000000001 (currentByte!7677 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257361))) (bvshl lt!257364 lt!257361))))))

(assert (=> b!163986 (= lt!257361 (bvsub #b00000000000000000000000000001000 lt!257362))))

(assert (=> b!163986 (= lt!257363 (array!8186 (store (arr!4587 (buf!4118 thiss!1577)) (currentByte!7677 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4587 (buf!4118 thiss!1577)) (currentByte!7677 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7672 thiss!1577)))))))) (bvlshr (bvand lt!257364 #b00000000000000000000000011111111) lt!257362)))) (size!3666 (buf!4118 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163986 (= lt!257364 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!163986 (= lt!257362 (bvsub (bvadd (currentBit!7672 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163985 () Bool)

(declare-fun res!136637 () Bool)

(assert (=> b!163985 (=> (not res!136637) (not e!113269))))

(assert (=> b!163985 (= res!136637 (bvsgt (bvadd (currentBit!7672 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!136638 () Bool)

(assert (=> start!34570 (=> (not res!136638) (not e!113269))))

(assert (=> start!34570 (= res!136638 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34570 e!113269))

(assert (=> start!34570 true))

(declare-fun inv!12 (BitStream!6488) Bool)

(assert (=> start!34570 (and (inv!12 thiss!1577) e!113267)))

(assert (= (and start!34570 res!136638) b!163984))

(assert (= (and b!163984 res!136636) b!163985))

(assert (= (and b!163985 res!136637) b!163986))

(assert (= start!34570 b!163987))

(declare-fun m!260413 () Bool)

(assert (=> b!163987 m!260413))

(declare-fun m!260415 () Bool)

(assert (=> b!163984 m!260415))

(declare-fun m!260417 () Bool)

(assert (=> b!163986 m!260417))

(declare-fun m!260419 () Bool)

(assert (=> b!163986 m!260419))

(declare-fun m!260421 () Bool)

(assert (=> b!163986 m!260421))

(declare-fun m!260423 () Bool)

(assert (=> b!163986 m!260423))

(declare-fun m!260425 () Bool)

(assert (=> b!163986 m!260425))

(declare-fun m!260427 () Bool)

(assert (=> b!163986 m!260427))

(declare-fun m!260429 () Bool)

(assert (=> b!163986 m!260429))

(declare-fun m!260431 () Bool)

(assert (=> b!163986 m!260431))

(declare-fun m!260433 () Bool)

(assert (=> b!163986 m!260433))

(declare-fun m!260435 () Bool)

(assert (=> b!163986 m!260435))

(declare-fun m!260437 () Bool)

(assert (=> b!163986 m!260437))

(declare-fun m!260439 () Bool)

(assert (=> b!163986 m!260439))

(assert (=> b!163986 m!260437))

(declare-fun m!260441 () Bool)

(assert (=> b!163986 m!260441))

(declare-fun m!260443 () Bool)

(assert (=> start!34570 m!260443))

(push 1)

(assert (not b!163986))

(assert (not b!163984))

(assert (not start!34570))

(assert (not b!163987))

(check-sat)

