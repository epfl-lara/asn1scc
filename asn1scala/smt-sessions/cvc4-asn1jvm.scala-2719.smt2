; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66560 () Bool)

(assert start!66560)

(declare-fun b!298189 () Bool)

(declare-fun res!246069 () Bool)

(declare-fun e!213606 () Bool)

(assert (=> b!298189 (=> (not res!246069) (not e!213606))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!298189 (= res!246069 (bvsge from!505 to!474))))

(declare-fun b!298190 () Bool)

(declare-datatypes ((array!17880 0))(
  ( (array!17881 (arr!8829 (Array (_ BitVec 32) (_ BitVec 8))) (size!7749 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13502 0))(
  ( (BitStream!13503 (buf!7812 array!17880) (currentByte!14372 (_ BitVec 32)) (currentBit!14367 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13502)

(declare-fun arr!273 () array!17880)

(declare-datatypes ((List!1001 0))(
  ( (Nil!998) (Cons!997 (h!1116 Bool) (t!1886 List!1001)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13502 array!17880 (_ BitVec 64) (_ BitVec 64)) List!1001)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13502 BitStream!13502 (_ BitVec 64)) List!1001)

(assert (=> b!298190 (= e!213606 (not (= (byteArrayBitContentToList!0 thiss!1728 arr!273 from!505 (bvsub to!474 from!505)) (bitStreamReadBitsIntoList!0 thiss!1728 thiss!1728 (bvsub to!474 from!505)))))))

(declare-fun arrayBitRangesEq!0 (array!17880 array!17880 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298190 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20819 0))(
  ( (Unit!20820) )
))
(declare-fun lt!434335 () Unit!20819)

(declare-fun lt!434336 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17880 array!17880 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20819)

(assert (=> b!298190 (= lt!434335 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434336 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!298190 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434336)))

(assert (=> b!298190 (= lt!434336 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7749 arr!273))))))

(declare-fun lt!434337 () Unit!20819)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17880) Unit!20819)

