; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37868 () Bool)

(assert start!37868)

(declare-fun res!142062 () Bool)

(declare-fun e!119591 () Bool)

(assert (=> start!37868 (=> (not res!142062) (not e!119591))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37868 (= res!142062 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37868 e!119591))

(assert (=> start!37868 true))

(declare-datatypes ((array!9108 0))(
  ( (array!9109 (arr!4961 (Array (_ BitVec 32) (_ BitVec 8))) (size!4031 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7200 0))(
  ( (BitStream!7201 (buf!4474 array!9108) (currentByte!8491 (_ BitVec 32)) (currentBit!8486 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7200)

(declare-fun e!119593 () Bool)

(declare-fun inv!12 (BitStream!7200) Bool)

(assert (=> start!37868 (and (inv!12 bs!64) e!119593)))

(declare-fun b!171277 () Bool)

(declare-fun res!142061 () Bool)

(assert (=> b!171277 (=> (not res!142061) (not e!119591))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!171277 (= res!142061 (validate_offset_bits!1 ((_ sign_extend 32) (size!4031 (buf!4474 bs!64))) ((_ sign_extend 32) (currentByte!8491 bs!64)) ((_ sign_extend 32) (currentBit!8486 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!171278 () Bool)

(declare-fun lt!264086 () Bool)

(declare-datatypes ((tuple2!14728 0))(
  ( (tuple2!14729 (_1!7997 BitStream!7200) (_2!7997 Bool)) )
))
(declare-fun lt!264089 () tuple2!14728)

(declare-fun lt!264087 () tuple2!14728)

(assert (=> b!171278 (= e!119591 (or (not (= (_2!7997 lt!264089) (and (not lt!264086) (_2!7997 lt!264087)))) (and (not lt!264086) (not (= (_1!7997 lt!264089) (_1!7997 lt!264087))))))))

(declare-fun lt!264088 () tuple2!14728)

(declare-fun expected!82 () Bool)

(assert (=> b!171278 (= lt!264086 (not (= (_2!7997 lt!264088) expected!82)))))

(declare-fun checkBitsLoopPure!0 (BitStream!7200 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14728)

(declare-fun withMovedBitIndex!0 (BitStream!7200 (_ BitVec 64)) BitStream!7200)

(assert (=> b!171278 (= lt!264087 (checkBitsLoopPure!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283 expected!82 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)))))

(declare-fun readBitPure!0 (BitStream!7200) tuple2!14728)

(assert (=> b!171278 (= lt!264088 (readBitPure!0 bs!64))))

(assert (=> b!171278 (= lt!264089 (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235))))

(declare-fun b!171279 () Bool)

(declare-fun array_inv!3772 (array!9108) Bool)

(assert (=> b!171279 (= e!119593 (array_inv!3772 (buf!4474 bs!64)))))

(assert (= (and start!37868 res!142062) b!171277))

(assert (= (and b!171277 res!142061) b!171278))

(assert (= start!37868 b!171279))

(declare-fun m!270417 () Bool)

(assert (=> start!37868 m!270417))

(declare-fun m!270419 () Bool)

(assert (=> b!171277 m!270419))

(declare-fun m!270421 () Bool)

(assert (=> b!171278 m!270421))

(assert (=> b!171278 m!270421))

(declare-fun m!270423 () Bool)

(assert (=> b!171278 m!270423))

(declare-fun m!270425 () Bool)

(assert (=> b!171278 m!270425))

(declare-fun m!270427 () Bool)

(assert (=> b!171278 m!270427))

(declare-fun m!270429 () Bool)

(assert (=> b!171279 m!270429))

(check-sat (not b!171277) (not b!171278) (not b!171279) (not start!37868))
(check-sat)
(get-model)

(declare-fun d!60541 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!60541 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4031 (buf!4474 bs!64))) ((_ sign_extend 32) (currentByte!8491 bs!64)) ((_ sign_extend 32) (currentBit!8486 bs!64)) (bvsub nBits!283 from!235)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4031 (buf!4474 bs!64))) ((_ sign_extend 32) (currentByte!8491 bs!64)) ((_ sign_extend 32) (currentBit!8486 bs!64))) (bvsub nBits!283 from!235)))))

(declare-fun bs!15070 () Bool)

(assert (= bs!15070 d!60541))

(declare-fun m!270445 () Bool)

(assert (=> bs!15070 m!270445))

(assert (=> b!171277 d!60541))

(declare-datatypes ((tuple2!14734 0))(
  ( (tuple2!14735 (_1!8000 Bool) (_2!8000 BitStream!7200)) )
))
(declare-fun lt!264104 () tuple2!14734)

(declare-fun d!60543 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!7200 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14734)

(assert (=> d!60543 (= lt!264104 (checkBitsLoop!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283 expected!82 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)))))

(assert (=> d!60543 (= (checkBitsLoopPure!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283 expected!82 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)) (tuple2!14729 (_2!8000 lt!264104) (_1!8000 lt!264104)))))

(declare-fun bs!15073 () Bool)

(assert (= bs!15073 d!60543))

(assert (=> bs!15073 m!270421))

(declare-fun m!270451 () Bool)

(assert (=> bs!15073 m!270451))

(assert (=> b!171278 d!60543))

(declare-fun d!60553 () Bool)

(declare-fun e!119608 () Bool)

(assert (=> d!60553 e!119608))

(declare-fun res!142074 () Bool)

(assert (=> d!60553 (=> (not res!142074) (not e!119608))))

(declare-fun lt!264122 () (_ BitVec 64))

(declare-fun lt!264121 () BitStream!7200)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!60553 (= res!142074 (= (bvadd lt!264122 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4031 (buf!4474 lt!264121)) (currentByte!8491 lt!264121) (currentBit!8486 lt!264121))))))

