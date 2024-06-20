; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36298 () Bool)

(assert start!36298)

(declare-fun b!167244 () Bool)

(declare-datatypes ((array!8660 0))(
  ( (array!8661 (arr!4768 (Array (_ BitVec 32) (_ BitVec 8))) (size!3847 (_ BitVec 32))) )
))
(declare-fun lt!260379 () array!8660)

(declare-fun lt!260383 () (_ BitVec 32))

(declare-fun e!116004 () Bool)

(declare-datatypes ((BitStream!6850 0))(
  ( (BitStream!6851 (buf!4299 array!8660) (currentByte!8133 (_ BitVec 32)) (currentBit!8128 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6850)

(declare-fun inv!12 (BitStream!6850) Bool)

(assert (=> b!167244 (= e!116004 (inv!12 (BitStream!6851 lt!260379 (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577)) lt!260383)))))

(declare-fun res!139231 () Bool)

(declare-fun e!116005 () Bool)

(assert (=> start!36298 (=> (not res!139231) (not e!116005))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!36298 (= res!139231 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36298 e!116005))

(assert (=> start!36298 true))

(declare-fun e!116003 () Bool)

(assert (=> start!36298 (and (inv!12 thiss!1577) e!116003)))

(declare-fun b!167245 () Bool)

(assert (=> b!167245 (= e!116005 (not e!116004))))

(declare-fun res!139230 () Bool)

(assert (=> b!167245 (=> res!139230 e!116004)))

(declare-fun lt!260384 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167245 (= res!139230 (not (byteRangesEq!0 (select (arr!4768 (buf!4299 thiss!1577)) (currentByte!8133 thiss!1577)) lt!260384 #b00000000000000000000000000000000 lt!260383)))))

(declare-fun arrayRangesEq!676 (array!8660 array!8660 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167245 (arrayRangesEq!676 (buf!4299 thiss!1577) lt!260379 #b00000000000000000000000000000000 (currentByte!8133 thiss!1577))))

(declare-fun lt!260380 () array!8660)

(declare-datatypes ((Unit!11642 0))(
  ( (Unit!11643) )
))
(declare-fun lt!260386 () Unit!11642)

(declare-fun arrayRangesEqTransitive!178 (array!8660 array!8660 array!8660 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11642)

(assert (=> b!167245 (= lt!260386 (arrayRangesEqTransitive!178 (buf!4299 thiss!1577) lt!260380 lt!260379 #b00000000000000000000000000000000 (currentByte!8133 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577))))))

(assert (=> b!167245 (arrayRangesEq!676 lt!260380 lt!260379 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577)))))

(declare-fun lt!260377 () Unit!11642)

(declare-fun lt!260382 () (_ BitVec 8))

(declare-fun arrayUpdatedAtPrefixLemma!284 (array!8660 (_ BitVec 32) (_ BitVec 8)) Unit!11642)

(assert (=> b!167245 (= lt!260377 (arrayUpdatedAtPrefixLemma!284 lt!260380 (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577)) lt!260382))))

(assert (=> b!167245 (arrayRangesEq!676 (buf!4299 thiss!1577) (array!8661 (store (arr!4768 (buf!4299 thiss!1577)) (currentByte!8133 thiss!1577) lt!260384) (size!3847 (buf!4299 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8133 thiss!1577))))

(declare-fun lt!260381 () Unit!11642)

(assert (=> b!167245 (= lt!260381 (arrayUpdatedAtPrefixLemma!284 (buf!4299 thiss!1577) (currentByte!8133 thiss!1577) lt!260384))))

(declare-fun lt!260378 () (_ BitVec 32))

(assert (=> b!167245 (= lt!260384 (select (store (store (arr!4768 (buf!4299 thiss!1577)) (currentByte!8133 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4768 (buf!4299 thiss!1577)) (currentByte!8133 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8128 thiss!1577)))))))) (bvlshr (bvand lt!260378 #b00000000000000000000000011111111) lt!260383)))) (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577)) lt!260382) (currentByte!8133 thiss!1577)))))

(assert (=> b!167245 (= lt!260379 (array!8661 (store (store (arr!4768 (buf!4299 thiss!1577)) (currentByte!8133 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4768 (buf!4299 thiss!1577)) (currentByte!8133 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8128 thiss!1577)))))))) (bvlshr (bvand lt!260378 #b00000000000000000000000011111111) lt!260383)))) (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577)) lt!260382) (size!3847 (buf!4299 thiss!1577))))))

(declare-fun lt!260385 () (_ BitVec 32))

(assert (=> b!167245 (= lt!260382 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4768 (buf!4299 thiss!1577)) (currentByte!8133 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4768 (buf!4299 thiss!1577)) (currentByte!8133 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8128 thiss!1577)))))))) (bvlshr (bvand lt!260378 #b00000000000000000000000011111111) lt!260383)))) (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260385))) (bvshl lt!260378 lt!260385))))))

(assert (=> b!167245 (= lt!260385 (bvsub #b00000000000000000000000000001000 lt!260383))))

(assert (=> b!167245 (= lt!260380 (array!8661 (store (arr!4768 (buf!4299 thiss!1577)) (currentByte!8133 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4768 (buf!4299 thiss!1577)) (currentByte!8133 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8128 thiss!1577)))))))) (bvlshr (bvand lt!260378 #b00000000000000000000000011111111) lt!260383)))) (size!3847 (buf!4299 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!167245 (= lt!260378 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167245 (= lt!260383 (bvsub (bvadd (currentBit!8128 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167246 () Bool)

(declare-fun res!139232 () Bool)

(assert (=> b!167246 (=> (not res!139232) (not e!116005))))

(assert (=> b!167246 (= res!139232 (bvsgt (bvadd (currentBit!8128 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167247 () Bool)

(declare-fun res!139233 () Bool)

(assert (=> b!167247 (=> (not res!139233) (not e!116005))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167247 (= res!139233 (validate_offset_bits!1 ((_ sign_extend 32) (size!3847 (buf!4299 thiss!1577))) ((_ sign_extend 32) (currentByte!8133 thiss!1577)) ((_ sign_extend 32) (currentBit!8128 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!167248 () Bool)

(declare-fun array_inv!3588 (array!8660) Bool)

(assert (=> b!167248 (= e!116003 (array_inv!3588 (buf!4299 thiss!1577)))))

(assert (= (and start!36298 res!139231) b!167247))

(assert (= (and b!167247 res!139233) b!167246))

(assert (= (and b!167246 res!139232) b!167245))

(assert (= (and b!167245 (not res!139230)) b!167244))

(assert (= start!36298 b!167248))

(declare-fun m!266031 () Bool)

(assert (=> start!36298 m!266031))

(declare-fun m!266033 () Bool)

(assert (=> b!167248 m!266033))

(declare-fun m!266035 () Bool)

(assert (=> b!167247 m!266035))

(declare-fun m!266037 () Bool)

(assert (=> b!167245 m!266037))

(declare-fun m!266039 () Bool)

(assert (=> b!167245 m!266039))

(declare-fun m!266041 () Bool)

(assert (=> b!167245 m!266041))

(declare-fun m!266043 () Bool)

(assert (=> b!167245 m!266043))

(declare-fun m!266045 () Bool)

(assert (=> b!167245 m!266045))

(declare-fun m!266047 () Bool)

(assert (=> b!167245 m!266047))

(declare-fun m!266049 () Bool)

(assert (=> b!167245 m!266049))

(declare-fun m!266051 () Bool)

(assert (=> b!167245 m!266051))

(declare-fun m!266053 () Bool)

(assert (=> b!167245 m!266053))

(declare-fun m!266055 () Bool)

(assert (=> b!167245 m!266055))

(declare-fun m!266057 () Bool)

(assert (=> b!167245 m!266057))

(assert (=> b!167245 m!266039))

(declare-fun m!266059 () Bool)

(assert (=> b!167245 m!266059))

(declare-fun m!266061 () Bool)

(assert (=> b!167245 m!266061))

(declare-fun m!266063 () Bool)

(assert (=> b!167245 m!266063))

(declare-fun m!266065 () Bool)

(assert (=> b!167245 m!266065))

(declare-fun m!266067 () Bool)

(assert (=> b!167245 m!266067))

(declare-fun m!266069 () Bool)

(assert (=> b!167244 m!266069))

(push 1)

(assert (not b!167247))

(assert (not b!167245))

(assert (not b!167244))

(assert (not start!36298))

(assert (not b!167248))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58563 () Bool)

(declare-fun e!116046 () Bool)

(assert (=> d!58563 e!116046))

(declare-fun res!139274 () Bool)

(assert (=> d!58563 (=> (not res!139274) (not e!116046))))

(assert (=> d!58563 (= res!139274 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577)) (size!3847 lt!260380))))))

(declare-fun lt!260456 () Unit!11642)

(declare-fun choose!245 (array!8660 (_ BitVec 32) (_ BitVec 8)) Unit!11642)

(assert (=> d!58563 (= lt!260456 (choose!245 lt!260380 (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577)) lt!260382))))

(assert (=> d!58563 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577)) (size!3847 lt!260380)))))

(assert (=> d!58563 (= (arrayUpdatedAtPrefixLemma!284 lt!260380 (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577)) lt!260382) lt!260456)))

(declare-fun b!167295 () Bool)

(assert (=> b!167295 (= e!116046 (arrayRangesEq!676 lt!260380 (array!8661 (store (arr!4768 lt!260380) (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577)) lt!260382) (size!3847 lt!260380)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577))))))

(assert (= (and d!58563 res!139274) b!167295))

(declare-fun m!266185 () Bool)

(assert (=> d!58563 m!266185))

(declare-fun m!266187 () Bool)

(assert (=> b!167295 m!266187))

(declare-fun m!266189 () Bool)

(assert (=> b!167295 m!266189))

(assert (=> b!167245 d!58563))

(declare-fun d!58565 () Bool)

(declare-fun res!139279 () Bool)

(declare-fun e!116051 () Bool)

(assert (=> d!58565 (=> res!139279 e!116051)))

(assert (=> d!58565 (= res!139279 (= #b00000000000000000000000000000000 (currentByte!8133 thiss!1577)))))

(assert (=> d!58565 (= (arrayRangesEq!676 (buf!4299 thiss!1577) (array!8661 (store (arr!4768 (buf!4299 thiss!1577)) (currentByte!8133 thiss!1577) lt!260384) (size!3847 (buf!4299 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8133 thiss!1577)) e!116051)))

(declare-fun b!167300 () Bool)

(declare-fun e!116052 () Bool)

(assert (=> b!167300 (= e!116051 e!116052)))

(declare-fun res!139280 () Bool)

(assert (=> b!167300 (=> (not res!139280) (not e!116052))))

(assert (=> b!167300 (= res!139280 (= (select (arr!4768 (buf!4299 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4768 (array!8661 (store (arr!4768 (buf!4299 thiss!1577)) (currentByte!8133 thiss!1577) lt!260384) (size!3847 (buf!4299 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!167301 () Bool)

(assert (=> b!167301 (= e!116052 (arrayRangesEq!676 (buf!4299 thiss!1577) (array!8661 (store (arr!4768 (buf!4299 thiss!1577)) (currentByte!8133 thiss!1577) lt!260384) (size!3847 (buf!4299 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8133 thiss!1577)))))

(assert (= (and d!58565 (not res!139279)) b!167300))

(assert (= (and b!167300 res!139280) b!167301))

(declare-fun m!266191 () Bool)

(assert (=> b!167300 m!266191))

(declare-fun m!266193 () Bool)

(assert (=> b!167300 m!266193))

(declare-fun m!266195 () Bool)

(assert (=> b!167301 m!266195))

(assert (=> b!167245 d!58565))

(declare-fun d!58567 () Bool)

(assert (=> d!58567 (arrayRangesEq!676 (buf!4299 thiss!1577) lt!260379 #b00000000000000000000000000000000 (currentByte!8133 thiss!1577))))

(declare-fun lt!260459 () Unit!11642)

(declare-fun choose!246 (array!8660 array!8660 array!8660 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11642)

(assert (=> d!58567 (= lt!260459 (choose!246 (buf!4299 thiss!1577) lt!260380 lt!260379 #b00000000000000000000000000000000 (currentByte!8133 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577))))))

(assert (=> d!58567 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!8133 thiss!1577)) (bvsle (currentByte!8133 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577))))))

(assert (=> d!58567 (= (arrayRangesEqTransitive!178 (buf!4299 thiss!1577) lt!260380 lt!260379 #b00000000000000000000000000000000 (currentByte!8133 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577))) lt!260459)))

(declare-fun bs!14540 () Bool)

(assert (= bs!14540 d!58567))

(assert (=> bs!14540 m!266049))

(declare-fun m!266197 () Bool)

(assert (=> bs!14540 m!266197))

(assert (=> b!167245 d!58567))

(declare-fun d!58571 () Bool)

(assert (=> d!58571 (= (byteRangesEq!0 (select (arr!4768 (buf!4299 thiss!1577)) (currentByte!8133 thiss!1577)) lt!260384 #b00000000000000000000000000000000 lt!260383) (or (= #b00000000000000000000000000000000 lt!260383) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4768 (buf!4299 thiss!1577)) (currentByte!8133 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!260383))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!260384) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!260383))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14543 () Bool)

(assert (= bs!14543 d!58571))

(declare-fun m!266203 () Bool)

(assert (=> bs!14543 m!266203))

(declare-fun m!266205 () Bool)

(assert (=> bs!14543 m!266205))

(assert (=> b!167245 d!58571))

(declare-fun d!58579 () Bool)

(declare-fun e!116053 () Bool)

(assert (=> d!58579 e!116053))

(declare-fun res!139281 () Bool)

(assert (=> d!58579 (=> (not res!139281) (not e!116053))))

(assert (=> d!58579 (= res!139281 (and (bvsge (currentByte!8133 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8133 thiss!1577) (size!3847 (buf!4299 thiss!1577)))))))

(declare-fun lt!260460 () Unit!11642)

(assert (=> d!58579 (= lt!260460 (choose!245 (buf!4299 thiss!1577) (currentByte!8133 thiss!1577) lt!260384))))

(assert (=> d!58579 (and (bvsle #b00000000000000000000000000000000 (currentByte!8133 thiss!1577)) (bvslt (currentByte!8133 thiss!1577) (size!3847 (buf!4299 thiss!1577))))))

(assert (=> d!58579 (= (arrayUpdatedAtPrefixLemma!284 (buf!4299 thiss!1577) (currentByte!8133 thiss!1577) lt!260384) lt!260460)))

(declare-fun b!167302 () Bool)

(assert (=> b!167302 (= e!116053 (arrayRangesEq!676 (buf!4299 thiss!1577) (array!8661 (store (arr!4768 (buf!4299 thiss!1577)) (currentByte!8133 thiss!1577) lt!260384) (size!3847 (buf!4299 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8133 thiss!1577)))))

(assert (= (and d!58579 res!139281) b!167302))

(declare-fun m!266207 () Bool)

(assert (=> d!58579 m!266207))

(assert (=> b!167302 m!266047))

(assert (=> b!167302 m!266065))

(assert (=> b!167245 d!58579))

(declare-fun d!58581 () Bool)

(declare-fun res!139282 () Bool)

(declare-fun e!116054 () Bool)

(assert (=> d!58581 (=> res!139282 e!116054)))

(assert (=> d!58581 (= res!139282 (= #b00000000000000000000000000000000 (currentByte!8133 thiss!1577)))))

(assert (=> d!58581 (= (arrayRangesEq!676 (buf!4299 thiss!1577) lt!260379 #b00000000000000000000000000000000 (currentByte!8133 thiss!1577)) e!116054)))

(declare-fun b!167303 () Bool)

(declare-fun e!116055 () Bool)

(assert (=> b!167303 (= e!116054 e!116055)))

(declare-fun res!139283 () Bool)

(assert (=> b!167303 (=> (not res!139283) (not e!116055))))

(assert (=> b!167303 (= res!139283 (= (select (arr!4768 (buf!4299 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4768 lt!260379) #b00000000000000000000000000000000)))))

(declare-fun b!167304 () Bool)

(assert (=> b!167304 (= e!116055 (arrayRangesEq!676 (buf!4299 thiss!1577) lt!260379 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8133 thiss!1577)))))

(assert (= (and d!58581 (not res!139282)) b!167303))

(assert (= (and b!167303 res!139283) b!167304))

(assert (=> b!167303 m!266191))

(declare-fun m!266209 () Bool)

(assert (=> b!167303 m!266209))

(declare-fun m!266211 () Bool)

(assert (=> b!167304 m!266211))

(assert (=> b!167245 d!58581))

(declare-fun d!58583 () Bool)

(declare-fun res!139284 () Bool)

(declare-fun e!116056 () Bool)

(assert (=> d!58583 (=> res!139284 e!116056)))

(assert (=> d!58583 (= res!139284 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577))))))

(assert (=> d!58583 (= (arrayRangesEq!676 lt!260380 lt!260379 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577))) e!116056)))

(declare-fun b!167305 () Bool)

(declare-fun e!116057 () Bool)

(assert (=> b!167305 (= e!116056 e!116057)))

(declare-fun res!139285 () Bool)

(assert (=> b!167305 (=> (not res!139285) (not e!116057))))

(assert (=> b!167305 (= res!139285 (= (select (arr!4768 lt!260380) #b00000000000000000000000000000000) (select (arr!4768 lt!260379) #b00000000000000000000000000000000)))))

(declare-fun b!167306 () Bool)

(assert (=> b!167306 (= e!116057 (arrayRangesEq!676 lt!260380 lt!260379 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577))))))

(assert (= (and d!58583 (not res!139284)) b!167305))

(assert (= (and b!167305 res!139285) b!167306))

(declare-fun m!266213 () Bool)

(assert (=> b!167305 m!266213))

(assert (=> b!167305 m!266209))

(declare-fun m!266215 () Bool)

(assert (=> b!167306 m!266215))

(assert (=> b!167245 d!58583))

(declare-fun d!58585 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58585 (= (inv!12 (BitStream!6851 lt!260379 (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577)) lt!260383)) (invariant!0 (currentBit!8128 (BitStream!6851 lt!260379 (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577)) lt!260383)) (currentByte!8133 (BitStream!6851 lt!260379 (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577)) lt!260383)) (size!3847 (buf!4299 (BitStream!6851 lt!260379 (bvadd #b00000000000000000000000000000001 (currentByte!8133 thiss!1577)) lt!260383)))))))

(declare-fun bs!14544 () Bool)

(assert (= bs!14544 d!58585))

(declare-fun m!266217 () Bool)

(assert (=> bs!14544 m!266217))

(assert (=> b!167244 d!58585))

(declare-fun d!58587 () Bool)

(assert (=> d!58587 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8128 thiss!1577) (currentByte!8133 thiss!1577) (size!3847 (buf!4299 thiss!1577))))))

(declare-fun bs!14545 () Bool)

(assert (= bs!14545 d!58587))

(declare-fun m!266219 () Bool)

(assert (=> bs!14545 m!266219))

(assert (=> start!36298 d!58587))

(declare-fun d!58589 () Bool)

(assert (=> d!58589 (= (array_inv!3588 (buf!4299 thiss!1577)) (bvsge (size!3847 (buf!4299 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!167248 d!58589))

(declare-fun d!58591 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58591 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3847 (buf!4299 thiss!1577))) ((_ sign_extend 32) (currentByte!8133 thiss!1577)) ((_ sign_extend 32) (currentBit!8128 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3847 (buf!4299 thiss!1577))) ((_ sign_extend 32) (currentByte!8133 thiss!1577)) ((_ sign_extend 32) (currentBit!8128 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14546 () Bool)

(assert (= bs!14546 d!58591))

(declare-fun m!266221 () Bool)

(assert (=> bs!14546 m!266221))

(assert (=> b!167247 d!58591))

(push 1)

(assert (not d!58563))

(assert (not d!58587))

(assert (not b!167302))

(assert (not d!58579))

(assert (not b!167306))

(assert (not b!167295))

(assert (not b!167301))

(assert (not d!58567))

(assert (not d!58585))

(assert (not b!167304))

(assert (not d!58591))

(check-sat)

(pop 1)

(push 1)

(check-sat)

