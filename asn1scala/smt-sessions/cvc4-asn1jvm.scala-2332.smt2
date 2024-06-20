; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59646 () Bool)

(assert start!59646)

(declare-fun res!226945 () Bool)

(declare-fun e!192341 () Bool)

(assert (=> start!59646 (=> (not res!226945) (not e!192341))))

(declare-datatypes ((array!15189 0))(
  ( (array!15190 (arr!7590 (Array (_ BitVec 32) (_ BitVec 8))) (size!6603 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12020 0))(
  ( (BitStream!12021 (buf!7071 array!15189) (currentByte!13072 (_ BitVec 32)) (currentBit!13067 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12020)

(assert (=> start!59646 (= res!226945 (not (= (size!6603 (buf!7071 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59646 e!192341))

(declare-fun e!192342 () Bool)

(declare-fun inv!12 (BitStream!12020) Bool)

(assert (=> start!59646 (and (inv!12 bs!71) e!192342)))

(declare-fun b!272524 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272524 (= e!192341 (not (invariant!0 (currentBit!13067 bs!71) (currentByte!13072 bs!71) (size!6603 (buf!7071 bs!71)))))))

(declare-fun arrayBitRangesEq!0 (array!15189 array!15189 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272524 (arrayBitRangesEq!0 (buf!7071 bs!71) (buf!7071 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6603 (buf!7071 bs!71)))))))

(declare-datatypes ((Unit!19185 0))(
  ( (Unit!19186) )
))
(declare-fun lt!410375 () Unit!19185)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15189) Unit!19185)

(assert (=> b!272524 (= lt!410375 (arrayBitEqImpliesRangesEqLemma!0 (buf!7071 bs!71)))))

(declare-fun b!272525 () Bool)

(declare-fun array_inv!6327 (array!15189) Bool)

(assert (=> b!272525 (= e!192342 (array_inv!6327 (buf!7071 bs!71)))))

(assert (= (and start!59646 res!226945) b!272524))

(assert (= start!59646 b!272525))

(declare-fun m!405341 () Bool)

(assert (=> start!59646 m!405341))

(declare-fun m!405343 () Bool)

(assert (=> b!272524 m!405343))

(declare-fun m!405345 () Bool)

(assert (=> b!272524 m!405345))

(declare-fun m!405347 () Bool)

(assert (=> b!272524 m!405347))

(declare-fun m!405349 () Bool)

(assert (=> b!272525 m!405349))

(push 1)

(assert (not b!272525))

(assert (not start!59646))

(assert (not b!272524))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93260 () Bool)

(assert (=> d!93260 (= (array_inv!6327 (buf!7071 bs!71)) (bvsge (size!6603 (buf!7071 bs!71)) #b00000000000000000000000000000000))))

(assert (=> b!272525 d!93260))

(declare-fun d!93264 () Bool)

(assert (=> d!93264 (= (inv!12 bs!71) (invariant!0 (currentBit!13067 bs!71) (currentByte!13072 bs!71) (size!6603 (buf!7071 bs!71))))))

(declare-fun bs!23504 () Bool)

(assert (= bs!23504 d!93264))

(assert (=> bs!23504 m!405343))

(assert (=> start!59646 d!93264))

(declare-fun d!93268 () Bool)

(assert (=> d!93268 (= (invariant!0 (currentBit!13067 bs!71) (currentByte!13072 bs!71) (size!6603 (buf!7071 bs!71))) (and (bvsge (currentBit!13067 bs!71) #b00000000000000000000000000000000) (bvslt (currentBit!13067 bs!71) #b00000000000000000000000000001000) (bvsge (currentByte!13072 bs!71) #b00000000000000000000000000000000) (or (bvslt (currentByte!13072 bs!71) (size!6603 (buf!7071 bs!71))) (and (= (currentBit!13067 bs!71) #b00000000000000000000000000000000) (= (currentByte!13072 bs!71) (size!6603 (buf!7071 bs!71)))))))))

(assert (=> b!272524 d!93268))

(declare-fun b!272578 () Bool)

(declare-fun e!192392 () Bool)

(declare-fun call!4378 () Bool)

(assert (=> b!272578 (= e!192392 call!4378)))

(declare-fun e!192390 () Bool)

(declare-datatypes ((tuple4!484 0))(
  ( (tuple4!485 (_1!12225 (_ BitVec 32)) (_2!12225 (_ BitVec 32)) (_3!1022 (_ BitVec 32)) (_4!242 (_ BitVec 32))) )
))
(declare-fun lt!410406 () tuple4!484)

(declare-fun b!272579 () Bool)

(declare-fun lt!410407 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272579 (= e!192390 (byteRangesEq!0 (select (arr!7590 (buf!7071 bs!71)) (_4!242 lt!410406)) (select (arr!7590 (buf!7071 bs!71)) (_4!242 lt!410406)) #b00000000000000000000000000000000 lt!410407))))

(declare-fun c!12563 () Bool)

(declare-fun lt!410408 () (_ BitVec 32))

(declare-fun bm!4375 () Bool)

(assert (=> bm!4375 (= call!4378 (byteRangesEq!0 (select (arr!7590 (buf!7071 bs!71)) (_3!1022 lt!410406)) (select (arr!7590 (buf!7071 bs!71)) (_3!1022 lt!410406)) lt!410408 (ite c!12563 lt!410407 #b00000000000000000000000000001000)))))

(declare-fun b!272580 () Bool)

(declare-fun e!192393 () Bool)

(assert (=> b!272580 (= e!192392 e!192393)))

(declare-fun res!226984 () Bool)

(assert (=> b!272580 (= res!226984 call!4378)))

(assert (=> b!272580 (=> (not res!226984) (not e!192393))))

(declare-fun b!272581 () Bool)

(declare-fun e!192394 () Bool)

(declare-fun e!192389 () Bool)

(assert (=> b!272581 (= e!192394 e!192389)))

(declare-fun res!226986 () Bool)

(assert (=> b!272581 (=> (not res!226986) (not e!192389))))

(declare-fun e!192391 () Bool)

(assert (=> b!272581 (= res!226986 e!192391)))

(declare-fun res!226988 () Bool)

(assert (=> b!272581 (=> res!226988 e!192391)))

(assert (=> b!272581 (= res!226988 (bvsge (_1!12225 lt!410406) (_2!12225 lt!410406)))))

(assert (=> b!272581 (= lt!410407 ((_ extract 31 0) (bvsrem (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6603 (buf!7071 bs!71)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272581 (= lt!410408 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!484)

(assert (=> b!272581 (= lt!410406 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6603 (buf!7071 bs!71))))))))

(declare-fun d!93272 () Bool)

(declare-fun res!226987 () Bool)

(assert (=> d!93272 (=> res!226987 e!192394)))

(assert (=> d!93272 (= res!226987 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6603 (buf!7071 bs!71))))))))

(assert (=> d!93272 (= (arrayBitRangesEq!0 (buf!7071 bs!71) (buf!7071 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6603 (buf!7071 bs!71))))) e!192394)))

(declare-fun b!272582 () Bool)

(declare-fun arrayRangesEq!1135 (array!15189 array!15189 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272582 (= e!192391 (arrayRangesEq!1135 (buf!7071 bs!71) (buf!7071 bs!71) (_1!12225 lt!410406) (_2!12225 lt!410406)))))

(declare-fun b!272583 () Bool)

(assert (=> b!272583 (= e!192389 e!192392)))

(assert (=> b!272583 (= c!12563 (= (_3!1022 lt!410406) (_4!242 lt!410406)))))

(declare-fun b!272584 () Bool)

(declare-fun res!226985 () Bool)

(assert (=> b!272584 (= res!226985 (= lt!410407 #b00000000000000000000000000000000))))

(assert (=> b!272584 (=> res!226985 e!192390)))

(assert (=> b!272584 (= e!192393 e!192390)))

(assert (= (and d!93272 (not res!226987)) b!272581))

(assert (= (and b!272581 (not res!226988)) b!272582))

(assert (= (and b!272581 res!226986) b!272583))

(assert (= (and b!272583 c!12563) b!272578))

(assert (= (and b!272583 (not c!12563)) b!272580))

(assert (= (and b!272580 res!226984) b!272584))

(assert (= (and b!272584 (not res!226985)) b!272579))

(assert (= (or b!272578 b!272580) bm!4375))

(declare-fun m!405367 () Bool)

(assert (=> b!272579 m!405367))

(assert (=> b!272579 m!405367))

(assert (=> b!272579 m!405367))

(assert (=> b!272579 m!405367))

(declare-fun m!405369 () Bool)

(assert (=> b!272579 m!405369))

(declare-fun m!405371 () Bool)

(assert (=> bm!4375 m!405371))

(assert (=> bm!4375 m!405371))

(assert (=> bm!4375 m!405371))

(assert (=> bm!4375 m!405371))

(declare-fun m!405373 () Bool)

(assert (=> bm!4375 m!405373))

(declare-fun m!405375 () Bool)

(assert (=> b!272581 m!405375))

(declare-fun m!405377 () Bool)

(assert (=> b!272582 m!405377))

(assert (=> b!272524 d!93272))

(declare-fun d!93278 () Bool)

(declare-fun e!192405 () Bool)

(assert (=> d!93278 e!192405))

(declare-fun res!226998 () Bool)

(assert (=> d!93278 (=> (not res!226998) (not e!192405))))

(declare-fun lt!410424 () (_ BitVec 64))

(declare-fun lt!410426 () (_ BitVec 64))

(assert (=> d!93278 (= res!226998 (or (= lt!410424 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410426 (bvsdiv (bvmul lt!410424 lt!410426) lt!410424))))))

(assert (=> d!93278 (= lt!410426 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93278 (= lt!410424 ((_ sign_extend 32) (size!6603 (buf!7071 bs!71))))))

(declare-fun lt!410425 () Unit!19185)

(declare-fun choose!44 (array!15189) Unit!19185)

(assert (=> d!93278 (= lt!410425 (choose!44 (buf!7071 bs!71)))))

