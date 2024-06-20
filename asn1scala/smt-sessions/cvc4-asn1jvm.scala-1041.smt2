; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29804 () Bool)

(assert start!29804)

(declare-fun b!153559 () Bool)

(declare-fun e!102990 () Bool)

(declare-datatypes ((array!6915 0))(
  ( (array!6916 (arr!3943 (Array (_ BitVec 32) (_ BitVec 8))) (size!3120 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5498 0))(
  ( (BitStream!5499 (buf!3623 array!6915) (currentByte!6615 (_ BitVec 32)) (currentBit!6610 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5498)

(declare-fun array_inv!2909 (array!6915) Bool)

(assert (=> b!153559 (= e!102990 (array_inv!2909 (buf!3623 bs1!10)))))

(declare-fun b!153560 () Bool)

(declare-fun e!102988 () Bool)

(declare-datatypes ((tuple2!13628 0))(
  ( (tuple2!13629 (_1!7204 BitStream!5498) (_2!7204 (_ BitVec 8))) )
))
(declare-fun lt!239838 () tuple2!13628)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153560 (= e!102988 (not (invariant!0 (currentBit!6610 (_1!7204 lt!239838)) (currentByte!6615 (_1!7204 lt!239838)) (size!3120 (buf!3623 (_1!7204 lt!239838))))))))

(declare-fun bs2!18 () BitStream!5498)

(assert (=> b!153560 (= (select (arr!3943 (buf!3623 bs1!10)) (currentByte!6615 bs1!10)) (select (arr!3943 (buf!3623 bs2!18)) (currentByte!6615 bs1!10)))))

(declare-fun lt!239837 () (_ BitVec 32))

(declare-datatypes ((Unit!9695 0))(
  ( (Unit!9696) )
))
(declare-fun lt!239842 () Unit!9695)

(declare-fun arrayRangesEqImpliesEq!23 (array!6915 array!6915 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9695)

(assert (=> b!153560 (= lt!239842 (arrayRangesEqImpliesEq!23 (buf!3623 bs1!10) (buf!3623 bs2!18) #b00000000000000000000000000000000 (currentByte!6615 bs1!10) lt!239837))))

(declare-fun b!153561 () Bool)

(declare-fun res!128600 () Bool)

(declare-fun e!102989 () Bool)

(assert (=> b!153561 (=> (not res!128600) (not e!102989))))

(declare-fun lt!239841 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!6915 array!6915 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153561 (= res!128600 (arrayBitRangesEq!0 (buf!3623 bs1!10) (buf!3623 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239841))))

(declare-fun b!153562 () Bool)

(declare-fun res!128597 () Bool)

(assert (=> b!153562 (=> (not res!128597) (not e!102989))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153562 (= res!128597 (bvsle lt!239841 (bitIndex!0 (size!3120 (buf!3623 bs2!18)) (currentByte!6615 bs2!18) (currentBit!6610 bs2!18))))))

(declare-fun b!153563 () Bool)

(declare-fun res!128596 () Bool)

(assert (=> b!153563 (=> (not res!128596) (not e!102988))))

(declare-fun arrayRangesEq!382 (array!6915 array!6915 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153563 (= res!128596 (arrayRangesEq!382 (buf!3623 bs1!10) (buf!3623 bs2!18) #b00000000000000000000000000000000 lt!239837))))

(declare-fun b!153564 () Bool)

(declare-fun e!102984 () Bool)

(assert (=> b!153564 (= e!102984 (array_inv!2909 (buf!3623 bs2!18)))))

(declare-fun b!153565 () Bool)

(assert (=> b!153565 (= e!102989 e!102988)))

(declare-fun res!128598 () Bool)

(assert (=> b!153565 (=> (not res!128598) (not e!102988))))

(assert (=> b!153565 (= res!128598 (and (bvsle #b00000000000000000000000000000000 lt!239837) (bvsle lt!239837 (size!3120 (buf!3623 bs1!10))) (bvsle #b00000000000000000000000000000000 (currentByte!6615 bs1!10)) (bvslt (currentByte!6615 bs1!10) lt!239837)))))

(declare-fun lt!239840 () (_ BitVec 64))

(assert (=> b!153565 (= lt!239837 ((_ extract 31 0) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!239840 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!239839 () tuple2!13628)

(declare-fun readBytePure!0 (BitStream!5498) tuple2!13628)

(assert (=> b!153565 (= lt!239839 (readBytePure!0 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10))))))

(assert (=> b!153565 (= lt!239838 (readBytePure!0 bs1!10))))

(declare-fun b!153566 () Bool)

(declare-fun e!102985 () Bool)

(assert (=> b!153566 (= e!102985 e!102989)))

(declare-fun res!128601 () Bool)

(assert (=> b!153566 (=> (not res!128601) (not e!102989))))

(assert (=> b!153566 (= res!128601 (bvsle lt!239841 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3120 (buf!3623 bs1!10))))))))

(assert (=> b!153566 (= lt!239841 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!239840))))

(assert (=> b!153566 (= lt!239840 (bitIndex!0 (size!3120 (buf!3623 bs1!10)) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10)))))

(declare-fun res!128599 () Bool)

(assert (=> start!29804 (=> (not res!128599) (not e!102985))))

(assert (=> start!29804 (= res!128599 (= (size!3120 (buf!3623 bs1!10)) (size!3120 (buf!3623 bs2!18))))))

(assert (=> start!29804 e!102985))

(declare-fun inv!12 (BitStream!5498) Bool)

(assert (=> start!29804 (and (inv!12 bs1!10) e!102990)))

(assert (=> start!29804 (and (inv!12 bs2!18) e!102984)))

(assert (= (and start!29804 res!128599) b!153566))

(assert (= (and b!153566 res!128601) b!153562))

(assert (= (and b!153562 res!128597) b!153561))

(assert (= (and b!153561 res!128600) b!153565))

(assert (= (and b!153565 res!128598) b!153563))

(assert (= (and b!153563 res!128596) b!153560))

(assert (= start!29804 b!153559))

(assert (= start!29804 b!153564))

(declare-fun m!239367 () Bool)

(assert (=> b!153565 m!239367))

(declare-fun m!239369 () Bool)

(assert (=> b!153565 m!239369))

(declare-fun m!239371 () Bool)

(assert (=> b!153564 m!239371))

(declare-fun m!239373 () Bool)

(assert (=> b!153563 m!239373))

(declare-fun m!239375 () Bool)

(assert (=> b!153566 m!239375))

(declare-fun m!239377 () Bool)

(assert (=> b!153561 m!239377))

(declare-fun m!239379 () Bool)

(assert (=> b!153559 m!239379))

(declare-fun m!239381 () Bool)

(assert (=> b!153560 m!239381))

(declare-fun m!239383 () Bool)

(assert (=> b!153560 m!239383))

(declare-fun m!239385 () Bool)

(assert (=> b!153560 m!239385))

(declare-fun m!239387 () Bool)

(assert (=> b!153560 m!239387))

(declare-fun m!239389 () Bool)

(assert (=> b!153562 m!239389))

(declare-fun m!239391 () Bool)

(assert (=> start!29804 m!239391))

(declare-fun m!239393 () Bool)

(assert (=> start!29804 m!239393))

(push 1)

(assert (not b!153564))

(assert (not b!153563))

(assert (not b!153562))

(assert (not start!29804))

(assert (not b!153560))

(assert (not b!153559))

(assert (not b!153561))

(assert (not b!153565))

(assert (not b!153566))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50486 () Bool)

(assert (=> d!50486 (= (array_inv!2909 (buf!3623 bs1!10)) (bvsge (size!3120 (buf!3623 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!153559 d!50486))

(declare-fun d!50488 () Bool)

(assert (=> d!50488 (= (array_inv!2909 (buf!3623 bs2!18)) (bvsge (size!3120 (buf!3623 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!153564 d!50488))

(declare-fun d!50490 () Bool)

(declare-fun e!103049 () Bool)

(assert (=> d!50490 e!103049))

(declare-fun res!128665 () Bool)

(assert (=> d!50490 (=> (not res!128665) (not e!103049))))

(declare-fun lt!239937 () (_ BitVec 64))

(declare-fun lt!239936 () (_ BitVec 64))

(declare-fun lt!239940 () (_ BitVec 64))

(assert (=> d!50490 (= res!128665 (= lt!239937 (bvsub lt!239940 lt!239936)))))

(assert (=> d!50490 (or (= (bvand lt!239940 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239936 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239940 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239940 lt!239936) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50490 (= lt!239936 (remainingBits!0 ((_ sign_extend 32) (size!3120 (buf!3623 bs1!10))) ((_ sign_extend 32) (currentByte!6615 bs1!10)) ((_ sign_extend 32) (currentBit!6610 bs1!10))))))

(declare-fun lt!239935 () (_ BitVec 64))

(declare-fun lt!239939 () (_ BitVec 64))

(assert (=> d!50490 (= lt!239940 (bvmul lt!239935 lt!239939))))

(assert (=> d!50490 (or (= lt!239935 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239939 (bvsdiv (bvmul lt!239935 lt!239939) lt!239935)))))

(assert (=> d!50490 (= lt!239939 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50490 (= lt!239935 ((_ sign_extend 32) (size!3120 (buf!3623 bs1!10))))))

(assert (=> d!50490 (= lt!239937 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6615 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6610 bs1!10))))))

(assert (=> d!50490 (invariant!0 (currentBit!6610 bs1!10) (currentByte!6615 bs1!10) (size!3120 (buf!3623 bs1!10)))))

(assert (=> d!50490 (= (bitIndex!0 (size!3120 (buf!3623 bs1!10)) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10)) lt!239937)))

(declare-fun b!153641 () Bool)

(declare-fun res!128664 () Bool)

(assert (=> b!153641 (=> (not res!128664) (not e!103049))))

(assert (=> b!153641 (= res!128664 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239937))))

(declare-fun b!153642 () Bool)

(declare-fun lt!239938 () (_ BitVec 64))

(assert (=> b!153642 (= e!103049 (bvsle lt!239937 (bvmul lt!239938 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153642 (or (= lt!239938 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239938 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239938)))))

(assert (=> b!153642 (= lt!239938 ((_ sign_extend 32) (size!3120 (buf!3623 bs1!10))))))

(assert (= (and d!50490 res!128665) b!153641))

(assert (= (and b!153641 res!128664) b!153642))

(declare-fun m!239467 () Bool)

(assert (=> d!50490 m!239467))

(declare-fun m!239469 () Bool)

(assert (=> d!50490 m!239469))

(assert (=> b!153566 d!50490))

(declare-fun d!50492 () Bool)

(declare-datatypes ((tuple2!13634 0))(
  ( (tuple2!13635 (_1!7209 (_ BitVec 8)) (_2!7209 BitStream!5498)) )
))
(declare-fun lt!239943 () tuple2!13634)

(declare-fun readByte!0 (BitStream!5498) tuple2!13634)

(assert (=> d!50492 (= lt!239943 (readByte!0 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10))))))

(assert (=> d!50492 (= (readBytePure!0 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10))) (tuple2!13629 (_2!7209 lt!239943) (_1!7209 lt!239943)))))

(declare-fun bs!12357 () Bool)

(assert (= bs!12357 d!50492))

(declare-fun m!239471 () Bool)

(assert (=> bs!12357 m!239471))

(assert (=> b!153565 d!50492))

(declare-fun d!50494 () Bool)

(declare-fun lt!239944 () tuple2!13634)

(assert (=> d!50494 (= lt!239944 (readByte!0 bs1!10))))

(assert (=> d!50494 (= (readBytePure!0 bs1!10) (tuple2!13629 (_2!7209 lt!239944) (_1!7209 lt!239944)))))

(declare-fun bs!12358 () Bool)

(assert (= bs!12358 d!50494))

(declare-fun m!239473 () Bool)

(assert (=> bs!12358 m!239473))

(assert (=> b!153565 d!50494))

(declare-fun d!50496 () Bool)

(assert (=> d!50496 (= (inv!12 bs1!10) (invariant!0 (currentBit!6610 bs1!10) (currentByte!6615 bs1!10) (size!3120 (buf!3623 bs1!10))))))

(declare-fun bs!12359 () Bool)

(assert (= bs!12359 d!50496))

(assert (=> bs!12359 m!239469))

(assert (=> start!29804 d!50496))

(declare-fun d!50498 () Bool)

(assert (=> d!50498 (= (inv!12 bs2!18) (invariant!0 (currentBit!6610 bs2!18) (currentByte!6615 bs2!18) (size!3120 (buf!3623 bs2!18))))))

(declare-fun bs!12360 () Bool)

(assert (= bs!12360 d!50498))

(declare-fun m!239475 () Bool)

(assert (=> bs!12360 m!239475))

(assert (=> start!29804 d!50498))

(declare-fun d!50500 () Bool)

(assert (=> d!50500 (= (invariant!0 (currentBit!6610 (_1!7204 lt!239838)) (currentByte!6615 (_1!7204 lt!239838)) (size!3120 (buf!3623 (_1!7204 lt!239838)))) (and (bvsge (currentBit!6610 (_1!7204 lt!239838)) #b00000000000000000000000000000000) (bvslt (currentBit!6610 (_1!7204 lt!239838)) #b00000000000000000000000000001000) (bvsge (currentByte!6615 (_1!7204 lt!239838)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6615 (_1!7204 lt!239838)) (size!3120 (buf!3623 (_1!7204 lt!239838)))) (and (= (currentBit!6610 (_1!7204 lt!239838)) #b00000000000000000000000000000000) (= (currentByte!6615 (_1!7204 lt!239838)) (size!3120 (buf!3623 (_1!7204 lt!239838))))))))))

(assert (=> b!153560 d!50500))

(declare-fun d!50502 () Bool)

(assert (=> d!50502 (and (bvsge (currentByte!6615 bs1!10) #b00000000000000000000000000000000) (bvslt (currentByte!6615 bs1!10) (size!3120 (buf!3623 bs1!10))) (bvslt (currentByte!6615 bs1!10) (size!3120 (buf!3623 bs2!18))) (= (select (arr!3943 (buf!3623 bs1!10)) (currentByte!6615 bs1!10)) (select (arr!3943 (buf!3623 bs2!18)) (currentByte!6615 bs1!10))))))

(declare-fun lt!239947 () Unit!9695)

(declare-fun choose!106 (array!6915 array!6915 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9695)

(assert (=> d!50502 (= lt!239947 (choose!106 (buf!3623 bs1!10) (buf!3623 bs2!18) #b00000000000000000000000000000000 (currentByte!6615 bs1!10) lt!239837))))

(assert (=> d!50502 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 lt!239837))))

(assert (=> d!50502 (= (arrayRangesEqImpliesEq!23 (buf!3623 bs1!10) (buf!3623 bs2!18) #b00000000000000000000000000000000 (currentByte!6615 bs1!10) lt!239837) lt!239947)))

(declare-fun bs!12361 () Bool)

(assert (= bs!12361 d!50502))

(assert (=> bs!12361 m!239383))

(assert (=> bs!12361 m!239385))

(declare-fun m!239477 () Bool)

(assert (=> bs!12361 m!239477))

(assert (=> b!153560 d!50502))

(declare-fun d!50504 () Bool)

(declare-fun e!103050 () Bool)

(assert (=> d!50504 e!103050))

(declare-fun res!128667 () Bool)

(assert (=> d!50504 (=> (not res!128667) (not e!103050))))

(declare-fun lt!239949 () (_ BitVec 64))

(declare-fun lt!239953 () (_ BitVec 64))

(declare-fun lt!239950 () (_ BitVec 64))

(assert (=> d!50504 (= res!128667 (= lt!239950 (bvsub lt!239953 lt!239949)))))

(assert (=> d!50504 (or (= (bvand lt!239953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239949 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239953 lt!239949) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50504 (= lt!239949 (remainingBits!0 ((_ sign_extend 32) (size!3120 (buf!3623 bs2!18))) ((_ sign_extend 32) (currentByte!6615 bs2!18)) ((_ sign_extend 32) (currentBit!6610 bs2!18))))))

(declare-fun lt!239948 () (_ BitVec 64))

(declare-fun lt!239952 () (_ BitVec 64))

(assert (=> d!50504 (= lt!239953 (bvmul lt!239948 lt!239952))))

(assert (=> d!50504 (or (= lt!239948 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239952 (bvsdiv (bvmul lt!239948 lt!239952) lt!239948)))))

(assert (=> d!50504 (= lt!239952 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50504 (= lt!239948 ((_ sign_extend 32) (size!3120 (buf!3623 bs2!18))))))

(assert (=> d!50504 (= lt!239950 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6615 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6610 bs2!18))))))

(assert (=> d!50504 (invariant!0 (currentBit!6610 bs2!18) (currentByte!6615 bs2!18) (size!3120 (buf!3623 bs2!18)))))

(assert (=> d!50504 (= (bitIndex!0 (size!3120 (buf!3623 bs2!18)) (currentByte!6615 bs2!18) (currentBit!6610 bs2!18)) lt!239950)))

(declare-fun b!153643 () Bool)

(declare-fun res!128666 () Bool)

(assert (=> b!153643 (=> (not res!128666) (not e!103050))))

(assert (=> b!153643 (= res!128666 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239950))))

(declare-fun b!153644 () Bool)

(declare-fun lt!239951 () (_ BitVec 64))

(assert (=> b!153644 (= e!103050 (bvsle lt!239950 (bvmul lt!239951 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153644 (or (= lt!239951 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239951 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239951)))))

(assert (=> b!153644 (= lt!239951 ((_ sign_extend 32) (size!3120 (buf!3623 bs2!18))))))

(assert (= (and d!50504 res!128667) b!153643))

(assert (= (and b!153643 res!128666) b!153644))

(declare-fun m!239479 () Bool)

(assert (=> d!50504 m!239479))

(assert (=> d!50504 m!239475))

(assert (=> b!153562 d!50504))

(declare-fun b!153659 () Bool)

(declare-fun e!103063 () Bool)

(declare-fun e!103067 () Bool)

(assert (=> b!153659 (= e!103063 e!103067)))

(declare-fun c!8193 () Bool)

(declare-datatypes ((tuple4!178 0))(
  ( (tuple4!179 (_1!7210 (_ BitVec 32)) (_2!7210 (_ BitVec 32)) (_3!392 (_ BitVec 32)) (_4!89 (_ BitVec 32))) )
))
(declare-fun lt!239960 () tuple4!178)

(assert (=> b!153659 (= c!8193 (= (_3!392 lt!239960) (_4!89 lt!239960)))))

(declare-fun b!153660 () Bool)

(declare-fun e!103068 () Bool)

(assert (=> b!153660 (= e!103067 e!103068)))

(declare-fun res!128682 () Bool)

(declare-fun call!2177 () Bool)

(assert (=> b!153660 (= res!128682 call!2177)))

(assert (=> b!153660 (=> (not res!128682) (not e!103068))))

(declare-fun b!153661 () Bool)

(declare-fun lt!239962 () (_ BitVec 32))

(declare-fun e!103064 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153661 (= e!103064 (byteRangesEq!0 (select (arr!3943 (buf!3623 bs1!10)) (_4!89 lt!239960)) (select (arr!3943 (buf!3623 bs2!18)) (_4!89 lt!239960)) #b00000000000000000000000000000000 lt!239962))))

(declare-fun b!153662 () Bool)

(declare-fun res!128681 () Bool)

(assert (=> b!153662 (= res!128681 (= lt!239962 #b00000000000000000000000000000000))))

(assert (=> b!153662 (=> res!128681 e!103064)))

(assert (=> b!153662 (= e!103068 e!103064)))

(declare-fun d!50506 () Bool)

(declare-fun res!128678 () Bool)

(declare-fun e!103066 () Bool)

(assert (=> d!50506 (=> res!128678 e!103066)))

(assert (=> d!50506 (= res!128678 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!239841))))

(assert (=> d!50506 (= (arrayBitRangesEq!0 (buf!3623 bs1!10) (buf!3623 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239841) e!103066)))

(declare-fun e!103065 () Bool)

(declare-fun b!153663 () Bool)

(assert (=> b!153663 (= e!103065 (arrayRangesEq!382 (buf!3623 bs1!10) (buf!3623 bs2!18) (_1!7210 lt!239960) (_2!7210 lt!239960)))))

(declare-fun lt!239961 () (_ BitVec 32))

(declare-fun bm!2174 () Bool)

(assert (=> bm!2174 (= call!2177 (byteRangesEq!0 (select (arr!3943 (buf!3623 bs1!10)) (_3!392 lt!239960)) (select (arr!3943 (buf!3623 bs2!18)) (_3!392 lt!239960)) lt!239961 (ite c!8193 lt!239962 #b00000000000000000000000000001000)))))

(declare-fun b!153664 () Bool)

(assert (=> b!153664 (= e!103067 call!2177)))

(declare-fun b!153665 () Bool)

(assert (=> b!153665 (= e!103066 e!103063)))

(declare-fun res!128679 () Bool)

(assert (=> b!153665 (=> (not res!128679) (not e!103063))))

(assert (=> b!153665 (= res!128679 e!103065)))

(declare-fun res!128680 () Bool)

(assert (=> b!153665 (=> res!128680 e!103065)))

(assert (=> b!153665 (= res!128680 (bvsge (_1!7210 lt!239960) (_2!7210 lt!239960)))))

(assert (=> b!153665 (= lt!239962 ((_ extract 31 0) (bvsrem lt!239841 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153665 (= lt!239961 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!178)

(assert (=> b!153665 (= lt!239960 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!239841))))

(assert (= (and d!50506 (not res!128678)) b!153665))

(assert (= (and b!153665 (not res!128680)) b!153663))

(assert (= (and b!153665 res!128679) b!153659))

(assert (= (and b!153659 c!8193) b!153664))

(assert (= (and b!153659 (not c!8193)) b!153660))

(assert (= (and b!153660 res!128682) b!153662))

(assert (= (and b!153662 (not res!128681)) b!153661))

(assert (= (or b!153664 b!153660) bm!2174))

(declare-fun m!239481 () Bool)

(assert (=> b!153661 m!239481))

(declare-fun m!239483 () Bool)

(assert (=> b!153661 m!239483))

(assert (=> b!153661 m!239481))

(assert (=> b!153661 m!239483))

(declare-fun m!239485 () Bool)

(assert (=> b!153661 m!239485))

(declare-fun m!239487 () Bool)

(assert (=> b!153663 m!239487))

(declare-fun m!239489 () Bool)

(assert (=> bm!2174 m!239489))

(declare-fun m!239491 () Bool)

(assert (=> bm!2174 m!239491))

(assert (=> bm!2174 m!239489))

(assert (=> bm!2174 m!239491))

(declare-fun m!239493 () Bool)

(assert (=> bm!2174 m!239493))

(declare-fun m!239495 () Bool)

(assert (=> b!153665 m!239495))

(assert (=> b!153561 d!50506))

(declare-fun d!50508 () Bool)

(declare-fun res!128687 () Bool)

(declare-fun e!103073 () Bool)

(assert (=> d!50508 (=> res!128687 e!103073)))

(assert (=> d!50508 (= res!128687 (= #b00000000000000000000000000000000 lt!239837))))

(assert (=> d!50508 (= (arrayRangesEq!382 (buf!3623 bs1!10) (buf!3623 bs2!18) #b00000000000000000000000000000000 lt!239837) e!103073)))

(declare-fun b!153670 () Bool)

(declare-fun e!103074 () Bool)

(assert (=> b!153670 (= e!103073 e!103074)))

(declare-fun res!128688 () Bool)

(assert (=> b!153670 (=> (not res!128688) (not e!103074))))

(assert (=> b!153670 (= res!128688 (= (select (arr!3943 (buf!3623 bs1!10)) #b00000000000000000000000000000000) (select (arr!3943 (buf!3623 bs2!18)) #b00000000000000000000000000000000)))))

(declare-fun b!153671 () Bool)

(assert (=> b!153671 (= e!103074 (arrayRangesEq!382 (buf!3623 bs1!10) (buf!3623 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!239837))))

(assert (= (and d!50508 (not res!128687)) b!153670))

(assert (= (and b!153670 res!128688) b!153671))

(declare-fun m!239497 () Bool)

(assert (=> b!153670 m!239497))

(declare-fun m!239499 () Bool)

(assert (=> b!153670 m!239499))

(declare-fun m!239501 () Bool)

(assert (=> b!153671 m!239501))

(assert (=> b!153563 d!50508))

(push 1)

(assert (not d!50496))

(assert (not b!153671))

(assert (not b!153663))

(assert (not d!50494))

(assert (not d!50502))

(assert (not d!50504))

(assert (not d!50490))

(assert (not b!153661))

(assert (not d!50498))

(assert (not bm!2174))

(assert (not b!153665))

(assert (not d!50492))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50534 () Bool)

(assert (=> d!50534 (= (remainingBits!0 ((_ sign_extend 32) (size!3120 (buf!3623 bs2!18))) ((_ sign_extend 32) (currentByte!6615 bs2!18)) ((_ sign_extend 32) (currentBit!6610 bs2!18))) (bvsub (bvmul ((_ sign_extend 32) (size!3120 (buf!3623 bs2!18))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6615 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6610 bs2!18)))))))

(assert (=> d!50504 d!50534))

(declare-fun d!50536 () Bool)

(assert (=> d!50536 (= (invariant!0 (currentBit!6610 bs2!18) (currentByte!6615 bs2!18) (size!3120 (buf!3623 bs2!18))) (and (bvsge (currentBit!6610 bs2!18) #b00000000000000000000000000000000) (bvslt (currentBit!6610 bs2!18) #b00000000000000000000000000001000) (bvsge (currentByte!6615 bs2!18) #b00000000000000000000000000000000) (or (bvslt (currentByte!6615 bs2!18) (size!3120 (buf!3623 bs2!18))) (and (= (currentBit!6610 bs2!18) #b00000000000000000000000000000000) (= (currentByte!6615 bs2!18) (size!3120 (buf!3623 bs2!18)))))))))

(assert (=> d!50504 d!50536))

(declare-fun d!50538 () Bool)

(assert (=> d!50538 (= (invariant!0 (currentBit!6610 bs1!10) (currentByte!6615 bs1!10) (size!3120 (buf!3623 bs1!10))) (and (bvsge (currentBit!6610 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6610 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6615 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6615 bs1!10) (size!3120 (buf!3623 bs1!10))) (and (= (currentBit!6610 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6615 bs1!10) (size!3120 (buf!3623 bs1!10)))))))))

(assert (=> d!50496 d!50538))

(declare-fun d!50540 () Bool)

(assert (=> d!50540 (= (byteRangesEq!0 (select (arr!3943 (buf!3623 bs1!10)) (_3!392 lt!239960)) (select (arr!3943 (buf!3623 bs2!18)) (_3!392 lt!239960)) lt!239961 (ite c!8193 lt!239962 #b00000000000000000000000000001000)) (or (= lt!239961 (ite c!8193 lt!239962 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3943 (buf!3623 bs1!10)) (_3!392 lt!239960))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8193 lt!239962 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!239961)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3943 (buf!3623 bs2!18)) (_3!392 lt!239960))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8193 lt!239962 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!239961)))) #b00000000000000000000000011111111))))))

(declare-fun bs!12365 () Bool)

(assert (= bs!12365 d!50540))

(declare-fun m!239539 () Bool)

(assert (=> bs!12365 m!239539))

(declare-fun m!239541 () Bool)

(assert (=> bs!12365 m!239541))

(assert (=> bm!2174 d!50540))

(declare-fun d!50542 () Bool)

(assert (=> d!50542 (= (select (arr!3943 (buf!3623 bs1!10)) (currentByte!6615 bs1!10)) (select (arr!3943 (buf!3623 bs2!18)) (currentByte!6615 bs1!10)))))

(assert (=> d!50542 true))

(declare-fun _$12!60 () Unit!9695)

(assert (=> d!50542 (= (choose!106 (buf!3623 bs1!10) (buf!3623 bs2!18) #b00000000000000000000000000000000 (currentByte!6615 bs1!10) lt!239837) _$12!60)))

(declare-fun bs!12366 () Bool)

(assert (= bs!12366 d!50542))

(assert (=> bs!12366 m!239383))

(assert (=> bs!12366 m!239385))

(assert (=> d!50502 d!50542))

(declare-fun d!50544 () Bool)

(declare-fun res!128702 () Bool)

(declare-fun e!103087 () Bool)

(assert (=> d!50544 (=> res!128702 e!103087)))

(assert (=> d!50544 (= res!128702 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!239837))))

(assert (=> d!50544 (= (arrayRangesEq!382 (buf!3623 bs1!10) (buf!3623 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!239837) e!103087)))

(declare-fun b!153684 () Bool)

(declare-fun e!103088 () Bool)

(assert (=> b!153684 (= e!103087 e!103088)))

(declare-fun res!128703 () Bool)

(assert (=> b!153684 (=> (not res!128703) (not e!103088))))

(assert (=> b!153684 (= res!128703 (= (select (arr!3943 (buf!3623 bs1!10)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3943 (buf!3623 bs2!18)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!153685 () Bool)

(assert (=> b!153685 (= e!103088 (arrayRangesEq!382 (buf!3623 bs1!10) (buf!3623 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!239837))))

(assert (= (and d!50544 (not res!128702)) b!153684))

(assert (= (and b!153684 res!128703) b!153685))

(declare-fun m!239543 () Bool)

(assert (=> b!153684 m!239543))

(declare-fun m!239545 () Bool)

(assert (=> b!153684 m!239545))

(declare-fun m!239547 () Bool)

(assert (=> b!153685 m!239547))

(assert (=> b!153671 d!50544))

(declare-fun d!50546 () Bool)

(assert (=> d!50546 (= (remainingBits!0 ((_ sign_extend 32) (size!3120 (buf!3623 bs1!10))) ((_ sign_extend 32) (currentByte!6615 bs1!10)) ((_ sign_extend 32) (currentBit!6610 bs1!10))) (bvsub (bvmul ((_ sign_extend 32) (size!3120 (buf!3623 bs1!10))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6615 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6610 bs1!10)))))))

(assert (=> d!50490 d!50546))

(assert (=> d!50490 d!50538))

(declare-fun d!50548 () Bool)

(assert (=> d!50548 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!239841) (tuple4!179 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!239841 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!239841 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!153665 d!50548))

(declare-fun d!50550 () Bool)

(assert (=> d!50550 (= (byteRangesEq!0 (select (arr!3943 (buf!3623 bs1!10)) (_4!89 lt!239960)) (select (arr!3943 (buf!3623 bs2!18)) (_4!89 lt!239960)) #b00000000000000000000000000000000 lt!239962) (or (= #b00000000000000000000000000000000 lt!239962) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3943 (buf!3623 bs1!10)) (_4!89 lt!239960))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!239962))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3943 (buf!3623 bs2!18)) (_4!89 lt!239960))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!239962))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!12367 () Bool)

(assert (= bs!12367 d!50550))

(declare-fun m!239549 () Bool)

(assert (=> bs!12367 m!239549))

(declare-fun m!239551 () Bool)

(assert (=> bs!12367 m!239551))

(assert (=> b!153661 d!50550))

(declare-fun d!50552 () Bool)

(declare-fun lt!240005 () (_ BitVec 8))

(declare-fun lt!240010 () (_ BitVec 8))

(assert (=> d!50552 (= lt!240005 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3943 (buf!3623 bs1!10)) (currentByte!6615 bs1!10))) ((_ sign_extend 24) lt!240010))))))

(assert (=> d!50552 (= lt!240010 ((_ extract 7 0) (currentBit!6610 bs1!10)))))

(declare-fun e!103093 () Bool)

(assert (=> d!50552 e!103093))

(declare-fun res!128709 () Bool)

(assert (=> d!50552 (=> (not res!128709) (not e!103093))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!50552 (= res!128709 (validate_offset_bits!1 ((_ sign_extend 32) (size!3120 (buf!3623 bs1!10))) ((_ sign_extend 32) (currentByte!6615 bs1!10)) ((_ sign_extend 32) (currentBit!6610 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13638 0))(
  ( (tuple2!13639 (_1!7212 Unit!9695) (_2!7212 (_ BitVec 8))) )
))
(declare-fun Unit!9705 () Unit!9695)

(declare-fun Unit!9706 () Unit!9695)

(assert (=> d!50552 (= (readByte!0 bs1!10) (tuple2!13635 (_2!7212 (ite (bvsgt ((_ sign_extend 24) lt!240010) #b00000000000000000000000000000000) (tuple2!13639 Unit!9705 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!240005) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3943 (buf!3623 bs1!10)) (bvadd (currentByte!6615 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!240010)))))))) (tuple2!13639 Unit!9706 lt!240005))) (BitStream!5499 (buf!3623 bs1!10) (bvadd (currentByte!6615 bs1!10) #b00000000000000000000000000000001) (currentBit!6610 bs1!10))))))

(declare-fun b!153690 () Bool)

(declare-fun e!103094 () Bool)

(assert (=> b!153690 (= e!103093 e!103094)))

(declare-fun res!128710 () Bool)

(assert (=> b!153690 (=> (not res!128710) (not e!103094))))

(declare-fun lt!240008 () tuple2!13634)

(assert (=> b!153690 (= res!128710 (= (buf!3623 (_2!7209 lt!240008)) (buf!3623 bs1!10)))))

(declare-fun lt!240007 () (_ BitVec 8))

(declare-fun lt!240009 () (_ BitVec 8))

(declare-fun Unit!9707 () Unit!9695)

(declare-fun Unit!9708 () Unit!9695)

(assert (=> b!153690 (= lt!240008 (tuple2!13635 (_2!7212 (ite (bvsgt ((_ sign_extend 24) lt!240009) #b00000000000000000000000000000000) (tuple2!13639 Unit!9707 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!240007) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3943 (buf!3623 bs1!10)) (bvadd (currentByte!6615 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!240009)))))))) (tuple2!13639 Unit!9708 lt!240007))) (BitStream!5499 (buf!3623 bs1!10) (bvadd (currentByte!6615 bs1!10) #b00000000000000000000000000000001) (currentBit!6610 bs1!10))))))

(assert (=> b!153690 (= lt!240007 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3943 (buf!3623 bs1!10)) (currentByte!6615 bs1!10))) ((_ sign_extend 24) lt!240009))))))

(assert (=> b!153690 (= lt!240009 ((_ extract 7 0) (currentBit!6610 bs1!10)))))

(declare-fun lt!240006 () (_ BitVec 64))

(declare-fun b!153691 () Bool)

(declare-fun lt!240011 () (_ BitVec 64))

(assert (=> b!153691 (= e!103094 (= (bitIndex!0 (size!3120 (buf!3623 (_2!7209 lt!240008))) (currentByte!6615 (_2!7209 lt!240008)) (currentBit!6610 (_2!7209 lt!240008))) (bvadd lt!240006 lt!240011)))))

(assert (=> b!153691 (or (not (= (bvand lt!240006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240011 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!240006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!240006 lt!240011) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!153691 (= lt!240011 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!153691 (= lt!240006 (bitIndex!0 (size!3120 (buf!3623 bs1!10)) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10)))))

(assert (= (and d!50552 res!128709) b!153690))

(assert (= (and b!153690 res!128710) b!153691))

(assert (=> d!50552 m!239383))

(declare-fun m!239553 () Bool)

(assert (=> d!50552 m!239553))

(declare-fun m!239555 () Bool)

(assert (=> d!50552 m!239555))

(assert (=> b!153690 m!239555))

(assert (=> b!153690 m!239383))

(declare-fun m!239557 () Bool)

(assert (=> b!153691 m!239557))

(assert (=> b!153691 m!239375))

(assert (=> d!50494 d!50552))

(declare-fun lt!240017 () (_ BitVec 8))

(declare-fun d!50554 () Bool)

(declare-fun lt!240012 () (_ BitVec 8))

(assert (=> d!50554 (= lt!240012 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3943 (buf!3623 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10)))) (currentByte!6615 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10))))) ((_ sign_extend 24) lt!240017))))))

(assert (=> d!50554 (= lt!240017 ((_ extract 7 0) (currentBit!6610 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10)))))))

(declare-fun e!103095 () Bool)

(assert (=> d!50554 e!103095))

(declare-fun res!128711 () Bool)

(assert (=> d!50554 (=> (not res!128711) (not e!103095))))

(assert (=> d!50554 (= res!128711 (validate_offset_bits!1 ((_ sign_extend 32) (size!3120 (buf!3623 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10))))) ((_ sign_extend 32) (currentByte!6615 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10)))) ((_ sign_extend 32) (currentBit!6610 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9709 () Unit!9695)

(declare-fun Unit!9710 () Unit!9695)

(assert (=> d!50554 (= (readByte!0 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10))) (tuple2!13635 (_2!7212 (ite (bvsgt ((_ sign_extend 24) lt!240017) #b00000000000000000000000000000000) (tuple2!13639 Unit!9709 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!240012) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3943 (buf!3623 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10)))) (bvadd (currentByte!6615 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!240017)))))))) (tuple2!13639 Unit!9710 lt!240012))) (BitStream!5499 (buf!3623 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10))) (bvadd (currentByte!6615 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10))) #b00000000000000000000000000000001) (currentBit!6610 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10))))))))

(declare-fun b!153692 () Bool)

(declare-fun e!103096 () Bool)

(assert (=> b!153692 (= e!103095 e!103096)))

(declare-fun res!128712 () Bool)

(assert (=> b!153692 (=> (not res!128712) (not e!103096))))

(declare-fun lt!240015 () tuple2!13634)

(assert (=> b!153692 (= res!128712 (= (buf!3623 (_2!7209 lt!240015)) (buf!3623 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10)))))))

(declare-fun lt!240016 () (_ BitVec 8))

(declare-fun lt!240014 () (_ BitVec 8))

(declare-fun Unit!9711 () Unit!9695)

(declare-fun Unit!9712 () Unit!9695)

(assert (=> b!153692 (= lt!240015 (tuple2!13635 (_2!7212 (ite (bvsgt ((_ sign_extend 24) lt!240016) #b00000000000000000000000000000000) (tuple2!13639 Unit!9711 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!240014) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3943 (buf!3623 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10)))) (bvadd (currentByte!6615 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!240016)))))))) (tuple2!13639 Unit!9712 lt!240014))) (BitStream!5499 (buf!3623 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10))) (bvadd (currentByte!6615 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10))) #b00000000000000000000000000000001) (currentBit!6610 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10))))))))

(assert (=> b!153692 (= lt!240014 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3943 (buf!3623 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10)))) (currentByte!6615 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10))))) ((_ sign_extend 24) lt!240016))))))

(assert (=> b!153692 (= lt!240016 ((_ extract 7 0) (currentBit!6610 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10)))))))

(declare-fun lt!240013 () (_ BitVec 64))

(declare-fun lt!240018 () (_ BitVec 64))

(declare-fun b!153693 () Bool)

(assert (=> b!153693 (= e!103096 (= (bitIndex!0 (size!3120 (buf!3623 (_2!7209 lt!240015))) (currentByte!6615 (_2!7209 lt!240015)) (currentBit!6610 (_2!7209 lt!240015))) (bvadd lt!240013 lt!240018)))))

(assert (=> b!153693 (or (not (= (bvand lt!240013 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240018 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!240013 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!240013 lt!240018) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!153693 (= lt!240018 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!153693 (= lt!240013 (bitIndex!0 (size!3120 (buf!3623 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10)))) (currentByte!6615 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10))) (currentBit!6610 (BitStream!5499 (buf!3623 bs2!18) (currentByte!6615 bs1!10) (currentBit!6610 bs1!10)))))))

(assert (= (and d!50554 res!128711) b!153692))

(assert (= (and b!153692 res!128712) b!153693))

(declare-fun m!239559 () Bool)

(assert (=> d!50554 m!239559))

(declare-fun m!239561 () Bool)

(assert (=> d!50554 m!239561))

(declare-fun m!239563 () Bool)

(assert (=> d!50554 m!239563))

(assert (=> b!153692 m!239563))

(assert (=> b!153692 m!239559))

(declare-fun m!239565 () Bool)

(assert (=> b!153693 m!239565))

(declare-fun m!239567 () Bool)

(assert (=> b!153693 m!239567))

(assert (=> d!50492 d!50554))

(assert (=> d!50498 d!50536))

(declare-fun d!50556 () Bool)

(declare-fun res!128713 () Bool)

(declare-fun e!103097 () Bool)

(assert (=> d!50556 (=> res!128713 e!103097)))

(assert (=> d!50556 (= res!128713 (= (_1!7210 lt!239960) (_2!7210 lt!239960)))))

(assert (=> d!50556 (= (arrayRangesEq!382 (buf!3623 bs1!10) (buf!3623 bs2!18) (_1!7210 lt!239960) (_2!7210 lt!239960)) e!103097)))

(declare-fun b!153694 () Bool)

(declare-fun e!103098 () Bool)

(assert (=> b!153694 (= e!103097 e!103098)))

(declare-fun res!128714 () Bool)

(assert (=> b!153694 (=> (not res!128714) (not e!103098))))

(assert (=> b!153694 (= res!128714 (= (select (arr!3943 (buf!3623 bs1!10)) (_1!7210 lt!239960)) (select (arr!3943 (buf!3623 bs2!18)) (_1!7210 lt!239960))))))

(declare-fun b!153695 () Bool)

(assert (=> b!153695 (= e!103098 (arrayRangesEq!382 (buf!3623 bs1!10) (buf!3623 bs2!18) (bvadd (_1!7210 lt!239960) #b00000000000000000000000000000001) (_2!7210 lt!239960)))))

(assert (= (and d!50556 (not res!128713)) b!153694))

(assert (= (and b!153694 res!128714) b!153695))

(declare-fun m!239569 () Bool)

(assert (=> b!153694 m!239569))

(declare-fun m!239571 () Bool)

(assert (=> b!153694 m!239571))

(declare-fun m!239573 () Bool)

(assert (=> b!153695 m!239573))

(assert (=> b!153663 d!50556))

(push 1)

(assert (not d!50552))

(assert (not b!153685))

(assert (not b!153695))

(assert (not b!153691))

(assert (not b!153693))

(assert (not d!50554))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

