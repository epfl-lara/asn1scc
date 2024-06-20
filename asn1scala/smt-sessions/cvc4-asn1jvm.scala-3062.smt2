; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70816 () Bool)

(assert start!70816)

(declare-fun b!320386 () Bool)

(declare-fun res!263266 () Bool)

(declare-fun e!230528 () Bool)

(assert (=> b!320386 (=> (not res!263266) (not e!230528))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> b!320386 (= res!263266 (not (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!320384 () Bool)

(declare-fun e!230529 () Bool)

(assert (=> b!320384 (= e!230529 e!230528)))

(declare-fun res!263268 () Bool)

(assert (=> b!320384 (=> (not res!263268) (not e!230528))))

(declare-fun lt!443941 () (_ BitVec 64))

(assert (=> b!320384 (= res!263268 (bvsle i!979 lt!443941))))

(declare-datatypes ((array!20133 0))(
  ( (array!20134 (arr!9867 (Array (_ BitVec 32) (_ BitVec 8))) (size!8775 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20133)

(assert (=> b!320384 (= lt!443941 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8775 a!425))))))

(declare-fun b!320385 () Bool)

(declare-fun res!263269 () Bool)

(assert (=> b!320385 (=> (not res!263269) (not e!230528))))

(declare-fun arrayBitRangesEq!0 (array!20133 array!20133 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320385 (= res!263269 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443941))))

(declare-fun b!320387 () Bool)

(assert (=> b!320387 (= e!230528 (not (arrayBitRangesEq!0 a!425 a!425 #b0000000000000000000000000000000000000000000000000000000000000000 lt!443941)))))

(declare-datatypes ((Unit!21963 0))(
  ( (Unit!21964) )
))
(declare-fun lt!443942 () Unit!21963)

(declare-fun rec!17 (array!20133 (_ BitVec 64)) Unit!21963)

(assert (=> b!320387 (= lt!443942 (rec!17 a!425 (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!263267 () Bool)

(assert (=> start!70816 (=> (not res!263267) (not e!230529))))

(assert (=> start!70816 (= res!263267 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70816 e!230529))

(assert (=> start!70816 true))

(declare-fun array_inv!8327 (array!20133) Bool)

(assert (=> start!70816 (array_inv!8327 a!425)))

(assert (= (and start!70816 res!263267) b!320384))

(assert (= (and b!320384 res!263268) b!320385))

(assert (= (and b!320385 res!263269) b!320386))

(assert (= (and b!320386 res!263266) b!320387))

(declare-fun m!458721 () Bool)

(assert (=> b!320385 m!458721))

(declare-fun m!458723 () Bool)

(assert (=> b!320387 m!458723))

(declare-fun m!458725 () Bool)

(assert (=> b!320387 m!458725))

(declare-fun m!458727 () Bool)

(assert (=> start!70816 m!458727))

(push 1)

(assert (not b!320387))

(assert (not start!70816))

(assert (not b!320385))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!320451 () Bool)

(declare-fun e!230587 () Bool)

(declare-fun call!6054 () Bool)

(assert (=> b!320451 (= e!230587 call!6054)))

(declare-fun b!320452 () Bool)

(declare-fun e!230586 () Bool)

(declare-datatypes ((tuple4!1334 0))(
  ( (tuple4!1335 (_1!13346 (_ BitVec 32)) (_2!13346 (_ BitVec 32)) (_3!1624 (_ BitVec 32)) (_4!667 (_ BitVec 32))) )
))
(declare-fun lt!443971 () tuple4!1334)

(declare-fun arrayRangesEq!1820 (array!20133 array!20133 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320452 (= e!230586 (arrayRangesEq!1820 a!425 a!425 (_1!13346 lt!443971) (_2!13346 lt!443971)))))

(declare-fun b!320453 () Bool)

(declare-fun e!230588 () Bool)

(declare-fun e!230589 () Bool)

(assert (=> b!320453 (= e!230588 e!230589)))

(declare-fun res!263315 () Bool)

(assert (=> b!320453 (=> (not res!263315) (not e!230589))))

(assert (=> b!320453 (= res!263315 e!230586)))

(declare-fun res!263317 () Bool)

(assert (=> b!320453 (=> res!263317 e!230586)))

(assert (=> b!320453 (= res!263317 (bvsge (_1!13346 lt!443971) (_2!13346 lt!443971)))))

(declare-fun lt!443972 () (_ BitVec 32))

(assert (=> b!320453 (= lt!443972 ((_ extract 31 0) (bvsrem lt!443941 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!443970 () (_ BitVec 32))

(assert (=> b!320453 (= lt!443970 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1334)

(assert (=> b!320453 (= lt!443971 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!443941))))

(declare-fun bm!6051 () Bool)

(declare-fun c!15353 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!6051 (= call!6054 (byteRangesEq!0 (ite c!15353 (select (arr!9867 a!425) (_3!1624 lt!443971)) (select (arr!9867 a!425) (_4!667 lt!443971))) (ite c!15353 (select (arr!9867 a!425) (_3!1624 lt!443971)) (select (arr!9867 a!425) (_4!667 lt!443971))) (ite c!15353 lt!443970 #b00000000000000000000000000000000) lt!443972))))

(declare-fun d!104926 () Bool)

(declare-fun res!263318 () Bool)

(assert (=> d!104926 (=> res!263318 e!230588)))

(assert (=> d!104926 (= res!263318 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!443941))))

(assert (=> d!104926 (= (arrayBitRangesEq!0 a!425 a!425 #b0000000000000000000000000000000000000000000000000000000000000000 lt!443941) e!230588)))

(declare-fun b!320454 () Bool)

(declare-fun e!230585 () Bool)

(assert (=> b!320454 (= e!230585 call!6054)))

(declare-fun b!320455 () Bool)

(assert (=> b!320455 (= e!230589 e!230585)))

(assert (=> b!320455 (= c!15353 (= (_3!1624 lt!443971) (_4!667 lt!443971)))))

(declare-fun b!320456 () Bool)

(declare-fun res!263316 () Bool)

(assert (=> b!320456 (= res!263316 (= lt!443972 #b00000000000000000000000000000000))))

(assert (=> b!320456 (=> res!263316 e!230587)))

(declare-fun e!230584 () Bool)

(assert (=> b!320456 (= e!230584 e!230587)))

(declare-fun b!320457 () Bool)

(assert (=> b!320457 (= e!230585 e!230584)))

(declare-fun res!263319 () Bool)

(assert (=> b!320457 (= res!263319 (byteRangesEq!0 (select (arr!9867 a!425) (_3!1624 lt!443971)) (select (arr!9867 a!425) (_3!1624 lt!443971)) lt!443970 #b00000000000000000000000000001000))))

(assert (=> b!320457 (=> (not res!263319) (not e!230584))))

(assert (= (and d!104926 (not res!263318)) b!320453))

(assert (= (and b!320453 (not res!263317)) b!320452))

(assert (= (and b!320453 res!263315) b!320455))

(assert (= (and b!320455 c!15353) b!320454))

(assert (= (and b!320455 (not c!15353)) b!320457))

(assert (= (and b!320457 res!263319) b!320456))

(assert (= (and b!320456 (not res!263316)) b!320451))

(assert (= (or b!320454 b!320451) bm!6051))

(declare-fun m!458759 () Bool)

(assert (=> b!320452 m!458759))

(declare-fun m!458763 () Bool)

(assert (=> b!320453 m!458763))

(declare-fun m!458769 () Bool)

(assert (=> bm!6051 m!458769))

(declare-fun m!458771 () Bool)

(assert (=> bm!6051 m!458771))

(assert (=> bm!6051 m!458771))

(declare-fun m!458773 () Bool)

(assert (=> bm!6051 m!458773))

(assert (=> bm!6051 m!458773))

(assert (=> b!320457 m!458773))

(assert (=> b!320457 m!458773))

(assert (=> b!320457 m!458773))

(assert (=> b!320457 m!458773))

(declare-fun m!458775 () Bool)

(assert (=> b!320457 m!458775))

(assert (=> b!320387 d!104926))

(declare-fun d!104934 () Bool)

(declare-fun e!230606 () Bool)

(assert (=> d!104934 e!230606))

(declare-fun res!263328 () Bool)

(assert (=> d!104934 (=> (not res!263328) (not e!230606))))

(declare-fun lt!443989 () (_ BitVec 64))

(assert (=> d!104934 (= res!263328 (or (= lt!443989 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!443989 #b0000000000000000000000000000000000000000000000000000000000001000) lt!443989))))))

(assert (=> d!104934 (= lt!443989 ((_ sign_extend 32) (size!8775 a!425)))))

(declare-fun lt!443990 () Unit!21963)

(declare-fun e!230607 () Unit!21963)

(assert (=> d!104934 (= lt!443990 e!230607)))

(declare-fun c!15362 () Bool)

(assert (=> d!104934 (= c!15362 (= (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!104934 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001) (bvmul ((_ sign_extend 32) (size!8775 a!425)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!104934 (= (rec!17 a!425 (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!443990)))

(declare-fun b!320482 () Bool)

(declare-fun Unit!21967 () Unit!21963)

(assert (=> b!320482 (= e!230607 Unit!21967)))

(declare-fun b!320483 () Bool)

(assert (=> b!320483 (= e!230607 (rec!17 a!425 (bvsub (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!320484 () Bool)

(assert (=> b!320484 (= e!230606 (arrayBitRangesEq!0 a!425 a!425 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!8775 a!425)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!104934 c!15362) b!320482))

(assert (= (and d!104934 (not c!15362)) b!320483))

(assert (= (and d!104934 res!263328) b!320484))

(declare-fun m!458785 () Bool)

(assert (=> b!320483 m!458785))

(declare-fun m!458787 () Bool)

(assert (=> b!320484 m!458787))

(assert (=> b!320387 d!104934))

(declare-fun d!104940 () Bool)

(assert (=> d!104940 (= (array_inv!8327 a!425) (bvsge (size!8775 a!425) #b00000000000000000000000000000000))))

(assert (=> start!70816 d!104940))

(declare-fun b!320492 () Bool)

(declare-fun e!230617 () Bool)

(declare-fun call!6056 () Bool)

(assert (=> b!320492 (= e!230617 call!6056)))

(declare-fun b!320493 () Bool)

(declare-fun e!230616 () Bool)

(declare-fun lt!443995 () tuple4!1334)

(assert (=> b!320493 (= e!230616 (arrayRangesEq!1820 a!425 a!425 (_1!13346 lt!443995) (_2!13346 lt!443995)))))

(declare-fun b!320494 () Bool)

(declare-fun e!230618 () Bool)

(declare-fun e!230619 () Bool)

(assert (=> b!320494 (= e!230618 e!230619)))

(declare-fun res!263334 () Bool)

(assert (=> b!320494 (=> (not res!263334) (not e!230619))))

(assert (=> b!320494 (= res!263334 e!230616)))

(declare-fun res!263336 () Bool)

(assert (=> b!320494 (=> res!263336 e!230616)))

(assert (=> b!320494 (= res!263336 (bvsge (_1!13346 lt!443995) (_2!13346 lt!443995)))))

(declare-fun lt!443996 () (_ BitVec 32))

(assert (=> b!320494 (= lt!443996 ((_ extract 31 0) (bvsrem lt!443941 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!443994 () (_ BitVec 32))

(assert (=> b!320494 (= lt!443994 ((_ extract 31 0) (bvsrem i!979 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!320494 (= lt!443995 (arrayBitIndices!0 i!979 lt!443941))))

(declare-fun bm!6053 () Bool)

(declare-fun c!15364 () Bool)

(assert (=> bm!6053 (= call!6056 (byteRangesEq!0 (ite c!15364 (select (arr!9867 a!425) (_3!1624 lt!443995)) (select (arr!9867 a!425) (_4!667 lt!443995))) (ite c!15364 (select (arr!9867 a!425) (_3!1624 lt!443995)) (select (arr!9867 a!425) (_4!667 lt!443995))) (ite c!15364 lt!443994 #b00000000000000000000000000000000) lt!443996))))

(declare-fun d!104942 () Bool)

(declare-fun res!263337 () Bool)

(assert (=> d!104942 (=> res!263337 e!230618)))

(assert (=> d!104942 (= res!263337 (bvsge i!979 lt!443941))))

(assert (=> d!104942 (= (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443941) e!230618)))

(declare-fun b!320495 () Bool)

(declare-fun e!230615 () Bool)

(assert (=> b!320495 (= e!230615 call!6056)))

(declare-fun b!320496 () Bool)

(assert (=> b!320496 (= e!230619 e!230615)))

(assert (=> b!320496 (= c!15364 (= (_3!1624 lt!443995) (_4!667 lt!443995)))))

(declare-fun b!320497 () Bool)

(declare-fun res!263335 () Bool)

(assert (=> b!320497 (= res!263335 (= lt!443996 #b00000000000000000000000000000000))))

(assert (=> b!320497 (=> res!263335 e!230617)))

(declare-fun e!230614 () Bool)

(assert (=> b!320497 (= e!230614 e!230617)))

(declare-fun b!320498 () Bool)

(assert (=> b!320498 (= e!230615 e!230614)))

(declare-fun res!263338 () Bool)

(assert (=> b!320498 (= res!263338 (byteRangesEq!0 (select (arr!9867 a!425) (_3!1624 lt!443995)) (select (arr!9867 a!425) (_3!1624 lt!443995)) lt!443994 #b00000000000000000000000000001000))))

(assert (=> b!320498 (=> (not res!263338) (not e!230614))))

(assert (= (and d!104942 (not res!263337)) b!320494))

(assert (= (and b!320494 (not res!263336)) b!320493))

(assert (= (and b!320494 res!263334) b!320496))

(assert (= (and b!320496 c!15364) b!320495))

(assert (= (and b!320496 (not c!15364)) b!320498))

(assert (= (and b!320498 res!263338) b!320497))

(assert (= (and b!320497 (not res!263335)) b!320492))

(assert (= (or b!320495 b!320492) bm!6053))

(declare-fun m!458801 () Bool)

(assert (=> b!320493 m!458801))

(declare-fun m!458803 () Bool)

(assert (=> b!320494 m!458803))

(declare-fun m!458805 () Bool)

(assert (=> bm!6053 m!458805))

(declare-fun m!458807 () Bool)

(assert (=> bm!6053 m!458807))

(assert (=> bm!6053 m!458807))

(declare-fun m!458809 () Bool)

(assert (=> bm!6053 m!458809))

(assert (=> bm!6053 m!458809))

(assert (=> b!320498 m!458809))

(assert (=> b!320498 m!458809))

(assert (=> b!320498 m!458809))

(assert (=> b!320498 m!458809))

(declare-fun m!458811 () Bool)

(assert (=> b!320498 m!458811))

(assert (=> b!320385 d!104942))

(push 1)

