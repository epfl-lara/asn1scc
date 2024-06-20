; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66996 () Bool)

(assert start!66996)

(declare-fun b!299829 () Bool)

(declare-datatypes ((Unit!20957 0))(
  ( (Unit!20958) )
))
(declare-fun e!215288 () Unit!20957)

(declare-fun lt!435562 () Unit!20957)

(assert (=> b!299829 (= e!215288 lt!435562)))

(declare-datatypes ((tuple4!1010 0))(
  ( (tuple4!1011 (_1!13160 (_ BitVec 32)) (_2!13160 (_ BitVec 32)) (_3!1462 (_ BitVec 32)) (_4!505 (_ BitVec 32))) )
))
(declare-fun lt!435567 () tuple4!1010)

(declare-datatypes ((array!18196 0))(
  ( (array!18197 (arr!8984 (Array (_ BitVec 32) (_ BitVec 8))) (size!7901 (_ BitVec 32))) )
))
(declare-fun a2!948 () array!18196)

(declare-fun lt!435570 () tuple4!1010)

(declare-fun a1!948 () array!18196)

(declare-fun arrayRangesEqSlicedLemma!173 (array!18196 array!18196 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20957)

(assert (=> b!299829 (= lt!435562 (arrayRangesEqSlicedLemma!173 a1!948 a2!948 (_1!13160 lt!435567) (_2!13160 lt!435567) (_1!13160 lt!435570) (_2!13160 lt!435570)))))

(declare-fun arrayRangesEq!1563 (array!18196 array!18196 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299829 (arrayRangesEq!1563 a1!948 a2!948 (_1!13160 lt!435570) (_2!13160 lt!435570))))

(declare-fun res!247344 () Bool)

(declare-fun e!215287 () Bool)

(assert (=> start!66996 (=> (not res!247344) (not e!215287))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> start!66996 (= res!247344 (and (bvsle (size!7901 a1!948) (size!7901 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66996 e!215287))

(assert (=> start!66996 true))

(declare-fun array_inv!7513 (array!18196) Bool)

(assert (=> start!66996 (array_inv!7513 a1!948)))

(assert (=> start!66996 (array_inv!7513 a2!948)))

(declare-fun b!299830 () Bool)

(declare-fun res!247346 () Bool)

(declare-fun lt!435565 () (_ BitVec 32))

(assert (=> b!299830 (= res!247346 (= lt!435565 #b00000000000000000000000000000000))))

(declare-fun e!215289 () Bool)

(assert (=> b!299830 (=> res!247346 e!215289)))

(declare-fun e!215284 () Bool)

(assert (=> b!299830 (= e!215284 e!215289)))

(declare-fun b!299831 () Bool)

(declare-fun e!215280 () Bool)

(assert (=> b!299831 (= e!215287 e!215280)))

(declare-fun res!247345 () Bool)

(assert (=> b!299831 (=> (not res!247345) (not e!215280))))

(declare-fun lt!435568 () (_ BitVec 64))

(assert (=> b!299831 (= res!247345 (and (bvsle toBit!258 lt!435568) (bvsle fromBit!258 lt!435568)))))

(assert (=> b!299831 (= lt!435568 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7901 a1!948))))))

(declare-fun b!299832 () Bool)

(declare-fun e!215282 () Bool)

(assert (=> b!299832 (= e!215282 e!215284)))

(declare-fun lt!435569 () (_ BitVec 32))

(declare-fun res!247349 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299832 (= res!247349 (byteRangesEq!0 (select (arr!8984 a1!948) (_3!1462 lt!435567)) (select (arr!8984 a2!948) (_3!1462 lt!435567)) lt!435569 #b00000000000000000000000000000111))))

(assert (=> b!299832 (=> (not res!247349) (not e!215284))))

(declare-fun b!299833 () Bool)

(declare-fun e!215286 () Bool)

(assert (=> b!299833 (= e!215280 e!215286)))

(declare-fun res!247347 () Bool)

(assert (=> b!299833 (=> (not res!247347) (not e!215286))))

(assert (=> b!299833 (= res!247347 e!215282)))

(declare-fun c!13825 () Bool)

(assert (=> b!299833 (= c!13825 (= (_3!1462 lt!435567) (_4!505 lt!435567)))))

(declare-fun lt!435566 () Unit!20957)

(assert (=> b!299833 (= lt!435566 e!215288)))

(declare-fun c!13826 () Bool)

(assert (=> b!299833 (= c!13826 (bvslt (_1!13160 lt!435570) (_2!13160 lt!435570)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1010)

(assert (=> b!299833 (= lt!435570 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!299833 (= lt!435565 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299833 (= lt!435569 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299833 (= lt!435567 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299834 () Bool)

(assert (=> b!299834 (= e!215286 false)))

(declare-fun lt!435564 () Unit!20957)

(declare-fun e!215281 () Unit!20957)

(assert (=> b!299834 (= lt!435564 e!215281)))

(declare-fun c!13827 () Bool)

(assert (=> b!299834 (= c!13827 (and (bvslt (_3!1462 lt!435567) (_3!1462 lt!435570)) (bvslt (_3!1462 lt!435570) (_4!505 lt!435567))))))

(declare-fun bm!5333 () Bool)

(declare-fun call!5336 () Bool)

(assert (=> bm!5333 (= call!5336 (byteRangesEq!0 (ite c!13825 (select (arr!8984 a1!948) (_3!1462 lt!435567)) (select (arr!8984 a1!948) (_4!505 lt!435567))) (ite c!13825 (select (arr!8984 a2!948) (_3!1462 lt!435567)) (select (arr!8984 a2!948) (_4!505 lt!435567))) (ite c!13825 lt!435569 #b00000000000000000000000000000000) lt!435565))))

(declare-fun b!299835 () Bool)

(declare-fun Unit!20959 () Unit!20957)

(assert (=> b!299835 (= e!215281 Unit!20959)))

(declare-fun b!299836 () Bool)

(assert (=> b!299836 (= e!215289 call!5336)))

(declare-fun b!299837 () Bool)

(declare-fun res!247348 () Bool)

(assert (=> b!299837 (=> (not res!247348) (not e!215280))))

(assert (=> b!299837 (= res!247348 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435568) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299838 () Bool)

(declare-fun Unit!20960 () Unit!20957)

(assert (=> b!299838 (= e!215288 Unit!20960)))

(declare-fun b!299839 () Bool)

(assert (=> b!299839 (= e!215282 call!5336)))

(declare-fun b!299840 () Bool)

(declare-fun lt!435563 () Unit!20957)

(assert (=> b!299840 (= e!215281 lt!435563)))

(declare-fun arrayRangesEqImpliesEq!218 (array!18196 array!18196 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20957)

(assert (=> b!299840 (= lt!435563 (arrayRangesEqImpliesEq!218 a1!948 a2!948 (_1!13160 lt!435567) (_3!1462 lt!435570) (_2!13160 lt!435567)))))

(assert (=> b!299840 (= (select (arr!8984 a1!948) (_3!1462 lt!435570)) (select (arr!8984 a2!948) (_3!1462 lt!435570)))))

(declare-fun b!299841 () Bool)

(declare-fun res!247343 () Bool)

(assert (=> b!299841 (=> (not res!247343) (not e!215280))))

(declare-fun arrayBitRangesEq!0 (array!18196 array!18196 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299841 (= res!247343 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(assert (= (and start!66996 res!247344) b!299831))

(assert (= (and b!299831 res!247345) b!299841))

(assert (= (and b!299841 res!247343) b!299837))

(assert (= (and b!299837 res!247348) b!299833))

(assert (= (and b!299833 c!13826) b!299829))

(assert (= (and b!299833 (not c!13826)) b!299838))

(assert (= (and b!299833 c!13825) b!299839))

(assert (= (and b!299833 (not c!13825)) b!299832))

(assert (= (and b!299832 res!247349) b!299830))

(assert (= (and b!299830 (not res!247346)) b!299836))

(assert (= (or b!299839 b!299836) bm!5333))

(assert (= (and b!299833 res!247347) b!299834))

(assert (= (and b!299834 c!13827) b!299840))

(assert (= (and b!299834 (not c!13827)) b!299835))

(declare-fun m!438903 () Bool)

(assert (=> b!299841 m!438903))

(declare-fun m!438905 () Bool)

(assert (=> start!66996 m!438905))

(declare-fun m!438907 () Bool)

(assert (=> start!66996 m!438907))

(declare-fun m!438909 () Bool)

(assert (=> bm!5333 m!438909))

(declare-fun m!438911 () Bool)

(assert (=> bm!5333 m!438911))

(declare-fun m!438913 () Bool)

(assert (=> bm!5333 m!438913))

(declare-fun m!438915 () Bool)

(assert (=> bm!5333 m!438915))

(declare-fun m!438917 () Bool)

(assert (=> bm!5333 m!438917))

(declare-fun m!438919 () Bool)

(assert (=> b!299840 m!438919))

(declare-fun m!438921 () Bool)

(assert (=> b!299840 m!438921))

(declare-fun m!438923 () Bool)

(assert (=> b!299840 m!438923))

(assert (=> b!299832 m!438911))

(assert (=> b!299832 m!438915))

(assert (=> b!299832 m!438911))

(assert (=> b!299832 m!438915))

(declare-fun m!438925 () Bool)

(assert (=> b!299832 m!438925))

(declare-fun m!438927 () Bool)

(assert (=> b!299833 m!438927))

(declare-fun m!438929 () Bool)

(assert (=> b!299833 m!438929))

(declare-fun m!438931 () Bool)

(assert (=> b!299829 m!438931))

(declare-fun m!438933 () Bool)

(assert (=> b!299829 m!438933))

(check-sat (not b!299832) (not bm!5333) (not b!299841) (not b!299840) (not start!66996) (not b!299833) (not b!299829))
