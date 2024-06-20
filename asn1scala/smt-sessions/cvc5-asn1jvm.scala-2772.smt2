; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66994 () Bool)

(assert start!66994)

(declare-fun b!299790 () Bool)

(declare-fun e!215253 () Bool)

(declare-fun e!215259 () Bool)

(assert (=> b!299790 (= e!215253 e!215259)))

(declare-fun res!247323 () Bool)

(assert (=> b!299790 (=> (not res!247323) (not e!215259))))

(declare-fun e!215252 () Bool)

(assert (=> b!299790 (= res!247323 e!215252)))

(declare-fun c!13816 () Bool)

(declare-datatypes ((tuple4!1008 0))(
  ( (tuple4!1009 (_1!13159 (_ BitVec 32)) (_2!13159 (_ BitVec 32)) (_3!1461 (_ BitVec 32)) (_4!504 (_ BitVec 32))) )
))
(declare-fun lt!435540 () tuple4!1008)

(assert (=> b!299790 (= c!13816 (= (_3!1461 lt!435540) (_4!504 lt!435540)))))

(declare-datatypes ((Unit!20953 0))(
  ( (Unit!20954) )
))
(declare-fun lt!435536 () Unit!20953)

(declare-fun e!215256 () Unit!20953)

(assert (=> b!299790 (= lt!435536 e!215256)))

(declare-fun c!13818 () Bool)

(declare-fun lt!435538 () tuple4!1008)

