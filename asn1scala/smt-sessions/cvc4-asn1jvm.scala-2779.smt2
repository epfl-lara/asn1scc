; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67082 () Bool)

(assert start!67082)

(declare-fun b!300856 () Bool)

(declare-datatypes ((Unit!21056 0))(
  ( (Unit!21057) )
))
(declare-fun e!216062 () Unit!21056)

(declare-fun lt!436301 () Unit!21056)

(assert (=> b!300856 (= e!216062 lt!436301)))

(declare-datatypes ((tuple4!1054 0))(
  ( (tuple4!1055 (_1!13182 (_ BitVec 32)) (_2!13182 (_ BitVec 32)) (_3!1484 (_ BitVec 32)) (_4!527 (_ BitVec 32))) )
))
(declare-fun lt!436303 () tuple4!1054)

(declare-datatypes ((array!18243 0))(
  ( (array!18244 (arr!9006 (Array (_ BitVec 32) (_ BitVec 8))) (size!7923 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18243)

(declare-fun a2!948 () array!18243)

(declare-fun lt!436307 () tuple4!1054)

(declare-fun arrayRangesEqSlicedLemma!195 (array!18243 array!18243 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21056)

(assert (=> b!300856 (= lt!436301 (arrayRangesEqSlicedLemma!195 a1!948 a2!948 (_1!13182 lt!436303) (_2!13182 lt!436303) (_1!13182 lt!436307) (_2!13182 lt!436307)))))

(declare-fun arrayRangesEq!1585 (array!18243 array!18243 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300856 (arrayRangesEq!1585 a1!948 a2!948 (_1!13182 lt!436307) (_2!13182 lt!436307))))

(declare-fun b!300857 () Bool)

(declare-fun e!216056 () Bool)

(declare-fun call!5411 () Bool)

(assert (=> b!300857 (= e!216056 call!5411)))

(declare-fun b!300858 () Bool)

(declare-fun e!216057 () Unit!21056)

(declare-fun lt!436310 () Unit!21056)

(assert (=> b!300858 (= e!216057 lt!436310)))

(declare-fun arrayRangesEqImpliesEq!240 (array!18243 array!18243 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21056)

(assert (=> b!300858 (= lt!436310 (arrayRangesEqImpliesEq!240 a1!948 a2!948 (_1!13182 lt!436303) (_4!527 lt!436307) (_2!13182 lt!436303)))))

(assert (=> b!300858 (= (select (arr!9006 a1!948) (_4!527 lt!436307)) (select (arr!9006 a2!948) (_4!527 lt!436307)))))

(declare-fun b!300859 () Bool)

(declare-fun e!216066 () Unit!21056)

(declare-fun lt!436305 () Unit!21056)

(assert (=> b!300859 (= e!216066 lt!436305)))

(assert (=> b!300859 (= lt!436305 (arrayRangesEqImpliesEq!240 a1!948 a2!948 (_1!13182 lt!436303) (_3!1484 lt!436307) (_2!13182 lt!436303)))))

(assert (=> b!300859 (= (select (arr!9006 a1!948) (_3!1484 lt!436307)) (select (arr!9006 a2!948) (_3!1484 lt!436307)))))

(declare-fun b!300860 () Bool)

(declare-fun e!216059 () Bool)

(declare-fun e!216061 () Bool)

(assert (=> b!300860 (= e!216059 e!216061)))

(declare-fun res!247887 () Bool)

(assert (=> b!300860 (=> (not res!247887) (not e!216061))))

(declare-fun lt!436306 () (_ BitVec 64))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!300860 (= res!247887 (and (bvsle toBit!258 lt!436306) (bvsle fromBit!258 lt!436306)))))

(assert (=> b!300860 (= lt!436306 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7923 a1!948))))))

(declare-fun b!300861 () Bool)

(declare-fun res!247891 () Bool)

(assert (=> b!300861 (=> (not res!247891) (not e!216061))))

(declare-fun arrayBitRangesEq!0 (array!18243 array!18243 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!300861 (= res!247891 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun lt!436311 () (_ BitVec 32))

(declare-fun c!14067 () Bool)

(declare-fun bm!5408 () Bool)

(declare-fun lt!436300 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5408 (= call!5411 (byteRangesEq!0 (ite c!14067 (select (arr!9006 a1!948) (_3!1484 lt!436303)) (select (arr!9006 a1!948) (_4!527 lt!436303))) (ite c!14067 (select (arr!9006 a2!948) (_3!1484 lt!436303)) (select (arr!9006 a2!948) (_4!527 lt!436303))) (ite c!14067 lt!436300 #b00000000000000000000000000000000) lt!436311))))

(declare-fun b!300862 () Bool)

(declare-fun e!216065 () Bool)

(assert (=> b!300862 (= e!216061 e!216065)))

(declare-fun res!247890 () Bool)

(assert (=> b!300862 (=> (not res!247890) (not e!216065))))

(assert (=> b!300862 (= res!247890 e!216056)))

(assert (=> b!300862 (= c!14067 (= (_3!1484 lt!436303) (_4!527 lt!436303)))))

(declare-fun lt!436304 () Unit!21056)

(assert (=> b!300862 (= lt!436304 e!216062)))

(declare-fun c!14069 () Bool)

(assert (=> b!300862 (= c!14069 (bvslt (_1!13182 lt!436307) (_2!13182 lt!436307)))))

(declare-fun lt!436302 () (_ BitVec 32))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!300862 (= lt!436302 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1054)

(assert (=> b!300862 (= lt!436307 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!300862 (= lt!436311 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300862 (= lt!436300 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300862 (= lt!436303 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!300863 () Bool)

(declare-fun e!216060 () Bool)

(assert (=> b!300863 (= e!216056 e!216060)))

(declare-fun res!247892 () Bool)

(assert (=> b!300863 (= res!247892 (byteRangesEq!0 (select (arr!9006 a1!948) (_3!1484 lt!436303)) (select (arr!9006 a2!948) (_3!1484 lt!436303)) lt!436300 #b00000000000000000000000000000111))))

(assert (=> b!300863 (=> (not res!247892) (not e!216060))))

(declare-fun b!300864 () Bool)

(declare-fun res!247888 () Bool)

(assert (=> b!300864 (= res!247888 (= lt!436311 #b00000000000000000000000000000000))))

(declare-fun e!216058 () Bool)

(assert (=> b!300864 (=> res!247888 e!216058)))

(assert (=> b!300864 (= e!216060 e!216058)))

(declare-fun b!300866 () Bool)

(declare-fun Unit!21058 () Unit!21056)

(assert (=> b!300866 (= e!216057 Unit!21058)))

(declare-fun b!300867 () Bool)

(declare-fun res!247886 () Bool)

(assert (=> b!300867 (=> (not res!247886) (not e!216061))))

(assert (=> b!300867 (= res!247886 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436306) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!300868 () Bool)

(assert (=> b!300868 (= e!216065 (and (not (= (_3!1484 lt!436307) (_4!527 lt!436307))) (or (bvsgt #b00000000000000000000000000000000 lt!436302) (bvsgt lt!436302 #b00000000000000000000000000000111))))))

(declare-fun lt!436308 () Unit!21056)

(assert (=> b!300868 (= lt!436308 e!216057)))

(declare-fun c!14068 () Bool)

(assert (=> b!300868 (= c!14068 (and (bvslt (_4!527 lt!436307) (_4!527 lt!436303)) (bvslt (_3!1484 lt!436303) (_4!527 lt!436307))))))

(declare-fun lt!436309 () Unit!21056)

(assert (=> b!300868 (= lt!436309 e!216066)))

(declare-fun c!14070 () Bool)

(assert (=> b!300868 (= c!14070 (and (bvslt (_3!1484 lt!436303) (_3!1484 lt!436307)) (bvslt (_3!1484 lt!436307) (_4!527 lt!436303))))))

(declare-fun b!300869 () Bool)

(assert (=> b!300869 (= e!216058 call!5411)))

(declare-fun b!300870 () Bool)

(declare-fun Unit!21059 () Unit!21056)

(assert (=> b!300870 (= e!216066 Unit!21059)))

(declare-fun res!247889 () Bool)

(assert (=> start!67082 (=> (not res!247889) (not e!216059))))

(assert (=> start!67082 (= res!247889 (and (bvsle (size!7923 a1!948) (size!7923 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67082 e!216059))

(assert (=> start!67082 true))

(declare-fun array_inv!7535 (array!18243) Bool)

(assert (=> start!67082 (array_inv!7535 a1!948)))

(assert (=> start!67082 (array_inv!7535 a2!948)))

(declare-fun b!300865 () Bool)

(declare-fun Unit!21060 () Unit!21056)

(assert (=> b!300865 (= e!216062 Unit!21060)))

(assert (= (and start!67082 res!247889) b!300860))

(assert (= (and b!300860 res!247887) b!300861))

(assert (= (and b!300861 res!247891) b!300867))

(assert (= (and b!300867 res!247886) b!300862))

(assert (= (and b!300862 c!14069) b!300856))

(assert (= (and b!300862 (not c!14069)) b!300865))

(assert (= (and b!300862 c!14067) b!300857))

(assert (= (and b!300862 (not c!14067)) b!300863))

(assert (= (and b!300863 res!247892) b!300864))

(assert (= (and b!300864 (not res!247888)) b!300869))

(assert (= (or b!300857 b!300869) bm!5408))

(assert (= (and b!300862 res!247890) b!300868))

(assert (= (and b!300868 c!14070) b!300859))

(assert (= (and b!300868 (not c!14070)) b!300870))

(assert (= (and b!300868 c!14068) b!300858))

(assert (= (and b!300868 (not c!14068)) b!300866))

(declare-fun m!439781 () Bool)

(assert (=> b!300859 m!439781))

(declare-fun m!439783 () Bool)

(assert (=> b!300859 m!439783))

(declare-fun m!439785 () Bool)

(assert (=> b!300859 m!439785))

(declare-fun m!439787 () Bool)

(assert (=> b!300863 m!439787))

(declare-fun m!439789 () Bool)

(assert (=> b!300863 m!439789))

(assert (=> b!300863 m!439787))

(assert (=> b!300863 m!439789))

(declare-fun m!439791 () Bool)

(assert (=> b!300863 m!439791))

(declare-fun m!439793 () Bool)

(assert (=> start!67082 m!439793))

(declare-fun m!439795 () Bool)

(assert (=> start!67082 m!439795))

(declare-fun m!439797 () Bool)

(assert (=> b!300862 m!439797))

(declare-fun m!439799 () Bool)

(assert (=> b!300862 m!439799))

(declare-fun m!439801 () Bool)

(assert (=> bm!5408 m!439801))

(declare-fun m!439803 () Bool)

(assert (=> bm!5408 m!439803))

(assert (=> bm!5408 m!439787))

(assert (=> bm!5408 m!439789))

(declare-fun m!439805 () Bool)

(assert (=> bm!5408 m!439805))

(declare-fun m!439807 () Bool)

(assert (=> b!300861 m!439807))

(declare-fun m!439809 () Bool)

(assert (=> b!300856 m!439809))

(declare-fun m!439811 () Bool)

(assert (=> b!300856 m!439811))

(declare-fun m!439813 () Bool)

(assert (=> b!300858 m!439813))

(declare-fun m!439815 () Bool)

(assert (=> b!300858 m!439815))

(declare-fun m!439817 () Bool)

(assert (=> b!300858 m!439817))

(push 1)

(assert (not b!300859))

(assert (not bm!5408))

(assert (not b!300863))

(assert (not b!300861))

(assert (not b!300862))

(assert (not b!300856))

(assert (not b!300858))

(assert (not start!67082))

(check-sat)

(pop 1)

(push 1)

(check-sat)

