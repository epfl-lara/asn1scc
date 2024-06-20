; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56466 () Bool)

(assert start!56466)

(declare-fun res!218422 () Bool)

(declare-fun e!181339 () Bool)

(assert (=> start!56466 (=> (not res!218422) (not e!181339))))

(declare-datatypes ((array!14363 0))(
  ( (array!14364 (arr!7265 (Array (_ BitVec 32) (_ BitVec 8))) (size!6278 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11478 0))(
  ( (BitStream!11479 (buf!6800 array!14363) (currentByte!12526 (_ BitVec 32)) (currentBit!12521 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11478)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56466 (= res!218422 (validate_offset_bit!0 ((_ sign_extend 32) (size!6278 (buf!6800 thiss!914))) ((_ sign_extend 32) (currentByte!12526 thiss!914)) ((_ sign_extend 32) (currentBit!12521 thiss!914))))))

(assert (=> start!56466 e!181339))

(declare-fun e!181337 () Bool)

(declare-fun inv!12 (BitStream!11478) Bool)

(assert (=> start!56466 (and (inv!12 thiss!914) e!181337)))

(assert (=> start!56466 true))

(declare-fun b!260901 () Bool)

(declare-fun e!181338 () Bool)

(assert (=> b!260901 (= e!181339 (not e!181338))))

(declare-fun res!218426 () Bool)

(assert (=> b!260901 (=> res!218426 e!181338)))

(declare-datatypes ((Unit!18577 0))(
  ( (Unit!18578) )
))
(declare-datatypes ((tuple2!22354 0))(
  ( (tuple2!22355 (_1!12113 Unit!18577) (_2!12113 BitStream!11478)) )
))
(declare-fun lt!403036 () tuple2!22354)

(assert (=> b!260901 (= res!218426 (not (= (size!6278 (buf!6800 thiss!914)) (size!6278 (buf!6800 (_2!12113 lt!403036))))))))

(declare-fun lt!403035 () tuple2!22354)

(declare-fun increaseBitIndex!0 (BitStream!11478) tuple2!22354)

(assert (=> b!260901 (= lt!403036 (increaseBitIndex!0 (_2!12113 lt!403035)))))

(declare-fun arrayRangesEq!945 (array!14363 array!14363 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260901 (arrayRangesEq!945 (buf!6800 thiss!914) (array!14364 (store (arr!7265 (buf!6800 thiss!914)) (currentByte!12526 (_2!12113 lt!403035)) (select (arr!7265 (buf!6800 (_2!12113 lt!403035))) (currentByte!12526 (_2!12113 lt!403035)))) (size!6278 (buf!6800 thiss!914))) #b00000000000000000000000000000000 (currentByte!12526 (_2!12113 lt!403035)))))

(declare-fun lt!403037 () Unit!18577)

(declare-fun arrayUpdatedAtPrefixLemma!461 (array!14363 (_ BitVec 32) (_ BitVec 8)) Unit!18577)

(assert (=> b!260901 (= lt!403037 (arrayUpdatedAtPrefixLemma!461 (buf!6800 thiss!914) (currentByte!12526 (_2!12113 lt!403035)) (select (arr!7265 (buf!6800 (_2!12113 lt!403035))) (currentByte!12526 (_2!12113 lt!403035)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18579 () Unit!18577)

(declare-fun Unit!18580 () Unit!18577)

(assert (=> b!260901 (= lt!403035 (ite b!187 (tuple2!22355 Unit!18579 (BitStream!11479 (array!14364 (store (arr!7265 (buf!6800 thiss!914)) (currentByte!12526 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7265 (buf!6800 thiss!914)) (currentByte!12526 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12521 thiss!914)))))) (size!6278 (buf!6800 thiss!914))) (currentByte!12526 thiss!914) (currentBit!12521 thiss!914))) (tuple2!22355 Unit!18580 (BitStream!11479 (array!14364 (store (arr!7265 (buf!6800 thiss!914)) (currentByte!12526 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7265 (buf!6800 thiss!914)) (currentByte!12526 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12521 thiss!914))))))) (size!6278 (buf!6800 thiss!914))) (currentByte!12526 thiss!914) (currentBit!12521 thiss!914)))))))

(declare-fun b!260902 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260902 (= e!181338 (invariant!0 (currentBit!12521 thiss!914) (currentByte!12526 thiss!914) (size!6278 (buf!6800 (_2!12113 lt!403036)))))))

(declare-fun b!260903 () Bool)

(declare-fun res!218425 () Bool)

(assert (=> b!260903 (=> res!218425 e!181338)))

(declare-fun isPrefixOf!0 (BitStream!11478 BitStream!11478) Bool)

(assert (=> b!260903 (= res!218425 (not (isPrefixOf!0 thiss!914 (_2!12113 lt!403036))))))

(declare-fun b!260904 () Bool)

(declare-fun array_inv!6019 (array!14363) Bool)

(assert (=> b!260904 (= e!181337 (array_inv!6019 (buf!6800 thiss!914)))))

(declare-fun b!260905 () Bool)

(declare-fun res!218424 () Bool)

(assert (=> b!260905 (=> res!218424 e!181338)))

(assert (=> b!260905 (= res!218424 (not (invariant!0 (currentBit!12521 (_2!12113 lt!403036)) (currentByte!12526 (_2!12113 lt!403036)) (size!6278 (buf!6800 (_2!12113 lt!403036))))))))

(declare-fun b!260906 () Bool)

(declare-fun res!218423 () Bool)

(assert (=> b!260906 (=> res!218423 e!181338)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!260906 (= res!218423 (not (= (bitIndex!0 (size!6278 (buf!6800 (_2!12113 lt!403036))) (currentByte!12526 (_2!12113 lt!403036)) (currentBit!12521 (_2!12113 lt!403036))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6278 (buf!6800 thiss!914)) (currentByte!12526 thiss!914) (currentBit!12521 thiss!914))))))))

