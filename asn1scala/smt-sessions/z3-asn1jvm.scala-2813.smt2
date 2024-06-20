; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67838 () Bool)

(assert start!67838)

(declare-fun b!304484 () Bool)

(declare-fun e!219207 () Bool)

(declare-fun e!219206 () Bool)

(assert (=> b!304484 (= e!219207 e!219206)))

(declare-fun res!250459 () Bool)

(declare-fun lt!438385 () (_ BitVec 32))

(declare-datatypes ((tuple4!1190 0))(
  ( (tuple4!1191 (_1!13250 (_ BitVec 32)) (_2!13250 (_ BitVec 32)) (_3!1552 (_ BitVec 32)) (_4!595 (_ BitVec 32))) )
))
(declare-fun lt!438387 () tuple4!1190)

(declare-datatypes ((array!18499 0))(
  ( (array!18500 (arr!9107 (Array (_ BitVec 32) (_ BitVec 8))) (size!8024 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18499)

(declare-fun a2!948 () array!18499)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!304484 (= res!250459 (byteRangesEq!0 (select (arr!9107 a1!948) (_3!1552 lt!438387)) (select (arr!9107 a2!948) (_3!1552 lt!438387)) lt!438385 #b00000000000000000000000000000111))))

(assert (=> b!304484 (=> (not res!250459) (not e!219206))))

(declare-fun b!304485 () Bool)

(declare-fun e!219205 () Bool)

(declare-fun e!219211 () Bool)

(assert (=> b!304485 (= e!219205 e!219211)))

(declare-fun res!250457 () Bool)

(assert (=> b!304485 (=> (not res!250457) (not e!219211))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!438383 () (_ BitVec 64))

(assert (=> b!304485 (= res!250457 (and (bvsle toBit!258 lt!438383) (bvsle fromBit!258 lt!438383)))))

(assert (=> b!304485 (= lt!438383 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8024 a1!948))))))

(declare-fun lt!438384 () (_ BitVec 32))

(declare-fun call!5672 () Bool)

(declare-fun bm!5669 () Bool)

(declare-fun c!14597 () Bool)

(assert (=> bm!5669 (= call!5672 (byteRangesEq!0 (ite c!14597 (select (arr!9107 a1!948) (_3!1552 lt!438387)) (select (arr!9107 a1!948) (_4!595 lt!438387))) (ite c!14597 (select (arr!9107 a2!948) (_3!1552 lt!438387)) (select (arr!9107 a2!948) (_4!595 lt!438387))) (ite c!14597 lt!438385 #b00000000000000000000000000000000) lt!438384))))

(declare-fun b!304486 () Bool)

(declare-fun res!250456 () Bool)

(assert (=> b!304486 (=> (not res!250456) (not e!219211))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!304486 (= res!250456 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438383) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!304487 () Bool)

(declare-fun res!250461 () Bool)

(assert (=> b!304487 (= res!250461 (= lt!438384 #b00000000000000000000000000000000))))

(declare-fun e!219203 () Bool)

(assert (=> b!304487 (=> res!250461 e!219203)))

(assert (=> b!304487 (= e!219206 e!219203)))

(declare-fun b!304488 () Bool)

(declare-fun e!219208 () Bool)

(declare-fun arrayRangesEq!1653 (array!18499 array!18499 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!304488 (= e!219208 (not (arrayRangesEq!1653 a1!948 a2!948 (_1!13250 lt!438387) (_2!13250 lt!438387))))))

(declare-fun b!304489 () Bool)

(assert (=> b!304489 (= e!219207 call!5672)))

(declare-fun b!304490 () Bool)

(declare-datatypes ((Unit!21253 0))(
  ( (Unit!21254) )
))
(declare-fun e!219209 () Unit!21253)

(declare-fun lt!438382 () Unit!21253)

(assert (=> b!304490 (= e!219209 lt!438382)))

(declare-fun lt!438381 () tuple4!1190)

(declare-fun arrayRangesEqSlicedLemma!248 (array!18499 array!18499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21253)

(assert (=> b!304490 (= lt!438382 (arrayRangesEqSlicedLemma!248 a1!948 a2!948 (_1!13250 lt!438387) (_2!13250 lt!438387) (_1!13250 lt!438381) (_2!13250 lt!438381)))))

(assert (=> b!304490 (arrayRangesEq!1653 a1!948 a2!948 (_1!13250 lt!438381) (_2!13250 lt!438381))))

(declare-fun b!304492 () Bool)

(assert (=> b!304492 (= e!219203 call!5672)))

(declare-fun b!304493 () Bool)

(declare-fun Unit!21255 () Unit!21253)

(assert (=> b!304493 (= e!219209 Unit!21255)))

(declare-fun b!304494 () Bool)

(declare-fun res!250454 () Bool)

(assert (=> b!304494 (=> (not res!250454) (not e!219211))))

(declare-fun arrayBitRangesEq!0 (array!18499 array!18499 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!304494 (= res!250454 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!304495 () Bool)

(declare-fun res!250458 () Bool)

(assert (=> b!304495 (=> (not res!250458) (not e!219208))))

(assert (=> b!304495 (= res!250458 (and (bvslt (_3!1552 lt!438387) (_3!1552 lt!438381)) (bvslt (_3!1552 lt!438381) (_4!595 lt!438387)) (bvsle #b00000000000000000000000000000000 (_1!13250 lt!438387)) (bvsle (_1!13250 lt!438387) (_2!13250 lt!438387)) (bvsle (_2!13250 lt!438387) (size!8024 a1!948)) (bvsle (_1!13250 lt!438387) (_3!1552 lt!438381)) (bvslt (_3!1552 lt!438381) (_2!13250 lt!438387))))))

(declare-fun b!304491 () Bool)

(assert (=> b!304491 (= e!219211 e!219208)))

(declare-fun res!250455 () Bool)

(assert (=> b!304491 (=> (not res!250455) (not e!219208))))

(assert (=> b!304491 (= res!250455 e!219207)))

(assert (=> b!304491 (= c!14597 (= (_3!1552 lt!438387) (_4!595 lt!438387)))))

(declare-fun lt!438386 () Unit!21253)

(assert (=> b!304491 (= lt!438386 e!219209)))

(declare-fun c!14598 () Bool)

(assert (=> b!304491 (= c!14598 (bvslt (_1!13250 lt!438381) (_2!13250 lt!438381)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1190)

(assert (=> b!304491 (= lt!438381 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!304491 (= lt!438384 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304491 (= lt!438385 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304491 (= lt!438387 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun res!250460 () Bool)

(assert (=> start!67838 (=> (not res!250460) (not e!219205))))

(assert (=> start!67838 (= res!250460 (and (bvsle (size!8024 a1!948) (size!8024 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67838 e!219205))

(assert (=> start!67838 true))

(declare-fun array_inv!7636 (array!18499) Bool)

(assert (=> start!67838 (array_inv!7636 a1!948)))

(assert (=> start!67838 (array_inv!7636 a2!948)))

(assert (= (and start!67838 res!250460) b!304485))

(assert (= (and b!304485 res!250457) b!304494))

(assert (= (and b!304494 res!250454) b!304486))

(assert (= (and b!304486 res!250456) b!304491))

(assert (= (and b!304491 c!14598) b!304490))

(assert (= (and b!304491 (not c!14598)) b!304493))

(assert (= (and b!304491 c!14597) b!304489))

(assert (= (and b!304491 (not c!14597)) b!304484))

(assert (= (and b!304484 res!250459) b!304487))

(assert (= (and b!304487 (not res!250461)) b!304492))

(assert (= (or b!304489 b!304492) bm!5669))

(assert (= (and b!304491 res!250455) b!304495))

(assert (= (and b!304495 res!250458) b!304488))

(declare-fun m!442975 () Bool)

(assert (=> bm!5669 m!442975))

(declare-fun m!442977 () Bool)

(assert (=> bm!5669 m!442977))

(declare-fun m!442979 () Bool)

(assert (=> bm!5669 m!442979))

(declare-fun m!442981 () Bool)

(assert (=> bm!5669 m!442981))

(declare-fun m!442983 () Bool)

(assert (=> bm!5669 m!442983))

(declare-fun m!442985 () Bool)

(assert (=> start!67838 m!442985))

(declare-fun m!442987 () Bool)

(assert (=> start!67838 m!442987))

(declare-fun m!442989 () Bool)

(assert (=> b!304491 m!442989))

(declare-fun m!442991 () Bool)

(assert (=> b!304491 m!442991))

(declare-fun m!442993 () Bool)

(assert (=> b!304488 m!442993))

(declare-fun m!442995 () Bool)

(assert (=> b!304490 m!442995))

(declare-fun m!442997 () Bool)

(assert (=> b!304490 m!442997))

(assert (=> b!304484 m!442983))

(assert (=> b!304484 m!442975))

(assert (=> b!304484 m!442983))

(assert (=> b!304484 m!442975))

(declare-fun m!442999 () Bool)

(assert (=> b!304484 m!442999))

(declare-fun m!443001 () Bool)

(assert (=> b!304494 m!443001))

(check-sat (not bm!5669) (not b!304490) (not b!304488) (not start!67838) (not b!304494) (not b!304484) (not b!304491))
(check-sat)
(get-model)

(declare-fun d!101668 () Bool)

(assert (=> d!101668 (= (byteRangesEq!0 (ite c!14597 (select (arr!9107 a1!948) (_3!1552 lt!438387)) (select (arr!9107 a1!948) (_4!595 lt!438387))) (ite c!14597 (select (arr!9107 a2!948) (_3!1552 lt!438387)) (select (arr!9107 a2!948) (_4!595 lt!438387))) (ite c!14597 lt!438385 #b00000000000000000000000000000000) lt!438384) (or (= (ite c!14597 lt!438385 #b00000000000000000000000000000000) lt!438384) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14597 (select (arr!9107 a1!948) (_3!1552 lt!438387)) (select (arr!9107 a1!948) (_4!595 lt!438387)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438384))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14597 lt!438385 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14597 (select (arr!9107 a2!948) (_3!1552 lt!438387)) (select (arr!9107 a2!948) (_4!595 lt!438387)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438384))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14597 lt!438385 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26202 () Bool)

(assert (= bs!26202 d!101668))

(declare-fun m!443031 () Bool)

(assert (=> bs!26202 m!443031))

(declare-fun m!443033 () Bool)

(assert (=> bs!26202 m!443033))

(assert (=> bm!5669 d!101668))

(declare-fun d!101670 () Bool)

(assert (=> d!101670 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1191 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!304491 d!101670))

(declare-fun d!101672 () Bool)

(assert (=> d!101672 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1191 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!304491 d!101672))

(declare-fun d!101674 () Bool)

(assert (=> d!101674 (arrayRangesEq!1653 a1!948 a2!948 (_1!13250 lt!438381) (_2!13250 lt!438381))))

(declare-fun lt!438411 () Unit!21253)

(declare-fun choose!575 (array!18499 array!18499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21253)

(assert (=> d!101674 (= lt!438411 (choose!575 a1!948 a2!948 (_1!13250 lt!438387) (_2!13250 lt!438387) (_1!13250 lt!438381) (_2!13250 lt!438381)))))

(assert (=> d!101674 (and (bvsle #b00000000000000000000000000000000 (_1!13250 lt!438387)) (bvsle (_1!13250 lt!438387) (_2!13250 lt!438387)))))

(assert (=> d!101674 (= (arrayRangesEqSlicedLemma!248 a1!948 a2!948 (_1!13250 lt!438387) (_2!13250 lt!438387) (_1!13250 lt!438381) (_2!13250 lt!438381)) lt!438411)))

(declare-fun bs!26203 () Bool)

(assert (= bs!26203 d!101674))

(assert (=> bs!26203 m!442997))

(declare-fun m!443035 () Bool)

(assert (=> bs!26203 m!443035))

(assert (=> b!304490 d!101674))

(declare-fun d!101676 () Bool)

(declare-fun res!250490 () Bool)

(declare-fun e!219243 () Bool)

(assert (=> d!101676 (=> res!250490 e!219243)))

(assert (=> d!101676 (= res!250490 (= (_1!13250 lt!438381) (_2!13250 lt!438381)))))

(assert (=> d!101676 (= (arrayRangesEq!1653 a1!948 a2!948 (_1!13250 lt!438381) (_2!13250 lt!438381)) e!219243)))

(declare-fun b!304536 () Bool)

(declare-fun e!219244 () Bool)

(assert (=> b!304536 (= e!219243 e!219244)))

(declare-fun res!250491 () Bool)

(assert (=> b!304536 (=> (not res!250491) (not e!219244))))

(assert (=> b!304536 (= res!250491 (= (select (arr!9107 a1!948) (_1!13250 lt!438381)) (select (arr!9107 a2!948) (_1!13250 lt!438381))))))

(declare-fun b!304537 () Bool)

(assert (=> b!304537 (= e!219244 (arrayRangesEq!1653 a1!948 a2!948 (bvadd (_1!13250 lt!438381) #b00000000000000000000000000000001) (_2!13250 lt!438381)))))

(assert (= (and d!101676 (not res!250490)) b!304536))

(assert (= (and b!304536 res!250491) b!304537))

(declare-fun m!443037 () Bool)

(assert (=> b!304536 m!443037))

(declare-fun m!443039 () Bool)

(assert (=> b!304536 m!443039))

(declare-fun m!443041 () Bool)

(assert (=> b!304537 m!443041))

(assert (=> b!304490 d!101676))

(declare-fun d!101678 () Bool)

(declare-fun res!250492 () Bool)

(declare-fun e!219245 () Bool)

(assert (=> d!101678 (=> res!250492 e!219245)))

(assert (=> d!101678 (= res!250492 (= (_1!13250 lt!438387) (_2!13250 lt!438387)))))

(assert (=> d!101678 (= (arrayRangesEq!1653 a1!948 a2!948 (_1!13250 lt!438387) (_2!13250 lt!438387)) e!219245)))

(declare-fun b!304538 () Bool)

(declare-fun e!219246 () Bool)

(assert (=> b!304538 (= e!219245 e!219246)))

(declare-fun res!250493 () Bool)

(assert (=> b!304538 (=> (not res!250493) (not e!219246))))

(assert (=> b!304538 (= res!250493 (= (select (arr!9107 a1!948) (_1!13250 lt!438387)) (select (arr!9107 a2!948) (_1!13250 lt!438387))))))

(declare-fun b!304539 () Bool)

(assert (=> b!304539 (= e!219246 (arrayRangesEq!1653 a1!948 a2!948 (bvadd (_1!13250 lt!438387) #b00000000000000000000000000000001) (_2!13250 lt!438387)))))

(assert (= (and d!101678 (not res!250492)) b!304538))

(assert (= (and b!304538 res!250493) b!304539))

(declare-fun m!443043 () Bool)

(assert (=> b!304538 m!443043))

(declare-fun m!443045 () Bool)

(assert (=> b!304538 m!443045))

(declare-fun m!443047 () Bool)

(assert (=> b!304539 m!443047))

(assert (=> b!304488 d!101678))

(declare-fun lt!438420 () (_ BitVec 32))

(declare-fun lt!438419 () tuple4!1190)

(declare-fun bm!5675 () Bool)

(declare-fun call!5678 () Bool)

(declare-fun lt!438418 () (_ BitVec 32))

(declare-fun c!14607 () Bool)

(assert (=> bm!5675 (= call!5678 (byteRangesEq!0 (select (arr!9107 a1!948) (_3!1552 lt!438419)) (select (arr!9107 a2!948) (_3!1552 lt!438419)) lt!438420 (ite c!14607 lt!438418 #b00000000000000000000000000001000)))))

(declare-fun b!304554 () Bool)

(declare-fun e!219262 () Bool)

(declare-fun e!219264 () Bool)

(assert (=> b!304554 (= e!219262 e!219264)))

(declare-fun res!250504 () Bool)

(assert (=> b!304554 (= res!250504 call!5678)))

(assert (=> b!304554 (=> (not res!250504) (not e!219264))))

(declare-fun b!304555 () Bool)

(declare-fun e!219261 () Bool)

(assert (=> b!304555 (= e!219261 e!219262)))

(assert (=> b!304555 (= c!14607 (= (_3!1552 lt!438419) (_4!595 lt!438419)))))

(declare-fun b!304556 () Bool)

(declare-fun e!219263 () Bool)

(assert (=> b!304556 (= e!219263 e!219261)))

(declare-fun res!250508 () Bool)

(assert (=> b!304556 (=> (not res!250508) (not e!219261))))

(declare-fun e!219260 () Bool)

(assert (=> b!304556 (= res!250508 e!219260)))

(declare-fun res!250507 () Bool)

(assert (=> b!304556 (=> res!250507 e!219260)))

(assert (=> b!304556 (= res!250507 (bvsge (_1!13250 lt!438419) (_2!13250 lt!438419)))))

(assert (=> b!304556 (= lt!438418 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304556 (= lt!438420 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304556 (= lt!438419 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!304557 () Bool)

(assert (=> b!304557 (= e!219262 call!5678)))

(declare-fun d!101680 () Bool)

(declare-fun res!250506 () Bool)

(assert (=> d!101680 (=> res!250506 e!219263)))

(assert (=> d!101680 (= res!250506 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101680 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!219263)))

(declare-fun b!304558 () Bool)

(declare-fun res!250505 () Bool)

(assert (=> b!304558 (= res!250505 (= lt!438418 #b00000000000000000000000000000000))))

(declare-fun e!219259 () Bool)

(assert (=> b!304558 (=> res!250505 e!219259)))

(assert (=> b!304558 (= e!219264 e!219259)))

(declare-fun b!304559 () Bool)

(assert (=> b!304559 (= e!219260 (arrayRangesEq!1653 a1!948 a2!948 (_1!13250 lt!438419) (_2!13250 lt!438419)))))

(declare-fun b!304560 () Bool)

(assert (=> b!304560 (= e!219259 (byteRangesEq!0 (select (arr!9107 a1!948) (_4!595 lt!438419)) (select (arr!9107 a2!948) (_4!595 lt!438419)) #b00000000000000000000000000000000 lt!438418))))

(assert (= (and d!101680 (not res!250506)) b!304556))

(assert (= (and b!304556 (not res!250507)) b!304559))

(assert (= (and b!304556 res!250508) b!304555))

(assert (= (and b!304555 c!14607) b!304557))

(assert (= (and b!304555 (not c!14607)) b!304554))

(assert (= (and b!304554 res!250504) b!304558))

(assert (= (and b!304558 (not res!250505)) b!304560))

(assert (= (or b!304557 b!304554) bm!5675))

(declare-fun m!443049 () Bool)

(assert (=> bm!5675 m!443049))

(declare-fun m!443051 () Bool)

(assert (=> bm!5675 m!443051))

(assert (=> bm!5675 m!443049))

(assert (=> bm!5675 m!443051))

(declare-fun m!443053 () Bool)

(assert (=> bm!5675 m!443053))

(assert (=> b!304556 m!442991))

(declare-fun m!443055 () Bool)

(assert (=> b!304559 m!443055))

(declare-fun m!443057 () Bool)

(assert (=> b!304560 m!443057))

(declare-fun m!443059 () Bool)

(assert (=> b!304560 m!443059))

(assert (=> b!304560 m!443057))

(assert (=> b!304560 m!443059))

(declare-fun m!443061 () Bool)

(assert (=> b!304560 m!443061))

(assert (=> b!304494 d!101680))

(declare-fun d!101682 () Bool)

(assert (=> d!101682 (= (byteRangesEq!0 (select (arr!9107 a1!948) (_3!1552 lt!438387)) (select (arr!9107 a2!948) (_3!1552 lt!438387)) lt!438385 #b00000000000000000000000000000111) (or (= lt!438385 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9107 a1!948) (_3!1552 lt!438387))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438385)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9107 a2!948) (_3!1552 lt!438387))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438385)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26204 () Bool)

(assert (= bs!26204 d!101682))

(declare-fun m!443063 () Bool)

(assert (=> bs!26204 m!443063))

(declare-fun m!443065 () Bool)

(assert (=> bs!26204 m!443065))

(assert (=> b!304484 d!101682))

(declare-fun d!101684 () Bool)

(assert (=> d!101684 (= (array_inv!7636 a1!948) (bvsge (size!8024 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67838 d!101684))

(declare-fun d!101686 () Bool)

(assert (=> d!101686 (= (array_inv!7636 a2!948) (bvsge (size!8024 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67838 d!101686))

(check-sat (not d!101674) (not b!304559) (not bm!5675) (not b!304556) (not b!304539) (not b!304560) (not b!304537))
(check-sat)
