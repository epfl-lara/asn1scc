; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70632 () Bool)

(assert start!70632)

(declare-fun res!262708 () Bool)

(declare-fun e!229904 () Bool)

(assert (=> start!70632 (=> (not res!262708) (not e!229904))))

(declare-fun lt!443612 () (_ BitVec 64))

(assert (=> start!70632 (= res!262708 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!443612))))

(declare-datatypes ((array!20009 0))(
  ( (array!20010 (arr!9811 (Array (_ BitVec 32) (_ BitVec 8))) (size!8719 (_ BitVec 32))) )
))
(declare-fun a!422 () array!20009)

(assert (=> start!70632 (= lt!443612 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8719 a!422))))))

(assert (=> start!70632 e!229904))

(declare-fun array_inv!8271 (array!20009) Bool)

(assert (=> start!70632 (array_inv!8271 a!422)))

(declare-fun b!319730 () Bool)

(declare-fun arrayBitRangesEq!0 (array!20009 array!20009 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319730 (= e!229904 (not (arrayBitRangesEq!0 a!422 a!422 lt!443612 lt!443612)))))

(assert (= (and start!70632 res!262708) b!319730))

(declare-fun m!458213 () Bool)

(assert (=> start!70632 m!458213))

(declare-fun m!458215 () Bool)

(assert (=> b!319730 m!458215))

(push 1)

(assert (not b!319730))

(assert (not start!70632))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!319751 () Bool)

(declare-fun e!229933 () Bool)

(declare-fun e!229931 () Bool)

(assert (=> b!319751 (= e!229933 e!229931)))

(declare-fun res!262729 () Bool)

(declare-fun call!6017 () Bool)

(assert (=> b!319751 (= res!262729 call!6017)))

(assert (=> b!319751 (=> (not res!262729) (not e!229931))))

(declare-fun b!319752 () Bool)

(declare-fun res!262725 () Bool)

(declare-fun lt!443625 () (_ BitVec 32))

(assert (=> b!319752 (= res!262725 (= lt!443625 #b00000000000000000000000000000000))))

(declare-fun e!229930 () Bool)

(assert (=> b!319752 (=> res!262725 e!229930)))

(assert (=> b!319752 (= e!229931 e!229930)))

(declare-fun b!319753 () Bool)

(declare-fun e!229932 () Bool)

(assert (=> b!319753 (= e!229932 e!229933)))

(declare-fun c!15298 () Bool)

(declare-datatypes ((tuple4!1314 0))(
  ( (tuple4!1315 (_1!13336 (_ BitVec 32)) (_2!13336 (_ BitVec 32)) (_3!1614 (_ BitVec 32)) (_4!657 (_ BitVec 32))) )
))
(declare-fun lt!443627 () tuple4!1314)

(assert (=> b!319753 (= c!15298 (= (_3!1614 lt!443627) (_4!657 lt!443627)))))

(declare-fun b!319754 () Bool)

(declare-fun e!229935 () Bool)

(declare-fun arrayRangesEq!1811 (array!20009 array!20009 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!319754 (= e!229935 (arrayRangesEq!1811 a!422 a!422 (_1!13336 lt!443627) (_2!13336 lt!443627)))))

(declare-fun b!319755 () Bool)

(assert (=> b!319755 (= e!229933 call!6017)))

(declare-fun d!104764 () Bool)

(declare-fun res!262727 () Bool)

(declare-fun e!229934 () Bool)

(assert (=> d!104764 (=> res!262727 e!229934)))

(assert (=> d!104764 (= res!262727 (bvsge lt!443612 lt!443612))))

(assert (=> d!104764 (= (arrayBitRangesEq!0 a!422 a!422 lt!443612 lt!443612) e!229934)))

(declare-fun b!319756 () Bool)

(assert (=> b!319756 (= e!229934 e!229932)))

(declare-fun res!262728 () Bool)

(assert (=> b!319756 (=> (not res!262728) (not e!229932))))

(assert (=> b!319756 (= res!262728 e!229935)))

(declare-fun res!262726 () Bool)

(assert (=> b!319756 (=> res!262726 e!229935)))

(assert (=> b!319756 (= res!262726 (bvsge (_1!13336 lt!443627) (_2!13336 lt!443627)))))

(assert (=> b!319756 (= lt!443625 ((_ extract 31 0) (bvsrem lt!443612 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!443626 () (_ BitVec 32))

(assert (=> b!319756 (= lt!443626 ((_ extract 31 0) (bvsrem lt!443612 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1314)

(assert (=> b!319756 (= lt!443627 (arrayBitIndices!0 lt!443612 lt!443612))))

(declare-fun b!319757 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!319757 (= e!229930 (byteRangesEq!0 (select (arr!9811 a!422) (_4!657 lt!443627)) (select (arr!9811 a!422) (_4!657 lt!443627)) #b00000000000000000000000000000000 lt!443625))))

(declare-fun bm!6014 () Bool)

(assert (=> bm!6014 (= call!6017 (byteRangesEq!0 (select (arr!9811 a!422) (_3!1614 lt!443627)) (select (arr!9811 a!422) (_3!1614 lt!443627)) lt!443626 (ite c!15298 lt!443625 #b00000000000000000000000000001000)))))

(assert (= (and d!104764 (not res!262727)) b!319756))

(assert (= (and b!319756 (not res!262726)) b!319754))

(assert (= (and b!319756 res!262728) b!319753))

(assert (= (and b!319753 c!15298) b!319755))

(assert (= (and b!319753 (not c!15298)) b!319751))

(assert (= (and b!319751 res!262729) b!319752))

(assert (= (and b!319752 (not res!262725)) b!319757))

(assert (= (or b!319755 b!319751) bm!6014))

(declare-fun m!458225 () Bool)

(assert (=> b!319754 m!458225))

(declare-fun m!458227 () Bool)

(assert (=> b!319756 m!458227))

(declare-fun m!458229 () Bool)

(assert (=> b!319757 m!458229))

(assert (=> b!319757 m!458229))

(assert (=> b!319757 m!458229))

(assert (=> b!319757 m!458229))

(declare-fun m!458231 () Bool)

(assert (=> b!319757 m!458231))

(declare-fun m!458233 () Bool)

(assert (=> bm!6014 m!458233))

(assert (=> bm!6014 m!458233))

(assert (=> bm!6014 m!458233))

(assert (=> bm!6014 m!458233))

(declare-fun m!458235 () Bool)

(assert (=> bm!6014 m!458235))

(assert (=> b!319730 d!104764))

(declare-fun d!104770 () Bool)

(assert (=> d!104770 (= (array_inv!8271 a!422) (bvsge (size!8719 a!422) #b00000000000000000000000000000000))))

(assert (=> start!70632 d!104770))

(push 1)

(assert (not b!319756))

(assert (not b!319757))

(assert (not bm!6014))

(assert (not b!319754))

(check-sat)

(pop 1)

(push 1)

(check-sat)