(assert (=> d!60553 (or (not (= (bvand lt!264122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264122 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60553 (= lt!264122 (bitIndex!0 (size!4031 (buf!4474 bs!64)) (currentByte!8491 bs!64) (currentBit!8486 bs!64)))))

(declare-datatypes ((Unit!12245 0))(
  ( (Unit!12246) )
))
(declare-datatypes ((tuple2!14740 0))(
  ( (tuple2!14741 (_1!8003 Unit!12245) (_2!8003 BitStream!7200)) )
))
(declare-fun moveBitIndex!0 (BitStream!7200 (_ BitVec 64)) tuple2!14740)

(assert (=> d!60553 (= lt!264121 (_2!8003 (moveBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7200 (_ BitVec 64)) Bool)

(assert (=> d!60553 (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!60553 (= (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) lt!264121)))

(declare-fun b!171294 () Bool)

(assert (=> b!171294 (= e!119608 (= (size!4031 (buf!4474 bs!64)) (size!4031 (buf!4474 lt!264121))))))

(assert (= (and d!60553 res!142074) b!171294))

(declare-fun m!270469 () Bool)

(assert (=> d!60553 m!270469))

(declare-fun m!270471 () Bool)

(assert (=> d!60553 m!270471))

(declare-fun m!270473 () Bool)

(assert (=> d!60553 m!270473))

(declare-fun m!270475 () Bool)

(assert (=> d!60553 m!270475))

(assert (=> b!171278 d!60553))

(declare-fun d!60567 () Bool)

(declare-fun lt!264133 () tuple2!14734)

(declare-fun readBit!0 (BitStream!7200) tuple2!14734)

(assert (=> d!60567 (= lt!264133 (readBit!0 bs!64))))

(assert (=> d!60567 (= (readBitPure!0 bs!64) (tuple2!14729 (_2!8000 lt!264133) (_1!8000 lt!264133)))))

(declare-fun bs!15080 () Bool)

(assert (= bs!15080 d!60567))

(declare-fun m!270481 () Bool)

(assert (=> bs!15080 m!270481))

(assert (=> b!171278 d!60567))

(declare-fun lt!264134 () tuple2!14734)

(declare-fun d!60571 () Bool)

(assert (=> d!60571 (= lt!264134 (checkBitsLoop!0 bs!64 nBits!283 expected!82 from!235))))

(assert (=> d!60571 (= (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235) (tuple2!14729 (_2!8000 lt!264134) (_1!8000 lt!264134)))))

(declare-fun bs!15081 () Bool)

(assert (= bs!15081 d!60571))

(declare-fun m!270483 () Bool)

(assert (=> bs!15081 m!270483))

(assert (=> b!171278 d!60571))

(declare-fun d!60573 () Bool)

(assert (=> d!60573 (= (array_inv!3772 (buf!4474 bs!64)) (bvsge (size!4031 (buf!4474 bs!64)) #b00000000000000000000000000000000))))

(assert (=> b!171279 d!60573))

(declare-fun d!60575 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!60575 (= (inv!12 bs!64) (invariant!0 (currentBit!8486 bs!64) (currentByte!8491 bs!64) (size!4031 (buf!4474 bs!64))))))

(declare-fun bs!15082 () Bool)

(assert (= bs!15082 d!60575))

(declare-fun m!270493 () Bool)

(assert (=> bs!15082 m!270493))

(assert (=> start!37868 d!60575))

(check-sat (not d!60575) (not d!60553) (not d!60571) (not d!60543) (not d!60541) (not d!60567))
(check-sat)
(get-model)

(declare-fun d!60583 () Bool)

(declare-fun e!119618 () Bool)

(assert (=> d!60583 e!119618))

(declare-fun res!142080 () Bool)

(assert (=> d!60583 (=> (not res!142080) (not e!119618))))

(declare-fun increaseBitIndex!0 (BitStream!7200) tuple2!14740)

(assert (=> d!60583 (= res!142080 (= (buf!4474 (_2!8003 (increaseBitIndex!0 bs!64))) (buf!4474 bs!64)))))

(declare-fun lt!264161 () Bool)

(assert (=> d!60583 (= lt!264161 (not (= (bvand ((_ sign_extend 24) (select (arr!4961 (buf!4474 bs!64)) (currentByte!8491 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8486 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!264160 () tuple2!14734)

(assert (=> d!60583 (= lt!264160 (tuple2!14735 (not (= (bvand ((_ sign_extend 24) (select (arr!4961 (buf!4474 bs!64)) (currentByte!8491 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8486 bs!64)))) #b00000000000000000000000000000000)) (_2!8003 (increaseBitIndex!0 bs!64))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!60583 (validate_offset_bit!0 ((_ sign_extend 32) (size!4031 (buf!4474 bs!64))) ((_ sign_extend 32) (currentByte!8491 bs!64)) ((_ sign_extend 32) (currentBit!8486 bs!64)))))

(assert (=> d!60583 (= (readBit!0 bs!64) lt!264160)))

(declare-fun lt!264158 () (_ BitVec 64))

(declare-fun b!171300 () Bool)

(declare-fun lt!264155 () (_ BitVec 64))

(assert (=> b!171300 (= e!119618 (= (bitIndex!0 (size!4031 (buf!4474 (_2!8003 (increaseBitIndex!0 bs!64)))) (currentByte!8491 (_2!8003 (increaseBitIndex!0 bs!64))) (currentBit!8486 (_2!8003 (increaseBitIndex!0 bs!64)))) (bvadd lt!264158 lt!264155)))))

(assert (=> b!171300 (or (not (= (bvand lt!264158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264155 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264158 lt!264155) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171300 (= lt!264155 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171300 (= lt!264158 (bitIndex!0 (size!4031 (buf!4474 bs!64)) (currentByte!8491 bs!64) (currentBit!8486 bs!64)))))

(declare-fun lt!264159 () Bool)

(assert (=> b!171300 (= lt!264159 (not (= (bvand ((_ sign_extend 24) (select (arr!4961 (buf!4474 bs!64)) (currentByte!8491 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8486 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!264156 () Bool)

(assert (=> b!171300 (= lt!264156 (not (= (bvand ((_ sign_extend 24) (select (arr!4961 (buf!4474 bs!64)) (currentByte!8491 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8486 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!264157 () Bool)

(assert (=> b!171300 (= lt!264157 (not (= (bvand ((_ sign_extend 24) (select (arr!4961 (buf!4474 bs!64)) (currentByte!8491 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8486 bs!64)))) #b00000000000000000000000000000000)))))

(assert (= (and d!60583 res!142080) b!171300))

(declare-fun m!270499 () Bool)

(assert (=> d!60583 m!270499))

(declare-fun m!270501 () Bool)

(assert (=> d!60583 m!270501))

(declare-fun m!270503 () Bool)

(assert (=> d!60583 m!270503))

(declare-fun m!270505 () Bool)

(assert (=> d!60583 m!270505))

(assert (=> b!171300 m!270501))

(assert (=> b!171300 m!270471))

(assert (=> b!171300 m!270503))

(declare-fun m!270507 () Bool)

(assert (=> b!171300 m!270507))

(assert (=> b!171300 m!270499))

(assert (=> d!60567 d!60583))

(declare-fun d!60587 () Bool)

(declare-fun e!119621 () Bool)

(assert (=> d!60587 e!119621))

(declare-fun res!142085 () Bool)

(assert (=> d!60587 (=> (not res!142085) (not e!119621))))

(declare-fun lt!264176 () (_ BitVec 64))

(declare-fun lt!264175 () (_ BitVec 64))

(declare-fun lt!264177 () (_ BitVec 64))

(assert (=> d!60587 (= res!142085 (= lt!264177 (bvsub lt!264176 lt!264175)))))

(assert (=> d!60587 (or (= (bvand lt!264176 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264175 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264176 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264176 lt!264175) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60587 (= lt!264175 (remainingBits!0 ((_ sign_extend 32) (size!4031 (buf!4474 lt!264121))) ((_ sign_extend 32) (currentByte!8491 lt!264121)) ((_ sign_extend 32) (currentBit!8486 lt!264121))))))

(declare-fun lt!264179 () (_ BitVec 64))

(declare-fun lt!264178 () (_ BitVec 64))

(assert (=> d!60587 (= lt!264176 (bvmul lt!264179 lt!264178))))

(assert (=> d!60587 (or (= lt!264179 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264178 (bvsdiv (bvmul lt!264179 lt!264178) lt!264179)))))

(assert (=> d!60587 (= lt!264178 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60587 (= lt!264179 ((_ sign_extend 32) (size!4031 (buf!4474 lt!264121))))))

(assert (=> d!60587 (= lt!264177 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8491 lt!264121)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8486 lt!264121))))))

(assert (=> d!60587 (invariant!0 (currentBit!8486 lt!264121) (currentByte!8491 lt!264121) (size!4031 (buf!4474 lt!264121)))))

(assert (=> d!60587 (= (bitIndex!0 (size!4031 (buf!4474 lt!264121)) (currentByte!8491 lt!264121) (currentBit!8486 lt!264121)) lt!264177)))

(declare-fun b!171305 () Bool)

(declare-fun res!142086 () Bool)

(assert (=> b!171305 (=> (not res!142086) (not e!119621))))

(assert (=> b!171305 (= res!142086 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264177))))

(declare-fun b!171306 () Bool)

(declare-fun lt!264174 () (_ BitVec 64))

(assert (=> b!171306 (= e!119621 (bvsle lt!264177 (bvmul lt!264174 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171306 (or (= lt!264174 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264174 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264174)))))

(assert (=> b!171306 (= lt!264174 ((_ sign_extend 32) (size!4031 (buf!4474 lt!264121))))))

(assert (= (and d!60587 res!142085) b!171305))

(assert (= (and b!171305 res!142086) b!171306))

(declare-fun m!270509 () Bool)

(assert (=> d!60587 m!270509))

(declare-fun m!270511 () Bool)

(assert (=> d!60587 m!270511))

(assert (=> d!60553 d!60587))

(declare-fun d!60589 () Bool)

(declare-fun e!119622 () Bool)

(assert (=> d!60589 e!119622))

(declare-fun res!142087 () Bool)

(assert (=> d!60589 (=> (not res!142087) (not e!119622))))

(declare-fun lt!264182 () (_ BitVec 64))

(declare-fun lt!264183 () (_ BitVec 64))

(declare-fun lt!264181 () (_ BitVec 64))

(assert (=> d!60589 (= res!142087 (= lt!264183 (bvsub lt!264182 lt!264181)))))

(assert (=> d!60589 (or (= (bvand lt!264182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264181 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264182 lt!264181) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60589 (= lt!264181 (remainingBits!0 ((_ sign_extend 32) (size!4031 (buf!4474 bs!64))) ((_ sign_extend 32) (currentByte!8491 bs!64)) ((_ sign_extend 32) (currentBit!8486 bs!64))))))

(declare-fun lt!264185 () (_ BitVec 64))

(declare-fun lt!264184 () (_ BitVec 64))

(assert (=> d!60589 (= lt!264182 (bvmul lt!264185 lt!264184))))

(assert (=> d!60589 (or (= lt!264185 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264184 (bvsdiv (bvmul lt!264185 lt!264184) lt!264185)))))

(assert (=> d!60589 (= lt!264184 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60589 (= lt!264185 ((_ sign_extend 32) (size!4031 (buf!4474 bs!64))))))

(assert (=> d!60589 (= lt!264183 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8491 bs!64)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8486 bs!64))))))

(assert (=> d!60589 (invariant!0 (currentBit!8486 bs!64) (currentByte!8491 bs!64) (size!4031 (buf!4474 bs!64)))))

(assert (=> d!60589 (= (bitIndex!0 (size!4031 (buf!4474 bs!64)) (currentByte!8491 bs!64) (currentBit!8486 bs!64)) lt!264183)))

(declare-fun b!171307 () Bool)

(declare-fun res!142088 () Bool)

(assert (=> b!171307 (=> (not res!142088) (not e!119622))))

(assert (=> b!171307 (= res!142088 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264183))))

(declare-fun b!171308 () Bool)

(declare-fun lt!264180 () (_ BitVec 64))

(assert (=> b!171308 (= e!119622 (bvsle lt!264183 (bvmul lt!264180 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171308 (or (= lt!264180 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264180 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264180)))))

(assert (=> b!171308 (= lt!264180 ((_ sign_extend 32) (size!4031 (buf!4474 bs!64))))))

(assert (= (and d!60589 res!142087) b!171307))

(assert (= (and b!171307 res!142088) b!171308))

(assert (=> d!60589 m!270445))

(assert (=> d!60589 m!270493))

(assert (=> d!60553 d!60589))

(declare-fun d!60591 () Bool)

(declare-fun lt!264252 () (_ BitVec 32))

(assert (=> d!60591 (= lt!264252 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!264257 () (_ BitVec 32))

(assert (=> d!60591 (= lt!264257 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!119649 () Bool)

(assert (=> d!60591 e!119649))

(declare-fun res!142112 () Bool)

(assert (=> d!60591 (=> (not res!142112) (not e!119649))))

(assert (=> d!60591 (= res!142112 (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!12249 () Unit!12245)

(declare-fun Unit!12250 () Unit!12245)

(declare-fun Unit!12251 () Unit!12245)

(assert (=> d!60591 (= (moveBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!8486 bs!64) lt!264252) #b00000000000000000000000000000000) (tuple2!14741 Unit!12249 (BitStream!7201 (buf!4474 bs!64) (bvsub (bvadd (currentByte!8491 bs!64) lt!264257) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!264252 (currentBit!8486 bs!64)))) (ite (bvsge (bvadd (currentBit!8486 bs!64) lt!264252) #b00000000000000000000000000001000) (tuple2!14741 Unit!12250 (BitStream!7201 (buf!4474 bs!64) (bvadd (currentByte!8491 bs!64) lt!264257 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8486 bs!64) lt!264252) #b00000000000000000000000000001000))) (tuple2!14741 Unit!12251 (BitStream!7201 (buf!4474 bs!64) (bvadd (currentByte!8491 bs!64) lt!264257) (bvadd (currentBit!8486 bs!64) lt!264252))))))))

(declare-fun b!171343 () Bool)

(declare-fun e!119650 () Bool)

(assert (=> b!171343 (= e!119649 e!119650)))

(declare-fun res!142111 () Bool)

(assert (=> b!171343 (=> (not res!142111) (not e!119650))))

(declare-fun lt!264253 () (_ BitVec 64))

(declare-fun lt!264256 () tuple2!14740)

(assert (=> b!171343 (= res!142111 (= (bvadd lt!264253 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4031 (buf!4474 (_2!8003 lt!264256))) (currentByte!8491 (_2!8003 lt!264256)) (currentBit!8486 (_2!8003 lt!264256)))))))

(assert (=> b!171343 (or (not (= (bvand lt!264253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264253 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171343 (= lt!264253 (bitIndex!0 (size!4031 (buf!4474 bs!64)) (currentByte!8491 bs!64) (currentBit!8486 bs!64)))))

(declare-fun lt!264255 () (_ BitVec 32))

(declare-fun lt!264254 () (_ BitVec 32))

(declare-fun Unit!12252 () Unit!12245)

(declare-fun Unit!12253 () Unit!12245)

(declare-fun Unit!12254 () Unit!12245)

(assert (=> b!171343 (= lt!264256 (ite (bvslt (bvadd (currentBit!8486 bs!64) lt!264254) #b00000000000000000000000000000000) (tuple2!14741 Unit!12252 (BitStream!7201 (buf!4474 bs!64) (bvsub (bvadd (currentByte!8491 bs!64) lt!264255) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!264254 (currentBit!8486 bs!64)))) (ite (bvsge (bvadd (currentBit!8486 bs!64) lt!264254) #b00000000000000000000000000001000) (tuple2!14741 Unit!12253 (BitStream!7201 (buf!4474 bs!64) (bvadd (currentByte!8491 bs!64) lt!264255 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8486 bs!64) lt!264254) #b00000000000000000000000000001000))) (tuple2!14741 Unit!12254 (BitStream!7201 (buf!4474 bs!64) (bvadd (currentByte!8491 bs!64) lt!264255) (bvadd (currentBit!8486 bs!64) lt!264254))))))))

(assert (=> b!171343 (= lt!264254 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171343 (= lt!264255 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!171344 () Bool)

(assert (=> b!171344 (= e!119650 (and (= (size!4031 (buf!4474 bs!64)) (size!4031 (buf!4474 (_2!8003 lt!264256)))) (= (buf!4474 bs!64) (buf!4474 (_2!8003 lt!264256)))))))

(assert (= (and d!60591 res!142112) b!171343))

(assert (= (and b!171343 res!142111) b!171344))

(assert (=> d!60591 m!270475))

(declare-fun m!270531 () Bool)

(assert (=> b!171343 m!270531))

(assert (=> b!171343 m!270471))

(assert (=> d!60553 d!60591))

(declare-fun d!60605 () Bool)

(declare-fun res!142123 () Bool)

(declare-fun e!119661 () Bool)

(assert (=> d!60605 (=> (not res!142123) (not e!119661))))

(assert (=> d!60605 (= res!142123 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4031 (buf!4474 bs!64)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4031 (buf!4474 bs!64)))))))))

(assert (=> d!60605 (= (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) e!119661)))

(declare-fun b!171356 () Bool)

(declare-fun lt!264284 () (_ BitVec 64))

(assert (=> b!171356 (= e!119661 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264284) (bvsle lt!264284 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4031 (buf!4474 bs!64)))))))))

(assert (=> b!171356 (= lt!264284 (bvadd (bitIndex!0 (size!4031 (buf!4474 bs!64)) (currentByte!8491 bs!64) (currentBit!8486 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!60605 res!142123) b!171356))

(assert (=> b!171356 m!270471))

(assert (=> d!60553 d!60605))

(declare-fun d!60611 () Bool)

(assert (=> d!60611 (= (remainingBits!0 ((_ sign_extend 32) (size!4031 (buf!4474 bs!64))) ((_ sign_extend 32) (currentByte!8491 bs!64)) ((_ sign_extend 32) (currentBit!8486 bs!64))) (bvsub (bvmul ((_ sign_extend 32) (size!4031 (buf!4474 bs!64))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8491 bs!64)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8486 bs!64)))))))

(assert (=> d!60541 d!60611))

(declare-fun b!171405 () Bool)

(declare-fun lt!264392 () (_ BitVec 64))

(declare-fun e!119695 () Bool)

(declare-fun lt!264391 () tuple2!14734)

(assert (=> b!171405 (= e!119695 (= (bvsub lt!264392 from!235) (bitIndex!0 (size!4031 (buf!4474 (_2!8000 lt!264391))) (currentByte!8491 (_2!8000 lt!264391)) (currentBit!8486 (_2!8000 lt!264391)))))))

(assert (=> b!171405 (or (= (bvand lt!264392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264392 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264389 () (_ BitVec 64))

(assert (=> b!171405 (= lt!264392 (bvadd lt!264389 nBits!283))))

(assert (=> b!171405 (or (not (= (bvand lt!264389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264389 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171405 (= lt!264389 (bitIndex!0 (size!4031 (buf!4474 bs!64)) (currentByte!8491 bs!64) (currentBit!8486 bs!64)))))

(declare-fun b!171406 () Bool)

(declare-fun e!119697 () tuple2!14734)

(declare-fun lt!264386 () tuple2!14734)

(assert (=> b!171406 (= e!119697 (tuple2!14735 false (_2!8000 lt!264386)))))

(declare-fun b!171407 () Bool)

(declare-fun lt!264393 () tuple2!14734)

(assert (=> b!171407 (= lt!264393 (checkBitsLoop!0 (_2!8000 lt!264386) nBits!283 expected!82 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!264384 () Unit!12245)

(declare-fun lt!264394 () Unit!12245)

(assert (=> b!171407 (= lt!264384 lt!264394)))

(declare-fun lt!264388 () (_ BitVec 64))

(declare-fun lt!264387 () (_ BitVec 64))

(assert (=> b!171407 (validate_offset_bits!1 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8000 lt!264386)))) ((_ sign_extend 32) (currentByte!8491 (_2!8000 lt!264386))) ((_ sign_extend 32) (currentBit!8486 (_2!8000 lt!264386))) (bvsub lt!264388 lt!264387))))

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!7200 BitStream!7200 (_ BitVec 64) (_ BitVec 64)) Unit!12245)

(assert (=> b!171407 (= lt!264394 (validateOffsetBitsIneqLemma!0 bs!64 (_2!8000 lt!264386) lt!264388 lt!264387))))

(assert (=> b!171407 (= lt!264387 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171407 (= lt!264388 (bvsub nBits!283 from!235))))

(assert (=> b!171407 (= e!119697 (tuple2!14735 (_1!8000 lt!264393) (_2!8000 lt!264393)))))

(declare-fun b!171409 () Bool)

(declare-fun e!119694 () tuple2!14734)

(assert (=> b!171409 (= e!119694 e!119697)))

(assert (=> b!171409 (= lt!264386 (readBit!0 bs!64))))

(declare-fun c!8980 () Bool)

(assert (=> b!171409 (= c!8980 (not (= (_1!8000 lt!264386) expected!82)))))

(declare-fun b!171410 () Bool)

(declare-fun e!119696 () Bool)

(assert (=> b!171410 (= e!119696 (= expected!82 (_2!7997 (readBitPure!0 bs!64))))))

(declare-fun b!171411 () Bool)

(declare-fun res!142159 () Bool)

(declare-fun e!119693 () Bool)

(assert (=> b!171411 (=> (not res!142159) (not e!119693))))

(assert (=> b!171411 (= res!142159 (and (= (buf!4474 bs!64) (buf!4474 (_2!8000 lt!264391))) (or (not (= nBits!283 from!235)) (_1!8000 lt!264391))))))

(declare-fun b!171408 () Bool)

(assert (=> b!171408 (= e!119693 e!119696)))

(declare-fun res!142161 () Bool)

(assert (=> b!171408 (=> res!142161 e!119696)))

(assert (=> b!171408 (= res!142161 (or (not (_1!8000 lt!264391)) (bvsge from!235 nBits!283)))))

(declare-fun d!60613 () Bool)

(assert (=> d!60613 e!119693))

(declare-fun res!142162 () Bool)

(assert (=> d!60613 (=> (not res!142162) (not e!119693))))

(declare-fun lt!264385 () (_ BitVec 64))

(assert (=> d!60613 (= res!142162 (bvsge (bvsub lt!264385 from!235) (bitIndex!0 (size!4031 (buf!4474 (_2!8000 lt!264391))) (currentByte!8491 (_2!8000 lt!264391)) (currentBit!8486 (_2!8000 lt!264391)))))))

(assert (=> d!60613 (or (= (bvand lt!264385 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264385 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264385 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264390 () (_ BitVec 64))

(assert (=> d!60613 (= lt!264385 (bvadd lt!264390 nBits!283))))

(assert (=> d!60613 (or (not (= (bvand lt!264390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264390 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60613 (= lt!264390 (bitIndex!0 (size!4031 (buf!4474 bs!64)) (currentByte!8491 bs!64) (currentBit!8486 bs!64)))))

(assert (=> d!60613 (= lt!264391 e!119694)))

(declare-fun c!8981 () Bool)

(assert (=> d!60613 (= c!8981 (= from!235 nBits!283))))

(assert (=> d!60613 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!60613 (= (checkBitsLoop!0 bs!64 nBits!283 expected!82 from!235) lt!264391)))

(declare-fun b!171412 () Bool)

(declare-fun res!142160 () Bool)

(assert (=> b!171412 (=> (not res!142160) (not e!119693))))

(assert (=> b!171412 (= res!142160 e!119695)))

(declare-fun res!142163 () Bool)

(assert (=> b!171412 (=> res!142163 e!119695)))

(assert (=> b!171412 (= res!142163 (not (_1!8000 lt!264391)))))

(declare-fun b!171413 () Bool)

(assert (=> b!171413 (= e!119694 (tuple2!14735 true bs!64))))

(assert (= (and d!60613 c!8981) b!171413))

(assert (= (and d!60613 (not c!8981)) b!171409))

(assert (= (and b!171409 c!8980) b!171406))

(assert (= (and b!171409 (not c!8980)) b!171407))

(assert (= (and d!60613 res!142162) b!171411))

(assert (= (and b!171411 res!142159) b!171412))

(assert (= (and b!171412 (not res!142163)) b!171405))

(assert (= (and b!171412 res!142160) b!171408))

(assert (= (and b!171408 (not res!142161)) b!171410))

(assert (=> b!171410 m!270425))

(declare-fun m!270567 () Bool)

(assert (=> d!60613 m!270567))

(assert (=> d!60613 m!270471))

(declare-fun m!270569 () Bool)

(assert (=> b!171407 m!270569))

(declare-fun m!270571 () Bool)

(assert (=> b!171407 m!270571))

(declare-fun m!270573 () Bool)

(assert (=> b!171407 m!270573))

(assert (=> b!171405 m!270567))

(assert (=> b!171405 m!270471))

(assert (=> b!171409 m!270481))

(assert (=> d!60571 d!60613))

(declare-fun lt!264402 () tuple2!14734)

(declare-fun lt!264403 () (_ BitVec 64))

(declare-fun b!171414 () Bool)

(declare-fun e!119700 () Bool)

(assert (=> b!171414 (= e!119700 (= (bvsub lt!264403 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)) (bitIndex!0 (size!4031 (buf!4474 (_2!8000 lt!264402))) (currentByte!8491 (_2!8000 lt!264402)) (currentBit!8486 (_2!8000 lt!264402)))))))

(assert (=> b!171414 (or (= (bvand lt!264403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264403 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264400 () (_ BitVec 64))

(assert (=> b!171414 (= lt!264403 (bvadd lt!264400 nBits!283))))

(assert (=> b!171414 (or (not (= (bvand lt!264400 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264400 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264400 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171414 (= lt!264400 (bitIndex!0 (size!4031 (buf!4474 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8491 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!8486 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!171415 () Bool)

(declare-fun e!119702 () tuple2!14734)

(declare-fun lt!264397 () tuple2!14734)

(assert (=> b!171415 (= e!119702 (tuple2!14735 false (_2!8000 lt!264397)))))

(declare-fun lt!264404 () tuple2!14734)

(declare-fun b!171416 () Bool)

(assert (=> b!171416 (= lt!264404 (checkBitsLoop!0 (_2!8000 lt!264397) nBits!283 expected!82 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!264395 () Unit!12245)

(declare-fun lt!264405 () Unit!12245)

(assert (=> b!171416 (= lt!264395 lt!264405)))

(declare-fun lt!264399 () (_ BitVec 64))

(declare-fun lt!264398 () (_ BitVec 64))

(assert (=> b!171416 (validate_offset_bits!1 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8000 lt!264397)))) ((_ sign_extend 32) (currentByte!8491 (_2!8000 lt!264397))) ((_ sign_extend 32) (currentBit!8486 (_2!8000 lt!264397))) (bvsub lt!264399 lt!264398))))

(assert (=> b!171416 (= lt!264405 (validateOffsetBitsIneqLemma!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) (_2!8000 lt!264397) lt!264399 lt!264398))))

(assert (=> b!171416 (= lt!264398 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171416 (= lt!264399 (bvsub nBits!283 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)))))

(assert (=> b!171416 (= e!119702 (tuple2!14735 (_1!8000 lt!264404) (_2!8000 lt!264404)))))

(declare-fun b!171418 () Bool)

(declare-fun e!119699 () tuple2!14734)

(assert (=> b!171418 (= e!119699 e!119702)))

(assert (=> b!171418 (= lt!264397 (readBit!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun c!8982 () Bool)

(assert (=> b!171418 (= c!8982 (not (= (_1!8000 lt!264397) expected!82)))))

(declare-fun b!171419 () Bool)

(declare-fun e!119701 () Bool)

(assert (=> b!171419 (= e!119701 (= expected!82 (_2!7997 (readBitPure!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(declare-fun b!171420 () Bool)

(declare-fun res!142164 () Bool)

(declare-fun e!119698 () Bool)

(assert (=> b!171420 (=> (not res!142164) (not e!119698))))

(assert (=> b!171420 (= res!142164 (and (= (buf!4474 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (buf!4474 (_2!8000 lt!264402))) (or (not (= nBits!283 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235))) (_1!8000 lt!264402))))))

(declare-fun b!171417 () Bool)

(assert (=> b!171417 (= e!119698 e!119701)))

(declare-fun res!142166 () Bool)

(assert (=> b!171417 (=> res!142166 e!119701)))

(assert (=> b!171417 (= res!142166 (or (not (_1!8000 lt!264402)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235) nBits!283)))))

(declare-fun d!60631 () Bool)

(assert (=> d!60631 e!119698))

(declare-fun res!142167 () Bool)

(assert (=> d!60631 (=> (not res!142167) (not e!119698))))

(declare-fun lt!264396 () (_ BitVec 64))

(assert (=> d!60631 (= res!142167 (bvsge (bvsub lt!264396 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)) (bitIndex!0 (size!4031 (buf!4474 (_2!8000 lt!264402))) (currentByte!8491 (_2!8000 lt!264402)) (currentBit!8486 (_2!8000 lt!264402)))))))

(assert (=> d!60631 (or (= (bvand lt!264396 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264396 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264396 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264401 () (_ BitVec 64))

(assert (=> d!60631 (= lt!264396 (bvadd lt!264401 nBits!283))))

(assert (=> d!60631 (or (not (= (bvand lt!264401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264401 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60631 (= lt!264401 (bitIndex!0 (size!4031 (buf!4474 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8491 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!8486 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!60631 (= lt!264402 e!119699)))

(declare-fun c!8983 () Bool)

(assert (=> d!60631 (= c!8983 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235) nBits!283))))

(assert (=> d!60631 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!60631 (= (checkBitsLoop!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283 expected!82 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)) lt!264402)))

(declare-fun b!171421 () Bool)

(declare-fun res!142165 () Bool)

(assert (=> b!171421 (=> (not res!142165) (not e!119698))))

(assert (=> b!171421 (= res!142165 e!119700)))

(declare-fun res!142168 () Bool)

(assert (=> b!171421 (=> res!142168 e!119700)))

(assert (=> b!171421 (= res!142168 (not (_1!8000 lt!264402)))))

(declare-fun b!171422 () Bool)

(assert (=> b!171422 (= e!119699 (tuple2!14735 true (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!60631 c!8983) b!171422))

(assert (= (and d!60631 (not c!8983)) b!171418))

(assert (= (and b!171418 c!8982) b!171415))

(assert (= (and b!171418 (not c!8982)) b!171416))

(assert (= (and d!60631 res!142167) b!171420))

(assert (= (and b!171420 res!142164) b!171421))

(assert (= (and b!171421 (not res!142168)) b!171414))

(assert (= (and b!171421 res!142165) b!171417))

(assert (= (and b!171417 (not res!142166)) b!171419))

(assert (=> b!171419 m!270421))

(declare-fun m!270575 () Bool)

(assert (=> b!171419 m!270575))

(declare-fun m!270577 () Bool)

(assert (=> d!60631 m!270577))

(declare-fun m!270579 () Bool)

(assert (=> d!60631 m!270579))

(declare-fun m!270581 () Bool)

(assert (=> b!171416 m!270581))

(declare-fun m!270583 () Bool)

(assert (=> b!171416 m!270583))

(assert (=> b!171416 m!270421))

(declare-fun m!270585 () Bool)

(assert (=> b!171416 m!270585))

(assert (=> b!171414 m!270577))

(assert (=> b!171414 m!270579))

(assert (=> b!171418 m!270421))

(declare-fun m!270587 () Bool)

(assert (=> b!171418 m!270587))

(assert (=> d!60543 d!60631))

(declare-fun d!60633 () Bool)

(assert (=> d!60633 (= (invariant!0 (currentBit!8486 bs!64) (currentByte!8491 bs!64) (size!4031 (buf!4474 bs!64))) (and (bvsge (currentBit!8486 bs!64) #b00000000000000000000000000000000) (bvslt (currentBit!8486 bs!64) #b00000000000000000000000000001000) (bvsge (currentByte!8491 bs!64) #b00000000000000000000000000000000) (or (bvslt (currentByte!8491 bs!64) (size!4031 (buf!4474 bs!64))) (and (= (currentBit!8486 bs!64) #b00000000000000000000000000000000) (= (currentByte!8491 bs!64) (size!4031 (buf!4474 bs!64)))))))))

(assert (=> d!60575 d!60633))

(check-sat (not b!171416) (not d!60583) (not b!171418) (not d!60587) (not b!171409) (not b!171414) (not d!60631) (not d!60613) (not b!171419) (not d!60589) (not b!171407) (not b!171405) (not b!171300) (not b!171410) (not b!171356) (not b!171343) (not d!60591))
(check-sat)
(get-model)

(assert (=> d!60589 d!60611))

(assert (=> d!60589 d!60633))

(declare-fun d!60643 () Bool)

(declare-fun e!119732 () Bool)

(assert (=> d!60643 e!119732))

(declare-fun res!142198 () Bool)

(assert (=> d!60643 (=> (not res!142198) (not e!119732))))

(declare-fun lt!264473 () (_ BitVec 64))

(declare-fun lt!264472 () (_ BitVec 64))

(declare-fun lt!264474 () (_ BitVec 64))

(assert (=> d!60643 (= res!142198 (= lt!264474 (bvsub lt!264473 lt!264472)))))

(assert (=> d!60643 (or (= (bvand lt!264473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264472 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264473 lt!264472) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60643 (= lt!264472 (remainingBits!0 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8000 lt!264402)))) ((_ sign_extend 32) (currentByte!8491 (_2!8000 lt!264402))) ((_ sign_extend 32) (currentBit!8486 (_2!8000 lt!264402)))))))

(declare-fun lt!264476 () (_ BitVec 64))

(declare-fun lt!264475 () (_ BitVec 64))

(assert (=> d!60643 (= lt!264473 (bvmul lt!264476 lt!264475))))

(assert (=> d!60643 (or (= lt!264476 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264475 (bvsdiv (bvmul lt!264476 lt!264475) lt!264476)))))

(assert (=> d!60643 (= lt!264475 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60643 (= lt!264476 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8000 lt!264402)))))))

(assert (=> d!60643 (= lt!264474 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8491 (_2!8000 lt!264402))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8486 (_2!8000 lt!264402)))))))

(assert (=> d!60643 (invariant!0 (currentBit!8486 (_2!8000 lt!264402)) (currentByte!8491 (_2!8000 lt!264402)) (size!4031 (buf!4474 (_2!8000 lt!264402))))))

(assert (=> d!60643 (= (bitIndex!0 (size!4031 (buf!4474 (_2!8000 lt!264402))) (currentByte!8491 (_2!8000 lt!264402)) (currentBit!8486 (_2!8000 lt!264402))) lt!264474)))

(declare-fun b!171469 () Bool)

(declare-fun res!142199 () Bool)

(assert (=> b!171469 (=> (not res!142199) (not e!119732))))

(assert (=> b!171469 (= res!142199 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264474))))

(declare-fun b!171470 () Bool)

(declare-fun lt!264471 () (_ BitVec 64))

(assert (=> b!171470 (= e!119732 (bvsle lt!264474 (bvmul lt!264471 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171470 (or (= lt!264471 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264471 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264471)))))

(assert (=> b!171470 (= lt!264471 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8000 lt!264402)))))))

(assert (= (and d!60643 res!142198) b!171469))

(assert (= (and b!171469 res!142199) b!171470))

(declare-fun m!270613 () Bool)

(assert (=> d!60643 m!270613))

(declare-fun m!270615 () Bool)

(assert (=> d!60643 m!270615))

(assert (=> b!171414 d!60643))

(declare-fun d!60645 () Bool)

(declare-fun e!119733 () Bool)

(assert (=> d!60645 e!119733))

(declare-fun res!142200 () Bool)

(assert (=> d!60645 (=> (not res!142200) (not e!119733))))

(declare-fun lt!264480 () (_ BitVec 64))

(declare-fun lt!264478 () (_ BitVec 64))

(declare-fun lt!264479 () (_ BitVec 64))

(assert (=> d!60645 (= res!142200 (= lt!264480 (bvsub lt!264479 lt!264478)))))

(assert (=> d!60645 (or (= (bvand lt!264479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264478 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264479 lt!264478) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60645 (= lt!264478 (remainingBits!0 ((_ sign_extend 32) (size!4031 (buf!4474 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 32) (currentByte!8491 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) ((_ sign_extend 32) (currentBit!8486 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(declare-fun lt!264482 () (_ BitVec 64))

(declare-fun lt!264481 () (_ BitVec 64))

(assert (=> d!60645 (= lt!264479 (bvmul lt!264482 lt!264481))))

(assert (=> d!60645 (or (= lt!264482 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264481 (bvsdiv (bvmul lt!264482 lt!264481) lt!264482)))))

(assert (=> d!60645 (= lt!264481 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60645 (= lt!264482 ((_ sign_extend 32) (size!4031 (buf!4474 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!60645 (= lt!264480 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8491 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8486 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!60645 (invariant!0 (currentBit!8486 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentByte!8491 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (size!4031 (buf!4474 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!60645 (= (bitIndex!0 (size!4031 (buf!4474 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8491 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!8486 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) lt!264480)))

(declare-fun b!171471 () Bool)

(declare-fun res!142201 () Bool)

(assert (=> b!171471 (=> (not res!142201) (not e!119733))))

(assert (=> b!171471 (= res!142201 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264480))))

(declare-fun b!171472 () Bool)

(declare-fun lt!264477 () (_ BitVec 64))

(assert (=> b!171472 (= e!119733 (bvsle lt!264480 (bvmul lt!264477 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171472 (or (= lt!264477 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264477 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264477)))))

(assert (=> b!171472 (= lt!264477 ((_ sign_extend 32) (size!4031 (buf!4474 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (= (and d!60645 res!142200) b!171471))

(assert (= (and b!171471 res!142201) b!171472))

(declare-fun m!270617 () Bool)

(assert (=> d!60645 m!270617))

(declare-fun m!270619 () Bool)

(assert (=> d!60645 m!270619))

(assert (=> b!171414 d!60645))

(declare-fun d!60647 () Bool)

(declare-fun e!119734 () Bool)

(assert (=> d!60647 e!119734))

(declare-fun res!142202 () Bool)

(assert (=> d!60647 (=> (not res!142202) (not e!119734))))

(declare-fun lt!264486 () (_ BitVec 64))

(declare-fun lt!264485 () (_ BitVec 64))

(declare-fun lt!264484 () (_ BitVec 64))

(assert (=> d!60647 (= res!142202 (= lt!264486 (bvsub lt!264485 lt!264484)))))

(assert (=> d!60647 (or (= (bvand lt!264485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264484 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264485 lt!264484) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60647 (= lt!264484 (remainingBits!0 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8000 lt!264391)))) ((_ sign_extend 32) (currentByte!8491 (_2!8000 lt!264391))) ((_ sign_extend 32) (currentBit!8486 (_2!8000 lt!264391)))))))

(declare-fun lt!264488 () (_ BitVec 64))

(declare-fun lt!264487 () (_ BitVec 64))

(assert (=> d!60647 (= lt!264485 (bvmul lt!264488 lt!264487))))

(assert (=> d!60647 (or (= lt!264488 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264487 (bvsdiv (bvmul lt!264488 lt!264487) lt!264488)))))

(assert (=> d!60647 (= lt!264487 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60647 (= lt!264488 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8000 lt!264391)))))))

(assert (=> d!60647 (= lt!264486 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8491 (_2!8000 lt!264391))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8486 (_2!8000 lt!264391)))))))

(assert (=> d!60647 (invariant!0 (currentBit!8486 (_2!8000 lt!264391)) (currentByte!8491 (_2!8000 lt!264391)) (size!4031 (buf!4474 (_2!8000 lt!264391))))))

(assert (=> d!60647 (= (bitIndex!0 (size!4031 (buf!4474 (_2!8000 lt!264391))) (currentByte!8491 (_2!8000 lt!264391)) (currentBit!8486 (_2!8000 lt!264391))) lt!264486)))

(declare-fun b!171473 () Bool)

(declare-fun res!142203 () Bool)

(assert (=> b!171473 (=> (not res!142203) (not e!119734))))

(assert (=> b!171473 (= res!142203 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264486))))

(declare-fun b!171474 () Bool)

(declare-fun lt!264483 () (_ BitVec 64))

(assert (=> b!171474 (= e!119734 (bvsle lt!264486 (bvmul lt!264483 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171474 (or (= lt!264483 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264483 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264483)))))

(assert (=> b!171474 (= lt!264483 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8000 lt!264391)))))))

(assert (= (and d!60647 res!142202) b!171473))

(assert (= (and b!171473 res!142203) b!171474))

(declare-fun m!270621 () Bool)

(assert (=> d!60647 m!270621))

(declare-fun m!270623 () Bool)

(assert (=> d!60647 m!270623))

(assert (=> b!171405 d!60647))

(assert (=> b!171405 d!60589))

(assert (=> d!60591 d!60605))

(declare-fun b!171475 () Bool)

(declare-fun lt!264496 () tuple2!14734)

(declare-fun lt!264497 () (_ BitVec 64))

(declare-fun e!119737 () Bool)

(assert (=> b!171475 (= e!119737 (= (bvsub lt!264497 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!4031 (buf!4474 (_2!8000 lt!264496))) (currentByte!8491 (_2!8000 lt!264496)) (currentBit!8486 (_2!8000 lt!264496)))))))

(assert (=> b!171475 (or (= (bvand lt!264497 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264497 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264497 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264494 () (_ BitVec 64))

(assert (=> b!171475 (= lt!264497 (bvadd lt!264494 nBits!283))))

(assert (=> b!171475 (or (not (= (bvand lt!264494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264494 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171475 (= lt!264494 (bitIndex!0 (size!4031 (buf!4474 (_2!8000 lt!264397))) (currentByte!8491 (_2!8000 lt!264397)) (currentBit!8486 (_2!8000 lt!264397))))))

(declare-fun b!171476 () Bool)

(declare-fun e!119739 () tuple2!14734)

(declare-fun lt!264491 () tuple2!14734)

(assert (=> b!171476 (= e!119739 (tuple2!14735 false (_2!8000 lt!264491)))))

(declare-fun b!171477 () Bool)

(declare-fun lt!264498 () tuple2!14734)

(assert (=> b!171477 (= lt!264498 (checkBitsLoop!0 (_2!8000 lt!264491) nBits!283 expected!82 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!264489 () Unit!12245)

(declare-fun lt!264499 () Unit!12245)

(assert (=> b!171477 (= lt!264489 lt!264499)))

(declare-fun lt!264493 () (_ BitVec 64))

(declare-fun lt!264492 () (_ BitVec 64))

(assert (=> b!171477 (validate_offset_bits!1 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8000 lt!264491)))) ((_ sign_extend 32) (currentByte!8491 (_2!8000 lt!264491))) ((_ sign_extend 32) (currentBit!8486 (_2!8000 lt!264491))) (bvsub lt!264493 lt!264492))))

(assert (=> b!171477 (= lt!264499 (validateOffsetBitsIneqLemma!0 (_2!8000 lt!264397) (_2!8000 lt!264491) lt!264493 lt!264492))))

(assert (=> b!171477 (= lt!264492 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171477 (= lt!264493 (bvsub nBits!283 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!171477 (= e!119739 (tuple2!14735 (_1!8000 lt!264498) (_2!8000 lt!264498)))))

(declare-fun b!171479 () Bool)

(declare-fun e!119736 () tuple2!14734)

(assert (=> b!171479 (= e!119736 e!119739)))

(assert (=> b!171479 (= lt!264491 (readBit!0 (_2!8000 lt!264397)))))

(declare-fun c!8992 () Bool)

(assert (=> b!171479 (= c!8992 (not (= (_1!8000 lt!264491) expected!82)))))

(declare-fun b!171480 () Bool)

(declare-fun e!119738 () Bool)

(assert (=> b!171480 (= e!119738 (= expected!82 (_2!7997 (readBitPure!0 (_2!8000 lt!264397)))))))

(declare-fun b!171481 () Bool)

(declare-fun res!142204 () Bool)

(declare-fun e!119735 () Bool)

(assert (=> b!171481 (=> (not res!142204) (not e!119735))))

(assert (=> b!171481 (= res!142204 (and (= (buf!4474 (_2!8000 lt!264397)) (buf!4474 (_2!8000 lt!264496))) (or (not (= nBits!283 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001))) (_1!8000 lt!264496))))))

(declare-fun b!171478 () Bool)

(assert (=> b!171478 (= e!119735 e!119738)))

(declare-fun res!142206 () Bool)

(assert (=> b!171478 (=> res!142206 e!119738)))

(assert (=> b!171478 (= res!142206 (or (not (_1!8000 lt!264496)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283)))))

(declare-fun d!60649 () Bool)

(assert (=> d!60649 e!119735))

(declare-fun res!142207 () Bool)

(assert (=> d!60649 (=> (not res!142207) (not e!119735))))

(declare-fun lt!264490 () (_ BitVec 64))

(assert (=> d!60649 (= res!142207 (bvsge (bvsub lt!264490 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!4031 (buf!4474 (_2!8000 lt!264496))) (currentByte!8491 (_2!8000 lt!264496)) (currentBit!8486 (_2!8000 lt!264496)))))))

(assert (=> d!60649 (or (= (bvand lt!264490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264490 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264495 () (_ BitVec 64))

(assert (=> d!60649 (= lt!264490 (bvadd lt!264495 nBits!283))))

(assert (=> d!60649 (or (not (= (bvand lt!264495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264495 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60649 (= lt!264495 (bitIndex!0 (size!4031 (buf!4474 (_2!8000 lt!264397))) (currentByte!8491 (_2!8000 lt!264397)) (currentBit!8486 (_2!8000 lt!264397))))))

(assert (=> d!60649 (= lt!264496 e!119736)))

(declare-fun c!8993 () Bool)

(assert (=> d!60649 (= c!8993 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283))))

(assert (=> d!60649 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!60649 (= (checkBitsLoop!0 (_2!8000 lt!264397) nBits!283 expected!82 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!264496)))

(declare-fun b!171482 () Bool)

(declare-fun res!142205 () Bool)

(assert (=> b!171482 (=> (not res!142205) (not e!119735))))

(assert (=> b!171482 (= res!142205 e!119737)))

(declare-fun res!142208 () Bool)

(assert (=> b!171482 (=> res!142208 e!119737)))

(assert (=> b!171482 (= res!142208 (not (_1!8000 lt!264496)))))

(declare-fun b!171483 () Bool)

(assert (=> b!171483 (= e!119736 (tuple2!14735 true (_2!8000 lt!264397)))))

(assert (= (and d!60649 c!8993) b!171483))

(assert (= (and d!60649 (not c!8993)) b!171479))

(assert (= (and b!171479 c!8992) b!171476))

(assert (= (and b!171479 (not c!8992)) b!171477))

(assert (= (and d!60649 res!142207) b!171481))

(assert (= (and b!171481 res!142204) b!171482))

(assert (= (and b!171482 (not res!142208)) b!171475))

(assert (= (and b!171482 res!142205) b!171478))

(assert (= (and b!171478 (not res!142206)) b!171480))

(declare-fun m!270625 () Bool)

(assert (=> b!171480 m!270625))

(declare-fun m!270627 () Bool)

(assert (=> d!60649 m!270627))

(declare-fun m!270629 () Bool)

(assert (=> d!60649 m!270629))

(declare-fun m!270631 () Bool)

(assert (=> b!171477 m!270631))

(declare-fun m!270633 () Bool)

(assert (=> b!171477 m!270633))

(declare-fun m!270635 () Bool)

(assert (=> b!171477 m!270635))

(assert (=> b!171475 m!270627))

(assert (=> b!171475 m!270629))

(declare-fun m!270637 () Bool)

(assert (=> b!171479 m!270637))

(assert (=> b!171416 d!60649))

(declare-fun d!60651 () Bool)

(assert (=> d!60651 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8000 lt!264397)))) ((_ sign_extend 32) (currentByte!8491 (_2!8000 lt!264397))) ((_ sign_extend 32) (currentBit!8486 (_2!8000 lt!264397))) (bvsub lt!264399 lt!264398)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8000 lt!264397)))) ((_ sign_extend 32) (currentByte!8491 (_2!8000 lt!264397))) ((_ sign_extend 32) (currentBit!8486 (_2!8000 lt!264397)))) (bvsub lt!264399 lt!264398)))))

(declare-fun bs!15085 () Bool)

(assert (= bs!15085 d!60651))

(declare-fun m!270639 () Bool)

(assert (=> bs!15085 m!270639))

(assert (=> b!171416 d!60651))

(declare-fun d!60653 () Bool)

(declare-fun e!119742 () Bool)

(assert (=> d!60653 e!119742))

(declare-fun res!142211 () Bool)

(assert (=> d!60653 (=> (not res!142211) (not e!119742))))

(assert (=> d!60653 (= res!142211 (or (= (bvand lt!264399 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264398 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264399 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264399 lt!264398) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!264502 () Unit!12245)

(declare-fun choose!27 (BitStream!7200 BitStream!7200 (_ BitVec 64) (_ BitVec 64)) Unit!12245)

(assert (=> d!60653 (= lt!264502 (choose!27 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) (_2!8000 lt!264397) lt!264399 lt!264398))))

(assert (=> d!60653 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264398) (bvsle lt!264398 lt!264399))))

(assert (=> d!60653 (= (validateOffsetBitsIneqLemma!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) (_2!8000 lt!264397) lt!264399 lt!264398) lt!264502)))

(declare-fun b!171486 () Bool)

(assert (=> b!171486 (= e!119742 (validate_offset_bits!1 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8000 lt!264397)))) ((_ sign_extend 32) (currentByte!8491 (_2!8000 lt!264397))) ((_ sign_extend 32) (currentBit!8486 (_2!8000 lt!264397))) (bvsub lt!264399 lt!264398)))))

(assert (= (and d!60653 res!142211) b!171486))

(assert (=> d!60653 m!270421))

(declare-fun m!270641 () Bool)

(assert (=> d!60653 m!270641))

(assert (=> b!171486 m!270583))

(assert (=> b!171416 d!60653))

(declare-fun b!171487 () Bool)

(declare-fun lt!264510 () tuple2!14734)

(declare-fun lt!264511 () (_ BitVec 64))

(declare-fun e!119745 () Bool)

(assert (=> b!171487 (= e!119745 (= (bvsub lt!264511 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!4031 (buf!4474 (_2!8000 lt!264510))) (currentByte!8491 (_2!8000 lt!264510)) (currentBit!8486 (_2!8000 lt!264510)))))))

(assert (=> b!171487 (or (= (bvand lt!264511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264511 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264508 () (_ BitVec 64))

(assert (=> b!171487 (= lt!264511 (bvadd lt!264508 nBits!283))))

(assert (=> b!171487 (or (not (= (bvand lt!264508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264508 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171487 (= lt!264508 (bitIndex!0 (size!4031 (buf!4474 (_2!8000 lt!264386))) (currentByte!8491 (_2!8000 lt!264386)) (currentBit!8486 (_2!8000 lt!264386))))))

(declare-fun b!171488 () Bool)

(declare-fun e!119747 () tuple2!14734)

(declare-fun lt!264505 () tuple2!14734)

(assert (=> b!171488 (= e!119747 (tuple2!14735 false (_2!8000 lt!264505)))))

(declare-fun b!171489 () Bool)

(declare-fun lt!264512 () tuple2!14734)

(assert (=> b!171489 (= lt!264512 (checkBitsLoop!0 (_2!8000 lt!264505) nBits!283 expected!82 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!264503 () Unit!12245)

(declare-fun lt!264513 () Unit!12245)

(assert (=> b!171489 (= lt!264503 lt!264513)))

(declare-fun lt!264507 () (_ BitVec 64))

(declare-fun lt!264506 () (_ BitVec 64))

(assert (=> b!171489 (validate_offset_bits!1 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8000 lt!264505)))) ((_ sign_extend 32) (currentByte!8491 (_2!8000 lt!264505))) ((_ sign_extend 32) (currentBit!8486 (_2!8000 lt!264505))) (bvsub lt!264507 lt!264506))))

(assert (=> b!171489 (= lt!264513 (validateOffsetBitsIneqLemma!0 (_2!8000 lt!264386) (_2!8000 lt!264505) lt!264507 lt!264506))))

(assert (=> b!171489 (= lt!264506 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171489 (= lt!264507 (bvsub nBits!283 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!171489 (= e!119747 (tuple2!14735 (_1!8000 lt!264512) (_2!8000 lt!264512)))))

(declare-fun b!171491 () Bool)

(declare-fun e!119744 () tuple2!14734)

(assert (=> b!171491 (= e!119744 e!119747)))

(assert (=> b!171491 (= lt!264505 (readBit!0 (_2!8000 lt!264386)))))

(declare-fun c!8994 () Bool)

(assert (=> b!171491 (= c!8994 (not (= (_1!8000 lt!264505) expected!82)))))

(declare-fun b!171492 () Bool)

(declare-fun e!119746 () Bool)

(assert (=> b!171492 (= e!119746 (= expected!82 (_2!7997 (readBitPure!0 (_2!8000 lt!264386)))))))

(declare-fun b!171493 () Bool)

(declare-fun res!142212 () Bool)

(declare-fun e!119743 () Bool)

(assert (=> b!171493 (=> (not res!142212) (not e!119743))))

(assert (=> b!171493 (= res!142212 (and (= (buf!4474 (_2!8000 lt!264386)) (buf!4474 (_2!8000 lt!264510))) (or (not (= nBits!283 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001))) (_1!8000 lt!264510))))))

(declare-fun b!171490 () Bool)

(assert (=> b!171490 (= e!119743 e!119746)))

(declare-fun res!142214 () Bool)

(assert (=> b!171490 (=> res!142214 e!119746)))

(assert (=> b!171490 (= res!142214 (or (not (_1!8000 lt!264510)) (bvsge (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283)))))

(declare-fun d!60655 () Bool)

(assert (=> d!60655 e!119743))

(declare-fun res!142215 () Bool)

(assert (=> d!60655 (=> (not res!142215) (not e!119743))))

(declare-fun lt!264504 () (_ BitVec 64))

(assert (=> d!60655 (= res!142215 (bvsge (bvsub lt!264504 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!4031 (buf!4474 (_2!8000 lt!264510))) (currentByte!8491 (_2!8000 lt!264510)) (currentBit!8486 (_2!8000 lt!264510)))))))

(assert (=> d!60655 (or (= (bvand lt!264504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264504 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264509 () (_ BitVec 64))

(assert (=> d!60655 (= lt!264504 (bvadd lt!264509 nBits!283))))

(assert (=> d!60655 (or (not (= (bvand lt!264509 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264509 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264509 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60655 (= lt!264509 (bitIndex!0 (size!4031 (buf!4474 (_2!8000 lt!264386))) (currentByte!8491 (_2!8000 lt!264386)) (currentBit!8486 (_2!8000 lt!264386))))))

(assert (=> d!60655 (= lt!264510 e!119744)))

(declare-fun c!8995 () Bool)

(assert (=> d!60655 (= c!8995 (= (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283))))

(assert (=> d!60655 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!60655 (= (checkBitsLoop!0 (_2!8000 lt!264386) nBits!283 expected!82 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!264510)))

(declare-fun b!171494 () Bool)

(declare-fun res!142213 () Bool)

(assert (=> b!171494 (=> (not res!142213) (not e!119743))))

(assert (=> b!171494 (= res!142213 e!119745)))

(declare-fun res!142216 () Bool)

(assert (=> b!171494 (=> res!142216 e!119745)))

(assert (=> b!171494 (= res!142216 (not (_1!8000 lt!264510)))))

(declare-fun b!171495 () Bool)

(assert (=> b!171495 (= e!119744 (tuple2!14735 true (_2!8000 lt!264386)))))

(assert (= (and d!60655 c!8995) b!171495))

(assert (= (and d!60655 (not c!8995)) b!171491))

(assert (= (and b!171491 c!8994) b!171488))

(assert (= (and b!171491 (not c!8994)) b!171489))

(assert (= (and d!60655 res!142215) b!171493))

(assert (= (and b!171493 res!142212) b!171494))

(assert (= (and b!171494 (not res!142216)) b!171487))

(assert (= (and b!171494 res!142213) b!171490))

(assert (= (and b!171490 (not res!142214)) b!171492))

(declare-fun m!270643 () Bool)

(assert (=> b!171492 m!270643))

(declare-fun m!270645 () Bool)

(assert (=> d!60655 m!270645))

(declare-fun m!270647 () Bool)

(assert (=> d!60655 m!270647))

(declare-fun m!270649 () Bool)

(assert (=> b!171489 m!270649))

(declare-fun m!270651 () Bool)

(assert (=> b!171489 m!270651))

(declare-fun m!270653 () Bool)

(assert (=> b!171489 m!270653))

(assert (=> b!171487 m!270645))

(assert (=> b!171487 m!270647))

(declare-fun m!270655 () Bool)

(assert (=> b!171491 m!270655))

(assert (=> b!171407 d!60655))

(declare-fun d!60657 () Bool)

(assert (=> d!60657 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8000 lt!264386)))) ((_ sign_extend 32) (currentByte!8491 (_2!8000 lt!264386))) ((_ sign_extend 32) (currentBit!8486 (_2!8000 lt!264386))) (bvsub lt!264388 lt!264387)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8000 lt!264386)))) ((_ sign_extend 32) (currentByte!8491 (_2!8000 lt!264386))) ((_ sign_extend 32) (currentBit!8486 (_2!8000 lt!264386)))) (bvsub lt!264388 lt!264387)))))

(declare-fun bs!15086 () Bool)

(assert (= bs!15086 d!60657))

(declare-fun m!270657 () Bool)

(assert (=> bs!15086 m!270657))

(assert (=> b!171407 d!60657))

(declare-fun d!60659 () Bool)

(declare-fun e!119748 () Bool)

(assert (=> d!60659 e!119748))

(declare-fun res!142217 () Bool)

(assert (=> d!60659 (=> (not res!142217) (not e!119748))))

(assert (=> d!60659 (= res!142217 (or (= (bvand lt!264388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264387 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264388 lt!264387) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!264514 () Unit!12245)

(assert (=> d!60659 (= lt!264514 (choose!27 bs!64 (_2!8000 lt!264386) lt!264388 lt!264387))))

(assert (=> d!60659 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264387) (bvsle lt!264387 lt!264388))))

(assert (=> d!60659 (= (validateOffsetBitsIneqLemma!0 bs!64 (_2!8000 lt!264386) lt!264388 lt!264387) lt!264514)))

(declare-fun b!171496 () Bool)

(assert (=> b!171496 (= e!119748 (validate_offset_bits!1 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8000 lt!264386)))) ((_ sign_extend 32) (currentByte!8491 (_2!8000 lt!264386))) ((_ sign_extend 32) (currentBit!8486 (_2!8000 lt!264386))) (bvsub lt!264388 lt!264387)))))

(assert (= (and d!60659 res!142217) b!171496))

(declare-fun m!270659 () Bool)

(assert (=> d!60659 m!270659))

(assert (=> b!171496 m!270571))

(assert (=> b!171407 d!60659))

(declare-fun d!60661 () Bool)

(declare-fun e!119749 () Bool)

(assert (=> d!60661 e!119749))

(declare-fun res!142218 () Bool)

(assert (=> d!60661 (=> (not res!142218) (not e!119749))))

(assert (=> d!60661 (= res!142218 (= (buf!4474 (_2!8003 (increaseBitIndex!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) (buf!4474 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!264521 () Bool)

(assert (=> d!60661 (= lt!264521 (not (= (bvand ((_ sign_extend 24) (select (arr!4961 (buf!4474 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8491 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8486 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!264520 () tuple2!14734)

(assert (=> d!60661 (= lt!264520 (tuple2!14735 (not (= (bvand ((_ sign_extend 24) (select (arr!4961 (buf!4474 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8491 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8486 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)) (_2!8003 (increaseBitIndex!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!60661 (validate_offset_bit!0 ((_ sign_extend 32) (size!4031 (buf!4474 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 32) (currentByte!8491 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) ((_ sign_extend 32) (currentBit!8486 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!60661 (= (readBit!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!264520)))

(declare-fun b!171497 () Bool)

(declare-fun lt!264515 () (_ BitVec 64))

(declare-fun lt!264518 () (_ BitVec 64))

(assert (=> b!171497 (= e!119749 (= (bitIndex!0 (size!4031 (buf!4474 (_2!8003 (increaseBitIndex!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))) (currentByte!8491 (_2!8003 (increaseBitIndex!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) (currentBit!8486 (_2!8003 (increaseBitIndex!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))) (bvadd lt!264518 lt!264515)))))

(assert (=> b!171497 (or (not (= (bvand lt!264518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264515 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264518 lt!264515) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171497 (= lt!264515 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171497 (= lt!264518 (bitIndex!0 (size!4031 (buf!4474 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8491 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!8486 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!264519 () Bool)

(assert (=> b!171497 (= lt!264519 (not (= (bvand ((_ sign_extend 24) (select (arr!4961 (buf!4474 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8491 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8486 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!264516 () Bool)

(assert (=> b!171497 (= lt!264516 (not (= (bvand ((_ sign_extend 24) (select (arr!4961 (buf!4474 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8491 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8486 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!264517 () Bool)

(assert (=> b!171497 (= lt!264517 (not (= (bvand ((_ sign_extend 24) (select (arr!4961 (buf!4474 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8491 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8486 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(assert (= (and d!60661 res!142218) b!171497))

(assert (=> d!60661 m!270421))

(declare-fun m!270661 () Bool)

(assert (=> d!60661 m!270661))

(declare-fun m!270663 () Bool)

(assert (=> d!60661 m!270663))

(declare-fun m!270665 () Bool)

(assert (=> d!60661 m!270665))

(declare-fun m!270667 () Bool)

(assert (=> d!60661 m!270667))

(assert (=> b!171497 m!270663))

(assert (=> b!171497 m!270579))

(assert (=> b!171497 m!270665))

(declare-fun m!270669 () Bool)

(assert (=> b!171497 m!270669))

(assert (=> b!171497 m!270421))

(assert (=> b!171497 m!270661))

(assert (=> b!171418 d!60661))

(assert (=> b!171409 d!60583))

(declare-fun d!60663 () Bool)

(declare-fun lt!264522 () tuple2!14734)

(assert (=> d!60663 (= lt!264522 (readBit!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!60663 (= (readBitPure!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (tuple2!14729 (_2!8000 lt!264522) (_1!8000 lt!264522)))))

(declare-fun bs!15087 () Bool)

(assert (= bs!15087 d!60663))

(assert (=> bs!15087 m!270421))

(assert (=> bs!15087 m!270587))

(assert (=> b!171419 d!60663))

(assert (=> b!171356 d!60589))

(assert (=> b!171410 d!60567))

(declare-fun d!60665 () Bool)

(declare-fun e!119752 () Bool)

(assert (=> d!60665 e!119752))

(declare-fun res!142224 () Bool)

(assert (=> d!60665 (=> (not res!142224) (not e!119752))))

(declare-fun lt!264533 () (_ BitVec 64))

(declare-fun lt!264536 () (_ BitVec 64))

(declare-fun lt!264537 () tuple2!14740)

(assert (=> d!60665 (= res!142224 (= (bvadd lt!264536 lt!264533) (bitIndex!0 (size!4031 (buf!4474 (_2!8003 lt!264537))) (currentByte!8491 (_2!8003 lt!264537)) (currentBit!8486 (_2!8003 lt!264537)))))))

(assert (=> d!60665 (or (not (= (bvand lt!264536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264533 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264536 lt!264533) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60665 (= lt!264533 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!60665 (= lt!264536 (bitIndex!0 (size!4031 (buf!4474 bs!64)) (currentByte!8491 bs!64) (currentBit!8486 bs!64)))))

(declare-fun Unit!12267 () Unit!12245)

(declare-fun Unit!12268 () Unit!12245)

(assert (=> d!60665 (= lt!264537 (ite (bvslt (currentBit!8486 bs!64) #b00000000000000000000000000000111) (tuple2!14741 Unit!12267 (BitStream!7201 (buf!4474 bs!64) (currentByte!8491 bs!64) (bvadd (currentBit!8486 bs!64) #b00000000000000000000000000000001))) (tuple2!14741 Unit!12268 (BitStream!7201 (buf!4474 bs!64) (bvadd (currentByte!8491 bs!64) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!60665 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!4031 (buf!4474 bs!64))) ((_ sign_extend 32) (currentByte!8491 bs!64)) ((_ sign_extend 32) (currentBit!8486 bs!64))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!60665 (= (increaseBitIndex!0 bs!64) lt!264537)))

(declare-fun b!171502 () Bool)

(declare-fun res!142223 () Bool)

(assert (=> b!171502 (=> (not res!142223) (not e!119752))))

(declare-fun lt!264534 () (_ BitVec 64))

(declare-fun lt!264535 () (_ BitVec 64))

(assert (=> b!171502 (= res!142223 (= (bvsub lt!264534 lt!264535) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!171502 (or (= (bvand lt!264534 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264535 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264534 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264534 lt!264535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171502 (= lt!264535 (remainingBits!0 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8003 lt!264537)))) ((_ sign_extend 32) (currentByte!8491 (_2!8003 lt!264537))) ((_ sign_extend 32) (currentBit!8486 (_2!8003 lt!264537)))))))

(assert (=> b!171502 (= lt!264534 (remainingBits!0 ((_ sign_extend 32) (size!4031 (buf!4474 bs!64))) ((_ sign_extend 32) (currentByte!8491 bs!64)) ((_ sign_extend 32) (currentBit!8486 bs!64))))))

(declare-fun b!171503 () Bool)

(assert (=> b!171503 (= e!119752 (= (size!4031 (buf!4474 bs!64)) (size!4031 (buf!4474 (_2!8003 lt!264537)))))))

(assert (= (and d!60665 res!142224) b!171502))

(assert (= (and b!171502 res!142223) b!171503))

(declare-fun m!270671 () Bool)

(assert (=> d!60665 m!270671))

(assert (=> d!60665 m!270471))

(assert (=> d!60665 m!270445))

(declare-fun m!270673 () Bool)

(assert (=> b!171502 m!270673))

(assert (=> b!171502 m!270445))

(assert (=> d!60583 d!60665))

(declare-fun d!60667 () Bool)

(assert (=> d!60667 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4031 (buf!4474 bs!64))) ((_ sign_extend 32) (currentByte!8491 bs!64)) ((_ sign_extend 32) (currentBit!8486 bs!64))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4031 (buf!4474 bs!64))) ((_ sign_extend 32) (currentByte!8491 bs!64)) ((_ sign_extend 32) (currentBit!8486 bs!64))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!15088 () Bool)

(assert (= bs!15088 d!60667))

(assert (=> bs!15088 m!270445))

(assert (=> d!60583 d!60667))

(assert (=> d!60613 d!60647))

(assert (=> d!60613 d!60589))

(declare-fun d!60669 () Bool)

(declare-fun e!119753 () Bool)

(assert (=> d!60669 e!119753))

(declare-fun res!142225 () Bool)

(assert (=> d!60669 (=> (not res!142225) (not e!119753))))

(declare-fun lt!264541 () (_ BitVec 64))

(declare-fun lt!264539 () (_ BitVec 64))

(declare-fun lt!264540 () (_ BitVec 64))

(assert (=> d!60669 (= res!142225 (= lt!264541 (bvsub lt!264540 lt!264539)))))

(assert (=> d!60669 (or (= (bvand lt!264540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264539 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264540 lt!264539) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60669 (= lt!264539 (remainingBits!0 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8003 (increaseBitIndex!0 bs!64))))) ((_ sign_extend 32) (currentByte!8491 (_2!8003 (increaseBitIndex!0 bs!64)))) ((_ sign_extend 32) (currentBit!8486 (_2!8003 (increaseBitIndex!0 bs!64))))))))

(declare-fun lt!264543 () (_ BitVec 64))

(declare-fun lt!264542 () (_ BitVec 64))

(assert (=> d!60669 (= lt!264540 (bvmul lt!264543 lt!264542))))

(assert (=> d!60669 (or (= lt!264543 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264542 (bvsdiv (bvmul lt!264543 lt!264542) lt!264543)))))

(assert (=> d!60669 (= lt!264542 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60669 (= lt!264543 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8003 (increaseBitIndex!0 bs!64))))))))

(assert (=> d!60669 (= lt!264541 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8491 (_2!8003 (increaseBitIndex!0 bs!64)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8486 (_2!8003 (increaseBitIndex!0 bs!64))))))))

(assert (=> d!60669 (invariant!0 (currentBit!8486 (_2!8003 (increaseBitIndex!0 bs!64))) (currentByte!8491 (_2!8003 (increaseBitIndex!0 bs!64))) (size!4031 (buf!4474 (_2!8003 (increaseBitIndex!0 bs!64)))))))

(assert (=> d!60669 (= (bitIndex!0 (size!4031 (buf!4474 (_2!8003 (increaseBitIndex!0 bs!64)))) (currentByte!8491 (_2!8003 (increaseBitIndex!0 bs!64))) (currentBit!8486 (_2!8003 (increaseBitIndex!0 bs!64)))) lt!264541)))

(declare-fun b!171504 () Bool)

(declare-fun res!142226 () Bool)

(assert (=> b!171504 (=> (not res!142226) (not e!119753))))

(assert (=> b!171504 (= res!142226 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264541))))

(declare-fun b!171505 () Bool)

(declare-fun lt!264538 () (_ BitVec 64))

(assert (=> b!171505 (= e!119753 (bvsle lt!264541 (bvmul lt!264538 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171505 (or (= lt!264538 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264538 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264538)))))

(assert (=> b!171505 (= lt!264538 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8003 (increaseBitIndex!0 bs!64))))))))

(assert (= (and d!60669 res!142225) b!171504))

(assert (= (and b!171504 res!142226) b!171505))

(declare-fun m!270675 () Bool)

(assert (=> d!60669 m!270675))

(declare-fun m!270677 () Bool)

(assert (=> d!60669 m!270677))

(assert (=> b!171300 d!60669))

(assert (=> b!171300 d!60665))

(assert (=> b!171300 d!60589))

(declare-fun d!60671 () Bool)

(declare-fun e!119754 () Bool)

(assert (=> d!60671 e!119754))

(declare-fun res!142227 () Bool)

(assert (=> d!60671 (=> (not res!142227) (not e!119754))))

(declare-fun lt!264545 () (_ BitVec 64))

(declare-fun lt!264547 () (_ BitVec 64))

(declare-fun lt!264546 () (_ BitVec 64))

(assert (=> d!60671 (= res!142227 (= lt!264547 (bvsub lt!264546 lt!264545)))))

(assert (=> d!60671 (or (= (bvand lt!264546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264545 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264546 lt!264545) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60671 (= lt!264545 (remainingBits!0 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8003 lt!264256)))) ((_ sign_extend 32) (currentByte!8491 (_2!8003 lt!264256))) ((_ sign_extend 32) (currentBit!8486 (_2!8003 lt!264256)))))))

(declare-fun lt!264549 () (_ BitVec 64))

(declare-fun lt!264548 () (_ BitVec 64))

(assert (=> d!60671 (= lt!264546 (bvmul lt!264549 lt!264548))))

(assert (=> d!60671 (or (= lt!264549 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264548 (bvsdiv (bvmul lt!264549 lt!264548) lt!264549)))))

(assert (=> d!60671 (= lt!264548 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60671 (= lt!264549 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8003 lt!264256)))))))

(assert (=> d!60671 (= lt!264547 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8491 (_2!8003 lt!264256))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8486 (_2!8003 lt!264256)))))))

(assert (=> d!60671 (invariant!0 (currentBit!8486 (_2!8003 lt!264256)) (currentByte!8491 (_2!8003 lt!264256)) (size!4031 (buf!4474 (_2!8003 lt!264256))))))

(assert (=> d!60671 (= (bitIndex!0 (size!4031 (buf!4474 (_2!8003 lt!264256))) (currentByte!8491 (_2!8003 lt!264256)) (currentBit!8486 (_2!8003 lt!264256))) lt!264547)))

(declare-fun b!171506 () Bool)

(declare-fun res!142228 () Bool)

(assert (=> b!171506 (=> (not res!142228) (not e!119754))))

(assert (=> b!171506 (= res!142228 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264547))))

(declare-fun b!171507 () Bool)

(declare-fun lt!264544 () (_ BitVec 64))

(assert (=> b!171507 (= e!119754 (bvsle lt!264547 (bvmul lt!264544 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171507 (or (= lt!264544 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264544 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264544)))))

(assert (=> b!171507 (= lt!264544 ((_ sign_extend 32) (size!4031 (buf!4474 (_2!8003 lt!264256)))))))

(assert (= (and d!60671 res!142227) b!171506))

(assert (= (and b!171506 res!142228) b!171507))

(declare-fun m!270679 () Bool)

(assert (=> d!60671 m!270679))

(declare-fun m!270681 () Bool)

(assert (=> d!60671 m!270681))

(assert (=> b!171343 d!60671))

(assert (=> b!171343 d!60589))

(assert (=> d!60631 d!60643))

(assert (=> d!60631 d!60645))

(declare-fun d!60673 () Bool)

(assert (=> d!60673 (= (remainingBits!0 ((_ sign_extend 32) (size!4031 (buf!4474 lt!264121))) ((_ sign_extend 32) (currentByte!8491 lt!264121)) ((_ sign_extend 32) (currentBit!8486 lt!264121))) (bvsub (bvmul ((_ sign_extend 32) (size!4031 (buf!4474 lt!264121))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8491 lt!264121)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8486 lt!264121)))))))

(assert (=> d!60587 d!60673))

(declare-fun d!60675 () Bool)

(assert (=> d!60675 (= (invariant!0 (currentBit!8486 lt!264121) (currentByte!8491 lt!264121) (size!4031 (buf!4474 lt!264121))) (and (bvsge (currentBit!8486 lt!264121) #b00000000000000000000000000000000) (bvslt (currentBit!8486 lt!264121) #b00000000000000000000000000001000) (bvsge (currentByte!8491 lt!264121) #b00000000000000000000000000000000) (or (bvslt (currentByte!8491 lt!264121) (size!4031 (buf!4474 lt!264121))) (and (= (currentBit!8486 lt!264121) #b00000000000000000000000000000000) (= (currentByte!8491 lt!264121) (size!4031 (buf!4474 lt!264121)))))))))

(assert (=> d!60587 d!60675))

(check-sat (not d!60653) (not b!171502) (not d!60659) (not d!60665) (not b!171475) (not b!171479) (not b!171492) (not d!60651) (not d!60663) (not d!60643) (not d!60661) (not b!171486) (not b!171497) (not d!60671) (not d!60645) (not b!171477) (not d!60667) (not d!60649) (not b!171491) (not d!60657) (not b!171480) (not b!171487) (not b!171496) (not d!60669) (not d!60647) (not d!60655) (not b!171489))
(check-sat)
