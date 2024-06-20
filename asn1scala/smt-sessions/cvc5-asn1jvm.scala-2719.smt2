; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66556 () Bool)

(assert start!66556)

(declare-fun b!298167 () Bool)

(declare-fun e!213585 () Bool)

(declare-datatypes ((array!17876 0))(
  ( (array!17877 (arr!8827 (Array (_ BitVec 32) (_ BitVec 8))) (size!7747 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13498 0))(
  ( (BitStream!13499 (buf!7810 array!17876) (currentByte!14370 (_ BitVec 32)) (currentBit!14365 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13498)

(declare-fun array_inv!7359 (array!17876) Bool)

(assert (=> b!298167 (= e!213585 (array_inv!7359 (buf!7810 thiss!1728)))))

(declare-fun b!298165 () Bool)

(declare-fun res!246052 () Bool)

(declare-fun e!213583 () Bool)

(assert (=> b!298165 (=> (not res!246052) (not e!213583))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!298165 (= res!246052 (bvsge from!505 to!474))))

(declare-fun b!298166 () Bool)

(declare-fun arr!273 () array!17876)

(declare-datatypes ((List!999 0))(
  ( (Nil!996) (Cons!995 (h!1114 Bool) (t!1884 List!999)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13498 array!17876 (_ BitVec 64) (_ BitVec 64)) List!999)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13498 BitStream!13498 (_ BitVec 64)) List!999)

(assert (=> b!298166 (= e!213583 (not (= (byteArrayBitContentToList!0 thiss!1728 arr!273 from!505 (bvsub to!474 from!505)) (bitStreamReadBitsIntoList!0 thiss!1728 thiss!1728 (bvsub to!474 from!505)))))))

(declare-fun arrayBitRangesEq!0 (array!17876 array!17876 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298166 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!434319 () (_ BitVec 64))

(declare-datatypes ((Unit!20815 0))(
  ( (Unit!20816) )
))
(declare-fun lt!434318 () Unit!20815)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17876 array!17876 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20815)

(assert (=> b!298166 (= lt!434318 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434319 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!298166 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434319)))

(assert (=> b!298166 (= lt!434319 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7747 arr!273))))))

(declare-fun lt!434317 () Unit!20815)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17876) Unit!20815)

(assert (=> b!298166 (= lt!434317 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun res!246053 () Bool)

(assert (=> start!66556 (=> (not res!246053) (not e!213583))))

(declare-fun nBits!523 () (_ BitVec 64))

(assert (=> start!66556 (= res!246053 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7747 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66556 e!213583))

(declare-fun inv!12 (BitStream!13498) Bool)

(assert (=> start!66556 (and (inv!12 thiss!1728) e!213585)))

(assert (=> start!66556 true))

(assert (=> start!66556 (array_inv!7359 arr!273)))

(declare-fun b!298164 () Bool)

(declare-fun res!246051 () Bool)

(assert (=> b!298164 (=> (not res!246051) (not e!213583))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298164 (= res!246051 (validate_offset_bits!1 ((_ sign_extend 32) (size!7747 (buf!7810 thiss!1728))) ((_ sign_extend 32) (currentByte!14370 thiss!1728)) ((_ sign_extend 32) (currentBit!14365 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!66556 res!246053) b!298164))

(assert (= (and b!298164 res!246051) b!298165))

(assert (= (and b!298165 res!246052) b!298166))

(assert (= start!66556 b!298167))

(declare-fun m!437089 () Bool)

(assert (=> b!298167 m!437089))

(declare-fun m!437091 () Bool)

(assert (=> b!298166 m!437091))

(declare-fun m!437093 () Bool)

(assert (=> b!298166 m!437093))

(declare-fun m!437095 () Bool)

(assert (=> b!298166 m!437095))

(declare-fun m!437097 () Bool)

(assert (=> b!298166 m!437097))

(declare-fun m!437099 () Bool)

(assert (=> b!298166 m!437099))

(declare-fun m!437101 () Bool)

(assert (=> b!298166 m!437101))

(declare-fun m!437103 () Bool)

(assert (=> start!66556 m!437103))

(declare-fun m!437105 () Bool)

(assert (=> start!66556 m!437105))

(declare-fun m!437107 () Bool)

(assert (=> b!298164 m!437107))

(push 1)

(assert (not b!298164))

(assert (not b!298166))

(assert (not start!66556))

(assert (not b!298167))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!100366 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!100366 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7747 (buf!7810 thiss!1728))) ((_ sign_extend 32) (currentByte!14370 thiss!1728)) ((_ sign_extend 32) (currentBit!14365 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7747 (buf!7810 thiss!1728))) ((_ sign_extend 32) (currentByte!14370 thiss!1728)) ((_ sign_extend 32) (currentBit!14365 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25690 () Bool)

(assert (= bs!25690 d!100366))

(declare-fun m!437155 () Bool)

(assert (=> bs!25690 m!437155))

(assert (=> b!298164 d!100366))

(declare-fun call!5285 () Bool)

(declare-fun lt!434361 () (_ BitVec 32))

(declare-fun c!13647 () Bool)

(declare-fun bm!5282 () Bool)

(declare-datatypes ((tuple4!938 0))(
  ( (tuple4!939 (_1!13118 (_ BitVec 32)) (_2!13118 (_ BitVec 32)) (_3!1426 (_ BitVec 32)) (_4!469 (_ BitVec 32))) )
))
(declare-fun lt!434360 () tuple4!938)

(declare-fun lt!434359 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5282 (= call!5285 (byteRangesEq!0 (ite c!13647 (select (arr!8827 arr!273) (_3!1426 lt!434360)) (select (arr!8827 arr!273) (_4!469 lt!434360))) (ite c!13647 (select (arr!8827 arr!273) (_3!1426 lt!434360)) (select (arr!8827 arr!273) (_4!469 lt!434360))) (ite c!13647 lt!434361 #b00000000000000000000000000000000) lt!434359))))

(declare-fun b!298230 () Bool)

(declare-fun e!213646 () Bool)

(assert (=> b!298230 (= e!213646 call!5285)))

(declare-fun b!298231 () Bool)

(declare-fun e!213648 () Bool)

(declare-fun e!213643 () Bool)

(assert (=> b!298231 (= e!213648 e!213643)))

(declare-fun res!246100 () Bool)

(assert (=> b!298231 (=> (not res!246100) (not e!213643))))

(declare-fun e!213645 () Bool)

(assert (=> b!298231 (= res!246100 e!213645)))

(declare-fun res!246101 () Bool)

(assert (=> b!298231 (=> res!246101 e!213645)))

(assert (=> b!298231 (= res!246101 (bvsge (_1!13118 lt!434360) (_2!13118 lt!434360)))))

(assert (=> b!298231 (= lt!434359 ((_ extract 31 0) (bvsrem lt!434319 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298231 (= lt!434361 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!938)

(assert (=> b!298231 (= lt!434360 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434319))))

(declare-fun d!100368 () Bool)

(declare-fun res!246102 () Bool)

(assert (=> d!100368 (=> res!246102 e!213648)))

(assert (=> d!100368 (= res!246102 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!434319))))

(assert (=> d!100368 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434319) e!213648)))

(declare-fun b!298232 () Bool)

(declare-fun e!213647 () Bool)

(assert (=> b!298232 (= e!213647 call!5285)))

(declare-fun b!298233 () Bool)

(assert (=> b!298233 (= e!213643 e!213646)))

(assert (=> b!298233 (= c!13647 (= (_3!1426 lt!434360) (_4!469 lt!434360)))))

(declare-fun b!298234 () Bool)

(declare-fun e!213644 () Bool)

(assert (=> b!298234 (= e!213646 e!213644)))

(declare-fun res!246104 () Bool)

(assert (=> b!298234 (= res!246104 (byteRangesEq!0 (select (arr!8827 arr!273) (_3!1426 lt!434360)) (select (arr!8827 arr!273) (_3!1426 lt!434360)) lt!434361 #b00000000000000000000000000001000))))

(assert (=> b!298234 (=> (not res!246104) (not e!213644))))

(declare-fun b!298235 () Bool)

(declare-fun arrayRangesEq!1527 (array!17876 array!17876 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!298235 (= e!213645 (arrayRangesEq!1527 arr!273 arr!273 (_1!13118 lt!434360) (_2!13118 lt!434360)))))

(declare-fun b!298236 () Bool)

(declare-fun res!246103 () Bool)

(assert (=> b!298236 (= res!246103 (= lt!434359 #b00000000000000000000000000000000))))

(assert (=> b!298236 (=> res!246103 e!213647)))

(assert (=> b!298236 (= e!213644 e!213647)))

(assert (= (and d!100368 (not res!246102)) b!298231))

(assert (= (and b!298231 (not res!246101)) b!298235))

(assert (= (and b!298231 res!246100) b!298233))

(assert (= (and b!298233 c!13647) b!298230))

(assert (= (and b!298233 (not c!13647)) b!298234))

(assert (= (and b!298234 res!246104) b!298236))

(assert (= (and b!298236 (not res!246103)) b!298232))

(assert (= (or b!298230 b!298232) bm!5282))

(declare-fun m!437169 () Bool)

(assert (=> bm!5282 m!437169))

(declare-fun m!437171 () Bool)

(assert (=> bm!5282 m!437171))

(declare-fun m!437173 () Bool)

(assert (=> bm!5282 m!437173))

(assert (=> bm!5282 m!437169))

(assert (=> bm!5282 m!437171))

(declare-fun m!437175 () Bool)

(assert (=> b!298231 m!437175))

(assert (=> b!298234 m!437171))

(assert (=> b!298234 m!437171))

(assert (=> b!298234 m!437171))

(assert (=> b!298234 m!437171))

(declare-fun m!437177 () Bool)

(assert (=> b!298234 m!437177))

(declare-fun m!437179 () Bool)

(assert (=> b!298235 m!437179))

(assert (=> b!298166 d!100368))

(declare-fun d!100372 () Bool)

(declare-fun e!213654 () Bool)

(assert (=> d!100372 e!213654))

(declare-fun res!246107 () Bool)

(assert (=> d!100372 (=> (not res!246107) (not e!213654))))

(declare-fun lt!434367 () (_ BitVec 64))

(assert (=> d!100372 (= res!246107 (or (= lt!434367 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!434367 #b0000000000000000000000000000000000000000000000000000000000001000) lt!434367))))))

(assert (=> d!100372 (= lt!434367 ((_ sign_extend 32) (size!7747 arr!273)))))

(declare-fun lt!434366 () Unit!20815)

(declare-fun choose!59 (array!17876) Unit!20815)

(assert (=> d!100372 (= lt!434366 (choose!59 arr!273))))

(assert (=> d!100372 (= (arrayBitRangesEqReflexiveLemma!0 arr!273) lt!434366)))

(declare-fun b!298245 () Bool)

(assert (=> b!298245 (= e!213654 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!7747 arr!273)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!100372 res!246107) b!298245))

(declare-fun m!437181 () Bool)

(assert (=> d!100372 m!437181))

(declare-fun m!437185 () Bool)

(assert (=> b!298245 m!437185))

(assert (=> b!298166 d!100372))

(declare-fun lt!434370 () (_ BitVec 32))

(declare-fun bm!5283 () Bool)

(declare-fun lt!434368 () (_ BitVec 32))

(declare-fun lt!434369 () tuple4!938)

(declare-fun c!13651 () Bool)

(declare-fun call!5286 () Bool)

(assert (=> bm!5283 (= call!5286 (byteRangesEq!0 (ite c!13651 (select (arr!8827 arr!273) (_3!1426 lt!434369)) (select (arr!8827 arr!273) (_4!469 lt!434369))) (ite c!13651 (select (arr!8827 arr!273) (_3!1426 lt!434369)) (select (arr!8827 arr!273) (_4!469 lt!434369))) (ite c!13651 lt!434370 #b00000000000000000000000000000000) lt!434368))))

(declare-fun b!298246 () Bool)

(declare-fun e!213658 () Bool)

(assert (=> b!298246 (= e!213658 call!5286)))

(declare-fun b!298247 () Bool)

(declare-fun e!213660 () Bool)

(declare-fun e!213655 () Bool)

(assert (=> b!298247 (= e!213660 e!213655)))

(declare-fun res!246108 () Bool)

(assert (=> b!298247 (=> (not res!246108) (not e!213655))))

(declare-fun e!213657 () Bool)

(assert (=> b!298247 (= res!246108 e!213657)))

(declare-fun res!246109 () Bool)

(assert (=> b!298247 (=> res!246109 e!213657)))

(assert (=> b!298247 (= res!246109 (bvsge (_1!13118 lt!434369) (_2!13118 lt!434369)))))

(assert (=> b!298247 (= lt!434368 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298247 (= lt!434370 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298247 (= lt!434369 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun d!100374 () Bool)

(declare-fun res!246110 () Bool)

(assert (=> d!100374 (=> res!246110 e!213660)))

(assert (=> d!100374 (= res!246110 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100374 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!213660)))

(declare-fun b!298248 () Bool)

(declare-fun e!213659 () Bool)

(assert (=> b!298248 (= e!213659 call!5286)))

(declare-fun b!298249 () Bool)

(assert (=> b!298249 (= e!213655 e!213658)))

(assert (=> b!298249 (= c!13651 (= (_3!1426 lt!434369) (_4!469 lt!434369)))))

(declare-fun b!298250 () Bool)

(declare-fun e!213656 () Bool)

(assert (=> b!298250 (= e!213658 e!213656)))

(declare-fun res!246112 () Bool)

(assert (=> b!298250 (= res!246112 (byteRangesEq!0 (select (arr!8827 arr!273) (_3!1426 lt!434369)) (select (arr!8827 arr!273) (_3!1426 lt!434369)) lt!434370 #b00000000000000000000000000001000))))

(assert (=> b!298250 (=> (not res!246112) (not e!213656))))

(declare-fun b!298251 () Bool)

(assert (=> b!298251 (= e!213657 (arrayRangesEq!1527 arr!273 arr!273 (_1!13118 lt!434369) (_2!13118 lt!434369)))))

(declare-fun b!298252 () Bool)

(declare-fun res!246111 () Bool)

(assert (=> b!298252 (= res!246111 (= lt!434368 #b00000000000000000000000000000000))))

(assert (=> b!298252 (=> res!246111 e!213659)))

(assert (=> b!298252 (= e!213656 e!213659)))

(assert (= (and d!100374 (not res!246110)) b!298247))

(assert (= (and b!298247 (not res!246109)) b!298251))

(assert (= (and b!298247 res!246108) b!298249))

(assert (= (and b!298249 c!13651) b!298246))

(assert (= (and b!298249 (not c!13651)) b!298250))

(assert (= (and b!298250 res!246112) b!298252))

(assert (= (and b!298252 (not res!246111)) b!298248))

(assert (= (or b!298246 b!298248) bm!5283))

(declare-fun m!437191 () Bool)

(assert (=> bm!5283 m!437191))

(declare-fun m!437193 () Bool)

(assert (=> bm!5283 m!437193))

(declare-fun m!437195 () Bool)

(assert (=> bm!5283 m!437195))

(assert (=> bm!5283 m!437191))

(assert (=> bm!5283 m!437193))

(declare-fun m!437197 () Bool)

(assert (=> b!298247 m!437197))

(assert (=> b!298250 m!437193))

(assert (=> b!298250 m!437193))

(assert (=> b!298250 m!437193))

(assert (=> b!298250 m!437193))

(declare-fun m!437199 () Bool)

(assert (=> b!298250 m!437199))

(declare-fun m!437201 () Bool)

(assert (=> b!298251 m!437201))

(assert (=> b!298166 d!100374))

(declare-fun d!100380 () Bool)

(declare-fun c!13654 () Bool)

(assert (=> d!100380 (= c!13654 (= (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!213663 () List!999)

(assert (=> d!100380 (= (byteArrayBitContentToList!0 thiss!1728 arr!273 from!505 (bvsub to!474 from!505)) e!213663)))

(declare-fun b!298257 () Bool)

(assert (=> b!298257 (= e!213663 Nil!996)))

(declare-fun b!298258 () Bool)

(assert (=> b!298258 (= e!213663 (Cons!995 (not (= (bvand ((_ sign_extend 24) (select (arr!8827 arr!273) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 thiss!1728 arr!273 (bvadd from!505 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!100380 c!13654) b!298257))

(assert (= (and d!100380 (not c!13654)) b!298258))

(declare-fun m!437207 () Bool)

(assert (=> b!298258 m!437207))

(declare-fun m!437209 () Bool)

(assert (=> b!298258 m!437209))

(declare-fun m!437211 () Bool)

(assert (=> b!298258 m!437211))

(assert (=> b!298166 d!100380))

(declare-fun b!298288 () Bool)

(declare-fun e!213681 () Bool)

(declare-fun lt!434394 () List!999)

(declare-fun isEmpty!272 (List!999) Bool)

(assert (=> b!298288 (= e!213681 (isEmpty!272 lt!434394))))

(declare-datatypes ((tuple2!23388 0))(
  ( (tuple2!23389 (_1!13121 Bool) (_2!13121 BitStream!13498)) )
))
(declare-fun lt!434392 () tuple2!23388)

(declare-fun b!298287 () Bool)

(declare-fun lt!434393 () (_ BitVec 64))

(declare-datatypes ((tuple2!23390 0))(
  ( (tuple2!23391 (_1!13122 List!999) (_2!13122 BitStream!13498)) )
))
(declare-fun e!213680 () tuple2!23390)

(assert (=> b!298287 (= e!213680 (tuple2!23391 (Cons!995 (_1!13121 lt!434392) (bitStreamReadBitsIntoList!0 thiss!1728 (_2!13121 lt!434392) (bvsub (bvsub to!474 from!505) lt!434393))) (_2!13121 lt!434392)))))

(declare-fun readBit!0 (BitStream!13498) tuple2!23388)

(assert (=> b!298287 (= lt!434392 (readBit!0 thiss!1728))))

(assert (=> b!298287 (= lt!434393 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!298289 () Bool)

(declare-fun length!497 (List!999) Int)

(assert (=> b!298289 (= e!213681 (> (length!497 lt!434394) 0))))

(declare-fun d!100390 () Bool)

(assert (=> d!100390 e!213681))

(declare-fun c!13666 () Bool)

(assert (=> d!100390 (= c!13666 (= (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!100390 (= lt!434394 (_1!13122 e!213680))))

(declare-fun c!13667 () Bool)

(assert (=> d!100390 (= c!13667 (= (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!100390 (bvsge (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!100390 (= (bitStreamReadBitsIntoList!0 thiss!1728 thiss!1728 (bvsub to!474 from!505)) lt!434394)))

(declare-fun b!298286 () Bool)

(assert (=> b!298286 (= e!213680 (tuple2!23391 Nil!996 thiss!1728))))

(assert (= (and d!100390 c!13667) b!298286))

(assert (= (and d!100390 (not c!13667)) b!298287))

(assert (= (and d!100390 c!13666) b!298288))

(assert (= (and d!100390 (not c!13666)) b!298289))

(declare-fun m!437237 () Bool)

(assert (=> b!298288 m!437237))

(declare-fun m!437239 () Bool)

(assert (=> b!298287 m!437239))

(declare-fun m!437241 () Bool)

(assert (=> b!298287 m!437241))

(declare-fun m!437243 () Bool)

(assert (=> b!298289 m!437243))

(assert (=> b!298166 d!100390))

(declare-fun d!100402 () Bool)

(assert (=> d!100402 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!434397 () Unit!20815)

(declare-fun choose!4 (array!17876 array!17876 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20815)

(assert (=> d!100402 (= lt!434397 (choose!4 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434319 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100402 (bvsle (size!7747 arr!273) (size!7747 arr!273))))

(assert (=> d!100402 (= (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434319 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) lt!434397)))

(declare-fun bs!25695 () Bool)

(assert (= bs!25695 d!100402))

(assert (=> bs!25695 m!437097))

(declare-fun m!437245 () Bool)

(assert (=> bs!25695 m!437245))

(assert (=> b!298166 d!100402))

(declare-fun d!100404 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!100404 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14365 thiss!1728) (currentByte!14370 thiss!1728) (size!7747 (buf!7810 thiss!1728))))))

(declare-fun bs!25696 () Bool)

(assert (= bs!25696 d!100404))

(declare-fun m!437247 () Bool)

(assert (=> bs!25696 m!437247))

(assert (=> start!66556 d!100404))

(declare-fun d!100406 () Bool)

(assert (=> d!100406 (= (array_inv!7359 arr!273) (bvsge (size!7747 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!66556 d!100406))

(declare-fun d!100408 () Bool)

(assert (=> d!100408 (= (array_inv!7359 (buf!7810 thiss!1728)) (bvsge (size!7747 (buf!7810 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!298167 d!100408))

(push 1)

(assert (not b!298250))

(assert (not b!298234))

(assert (not b!298289))

(assert (not d!100366))

(assert (not b!298251))

(assert (not d!100372))

(assert (not bm!5283))

(assert (not bm!5282))

(assert (not b!298288))

(assert (not b!298235))

(assert (not b!298247))

(assert (not b!298245))

(assert (not d!100402))

(assert (not d!100404))

(assert (not b!298231))

(assert (not b!298287))

(assert (not b!298258))

(check-sat)

(pop 1)

(push 1)

(check-sat)

