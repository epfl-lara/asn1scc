; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34412 () Bool)

(assert start!34412)

(declare-fun b!163373 () Bool)

(declare-fun res!136123 () Bool)

(declare-fun e!112837 () Bool)

(assert (=> b!163373 (=> (not res!136123) (not e!112837))))

(declare-datatypes ((array!8127 0))(
  ( (array!8128 (arr!4561 (Array (_ BitVec 32) (_ BitVec 8))) (size!3640 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6436 0))(
  ( (BitStream!6437 (buf!4092 array!8127) (currentByte!7640 (_ BitVec 32)) (currentBit!7635 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6436)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!163373 (= res!136123 (bvsle (bvadd (currentBit!7635 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163374 () Bool)

(declare-fun e!112834 () Bool)

(declare-fun array_inv!3381 (array!8127) Bool)

(assert (=> b!163374 (= e!112834 (array_inv!3381 (buf!4092 thiss!1577)))))

(declare-fun b!163375 () Bool)

(declare-fun e!112836 () Bool)

(assert (=> b!163375 (= e!112837 (not e!112836))))

(declare-fun res!136124 () Bool)

(assert (=> b!163375 (=> res!136124 e!112836)))

(declare-fun lt!256514 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163375 (= res!136124 (not (byteRangesEq!0 (select (arr!4561 (buf!4092 thiss!1577)) (currentByte!7640 thiss!1577)) lt!256514 #b00000000000000000000000000000000 (currentBit!7635 thiss!1577))))))

(declare-fun lt!256512 () array!8127)

(declare-fun arrayRangesEq!574 (array!8127 array!8127 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163375 (arrayRangesEq!574 (buf!4092 thiss!1577) lt!256512 #b00000000000000000000000000000000 (currentByte!7640 thiss!1577))))

(declare-datatypes ((Unit!11330 0))(
  ( (Unit!11331) )
))
(declare-fun lt!256515 () Unit!11330)

(declare-fun arrayUpdatedAtPrefixLemma!182 (array!8127 (_ BitVec 32) (_ BitVec 8)) Unit!11330)

(assert (=> b!163375 (= lt!256515 (arrayUpdatedAtPrefixLemma!182 (buf!4092 thiss!1577) (currentByte!7640 thiss!1577) lt!256514))))

(assert (=> b!163375 (= lt!256512 (array!8128 (store (arr!4561 (buf!4092 thiss!1577)) (currentByte!7640 thiss!1577) lt!256514) (size!3640 (buf!4092 thiss!1577))))))

(declare-fun lt!256513 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163375 (= lt!256514 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4561 (buf!4092 thiss!1577)) (currentByte!7640 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7635 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256513)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256513))))))

(assert (=> b!163375 (= lt!256513 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7635 thiss!1577) nBits!511)))))

(declare-fun b!163377 () Bool)

(declare-fun res!136121 () Bool)

(assert (=> b!163377 (=> (not res!136121) (not e!112837))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163377 (= res!136121 (validate_offset_bits!1 ((_ sign_extend 32) (size!3640 (buf!4092 thiss!1577))) ((_ sign_extend 32) (currentByte!7640 thiss!1577)) ((_ sign_extend 32) (currentBit!7635 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163378 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163378 (= e!112836 (invariant!0 (currentBit!7635 thiss!1577) (currentByte!7640 thiss!1577) (size!3640 (buf!4092 thiss!1577))))))

(declare-fun b!163376 () Bool)

(declare-fun res!136122 () Bool)

(assert (=> b!163376 (=> res!136122 e!112836)))

(declare-datatypes ((tuple2!14504 0))(
  ( (tuple2!14505 (_1!7843 Unit!11330) (_2!7843 BitStream!6436)) )
))
(declare-fun moveBitIndex!0 (BitStream!6436 (_ BitVec 64)) tuple2!14504)

(assert (=> b!163376 (= res!136122 (not (= (size!3640 (buf!4092 thiss!1577)) (size!3640 (buf!4092 (_2!7843 (moveBitIndex!0 (BitStream!6437 lt!256512 (currentByte!7640 thiss!1577) (currentBit!7635 thiss!1577)) ((_ sign_extend 32) nBits!511))))))))))

(declare-fun res!136125 () Bool)

(assert (=> start!34412 (=> (not res!136125) (not e!112837))))

(assert (=> start!34412 (= res!136125 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34412 e!112837))

(assert (=> start!34412 true))

(declare-fun inv!12 (BitStream!6436) Bool)

(assert (=> start!34412 (and (inv!12 thiss!1577) e!112834)))

(assert (= (and start!34412 res!136125) b!163377))

(assert (= (and b!163377 res!136121) b!163373))

(assert (= (and b!163373 res!136123) b!163375))

(assert (= (and b!163375 (not res!136124)) b!163376))

(assert (= (and b!163376 (not res!136122)) b!163378))

(assert (= start!34412 b!163374))

(declare-fun m!259363 () Bool)

(assert (=> b!163375 m!259363))

(declare-fun m!259365 () Bool)

(assert (=> b!163375 m!259365))

(declare-fun m!259367 () Bool)

(assert (=> b!163375 m!259367))

(declare-fun m!259369 () Bool)

(assert (=> b!163375 m!259369))

(declare-fun m!259371 () Bool)

(assert (=> b!163375 m!259371))

(assert (=> b!163375 m!259363))

(declare-fun m!259373 () Bool)

(assert (=> b!163375 m!259373))

(declare-fun m!259375 () Bool)

(assert (=> b!163375 m!259375))

(declare-fun m!259377 () Bool)

(assert (=> b!163375 m!259377))

(declare-fun m!259379 () Bool)

(assert (=> b!163374 m!259379))

(declare-fun m!259381 () Bool)

(assert (=> b!163377 m!259381))

(declare-fun m!259383 () Bool)

(assert (=> b!163378 m!259383))

(declare-fun m!259385 () Bool)

(assert (=> start!34412 m!259385))

(declare-fun m!259387 () Bool)

(assert (=> b!163376 m!259387))

(push 1)

(assert (not b!163378))

(assert (not b!163375))

(assert (not b!163374))

(assert (not b!163376))

(assert (not start!34412))

(assert (not b!163377))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56409 () Bool)

(assert (=> d!56409 (= (array_inv!3381 (buf!4092 thiss!1577)) (bvsge (size!3640 (buf!4092 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!163374 d!56409))

(declare-fun d!56411 () Bool)

(assert (=> d!56411 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7635 thiss!1577) (currentByte!7640 thiss!1577) (size!3640 (buf!4092 thiss!1577))))))

(declare-fun bs!13965 () Bool)

(assert (= bs!13965 d!56411))

(assert (=> bs!13965 m!259383))

(assert (=> start!34412 d!56411))

(declare-fun d!56413 () Bool)

