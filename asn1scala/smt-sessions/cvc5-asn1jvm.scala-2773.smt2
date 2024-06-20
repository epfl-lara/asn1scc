; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67000 () Bool)

(assert start!67000)

(declare-fun b!299907 () Bool)

(declare-fun res!247385 () Bool)

(declare-fun lt!435621 () (_ BitVec 32))

(assert (=> b!299907 (= res!247385 (= lt!435621 #b00000000000000000000000000000000))))

(declare-fun e!215348 () Bool)

(assert (=> b!299907 (=> res!247385 e!215348)))

(declare-fun e!215345 () Bool)

(assert (=> b!299907 (= e!215345 e!215348)))

(declare-fun b!299908 () Bool)

(declare-datatypes ((Unit!20965 0))(
  ( (Unit!20966) )
))
(declare-fun e!215341 () Unit!20965)

(declare-fun lt!435620 () Unit!20965)

(assert (=> b!299908 (= e!215341 lt!435620)))

(declare-datatypes ((tuple4!1014 0))(
  ( (tuple4!1015 (_1!13162 (_ BitVec 32)) (_2!13162 (_ BitVec 32)) (_3!1464 (_ BitVec 32)) (_4!507 (_ BitVec 32))) )
))
(declare-fun lt!435623 () tuple4!1014)

(declare-datatypes ((array!18200 0))(
  ( (array!18201 (arr!8986 (Array (_ BitVec 32) (_ BitVec 8))) (size!7903 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18200)

(declare-fun a2!948 () array!18200)

(declare-fun lt!435617 () tuple4!1014)

(declare-fun arrayRangesEqImpliesEq!220 (array!18200 array!18200 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20965)

(assert (=> b!299908 (= lt!435620 (arrayRangesEqImpliesEq!220 a1!948 a2!948 (_1!13162 lt!435623) (_3!1464 lt!435617) (_2!13162 lt!435623)))))

(assert (=> b!299908 (= (select (arr!8986 a1!948) (_3!1464 lt!435617)) (select (arr!8986 a2!948) (_3!1464 lt!435617)))))

(declare-fun res!247390 () Bool)

(declare-fun e!215347 () Bool)

(assert (=> start!67000 (=> (not res!247390) (not e!215347))))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> start!67000 (= res!247390 (and (bvsle (size!7903 a1!948) (size!7903 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67000 e!215347))

(assert (=> start!67000 true))

(declare-fun array_inv!7515 (array!18200) Bool)

(assert (=> start!67000 (array_inv!7515 a1!948)))

(assert (=> start!67000 (array_inv!7515 a2!948)))

(declare-fun b!299909 () Bool)

(declare-fun res!247386 () Bool)

(declare-fun e!215342 () Bool)

(assert (=> b!299909 (=> (not res!247386) (not e!215342))))

(declare-fun lt!435619 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299909 (= res!247386 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435619) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299910 () Bool)

(declare-fun e!215349 () Bool)

(assert (=> b!299910 (= e!215349 false)))

(declare-fun lt!435618 () Unit!20965)

(assert (=> b!299910 (= lt!435618 e!215341)))

(declare-fun c!13845 () Bool)

(assert (=> b!299910 (= c!13845 (and (bvslt (_3!1464 lt!435623) (_3!1464 lt!435617)) (bvslt (_3!1464 lt!435617) (_4!507 lt!435623))))))

(declare-fun b!299911 () Bool)

(declare-fun e!215346 () Unit!20965)

(declare-fun lt!435616 () Unit!20965)

(assert (=> b!299911 (= e!215346 lt!435616)))

(declare-fun arrayRangesEqSlicedLemma!175 (array!18200 array!18200 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20965)

(assert (=> b!299911 (= lt!435616 (arrayRangesEqSlicedLemma!175 a1!948 a2!948 (_1!13162 lt!435623) (_2!13162 lt!435623) (_1!13162 lt!435617) (_2!13162 lt!435617)))))

(declare-fun arrayRangesEq!1565 (array!18200 array!18200 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299911 (arrayRangesEq!1565 a1!948 a2!948 (_1!13162 lt!435617) (_2!13162 lt!435617))))

(declare-fun b!299912 () Bool)

(declare-fun Unit!20967 () Unit!20965)

(assert (=> b!299912 (= e!215346 Unit!20967)))

(declare-fun b!299913 () Bool)

(declare-fun res!247391 () Bool)

(assert (=> b!299913 (=> (not res!247391) (not e!215342))))

(declare-fun arrayBitRangesEq!0 (array!18200 array!18200 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299913 (= res!247391 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299914 () Bool)

(declare-fun Unit!20968 () Unit!20965)

(assert (=> b!299914 (= e!215341 Unit!20968)))

(declare-fun b!299915 () Bool)

(declare-fun e!215343 () Bool)

(assert (=> b!299915 (= e!215343 e!215345)))

(declare-fun res!247387 () Bool)

(declare-fun lt!435622 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299915 (= res!247387 (byteRangesEq!0 (select (arr!8986 a1!948) (_3!1464 lt!435623)) (select (arr!8986 a2!948) (_3!1464 lt!435623)) lt!435622 #b00000000000000000000000000000111))))

(assert (=> b!299915 (=> (not res!247387) (not e!215345))))

(declare-fun bm!5339 () Bool)

(declare-fun call!5342 () Bool)

(declare-fun c!13844 () Bool)

(assert (=> bm!5339 (= call!5342 (byteRangesEq!0 (ite c!13844 (select (arr!8986 a1!948) (_3!1464 lt!435623)) (select (arr!8986 a1!948) (_4!507 lt!435623))) (ite c!13844 (select (arr!8986 a2!948) (_3!1464 lt!435623)) (select (arr!8986 a2!948) (_4!507 lt!435623))) (ite c!13844 lt!435622 #b00000000000000000000000000000000) lt!435621))))

(declare-fun b!299916 () Bool)

(assert (=> b!299916 (= e!215343 call!5342)))

(declare-fun b!299917 () Bool)

(assert (=> b!299917 (= e!215342 e!215349)))

(declare-fun res!247388 () Bool)

(assert (=> b!299917 (=> (not res!247388) (not e!215349))))

(assert (=> b!299917 (= res!247388 e!215343)))

(assert (=> b!299917 (= c!13844 (= (_3!1464 lt!435623) (_4!507 lt!435623)))))

(declare-fun lt!435624 () Unit!20965)

(assert (=> b!299917 (= lt!435624 e!215346)))

(declare-fun c!13843 () Bool)

(assert (=> b!299917 (= c!13843 (bvslt (_1!13162 lt!435617) (_2!13162 lt!435617)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1014)

(assert (=> b!299917 (= lt!435617 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!299917 (= lt!435621 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299917 (= lt!435622 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299917 (= lt!435623 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299918 () Bool)

(assert (=> b!299918 (= e!215348 call!5342)))

(declare-fun b!299919 () Bool)

(assert (=> b!299919 (= e!215347 e!215342)))

(declare-fun res!247389 () Bool)

(assert (=> b!299919 (=> (not res!247389) (not e!215342))))

(assert (=> b!299919 (= res!247389 (and (bvsle toBit!258 lt!435619) (bvsle fromBit!258 lt!435619)))))

(assert (=> b!299919 (= lt!435619 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7903 a1!948))))))

(assert (= (and start!67000 res!247390) b!299919))

(assert (= (and b!299919 res!247389) b!299913))

(assert (= (and b!299913 res!247391) b!299909))

(assert (= (and b!299909 res!247386) b!299917))

(assert (= (and b!299917 c!13843) b!299911))

(assert (= (and b!299917 (not c!13843)) b!299912))

(assert (= (and b!299917 c!13844) b!299916))

(assert (= (and b!299917 (not c!13844)) b!299915))

(assert (= (and b!299915 res!247387) b!299907))

(assert (= (and b!299907 (not res!247385)) b!299918))

(assert (= (or b!299916 b!299918) bm!5339))

(assert (= (and b!299917 res!247388) b!299910))

(assert (= (and b!299910 c!13845) b!299908))

(assert (= (and b!299910 (not c!13845)) b!299914))

(declare-fun m!438967 () Bool)

(assert (=> b!299913 m!438967))

(declare-fun m!438969 () Bool)

(assert (=> b!299917 m!438969))

(declare-fun m!438971 () Bool)

(assert (=> b!299917 m!438971))

(declare-fun m!438973 () Bool)

(assert (=> b!299908 m!438973))

(declare-fun m!438975 () Bool)

(assert (=> b!299908 m!438975))

(declare-fun m!438977 () Bool)

(assert (=> b!299908 m!438977))

(declare-fun m!438979 () Bool)

(assert (=> bm!5339 m!438979))

(declare-fun m!438981 () Bool)

(assert (=> bm!5339 m!438981))

(declare-fun m!438983 () Bool)

(assert (=> bm!5339 m!438983))

(declare-fun m!438985 () Bool)

(assert (=> bm!5339 m!438985))

(declare-fun m!438987 () Bool)

(assert (=> bm!5339 m!438987))

(assert (=> b!299915 m!438985))

(assert (=> b!299915 m!438981))

(assert (=> b!299915 m!438985))

(assert (=> b!299915 m!438981))

(declare-fun m!438989 () Bool)

(assert (=> b!299915 m!438989))

(declare-fun m!438991 () Bool)

(assert (=> start!67000 m!438991))

(declare-fun m!438993 () Bool)

(assert (=> start!67000 m!438993))

(declare-fun m!438995 () Bool)

(assert (=> b!299911 m!438995))

(declare-fun m!438997 () Bool)

(assert (=> b!299911 m!438997))

(push 1)

(assert (not b!299908))

(assert (not b!299915))

(assert (not b!299917))

(assert (not start!67000))

(assert (not b!299911))

(assert (not bm!5339))

(assert (not b!299913))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

