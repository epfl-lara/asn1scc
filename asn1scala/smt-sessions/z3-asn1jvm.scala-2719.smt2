; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66558 () Bool)

(assert start!66558)

(declare-fun b!298179 () Bool)

(declare-fun e!213595 () Bool)

(declare-datatypes ((array!17878 0))(
  ( (array!17879 (arr!8828 (Array (_ BitVec 32) (_ BitVec 8))) (size!7748 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13500 0))(
  ( (BitStream!13501 (buf!7811 array!17878) (currentByte!14371 (_ BitVec 32)) (currentBit!14366 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13500)

(declare-fun array_inv!7360 (array!17878) Bool)

(assert (=> b!298179 (= e!213595 (array_inv!7360 (buf!7811 thiss!1728)))))

(declare-fun res!246062 () Bool)

(declare-fun e!213597 () Bool)

(assert (=> start!66558 (=> (not res!246062) (not e!213597))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17878)

(declare-fun from!505 () (_ BitVec 64))

(assert (=> start!66558 (= res!246062 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7748 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66558 e!213597))

(declare-fun inv!12 (BitStream!13500) Bool)

(assert (=> start!66558 (and (inv!12 thiss!1728) e!213595)))

(assert (=> start!66558 true))

(assert (=> start!66558 (array_inv!7360 arr!273)))

(declare-fun b!298178 () Bool)

(declare-datatypes ((List!1000 0))(
  ( (Nil!997) (Cons!996 (h!1115 Bool) (t!1885 List!1000)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13500 array!17878 (_ BitVec 64) (_ BitVec 64)) List!1000)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13500 BitStream!13500 (_ BitVec 64)) List!1000)

(assert (=> b!298178 (= e!213597 (not (= (byteArrayBitContentToList!0 thiss!1728 arr!273 from!505 (bvsub to!474 from!505)) (bitStreamReadBitsIntoList!0 thiss!1728 thiss!1728 (bvsub to!474 from!505)))))))

(declare-fun arrayBitRangesEq!0 (array!17878 array!17878 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298178 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!434326 () (_ BitVec 64))

(declare-datatypes ((Unit!20817 0))(
  ( (Unit!20818) )
))
(declare-fun lt!434327 () Unit!20817)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17878 array!17878 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20817)

(assert (=> b!298178 (= lt!434327 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434326 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!298178 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434326)))

(assert (=> b!298178 (= lt!434326 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7748 arr!273))))))

(declare-fun lt!434328 () Unit!20817)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17878) Unit!20817)

(assert (=> b!298178 (= lt!434328 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!298176 () Bool)

(declare-fun res!246060 () Bool)

(assert (=> b!298176 (=> (not res!246060) (not e!213597))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298176 (= res!246060 (validate_offset_bits!1 ((_ sign_extend 32) (size!7748 (buf!7811 thiss!1728))) ((_ sign_extend 32) (currentByte!14371 thiss!1728)) ((_ sign_extend 32) (currentBit!14366 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!298177 () Bool)

(declare-fun res!246061 () Bool)

(assert (=> b!298177 (=> (not res!246061) (not e!213597))))

(assert (=> b!298177 (= res!246061 (bvsge from!505 to!474))))

(assert (= (and start!66558 res!246062) b!298176))

(assert (= (and b!298176 res!246060) b!298177))

(assert (= (and b!298177 res!246061) b!298178))

(assert (= start!66558 b!298179))

(declare-fun m!437109 () Bool)

(assert (=> b!298179 m!437109))

(declare-fun m!437111 () Bool)

(assert (=> start!66558 m!437111))

(declare-fun m!437113 () Bool)

(assert (=> start!66558 m!437113))

(declare-fun m!437115 () Bool)

(assert (=> b!298178 m!437115))

(declare-fun m!437117 () Bool)

(assert (=> b!298178 m!437117))

(declare-fun m!437119 () Bool)

(assert (=> b!298178 m!437119))

(declare-fun m!437121 () Bool)

(assert (=> b!298178 m!437121))

(declare-fun m!437123 () Bool)

(assert (=> b!298178 m!437123))

(declare-fun m!437125 () Bool)

(assert (=> b!298178 m!437125))

(declare-fun m!437127 () Bool)

(assert (=> b!298176 m!437127))

(check-sat (not b!298176) (not b!298178) (not start!66558) (not b!298179))
(check-sat)
(get-model)

(declare-fun d!100360 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!100360 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7748 (buf!7811 thiss!1728))) ((_ sign_extend 32) (currentByte!14371 thiss!1728)) ((_ sign_extend 32) (currentBit!14366 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7748 (buf!7811 thiss!1728))) ((_ sign_extend 32) (currentByte!14371 thiss!1728)) ((_ sign_extend 32) (currentBit!14366 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25689 () Bool)

(assert (= bs!25689 d!100360))

(declare-fun m!437149 () Bool)

(assert (=> bs!25689 m!437149))

(assert (=> b!298176 d!100360))

(declare-fun d!100362 () Bool)

(declare-fun e!213612 () Bool)

(assert (=> d!100362 e!213612))

(declare-fun res!246074 () Bool)

(assert (=> d!100362 (=> (not res!246074) (not e!213612))))

(declare-fun lt!434343 () (_ BitVec 64))

(assert (=> d!100362 (= res!246074 (or (= lt!434343 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!434343 #b0000000000000000000000000000000000000000000000000000000000001000) lt!434343))))))

(assert (=> d!100362 (= lt!434343 ((_ sign_extend 32) (size!7748 arr!273)))))

(declare-fun lt!434342 () Unit!20817)

(declare-fun choose!59 (array!17878) Unit!20817)

(assert (=> d!100362 (= lt!434342 (choose!59 arr!273))))

(assert (=> d!100362 (= (arrayBitRangesEqReflexiveLemma!0 arr!273) lt!434342)))

(declare-fun b!298194 () Bool)

(assert (=> b!298194 (= e!213612 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!7748 arr!273)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!100362 res!246074) b!298194))

(declare-fun m!437151 () Bool)

(assert (=> d!100362 m!437151))

(declare-fun m!437153 () Bool)

(assert (=> b!298194 m!437153))

(assert (=> b!298178 d!100362))

(declare-fun b!298223 () Bool)

(declare-fun e!213637 () Bool)

(declare-fun call!5284 () Bool)

(assert (=> b!298223 (= e!213637 call!5284)))

(declare-fun d!100364 () Bool)

(declare-fun res!246096 () Bool)

(declare-fun e!213642 () Bool)

(assert (=> d!100364 (=> res!246096 e!213642)))

(assert (=> d!100364 (= res!246096 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100364 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!213642)))

(declare-fun b!298224 () Bool)

(declare-fun e!213640 () Bool)

(declare-fun e!213639 () Bool)

(assert (=> b!298224 (= e!213640 e!213639)))

(declare-fun res!246098 () Bool)

(declare-fun lt!434358 () (_ BitVec 32))

(declare-datatypes ((tuple4!936 0))(
  ( (tuple4!937 (_1!13117 (_ BitVec 32)) (_2!13117 (_ BitVec 32)) (_3!1425 (_ BitVec 32)) (_4!468 (_ BitVec 32))) )
))
(declare-fun lt!434356 () tuple4!936)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!298224 (= res!246098 (byteRangesEq!0 (select (arr!8828 arr!273) (_3!1425 lt!434356)) (select (arr!8828 arr!273) (_3!1425 lt!434356)) lt!434358 #b00000000000000000000000000001000))))

(assert (=> b!298224 (=> (not res!246098) (not e!213639))))

(declare-fun b!298225 () Bool)

(assert (=> b!298225 (= e!213640 call!5284)))

(declare-fun b!298226 () Bool)

(declare-fun e!213641 () Bool)

(assert (=> b!298226 (= e!213641 e!213640)))

(declare-fun c!13646 () Bool)

(assert (=> b!298226 (= c!13646 (= (_3!1425 lt!434356) (_4!468 lt!434356)))))

(declare-fun b!298227 () Bool)

(declare-fun res!246097 () Bool)

(declare-fun lt!434357 () (_ BitVec 32))

(assert (=> b!298227 (= res!246097 (= lt!434357 #b00000000000000000000000000000000))))

(assert (=> b!298227 (=> res!246097 e!213637)))

(assert (=> b!298227 (= e!213639 e!213637)))

(declare-fun bm!5281 () Bool)

(assert (=> bm!5281 (= call!5284 (byteRangesEq!0 (ite c!13646 (select (arr!8828 arr!273) (_3!1425 lt!434356)) (select (arr!8828 arr!273) (_4!468 lt!434356))) (ite c!13646 (select (arr!8828 arr!273) (_3!1425 lt!434356)) (select (arr!8828 arr!273) (_4!468 lt!434356))) (ite c!13646 lt!434358 #b00000000000000000000000000000000) lt!434357))))

(declare-fun b!298228 () Bool)

(declare-fun e!213638 () Bool)

(declare-fun arrayRangesEq!1526 (array!17878 array!17878 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!298228 (= e!213638 (arrayRangesEq!1526 arr!273 arr!273 (_1!13117 lt!434356) (_2!13117 lt!434356)))))

(declare-fun b!298229 () Bool)

(assert (=> b!298229 (= e!213642 e!213641)))

(declare-fun res!246095 () Bool)

(assert (=> b!298229 (=> (not res!246095) (not e!213641))))

(assert (=> b!298229 (= res!246095 e!213638)))

(declare-fun res!246099 () Bool)

(assert (=> b!298229 (=> res!246099 e!213638)))

(assert (=> b!298229 (= res!246099 (bvsge (_1!13117 lt!434356) (_2!13117 lt!434356)))))

(assert (=> b!298229 (= lt!434357 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298229 (= lt!434358 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!936)

(assert (=> b!298229 (= lt!434356 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!100364 (not res!246096)) b!298229))

(assert (= (and b!298229 (not res!246099)) b!298228))

(assert (= (and b!298229 res!246095) b!298226))

(assert (= (and b!298226 c!13646) b!298225))

(assert (= (and b!298226 (not c!13646)) b!298224))

(assert (= (and b!298224 res!246098) b!298227))

(assert (= (and b!298227 (not res!246097)) b!298223))

(assert (= (or b!298225 b!298223) bm!5281))

(declare-fun m!437157 () Bool)

(assert (=> b!298224 m!437157))

(assert (=> b!298224 m!437157))

(assert (=> b!298224 m!437157))

(assert (=> b!298224 m!437157))

(declare-fun m!437159 () Bool)

(assert (=> b!298224 m!437159))

(declare-fun m!437161 () Bool)

(assert (=> bm!5281 m!437161))

(declare-fun m!437163 () Bool)

(assert (=> bm!5281 m!437163))

(assert (=> bm!5281 m!437157))

(assert (=> bm!5281 m!437161))

(assert (=> bm!5281 m!437157))

(declare-fun m!437165 () Bool)

(assert (=> b!298228 m!437165))

(declare-fun m!437167 () Bool)

(assert (=> b!298229 m!437167))

(assert (=> b!298178 d!100364))

(declare-fun d!100370 () Bool)

(declare-fun c!13650 () Bool)

(assert (=> d!100370 (= c!13650 (= (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!213653 () List!1000)

(assert (=> d!100370 (= (byteArrayBitContentToList!0 thiss!1728 arr!273 from!505 (bvsub to!474 from!505)) e!213653)))

(declare-fun b!298243 () Bool)

(assert (=> b!298243 (= e!213653 Nil!997)))

(declare-fun b!298244 () Bool)

(assert (=> b!298244 (= e!213653 (Cons!996 (not (= (bvand ((_ sign_extend 24) (select (arr!8828 arr!273) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 thiss!1728 arr!273 (bvadd from!505 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!100370 c!13650) b!298243))

(assert (= (and d!100370 (not c!13650)) b!298244))

(declare-fun m!437183 () Bool)

(assert (=> b!298244 m!437183))

(declare-fun m!437187 () Bool)

(assert (=> b!298244 m!437187))

(declare-fun m!437189 () Bool)

(assert (=> b!298244 m!437189))

(assert (=> b!298178 d!100370))

(declare-fun b!298270 () Bool)

(declare-fun e!213669 () Bool)

(declare-fun lt!434378 () List!1000)

(declare-fun length!496 (List!1000) Int)

(assert (=> b!298270 (= e!213669 (> (length!496 lt!434378) 0))))

(declare-datatypes ((tuple2!23384 0))(
  ( (tuple2!23385 (_1!13119 Bool) (_2!13119 BitStream!13500)) )
))
(declare-fun lt!434377 () tuple2!23384)

(declare-fun b!298268 () Bool)

(declare-fun lt!434379 () (_ BitVec 64))

(declare-datatypes ((tuple2!23386 0))(
  ( (tuple2!23387 (_1!13120 List!1000) (_2!13120 BitStream!13500)) )
))
(declare-fun e!213668 () tuple2!23386)

(assert (=> b!298268 (= e!213668 (tuple2!23387 (Cons!996 (_1!13119 lt!434377) (bitStreamReadBitsIntoList!0 thiss!1728 (_2!13119 lt!434377) (bvsub (bvsub to!474 from!505) lt!434379))) (_2!13119 lt!434377)))))

(declare-fun readBit!0 (BitStream!13500) tuple2!23384)

(assert (=> b!298268 (= lt!434377 (readBit!0 thiss!1728))))

(assert (=> b!298268 (= lt!434379 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!100376 () Bool)

(assert (=> d!100376 e!213669))

(declare-fun c!13660 () Bool)

(assert (=> d!100376 (= c!13660 (= (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!100376 (= lt!434378 (_1!13120 e!213668))))

(declare-fun c!13659 () Bool)

(assert (=> d!100376 (= c!13659 (= (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!100376 (bvsge (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!100376 (= (bitStreamReadBitsIntoList!0 thiss!1728 thiss!1728 (bvsub to!474 from!505)) lt!434378)))

(declare-fun b!298269 () Bool)

(declare-fun isEmpty!271 (List!1000) Bool)

(assert (=> b!298269 (= e!213669 (isEmpty!271 lt!434378))))

(declare-fun b!298267 () Bool)

(assert (=> b!298267 (= e!213668 (tuple2!23387 Nil!997 thiss!1728))))

(assert (= (and d!100376 c!13659) b!298267))

(assert (= (and d!100376 (not c!13659)) b!298268))

(assert (= (and d!100376 c!13660) b!298269))

(assert (= (and d!100376 (not c!13660)) b!298270))

(declare-fun m!437213 () Bool)

(assert (=> b!298270 m!437213))

(declare-fun m!437215 () Bool)

(assert (=> b!298268 m!437215))

(declare-fun m!437217 () Bool)

(assert (=> b!298268 m!437217))

(declare-fun m!437219 () Bool)

(assert (=> b!298269 m!437219))

(assert (=> b!298178 d!100376))

(declare-fun b!298271 () Bool)

(declare-fun e!213670 () Bool)

(declare-fun call!5287 () Bool)

(assert (=> b!298271 (= e!213670 call!5287)))

(declare-fun d!100392 () Bool)

(declare-fun res!246114 () Bool)

(declare-fun e!213675 () Bool)

(assert (=> d!100392 (=> res!246114 e!213675)))

(assert (=> d!100392 (= res!246114 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!434326))))

(assert (=> d!100392 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434326) e!213675)))

(declare-fun b!298272 () Bool)

(declare-fun e!213673 () Bool)

(declare-fun e!213672 () Bool)

(assert (=> b!298272 (= e!213673 e!213672)))

(declare-fun lt!434382 () (_ BitVec 32))

(declare-fun lt!434380 () tuple4!936)

(declare-fun res!246116 () Bool)

(assert (=> b!298272 (= res!246116 (byteRangesEq!0 (select (arr!8828 arr!273) (_3!1425 lt!434380)) (select (arr!8828 arr!273) (_3!1425 lt!434380)) lt!434382 #b00000000000000000000000000001000))))

(assert (=> b!298272 (=> (not res!246116) (not e!213672))))

(declare-fun b!298273 () Bool)

(assert (=> b!298273 (= e!213673 call!5287)))

(declare-fun b!298274 () Bool)

(declare-fun e!213674 () Bool)

(assert (=> b!298274 (= e!213674 e!213673)))

(declare-fun c!13661 () Bool)

(assert (=> b!298274 (= c!13661 (= (_3!1425 lt!434380) (_4!468 lt!434380)))))

(declare-fun b!298275 () Bool)

(declare-fun res!246115 () Bool)

(declare-fun lt!434381 () (_ BitVec 32))

(assert (=> b!298275 (= res!246115 (= lt!434381 #b00000000000000000000000000000000))))

(assert (=> b!298275 (=> res!246115 e!213670)))

(assert (=> b!298275 (= e!213672 e!213670)))

(declare-fun bm!5284 () Bool)

(assert (=> bm!5284 (= call!5287 (byteRangesEq!0 (ite c!13661 (select (arr!8828 arr!273) (_3!1425 lt!434380)) (select (arr!8828 arr!273) (_4!468 lt!434380))) (ite c!13661 (select (arr!8828 arr!273) (_3!1425 lt!434380)) (select (arr!8828 arr!273) (_4!468 lt!434380))) (ite c!13661 lt!434382 #b00000000000000000000000000000000) lt!434381))))

(declare-fun b!298276 () Bool)

(declare-fun e!213671 () Bool)

(assert (=> b!298276 (= e!213671 (arrayRangesEq!1526 arr!273 arr!273 (_1!13117 lt!434380) (_2!13117 lt!434380)))))

(declare-fun b!298277 () Bool)

(assert (=> b!298277 (= e!213675 e!213674)))

(declare-fun res!246113 () Bool)

(assert (=> b!298277 (=> (not res!246113) (not e!213674))))

(assert (=> b!298277 (= res!246113 e!213671)))

(declare-fun res!246117 () Bool)

(assert (=> b!298277 (=> res!246117 e!213671)))

(assert (=> b!298277 (= res!246117 (bvsge (_1!13117 lt!434380) (_2!13117 lt!434380)))))

(assert (=> b!298277 (= lt!434381 ((_ extract 31 0) (bvsrem lt!434326 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298277 (= lt!434382 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298277 (= lt!434380 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434326))))

(assert (= (and d!100392 (not res!246114)) b!298277))

(assert (= (and b!298277 (not res!246117)) b!298276))

(assert (= (and b!298277 res!246113) b!298274))

(assert (= (and b!298274 c!13661) b!298273))

(assert (= (and b!298274 (not c!13661)) b!298272))

(assert (= (and b!298272 res!246116) b!298275))

(assert (= (and b!298275 (not res!246115)) b!298271))

(assert (= (or b!298273 b!298271) bm!5284))

(declare-fun m!437221 () Bool)

(assert (=> b!298272 m!437221))

(assert (=> b!298272 m!437221))

(assert (=> b!298272 m!437221))

(assert (=> b!298272 m!437221))

(declare-fun m!437223 () Bool)

(assert (=> b!298272 m!437223))

(declare-fun m!437225 () Bool)

(assert (=> bm!5284 m!437225))

(declare-fun m!437227 () Bool)

(assert (=> bm!5284 m!437227))

(assert (=> bm!5284 m!437221))

(assert (=> bm!5284 m!437225))

(assert (=> bm!5284 m!437221))

(declare-fun m!437229 () Bool)

(assert (=> b!298276 m!437229))

(declare-fun m!437231 () Bool)

(assert (=> b!298277 m!437231))

(assert (=> b!298178 d!100392))

(declare-fun d!100394 () Bool)

(assert (=> d!100394 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!434385 () Unit!20817)

(declare-fun choose!4 (array!17878 array!17878 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20817)

(assert (=> d!100394 (= lt!434385 (choose!4 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434326 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100394 (bvsle (size!7748 arr!273) (size!7748 arr!273))))

(assert (=> d!100394 (= (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434326 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) lt!434385)))

(declare-fun bs!25693 () Bool)

(assert (= bs!25693 d!100394))

(assert (=> bs!25693 m!437119))

(declare-fun m!437233 () Bool)

(assert (=> bs!25693 m!437233))

(assert (=> b!298178 d!100394))

(declare-fun d!100396 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!100396 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14366 thiss!1728) (currentByte!14371 thiss!1728) (size!7748 (buf!7811 thiss!1728))))))

(declare-fun bs!25694 () Bool)

(assert (= bs!25694 d!100396))

(declare-fun m!437235 () Bool)

(assert (=> bs!25694 m!437235))

(assert (=> start!66558 d!100396))

(declare-fun d!100398 () Bool)

(assert (=> d!100398 (= (array_inv!7360 arr!273) (bvsge (size!7748 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!66558 d!100398))

(declare-fun d!100400 () Bool)

(assert (=> d!100400 (= (array_inv!7360 (buf!7811 thiss!1728)) (bvsge (size!7748 (buf!7811 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!298179 d!100400))

(check-sat (not b!298276) (not d!100360) (not b!298229) (not b!298269) (not b!298194) (not b!298224) (not d!100362) (not b!298228) (not bm!5281) (not d!100396) (not b!298272) (not d!100394) (not bm!5284) (not b!298277) (not b!298244) (not b!298270) (not b!298268))
(check-sat)