(assert (=> b!299790 (= c!13818 (bvslt (_1!13159 lt!435538) (_2!13159 lt!435538)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1008)

(assert (=> b!299790 (= lt!435538 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!435537 () (_ BitVec 32))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!299790 (= lt!435537 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!435542 () (_ BitVec 32))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> b!299790 (= lt!435542 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299790 (= lt!435540 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299791 () Bool)

(declare-fun res!247322 () Bool)

(assert (=> b!299791 (=> (not res!247322) (not e!215253))))

(declare-fun lt!435539 () (_ BitVec 64))

(assert (=> b!299791 (= res!247322 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435539) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299792 () Bool)

(assert (=> b!299792 (= e!215259 false)))

(declare-fun lt!435535 () Unit!20953)

(declare-fun e!215254 () Unit!20953)

(assert (=> b!299792 (= lt!435535 e!215254)))

(declare-fun c!13817 () Bool)

(assert (=> b!299792 (= c!13817 (and (bvslt (_3!1461 lt!435540) (_3!1461 lt!435538)) (bvslt (_3!1461 lt!435538) (_4!504 lt!435540))))))

(declare-fun b!299793 () Bool)

(declare-fun Unit!20955 () Unit!20953)

(assert (=> b!299793 (= e!215254 Unit!20955)))

(declare-fun b!299794 () Bool)

(declare-fun call!5333 () Bool)

(assert (=> b!299794 (= e!215252 call!5333)))

(declare-datatypes ((array!18194 0))(
  ( (array!18195 (arr!8983 (Array (_ BitVec 32) (_ BitVec 8))) (size!7900 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18194)

(declare-fun a2!948 () array!18194)

(declare-fun bm!5330 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5330 (= call!5333 (byteRangesEq!0 (ite c!13816 (select (arr!8983 a1!948) (_3!1461 lt!435540)) (select (arr!8983 a1!948) (_4!504 lt!435540))) (ite c!13816 (select (arr!8983 a2!948) (_3!1461 lt!435540)) (select (arr!8983 a2!948) (_4!504 lt!435540))) (ite c!13816 lt!435542 #b00000000000000000000000000000000) lt!435537))))

(declare-fun b!299795 () Bool)

(declare-fun lt!435541 () Unit!20953)

(assert (=> b!299795 (= e!215256 lt!435541)))

(declare-fun arrayRangesEqSlicedLemma!172 (array!18194 array!18194 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20953)

(assert (=> b!299795 (= lt!435541 (arrayRangesEqSlicedLemma!172 a1!948 a2!948 (_1!13159 lt!435540) (_2!13159 lt!435540) (_1!13159 lt!435538) (_2!13159 lt!435538)))))

(declare-fun arrayRangesEq!1562 (array!18194 array!18194 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299795 (arrayRangesEq!1562 a1!948 a2!948 (_1!13159 lt!435538) (_2!13159 lt!435538))))

(declare-fun b!299796 () Bool)

(declare-fun Unit!20956 () Unit!20953)

(assert (=> b!299796 (= e!215256 Unit!20956)))

(declare-fun res!247325 () Bool)

(declare-fun e!215251 () Bool)

(assert (=> start!66994 (=> (not res!247325) (not e!215251))))

(assert (=> start!66994 (= res!247325 (and (bvsle (size!7900 a1!948) (size!7900 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66994 e!215251))

(assert (=> start!66994 true))

(declare-fun array_inv!7512 (array!18194) Bool)

(assert (=> start!66994 (array_inv!7512 a1!948)))

(assert (=> start!66994 (array_inv!7512 a2!948)))

(declare-fun b!299797 () Bool)

(declare-fun lt!435543 () Unit!20953)

(assert (=> b!299797 (= e!215254 lt!435543)))

(declare-fun arrayRangesEqImpliesEq!217 (array!18194 array!18194 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20953)

(assert (=> b!299797 (= lt!435543 (arrayRangesEqImpliesEq!217 a1!948 a2!948 (_1!13159 lt!435540) (_3!1461 lt!435538) (_2!13159 lt!435540)))))

(assert (=> b!299797 (= (select (arr!8983 a1!948) (_3!1461 lt!435538)) (select (arr!8983 a2!948) (_3!1461 lt!435538)))))

(declare-fun b!299798 () Bool)

(declare-fun e!215258 () Bool)

(assert (=> b!299798 (= e!215258 call!5333)))

(declare-fun b!299799 () Bool)

(declare-fun res!247327 () Bool)

(assert (=> b!299799 (= res!247327 (= lt!435537 #b00000000000000000000000000000000))))

(assert (=> b!299799 (=> res!247327 e!215258)))

(declare-fun e!215257 () Bool)

(assert (=> b!299799 (= e!215257 e!215258)))

(declare-fun b!299800 () Bool)

(declare-fun res!247324 () Bool)

(assert (=> b!299800 (=> (not res!247324) (not e!215253))))

(declare-fun arrayBitRangesEq!0 (array!18194 array!18194 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299800 (= res!247324 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299801 () Bool)

(assert (=> b!299801 (= e!215252 e!215257)))

(declare-fun res!247328 () Bool)

(assert (=> b!299801 (= res!247328 (byteRangesEq!0 (select (arr!8983 a1!948) (_3!1461 lt!435540)) (select (arr!8983 a2!948) (_3!1461 lt!435540)) lt!435542 #b00000000000000000000000000000111))))

(assert (=> b!299801 (=> (not res!247328) (not e!215257))))

(declare-fun b!299802 () Bool)

(assert (=> b!299802 (= e!215251 e!215253)))

(declare-fun res!247326 () Bool)

(assert (=> b!299802 (=> (not res!247326) (not e!215253))))

(assert (=> b!299802 (= res!247326 (and (bvsle toBit!258 lt!435539) (bvsle fromBit!258 lt!435539)))))

(assert (=> b!299802 (= lt!435539 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7900 a1!948))))))

(assert (= (and start!66994 res!247325) b!299802))

(assert (= (and b!299802 res!247326) b!299800))

(assert (= (and b!299800 res!247324) b!299791))

(assert (= (and b!299791 res!247322) b!299790))

(assert (= (and b!299790 c!13818) b!299795))

(assert (= (and b!299790 (not c!13818)) b!299796))

(assert (= (and b!299790 c!13816) b!299794))

(assert (= (and b!299790 (not c!13816)) b!299801))

(assert (= (and b!299801 res!247328) b!299799))

(assert (= (and b!299799 (not res!247327)) b!299798))

(assert (= (or b!299794 b!299798) bm!5330))

(assert (= (and b!299790 res!247323) b!299792))

(assert (= (and b!299792 c!13817) b!299797))

(assert (= (and b!299792 (not c!13817)) b!299793))

(declare-fun m!438871 () Bool)

(assert (=> b!299790 m!438871))

(declare-fun m!438873 () Bool)

(assert (=> b!299790 m!438873))

(declare-fun m!438875 () Bool)

(assert (=> start!66994 m!438875))

(declare-fun m!438877 () Bool)

(assert (=> start!66994 m!438877))

(declare-fun m!438879 () Bool)

(assert (=> bm!5330 m!438879))

(declare-fun m!438881 () Bool)

(assert (=> bm!5330 m!438881))

(declare-fun m!438883 () Bool)

(assert (=> bm!5330 m!438883))

(declare-fun m!438885 () Bool)

(assert (=> bm!5330 m!438885))

(declare-fun m!438887 () Bool)

(assert (=> bm!5330 m!438887))

(assert (=> b!299801 m!438881))

(assert (=> b!299801 m!438887))

(assert (=> b!299801 m!438881))

(assert (=> b!299801 m!438887))

(declare-fun m!438889 () Bool)

(assert (=> b!299801 m!438889))

(declare-fun m!438891 () Bool)

(assert (=> b!299795 m!438891))

(declare-fun m!438893 () Bool)

(assert (=> b!299795 m!438893))

(declare-fun m!438895 () Bool)

(assert (=> b!299797 m!438895))

(declare-fun m!438897 () Bool)

(assert (=> b!299797 m!438897))

(declare-fun m!438899 () Bool)

(assert (=> b!299797 m!438899))

(declare-fun m!438901 () Bool)

(assert (=> b!299800 m!438901))

(push 1)

