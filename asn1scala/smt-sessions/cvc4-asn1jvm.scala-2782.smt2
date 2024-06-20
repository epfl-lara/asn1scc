; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67100 () Bool)

(assert start!67100)

(declare-fun b!301311 () Bool)

(declare-fun e!216380 () Bool)

(declare-fun call!5438 () Bool)

(assert (=> b!301311 (= e!216380 call!5438)))

(declare-datatypes ((tuple4!1072 0))(
  ( (tuple4!1073 (_1!13191 (_ BitVec 32)) (_2!13191 (_ BitVec 32)) (_3!1493 (_ BitVec 32)) (_4!536 (_ BitVec 32))) )
))
(declare-fun lt!436621 () tuple4!1072)

(declare-fun lt!436615 () (_ BitVec 32))

(declare-fun e!216384 () Bool)

(declare-fun b!301312 () Bool)

(declare-datatypes ((array!18261 0))(
  ( (array!18262 (arr!9015 (Array (_ BitVec 32) (_ BitVec 8))) (size!7932 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18261)

(declare-fun a2!948 () array!18261)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301312 (= e!216384 (byteRangesEq!0 (select (arr!9015 a1!948) (_4!536 lt!436621)) (select (arr!9015 a2!948) (_4!536 lt!436621)) #b00000000000000000000000000000000 lt!436615))))

(declare-fun b!301313 () Bool)

(declare-fun res!248130 () Bool)

(declare-fun e!216390 () Bool)

(assert (=> b!301313 (=> (not res!248130) (not e!216390))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!18261 array!18261 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!301313 (= res!248130 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!301314 () Bool)

(declare-fun res!248134 () Bool)

(declare-fun lt!436618 () (_ BitVec 32))

(assert (=> b!301314 (= res!248134 (= lt!436618 #b00000000000000000000000000000000))))

(assert (=> b!301314 (=> res!248134 e!216380)))

(declare-fun e!216381 () Bool)

(assert (=> b!301314 (= e!216381 e!216380)))

(declare-fun b!301315 () Bool)

(declare-fun e!216385 () Bool)

(assert (=> b!301315 (= e!216385 e!216390)))

(declare-fun res!248126 () Bool)

(assert (=> b!301315 (=> (not res!248126) (not e!216390))))

(declare-fun lt!436623 () (_ BitVec 64))

(assert (=> b!301315 (= res!248126 (and (bvsle toBit!258 lt!436623) (bvsle fromBit!258 lt!436623)))))

(assert (=> b!301315 (= lt!436623 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7932 a1!948))))))

(declare-fun b!301316 () Bool)

(declare-fun res!248133 () Bool)

(declare-fun e!216388 () Bool)

(assert (=> b!301316 (=> (not res!248133) (not e!216388))))

(assert (=> b!301316 (= res!248133 e!216384)))

(declare-fun res!248135 () Bool)

(assert (=> b!301316 (=> res!248135 e!216384)))

(assert (=> b!301316 (= res!248135 (= lt!436615 #b00000000000000000000000000000000))))

(declare-fun res!248125 () Bool)

(assert (=> start!67100 (=> (not res!248125) (not e!216385))))

(assert (=> start!67100 (= res!248125 (and (bvsle (size!7932 a1!948) (size!7932 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67100 e!216385))

(assert (=> start!67100 true))

(declare-fun array_inv!7544 (array!18261) Bool)

(assert (=> start!67100 (array_inv!7544 a1!948)))

(assert (=> start!67100 (array_inv!7544 a2!948)))

(declare-fun b!301317 () Bool)

(declare-datatypes ((Unit!21101 0))(
  ( (Unit!21102) )
))
(declare-fun e!216387 () Unit!21101)

(declare-fun lt!436617 () Unit!21101)

(assert (=> b!301317 (= e!216387 lt!436617)))

(declare-fun lt!436622 () tuple4!1072)

(declare-fun arrayRangesEqImpliesEq!249 (array!18261 array!18261 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21101)

(assert (=> b!301317 (= lt!436617 (arrayRangesEqImpliesEq!249 a1!948 a2!948 (_1!13191 lt!436622) (_3!1493 lt!436621) (_2!13191 lt!436622)))))

(assert (=> b!301317 (= (select (arr!9015 a1!948) (_3!1493 lt!436621)) (select (arr!9015 a2!948) (_3!1493 lt!436621)))))

(declare-fun b!301318 () Bool)

(declare-fun Unit!21103 () Unit!21101)

(assert (=> b!301318 (= e!216387 Unit!21103)))

(declare-fun b!301319 () Bool)

(declare-fun res!248129 () Bool)

(assert (=> b!301319 (=> (not res!248129) (not e!216390))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!301319 (= res!248129 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436623) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!301320 () Bool)

(declare-fun e!216389 () Bool)

(assert (=> b!301320 (= e!216390 e!216389)))

(declare-fun res!248132 () Bool)

(assert (=> b!301320 (=> (not res!248132) (not e!216389))))

(declare-fun e!216379 () Bool)

(assert (=> b!301320 (= res!248132 e!216379)))

(declare-fun c!14177 () Bool)

(assert (=> b!301320 (= c!14177 (= (_3!1493 lt!436622) (_4!536 lt!436622)))))

(declare-fun lt!436620 () Unit!21101)

(declare-fun e!216383 () Unit!21101)

(assert (=> b!301320 (= lt!436620 e!216383)))

(declare-fun c!14178 () Bool)

(assert (=> b!301320 (= c!14178 (bvslt (_1!13191 lt!436621) (_2!13191 lt!436621)))))

(assert (=> b!301320 (= lt!436615 ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1072)

(assert (=> b!301320 (= lt!436621 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!301320 (= lt!436618 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!436624 () (_ BitVec 32))

(assert (=> b!301320 (= lt!436624 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301320 (= lt!436622 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!301321 () Bool)

(declare-fun res!248128 () Bool)

(assert (=> b!301321 (=> (not res!248128) (not e!216388))))

(assert (=> b!301321 (= res!248128 (byteRangesEq!0 (select (arr!9015 a1!948) (_3!1493 lt!436621)) (select (arr!9015 a2!948) (_3!1493 lt!436621)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun b!301322 () Bool)

(declare-fun lt!436626 () Unit!21101)

(assert (=> b!301322 (= e!216383 lt!436626)))

(declare-fun arrayRangesEqSlicedLemma!204 (array!18261 array!18261 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21101)

(assert (=> b!301322 (= lt!436626 (arrayRangesEqSlicedLemma!204 a1!948 a2!948 (_1!13191 lt!436622) (_2!13191 lt!436622) (_1!13191 lt!436621) (_2!13191 lt!436621)))))

(declare-fun arrayRangesEq!1594 (array!18261 array!18261 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301322 (arrayRangesEq!1594 a1!948 a2!948 (_1!13191 lt!436621) (_2!13191 lt!436621))))

(declare-fun b!301323 () Bool)

(assert (=> b!301323 (= e!216388 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 fromSlice!52) (bvsgt toSlice!52 lt!436623)))))

(declare-fun bm!5435 () Bool)

(assert (=> bm!5435 (= call!5438 (byteRangesEq!0 (ite c!14177 (select (arr!9015 a1!948) (_3!1493 lt!436622)) (select (arr!9015 a1!948) (_4!536 lt!436622))) (ite c!14177 (select (arr!9015 a2!948) (_3!1493 lt!436622)) (select (arr!9015 a2!948) (_4!536 lt!436622))) (ite c!14177 lt!436624 #b00000000000000000000000000000000) lt!436618))))

(declare-fun b!301324 () Bool)

(declare-fun e!216386 () Unit!21101)

(declare-fun lt!436619 () Unit!21101)

(assert (=> b!301324 (= e!216386 lt!436619)))

(assert (=> b!301324 (= lt!436619 (arrayRangesEqImpliesEq!249 a1!948 a2!948 (_1!13191 lt!436622) (_4!536 lt!436621) (_2!13191 lt!436622)))))

(assert (=> b!301324 (= (select (arr!9015 a1!948) (_4!536 lt!436621)) (select (arr!9015 a2!948) (_4!536 lt!436621)))))

(declare-fun b!301325 () Bool)

(assert (=> b!301325 (= e!216389 e!216388)))

(declare-fun res!248131 () Bool)

(assert (=> b!301325 (=> (not res!248131) (not e!216388))))

(assert (=> b!301325 (= res!248131 (not (= (_3!1493 lt!436621) (_4!536 lt!436621))))))

(declare-fun lt!436616 () Unit!21101)

(assert (=> b!301325 (= lt!436616 e!216386)))

(declare-fun c!14175 () Bool)

(assert (=> b!301325 (= c!14175 (and (bvslt (_4!536 lt!436621) (_4!536 lt!436622)) (bvslt (_3!1493 lt!436622) (_4!536 lt!436621))))))

(declare-fun lt!436625 () Unit!21101)

(assert (=> b!301325 (= lt!436625 e!216387)))

(declare-fun c!14176 () Bool)

(assert (=> b!301325 (= c!14176 (and (bvslt (_3!1493 lt!436622) (_3!1493 lt!436621)) (bvslt (_3!1493 lt!436621) (_4!536 lt!436622))))))

(declare-fun b!301326 () Bool)

(declare-fun Unit!21104 () Unit!21101)

(assert (=> b!301326 (= e!216386 Unit!21104)))

(declare-fun b!301327 () Bool)

(declare-fun Unit!21105 () Unit!21101)

(assert (=> b!301327 (= e!216383 Unit!21105)))

(declare-fun b!301328 () Bool)

(assert (=> b!301328 (= e!216379 e!216381)))

(declare-fun res!248127 () Bool)

(assert (=> b!301328 (= res!248127 (byteRangesEq!0 (select (arr!9015 a1!948) (_3!1493 lt!436622)) (select (arr!9015 a2!948) (_3!1493 lt!436622)) lt!436624 #b00000000000000000000000000000111))))

(assert (=> b!301328 (=> (not res!248127) (not e!216381))))

(declare-fun b!301329 () Bool)

(assert (=> b!301329 (= e!216379 call!5438)))

(assert (= (and start!67100 res!248125) b!301315))

(assert (= (and b!301315 res!248126) b!301313))

(assert (= (and b!301313 res!248130) b!301319))

(assert (= (and b!301319 res!248129) b!301320))

(assert (= (and b!301320 c!14178) b!301322))

(assert (= (and b!301320 (not c!14178)) b!301327))

(assert (= (and b!301320 c!14177) b!301329))

(assert (= (and b!301320 (not c!14177)) b!301328))

(assert (= (and b!301328 res!248127) b!301314))

(assert (= (and b!301314 (not res!248134)) b!301311))

(assert (= (or b!301329 b!301311) bm!5435))

(assert (= (and b!301320 res!248132) b!301325))

(assert (= (and b!301325 c!14176) b!301317))

(assert (= (and b!301325 (not c!14176)) b!301318))

(assert (= (and b!301325 c!14175) b!301324))

(assert (= (and b!301325 (not c!14175)) b!301326))

(assert (= (and b!301325 res!248131) b!301321))

(assert (= (and b!301321 res!248128) b!301316))

(assert (= (and b!301316 (not res!248135)) b!301312))

(assert (= (and b!301316 res!248133) b!301323))

(declare-fun m!440137 () Bool)

(assert (=> b!301324 m!440137))

(declare-fun m!440139 () Bool)

(assert (=> b!301324 m!440139))

(declare-fun m!440141 () Bool)

(assert (=> b!301324 m!440141))

(declare-fun m!440143 () Bool)

(assert (=> bm!5435 m!440143))

(declare-fun m!440145 () Bool)

(assert (=> bm!5435 m!440145))

(declare-fun m!440147 () Bool)

(assert (=> bm!5435 m!440147))

(declare-fun m!440149 () Bool)

(assert (=> bm!5435 m!440149))

(declare-fun m!440151 () Bool)

(assert (=> bm!5435 m!440151))

(assert (=> b!301312 m!440139))

(assert (=> b!301312 m!440141))

(assert (=> b!301312 m!440139))

(assert (=> b!301312 m!440141))

(declare-fun m!440153 () Bool)

(assert (=> b!301312 m!440153))

(declare-fun m!440155 () Bool)

(assert (=> b!301317 m!440155))

(declare-fun m!440157 () Bool)

(assert (=> b!301317 m!440157))

(declare-fun m!440159 () Bool)

(assert (=> b!301317 m!440159))

(assert (=> b!301321 m!440157))

(assert (=> b!301321 m!440159))

(assert (=> b!301321 m!440157))

(assert (=> b!301321 m!440159))

(declare-fun m!440161 () Bool)

(assert (=> b!301321 m!440161))

(declare-fun m!440163 () Bool)

(assert (=> b!301313 m!440163))

(declare-fun m!440165 () Bool)

(assert (=> start!67100 m!440165))

(declare-fun m!440167 () Bool)

(assert (=> start!67100 m!440167))

(declare-fun m!440169 () Bool)

(assert (=> b!301322 m!440169))

(declare-fun m!440171 () Bool)

(assert (=> b!301322 m!440171))

(declare-fun m!440173 () Bool)

(assert (=> b!301320 m!440173))

(declare-fun m!440175 () Bool)

(assert (=> b!301320 m!440175))

(assert (=> b!301328 m!440147))

(assert (=> b!301328 m!440149))

(assert (=> b!301328 m!440147))

(assert (=> b!301328 m!440149))

(declare-fun m!440177 () Bool)

(assert (=> b!301328 m!440177))

(push 1)

(assert (not b!301320))

(assert (not start!67100))

(assert (not b!301321))

(assert (not bm!5435))

(assert (not b!301312))

(assert (not b!301322))

(assert (not b!301328))

(assert (not b!301313))

(assert (not b!301317))

(assert (not b!301324))

(check-sat)

(pop 1)

(push 1)

(check-sat)

