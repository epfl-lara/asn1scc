; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36208 () Bool)

(assert start!36208)

(declare-fun b!167002 () Bool)

(declare-fun res!139029 () Bool)

(declare-fun e!115803 () Bool)

(assert (=> b!167002 (=> (not res!139029) (not e!115803))))

(declare-datatypes ((array!8626 0))(
  ( (array!8627 (arr!4754 (Array (_ BitVec 32) (_ BitVec 8))) (size!3833 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6822 0))(
  ( (BitStream!6823 (buf!4285 array!8626) (currentByte!8112 (_ BitVec 32)) (currentBit!8107 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6822)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!167002 (= res!139029 (bvsgt (bvadd (currentBit!8107 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167003 () Bool)

(assert (=> b!167003 (= e!115803 (not (or (bvsgt #b00000000000000000000000000000000 (currentByte!8112 thiss!1577)) (bvsgt (currentByte!8112 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577))) (and (bvsle (currentByte!8112 thiss!1577) (size!3833 (buf!4285 thiss!1577))) (bvsle (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)) (size!3833 (buf!4285 thiss!1577)))))))))

(declare-fun lt!260002 () (_ BitVec 32))

(declare-fun lt!259997 () array!8626)

(declare-fun lt!260001 () (_ BitVec 8))

(declare-fun lt!259999 () (_ BitVec 32))

(declare-fun arrayRangesEq!662 (array!8626 array!8626 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167003 (arrayRangesEq!662 lt!259997 (array!8627 (store (store (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8107 thiss!1577)))))))) (bvlshr (bvand lt!260002 #b00000000000000000000000011111111) lt!259999)))) (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)) lt!260001) (size!3833 (buf!4285 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)))))

(declare-datatypes ((Unit!11614 0))(
  ( (Unit!11615) )
))
(declare-fun lt!260000 () Unit!11614)

(declare-fun arrayUpdatedAtPrefixLemma!270 (array!8626 (_ BitVec 32) (_ BitVec 8)) Unit!11614)

(assert (=> b!167003 (= lt!260000 (arrayUpdatedAtPrefixLemma!270 lt!259997 (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)) lt!260001))))

(assert (=> b!167003 (arrayRangesEq!662 (buf!4285 thiss!1577) (array!8627 (store (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577) (select (store (store (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8107 thiss!1577)))))))) (bvlshr (bvand lt!260002 #b00000000000000000000000011111111) lt!259999)))) (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)) lt!260001) (currentByte!8112 thiss!1577))) (size!3833 (buf!4285 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8112 thiss!1577))))

(declare-fun lt!260003 () Unit!11614)

(assert (=> b!167003 (= lt!260003 (arrayUpdatedAtPrefixLemma!270 (buf!4285 thiss!1577) (currentByte!8112 thiss!1577) (select (store (store (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8107 thiss!1577)))))))) (bvlshr (bvand lt!260002 #b00000000000000000000000011111111) lt!259999)))) (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)) lt!260001) (currentByte!8112 thiss!1577))))))

(declare-fun lt!259998 () (_ BitVec 32))

(assert (=> b!167003 (= lt!260001 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8107 thiss!1577)))))))) (bvlshr (bvand lt!260002 #b00000000000000000000000011111111) lt!259999)))) (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!259998))) (bvshl lt!260002 lt!259998))))))

(assert (=> b!167003 (= lt!259998 (bvsub #b00000000000000000000000000001000 lt!259999))))

(assert (=> b!167003 (= lt!259997 (array!8627 (store (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8107 thiss!1577)))))))) (bvlshr (bvand lt!260002 #b00000000000000000000000011111111) lt!259999)))) (size!3833 (buf!4285 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!167003 (= lt!260002 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167003 (= lt!259999 (bvsub (bvadd (currentBit!8107 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167004 () Bool)

(declare-fun e!115802 () Bool)

(declare-fun array_inv!3574 (array!8626) Bool)

(assert (=> b!167004 (= e!115802 (array_inv!3574 (buf!4285 thiss!1577)))))

(declare-fun res!139030 () Bool)

(assert (=> start!36208 (=> (not res!139030) (not e!115803))))

(assert (=> start!36208 (= res!139030 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36208 e!115803))

(assert (=> start!36208 true))

(declare-fun inv!12 (BitStream!6822) Bool)

(assert (=> start!36208 (and (inv!12 thiss!1577) e!115802)))

(declare-fun b!167001 () Bool)

(declare-fun res!139031 () Bool)

(assert (=> b!167001 (=> (not res!139031) (not e!115803))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167001 (= res!139031 (validate_offset_bits!1 ((_ sign_extend 32) (size!3833 (buf!4285 thiss!1577))) ((_ sign_extend 32) (currentByte!8112 thiss!1577)) ((_ sign_extend 32) (currentBit!8107 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!36208 res!139030) b!167001))

(assert (= (and b!167001 res!139031) b!167002))

(assert (= (and b!167002 res!139029) b!167003))

(assert (= start!36208 b!167004))

(declare-fun m!265423 () Bool)

(assert (=> b!167003 m!265423))

(declare-fun m!265425 () Bool)

(assert (=> b!167003 m!265425))

(declare-fun m!265427 () Bool)

(assert (=> b!167003 m!265427))

(declare-fun m!265429 () Bool)

(assert (=> b!167003 m!265429))

(declare-fun m!265431 () Bool)

(assert (=> b!167003 m!265431))

(declare-fun m!265433 () Bool)

(assert (=> b!167003 m!265433))

(declare-fun m!265435 () Bool)

(assert (=> b!167003 m!265435))

(assert (=> b!167003 m!265423))

(declare-fun m!265437 () Bool)

(assert (=> b!167003 m!265437))

(declare-fun m!265439 () Bool)

(assert (=> b!167003 m!265439))

(declare-fun m!265441 () Bool)

(assert (=> b!167003 m!265441))

(declare-fun m!265443 () Bool)

(assert (=> b!167003 m!265443))

(declare-fun m!265445 () Bool)

(assert (=> b!167003 m!265445))

(declare-fun m!265447 () Bool)

(assert (=> b!167003 m!265447))

(declare-fun m!265449 () Bool)

(assert (=> b!167004 m!265449))

(declare-fun m!265451 () Bool)

(assert (=> start!36208 m!265451))

(declare-fun m!265453 () Bool)

(assert (=> b!167001 m!265453))

(check-sat (not b!167003) (not b!167004) (not start!36208) (not b!167001))
(check-sat)
(get-model)

(declare-fun d!58445 () Bool)

(declare-fun res!139045 () Bool)

(declare-fun e!115817 () Bool)

(assert (=> d!58445 (=> res!139045 e!115817)))

(assert (=> d!58445 (= res!139045 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577))))))

(assert (=> d!58445 (= (arrayRangesEq!662 lt!259997 (array!8627 (store (store (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8107 thiss!1577)))))))) (bvlshr (bvand lt!260002 #b00000000000000000000000011111111) lt!259999)))) (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)) lt!260001) (size!3833 (buf!4285 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577))) e!115817)))

(declare-fun b!167021 () Bool)

(declare-fun e!115818 () Bool)

(assert (=> b!167021 (= e!115817 e!115818)))

(declare-fun res!139046 () Bool)

(assert (=> b!167021 (=> (not res!139046) (not e!115818))))

(assert (=> b!167021 (= res!139046 (= (select (arr!4754 lt!259997) #b00000000000000000000000000000000) (select (arr!4754 (array!8627 (store (store (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8107 thiss!1577)))))))) (bvlshr (bvand lt!260002 #b00000000000000000000000011111111) lt!259999)))) (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)) lt!260001) (size!3833 (buf!4285 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!167022 () Bool)

(assert (=> b!167022 (= e!115818 (arrayRangesEq!662 lt!259997 (array!8627 (store (store (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8107 thiss!1577)))))))) (bvlshr (bvand lt!260002 #b00000000000000000000000011111111) lt!259999)))) (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)) lt!260001) (size!3833 (buf!4285 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577))))))

(assert (= (and d!58445 (not res!139045)) b!167021))

(assert (= (and b!167021 res!139046) b!167022))

(declare-fun m!265487 () Bool)

(assert (=> b!167021 m!265487))

(declare-fun m!265489 () Bool)

(assert (=> b!167021 m!265489))

(declare-fun m!265491 () Bool)

(assert (=> b!167022 m!265491))

(assert (=> b!167003 d!58445))

(declare-fun d!58447 () Bool)

(declare-fun e!115821 () Bool)

(assert (=> d!58447 e!115821))

(declare-fun res!139049 () Bool)

(assert (=> d!58447 (=> (not res!139049) (not e!115821))))

(assert (=> d!58447 (= res!139049 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)) (size!3833 lt!259997))))))

(declare-fun lt!260027 () Unit!11614)

(declare-fun choose!236 (array!8626 (_ BitVec 32) (_ BitVec 8)) Unit!11614)

(assert (=> d!58447 (= lt!260027 (choose!236 lt!259997 (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)) lt!260001))))

(assert (=> d!58447 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)) (size!3833 lt!259997)))))

(assert (=> d!58447 (= (arrayUpdatedAtPrefixLemma!270 lt!259997 (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)) lt!260001) lt!260027)))

(declare-fun b!167025 () Bool)

(assert (=> b!167025 (= e!115821 (arrayRangesEq!662 lt!259997 (array!8627 (store (arr!4754 lt!259997) (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)) lt!260001) (size!3833 lt!259997)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577))))))

(assert (= (and d!58447 res!139049) b!167025))

(declare-fun m!265493 () Bool)

(assert (=> d!58447 m!265493))

(declare-fun m!265495 () Bool)

(assert (=> b!167025 m!265495))

(declare-fun m!265497 () Bool)

(assert (=> b!167025 m!265497))

(assert (=> b!167003 d!58447))

(declare-fun d!58449 () Bool)

(declare-fun res!139050 () Bool)

(declare-fun e!115822 () Bool)

(assert (=> d!58449 (=> res!139050 e!115822)))

(assert (=> d!58449 (= res!139050 (= #b00000000000000000000000000000000 (currentByte!8112 thiss!1577)))))

(assert (=> d!58449 (= (arrayRangesEq!662 (buf!4285 thiss!1577) (array!8627 (store (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577) (select (store (store (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8107 thiss!1577)))))))) (bvlshr (bvand lt!260002 #b00000000000000000000000011111111) lt!259999)))) (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)) lt!260001) (currentByte!8112 thiss!1577))) (size!3833 (buf!4285 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8112 thiss!1577)) e!115822)))

(declare-fun b!167026 () Bool)

(declare-fun e!115823 () Bool)

(assert (=> b!167026 (= e!115822 e!115823)))

(declare-fun res!139051 () Bool)

(assert (=> b!167026 (=> (not res!139051) (not e!115823))))

(assert (=> b!167026 (= res!139051 (= (select (arr!4754 (buf!4285 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4754 (array!8627 (store (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577) (select (store (store (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8107 thiss!1577)))))))) (bvlshr (bvand lt!260002 #b00000000000000000000000011111111) lt!259999)))) (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)) lt!260001) (currentByte!8112 thiss!1577))) (size!3833 (buf!4285 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!167027 () Bool)

(assert (=> b!167027 (= e!115823 (arrayRangesEq!662 (buf!4285 thiss!1577) (array!8627 (store (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577) (select (store (store (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8107 thiss!1577)))))))) (bvlshr (bvand lt!260002 #b00000000000000000000000011111111) lt!259999)))) (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)) lt!260001) (currentByte!8112 thiss!1577))) (size!3833 (buf!4285 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8112 thiss!1577)))))

(assert (= (and d!58449 (not res!139050)) b!167026))

(assert (= (and b!167026 res!139051) b!167027))

(declare-fun m!265499 () Bool)

(assert (=> b!167026 m!265499))

(declare-fun m!265501 () Bool)

(assert (=> b!167026 m!265501))

(declare-fun m!265503 () Bool)

(assert (=> b!167027 m!265503))

(assert (=> b!167003 d!58449))

(declare-fun d!58451 () Bool)

(declare-fun e!115824 () Bool)

(assert (=> d!58451 e!115824))

(declare-fun res!139052 () Bool)

(assert (=> d!58451 (=> (not res!139052) (not e!115824))))

(assert (=> d!58451 (= res!139052 (and (bvsge (currentByte!8112 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8112 thiss!1577) (size!3833 (buf!4285 thiss!1577)))))))

(declare-fun lt!260028 () Unit!11614)

(assert (=> d!58451 (= lt!260028 (choose!236 (buf!4285 thiss!1577) (currentByte!8112 thiss!1577) (select (store (store (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8107 thiss!1577)))))))) (bvlshr (bvand lt!260002 #b00000000000000000000000011111111) lt!259999)))) (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)) lt!260001) (currentByte!8112 thiss!1577))))))

(assert (=> d!58451 (and (bvsle #b00000000000000000000000000000000 (currentByte!8112 thiss!1577)) (bvslt (currentByte!8112 thiss!1577) (size!3833 (buf!4285 thiss!1577))))))

(assert (=> d!58451 (= (arrayUpdatedAtPrefixLemma!270 (buf!4285 thiss!1577) (currentByte!8112 thiss!1577) (select (store (store (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8107 thiss!1577)))))))) (bvlshr (bvand lt!260002 #b00000000000000000000000011111111) lt!259999)))) (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)) lt!260001) (currentByte!8112 thiss!1577))) lt!260028)))

(declare-fun b!167028 () Bool)

(assert (=> b!167028 (= e!115824 (arrayRangesEq!662 (buf!4285 thiss!1577) (array!8627 (store (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577) (select (store (store (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4754 (buf!4285 thiss!1577)) (currentByte!8112 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8107 thiss!1577)))))))) (bvlshr (bvand lt!260002 #b00000000000000000000000011111111) lt!259999)))) (bvadd #b00000000000000000000000000000001 (currentByte!8112 thiss!1577)) lt!260001) (currentByte!8112 thiss!1577))) (size!3833 (buf!4285 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8112 thiss!1577)))))

(assert (= (and d!58451 res!139052) b!167028))

(assert (=> d!58451 m!265423))

(declare-fun m!265505 () Bool)

(assert (=> d!58451 m!265505))

(assert (=> b!167028 m!265429))

(assert (=> b!167028 m!265439))

(assert (=> b!167003 d!58451))

(declare-fun d!58453 () Bool)

(assert (=> d!58453 (= (array_inv!3574 (buf!4285 thiss!1577)) (bvsge (size!3833 (buf!4285 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!167004 d!58453))

(declare-fun d!58455 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58455 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8107 thiss!1577) (currentByte!8112 thiss!1577) (size!3833 (buf!4285 thiss!1577))))))

(declare-fun bs!14507 () Bool)

(assert (= bs!14507 d!58455))

(declare-fun m!265507 () Bool)

(assert (=> bs!14507 m!265507))

(assert (=> start!36208 d!58455))

(declare-fun d!58457 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58457 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3833 (buf!4285 thiss!1577))) ((_ sign_extend 32) (currentByte!8112 thiss!1577)) ((_ sign_extend 32) (currentBit!8107 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3833 (buf!4285 thiss!1577))) ((_ sign_extend 32) (currentByte!8112 thiss!1577)) ((_ sign_extend 32) (currentBit!8107 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14508 () Bool)

(assert (= bs!14508 d!58457))

(declare-fun m!265509 () Bool)

(assert (=> bs!14508 m!265509))

(assert (=> b!167001 d!58457))

(check-sat (not b!167027) (not b!167022) (not d!58457) (not b!167025) (not b!167028) (not d!58455) (not d!58451) (not d!58447))
(check-sat)
