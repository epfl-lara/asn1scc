; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56406 () Bool)

(assert start!56406)

(declare-fun b!260755 () Bool)

(declare-fun res!218287 () Bool)

(declare-fun e!181234 () Bool)

(assert (=> b!260755 (=> res!218287 e!181234)))

(declare-datatypes ((array!14354 0))(
  ( (array!14355 (arr!7262 (Array (_ BitVec 32) (_ BitVec 8))) (size!6275 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11472 0))(
  ( (BitStream!11473 (buf!6797 array!14354) (currentByte!12514 (_ BitVec 32)) (currentBit!12509 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18559 0))(
  ( (Unit!18560) )
))
(declare-datatypes ((tuple2!22348 0))(
  ( (tuple2!22349 (_1!12110 Unit!18559) (_2!12110 BitStream!11472)) )
))
(declare-fun lt!402883 () tuple2!22348)

(declare-fun thiss!914 () BitStream!11472)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!260755 (= res!218287 (not (= (bitIndex!0 (size!6275 (buf!6797 (_2!12110 lt!402883))) (currentByte!12514 (_2!12110 lt!402883)) (currentBit!12509 (_2!12110 lt!402883))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6275 (buf!6797 thiss!914)) (currentByte!12514 thiss!914) (currentBit!12509 thiss!914))))))))

(declare-fun b!260756 () Bool)

(declare-fun res!218286 () Bool)

(assert (=> b!260756 (=> res!218286 e!181234)))

(declare-fun isPrefixOf!0 (BitStream!11472 BitStream!11472) Bool)

(assert (=> b!260756 (= res!218286 (not (isPrefixOf!0 thiss!914 (_2!12110 lt!402883))))))

(declare-fun b!260757 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260757 (= e!181234 (invariant!0 (currentBit!12509 (_2!12110 lt!402883)) (currentByte!12514 (_2!12110 lt!402883)) (size!6275 (buf!6797 (_2!12110 lt!402883)))))))

(declare-fun res!218288 () Bool)

(declare-fun e!181236 () Bool)

(assert (=> start!56406 (=> (not res!218288) (not e!181236))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56406 (= res!218288 (validate_offset_bit!0 ((_ sign_extend 32) (size!6275 (buf!6797 thiss!914))) ((_ sign_extend 32) (currentByte!12514 thiss!914)) ((_ sign_extend 32) (currentBit!12509 thiss!914))))))

(assert (=> start!56406 e!181236))

(declare-fun e!181235 () Bool)

(declare-fun inv!12 (BitStream!11472) Bool)

(assert (=> start!56406 (and (inv!12 thiss!914) e!181235)))

(assert (=> start!56406 true))

(declare-fun b!260758 () Bool)

(declare-fun array_inv!6016 (array!14354) Bool)

(assert (=> b!260758 (= e!181235 (array_inv!6016 (buf!6797 thiss!914)))))

(declare-fun b!260759 () Bool)

(assert (=> b!260759 (= e!181236 (not e!181234))))

(declare-fun res!218285 () Bool)

(assert (=> b!260759 (=> res!218285 e!181234)))

(assert (=> b!260759 (= res!218285 (not (= (size!6275 (buf!6797 thiss!914)) (size!6275 (buf!6797 (_2!12110 lt!402883))))))))

(declare-fun lt!402884 () tuple2!22348)

(declare-fun increaseBitIndex!0 (BitStream!11472) tuple2!22348)

(assert (=> b!260759 (= lt!402883 (increaseBitIndex!0 (_2!12110 lt!402884)))))

