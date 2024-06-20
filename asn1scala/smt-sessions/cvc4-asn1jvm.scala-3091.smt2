; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71198 () Bool)

(assert start!71198)

(declare-datatypes ((array!20317 0))(
  ( (array!20318 (arr!9945 (Array (_ BitVec 32) (_ BitVec 8))) (size!8853 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13868 0))(
  ( (BitStream!13869 (buf!7995 array!20317) (currentByte!14754 (_ BitVec 32)) (currentBit!14749 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23500 0))(
  ( (tuple2!23501 (_1!13379 (_ BitVec 64)) (_2!13379 BitStream!13868)) )
))
(declare-fun lt!444518 () tuple2!23500)

(declare-fun e!231300 () Bool)

(declare-fun b!321255 () Bool)

(declare-fun nBits!542 () (_ BitVec 32))

(declare-fun thiss!1780 () BitStream!13868)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321255 (= e!231300 (not (= (bitIndex!0 (size!8853 (buf!7995 (_2!13379 lt!444518))) (currentByte!14754 (_2!13379 lt!444518)) (currentBit!14749 (_2!13379 lt!444518))) (bvadd (bitIndex!0 (size!8853 (buf!7995 thiss!1780)) (currentByte!14754 thiss!1780) (currentBit!14749 thiss!1780)) ((_ sign_extend 32) nBits!542)))))))

(declare-fun res!263845 () Bool)

(declare-fun e!231298 () Bool)

(assert (=> start!71198 (=> (not res!263845) (not e!231298))))

(assert (=> start!71198 (= res!263845 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000)))))

(assert (=> start!71198 e!231298))

(assert (=> start!71198 true))

(declare-fun e!231299 () Bool)

(declare-fun inv!12 (BitStream!13868) Bool)

(assert (=> start!71198 (and (inv!12 thiss!1780) e!231299)))

(declare-fun b!321256 () Bool)

(declare-fun array_inv!8405 (array!20317) Bool)

(assert (=> b!321256 (= e!231299 (array_inv!8405 (buf!7995 thiss!1780)))))

(declare-fun b!321253 () Bool)

(declare-fun res!263844 () Bool)

(assert (=> b!321253 (=> (not res!263844) (not e!231298))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321253 (= res!263844 (validate_offset_bits!1 ((_ sign_extend 32) (size!8853 (buf!7995 thiss!1780))) ((_ sign_extend 32) (currentByte!14754 thiss!1780)) ((_ sign_extend 32) (currentBit!14749 thiss!1780)) ((_ sign_extend 32) nBits!542)))))

(declare-fun b!321254 () Bool)

(assert (=> b!321254 (= e!231298 e!231300)))

(declare-fun res!263843 () Bool)

(assert (=> b!321254 (=> res!263843 e!231300)))

(assert (=> b!321254 (= res!263843 (not (= (buf!7995 (_2!13379 lt!444518)) (buf!7995 thiss!1780))))))

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!13868 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23500)

(assert (=> b!321254 (= lt!444518 (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!71198 res!263845) b!321253))

(assert (= (and b!321253 res!263844) b!321254))

(assert (= (and b!321254 (not res!263843)) b!321255))

(assert (= start!71198 b!321256))

(declare-fun m!459555 () Bool)

(assert (=> b!321254 m!459555))

(declare-fun m!459557 () Bool)

(assert (=> b!321253 m!459557))

(declare-fun m!459559 () Bool)

(assert (=> b!321255 m!459559))

(declare-fun m!459561 () Bool)

(assert (=> b!321255 m!459561))

(declare-fun m!459563 () Bool)

(assert (=> b!321256 m!459563))

(declare-fun m!459565 () Bool)

(assert (=> start!71198 m!459565))

(push 1)

(assert (not b!321255))

(assert (not start!71198))

(assert (not b!321254))

(assert (not b!321256))

(assert (not b!321253))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105224 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105224 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8853 (buf!7995 thiss!1780))) ((_ sign_extend 32) (currentByte!14754 thiss!1780)) ((_ sign_extend 32) (currentBit!14749 thiss!1780)) ((_ sign_extend 32) nBits!542)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8853 (buf!7995 thiss!1780))) ((_ sign_extend 32) (currentByte!14754 thiss!1780)) ((_ sign_extend 32) (currentBit!14749 thiss!1780))) ((_ sign_extend 32) nBits!542)))))

