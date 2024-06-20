; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67106 () Bool)

(assert start!67106)

(declare-fun b!301410 () Bool)

(declare-fun e!216462 () Bool)

(declare-fun e!216456 () Bool)

(assert (=> b!301410 (= e!216462 e!216456)))

(declare-fun c!14196 () Bool)

(declare-datatypes ((tuple4!1078 0))(
  ( (tuple4!1079 (_1!13194 (_ BitVec 32)) (_2!13194 (_ BitVec 32)) (_3!1496 (_ BitVec 32)) (_4!539 (_ BitVec 32))) )
))
(declare-fun lt!436685 () tuple4!1078)

(assert (=> b!301410 (= c!14196 (= (_3!1496 lt!436685) (_4!539 lt!436685)))))

(declare-datatypes ((Unit!21112 0))(
  ( (Unit!21113) )
))
(declare-fun lt!436683 () Unit!21112)

(declare-fun e!216455 () Unit!21112)

(assert (=> b!301410 (= lt!436683 e!216455)))

(declare-fun c!14195 () Bool)

(declare-fun lt!436688 () tuple4!1078)

(assert (=> b!301410 (= c!14195 (bvslt (_1!13194 lt!436688) (_2!13194 lt!436688)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1078)

(assert (=> b!301410 (= lt!436688 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!436684 () (_ BitVec 32))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!301410 (= lt!436684 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!436686 () (_ BitVec 32))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> b!301410 (= lt!436686 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301410 (= lt!436685 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!301411 () Bool)

(declare-fun lt!436687 () Unit!21112)

(assert (=> b!301411 (= e!216455 lt!436687)))

(declare-datatypes ((array!18267 0))(
  ( (array!18268 (arr!9018 (Array (_ BitVec 32) (_ BitVec 8))) (size!7935 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18267)

(declare-fun a2!948 () array!18267)

(declare-fun arrayRangesEqSlicedLemma!207 (array!18267 array!18267 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21112)

(assert (=> b!301411 (= lt!436687 (arrayRangesEqSlicedLemma!207 a1!948 a2!948 (_1!13194 lt!436685) (_2!13194 lt!436685) (_1!13194 lt!436688) (_2!13194 lt!436688)))))

(declare-fun arrayRangesEq!1597 (array!18267 array!18267 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301411 (arrayRangesEq!1597 a1!948 a2!948 (_1!13194 lt!436688) (_2!13194 lt!436688))))

(declare-fun b!301412 () Bool)

(declare-fun Unit!21114 () Unit!21112)

(assert (=> b!301412 (= e!216455 Unit!21114)))

(declare-fun b!301413 () Bool)

(declare-fun res!248185 () Bool)

(assert (=> b!301413 (=> (not res!248185) (not e!216462))))

(declare-fun arrayBitRangesEq!0 (array!18267 array!18267 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!301413 (= res!248185 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!301414 () Bool)

(declare-fun e!216459 () Bool)

(assert (=> b!301414 (= e!216456 e!216459)))

(declare-fun res!248187 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301414 (= res!248187 (not (byteRangesEq!0 (select (arr!9018 a1!948) (_3!1496 lt!436685)) (select (arr!9018 a2!948) (_3!1496 lt!436685)) lt!436686 #b00000000000000000000000000000111)))))

(assert (=> b!301414 (=> res!248187 e!216459)))

(declare-fun res!248188 () Bool)

(declare-fun e!216461 () Bool)

(assert (=> start!67106 (=> (not res!248188) (not e!216461))))

(assert (=> start!67106 (= res!248188 (and (bvsle (size!7935 a1!948) (size!7935 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67106 e!216461))

(assert (=> start!67106 true))

(declare-fun array_inv!7547 (array!18267) Bool)

(assert (=> start!67106 (array_inv!7547 a1!948)))

(assert (=> start!67106 (array_inv!7547 a2!948)))

(declare-fun b!301415 () Bool)

(declare-fun e!216457 () Bool)

(declare-fun call!5447 () Bool)

(assert (=> b!301415 (= e!216457 (not call!5447))))

(declare-fun bm!5444 () Bool)

(assert (=> bm!5444 (= call!5447 (byteRangesEq!0 (ite c!14196 (select (arr!9018 a1!948) (_3!1496 lt!436685)) (select (arr!9018 a1!948) (_4!539 lt!436685))) (ite c!14196 (select (arr!9018 a2!948) (_3!1496 lt!436685)) (select (arr!9018 a2!948) (_4!539 lt!436685))) (ite c!14196 lt!436686 #b00000000000000000000000000000000) lt!436684))))

(declare-fun b!301416 () Bool)

(declare-fun res!248189 () Bool)

(assert (=> b!301416 (=> (not res!248189) (not e!216462))))

(declare-fun lt!436689 () (_ BitVec 64))

(assert (=> b!301416 (= res!248189 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436689) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!301417 () Bool)

(assert (=> b!301417 (= e!216461 e!216462)))

(declare-fun res!248184 () Bool)

(assert (=> b!301417 (=> (not res!248184) (not e!216462))))

(assert (=> b!301417 (= res!248184 (and (bvsle toBit!258 lt!436689) (bvsle fromBit!258 lt!436689)))))

(assert (=> b!301417 (= lt!436689 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7935 a1!948))))))

(declare-fun b!301418 () Bool)

(assert (=> b!301418 (= e!216456 (not call!5447))))

(declare-fun b!301419 () Bool)

(declare-fun res!248186 () Bool)

(assert (=> b!301419 (= res!248186 (not (= lt!436684 #b00000000000000000000000000000000)))))

(assert (=> b!301419 (=> (not res!248186) (not e!216457))))

(assert (=> b!301419 (= e!216459 e!216457)))

(assert (= (and start!67106 res!248188) b!301417))

(assert (= (and b!301417 res!248184) b!301413))

(assert (= (and b!301413 res!248185) b!301416))

(assert (= (and b!301416 res!248189) b!301410))

(assert (= (and b!301410 c!14195) b!301411))

(assert (= (and b!301410 (not c!14195)) b!301412))

(assert (= (and b!301410 c!14196) b!301418))

(assert (= (and b!301410 (not c!14196)) b!301414))

(assert (= (and b!301414 (not res!248187)) b!301419))

(assert (= (and b!301419 res!248186) b!301415))

(assert (= (or b!301418 b!301415) bm!5444))

(declare-fun m!440231 () Bool)

(assert (=> b!301411 m!440231))

(declare-fun m!440233 () Bool)

(assert (=> b!301411 m!440233))

(declare-fun m!440235 () Bool)

(assert (=> start!67106 m!440235))

(declare-fun m!440237 () Bool)

(assert (=> start!67106 m!440237))

(declare-fun m!440239 () Bool)

(assert (=> b!301410 m!440239))

(declare-fun m!440241 () Bool)

(assert (=> b!301410 m!440241))

(declare-fun m!440243 () Bool)

(assert (=> b!301414 m!440243))

(declare-fun m!440245 () Bool)

(assert (=> b!301414 m!440245))

(assert (=> b!301414 m!440243))

(assert (=> b!301414 m!440245))

(declare-fun m!440247 () Bool)

(assert (=> b!301414 m!440247))

(declare-fun m!440249 () Bool)

(assert (=> b!301413 m!440249))

(assert (=> bm!5444 m!440245))

(declare-fun m!440251 () Bool)

(assert (=> bm!5444 m!440251))

(declare-fun m!440253 () Bool)

(assert (=> bm!5444 m!440253))

(assert (=> bm!5444 m!440243))

(declare-fun m!440255 () Bool)

(assert (=> bm!5444 m!440255))

(push 1)

(assert (not b!301413))

(assert (not b!301411))

(assert (not bm!5444))

(assert (not start!67106))

(assert (not b!301410))

(assert (not b!301414))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!436722 () tuple4!1078)

(declare-fun lt!436721 () (_ BitVec 32))

(declare-fun lt!436720 () (_ BitVec 32))

(declare-fun bm!5453 () Bool)

(declare-fun c!14205 () Bool)

(declare-fun call!5456 () Bool)

(assert (=> bm!5453 (= call!5456 (byteRangesEq!0 (ite c!14205 (select (arr!9018 a1!948) (_3!1496 lt!436722)) (select (arr!9018 a1!948) (_4!539 lt!436722))) (ite c!14205 (select (arr!9018 a2!948) (_3!1496 lt!436722)) (select (arr!9018 a2!948) (_4!539 lt!436722))) (ite c!14205 lt!436720 #b00000000000000000000000000000000) lt!436721))))

(declare-fun b!301486 () Bool)

(declare-fun e!216522 () Bool)

(declare-fun e!216526 () Bool)

(assert (=> b!301486 (= e!216522 e!216526)))

(declare-fun res!248241 () Bool)

(assert (=> b!301486 (= res!248241 (byteRangesEq!0 (select (arr!9018 a1!948) (_3!1496 lt!436722)) (select (arr!9018 a2!948) (_3!1496 lt!436722)) lt!436720 #b00000000000000000000000000001000))))

(assert (=> b!301486 (=> (not res!248241) (not e!216526))))

(declare-fun b!301488 () Bool)

(assert (=> b!301488 (= e!216522 call!5456)))

(declare-fun e!216525 () Bool)

(declare-fun b!301489 () Bool)

(assert (=> b!301489 (= e!216525 (arrayRangesEq!1597 a1!948 a2!948 (_1!13194 lt!436722) (_2!13194 lt!436722)))))

(declare-fun b!301490 () Bool)

(declare-fun e!216521 () Bool)

(assert (=> b!301490 (= e!216521 e!216522)))

(assert (=> b!301490 (= c!14205 (= (_3!1496 lt!436722) (_4!539 lt!436722)))))

(declare-fun d!100768 () Bool)

(declare-fun res!248243 () Bool)

(declare-fun e!216523 () Bool)

(assert (=> d!100768 (=> res!248243 e!216523)))

(assert (=> d!100768 (= res!248243 (bvsge fromBit!258 toBit!258))))

(assert (=> d!100768 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!216523)))

(declare-fun b!301487 () Bool)

(declare-fun res!248240 () Bool)

(assert (=> b!301487 (= res!248240 (= lt!436721 #b00000000000000000000000000000000))))

(declare-fun e!216524 () Bool)

(assert (=> b!301487 (=> res!248240 e!216524)))

(assert (=> b!301487 (= e!216526 e!216524)))

(declare-fun b!301491 () Bool)

(assert (=> b!301491 (= e!216523 e!216521)))

(declare-fun res!248244 () Bool)

(assert (=> b!301491 (=> (not res!248244) (not e!216521))))

(assert (=> b!301491 (= res!248244 e!216525)))

(declare-fun res!248242 () Bool)

(assert (=> b!301491 (=> res!248242 e!216525)))

(assert (=> b!301491 (= res!248242 (bvsge (_1!13194 lt!436722) (_2!13194 lt!436722)))))

(assert (=> b!301491 (= lt!436721 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301491 (= lt!436720 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301491 (= lt!436722 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!301492 () Bool)

(assert (=> b!301492 (= e!216524 call!5456)))

(assert (= (and d!100768 (not res!248243)) b!301491))

(assert (= (and b!301491 (not res!248242)) b!301489))

(assert (= (and b!301491 res!248244) b!301490))

(assert (= (and b!301490 c!14205) b!301488))

(assert (= (and b!301490 (not c!14205)) b!301486))

(assert (= (and b!301486 res!248241) b!301487))

(assert (= (and b!301487 (not res!248240)) b!301492))

(assert (= (or b!301488 b!301492) bm!5453))

(declare-fun m!440307 () Bool)

(assert (=> bm!5453 m!440307))

(declare-fun m!440309 () Bool)

(assert (=> bm!5453 m!440309))

(declare-fun m!440311 () Bool)

(assert (=> bm!5453 m!440311))

(declare-fun m!440317 () Bool)

(assert (=> bm!5453 m!440317))

(declare-fun m!440319 () Bool)

(assert (=> bm!5453 m!440319))

(assert (=> b!301486 m!440311))

(assert (=> b!301486 m!440307))

(assert (=> b!301486 m!440311))

(assert (=> b!301486 m!440307))

(declare-fun m!440323 () Bool)

(assert (=> b!301486 m!440323))

(declare-fun m!440325 () Bool)

(assert (=> b!301489 m!440325))

(assert (=> b!301491 m!440241))

(assert (=> b!301413 d!100768))

(declare-fun d!100780 () Bool)

(assert (=> d!100780 (= (byteRangesEq!0 (select (arr!9018 a1!948) (_3!1496 lt!436685)) (select (arr!9018 a2!948) (_3!1496 lt!436685)) lt!436686 #b00000000000000000000000000000111) (or (= lt!436686 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9018 a1!948) (_3!1496 lt!436685))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!436686)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9018 a2!948) (_3!1496 lt!436685))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!436686)))) #b00000000000000000000000011111111))))))

(declare-fun bs!25992 () Bool)

(assert (= bs!25992 d!100780))

(declare-fun m!440331 () Bool)

(assert (=> bs!25992 m!440331))

(declare-fun m!440333 () Bool)

(assert (=> bs!25992 m!440333))

(assert (=> b!301414 d!100780))

(declare-fun d!100786 () Bool)

(assert (=> d!100786 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1079 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!301410 d!100786))

(declare-fun d!100788 () Bool)

(assert (=> d!100788 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1079 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!301410 d!100788))

(declare-fun d!100790 () Bool)

(assert (=> d!100790 (= (byteRangesEq!0 (ite c!14196 (select (arr!9018 a1!948) (_3!1496 lt!436685)) (select (arr!9018 a1!948) (_4!539 lt!436685))) (ite c!14196 (select (arr!9018 a2!948) (_3!1496 lt!436685)) (select (arr!9018 a2!948) (_4!539 lt!436685))) (ite c!14196 lt!436686 #b00000000000000000000000000000000) lt!436684) (or (= (ite c!14196 lt!436686 #b00000000000000000000000000000000) lt!436684) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14196 (select (arr!9018 a1!948) (_3!1496 lt!436685)) (select (arr!9018 a1!948) (_4!539 lt!436685)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!436684))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14196 lt!436686 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14196 (select (arr!9018 a2!948) (_3!1496 lt!436685)) (select (arr!9018 a2!948) (_4!539 lt!436685)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!436684))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14196 lt!436686 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!25993 () Bool)

(assert (= bs!25993 d!100790))

(declare-fun m!440335 () Bool)

(assert (=> bs!25993 m!440335))

(declare-fun m!440337 () Bool)

(assert (=> bs!25993 m!440337))

(assert (=> bm!5444 d!100790))

(declare-fun d!100792 () Bool)

(assert (=> d!100792 (arrayRangesEq!1597 a1!948 a2!948 (_1!13194 lt!436688) (_2!13194 lt!436688))))

(declare-fun lt!436725 () Unit!21112)

(declare-fun choose!529 (array!18267 array!18267 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21112)

(assert (=> d!100792 (= lt!436725 (choose!529 a1!948 a2!948 (_1!13194 lt!436685) (_2!13194 lt!436685) (_1!13194 lt!436688) (_2!13194 lt!436688)))))

(assert (=> d!100792 (and (bvsle #b00000000000000000000000000000000 (_1!13194 lt!436685)) (bvsle (_1!13194 lt!436685) (_2!13194 lt!436685)))))

(assert (=> d!100792 (= (arrayRangesEqSlicedLemma!207 a1!948 a2!948 (_1!13194 lt!436685) (_2!13194 lt!436685) (_1!13194 lt!436688) (_2!13194 lt!436688)) lt!436725)))

(declare-fun bs!25994 () Bool)

(assert (= bs!25994 d!100792))

(assert (=> bs!25994 m!440233))

(declare-fun m!440339 () Bool)

(assert (=> bs!25994 m!440339))

(assert (=> b!301411 d!100792))

(declare-fun d!100794 () Bool)

(declare-fun res!248251 () Bool)

(declare-fun e!216533 () Bool)

(assert (=> d!100794 (=> res!248251 e!216533)))

(assert (=> d!100794 (= res!248251 (= (_1!13194 lt!436688) (_2!13194 lt!436688)))))

(assert (=> d!100794 (= (arrayRangesEq!1597 a1!948 a2!948 (_1!13194 lt!436688) (_2!13194 lt!436688)) e!216533)))

(declare-fun b!301499 () Bool)

(declare-fun e!216534 () Bool)

(assert (=> b!301499 (= e!216533 e!216534)))

(declare-fun res!248252 () Bool)

(assert (=> b!301499 (=> (not res!248252) (not e!216534))))

(assert (=> b!301499 (= res!248252 (= (select (arr!9018 a1!948) (_1!13194 lt!436688)) (select (arr!9018 a2!948) (_1!13194 lt!436688))))))

(declare-fun b!301500 () Bool)

(assert (=> b!301500 (= e!216534 (arrayRangesEq!1597 a1!948 a2!948 (bvadd (_1!13194 lt!436688) #b00000000000000000000000000000001) (_2!13194 lt!436688)))))

(assert (= (and d!100794 (not res!248251)) b!301499))

(assert (= (and b!301499 res!248252) b!301500))

(declare-fun m!440341 () Bool)

(assert (=> b!301499 m!440341))

(declare-fun m!440343 () Bool)

(assert (=> b!301499 m!440343))

(declare-fun m!440345 () Bool)

(assert (=> b!301500 m!440345))

(assert (=> b!301411 d!100794))

(declare-fun d!100796 () Bool)

(assert (=> d!100796 (= (array_inv!7547 a1!948) (bvsge (size!7935 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67106 d!100796))

(declare-fun d!100798 () Bool)

(assert (=> d!100798 (= (array_inv!7547 a2!948) (bvsge (size!7935 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67106 d!100798))

(push 1)

(assert (not b!301489))

(assert (not b!301491))

(assert (not d!100792))

(assert (not b!301486))

(assert (not bm!5453))

(assert (not b!301500))

(check-sat)

(pop 1)

(push 1)

(check-sat)

