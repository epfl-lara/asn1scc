; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36164 () Bool)

(assert start!36164)

(declare-fun b!166882 () Bool)

(declare-fun res!138931 () Bool)

(declare-fun e!115702 () Bool)

(assert (=> b!166882 (=> (not res!138931) (not e!115702))))

(declare-datatypes ((array!8609 0))(
  ( (array!8610 (arr!4747 (Array (_ BitVec 32) (_ BitVec 8))) (size!3826 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6808 0))(
  ( (BitStream!6809 (buf!4278 array!8609) (currentByte!8102 (_ BitVec 32)) (currentBit!8097 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6808)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!166882 (= res!138931 (bvsgt (bvadd (currentBit!8097 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!166883 () Bool)

(assert (=> b!166883 (= e!115702 (not (and (bvsle #b00000000000000000000000000000000 (currentByte!8102 thiss!1577)) (bvsle (currentByte!8102 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577))))))))

(declare-fun lt!259841 () array!8609)

(declare-fun lt!259839 () (_ BitVec 8))

(declare-fun lt!259842 () (_ BitVec 32))

(declare-fun lt!259844 () (_ BitVec 32))

(declare-fun arrayRangesEq!655 (array!8609 array!8609 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166883 (arrayRangesEq!655 lt!259841 (array!8610 (store (store (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8097 thiss!1577)))))))) (bvlshr (bvand lt!259844 #b00000000000000000000000011111111) lt!259842)))) (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577)) lt!259839) (size!3826 (buf!4278 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577)))))

(declare-datatypes ((Unit!11600 0))(
  ( (Unit!11601) )
))
(declare-fun lt!259843 () Unit!11600)

(declare-fun arrayUpdatedAtPrefixLemma!263 (array!8609 (_ BitVec 32) (_ BitVec 8)) Unit!11600)

(assert (=> b!166883 (= lt!259843 (arrayUpdatedAtPrefixLemma!263 lt!259841 (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577)) lt!259839))))

(assert (=> b!166883 (arrayRangesEq!655 (buf!4278 thiss!1577) (array!8610 (store (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577) (select (store (store (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8097 thiss!1577)))))))) (bvlshr (bvand lt!259844 #b00000000000000000000000011111111) lt!259842)))) (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577)) lt!259839) (currentByte!8102 thiss!1577))) (size!3826 (buf!4278 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8102 thiss!1577))))

(declare-fun lt!259840 () Unit!11600)

(assert (=> b!166883 (= lt!259840 (arrayUpdatedAtPrefixLemma!263 (buf!4278 thiss!1577) (currentByte!8102 thiss!1577) (select (store (store (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8097 thiss!1577)))))))) (bvlshr (bvand lt!259844 #b00000000000000000000000011111111) lt!259842)))) (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577)) lt!259839) (currentByte!8102 thiss!1577))))))

(declare-fun lt!259838 () (_ BitVec 32))

(assert (=> b!166883 (= lt!259839 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8097 thiss!1577)))))))) (bvlshr (bvand lt!259844 #b00000000000000000000000011111111) lt!259842)))) (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!259838))) (bvshl lt!259844 lt!259838))))))

(assert (=> b!166883 (= lt!259838 (bvsub #b00000000000000000000000000001000 lt!259842))))

(assert (=> b!166883 (= lt!259841 (array!8610 (store (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8097 thiss!1577)))))))) (bvlshr (bvand lt!259844 #b00000000000000000000000011111111) lt!259842)))) (size!3826 (buf!4278 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!166883 (= lt!259844 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!166883 (= lt!259842 (bvsub (bvadd (currentBit!8097 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!166881 () Bool)

(declare-fun res!138932 () Bool)

(assert (=> b!166881 (=> (not res!138932) (not e!115702))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166881 (= res!138932 (validate_offset_bits!1 ((_ sign_extend 32) (size!3826 (buf!4278 thiss!1577))) ((_ sign_extend 32) (currentByte!8102 thiss!1577)) ((_ sign_extend 32) (currentBit!8097 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166884 () Bool)

(declare-fun e!115703 () Bool)

(declare-fun array_inv!3567 (array!8609) Bool)

(assert (=> b!166884 (= e!115703 (array_inv!3567 (buf!4278 thiss!1577)))))

(declare-fun res!138930 () Bool)

(assert (=> start!36164 (=> (not res!138930) (not e!115702))))

(assert (=> start!36164 (= res!138930 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36164 e!115702))

(assert (=> start!36164 true))

(declare-fun inv!12 (BitStream!6808) Bool)

(assert (=> start!36164 (and (inv!12 thiss!1577) e!115703)))

(assert (= (and start!36164 res!138930) b!166881))

(assert (= (and b!166881 res!138932) b!166882))

(assert (= (and b!166882 res!138931) b!166883))

(assert (= start!36164 b!166884))

(declare-fun m!265127 () Bool)

(assert (=> b!166883 m!265127))

(declare-fun m!265129 () Bool)

(assert (=> b!166883 m!265129))

(declare-fun m!265131 () Bool)

(assert (=> b!166883 m!265131))

(declare-fun m!265133 () Bool)

(assert (=> b!166883 m!265133))

(declare-fun m!265135 () Bool)

(assert (=> b!166883 m!265135))

(declare-fun m!265137 () Bool)

(assert (=> b!166883 m!265137))

(declare-fun m!265139 () Bool)

(assert (=> b!166883 m!265139))

(declare-fun m!265141 () Bool)

(assert (=> b!166883 m!265141))

(declare-fun m!265143 () Bool)

(assert (=> b!166883 m!265143))

(declare-fun m!265145 () Bool)

(assert (=> b!166883 m!265145))

(declare-fun m!265147 () Bool)

(assert (=> b!166883 m!265147))

(declare-fun m!265149 () Bool)

(assert (=> b!166883 m!265149))

(assert (=> b!166883 m!265133))

(declare-fun m!265151 () Bool)

(assert (=> b!166883 m!265151))

(declare-fun m!265153 () Bool)

(assert (=> b!166881 m!265153))

(declare-fun m!265155 () Bool)

(assert (=> b!166884 m!265155))

(declare-fun m!265157 () Bool)

(assert (=> start!36164 m!265157))

(push 1)

(assert (not b!166884))

(assert (not b!166881))

(assert (not start!36164))

(assert (not b!166883))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58407 () Bool)

(assert (=> d!58407 (= (array_inv!3567 (buf!4278 thiss!1577)) (bvsge (size!3826 (buf!4278 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166884 d!58407))

(declare-fun d!58409 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58409 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3826 (buf!4278 thiss!1577))) ((_ sign_extend 32) (currentByte!8102 thiss!1577)) ((_ sign_extend 32) (currentBit!8097 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3826 (buf!4278 thiss!1577))) ((_ sign_extend 32) (currentByte!8102 thiss!1577)) ((_ sign_extend 32) (currentBit!8097 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14497 () Bool)

(assert (= bs!14497 d!58409))

(declare-fun m!265233 () Bool)

(assert (=> bs!14497 m!265233))

(assert (=> b!166881 d!58409))

(declare-fun d!58411 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58411 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8097 thiss!1577) (currentByte!8102 thiss!1577) (size!3826 (buf!4278 thiss!1577))))))

(declare-fun bs!14498 () Bool)

(assert (= bs!14498 d!58411))

(declare-fun m!265235 () Bool)

(assert (=> bs!14498 m!265235))

(assert (=> start!36164 d!58411))

(declare-fun d!58415 () Bool)

(declare-fun res!138971 () Bool)

(declare-fun e!115743 () Bool)

(assert (=> d!58415 (=> res!138971 e!115743)))

(assert (=> d!58415 (= res!138971 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577))))))

(assert (=> d!58415 (= (arrayRangesEq!655 lt!259841 (array!8610 (store (store (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8097 thiss!1577)))))))) (bvlshr (bvand lt!259844 #b00000000000000000000000011111111) lt!259842)))) (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577)) lt!259839) (size!3826 (buf!4278 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577))) e!115743)))

(declare-fun b!166929 () Bool)

(declare-fun e!115744 () Bool)

(assert (=> b!166929 (= e!115743 e!115744)))

(declare-fun res!138972 () Bool)

(assert (=> b!166929 (=> (not res!138972) (not e!115744))))

(assert (=> b!166929 (= res!138972 (= (select (arr!4747 lt!259841) #b00000000000000000000000000000000) (select (arr!4747 (array!8610 (store (store (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8097 thiss!1577)))))))) (bvlshr (bvand lt!259844 #b00000000000000000000000011111111) lt!259842)))) (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577)) lt!259839) (size!3826 (buf!4278 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!166930 () Bool)

(assert (=> b!166930 (= e!115744 (arrayRangesEq!655 lt!259841 (array!8610 (store (store (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8097 thiss!1577)))))))) (bvlshr (bvand lt!259844 #b00000000000000000000000011111111) lt!259842)))) (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577)) lt!259839) (size!3826 (buf!4278 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577))))))

(assert (= (and d!58415 (not res!138971)) b!166929))

(assert (= (and b!166929 res!138972) b!166930))

(declare-fun m!265251 () Bool)

(assert (=> b!166929 m!265251))

(declare-fun m!265255 () Bool)

(assert (=> b!166929 m!265255))

(declare-fun m!265259 () Bool)

(assert (=> b!166930 m!265259))

(assert (=> b!166883 d!58415))

(declare-fun d!58425 () Bool)

(declare-fun e!115752 () Bool)

(assert (=> d!58425 e!115752))

(declare-fun res!138980 () Bool)

(assert (=> d!58425 (=> (not res!138980) (not e!115752))))

(assert (=> d!58425 (= res!138980 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577)) (size!3826 lt!259841))))))

(declare-fun lt!259896 () Unit!11600)

(declare-fun choose!234 (array!8609 (_ BitVec 32) (_ BitVec 8)) Unit!11600)

(assert (=> d!58425 (= lt!259896 (choose!234 lt!259841 (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577)) lt!259839))))

(assert (=> d!58425 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577)) (size!3826 lt!259841)))))

(assert (=> d!58425 (= (arrayUpdatedAtPrefixLemma!263 lt!259841 (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577)) lt!259839) lt!259896)))

(declare-fun b!166938 () Bool)

(assert (=> b!166938 (= e!115752 (arrayRangesEq!655 lt!259841 (array!8610 (store (arr!4747 lt!259841) (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577)) lt!259839) (size!3826 lt!259841)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577))))))

(assert (= (and d!58425 res!138980) b!166938))

(declare-fun m!265265 () Bool)

(assert (=> d!58425 m!265265))

(declare-fun m!265269 () Bool)

(assert (=> b!166938 m!265269))

(declare-fun m!265273 () Bool)

(assert (=> b!166938 m!265273))

(assert (=> b!166883 d!58425))

(declare-fun d!58431 () Bool)

(declare-fun res!138983 () Bool)

(declare-fun e!115755 () Bool)

(assert (=> d!58431 (=> res!138983 e!115755)))

(assert (=> d!58431 (= res!138983 (= #b00000000000000000000000000000000 (currentByte!8102 thiss!1577)))))

(assert (=> d!58431 (= (arrayRangesEq!655 (buf!4278 thiss!1577) (array!8610 (store (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577) (select (store (store (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8097 thiss!1577)))))))) (bvlshr (bvand lt!259844 #b00000000000000000000000011111111) lt!259842)))) (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577)) lt!259839) (currentByte!8102 thiss!1577))) (size!3826 (buf!4278 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8102 thiss!1577)) e!115755)))

(declare-fun b!166941 () Bool)

(declare-fun e!115756 () Bool)

(assert (=> b!166941 (= e!115755 e!115756)))

(declare-fun res!138984 () Bool)

(assert (=> b!166941 (=> (not res!138984) (not e!115756))))

(assert (=> b!166941 (= res!138984 (= (select (arr!4747 (buf!4278 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4747 (array!8610 (store (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577) (select (store (store (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8097 thiss!1577)))))))) (bvlshr (bvand lt!259844 #b00000000000000000000000011111111) lt!259842)))) (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577)) lt!259839) (currentByte!8102 thiss!1577))) (size!3826 (buf!4278 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!166942 () Bool)

(assert (=> b!166942 (= e!115756 (arrayRangesEq!655 (buf!4278 thiss!1577) (array!8610 (store (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577) (select (store (store (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8097 thiss!1577)))))))) (bvlshr (bvand lt!259844 #b00000000000000000000000011111111) lt!259842)))) (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577)) lt!259839) (currentByte!8102 thiss!1577))) (size!3826 (buf!4278 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8102 thiss!1577)))))

(assert (= (and d!58431 (not res!138983)) b!166941))

(assert (= (and b!166941 res!138984) b!166942))

(declare-fun m!265277 () Bool)

(assert (=> b!166941 m!265277))

(declare-fun m!265281 () Bool)

(assert (=> b!166941 m!265281))

(declare-fun m!265285 () Bool)

(assert (=> b!166942 m!265285))

(assert (=> b!166883 d!58431))

(declare-fun d!58435 () Bool)

(declare-fun e!115758 () Bool)

(assert (=> d!58435 e!115758))

(declare-fun res!138986 () Bool)

(assert (=> d!58435 (=> (not res!138986) (not e!115758))))

(assert (=> d!58435 (= res!138986 (and (bvsge (currentByte!8102 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8102 thiss!1577) (size!3826 (buf!4278 thiss!1577)))))))

(declare-fun lt!259898 () Unit!11600)

(assert (=> d!58435 (= lt!259898 (choose!234 (buf!4278 thiss!1577) (currentByte!8102 thiss!1577) (select (store (store (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8097 thiss!1577)))))))) (bvlshr (bvand lt!259844 #b00000000000000000000000011111111) lt!259842)))) (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577)) lt!259839) (currentByte!8102 thiss!1577))))))

(assert (=> d!58435 (and (bvsle #b00000000000000000000000000000000 (currentByte!8102 thiss!1577)) (bvslt (currentByte!8102 thiss!1577) (size!3826 (buf!4278 thiss!1577))))))

(assert (=> d!58435 (= (arrayUpdatedAtPrefixLemma!263 (buf!4278 thiss!1577) (currentByte!8102 thiss!1577) (select (store (store (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8097 thiss!1577)))))))) (bvlshr (bvand lt!259844 #b00000000000000000000000011111111) lt!259842)))) (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577)) lt!259839) (currentByte!8102 thiss!1577))) lt!259898)))

(declare-fun b!166944 () Bool)

(assert (=> b!166944 (= e!115758 (arrayRangesEq!655 (buf!4278 thiss!1577) (array!8610 (store (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577) (select (store (store (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4747 (buf!4278 thiss!1577)) (currentByte!8102 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8097 thiss!1577)))))))) (bvlshr (bvand lt!259844 #b00000000000000000000000011111111) lt!259842)))) (bvadd #b00000000000000000000000000000001 (currentByte!8102 thiss!1577)) lt!259839) (currentByte!8102 thiss!1577))) (size!3826 (buf!4278 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8102 thiss!1577)))))

(assert (= (and d!58435 res!138986) b!166944))

(assert (=> d!58435 m!265133))

(declare-fun m!265289 () Bool)

(assert (=> d!58435 m!265289))

(assert (=> b!166944 m!265145))

(assert (=> b!166944 m!265147))

(assert (=> b!166883 d!58435))

(push 1)

