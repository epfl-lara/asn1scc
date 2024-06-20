; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67010 () Bool)

(assert start!67010)

(declare-fun b!300102 () Bool)

(declare-fun e!215490 () Bool)

(declare-fun call!5357 () Bool)

(assert (=> b!300102 (= e!215490 call!5357)))

(declare-fun b!300103 () Bool)

(declare-fun res!247494 () Bool)

(declare-fun lt!435751 () (_ BitVec 32))

(assert (=> b!300103 (= res!247494 (= lt!435751 #b00000000000000000000000000000000))))

(assert (=> b!300103 (=> res!247494 e!215490)))

(declare-fun e!215494 () Bool)

(assert (=> b!300103 (= e!215494 e!215490)))

(declare-datatypes ((array!18210 0))(
  ( (array!18211 (arr!8991 (Array (_ BitVec 32) (_ BitVec 8))) (size!7908 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18210)

(declare-fun bm!5354 () Bool)

(declare-fun a2!948 () array!18210)

(declare-fun c!13889 () Bool)

(declare-datatypes ((tuple4!1024 0))(
  ( (tuple4!1025 (_1!13167 (_ BitVec 32)) (_2!13167 (_ BitVec 32)) (_3!1469 (_ BitVec 32)) (_4!512 (_ BitVec 32))) )
))
(declare-fun lt!435753 () tuple4!1024)

(declare-fun lt!435758 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5354 (= call!5357 (byteRangesEq!0 (ite c!13889 (select (arr!8991 a1!948) (_3!1469 lt!435753)) (select (arr!8991 a1!948) (_4!512 lt!435753))) (ite c!13889 (select (arr!8991 a2!948) (_3!1469 lt!435753)) (select (arr!8991 a2!948) (_4!512 lt!435753))) (ite c!13889 lt!435758 #b00000000000000000000000000000000) lt!435751))))

(declare-fun res!247492 () Bool)

(declare-fun e!215495 () Bool)

(assert (=> start!67010 (=> (not res!247492) (not e!215495))))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> start!67010 (= res!247492 (and (bvsle (size!7908 a1!948) (size!7908 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67010 e!215495))

(assert (=> start!67010 true))

(declare-fun array_inv!7520 (array!18210) Bool)

(assert (=> start!67010 (array_inv!7520 a1!948)))

(assert (=> start!67010 (array_inv!7520 a2!948)))

(declare-fun b!300104 () Bool)

(declare-fun res!247496 () Bool)

(declare-fun e!215499 () Bool)

(assert (=> b!300104 (=> (not res!247496) (not e!215499))))

(declare-fun arrayBitRangesEq!0 (array!18210 array!18210 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!300104 (= res!247496 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!300105 () Bool)

(declare-datatypes ((Unit!20985 0))(
  ( (Unit!20986) )
))
(declare-fun e!215492 () Unit!20985)

(declare-fun Unit!20987 () Unit!20985)

(assert (=> b!300105 (= e!215492 Unit!20987)))

(declare-fun b!300106 () Bool)

(declare-fun e!215498 () Unit!20985)

(declare-fun lt!435752 () Unit!20985)

(assert (=> b!300106 (= e!215498 lt!435752)))

(declare-fun lt!435756 () tuple4!1024)

(declare-fun arrayRangesEqImpliesEq!225 (array!18210 array!18210 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20985)

(assert (=> b!300106 (= lt!435752 (arrayRangesEqImpliesEq!225 a1!948 a2!948 (_1!13167 lt!435753) (_3!1469 lt!435756) (_2!13167 lt!435753)))))

(assert (=> b!300106 (= (select (arr!8991 a1!948) (_3!1469 lt!435756)) (select (arr!8991 a2!948) (_3!1469 lt!435756)))))

(declare-fun b!300107 () Bool)

(declare-fun e!215491 () Bool)

(assert (=> b!300107 (= e!215491 e!215494)))

(declare-fun res!247495 () Bool)

(assert (=> b!300107 (= res!247495 (byteRangesEq!0 (select (arr!8991 a1!948) (_3!1469 lt!435753)) (select (arr!8991 a2!948) (_3!1469 lt!435753)) lt!435758 #b00000000000000000000000000000111))))

(assert (=> b!300107 (=> (not res!247495) (not e!215494))))

(declare-fun b!300108 () Bool)

(declare-fun e!215493 () Bool)

(assert (=> b!300108 (= e!215499 e!215493)))

(declare-fun res!247493 () Bool)

(assert (=> b!300108 (=> (not res!247493) (not e!215493))))

(assert (=> b!300108 (= res!247493 e!215491)))

(assert (=> b!300108 (= c!13889 (= (_3!1469 lt!435753) (_4!512 lt!435753)))))

(declare-fun lt!435759 () Unit!20985)

(assert (=> b!300108 (= lt!435759 e!215492)))

(declare-fun c!13888 () Bool)

(assert (=> b!300108 (= c!13888 (bvslt (_1!13167 lt!435756) (_2!13167 lt!435756)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1024)

(assert (=> b!300108 (= lt!435756 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!300108 (= lt!435751 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300108 (= lt!435758 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300108 (= lt!435753 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!300109 () Bool)

(declare-fun res!247491 () Bool)

(assert (=> b!300109 (=> (not res!247491) (not e!215499))))

(declare-fun lt!435755 () (_ BitVec 64))

(assert (=> b!300109 (= res!247491 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435755) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!300110 () Bool)

(declare-fun lt!435754 () Unit!20985)

(assert (=> b!300110 (= e!215492 lt!435754)))

(declare-fun arrayRangesEqSlicedLemma!180 (array!18210 array!18210 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20985)

(assert (=> b!300110 (= lt!435754 (arrayRangesEqSlicedLemma!180 a1!948 a2!948 (_1!13167 lt!435753) (_2!13167 lt!435753) (_1!13167 lt!435756) (_2!13167 lt!435756)))))

(declare-fun arrayRangesEq!1570 (array!18210 array!18210 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300110 (arrayRangesEq!1570 a1!948 a2!948 (_1!13167 lt!435756) (_2!13167 lt!435756))))

(declare-fun b!300111 () Bool)

(assert (=> b!300111 (= e!215493 false)))

(declare-fun lt!435757 () Unit!20985)

(assert (=> b!300111 (= lt!435757 e!215498)))

(declare-fun c!13890 () Bool)

(assert (=> b!300111 (= c!13890 (and (bvslt (_3!1469 lt!435753) (_3!1469 lt!435756)) (bvslt (_3!1469 lt!435756) (_4!512 lt!435753))))))

(declare-fun b!300112 () Bool)

(assert (=> b!300112 (= e!215495 e!215499)))

(declare-fun res!247490 () Bool)

(assert (=> b!300112 (=> (not res!247490) (not e!215499))))

(assert (=> b!300112 (= res!247490 (and (bvsle toBit!258 lt!435755) (bvsle fromBit!258 lt!435755)))))

(assert (=> b!300112 (= lt!435755 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7908 a1!948))))))

(declare-fun b!300113 () Bool)

(assert (=> b!300113 (= e!215491 call!5357)))

(declare-fun b!300114 () Bool)

(declare-fun Unit!20988 () Unit!20985)

(assert (=> b!300114 (= e!215498 Unit!20988)))

(assert (= (and start!67010 res!247492) b!300112))

(assert (= (and b!300112 res!247490) b!300104))

(assert (= (and b!300104 res!247496) b!300109))

(assert (= (and b!300109 res!247491) b!300108))

(assert (= (and b!300108 c!13888) b!300110))

(assert (= (and b!300108 (not c!13888)) b!300105))

(assert (= (and b!300108 c!13889) b!300113))

(assert (= (and b!300108 (not c!13889)) b!300107))

(assert (= (and b!300107 res!247495) b!300103))

(assert (= (and b!300103 (not res!247494)) b!300102))

(assert (= (or b!300113 b!300102) bm!5354))

(assert (= (and b!300108 res!247493) b!300111))

(assert (= (and b!300111 c!13890) b!300106))

(assert (= (and b!300111 (not c!13890)) b!300114))

(declare-fun m!439127 () Bool)

(assert (=> b!300106 m!439127))

(declare-fun m!439129 () Bool)

(assert (=> b!300106 m!439129))

(declare-fun m!439131 () Bool)

(assert (=> b!300106 m!439131))

(declare-fun m!439133 () Bool)

(assert (=> b!300107 m!439133))

(declare-fun m!439135 () Bool)

(assert (=> b!300107 m!439135))

(assert (=> b!300107 m!439133))

(assert (=> b!300107 m!439135))

(declare-fun m!439137 () Bool)

(assert (=> b!300107 m!439137))

(declare-fun m!439139 () Bool)

(assert (=> b!300110 m!439139))

(declare-fun m!439141 () Bool)

(assert (=> b!300110 m!439141))

(assert (=> bm!5354 m!439135))

(declare-fun m!439143 () Bool)

(assert (=> bm!5354 m!439143))

(declare-fun m!439145 () Bool)

(assert (=> bm!5354 m!439145))

(assert (=> bm!5354 m!439133))

(declare-fun m!439147 () Bool)

(assert (=> bm!5354 m!439147))

(declare-fun m!439149 () Bool)

(assert (=> b!300108 m!439149))

(declare-fun m!439151 () Bool)

(assert (=> b!300108 m!439151))

(declare-fun m!439153 () Bool)

(assert (=> start!67010 m!439153))

(declare-fun m!439155 () Bool)

(assert (=> start!67010 m!439155))

(declare-fun m!439157 () Bool)

(assert (=> b!300104 m!439157))

(push 1)

(assert (not b!300107))

