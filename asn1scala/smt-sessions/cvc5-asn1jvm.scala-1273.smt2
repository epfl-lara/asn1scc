; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36206 () Bool)

(assert start!36206)

(declare-fun b!166989 () Bool)

(declare-fun res!139022 () Bool)

(declare-fun e!115794 () Bool)

(assert (=> b!166989 (=> (not res!139022) (not e!115794))))

(declare-datatypes ((array!8624 0))(
  ( (array!8625 (arr!4753 (Array (_ BitVec 32) (_ BitVec 8))) (size!3832 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6820 0))(
  ( (BitStream!6821 (buf!4284 array!8624) (currentByte!8111 (_ BitVec 32)) (currentBit!8106 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6820)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166989 (= res!139022 (validate_offset_bits!1 ((_ sign_extend 32) (size!3832 (buf!4284 thiss!1577))) ((_ sign_extend 32) (currentByte!8111 thiss!1577)) ((_ sign_extend 32) (currentBit!8106 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166990 () Bool)

(declare-fun res!139020 () Bool)

(assert (=> b!166990 (=> (not res!139020) (not e!115794))))

(assert (=> b!166990 (= res!139020 (bvsgt (bvadd (currentBit!8106 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!166991 () Bool)

(assert (=> b!166991 (= e!115794 (not (or (bvsgt #b00000000000000000000000000000000 (currentByte!8111 thiss!1577)) (bvsgt (currentByte!8111 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577))) (and (bvsle (currentByte!8111 thiss!1577) (size!3832 (buf!4284 thiss!1577))) (bvsle (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)) (size!3832 (buf!4284 thiss!1577)))))))))

(declare-fun lt!259977 () (_ BitVec 32))

(declare-fun lt!259976 () (_ BitVec 8))

(declare-fun lt!259978 () array!8624)

(declare-fun lt!259981 () (_ BitVec 32))

(declare-fun arrayRangesEq!661 (array!8624 array!8624 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166991 (arrayRangesEq!661 lt!259978 (array!8625 (store (store (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8106 thiss!1577)))))))) (bvlshr (bvand lt!259981 #b00000000000000000000000011111111) lt!259977)))) (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)) lt!259976) (size!3832 (buf!4284 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)))))

(declare-datatypes ((Unit!11612 0))(
  ( (Unit!11613) )
))
(declare-fun lt!259982 () Unit!11612)

(declare-fun arrayUpdatedAtPrefixLemma!269 (array!8624 (_ BitVec 32) (_ BitVec 8)) Unit!11612)

(assert (=> b!166991 (= lt!259982 (arrayUpdatedAtPrefixLemma!269 lt!259978 (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)) lt!259976))))

(assert (=> b!166991 (arrayRangesEq!661 (buf!4284 thiss!1577) (array!8625 (store (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577) (select (store (store (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8106 thiss!1577)))))))) (bvlshr (bvand lt!259981 #b00000000000000000000000011111111) lt!259977)))) (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)) lt!259976) (currentByte!8111 thiss!1577))) (size!3832 (buf!4284 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8111 thiss!1577))))

(declare-fun lt!259980 () Unit!11612)

(assert (=> b!166991 (= lt!259980 (arrayUpdatedAtPrefixLemma!269 (buf!4284 thiss!1577) (currentByte!8111 thiss!1577) (select (store (store (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8106 thiss!1577)))))))) (bvlshr (bvand lt!259981 #b00000000000000000000000011111111) lt!259977)))) (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)) lt!259976) (currentByte!8111 thiss!1577))))))

(declare-fun lt!259979 () (_ BitVec 32))

(assert (=> b!166991 (= lt!259976 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8106 thiss!1577)))))))) (bvlshr (bvand lt!259981 #b00000000000000000000000011111111) lt!259977)))) (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!259979))) (bvshl lt!259981 lt!259979))))))

(assert (=> b!166991 (= lt!259979 (bvsub #b00000000000000000000000000001000 lt!259977))))

(assert (=> b!166991 (= lt!259978 (array!8625 (store (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8106 thiss!1577)))))))) (bvlshr (bvand lt!259981 #b00000000000000000000000011111111) lt!259977)))) (size!3832 (buf!4284 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!166991 (= lt!259981 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!166991 (= lt!259977 (bvsub (bvadd (currentBit!8106 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!166992 () Bool)

(declare-fun e!115792 () Bool)

(declare-fun array_inv!3573 (array!8624) Bool)

(assert (=> b!166992 (= e!115792 (array_inv!3573 (buf!4284 thiss!1577)))))

(declare-fun res!139021 () Bool)

(assert (=> start!36206 (=> (not res!139021) (not e!115794))))

(assert (=> start!36206 (= res!139021 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36206 e!115794))

(assert (=> start!36206 true))

(declare-fun inv!12 (BitStream!6820) Bool)

(assert (=> start!36206 (and (inv!12 thiss!1577) e!115792)))

(assert (= (and start!36206 res!139021) b!166989))

(assert (= (and b!166989 res!139022) b!166990))

(assert (= (and b!166990 res!139020) b!166991))

(assert (= start!36206 b!166992))

(declare-fun m!265391 () Bool)

(assert (=> b!166989 m!265391))

(declare-fun m!265393 () Bool)

(assert (=> b!166991 m!265393))

(declare-fun m!265395 () Bool)

(assert (=> b!166991 m!265395))

(declare-fun m!265397 () Bool)

(assert (=> b!166991 m!265397))

(declare-fun m!265399 () Bool)

(assert (=> b!166991 m!265399))

(declare-fun m!265401 () Bool)

(assert (=> b!166991 m!265401))

(declare-fun m!265403 () Bool)

(assert (=> b!166991 m!265403))

(declare-fun m!265405 () Bool)

(assert (=> b!166991 m!265405))

(declare-fun m!265407 () Bool)

(assert (=> b!166991 m!265407))

(declare-fun m!265409 () Bool)

(assert (=> b!166991 m!265409))

(assert (=> b!166991 m!265401))

(declare-fun m!265411 () Bool)

(assert (=> b!166991 m!265411))

(declare-fun m!265413 () Bool)

(assert (=> b!166991 m!265413))

(declare-fun m!265415 () Bool)

(assert (=> b!166991 m!265415))

(declare-fun m!265417 () Bool)

(assert (=> b!166991 m!265417))

(declare-fun m!265419 () Bool)

(assert (=> b!166992 m!265419))

(declare-fun m!265421 () Bool)

(assert (=> start!36206 m!265421))

(push 1)

(assert (not b!166989))

(assert (not start!36206))

(assert (not b!166991))

(assert (not b!166992))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58459 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58459 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3832 (buf!4284 thiss!1577))) ((_ sign_extend 32) (currentByte!8111 thiss!1577)) ((_ sign_extend 32) (currentBit!8106 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3832 (buf!4284 thiss!1577))) ((_ sign_extend 32) (currentByte!8111 thiss!1577)) ((_ sign_extend 32) (currentBit!8106 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14509 () Bool)

(assert (= bs!14509 d!58459))

(declare-fun m!265511 () Bool)

(assert (=> bs!14509 m!265511))

(assert (=> b!166989 d!58459))

(declare-fun d!58461 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58461 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8106 thiss!1577) (currentByte!8111 thiss!1577) (size!3832 (buf!4284 thiss!1577))))))

(declare-fun bs!14510 () Bool)

(assert (= bs!14510 d!58461))

(declare-fun m!265513 () Bool)

(assert (=> bs!14510 m!265513))

(assert (=> start!36206 d!58461))

(declare-fun d!58463 () Bool)

(declare-fun res!139057 () Bool)

(declare-fun e!115829 () Bool)

(assert (=> d!58463 (=> res!139057 e!115829)))

(assert (=> d!58463 (= res!139057 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577))))))

(assert (=> d!58463 (= (arrayRangesEq!661 lt!259978 (array!8625 (store (store (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8106 thiss!1577)))))))) (bvlshr (bvand lt!259981 #b00000000000000000000000011111111) lt!259977)))) (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)) lt!259976) (size!3832 (buf!4284 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577))) e!115829)))

(declare-fun b!167033 () Bool)

(declare-fun e!115830 () Bool)

(assert (=> b!167033 (= e!115829 e!115830)))

(declare-fun res!139058 () Bool)

(assert (=> b!167033 (=> (not res!139058) (not e!115830))))

(assert (=> b!167033 (= res!139058 (= (select (arr!4753 lt!259978) #b00000000000000000000000000000000) (select (arr!4753 (array!8625 (store (store (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8106 thiss!1577)))))))) (bvlshr (bvand lt!259981 #b00000000000000000000000011111111) lt!259977)))) (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)) lt!259976) (size!3832 (buf!4284 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!167034 () Bool)

(assert (=> b!167034 (= e!115830 (arrayRangesEq!661 lt!259978 (array!8625 (store (store (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8106 thiss!1577)))))))) (bvlshr (bvand lt!259981 #b00000000000000000000000011111111) lt!259977)))) (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)) lt!259976) (size!3832 (buf!4284 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577))))))

(assert (= (and d!58463 (not res!139057)) b!167033))

(assert (= (and b!167033 res!139058) b!167034))

(declare-fun m!265519 () Bool)

(assert (=> b!167033 m!265519))

(declare-fun m!265521 () Bool)

(assert (=> b!167033 m!265521))

(declare-fun m!265523 () Bool)

(assert (=> b!167034 m!265523))

(assert (=> b!166991 d!58463))

(declare-fun d!58471 () Bool)

(declare-fun e!115839 () Bool)

(assert (=> d!58471 e!115839))

(declare-fun res!139067 () Bool)

(assert (=> d!58471 (=> (not res!139067) (not e!115839))))

(assert (=> d!58471 (= res!139067 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)) (size!3832 lt!259978))))))

(declare-fun lt!260031 () Unit!11612)

(declare-fun choose!237 (array!8624 (_ BitVec 32) (_ BitVec 8)) Unit!11612)

(assert (=> d!58471 (= lt!260031 (choose!237 lt!259978 (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)) lt!259976))))

(assert (=> d!58471 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)) (size!3832 lt!259978)))))

(assert (=> d!58471 (= (arrayUpdatedAtPrefixLemma!269 lt!259978 (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)) lt!259976) lt!260031)))

(declare-fun b!167043 () Bool)

(assert (=> b!167043 (= e!115839 (arrayRangesEq!661 lt!259978 (array!8625 (store (arr!4753 lt!259978) (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)) lt!259976) (size!3832 lt!259978)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577))))))

(assert (= (and d!58471 res!139067) b!167043))

(declare-fun m!265531 () Bool)

(assert (=> d!58471 m!265531))

(declare-fun m!265533 () Bool)

(assert (=> b!167043 m!265533))

(declare-fun m!265535 () Bool)

(assert (=> b!167043 m!265535))

(assert (=> b!166991 d!58471))

(declare-fun d!58475 () Bool)

(declare-fun res!139068 () Bool)

(declare-fun e!115840 () Bool)

(assert (=> d!58475 (=> res!139068 e!115840)))

(assert (=> d!58475 (= res!139068 (= #b00000000000000000000000000000000 (currentByte!8111 thiss!1577)))))

(assert (=> d!58475 (= (arrayRangesEq!661 (buf!4284 thiss!1577) (array!8625 (store (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577) (select (store (store (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8106 thiss!1577)))))))) (bvlshr (bvand lt!259981 #b00000000000000000000000011111111) lt!259977)))) (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)) lt!259976) (currentByte!8111 thiss!1577))) (size!3832 (buf!4284 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8111 thiss!1577)) e!115840)))

(declare-fun b!167044 () Bool)

(declare-fun e!115841 () Bool)

(assert (=> b!167044 (= e!115840 e!115841)))

(declare-fun res!139069 () Bool)

(assert (=> b!167044 (=> (not res!139069) (not e!115841))))

(assert (=> b!167044 (= res!139069 (= (select (arr!4753 (buf!4284 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4753 (array!8625 (store (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577) (select (store (store (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8106 thiss!1577)))))))) (bvlshr (bvand lt!259981 #b00000000000000000000000011111111) lt!259977)))) (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)) lt!259976) (currentByte!8111 thiss!1577))) (size!3832 (buf!4284 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!167045 () Bool)

(assert (=> b!167045 (= e!115841 (arrayRangesEq!661 (buf!4284 thiss!1577) (array!8625 (store (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577) (select (store (store (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8106 thiss!1577)))))))) (bvlshr (bvand lt!259981 #b00000000000000000000000011111111) lt!259977)))) (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)) lt!259976) (currentByte!8111 thiss!1577))) (size!3832 (buf!4284 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8111 thiss!1577)))))

(assert (= (and d!58475 (not res!139068)) b!167044))

(assert (= (and b!167044 res!139069) b!167045))

(declare-fun m!265537 () Bool)

(assert (=> b!167044 m!265537))

(declare-fun m!265539 () Bool)

(assert (=> b!167044 m!265539))

(declare-fun m!265541 () Bool)

(assert (=> b!167045 m!265541))

(assert (=> b!166991 d!58475))

(declare-fun d!58477 () Bool)

(declare-fun e!115842 () Bool)

(assert (=> d!58477 e!115842))

(declare-fun res!139070 () Bool)

(assert (=> d!58477 (=> (not res!139070) (not e!115842))))

(assert (=> d!58477 (= res!139070 (and (bvsge (currentByte!8111 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8111 thiss!1577) (size!3832 (buf!4284 thiss!1577)))))))

(declare-fun lt!260032 () Unit!11612)

(assert (=> d!58477 (= lt!260032 (choose!237 (buf!4284 thiss!1577) (currentByte!8111 thiss!1577) (select (store (store (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8106 thiss!1577)))))))) (bvlshr (bvand lt!259981 #b00000000000000000000000011111111) lt!259977)))) (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)) lt!259976) (currentByte!8111 thiss!1577))))))

(assert (=> d!58477 (and (bvsle #b00000000000000000000000000000000 (currentByte!8111 thiss!1577)) (bvslt (currentByte!8111 thiss!1577) (size!3832 (buf!4284 thiss!1577))))))

(assert (=> d!58477 (= (arrayUpdatedAtPrefixLemma!269 (buf!4284 thiss!1577) (currentByte!8111 thiss!1577) (select (store (store (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8106 thiss!1577)))))))) (bvlshr (bvand lt!259981 #b00000000000000000000000011111111) lt!259977)))) (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)) lt!259976) (currentByte!8111 thiss!1577))) lt!260032)))

(declare-fun b!167046 () Bool)

(assert (=> b!167046 (= e!115842 (arrayRangesEq!661 (buf!4284 thiss!1577) (array!8625 (store (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577) (select (store (store (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4753 (buf!4284 thiss!1577)) (currentByte!8111 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8106 thiss!1577)))))))) (bvlshr (bvand lt!259981 #b00000000000000000000000011111111) lt!259977)))) (bvadd #b00000000000000000000000000000001 (currentByte!8111 thiss!1577)) lt!259976) (currentByte!8111 thiss!1577))) (size!3832 (buf!4284 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8111 thiss!1577)))))

(assert (= (and d!58477 res!139070) b!167046))

(assert (=> d!58477 m!265401))

(declare-fun m!265543 () Bool)

(assert (=> d!58477 m!265543))

(assert (=> b!167046 m!265407))

(assert (=> b!167046 m!265397))

(assert (=> b!166991 d!58477))

(declare-fun d!58479 () Bool)

(assert (=> d!58479 (= (array_inv!3573 (buf!4284 thiss!1577)) (bvsge (size!3832 (buf!4284 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166992 d!58479))

(push 1)

(assert (not d!58459))

(assert (not d!58461))

(assert (not d!58471))

(assert (not b!167046))

(assert (not b!167045))

(assert (not b!167034))

(assert (not d!58477))

(assert (not b!167043))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

