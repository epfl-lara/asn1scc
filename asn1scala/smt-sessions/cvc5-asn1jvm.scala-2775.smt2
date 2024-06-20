; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67012 () Bool)

(assert start!67012)

(declare-fun b!300141 () Bool)

(declare-fun e!215528 () Bool)

(declare-fun call!5360 () Bool)

(assert (=> b!300141 (= e!215528 call!5360)))

(declare-fun bm!5357 () Bool)

(declare-datatypes ((tuple4!1026 0))(
  ( (tuple4!1027 (_1!13168 (_ BitVec 32)) (_2!13168 (_ BitVec 32)) (_3!1470 (_ BitVec 32)) (_4!513 (_ BitVec 32))) )
))
(declare-fun lt!435781 () tuple4!1026)

(declare-datatypes ((array!18212 0))(
  ( (array!18213 (arr!8992 (Array (_ BitVec 32) (_ BitVec 8))) (size!7909 (_ BitVec 32))) )
))
(declare-fun a2!948 () array!18212)

(declare-fun lt!435779 () (_ BitVec 32))

(declare-fun lt!435785 () (_ BitVec 32))

(declare-fun c!13899 () Bool)

(declare-fun a1!948 () array!18212)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5357 (= call!5360 (byteRangesEq!0 (ite c!13899 (select (arr!8992 a1!948) (_3!1470 lt!435781)) (select (arr!8992 a1!948) (_4!513 lt!435781))) (ite c!13899 (select (arr!8992 a2!948) (_3!1470 lt!435781)) (select (arr!8992 a2!948) (_4!513 lt!435781))) (ite c!13899 lt!435779 #b00000000000000000000000000000000) lt!435785))))

(declare-fun b!300142 () Bool)

(declare-fun e!215524 () Bool)

(declare-fun e!215526 () Bool)

(assert (=> b!300142 (= e!215524 e!215526)))

(declare-fun res!247514 () Bool)

(assert (=> b!300142 (= res!247514 (byteRangesEq!0 (select (arr!8992 a1!948) (_3!1470 lt!435781)) (select (arr!8992 a2!948) (_3!1470 lt!435781)) lt!435779 #b00000000000000000000000000000111))))

(assert (=> b!300142 (=> (not res!247514) (not e!215526))))

(declare-fun b!300144 () Bool)

(declare-datatypes ((Unit!20989 0))(
  ( (Unit!20990) )
))
(declare-fun e!215520 () Unit!20989)

(declare-fun Unit!20991 () Unit!20989)

(assert (=> b!300144 (= e!215520 Unit!20991)))

(declare-fun b!300145 () Bool)

(declare-fun res!247515 () Bool)

(assert (=> b!300145 (= res!247515 (= lt!435785 #b00000000000000000000000000000000))))

(assert (=> b!300145 (=> res!247515 e!215528)))

(assert (=> b!300145 (= e!215526 e!215528)))

(declare-fun b!300146 () Bool)

(declare-fun res!247516 () Bool)

(declare-fun e!215522 () Bool)

(assert (=> b!300146 (=> (not res!247516) (not e!215522))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!435783 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!300146 (= res!247516 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435783) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!300147 () Bool)

(declare-fun e!215525 () Bool)

(assert (=> b!300147 (= e!215525 false)))

(declare-fun lt!435782 () Unit!20989)

(assert (=> b!300147 (= lt!435782 e!215520)))

(declare-fun c!13897 () Bool)

(declare-fun lt!435786 () tuple4!1026)

(assert (=> b!300147 (= c!13897 (and (bvslt (_3!1470 lt!435781) (_3!1470 lt!435786)) (bvslt (_3!1470 lt!435786) (_4!513 lt!435781))))))

(declare-fun b!300148 () Bool)

(declare-fun e!215529 () Bool)

(assert (=> b!300148 (= e!215529 e!215522)))

(declare-fun res!247517 () Bool)

(assert (=> b!300148 (=> (not res!247517) (not e!215522))))

(assert (=> b!300148 (= res!247517 (and (bvsle toBit!258 lt!435783) (bvsle fromBit!258 lt!435783)))))

(assert (=> b!300148 (= lt!435783 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7909 a1!948))))))

(declare-fun b!300143 () Bool)

(declare-fun lt!435784 () Unit!20989)

(assert (=> b!300143 (= e!215520 lt!435784)))

(declare-fun arrayRangesEqImpliesEq!226 (array!18212 array!18212 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20989)

(assert (=> b!300143 (= lt!435784 (arrayRangesEqImpliesEq!226 a1!948 a2!948 (_1!13168 lt!435781) (_3!1470 lt!435786) (_2!13168 lt!435781)))))

(assert (=> b!300143 (= (select (arr!8992 a1!948) (_3!1470 lt!435786)) (select (arr!8992 a2!948) (_3!1470 lt!435786)))))

(declare-fun res!247512 () Bool)

(assert (=> start!67012 (=> (not res!247512) (not e!215529))))

(assert (=> start!67012 (= res!247512 (and (bvsle (size!7909 a1!948) (size!7909 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67012 e!215529))

(assert (=> start!67012 true))

(declare-fun array_inv!7521 (array!18212) Bool)

(assert (=> start!67012 (array_inv!7521 a1!948)))

(assert (=> start!67012 (array_inv!7521 a2!948)))

(declare-fun b!300149 () Bool)

(declare-fun e!215523 () Unit!20989)

(declare-fun lt!435778 () Unit!20989)

(assert (=> b!300149 (= e!215523 lt!435778)))

(declare-fun arrayRangesEqSlicedLemma!181 (array!18212 array!18212 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20989)

(assert (=> b!300149 (= lt!435778 (arrayRangesEqSlicedLemma!181 a1!948 a2!948 (_1!13168 lt!435781) (_2!13168 lt!435781) (_1!13168 lt!435786) (_2!13168 lt!435786)))))

(declare-fun arrayRangesEq!1571 (array!18212 array!18212 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300149 (arrayRangesEq!1571 a1!948 a2!948 (_1!13168 lt!435786) (_2!13168 lt!435786))))

(declare-fun b!300150 () Bool)

(assert (=> b!300150 (= e!215524 call!5360)))

(declare-fun b!300151 () Bool)

(assert (=> b!300151 (= e!215522 e!215525)))

(declare-fun res!247511 () Bool)

(assert (=> b!300151 (=> (not res!247511) (not e!215525))))

(assert (=> b!300151 (= res!247511 e!215524)))

(assert (=> b!300151 (= c!13899 (= (_3!1470 lt!435781) (_4!513 lt!435781)))))

(declare-fun lt!435780 () Unit!20989)

(assert (=> b!300151 (= lt!435780 e!215523)))

(declare-fun c!13898 () Bool)

(assert (=> b!300151 (= c!13898 (bvslt (_1!13168 lt!435786) (_2!13168 lt!435786)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1026)

(assert (=> b!300151 (= lt!435786 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!300151 (= lt!435785 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300151 (= lt!435779 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300151 (= lt!435781 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!300152 () Bool)

(declare-fun res!247513 () Bool)

(assert (=> b!300152 (=> (not res!247513) (not e!215522))))

(declare-fun arrayBitRangesEq!0 (array!18212 array!18212 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!300152 (= res!247513 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!300153 () Bool)

(declare-fun Unit!20992 () Unit!20989)

(assert (=> b!300153 (= e!215523 Unit!20992)))

(assert (= (and start!67012 res!247512) b!300148))

(assert (= (and b!300148 res!247517) b!300152))

(assert (= (and b!300152 res!247513) b!300146))

(assert (= (and b!300146 res!247516) b!300151))

(assert (= (and b!300151 c!13898) b!300149))

(assert (= (and b!300151 (not c!13898)) b!300153))

(assert (= (and b!300151 c!13899) b!300150))

(assert (= (and b!300151 (not c!13899)) b!300142))

(assert (= (and b!300142 res!247514) b!300145))

(assert (= (and b!300145 (not res!247515)) b!300141))

(assert (= (or b!300150 b!300141) bm!5357))

(assert (= (and b!300151 res!247511) b!300147))

(assert (= (and b!300147 c!13897) b!300143))

(assert (= (and b!300147 (not c!13897)) b!300144))

(declare-fun m!439159 () Bool)

(assert (=> b!300142 m!439159))

(declare-fun m!439161 () Bool)

(assert (=> b!300142 m!439161))

(assert (=> b!300142 m!439159))

(assert (=> b!300142 m!439161))

(declare-fun m!439163 () Bool)

(assert (=> b!300142 m!439163))

(declare-fun m!439165 () Bool)

(assert (=> b!300143 m!439165))

(declare-fun m!439167 () Bool)

(assert (=> b!300143 m!439167))

(declare-fun m!439169 () Bool)

(assert (=> b!300143 m!439169))

(assert (=> bm!5357 m!439159))

(declare-fun m!439171 () Bool)

(assert (=> bm!5357 m!439171))

(declare-fun m!439173 () Bool)

(assert (=> bm!5357 m!439173))

(declare-fun m!439175 () Bool)

(assert (=> bm!5357 m!439175))

(assert (=> bm!5357 m!439161))

(declare-fun m!439177 () Bool)

(assert (=> start!67012 m!439177))

(declare-fun m!439179 () Bool)

(assert (=> start!67012 m!439179))

(declare-fun m!439181 () Bool)

(assert (=> b!300149 m!439181))

(declare-fun m!439183 () Bool)

(assert (=> b!300149 m!439183))

(declare-fun m!439185 () Bool)

(assert (=> b!300151 m!439185))

(declare-fun m!439187 () Bool)

(assert (=> b!300151 m!439187))

(declare-fun m!439189 () Bool)

(assert (=> b!300152 m!439189))

(push 1)

(assert (not b!300151))

(assert (not start!67012))

(assert (not bm!5357))

(assert (not b!300149))

(assert (not b!300152))

(assert (not b!300143))

(assert (not b!300142))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