(declare-fun arrayRangesEq!942 (array!14354 array!14354 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260759 (arrayRangesEq!942 (buf!6797 thiss!914) (array!14355 (store (arr!7262 (buf!6797 thiss!914)) (currentByte!12514 (_2!12110 lt!402884)) (select (arr!7262 (buf!6797 (_2!12110 lt!402884))) (currentByte!12514 (_2!12110 lt!402884)))) (size!6275 (buf!6797 thiss!914))) #b00000000000000000000000000000000 (currentByte!12514 (_2!12110 lt!402884)))))

(declare-fun lt!402882 () Unit!18559)

(declare-fun arrayUpdatedAtPrefixLemma!458 (array!14354 (_ BitVec 32) (_ BitVec 8)) Unit!18559)

(assert (=> b!260759 (= lt!402882 (arrayUpdatedAtPrefixLemma!458 (buf!6797 thiss!914) (currentByte!12514 (_2!12110 lt!402884)) (select (arr!7262 (buf!6797 (_2!12110 lt!402884))) (currentByte!12514 (_2!12110 lt!402884)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18561 () Unit!18559)

(declare-fun Unit!18562 () Unit!18559)

(assert (=> b!260759 (= lt!402884 (ite b!187 (tuple2!22349 Unit!18561 (BitStream!11473 (array!14355 (store (arr!7262 (buf!6797 thiss!914)) (currentByte!12514 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7262 (buf!6797 thiss!914)) (currentByte!12514 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12509 thiss!914)))))) (size!6275 (buf!6797 thiss!914))) (currentByte!12514 thiss!914) (currentBit!12509 thiss!914))) (tuple2!22349 Unit!18562 (BitStream!11473 (array!14355 (store (arr!7262 (buf!6797 thiss!914)) (currentByte!12514 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7262 (buf!6797 thiss!914)) (currentByte!12514 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12509 thiss!914))))))) (size!6275 (buf!6797 thiss!914))) (currentByte!12514 thiss!914) (currentBit!12509 thiss!914)))))))

(assert (= (and start!56406 res!218288) b!260759))

(assert (= (and b!260759 (not res!218285)) b!260755))

(assert (= (and b!260755 (not res!218287)) b!260756))

(assert (= (and b!260756 (not res!218286)) b!260757))

(assert (= start!56406 b!260758))

(declare-fun m!390273 () Bool)

(assert (=> b!260759 m!390273))

(declare-fun m!390275 () Bool)

(assert (=> b!260759 m!390275))

(declare-fun m!390277 () Bool)

(assert (=> b!260759 m!390277))

(declare-fun m!390279 () Bool)

(assert (=> b!260759 m!390279))

(assert (=> b!260759 m!390275))

(declare-fun m!390281 () Bool)

(assert (=> b!260759 m!390281))

(declare-fun m!390283 () Bool)

(assert (=> b!260759 m!390283))

(declare-fun m!390285 () Bool)

(assert (=> b!260759 m!390285))

(declare-fun m!390287 () Bool)

(assert (=> b!260759 m!390287))

(declare-fun m!390289 () Bool)

(assert (=> b!260759 m!390289))

(declare-fun m!390291 () Bool)

(assert (=> start!56406 m!390291))

(declare-fun m!390293 () Bool)

(assert (=> start!56406 m!390293))

(declare-fun m!390295 () Bool)

(assert (=> b!260757 m!390295))

(declare-fun m!390297 () Bool)

(assert (=> b!260755 m!390297))

(declare-fun m!390299 () Bool)

(assert (=> b!260755 m!390299))

(declare-fun m!390301 () Bool)

(assert (=> b!260756 m!390301))

(declare-fun m!390303 () Bool)

(assert (=> b!260758 m!390303))

(check-sat (not start!56406) (not b!260755) (not b!260757) (not b!260759) (not b!260756) (not b!260758))
(check-sat)
(get-model)

(declare-fun d!87628 () Bool)

