; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37870 () Bool)

(assert start!37870)

(declare-fun res!142068 () Bool)

(declare-fun e!119602 () Bool)

(assert (=> start!37870 (=> (not res!142068) (not e!119602))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37870 (= res!142068 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37870 e!119602))

(assert (=> start!37870 true))

(declare-datatypes ((array!9110 0))(
  ( (array!9111 (arr!4962 (Array (_ BitVec 32) (_ BitVec 8))) (size!4032 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7202 0))(
  ( (BitStream!7203 (buf!4475 array!9110) (currentByte!8492 (_ BitVec 32)) (currentBit!8487 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7202)

(declare-fun e!119600 () Bool)

(declare-fun inv!12 (BitStream!7202) Bool)

(assert (=> start!37870 (and (inv!12 bs!64) e!119600)))

(declare-fun b!171286 () Bool)

(declare-fun res!142067 () Bool)

(assert (=> b!171286 (=> (not res!142067) (not e!119602))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!171286 (= res!142067 (validate_offset_bits!1 ((_ sign_extend 32) (size!4032 (buf!4475 bs!64))) ((_ sign_extend 32) (currentByte!8492 bs!64)) ((_ sign_extend 32) (currentBit!8487 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun lt!264101 () Bool)

(declare-datatypes ((tuple2!14730 0))(
  ( (tuple2!14731 (_1!7998 BitStream!7202) (_2!7998 Bool)) )
))
(declare-fun lt!264100 () tuple2!14730)

(declare-fun lt!264098 () tuple2!14730)

(declare-fun b!171287 () Bool)

(assert (=> b!171287 (= e!119602 (or (not (= (_2!7998 lt!264100) (and (not lt!264101) (_2!7998 lt!264098)))) (and (not lt!264101) (not (= (_1!7998 lt!264100) (_1!7998 lt!264098))))))))

(declare-fun lt!264099 () tuple2!14730)

(declare-fun expected!82 () Bool)

(assert (=> b!171287 (= lt!264101 (not (= (_2!7998 lt!264099) expected!82)))))

(declare-fun checkBitsLoopPure!0 (BitStream!7202 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14730)

(declare-fun withMovedBitIndex!0 (BitStream!7202 (_ BitVec 64)) BitStream!7202)

(assert (=> b!171287 (= lt!264098 (checkBitsLoopPure!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283 expected!82 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)))))

(declare-fun readBitPure!0 (BitStream!7202) tuple2!14730)

(assert (=> b!171287 (= lt!264099 (readBitPure!0 bs!64))))

(assert (=> b!171287 (= lt!264100 (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235))))

(declare-fun b!171288 () Bool)

(declare-fun array_inv!3773 (array!9110) Bool)

(assert (=> b!171288 (= e!119600 (array_inv!3773 (buf!4475 bs!64)))))

(assert (= (and start!37870 res!142068) b!171286))

(assert (= (and b!171286 res!142067) b!171287))

(assert (= start!37870 b!171288))

(declare-fun m!270431 () Bool)

(assert (=> start!37870 m!270431))

(declare-fun m!270433 () Bool)

(assert (=> b!171286 m!270433))

(declare-fun m!270435 () Bool)

(assert (=> b!171287 m!270435))

(assert (=> b!171287 m!270435))

(declare-fun m!270437 () Bool)

(assert (=> b!171287 m!270437))

(declare-fun m!270439 () Bool)

(assert (=> b!171287 m!270439))

(declare-fun m!270441 () Bool)

(assert (=> b!171287 m!270441))

(declare-fun m!270443 () Bool)

(assert (=> b!171288 m!270443))

(push 1)

(assert (not start!37870))

(assert (not b!171286))

(assert (not b!171287))

(assert (not b!171288))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60557 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!60557 (= (inv!12 bs!64) (invariant!0 (currentBit!8487 bs!64) (currentByte!8492 bs!64) (size!4032 (buf!4475 bs!64))))))

(declare-fun bs!15075 () Bool)

(assert (= bs!15075 d!60557))

(declare-fun m!270455 () Bool)

(assert (=> bs!15075 m!270455))

(assert (=> start!37870 d!60557))

(declare-fun d!60559 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!60559 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4032 (buf!4475 bs!64))) ((_ sign_extend 32) (currentByte!8492 bs!64)) ((_ sign_extend 32) (currentBit!8487 bs!64)) (bvsub nBits!283 from!235)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4032 (buf!4475 bs!64))) ((_ sign_extend 32) (currentByte!8492 bs!64)) ((_ sign_extend 32) (currentBit!8487 bs!64))) (bvsub nBits!283 from!235)))))

(declare-fun bs!15076 () Bool)

(assert (= bs!15076 d!60559))

(declare-fun m!270457 () Bool)

(assert (=> bs!15076 m!270457))

(assert (=> b!171286 d!60559))

(declare-fun d!60561 () Bool)

(declare-datatypes ((tuple2!14738 0))(
  ( (tuple2!14739 (_1!8002 Bool) (_2!8002 BitStream!7202)) )
))
(declare-fun lt!264110 () tuple2!14738)

(declare-fun checkBitsLoop!0 (BitStream!7202 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14738)

(assert (=> d!60561 (= lt!264110 (checkBitsLoop!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283 expected!82 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)))))

(assert (=> d!60561 (= (checkBitsLoopPure!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283 expected!82 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)) (tuple2!14731 (_2!8002 lt!264110) (_1!8002 lt!264110)))))

(declare-fun bs!15077 () Bool)

(assert (= bs!15077 d!60561))

(assert (=> bs!15077 m!270435))

(declare-fun m!270459 () Bool)

(assert (=> bs!15077 m!270459))

(assert (=> b!171287 d!60561))

(declare-fun d!60563 () Bool)

(declare-fun e!119611 () Bool)

(assert (=> d!60563 e!119611))

(declare-fun res!142077 () Bool)

(assert (=> d!60563 (=> (not res!142077) (not e!119611))))

(declare-fun lt!264136 () (_ BitVec 64))

(declare-fun lt!264135 () BitStream!7202)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!60563 (= res!142077 (= (bvadd lt!264136 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4032 (buf!4475 lt!264135)) (currentByte!8492 lt!264135) (currentBit!8487 lt!264135))))))

