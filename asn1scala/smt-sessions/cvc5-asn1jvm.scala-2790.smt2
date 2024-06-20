; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67308 () Bool)

(assert start!67308)

(declare-fun res!248715 () Bool)

(declare-fun e!217162 () Bool)

(assert (=> start!67308 (=> (not res!248715) (not e!217162))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18317 0))(
  ( (array!18318 (arr!9037 (Array (_ BitVec 32) (_ BitVec 8))) (size!7954 (_ BitVec 32))) )
))
(declare-fun a2!948 () array!18317)

(declare-fun a1!948 () array!18317)

(assert (=> start!67308 (= res!248715 (and (bvsle (size!7954 a1!948) (size!7954 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67308 e!217162))

(assert (=> start!67308 true))

(declare-fun array_inv!7566 (array!18317) Bool)

(assert (=> start!67308 (array_inv!7566 a1!948)))

(assert (=> start!67308 (array_inv!7566 a2!948)))

(declare-fun b!302235 () Bool)

(declare-fun res!248716 () Bool)

(declare-fun e!217160 () Bool)

(assert (=> b!302235 (=> (not res!248716) (not e!217160))))

(declare-fun lt!437187 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302235 (= res!248716 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437187) (= fromSlice!52 toSlice!52)))))

(declare-fun b!302234 () Bool)

(declare-fun res!248718 () Bool)

(assert (=> b!302234 (=> (not res!248718) (not e!217160))))

(declare-fun arrayBitRangesEq!0 (array!18317 array!18317 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302234 (= res!248718 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302233 () Bool)

(assert (=> b!302233 (= e!217162 e!217160)))

(declare-fun res!248717 () Bool)

(assert (=> b!302233 (=> (not res!248717) (not e!217160))))

(assert (=> b!302233 (= res!248717 (and (bvsle toBit!258 lt!437187) (bvsle fromBit!258 lt!437187)))))

(assert (=> b!302233 (= lt!437187 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7954 a1!948))))))

(declare-fun b!302236 () Bool)

(assert (=> b!302236 (= e!217160 (not (arrayBitRangesEq!0 a1!948 a2!948 fromSlice!52 toSlice!52)))))

(assert (= (and start!67308 res!248715) b!302233))

(assert (= (and b!302233 res!248717) b!302234))

(assert (= (and b!302234 res!248718) b!302235))

(assert (= (and b!302235 res!248716) b!302236))

(declare-fun m!441117 () Bool)

(assert (=> start!67308 m!441117))

(declare-fun m!441119 () Bool)

(assert (=> start!67308 m!441119))

(declare-fun m!441121 () Bool)

(assert (=> b!302234 m!441121))

(declare-fun m!441123 () Bool)

(assert (=> b!302236 m!441123))

(push 1)

(assert (not b!302236))

(assert (not b!302234))

(assert (not start!67308))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!302289 () Bool)

(declare-fun e!217215 () Bool)

(declare-fun e!217214 () Bool)

(assert (=> b!302289 (= e!217215 e!217214)))

(declare-fun res!248765 () Bool)

(assert (=> b!302289 (=> (not res!248765) (not e!217214))))

(declare-fun e!217212 () Bool)

(assert (=> b!302289 (= res!248765 e!217212)))

(declare-fun res!248766 () Bool)

(assert (=> b!302289 (=> res!248766 e!217212)))

(declare-datatypes ((tuple4!1098 0))(
  ( (tuple4!1099 (_1!13204 (_ BitVec 32)) (_2!13204 (_ BitVec 32)) (_3!1506 (_ BitVec 32)) (_4!549 (_ BitVec 32))) )
))
(declare-fun lt!437208 () tuple4!1098)

(assert (=> b!302289 (= res!248766 (bvsge (_1!13204 lt!437208) (_2!13204 lt!437208)))))

(declare-fun lt!437207 () (_ BitVec 32))

