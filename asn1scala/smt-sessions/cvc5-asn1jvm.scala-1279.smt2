; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36354 () Bool)

(assert start!36354)

(declare-fun b!167339 () Bool)

(declare-fun e!116090 () Bool)

(declare-fun e!116089 () Bool)

(assert (=> b!167339 (= e!116090 (not e!116089))))

(declare-fun res!139317 () Bool)

(assert (=> b!167339 (=> res!139317 e!116089)))

(declare-fun lt!260501 () (_ BitVec 8))

(declare-fun lt!260500 () (_ BitVec 32))

(declare-datatypes ((array!8669 0))(
  ( (array!8670 (arr!4771 (Array (_ BitVec 32) (_ BitVec 8))) (size!3850 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6856 0))(
  ( (BitStream!6857 (buf!4302 array!8669) (currentByte!8141 (_ BitVec 32)) (currentBit!8136 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6856)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167339 (= res!139317 (not (byteRangesEq!0 (select (arr!4771 (buf!4302 thiss!1577)) (currentByte!8141 thiss!1577)) lt!260501 #b00000000000000000000000000000000 lt!260500)))))

(declare-fun lt!260494 () array!8669)

(declare-fun arrayRangesEq!679 (array!8669 array!8669 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167339 (arrayRangesEq!679 (buf!4302 thiss!1577) lt!260494 #b00000000000000000000000000000000 (currentByte!8141 thiss!1577))))

(declare-fun lt!260495 () array!8669)

(declare-datatypes ((Unit!11648 0))(
  ( (Unit!11649) )
))
(declare-fun lt!260493 () Unit!11648)

(declare-fun arrayRangesEqTransitive!181 (array!8669 array!8669 array!8669 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11648)

(assert (=> b!167339 (= lt!260493 (arrayRangesEqTransitive!181 (buf!4302 thiss!1577) lt!260495 lt!260494 #b00000000000000000000000000000000 (currentByte!8141 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8141 thiss!1577))))))

(assert (=> b!167339 (arrayRangesEq!679 lt!260495 lt!260494 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8141 thiss!1577)))))

(declare-fun lt!260498 () Unit!11648)

(declare-fun lt!260503 () (_ BitVec 8))

(declare-fun arrayUpdatedAtPrefixLemma!287 (array!8669 (_ BitVec 32) (_ BitVec 8)) Unit!11648)

(assert (=> b!167339 (= lt!260498 (arrayUpdatedAtPrefixLemma!287 lt!260495 (bvadd #b00000000000000000000000000000001 (currentByte!8141 thiss!1577)) lt!260503))))

(assert (=> b!167339 (arrayRangesEq!679 (buf!4302 thiss!1577) (array!8670 (store (arr!4771 (buf!4302 thiss!1577)) (currentByte!8141 thiss!1577) lt!260501) (size!3850 (buf!4302 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8141 thiss!1577))))

(declare-fun lt!260496 () Unit!11648)

(assert (=> b!167339 (= lt!260496 (arrayUpdatedAtPrefixLemma!287 (buf!4302 thiss!1577) (currentByte!8141 thiss!1577) lt!260501))))

(declare-fun lt!260499 () (_ BitVec 32))

(assert (=> b!167339 (= lt!260501 (select (store (store (arr!4771 (buf!4302 thiss!1577)) (currentByte!8141 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4771 (buf!4302 thiss!1577)) (currentByte!8141 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8136 thiss!1577)))))))) (bvlshr (bvand lt!260499 #b00000000000000000000000011111111) lt!260500)))) (bvadd #b00000000000000000000000000000001 (currentByte!8141 thiss!1577)) lt!260503) (currentByte!8141 thiss!1577)))))

(assert (=> b!167339 (= lt!260494 (array!8670 (store (store (arr!4771 (buf!4302 thiss!1577)) (currentByte!8141 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4771 (buf!4302 thiss!1577)) (currentByte!8141 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8136 thiss!1577)))))))) (bvlshr (bvand lt!260499 #b00000000000000000000000011111111) lt!260500)))) (bvadd #b00000000000000000000000000000001 (currentByte!8141 thiss!1577)) lt!260503) (size!3850 (buf!4302 thiss!1577))))))

(declare-fun lt!260502 () (_ BitVec 32))

(assert (=> b!167339 (= lt!260503 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4771 (buf!4302 thiss!1577)) (currentByte!8141 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4771 (buf!4302 thiss!1577)) (currentByte!8141 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8136 thiss!1577)))))))) (bvlshr (bvand lt!260499 #b00000000000000000000000011111111) lt!260500)))) (bvadd #b00000000000000000000000000000001 (currentByte!8141 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260502))) (bvshl lt!260499 lt!260502))))))

(assert (=> b!167339 (= lt!260502 (bvsub #b00000000000000000000000000001000 lt!260500))))

(assert (=> b!167339 (= lt!260495 (array!8670 (store (arr!4771 (buf!4302 thiss!1577)) (currentByte!8141 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4771 (buf!4302 thiss!1577)) (currentByte!8141 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8136 thiss!1577)))))))) (bvlshr (bvand lt!260499 #b00000000000000000000000011111111) lt!260500)))) (size!3850 (buf!4302 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!167339 (= lt!260499 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167339 (= lt!260500 (bvsub (bvadd (currentBit!8136 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167340 () Bool)

(declare-fun e!116091 () Bool)

(declare-fun array_inv!3591 (array!8669) Bool)

(assert (=> b!167340 (= e!116091 (array_inv!3591 (buf!4302 thiss!1577)))))

(declare-fun b!167341 () Bool)

(declare-fun res!139316 () Bool)

(assert (=> b!167341 (=> (not res!139316) (not e!116090))))

(assert (=> b!167341 (= res!139316 (bvsgt (bvadd (currentBit!8136 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!139319 () Bool)

(assert (=> start!36354 (=> (not res!139319) (not e!116090))))

(assert (=> start!36354 (= res!139319 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36354 e!116090))

(assert (=> start!36354 true))

(declare-fun inv!12 (BitStream!6856) Bool)

(assert (=> start!36354 (and (inv!12 thiss!1577) e!116091)))

(declare-fun b!167342 () Bool)

(declare-fun res!139318 () Bool)

(assert (=> b!167342 (=> (not res!139318) (not e!116090))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167342 (= res!139318 (validate_offset_bits!1 ((_ sign_extend 32) (size!3850 (buf!4302 thiss!1577))) ((_ sign_extend 32) (currentByte!8141 thiss!1577)) ((_ sign_extend 32) (currentBit!8136 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun lt!260492 () (_ BitVec 64))

(declare-fun lt!260497 () (_ BitVec 64))

(declare-fun b!167343 () Bool)

(assert (=> b!167343 (= e!116089 (or (not (= lt!260492 (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!260492 (bvand (bvadd lt!260497 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!167343 (= lt!260492 (bvand lt!260497 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!167343 (= lt!260497 (bitIndex!0 (size!3850 (buf!4302 thiss!1577)) (currentByte!8141 thiss!1577) (currentBit!8136 thiss!1577)))))

(assert (= (and start!36354 res!139319) b!167342))

(assert (= (and b!167342 res!139318) b!167341))

(assert (= (and b!167341 res!139316) b!167339))

(assert (= (and b!167339 (not res!139317)) b!167343))

(assert (= start!36354 b!167340))

(declare-fun m!266271 () Bool)

(assert (=> start!36354 m!266271))

(declare-fun m!266273 () Bool)

(assert (=> b!167343 m!266273))

(declare-fun m!266275 () Bool)

(assert (=> b!167342 m!266275))

(declare-fun m!266277 () Bool)

(assert (=> b!167340 m!266277))

(declare-fun m!266279 () Bool)

(assert (=> b!167339 m!266279))

(declare-fun m!266281 () Bool)

(assert (=> b!167339 m!266281))

(declare-fun m!266283 () Bool)

(assert (=> b!167339 m!266283))

(declare-fun m!266285 () Bool)

(assert (=> b!167339 m!266285))

(declare-fun m!266287 () Bool)

(assert (=> b!167339 m!266287))

(declare-fun m!266289 () Bool)

(assert (=> b!167339 m!266289))

(declare-fun m!266291 () Bool)

(assert (=> b!167339 m!266291))

(declare-fun m!266293 () Bool)

(assert (=> b!167339 m!266293))

(assert (=> b!167339 m!266283))

(declare-fun m!266295 () Bool)

(assert (=> b!167339 m!266295))

(declare-fun m!266297 () Bool)

(assert (=> b!167339 m!266297))

(declare-fun m!266299 () Bool)

(assert (=> b!167339 m!266299))

(declare-fun m!266301 () Bool)

(assert (=> b!167339 m!266301))

(declare-fun m!266303 () Bool)

(assert (=> b!167339 m!266303))

(declare-fun m!266305 () Bool)

(assert (=> b!167339 m!266305))

(declare-fun m!266307 () Bool)

(assert (=> b!167339 m!266307))

(declare-fun m!266309 () Bool)

(assert (=> b!167339 m!266309))

(push 1)

(assert (not b!167339))

(assert (not b!167340))

(assert (not start!36354))

(assert (not b!167343))

(assert (not b!167342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58651 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58651 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3850 (buf!4302 thiss!1577))) ((_ sign_extend 32) (currentByte!8141 thiss!1577)) ((_ sign_extend 32) (currentBit!8136 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3850 (buf!4302 thiss!1577))) ((_ sign_extend 32) (currentByte!8141 thiss!1577)) ((_ sign_extend 32) (currentBit!8136 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14560 () Bool)

(assert (= bs!14560 d!58651))

(declare-fun m!266423 () Bool)

(assert (=> bs!14560 m!266423))

(assert (=> b!167342 d!58651))

(declare-fun d!58653 () Bool)

(assert (=> d!58653 (= (array_inv!3591 (buf!4302 thiss!1577)) (bvsge (size!3850 (buf!4302 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!167340 d!58653))

(declare-fun d!58655 () Bool)

(declare-fun res!139368 () Bool)

(declare-fun e!116137 () Bool)

(assert (=> d!58655 (=> res!139368 e!116137)))

(assert (=> d!58655 (= res!139368 (= #b00000000000000000000000000000000 (currentByte!8141 thiss!1577)))))

(assert (=> d!58655 (= (arrayRangesEq!679 (buf!4302 thiss!1577) lt!260494 #b00000000000000000000000000000000 (currentByte!8141 thiss!1577)) e!116137)))

(declare-fun b!167398 () Bool)

(declare-fun e!116138 () Bool)

(assert (=> b!167398 (= e!116137 e!116138)))

(declare-fun res!139369 () Bool)

(assert (=> b!167398 (=> (not res!139369) (not e!116138))))

(assert (=> b!167398 (= res!139369 (= (select (arr!4771 (buf!4302 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4771 lt!260494) #b00000000000000000000000000000000)))))

(declare-fun b!167399 () Bool)

(assert (=> b!167399 (= e!116138 (arrayRangesEq!679 (buf!4302 thiss!1577) lt!260494 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8141 thiss!1577)))))

(assert (= (and d!58655 (not res!139368)) b!167398))

(assert (= (and b!167398 res!139369) b!167399))

(declare-fun m!266425 () Bool)

(assert (=> b!167398 m!266425))

(declare-fun m!266427 () Bool)

(assert (=> b!167398 m!266427))

(declare-fun m!266429 () Bool)

(assert (=> b!167399 m!266429))

(assert (=> b!167339 d!58655))

(declare-fun d!58657 () Bool)

(assert (=> d!58657 (= (byteRangesEq!0 (select (arr!4771 (buf!4302 thiss!1577)) (currentByte!8141 thiss!1577)) lt!260501 #b00000000000000000000000000000000 lt!260500) (or (= #b00000000000000000000000000000000 lt!260500) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4771 (buf!4302 thiss!1577)) (currentByte!8141 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!260500))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!260501) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!260500))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14561 () Bool)

(assert (= bs!14561 d!58657))

(declare-fun m!266431 () Bool)

(assert (=> bs!14561 m!266431))

(declare-fun m!266433 () Bool)

(assert (=> bs!14561 m!266433))

(assert (=> b!167339 d!58657))

(declare-fun d!58659 () Bool)

(declare-fun e!116141 () Bool)

(assert (=> d!58659 e!116141))

(declare-fun res!139372 () Bool)

(assert (=> d!58659 (=> (not res!139372) (not e!116141))))

(assert (=> d!58659 (= res!139372 (and (bvsge (currentByte!8141 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8141 thiss!1577) (size!3850 (buf!4302 thiss!1577)))))))

(declare-fun lt!260603 () Unit!11648)

(declare-fun choose!251 (array!8669 (_ BitVec 32) (_ BitVec 8)) Unit!11648)

(assert (=> d!58659 (= lt!260603 (choose!251 (buf!4302 thiss!1577) (currentByte!8141 thiss!1577) lt!260501))))

(assert (=> d!58659 (and (bvsle #b00000000000000000000000000000000 (currentByte!8141 thiss!1577)) (bvslt (currentByte!8141 thiss!1577) (size!3850 (buf!4302 thiss!1577))))))

(assert (=> d!58659 (= (arrayUpdatedAtPrefixLemma!287 (buf!4302 thiss!1577) (currentByte!8141 thiss!1577) lt!260501) lt!260603)))

(declare-fun b!167402 () Bool)

(assert (=> b!167402 (= e!116141 (arrayRangesEq!679 (buf!4302 thiss!1577) (array!8670 (store (arr!4771 (buf!4302 thiss!1577)) (currentByte!8141 thiss!1577) lt!260501) (size!3850 (buf!4302 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8141 thiss!1577)))))

(assert (= (and d!58659 res!139372) b!167402))

(declare-fun m!266435 () Bool)

(assert (=> d!58659 m!266435))

(assert (=> b!167402 m!266287))

(assert (=> b!167402 m!266289))

(assert (=> b!167339 d!58659))

(declare-fun d!58661 () Bool)

(declare-fun res!139373 () Bool)

(declare-fun e!116142 () Bool)

(assert (=> d!58661 (=> res!139373 e!116142)))

(assert (=> d!58661 (= res!139373 (= #b00000000000000000000000000000000 (currentByte!8141 thiss!1577)))))

(assert (=> d!58661 (= (arrayRangesEq!679 (buf!4302 thiss!1577) (array!8670 (store (arr!4771 (buf!4302 thiss!1577)) (currentByte!8141 thiss!1577) lt!260501) (size!3850 (buf!4302 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8141 thiss!1577)) e!116142)))

(declare-fun b!167403 () Bool)

(declare-fun e!116143 () Bool)

(assert (=> b!167403 (= e!116142 e!116143)))

(declare-fun res!139374 () Bool)

(assert (=> b!167403 (=> (not res!139374) (not e!116143))))

(assert (=> b!167403 (= res!139374 (= (select (arr!4771 (buf!4302 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4771 (array!8670 (store (arr!4771 (buf!4302 thiss!1577)) (currentByte!8141 thiss!1577) lt!260501) (size!3850 (buf!4302 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!167404 () Bool)

(assert (=> b!167404 (= e!116143 (arrayRangesEq!679 (buf!4302 thiss!1577) (array!8670 (store (arr!4771 (buf!4302 thiss!1577)) (currentByte!8141 thiss!1577) lt!260501) (size!3850 (buf!4302 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8141 thiss!1577)))))

(assert (= (and d!58661 (not res!139373)) b!167403))

(assert (= (and b!167403 res!139374) b!167404))

(assert (=> b!167403 m!266425))

(declare-fun m!266437 () Bool)

(assert (=> b!167403 m!266437))

(declare-fun m!266439 () Bool)

(assert (=> b!167404 m!266439))

(assert (=> b!167339 d!58661))

(declare-fun d!58663 () Bool)

(declare-fun res!139375 () Bool)

(declare-fun e!116144 () Bool)

(assert (=> d!58663 (=> res!139375 e!116144)))

(assert (=> d!58663 (= res!139375 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8141 thiss!1577))))))

(assert (=> d!58663 (= (arrayRangesEq!679 lt!260495 lt!260494 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8141 thiss!1577))) e!116144)))

(declare-fun b!167405 () Bool)

(declare-fun e!116145 () Bool)

(assert (=> b!167405 (= e!116144 e!116145)))

(declare-fun res!139376 () Bool)

(assert (=> b!167405 (=> (not res!139376) (not e!116145))))

(assert (=> b!167405 (= res!139376 (= (select (arr!4771 lt!260495) #b00000000000000000000000000000000) (select (arr!4771 lt!260494) #b00000000000000000000000000000000)))))

(declare-fun b!167406 () Bool)

(assert (=> b!167406 (= e!116145 (arrayRangesEq!679 lt!260495 lt!260494 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8141 thiss!1577))))))

(assert (= (and d!58663 (not res!139375)) b!167405))

(assert (= (and b!167405 res!139376) b!167406))

(declare-fun m!266441 () Bool)

(assert (=> b!167405 m!266441))

(assert (=> b!167405 m!266427))

(declare-fun m!266443 () Bool)

(assert (=> b!167406 m!266443))

(assert (=> b!167339 d!58663))

(declare-fun d!58665 () Bool)

(assert (=> d!58665 (arrayRangesEq!679 (buf!4302 thiss!1577) lt!260494 #b00000000000000000000000000000000 (currentByte!8141 thiss!1577))))

(declare-fun lt!260606 () Unit!11648)

(declare-fun choose!252 (array!8669 array!8669 array!8669 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11648)

(assert (=> d!58665 (= lt!260606 (choose!252 (buf!4302 thiss!1577) lt!260495 lt!260494 #b00000000000000000000000000000000 (currentByte!8141 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8141 thiss!1577))))))

(assert (=> d!58665 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!8141 thiss!1577)) (bvsle (currentByte!8141 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8141 thiss!1577))))))

(assert (=> d!58665 (= (arrayRangesEqTransitive!181 (buf!4302 thiss!1577) lt!260495 lt!260494 #b00000000000000000000000000000000 (currentByte!8141 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8141 thiss!1577))) lt!260606)))

(declare-fun bs!14562 () Bool)

(assert (= bs!14562 d!58665))

(assert (=> bs!14562 m!266279))

(declare-fun m!266445 () Bool)

(assert (=> bs!14562 m!266445))

(assert (=> b!167339 d!58665))

(declare-fun d!58667 () Bool)

(declare-fun e!116146 () Bool)

(assert (=> d!58667 e!116146))

(declare-fun res!139377 () Bool)

(assert (=> d!58667 (=> (not res!139377) (not e!116146))))

(assert (=> d!58667 (= res!139377 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8141 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8141 thiss!1577)) (size!3850 lt!260495))))))

(declare-fun lt!260607 () Unit!11648)

(assert (=> d!58667 (= lt!260607 (choose!251 lt!260495 (bvadd #b00000000000000000000000000000001 (currentByte!8141 thiss!1577)) lt!260503))))

(assert (=> d!58667 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8141 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8141 thiss!1577)) (size!3850 lt!260495)))))

(assert (=> d!58667 (= (arrayUpdatedAtPrefixLemma!287 lt!260495 (bvadd #b00000000000000000000000000000001 (currentByte!8141 thiss!1577)) lt!260503) lt!260607)))

(declare-fun b!167407 () Bool)

(assert (=> b!167407 (= e!116146 (arrayRangesEq!679 lt!260495 (array!8670 (store (arr!4771 lt!260495) (bvadd #b00000000000000000000000000000001 (currentByte!8141 thiss!1577)) lt!260503) (size!3850 lt!260495)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8141 thiss!1577))))))

(assert (= (and d!58667 res!139377) b!167407))

(declare-fun m!266447 () Bool)

(assert (=> d!58667 m!266447))

(declare-fun m!266449 () Bool)

(assert (=> b!167407 m!266449))

(declare-fun m!266451 () Bool)

(assert (=> b!167407 m!266451))

(assert (=> b!167339 d!58667))

(declare-fun d!58669 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58669 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8136 thiss!1577) (currentByte!8141 thiss!1577) (size!3850 (buf!4302 thiss!1577))))))

(declare-fun bs!14563 () Bool)

(assert (= bs!14563 d!58669))

(declare-fun m!266453 () Bool)

(assert (=> bs!14563 m!266453))

(assert (=> start!36354 d!58669))

(declare-fun d!58671 () Bool)

(declare-fun e!116155 () Bool)

(assert (=> d!58671 e!116155))

(declare-fun res!139388 () Bool)

(assert (=> d!58671 (=> (not res!139388) (not e!116155))))

(declare-fun lt!260622 () (_ BitVec 64))

(declare-fun lt!260621 () (_ BitVec 64))

(declare-fun lt!260625 () (_ BitVec 64))

(assert (=> d!58671 (= res!139388 (= lt!260622 (bvsub lt!260621 lt!260625)))))

(assert (=> d!58671 (or (= (bvand lt!260621 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!260625 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!260621 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!260621 lt!260625) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58671 (= lt!260625 (remainingBits!0 ((_ sign_extend 32) (size!3850 (buf!4302 thiss!1577))) ((_ sign_extend 32) (currentByte!8141 thiss!1577)) ((_ sign_extend 32) (currentBit!8136 thiss!1577))))))

(declare-fun lt!260620 () (_ BitVec 64))

(declare-fun lt!260624 () (_ BitVec 64))

(assert (=> d!58671 (= lt!260621 (bvmul lt!260620 lt!260624))))

(assert (=> d!58671 (or (= lt!260620 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!260624 (bvsdiv (bvmul lt!260620 lt!260624) lt!260620)))))

(assert (=> d!58671 (= lt!260624 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!58671 (= lt!260620 ((_ sign_extend 32) (size!3850 (buf!4302 thiss!1577))))))

(assert (=> d!58671 (= lt!260622 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8141 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8136 thiss!1577))))))

(assert (=> d!58671 (invariant!0 (currentBit!8136 thiss!1577) (currentByte!8141 thiss!1577) (size!3850 (buf!4302 thiss!1577)))))

(assert (=> d!58671 (= (bitIndex!0 (size!3850 (buf!4302 thiss!1577)) (currentByte!8141 thiss!1577) (currentBit!8136 thiss!1577)) lt!260622)))

(declare-fun b!167418 () Bool)

(declare-fun res!139389 () Bool)

(assert (=> b!167418 (=> (not res!139389) (not e!116155))))

(assert (=> b!167418 (= res!139389 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!260622))))

(declare-fun b!167419 () Bool)

(declare-fun lt!260623 () (_ BitVec 64))

(assert (=> b!167419 (= e!116155 (bvsle lt!260622 (bvmul lt!260623 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167419 (or (= lt!260623 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!260623 #b0000000000000000000000000000000000000000000000000000000000001000) lt!260623)))))

(assert (=> b!167419 (= lt!260623 ((_ sign_extend 32) (size!3850 (buf!4302 thiss!1577))))))

(assert (= (and d!58671 res!139388) b!167418))

(assert (= (and b!167418 res!139389) b!167419))

(assert (=> d!58671 m!266423))

(assert (=> d!58671 m!266453))

(assert (=> b!167343 d!58671))

(push 1)

(assert (not d!58669))

(assert (not b!167399))

(assert (not d!58651))

(assert (not d!58659))

(assert (not b!167402))

(assert (not d!58667))

(assert (not d!58665))

(assert (not b!167404))

(assert (not b!167407))

(assert (not d!58671))

(assert (not b!167406))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

