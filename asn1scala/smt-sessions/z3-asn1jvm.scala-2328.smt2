; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59452 () Bool)

(assert start!59452)

(declare-fun b!271826 () Bool)

(declare-fun e!191681 () Bool)

(declare-fun e!191683 () Bool)

(assert (=> b!271826 (= e!191681 e!191683)))

(declare-fun res!226442 () Bool)

(assert (=> b!271826 (=> res!226442 e!191683)))

(declare-datatypes ((array!15154 0))(
  ( (array!15155 (arr!7577 (Array (_ BitVec 32) (_ BitVec 8))) (size!6590 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11994 0))(
  ( (BitStream!11995 (buf!7058 array!15154) (currentByte!13050 (_ BitVec 32)) (currentBit!13045 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11994)

(declare-fun w2!587 () BitStream!11994)

(assert (=> b!271826 (= res!226442 (or (bvsge (currentByte!13050 w1!591) (size!6590 (buf!7058 w1!591))) (bvslt (currentByte!13050 w1!591) (currentByte!13050 w2!587))))))

(declare-fun b!271827 () Bool)

(declare-fun e!191673 () Bool)

(declare-fun array_inv!6314 (array!15154) Bool)

(assert (=> b!271827 (= e!191673 (array_inv!6314 (buf!7058 w2!587)))))

(declare-fun b!271828 () Bool)

(declare-fun res!226444 () Bool)

(declare-fun e!191674 () Bool)

(assert (=> b!271828 (=> (not res!226444) (not e!191674))))

(declare-fun w3!25 () BitStream!11994)

(declare-fun isPrefixOf!0 (BitStream!11994 BitStream!11994) Bool)

(assert (=> b!271828 (= res!226444 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!271829 () Bool)

(declare-datatypes ((Unit!19137 0))(
  ( (Unit!19138) )
))
(declare-fun e!191678 () Unit!19137)

(declare-fun Unit!19139 () Unit!19137)

(assert (=> b!271829 (= e!191678 Unit!19139)))

(declare-fun b!271830 () Bool)

(declare-fun Unit!19140 () Unit!19137)

(assert (=> b!271830 (= e!191678 Unit!19140)))

(declare-fun lt!410078 () Unit!19137)

(declare-fun arrayRangesEqImpliesEq!173 (array!15154 array!15154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19137)

(assert (=> b!271830 (= lt!410078 (arrayRangesEqImpliesEq!173 (buf!7058 w2!587) (buf!7058 w3!25) #b00000000000000000000000000000000 (currentByte!13050 w1!591) (currentByte!13050 w2!587)))))

(declare-fun res!226443 () Bool)

(assert (=> b!271830 (= res!226443 (= (select (arr!7577 (buf!7058 w2!587)) (currentByte!13050 w1!591)) (select (arr!7577 (buf!7058 w3!25)) (currentByte!13050 w1!591))))))

(declare-fun e!191676 () Bool)

(assert (=> b!271830 (=> (not res!226443) (not e!191676))))

(assert (=> b!271830 e!191676))

(declare-fun b!271831 () Bool)

(declare-fun e!191679 () Bool)

(assert (=> b!271831 (= e!191679 (array_inv!6314 (buf!7058 w1!591)))))

(declare-fun b!271832 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271832 (= e!191676 (byteRangesEq!0 (select (arr!7577 (buf!7058 w1!591)) (currentByte!13050 w1!591)) (select (arr!7577 (buf!7058 w3!25)) (currentByte!13050 w1!591)) #b00000000000000000000000000000000 (currentBit!13045 w1!591)))))

(declare-fun b!271833 () Bool)

(declare-fun e!191680 () Bool)

(assert (=> b!271833 (= e!191680 (array_inv!6314 (buf!7058 w3!25)))))

(declare-fun res!226440 () Bool)

(assert (=> start!59452 (=> (not res!226440) (not e!191674))))

(assert (=> start!59452 (= res!226440 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59452 e!191674))

(declare-fun inv!12 (BitStream!11994) Bool)

(assert (=> start!59452 (and (inv!12 w1!591) e!191679)))

(assert (=> start!59452 (and (inv!12 w2!587) e!191673)))

(assert (=> start!59452 (and (inv!12 w3!25) e!191680)))

(declare-fun b!271834 () Bool)

(assert (=> b!271834 (= e!191674 (not (or (bvsge (currentByte!13050 w1!591) (size!6590 (buf!7058 w1!591))) (bvsge (currentByte!13050 w1!591) #b00000000000000000000000000000000))))))

(declare-fun lt!410077 () Unit!19137)

(assert (=> b!271834 (= lt!410077 e!191678)))

(declare-fun c!12510 () Bool)

(assert (=> b!271834 (= c!12510 (and (bvslt (currentByte!13050 w1!591) (size!6590 (buf!7058 w1!591))) (bvslt (currentByte!13050 w1!591) (currentByte!13050 w2!587))))))

(assert (=> b!271834 e!191681))

(declare-fun res!226441 () Bool)

(assert (=> b!271834 (=> (not res!226441) (not e!191681))))

(declare-fun arrayRangesEq!1122 (array!15154 array!15154 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271834 (= res!226441 (arrayRangesEq!1122 (buf!7058 w1!591) (buf!7058 w3!25) #b00000000000000000000000000000000 (currentByte!13050 w1!591)))))

(declare-fun lt!410076 () Unit!19137)

(declare-fun arrayRangesEqTransitive!385 (array!15154 array!15154 array!15154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19137)

(assert (=> b!271834 (= lt!410076 (arrayRangesEqTransitive!385 (buf!7058 w1!591) (buf!7058 w2!587) (buf!7058 w3!25) #b00000000000000000000000000000000 (currentByte!13050 w1!591) (currentByte!13050 w2!587)))))

(declare-fun b!271835 () Bool)

(assert (=> b!271835 (= e!191683 (byteRangesEq!0 (select (arr!7577 (buf!7058 w1!591)) (currentByte!13050 w1!591)) (select (arr!7577 (buf!7058 w3!25)) (currentByte!13050 w1!591)) #b00000000000000000000000000000000 (currentBit!13045 w1!591)))))

(assert (= (and start!59452 res!226440) b!271828))

(assert (= (and b!271828 res!226444) b!271834))

(assert (= (and b!271834 res!226441) b!271826))

(assert (= (and b!271826 (not res!226442)) b!271835))

(assert (= (and b!271834 c!12510) b!271830))

(assert (= (and b!271834 (not c!12510)) b!271829))

(assert (= (and b!271830 res!226443) b!271832))

(assert (= start!59452 b!271831))

(assert (= start!59452 b!271827))

(assert (= start!59452 b!271833))

(declare-fun m!404397 () Bool)

(assert (=> start!59452 m!404397))

(declare-fun m!404399 () Bool)

(assert (=> start!59452 m!404399))

(declare-fun m!404401 () Bool)

(assert (=> start!59452 m!404401))

(declare-fun m!404403 () Bool)

(assert (=> start!59452 m!404403))

(declare-fun m!404405 () Bool)

(assert (=> b!271831 m!404405))

(declare-fun m!404407 () Bool)

(assert (=> b!271832 m!404407))

(declare-fun m!404409 () Bool)

(assert (=> b!271832 m!404409))

(assert (=> b!271832 m!404407))

(assert (=> b!271832 m!404409))

(declare-fun m!404411 () Bool)

(assert (=> b!271832 m!404411))

(declare-fun m!404413 () Bool)

(assert (=> b!271834 m!404413))

(declare-fun m!404415 () Bool)

(assert (=> b!271834 m!404415))

(declare-fun m!404417 () Bool)

(assert (=> b!271827 m!404417))

(assert (=> b!271835 m!404407))

(assert (=> b!271835 m!404409))

(assert (=> b!271835 m!404407))

(assert (=> b!271835 m!404409))

(assert (=> b!271835 m!404411))

(declare-fun m!404419 () Bool)

(assert (=> b!271830 m!404419))

(declare-fun m!404421 () Bool)

(assert (=> b!271830 m!404421))

(assert (=> b!271830 m!404409))

(declare-fun m!404423 () Bool)

(assert (=> b!271833 m!404423))

(declare-fun m!404425 () Bool)

(assert (=> b!271828 m!404425))

(check-sat (not b!271831) (not b!271830) (not b!271827) (not b!271833) (not b!271832) (not b!271828) (not start!59452) (not b!271835) (not b!271834))
(check-sat)
(get-model)

(declare-fun d!92860 () Bool)

(assert (=> d!92860 (= (array_inv!6314 (buf!7058 w2!587)) (bvsge (size!6590 (buf!7058 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!271827 d!92860))

(declare-fun d!92862 () Bool)

(assert (=> d!92862 (= (byteRangesEq!0 (select (arr!7577 (buf!7058 w1!591)) (currentByte!13050 w1!591)) (select (arr!7577 (buf!7058 w3!25)) (currentByte!13050 w1!591)) #b00000000000000000000000000000000 (currentBit!13045 w1!591)) (or (= #b00000000000000000000000000000000 (currentBit!13045 w1!591)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7577 (buf!7058 w1!591)) (currentByte!13050 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13045 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7577 (buf!7058 w3!25)) (currentByte!13050 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13045 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23413 () Bool)

(assert (= bs!23413 d!92862))

(declare-fun m!404457 () Bool)

(assert (=> bs!23413 m!404457))

(declare-fun m!404459 () Bool)

(assert (=> bs!23413 m!404459))

(assert (=> b!271832 d!92862))

(declare-fun d!92864 () Bool)

(assert (=> d!92864 (= (array_inv!6314 (buf!7058 w3!25)) (bvsge (size!6590 (buf!7058 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!271833 d!92864))

(declare-fun d!92866 () Bool)

(declare-fun res!226467 () Bool)

(declare-fun e!191721 () Bool)

(assert (=> d!92866 (=> (not res!226467) (not e!191721))))

(assert (=> d!92866 (= res!226467 (= (size!6590 (buf!7058 w2!587)) (size!6590 (buf!7058 w3!25))))))

(assert (=> d!92866 (= (isPrefixOf!0 w2!587 w3!25) e!191721)))

(declare-fun b!271872 () Bool)

(declare-fun res!226466 () Bool)

(assert (=> b!271872 (=> (not res!226466) (not e!191721))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!271872 (= res!226466 (bvsle (bitIndex!0 (size!6590 (buf!7058 w2!587)) (currentByte!13050 w2!587) (currentBit!13045 w2!587)) (bitIndex!0 (size!6590 (buf!7058 w3!25)) (currentByte!13050 w3!25) (currentBit!13045 w3!25))))))

(declare-fun b!271873 () Bool)

(declare-fun e!191722 () Bool)

(assert (=> b!271873 (= e!191721 e!191722)))

(declare-fun res!226468 () Bool)

(assert (=> b!271873 (=> res!226468 e!191722)))

(assert (=> b!271873 (= res!226468 (= (size!6590 (buf!7058 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!271874 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15154 array!15154 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!271874 (= e!191722 (arrayBitRangesEq!0 (buf!7058 w2!587) (buf!7058 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6590 (buf!7058 w2!587)) (currentByte!13050 w2!587) (currentBit!13045 w2!587))))))

(assert (= (and d!92866 res!226467) b!271872))

(assert (= (and b!271872 res!226466) b!271873))

(assert (= (and b!271873 (not res!226468)) b!271874))

(declare-fun m!404461 () Bool)

(assert (=> b!271872 m!404461))

(declare-fun m!404463 () Bool)

(assert (=> b!271872 m!404463))

(assert (=> b!271874 m!404461))

(assert (=> b!271874 m!404461))

(declare-fun m!404465 () Bool)

(assert (=> b!271874 m!404465))

(assert (=> b!271828 d!92866))

(declare-fun d!92870 () Bool)

(declare-fun res!226473 () Bool)

(declare-fun e!191727 () Bool)

(assert (=> d!92870 (=> res!226473 e!191727)))

(assert (=> d!92870 (= res!226473 (= #b00000000000000000000000000000000 (currentByte!13050 w1!591)))))

(assert (=> d!92870 (= (arrayRangesEq!1122 (buf!7058 w1!591) (buf!7058 w3!25) #b00000000000000000000000000000000 (currentByte!13050 w1!591)) e!191727)))

(declare-fun b!271879 () Bool)

(declare-fun e!191728 () Bool)

(assert (=> b!271879 (= e!191727 e!191728)))

(declare-fun res!226474 () Bool)

(assert (=> b!271879 (=> (not res!226474) (not e!191728))))

(assert (=> b!271879 (= res!226474 (= (select (arr!7577 (buf!7058 w1!591)) #b00000000000000000000000000000000) (select (arr!7577 (buf!7058 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!271880 () Bool)

(assert (=> b!271880 (= e!191728 (arrayRangesEq!1122 (buf!7058 w1!591) (buf!7058 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13050 w1!591)))))

(assert (= (and d!92870 (not res!226473)) b!271879))

(assert (= (and b!271879 res!226474) b!271880))

(declare-fun m!404467 () Bool)

(assert (=> b!271879 m!404467))

(declare-fun m!404469 () Bool)

(assert (=> b!271879 m!404469))

(declare-fun m!404471 () Bool)

(assert (=> b!271880 m!404471))

(assert (=> b!271834 d!92870))

(declare-fun d!92874 () Bool)

(assert (=> d!92874 (arrayRangesEq!1122 (buf!7058 w1!591) (buf!7058 w3!25) #b00000000000000000000000000000000 (currentByte!13050 w1!591))))

(declare-fun lt!410090 () Unit!19137)

(declare-fun choose!432 (array!15154 array!15154 array!15154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19137)

(assert (=> d!92874 (= lt!410090 (choose!432 (buf!7058 w1!591) (buf!7058 w2!587) (buf!7058 w3!25) #b00000000000000000000000000000000 (currentByte!13050 w1!591) (currentByte!13050 w2!587)))))

(assert (=> d!92874 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13050 w1!591)) (bvsle (currentByte!13050 w1!591) (currentByte!13050 w2!587)))))

(assert (=> d!92874 (= (arrayRangesEqTransitive!385 (buf!7058 w1!591) (buf!7058 w2!587) (buf!7058 w3!25) #b00000000000000000000000000000000 (currentByte!13050 w1!591) (currentByte!13050 w2!587)) lt!410090)))

(declare-fun bs!23414 () Bool)

(assert (= bs!23414 d!92874))

(assert (=> bs!23414 m!404413))

(declare-fun m!404473 () Bool)

(assert (=> bs!23414 m!404473))

(assert (=> b!271834 d!92874))

(assert (=> b!271835 d!92862))

(declare-fun d!92876 () Bool)

(declare-fun res!226482 () Bool)

(declare-fun e!191733 () Bool)

(assert (=> d!92876 (=> (not res!226482) (not e!191733))))

(assert (=> d!92876 (= res!226482 (= (size!6590 (buf!7058 w1!591)) (size!6590 (buf!7058 w2!587))))))

(assert (=> d!92876 (= (isPrefixOf!0 w1!591 w2!587) e!191733)))

(declare-fun b!271887 () Bool)

(declare-fun res!226481 () Bool)

(assert (=> b!271887 (=> (not res!226481) (not e!191733))))

(assert (=> b!271887 (= res!226481 (bvsle (bitIndex!0 (size!6590 (buf!7058 w1!591)) (currentByte!13050 w1!591) (currentBit!13045 w1!591)) (bitIndex!0 (size!6590 (buf!7058 w2!587)) (currentByte!13050 w2!587) (currentBit!13045 w2!587))))))

(declare-fun b!271888 () Bool)

(declare-fun e!191734 () Bool)

(assert (=> b!271888 (= e!191733 e!191734)))

(declare-fun res!226483 () Bool)

(assert (=> b!271888 (=> res!226483 e!191734)))

(assert (=> b!271888 (= res!226483 (= (size!6590 (buf!7058 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!271889 () Bool)

(assert (=> b!271889 (= e!191734 (arrayBitRangesEq!0 (buf!7058 w1!591) (buf!7058 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6590 (buf!7058 w1!591)) (currentByte!13050 w1!591) (currentBit!13045 w1!591))))))

(assert (= (and d!92876 res!226482) b!271887))

(assert (= (and b!271887 res!226481) b!271888))

(assert (= (and b!271888 (not res!226483)) b!271889))

(declare-fun m!404475 () Bool)

(assert (=> b!271887 m!404475))

(assert (=> b!271887 m!404461))

(assert (=> b!271889 m!404475))

(assert (=> b!271889 m!404475))

(declare-fun m!404481 () Bool)

(assert (=> b!271889 m!404481))

(assert (=> start!59452 d!92876))

(declare-fun d!92878 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92878 (= (inv!12 w1!591) (invariant!0 (currentBit!13045 w1!591) (currentByte!13050 w1!591) (size!6590 (buf!7058 w1!591))))))

(declare-fun bs!23415 () Bool)

(assert (= bs!23415 d!92878))

(declare-fun m!404485 () Bool)

(assert (=> bs!23415 m!404485))

(assert (=> start!59452 d!92878))

(declare-fun d!92882 () Bool)

(assert (=> d!92882 (= (inv!12 w2!587) (invariant!0 (currentBit!13045 w2!587) (currentByte!13050 w2!587) (size!6590 (buf!7058 w2!587))))))

(declare-fun bs!23416 () Bool)

(assert (= bs!23416 d!92882))

(declare-fun m!404487 () Bool)

(assert (=> bs!23416 m!404487))

(assert (=> start!59452 d!92882))

(declare-fun d!92884 () Bool)

(assert (=> d!92884 (= (inv!12 w3!25) (invariant!0 (currentBit!13045 w3!25) (currentByte!13050 w3!25) (size!6590 (buf!7058 w3!25))))))

(declare-fun bs!23417 () Bool)

(assert (= bs!23417 d!92884))

(declare-fun m!404489 () Bool)

(assert (=> bs!23417 m!404489))

(assert (=> start!59452 d!92884))

(declare-fun d!92886 () Bool)

(assert (=> d!92886 (and (bvsge (currentByte!13050 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13050 w1!591) (size!6590 (buf!7058 w2!587))) (bvslt (currentByte!13050 w1!591) (size!6590 (buf!7058 w3!25))) (= (select (arr!7577 (buf!7058 w2!587)) (currentByte!13050 w1!591)) (select (arr!7577 (buf!7058 w3!25)) (currentByte!13050 w1!591))))))

(declare-fun lt!410095 () Unit!19137)

(declare-fun choose!433 (array!15154 array!15154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19137)

(assert (=> d!92886 (= lt!410095 (choose!433 (buf!7058 w2!587) (buf!7058 w3!25) #b00000000000000000000000000000000 (currentByte!13050 w1!591) (currentByte!13050 w2!587)))))

(assert (=> d!92886 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13050 w2!587)))))

(assert (=> d!92886 (= (arrayRangesEqImpliesEq!173 (buf!7058 w2!587) (buf!7058 w3!25) #b00000000000000000000000000000000 (currentByte!13050 w1!591) (currentByte!13050 w2!587)) lt!410095)))

(declare-fun bs!23419 () Bool)

(assert (= bs!23419 d!92886))

(assert (=> bs!23419 m!404421))

(assert (=> bs!23419 m!404409))

(declare-fun m!404495 () Bool)

(assert (=> bs!23419 m!404495))

(assert (=> b!271830 d!92886))

(declare-fun d!92890 () Bool)

(assert (=> d!92890 (= (array_inv!6314 (buf!7058 w1!591)) (bvsge (size!6590 (buf!7058 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!271831 d!92890))

(check-sat (not b!271874) (not d!92886) (not b!271889) (not b!271887) (not b!271880) (not d!92878) (not d!92884) (not d!92874) (not b!271872) (not d!92882))
(check-sat)
