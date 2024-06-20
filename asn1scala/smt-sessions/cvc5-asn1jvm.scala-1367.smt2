; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37866 () Bool)

(assert start!37866)

(declare-fun res!142056 () Bool)

(declare-fun e!119582 () Bool)

(assert (=> start!37866 (=> (not res!142056) (not e!119582))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37866 (= res!142056 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37866 e!119582))

(assert (=> start!37866 true))

(declare-datatypes ((array!9106 0))(
  ( (array!9107 (arr!4960 (Array (_ BitVec 32) (_ BitVec 8))) (size!4030 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7198 0))(
  ( (BitStream!7199 (buf!4473 array!9106) (currentByte!8490 (_ BitVec 32)) (currentBit!8485 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7198)

(declare-fun e!119584 () Bool)

(declare-fun inv!12 (BitStream!7198) Bool)

(assert (=> start!37866 (and (inv!12 bs!64) e!119584)))

(declare-fun b!171268 () Bool)

(declare-fun res!142055 () Bool)

(assert (=> b!171268 (=> (not res!142055) (not e!119582))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!171268 (= res!142055 (validate_offset_bits!1 ((_ sign_extend 32) (size!4030 (buf!4473 bs!64))) ((_ sign_extend 32) (currentByte!8490 bs!64)) ((_ sign_extend 32) (currentBit!8485 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!171269 () Bool)

(declare-fun lt!264077 () Bool)

(declare-datatypes ((tuple2!14726 0))(
  ( (tuple2!14727 (_1!7996 BitStream!7198) (_2!7996 Bool)) )
))
(declare-fun lt!264076 () tuple2!14726)

(declare-fun lt!264074 () tuple2!14726)

(assert (=> b!171269 (= e!119582 (or (not (= (_2!7996 lt!264074) (and (not lt!264077) (_2!7996 lt!264076)))) (and (not lt!264077) (not (= (_1!7996 lt!264074) (_1!7996 lt!264076))))))))

(declare-fun lt!264075 () tuple2!14726)

(declare-fun expected!82 () Bool)

(assert (=> b!171269 (= lt!264077 (not (= (_2!7996 lt!264075) expected!82)))))

(declare-fun checkBitsLoopPure!0 (BitStream!7198 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14726)

(declare-fun withMovedBitIndex!0 (BitStream!7198 (_ BitVec 64)) BitStream!7198)

(assert (=> b!171269 (= lt!264076 (checkBitsLoopPure!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283 expected!82 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)))))

(declare-fun readBitPure!0 (BitStream!7198) tuple2!14726)

(assert (=> b!171269 (= lt!264075 (readBitPure!0 bs!64))))

(assert (=> b!171269 (= lt!264074 (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235))))

(declare-fun b!171270 () Bool)

(declare-fun array_inv!3771 (array!9106) Bool)

(assert (=> b!171270 (= e!119584 (array_inv!3771 (buf!4473 bs!64)))))

(assert (= (and start!37866 res!142056) b!171268))

(assert (= (and b!171268 res!142055) b!171269))

(assert (= start!37866 b!171270))

(declare-fun m!270403 () Bool)

(assert (=> start!37866 m!270403))

(declare-fun m!270405 () Bool)

(assert (=> b!171268 m!270405))

(declare-fun m!270407 () Bool)

(assert (=> b!171269 m!270407))

(assert (=> b!171269 m!270407))

(declare-fun m!270409 () Bool)

(assert (=> b!171269 m!270409))

(declare-fun m!270411 () Bool)

(assert (=> b!171269 m!270411))

(declare-fun m!270413 () Bool)

(assert (=> b!171269 m!270413))

(declare-fun m!270415 () Bool)

(assert (=> b!171270 m!270415))

(push 1)

(assert (not b!171270))

(assert (not start!37866))

(assert (not b!171268))

(assert (not b!171269))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60545 () Bool)

(assert (=> d!60545 (= (array_inv!3771 (buf!4473 bs!64)) (bvsge (size!4030 (buf!4473 bs!64)) #b00000000000000000000000000000000))))

(assert (=> b!171270 d!60545))

(declare-fun d!60547 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!60547 (= (inv!12 bs!64) (invariant!0 (currentBit!8485 bs!64) (currentByte!8490 bs!64) (size!4030 (buf!4473 bs!64))))))

(declare-fun bs!15071 () Bool)

(assert (= bs!15071 d!60547))

(declare-fun m!270447 () Bool)

(assert (=> bs!15071 m!270447))

(assert (=> start!37866 d!60547))

(declare-fun d!60549 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!60549 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4030 (buf!4473 bs!64))) ((_ sign_extend 32) (currentByte!8490 bs!64)) ((_ sign_extend 32) (currentBit!8485 bs!64)) (bvsub nBits!283 from!235)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4030 (buf!4473 bs!64))) ((_ sign_extend 32) (currentByte!8490 bs!64)) ((_ sign_extend 32) (currentBit!8485 bs!64))) (bvsub nBits!283 from!235)))))

(declare-fun bs!15072 () Bool)

(assert (= bs!15072 d!60549))

(declare-fun m!270449 () Bool)

(assert (=> bs!15072 m!270449))

(assert (=> b!171268 d!60549))

(declare-datatypes ((tuple2!14732 0))(
  ( (tuple2!14733 (_1!7999 Bool) (_2!7999 BitStream!7198)) )
))
(declare-fun lt!264107 () tuple2!14732)

(declare-fun d!60551 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!7198 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14732)

(assert (=> d!60551 (= lt!264107 (checkBitsLoop!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283 expected!82 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)))))

(assert (=> d!60551 (= (checkBitsLoopPure!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283 expected!82 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)) (tuple2!14727 (_2!7999 lt!264107) (_1!7999 lt!264107)))))

(declare-fun bs!15074 () Bool)

(assert (= bs!15074 d!60551))

(assert (=> bs!15074 m!270407))

(declare-fun m!270453 () Bool)

(assert (=> bs!15074 m!270453))

(assert (=> b!171269 d!60551))

(declare-fun d!60555 () Bool)

(declare-fun e!119607 () Bool)

(assert (=> d!60555 e!119607))

(declare-fun res!142073 () Bool)

(assert (=> d!60555 (=> (not res!142073) (not e!119607))))

(declare-fun lt!264120 () (_ BitVec 64))

(declare-fun lt!264119 () BitStream!7198)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!60555 (= res!142073 (= (bvadd lt!264120 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4030 (buf!4473 lt!264119)) (currentByte!8490 lt!264119) (currentBit!8485 lt!264119))))))

(assert (=> d!60555 (or (not (= (bvand lt!264120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264120 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60555 (= lt!264120 (bitIndex!0 (size!4030 (buf!4473 bs!64)) (currentByte!8490 bs!64) (currentBit!8485 bs!64)))))

(declare-datatypes ((Unit!12243 0))(
  ( (Unit!12244) )
))
(declare-datatypes ((tuple2!14736 0))(
  ( (tuple2!14737 (_1!8001 Unit!12243) (_2!8001 BitStream!7198)) )
))
(declare-fun moveBitIndex!0 (BitStream!7198 (_ BitVec 64)) tuple2!14736)

(assert (=> d!60555 (= lt!264119 (_2!8001 (moveBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7198 (_ BitVec 64)) Bool)

(assert (=> d!60555 (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!60555 (= (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) lt!264119)))

(declare-fun b!171293 () Bool)

(assert (=> b!171293 (= e!119607 (= (size!4030 (buf!4473 bs!64)) (size!4030 (buf!4473 lt!264119))))))

(assert (= (and d!60555 res!142073) b!171293))

(declare-fun m!270461 () Bool)

(assert (=> d!60555 m!270461))

(declare-fun m!270463 () Bool)

(assert (=> d!60555 m!270463))

(declare-fun m!270465 () Bool)

(assert (=> d!60555 m!270465))

(declare-fun m!270467 () Bool)

(assert (=> d!60555 m!270467))

(assert (=> b!171269 d!60555))

(declare-fun d!60565 () Bool)

(declare-fun lt!264125 () tuple2!14732)

(declare-fun readBit!0 (BitStream!7198) tuple2!14732)

(assert (=> d!60565 (= lt!264125 (readBit!0 bs!64))))

(assert (=> d!60565 (= (readBitPure!0 bs!64) (tuple2!14727 (_2!7999 lt!264125) (_1!7999 lt!264125)))))

(declare-fun bs!15078 () Bool)

(assert (= bs!15078 d!60565))

(declare-fun m!270477 () Bool)

(assert (=> bs!15078 m!270477))

(assert (=> b!171269 d!60565))

(declare-fun d!60569 () Bool)

(declare-fun lt!264126 () tuple2!14732)

(assert (=> d!60569 (= lt!264126 (checkBitsLoop!0 bs!64 nBits!283 expected!82 from!235))))

(assert (=> d!60569 (= (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235) (tuple2!14727 (_2!7999 lt!264126) (_1!7999 lt!264126)))))

(declare-fun bs!15079 () Bool)

(assert (= bs!15079 d!60569))

(declare-fun m!270479 () Bool)

(assert (=> bs!15079 m!270479))

(assert (=> b!171269 d!60569))

(push 1)

(assert (not d!60551))

(assert (not d!60549))

(assert (not d!60565))

(assert (not d!60555))

(assert (not d!60569))

(assert (not d!60547))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!171330 () Bool)

(declare-fun lt!264233 () tuple2!14732)

(declare-fun lt!264230 () tuple2!14732)

(assert (=> b!171330 (= lt!264233 (checkBitsLoop!0 (_2!7999 lt!264230) nBits!283 expected!82 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!264231 () Unit!12243)

(declare-fun lt!264238 () Unit!12243)

(assert (=> b!171330 (= lt!264231 lt!264238)))

(declare-fun lt!264239 () (_ BitVec 64))

(declare-fun lt!264232 () (_ BitVec 64))

(assert (=> b!171330 (validate_offset_bits!1 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!7999 lt!264230)))) ((_ sign_extend 32) (currentByte!8490 (_2!7999 lt!264230))) ((_ sign_extend 32) (currentBit!8485 (_2!7999 lt!264230))) (bvsub lt!264239 lt!264232))))

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!7198 BitStream!7198 (_ BitVec 64) (_ BitVec 64)) Unit!12243)

(assert (=> b!171330 (= lt!264238 (validateOffsetBitsIneqLemma!0 bs!64 (_2!7999 lt!264230) lt!264239 lt!264232))))

(assert (=> b!171330 (= lt!264232 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171330 (= lt!264239 (bvsub nBits!283 from!235))))

(declare-fun e!119642 () tuple2!14732)

(assert (=> b!171330 (= e!119642 (tuple2!14733 (_1!7999 lt!264233) (_2!7999 lt!264233)))))

(declare-fun lt!264234 () tuple2!14732)

(declare-fun b!171331 () Bool)

(declare-fun lt!264236 () (_ BitVec 64))

(declare-fun e!119643 () Bool)

(assert (=> b!171331 (= e!119643 (= (bvsub lt!264236 from!235) (bitIndex!0 (size!4030 (buf!4473 (_2!7999 lt!264234))) (currentByte!8490 (_2!7999 lt!264234)) (currentBit!8485 (_2!7999 lt!264234)))))))

(assert (=> b!171331 (or (= (bvand lt!264236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264236 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264229 () (_ BitVec 64))

(assert (=> b!171331 (= lt!264236 (bvadd lt!264229 nBits!283))))

(assert (=> b!171331 (or (not (= (bvand lt!264229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264229 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171331 (= lt!264229 (bitIndex!0 (size!4030 (buf!4473 bs!64)) (currentByte!8490 bs!64) (currentBit!8485 bs!64)))))

(declare-fun b!171332 () Bool)

(declare-fun e!119644 () tuple2!14732)

(assert (=> b!171332 (= e!119644 e!119642)))

(assert (=> b!171332 (= lt!264230 (readBit!0 bs!64))))

(declare-fun c!8972 () Bool)

(assert (=> b!171332 (= c!8972 (not (= (_1!7999 lt!264230) expected!82)))))

(declare-fun b!171333 () Bool)

(declare-fun e!119641 () Bool)

(assert (=> b!171333 (= e!119641 (= expected!82 (_2!7996 (readBitPure!0 bs!64))))))

(declare-fun b!171334 () Bool)

(assert (=> b!171334 (= e!119642 (tuple2!14733 false (_2!7999 lt!264230)))))

(declare-fun b!171335 () Bool)

(declare-fun e!119640 () Bool)

(assert (=> b!171335 (= e!119640 e!119641)))

(declare-fun res!142106 () Bool)

(assert (=> b!171335 (=> res!142106 e!119641)))

(assert (=> b!171335 (= res!142106 (or (not (_1!7999 lt!264234)) (bvsge from!235 nBits!283)))))

(declare-fun b!171336 () Bool)

(declare-fun res!142103 () Bool)

(assert (=> b!171336 (=> (not res!142103) (not e!119640))))

(assert (=> b!171336 (= res!142103 e!119643)))

(declare-fun res!142105 () Bool)

(assert (=> b!171336 (=> res!142105 e!119643)))

(assert (=> b!171336 (= res!142105 (not (_1!7999 lt!264234)))))

(declare-fun b!171337 () Bool)

(declare-fun res!142102 () Bool)

(assert (=> b!171337 (=> (not res!142102) (not e!119640))))

(assert (=> b!171337 (= res!142102 (and (= (buf!4473 bs!64) (buf!4473 (_2!7999 lt!264234))) (or (not (= nBits!283 from!235)) (_1!7999 lt!264234))))))

(declare-fun d!60585 () Bool)

(assert (=> d!60585 e!119640))

(declare-fun res!142104 () Bool)

(assert (=> d!60585 (=> (not res!142104) (not e!119640))))

(declare-fun lt!264235 () (_ BitVec 64))

(assert (=> d!60585 (= res!142104 (bvsge (bvsub lt!264235 from!235) (bitIndex!0 (size!4030 (buf!4473 (_2!7999 lt!264234))) (currentByte!8490 (_2!7999 lt!264234)) (currentBit!8485 (_2!7999 lt!264234)))))))

(assert (=> d!60585 (or (= (bvand lt!264235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264235 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264237 () (_ BitVec 64))

(assert (=> d!60585 (= lt!264235 (bvadd lt!264237 nBits!283))))

(assert (=> d!60585 (or (not (= (bvand lt!264237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264237 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60585 (= lt!264237 (bitIndex!0 (size!4030 (buf!4473 bs!64)) (currentByte!8490 bs!64) (currentBit!8485 bs!64)))))

(assert (=> d!60585 (= lt!264234 e!119644)))

(declare-fun c!8973 () Bool)

(assert (=> d!60585 (= c!8973 (= from!235 nBits!283))))

(assert (=> d!60585 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!60585 (= (checkBitsLoop!0 bs!64 nBits!283 expected!82 from!235) lt!264234)))

(declare-fun b!171338 () Bool)

(assert (=> b!171338 (= e!119644 (tuple2!14733 true bs!64))))

(assert (= (and d!60585 c!8973) b!171338))

(assert (= (and d!60585 (not c!8973)) b!171332))

(assert (= (and b!171332 c!8972) b!171334))

(assert (= (and b!171332 (not c!8972)) b!171330))

(assert (= (and d!60585 res!142104) b!171337))

(assert (= (and b!171337 res!142102) b!171336))

(assert (= (and b!171336 (not res!142105)) b!171331))

(assert (= (and b!171336 res!142103) b!171335))

(assert (= (and b!171335 (not res!142106)) b!171333))

(declare-fun m!270523 () Bool)

(assert (=> b!171330 m!270523))

(declare-fun m!270525 () Bool)

(assert (=> b!171330 m!270525))

(declare-fun m!270527 () Bool)

(assert (=> b!171330 m!270527))

(declare-fun m!270529 () Bool)

(assert (=> b!171331 m!270529))

(assert (=> b!171331 m!270463))

(assert (=> b!171333 m!270411))

(assert (=> b!171332 m!270477))

(assert (=> d!60585 m!270529))

(assert (=> d!60585 m!270463))

(assert (=> d!60569 d!60585))

(declare-fun d!60599 () Bool)

(assert (=> d!60599 (= (remainingBits!0 ((_ sign_extend 32) (size!4030 (buf!4473 bs!64))) ((_ sign_extend 32) (currentByte!8490 bs!64)) ((_ sign_extend 32) (currentBit!8485 bs!64))) (bvsub (bvmul ((_ sign_extend 32) (size!4030 (buf!4473 bs!64))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8490 bs!64)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8485 bs!64)))))))

(assert (=> d!60549 d!60599))

(declare-fun d!60603 () Bool)

(declare-fun e!119664 () Bool)

(assert (=> d!60603 e!119664))

(declare-fun res!142126 () Bool)

(assert (=> d!60603 (=> (not res!142126) (not e!119664))))

(declare-fun increaseBitIndex!0 (BitStream!7198) tuple2!14736)

(assert (=> d!60603 (= res!142126 (= (buf!4473 (_2!8001 (increaseBitIndex!0 bs!64))) (buf!4473 bs!64)))))

(declare-fun lt!264299 () Bool)

(assert (=> d!60603 (= lt!264299 (not (= (bvand ((_ sign_extend 24) (select (arr!4960 (buf!4473 bs!64)) (currentByte!8490 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8485 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!264305 () tuple2!14732)

(assert (=> d!60603 (= lt!264305 (tuple2!14733 (not (= (bvand ((_ sign_extend 24) (select (arr!4960 (buf!4473 bs!64)) (currentByte!8490 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8485 bs!64)))) #b00000000000000000000000000000000)) (_2!8001 (increaseBitIndex!0 bs!64))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!60603 (validate_offset_bit!0 ((_ sign_extend 32) (size!4030 (buf!4473 bs!64))) ((_ sign_extend 32) (currentByte!8490 bs!64)) ((_ sign_extend 32) (currentBit!8485 bs!64)))))

(assert (=> d!60603 (= (readBit!0 bs!64) lt!264305)))

(declare-fun lt!264304 () (_ BitVec 64))

(declare-fun b!171359 () Bool)

(declare-fun lt!264300 () (_ BitVec 64))

(assert (=> b!171359 (= e!119664 (= (bitIndex!0 (size!4030 (buf!4473 (_2!8001 (increaseBitIndex!0 bs!64)))) (currentByte!8490 (_2!8001 (increaseBitIndex!0 bs!64))) (currentBit!8485 (_2!8001 (increaseBitIndex!0 bs!64)))) (bvadd lt!264304 lt!264300)))))

(assert (=> b!171359 (or (not (= (bvand lt!264304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264300 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264304 lt!264300) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171359 (= lt!264300 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171359 (= lt!264304 (bitIndex!0 (size!4030 (buf!4473 bs!64)) (currentByte!8490 bs!64) (currentBit!8485 bs!64)))))

(declare-fun lt!264303 () Bool)

(assert (=> b!171359 (= lt!264303 (not (= (bvand ((_ sign_extend 24) (select (arr!4960 (buf!4473 bs!64)) (currentByte!8490 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8485 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!264302 () Bool)

(assert (=> b!171359 (= lt!264302 (not (= (bvand ((_ sign_extend 24) (select (arr!4960 (buf!4473 bs!64)) (currentByte!8490 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8485 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!264301 () Bool)

(assert (=> b!171359 (= lt!264301 (not (= (bvand ((_ sign_extend 24) (select (arr!4960 (buf!4473 bs!64)) (currentByte!8490 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8485 bs!64)))) #b00000000000000000000000000000000)))))

(assert (= (and d!60603 res!142126) b!171359))

(declare-fun m!270537 () Bool)

(assert (=> d!60603 m!270537))

(declare-fun m!270539 () Bool)

(assert (=> d!60603 m!270539))

(declare-fun m!270541 () Bool)

(assert (=> d!60603 m!270541))

(declare-fun m!270543 () Bool)

(assert (=> d!60603 m!270543))

(assert (=> b!171359 m!270539))

(assert (=> b!171359 m!270463))

(declare-fun m!270545 () Bool)

(assert (=> b!171359 m!270545))

(assert (=> b!171359 m!270541))

(assert (=> b!171359 m!270537))

(assert (=> d!60565 d!60603))

(declare-fun b!171360 () Bool)

(declare-fun lt!264307 () tuple2!14732)

(declare-fun lt!264310 () tuple2!14732)

(assert (=> b!171360 (= lt!264310 (checkBitsLoop!0 (_2!7999 lt!264307) nBits!283 expected!82 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!264308 () Unit!12243)

(declare-fun lt!264315 () Unit!12243)

(assert (=> b!171360 (= lt!264308 lt!264315)))

(declare-fun lt!264316 () (_ BitVec 64))

(declare-fun lt!264309 () (_ BitVec 64))

(assert (=> b!171360 (validate_offset_bits!1 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!7999 lt!264307)))) ((_ sign_extend 32) (currentByte!8490 (_2!7999 lt!264307))) ((_ sign_extend 32) (currentBit!8485 (_2!7999 lt!264307))) (bvsub lt!264316 lt!264309))))

(assert (=> b!171360 (= lt!264315 (validateOffsetBitsIneqLemma!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) (_2!7999 lt!264307) lt!264316 lt!264309))))

(assert (=> b!171360 (= lt!264309 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171360 (= lt!264316 (bvsub nBits!283 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)))))

(declare-fun e!119667 () tuple2!14732)

(assert (=> b!171360 (= e!119667 (tuple2!14733 (_1!7999 lt!264310) (_2!7999 lt!264310)))))

(declare-fun b!171361 () Bool)

(declare-fun lt!264311 () tuple2!14732)

(declare-fun lt!264313 () (_ BitVec 64))

(declare-fun e!119668 () Bool)

(assert (=> b!171361 (= e!119668 (= (bvsub lt!264313 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)) (bitIndex!0 (size!4030 (buf!4473 (_2!7999 lt!264311))) (currentByte!8490 (_2!7999 lt!264311)) (currentBit!8485 (_2!7999 lt!264311)))))))

(assert (=> b!171361 (or (= (bvand lt!264313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264313 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264306 () (_ BitVec 64))

(assert (=> b!171361 (= lt!264313 (bvadd lt!264306 nBits!283))))

(assert (=> b!171361 (or (not (= (bvand lt!264306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264306 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171361 (= lt!264306 (bitIndex!0 (size!4030 (buf!4473 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8490 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!8485 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!171362 () Bool)

(declare-fun e!119669 () tuple2!14732)

(assert (=> b!171362 (= e!119669 e!119667)))

(assert (=> b!171362 (= lt!264307 (readBit!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun c!8974 () Bool)

(assert (=> b!171362 (= c!8974 (not (= (_1!7999 lt!264307) expected!82)))))

(declare-fun b!171363 () Bool)

(declare-fun e!119666 () Bool)

(assert (=> b!171363 (= e!119666 (= expected!82 (_2!7996 (readBitPure!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(declare-fun b!171364 () Bool)

(assert (=> b!171364 (= e!119667 (tuple2!14733 false (_2!7999 lt!264307)))))

(declare-fun b!171365 () Bool)

(declare-fun e!119665 () Bool)

(assert (=> b!171365 (= e!119665 e!119666)))

(declare-fun res!142131 () Bool)

(assert (=> b!171365 (=> res!142131 e!119666)))

(assert (=> b!171365 (= res!142131 (or (not (_1!7999 lt!264311)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235) nBits!283)))))

(declare-fun b!171366 () Bool)

(declare-fun res!142128 () Bool)

(assert (=> b!171366 (=> (not res!142128) (not e!119665))))

(assert (=> b!171366 (= res!142128 e!119668)))

(declare-fun res!142130 () Bool)

(assert (=> b!171366 (=> res!142130 e!119668)))

(assert (=> b!171366 (= res!142130 (not (_1!7999 lt!264311)))))

(declare-fun b!171367 () Bool)

(declare-fun res!142127 () Bool)

(assert (=> b!171367 (=> (not res!142127) (not e!119665))))

(assert (=> b!171367 (= res!142127 (and (= (buf!4473 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (buf!4473 (_2!7999 lt!264311))) (or (not (= nBits!283 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235))) (_1!7999 lt!264311))))))

(declare-fun d!60617 () Bool)

(assert (=> d!60617 e!119665))

(declare-fun res!142129 () Bool)

(assert (=> d!60617 (=> (not res!142129) (not e!119665))))

(declare-fun lt!264312 () (_ BitVec 64))

(assert (=> d!60617 (= res!142129 (bvsge (bvsub lt!264312 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)) (bitIndex!0 (size!4030 (buf!4473 (_2!7999 lt!264311))) (currentByte!8490 (_2!7999 lt!264311)) (currentBit!8485 (_2!7999 lt!264311)))))))

(assert (=> d!60617 (or (= (bvand lt!264312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264312 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264314 () (_ BitVec 64))

(assert (=> d!60617 (= lt!264312 (bvadd lt!264314 nBits!283))))

(assert (=> d!60617 (or (not (= (bvand lt!264314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264314 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60617 (= lt!264314 (bitIndex!0 (size!4030 (buf!4473 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8490 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!8485 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!60617 (= lt!264311 e!119669)))

(declare-fun c!8975 () Bool)

(assert (=> d!60617 (= c!8975 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235) nBits!283))))

(assert (=> d!60617 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!60617 (= (checkBitsLoop!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283 expected!82 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)) lt!264311)))

(declare-fun b!171368 () Bool)

(assert (=> b!171368 (= e!119669 (tuple2!14733 true (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!60617 c!8975) b!171368))

(assert (= (and d!60617 (not c!8975)) b!171362))

(assert (= (and b!171362 c!8974) b!171364))

(assert (= (and b!171362 (not c!8974)) b!171360))

(assert (= (and d!60617 res!142129) b!171367))

(assert (= (and b!171367 res!142127) b!171366))

(assert (= (and b!171366 (not res!142130)) b!171361))

(assert (= (and b!171366 res!142128) b!171365))

(assert (= (and b!171365 (not res!142131)) b!171363))

(declare-fun m!270547 () Bool)

(assert (=> b!171360 m!270547))

(declare-fun m!270549 () Bool)

(assert (=> b!171360 m!270549))

(assert (=> b!171360 m!270407))

(declare-fun m!270551 () Bool)

(assert (=> b!171360 m!270551))

(declare-fun m!270553 () Bool)

(assert (=> b!171361 m!270553))

(declare-fun m!270555 () Bool)

(assert (=> b!171361 m!270555))

(assert (=> b!171363 m!270407))

(declare-fun m!270557 () Bool)

(assert (=> b!171363 m!270557))

(assert (=> b!171362 m!270407))

(declare-fun m!270559 () Bool)

(assert (=> b!171362 m!270559))

(assert (=> d!60617 m!270553))

(assert (=> d!60617 m!270555))

(assert (=> d!60551 d!60617))

(declare-fun d!60619 () Bool)

(declare-fun e!119672 () Bool)

(assert (=> d!60619 e!119672))

(declare-fun res!142136 () Bool)

(assert (=> d!60619 (=> (not res!142136) (not e!119672))))

(declare-fun lt!264334 () (_ BitVec 64))

(declare-fun lt!264331 () (_ BitVec 64))

(declare-fun lt!264333 () (_ BitVec 64))

(assert (=> d!60619 (= res!142136 (= lt!264334 (bvsub lt!264333 lt!264331)))))

(assert (=> d!60619 (or (= (bvand lt!264333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264331 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264333 lt!264331) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60619 (= lt!264331 (remainingBits!0 ((_ sign_extend 32) (size!4030 (buf!4473 lt!264119))) ((_ sign_extend 32) (currentByte!8490 lt!264119)) ((_ sign_extend 32) (currentBit!8485 lt!264119))))))

(declare-fun lt!264332 () (_ BitVec 64))

(declare-fun lt!264330 () (_ BitVec 64))

(assert (=> d!60619 (= lt!264333 (bvmul lt!264332 lt!264330))))

(assert (=> d!60619 (or (= lt!264332 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264330 (bvsdiv (bvmul lt!264332 lt!264330) lt!264332)))))

(assert (=> d!60619 (= lt!264330 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60619 (= lt!264332 ((_ sign_extend 32) (size!4030 (buf!4473 lt!264119))))))

(assert (=> d!60619 (= lt!264334 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8490 lt!264119)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8485 lt!264119))))))

(assert (=> d!60619 (invariant!0 (currentBit!8485 lt!264119) (currentByte!8490 lt!264119) (size!4030 (buf!4473 lt!264119)))))

(assert (=> d!60619 (= (bitIndex!0 (size!4030 (buf!4473 lt!264119)) (currentByte!8490 lt!264119) (currentBit!8485 lt!264119)) lt!264334)))

(declare-fun b!171373 () Bool)

(declare-fun res!142137 () Bool)

(assert (=> b!171373 (=> (not res!142137) (not e!119672))))

(assert (=> b!171373 (= res!142137 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264334))))

(declare-fun b!171374 () Bool)

(declare-fun lt!264329 () (_ BitVec 64))

(assert (=> b!171374 (= e!119672 (bvsle lt!264334 (bvmul lt!264329 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171374 (or (= lt!264329 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264329 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264329)))))

(assert (=> b!171374 (= lt!264329 ((_ sign_extend 32) (size!4030 (buf!4473 lt!264119))))))

(assert (= (and d!60619 res!142136) b!171373))

(assert (= (and b!171373 res!142137) b!171374))

(declare-fun m!270561 () Bool)

(assert (=> d!60619 m!270561))

(declare-fun m!270563 () Bool)

(assert (=> d!60619 m!270563))

(assert (=> d!60555 d!60619))

(declare-fun d!60621 () Bool)

(declare-fun e!119673 () Bool)

(assert (=> d!60621 e!119673))

(declare-fun res!142138 () Bool)

(assert (=> d!60621 (=> (not res!142138) (not e!119673))))

(declare-fun lt!264339 () (_ BitVec 64))

(declare-fun lt!264337 () (_ BitVec 64))

(declare-fun lt!264340 () (_ BitVec 64))

(assert (=> d!60621 (= res!142138 (= lt!264340 (bvsub lt!264339 lt!264337)))))

(assert (=> d!60621 (or (= (bvand lt!264339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264337 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264339 lt!264337) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60621 (= lt!264337 (remainingBits!0 ((_ sign_extend 32) (size!4030 (buf!4473 bs!64))) ((_ sign_extend 32) (currentByte!8490 bs!64)) ((_ sign_extend 32) (currentBit!8485 bs!64))))))

(declare-fun lt!264338 () (_ BitVec 64))

(declare-fun lt!264336 () (_ BitVec 64))

(assert (=> d!60621 (= lt!264339 (bvmul lt!264338 lt!264336))))

(assert (=> d!60621 (or (= lt!264338 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264336 (bvsdiv (bvmul lt!264338 lt!264336) lt!264338)))))

(assert (=> d!60621 (= lt!264336 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60621 (= lt!264338 ((_ sign_extend 32) (size!4030 (buf!4473 bs!64))))))

(assert (=> d!60621 (= lt!264340 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8490 bs!64)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8485 bs!64))))))

(assert (=> d!60621 (invariant!0 (currentBit!8485 bs!64) (currentByte!8490 bs!64) (size!4030 (buf!4473 bs!64)))))

(assert (=> d!60621 (= (bitIndex!0 (size!4030 (buf!4473 bs!64)) (currentByte!8490 bs!64) (currentBit!8485 bs!64)) lt!264340)))

(declare-fun b!171375 () Bool)

(declare-fun res!142139 () Bool)

(assert (=> b!171375 (=> (not res!142139) (not e!119673))))

(assert (=> b!171375 (= res!142139 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264340))))

(declare-fun b!171376 () Bool)

(declare-fun lt!264335 () (_ BitVec 64))

(assert (=> b!171376 (= e!119673 (bvsle lt!264340 (bvmul lt!264335 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171376 (or (= lt!264335 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264335 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264335)))))

(assert (=> b!171376 (= lt!264335 ((_ sign_extend 32) (size!4030 (buf!4473 bs!64))))))

(assert (= (and d!60621 res!142138) b!171375))

(assert (= (and b!171375 res!142139) b!171376))

(assert (=> d!60621 m!270449))

(assert (=> d!60621 m!270447))

(assert (=> d!60555 d!60621))

(declare-fun d!60623 () Bool)

(declare-fun lt!264418 () (_ BitVec 32))

(assert (=> d!60623 (= lt!264418 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!264419 () (_ BitVec 32))

(assert (=> d!60623 (= lt!264419 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!119707 () Bool)

(assert (=> d!60623 e!119707))

(declare-fun res!142174 () Bool)

(assert (=> d!60623 (=> (not res!142174) (not e!119707))))

(assert (=> d!60623 (= res!142174 (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!12255 () Unit!12243)

(declare-fun Unit!12256 () Unit!12243)

(declare-fun Unit!12257 () Unit!12243)

(assert (=> d!60623 (= (moveBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!8485 bs!64) lt!264418) #b00000000000000000000000000000000) (tuple2!14737 Unit!12255 (BitStream!7199 (buf!4473 bs!64) (bvsub (bvadd (currentByte!8490 bs!64) lt!264419) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!264418 (currentBit!8485 bs!64)))) (ite (bvsge (bvadd (currentBit!8485 bs!64) lt!264418) #b00000000000000000000000000001000) (tuple2!14737 Unit!12256 (BitStream!7199 (buf!4473 bs!64) (bvadd (currentByte!8490 bs!64) lt!264419 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8485 bs!64) lt!264418) #b00000000000000000000000000001000))) (tuple2!14737 Unit!12257 (BitStream!7199 (buf!4473 bs!64) (bvadd (currentByte!8490 bs!64) lt!264419) (bvadd (currentBit!8485 bs!64) lt!264418))))))))

(declare-fun b!171427 () Bool)

(declare-fun e!119708 () Bool)

(assert (=> b!171427 (= e!119707 e!119708)))

(declare-fun res!142173 () Bool)

(assert (=> b!171427 (=> (not res!142173) (not e!119708))))

(declare-fun lt!264422 () (_ BitVec 64))

(declare-fun lt!264423 () tuple2!14736)

(assert (=> b!171427 (= res!142173 (= (bvadd lt!264422 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4030 (buf!4473 (_2!8001 lt!264423))) (currentByte!8490 (_2!8001 lt!264423)) (currentBit!8485 (_2!8001 lt!264423)))))))

(assert (=> b!171427 (or (not (= (bvand lt!264422 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264422 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264422 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171427 (= lt!264422 (bitIndex!0 (size!4030 (buf!4473 bs!64)) (currentByte!8490 bs!64) (currentBit!8485 bs!64)))))

(declare-fun lt!264420 () (_ BitVec 32))

(declare-fun lt!264421 () (_ BitVec 32))

(declare-fun Unit!12258 () Unit!12243)

(declare-fun Unit!12259 () Unit!12243)

(declare-fun Unit!12260 () Unit!12243)

(assert (=> b!171427 (= lt!264423 (ite (bvslt (bvadd (currentBit!8485 bs!64) lt!264421) #b00000000000000000000000000000000) (tuple2!14737 Unit!12258 (BitStream!7199 (buf!4473 bs!64) (bvsub (bvadd (currentByte!8490 bs!64) lt!264420) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!264421 (currentBit!8485 bs!64)))) (ite (bvsge (bvadd (currentBit!8485 bs!64) lt!264421) #b00000000000000000000000000001000) (tuple2!14737 Unit!12259 (BitStream!7199 (buf!4473 bs!64) (bvadd (currentByte!8490 bs!64) lt!264420 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8485 bs!64) lt!264421) #b00000000000000000000000000001000))) (tuple2!14737 Unit!12260 (BitStream!7199 (buf!4473 bs!64) (bvadd (currentByte!8490 bs!64) lt!264420) (bvadd (currentBit!8485 bs!64) lt!264421))))))))

(assert (=> b!171427 (= lt!264421 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171427 (= lt!264420 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!171428 () Bool)

(assert (=> b!171428 (= e!119708 (and (= (size!4030 (buf!4473 bs!64)) (size!4030 (buf!4473 (_2!8001 lt!264423)))) (= (buf!4473 bs!64) (buf!4473 (_2!8001 lt!264423)))))))

(assert (= (and d!60623 res!142174) b!171427))

(assert (= (and b!171427 res!142173) b!171428))

(assert (=> d!60623 m!270467))

(declare-fun m!270589 () Bool)

(assert (=> b!171427 m!270589))

(assert (=> b!171427 m!270463))

(assert (=> d!60555 d!60623))

(declare-fun d!60635 () Bool)

(declare-fun res!142177 () Bool)

(declare-fun e!119711 () Bool)

(assert (=> d!60635 (=> (not res!142177) (not e!119711))))

(assert (=> d!60635 (= res!142177 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4030 (buf!4473 bs!64)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4030 (buf!4473 bs!64)))))))))

(assert (=> d!60635 (= (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) e!119711)))

(declare-fun b!171432 () Bool)

(declare-fun lt!264426 () (_ BitVec 64))

(assert (=> b!171432 (= e!119711 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264426) (bvsle lt!264426 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4030 (buf!4473 bs!64)))))))))

(assert (=> b!171432 (= lt!264426 (bvadd (bitIndex!0 (size!4030 (buf!4473 bs!64)) (currentByte!8490 bs!64) (currentBit!8485 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!60635 res!142177) b!171432))

(assert (=> b!171432 m!270463))

(assert (=> d!60555 d!60635))

(declare-fun d!60637 () Bool)

(assert (=> d!60637 (= (invariant!0 (currentBit!8485 bs!64) (currentByte!8490 bs!64) (size!4030 (buf!4473 bs!64))) (and (bvsge (currentBit!8485 bs!64) #b00000000000000000000000000000000) (bvslt (currentBit!8485 bs!64) #b00000000000000000000000000001000) (bvsge (currentByte!8490 bs!64) #b00000000000000000000000000000000) (or (bvslt (currentByte!8490 bs!64) (size!4030 (buf!4473 bs!64))) (and (= (currentBit!8485 bs!64) #b00000000000000000000000000000000) (= (currentByte!8490 bs!64) (size!4030 (buf!4473 bs!64)))))))))

(assert (=> d!60547 d!60637))

(push 1)

(assert (not b!171360))

(assert (not b!171432))

(assert (not b!171332))

(assert (not b!171361))

(assert (not d!60617))

(assert (not d!60603))

(assert (not b!171363))

(assert (not b!171330))

(assert (not d!60585))

(assert (not b!171359))

(assert (not d!60619))

(assert (not b!171333))

(assert (not b!171427))

(assert (not b!171331))

(assert (not d!60621))

(assert (not b!171362))

(assert (not d!60623))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!171547 () Bool)

(declare-fun lt!264630 () tuple2!14732)

(declare-fun lt!264633 () tuple2!14732)

(assert (=> b!171547 (= lt!264633 (checkBitsLoop!0 (_2!7999 lt!264630) nBits!283 expected!82 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!264631 () Unit!12243)

(declare-fun lt!264638 () Unit!12243)

(assert (=> b!171547 (= lt!264631 lt!264638)))

(declare-fun lt!264639 () (_ BitVec 64))

(declare-fun lt!264632 () (_ BitVec 64))

(assert (=> b!171547 (validate_offset_bits!1 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!7999 lt!264630)))) ((_ sign_extend 32) (currentByte!8490 (_2!7999 lt!264630))) ((_ sign_extend 32) (currentBit!8485 (_2!7999 lt!264630))) (bvsub lt!264639 lt!264632))))

(assert (=> b!171547 (= lt!264638 (validateOffsetBitsIneqLemma!0 (_2!7999 lt!264230) (_2!7999 lt!264630) lt!264639 lt!264632))))

(assert (=> b!171547 (= lt!264632 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171547 (= lt!264639 (bvsub nBits!283 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!119780 () tuple2!14732)

(assert (=> b!171547 (= e!119780 (tuple2!14733 (_1!7999 lt!264633) (_2!7999 lt!264633)))))

(declare-fun b!171548 () Bool)

(declare-fun lt!264636 () (_ BitVec 64))

(declare-fun e!119781 () Bool)

(declare-fun lt!264634 () tuple2!14732)

(assert (=> b!171548 (= e!119781 (= (bvsub lt!264636 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!4030 (buf!4473 (_2!7999 lt!264634))) (currentByte!8490 (_2!7999 lt!264634)) (currentBit!8485 (_2!7999 lt!264634)))))))

(assert (=> b!171548 (or (= (bvand lt!264636 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264636 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264636 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264629 () (_ BitVec 64))

(assert (=> b!171548 (= lt!264636 (bvadd lt!264629 nBits!283))))

(assert (=> b!171548 (or (not (= (bvand lt!264629 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264629 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264629 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171548 (= lt!264629 (bitIndex!0 (size!4030 (buf!4473 (_2!7999 lt!264230))) (currentByte!8490 (_2!7999 lt!264230)) (currentBit!8485 (_2!7999 lt!264230))))))

(declare-fun b!171549 () Bool)

(declare-fun e!119782 () tuple2!14732)

(assert (=> b!171549 (= e!119782 e!119780)))

(assert (=> b!171549 (= lt!264630 (readBit!0 (_2!7999 lt!264230)))))

(declare-fun c!9000 () Bool)

(assert (=> b!171549 (= c!9000 (not (= (_1!7999 lt!264630) expected!82)))))

(declare-fun b!171550 () Bool)

(declare-fun e!119779 () Bool)

(assert (=> b!171550 (= e!119779 (= expected!82 (_2!7996 (readBitPure!0 (_2!7999 lt!264230)))))))

(declare-fun b!171551 () Bool)

(assert (=> b!171551 (= e!119780 (tuple2!14733 false (_2!7999 lt!264630)))))

(declare-fun b!171552 () Bool)

(declare-fun e!119778 () Bool)

(assert (=> b!171552 (= e!119778 e!119779)))

(declare-fun res!142264 () Bool)

(assert (=> b!171552 (=> res!142264 e!119779)))

(assert (=> b!171552 (= res!142264 (or (not (_1!7999 lt!264634)) (bvsge (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283)))))

(declare-fun b!171553 () Bool)

(declare-fun res!142261 () Bool)

(assert (=> b!171553 (=> (not res!142261) (not e!119778))))

(assert (=> b!171553 (= res!142261 e!119781)))

(declare-fun res!142263 () Bool)

(assert (=> b!171553 (=> res!142263 e!119781)))

(assert (=> b!171553 (= res!142263 (not (_1!7999 lt!264634)))))

(declare-fun b!171554 () Bool)

(declare-fun res!142260 () Bool)

(assert (=> b!171554 (=> (not res!142260) (not e!119778))))

(assert (=> b!171554 (= res!142260 (and (= (buf!4473 (_2!7999 lt!264230)) (buf!4473 (_2!7999 lt!264634))) (or (not (= nBits!283 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001))) (_1!7999 lt!264634))))))

(declare-fun d!60711 () Bool)

(assert (=> d!60711 e!119778))

(declare-fun res!142262 () Bool)

(assert (=> d!60711 (=> (not res!142262) (not e!119778))))

(declare-fun lt!264635 () (_ BitVec 64))

(assert (=> d!60711 (= res!142262 (bvsge (bvsub lt!264635 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!4030 (buf!4473 (_2!7999 lt!264634))) (currentByte!8490 (_2!7999 lt!264634)) (currentBit!8485 (_2!7999 lt!264634)))))))

(assert (=> d!60711 (or (= (bvand lt!264635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264635 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264637 () (_ BitVec 64))

(assert (=> d!60711 (= lt!264635 (bvadd lt!264637 nBits!283))))

(assert (=> d!60711 (or (not (= (bvand lt!264637 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264637 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264637 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60711 (= lt!264637 (bitIndex!0 (size!4030 (buf!4473 (_2!7999 lt!264230))) (currentByte!8490 (_2!7999 lt!264230)) (currentBit!8485 (_2!7999 lt!264230))))))

(assert (=> d!60711 (= lt!264634 e!119782)))

(declare-fun c!9001 () Bool)

(assert (=> d!60711 (= c!9001 (= (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283))))

(assert (=> d!60711 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!60711 (= (checkBitsLoop!0 (_2!7999 lt!264230) nBits!283 expected!82 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!264634)))

(declare-fun b!171555 () Bool)

(assert (=> b!171555 (= e!119782 (tuple2!14733 true (_2!7999 lt!264230)))))

(assert (= (and d!60711 c!9001) b!171555))

(assert (= (and d!60711 (not c!9001)) b!171549))

(assert (= (and b!171549 c!9000) b!171551))

(assert (= (and b!171549 (not c!9000)) b!171547))

(assert (= (and d!60711 res!142262) b!171554))

(assert (= (and b!171554 res!142260) b!171553))

(assert (= (and b!171553 (not res!142263)) b!171548))

(assert (= (and b!171553 res!142261) b!171552))

(assert (= (and b!171552 (not res!142264)) b!171550))

(declare-fun m!270753 () Bool)

(assert (=> b!171547 m!270753))

(declare-fun m!270755 () Bool)

(assert (=> b!171547 m!270755))

(declare-fun m!270757 () Bool)

(assert (=> b!171547 m!270757))

(declare-fun m!270759 () Bool)

(assert (=> b!171548 m!270759))

(declare-fun m!270761 () Bool)

(assert (=> b!171548 m!270761))

(declare-fun m!270763 () Bool)

(assert (=> b!171550 m!270763))

(declare-fun m!270765 () Bool)

(assert (=> b!171549 m!270765))

(assert (=> d!60711 m!270759))

(assert (=> d!60711 m!270761))

(assert (=> b!171330 d!60711))

(declare-fun d!60713 () Bool)

(assert (=> d!60713 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!7999 lt!264230)))) ((_ sign_extend 32) (currentByte!8490 (_2!7999 lt!264230))) ((_ sign_extend 32) (currentBit!8485 (_2!7999 lt!264230))) (bvsub lt!264239 lt!264232)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!7999 lt!264230)))) ((_ sign_extend 32) (currentByte!8490 (_2!7999 lt!264230))) ((_ sign_extend 32) (currentBit!8485 (_2!7999 lt!264230)))) (bvsub lt!264239 lt!264232)))))

(declare-fun bs!15093 () Bool)

(assert (= bs!15093 d!60713))

(declare-fun m!270767 () Bool)

(assert (=> bs!15093 m!270767))

(assert (=> b!171330 d!60713))

(declare-fun d!60715 () Bool)

(declare-fun e!119785 () Bool)

(assert (=> d!60715 e!119785))

(declare-fun res!142267 () Bool)

(assert (=> d!60715 (=> (not res!142267) (not e!119785))))

(assert (=> d!60715 (= res!142267 (or (= (bvand lt!264239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264232 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264239 lt!264232) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!264642 () Unit!12243)

(declare-fun choose!27 (BitStream!7198 BitStream!7198 (_ BitVec 64) (_ BitVec 64)) Unit!12243)

(assert (=> d!60715 (= lt!264642 (choose!27 bs!64 (_2!7999 lt!264230) lt!264239 lt!264232))))

(assert (=> d!60715 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264232) (bvsle lt!264232 lt!264239))))

(assert (=> d!60715 (= (validateOffsetBitsIneqLemma!0 bs!64 (_2!7999 lt!264230) lt!264239 lt!264232) lt!264642)))

(declare-fun b!171558 () Bool)

(assert (=> b!171558 (= e!119785 (validate_offset_bits!1 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!7999 lt!264230)))) ((_ sign_extend 32) (currentByte!8490 (_2!7999 lt!264230))) ((_ sign_extend 32) (currentBit!8485 (_2!7999 lt!264230))) (bvsub lt!264239 lt!264232)))))

(assert (= (and d!60715 res!142267) b!171558))

(declare-fun m!270769 () Bool)

(assert (=> d!60715 m!270769))

(assert (=> b!171558 m!270525))

(assert (=> b!171330 d!60715))

(declare-fun b!171559 () Bool)

(declare-fun lt!264647 () tuple2!14732)

(declare-fun lt!264644 () tuple2!14732)

(assert (=> b!171559 (= lt!264647 (checkBitsLoop!0 (_2!7999 lt!264644) nBits!283 expected!82 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!264645 () Unit!12243)

(declare-fun lt!264652 () Unit!12243)

(assert (=> b!171559 (= lt!264645 lt!264652)))

(declare-fun lt!264653 () (_ BitVec 64))

(declare-fun lt!264646 () (_ BitVec 64))

(assert (=> b!171559 (validate_offset_bits!1 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!7999 lt!264644)))) ((_ sign_extend 32) (currentByte!8490 (_2!7999 lt!264644))) ((_ sign_extend 32) (currentBit!8485 (_2!7999 lt!264644))) (bvsub lt!264653 lt!264646))))

(assert (=> b!171559 (= lt!264652 (validateOffsetBitsIneqLemma!0 (_2!7999 lt!264307) (_2!7999 lt!264644) lt!264653 lt!264646))))

(assert (=> b!171559 (= lt!264646 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171559 (= lt!264653 (bvsub nBits!283 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!119788 () tuple2!14732)

(assert (=> b!171559 (= e!119788 (tuple2!14733 (_1!7999 lt!264647) (_2!7999 lt!264647)))))

(declare-fun b!171560 () Bool)

(declare-fun lt!264650 () (_ BitVec 64))

(declare-fun e!119789 () Bool)

(declare-fun lt!264648 () tuple2!14732)

(assert (=> b!171560 (= e!119789 (= (bvsub lt!264650 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!4030 (buf!4473 (_2!7999 lt!264648))) (currentByte!8490 (_2!7999 lt!264648)) (currentBit!8485 (_2!7999 lt!264648)))))))

(assert (=> b!171560 (or (= (bvand lt!264650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264650 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264643 () (_ BitVec 64))

(assert (=> b!171560 (= lt!264650 (bvadd lt!264643 nBits!283))))

(assert (=> b!171560 (or (not (= (bvand lt!264643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264643 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171560 (= lt!264643 (bitIndex!0 (size!4030 (buf!4473 (_2!7999 lt!264307))) (currentByte!8490 (_2!7999 lt!264307)) (currentBit!8485 (_2!7999 lt!264307))))))

(declare-fun b!171561 () Bool)

(declare-fun e!119790 () tuple2!14732)

(assert (=> b!171561 (= e!119790 e!119788)))

(assert (=> b!171561 (= lt!264644 (readBit!0 (_2!7999 lt!264307)))))

(declare-fun c!9002 () Bool)

(assert (=> b!171561 (= c!9002 (not (= (_1!7999 lt!264644) expected!82)))))

(declare-fun b!171562 () Bool)

(declare-fun e!119787 () Bool)

(assert (=> b!171562 (= e!119787 (= expected!82 (_2!7996 (readBitPure!0 (_2!7999 lt!264307)))))))

(declare-fun b!171563 () Bool)

(assert (=> b!171563 (= e!119788 (tuple2!14733 false (_2!7999 lt!264644)))))

(declare-fun b!171564 () Bool)

(declare-fun e!119786 () Bool)

(assert (=> b!171564 (= e!119786 e!119787)))

(declare-fun res!142272 () Bool)

(assert (=> b!171564 (=> res!142272 e!119787)))

(assert (=> b!171564 (= res!142272 (or (not (_1!7999 lt!264648)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283)))))

(declare-fun b!171565 () Bool)

(declare-fun res!142269 () Bool)

(assert (=> b!171565 (=> (not res!142269) (not e!119786))))

(assert (=> b!171565 (= res!142269 e!119789)))

(declare-fun res!142271 () Bool)

(assert (=> b!171565 (=> res!142271 e!119789)))

(assert (=> b!171565 (= res!142271 (not (_1!7999 lt!264648)))))

(declare-fun b!171566 () Bool)

(declare-fun res!142268 () Bool)

(assert (=> b!171566 (=> (not res!142268) (not e!119786))))

(assert (=> b!171566 (= res!142268 (and (= (buf!4473 (_2!7999 lt!264307)) (buf!4473 (_2!7999 lt!264648))) (or (not (= nBits!283 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001))) (_1!7999 lt!264648))))))

(declare-fun d!60717 () Bool)

(assert (=> d!60717 e!119786))

(declare-fun res!142270 () Bool)

(assert (=> d!60717 (=> (not res!142270) (not e!119786))))

(declare-fun lt!264649 () (_ BitVec 64))

(assert (=> d!60717 (= res!142270 (bvsge (bvsub lt!264649 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!4030 (buf!4473 (_2!7999 lt!264648))) (currentByte!8490 (_2!7999 lt!264648)) (currentBit!8485 (_2!7999 lt!264648)))))))

(assert (=> d!60717 (or (= (bvand lt!264649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264649 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264651 () (_ BitVec 64))

(assert (=> d!60717 (= lt!264649 (bvadd lt!264651 nBits!283))))

(assert (=> d!60717 (or (not (= (bvand lt!264651 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264651 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264651 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60717 (= lt!264651 (bitIndex!0 (size!4030 (buf!4473 (_2!7999 lt!264307))) (currentByte!8490 (_2!7999 lt!264307)) (currentBit!8485 (_2!7999 lt!264307))))))

(assert (=> d!60717 (= lt!264648 e!119790)))

(declare-fun c!9003 () Bool)

(assert (=> d!60717 (= c!9003 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283))))

(assert (=> d!60717 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!60717 (= (checkBitsLoop!0 (_2!7999 lt!264307) nBits!283 expected!82 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!264648)))

(declare-fun b!171567 () Bool)

(assert (=> b!171567 (= e!119790 (tuple2!14733 true (_2!7999 lt!264307)))))

(assert (= (and d!60717 c!9003) b!171567))

(assert (= (and d!60717 (not c!9003)) b!171561))

(assert (= (and b!171561 c!9002) b!171563))

(assert (= (and b!171561 (not c!9002)) b!171559))

(assert (= (and d!60717 res!142270) b!171566))

(assert (= (and b!171566 res!142268) b!171565))

(assert (= (and b!171565 (not res!142271)) b!171560))

(assert (= (and b!171565 res!142269) b!171564))

(assert (= (and b!171564 (not res!142272)) b!171562))

(declare-fun m!270771 () Bool)

(assert (=> b!171559 m!270771))

(declare-fun m!270773 () Bool)

(assert (=> b!171559 m!270773))

(declare-fun m!270775 () Bool)

(assert (=> b!171559 m!270775))

(declare-fun m!270777 () Bool)

(assert (=> b!171560 m!270777))

(declare-fun m!270779 () Bool)

(assert (=> b!171560 m!270779))

(declare-fun m!270781 () Bool)

(assert (=> b!171562 m!270781))

(declare-fun m!270783 () Bool)

(assert (=> b!171561 m!270783))

(assert (=> d!60717 m!270777))

(assert (=> d!60717 m!270779))

(assert (=> b!171360 d!60717))

(declare-fun d!60719 () Bool)

(assert (=> d!60719 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!7999 lt!264307)))) ((_ sign_extend 32) (currentByte!8490 (_2!7999 lt!264307))) ((_ sign_extend 32) (currentBit!8485 (_2!7999 lt!264307))) (bvsub lt!264316 lt!264309)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!7999 lt!264307)))) ((_ sign_extend 32) (currentByte!8490 (_2!7999 lt!264307))) ((_ sign_extend 32) (currentBit!8485 (_2!7999 lt!264307)))) (bvsub lt!264316 lt!264309)))))

(declare-fun bs!15094 () Bool)

(assert (= bs!15094 d!60719))

(declare-fun m!270785 () Bool)

(assert (=> bs!15094 m!270785))

(assert (=> b!171360 d!60719))

(declare-fun d!60721 () Bool)

(declare-fun e!119791 () Bool)

(assert (=> d!60721 e!119791))

(declare-fun res!142273 () Bool)

(assert (=> d!60721 (=> (not res!142273) (not e!119791))))

(assert (=> d!60721 (= res!142273 (or (= (bvand lt!264316 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264309 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264316 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264316 lt!264309) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!264654 () Unit!12243)

(assert (=> d!60721 (= lt!264654 (choose!27 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) (_2!7999 lt!264307) lt!264316 lt!264309))))

(assert (=> d!60721 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264309) (bvsle lt!264309 lt!264316))))

(assert (=> d!60721 (= (validateOffsetBitsIneqLemma!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) (_2!7999 lt!264307) lt!264316 lt!264309) lt!264654)))

(declare-fun b!171568 () Bool)

(assert (=> b!171568 (= e!119791 (validate_offset_bits!1 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!7999 lt!264307)))) ((_ sign_extend 32) (currentByte!8490 (_2!7999 lt!264307))) ((_ sign_extend 32) (currentBit!8485 (_2!7999 lt!264307))) (bvsub lt!264316 lt!264309)))))

(assert (= (and d!60721 res!142273) b!171568))

(assert (=> d!60721 m!270407))

(declare-fun m!270787 () Bool)

(assert (=> d!60721 m!270787))

(assert (=> b!171568 m!270549))

(assert (=> b!171360 d!60721))

(declare-fun d!60723 () Bool)

(declare-fun e!119792 () Bool)

(assert (=> d!60723 e!119792))

(declare-fun res!142274 () Bool)

(assert (=> d!60723 (=> (not res!142274) (not e!119792))))

(declare-fun lt!264660 () (_ BitVec 64))

(declare-fun lt!264659 () (_ BitVec 64))

(declare-fun lt!264657 () (_ BitVec 64))

(assert (=> d!60723 (= res!142274 (= lt!264660 (bvsub lt!264659 lt!264657)))))

(assert (=> d!60723 (or (= (bvand lt!264659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264657 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264659 lt!264657) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60723 (= lt!264657 (remainingBits!0 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!7999 lt!264234)))) ((_ sign_extend 32) (currentByte!8490 (_2!7999 lt!264234))) ((_ sign_extend 32) (currentBit!8485 (_2!7999 lt!264234)))))))

(declare-fun lt!264658 () (_ BitVec 64))

(declare-fun lt!264656 () (_ BitVec 64))

(assert (=> d!60723 (= lt!264659 (bvmul lt!264658 lt!264656))))

(assert (=> d!60723 (or (= lt!264658 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264656 (bvsdiv (bvmul lt!264658 lt!264656) lt!264658)))))

(assert (=> d!60723 (= lt!264656 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60723 (= lt!264658 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!7999 lt!264234)))))))

(assert (=> d!60723 (= lt!264660 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8490 (_2!7999 lt!264234))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8485 (_2!7999 lt!264234)))))))

(assert (=> d!60723 (invariant!0 (currentBit!8485 (_2!7999 lt!264234)) (currentByte!8490 (_2!7999 lt!264234)) (size!4030 (buf!4473 (_2!7999 lt!264234))))))

(assert (=> d!60723 (= (bitIndex!0 (size!4030 (buf!4473 (_2!7999 lt!264234))) (currentByte!8490 (_2!7999 lt!264234)) (currentBit!8485 (_2!7999 lt!264234))) lt!264660)))

(declare-fun b!171569 () Bool)

(declare-fun res!142275 () Bool)

(assert (=> b!171569 (=> (not res!142275) (not e!119792))))

(assert (=> b!171569 (= res!142275 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264660))))

(declare-fun b!171570 () Bool)

(declare-fun lt!264655 () (_ BitVec 64))

(assert (=> b!171570 (= e!119792 (bvsle lt!264660 (bvmul lt!264655 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171570 (or (= lt!264655 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264655 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264655)))))

(assert (=> b!171570 (= lt!264655 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!7999 lt!264234)))))))

(assert (= (and d!60723 res!142274) b!171569))

(assert (= (and b!171569 res!142275) b!171570))

(declare-fun m!270789 () Bool)

(assert (=> d!60723 m!270789))

(declare-fun m!270791 () Bool)

(assert (=> d!60723 m!270791))

(assert (=> b!171331 d!60723))

(assert (=> b!171331 d!60621))

(declare-fun d!60725 () Bool)

(declare-fun e!119795 () Bool)

(assert (=> d!60725 e!119795))

(declare-fun res!142280 () Bool)

(assert (=> d!60725 (=> (not res!142280) (not e!119795))))

(declare-fun lt!264671 () (_ BitVec 64))

(declare-fun lt!264675 () (_ BitVec 64))

(declare-fun lt!264674 () tuple2!14736)

(assert (=> d!60725 (= res!142280 (= (bvadd lt!264671 lt!264675) (bitIndex!0 (size!4030 (buf!4473 (_2!8001 lt!264674))) (currentByte!8490 (_2!8001 lt!264674)) (currentBit!8485 (_2!8001 lt!264674)))))))

(assert (=> d!60725 (or (not (= (bvand lt!264671 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264675 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264671 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264671 lt!264675) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60725 (= lt!264675 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!60725 (= lt!264671 (bitIndex!0 (size!4030 (buf!4473 bs!64)) (currentByte!8490 bs!64) (currentBit!8485 bs!64)))))

(declare-fun Unit!12271 () Unit!12243)

(declare-fun Unit!12272 () Unit!12243)

(assert (=> d!60725 (= lt!264674 (ite (bvslt (currentBit!8485 bs!64) #b00000000000000000000000000000111) (tuple2!14737 Unit!12271 (BitStream!7199 (buf!4473 bs!64) (currentByte!8490 bs!64) (bvadd (currentBit!8485 bs!64) #b00000000000000000000000000000001))) (tuple2!14737 Unit!12272 (BitStream!7199 (buf!4473 bs!64) (bvadd (currentByte!8490 bs!64) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!60725 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!4030 (buf!4473 bs!64))) ((_ sign_extend 32) (currentByte!8490 bs!64)) ((_ sign_extend 32) (currentBit!8485 bs!64))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!60725 (= (increaseBitIndex!0 bs!64) lt!264674)))

(declare-fun b!171575 () Bool)

(declare-fun res!142281 () Bool)

(assert (=> b!171575 (=> (not res!142281) (not e!119795))))

(declare-fun lt!264672 () (_ BitVec 64))

(declare-fun lt!264673 () (_ BitVec 64))

(assert (=> b!171575 (= res!142281 (= (bvsub lt!264672 lt!264673) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!171575 (or (= (bvand lt!264672 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264673 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264672 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264672 lt!264673) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171575 (= lt!264673 (remainingBits!0 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!8001 lt!264674)))) ((_ sign_extend 32) (currentByte!8490 (_2!8001 lt!264674))) ((_ sign_extend 32) (currentBit!8485 (_2!8001 lt!264674)))))))

(assert (=> b!171575 (= lt!264672 (remainingBits!0 ((_ sign_extend 32) (size!4030 (buf!4473 bs!64))) ((_ sign_extend 32) (currentByte!8490 bs!64)) ((_ sign_extend 32) (currentBit!8485 bs!64))))))

(declare-fun b!171576 () Bool)

(assert (=> b!171576 (= e!119795 (= (size!4030 (buf!4473 bs!64)) (size!4030 (buf!4473 (_2!8001 lt!264674)))))))

(assert (= (and d!60725 res!142280) b!171575))

(assert (= (and b!171575 res!142281) b!171576))

(declare-fun m!270793 () Bool)

(assert (=> d!60725 m!270793))

(assert (=> d!60725 m!270463))

(assert (=> d!60725 m!270449))

(declare-fun m!270795 () Bool)

(assert (=> b!171575 m!270795))

(assert (=> b!171575 m!270449))

(assert (=> d!60603 d!60725))

(declare-fun d!60727 () Bool)

(assert (=> d!60727 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4030 (buf!4473 bs!64))) ((_ sign_extend 32) (currentByte!8490 bs!64)) ((_ sign_extend 32) (currentBit!8485 bs!64))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4030 (buf!4473 bs!64))) ((_ sign_extend 32) (currentByte!8490 bs!64)) ((_ sign_extend 32) (currentBit!8485 bs!64))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!15095 () Bool)

(assert (= bs!15095 d!60727))

(assert (=> bs!15095 m!270449))

(assert (=> d!60603 d!60727))

(declare-fun d!60729 () Bool)

(declare-fun e!119796 () Bool)

(assert (=> d!60729 e!119796))

(declare-fun res!142282 () Bool)

(assert (=> d!60729 (=> (not res!142282) (not e!119796))))

(declare-fun lt!264681 () (_ BitVec 64))

(declare-fun lt!264680 () (_ BitVec 64))

(declare-fun lt!264678 () (_ BitVec 64))

(assert (=> d!60729 (= res!142282 (= lt!264681 (bvsub lt!264680 lt!264678)))))

(assert (=> d!60729 (or (= (bvand lt!264680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264678 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264680 lt!264678) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60729 (= lt!264678 (remainingBits!0 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!7999 lt!264311)))) ((_ sign_extend 32) (currentByte!8490 (_2!7999 lt!264311))) ((_ sign_extend 32) (currentBit!8485 (_2!7999 lt!264311)))))))

(declare-fun lt!264679 () (_ BitVec 64))

(declare-fun lt!264677 () (_ BitVec 64))

(assert (=> d!60729 (= lt!264680 (bvmul lt!264679 lt!264677))))

(assert (=> d!60729 (or (= lt!264679 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264677 (bvsdiv (bvmul lt!264679 lt!264677) lt!264679)))))

(assert (=> d!60729 (= lt!264677 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60729 (= lt!264679 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!7999 lt!264311)))))))

(assert (=> d!60729 (= lt!264681 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8490 (_2!7999 lt!264311))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8485 (_2!7999 lt!264311)))))))

(assert (=> d!60729 (invariant!0 (currentBit!8485 (_2!7999 lt!264311)) (currentByte!8490 (_2!7999 lt!264311)) (size!4030 (buf!4473 (_2!7999 lt!264311))))))

(assert (=> d!60729 (= (bitIndex!0 (size!4030 (buf!4473 (_2!7999 lt!264311))) (currentByte!8490 (_2!7999 lt!264311)) (currentBit!8485 (_2!7999 lt!264311))) lt!264681)))

(declare-fun b!171577 () Bool)

(declare-fun res!142283 () Bool)

(assert (=> b!171577 (=> (not res!142283) (not e!119796))))

(assert (=> b!171577 (= res!142283 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264681))))

(declare-fun b!171578 () Bool)

(declare-fun lt!264676 () (_ BitVec 64))

(assert (=> b!171578 (= e!119796 (bvsle lt!264681 (bvmul lt!264676 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171578 (or (= lt!264676 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264676 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264676)))))

(assert (=> b!171578 (= lt!264676 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!7999 lt!264311)))))))

(assert (= (and d!60729 res!142282) b!171577))

(assert (= (and b!171577 res!142283) b!171578))

(declare-fun m!270797 () Bool)

(assert (=> d!60729 m!270797))

(declare-fun m!270799 () Bool)

(assert (=> d!60729 m!270799))

(assert (=> b!171361 d!60729))

(declare-fun d!60731 () Bool)

(declare-fun e!119797 () Bool)

(assert (=> d!60731 e!119797))

(declare-fun res!142284 () Bool)

(assert (=> d!60731 (=> (not res!142284) (not e!119797))))

(declare-fun lt!264684 () (_ BitVec 64))

(declare-fun lt!264687 () (_ BitVec 64))

(declare-fun lt!264686 () (_ BitVec 64))

(assert (=> d!60731 (= res!142284 (= lt!264687 (bvsub lt!264686 lt!264684)))))

(assert (=> d!60731 (or (= (bvand lt!264686 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264684 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264686 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264686 lt!264684) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60731 (= lt!264684 (remainingBits!0 ((_ sign_extend 32) (size!4030 (buf!4473 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 32) (currentByte!8490 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) ((_ sign_extend 32) (currentBit!8485 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(declare-fun lt!264685 () (_ BitVec 64))

(declare-fun lt!264683 () (_ BitVec 64))

(assert (=> d!60731 (= lt!264686 (bvmul lt!264685 lt!264683))))

(assert (=> d!60731 (or (= lt!264685 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264683 (bvsdiv (bvmul lt!264685 lt!264683) lt!264685)))))

(assert (=> d!60731 (= lt!264683 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60731 (= lt!264685 ((_ sign_extend 32) (size!4030 (buf!4473 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!60731 (= lt!264687 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8490 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8485 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!60731 (invariant!0 (currentBit!8485 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentByte!8490 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (size!4030 (buf!4473 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!60731 (= (bitIndex!0 (size!4030 (buf!4473 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8490 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!8485 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) lt!264687)))

(declare-fun b!171579 () Bool)

(declare-fun res!142285 () Bool)

(assert (=> b!171579 (=> (not res!142285) (not e!119797))))

(assert (=> b!171579 (= res!142285 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264687))))

(declare-fun b!171580 () Bool)

(declare-fun lt!264682 () (_ BitVec 64))

(assert (=> b!171580 (= e!119797 (bvsle lt!264687 (bvmul lt!264682 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171580 (or (= lt!264682 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264682 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264682)))))

(assert (=> b!171580 (= lt!264682 ((_ sign_extend 32) (size!4030 (buf!4473 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (= (and d!60731 res!142284) b!171579))

(assert (= (and b!171579 res!142285) b!171580))

(declare-fun m!270801 () Bool)

(assert (=> d!60731 m!270801))

(declare-fun m!270803 () Bool)

(assert (=> d!60731 m!270803))

(assert (=> b!171361 d!60731))

(assert (=> b!171332 d!60603))

(declare-fun d!60733 () Bool)

(declare-fun e!119798 () Bool)

(assert (=> d!60733 e!119798))

(declare-fun res!142286 () Bool)

(assert (=> d!60733 (=> (not res!142286) (not e!119798))))

(assert (=> d!60733 (= res!142286 (= (buf!4473 (_2!8001 (increaseBitIndex!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) (buf!4473 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!264688 () Bool)

(assert (=> d!60733 (= lt!264688 (not (= (bvand ((_ sign_extend 24) (select (arr!4960 (buf!4473 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8490 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8485 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!264694 () tuple2!14732)

(assert (=> d!60733 (= lt!264694 (tuple2!14733 (not (= (bvand ((_ sign_extend 24) (select (arr!4960 (buf!4473 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8490 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8485 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)) (_2!8001 (increaseBitIndex!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!60733 (validate_offset_bit!0 ((_ sign_extend 32) (size!4030 (buf!4473 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 32) (currentByte!8490 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) ((_ sign_extend 32) (currentBit!8485 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!60733 (= (readBit!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!264694)))

(declare-fun b!171581 () Bool)

(declare-fun lt!264693 () (_ BitVec 64))

(declare-fun lt!264689 () (_ BitVec 64))

(assert (=> b!171581 (= e!119798 (= (bitIndex!0 (size!4030 (buf!4473 (_2!8001 (increaseBitIndex!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))) (currentByte!8490 (_2!8001 (increaseBitIndex!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) (currentBit!8485 (_2!8001 (increaseBitIndex!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))) (bvadd lt!264693 lt!264689)))))

(assert (=> b!171581 (or (not (= (bvand lt!264693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264689 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264693 lt!264689) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171581 (= lt!264689 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171581 (= lt!264693 (bitIndex!0 (size!4030 (buf!4473 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8490 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!8485 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!264692 () Bool)

(assert (=> b!171581 (= lt!264692 (not (= (bvand ((_ sign_extend 24) (select (arr!4960 (buf!4473 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8490 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8485 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!264691 () Bool)

(assert (=> b!171581 (= lt!264691 (not (= (bvand ((_ sign_extend 24) (select (arr!4960 (buf!4473 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8490 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8485 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!264690 () Bool)

(assert (=> b!171581 (= lt!264690 (not (= (bvand ((_ sign_extend 24) (select (arr!4960 (buf!4473 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8490 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8485 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(assert (= (and d!60733 res!142286) b!171581))

(assert (=> d!60733 m!270407))

(declare-fun m!270805 () Bool)

(assert (=> d!60733 m!270805))

(declare-fun m!270807 () Bool)

(assert (=> d!60733 m!270807))

(declare-fun m!270809 () Bool)

(assert (=> d!60733 m!270809))

(declare-fun m!270811 () Bool)

(assert (=> d!60733 m!270811))

(assert (=> b!171581 m!270807))

(assert (=> b!171581 m!270555))

(declare-fun m!270813 () Bool)

(assert (=> b!171581 m!270813))

(assert (=> b!171581 m!270809))

(assert (=> b!171581 m!270407))

(assert (=> b!171581 m!270805))

(assert (=> b!171362 d!60733))

(assert (=> b!171333 d!60565))

(declare-fun d!60735 () Bool)

(assert (=> d!60735 (= (remainingBits!0 ((_ sign_extend 32) (size!4030 (buf!4473 lt!264119))) ((_ sign_extend 32) (currentByte!8490 lt!264119)) ((_ sign_extend 32) (currentBit!8485 lt!264119))) (bvsub (bvmul ((_ sign_extend 32) (size!4030 (buf!4473 lt!264119))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8490 lt!264119)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8485 lt!264119)))))))

(assert (=> d!60619 d!60735))

(declare-fun d!60737 () Bool)

(assert (=> d!60737 (= (invariant!0 (currentBit!8485 lt!264119) (currentByte!8490 lt!264119) (size!4030 (buf!4473 lt!264119))) (and (bvsge (currentBit!8485 lt!264119) #b00000000000000000000000000000000) (bvslt (currentBit!8485 lt!264119) #b00000000000000000000000000001000) (bvsge (currentByte!8490 lt!264119) #b00000000000000000000000000000000) (or (bvslt (currentByte!8490 lt!264119) (size!4030 (buf!4473 lt!264119))) (and (= (currentBit!8485 lt!264119) #b00000000000000000000000000000000) (= (currentByte!8490 lt!264119) (size!4030 (buf!4473 lt!264119)))))))))

(assert (=> d!60619 d!60737))

(declare-fun d!60739 () Bool)

(declare-fun lt!264695 () tuple2!14732)

(assert (=> d!60739 (= lt!264695 (readBit!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!60739 (= (readBitPure!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (tuple2!14727 (_2!7999 lt!264695) (_1!7999 lt!264695)))))

(declare-fun bs!15096 () Bool)

(assert (= bs!15096 d!60739))

(assert (=> bs!15096 m!270407))

(assert (=> bs!15096 m!270559))

(assert (=> b!171363 d!60739))

(assert (=> b!171432 d!60621))

(declare-fun d!60741 () Bool)

(declare-fun e!119799 () Bool)

(assert (=> d!60741 e!119799))

(declare-fun res!142287 () Bool)

(assert (=> d!60741 (=> (not res!142287) (not e!119799))))

(declare-fun lt!264698 () (_ BitVec 64))

(declare-fun lt!264700 () (_ BitVec 64))

(declare-fun lt!264701 () (_ BitVec 64))

(assert (=> d!60741 (= res!142287 (= lt!264701 (bvsub lt!264700 lt!264698)))))

(assert (=> d!60741 (or (= (bvand lt!264700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264698 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264700 lt!264698) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60741 (= lt!264698 (remainingBits!0 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!8001 lt!264423)))) ((_ sign_extend 32) (currentByte!8490 (_2!8001 lt!264423))) ((_ sign_extend 32) (currentBit!8485 (_2!8001 lt!264423)))))))

(declare-fun lt!264699 () (_ BitVec 64))

(declare-fun lt!264697 () (_ BitVec 64))

(assert (=> d!60741 (= lt!264700 (bvmul lt!264699 lt!264697))))

(assert (=> d!60741 (or (= lt!264699 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264697 (bvsdiv (bvmul lt!264699 lt!264697) lt!264699)))))

(assert (=> d!60741 (= lt!264697 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60741 (= lt!264699 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!8001 lt!264423)))))))

(assert (=> d!60741 (= lt!264701 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8490 (_2!8001 lt!264423))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8485 (_2!8001 lt!264423)))))))

(assert (=> d!60741 (invariant!0 (currentBit!8485 (_2!8001 lt!264423)) (currentByte!8490 (_2!8001 lt!264423)) (size!4030 (buf!4473 (_2!8001 lt!264423))))))

(assert (=> d!60741 (= (bitIndex!0 (size!4030 (buf!4473 (_2!8001 lt!264423))) (currentByte!8490 (_2!8001 lt!264423)) (currentBit!8485 (_2!8001 lt!264423))) lt!264701)))

(declare-fun b!171582 () Bool)

(declare-fun res!142288 () Bool)

(assert (=> b!171582 (=> (not res!142288) (not e!119799))))

(assert (=> b!171582 (= res!142288 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264701))))

(declare-fun b!171583 () Bool)

(declare-fun lt!264696 () (_ BitVec 64))

(assert (=> b!171583 (= e!119799 (bvsle lt!264701 (bvmul lt!264696 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171583 (or (= lt!264696 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264696 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264696)))))

(assert (=> b!171583 (= lt!264696 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!8001 lt!264423)))))))

(assert (= (and d!60741 res!142287) b!171582))

(assert (= (and b!171582 res!142288) b!171583))

(declare-fun m!270815 () Bool)

(assert (=> d!60741 m!270815))

(declare-fun m!270817 () Bool)

(assert (=> d!60741 m!270817))

(assert (=> b!171427 d!60741))

(assert (=> b!171427 d!60621))

(assert (=> d!60621 d!60599))

(assert (=> d!60621 d!60637))

(assert (=> d!60585 d!60723))

(assert (=> d!60585 d!60621))

(assert (=> d!60623 d!60635))

(declare-fun d!60743 () Bool)

(declare-fun e!119800 () Bool)

(assert (=> d!60743 e!119800))

(declare-fun res!142289 () Bool)

(assert (=> d!60743 (=> (not res!142289) (not e!119800))))

(declare-fun lt!264704 () (_ BitVec 64))

(declare-fun lt!264707 () (_ BitVec 64))

(declare-fun lt!264706 () (_ BitVec 64))

(assert (=> d!60743 (= res!142289 (= lt!264707 (bvsub lt!264706 lt!264704)))))

(assert (=> d!60743 (or (= (bvand lt!264706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264704 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264706 lt!264704) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60743 (= lt!264704 (remainingBits!0 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!8001 (increaseBitIndex!0 bs!64))))) ((_ sign_extend 32) (currentByte!8490 (_2!8001 (increaseBitIndex!0 bs!64)))) ((_ sign_extend 32) (currentBit!8485 (_2!8001 (increaseBitIndex!0 bs!64))))))))

(declare-fun lt!264705 () (_ BitVec 64))

(declare-fun lt!264703 () (_ BitVec 64))

(assert (=> d!60743 (= lt!264706 (bvmul lt!264705 lt!264703))))

(assert (=> d!60743 (or (= lt!264705 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264703 (bvsdiv (bvmul lt!264705 lt!264703) lt!264705)))))

(assert (=> d!60743 (= lt!264703 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60743 (= lt!264705 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!8001 (increaseBitIndex!0 bs!64))))))))

(assert (=> d!60743 (= lt!264707 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8490 (_2!8001 (increaseBitIndex!0 bs!64)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8485 (_2!8001 (increaseBitIndex!0 bs!64))))))))

(assert (=> d!60743 (invariant!0 (currentBit!8485 (_2!8001 (increaseBitIndex!0 bs!64))) (currentByte!8490 (_2!8001 (increaseBitIndex!0 bs!64))) (size!4030 (buf!4473 (_2!8001 (increaseBitIndex!0 bs!64)))))))

(assert (=> d!60743 (= (bitIndex!0 (size!4030 (buf!4473 (_2!8001 (increaseBitIndex!0 bs!64)))) (currentByte!8490 (_2!8001 (increaseBitIndex!0 bs!64))) (currentBit!8485 (_2!8001 (increaseBitIndex!0 bs!64)))) lt!264707)))

(declare-fun b!171584 () Bool)

(declare-fun res!142290 () Bool)

(assert (=> b!171584 (=> (not res!142290) (not e!119800))))

(assert (=> b!171584 (= res!142290 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264707))))

(declare-fun b!171585 () Bool)

(declare-fun lt!264702 () (_ BitVec 64))

(assert (=> b!171585 (= e!119800 (bvsle lt!264707 (bvmul lt!264702 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171585 (or (= lt!264702 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264702 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264702)))))

(assert (=> b!171585 (= lt!264702 ((_ sign_extend 32) (size!4030 (buf!4473 (_2!8001 (increaseBitIndex!0 bs!64))))))))

(assert (= (and d!60743 res!142289) b!171584))

(assert (= (and b!171584 res!142290) b!171585))

(declare-fun m!270819 () Bool)

(assert (=> d!60743 m!270819))

(declare-fun m!270821 () Bool)

(assert (=> d!60743 m!270821))

(assert (=> b!171359 d!60743))

(assert (=> b!171359 d!60725))

(assert (=> b!171359 d!60621))

(assert (=> d!60617 d!60729))

(assert (=> d!60617 d!60731))

(push 1)

(assert (not d!60725))

(assert (not d!60731))

(assert (not b!171547))

(assert (not d!60733))

(assert (not b!171575))

(assert (not d!60739))

(assert (not b!171550))

(assert (not d!60729))

(assert (not d!60743))

(assert (not b!171559))

(assert (not d!60721))

(assert (not b!171558))

(assert (not d!60713))

(assert (not b!171560))

(assert (not b!171561))

(assert (not d!60741))

(assert (not b!171581))

(assert (not d!60719))

(assert (not b!171562))

(assert (not d!60717))

(assert (not d!60715))

(assert (not d!60727))

(assert (not d!60723))

(assert (not b!171548))

(assert (not b!171568))

(assert (not b!171549))

(assert (not d!60711))

(check-sat)

(pop 1)

(push 1)

(check-sat)

