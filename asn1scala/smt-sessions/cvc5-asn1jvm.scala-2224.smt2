; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56464 () Bool)

(assert start!56464)

(declare-fun b!260883 () Bool)

(declare-fun res!218409 () Bool)

(declare-fun e!181324 () Bool)

(assert (=> b!260883 (=> res!218409 e!181324)))

(declare-datatypes ((array!14361 0))(
  ( (array!14362 (arr!7264 (Array (_ BitVec 32) (_ BitVec 8))) (size!6277 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11476 0))(
  ( (BitStream!11477 (buf!6799 array!14361) (currentByte!12525 (_ BitVec 32)) (currentBit!12520 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11476)

(declare-datatypes ((Unit!18573 0))(
  ( (Unit!18574) )
))
(declare-datatypes ((tuple2!22352 0))(
  ( (tuple2!22353 (_1!12112 Unit!18573) (_2!12112 BitStream!11476)) )
))
(declare-fun lt!403026 () tuple2!22352)

(declare-fun isPrefixOf!0 (BitStream!11476 BitStream!11476) Bool)

(assert (=> b!260883 (= res!218409 (not (isPrefixOf!0 thiss!914 (_2!12112 lt!403026))))))

(declare-fun b!260884 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260884 (= e!181324 (invariant!0 (currentBit!12520 thiss!914) (currentByte!12525 thiss!914) (size!6277 (buf!6799 (_2!12112 lt!403026)))))))

(declare-fun b!260885 () Bool)

(declare-fun e!181326 () Bool)

(assert (=> b!260885 (= e!181326 (not e!181324))))

(declare-fun res!218408 () Bool)

(assert (=> b!260885 (=> res!218408 e!181324)))

(assert (=> b!260885 (= res!218408 (not (= (size!6277 (buf!6799 thiss!914)) (size!6277 (buf!6799 (_2!12112 lt!403026))))))))

(declare-fun lt!403027 () tuple2!22352)

(declare-fun increaseBitIndex!0 (BitStream!11476) tuple2!22352)

(assert (=> b!260885 (= lt!403026 (increaseBitIndex!0 (_2!12112 lt!403027)))))

(declare-fun arrayRangesEq!944 (array!14361 array!14361 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260885 (arrayRangesEq!944 (buf!6799 thiss!914) (array!14362 (store (arr!7264 (buf!6799 thiss!914)) (currentByte!12525 (_2!12112 lt!403027)) (select (arr!7264 (buf!6799 (_2!12112 lt!403027))) (currentByte!12525 (_2!12112 lt!403027)))) (size!6277 (buf!6799 thiss!914))) #b00000000000000000000000000000000 (currentByte!12525 (_2!12112 lt!403027)))))

(declare-fun lt!403028 () Unit!18573)

(declare-fun arrayUpdatedAtPrefixLemma!460 (array!14361 (_ BitVec 32) (_ BitVec 8)) Unit!18573)

(assert (=> b!260885 (= lt!403028 (arrayUpdatedAtPrefixLemma!460 (buf!6799 thiss!914) (currentByte!12525 (_2!12112 lt!403027)) (select (arr!7264 (buf!6799 (_2!12112 lt!403027))) (currentByte!12525 (_2!12112 lt!403027)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18575 () Unit!18573)

(declare-fun Unit!18576 () Unit!18573)

(assert (=> b!260885 (= lt!403027 (ite b!187 (tuple2!22353 Unit!18575 (BitStream!11477 (array!14362 (store (arr!7264 (buf!6799 thiss!914)) (currentByte!12525 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7264 (buf!6799 thiss!914)) (currentByte!12525 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12520 thiss!914)))))) (size!6277 (buf!6799 thiss!914))) (currentByte!12525 thiss!914) (currentBit!12520 thiss!914))) (tuple2!22353 Unit!18576 (BitStream!11477 (array!14362 (store (arr!7264 (buf!6799 thiss!914)) (currentByte!12525 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7264 (buf!6799 thiss!914)) (currentByte!12525 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12520 thiss!914))))))) (size!6277 (buf!6799 thiss!914))) (currentByte!12525 thiss!914) (currentBit!12520 thiss!914)))))))

(declare-fun b!260886 () Bool)

(declare-fun res!218410 () Bool)

(assert (=> b!260886 (=> res!218410 e!181324)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!260886 (= res!218410 (not (= (bitIndex!0 (size!6277 (buf!6799 (_2!12112 lt!403026))) (currentByte!12525 (_2!12112 lt!403026)) (currentBit!12520 (_2!12112 lt!403026))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6277 (buf!6799 thiss!914)) (currentByte!12525 thiss!914) (currentBit!12520 thiss!914))))))))

(declare-fun res!218407 () Bool)

(assert (=> start!56464 (=> (not res!218407) (not e!181326))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56464 (= res!218407 (validate_offset_bit!0 ((_ sign_extend 32) (size!6277 (buf!6799 thiss!914))) ((_ sign_extend 32) (currentByte!12525 thiss!914)) ((_ sign_extend 32) (currentBit!12520 thiss!914))))))

(assert (=> start!56464 e!181326))

(declare-fun e!181325 () Bool)

(declare-fun inv!12 (BitStream!11476) Bool)

(assert (=> start!56464 (and (inv!12 thiss!914) e!181325)))

(assert (=> start!56464 true))

(declare-fun b!260887 () Bool)

(declare-fun array_inv!6018 (array!14361) Bool)

(assert (=> b!260887 (= e!181325 (array_inv!6018 (buf!6799 thiss!914)))))

(declare-fun b!260888 () Bool)

(declare-fun res!218411 () Bool)

(assert (=> b!260888 (=> res!218411 e!181324)))

(assert (=> b!260888 (= res!218411 (not (invariant!0 (currentBit!12520 (_2!12112 lt!403026)) (currentByte!12525 (_2!12112 lt!403026)) (size!6277 (buf!6799 (_2!12112 lt!403026))))))))

(assert (= (and start!56464 res!218407) b!260885))

(assert (= (and b!260885 (not res!218408)) b!260886))

(assert (= (and b!260886 (not res!218410)) b!260883))

(assert (= (and b!260883 (not res!218409)) b!260888))

(assert (= (and b!260888 (not res!218411)) b!260884))

(assert (= start!56464 b!260887))

(declare-fun m!390409 () Bool)

(assert (=> b!260886 m!390409))

(declare-fun m!390411 () Bool)

(assert (=> b!260886 m!390411))

(declare-fun m!390413 () Bool)

(assert (=> b!260883 m!390413))

(declare-fun m!390415 () Bool)

(assert (=> b!260885 m!390415))

(declare-fun m!390417 () Bool)

(assert (=> b!260885 m!390417))

(declare-fun m!390419 () Bool)

(assert (=> b!260885 m!390419))

(declare-fun m!390421 () Bool)

(assert (=> b!260885 m!390421))

(assert (=> b!260885 m!390421))

(declare-fun m!390423 () Bool)

(assert (=> b!260885 m!390423))

(declare-fun m!390425 () Bool)

(assert (=> b!260885 m!390425))

(declare-fun m!390427 () Bool)

(assert (=> b!260885 m!390427))

(declare-fun m!390429 () Bool)

(assert (=> b!260885 m!390429))

(declare-fun m!390431 () Bool)

(assert (=> b!260885 m!390431))

(declare-fun m!390433 () Bool)

(assert (=> b!260884 m!390433))

(declare-fun m!390435 () Bool)

(assert (=> b!260888 m!390435))

(declare-fun m!390437 () Bool)

(assert (=> start!56464 m!390437))

(declare-fun m!390439 () Bool)

(assert (=> start!56464 m!390439))

(declare-fun m!390441 () Bool)

(assert (=> b!260887 m!390441))

(push 1)

(assert (not b!260888))

(assert (not b!260885))

(assert (not b!260884))

(assert (not b!260887))

(assert (not start!56464))

(assert (not b!260883))

(assert (not b!260886))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87686 () Bool)

(assert (=> d!87686 (= (invariant!0 (currentBit!12520 thiss!914) (currentByte!12525 thiss!914) (size!6277 (buf!6799 (_2!12112 lt!403026)))) (and (bvsge (currentBit!12520 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12520 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12525 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12525 thiss!914) (size!6277 (buf!6799 (_2!12112 lt!403026)))) (and (= (currentBit!12520 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12525 thiss!914) (size!6277 (buf!6799 (_2!12112 lt!403026))))))))))