(assert (=> d!87628 (= (array_inv!6016 (buf!6797 thiss!914)) (bvsge (size!6275 (buf!6797 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!260758 d!87628))

(declare-fun d!87632 () Bool)

(declare-fun e!181268 () Bool)

(assert (=> d!87632 e!181268))

(declare-fun res!218332 () Bool)

(assert (=> d!87632 (=> (not res!218332) (not e!181268))))

(declare-fun lt!402930 () tuple2!22348)

(declare-fun lt!402928 () (_ BitVec 64))

(declare-fun lt!402931 () (_ BitVec 64))

(assert (=> d!87632 (= res!218332 (= (bvadd lt!402931 lt!402928) (bitIndex!0 (size!6275 (buf!6797 (_2!12110 lt!402930))) (currentByte!12514 (_2!12110 lt!402930)) (currentBit!12509 (_2!12110 lt!402930)))))))

(assert (=> d!87632 (or (not (= (bvand lt!402931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402928 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402931 lt!402928) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87632 (= lt!402928 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!87632 (= lt!402931 (bitIndex!0 (size!6275 (buf!6797 (_2!12110 lt!402884))) (currentByte!12514 (_2!12110 lt!402884)) (currentBit!12509 (_2!12110 lt!402884))))))

(declare-fun Unit!18567 () Unit!18559)

(declare-fun Unit!18568 () Unit!18559)

(assert (=> d!87632 (= lt!402930 (ite (bvslt (currentBit!12509 (_2!12110 lt!402884)) #b00000000000000000000000000000111) (tuple2!22349 Unit!18567 (BitStream!11473 (buf!6797 (_2!12110 lt!402884)) (currentByte!12514 (_2!12110 lt!402884)) (bvadd (currentBit!12509 (_2!12110 lt!402884)) #b00000000000000000000000000000001))) (tuple2!22349 Unit!18568 (BitStream!11473 (buf!6797 (_2!12110 lt!402884)) (bvadd (currentByte!12514 (_2!12110 lt!402884)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87632 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6275 (buf!6797 (_2!12110 lt!402884)))) ((_ sign_extend 32) (currentByte!12514 (_2!12110 lt!402884))) ((_ sign_extend 32) (currentBit!12509 (_2!12110 lt!402884)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!87632 (= (increaseBitIndex!0 (_2!12110 lt!402884)) lt!402930)))

(declare-fun b!260805 () Bool)

(declare-fun res!218331 () Bool)

(assert (=> b!260805 (=> (not res!218331) (not e!181268))))

(declare-fun lt!402929 () (_ BitVec 64))

(declare-fun lt!402932 () (_ BitVec 64))

(assert (=> b!260805 (= res!218331 (= (bvsub lt!402929 lt!402932) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!260805 (or (= (bvand lt!402929 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402932 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402929 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402929 lt!402932) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260805 (= lt!402932 (remainingBits!0 ((_ sign_extend 32) (size!6275 (buf!6797 (_2!12110 lt!402930)))) ((_ sign_extend 32) (currentByte!12514 (_2!12110 lt!402930))) ((_ sign_extend 32) (currentBit!12509 (_2!12110 lt!402930)))))))

(assert (=> b!260805 (= lt!402929 (remainingBits!0 ((_ sign_extend 32) (size!6275 (buf!6797 (_2!12110 lt!402884)))) ((_ sign_extend 32) (currentByte!12514 (_2!12110 lt!402884))) ((_ sign_extend 32) (currentBit!12509 (_2!12110 lt!402884)))))))

(declare-fun b!260806 () Bool)

(assert (=> b!260806 (= e!181268 (= (size!6275 (buf!6797 (_2!12110 lt!402884))) (size!6275 (buf!6797 (_2!12110 lt!402930)))))))

(assert (= (and d!87632 res!218332) b!260805))

(assert (= (and b!260805 res!218331) b!260806))

(declare-fun m!390351 () Bool)

(assert (=> d!87632 m!390351))

(declare-fun m!390353 () Bool)

(assert (=> d!87632 m!390353))

(declare-fun m!390355 () Bool)

(assert (=> d!87632 m!390355))

(declare-fun m!390357 () Bool)

(assert (=> b!260805 m!390357))

(assert (=> b!260805 m!390355))

(assert (=> b!260759 d!87632))

(declare-fun d!87656 () Bool)

(declare-fun res!218337 () Bool)

(declare-fun e!181273 () Bool)

(assert (=> d!87656 (=> res!218337 e!181273)))

(assert (=> d!87656 (= res!218337 (= #b00000000000000000000000000000000 (currentByte!12514 (_2!12110 lt!402884))))))

(assert (=> d!87656 (= (arrayRangesEq!942 (buf!6797 thiss!914) (array!14355 (store (arr!7262 (buf!6797 thiss!914)) (currentByte!12514 (_2!12110 lt!402884)) (select (arr!7262 (buf!6797 (_2!12110 lt!402884))) (currentByte!12514 (_2!12110 lt!402884)))) (size!6275 (buf!6797 thiss!914))) #b00000000000000000000000000000000 (currentByte!12514 (_2!12110 lt!402884))) e!181273)))

(declare-fun b!260811 () Bool)

(declare-fun e!181274 () Bool)

(assert (=> b!260811 (= e!181273 e!181274)))

(declare-fun res!218338 () Bool)

(assert (=> b!260811 (=> (not res!218338) (not e!181274))))

(assert (=> b!260811 (= res!218338 (= (select (arr!7262 (buf!6797 thiss!914)) #b00000000000000000000000000000000) (select (arr!7262 (array!14355 (store (arr!7262 (buf!6797 thiss!914)) (currentByte!12514 (_2!12110 lt!402884)) (select (arr!7262 (buf!6797 (_2!12110 lt!402884))) (currentByte!12514 (_2!12110 lt!402884)))) (size!6275 (buf!6797 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!260812 () Bool)

(assert (=> b!260812 (= e!181274 (arrayRangesEq!942 (buf!6797 thiss!914) (array!14355 (store (arr!7262 (buf!6797 thiss!914)) (currentByte!12514 (_2!12110 lt!402884)) (select (arr!7262 (buf!6797 (_2!12110 lt!402884))) (currentByte!12514 (_2!12110 lt!402884)))) (size!6275 (buf!6797 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12514 (_2!12110 lt!402884))))))

(assert (= (and d!87656 (not res!218337)) b!260811))

(assert (= (and b!260811 res!218338) b!260812))

(declare-fun m!390359 () Bool)

(assert (=> b!260811 m!390359))

(declare-fun m!390361 () Bool)

(assert (=> b!260811 m!390361))

(declare-fun m!390363 () Bool)

(assert (=> b!260812 m!390363))

(assert (=> b!260759 d!87656))

(declare-fun d!87658 () Bool)

(declare-fun e!181282 () Bool)

(assert (=> d!87658 e!181282))

(declare-fun res!218351 () Bool)

(assert (=> d!87658 (=> (not res!218351) (not e!181282))))

(assert (=> d!87658 (= res!218351 (and (bvsge (currentByte!12514 (_2!12110 lt!402884)) #b00000000000000000000000000000000) (bvslt (currentByte!12514 (_2!12110 lt!402884)) (size!6275 (buf!6797 thiss!914)))))))

(declare-fun lt!402960 () Unit!18559)

(declare-fun choose!351 (array!14354 (_ BitVec 32) (_ BitVec 8)) Unit!18559)

(assert (=> d!87658 (= lt!402960 (choose!351 (buf!6797 thiss!914) (currentByte!12514 (_2!12110 lt!402884)) (select (arr!7262 (buf!6797 (_2!12110 lt!402884))) (currentByte!12514 (_2!12110 lt!402884)))))))

(assert (=> d!87658 (and (bvsle #b00000000000000000000000000000000 (currentByte!12514 (_2!12110 lt!402884))) (bvslt (currentByte!12514 (_2!12110 lt!402884)) (size!6275 (buf!6797 thiss!914))))))

(assert (=> d!87658 (= (arrayUpdatedAtPrefixLemma!458 (buf!6797 thiss!914) (currentByte!12514 (_2!12110 lt!402884)) (select (arr!7262 (buf!6797 (_2!12110 lt!402884))) (currentByte!12514 (_2!12110 lt!402884)))) lt!402960)))

(declare-fun b!260825 () Bool)

(assert (=> b!260825 (= e!181282 (arrayRangesEq!942 (buf!6797 thiss!914) (array!14355 (store (arr!7262 (buf!6797 thiss!914)) (currentByte!12514 (_2!12110 lt!402884)) (select (arr!7262 (buf!6797 (_2!12110 lt!402884))) (currentByte!12514 (_2!12110 lt!402884)))) (size!6275 (buf!6797 thiss!914))) #b00000000000000000000000000000000 (currentByte!12514 (_2!12110 lt!402884))))))

(assert (= (and d!87658 res!218351) b!260825))

(assert (=> d!87658 m!390275))

(declare-fun m!390373 () Bool)

(assert (=> d!87658 m!390373))

(assert (=> b!260825 m!390279))

(assert (=> b!260825 m!390287))

(assert (=> b!260759 d!87658))

(declare-fun d!87662 () Bool)

(declare-fun e!181304 () Bool)

(assert (=> d!87662 e!181304))

(declare-fun res!218377 () Bool)

(assert (=> d!87662 (=> (not res!218377) (not e!181304))))

(declare-fun lt!402987 () (_ BitVec 64))

(declare-fun lt!402989 () (_ BitVec 64))

(declare-fun lt!402986 () (_ BitVec 64))

(assert (=> d!87662 (= res!218377 (= lt!402987 (bvsub lt!402986 lt!402989)))))

(assert (=> d!87662 (or (= (bvand lt!402986 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402989 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402986 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402986 lt!402989) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87662 (= lt!402989 (remainingBits!0 ((_ sign_extend 32) (size!6275 (buf!6797 (_2!12110 lt!402883)))) ((_ sign_extend 32) (currentByte!12514 (_2!12110 lt!402883))) ((_ sign_extend 32) (currentBit!12509 (_2!12110 lt!402883)))))))

(declare-fun lt!402985 () (_ BitVec 64))

(declare-fun lt!402984 () (_ BitVec 64))

(assert (=> d!87662 (= lt!402986 (bvmul lt!402985 lt!402984))))

(assert (=> d!87662 (or (= lt!402985 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!402984 (bvsdiv (bvmul lt!402985 lt!402984) lt!402985)))))

(assert (=> d!87662 (= lt!402984 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87662 (= lt!402985 ((_ sign_extend 32) (size!6275 (buf!6797 (_2!12110 lt!402883)))))))

(assert (=> d!87662 (= lt!402987 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12514 (_2!12110 lt!402883))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12509 (_2!12110 lt!402883)))))))

(assert (=> d!87662 (invariant!0 (currentBit!12509 (_2!12110 lt!402883)) (currentByte!12514 (_2!12110 lt!402883)) (size!6275 (buf!6797 (_2!12110 lt!402883))))))

(assert (=> d!87662 (= (bitIndex!0 (size!6275 (buf!6797 (_2!12110 lt!402883))) (currentByte!12514 (_2!12110 lt!402883)) (currentBit!12509 (_2!12110 lt!402883))) lt!402987)))

(declare-fun b!260850 () Bool)

(declare-fun res!218376 () Bool)

(assert (=> b!260850 (=> (not res!218376) (not e!181304))))

(assert (=> b!260850 (= res!218376 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!402987))))

(declare-fun b!260851 () Bool)

(declare-fun lt!402988 () (_ BitVec 64))

(assert (=> b!260851 (= e!181304 (bvsle lt!402987 (bvmul lt!402988 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!260851 (or (= lt!402988 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!402988 #b0000000000000000000000000000000000000000000000000000000000001000) lt!402988)))))

(assert (=> b!260851 (= lt!402988 ((_ sign_extend 32) (size!6275 (buf!6797 (_2!12110 lt!402883)))))))

(assert (= (and d!87662 res!218377) b!260850))

(assert (= (and b!260850 res!218376) b!260851))

(declare-fun m!390399 () Bool)

(assert (=> d!87662 m!390399))

(assert (=> d!87662 m!390295))

(assert (=> b!260755 d!87662))

(declare-fun d!87672 () Bool)

(declare-fun e!181305 () Bool)

(assert (=> d!87672 e!181305))

(declare-fun res!218379 () Bool)

(assert (=> d!87672 (=> (not res!218379) (not e!181305))))

(declare-fun lt!402992 () (_ BitVec 64))

(declare-fun lt!402993 () (_ BitVec 64))

(declare-fun lt!402995 () (_ BitVec 64))

(assert (=> d!87672 (= res!218379 (= lt!402993 (bvsub lt!402992 lt!402995)))))

(assert (=> d!87672 (or (= (bvand lt!402992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402995 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402992 lt!402995) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87672 (= lt!402995 (remainingBits!0 ((_ sign_extend 32) (size!6275 (buf!6797 thiss!914))) ((_ sign_extend 32) (currentByte!12514 thiss!914)) ((_ sign_extend 32) (currentBit!12509 thiss!914))))))

(declare-fun lt!402991 () (_ BitVec 64))

(declare-fun lt!402990 () (_ BitVec 64))

(assert (=> d!87672 (= lt!402992 (bvmul lt!402991 lt!402990))))

(assert (=> d!87672 (or (= lt!402991 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!402990 (bvsdiv (bvmul lt!402991 lt!402990) lt!402991)))))

(assert (=> d!87672 (= lt!402990 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87672 (= lt!402991 ((_ sign_extend 32) (size!6275 (buf!6797 thiss!914))))))

(assert (=> d!87672 (= lt!402993 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12514 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12509 thiss!914))))))

(assert (=> d!87672 (invariant!0 (currentBit!12509 thiss!914) (currentByte!12514 thiss!914) (size!6275 (buf!6797 thiss!914)))))

(assert (=> d!87672 (= (bitIndex!0 (size!6275 (buf!6797 thiss!914)) (currentByte!12514 thiss!914) (currentBit!12509 thiss!914)) lt!402993)))

(declare-fun b!260852 () Bool)

(declare-fun res!218378 () Bool)

(assert (=> b!260852 (=> (not res!218378) (not e!181305))))

(assert (=> b!260852 (= res!218378 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!402993))))

(declare-fun b!260853 () Bool)

(declare-fun lt!402994 () (_ BitVec 64))

(assert (=> b!260853 (= e!181305 (bvsle lt!402993 (bvmul lt!402994 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!260853 (or (= lt!402994 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!402994 #b0000000000000000000000000000000000000000000000000000000000001000) lt!402994)))))

(assert (=> b!260853 (= lt!402994 ((_ sign_extend 32) (size!6275 (buf!6797 thiss!914))))))

(assert (= (and d!87672 res!218379) b!260852))

(assert (= (and b!260852 res!218378) b!260853))

(declare-fun m!390401 () Bool)

(assert (=> d!87672 m!390401))

(declare-fun m!390403 () Bool)

(assert (=> d!87672 m!390403))

(assert (=> b!260755 d!87672))

(declare-fun d!87674 () Bool)

(declare-fun res!218390 () Bool)

(declare-fun e!181313 () Bool)

(assert (=> d!87674 (=> (not res!218390) (not e!181313))))

(assert (=> d!87674 (= res!218390 (= (size!6275 (buf!6797 thiss!914)) (size!6275 (buf!6797 (_2!12110 lt!402883)))))))

(assert (=> d!87674 (= (isPrefixOf!0 thiss!914 (_2!12110 lt!402883)) e!181313)))

(declare-fun b!260860 () Bool)

(declare-fun res!218389 () Bool)

(assert (=> b!260860 (=> (not res!218389) (not e!181313))))

(assert (=> b!260860 (= res!218389 (bvsle (bitIndex!0 (size!6275 (buf!6797 thiss!914)) (currentByte!12514 thiss!914) (currentBit!12509 thiss!914)) (bitIndex!0 (size!6275 (buf!6797 (_2!12110 lt!402883))) (currentByte!12514 (_2!12110 lt!402883)) (currentBit!12509 (_2!12110 lt!402883)))))))

(declare-fun b!260861 () Bool)

(declare-fun e!181312 () Bool)

(assert (=> b!260861 (= e!181313 e!181312)))

(declare-fun res!218388 () Bool)

(assert (=> b!260861 (=> res!218388 e!181312)))

(assert (=> b!260861 (= res!218388 (= (size!6275 (buf!6797 thiss!914)) #b00000000000000000000000000000000))))

(declare-fun b!260862 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14354 array!14354 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260862 (= e!181312 (arrayBitRangesEq!0 (buf!6797 thiss!914) (buf!6797 (_2!12110 lt!402883)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6275 (buf!6797 thiss!914)) (currentByte!12514 thiss!914) (currentBit!12509 thiss!914))))))

(assert (= (and d!87674 res!218390) b!260860))

(assert (= (and b!260860 res!218389) b!260861))

(assert (= (and b!260861 (not res!218388)) b!260862))

(assert (=> b!260860 m!390299))

(assert (=> b!260860 m!390297))

(assert (=> b!260862 m!390299))

(assert (=> b!260862 m!390299))

(declare-fun m!390405 () Bool)

(assert (=> b!260862 m!390405))

(assert (=> b!260756 d!87674))

(declare-fun d!87676 () Bool)

(assert (=> d!87676 (= (invariant!0 (currentBit!12509 (_2!12110 lt!402883)) (currentByte!12514 (_2!12110 lt!402883)) (size!6275 (buf!6797 (_2!12110 lt!402883)))) (and (bvsge (currentBit!12509 (_2!12110 lt!402883)) #b00000000000000000000000000000000) (bvslt (currentBit!12509 (_2!12110 lt!402883)) #b00000000000000000000000000001000) (bvsge (currentByte!12514 (_2!12110 lt!402883)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12514 (_2!12110 lt!402883)) (size!6275 (buf!6797 (_2!12110 lt!402883)))) (and (= (currentBit!12509 (_2!12110 lt!402883)) #b00000000000000000000000000000000) (= (currentByte!12514 (_2!12110 lt!402883)) (size!6275 (buf!6797 (_2!12110 lt!402883))))))))))

(assert (=> b!260757 d!87676))

(declare-fun d!87678 () Bool)

(assert (=> d!87678 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6275 (buf!6797 thiss!914))) ((_ sign_extend 32) (currentByte!12514 thiss!914)) ((_ sign_extend 32) (currentBit!12509 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6275 (buf!6797 thiss!914))) ((_ sign_extend 32) (currentByte!12514 thiss!914)) ((_ sign_extend 32) (currentBit!12509 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22210 () Bool)

(assert (= bs!22210 d!87678))

(assert (=> bs!22210 m!390401))

(assert (=> start!56406 d!87678))

(declare-fun d!87682 () Bool)

(assert (=> d!87682 (= (inv!12 thiss!914) (invariant!0 (currentBit!12509 thiss!914) (currentByte!12514 thiss!914) (size!6275 (buf!6797 thiss!914))))))

(declare-fun bs!22211 () Bool)

(assert (= bs!22211 d!87682))

(assert (=> bs!22211 m!390403))

(assert (=> start!56406 d!87682))

(check-sat (not d!87678) (not b!260862) (not d!87682) (not b!260805) (not d!87658) (not d!87662) (not b!260860) (not b!260812) (not b!260825) (not d!87632) (not d!87672))
