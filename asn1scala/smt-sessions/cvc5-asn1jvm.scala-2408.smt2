; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61202 () Bool)

(assert start!61202)

(declare-fun b!275698 () Bool)

(declare-fun e!195671 () Bool)

(declare-datatypes ((array!15763 0))(
  ( (array!15764 (arr!7816 (Array (_ BitVec 32) (_ BitVec 8))) (size!6829 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12472 0))(
  ( (BitStream!12473 (buf!7297 array!15763) (currentByte!13470 (_ BitVec 32)) (currentBit!13465 (_ BitVec 32))) )
))
(declare-fun bs2!19 () BitStream!12472)

(declare-fun array_inv!6553 (array!15763) Bool)

(assert (=> b!275698 (= e!195671 (array_inv!6553 (buf!7297 bs2!19)))))

(declare-fun b!275699 () Bool)

(declare-fun e!195675 () Bool)

(declare-fun e!195674 () Bool)

(assert (=> b!275699 (= e!195675 e!195674)))

(declare-fun res!229138 () Bool)

(assert (=> b!275699 (=> (not res!229138) (not e!195674))))

(declare-fun lt!413686 () (_ BitVec 64))

(declare-fun bs1!11 () BitStream!12472)

(declare-fun arrayBitRangesEq!0 (array!15763 array!15763 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275699 (= res!229138 (arrayBitRangesEq!0 (buf!7297 bs1!11) (buf!7297 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413686))))

(declare-fun lt!413685 () (_ BitVec 64))

(assert (=> b!275699 (= lt!413686 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!413685))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275699 (= lt!413685 (bitIndex!0 (size!6829 (buf!7297 bs1!11)) (currentByte!13470 bs1!11) (currentBit!13465 bs1!11)))))

(declare-fun res!229136 () Bool)

(assert (=> start!61202 (=> (not res!229136) (not e!195675))))

(assert (=> start!61202 (= res!229136 (= (size!6829 (buf!7297 bs1!11)) (size!6829 (buf!7297 bs2!19))))))

(assert (=> start!61202 e!195675))

(declare-fun e!195676 () Bool)

(declare-fun inv!12 (BitStream!12472) Bool)

(assert (=> start!61202 (and (inv!12 bs1!11) e!195676)))

(assert (=> start!61202 (and (inv!12 bs2!19) e!195671)))

(declare-fun b!275700 () Bool)

(declare-fun res!229135 () Bool)

(assert (=> b!275700 (=> (not res!229135) (not e!195675))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275700 (= res!229135 (validate_offset_bit!0 ((_ sign_extend 32) (size!6829 (buf!7297 bs1!11))) ((_ sign_extend 32) (currentByte!13470 bs1!11)) ((_ sign_extend 32) (currentBit!13465 bs1!11))))))

(declare-fun b!275701 () Bool)

(assert (=> b!275701 (= e!195676 (array_inv!6553 (buf!7297 bs1!11)))))

(declare-fun b!275702 () Bool)

(declare-fun e!195672 () Bool)

(declare-datatypes ((tuple2!22478 0))(
  ( (tuple2!22479 (_1!12271 BitStream!12472) (_2!12271 Bool)) )
))
(declare-fun lt!413687 () tuple2!22478)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275702 (= e!195672 (invariant!0 (currentBit!13465 (_1!12271 lt!413687)) (currentByte!13470 (_1!12271 lt!413687)) (size!6829 (buf!7297 (_1!12271 lt!413687)))))))

(declare-fun bitAt!0 (array!15763 (_ BitVec 64)) Bool)

(assert (=> b!275702 (= (bitAt!0 (buf!7297 bs1!11) lt!413685) (bitAt!0 (buf!7297 bs2!19) lt!413685))))

(declare-datatypes ((Unit!19355 0))(
  ( (Unit!19356) )
))
(declare-fun lt!413683 () Unit!19355)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!15763 array!15763 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19355)

(assert (=> b!275702 (= lt!413683 (arrayBitRangesEqImpliesEq!0 (buf!7297 bs1!11) (buf!7297 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413685 lt!413686))))

(declare-fun b!275703 () Bool)

(assert (=> b!275703 (= e!195674 (not e!195672))))

(declare-fun res!229137 () Bool)

(assert (=> b!275703 (=> res!229137 e!195672)))

(assert (=> b!275703 (= res!229137 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!413686) (bvsgt lt!413686 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6829 (buf!7297 bs1!11))))) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!413685) (bvsge lt!413685 lt!413686)))))

