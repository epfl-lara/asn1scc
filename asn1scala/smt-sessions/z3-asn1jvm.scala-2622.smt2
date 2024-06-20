; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64650 () Bool)

(assert start!64650)

(declare-fun b!290323 () Bool)

(declare-fun res!239854 () Bool)

(declare-fun e!206783 () Bool)

(assert (=> b!290323 (=> (not res!239854) (not e!206783))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17239 0))(
  ( (array!17240 (arr!8465 (Array (_ BitVec 32) (_ BitVec 8))) (size!7463 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12936 0))(
  ( (BitStream!12937 (buf!7529 array!17239) (currentByte!13936 (_ BitVec 32)) (currentBit!13931 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12936)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290323 (= res!239854 (validate_offset_bits!1 ((_ sign_extend 32) (size!7463 (buf!7529 thiss!1728))) ((_ sign_extend 32) (currentByte!13936 thiss!1728)) ((_ sign_extend 32) (currentBit!13931 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290324 () Bool)

(declare-fun res!239853 () Bool)

(assert (=> b!290324 (=> (not res!239853) (not e!206783))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!290324 (= res!239853 (bvslt from!505 to!474))))

(declare-fun b!290325 () Bool)

(declare-fun e!206781 () Bool)

(declare-fun lt!421123 () Bool)

(declare-datatypes ((tuple2!22800 0))(
  ( (tuple2!22801 (_1!12649 Bool) (_2!12649 BitStream!12936)) )
))
(declare-fun lt!421127 () tuple2!22800)

(assert (=> b!290325 (= e!206781 (= lt!421123 (_1!12649 lt!421127)))))

(declare-fun b!290326 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!290326 (= e!206783 (not (invariant!0 (currentBit!13931 thiss!1728) (currentByte!13936 thiss!1728) (size!7463 (buf!7529 thiss!1728)))))))

(assert (=> b!290326 e!206781))

(declare-fun res!239855 () Bool)

(assert (=> b!290326 (=> (not res!239855) (not e!206781))))

(declare-fun lt!421129 () array!17239)

(declare-fun bitAt!0 (array!17239 (_ BitVec 64)) Bool)

(assert (=> b!290326 (= res!239855 (= (bitAt!0 lt!421129 from!505) lt!421123))))

(declare-datatypes ((Unit!20167 0))(
  ( (Unit!20168) )
))
(declare-datatypes ((tuple3!1670 0))(
  ( (tuple3!1671 (_1!12650 Unit!20167) (_2!12650 BitStream!12936) (_3!1249 array!17239)) )
))
(declare-fun lt!421130 () tuple3!1670)

(assert (=> b!290326 (= lt!421123 (bitAt!0 (_3!1249 lt!421130) from!505))))

(declare-fun lt!421124 () Unit!20167)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17239 array!17239 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20167)

(assert (=> b!290326 (= lt!421124 (arrayBitRangesEqImpliesEq!0 lt!421129 (_3!1249 lt!421130) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17239)

(declare-fun arrayBitRangesEq!0 (array!17239 array!17239 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290326 (arrayBitRangesEq!0 arr!273 (_3!1249 lt!421130) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!421125 () Unit!20167)

(declare-fun arrayBitRangesEqTransitive!0 (array!17239 array!17239 array!17239 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20167)

(assert (=> b!290326 (= lt!421125 (arrayBitRangesEqTransitive!0 arr!273 lt!421129 (_3!1249 lt!421130) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290326 (arrayBitRangesEq!0 arr!273 lt!421129 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!421122 () Unit!20167)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17239 (_ BitVec 64) Bool) Unit!20167)

(assert (=> b!290326 (= lt!421122 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12649 lt!421127)))))

(declare-fun e!206784 () Bool)

(assert (=> b!290326 e!206784))

(declare-fun res!239852 () Bool)

(assert (=> b!290326 (=> (not res!239852) (not e!206784))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290326 (= res!239852 (= (bvsub (bvadd (bitIndex!0 (size!7463 (buf!7529 thiss!1728)) (currentByte!13936 thiss!1728) (currentBit!13931 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7463 (buf!7529 (_2!12650 lt!421130))) (currentByte!13936 (_2!12650 lt!421130)) (currentBit!13931 (_2!12650 lt!421130)))))))

(declare-fun readBitsLoop!0 (BitStream!12936 (_ BitVec 64) array!17239 (_ BitVec 64) (_ BitVec 64)) tuple3!1670)

(assert (=> b!290326 (= lt!421130 (readBitsLoop!0 (_2!12649 lt!421127) nBits!523 lt!421129 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290326 (validate_offset_bits!1 ((_ sign_extend 32) (size!7463 (buf!7529 (_2!12649 lt!421127)))) ((_ sign_extend 32) (currentByte!13936 (_2!12649 lt!421127))) ((_ sign_extend 32) (currentBit!13931 (_2!12649 lt!421127))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!421126 () Unit!20167)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12936 BitStream!12936 (_ BitVec 64) (_ BitVec 64)) Unit!20167)

(assert (=> b!290326 (= lt!421126 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12649 lt!421127) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!421131 () (_ BitVec 32))

(declare-fun lt!421128 () (_ BitVec 32))

(assert (=> b!290326 (= lt!421129 (array!17240 (store (arr!8465 arr!273) lt!421128 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8465 arr!273) lt!421128)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421131)))) ((_ sign_extend 24) (ite (_1!12649 lt!421127) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421131) #b00000000))))) (size!7463 arr!273)))))

(assert (=> b!290326 (= lt!421131 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290326 (= lt!421128 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12936) tuple2!22800)

(assert (=> b!290326 (= lt!421127 (readBit!0 thiss!1728))))

(declare-fun b!290327 () Bool)

(declare-fun e!206782 () Bool)

(declare-fun array_inv!7075 (array!17239) Bool)

(assert (=> b!290327 (= e!206782 (array_inv!7075 (buf!7529 thiss!1728)))))

(declare-fun b!290328 () Bool)

(assert (=> b!290328 (= e!206784 (and (= (buf!7529 thiss!1728) (buf!7529 (_2!12650 lt!421130))) (= (size!7463 arr!273) (size!7463 (_3!1249 lt!421130)))))))

(declare-fun res!239851 () Bool)

(assert (=> start!64650 (=> (not res!239851) (not e!206783))))

(assert (=> start!64650 (= res!239851 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7463 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64650 e!206783))

(declare-fun inv!12 (BitStream!12936) Bool)

(assert (=> start!64650 (and (inv!12 thiss!1728) e!206782)))

(assert (=> start!64650 true))

(assert (=> start!64650 (array_inv!7075 arr!273)))

(assert (= (and start!64650 res!239851) b!290323))

(assert (= (and b!290323 res!239854) b!290324))

(assert (= (and b!290324 res!239853) b!290326))

(assert (= (and b!290326 res!239852) b!290328))

(assert (= (and b!290326 res!239855) b!290325))

(assert (= start!64650 b!290327))

(declare-fun m!424297 () Bool)

(assert (=> b!290323 m!424297))

(declare-fun m!424299 () Bool)

(assert (=> b!290326 m!424299))

(declare-fun m!424301 () Bool)

(assert (=> b!290326 m!424301))

(declare-fun m!424303 () Bool)

(assert (=> b!290326 m!424303))

(declare-fun m!424305 () Bool)

(assert (=> b!290326 m!424305))

(declare-fun m!424307 () Bool)

(assert (=> b!290326 m!424307))

(declare-fun m!424309 () Bool)

(assert (=> b!290326 m!424309))

(declare-fun m!424311 () Bool)

(assert (=> b!290326 m!424311))

(declare-fun m!424313 () Bool)

(assert (=> b!290326 m!424313))

(declare-fun m!424315 () Bool)

(assert (=> b!290326 m!424315))

(declare-fun m!424317 () Bool)

(assert (=> b!290326 m!424317))

(declare-fun m!424319 () Bool)

(assert (=> b!290326 m!424319))

(declare-fun m!424321 () Bool)

(assert (=> b!290326 m!424321))

(declare-fun m!424323 () Bool)

(assert (=> b!290326 m!424323))

(declare-fun m!424325 () Bool)

(assert (=> b!290326 m!424325))

(declare-fun m!424327 () Bool)

(assert (=> b!290326 m!424327))

(declare-fun m!424329 () Bool)

(assert (=> b!290326 m!424329))

(declare-fun m!424331 () Bool)

(assert (=> b!290326 m!424331))

(declare-fun m!424333 () Bool)

(assert (=> b!290327 m!424333))

(declare-fun m!424335 () Bool)

(assert (=> start!64650 m!424335))

(declare-fun m!424337 () Bool)

(assert (=> start!64650 m!424337))

(check-sat (not b!290326) (not b!290327) (not start!64650) (not b!290323))
(check-sat)
(get-model)

(declare-fun d!98346 () Bool)

(assert (=> d!98346 (= (bitAt!0 lt!421129 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8465 lt!421129) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25056 () Bool)

(assert (= bs!25056 d!98346))

(declare-fun m!424381 () Bool)

(assert (=> bs!25056 m!424381))

(declare-fun m!424383 () Bool)

(assert (=> bs!25056 m!424383))

(assert (=> b!290326 d!98346))

(declare-fun d!98348 () Bool)

(declare-fun e!206805 () Bool)

(assert (=> d!98348 e!206805))

(declare-fun res!239875 () Bool)

(assert (=> d!98348 (=> (not res!239875) (not e!206805))))

(declare-fun lt!421179 () (_ BitVec 64))

(declare-fun lt!421178 () (_ BitVec 64))

(declare-fun lt!421177 () (_ BitVec 64))

(assert (=> d!98348 (= res!239875 (= lt!421178 (bvsub lt!421179 lt!421177)))))

(assert (=> d!98348 (or (= (bvand lt!421179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!421177 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!421179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!421179 lt!421177) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98348 (= lt!421177 (remainingBits!0 ((_ sign_extend 32) (size!7463 (buf!7529 (_2!12650 lt!421130)))) ((_ sign_extend 32) (currentByte!13936 (_2!12650 lt!421130))) ((_ sign_extend 32) (currentBit!13931 (_2!12650 lt!421130)))))))

(declare-fun lt!421175 () (_ BitVec 64))

(declare-fun lt!421176 () (_ BitVec 64))

(assert (=> d!98348 (= lt!421179 (bvmul lt!421175 lt!421176))))

(assert (=> d!98348 (or (= lt!421175 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!421176 (bvsdiv (bvmul lt!421175 lt!421176) lt!421175)))))

(assert (=> d!98348 (= lt!421176 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98348 (= lt!421175 ((_ sign_extend 32) (size!7463 (buf!7529 (_2!12650 lt!421130)))))))

(assert (=> d!98348 (= lt!421178 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13936 (_2!12650 lt!421130))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13931 (_2!12650 lt!421130)))))))

(assert (=> d!98348 (invariant!0 (currentBit!13931 (_2!12650 lt!421130)) (currentByte!13936 (_2!12650 lt!421130)) (size!7463 (buf!7529 (_2!12650 lt!421130))))))

(assert (=> d!98348 (= (bitIndex!0 (size!7463 (buf!7529 (_2!12650 lt!421130))) (currentByte!13936 (_2!12650 lt!421130)) (currentBit!13931 (_2!12650 lt!421130))) lt!421178)))

(declare-fun b!290351 () Bool)

(declare-fun res!239876 () Bool)

(assert (=> b!290351 (=> (not res!239876) (not e!206805))))

(assert (=> b!290351 (= res!239876 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!421178))))

(declare-fun b!290352 () Bool)

(declare-fun lt!421174 () (_ BitVec 64))

(assert (=> b!290352 (= e!206805 (bvsle lt!421178 (bvmul lt!421174 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290352 (or (= lt!421174 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!421174 #b0000000000000000000000000000000000000000000000000000000000001000) lt!421174)))))

(assert (=> b!290352 (= lt!421174 ((_ sign_extend 32) (size!7463 (buf!7529 (_2!12650 lt!421130)))))))

(assert (= (and d!98348 res!239875) b!290351))

(assert (= (and b!290351 res!239876) b!290352))

(declare-fun m!424385 () Bool)

(assert (=> d!98348 m!424385))

(declare-fun m!424387 () Bool)

(assert (=> d!98348 m!424387))

(assert (=> b!290326 d!98348))

(declare-fun d!98350 () Bool)

(declare-fun e!206808 () Bool)

(assert (=> d!98350 e!206808))

(declare-fun res!239879 () Bool)

(assert (=> d!98350 (=> (not res!239879) (not e!206808))))

(assert (=> d!98350 (= res!239879 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!421182 () Unit!20167)

(declare-fun choose!27 (BitStream!12936 BitStream!12936 (_ BitVec 64) (_ BitVec 64)) Unit!20167)

(assert (=> d!98350 (= lt!421182 (choose!27 thiss!1728 (_2!12649 lt!421127) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!98350 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!98350 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12649 lt!421127) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!421182)))

(declare-fun b!290355 () Bool)

(assert (=> b!290355 (= e!206808 (validate_offset_bits!1 ((_ sign_extend 32) (size!7463 (buf!7529 (_2!12649 lt!421127)))) ((_ sign_extend 32) (currentByte!13936 (_2!12649 lt!421127))) ((_ sign_extend 32) (currentBit!13931 (_2!12649 lt!421127))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!98350 res!239879) b!290355))

(declare-fun m!424389 () Bool)

(assert (=> d!98350 m!424389))

(assert (=> b!290355 m!424309))

(assert (=> b!290326 d!98350))

(declare-fun b!290370 () Bool)

(declare-fun e!206822 () Bool)

(declare-fun e!206821 () Bool)

(assert (=> b!290370 (= e!206822 e!206821)))

(declare-fun c!13263 () Bool)

(declare-datatypes ((tuple4!828 0))(
  ( (tuple4!829 (_1!12653 (_ BitVec 32)) (_2!12653 (_ BitVec 32)) (_3!1251 (_ BitVec 32)) (_4!414 (_ BitVec 32))) )
))
(declare-fun lt!421191 () tuple4!828)

(assert (=> b!290370 (= c!13263 (= (_3!1251 lt!421191) (_4!414 lt!421191)))))

(declare-fun d!98352 () Bool)

(declare-fun res!239892 () Bool)

(declare-fun e!206825 () Bool)

(assert (=> d!98352 (=> res!239892 e!206825)))

(assert (=> d!98352 (= res!239892 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98352 (= (arrayBitRangesEq!0 arr!273 (_3!1249 lt!421130) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!206825)))

(declare-fun b!290371 () Bool)

(assert (=> b!290371 (= e!206825 e!206822)))

(declare-fun res!239891 () Bool)

(assert (=> b!290371 (=> (not res!239891) (not e!206822))))

(declare-fun e!206823 () Bool)

(assert (=> b!290371 (= res!239891 e!206823)))

(declare-fun res!239890 () Bool)

(assert (=> b!290371 (=> res!239890 e!206823)))

(assert (=> b!290371 (= res!239890 (bvsge (_1!12653 lt!421191) (_2!12653 lt!421191)))))

(declare-fun lt!421190 () (_ BitVec 32))

(assert (=> b!290371 (= lt!421190 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!421189 () (_ BitVec 32))

(assert (=> b!290371 (= lt!421189 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!828)

(assert (=> b!290371 (= lt!421191 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!290372 () Bool)

(declare-fun arrayRangesEq!1472 (array!17239 array!17239 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!290372 (= e!206823 (arrayRangesEq!1472 arr!273 (_3!1249 lt!421130) (_1!12653 lt!421191) (_2!12653 lt!421191)))))

(declare-fun b!290373 () Bool)

(declare-fun call!4793 () Bool)

(assert (=> b!290373 (= e!206821 call!4793)))

(declare-fun bm!4790 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4790 (= call!4793 (byteRangesEq!0 (select (arr!8465 arr!273) (_3!1251 lt!421191)) (select (arr!8465 (_3!1249 lt!421130)) (_3!1251 lt!421191)) lt!421189 (ite c!13263 lt!421190 #b00000000000000000000000000001000)))))

(declare-fun b!290374 () Bool)

(declare-fun res!239894 () Bool)

(assert (=> b!290374 (= res!239894 (= lt!421190 #b00000000000000000000000000000000))))

(declare-fun e!206824 () Bool)

(assert (=> b!290374 (=> res!239894 e!206824)))

(declare-fun e!206826 () Bool)

(assert (=> b!290374 (= e!206826 e!206824)))

(declare-fun b!290375 () Bool)

(assert (=> b!290375 (= e!206824 (byteRangesEq!0 (select (arr!8465 arr!273) (_4!414 lt!421191)) (select (arr!8465 (_3!1249 lt!421130)) (_4!414 lt!421191)) #b00000000000000000000000000000000 lt!421190))))

(declare-fun b!290376 () Bool)

(assert (=> b!290376 (= e!206821 e!206826)))

(declare-fun res!239893 () Bool)

(assert (=> b!290376 (= res!239893 call!4793)))

(assert (=> b!290376 (=> (not res!239893) (not e!206826))))

(assert (= (and d!98352 (not res!239892)) b!290371))

(assert (= (and b!290371 (not res!239890)) b!290372))

(assert (= (and b!290371 res!239891) b!290370))

(assert (= (and b!290370 c!13263) b!290373))

(assert (= (and b!290370 (not c!13263)) b!290376))

(assert (= (and b!290376 res!239893) b!290374))

(assert (= (and b!290374 (not res!239894)) b!290375))

(assert (= (or b!290373 b!290376) bm!4790))

(declare-fun m!424391 () Bool)

(assert (=> b!290371 m!424391))

(declare-fun m!424393 () Bool)

(assert (=> b!290372 m!424393))

(declare-fun m!424395 () Bool)

(assert (=> bm!4790 m!424395))

(declare-fun m!424397 () Bool)

(assert (=> bm!4790 m!424397))

(assert (=> bm!4790 m!424395))

(assert (=> bm!4790 m!424397))

(declare-fun m!424399 () Bool)

(assert (=> bm!4790 m!424399))

(declare-fun m!424401 () Bool)

(assert (=> b!290375 m!424401))

(declare-fun m!424403 () Bool)

(assert (=> b!290375 m!424403))

(assert (=> b!290375 m!424401))

(assert (=> b!290375 m!424403))

(declare-fun m!424405 () Bool)

(assert (=> b!290375 m!424405))

(assert (=> b!290326 d!98352))

(declare-fun b!290377 () Bool)

(declare-fun e!206828 () Bool)

(declare-fun e!206827 () Bool)

(assert (=> b!290377 (= e!206828 e!206827)))

(declare-fun c!13264 () Bool)

(declare-fun lt!421194 () tuple4!828)

(assert (=> b!290377 (= c!13264 (= (_3!1251 lt!421194) (_4!414 lt!421194)))))

(declare-fun d!98354 () Bool)

(declare-fun res!239897 () Bool)

(declare-fun e!206831 () Bool)

(assert (=> d!98354 (=> res!239897 e!206831)))

(assert (=> d!98354 (= res!239897 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98354 (= (arrayBitRangesEq!0 arr!273 lt!421129 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!206831)))

(declare-fun b!290378 () Bool)

(assert (=> b!290378 (= e!206831 e!206828)))

(declare-fun res!239896 () Bool)

(assert (=> b!290378 (=> (not res!239896) (not e!206828))))

(declare-fun e!206829 () Bool)

(assert (=> b!290378 (= res!239896 e!206829)))

(declare-fun res!239895 () Bool)

(assert (=> b!290378 (=> res!239895 e!206829)))

(assert (=> b!290378 (= res!239895 (bvsge (_1!12653 lt!421194) (_2!12653 lt!421194)))))

(declare-fun lt!421193 () (_ BitVec 32))

(assert (=> b!290378 (= lt!421193 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!421192 () (_ BitVec 32))

(assert (=> b!290378 (= lt!421192 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290378 (= lt!421194 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!290379 () Bool)

(assert (=> b!290379 (= e!206829 (arrayRangesEq!1472 arr!273 lt!421129 (_1!12653 lt!421194) (_2!12653 lt!421194)))))

(declare-fun b!290380 () Bool)

(declare-fun call!4794 () Bool)

(assert (=> b!290380 (= e!206827 call!4794)))

(declare-fun bm!4791 () Bool)

(assert (=> bm!4791 (= call!4794 (byteRangesEq!0 (select (arr!8465 arr!273) (_3!1251 lt!421194)) (select (arr!8465 lt!421129) (_3!1251 lt!421194)) lt!421192 (ite c!13264 lt!421193 #b00000000000000000000000000001000)))))

(declare-fun b!290381 () Bool)

(declare-fun res!239899 () Bool)

(assert (=> b!290381 (= res!239899 (= lt!421193 #b00000000000000000000000000000000))))

(declare-fun e!206830 () Bool)

(assert (=> b!290381 (=> res!239899 e!206830)))

(declare-fun e!206832 () Bool)

(assert (=> b!290381 (= e!206832 e!206830)))

(declare-fun b!290382 () Bool)

(assert (=> b!290382 (= e!206830 (byteRangesEq!0 (select (arr!8465 arr!273) (_4!414 lt!421194)) (select (arr!8465 lt!421129) (_4!414 lt!421194)) #b00000000000000000000000000000000 lt!421193))))

(declare-fun b!290383 () Bool)

(assert (=> b!290383 (= e!206827 e!206832)))

(declare-fun res!239898 () Bool)

(assert (=> b!290383 (= res!239898 call!4794)))

(assert (=> b!290383 (=> (not res!239898) (not e!206832))))

(assert (= (and d!98354 (not res!239897)) b!290378))

(assert (= (and b!290378 (not res!239895)) b!290379))

(assert (= (and b!290378 res!239896) b!290377))

(assert (= (and b!290377 c!13264) b!290380))

(assert (= (and b!290377 (not c!13264)) b!290383))

(assert (= (and b!290383 res!239898) b!290381))

(assert (= (and b!290381 (not res!239899)) b!290382))

(assert (= (or b!290380 b!290383) bm!4791))

(assert (=> b!290378 m!424391))

(declare-fun m!424407 () Bool)

(assert (=> b!290379 m!424407))

(declare-fun m!424409 () Bool)

(assert (=> bm!4791 m!424409))

(declare-fun m!424411 () Bool)

(assert (=> bm!4791 m!424411))

(assert (=> bm!4791 m!424409))

(assert (=> bm!4791 m!424411))

(declare-fun m!424413 () Bool)

(assert (=> bm!4791 m!424413))

(declare-fun m!424415 () Bool)

(assert (=> b!290382 m!424415))

(declare-fun m!424417 () Bool)

(assert (=> b!290382 m!424417))

(assert (=> b!290382 m!424415))

(assert (=> b!290382 m!424417))

(declare-fun m!424419 () Bool)

(assert (=> b!290382 m!424419))

(assert (=> b!290326 d!98354))

(declare-fun d!98356 () Bool)

(declare-fun e!206842 () Bool)

(assert (=> d!98356 e!206842))

(declare-fun res!239905 () Bool)

(assert (=> d!98356 (=> (not res!239905) (not e!206842))))

(declare-datatypes ((tuple2!22804 0))(
  ( (tuple2!22805 (_1!12654 Unit!20167) (_2!12654 BitStream!12936)) )
))
(declare-fun increaseBitIndex!0 (BitStream!12936) tuple2!22804)

(assert (=> d!98356 (= res!239905 (= (buf!7529 (_2!12654 (increaseBitIndex!0 thiss!1728))) (buf!7529 thiss!1728)))))

(declare-fun lt!421221 () Bool)

(assert (=> d!98356 (= lt!421221 (not (= (bvand ((_ sign_extend 24) (select (arr!8465 (buf!7529 thiss!1728)) (currentByte!13936 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13931 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!421224 () tuple2!22800)

(assert (=> d!98356 (= lt!421224 (tuple2!22801 (not (= (bvand ((_ sign_extend 24) (select (arr!8465 (buf!7529 thiss!1728)) (currentByte!13936 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13931 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12654 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!98356 (validate_offset_bit!0 ((_ sign_extend 32) (size!7463 (buf!7529 thiss!1728))) ((_ sign_extend 32) (currentByte!13936 thiss!1728)) ((_ sign_extend 32) (currentBit!13931 thiss!1728)))))

(assert (=> d!98356 (= (readBit!0 thiss!1728) lt!421224)))

(declare-fun b!290390 () Bool)

(declare-fun lt!421223 () (_ BitVec 64))

(declare-fun lt!421226 () (_ BitVec 64))

(assert (=> b!290390 (= e!206842 (= (bitIndex!0 (size!7463 (buf!7529 (_2!12654 (increaseBitIndex!0 thiss!1728)))) (currentByte!13936 (_2!12654 (increaseBitIndex!0 thiss!1728))) (currentBit!13931 (_2!12654 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!421226 lt!421223)))))

(assert (=> b!290390 (or (not (= (bvand lt!421226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!421223 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!421226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!421226 lt!421223) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290390 (= lt!421223 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!290390 (= lt!421226 (bitIndex!0 (size!7463 (buf!7529 thiss!1728)) (currentByte!13936 thiss!1728) (currentBit!13931 thiss!1728)))))

(declare-fun lt!421222 () Bool)

(assert (=> b!290390 (= lt!421222 (not (= (bvand ((_ sign_extend 24) (select (arr!8465 (buf!7529 thiss!1728)) (currentByte!13936 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13931 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!421227 () Bool)

(assert (=> b!290390 (= lt!421227 (not (= (bvand ((_ sign_extend 24) (select (arr!8465 (buf!7529 thiss!1728)) (currentByte!13936 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13931 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!421225 () Bool)

(assert (=> b!290390 (= lt!421225 (not (= (bvand ((_ sign_extend 24) (select (arr!8465 (buf!7529 thiss!1728)) (currentByte!13936 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13931 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!98356 res!239905) b!290390))

(declare-fun m!424433 () Bool)

(assert (=> d!98356 m!424433))

(declare-fun m!424435 () Bool)

(assert (=> d!98356 m!424435))

(declare-fun m!424437 () Bool)

(assert (=> d!98356 m!424437))

(declare-fun m!424439 () Bool)

(assert (=> d!98356 m!424439))

(declare-fun m!424441 () Bool)

(assert (=> b!290390 m!424441))

(assert (=> b!290390 m!424311))

(assert (=> b!290390 m!424433))

(assert (=> b!290390 m!424437))

(assert (=> b!290390 m!424435))

(assert (=> b!290326 d!98356))

(declare-fun d!98366 () Bool)

(assert (=> d!98366 (= (invariant!0 (currentBit!13931 thiss!1728) (currentByte!13936 thiss!1728) (size!7463 (buf!7529 thiss!1728))) (and (bvsge (currentBit!13931 thiss!1728) #b00000000000000000000000000000000) (bvslt (currentBit!13931 thiss!1728) #b00000000000000000000000000001000) (bvsge (currentByte!13936 thiss!1728) #b00000000000000000000000000000000) (or (bvslt (currentByte!13936 thiss!1728) (size!7463 (buf!7529 thiss!1728))) (and (= (currentBit!13931 thiss!1728) #b00000000000000000000000000000000) (= (currentByte!13936 thiss!1728) (size!7463 (buf!7529 thiss!1728)))))))))

(assert (=> b!290326 d!98366))

(declare-fun d!98368 () Bool)

(assert (=> d!98368 (= (bitAt!0 lt!421129 from!505) (bitAt!0 (_3!1249 lt!421130) from!505))))

(declare-fun lt!421230 () Unit!20167)

(declare-fun choose!31 (array!17239 array!17239 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20167)

(assert (=> d!98368 (= lt!421230 (choose!31 lt!421129 (_3!1249 lt!421130) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98368 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98368 (= (arrayBitRangesEqImpliesEq!0 lt!421129 (_3!1249 lt!421130) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!421230)))

(declare-fun bs!25058 () Bool)

(assert (= bs!25058 d!98368))

(assert (=> bs!25058 m!424329))

(assert (=> bs!25058 m!424331))

(declare-fun m!424443 () Bool)

(assert (=> bs!25058 m!424443))

(assert (=> b!290326 d!98368))

(declare-fun d!98370 () Bool)

(declare-fun e!206843 () Bool)

(assert (=> d!98370 e!206843))

(declare-fun res!239906 () Bool)

(assert (=> d!98370 (=> (not res!239906) (not e!206843))))

(declare-fun lt!421236 () (_ BitVec 64))

(declare-fun lt!421234 () (_ BitVec 64))

(declare-fun lt!421235 () (_ BitVec 64))

(assert (=> d!98370 (= res!239906 (= lt!421235 (bvsub lt!421236 lt!421234)))))

(assert (=> d!98370 (or (= (bvand lt!421236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!421234 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!421236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!421236 lt!421234) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98370 (= lt!421234 (remainingBits!0 ((_ sign_extend 32) (size!7463 (buf!7529 thiss!1728))) ((_ sign_extend 32) (currentByte!13936 thiss!1728)) ((_ sign_extend 32) (currentBit!13931 thiss!1728))))))

(declare-fun lt!421232 () (_ BitVec 64))

(declare-fun lt!421233 () (_ BitVec 64))

(assert (=> d!98370 (= lt!421236 (bvmul lt!421232 lt!421233))))

(assert (=> d!98370 (or (= lt!421232 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!421233 (bvsdiv (bvmul lt!421232 lt!421233) lt!421232)))))

(assert (=> d!98370 (= lt!421233 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98370 (= lt!421232 ((_ sign_extend 32) (size!7463 (buf!7529 thiss!1728))))))

(assert (=> d!98370 (= lt!421235 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13936 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13931 thiss!1728))))))

(assert (=> d!98370 (invariant!0 (currentBit!13931 thiss!1728) (currentByte!13936 thiss!1728) (size!7463 (buf!7529 thiss!1728)))))

(assert (=> d!98370 (= (bitIndex!0 (size!7463 (buf!7529 thiss!1728)) (currentByte!13936 thiss!1728) (currentBit!13931 thiss!1728)) lt!421235)))

(declare-fun b!290391 () Bool)

(declare-fun res!239907 () Bool)

(assert (=> b!290391 (=> (not res!239907) (not e!206843))))

(assert (=> b!290391 (= res!239907 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!421235))))

(declare-fun b!290392 () Bool)

(declare-fun lt!421231 () (_ BitVec 64))

(assert (=> b!290392 (= e!206843 (bvsle lt!421235 (bvmul lt!421231 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290392 (or (= lt!421231 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!421231 #b0000000000000000000000000000000000000000000000000000000000001000) lt!421231)))))

(assert (=> b!290392 (= lt!421231 ((_ sign_extend 32) (size!7463 (buf!7529 thiss!1728))))))

(assert (= (and d!98370 res!239906) b!290391))

(assert (= (and b!290391 res!239907) b!290392))

(declare-fun m!424445 () Bool)

(assert (=> d!98370 m!424445))

(assert (=> d!98370 m!424315))

(assert (=> b!290326 d!98370))

(declare-fun d!98372 () Bool)

(assert (=> d!98372 (= (bitAt!0 (_3!1249 lt!421130) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8465 (_3!1249 lt!421130)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25059 () Bool)

(assert (= bs!25059 d!98372))

(declare-fun m!424447 () Bool)

(assert (=> bs!25059 m!424447))

(assert (=> bs!25059 m!424383))

(assert (=> b!290326 d!98372))

(declare-fun b!290491 () Bool)

(declare-fun res!239988 () Bool)

(declare-fun e!206913 () Bool)

(assert (=> b!290491 (=> (not res!239988) (not e!206913))))

(declare-fun lt!421462 () tuple3!1670)

(assert (=> b!290491 (= res!239988 (and (= (buf!7529 (_2!12649 lt!421127)) (buf!7529 (_2!12650 lt!421462))) (= (size!7463 lt!421129) (size!7463 (_3!1249 lt!421462)))))))

(declare-fun lt!421472 () Unit!20167)

(declare-fun e!206914 () tuple3!1670)

(declare-fun b!290492 () Bool)

(assert (=> b!290492 (= e!206914 (tuple3!1671 lt!421472 (_2!12649 lt!421127) lt!421129))))

(declare-fun lt!421452 () Unit!20167)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17239) Unit!20167)

(assert (=> b!290492 (= lt!421452 (arrayBitRangesEqReflexiveLemma!0 lt!421129))))

(declare-fun call!4810 () Bool)

(assert (=> b!290492 call!4810))

(declare-fun lt!421473 () Unit!20167)

(assert (=> b!290492 (= lt!421473 lt!421452)))

(declare-fun lt!421451 () array!17239)

(assert (=> b!290492 (= lt!421451 lt!421129)))

(declare-fun lt!421456 () array!17239)

(assert (=> b!290492 (= lt!421456 lt!421129)))

(declare-fun lt!421469 () (_ BitVec 64))

(assert (=> b!290492 (= lt!421469 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421445 () (_ BitVec 64))

(assert (=> b!290492 (= lt!421445 ((_ sign_extend 32) (size!7463 lt!421129)))))

(declare-fun lt!421459 () (_ BitVec 64))

(assert (=> b!290492 (= lt!421459 (bvmul lt!421445 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!421471 () (_ BitVec 64))

(assert (=> b!290492 (= lt!421471 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421466 () (_ BitVec 64))

(assert (=> b!290492 (= lt!421466 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17239 array!17239 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20167)

(assert (=> b!290492 (= lt!421472 (arrayBitRangesEqSlicedLemma!0 lt!421451 lt!421456 lt!421469 lt!421459 lt!421471 lt!421466))))

(declare-fun call!4811 () Bool)

(assert (=> b!290492 call!4811))

(declare-fun b!290493 () Bool)

(declare-fun e!206912 () Bool)

(declare-datatypes ((tuple2!22806 0))(
  ( (tuple2!22807 (_1!12655 BitStream!12936) (_2!12655 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!12936) tuple2!22806)

(assert (=> b!290493 (= e!206912 (= (bitAt!0 (_3!1249 lt!421462) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!12655 (readBitPure!0 (_2!12649 lt!421127)))))))

(declare-fun b!290494 () Bool)

(declare-datatypes ((List!954 0))(
  ( (Nil!951) (Cons!950 (h!1069 Bool) (t!1839 List!954)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!12936 array!17239 (_ BitVec 64) (_ BitVec 64)) List!954)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!12936 BitStream!12936 (_ BitVec 64)) List!954)

(assert (=> b!290494 (= e!206913 (= (byteArrayBitContentToList!0 (_2!12650 lt!421462) (_3!1249 lt!421462) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12650 lt!421462) (_2!12649 lt!421127) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!290494 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290494 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!290495 () Bool)

(declare-fun lt!421450 () Unit!20167)

(declare-fun lt!421455 () tuple3!1670)

(assert (=> b!290495 (= e!206914 (tuple3!1671 lt!421450 (_2!12650 lt!421455) (_3!1249 lt!421455)))))

(declare-fun lt!421460 () tuple2!22800)

(assert (=> b!290495 (= lt!421460 (readBit!0 (_2!12649 lt!421127)))))

(declare-fun lt!421468 () (_ BitVec 32))

(assert (=> b!290495 (= lt!421468 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!421448 () (_ BitVec 32))

(assert (=> b!290495 (= lt!421448 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!421474 () array!17239)

(assert (=> b!290495 (= lt!421474 (array!17240 (store (arr!8465 lt!421129) lt!421468 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8465 lt!421129) lt!421468)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421448)))) ((_ sign_extend 24) (ite (_1!12649 lt!421460) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421448) #b00000000))))) (size!7463 lt!421129)))))

(declare-fun lt!421476 () (_ BitVec 64))

(assert (=> b!290495 (= lt!421476 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!421465 () (_ BitVec 64))

(assert (=> b!290495 (= lt!421465 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!421454 () Unit!20167)

(assert (=> b!290495 (= lt!421454 (validateOffsetBitsIneqLemma!0 (_2!12649 lt!421127) (_2!12649 lt!421460) lt!421476 lt!421465))))

(assert (=> b!290495 (validate_offset_bits!1 ((_ sign_extend 32) (size!7463 (buf!7529 (_2!12649 lt!421460)))) ((_ sign_extend 32) (currentByte!13936 (_2!12649 lt!421460))) ((_ sign_extend 32) (currentBit!13931 (_2!12649 lt!421460))) (bvsub lt!421476 lt!421465))))

(declare-fun lt!421461 () Unit!20167)

(assert (=> b!290495 (= lt!421461 lt!421454)))

(assert (=> b!290495 (= lt!421455 (readBitsLoop!0 (_2!12649 lt!421460) nBits!523 lt!421474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!239984 () Bool)

(assert (=> b!290495 (= res!239984 (= (bvsub (bvadd (bitIndex!0 (size!7463 (buf!7529 (_2!12649 lt!421127))) (currentByte!13936 (_2!12649 lt!421127)) (currentBit!13931 (_2!12649 lt!421127))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7463 (buf!7529 (_2!12650 lt!421455))) (currentByte!13936 (_2!12650 lt!421455)) (currentBit!13931 (_2!12650 lt!421455)))))))

(declare-fun e!206911 () Bool)

(assert (=> b!290495 (=> (not res!239984) (not e!206911))))

(assert (=> b!290495 e!206911))

(declare-fun lt!421464 () Unit!20167)

(declare-fun Unit!20171 () Unit!20167)

(assert (=> b!290495 (= lt!421464 Unit!20171)))

(declare-fun lt!421449 () (_ BitVec 32))

(assert (=> b!290495 (= lt!421449 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!421447 () (_ BitVec 32))

(assert (=> b!290495 (= lt!421447 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!421442 () Unit!20167)

(assert (=> b!290495 (= lt!421442 (arrayBitRangesUpdatedAtLemma!0 lt!421129 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12649 lt!421460)))))

(assert (=> b!290495 (arrayBitRangesEq!0 lt!421129 (array!17240 (store (arr!8465 lt!421129) lt!421449 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8465 lt!421129) lt!421449)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421447)))) ((_ sign_extend 24) (ite (_1!12649 lt!421460) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421447) #b00000000))))) (size!7463 lt!421129)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!421441 () Unit!20167)

(assert (=> b!290495 (= lt!421441 lt!421442)))

(declare-fun lt!421457 () (_ BitVec 64))

(assert (=> b!290495 (= lt!421457 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421475 () Unit!20167)

(assert (=> b!290495 (= lt!421475 (arrayBitRangesEqTransitive!0 lt!421129 lt!421474 (_3!1249 lt!421455) lt!421457 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!290495 call!4811))

(declare-fun lt!421443 () Unit!20167)

(assert (=> b!290495 (= lt!421443 lt!421475)))

(assert (=> b!290495 call!4810))

(declare-fun lt!421463 () Unit!20167)

(declare-fun Unit!20172 () Unit!20167)

(assert (=> b!290495 (= lt!421463 Unit!20172)))

(declare-fun lt!421458 () Unit!20167)

(assert (=> b!290495 (= lt!421458 (arrayBitRangesEqImpliesEq!0 lt!421474 (_3!1249 lt!421455) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!290495 (= (bitAt!0 lt!421474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1249 lt!421455) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!421444 () Unit!20167)

(assert (=> b!290495 (= lt!421444 lt!421458)))

(declare-fun lt!421453 () Unit!20167)

(declare-fun Unit!20173 () Unit!20167)

(assert (=> b!290495 (= lt!421453 Unit!20173)))

(declare-fun lt!421446 () Bool)

(assert (=> b!290495 (= lt!421446 (= (bitAt!0 (_3!1249 lt!421455) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12649 lt!421460)))))

(declare-fun Unit!20174 () Unit!20167)

(assert (=> b!290495 (= lt!421450 Unit!20174)))

(assert (=> b!290495 lt!421446))

(declare-fun d!98374 () Bool)

(assert (=> d!98374 e!206913))

(declare-fun res!239986 () Bool)

(assert (=> d!98374 (=> (not res!239986) (not e!206913))))

(declare-fun lt!421467 () (_ BitVec 64))

(assert (=> d!98374 (= res!239986 (= (bvsub lt!421467 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7463 (buf!7529 (_2!12650 lt!421462))) (currentByte!13936 (_2!12650 lt!421462)) (currentBit!13931 (_2!12650 lt!421462)))))))

(assert (=> d!98374 (or (= (bvand lt!421467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!421467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!421467 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421470 () (_ BitVec 64))

(assert (=> d!98374 (= lt!421467 (bvadd lt!421470 to!474))))

(assert (=> d!98374 (or (not (= (bvand lt!421470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!421470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!421470 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98374 (= lt!421470 (bitIndex!0 (size!7463 (buf!7529 (_2!12649 lt!421127))) (currentByte!13936 (_2!12649 lt!421127)) (currentBit!13931 (_2!12649 lt!421127))))))

(assert (=> d!98374 (= lt!421462 e!206914)))

(declare-fun c!13276 () Bool)

(assert (=> d!98374 (= c!13276 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!98374 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!98374 (= (readBitsLoop!0 (_2!12649 lt!421127) nBits!523 lt!421129 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!421462)))

(declare-fun b!290496 () Bool)

(declare-fun res!239989 () Bool)

(assert (=> b!290496 (=> (not res!239989) (not e!206913))))

(assert (=> b!290496 (= res!239989 e!206912)))

(declare-fun res!239987 () Bool)

(assert (=> b!290496 (=> res!239987 e!206912)))

(assert (=> b!290496 (= res!239987 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun b!290497 () Bool)

(declare-fun res!239985 () Bool)

(assert (=> b!290497 (=> (not res!239985) (not e!206913))))

(assert (=> b!290497 (= res!239985 (arrayBitRangesEq!0 lt!421129 (_3!1249 lt!421462) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!290498 () Bool)

(declare-fun res!239983 () Bool)

(assert (=> b!290498 (=> (not res!239983) (not e!206913))))

(assert (=> b!290498 (= res!239983 (invariant!0 (currentBit!13931 (_2!12650 lt!421462)) (currentByte!13936 (_2!12650 lt!421462)) (size!7463 (buf!7529 (_2!12650 lt!421462)))))))

(declare-fun b!290499 () Bool)

(assert (=> b!290499 (= e!206911 (and (= (buf!7529 (_2!12649 lt!421127)) (buf!7529 (_2!12650 lt!421455))) (= (size!7463 lt!421129) (size!7463 (_3!1249 lt!421455)))))))

(declare-fun bm!4807 () Bool)

(assert (=> bm!4807 (= call!4810 (arrayBitRangesEq!0 lt!421129 (ite c!13276 (_3!1249 lt!421455) lt!421129) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13276 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7463 lt!421129)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun bm!4808 () Bool)

(assert (=> bm!4808 (= call!4811 (arrayBitRangesEq!0 (ite c!13276 lt!421129 lt!421451) (ite c!13276 (_3!1249 lt!421455) lt!421456) (ite c!13276 lt!421457 lt!421471) (ite c!13276 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!421466)))))

(assert (= (and d!98374 c!13276) b!290495))

(assert (= (and d!98374 (not c!13276)) b!290492))

(assert (= (and b!290495 res!239984) b!290499))

(assert (= (or b!290495 b!290492) bm!4808))

(assert (= (or b!290495 b!290492) bm!4807))

(assert (= (and d!98374 res!239986) b!290491))

(assert (= (and b!290491 res!239988) b!290497))

(assert (= (and b!290497 res!239985) b!290496))

(assert (= (and b!290496 (not res!239987)) b!290493))

(assert (= (and b!290496 res!239989) b!290498))

(assert (= (and b!290498 res!239983) b!290494))

(declare-fun m!424521 () Bool)

(assert (=> b!290498 m!424521))

(declare-fun m!424523 () Bool)

(assert (=> bm!4807 m!424523))

(declare-fun m!424525 () Bool)

(assert (=> d!98374 m!424525))

(declare-fun m!424527 () Bool)

(assert (=> d!98374 m!424527))

(declare-fun m!424529 () Bool)

(assert (=> b!290495 m!424529))

(declare-fun m!424531 () Bool)

(assert (=> b!290495 m!424531))

(declare-fun m!424533 () Bool)

(assert (=> b!290495 m!424533))

(declare-fun m!424535 () Bool)

(assert (=> b!290495 m!424535))

(declare-fun m!424537 () Bool)

(assert (=> b!290495 m!424537))

(declare-fun m!424539 () Bool)

(assert (=> b!290495 m!424539))

(declare-fun m!424541 () Bool)

(assert (=> b!290495 m!424541))

(declare-fun m!424543 () Bool)

(assert (=> b!290495 m!424543))

(declare-fun m!424545 () Bool)

(assert (=> b!290495 m!424545))

(declare-fun m!424547 () Bool)

(assert (=> b!290495 m!424547))

(declare-fun m!424549 () Bool)

(assert (=> b!290495 m!424549))

(declare-fun m!424551 () Bool)

(assert (=> b!290495 m!424551))

(declare-fun m!424553 () Bool)

(assert (=> b!290495 m!424553))

(declare-fun m!424555 () Bool)

(assert (=> b!290495 m!424555))

(declare-fun m!424557 () Bool)

(assert (=> b!290495 m!424557))

(declare-fun m!424559 () Bool)

(assert (=> b!290495 m!424559))

(assert (=> b!290495 m!424527))

(declare-fun m!424561 () Bool)

(assert (=> b!290495 m!424561))

(declare-fun m!424563 () Bool)

(assert (=> b!290497 m!424563))

(declare-fun m!424565 () Bool)

(assert (=> b!290492 m!424565))

(declare-fun m!424567 () Bool)

(assert (=> b!290492 m!424567))

(declare-fun m!424569 () Bool)

(assert (=> bm!4808 m!424569))

(declare-fun m!424571 () Bool)

(assert (=> b!290493 m!424571))

(declare-fun m!424573 () Bool)

(assert (=> b!290493 m!424573))

(declare-fun m!424575 () Bool)

(assert (=> b!290494 m!424575))

(declare-fun m!424577 () Bool)

(assert (=> b!290494 m!424577))

(assert (=> b!290326 d!98374))

(declare-fun d!98410 () Bool)

(declare-fun e!206921 () Bool)

(assert (=> d!98410 e!206921))

(declare-fun res!239999 () Bool)

(assert (=> d!98410 (=> (not res!239999) (not e!206921))))

(declare-fun lt!421522 () (_ BitVec 32))

(assert (=> d!98410 (= res!239999 (and (bvsge lt!421522 #b00000000000000000000000000000000) (bvslt lt!421522 (size!7463 arr!273))))))

(declare-fun lt!421521 () (_ BitVec 8))

(declare-fun lt!421523 () (_ BitVec 32))

(declare-fun lt!421524 () Unit!20167)

(declare-fun choose!53 (array!17239 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20167)

(assert (=> d!98410 (= lt!421524 (choose!53 arr!273 from!505 (_1!12649 lt!421127) lt!421522 lt!421523 lt!421521))))

(assert (=> d!98410 (= lt!421521 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8465 arr!273) lt!421522)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421523)))) ((_ sign_extend 24) (ite (_1!12649 lt!421127) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421523) #b00000000)))))))

(assert (=> d!98410 (= lt!421523 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!98410 (= lt!421522 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!98410 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12649 lt!421127)) lt!421524)))

(declare-fun b!290512 () Bool)

(assert (=> b!290512 (= e!206921 (arrayBitRangesEq!0 arr!273 (array!17240 (store (arr!8465 arr!273) lt!421522 lt!421521) (size!7463 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!98410 res!239999) b!290512))

(declare-fun m!424637 () Bool)

(assert (=> d!98410 m!424637))

(declare-fun m!424639 () Bool)

(assert (=> d!98410 m!424639))

(declare-fun m!424641 () Bool)

(assert (=> d!98410 m!424641))

(declare-fun m!424643 () Bool)

(assert (=> b!290512 m!424643))

(declare-fun m!424645 () Bool)

(assert (=> b!290512 m!424645))

(assert (=> b!290326 d!98410))

(declare-fun d!98414 () Bool)

(assert (=> d!98414 (arrayBitRangesEq!0 arr!273 (_3!1249 lt!421130) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!421527 () Unit!20167)

(declare-fun choose!49 (array!17239 array!17239 array!17239 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20167)

(assert (=> d!98414 (= lt!421527 (choose!49 arr!273 lt!421129 (_3!1249 lt!421130) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98414 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98414 (= (arrayBitRangesEqTransitive!0 arr!273 lt!421129 (_3!1249 lt!421130) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!421527)))

(declare-fun bs!25069 () Bool)

(assert (= bs!25069 d!98414))

(assert (=> bs!25069 m!424317))

(declare-fun m!424653 () Bool)

(assert (=> bs!25069 m!424653))

(assert (=> b!290326 d!98414))

(declare-fun d!98420 () Bool)

(assert (=> d!98420 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7463 (buf!7529 (_2!12649 lt!421127)))) ((_ sign_extend 32) (currentByte!13936 (_2!12649 lt!421127))) ((_ sign_extend 32) (currentBit!13931 (_2!12649 lt!421127))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7463 (buf!7529 (_2!12649 lt!421127)))) ((_ sign_extend 32) (currentByte!13936 (_2!12649 lt!421127))) ((_ sign_extend 32) (currentBit!13931 (_2!12649 lt!421127)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25070 () Bool)

(assert (= bs!25070 d!98420))

(declare-fun m!424655 () Bool)

(assert (=> bs!25070 m!424655))

(assert (=> b!290326 d!98420))

(declare-fun d!98422 () Bool)

(assert (=> d!98422 (= (array_inv!7075 (buf!7529 thiss!1728)) (bvsge (size!7463 (buf!7529 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!290327 d!98422))

(declare-fun d!98424 () Bool)

(assert (=> d!98424 (= (inv!12 thiss!1728) (invariant!0 (currentBit!13931 thiss!1728) (currentByte!13936 thiss!1728) (size!7463 (buf!7529 thiss!1728))))))

(declare-fun bs!25071 () Bool)

(assert (= bs!25071 d!98424))

(assert (=> bs!25071 m!424315))

(assert (=> start!64650 d!98424))

(declare-fun d!98426 () Bool)

(assert (=> d!98426 (= (array_inv!7075 arr!273) (bvsge (size!7463 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!64650 d!98426))

(declare-fun d!98428 () Bool)

(assert (=> d!98428 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7463 (buf!7529 thiss!1728))) ((_ sign_extend 32) (currentByte!13936 thiss!1728)) ((_ sign_extend 32) (currentBit!13931 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7463 (buf!7529 thiss!1728))) ((_ sign_extend 32) (currentByte!13936 thiss!1728)) ((_ sign_extend 32) (currentBit!13931 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25072 () Bool)

(assert (= bs!25072 d!98428))

(assert (=> bs!25072 m!424445))

(assert (=> b!290323 d!98428))

(check-sat (not b!290492) (not d!98356) (not d!98410) (not b!290382) (not d!98374) (not d!98348) (not b!290512) (not bm!4807) (not b!290372) (not b!290497) (not b!290378) (not d!98368) (not b!290355) (not d!98420) (not bm!4790) (not bm!4791) (not b!290379) (not b!290493) (not d!98414) (not d!98370) (not b!290375) (not d!98424) (not b!290495) (not b!290498) (not d!98350) (not b!290494) (not b!290390) (not bm!4808) (not b!290371) (not d!98428))
