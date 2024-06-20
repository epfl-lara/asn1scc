; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59816 () Bool)

(assert start!59816)

(declare-fun res!227266 () Bool)

(declare-fun e!192910 () Bool)

(assert (=> start!59816 (=> (not res!227266) (not e!192910))))

(declare-datatypes ((array!15278 0))(
  ( (array!15279 (arr!7630 (Array (_ BitVec 32) (_ BitVec 8))) (size!6643 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12100 0))(
  ( (BitStream!12101 (buf!7111 array!15278) (currentByte!13121 (_ BitVec 32)) (currentBit!13116 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12100)

(assert (=> start!59816 (= res!227266 (not (= (size!6643 (buf!7111 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59816 e!192910))

(declare-fun e!192911 () Bool)

(declare-fun inv!12 (BitStream!12100) Bool)

(assert (=> start!59816 (and (inv!12 bs!71) e!192911)))

(declare-fun b!273018 () Bool)

(declare-fun e!192912 () Bool)

(assert (=> b!273018 (= e!192910 (not e!192912))))

(declare-fun res!227265 () Bool)

(assert (=> b!273018 (=> res!227265 e!192912)))

(declare-fun lt!410907 () (_ BitVec 64))

(declare-fun lt!410906 () (_ BitVec 64))

(assert (=> b!273018 (= res!227265 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!410907) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!410906) (bvsgt lt!410906 lt!410907)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273018 (= lt!410906 (bitIndex!0 (size!6643 (buf!7111 bs!71)) (currentByte!13121 bs!71) (currentBit!13116 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15278 array!15278 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!273018 (arrayBitRangesEq!0 (buf!7111 bs!71) (buf!7111 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410907)))

(assert (=> b!273018 (= lt!410907 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6643 (buf!7111 bs!71)))))))

(declare-datatypes ((Unit!19265 0))(
  ( (Unit!19266) )
))
(declare-fun lt!410908 () Unit!19265)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15278) Unit!19265)

(assert (=> b!273018 (= lt!410908 (arrayBitEqImpliesRangesEqLemma!0 (buf!7111 bs!71)))))

(declare-fun b!273019 () Bool)

(declare-fun isPrefixOf!0 (BitStream!12100 BitStream!12100) Bool)

(assert (=> b!273019 (= e!192912 (isPrefixOf!0 bs!71 bs!71))))

(assert (=> b!273019 (arrayBitRangesEq!0 (buf!7111 bs!71) (buf!7111 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410906)))

(declare-fun lt!410909 () Unit!19265)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!15278 array!15278 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19265)

(assert (=> b!273019 (= lt!410909 (arrayBitRangesEqSlicedLemma!0 (buf!7111 bs!71) (buf!7111 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410907 #b0000000000000000000000000000000000000000000000000000000000000000 lt!410906))))

(declare-fun b!273020 () Bool)

(declare-fun array_inv!6367 (array!15278) Bool)

(assert (=> b!273020 (= e!192911 (array_inv!6367 (buf!7111 bs!71)))))

(assert (= (and start!59816 res!227266) b!273018))

(assert (= (and b!273018 (not res!227265)) b!273019))

(assert (= start!59816 b!273020))

(declare-fun m!405903 () Bool)

(assert (=> start!59816 m!405903))

(declare-fun m!405905 () Bool)

(assert (=> b!273018 m!405905))

(declare-fun m!405907 () Bool)

(assert (=> b!273018 m!405907))

(declare-fun m!405909 () Bool)

(assert (=> b!273018 m!405909))

(declare-fun m!405911 () Bool)

(assert (=> b!273019 m!405911))

(declare-fun m!405913 () Bool)

(assert (=> b!273019 m!405913))

(declare-fun m!405915 () Bool)

(assert (=> b!273019 m!405915))

(declare-fun m!405917 () Bool)

(assert (=> b!273020 m!405917))

(push 1)

(assert (not b!273019))

(assert (not start!59816))

(assert (not b!273018))

(assert (not b!273020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93372 () Bool)

(declare-fun res!227304 () Bool)

(declare-fun e!192955 () Bool)

(assert (=> d!93372 (=> (not res!227304) (not e!192955))))

(assert (=> d!93372 (= res!227304 (= (size!6643 (buf!7111 bs!71)) (size!6643 (buf!7111 bs!71))))))

(assert (=> d!93372 (= (isPrefixOf!0 bs!71 bs!71) e!192955)))

(declare-fun b!273063 () Bool)

(declare-fun res!227305 () Bool)

(assert (=> b!273063 (=> (not res!227305) (not e!192955))))

(assert (=> b!273063 (= res!227305 (bvsle (bitIndex!0 (size!6643 (buf!7111 bs!71)) (currentByte!13121 bs!71) (currentBit!13116 bs!71)) (bitIndex!0 (size!6643 (buf!7111 bs!71)) (currentByte!13121 bs!71) (currentBit!13116 bs!71))))))

(declare-fun b!273064 () Bool)

(declare-fun e!192954 () Bool)

(assert (=> b!273064 (= e!192955 e!192954)))

(declare-fun res!227303 () Bool)

(assert (=> b!273064 (=> res!227303 e!192954)))

(assert (=> b!273064 (= res!227303 (= (size!6643 (buf!7111 bs!71)) #b00000000000000000000000000000000))))

(declare-fun b!273065 () Bool)

(assert (=> b!273065 (= e!192954 (arrayBitRangesEq!0 (buf!7111 bs!71) (buf!7111 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6643 (buf!7111 bs!71)) (currentByte!13121 bs!71) (currentBit!13116 bs!71))))))

(assert (= (and d!93372 res!227304) b!273063))

(assert (= (and b!273063 res!227305) b!273064))

(assert (= (and b!273064 (not res!227303)) b!273065))

(assert (=> b!273063 m!405905))

(assert (=> b!273063 m!405905))

(assert (=> b!273065 m!405905))

(assert (=> b!273065 m!405905))

(declare-fun m!405955 () Bool)

(assert (=> b!273065 m!405955))

(assert (=> b!273019 d!93372))

(declare-fun lt!410962 () (_ BitVec 32))

(declare-fun b!273122 () Bool)

(declare-fun e!193004 () Bool)

(declare-datatypes ((tuple4!502 0))(
  ( (tuple4!503 (_1!12234 (_ BitVec 32)) (_2!12234 (_ BitVec 32)) (_3!1031 (_ BitVec 32)) (_4!251 (_ BitVec 32))) )
))
(declare-fun lt!410963 () tuple4!502)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273122 (= e!193004 (byteRangesEq!0 (select (arr!7630 (buf!7111 bs!71)) (_4!251 lt!410963)) (select (arr!7630 (buf!7111 bs!71)) (_4!251 lt!410963)) #b00000000000000000000000000000000 lt!410962))))

(declare-fun b!273123 () Bool)

(declare-fun e!193006 () Bool)

(declare-fun e!193007 () Bool)

(assert (=> b!273123 (= e!193006 e!193007)))

(declare-fun res!227349 () Bool)

(assert (=> b!273123 (=> (not res!227349) (not e!193007))))

(declare-fun e!193009 () Bool)

(assert (=> b!273123 (= res!227349 e!193009)))

(declare-fun res!227346 () Bool)

(assert (=> b!273123 (=> res!227346 e!193009)))

(assert (=> b!273123 (= res!227346 (bvsge (_1!12234 lt!410963) (_2!12234 lt!410963)))))

(assert (=> b!273123 (= lt!410962 ((_ extract 31 0) (bvsrem lt!410906 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!410961 () (_ BitVec 32))

(assert (=> b!273123 (= lt!410961 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!502)

(assert (=> b!273123 (= lt!410963 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!410906))))

(declare-fun b!273124 () Bool)

(declare-fun arrayRangesEq!1144 (array!15278 array!15278 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273124 (= e!193009 (arrayRangesEq!1144 (buf!7111 bs!71) (buf!7111 bs!71) (_1!12234 lt!410963) (_2!12234 lt!410963)))))

(declare-fun b!273125 () Bool)

(declare-fun e!193008 () Bool)

(assert (=> b!273125 (= e!193007 e!193008)))

(declare-fun c!12591 () Bool)

(assert (=> b!273125 (= c!12591 (= (_3!1031 lt!410963) (_4!251 lt!410963)))))

(declare-fun d!93382 () Bool)

(declare-fun res!227347 () Bool)

(assert (=> d!93382 (=> res!227347 e!193006)))

(assert (=> d!93382 (= res!227347 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!410906))))

(assert (=> d!93382 (= (arrayBitRangesEq!0 (buf!7111 bs!71) (buf!7111 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410906) e!193006)))

(declare-fun b!273126 () Bool)

(declare-fun res!227348 () Bool)

(assert (=> b!273126 (= res!227348 (= lt!410962 #b00000000000000000000000000000000))))

(assert (=> b!273126 (=> res!227348 e!193004)))

(declare-fun e!193005 () Bool)

(assert (=> b!273126 (= e!193005 e!193004)))

(declare-fun b!273127 () Bool)

(declare-fun call!4406 () Bool)

(assert (=> b!273127 (= e!193008 call!4406)))

(declare-fun b!273128 () Bool)

(assert (=> b!273128 (= e!193008 e!193005)))

(declare-fun res!227350 () Bool)

(assert (=> b!273128 (= res!227350 call!4406)))

(assert (=> b!273128 (=> (not res!227350) (not e!193005))))

(declare-fun bm!4403 () Bool)

(assert (=> bm!4403 (= call!4406 (byteRangesEq!0 (select (arr!7630 (buf!7111 bs!71)) (_3!1031 lt!410963)) (select (arr!7630 (buf!7111 bs!71)) (_3!1031 lt!410963)) lt!410961 (ite c!12591 lt!410962 #b00000000000000000000000000001000)))))

(assert (= (and d!93382 (not res!227347)) b!273123))

(assert (= (and b!273123 (not res!227346)) b!273124))

(assert (= (and b!273123 res!227349) b!273125))

(assert (= (and b!273125 c!12591) b!273127))

(assert (= (and b!273125 (not c!12591)) b!273128))

(assert (= (and b!273128 res!227350) b!273126))

(assert (= (and b!273126 (not res!227348)) b!273122))

(assert (= (or b!273127 b!273128) bm!4403))

(declare-fun m!405985 () Bool)

(assert (=> b!273122 m!405985))

(assert (=> b!273122 m!405985))

(assert (=> b!273122 m!405985))

(assert (=> b!273122 m!405985))

(declare-fun m!405987 () Bool)

(assert (=> b!273122 m!405987))

(declare-fun m!405989 () Bool)

(assert (=> b!273123 m!405989))

(declare-fun m!405991 () Bool)

(assert (=> b!273124 m!405991))

(declare-fun m!405993 () Bool)

(assert (=> bm!4403 m!405993))

(assert (=> bm!4403 m!405993))

(assert (=> bm!4403 m!405993))

(assert (=> bm!4403 m!405993))

(declare-fun m!405995 () Bool)

(assert (=> bm!4403 m!405995))

(assert (=> b!273019 d!93382))

(declare-fun d!93392 () Bool)

(assert (=> d!93392 (arrayBitRangesEq!0 (buf!7111 bs!71) (buf!7111 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410906)))

(declare-fun lt!410990 () Unit!19265)

(declare-fun choose!4 (array!15278 array!15278 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19265)

(assert (=> d!93392 (= lt!410990 (choose!4 (buf!7111 bs!71) (buf!7111 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410907 #b0000000000000000000000000000000000000000000000000000000000000000 lt!410906))))

(assert (=> d!93392 (bvsle (size!6643 (buf!7111 bs!71)) (size!6643 (buf!7111 bs!71)))))

(assert (=> d!93392 (= (arrayBitRangesEqSlicedLemma!0 (buf!7111 bs!71) (buf!7111 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410907 #b0000000000000000000000000000000000000000000000000000000000000000 lt!410906) lt!410990)))

(declare-fun bs!23558 () Bool)

(assert (= bs!23558 d!93392))

(assert (=> bs!23558 m!405913))

(declare-fun m!406003 () Bool)

(assert (=> bs!23558 m!406003))

(assert (=> b!273019 d!93392))

(declare-fun d!93400 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93400 (= (inv!12 bs!71) (invariant!0 (currentBit!13116 bs!71) (currentByte!13121 bs!71) (size!6643 (buf!7111 bs!71))))))

(declare-fun bs!23559 () Bool)

(assert (= bs!23559 d!93400))

(declare-fun m!406017 () Bool)

(assert (=> bs!23559 m!406017))

(assert (=> start!59816 d!93400))

(declare-fun d!93404 () Bool)

(declare-fun e!193033 () Bool)

(assert (=> d!93404 e!193033))

(declare-fun res!227381 () Bool)

(assert (=> d!93404 (=> (not res!227381) (not e!193033))))

(declare-fun lt!411037 () (_ BitVec 64))

(declare-fun lt!411034 () (_ BitVec 64))

(declare-fun lt!411035 () (_ BitVec 64))

(assert (=> d!93404 (= res!227381 (= lt!411035 (bvsub lt!411034 lt!411037)))))

(assert (=> d!93404 (or (= (bvand lt!411034 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411037 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411034 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411034 lt!411037) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93404 (= lt!411037 (remainingBits!0 ((_ sign_extend 32) (size!6643 (buf!7111 bs!71))) ((_ sign_extend 32) (currentByte!13121 bs!71)) ((_ sign_extend 32) (currentBit!13116 bs!71))))))

(declare-fun lt!411036 () (_ BitVec 64))

(declare-fun lt!411033 () (_ BitVec 64))

(assert (=> d!93404 (= lt!411034 (bvmul lt!411036 lt!411033))))

(assert (=> d!93404 (or (= lt!411036 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411033 (bvsdiv (bvmul lt!411036 lt!411033) lt!411036)))))

(assert (=> d!93404 (= lt!411033 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93404 (= lt!411036 ((_ sign_extend 32) (size!6643 (buf!7111 bs!71))))))

(assert (=> d!93404 (= lt!411035 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13121 bs!71)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13116 bs!71))))))

(assert (=> d!93404 (invariant!0 (currentBit!13116 bs!71) (currentByte!13121 bs!71) (size!6643 (buf!7111 bs!71)))))

(assert (=> d!93404 (= (bitIndex!0 (size!6643 (buf!7111 bs!71)) (currentByte!13121 bs!71) (currentBit!13116 bs!71)) lt!411035)))

(declare-fun b!273162 () Bool)

(declare-fun res!227380 () Bool)

(assert (=> b!273162 (=> (not res!227380) (not e!193033))))

(assert (=> b!273162 (= res!227380 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411035))))

(declare-fun b!273163 () Bool)

(declare-fun lt!411038 () (_ BitVec 64))

(assert (=> b!273163 (= e!193033 (bvsle lt!411035 (bvmul lt!411038 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273163 (or (= lt!411038 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411038 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411038)))))

(assert (=> b!273163 (= lt!411038 ((_ sign_extend 32) (size!6643 (buf!7111 bs!71))))))

(assert (= (and d!93404 res!227381) b!273162))

(assert (= (and b!273162 res!227380) b!273163))

(declare-fun m!406037 () Bool)

(assert (=> d!93404 m!406037))

(assert (=> d!93404 m!406017))

(assert (=> b!273018 d!93404))

(declare-fun lt!411040 () (_ BitVec 32))

(declare-fun e!193034 () Bool)

(declare-fun b!273164 () Bool)

(declare-fun lt!411041 () tuple4!502)

(assert (=> b!273164 (= e!193034 (byteRangesEq!0 (select (arr!7630 (buf!7111 bs!71)) (_4!251 lt!411041)) (select (arr!7630 (buf!7111 bs!71)) (_4!251 lt!411041)) #b00000000000000000000000000000000 lt!411040))))

(declare-fun b!273165 () Bool)

(declare-fun e!193036 () Bool)

(declare-fun e!193037 () Bool)

(assert (=> b!273165 (= e!193036 e!193037)))

(declare-fun res!227385 () Bool)

(assert (=> b!273165 (=> (not res!227385) (not e!193037))))

(declare-fun e!193039 () Bool)

(assert (=> b!273165 (= res!227385 e!193039)))

(declare-fun res!227382 () Bool)

(assert (=> b!273165 (=> res!227382 e!193039)))

(assert (=> b!273165 (= res!227382 (bvsge (_1!12234 lt!411041) (_2!12234 lt!411041)))))

(assert (=> b!273165 (= lt!411040 ((_ extract 31 0) (bvsrem lt!410907 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!411039 () (_ BitVec 32))

(assert (=> b!273165 (= lt!411039 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273165 (= lt!411041 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!410907))))

(declare-fun b!273166 () Bool)

(assert (=> b!273166 (= e!193039 (arrayRangesEq!1144 (buf!7111 bs!71) (buf!7111 bs!71) (_1!12234 lt!411041) (_2!12234 lt!411041)))))

(declare-fun b!273167 () Bool)

(declare-fun e!193038 () Bool)

(assert (=> b!273167 (= e!193037 e!193038)))

(declare-fun c!12594 () Bool)

(assert (=> b!273167 (= c!12594 (= (_3!1031 lt!411041) (_4!251 lt!411041)))))

(declare-fun d!93410 () Bool)

(declare-fun res!227383 () Bool)

(assert (=> d!93410 (=> res!227383 e!193036)))

(assert (=> d!93410 (= res!227383 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!410907))))

(assert (=> d!93410 (= (arrayBitRangesEq!0 (buf!7111 bs!71) (buf!7111 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410907) e!193036)))

(declare-fun b!273168 () Bool)

(declare-fun res!227384 () Bool)

(assert (=> b!273168 (= res!227384 (= lt!411040 #b00000000000000000000000000000000))))

(assert (=> b!273168 (=> res!227384 e!193034)))

(declare-fun e!193035 () Bool)

(assert (=> b!273168 (= e!193035 e!193034)))

(declare-fun b!273169 () Bool)

(declare-fun call!4409 () Bool)

(assert (=> b!273169 (= e!193038 call!4409)))

(declare-fun b!273170 () Bool)

(assert (=> b!273170 (= e!193038 e!193035)))

(declare-fun res!227386 () Bool)

(assert (=> b!273170 (= res!227386 call!4409)))

(assert (=> b!273170 (=> (not res!227386) (not e!193035))))

(declare-fun bm!4406 () Bool)

(assert (=> bm!4406 (= call!4409 (byteRangesEq!0 (select (arr!7630 (buf!7111 bs!71)) (_3!1031 lt!411041)) (select (arr!7630 (buf!7111 bs!71)) (_3!1031 lt!411041)) lt!411039 (ite c!12594 lt!411040 #b00000000000000000000000000001000)))))

(assert (= (and d!93410 (not res!227383)) b!273165))

(assert (= (and b!273165 (not res!227382)) b!273166))

(assert (= (and b!273165 res!227385) b!273167))

(assert (= (and b!273167 c!12594) b!273169))

(assert (= (and b!273167 (not c!12594)) b!273170))

(assert (= (and b!273170 res!227386) b!273168))

(assert (= (and b!273168 (not res!227384)) b!273164))

(assert (= (or b!273169 b!273170) bm!4406))

(declare-fun m!406039 () Bool)

(assert (=> b!273164 m!406039))

(assert (=> b!273164 m!406039))

(assert (=> b!273164 m!406039))

(assert (=> b!273164 m!406039))

(declare-fun m!406041 () Bool)

(assert (=> b!273164 m!406041))

(declare-fun m!406043 () Bool)

(assert (=> b!273165 m!406043))

(declare-fun m!406045 () Bool)

(assert (=> b!273166 m!406045))

(declare-fun m!406047 () Bool)

(assert (=> bm!4406 m!406047))

(assert (=> bm!4406 m!406047))

(assert (=> bm!4406 m!406047))

(assert (=> bm!4406 m!406047))

(declare-fun m!406049 () Bool)

(assert (=> bm!4406 m!406049))

(assert (=> b!273018 d!93410))

(declare-fun d!93412 () Bool)

(declare-fun e!193045 () Bool)

(assert (=> d!93412 e!193045))

(declare-fun res!227392 () Bool)

(assert (=> d!93412 (=> (not res!227392) (not e!193045))))

(declare-fun lt!411057 () (_ BitVec 64))

(declare-fun lt!411059 () (_ BitVec 64))

(assert (=> d!93412 (= res!227392 (or (= lt!411057 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411059 (bvsdiv (bvmul lt!411057 lt!411059) lt!411057))))))

(assert (=> d!93412 (= lt!411059 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93412 (= lt!411057 ((_ sign_extend 32) (size!6643 (buf!7111 bs!71))))))

(declare-fun lt!411058 () Unit!19265)

(declare-fun choose!44 (array!15278) Unit!19265)

(assert (=> d!93412 (= lt!411058 (choose!44 (buf!7111 bs!71)))))

(assert (=> d!93412 (= (arrayBitEqImpliesRangesEqLemma!0 (buf!7111 bs!71)) lt!411058)))

(declare-fun b!273176 () Bool)

(assert (=> b!273176 (= e!193045 (arrayBitRangesEq!0 (buf!7111 bs!71) (buf!7111 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!6643 (buf!7111 bs!71))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!93412 res!227392) b!273176))

(declare-fun m!406055 () Bool)

(assert (=> d!93412 m!406055))

(declare-fun m!406057 () Bool)

(assert (=> b!273176 m!406057))

(assert (=> b!273018 d!93412))

(declare-fun d!93416 () Bool)

(assert (=> d!93416 (= (array_inv!6367 (buf!7111 bs!71)) (bvsge (size!6643 (buf!7111 bs!71)) #b00000000000000000000000000000000))))

(assert (=> b!273020 d!93416))

(push 1)

(assert (not bm!4406))

(assert (not b!273063))

(assert (not d!93400))

(assert (not b!273166))

(assert (not bm!4403))

(assert (not b!273165))

(assert (not d!93392))

(assert (not d!93412))

(assert (not b!273065))

(assert (not b!273176))

(assert (not b!273164))

(assert (not b!273123))

(assert (not d!93404))

(assert (not b!273122))

(assert (not b!273124))

(check-sat)

(pop 1)

(push 1)

(check-sat)