(assert (=> b!302289 (= lt!437207 ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437206 () (_ BitVec 32))

(assert (=> b!302289 (= lt!437206 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1098)

(assert (=> b!302289 (= lt!437208 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun b!302290 () Bool)

(declare-fun arrayRangesEq!1607 (array!18317 array!18317 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302290 (= e!217212 (arrayRangesEq!1607 a1!948 a2!948 (_1!13204 lt!437208) (_2!13204 lt!437208)))))

(declare-fun bm!5512 () Bool)

(declare-fun c!14345 () Bool)

(declare-fun call!5515 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5512 (= call!5515 (byteRangesEq!0 (ite c!14345 (select (arr!9037 a1!948) (_3!1506 lt!437208)) (select (arr!9037 a1!948) (_4!549 lt!437208))) (ite c!14345 (select (arr!9037 a2!948) (_3!1506 lt!437208)) (select (arr!9037 a2!948) (_4!549 lt!437208))) (ite c!14345 lt!437206 #b00000000000000000000000000000000) lt!437207))))

(declare-fun b!302291 () Bool)

(declare-fun e!217216 () Bool)

(assert (=> b!302291 (= e!217214 e!217216)))

(assert (=> b!302291 (= c!14345 (= (_3!1506 lt!437208) (_4!549 lt!437208)))))

(declare-fun b!302292 () Bool)

(declare-fun e!217213 () Bool)

(assert (=> b!302292 (= e!217216 e!217213)))

(declare-fun res!248764 () Bool)

(assert (=> b!302292 (= res!248764 (byteRangesEq!0 (select (arr!9037 a1!948) (_3!1506 lt!437208)) (select (arr!9037 a2!948) (_3!1506 lt!437208)) lt!437206 #b00000000000000000000000000001000))))

(assert (=> b!302292 (=> (not res!248764) (not e!217213))))

(declare-fun b!302293 () Bool)

(assert (=> b!302293 (= e!217216 call!5515)))

(declare-fun d!101046 () Bool)

(declare-fun res!248767 () Bool)

(assert (=> d!101046 (=> res!248767 e!217215)))

(assert (=> d!101046 (= res!248767 (bvsge fromSlice!52 toSlice!52))))

(assert (=> d!101046 (= (arrayBitRangesEq!0 a1!948 a2!948 fromSlice!52 toSlice!52) e!217215)))

(declare-fun b!302294 () Bool)

(declare-fun e!217211 () Bool)

(assert (=> b!302294 (= e!217211 call!5515)))

(declare-fun b!302295 () Bool)

(declare-fun res!248763 () Bool)

(assert (=> b!302295 (= res!248763 (= lt!437207 #b00000000000000000000000000000000))))

(assert (=> b!302295 (=> res!248763 e!217211)))

(assert (=> b!302295 (= e!217213 e!217211)))

(assert (= (and d!101046 (not res!248767)) b!302289))

(assert (= (and b!302289 (not res!248766)) b!302290))

(assert (= (and b!302289 res!248765) b!302291))

(assert (= (and b!302291 c!14345) b!302293))

(assert (= (and b!302291 (not c!14345)) b!302292))

(assert (= (and b!302292 res!248764) b!302295))

(assert (= (and b!302295 (not res!248763)) b!302294))

(assert (= (or b!302293 b!302294) bm!5512))

(declare-fun m!441141 () Bool)

(assert (=> b!302289 m!441141))

(declare-fun m!441143 () Bool)

(assert (=> b!302290 m!441143))

(declare-fun m!441145 () Bool)

(assert (=> bm!5512 m!441145))

(declare-fun m!441147 () Bool)

(assert (=> bm!5512 m!441147))

(declare-fun m!441149 () Bool)

(assert (=> bm!5512 m!441149))

(declare-fun m!441151 () Bool)

(assert (=> bm!5512 m!441151))

(declare-fun m!441153 () Bool)

(assert (=> bm!5512 m!441153))

(assert (=> b!302292 m!441153))

(assert (=> b!302292 m!441149))

(assert (=> b!302292 m!441153))

(assert (=> b!302292 m!441149))

(declare-fun m!441155 () Bool)

(assert (=> b!302292 m!441155))

(assert (=> b!302236 d!101046))

(declare-fun b!302296 () Bool)

(declare-fun e!217221 () Bool)

(declare-fun e!217220 () Bool)

(assert (=> b!302296 (= e!217221 e!217220)))

(declare-fun res!248770 () Bool)

(assert (=> b!302296 (=> (not res!248770) (not e!217220))))

(declare-fun e!217218 () Bool)

(assert (=> b!302296 (= res!248770 e!217218)))

(declare-fun res!248771 () Bool)

(assert (=> b!302296 (=> res!248771 e!217218)))

(declare-fun lt!437211 () tuple4!1098)

(assert (=> b!302296 (= res!248771 (bvsge (_1!13204 lt!437211) (_2!13204 lt!437211)))))

(declare-fun lt!437210 () (_ BitVec 32))

(assert (=> b!302296 (= lt!437210 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437209 () (_ BitVec 32))

(assert (=> b!302296 (= lt!437209 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302296 (= lt!437211 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302297 () Bool)

(assert (=> b!302297 (= e!217218 (arrayRangesEq!1607 a1!948 a2!948 (_1!13204 lt!437211) (_2!13204 lt!437211)))))

(declare-fun c!14346 () Bool)

(declare-fun call!5516 () Bool)

(declare-fun bm!5513 () Bool)

(assert (=> bm!5513 (= call!5516 (byteRangesEq!0 (ite c!14346 (select (arr!9037 a1!948) (_3!1506 lt!437211)) (select (arr!9037 a1!948) (_4!549 lt!437211))) (ite c!14346 (select (arr!9037 a2!948) (_3!1506 lt!437211)) (select (arr!9037 a2!948) (_4!549 lt!437211))) (ite c!14346 lt!437209 #b00000000000000000000000000000000) lt!437210))))

(declare-fun b!302298 () Bool)

(declare-fun e!217222 () Bool)

(assert (=> b!302298 (= e!217220 e!217222)))

(assert (=> b!302298 (= c!14346 (= (_3!1506 lt!437211) (_4!549 lt!437211)))))

(declare-fun b!302299 () Bool)

(declare-fun e!217219 () Bool)

(assert (=> b!302299 (= e!217222 e!217219)))

(declare-fun res!248769 () Bool)

(assert (=> b!302299 (= res!248769 (byteRangesEq!0 (select (arr!9037 a1!948) (_3!1506 lt!437211)) (select (arr!9037 a2!948) (_3!1506 lt!437211)) lt!437209 #b00000000000000000000000000001000))))

(assert (=> b!302299 (=> (not res!248769) (not e!217219))))

(declare-fun b!302300 () Bool)

(assert (=> b!302300 (= e!217222 call!5516)))

(declare-fun d!101056 () Bool)

(declare-fun res!248772 () Bool)

(assert (=> d!101056 (=> res!248772 e!217221)))

(assert (=> d!101056 (= res!248772 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101056 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!217221)))

(declare-fun b!302301 () Bool)

(declare-fun e!217217 () Bool)

(assert (=> b!302301 (= e!217217 call!5516)))

(declare-fun b!302302 () Bool)

(declare-fun res!248768 () Bool)

(assert (=> b!302302 (= res!248768 (= lt!437210 #b00000000000000000000000000000000))))

(assert (=> b!302302 (=> res!248768 e!217217)))

(assert (=> b!302302 (= e!217219 e!217217)))

(assert (= (and d!101056 (not res!248772)) b!302296))

(assert (= (and b!302296 (not res!248771)) b!302297))

(assert (= (and b!302296 res!248770) b!302298))

(assert (= (and b!302298 c!14346) b!302300))

(assert (= (and b!302298 (not c!14346)) b!302299))

(assert (= (and b!302299 res!248769) b!302302))

(assert (= (and b!302302 (not res!248768)) b!302301))

(assert (= (or b!302300 b!302301) bm!5513))

(declare-fun m!441157 () Bool)

(assert (=> b!302296 m!441157))

(declare-fun m!441159 () Bool)

(assert (=> b!302297 m!441159))

(declare-fun m!441161 () Bool)

(assert (=> bm!5513 m!441161))

(declare-fun m!441163 () Bool)

(assert (=> bm!5513 m!441163))

(declare-fun m!441165 () Bool)

(assert (=> bm!5513 m!441165))

(declare-fun m!441167 () Bool)

(assert (=> bm!5513 m!441167))

(declare-fun m!441169 () Bool)

(assert (=> bm!5513 m!441169))

(assert (=> b!302299 m!441169))

(assert (=> b!302299 m!441165))

(assert (=> b!302299 m!441169))

(assert (=> b!302299 m!441165))

(declare-fun m!441171 () Bool)

(assert (=> b!302299 m!441171))

(assert (=> b!302234 d!101056))

(declare-fun d!101058 () Bool)

(assert (=> d!101058 (= (array_inv!7566 a1!948) (bvsge (size!7954 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67308 d!101058))

(declare-fun d!101060 () Bool)

(assert (=> d!101060 (= (array_inv!7566 a2!948) (bvsge (size!7954 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67308 d!101060))

(push 1)

(assert (not b!302296))

(assert (not bm!5513))

(assert (not b!302297))

(assert (not b!302299))

(assert (not b!302289))

(assert (not bm!5512))

(assert (not b!302290))

(assert (not b!302292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

