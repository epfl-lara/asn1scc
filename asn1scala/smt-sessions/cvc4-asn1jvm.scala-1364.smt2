; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37774 () Bool)

(assert start!37774)

(declare-fun e!119433 () Bool)

(declare-datatypes ((array!9095 0))(
  ( (array!9096 (arr!4956 (Array (_ BitVec 32) (_ BitVec 8))) (size!4026 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7190 0))(
  ( (BitStream!7191 (buf!4469 array!9095) (currentByte!8474 (_ BitVec 32)) (currentBit!8469 (_ BitVec 32))) )
))
(declare-fun lt!263704 () BitStream!7190)

(declare-fun b!171080 () Bool)

(declare-fun from!235 () (_ BitVec 64))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!171080 (= e!119433 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4026 (buf!4469 lt!263704))) ((_ sign_extend 32) (currentByte!8474 lt!263704)) ((_ sign_extend 32) (currentBit!8469 lt!263704)) (bvsub nBits!283 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)))))))

(declare-fun b!171081 () Bool)

(declare-fun e!119432 () Bool)

(declare-fun bs!64 () BitStream!7190)

(declare-fun array_inv!3767 (array!9095) Bool)

(assert (=> b!171081 (= e!119432 (array_inv!3767 (buf!4469 bs!64)))))

(declare-fun b!171078 () Bool)

(declare-fun res!141918 () Bool)

(declare-fun e!119431 () Bool)

(assert (=> b!171078 (=> (not res!141918) (not e!119431))))

(assert (=> b!171078 (= res!141918 (validate_offset_bits!1 ((_ sign_extend 32) (size!4026 (buf!4469 bs!64))) ((_ sign_extend 32) (currentByte!8474 bs!64)) ((_ sign_extend 32) (currentBit!8469 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun res!141917 () Bool)

(assert (=> start!37774 (=> (not res!141917) (not e!119431))))

(assert (=> start!37774 (= res!141917 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37774 e!119431))

(assert (=> start!37774 true))

(declare-fun inv!12 (BitStream!7190) Bool)

(assert (=> start!37774 (and (inv!12 bs!64) e!119432)))

(declare-fun b!171079 () Bool)

(assert (=> b!171079 (= e!119431 e!119433)))

(declare-fun res!141916 () Bool)

(assert (=> b!171079 (=> (not res!141916) (not e!119433))))

(assert (=> b!171079 (= res!141916 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235))))))

(declare-fun withMovedBitIndex!0 (BitStream!7190 (_ BitVec 64)) BitStream!7190)

(assert (=> b!171079 (= lt!263704 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!14706 0))(
  ( (tuple2!14707 (_1!7986 BitStream!7190) (_2!7986 Bool)) )
))
(declare-fun lt!263705 () tuple2!14706)

(declare-fun readBitPure!0 (BitStream!7190) tuple2!14706)

(assert (=> b!171079 (= lt!263705 (readBitPure!0 bs!64))))

(declare-fun lt!263703 () tuple2!14706)

(declare-fun expected!82 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!7190 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14706)

(assert (=> b!171079 (= lt!263703 (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235))))

(assert (= (and start!37774 res!141917) b!171078))

(assert (= (and b!171078 res!141918) b!171079))

(assert (= (and b!171079 res!141916) b!171080))

(assert (= start!37774 b!171081))

(declare-fun m!270227 () Bool)

(assert (=> start!37774 m!270227))

(declare-fun m!270229 () Bool)

(assert (=> b!171079 m!270229))

(declare-fun m!270231 () Bool)

(assert (=> b!171079 m!270231))

(declare-fun m!270233 () Bool)

(assert (=> b!171079 m!270233))

(declare-fun m!270235 () Bool)

(assert (=> b!171080 m!270235))

(declare-fun m!270237 () Bool)

(assert (=> b!171078 m!270237))

(declare-fun m!270239 () Bool)

(assert (=> b!171081 m!270239))

(push 1)

(assert (not b!171080))

(assert (not start!37774))

(assert (not b!171079))

(assert (not b!171081))

(assert (not b!171078))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60443 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!60443 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4026 (buf!4469 lt!263704))) ((_ sign_extend 32) (currentByte!8474 lt!263704)) ((_ sign_extend 32) (currentBit!8469 lt!263704)) (bvsub nBits!283 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4026 (buf!4469 lt!263704))) ((_ sign_extend 32) (currentByte!8474 lt!263704)) ((_ sign_extend 32) (currentBit!8469 lt!263704))) (bvsub nBits!283 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235))))))