(assert (=> d!60563 (or (not (= (bvand lt!264136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264136 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60563 (= lt!264136 (bitIndex!0 (size!4032 (buf!4475 bs!64)) (currentByte!8492 bs!64) (currentBit!8487 bs!64)))))

(declare-datatypes ((Unit!12247 0))(
  ( (Unit!12248) )
))
(declare-datatypes ((tuple2!14742 0))(
  ( (tuple2!14743 (_1!8004 Unit!12247) (_2!8004 BitStream!7202)) )
))
(declare-fun moveBitIndex!0 (BitStream!7202 (_ BitVec 64)) tuple2!14742)

(assert (=> d!60563 (= lt!264135 (_2!8004 (moveBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7202 (_ BitVec 64)) Bool)

(assert (=> d!60563 (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!60563 (= (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) lt!264135)))

(declare-fun b!171297 () Bool)

(assert (=> b!171297 (= e!119611 (= (size!4032 (buf!4475 bs!64)) (size!4032 (buf!4475 lt!264135))))))

(assert (= (and d!60563 res!142077) b!171297))

(declare-fun m!270485 () Bool)

(assert (=> d!60563 m!270485))

(declare-fun m!270487 () Bool)

(assert (=> d!60563 m!270487))

(declare-fun m!270489 () Bool)

(assert (=> d!60563 m!270489))

(declare-fun m!270491 () Bool)

(assert (=> d!60563 m!270491))

(assert (=> b!171287 d!60563))

(declare-fun d!60577 () Bool)

(declare-fun lt!264139 () tuple2!14738)

(declare-fun readBit!0 (BitStream!7202) tuple2!14738)

(assert (=> d!60577 (= lt!264139 (readBit!0 bs!64))))

(assert (=> d!60577 (= (readBitPure!0 bs!64) (tuple2!14731 (_2!8002 lt!264139) (_1!8002 lt!264139)))))

(declare-fun bs!15083 () Bool)

(assert (= bs!15083 d!60577))

(declare-fun m!270495 () Bool)

(assert (=> bs!15083 m!270495))

(assert (=> b!171287 d!60577))

(declare-fun lt!264140 () tuple2!14738)

(declare-fun d!60579 () Bool)

(assert (=> d!60579 (= lt!264140 (checkBitsLoop!0 bs!64 nBits!283 expected!82 from!235))))

(assert (=> d!60579 (= (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235) (tuple2!14731 (_2!8002 lt!264140) (_1!8002 lt!264140)))))

(declare-fun bs!15084 () Bool)

(assert (= bs!15084 d!60579))

(declare-fun m!270497 () Bool)

(assert (=> bs!15084 m!270497))

(assert (=> b!171287 d!60579))

(declare-fun d!60581 () Bool)

(assert (=> d!60581 (= (array_inv!3773 (buf!4475 bs!64)) (bvsge (size!4032 (buf!4475 bs!64)) #b00000000000000000000000000000000))))

(assert (=> b!171288 d!60581))

(push 1)

(assert (not d!60563))

(assert (not d!60577))

(assert (not d!60579))

(assert (not d!60557))

(assert (not d!60559))

(assert (not d!60561))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60593 () Bool)

(declare-fun e!119639 () Bool)

(assert (=> d!60593 e!119639))

(declare-fun res!142101 () Bool)

(assert (=> d!60593 (=> (not res!142101) (not e!119639))))

(declare-fun increaseBitIndex!0 (BitStream!7202) tuple2!14742)

(assert (=> d!60593 (= res!142101 (= (buf!4475 (_2!8004 (increaseBitIndex!0 bs!64))) (buf!4475 bs!64)))))

(declare-fun lt!264225 () Bool)

(assert (=> d!60593 (= lt!264225 (not (= (bvand ((_ sign_extend 24) (select (arr!4962 (buf!4475 bs!64)) (currentByte!8492 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8487 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!264222 () tuple2!14738)

(assert (=> d!60593 (= lt!264222 (tuple2!14739 (not (= (bvand ((_ sign_extend 24) (select (arr!4962 (buf!4475 bs!64)) (currentByte!8492 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8487 bs!64)))) #b00000000000000000000000000000000)) (_2!8004 (increaseBitIndex!0 bs!64))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!60593 (validate_offset_bit!0 ((_ sign_extend 32) (size!4032 (buf!4475 bs!64))) ((_ sign_extend 32) (currentByte!8492 bs!64)) ((_ sign_extend 32) (currentBit!8487 bs!64)))))

(assert (=> d!60593 (= (readBit!0 bs!64) lt!264222)))

(declare-fun b!171329 () Bool)

(declare-fun lt!264223 () (_ BitVec 64))

(declare-fun lt!264227 () (_ BitVec 64))

(assert (=> b!171329 (= e!119639 (= (bitIndex!0 (size!4032 (buf!4475 (_2!8004 (increaseBitIndex!0 bs!64)))) (currentByte!8492 (_2!8004 (increaseBitIndex!0 bs!64))) (currentBit!8487 (_2!8004 (increaseBitIndex!0 bs!64)))) (bvadd lt!264227 lt!264223)))))

(assert (=> b!171329 (or (not (= (bvand lt!264227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264223 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264227 lt!264223) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171329 (= lt!264223 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171329 (= lt!264227 (bitIndex!0 (size!4032 (buf!4475 bs!64)) (currentByte!8492 bs!64) (currentBit!8487 bs!64)))))

(declare-fun lt!264224 () Bool)

(assert (=> b!171329 (= lt!264224 (not (= (bvand ((_ sign_extend 24) (select (arr!4962 (buf!4475 bs!64)) (currentByte!8492 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8487 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!264226 () Bool)

(assert (=> b!171329 (= lt!264226 (not (= (bvand ((_ sign_extend 24) (select (arr!4962 (buf!4475 bs!64)) (currentByte!8492 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8487 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!264228 () Bool)

(assert (=> b!171329 (= lt!264228 (not (= (bvand ((_ sign_extend 24) (select (arr!4962 (buf!4475 bs!64)) (currentByte!8492 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8487 bs!64)))) #b00000000000000000000000000000000)))))

(assert (= (and d!60593 res!142101) b!171329))

(declare-fun m!270513 () Bool)

(assert (=> d!60593 m!270513))

(declare-fun m!270515 () Bool)

(assert (=> d!60593 m!270515))

(declare-fun m!270517 () Bool)

(assert (=> d!60593 m!270517))

(declare-fun m!270519 () Bool)

(assert (=> d!60593 m!270519))

(declare-fun m!270521 () Bool)

(assert (=> b!171329 m!270521))

(assert (=> b!171329 m!270513))

(assert (=> b!171329 m!270487))

(assert (=> b!171329 m!270515))

(assert (=> b!171329 m!270517))

(assert (=> d!60577 d!60593))

(declare-fun d!60597 () Bool)

(assert (=> d!60597 (= (invariant!0 (currentBit!8487 bs!64) (currentByte!8492 bs!64) (size!4032 (buf!4475 bs!64))) (and (bvsge (currentBit!8487 bs!64) #b00000000000000000000000000000000) (bvslt (currentBit!8487 bs!64) #b00000000000000000000000000001000) (bvsge (currentByte!8492 bs!64) #b00000000000000000000000000000000) (or (bvslt (currentByte!8492 bs!64) (size!4032 (buf!4475 bs!64))) (and (= (currentBit!8487 bs!64) #b00000000000000000000000000000000) (= (currentByte!8492 bs!64) (size!4032 (buf!4475 bs!64)))))))))

(assert (=> d!60557 d!60597))

(declare-fun d!60601 () Bool)

(declare-fun e!119657 () Bool)

(assert (=> d!60601 e!119657))

(declare-fun res!142117 () Bool)

(assert (=> d!60601 (=> (not res!142117) (not e!119657))))

(declare-fun lt!264273 () (_ BitVec 64))

(declare-fun lt!264272 () (_ BitVec 64))

(declare-fun lt!264274 () (_ BitVec 64))

(assert (=> d!60601 (= res!142117 (= lt!264273 (bvsub lt!264272 lt!264274)))))

(assert (=> d!60601 (or (= (bvand lt!264272 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264274 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264272 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264272 lt!264274) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60601 (= lt!264274 (remainingBits!0 ((_ sign_extend 32) (size!4032 (buf!4475 lt!264135))) ((_ sign_extend 32) (currentByte!8492 lt!264135)) ((_ sign_extend 32) (currentBit!8487 lt!264135))))))

(declare-fun lt!264275 () (_ BitVec 64))

(declare-fun lt!264271 () (_ BitVec 64))

(assert (=> d!60601 (= lt!264272 (bvmul lt!264275 lt!264271))))

(assert (=> d!60601 (or (= lt!264275 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264271 (bvsdiv (bvmul lt!264275 lt!264271) lt!264275)))))

(assert (=> d!60601 (= lt!264271 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60601 (= lt!264275 ((_ sign_extend 32) (size!4032 (buf!4475 lt!264135))))))

(assert (=> d!60601 (= lt!264273 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8492 lt!264135)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8487 lt!264135))))))

(assert (=> d!60601 (invariant!0 (currentBit!8487 lt!264135) (currentByte!8492 lt!264135) (size!4032 (buf!4475 lt!264135)))))

(assert (=> d!60601 (= (bitIndex!0 (size!4032 (buf!4475 lt!264135)) (currentByte!8492 lt!264135) (currentBit!8487 lt!264135)) lt!264273)))

(declare-fun b!171349 () Bool)

(declare-fun res!142118 () Bool)

(assert (=> b!171349 (=> (not res!142118) (not e!119657))))

(assert (=> b!171349 (= res!142118 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264273))))

(declare-fun b!171350 () Bool)

(declare-fun lt!264270 () (_ BitVec 64))

(assert (=> b!171350 (= e!119657 (bvsle lt!264273 (bvmul lt!264270 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171350 (or (= lt!264270 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264270 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264270)))))

(assert (=> b!171350 (= lt!264270 ((_ sign_extend 32) (size!4032 (buf!4475 lt!264135))))))

(assert (= (and d!60601 res!142117) b!171349))

(assert (= (and b!171349 res!142118) b!171350))

(declare-fun m!270533 () Bool)

(assert (=> d!60601 m!270533))

(declare-fun m!270535 () Bool)

(assert (=> d!60601 m!270535))

(assert (=> d!60563 d!60601))

(declare-fun d!60607 () Bool)

(declare-fun e!119658 () Bool)

(assert (=> d!60607 e!119658))

(declare-fun res!142119 () Bool)

(assert (=> d!60607 (=> (not res!142119) (not e!119658))))

(declare-fun lt!264279 () (_ BitVec 64))

(declare-fun lt!264280 () (_ BitVec 64))

(declare-fun lt!264278 () (_ BitVec 64))

(assert (=> d!60607 (= res!142119 (= lt!264279 (bvsub lt!264278 lt!264280)))))

(assert (=> d!60607 (or (= (bvand lt!264278 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264280 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264278 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264278 lt!264280) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60607 (= lt!264280 (remainingBits!0 ((_ sign_extend 32) (size!4032 (buf!4475 bs!64))) ((_ sign_extend 32) (currentByte!8492 bs!64)) ((_ sign_extend 32) (currentBit!8487 bs!64))))))

(declare-fun lt!264281 () (_ BitVec 64))

(declare-fun lt!264277 () (_ BitVec 64))

(assert (=> d!60607 (= lt!264278 (bvmul lt!264281 lt!264277))))

(assert (=> d!60607 (or (= lt!264281 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264277 (bvsdiv (bvmul lt!264281 lt!264277) lt!264281)))))

(assert (=> d!60607 (= lt!264277 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60607 (= lt!264281 ((_ sign_extend 32) (size!4032 (buf!4475 bs!64))))))

(assert (=> d!60607 (= lt!264279 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8492 bs!64)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8487 bs!64))))))

(assert (=> d!60607 (invariant!0 (currentBit!8487 bs!64) (currentByte!8492 bs!64) (size!4032 (buf!4475 bs!64)))))

(assert (=> d!60607 (= (bitIndex!0 (size!4032 (buf!4475 bs!64)) (currentByte!8492 bs!64) (currentBit!8487 bs!64)) lt!264279)))

(declare-fun b!171351 () Bool)

(declare-fun res!142120 () Bool)

(assert (=> b!171351 (=> (not res!142120) (not e!119658))))

(assert (=> b!171351 (= res!142120 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264279))))

(declare-fun b!171352 () Bool)

(declare-fun lt!264276 () (_ BitVec 64))

(assert (=> b!171352 (= e!119658 (bvsle lt!264279 (bvmul lt!264276 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171352 (or (= lt!264276 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264276 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264276)))))

(assert (=> b!171352 (= lt!264276 ((_ sign_extend 32) (size!4032 (buf!4475 bs!64))))))

(assert (= (and d!60607 res!142119) b!171351))

(assert (= (and b!171351 res!142120) b!171352))

(assert (=> d!60607 m!270457))

(assert (=> d!60607 m!270455))

(assert (=> d!60563 d!60607))

(declare-fun d!60609 () Bool)

(declare-fun lt!264356 () (_ BitVec 32))

(assert (=> d!60609 (= lt!264356 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!264354 () (_ BitVec 32))

(assert (=> d!60609 (= lt!264354 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!119679 () Bool)

(assert (=> d!60609 e!119679))

(declare-fun res!142144 () Bool)

(assert (=> d!60609 (=> (not res!142144) (not e!119679))))

(assert (=> d!60609 (= res!142144 (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!12261 () Unit!12247)

(declare-fun Unit!12262 () Unit!12247)

(declare-fun Unit!12263 () Unit!12247)

(assert (=> d!60609 (= (moveBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!8487 bs!64) lt!264356) #b00000000000000000000000000000000) (tuple2!14743 Unit!12261 (BitStream!7203 (buf!4475 bs!64) (bvsub (bvadd (currentByte!8492 bs!64) lt!264354) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!264356 (currentBit!8487 bs!64)))) (ite (bvsge (bvadd (currentBit!8487 bs!64) lt!264356) #b00000000000000000000000000001000) (tuple2!14743 Unit!12262 (BitStream!7203 (buf!4475 bs!64) (bvadd (currentByte!8492 bs!64) lt!264354 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8487 bs!64) lt!264356) #b00000000000000000000000000001000))) (tuple2!14743 Unit!12263 (BitStream!7203 (buf!4475 bs!64) (bvadd (currentByte!8492 bs!64) lt!264354) (bvadd (currentBit!8487 bs!64) lt!264356))))))))

(declare-fun b!171381 () Bool)

(declare-fun e!119678 () Bool)

(assert (=> b!171381 (= e!119679 e!119678)))

(declare-fun res!142145 () Bool)

(assert (=> b!171381 (=> (not res!142145) (not e!119678))))

(declare-fun lt!264353 () (_ BitVec 64))

(declare-fun lt!264358 () tuple2!14742)

(assert (=> b!171381 (= res!142145 (= (bvadd lt!264353 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4032 (buf!4475 (_2!8004 lt!264358))) (currentByte!8492 (_2!8004 lt!264358)) (currentBit!8487 (_2!8004 lt!264358)))))))

(assert (=> b!171381 (or (not (= (bvand lt!264353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264353 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171381 (= lt!264353 (bitIndex!0 (size!4032 (buf!4475 bs!64)) (currentByte!8492 bs!64) (currentBit!8487 bs!64)))))

(declare-fun lt!264355 () (_ BitVec 32))

(declare-fun lt!264357 () (_ BitVec 32))

(declare-fun Unit!12264 () Unit!12247)

(declare-fun Unit!12265 () Unit!12247)

(declare-fun Unit!12266 () Unit!12247)

(assert (=> b!171381 (= lt!264358 (ite (bvslt (bvadd (currentBit!8487 bs!64) lt!264357) #b00000000000000000000000000000000) (tuple2!14743 Unit!12264 (BitStream!7203 (buf!4475 bs!64) (bvsub (bvadd (currentByte!8492 bs!64) lt!264355) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!264357 (currentBit!8487 bs!64)))) (ite (bvsge (bvadd (currentBit!8487 bs!64) lt!264357) #b00000000000000000000000000001000) (tuple2!14743 Unit!12265 (BitStream!7203 (buf!4475 bs!64) (bvadd (currentByte!8492 bs!64) lt!264355 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8487 bs!64) lt!264357) #b00000000000000000000000000001000))) (tuple2!14743 Unit!12266 (BitStream!7203 (buf!4475 bs!64) (bvadd (currentByte!8492 bs!64) lt!264355) (bvadd (currentBit!8487 bs!64) lt!264357))))))))

(assert (=> b!171381 (= lt!264357 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171381 (= lt!264355 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!171382 () Bool)

(assert (=> b!171382 (= e!119678 (and (= (size!4032 (buf!4475 bs!64)) (size!4032 (buf!4475 (_2!8004 lt!264358)))) (= (buf!4475 bs!64) (buf!4475 (_2!8004 lt!264358)))))))

(assert (= (and d!60609 res!142144) b!171381))

(assert (= (and b!171381 res!142145) b!171382))

(assert (=> d!60609 m!270491))

(declare-fun m!270565 () Bool)

(assert (=> b!171381 m!270565))

(assert (=> b!171381 m!270487))

(assert (=> d!60563 d!60609))

(declare-fun d!60627 () Bool)

(declare-fun res!142148 () Bool)

(declare-fun e!119686 () Bool)

(assert (=> d!60627 (=> (not res!142148) (not e!119686))))

(assert (=> d!60627 (= res!142148 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4032 (buf!4475 bs!64)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4032 (buf!4475 bs!64)))))))))

(assert (=> d!60627 (= (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) e!119686)))

(declare-fun b!171394 () Bool)

(declare-fun lt!264375 () (_ BitVec 64))

(assert (=> b!171394 (= e!119686 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264375) (bvsle lt!264375 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4032 (buf!4475 bs!64)))))))))

(assert (=> b!171394 (= lt!264375 (bvadd (bitIndex!0 (size!4032 (buf!4475 bs!64)) (currentByte!8492 bs!64) (currentBit!8487 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!60627 res!142148) b!171394))

(assert (=> b!171394 m!270487))

(assert (=> d!60563 d!60627))

(declare-fun b!171451 () Bool)

(declare-fun e!119724 () Bool)

(assert (=> b!171451 (= e!119724 (= expected!82 (_2!7998 (readBitPure!0 bs!64))))))

(declare-fun b!171452 () Bool)

(declare-fun e!119725 () Bool)

(assert (=> b!171452 (= e!119725 e!119724)))

(declare-fun res!142190 () Bool)

(assert (=> b!171452 (=> res!142190 e!119724)))

(declare-fun lt!264455 () tuple2!14738)

(assert (=> b!171452 (= res!142190 (or (not (_1!8002 lt!264455)) (bvsge from!235 nBits!283)))))

(declare-fun lt!264459 () (_ BitVec 64))

(declare-fun b!171453 () Bool)

(declare-fun e!119726 () Bool)

(assert (=> b!171453 (= e!119726 (= (bvsub lt!264459 from!235) (bitIndex!0 (size!4032 (buf!4475 (_2!8002 lt!264455))) (currentByte!8492 (_2!8002 lt!264455)) (currentBit!8487 (_2!8002 lt!264455)))))))

(assert (=> b!171453 (or (= (bvand lt!264459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264459 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264451 () (_ BitVec 64))

(assert (=> b!171453 (= lt!264459 (bvadd lt!264451 nBits!283))))

(assert (=> b!171453 (or (not (= (bvand lt!264451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264451 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171453 (= lt!264451 (bitIndex!0 (size!4032 (buf!4475 bs!64)) (currentByte!8492 bs!64) (currentBit!8487 bs!64)))))

(declare-fun b!171455 () Bool)

(declare-fun e!119723 () tuple2!14738)

(declare-fun e!119722 () tuple2!14738)

(assert (=> b!171455 (= e!119723 e!119722)))

(declare-fun lt!264452 () tuple2!14738)

(assert (=> b!171455 (= lt!264452 (readBit!0 bs!64))))

(declare-fun c!8989 () Bool)

(assert (=> b!171455 (= c!8989 (not (= (_1!8002 lt!264452) expected!82)))))

(declare-fun lt!264457 () tuple2!14738)

(declare-fun b!171456 () Bool)

(assert (=> b!171456 (= lt!264457 (checkBitsLoop!0 (_2!8002 lt!264452) nBits!283 expected!82 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!264456 () Unit!12247)

(declare-fun lt!264453 () Unit!12247)

(assert (=> b!171456 (= lt!264456 lt!264453)))

(declare-fun lt!264454 () (_ BitVec 64))

(declare-fun lt!264458 () (_ BitVec 64))

(assert (=> b!171456 (validate_offset_bits!1 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8002 lt!264452)))) ((_ sign_extend 32) (currentByte!8492 (_2!8002 lt!264452))) ((_ sign_extend 32) (currentBit!8487 (_2!8002 lt!264452))) (bvsub lt!264454 lt!264458))))

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!7202 BitStream!7202 (_ BitVec 64) (_ BitVec 64)) Unit!12247)

(assert (=> b!171456 (= lt!264453 (validateOffsetBitsIneqLemma!0 bs!64 (_2!8002 lt!264452) lt!264454 lt!264458))))

(assert (=> b!171456 (= lt!264458 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171456 (= lt!264454 (bvsub nBits!283 from!235))))

(assert (=> b!171456 (= e!119722 (tuple2!14739 (_1!8002 lt!264457) (_2!8002 lt!264457)))))

(declare-fun b!171457 () Bool)

(assert (=> b!171457 (= e!119723 (tuple2!14739 true bs!64))))

(declare-fun b!171458 () Bool)

(declare-fun res!142191 () Bool)

(assert (=> b!171458 (=> (not res!142191) (not e!119725))))

(assert (=> b!171458 (= res!142191 (and (= (buf!4475 bs!64) (buf!4475 (_2!8002 lt!264455))) (or (not (= nBits!283 from!235)) (_1!8002 lt!264455))))))

(declare-fun b!171459 () Bool)

(assert (=> b!171459 (= e!119722 (tuple2!14739 false (_2!8002 lt!264452)))))

(declare-fun b!171454 () Bool)

(declare-fun res!142189 () Bool)

(assert (=> b!171454 (=> (not res!142189) (not e!119725))))

(assert (=> b!171454 (= res!142189 e!119726)))

(declare-fun res!142188 () Bool)

(assert (=> b!171454 (=> res!142188 e!119726)))

(assert (=> b!171454 (= res!142188 (not (_1!8002 lt!264455)))))

(declare-fun d!60629 () Bool)

(assert (=> d!60629 e!119725))

(declare-fun res!142192 () Bool)

(assert (=> d!60629 (=> (not res!142192) (not e!119725))))

(declare-fun lt!264450 () (_ BitVec 64))

(assert (=> d!60629 (= res!142192 (bvsge (bvsub lt!264450 from!235) (bitIndex!0 (size!4032 (buf!4475 (_2!8002 lt!264455))) (currentByte!8492 (_2!8002 lt!264455)) (currentBit!8487 (_2!8002 lt!264455)))))))

(assert (=> d!60629 (or (= (bvand lt!264450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264450 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264449 () (_ BitVec 64))

(assert (=> d!60629 (= lt!264450 (bvadd lt!264449 nBits!283))))

(assert (=> d!60629 (or (not (= (bvand lt!264449 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264449 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264449 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60629 (= lt!264449 (bitIndex!0 (size!4032 (buf!4475 bs!64)) (currentByte!8492 bs!64) (currentBit!8487 bs!64)))))

(assert (=> d!60629 (= lt!264455 e!119723)))

(declare-fun c!8988 () Bool)

(assert (=> d!60629 (= c!8988 (= from!235 nBits!283))))

(assert (=> d!60629 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!60629 (= (checkBitsLoop!0 bs!64 nBits!283 expected!82 from!235) lt!264455)))

(assert (= (and d!60629 c!8988) b!171457))

(assert (= (and d!60629 (not c!8988)) b!171455))

(assert (= (and b!171455 c!8989) b!171459))

(assert (= (and b!171455 (not c!8989)) b!171456))

(assert (= (and d!60629 res!142192) b!171458))

(assert (= (and b!171458 res!142191) b!171454))

(assert (= (and b!171454 (not res!142188)) b!171453))

(assert (= (and b!171454 res!142189) b!171452))

(assert (= (and b!171452 (not res!142190)) b!171451))

(declare-fun m!270591 () Bool)

(assert (=> b!171453 m!270591))

(assert (=> b!171453 m!270487))

(declare-fun m!270593 () Bool)

(assert (=> b!171456 m!270593))

(declare-fun m!270595 () Bool)

(assert (=> b!171456 m!270595))

(declare-fun m!270597 () Bool)

(assert (=> b!171456 m!270597))

(assert (=> b!171451 m!270439))

(assert (=> d!60629 m!270591))

(assert (=> d!60629 m!270487))

(assert (=> b!171455 m!270495))

(assert (=> d!60579 d!60629))

(declare-fun b!171460 () Bool)

(declare-fun e!119729 () Bool)

(assert (=> b!171460 (= e!119729 (= expected!82 (_2!7998 (readBitPure!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(declare-fun b!171461 () Bool)

(declare-fun e!119730 () Bool)

(assert (=> b!171461 (= e!119730 e!119729)))

(declare-fun res!142195 () Bool)

(assert (=> b!171461 (=> res!142195 e!119729)))

(declare-fun lt!264466 () tuple2!14738)

(assert (=> b!171461 (= res!142195 (or (not (_1!8002 lt!264466)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235) nBits!283)))))

(declare-fun e!119731 () Bool)

(declare-fun b!171462 () Bool)

(declare-fun lt!264470 () (_ BitVec 64))

(assert (=> b!171462 (= e!119731 (= (bvsub lt!264470 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)) (bitIndex!0 (size!4032 (buf!4475 (_2!8002 lt!264466))) (currentByte!8492 (_2!8002 lt!264466)) (currentBit!8487 (_2!8002 lt!264466)))))))

(assert (=> b!171462 (or (= (bvand lt!264470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264470 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264462 () (_ BitVec 64))

(assert (=> b!171462 (= lt!264470 (bvadd lt!264462 nBits!283))))

(assert (=> b!171462 (or (not (= (bvand lt!264462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264462 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171462 (= lt!264462 (bitIndex!0 (size!4032 (buf!4475 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8492 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!8487 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!171464 () Bool)

(declare-fun e!119728 () tuple2!14738)

(declare-fun e!119727 () tuple2!14738)

(assert (=> b!171464 (= e!119728 e!119727)))

(declare-fun lt!264463 () tuple2!14738)

(assert (=> b!171464 (= lt!264463 (readBit!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun c!8991 () Bool)

(assert (=> b!171464 (= c!8991 (not (= (_1!8002 lt!264463) expected!82)))))

(declare-fun lt!264468 () tuple2!14738)

(declare-fun b!171465 () Bool)

(assert (=> b!171465 (= lt!264468 (checkBitsLoop!0 (_2!8002 lt!264463) nBits!283 expected!82 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!264467 () Unit!12247)

(declare-fun lt!264464 () Unit!12247)

(assert (=> b!171465 (= lt!264467 lt!264464)))

(declare-fun lt!264465 () (_ BitVec 64))

(declare-fun lt!264469 () (_ BitVec 64))

(assert (=> b!171465 (validate_offset_bits!1 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8002 lt!264463)))) ((_ sign_extend 32) (currentByte!8492 (_2!8002 lt!264463))) ((_ sign_extend 32) (currentBit!8487 (_2!8002 lt!264463))) (bvsub lt!264465 lt!264469))))

(assert (=> b!171465 (= lt!264464 (validateOffsetBitsIneqLemma!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) (_2!8002 lt!264463) lt!264465 lt!264469))))

(assert (=> b!171465 (= lt!264469 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171465 (= lt!264465 (bvsub nBits!283 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)))))

(assert (=> b!171465 (= e!119727 (tuple2!14739 (_1!8002 lt!264468) (_2!8002 lt!264468)))))

(declare-fun b!171466 () Bool)

(assert (=> b!171466 (= e!119728 (tuple2!14739 true (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!171467 () Bool)

(declare-fun res!142196 () Bool)

(assert (=> b!171467 (=> (not res!142196) (not e!119730))))

(assert (=> b!171467 (= res!142196 (and (= (buf!4475 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (buf!4475 (_2!8002 lt!264466))) (or (not (= nBits!283 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235))) (_1!8002 lt!264466))))))

(declare-fun b!171468 () Bool)

(assert (=> b!171468 (= e!119727 (tuple2!14739 false (_2!8002 lt!264463)))))

(declare-fun b!171463 () Bool)

(declare-fun res!142194 () Bool)

(assert (=> b!171463 (=> (not res!142194) (not e!119730))))

(assert (=> b!171463 (= res!142194 e!119731)))

(declare-fun res!142193 () Bool)

(assert (=> b!171463 (=> res!142193 e!119731)))

(assert (=> b!171463 (= res!142193 (not (_1!8002 lt!264466)))))

(declare-fun d!60639 () Bool)

(assert (=> d!60639 e!119730))

(declare-fun res!142197 () Bool)

(assert (=> d!60639 (=> (not res!142197) (not e!119730))))

(declare-fun lt!264461 () (_ BitVec 64))

(assert (=> d!60639 (= res!142197 (bvsge (bvsub lt!264461 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)) (bitIndex!0 (size!4032 (buf!4475 (_2!8002 lt!264466))) (currentByte!8492 (_2!8002 lt!264466)) (currentBit!8487 (_2!8002 lt!264466)))))))

(assert (=> d!60639 (or (= (bvand lt!264461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264461 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264460 () (_ BitVec 64))

(assert (=> d!60639 (= lt!264461 (bvadd lt!264460 nBits!283))))

(assert (=> d!60639 (or (not (= (bvand lt!264460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264460 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60639 (= lt!264460 (bitIndex!0 (size!4032 (buf!4475 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8492 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!8487 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!60639 (= lt!264466 e!119728)))

(declare-fun c!8990 () Bool)

(assert (=> d!60639 (= c!8990 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235) nBits!283))))

(assert (=> d!60639 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!60639 (= (checkBitsLoop!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283 expected!82 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)) lt!264466)))

(assert (= (and d!60639 c!8990) b!171466))

(assert (= (and d!60639 (not c!8990)) b!171464))

(assert (= (and b!171464 c!8991) b!171468))

(assert (= (and b!171464 (not c!8991)) b!171465))

(assert (= (and d!60639 res!142197) b!171467))

(assert (= (and b!171467 res!142196) b!171463))

(assert (= (and b!171463 (not res!142193)) b!171462))

(assert (= (and b!171463 res!142194) b!171461))

(assert (= (and b!171461 (not res!142195)) b!171460))

(declare-fun m!270599 () Bool)

(assert (=> b!171462 m!270599))

(declare-fun m!270601 () Bool)

(assert (=> b!171462 m!270601))

(declare-fun m!270603 () Bool)

(assert (=> b!171465 m!270603))

(declare-fun m!270605 () Bool)

(assert (=> b!171465 m!270605))

(assert (=> b!171465 m!270435))

(declare-fun m!270607 () Bool)

(assert (=> b!171465 m!270607))

(assert (=> b!171460 m!270435))

(declare-fun m!270609 () Bool)

(assert (=> b!171460 m!270609))

(assert (=> d!60639 m!270599))

(assert (=> d!60639 m!270601))

(assert (=> b!171464 m!270435))

(declare-fun m!270611 () Bool)

(assert (=> b!171464 m!270611))

(assert (=> d!60561 d!60639))

(declare-fun d!60641 () Bool)

(assert (=> d!60641 (= (remainingBits!0 ((_ sign_extend 32) (size!4032 (buf!4475 bs!64))) ((_ sign_extend 32) (currentByte!8492 bs!64)) ((_ sign_extend 32) (currentBit!8487 bs!64))) (bvsub (bvmul ((_ sign_extend 32) (size!4032 (buf!4475 bs!64))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8492 bs!64)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8487 bs!64)))))))

(assert (=> d!60559 d!60641))

(push 1)

(assert (not d!60629))

(assert (not d!60593))

(assert (not b!171453))

(assert (not b!171462))

(assert (not b!171394))

(assert (not b!171460))

(assert (not d!60609))

(assert (not d!60639))

(assert (not b!171464))

(assert (not b!171456))

(assert (not d!60607))

(assert (not d!60601))

(assert (not b!171455))

(assert (not b!171329))

(assert (not b!171465))

(assert (not b!171451))

(assert (not b!171381))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!171508 () Bool)

(declare-fun e!119757 () Bool)

(assert (=> b!171508 (= e!119757 (= expected!82 (_2!7998 (readBitPure!0 (_2!8002 lt!264452)))))))

(declare-fun b!171509 () Bool)

(declare-fun e!119758 () Bool)

(assert (=> b!171509 (= e!119758 e!119757)))

(declare-fun res!142231 () Bool)

(assert (=> b!171509 (=> res!142231 e!119757)))

(declare-fun lt!264556 () tuple2!14738)

(assert (=> b!171509 (= res!142231 (or (not (_1!8002 lt!264556)) (bvsge (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283)))))

(declare-fun e!119759 () Bool)

(declare-fun b!171510 () Bool)

(declare-fun lt!264560 () (_ BitVec 64))

(assert (=> b!171510 (= e!119759 (= (bvsub lt!264560 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!4032 (buf!4475 (_2!8002 lt!264556))) (currentByte!8492 (_2!8002 lt!264556)) (currentBit!8487 (_2!8002 lt!264556)))))))

(assert (=> b!171510 (or (= (bvand lt!264560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264560 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264552 () (_ BitVec 64))

(assert (=> b!171510 (= lt!264560 (bvadd lt!264552 nBits!283))))

(assert (=> b!171510 (or (not (= (bvand lt!264552 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264552 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264552 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171510 (= lt!264552 (bitIndex!0 (size!4032 (buf!4475 (_2!8002 lt!264452))) (currentByte!8492 (_2!8002 lt!264452)) (currentBit!8487 (_2!8002 lt!264452))))))

(declare-fun b!171512 () Bool)

(declare-fun e!119756 () tuple2!14738)

(declare-fun e!119755 () tuple2!14738)

(assert (=> b!171512 (= e!119756 e!119755)))

(declare-fun lt!264553 () tuple2!14738)

(assert (=> b!171512 (= lt!264553 (readBit!0 (_2!8002 lt!264452)))))

(declare-fun c!8997 () Bool)

(assert (=> b!171512 (= c!8997 (not (= (_1!8002 lt!264553) expected!82)))))

(declare-fun lt!264558 () tuple2!14738)

(declare-fun b!171513 () Bool)

(assert (=> b!171513 (= lt!264558 (checkBitsLoop!0 (_2!8002 lt!264553) nBits!283 expected!82 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!264557 () Unit!12247)

(declare-fun lt!264554 () Unit!12247)

(assert (=> b!171513 (= lt!264557 lt!264554)))

(declare-fun lt!264555 () (_ BitVec 64))

(declare-fun lt!264559 () (_ BitVec 64))

(assert (=> b!171513 (validate_offset_bits!1 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8002 lt!264553)))) ((_ sign_extend 32) (currentByte!8492 (_2!8002 lt!264553))) ((_ sign_extend 32) (currentBit!8487 (_2!8002 lt!264553))) (bvsub lt!264555 lt!264559))))

(assert (=> b!171513 (= lt!264554 (validateOffsetBitsIneqLemma!0 (_2!8002 lt!264452) (_2!8002 lt!264553) lt!264555 lt!264559))))

(assert (=> b!171513 (= lt!264559 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171513 (= lt!264555 (bvsub nBits!283 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!171513 (= e!119755 (tuple2!14739 (_1!8002 lt!264558) (_2!8002 lt!264558)))))

(declare-fun b!171514 () Bool)

(assert (=> b!171514 (= e!119756 (tuple2!14739 true (_2!8002 lt!264452)))))

(declare-fun b!171515 () Bool)

(declare-fun res!142232 () Bool)

(assert (=> b!171515 (=> (not res!142232) (not e!119758))))

(assert (=> b!171515 (= res!142232 (and (= (buf!4475 (_2!8002 lt!264452)) (buf!4475 (_2!8002 lt!264556))) (or (not (= nBits!283 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001))) (_1!8002 lt!264556))))))

(declare-fun b!171516 () Bool)

(assert (=> b!171516 (= e!119755 (tuple2!14739 false (_2!8002 lt!264553)))))

(declare-fun b!171511 () Bool)

(declare-fun res!142230 () Bool)

(assert (=> b!171511 (=> (not res!142230) (not e!119758))))

(assert (=> b!171511 (= res!142230 e!119759)))

(declare-fun res!142229 () Bool)

(assert (=> b!171511 (=> res!142229 e!119759)))

(assert (=> b!171511 (= res!142229 (not (_1!8002 lt!264556)))))

(declare-fun d!60677 () Bool)

(assert (=> d!60677 e!119758))

(declare-fun res!142233 () Bool)

(assert (=> d!60677 (=> (not res!142233) (not e!119758))))

(declare-fun lt!264551 () (_ BitVec 64))

(assert (=> d!60677 (= res!142233 (bvsge (bvsub lt!264551 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!4032 (buf!4475 (_2!8002 lt!264556))) (currentByte!8492 (_2!8002 lt!264556)) (currentBit!8487 (_2!8002 lt!264556)))))))

(assert (=> d!60677 (or (= (bvand lt!264551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264551 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264550 () (_ BitVec 64))

(assert (=> d!60677 (= lt!264551 (bvadd lt!264550 nBits!283))))

(assert (=> d!60677 (or (not (= (bvand lt!264550 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264550 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264550 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60677 (= lt!264550 (bitIndex!0 (size!4032 (buf!4475 (_2!8002 lt!264452))) (currentByte!8492 (_2!8002 lt!264452)) (currentBit!8487 (_2!8002 lt!264452))))))

(assert (=> d!60677 (= lt!264556 e!119756)))

(declare-fun c!8996 () Bool)

(assert (=> d!60677 (= c!8996 (= (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283))))

(assert (=> d!60677 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!60677 (= (checkBitsLoop!0 (_2!8002 lt!264452) nBits!283 expected!82 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!264556)))

(assert (= (and d!60677 c!8996) b!171514))

(assert (= (and d!60677 (not c!8996)) b!171512))

(assert (= (and b!171512 c!8997) b!171516))

(assert (= (and b!171512 (not c!8997)) b!171513))

(assert (= (and d!60677 res!142233) b!171515))

(assert (= (and b!171515 res!142232) b!171511))

(assert (= (and b!171511 (not res!142229)) b!171510))

(assert (= (and b!171511 res!142230) b!171509))

(assert (= (and b!171509 (not res!142231)) b!171508))

(declare-fun m!270683 () Bool)

(assert (=> b!171510 m!270683))

(declare-fun m!270685 () Bool)

(assert (=> b!171510 m!270685))

(declare-fun m!270687 () Bool)

(assert (=> b!171513 m!270687))

(declare-fun m!270689 () Bool)

(assert (=> b!171513 m!270689))

(declare-fun m!270691 () Bool)

(assert (=> b!171513 m!270691))

(declare-fun m!270693 () Bool)

(assert (=> b!171508 m!270693))

(assert (=> d!60677 m!270683))

(assert (=> d!60677 m!270685))

(declare-fun m!270695 () Bool)

(assert (=> b!171512 m!270695))

(assert (=> b!171456 d!60677))

(declare-fun d!60679 () Bool)

(assert (=> d!60679 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8002 lt!264452)))) ((_ sign_extend 32) (currentByte!8492 (_2!8002 lt!264452))) ((_ sign_extend 32) (currentBit!8487 (_2!8002 lt!264452))) (bvsub lt!264454 lt!264458)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8002 lt!264452)))) ((_ sign_extend 32) (currentByte!8492 (_2!8002 lt!264452))) ((_ sign_extend 32) (currentBit!8487 (_2!8002 lt!264452)))) (bvsub lt!264454 lt!264458)))))

(declare-fun bs!15089 () Bool)

(assert (= bs!15089 d!60679))

(declare-fun m!270697 () Bool)

(assert (=> bs!15089 m!270697))

(assert (=> b!171456 d!60679))

(declare-fun d!60681 () Bool)

(declare-fun e!119762 () Bool)

(assert (=> d!60681 e!119762))

(declare-fun res!142236 () Bool)

(assert (=> d!60681 (=> (not res!142236) (not e!119762))))

(assert (=> d!60681 (= res!142236 (or (= (bvand lt!264454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264458 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264454 lt!264458) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!264563 () Unit!12247)

(declare-fun choose!27 (BitStream!7202 BitStream!7202 (_ BitVec 64) (_ BitVec 64)) Unit!12247)

(assert (=> d!60681 (= lt!264563 (choose!27 bs!64 (_2!8002 lt!264452) lt!264454 lt!264458))))

(assert (=> d!60681 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264458) (bvsle lt!264458 lt!264454))))

(assert (=> d!60681 (= (validateOffsetBitsIneqLemma!0 bs!64 (_2!8002 lt!264452) lt!264454 lt!264458) lt!264563)))

(declare-fun b!171519 () Bool)

(assert (=> b!171519 (= e!119762 (validate_offset_bits!1 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8002 lt!264452)))) ((_ sign_extend 32) (currentByte!8492 (_2!8002 lt!264452))) ((_ sign_extend 32) (currentBit!8487 (_2!8002 lt!264452))) (bvsub lt!264454 lt!264458)))))

(assert (= (and d!60681 res!142236) b!171519))

(declare-fun m!270699 () Bool)

(assert (=> d!60681 m!270699))

(assert (=> b!171519 m!270595))

(assert (=> b!171456 d!60681))

(declare-fun b!171520 () Bool)

(declare-fun e!119765 () Bool)

(assert (=> b!171520 (= e!119765 (= expected!82 (_2!7998 (readBitPure!0 (_2!8002 lt!264463)))))))

(declare-fun b!171521 () Bool)

(declare-fun e!119766 () Bool)

(assert (=> b!171521 (= e!119766 e!119765)))

(declare-fun res!142239 () Bool)

(assert (=> b!171521 (=> res!142239 e!119765)))

(declare-fun lt!264570 () tuple2!14738)

(assert (=> b!171521 (= res!142239 (or (not (_1!8002 lt!264570)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283)))))

(declare-fun lt!264574 () (_ BitVec 64))

(declare-fun e!119767 () Bool)

(declare-fun b!171522 () Bool)

(assert (=> b!171522 (= e!119767 (= (bvsub lt!264574 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!4032 (buf!4475 (_2!8002 lt!264570))) (currentByte!8492 (_2!8002 lt!264570)) (currentBit!8487 (_2!8002 lt!264570)))))))

(assert (=> b!171522 (or (= (bvand lt!264574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264574 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264566 () (_ BitVec 64))

(assert (=> b!171522 (= lt!264574 (bvadd lt!264566 nBits!283))))

(assert (=> b!171522 (or (not (= (bvand lt!264566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264566 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171522 (= lt!264566 (bitIndex!0 (size!4032 (buf!4475 (_2!8002 lt!264463))) (currentByte!8492 (_2!8002 lt!264463)) (currentBit!8487 (_2!8002 lt!264463))))))

(declare-fun b!171524 () Bool)

(declare-fun e!119764 () tuple2!14738)

(declare-fun e!119763 () tuple2!14738)

(assert (=> b!171524 (= e!119764 e!119763)))

(declare-fun lt!264567 () tuple2!14738)

(assert (=> b!171524 (= lt!264567 (readBit!0 (_2!8002 lt!264463)))))

(declare-fun c!8999 () Bool)

(assert (=> b!171524 (= c!8999 (not (= (_1!8002 lt!264567) expected!82)))))

(declare-fun b!171525 () Bool)

(declare-fun lt!264572 () tuple2!14738)

(assert (=> b!171525 (= lt!264572 (checkBitsLoop!0 (_2!8002 lt!264567) nBits!283 expected!82 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!264571 () Unit!12247)

(declare-fun lt!264568 () Unit!12247)

(assert (=> b!171525 (= lt!264571 lt!264568)))

(declare-fun lt!264569 () (_ BitVec 64))

(declare-fun lt!264573 () (_ BitVec 64))

(assert (=> b!171525 (validate_offset_bits!1 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8002 lt!264567)))) ((_ sign_extend 32) (currentByte!8492 (_2!8002 lt!264567))) ((_ sign_extend 32) (currentBit!8487 (_2!8002 lt!264567))) (bvsub lt!264569 lt!264573))))

(assert (=> b!171525 (= lt!264568 (validateOffsetBitsIneqLemma!0 (_2!8002 lt!264463) (_2!8002 lt!264567) lt!264569 lt!264573))))

(assert (=> b!171525 (= lt!264573 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171525 (= lt!264569 (bvsub nBits!283 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!171525 (= e!119763 (tuple2!14739 (_1!8002 lt!264572) (_2!8002 lt!264572)))))

(declare-fun b!171526 () Bool)

(assert (=> b!171526 (= e!119764 (tuple2!14739 true (_2!8002 lt!264463)))))

(declare-fun b!171527 () Bool)

(declare-fun res!142240 () Bool)

(assert (=> b!171527 (=> (not res!142240) (not e!119766))))

(assert (=> b!171527 (= res!142240 (and (= (buf!4475 (_2!8002 lt!264463)) (buf!4475 (_2!8002 lt!264570))) (or (not (= nBits!283 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001))) (_1!8002 lt!264570))))))

(declare-fun b!171528 () Bool)

(assert (=> b!171528 (= e!119763 (tuple2!14739 false (_2!8002 lt!264567)))))

(declare-fun b!171523 () Bool)

(declare-fun res!142238 () Bool)

(assert (=> b!171523 (=> (not res!142238) (not e!119766))))

(assert (=> b!171523 (= res!142238 e!119767)))

(declare-fun res!142237 () Bool)

(assert (=> b!171523 (=> res!142237 e!119767)))

(assert (=> b!171523 (= res!142237 (not (_1!8002 lt!264570)))))

(declare-fun d!60683 () Bool)

(assert (=> d!60683 e!119766))

(declare-fun res!142241 () Bool)

(assert (=> d!60683 (=> (not res!142241) (not e!119766))))

(declare-fun lt!264565 () (_ BitVec 64))

(assert (=> d!60683 (= res!142241 (bvsge (bvsub lt!264565 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!4032 (buf!4475 (_2!8002 lt!264570))) (currentByte!8492 (_2!8002 lt!264570)) (currentBit!8487 (_2!8002 lt!264570)))))))

(assert (=> d!60683 (or (= (bvand lt!264565 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264565 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264565 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!264564 () (_ BitVec 64))

(assert (=> d!60683 (= lt!264565 (bvadd lt!264564 nBits!283))))

(assert (=> d!60683 (or (not (= (bvand lt!264564 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264564 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264564 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60683 (= lt!264564 (bitIndex!0 (size!4032 (buf!4475 (_2!8002 lt!264463))) (currentByte!8492 (_2!8002 lt!264463)) (currentBit!8487 (_2!8002 lt!264463))))))

(assert (=> d!60683 (= lt!264570 e!119764)))

(declare-fun c!8998 () Bool)

(assert (=> d!60683 (= c!8998 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!283))))

(assert (=> d!60683 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!60683 (= (checkBitsLoop!0 (_2!8002 lt!264463) nBits!283 expected!82 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!264570)))

(assert (= (and d!60683 c!8998) b!171526))

(assert (= (and d!60683 (not c!8998)) b!171524))

(assert (= (and b!171524 c!8999) b!171528))

(assert (= (and b!171524 (not c!8999)) b!171525))

(assert (= (and d!60683 res!142241) b!171527))

(assert (= (and b!171527 res!142240) b!171523))

(assert (= (and b!171523 (not res!142237)) b!171522))

(assert (= (and b!171523 res!142238) b!171521))

(assert (= (and b!171521 (not res!142239)) b!171520))

(declare-fun m!270701 () Bool)

(assert (=> b!171522 m!270701))

(declare-fun m!270703 () Bool)

(assert (=> b!171522 m!270703))

(declare-fun m!270705 () Bool)

(assert (=> b!171525 m!270705))

(declare-fun m!270707 () Bool)

(assert (=> b!171525 m!270707))

(declare-fun m!270709 () Bool)

(assert (=> b!171525 m!270709))

(declare-fun m!270711 () Bool)

(assert (=> b!171520 m!270711))

(assert (=> d!60683 m!270701))

(assert (=> d!60683 m!270703))

(declare-fun m!270713 () Bool)

(assert (=> b!171524 m!270713))

(assert (=> b!171465 d!60683))

(declare-fun d!60685 () Bool)

(assert (=> d!60685 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8002 lt!264463)))) ((_ sign_extend 32) (currentByte!8492 (_2!8002 lt!264463))) ((_ sign_extend 32) (currentBit!8487 (_2!8002 lt!264463))) (bvsub lt!264465 lt!264469)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8002 lt!264463)))) ((_ sign_extend 32) (currentByte!8492 (_2!8002 lt!264463))) ((_ sign_extend 32) (currentBit!8487 (_2!8002 lt!264463)))) (bvsub lt!264465 lt!264469)))))

(declare-fun bs!15090 () Bool)

(assert (= bs!15090 d!60685))

(declare-fun m!270715 () Bool)

(assert (=> bs!15090 m!270715))

(assert (=> b!171465 d!60685))

(declare-fun d!60687 () Bool)

(declare-fun e!119768 () Bool)

(assert (=> d!60687 e!119768))

(declare-fun res!142242 () Bool)

(assert (=> d!60687 (=> (not res!142242) (not e!119768))))

(assert (=> d!60687 (= res!142242 (or (= (bvand lt!264465 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264469 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264465 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264465 lt!264469) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!264575 () Unit!12247)

(assert (=> d!60687 (= lt!264575 (choose!27 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) (_2!8002 lt!264463) lt!264465 lt!264469))))

(assert (=> d!60687 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264469) (bvsle lt!264469 lt!264465))))

(assert (=> d!60687 (= (validateOffsetBitsIneqLemma!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) (_2!8002 lt!264463) lt!264465 lt!264469) lt!264575)))

(declare-fun b!171529 () Bool)

(assert (=> b!171529 (= e!119768 (validate_offset_bits!1 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8002 lt!264463)))) ((_ sign_extend 32) (currentByte!8492 (_2!8002 lt!264463))) ((_ sign_extend 32) (currentBit!8487 (_2!8002 lt!264463))) (bvsub lt!264465 lt!264469)))))

(assert (= (and d!60687 res!142242) b!171529))

(assert (=> d!60687 m!270435))

(declare-fun m!270717 () Bool)

(assert (=> d!60687 m!270717))

(assert (=> b!171529 m!270605))

(assert (=> b!171465 d!60687))

(assert (=> b!171455 d!60593))

(declare-fun d!60689 () Bool)

(declare-fun e!119769 () Bool)

(assert (=> d!60689 e!119769))

(declare-fun res!142243 () Bool)

(assert (=> d!60689 (=> (not res!142243) (not e!119769))))

(assert (=> d!60689 (= res!142243 (= (buf!4475 (_2!8004 (increaseBitIndex!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) (buf!4475 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!264579 () Bool)

(assert (=> d!60689 (= lt!264579 (not (= (bvand ((_ sign_extend 24) (select (arr!4962 (buf!4475 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8492 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8487 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!264576 () tuple2!14738)

(assert (=> d!60689 (= lt!264576 (tuple2!14739 (not (= (bvand ((_ sign_extend 24) (select (arr!4962 (buf!4475 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8492 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8487 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)) (_2!8004 (increaseBitIndex!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!60689 (validate_offset_bit!0 ((_ sign_extend 32) (size!4032 (buf!4475 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 32) (currentByte!8492 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) ((_ sign_extend 32) (currentBit!8487 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!60689 (= (readBit!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!264576)))

(declare-fun lt!264581 () (_ BitVec 64))

(declare-fun lt!264577 () (_ BitVec 64))

(declare-fun b!171530 () Bool)

(assert (=> b!171530 (= e!119769 (= (bitIndex!0 (size!4032 (buf!4475 (_2!8004 (increaseBitIndex!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))) (currentByte!8492 (_2!8004 (increaseBitIndex!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) (currentBit!8487 (_2!8004 (increaseBitIndex!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))) (bvadd lt!264581 lt!264577)))))

(assert (=> b!171530 (or (not (= (bvand lt!264581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264577 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264581 lt!264577) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171530 (= lt!264577 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171530 (= lt!264581 (bitIndex!0 (size!4032 (buf!4475 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8492 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!8487 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!264578 () Bool)

(assert (=> b!171530 (= lt!264578 (not (= (bvand ((_ sign_extend 24) (select (arr!4962 (buf!4475 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8492 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8487 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!264580 () Bool)

(assert (=> b!171530 (= lt!264580 (not (= (bvand ((_ sign_extend 24) (select (arr!4962 (buf!4475 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8492 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8487 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!264582 () Bool)

(assert (=> b!171530 (= lt!264582 (not (= (bvand ((_ sign_extend 24) (select (arr!4962 (buf!4475 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8492 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8487 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(assert (= (and d!60689 res!142243) b!171530))

(assert (=> d!60689 m!270435))

(declare-fun m!270719 () Bool)

(assert (=> d!60689 m!270719))

(declare-fun m!270721 () Bool)

(assert (=> d!60689 m!270721))

(declare-fun m!270723 () Bool)

(assert (=> d!60689 m!270723))

(declare-fun m!270725 () Bool)

(assert (=> d!60689 m!270725))

(declare-fun m!270727 () Bool)

(assert (=> b!171530 m!270727))

(assert (=> b!171530 m!270435))

(assert (=> b!171530 m!270719))

(assert (=> b!171530 m!270601))

(assert (=> b!171530 m!270721))

(assert (=> b!171530 m!270723))

(assert (=> b!171464 d!60689))

(declare-fun d!60691 () Bool)

(declare-fun e!119770 () Bool)

(assert (=> d!60691 e!119770))

(declare-fun res!142244 () Bool)

(assert (=> d!60691 (=> (not res!142244) (not e!119770))))

(declare-fun lt!264587 () (_ BitVec 64))

(declare-fun lt!264585 () (_ BitVec 64))

(declare-fun lt!264586 () (_ BitVec 64))

(assert (=> d!60691 (= res!142244 (= lt!264586 (bvsub lt!264585 lt!264587)))))

(assert (=> d!60691 (or (= (bvand lt!264585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264587 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264585 lt!264587) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60691 (= lt!264587 (remainingBits!0 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8004 lt!264358)))) ((_ sign_extend 32) (currentByte!8492 (_2!8004 lt!264358))) ((_ sign_extend 32) (currentBit!8487 (_2!8004 lt!264358)))))))

(declare-fun lt!264588 () (_ BitVec 64))

(declare-fun lt!264584 () (_ BitVec 64))

(assert (=> d!60691 (= lt!264585 (bvmul lt!264588 lt!264584))))

(assert (=> d!60691 (or (= lt!264588 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264584 (bvsdiv (bvmul lt!264588 lt!264584) lt!264588)))))

(assert (=> d!60691 (= lt!264584 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60691 (= lt!264588 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8004 lt!264358)))))))

(assert (=> d!60691 (= lt!264586 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8492 (_2!8004 lt!264358))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8487 (_2!8004 lt!264358)))))))

(assert (=> d!60691 (invariant!0 (currentBit!8487 (_2!8004 lt!264358)) (currentByte!8492 (_2!8004 lt!264358)) (size!4032 (buf!4475 (_2!8004 lt!264358))))))

(assert (=> d!60691 (= (bitIndex!0 (size!4032 (buf!4475 (_2!8004 lt!264358))) (currentByte!8492 (_2!8004 lt!264358)) (currentBit!8487 (_2!8004 lt!264358))) lt!264586)))

(declare-fun b!171531 () Bool)

(declare-fun res!142245 () Bool)

(assert (=> b!171531 (=> (not res!142245) (not e!119770))))

(assert (=> b!171531 (= res!142245 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264586))))

(declare-fun b!171532 () Bool)

(declare-fun lt!264583 () (_ BitVec 64))

(assert (=> b!171532 (= e!119770 (bvsle lt!264586 (bvmul lt!264583 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171532 (or (= lt!264583 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264583 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264583)))))

(assert (=> b!171532 (= lt!264583 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8004 lt!264358)))))))

(assert (= (and d!60691 res!142244) b!171531))

(assert (= (and b!171531 res!142245) b!171532))

(declare-fun m!270729 () Bool)

(assert (=> d!60691 m!270729))

(declare-fun m!270731 () Bool)

(assert (=> d!60691 m!270731))

(assert (=> b!171381 d!60691))

(assert (=> b!171381 d!60607))

(declare-fun d!60693 () Bool)

(declare-fun e!119771 () Bool)

(assert (=> d!60693 e!119771))

(declare-fun res!142246 () Bool)

(assert (=> d!60693 (=> (not res!142246) (not e!119771))))

(declare-fun lt!264591 () (_ BitVec 64))

(declare-fun lt!264592 () (_ BitVec 64))

(declare-fun lt!264593 () (_ BitVec 64))

(assert (=> d!60693 (= res!142246 (= lt!264592 (bvsub lt!264591 lt!264593)))))

(assert (=> d!60693 (or (= (bvand lt!264591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264593 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264591 lt!264593) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60693 (= lt!264593 (remainingBits!0 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8002 lt!264455)))) ((_ sign_extend 32) (currentByte!8492 (_2!8002 lt!264455))) ((_ sign_extend 32) (currentBit!8487 (_2!8002 lt!264455)))))))

(declare-fun lt!264594 () (_ BitVec 64))

(declare-fun lt!264590 () (_ BitVec 64))

(assert (=> d!60693 (= lt!264591 (bvmul lt!264594 lt!264590))))

(assert (=> d!60693 (or (= lt!264594 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264590 (bvsdiv (bvmul lt!264594 lt!264590) lt!264594)))))

(assert (=> d!60693 (= lt!264590 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60693 (= lt!264594 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8002 lt!264455)))))))

(assert (=> d!60693 (= lt!264592 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8492 (_2!8002 lt!264455))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8487 (_2!8002 lt!264455)))))))

(assert (=> d!60693 (invariant!0 (currentBit!8487 (_2!8002 lt!264455)) (currentByte!8492 (_2!8002 lt!264455)) (size!4032 (buf!4475 (_2!8002 lt!264455))))))

(assert (=> d!60693 (= (bitIndex!0 (size!4032 (buf!4475 (_2!8002 lt!264455))) (currentByte!8492 (_2!8002 lt!264455)) (currentBit!8487 (_2!8002 lt!264455))) lt!264592)))

(declare-fun b!171533 () Bool)

(declare-fun res!142247 () Bool)

(assert (=> b!171533 (=> (not res!142247) (not e!119771))))

(assert (=> b!171533 (= res!142247 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264592))))

(declare-fun b!171534 () Bool)

(declare-fun lt!264589 () (_ BitVec 64))

(assert (=> b!171534 (= e!119771 (bvsle lt!264592 (bvmul lt!264589 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171534 (or (= lt!264589 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264589 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264589)))))

(assert (=> b!171534 (= lt!264589 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8002 lt!264455)))))))

(assert (= (and d!60693 res!142246) b!171533))

(assert (= (and b!171533 res!142247) b!171534))

(declare-fun m!270733 () Bool)

(assert (=> d!60693 m!270733))

(declare-fun m!270735 () Bool)

(assert (=> d!60693 m!270735))

(assert (=> b!171453 d!60693))

(assert (=> b!171453 d!60607))

(declare-fun d!60695 () Bool)

(declare-fun e!119772 () Bool)

(assert (=> d!60695 e!119772))

(declare-fun res!142248 () Bool)

(assert (=> d!60695 (=> (not res!142248) (not e!119772))))

(declare-fun lt!264599 () (_ BitVec 64))

(declare-fun lt!264598 () (_ BitVec 64))

(declare-fun lt!264597 () (_ BitVec 64))

(assert (=> d!60695 (= res!142248 (= lt!264598 (bvsub lt!264597 lt!264599)))))

(assert (=> d!60695 (or (= (bvand lt!264597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264599 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264597 lt!264599) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60695 (= lt!264599 (remainingBits!0 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8002 lt!264466)))) ((_ sign_extend 32) (currentByte!8492 (_2!8002 lt!264466))) ((_ sign_extend 32) (currentBit!8487 (_2!8002 lt!264466)))))))

(declare-fun lt!264600 () (_ BitVec 64))

(declare-fun lt!264596 () (_ BitVec 64))

(assert (=> d!60695 (= lt!264597 (bvmul lt!264600 lt!264596))))

(assert (=> d!60695 (or (= lt!264600 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264596 (bvsdiv (bvmul lt!264600 lt!264596) lt!264600)))))

(assert (=> d!60695 (= lt!264596 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60695 (= lt!264600 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8002 lt!264466)))))))

(assert (=> d!60695 (= lt!264598 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8492 (_2!8002 lt!264466))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8487 (_2!8002 lt!264466)))))))

(assert (=> d!60695 (invariant!0 (currentBit!8487 (_2!8002 lt!264466)) (currentByte!8492 (_2!8002 lt!264466)) (size!4032 (buf!4475 (_2!8002 lt!264466))))))

(assert (=> d!60695 (= (bitIndex!0 (size!4032 (buf!4475 (_2!8002 lt!264466))) (currentByte!8492 (_2!8002 lt!264466)) (currentBit!8487 (_2!8002 lt!264466))) lt!264598)))

(declare-fun b!171535 () Bool)

(declare-fun res!142249 () Bool)

(assert (=> b!171535 (=> (not res!142249) (not e!119772))))

(assert (=> b!171535 (= res!142249 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264598))))

(declare-fun b!171536 () Bool)

(declare-fun lt!264595 () (_ BitVec 64))

(assert (=> b!171536 (= e!119772 (bvsle lt!264598 (bvmul lt!264595 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171536 (or (= lt!264595 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264595 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264595)))))

(assert (=> b!171536 (= lt!264595 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8002 lt!264466)))))))

(assert (= (and d!60695 res!142248) b!171535))

(assert (= (and b!171535 res!142249) b!171536))

(declare-fun m!270737 () Bool)

(assert (=> d!60695 m!270737))

(declare-fun m!270739 () Bool)

(assert (=> d!60695 m!270739))

(assert (=> b!171462 d!60695))

(declare-fun d!60697 () Bool)

(declare-fun e!119773 () Bool)

(assert (=> d!60697 e!119773))

(declare-fun res!142250 () Bool)

(assert (=> d!60697 (=> (not res!142250) (not e!119773))))

(declare-fun lt!264605 () (_ BitVec 64))

(declare-fun lt!264603 () (_ BitVec 64))

(declare-fun lt!264604 () (_ BitVec 64))

(assert (=> d!60697 (= res!142250 (= lt!264604 (bvsub lt!264603 lt!264605)))))

(assert (=> d!60697 (or (= (bvand lt!264603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264605 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264603 lt!264605) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60697 (= lt!264605 (remainingBits!0 ((_ sign_extend 32) (size!4032 (buf!4475 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 32) (currentByte!8492 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) ((_ sign_extend 32) (currentBit!8487 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(declare-fun lt!264606 () (_ BitVec 64))

(declare-fun lt!264602 () (_ BitVec 64))

(assert (=> d!60697 (= lt!264603 (bvmul lt!264606 lt!264602))))

(assert (=> d!60697 (or (= lt!264606 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264602 (bvsdiv (bvmul lt!264606 lt!264602) lt!264606)))))

(assert (=> d!60697 (= lt!264602 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60697 (= lt!264606 ((_ sign_extend 32) (size!4032 (buf!4475 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!60697 (= lt!264604 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8492 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8487 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!60697 (invariant!0 (currentBit!8487 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentByte!8492 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (size!4032 (buf!4475 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!60697 (= (bitIndex!0 (size!4032 (buf!4475 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!8492 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!8487 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))) lt!264604)))

(declare-fun b!171537 () Bool)

(declare-fun res!142251 () Bool)

(assert (=> b!171537 (=> (not res!142251) (not e!119773))))

(assert (=> b!171537 (= res!142251 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264604))))

(declare-fun b!171538 () Bool)

(declare-fun lt!264601 () (_ BitVec 64))

(assert (=> b!171538 (= e!119773 (bvsle lt!264604 (bvmul lt!264601 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171538 (or (= lt!264601 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264601 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264601)))))

(assert (=> b!171538 (= lt!264601 ((_ sign_extend 32) (size!4032 (buf!4475 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (= (and d!60697 res!142250) b!171537))

(assert (= (and b!171537 res!142251) b!171538))

(declare-fun m!270741 () Bool)

(assert (=> d!60697 m!270741))

(declare-fun m!270743 () Bool)

(assert (=> d!60697 m!270743))

(assert (=> b!171462 d!60697))

(assert (=> d!60609 d!60627))

(declare-fun d!60699 () Bool)

(declare-fun e!119776 () Bool)

(assert (=> d!60699 e!119776))

(declare-fun res!142257 () Bool)

(assert (=> d!60699 (=> (not res!142257) (not e!119776))))

(declare-fun lt!264620 () (_ BitVec 64))

(declare-fun lt!264618 () (_ BitVec 64))

(declare-fun lt!264621 () tuple2!14742)

(assert (=> d!60699 (= res!142257 (= (bvadd lt!264618 lt!264620) (bitIndex!0 (size!4032 (buf!4475 (_2!8004 lt!264621))) (currentByte!8492 (_2!8004 lt!264621)) (currentBit!8487 (_2!8004 lt!264621)))))))

(assert (=> d!60699 (or (not (= (bvand lt!264618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264620 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264618 lt!264620) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60699 (= lt!264620 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!60699 (= lt!264618 (bitIndex!0 (size!4032 (buf!4475 bs!64)) (currentByte!8492 bs!64) (currentBit!8487 bs!64)))))

(declare-fun Unit!12269 () Unit!12247)

(declare-fun Unit!12270 () Unit!12247)

(assert (=> d!60699 (= lt!264621 (ite (bvslt (currentBit!8487 bs!64) #b00000000000000000000000000000111) (tuple2!14743 Unit!12269 (BitStream!7203 (buf!4475 bs!64) (currentByte!8492 bs!64) (bvadd (currentBit!8487 bs!64) #b00000000000000000000000000000001))) (tuple2!14743 Unit!12270 (BitStream!7203 (buf!4475 bs!64) (bvadd (currentByte!8492 bs!64) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!60699 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!4032 (buf!4475 bs!64))) ((_ sign_extend 32) (currentByte!8492 bs!64)) ((_ sign_extend 32) (currentBit!8487 bs!64))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!60699 (= (increaseBitIndex!0 bs!64) lt!264621)))

(declare-fun b!171543 () Bool)

(declare-fun res!142256 () Bool)

(assert (=> b!171543 (=> (not res!142256) (not e!119776))))

(declare-fun lt!264617 () (_ BitVec 64))

(declare-fun lt!264619 () (_ BitVec 64))

(assert (=> b!171543 (= res!142256 (= (bvsub lt!264617 lt!264619) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!171543 (or (= (bvand lt!264617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264619 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264617 lt!264619) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171543 (= lt!264619 (remainingBits!0 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8004 lt!264621)))) ((_ sign_extend 32) (currentByte!8492 (_2!8004 lt!264621))) ((_ sign_extend 32) (currentBit!8487 (_2!8004 lt!264621)))))))

(assert (=> b!171543 (= lt!264617 (remainingBits!0 ((_ sign_extend 32) (size!4032 (buf!4475 bs!64))) ((_ sign_extend 32) (currentByte!8492 bs!64)) ((_ sign_extend 32) (currentBit!8487 bs!64))))))

(declare-fun b!171544 () Bool)

(assert (=> b!171544 (= e!119776 (= (size!4032 (buf!4475 bs!64)) (size!4032 (buf!4475 (_2!8004 lt!264621)))))))

(assert (= (and d!60699 res!142257) b!171543))

(assert (= (and b!171543 res!142256) b!171544))

(declare-fun m!270745 () Bool)

(assert (=> d!60699 m!270745))

(assert (=> d!60699 m!270487))

(assert (=> d!60699 m!270457))

(declare-fun m!270747 () Bool)

(assert (=> b!171543 m!270747))

(assert (=> b!171543 m!270457))

(assert (=> d!60593 d!60699))

(declare-fun d!60701 () Bool)

(assert (=> d!60701 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4032 (buf!4475 bs!64))) ((_ sign_extend 32) (currentByte!8492 bs!64)) ((_ sign_extend 32) (currentBit!8487 bs!64))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4032 (buf!4475 bs!64))) ((_ sign_extend 32) (currentByte!8492 bs!64)) ((_ sign_extend 32) (currentBit!8487 bs!64))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!15091 () Bool)

(assert (= bs!15091 d!60701))

(assert (=> bs!15091 m!270457))

(assert (=> d!60593 d!60701))

(assert (=> b!171451 d!60577))

(assert (=> d!60629 d!60693))

(assert (=> d!60629 d!60607))

(declare-fun d!60703 () Bool)

(assert (=> d!60703 (= (remainingBits!0 ((_ sign_extend 32) (size!4032 (buf!4475 lt!264135))) ((_ sign_extend 32) (currentByte!8492 lt!264135)) ((_ sign_extend 32) (currentBit!8487 lt!264135))) (bvsub (bvmul ((_ sign_extend 32) (size!4032 (buf!4475 lt!264135))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8492 lt!264135)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8487 lt!264135)))))))

(assert (=> d!60601 d!60703))

(declare-fun d!60705 () Bool)

(assert (=> d!60705 (= (invariant!0 (currentBit!8487 lt!264135) (currentByte!8492 lt!264135) (size!4032 (buf!4475 lt!264135))) (and (bvsge (currentBit!8487 lt!264135) #b00000000000000000000000000000000) (bvslt (currentBit!8487 lt!264135) #b00000000000000000000000000001000) (bvsge (currentByte!8492 lt!264135) #b00000000000000000000000000000000) (or (bvslt (currentByte!8492 lt!264135) (size!4032 (buf!4475 lt!264135))) (and (= (currentBit!8487 lt!264135) #b00000000000000000000000000000000) (= (currentByte!8492 lt!264135) (size!4032 (buf!4475 lt!264135)))))))))

(assert (=> d!60601 d!60705))

(declare-fun d!60707 () Bool)

(declare-fun lt!264622 () tuple2!14738)

(assert (=> d!60707 (= lt!264622 (readBit!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!60707 (= (readBitPure!0 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)) (tuple2!14731 (_2!8002 lt!264622) (_1!8002 lt!264622)))))

(declare-fun bs!15092 () Bool)

(assert (= bs!15092 d!60707))

(assert (=> bs!15092 m!270435))

(assert (=> bs!15092 m!270611))

(assert (=> b!171460 d!60707))

(assert (=> b!171394 d!60607))

(assert (=> d!60607 d!60641))

(assert (=> d!60607 d!60597))

(declare-fun d!60709 () Bool)

(declare-fun e!119777 () Bool)

(assert (=> d!60709 e!119777))

(declare-fun res!142258 () Bool)

(assert (=> d!60709 (=> (not res!142258) (not e!119777))))

(declare-fun lt!264627 () (_ BitVec 64))

(declare-fun lt!264625 () (_ BitVec 64))

(declare-fun lt!264626 () (_ BitVec 64))

(assert (=> d!60709 (= res!142258 (= lt!264626 (bvsub lt!264625 lt!264627)))))

(assert (=> d!60709 (or (= (bvand lt!264625 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264627 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264625 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264625 lt!264627) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60709 (= lt!264627 (remainingBits!0 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8004 (increaseBitIndex!0 bs!64))))) ((_ sign_extend 32) (currentByte!8492 (_2!8004 (increaseBitIndex!0 bs!64)))) ((_ sign_extend 32) (currentBit!8487 (_2!8004 (increaseBitIndex!0 bs!64))))))))

(declare-fun lt!264628 () (_ BitVec 64))

(declare-fun lt!264624 () (_ BitVec 64))

(assert (=> d!60709 (= lt!264625 (bvmul lt!264628 lt!264624))))

(assert (=> d!60709 (or (= lt!264628 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264624 (bvsdiv (bvmul lt!264628 lt!264624) lt!264628)))))

(assert (=> d!60709 (= lt!264624 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60709 (= lt!264628 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8004 (increaseBitIndex!0 bs!64))))))))

(assert (=> d!60709 (= lt!264626 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8492 (_2!8004 (increaseBitIndex!0 bs!64)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8487 (_2!8004 (increaseBitIndex!0 bs!64))))))))

(assert (=> d!60709 (invariant!0 (currentBit!8487 (_2!8004 (increaseBitIndex!0 bs!64))) (currentByte!8492 (_2!8004 (increaseBitIndex!0 bs!64))) (size!4032 (buf!4475 (_2!8004 (increaseBitIndex!0 bs!64)))))))

(assert (=> d!60709 (= (bitIndex!0 (size!4032 (buf!4475 (_2!8004 (increaseBitIndex!0 bs!64)))) (currentByte!8492 (_2!8004 (increaseBitIndex!0 bs!64))) (currentBit!8487 (_2!8004 (increaseBitIndex!0 bs!64)))) lt!264626)))

(declare-fun b!171545 () Bool)

(declare-fun res!142259 () Bool)

(assert (=> b!171545 (=> (not res!142259) (not e!119777))))

(assert (=> b!171545 (= res!142259 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264626))))

(declare-fun b!171546 () Bool)

(declare-fun lt!264623 () (_ BitVec 64))

(assert (=> b!171546 (= e!119777 (bvsle lt!264626 (bvmul lt!264623 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171546 (or (= lt!264623 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264623 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264623)))))

(assert (=> b!171546 (= lt!264623 ((_ sign_extend 32) (size!4032 (buf!4475 (_2!8004 (increaseBitIndex!0 bs!64))))))))

(assert (= (and d!60709 res!142258) b!171545))

(assert (= (and b!171545 res!142259) b!171546))

(declare-fun m!270749 () Bool)

(assert (=> d!60709 m!270749))

(declare-fun m!270751 () Bool)

(assert (=> d!60709 m!270751))

(assert (=> b!171329 d!60709))

(assert (=> b!171329 d!60699))

(assert (=> b!171329 d!60607))

(assert (=> d!60639 d!60695))

(assert (=> d!60639 d!60697))

(push 1)

(assert (not d!60695))

(assert (not d!60681))

(assert (not d!60709))

(assert (not b!171543))

(assert (not b!171525))

(assert (not b!171520))

(assert (not b!171519))

(assert (not d!60679))

(assert (not d!60683))

(assert (not b!171513))

(assert (not b!171529))

(assert (not d!60707))

(assert (not b!171522))

(assert (not b!171510))

(assert (not d!60701))

(assert (not d!60677))

(assert (not d!60685))

(assert (not b!171508))

(assert (not d!60689))

(assert (not b!171524))

(assert (not b!171512))

(assert (not d!60699))

(assert (not d!60697))

(assert (not b!171530))

(assert (not d!60691))

(assert (not d!60693))

(assert (not d!60687))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

