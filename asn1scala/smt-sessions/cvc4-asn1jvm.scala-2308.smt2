; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58504 () Bool)

(assert start!58504)

(declare-fun b!268606 () Bool)

(declare-fun res!223996 () Bool)

(declare-fun e!188613 () Bool)

(assert (=> b!268606 (=> (not res!223996) (not e!188613))))

(declare-datatypes ((array!14979 0))(
  ( (array!14980 (arr!7518 (Array (_ BitVec 32) (_ BitVec 8))) (size!6531 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11876 0))(
  ( (BitStream!11877 (buf!6999 array!14979) (currentByte!12923 (_ BitVec 32)) (currentBit!12918 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11876)

(declare-fun w3!25 () BitStream!11876)

(declare-fun isPrefixOf!0 (BitStream!11876 BitStream!11876) Bool)

(assert (=> b!268606 (= res!223996 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!268607 () Bool)

(declare-fun e!188614 () Bool)

(declare-fun array_inv!6255 (array!14979) Bool)

(assert (=> b!268607 (= e!188614 (array_inv!6255 (buf!6999 w2!587)))))

(declare-fun b!268608 () Bool)

(declare-fun e!188610 () Bool)

(assert (=> b!268608 (= e!188610 (array_inv!6255 (buf!6999 w3!25)))))

(declare-fun b!268609 () Bool)

(declare-fun e!188616 () Bool)

(declare-fun w1!591 () BitStream!11876)

(assert (=> b!268609 (= e!188616 (array_inv!6255 (buf!6999 w1!591)))))

(declare-fun res!223995 () Bool)

(assert (=> start!58504 (=> (not res!223995) (not e!188613))))

(assert (=> start!58504 (= res!223995 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58504 e!188613))

(declare-fun inv!12 (BitStream!11876) Bool)

(assert (=> start!58504 (and (inv!12 w1!591) e!188616)))

(assert (=> start!58504 (and (inv!12 w2!587) e!188614)))

(assert (=> start!58504 (and (inv!12 w3!25) e!188610)))

(declare-fun b!268610 () Bool)

(assert (=> b!268610 (= e!188613 (not (or (bvsge (currentByte!12923 w1!591) (size!6531 (buf!6999 w1!591))) (bvslt (currentByte!12923 w1!591) (currentByte!12923 w2!587)) (bvsle (currentBit!12918 w1!591) (currentBit!12918 w2!587)))))))

(declare-fun arrayRangesEq!1066 (array!14979 array!14979 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268610 (arrayRangesEq!1066 (buf!6999 w1!591) (buf!6999 w3!25) #b00000000000000000000000000000000 (currentByte!12923 w1!591))))

(declare-datatypes ((Unit!19041 0))(
  ( (Unit!19042) )
))
(declare-fun lt!408569 () Unit!19041)

(declare-fun arrayRangesEqTransitive!341 (array!14979 array!14979 array!14979 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19041)

(assert (=> b!268610 (= lt!408569 (arrayRangesEqTransitive!341 (buf!6999 w1!591) (buf!6999 w2!587) (buf!6999 w3!25) #b00000000000000000000000000000000 (currentByte!12923 w1!591) (currentByte!12923 w2!587)))))

(assert (= (and start!58504 res!223995) b!268606))

(assert (= (and b!268606 res!223996) b!268610))

(assert (= start!58504 b!268609))

(assert (= start!58504 b!268607))

(assert (= start!58504 b!268608))

(declare-fun m!400107 () Bool)

(assert (=> b!268608 m!400107))

(declare-fun m!400109 () Bool)

(assert (=> b!268609 m!400109))

(declare-fun m!400111 () Bool)

(assert (=> b!268610 m!400111))

(declare-fun m!400113 () Bool)

(assert (=> b!268610 m!400113))

(declare-fun m!400115 () Bool)

(assert (=> start!58504 m!400115))

(declare-fun m!400117 () Bool)

(assert (=> start!58504 m!400117))

(declare-fun m!400119 () Bool)

(assert (=> start!58504 m!400119))

(declare-fun m!400121 () Bool)

(assert (=> start!58504 m!400121))

(declare-fun m!400123 () Bool)

(assert (=> b!268607 m!400123))

(declare-fun m!400125 () Bool)

(assert (=> b!268606 m!400125))

(push 1)

(assert (not b!268610))

(assert (not start!58504))

(assert (not b!268606))

(assert (not b!268608))

(assert (not b!268609))

(assert (not b!268607))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90830 () Bool)

(assert (=> d!90830 (= (array_inv!6255 (buf!6999 w1!591)) (bvsge (size!6531 (buf!6999 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!268609 d!90830))

(declare-fun d!90832 () Bool)

(assert (=> d!90832 (= (array_inv!6255 (buf!6999 w3!25)) (bvsge (size!6531 (buf!6999 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!268608 d!90832))

(declare-fun d!90834 () Bool)

(declare-fun res!224032 () Bool)

(declare-fun e!188641 () Bool)

(assert (=> d!90834 (=> (not res!224032) (not e!188641))))

(assert (=> d!90834 (= res!224032 (= (size!6531 (buf!6999 w1!591)) (size!6531 (buf!6999 w2!587))))))

(assert (=> d!90834 (= (isPrefixOf!0 w1!591 w2!587) e!188641)))

(declare-fun b!268644 () Bool)

(declare-fun res!224030 () Bool)

(assert (=> b!268644 (=> (not res!224030) (not e!188641))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!268644 (= res!224030 (bvsle (bitIndex!0 (size!6531 (buf!6999 w1!591)) (currentByte!12923 w1!591) (currentBit!12918 w1!591)) (bitIndex!0 (size!6531 (buf!6999 w2!587)) (currentByte!12923 w2!587) (currentBit!12918 w2!587))))))

(declare-fun b!268645 () Bool)

(declare-fun e!188642 () Bool)

(assert (=> b!268645 (= e!188641 e!188642)))

(declare-fun res!224031 () Bool)

(assert (=> b!268645 (=> res!224031 e!188642)))

(assert (=> b!268645 (= res!224031 (= (size!6531 (buf!6999 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!268646 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14979 array!14979 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!268646 (= e!188642 (arrayBitRangesEq!0 (buf!6999 w1!591) (buf!6999 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6531 (buf!6999 w1!591)) (currentByte!12923 w1!591) (currentBit!12918 w1!591))))))

(assert (= (and d!90834 res!224032) b!268644))

(assert (= (and b!268644 res!224030) b!268645))

(assert (= (and b!268645 (not res!224031)) b!268646))

(declare-fun m!400163 () Bool)

(assert (=> b!268644 m!400163))

(declare-fun m!400165 () Bool)

(assert (=> b!268644 m!400165))

(assert (=> b!268646 m!400163))

(assert (=> b!268646 m!400163))

(declare-fun m!400167 () Bool)

(assert (=> b!268646 m!400167))

(assert (=> start!58504 d!90834))

(declare-fun d!90858 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!90858 (= (inv!12 w1!591) (invariant!0 (currentBit!12918 w1!591) (currentByte!12923 w1!591) (size!6531 (buf!6999 w1!591))))))

(declare-fun bs!23056 () Bool)

(assert (= bs!23056 d!90858))

(declare-fun m!400169 () Bool)

(assert (=> bs!23056 m!400169))

(assert (=> start!58504 d!90858))

(declare-fun d!90860 () Bool)

(assert (=> d!90860 (= (inv!12 w2!587) (invariant!0 (currentBit!12918 w2!587) (currentByte!12923 w2!587) (size!6531 (buf!6999 w2!587))))))

(declare-fun bs!23057 () Bool)

(assert (= bs!23057 d!90860))

(declare-fun m!400171 () Bool)

(assert (=> bs!23057 m!400171))

(assert (=> start!58504 d!90860))

(declare-fun d!90862 () Bool)

(assert (=> d!90862 (= (inv!12 w3!25) (invariant!0 (currentBit!12918 w3!25) (currentByte!12923 w3!25) (size!6531 (buf!6999 w3!25))))))

(declare-fun bs!23058 () Bool)

(assert (= bs!23058 d!90862))

(declare-fun m!400173 () Bool)

(assert (=> bs!23058 m!400173))

(assert (=> start!58504 d!90862))

(declare-fun d!90864 () Bool)

(assert (=> d!90864 (= (array_inv!6255 (buf!6999 w2!587)) (bvsge (size!6531 (buf!6999 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!268607 d!90864))

(declare-fun d!90866 () Bool)

(declare-fun res!224041 () Bool)

(declare-fun e!188649 () Bool)

(assert (=> d!90866 (=> (not res!224041) (not e!188649))))

(assert (=> d!90866 (= res!224041 (= (size!6531 (buf!6999 w2!587)) (size!6531 (buf!6999 w3!25))))))

(assert (=> d!90866 (= (isPrefixOf!0 w2!587 w3!25) e!188649)))

(declare-fun b!268653 () Bool)

(declare-fun res!224039 () Bool)

(assert (=> b!268653 (=> (not res!224039) (not e!188649))))

(assert (=> b!268653 (= res!224039 (bvsle (bitIndex!0 (size!6531 (buf!6999 w2!587)) (currentByte!12923 w2!587) (currentBit!12918 w2!587)) (bitIndex!0 (size!6531 (buf!6999 w3!25)) (currentByte!12923 w3!25) (currentBit!12918 w3!25))))))

(declare-fun b!268654 () Bool)

(declare-fun e!188650 () Bool)

(assert (=> b!268654 (= e!188649 e!188650)))

(declare-fun res!224040 () Bool)

(assert (=> b!268654 (=> res!224040 e!188650)))

(assert (=> b!268654 (= res!224040 (= (size!6531 (buf!6999 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!268655 () Bool)

(assert (=> b!268655 (= e!188650 (arrayBitRangesEq!0 (buf!6999 w2!587) (buf!6999 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6531 (buf!6999 w2!587)) (currentByte!12923 w2!587) (currentBit!12918 w2!587))))))

(assert (= (and d!90866 res!224041) b!268653))

(assert (= (and b!268653 res!224039) b!268654))

(assert (= (and b!268654 (not res!224040)) b!268655))

(assert (=> b!268653 m!400165))

(declare-fun m!400181 () Bool)

(assert (=> b!268653 m!400181))

(assert (=> b!268655 m!400165))

(assert (=> b!268655 m!400165))

(declare-fun m!400183 () Bool)

(assert (=> b!268655 m!400183))

(assert (=> b!268606 d!90866))

(declare-fun d!90870 () Bool)

(declare-fun res!224046 () Bool)

(declare-fun e!188655 () Bool)

(assert (=> d!90870 (=> res!224046 e!188655)))

(assert (=> d!90870 (= res!224046 (= #b00000000000000000000000000000000 (currentByte!12923 w1!591)))))

(assert (=> d!90870 (= (arrayRangesEq!1066 (buf!6999 w1!591) (buf!6999 w3!25) #b00000000000000000000000000000000 (currentByte!12923 w1!591)) e!188655)))

(declare-fun b!268660 () Bool)

(declare-fun e!188656 () Bool)

(assert (=> b!268660 (= e!188655 e!188656)))

(declare-fun res!224047 () Bool)

(assert (=> b!268660 (=> (not res!224047) (not e!188656))))

(assert (=> b!268660 (= res!224047 (= (select (arr!7518 (buf!6999 w1!591)) #b00000000000000000000000000000000) (select (arr!7518 (buf!6999 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!268661 () Bool)

(assert (=> b!268661 (= e!188656 (arrayRangesEq!1066 (buf!6999 w1!591) (buf!6999 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12923 w1!591)))))

(assert (= (and d!90870 (not res!224046)) b!268660))

(assert (= (and b!268660 res!224047) b!268661))

(declare-fun m!400187 () Bool)

(assert (=> b!268660 m!400187))

(declare-fun m!400189 () Bool)

(assert (=> b!268660 m!400189))

(declare-fun m!400191 () Bool)

(assert (=> b!268661 m!400191))

(assert (=> b!268610 d!90870))

(declare-fun d!90874 () Bool)

(assert (=> d!90874 (arrayRangesEq!1066 (buf!6999 w1!591) (buf!6999 w3!25) #b00000000000000000000000000000000 (currentByte!12923 w1!591))))

(declare-fun lt!408578 () Unit!19041)

(declare-fun choose!383 (array!14979 array!14979 array!14979 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19041)

(assert (=> d!90874 (= lt!408578 (choose!383 (buf!6999 w1!591) (buf!6999 w2!587) (buf!6999 w3!25) #b00000000000000000000000000000000 (currentByte!12923 w1!591) (currentByte!12923 w2!587)))))

(assert (=> d!90874 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12923 w1!591)) (bvsle (currentByte!12923 w1!591) (currentByte!12923 w2!587)))))

(assert (=> d!90874 (= (arrayRangesEqTransitive!341 (buf!6999 w1!591) (buf!6999 w2!587) (buf!6999 w3!25) #b00000000000000000000000000000000 (currentByte!12923 w1!591) (currentByte!12923 w2!587)) lt!408578)))

(declare-fun bs!23060 () Bool)

(assert (= bs!23060 d!90874))

(assert (=> bs!23060 m!400111))

(declare-fun m!400197 () Bool)

(assert (=> bs!23060 m!400197))

(assert (=> b!268610 d!90874))

(push 1)

(assert (not d!90860))

(assert (not b!268655))

(assert (not b!268646))

(assert (not b!268653))

(assert (not b!268644))

(assert (not b!268661))

(assert (not d!90874))

(assert (not d!90862))

(assert (not d!90858))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-datatypes ((tuple4!422 0))(
  ( (tuple4!423 (_1!12194 (_ BitVec 32)) (_2!12194 (_ BitVec 32)) (_3!991 (_ BitVec 32)) (_4!211 (_ BitVec 32))) )
))
(declare-fun lt!408636 () tuple4!422)

(declare-fun b!268742 () Bool)

(declare-fun lt!408637 () (_ BitVec 32))

(declare-fun e!188727 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268742 (= e!188727 (byteRangesEq!0 (select (arr!7518 (buf!6999 w2!587)) (_4!211 lt!408636)) (select (arr!7518 (buf!6999 w3!25)) (_4!211 lt!408636)) #b00000000000000000000000000000000 lt!408637))))

(declare-fun b!268743 () Bool)

(declare-fun res!224112 () Bool)

(assert (=> b!268743 (= res!224112 (= lt!408637 #b00000000000000000000000000000000))))

(assert (=> b!268743 (=> res!224112 e!188727)))

(declare-fun e!188726 () Bool)

(assert (=> b!268743 (= e!188726 e!188727)))

(declare-fun b!268744 () Bool)

(declare-fun e!188722 () Bool)

(assert (=> b!268744 (= e!188722 (arrayRangesEq!1066 (buf!6999 w2!587) (buf!6999 w3!25) (_1!12194 lt!408636) (_2!12194 lt!408636)))))

(declare-fun b!268745 () Bool)

(declare-fun e!188725 () Bool)

(declare-fun call!4257 () Bool)

(assert (=> b!268745 (= e!188725 call!4257)))

(declare-fun b!268746 () Bool)

(declare-fun e!188723 () Bool)

(declare-fun e!188724 () Bool)

(assert (=> b!268746 (= e!188723 e!188724)))

(declare-fun res!224110 () Bool)

(assert (=> b!268746 (=> (not res!224110) (not e!188724))))

(assert (=> b!268746 (= res!224110 e!188722)))

(declare-fun res!224113 () Bool)

(assert (=> b!268746 (=> res!224113 e!188722)))

(assert (=> b!268746 (= res!224113 (bvsge (_1!12194 lt!408636) (_2!12194 lt!408636)))))

(assert (=> b!268746 (= lt!408637 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6531 (buf!6999 w2!587)) (currentByte!12923 w2!587) (currentBit!12918 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408638 () (_ BitVec 32))

(assert (=> b!268746 (= lt!408638 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!422)

(assert (=> b!268746 (= lt!408636 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6531 (buf!6999 w2!587)) (currentByte!12923 w2!587) (currentBit!12918 w2!587))))))

(declare-fun b!268747 () Bool)

(assert (=> b!268747 (= e!188725 e!188726)))

(declare-fun res!224114 () Bool)

(assert (=> b!268747 (= res!224114 call!4257)))

(assert (=> b!268747 (=> (not res!224114) (not e!188726))))

(declare-fun c!12397 () Bool)

(declare-fun bm!4254 () Bool)

(assert (=> bm!4254 (= call!4257 (byteRangesEq!0 (select (arr!7518 (buf!6999 w2!587)) (_3!991 lt!408636)) (select (arr!7518 (buf!6999 w3!25)) (_3!991 lt!408636)) lt!408638 (ite c!12397 lt!408637 #b00000000000000000000000000001000)))))

(declare-fun d!90890 () Bool)

(declare-fun res!224111 () Bool)

(assert (=> d!90890 (=> res!224111 e!188723)))

(assert (=> d!90890 (= res!224111 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6531 (buf!6999 w2!587)) (currentByte!12923 w2!587) (currentBit!12918 w2!587))))))

(assert (=> d!90890 (= (arrayBitRangesEq!0 (buf!6999 w2!587) (buf!6999 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6531 (buf!6999 w2!587)) (currentByte!12923 w2!587) (currentBit!12918 w2!587))) e!188723)))

(declare-fun b!268748 () Bool)

(assert (=> b!268748 (= e!188724 e!188725)))

(assert (=> b!268748 (= c!12397 (= (_3!991 lt!408636) (_4!211 lt!408636)))))

(assert (= (and d!90890 (not res!224111)) b!268746))

(assert (= (and b!268746 (not res!224113)) b!268744))

(assert (= (and b!268746 res!224110) b!268748))

(assert (= (and b!268748 c!12397) b!268745))

(assert (= (and b!268748 (not c!12397)) b!268747))

(assert (= (and b!268747 res!224114) b!268743))

(assert (= (and b!268743 (not res!224112)) b!268742))

(assert (= (or b!268745 b!268747) bm!4254))

(declare-fun m!400265 () Bool)

(assert (=> b!268742 m!400265))

(declare-fun m!400267 () Bool)

(assert (=> b!268742 m!400267))

(assert (=> b!268742 m!400265))

(assert (=> b!268742 m!400267))

(declare-fun m!400269 () Bool)

(assert (=> b!268742 m!400269))

(declare-fun m!400271 () Bool)

(assert (=> b!268744 m!400271))

(assert (=> b!268746 m!400165))

(declare-fun m!400273 () Bool)

(assert (=> b!268746 m!400273))

(declare-fun m!400275 () Bool)

(assert (=> bm!4254 m!400275))

(declare-fun m!400277 () Bool)

(assert (=> bm!4254 m!400277))

(assert (=> bm!4254 m!400275))

(assert (=> bm!4254 m!400277))

(declare-fun m!400279 () Bool)

(assert (=> bm!4254 m!400279))

(assert (=> b!268655 d!90890))

(declare-fun d!90908 () Bool)

(declare-fun e!188740 () Bool)

(assert (=> d!90908 e!188740))

(declare-fun res!224132 () Bool)

(assert (=> d!90908 (=> (not res!224132) (not e!188740))))

(declare-fun lt!408679 () (_ BitVec 64))

(declare-fun lt!408682 () (_ BitVec 64))

(declare-fun lt!408683 () (_ BitVec 64))

(assert (=> d!90908 (= res!224132 (= lt!408683 (bvsub lt!408679 lt!408682)))))

(assert (=> d!90908 (or (= (bvand lt!408679 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408682 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408679 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408679 lt!408682) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!90908 (= lt!408682 (remainingBits!0 ((_ sign_extend 32) (size!6531 (buf!6999 w2!587))) ((_ sign_extend 32) (currentByte!12923 w2!587)) ((_ sign_extend 32) (currentBit!12918 w2!587))))))

(declare-fun lt!408680 () (_ BitVec 64))

(declare-fun lt!408678 () (_ BitVec 64))

(assert (=> d!90908 (= lt!408679 (bvmul lt!408680 lt!408678))))

(assert (=> d!90908 (or (= lt!408680 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408678 (bvsdiv (bvmul lt!408680 lt!408678) lt!408680)))))

(assert (=> d!90908 (= lt!408678 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90908 (= lt!408680 ((_ sign_extend 32) (size!6531 (buf!6999 w2!587))))))

(assert (=> d!90908 (= lt!408683 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12923 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12918 w2!587))))))

(assert (=> d!90908 (invariant!0 (currentBit!12918 w2!587) (currentByte!12923 w2!587) (size!6531 (buf!6999 w2!587)))))

(assert (=> d!90908 (= (bitIndex!0 (size!6531 (buf!6999 w2!587)) (currentByte!12923 w2!587) (currentBit!12918 w2!587)) lt!408683)))

(declare-fun b!268768 () Bool)

(declare-fun res!224133 () Bool)

(assert (=> b!268768 (=> (not res!224133) (not e!188740))))

(assert (=> b!268768 (= res!224133 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408683))))

(declare-fun b!268769 () Bool)

(declare-fun lt!408681 () (_ BitVec 64))

(assert (=> b!268769 (= e!188740 (bvsle lt!408683 (bvmul lt!408681 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268769 (or (= lt!408681 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408681 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408681)))))

(assert (=> b!268769 (= lt!408681 ((_ sign_extend 32) (size!6531 (buf!6999 w2!587))))))

(assert (= (and d!90908 res!224132) b!268768))

(assert (= (and b!268768 res!224133) b!268769))

(declare-fun m!400301 () Bool)

(assert (=> d!90908 m!400301))

(assert (=> d!90908 m!400171))

(assert (=> b!268655 d!90908))

(declare-fun d!90914 () Bool)

(declare-fun res!224134 () Bool)

(declare-fun e!188741 () Bool)

(assert (=> d!90914 (=> res!224134 e!188741)))

(assert (=> d!90914 (= res!224134 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12923 w1!591)))))

(assert (=> d!90914 (= (arrayRangesEq!1066 (buf!6999 w1!591) (buf!6999 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12923 w1!591)) e!188741)))

(declare-fun b!268770 () Bool)

(declare-fun e!188742 () Bool)

(assert (=> b!268770 (= e!188741 e!188742)))

(declare-fun res!224135 () Bool)

(assert (=> b!268770 (=> (not res!224135) (not e!188742))))

(assert (=> b!268770 (= res!224135 (= (select (arr!7518 (buf!6999 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7518 (buf!6999 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!268771 () Bool)

(assert (=> b!268771 (= e!188742 (arrayRangesEq!1066 (buf!6999 w1!591) (buf!6999 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12923 w1!591)))))

(assert (= (and d!90914 (not res!224134)) b!268770))

(assert (= (and b!268770 res!224135) b!268771))

(declare-fun m!400303 () Bool)

(assert (=> b!268770 m!400303))

(declare-fun m!400305 () Bool)

(assert (=> b!268770 m!400305))

(declare-fun m!400307 () Bool)

(assert (=> b!268771 m!400307))

(assert (=> b!268661 d!90914))

(declare-fun e!188748 () Bool)

(declare-fun lt!408685 () (_ BitVec 32))

(declare-fun lt!408684 () tuple4!422)

(declare-fun b!268772 () Bool)

(assert (=> b!268772 (= e!188748 (byteRangesEq!0 (select (arr!7518 (buf!6999 w1!591)) (_4!211 lt!408684)) (select (arr!7518 (buf!6999 w2!587)) (_4!211 lt!408684)) #b00000000000000000000000000000000 lt!408685))))

(declare-fun b!268773 () Bool)

(declare-fun res!224138 () Bool)

(assert (=> b!268773 (= res!224138 (= lt!408685 #b00000000000000000000000000000000))))

(assert (=> b!268773 (=> res!224138 e!188748)))

(declare-fun e!188747 () Bool)

(assert (=> b!268773 (= e!188747 e!188748)))

(declare-fun b!268774 () Bool)

(declare-fun e!188743 () Bool)

(assert (=> b!268774 (= e!188743 (arrayRangesEq!1066 (buf!6999 w1!591) (buf!6999 w2!587) (_1!12194 lt!408684) (_2!12194 lt!408684)))))

(declare-fun b!268775 () Bool)

(declare-fun e!188746 () Bool)

(declare-fun call!4259 () Bool)

(assert (=> b!268775 (= e!188746 call!4259)))

(declare-fun b!268776 () Bool)

(declare-fun e!188744 () Bool)

(declare-fun e!188745 () Bool)

(assert (=> b!268776 (= e!188744 e!188745)))

(declare-fun res!224136 () Bool)

(assert (=> b!268776 (=> (not res!224136) (not e!188745))))

(assert (=> b!268776 (= res!224136 e!188743)))

(declare-fun res!224139 () Bool)

(assert (=> b!268776 (=> res!224139 e!188743)))

(assert (=> b!268776 (= res!224139 (bvsge (_1!12194 lt!408684) (_2!12194 lt!408684)))))

(assert (=> b!268776 (= lt!408685 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6531 (buf!6999 w1!591)) (currentByte!12923 w1!591) (currentBit!12918 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408686 () (_ BitVec 32))

(assert (=> b!268776 (= lt!408686 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268776 (= lt!408684 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6531 (buf!6999 w1!591)) (currentByte!12923 w1!591) (currentBit!12918 w1!591))))))

(declare-fun b!268777 () Bool)

(assert (=> b!268777 (= e!188746 e!188747)))

(declare-fun res!224140 () Bool)

(assert (=> b!268777 (= res!224140 call!4259)))

(assert (=> b!268777 (=> (not res!224140) (not e!188747))))

(declare-fun bm!4256 () Bool)

(declare-fun c!12399 () Bool)

(assert (=> bm!4256 (= call!4259 (byteRangesEq!0 (select (arr!7518 (buf!6999 w1!591)) (_3!991 lt!408684)) (select (arr!7518 (buf!6999 w2!587)) (_3!991 lt!408684)) lt!408686 (ite c!12399 lt!408685 #b00000000000000000000000000001000)))))

(declare-fun d!90916 () Bool)

(declare-fun res!224137 () Bool)

(assert (=> d!90916 (=> res!224137 e!188744)))

(assert (=> d!90916 (= res!224137 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6531 (buf!6999 w1!591)) (currentByte!12923 w1!591) (currentBit!12918 w1!591))))))

(assert (=> d!90916 (= (arrayBitRangesEq!0 (buf!6999 w1!591) (buf!6999 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6531 (buf!6999 w1!591)) (currentByte!12923 w1!591) (currentBit!12918 w1!591))) e!188744)))

(declare-fun b!268778 () Bool)

(assert (=> b!268778 (= e!188745 e!188746)))

(assert (=> b!268778 (= c!12399 (= (_3!991 lt!408684) (_4!211 lt!408684)))))

(assert (= (and d!90916 (not res!224137)) b!268776))

(assert (= (and b!268776 (not res!224139)) b!268774))

(assert (= (and b!268776 res!224136) b!268778))

(assert (= (and b!268778 c!12399) b!268775))

(assert (= (and b!268778 (not c!12399)) b!268777))

(assert (= (and b!268777 res!224140) b!268773))

(assert (= (and b!268773 (not res!224138)) b!268772))

(assert (= (or b!268775 b!268777) bm!4256))

(declare-fun m!400309 () Bool)

(assert (=> b!268772 m!400309))

(declare-fun m!400311 () Bool)

(assert (=> b!268772 m!400311))

(assert (=> b!268772 m!400309))

(assert (=> b!268772 m!400311))

(declare-fun m!400313 () Bool)

(assert (=> b!268772 m!400313))

(declare-fun m!400315 () Bool)

(assert (=> b!268774 m!400315))

(assert (=> b!268776 m!400163))

(declare-fun m!400317 () Bool)

(assert (=> b!268776 m!400317))

(declare-fun m!400319 () Bool)

(assert (=> bm!4256 m!400319))

(declare-fun m!400321 () Bool)

(assert (=> bm!4256 m!400321))

(assert (=> bm!4256 m!400319))

(assert (=> bm!4256 m!400321))

(declare-fun m!400323 () Bool)

(assert (=> bm!4256 m!400323))

(assert (=> b!268646 d!90916))

(declare-fun d!90922 () Bool)

(declare-fun e!188749 () Bool)

(assert (=> d!90922 e!188749))

(declare-fun res!224141 () Bool)

(assert (=> d!90922 (=> (not res!224141) (not e!188749))))

(declare-fun lt!408691 () (_ BitVec 64))

(declare-fun lt!408692 () (_ BitVec 64))

(declare-fun lt!408688 () (_ BitVec 64))

(assert (=> d!90922 (= res!224141 (= lt!408692 (bvsub lt!408688 lt!408691)))))

(assert (=> d!90922 (or (= (bvand lt!408688 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408691 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408688 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408688 lt!408691) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90922 (= lt!408691 (remainingBits!0 ((_ sign_extend 32) (size!6531 (buf!6999 w1!591))) ((_ sign_extend 32) (currentByte!12923 w1!591)) ((_ sign_extend 32) (currentBit!12918 w1!591))))))

(declare-fun lt!408689 () (_ BitVec 64))

(declare-fun lt!408687 () (_ BitVec 64))

(assert (=> d!90922 (= lt!408688 (bvmul lt!408689 lt!408687))))

(assert (=> d!90922 (or (= lt!408689 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408687 (bvsdiv (bvmul lt!408689 lt!408687) lt!408689)))))

(assert (=> d!90922 (= lt!408687 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90922 (= lt!408689 ((_ sign_extend 32) (size!6531 (buf!6999 w1!591))))))

(assert (=> d!90922 (= lt!408692 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12923 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12918 w1!591))))))

(assert (=> d!90922 (invariant!0 (currentBit!12918 w1!591) (currentByte!12923 w1!591) (size!6531 (buf!6999 w1!591)))))

(assert (=> d!90922 (= (bitIndex!0 (size!6531 (buf!6999 w1!591)) (currentByte!12923 w1!591) (currentBit!12918 w1!591)) lt!408692)))

(declare-fun b!268779 () Bool)

(declare-fun res!224142 () Bool)

(assert (=> b!268779 (=> (not res!224142) (not e!188749))))

(assert (=> b!268779 (= res!224142 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408692))))

(declare-fun b!268780 () Bool)

(declare-fun lt!408690 () (_ BitVec 64))

(assert (=> b!268780 (= e!188749 (bvsle lt!408692 (bvmul lt!408690 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268780 (or (= lt!408690 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408690 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408690)))))

(assert (=> b!268780 (= lt!408690 ((_ sign_extend 32) (size!6531 (buf!6999 w1!591))))))

(assert (= (and d!90922 res!224141) b!268779))

(assert (= (and b!268779 res!224142) b!268780))

(declare-fun m!400325 () Bool)

(assert (=> d!90922 m!400325))

(assert (=> d!90922 m!400169))

(assert (=> b!268646 d!90922))

(assert (=> b!268653 d!90908))

(declare-fun d!90924 () Bool)

(declare-fun e!188750 () Bool)

(assert (=> d!90924 e!188750))

(declare-fun res!224143 () Bool)

(assert (=> d!90924 (=> (not res!224143) (not e!188750))))

(declare-fun lt!408697 () (_ BitVec 64))

(declare-fun lt!408694 () (_ BitVec 64))

(declare-fun lt!408698 () (_ BitVec 64))

(assert (=> d!90924 (= res!224143 (= lt!408698 (bvsub lt!408694 lt!408697)))))

(assert (=> d!90924 (or (= (bvand lt!408694 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408697 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408694 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408694 lt!408697) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90924 (= lt!408697 (remainingBits!0 ((_ sign_extend 32) (size!6531 (buf!6999 w3!25))) ((_ sign_extend 32) (currentByte!12923 w3!25)) ((_ sign_extend 32) (currentBit!12918 w3!25))))))

(declare-fun lt!408695 () (_ BitVec 64))

(declare-fun lt!408693 () (_ BitVec 64))

(assert (=> d!90924 (= lt!408694 (bvmul lt!408695 lt!408693))))

(assert (=> d!90924 (or (= lt!408695 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408693 (bvsdiv (bvmul lt!408695 lt!408693) lt!408695)))))

(assert (=> d!90924 (= lt!408693 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90924 (= lt!408695 ((_ sign_extend 32) (size!6531 (buf!6999 w3!25))))))

(assert (=> d!90924 (= lt!408698 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12923 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12918 w3!25))))))

(assert (=> d!90924 (invariant!0 (currentBit!12918 w3!25) (currentByte!12923 w3!25) (size!6531 (buf!6999 w3!25)))))

(assert (=> d!90924 (= (bitIndex!0 (size!6531 (buf!6999 w3!25)) (currentByte!12923 w3!25) (currentBit!12918 w3!25)) lt!408698)))

(declare-fun b!268781 () Bool)

(declare-fun res!224144 () Bool)

(assert (=> b!268781 (=> (not res!224144) (not e!188750))))

(assert (=> b!268781 (= res!224144 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408698))))

(declare-fun b!268782 () Bool)

(declare-fun lt!408696 () (_ BitVec 64))

(assert (=> b!268782 (= e!188750 (bvsle lt!408698 (bvmul lt!408696 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268782 (or (= lt!408696 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408696 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408696)))))

(assert (=> b!268782 (= lt!408696 ((_ sign_extend 32) (size!6531 (buf!6999 w3!25))))))

(assert (= (and d!90924 res!224143) b!268781))

(assert (= (and b!268781 res!224144) b!268782))

(declare-fun m!400327 () Bool)

(assert (=> d!90924 m!400327))

(assert (=> d!90924 m!400173))

(assert (=> b!268653 d!90924))

(declare-fun d!90926 () Bool)

(assert (=> d!90926 (= (invariant!0 (currentBit!12918 w1!591) (currentByte!12923 w1!591) (size!6531 (buf!6999 w1!591))) (and (bvsge (currentBit!12918 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12918 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12923 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12923 w1!591) (size!6531 (buf!6999 w1!591))) (and (= (currentBit!12918 w1!591) #b00000000000000000000000000000000) (= (currentByte!12923 w1!591) (size!6531 (buf!6999 w1!591)))))))))

(assert (=> d!90858 d!90926))

(assert (=> b!268644 d!90922))

(assert (=> b!268644 d!90908))

(declare-fun d!90932 () Bool)

(assert (=> d!90932 (= (invariant!0 (currentBit!12918 w3!25) (currentByte!12923 w3!25) (size!6531 (buf!6999 w3!25))) (and (bvsge (currentBit!12918 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12918 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12923 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12923 w3!25) (size!6531 (buf!6999 w3!25))) (and (= (currentBit!12918 w3!25) #b00000000000000000000000000000000) (= (currentByte!12923 w3!25) (size!6531 (buf!6999 w3!25)))))))))

(assert (=> d!90862 d!90932))

(declare-fun d!90934 () Bool)

(assert (=> d!90934 (= (invariant!0 (currentBit!12918 w2!587) (currentByte!12923 w2!587) (size!6531 (buf!6999 w2!587))) (and (bvsge (currentBit!12918 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12918 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12923 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12923 w2!587) (size!6531 (buf!6999 w2!587))) (and (= (currentBit!12918 w2!587) #b00000000000000000000000000000000) (= (currentByte!12923 w2!587) (size!6531 (buf!6999 w2!587)))))))))

(assert (=> d!90860 d!90934))

(assert (=> d!90874 d!90870))

(declare-fun d!90936 () Bool)

(assert (=> d!90936 (arrayRangesEq!1066 (buf!6999 w1!591) (buf!6999 w3!25) #b00000000000000000000000000000000 (currentByte!12923 w1!591))))

(assert (=> d!90936 true))

(declare-fun _$16!122 () Unit!19041)

(assert (=> d!90936 (= (choose!383 (buf!6999 w1!591) (buf!6999 w2!587) (buf!6999 w3!25) #b00000000000000000000000000000000 (currentByte!12923 w1!591) (currentByte!12923 w2!587)) _$16!122)))

(declare-fun bs!23063 () Bool)

(assert (= bs!23063 d!90936))

(assert (=> bs!23063 m!400111))

(assert (=> d!90874 d!90936))

(push 1)

(assert (not bm!4256))

(assert (not d!90924))

(assert (not b!268744))

(assert (not d!90922))

(assert (not b!268742))

(assert (not d!90908))

(assert (not b!268774))

(assert (not d!90936))

(assert (not b!268771))

(assert (not bm!4254))

(assert (not b!268776))

(assert (not b!268772))

(assert (not b!268746))

(check-sat)

(pop 1)

(push 1)

(check-sat)