(declare-fun lt!413684 () tuple2!22478)

(declare-fun readBitPure!0 (BitStream!12472) tuple2!22478)

(assert (=> b!275703 (= lt!413684 (readBitPure!0 (BitStream!12473 (buf!7297 bs2!19) (currentByte!13470 bs1!11) (currentBit!13465 bs1!11))))))

(assert (=> b!275703 (= lt!413687 (readBitPure!0 bs1!11))))

(assert (=> b!275703 (invariant!0 (currentBit!13465 bs1!11) (currentByte!13470 bs1!11) (size!6829 (buf!7297 bs2!19)))))

(assert (= (and start!61202 res!229136) b!275700))

(assert (= (and b!275700 res!229135) b!275699))

(assert (= (and b!275699 res!229138) b!275703))

(assert (= (and b!275703 (not res!229137)) b!275702))

(assert (= start!61202 b!275701))

(assert (= start!61202 b!275698))

(declare-fun m!408415 () Bool)

(assert (=> b!275699 m!408415))

(declare-fun m!408417 () Bool)

(assert (=> b!275699 m!408417))

(declare-fun m!408419 () Bool)

(assert (=> start!61202 m!408419))

(declare-fun m!408421 () Bool)

(assert (=> start!61202 m!408421))

(declare-fun m!408423 () Bool)

(assert (=> b!275702 m!408423))

(declare-fun m!408425 () Bool)

(assert (=> b!275702 m!408425))

(declare-fun m!408427 () Bool)

(assert (=> b!275702 m!408427))

(declare-fun m!408429 () Bool)

(assert (=> b!275702 m!408429))

(declare-fun m!408431 () Bool)

(assert (=> b!275701 m!408431))

(declare-fun m!408433 () Bool)

(assert (=> b!275700 m!408433))

(declare-fun m!408435 () Bool)

(assert (=> b!275698 m!408435))

(declare-fun m!408437 () Bool)

(assert (=> b!275703 m!408437))

(declare-fun m!408439 () Bool)

(assert (=> b!275703 m!408439))

(declare-fun m!408441 () Bool)

(assert (=> b!275703 m!408441))

(push 1)

(assert (not b!275702))

(assert (not b!275703))

(assert (not b!275700))

(assert (not b!275698))

(assert (not b!275699))

(assert (not start!61202))

(assert (not b!275701))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94720 () Bool)

