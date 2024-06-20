; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65418 () Bool)

(assert start!65418)

(declare-fun res!242344 () Bool)

(declare-fun e!209627 () Bool)

(assert (=> start!65418 (=> (not res!242344) (not e!209627))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17545 0))(
  ( (array!17546 (arr!8630 (Array (_ BitVec 32) (_ BitVec 8))) (size!7604 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17545)

(assert (=> start!65418 (= res!242344 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7604 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65418 e!209627))

(declare-datatypes ((BitStream!13212 0))(
  ( (BitStream!13213 (buf!7667 array!17545) (currentByte!14134 (_ BitVec 32)) (currentBit!14129 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13212)

(declare-fun e!209630 () Bool)

(declare-fun inv!12 (BitStream!13212) Bool)

(assert (=> start!65418 (and (inv!12 thiss!1728) e!209630)))

(assert (=> start!65418 true))

(declare-fun array_inv!7216 (array!17545) Bool)

(assert (=> start!65418 (array_inv!7216 arr!273)))

(declare-fun b!293480 () Bool)

(declare-fun res!242342 () Bool)

(assert (=> b!293480 (=> (not res!242342) (not e!209627))))

(assert (=> b!293480 (= res!242342 (bvslt from!505 to!474))))

(declare-fun b!293481 () Bool)

(declare-fun e!209629 () Bool)

(declare-datatypes ((tuple2!23040 0))(
  ( (tuple2!23041 (_1!12825 Bool) (_2!12825 BitStream!13212)) )
))
(declare-fun lt!425361 () tuple2!23040)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!293481 (= e!209629 (bvsgt (bitIndex!0 (size!7604 (buf!7667 (_2!12825 lt!425361))) (currentByte!14134 (_2!12825 lt!425361)) (currentBit!14129 (_2!12825 lt!425361))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!7604 (buf!7667 thiss!1728)) (currentByte!14134 thiss!1728) (currentBit!14129 thiss!1728)))))))

(declare-fun b!293482 () Bool)

(assert (=> b!293482 (= e!209627 e!209629)))

(declare-fun res!242345 () Bool)

(assert (=> b!293482 (=> (not res!242345) (not e!209629))))

(assert (=> b!293482 (= res!242345 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)) (= (size!7604 (buf!7667 thiss!1728)) (size!7604 (buf!7667 (_2!12825 lt!425361))))))))

(declare-fun readBit!0 (BitStream!13212) tuple2!23040)

(assert (=> b!293482 (= lt!425361 (readBit!0 thiss!1728))))

(declare-fun b!293483 () Bool)

(declare-fun res!242343 () Bool)

(assert (=> b!293483 (=> (not res!242343) (not e!209627))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293483 (= res!242343 (validate_offset_bits!1 ((_ sign_extend 32) (size!7604 (buf!7667 thiss!1728))) ((_ sign_extend 32) (currentByte!14134 thiss!1728)) ((_ sign_extend 32) (currentBit!14129 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293484 () Bool)

(assert (=> b!293484 (= e!209630 (array_inv!7216 (buf!7667 thiss!1728)))))

(assert (= (and start!65418 res!242344) b!293483))

(assert (= (and b!293483 res!242343) b!293480))

(assert (= (and b!293480 res!242342) b!293482))

(assert (= (and b!293482 res!242345) b!293481))

(assert (= start!65418 b!293484))

(declare-fun m!429003 () Bool)

(assert (=> b!293481 m!429003))

(declare-fun m!429005 () Bool)

(assert (=> b!293481 m!429005))

(declare-fun m!429007 () Bool)

(assert (=> b!293483 m!429007))

(declare-fun m!429009 () Bool)

(assert (=> start!65418 m!429009))

(declare-fun m!429011 () Bool)

(assert (=> start!65418 m!429011))

(declare-fun m!429013 () Bool)

(assert (=> b!293482 m!429013))

(declare-fun m!429015 () Bool)

(assert (=> b!293484 m!429015))

(check-sat (not b!293481) (not b!293482) (not b!293484) (not b!293483) (not start!65418))
(check-sat)
(get-model)

(declare-fun d!99088 () Bool)

(assert (=> d!99088 (= (array_inv!7216 (buf!7667 thiss!1728)) (bvsge (size!7604 (buf!7667 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!293484 d!99088))

(declare-fun d!99090 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99090 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7604 (buf!7667 thiss!1728))) ((_ sign_extend 32) (currentByte!14134 thiss!1728)) ((_ sign_extend 32) (currentBit!14129 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7604 (buf!7667 thiss!1728))) ((_ sign_extend 32) (currentByte!14134 thiss!1728)) ((_ sign_extend 32) (currentBit!14129 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25335 () Bool)

(assert (= bs!25335 d!99090))

(declare-fun m!429031 () Bool)

(assert (=> bs!25335 m!429031))

(assert (=> b!293483 d!99090))

(declare-fun d!99092 () Bool)

(declare-fun e!209649 () Bool)

(assert (=> d!99092 e!209649))

(declare-fun res!242362 () Bool)

(assert (=> d!99092 (=> (not res!242362) (not e!209649))))

(declare-fun lt!425378 () (_ BitVec 64))

(declare-fun lt!425381 () (_ BitVec 64))

(declare-fun lt!425377 () (_ BitVec 64))

(assert (=> d!99092 (= res!242362 (= lt!425377 (bvsub lt!425378 lt!425381)))))

(assert (=> d!99092 (or (= (bvand lt!425378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!425381 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!425378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!425378 lt!425381) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99092 (= lt!425381 (remainingBits!0 ((_ sign_extend 32) (size!7604 (buf!7667 (_2!12825 lt!425361)))) ((_ sign_extend 32) (currentByte!14134 (_2!12825 lt!425361))) ((_ sign_extend 32) (currentBit!14129 (_2!12825 lt!425361)))))))

(declare-fun lt!425379 () (_ BitVec 64))

(declare-fun lt!425382 () (_ BitVec 64))

(assert (=> d!99092 (= lt!425378 (bvmul lt!425379 lt!425382))))

(assert (=> d!99092 (or (= lt!425379 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!425382 (bvsdiv (bvmul lt!425379 lt!425382) lt!425379)))))

(assert (=> d!99092 (= lt!425382 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99092 (= lt!425379 ((_ sign_extend 32) (size!7604 (buf!7667 (_2!12825 lt!425361)))))))

(assert (=> d!99092 (= lt!425377 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14134 (_2!12825 lt!425361))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14129 (_2!12825 lt!425361)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!99092 (invariant!0 (currentBit!14129 (_2!12825 lt!425361)) (currentByte!14134 (_2!12825 lt!425361)) (size!7604 (buf!7667 (_2!12825 lt!425361))))))

(assert (=> d!99092 (= (bitIndex!0 (size!7604 (buf!7667 (_2!12825 lt!425361))) (currentByte!14134 (_2!12825 lt!425361)) (currentBit!14129 (_2!12825 lt!425361))) lt!425377)))

(declare-fun b!293504 () Bool)

(declare-fun res!242363 () Bool)

(assert (=> b!293504 (=> (not res!242363) (not e!209649))))

(assert (=> b!293504 (= res!242363 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!425377))))

(declare-fun b!293505 () Bool)

(declare-fun lt!425380 () (_ BitVec 64))

(assert (=> b!293505 (= e!209649 (bvsle lt!425377 (bvmul lt!425380 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!293505 (or (= lt!425380 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!425380 #b0000000000000000000000000000000000000000000000000000000000001000) lt!425380)))))

(assert (=> b!293505 (= lt!425380 ((_ sign_extend 32) (size!7604 (buf!7667 (_2!12825 lt!425361)))))))

(assert (= (and d!99092 res!242362) b!293504))

(assert (= (and b!293504 res!242363) b!293505))

(declare-fun m!429033 () Bool)

(assert (=> d!99092 m!429033))

(declare-fun m!429035 () Bool)

(assert (=> d!99092 m!429035))

(assert (=> b!293481 d!99092))

(declare-fun d!99094 () Bool)

(declare-fun e!209650 () Bool)

(assert (=> d!99094 e!209650))

(declare-fun res!242364 () Bool)

(assert (=> d!99094 (=> (not res!242364) (not e!209650))))

(declare-fun lt!425387 () (_ BitVec 64))

(declare-fun lt!425384 () (_ BitVec 64))

(declare-fun lt!425383 () (_ BitVec 64))

(assert (=> d!99094 (= res!242364 (= lt!425383 (bvsub lt!425384 lt!425387)))))

(assert (=> d!99094 (or (= (bvand lt!425384 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!425387 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!425384 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!425384 lt!425387) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99094 (= lt!425387 (remainingBits!0 ((_ sign_extend 32) (size!7604 (buf!7667 thiss!1728))) ((_ sign_extend 32) (currentByte!14134 thiss!1728)) ((_ sign_extend 32) (currentBit!14129 thiss!1728))))))

(declare-fun lt!425385 () (_ BitVec 64))

(declare-fun lt!425388 () (_ BitVec 64))

(assert (=> d!99094 (= lt!425384 (bvmul lt!425385 lt!425388))))

(assert (=> d!99094 (or (= lt!425385 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!425388 (bvsdiv (bvmul lt!425385 lt!425388) lt!425385)))))

(assert (=> d!99094 (= lt!425388 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99094 (= lt!425385 ((_ sign_extend 32) (size!7604 (buf!7667 thiss!1728))))))

(assert (=> d!99094 (= lt!425383 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14134 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14129 thiss!1728))))))

(assert (=> d!99094 (invariant!0 (currentBit!14129 thiss!1728) (currentByte!14134 thiss!1728) (size!7604 (buf!7667 thiss!1728)))))

(assert (=> d!99094 (= (bitIndex!0 (size!7604 (buf!7667 thiss!1728)) (currentByte!14134 thiss!1728) (currentBit!14129 thiss!1728)) lt!425383)))

(declare-fun b!293506 () Bool)

(declare-fun res!242365 () Bool)

(assert (=> b!293506 (=> (not res!242365) (not e!209650))))

(assert (=> b!293506 (= res!242365 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!425383))))

(declare-fun b!293507 () Bool)

(declare-fun lt!425386 () (_ BitVec 64))

(assert (=> b!293507 (= e!209650 (bvsle lt!425383 (bvmul lt!425386 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!293507 (or (= lt!425386 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!425386 #b0000000000000000000000000000000000000000000000000000000000001000) lt!425386)))))

(assert (=> b!293507 (= lt!425386 ((_ sign_extend 32) (size!7604 (buf!7667 thiss!1728))))))

(assert (= (and d!99094 res!242364) b!293506))

(assert (= (and b!293506 res!242365) b!293507))

(assert (=> d!99094 m!429031))

(declare-fun m!429037 () Bool)

(assert (=> d!99094 m!429037))

(assert (=> b!293481 d!99094))

(declare-fun d!99096 () Bool)

(assert (=> d!99096 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14129 thiss!1728) (currentByte!14134 thiss!1728) (size!7604 (buf!7667 thiss!1728))))))

(declare-fun bs!25336 () Bool)

(assert (= bs!25336 d!99096))

(assert (=> bs!25336 m!429037))

(assert (=> start!65418 d!99096))

(declare-fun d!99098 () Bool)

(assert (=> d!99098 (= (array_inv!7216 arr!273) (bvsge (size!7604 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65418 d!99098))

(declare-fun d!99100 () Bool)

(declare-fun e!209657 () Bool)

(assert (=> d!99100 e!209657))

(declare-fun res!242368 () Bool)

(assert (=> d!99100 (=> (not res!242368) (not e!209657))))

(declare-datatypes ((Unit!20395 0))(
  ( (Unit!20396) )
))
(declare-datatypes ((tuple2!23044 0))(
  ( (tuple2!23045 (_1!12827 Unit!20395) (_2!12827 BitStream!13212)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13212) tuple2!23044)

(assert (=> d!99100 (= res!242368 (= (buf!7667 (_2!12827 (increaseBitIndex!0 thiss!1728))) (buf!7667 thiss!1728)))))

(declare-fun lt!425403 () Bool)

(assert (=> d!99100 (= lt!425403 (not (= (bvand ((_ sign_extend 24) (select (arr!8630 (buf!7667 thiss!1728)) (currentByte!14134 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14129 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!425405 () tuple2!23040)

(assert (=> d!99100 (= lt!425405 (tuple2!23041 (not (= (bvand ((_ sign_extend 24) (select (arr!8630 (buf!7667 thiss!1728)) (currentByte!14134 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14129 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12827 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!99100 (validate_offset_bit!0 ((_ sign_extend 32) (size!7604 (buf!7667 thiss!1728))) ((_ sign_extend 32) (currentByte!14134 thiss!1728)) ((_ sign_extend 32) (currentBit!14129 thiss!1728)))))

(assert (=> d!99100 (= (readBit!0 thiss!1728) lt!425405)))

(declare-fun lt!425406 () (_ BitVec 64))

(declare-fun lt!425404 () (_ BitVec 64))

(declare-fun b!293510 () Bool)

(assert (=> b!293510 (= e!209657 (= (bitIndex!0 (size!7604 (buf!7667 (_2!12827 (increaseBitIndex!0 thiss!1728)))) (currentByte!14134 (_2!12827 (increaseBitIndex!0 thiss!1728))) (currentBit!14129 (_2!12827 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!425406 lt!425404)))))

(assert (=> b!293510 (or (not (= (bvand lt!425406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!425404 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!425406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!425406 lt!425404) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!293510 (= lt!425404 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!293510 (= lt!425406 (bitIndex!0 (size!7604 (buf!7667 thiss!1728)) (currentByte!14134 thiss!1728) (currentBit!14129 thiss!1728)))))

(declare-fun lt!425409 () Bool)

(assert (=> b!293510 (= lt!425409 (not (= (bvand ((_ sign_extend 24) (select (arr!8630 (buf!7667 thiss!1728)) (currentByte!14134 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14129 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!425408 () Bool)

(assert (=> b!293510 (= lt!425408 (not (= (bvand ((_ sign_extend 24) (select (arr!8630 (buf!7667 thiss!1728)) (currentByte!14134 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14129 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!425407 () Bool)

(assert (=> b!293510 (= lt!425407 (not (= (bvand ((_ sign_extend 24) (select (arr!8630 (buf!7667 thiss!1728)) (currentByte!14134 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14129 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!99100 res!242368) b!293510))

(declare-fun m!429039 () Bool)

(assert (=> d!99100 m!429039))

(declare-fun m!429041 () Bool)

(assert (=> d!99100 m!429041))

(declare-fun m!429043 () Bool)

(assert (=> d!99100 m!429043))

(declare-fun m!429045 () Bool)

(assert (=> d!99100 m!429045))

(assert (=> b!293510 m!429039))

(assert (=> b!293510 m!429043))

(assert (=> b!293510 m!429005))

(declare-fun m!429047 () Bool)

(assert (=> b!293510 m!429047))

(assert (=> b!293510 m!429041))

(assert (=> b!293482 d!99100))

(check-sat (not b!293510) (not d!99092) (not d!99096) (not d!99090) (not d!99100) (not d!99094))
(check-sat)
