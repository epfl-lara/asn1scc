; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56262 () Bool)

(assert start!56262)

(declare-fun res!218098 () Bool)

(declare-fun e!181027 () Bool)

(assert (=> start!56262 (=> (not res!218098) (not e!181027))))

(declare-datatypes ((array!14327 0))(
  ( (array!14328 (arr!7253 (Array (_ BitVec 32) (_ BitVec 8))) (size!6266 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11454 0))(
  ( (BitStream!11455 (buf!6788 array!14327) (currentByte!12485 (_ BitVec 32)) (currentBit!12480 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11454)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56262 (= res!218098 (validate_offset_bit!0 ((_ sign_extend 32) (size!6266 (buf!6788 thiss!914))) ((_ sign_extend 32) (currentByte!12485 thiss!914)) ((_ sign_extend 32) (currentBit!12480 thiss!914))))))

(assert (=> start!56262 e!181027))

(declare-fun e!181025 () Bool)

(declare-fun inv!12 (BitStream!11454) Bool)

(assert (=> start!56262 (and (inv!12 thiss!914) e!181025)))

(assert (=> start!56262 true))

(declare-fun b!260541 () Bool)

(declare-datatypes ((Unit!18511 0))(
  ( (Unit!18512) )
))
(declare-datatypes ((tuple2!22330 0))(
  ( (tuple2!22331 (_1!12101 Unit!18511) (_2!12101 BitStream!11454)) )
))
(declare-fun lt!402673 () tuple2!22330)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!260541 (= e!181027 (not (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6266 (buf!6788 (_2!12101 lt!402673)))) ((_ sign_extend 32) (currentByte!12485 (_2!12101 lt!402673))) ((_ sign_extend 32) (currentBit!12480 (_2!12101 lt!402673)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayRangesEq!933 (array!14327 array!14327 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260541 (arrayRangesEq!933 (buf!6788 thiss!914) (array!14328 (store (arr!7253 (buf!6788 thiss!914)) (currentByte!12485 (_2!12101 lt!402673)) (select (arr!7253 (buf!6788 (_2!12101 lt!402673))) (currentByte!12485 (_2!12101 lt!402673)))) (size!6266 (buf!6788 thiss!914))) #b00000000000000000000000000000000 (currentByte!12485 (_2!12101 lt!402673)))))

(declare-fun lt!402674 () Unit!18511)

(declare-fun arrayUpdatedAtPrefixLemma!449 (array!14327 (_ BitVec 32) (_ BitVec 8)) Unit!18511)

(assert (=> b!260541 (= lt!402674 (arrayUpdatedAtPrefixLemma!449 (buf!6788 thiss!914) (currentByte!12485 (_2!12101 lt!402673)) (select (arr!7253 (buf!6788 (_2!12101 lt!402673))) (currentByte!12485 (_2!12101 lt!402673)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18513 () Unit!18511)

(declare-fun Unit!18514 () Unit!18511)

(assert (=> b!260541 (= lt!402673 (ite b!187 (tuple2!22331 Unit!18513 (BitStream!11455 (array!14328 (store (arr!7253 (buf!6788 thiss!914)) (currentByte!12485 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7253 (buf!6788 thiss!914)) (currentByte!12485 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12480 thiss!914)))))) (size!6266 (buf!6788 thiss!914))) (currentByte!12485 thiss!914) (currentBit!12480 thiss!914))) (tuple2!22331 Unit!18514 (BitStream!11455 (array!14328 (store (arr!7253 (buf!6788 thiss!914)) (currentByte!12485 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7253 (buf!6788 thiss!914)) (currentByte!12485 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12480 thiss!914))))))) (size!6266 (buf!6788 thiss!914))) (currentByte!12485 thiss!914) (currentBit!12480 thiss!914)))))))

(declare-fun b!260542 () Bool)

(declare-fun array_inv!6007 (array!14327) Bool)

(assert (=> b!260542 (= e!181025 (array_inv!6007 (buf!6788 thiss!914)))))

(assert (= (and start!56262 res!218098) b!260541))

(assert (= start!56262 b!260542))

(declare-fun m!389877 () Bool)

(assert (=> start!56262 m!389877))

(declare-fun m!389879 () Bool)

(assert (=> start!56262 m!389879))

(declare-fun m!389881 () Bool)

(assert (=> b!260541 m!389881))

(declare-fun m!389883 () Bool)

(assert (=> b!260541 m!389883))

(declare-fun m!389885 () Bool)

(assert (=> b!260541 m!389885))

(declare-fun m!389887 () Bool)

(assert (=> b!260541 m!389887))

(declare-fun m!389889 () Bool)

(assert (=> b!260541 m!389889))

(declare-fun m!389891 () Bool)

(assert (=> b!260541 m!389891))

(declare-fun m!389893 () Bool)

(assert (=> b!260541 m!389893))

(declare-fun m!389895 () Bool)

(assert (=> b!260541 m!389895))

(assert (=> b!260541 m!389881))

(declare-fun m!389897 () Bool)

(assert (=> b!260541 m!389897))

(declare-fun m!389899 () Bool)

(assert (=> b!260542 m!389899))

(check-sat (not b!260541) (not start!56262) (not b!260542))
(check-sat)
(get-model)

(declare-fun d!87488 () Bool)

(assert (=> d!87488 (= (remainingBits!0 ((_ sign_extend 32) (size!6266 (buf!6788 (_2!12101 lt!402673)))) ((_ sign_extend 32) (currentByte!12485 (_2!12101 lt!402673))) ((_ sign_extend 32) (currentBit!12480 (_2!12101 lt!402673)))) (bvsub (bvmul ((_ sign_extend 32) (size!6266 (buf!6788 (_2!12101 lt!402673)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12485 (_2!12101 lt!402673))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12480 (_2!12101 lt!402673))))))))

(assert (=> b!260541 d!87488))

(declare-fun d!87490 () Bool)

(declare-fun res!218115 () Bool)

(declare-fun e!181050 () Bool)

(assert (=> d!87490 (=> res!218115 e!181050)))

(assert (=> d!87490 (= res!218115 (= #b00000000000000000000000000000000 (currentByte!12485 (_2!12101 lt!402673))))))

(assert (=> d!87490 (= (arrayRangesEq!933 (buf!6788 thiss!914) (array!14328 (store (arr!7253 (buf!6788 thiss!914)) (currentByte!12485 (_2!12101 lt!402673)) (select (arr!7253 (buf!6788 (_2!12101 lt!402673))) (currentByte!12485 (_2!12101 lt!402673)))) (size!6266 (buf!6788 thiss!914))) #b00000000000000000000000000000000 (currentByte!12485 (_2!12101 lt!402673))) e!181050)))

(declare-fun b!260562 () Bool)

(declare-fun e!181051 () Bool)

(assert (=> b!260562 (= e!181050 e!181051)))

(declare-fun res!218116 () Bool)

(assert (=> b!260562 (=> (not res!218116) (not e!181051))))

(assert (=> b!260562 (= res!218116 (= (select (arr!7253 (buf!6788 thiss!914)) #b00000000000000000000000000000000) (select (arr!7253 (array!14328 (store (arr!7253 (buf!6788 thiss!914)) (currentByte!12485 (_2!12101 lt!402673)) (select (arr!7253 (buf!6788 (_2!12101 lt!402673))) (currentByte!12485 (_2!12101 lt!402673)))) (size!6266 (buf!6788 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!260563 () Bool)

(assert (=> b!260563 (= e!181051 (arrayRangesEq!933 (buf!6788 thiss!914) (array!14328 (store (arr!7253 (buf!6788 thiss!914)) (currentByte!12485 (_2!12101 lt!402673)) (select (arr!7253 (buf!6788 (_2!12101 lt!402673))) (currentByte!12485 (_2!12101 lt!402673)))) (size!6266 (buf!6788 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12485 (_2!12101 lt!402673))))))

(assert (= (and d!87490 (not res!218115)) b!260562))

(assert (= (and b!260562 res!218116) b!260563))

(declare-fun m!389933 () Bool)

(assert (=> b!260562 m!389933))

(declare-fun m!389935 () Bool)

(assert (=> b!260562 m!389935))

(declare-fun m!389937 () Bool)

(assert (=> b!260563 m!389937))

(assert (=> b!260541 d!87490))

(declare-fun d!87498 () Bool)

(declare-fun e!181060 () Bool)

(assert (=> d!87498 e!181060))

(declare-fun res!218125 () Bool)

(assert (=> d!87498 (=> (not res!218125) (not e!181060))))

(assert (=> d!87498 (= res!218125 (and (bvsge (currentByte!12485 (_2!12101 lt!402673)) #b00000000000000000000000000000000) (bvslt (currentByte!12485 (_2!12101 lt!402673)) (size!6266 (buf!6788 thiss!914)))))))

(declare-fun lt!402686 () Unit!18511)

(declare-fun choose!343 (array!14327 (_ BitVec 32) (_ BitVec 8)) Unit!18511)

(assert (=> d!87498 (= lt!402686 (choose!343 (buf!6788 thiss!914) (currentByte!12485 (_2!12101 lt!402673)) (select (arr!7253 (buf!6788 (_2!12101 lt!402673))) (currentByte!12485 (_2!12101 lt!402673)))))))

(assert (=> d!87498 (and (bvsle #b00000000000000000000000000000000 (currentByte!12485 (_2!12101 lt!402673))) (bvslt (currentByte!12485 (_2!12101 lt!402673)) (size!6266 (buf!6788 thiss!914))))))

(assert (=> d!87498 (= (arrayUpdatedAtPrefixLemma!449 (buf!6788 thiss!914) (currentByte!12485 (_2!12101 lt!402673)) (select (arr!7253 (buf!6788 (_2!12101 lt!402673))) (currentByte!12485 (_2!12101 lt!402673)))) lt!402686)))

(declare-fun b!260572 () Bool)

(assert (=> b!260572 (= e!181060 (arrayRangesEq!933 (buf!6788 thiss!914) (array!14328 (store (arr!7253 (buf!6788 thiss!914)) (currentByte!12485 (_2!12101 lt!402673)) (select (arr!7253 (buf!6788 (_2!12101 lt!402673))) (currentByte!12485 (_2!12101 lt!402673)))) (size!6266 (buf!6788 thiss!914))) #b00000000000000000000000000000000 (currentByte!12485 (_2!12101 lt!402673))))))

(assert (= (and d!87498 res!218125) b!260572))

(assert (=> d!87498 m!389881))

(declare-fun m!389949 () Bool)

(assert (=> d!87498 m!389949))

(assert (=> b!260572 m!389895))

(assert (=> b!260572 m!389887))

(assert (=> b!260541 d!87498))

(declare-fun d!87506 () Bool)

(assert (=> d!87506 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6266 (buf!6788 thiss!914))) ((_ sign_extend 32) (currentByte!12485 thiss!914)) ((_ sign_extend 32) (currentBit!12480 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6266 (buf!6788 thiss!914))) ((_ sign_extend 32) (currentByte!12485 thiss!914)) ((_ sign_extend 32) (currentBit!12480 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22180 () Bool)

(assert (= bs!22180 d!87506))

(declare-fun m!389951 () Bool)

(assert (=> bs!22180 m!389951))

(assert (=> start!56262 d!87506))

(declare-fun d!87508 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87508 (= (inv!12 thiss!914) (invariant!0 (currentBit!12480 thiss!914) (currentByte!12485 thiss!914) (size!6266 (buf!6788 thiss!914))))))

(declare-fun bs!22181 () Bool)

(assert (= bs!22181 d!87508))

(declare-fun m!389953 () Bool)

(assert (=> bs!22181 m!389953))

(assert (=> start!56262 d!87508))

(declare-fun d!87510 () Bool)

(assert (=> d!87510 (= (array_inv!6007 (buf!6788 thiss!914)) (bvsge (size!6266 (buf!6788 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!260542 d!87510))

(check-sat (not d!87506) (not b!260563) (not d!87508) (not d!87498) (not b!260572))
(check-sat)
