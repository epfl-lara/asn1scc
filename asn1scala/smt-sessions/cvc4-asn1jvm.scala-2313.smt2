; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58678 () Bool)

(assert start!58678)

(declare-fun b!269403 () Bool)

(declare-fun res!224569 () Bool)

(declare-fun e!189352 () Bool)

(assert (=> b!269403 (=> (not res!224569) (not e!189352))))

(declare-datatypes ((array!15021 0))(
  ( (array!15022 (arr!7533 (Array (_ BitVec 32) (_ BitVec 8))) (size!6546 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11906 0))(
  ( (BitStream!11907 (buf!7014 array!15021) (currentByte!12956 (_ BitVec 32)) (currentBit!12951 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11906)

(declare-fun w2!587 () BitStream!11906)

(declare-fun w1!591 () BitStream!11906)

(assert (=> b!269403 (= res!224569 (and (bvsle #b00000000000000000000000000000000 (currentByte!12956 w1!591)) (bvsle (currentByte!12956 w1!591) (currentByte!12956 w2!587)) (bvsle (size!6546 (buf!7014 w1!591)) (size!6546 (buf!7014 w2!587))) (bvsle (size!6546 (buf!7014 w2!587)) (size!6546 (buf!7014 w3!25))) (bvsle (currentByte!12956 w1!591) (size!6546 (buf!7014 w1!591))) (bvsle (currentByte!12956 w2!587) (size!6546 (buf!7014 w2!587)))))))

(declare-fun res!224567 () Bool)

(assert (=> start!58678 (=> (not res!224567) (not e!189352))))

(declare-fun isPrefixOf!0 (BitStream!11906 BitStream!11906) Bool)

(assert (=> start!58678 (= res!224567 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58678 e!189352))

(declare-fun e!189357 () Bool)

(declare-fun inv!12 (BitStream!11906) Bool)

(assert (=> start!58678 (and (inv!12 w1!591) e!189357)))

(declare-fun e!189351 () Bool)

(assert (=> start!58678 (and (inv!12 w2!587) e!189351)))

(declare-fun e!189356 () Bool)

(assert (=> start!58678 (and (inv!12 w3!25) e!189356)))

(declare-fun b!269404 () Bool)

(declare-fun arrayRangesEq!1078 (array!15021 array!15021 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269404 (= e!189352 (not (arrayRangesEq!1078 (buf!7014 w1!591) (buf!7014 w2!587) #b00000000000000000000000000000000 (currentByte!12956 w1!591))))))

(declare-fun b!269405 () Bool)

(declare-fun array_inv!6270 (array!15021) Bool)

(assert (=> b!269405 (= e!189356 (array_inv!6270 (buf!7014 w3!25)))))

(declare-fun b!269406 () Bool)

(assert (=> b!269406 (= e!189357 (array_inv!6270 (buf!7014 w1!591)))))

(declare-fun b!269407 () Bool)

(declare-fun res!224568 () Bool)

(assert (=> b!269407 (=> (not res!224568) (not e!189352))))

(assert (=> b!269407 (= res!224568 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!269408 () Bool)

(assert (=> b!269408 (= e!189351 (array_inv!6270 (buf!7014 w2!587)))))

(assert (= (and start!58678 res!224567) b!269407))

(assert (= (and b!269407 res!224568) b!269403))

(assert (= (and b!269403 res!224569) b!269404))

(assert (= start!58678 b!269406))

(assert (= start!58678 b!269408))

(assert (= start!58678 b!269405))

(declare-fun m!400973 () Bool)

(assert (=> b!269406 m!400973))

(declare-fun m!400975 () Bool)

(assert (=> b!269405 m!400975))

(declare-fun m!400977 () Bool)

(assert (=> b!269407 m!400977))

(declare-fun m!400979 () Bool)

(assert (=> start!58678 m!400979))

(declare-fun m!400981 () Bool)

(assert (=> start!58678 m!400981))

(declare-fun m!400983 () Bool)

(assert (=> start!58678 m!400983))

(declare-fun m!400985 () Bool)

(assert (=> start!58678 m!400985))

(declare-fun m!400987 () Bool)

(assert (=> b!269404 m!400987))

(declare-fun m!400989 () Bool)

(assert (=> b!269408 m!400989))

(push 1)

(assert (not b!269406))

(assert (not b!269404))

(assert (not b!269405))

(assert (not start!58678))

(assert (not b!269407))

(assert (not b!269408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91218 () Bool)

(declare-fun res!224613 () Bool)

(declare-fun e!189390 () Bool)

(assert (=> d!91218 (=> (not res!224613) (not e!189390))))

(assert (=> d!91218 (= res!224613 (= (size!6546 (buf!7014 w1!591)) (size!6546 (buf!7014 w2!587))))))

(assert (=> d!91218 (= (isPrefixOf!0 w1!591 w2!587) e!189390)))

(declare-fun b!269451 () Bool)

(declare-fun res!224614 () Bool)

(assert (=> b!269451 (=> (not res!224614) (not e!189390))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!269451 (= res!224614 (bvsle (bitIndex!0 (size!6546 (buf!7014 w1!591)) (currentByte!12956 w1!591) (currentBit!12951 w1!591)) (bitIndex!0 (size!6546 (buf!7014 w2!587)) (currentByte!12956 w2!587) (currentBit!12951 w2!587))))))

(declare-fun b!269452 () Bool)

(declare-fun e!189391 () Bool)

(assert (=> b!269452 (= e!189390 e!189391)))

(declare-fun res!224612 () Bool)

(assert (=> b!269452 (=> res!224612 e!189391)))

(assert (=> b!269452 (= res!224612 (= (size!6546 (buf!7014 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!269453 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15021 array!15021 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!269453 (= e!189391 (arrayBitRangesEq!0 (buf!7014 w1!591) (buf!7014 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6546 (buf!7014 w1!591)) (currentByte!12956 w1!591) (currentBit!12951 w1!591))))))

(assert (= (and d!91218 res!224613) b!269451))

(assert (= (and b!269451 res!224614) b!269452))

(assert (= (and b!269452 (not res!224612)) b!269453))

(declare-fun m!401035 () Bool)

(assert (=> b!269451 m!401035))

(declare-fun m!401037 () Bool)

(assert (=> b!269451 m!401037))

(assert (=> b!269453 m!401035))

(assert (=> b!269453 m!401035))

(declare-fun m!401039 () Bool)

(assert (=> b!269453 m!401039))

(assert (=> start!58678 d!91218))

(declare-fun d!91226 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91226 (= (inv!12 w1!591) (invariant!0 (currentBit!12951 w1!591) (currentByte!12956 w1!591) (size!6546 (buf!7014 w1!591))))))

(declare-fun bs!23112 () Bool)

(assert (= bs!23112 d!91226))

(declare-fun m!401041 () Bool)

(assert (=> bs!23112 m!401041))

(assert (=> start!58678 d!91226))

(declare-fun d!91228 () Bool)

(assert (=> d!91228 (= (inv!12 w2!587) (invariant!0 (currentBit!12951 w2!587) (currentByte!12956 w2!587) (size!6546 (buf!7014 w2!587))))))

(declare-fun bs!23113 () Bool)

(assert (= bs!23113 d!91228))

(declare-fun m!401043 () Bool)

(assert (=> bs!23113 m!401043))

(assert (=> start!58678 d!91228))

(declare-fun d!91230 () Bool)

(assert (=> d!91230 (= (inv!12 w3!25) (invariant!0 (currentBit!12951 w3!25) (currentByte!12956 w3!25) (size!6546 (buf!7014 w3!25))))))

(declare-fun bs!23114 () Bool)

(assert (= bs!23114 d!91230))

(declare-fun m!401045 () Bool)

(assert (=> bs!23114 m!401045))

(assert (=> start!58678 d!91230))

(declare-fun d!91232 () Bool)

(assert (=> d!91232 (= (array_inv!6270 (buf!7014 w2!587)) (bvsge (size!6546 (buf!7014 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!269408 d!91232))

(declare-fun d!91234 () Bool)

(declare-fun res!224619 () Bool)

(declare-fun e!189396 () Bool)

(assert (=> d!91234 (=> res!224619 e!189396)))

(assert (=> d!91234 (= res!224619 (= #b00000000000000000000000000000000 (currentByte!12956 w1!591)))))

(assert (=> d!91234 (= (arrayRangesEq!1078 (buf!7014 w1!591) (buf!7014 w2!587) #b00000000000000000000000000000000 (currentByte!12956 w1!591)) e!189396)))

(declare-fun b!269458 () Bool)

(declare-fun e!189397 () Bool)

(assert (=> b!269458 (= e!189396 e!189397)))

(declare-fun res!224620 () Bool)

(assert (=> b!269458 (=> (not res!224620) (not e!189397))))

(assert (=> b!269458 (= res!224620 (= (select (arr!7533 (buf!7014 w1!591)) #b00000000000000000000000000000000) (select (arr!7533 (buf!7014 w2!587)) #b00000000000000000000000000000000)))))

(declare-fun b!269459 () Bool)

(assert (=> b!269459 (= e!189397 (arrayRangesEq!1078 (buf!7014 w1!591) (buf!7014 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12956 w1!591)))))

(assert (= (and d!91234 (not res!224619)) b!269458))

(assert (= (and b!269458 res!224620) b!269459))

(declare-fun m!401047 () Bool)

(assert (=> b!269458 m!401047))

(declare-fun m!401049 () Bool)

(assert (=> b!269458 m!401049))

(declare-fun m!401051 () Bool)

(assert (=> b!269459 m!401051))

(assert (=> b!269404 d!91234))

(declare-fun d!91236 () Bool)

(assert (=> d!91236 (= (array_inv!6270 (buf!7014 w1!591)) (bvsge (size!6546 (buf!7014 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!269406 d!91236))

(declare-fun d!91238 () Bool)

(assert (=> d!91238 (= (array_inv!6270 (buf!7014 w3!25)) (bvsge (size!6546 (buf!7014 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!269405 d!91238))

(declare-fun d!91240 () Bool)

(declare-fun res!224622 () Bool)

(declare-fun e!189398 () Bool)

(assert (=> d!91240 (=> (not res!224622) (not e!189398))))

(assert (=> d!91240 (= res!224622 (= (size!6546 (buf!7014 w2!587)) (size!6546 (buf!7014 w3!25))))))

(assert (=> d!91240 (= (isPrefixOf!0 w2!587 w3!25) e!189398)))

(declare-fun b!269460 () Bool)

(declare-fun res!224623 () Bool)

(assert (=> b!269460 (=> (not res!224623) (not e!189398))))

(assert (=> b!269460 (= res!224623 (bvsle (bitIndex!0 (size!6546 (buf!7014 w2!587)) (currentByte!12956 w2!587) (currentBit!12951 w2!587)) (bitIndex!0 (size!6546 (buf!7014 w3!25)) (currentByte!12956 w3!25) (currentBit!12951 w3!25))))))

(declare-fun b!269461 () Bool)

(declare-fun e!189399 () Bool)

(assert (=> b!269461 (= e!189398 e!189399)))

(declare-fun res!224621 () Bool)

(assert (=> b!269461 (=> res!224621 e!189399)))

(assert (=> b!269461 (= res!224621 (= (size!6546 (buf!7014 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!269462 () Bool)

(assert (=> b!269462 (= e!189399 (arrayBitRangesEq!0 (buf!7014 w2!587) (buf!7014 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6546 (buf!7014 w2!587)) (currentByte!12956 w2!587) (currentBit!12951 w2!587))))))

(assert (= (and d!91240 res!224622) b!269460))

(assert (= (and b!269460 res!224623) b!269461))

(assert (= (and b!269461 (not res!224621)) b!269462))

(assert (=> b!269460 m!401037))

(declare-fun m!401053 () Bool)

(assert (=> b!269460 m!401053))

(assert (=> b!269462 m!401037))

(assert (=> b!269462 m!401037))

(declare-fun m!401055 () Bool)

(assert (=> b!269462 m!401055))

(assert (=> b!269407 d!91240))

(push 1)

(assert (not b!269453))

(assert (not d!91230))

(assert (not b!269459))

(assert (not b!269462))

(assert (not d!91226))

(assert (not d!91228))

(assert (not b!269460))

(assert (not b!269451))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!409074 () (_ BitVec 32))

(declare-fun c!12443 () Bool)

(declare-fun lt!409076 () (_ BitVec 32))

(declare-datatypes ((tuple4!442 0))(
  ( (tuple4!443 (_1!12204 (_ BitVec 32)) (_2!12204 (_ BitVec 32)) (_3!1001 (_ BitVec 32)) (_4!221 (_ BitVec 32))) )
))
(declare-fun lt!409075 () tuple4!442)

(declare-fun call!4294 () Bool)

(declare-fun bm!4291 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4291 (= call!4294 (byteRangesEq!0 (select (arr!7533 (buf!7014 w2!587)) (_3!1001 lt!409075)) (select (arr!7533 (buf!7014 w3!25)) (_3!1001 lt!409075)) lt!409076 (ite c!12443 lt!409074 #b00000000000000000000000000001000)))))

(declare-fun b!269557 () Bool)

(declare-fun e!189479 () Bool)

(declare-fun e!189477 () Bool)

(assert (=> b!269557 (= e!189479 e!189477)))

(declare-fun res!224699 () Bool)

(assert (=> b!269557 (= res!224699 call!4294)))

(assert (=> b!269557 (=> (not res!224699) (not e!189477))))

(declare-fun b!269558 () Bool)

(declare-fun res!224702 () Bool)

(assert (=> b!269558 (= res!224702 (= lt!409074 #b00000000000000000000000000000000))))

(declare-fun e!189474 () Bool)

(assert (=> b!269558 (=> res!224702 e!189474)))

(assert (=> b!269558 (= e!189477 e!189474)))

(declare-fun b!269559 () Bool)

(declare-fun e!189476 () Bool)

(declare-fun e!189478 () Bool)

(assert (=> b!269559 (= e!189476 e!189478)))

(declare-fun res!224701 () Bool)

(assert (=> b!269559 (=> (not res!224701) (not e!189478))))

(declare-fun e!189475 () Bool)

(assert (=> b!269559 (= res!224701 e!189475)))

(declare-fun res!224700 () Bool)

(assert (=> b!269559 (=> res!224700 e!189475)))

(assert (=> b!269559 (= res!224700 (bvsge (_1!12204 lt!409075) (_2!12204 lt!409075)))))

(assert (=> b!269559 (= lt!409074 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6546 (buf!7014 w2!587)) (currentByte!12956 w2!587) (currentBit!12951 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269559 (= lt!409076 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!442)

(assert (=> b!269559 (= lt!409075 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6546 (buf!7014 w2!587)) (currentByte!12956 w2!587) (currentBit!12951 w2!587))))))

(declare-fun b!269560 () Bool)

(assert (=> b!269560 (= e!189479 call!4294)))

(declare-fun b!269561 () Bool)

(assert (=> b!269561 (= e!189474 (byteRangesEq!0 (select (arr!7533 (buf!7014 w2!587)) (_4!221 lt!409075)) (select (arr!7533 (buf!7014 w3!25)) (_4!221 lt!409075)) #b00000000000000000000000000000000 lt!409074))))

(declare-fun b!269562 () Bool)

(assert (=> b!269562 (= e!189475 (arrayRangesEq!1078 (buf!7014 w2!587) (buf!7014 w3!25) (_1!12204 lt!409075) (_2!12204 lt!409075)))))

(declare-fun b!269563 () Bool)

(assert (=> b!269563 (= e!189478 e!189479)))

(assert (=> b!269563 (= c!12443 (= (_3!1001 lt!409075) (_4!221 lt!409075)))))

(declare-fun d!91274 () Bool)

(declare-fun res!224698 () Bool)

(assert (=> d!91274 (=> res!224698 e!189476)))

(assert (=> d!91274 (= res!224698 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6546 (buf!7014 w2!587)) (currentByte!12956 w2!587) (currentBit!12951 w2!587))))))

(assert (=> d!91274 (= (arrayBitRangesEq!0 (buf!7014 w2!587) (buf!7014 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6546 (buf!7014 w2!587)) (currentByte!12956 w2!587) (currentBit!12951 w2!587))) e!189476)))

(assert (= (and d!91274 (not res!224698)) b!269559))

(assert (= (and b!269559 (not res!224700)) b!269562))

(assert (= (and b!269559 res!224701) b!269563))

(assert (= (and b!269563 c!12443) b!269560))

(assert (= (and b!269563 (not c!12443)) b!269557))

(assert (= (and b!269557 res!224699) b!269558))

(assert (= (and b!269558 (not res!224702)) b!269561))

(assert (= (or b!269560 b!269557) bm!4291))

(declare-fun m!401145 () Bool)

(assert (=> bm!4291 m!401145))

(declare-fun m!401147 () Bool)

(assert (=> bm!4291 m!401147))

(assert (=> bm!4291 m!401145))

(assert (=> bm!4291 m!401147))

(declare-fun m!401149 () Bool)

(assert (=> bm!4291 m!401149))

(assert (=> b!269559 m!401037))

(declare-fun m!401151 () Bool)

(assert (=> b!269559 m!401151))

(declare-fun m!401153 () Bool)

(assert (=> b!269561 m!401153))

(declare-fun m!401155 () Bool)

(assert (=> b!269561 m!401155))

(assert (=> b!269561 m!401153))

(assert (=> b!269561 m!401155))

(declare-fun m!401157 () Bool)

(assert (=> b!269561 m!401157))

(declare-fun m!401159 () Bool)

(assert (=> b!269562 m!401159))

(assert (=> b!269462 d!91274))

(declare-fun d!91280 () Bool)

(declare-fun e!189482 () Bool)

(assert (=> d!91280 e!189482))

(declare-fun res!224708 () Bool)

(assert (=> d!91280 (=> (not res!224708) (not e!189482))))

(declare-fun lt!409093 () (_ BitVec 64))

(declare-fun lt!409092 () (_ BitVec 64))

(declare-fun lt!409091 () (_ BitVec 64))

(assert (=> d!91280 (= res!224708 (= lt!409093 (bvsub lt!409091 lt!409092)))))

(assert (=> d!91280 (or (= (bvand lt!409091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409092 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409091 lt!409092) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!91280 (= lt!409092 (remainingBits!0 ((_ sign_extend 32) (size!6546 (buf!7014 w2!587))) ((_ sign_extend 32) (currentByte!12956 w2!587)) ((_ sign_extend 32) (currentBit!12951 w2!587))))))

(declare-fun lt!409094 () (_ BitVec 64))

(declare-fun lt!409090 () (_ BitVec 64))

(assert (=> d!91280 (= lt!409091 (bvmul lt!409094 lt!409090))))

(assert (=> d!91280 (or (= lt!409094 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409090 (bvsdiv (bvmul lt!409094 lt!409090) lt!409094)))))

(assert (=> d!91280 (= lt!409090 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91280 (= lt!409094 ((_ sign_extend 32) (size!6546 (buf!7014 w2!587))))))

(assert (=> d!91280 (= lt!409093 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12956 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12951 w2!587))))))

(assert (=> d!91280 (invariant!0 (currentBit!12951 w2!587) (currentByte!12956 w2!587) (size!6546 (buf!7014 w2!587)))))

(assert (=> d!91280 (= (bitIndex!0 (size!6546 (buf!7014 w2!587)) (currentByte!12956 w2!587) (currentBit!12951 w2!587)) lt!409093)))

(declare-fun b!269568 () Bool)

(declare-fun res!224707 () Bool)

(assert (=> b!269568 (=> (not res!224707) (not e!189482))))

(assert (=> b!269568 (= res!224707 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409093))))

(declare-fun b!269569 () Bool)

(declare-fun lt!409089 () (_ BitVec 64))

(assert (=> b!269569 (= e!189482 (bvsle lt!409093 (bvmul lt!409089 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269569 (or (= lt!409089 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409089 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409089)))))

(assert (=> b!269569 (= lt!409089 ((_ sign_extend 32) (size!6546 (buf!7014 w2!587))))))

(assert (= (and d!91280 res!224708) b!269568))

(assert (= (and b!269568 res!224707) b!269569))

(declare-fun m!401161 () Bool)

(assert (=> d!91280 m!401161))

(assert (=> d!91280 m!401043))

(assert (=> b!269462 d!91280))

(declare-fun d!91282 () Bool)

(assert (=> d!91282 (= (invariant!0 (currentBit!12951 w2!587) (currentByte!12956 w2!587) (size!6546 (buf!7014 w2!587))) (and (bvsge (currentBit!12951 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12951 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12956 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12956 w2!587) (size!6546 (buf!7014 w2!587))) (and (= (currentBit!12951 w2!587) #b00000000000000000000000000000000) (= (currentByte!12956 w2!587) (size!6546 (buf!7014 w2!587)))))))))

(assert (=> d!91228 d!91282))

(declare-fun lt!409097 () (_ BitVec 32))

(declare-fun call!4295 () Bool)

(declare-fun lt!409096 () tuple4!442)

(declare-fun lt!409095 () (_ BitVec 32))

(declare-fun c!12444 () Bool)

(declare-fun bm!4292 () Bool)

(assert (=> bm!4292 (= call!4295 (byteRangesEq!0 (select (arr!7533 (buf!7014 w1!591)) (_3!1001 lt!409096)) (select (arr!7533 (buf!7014 w2!587)) (_3!1001 lt!409096)) lt!409097 (ite c!12444 lt!409095 #b00000000000000000000000000001000)))))

(declare-fun b!269570 () Bool)

(declare-fun e!189488 () Bool)

(declare-fun e!189486 () Bool)

(assert (=> b!269570 (= e!189488 e!189486)))

(declare-fun res!224710 () Bool)

(assert (=> b!269570 (= res!224710 call!4295)))

(assert (=> b!269570 (=> (not res!224710) (not e!189486))))

(declare-fun b!269571 () Bool)

(declare-fun res!224713 () Bool)

(assert (=> b!269571 (= res!224713 (= lt!409095 #b00000000000000000000000000000000))))

(declare-fun e!189483 () Bool)

(assert (=> b!269571 (=> res!224713 e!189483)))

(assert (=> b!269571 (= e!189486 e!189483)))

(declare-fun b!269572 () Bool)

(declare-fun e!189485 () Bool)

(declare-fun e!189487 () Bool)

(assert (=> b!269572 (= e!189485 e!189487)))

(declare-fun res!224712 () Bool)

(assert (=> b!269572 (=> (not res!224712) (not e!189487))))

(declare-fun e!189484 () Bool)

(assert (=> b!269572 (= res!224712 e!189484)))

(declare-fun res!224711 () Bool)

(assert (=> b!269572 (=> res!224711 e!189484)))

(assert (=> b!269572 (= res!224711 (bvsge (_1!12204 lt!409096) (_2!12204 lt!409096)))))

(assert (=> b!269572 (= lt!409095 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6546 (buf!7014 w1!591)) (currentByte!12956 w1!591) (currentBit!12951 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269572 (= lt!409097 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269572 (= lt!409096 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6546 (buf!7014 w1!591)) (currentByte!12956 w1!591) (currentBit!12951 w1!591))))))

(declare-fun b!269573 () Bool)

(assert (=> b!269573 (= e!189488 call!4295)))

(declare-fun b!269574 () Bool)

(assert (=> b!269574 (= e!189483 (byteRangesEq!0 (select (arr!7533 (buf!7014 w1!591)) (_4!221 lt!409096)) (select (arr!7533 (buf!7014 w2!587)) (_4!221 lt!409096)) #b00000000000000000000000000000000 lt!409095))))

(declare-fun b!269575 () Bool)

(assert (=> b!269575 (= e!189484 (arrayRangesEq!1078 (buf!7014 w1!591) (buf!7014 w2!587) (_1!12204 lt!409096) (_2!12204 lt!409096)))))

(declare-fun b!269576 () Bool)

(assert (=> b!269576 (= e!189487 e!189488)))

(assert (=> b!269576 (= c!12444 (= (_3!1001 lt!409096) (_4!221 lt!409096)))))

(declare-fun d!91284 () Bool)

(declare-fun res!224709 () Bool)

(assert (=> d!91284 (=> res!224709 e!189485)))

(assert (=> d!91284 (= res!224709 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6546 (buf!7014 w1!591)) (currentByte!12956 w1!591) (currentBit!12951 w1!591))))))

(assert (=> d!91284 (= (arrayBitRangesEq!0 (buf!7014 w1!591) (buf!7014 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6546 (buf!7014 w1!591)) (currentByte!12956 w1!591) (currentBit!12951 w1!591))) e!189485)))

(assert (= (and d!91284 (not res!224709)) b!269572))

(assert (= (and b!269572 (not res!224711)) b!269575))

(assert (= (and b!269572 res!224712) b!269576))

(assert (= (and b!269576 c!12444) b!269573))

(assert (= (and b!269576 (not c!12444)) b!269570))

(assert (= (and b!269570 res!224710) b!269571))

(assert (= (and b!269571 (not res!224713)) b!269574))

(assert (= (or b!269573 b!269570) bm!4292))

(declare-fun m!401163 () Bool)

(assert (=> bm!4292 m!401163))

(declare-fun m!401165 () Bool)

(assert (=> bm!4292 m!401165))

(assert (=> bm!4292 m!401163))

(assert (=> bm!4292 m!401165))

(declare-fun m!401167 () Bool)

(assert (=> bm!4292 m!401167))

(assert (=> b!269572 m!401035))

(declare-fun m!401169 () Bool)

(assert (=> b!269572 m!401169))

(declare-fun m!401171 () Bool)

(assert (=> b!269574 m!401171))

(declare-fun m!401173 () Bool)

(assert (=> b!269574 m!401173))

(assert (=> b!269574 m!401171))

(assert (=> b!269574 m!401173))

(declare-fun m!401175 () Bool)

(assert (=> b!269574 m!401175))

(declare-fun m!401177 () Bool)

(assert (=> b!269575 m!401177))

(assert (=> b!269453 d!91284))

(declare-fun d!91286 () Bool)

(declare-fun e!189489 () Bool)

(assert (=> d!91286 e!189489))

(declare-fun res!224715 () Bool)

(assert (=> d!91286 (=> (not res!224715) (not e!189489))))

(declare-fun lt!409101 () (_ BitVec 64))

(declare-fun lt!409102 () (_ BitVec 64))

(declare-fun lt!409100 () (_ BitVec 64))

(assert (=> d!91286 (= res!224715 (= lt!409102 (bvsub lt!409100 lt!409101)))))

(assert (=> d!91286 (or (= (bvand lt!409100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409101 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409100 lt!409101) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91286 (= lt!409101 (remainingBits!0 ((_ sign_extend 32) (size!6546 (buf!7014 w1!591))) ((_ sign_extend 32) (currentByte!12956 w1!591)) ((_ sign_extend 32) (currentBit!12951 w1!591))))))

(declare-fun lt!409103 () (_ BitVec 64))

(declare-fun lt!409099 () (_ BitVec 64))

(assert (=> d!91286 (= lt!409100 (bvmul lt!409103 lt!409099))))

(assert (=> d!91286 (or (= lt!409103 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409099 (bvsdiv (bvmul lt!409103 lt!409099) lt!409103)))))

(assert (=> d!91286 (= lt!409099 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91286 (= lt!409103 ((_ sign_extend 32) (size!6546 (buf!7014 w1!591))))))

(assert (=> d!91286 (= lt!409102 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12956 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12951 w1!591))))))

(assert (=> d!91286 (invariant!0 (currentBit!12951 w1!591) (currentByte!12956 w1!591) (size!6546 (buf!7014 w1!591)))))

(assert (=> d!91286 (= (bitIndex!0 (size!6546 (buf!7014 w1!591)) (currentByte!12956 w1!591) (currentBit!12951 w1!591)) lt!409102)))

(declare-fun b!269577 () Bool)

(declare-fun res!224714 () Bool)

(assert (=> b!269577 (=> (not res!224714) (not e!189489))))

(assert (=> b!269577 (= res!224714 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409102))))

(declare-fun b!269578 () Bool)

(declare-fun lt!409098 () (_ BitVec 64))

(assert (=> b!269578 (= e!189489 (bvsle lt!409102 (bvmul lt!409098 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269578 (or (= lt!409098 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409098 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409098)))))

(assert (=> b!269578 (= lt!409098 ((_ sign_extend 32) (size!6546 (buf!7014 w1!591))))))

(assert (= (and d!91286 res!224715) b!269577))

(assert (= (and b!269577 res!224714) b!269578))

(declare-fun m!401179 () Bool)

(assert (=> d!91286 m!401179))

(assert (=> d!91286 m!401041))

(assert (=> b!269453 d!91286))

(declare-fun d!91288 () Bool)

(declare-fun res!224716 () Bool)

(declare-fun e!189490 () Bool)

(assert (=> d!91288 (=> res!224716 e!189490)))

(assert (=> d!91288 (= res!224716 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12956 w1!591)))))

(assert (=> d!91288 (= (arrayRangesEq!1078 (buf!7014 w1!591) (buf!7014 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12956 w1!591)) e!189490)))

(declare-fun b!269579 () Bool)

(declare-fun e!189491 () Bool)

(assert (=> b!269579 (= e!189490 e!189491)))

(declare-fun res!224717 () Bool)

(assert (=> b!269579 (=> (not res!224717) (not e!189491))))

(assert (=> b!269579 (= res!224717 (= (select (arr!7533 (buf!7014 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7533 (buf!7014 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!269580 () Bool)

(assert (=> b!269580 (= e!189491 (arrayRangesEq!1078 (buf!7014 w1!591) (buf!7014 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12956 w1!591)))))

(assert (= (and d!91288 (not res!224716)) b!269579))

(assert (= (and b!269579 res!224717) b!269580))

(declare-fun m!401181 () Bool)

(assert (=> b!269579 m!401181))

(declare-fun m!401183 () Bool)

(assert (=> b!269579 m!401183))

(declare-fun m!401185 () Bool)

(assert (=> b!269580 m!401185))

(assert (=> b!269459 d!91288))

(declare-fun d!91290 () Bool)

(assert (=> d!91290 (= (invariant!0 (currentBit!12951 w1!591) (currentByte!12956 w1!591) (size!6546 (buf!7014 w1!591))) (and (bvsge (currentBit!12951 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12951 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12956 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12956 w1!591) (size!6546 (buf!7014 w1!591))) (and (= (currentBit!12951 w1!591) #b00000000000000000000000000000000) (= (currentByte!12956 w1!591) (size!6546 (buf!7014 w1!591)))))))))

(assert (=> d!91226 d!91290))

(assert (=> b!269460 d!91280))

(declare-fun d!91292 () Bool)

(declare-fun e!189492 () Bool)

(assert (=> d!91292 e!189492))

(declare-fun res!224719 () Bool)

(assert (=> d!91292 (=> (not res!224719) (not e!189492))))

(declare-fun lt!409108 () (_ BitVec 64))

(declare-fun lt!409107 () (_ BitVec 64))

(declare-fun lt!409106 () (_ BitVec 64))

(assert (=> d!91292 (= res!224719 (= lt!409108 (bvsub lt!409106 lt!409107)))))

(assert (=> d!91292 (or (= (bvand lt!409106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409107 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409106 lt!409107) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91292 (= lt!409107 (remainingBits!0 ((_ sign_extend 32) (size!6546 (buf!7014 w3!25))) ((_ sign_extend 32) (currentByte!12956 w3!25)) ((_ sign_extend 32) (currentBit!12951 w3!25))))))

(declare-fun lt!409109 () (_ BitVec 64))

(declare-fun lt!409105 () (_ BitVec 64))

(assert (=> d!91292 (= lt!409106 (bvmul lt!409109 lt!409105))))

(assert (=> d!91292 (or (= lt!409109 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409105 (bvsdiv (bvmul lt!409109 lt!409105) lt!409109)))))

(assert (=> d!91292 (= lt!409105 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91292 (= lt!409109 ((_ sign_extend 32) (size!6546 (buf!7014 w3!25))))))

(assert (=> d!91292 (= lt!409108 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12956 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12951 w3!25))))))

(assert (=> d!91292 (invariant!0 (currentBit!12951 w3!25) (currentByte!12956 w3!25) (size!6546 (buf!7014 w3!25)))))

(assert (=> d!91292 (= (bitIndex!0 (size!6546 (buf!7014 w3!25)) (currentByte!12956 w3!25) (currentBit!12951 w3!25)) lt!409108)))

(declare-fun b!269581 () Bool)

(declare-fun res!224718 () Bool)

(assert (=> b!269581 (=> (not res!224718) (not e!189492))))

(assert (=> b!269581 (= res!224718 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409108))))

(declare-fun b!269582 () Bool)

(declare-fun lt!409104 () (_ BitVec 64))

(assert (=> b!269582 (= e!189492 (bvsle lt!409108 (bvmul lt!409104 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269582 (or (= lt!409104 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409104 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409104)))))

(assert (=> b!269582 (= lt!409104 ((_ sign_extend 32) (size!6546 (buf!7014 w3!25))))))

(assert (= (and d!91292 res!224719) b!269581))

(assert (= (and b!269581 res!224718) b!269582))

(declare-fun m!401187 () Bool)

(assert (=> d!91292 m!401187))

(assert (=> d!91292 m!401045))

(assert (=> b!269460 d!91292))

(assert (=> b!269451 d!91286))

(assert (=> b!269451 d!91280))

(declare-fun d!91294 () Bool)

(assert (=> d!91294 (= (invariant!0 (currentBit!12951 w3!25) (currentByte!12956 w3!25) (size!6546 (buf!7014 w3!25))) (and (bvsge (currentBit!12951 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12951 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12956 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12956 w3!25) (size!6546 (buf!7014 w3!25))) (and (= (currentBit!12951 w3!25) #b00000000000000000000000000000000) (= (currentByte!12956 w3!25) (size!6546 (buf!7014 w3!25)))))))))

(assert (=> d!91230 d!91294))

(push 1)

(assert (not d!91292))

(assert (not b!269562))

(assert (not b!269574))

(assert (not d!91280))

(assert (not b!269559))

(assert (not b!269575))

(assert (not d!91286))

(assert (not b!269580))

(assert (not b!269572))

(assert (not b!269561))

(assert (not bm!4291))

(assert (not bm!4292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91320 () Bool)

(declare-fun res!224726 () Bool)

(declare-fun e!189499 () Bool)

(assert (=> d!91320 (=> res!224726 e!189499)))

(assert (=> d!91320 (= res!224726 (= (_1!12204 lt!409096) (_2!12204 lt!409096)))))

(assert (=> d!91320 (= (arrayRangesEq!1078 (buf!7014 w1!591) (buf!7014 w2!587) (_1!12204 lt!409096) (_2!12204 lt!409096)) e!189499)))

(declare-fun b!269589 () Bool)

(declare-fun e!189500 () Bool)

(assert (=> b!269589 (= e!189499 e!189500)))

(declare-fun res!224727 () Bool)

(assert (=> b!269589 (=> (not res!224727) (not e!189500))))

(assert (=> b!269589 (= res!224727 (= (select (arr!7533 (buf!7014 w1!591)) (_1!12204 lt!409096)) (select (arr!7533 (buf!7014 w2!587)) (_1!12204 lt!409096))))))

(declare-fun b!269590 () Bool)

(assert (=> b!269590 (= e!189500 (arrayRangesEq!1078 (buf!7014 w1!591) (buf!7014 w2!587) (bvadd (_1!12204 lt!409096) #b00000000000000000000000000000001) (_2!12204 lt!409096)))))

(assert (= (and d!91320 (not res!224726)) b!269589))

(assert (= (and b!269589 res!224727) b!269590))

(declare-fun m!401221 () Bool)

(assert (=> b!269589 m!401221))

(declare-fun m!401223 () Bool)

(assert (=> b!269589 m!401223))

(declare-fun m!401225 () Bool)

(assert (=> b!269590 m!401225))

(assert (=> b!269575 d!91320))

(declare-fun d!91322 () Bool)

(assert (=> d!91322 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6546 (buf!7014 w2!587)) (currentByte!12956 w2!587) (currentBit!12951 w2!587))) (tuple4!443 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6546 (buf!7014 w2!587)) (currentByte!12956 w2!587) (currentBit!12951 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6546 (buf!7014 w2!587)) (currentByte!12956 w2!587) (currentBit!12951 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!269559 d!91322))

(declare-fun d!91324 () Bool)

(declare-fun res!224728 () Bool)

(declare-fun e!189501 () Bool)

(assert (=> d!91324 (=> res!224728 e!189501)))

(assert (=> d!91324 (= res!224728 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12956 w1!591)))))

(assert (=> d!91324 (= (arrayRangesEq!1078 (buf!7014 w1!591) (buf!7014 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12956 w1!591)) e!189501)))

(declare-fun b!269591 () Bool)

(declare-fun e!189502 () Bool)

(assert (=> b!269591 (= e!189501 e!189502)))

(declare-fun res!224729 () Bool)

(assert (=> b!269591 (=> (not res!224729) (not e!189502))))

(assert (=> b!269591 (= res!224729 (= (select (arr!7533 (buf!7014 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7533 (buf!7014 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!269592 () Bool)

(assert (=> b!269592 (= e!189502 (arrayRangesEq!1078 (buf!7014 w1!591) (buf!7014 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12956 w1!591)))))

(assert (= (and d!91324 (not res!224728)) b!269591))

(assert (= (and b!269591 res!224729) b!269592))

(declare-fun m!401227 () Bool)

(assert (=> b!269591 m!401227))

(declare-fun m!401229 () Bool)

(assert (=> b!269591 m!401229))

(declare-fun m!401231 () Bool)

(assert (=> b!269592 m!401231))

(assert (=> b!269580 d!91324))

(declare-fun d!91326 () Bool)

(assert (=> d!91326 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6546 (buf!7014 w1!591)) (currentByte!12956 w1!591) (currentBit!12951 w1!591))) (tuple4!443 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6546 (buf!7014 w1!591)) (currentByte!12956 w1!591) (currentBit!12951 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6546 (buf!7014 w1!591)) (currentByte!12956 w1!591) (currentBit!12951 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!269572 d!91326))

(declare-fun d!91328 () Bool)

(assert (=> d!91328 (= (remainingBits!0 ((_ sign_extend 32) (size!6546 (buf!7014 w1!591))) ((_ sign_extend 32) (currentByte!12956 w1!591)) ((_ sign_extend 32) (currentBit!12951 w1!591))) (bvsub (bvmul ((_ sign_extend 32) (size!6546 (buf!7014 w1!591))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12956 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12951 w1!591)))))))

(assert (=> d!91286 d!91328))

(assert (=> d!91286 d!91290))

(declare-fun d!91330 () Bool)

(assert (=> d!91330 (= (byteRangesEq!0 (select (arr!7533 (buf!7014 w1!591)) (_4!221 lt!409096)) (select (arr!7533 (buf!7014 w2!587)) (_4!221 lt!409096)) #b00000000000000000000000000000000 lt!409095) (or (= #b00000000000000000000000000000000 lt!409095) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7533 (buf!7014 w1!591)) (_4!221 lt!409096))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409095))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7533 (buf!7014 w2!587)) (_4!221 lt!409096))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409095))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23119 () Bool)

(assert (= bs!23119 d!91330))

(declare-fun m!401233 () Bool)

(assert (=> bs!23119 m!401233))

(declare-fun m!401235 () Bool)

(assert (=> bs!23119 m!401235))

(assert (=> b!269574 d!91330))

(declare-fun d!91332 () Bool)

(assert (=> d!91332 (= (byteRangesEq!0 (select (arr!7533 (buf!7014 w2!587)) (_3!1001 lt!409075)) (select (arr!7533 (buf!7014 w3!25)) (_3!1001 lt!409075)) lt!409076 (ite c!12443 lt!409074 #b00000000000000000000000000001000)) (or (= lt!409076 (ite c!12443 lt!409074 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7533 (buf!7014 w2!587)) (_3!1001 lt!409075))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12443 lt!409074 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409076)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7533 (buf!7014 w3!25)) (_3!1001 lt!409075))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12443 lt!409074 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409076)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23120 () Bool)

(assert (= bs!23120 d!91332))

(declare-fun m!401237 () Bool)

(assert (=> bs!23120 m!401237))

(declare-fun m!401239 () Bool)

(assert (=> bs!23120 m!401239))

(assert (=> bm!4291 d!91332))

(declare-fun d!91334 () Bool)

(declare-fun res!224730 () Bool)

(declare-fun e!189503 () Bool)

(assert (=> d!91334 (=> res!224730 e!189503)))

(assert (=> d!91334 (= res!224730 (= (_1!12204 lt!409075) (_2!12204 lt!409075)))))

(assert (=> d!91334 (= (arrayRangesEq!1078 (buf!7014 w2!587) (buf!7014 w3!25) (_1!12204 lt!409075) (_2!12204 lt!409075)) e!189503)))

(declare-fun b!269593 () Bool)

(declare-fun e!189504 () Bool)

(assert (=> b!269593 (= e!189503 e!189504)))

(declare-fun res!224731 () Bool)

(assert (=> b!269593 (=> (not res!224731) (not e!189504))))

(assert (=> b!269593 (= res!224731 (= (select (arr!7533 (buf!7014 w2!587)) (_1!12204 lt!409075)) (select (arr!7533 (buf!7014 w3!25)) (_1!12204 lt!409075))))))

(declare-fun b!269594 () Bool)

(assert (=> b!269594 (= e!189504 (arrayRangesEq!1078 (buf!7014 w2!587) (buf!7014 w3!25) (bvadd (_1!12204 lt!409075) #b00000000000000000000000000000001) (_2!12204 lt!409075)))))

(assert (= (and d!91334 (not res!224730)) b!269593))

(assert (= (and b!269593 res!224731) b!269594))

(declare-fun m!401241 () Bool)

(assert (=> b!269593 m!401241))

(declare-fun m!401243 () Bool)

(assert (=> b!269593 m!401243))

(declare-fun m!401245 () Bool)

(assert (=> b!269594 m!401245))

(assert (=> b!269562 d!91334))

(declare-fun d!91336 () Bool)

(assert (=> d!91336 (= (remainingBits!0 ((_ sign_extend 32) (size!6546 (buf!7014 w3!25))) ((_ sign_extend 32) (currentByte!12956 w3!25)) ((_ sign_extend 32) (currentBit!12951 w3!25))) (bvsub (bvmul ((_ sign_extend 32) (size!6546 (buf!7014 w3!25))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12956 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12951 w3!25)))))))

(assert (=> d!91292 d!91336))

(assert (=> d!91292 d!91294))

(declare-fun d!91338 () Bool)

(assert (=> d!91338 (= (remainingBits!0 ((_ sign_extend 32) (size!6546 (buf!7014 w2!587))) ((_ sign_extend 32) (currentByte!12956 w2!587)) ((_ sign_extend 32) (currentBit!12951 w2!587))) (bvsub (bvmul ((_ sign_extend 32) (size!6546 (buf!7014 w2!587))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12956 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12951 w2!587)))))))

(assert (=> d!91280 d!91338))

(assert (=> d!91280 d!91282))

(declare-fun d!91340 () Bool)

(assert (=> d!91340 (= (byteRangesEq!0 (select (arr!7533 (buf!7014 w2!587)) (_4!221 lt!409075)) (select (arr!7533 (buf!7014 w3!25)) (_4!221 lt!409075)) #b00000000000000000000000000000000 lt!409074) (or (= #b00000000000000000000000000000000 lt!409074) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7533 (buf!7014 w2!587)) (_4!221 lt!409075))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409074))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7533 (buf!7014 w3!25)) (_4!221 lt!409075))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409074))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23121 () Bool)

(assert (= bs!23121 d!91340))

(declare-fun m!401247 () Bool)

(assert (=> bs!23121 m!401247))

(assert (=> bs!23121 m!401235))

(assert (=> b!269561 d!91340))

(declare-fun d!91342 () Bool)

(assert (=> d!91342 (= (byteRangesEq!0 (select (arr!7533 (buf!7014 w1!591)) (_3!1001 lt!409096)) (select (arr!7533 (buf!7014 w2!587)) (_3!1001 lt!409096)) lt!409097 (ite c!12444 lt!409095 #b00000000000000000000000000001000)) (or (= lt!409097 (ite c!12444 lt!409095 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7533 (buf!7014 w1!591)) (_3!1001 lt!409096))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12444 lt!409095 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409097)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7533 (buf!7014 w2!587)) (_3!1001 lt!409096))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12444 lt!409095 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409097)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23122 () Bool)

(assert (= bs!23122 d!91342))

(declare-fun m!401249 () Bool)

(assert (=> bs!23122 m!401249))

(declare-fun m!401251 () Bool)

(assert (=> bs!23122 m!401251))

(assert (=> bm!4292 d!91342))

(push 1)

(assert (not b!269594))

(assert (not b!269590))

(assert (not b!269592))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

