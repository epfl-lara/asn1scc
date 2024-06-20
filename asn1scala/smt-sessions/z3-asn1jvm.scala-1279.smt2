; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36356 () Bool)

(assert start!36356)

(declare-fun res!139331 () Bool)

(declare-fun e!116103 () Bool)

(assert (=> start!36356 (=> (not res!139331) (not e!116103))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!36356 (= res!139331 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36356 e!116103))

(assert (=> start!36356 true))

(declare-datatypes ((array!8671 0))(
  ( (array!8672 (arr!4772 (Array (_ BitVec 32) (_ BitVec 8))) (size!3851 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6858 0))(
  ( (BitStream!6859 (buf!4303 array!8671) (currentByte!8142 (_ BitVec 32)) (currentBit!8137 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6858)

(declare-fun e!116101 () Bool)

(declare-fun inv!12 (BitStream!6858) Bool)

(assert (=> start!36356 (and (inv!12 thiss!1577) e!116101)))

(declare-fun b!167354 () Bool)

(declare-fun res!139330 () Bool)

(assert (=> b!167354 (=> (not res!139330) (not e!116103))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167354 (= res!139330 (validate_offset_bits!1 ((_ sign_extend 32) (size!3851 (buf!4303 thiss!1577))) ((_ sign_extend 32) (currentByte!8142 thiss!1577)) ((_ sign_extend 32) (currentBit!8137 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun lt!260538 () (_ BitVec 64))

(declare-fun e!116100 () Bool)

(declare-fun b!167355 () Bool)

(declare-fun lt!260529 () (_ BitVec 64))

(assert (=> b!167355 (= e!116100 (or (not (= lt!260538 (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!260538 (bvand (bvadd lt!260529 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!167355 (= lt!260538 (bvand lt!260529 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!167355 (= lt!260529 (bitIndex!0 (size!3851 (buf!4303 thiss!1577)) (currentByte!8142 thiss!1577) (currentBit!8137 thiss!1577)))))

(declare-fun b!167356 () Bool)

(declare-fun array_inv!3592 (array!8671) Bool)

(assert (=> b!167356 (= e!116101 (array_inv!3592 (buf!4303 thiss!1577)))))

(declare-fun b!167357 () Bool)

(declare-fun res!139329 () Bool)

(assert (=> b!167357 (=> (not res!139329) (not e!116103))))

(assert (=> b!167357 (= res!139329 (bvsgt (bvadd (currentBit!8137 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167358 () Bool)

(assert (=> b!167358 (= e!116103 (not e!116100))))

(declare-fun res!139328 () Bool)

(assert (=> b!167358 (=> res!139328 e!116100)))

(declare-fun lt!260537 () (_ BitVec 32))

(declare-fun lt!260534 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167358 (= res!139328 (not (byteRangesEq!0 (select (arr!4772 (buf!4303 thiss!1577)) (currentByte!8142 thiss!1577)) lt!260534 #b00000000000000000000000000000000 lt!260537)))))

(declare-fun lt!260536 () array!8671)

(declare-fun arrayRangesEq!680 (array!8671 array!8671 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167358 (arrayRangesEq!680 (buf!4303 thiss!1577) lt!260536 #b00000000000000000000000000000000 (currentByte!8142 thiss!1577))))

(declare-fun lt!260531 () array!8671)

(declare-datatypes ((Unit!11650 0))(
  ( (Unit!11651) )
))
(declare-fun lt!260533 () Unit!11650)

(declare-fun arrayRangesEqTransitive!182 (array!8671 array!8671 array!8671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11650)

(assert (=> b!167358 (= lt!260533 (arrayRangesEqTransitive!182 (buf!4303 thiss!1577) lt!260531 lt!260536 #b00000000000000000000000000000000 (currentByte!8142 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8142 thiss!1577))))))

(assert (=> b!167358 (arrayRangesEq!680 lt!260531 lt!260536 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8142 thiss!1577)))))

(declare-fun lt!260539 () (_ BitVec 8))

(declare-fun lt!260535 () Unit!11650)

(declare-fun arrayUpdatedAtPrefixLemma!288 (array!8671 (_ BitVec 32) (_ BitVec 8)) Unit!11650)

(assert (=> b!167358 (= lt!260535 (arrayUpdatedAtPrefixLemma!288 lt!260531 (bvadd #b00000000000000000000000000000001 (currentByte!8142 thiss!1577)) lt!260539))))

(assert (=> b!167358 (arrayRangesEq!680 (buf!4303 thiss!1577) (array!8672 (store (arr!4772 (buf!4303 thiss!1577)) (currentByte!8142 thiss!1577) lt!260534) (size!3851 (buf!4303 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8142 thiss!1577))))

(declare-fun lt!260532 () Unit!11650)

(assert (=> b!167358 (= lt!260532 (arrayUpdatedAtPrefixLemma!288 (buf!4303 thiss!1577) (currentByte!8142 thiss!1577) lt!260534))))

(declare-fun lt!260530 () (_ BitVec 32))

(assert (=> b!167358 (= lt!260534 (select (store (store (arr!4772 (buf!4303 thiss!1577)) (currentByte!8142 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4772 (buf!4303 thiss!1577)) (currentByte!8142 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8137 thiss!1577)))))))) (bvlshr (bvand lt!260530 #b00000000000000000000000011111111) lt!260537)))) (bvadd #b00000000000000000000000000000001 (currentByte!8142 thiss!1577)) lt!260539) (currentByte!8142 thiss!1577)))))

(assert (=> b!167358 (= lt!260536 (array!8672 (store (store (arr!4772 (buf!4303 thiss!1577)) (currentByte!8142 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4772 (buf!4303 thiss!1577)) (currentByte!8142 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8137 thiss!1577)))))))) (bvlshr (bvand lt!260530 #b00000000000000000000000011111111) lt!260537)))) (bvadd #b00000000000000000000000000000001 (currentByte!8142 thiss!1577)) lt!260539) (size!3851 (buf!4303 thiss!1577))))))

(declare-fun lt!260528 () (_ BitVec 32))

(assert (=> b!167358 (= lt!260539 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4772 (buf!4303 thiss!1577)) (currentByte!8142 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4772 (buf!4303 thiss!1577)) (currentByte!8142 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8137 thiss!1577)))))))) (bvlshr (bvand lt!260530 #b00000000000000000000000011111111) lt!260537)))) (bvadd #b00000000000000000000000000000001 (currentByte!8142 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260528))) (bvshl lt!260530 lt!260528))))))

(assert (=> b!167358 (= lt!260528 (bvsub #b00000000000000000000000000001000 lt!260537))))

(assert (=> b!167358 (= lt!260531 (array!8672 (store (arr!4772 (buf!4303 thiss!1577)) (currentByte!8142 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4772 (buf!4303 thiss!1577)) (currentByte!8142 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8137 thiss!1577)))))))) (bvlshr (bvand lt!260530 #b00000000000000000000000011111111) lt!260537)))) (size!3851 (buf!4303 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!167358 (= lt!260530 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167358 (= lt!260537 (bvsub (bvadd (currentBit!8137 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!36356 res!139331) b!167354))

(assert (= (and b!167354 res!139330) b!167357))

(assert (= (and b!167357 res!139329) b!167358))

(assert (= (and b!167358 (not res!139328)) b!167355))

(assert (= start!36356 b!167356))

(declare-fun m!266311 () Bool)

(assert (=> b!167356 m!266311))

(declare-fun m!266313 () Bool)

(assert (=> b!167354 m!266313))

(declare-fun m!266315 () Bool)

(assert (=> b!167355 m!266315))

(declare-fun m!266317 () Bool)

(assert (=> b!167358 m!266317))

(declare-fun m!266319 () Bool)

(assert (=> b!167358 m!266319))

(declare-fun m!266321 () Bool)

(assert (=> b!167358 m!266321))

(declare-fun m!266323 () Bool)

(assert (=> b!167358 m!266323))

(assert (=> b!167358 m!266321))

(declare-fun m!266325 () Bool)

(assert (=> b!167358 m!266325))

(declare-fun m!266327 () Bool)

(assert (=> b!167358 m!266327))

(declare-fun m!266329 () Bool)

(assert (=> b!167358 m!266329))

(declare-fun m!266331 () Bool)

(assert (=> b!167358 m!266331))

(declare-fun m!266333 () Bool)

(assert (=> b!167358 m!266333))

(declare-fun m!266335 () Bool)

(assert (=> b!167358 m!266335))

(declare-fun m!266337 () Bool)

(assert (=> b!167358 m!266337))

(declare-fun m!266339 () Bool)

(assert (=> b!167358 m!266339))

(declare-fun m!266341 () Bool)

(assert (=> b!167358 m!266341))

(declare-fun m!266343 () Bool)

(assert (=> b!167358 m!266343))

(declare-fun m!266345 () Bool)

(assert (=> b!167358 m!266345))

(declare-fun m!266347 () Bool)

(assert (=> b!167358 m!266347))

(declare-fun m!266349 () Bool)

(assert (=> start!36356 m!266349))

(check-sat (not b!167354) (not b!167358) (not start!36356) (not b!167356) (not b!167355))
(check-sat)
(get-model)

(declare-fun d!58629 () Bool)

(declare-fun res!139348 () Bool)

(declare-fun e!116120 () Bool)

(assert (=> d!58629 (=> res!139348 e!116120)))

(assert (=> d!58629 (= res!139348 (= #b00000000000000000000000000000000 (currentByte!8142 thiss!1577)))))

(assert (=> d!58629 (= (arrayRangesEq!680 (buf!4303 thiss!1577) (array!8672 (store (arr!4772 (buf!4303 thiss!1577)) (currentByte!8142 thiss!1577) lt!260534) (size!3851 (buf!4303 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8142 thiss!1577)) e!116120)))

(declare-fun b!167378 () Bool)

(declare-fun e!116121 () Bool)

(assert (=> b!167378 (= e!116120 e!116121)))

(declare-fun res!139349 () Bool)

(assert (=> b!167378 (=> (not res!139349) (not e!116121))))

(assert (=> b!167378 (= res!139349 (= (select (arr!4772 (buf!4303 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4772 (array!8672 (store (arr!4772 (buf!4303 thiss!1577)) (currentByte!8142 thiss!1577) lt!260534) (size!3851 (buf!4303 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!167379 () Bool)

(assert (=> b!167379 (= e!116121 (arrayRangesEq!680 (buf!4303 thiss!1577) (array!8672 (store (arr!4772 (buf!4303 thiss!1577)) (currentByte!8142 thiss!1577) lt!260534) (size!3851 (buf!4303 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8142 thiss!1577)))))

(assert (= (and d!58629 (not res!139348)) b!167378))

(assert (= (and b!167378 res!139349) b!167379))

(declare-fun m!266391 () Bool)

(assert (=> b!167378 m!266391))

(declare-fun m!266393 () Bool)

(assert (=> b!167378 m!266393))

(declare-fun m!266395 () Bool)

(assert (=> b!167379 m!266395))

(assert (=> b!167358 d!58629))

(declare-fun d!58631 () Bool)

(declare-fun e!116124 () Bool)

(assert (=> d!58631 e!116124))

(declare-fun res!139352 () Bool)

(assert (=> d!58631 (=> (not res!139352) (not e!116124))))

(assert (=> d!58631 (= res!139352 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8142 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8142 thiss!1577)) (size!3851 lt!260531))))))

(declare-fun lt!260578 () Unit!11650)

(declare-fun choose!249 (array!8671 (_ BitVec 32) (_ BitVec 8)) Unit!11650)

(assert (=> d!58631 (= lt!260578 (choose!249 lt!260531 (bvadd #b00000000000000000000000000000001 (currentByte!8142 thiss!1577)) lt!260539))))

(assert (=> d!58631 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8142 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8142 thiss!1577)) (size!3851 lt!260531)))))

(assert (=> d!58631 (= (arrayUpdatedAtPrefixLemma!288 lt!260531 (bvadd #b00000000000000000000000000000001 (currentByte!8142 thiss!1577)) lt!260539) lt!260578)))

(declare-fun b!167382 () Bool)

(assert (=> b!167382 (= e!116124 (arrayRangesEq!680 lt!260531 (array!8672 (store (arr!4772 lt!260531) (bvadd #b00000000000000000000000000000001 (currentByte!8142 thiss!1577)) lt!260539) (size!3851 lt!260531)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8142 thiss!1577))))))

(assert (= (and d!58631 res!139352) b!167382))

(declare-fun m!266397 () Bool)

(assert (=> d!58631 m!266397))

(declare-fun m!266399 () Bool)

(assert (=> b!167382 m!266399))

(declare-fun m!266401 () Bool)

(assert (=> b!167382 m!266401))

(assert (=> b!167358 d!58631))

(declare-fun d!58633 () Bool)

(declare-fun res!139353 () Bool)

(declare-fun e!116125 () Bool)

(assert (=> d!58633 (=> res!139353 e!116125)))

(assert (=> d!58633 (= res!139353 (= #b00000000000000000000000000000000 (currentByte!8142 thiss!1577)))))

(assert (=> d!58633 (= (arrayRangesEq!680 (buf!4303 thiss!1577) lt!260536 #b00000000000000000000000000000000 (currentByte!8142 thiss!1577)) e!116125)))

(declare-fun b!167383 () Bool)

(declare-fun e!116126 () Bool)

(assert (=> b!167383 (= e!116125 e!116126)))

(declare-fun res!139354 () Bool)

(assert (=> b!167383 (=> (not res!139354) (not e!116126))))

(assert (=> b!167383 (= res!139354 (= (select (arr!4772 (buf!4303 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4772 lt!260536) #b00000000000000000000000000000000)))))

(declare-fun b!167384 () Bool)

(assert (=> b!167384 (= e!116126 (arrayRangesEq!680 (buf!4303 thiss!1577) lt!260536 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8142 thiss!1577)))))

(assert (= (and d!58633 (not res!139353)) b!167383))

(assert (= (and b!167383 res!139354) b!167384))

(assert (=> b!167383 m!266391))

(declare-fun m!266403 () Bool)

(assert (=> b!167383 m!266403))

(declare-fun m!266405 () Bool)

(assert (=> b!167384 m!266405))

(assert (=> b!167358 d!58633))

(declare-fun d!58635 () Bool)

(assert (=> d!58635 (= (byteRangesEq!0 (select (arr!4772 (buf!4303 thiss!1577)) (currentByte!8142 thiss!1577)) lt!260534 #b00000000000000000000000000000000 lt!260537) (or (= #b00000000000000000000000000000000 lt!260537) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4772 (buf!4303 thiss!1577)) (currentByte!8142 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!260537))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!260534) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!260537))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14556 () Bool)

(assert (= bs!14556 d!58635))

(declare-fun m!266407 () Bool)

(assert (=> bs!14556 m!266407))

(declare-fun m!266409 () Bool)

(assert (=> bs!14556 m!266409))

(assert (=> b!167358 d!58635))

(declare-fun d!58637 () Bool)

(declare-fun res!139355 () Bool)

(declare-fun e!116127 () Bool)

(assert (=> d!58637 (=> res!139355 e!116127)))

(assert (=> d!58637 (= res!139355 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8142 thiss!1577))))))

(assert (=> d!58637 (= (arrayRangesEq!680 lt!260531 lt!260536 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8142 thiss!1577))) e!116127)))

(declare-fun b!167385 () Bool)

(declare-fun e!116128 () Bool)

(assert (=> b!167385 (= e!116127 e!116128)))

(declare-fun res!139356 () Bool)

(assert (=> b!167385 (=> (not res!139356) (not e!116128))))

(assert (=> b!167385 (= res!139356 (= (select (arr!4772 lt!260531) #b00000000000000000000000000000000) (select (arr!4772 lt!260536) #b00000000000000000000000000000000)))))

(declare-fun b!167386 () Bool)

(assert (=> b!167386 (= e!116128 (arrayRangesEq!680 lt!260531 lt!260536 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8142 thiss!1577))))))

(assert (= (and d!58637 (not res!139355)) b!167385))

(assert (= (and b!167385 res!139356) b!167386))

(declare-fun m!266411 () Bool)

(assert (=> b!167385 m!266411))

(assert (=> b!167385 m!266403))

(declare-fun m!266413 () Bool)

(assert (=> b!167386 m!266413))

(assert (=> b!167358 d!58637))

(declare-fun d!58639 () Bool)

(declare-fun e!116129 () Bool)

(assert (=> d!58639 e!116129))

(declare-fun res!139357 () Bool)

(assert (=> d!58639 (=> (not res!139357) (not e!116129))))

(assert (=> d!58639 (= res!139357 (and (bvsge (currentByte!8142 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8142 thiss!1577) (size!3851 (buf!4303 thiss!1577)))))))

(declare-fun lt!260579 () Unit!11650)

(assert (=> d!58639 (= lt!260579 (choose!249 (buf!4303 thiss!1577) (currentByte!8142 thiss!1577) lt!260534))))

(assert (=> d!58639 (and (bvsle #b00000000000000000000000000000000 (currentByte!8142 thiss!1577)) (bvslt (currentByte!8142 thiss!1577) (size!3851 (buf!4303 thiss!1577))))))

(assert (=> d!58639 (= (arrayUpdatedAtPrefixLemma!288 (buf!4303 thiss!1577) (currentByte!8142 thiss!1577) lt!260534) lt!260579)))

(declare-fun b!167387 () Bool)

(assert (=> b!167387 (= e!116129 (arrayRangesEq!680 (buf!4303 thiss!1577) (array!8672 (store (arr!4772 (buf!4303 thiss!1577)) (currentByte!8142 thiss!1577) lt!260534) (size!3851 (buf!4303 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8142 thiss!1577)))))

(assert (= (and d!58639 res!139357) b!167387))

(declare-fun m!266415 () Bool)

(assert (=> d!58639 m!266415))

(assert (=> b!167387 m!266343))

(assert (=> b!167387 m!266331))

(assert (=> b!167358 d!58639))

(declare-fun d!58641 () Bool)

(assert (=> d!58641 (arrayRangesEq!680 (buf!4303 thiss!1577) lt!260536 #b00000000000000000000000000000000 (currentByte!8142 thiss!1577))))

(declare-fun lt!260582 () Unit!11650)

(declare-fun choose!250 (array!8671 array!8671 array!8671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11650)

(assert (=> d!58641 (= lt!260582 (choose!250 (buf!4303 thiss!1577) lt!260531 lt!260536 #b00000000000000000000000000000000 (currentByte!8142 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8142 thiss!1577))))))

(assert (=> d!58641 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!8142 thiss!1577)) (bvsle (currentByte!8142 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8142 thiss!1577))))))

(assert (=> d!58641 (= (arrayRangesEqTransitive!182 (buf!4303 thiss!1577) lt!260531 lt!260536 #b00000000000000000000000000000000 (currentByte!8142 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8142 thiss!1577))) lt!260582)))

(declare-fun bs!14557 () Bool)

(assert (= bs!14557 d!58641))

(assert (=> bs!14557 m!266345))

(declare-fun m!266417 () Bool)

(assert (=> bs!14557 m!266417))

(assert (=> b!167358 d!58641))

(declare-fun d!58643 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58643 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8137 thiss!1577) (currentByte!8142 thiss!1577) (size!3851 (buf!4303 thiss!1577))))))

(declare-fun bs!14558 () Bool)

(assert (= bs!14558 d!58643))

(declare-fun m!266419 () Bool)

(assert (=> bs!14558 m!266419))

(assert (=> start!36356 d!58643))

(declare-fun d!58645 () Bool)

(declare-fun e!116132 () Bool)

(assert (=> d!58645 e!116132))

(declare-fun res!139362 () Bool)

(assert (=> d!58645 (=> (not res!139362) (not e!116132))))

(declare-fun lt!260600 () (_ BitVec 64))

(declare-fun lt!260597 () (_ BitVec 64))

(declare-fun lt!260596 () (_ BitVec 64))

(assert (=> d!58645 (= res!139362 (= lt!260596 (bvsub lt!260597 lt!260600)))))

(assert (=> d!58645 (or (= (bvand lt!260597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!260600 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!260597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!260597 lt!260600) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58645 (= lt!260600 (remainingBits!0 ((_ sign_extend 32) (size!3851 (buf!4303 thiss!1577))) ((_ sign_extend 32) (currentByte!8142 thiss!1577)) ((_ sign_extend 32) (currentBit!8137 thiss!1577))))))

(declare-fun lt!260595 () (_ BitVec 64))

(declare-fun lt!260598 () (_ BitVec 64))

(assert (=> d!58645 (= lt!260597 (bvmul lt!260595 lt!260598))))

(assert (=> d!58645 (or (= lt!260595 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!260598 (bvsdiv (bvmul lt!260595 lt!260598) lt!260595)))))

(assert (=> d!58645 (= lt!260598 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!58645 (= lt!260595 ((_ sign_extend 32) (size!3851 (buf!4303 thiss!1577))))))

(assert (=> d!58645 (= lt!260596 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8142 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8137 thiss!1577))))))

(assert (=> d!58645 (invariant!0 (currentBit!8137 thiss!1577) (currentByte!8142 thiss!1577) (size!3851 (buf!4303 thiss!1577)))))

(assert (=> d!58645 (= (bitIndex!0 (size!3851 (buf!4303 thiss!1577)) (currentByte!8142 thiss!1577) (currentBit!8137 thiss!1577)) lt!260596)))

(declare-fun b!167392 () Bool)

(declare-fun res!139363 () Bool)

(assert (=> b!167392 (=> (not res!139363) (not e!116132))))

(assert (=> b!167392 (= res!139363 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!260596))))

(declare-fun b!167393 () Bool)

(declare-fun lt!260599 () (_ BitVec 64))

(assert (=> b!167393 (= e!116132 (bvsle lt!260596 (bvmul lt!260599 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167393 (or (= lt!260599 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!260599 #b0000000000000000000000000000000000000000000000000000000000001000) lt!260599)))))

(assert (=> b!167393 (= lt!260599 ((_ sign_extend 32) (size!3851 (buf!4303 thiss!1577))))))

(assert (= (and d!58645 res!139362) b!167392))

(assert (= (and b!167392 res!139363) b!167393))

(declare-fun m!266421 () Bool)

(assert (=> d!58645 m!266421))

(assert (=> d!58645 m!266419))

(assert (=> b!167355 d!58645))

(declare-fun d!58647 () Bool)

(assert (=> d!58647 (= (array_inv!3592 (buf!4303 thiss!1577)) (bvsge (size!3851 (buf!4303 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!167356 d!58647))

(declare-fun d!58649 () Bool)

(assert (=> d!58649 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3851 (buf!4303 thiss!1577))) ((_ sign_extend 32) (currentByte!8142 thiss!1577)) ((_ sign_extend 32) (currentBit!8137 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3851 (buf!4303 thiss!1577))) ((_ sign_extend 32) (currentByte!8142 thiss!1577)) ((_ sign_extend 32) (currentBit!8137 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14559 () Bool)

(assert (= bs!14559 d!58649))

(assert (=> bs!14559 m!266421))

(assert (=> b!167354 d!58649))

(check-sat (not b!167379) (not d!58649) (not d!58645) (not b!167382) (not b!167387) (not b!167386) (not b!167384) (not d!58641) (not d!58639) (not d!58631) (not d!58643))