(declare-fun bs!15049 () Bool)

(assert (= bs!15049 d!60443))

(declare-fun m!270247 () Bool)

(assert (=> bs!15049 m!270247))

(assert (=> b!171080 d!60443))

(declare-fun d!60445 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!60445 (= (inv!12 bs!64) (invariant!0 (currentBit!8469 bs!64) (currentByte!8474 bs!64) (size!4026 (buf!4469 bs!64))))))

(declare-fun bs!15050 () Bool)

(assert (= bs!15050 d!60445))

(declare-fun m!270249 () Bool)

(assert (=> bs!15050 m!270249))

(assert (=> start!37774 d!60445))

(declare-fun d!60447 () Bool)

(assert (=> d!60447 (= (array_inv!3767 (buf!4469 bs!64)) (bvsge (size!4026 (buf!4469 bs!64)) #b00000000000000000000000000000000))))

(assert (=> b!171081 d!60447))

(declare-fun d!60449 () Bool)

(assert (=> d!60449 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4026 (buf!4469 bs!64))) ((_ sign_extend 32) (currentByte!8474 bs!64)) ((_ sign_extend 32) (currentBit!8469 bs!64)) (bvsub nBits!283 from!235)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4026 (buf!4469 bs!64))) ((_ sign_extend 32) (currentByte!8474 bs!64)) ((_ sign_extend 32) (currentBit!8469 bs!64))) (bvsub nBits!283 from!235)))))

(declare-fun bs!15051 () Bool)

(assert (= bs!15051 d!60449))

(declare-fun m!270251 () Bool)

(assert (=> bs!15051 m!270251))

(assert (=> b!171078 d!60449))

(declare-fun d!60451 () Bool)

(declare-fun e!119440 () Bool)

(assert (=> d!60451 e!119440))

(declare-fun res!141924 () Bool)

(assert (=> d!60451 (=> (not res!141924) (not e!119440))))

(declare-fun lt!263723 () (_ BitVec 64))

(declare-fun lt!263722 () BitStream!7190)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!60451 (= res!141924 (= (bvadd lt!263723 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4026 (buf!4469 lt!263722)) (currentByte!8474 lt!263722) (currentBit!8469 lt!263722))))))

