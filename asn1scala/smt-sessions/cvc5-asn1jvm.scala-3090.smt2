; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71158 () Bool)

(assert start!71158)

(declare-fun e!231208 () Bool)

(declare-fun nBits!542 () (_ BitVec 32))

(declare-fun lt!444388 () (_ BitVec 64))

(declare-fun lt!444389 () (_ BitVec 64))

(declare-fun b!321114 () Bool)

(assert (=> b!321114 (= e!231208 (and (= lt!444388 (bvand ((_ sign_extend 32) nBits!542) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!444388 (bvand (bvadd lt!444389 ((_ sign_extend 32) nBits!542)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!321114 (= lt!444388 (bvand lt!444389 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!20304 0))(
  ( (array!20305 (arr!9940 (Array (_ BitVec 32) (_ BitVec 8))) (size!8848 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13858 0))(
  ( (BitStream!13859 (buf!7990 array!20304) (currentByte!14743 (_ BitVec 32)) (currentBit!14738 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13858)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321114 (= lt!444389 (bitIndex!0 (size!8848 (buf!7990 thiss!1780)) (currentByte!14743 thiss!1780) (currentBit!14738 thiss!1780)))))

(declare-fun b!321112 () Bool)

(declare-fun res!263735 () Bool)

(assert (=> b!321112 (=> (not res!263735) (not e!231208))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321112 (= res!263735 (validate_offset_bits!1 ((_ sign_extend 32) (size!8848 (buf!7990 thiss!1780))) ((_ sign_extend 32) (currentByte!14743 thiss!1780)) ((_ sign_extend 32) (currentBit!14738 thiss!1780)) ((_ sign_extend 32) nBits!542)))))

(declare-fun b!321115 () Bool)

(declare-fun e!231209 () Bool)

(declare-fun array_inv!8400 (array!20304) Bool)

(assert (=> b!321115 (= e!231209 (array_inv!8400 (buf!7990 thiss!1780)))))

(declare-fun res!263736 () Bool)

(assert (=> start!71158 (=> (not res!263736) (not e!231208))))

(assert (=> start!71158 (= res!263736 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000)))))

(assert (=> start!71158 e!231208))

(assert (=> start!71158 true))

(declare-fun inv!12 (BitStream!13858) Bool)

(assert (=> start!71158 (and (inv!12 thiss!1780) e!231209)))

(declare-fun b!321113 () Bool)

(declare-fun res!263737 () Bool)

(assert (=> b!321113 (=> (not res!263737) (not e!231208))))

(declare-datatypes ((tuple2!23478 0))(
  ( (tuple2!23479 (_1!13368 (_ BitVec 64)) (_2!13368 BitStream!13858)) )
))
(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!13858 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23478)

(assert (=> b!321113 (= res!263737 (= (buf!7990 (_2!13368 (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))) (buf!7990 thiss!1780)))))

(assert (= (and start!71158 res!263736) b!321112))

(assert (= (and b!321112 res!263735) b!321113))

(assert (= (and b!321113 res!263737) b!321114))

(assert (= start!71158 b!321115))

(declare-fun m!459453 () Bool)

(assert (=> start!71158 m!459453))

(declare-fun m!459455 () Bool)

(assert (=> b!321115 m!459455))

(declare-fun m!459457 () Bool)

(assert (=> b!321112 m!459457))

(declare-fun m!459459 () Bool)

(assert (=> b!321113 m!459459))

(declare-fun m!459461 () Bool)

(assert (=> b!321114 m!459461))

(push 1)

(assert (not start!71158))

(assert (not b!321112))

(assert (not b!321115))

(assert (not b!321113))

(assert (not b!321114))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105186 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105186 (= (inv!12 thiss!1780) (invariant!0 (currentBit!14738 thiss!1780) (currentByte!14743 thiss!1780) (size!8848 (buf!7990 thiss!1780))))))

(declare-fun bs!27660 () Bool)

(assert (= bs!27660 d!105186))

(declare-fun m!459483 () Bool)

(assert (=> bs!27660 m!459483))

(assert (=> start!71158 d!105186))

(declare-fun d!105188 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105188 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8848 (buf!7990 thiss!1780))) ((_ sign_extend 32) (currentByte!14743 thiss!1780)) ((_ sign_extend 32) (currentBit!14738 thiss!1780)) ((_ sign_extend 32) nBits!542)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8848 (buf!7990 thiss!1780))) ((_ sign_extend 32) (currentByte!14743 thiss!1780)) ((_ sign_extend 32) (currentBit!14738 thiss!1780))) ((_ sign_extend 32) nBits!542)))))

