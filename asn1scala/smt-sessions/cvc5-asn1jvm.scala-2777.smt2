; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67066 () Bool)

(assert start!67066)

(declare-fun b!300478 () Bool)

(declare-datatypes ((Unit!21016 0))(
  ( (Unit!21017) )
))
(declare-fun e!215785 () Unit!21016)

(declare-fun Unit!21018 () Unit!21016)

(assert (=> b!300478 (= e!215785 Unit!21018)))

(declare-fun b!300479 () Bool)

(declare-fun e!215789 () Unit!21016)

(declare-fun lt!436034 () Unit!21016)

(assert (=> b!300479 (= e!215789 lt!436034)))

(declare-datatypes ((tuple4!1038 0))(
  ( (tuple4!1039 (_1!13174 (_ BitVec 32)) (_2!13174 (_ BitVec 32)) (_3!1476 (_ BitVec 32)) (_4!519 (_ BitVec 32))) )
))
(declare-fun lt!436028 () tuple4!1038)

(declare-fun lt!436029 () tuple4!1038)

(declare-datatypes ((array!18227 0))(
  ( (array!18228 (arr!8998 (Array (_ BitVec 32) (_ BitVec 8))) (size!7915 (_ BitVec 32))) )
))
(declare-fun a2!948 () array!18227)

(declare-fun a1!948 () array!18227)