(assert (=> b!298190 (= lt!434337 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!298191 () Bool)

(declare-fun e!213608 () Bool)

(declare-fun array_inv!7361 (array!17880) Bool)

(assert (=> b!298191 (= e!213608 (array_inv!7361 (buf!7812 thiss!1728)))))

(declare-fun res!246071 () Bool)

(assert (=> start!66560 (=> (not res!246071) (not e!213606))))

(declare-fun nBits!523 () (_ BitVec 64))

(assert (=> start!66560 (= res!246071 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7749 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66560 e!213606))

(declare-fun inv!12 (BitStream!13502) Bool)

(assert (=> start!66560 (and (inv!12 thiss!1728) e!213608)))

(assert (=> start!66560 true))

(assert (=> start!66560 (array_inv!7361 arr!273)))

(declare-fun b!298188 () Bool)

(declare-fun res!246070 () Bool)

(assert (=> b!298188 (=> (not res!246070) (not e!213606))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298188 (= res!246070 (validate_offset_bits!1 ((_ sign_extend 32) (size!7749 (buf!7812 thiss!1728))) ((_ sign_extend 32) (currentByte!14372 thiss!1728)) ((_ sign_extend 32) (currentBit!14367 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!66560 res!246071) b!298188))

(assert (= (and b!298188 res!246070) b!298189))

(assert (= (and b!298189 res!246069) b!298190))

(assert (= start!66560 b!298191))

(declare-fun m!437129 () Bool)

(assert (=> b!298190 m!437129))

(declare-fun m!437131 () Bool)

(assert (=> b!298190 m!437131))

(declare-fun m!437133 () Bool)

(assert (=> b!298190 m!437133))

(declare-fun m!437135 () Bool)

(assert (=> b!298190 m!437135))

(declare-fun m!437137 () Bool)

(assert (=> b!298190 m!437137))

(declare-fun m!437139 () Bool)

(assert (=> b!298190 m!437139))

(declare-fun m!437141 () Bool)

(assert (=> b!298191 m!437141))

(declare-fun m!437143 () Bool)

(assert (=> start!66560 m!437143))

(declare-fun m!437145 () Bool)

(assert (=> start!66560 m!437145))

(declare-fun m!437147 () Bool)

(assert (=> b!298188 m!437147))

(push 1)

(assert (not start!66560))

(assert (not b!298188))

(assert (not b!298191))

(assert (not b!298190))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!100378 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!100378 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14367 thiss!1728) (currentByte!14372 thiss!1728) (size!7749 (buf!7812 thiss!1728))))))

(declare-fun bs!25691 () Bool)

(assert (= bs!25691 d!100378))

(declare-fun m!437203 () Bool)

(assert (=> bs!25691 m!437203))

(assert (=> start!66560 d!100378))

(declare-fun d!100382 () Bool)

(assert (=> d!100382 (= (array_inv!7361 arr!273) (bvsge (size!7749 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!66560 d!100382))

(declare-fun d!100384 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!100384 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7749 (buf!7812 thiss!1728))) ((_ sign_extend 32) (currentByte!14372 thiss!1728)) ((_ sign_extend 32) (currentBit!14367 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7749 (buf!7812 thiss!1728))) ((_ sign_extend 32) (currentByte!14372 thiss!1728)) ((_ sign_extend 32) (currentBit!14367 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25692 () Bool)

(assert (= bs!25692 d!100384))

(declare-fun m!437205 () Bool)

(assert (=> bs!25692 m!437205))

(assert (=> b!298188 d!100384))

(declare-fun d!100386 () Bool)

(assert (=> d!100386 (= (array_inv!7361 (buf!7812 thiss!1728)) (bvsge (size!7749 (buf!7812 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!298191 d!100386))

(declare-fun b!298304 () Bool)

(declare-fun e!213699 () Bool)

(declare-datatypes ((tuple4!940 0))(
  ( (tuple4!941 (_1!13123 (_ BitVec 32)) (_2!13123 (_ BitVec 32)) (_3!1427 (_ BitVec 32)) (_4!470 (_ BitVec 32))) )
))
(declare-fun lt!434406 () tuple4!940)

(declare-fun arrayRangesEq!1528 (array!17880 array!17880 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!298304 (= e!213699 (arrayRangesEq!1528 arr!273 arr!273 (_1!13123 lt!434406) (_2!13123 lt!434406)))))

(declare-fun b!298305 () Bool)

(declare-fun e!213698 () Bool)

(declare-fun call!5290 () Bool)

(assert (=> b!298305 (= e!213698 call!5290)))

(declare-fun d!100388 () Bool)

(declare-fun res!246132 () Bool)

(declare-fun e!213694 () Bool)

(assert (=> d!100388 (=> res!246132 e!213694)))

(assert (=> d!100388 (= res!246132 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!434336))))

(assert (=> d!100388 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434336) e!213694)))

(declare-fun b!298306 () Bool)

(declare-fun e!213697 () Bool)

(assert (=> b!298306 (= e!213697 e!213698)))

(declare-fun c!13670 () Bool)

(assert (=> b!298306 (= c!13670 (= (_3!1427 lt!434406) (_4!470 lt!434406)))))

(declare-fun lt!434404 () (_ BitVec 32))

(declare-fun lt!434405 () (_ BitVec 32))

(declare-fun bm!5287 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5287 (= call!5290 (byteRangesEq!0 (select (arr!8829 arr!273) (_3!1427 lt!434406)) (select (arr!8829 arr!273) (_3!1427 lt!434406)) lt!434405 (ite c!13670 lt!434404 #b00000000000000000000000000001000)))))

(declare-fun b!298307 () Bool)

(declare-fun e!213695 () Bool)

(assert (=> b!298307 (= e!213698 e!213695)))

(declare-fun res!246129 () Bool)

(assert (=> b!298307 (= res!246129 call!5290)))

(assert (=> b!298307 (=> (not res!246129) (not e!213695))))

(declare-fun b!298308 () Bool)

(declare-fun e!213696 () Bool)

(assert (=> b!298308 (= e!213696 (byteRangesEq!0 (select (arr!8829 arr!273) (_4!470 lt!434406)) (select (arr!8829 arr!273) (_4!470 lt!434406)) #b00000000000000000000000000000000 lt!434404))))

(declare-fun b!298309 () Bool)

(assert (=> b!298309 (= e!213694 e!213697)))

(declare-fun res!246128 () Bool)

(assert (=> b!298309 (=> (not res!246128) (not e!213697))))

(assert (=> b!298309 (= res!246128 e!213699)))

(declare-fun res!246130 () Bool)

(assert (=> b!298309 (=> res!246130 e!213699)))

(assert (=> b!298309 (= res!246130 (bvsge (_1!13123 lt!434406) (_2!13123 lt!434406)))))

(assert (=> b!298309 (= lt!434404 ((_ extract 31 0) (bvsrem lt!434336 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298309 (= lt!434405 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!940)

(assert (=> b!298309 (= lt!434406 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434336))))

(declare-fun b!298310 () Bool)

(declare-fun res!246131 () Bool)

(assert (=> b!298310 (= res!246131 (= lt!434404 #b00000000000000000000000000000000))))

(assert (=> b!298310 (=> res!246131 e!213696)))

(assert (=> b!298310 (= e!213695 e!213696)))

(assert (= (and d!100388 (not res!246132)) b!298309))

(assert (= (and b!298309 (not res!246130)) b!298304))

(assert (= (and b!298309 res!246128) b!298306))

(assert (= (and b!298306 c!13670) b!298305))

(assert (= (and b!298306 (not c!13670)) b!298307))

(assert (= (and b!298307 res!246129) b!298310))

(assert (= (and b!298310 (not res!246131)) b!298308))

(assert (= (or b!298305 b!298307) bm!5287))

(declare-fun m!437249 () Bool)

(assert (=> b!298304 m!437249))

(declare-fun m!437251 () Bool)

(assert (=> bm!5287 m!437251))

(assert (=> bm!5287 m!437251))

(assert (=> bm!5287 m!437251))

(assert (=> bm!5287 m!437251))

(declare-fun m!437253 () Bool)

(assert (=> bm!5287 m!437253))

(declare-fun m!437255 () Bool)

(assert (=> b!298308 m!437255))

(assert (=> b!298308 m!437255))

(assert (=> b!298308 m!437255))

(assert (=> b!298308 m!437255))

(declare-fun m!437257 () Bool)

(assert (=> b!298308 m!437257))

(declare-fun m!437259 () Bool)

(assert (=> b!298309 m!437259))

(assert (=> b!298190 d!100388))

(declare-fun d!100410 () Bool)

(declare-fun e!213702 () Bool)

(assert (=> d!100410 e!213702))

(declare-fun res!246135 () Bool)

(assert (=> d!100410 (=> (not res!246135) (not e!213702))))

(declare-fun lt!434412 () (_ BitVec 64))

(assert (=> d!100410 (= res!246135 (or (= lt!434412 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!434412 #b0000000000000000000000000000000000000000000000000000000000001000) lt!434412))))))

(assert (=> d!100410 (= lt!434412 ((_ sign_extend 32) (size!7749 arr!273)))))

(declare-fun lt!434411 () Unit!20819)

(declare-fun choose!59 (array!17880) Unit!20819)

(assert (=> d!100410 (= lt!434411 (choose!59 arr!273))))

(assert (=> d!100410 (= (arrayBitRangesEqReflexiveLemma!0 arr!273) lt!434411)))

(declare-fun b!298313 () Bool)

(assert (=> b!298313 (= e!213702 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!7749 arr!273)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!100410 res!246135) b!298313))

(declare-fun m!437261 () Bool)

(assert (=> d!100410 m!437261))

(declare-fun m!437263 () Bool)

(assert (=> b!298313 m!437263))

(assert (=> b!298190 d!100410))

(declare-fun b!298314 () Bool)

(declare-fun e!213708 () Bool)

(declare-fun lt!434415 () tuple4!940)

(assert (=> b!298314 (= e!213708 (arrayRangesEq!1528 arr!273 arr!273 (_1!13123 lt!434415) (_2!13123 lt!434415)))))

(declare-fun b!298315 () Bool)

(declare-fun e!213707 () Bool)

(declare-fun call!5291 () Bool)

(assert (=> b!298315 (= e!213707 call!5291)))

(declare-fun d!100412 () Bool)

(declare-fun res!246140 () Bool)

(declare-fun e!213703 () Bool)

(assert (=> d!100412 (=> res!246140 e!213703)))

(assert (=> d!100412 (= res!246140 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100412 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!213703)))

(declare-fun b!298316 () Bool)

(declare-fun e!213706 () Bool)

(assert (=> b!298316 (= e!213706 e!213707)))

(declare-fun c!13671 () Bool)

(assert (=> b!298316 (= c!13671 (= (_3!1427 lt!434415) (_4!470 lt!434415)))))

(declare-fun lt!434414 () (_ BitVec 32))

(declare-fun bm!5288 () Bool)

(declare-fun lt!434413 () (_ BitVec 32))

(assert (=> bm!5288 (= call!5291 (byteRangesEq!0 (select (arr!8829 arr!273) (_3!1427 lt!434415)) (select (arr!8829 arr!273) (_3!1427 lt!434415)) lt!434414 (ite c!13671 lt!434413 #b00000000000000000000000000001000)))))

(declare-fun b!298317 () Bool)

(declare-fun e!213704 () Bool)

(assert (=> b!298317 (= e!213707 e!213704)))

(declare-fun res!246137 () Bool)

(assert (=> b!298317 (= res!246137 call!5291)))

(assert (=> b!298317 (=> (not res!246137) (not e!213704))))

(declare-fun b!298318 () Bool)

(declare-fun e!213705 () Bool)

(assert (=> b!298318 (= e!213705 (byteRangesEq!0 (select (arr!8829 arr!273) (_4!470 lt!434415)) (select (arr!8829 arr!273) (_4!470 lt!434415)) #b00000000000000000000000000000000 lt!434413))))

(declare-fun b!298319 () Bool)

(assert (=> b!298319 (= e!213703 e!213706)))

(declare-fun res!246136 () Bool)

(assert (=> b!298319 (=> (not res!246136) (not e!213706))))

(assert (=> b!298319 (= res!246136 e!213708)))

(declare-fun res!246138 () Bool)

(assert (=> b!298319 (=> res!246138 e!213708)))

(assert (=> b!298319 (= res!246138 (bvsge (_1!13123 lt!434415) (_2!13123 lt!434415)))))

(assert (=> b!298319 (= lt!434413 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298319 (= lt!434414 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298319 (= lt!434415 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!298320 () Bool)

(declare-fun res!246139 () Bool)

(assert (=> b!298320 (= res!246139 (= lt!434413 #b00000000000000000000000000000000))))

(assert (=> b!298320 (=> res!246139 e!213705)))

(assert (=> b!298320 (= e!213704 e!213705)))

(assert (= (and d!100412 (not res!246140)) b!298319))

(assert (= (and b!298319 (not res!246138)) b!298314))

(assert (= (and b!298319 res!246136) b!298316))

(assert (= (and b!298316 c!13671) b!298315))

(assert (= (and b!298316 (not c!13671)) b!298317))

(assert (= (and b!298317 res!246137) b!298320))

(assert (= (and b!298320 (not res!246139)) b!298318))

(assert (= (or b!298315 b!298317) bm!5288))

(declare-fun m!437265 () Bool)

(assert (=> b!298314 m!437265))

(declare-fun m!437267 () Bool)

(assert (=> bm!5288 m!437267))

(assert (=> bm!5288 m!437267))

(assert (=> bm!5288 m!437267))

(assert (=> bm!5288 m!437267))

(declare-fun m!437269 () Bool)

(assert (=> bm!5288 m!437269))

(declare-fun m!437271 () Bool)

(assert (=> b!298318 m!437271))

(assert (=> b!298318 m!437271))

(assert (=> b!298318 m!437271))

(assert (=> b!298318 m!437271))

(declare-fun m!437273 () Bool)

(assert (=> b!298318 m!437273))

(declare-fun m!437275 () Bool)

(assert (=> b!298319 m!437275))

(assert (=> b!298190 d!100412))

(declare-fun d!100414 () Bool)

(declare-fun c!13674 () Bool)

(assert (=> d!100414 (= c!13674 (= (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!213711 () List!1001)

(assert (=> d!100414 (= (byteArrayBitContentToList!0 thiss!1728 arr!273 from!505 (bvsub to!474 from!505)) e!213711)))

(declare-fun b!298325 () Bool)

(assert (=> b!298325 (= e!213711 Nil!998)))

(declare-fun b!298326 () Bool)

(assert (=> b!298326 (= e!213711 (Cons!997 (not (= (bvand ((_ sign_extend 24) (select (arr!8829 arr!273) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 thiss!1728 arr!273 (bvadd from!505 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!100414 c!13674) b!298325))

(assert (= (and d!100414 (not c!13674)) b!298326))

(declare-fun m!437277 () Bool)

(assert (=> b!298326 m!437277))

(declare-fun m!437279 () Bool)

(assert (=> b!298326 m!437279))

(declare-fun m!437281 () Bool)

(assert (=> b!298326 m!437281))

(assert (=> b!298190 d!100414))

(declare-fun d!100416 () Bool)

(assert (=> d!100416 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!434418 () Unit!20819)

(declare-fun choose!4 (array!17880 array!17880 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20819)

(assert (=> d!100416 (= lt!434418 (choose!4 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434336 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100416 (bvsle (size!7749 arr!273) (size!7749 arr!273))))

(assert (=> d!100416 (= (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434336 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) lt!434418)))

(declare-fun bs!25697 () Bool)

(assert (= bs!25697 d!100416))

(assert (=> bs!25697 m!437137))

(declare-fun m!437283 () Bool)

(assert (=> bs!25697 m!437283))

(assert (=> b!298190 d!100416))

(declare-fun b!298335 () Bool)

(declare-datatypes ((tuple2!23392 0))(
  ( (tuple2!23393 (_1!13124 List!1001) (_2!13124 BitStream!13502)) )
))
(declare-fun e!213716 () tuple2!23392)

(assert (=> b!298335 (= e!213716 (tuple2!23393 Nil!998 thiss!1728))))

(declare-fun d!100418 () Bool)

(declare-fun e!213717 () Bool)

(assert (=> d!100418 e!213717))

(declare-fun c!13679 () Bool)

(assert (=> d!100418 (= c!13679 (= (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!434425 () List!1001)

(assert (=> d!100418 (= lt!434425 (_1!13124 e!213716))))

(declare-fun c!13680 () Bool)

(assert (=> d!100418 (= c!13680 (= (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!100418 (bvsge (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!100418 (= (bitStreamReadBitsIntoList!0 thiss!1728 thiss!1728 (bvsub to!474 from!505)) lt!434425)))

(declare-fun b!298338 () Bool)

(declare-fun length!498 (List!1001) Int)

(assert (=> b!298338 (= e!213717 (> (length!498 lt!434425) 0))))

(declare-datatypes ((tuple2!23394 0))(
  ( (tuple2!23395 (_1!13125 Bool) (_2!13125 BitStream!13502)) )
))
(declare-fun lt!434426 () tuple2!23394)

(declare-fun b!298336 () Bool)

(declare-fun lt!434427 () (_ BitVec 64))

(assert (=> b!298336 (= e!213716 (tuple2!23393 (Cons!997 (_1!13125 lt!434426) (bitStreamReadBitsIntoList!0 thiss!1728 (_2!13125 lt!434426) (bvsub (bvsub to!474 from!505) lt!434427))) (_2!13125 lt!434426)))))

(declare-fun readBit!0 (BitStream!13502) tuple2!23394)

(assert (=> b!298336 (= lt!434426 (readBit!0 thiss!1728))))

(assert (=> b!298336 (= lt!434427 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!298337 () Bool)

(declare-fun isEmpty!273 (List!1001) Bool)

(assert (=> b!298337 (= e!213717 (isEmpty!273 lt!434425))))

(assert (= (and d!100418 c!13680) b!298335))

(assert (= (and d!100418 (not c!13680)) b!298336))

(assert (= (and d!100418 c!13679) b!298337))

(assert (= (and d!100418 (not c!13679)) b!298338))

(declare-fun m!437285 () Bool)

(assert (=> b!298338 m!437285))

(declare-fun m!437287 () Bool)

(assert (=> b!298336 m!437287))

(declare-fun m!437289 () Bool)

(assert (=> b!298336 m!437289))

(declare-fun m!437291 () Bool)

(assert (=> b!298337 m!437291))

(assert (=> b!298190 d!100418))

(push 1)

(assert (not b!298318))

(assert (not b!298338))

(assert (not bm!5288))

(assert (not b!298314))

(assert (not b!298309))

(assert (not d!100384))

(assert (not d!100416))

(assert (not d!100378))

(assert (not b!298308))

(assert (not b!298326))

(assert (not b!298337))

(assert (not b!298319))

(assert (not b!298304))

(assert (not b!298313))

(assert (not bm!5287))

(assert (not b!298336))

(assert (not d!100410))

(check-sat)

(pop 1)

(push 1)

(check-sat)

