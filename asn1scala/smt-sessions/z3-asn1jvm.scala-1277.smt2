; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36282 () Bool)

(assert start!36282)

(declare-fun b!167206 () Bool)

(declare-fun e!115968 () Bool)

(declare-datatypes ((array!8655 0))(
  ( (array!8656 (arr!4766 (Array (_ BitVec 32) (_ BitVec 8))) (size!3845 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6846 0))(
  ( (BitStream!6847 (buf!4297 array!8655) (currentByte!8130 (_ BitVec 32)) (currentBit!8125 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6846)

(assert (=> b!167206 (= e!115968 (not (and (bvsge (currentByte!8130 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8130 thiss!1577) (size!3845 (buf!4297 thiss!1577))))))))

(declare-fun lt!260311 () array!8655)

(declare-fun arrayRangesEq!674 (array!8655 array!8655 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167206 (arrayRangesEq!674 (buf!4297 thiss!1577) lt!260311 #b00000000000000000000000000000000 (currentByte!8130 thiss!1577))))

(declare-fun lt!260318 () array!8655)

(declare-datatypes ((Unit!11638 0))(
  ( (Unit!11639) )
))
(declare-fun lt!260312 () Unit!11638)

(declare-fun arrayRangesEqTransitive!176 (array!8655 array!8655 array!8655 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11638)

(assert (=> b!167206 (= lt!260312 (arrayRangesEqTransitive!176 (buf!4297 thiss!1577) lt!260318 lt!260311 #b00000000000000000000000000000000 (currentByte!8130 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8130 thiss!1577))))))

(assert (=> b!167206 (arrayRangesEq!674 lt!260318 lt!260311 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8130 thiss!1577)))))

(declare-fun lt!260313 () Unit!11638)

(declare-fun lt!260314 () (_ BitVec 8))

(declare-fun arrayUpdatedAtPrefixLemma!282 (array!8655 (_ BitVec 32) (_ BitVec 8)) Unit!11638)

(assert (=> b!167206 (= lt!260313 (arrayUpdatedAtPrefixLemma!282 lt!260318 (bvadd #b00000000000000000000000000000001 (currentByte!8130 thiss!1577)) lt!260314))))

(declare-fun lt!260310 () (_ BitVec 8))

(assert (=> b!167206 (arrayRangesEq!674 (buf!4297 thiss!1577) (array!8656 (store (arr!4766 (buf!4297 thiss!1577)) (currentByte!8130 thiss!1577) lt!260310) (size!3845 (buf!4297 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8130 thiss!1577))))

(declare-fun lt!260316 () Unit!11638)

(assert (=> b!167206 (= lt!260316 (arrayUpdatedAtPrefixLemma!282 (buf!4297 thiss!1577) (currentByte!8130 thiss!1577) lt!260310))))

(declare-fun lt!260317 () (_ BitVec 32))

(declare-fun lt!260315 () (_ BitVec 32))

(assert (=> b!167206 (= lt!260310 (select (store (store (arr!4766 (buf!4297 thiss!1577)) (currentByte!8130 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4766 (buf!4297 thiss!1577)) (currentByte!8130 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8125 thiss!1577)))))))) (bvlshr (bvand lt!260315 #b00000000000000000000000011111111) lt!260317)))) (bvadd #b00000000000000000000000000000001 (currentByte!8130 thiss!1577)) lt!260314) (currentByte!8130 thiss!1577)))))

(assert (=> b!167206 (= lt!260311 (array!8656 (store (store (arr!4766 (buf!4297 thiss!1577)) (currentByte!8130 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4766 (buf!4297 thiss!1577)) (currentByte!8130 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8125 thiss!1577)))))))) (bvlshr (bvand lt!260315 #b00000000000000000000000011111111) lt!260317)))) (bvadd #b00000000000000000000000000000001 (currentByte!8130 thiss!1577)) lt!260314) (size!3845 (buf!4297 thiss!1577))))))

(declare-fun lt!260319 () (_ BitVec 32))

(assert (=> b!167206 (= lt!260314 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4766 (buf!4297 thiss!1577)) (currentByte!8130 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4766 (buf!4297 thiss!1577)) (currentByte!8130 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8125 thiss!1577)))))))) (bvlshr (bvand lt!260315 #b00000000000000000000000011111111) lt!260317)))) (bvadd #b00000000000000000000000000000001 (currentByte!8130 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260319))) (bvshl lt!260315 lt!260319))))))

(assert (=> b!167206 (= lt!260319 (bvsub #b00000000000000000000000000001000 lt!260317))))

(assert (=> b!167206 (= lt!260318 (array!8656 (store (arr!4766 (buf!4297 thiss!1577)) (currentByte!8130 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4766 (buf!4297 thiss!1577)) (currentByte!8130 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8125 thiss!1577)))))))) (bvlshr (bvand lt!260315 #b00000000000000000000000011111111) lt!260317)))) (size!3845 (buf!4297 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!167206 (= lt!260315 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167206 (= lt!260317 (bvsub (bvadd (currentBit!8125 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167204 () Bool)

(declare-fun res!139197 () Bool)

(assert (=> b!167204 (=> (not res!139197) (not e!115968))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167204 (= res!139197 (validate_offset_bits!1 ((_ sign_extend 32) (size!3845 (buf!4297 thiss!1577))) ((_ sign_extend 32) (currentByte!8130 thiss!1577)) ((_ sign_extend 32) (currentBit!8125 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!139198 () Bool)

(assert (=> start!36282 (=> (not res!139198) (not e!115968))))

(assert (=> start!36282 (= res!139198 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36282 e!115968))

(assert (=> start!36282 true))

(declare-fun e!115970 () Bool)

(declare-fun inv!12 (BitStream!6846) Bool)

(assert (=> start!36282 (and (inv!12 thiss!1577) e!115970)))

(declare-fun b!167207 () Bool)

(declare-fun array_inv!3586 (array!8655) Bool)

(assert (=> b!167207 (= e!115970 (array_inv!3586 (buf!4297 thiss!1577)))))

(declare-fun b!167205 () Bool)

(declare-fun res!139196 () Bool)

(assert (=> b!167205 (=> (not res!139196) (not e!115968))))

(assert (=> b!167205 (= res!139196 (bvsgt (bvadd (currentBit!8125 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!36282 res!139198) b!167204))

(assert (= (and b!167204 res!139197) b!167205))

(assert (= (and b!167205 res!139196) b!167206))

(assert (= start!36282 b!167207))

(declare-fun m!265931 () Bool)

(assert (=> b!167206 m!265931))

(declare-fun m!265933 () Bool)

(assert (=> b!167206 m!265933))

(declare-fun m!265935 () Bool)

(assert (=> b!167206 m!265935))

(declare-fun m!265937 () Bool)

(assert (=> b!167206 m!265937))

(declare-fun m!265939 () Bool)

(assert (=> b!167206 m!265939))

(declare-fun m!265941 () Bool)

(assert (=> b!167206 m!265941))

(declare-fun m!265943 () Bool)

(assert (=> b!167206 m!265943))

(declare-fun m!265945 () Bool)

(assert (=> b!167206 m!265945))

(declare-fun m!265947 () Bool)

(assert (=> b!167206 m!265947))

(declare-fun m!265949 () Bool)

(assert (=> b!167206 m!265949))

(declare-fun m!265951 () Bool)

(assert (=> b!167206 m!265951))

(declare-fun m!265953 () Bool)

(assert (=> b!167206 m!265953))

(declare-fun m!265955 () Bool)

(assert (=> b!167206 m!265955))

(declare-fun m!265957 () Bool)

(assert (=> b!167206 m!265957))

(declare-fun m!265959 () Bool)

(assert (=> b!167206 m!265959))

(declare-fun m!265961 () Bool)

(assert (=> b!167204 m!265961))

(declare-fun m!265963 () Bool)

(assert (=> start!36282 m!265963))

(declare-fun m!265965 () Bool)

(assert (=> b!167207 m!265965))

(check-sat (not b!167207) (not b!167206) (not start!36282) (not b!167204))
(check-sat)
(get-model)

(declare-fun d!58521 () Bool)

(assert (=> d!58521 (= (array_inv!3586 (buf!4297 thiss!1577)) (bvsge (size!3845 (buf!4297 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!167207 d!58521))

(declare-fun d!58523 () Bool)

(declare-fun e!115982 () Bool)

(assert (=> d!58523 e!115982))

(declare-fun res!139210 () Bool)

(assert (=> d!58523 (=> (not res!139210) (not e!115982))))

(assert (=> d!58523 (= res!139210 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8130 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8130 thiss!1577)) (size!3845 lt!260318))))))

(declare-fun lt!260352 () Unit!11638)

(declare-fun choose!241 (array!8655 (_ BitVec 32) (_ BitVec 8)) Unit!11638)

(assert (=> d!58523 (= lt!260352 (choose!241 lt!260318 (bvadd #b00000000000000000000000000000001 (currentByte!8130 thiss!1577)) lt!260314))))

(assert (=> d!58523 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8130 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8130 thiss!1577)) (size!3845 lt!260318)))))

(assert (=> d!58523 (= (arrayUpdatedAtPrefixLemma!282 lt!260318 (bvadd #b00000000000000000000000000000001 (currentByte!8130 thiss!1577)) lt!260314) lt!260352)))

(declare-fun b!167222 () Bool)

(assert (=> b!167222 (= e!115982 (arrayRangesEq!674 lt!260318 (array!8656 (store (arr!4766 lt!260318) (bvadd #b00000000000000000000000000000001 (currentByte!8130 thiss!1577)) lt!260314) (size!3845 lt!260318)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8130 thiss!1577))))))

(assert (= (and d!58523 res!139210) b!167222))

(declare-fun m!266003 () Bool)

(assert (=> d!58523 m!266003))

(declare-fun m!266005 () Bool)

(assert (=> b!167222 m!266005))

(declare-fun m!266007 () Bool)

(assert (=> b!167222 m!266007))

(assert (=> b!167206 d!58523))

(declare-fun d!58525 () Bool)

(declare-fun res!139215 () Bool)

(declare-fun e!115987 () Bool)

(assert (=> d!58525 (=> res!139215 e!115987)))

(assert (=> d!58525 (= res!139215 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8130 thiss!1577))))))

(assert (=> d!58525 (= (arrayRangesEq!674 lt!260318 lt!260311 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8130 thiss!1577))) e!115987)))

(declare-fun b!167227 () Bool)

(declare-fun e!115988 () Bool)

(assert (=> b!167227 (= e!115987 e!115988)))

(declare-fun res!139216 () Bool)

(assert (=> b!167227 (=> (not res!139216) (not e!115988))))

(assert (=> b!167227 (= res!139216 (= (select (arr!4766 lt!260318) #b00000000000000000000000000000000) (select (arr!4766 lt!260311) #b00000000000000000000000000000000)))))

(declare-fun b!167228 () Bool)

(assert (=> b!167228 (= e!115988 (arrayRangesEq!674 lt!260318 lt!260311 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8130 thiss!1577))))))

(assert (= (and d!58525 (not res!139215)) b!167227))

(assert (= (and b!167227 res!139216) b!167228))

(declare-fun m!266009 () Bool)

(assert (=> b!167227 m!266009))

(declare-fun m!266011 () Bool)

(assert (=> b!167227 m!266011))

(declare-fun m!266013 () Bool)

(assert (=> b!167228 m!266013))

(assert (=> b!167206 d!58525))

(declare-fun d!58527 () Bool)

(assert (=> d!58527 (arrayRangesEq!674 (buf!4297 thiss!1577) lt!260311 #b00000000000000000000000000000000 (currentByte!8130 thiss!1577))))

(declare-fun lt!260355 () Unit!11638)

(declare-fun choose!242 (array!8655 array!8655 array!8655 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11638)

(assert (=> d!58527 (= lt!260355 (choose!242 (buf!4297 thiss!1577) lt!260318 lt!260311 #b00000000000000000000000000000000 (currentByte!8130 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8130 thiss!1577))))))

(assert (=> d!58527 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!8130 thiss!1577)) (bvsle (currentByte!8130 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8130 thiss!1577))))))

(assert (=> d!58527 (= (arrayRangesEqTransitive!176 (buf!4297 thiss!1577) lt!260318 lt!260311 #b00000000000000000000000000000000 (currentByte!8130 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8130 thiss!1577))) lt!260355)))

(declare-fun bs!14529 () Bool)

(assert (= bs!14529 d!58527))

(assert (=> bs!14529 m!265937))

(declare-fun m!266015 () Bool)

(assert (=> bs!14529 m!266015))

(assert (=> b!167206 d!58527))

(declare-fun d!58529 () Bool)

(declare-fun e!115989 () Bool)

(assert (=> d!58529 e!115989))

(declare-fun res!139217 () Bool)

(assert (=> d!58529 (=> (not res!139217) (not e!115989))))

(assert (=> d!58529 (= res!139217 (and (bvsge (currentByte!8130 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8130 thiss!1577) (size!3845 (buf!4297 thiss!1577)))))))

(declare-fun lt!260356 () Unit!11638)

(assert (=> d!58529 (= lt!260356 (choose!241 (buf!4297 thiss!1577) (currentByte!8130 thiss!1577) lt!260310))))

(assert (=> d!58529 (and (bvsle #b00000000000000000000000000000000 (currentByte!8130 thiss!1577)) (bvslt (currentByte!8130 thiss!1577) (size!3845 (buf!4297 thiss!1577))))))

(assert (=> d!58529 (= (arrayUpdatedAtPrefixLemma!282 (buf!4297 thiss!1577) (currentByte!8130 thiss!1577) lt!260310) lt!260356)))

(declare-fun b!167229 () Bool)

(assert (=> b!167229 (= e!115989 (arrayRangesEq!674 (buf!4297 thiss!1577) (array!8656 (store (arr!4766 (buf!4297 thiss!1577)) (currentByte!8130 thiss!1577) lt!260310) (size!3845 (buf!4297 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8130 thiss!1577)))))

(assert (= (and d!58529 res!139217) b!167229))

(declare-fun m!266017 () Bool)

(assert (=> d!58529 m!266017))

(assert (=> b!167229 m!265941))

(assert (=> b!167229 m!265933))

(assert (=> b!167206 d!58529))

(declare-fun d!58531 () Bool)

(declare-fun res!139218 () Bool)

(declare-fun e!115990 () Bool)

(assert (=> d!58531 (=> res!139218 e!115990)))

(assert (=> d!58531 (= res!139218 (= #b00000000000000000000000000000000 (currentByte!8130 thiss!1577)))))

(assert (=> d!58531 (= (arrayRangesEq!674 (buf!4297 thiss!1577) lt!260311 #b00000000000000000000000000000000 (currentByte!8130 thiss!1577)) e!115990)))

(declare-fun b!167230 () Bool)

(declare-fun e!115991 () Bool)

(assert (=> b!167230 (= e!115990 e!115991)))

(declare-fun res!139219 () Bool)

(assert (=> b!167230 (=> (not res!139219) (not e!115991))))

(assert (=> b!167230 (= res!139219 (= (select (arr!4766 (buf!4297 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4766 lt!260311) #b00000000000000000000000000000000)))))

(declare-fun b!167231 () Bool)

(assert (=> b!167231 (= e!115991 (arrayRangesEq!674 (buf!4297 thiss!1577) lt!260311 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8130 thiss!1577)))))

(assert (= (and d!58531 (not res!139218)) b!167230))

(assert (= (and b!167230 res!139219) b!167231))

(declare-fun m!266019 () Bool)

(assert (=> b!167230 m!266019))

(assert (=> b!167230 m!266011))

(declare-fun m!266021 () Bool)

(assert (=> b!167231 m!266021))

(assert (=> b!167206 d!58531))

(declare-fun d!58533 () Bool)

(declare-fun res!139220 () Bool)

(declare-fun e!115992 () Bool)

(assert (=> d!58533 (=> res!139220 e!115992)))

(assert (=> d!58533 (= res!139220 (= #b00000000000000000000000000000000 (currentByte!8130 thiss!1577)))))

(assert (=> d!58533 (= (arrayRangesEq!674 (buf!4297 thiss!1577) (array!8656 (store (arr!4766 (buf!4297 thiss!1577)) (currentByte!8130 thiss!1577) lt!260310) (size!3845 (buf!4297 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8130 thiss!1577)) e!115992)))

(declare-fun b!167232 () Bool)

(declare-fun e!115993 () Bool)

(assert (=> b!167232 (= e!115992 e!115993)))

(declare-fun res!139221 () Bool)

(assert (=> b!167232 (=> (not res!139221) (not e!115993))))

(assert (=> b!167232 (= res!139221 (= (select (arr!4766 (buf!4297 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4766 (array!8656 (store (arr!4766 (buf!4297 thiss!1577)) (currentByte!8130 thiss!1577) lt!260310) (size!3845 (buf!4297 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!167233 () Bool)

(assert (=> b!167233 (= e!115993 (arrayRangesEq!674 (buf!4297 thiss!1577) (array!8656 (store (arr!4766 (buf!4297 thiss!1577)) (currentByte!8130 thiss!1577) lt!260310) (size!3845 (buf!4297 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8130 thiss!1577)))))

(assert (= (and d!58533 (not res!139220)) b!167232))

(assert (= (and b!167232 res!139221) b!167233))

(assert (=> b!167232 m!266019))

(declare-fun m!266023 () Bool)

(assert (=> b!167232 m!266023))

(declare-fun m!266025 () Bool)

(assert (=> b!167233 m!266025))

(assert (=> b!167206 d!58533))

(declare-fun d!58535 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58535 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8125 thiss!1577) (currentByte!8130 thiss!1577) (size!3845 (buf!4297 thiss!1577))))))

(declare-fun bs!14530 () Bool)

(assert (= bs!14530 d!58535))

(declare-fun m!266027 () Bool)

(assert (=> bs!14530 m!266027))

(assert (=> start!36282 d!58535))

(declare-fun d!58537 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58537 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3845 (buf!4297 thiss!1577))) ((_ sign_extend 32) (currentByte!8130 thiss!1577)) ((_ sign_extend 32) (currentBit!8125 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3845 (buf!4297 thiss!1577))) ((_ sign_extend 32) (currentByte!8130 thiss!1577)) ((_ sign_extend 32) (currentBit!8125 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14531 () Bool)

(assert (= bs!14531 d!58537))

(declare-fun m!266029 () Bool)

(assert (=> bs!14531 m!266029))

(assert (=> b!167204 d!58537))

(check-sat (not b!167231) (not d!58523) (not b!167229) (not d!58527) (not b!167222) (not b!167228) (not d!58529) (not d!58535) (not b!167233) (not d!58537))
(check-sat)
