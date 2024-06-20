; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56408 () Bool)

(assert start!56408)

(declare-fun b!260771 () Bool)

(declare-fun e!181247 () Bool)

(declare-datatypes ((array!14356 0))(
  ( (array!14357 (arr!7263 (Array (_ BitVec 32) (_ BitVec 8))) (size!6276 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11474 0))(
  ( (BitStream!11475 (buf!6798 array!14356) (currentByte!12515 (_ BitVec 32)) (currentBit!12510 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11474)

(declare-fun array_inv!6017 (array!14356) Bool)

(assert (=> b!260771 (= e!181247 (array_inv!6017 (buf!6798 thiss!914)))))

(declare-fun b!260772 () Bool)

(declare-fun res!218297 () Bool)

(declare-fun e!181248 () Bool)

(assert (=> b!260772 (=> res!218297 e!181248)))

(declare-datatypes ((Unit!18563 0))(
  ( (Unit!18564) )
))
(declare-datatypes ((tuple2!22350 0))(
  ( (tuple2!22351 (_1!12111 Unit!18563) (_2!12111 BitStream!11474)) )
))
(declare-fun lt!402892 () tuple2!22350)

(declare-fun isPrefixOf!0 (BitStream!11474 BitStream!11474) Bool)

(assert (=> b!260772 (= res!218297 (not (isPrefixOf!0 thiss!914 (_2!12111 lt!402892))))))

(declare-fun b!260770 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260770 (= e!181248 (invariant!0 (currentBit!12510 (_2!12111 lt!402892)) (currentByte!12515 (_2!12111 lt!402892)) (size!6276 (buf!6798 (_2!12111 lt!402892)))))))

(declare-fun res!218298 () Bool)

(declare-fun e!181246 () Bool)

(assert (=> start!56408 (=> (not res!218298) (not e!181246))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56408 (= res!218298 (validate_offset_bit!0 ((_ sign_extend 32) (size!6276 (buf!6798 thiss!914))) ((_ sign_extend 32) (currentByte!12515 thiss!914)) ((_ sign_extend 32) (currentBit!12510 thiss!914))))))

(assert (=> start!56408 e!181246))

(declare-fun inv!12 (BitStream!11474) Bool)

(assert (=> start!56408 (and (inv!12 thiss!914) e!181247)))

(assert (=> start!56408 true))

(declare-fun b!260773 () Bool)

(assert (=> b!260773 (= e!181246 (not e!181248))))

(declare-fun res!218299 () Bool)

(assert (=> b!260773 (=> res!218299 e!181248)))

(assert (=> b!260773 (= res!218299 (not (= (size!6276 (buf!6798 thiss!914)) (size!6276 (buf!6798 (_2!12111 lt!402892))))))))

(declare-fun lt!402891 () tuple2!22350)

(declare-fun increaseBitIndex!0 (BitStream!11474) tuple2!22350)

(assert (=> b!260773 (= lt!402892 (increaseBitIndex!0 (_2!12111 lt!402891)))))

(declare-fun arrayRangesEq!943 (array!14356 array!14356 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260773 (arrayRangesEq!943 (buf!6798 thiss!914) (array!14357 (store (arr!7263 (buf!6798 thiss!914)) (currentByte!12515 (_2!12111 lt!402891)) (select (arr!7263 (buf!6798 (_2!12111 lt!402891))) (currentByte!12515 (_2!12111 lt!402891)))) (size!6276 (buf!6798 thiss!914))) #b00000000000000000000000000000000 (currentByte!12515 (_2!12111 lt!402891)))))

(declare-fun lt!402893 () Unit!18563)

(declare-fun arrayUpdatedAtPrefixLemma!459 (array!14356 (_ BitVec 32) (_ BitVec 8)) Unit!18563)

(assert (=> b!260773 (= lt!402893 (arrayUpdatedAtPrefixLemma!459 (buf!6798 thiss!914) (currentByte!12515 (_2!12111 lt!402891)) (select (arr!7263 (buf!6798 (_2!12111 lt!402891))) (currentByte!12515 (_2!12111 lt!402891)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18565 () Unit!18563)

(declare-fun Unit!18566 () Unit!18563)

(assert (=> b!260773 (= lt!402891 (ite b!187 (tuple2!22351 Unit!18565 (BitStream!11475 (array!14357 (store (arr!7263 (buf!6798 thiss!914)) (currentByte!12515 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7263 (buf!6798 thiss!914)) (currentByte!12515 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12510 thiss!914)))))) (size!6276 (buf!6798 thiss!914))) (currentByte!12515 thiss!914) (currentBit!12510 thiss!914))) (tuple2!22351 Unit!18566 (BitStream!11475 (array!14357 (store (arr!7263 (buf!6798 thiss!914)) (currentByte!12515 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7263 (buf!6798 thiss!914)) (currentByte!12515 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12510 thiss!914))))))) (size!6276 (buf!6798 thiss!914))) (currentByte!12515 thiss!914) (currentBit!12510 thiss!914)))))))

(declare-fun b!260774 () Bool)

(declare-fun res!218300 () Bool)

(assert (=> b!260774 (=> res!218300 e!181248)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!260774 (= res!218300 (not (= (bitIndex!0 (size!6276 (buf!6798 (_2!12111 lt!402892))) (currentByte!12515 (_2!12111 lt!402892)) (currentBit!12510 (_2!12111 lt!402892))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6276 (buf!6798 thiss!914)) (currentByte!12515 thiss!914) (currentBit!12510 thiss!914))))))))

(assert (= (and start!56408 res!218298) b!260773))

(assert (= (and b!260773 (not res!218299)) b!260774))

(assert (= (and b!260774 (not res!218300)) b!260772))

(assert (= (and b!260772 (not res!218297)) b!260770))

(assert (= start!56408 b!260771))

(declare-fun m!390305 () Bool)

(assert (=> b!260773 m!390305))

(declare-fun m!390307 () Bool)

(assert (=> b!260773 m!390307))

(declare-fun m!390309 () Bool)

(assert (=> b!260773 m!390309))

(assert (=> b!260773 m!390307))

(declare-fun m!390311 () Bool)

(assert (=> b!260773 m!390311))

(declare-fun m!390313 () Bool)

(assert (=> b!260773 m!390313))

(declare-fun m!390315 () Bool)

(assert (=> b!260773 m!390315))

(declare-fun m!390317 () Bool)

(assert (=> b!260773 m!390317))

(declare-fun m!390319 () Bool)

(assert (=> b!260773 m!390319))

(declare-fun m!390321 () Bool)

(assert (=> b!260773 m!390321))

(declare-fun m!390323 () Bool)

(assert (=> b!260774 m!390323))

(declare-fun m!390325 () Bool)

(assert (=> b!260774 m!390325))

(declare-fun m!390327 () Bool)

(assert (=> b!260772 m!390327))

(declare-fun m!390329 () Bool)

(assert (=> b!260771 m!390329))

(declare-fun m!390331 () Bool)

(assert (=> start!56408 m!390331))

(declare-fun m!390333 () Bool)

(assert (=> start!56408 m!390333))

(declare-fun m!390335 () Bool)

(assert (=> b!260770 m!390335))

(push 1)

(assert (not start!56408))

(assert (not b!260772))

(assert (not b!260771))

(assert (not b!260774))

(assert (not b!260770))

(assert (not b!260773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87626 () Bool)

(assert (=> d!87626 (= (invariant!0 (currentBit!12510 (_2!12111 lt!402892)) (currentByte!12515 (_2!12111 lt!402892)) (size!6276 (buf!6798 (_2!12111 lt!402892)))) (and (bvsge (currentBit!12510 (_2!12111 lt!402892)) #b00000000000000000000000000000000) (bvslt (currentBit!12510 (_2!12111 lt!402892)) #b00000000000000000000000000001000) (bvsge (currentByte!12515 (_2!12111 lt!402892)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12515 (_2!12111 lt!402892)) (size!6276 (buf!6798 (_2!12111 lt!402892)))) (and (= (currentBit!12510 (_2!12111 lt!402892)) #b00000000000000000000000000000000) (= (currentByte!12515 (_2!12111 lt!402892)) (size!6276 (buf!6798 (_2!12111 lt!402892))))))))))

(assert (=> b!260770 d!87626))

(declare-fun d!87630 () Bool)

(assert (=> d!87630 (= (array_inv!6017 (buf!6798 thiss!914)) (bvsge (size!6276 (buf!6798 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!260771 d!87630))

(declare-fun d!87634 () Bool)

(declare-fun res!218317 () Bool)

(declare-fun e!181259 () Bool)

(assert (=> d!87634 (=> (not res!218317) (not e!181259))))

(assert (=> d!87634 (= res!218317 (= (size!6276 (buf!6798 thiss!914)) (size!6276 (buf!6798 (_2!12111 lt!402892)))))))

(assert (=> d!87634 (= (isPrefixOf!0 thiss!914 (_2!12111 lt!402892)) e!181259)))

(declare-fun b!260789 () Bool)

(declare-fun res!218315 () Bool)

(assert (=> b!260789 (=> (not res!218315) (not e!181259))))

(assert (=> b!260789 (= res!218315 (bvsle (bitIndex!0 (size!6276 (buf!6798 thiss!914)) (currentByte!12515 thiss!914) (currentBit!12510 thiss!914)) (bitIndex!0 (size!6276 (buf!6798 (_2!12111 lt!402892))) (currentByte!12515 (_2!12111 lt!402892)) (currentBit!12510 (_2!12111 lt!402892)))))))

(declare-fun b!260790 () Bool)

(declare-fun e!181258 () Bool)

(assert (=> b!260790 (= e!181259 e!181258)))

(declare-fun res!218316 () Bool)

(assert (=> b!260790 (=> res!218316 e!181258)))

(assert (=> b!260790 (= res!218316 (= (size!6276 (buf!6798 thiss!914)) #b00000000000000000000000000000000))))

(declare-fun b!260791 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14356 array!14356 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260791 (= e!181258 (arrayBitRangesEq!0 (buf!6798 thiss!914) (buf!6798 (_2!12111 lt!402892)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6276 (buf!6798 thiss!914)) (currentByte!12515 thiss!914) (currentBit!12510 thiss!914))))))

(assert (= (and d!87634 res!218317) b!260789))

(assert (= (and b!260789 res!218315) b!260790))

(assert (= (and b!260790 (not res!218316)) b!260791))

(assert (=> b!260789 m!390325))

(assert (=> b!260789 m!390323))

(assert (=> b!260791 m!390325))

(assert (=> b!260791 m!390325))

(declare-fun m!390343 () Bool)

(assert (=> b!260791 m!390343))

(assert (=> b!260772 d!87634))

(declare-fun d!87646 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87646 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6276 (buf!6798 thiss!914))) ((_ sign_extend 32) (currentByte!12515 thiss!914)) ((_ sign_extend 32) (currentBit!12510 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6276 (buf!6798 thiss!914))) ((_ sign_extend 32) (currentByte!12515 thiss!914)) ((_ sign_extend 32) (currentBit!12510 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22208 () Bool)

(assert (= bs!22208 d!87646))

(declare-fun m!390345 () Bool)

(assert (=> bs!22208 m!390345))

(assert (=> start!56408 d!87646))

(declare-fun d!87648 () Bool)

(assert (=> d!87648 (= (inv!12 thiss!914) (invariant!0 (currentBit!12510 thiss!914) (currentByte!12515 thiss!914) (size!6276 (buf!6798 thiss!914))))))

(declare-fun bs!22209 () Bool)

(assert (= bs!22209 d!87648))

(declare-fun m!390347 () Bool)

(assert (=> bs!22209 m!390347))

(assert (=> start!56408 d!87648))

(declare-fun d!87650 () Bool)

(declare-fun e!181281 () Bool)

(assert (=> d!87650 e!181281))

(declare-fun res!218349 () Bool)

(assert (=> d!87650 (=> (not res!218349) (not e!181281))))

(declare-fun lt!402956 () (_ BitVec 64))

(declare-fun lt!402954 () tuple2!22350)

(declare-fun lt!402955 () (_ BitVec 64))

(assert (=> d!87650 (= res!218349 (= (bvadd lt!402956 lt!402955) (bitIndex!0 (size!6276 (buf!6798 (_2!12111 lt!402954))) (currentByte!12515 (_2!12111 lt!402954)) (currentBit!12510 (_2!12111 lt!402954)))))))

(assert (=> d!87650 (or (not (= (bvand lt!402956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402955 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402956 lt!402955) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87650 (= lt!402955 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!87650 (= lt!402956 (bitIndex!0 (size!6276 (buf!6798 (_2!12111 lt!402891))) (currentByte!12515 (_2!12111 lt!402891)) (currentBit!12510 (_2!12111 lt!402891))))))

(declare-fun Unit!18571 () Unit!18563)

(declare-fun Unit!18572 () Unit!18563)

(assert (=> d!87650 (= lt!402954 (ite (bvslt (currentBit!12510 (_2!12111 lt!402891)) #b00000000000000000000000000000111) (tuple2!22351 Unit!18571 (BitStream!11475 (buf!6798 (_2!12111 lt!402891)) (currentByte!12515 (_2!12111 lt!402891)) (bvadd (currentBit!12510 (_2!12111 lt!402891)) #b00000000000000000000000000000001))) (tuple2!22351 Unit!18572 (BitStream!11475 (buf!6798 (_2!12111 lt!402891)) (bvadd (currentByte!12515 (_2!12111 lt!402891)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!87650 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6276 (buf!6798 (_2!12111 lt!402891)))) ((_ sign_extend 32) (currentByte!12515 (_2!12111 lt!402891))) ((_ sign_extend 32) (currentBit!12510 (_2!12111 lt!402891)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!87650 (= (increaseBitIndex!0 (_2!12111 lt!402891)) lt!402954)))

(declare-fun b!260821 () Bool)

(declare-fun res!218350 () Bool)

(assert (=> b!260821 (=> (not res!218350) (not e!181281))))

(declare-fun lt!402957 () (_ BitVec 64))

(declare-fun lt!402953 () (_ BitVec 64))

(assert (=> b!260821 (= res!218350 (= (bvsub lt!402957 lt!402953) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!260821 (or (= (bvand lt!402957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402953 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402957 lt!402953) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260821 (= lt!402953 (remainingBits!0 ((_ sign_extend 32) (size!6276 (buf!6798 (_2!12111 lt!402954)))) ((_ sign_extend 32) (currentByte!12515 (_2!12111 lt!402954))) ((_ sign_extend 32) (currentBit!12510 (_2!12111 lt!402954)))))))

(assert (=> b!260821 (= lt!402957 (remainingBits!0 ((_ sign_extend 32) (size!6276 (buf!6798 (_2!12111 lt!402891)))) ((_ sign_extend 32) (currentByte!12515 (_2!12111 lt!402891))) ((_ sign_extend 32) (currentBit!12510 (_2!12111 lt!402891)))))))

(declare-fun b!260822 () Bool)

(assert (=> b!260822 (= e!181281 (= (size!6276 (buf!6798 (_2!12111 lt!402891))) (size!6276 (buf!6798 (_2!12111 lt!402954)))))))

(assert (= (and d!87650 res!218349) b!260821))

(assert (= (and b!260821 res!218350) b!260822))

(declare-fun m!390365 () Bool)

(assert (=> d!87650 m!390365))

(declare-fun m!390367 () Bool)

(assert (=> d!87650 m!390367))

(declare-fun m!390369 () Bool)

(assert (=> d!87650 m!390369))

(declare-fun m!390371 () Bool)

(assert (=> b!260821 m!390371))

(assert (=> b!260821 m!390369))

(assert (=> b!260773 d!87650))

(declare-fun d!87660 () Bool)

(declare-fun res!218358 () Bool)

(declare-fun e!181288 () Bool)

(assert (=> d!87660 (=> res!218358 e!181288)))

(assert (=> d!87660 (= res!218358 (= #b00000000000000000000000000000000 (currentByte!12515 (_2!12111 lt!402891))))))

(assert (=> d!87660 (= (arrayRangesEq!943 (buf!6798 thiss!914) (array!14357 (store (arr!7263 (buf!6798 thiss!914)) (currentByte!12515 (_2!12111 lt!402891)) (select (arr!7263 (buf!6798 (_2!12111 lt!402891))) (currentByte!12515 (_2!12111 lt!402891)))) (size!6276 (buf!6798 thiss!914))) #b00000000000000000000000000000000 (currentByte!12515 (_2!12111 lt!402891))) e!181288)))

(declare-fun b!260832 () Bool)

(declare-fun e!181289 () Bool)

(assert (=> b!260832 (= e!181288 e!181289)))

(declare-fun res!218359 () Bool)

(assert (=> b!260832 (=> (not res!218359) (not e!181289))))

(assert (=> b!260832 (= res!218359 (= (select (arr!7263 (buf!6798 thiss!914)) #b00000000000000000000000000000000) (select (arr!7263 (array!14357 (store (arr!7263 (buf!6798 thiss!914)) (currentByte!12515 (_2!12111 lt!402891)) (select (arr!7263 (buf!6798 (_2!12111 lt!402891))) (currentByte!12515 (_2!12111 lt!402891)))) (size!6276 (buf!6798 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!260833 () Bool)

(assert (=> b!260833 (= e!181289 (arrayRangesEq!943 (buf!6798 thiss!914) (array!14357 (store (arr!7263 (buf!6798 thiss!914)) (currentByte!12515 (_2!12111 lt!402891)) (select (arr!7263 (buf!6798 (_2!12111 lt!402891))) (currentByte!12515 (_2!12111 lt!402891)))) (size!6276 (buf!6798 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12515 (_2!12111 lt!402891))))))

(assert (= (and d!87660 (not res!218358)) b!260832))

(assert (= (and b!260832 res!218359) b!260833))

(declare-fun m!390383 () Bool)

(assert (=> b!260832 m!390383))

(declare-fun m!390385 () Bool)

(assert (=> b!260832 m!390385))

(declare-fun m!390387 () Bool)

(assert (=> b!260833 m!390387))

(assert (=> b!260773 d!87660))

(declare-fun d!87666 () Bool)

(declare-fun e!181298 () Bool)

(assert (=> d!87666 e!181298))

(declare-fun res!218368 () Bool)

(assert (=> d!87666 (=> (not res!218368) (not e!181298))))

(assert (=> d!87666 (= res!218368 (and (bvsge (currentByte!12515 (_2!12111 lt!402891)) #b00000000000000000000000000000000) (bvslt (currentByte!12515 (_2!12111 lt!402891)) (size!6276 (buf!6798 thiss!914)))))))

(declare-fun lt!402968 () Unit!18563)

(declare-fun choose!353 (array!14356 (_ BitVec 32) (_ BitVec 8)) Unit!18563)

(assert (=> d!87666 (= lt!402968 (choose!353 (buf!6798 thiss!914) (currentByte!12515 (_2!12111 lt!402891)) (select (arr!7263 (buf!6798 (_2!12111 lt!402891))) (currentByte!12515 (_2!12111 lt!402891)))))))

(assert (=> d!87666 (and (bvsle #b00000000000000000000000000000000 (currentByte!12515 (_2!12111 lt!402891))) (bvslt (currentByte!12515 (_2!12111 lt!402891)) (size!6276 (buf!6798 thiss!914))))))

(assert (=> d!87666 (= (arrayUpdatedAtPrefixLemma!459 (buf!6798 thiss!914) (currentByte!12515 (_2!12111 lt!402891)) (select (arr!7263 (buf!6798 (_2!12111 lt!402891))) (currentByte!12515 (_2!12111 lt!402891)))) lt!402968)))

(declare-fun b!260842 () Bool)

(assert (=> b!260842 (= e!181298 (arrayRangesEq!943 (buf!6798 thiss!914) (array!14357 (store (arr!7263 (buf!6798 thiss!914)) (currentByte!12515 (_2!12111 lt!402891)) (select (arr!7263 (buf!6798 (_2!12111 lt!402891))) (currentByte!12515 (_2!12111 lt!402891)))) (size!6276 (buf!6798 thiss!914))) #b00000000000000000000000000000000 (currentByte!12515 (_2!12111 lt!402891))))))

(assert (= (and d!87666 res!218368) b!260842))

(assert (=> d!87666 m!390307))

(declare-fun m!390395 () Bool)

(assert (=> d!87666 m!390395))

(assert (=> b!260842 m!390319))

(assert (=> b!260842 m!390305))

(assert (=> b!260773 d!87666))

(declare-fun d!87670 () Bool)

(declare-fun e!181314 () Bool)

(assert (=> d!87670 e!181314))

(declare-fun res!218393 () Bool)

(assert (=> d!87670 (=> (not res!218393) (not e!181314))))

(declare-fun lt!403013 () (_ BitVec 64))

(declare-fun lt!403012 () (_ BitVec 64))

(declare-fun lt!403008 () (_ BitVec 64))

(assert (=> d!87670 (= res!218393 (= lt!403012 (bvsub lt!403008 lt!403013)))))

(assert (=> d!87670 (or (= (bvand lt!403008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403013 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403008 lt!403013) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87670 (= lt!403013 (remainingBits!0 ((_ sign_extend 32) (size!6276 (buf!6798 (_2!12111 lt!402892)))) ((_ sign_extend 32) (currentByte!12515 (_2!12111 lt!402892))) ((_ sign_extend 32) (currentBit!12510 (_2!12111 lt!402892)))))))

(declare-fun lt!403011 () (_ BitVec 64))

(declare-fun lt!403009 () (_ BitVec 64))

(assert (=> d!87670 (= lt!403008 (bvmul lt!403011 lt!403009))))

(assert (=> d!87670 (or (= lt!403011 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403009 (bvsdiv (bvmul lt!403011 lt!403009) lt!403011)))))

(assert (=> d!87670 (= lt!403009 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87670 (= lt!403011 ((_ sign_extend 32) (size!6276 (buf!6798 (_2!12111 lt!402892)))))))

(assert (=> d!87670 (= lt!403012 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12515 (_2!12111 lt!402892))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12510 (_2!12111 lt!402892)))))))

(assert (=> d!87670 (invariant!0 (currentBit!12510 (_2!12111 lt!402892)) (currentByte!12515 (_2!12111 lt!402892)) (size!6276 (buf!6798 (_2!12111 lt!402892))))))

(assert (=> d!87670 (= (bitIndex!0 (size!6276 (buf!6798 (_2!12111 lt!402892))) (currentByte!12515 (_2!12111 lt!402892)) (currentBit!12510 (_2!12111 lt!402892))) lt!403012)))

(declare-fun b!260867 () Bool)

(declare-fun res!218394 () Bool)

(assert (=> b!260867 (=> (not res!218394) (not e!181314))))

(assert (=> b!260867 (= res!218394 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403012))))

(declare-fun b!260868 () Bool)

(declare-fun lt!403010 () (_ BitVec 64))

(assert (=> b!260868 (= e!181314 (bvsle lt!403012 (bvmul lt!403010 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!260868 (or (= lt!403010 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403010 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403010)))))

(assert (=> b!260868 (= lt!403010 ((_ sign_extend 32) (size!6276 (buf!6798 (_2!12111 lt!402892)))))))

(assert (= (and d!87670 res!218393) b!260867))

(assert (= (and b!260867 res!218394) b!260868))

(declare-fun m!390407 () Bool)

(assert (=> d!87670 m!390407))

(assert (=> d!87670 m!390335))

(assert (=> b!260774 d!87670))

(declare-fun d!87680 () Bool)

(declare-fun e!181315 () Bool)

(assert (=> d!87680 e!181315))

(declare-fun res!218395 () Bool)

(assert (=> d!87680 (=> (not res!218395) (not e!181315))))

(declare-fun lt!403014 () (_ BitVec 64))

(declare-fun lt!403019 () (_ BitVec 64))

(declare-fun lt!403018 () (_ BitVec 64))

(assert (=> d!87680 (= res!218395 (= lt!403018 (bvsub lt!403014 lt!403019)))))

(assert (=> d!87680 (or (= (bvand lt!403014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403019 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403014 lt!403019) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87680 (= lt!403019 (remainingBits!0 ((_ sign_extend 32) (size!6276 (buf!6798 thiss!914))) ((_ sign_extend 32) (currentByte!12515 thiss!914)) ((_ sign_extend 32) (currentBit!12510 thiss!914))))))

(declare-fun lt!403017 () (_ BitVec 64))

(declare-fun lt!403015 () (_ BitVec 64))

(assert (=> d!87680 (= lt!403014 (bvmul lt!403017 lt!403015))))

(assert (=> d!87680 (or (= lt!403017 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403015 (bvsdiv (bvmul lt!403017 lt!403015) lt!403017)))))

(assert (=> d!87680 (= lt!403015 