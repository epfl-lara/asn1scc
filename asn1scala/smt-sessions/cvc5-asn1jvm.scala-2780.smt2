; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67084 () Bool)

(assert start!67084)

(declare-fun b!300905 () Bool)

(declare-datatypes ((Unit!21061 0))(
  ( (Unit!21062) )
))
(declare-fun e!216093 () Unit!21061)

(declare-fun Unit!21063 () Unit!21061)

(assert (=> b!300905 (= e!216093 Unit!21063)))

(declare-fun b!300906 () Bool)

(declare-fun res!247915 () Bool)

(declare-fun e!216091 () Bool)

(assert (=> b!300906 (=> (not res!247915) (not e!216091))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!436341 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!300906 (= res!247915 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436341) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!300907 () Bool)

(declare-fun res!247917 () Bool)

(assert (=> b!300907 (=> (not res!247917) (not e!216091))))

(declare-datatypes ((array!18245 0))(
  ( (array!18246 (arr!9007 (Array (_ BitVec 32) (_ BitVec 8))) (size!7924 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18245)

(declare-fun a2!948 () array!18245)

(declare-fun arrayBitRangesEq!0 (array!18245 array!18245 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!300907 (= res!247917 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!300908 () Bool)

(declare-fun lt!436336 () Unit!21061)

(assert (=> b!300908 (= e!216093 lt!436336)))

(declare-datatypes ((tuple4!1056 0))(
  ( (tuple4!1057 (_1!13183 (_ BitVec 32)) (_2!13183 (_ BitVec 32)) (_3!1485 (_ BitVec 32)) (_4!528 (_ BitVec 32))) )
))
(declare-fun lt!436345 () tuple4!1056)

(declare-fun lt!436338 () tuple4!1056)

(declare-fun arrayRangesEqImpliesEq!241 (array!18245 array!18245 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21061)

(assert (=> b!300908 (= lt!436336 (arrayRangesEqImpliesEq!241 a1!948 a2!948 (_1!13183 lt!436338) (_3!1485 lt!436345) (_2!13183 lt!436338)))))

(assert (=> b!300908 (= (select (arr!9007 a1!948) (_3!1485 lt!436345)) (select (arr!9007 a2!948) (_3!1485 lt!436345)))))

(declare-fun b!300909 () Bool)

(declare-fun e!216094 () Unit!21061)

(declare-fun lt!436346 () Unit!21061)

(assert (=> b!300909 (= e!216094 lt!436346)))

(declare-fun arrayRangesEqSlicedLemma!196 (array!18245 array!18245 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21061)

(assert (=> b!300909 (= lt!436346 (arrayRangesEqSlicedLemma!196 a1!948 a2!948 (_1!13183 lt!436338) (_2!13183 lt!436338) (_1!13183 lt!436345) (_2!13183 lt!436345)))))

(declare-fun arrayRangesEq!1586 (array!18245 array!18245 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300909 (arrayRangesEq!1586 a1!948 a2!948 (_1!13183 lt!436345) (_2!13183 lt!436345))))

(declare-fun b!300910 () Bool)

(declare-fun e!216100 () Bool)

(declare-fun e!216092 () Bool)

(assert (=> b!300910 (= e!216100 e!216092)))

(declare-fun res!247914 () Bool)

(declare-fun call!5414 () Bool)

(assert (=> b!300910 (= res!247914 call!5414)))

(assert (=> b!300910 (=> (not res!247914) (not e!216092))))

(declare-fun b!300911 () Bool)

(declare-fun e!216095 () Bool)

(declare-fun e!216102 () Bool)

(assert (=> b!300911 (= e!216095 e!216102)))

(declare-fun res!247919 () Bool)

(assert (=> b!300911 (=> (not res!247919) (not e!216102))))

(assert (=> b!300911 (= res!247919 (not (= (_3!1485 lt!436345) (_4!528 lt!436345))))))

(declare-fun lt!436340 () Unit!21061)

(declare-fun e!216096 () Unit!21061)

(assert (=> b!300911 (= lt!436340 e!216096)))

(declare-fun c!14081 () Bool)

(assert (=> b!300911 (= c!14081 (and (bvslt (_4!528 lt!436345) (_4!528 lt!436338)) (bvslt (_3!1485 lt!436338) (_4!528 lt!436345))))))

(declare-fun lt!436339 () Unit!21061)

(assert (=> b!300911 (= lt!436339 e!216093)))

(declare-fun c!14080 () Bool)

(assert (=> b!300911 (= c!14080 (and (bvslt (_3!1485 lt!436338) (_3!1485 lt!436345)) (bvslt (_3!1485 lt!436345) (_4!528 lt!436338))))))

(declare-fun b!300912 () Bool)

(assert (=> b!300912 (= e!216091 e!216095)))

(declare-fun res!247913 () Bool)

(assert (=> b!300912 (=> (not res!247913) (not e!216095))))

(assert (=> b!300912 (= res!247913 e!216100)))

(declare-fun c!14079 () Bool)

(assert (=> b!300912 (= c!14079 (= (_3!1485 lt!436338) (_4!528 lt!436338)))))

(declare-fun lt!436337 () Unit!21061)

(assert (=> b!300912 (= lt!436337 e!216094)))

(declare-fun c!14082 () Bool)

(assert (=> b!300912 (= c!14082 (bvslt (_1!13183 lt!436345) (_2!13183 lt!436345)))))

(declare-fun lt!436343 () (_ BitVec 32))

(assert (=> b!300912 (= lt!436343 ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1056)

(assert (=> b!300912 (= lt!436345 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!436344 () (_ BitVec 32))

(assert (=> b!300912 (= lt!436344 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!436342 () (_ BitVec 32))

(assert (=> b!300912 (= lt!436342 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300912 (= lt!436338 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!300913 () Bool)

(assert (=> b!300913 (= e!216102 (and (not (= lt!436343 #b00000000000000000000000000000000)) (or (bvsgt #b00000000000000000000000000000000 lt!436343) (bvsgt lt!436343 #b00000000000000000000000000001000))))))

(declare-fun b!300914 () Bool)

(declare-fun res!247918 () Bool)

(assert (=> b!300914 (= res!247918 (= lt!436344 #b00000000000000000000000000000000))))

(declare-fun e!216097 () Bool)

(assert (=> b!300914 (=> res!247918 e!216097)))

(assert (=> b!300914 (= e!216092 e!216097)))

(declare-fun bm!5411 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5411 (= call!5414 (byteRangesEq!0 (select (arr!9007 a1!948) (_3!1485 lt!436338)) (select (arr!9007 a2!948) (_3!1485 lt!436338)) lt!436342 (ite c!14079 lt!436344 #b00000000000000000000000000000111)))))

(declare-fun b!300915 () Bool)

(declare-fun lt!436347 () Unit!21061)

(assert (=> b!300915 (= e!216096 lt!436347)))

(assert (=> b!300915 (= lt!436347 (arrayRangesEqImpliesEq!241 a1!948 a2!948 (_1!13183 lt!436338) (_4!528 lt!436345) (_2!13183 lt!436338)))))

(assert (=> b!300915 (= (select (arr!9007 a1!948) (_4!528 lt!436345)) (select (arr!9007 a2!948) (_4!528 lt!436345)))))

(declare-fun b!300916 () Bool)

(declare-fun res!247912 () Bool)

(assert (=> b!300916 (=> (not res!247912) (not e!216102))))

(assert (=> b!300916 (= res!247912 (byteRangesEq!0 (select (arr!9007 a1!948) (_3!1485 lt!436345)) (select (arr!9007 a2!948) (_3!1485 lt!436345)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun b!300917 () Bool)

(declare-fun Unit!21064 () Unit!21061)

(assert (=> b!300917 (= e!216094 Unit!21064)))

(declare-fun b!300918 () Bool)

(assert (=> b!300918 (= e!216097 (byteRangesEq!0 (select (arr!9007 a1!948) (_4!528 lt!436338)) (select (arr!9007 a2!948) (_4!528 lt!436338)) #b00000000000000000000000000000000 lt!436344))))

(declare-fun res!247916 () Bool)

(declare-fun e!216099 () Bool)

(assert (=> start!67084 (=> (not res!247916) (not e!216099))))

(assert (=> start!67084 (= res!247916 (and (bvsle (size!7924 a1!948) (size!7924 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67084 e!216099))

(assert (=> start!67084 true))

(declare-fun array_inv!7536 (array!18245) Bool)

(assert (=> start!67084 (array_inv!7536 a1!948)))

(assert (=> start!67084 (array_inv!7536 a2!948)))

(declare-fun b!300919 () Bool)

(assert (=> b!300919 (= e!216100 call!5414)))

(declare-fun b!300920 () Bool)

(declare-fun Unit!21065 () Unit!21061)

(assert (=> b!300920 (= e!216096 Unit!21065)))

(declare-fun b!300921 () Bool)

(assert (=> b!300921 (= e!216099 e!216091)))

(declare-fun res!247911 () Bool)

(assert (=> b!300921 (=> (not res!247911) (not e!216091))))

(assert (=> b!300921 (= res!247911 (and (bvsle toBit!258 lt!436341) (bvsle fromBit!258 lt!436341)))))

(assert (=> b!300921 (= lt!436341 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7924 a1!948))))))

(assert (= (and start!67084 res!247916) b!300921))

(assert (= (and b!300921 res!247911) b!300907))

(assert (= (and b!300907 res!247917) b!300906))

(assert (= (and b!300906 res!247915) b!300912))

(assert (= (and b!300912 c!14082) b!300909))

(assert (= (and b!300912 (not c!14082)) b!300917))

(assert (= (and b!300912 c!14079) b!300919))

(assert (= (and b!300912 (not c!14079)) b!300910))

(assert (= (and b!300910 res!247914) b!300914))

(assert (= (and b!300914 (not res!247918)) b!300918))

(assert (= (or b!300919 b!300910) bm!5411))

(assert (= (and b!300912 res!247913) b!300911))

(assert (= (and b!300911 c!14080) b!300908))

(assert (= (and b!300911 (not c!14080)) b!300905))

(assert (= (and b!300911 c!14081) b!300915))

(assert (= (and b!300911 (not c!14081)) b!300920))

(assert (= (and b!300911 res!247919) b!300916))

(assert (= (and b!300916 res!247912) b!300913))

(declare-fun m!439819 () Bool)

(assert (=> b!300916 m!439819))

(declare-fun m!439821 () Bool)

(assert (=> b!300916 m!439821))

(assert (=> b!300916 m!439819))

(assert (=> b!300916 m!439821))

(declare-fun m!439823 () Bool)

(assert (=> b!300916 m!439823))

(declare-fun m!439825 () Bool)

(assert (=> b!300912 m!439825))

(declare-fun m!439827 () Bool)

(assert (=> b!300912 m!439827))

(declare-fun m!439829 () Bool)

(assert (=> b!300908 m!439829))

(assert (=> b!300908 m!439819))

(assert (=> b!300908 m!439821))

(declare-fun m!439831 () Bool)

(assert (=> b!300909 m!439831))

(declare-fun m!439833 () Bool)

(assert (=> b!300909 m!439833))

(declare-fun m!439835 () Bool)

(assert (=> bm!5411 m!439835))

(declare-fun m!439837 () Bool)

(assert (=> bm!5411 m!439837))

(assert (=> bm!5411 m!439835))

(assert (=> bm!5411 m!439837))

(declare-fun m!439839 () Bool)

(assert (=> bm!5411 m!439839))

(declare-fun m!439841 () Bool)

(assert (=> b!300918 m!439841))

(declare-fun m!439843 () Bool)

(assert (=> b!300918 m!439843))

(assert (=> b!300918 m!439841))

(assert (=> b!300918 m!439843))

(declare-fun m!439845 () Bool)

(assert (=> b!300918 m!439845))

(declare-fun m!439847 () Bool)

(assert (=> b!300907 m!439847))

(declare-fun m!439849 () Bool)

(assert (=> start!67084 m!439849))

(declare-fun m!439851 () Bool)

(assert (=> start!67084 m!439851))

(declare-fun m!439853 () Bool)

(assert (=> b!300915 m!439853))

(declare-fun m!439855 () Bool)

(assert (=> b!300915 m!439855))

(declare-fun m!439857 () Bool)

(assert (=> b!300915 m!439857))

(push 1)

(assert (not b!300909))

(assert (not b!300916))

(assert (not start!67084))

(assert (not b!300907))

(assert (not b!300908))

(assert (not bm!5411))

(assert (not b!300915))

(assert (not b!300912))

(assert (not b!300918))

(check-sat)

(pop 1)

(push 1)

(check-sat)

