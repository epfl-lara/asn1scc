; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36358 () Bool)

(assert start!36358)

(declare-fun b!167369 () Bool)

(declare-fun res!139342 () Bool)

(declare-fun e!116115 () Bool)

(assert (=> b!167369 (=> (not res!139342) (not e!116115))))

(declare-datatypes ((array!8673 0))(
  ( (array!8674 (arr!4773 (Array (_ BitVec 32) (_ BitVec 8))) (size!3852 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6860 0))(
  ( (BitStream!6861 (buf!4304 array!8673) (currentByte!8143 (_ BitVec 32)) (currentBit!8138 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6860)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!167369 (= res!139342 (bvsgt (bvadd (currentBit!8138 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167370 () Bool)

(declare-fun e!116114 () Bool)

(declare-fun array_inv!3593 (array!8673) Bool)

(assert (=> b!167370 (= e!116114 (array_inv!3593 (buf!4304 thiss!1577)))))

(declare-fun b!167371 () Bool)

(declare-fun e!116112 () Bool)

(declare-fun lt!260570 () (_ BitVec 64))

(declare-fun lt!260572 () (_ BitVec 64))

(assert (=> b!167371 (= e!116112 (or (not (= lt!260572 (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!260572 (bvand (bvadd lt!260570 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!167371 (= lt!260572 (bvand lt!260570 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!167371 (= lt!260570 (bitIndex!0 (size!3852 (buf!4304 thiss!1577)) (currentByte!8143 thiss!1577) (currentBit!8138 thiss!1577)))))

(declare-fun b!167372 () Bool)

(declare-fun res!139343 () Bool)

(assert (=> b!167372 (=> (not res!139343) (not e!116115))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167372 (= res!139343 (validate_offset_bits!1 ((_ sign_extend 32) (size!3852 (buf!4304 thiss!1577))) ((_ sign_extend 32) (currentByte!8143 thiss!1577)) ((_ sign_extend 32) (currentBit!8138 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!167373 () Bool)

(assert (=> b!167373 (= e!116115 (not e!116112))))

(declare-fun res!139341 () Bool)

(assert (=> b!167373 (=> res!139341 e!116112)))

(declare-fun lt!260574 () (_ BitVec 8))

(declare-fun lt!260573 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167373 (= res!139341 (not (byteRangesEq!0 (select (arr!4773 (buf!4304 thiss!1577)) (currentByte!8143 thiss!1577)) lt!260574 #b00000000000000000000000000000000 lt!260573)))))

(declare-fun lt!260571 () array!8673)

(declare-fun arrayRangesEq!681 (array!8673 array!8673 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167373 (arrayRangesEq!681 (buf!4304 thiss!1577) lt!260571 #b00000000000000000000000000000000 (currentByte!8143 thiss!1577))))

(declare-datatypes ((Unit!11652 0))(
  ( (Unit!11653) )
))
(declare-fun lt!260567 () Unit!11652)

(declare-fun lt!260568 () array!8673)

(declare-fun arrayRangesEqTransitive!183 (array!8673 array!8673 array!8673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11652)

(assert (=> b!167373 (= lt!260567 (arrayRangesEqTransitive!183 (buf!4304 thiss!1577) lt!260568 lt!260571 #b00000000000000000000000000000000 (currentByte!8143 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8143 thiss!1577))))))

(assert (=> b!167373 (arrayRangesEq!681 lt!260568 lt!260571 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8143 thiss!1577)))))

(declare-fun lt!260565 () Unit!11652)

(declare-fun lt!260564 () (_ BitVec 8))

(declare-fun arrayUpdatedAtPrefixLemma!289 (array!8673 (_ BitVec 32) (_ BitVec 8)) Unit!11652)

(assert (=> b!167373 (= lt!260565 (arrayUpdatedAtPrefixLemma!289 lt!260568 (bvadd #b00000000000000000000000000000001 (currentByte!8143 thiss!1577)) lt!260564))))

(assert (=> b!167373 (arrayRangesEq!681 (buf!4304 thiss!1577) (array!8674 (store (arr!4773 (buf!4304 thiss!1577)) (currentByte!8143 thiss!1577) lt!260574) (size!3852 (buf!4304 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8143 thiss!1577))))

(declare-fun lt!260566 () Unit!11652)

(assert (=> b!167373 (= lt!260566 (arrayUpdatedAtPrefixLemma!289 (buf!4304 thiss!1577) (currentByte!8143 thiss!1577) lt!260574))))

(declare-fun lt!260575 () (_ BitVec 32))

(assert (=> b!167373 (= lt!260574 (select (store (store (arr!4773 (buf!4304 thiss!1577)) (currentByte!8143 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4773 (buf!4304 thiss!1577)) (currentByte!8143 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8138 thiss!1577)))))))) (bvlshr (bvand lt!260575 #b00000000000000000000000011111111) lt!260573)))) (bvadd #b00000000000000000000000000000001 (currentByte!8143 thiss!1577)) lt!260564) (currentByte!8143 thiss!1577)))))

(assert (=> b!167373 (= lt!260571 (array!8674 (store (store (arr!4773 (buf!4304 thiss!1577)) (currentByte!8143 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4773 (buf!4304 thiss!1577)) (currentByte!8143 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8138 thiss!1577)))))))) (bvlshr (bvand lt!260575 #b00000000000000000000000011111111) lt!260573)))) (bvadd #b00000000000000000000000000000001 (currentByte!8143 thiss!1577)) lt!260564) (size!3852 (buf!4304 thiss!1577))))))

(declare-fun lt!260569 () (_ BitVec 32))

(assert (=> b!167373 (= lt!260564 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4773 (buf!4304 thiss!1577)) (currentByte!8143 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4773 (buf!4304 thiss!1577)) (currentByte!8143 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8138 thiss!1577)))))))) (bvlshr (bvand lt!260575 #b00000000000000000000000011111111) lt!260573)))) (bvadd #b00000000000000000000000000000001 (currentByte!8143 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260569))) (bvshl lt!260575 lt!260569))))))

(assert (=> b!167373 (= lt!260569 (bvsub #b00000000000000000000000000001000 lt!260573))))

(assert (=> b!167373 (= lt!260568 (array!8674 (store (arr!4773 (buf!4304 thiss!1577)) (currentByte!8143 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4773 (buf!4304 thiss!1577)) (currentByte!8143 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8138 thiss!1577)))))))) (bvlshr (bvand lt!260575 #b00000000000000000000000011111111) lt!260573)))) (size!3852 (buf!4304 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!167373 (= lt!260575 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167373 (= lt!260573 (bvsub (bvadd (currentBit!8138 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!139340 () Bool)

(assert (=> start!36358 (=> (not res!139340) (not e!116115))))

(assert (=> start!36358 (= res!139340 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36358 e!116115))

(assert (=> start!36358 true))

(declare-fun inv!12 (BitStream!6860) Bool)

(assert (=> start!36358 (and (inv!12 thiss!1577) e!116114)))

(assert (= (and start!36358 res!139340) b!167372))

(assert (= (and b!167372 res!139343) b!167369))

(assert (= (and b!167369 res!139342) b!167373))

(assert (= (and b!167373 (not res!139341)) b!167371))

(assert (= start!36358 b!167370))

(declare-fun m!266351 () Bool)

(assert (=> start!36358 m!266351))

(declare-fun m!266353 () Bool)

(assert (=> b!167372 m!266353))

(declare-fun m!266355 () Bool)

(assert (=> b!167373 m!266355))

(declare-fun m!266357 () Bool)

(assert (=> b!167373 m!266357))

(declare-fun m!266359 () Bool)

(assert (=> b!167373 m!266359))

(declare-fun m!266361 () Bool)

(assert (=> b!167373 m!266361))

(declare-fun m!266363 () Bool)

(assert (=> b!167373 m!266363))

(declare-fun m!266365 () Bool)

(assert (=> b!167373 m!266365))

(assert (=> b!167373 m!266359))

(declare-fun m!266367 () Bool)

(assert (=> b!167373 m!266367))

(declare-fun m!266369 () Bool)

(assert (=> b!167373 m!266369))

(declare-fun m!266371 () Bool)

(assert (=> b!167373 m!266371))

(declare-fun m!266373 () Bool)

(assert (=> b!167373 m!266373))

(declare-fun m!266375 () Bool)

(assert (=> b!167373 m!266375))

(declare-fun m!266377 () Bool)

(assert (=> b!167373 m!266377))

(declare-fun m!266379 () Bool)

(assert (=> b!167373 m!266379))

(declare-fun m!266381 () Bool)

(assert (=> b!167373 m!266381))

(declare-fun m!266383 () Bool)

(assert (=> b!167373 m!266383))

(declare-fun m!266385 () Bool)

(assert (=> b!167373 m!266385))

(declare-fun m!266387 () Bool)

(assert (=> b!167371 m!266387))

(declare-fun m!266389 () Bool)

(assert (=> b!167370 m!266389))

(push 1)

(assert (not b!167373))

(assert (not b!167370))

(assert (not b!167371))

(assert (not b!167372))

(assert (not start!36358))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58673 () Bool)

(declare-fun res!139382 () Bool)

(declare-fun e!116151 () Bool)

(assert (=> d!58673 (=> res!139382 e!116151)))

(assert (=> d!58673 (= res!139382 (= #b00000000000000000000000000000000 (currentByte!8143 thiss!1577)))))

(assert (=> d!58673 (= (arrayRangesEq!681 (buf!4304 thiss!1577) (array!8674 (store (arr!4773 (buf!4304 thiss!1577)) (currentByte!8143 thiss!1577) lt!260574) (size!3852 (buf!4304 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8143 thiss!1577)) e!116151)))

(declare-fun b!167412 () Bool)

(declare-fun e!116152 () Bool)

(assert (=> b!167412 (= e!116151 e!116152)))

(declare-fun res!139383 () Bool)

(assert (=> b!167412 (=> (not res!139383) (not e!116152))))

(assert (=> b!167412 (= res!139383 (= (select (arr!4773 (buf!4304 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4773 (array!8674 (store (arr!4773 (buf!4304 thiss!1577)) (currentByte!8143 thiss!1577) lt!260574) (size!3852 (buf!4304 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!167413 () Bool)

(assert (=> b!167413 (= e!116152 (arrayRangesEq!681 (buf!4304 thiss!1577) (array!8674 (store (arr!4773 (buf!4304 thiss!1577)) (currentByte!8143 thiss!1577) lt!260574) (size!3852 (buf!4304 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8143 thiss!1577)))))

(assert (= (and d!58673 (not res!139382)) b!167412))

(assert (= (and b!167412 res!139383) b!167413))

(declare-fun m!266455 () Bool)

(assert (=> b!167412 m!266455))

(declare-fun m!266457 () Bool)

(assert (=> b!167412 m!266457))

(declare-fun m!266459 () Bool)

(assert (=> b!167413 m!266459))

(assert (=> b!167373 d!58673))

(declare-fun d!58675 () Bool)

(assert (=> d!58675 (= (byteRangesEq!0 (select (arr!4773 (buf!4304 thiss!1577)) (currentByte!8143 thiss!1577)) lt!260574 #b00000000000000000000000000000000 lt!260573) (or (= #b00000000000000000000000000000000 lt!260573) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4773 (buf!4304 thiss!1577)) (currentByte!8143 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!260573))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!260574) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!260573))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14564 () Bool)

(assert (= bs!14564 d!58675))

(declare-fun m!266461 () Bool)

(assert (=> bs!14564 m!266461))

(declare-fun m!266463 () Bool)

(assert (=> bs!14564 m!266463))

(assert (=> b!167373 d!58675))

(declare-fun d!58677 () Bool)

(declare-fun e!116158 () Bool)

(assert (=> d!58677 e!116158))

(declare-fun res!139392 () Bool)

(assert (=> d!58677 (=> (not res!139392) (not e!116158))))

(assert (=> d!58677 (= res!139392 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8143 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8143 thiss!1577)) (size!3852 lt!260568))))))

(declare-fun lt!260628 () Unit!11652)

(declare-fun choose!253 (array!8673 (_ BitVec 32) (_ BitVec 8)) Unit!11652)

(assert (=> d!58677 (= lt!260628 (choose!253 lt!260568 (bvadd #b00000000000000000000000000000001 (currentByte!8143 thiss!1577)) lt!260564))))

(assert (=> d!58677 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8143 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8143 thiss!1577)) (size!3852 lt!260568)))))

(assert (=> d!58677 (= (arrayUpdatedAtPrefixLemma!289 lt!260568 (bvadd #b00000000000000000000000000000001 (currentByte!8143 thiss!1577)) lt!260564) lt!260628)))

(declare-fun b!167422 () Bool)

(assert (=> b!167422 (= e!116158 (arrayRangesEq!681 lt!260568 (array!8674 (store (arr!4773 lt!260568) (bvadd #b00000000000000000000000000000001 (currentByte!8143 thiss!1577)) lt!260564) (size!3852 lt!260568)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8143 thiss!1577))))))

(assert (= (and d!58677 res!139392) b!167422))

(declare-fun m!266465 () Bool)

(assert (=> d!58677 m!266465))

(declare-fun m!266467 () Bool)

(assert (=> b!167422 m!266467))

(declare-fun m!266469 () Bool)

(assert (=> b!167422 m!266469))

(assert (=> b!167373 d!58677))

(declare-fun d!58679 () Bool)

(declare-fun res!139393 () Bool)

(declare-fun e!116159 () Bool)

(assert (=> d!58679 (=> res!139393 e!116159)))

(assert (=> d!58679 (= res!139393 (= #b00000000000000000000000000000000 (currentByte!8143 thiss!1577)))))

(assert (=> d!58679 (= (arrayRangesEq!681 (buf!4304 thiss!1577) lt!260571 #b00000000000000000000000000000000 (currentByte!8143 thiss!1577)) e!116159)))

(declare-fun b!167423 () Bool)

(declare-fun e!116160 () Bool)

(assert (=> b!167423 (= e!116159 e!116160)))

(declare-fun res!139394 () Bool)

(assert (=> b!167423 (=> (not res!139394) (not e!116160))))

(assert (=> b!167423 (= res!139394 (= (select (arr!4773 (buf!4304 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4773 lt!260571) #b00000000000000000000000000000000)))))

(declare-fun b!167424 () Bool)

(assert (=> b!167424 (= e!116160 (arrayRangesEq!681 (buf!4304 thiss!1577) lt!260571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8143 thiss!1577)))))

(assert (= (and d!58679 (not res!139393)) b!167423))

(assert (= (and b!167423 res!139394) b!167424))

(assert (=> b!167423 m!266455))

(declare-fun m!266471 () Bool)

(assert (=> b!167423 m!266471))

(declare-fun m!266473 () Bool)

(assert (=> b!167424 m!266473))

(assert (=> b!167373 d!58679))

(declare-fun d!58681 () Bool)

(declare-fun res!139395 () Bool)

(declare-fun e!116161 () Bool)

(assert (=> d!58681 (=> res!139395 e!116161)))

(assert (=> d!58681 (= res!139395 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8143 thiss!1577))))))

(assert (=> d!58681 (= (arrayRangesEq!681 lt!260568 lt!260571 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8143 thiss!1577))) e!116161)))

(declare-fun b!167425 () Bool)

(declare-fun e!116162 () Bool)

(assert (=> b!167425 (= e!116161 e!116162)))

(declare-fun res!139396 () Bool)

(assert (=> b!167425 (=> (not res!139396) (not e!116162))))

(assert (=> b!167425 (= res!139396 (= (select (arr!4773 lt!260568) #b00000000000000000000000000000000) (select (arr!4773 lt!260571) #b00000000000000000000000000000000)))))

(declare-fun b!167426 () Bool)

(assert (=> b!167426 (= e!116162 (arrayRangesEq!681 lt!260568 lt!260571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8143 thiss!1577))))))

(assert (= (and d!58681 (not res!139395)) b!167425))

(assert (= (and b!167425 res!139396) b!167426))

(declare-fun m!266475 () Bool)

(assert (=> b!167425 m!266475))

(assert (=> b!167425 m!266471))

(declare-fun m!266477 () Bool)

(assert (=> b!167426 m!266477))

(assert (=> b!167373 d!58681))

(declare-fun d!58683 () Bool)

(assert (=> d!58683 (arrayRangesEq!681 (buf!4304 thiss!1577) lt!260571 #b00000000000000000000000000000000 (currentByte!8143 thiss!1577))))

(declare-fun lt!260631 () Unit!11652)

(declare-fun choose!254 (array!8673 array!8673 array!8673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11652)

(assert (=> d!58683 (= lt!260631 (choose!254 (buf!4304 thiss!1577) lt!260568 lt!260571 #b00000000000000000000000000000000 (currentByte!8143 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8143 thiss!1577))))))

(assert (=> d!58683 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!8143 thiss!1577)) (bvsle (currentByte!8143 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8143 thiss!1577))))))

(assert (=> d!58683 (= (arrayRangesEqTransitive!183 (buf!4304 thiss!1577) lt!260568 lt!260571 #b00000000000000000000000000000000 (currentByte!8143 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8143 thiss!1577))) lt!260631)))

(declare-fun bs!14565 () Bool)

(assert (= bs!14565 d!58683))

(assert (=> bs!14565 m!266365))

(declare-fun m!266479 () Bool)

(assert (=> bs!14565 m!266479))

(assert (=> b!167373 d!58683))

(declare-fun d!58685 () Bool)

(declare-fun e!116163 () Bool)

(assert (=> d!58685 e!116163))

(declare-fun res!139397 () Bool)

(assert (=> d!58685 (=> (not res!139397) (not e!116163))))

(assert (=> d!58685 (= res!139397 (and (bvsge (currentByte!8143 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8143 thiss!1577) (size!3852 (buf!4304 thiss!1577)))))))

(declare-fun lt!260632 () Unit!11652)

(assert (=> d!58685 (= lt!260632 (choose!253 (buf!4304 thiss!1577) (currentByte!8143 thiss!1577) lt!260574))))

(assert (=> d!58685 (and (bvsle #b00000000000000000000000000000000 (currentByte!8143 thiss!1577)) (bvslt (currentByte!8143 thiss!1577) (size!3852 (buf!4304 thiss!1577))))))

(assert (=> d!58685 (= (arrayUpdatedAtPrefixLemma!289 (buf!4304 thiss!1577) (currentByte!8143 thiss!1577) lt!260574) lt!260632)))

(declare-fun b!167427 () Bool)

(assert (=> b!167427 (= e!116163 (arrayRangesEq!681 (buf!4304 thiss!1577) (array!8674 (store (arr!4773 (buf!4304 thiss!1577)) (currentByte!8143 thiss!1577) lt!260574) (size!3852 (buf!4304 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8143 thiss!1577)))))

(assert (= (and d!58685 res!139397) b!167427))

(declare-fun m!266481 () Bool)

(assert (=> d!58685 m!266481))

(assert (=> b!167427 m!266363))

(assert (=> b!167427 m!266373))

(assert (=> b!167373 d!58685))

(declare-fun d!58687 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58687 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8138 thiss!1577) (currentByte!8143 thiss!1577) (size!3852 (buf!4304 thiss!1577))))))

(declare-fun bs!14566 () Bool)

(assert (= bs!14566 d!58687))

(declare-fun m!266483 () Bool)

(assert (=> bs!14566 m!266483))

(assert (=> start!36358 d!58687))

(declare-fun d!58689 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58689 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3852 (buf!4304 thiss!1577))) ((_ sign_extend 32) (currentByte!8143 thiss!1577)) ((_ sign_extend 32) (currentBit!8138 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3852 (buf!4304 thiss!1577))) ((_ sign_extend 32) (currentByte!8143 thiss!1577)) ((_ sign_extend 32) (currentBit!8138 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14567 () Bool)

(assert (= bs!14567 d!58689))

(declare-fun m!266485 () Bool)

(assert (=> bs!14567 m!266485))

(assert (=> b!167372 d!58689))

(declare-fun d!58691 () Bool)

(assert (=> d!58691 (= (array_inv!3593 (buf!4304 thiss!1577)) (bvsge (size!3852 (buf!4304 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!167370 d!58691))

(declare-fun d!58693 () Bool)

(declare-fun e!116166 () Bool)

(assert (=> d!58693 e!116166))

(declare-fun res!139402 () Bool)

(assert (=> d!58693 (=> (not res!139402) (not e!116166))))

(declare-fun lt!260650 () (_ BitVec 64))

(declare-fun lt!260649 () (_ BitVec 64))

(declare-fun lt!260645 () (_ BitVec 64))

(assert (=> d!58693 (= res!139402 (= lt!260650 (bvsub lt!260649 lt!260645)))))

(assert (=> d!58693 (or (= (bvand lt!260649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!260645 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!260649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!260649 lt!260645) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58693 (= lt!260645 (remainingBits!0 ((_ sign_extend 32) (size!3852 (buf!4304 thiss!1577))) ((_ sign_extend 32) (currentByte!8143 thiss!1577)) ((_ sign_extend 32) (currentBit!8138 thiss!1577))))))

(declare-fun lt!260647 () (_ BitVec 64))

(declare-fun lt!260646 () (_ BitVec 64))

(assert (=> d!58693 (= lt!260649 (bvmul lt!260647 lt!260646))))

(assert (=> d!58693 (or (= lt!260647 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!260646 (bvsdiv (bvmul lt!260647 lt!260646) lt!260647)))))

(assert (=> d!58693 (= lt!260646 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!58693 (= lt!260647 ((_ sign_extend 32) (size!3852 (buf!4304 thiss!1577))))))

(assert (=> d!58693 (= lt!260650 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8143 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8138 thiss!1577))))))

(assert (=> d!58693 (invariant!0 (currentBit!8138 thiss!1577) (currentByte!8143 thiss!1577) (size!3852 (buf!4304 thiss!1577)))))

(assert (=> d!58693 (= (bitIndex!0 (size!3852 (buf!4304 thiss!1577)) (currentByte!8143 thiss!1577) (currentBit!8138 thiss!1577)) lt!260650)))

(declare-fun b!167432 () Bool)

(declare-fun res!139403 () Bool)

(assert (=> b!167432 (=> (not res!139403) (not e!116166))))

(assert (=> b!167432 (= res!139403 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!260650))))

(declare-fun b!167433 () Bool)

(declare-fun lt!260648 () (_ BitVec 64))

(assert (=> b!167433 (= e!116166 (bvsle lt!260650 (bvmul lt!260648 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167433 (or (= lt!260648 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!260648 #b0000000000000000000000000000000000000000000000000000000000001000) lt!260648)))))

(assert (=> b!167433 (= lt!260648 ((_ sign_extend 32) (size!3852 (buf!4304 thiss!1577))))))

(assert (= (and d!58693 res!139402) b!167432))

(assert (= (and b!167432 res!139403) b!167433))

(assert (=> d!58693 m!266485))

(assert (=> d!58693 m!266483))

(assert (=> b!167371 d!58693))

(push 1)

(assert (not b!167413))

(assert (not d!58685))

(assert (not b!167426))

(assert (not b!167427))

(assert (not d!58693))

(assert (not d!58689))

(assert (not d!58687))

(assert (not d!58677))

(assert (not b!167424))

(assert (not b!167422))

(assert (not d!58683))

(check-sat)

(pop 1)

(push 1)

(check-sat)

