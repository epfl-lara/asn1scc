; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71194 () Bool)

(assert start!71194)

(declare-fun b!321229 () Bool)

(declare-fun res!263826 () Bool)

(declare-fun e!231273 () Bool)

(assert (=> b!321229 (=> (not res!263826) (not e!231273))))

(declare-datatypes ((array!20313 0))(
  ( (array!20314 (arr!9943 (Array (_ BitVec 32) (_ BitVec 8))) (size!8851 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13864 0))(
  ( (BitStream!13865 (buf!7993 array!20313) (currentByte!14752 (_ BitVec 32)) (currentBit!14747 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13864)

(declare-fun nBits!542 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321229 (= res!263826 (validate_offset_bits!1 ((_ sign_extend 32) (size!8851 (buf!7993 thiss!1780))) ((_ sign_extend 32) (currentByte!14752 thiss!1780)) ((_ sign_extend 32) (currentBit!14747 thiss!1780)) ((_ sign_extend 32) nBits!542)))))

(declare-fun res!263827 () Bool)

(assert (=> start!71194 (=> (not res!263827) (not e!231273))))

(assert (=> start!71194 (= res!263827 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000)))))

(assert (=> start!71194 e!231273))

(assert (=> start!71194 true))

(declare-fun e!231274 () Bool)

(declare-fun inv!12 (BitStream!13864) Bool)

(assert (=> start!71194 (and (inv!12 thiss!1780) e!231274)))

(declare-fun b!321230 () Bool)

(declare-fun e!231276 () Bool)

(assert (=> b!321230 (= e!231273 e!231276)))

(declare-fun res!263825 () Bool)

(assert (=> b!321230 (=> res!263825 e!231276)))

(declare-datatypes ((tuple2!23496 0))(
  ( (tuple2!23497 (_1!13377 (_ BitVec 64)) (_2!13377 BitStream!13864)) )
))
(declare-fun lt!444512 () tuple2!23496)

(assert (=> b!321230 (= res!263825 (not (= (buf!7993 (_2!13377 lt!444512)) (buf!7993 thiss!1780))))))

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!13864 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23496)

(assert (=> b!321230 (= lt!444512 (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!321232 () Bool)

(declare-fun array_inv!8403 (array!20313) Bool)

(assert (=> b!321232 (= e!231274 (array_inv!8403 (buf!7993 thiss!1780)))))

(declare-fun b!321231 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321231 (= e!231276 (not (= (bitIndex!0 (size!8851 (buf!7993 (_2!13377 lt!444512))) (currentByte!14752 (_2!13377 lt!444512)) (currentBit!14747 (_2!13377 lt!444512))) (bvadd (bitIndex!0 (size!8851 (buf!7993 thiss!1780)) (currentByte!14752 thiss!1780) (currentBit!14747 thiss!1780)) ((_ sign_extend 32) nBits!542)))))))

(assert (= (and start!71194 res!263827) b!321229))

(assert (= (and b!321229 res!263826) b!321230))

(assert (= (and b!321230 (not res!263825)) b!321231))

(assert (= start!71194 b!321232))

(declare-fun m!459531 () Bool)

(assert (=> b!321232 m!459531))

(declare-fun m!459533 () Bool)

(assert (=> b!321231 m!459533))

(declare-fun m!459535 () Bool)

(assert (=> b!321231 m!459535))

(declare-fun m!459537 () Bool)

(assert (=> b!321230 m!459537))

(declare-fun m!459539 () Bool)

(assert (=> b!321229 m!459539))

(declare-fun m!459541 () Bool)

(assert (=> start!71194 m!459541))

(push 1)

(assert (not b!321231))

(assert (not start!71194))

(assert (not b!321229))

(assert (not b!321232))

(assert (not b!321230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105220 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105220 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8851 (buf!7993 thiss!1780))) ((_ sign_extend 32) (currentByte!14752 thiss!1780)) ((_ sign_extend 32) (currentBit!14747 thiss!1780)) ((_ sign_extend 32) nBits!542)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8851 (buf!7993 thiss!1780))) ((_ sign_extend 32) (currentByte!14752 thiss!1780)) ((_ sign_extend 32) (currentBit!14747 thiss!1780))) ((_ sign_extend 32) nBits!542)))))

(declare-fun bs!27670 () Bool)

