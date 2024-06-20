; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67480 () Bool)

(assert start!67480)

(declare-fun b!303032 () Bool)

(declare-fun e!217976 () Bool)

(declare-fun e!217975 () Bool)

(assert (=> b!303032 (= e!217976 e!217975)))

(declare-fun res!249402 () Bool)

(assert (=> b!303032 (=> (not res!249402) (not e!217975))))

(declare-fun lt!437559 () (_ BitVec 64))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!303032 (= res!249402 (and (bvsle toBit!258 lt!437559) (bvsle fromBit!258 lt!437559)))))

(declare-datatypes ((array!18414 0))(
  ( (array!18415 (arr!9078 (Array (_ BitVec 32) (_ BitVec 8))) (size!7995 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18414)

(assert (=> b!303032 (= lt!437559 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7995 a1!948))))))

(declare-fun b!303033 () Bool)

(declare-datatypes ((tuple4!1132 0))(
  ( (tuple4!1133 (_1!13221 (_ BitVec 32)) (_2!13221 (_ BitVec 32)) (_3!1523 (_ BitVec 32)) (_4!566 (_ BitVec 32))) )
))
(declare-fun lt!437558 () tuple4!1132)

(assert (=> b!303033 (= e!217975 (and (= (_3!1523 lt!437558) (_4!566 lt!437558)) (or (bvslt (_3!1523 lt!437558) #b00000000000000000000000000000000) (bvsge (_3!1523 lt!437558) (size!7995 a1!948)))))))

(declare-datatypes ((Unit!21166 0))(
  ( (Unit!21167) )
))
(declare-fun lt!437562 () Unit!21166)

(declare-fun e!217978 () Unit!21166)

(assert (=> b!303033 (= lt!437562 e!217978)))

(declare-fun c!14397 () Bool)

(declare-fun lt!437561 () tuple4!1132)

(assert (=> b!303033 (= c!14397 (bvslt (_1!13221 lt!437561) (_2!13221 lt!437561)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1132)

(assert (=> b!303033 (= lt!437561 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!303033 (= lt!437558 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun res!249404 () Bool)

(assert (=> start!67480 (=> (not res!249404) (not e!217976))))

(declare-fun a2!948 () array!18414)

(assert (=> start!67480 (= res!249404 (and (bvsle (size!7995 a1!948) (size!7995 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67480 e!217976))

(assert (=> start!67480 true))

(declare-fun array_inv!7607 (array!18414) Bool)

(assert (=> start!67480 (array_inv!7607 a1!948)))

(assert (=> start!67480 (array_inv!7607 a2!948)))

(declare-fun b!303034 () Bool)

(declare-fun res!249403 () Bool)

(assert (=> b!303034 (=> (not res!249403) (not e!217975))))

(declare-fun arrayBitRangesEq!0 (array!18414 array!18414 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!303034 (= res!249403 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!303035 () Bool)

(declare-fun Unit!21168 () Unit!21166)

(assert (=> b!303035 (= e!217978 Unit!21168)))

(declare-fun b!303036 () Bool)

(declare-fun res!249405 () Bool)

(assert (=> b!303036 (=> (not res!249405) (not e!217975))))

(assert (=> b!303036 (= res!249405 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437559) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!303037 () Bool)

(declare-fun lt!437560 () Unit!21166)

(assert (=> b!303037 (= e!217978 lt!437560)))

(declare-fun arrayRangesEqSlicedLemma!219 (array!18414 array!18414 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21166)

(assert (=> b!303037 (= lt!437560 (arrayRangesEqSlicedLemma!219 a1!948 a2!948 (_1!13221 lt!437558) (_2!13221 lt!437558) (_1!13221 lt!437561) (_2!13221 lt!437561)))))

(declare-fun arrayRangesEq!1624 (array!18414 array!18414 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303037 (arrayRangesEq!1624 a1!948 a2!948 (_1!13221 lt!437561) (_2!13221 lt!437561))))

(assert (= (and start!67480 res!249404) b!303032))

(assert (= (and b!303032 res!249402) b!303034))

(assert (= (and b!303034 res!249403) b!303036))

(assert (= (and b!303036 res!249405) b!303033))

(assert (= (and b!303033 c!14397) b!303037))

(assert (= (and b!303033 (not c!14397)) b!303035))

(declare-fun m!441721 () Bool)

(assert (=> b!303033 m!441721))

(declare-fun m!441723 () Bool)

(assert (=> b!303033 m!441723))

(declare-fun m!441725 () Bool)

(assert (=> start!67480 m!441725))

(declare-fun m!441727 () Bool)

(assert (=> start!67480 m!441727))

(declare-fun m!441729 () Bool)

(assert (=> b!303034 m!441729))

(declare-fun m!441731 () Bool)

(assert (=> b!303037 m!441731))

(declare-fun m!441733 () Bool)

(assert (=> b!303037 m!441733))

(push 1)

(assert (not b!303034))

(assert (not b!303033))

(assert (not start!67480))

(assert (not b!303037))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101250 () Bool)

(declare-fun res!249461 () Bool)

(declare-fun e!218042 () Bool)

(assert (=> d!101250 (=> res!249461 e!218042)))

(assert (=> d!101250 (= res!249461 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101250 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218042)))

(declare-fun b!303106 () Bool)

(declare-fun e!218044 () Bool)

(assert (=> b!303106 (= e!218042 e!218044)))

(declare-fun res!249458 () Bool)

(assert (=> b!303106 (=> (not res!249458) (not e!218044))))

(declare-fun e!218041 () Bool)

(assert (=> b!303106 (= res!249458 e!218041)))

(declare-fun res!249459 () Bool)

(assert (=> b!303106 (=> res!249459 e!218041)))

(declare-fun lt!437595 () tuple4!1132)

(assert (=> b!303106 (= res!249459 (bvsge (_1!13221 lt!437595) (_2!13221 lt!437595)))))

(declare-fun lt!437593 () (_ BitVec 32))

(assert (=> b!303106 (= lt!437593 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437594 () (_ BitVec 32))

(assert (=> b!303106 (= lt!437594 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303106 (= lt!437595 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303107 () Bool)

(declare-fun e!218039 () Bool)

(declare-fun e!218043 () Bool)

(assert (=> b!303107 (= e!218039 e!218043)))

(declare-fun res!249462 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303107 (= res!249462 (byteRangesEq!0 (select (arr!9078 a1!948) (_3!1523 lt!437595)) (select (arr!9078 a2!948) (_3!1523 lt!437595)) lt!437594 #b00000000000000000000000000001000))))

(assert (=> b!303107 (=> (not res!249462) (not e!218043))))

(declare-fun b!303108 () Bool)

(assert (=> b!303108 (= e!218044 e!218039)))

(declare-fun c!14406 () Bool)

(assert (=> b!303108 (= c!14406 (= (_3!1523 lt!437595) (_4!566 lt!437595)))))

(declare-fun bm!5564 () Bool)

(declare-fun call!5567 () Bool)

(assert (=> bm!5564 (= call!5567 (byteRangesEq!0 (ite c!14406 (select (arr!9078 a1!948) (_3!1523 lt!437595)) (select (arr!9078 a1!948) (_4!566 lt!437595))) (ite c!14406 (select (arr!9078 a2!948) (_3!1523 lt!437595)) (select (arr!9078 a2!948) (_4!566 lt!437595))) (ite c!14406 lt!437594 #b00000000000000000000000000000000) lt!437593))))

(declare-fun b!303109 () Bool)

(assert (=> b!303109 (= e!218039 call!5567)))

(declare-fun b!303110 () Bool)

(declare-fun res!249460 () Bool)

(assert (=> b!303110 (= res!249460 (= lt!437593 #b00000000000000000000000000000000))))

(declare-fun e!218040 () Bool)

(assert (=> b!303110 (=> res!249460 e!218040)))

(assert (=> b!303110 (= e!218043 e!218040)))

(declare-fun b!303111 () Bool)

(assert (=> b!303111 (= e!218040 call!5567)))

(declare-fun b!303112 () Bool)

(assert (=> b!303112 (= e!218041 (arrayRangesEq!1624 a1!948 a2!948 (_1!13221 lt!437595) (_2!13221 lt!437595)))))

(assert (= (and d!101250 (not res!249461)) b!303106))

(assert (= (and b!303106 (not res!249459)) b!303112))

(assert (= (and b!303106 res!249458) b!303108))

(assert (= (and b!303108 c!14406) b!303109))

(assert (= (and b!303108 (not c!14406)) b!303107))

(assert (= (and b!303107 res!249462) b!303110))

(assert (= (and b!303110 (not res!249460)) b!303111))

(assert (= (or b!303109 b!303111) bm!5564))

(assert (=> b!303106 m!441723))

(declare-fun m!441779 () Bool)

(assert (=> b!303107 m!441779))

(declare-fun m!441781 () Bool)

(assert (=> b!303107 m!441781))

(assert (=> b!303107 m!441779))

(assert (=> b!303107 m!441781))

(declare-fun m!441783 () Bool)

(assert (=> b!303107 m!441783))

(declare-fun m!441785 () Bool)

(assert (=> bm!5564 m!441785))

(declare-fun m!441787 () Bool)

(assert (=> bm!5564 m!441787))

(declare-fun m!441789 () Bool)

(assert (=> bm!5564 m!441789))

(assert (=> bm!5564 m!441779))

(assert (=> bm!5564 m!441781))

(declare-fun m!441791 () Bool)

(assert (=> b!303112 m!441791))

(assert (=> b!303034 d!101250))

(declare-fun d!101252 () Bool)

(assert (=> d!101252 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1133 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303033 d!101252))

(declare-fun d!101254 () Bool)

(assert (=> d!101254 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1133 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303033 d!101254))

(declare-fun d!101256 () Bool)

(assert (=> d!101256 (= (array_inv!7607 a1!948) (bvsge (size!7995 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67480 d!101256))

(declare-fun d!101258 () Bool)

(assert (=> d!101258 (= (array_inv!7607 a2!948) (bvsge (size!7995 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67480 d!101258))

(declare-fun d!101260 () Bool)

(assert (=> d!101260 (arrayRangesEq!1624 a1!948 a2!948 (_1!13221 lt!437561) (_2!13221 lt!437561))))

(declare-fun lt!437598 () Unit!21166)

(declare-fun choose!550 (array!18414 array!18414 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21166)

(assert (=> d!101260 (= lt!437598 (choose!550 a1!948 a2!948 (_1!13221 lt!437558) (_2!13221 lt!437558) (_1!13221 lt!437561) (_2!13221 lt!437561)))))

(assert (=> d!101260 (and (bvsle #b00000000000000000000000000000000 (_1!13221 lt!437558)) (bvsle (_1!13221 lt!437558) (_2!13221 lt!437558)))))

(assert (=> d!101260 (= (arrayRangesEqSlicedLemma!219 a1!948 a2!948 (_1!13221 lt!437558) (_2!13221 lt!437558) (_1!13221 lt!437561) (_2!13221 lt!437561)) lt!437598)))

(declare-fun bs!26123 () Bool)

(assert (= bs!26123 d!101260))

(assert (=> bs!26123 m!441733))

(declare-fun m!441793 () Bool)

(assert (=> bs!26123 m!441793))

(assert (=> b!303037 d!101260))

(declare-fun d!101262 () Bool)

(declare-fun res!249467 () Bool)

(declare-fun e!218049 () Bool)

(assert (=> d!101262 (=> res!249467 e!218049)))

(assert (=> d!101262 (= res!249467 (= (_1!13221 lt!437561) (_2!13221 lt!437561)))))

(assert (=> d!101262 (= (arrayRangesEq!1624 a1!948 a2!948 (_1!13221 lt!437561) (_2!13221 lt!437561)) e!218049)))

(declare-fun b!303117 () Bool)

(declare-fun e!218050 () Bool)

(assert (=> b!303117 (= e!218049 e!218050)))

(declare-fun res!249468 () Bool)

(assert (=> b!303117 (=> (not res!249468) (not e!218050))))

(assert (=> b!303117 (= res!249468 (= (select (arr!9078 a1!948) (_1!13221 lt!437561)) (select (arr!9078 a2!948) (_1!13221 lt!437561))))))

(declare-fun b!303118 () Bool)

(assert (=> b!303118 (= e!218050 (arrayRangesEq!1624 a1!948 a2!948 (bvadd (_1!13221 lt!437561) #b00000000000000000000000000000001) (_2!13221 lt!437561)))))

(assert (= (and d!101262 (not res!249467)) b!303117))

(assert (= (and b!303117 res!249468) b!303118))

(declare-fun m!441795 () Bool)

(assert (=> b!303117 m!441795))

(declare-fun m!441797 () Bool)

(assert (=> b!303117 m!441797))

(declare-fun m!441799 () Bool)

(assert (=> b!303118 m!441799))

(assert (=> b!303037 d!101262))

(push 1)

(assert (not d!101260))

(assert (not b!303106))

(assert (not b!303118))

(assert (not bm!5564))

(assert (not b!303107))

(assert (not b!303112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

