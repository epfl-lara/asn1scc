; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64648 () Bool)

(assert start!64648)

(declare-fun b!290305 () Bool)

(declare-fun e!206761 () Bool)

(declare-datatypes ((array!17237 0))(
  ( (array!17238 (arr!8464 (Array (_ BitVec 32) (_ BitVec 8))) (size!7462 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12934 0))(
  ( (BitStream!12935 (buf!7528 array!17237) (currentByte!13935 (_ BitVec 32)) (currentBit!13930 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12934)

(declare-fun array_inv!7074 (array!17237) Bool)

(assert (=> b!290305 (= e!206761 (array_inv!7074 (buf!7528 thiss!1728)))))

(declare-fun res!239838 () Bool)

(declare-fun e!206766 () Bool)

(assert (=> start!64648 (=> (not res!239838) (not e!206766))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17237)

(assert (=> start!64648 (= res!239838 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7462 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64648 e!206766))

(declare-fun inv!12 (BitStream!12934) Bool)

(assert (=> start!64648 (and (inv!12 thiss!1728) e!206761)))

(assert (=> start!64648 true))

(assert (=> start!64648 (array_inv!7074 arr!273)))

(declare-fun b!290306 () Bool)

(declare-fun res!239840 () Bool)

(assert (=> b!290306 (=> (not res!239840) (not e!206766))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290306 (= res!239840 (validate_offset_bits!1 ((_ sign_extend 32) (size!7462 (buf!7528 thiss!1728))) ((_ sign_extend 32) (currentByte!13935 thiss!1728)) ((_ sign_extend 32) (currentBit!13930 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun e!206765 () Bool)

(declare-fun b!290307 () Bool)

(declare-datatypes ((Unit!20165 0))(
  ( (Unit!20166) )
))
(declare-datatypes ((tuple3!1668 0))(
  ( (tuple3!1669 (_1!12647 Unit!20165) (_2!12647 BitStream!12934) (_3!1248 array!17237)) )
))
(declare-fun lt!421100 () tuple3!1668)

(assert (=> b!290307 (= e!206765 (and (= (buf!7528 thiss!1728) (buf!7528 (_2!12647 lt!421100))) (= (size!7462 arr!273) (size!7462 (_3!1248 lt!421100)))))))

(declare-fun b!290308 () Bool)

(declare-fun res!239837 () Bool)

(assert (=> b!290308 (=> (not res!239837) (not e!206766))))

(assert (=> b!290308 (= res!239837 (bvslt from!505 to!474))))

(declare-fun b!290309 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!290309 (= e!206766 (not (invariant!0 (currentBit!13930 thiss!1728) (currentByte!13935 thiss!1728) (size!7462 (buf!7528 thiss!1728)))))))

(declare-fun e!206764 () Bool)

(assert (=> b!290309 e!206764))

(declare-fun res!239836 () Bool)

(assert (=> b!290309 (=> (not res!239836) (not e!206764))))

(declare-fun lt!421095 () array!17237)

(declare-fun lt!421093 () Bool)

(declare-fun bitAt!0 (array!17237 (_ BitVec 64)) Bool)

(assert (=> b!290309 (= res!239836 (= (bitAt!0 lt!421095 from!505) lt!421093))))

(assert (=> b!290309 (= lt!421093 (bitAt!0 (_3!1248 lt!421100) from!505))))

(declare-fun lt!421096 () Unit!20165)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17237 array!17237 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20165)

(assert (=> b!290309 (= lt!421096 (arrayBitRangesEqImpliesEq!0 lt!421095 (_3!1248 lt!421100) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17237 array!17237 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290309 (arrayBitRangesEq!0 arr!273 (_3!1248 lt!421100) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!421101 () Unit!20165)

(declare-fun arrayBitRangesEqTransitive!0 (array!17237 array!17237 array!17237 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20165)

(assert (=> b!290309 (= lt!421101 (arrayBitRangesEqTransitive!0 arr!273 lt!421095 (_3!1248 lt!421100) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290309 (arrayBitRangesEq!0 arr!273 lt!421095 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22798 0))(
  ( (tuple2!22799 (_1!12648 Bool) (_2!12648 BitStream!12934)) )
))
(declare-fun lt!421094 () tuple2!22798)

(declare-fun lt!421099 () Unit!20165)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17237 (_ BitVec 64) Bool) Unit!20165)

(assert (=> b!290309 (= lt!421099 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12648 lt!421094)))))

(assert (=> b!290309 e!206765))

(declare-fun res!239839 () Bool)

(assert (=> b!290309 (=> (not res!239839) (not e!206765))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290309 (= res!239839 (= (bvsub (bvadd (bitIndex!0 (size!7462 (buf!7528 thiss!1728)) (currentByte!13935 thiss!1728) (currentBit!13930 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7462 (buf!7528 (_2!12647 lt!421100))) (currentByte!13935 (_2!12647 lt!421100)) (currentBit!13930 (_2!12647 lt!421100)))))))

(declare-fun readBitsLoop!0 (BitStream!12934 (_ BitVec 64) array!17237 (_ BitVec 64) (_ BitVec 64)) tuple3!1668)

(assert (=> b!290309 (= lt!421100 (readBitsLoop!0 (_2!12648 lt!421094) nBits!523 lt!421095 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290309 (validate_offset_bits!1 ((_ sign_extend 32) (size!7462 (buf!7528 (_2!12648 lt!421094)))) ((_ sign_extend 32) (currentByte!13935 (_2!12648 lt!421094))) ((_ sign_extend 32) (currentBit!13930 (_2!12648 lt!421094))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!421098 () Unit!20165)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12934 BitStream!12934 (_ BitVec 64) (_ BitVec 64)) Unit!20165)

(assert (=> b!290309 (= lt!421098 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12648 lt!421094) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!421097 () (_ BitVec 32))

(declare-fun lt!421092 () (_ BitVec 32))

(assert (=> b!290309 (= lt!421095 (array!17238 (store (arr!8464 arr!273) lt!421092 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8464 arr!273) lt!421092)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421097)))) ((_ sign_extend 24) (ite (_1!12648 lt!421094) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421097) #b00000000))))) (size!7462 arr!273)))))

(assert (=> b!290309 (= lt!421097 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290309 (= lt!421092 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12934) tuple2!22798)

(assert (=> b!290309 (= lt!421094 (readBit!0 thiss!1728))))

(declare-fun b!290310 () Bool)

(assert (=> b!290310 (= e!206764 (= lt!421093 (_1!12648 lt!421094)))))

(assert (= (and start!64648 res!239838) b!290306))

(assert (= (and b!290306 res!239840) b!290308))

(assert (= (and b!290308 res!239837) b!290309))

(assert (= (and b!290309 res!239839) b!290307))

(assert (= (and b!290309 res!239836) b!290310))

(assert (= start!64648 b!290305))

(declare-fun m!424255 () Bool)

(assert (=> b!290305 m!424255))

(declare-fun m!424257 () Bool)

(assert (=> start!64648 m!424257))

(declare-fun m!424259 () Bool)

(assert (=> start!64648 m!424259))

(declare-fun m!424261 () Bool)

(assert (=> b!290306 m!424261))

(declare-fun m!424263 () Bool)

(assert (=> b!290309 m!424263))

(declare-fun m!424265 () Bool)

(assert (=> b!290309 m!424265))

(declare-fun m!424267 () Bool)

(assert (=> b!290309 m!424267))

(declare-fun m!424269 () Bool)

(assert (=> b!290309 m!424269))

(declare-fun m!424271 () Bool)

(assert (=> b!290309 m!424271))

(declare-fun m!424273 () Bool)

(assert (=> b!290309 m!424273))

(declare-fun m!424275 () Bool)

(assert (=> b!290309 m!424275))

(declare-fun m!424277 () Bool)

(assert (=> b!290309 m!424277))

(declare-fun m!424279 () Bool)

(assert (=> b!290309 m!424279))

(declare-fun m!424281 () Bool)

(assert (=> b!290309 m!424281))

(declare-fun m!424283 () Bool)

(assert (=> b!290309 m!424283))

(declare-fun m!424285 () Bool)

(assert (=> b!290309 m!424285))

(declare-fun m!424287 () Bool)

(assert (=> b!290309 m!424287))

(declare-fun m!424289 () Bool)

(assert (=> b!290309 m!424289))

(declare-fun m!424291 () Bool)

(assert (=> b!290309 m!424291))

(declare-fun m!424293 () Bool)

(assert (=> b!290309 m!424293))

(declare-fun m!424295 () Bool)

(assert (=> b!290309 m!424295))

(push 1)

(assert (not b!290305))

(assert (not b!290306))

(assert (not b!290309))

(assert (not start!64648))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98358 () Bool)

(assert (=> d!98358 (= (array_inv!7074 (buf!7528 thiss!1728)) (bvsge (size!7462 (buf!7528 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!290305 d!98358))

(declare-fun d!98360 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98360 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7462 (buf!7528 thiss!1728))) ((_ sign_extend 32) (currentByte!13935 thiss!1728)) ((_ sign_extend 32) (currentBit!13930 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7462 (buf!7528 thiss!1728))) ((_ sign_extend 32) (currentByte!13935 thiss!1728)) ((_ sign_extend 32) (currentBit!13930 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25057 () Bool)

(assert (= bs!25057 d!98360))

(declare-fun m!424421 () Bool)

(assert (=> bs!25057 m!424421))

(assert (=> b!290306 d!98360))

(declare-fun d!98362 () Bool)

(declare-fun e!206839 () Bool)

(assert (=> d!98362 e!206839))

(declare-fun res!239902 () Bool)

(assert (=> d!98362 (=> (not res!239902) (not e!206839))))

(declare-fun lt!421206 () (_ BitVec 32))

(assert (=> d!98362 (= res!239902 (and (bvsge lt!421206 #b00000000000000000000000000000000) (bvslt lt!421206 (size!7462 arr!273))))))

(declare-fun lt!421205 () Unit!20165)

(declare-fun lt!421203 () (_ BitVec 8))

(declare-fun lt!421204 () (_ BitVec 32))

(declare-fun choose!53 (array!17237 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20165)

(assert (=> d!98362 (= lt!421205 (choose!53 arr!273 from!505 (_1!12648 lt!421094) lt!421206 lt!421204 lt!421203))))

(assert (=> d!98362 (= lt!421203 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8464 arr!273) lt!421206)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421204)))) ((_ sign_extend 24) (ite (_1!12648 lt!421094) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421204) #b00000000)))))))

(assert (=> d!98362 (= lt!421204 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!98362 (= lt!421206 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!98362 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12648 lt!421094)) lt!421205)))

(declare-fun b!290387 () Bool)

(assert (=> b!290387 (= e!206839 (arrayBitRangesEq!0 arr!273 (array!17238 (store (arr!8464 arr!273) lt!421206 lt!421203) (size!7462 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!98362 res!239902) b!290387))

(declare-fun m!424423 () Bool)

(assert (=> d!98362 m!424423))

(declare-fun m!424425 () Bool)

(assert (=> d!98362 m!424425))

(declare-fun m!424427 () Bool)

(assert (=> d!98362 m!424427))

(declare-fun m!424429 () Bool)

(assert (=> b!290387 m!424429))

(declare-fun m!424431 () Bool)

(assert (=> b!290387 m!424431))

(assert (=> b!290309 d!98362))

(declare-fun b!290407 () Bool)

(declare-fun e!206861 () Bool)

(declare-fun call!4797 () Bool)

(assert (=> b!290407 (= e!206861 call!4797)))

(declare-fun b!290408 () Bool)

(declare-fun res!239919 () Bool)

(declare-fun lt!421244 () (_ BitVec 32))

(assert (=> b!290408 (= res!239919 (= lt!421244 #b00000000000000000000000000000000))))

(declare-fun e!206858 () Bool)

(assert (=> b!290408 (=> res!239919 e!206858)))

(declare-fun e!206856 () Bool)

(assert (=> b!290408 (= e!206856 e!206858)))

(declare-fun b!290409 () Bool)

(declare-fun e!206860 () Bool)

(declare-fun e!206857 () Bool)

(assert (=> b!290409 (= e!206860 e!206857)))

(declare-fun res!239920 () Bool)

(assert (=> b!290409 (=> (not res!239920) (not e!206857))))

(declare-fun e!206859 () Bool)

(assert (=> b!290409 (= res!239920 e!206859)))

(declare-fun res!239922 () Bool)

(assert (=> b!290409 (=> res!239922 e!206859)))

(declare-datatypes ((tuple4!830 0))(
  ( (tuple4!831 (_1!12656 (_ BitVec 32)) (_2!12656 (_ BitVec 32)) (_3!1252 (_ BitVec 32)) (_4!415 (_ BitVec 32))) )
))
(declare-fun lt!421245 () tuple4!830)

(assert (=> b!290409 (= res!239922 (bvsge (_1!12656 lt!421245) (_2!12656 lt!421245)))))

(assert (=> b!290409 (= lt!421244 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!421243 () (_ BitVec 32))

(assert (=> b!290409 (= lt!421243 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!830)

(assert (=> b!290409 (= lt!421245 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!290410 () Bool)

(assert (=> b!290410 (= e!206861 e!206856)))

(declare-fun res!239921 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!290410 (= res!239921 (byteRangesEq!0 (select (arr!8464 arr!273) (_3!1252 lt!421245)) (select (arr!8464 lt!421095) (_3!1252 lt!421245)) lt!421243 #b00000000000000000000000000001000))))

(assert (=> b!290410 (=> (not res!239921) (not e!206856))))

(declare-fun bm!4794 () Bool)

(declare-fun c!13267 () Bool)

(assert (=> bm!4794 (= call!4797 (byteRangesEq!0 (ite c!13267 (select (arr!8464 arr!273) (_3!1252 lt!421245)) (select (arr!8464 arr!273) (_4!415 lt!421245))) (ite c!13267 (select (arr!8464 lt!421095) (_3!1252 lt!421245)) (select (arr!8464 lt!421095) (_4!415 lt!421245))) (ite c!13267 lt!421243 #b00000000000000000000000000000000) lt!421244))))

(declare-fun b!290411 () Bool)

(assert (=> b!290411 (= e!206858 call!4797)))

(declare-fun d!98364 () Bool)

(declare-fun res!239918 () Bool)

(assert (=> d!98364 (=> res!239918 e!206860)))

(assert (=> d!98364 (= res!239918 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98364 (= (arrayBitRangesEq!0 arr!273 lt!421095 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!206860)))

(declare-fun b!290412 () Bool)

(assert (=> b!290412 (= e!206857 e!206861)))

(assert (=> b!290412 (= c!13267 (= (_3!1252 lt!421245) (_4!415 lt!421245)))))

(declare-fun b!290413 () Bool)

(declare-fun arrayRangesEq!1473 (array!17237 array!17237 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!290413 (= e!206859 (arrayRangesEq!1473 arr!273 lt!421095 (_1!12656 lt!421245) (_2!12656 lt!421245)))))

(assert (= (and d!98364 (not res!239918)) b!290409))

(assert (= (and b!290409 (not res!239922)) b!290413))

(assert (= (and b!290409 res!239920) b!290412))

(assert (= (and b!290412 c!13267) b!290407))

(assert (= (and b!290412 (not c!13267)) b!290410))

(assert (= (and b!290410 res!239921) b!290408))

(assert (= (and b!290408 (not res!239919)) b!290411))

(assert (= (or b!290407 b!290411) bm!4794))

(declare-fun m!424449 () Bool)

(assert (=> b!290409 m!424449))

(declare-fun m!424451 () Bool)

(assert (=> b!290410 m!424451))

(declare-fun m!424453 () Bool)

(assert (=> b!290410 m!424453))

(assert (=> b!290410 m!424451))

(assert (=> b!290410 m!424453))

(declare-fun m!424455 () Bool)

(assert (=> b!290410 m!424455))

(assert (=> bm!4794 m!424453))

(assert (=> bm!4794 m!424451))

(declare-fun m!424457 () Bool)

(assert (=> bm!4794 m!424457))

(declare-fun m!424459 () Bool)

(assert (=> bm!4794 m!424459))

(declare-fun m!424461 () Bool)

(assert (=> bm!4794 m!424461))

(declare-fun m!424463 () Bool)

(assert (=> b!290413 m!424463))

(assert (=> b!290309 d!98364))

(declare-fun d!98376 () Bool)

(assert (=> d!98376 (arrayBitRangesEq!0 arr!273 (_3!1248 lt!421100) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!421248 () Unit!20165)

(declare-fun choose!49 (array!17237 array!17237 array!17237 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20165)

(assert (=> d!98376 (= lt!421248 (choose!49 arr!273 lt!421095 (_3!1248 lt!421100) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98376 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98376 (= (arrayBitRangesEqTransitive!0 arr!273 lt!421095 (_3!1248 lt!421100) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!421248)))

(declare-fun bs!25060 () Bool)

(assert (= bs!25060 d!98376))

(assert (=> bs!25060 m!424291))

(declare-fun m!424465 () Bool)

(assert (=> bs!25060 m!424465))

(assert (=> b!290309 d!98376))

(declare-fun b!290500 () Bool)

(declare-fun res!239994 () Bool)

(declare-fun e!206917 () Bool)

(assert (=> b!290500 (=> (not res!239994) (not e!206917))))

(declare-fun lt!421499 () tuple3!1668)

(assert (=> b!290500 (= res!239994 (invariant!0 (currentBit!13930 (_2!12647 lt!421499)) (currentByte!13935 (_2!12647 lt!421499)) (size!7462 (buf!7528 (_2!12647 lt!421499)))))))

(declare-fun d!98378 () Bool)

(assert (=> d!98378 e!206917))

(declare-fun res!239993 () Bool)

(assert (=> d!98378 (=> (not res!239993) (not e!206917))))

(declare-fun lt!421496 () (_ BitVec 64))

(assert (=> d!98378 (= res!239993 (= (bvsub lt!421496 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7462 (buf!7528 (_2!12647 lt!421499))) (currentByte!13935 (_2!12647 lt!421499)) (currentBit!13930 (_2!12647 lt!421499)))))))

(assert (=> d!98378 (or (= (bvand lt!421496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!421496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!421496 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421478 () (_ BitVec 64))

(assert (=> d!98378 (= lt!421496 (bvadd lt!421478 to!474))))

(assert (=> d!98378 (or (not (= (bvand lt!421478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!421478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!421478 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98378 (= lt!421478 (bitIndex!0 (size!7462 (buf!7528 (_2!12648 lt!421094))) (currentByte!13935 (_2!12648 lt!421094)) (currentBit!13930 (_2!12648 lt!421094))))))

(declare-fun e!206918 () tuple3!1668)

(assert (=> d!98378 (= lt!421499 e!206918)))

(declare-fun c!13277 () Bool)

(assert (=> d!98378 (= c!13277 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!98378 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!98378 (= (readBitsLoop!0 (_2!12648 lt!421094) nBits!523 lt!421095 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!421499)))

(declare-fun b!290501 () Bool)

(declare-fun res!239991 () Bool)

(assert (=> b!290501 (=> (not res!239991) (not e!206917))))

(declare-fun e!206916 () Bool)

(assert (=> b!290501 (= res!239991 e!206916)))

(declare-fun res!239992 () Bool)

(assert (=> b!290501 (=> res!239992 e!206916)))

(assert (=> b!290501 (= res!239992 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun b!290502 () Bool)

(declare-datatypes ((tuple2!22808 0))(
  ( (tuple2!22809 (_1!12657 BitStream!12934) (_2!12657 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!12934) tuple2!22808)

(assert (=> b!290502 (= e!206916 (= (bitAt!0 (_3!1248 lt!421499) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!12657 (readBitPure!0 (_2!12648 lt!421094)))))))

(declare-fun b!290503 () Bool)

(declare-fun lt!421483 () Unit!20165)

(declare-fun lt!421494 () tuple3!1668)

(assert (=> b!290503 (= e!206918 (tuple3!1669 lt!421483 (_2!12647 lt!421494) (_3!1248 lt!421494)))))

(declare-fun lt!421507 () tuple2!22798)

(assert (=> b!290503 (= lt!421507 (readBit!0 (_2!12648 lt!421094)))))

(declare-fun lt!421489 () (_ BitVec 32))

(assert (=> b!290503 (= lt!421489 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!421481 () (_ BitVec 32))

(assert (=> b!290503 (= lt!421481 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!421512 () array!17237)

(assert (=> b!290503 (= lt!421512 (array!17238 (store (arr!8464 lt!421095) lt!421489 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8464 lt!421095) lt!421489)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421481)))) ((_ sign_extend 24) (ite (_1!12648 lt!421507) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421481) #b00000000))))) (size!7462 lt!421095)))))

(declare-fun lt!421495 () (_ BitVec 64))

(assert (=> b!290503 (= lt!421495 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!421508 () (_ BitVec 64))

(assert (=> b!290503 (= lt!421508 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!421493 () Unit!20165)

(assert (=> b!290503 (= lt!421493 (validateOffsetBitsIneqLemma!0 (_2!12648 lt!421094) (_2!12648 lt!421507) lt!421495 lt!421508))))

(assert (=> b!290503 (validate_offset_bits!1 ((_ sign_extend 32) (size!7462 (buf!7528 (_2!12648 lt!421507)))) ((_ sign_extend 32) (currentByte!13935 (_2!12648 lt!421507))) ((_ sign_extend 32) (currentBit!13930 (_2!12648 lt!421507))) (bvsub lt!421495 lt!421508))))

(declare-fun lt!421482 () Unit!20165)

(assert (=> b!290503 (= lt!421482 lt!421493)))

(assert (=> b!290503 (= lt!421494 (readBitsLoop!0 (_2!12648 lt!421507) nBits!523 lt!421512 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!239996 () Bool)

(assert (=> b!290503 (= res!239996 (= (bvsub (bvadd (bitIndex!0 (size!7462 (buf!7528 (_2!12648 lt!421094))) (currentByte!13935 (_2!12648 lt!421094)) (currentBit!13930 (_2!12648 lt!421094))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7462 (buf!7528 (_2!12647 lt!421494))) (currentByte!13935 (_2!12647 lt!421494)) (currentBit!13930 (_2!12647 lt!421494)))))))

(declare-fun e!206915 () Bool)

(assert (=> b!290503 (=> (not res!239996) (not e!206915))))

(assert (=> b!290503 e!206915))

(declare-fun lt!421502 () Unit!20165)

(declare-fun Unit!20175 () Unit!20165)

(assert (=> b!290503 (= lt!421502 Unit!20175)))

(declare-fun lt!421501 () (_ BitVec 32))

(assert (=> b!290503 (= lt!421501 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!421498 () (_ BitVec 32))

(assert (=> b!290503 (= lt!421498 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!421479 () Unit!20165)

(assert (=> b!290503 (= lt!421479 (arrayBitRangesUpdatedAtLemma!0 lt!421095 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12648 lt!421507)))))

(declare-fun call!4812 () Bool)

(assert (=> b!290503 call!4812))

(declare-fun lt!421490 () Unit!20165)

(assert (=> b!290503 (= lt!421490 lt!421479)))

(declare-fun lt!421497 () (_ BitVec 64))

(assert (=> b!290503 (= lt!421497 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421485 () Unit!20165)

(assert (=> b!290503 (= lt!421485 (arrayBitRangesEqTransitive!0 lt!421095 lt!421512 (_3!1248 lt!421494) lt!421497 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!290503 (arrayBitRangesEq!0 lt!421095 (_3!1248 lt!421494) lt!421497 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!421477 () Unit!20165)

(assert (=> b!290503 (= lt!421477 lt!421485)))

(declare-fun call!4813 () Bool)

(assert (=> b!290503 call!4813))

(declare-fun lt!421505 () Unit!20165)

(declare-fun Unit!20176 () Unit!20165)

(assert (=> b!290503 (= lt!421505 Unit!20176)))

(declare-fun lt!421480 () Unit!20165)

(assert (=> b!290503 (= lt!421480 (arrayBitRangesEqImpliesEq!0 lt!421512 (_3!1248 lt!421494) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!290503 (= (bitAt!0 lt!421512 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1248 lt!421494) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!421486 () Unit!20165)

(assert (=> b!290503 (= lt!421486 lt!421480)))

(declare-fun lt!421504 () Unit!20165)

(declare-fun Unit!20177 () Unit!20165)

(assert (=> b!290503 (= lt!421504 Unit!20177)))

(declare-fun lt!421491 () Bool)

(assert (=> b!290503 (= lt!421491 (= (bitAt!0 (_3!1248 lt!421494) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12648 lt!421507)))))

(declare-fun Unit!20178 () Unit!20165)

(assert (=> b!290503 (= lt!421483 Unit!20178)))

(assert (=> b!290503 lt!421491))

(declare-fun bm!4809 () Bool)

(assert (=> bm!4809 (= call!4812 (arrayBitRangesEq!0 lt!421095 (ite c!13277 (array!17238 (store (arr!8464 lt!421095) lt!421501 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8464 lt!421095) lt!421501)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421498)))) ((_ sign_extend 24) (ite (_1!12648 lt!421507) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421498) #b00000000))))) (size!7462 lt!421095)) lt!421095) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13277 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7462 lt!421095)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!290504 () Bool)

(declare-fun res!239995 () Bool)

(assert (=> b!290504 (=> (not res!239995) (not e!206917))))

(assert (=> b!290504 (= res!239995 (arrayBitRangesEq!0 lt!421095 (_3!1248 lt!421499) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!290505 () Bool)

(declare-datatypes ((List!955 0))(
  ( (Nil!952) (Cons!951 (h!1070 Bool) (t!1840 List!955)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!12934 array!17237 (_ BitVec 64) (_ BitVec 64)) List!955)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!12934 BitStream!12934 (_ BitVec 64)) List!955)

(assert (=> b!290505 (= e!206917 (= (byteArrayBitContentToList!0 (_2!12647 lt!421499) (_3!1248 lt!421499) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12647 lt!421499) (_2!12648 lt!421094) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!290505 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290505 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421487 () (_ BitVec 64))

(declare-fun lt!421492 () (_ BitVec 64))

(declare-fun bm!4810 () Bool)

(declare-fun lt!421506 () array!17237)

(declare-fun lt!421503 () array!17237)

(assert (=> bm!4810 (= call!4813 (arrayBitRangesEq!0 (ite c!13277 lt!421095 lt!421506) (ite c!13277 (_3!1248 lt!421494) lt!421503) (ite c!13277 #b0000000000000000000000000000000000000000000000000000000000000000 lt!421487) (ite c!13277 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!421492)))))

(declare-fun b!290506 () Bool)

(declare-fun lt!421510 () Unit!20165)

(assert (=> b!290506 (= e!206918 (tuple3!1669 lt!421510 (_2!12648 lt!421094) lt!421095))))

(declare-fun lt!421500 () Unit!20165)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17237) Unit!20165)

(assert (=> b!290506 (= lt!421500 (arrayBitRangesEqReflexiveLemma!0 lt!421095))))

(assert (=> b!290506 call!4812))

(declare-fun lt!421511 () Unit!20165)

(assert (=> b!290506 (= lt!421511 lt!421500)))

(assert (=> b!290506 (= lt!421506 lt!421095)))

(assert (=> b!290506 (= lt!421503 lt!421095)))

(declare-fun lt!421488 () (_ BitVec 64))

(assert (=> b!290506 (= lt!421488 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421509 () (_ BitVec 64))

(assert (=> b!290506 (= lt!421509 ((_ sign_extend 32) (size!7462 lt!421095)))))

(declare-fun lt!421484 () (_ BitVec 64))

(assert (=> b!290506 (= lt!421484 (bvmul lt!421509 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!290506 (= lt!421487 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!290506 (= lt!421492 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17237 array!17237 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20165)

(assert (=> b!290506 (= lt!421510 (arrayBitRangesEqSlicedLemma!0 lt!421506 lt!421503 lt!421488 lt!421484 lt!421487 lt!421492))))

(assert (=> b!290506 call!4813))

(declare-fun b!290507 () Bool)

(assert (=> b!290507 (= e!206915 (and (= (buf!7528 (_2!12648 lt!421094)) (buf!7528 (_2!12647 lt!421494))) (= (size!7462 lt!421095) (size!7462 (_3!1248 lt!421494)))))))

(declare-fun b!290508 () Bool)

(declare-fun res!239990 () Bool)

(assert (=> b!290508 (=> (not res!239990) (not e!206917))))

(assert (=> b!290508 (= res!239990 (and (= (buf!7528 (_2!12648 lt!421094)) (buf!7528 (_2!12647 lt!421499))) (= (size!7462 lt!421095) (size!7462 (_3!1248 lt!421499)))))))

(assert (= (and d!98378 c!13277) b!290503))

(assert (= (and d!98378 (not c!13277)) b!290506))

(assert (= (and b!290503 res!239996) b!290507))

(assert (= (or b!290503 b!290506) bm!4810))

(assert (= (or b!290503 b!290506) bm!4809))

(assert (= (and d!98378 res!239993) b!290508))

(assert (= (and b!290508 res!239990) b!290504))

(assert (= (and b!290504 res!239995) b!290501))

(assert (= (and b!290501 (not res!239992)) b!290502))

(assert (= (and b!290501 res!239991) b!290500))

(assert (= (and b!290500 res!239994) b!290505))

(declare-fun m!424579 () Bool)

(assert (=> b!290503 m!424579))

(declare-fun m!424581 () Bool)

(assert (=> b!290503 m!424581))

(declare-fun m!424583 () Bool)

(assert (=> b!290503 m!424583))

(declare-fun m!424585 () Bool)

(assert (=> b!290503 m!424585))

(declare-fun m!424587 () Bool)

(assert (=> b!290503 m!424587))

(declare-fun m!424589 () Bool)

(assert (=> b!290503 m!424589))

(declare-fun m!424591 () Bool)

(assert (=> b!290503 m!424591))

(declare-fun m!424593 () Bool)

(assert (=> b!290503 m!424593))

(declare-fun m!424595 () Bool)

(assert (=> b!290503 m!424595))

(declare-fun m!424597 () Bool)

(assert (=> b!290503 m!424597))

(declare-fun m!424599 () Bool)

(assert (=> b!290503 m!424599))

(declare-fun m!424601 () Bool)

(assert (=> b!290503 m!424601))

(declare-fun m!424603 () Bool)

(assert (=> b!290503 m!424603))

(declare-fun m!424605 () Bool)

(assert (=> b!290503 m!424605))

(declare-fun m!424607 () Bool)

(assert (=> b!290503 m!424607))

(declare-fun m!424609 () Bool)

(assert (=> b!290500 m!424609))

(declare-fun m!424611 () Bool)

(assert (=> bm!4809 m!424611))

(declare-fun m!424613 () Bool)

(assert (=> bm!4809 m!424613))

(declare-fun m!424615 () Bool)

(assert (=> bm!4809 m!424615))

(declare-fun m!424617 () Bool)

(assert (=> bm!4809 m!424617))

(declare-fun m!424619 () Bool)

(assert (=> b!290502 m!424619))

(declare-fun m!424621 () Bool)

(assert (=> b!290502 m!424621))

(declare-fun m!424623 () Bool)

(assert (=> b!290506 m!424623))

(declare-fun m!424625 () Bool)

(assert (=> b!290506 m!424625))

(declare-fun m!424627 () Bool)

(assert (=> b!290504 m!424627))

(declare-fun m!424629 () Bool)

(assert (=> bm!4810 m!424629))

(declare-fun m!424631 () Bool)

(assert (=> b!290505 m!424631))

(declare-fun m!424633 () Bool)

(assert (=> b!290505 m!424633))

(declare-fun m!424635 () Bool)

(assert (=> d!98378 m!424635))

(assert (=> d!98378 m!424585))

(assert (=> b!290309 d!98378))

(declare-fun d!98412 () Bool)

(assert (=> d!98412 (= (bitAt!0 lt!421095 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8464 lt!421095) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25067 () Bool)

(assert (= bs!25067 d!98412))

(declare-fun m!424647 () Bool)

(assert (=> bs!25067 m!424647))

(declare-fun m!424649 () Bool)

(assert (=> bs!25067 m!424649))

(assert (=> b!290309 d!98412))

(declare-fun d!98416 () Bool)

(assert (=> d!98416 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7462 (buf!7528 (_2!12648 lt!421094)))) ((_ sign_extend 32) (currentByte!13935 (_2!12648 lt!421094))) ((_ sign_extend 32) (currentBit!13930 (_2!12648 lt!421094))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7462 (buf!7528 (_2!12648 lt!421094)))) ((_ sign_extend 32) (currentByte!13935 (_2!12648 lt!421094))) ((_ sign_extend 32) (currentBit!13930 (_2!12648 lt!421094)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25068 () Bool)

(assert (= bs!25068 d!98416))

(declare-fun m!424651 () Bool)

(assert (=> bs!25068 m!424651))

(assert (=> b!290309 d!98416))

(declare-fun d!98418 () Bool)

(declare-fun e!206924 () Bool)

(assert (=> d!98418 e!206924))

(declare-fun res!240004 () Bool)

(assert (=> d!98418 (=> (not res!240004) (not e!206924))))

(declare-fun lt!421541 () (_ BitVec 64))

(declare-fun lt!421540 () (_ BitVec 64))

(declare-fun lt!421545 () (_ BitVec 64))

(assert (=> d!98418 (= res!240004 (= lt!421541 (bvsub lt!421540 lt!421545)))))

(assert (=> d!98418 (or (= (bvand lt!421540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!421545 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!421540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!421540 lt!421545) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98418 (= lt!421545 (remainingBits!0 ((_ sign_extend 32) (size!7462 (buf!7528 (_2!12647 lt!421100)))) ((_ sign_extend 32) (currentByte!13935 (_2!12647 lt!421100))) ((_ sign_extend 32) (currentBit!13930 (_2!12647 lt!421100)))))))

(declare-fun lt!421542 () (_ BitVec 64))

(declare-fun lt!421544 () (_ BitVec 64))

(assert (=> d!98418 (= lt!421540 (bvmul lt!421542 lt!421544))))

(assert (=> d!98418 (or (= lt!421542 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!421544 (bvsdiv (bvmul lt!421542 lt!421544) lt!421542)))))

(assert (=> d!98418 (= lt!421544 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98418 (= lt!421542 ((_ sign_extend 32) (size!7462 (buf!7528 (_2!12647 lt!421100)))))))

(assert (=> d!98418 (= lt!421541 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13935 (_2!12647 lt!421100))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13930 (_2!12647 lt!421100)))))))

(assert (=> d!98418 (invariant!0 (currentBit!13930 (_2!12647 lt!421100)) (currentByte!13935 (_2!12647 lt!421100)) (size!7462 (buf!7528 (_2!12647 lt!421100))))))

(assert (=> d!98418 (= (bitIndex!0 (size!7462 (buf!7528 (_2!12647 lt!421100))) (currentByte!13935 (_2!12647 lt!421100)) (currentBit!13930 (_2!12647 lt!421100))) lt!421541)))

(declare-fun b!290517 () Bool)

(declare-fun res!240005 () Bool)

(assert (=> b!290517 (=> (not res!240005) (not e!206924))))

(assert (=> b!290517 (= res!240005 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!421541))))

(declare-fun b!290518 () Bool)

(declare-fun lt!421543 () (_ BitVec 64))

(assert (=> b!290518 (= e!206924 (bvsle lt!421541 (bvmul lt!421543 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290518 (or (= lt!421543 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!421543 #b0000000000000000000000000000000000000000000000000000000000001000) lt!421543)))))

(assert (=> b!290518 (= lt!421543 ((_ sign_extend 32) (size!7462 (buf!7528 (_2!12647 lt!421100)))))))

(assert (= (and d!98418 res!240004) b!290517))

(assert (= (and b!290517 res!240005) b!290518))

(declare-fun m!424657 () Bool)

(assert (=> d!98418 m!424657))

(declare-fun m!424659 () Bool)

(assert (=> d!98418 m!424659))

(assert (=> b!290309 d!98418))

(declare-fun d!98430 () Bool)

(declare-fun e!206931 () Bool)

(assert (=> d!98430 e!206931))

(declare-fun res!240008 () Bool)

(assert (=> d!98430 (=> (not res!240008) (not e!206931))))

(declare-datatypes ((tuple2!22810 0))(
  ( (tuple2!22811 (_1!12659 Unit!20165) (_2!12659 BitStream!12934)) )
))
(declare-fun increaseBitIndex!0 (BitStream!12934) tuple2!22810)

(assert (=> d!98430 (= res!240008 (= (buf!7528 (_2!12659 (increaseBitIndex!0 thiss!1728))) (buf!7528 thiss!1728)))))

(declare-fun lt!421560 () Bool)

(assert (=> d!98430 (= lt!421560 (not (= (bvand ((_ sign_extend 24) (select (arr!8464 (buf!7528 thiss!1728)) (currentByte!13935 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13930 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!421566 () tuple2!22798)

(assert (=> d!98430 (= lt!421566 (tuple2!22799 (not (= (bvand ((_ sign_extend 24) (select (arr!8464 (buf!7528 thiss!1728)) (currentByte!13935 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13930 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12659 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!98430 (validate_offset_bit!0 ((_ sign_extend 32) (size!7462 (buf!7528 thiss!1728))) ((_ sign_extend 32) (currentByte!13935 thiss!1728)) ((_ sign_extend 32) (currentBit!13930 thiss!1728)))))

(assert (=> d!98430 (= (readBit!0 thiss!1728) lt!421566)))

(declare-fun lt!421561 () (_ BitVec 64))

(declare-fun lt!421563 () (_ BitVec 64))

(declare-fun b!290521 () Bool)

(assert (=> b!290521 (= e!206931 (= (bitIndex!0 (size!7462 (buf!7528 (_2!12659 (increaseBitIndex!0 thiss!1728)))) (currentByte!13935 (_2!12659 (increaseBitIndex!0 thiss!1728))) (currentBit!13930 (_2!12659 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!421561 lt!421563)))))

(assert (=> b!290521 (or (not (= (bvand lt!421561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!421563 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!421561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!421561 lt!421563) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290521 (= lt!421563 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!290521 (= lt!421561 (bitIndex!0 (size!7462 (buf!7528 thiss!1728)) (currentByte!13935 thiss!1728) (currentBit!13930 thiss!1728)))))

(declare-fun lt!421562 () Bool)

(assert (=> b!290521 (= lt!421562 (not (= (bvand ((_ sign_extend 24) (select (arr!8464 (buf!7528 thiss!1728)) (currentByte!13935 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13930 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!421565 () Bool)

(assert (=> b!290521 (= lt!421565 (not (= (bvand ((_ sign_extend 24) (select (arr!8464 (buf!7528 thiss!1728)) (currentByte!13935 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13930 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!421564 () Bool)

(assert (=> b!290521 (= lt!421564 (not (= (bvand ((_ sign_extend 24) (select (arr!8464 (buf!7528 thiss!1728)) (currentByte!13935 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13930 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!98430 res!240008) b!290521))

(declare-fun m!424661 () Bool)

(assert (=> d!98430 m!424661))

(declare-fun m!424663 () Bool)

(assert (=> d!98430 m!424663))

(declare-fun m!424665 () Bool)

(assert (=> d!98430 m!424665))

(declare-fun m!424667 () Bool)

(assert (=> d!98430 m!424667))

(assert (=> b!290521 m!424263))

(assert (=> b!290521 m!424663))

(declare-fun m!424669 () Bool)

(assert (=> b!290521 m!424669))

(assert (=> b!290521 m!424661))

(assert (=> b!290521 m!424665))

(assert (=> b!290309 d!98430))

(declare-fun d!98432 () Bool)

(assert (=> d!98432 (= (bitAt!0 (_3!1248 lt!421100) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8464 (_3!1248 lt!421100)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25073 () Bool)

(assert (= bs!25073 d!98432))

(declare-fun m!424671 () Bool)

(assert (=> bs!25073 m!424671))

(assert (=> bs!25073 m!424649))

(assert (=> b!290309 d!98432))

(declare-fun d!98434 () Bool)

(declare-fun e!206934 () Bool)

(assert (=> d!98434 e!206934))

(declare-fun res!240011 () Bool)

(assert (=> d!98434 (=> (not res!240011) (not e!206934))))

(assert (=> d!98434 (= res!240011 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!421569 () Unit!20165)

(declare-fun choose!27 (BitStream!12934 BitStream!12934 (_ BitVec 64) (_ BitVec 64)) Unit!20165)

(assert (=> d!98434 (= lt!421569 (choose!27 thiss!1728 (_2!12648 lt!421094) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!98434 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!98434 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12648 lt!421094) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!421569)))

(declare-fun b!290524 () Bool)

(assert (=> b!290524 (= e!206934 (validate_offset_bits!1 ((_ sign_extend 32) (size!7462 (buf!7528 (_2!12648 lt!421094)))) ((_ sign_extend 32) (currentByte!13935 (_2!12648 lt!421094))) ((_ sign_extend 32) (currentBit!13930 (_2!12648 lt!421094))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!98434 res!240011) b!290524))

(declare-fun m!424673 () Bool)

(assert (=> d!98434 m!424673))

(assert (=> b!290524 m!424285))

(assert (=> b!290309 d!98434))

(declare-fun d!98436 () Bool)

(assert (=> d!98436 (= (invariant!0 (currentBit!13930 thiss!1728) (currentByte!13935 thiss!1728) (size!7462 (buf!7528 thiss!1728))) (and (bvsge (currentBit!13930 thiss!1728) #b00000000000000000000000000000000) (bvslt (currentBit!13930 thiss!1728) #b00000000000000000000000000001000) (bvsge (currentByte!13935 thiss!1728) #b00000000000000000000000000000000) (or (bvslt (currentByte!13935 thiss!1728) (size!7462 (buf!7528 thiss!1728))) (and (= (currentBit!13930 thiss!1728) #b00000000000000000000000000000000) (= (currentByte!13935 thiss!1728) (size!7462 (buf!7528 thiss!1728)))))))))

(assert (=> b!290309 d!98436))

(declare-fun d!98438 () Bool)

(assert (=> d!98438 (= (bitAt!0 lt!421095 from!505) (bitAt!0 (_3!1248 lt!421100) from!505))))

(declare-fun lt!421594 () Unit!20165)

(declare-fun choose!31 (array!17237 array!17237 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20165)

(assert (=> d!98438 (= lt!421594 (choose!31 lt!421095 (_3!1248 lt!421100) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98438 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98438 (= (arrayBitRangesEqImpliesEq!0 lt!421095 (_3!1248 lt!421100) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!421594)))

(declare-fun bs!25074 () Bool)

(assert (= bs!25074 d!98438))

(assert (=> bs!25074 m!424271))

(assert (=> bs!25074 m!424287))

(declare-fun m!424675 () Bool)

(assert (=> bs!25074 m!424675))

(assert (=> b!290309 d!98438))

(declare-fun d!98440 () Bool)

(declare-fun e!206939 () Bool)

(assert (=> d!98440 e!206939))

(declare-fun res!240014 () Bool)

(assert (=> d!98440 (=> (not res!240014) (not e!206939))))

(declare-fun lt!421600 () (_ BitVec 64))

(declare-fun lt!421596 () (_ BitVec 64))

(declare-fun lt!421595 () (_ BitVec 64))

(assert (=> d!98440 (= res!240014 (= lt!421596 (bvsub lt!421595 lt!421600)))))

(assert (=> d!98440 (or (= (bvand lt!421595 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!421600 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!421595 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!421595 lt!421600) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98440 (= lt!421600 (remainingBits!0 ((_ sign_extend 32) (size!7462 (buf!7528 thiss!1728))) ((_ sign_extend 32) (currentByte!13935 thiss!1728)) ((_ sign_extend 32) (currentBit!13930 thiss!1728))))))

(declare-fun lt!421597 () (_ BitVec 64))

(declare-fun lt!421599 () (_ BitVec 64))

(assert (=> d!98440 (= lt!421595 (bvmul lt!421597 lt!421599))))

(assert (=> d!98440 (or (= lt!421597 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!421599 (bvsdiv (bvmul lt!421597 lt!421599) lt!421597)))))

(assert (=> d!98440 (= lt!421599 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98440 (= lt!421597 ((_ sign_extend 32) (size!7462 (buf!7528 thiss!1728))))))

(assert (=> d!98440 (= lt!421596 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13935 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13930 thiss!1728))))))

(assert (=> d!98440 (invariant!0 (currentBit!13930 thiss!1728) (currentByte!13935 thiss!1728) (size!7462 (buf!7528 thiss!1728)))))

(assert (=> d!98440 (= (bitIndex!0 (size!7462 (buf!7528 thiss!1728)) (currentByte!13935 thiss!1728) (currentBit!13930 thiss!1728)) lt!421596)))

(declare-fun b!290531 () Bool)

(declare-fun res!240015 () Bool)

(assert (=> b!290531 (=> (not res!240015) (not e!206939))))

(assert (=> b!290531 (= res!240015 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!421596))))

(declare-fun b!290532 () Bool)

(declare-fun lt!421598 () (_ BitVec 64))

(assert (=> b!290532 (= e!206939 (bvsle lt!421596 (bvmul lt!421598 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290532 (or (= lt!421598 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!421598 #b0000000000000000000000000000000000000000000000000000000000001000) lt!421598)))))

(assert (=> b!290532 (= lt!421598 ((_ sign_extend 32) (size!7462 (buf!7528 thiss!1728))))))

(assert (= (and d!98440 res!240014) b!290531))

(assert (= (and b!290531 res!240015) b!290532))

(assert (=> d!98440 m!424421))

(assert (=> d!98440 m!424283))

(assert (=> b!290309 d!98440))

(declare-fun b!290533 () Bool)

(declare-fun e!206945 () Bool)

(declare-fun call!4814 () Bool)

(assert (=> b!290533 (= e!206945 call!4814)))

(declare-fun b!290534 () Bool)

(declare-fun res!240017 () Bool)

(declare-fun lt!421610 () (_ BitVec 32))

(assert (=> b!290534 (= res!240017 (= lt!421610 #b00000000000000000000000000000000))))

(declare-fun e!206942 () Bool)

(assert (=> b!290534 (=> res!240017 e!206942)))

(declare-fun e!206940 () Bool)

(assert (=> b!290534 (= e!206940 e!206942)))

(declare-fun b!290535 () Bool)

(declare-fun e!206944 () Bool)

(declare-fun e!206941 () Bool)

(assert (=> b!290535 (= e!206944 e!206941)))

(declare-fun res!240018 () Bool)

(assert (=> b!290535 (=> (not res!240018) (not e!206941))))

(declare-fun e!206943 () Bool)

(assert (=> b!290535 (= res!240018 e!206943)))

(declare-fun res!240020 () Bool)

(assert (=> b!290535 (=> res!240020 e!206943)))

(declare-fun lt!421611 () tuple4!830)

(assert (=> b!290535 (= res!240020 (bvsge (_1!12656 lt!421611) (_2!12656 lt!421611)))))

(assert (=> b!290535 (= lt!421610 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!421609 () (_ BitVec 32))

(assert (=> b!290535 (= lt!421609 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290535 (= lt!421611 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!290536 () Bool)

(assert (=> b!290536 (= e!206945 e!206940)))

(declare-fun res!240019 () Bool)

(assert (=> b!290536 (= res!240019 (byteRangesEq!0 (select (arr!8464 arr!273) (_3!1252 lt!421611)) (select (arr!8464 (_3!1248 lt!421100)) (_3!1252 lt!421611)) lt!421609 #b00000000000000000000000000001000))))

(assert (=> b!290536 (=> (not res!240019) (not e!206940))))

(declare-fun c!13280 () Bool)

(declare-fun bm!4811 () Bool)

(assert (=> bm!4811 (= call!4814 (byteRangesEq!0 (ite c!13280 (select (arr!8464 arr!273) (_3!1252 lt!421611)) (select (arr!8464 arr!273) (_4!415 lt!421611))) (ite c!13280 (select (arr!8464 (_3!1248 lt!421100)) (_3!1252 lt!421611)) (select (arr!8464 (_3!1248 lt!421100)) (_4!415 lt!421611))) (ite c!13280 lt!421609 #b00000000000000000000000000000000) lt!421610))))

(declare-fun b!290537 () Bool)

(assert (=> b!290537 (= e!206942 call!4814)))

(declare-fun d!98442 () Bool)

(declare-fun res!240016 () Bool)

(assert (=> d!98442 (=> res!240016 e!206944)))

(assert (=> d!98442 (= res!240016 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98442 (= (arrayBitRangesEq!0 arr!273 (_3!1248 lt!421100) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!206944)))

(declare-fun b!290538 () Bool)

(assert (=> b!290538 (= e!206941 e!206945)))

(assert (=> b!290538 (= c!13280 (= (_3!1252 lt!421611) (_4!415 lt!421611)))))

(declare-fun b!290539 () Bool)

(assert (=> b!290539 (= e!206943 (arrayRangesEq!1473 arr!273 (_3!1248 lt!421100) (_1!12656 lt!421611) (_2!12656 lt!421611)))))

(assert (= (and d!98442 (not res!240016)) b!290535))

(assert (= (and b!290535 (not res!240020)) b!290539))

(assert (= (and b!290535 res!240018) b!290538))

(assert (= (and b!290538 c!13280) b!290533))

(assert (= (and b!290538 (not c!13280)) b!290536))

(assert (= (and b!290536 res!240019) b!290534))

(assert (= (and b!290534 (not res!240017)) b!290537))

(assert (= (or b!290533 b!290537) bm!4811))

(assert (=> b!290535 m!424449))

(declare-fun m!424677 () Bool)

(assert (=> b!290536 m!424677))

(declare-fun m!424679 () Bool)

(assert (=> b!290536 m!424679))

(assert (=> b!290536 m!424677))

(assert (=> b!290536 m!424679))

(declare-fun m!424681 () Bool)

(assert (=> b!290536 m!424681))

(assert (=> bm!4811 m!424679))

(assert (=> bm!4811 m!424677))

(declare-fun m!424683 () Bool)

(assert (=> bm!4811 m!424683))

(declare-fun m!424685 () Bool)

(assert (=> bm!4811 m!424685))

(declare-fun m!424687 () Bool)

(assert (=> bm!4811 m!424687))

(declare-fun m!424689 () Bool)

(assert (=> b!290539 m!424689))

(assert (=> b!290309 d!98442))

(declare-fun d!98444 () Bool)

(assert (=> d!98444 (= (inv!12 thiss!1728) (invariant!0 (currentBit!13930 thiss!1728) (currentByte!13935 thiss!1728) (size!7462 (buf!7528 thiss!1728))))))

(declare-fun bs!25075 () Bool)

(assert (= bs!25075 d!98444))

(assert (=> bs!25075 m!424283))

(assert (=> start!64648 d!98444))

(declare-fun d!98446 () Bool)

(assert (=> d!98446 (= (array_inv!7074 arr!273) (bvsge (size!7462 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!64648 d!98446))

(push 1)

(assert (not b!290524))

(assert (not d!98378))

(assert (not d!98416))

(assert (not bm!4809))

(assert (not b!290506))

(assert (not b!290536))

(assert (not b!290521))

(assert (not b!290539))

(assert (not b!290505))

(assert (not d!98362))

(assert (not bm!4811))

(assert (not d!98434))

(assert (not b!290504))

(assert (not b!290409))

(assert (not b!290535))

(assert (not b!290413))

(assert (not bm!4810))

(assert (not d!98430))

(assert (not d!98444))

(assert (not d!98440))

(assert (not b!290387))

(assert (not b!290410))

(assert (not b!290500))

(assert (not bm!4794))

(assert (not d!98438))

(assert (not b!290503))

(assert (not b!290502))

(assert (not d!98376))

(assert (not d!98360))

(assert (not d!98418))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

