; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58964 () Bool)

(assert start!58964)

(declare-fun b!270393 () Bool)

(declare-fun e!190273 () Bool)

(declare-fun e!190270 () Bool)

(assert (=> b!270393 (= e!190273 (not e!190270))))

(declare-fun res!225342 () Bool)

(assert (=> b!270393 (=> res!225342 e!190270)))

(declare-datatypes ((array!15071 0))(
  ( (array!15072 (arr!7549 (Array (_ BitVec 32) (_ BitVec 8))) (size!6562 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11938 0))(
  ( (BitStream!11939 (buf!7030 array!15071) (currentByte!12995 (_ BitVec 32)) (currentBit!12990 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11938)

(declare-fun w2!587 () BitStream!11938)

(declare-fun w1!591 () BitStream!11938)

(assert (=> b!270393 (= res!225342 (or (bvsge (currentByte!12995 w1!591) (size!6562 (buf!7030 w1!591))) (bvsge (currentByte!12995 w1!591) (currentByte!12995 w2!587)) (bvsgt #b00000000000000000000000000000000 (currentByte!12995 w2!587)) (bvsgt (size!6562 (buf!7030 w2!587)) (size!6562 (buf!7030 w3!25))) (bvsgt (currentByte!12995 w2!587) (size!6562 (buf!7030 w2!587))) (bvsgt #b00000000000000000000000000000000 (currentByte!12995 w1!591))))))

(declare-fun arrayRangesEq!1094 (array!15071 array!15071 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270393 (arrayRangesEq!1094 (buf!7030 w1!591) (buf!7030 w3!25) #b00000000000000000000000000000000 (currentByte!12995 w1!591))))

(declare-datatypes ((Unit!19079 0))(
  ( (Unit!19080) )
))
(declare-fun lt!409433 () Unit!19079)

(declare-fun arrayRangesEqTransitive!357 (array!15071 array!15071 array!15071 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19079)

(assert (=> b!270393 (= lt!409433 (arrayRangesEqTransitive!357 (buf!7030 w1!591) (buf!7030 w2!587) (buf!7030 w3!25) #b00000000000000000000000000000000 (currentByte!12995 w1!591) (currentByte!12995 w2!587)))))

(declare-fun b!270394 () Bool)

(declare-fun e!190272 () Bool)

(declare-fun array_inv!6286 (array!15071) Bool)

(assert (=> b!270394 (= e!190272 (array_inv!6286 (buf!7030 w2!587)))))

(declare-fun b!270396 () Bool)

(declare-fun e!190267 () Bool)

(assert (=> b!270396 (= e!190267 (array_inv!6286 (buf!7030 w3!25)))))

(declare-fun b!270397 () Bool)

(assert (=> b!270397 (= e!190270 (arrayRangesEq!1094 (buf!7030 w2!587) (buf!7030 w3!25) #b00000000000000000000000000000000 (currentByte!12995 w2!587)))))

(declare-fun b!270398 () Bool)

(declare-fun res!225341 () Bool)

(assert (=> b!270398 (=> (not res!225341) (not e!190273))))

(declare-fun isPrefixOf!0 (BitStream!11938 BitStream!11938) Bool)

(assert (=> b!270398 (= res!225341 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!270395 () Bool)

(declare-fun e!190268 () Bool)

(assert (=> b!270395 (= e!190268 (array_inv!6286 (buf!7030 w1!591)))))

(declare-fun res!225343 () Bool)

(assert (=> start!58964 (=> (not res!225343) (not e!190273))))

(assert (=> start!58964 (= res!225343 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58964 e!190273))

(declare-fun inv!12 (BitStream!11938) Bool)

(assert (=> start!58964 (and (inv!12 w1!591) e!190268)))

(assert (=> start!58964 (and (inv!12 w2!587) e!190272)))

(assert (=> start!58964 (and (inv!12 w3!25) e!190267)))

(assert (= (and start!58964 res!225343) b!270398))

(assert (= (and b!270398 res!225341) b!270393))

(assert (= (and b!270393 (not res!225342)) b!270397))

(assert (= start!58964 b!270395))

(assert (= start!58964 b!270394))

(assert (= start!58964 b!270396))

(declare-fun m!402285 () Bool)

(assert (=> b!270397 m!402285))

(declare-fun m!402287 () Bool)

(assert (=> b!270395 m!402287))

(declare-fun m!402289 () Bool)

(assert (=> b!270398 m!402289))

(declare-fun m!402291 () Bool)

(assert (=> b!270393 m!402291))

(declare-fun m!402293 () Bool)

(assert (=> b!270393 m!402293))

(declare-fun m!402295 () Bool)

(assert (=> start!58964 m!402295))

(declare-fun m!402297 () Bool)

(assert (=> start!58964 m!402297))

(declare-fun m!402299 () Bool)

(assert (=> start!58964 m!402299))

(declare-fun m!402301 () Bool)

(assert (=> start!58964 m!402301))

(declare-fun m!402303 () Bool)

(assert (=> b!270394 m!402303))

(declare-fun m!402305 () Bool)

(assert (=> b!270396 m!402305))

(push 1)

(assert (not b!270394))

(assert (not b!270397))

(assert (not b!270393))

(assert (not b!270396))

(assert (not b!270398))

(assert (not start!58964))

(assert (not b!270395))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91840 () Bool)

(assert (=> d!91840 (= (array_inv!6286 (buf!7030 w1!591)) (bvsge (size!6562 (buf!7030 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!270395 d!91840))

(declare-fun d!91842 () Bool)

(assert (=> d!91842 (= (array_inv!6286 (buf!7030 w3!25)) (bvsge (size!6562 (buf!7030 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!270396 d!91842))

(declare-fun d!91844 () Bool)

(declare-fun res!225375 () Bool)

(declare-fun e!190331 () Bool)

(assert (=> d!91844 (=> (not res!225375) (not e!190331))))

(assert (=> d!91844 (= res!225375 (= (size!6562 (buf!7030 w2!587)) (size!6562 (buf!7030 w3!25))))))

(assert (=> d!91844 (= (isPrefixOf!0 w2!587 w3!25) e!190331)))

(declare-fun b!270447 () Bool)

(declare-fun res!225374 () Bool)

(assert (=> b!270447 (=> (not res!225374) (not e!190331))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!270447 (= res!225374 (bvsle (bitIndex!0 (size!6562 (buf!7030 w2!587)) (currentByte!12995 w2!587) (currentBit!12990 w2!587)) (bitIndex!0 (size!6562 (buf!7030 w3!25)) (currentByte!12995 w3!25) (currentBit!12990 w3!25))))))

(declare-fun b!270448 () Bool)

(declare-fun e!190330 () Bool)

(assert (=> b!270448 (= e!190331 e!190330)))

(declare-fun res!225376 () Bool)

(assert (=> b!270448 (=> res!225376 e!190330)))

(assert (=> b!270448 (= res!225376 (= (size!6562 (buf!7030 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!270449 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15071 array!15071 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!270449 (= e!190330 (arrayBitRangesEq!0 (buf!7030 w2!587) (buf!7030 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6562 (buf!7030 w2!587)) (currentByte!12995 w2!587) (currentBit!12990 w2!587))))))

(assert (= (and d!91844 res!225375) b!270447))

(assert (= (and b!270447 res!225374) b!270448))

(assert (= (and b!270448 (not res!225376)) b!270449))

(declare-fun m!402351 () Bool)

(assert (=> b!270447 m!402351))

(declare-fun m!402353 () Bool)

(assert (=> b!270447 m!402353))

(assert (=> b!270449 m!402351))

(assert (=> b!270449 m!402351))

(declare-fun m!402355 () Bool)

(assert (=> b!270449 m!402355))

(assert (=> b!270398 d!91844))

(declare-fun d!91854 () Bool)

(declare-fun res!225381 () Bool)

(declare-fun e!190335 () Bool)

(assert (=> d!91854 (=> (not res!225381) (not e!190335))))

(assert (=> d!91854 (= res!225381 (= (size!6562 (buf!7030 w1!591)) (size!6562 (buf!7030 w2!587))))))

(assert (=> d!91854 (= (isPrefixOf!0 w1!591 w2!587) e!190335)))

(declare-fun b!270453 () Bool)

(declare-fun res!225380 () Bool)

(assert (=> b!270453 (=> (not res!225380) (not e!190335))))

(assert (=> b!270453 (= res!225380 (bvsle (bitIndex!0 (size!6562 (buf!7030 w1!591)) (currentByte!12995 w1!591) (currentBit!12990 w1!591)) (bitIndex!0 (size!6562 (buf!7030 w2!587)) (currentByte!12995 w2!587) (currentBit!12990 w2!587))))))

(declare-fun b!270454 () Bool)

(declare-fun e!190334 () Bool)

(assert (=> b!270454 (= e!190335 e!190334)))

(declare-fun res!225382 () Bool)

(assert (=> b!270454 (=> res!225382 e!190334)))

(assert (=> b!270454 (= res!225382 (= (size!6562 (buf!7030 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!270455 () Bool)

(assert (=> b!270455 (= e!190334 (arrayBitRangesEq!0 (buf!7030 w1!591) (buf!7030 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6562 (buf!7030 w1!591)) (currentByte!12995 w1!591) (currentBit!12990 w1!591))))))

(assert (= (and d!91854 res!225381) b!270453))

(assert (= (and b!270453 res!225380) b!270454))

(assert (= (and b!270454 (not res!225382)) b!270455))

(declare-fun m!402361 () Bool)

(assert (=> b!270453 m!402361))

(assert (=> b!270453 m!402351))

(assert (=> b!270455 m!402361))

(assert (=> b!270455 m!402361))

(declare-fun m!402365 () Bool)

(assert (=> b!270455 m!402365))

(assert (=> start!58964 d!91854))

(declare-fun d!91860 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91860 (= (inv!12 w1!591) (invariant!0 (currentBit!12990 w1!591) (currentByte!12995 w1!591) (size!6562 (buf!7030 w1!591))))))

(declare-fun bs!23209 () Bool)

(assert (= bs!23209 d!91860))

(declare-fun m!402371 () Bool)

(assert (=> bs!23209 m!402371))

(assert (=> start!58964 d!91860))

(declare-fun d!91864 () Bool)

(assert (=> d!91864 (= (inv!12 w2!587) (invariant!0 (currentBit!12990 w2!587) (currentByte!12995 w2!587) (size!6562 (buf!7030 w2!587))))))

(declare-fun bs!23210 () Bool)

(assert (= bs!23210 d!91864))

(declare-fun m!402373 () Bool)

(assert (=> bs!23210 m!402373))

(assert (=> start!58964 d!91864))

(declare-fun d!91866 () Bool)

(assert (=> d!91866 (= (inv!12 w3!25) (invariant!0 (currentBit!12990 w3!25) (currentByte!12995 w3!25) (size!6562 (buf!7030 w3!25))))))

(declare-fun bs!23211 () Bool)

(assert (= bs!23211 d!91866))

(declare-fun m!402375 () Bool)

(assert (=> bs!23211 m!402375))

(assert (=> start!58964 d!91866))

(declare-fun d!91868 () Bool)

(declare-fun res!225394 () Bool)

(declare-fun e!190346 () Bool)

(assert (=> d!91868 (=> res!225394 e!190346)))

(assert (=> d!91868 (= res!225394 (= #b00000000000000000000000000000000 (currentByte!12995 w2!587)))))

(assert (=> d!91868 (= (arrayRangesEq!1094 (buf!7030 w2!587) (buf!7030 w3!25) #b00000000000000000000000000000000 (currentByte!12995 w2!587)) e!190346)))

(declare-fun b!270467 () Bool)

(declare-fun e!190347 () Bool)

(assert (=> b!270467 (= e!190346 e!190347)))

(declare-fun res!225395 () Bool)

(assert (=> b!270467 (=> (not res!225395) (not e!190347))))

(assert (=> b!270467 (= res!225395 (= (select (arr!7549 (buf!7030 w2!587)) #b00000000000000000000000000000000) (select (arr!7549 (buf!7030 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270468 () Bool)

(assert (=> b!270468 (= e!190347 (arrayRangesEq!1094 (buf!7030 w2!587) (buf!7030 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12995 w2!587)))))

(assert (= (and d!91868 (not res!225394)) b!270467))

(assert (= (and b!270467 res!225395) b!270468))

(declare-fun m!402383 () Bool)

(assert (=> b!270467 m!402383))

(declare-fun m!402385 () Bool)

(assert (=> b!270467 m!402385))

(declare-fun m!402387 () Bool)

(assert (=> b!270468 m!402387))

(assert (=> b!270397 d!91868))

(declare-fun d!91876 () Bool)

(assert (=> d!91876 (= (array_inv!6286 (buf!7030 w2!587)) (bvsge (size!6562 (buf!7030 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!270394 d!91876))

(declare-fun d!91878 () Bool)

(declare-fun res!225396 () Bool)

(declare-fun e!190348 () Bool)

(assert (=> d!91878 (=> res!225396 e!190348)))

(assert (=> d!91878 (= res!225396 (= #b00000000000000000000000000000000 (currentByte!12995 w1!591)))))

(assert (=> d!91878 (= (arrayRangesEq!1094 (buf!7030 w1!591) (buf!7030 w3!25) #b00000000000000000000000000000000 (currentByte!12995 w1!591)) e!190348)))

(declare-fun b!270469 () Bool)

(declare-fun e!190349 () Bool)

(assert (=> b!270469 (= e!190348 e!190349)))

(declare-fun res!225397 () Bool)

(assert (=> b!270469 (=> (not res!225397) (not e!190349))))

(assert (=> b!270469 (= res!225397 (= (select (arr!7549 (buf!7030 w1!591)) #b00000000000000000000000000000000) (select (arr!7549 (buf!7030 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270470 () Bool)

(assert (=> b!270470 (= e!190349 (arrayRangesEq!1094 (buf!7030 w1!591) (buf!7030 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12995 w1!591)))))

(assert (= (and d!91878 (not res!225396)) b!270469))

(assert (= (and b!270469 res!225397) b!270470))

(declare-fun m!402389 () Bool)

(assert (=> b!270469 m!402389))

(assert (=> b!270469 m!402385))

(declare-fun m!402391 () Bool)

(assert (=> b!270470 m!402391))

(assert (=> b!270393 d!91878))

(declare-fun d!91880 () Bool)

(assert (=> d!91880 (arrayRangesEq!1094 (buf!7030 w1!591) (buf!7030 w3!25) #b00000000000000000000000000000000 (currentByte!12995 w1!591))))

(declare-fun lt!409442 () Unit!19079)

(declare-fun choose!395 (array!15071 array!15071 array!15071 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19079)

(assert (=> d!91880 (= lt!409442 (choose!395 (buf!7030 w1!591) (buf!7030 w2!587) (buf!7030 w3!25) #b00000000000000000000000000000000 (currentByte!12995 w1!591) (currentByte!12995 w2!587)))))

(assert (=> d!91880 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12995 w1!591)) (bvsle (currentByte!12995 w1!591) (currentByte!12995 w2!587)))))

(assert (=> d!91880 (= (arrayRangesEqTransitive!357 (buf!7030 w1!591) (buf!7030 w2!587) (buf!7030 w3!25) #b00000000000000000000000000000000 (currentByte!12995 w1!591) (currentByte!12995 w2!587)) lt!409442)))

(declare-fun bs!23215 () Bool)

(assert (= bs!23215 d!91880))

(assert (=> bs!23215 m!402291))

(declare-fun m!402393 () Bool)

(assert (=> bs!23215 m!402393))

(assert (=> b!270393 d!91880))

(push 1)

(assert (not b!270453))

(assert (not b!270470))

(assert (not d!91860))

(assert (not b!270455))

(assert (not b!270447))

(assert (not b!270449))

(assert (not b!270468))

(assert (not d!91880))

(assert (not d!91866))

(assert (not d!91864))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91906 () Bool)

(declare-fun e!190374 () Bool)

(assert (=> d!91906 e!190374))

(declare-fun res!225428 () Bool)

(assert (=> d!91906 (=> (not res!225428) (not e!190374))))

(declare-fun lt!409466 () (_ BitVec 64))

(declare-fun lt!409465 () (_ BitVec 64))

(declare-fun lt!409462 () (_ BitVec 64))

(assert (=> d!91906 (= res!225428 (= lt!409466 (bvsub lt!409462 lt!409465)))))

(assert (=> d!91906 (or (= (bvand lt!409462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409465 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409462 lt!409465) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!91906 (= lt!409465 (remainingBits!0 ((_ sign_extend 32) (size!6562 (buf!7030 w1!591))) ((_ sign_extend 32) (currentByte!12995 w1!591)) ((_ sign_extend 32) (currentBit!12990 w1!591))))))

(declare-fun lt!409464 () (_ BitVec 64))

(declare-fun lt!409461 () (_ BitVec 64))

(assert (=> d!91906 (= lt!409462 (bvmul lt!409464 lt!409461))))

(assert (=> d!91906 (or (= lt!409464 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409461 (bvsdiv (bvmul lt!409464 lt!409461) lt!409464)))))

(assert (=> d!91906 (= lt!409461 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91906 (= lt!409464 ((_ sign_extend 32) (size!6562 (buf!7030 w1!591))))))

(assert (=> d!91906 (= lt!409466 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12995 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12990 w1!591))))))

(assert (=> d!91906 (invariant!0 (currentBit!12990 w1!591) (currentByte!12995 w1!591) (size!6562 (buf!7030 w1!591)))))

(assert (=> d!91906 (= (bitIndex!0 (size!6562 (buf!7030 w1!591)) (currentByte!12995 w1!591) (currentBit!12990 w1!591)) lt!409466)))

(declare-fun b!270501 () Bool)

(declare-fun res!225429 () Bool)

(assert (=> b!270501 (=> (not res!225429) (not e!190374))))

(assert (=> b!270501 (= res!225429 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409466))))

(declare-fun b!270502 () Bool)

(declare-fun lt!409463 () (_ BitVec 64))

(assert (=> b!270502 (= e!190374 (bvsle lt!409466 (bvmul lt!409463 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270502 (or (= lt!409463 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409463 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409463)))))

(assert (=> b!270502 (= lt!409463 ((_ sign_extend 32) (size!6562 (buf!7030 w1!591))))))

(assert (= (and d!91906 res!225428) b!270501))

(assert (= (and b!270501 res!225429) b!270502))

(declare-fun m!402441 () Bool)

(assert (=> d!91906 m!402441))

(assert (=> d!91906 m!402371))

(assert (=> b!270453 d!91906))

(declare-fun d!91916 () Bool)

(declare-fun e!190375 () Bool)

(assert (=> d!91916 e!190375))

(declare-fun res!225430 () Bool)

(assert (=> d!91916 (=> (not res!225430) (not e!190375))))

(declare-fun lt!409471 () (_ BitVec 64))

(declare-fun lt!409468 () (_ BitVec 64))

(declare-fun lt!409472 () (_ BitVec 64))

(assert (=> d!91916 (= res!225430 (= lt!409472 (bvsub lt!409468 lt!409471)))))

(assert (=> d!91916 (or (= (bvand lt!409468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409471 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409468 lt!409471) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91916 (= lt!409471 (remainingBits!0 ((_ sign_extend 32) (size!6562 (buf!7030 w2!587))) ((_ sign_extend 32) (currentByte!12995 w2!587)) ((_ sign_extend 32) (currentBit!12990 w2!587))))))

(declare-fun lt!409470 () (_ BitVec 64))

(declare-fun lt!409467 () (_ BitVec 64))

(assert (=> d!91916 (= lt!409468 (bvmul lt!409470 lt!409467))))

(assert (=> d!91916 (or (= lt!409470 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409467 (bvsdiv (bvmul lt!409470 lt!409467) lt!409470)))))

(assert (=> d!91916 (= lt!409467 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91916 (= lt!409470 ((_ sign_extend 32) (size!6562 (buf!7030 w2!587))))))

(assert (=> d!91916 (= lt!409472 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12995 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12990 w2!587))))))

(assert (=> d!91916 (invariant!0 (currentBit!12990 w2!587) (currentByte!12995 w2!587) (size!6562 (buf!7030 w2!587)))))

(assert (=> d!91916 (= (bitIndex!0 (size!6562 (buf!7030 w2!587)) (currentByte!12995 w2!587) (currentBit!12990 w2!587)) lt!409472)))

(declare-fun b!270503 () Bool)

(declare-fun res!225431 () Bool)

(assert (=> b!270503 (=> (not res!225431) (not e!190375))))

(assert (=> b!270503 (= res!225431 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409472))))

(declare-fun b!270504 () Bool)

(declare-fun lt!409469 () (_ BitVec 64))

(assert (=> b!270504 (= e!190375 (bvsle lt!409472 (bvmul lt!409469 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270504 (or (= lt!409469 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409469 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409469)))))

(assert (=> b!270504 (= lt!409469 ((_ sign_extend 32) (size!6562 (buf!7030 w2!587))))))

(assert (= (and d!91916 res!225430) b!270503))

(assert (= (and b!270503 res!225431) b!270504))

(declare-fun m!402443 () Bool)

(assert (=> d!91916 m!402443))

(assert (=> d!91916 m!402373))

(assert (=> b!270453 d!91916))

(declare-fun d!91918 () Bool)

(declare-fun res!225432 () Bool)

(declare-fun e!190376 () Bool)

(assert (=> d!91918 (=> res!225432 e!190376)))

(assert (=> d!91918 (= res!225432 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12995 w1!591)))))

(assert (=> d!91918 (= (arrayRangesEq!1094 (buf!7030 w1!591) (buf!7030 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12995 w1!591)) e!190376)))

(declare-fun b!270505 () Bool)

(declare-fun e!190377 () Bool)

(assert (=> b!270505 (= e!190376 e!190377)))

(declare-fun res!225433 () Bool)

(assert (=> b!270505 (=> (not res!225433) (not e!190377))))

(assert (=> b!270505 (= res!225433 (= (select (arr!7549 (buf!7030 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7549 (buf!7030 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!270506 () Bool)

(assert (=> b!270506 (= e!190377 (arrayRangesEq!1094 (buf!7030 w1!591) (buf!7030 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12995 w1!591)))))

(assert (= (and d!91918 (not res!225432)) b!270505))

(assert (= (and b!270505 res!225433) b!270506))

(declare-fun m!402445 () Bool)

(assert (=> b!270505 m!402445))

(declare-fun m!402447 () Bool)

(assert (=> b!270505 m!402447))

(declare-fun m!402449 () Bool)

(assert (=> b!270506 m!402449))

(assert (=> b!270470 d!91918))

(declare-fun d!91920 () Bool)

(declare-fun res!225434 () Bool)

(declare-fun e!190378 () Bool)

(assert (=> d!91920 (=> res!225434 e!190378)))

(assert (=> d!91920 (= res!225434 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12995 w2!587)))))

(assert (=> d!91920 (= (arrayRangesEq!1094 (buf!7030 w2!587) (buf!7030 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12995 w2!587)) e!190378)))

(declare-fun b!270507 () Bool)

(declare-fun e!190379 () Bool)

(assert (=> b!270507 (= e!190378 e!190379)))

(declare-fun res!225435 () Bool)

(assert (=> b!270507 (=> (not res!225435) (not e!190379))))

(assert (=> b!270507 (= res!225435 (= (select (arr!7549 (buf!7030 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7549 (buf!7030 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!270508 () Bool)

(assert (=> b!270508 (= e!190379 (arrayRangesEq!1094 (buf!7030 w2!587) (buf!7030 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12995 w2!587)))))

(assert (= (and d!91920 (not res!225434)) b!270507))

(assert (= (and b!270507 res!225435) b!270508))

(declare-fun m!402451 () Bool)

(assert (=> b!270507 m!402451))

(assert (=> b!270507 m!402447))

(declare-fun m!402453 () Bool)

(assert (=> b!270508 m!402453))

(assert (=> b!270468 d!91920))

(declare-fun d!91922 () Bool)

(assert (=> d!91922 (= (invariant!0 (currentBit!12990 w1!591) (currentByte!12995 w1!591) (size!6562 (buf!7030 w1!591))) (and (bvsge (currentBit!12990 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12990 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12995 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12995 w1!591) (size!6562 (buf!7030 w1!591))) (and (= (currentBit!12990 w1!591) #b00000000000000000000000000000000) (= (currentByte!12995 w1!591) (size!6562 (buf!7030 w1!591)))))))))

(assert (=> d!91860 d!91922))

(assert (=> d!91880 d!91878))

(declare-fun d!91924 () Bool)

(assert (=> d!91924 (arrayRangesEq!1094 (buf!7030 w1!591) (buf!7030 w3!25) #b00000000000000000000000000000000 (currentByte!12995 w1!591))))

(assert (=> d!91924 true))

(declare-fun _$16!137 () Unit!19079)

(assert (=> d!91924 (= (choose!395 (buf!7030 w1!591) (buf!7030 w2!587) (buf!7030 w3!25) #b00000000000000000000000000000000 (currentByte!12995 w1!591) (currentByte!12995 w2!587)) _$16!137)))

(declare-fun bs!23222 () Bool)

(assert (= bs!23222 d!91924))

(assert (=> bs!23222 m!402291))

(assert (=> d!91880 d!91924))

(declare-fun b!270541 () Bool)

(declare-fun e!190408 () Bool)

(declare-fun e!190404 () Bool)

(assert (=> b!270541 (= e!190408 e!190404)))

(declare-fun res!225467 () Bool)

(declare-fun call!4322 () Bool)

(assert (=> b!270541 (= res!225467 call!4322)))

(assert (=> b!270541 (=> (not res!225467) (not e!190404))))

(declare-fun b!270542 () Bool)

(declare-fun e!190403 () Bool)

(declare-fun e!190406 () Bool)

(assert (=> b!270542 (= e!190403 e!190406)))

(declare-fun res!225465 () Bool)

(assert (=> b!270542 (=> (not res!225465) (not e!190406))))

(declare-fun e!190405 () Bool)

(assert (=> b!270542 (= res!225465 e!190405)))

(declare-fun res!225464 () Bool)

(assert (=> b!270542 (=> res!225464 e!190405)))

(declare-datatypes ((tuple4!456 0))(
  ( (tuple4!457 (_1!12211 (_ BitVec 32)) (_2!12211 (_ BitVec 32)) (_3!1008 (_ BitVec 32)) (_4!228 (_ BitVec 32))) )
))
(declare-fun lt!409523 () tuple4!456)

(assert (=> b!270542 (= res!225464 (bvsge (_1!12211 lt!409523) (_2!12211 lt!409523)))))

(declare-fun lt!409521 () (_ BitVec 32))

(assert (=> b!270542 (= lt!409521 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6562 (buf!7030 w1!591)) (currentByte!12995 w1!591) (currentBit!12990 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!409522 () (_ BitVec 32))

(assert (=> b!270542 (= lt!409522 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!456)

(assert (=> b!270542 (= lt!409523 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6562 (buf!7030 w1!591)) (currentByte!12995 w1!591) (currentBit!12990 w1!591))))))

(declare-fun b!270543 () Bool)

(assert (=> b!270543 (= e!190406 e!190408)))

(declare-fun c!12471 () Bool)

(assert (=> b!270543 (= c!12471 (= (_3!1008 lt!409523) (_4!228 lt!409523)))))

(declare-fun d!91926 () Bool)

(declare-fun res!225466 () Bool)

(assert (=> d!91926 (=> res!225466 e!190403)))

(assert (=> d!91926 (= res!225466 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6562 (buf!7030 w1!591)) (currentByte!12995 w1!591) (currentBit!12990 w1!591))))))

(assert (=> d!91926 (= (arrayBitRangesEq!0 (buf!7030 w1!591) (buf!7030 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6562 (buf!7030 w1!591)) (currentByte!12995 w1!591) (currentBit!12990 w1!591))) e!190403)))

(declare-fun b!270544 () Bool)

(assert (=> b!270544 (= e!190408 call!4322)))

(declare-fun b!270545 () Bool)

(declare-fun res!225468 () Bool)

(assert (=> b!270545 (= res!225468 (= lt!409521 #b00000000000000000000000000000000))))

(declare-fun e!190407 () Bool)

(assert (=> b!270545 (=> res!225468 e!190407)))

(assert (=> b!270545 (= e!190404 e!190407)))

(declare-fun b!270546 () Bool)

(assert (=> b!270546 (= e!190405 (arrayRangesEq!1094 (buf!7030 w1!591) (buf!7030 w2!587) (_1!12211 lt!409523) (_2!12211 lt!409523)))))

(declare-fun bm!4319 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4319 (= call!4322 (byteRangesEq!0 (select (arr!7549 (buf!7030 w1!591)) (_3!1008 lt!409523)) (select (arr!7549 (buf!7030 w2!587)) (_3!1008 lt!409523)) lt!409522 (ite c!12471 lt!409521 #b00000000000000000000000000001000)))))

(declare-fun b!270547 () Bool)

(assert (=> b!270547 (= e!190407 (byteRangesEq!0 (select (arr!7549 (buf!7030 w1!591)) (_4!228 lt!409523)) (select (arr!7549 (buf!7030 w2!587)) (_4!228 lt!409523)) #b00000000000000000000000000000000 lt!409521))))

(assert (= (and d!91926 (not res!225466)) b!270542))

(assert (= (and b!270542 (not res!225464)) b!270546))

(assert (= (and b!270542 res!225465) b!270543))

(assert (= (and b!270543 c!12471) b!270544))

(assert (= (and b!270543 (not c!12471)) b!270541))

(assert (= (and b!270541 res!225467) b!270545))

(assert (= (and b!270545 (not res!225468)) b!270547))

(assert (= (or b!270544 b!270541) bm!4319))

(assert (=> b!270542 m!402361))

(declare-fun m!402471 () Bool)

(assert (=> b!270542 m!402471))

(declare-fun m!402473 () Bool)

(assert (=> b!270546 m!402473))

(declare-fun m!402475 () Bool)

(assert (=> bm!4319 m!402475))

(declare-fun m!402477 () Bool)

(assert (=> bm!4319 m!402477))

(assert (=> bm!4319 m!402475))

(assert (=> bm!4319 m!402477))

(declare-fun m!402479 () Bool)

(assert (=> bm!4319 m!402479))

(declare-fun m!402481 () Bool)

(assert (=> b!270547 m!402481))

(declare-fun m!402483 () Bool)

(assert (=> b!270547 m!402483))

(assert (=> b!270547 m!402481))

(assert (=> b!270547 m!402483))

(declare-fun m!402485 () Bool)

(assert (=> b!270547 m!402485))

(assert (=> b!270455 d!91926))

(assert (=> b!270455 d!91906))

(assert (=> b!270447 d!91916))

(declare-fun d!91948 () Bool)

(declare-fun e!190416 () Bool)

(assert (=> d!91948 e!190416))

(declare-fun res!225477 () Bool)

(assert (=> d!91948 (=> (not res!225477) (not e!190416))))

(declare-fun lt!409537 () (_ BitVec 64))

(declare-fun lt!409540 () (_ BitVec 64))

(declare-fun lt!409541 () (_ BitVec 64))

(assert (=> d!91948 (= res!225477 (= lt!409541 (bvsub lt!409537 lt!409540)))))

(assert (=> d!91948 (or (= (bvand lt!409537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409540 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409537 lt!409540) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91948 (= lt!409540 (remainingBits!0 ((_ sign_extend 32) (size!6562 (buf!7030 w3!25))) ((_ sign_extend 32) (currentByte!12995 w3!25)) ((_ sign_extend 32) (currentBit!12990 w3!25))))))

(declare-fun lt!409539 () (_ BitVec 64))

(declare-fun lt!409536 () (_ BitVec 64))

(assert (=> d!91948 (= lt!409537 (bvmul lt!409539 lt!409536))))

(assert (=> d!91948 (or (= lt!409539 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409536 (bvsdiv (bvmul lt!409539 lt!409536) lt!409539)))))

(assert (=> d!91948 (= lt!409536 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91948 (= lt!409539 ((_ sign_extend 32) (size!6562 (buf!7030 w3!25))))))

(assert (=> d!91948 (= lt!409541 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12995 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12990 w3!25))))))

(assert (=> d!91948 (invariant!0 (currentBit!12990 w3!25) (currentByte!12995 w3!25) (size!6562 (buf!7030 w3!25)))))

(assert (=> d!91948 (= (bitIndex!0 (size!6562 (buf!7030 w3!25)) (currentByte!12995 w3!25) (currentBit!12990 w3!25)) lt!409541)))

(declare-fun b!270556 () Bool)

(declare-fun res!225478 () Bool)

(assert (=> b!270556 (=> (not res!225478) (not e!190416))))

(assert (=> b!270556 (= res!225478 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409541))))

(declare-fun b!270557 () Bool)

(declare-fun lt!409538 () (_ BitVec 64))

(assert (=> b!270557 (= e!190416 (bvsle lt!409541 (bvmul lt!409538 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270557 (or (= lt!409538 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409538 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409538)))))

(assert (=> b!270557 (= lt!409538 ((_ sign_extend 32) (size!6562 (buf!7030 w3!25))))))

(assert (= (and d!91948 res!225477) b!270556))

(assert (= (and b!270556 res!225478) b!270557))

(declare-fun m!402489 () Bool)

(assert (=> d!91948 m!402489))

(assert (=> d!91948 m!402375))

(assert (=> b!270447 d!91948))

(declare-fun b!270568 () Bool)

(declare-fun e!190429 () Bool)

(declare-fun e!190425 () Bool)

(assert (=> b!270568 (= e!190429 e!190425)))

(declare-fun res!225488 () Bool)

(declare-fun call!4323 () Bool)

(assert (=> b!270568 (= res!225488 call!4323)))

(assert (=> b!270568 (=> (not res!225488) (not e!190425))))

(declare-fun b!270569 () Bool)

(declare-fun e!190424 () Bool)

(declare-fun e!190427 () Bool)

(assert (=> b!270569 (= e!190424 e!190427)))

(declare-fun res!225486 () Bool)

(assert (=> b!270569 (=> (not res!225486) (not e!190427))))

(declare-fun e!190426 () Bool)

(assert (=> b!270569 (= res!225486 e!190426)))

(declare-fun res!225485 () Bool)

(assert (=> b!270569 (=> res!225485 e!190426)))

(declare-fun lt!409550 () tuple4!456)

(assert (=> b!270569 (= res!225485 (bvsge (_1!12211 lt!409550) (_2!12211 lt!409550)))))

(declare-fun lt!409548 () (_ BitVec 32))

(assert (=> b!270569 (= lt!409548 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6562 (buf!7030 w2!587)) (currentByte!12995 w2!587) (currentBit!12990 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!409549 () (_ BitVec 32))

(assert (=> b!270569 (= lt!409549 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270569 (= lt!409550 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6562 (buf!7030 w2!587)) (currentByte!12995 w2!587) (currentBit!12990 w2!587))))))

(declare-fun b!270570 () Bool)

(assert (=> b!270570 (= e!190427 e!190429)))

(declare-fun c!12474 () Bool)

(assert (=> b!270570 (= c!12474 (= (_3!1008 lt!409550) (_4!228 lt!409550)))))

(declare-fun d!91952 () Bool)

(declare-fun res!225487 () Bool)

(assert (=> d!91952 (=> res!225487 e!190424)))

(assert (=> d!91952 (= res!225487 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6562 (buf!7030 w2!587)) (currentByte!12995 w2!587) (currentBit!12990 w2!587))))))

(assert (=> d!91952 (= (arrayBitRangesEq!0 (buf!7030 w2!587) (buf!7030 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6562 (buf!7030 w2!587)) (currentByte!12995 w2!587) (currentBit!12990 w2!587))) e!190424)))

(declare-fun b!270571 () Bool)

(assert (=> b!270571 (= e!190429 call!4323)))

(declare-fun b!270572 () Bool)

(declare-fun res!225489 () Bool)

(assert (=> b!270572 (= res!225489 (= lt!409548 #b00000000000000000000000000000000))))

(declare-fun e!190428 () Bool)

(assert (=> b!270572 (=> res!225489 e!190428)))

(assert (=> b!270572 (= e!190425 e!190428)))

(declare-fun b!270573 () Bool)

(assert (=> b!270573 (= e!190426 (arrayRangesEq!1094 (buf!7030 w2!587) (buf!7030 w3!25) (_1!12211 lt!409550) (_2!12211 lt!409550)))))

(declare-fun bm!4320 () Bool)

(assert (=> bm!4320 (= call!4323 (byteRangesEq!0 (select (arr!7549 (buf!7030 w2!587)) (_3!1008 lt!409550)) (select (arr!7549 (buf!7030 w3!25)) (_3!1008 lt!409550)) lt!409549 (ite c!12474 lt!409548 #b00000000000000000000000000001000)))))

(declare-fun b!270574 () Bool)

(assert (=> b!270574 (= e!190428 (byteRangesEq!0 (select (arr!7549 (buf!7030 w2!587)) (_4!228 lt!409550)) (select (arr!7549 (buf!7030 w3!25)) (_4!228 lt!409550)) #b00000000000000000000000000000000 lt!409548))))

(assert (= (and d!91952 (not res!225487)) b!270569))

(assert (= (and b!270569 (not res!225485)) b!270573))

(assert (= (and b!270569 res!225486) b!270570))

(assert (= (and b!270570 c!12474) b!270571))

(assert (= (and b!270570 (not c!12474)) b!270568))

(assert (= (and b!270568 res!225488) b!270572))

(assert (= (and b!270572 (not res!225489)) b!270574))

(assert (= (or b!270571 b!270568) bm!4320))

(assert (=> b!270569 m!402351))

(declare-fun m!402495 () Bool)

(assert (=> b!270569 m!402495))

(declare-fun m!402497 () Bool)

(assert (=> b!270573 m!402497))

(declare-fun m!402499 () Bool)

(assert (=> bm!4320 m!402499))

(declare-fun m!402501 () Bool)

(assert (=> bm!4320 m!402501))

(assert (=> bm!4320 m!402499))

(assert (=> bm!4320 m!402501))

(declare-fun m!402503 () Bool)

(assert (=> bm!4320 m!402503))

(declare-fun m!402505 () Bool)

(assert (=> b!270574 m!402505))

(declare-fun m!402507 () Bool)

(assert (=> b!270574 m!402507))

(assert (=> b!270574 m!402505))

(assert (=> b!270574 m!402507))

(declare-fun m!402509 () Bool)

(assert (=> b!270574 m!402509))

(assert (=> b!270449 d!91952))

(assert (=> b!270449 d!91916))

(declare-fun d!91958 () Bool)

(assert (=> d!91958 (= (invariant!0 (currentBit!12990 w2!587) (currentByte!12995 w2!587) (size!6562 (buf!7030 w2!587))) (and (bvsge (currentBit!12990 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12990 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12995 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12995 w2!587) (size!6562 (buf!7030 w2!587))) (and (= (currentBit!12990 w2!587) #b00000000000000000000000000000000) (= (currentByte!12995 w2!587) (size!6562 (buf!7030 w2!587)))))))))

(assert (=> d!91864 d!91958))

(declare-fun d!91960 () Bool)

(assert (=> d!91960 (= (invariant!0 (currentBit!12990 w3!25) (currentByte!12995 w3!25) (size!6562 (buf!7030 w3!25))) (and (bvsge (currentBit!12990 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12990 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12995 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12995 w3!25) (size!6562 (buf!7030 w3!25))) (and (= (currentBit!12990 w3!25) #b00000000000000000000000000000000) (= (currentByte!12995 w3!25) (size!6562 (buf!7030 w3!25)))))))))

(assert (=> d!91866 d!91960))

(push 1)

(assert (not b!270569))

(assert (not b!270547))

(assert (not bm!4319))

(assert (not b!270574))

(assert (not b!270506))

(assert (not b!270508))

(assert (not bm!4320))

(assert (not d!91948))

(assert (not d!91916))

(assert (not d!91906))

(assert (not b!270573))

(assert (not d!91924))

(assert (not b!270546))

(assert (not b!270542))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92024 () Bool)

(assert (=> d!92024 (= (remainingBits!0 ((_ sign_extend 32) (size!6562 (buf!7030 w3!25))) ((_ sign_extend 32) (currentByte!12995 w3!25)) ((_ sign_extend 32) (currentBit!12990 w3!25))) (bvsub (bvmul ((_ sign_extend 32) (size!6562 (buf!7030 w3!25))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12995 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12990 w3!25)))))))

(assert (=> d!91948 d!92024))

(assert (=> d!91948 d!91960))

(declare-fun d!92026 () Bool)

(assert (=> d!92026 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6562 (buf!7030 w2!587)) (currentByte!12995 w2!587) (currentBit!12990 w2!587))) (tuple4!457 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6562 (buf!7030 w2!587)) (currentByte!12995 w2!587) (currentBit!12990 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6562 (buf!7030 w2!587)) (currentByte!12995 w2!587) (currentBit!12990 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!270569 d!92026))

(declare-fun d!92028 () Bool)

(assert (=> d!92028 (= (byteRangesEq!0 (select (arr!7549 (buf!7030 w1!591)) (_3!1008 lt!409523)) (select (arr!7549 (buf!7030 w2!587)) (_3!1008 lt!409523)) lt!409522 (ite c!12471 lt!409521 #b00000000000000000000000000001000)) (or (= lt!409522 (ite c!12471 lt!409521 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7549 (buf!7030 w1!591)) (_3!1008 lt!409523))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12471 lt!409521 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409522)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7549 (buf!7030 w2!587)) (_3!1008 lt!409523))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12471 lt!409521 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409522)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23232 () Bool)

(assert (= bs!23232 d!92028))

(declare-fun m!402651 () Bool)

(assert (=> bs!23232 m!402651))

(declare-fun m!402653 () Bool)

(assert (=> bs!23232 m!402653))

(assert (=> bm!4319 d!92028))

(declare-fun d!92030 () Bool)

(assert (=> d!92030 (= (byteRangesEq!0 (select (arr!7549 (buf!7030 w1!591)) (_4!228 lt!409523)) (select (arr!7549 (buf!7030 w2!587)) (_4!228 lt!409523)) #b00000000000000000000000000000000 lt!409521) (or (= #b00000000000000000000000000000000 lt!409521) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7549 (buf!7030 w1!591)) (_4!228 lt!409523))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409521))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7549 (buf!7030 w2!587)) (_4!228 lt!409523))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409521))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23233 () Bool)

(assert (= bs!23233 d!92030))

(declare-fun m!402655 () Bool)

(assert (=> bs!23233 m!402655))

(declare-fun m!402657 () Bool)

(assert (=> bs!23233 m!402657))

(assert (=> b!270547 d!92030))

(declare-fun d!92032 () Bool)

(declare-fun res!225540 () Bool)

(declare-fun e!190485 () Bool)

(assert (=> d!92032 (=> res!225540 e!190485)))

(assert (=> d!92032 (= res!225540 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12995 w2!587)))))

(assert (=> d!92032 (= (arrayRangesEq!1094 (buf!7030 w2!587) (buf!7030 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12995 w2!587)) e!190485)))

(declare-fun b!270637 () Bool)

(declare-fun e!190486 () Bool)

(assert (=> b!270637 (= e!190485 e!190486)))

(declare-fun res!225541 () Bool)

(assert (=> b!270637 (=> (not res!225541) (not e!190486))))

(assert (=> b!270637 (= res!225541 (= (select (arr!7549 (buf!7030 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7549 (buf!7030 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!270638 () Bool)

(assert (=> b!270638 (= e!190486 (arrayRangesEq!1094 (buf!7030 w2!587) (buf!7030 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12995 w2!587)))))

(assert (= (and d!92032 (not res!225540)) b!270637))

(assert (= (and b!270637 res!225541) b!270638))

(declare-fun m!402659 () Bool)

(assert (=> b!270637 m!402659))

(declare-fun m!402661 () Bool)

(assert (=> b!270637 m!402661))

(declare-fun m!402663 () Bool)

(assert (=> b!270638 m!402663))

(assert (=> b!270508 d!92032))

(declare-fun d!92034 () Bool)

(assert (=> d!92034 (= (remainingBits!0 ((_ sign_extend 32) (size!6562 (buf!7030 w1!591))) ((_ sign_extend 32) (currentByte!12995 w1!591)) ((_ sign_extend 32) (currentBit!12990 w1!591))) (bvsub (bvmul ((_ sign_extend 32) (size!6562 (buf!7030 w1!591))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12995 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12990 w1!591)))))))

(assert (=> d!91906 d!92034))

(assert (=> d!91906 d!91922))

(declare-fun d!92036 () Bool)

(declare-fun res!225542 () Bool)

(declare-fun e!190487 () Bool)

(assert (=> d!92036 (=> res!225542 e!190487)))

(assert (=> d!92036 (= res!225542 (= (_1!12211 lt!409550) (_2!12211 lt!409550)))))

(assert (=> d!92036 (= (arrayRangesEq!1094 (buf!7030 w2!587) (buf!7030 w3!25) (_1!12211 lt!409550) (_2!12211 lt!409550)) e!190487)))

(declare-fun b!270639 () Bool)

(declare-fun e!190488 () Bool)

(assert (=> b!270639 (= e!190487 e!190488)))

(declare-fun res!225543 () Bool)

(assert (=> b!270639 (=> (not res!225543) (not e!190488))))

(assert (=> b!270639 (= res!225543 (= (select (arr!7549 (buf!7030 w2!587)) (_1!12211 lt!409550)) (select (arr!7549 (buf!7030 w3!25)) (_1!12211 lt!409550))))))

(declare-fun b!270640 () Bool)

(assert (=> b!270640 (= e!190488 (arrayRangesEq!1094 (buf!7030 w2!587) (buf!7030 w3!25) (bvadd (_1!12211 lt!409550) #b00000000000000000000000000000001) (_2!12211 lt!409550)))))

(assert (= (and d!92036 (not res!225542)) b!270639))

(assert (= (and b!270639 res!225543) b!270640))

(declare-fun m!402665 () Bool)

(assert (=> b!270639 m!402665))

(declare-fun m!402667 () Bool)

(assert (=> b!270639 m!402667))

(declare-fun m!402669 () Bool)

(assert (=> b!270640 m!402669))

(assert (=> b!270573 d!92036))

(declare-fun d!92038 () Bool)

(assert (=> d!92038 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6562 (buf!7030 w1!591)) (currentByte!12995 w1!591) (currentBit!12990 w1!591))) (tuple4!457 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6562 (buf!7030 w1!591)) (currentByte!12995 w1!591) (currentBit!12990 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6562 (buf!7030 w1!591)) (currentByte!12995 w1!591) (currentBit!12990 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!270542 d!92038))

(declare-fun d!92040 () Bool)

(assert (=> d!92040 (= (byteRangesEq!0 (select (arr!7549 (buf!7030 w2!587)) (_4!228 lt!409550)) (select (arr!7549 (buf!7030 w3!25)) (_4!228 lt!409550)) #b00000000000000000000000000000000 lt!409548) (or (= #b00000000000000000000000000000000 lt!409548) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7549 (buf!7030 w2!587)) (_4!228 lt!409550))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409548))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7549 (buf!7030 w3!25)) (_4!228 lt!409550))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409548))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23234 () Bool)

(assert (= bs!23234 d!92040))

(declare-fun m!402671 () Bool)

(assert (=> bs!23234 m!402671))

(assert (=> bs!23234 m!402657))

(assert (=> b!270574 d!92040))

(declare-fun d!92042 () Bool)

(assert (=> d!92042 (= (byteRangesEq!0 (select (arr!7549 (buf!7030 w2!587)) (_3!1008 lt!409550)) (select (arr!7549 (buf!7030 w3!25)) (_3!1008 lt!409550)) lt!409549 (ite c!12474 lt!409548 #b00000000000000000000000000001000)) (or (= lt!409549 (ite c!12474 lt!409548 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7549 (buf!7030 w2!587)) (_3!1008 lt!409550))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12474 lt!409548 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409549)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7549 (buf!7030 w3!25)) (_3!1008 lt!409550))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12474 lt!409548 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409549)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23235 () Bool)

(assert (= bs!23235 d!92042))

(declare-fun m!402673 () Bool)

(assert (=> bs!23235 m!402673))

(declare-fun m!402675 () Bool)

(assert (=> bs!23235 m!402675))

(assert (=> bm!4320 d!92042))

(declare-fun d!92044 () Bool)

(declare-fun res!225544 () Bool)

(declare-fun e!190489 () Bool)

(assert (=> d!92044 (=> res!225544 e!190489)))

(assert (=> d!92044 (= res!225544 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12995 w1!591)))))

(assert (=> d!92044 (= (arrayRangesEq!1094 (buf!7030 w1!591) (buf!7030 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12995 w1!591)) e!190489)))

(declare-fun b!270641 () Bool)

(declare-fun e!190490 () Bool)

(assert (=> b!270641 (= e!190489 e!190490)))

(declare-fun res!225545 () Bool)

(assert (=> b!270641 (=> (not res!225545) (not e!190490))))

(assert (=> b!270641 (= res!225545 (= (select (arr!7549 (buf!7030 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7549 (buf!7030 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!270642 () Bool)

(assert (=> b!270642 (= e!190490 (arrayRangesEq!1094 (buf!7030 w1!591) (buf!7030 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12995 w1!591)))))

(assert (= (and d!92044 (not res!225544)) b!270641))

(assert (= (and b!270641 res!225545) b!270642))

(declare-fun m!402677 () Bool)

(assert (=> b!270641 m!402677))

(assert (=> b!270641 m!402661))

(declare-fun m!402679 () Bool)

(assert (=> b!270642 m!402679))

(assert (=> b!270506 d!92044))

(declare-fun d!92046 () Bool)

(declare-fun res!225546 () Bool)

(declare-fun e!190491 () Bool)

(assert (=> d!92046 (=> res!225546 e!190491)))

(assert (=> d!92046 (= res!225546 (= (_1!12211 lt!409523) (_2!12211 lt!409523)))))

(assert (=> d!92046 (= (arrayRangesEq!1094 (buf!7030 w1!591) (buf!7030 w2!587) (_1!12211 lt!409523) (_2!12211 lt!409523)) e!190491)))

(declare-fun b!270643 () Bool)

(declare-fun e!190492 () Bool)

(assert (=> b!270643 (= e!190491 e!190492)))

(declare-fun res!225547 () Bool)

(assert (=> b!270643 (=> (not res!225547) (not e!190492))))

(assert (=> b!270643 (= res!225547 (= (select (arr!7549 (buf!7030 w1!591)) (_1!12211 lt!409523)) (select (arr!7549 (buf!7030 w2!587)) (_1!12211 lt!409523))))))

(declare-fun b!270644 () Bool)

(assert (=> b!270644 (= e!190492 (arrayRangesEq!1094 (buf!7030 w1!591) (buf!7030 w2!587) (bvadd (_1!12211 lt!409523) #b00000000000000000000000000000001) (_2!12211 lt!409523)))))

(assert (= (and d!92046 (not res!225546)) b!270643))

(assert (= (and b!270643 res!225547) b!270644))

(declare-fun m!402681 () Bool)

(assert (=> b!270643 m!402681))

(declare-fun m!402683 () Bool)

(assert (=> b!270643 m!402683))

(declare-fun m!402685 () Bool)

(assert (=> b!270644 m!402685))

(assert (=> b!270546 d!92046))

(assert (=> d!91924 d!91878))

(declare-fun d!92048 () Bool)

(assert (=> d!92048 (= (remainingBits!0 ((_ sign_extend 32) (size!6562 (buf!7030 w2!587))) ((_ sign_extend 32) (currentByte!12995 w2!587)) ((_ sign_extend 32) (currentBit!12990 w2!587))) (bvsub (bvmul ((_ sign_extend 32) (size!6562 (buf!7030 w2!587))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12995 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12990 w2!587)))))))

(assert (=> d!91916 d!92048))

(assert (=> d!91916 d!91958))

(push 1)

(assert (not b!270638))

(assert (not b!270642))

(assert (not b!270644))

(assert (not b!270640))

(check-sat)

(pop 1)

(push 1)

(check-sat)