(declare-fun bs!27661 () Bool)

(assert (= bs!27661 d!105188))

(declare-fun m!459485 () Bool)

(assert (=> bs!27661 m!459485))

(assert (=> b!321112 d!105188))

(declare-fun d!105190 () Bool)

(assert (=> d!105190 (= (array_inv!8400 (buf!7990 thiss!1780)) (bvsge (size!8848 (buf!7990 thiss!1780)) #b00000000000000000000000000000000))))

(assert (=> b!321115 d!105190))

(declare-fun d!105192 () Bool)

(declare-fun e!231231 () Bool)

(assert (=> d!105192 e!231231))

(declare-fun res!263761 () Bool)

(assert (=> d!105192 (=> (not res!263761) (not e!231231))))

(declare-fun lt!444417 () (_ BitVec 64))

(declare-fun lt!444415 () (_ BitVec 64))

(declare-fun lt!444419 () (_ BitVec 64))

(assert (=> d!105192 (= res!263761 (= lt!444417 (bvsub lt!444419 lt!444415)))))

(assert (=> d!105192 (or (= (bvand lt!444419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444415 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444419 lt!444415) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105192 (= lt!444415 (remainingBits!0 ((_ sign_extend 32) (size!8848 (buf!7990 thiss!1780))) ((_ sign_extend 32) (currentByte!14743 thiss!1780)) ((_ sign_extend 32) (currentBit!14738 thiss!1780))))))

(declare-fun lt!444416 () (_ BitVec 64))

(declare-fun lt!444414 () (_ BitVec 64))

(assert (=> d!105192 (= lt!444419 (bvmul lt!444416 lt!444414))))

(assert (=> d!105192 (or (= lt!444416 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!444414 (bvsdiv (bvmul lt!444416 lt!444414) lt!444416)))))

(assert (=> d!105192 (= lt!444414 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105192 (= lt!444416 ((_ sign_extend 32) (size!8848 (buf!7990 thiss!1780))))))

(assert (=> d!105192 (= lt!444417 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14743 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14738 thiss!1780))))))

(assert (=> d!105192 (invariant!0 (currentBit!14738 thiss!1780) (currentByte!14743 thiss!1780) (size!8848 (buf!7990 thiss!1780)))))

(assert (=> d!105192 (= (bitIndex!0 (size!8848 (buf!7990 thiss!1780)) (currentByte!14743 thiss!1780) (currentBit!14738 thiss!1780)) lt!444417)))

(declare-fun b!321144 () Bool)

(declare-fun res!263760 () Bool)

(assert (=> b!321144 (=> (not res!263760) (not e!231231))))

(assert (=> b!321144 (= res!263760 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444417))))

(declare-fun b!321145 () Bool)

(declare-fun lt!444418 () (_ BitVec 64))

(assert (=> b!321145 (= e!231231 (bvsle lt!444417 (bvmul lt!444418 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!321145 (or (= lt!444418 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!444418 #b0000000000000000000000000000000000000000000000000000000000001000) lt!444418)))))

(assert (=> b!321145 (= lt!444418 ((_ sign_extend 32) (size!8848 (buf!7990 thiss!1780))))))

(assert (= (and d!105192 res!263761) b!321144))

(assert (= (and b!321144 res!263760) b!321145))

(assert (=> d!105192 m!459485))

(assert (=> d!105192 m!459483))

(assert (=> b!321114 d!105192))

(declare-fun b!321187 () Bool)

(declare-fun res!263794 () Bool)

(declare-fun e!231252 () Bool)

(assert (=> b!321187 (=> (not res!263794) (not e!231252))))

(declare-fun lt!444468 () tuple2!23478)

(declare-fun lt!444472 () (_ BitVec 64))

(declare-fun lt!444470 () (_ BitVec 64))

(assert (=> b!321187 (= res!263794 (= (bitIndex!0 (size!8848 (buf!7990 (_2!13368 lt!444468))) (currentByte!14743 (_2!13368 lt!444468)) (currentBit!14738 (_2!13368 lt!444468))) (bvadd lt!444470 lt!444472)))))

(assert (=> b!321187 (or (not (= (bvand lt!444470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444472 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444470 lt!444472) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!321187 (= lt!444472 ((_ sign_extend 32) (bvsub nBits!542 #b00000000000000000000000000000000)))))

(assert (=> b!321187 (or (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand (bvsub nBits!542 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!321187 (= lt!444470 (bitIndex!0 (size!8848 (buf!7990 thiss!1780)) (currentByte!14743 thiss!1780) (currentBit!14738 thiss!1780)))))

(declare-fun b!321188 () Bool)

(declare-fun res!263796 () Bool)

(assert (=> b!321188 (=> (not res!263796) (not e!231252))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321188 (= res!263796 (= (bvand (_1!13368 lt!444468) (onesLSBLong!0 nBits!542)) (_1!13368 lt!444468)))))

(declare-fun d!105198 () Bool)

(assert (=> d!105198 e!231252))

(declare-fun res!263795 () Bool)

(assert (=> d!105198 (=> (not res!263795) (not e!231252))))

(assert (=> d!105198 (= res!263795 (= (buf!7990 (_2!13368 lt!444468)) (buf!7990 thiss!1780)))))

(declare-fun e!231251 () tuple2!23478)

(assert (=> d!105198 (= lt!444468 e!231251)))

(declare-fun c!15400 () Bool)

(assert (=> d!105198 (= c!15400 (= nBits!542 #b00000000000000000000000000000000))))

(assert (=> d!105198 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!542) (bvsle nBits!542 #b00000000000000000000000001000000))))

(assert (=> d!105198 (= (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) lt!444468)))

(declare-fun b!321189 () Bool)

(declare-fun e!231250 () Bool)

(assert (=> b!321189 (= e!231252 e!231250)))

(declare-fun res!263797 () Bool)

(assert (=> b!321189 (=> res!263797 e!231250)))

(assert (=> b!321189 (= res!263797 (not (bvslt #b00000000000000000000000000000000 nBits!542)))))

(declare-fun b!321190 () Bool)

(assert (=> b!321190 (= e!231251 (tuple2!23479 #b0000000000000000000000000000000000000000000000000000000000000000 thiss!1780))))

(declare-fun b!321191 () Bool)

(declare-fun lt!444469 () tuple2!23478)

(assert (=> b!321191 (= e!231251 (tuple2!23479 (_1!13368 lt!444469) (_2!13368 lt!444469)))))

(declare-datatypes ((tuple2!23484 0))(
  ( (tuple2!23485 (_1!13371 Bool) (_2!13371 BitStream!13858)) )
))
(declare-fun lt!444473 () tuple2!23484)

(declare-fun readBit!0 (BitStream!13858) tuple2!23484)

(assert (=> b!321191 (= lt!444473 (readBit!0 thiss!1780))))

(assert (=> b!321191 (= lt!444469 (readNBitsLSBFirstsLoop!0 (_2!13371 lt!444473) nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13371 lt!444473) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321192 () Bool)

(declare-fun res!263793 () Bool)

(assert (=> b!321192 (=> (not res!263793) (not e!231252))))

(assert (=> b!321192 (= res!263793 (= (bvand (_1!13368 lt!444468) (onesLSBLong!0 #b00000000000000000000000000000000)) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun lt!444471 () (_ BitVec 64))

(declare-fun b!321193 () Bool)

(declare-datatypes ((tuple2!23486 0))(
  ( (tuple2!23487 (_1!13372 BitStream!13858) (_2!13372 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13858) tuple2!23486)

(assert (=> b!321193 (= e!231250 (= (= (bvand (bvlshr (_1!13368 lt!444468) lt!444471) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13372 (readBitPure!0 thiss!1780))))))

(assert (=> b!321193 (and (bvsge lt!444471 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!444471 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!321193 (= lt!444471 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(assert (= (and d!105198 c!15400) b!321190))

(assert (= (and d!105198 (not c!15400)) b!321191))

(assert (= (and d!105198 res!263795) b!321187))

(assert (= (and b!321187 res!263794) b!321192))

(assert (= (and b!321192 res!263793) b!321188))

(assert (= (and b!321188 res!263796) b!321189))

(assert (= (and b!321189 (not res!263797)) b!321193))

(declare-fun m!459503 () Bool)

(assert (=> b!321192 m!459503))

(declare-fun m!459505 () Bool)

(assert (=> b!321191 m!459505))

(declare-fun m!459507 () Bool)

(assert (=> b!321191 m!459507))

(declare-fun m!459509 () Bool)

(assert (=> b!321188 m!459509))

(declare-fun m!459511 () Bool)

(assert (=> b!321187 m!459511))

(assert (=> b!321187 m!459461))

(declare-fun m!459513 () Bool)

(assert (=> b!321193 m!459513))

(assert (=> b!321113 d!105198))

(push 1)

(assert (not b!321193))

(assert (not b!321191))

(assert (not b!321187))

(assert (not b!321188))

(assert (not d!105188))

(assert (not d!105186))

(assert (not d!105192))

(assert (not b!321192))

(check-sat)

(pop 1)

(push 1)

(check-sat)