(declare-fun arrayRangesEqSlicedLemma!187 (array!18227 array!18227 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21016)

(assert (=> b!300479 (= lt!436034 (arrayRangesEqSlicedLemma!187 a1!948 a2!948 (_1!13174 lt!436028) (_2!13174 lt!436028) (_1!13174 lt!436029) (_2!13174 lt!436029)))))

(declare-fun arrayRangesEq!1577 (array!18227 array!18227 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300479 (arrayRangesEq!1577 a1!948 a2!948 (_1!13174 lt!436029) (_2!13174 lt!436029))))

(declare-fun b!300480 () Bool)

(declare-fun e!215784 () Bool)

(declare-fun e!215793 () Bool)

(assert (=> b!300480 (= e!215784 e!215793)))

(declare-fun res!247706 () Bool)

(declare-fun lt!436032 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300480 (= res!247706 (byteRangesEq!0 (select (arr!8998 a1!948) (_3!1476 lt!436028)) (select (arr!8998 a2!948) (_3!1476 lt!436028)) lt!436032 #b00000000000000000000000000000111))))

(assert (=> b!300480 (=> (not res!247706) (not e!215793))))

(declare-fun b!300481 () Bool)

(declare-fun res!247702 () Bool)

(declare-fun e!215790 () Bool)

(assert (=> b!300481 (=> (not res!247702) (not e!215790))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!436038 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!300481 (= res!247702 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436038) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!300482 () Bool)

(declare-fun call!5387 () Bool)

(assert (=> b!300482 (= e!215784 call!5387)))

(declare-fun res!247705 () Bool)

(declare-fun e!215783 () Bool)

(assert (=> start!67066 (=> (not res!247705) (not e!215783))))

(assert (=> start!67066 (= res!247705 (and (bvsle (size!7915 a1!948) (size!7915 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67066 e!215783))

(assert (=> start!67066 true))

(declare-fun array_inv!7527 (array!18227) Bool)

(assert (=> start!67066 (array_inv!7527 a1!948)))

(assert (=> start!67066 (array_inv!7527 a2!948)))

(declare-fun b!300483 () Bool)

(declare-fun e!215791 () Bool)

(assert (=> b!300483 (= e!215791 false)))

(declare-fun lt!436031 () Unit!21016)

(assert (=> b!300483 (= lt!436031 e!215785)))

(declare-fun c!13972 () Bool)

(assert (=> b!300483 (= c!13972 (and (bvslt (_4!519 lt!436029) (_4!519 lt!436028)) (bvslt (_3!1476 lt!436028) (_4!519 lt!436029))))))

(declare-fun lt!436037 () Unit!21016)

(declare-fun e!215788 () Unit!21016)

(assert (=> b!300483 (= lt!436037 e!215788)))

(declare-fun c!13974 () Bool)

(assert (=> b!300483 (= c!13974 (and (bvslt (_3!1476 lt!436028) (_3!1476 lt!436029)) (bvslt (_3!1476 lt!436029) (_4!519 lt!436028))))))

(declare-fun b!300484 () Bool)

(declare-fun Unit!21019 () Unit!21016)

(assert (=> b!300484 (= e!215789 Unit!21019)))

(declare-fun b!300485 () Bool)

(declare-fun res!247701 () Bool)

(declare-fun lt!436035 () (_ BitVec 32))

(assert (=> b!300485 (= res!247701 (= lt!436035 #b00000000000000000000000000000000))))

(declare-fun e!215786 () Bool)

(assert (=> b!300485 (=> res!247701 e!215786)))

(assert (=> b!300485 (= e!215793 e!215786)))

(declare-fun b!300486 () Bool)

(assert (=> b!300486 (= e!215786 call!5387)))

(declare-fun b!300487 () Bool)

(assert (=> b!300487 (= e!215790 e!215791)))

(declare-fun res!247704 () Bool)

(assert (=> b!300487 (=> (not res!247704) (not e!215791))))

(assert (=> b!300487 (= res!247704 e!215784)))

(declare-fun c!13971 () Bool)

(assert (=> b!300487 (= c!13971 (= (_3!1476 lt!436028) (_4!519 lt!436028)))))

(declare-fun lt!436030 () Unit!21016)

(assert (=> b!300487 (= lt!436030 e!215789)))

(declare-fun c!13973 () Bool)

(assert (=> b!300487 (= c!13973 (bvslt (_1!13174 lt!436029) (_2!13174 lt!436029)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1038)

(assert (=> b!300487 (= lt!436029 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!300487 (= lt!436035 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300487 (= lt!436032 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300487 (= lt!436028 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!300488 () Bool)

(declare-fun Unit!21020 () Unit!21016)

(assert (=> b!300488 (= e!215788 Unit!21020)))

(declare-fun b!300489 () Bool)

(declare-fun res!247700 () Bool)

(assert (=> b!300489 (=> (not res!247700) (not e!215790))))

(declare-fun arrayBitRangesEq!0 (array!18227 array!18227 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!300489 (= res!247700 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun bm!5384 () Bool)

(assert (=> bm!5384 (= call!5387 (byteRangesEq!0 (ite c!13971 (select (arr!8998 a1!948) (_3!1476 lt!436028)) (select (arr!8998 a1!948) (_4!519 lt!436028))) (ite c!13971 (select (arr!8998 a2!948) (_3!1476 lt!436028)) (select (arr!8998 a2!948) (_4!519 lt!436028))) (ite c!13971 lt!436032 #b00000000000000000000000000000000) lt!436035))))

(declare-fun b!300490 () Bool)

(declare-fun lt!436033 () Unit!21016)

(assert (=> b!300490 (= e!215788 lt!436033)))

(declare-fun arrayRangesEqImpliesEq!232 (array!18227 array!18227 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21016)

(assert (=> b!300490 (= lt!436033 (arrayRangesEqImpliesEq!232 a1!948 a2!948 (_1!13174 lt!436028) (_3!1476 lt!436029) (_2!13174 lt!436028)))))

(assert (=> b!300490 (= (select (arr!8998 a1!948) (_3!1476 lt!436029)) (select (arr!8998 a2!948) (_3!1476 lt!436029)))))

(declare-fun b!300491 () Bool)

(assert (=> b!300491 (= e!215783 e!215790)))

(declare-fun res!247703 () Bool)

(assert (=> b!300491 (=> (not res!247703) (not e!215790))))

(assert (=> b!300491 (= res!247703 (and (bvsle toBit!258 lt!436038) (bvsle fromBit!258 lt!436038)))))

(assert (=> b!300491 (= lt!436038 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7915 a1!948))))))

(declare-fun b!300492 () Bool)

(declare-fun lt!436036 () Unit!21016)

(assert (=> b!300492 (= e!215785 lt!436036)))

(assert (=> b!300492 (= lt!436036 (arrayRangesEqImpliesEq!232 a1!948 a2!948 (_1!13174 lt!436028) (_4!519 lt!436029) (_2!13174 lt!436028)))))

(assert (=> b!300492 (= (select (arr!8998 a1!948) (_4!519 lt!436029)) (select (arr!8998 a2!948) (_4!519 lt!436029)))))

(assert (= (and start!67066 res!247705) b!300491))

(assert (= (and b!300491 res!247703) b!300489))

(assert (= (and b!300489 res!247700) b!300481))

(assert (= (and b!300481 res!247702) b!300487))

(assert (= (and b!300487 c!13973) b!300479))

(assert (= (and b!300487 (not c!13973)) b!300484))

(assert (= (and b!300487 c!13971) b!300482))

(assert (= (and b!300487 (not c!13971)) b!300480))

(assert (= (and b!300480 res!247706) b!300485))

(assert (= (and b!300485 (not res!247701)) b!300486))

(assert (= (or b!300482 b!300486) bm!5384))

(assert (= (and b!300487 res!247704) b!300483))

(assert (= (and b!300483 c!13974) b!300490))

(assert (= (and b!300483 (not c!13974)) b!300488))

(assert (= (and b!300483 c!13972) b!300492))

(assert (= (and b!300483 (not c!13972)) b!300478))

(declare-fun m!439471 () Bool)

(assert (=> b!300489 m!439471))

(declare-fun m!439473 () Bool)

(assert (=> start!67066 m!439473))

(declare-fun m!439475 () Bool)

(assert (=> start!67066 m!439475))

(declare-fun m!439477 () Bool)

(assert (=> b!300490 m!439477))

(declare-fun m!439479 () Bool)

(assert (=> b!300490 m!439479))

(declare-fun m!439481 () Bool)

(assert (=> b!300490 m!439481))

(declare-fun m!439483 () Bool)

(assert (=> b!300480 m!439483))

(declare-fun m!439485 () Bool)

(assert (=> b!300480 m!439485))

(assert (=> b!300480 m!439483))

(assert (=> b!300480 m!439485))

(declare-fun m!439487 () Bool)

(assert (=> b!300480 m!439487))

(declare-fun m!439489 () Bool)

(assert (=> b!300479 m!439489))

(declare-fun m!439491 () Bool)

(assert (=> b!300479 m!439491))

(declare-fun m!439493 () Bool)

(assert (=> b!300492 m!439493))

(declare-fun m!439495 () Bool)

(assert (=> b!300492 m!439495))

(declare-fun m!439497 () Bool)

(assert (=> b!300492 m!439497))

(declare-fun m!439499 () Bool)

(assert (=> b!300487 m!439499))

(declare-fun m!439501 () Bool)

(assert (=> b!300487 m!439501))

(assert (=> bm!5384 m!439483))

(declare-fun m!439503 () Bool)

(assert (=> bm!5384 m!439503))

(declare-fun m!439505 () Bool)

(assert (=> bm!5384 m!439505))

(assert (=> bm!5384 m!439485))

(declare-fun m!439507 () Bool)

(assert (=> bm!5384 m!439507))

(push 1)

(assert (not b!300479))

(assert (not b!300480))

(assert (not bm!5384))

(assert (not b!300492))

(assert (not b!300489))

(assert (not b!300487))

(assert (not start!67066))

(assert (not b!300490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

