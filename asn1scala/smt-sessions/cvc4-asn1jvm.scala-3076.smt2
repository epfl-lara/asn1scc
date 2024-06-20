; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70926 () Bool)

(assert start!70926)

(declare-fun res!263383 () Bool)

(declare-fun e!230744 () Bool)

(assert (=> start!70926 (=> (not res!263383) (not e!230744))))

(declare-fun lt!444041 () (_ BitVec 64))

(assert (=> start!70926 (= res!263383 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444041))))

(declare-datatypes ((array!20206 0))(
  ( (array!20207 (arr!9900 (Array (_ BitVec 32) (_ BitVec 8))) (size!8808 (_ BitVec 32))) )
))
(declare-fun a!440 () array!20206)

(assert (=> start!70926 (= lt!444041 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8808 a!440))))))

(assert (=> start!70926 e!230744))

(declare-fun array_inv!8360 (array!20206) Bool)

(assert (=> start!70926 (array_inv!8360 a!440)))

(declare-fun b!320599 () Bool)

(declare-fun arrayBitRangesEq!0 (array!20206 array!20206 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320599 (= e!230744 (not (arrayBitRangesEq!0 a!440 a!440 lt!444041 lt!444041)))))

(assert (= (and start!70926 res!263383) b!320599))

(declare-fun m!458973 () Bool)

(assert (=> start!70926 m!458973))

(declare-fun m!458975 () Bool)

(assert (=> b!320599 m!458975))

(push 1)

(assert (not b!320599))

(assert (not start!70926))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!320656 () Bool)

(declare-fun e!230799 () Bool)

(declare-fun call!6065 () Bool)

(assert (=> b!320656 (= e!230799 call!6065)))

(declare-fun b!320658 () Bool)

(declare-fun res!263426 () Bool)

(declare-fun lt!444066 () (_ BitVec 32))

(assert (=> b!320658 (= res!263426 (= lt!444066 #b00000000000000000000000000000000))))

(assert (=> b!320658 (=> res!263426 e!230799)))

(declare-fun e!230794 () Bool)

(assert (=> b!320658 (= e!230794 e!230799)))

(declare-fun b!320659 () Bool)

(declare-fun e!230797 () Bool)

(declare-datatypes ((tuple4!1342 0))(
  ( (tuple4!1343 (_1!13350 (_ BitVec 32)) (_2!13350 (_ BitVec 32)) (_3!1628 (_ BitVec 32)) (_4!671 (_ BitVec 32))) )
))
(declare-fun lt!444068 () tuple4!1342)

(declare-fun arrayRangesEq!1824 (array!20206 array!20206 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320659 (= e!230797 (arrayRangesEq!1824 a!440 a!440 (_1!13350 lt!444068) (_2!13350 lt!444068)))))

(declare-fun b!320660 () Bool)

(declare-fun e!230795 () Bool)

(declare-fun e!230796 () Bool)

(assert (=> b!320660 (= e!230795 e!230796)))

(declare-fun res!263424 () Bool)

(assert (=> b!320660 (=> (not res!263424) (not e!230796))))

(assert (=> b!320660 (= res!263424 e!230797)))

(declare-fun res!263425 () Bool)

(assert (=> b!320660 (=> res!263425 e!230797)))

(assert (=> b!320660 (= res!263425 (bvsge (_1!13350 lt!444068) (_2!13350 lt!444068)))))

(assert (=> b!320660 (= lt!444066 ((_ extract 31 0) (bvsrem lt!444041 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!444067 () (_ BitVec 32))

(assert (=> b!320660 (= lt!444067 ((_ extract 31 0) (bvsrem lt!444041 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1342)

(assert (=> b!320660 (= lt!444068 (arrayBitIndices!0 lt!444041 lt!444041))))

(declare-fun b!320661 () Bool)

(declare-fun e!230798 () Bool)

(assert (=> b!320661 (= e!230798 call!6065)))

(declare-fun b!320657 () Bool)

(assert (=> b!320657 (= e!230798 e!230794)))

(declare-fun res!263427 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320657 (= res!263427 (byteRangesEq!0 (select (arr!9900 a!440) (_3!1628 lt!444068)) (select (arr!9900 a!440) (_3!1628 lt!444068)) lt!444067 #b00000000000000000000000000001000))))

(assert (=> b!320657 (=> (not res!263427) (not e!230794))))

(declare-fun d!104984 () Bool)

(declare-fun res!263428 () Bool)

(assert (=> d!104984 (=> res!263428 e!230795)))

(assert (=> d!104984 (= res!263428 (bvsge lt!444041 lt!444041))))

(assert (=> d!104984 (= (arrayBitRangesEq!0 a!440 a!440 lt!444041 lt!444041) e!230795)))

(declare-fun c!15373 () Bool)

(declare-fun bm!6062 () Bool)

(assert (=> bm!6062 (= call!6065 (byteRangesEq!0 (ite c!15373 (select (arr!9900 a!440) (_3!1628 lt!444068)) (select (arr!9900 a!440) (_4!671 lt!444068))) (ite c!15373 (select (arr!9900 a!440) (_3!1628 lt!444068)) (select (arr!9900 a!440) (_4!671 lt!444068))) (ite c!15373 lt!444067 #b00000000000000000000000000000000) lt!444066))))

(declare-fun b!320662 () Bool)

(assert (=> b!320662 (= e!230796 e!230798)))

(assert (=> b!320662 (= c!15373 (= (_3!1628 lt!444068) (_4!671 lt!444068)))))

(assert (= (and d!104984 (not res!263428)) b!320660))

(assert (= (and b!320660 (not res!263425)) b!320659))

(assert (= (and b!320660 res!263424) b!320662))

(assert (= (and b!320662 c!15373) b!320661))

(assert (= (and b!320662 (not c!15373)) b!320657))

(assert (= (and b!320657 res!263427) b!320658))

(assert (= (and b!320658 (not res!263426)) b!320656))

(assert (= (or b!320661 b!320656) bm!6062))

(declare-fun m!459001 () Bool)

(assert (=> b!320659 m!459001))

(declare-fun m!459003 () Bool)

(assert (=> b!320660 m!459003))

(declare-fun m!459005 () Bool)

(assert (=> b!320657 m!459005))

(assert (=> b!320657 m!459005))

(assert (=> b!320657 m!459005))

(assert (=> b!320657 m!459005))

(declare-fun m!459007 () Bool)

(assert (=> b!320657 m!459007))

(declare-fun m!459009 () Bool)

(assert (=> bm!6062 m!459009))

(assert (=> bm!6062 m!459005))

(declare-fun m!459011 () Bool)

(assert (=> bm!6062 m!459011))

(assert (=> bm!6062 m!459005))

(assert (=> bm!6062 m!459009))