(declare-fun bs!27671 () Bool)

(assert (= bs!27671 d!105224))

(declare-fun m!459571 () Bool)

(assert (=> bs!27671 m!459571))

(assert (=> b!321253 d!105224))

(declare-fun b!321319 () Bool)

(declare-fun e!231330 () tuple2!23500)

(declare-fun lt!444590 () tuple2!23500)

(assert (=> b!321319 (= e!231330 (tuple2!23501 (_1!13379 lt!444590) (_2!13379 lt!444590)))))

(declare-datatypes ((tuple2!23510 0))(
  ( (tuple2!23511 (_1!13384 Bool) (_2!13384 BitStream!13868)) )
))
(declare-fun lt!444585 () tuple2!23510)

(declare-fun readBit!0 (BitStream!13868) tuple2!23510)

(assert (=> b!321319 (= lt!444585 (readBit!0 thiss!1780))))

(assert (=> b!321319 (= lt!444590 (readNBitsLSBFirstsLoop!0 (_2!13384 lt!444585) nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13384 lt!444585) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321321 () Bool)

(declare-fun res!263894 () Bool)

(declare-fun e!231329 () Bool)

(assert (=> b!321321 (=> (not res!263894) (not e!231329))))

(declare-fun lt!444586 () tuple2!23500)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321321 (= res!263894 (= (bvand (_1!13379 lt!444586) (onesLSBLong!0 #b00000000000000000000000000000000)) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun b!321322 () Bool)

(declare-fun res!263893 () Bool)

(assert (=> b!321322 (=> (not res!263893) (not e!231329))))

(assert (=> b!321322 (= res!263893 (= (bvand (_1!13379 lt!444586) (onesLSBLong!0 nBits!542)) (_1!13379 lt!444586)))))

(declare-fun b!321323 () Bool)

(declare-fun e!231328 () Bool)

(assert (=> b!321323 (= e!231329 e!231328)))

(declare-fun res!263892 () Bool)

(assert (=> b!321323 (=> res!263892 e!231328)))

(assert (=> b!321323 (= res!263892 (not (bvslt #b00000000000000000000000000000000 nBits!542)))))

(declare-fun lt!444587 () (_ BitVec 64))

(declare-fun b!321324 () Bool)

(declare-datatypes ((tuple2!23512 0))(
  ( (tuple2!23513 (_1!13385 BitStream!13868) (_2!13385 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13868) tuple2!23512)

(assert (=> b!321324 (= e!231328 (= (= (bvand (bvlshr (_1!13379 lt!444586) lt!444587) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13385 (readBitPure!0 thiss!1780))))))

(assert (=> b!321324 (and (bvsge lt!444587 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!444587 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!321324 (= lt!444587 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun b!321325 () Bool)

(declare-fun res!263895 () Bool)

(assert (=> b!321325 (=> (not res!263895) (not e!231329))))

(declare-fun lt!444588 () (_ BitVec 64))

(declare-fun lt!444589 () (_ BitVec 64))

(assert (=> b!321325 (= res!263895 (= (bitIndex!0 (size!8853 (buf!7995 (_2!13379 lt!444586))) (currentByte!14754 (_2!13379 lt!444586)) (currentBit!14749 (_2!13379 lt!444586))) (bvadd lt!444588 lt!444589)))))

(assert (=> b!321325 (or (not (= (bvand lt!444588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444589 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444588 lt!444589) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!321325 (= lt!444589 ((_ sign_extend 32) (bvsub nBits!542 #b00000000000000000000000000000000)))))

(assert (=> b!321325 (or (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand (bvsub nBits!542 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!321325 (= lt!444588 (bitIndex!0 (size!8853 (buf!7995 thiss!1780)) (currentByte!14754 thiss!1780) (currentBit!14749 thiss!1780)))))

(declare-fun d!105226 () Bool)

(assert (=> d!105226 e!231329))

(declare-fun res!263896 () Bool)

(assert (=> d!105226 (=> (not res!263896) (not e!231329))))

(assert (=> d!105226 (= res!263896 (= (buf!7995 (_2!13379 lt!444586)) (buf!7995 thiss!1780)))))

(assert (=> d!105226 (= lt!444586 e!231330)))

(declare-fun c!15412 () Bool)

(assert (=> d!105226 (= c!15412 (= nBits!542 #b00000000000000000000000000000000))))

(assert (=> d!105226 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!542) (bvsle nBits!542 #b00000000000000000000000001000000))))

(assert (=> d!105226 (= (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) lt!444586)))

(declare-fun b!321320 () Bool)

(assert (=> b!321320 (= e!231330 (tuple2!23501 #b0000000000000000000000000000000000000000000000000000000000000000 thiss!1780))))

(assert (= (and d!105226 c!15412) b!321320))

(assert (= (and d!105226 (not c!15412)) b!321319))

(assert (= (and d!105226 res!263896) b!321325))

(assert (= (and b!321325 res!263895) b!321321))

(assert (= (and b!321321 res!263894) b!321322))

(assert (= (and b!321322 res!263893) b!321323))

(assert (= (and b!321323 (not res!263892)) b!321324))

(declare-fun m!459605 () Bool)

(assert (=> b!321321 m!459605))

(declare-fun m!459607 () Bool)

(assert (=> b!321322 m!459607))

(declare-fun m!459609 () Bool)

(assert (=> b!321324 m!459609))

(declare-fun m!459611 () Bool)

(assert (=> b!321319 m!459611))

(declare-fun m!459613 () Bool)

(assert (=> b!321319 m!459613))

(declare-fun m!459615 () Bool)

(assert (=> b!321325 m!459615))

(assert (=> b!321325 m!459561))

(assert (=> b!321254 d!105226))

(declare-fun d!105242 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105242 (= (inv!12 thiss!1780) (invariant!0 (currentBit!14749 thiss!1780) (currentByte!14754 thiss!1780) (size!8853 (buf!7995 thiss!1780))))))

(declare-fun bs!27674 () Bool)

(assert (= bs!27674 d!105242))

(declare-fun m!459617 () Bool)

(assert (=> bs!27674 m!459617))

(assert (=> start!71198 d!105242))

(declare-fun d!105244 () Bool)

(assert (=> d!105244 (= (array_inv!8405 (buf!7995 thiss!1780)) (bvsge (size!8853 (buf!7995 thiss!1780)) #b00000000000000000000000000000000))))

(assert (=> b!321256 d!105244))

(declare-fun d!105246 () Bool)

(declare-fun e!231338 () Bool)

(assert (=> d!105246 e!231338))

(declare-fun res!263911 () Bool)

(assert (=> d!105246 (=> (not res!263911) (not e!231338))))

(declare-fun lt!444634 () (_ BitVec 64))

(declare-fun lt!444633 () (_ BitVec 64))

(declare-fun lt!444636 () (_ BitVec 64))

(assert (=> d!105246 (= res!263911 (= lt!444633 (bvsub lt!444636 lt!444634)))))

(assert (=> d!105246 (or (= (bvand lt!444636 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444634 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444636 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444636 lt!444634) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105246 (= lt!444634 (remainingBits!0 ((_ sign_extend 32) (size!8853 (buf!7995 (_2!13379 lt!444518)))) ((_ sign_extend 32) (currentByte!14754 (_2!13379 lt!444518))) ((_ sign_extend 32) (currentBit!14749 (_2!13379 lt!444518)))))))

(declare-fun lt!444635 () (_ BitVec 64))

(declare-fun lt!444638 () (_ BitVec 64))

(assert (=> d!105246 (= lt!444636 (bvmul lt!444635 lt!444638))))

(assert (=> d!105246 (or (= lt!444635 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!444638 (bvsdiv (bvmul lt!444635 lt!444638) lt!444635)))))

(assert (=> d!105246 (= lt!444638 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105246 (= lt!444635 ((_ sign_extend 32) (size!8853 (buf!7995 (_2!13379 lt!444518)))))))

(assert (=> d!105246 (= lt!444633 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14754 (_2!13379 lt!444518))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14749 (_2!13379 lt!444518)))))))

(assert (=> d!105246 (invariant!0 (currentBit!14749 (_2!13379 lt!444518)) (currentByte!14754 (_2!13379 lt!444518)) (size!8853 (buf!7995 (_2!13379 lt!444518))))))

(assert (=> d!105246 (= (bitIndex!0 (size!8853 (buf!7995 (_2!13379 lt!444518))) (currentByte!14754 (_2!13379 lt!444518)) (currentBit!14749 (_2!13379 lt!444518))) lt!444633)))

(declare-fun b!321340 () Bool)

(declare-fun res!263912 () Bool)

(assert (=> b!321340 (=> (not res!263912) (not e!231338))))

(assert (=> b!321340 (= res!263912 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444633))))

(declare-fun b!321341 () Bool)

(declare-fun lt!444637 () (_ BitVec 64))

(assert (=> b!321341 (= e!231338 (bvsle lt!444633 (bvmul lt!444637 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!321341 (or (= lt!444637 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!444637 #b0000000000000000000000000000000000000000000000000000000000001000) lt!444637)))))

(assert (=> b!321341 (= lt!444637 ((_ sign_extend 32) (size!8853 (buf!7995 (_2!13379 lt!444518)))))))

(assert (= (and d!105246 res!263911) b!321340))

(assert (= (and b!321340 res!263912) b!321341))

(declare-fun m!459623 () Bool)

(assert (=> d!105246 m!459623))

(declare-fun m!459625 () Bool)

(assert (=> d!105246 m!459625))

(assert (=> b!321255 d!105246))

(declare-fun d!105250 () Bool)

(declare-fun e!231339 () Bool)

(assert (=> d!105250 e!231339))

(declare-fun res!263913 () Bool)

(assert (=> d!105250 (=> (not res!263913) (not e!231339))))

(declare-fun lt!444642 () (_ BitVec 64))

(declare-fun lt!444639 () (_ BitVec 64))

(declare-fun lt!444640 () (_ BitVec 64))

(assert (=> d!105250 (= res!263913 (= lt!444639 (bvsub lt!444642 lt!444640)))))

(assert (=> d!105250 (or (= (bvand lt!444642 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444640 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444642 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444642 lt!444640) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105250 (= lt!444640 (remainingBits!0 ((_ sign_extend 32) (size!8853 (buf!7995 thiss!1780))) ((_ sign_extend 32) (currentByte!14754 thiss!1780)) ((_ sign_extend 32) (currentBit!14749 thiss!1780))))))

(declare-fun lt!444641 () (_ BitVec 64))

(declare-fun lt!444644 () (_ BitVec 64))

(assert (=> d!105250 (= lt!444642 (bvmul lt!444641 lt!444644))))

(assert (=> d!105250 (or (= lt!444641 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!444644 (bvsdiv (bvmul lt!444641 lt!444644) lt!444641)))))

(assert (=> d!105250 (= lt!444644 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105250 (= lt!444641 ((_ sign_extend 32) (size!8853 (buf!7995 thiss!1780))))))

(assert (=> d!105250 (= lt!444639 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14754 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14749 thiss!1780))))))

(assert (=> d!105250 (invariant!0 (currentBit!14749 thiss!1780) (currentByte!14754 thiss!1780) (size!8853 (buf!7995 thiss!1780)))))

(assert (=> d!105250 (= (bitIndex!0 (size!8853 (buf!7995 thiss!1780)) (currentByte!14754 thiss!1780) (currentBit!14749 thiss!1780)) lt!444639)))

(declare-fun b!321342 () Bool)

(declare-fun res!263914 () Bool)

(assert (=> b!321342 (=> (not res!263914) (not e!231339))))

(assert (=> b!321342 (= res!263914 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444639))))

(declare-fun b!321343 () Bool)

(declare-fun lt!444643 () (_ BitVec 64))

(assert (=> b!321343 (= e!231339 (bvsle lt!444639 (bvmul lt!444643 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!321343 (or (= lt!444643 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!444643 #b0000000000000000000000000000000000000000000000000000000000001000) lt!444643)))))

(assert (=> b!321343 (= lt!444643 ((_ sign_extend 32) (size!8853 (buf!7995 thiss!1780))))))

(assert (= (and d!105250 res!263913) b!321342))