(assert (= (and start!56466 res!218422) b!260901))

(assert (= (and b!260901 (not res!218426)) b!260906))

(assert (= (and b!260906 (not res!218423)) b!260903))

(assert (= (and b!260903 (not res!218425)) b!260905))

(assert (= (and b!260905 (not res!218424)) b!260902))

(assert (= start!56466 b!260904))

(declare-fun m!390443 () Bool)

(assert (=> b!260901 m!390443))

(declare-fun m!390445 () Bool)

(assert (=> b!260901 m!390445))

(declare-fun m!390447 () Bool)

(assert (=> b!260901 m!390447))

(declare-fun m!390449 () Bool)

(assert (=> b!260901 m!390449))

(declare-fun m!390451 () Bool)

(assert (=> b!260901 m!390451))

(declare-fun m!390453 () Bool)

(assert (=> b!260901 m!390453))

(declare-fun m!390455 () Bool)

(assert (=> b!260901 m!390455))

(assert (=> b!260901 m!390445))

(declare-fun m!390457 () Bool)

(assert (=> b!260901 m!390457))

(declare-fun m!390459 () Bool)

(assert (=> b!260901 m!390459))

(declare-fun m!390461 () Bool)

(assert (=> b!260903 m!390461))

(declare-fun m!390463 () Bool)

(assert (=> start!56466 m!390463))

(declare-fun m!390465 () Bool)

(assert (=> start!56466 m!390465))

(declare-fun m!390467 () Bool)

(assert (=> b!260902 m!390467))

(declare-fun m!390469 () Bool)

(assert (=> b!260905 m!390469))

(declare-fun m!390471 () Bool)

(assert (=> b!260904 m!390471))

(declare-fun m!390473 () Bool)

(assert (=> b!260906 m!390473))

(declare-fun m!390475 () Bool)

(assert (=> b!260906 m!390475))

(check-sat (not b!260903) (not b!260902) (not b!260906) (not start!56466) (not b!260905) (not b!260904) (not b!260901))
(check-sat)
(get-model)

(declare-fun d!87694 () Bool)

(declare-fun e!181369 () Bool)

(assert (=> d!87694 e!181369))

