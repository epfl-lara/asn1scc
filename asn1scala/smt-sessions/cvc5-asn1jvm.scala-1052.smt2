; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30130 () Bool)

(assert start!30130)

(declare-fun res!129342 () Bool)

(declare-fun e!103923 () Bool)

(assert (=> start!30130 (=> (not res!129342) (not e!103923))))

(declare-datatypes ((array!6998 0))(
  ( (array!6999 (arr!3974 (Array (_ BitVec 32) (_ BitVec 8))) (size!3151 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5560 0))(
  ( (BitStream!5561 (buf!3654 array!6998) (currentByte!6679 (_ BitVec 32)) (currentBit!6674 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5560)

(declare-fun bs2!18 () BitStream!5560)

(assert (=> start!30130 (= res!129342 (= (size!3151 (buf!3654 bs1!10)) (size!3151 (buf!3654 bs2!18))))))

(assert (=> start!30130 e!103923))

(declare-fun e!103920 () Bool)

(declare-fun inv!12 (BitStream!5560) Bool)

(assert (=> start!30130 (and (inv!12 bs1!10) e!103920)))

(declare-fun e!103921 () Bool)

(assert (=> start!30130 (and (inv!12 bs2!18) e!103921)))

(declare-fun b!154554 () Bool)

(declare-fun res!129341 () Bool)

(declare-fun e!103922 () Bool)

(assert (=> b!154554 (=> (not res!129341) (not e!103922))))

(declare-fun lt!240924 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!6998 array!6998 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154554 (= res!129341 (arrayBitRangesEq!0 (buf!3654 bs1!10) (buf!3654 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240924))))

(declare-fun b!154555 () Bool)

(declare-fun res!129340 () Bool)

(assert (=> b!154555 (=> (not res!129340) (not e!103922))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154555 (= res!129340 (bvsle lt!240924 (bitIndex!0 (size!3151 (buf!3654 bs2!18)) (currentByte!6679 bs2!18) (currentBit!6674 bs2!18))))))

(declare-fun b!154556 () Bool)

(declare-fun lt!240922 () (_ BitVec 64))

(assert (=> b!154556 (= e!103922 (and (bvslt lt!240922 #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt lt!240922 #b1111111111111111111111111111111110000000000000000000000000000000)))))

(declare-fun lt!240925 () (_ BitVec 64))

(assert (=> b!154556 (= lt!240922 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!240925 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-datatypes ((tuple2!13690 0))(
  ( (tuple2!13691 (_1!7247 BitStream!5560) (_2!7247 (_ BitVec 8))) )
))
(declare-fun lt!240923 () tuple2!13690)

(declare-fun readBytePure!0 (BitStream!5560) tuple2!13690)

(assert (=> b!154556 (= lt!240923 (readBytePure!0 (BitStream!5561 (buf!3654 bs2!18) (currentByte!6679 bs1!10) (currentBit!6674 bs1!10))))))

(declare-fun lt!240921 () tuple2!13690)

(assert (=> b!154556 (= lt!240921 (readBytePure!0 bs1!10))))

(declare-fun b!154557 () Bool)

(declare-fun array_inv!2940 (array!6998) Bool)

(assert (=> b!154557 (= e!103921 (array_inv!2940 (buf!3654 bs2!18)))))

(declare-fun b!154558 () Bool)

(assert (=> b!154558 (= e!103923 e!103922)))

(declare-fun res!129339 () Bool)

(assert (=> b!154558 (=> (not res!129339) (not e!103922))))

(assert (=> b!154558 (= res!129339 (bvsle lt!240924 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3151 (buf!3654 bs1!10))))))))

(assert (=> b!154558 (= lt!240924 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!240925))))

(assert (=> b!154558 (= lt!240925 (bitIndex!0 (size!3151 (buf!3654 bs1!10)) (currentByte!6679 bs1!10) (currentBit!6674 bs1!10)))))

(declare-fun b!154559 () Bool)

(assert (=> b!154559 (= e!103920 (array_inv!2940 (buf!3654 bs1!10)))))

(assert (= (and start!30130 res!129342) b!154558))

(assert (= (and b!154558 res!129339) b!154555))

(assert (= (and b!154555 res!129340) b!154554))

(assert (= (and b!154554 res!129341) b!154556))

(assert (= start!30130 b!154559))

(assert (= start!30130 b!154557))

(declare-fun m!240517 () Bool)

(assert (=> b!154555 m!240517))

(declare-fun m!240519 () Bool)

(assert (=> start!30130 m!240519))

(declare-fun m!240521 () Bool)

(assert (=> start!30130 m!240521))

(declare-fun m!240523 () Bool)

(assert (=> b!154559 m!240523))

(declare-fun m!240525 () Bool)

(assert (=> b!154558 m!240525))

(declare-fun m!240527 () Bool)

(assert (=> b!154554 m!240527))

(declare-fun m!240529 () Bool)

(assert (=> b!154556 m!240529))

(declare-fun m!240531 () Bool)

(assert (=> b!154556 m!240531))

(declare-fun m!240533 () Bool)

(assert (=> b!154557 m!240533))

(push 1)

(assert (not b!154559))

(assert (not b!154555))

(assert (not b!154558))

(assert (not b!154554))

(assert (not b!154556))

(assert (not b!154557))

(assert (not start!30130))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50952 () Bool)

(declare-fun e!103983 () Bool)

(assert (=> d!50952 e!103983))

(declare-fun res!129392 () Bool)

(assert (=> d!50952 (=> (not res!129392) (not e!103983))))

(declare-fun lt!240996 () (_ BitVec 64))

(declare-fun lt!240999 () (_ BitVec 64))

(declare-fun lt!240998 () (_ BitVec 64))

(assert (=> d!50952 (= res!129392 (= lt!240999 (bvsub lt!240996 lt!240998)))))

(assert (=> d!50952 (or (= (bvand lt!240996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240998 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240996 lt!240998) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50952 (= lt!240998 (remainingBits!0 ((_ sign_extend 32) (size!3151 (buf!3654 bs1!10))) ((_ sign_extend 32) (currentByte!6679 bs1!10)) ((_ sign_extend 32) (currentBit!6674 bs1!10))))))

(declare-fun lt!241000 () (_ BitVec 64))

(declare-fun lt!240995 () (_ BitVec 64))

(assert (=> d!50952 (= lt!240996 (bvmul lt!241000 lt!240995))))

(assert (=> d!50952 (or (= lt!241000 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240995 (bvsdiv (bvmul lt!241000 lt!240995) lt!241000)))))

(assert (=> d!50952 (= lt!240995 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50952 (= lt!241000 ((_ sign_extend 32) (size!3151 (buf!3654 bs1!10))))))

(assert (=> d!50952 (= lt!240999 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6679 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6674 bs1!10))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50952 (invariant!0 (currentBit!6674 bs1!10) (currentByte!6679 bs1!10) (size!3151 (buf!3654 bs1!10)))))

(assert (=> d!50952 (= (bitIndex!0 (size!3151 (buf!3654 bs1!10)) (currentByte!6679 bs1!10) (currentBit!6674 bs1!10)) lt!240999)))

(declare-fun b!154627 () Bool)

(declare-fun res!129393 () Bool)

(assert (=> b!154627 (=> (not res!129393) (not e!103983))))

(assert (=> b!154627 (= res!129393 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240999))))

(declare-fun b!154628 () Bool)

(declare-fun lt!240997 () (_ BitVec 64))

(assert (=> b!154628 (= e!103983 (bvsle lt!240999 (bvmul lt!240997 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154628 (or (= lt!240997 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240997 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240997)))))

(assert (=> b!154628 (= lt!240997 ((_ sign_extend 32) (size!3151 (buf!3654 bs1!10))))))

(assert (= (and d!50952 res!129392) b!154627))

(assert (= (and b!154627 res!129393) b!154628))

(declare-fun m!240585 () Bool)

(assert (=> d!50952 m!240585))

(declare-fun m!240589 () Bool)

(assert (=> d!50952 m!240589))

(assert (=> b!154558 d!50952))

(declare-fun d!50954 () Bool)

(assert (=> d!50954 (= (inv!12 bs1!10) (invariant!0 (currentBit!6674 bs1!10) (currentByte!6679 bs1!10) (size!3151 (buf!3654 bs1!10))))))

(declare-fun bs!12467 () Bool)

(assert (= bs!12467 d!50954))

(assert (=> bs!12467 m!240589))

(assert (=> start!30130 d!50954))

(declare-fun d!50958 () Bool)

(assert (=> d!50958 (= (inv!12 bs2!18) (invariant!0 (currentBit!6674 bs2!18) (currentByte!6679 bs2!18) (size!3151 (buf!3654 bs2!18))))))

(declare-fun bs!12469 () Bool)

(assert (= bs!12469 d!50958))

(declare-fun m!240597 () Bool)

(assert (=> bs!12469 m!240597))

(assert (=> start!30130 d!50958))

(declare-fun d!50962 () Bool)

(assert (=> d!50962 (= (array_inv!2940 (buf!3654 bs1!10)) (bvsge (size!3151 (buf!3654 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!154559 d!50962))

(declare-fun b!154645 () Bool)

(declare-fun res!129410 () Bool)

(declare-fun lt!241019 () (_ BitVec 32))

(assert (=> b!154645 (= res!129410 (= lt!241019 #b00000000000000000000000000000000))))

(declare-fun e!104000 () Bool)

(assert (=> b!154645 (=> res!129410 e!104000)))

(declare-fun e!104002 () Bool)

(assert (=> b!154645 (= e!104002 e!104000)))

(declare-fun b!154646 () Bool)

(declare-fun e!104001 () Bool)

(declare-fun call!2210 () Bool)

(assert (=> b!154646 (= e!104001 call!2210)))

(declare-fun b!154647 () Bool)

(declare-fun e!103999 () Bool)

(declare-fun e!103997 () Bool)

(assert (=> b!154647 (= e!103999 e!103997)))

(declare-fun res!129409 () Bool)

(assert (=> b!154647 (=> (not res!129409) (not e!103997))))

(declare-fun e!103998 () Bool)

(assert (=> b!154647 (= res!129409 e!103998)))

(declare-fun res!129406 () Bool)

(assert (=> b!154647 (=> res!129406 e!103998)))

(declare-datatypes ((tuple4!200 0))(
  ( (tuple4!201 (_1!7252 (_ BitVec 32)) (_2!7252 (_ BitVec 32)) (_3!403 (_ BitVec 32)) (_4!100 (_ BitVec 32))) )
))
(declare-fun lt!241018 () tuple4!200)

(assert (=> b!154647 (= res!129406 (bvsge (_1!7252 lt!241018) (_2!7252 lt!241018)))))

(assert (=> b!154647 (= lt!241019 ((_ extract 31 0) (bvsrem lt!240924 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!241017 () (_ BitVec 32))

(assert (=> b!154647 (= lt!241017 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!200)

(assert (=> b!154647 (= lt!241018 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!240924))))

(declare-fun d!50968 () Bool)

(declare-fun res!129407 () Bool)

(assert (=> d!50968 (=> res!129407 e!103999)))

(assert (=> d!50968 (= res!129407 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!240924))))

(assert (=> d!50968 (= (arrayBitRangesEq!0 (buf!3654 bs1!10) (buf!3654 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240924) e!103999)))

(declare-fun b!154648 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!154648 (= e!104000 (byteRangesEq!0 (select (arr!3974 (buf!3654 bs1!10)) (_4!100 lt!241018)) (select (arr!3974 (buf!3654 bs2!18)) (_4!100 lt!241018)) #b00000000000000000000000000000000 lt!241019))))

(declare-fun b!154649 () Bool)

(assert (=> b!154649 (= e!104001 e!104002)))

(declare-fun res!129408 () Bool)

(assert (=> b!154649 (= res!129408 call!2210)))

(assert (=> b!154649 (=> (not res!129408) (not e!104002))))

(declare-fun bm!2207 () Bool)

(declare-fun c!8226 () Bool)

(assert (=> bm!2207 (= call!2210 (byteRangesEq!0 (select (arr!3974 (buf!3654 bs1!10)) (_3!403 lt!241018)) (select (arr!3974 (buf!3654 bs2!18)) (_3!403 lt!241018)) lt!241017 (ite c!8226 lt!241019 #b00000000000000000000000000001000)))))

(declare-fun b!154650 () Bool)

(assert (=> b!154650 (= e!103997 e!104001)))

(assert (=> b!154650 (= c!8226 (= (_3!403 lt!241018) (_4!100 lt!241018)))))

(declare-fun b!154651 () Bool)

(declare-fun arrayRangesEq!393 (array!6998 array!6998 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!154651 (= e!103998 (arrayRangesEq!393 (buf!3654 bs1!10) (buf!3654 bs2!18) (_1!7252 lt!241018) (_2!7252 lt!241018)))))

(assert (= (and d!50968 (not res!129407)) b!154647))

(assert (= (and b!154647 (not res!129406)) b!154651))

(assert (= (and b!154647 res!129409) b!154650))

(assert (= (and b!154650 c!8226) b!154646))

(assert (= (and b!154650 (not c!8226)) b!154649))

(assert (= (and b!154649 res!129408) b!154645))

(assert (= (and b!154645 (not res!129410)) b!154648))

(assert (= (or b!154646 b!154649) bm!2207))

(declare-fun m!240605 () Bool)

(assert (=> b!154647 m!240605))

(declare-fun m!240607 () Bool)

(assert (=> b!154648 m!240607))

(declare-fun m!240609 () Bool)

(assert (=> b!154648 m!240609))

(assert (=> b!154648 m!240607))

(assert (=> b!154648 m!240609))

(declare-fun m!240611 () Bool)

(assert (=> b!154648 m!240611))

(declare-fun m!240613 () Bool)

(assert (=> bm!2207 m!240613))

(declare-fun m!240615 () Bool)

(assert (=> bm!2207 m!240615))

(assert (=> bm!2207 m!240613))

(assert (=> bm!2207 m!240615))

(declare-fun m!240617 () Bool)

(assert (=> bm!2207 m!240617))

(declare-fun m!240619 () Bool)

(assert (=> b!154651 m!240619))

(assert (=> b!154554 d!50968))

(declare-fun d!50978 () Bool)

(declare-datatypes ((tuple2!13698 0))(
  ( (tuple2!13699 (_1!7253 (_ BitVec 8)) (_2!7253 BitStream!5560)) )
))
(declare-fun lt!241022 () tuple2!13698)

(declare-fun readByte!0 (BitStream!5560) tuple2!13698)

(assert (=> d!50978 (= lt!241022 (readByte!0 (BitStream!5561 (buf!3654 bs2!18) (currentByte!6679 bs1!10) (currentBit!6674 bs1!10))))))

(assert (=> d!50978 (= (readBytePure!0 (BitStream!5561 (buf!3654 bs2!18) (currentByte!6679 bs1!10) (currentBit!6674 bs1!10))) (tuple2!13691 (_2!7253 lt!241022) (_1!7253 lt!241022)))))

(declare-fun bs!12473 () Bool)

(assert (= bs!12473 d!50978))

(declare-fun m!240621 () Bool)

(assert (=> bs!12473 m!240621))

(assert (=> b!154556 d!50978))

(declare-fun d!50980 () Bool)

(declare-fun lt!241023 () tuple2!13698)

(assert (=> d!50980 (= lt!241023 (readByte!0 bs1!10))))

(assert (=> d!50980 (= (readBytePure!0 bs1!10) (tuple2!13691 (_2!7253 lt!241023) (_1!7253 lt!241023)))))

(declare-fun bs!12474 () Bool)

(assert (= bs!12474 d!50980))

(declare-fun m!240623 () Bool)

(assert (=> bs!12474 m!240623))

(assert (=> b!154556 d!50980))

(declare-fun d!50982 () Bool)

(declare-fun e!104003 () Bool)

(assert (=> d!50982 e!104003))

(declare-fun res!129411 () Bool)

(assert (=> d!50982 (=> (not res!129411) (not e!104003))))

(declare-fun lt!241025 () (_ BitVec 64))

(declare-fun lt!241028 () (_ BitVec 64))

(declare-fun lt!241027 () (_ BitVec 64))

(assert (=> d!50982 (= res!129411 (= lt!241028 (bvsub lt!241025 lt!241027)))))

(assert (=> d!50982 (or (= (bvand lt!241025 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241027 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241025 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241025 lt!241027) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50982 (= lt!241027 (remainingBits!0 ((_ sign_extend 32) (size!3151 (buf!3654 bs2!18))) ((_ sign_extend 32) (currentByte!6679 bs2!18)) ((_ sign_extend 32) (currentBit!6674 bs2!18))))))

(declare-fun lt!241029 () (_ BitVec 64))

(declare-fun lt!241024 () (_ BitVec 64))

(assert (=> d!50982 (= lt!241025 (bvmul lt!241029 lt!241024))))

(assert (=> d!50982 (or (= lt!241029 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241024 (bvsdiv (bvmul lt!241029 lt!241024) lt!241029)))))

(assert (=> d!50982 (= lt!241024 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50982 (= lt!241029 ((_ sign_extend 32) (size!3151 (buf!3654 bs2!18))))))

(assert (=> d!50982 (= lt!241028 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6679 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6674 bs2!18))))))

(assert (=> d!50982 (invariant!0 (currentBit!6674 bs2!18) (currentByte!6679 bs2!18) (size!3151 (buf!3654 bs2!18)))))

(assert (=> d!50982 (= (bitIndex!0 (size!3151 (buf!3654 bs2!18)) (currentByte!6679 bs2!18) (currentBit!6674 bs2!18)) lt!241028)))

(declare-fun b!154652 () Bool)

(declare-fun res!129412 () Bool)

(assert (=> b!154652 (=> (not res!129412) (not e!104003))))

(assert (=> b!154652 (= res!129412 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241028))))

(declare-fun b!154653 () Bool)

(declare-fun lt!241026 () (_ BitVec 64))

(assert (=> b!154653 (= e!104003 (bvsle lt!241028 (bvmul lt!241026 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154653 (or (= lt!241026 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241026 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241026)))))

(assert (=> b!154653 (= lt!241026 ((_ sign_extend 32) (size!3151 (buf!3654 bs2!18))))))

(assert (= (and d!50982 res!129411) b!154652))

(assert (= (and b!154652 res!129412) b!154653))

(declare-fun m!240625 () Bool)

(assert (=> d!50982 m!240625))

(assert (=> d!50982 m!240597))

(assert (=> b!154555 d!50982))

(declare-fun d!50984 () Bool)

(assert (=> d!50984 (= (array_inv!2940 (buf!3654 bs2!18)) (bvsge (size!3151 (buf!3654 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!154557 d!50984))

(push 1)

(assert (not b!154651))

(assert (not b!154647))

(assert (not d!50982))

(assert (not d!50952))

(assert (not d!50954))

(assert (not d!50978))

(assert (not bm!2207))

(assert (not d!50958))

(assert (not d!50980))

(assert (not b!154648))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

