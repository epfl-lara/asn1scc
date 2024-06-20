; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66910 () Bool)

(assert start!66910)

(declare-fun b!299128 () Bool)

(declare-fun res!246884 () Bool)

(declare-fun e!214713 () Bool)

(assert (=> b!299128 (=> (not res!246884) (not e!214713))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!435020 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299128 (= res!246884 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435020) (not (= fromSlice!52 toSlice!52))))))

(declare-datatypes ((tuple4!954 0))(
  ( (tuple4!955 (_1!13132 (_ BitVec 32)) (_2!13132 (_ BitVec 32)) (_3!1434 (_ BitVec 32)) (_4!477 (_ BitVec 32))) )
))
(declare-fun lt!435018 () tuple4!954)

(declare-fun lt!435019 () (_ BitVec 32))

(declare-fun b!299129 () Bool)

(declare-fun lt!435023 () (_ BitVec 32))

(assert (=> b!299129 (= e!214713 (and (= (_3!1434 lt!435018) (_4!477 lt!435018)) (or (bvsgt #b00000000000000000000000000000000 lt!435019) (bvsgt lt!435019 lt!435023) (bvsgt lt!435023 #b00000000000000000000000000001000))))))

(declare-datatypes ((Unit!20869 0))(
  ( (Unit!20870) )
))
(declare-fun lt!435021 () Unit!20869)

(declare-fun e!214710 () Unit!20869)

(assert (=> b!299129 (= lt!435021 e!214710)))

(declare-fun c!13704 () Bool)

(declare-fun lt!435022 () tuple4!954)

(assert (=> b!299129 (= c!13704 (bvslt (_1!13132 lt!435022) (_2!13132 lt!435022)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!954)

(assert (=> b!299129 (= lt!435022 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!299129 (= lt!435023 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299129 (= lt!435019 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299129 (= lt!435018 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun res!246886 () Bool)

(declare-fun e!214712 () Bool)

(assert (=> start!66910 (=> (not res!246886) (not e!214712))))

(declare-datatypes ((array!18137 0))(
  ( (array!18138 (arr!8956 (Array (_ BitVec 32) (_ BitVec 8))) (size!7873 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18137)

(declare-fun a2!948 () array!18137)

(assert (=> start!66910 (= res!246886 (and (bvsle (size!7873 a1!948) (size!7873 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66910 e!214712))

(assert (=> start!66910 true))

(declare-fun array_inv!7485 (array!18137) Bool)

(assert (=> start!66910 (array_inv!7485 a1!948)))

(assert (=> start!66910 (array_inv!7485 a2!948)))

(declare-fun b!299130 () Bool)

(declare-fun Unit!20871 () Unit!20869)

(assert (=> b!299130 (= e!214710 Unit!20871)))

(declare-fun b!299131 () Bool)

(declare-fun lt!435024 () Unit!20869)

(assert (=> b!299131 (= e!214710 lt!435024)))

(declare-fun arrayRangesEqSlicedLemma!145 (array!18137 array!18137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20869)

(assert (=> b!299131 (= lt!435024 (arrayRangesEqSlicedLemma!145 a1!948 a2!948 (_1!13132 lt!435018) (_2!13132 lt!435018) (_1!13132 lt!435022) (_2!13132 lt!435022)))))

(declare-fun arrayRangesEq!1535 (array!18137 array!18137 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299131 (arrayRangesEq!1535 a1!948 a2!948 (_1!13132 lt!435022) (_2!13132 lt!435022))))

(declare-fun b!299132 () Bool)

(declare-fun res!246887 () Bool)

(assert (=> b!299132 (=> (not res!246887) (not e!214713))))

(declare-fun arrayBitRangesEq!0 (array!18137 array!18137 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299132 (= res!246887 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299133 () Bool)

(assert (=> b!299133 (= e!214712 e!214713)))

(declare-fun res!246885 () Bool)

(assert (=> b!299133 (=> (not res!246885) (not e!214713))))

(assert (=> b!299133 (= res!246885 (and (bvsle toBit!258 lt!435020) (bvsle fromBit!258 lt!435020)))))

(assert (=> b!299133 (= lt!435020 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7873 a1!948))))))

(assert (= (and start!66910 res!246886) b!299133))

(assert (= (and b!299133 res!246885) b!299132))

(assert (= (and b!299132 res!246887) b!299128))

(assert (= (and b!299128 res!246884) b!299129))

(assert (= (and b!299129 c!13704) b!299131))

(assert (= (and b!299129 (not c!13704)) b!299130))

(declare-fun m!438355 () Bool)

(assert (=> b!299129 m!438355))

(declare-fun m!438357 () Bool)

(assert (=> b!299129 m!438357))

(declare-fun m!438359 () Bool)

(assert (=> start!66910 m!438359))

(declare-fun m!438361 () Bool)

(assert (=> start!66910 m!438361))

(declare-fun m!438363 () Bool)

(assert (=> b!299131 m!438363))

(declare-fun m!438365 () Bool)

(assert (=> b!299131 m!438365))

(declare-fun m!438367 () Bool)

(assert (=> b!299132 m!438367))

(push 1)

(assert (not b!299132))

(assert (not b!299131))

(assert (not b!299129))

(assert (not start!66910))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!299211 () Bool)

(declare-fun e!214781 () Bool)

(declare-fun e!214784 () Bool)

(assert (=> b!299211 (= e!214781 e!214784)))

(declare-fun res!246943 () Bool)

(assert (=> b!299211 (=> (not res!246943) (not e!214784))))

(declare-fun e!214785 () Bool)

(assert (=> b!299211 (= res!246943 e!214785)))

(declare-fun res!246945 () Bool)

(assert (=> b!299211 (=> res!246945 e!214785)))

(declare-fun lt!435087 () tuple4!954)

(assert (=> b!299211 (= res!246945 (bvsge (_1!13132 lt!435087) (_2!13132 lt!435087)))))

(declare-fun lt!435085 () (_ BitVec 32))

(assert (=> b!299211 (= lt!435085 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!435086 () (_ BitVec 32))

(assert (=> b!299211 (= lt!435086 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299211 (= lt!435087 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun call!5318 () Bool)

(declare-fun bm!5315 () Bool)

(declare-fun c!13716 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5315 (= call!5318 (byteRangesEq!0 (select (arr!8956 a1!948) (_3!1434 lt!435087)) (select (arr!8956 a2!948) (_3!1434 lt!435087)) lt!435086 (ite c!13716 lt!435085 #b00000000000000000000000000001000)))))

(declare-fun b!299213 () Bool)

(declare-fun e!214780 () Bool)

(declare-fun e!214783 () Bool)

(assert (=> b!299213 (= e!214780 e!214783)))

(declare-fun res!246946 () Bool)

(assert (=> b!299213 (= res!246946 call!5318)))

(assert (=> b!299213 (=> (not res!246946) (not e!214783))))

(declare-fun b!299214 () Bool)

(assert (=> b!299214 (= e!214784 e!214780)))

(assert (=> b!299214 (= c!13716 (= (_3!1434 lt!435087) (_4!477 lt!435087)))))

(declare-fun b!299215 () Bool)

(declare-fun res!246944 () Bool)

(assert (=> b!299215 (= res!246944 (= lt!435085 #b00000000000000000000000000000000))))

(declare-fun e!214782 () Bool)

(assert (=> b!299215 (=> res!246944 e!214782)))

(assert (=> b!299215 (= e!214783 e!214782)))

(declare-fun d!100612 () Bool)

(declare-fun res!246947 () Bool)

(assert (=> d!100612 (=> res!246947 e!214781)))

(assert (=> d!100612 (= res!246947 (bvsge fromBit!258 toBit!258))))

(assert (=> d!100612 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!214781)))

(declare-fun b!299212 () Bool)

(assert (=> b!299212 (= e!214785 (arrayRangesEq!1535 a1!948 a2!948 (_1!13132 lt!435087) (_2!13132 lt!435087)))))

(declare-fun b!299216 () Bool)

(assert (=> b!299216 (= e!214780 call!5318)))

(declare-fun b!299217 () Bool)

(assert (=> b!299217 (= e!214782 (byteRangesEq!0 (select (arr!8956 a1!948) (_4!477 lt!435087)) (select (arr!8956 a2!948) (_4!477 lt!435087)) #b00000000000000000000000000000000 lt!435085))))

(assert (= (and d!100612 (not res!246947)) b!299211))

(assert (= (and b!299211 (not res!246945)) b!299212))

(assert (= (and b!299211 res!246943) b!299214))

(assert (= (and b!299214 c!13716) b!299216))

(assert (= (and b!299214 (not c!13716)) b!299213))

(assert (= (and b!299213 res!246946) b!299215))

(assert (= (and b!299215 (not res!246944)) b!299217))

(assert (= (or b!299216 b!299213) bm!5315))

(assert (=> b!299211 m!438357))

(declare-fun m!438419 () Bool)

(assert (=> bm!5315 m!438419))

(declare-fun m!438421 () Bool)

(assert (=> bm!5315 m!438421))

(assert (=> bm!5315 m!438419))

(assert (=> bm!5315 m!438421))

(declare-fun m!438423 () Bool)

(assert (=> bm!5315 m!438423))

(declare-fun m!438425 () Bool)

(assert (=> b!299212 m!438425))

(declare-fun m!438427 () Bool)

(assert (=> b!299217 m!438427))

(declare-fun m!438429 () Bool)

(assert (=> b!299217 m!438429))

(assert (=> b!299217 m!438427))

(assert (=> b!299217 m!438429))

(declare-fun m!438431 () Bool)

(assert (=> b!299217 m!438431))

(assert (=> b!299132 d!100612))

(declare-fun d!100614 () Bool)

(assert (=> d!100614 (arrayRangesEq!1535 a1!948 a2!948 (_1!13132 lt!435022) (_2!13132 lt!435022))))

(declare-fun lt!435090 () Unit!20869)

(declare-fun choose!519 (array!18137 array!18137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20869)

(assert (=> d!100614 (= lt!435090 (choose!519 a1!948 a2!948 (_1!13132 lt!435018) (_2!13132 lt!435018) (_1!13132 lt!435022) (_2!13132 lt!435022)))))

(assert (=> d!100614 (and (bvsle #b00000000000000000000000000000000 (_1!13132 lt!435018)) (bvsle (_1!13132 lt!435018) (_2!13132 lt!435018)))))

(assert (=> d!100614 (= (arrayRangesEqSlicedLemma!145 a1!948 a2!948 (_1!13132 lt!435018) (_2!13132 lt!435018) (_1!13132 lt!435022) (_2!13132 lt!435022)) lt!435090)))

(declare-fun bs!25909 () Bool)

(assert (= bs!25909 d!100614))

(assert (=> bs!25909 m!438365))

(declare-fun m!438433 () Bool)

(assert (=> bs!25909 m!438433))

(assert (=> b!299131 d!100614))

(declare-fun d!100616 () Bool)

(declare-fun res!246952 () Bool)

(declare-fun e!214790 () Bool)

(assert (=> d!100616 (=> res!246952 e!214790)))

(assert (=> d!100616 (= res!246952 (= (_1!13132 lt!435022) (_2!13132 lt!435022)))))

(assert (=> d!100616 (= (arrayRangesEq!1535 a1!948 a2!948 (_1!13132 lt!435022) (_2!13132 lt!435022)) e!214790)))

(declare-fun b!299222 () Bool)

(declare-fun e!214791 () Bool)

(assert (=> b!299222 (= e!214790 e!214791)))

(declare-fun res!246953 () Bool)

(assert (=> b!299222 (=> (not res!246953) (not e!214791))))

(assert (=> b!299222 (= res!246953 (= (select (arr!8956 a1!948) (_1!13132 lt!435022)) (select (arr!8956 a2!948) (_1!13132 lt!435022))))))

(declare-fun b!299223 () Bool)

(assert (=> b!299223 (= e!214791 (arrayRangesEq!1535 a1!948 a2!948 (bvadd (_1!13132 lt!435022) #b00000000000000000000000000000001) (_2!13132 lt!435022)))))

(assert (= (and d!100616 (not res!246952)) b!299222))

(assert (= (and b!299222 res!246953) b!299223))

(declare-fun m!438435 () Bool)

(assert (=> b!299222 m!438435))

(declare-fun m!438437 () Bool)

(assert (=> b!299222 m!438437))

(declare-fun m!438439 () Bool)

(assert (=> b!299223 m!438439))

(assert (=> b!299131 d!100616))

(declare-fun d!100618 () Bool)

(assert (=> d!100618 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!955 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!299129 d!100618))

(declare-fun d!100620 () Bool)

(assert (=> d!100620 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!955 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!299129 d!100620))

(declare-fun d!100622 () Bool)

(assert (=> d!100622 (= (array_inv!7485 a1!948) (bvsge (size!7873 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!66910 d!100622))

(declare-fun d!100624 () Bool)

(assert (=> d!100624 (= (array_inv!7485 a2!948) (bvsge (size!7873 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!66910 d!100624))

(push 1)

(assert (not b!299211))

(assert (not b!299223))

(assert (not bm!5315))

(assert (not d!100614))

(assert (not b!299217))

(assert (not b!299212))

(check-sat)

