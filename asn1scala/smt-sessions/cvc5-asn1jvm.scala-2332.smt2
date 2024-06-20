; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59642 () Bool)

(assert start!59642)

(declare-fun res!226939 () Bool)

(declare-fun e!192324 () Bool)

(assert (=> start!59642 (=> (not res!226939) (not e!192324))))

(declare-datatypes ((array!15185 0))(
  ( (array!15186 (arr!7588 (Array (_ BitVec 32) (_ BitVec 8))) (size!6601 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12016 0))(
  ( (BitStream!12017 (buf!7069 array!15185) (currentByte!13070 (_ BitVec 32)) (currentBit!13065 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12016)

(assert (=> start!59642 (= res!226939 (not (= (size!6601 (buf!7069 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59642 e!192324))

(declare-fun e!192325 () Bool)

(declare-fun inv!12 (BitStream!12016) Bool)

(assert (=> start!59642 (and (inv!12 bs!71) e!192325)))

(declare-fun b!272512 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272512 (= e!192324 (not (invariant!0 (currentBit!13065 bs!71) (currentByte!13070 bs!71) (size!6601 (buf!7069 bs!71)))))))

(declare-fun arrayBitRangesEq!0 (array!15185 array!15185 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272512 (arrayBitRangesEq!0 (buf!7069 bs!71) (buf!7069 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6601 (buf!7069 bs!71)))))))

(declare-datatypes ((Unit!19181 0))(
  ( (Unit!19182) )
))
(declare-fun lt!410369 () Unit!19181)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15185) Unit!19181)

(assert (=> b!272512 (= lt!410369 (arrayBitEqImpliesRangesEqLemma!0 (buf!7069 bs!71)))))

(declare-fun b!272513 () Bool)

(declare-fun array_inv!6325 (array!15185) Bool)

(assert (=> b!272513 (= e!192325 (array_inv!6325 (buf!7069 bs!71)))))

(assert (= (and start!59642 res!226939) b!272512))

(assert (= start!59642 b!272513))

(declare-fun m!405321 () Bool)

(assert (=> start!59642 m!405321))

(declare-fun m!405323 () Bool)

(assert (=> b!272512 m!405323))

(declare-fun m!405325 () Bool)

(assert (=> b!272512 m!405325))

(declare-fun m!405327 () Bool)

(assert (=> b!272512 m!405327))

(declare-fun m!405329 () Bool)

(assert (=> b!272513 m!405329))

(push 1)

(assert (not b!272513))

(assert (not start!59642))

(assert (not b!272512))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93252 () Bool)

(assert (=> d!93252 (= (array_inv!6325 (buf!7069 bs!71)) (bvsge (size!6601 (buf!7069 bs!71)) #b00000000000000000000000000000000))))

(assert (=> b!272513 d!93252))

(declare-fun d!93254 () Bool)

(assert (=> d!93254 (= (inv!12 bs!71) (invariant!0 (currentBit!13065 bs!71) (currentByte!13070 bs!71) (size!6601 (buf!7069 bs!71))))))

(declare-fun bs!23503 () Bool)

(assert (= bs!23503 d!93254))

(assert (=> bs!23503 m!405323))

(assert (=> start!59642 d!93254))

(declare-fun d!93256 () Bool)

(assert (=> d!93256 (= (invariant!0 (currentBit!13065 bs!71) (currentByte!13070 bs!71) (size!6601 (buf!7069 bs!71))) (and (bvsge (currentBit!13065 bs!71) #b00000000000000000000000000000000) (bvslt (currentBit!13065 bs!71) #b00000000000000000000000000001000) (bvsge (currentByte!13070 bs!71) #b00000000000000000000000000000000) (or (bvslt (currentByte!13070 bs!71) (size!6601 (buf!7069 bs!71))) (and (= (currentBit!13065 bs!71) #b00000000000000000000000000000000) (= (currentByte!13070 bs!71) (size!6601 (buf!7069 bs!71)))))))))

(assert (=> b!272512 d!93256))

(declare-fun e!192360 () Bool)

(declare-fun lt!410382 () (_ BitVec 32))

(declare-datatypes ((tuple4!480 0))(
  ( (tuple4!481 (_1!12223 (_ BitVec 32)) (_2!12223 (_ BitVec 32)) (_3!1020 (_ BitVec 32)) (_4!240 (_ BitVec 32))) )
))
(declare-fun lt!410384 () tuple4!480)

(declare-fun b!272540 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272540 (= e!192360 (byteRangesEq!0 (select (arr!7588 (buf!7069 bs!71)) (_4!240 lt!410384)) (select (arr!7588 (buf!7069 bs!71)) (_4!240 lt!410384)) #b00000000000000000000000000000000 lt!410382))))

(declare-fun b!272541 () Bool)

(declare-fun e!192358 () Bool)

(declare-fun e!192357 () Bool)

(assert (=> b!272541 (= e!192358 e!192357)))

(declare-fun res!226960 () Bool)

(assert (=> b!272541 (=> (not res!226960) (not e!192357))))

(declare-fun e!192356 () Bool)

(assert (=> b!272541 (= res!226960 e!192356)))

(declare-fun res!226959 () Bool)

(assert (=> b!272541 (=> res!226959 e!192356)))

(assert (=> b!272541 (= res!226959 (bvsge (_1!12223 lt!410384) (_2!12223 lt!410384)))))

(assert (=> b!272541 (= lt!410382 ((_ extract 31 0) (bvsrem (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6601 (buf!7069 bs!71)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!410383 () (_ BitVec 32))

(assert (=> b!272541 (= lt!410383 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!480)

(assert (=> b!272541 (= lt!410384 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6601 (buf!7069 bs!71))))))))

(declare-fun b!272543 () Bool)

(declare-fun e!192359 () Bool)

(assert (=> b!272543 (= e!192357 e!192359)))

(declare-fun c!12558 () Bool)

(assert (=> b!272543 (= c!12558 (= (_3!1020 lt!410384) (_4!240 lt!410384)))))

(declare-fun call!4373 () Bool)

(declare-fun bm!4370 () Bool)

(assert (=> bm!4370 (= call!4373 (byteRangesEq!0 (select (arr!7588 (buf!7069 bs!71)) (_3!1020 lt!410384)) (select (arr!7588 (buf!7069 bs!71)) (_3!1020 lt!410384)) lt!410383 (ite c!12558 lt!410382 #b00000000000000000000000000001000)))))

(declare-fun b!272544 () Bool)

(declare-fun res!226958 () Bool)

(assert (=> b!272544 (= res!226958 (= lt!410382 #b00000000000000000000000000000000))))

(assert (=> b!272544 (=> res!226958 e!192360)))

(declare-fun e!192361 () Bool)

(assert (=> b!272544 (= e!192361 e!192360)))

(declare-fun b!272542 () Bool)

(assert (=> b!272542 (= e!192359 e!192361)))

(declare-fun res!226956 () Bool)

(assert (=> b!272542 (= res!226956 call!4373)))

(assert (=> b!272542 (=> (not res!226956) (not e!192361))))

(declare-fun d!93258 () Bool)

(declare-fun res!226957 () Bool)

(assert (=> d!93258 (=> res!226957 e!192358)))

(assert (=> d!93258 (= res!226957 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6601 (buf!7069 bs!71))))))))

(assert (=> d!93258 (= (arrayBitRangesEq!0 (buf!7069 bs!71) (buf!7069 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6601 (buf!7069 bs!71))))) e!192358)))

(declare-fun b!272545 () Bool)

(declare-fun arrayRangesEq!1133 (array!15185 array!15185 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272545 (= e!192356 (arrayRangesEq!1133 (buf!7069 bs!71) (buf!7069 bs!71) (_1!12223 lt!410384) (_2!12223 lt!410384)))))

(declare-fun b!272546 () Bool)

(assert (=> b!272546 (= e!192359 call!4373)))

(assert (= (and d!93258 (not res!226957)) b!272541))

(assert (= (and b!272541 (not res!226959)) b!272545))

(assert (= (and b!272541 res!226960) b!272543))

(assert (= (and b!272543 c!12558) b!272546))

(assert (= (and b!272543 (not c!12558)) b!272542))

(assert (= (and b!272542 res!226956) b!272544))

(assert (= (and b!272544 (not res!226958)) b!272540))

(assert (= (or b!272546 b!272542) bm!4370))

(declare-fun m!405351 () Bool)

(assert (=> b!272540 m!405351))

(assert (=> b!272540 m!405351))

(assert (=> b!272540 m!405351))

(assert (=> b!272540 m!405351))

(declare-fun m!405353 () Bool)

(assert (=> b!272540 m!405353))

(declare-fun m!405355 () Bool)

(assert (=> b!272541 m!405355))

(declare-fun m!405357 () Bool)

(assert (=> bm!4370 m!405357))

(assert (=> bm!4370 m!405357))

(assert (=> bm!4370 m!405357))

(assert (=> bm!4370 m!405357))

(declare-fun m!405359 () Bool)

(assert (=> bm!4370 m!405359))

(declare-fun m!405361 () Bool)

(assert (=> b!272545 m!405361))

(assert (=> b!272512 d!93258))

(declare-fun d!93276 () Bool)

(declare-fun e!192388 () Bool)

(assert (=> d!93276 e!192388))

(declare-fun res!226983 () Bool)

(assert (=> d!93276 (=> (not res!226983) (not e!192388))))

(declare-fun lt!410403 () (_ BitVec 64))

(declare-fun lt!410404 () (_ BitVec 64))

(assert (=> d!93276 (= res!226983 (or (= lt!410403 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410404 (bvsdiv (bvmul lt!410403 lt!410404) lt!410403))))))

(assert (=> d!93276 (= lt!410404 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93276 (= lt!410403 ((_ sign_extend 32) (size!6601 (buf!7069 bs!71))))))

(declare-fun lt!410405 () Unit!19181)

(declare-fun choose!44 (array!15185) Unit!19181)

(assert (=> d!93276 (= lt!410405 (choose!44 (buf!7069 bs!71)))))

(assert (=> d!93276 (= (arrayBitEqImpliesRangesEqLemma!0 (buf!7069 bs!71)) lt!410405)))

(declare-fun b!272577 () Bool)

(assert (=> b!272577 (= e!192388 (arrayBitRangesEq!0 (buf!7069 bs!71) (buf!7069 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!6601 (buf!7069 bs!71))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!93276 res!226983) b!272577))

(declare-fun m!405363 () Bool)

(assert (=> d!93276 m!405363))

(declare-fun m!405365 () Bool)

(assert (=> b!272577 m!405365))

(assert (=> b!272512 d!93276))

(push 1)

(assert (not d!93254))

(assert (not b!272541))

(assert (not bm!4370))

(assert (not b!272577))

(assert (not d!93276))

(assert (not b!272545))

(assert (not b!272540))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

