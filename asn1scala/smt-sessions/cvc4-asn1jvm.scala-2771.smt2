; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66992 () Bool)

(assert start!66992)

(declare-fun b!299751 () Bool)

(declare-datatypes ((Unit!20949 0))(
  ( (Unit!20950) )
))
(declare-fun e!215224 () Unit!20949)

(declare-fun lt!435514 () Unit!20949)

(assert (=> b!299751 (= e!215224 lt!435514)))

(declare-datatypes ((tuple4!1006 0))(
  ( (tuple4!1007 (_1!13158 (_ BitVec 32)) (_2!13158 (_ BitVec 32)) (_3!1460 (_ BitVec 32)) (_4!503 (_ BitVec 32))) )
))
(declare-fun lt!435509 () tuple4!1006)

(declare-datatypes ((array!18192 0))(
  ( (array!18193 (arr!8982 (Array (_ BitVec 32) (_ BitVec 8))) (size!7899 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18192)

(declare-fun a2!948 () array!18192)

(declare-fun lt!435511 () tuple4!1006)

(declare-fun arrayRangesEqSlicedLemma!171 (array!18192 array!18192 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20949)

(assert (=> b!299751 (= lt!435514 (arrayRangesEqSlicedLemma!171 a1!948 a2!948 (_1!13158 lt!435509) (_2!13158 lt!435509) (_1!13158 lt!435511) (_2!13158 lt!435511)))))

(declare-fun arrayRangesEq!1561 (array!18192 array!18192 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299751 (arrayRangesEq!1561 a1!948 a2!948 (_1!13158 lt!435511) (_2!13158 lt!435511))))

(declare-fun b!299752 () Bool)

(declare-fun e!215220 () Bool)

(declare-fun e!215227 () Bool)

(assert (=> b!299752 (= e!215220 e!215227)))

(declare-fun res!247306 () Bool)

(assert (=> b!299752 (=> (not res!247306) (not e!215227))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!435512 () (_ BitVec 64))

(assert (=> b!299752 (= res!247306 (and (bvsle toBit!258 lt!435512) (bvsle fromBit!258 lt!435512)))))

(assert (=> b!299752 (= lt!435512 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7899 a1!948))))))

(declare-fun bm!5327 () Bool)

(declare-fun c!13808 () Bool)

(declare-fun lt!435515 () (_ BitVec 32))

(declare-fun call!5330 () Bool)

(declare-fun lt!435513 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5327 (= call!5330 (byteRangesEq!0 (ite c!13808 (select (arr!8982 a1!948) (_3!1460 lt!435509)) (select (arr!8982 a1!948) (_4!503 lt!435509))) (ite c!13808 (select (arr!8982 a2!948) (_3!1460 lt!435509)) (select (arr!8982 a2!948) (_4!503 lt!435509))) (ite c!13808 lt!435513 #b00000000000000000000000000000000) lt!435515))))

(declare-fun b!299753 () Bool)

(declare-fun res!247301 () Bool)

(assert (=> b!299753 (=> (not res!247301) (not e!215227))))

(declare-fun arrayBitRangesEq!0 (array!18192 array!18192 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299753 (= res!247301 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299754 () Bool)

(declare-fun e!215225 () Bool)

(assert (=> b!299754 (= e!215227 e!215225)))

(declare-fun res!247303 () Bool)

(assert (=> b!299754 (=> (not res!247303) (not e!215225))))

(declare-fun e!215229 () Bool)

(assert (=> b!299754 (= res!247303 e!215229)))

(assert (=> b!299754 (= c!13808 (= (_3!1460 lt!435509) (_4!503 lt!435509)))))

(declare-fun lt!435508 () Unit!20949)

(assert (=> b!299754 (= lt!435508 e!215224)))

(declare-fun c!13807 () Bool)

(assert (=> b!299754 (= c!13807 (bvslt (_1!13158 lt!435511) (_2!13158 lt!435511)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1006)

(assert (=> b!299754 (= lt!435511 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!299754 (= lt!435515 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299754 (= lt!435513 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299754 (= lt!435509 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299755 () Bool)

(declare-fun res!247305 () Bool)

(assert (=> b!299755 (= res!247305 (= lt!435515 #b00000000000000000000000000000000))))

(declare-fun e!215221 () Bool)

(assert (=> b!299755 (=> res!247305 e!215221)))

(declare-fun e!215223 () Bool)

(assert (=> b!299755 (= e!215223 e!215221)))

(declare-fun b!299756 () Bool)

(declare-fun e!215222 () Unit!20949)

(declare-fun lt!435516 () Unit!20949)

(assert (=> b!299756 (= e!215222 lt!435516)))

(declare-fun arrayRangesEqImpliesEq!216 (array!18192 array!18192 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20949)

(assert (=> b!299756 (= lt!435516 (arrayRangesEqImpliesEq!216 a1!948 a2!948 (_1!13158 lt!435509) (_3!1460 lt!435511) (_2!13158 lt!435509)))))

(assert (=> b!299756 (= (select (arr!8982 a1!948) (_3!1460 lt!435511)) (select (arr!8982 a2!948) (_3!1460 lt!435511)))))

(declare-fun b!299757 () Bool)

(declare-fun Unit!20951 () Unit!20949)

(assert (=> b!299757 (= e!215224 Unit!20951)))

(declare-fun b!299758 () Bool)

(assert (=> b!299758 (= e!215229 call!5330)))

(declare-fun b!299759 () Bool)

(assert (=> b!299759 (= e!215221 call!5330)))

(declare-fun res!247304 () Bool)

(assert (=> start!66992 (=> (not res!247304) (not e!215220))))

(assert (=> start!66992 (= res!247304 (and (bvsle (size!7899 a1!948) (size!7899 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66992 e!215220))

(assert (=> start!66992 true))

(declare-fun array_inv!7511 (array!18192) Bool)

(assert (=> start!66992 (array_inv!7511 a1!948)))

(assert (=> start!66992 (array_inv!7511 a2!948)))

(declare-fun b!299760 () Bool)

(assert (=> b!299760 (= e!215229 e!215223)))

(declare-fun res!247302 () Bool)

(assert (=> b!299760 (= res!247302 (byteRangesEq!0 (select (arr!8982 a1!948) (_3!1460 lt!435509)) (select (arr!8982 a2!948) (_3!1460 lt!435509)) lt!435513 #b00000000000000000000000000000111))))

(assert (=> b!299760 (=> (not res!247302) (not e!215223))))

(declare-fun b!299761 () Bool)

(declare-fun res!247307 () Bool)

(assert (=> b!299761 (=> (not res!247307) (not e!215227))))

(assert (=> b!299761 (= res!247307 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435512) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299762 () Bool)

(declare-fun Unit!20952 () Unit!20949)

(assert (=> b!299762 (= e!215222 Unit!20952)))

(declare-fun b!299763 () Bool)

(assert (=> b!299763 (= e!215225 false)))

(declare-fun lt!435510 () Unit!20949)

(assert (=> b!299763 (= lt!435510 e!215222)))

(declare-fun c!13809 () Bool)

(assert (=> b!299763 (= c!13809 (and (bvslt (_3!1460 lt!435509) (_3!1460 lt!435511)) (bvslt (_3!1460 lt!435511) (_4!503 lt!435509))))))

(assert (= (and start!66992 res!247304) b!299752))

(assert (= (and b!299752 res!247306) b!299753))

(assert (= (and b!299753 res!247301) b!299761))

(assert (= (and b!299761 res!247307) b!299754))

(assert (= (and b!299754 c!13807) b!299751))

(assert (= (and b!299754 (not c!13807)) b!299757))

(assert (= (and b!299754 c!13808) b!299758))

(assert (= (and b!299754 (not c!13808)) b!299760))

(assert (= (and b!299760 res!247302) b!299755))

(assert (= (and b!299755 (not res!247305)) b!299759))

(assert (= (or b!299758 b!299759) bm!5327))

(assert (= (and b!299754 res!247303) b!299763))

(assert (= (and b!299763 c!13809) b!299756))

(assert (= (and b!299763 (not c!13809)) b!299762))

(declare-fun m!438839 () Bool)

(assert (=> b!299753 m!438839))

(declare-fun m!438841 () Bool)

(assert (=> bm!5327 m!438841))

(declare-fun m!438843 () Bool)

(assert (=> bm!5327 m!438843))

(declare-fun m!438845 () Bool)

(assert (=> bm!5327 m!438845))

(declare-fun m!438847 () Bool)

(assert (=> bm!5327 m!438847))

(declare-fun m!438849 () Bool)

(assert (=> bm!5327 m!438849))

(assert (=> b!299760 m!438845))

(assert (=> b!299760 m!438843))

(assert (=> b!299760 m!438845))

(assert (=> b!299760 m!438843))

(declare-fun m!438851 () Bool)

(assert (=> b!299760 m!438851))

(declare-fun m!438853 () Bool)

(assert (=> b!299751 m!438853))

(declare-fun m!438855 () Bool)

(assert (=> b!299751 m!438855))

(declare-fun m!438857 () Bool)

(assert (=> b!299754 m!438857))

(declare-fun m!438859 () Bool)

(assert (=> b!299754 m!438859))

(declare-fun m!438861 () Bool)

(assert (=> start!66992 m!438861))

(declare-fun m!438863 () Bool)

(assert (=> start!66992 m!438863))

(declare-fun m!438865 () Bool)

(assert (=> b!299756 m!438865))

(declare-fun m!438867 () Bool)

(assert (=> b!299756 m!438867))

(declare-fun m!438869 () Bool)

(assert (=> b!299756 m!438869))

(push 1)

