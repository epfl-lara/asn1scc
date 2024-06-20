; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34414 () Bool)

(assert start!34414)

(declare-fun b!163391 () Bool)

(declare-fun e!112847 () Bool)

(declare-datatypes ((array!8129 0))(
  ( (array!8130 (arr!4562 (Array (_ BitVec 32) (_ BitVec 8))) (size!3641 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6438 0))(
  ( (BitStream!6439 (buf!4093 array!8129) (currentByte!7641 (_ BitVec 32)) (currentBit!7636 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6438)

(declare-fun array_inv!3382 (array!8129) Bool)

(assert (=> b!163391 (= e!112847 (array_inv!3382 (buf!4093 thiss!1577)))))

(declare-fun b!163392 () Bool)

(declare-fun e!112846 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163392 (= e!112846 (invariant!0 (currentBit!7636 thiss!1577) (currentByte!7641 thiss!1577) (size!3641 (buf!4093 thiss!1577))))))

(declare-fun b!163393 () Bool)

(declare-fun res!136138 () Bool)

(declare-fun e!112849 () Bool)

(assert (=> b!163393 (=> (not res!136138) (not e!112849))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!163393 (= res!136138 (bvsle (bvadd (currentBit!7636 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163394 () Bool)

(declare-fun res!136140 () Bool)

(assert (=> b!163394 (=> (not res!136140) (not e!112849))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163394 (= res!136140 (validate_offset_bits!1 ((_ sign_extend 32) (size!3641 (buf!4093 thiss!1577))) ((_ sign_extend 32) (currentByte!7641 thiss!1577)) ((_ sign_extend 32) (currentBit!7636 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163395 () Bool)

(declare-fun res!136137 () Bool)

(assert (=> b!163395 (=> res!136137 e!112846)))

(declare-fun lt!256527 () array!8129)

(declare-datatypes ((Unit!11332 0))(
  ( (Unit!11333) )
))
(declare-datatypes ((tuple2!14506 0))(
  ( (tuple2!14507 (_1!7844 Unit!11332) (_2!7844 BitStream!6438)) )
))
(declare-fun moveBitIndex!0 (BitStream!6438 (_ BitVec 64)) tuple2!14506)

(assert (=> b!163395 (= res!136137 (not (= (size!3641 (buf!4093 thiss!1577)) (size!3641 (buf!4093 (_2!7844 (moveBitIndex!0 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577)) ((_ sign_extend 32) nBits!511))))))))))

(declare-fun b!163396 () Bool)

(assert (=> b!163396 (= e!112849 (not e!112846))))

(declare-fun res!136139 () Bool)

(assert (=> b!163396 (=> res!136139 e!112846)))

(declare-fun lt!256526 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163396 (= res!136139 (not (byteRangesEq!0 (select (arr!4562 (buf!4093 thiss!1577)) (currentByte!7641 thiss!1577)) lt!256526 #b00000000000000000000000000000000 (currentBit!7636 thiss!1577))))))

(declare-fun arrayRangesEq!575 (array!8129 array!8129 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163396 (arrayRangesEq!575 (buf!4093 thiss!1577) lt!256527 #b00000000000000000000000000000000 (currentByte!7641 thiss!1577))))

(declare-fun lt!256525 () Unit!11332)

(declare-fun arrayUpdatedAtPrefixLemma!183 (array!8129 (_ BitVec 32) (_ BitVec 8)) Unit!11332)

(assert (=> b!163396 (= lt!256525 (arrayUpdatedAtPrefixLemma!183 (buf!4093 thiss!1577) (currentByte!7641 thiss!1577) lt!256526))))

(assert (=> b!163396 (= lt!256527 (array!8130 (store (arr!4562 (buf!4093 thiss!1577)) (currentByte!7641 thiss!1577) lt!256526) (size!3641 (buf!4093 thiss!1577))))))

(declare-fun lt!256524 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163396 (= lt!256526 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4562 (buf!4093 thiss!1577)) (currentByte!7641 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7636 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256524)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256524))))))

(assert (=> b!163396 (= lt!256524 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7636 thiss!1577) nBits!511)))))

(declare-fun res!136136 () Bool)

(assert (=> start!34414 (=> (not res!136136) (not e!112849))))

(assert (=> start!34414 (= res!136136 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34414 e!112849))

(assert (=> start!34414 true))

(declare-fun inv!12 (BitStream!6438) Bool)

(assert (=> start!34414 (and (inv!12 thiss!1577) e!112847)))

(assert (= (and start!34414 res!136136) b!163394))

(assert (= (and b!163394 res!136140) b!163393))

(assert (= (and b!163393 res!136138) b!163396))

(assert (= (and b!163396 (not res!136139)) b!163395))

(assert (= (and b!163395 (not res!136137)) b!163392))

(assert (= start!34414 b!163391))

(declare-fun m!259389 () Bool)

(assert (=> b!163396 m!259389))

(declare-fun m!259391 () Bool)

(assert (=> b!163396 m!259391))

(declare-fun m!259393 () Bool)

(assert (=> b!163396 m!259393))

(assert (=> b!163396 m!259391))

(declare-fun m!259395 () Bool)

(assert (=> b!163396 m!259395))

(declare-fun m!259397 () Bool)

(assert (=> b!163396 m!259397))

(declare-fun m!259399 () Bool)

(assert (=> b!163396 m!259399))

(declare-fun m!259401 () Bool)

(assert (=> b!163396 m!259401))

(declare-fun m!259403 () Bool)

(assert (=> b!163396 m!259403))

(declare-fun m!259405 () Bool)

(assert (=> start!34414 m!259405))

(declare-fun m!259407 () Bool)

(assert (=> b!163394 m!259407))

(declare-fun m!259409 () Bool)

(assert (=> b!163391 m!259409))

(declare-fun m!259411 () Bool)

(assert (=> b!163395 m!259411))

(declare-fun m!259413 () Bool)

(assert (=> b!163392 m!259413))

(check-sat (not b!163394) (not b!163396) (not start!34414) (not b!163392) (not b!163395) (not b!163391))
(check-sat)
(get-model)

(declare-fun d!56397 () Bool)

(assert (=> d!56397 (= (byteRangesEq!0 (select (arr!4562 (buf!4093 thiss!1577)) (currentByte!7641 thiss!1577)) lt!256526 #b00000000000000000000000000000000 (currentBit!7636 thiss!1577)) (or (= #b00000000000000000000000000000000 (currentBit!7636 thiss!1577)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4562 (buf!4093 thiss!1577)) (currentByte!7641 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7636 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!256526) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7636 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13964 () Bool)

(assert (= bs!13964 d!56397))

(declare-fun m!259441 () Bool)

(assert (=> bs!13964 m!259441))

(declare-fun m!259443 () Bool)

(assert (=> bs!13964 m!259443))

(assert (=> b!163396 d!56397))

(declare-fun d!56399 () Bool)

(declare-fun res!136160 () Bool)

(declare-fun e!112866 () Bool)

(assert (=> d!56399 (=> res!136160 e!112866)))

(assert (=> d!56399 (= res!136160 (= #b00000000000000000000000000000000 (currentByte!7641 thiss!1577)))))

(assert (=> d!56399 (= (arrayRangesEq!575 (buf!4093 thiss!1577) lt!256527 #b00000000000000000000000000000000 (currentByte!7641 thiss!1577)) e!112866)))

(declare-fun b!163419 () Bool)

(declare-fun e!112867 () Bool)

(assert (=> b!163419 (= e!112866 e!112867)))

(declare-fun res!136161 () Bool)

(assert (=> b!163419 (=> (not res!136161) (not e!112867))))

(assert (=> b!163419 (= res!136161 (= (select (arr!4562 (buf!4093 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4562 lt!256527) #b00000000000000000000000000000000)))))

(declare-fun b!163420 () Bool)

(assert (=> b!163420 (= e!112867 (arrayRangesEq!575 (buf!4093 thiss!1577) lt!256527 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7641 thiss!1577)))))

(assert (= (and d!56399 (not res!136160)) b!163419))

(assert (= (and b!163419 res!136161) b!163420))

(declare-fun m!259445 () Bool)

(assert (=> b!163419 m!259445))

(declare-fun m!259447 () Bool)

(assert (=> b!163419 m!259447))

(declare-fun m!259449 () Bool)

(assert (=> b!163420 m!259449))

(assert (=> b!163396 d!56399))

(declare-fun d!56401 () Bool)

(declare-fun e!112870 () Bool)

(assert (=> d!56401 e!112870))

(declare-fun res!136164 () Bool)

(assert (=> d!56401 (=> (not res!136164) (not e!112870))))

(assert (=> d!56401 (= res!136164 (and (bvsge (currentByte!7641 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7641 thiss!1577) (size!3641 (buf!4093 thiss!1577)))))))

(declare-fun lt!256542 () Unit!11332)

(declare-fun choose!191 (array!8129 (_ BitVec 32) (_ BitVec 8)) Unit!11332)

(assert (=> d!56401 (= lt!256542 (choose!191 (buf!4093 thiss!1577) (currentByte!7641 thiss!1577) lt!256526))))

(assert (=> d!56401 (and (bvsle #b00000000000000000000000000000000 (currentByte!7641 thiss!1577)) (bvslt (currentByte!7641 thiss!1577) (size!3641 (buf!4093 thiss!1577))))))

(assert (=> d!56401 (= (arrayUpdatedAtPrefixLemma!183 (buf!4093 thiss!1577) (currentByte!7641 thiss!1577) lt!256526) lt!256542)))

(declare-fun b!163423 () Bool)

(assert (=> b!163423 (= e!112870 (arrayRangesEq!575 (buf!4093 thiss!1577) (array!8130 (store (arr!4562 (buf!4093 thiss!1577)) (currentByte!7641 thiss!1577) lt!256526) (size!3641 (buf!4093 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7641 thiss!1577)))))

(assert (= (and d!56401 res!136164) b!163423))

(declare-fun m!259451 () Bool)

(assert (=> d!56401 m!259451))

(assert (=> b!163423 m!259393))

(declare-fun m!259453 () Bool)

(assert (=> b!163423 m!259453))

(assert (=> b!163396 d!56401))

(declare-fun d!56403 () Bool)

(assert (=> d!56403 (= (array_inv!3382 (buf!4093 thiss!1577)) (bvsge (size!3641 (buf!4093 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!163391 d!56403))

(declare-fun d!56405 () Bool)

(declare-fun lt!256562 () (_ BitVec 32))

(assert (=> d!56405 (= lt!256562 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!256563 () (_ BitVec 32))

(assert (=> d!56405 (= lt!256563 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!112884 () Bool)

(assert (=> d!56405 e!112884))

(declare-fun res!136178 () Bool)

(assert (=> d!56405 (=> (not res!136178) (not e!112884))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6438 (_ BitVec 64)) Bool)

(assert (=> d!56405 (= res!136178 (moveBitIndexPrecond!0 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun Unit!11336 () Unit!11332)

(declare-fun Unit!11337 () Unit!11332)

(declare-fun Unit!11338 () Unit!11332)

(assert (=> d!56405 (= (moveBitIndex!0 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577)) ((_ sign_extend 32) nBits!511)) (ite (bvslt (bvadd (currentBit!7636 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) lt!256562) #b00000000000000000000000000000000) (tuple2!14507 Unit!11336 (BitStream!6439 (buf!4093 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) (bvsub (bvadd (currentByte!7641 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) lt!256563) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!256562 (currentBit!7636 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7636 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) lt!256562) #b00000000000000000000000000001000) (tuple2!14507 Unit!11337 (BitStream!6439 (buf!4093 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) (bvadd (currentByte!7641 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) lt!256563 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7636 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) lt!256562) #b00000000000000000000000000001000))) (tuple2!14507 Unit!11338 (BitStream!6439 (buf!4093 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) (bvadd (currentByte!7641 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) lt!256563) (bvadd (currentBit!7636 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) lt!256562))))))))

(declare-fun b!163437 () Bool)

(declare-fun e!112885 () Bool)

(assert (=> b!163437 (= e!112884 e!112885)))

(declare-fun res!136179 () Bool)

(assert (=> b!163437 (=> (not res!136179) (not e!112885))))

(declare-fun lt!256561 () tuple2!14506)

(declare-fun lt!256560 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!163437 (= res!136179 (= (bvadd lt!256560 ((_ sign_extend 32) nBits!511)) (bitIndex!0 (size!3641 (buf!4093 (_2!7844 lt!256561))) (currentByte!7641 (_2!7844 lt!256561)) (currentBit!7636 (_2!7844 lt!256561)))))))

(assert (=> b!163437 (or (not (= (bvand lt!256560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!256560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!256560 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!163437 (= lt!256560 (bitIndex!0 (size!3641 (buf!4093 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577)))) (currentByte!7641 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) (currentBit!7636 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577)))))))

(declare-fun lt!256558 () (_ BitVec 32))

(declare-fun lt!256559 () (_ BitVec 32))

(declare-fun Unit!11339 () Unit!11332)

(declare-fun Unit!11340 () Unit!11332)

(declare-fun Unit!11341 () Unit!11332)

(assert (=> b!163437 (= lt!256561 (ite (bvslt (bvadd (currentBit!7636 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) lt!256558) #b00000000000000000000000000000000) (tuple2!14507 Unit!11339 (BitStream!6439 (buf!4093 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) (bvsub (bvadd (currentByte!7641 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) lt!256559) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!256558 (currentBit!7636 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7636 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) lt!256558) #b00000000000000000000000000001000) (tuple2!14507 Unit!11340 (BitStream!6439 (buf!4093 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) (bvadd (currentByte!7641 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) lt!256559 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7636 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) lt!256558) #b00000000000000000000000000001000))) (tuple2!14507 Unit!11341 (BitStream!6439 (buf!4093 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) (bvadd (currentByte!7641 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) lt!256559) (bvadd (currentBit!7636 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) lt!256558))))))))

(assert (=> b!163437 (= lt!256558 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163437 (= lt!256559 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!163438 () Bool)

(assert (=> b!163438 (= e!112885 (and (= (size!3641 (buf!4093 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577)))) (size!3641 (buf!4093 (_2!7844 lt!256561)))) (= (buf!4093 (BitStream!6439 lt!256527 (currentByte!7641 thiss!1577) (currentBit!7636 thiss!1577))) (buf!4093 (_2!7844 lt!256561)))))))

(assert (= (and d!56405 res!136178) b!163437))

(assert (= (and b!163437 res!136179) b!163438))

(declare-fun m!259473 () Bool)

(assert (=> d!56405 m!259473))

(declare-fun m!259475 () Bool)

(assert (=> b!163437 m!259475))

(declare-fun m!259477 () Bool)

(assert (=> b!163437 m!259477))

(assert (=> b!163395 d!56405))

(declare-fun d!56435 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56435 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3641 (buf!4093 thiss!1577))) ((_ sign_extend 32) (currentByte!7641 thiss!1577)) ((_ sign_extend 32) (currentBit!7636 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3641 (buf!4093 thiss!1577))) ((_ sign_extend 32) (currentByte!7641 thiss!1577)) ((_ sign_extend 32) (currentBit!7636 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!13969 () Bool)

(assert (= bs!13969 d!56435))

(declare-fun m!259479 () Bool)

(assert (=> bs!13969 m!259479))

(assert (=> b!163394 d!56435))

(declare-fun d!56437 () Bool)

(assert (=> d!56437 (= (invariant!0 (currentBit!7636 thiss!1577) (currentByte!7641 thiss!1577) (size!3641 (buf!4093 thiss!1577))) (and (bvsge (currentBit!7636 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7636 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7641 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7641 thiss!1577) (size!3641 (buf!4093 thiss!1577))) (and (= (currentBit!7636 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7641 thiss!1577) (size!3641 (buf!4093 thiss!1577)))))))))

(assert (=> b!163392 d!56437))

(declare-fun d!56439 () Bool)

(assert (=> d!56439 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7636 thiss!1577) (currentByte!7641 thiss!1577) (size!3641 (buf!4093 thiss!1577))))))

(declare-fun bs!13970 () Bool)

(assert (= bs!13970 d!56439))

(assert (=> bs!13970 m!259413))

(assert (=> start!34414 d!56439))

(check-sat (not d!56401) (not d!56439) (not d!56405) (not d!56435) (not b!163437) (not b!163423) (not b!163420))
(check-sat)