(assert (=> b!260884 d!87686))

(declare-fun d!87688 () Bool)

(declare-fun e!181354 () Bool)

(assert (=> d!87688 e!181354))

(declare-fun res!218446 () Bool)

(assert (=> d!87688 (=> (not res!218446) (not e!181354))))

(declare-fun lt!403058 () tuple2!22352)

(declare-fun lt!403061 () (_ BitVec 64))

(declare-fun lt!403057 () (_ BitVec 64))

(assert (=> d!87688 (= res!218446 (= (bvadd lt!403061 lt!403057) (bitIndex!0 (size!6277 (buf!6799 (_2!12112 lt!403058))) (currentByte!12525 (_2!12112 lt!403058)) (currentBit!12520 (_2!12112 lt!403058)))))))

(assert (=> d!87688 (or (not (= (bvand lt!403061 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403057 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!403061 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!403061 lt!403057) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87688 (= lt!403057 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!87688 (= lt!403061 (bitIndex!0 (size!6277 (buf!6799 (_2!12112 lt!403027))) (currentByte!12525 (_2!12112 lt!403027)) (currentBit!12520 (_2!12112 lt!403027))))))

(declare-fun Unit!18585 () Unit!18573)

(declare-fun Unit!18586 () Unit!18573)

(assert (=> d!87688 (= lt!403058 (ite (bvslt (currentBit!12520 (_2!12112 lt!403027)) #b00000000000000000000000000000111) (tuple2!22353 Unit!18585 (BitStream!11477 (buf!6799 (_2!12112 lt!403027)) (currentByte!12525 (_2!12112 lt!403027)) (bvadd (currentBit!12520 (_2!12112 lt!403027)) #b00000000000000000000000000000001))) (tuple2!22353 Unit!18586 (BitStream!11477 (buf!6799 (_2!12112 lt!403027)) (bvadd (currentByte!12525 (_2!12112 lt!403027)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87688 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6277 (buf!6799 (_2!12112 lt!403027)))) ((_ sign_extend 32) (currentByte!12525 (_2!12112 lt!403027))) ((_ sign_extend 32) (currentBit!12520 (_2!12112 lt!403027)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!87688 (= (increaseBitIndex!0 (_2!12112 lt!403027)) lt!403058)))

(declare-fun b!260929 () Bool)

(declare-fun res!218447 () Bool)

(assert (=> b!260929 (=> (not res!218447) (not e!181354))))

(declare-fun lt!403060 () (_ BitVec 64))

(declare-fun lt!403059 () (_ BitVec 64))

(assert (=> b!260929 (= res!218447 (= (bvsub lt!403060 lt!403059) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!260929 (or (= (bvand lt!403060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403059 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403060 lt!403059) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260929 (= lt!403059 (remainingBits!0 ((_ sign_extend 32) (size!6277 (buf!6799 (_2!12112 lt!403058)))) ((_ sign_extend 32) (currentByte!12525 (_2!12112 lt!403058))) ((_ sign_extend 32) (currentBit!12520 (_2!12112 lt!403058)))))))

(assert (=> b!260929 (= lt!403060 (remainingBits!0 ((_ sign_extend 32) (size!6277 (buf!6799 (_2!12112 lt!403027)))) ((_ sign_extend 32) (currentByte!12525 (_2!12112 lt!403027))) ((_ sign_extend 32) (currentBit!12520 (_2!12112 lt!403027)))))))

(declare-fun b!260930 () Bool)

(assert (=> b!260930 (= e!181354 (= (size!6277 (buf!6799 (_2!12112 lt!403027))) (size!6277 (buf!6799 (_2!12112 lt!403058)))))))

(assert (= (and d!87688 res!218446) b!260929))

(assert (= (and b!260929 res!218447) b!260930))

(declare-fun m!390511 () Bool)

(assert (=> d!87688 m!390511))

(declare-fun m!390513 () Bool)

(assert (=> d!87688 m!390513))

(declare-fun m!390515 () Bool)

(assert (=> d!87688 m!390515))

(declare-fun m!390517 () Bool)

(assert (=> b!260929 m!390517))

(assert (=> b!260929 m!390515))

(assert (=> b!260885 d!87688))

(declare-fun d!87696 () Bool)

(declare-fun res!218452 () Bool)

(declare-fun e!181359 () Bool)

(assert (=> d!87696 (=> res!218452 e!181359)))

(assert (=> d!87696 (= res!218452 (= #b00000000000000000000000000000000 (currentByte!12525 (_2!12112 lt!403027))))))

(assert (=> d!87696 (= (arrayRangesEq!944 (buf!6799 thiss!914) (array!14362 (store (arr!7264 (buf!6799 thiss!914)) (currentByte!12525 (_2!12112 lt!403027)) (select (arr!7264 (buf!6799 (_2!12112 lt!403027))) (currentByte!12525 (_2!12112 lt!403027)))) (size!6277 (buf!6799 thiss!914))) #b00000000000000000000000000000000 (currentByte!12525 (_2!12112 lt!403027))) e!181359)))

(declare-fun b!260935 () Bool)

(declare-fun e!181360 () Bool)

(assert (=> b!260935 (= e!181359 e!181360)))

(declare-fun res!218453 () Bool)

(assert (=> b!260935 (=> (not res!218453) (not e!181360))))

(assert (=> b!260935 (= res!218453 (= (select (arr!7264 (buf!6799 thiss!914)) #b00000000000000000000000000000000) (select (arr!7264 (array!14362 (store (arr!7264 (buf!6799 thiss!914)) (currentByte!12525 (_2!12112 lt!403027)) (select (arr!7264 (buf!6799 (_2!12112 lt!403027))) (currentByte!12525 (_2!12112 lt!403027)))) (size!6277 (buf!6799 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!260936 () Bool)

(assert (=> b!260936 (= e!181360 (arrayRangesEq!944 (buf!6799 thiss!914) (array!14362 (store (arr!7264 (buf!6799 thiss!914)) (currentByte!12525 (_2!12112 lt!403027)) (select (arr!7264 (buf!6799 (_2!12112 lt!403027))) (currentByte!12525 (_2!12112 lt!403027)))) (size!6277 (buf!6799 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12525 (_2!12112 lt!403027))))))

(assert (= (and d!87696 (not res!218452)) b!260935))

(assert (= (and b!260935 res!218453) b!260936))

(declare-fun m!390519 () Bool)

(assert (=> b!260935 m!390519))

(declare-fun m!390521 () Bool)

(assert (=> b!260935 m!390521))

(declare-fun m!390523 () Bool)

(assert (=> b!260936 m!390523))

(assert (=> b!260885 d!87696))

(declare-fun d!87698 () Bool)

(declare-fun e!181367 () Bool)

(assert (=> d!87698 e!181367))

(declare-fun res!218464 () Bool)

(assert (=> d!87698 (=> (not res!218464) (not e!181367))))

(assert (=> d!87698 (= res!218464 (and (bvsge (currentByte!12525 (_2!12112 lt!403027)) #b00000000000000000000000000000000) (bvslt (currentByte!12525 (_2!12112 lt!403027)) (size!6277 (buf!6799 thiss!914)))))))

(declare-fun lt!403084 () Unit!18573)

(declare-fun choose!354 (array!14361 (_ BitVec 32) (_ BitVec 8)) Unit!18573)

(assert (=> d!87698 (= lt!403084 (choose!354 (buf!6799 thiss!914) (currentByte!12525 (_2!12112 lt!403027)) (select (arr!7264 (buf!6799 (_2!12112 lt!403027))) (currentByte!12525 (_2!12112 lt!403027)))))))

(assert (=> d!87698 (and (bvsle #b00000000000000000000000000000000 (currentByte!12525 (_2!12112 lt!403027))) (bvslt (currentByte!12525 (_2!12112 lt!403027)) (size!6277 (buf!6799 thiss!914))))))

(assert (=> d!87698 (= (arrayUpdatedAtPrefixLemma!460 (buf!6799 thiss!914) (currentByte!12525 (_2!12112 lt!403027)) (select (arr!7264 (buf!6799 (_2!12112 lt!403027))) (currentByte!12525 (_2!12112 lt!403027)))) lt!403084)))

(declare-fun b!260947 () Bool)

(assert (=> b!260947 (= e!181367 (arrayRangesEq!944 (buf!6799 thiss!914) (array!14362 (store (arr!7264 (buf!6799 thiss!914)) (currentByte!12525 (_2!12112 lt!403027)) (select (arr!7264 (buf!6799 (_2!12112 lt!403027))) (currentByte!12525 (_2!12112 lt!403027)))) (size!6277 (buf!6799 thiss!914))) #b00000000000000000000000000000000 (currentByte!12525 (_2!12112 lt!403027))))))

(assert (= (and d!87698 res!218464) b!260947))

(assert (=> d!87698 m!390421))

(declare-fun m!390525 () Bool)

(assert (=> d!87698 m!390525))

(assert (=> b!260947 m!390431))

(assert (=> b!260947 m!390429))

(assert (=> b!260885 d!87698))

(declare-fun d!87700 () Bool)

(assert (=> d!87700 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6277 (buf!6799 thiss!914))) ((_ sign_extend 32) (currentByte!12525 thiss!914)) ((_ sign_extend 32) (currentBit!12520 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6277 (buf!6799 thiss!914))) ((_ sign_extend 32) (currentByte!12525 thiss!914)) ((_ sign_extend 32) (currentBit!12520 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22215 () Bool)

(assert (= bs!22215 d!87700))

(declare-fun m!390527 () Bool)

(assert (=> bs!22215 m!390527))

(assert (=> start!56464 d!87700))

(declare-fun d!87702 () Bool)

(assert (=> d!87702 (= (inv!12 thiss!914) (invariant!0 (currentBit!12520 thiss!914) (currentByte!12525 thiss!914) (size!6277 (buf!6799 thiss!914))))))

(declare-fun bs!22216 () Bool)

(assert (= bs!22216 d!87702))

(declare-fun m!390529 () Bool)

(assert (=> bs!22216 m!390529))

(assert (=> start!56464 d!87702))

(declare-fun d!87704 () Bool)

(declare-fun e!181394 () Bool)

(assert (=> d!87704 e!181394))

(declare-fun res!218498 () Bool)

(assert (=> d!87704 (=> (not res!218498) (not e!181394))))

(declare-fun lt!403117 () (_ BitVec 64))

(declare-fun lt!403115 () (_ BitVec 64))

(declare-fun lt!403118 () (_ BitVec 64))

(assert (=> d!87704 (= res!218498 (= lt!403118 (bvsub lt!403117 lt!403115)))))

(assert (=> d!87704 (or (= (bvand lt!403117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403115 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403117 lt!403115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87704 (= lt!403115 (remainingBits!0 ((_ sign_extend 32) (size!6277 (buf!6799 (_2!12112 lt!403026)))) ((_ sign_extend 32) (currentByte!12525 (_2!12112 lt!403026))) ((_ sign_extend 32) (currentBit!12520 (_2!12112 lt!403026)))))))

(declare-fun lt!403114 () (_ BitVec 64))

(declare-fun lt!403113 () (_ BitVec 64))

(assert (=> d!87704 (= lt!403117 (bvmul lt!403114 lt!403113))))

(assert (=> d!87704 (or (= lt!403114 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403113 (bvsdiv (bvmul lt!403114 lt!403113) lt!403114)))))

(assert (=> d!87704 (= lt!403113 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87704 (= lt!403114 ((_ sign_extend 32) (size!6277 (buf!6799 (_2!12112 lt!403026)))))))

(assert (=> d!87704 (= lt!403118 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12525 (_2!12112 lt!403026))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12520 (_2!12112 lt!403026)))))))

(assert (=> d!87704 (invariant!0 (currentBit!12520 (_2!12112 lt!403026)) (currentByte!12525 (_2!12112 lt!403026)) (size!6277 (buf!6799 (_2!12112 lt!403026))))))

(assert (=> d!87704 (= (bitIndex!0 (size!6277 (buf!6799 (_2!12112 lt!403026))) (currentByte!12525 (_2!12112 lt!403026)) (currentBit!12520 (_2!12112 lt!403026))) lt!403118)))

(declare-fun b!260980 () Bool)

(declare-fun res!218497 () Bool)

(assert (=> b!260980 (=> (not res!218497) (not e!181394))))

(assert (=> b!260980 (= res!218497 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403118))))

(declare-fun b!260981 () Bool)

(declare-fun lt!403116 () (_ BitVec 64))

(assert (=> b!260981 (= e!181394 (bvsle lt!403118 (bvmul lt!403116 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!260981 (or (= lt!403116 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403116 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403116)))))

(assert (=> b!260981 (= lt!403116 ((_ sign_extend 32) (size!6277 (buf!6799 (_2!12112 lt!403026)))))))

(assert (= (and d!87704 res!218498) b!260980))

(assert (= (and b!260980 res!218497) b!260981))

(declare-fun m!390563 () Bool)

(assert (=> d!87704 m!390563))

(assert (=> d!87704 m!390435))

(assert (=> b!260886 d!87704))

(declare-fun d!87718 () Bool)

(declare-fun e!181395 () Bool)

(assert (=> d!87718 e!181395))

(declare-fun res!218500 () Bool)

(assert (=> d!87718 (=> (not res!218500) (not e!181395))))

(declare-fun lt!403124 () (_ BitVec 64))

(declare-fun lt!403123 () (_ BitVec 64))

(declare-fun lt!403121 () (_ BitVec 64))

(assert (=> d!87718 (= res!218500 (= lt!403124 (bvsub lt!403123 lt!403121)))))

(assert (=> d!87718 (or (= (bvand lt!403123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403121 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403123 lt!403121) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87718 (= lt!403121 (remainingBits!0 ((_ sign_extend 32) (size!6277 (buf!6799 thiss!914))) ((_ sign_extend 32) (currentByte!12525 thiss!914)) ((_ sign_extend 32) (currentBit!12520 thiss!914))))))

(declare-fun lt!403120 () (_ BitVec 64))

(declare-fun lt!403119 () (_ BitVec 64))

(assert (=> d!87718 (= lt!403123 (bvmul lt!403120 lt!403119))))

(assert (=> d!87718 (or (= lt!403120 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403119 (bvsdiv (bvmul lt!403120 lt!403119) lt!403120)))))

(assert (=> d!87718 (= lt!403119 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87718 (= lt!403120 ((_ sign_extend 32) (size!6277 (buf!6799 thiss!914))))))

(assert (=> d!87718 (= lt!403124 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12525 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12520 thiss!914))))))

(assert (=> d!87718 (invariant!0 (currentBit!12520 thiss!914) (currentByte!12525 thiss!914) (size!6277 (buf!6799 thiss!914)))))

(assert (=> d!87718 (= (bitIndex!0 (size!6277 (buf!6799 thiss!914)) (currentByte!12525 thiss!914) (currentBit!12520 thiss!914)) lt!403124)))

(declare-fun b!260982 () Bool)

(declare-fun res!218499 () Bool)

(assert (=> b!260982 (=> (not res!218499) (not e!181395))))

(assert (=> b!260982 (= res!218499 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403124))))

(declare-fun b!260983 () Bool)

(declare-fun lt!403122 () (_ BitVec 64))

(assert (=> b!260983 (= e!181395 (bvsle lt!403124 (bvmul lt!403122 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!260983 (or (= lt!403122 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403122 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403122)))))

(assert (=> b!260983 (= lt!403122 ((_ sign_extend 32) (size!6277 (buf!6799 thiss!914))))))

(assert (= (and d!87718 res!218500) b!260982))

(assert (= (and b!260982 res!218499) b!260983))

(assert (=> d!87718 m!390527))

(assert (=> d!87718 m!390529))

(assert (=> b!260886 d!87718))

(declare-fun d!87720 () Bool)

(assert (=> d!87720 (= (array_inv!6018 (buf!6799 thiss!914)) (bvsge (size!6277 (buf!6799 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!260887 d!87720))

(declare-fun d!87722 () Bool)

(assert (=> d!87722 (= (invariant!0 (currentBit!12520 (_2!12112 lt!403026)) (currentByte!12525 (_2!12112 lt!403026)) (size!6277 (buf!6799 (_2!12112 lt!403026)))) (and (bvsge (currentBit!12520 (_2!12112 lt!403026)) #b00000000000000000000000000000000) (bvslt (currentBit!12520 (_2!12112 lt!403026)) #b00000000000000000000000000001000) (bvsge (currentByte!12525 (_2!12112 lt!403026)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12525 (_2!12112 lt!403026)) (size!6277 (buf!6799 (_2!12112 lt!403026)))) (and (= (currentBit!12520 (_2!12112 lt!403026)) #b00000000000000000000000000000000) (= (currentByte!12525 (_2!12112 lt!403026)) (size!6277 (buf!6799 (_2!12112 lt!403026))))))))))

(assert (=> b!260888 d!87722))

(declare-fun d!87724 () Bool)

(declare-fun res!218512 () Bool)

(declare-fun e!181405 () Bool)

(assert (=> d!87724 (=> (not res!218512) (not e!181405))))

(assert (=> d!87724 (= res!218512 (= (size!6277 (buf!6799 thiss!914)) (size!6277 (buf!6799 (_2!12112 lt!403026)))))))

(assert (=> d!87724 (= (isPrefixOf!0 thiss!914 (_2!12112 lt!403026)) e!181405)))

(declare-fun b!260993 () Bool)

(declare-fun res!218514 () Bool)

(assert (=> b!260993 (=> (not res!218514) (not e!181405))))

(assert (=> b!260993 (= res!218514 (bvsle (bitIndex!0 (size!6277 (buf!6799 thiss!914)) (currentByte!12525 thiss!914) (currentBit!12520 thiss!914)) (bitIndex!0 (size!6277 (buf!6799 (_2!12112 lt!403026))) (currentByte!12525 (_2!12112 lt!403026)) (currentBit!12520 (_2!12112 lt!403026)))))))

(declare-fun b!260994 () Bool)

(declare-fun e!181404 () Bool)

(assert (=> b!260994 (= e!181405 e!181404)))

(declare-fun res!218513 () Bool)

(assert (=> b!260994 (=> res!218513 e!181404)))

(assert (=> b!260994 (= res!218513 (= (size!6277 (buf!6799 thiss!914)) #b00000000000000000000000000000000))))

(declare-fun b!260995 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14361 array!14361 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260995 (= e!181404 (arrayBitRangesEq!0 (buf!6799 thiss!914) (buf!6799 (_2!12112 lt!403026)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6277 (buf!6799 thiss!914)) (currentByte!12525 thiss!914) (currentBit!12520 thiss!914))))))

(assert (= (and d!87724 res!218512) b!260993))

(assert (= (and b!260993 res!218514) b!260994))

(assert (= (and b!260994 (not res!218513)) b!260995))

(assert (=> b!260993 m!390411))

(assert (=> b!260993 m!390409))

(assert (=> b!260995 m!390411))

(assert (=> b!260995 m!390411))

(declare-fun m!390571 () Bool)

(assert (=> b!260995 m!390571))

(assert (=> b!260883 d!87724))

(push 1)

(assert (not b!260936))

(assert (not d!87698))

(assert (not d!87704))

(assert (not b!260995))

(assert (not b!260993))

(assert (not d!87718))

(assert (not b!260947))

(assert (not b!260929))

(assert (not d!87700))

(assert (not d!87688))

(assert (not d!87702))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

