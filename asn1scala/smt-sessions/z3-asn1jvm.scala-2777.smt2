; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67068 () Bool)

(assert start!67068)

(declare-fun b!300523 () Bool)

(declare-fun e!215823 () Bool)

(declare-fun call!5390 () Bool)

(assert (=> b!300523 (= e!215823 call!5390)))

(declare-fun b!300524 () Bool)

(declare-datatypes ((Unit!21021 0))(
  ( (Unit!21022) )
))
(declare-fun e!215819 () Unit!21021)

(declare-fun lt!436061 () Unit!21021)

(assert (=> b!300524 (= e!215819 lt!436061)))

(declare-datatypes ((tuple4!1040 0))(
  ( (tuple4!1041 (_1!13175 (_ BitVec 32)) (_2!13175 (_ BitVec 32)) (_3!1477 (_ BitVec 32)) (_4!520 (_ BitVec 32))) )
))
(declare-fun lt!436063 () tuple4!1040)

(declare-datatypes ((array!18229 0))(
  ( (array!18230 (arr!8999 (Array (_ BitVec 32) (_ BitVec 8))) (size!7916 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18229)

(declare-fun a2!948 () array!18229)

(declare-fun lt!436071 () tuple4!1040)

(declare-fun arrayRangesEqSlicedLemma!188 (array!18229 array!18229 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21021)

(assert (=> b!300524 (= lt!436061 (arrayRangesEqSlicedLemma!188 a1!948 a2!948 (_1!13175 lt!436063) (_2!13175 lt!436063) (_1!13175 lt!436071) (_2!13175 lt!436071)))))

(declare-fun arrayRangesEq!1578 (array!18229 array!18229 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300524 (arrayRangesEq!1578 a1!948 a2!948 (_1!13175 lt!436071) (_2!13175 lt!436071))))

(declare-fun b!300525 () Bool)

(declare-fun e!215821 () Bool)

(declare-fun e!215820 () Bool)

(assert (=> b!300525 (= e!215821 e!215820)))

(declare-fun res!247724 () Bool)

(assert (=> b!300525 (=> (not res!247724) (not e!215820))))

(assert (=> b!300525 (= res!247724 e!215823)))

(declare-fun c!13983 () Bool)

(assert (=> b!300525 (= c!13983 (= (_3!1477 lt!436063) (_4!520 lt!436063)))))

(declare-fun lt!436070 () Unit!21021)

(assert (=> b!300525 (= lt!436070 e!215819)))

(declare-fun c!13984 () Bool)

(assert (=> b!300525 (= c!13984 (bvslt (_1!13175 lt!436071) (_2!13175 lt!436071)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1040)

(assert (=> b!300525 (= lt!436071 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!436067 () (_ BitVec 32))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!300525 (= lt!436067 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!436065 () (_ BitVec 32))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> b!300525 (= lt!436065 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300525 (= lt!436063 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!300526 () Bool)

(declare-fun Unit!21023 () Unit!21021)

(assert (=> b!300526 (= e!215819 Unit!21023)))

(declare-fun bm!5387 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5387 (= call!5390 (byteRangesEq!0 (ite c!13983 (select (arr!8999 a1!948) (_3!1477 lt!436063)) (select (arr!8999 a1!948) (_4!520 lt!436063))) (ite c!13983 (select (arr!8999 a2!948) (_3!1477 lt!436063)) (select (arr!8999 a2!948) (_4!520 lt!436063))) (ite c!13983 lt!436065 #b00000000000000000000000000000000) lt!436067))))

(declare-fun b!300527 () Bool)

(declare-fun res!247721 () Bool)

(assert (=> b!300527 (=> (not res!247721) (not e!215821))))

(declare-fun arrayBitRangesEq!0 (array!18229 array!18229 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!300527 (= res!247721 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!300528 () Bool)

(declare-fun e!215818 () Bool)

(assert (=> b!300528 (= e!215823 e!215818)))

(declare-fun res!247727 () Bool)

(assert (=> b!300528 (= res!247727 (byteRangesEq!0 (select (arr!8999 a1!948) (_3!1477 lt!436063)) (select (arr!8999 a2!948) (_3!1477 lt!436063)) lt!436065 #b00000000000000000000000000000111))))

(assert (=> b!300528 (=> (not res!247727) (not e!215818))))

(declare-fun b!300529 () Bool)

(declare-fun e!215826 () Unit!21021)

(declare-fun Unit!21024 () Unit!21021)

(assert (=> b!300529 (= e!215826 Unit!21024)))

(declare-fun b!300530 () Bool)

(declare-fun lt!436066 () Unit!21021)

(assert (=> b!300530 (= e!215826 lt!436066)))

(declare-fun arrayRangesEqImpliesEq!233 (array!18229 array!18229 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21021)

(assert (=> b!300530 (= lt!436066 (arrayRangesEqImpliesEq!233 a1!948 a2!948 (_1!13175 lt!436063) (_4!520 lt!436071) (_2!13175 lt!436063)))))

(assert (=> b!300530 (= (select (arr!8999 a1!948) (_4!520 lt!436071)) (select (arr!8999 a2!948) (_4!520 lt!436071)))))

(declare-fun b!300531 () Bool)

(declare-fun res!247723 () Bool)

(assert (=> b!300531 (=> (not res!247723) (not e!215821))))

(declare-fun lt!436064 () (_ BitVec 64))

(assert (=> b!300531 (= res!247723 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436064) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!300532 () Bool)

(declare-fun e!215822 () Unit!21021)

(declare-fun Unit!21025 () Unit!21021)

(assert (=> b!300532 (= e!215822 Unit!21025)))

(declare-fun b!300533 () Bool)

(declare-fun e!215824 () Bool)

(assert (=> b!300533 (= e!215824 call!5390)))

(declare-fun b!300534 () Bool)

(assert (=> b!300534 (= e!215820 false)))

(declare-fun lt!436068 () Unit!21021)

(assert (=> b!300534 (= lt!436068 e!215826)))

(declare-fun c!13985 () Bool)

(assert (=> b!300534 (= c!13985 (and (bvslt (_4!520 lt!436071) (_4!520 lt!436063)) (bvslt (_3!1477 lt!436063) (_4!520 lt!436071))))))

(declare-fun lt!436069 () Unit!21021)

(assert (=> b!300534 (= lt!436069 e!215822)))

(declare-fun c!13986 () Bool)

(assert (=> b!300534 (= c!13986 (and (bvslt (_3!1477 lt!436063) (_3!1477 lt!436071)) (bvslt (_3!1477 lt!436071) (_4!520 lt!436063))))))

(declare-fun b!300535 () Bool)

(declare-fun res!247725 () Bool)

(assert (=> b!300535 (= res!247725 (= lt!436067 #b00000000000000000000000000000000))))

(assert (=> b!300535 (=> res!247725 e!215824)))

(assert (=> b!300535 (= e!215818 e!215824)))

(declare-fun res!247726 () Bool)

(declare-fun e!215817 () Bool)

(assert (=> start!67068 (=> (not res!247726) (not e!215817))))

(assert (=> start!67068 (= res!247726 (and (bvsle (size!7916 a1!948) (size!7916 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67068 e!215817))

(assert (=> start!67068 true))

(declare-fun array_inv!7528 (array!18229) Bool)

(assert (=> start!67068 (array_inv!7528 a1!948)))

(assert (=> start!67068 (array_inv!7528 a2!948)))

(declare-fun b!300536 () Bool)

(assert (=> b!300536 (= e!215817 e!215821)))

(declare-fun res!247722 () Bool)

(assert (=> b!300536 (=> (not res!247722) (not e!215821))))

(assert (=> b!300536 (= res!247722 (and (bvsle toBit!258 lt!436064) (bvsle fromBit!258 lt!436064)))))

(assert (=> b!300536 (= lt!436064 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7916 a1!948))))))

(declare-fun b!300537 () Bool)

(declare-fun lt!436062 () Unit!21021)

(assert (=> b!300537 (= e!215822 lt!436062)))

(assert (=> b!300537 (= lt!436062 (arrayRangesEqImpliesEq!233 a1!948 a2!948 (_1!13175 lt!436063) (_3!1477 lt!436071) (_2!13175 lt!436063)))))

(assert (=> b!300537 (= (select (arr!8999 a1!948) (_3!1477 lt!436071)) (select (arr!8999 a2!948) (_3!1477 lt!436071)))))

(assert (= (and start!67068 res!247726) b!300536))

(assert (= (and b!300536 res!247722) b!300527))

(assert (= (and b!300527 res!247721) b!300531))

(assert (= (and b!300531 res!247723) b!300525))

(assert (= (and b!300525 c!13984) b!300524))

(assert (= (and b!300525 (not c!13984)) b!300526))

(assert (= (and b!300525 c!13983) b!300523))

(assert (= (and b!300525 (not c!13983)) b!300528))

(assert (= (and b!300528 res!247727) b!300535))

(assert (= (and b!300535 (not res!247725)) b!300533))

(assert (= (or b!300523 b!300533) bm!5387))

(assert (= (and b!300525 res!247724) b!300534))

(assert (= (and b!300534 c!13986) b!300537))

(assert (= (and b!300534 (not c!13986)) b!300532))

(assert (= (and b!300534 c!13985) b!300530))

(assert (= (and b!300534 (not c!13985)) b!300529))

(declare-fun m!439509 () Bool)

(assert (=> bm!5387 m!439509))

(declare-fun m!439511 () Bool)

(assert (=> bm!5387 m!439511))

(declare-fun m!439513 () Bool)

(assert (=> bm!5387 m!439513))

(declare-fun m!439515 () Bool)

(assert (=> bm!5387 m!439515))

(declare-fun m!439517 () Bool)

(assert (=> bm!5387 m!439517))

(assert (=> b!300528 m!439511))

(assert (=> b!300528 m!439517))

(assert (=> b!300528 m!439511))

(assert (=> b!300528 m!439517))

(declare-fun m!439519 () Bool)

(assert (=> b!300528 m!439519))

(declare-fun m!439521 () Bool)

(assert (=> b!300525 m!439521))

(declare-fun m!439523 () Bool)

(assert (=> b!300525 m!439523))

(declare-fun m!439525 () Bool)

(assert (=> b!300524 m!439525))

(declare-fun m!439527 () Bool)

(assert (=> b!300524 m!439527))

(declare-fun m!439529 () Bool)

(assert (=> b!300527 m!439529))

(declare-fun m!439531 () Bool)

(assert (=> start!67068 m!439531))

(declare-fun m!439533 () Bool)

(assert (=> start!67068 m!439533))

(declare-fun m!439535 () Bool)

(assert (=> b!300530 m!439535))

(declare-fun m!439537 () Bool)

(assert (=> b!300530 m!439537))

(declare-fun m!439539 () Bool)

(assert (=> b!300530 m!439539))

(declare-fun m!439541 () Bool)

(assert (=> b!300537 m!439541))

(declare-fun m!439543 () Bool)

(assert (=> b!300537 m!439543))

(declare-fun m!439545 () Bool)

(assert (=> b!300537 m!439545))

(check-sat (not b!300530) (not b!300527) (not b!300528) (not b!300537) (not b!300525) (not start!67068) (not bm!5387) (not b!300524))
(check-sat)