(assert (=> d!94720 (= (invariant!0 (currentBit!13465 (_1!12271 lt!413687)) (currentByte!13470 (_1!12271 lt!413687)) (size!6829 (buf!7297 (_1!12271 lt!413687)))) (and (bvsge (currentBit!13465 (_1!12271 lt!413687)) #b00000000000000000000000000000000) (bvslt (currentBit!13465 (_1!12271 lt!413687)) #b00000000000000000000000000001000) (bvsge (currentByte!13470 (_1!12271 lt!413687)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13470 (_1!12271 lt!413687)) (size!6829 (buf!7297 (_1!12271 lt!413687)))) (and (= (currentBit!13465 (_1!12271 lt!413687)) #b00000000000000000000000000000000) (= (currentByte!13470 (_1!12271 lt!413687)) (size!6829 (buf!7297 (_1!12271 lt!413687))))))))))

(assert (=> b!275702 d!94720))

(declare-fun d!94724 () Bool)

(assert (=> d!94724 (= (bitAt!0 (buf!7297 bs1!11) lt!413685) (not (= (bvand ((_ sign_extend 24) (select (arr!7816 (buf!7297 bs1!11)) ((_ extract 31 0) (bvsdiv lt!413685 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!413685 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!23886 () Bool)

(assert (= bs!23886 d!94724))

(declare-fun m!408501 () Bool)

(assert (=> bs!23886 m!408501))

(declare-fun m!408503 () Bool)

(assert (=> bs!23886 m!408503))

(assert (=> b!275702 d!94724))

(declare-fun d!94728 () Bool)

(assert (=> d!94728 (= (bitAt!0 (buf!7297 bs2!19) lt!413685) (not (= (bvand ((_ sign_extend 24) (select (arr!7816 (buf!7297 bs2!19)) ((_ extract 31 0) (bvsdiv lt!413685 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!413685 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!23887 () Bool)

(assert (= bs!23887 d!94728))

(declare-fun m!408505 () Bool)

(assert (=> bs!23887 m!408505))

(assert (=> bs!23887 m!408503))

(assert (=> b!275702 d!94728))

(declare-fun d!94730 () Bool)

(assert (=> d!94730 (= (bitAt!0 (buf!7297 bs1!11) lt!413685) (bitAt!0 (buf!7297 bs2!19) lt!413685))))

(declare-fun lt!413720 () Unit!19355)

(declare-fun choose!31 (array!15763 array!15763 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19355)

(assert (=> d!94730 (= lt!413720 (choose!31 (buf!7297 bs1!11) (buf!7297 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413685 lt!413686))))

(assert (=> d!94730 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413686))))

(assert (=> d!94730 (= (arrayBitRangesEqImpliesEq!0 (buf!7297 bs1!11) (buf!7297 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413685 lt!413686) lt!413720)))

(declare-fun bs!23888 () Bool)

(assert (= bs!23888 d!94730))

(assert (=> bs!23888 m!408425))

(assert (=> bs!23888 m!408427))

(declare-fun m!408507 () Bool)

(assert (=> bs!23888 m!408507))

(assert (=> b!275702 d!94730))

(declare-fun d!94734 () Bool)

(declare-datatypes ((tuple2!22484 0))(
  ( (tuple2!22485 (_1!12274 Bool) (_2!12274 BitStream!12472)) )
))
(declare-fun lt!413727 () tuple2!22484)

(declare-fun readBit!0 (BitStream!12472) tuple2!22484)

(assert (=> d!94734 (= lt!413727 (readBit!0 (BitStream!12473 (buf!7297 bs2!19) (currentByte!13470 bs1!11) (currentBit!13465 bs1!11))))))

(assert (=> d!94734 (= (readBitPure!0 (BitStream!12473 (buf!7297 bs2!19) (currentByte!13470 bs1!11) (currentBit!13465 bs1!11))) (tuple2!22479 (_2!12274 lt!413727) (_1!12274 lt!413727)))))

(declare-fun bs!23893 () Bool)

(assert (= bs!23893 d!94734))

(declare-fun m!408519 () Bool)

(assert (=> bs!23893 m!408519))

(assert (=> b!275703 d!94734))

(declare-fun d!94744 () Bool)

(declare-fun lt!413728 () tuple2!22484)

(assert (=> d!94744 (= lt!413728 (readBit!0 bs1!11))))

(assert (=> d!94744 (= (readBitPure!0 bs1!11) (tuple2!22479 (_2!12274 lt!413728) (_1!12274 lt!413728)))))

(declare-fun bs!23894 () Bool)

(assert (= bs!23894 d!94744))

(declare-fun m!408521 () Bool)

(assert (=> bs!23894 m!408521))

(assert (=> b!275703 d!94744))

(declare-fun d!94746 () Bool)

(assert (=> d!94746 (= (invariant!0 (currentBit!13465 bs1!11) (currentByte!13470 bs1!11) (size!6829 (buf!7297 bs2!19))) (and (bvsge (currentBit!13465 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13465 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13470 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13470 bs1!11) (size!6829 (buf!7297 bs2!19))) (and (= (currentBit!13465 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13470 bs1!11) (size!6829 (buf!7297 bs2!19)))))))))

(assert (=> b!275703 d!94746))

(declare-fun d!94748 () Bool)

(assert (=> d!94748 (= (array_inv!6553 (buf!7297 bs1!11)) (bvsge (size!6829 (buf!7297 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!275701 d!94748))

(declare-fun d!94750 () Bool)

(assert (=> d!94750 (= (inv!12 bs1!11) (invariant!0 (currentBit!13465 bs1!11) (currentByte!13470 bs1!11) (size!6829 (buf!7297 bs1!11))))))

(declare-fun bs!23895 () Bool)

(assert (= bs!23895 d!94750))

(declare-fun m!408523 () Bool)

(assert (=> bs!23895 m!408523))

(assert (=> start!61202 d!94750))

(declare-fun d!94758 () Bool)

(assert (=> d!94758 (= (inv!12 bs2!19) (invariant!0 (currentBit!13465 bs2!19) (currentByte!13470 bs2!19) (size!6829 (buf!7297 bs2!19))))))

(declare-fun bs!23896 () Bool)

(assert (= bs!23896 d!94758))

(declare-fun m!408525 () Bool)

(assert (=> bs!23896 m!408525))

(assert (=> start!61202 d!94758))

(declare-fun d!94760 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94760 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6829 (buf!7297 bs1!11))) ((_ sign_extend 32) (currentByte!13470 bs1!11)) ((_ sign_extend 32) (currentBit!13465 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6829 (buf!7297 bs1!11))) ((_ sign_extend 32) (currentByte!13470 bs1!11)) ((_ sign_extend 32) (currentBit!13465 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23899 () Bool)

(assert (= bs!23899 d!94760))

(declare-fun m!408531 () Bool)

(assert (=> bs!23899 m!408531))

(assert (=> b!275700 d!94760))

(declare-fun d!94766 () Bool)

(assert (=> d!94766 (= (array_inv!6553 (buf!7297 bs2!19)) (bvsge (size!6829 (buf!7297 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!275698 d!94766))

(declare-fun e!195743 () Bool)

(declare-datatypes ((tuple4!504 0))(
  ( (tuple4!505 (_1!12276 (_ BitVec 32)) (_2!12276 (_ BitVec 32)) (_3!1032 (_ BitVec 32)) (_4!252 (_ BitVec 32))) )
))
(declare-fun lt!413750 () tuple4!504)

(declare-fun lt!413749 () (_ BitVec 32))

(declare-fun b!275768 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275768 (= e!195743 (byteRangesEq!0 (select (arr!7816 (buf!7297 bs1!11)) (_4!252 lt!413750)) (select (arr!7816 (buf!7297 bs2!19)) (_4!252 lt!413750)) #b00000000000000000000000000000000 lt!413749))))

(declare-fun b!275769 () Bool)

(declare-fun e!195746 () Bool)

(declare-fun call!4414 () Bool)

(assert (=> b!275769 (= e!195746 call!4414)))

(declare-fun b!275770 () Bool)

(declare-fun e!195748 () Bool)

(assert (=> b!275770 (= e!195748 e!195746)))

(declare-fun c!12599 () Bool)

(assert (=> b!275770 (= c!12599 (= (_3!1032 lt!413750) (_4!252 lt!413750)))))

(declare-fun b!275772 () Bool)

(declare-fun e!195744 () Bool)

(assert (=> b!275772 (= e!195744 e!195748)))

(declare-fun res!229184 () Bool)

(assert (=> b!275772 (=> (not res!229184) (not e!195748))))

(declare-fun e!195745 () Bool)

(assert (=> b!275772 (= res!229184 e!195745)))

(declare-fun res!229187 () Bool)

(assert (=> b!275772 (=> res!229187 e!195745)))

(assert (=> b!275772 (= res!229187 (bvsge (_1!12276 lt!413750) (_2!12276 lt!413750)))))

(assert (=> b!275772 (= lt!413749 ((_ extract 31 0) (bvsrem lt!413686 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!413748 () (_ BitVec 32))

(assert (=> b!275772 (= lt!413748 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!504)

(assert (=> b!275772 (= lt!413750 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!413686))))

(declare-fun b!275773 () Bool)

(declare-fun e!195747 () Bool)

(assert (=> b!275773 (= e!195746 e!195747)))

(declare-fun res!229186 () Bool)

(assert (=> b!275773 (= res!229186 call!4414)))

(assert (=> b!275773 (=> (not res!229186) (not e!195747))))

(declare-fun b!275771 () Bool)

(declare-fun arrayRangesEq!1145 (array!15763 array!15763 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275771 (= e!195745 (arrayRangesEq!1145 (buf!7297 bs1!11) (buf!7297 bs2!19) (_1!12276 lt!413750) (_2!12276 lt!413750)))))

(declare-fun d!94768 () Bool)

(declare-fun res!229185 () Bool)

(assert (=> d!94768 (=> res!229185 e!195744)))

(assert (=> d!94768 (= res!229185 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!413686))))

(assert (=> d!94768 (= (arrayBitRangesEq!0 (buf!7297 bs1!11) (buf!7297 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413686) e!195744)))

(declare-fun b!275774 () Bool)

(declare-fun res!229183 () Bool)

(assert (=> b!275774 (= res!229183 (= lt!413749 #b00000000000000000000000000000000))))

(assert (=> b!275774 (=> res!229183 e!195743)))

(assert (=> b!275774 (= e!195747 e!195743)))

(declare-fun bm!4411 () Bool)

(assert (=> bm!4411 (= call!4414 (byteRangesEq!0 (select (arr!7816 (buf!7297 bs1!11)) (_3!1032 lt!413750)) (select (arr!7816 (buf!7297 bs2!19)) (_3!1032 lt!413750)) lt!413748 (ite c!12599 lt!413749 #b00000000000000000000000000001000)))))

(assert (= (and d!94768 (not res!229185)) b!275772))

(assert (= (and b!275772 (not res!229187)) b!275771))

(assert (= (and b!275772 res!229184) b!275770))

(assert (= (and b!275770 c!12599) b!275769))

(assert (= (and b!275770 (not c!12599)) b!275773))

(assert (= (and b!275773 res!229186) b!275774))

(assert (= (and b!275774 (not res!229183)) b!275768))

(assert (= (or b!275769 b!275773) bm!4411))

(declare-fun m!408543 () Bool)

(assert (=> b!275768 m!408543))

(declare-fun m!408547 () Bool)

(assert (=> b!275768 m!408547))

(assert (=> b!275768 m!408543))

(assert (=> b!275768 m!408547))

(declare-fun m!408553 () Bool)

(assert (=> b!275768 m!408553))

(declare-fun m!408555 () Bool)

(assert (=> b!275772 m!408555))

(declare-fun m!408557 () Bool)

(assert (=> b!275771 m!408557))

(declare-fun m!408561 () Bool)

(assert (=> bm!4411 m!408561))

(declare-fun m!408565 () Bool)

(assert (=> bm!4411 m!408565))

(assert (=> bm!4411 m!408561))

(assert (=> bm!4411 m!408565))

(declare-fun m!408569 () Bool)

(assert (=> bm!4411 m!408569))

(assert (=> b!275699 d!94768))

(declare-fun d!94784 () Bool)

(declare-fun e!195777 () Bool)

(assert (=> d!94784 e!195777))

(declare-fun res!229217 () Bool)

(assert (=> d!94784 (=> (not res!229217) (not e!195777))))

(declare-fun lt!413792 () (_ BitVec 64))

(declare-fun lt!413791 () (_ BitVec 64))

(declare-fun lt!413788 () (_ BitVec 64))

(assert (=> d!94784 (= res!229217 (= lt!413788 (bvsub lt!413791 lt!413792)))))

(assert (=> d!94784 (or (= (bvand lt!413791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413792 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413791 lt!413792) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94784 (= lt!413792 (remainingBits!0 ((_ sign_extend 32) (size!6829 (buf!7297 bs1!11))) ((_ sign_extend 32) (currentByte!13470 bs1!11)) ((_ sign_extend 32) (currentBit!13465 bs1!11))))))

(declare-fun lt!413787 () (_ BitVec 64))

(declare-fun lt!413789 () (_ BitVec 64))

(assert (=> d!94784 (= lt!413791 (bvmul lt!413787 lt!413789))))

(assert (=> d!94784 (or (= lt!413787 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413789 (bvsdiv (bvmul lt!413787 lt!413789) lt!413787)))))

(assert (=> d!94784 (= lt!413789 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94784 (= lt!413787 ((_ sign_extend 32) (size!6829 (buf!7297 bs1!11))))))

(assert (=> d!94784 (= lt!413788 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13470 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13465 bs1!11))))))

(assert (=> d!94784 (invariant!0 (currentBit!13465 bs1!11) (currentByte!13470 bs1!11) (size!6829 (buf!7297 bs1!11)))))

(assert (=> d!94784 (= (bitIndex!0 (size!6829 (buf!7297 bs1!11)) (currentByte!13470 bs1!11) (currentBit!13465 bs1!11)) lt!413788)))

(declare-fun b!275811 () Bool)

(declare-fun res!229216 () Bool)

(assert (=> b!275811 (=> (not res!229216) (not e!195777))))

(assert (=> b!275811 (= res!229216 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413788))))

(declare-fun b!275812 () Bool)

(declare-fun lt!413790 () (_ BitVec 64))

(assert (=> b!275812 (= e!195777 (bvsle lt!413788 (bvmul lt!413790 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!275812 (or (= lt!413790 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413790 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413790)))))

(assert (=> b!275812 (= lt!413790 ((_ sign_extend 32) (size!6829 (buf!7297 bs1!11))))))

(assert (= (and d!94784 res!229217) b!275811))

(assert (= (and b!275811 res!229216) b!275812))

(assert (=> d!94784 m!408531))

(assert (=> d!94784 m!408523))

(assert (=> b!275699 d!94784))

(push 1)

(assert (not d!94730))

(assert (not d!94744))

(assert (not bm!4411))

(assert (not b!275772))

(assert (not d!94758))

(assert (not d!94760))

(assert (not d!94734))

(assert (not d!94784))

(assert (not b!275768))

(assert (not b!275771))

(assert (not d!94750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