(assert (= bs!27670 d!105220))

(declare-fun m!459569 () Bool)

(assert (=> bs!27670 m!459569))

(assert (=> b!321229 d!105220))

(declare-fun b!321292 () Bool)

(declare-fun e!231317 () Bool)

(declare-fun e!231316 () Bool)

(assert (=> b!321292 (= e!231317 e!231316)))

(declare-fun res!263872 () Bool)

(assert (=> b!321292 (=> res!263872 e!231316)))

(assert (=> b!321292 (= res!263872 (not (bvslt #b00000000000000000000000000000000 nBits!542)))))

(declare-fun b!321293 () Bool)

(declare-fun e!231318 () tuple2!23496)

(declare-fun lt!444551 () tuple2!23496)

(assert (=> b!321293 (= e!231318 (tuple2!23497 (_1!13377 lt!444551) (_2!13377 lt!444551)))))

(declare-datatypes ((tuple2!23506 0))(
  ( (tuple2!23507 (_1!13382 Bool) (_2!13382 BitStream!13864)) )
))
(declare-fun lt!444554 () tuple2!23506)

(declare-fun readBit!0 (BitStream!13864) tuple2!23506)

(assert (=> b!321293 (= lt!444554 (readBit!0 thiss!1780))))

(assert (=> b!321293 (= lt!444551 (readNBitsLSBFirstsLoop!0 (_2!13382 lt!444554) nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13382 lt!444554) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321294 () Bool)

(assert (=> b!321294 (= e!231318 (tuple2!23497 #b0000000000000000000000000000000000000000000000000000000000000000 thiss!1780))))

(declare-fun d!105222 () Bool)

(assert (=> d!105222 e!231317))

(declare-fun res!263874 () Bool)

(assert (=> d!105222 (=> (not res!263874) (not e!231317))))

(declare-fun lt!444549 () tuple2!23496)

(assert (=> d!105222 (= res!263874 (= (buf!7993 (_2!13377 lt!444549)) (buf!7993 thiss!1780)))))

(assert (=> d!105222 (= lt!444549 e!231318)))

(declare-fun c!15409 () Bool)

(assert (=> d!105222 (= c!15409 (= nBits!542 #b00000000000000000000000000000000))))

(assert (=> d!105222 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!542) (bvsle nBits!542 #b00000000000000000000000001000000))))

(assert (=> d!105222 (= (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) lt!444549)))

(declare-fun b!321295 () Bool)

(declare-fun res!263873 () Bool)

(assert (=> b!321295 (=> (not res!263873) (not e!231317))))

(declare-fun lt!444553 () (_ BitVec 64))

(declare-fun lt!444550 () (_ BitVec 64))

(assert (=> b!321295 (= res!263873 (= (bitIndex!0 (size!8851 (buf!7993 (_2!13377 lt!444549))) (currentByte!14752 (_2!13377 lt!444549)) (currentBit!14747 (_2!13377 lt!444549))) (bvadd lt!444550 lt!444553)))))

(assert (=> b!321295 (or (not (= (bvand lt!444550 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444553 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444550 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444550 lt!444553) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!321295 (= lt!444553 ((_ sign_extend 32) (bvsub nBits!542 #b00000000000000000000000000000000)))))

(assert (=> b!321295 (or (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand (bvsub nBits!542 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!321295 (= lt!444550 (bitIndex!0 (size!8851 (buf!7993 thiss!1780)) (currentByte!14752 thiss!1780) (currentBit!14747 thiss!1780)))))

(declare-fun b!321296 () Bool)

(declare-fun lt!444552 () (_ BitVec 64))

(declare-datatypes ((tuple2!23508 0))(
  ( (tuple2!23509 (_1!13383 BitStream!13864) (_2!13383 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13864) tuple2!23508)

(assert (=> b!321296 (= e!231316 (= (= (bvand (bvlshr (_1!13377 lt!444549) lt!444552) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13383 (readBitPure!0 thiss!1780))))))

(assert (=> b!321296 (and (bvsge lt!444552 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!444552 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!321296 (= lt!444552 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun b!321297 () Bool)

(declare-fun res!263871 () Bool)

(assert (=> b!321297 (=> (not res!263871) (not e!231317))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321297 (= res!263871 (= (bvand (_1!13377 lt!444549) (onesLSBLong!0 nBits!542)) (_1!13377 lt!444549)))))

(declare-fun b!321298 () Bool)

(declare-fun res!263875 () Bool)

(assert (=> b!321298 (=> (not res!263875) (not e!231317))))

(assert (=> b!321298 (= res!263875 (= (bvand (_1!13377 lt!444549) (onesLSBLong!0 #b00000000000000000000000000000000)) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(assert (= (and d!105222 c!15409) b!321294))

(assert (= (and d!105222 (not c!15409)) b!321293))

(assert (= (and d!105222 res!263874) b!321295))

(assert (= (and b!321295 res!263873) b!321298))

(assert (= (and b!321298 res!263875) b!321297))

(assert (= (and b!321297 res!263871) b!321292))

(assert (= (and b!321292 (not res!263872)) b!321296))

(declare-fun m!459587 () Bool)

(assert (=> b!321295 m!459587))

(assert (=> b!321295 m!459535))

(declare-fun m!459589 () Bool)

(assert (=> b!321293 m!459589))

(declare-fun m!459591 () Bool)

(assert (=> b!321293 m!459591))

(declare-fun m!459593 () Bool)

(assert (=> b!321298 m!459593))

(declare-fun m!459595 () Bool)

(assert (=> b!321297 m!459595))

(declare-fun m!459597 () Bool)

(assert (=> b!321296 m!459597))

(assert (=> b!321230 d!105222))

(declare-fun d!105234 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105234 (= (inv!12 thiss!1780) (invariant!0 (currentBit!14747 thiss!1780) (currentByte!14752 thiss!1780) (size!8851 (buf!7993 thiss!1780))))))

(declare-fun bs!27673 () Bool)

(assert (= bs!27673 d!105234))

(declare-fun m!459599 () Bool)

(assert (=> bs!27673 m!459599))

(assert (=> start!71194 d!105234))

(declare-fun d!105236 () Bool)

(assert (=> d!105236 (= (array_inv!8403 (buf!7993 thiss!1780)) (bvsge (size!8851 (buf!7993 thiss!1780)) #b00000000000000000000000000000000))))

(assert (=> b!321232 d!105236))

(declare-fun d!105238 () Bool)

(declare-fun e!231334 () Bool)

(assert (=> d!105238 e!231334))

(declare-fun res!263903 () Bool)

(assert (=> d!105238 (=> (not res!263903) (not e!231334))))

(declare-fun lt!444610 () (_ BitVec 64))

(declare-fun lt!444611 () (_ BitVec 64))

(declare-fun lt!444612 () (_ BitVec 64))

(assert (=> d!105238 (= res!263903 (= lt!444612 (bvsub lt!444611 lt!444610)))))

(assert (=> d!105238 (or (= (bvand lt!444611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444610 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444611 lt!444610) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105238 (= lt!444610 (remainingBits!0 ((_ sign_extend 32) (size!8851 (buf!7993 (_2!13377 lt!444512)))) ((_ sign_extend 32) (currentByte!14752 (_2!13377 lt!444512))) ((_ sign_extend 32) (currentBit!14747 (_2!13377 lt!444512)))))))

(declare-fun lt!444609 () (_ BitVec 64))

(declare-fun lt!444614 () (_ BitVec 64))

(assert (=> d!105238 (= lt!444611 (bvmul lt!444609 lt!444614))))

(assert (=> d!105238 (or (= lt!444609 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!444614 (bvsdiv (bvmul lt!444609 lt!444614) lt!444609)))))

(assert (=> d!105238 (= lt!444614 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105238 (= lt!444609 ((_ sign_extend 32) (size!8851 (buf!7993 (_2!13377 lt!444512)))))))

(assert (=> d!105238 (= lt!444612 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14752 (_2!13377 lt!444512))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14747 (_2!13377 lt!444512)))))))

(assert (=> d!105238 (invariant!0 (currentBit!14747 (_2!13377 lt!444512)) (currentByte!14752 (_2!13377 lt!444512)) (size!8851 (buf!7993 (_2!13377 lt!444512))))))

(assert (=> d!105238 (= (bitIndex!0 (size!8851 (buf!7993 (_2!13377 lt!444512))) (currentByte!14752 (_2!13377 lt!444512)) (currentBit!14747 (_2!13377 lt!444512))) lt!444612)))

(declare-fun b!321332 () Bool)

(declare-fun res!263904 () Bool)

(assert (=> b!321332 (=> (not res!263904) (not e!231334))))

(assert (=> b!321332 (= res!263904 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444612))))

(declare-fun b!321333 () Bool)

(declare-fun lt!444613 () (_ BitVec 64))

(assert (=> b!321333 (= e!231334 (bvsle lt!444612 (bvmul lt!444613 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!321333 (or (= lt!444613 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!444613 #b0000000000000000000000000000000000000000000000000000000000001000) lt!444613)))))

(assert (=> b!321333 (= lt!444613 ((_ sign_extend 32) (size!8851 (buf!7993 (_2!13377 lt!444512)))))))

(assert (= (and d!105238 res!263903) b!321332))

(assert (= (and b!321332 res!263904) b!321333))

(declare-fun m!459619 () Bool)

(assert (=> d!105238 m!459619))

(declare-fun m!459621 () Bool)

(assert (=> d!105238 m!459621))

(assert (=> b!321231 d!105238))

(declare-fun d!105248 () Bool)

(declare-fun e!231335 () Bool)

(assert (=> d!105248 e!231335))

(declare-fun res!263905 () Bool)

(assert (=> d!105248 (=> (not res!263905) (not e!231335))))

(declare-fun lt!444617 () (_ BitVec 64))

(declare-fun lt!444618 () (_ BitVec 64))

(declare-fun lt!444616 () (_ BitVec 64))

(assert (=> d!105248 (= res!263905 (= lt!444618 (bvsub lt!444617 lt!444616)))))

(assert (=> d!105248 (or (= (bvand lt!444617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444616 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444617 lt!444616) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105248 (= lt!444616 (remainingBits!0 ((_ sign_extend 32) (size!8851 (buf!7993 thiss!1780))) ((_ sign_extend 32) (currentByte!14752 thiss!1780)) ((_ sign_extend 32) (currentBit!14747 thiss!1780))))))

(declare-fun lt!444615 () (_ BitVec 64))

(declare-fun lt!444620 () (_ BitVec 64))

(assert (=> d!105248 (= lt!444617 (bvmul lt!444615 lt!444620))))

(assert (=> d!105248 (or (= lt!444615 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!444620 (bvsdiv (bvmul lt!444615 lt!444620) lt!444615)))))

(assert (=> d!105248 (= lt!444620 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105248 (= lt!444615 ((_ sign_extend 32) (size!8851 (buf!7993 thiss!1780))))))

(assert (=> d!105248 (= lt!444618 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14752 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14747 thiss!1780))))))

(assert (=> d!105248 (invariant!0 (currentBit!14747 thiss!1780) (currentByte!14752 thiss!1780) (size!8851 (buf!7993 thiss!1780)))))

(assert (=> d!105248 (= (bitIndex!0 (size!8851 (buf!7993 thiss!1780)) (currentByte!14752 thiss!1780) (currentBit!14747 thiss!1780)) lt!444618)))

(declare-fun b!321334 () Bool)

(declare-fun res!263906 () Bool)

(assert (=> b!321334 (=> (not res!263906) (not e!231335))))

(assert (=> b!321334 (= res!263906 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444618))))

(declare-fun b!321335 () Bool)

(declare-fun lt!444619 () (_ BitVec 64))

(assert (=> b!321335 (= e!231335 (bvsle lt!444618 (bvmul lt!444619 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!321335 (or (= lt!444619 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!444619 #b0000000000000000000000000000000000000000000000000000000000001000) lt!444619)))))

(assert (=> b!321335 (= lt!444619 ((_ sign_extend 32) (size!8851 (buf!7993 thiss!1780))))))

(assert (= (and d!105248 res!263905) b!321334))

(assert (= (and b!321334 res!263906) b!321335))

(assert (=> d!105248 m!459569))

(assert (=> d!105248 m!459599))

(assert (=> b!321231 d!105248))

(push 1)

(assert (not b!321296))

(assert (not d!105238))

(assert (not b!321298))

(assert (not b!321293))

(assert (not d!105234))

(assert (not d!105248))

(assert (not d!105220))

(assert (not b!321295))

(assert (not b!321297))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