(assert (=> d!60451 (or (not (= (bvand lt!263723 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263723 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263723 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60451 (= lt!263723 (bitIndex!0 (size!4026 (buf!4469 bs!64)) (currentByte!8474 bs!64) (currentBit!8469 bs!64)))))

(declare-datatypes ((Unit!12223 0))(
  ( (Unit!12224) )
))
(declare-datatypes ((tuple2!14714 0))(
  ( (tuple2!14715 (_1!7990 Unit!12223) (_2!7990 BitStream!7190)) )
))
(declare-fun moveBitIndex!0 (BitStream!7190 (_ BitVec 64)) tuple2!14714)

(assert (=> d!60451 (= lt!263722 (_2!7990 (moveBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7190 (_ BitVec 64)) Bool)

(assert (=> d!60451 (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!60451 (= (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) lt!263722)))

(declare-fun b!171087 () Bool)

(assert (=> b!171087 (= e!119440 (= (size!4026 (buf!4469 bs!64)) (size!4026 (buf!4469 lt!263722))))))

(assert (= (and d!60451 res!141924) b!171087))

(declare-fun m!270267 () Bool)

(assert (=> d!60451 m!270267))

(declare-fun m!270269 () Bool)

(assert (=> d!60451 m!270269))

(declare-fun m!270271 () Bool)

(assert (=> d!60451 m!270271))

(declare-fun m!270273 () Bool)

(assert (=> d!60451 m!270273))

(assert (=> b!171079 d!60451))

(declare-fun d!60461 () Bool)

(declare-datatypes ((tuple2!14718 0))(
  ( (tuple2!14719 (_1!7992 Bool) (_2!7992 BitStream!7190)) )
))
(declare-fun lt!263732 () tuple2!14718)

(declare-fun readBit!0 (BitStream!7190) tuple2!14718)

(assert (=> d!60461 (= lt!263732 (readBit!0 bs!64))))

(assert (=> d!60461 (= (readBitPure!0 bs!64) (tuple2!14707 (_2!7992 lt!263732) (_1!7992 lt!263732)))))

(declare-fun bs!15055 () Bool)

(assert (= bs!15055 d!60461))

(declare-fun m!270283 () Bool)

(assert (=> bs!15055 m!270283))

(assert (=> b!171079 d!60461))

(declare-fun d!60465 () Bool)

(declare-fun lt!263738 () tuple2!14718)

(declare-fun checkBitsLoop!0 (BitStream!7190 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14718)

(assert (=> d!60465 (= lt!263738 (checkBitsLoop!0 bs!64 nBits!283 expected!82 from!235))))

(assert (=> d!60465 (= (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235) (tuple2!14707 (_2!7992 lt!263738) (_1!7992 lt!263738)))))

(declare-fun bs!15057 () Bool)

(assert (= bs!15057 d!60465))

(declare-fun m!270287 () Bool)

(assert (=> bs!15057 m!270287))

(assert (=> b!171079 d!60465))

(push 1)

(assert (not d!60461))

(assert (not d!60451))

(assert (not d!60445))

(assert (not d!60449))

(assert (not d!60443))

(assert (not d!60465))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60495 () Bool)

(assert (=> d!60495 (= (remainingBits!0 ((_ sign_extend 32) (size!4026 (buf!4469 bs!64))) ((_ sign_extend 32) (currentByte!8474 bs!64)) ((_ sign_extend 32) (currentBit!8469 bs!64))) (bvsub (bvmul ((_ sign_extend 32) (size!4026 (buf!4469 bs!64))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8474 bs!64)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8469 bs!64)))))))

(assert (=> d!60449 d!60495))

(declare-fun d!60497 () Bool)

(declare-fun e!119481 () Bool)

(assert (=> d!60497 e!119481))

(declare-fun res!141967 () Bool)

(assert (=> d!60497 (=> (not res!141967) (not e!119481))))

(declare-fun lt!263854 () (_ BitVec 64))

(declare-fun lt!263853 () (_ BitVec 64))

(declare-fun lt!263857 () (_ BitVec 64))

(assert (=> d!60497 (= res!141967 (= lt!263857 (bvsub lt!263854 lt!263853)))))

(assert (=> d!60497 (or (= (bvand lt!263854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!263853 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!263854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!263854 lt!263853) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60497 (= lt!263853 (remainingBits!0 ((_ sign_extend 32) (size!4026 (buf!4469 lt!263722))) ((_ sign_extend 32) (currentByte!8474 lt!263722)) ((_ sign_extend 32) (currentBit!8469 lt!263722))))))

(declare-fun lt!263858 () (_ BitVec 64))

(declare-fun lt!263856 () (_ BitVec 64))

(assert (=> d!60497 (= lt!263854 (bvmul lt!263858 lt!263856))))

(assert (=> d!60497 (or (= lt!263858 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!263856 (bvsdiv (bvmul lt!263858 lt!263856) lt!263858)))))

(assert (=> d!60497 (= lt!263856 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60497 (= lt!263858 ((_ sign_extend 32) (size!4026 (buf!4469 lt!263722))))))

(assert (=> d!60497 (= lt!263857 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8474 lt!263722)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8469 lt!263722))))))

(assert (=> d!60497 (invariant!0 (currentBit!8469 lt!263722) (currentByte!8474 lt!263722) (size!4026 (buf!4469 lt!263722)))))

(assert (=> d!60497 (= (bitIndex!0 (size!4026 (buf!4469 lt!263722)) (currentByte!8474 lt!263722) (currentBit!8469 lt!263722)) lt!263857)))

(declare-fun b!171143 () Bool)

(declare-fun res!141968 () Bool)

(assert (=> b!171143 (=> (not res!141968) (not e!119481))))

(assert (=> b!171143 (= res!141968 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!263857))))

(declare-fun b!171144 () Bool)

(declare-fun lt!263855 () (_ BitVec 64))

(assert (=> b!171144 (= e!119481 (bvsle lt!263857 (bvmul lt!263855 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171144 (or (= lt!263855 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!263855 #b0000000000000000000000000000000000000000000000000000000000001000) lt!263855)))))

(assert (=> b!171144 (= lt!263855 ((_ sign_extend 32) (size!4026 (buf!4469 lt!263722))))))

(assert (= (and d!60497 res!141967) b!171143))

(assert (= (and b!171143 res!141968) b!171144))

(declare-fun m!270319 () Bool)

(assert (=> d!60497 m!270319))

(declare-fun m!270321 () Bool)

(assert (=> d!60497 m!270321))

(assert (=> d!60451 d!60497))

(declare-fun d!60499 () Bool)

(declare-fun e!119482 () Bool)

(assert (=> d!60499 e!119482))

(declare-fun res!141969 () Bool)

(assert (=> d!60499 (=> (not res!141969) (not e!119482))))

(declare-fun lt!263860 () (_ BitVec 64))

(declare-fun lt!263859 () (_ BitVec 64))

(declare-fun lt!263863 () (_ BitVec 64))

(assert (=> d!60499 (= res!141969 (= lt!263863 (bvsub lt!263860 lt!263859)))))

(assert (=> d!60499 (or (= (bvand lt!263860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!263859 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!263860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!263860 lt!263859) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60499 (= lt!263859 (remainingBits!0 ((_ sign_extend 32) (size!4026 (buf!4469 bs!64))) ((_ sign_extend 32) (currentByte!8474 bs!64)) ((_ sign_extend 32) (currentBit!8469 bs!64))))))

(declare-fun lt!263864 () (_ BitVec 64))

(declare-fun lt!263862 () (_ BitVec 64))

(assert (=> d!60499 (= lt!263860 (bvmul lt!263864 lt!263862))))

(assert (=> d!60499 (or (= lt!263864 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!263862 (bvsdiv (bvmul lt!263864 lt!263862) lt!263864)))))

(assert (=> d!60499 (= lt!263862 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60499 (= lt!263864 ((_ sign_extend 32) (size!4026 (buf!4469 bs!64))))))

(assert (=> d!60499 (= lt!263863 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8474 bs!64)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8469 bs!64))))))

(assert (=> d!60499 (invariant!0 (currentBit!8469 bs!64) (currentByte!8474 bs!64) (size!4026 (buf!4469 bs!64)))))

(assert (=> d!60499 (= (bitIndex!0 (size!4026 (buf!4469 bs!64)) (currentByte!8474 bs!64) (currentBit!8469 bs!64)) lt!263863)))

(declare-fun b!171145 () Bool)

(declare-fun res!141970 () Bool)

(assert (=> b!171145 (=> (not res!141970) (not e!119482))))

(assert (=> b!171145 (= res!141970 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!263863))))

(declare-fun b!171146 () Bool)

(declare-fun lt!263861 () (_ BitVec 64))

(assert (=> b!171146 (= e!119482 (bvsle lt!263863 (bvmul lt!263861 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171146 (or (= lt!263861 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!263861 #b0000000000000000000000000000000000000000000000000000000000001000) lt!263861)))))

(assert (=> b!171146 (= lt!263861 ((_ sign_extend 32) (size!4026 (buf!4469 bs!64))))))

(assert (= (and d!60499 res!141969) b!171145))

(assert (= (and b!171145 res!141970) b!171146))

(assert (=> d!60499 m!270251))

(assert (=> d!60499 m!270249))

(assert (=> d!60451 d!60499))

(declare-fun d!60501 () Bool)

(declare-fun lt!263877 () (_ BitVec 32))

(assert (=> d!60501 (= lt!263877 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!263880 () (_ BitVec 32))

(assert (=> d!60501 (= lt!263880 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!119488 () Bool)

(assert (=> d!60501 e!119488))

(declare-fun res!141975 () Bool)

(assert (=> d!60501 (=> (not res!141975) (not e!119488))))

(assert (=> d!60501 (= res!141975 (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!12231 () Unit!12223)

(declare-fun Unit!12232 () Unit!12223)

(declare-fun Unit!12233 () Unit!12223)

(assert (=> d!60501 (= (moveBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!8469 bs!64) lt!263877) #b00000000000000000000000000000000) (tuple2!14715 Unit!12231 (BitStream!7191 (buf!4469 bs!64) (bvsub (bvadd (currentByte!8474 bs!64) lt!263880) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!263877 (currentBit!8469 bs!64)))) (ite (bvsge (bvadd (currentBit!8469 bs!64) lt!263877) #b00000000000000000000000000001000) (tuple2!14715 Unit!12232 (BitStream!7191 (buf!4469 bs!64) (bvadd (currentByte!8474 bs!64) lt!263880 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8469 bs!64) lt!263877) #b00000000000000000000000000001000))) (tuple2!14715 Unit!12233 (BitStream!7191 (buf!4469 bs!64) (bvadd (currentByte!8474 bs!64) lt!263880) (bvadd (currentBit!8469 bs!64) lt!263877))))))))

(declare-fun b!171151 () Bool)

(declare-fun e!119487 () Bool)

(assert (=> b!171151 (= e!119488 e!119487)))

(declare-fun res!141976 () Bool)

(assert (=> b!171151 (=> (not res!141976) (not e!119487))))

(declare-fun lt!263881 () (_ BitVec 64))

(declare-fun lt!263878 () tuple2!14714)

(assert (=> b!171151 (= res!141976 (= (bvadd lt!263881 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4026 (buf!4469 (_2!7990 lt!263878))) (currentByte!8474 (_2!7990 lt!263878)) (currentBit!8469 (_2!7990 lt!263878)))))))

(assert (=> b!171151 (or (not (= (bvand lt!263881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263881 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171151 (= lt!263881 (bitIndex!0 (size!4026 (buf!4469 bs!64)) (currentByte!8474 bs!64) (currentBit!8469 bs!64)))))

(declare-fun lt!263882 () (_ BitVec 32))

(declare-fun lt!263879 () (_ BitVec 32))

(declare-fun Unit!12234 () Unit!12223)

(declare-fun Unit!12235 () Unit!12223)

(declare-fun Unit!12236 () Unit!12223)

(assert (=> b!171151 (= lt!263878 (ite (bvslt (bvadd (currentBit!8469 bs!64) lt!263882) #b00000000000000000000000000000000) (tuple2!14715 Unit!12234 (BitStream!7191 (buf!4469 bs!64) (bvsub (bvadd (currentByte!8474 bs!64) lt!263879) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!263882 (currentBit!8469 bs!64)))) (ite (bvsge (bvadd (currentBit!8469 bs!64) lt!263882) #b00000000000000000000000000001000) (tuple2!14715 Unit!12235 (BitStream!7191 (buf!4469 bs!64) (bvadd (currentByte!8474 bs!64) lt!263879 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8469 bs!64) lt!263882) #b00000000000000000000000000001000))) (tuple2!14715 Unit!12236 (BitStream!7191 (buf!4469 bs!64) (bvadd (currentByte!8474 bs!64) lt!263879) (bvadd (currentBit!8469 bs!64) lt!263882))))))))

(assert (=> b!171151 (= lt!263882 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171151 (= lt!263879 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!171152 () Bool)

(assert (=> b!171152 (= e!119487 (and (= (size!4026 (buf!4469 bs!64)) (size!4026 (buf!4469 (_2!7990 lt!263878)))) (= (buf!4469 bs!64) (buf!4469 (_2!7990 lt!263878)))))))

(assert (= (and d!60501 res!141975) b!171151))

(assert (= (and b!171151 res!141976) b!171152))

(assert (=> d!60501 m!270273))

(declare-fun m!270323 () Bool)

(assert (=> b!171151 m!270323))

(assert (=> b!171151 m!270269))

(assert (=> d!60451 d!60501))

(declare-fun d!60505 () Bool)

(declare-fun res!141979 () Bool)

(declare-fun e!119491 () Bool)

(assert (=> d!60505 (=> (not res!141979) (not e!119491))))

(assert (=> d!60505 (= res!141979 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4026 (buf!4469 bs!64)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4026 (buf!4469 bs!64)))))))))

(assert (=> d!60505 (= (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) e!119491)))

(declare-fun b!171156 () Bool)

(declare-fun lt!263885 () (_ BitVec 64))

(assert (=> b!171156 (= e!119491 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!263885) (bvsle lt!263885 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4026 (buf!4469 bs!64)))))))))

(assert (=> b!171156 (= lt!263885 (bvadd (bitIndex!0 (size!4026 (buf!4469 bs!64)) (currentByte!8474 bs!64) (currentBit!8469 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!60505 res!141979) b!171156))

(assert (=> b!171156 m!270269))

(assert (=> d!60451 d!60505))

(declare-fun b!171175 () Bool)

(declare-fun res!141990 () Bool)

(declare-fun e!119502 () Bool)

(assert (=> b!171175 (=> (not res!141990) (not e!119502))))

(declare-fun lt!263910 () tuple2!14718)

(assert (=> b!171175 (= res!141990 (and (= (buf!4469 bs!64) (buf!4469 (_2!7992 lt!263910))) (or (not (= nBits!283 from!235)) (_1!7992 lt!263910))))))

(declare-fun b!171176 () Bool)

(declare-fun e!119506 () Bool)

(assert (=> b!171176 (= e!119502 e!119506)))

(declare-fun res!141992 () Bool)

(assert (=> b!171176 (=> res!141992 e!119506)))

(assert (=> b!171176 (= res!141992 (or (not (_1!7992 lt!263910)) (bvsge from!235 nBits!283)))))

(declare-fun d!60507 () Bool)

(assert (=> d!60507 e!119502))

(declare-fun res!141994 () Bool)

(assert (=> d!60507 (=> (not res!141994) (not e!119502))))

(declare-fun lt!263917 () (_ BitVec 64))

(assert (=> d!60507 (= res!141994 (bvsge (bvsub lt!263917 from!235) (bitIndex!0 (size!4026 (buf!4469 (_2!7992 lt!263910))) (currentByte!8474 (_2!7992 lt!263910)) (currentBit!8469 (_2!7992 lt!263910)))))))

(assert (=> d!60507 (or (= (bvand lt!263917 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!263917 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!263917 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!263912 () (_ BitVec 64))

(assert (=> d!60507 (= lt!263917 (bvadd lt!263912 nBits!283))))

(assert (=> d!60507 (or (not (= (bvand lt!263912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263912 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60507 (= lt!263912 (bitIndex!0 (size!4026 (buf!4469 bs!64)) (currentByte!8474 bs!64) (currentBit!8469 bs!64)))))

(declare-fun e!119503 () tuple2!14718)

(assert (=> d!60507 (= lt!263910 e!119503)))

(declare-fun c!8960 () Bool)

(assert (=> d!60507 (= c!8960 (= from!235 nBits!283))))

(assert (=> d!60507 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!60507 (= (checkBitsLoop!0 bs!64 nBits!283 expected!82 from!235) lt!263910)))

(declare-fun b!171177 () Bool)

(assert (=> b!171177 (= e!119506 (= expected!82 (_2!7986 (readBitPure!0 bs!64))))))

(declare-fun b!171178 () Bool)

(declare-fun res!141993 () Bool)

(assert (=> b!171178 (=> (not res!141993) (not e!119502))))

(declare-fun e!119505 () Bool)

(assert (=> b!171178 (= res!141993 e!119505)))

(declare-fun res!141991 () Bool)

(assert (=> b!171178 (=> res!141991 e!119505)))

(assert (=> b!171178 (= res!141991 (not (_1!7992 lt!263910)))))

(declare-fun lt!263918 () (_ BitVec 64))

(declare-fun b!171179 () Bool)

(assert (=> b!171179 (= e!119505 (= (bvsub lt!263918 from!235) (bitIndex!0 (size!4026 (buf!4469 (_2!7992 lt!263910))) (currentByte!8474 (_2!7992 lt!263910)) (currentBit!8469 (_2!7992 lt!263910)))))))

(assert (=> b!171179 (or (= (bvand lt!263918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!263918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!263918 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!263915 () (_ BitVec 64))

(assert (=> b!171179 (= lt!263918 (bvadd lt!263915 nBits!283))))

(assert (=> b!171179 (or (not (= (bvand lt!263915 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263915 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263915 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171179 (= lt!263915 (bitIndex!0 (size!4026 (buf!4469 bs!64)) (currentByte!8474 bs!64) (currentBit!8469 bs!64)))))

(declare-fun b!171180 () Bool)

(declare-fun e!119504 () tuple2!14718)

(assert (=> b!171180 (= e!119503 e!119504)))

(declare-fun lt!263909 () tuple2!14718)

(assert (=> b!171180 (= lt!263909 (readBit!0 bs!64))))

(declare-fun c!8961 () Bool)

(assert (=> b!171180 (= c!8961 (not (= (_1!7992 lt!263909) expected!82)))))

(declare-fun b!171181 () Bool)

(declare-fun lt!263908 () tuple2!14718)

(assert (=> b!171181 (= lt!263908 (checkBitsLoop!0 (_2!7992 lt!263909) nBits!283 expected!82 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!263911 () Unit!12223)

(declare-fun lt!263914 () Unit!12223)

(assert (=> b!171181 (= lt!263911 lt!263914)))

(declare-fun lt!263913 () (_ BitVec 64))

(declare-fun lt!263916 () (_ BitVec 64))

(assert (=> b!171181 (validate_offset_bits!1 ((_ sign_extend 32) (size!4026 (buf!4469 (_2!7992 lt!263909)))) ((_ sign_extend 32) (currentByte!8474 (_2!7992 lt!263909))) ((_ sign_extend 32) (currentBit!8469 (_2!7992 lt!263909))) (bvsub lt!263913 lt!263916))))

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!7190 BitStream!7190 (_ BitVec 64) (_ BitVec 64)) Unit!12223)

(assert (=> b!171181 (= lt!263914 (validateOffsetBitsIneqLemma!0 bs!64 (_2!7992 lt!263909) lt!263913 lt!263916))))

(assert (=> b!171181 (= lt!263916 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171181 (= lt!263913 (bvsub nBits!283 from!235))))

(assert (=> b!171181 (= e!119504 (tuple2!14719 (_1!7992 lt!263908) (_2!7992 lt!263908)))))

(declare-fun b!171182 () Bool)

(assert (=> b!171182 (= e!119503 (tuple2!14719 true bs!64))))

(declare-fun b!171183 () Bool)

(assert (=> b!171183 (= e!119504 (tuple2!14719 false (_2!7992 lt!263909)))))

(assert (= (and d!60507 c!8960) b!171182))

(assert (= (and d!60507 (not c!8960)) b!171180))

(assert (= (and b!171180 c!8961) b!171183))

(assert (= (and b!171180 (not c!8961)) b!171181))

(assert (= (and d!60507 res!141994) b!171175))

(assert (= (and b!171175 res!141990) b!171178))

(assert (= (and b!171178 (not res!141991)) b!171179))

(assert (= (and b!171178 res!141993) b!171176))

(assert (= (and b!171176 (not res!141992)) b!171177))

(declare-fun m!270325 () Bool)

(assert (=> d!60507 m!270325))

(assert (=> d!60507 m!270269))

(assert (=> b!171177 m!270231))

(assert (=> b!171179 m!270325))

(assert (=> b!171179 m!270269))

(declare-fun m!270327 () Bool)

(assert (=> b!171181 m!270327))

(declare-fun m!270329 () Bool)

(assert (=> b!171181 m!270329))

(declare-fun m!270331 () Bool)

(assert (=> b!171181 m!270331))

(assert (=> b!171180 m!270283))

(assert (=> d!60465 d!60507))

(declare-fun d!60509 () Bool)

(assert (=> d!60509 (= (remainingBits!0 ((_ sign_extend 32) (size!4026 (buf!4469 lt!263704))) ((_ sign_extend 32) (currentByte!8474 lt!263704)) ((_ sign_extend 32) (currentBit!8469 lt!263704))) (bvsub (bvmul ((_ sign_extend 32) (size!4026 (buf!4469 lt!263704))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8474 lt!263704)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8469 lt!263704)))))))

(assert (=> d!60443 d!60509))

(declare-fun d!60511 () Bool)

(declare-fun e!119513 () Bool)

(assert (=> d!60511 e!119513))

(declare-fun res!141997 () Bool)

(assert (=> d!60511 (=> (not res!141997) (not e!119513))))

(declare-fun increaseBitIndex!0 (BitStream!7190) tuple2!14714)

(assert (=> d!60511 (= res!141997 (= (buf!4469 (_2!7990 (increaseBitIndex!0 bs!64))) (buf!4469 bs!64)))))

(declare-fun lt!263934 () Bool)

(assert (=> d!60511 (= lt!263934 (not (= (bvand ((_ sign_extend 24) (select (arr!4956 (buf!4469 bs!64)) (currentByte!8474 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8469 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!263933 () tuple2!14718)

(assert (=> d!60511 (= lt!263933 (tuple2!14719 (not (= (bvand ((_ sign_extend 24) (select (arr!4956 (buf!4469 bs!64)) (currentByte!8474 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8469 bs!64)))) #b00000000000000000000000000000000)) (_2!7990 (increaseBitIndex!0 bs!64))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!60511 (validate_offset_bit!0 ((_ sign_extend 32) (size!4026 (buf!4469 bs!64))) ((_ sign_extend 32) (currentByte!8474 bs!64)) ((_ sign_extend 32) (currentBit!8469 bs!64)))))

(assert (=> d!60511 (= (readBit!0 bs!64) lt!263933)))

(declare-fun lt!263935 () (_ BitVec 64))

(declare-fun b!171186 () Bool)

(declare-fun lt!263939 () (_ BitVec 64))

(assert (=> b!171186 (= e!119513 (= (bitIndex!0 (size!4026 (buf!4469 (_2!7990 (increaseBitIndex!0 bs!64)))) (currentByte!8474 (_2!7990 (increaseBitIndex!0 bs!64))) (currentBit!8469 (_2!7990 (increaseBitIndex!0 bs!64)))) (bvadd lt!263935 lt!263939)))))

(assert (=> b!171186 (or (not (= (bvand lt!263935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!263939 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263935 lt!263939) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171186 (= lt!263939 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171186 (= lt!263935 (bitIndex!0 (size!4026 (buf!4469 bs!64)) (currentByte!8474 bs!64) (currentBit!8469 bs!64)))))

(declare-fun lt!263937 () Bool)

(assert (=> b!171186 (= lt!263937 (not (= (bvand ((_ sign_extend 24) (select (arr!4956 (buf!4469 bs!64)) (currentByte!8474 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8469 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!263938 () Bool)

(assert (=> b!171186 (= lt!263938 (not (= (bvand ((_ sign_extend 24) (select (arr!4956 (buf!4469 bs!64)) (currentByte!8474 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8469 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!263936 () Bool)

(assert (=> b!171186 (= lt!263936 (not (= (bvand ((_ sign_extend 24) (select (arr!4956 (buf!4469 bs!64)) (currentByte!8474 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8469 bs!64)))) #b00000000000000000000000000000000)))))

(assert (= (and d!60511 res!141997) b!171186))

(declare-fun m!270333 () Bool)

(assert (=> d!60511 m!270333))

(declare-fun m!270335 () Bool)

(assert (=> d!60511 m!270335))

(declare-fun m!270337 () Bool)

(assert (=> d!60511 m!270337))

(declare-fun m!270339 () Bool)

(assert (=> d!60511 m!270339))

(assert (=> b!171186 m!270333))

(assert (=> b!171186 m!270337))

(assert (=> b!171186 m!270335))

(assert (=> b!171186 m!270269))

(declare-fun m!270341 () Bool)

(assert (=> b!171186 m!270341))

(assert (=> d!60461 d!60511))

(declare-fun d!60513 () Bool)

(assert (=> d!60513 (= (invariant!0 (currentBit!8469 bs!64) (currentByte!8474 bs!64) (size!4026 (buf!4469 bs!64))) (and (bvsge (currentBit!8469 bs!64) #b00000000000000000000000000000000) (bvslt (currentBit!8469 bs!64) #b00000000000000000000000000001000) (bvsge (currentByte!8474 bs!64) #b00000000000000000000000000000000) (or (bvslt (currentByte!8474 bs!64) (size!4026 (buf!4469 bs!64))) (and (= (currentBit!8469 bs!64) #b00000000000000000000000000000000) (= (currentByte!8474 bs!64) (size!4026 (buf!4469 bs!64)))))))))

(assert (=> d!60445 d!60513))

(push 1)

(assert (not b!171179))

(assert (not d!60499))

(assert (not b!171177))

(assert (not d!60507))

(assert (not d!60511))

(assert (not d!60501))

(assert (not b!171180))

(assert (not d!60497))

(assert (not b!171181))

(assert (not b!171156))

(assert (not b!171186))

(assert (not b!171151))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

