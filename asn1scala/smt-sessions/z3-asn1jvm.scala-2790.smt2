; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67310 () Bool)

(assert start!67310)

(declare-fun b!302247 () Bool)

(declare-fun res!248728 () Bool)

(declare-fun e!217173 () Bool)

(assert (=> b!302247 (=> (not res!248728) (not e!217173))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun lt!437190 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302247 (= res!248728 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437190) (= fromSlice!52 toSlice!52)))))

(declare-fun res!248727 () Bool)

(declare-fun e!217172 () Bool)

(assert (=> start!67310 (=> (not res!248727) (not e!217172))))

(declare-datatypes ((array!18319 0))(
  ( (array!18320 (arr!9038 (Array (_ BitVec 32) (_ BitVec 8))) (size!7955 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18319)

(declare-fun a2!948 () array!18319)

(assert (=> start!67310 (= res!248727 (and (bvsle (size!7955 a1!948) (size!7955 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67310 e!217172))

(assert (=> start!67310 true))

(declare-fun array_inv!7567 (array!18319) Bool)

(assert (=> start!67310 (array_inv!7567 a1!948)))

(assert (=> start!67310 (array_inv!7567 a2!948)))

(declare-fun b!302248 () Bool)

(declare-fun arrayBitRangesEq!0 (array!18319 array!18319 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302248 (= e!217173 (not (arrayBitRangesEq!0 a1!948 a2!948 fromSlice!52 toSlice!52)))))

(declare-fun b!302246 () Bool)

(declare-fun res!248729 () Bool)

(assert (=> b!302246 (=> (not res!248729) (not e!217173))))

(assert (=> b!302246 (= res!248729 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302245 () Bool)

(assert (=> b!302245 (= e!217172 e!217173)))

(declare-fun res!248730 () Bool)

(assert (=> b!302245 (=> (not res!248730) (not e!217173))))

(assert (=> b!302245 (= res!248730 (and (bvsle toBit!258 lt!437190) (bvsle fromBit!258 lt!437190)))))

(assert (=> b!302245 (= lt!437190 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7955 a1!948))))))

(assert (= (and start!67310 res!248727) b!302245))

(assert (= (and b!302245 res!248730) b!302246))

(assert (= (and b!302246 res!248729) b!302247))

(assert (= (and b!302247 res!248728) b!302248))

(declare-fun m!441125 () Bool)

(assert (=> start!67310 m!441125))

(declare-fun m!441127 () Bool)

(assert (=> start!67310 m!441127))

(declare-fun m!441129 () Bool)

(assert (=> b!302248 m!441129))

(declare-fun m!441131 () Bool)

(assert (=> b!302246 m!441131))

(check-sat (not b!302246) (not start!67310) (not b!302248))
(check-sat)
(get-model)

(declare-fun lt!437214 () (_ BitVec 32))

(declare-fun b!302303 () Bool)

(declare-datatypes ((tuple4!1100 0))(
  ( (tuple4!1101 (_1!13205 (_ BitVec 32)) (_2!13205 (_ BitVec 32)) (_3!1507 (_ BitVec 32)) (_4!550 (_ BitVec 32))) )
))
(declare-fun lt!437213 () tuple4!1100)

(declare-fun e!217226 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302303 (= e!217226 (byteRangesEq!0 (select (arr!9038 a1!948) (_4!550 lt!437213)) (select (arr!9038 a2!948) (_4!550 lt!437213)) #b00000000000000000000000000000000 lt!437214))))

(declare-fun b!302304 () Bool)

(declare-fun e!217223 () Bool)

(declare-fun e!217225 () Bool)

(assert (=> b!302304 (= e!217223 e!217225)))

(declare-fun c!14347 () Bool)

(assert (=> b!302304 (= c!14347 (= (_3!1507 lt!437213) (_4!550 lt!437213)))))

(declare-fun b!302305 () Bool)

(declare-fun e!217227 () Bool)

(assert (=> b!302305 (= e!217227 e!217223)))

(declare-fun res!248776 () Bool)

(assert (=> b!302305 (=> (not res!248776) (not e!217223))))

(declare-fun e!217224 () Bool)

(assert (=> b!302305 (= res!248776 e!217224)))

(declare-fun res!248773 () Bool)

(assert (=> b!302305 (=> res!248773 e!217224)))

(assert (=> b!302305 (= res!248773 (bvsge (_1!13205 lt!437213) (_2!13205 lt!437213)))))

(assert (=> b!302305 (= lt!437214 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437212 () (_ BitVec 32))

(assert (=> b!302305 (= lt!437212 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1100)

(assert (=> b!302305 (= lt!437213 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302306 () Bool)

(declare-fun arrayRangesEq!1608 (array!18319 array!18319 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302306 (= e!217224 (arrayRangesEq!1608 a1!948 a2!948 (_1!13205 lt!437213) (_2!13205 lt!437213)))))

(declare-fun b!302307 () Bool)

(declare-fun res!248777 () Bool)

(assert (=> b!302307 (= res!248777 (= lt!437214 #b00000000000000000000000000000000))))

(assert (=> b!302307 (=> res!248777 e!217226)))

(declare-fun e!217228 () Bool)

(assert (=> b!302307 (= e!217228 e!217226)))

(declare-fun d!101048 () Bool)

(declare-fun res!248775 () Bool)

(assert (=> d!101048 (=> res!248775 e!217227)))

(assert (=> d!101048 (= res!248775 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101048 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!217227)))

(declare-fun bm!5514 () Bool)

(declare-fun call!5517 () Bool)

(assert (=> bm!5514 (= call!5517 (byteRangesEq!0 (select (arr!9038 a1!948) (_3!1507 lt!437213)) (select (arr!9038 a2!948) (_3!1507 lt!437213)) lt!437212 (ite c!14347 lt!437214 #b00000000000000000000000000001000)))))

(declare-fun b!302308 () Bool)

(assert (=> b!302308 (= e!217225 call!5517)))

(declare-fun b!302309 () Bool)

(assert (=> b!302309 (= e!217225 e!217228)))

(declare-fun res!248774 () Bool)

(assert (=> b!302309 (= res!248774 call!5517)))

(assert (=> b!302309 (=> (not res!248774) (not e!217228))))

(assert (= (and d!101048 (not res!248775)) b!302305))

(assert (= (and b!302305 (not res!248773)) b!302306))

(assert (= (and b!302305 res!248776) b!302304))

(assert (= (and b!302304 c!14347) b!302308))

(assert (= (and b!302304 (not c!14347)) b!302309))

(assert (= (and b!302309 res!248774) b!302307))

(assert (= (and b!302307 (not res!248777)) b!302303))

(assert (= (or b!302308 b!302309) bm!5514))

(declare-fun m!441173 () Bool)

(assert (=> b!302303 m!441173))

(declare-fun m!441175 () Bool)

(assert (=> b!302303 m!441175))

(assert (=> b!302303 m!441173))

(assert (=> b!302303 m!441175))

(declare-fun m!441177 () Bool)

(assert (=> b!302303 m!441177))

(declare-fun m!441179 () Bool)

(assert (=> b!302305 m!441179))

(declare-fun m!441181 () Bool)

(assert (=> b!302306 m!441181))

(declare-fun m!441183 () Bool)

(assert (=> bm!5514 m!441183))

(declare-fun m!441185 () Bool)

(assert (=> bm!5514 m!441185))

(assert (=> bm!5514 m!441183))

(assert (=> bm!5514 m!441185))

(declare-fun m!441187 () Bool)

(assert (=> bm!5514 m!441187))

(assert (=> b!302246 d!101048))

(declare-fun d!101062 () Bool)

(assert (=> d!101062 (= (array_inv!7567 a1!948) (bvsge (size!7955 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67310 d!101062))

(declare-fun d!101064 () Bool)

(assert (=> d!101064 (= (array_inv!7567 a2!948) (bvsge (size!7955 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67310 d!101064))

(declare-fun e!217232 () Bool)

(declare-fun b!302310 () Bool)

(declare-fun lt!437216 () tuple4!1100)

(declare-fun lt!437217 () (_ BitVec 32))

(assert (=> b!302310 (= e!217232 (byteRangesEq!0 (select (arr!9038 a1!948) (_4!550 lt!437216)) (select (arr!9038 a2!948) (_4!550 lt!437216)) #b00000000000000000000000000000000 lt!437217))))

(declare-fun b!302311 () Bool)

(declare-fun e!217229 () Bool)

(declare-fun e!217231 () Bool)

(assert (=> b!302311 (= e!217229 e!217231)))

(declare-fun c!14348 () Bool)

(assert (=> b!302311 (= c!14348 (= (_3!1507 lt!437216) (_4!550 lt!437216)))))

(declare-fun b!302312 () Bool)

(declare-fun e!217233 () Bool)

(assert (=> b!302312 (= e!217233 e!217229)))

(declare-fun res!248781 () Bool)

(assert (=> b!302312 (=> (not res!248781) (not e!217229))))

(declare-fun e!217230 () Bool)

(assert (=> b!302312 (= res!248781 e!217230)))

(declare-fun res!248778 () Bool)

(assert (=> b!302312 (=> res!248778 e!217230)))

(assert (=> b!302312 (= res!248778 (bvsge (_1!13205 lt!437216) (_2!13205 lt!437216)))))

(assert (=> b!302312 (= lt!437217 ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437215 () (_ BitVec 32))

(assert (=> b!302312 (= lt!437215 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302312 (= lt!437216 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun b!302313 () Bool)

(assert (=> b!302313 (= e!217230 (arrayRangesEq!1608 a1!948 a2!948 (_1!13205 lt!437216) (_2!13205 lt!437216)))))

(declare-fun b!302314 () Bool)

(declare-fun res!248782 () Bool)

(assert (=> b!302314 (= res!248782 (= lt!437217 #b00000000000000000000000000000000))))

(assert (=> b!302314 (=> res!248782 e!217232)))

(declare-fun e!217234 () Bool)

(assert (=> b!302314 (= e!217234 e!217232)))

(declare-fun d!101066 () Bool)

(declare-fun res!248780 () Bool)

(assert (=> d!101066 (=> res!248780 e!217233)))

(assert (=> d!101066 (= res!248780 (bvsge fromSlice!52 toSlice!52))))

(assert (=> d!101066 (= (arrayBitRangesEq!0 a1!948 a2!948 fromSlice!52 toSlice!52) e!217233)))

(declare-fun bm!5515 () Bool)

(declare-fun call!5518 () Bool)

(assert (=> bm!5515 (= call!5518 (byteRangesEq!0 (select (arr!9038 a1!948) (_3!1507 lt!437216)) (select (arr!9038 a2!948) (_3!1507 lt!437216)) lt!437215 (ite c!14348 lt!437217 #b00000000000000000000000000001000)))))

(declare-fun b!302315 () Bool)

(assert (=> b!302315 (= e!217231 call!5518)))

(declare-fun b!302316 () Bool)

(assert (=> b!302316 (= e!217231 e!217234)))

(declare-fun res!248779 () Bool)

(assert (=> b!302316 (= res!248779 call!5518)))

(assert (=> b!302316 (=> (not res!248779) (not e!217234))))

(assert (= (and d!101066 (not res!248780)) b!302312))

(assert (= (and b!302312 (not res!248778)) b!302313))

(assert (= (and b!302312 res!248781) b!302311))

(assert (= (and b!302311 c!14348) b!302315))

(assert (= (and b!302311 (not c!14348)) b!302316))

(assert (= (and b!302316 res!248779) b!302314))

(assert (= (and b!302314 (not res!248782)) b!302310))

(assert (= (or b!302315 b!302316) bm!5515))

(declare-fun m!441189 () Bool)

(assert (=> b!302310 m!441189))

(declare-fun m!441191 () Bool)

(assert (=> b!302310 m!441191))

(assert (=> b!302310 m!441189))

(assert (=> b!302310 m!441191))

(declare-fun m!441193 () Bool)

(assert (=> b!302310 m!441193))

(declare-fun m!441195 () Bool)

(assert (=> b!302312 m!441195))

(declare-fun m!441197 () Bool)

(assert (=> b!302313 m!441197))

(declare-fun m!441199 () Bool)

(assert (=> bm!5515 m!441199))

(declare-fun m!441201 () Bool)

(assert (=> bm!5515 m!441201))

(assert (=> bm!5515 m!441199))

(assert (=> bm!5515 m!441201))

(declare-fun m!441203 () Bool)

(assert (=> bm!5515 m!441203))

(assert (=> b!302248 d!101066))

(check-sat (not b!302310) (not b!302303) (not b!302312) (not bm!5515) (not b!302313) (not b!302306) (not bm!5514) (not b!302305))
(check-sat)
