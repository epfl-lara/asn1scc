; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34576 () Bool)

(assert start!34576)

(declare-fun res!136664 () Bool)

(declare-fun e!113295 () Bool)

(assert (=> start!34576 (=> (not res!136664) (not e!113295))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34576 (= res!136664 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34576 e!113295))

(assert (=> start!34576 true))

(declare-datatypes ((array!8191 0))(
  ( (array!8192 (arr!4590 (Array (_ BitVec 32) (_ BitVec 8))) (size!3669 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6494 0))(
  ( (BitStream!6495 (buf!4121 array!8191) (currentByte!7680 (_ BitVec 32)) (currentBit!7675 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6494)

(declare-fun e!113294 () Bool)

(declare-fun inv!12 (BitStream!6494) Bool)

(assert (=> start!34576 (and (inv!12 thiss!1577) e!113294)))

(declare-fun b!164020 () Bool)

(declare-fun res!136665 () Bool)

(assert (=> b!164020 (=> (not res!136665) (not e!113295))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164020 (= res!136665 (validate_offset_bits!1 ((_ sign_extend 32) (size!3669 (buf!4121 thiss!1577))) ((_ sign_extend 32) (currentByte!7680 thiss!1577)) ((_ sign_extend 32) (currentBit!7675 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164022 () Bool)

(assert (=> b!164022 (= e!113295 (not true))))

(declare-fun lt!257425 () (_ BitVec 8))

(declare-fun lt!257427 () (_ BitVec 32))

(declare-fun lt!257429 () (_ BitVec 32))

(declare-fun lt!257424 () array!8191)

(declare-fun arrayRangesEq!603 (array!8191 array!8191 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164022 (arrayRangesEq!603 lt!257424 (array!8192 (store (store (arr!4590 (buf!4121 thiss!1577)) (currentByte!7680 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4590 (buf!4121 thiss!1577)) (currentByte!7680 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7675 thiss!1577)))))))) (bvlshr (bvand lt!257427 #b00000000000000000000000011111111) lt!257429)))) (bvadd #b00000000000000000000000000000001 (currentByte!7680 thiss!1577)) lt!257425) (size!3669 (buf!4121 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7680 thiss!1577)))))

(declare-datatypes ((Unit!11415 0))(
  ( (Unit!11416) )
))
(declare-fun lt!257430 () Unit!11415)

(declare-fun arrayUpdatedAtPrefixLemma!211 (array!8191 (_ BitVec 32) (_ BitVec 8)) Unit!11415)

(assert (=> b!164022 (= lt!257430 (arrayUpdatedAtPrefixLemma!211 lt!257424 (bvadd #b00000000000000000000000000000001 (currentByte!7680 thiss!1577)) lt!257425))))

(assert (=> b!164022 (arrayRangesEq!603 (buf!4121 thiss!1577) (array!8192 (store (arr!4590 (buf!4121 thiss!1577)) (currentByte!7680 thiss!1577) (select (store (store (arr!4590 (buf!4121 thiss!1577)) (currentByte!7680 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4590 (buf!4121 thiss!1577)) (currentByte!7680 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7675 thiss!1577)))))))) (bvlshr (bvand lt!257427 #b00000000000000000000000011111111) lt!257429)))) (bvadd #b00000000000000000000000000000001 (currentByte!7680 thiss!1577)) lt!257425) (currentByte!7680 thiss!1577))) (size!3669 (buf!4121 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7680 thiss!1577))))

(declare-fun lt!257428 () Unit!11415)

(assert (=> b!164022 (= lt!257428 (arrayUpdatedAtPrefixLemma!211 (buf!4121 thiss!1577) (currentByte!7680 thiss!1577) (select (store (store (arr!4590 (buf!4121 thiss!1577)) (currentByte!7680 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4590 (buf!4121 thiss!1577)) (currentByte!7680 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7675 thiss!1577)))))))) (bvlshr (bvand lt!257427 #b00000000000000000000000011111111) lt!257429)))) (bvadd #b00000000000000000000000000000001 (currentByte!7680 thiss!1577)) lt!257425) (currentByte!7680 thiss!1577))))))

(declare-fun lt!257426 () (_ BitVec 32))

(assert (=> b!164022 (= lt!257425 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4590 (buf!4121 thiss!1577)) (currentByte!7680 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4590 (buf!4121 thiss!1577)) (currentByte!7680 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7675 thiss!1577)))))))) (bvlshr (bvand lt!257427 #b00000000000000000000000011111111) lt!257429)))) (bvadd #b00000000000000000000000000000001 (currentByte!7680 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257426))) (bvshl lt!257427 lt!257426))))))

(assert (=> b!164022 (= lt!257426 (bvsub #b00000000000000000000000000001000 lt!257429))))

(assert (=> b!164022 (= lt!257424 (array!8192 (store (arr!4590 (buf!4121 thiss!1577)) (currentByte!7680 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4590 (buf!4121 thiss!1577)) (currentByte!7680 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7675 thiss!1577)))))))) (bvlshr (bvand lt!257427 #b00000000000000000000000011111111) lt!257429)))) (size!3669 (buf!4121 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164022 (= lt!257427 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164022 (= lt!257429 (bvsub (bvadd (currentBit!7675 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164023 () Bool)

(declare-fun array_inv!3410 (array!8191) Bool)

(assert (=> b!164023 (= e!113294 (array_inv!3410 (buf!4121 thiss!1577)))))

(declare-fun b!164021 () Bool)

(declare-fun res!136663 () Bool)

(assert (=> b!164021 (=> (not res!136663) (not e!113295))))

(assert (=> b!164021 (= res!136663 (bvsgt (bvadd (currentBit!7675 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!34576 res!136664) b!164020))

(assert (= (and b!164020 res!136665) b!164021))

(assert (= (and b!164021 res!136663) b!164022))

(assert (= start!34576 b!164023))

(declare-fun m!260509 () Bool)

(assert (=> start!34576 m!260509))

(declare-fun m!260511 () Bool)

(assert (=> b!164020 m!260511))

(declare-fun m!260513 () Bool)

(assert (=> b!164022 m!260513))

(declare-fun m!260515 () Bool)

(assert (=> b!164022 m!260515))

(declare-fun m!260517 () Bool)

(assert (=> b!164022 m!260517))

(declare-fun m!260519 () Bool)

(assert (=> b!164022 m!260519))

(declare-fun m!260521 () Bool)

(assert (=> b!164022 m!260521))

(declare-fun m!260523 () Bool)

(assert (=> b!164022 m!260523))

(declare-fun m!260525 () Bool)

(assert (=> b!164022 m!260525))

(declare-fun m!260527 () Bool)

(assert (=> b!164022 m!260527))

(declare-fun m!260529 () Bool)

(assert (=> b!164022 m!260529))

(declare-fun m!260531 () Bool)

(assert (=> b!164022 m!260531))

(declare-fun m!260533 () Bool)

(assert (=> b!164022 m!260533))

(declare-fun m!260535 () Bool)

(assert (=> b!164022 m!260535))

(declare-fun m!260537 () Bool)

(assert (=> b!164022 m!260537))

(assert (=> b!164022 m!260515))

(declare-fun m!260539 () Bool)

(assert (=> b!164023 m!260539))

(push 1)

(assert (not start!34576))

(assert (not b!164020))