(declare-fun res!218467 () Bool)

(assert (=> d!87694 (=> (not res!218467) (not e!181369))))

(declare-fun lt!403090 () (_ BitVec 64))

(declare-fun lt!403091 () (_ BitVec 64))

(declare-fun lt!403092 () tuple2!22354)

(assert (=> d!87694 (= res!218467 (= (bvadd lt!403091 lt!403090) (bitIndex!0 (size!6278 (buf!6800 (_2!12113 lt!403092))) (currentByte!12526 (_2!12113 lt!403092)) (currentBit!12521 (_2!12113 lt!403092)))))))

(assert (=> d!87694 (or (not (= (bvand lt!403091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403090 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!403091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!403091 lt!403090) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87694 (= lt!403090 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!87694 (= lt!403091 (bitIndex!0 (size!6278 (buf!6800 (_2!12113 lt!403035))) (currentByte!12526 (_2!12113 lt!403035)) (currentBit!12521 (_2!12113 lt!403035))))))

(declare-fun Unit!18587 () Unit!18577)

(declare-fun Unit!18588 () Unit!18577)

(assert (=> d!87694 (= lt!403092 (ite (bvslt (currentBit!12521 (_2!12113 lt!403035)) #b00000000000000000000000000000111) (tuple2!22355 Unit!18587 (BitStream!11479 (buf!6800 (_2!12113 lt!403035)) (currentByte!12526 (_2!12113 lt!403035)) (bvadd (currentBit!12521 (_2!12113 lt!403035)) #b00000000000000000000000000000001))) (tuple2!22355 Unit!18588 (BitStream!11479 (buf!6800 (_2!12113 lt!403035)) (bvadd (currentByte!12526 (_2!12113 lt!403035)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87694 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6278 (buf!6800 (_2!12113 lt!403035)))) ((_ sign_extend 32) (currentByte!12526 (_2!12113 lt!403035))) ((_ sign_extend 32) (currentBit!12521 (_2!12113 lt!403035)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!87694 (= (increaseBitIndex!0 (_2!12113 lt!403035)) lt!403092)))

(declare-fun b!260950 () Bool)

(declare-fun res!218468 () Bool)

(assert (=> b!260950 (=> (not res!218468) (not e!181369))))

(declare-fun lt!403094 () (_ BitVec 64))

(declare-fun lt!403093 () (_ BitVec 64))

(assert (=> b!260950 (= res!218468 (= (bvsub lt!403094 lt!403093) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!260950 (or (= (bvand lt!403094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403093 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403094 lt!403093) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260950 (= lt!403093 (remainingBits!0 ((_ sign_extend 32) (size!6278 (buf!6800 (_2!12113 lt!403092)))) ((_ sign_extend 32) (currentByte!12526 (_2!12113 lt!403092))) ((_ sign_extend 32) (currentBit!12521 (_2!12113 lt!403092)))))))

(assert (=> b!260950 (= lt!403094 (remainingBits!0 ((_ sign_extend 32) (size!6278 (buf!6800 (_2!12113 lt!403035)))) ((_ sign_extend 32) (currentByte!12526 (_2!12113 lt!403035))) ((_ sign_extend 32) (currentBit!12521 (_2!12113 lt!403035)))))))

(declare-fun b!260951 () Bool)

(assert (=> b!260951 (= e!181369 (= (size!6278 (buf!6800 (_2!12113 lt!403035))) (size!6278 (buf!6800 (_2!12113 lt!403092)))))))

(assert (= (and d!87694 res!218467) b!260950))

(assert (= (and b!260950 res!218468) b!260951))

(declare-fun m!390535 () Bool)

(assert (=> d!87694 m!390535))

(declare-fun m!390539 () Bool)

(assert (=> d!87694 m!390539))

(declare-fun m!390543 () Bool)

(assert (=> d!87694 m!390543))

(declare-fun m!390545 () Bool)

(assert (=> b!260950 m!390545))

(assert (=> b!260950 m!390543))

(assert (=> b!260901 d!87694))

(declare-fun d!87708 () Bool)

(declare-fun res!218479 () Bool)

(declare-fun e!181380 () Bool)

(assert (=> d!87708 (=> res!218479 e!181380)))

(assert (=> d!87708 (= res!218479 (= #b00000000000000000000000000000000 (currentByte!12526 (_2!12113 lt!403035))))))

(assert (=> d!87708 (= (arrayRangesEq!945 (buf!6800 thiss!914) (array!14364 (store (arr!7265 (buf!6800 thiss!914)) (currentByte!12526 (_2!12113 lt!403035)) (select (arr!7265 (buf!6800 (_2!12113 lt!403035))) (currentByte!12526 (_2!12113 lt!403035)))) (size!6278 (buf!6800 thiss!914))) #b00000000000000000000000000000000 (currentByte!12526 (_2!12113 lt!403035))) e!181380)))

(declare-fun b!260962 () Bool)

(declare-fun e!181381 () Bool)

(assert (=> b!260962 (= e!181380 e!181381)))

(declare-fun res!218480 () Bool)

(assert (=> b!260962 (=> (not res!218480) (not e!181381))))

(assert (=> b!260962 (= res!218480 (= (select (arr!7265 (buf!6800 thiss!914)) #b00000000000000000000000000000000) (select (arr!7265 (array!14364 (store (arr!7265 (buf!6800 thiss!914)) (currentByte!12526 (_2!12113 lt!403035)) (select (arr!7265 (buf!6800 (_2!12113 lt!403035))) (currentByte!12526 (_2!12113 lt!403035)))) (size!6278 (buf!6800 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!260963 () Bool)

(assert (=> b!260963 (= e!181381 (arrayRangesEq!945 (buf!6800 thiss!914) (array!14364 (store (arr!7265 (buf!6800 thiss!914)) (currentByte!12526 (_2!12113 lt!403035)) (select (arr!7265 (buf!6800 (_2!12113 lt!403035))) (currentByte!12526 (_2!12113 lt!403035)))) (size!6278 (buf!6800 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12526 (_2!12113 lt!403035))))))

(assert (= (and d!87708 (not res!218479)) b!260962))

(assert (= (and b!260962 res!218480) b!260963))

(declare-fun m!390551 () Bool)

(assert (=> b!260962 m!390551))

(declare-fun m!390555 () Bool)

(assert (=> b!260962 m!390555))

(declare-fun m!390557 () Bool)

(assert (=> b!260963 m!390557))

(assert (=> b!260901 d!87708))

(declare-fun d!87712 () Bool)

(declare-fun e!181387 () Bool)

(assert (=> d!87712 e!181387))

(declare-fun res!218486 () Bool)

(assert (=> d!87712 (=> (not res!218486) (not e!181387))))

(assert (=> d!87712 (= res!218486 (and (bvsge (currentByte!12526 (_2!12113 lt!403035)) #b00000000000000000000000000000000) (bvslt (currentByte!12526 (_2!12113 lt!403035)) (size!6278 (buf!6800 thiss!914)))))))

(declare-fun lt!403100 () Unit!18577)

(declare-fun choose!355 (array!14363 (_ BitVec 32) (_ BitVec 8)) Unit!18577)

(assert (=> d!87712 (= lt!403100 (choose!355 (buf!6800 thiss!914) (currentByte!12526 (_2!12113 lt!403035)) (select (arr!7265 (buf!6800 (_2!12113 lt!403035))) (currentByte!12526 (_2!12113 lt!403035)))))))

(assert (=> d!87712 (and (bvsle #b00000000000000000000000000000000 (currentByte!12526 (_2!12113 lt!403035))) (bvslt (currentByte!12526 (_2!12113 lt!403035)) (size!6278 (buf!6800 thiss!914))))))

(assert (=> d!87712 (= (arrayUpdatedAtPrefixLemma!461 (buf!6800 thiss!914) (currentByte!12526 (_2!12113 lt!403035)) (select (arr!7265 (buf!6800 (_2!12113 lt!403035))) (currentByte!12526 (_2!12113 lt!403035)))) lt!403100)))

(declare-fun b!260969 () Bool)

(assert (=> b!260969 (= e!181387 (arrayRangesEq!945 (buf!6800 thiss!914) (array!14364 (store (arr!7265 (buf!6800 thiss!914)) (currentByte!12526 (_2!12113 lt!403035)) (select (arr!7265 (buf!6800 (_2!12113 lt!403035))) (currentByte!12526 (_2!12113 lt!403035)))) (size!6278 (buf!6800 thiss!914))) #b00000000000000000000000000000000 (currentByte!12526 (_2!12113 lt!403035))))))

(assert (= (and d!87712 res!218486) b!260969))

(assert (=> d!87712 m!390445))

(declare-fun m!390561 () Bool)

(assert (=> d!87712 m!390561))

(assert (=> b!260969 m!390453))

(assert (=> b!260969 m!390443))

(assert (=> b!260901 d!87712))

(declare-fun d!87716 () Bool)

(declare-fun e!181406 () Bool)

(assert (=> d!87716 e!181406))

(declare-fun res!218518 () Bool)

(assert (=> d!87716 (=> (not res!218518) (not e!181406))))

(declare-fun lt!403138 () (_ BitVec 64))

(declare-fun lt!403141 () (_ BitVec 64))

(declare-fun lt!403139 () (_ BitVec 64))

(assert (=> d!87716 (= res!218518 (= lt!403138 (bvsub lt!403141 lt!403139)))))

(assert (=> d!87716 (or (= (bvand lt!403141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403139 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403141 lt!403139) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87716 (= lt!403139 (remainingBits!0 ((_ sign_extend 32) (size!6278 (buf!6800 (_2!12113 lt!403036)))) ((_ sign_extend 32) (currentByte!12526 (_2!12113 lt!403036))) ((_ sign_extend 32) (currentBit!12521 (_2!12113 lt!403036)))))))

(declare-fun lt!403137 () (_ BitVec 64))

(declare-fun lt!403140 () (_ BitVec 64))

(assert (=> d!87716 (= lt!403141 (bvmul lt!403137 lt!403140))))

(assert (=> d!87716 (or (= lt!403137 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403140 (bvsdiv (bvmul lt!403137 lt!403140) lt!403137)))))

(assert (=> d!87716 (= lt!403140 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87716 (= lt!403137 ((_ sign_extend 32) (size!6278 (buf!6800 (_2!12113 lt!403036)))))))

(assert (=> d!87716 (= lt!403138 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12526 (_2!12113 lt!403036))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12521 (_2!12113 lt!403036)))))))

(assert (=> d!87716 (invariant!0 (currentBit!12521 (_2!12113 lt!403036)) (currentByte!12526 (_2!12113 lt!403036)) (size!6278 (buf!6800 (_2!12113 lt!403036))))))

(assert (=> d!87716 (= (bitIndex!0 (size!6278 (buf!6800 (_2!12113 lt!403036))) (currentByte!12526 (_2!12113 lt!403036)) (currentBit!12521 (_2!12113 lt!403036))) lt!403138)))

(declare-fun b!261000 () Bool)

(declare-fun res!218517 () Bool)

(assert (=> b!261000 (=> (not res!218517) (not e!181406))))

(assert (=> b!261000 (= res!218517 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403138))))

(declare-fun b!261001 () Bool)

(declare-fun lt!403142 () (_ BitVec 64))

(assert (=> b!261001 (= e!181406 (bvsle lt!403138 (bvmul lt!403142 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261001 (or (= lt!403142 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403142 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403142)))))

(assert (=> b!261001 (= lt!403142 ((_ sign_extend 32) (size!6278 (buf!6800 (_2!12113 lt!403036)))))))

(assert (= (and d!87716 res!218518) b!261000))

(assert (= (and b!261000 res!218517) b!261001))

(declare-fun m!390573 () Bool)

(assert (=> d!87716 m!390573))

(assert (=> d!87716 m!390469))

(assert (=> b!260906 d!87716))

(declare-fun d!87734 () Bool)

(declare-fun e!181407 () Bool)

(assert (=> d!87734 e!181407))

(declare-fun res!218520 () Bool)

(assert (=> d!87734 (=> (not res!218520) (not e!181407))))

(declare-fun lt!403145 () (_ BitVec 64))

(declare-fun lt!403147 () (_ BitVec 64))

(declare-fun lt!403144 () (_ BitVec 64))

(assert (=> d!87734 (= res!218520 (= lt!403144 (bvsub lt!403147 lt!403145)))))

(assert (=> d!87734 (or (= (bvand lt!403147 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403145 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403147 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403147 lt!403145) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87734 (= lt!403145 (remainingBits!0 ((_ sign_extend 32) (size!6278 (buf!6800 thiss!914))) ((_ sign_extend 32) (currentByte!12526 thiss!914)) ((_ sign_extend 32) (currentBit!12521 thiss!914))))))

(declare-fun lt!403143 () (_ BitVec 64))

(declare-fun lt!403146 () (_ BitVec 64))

(assert (=> d!87734 (= lt!403147 (bvmul lt!403143 lt!403146))))

(assert (=> d!87734 (or (= lt!403143 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403146 (bvsdiv (bvmul lt!403143 lt!403146) lt!403143)))))

(assert (=> d!87734 (= lt!403146 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87734 (= lt!403143 ((_ sign_extend 32) (size!6278 (buf!6800 thiss!914))))))

(assert (=> d!87734 (= lt!403144 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12526 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12521 thiss!914))))))

(assert (=> d!87734 (invariant!0 (currentBit!12521 thiss!914) (currentByte!12526 thiss!914) (size!6278 (buf!6800 thiss!914)))))

(assert (=> d!87734 (= (bitIndex!0 (size!6278 (buf!6800 thiss!914)) (currentByte!12526 thiss!914) (currentBit!12521 thiss!914)) lt!403144)))

(declare-fun b!261002 () Bool)

(declare-fun res!218519 () Bool)

(assert (=> b!261002 (=> (not res!218519) (not e!181407))))

(assert (=> b!261002 (= res!218519 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403144))))

(declare-fun b!261003 () Bool)

(declare-fun lt!403148 () (_ BitVec 64))

(assert (=> b!261003 (= e!181407 (bvsle lt!403144 (bvmul lt!403148 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261003 (or (= lt!403148 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403148 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403148)))))

(assert (=> b!261003 (= lt!403148 ((_ sign_extend 32) (size!6278 (buf!6800 thiss!914))))))

(assert (= (and d!87734 res!218520) b!261002))

(assert (= (and b!261002 res!218519) b!261003))

(declare-fun m!390575 () Bool)

(assert (=> d!87734 m!390575))

(declare-fun m!390577 () Bool)

(assert (=> d!87734 m!390577))

(assert (=> b!260906 d!87734))

(declare-fun d!87736 () Bool)

(assert (=> d!87736 (= (invariant!0 (currentBit!12521 (_2!12113 lt!403036)) (currentByte!12526 (_2!12113 lt!403036)) (size!6278 (buf!6800 (_2!12113 lt!403036)))) (and (bvsge (currentBit!12521 (_2!12113 lt!403036)) #b00000000000000000000000000000000) (bvslt (currentBit!12521 (_2!12113 lt!403036)) #b00000000000000000000000000001000) (bvsge (currentByte!12526 (_2!12113 lt!403036)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12526 (_2!12113 lt!403036)) (size!6278 (buf!6800 (_2!12113 lt!403036)))) (and (= (currentBit!12521 (_2!12113 lt!403036)) #b00000000000000000000000000000000) (= (currentByte!12526 (_2!12113 lt!403036)) (size!6278 (buf!6800 (_2!12113 lt!403036))))))))))

(assert (=> b!260905 d!87736))

(declare-fun d!87738 () Bool)

(assert (=> d!87738 (= (array_inv!6019 (buf!6800 thiss!914)) (bvsge (size!6278 (buf!6800 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!260904 d!87738))

(declare-fun d!87740 () Bool)

(assert (=> d!87740 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6278 (buf!6800 thiss!914))) ((_ sign_extend 32) (currentByte!12526 thiss!914)) ((_ sign_extend 32) (currentBit!12521 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6278 (buf!6800 thiss!914))) ((_ sign_extend 32) (currentByte!12526 thiss!914)) ((_ sign_extend 32) (currentBit!12521 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22219 () Bool)

(assert (= bs!22219 d!87740))

(assert (=> bs!22219 m!390575))

(assert (=> start!56466 d!87740))

(declare-fun d!87742 () Bool)

(assert (=> d!87742 (= (inv!12 thiss!914) (invariant!0 (currentBit!12521 thiss!914) (currentByte!12526 thiss!914) (size!6278 (buf!6800 thiss!914))))))

(declare-fun bs!22220 () Bool)

(assert (= bs!22220 d!87742))

(assert (=> bs!22220 m!390577))

(assert (=> start!56466 d!87742))

(declare-fun d!87744 () Bool)

(declare-fun res!218536 () Bool)

(declare-fun e!181416 () Bool)

(assert (=> d!87744 (=> (not res!218536) (not e!181416))))

(assert (=> d!87744 (= res!218536 (= (size!6278 (buf!6800 thiss!914)) (size!6278 (buf!6800 (_2!12113 lt!403036)))))))

(assert (=> d!87744 (= (isPrefixOf!0 thiss!914 (_2!12113 lt!403036)) e!181416)))

(declare-fun b!261018 () Bool)

(declare-fun res!218535 () Bool)

(assert (=> b!261018 (=> (not res!218535) (not e!181416))))

(assert (=> b!261018 (= res!218535 (bvsle (bitIndex!0 (size!6278 (buf!6800 thiss!914)) (currentByte!12526 thiss!914) (currentBit!12521 thiss!914)) (bitIndex!0 (size!6278 (buf!6800 (_2!12113 lt!403036))) (currentByte!12526 (_2!12113 lt!403036)) (currentBit!12521 (_2!12113 lt!403036)))))))

(declare-fun b!261019 () Bool)

(declare-fun e!181417 () Bool)

(assert (=> b!261019 (= e!181416 e!181417)))

(declare-fun res!218537 () Bool)

(assert (=> b!261019 (=> res!218537 e!181417)))

(assert (=> b!261019 (= res!218537 (= (size!6278 (buf!6800 thiss!914)) #b00000000000000000000000000000000))))

(declare-fun b!261020 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14363 array!14363 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!261020 (= e!181417 (arrayBitRangesEq!0 (buf!6800 thiss!914) (buf!6800 (_2!12113 lt!403036)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6278 (buf!6800 thiss!914)) (currentByte!12526 thiss!914) (currentBit!12521 thiss!914))))))

(assert (= (and d!87744 res!218536) b!261018))

(assert (= (and b!261018 res!218535) b!261019))

(assert (= (and b!261019 (not res!218537)) b!261020))

(assert (=> b!261018 m!390475))

(assert (=> b!261018 m!390473))

(assert (=> b!261020 m!390475))

(assert (=> b!261020 m!390475))

(declare-fun m!390581 () Bool)

(assert (=> b!261020 m!390581))

(assert (=> b!260903 d!87744))

(declare-fun d!87750 () Bool)

(assert (=> d!87750 (= (invariant!0 (currentBit!12521 thiss!914) (currentByte!12526 thiss!914) (size!6278 (buf!6800 (_2!12113 lt!403036)))) (and (bvsge (currentBit!12521 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12521 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12526 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12526 thiss!914) (size!6278 (buf!6800 (_2!12113 lt!403036)))) (and (= (currentBit!12521 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12526 thiss!914) (size!6278 (buf!6800 (_2!12113 lt!403036))))))))))

(assert (=> b!260902 d!87750))

(check-sat (not d!87712) (not d!87740) (not b!260950) (not b!260963) (not d!87716) (not b!261018) (not d!87694) (not d!87734) (not b!261020) (not b!260969) (not d!87742))
