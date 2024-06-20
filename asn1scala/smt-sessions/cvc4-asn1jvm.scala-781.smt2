; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22390 () Bool)

(assert start!22390)

(declare-fun b!113275 () Bool)

(declare-fun e!74334 () Bool)

(declare-fun e!74336 () Bool)

(assert (=> b!113275 (= e!74334 e!74336)))

(declare-fun res!93549 () Bool)

(assert (=> b!113275 (=> (not res!93549) (not e!74336))))

(declare-datatypes ((array!5154 0))(
  ( (array!5155 (arr!2936 (Array (_ BitVec 32) (_ BitVec 8))) (size!2343 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4160 0))(
  ( (BitStream!4161 (buf!2751 array!5154) (currentByte!5331 (_ BitVec 32)) (currentBit!5326 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6953 0))(
  ( (Unit!6954) )
))
(declare-datatypes ((tuple2!9332 0))(
  ( (tuple2!9333 (_1!4928 Unit!6953) (_2!4928 BitStream!4160)) )
))
(declare-fun lt!172014 () tuple2!9332)

(declare-fun lt!172017 () Bool)

(declare-datatypes ((tuple2!9334 0))(
  ( (tuple2!9335 (_1!4929 BitStream!4160) (_2!4929 Bool)) )
))
(declare-fun lt!172019 () tuple2!9334)

(assert (=> b!113275 (= res!93549 (and (= (_2!4929 lt!172019) lt!172017) (= (_1!4929 lt!172019) (_2!4928 lt!172014))))))

(declare-fun thiss!1305 () BitStream!4160)

(declare-fun readBitPure!0 (BitStream!4160) tuple2!9334)

(declare-fun readerFrom!0 (BitStream!4160 (_ BitVec 32) (_ BitVec 32)) BitStream!4160)

(assert (=> b!113275 (= lt!172019 (readBitPure!0 (readerFrom!0 (_2!4928 lt!172014) (currentBit!5326 thiss!1305) (currentByte!5331 thiss!1305))))))

(declare-fun b!113276 () Bool)

(declare-fun e!74333 () Bool)

(declare-fun array_inv!2145 (array!5154) Bool)

(assert (=> b!113276 (= e!74333 (array_inv!2145 (buf!2751 thiss!1305)))))

(declare-fun b!113277 () Bool)

(declare-fun res!93550 () Bool)

(declare-fun e!74331 () Bool)

(assert (=> b!113277 (=> (not res!93550) (not e!74331))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113277 (= res!93550 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!113278 () Bool)

(declare-fun res!93548 () Bool)

(assert (=> b!113278 (=> (not res!93548) (not e!74331))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113278 (= res!93548 (validate_offset_bits!1 ((_ sign_extend 32) (size!2343 (buf!2751 thiss!1305))) ((_ sign_extend 32) (currentByte!5331 thiss!1305)) ((_ sign_extend 32) (currentBit!5326 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!113279 () Bool)

(declare-fun e!74335 () Bool)

(declare-fun lt!172015 () tuple2!9332)

(declare-fun isPrefixOf!0 (BitStream!4160 BitStream!4160) Bool)

(assert (=> b!113279 (= e!74335 (isPrefixOf!0 (_2!4928 lt!172014) (_2!4928 lt!172015)))))

(declare-fun b!113280 () Bool)

(declare-fun res!93546 () Bool)

(assert (=> b!113280 (=> (not res!93546) (not e!74331))))

(assert (=> b!113280 (= res!93546 (bvslt i!615 nBits!396))))

(declare-fun b!113281 () Bool)

(declare-fun res!93553 () Bool)

(assert (=> b!113281 (=> (not res!93553) (not e!74334))))

(assert (=> b!113281 (= res!93553 (isPrefixOf!0 thiss!1305 (_2!4928 lt!172014)))))

(declare-fun res!93547 () Bool)

(assert (=> start!22390 (=> (not res!93547) (not e!74331))))

(assert (=> start!22390 (= res!93547 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22390 e!74331))

(assert (=> start!22390 true))

(declare-fun inv!12 (BitStream!4160) Bool)

(assert (=> start!22390 (and (inv!12 thiss!1305) e!74333)))

(declare-fun b!113282 () Bool)

(declare-fun lt!172018 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113282 (= e!74336 (= (bitIndex!0 (size!2343 (buf!2751 (_1!4929 lt!172019))) (currentByte!5331 (_1!4929 lt!172019)) (currentBit!5326 (_1!4929 lt!172019))) lt!172018))))

(declare-fun b!113283 () Bool)

(declare-fun e!74332 () Bool)

(assert (=> b!113283 (= e!74332 e!74334)))

(declare-fun res!93551 () Bool)

(assert (=> b!113283 (=> (not res!93551) (not e!74334))))

(declare-fun lt!172016 () (_ BitVec 64))

(assert (=> b!113283 (= res!93551 (= lt!172018 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!172016)))))

(assert (=> b!113283 (= lt!172018 (bitIndex!0 (size!2343 (buf!2751 (_2!4928 lt!172014))) (currentByte!5331 (_2!4928 lt!172014)) (currentBit!5326 (_2!4928 lt!172014))))))

(assert (=> b!113283 (= lt!172016 (bitIndex!0 (size!2343 (buf!2751 thiss!1305)) (currentByte!5331 thiss!1305) (currentBit!5326 thiss!1305)))))

(declare-fun b!113284 () Bool)

(assert (=> b!113284 (= e!74331 (not e!74335))))

(declare-fun res!93552 () Bool)

(assert (=> b!113284 (=> res!93552 e!74335)))

(assert (=> b!113284 (= res!93552 (not (isPrefixOf!0 thiss!1305 (_2!4928 lt!172014))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4160 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9332)

(assert (=> b!113284 (= lt!172015 (appendNLeastSignificantBitsLoop!0 (_2!4928 lt!172014) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!113284 e!74332))

(declare-fun res!93554 () Bool)

(assert (=> b!113284 (=> (not res!93554) (not e!74332))))

(assert (=> b!113284 (= res!93554 (= (size!2343 (buf!2751 thiss!1305)) (size!2343 (buf!2751 (_2!4928 lt!172014)))))))

(declare-fun appendBit!0 (BitStream!4160 Bool) tuple2!9332)

(assert (=> b!113284 (= lt!172014 (appendBit!0 thiss!1305 lt!172017))))

(assert (=> b!113284 (= lt!172017 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!22390 res!93547) b!113278))

(assert (= (and b!113278 res!93548) b!113277))

(assert (= (and b!113277 res!93550) b!113280))

(assert (= (and b!113280 res!93546) b!113284))

(assert (= (and b!113284 res!93554) b!113283))

(assert (= (and b!113283 res!93551) b!113281))

(assert (= (and b!113281 res!93553) b!113275))

(assert (= (and b!113275 res!93549) b!113282))

(assert (= (and b!113284 (not res!93552)) b!113279))

(assert (= start!22390 b!113276))

(declare-fun m!169283 () Bool)

(assert (=> b!113281 m!169283))

(declare-fun m!169285 () Bool)

(assert (=> b!113275 m!169285))

(assert (=> b!113275 m!169285))

(declare-fun m!169287 () Bool)

(assert (=> b!113275 m!169287))

(declare-fun m!169289 () Bool)

(assert (=> b!113277 m!169289))

(declare-fun m!169291 () Bool)

(assert (=> b!113283 m!169291))

(declare-fun m!169293 () Bool)

(assert (=> b!113283 m!169293))

(declare-fun m!169295 () Bool)

(assert (=> b!113282 m!169295))

(declare-fun m!169297 () Bool)

(assert (=> b!113276 m!169297))

(declare-fun m!169299 () Bool)

(assert (=> b!113279 m!169299))

(declare-fun m!169301 () Bool)

(assert (=> b!113278 m!169301))

(declare-fun m!169303 () Bool)

(assert (=> start!22390 m!169303))

(assert (=> b!113284 m!169283))

(declare-fun m!169305 () Bool)

(assert (=> b!113284 m!169305))

(declare-fun m!169307 () Bool)

(assert (=> b!113284 m!169307))

(push 1)

(assert (not b!113277))

(assert (not b!113279))

(assert (not b!113275))

(assert (not b!113276))

(assert (not b!113281))

(assert (not start!22390))

(assert (not b!113278))

(assert (not b!113284))

(assert (not b!113283))

(assert (not b!113282))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!36430 () Bool)

(declare-datatypes ((tuple2!9342 0))(
  ( (tuple2!9343 (_1!4933 Bool) (_2!4933 BitStream!4160)) )
))
(declare-fun lt!172073 () tuple2!9342)

(declare-fun readBit!0 (BitStream!4160) tuple2!9342)

(assert (=> d!36430 (= lt!172073 (readBit!0 (readerFrom!0 (_2!4928 lt!172014) (currentBit!5326 thiss!1305) (currentByte!5331 thiss!1305))))))

(assert (=> d!36430 (= (readBitPure!0 (readerFrom!0 (_2!4928 lt!172014) (currentBit!5326 thiss!1305) (currentByte!5331 thiss!1305))) (tuple2!9335 (_2!4933 lt!172073) (_1!4933 lt!172073)))))

(declare-fun bs!8859 () Bool)

(assert (= bs!8859 d!36430))

(assert (=> bs!8859 m!169285))

(declare-fun m!169331 () Bool)

(assert (=> bs!8859 m!169331))

(assert (=> b!113275 d!36430))

(declare-fun d!36432 () Bool)

(declare-fun e!74363 () Bool)

(assert (=> d!36432 e!74363))

(declare-fun res!93596 () Bool)

(assert (=> d!36432 (=> (not res!93596) (not e!74363))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!36432 (= res!93596 (invariant!0 (currentBit!5326 (_2!4928 lt!172014)) (currentByte!5331 (_2!4928 lt!172014)) (size!2343 (buf!2751 (_2!4928 lt!172014)))))))

(assert (=> d!36432 (= (readerFrom!0 (_2!4928 lt!172014) (currentBit!5326 thiss!1305) (currentByte!5331 thiss!1305)) (BitStream!4161 (buf!2751 (_2!4928 lt!172014)) (currentByte!5331 thiss!1305) (currentBit!5326 thiss!1305)))))

(declare-fun b!113324 () Bool)

(assert (=> b!113324 (= e!74363 (invariant!0 (currentBit!5326 thiss!1305) (currentByte!5331 thiss!1305) (size!2343 (buf!2751 (_2!4928 lt!172014)))))))

(assert (= (and d!36432 res!93596) b!113324))

(declare-fun m!169335 () Bool)

(assert (=> d!36432 m!169335))

(declare-fun m!169337 () Bool)

(assert (=> b!113324 m!169337))

(assert (=> b!113275 d!36432))

(declare-fun d!36436 () Bool)

(declare-fun res!93604 () Bool)

(declare-fun e!74368 () Bool)

(assert (=> d!36436 (=> (not res!93604) (not e!74368))))

(assert (=> d!36436 (= res!93604 (= (size!2343 (buf!2751 (_2!4928 lt!172014))) (size!2343 (buf!2751 (_2!4928 lt!172015)))))))

(assert (=> d!36436 (= (isPrefixOf!0 (_2!4928 lt!172014) (_2!4928 lt!172015)) e!74368)))

(declare-fun b!113331 () Bool)

(declare-fun res!93605 () Bool)

(assert (=> b!113331 (=> (not res!93605) (not e!74368))))

(assert (=> b!113331 (= res!93605 (bvsle (bitIndex!0 (size!2343 (buf!2751 (_2!4928 lt!172014))) (currentByte!5331 (_2!4928 lt!172014)) (currentBit!5326 (_2!4928 lt!172014))) (bitIndex!0 (size!2343 (buf!2751 (_2!4928 lt!172015))) (currentByte!5331 (_2!4928 lt!172015)) (currentBit!5326 (_2!4928 lt!172015)))))))

(declare-fun b!113332 () Bool)

(declare-fun e!74369 () Bool)

(assert (=> b!113332 (= e!74368 e!74369)))

(declare-fun res!93603 () Bool)

(assert (=> b!113332 (=> res!93603 e!74369)))

(assert (=> b!113332 (= res!93603 (= (size!2343 (buf!2751 (_2!4928 lt!172014))) #b00000000000000000000000000000000))))

(declare-fun b!113333 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5154 array!5154 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113333 (= e!74369 (arrayBitRangesEq!0 (buf!2751 (_2!4928 lt!172014)) (buf!2751 (_2!4928 lt!172015)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2343 (buf!2751 (_2!4928 lt!172014))) (currentByte!5331 (_2!4928 lt!172014)) (currentBit!5326 (_2!4928 lt!172014)))))))

(assert (= (and d!36436 res!93604) b!113331))

(assert (= (and b!113331 res!93605) b!113332))

(assert (= (and b!113332 (not res!93603)) b!113333))

(assert (=> b!113331 m!169291))

(declare-fun m!169339 () Bool)

(assert (=> b!113331 m!169339))

(assert (=> b!113333 m!169291))

(assert (=> b!113333 m!169291))

(declare-fun m!169341 () Bool)

(assert (=> b!113333 m!169341))

(assert (=> b!113279 d!36436))

(declare-fun d!36438 () Bool)

(declare-fun res!93607 () Bool)

(declare-fun e!74370 () Bool)

(assert (=> d!36438 (=> (not res!93607) (not e!74370))))

(assert (=> d!36438 (= res!93607 (= (size!2343 (buf!2751 thiss!1305)) (size!2343 (buf!2751 (_2!4928 lt!172014)))))))

(assert (=> d!36438 (= (isPrefixOf!0 thiss!1305 (_2!4928 lt!172014)) e!74370)))

(declare-fun b!113334 () Bool)

(declare-fun res!93608 () Bool)

(assert (=> b!113334 (=> (not res!93608) (not e!74370))))

(assert (=> b!113334 (= res!93608 (bvsle (bitIndex!0 (size!2343 (buf!2751 thiss!1305)) (currentByte!5331 thiss!1305) (currentBit!5326 thiss!1305)) (bitIndex!0 (size!2343 (buf!2751 (_2!4928 lt!172014))) (currentByte!5331 (_2!4928 lt!172014)) (currentBit!5326 (_2!4928 lt!172014)))))))

(declare-fun b!113335 () Bool)

(declare-fun e!74371 () Bool)

(assert (=> b!113335 (= e!74370 e!74371)))

(declare-fun res!93606 () Bool)

(assert (=> b!113335 (=> res!93606 e!74371)))

(assert (=> b!113335 (= res!93606 (= (size!2343 (buf!2751 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!113336 () Bool)

(assert (=> b!113336 (= e!74371 (arrayBitRangesEq!0 (buf!2751 thiss!1305) (buf!2751 (_2!4928 lt!172014)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2343 (buf!2751 thiss!1305)) (currentByte!5331 thiss!1305) (currentBit!5326 thiss!1305))))))

(assert (= (and d!36438 res!93607) b!113334))

(assert (= (and b!113334 res!93608) b!113335))

(assert (= (and b!113335 (not res!93606)) b!113336))

(assert (=> b!113334 m!169293))

(assert (=> b!113334 m!169291))

(assert (=> b!113336 m!169293))

(assert (=> b!113336 m!169293))

(declare-fun m!169343 () Bool)

(assert (=> b!113336 m!169343))

(assert (=> b!113284 d!36438))

(declare-fun b!113450 () Bool)

(declare-fun e!74437 () (_ BitVec 64))

(assert (=> b!113450 (= e!74437 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!113451 () Bool)

(declare-fun e!74433 () tuple2!9332)

(declare-fun lt!172481 () Unit!6953)

(assert (=> b!113451 (= e!74433 (tuple2!9333 lt!172481 (_2!4928 lt!172014)))))

(declare-fun lt!172479 () BitStream!4160)

(assert (=> b!113451 (= lt!172479 (_2!4928 lt!172014))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4160) Unit!6953)

(assert (=> b!113451 (= lt!172481 (lemmaIsPrefixRefl!0 lt!172479))))

(declare-fun call!1448 () Bool)

(assert (=> b!113451 call!1448))

(declare-fun b!113452 () Bool)

(declare-fun e!74436 () Bool)

(declare-fun lt!172462 () (_ BitVec 64))

(assert (=> b!113452 (= e!74436 (validate_offset_bits!1 ((_ sign_extend 32) (size!2343 (buf!2751 (_2!4928 lt!172014)))) ((_ sign_extend 32) (currentByte!5331 (_2!4928 lt!172014))) ((_ sign_extend 32) (currentBit!5326 (_2!4928 lt!172014))) lt!172462))))

(declare-fun b!113453 () Bool)

(assert (=> b!113453 (= e!74437 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!113454 () Bool)

(declare-fun res!93691 () Bool)

(declare-fun lt!172460 () tuple2!9332)

(assert (=> b!113454 (= res!93691 (= (bitIndex!0 (size!2343 (buf!2751 (_2!4928 lt!172460))) (currentByte!5331 (_2!4928 lt!172460)) (currentBit!5326 (_2!4928 lt!172460))) (bvadd (bitIndex!0 (size!2343 (buf!2751 (_2!4928 lt!172014))) (currentByte!5331 (_2!4928 lt!172014)) (currentBit!5326 (_2!4928 lt!172014))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!74435 () Bool)

(assert (=> b!113454 (=> (not res!93691) (not e!74435))))

(declare-fun b!113455 () Bool)

(declare-fun e!74434 () Bool)

(declare-fun lt!172483 () tuple2!9334)

(assert (=> b!113455 (= e!74434 (= (bitIndex!0 (size!2343 (buf!2751 (_1!4929 lt!172483))) (currentByte!5331 (_1!4929 lt!172483)) (currentBit!5326 (_1!4929 lt!172483))) (bitIndex!0 (size!2343 (buf!2751 (_2!4928 lt!172460))) (currentByte!5331 (_2!4928 lt!172460)) (currentBit!5326 (_2!4928 lt!172460)))))))

(declare-fun b!113456 () Bool)

(declare-fun res!93695 () Bool)

(declare-fun e!74438 () Bool)

(assert (=> b!113456 (=> (not res!93695) (not e!74438))))

(declare-fun lt!172446 () tuple2!9332)

(declare-fun lt!172474 () (_ BitVec 64))

(declare-fun lt!172442 () (_ BitVec 64))

(assert (=> b!113456 (= res!93695 (= (bitIndex!0 (size!2343 (buf!2751 (_2!4928 lt!172446))) (currentByte!5331 (_2!4928 lt!172446)) (currentBit!5326 (_2!4928 lt!172446))) (bvadd lt!172474 lt!172442)))))

(assert (=> b!113456 (or (not (= (bvand lt!172474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172442 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!172474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!172474 lt!172442) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113456 (= lt!172442 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!113456 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!113456 (= lt!172474 (bitIndex!0 (size!2343 (buf!2751 (_2!4928 lt!172014))) (currentByte!5331 (_2!4928 lt!172014)) (currentBit!5326 (_2!4928 lt!172014))))))

(declare-fun b!113457 () Bool)

(declare-fun lt!172464 () tuple2!9332)

(declare-fun Unit!6967 () Unit!6953)

(assert (=> b!113457 (= e!74433 (tuple2!9333 Unit!6967 (_2!4928 lt!172464)))))

(declare-fun lt!172465 () Bool)

(assert (=> b!113457 (= lt!172465 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113457 (= lt!172460 (appendBit!0 (_2!4928 lt!172014) lt!172465))))

(declare-fun res!93697 () Bool)

(assert (=> b!113457 (= res!93697 (= (size!2343 (buf!2751 (_2!4928 lt!172014))) (size!2343 (buf!2751 (_2!4928 lt!172460)))))))

(assert (=> b!113457 (=> (not res!93697) (not e!74435))))

(assert (=> b!113457 e!74435))

(declare-fun lt!172452 () tuple2!9332)

(assert (=> b!113457 (= lt!172452 lt!172460)))

(assert (=> b!113457 (= lt!172464 (appendNLeastSignificantBitsLoop!0 (_2!4928 lt!172452) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!172472 () Unit!6953)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4160 BitStream!4160 BitStream!4160) Unit!6953)

(assert (=> b!113457 (= lt!172472 (lemmaIsPrefixTransitive!0 (_2!4928 lt!172014) (_2!4928 lt!172452) (_2!4928 lt!172464)))))

(assert (=> b!113457 call!1448))

(declare-fun lt!172470 () Unit!6953)

(assert (=> b!113457 (= lt!172470 lt!172472)))

(assert (=> b!113457 (invariant!0 (currentBit!5326 (_2!4928 lt!172014)) (currentByte!5331 (_2!4928 lt!172014)) (size!2343 (buf!2751 (_2!4928 lt!172452))))))

(declare-fun lt!172458 () BitStream!4160)

(assert (=> b!113457 (= lt!172458 (BitStream!4161 (buf!2751 (_2!4928 lt!172452)) (currentByte!5331 (_2!4928 lt!172014)) (currentBit!5326 (_2!4928 lt!172014))))))

(assert (=> b!113457 (invariant!0 (currentBit!5326 lt!172458) (currentByte!5331 lt!172458) (size!2343 (buf!2751 (_2!4928 lt!172464))))))

(declare-fun lt!172459 () BitStream!4160)

(assert (=> b!113457 (= lt!172459 (BitStream!4161 (buf!2751 (_2!4928 lt!172464)) (currentByte!5331 lt!172458) (currentBit!5326 lt!172458)))))

(declare-fun lt!172466 () tuple2!9334)

(assert (=> b!113457 (= lt!172466 (readBitPure!0 lt!172458))))

(declare-fun lt!172463 () tuple2!9334)

(assert (=> b!113457 (= lt!172463 (readBitPure!0 lt!172459))))

(declare-fun lt!172467 () Unit!6953)

(declare-fun readBitPrefixLemma!0 (BitStream!4160 BitStream!4160) Unit!6953)

(assert (=> b!113457 (= lt!172467 (readBitPrefixLemma!0 lt!172458 (_2!4928 lt!172464)))))

(declare-fun res!93694 () Bool)

(assert (=> b!113457 (= res!93694 (= (bitIndex!0 (size!2343 (buf!2751 (_1!4929 lt!172466))) (currentByte!5331 (_1!4929 lt!172466)) (currentBit!5326 (_1!4929 lt!172466))) (bitIndex!0 (size!2343 (buf!2751 (_1!4929 lt!172463))) (currentByte!5331 (_1!4929 lt!172463)) (currentBit!5326 (_1!4929 lt!172463)))))))

(declare-fun e!74432 () Bool)

(assert (=> b!113457 (=> (not res!93694) (not e!74432))))

(assert (=> b!113457 e!74432))

(declare-fun lt!172480 () Unit!6953)

(assert (=> b!113457 (= lt!172480 lt!172467)))

(declare-datatypes ((tuple2!9348 0))(
  ( (tuple2!9349 (_1!4936 BitStream!4160) (_2!4936 BitStream!4160)) )
))
(declare-fun lt!172471 () tuple2!9348)

(declare-fun reader!0 (BitStream!4160 BitStream!4160) tuple2!9348)

(assert (=> b!113457 (= lt!172471 (reader!0 (_2!4928 lt!172014) (_2!4928 lt!172464)))))

(declare-fun lt!172453 () tuple2!9348)

(assert (=> b!113457 (= lt!172453 (reader!0 (_2!4928 lt!172452) (_2!4928 lt!172464)))))

(declare-fun lt!172486 () tuple2!9334)

(assert (=> b!113457 (= lt!172486 (readBitPure!0 (_1!4936 lt!172471)))))

(assert (=> b!113457 (= (_2!4929 lt!172486) lt!172465)))

(declare-fun lt!172468 () Unit!6953)

(declare-fun Unit!6968 () Unit!6953)

(assert (=> b!113457 (= lt!172468 Unit!6968)))

(declare-fun lt!172461 () (_ BitVec 64))

(assert (=> b!113457 (= lt!172461 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!172469 () (_ BitVec 64))

(assert (=> b!113457 (= lt!172469 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!172478 () Unit!6953)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4160 array!5154 (_ BitVec 64)) Unit!6953)

(assert (=> b!113457 (= lt!172478 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4928 lt!172014) (buf!2751 (_2!4928 lt!172464)) lt!172469))))

(assert (=> b!113457 (validate_offset_bits!1 ((_ sign_extend 32) (size!2343 (buf!2751 (_2!4928 lt!172464)))) ((_ sign_extend 32) (currentByte!5331 (_2!4928 lt!172014))) ((_ sign_extend 32) (currentBit!5326 (_2!4928 lt!172014))) lt!172469)))

(declare-fun lt!172450 () Unit!6953)

(assert (=> b!113457 (= lt!172450 lt!172478)))

(declare-datatypes ((tuple2!9350 0))(
  ( (tuple2!9351 (_1!4937 BitStream!4160) (_2!4937 (_ BitVec 64))) )
))
(declare-fun lt!172448 () tuple2!9350)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9350)

(assert (=> b!113457 (= lt!172448 (readNLeastSignificantBitsLoopPure!0 (_1!4936 lt!172471) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!172461))))

(declare-fun lt!172456 () (_ BitVec 64))

(assert (=> b!113457 (= lt!172456 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!172444 () Unit!6953)

(assert (=> b!113457 (= lt!172444 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4928 lt!172452) (buf!2751 (_2!4928 lt!172464)) lt!172456))))

(assert (=> b!113457 (validate_offset_bits!1 ((_ sign_extend 32) (size!2343 (buf!2751 (_2!4928 lt!172464)))) ((_ sign_extend 32) (currentByte!5331 (_2!4928 lt!172452))) ((_ sign_extend 32) (currentBit!5326 (_2!4928 lt!172452))) lt!172456)))

(declare-fun lt!172473 () Unit!6953)

(assert (=> b!113457 (= lt!172473 lt!172444)))

(declare-fun lt!172451 () tuple2!9350)

(assert (=> b!113457 (= lt!172451 (readNLeastSignificantBitsLoopPure!0 (_1!4936 lt!172453) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!172461 (ite (_2!4929 lt!172486) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!172447 () tuple2!9350)

(assert (=> b!113457 (= lt!172447 (readNLeastSignificantBitsLoopPure!0 (_1!4936 lt!172471) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!172461))))

(declare-fun c!6889 () Bool)

(assert (=> b!113457 (= c!6889 (_2!4929 (readBitPure!0 (_1!4936 lt!172471))))))

(declare-fun lt!172485 () tuple2!9350)

(declare-fun withMovedBitIndex!0 (BitStream!4160 (_ BitVec 64)) BitStream!4160)

(assert (=> b!113457 (= lt!172485 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4936 lt!172471) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!172461 e!74437)))))

(declare-fun lt!172445 () Unit!6953)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6953)

(assert (=> b!113457 (= lt!172445 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4936 lt!172471) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!172461))))

(assert (=> b!113457 (and (= (_2!4937 lt!172447) (_2!4937 lt!172485)) (= (_1!4937 lt!172447) (_1!4937 lt!172485)))))

(declare-fun lt!172443 () Unit!6953)

(assert (=> b!113457 (= lt!172443 lt!172445)))

(assert (=> b!113457 (= (_1!4936 lt!172471) (withMovedBitIndex!0 (_2!4936 lt!172471) (bvsub (bitIndex!0 (size!2343 (buf!2751 (_2!4928 lt!172014))) (currentByte!5331 (_2!4928 lt!172014)) (currentBit!5326 (_2!4928 lt!172014))) (bitIndex!0 (size!2343 (buf!2751 (_2!4928 lt!172464))) (currentByte!5331 (_2!4928 lt!172464)) (currentBit!5326 (_2!4928 lt!172464))))))))

(declare-fun lt!172449 () Unit!6953)

(declare-fun Unit!6969 () Unit!6953)

(assert (=> b!113457 (= lt!172449 Unit!6969)))

(assert (=> b!113457 (= (_1!4936 lt!172453) (withMovedBitIndex!0 (_2!4936 lt!172453) (bvsub (bitIndex!0 (size!2343 (buf!2751 (_2!4928 lt!172452))) (currentByte!5331 (_2!4928 lt!172452)) (currentBit!5326 (_2!4928 lt!172452))) (bitIndex!0 (size!2343 (buf!2751 (_2!4928 lt!172464))) (currentByte!5331 (_2!4928 lt!172464)) (currentBit!5326 (_2!4928 lt!172464))))))))

(declare-fun lt!172454 () Unit!6953)

(declare-fun Unit!6970 () Unit!6953)

(assert (=> b!113457 (= lt!172454 Unit!6970)))

(assert (=> b!113457 (= (bitIndex!0 (size!2343 (buf!2751 (_2!4928 lt!172014))) (currentByte!5331 (_2!4928 lt!172014)) (currentBit!5326 (_2!4928 lt!172014))) (bvsub (bitIndex!0 (size!2343 (buf!2751 (_2!4928 lt!172452))) (currentByte!5331 (_2!4928 lt!172452)) (currentBit!5326 (_2!4928 lt!172452))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!172455 () Unit!6953)

(declare-fun Unit!6971 () Unit!6953)

(assert (=> b!113457 (= lt!172455 Unit!6971)))

(assert (=> b!113457 (= (_2!4937 lt!172448) (_2!4937 lt!172451))))

(declare-fun lt!172484 () Unit!6953)

(declare-fun Unit!6972 () Unit!6953)

(assert (=> b!113457 (= lt!172484 Unit!6972)))

(assert (=> b!113457 (= (_1!4937 lt!172448) (_2!4936 lt!172471))))

(declare-fun b!113458 () Bool)

(assert (=> b!113458 (= lt!172483 (readBitPure!0 (readerFrom!0 (_2!4928 lt!172460) (currentBit!5326 (_2!4928 lt!172014)) (currentByte!5331 (_2!4928 lt!172014)))))))

(declare-fun res!93689 () Bool)

(assert (=> b!113458 (= res!93689 (and (= (_2!4929 lt!172483) lt!172465) (= (_1!4929 lt!172483) (_2!4928 lt!172460))))))

(assert (=> b!113458 (=> (not res!93689) (not e!74434))))

(assert (=> b!113458 (= e!74435 e!74434)))

(declare-fun b!113459 () Bool)

(assert (=> b!113459 (= e!74432 (= (_2!4929 lt!172466) (_2!4929 lt!172463)))))

(declare-fun b!113460 () Bool)

(declare-fun res!93693 () Bool)

(assert (=> b!113460 (=> (not res!93693) (not e!74438))))

(assert (=> b!113460 (= res!93693 (isPrefixOf!0 (_2!4928 lt!172014) (_2!4928 lt!172446)))))

(declare-fun d!36440 () Bool)

(assert (=> d!36440 e!74438))

(declare-fun res!93696 () Bool)

(assert (=> d!36440 (=> (not res!93696) (not e!74438))))

(assert (=> d!36440 (= res!93696 (= (size!2343 (buf!2751 (_2!4928 lt!172014))) (size!2343 (buf!2751 (_2!4928 lt!172446)))))))

(assert (=> d!36440 (= lt!172446 e!74433)))

(declare-fun c!6888 () Bool)

(assert (=> d!36440 (= c!6888 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!36440 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!36440 (= (appendNLeastSignificantBitsLoop!0 (_2!4928 lt!172014) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!172446)))

(declare-fun bm!1445 () Bool)

(assert (=> bm!1445 (= call!1448 (isPrefixOf!0 (ite c!6888 (_2!4928 lt!172014) lt!172479) (ite c!6888 (_2!4928 lt!172464) lt!172479)))))

(declare-fun b!113461 () Bool)

(declare-fun res!93692 () Bool)

(assert (=> b!113461 (= res!93692 (isPrefixOf!0 (_2!4928 lt!172014) (_2!4928 lt!172460)))))

(assert (=> b!113461 (=> (not res!93692) (not e!74435))))

(declare-fun lt!172475 () tuple2!9348)

(declare-fun b!113462 () Bool)

(declare-fun lt!172457 () tuple2!9350)

(assert (=> b!113462 (= e!74438 (and (= (_2!4937 lt!172457) v!199) (= (_1!4937 lt!172457) (_2!4936 lt!172475))))))

(declare-fun lt!172477 () (_ BitVec 64))

(assert (=> b!113462 (= lt!172457 (readNLeastSignificantBitsLoopPure!0 (_1!4936 lt!172475) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!172477))))

(declare-fun lt!172476 () Unit!6953)

(declare-fun lt!172482 () Unit!6953)

(assert (=> b!113462 (= lt!172476 lt!172482)))

(assert (=> b!113462 (validate_offset_bits!1 ((_ sign_extend 32) (size!2343 (buf!2751 (_2!4928 lt!172446)))) ((_ sign_extend 32) (currentByte!5331 (_2!4928 lt!172014))) ((_ sign_extend 32) (currentBit!5326 (_2!4928 lt!172014))) lt!172462)))

(assert (=> b!113462 (= lt!172482 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4928 lt!172014) (buf!2751 (_2!4928 lt!172446)) lt!172462))))

(assert (=> b!113462 e!74436))

(declare-fun res!93690 () Bool)

(assert (=> b!113462 (=> (not res!93690) (not e!74436))))

(assert (=> b!113462 (= res!93690 (and (= (size!2343 (buf!2751 (_2!4928 lt!172014))) (size!2343 (buf!2751 (_2!4928 lt!172446)))) (bvsge lt!172462 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113462 (= lt!172462 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!113462 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!113462 (= lt!172477 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!113462 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!113462 (= lt!172475 (reader!0 (_2!4928 lt!172014) (_2!4928 lt!172446)))))

(assert (= (and d!36440 c!6888) b!113457))

(assert (= (and d!36440 (not c!6888)) b!113451))

(assert (= (and b!113457 res!93697) b!113454))

(assert (= (and b!113454 res!93691) b!113461))

(assert (= (and b!113461 res!93692) b!113458))

(assert (= (and b!113458 res!93689) b!113455))

(assert (= (and b!113457 res!93694) b!113459))

(assert (= (and b!113457 c!6889) b!113450))

(assert (= (and b!113457 (not c!6889)) b!113453))

(assert (= (or b!113457 b!113451) bm!1445))

(assert (= (and d!36440 res!93696) b!113456))

(assert (= (and b!113456 res!93695) b!113460))

(assert (= (and b!113460 res!93693) b!113462))

(assert (= (and b!113462 res!93690) b!113452))

(declare-fun m!169523 () Bool)

(assert (=> b!113451 m!169523))

(declare-fun m!169525 () Bool)

(assert (=> b!113462 m!169525))

(declare-fun m!169527 () Bool)

(assert (=> b!113462 m!169527))

(declare-fun m!169529 () Bool)

(assert (=> b!113462 m!169529))

(declare-fun m!169531 () Bool)

(assert (=> b!113462 m!169531))

(declare-fun m!169533 () Bool)

(assert (=> b!113462 m!169533))

(declare-fun m!169535 () Bool)

(assert (=> b!113455 m!169535))

(declare-fun m!169537 () Bool)

(assert (=> b!113455 m!169537))

(declare-fun m!169541 () Bool)

(assert (=> b!113458 m!169541))

(assert (=> b!113458 m!169541))

(declare-fun m!169543 () Bool)

(assert (=> b!113458 m!169543))

(assert (=> b!113454 m!169537))

(assert (=> b!113454 m!169291))

(declare-fun m!169547 () Bool)

(assert (=> b!113461 m!169547))

(declare-fun m!169549 () Bool)

(assert (=> b!113456 m!169549))

(assert (=> b!113456 m!169291))

(declare-fun m!169551 () Bool)

(assert (=> b!113460 m!169551))

(declare-fun m!169553 () Bool)

(assert (=> b!113457 m!169553))

(declare-fun m!169555 () Bool)

(assert (=> b!113457 m!169555))

(declare-fun m!169557 () Bool)

(assert (=> b!113457 m!169557))

(declare-fun m!169559 () Bool)

(assert (=> b!113457 m!169559))

(declare-fun m!169561 () Bool)

(assert (=> b!113457 m!169561))

(declare-fun m!169563 () Bool)

(assert (=> b!113457 m!169563))

(declare-fun m!169565 () Bool)

(assert (=> b!113457 m!169565))

(declare-fun m!169567 () Bool)

(assert (=> b!113457 m!169567))

(declare-fun m!169569 () Bool)

(assert (=> b!113457 m!169569))

(assert (=> b!113457 m!169291))

(declare-fun m!169571 () Bool)

(assert (=> b!113457 m!169571))

(declare-fun m!169573 () Bool)

(assert (=> b!113457 m!169573))

(declare-fun m!169575 () Bool)

(assert (=> b!113457 m!169575))

(declare-fun m!169577 () Bool)

(assert (=> b!113457 m!169577))

(declare-fun m!169579 () Bool)

(assert (=> b!113457 m!169579))

(declare-fun m!169581 () Bool)

(assert (=> b!113457 m!169581))

(assert (=> b!113457 m!169553))

(declare-fun m!169583 () Bool)

(assert (=> b!113457 m!169583))

(assert (=> b!113457 m!169527))

(declare-fun m!169585 () Bool)

(assert (=> b!113457 m!169585))

(declare-fun m!169587 () Bool)

(assert (=> b!113457 m!169587))

(declare-fun m!169589 () Bool)

(assert (=> b!113457 m!169589))

(declare-fun m!169591 () Bool)

(assert (=> b!113457 m!169591))

(declare-fun m!169593 () Bool)

(assert (=> b!113457 m!169593))

(declare-fun m!169595 () Bool)

(assert (=> b!113457 m!169595))

(declare-fun m!169597 () Bool)

(assert (=> b!113457 m!169597))

(declare-fun m!169599 () Bool)

(assert (=> b!113457 m!169599))

(declare-fun m!169601 () Bool)

(assert (=> b!113457 m!169601))

(declare-fun m!169603 () Bool)

(assert (=> b!113457 m!169603))

(declare-fun m!169605 () Bool)

(assert (=> bm!1445 m!169605))

(declare-fun m!169607 () Bool)

(assert (=> b!113452 m!169607))

(assert (=> b!113284 d!36440))

(declare-fun b!113505 () Bool)

(declare-fun e!74460 () Bool)

(declare-fun lt!172526 () tuple2!9334)

(declare-fun lt!172528 () tuple2!9332)

(assert (=> b!113505 (= e!74460 (= (bitIndex!0 (size!2343 (buf!2751 (_1!4929 lt!172526))) (currentByte!5331 (_1!4929 lt!172526)) (currentBit!5326 (_1!4929 lt!172526))) (bitIndex!0 (size!2343 (buf!2751 (_2!4928 lt!172528))) (currentByte!5331 (_2!4928 lt!172528)) (currentBit!5326 (_2!4928 lt!172528)))))))

(declare-fun d!36448 () Bool)

(declare-fun e!74461 () Bool)

(assert (=> d!36448 e!74461))

(declare-fun res!93739 () Bool)

(assert (=> d!36448 (=> (not res!93739) (not e!74461))))

(assert (=> d!36448 (= res!93739 (= (size!2343 (buf!2751 thiss!1305)) (size!2343 (buf!2751 (_2!4928 lt!172528)))))))

(declare-fun choose!16 (BitStream!4160 Bool) tuple2!9332)

(assert (=> d!36448 (= lt!172528 (choose!16 thiss!1305 lt!172017))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!36448 (validate_offset_bit!0 ((_ sign_extend 32) (size!2343 (buf!2751 thiss!1305))) ((_ sign_extend 32) (currentByte!5331 thiss!1305)) ((_ sign_extend 32) (currentBit!5326 thiss!1305)))))

(assert (=> d!36448 (= (appendBit!0 thiss!1305 lt!172017) lt!172528)))

(declare-fun b!113504 () Bool)

(assert (=> b!113504 (= e!74461 e!74460)))

(declare-fun res!93736 () Bool)

(assert (=> b!113504 (=> (not res!93736) (not e!74460))))

(assert (=> b!113504 (= res!93736 (and (= (_2!4929 lt!172526) lt!172017) (= (_1!4929 lt!172526) (_2!4928 lt!172528))))))

(assert (=> b!113504 (= lt!172526 (readBitPure!0 (readerFrom!0 (_2!4928 lt!172528) (currentBit!5326 thiss!1305) (currentByte!5331 thiss!1305))))))

(declare-fun b!113503 () Bool)

(declare-fun res!93738 () Bool)

(assert (=> b!113503 (=> (not res!93738) (not e!74461))))

(assert (=> b!113503 (= res!93738 (isPrefixOf!0 thiss!1305 (_2!4928 lt!172528)))))

(declare-fun b!113502 () Bool)

(declare-fun res!93737 () Bool)

(assert (=> b!113502 (=> (not res!93737) (not e!74461))))

(declare-fun lt!172529 () (_ BitVec 64))

(declare-fun lt!172527 () (_ BitVec 64))

(assert (=> b!113502 (= res!93737 (= (bitIndex!0 (size!2343 (buf!2751 (_2!4928 lt!172528))) (currentByte!5331 (_2!4928 lt!172528)) (currentBit!5326 (_2!4928 lt!172528))) (bvadd lt!172529 lt!172527)))))

(assert (=> b!113502 (or (not (= (bvand lt!172529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172527 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!172529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!172529 lt!172527) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113502 (= lt!172527 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!113502 (= lt!172529 (bitIndex!0 (size!2343 (buf!2751 thiss!1305)) (currentByte!5331 thiss!1305) (currentBit!5326 thiss!1305)))))

(assert (= (and d!36448 res!93739) b!113502))

(assert (= (and b!113502 res!93737) b!113503))

(assert (= (and b!113503 res!93738) b!113504))

(assert (= (and b!113504 res!93736) b!113505))

(declare-fun m!169639 () Bool)

(assert (=> b!113502 m!169639))

(assert (=> b!113502 m!169293))

(declare-fun m!169641 () Bool)

(assert (=> b!113503 m!169641))

(declare-fun m!169643 () Bool)

(assert (=> b!113504 m!169643))

(assert (=> b!113504 m!169643))

(declare-fun m!169645 () Bool)

(assert (=> b!113504 m!169645))

(declare-fun m!169647 () Bool)

(assert (=> b!113505 m!169647))

(assert (=> b!113505 m!169639))

(declare-fun m!169649 () Bool)

(assert (=> d!36448 m!169649))

(declare-fun m!169651 () Bool)

(assert (=> d!36448 m!169651))

(assert (=> b!113284 d!36448))

(declare-fun d!36468 () Bool)

(assert (=> d!36468 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5326 thiss!1305) (currentByte!5331 thiss!1305) (size!2343 (buf!2751 thiss!1305))))))

(declare-fun bs!8863 () Bool)

(assert (= bs!8863 d!36468))

(declare-fun m!169653 () Bool)

(assert (=> bs!8863 m!169653))

(assert (=> start!22390 d!36468))

(declare-fun d!36470 () Bool)

(declare-fun e!74464 () Bool)

(assert (=> d!36470 e!74464))

(declare-fun res!93744 () Bool)

(assert (=> d!36470 (=> (not res!93744) (not e!74464))))

(declare-fun lt!172542 () (_ BitVec 64))

(declare-fun lt!172547 () (_ BitVec 64))

(declare-fun lt!172545 () (_ BitVec 64))

(assert (=> d!36470 (= res!93744 (= lt!172542 (bvsub lt!172545 lt!172547)))))

(assert (=> d!36470 (or (= (bvand lt!172545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172547 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!172545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!172545 lt!172547) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!36470 (= lt!172547 (remainingBits!0 ((_ sign_extend 32) (size!2343 (buf!2751 (_2!4928 lt!172014)))) ((_ sign_extend 32) (currentByte!5331 (_2!4928 lt!172014))) ((_ sign_extend 32) (currentBit!5326 (_2!4928 lt!172014)))))))

(declare-fun lt!172544 () (_ BitVec 64))

(declare-fun lt!172546 () (_ BitVec 64))

(assert (=> d!36470 (= lt!172545 (bvmul lt!172544 lt!172546))))

(assert (=> d!36470 (or (= lt!172544 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!172546 (bvsdiv (bvmul lt!172544 lt!172546) lt!172544)))))

(assert (=> d!36470 (= lt!172546 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36470 (= lt!172544 ((_ sign_extend 32) (size!2343 (buf!2751 (_2!4928 lt!172014)))))))

(assert (=> d!36470 (= lt!172542 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5331 (_2!4928 lt!172014))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5326 (_2!4928 lt!172014)))))))

(assert (=> d!36470 (invariant!0 (currentBit!5326 (_2!4928 lt!172014)) (currentByte!5331 (_2!4928 lt!172014)) (size!2343 (buf!2751 (_2!4928 lt!172014))))))

(assert (=> d!36470 (= (bitIndex!0 (size!2343 (buf!2751 (_2!4928 lt!172014))) (currentByte!5331 (_2!4928 lt!172014)) (currentBit!5326 (_2!4928 lt!172014))) lt!172542)))

(declare-fun b!113510 () Bool)

(declare-fun res!93745 () Bool)

(assert (=> b!113510 (=> (not res!93745) (not e!74464))))

(assert (=> b!113510 (= res!93745 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!172542))))

(declare-fun b!113511 () Bool)

(declare-fun lt!172543 () (_ BitVec 64))

(assert (=> b!113511 (= e!74464 (bvsle lt!172542 (bvmul lt!172543 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!113511 (or (= lt!172543 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!172543 #b0000000000000000000000000000000000000000000000000000000000001000) lt!172543)))))

(assert (=> b!113511 (= lt!172543 ((_ sign_extend 32) (size!2343 (buf!2751 (_2!4928 lt!172014)))))))

(assert (= (and d!36470 res!93744) b!113510))

(assert (= (and b!113510 res!93745) b!113511))

(declare-fun m!169655 () Bool)

(assert (=> d!36470 m!169655))

(assert (=> d!36470 m!169335))

(assert (=> b!113283 d!36470))

(declare-fun d!36472 () Bool)

(declare-fun e!74465 () Bool)

(assert (=> d!36472 e!74465))

(declare-fun res!93746 () Bool)

(assert (=> d!36472 (=> (not res!93746) (not e!74465))))

(declare-fun lt!172551 () (_ BitVec 64))

(declare-fun lt!172553 () (_ BitVec 64))

(declare-fun lt!172548 () (_ BitVec 64))

(assert (=> d!36472 (= res!93746 (= lt!172548 (bvsub lt!172551 lt!172553)))))

(assert (=> d!36472 (or (= (bvand lt!172551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172553 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!172551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!172551 lt!172553) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36472 (= lt!172553 (remainingBits!0 ((_ sign_extend 32) (size!2343 (buf!2751 thiss!1305))) ((_ sign_extend 32) (currentByte!5331 thiss!1305)) ((_ sign_extend 32) (currentBit!5326 thiss!1305))))))

(declare-fun lt!172550 () (_ BitVec 64))

(declare-fun lt!172552 () (_ BitVec 64))

(assert (=> d!36472 (= lt!172551 (bvmul lt!172550 lt!172552))))

(assert (=> d!36472 (or (= lt!172550 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!172552 (bvsdiv (bvmul lt!172550 lt!172552) lt!172550)))))

(assert (=> d!36472 (= lt!172552 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36472 (= lt!172550 ((_ sign_extend 32) (size!2343 (buf!2751 thiss!1305))))))

(assert (=> d!36472 (= lt!172548 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5331 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5326 thiss!1305))))))

(assert (=> d!36472 (invariant!0 (currentBit!5326 thiss!1305) (currentByte!5331 thiss!1305) (size!2343 (buf!2751 thiss!1305)))))

(assert (=> d!36472 (= (bitIndex!0 (size!2343 (buf!2751 thiss!1305)) (currentByte!5331 thiss!1305) (currentBit!5326 thiss!1305)) lt!172548)))

(declare-fun b!113512 () Bool)

(declare-fun res!93747 () Bool)

(assert (=> b!113512 (=> (not res!93747) (not e!74465))))

(assert (=> b!113512 (= res!93747 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!172548))))

(declare-fun b!113513 () Bool)

(declare-fun lt!172549 () (_ BitVec 64))

(assert (=> b!113513 (= e!74465 (bvsle lt!172548 (bvmul lt!172549 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!113513 (or (= lt!172549 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!172549 #b0000000000000000000000000000000000000000000000000000000000001000) lt!172549)))))

(assert (=> b!113513 (= lt!172549 ((_ sign_extend 32) (size!2343 (buf!2751 thiss!1305))))))

(assert (= (and d!36472 res!93746) b!113512))

(assert (= (and b!113512 res!93747) b!113513))

(declare-fun m!169657 () Bool)

(assert (=> d!36472 m!169657))

(assert (=> d!36472 m!169653))

(assert (=> b!113283 d!36472))

(declare-fun d!36474 () Bool)

(assert (=> d!36474 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2343 (buf!2751 thiss!1305))) ((_ sign_extend 32) (currentByte!5331 thiss!1305)) ((_ sign_extend 32) (currentBit!5326 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2343 (buf!2751 thiss!1305))) ((_ sign_extend 32) (currentByte!5331 thiss!1305)) ((_ sign_extend 32) (currentBit!5326 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8864 () Bool)

(assert (= bs!8864 d!36474))

(assert (=> bs!8864 m!169657))

(assert (=> b!113278 d!36474))

(declare-fun d!36476 () Bool)

(assert (=> d!36476 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!113277 d!36476))

(declare-fun d!36478 () Bool)

(declare-fun e!74466 () Bool)

(assert (=> d!36478 e!74466))

(declare-fun res!93748 () Bool)

(assert (=> d!36478 (=> (not res!93748) (not e!74466))))

(declare-fun lt!172554 () (_ BitVec 64))

(declare-fun lt!172557 () (_ BitVec 64))

(declare-fun lt!172559 () (_ BitVec 64))

(assert (=> d!36478 (= res!93748 (= lt!172554 (bvsub lt!172557 lt!172559)))))

(assert (=> d!36478 (or (= (bvand lt!172557 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172559 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!172557 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!172557 lt!172559) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36478 (= lt!172559 (remainingBits!0 ((_ sign_extend 32) (size!2343 (buf!2751 (_1!4929 lt!172019)))) ((_ sign_extend 32) (currentByte!5331 (_1!4929 lt!172019))) ((_ sign_extend 32) (currentBit!5326 (_1!4929 lt!172019)))))))

(declare-fun lt!172556 () (_ BitVec 64))

(declare-fun lt!172558 () (_ BitVec 64))

(assert (=> d!36478 (= lt!172557 (bvmul lt!172556 lt!172558))))

(assert (=> d!36478 (or (= lt!172556 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!172558 (bvsdiv (bvmul lt!172556 lt!172558) lt!172556)))))

(assert (=> d!36478 (= lt!172558 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36478 (= lt!172556 ((_ sign_extend 32) (size!2343 (buf!2751 (_1!4929 lt!172019)))))))

(assert (=> d!36478 (= lt!172554 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5331 (_1!4929 lt!172019))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5326 (_1!4929 lt!172019)))))))

(assert (=> d!36478 (invariant!0 (currentBit!5326 (_1!4929 lt!172019)) (currentByte!5331 (_1!4929 lt!172019)) (size!2343 (buf!2751 (_1!4929 lt!172019))))))

(assert (=> d!36478 (= (bitIndex!0 (size!2343 (buf!2751 (_1!4929 lt!172019))) (currentByte!5331 (_1!4929 lt!172019)) (currentBit!5326 (_1!4929 lt!172019))) lt!172554)))

