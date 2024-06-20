; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36210 () Bool)

(assert start!36210)

(declare-fun b!167015 () Bool)

(declare-fun e!115810 () Bool)

(declare-datatypes ((array!8628 0))(
  ( (array!8629 (arr!4755 (Array (_ BitVec 32) (_ BitVec 8))) (size!3834 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6824 0))(
  ( (BitStream!6825 (buf!4286 array!8628) (currentByte!8113 (_ BitVec 32)) (currentBit!8108 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6824)

(assert (=> b!167015 (= e!115810 (not (or (bvsgt #b00000000000000000000000000000000 (currentByte!8113 thiss!1577)) (bvsgt (currentByte!8113 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577))) (and (bvsle (currentByte!8113 thiss!1577) (size!3834 (buf!4286 thiss!1577))) (bvsle (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577)) (size!3834 (buf!4286 thiss!1577)))))))))

(declare-fun lt!260019 () (_ BitVec 32))

(declare-fun lt!260023 () (_ BitVec 8))

(declare-fun lt!260021 () array!8628)

(declare-fun lt!260024 () (_ BitVec 32))

(declare-fun arrayRangesEq!663 (array!8628 array!8628 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167015 (arrayRangesEq!663 lt!260021 (array!8629 (store (store (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8108 thiss!1577)))))))) (bvlshr (bvand lt!260024 #b00000000000000000000000011111111) lt!260019)))) (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577)) lt!260023) (size!3834 (buf!4286 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577)))))

(declare-datatypes ((Unit!11616 0))(
  ( (Unit!11617) )
))
(declare-fun lt!260018 () Unit!11616)

(declare-fun arrayUpdatedAtPrefixLemma!271 (array!8628 (_ BitVec 32) (_ BitVec 8)) Unit!11616)

(assert (=> b!167015 (= lt!260018 (arrayUpdatedAtPrefixLemma!271 lt!260021 (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577)) lt!260023))))

(assert (=> b!167015 (arrayRangesEq!663 (buf!4286 thiss!1577) (array!8629 (store (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577) (select (store (store (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8108 thiss!1577)))))))) (bvlshr (bvand lt!260024 #b00000000000000000000000011111111) lt!260019)))) (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577)) lt!260023) (currentByte!8113 thiss!1577))) (size!3834 (buf!4286 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8113 thiss!1577))))

(declare-fun lt!260022 () Unit!11616)

(assert (=> b!167015 (= lt!260022 (arrayUpdatedAtPrefixLemma!271 (buf!4286 thiss!1577) (currentByte!8113 thiss!1577) (select (store (store (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8108 thiss!1577)))))))) (bvlshr (bvand lt!260024 #b00000000000000000000000011111111) lt!260019)))) (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577)) lt!260023) (currentByte!8113 thiss!1577))))))

(declare-fun lt!260020 () (_ BitVec 32))

(assert (=> b!167015 (= lt!260023 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8108 thiss!1577)))))))) (bvlshr (bvand lt!260024 #b00000000000000000000000011111111) lt!260019)))) (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260020))) (bvshl lt!260024 lt!260020))))))

(assert (=> b!167015 (= lt!260020 (bvsub #b00000000000000000000000000001000 lt!260019))))

(assert (=> b!167015 (= lt!260021 (array!8629 (store (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8108 thiss!1577)))))))) (bvlshr (bvand lt!260024 #b00000000000000000000000011111111) lt!260019)))) (size!3834 (buf!4286 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!167015 (= lt!260024 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167015 (= lt!260019 (bvsub (bvadd (currentBit!8108 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167013 () Bool)

(declare-fun res!139040 () Bool)

(assert (=> b!167013 (=> (not res!139040) (not e!115810))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167013 (= res!139040 (validate_offset_bits!1 ((_ sign_extend 32) (size!3834 (buf!4286 thiss!1577))) ((_ sign_extend 32) (currentByte!8113 thiss!1577)) ((_ sign_extend 32) (currentBit!8108 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!167014 () Bool)

(declare-fun res!139039 () Bool)

(assert (=> b!167014 (=> (not res!139039) (not e!115810))))

(assert (=> b!167014 (= res!139039 (bvsgt (bvadd (currentBit!8108 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167016 () Bool)

(declare-fun e!115811 () Bool)

(declare-fun array_inv!3575 (array!8628) Bool)

(assert (=> b!167016 (= e!115811 (array_inv!3575 (buf!4286 thiss!1577)))))

(declare-fun res!139038 () Bool)

(assert (=> start!36210 (=> (not res!139038) (not e!115810))))

(assert (=> start!36210 (= res!139038 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36210 e!115810))

(assert (=> start!36210 true))

(declare-fun inv!12 (BitStream!6824) Bool)

(assert (=> start!36210 (and (inv!12 thiss!1577) e!115811)))

(assert (= (and start!36210 res!139038) b!167013))

(assert (= (and b!167013 res!139040) b!167014))

(assert (= (and b!167014 res!139039) b!167015))

(assert (= start!36210 b!167016))

(declare-fun m!265455 () Bool)

(assert (=> b!167015 m!265455))

(declare-fun m!265457 () Bool)

(assert (=> b!167015 m!265457))

(declare-fun m!265459 () Bool)

(assert (=> b!167015 m!265459))

(declare-fun m!265461 () Bool)

(assert (=> b!167015 m!265461))

(declare-fun m!265463 () Bool)

(assert (=> b!167015 m!265463))

(declare-fun m!265465 () Bool)

(assert (=> b!167015 m!265465))

(assert (=> b!167015 m!265455))

(declare-fun m!265467 () Bool)

(assert (=> b!167015 m!265467))

(declare-fun m!265469 () Bool)

(assert (=> b!167015 m!265469))

(declare-fun m!265471 () Bool)

(assert (=> b!167015 m!265471))

(declare-fun m!265473 () Bool)

(assert (=> b!167015 m!265473))

(declare-fun m!265475 () Bool)

(assert (=> b!167015 m!265475))

(declare-fun m!265477 () Bool)

(assert (=> b!167015 m!265477))

(declare-fun m!265479 () Bool)

(assert (=> b!167015 m!265479))

(declare-fun m!265481 () Bool)

(assert (=> b!167013 m!265481))

(declare-fun m!265483 () Bool)

(assert (=> b!167016 m!265483))

(declare-fun m!265485 () Bool)

(assert (=> start!36210 m!265485))

(push 1)

(assert (not b!167013))

(assert (not start!36210))

(assert (not b!167015))

(assert (not b!167016))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58465 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58465 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3834 (buf!4286 thiss!1577))) ((_ sign_extend 32) (currentByte!8113 thiss!1577)) ((_ sign_extend 32) (currentBit!8108 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3834 (buf!4286 thiss!1577))) ((_ sign_extend 32) (currentByte!8113 thiss!1577)) ((_ sign_extend 32) (currentBit!8108 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14511 () Bool)

(assert (= bs!14511 d!58465))

(declare-fun m!265515 () Bool)

(assert (=> bs!14511 m!265515))

(assert (=> b!167013 d!58465))

(declare-fun d!58467 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58467 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8108 thiss!1577) (currentByte!8113 thiss!1577) (size!3834 (buf!4286 thiss!1577))))))

(declare-fun bs!14512 () Bool)

(assert (= bs!14512 d!58467))

(declare-fun m!265517 () Bool)

(assert (=> bs!14512 m!265517))

(assert (=> start!36210 d!58467))

(declare-fun d!58469 () Bool)

(declare-fun res!139063 () Bool)

(declare-fun e!115835 () Bool)

(assert (=> d!58469 (=> res!139063 e!115835)))

(assert (=> d!58469 (= res!139063 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577))))))

(assert (=> d!58469 (= (arrayRangesEq!663 lt!260021 (array!8629 (store (store (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8108 thiss!1577)))))))) (bvlshr (bvand lt!260024 #b00000000000000000000000011111111) lt!260019)))) (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577)) lt!260023) (size!3834 (buf!4286 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577))) e!115835)))

(declare-fun b!167039 () Bool)

(declare-fun e!115836 () Bool)

(assert (=> b!167039 (= e!115835 e!115836)))

(declare-fun res!139064 () Bool)

(assert (=> b!167039 (=> (not res!139064) (not e!115836))))

(assert (=> b!167039 (= res!139064 (= (select (arr!4755 lt!260021) #b00000000000000000000000000000000) (select (arr!4755 (array!8629 (store (store (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8108 thiss!1577)))))))) (bvlshr (bvand lt!260024 #b00000000000000000000000011111111) lt!260019)))) (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577)) lt!260023) (size!3834 (buf!4286 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!167040 () Bool)

(assert (=> b!167040 (= e!115836 (arrayRangesEq!663 lt!260021 (array!8629 (store (store (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8108 thiss!1577)))))))) (bvlshr (bvand lt!260024 #b00000000000000000000000011111111) lt!260019)))) (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577)) lt!260023) (size!3834 (buf!4286 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577))))))

(assert (= (and d!58469 (not res!139063)) b!167039))

(assert (= (and b!167039 res!139064) b!167040))

(declare-fun m!265525 () Bool)

(assert (=> b!167039 m!265525))

(declare-fun m!265527 () Bool)

(assert (=> b!167039 m!265527))

(declare-fun m!265529 () Bool)

(assert (=> b!167040 m!265529))

(assert (=> b!167015 d!58469))

(declare-fun d!58473 () Bool)

(declare-fun e!115845 () Bool)

(assert (=> d!58473 e!115845))

(declare-fun res!139073 () Bool)

(assert (=> d!58473 (=> (not res!139073) (not e!115845))))

(assert (=> d!58473 (= res!139073 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577)) (size!3834 lt!260021))))))

(declare-fun lt!260035 () Unit!11616)

(declare-fun choose!238 (array!8628 (_ BitVec 32) (_ BitVec 8)) Unit!11616)

(assert (=> d!58473 (= lt!260035 (choose!238 lt!260021 (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577)) lt!260023))))

(assert (=> d!58473 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577)) (size!3834 lt!260021)))))

(assert (=> d!58473 (= (arrayUpdatedAtPrefixLemma!271 lt!260021 (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577)) lt!260023) lt!260035)))

(declare-fun b!167049 () Bool)

(assert (=> b!167049 (= e!115845 (arrayRangesEq!663 lt!260021 (array!8629 (store (arr!4755 lt!260021) (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577)) lt!260023) (size!3834 lt!260021)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577))))))

(assert (= (and d!58473 res!139073) b!167049))

(declare-fun m!265545 () Bool)

(assert (=> d!58473 m!265545))

(declare-fun m!265547 () Bool)

(assert (=> b!167049 m!265547))

(declare-fun m!265549 () Bool)

(assert (=> b!167049 m!265549))

(assert (=> b!167015 d!58473))

(declare-fun d!58481 () Bool)

(declare-fun res!139074 () Bool)

(declare-fun e!115846 () Bool)

(assert (=> d!58481 (=> res!139074 e!115846)))

(assert (=> d!58481 (= res!139074 (= #b00000000000000000000000000000000 (currentByte!8113 thiss!1577)))))

(assert (=> d!58481 (= (arrayRangesEq!663 (buf!4286 thiss!1577) (array!8629 (store (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577) (select (store (store (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8108 thiss!1577)))))))) (bvlshr (bvand lt!260024 #b00000000000000000000000011111111) lt!260019)))) (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577)) lt!260023) (currentByte!8113 thiss!1577))) (size!3834 (buf!4286 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8113 thiss!1577)) e!115846)))

(declare-fun b!167050 () Bool)

(declare-fun e!115847 () Bool)

(assert (=> b!167050 (= e!115846 e!115847)))

(declare-fun res!139075 () Bool)

(assert (=> b!167050 (=> (not res!139075) (not e!115847))))

(assert (=> b!167050 (= res!139075 (= (select (arr!4755 (buf!4286 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4755 (array!8629 (store (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577) (select (store (store (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8108 thiss!1577)))))))) (bvlshr (bvand lt!260024 #b00000000000000000000000011111111) lt!260019)))) (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577)) lt!260023) (currentByte!8113 thiss!1577))) (size!3834 (buf!4286 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!167051 () Bool)

(assert (=> b!167051 (= e!115847 (arrayRangesEq!663 (buf!4286 thiss!1577) (array!8629 (store (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577) (select (store (store (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4755 (buf!4286 thiss!1577)) (currentByte!8113 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8108 thiss!1577)))))))) (bvlshr (bvand lt!260024 #b00000000000000000000000011111111) lt!260019)))) (bvadd #b00000000000000000000000000000001 (currentByte!8113 thiss!1577)) lt!260023) (currentByte!8113 thiss!1577))) (size!3834 (buf!4286 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8113 thiss!1577)))))

(assert (= (and d!58481 (not res!139074)) b!167050))

(assert (= (and b!167050 res!139075) b!167051))

(declare-fun m!265551 () Bool)

(assert (=> b!167050 m!265551))

(declare-fun m!265553 () Bool)

(assert (=> b!167050 m!265553))

(declare-fun m!265555 () Bool)

(assert (=> b!167051 m!265555))

(assert (=> b!167015 d!58481))

(declare-fun d!58483 () Bool)

(declare-fun e!115848 () Bool)

(assert (=> d!58483 e!115848))

(declare-fun res!139076 () Bool)

(assert (=> d!58483 (=> (not res!139076) (not e!115848))))

(assert (=> d!58483 (= res!139076 (and (bvsge (currentByte!8113 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8113 thiss!1577) (size!3834 (buf!4286 thiss!1577)))))))

(declare-fun lt!260036 () Unit!11616)

