; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36300 () Bool)

(assert start!36300)

(declare-fun b!167259 () Bool)

(declare-fun res!139243 () Bool)

(declare-fun e!116014 () Bool)

(assert (=> b!167259 (=> (not res!139243) (not e!116014))))

(declare-datatypes ((array!8662 0))(
  ( (array!8663 (arr!4769 (Array (_ BitVec 32) (_ BitVec 8))) (size!3848 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6852 0))(
  ( (BitStream!6853 (buf!4300 array!8662) (currentByte!8134 (_ BitVec 32)) (currentBit!8129 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6852)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!167259 (= res!139243 (bvsgt (bvadd (currentBit!8129 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167260 () Bool)

(declare-fun e!116017 () Bool)

(assert (=> b!167260 (= e!116014 (not e!116017))))

(declare-fun res!139245 () Bool)

(assert (=> b!167260 (=> res!139245 e!116017)))

(declare-fun lt!260416 () (_ BitVec 32))

(declare-fun lt!260412 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167260 (= res!139245 (not (byteRangesEq!0 (select (arr!4769 (buf!4300 thiss!1577)) (currentByte!8134 thiss!1577)) lt!260412 #b00000000000000000000000000000000 lt!260416)))))

(declare-fun lt!260414 () array!8662)

(declare-fun arrayRangesEq!677 (array!8662 array!8662 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167260 (arrayRangesEq!677 (buf!4300 thiss!1577) lt!260414 #b00000000000000000000000000000000 (currentByte!8134 thiss!1577))))

(declare-datatypes ((Unit!11644 0))(
  ( (Unit!11645) )
))
(declare-fun lt!260409 () Unit!11644)

(declare-fun lt!260410 () array!8662)

(declare-fun arrayRangesEqTransitive!179 (array!8662 array!8662 array!8662 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11644)

(assert (=> b!167260 (= lt!260409 (arrayRangesEqTransitive!179 (buf!4300 thiss!1577) lt!260410 lt!260414 #b00000000000000000000000000000000 (currentByte!8134 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577))))))

(assert (=> b!167260 (arrayRangesEq!677 lt!260410 lt!260414 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)))))

(declare-fun lt!260407 () (_ BitVec 8))

(declare-fun lt!260408 () Unit!11644)

(declare-fun arrayUpdatedAtPrefixLemma!285 (array!8662 (_ BitVec 32) (_ BitVec 8)) Unit!11644)

(assert (=> b!167260 (= lt!260408 (arrayUpdatedAtPrefixLemma!285 lt!260410 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260407))))

(assert (=> b!167260 (arrayRangesEq!677 (buf!4300 thiss!1577) (array!8663 (store (arr!4769 (buf!4300 thiss!1577)) (currentByte!8134 thiss!1577) lt!260412) (size!3848 (buf!4300 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8134 thiss!1577))))

(declare-fun lt!260415 () Unit!11644)

(assert (=> b!167260 (= lt!260415 (arrayUpdatedAtPrefixLemma!285 (buf!4300 thiss!1577) (currentByte!8134 thiss!1577) lt!260412))))

(declare-fun lt!260411 () (_ BitVec 32))

(assert (=> b!167260 (= lt!260412 (select (store (store (arr!4769 (buf!4300 thiss!1577)) (currentByte!8134 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4769 (buf!4300 thiss!1577)) (currentByte!8134 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8129 thiss!1577)))))))) (bvlshr (bvand lt!260411 #b00000000000000000000000011111111) lt!260416)))) (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260407) (currentByte!8134 thiss!1577)))))

(assert (=> b!167260 (= lt!260414 (array!8663 (store (store (arr!4769 (buf!4300 thiss!1577)) (currentByte!8134 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4769 (buf!4300 thiss!1577)) (currentByte!8134 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8129 thiss!1577)))))))) (bvlshr (bvand lt!260411 #b00000000000000000000000011111111) lt!260416)))) (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260407) (size!3848 (buf!4300 thiss!1577))))))

(declare-fun lt!260413 () (_ BitVec 32))

(assert (=> b!167260 (= lt!260407 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4769 (buf!4300 thiss!1577)) (currentByte!8134 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4769 (buf!4300 thiss!1577)) (currentByte!8134 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8129 thiss!1577)))))))) (bvlshr (bvand lt!260411 #b00000000000000000000000011111111) lt!260416)))) (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260413))) (bvshl lt!260411 lt!260413))))))

(assert (=> b!167260 (= lt!260413 (bvsub #b00000000000000000000000000001000 lt!260416))))

(assert (=> b!167260 (= lt!260410 (array!8663 (store (arr!4769 (buf!4300 thiss!1577)) (currentByte!8134 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4769 (buf!4300 thiss!1577)) (currentByte!8134 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8129 thiss!1577)))))))) (bvlshr (bvand lt!260411 #b00000000000000000000000011111111) lt!260416)))) (size!3848 (buf!4300 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!167260 (= lt!260411 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167260 (= lt!260416 (bvsub (bvadd (currentBit!8129 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!139244 () Bool)

(assert (=> start!36300 (=> (not res!139244) (not e!116014))))

(assert (=> start!36300 (= res!139244 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36300 e!116014))

(assert (=> start!36300 true))

(declare-fun e!116016 () Bool)

(declare-fun inv!12 (BitStream!6852) Bool)

(assert (=> start!36300 (and (inv!12 thiss!1577) e!116016)))

(declare-fun b!167261 () Bool)

(declare-fun array_inv!3589 (array!8662) Bool)

(assert (=> b!167261 (= e!116016 (array_inv!3589 (buf!4300 thiss!1577)))))

(declare-fun b!167262 () Bool)

(declare-fun res!139242 () Bool)

(assert (=> b!167262 (=> (not res!139242) (not e!116014))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167262 (= res!139242 (validate_offset_bits!1 ((_ sign_extend 32) (size!3848 (buf!4300 thiss!1577))) ((_ sign_extend 32) (currentByte!8134 thiss!1577)) ((_ sign_extend 32) (currentBit!8129 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!167263 () Bool)

(assert (=> b!167263 (= e!116017 (inv!12 (BitStream!6853 lt!260414 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260416)))))

(assert (= (and start!36300 res!139244) b!167262))

(assert (= (and b!167262 res!139242) b!167259))

(assert (= (and b!167259 res!139243) b!167260))

(assert (= (and b!167260 (not res!139245)) b!167263))

(assert (= start!36300 b!167261))

(declare-fun m!266071 () Bool)

(assert (=> b!167263 m!266071))

(declare-fun m!266073 () Bool)

(assert (=> b!167262 m!266073))

(declare-fun m!266075 () Bool)

(assert (=> start!36300 m!266075))

(declare-fun m!266077 () Bool)

(assert (=> b!167261 m!266077))

(declare-fun m!266079 () Bool)

(assert (=> b!167260 m!266079))

(declare-fun m!266081 () Bool)

(assert (=> b!167260 m!266081))

(declare-fun m!266083 () Bool)

(assert (=> b!167260 m!266083))

(declare-fun m!266085 () Bool)

(assert (=> b!167260 m!266085))

(declare-fun m!266087 () Bool)

(assert (=> b!167260 m!266087))

(declare-fun m!266089 () Bool)

(assert (=> b!167260 m!266089))

(declare-fun m!266091 () Bool)

(assert (=> b!167260 m!266091))

(declare-fun m!266093 () Bool)

(assert (=> b!167260 m!266093))

(declare-fun m!266095 () Bool)

(assert (=> b!167260 m!266095))

(declare-fun m!266097 () Bool)

(assert (=> b!167260 m!266097))

(declare-fun m!266099 () Bool)

(assert (=> b!167260 m!266099))

(declare-fun m!266101 () Bool)

(assert (=> b!167260 m!266101))

(declare-fun m!266103 () Bool)

(assert (=> b!167260 m!266103))

(declare-fun m!266105 () Bool)

(assert (=> b!167260 m!266105))

(assert (=> b!167260 m!266085))

(declare-fun m!266107 () Bool)

(assert (=> b!167260 m!266107))

(declare-fun m!266109 () Bool)

(assert (=> b!167260 m!266109))

(check-sat (not b!167262) (not b!167263) (not start!36300) (not b!167260) (not b!167261))
(check-sat)
(get-model)

(declare-fun d!58541 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58541 (= (inv!12 (BitStream!6853 lt!260414 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260416)) (invariant!0 (currentBit!8129 (BitStream!6853 lt!260414 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260416)) (currentByte!8134 (BitStream!6853 lt!260414 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260416)) (size!3848 (buf!4300 (BitStream!6853 lt!260414 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260416)))))))

(declare-fun bs!14535 () Bool)

(assert (= bs!14535 d!58541))

(declare-fun m!266151 () Bool)

(assert (=> bs!14535 m!266151))

(assert (=> b!167263 d!58541))

(declare-fun d!58543 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58543 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3848 (buf!4300 thiss!1577))) ((_ sign_extend 32) (currentByte!8134 thiss!1577)) ((_ sign_extend 32) (currentBit!8129 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3848 (buf!4300 thiss!1577))) ((_ sign_extend 32) (currentByte!8134 thiss!1577)) ((_ sign_extend 32) (currentBit!8129 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14536 () Bool)

(assert (= bs!14536 d!58543))

(declare-fun m!266153 () Bool)

(assert (=> bs!14536 m!266153))

(assert (=> b!167262 d!58543))

(declare-fun d!58545 () Bool)

(assert (=> d!58545 (= (array_inv!3589 (buf!4300 thiss!1577)) (bvsge (size!3848 (buf!4300 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!167261 d!58545))

(declare-fun d!58547 () Bool)

(declare-fun res!139262 () Bool)

(declare-fun e!116034 () Bool)

(assert (=> d!58547 (=> res!139262 e!116034)))

(assert (=> d!58547 (= res!139262 (= #b00000000000000000000000000000000 (currentByte!8134 thiss!1577)))))

(assert (=> d!58547 (= (arrayRangesEq!677 (buf!4300 thiss!1577) lt!260414 #b00000000000000000000000000000000 (currentByte!8134 thiss!1577)) e!116034)))

(declare-fun b!167283 () Bool)

(declare-fun e!116035 () Bool)

(assert (=> b!167283 (= e!116034 e!116035)))

(declare-fun res!139263 () Bool)

(assert (=> b!167283 (=> (not res!139263) (not e!116035))))

(assert (=> b!167283 (= res!139263 (= (select (arr!4769 (buf!4300 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4769 lt!260414) #b00000000000000000000000000000000)))))

(declare-fun b!167284 () Bool)

(assert (=> b!167284 (= e!116035 (arrayRangesEq!677 (buf!4300 thiss!1577) lt!260414 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8134 thiss!1577)))))

(assert (= (and d!58547 (not res!139262)) b!167283))

(assert (= (and b!167283 res!139263) b!167284))

(declare-fun m!266155 () Bool)

(assert (=> b!167283 m!266155))

(declare-fun m!266157 () Bool)

(assert (=> b!167283 m!266157))

(declare-fun m!266159 () Bool)

(assert (=> b!167284 m!266159))

(assert (=> b!167260 d!58547))

(declare-fun d!58549 () Bool)

(declare-fun e!116038 () Bool)

(assert (=> d!58549 e!116038))

(declare-fun res!139266 () Bool)

(assert (=> d!58549 (=> (not res!139266) (not e!116038))))

(assert (=> d!58549 (= res!139266 (and (bvsge (currentByte!8134 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8134 thiss!1577) (size!3848 (buf!4300 thiss!1577)))))))

(declare-fun lt!260449 () Unit!11644)

(declare-fun choose!243 (array!8662 (_ BitVec 32) (_ BitVec 8)) Unit!11644)

(assert (=> d!58549 (= lt!260449 (choose!243 (buf!4300 thiss!1577) (currentByte!8134 thiss!1577) lt!260412))))

(assert (=> d!58549 (and (bvsle #b00000000000000000000000000000000 (currentByte!8134 thiss!1577)) (bvslt (currentByte!8134 thiss!1577) (size!3848 (buf!4300 thiss!1577))))))

(assert (=> d!58549 (= (arrayUpdatedAtPrefixLemma!285 (buf!4300 thiss!1577) (currentByte!8134 thiss!1577) lt!260412) lt!260449)))

(declare-fun b!167287 () Bool)

(assert (=> b!167287 (= e!116038 (arrayRangesEq!677 (buf!4300 thiss!1577) (array!8663 (store (arr!4769 (buf!4300 thiss!1577)) (currentByte!8134 thiss!1577) lt!260412) (size!3848 (buf!4300 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8134 thiss!1577)))))

(assert (= (and d!58549 res!139266) b!167287))

(declare-fun m!266161 () Bool)

(assert (=> d!58549 m!266161))

(assert (=> b!167287 m!266081))

(assert (=> b!167287 m!266079))

(assert (=> b!167260 d!58549))

(declare-fun d!58551 () Bool)

(declare-fun res!139267 () Bool)

(declare-fun e!116039 () Bool)

(assert (=> d!58551 (=> res!139267 e!116039)))

(assert (=> d!58551 (= res!139267 (= #b00000000000000000000000000000000 (currentByte!8134 thiss!1577)))))

(assert (=> d!58551 (= (arrayRangesEq!677 (buf!4300 thiss!1577) (array!8663 (store (arr!4769 (buf!4300 thiss!1577)) (currentByte!8134 thiss!1577) lt!260412) (size!3848 (buf!4300 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8134 thiss!1577)) e!116039)))

(declare-fun b!167288 () Bool)

(declare-fun e!116040 () Bool)

(assert (=> b!167288 (= e!116039 e!116040)))

(declare-fun res!139268 () Bool)

(assert (=> b!167288 (=> (not res!139268) (not e!116040))))

(assert (=> b!167288 (= res!139268 (= (select (arr!4769 (buf!4300 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4769 (array!8663 (store (arr!4769 (buf!4300 thiss!1577)) (currentByte!8134 thiss!1577) lt!260412) (size!3848 (buf!4300 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!167289 () Bool)

(assert (=> b!167289 (= e!116040 (arrayRangesEq!677 (buf!4300 thiss!1577) (array!8663 (store (arr!4769 (buf!4300 thiss!1577)) (currentByte!8134 thiss!1577) lt!260412) (size!3848 (buf!4300 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8134 thiss!1577)))))

(assert (= (and d!58551 (not res!139267)) b!167288))

(assert (= (and b!167288 res!139268) b!167289))

(assert (=> b!167288 m!266155))

(declare-fun m!266163 () Bool)

(assert (=> b!167288 m!266163))

(declare-fun m!266165 () Bool)

(assert (=> b!167289 m!266165))

(assert (=> b!167260 d!58551))

(declare-fun d!58553 () Bool)

(assert (=> d!58553 (= (byteRangesEq!0 (select (arr!4769 (buf!4300 thiss!1577)) (currentByte!8134 thiss!1577)) lt!260412 #b00000000000000000000000000000000 lt!260416) (or (= #b00000000000000000000000000000000 lt!260416) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4769 (buf!4300 thiss!1577)) (currentByte!8134 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!260416))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!260412) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!260416))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14537 () Bool)

(assert (= bs!14537 d!58553))

(declare-fun m!266167 () Bool)

(assert (=> bs!14537 m!266167))

(declare-fun m!266169 () Bool)

(assert (=> bs!14537 m!266169))

(assert (=> b!167260 d!58553))

(declare-fun d!58555 () Bool)

(assert (=> d!58555 (arrayRangesEq!677 (buf!4300 thiss!1577) lt!260414 #b00000000000000000000000000000000 (currentByte!8134 thiss!1577))))

(declare-fun lt!260452 () Unit!11644)

(declare-fun choose!244 (array!8662 array!8662 array!8662 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11644)

(assert (=> d!58555 (= lt!260452 (choose!244 (buf!4300 thiss!1577) lt!260410 lt!260414 #b00000000000000000000000000000000 (currentByte!8134 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577))))))

(assert (=> d!58555 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!8134 thiss!1577)) (bvsle (currentByte!8134 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577))))))

(assert (=> d!58555 (= (arrayRangesEqTransitive!179 (buf!4300 thiss!1577) lt!260410 lt!260414 #b00000000000000000000000000000000 (currentByte!8134 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577))) lt!260452)))

(declare-fun bs!14538 () Bool)

(assert (= bs!14538 d!58555))

(assert (=> bs!14538 m!266091))

(declare-fun m!266171 () Bool)

(assert (=> bs!14538 m!266171))

(assert (=> b!167260 d!58555))

(declare-fun d!58557 () Bool)

(declare-fun res!139269 () Bool)

(declare-fun e!116041 () Bool)

(assert (=> d!58557 (=> res!139269 e!116041)))

(assert (=> d!58557 (= res!139269 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577))))))

(assert (=> d!58557 (= (arrayRangesEq!677 lt!260410 lt!260414 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577))) e!116041)))

(declare-fun b!167290 () Bool)

(declare-fun e!116042 () Bool)

(assert (=> b!167290 (= e!116041 e!116042)))

(declare-fun res!139270 () Bool)

(assert (=> b!167290 (=> (not res!139270) (not e!116042))))

(assert (=> b!167290 (= res!139270 (= (select (arr!4769 lt!260410) #b00000000000000000000000000000000) (select (arr!4769 lt!260414) #b00000000000000000000000000000000)))))

(declare-fun b!167291 () Bool)

(assert (=> b!167291 (= e!116042 (arrayRangesEq!677 lt!260410 lt!260414 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577))))))

(assert (= (and d!58557 (not res!139269)) b!167290))

(assert (= (and b!167290 res!139270) b!167291))

(declare-fun m!266173 () Bool)

(assert (=> b!167290 m!266173))

(assert (=> b!167290 m!266157))

(declare-fun m!266175 () Bool)

(assert (=> b!167291 m!266175))

(assert (=> b!167260 d!58557))

(declare-fun d!58559 () Bool)

(declare-fun e!116043 () Bool)

(assert (=> d!58559 e!116043))

(declare-fun res!139271 () Bool)

(assert (=> d!58559 (=> (not res!139271) (not e!116043))))

(assert (=> d!58559 (= res!139271 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) (size!3848 lt!260410))))))

(declare-fun lt!260453 () Unit!11644)

(assert (=> d!58559 (= lt!260453 (choose!243 lt!260410 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260407))))

(assert (=> d!58559 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) (size!3848 lt!260410)))))

(assert (=> d!58559 (= (arrayUpdatedAtPrefixLemma!285 lt!260410 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260407) lt!260453)))

(declare-fun b!167292 () Bool)

(assert (=> b!167292 (= e!116043 (arrayRangesEq!677 lt!260410 (array!8663 (store (arr!4769 lt!260410) (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260407) (size!3848 lt!260410)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577))))))

(assert (= (and d!58559 res!139271) b!167292))

(declare-fun m!266177 () Bool)

(assert (=> d!58559 m!266177))

(declare-fun m!266179 () Bool)

(assert (=> b!167292 m!266179))

(declare-fun m!266181 () Bool)

(assert (=> b!167292 m!266181))

(assert (=> b!167260 d!58559))

(declare-fun d!58561 () Bool)

(assert (=> d!58561 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8129 thiss!1577) (currentByte!8134 thiss!1577) (size!3848 (buf!4300 thiss!1577))))))

(declare-fun bs!14539 () Bool)

(assert (= bs!14539 d!58561))

(declare-fun m!266183 () Bool)

(assert (=> bs!14539 m!266183))

(assert (=> start!36300 d!58561))

(check-sat (not b!167292) (not d!58559) (not b!167287) (not b!167289) (not d!58541) (not d!58549) (not b!167284) (not d!58561) (not d!58555) (not d!58543) (not b!167291))
(check-sat)
(get-model)

(declare-fun d!58599 () Bool)

(assert (=> d!58599 (= (remainingBits!0 ((_ sign_extend 32) (size!3848 (buf!4300 thiss!1577))) ((_ sign_extend 32) (currentByte!8134 thiss!1577)) ((_ sign_extend 32) (currentBit!8129 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3848 (buf!4300 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8134 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8129 thiss!1577)))))))

(assert (=> d!58543 d!58599))

(declare-fun d!58601 () Bool)

(assert (=> d!58601 (arrayRangesEq!677 (buf!4300 thiss!1577) (array!8663 (store (arr!4769 (buf!4300 thiss!1577)) (currentByte!8134 thiss!1577) lt!260412) (size!3848 (buf!4300 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8134 thiss!1577))))

(assert (=> d!58601 true))

(declare-fun _$8!204 () Unit!11644)

(assert (=> d!58601 (= (choose!243 (buf!4300 thiss!1577) (currentByte!8134 thiss!1577) lt!260412) _$8!204)))

(declare-fun bs!14548 () Bool)

(assert (= bs!14548 d!58601))

(assert (=> bs!14548 m!266081))

(assert (=> bs!14548 m!266079))

(assert (=> d!58549 d!58601))

(declare-fun d!58605 () Bool)

(assert (=> d!58605 (= (invariant!0 (currentBit!8129 thiss!1577) (currentByte!8134 thiss!1577) (size!3848 (buf!4300 thiss!1577))) (and (bvsge (currentBit!8129 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!8129 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!8134 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!8134 thiss!1577) (size!3848 (buf!4300 thiss!1577))) (and (= (currentBit!8129 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!8134 thiss!1577) (size!3848 (buf!4300 thiss!1577)))))))))

(assert (=> d!58561 d!58605))

(declare-fun d!58611 () Bool)

(assert (=> d!58611 (arrayRangesEq!677 lt!260410 (array!8663 (store (arr!4769 lt!260410) (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260407) (size!3848 lt!260410)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)))))

(assert (=> d!58611 true))

(declare-fun _$8!205 () Unit!11644)

(assert (=> d!58611 (= (choose!243 lt!260410 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260407) _$8!205)))

(declare-fun bs!14549 () Bool)

(assert (= bs!14549 d!58611))

(assert (=> bs!14549 m!266179))

(assert (=> bs!14549 m!266181))

(assert (=> d!58559 d!58611))

(declare-fun d!58613 () Bool)

(declare-fun res!139300 () Bool)

(declare-fun e!116072 () Bool)

(assert (=> d!58613 (=> res!139300 e!116072)))

(assert (=> d!58613 (= res!139300 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577))))))

(assert (=> d!58613 (= (arrayRangesEq!677 lt!260410 lt!260414 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577))) e!116072)))

(declare-fun b!167321 () Bool)

(declare-fun e!116073 () Bool)

(assert (=> b!167321 (= e!116072 e!116073)))

(declare-fun res!139301 () Bool)

(assert (=> b!167321 (=> (not res!139301) (not e!116073))))

(assert (=> b!167321 (= res!139301 (= (select (arr!4769 lt!260410) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4769 lt!260414) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!167322 () Bool)

(assert (=> b!167322 (= e!116073 (arrayRangesEq!677 lt!260410 lt!260414 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577))))))

(assert (= (and d!58613 (not res!139300)) b!167321))

(assert (= (and b!167321 res!139301) b!167322))

(declare-fun m!266249 () Bool)

(assert (=> b!167321 m!266249))

(declare-fun m!266251 () Bool)

(assert (=> b!167321 m!266251))

(declare-fun m!266253 () Bool)

(assert (=> b!167322 m!266253))

(assert (=> b!167291 d!58613))

(declare-fun d!58615 () Bool)

(assert (=> d!58615 (= (invariant!0 (currentBit!8129 (BitStream!6853 lt!260414 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260416)) (currentByte!8134 (BitStream!6853 lt!260414 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260416)) (size!3848 (buf!4300 (BitStream!6853 lt!260414 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260416)))) (and (bvsge (currentBit!8129 (BitStream!6853 lt!260414 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260416)) #b00000000000000000000000000000000) (bvslt (currentBit!8129 (BitStream!6853 lt!260414 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260416)) #b00000000000000000000000000001000) (bvsge (currentByte!8134 (BitStream!6853 lt!260414 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260416)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8134 (BitStream!6853 lt!260414 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260416)) (size!3848 (buf!4300 (BitStream!6853 lt!260414 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260416)))) (and (= (currentBit!8129 (BitStream!6853 lt!260414 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260416)) #b00000000000000000000000000000000) (= (currentByte!8134 (BitStream!6853 lt!260414 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260416)) (size!3848 (buf!4300 (BitStream!6853 lt!260414 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260416))))))))))

(assert (=> d!58541 d!58615))

(declare-fun d!58617 () Bool)

(declare-fun res!139302 () Bool)

(declare-fun e!116074 () Bool)

(assert (=> d!58617 (=> res!139302 e!116074)))

(assert (=> d!58617 (= res!139302 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8134 thiss!1577)))))

(assert (=> d!58617 (= (arrayRangesEq!677 (buf!4300 thiss!1577) lt!260414 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8134 thiss!1577)) e!116074)))

(declare-fun b!167323 () Bool)

(declare-fun e!116075 () Bool)

(assert (=> b!167323 (= e!116074 e!116075)))

(declare-fun res!139303 () Bool)

(assert (=> b!167323 (=> (not res!139303) (not e!116075))))

(assert (=> b!167323 (= res!139303 (= (select (arr!4769 (buf!4300 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4769 lt!260414) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!167324 () Bool)

(assert (=> b!167324 (= e!116075 (arrayRangesEq!677 (buf!4300 thiss!1577) lt!260414 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8134 thiss!1577)))))

(assert (= (and d!58617 (not res!139302)) b!167323))

(assert (= (and b!167323 res!139303) b!167324))

(declare-fun m!266255 () Bool)

(assert (=> b!167323 m!266255))

(assert (=> b!167323 m!266251))

(declare-fun m!266257 () Bool)

(assert (=> b!167324 m!266257))

(assert (=> b!167284 d!58617))

(declare-fun d!58619 () Bool)

(declare-fun res!139304 () Bool)

(declare-fun e!116076 () Bool)

(assert (=> d!58619 (=> res!139304 e!116076)))

(assert (=> d!58619 (= res!139304 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577))))))

(assert (=> d!58619 (= (arrayRangesEq!677 lt!260410 (array!8663 (store (arr!4769 lt!260410) (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260407) (size!3848 lt!260410)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577))) e!116076)))

(declare-fun b!167325 () Bool)

(declare-fun e!116077 () Bool)

(assert (=> b!167325 (= e!116076 e!116077)))

(declare-fun res!139305 () Bool)

(assert (=> b!167325 (=> (not res!139305) (not e!116077))))

(assert (=> b!167325 (= res!139305 (= (select (arr!4769 lt!260410) #b00000000000000000000000000000000) (select (arr!4769 (array!8663 (store (arr!4769 lt!260410) (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260407) (size!3848 lt!260410))) #b00000000000000000000000000000000)))))

(declare-fun b!167326 () Bool)

(assert (=> b!167326 (= e!116077 (arrayRangesEq!677 lt!260410 (array!8663 (store (arr!4769 lt!260410) (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577)) lt!260407) (size!3848 lt!260410)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577))))))

(assert (= (and d!58619 (not res!139304)) b!167325))

(assert (= (and b!167325 res!139305) b!167326))

(assert (=> b!167325 m!266173))

(declare-fun m!266259 () Bool)

(assert (=> b!167325 m!266259))

(declare-fun m!266261 () Bool)

(assert (=> b!167326 m!266261))

(assert (=> b!167292 d!58619))

(assert (=> d!58555 d!58547))

(declare-fun d!58621 () Bool)

(assert (=> d!58621 (arrayRangesEq!677 (buf!4300 thiss!1577) lt!260414 #b00000000000000000000000000000000 (currentByte!8134 thiss!1577))))

(assert (=> d!58621 true))

(declare-fun _$16!77 () Unit!11644)

(assert (=> d!58621 (= (choose!244 (buf!4300 thiss!1577) lt!260410 lt!260414 #b00000000000000000000000000000000 (currentByte!8134 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8134 thiss!1577))) _$16!77)))

(declare-fun bs!14551 () Bool)

(assert (= bs!14551 d!58621))

(assert (=> bs!14551 m!266091))

(assert (=> d!58555 d!58621))

(assert (=> b!167287 d!58551))

(declare-fun d!58625 () Bool)

(declare-fun res!139306 () Bool)

(declare-fun e!116078 () Bool)

(assert (=> d!58625 (=> res!139306 e!116078)))

(assert (=> d!58625 (= res!139306 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8134 thiss!1577)))))

(assert (=> d!58625 (= (arrayRangesEq!677 (buf!4300 thiss!1577) (array!8663 (store (arr!4769 (buf!4300 thiss!1577)) (currentByte!8134 thiss!1577) lt!260412) (size!3848 (buf!4300 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8134 thiss!1577)) e!116078)))

(declare-fun b!167327 () Bool)

(declare-fun e!116079 () Bool)

(assert (=> b!167327 (= e!116078 e!116079)))

(declare-fun res!139307 () Bool)

(assert (=> b!167327 (=> (not res!139307) (not e!116079))))

(assert (=> b!167327 (= res!139307 (= (select (arr!4769 (buf!4300 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4769 (array!8663 (store (arr!4769 (buf!4300 thiss!1577)) (currentByte!8134 thiss!1577) lt!260412) (size!3848 (buf!4300 thiss!1577)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!167328 () Bool)

(assert (=> b!167328 (= e!116079 (arrayRangesEq!677 (buf!4300 thiss!1577) (array!8663 (store (arr!4769 (buf!4300 thiss!1577)) (currentByte!8134 thiss!1577) lt!260412) (size!3848 (buf!4300 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8134 thiss!1577)))))

(assert (= (and d!58625 (not res!139306)) b!167327))

(assert (= (and b!167327 res!139307) b!167328))

(assert (=> b!167327 m!266255))

(declare-fun m!266267 () Bool)

(assert (=> b!167327 m!266267))

(declare-fun m!266269 () Bool)

(assert (=> b!167328 m!266269))

(assert (=> b!167289 d!58625))

(check-sat (not b!167324) (not d!58601) (not b!167328) (not d!58621) (not b!167322) (not d!58611) (not b!167326))
(check-sat)
