; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34416 () Bool)

(assert start!34416)

(declare-fun res!136155 () Bool)

(declare-fun e!112858 () Bool)

(assert (=> start!34416 (=> (not res!136155) (not e!112858))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34416 (= res!136155 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34416 e!112858))

(assert (=> start!34416 true))

(declare-datatypes ((array!8131 0))(
  ( (array!8132 (arr!4563 (Array (_ BitVec 32) (_ BitVec 8))) (size!3642 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6440 0))(
  ( (BitStream!6441 (buf!4094 array!8131) (currentByte!7642 (_ BitVec 32)) (currentBit!7637 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6440)

(declare-fun e!112861 () Bool)

(declare-fun inv!12 (BitStream!6440) Bool)

(assert (=> start!34416 (and (inv!12 thiss!1577) e!112861)))

(declare-fun b!163409 () Bool)

(declare-fun e!112859 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163409 (= e!112859 (invariant!0 (currentBit!7637 thiss!1577) (currentByte!7642 thiss!1577) (size!3642 (buf!4094 thiss!1577))))))

(declare-fun b!163410 () Bool)

(declare-fun res!136151 () Bool)

(assert (=> b!163410 (=> res!136151 e!112859)))

(declare-fun lt!256539 () array!8131)

(declare-datatypes ((Unit!11334 0))(
  ( (Unit!11335) )
))
(declare-datatypes ((tuple2!14508 0))(
  ( (tuple2!14509 (_1!7845 Unit!11334) (_2!7845 BitStream!6440)) )
))
(declare-fun moveBitIndex!0 (BitStream!6440 (_ BitVec 64)) tuple2!14508)

(assert (=> b!163410 (= res!136151 (not (= (size!3642 (buf!4094 thiss!1577)) (size!3642 (buf!4094 (_2!7845 (moveBitIndex!0 (BitStream!6441 lt!256539 (currentByte!7642 thiss!1577) (currentBit!7637 thiss!1577)) ((_ sign_extend 32) nBits!511))))))))))

(declare-fun b!163411 () Bool)

(declare-fun res!136154 () Bool)

(assert (=> b!163411 (=> (not res!136154) (not e!112858))))

(assert (=> b!163411 (= res!136154 (bvsle (bvadd (currentBit!7637 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163412 () Bool)

(declare-fun array_inv!3383 (array!8131) Bool)

(assert (=> b!163412 (= e!112861 (array_inv!3383 (buf!4094 thiss!1577)))))

(declare-fun b!163413 () Bool)

(declare-fun res!136153 () Bool)

(assert (=> b!163413 (=> (not res!136153) (not e!112858))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163413 (= res!136153 (validate_offset_bits!1 ((_ sign_extend 32) (size!3642 (buf!4094 thiss!1577))) ((_ sign_extend 32) (currentByte!7642 thiss!1577)) ((_ sign_extend 32) (currentBit!7637 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163414 () Bool)

(assert (=> b!163414 (= e!112858 (not e!112859))))

(declare-fun res!136152 () Bool)

(assert (=> b!163414 (=> res!136152 e!112859)))

(declare-fun lt!256537 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163414 (= res!136152 (not (byteRangesEq!0 (select (arr!4563 (buf!4094 thiss!1577)) (currentByte!7642 thiss!1577)) lt!256537 #b00000000000000000000000000000000 (currentBit!7637 thiss!1577))))))

(declare-fun arrayRangesEq!576 (array!8131 array!8131 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163414 (arrayRangesEq!576 (buf!4094 thiss!1577) lt!256539 #b00000000000000000000000000000000 (currentByte!7642 thiss!1577))))

(declare-fun lt!256538 () Unit!11334)

(declare-fun arrayUpdatedAtPrefixLemma!184 (array!8131 (_ BitVec 32) (_ BitVec 8)) Unit!11334)

(assert (=> b!163414 (= lt!256538 (arrayUpdatedAtPrefixLemma!184 (buf!4094 thiss!1577) (currentByte!7642 thiss!1577) lt!256537))))

(assert (=> b!163414 (= lt!256539 (array!8132 (store (arr!4563 (buf!4094 thiss!1577)) (currentByte!7642 thiss!1577) lt!256537) (size!3642 (buf!4094 thiss!1577))))))

(declare-fun lt!256536 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163414 (= lt!256537 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4563 (buf!4094 thiss!1577)) (currentByte!7642 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7637 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256536)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256536))))))

(assert (=> b!163414 (= lt!256536 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7637 thiss!1577) nBits!511)))))

(assert (= (and start!34416 res!136155) b!163413))

(assert (= (and b!163413 res!136153) b!163411))

(assert (= (and b!163411 res!136154) b!163414))

(assert (= (and b!163414 (not res!136152)) b!163410))

(assert (= (and b!163410 (not res!136151)) b!163409))

(assert (= start!34416 b!163412))

(declare-fun m!259415 () Bool)

(assert (=> b!163409 m!259415))

(declare-fun m!259417 () Bool)

(assert (=> b!163410 m!259417))

(declare-fun m!259419 () Bool)

(assert (=> b!163412 m!259419))

(declare-fun m!259421 () Bool)

(assert (=> b!163413 m!259421))

(declare-fun m!259423 () Bool)

(assert (=> b!163414 m!259423))

(declare-fun m!259425 () Bool)

(assert (=> b!163414 m!259425))

(assert (=> b!163414 m!259423))

(declare-fun m!259427 () Bool)

(assert (=> b!163414 m!259427))

(declare-fun m!259429 () Bool)

(assert (=> b!163414 m!259429))

(declare-fun m!259431 () Bool)

(assert (=> b!163414 m!259431))

(declare-fun m!259433 () Bool)

(assert (=> b!163414 m!259433))

(declare-fun m!259435 () Bool)

(assert (=> b!163414 m!259435))

(declare-fun m!259437 () Bool)

(assert (=> b!163414 m!259437))

(declare-fun m!259439 () Bool)

(assert (=> start!34416 m!259439))

(push 1)

(assert (not b!163412))

(assert (not b!163409))

(assert (not start!34416))

(assert (not b!163414))

(assert (not b!163410))

(assert (not b!163413))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

