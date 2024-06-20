; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59214 () Bool)

(assert start!59214)

(declare-fun b!271133 () Bool)

(declare-fun e!191026 () Bool)

(declare-datatypes ((array!15120 0))(
  ( (array!15121 (arr!7566 (Array (_ BitVec 32) (_ BitVec 8))) (size!6579 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11972 0))(
  ( (BitStream!11973 (buf!7047 array!15120) (currentByte!13021 (_ BitVec 32)) (currentBit!13016 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11972)

(declare-fun array_inv!6303 (array!15120) Bool)

(assert (=> b!271133 (= e!191026 (array_inv!6303 (buf!7047 w1!591)))))

(declare-fun b!271134 () Bool)

(declare-fun res!225907 () Bool)

(declare-fun e!191025 () Bool)

(assert (=> b!271134 (=> (not res!225907) (not e!191025))))

(declare-fun w2!587 () BitStream!11972)

(declare-fun w3!25 () BitStream!11972)

(declare-fun isPrefixOf!0 (BitStream!11972 BitStream!11972) Bool)

(assert (=> b!271134 (= res!225907 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun res!225905 () Bool)

(assert (=> start!59214 (=> (not res!225905) (not e!191025))))

(assert (=> start!59214 (= res!225905 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59214 e!191025))

(declare-fun inv!12 (BitStream!11972) Bool)

(assert (=> start!59214 (and (inv!12 w1!591) e!191026)))

(declare-fun e!191028 () Bool)

(assert (=> start!59214 (and (inv!12 w2!587) e!191028)))

(declare-fun e!191022 () Bool)

(assert (=> start!59214 (and (inv!12 w3!25) e!191022)))

(declare-fun b!271135 () Bool)

(declare-fun e!191024 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271135 (= e!191024 (byteRangesEq!0 (select (arr!7566 (buf!7047 w1!591)) (currentByte!13021 w1!591)) (select (arr!7566 (buf!7047 w3!25)) (currentByte!13021 w1!591)) #b00000000000000000000000000000000 (currentBit!13016 w1!591)))))

(declare-fun b!271136 () Bool)

(declare-fun e!191021 () Bool)

(assert (=> b!271136 (= e!191021 e!191024)))

(declare-fun res!225904 () Bool)

(assert (=> b!271136 (=> res!225904 e!191024)))

(assert (=> b!271136 (= res!225904 (not (= ((_ sign_extend 24) (select (arr!7566 (buf!7047 w2!587)) (currentByte!13021 w1!591))) ((_ sign_extend 24) (select (arr!7566 (buf!7047 w3!25)) (currentByte!13021 w1!591))))))))

(assert (=> b!271136 (= (select (arr!7566 (buf!7047 w2!587)) (currentByte!13021 w1!591)) (select (arr!7566 (buf!7047 w3!25)) (currentByte!13021 w1!591)))))

(declare-datatypes ((Unit!19113 0))(
  ( (Unit!19114) )
))
(declare-fun lt!409735 () Unit!19113)

(declare-fun arrayRangesEqImpliesEq!171 (array!15120 array!15120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19113)

(assert (=> b!271136 (= lt!409735 (arrayRangesEqImpliesEq!171 (buf!7047 w2!587) (buf!7047 w3!25) #b00000000000000000000000000000000 (currentByte!13021 w1!591) (currentByte!13021 w2!587)))))

(declare-fun b!271137 () Bool)

(assert (=> b!271137 (= e!191025 (not e!191021))))

(declare-fun res!225906 () Bool)

(assert (=> b!271137 (=> res!225906 e!191021)))

(assert (=> b!271137 (= res!225906 (or (bvsge (currentByte!13021 w1!591) (size!6579 (buf!7047 w1!591))) (bvsge (currentByte!13021 w1!591) (currentByte!13021 w2!587))))))

(declare-fun arrayRangesEq!1111 (array!15120 array!15120 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271137 (arrayRangesEq!1111 (buf!7047 w1!591) (buf!7047 w3!25) #b00000000000000000000000000000000 (currentByte!13021 w1!591))))

(declare-fun lt!409736 () Unit!19113)

(declare-fun arrayRangesEqTransitive!374 (array!15120 array!15120 array!15120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19113)

(assert (=> b!271137 (= lt!409736 (arrayRangesEqTransitive!374 (buf!7047 w1!591) (buf!7047 w2!587) (buf!7047 w3!25) #b00000000000000000000000000000000 (currentByte!13021 w1!591) (currentByte!13021 w2!587)))))

(declare-fun b!271138 () Bool)

(assert (=> b!271138 (= e!191028 (array_inv!6303 (buf!7047 w2!587)))))

(declare-fun b!271139 () Bool)

(assert (=> b!271139 (= e!191022 (array_inv!6303 (buf!7047 w3!25)))))

(assert (= (and start!59214 res!225905) b!271134))

(assert (= (and b!271134 res!225907) b!271137))

(assert (= (and b!271137 (not res!225906)) b!271136))

(assert (= (and b!271136 (not res!225904)) b!271135))

(assert (= start!59214 b!271133))

(assert (= start!59214 b!271138))

(assert (= start!59214 b!271139))

(declare-fun m!403371 () Bool)

(assert (=> b!271133 m!403371))

(declare-fun m!403373 () Bool)

(assert (=> b!271138 m!403373))

(declare-fun m!403375 () Bool)

(assert (=> start!59214 m!403375))

(declare-fun m!403377 () Bool)

(assert (=> start!59214 m!403377))

(declare-fun m!403379 () Bool)

(assert (=> start!59214 m!403379))

(declare-fun m!403381 () Bool)

(assert (=> start!59214 m!403381))

(declare-fun m!403383 () Bool)

(assert (=> b!271134 m!403383))

(declare-fun m!403385 () Bool)

(assert (=> b!271136 m!403385))

(declare-fun m!403387 () Bool)

(assert (=> b!271136 m!403387))

(declare-fun m!403389 () Bool)

(assert (=> b!271136 m!403389))

(declare-fun m!403391 () Bool)

(assert (=> b!271137 m!403391))

(declare-fun m!403393 () Bool)

(assert (=> b!271137 m!403393))

(declare-fun m!403395 () Bool)

(assert (=> b!271139 m!403395))

(declare-fun m!403397 () Bool)

(assert (=> b!271135 m!403397))

(assert (=> b!271135 m!403387))

(assert (=> b!271135 m!403397))

(assert (=> b!271135 m!403387))

(declare-fun m!403399 () Bool)

(assert (=> b!271135 m!403399))

(push 1)

(assert (not b!271137))

(assert (not b!271134))

(assert (not b!271133))

(assert (not b!271139))

(assert (not b!271136))

(assert (not b!271135))

(assert (not start!59214))

(assert (not b!271138))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92330 () Bool)

(assert (=> d!92330 (= (array_inv!6303 (buf!7047 w1!591)) (bvsge (size!6579 (buf!7047 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!271133 d!92330))

(declare-fun d!92332 () Bool)

(assert (=> d!92332 (= (array_inv!6303 (buf!7047 w2!587)) (bvsge (size!6579 (buf!7047 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!271138 d!92332))

(declare-fun d!92334 () Bool)

(declare-fun res!225933 () Bool)

(declare-fun e!191052 () Bool)

(assert (=> d!92334 (=> res!225933 e!191052)))

(assert (=> d!92334 (= res!225933 (= #b00000000000000000000000000000000 (currentByte!13021 w1!591)))))

(assert (=> d!92334 (= (arrayRangesEq!1111 (buf!7047 w1!591) (buf!7047 w3!25) #b00000000000000000000000000000000 (currentByte!13021 w1!591)) e!191052)))

(declare-fun b!271165 () Bool)

(declare-fun e!191053 () Bool)

(assert (=> b!271165 (= e!191052 e!191053)))

(declare-fun res!225934 () Bool)

(assert (=> b!271165 (=> (not res!225934) (not e!191053))))

(assert (=> b!271165 (= res!225934 (= (select (arr!7566 (buf!7047 w1!591)) #b00000000000000000000000000000000) (select (arr!7566 (buf!7047 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!271166 () Bool)

(assert (=> b!271166 (= e!191053 (arrayRangesEq!1111 (buf!7047 w1!591) (buf!7047 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13021 w1!591)))))

(assert (= (and d!92334 (not res!225933)) b!271165))

(assert (= (and b!271165 res!225934) b!271166))

(declare-fun m!403423 () Bool)

(assert (=> b!271165 m!403423))

(declare-fun m!403425 () Bool)

(assert (=> b!271165 m!403425))

(declare-fun m!403429 () Bool)

(assert (=> b!271166 m!403429))

(assert (=> b!271137 d!92334))

(declare-fun d!92344 () Bool)

(assert (=> d!92344 (arrayRangesEq!1111 (buf!7047 w1!591) (buf!7047 w3!25) #b00000000000000000000000000000000 (currentByte!13021 w1!591))))

(declare-fun lt!409745 () Unit!19113)

(declare-fun choose!419 (array!15120 array!15120 array!15120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19113)

(assert (=> d!92344 (= lt!409745 (choose!419 (buf!7047 w1!591) (buf!7047 w2!587) (buf!7047 w3!25) #b00000000000000000000000000000000 (currentByte!13021 w1!591) (currentByte!13021 w2!587)))))

(assert (=> d!92344 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13021 w1!591)) (bvsle (currentByte!13021 w1!591) (currentByte!13021 w2!587)))))

(assert (=> d!92344 (= (arrayRangesEqTransitive!374 (buf!7047 w1!591) (buf!7047 w2!587) (buf!7047 w3!25) #b00000000000000000000000000000000 (currentByte!13021 w1!591) (currentByte!13021 w2!587)) lt!409745)))

(declare-fun bs!23314 () Bool)

(assert (= bs!23314 d!92344))

(assert (=> bs!23314 m!403391))

(declare-fun m!403433 () Bool)

(assert (=> bs!23314 m!403433))

(assert (=> b!271137 d!92344))

(declare-fun d!92358 () Bool)

(declare-fun res!225958 () Bool)

(declare-fun e!191068 () Bool)

(assert (=> d!92358 (=> (not res!225958) (not e!191068))))

(assert (=> d!92358 (= res!225958 (= (size!6579 (buf!7047 w1!591)) (size!6579 (buf!7047 w2!587))))))

(assert (=> d!92358 (= (isPrefixOf!0 w1!591 w2!587) e!191068)))

(declare-fun b!271188 () Bool)

(declare-fun res!225957 () Bool)

(assert (=> b!271188 (=> (not res!225957) (not e!191068))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!271188 (= res!225957 (bvsle (bitIndex!0 (size!6579 (buf!7047 w1!591)) (currentByte!13021 w1!591) (currentBit!13016 w1!591)) (bitIndex!0 (size!6579 (buf!7047 w2!587)) (currentByte!13021 w2!587) (currentBit!13016 w2!587))))))

(declare-fun b!271189 () Bool)

(declare-fun e!191069 () Bool)

(assert (=> b!271189 (= e!191068 e!191069)))

(declare-fun res!225956 () Bool)

(assert (=> b!271189 (=> res!225956 e!191069)))

(assert (=> b!271189 (= res!225956 (= (size!6579 (buf!7047 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!271190 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15120 array!15120 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!271190 (= e!191069 (arrayBitRangesEq!0 (buf!7047 w1!591) (buf!7047 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6579 (buf!7047 w1!591)) (currentByte!13021 w1!591) (currentBit!13016 w1!591))))))

(assert (= (and d!92358 res!225958) b!271188))

(assert (= (and b!271188 res!225957) b!271189))

(assert (= (and b!271189 (not res!225956)) b!271190))

(declare-fun m!403465 () Bool)

(assert (=> b!271188 m!403465))

(declare-fun m!403467 () Bool)

(assert (=> b!271188 m!403467))

(assert (=> b!271190 m!403465))

(assert (=> b!271190 m!403465))

(declare-fun m!403469 () Bool)

(assert (=> b!271190 m!403469))

(assert (=> start!59214 d!92358))

(declare-fun d!92380 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92380 (= (inv!12 w1!591) (invariant!0 (currentBit!13016 w1!591) (currentByte!13021 w1!591) (size!6579 (buf!7047 w1!591))))))

(declare-fun bs!23324 () Bool)

(assert (= bs!23324 d!92380))

(declare-fun m!403473 () Bool)

(assert (=> bs!23324 m!403473))

(assert (=> start!59214 d!92380))

(declare-fun d!92384 () Bool)

(assert (=> d!92384 (= (inv!12 w2!587) (invariant!0 (currentBit!13016 w2!587) (currentByte!13021 w2!587) (size!6579 (buf!7047 w2!587))))))

(declare-fun bs!23325 () Bool)

(assert (= bs!23325 d!92384))

(declare-fun m!403477 () Bool)

(assert (=> bs!23325 m!403477))

(assert (=> start!59214 d!92384))

(declare-fun d!92386 () Bool)

(assert (=> d!92386 (= (inv!12 w3!25) (invariant!0 (currentBit!13016 w3!25) (currentByte!13021 w3!25) (size!6579 (buf!7047 w3!25))))))

(declare-fun bs!23326 () Bool)

(assert (= bs!23326 d!92386))

(declare-fun m!403479 () Bool)

(assert (=> bs!23326 m!403479))

(assert (=> start!59214 d!92386))

(declare-fun d!92388 () Bool)

(assert (=> d!92388 (and (bvsge (currentByte!13021 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13021 w1!591) (size!6579 (buf!7047 w2!587))) (bvslt (currentByte!13021 w1!591) (size!6579 (buf!7047 w3!25))) (= (select (arr!7566 (buf!7047 w2!587)) (currentByte!13021 w1!591)) (select (arr!7566 (buf!7047 w3!25)) (currentByte!13021 w1!591))))))

(declare-fun lt!409754 () Unit!19113)

(declare-fun choose!422 (array!15120 array!15120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19113)

(assert (=> d!92388 (= lt!409754 (choose!422 (buf!7047 w2!587) (buf!7047 w3!25) #b00000000000000000000000000000000 (currentByte!13021 w1!591) (currentByte!13021 w2!587)))))

(assert (=> d!92388 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13021 w2!587)))))

(assert (=> d!92388 (= (arrayRangesEqImpliesEq!171 (buf!7047 w2!587) (buf!7047 w3!25) #b00000000000000000000000000000000 (currentByte!13021 w1!591) (currentByte!13021 w2!587)) lt!409754)))

(declare-fun bs!23327 () Bool)

(assert (= bs!23327 d!92388))

(assert (=> bs!23327 m!403385))

(assert (=> bs!23327 m!403387))

(declare-fun m!403481 () Bool)

(assert (=> bs!23327 m!403481))

(assert (=> b!271136 d!92388))

(declare-fun d!92390 () Bool)

(assert (=> d!92390 (= (byteRangesEq!0 (select (arr!7566 (buf!7047 w1!591)) (currentByte!13021 w1!591)) (select (arr!7566 (buf!7047 w3!25)) (currentByte!13021 w1!591)) #b00000000000000000000000000000000 (currentBit!13016 w1!591)) (or (= #b00000000000000000000000000000000 (currentBit!13016 w1!591)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7566 (buf!7047 w1!591)) (currentByte!13021 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13016 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7566 (buf!7047 w3!25)) (currentByte!13021 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13016 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23328 () Bool)

(assert (= bs!23328 d!92390))

(declare-fun m!403483 () Bool)

(assert (=> bs!23328 m!403483))

(declare-fun m!403485 () Bool)

(assert (=> bs!23328 m!403485))

(assert (=> b!271135 d!92390))

(declare-fun d!92392 () Bool)

(assert (=> d!92392 (= (array_inv!6303 (buf!7047 w3!25)) (bvsge (size!6579 (buf!7047 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!271139 d!92392))

(declare-fun d!92394 () Bool)

(declare-fun res!225961 () Bool)

(declare-fun e!191070 () Bool)

(assert (=> d!92394 (=> (not res!225961) (not e!191070))))

(assert (=> d!92394 (= res!225961 (= (size!6579 (buf!7047 w2!587)) (size!6579 (buf!7047 w3!25))))))

(assert (=> d!92394 (= (isPrefixOf!0 w2!587 w3!25) e!191070)))

(declare-fun b!271191 () Bool)

(declare-fun res!225960 () Bool)

(assert (=> b!271191 (=> (not res!225960) (not e!191070))))

(assert (=> b!271191 (= res!225960 (bvsle (bitIndex!0 (size!6579 (buf!7047 w2!587)) (currentByte!13021 w2!587) (currentBit!13016 w2!587)) (bitIndex!0 (size!6579 (buf!7047 w3!25)) (currentByte!13021 w3!25) (currentBit!13016 w3!25))))))

(declare-fun b!271192 () Bool)

(declare-fun e!191071 () Bool)

(assert (=> b!271192 (= e!191070 e!191071)))

(declare-fun res!225959 () Bool)

(assert (=> b!271192 (=> res!225959 e!191071)))

(assert (=> b!271192 (= res!225959 (= (size!6579 (buf!7047 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!271193 () Bool)

(assert (=> b!271193 (= e!191071 (arrayBitRangesEq!0 (buf!7047 w2!587) (buf!7047 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6579 (buf!7047 w2!587)) (currentByte!13021 w2!587) (currentBit!13016 w2!587))))))

(assert (= (and d!92394 res!225961) b!271191))

(assert (= (and b!271191 res!225960) b!271192))

(assert (= (and b!271192 (not res!225959)) b!271193))

(assert (=> b!271191 m!403467))

(declare-fun m!403487 () Bool)

(assert (=> b!271191 m!403487))

(assert (=> b!271193 m!403467))

(assert (=> b!271193 m!403467))

(declare-fun m!403489 () Bool)

(assert (=> b!271193 m!403489))

(assert (=> b!271134 d!92394))

(push 1)

(assert (not d!92388))

(assert (not b!271166))

(assert (not b!271188))

(assert (not b!271190))

(assert (not b!271191))

(assert (not d!92344))

(assert (not d!92384))

(assert (not d!92386))

(assert (not b!271193))

(assert (not d!92380))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> d!92344 d!92334))

(declare-fun d!92426 () Bool)

(assert (=> d!92426 (arrayRangesEq!1111 (buf!7047 w1!591) (buf!7047 w3!25) #b00000000000000000000000000000000 (currentByte!13021 w1!591))))

(assert (=> d!92426 true))

(declare-fun _$16!146 () Unit!19113)

(assert (=> d!92426 (= (choose!419 (buf!7047 w1!591) (buf!7047 w2!587) (buf!7047 w3!25) #b00000000000000000000000000000000 (currentByte!13021 w1!591) (currentByte!13021 w2!587)) _$16!146)))

(declare-fun bs!23332 () Bool)

(assert (= bs!23332 d!92426))

(assert (=> bs!23332 m!403391))

(assert (=> d!92344 d!92426))

(declare-fun b!271288 () Bool)

(declare-fun e!191148 () Bool)

(declare-fun e!191149 () Bool)

(assert (=> b!271288 (= e!191148 e!191149)))

(declare-fun c!12491 () Bool)

(declare-datatypes ((tuple4!466 0))(
  ( (tuple4!467 (_1!12216 (_ BitVec 32)) (_2!12216 (_ BitVec 32)) (_3!1013 (_ BitVec 32)) (_4!233 (_ BitVec 32))) )
))
(declare-fun lt!409846 () tuple4!466)

(assert (=> b!271288 (= c!12491 (= (_3!1013 lt!409846) (_4!233 lt!409846)))))

(declare-fun b!271289 () Bool)

(declare-fun e!191146 () Bool)

(declare-fun lt!409845 () (_ BitVec 32))

(assert (=> b!271289 (= e!191146 (byteRangesEq!0 (select (arr!7566 (buf!7047 w1!591)) (_4!233 lt!409846)) (select (arr!7566 (buf!7047 w2!587)) (_4!233 lt!409846)) #b00000000000000000000000000000000 lt!409845))))

(declare-fun b!271290 () Bool)

(declare-fun res!226039 () Bool)

(assert (=> b!271290 (= res!226039 (= lt!409845 #b00000000000000000000000000000000))))

(assert (=> b!271290 (=> res!226039 e!191146)))

(declare-fun e!191147 () Bool)

(assert (=> b!271290 (= e!191147 e!191146)))

(declare-fun e!191150 () Bool)

(declare-fun b!271291 () Bool)

(assert (=> b!271291 (= e!191150 (arrayRangesEq!1111 (buf!7047 w1!591) (buf!7047 w2!587) (_1!12216 lt!409846) (_2!12216 lt!409846)))))

(declare-fun d!92428 () Bool)

(declare-fun res!226037 () Bool)

(declare-fun e!191151 () Bool)

(assert (=> d!92428 (=> res!226037 e!191151)))

(assert (=> d!92428 (= res!226037 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6579 (buf!7047 w1!591)) (currentByte!13021 w1!591) (currentBit!13016 w1!591))))))

(assert (=> d!92428 (= (arrayBitRangesEq!0 (buf!7047 w1!591) (buf!7047 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6579 (buf!7047 w1!591)) (currentByte!13021 w1!591) (currentBit!13016 w1!591))) e!191151)))

(declare-fun b!271292 () Bool)

(assert (=> b!271292 (= e!191151 e!191148)))

(declare-fun res!226038 () Bool)

(assert (=> b!271292 (=> (not res!226038) (not e!191148))))

(assert (=> b!271292 (= res!226038 e!191150)))

(declare-fun res!226036 () Bool)

(assert (=> b!271292 (=> res!226036 e!191150)))

(assert (=> b!271292 (= res!226036 (bvsge (_1!12216 lt!409846) (_2!12216 lt!409846)))))

(assert (=> b!271292 (= lt!409845 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6579 (buf!7047 w1!591)) (currentByte!13021 w1!591) (currentBit!13016 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!409847 () (_ BitVec 32))

(assert (=> b!271292 (= lt!409847 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!466)

(assert (=> b!271292 (= lt!409846 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6579 (buf!7047 w1!591)) (currentByte!13021 w1!591) (currentBit!13016 w1!591))))))

(declare-fun b!271293 () Bool)

(assert (=> b!271293 (= e!191149 e!191147)))

(declare-fun res!226040 () Bool)

(declare-fun call!4342 () Bool)

(assert (=> b!271293 (= res!226040 call!4342)))

(assert (=> b!271293 (=> (not res!226040) (not e!191147))))

(declare-fun b!271294 () Bool)

(assert (=> b!271294 (= e!191149 call!4342)))

(declare-fun bm!4339 () Bool)

(assert (=> bm!4339 (= call!4342 (byteRangesEq!0 (select (arr!7566 (buf!7047 w1!591)) (_3!1013 lt!409846)) (select (arr!7566 (buf!7047 w2!587)) (_3!1013 lt!409846)) lt!409847 (ite c!12491 lt!409845 #b00000000000000000000000000001000)))))

(assert (= (and d!92428 (not res!226037)) b!271292))

(assert (= (and b!271292 (not res!226036)) b!271291))

(assert (= (and b!271292 res!226038) b!271288))

(assert (= (and b!271288 c!12491) b!271294))

(assert (= (and b!271288 (not c!12491)) b!271293))

(assert (= (and b!271293 res!226040) b!271290))

(assert (= (and b!271290 (not res!226039)) b!271289))

(assert (= (or b!271294 b!271293) bm!4339))

(declare-fun m!403579 () Bool)

(assert (=> b!271289 m!403579))

(declare-fun m!403581 () Bool)

(assert (=> b!271289 m!403581))

(assert (=> b!271289 m!403579))

(assert (=> b!271289 m!403581))

(declare-fun m!403583 () Bool)

(assert (=> b!271289 m!403583))

(declare-fun m!403585 () Bool)

(assert (=> b!271291 m!403585))

(assert (=> b!271292 m!403465))

(declare-fun m!403587 () Bool)

(assert (=> b!271292 m!403587))

(declare-fun m!403589 () Bool)

(assert (=> bm!4339 m!403589))

(declare-fun m!403591 () Bool)

(assert (=> bm!4339 m!403591))

(assert (=> bm!4339 m!403589))

(assert (=> bm!4339 m!403591))

(declare-fun m!403593 () Bool)

(assert (=> bm!4339 m!403593))

(assert (=> b!271190 d!92428))

(declare-fun d!92444 () Bool)

(declare-fun e!191154 () Bool)

(assert (=> d!92444 e!191154))

(declare-fun res!226046 () Bool)

(assert (=> d!92444 (=> (not res!226046) (not e!191154))))

(declare-fun lt!409863 () (_ BitVec 64))

(declare-fun lt!409864 () (_ BitVec 64))

(declare-fun lt!409865 () (_ BitVec 64))

(assert (=> d!92444 (= res!226046 (= lt!409863 (bvsub lt!409865 lt!409864)))))

(assert (=> d!92444 (or (= (bvand lt!409865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409864 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409865 lt!409864) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!92444 (= lt!409864 (remainingBits!0 ((_ sign_extend 32) (size!6579 (buf!7047 w1!591))) ((_ sign_extend 32) (currentByte!13021 w1!591)) ((_ sign_extend 32) (currentBit!13016 w1!591))))))

(declare-fun lt!409860 () (_ BitVec 64))

(declare-fun lt!409861 () (_ BitVec 64))

(assert (=> d!92444 (= lt!409865 (bvmul lt!409860 lt!409861))))

(assert (=> d!92444 (or (= lt!409860 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409861 (bvsdiv (bvmul lt!409860 lt!409861) lt!409860)))))

(assert (=> d!92444 (= lt!409861 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!92444 (= lt!409860 ((_ sign_extend 32) (size!6579 (buf!7047 w1!591))))))

(assert (=> d!92444 (= lt!409863 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13021 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13016 w1!591))))))

(assert (=> d!92444 (invariant!0 (currentBit!13016 w1!591) (currentByte!13021 w1!591) (size!6579 (buf!7047 w1!591)))))

(assert (=> d!92444 (= (bitIndex!0 (size!6579 (buf!7047 w1!591)) (currentByte!13021 w1!591) (currentBit!13016 w1!591)) lt!409863)))

(declare-fun b!271299 () Bool)

(declare-fun res!226045 () Bool)

(assert (=> b!271299 (=> (not res!226045) (not e!191154))))

(assert (=> b!271299 (= res!226045 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409863))))

(declare-fun b!271300 () Bool)

(declare-fun lt!409862 () (_ BitVec 64))

(assert (=> b!271300 (= e!191154 (bvsle lt!409863 (bvmul lt!409862 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271300 (or (= lt!409862 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409862 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409862)))))

(assert (=> b!271300 (= lt!409862 ((_ sign_extend 32) (size!6579 (buf!7047 w1!591))))))

(assert (= (and d!92444 res!226046) b!271299))

(assert (= (and b!271299 res!226045) b!271300))

(declare-fun m!403595 () Bool)

(assert (=> d!92444 m!403595))

(assert (=> d!92444 m!403473))

(assert (=> b!271190 d!92444))

(assert (=> b!271188 d!92444))

(declare-fun d!92446 () Bool)

(declare-fun e!191155 () Bool)

(assert (=> d!92446 e!191155))

(declare-fun res!226048 () Bool)

(assert (=> d!92446 (=> (not res!226048) (not e!191155))))

(declare-fun lt!409871 () (_ BitVec 64))

(declare-fun lt!409870 () (_ BitVec 64))

(declare-fun lt!409869 () (_ BitVec 64))

(assert (=> d!92446 (= res!226048 (= lt!409869 (bvsub lt!409871 lt!409870)))))

(assert (=> d!92446 (or (= (bvand lt!409871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409870 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409871 lt!409870) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!92446 (= lt!409870 (remainingBits!0 ((_ sign_extend 32) (size!6579 (buf!7047 w2!587))) ((_ sign_extend 32) (currentByte!13021 w2!587)) ((_ sign_extend 32) (currentBit!13016 w2!587))))))

(declare-fun lt!409866 () (_ BitVec 64))

(declare-fun lt!409867 () (_ BitVec 64))

(assert (=> d!92446 (= lt!409871 (bvmul lt!409866 lt!409867))))

(assert (=> d!92446 (or (= lt!409866 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409867 (bvsdiv (bvmul lt!409866 lt!409867) lt!409866)))))

(assert (=> d!92446 (= lt!409867 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!92446 (= lt!409866 ((_ sign_extend 32) (size!6579 (buf!7047 w2!587))))))

(assert (=> d!92446 (= lt!409869 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13021 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13016 w2!587))))))

(assert (=> d!92446 (invariant!0 (currentBit!13016 w2!587) (currentByte!13021 w2!587) (size!6579 (buf!7047 w2!587)))))

(assert (=> d!92446 (= (bitIndex!0 (size!6579 (buf!7047 w2!587)) (currentByte!13021 w2!587) (currentBit!13016 w2!587)) lt!409869)))

(declare-fun b!271301 () Bool)

(declare-fun res!226047 () Bool)

(assert (=> b!271301 (=> (not res!226047) (not e!191155))))

(assert (=> b!271301 (= res!226047 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409869))))

(declare-fun b!271302 () Bool)

(declare-fun lt!409868 () (_ BitVec 64))

(assert (=> b!271302 (= e!191155 (bvsle lt!409869 (bvmul lt!409868 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271302 (or (= lt!409868 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409868 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409868)))))

(assert (=> b!271302 (= lt!409868 ((_ sign_extend 32) (size!6579 (buf!7047 w2!587))))))

(assert (= (and d!92446 res!226048) b!271301))

(assert (= (and b!271301 res!226047) b!271302))

(declare-fun m!403597 () Bool)

(assert (=> d!92446 m!403597))

(assert (=> d!92446 m!403477))

(assert (=> b!271188 d!92446))

(declare-fun d!92448 () Bool)

(assert (=> d!92448 (= (invariant!0 (currentBit!13016 w1!591) (currentByte!13021 w1!591) (size!6579 (buf!7047 w1!591))) (and (bvsge (currentBit!13016 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!13016 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!13021 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!13021 w1!591) (size!6579 (buf!7047 w1!591))) (and (= (currentBit!13016 w1!591) #b00000000000000000000000000000000) (= (currentByte!13021 w1!591) (size!6579 (buf!7047 w1!591)))))))))

(assert (=> d!92380 d!92448))

(declare-fun d!92450 () Bool)

(assert (=> d!92450 (= (invariant!0 (currentBit!13016 w2!587) (currentByte!13021 w2!587) (size!6579 (buf!7047 w2!587))) (and (bvsge (currentBit!13016 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!13016 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!13021 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!13021 w2!587) (size!6579 (buf!7047 w2!587))) (and (= (currentBit!13016 w2!587) #b00000000000000000000000000000000) (= (currentByte!13021 w2!587) (size!6579 (buf!7047 w2!587)))))))))

(assert (=> d!92384 d!92450))

(declare-fun b!271303 () Bool)

(declare-fun e!191158 () Bool)

(declare-fun e!191159 () Bool)

(assert (=> b!271303 (= e!191158 e!191159)))

(declare-fun c!12492 () Bool)

(declare-fun lt!409873 () tuple4!466)

(assert (=> b!271303 (= c!12492 (= (_3!1013 lt!409873) (_4!233 lt!409873)))))

(declare-fun b!271304 () Bool)

(declare-fun lt!409872 () (_ BitVec 32))

(declare-fun e!191156 () Bool)

(assert (=> b!271304 (= e!191156 (byteRangesEq!0 (select (arr!7566 (buf!7047 w2!587)) (_4!233 lt!409873)) (select (arr!7566 (buf!7047 w3!25)) (_4!233 lt!409873)) #b00000000000000000000000000000000 lt!409872))))

(declare-fun b!271305 () Bool)

(declare-fun res!226052 () Bool)

(assert (=> b!271305 (= res!226052 (= lt!409872 #b00000000000000000000000000000000))))

(assert (=> b!271305 (=> res!226052 e!191156)))

(declare-fun e!191157 () Bool)

(assert (=> b!271305 (= e!191157 e!191156)))

(declare-fun e!191160 () Bool)

(declare-fun b!271306 () Bool)

(assert (=> b!271306 (= e!191160 (arrayRangesEq!1111 (buf!7047 w2!587) (buf!7047 w3!25) (_1!12216 lt!409873) (_2!12216 lt!409873)))))

(declare-fun d!92452 () Bool)

(declare-fun res!226050 () Bool)

(declare-fun e!191161 () Bool)

(assert (=> d!92452 (=> res!226050 e!191161)))

(assert (=> d!92452 (= res!226050 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6579 (buf!7047 w2!587)) (currentByte!13021 w2!587) (currentBit!13016 w2!587))))))

(assert (=> d!92452 (= (arrayBitRangesEq!0 (buf!7047 w2!587) (buf!7047 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6579 (buf!7047 w2!587)) (currentByte!13021 w2!587) (currentBit!13016 w2!587))) e!191161)))

(declare-fun b!271307 () Bool)

(assert (=> b!271307 (= e!191161 e!191158)))

(declare-fun res!226051 () Bool)

(assert (=> b!271307 (=> (not res!226051) (not e!191158))))

(assert (=> b!271307 (= res!226051 e!191160)))

(declare-fun res!226049 () Bool)

(assert (=> b!271307 (=> res!226049 e!191160)))

(assert (=> b!271307 (= res!226049 (bvsge (_1!12216 lt!409873) (_2!12216 lt!409873)))))

(assert (=> b!271307 (= lt!409872 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6579 (buf!7047 w2!587)) (currentByte!13021 w2!587) (currentBit!13016 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!409874 () (_ BitVec 32))

(assert (=> b!271307 (= lt!409874 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271307 (= lt!409873 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6579 (buf!7047 w2!587)) (currentByte!13021 w2!587) (currentBit!13016 w2!587))))))

(declare-fun b!271308 () Bool)

(assert (=> b!271308 (= e!191159 e!191157)))

(declare-fun res!226053 () Bool)

(declare-fun call!4343 () Bool)

(assert (=> b!271308 (= res!226053 call!4343)))

(assert (=> b!271308 (=> (not res!226053) (not e!191157))))

(declare-fun b!271309 () Bool)

(assert (=> b!271309 (= e!191159 call!4343)))

(declare-fun bm!4340 () Bool)

(assert (=> bm!4340 (= call!4343 (byteRangesEq!0 (select (arr!7566 (buf!7047 w2!587)) (_3!1013 lt!409873)) (select (arr!7566 (buf!7047 w3!25)) (_3!1013 lt!409873)) lt!409874 (ite c!12492 lt!409872 #b00000000000000000000000000001000)))))

(assert (= (and d!92452 (not res!226050)) b!271307))

(assert (= (and b!271307 (not res!226049)) b!271306))

(assert (= (and b!271307 res!226051) b!271303))

(assert (= (and b!271303 c!12492) b!271309))

(assert (= (and b!271303 (not c!12492)) b!271308))

(assert (= (and b!271308 res!226053) b!271305))

(assert (= (and b!271305 (not res!226052)) b!271304))

(assert (= (or b!271309 b!271308) bm!4340))

(declare-fun m!403599 () Bool)

(assert (=> b!271304 m!403599))

(declare-fun m!403601 () Bool)

(assert (=> b!271304 m!403601))

(assert (=> b!271304 m!403599))

(assert (=> b!271304 m!403601))

(declare-fun m!403603 () Bool)

(assert (=> b!271304 m!403603))

(declare-fun m!403605 () Bool)

(assert (=> b!271306 m!403605))

(assert (=> b!271307 m!403467))

(declare-fun m!403607 () Bool)

(assert (=> b!271307 m!403607))

(declare-fun m!403609 () Bool)

(assert (=> bm!4340 m!403609))

(declare-fun m!403611 () Bool)

(assert (=> bm!4340 m!403611))

(assert (=> bm!4340 m!403609))

(assert (=> bm!4340 m!403611))

(declare-fun m!403613 () Bool)

(assert (=> bm!4340 m!403613))

(assert (=> b!271193 d!92452))

(assert (=> b!271193 d!92446))

(assert (=> b!271191 d!92446))

(declare-fun d!92454 () Bool)

(declare-fun e!191162 () Bool)

(assert (=> d!92454 e!191162))

(declare-fun res!226055 () Bool)

(assert (=> d!92454 (=> (not res!226055) (not e!191162))))

(declare-fun lt!409880 () (_ BitVec 64))

(declare-fun lt!409878 () (_ BitVec 64))

(declare-fun lt!409879 () (_ BitVec 64))

(assert (=> d!92454 (= res!226055 (= lt!409878 (bvsub lt!409880 lt!409879)))))

(assert (=> d!92454 (or (= (bvand lt!409880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409879 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409880 lt!409879) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!92454 (= lt!409879 (remainingBits!0 ((_ sign_extend 32) (size!6579 (buf!7047 w3!25))) ((_ sign_extend 32) (currentByte!13021 w3!25)) ((_ sign_extend 32) (currentBit!13016 w3!25))))))

(declare-fun lt!409875 () (_ BitVec 64))

(declare-fun lt!409876 () (_ BitVec 64))

(assert (=> d!92454 (= lt!409880 (bvmul lt!409875 lt!409876))))

(assert (=> d!92454 (or (= lt!409875 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409876 (bvsdiv (bvmul lt!409875 lt!409876) lt!409875)))))

(assert (=> d!92454 (= lt!409876 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!92454 (= lt!409875 ((_ sign_extend 32) (size!6579 (buf!7047 w3!25))))))

(assert (=> d!92454 (= lt!409878 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13021 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13016 w3!25))))))

(assert (=> d!92454 (invariant!0 (currentBit!13016 w3!25) (currentByte!13021 w3!25) (size!6579 (buf!7047 w3!25)))))

(assert (=> d!92454 (= (bitIndex!0 (size!6579 (buf!7047 w3!25)) (currentByte!13021 w3!25) (currentBit!13016 w3!25)) lt!409878)))

(declare-fun b!271310 () Bool)

(declare-fun res!226054 () Bool)

(assert (=> b!271310 (=> (not res!226054) (not e!191162))))

(assert (=> b!271310 (= res!226054 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409878))))

(declare-fun b!271311 () Bool)

(declare-fun lt!409877 () (_ BitVec 64))

(assert (=> b!271311 (= e!191162 (bvsle lt!409878 (bvmul lt!409877 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271311 (or (= lt!409877 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409877 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409877)))))

(assert (=> b!271311 (= lt!409877 ((_ sign_extend 32) (size!6579 (buf!7047 w3!25))))))

(assert (= (and d!92454 res!226055) b!271310))

(assert (= (and b!271310 res!226054) b!271311))

(declare-fun m!403615 () Bool)

(assert (=> d!92454 m!403615))

(assert (=> d!92454 m!403479))

(assert (=> b!271191 d!92454))

(declare-fun d!92456 () Bool)

(assert (=> d!92456 (= (invariant!0 (currentBit!13016 w3!25) (currentByte!13021 w3!25) (size!6579 (buf!7047 w3!25))) (and (bvsge (currentBit!13016 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!13016 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!13021 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!13021 w3!25) (size!6579 (buf!7047 w3!25))) (and (= (currentBit!13016 w3!25) #b00000000000000000000000000000000) (= (currentByte!13021 w3!25) (size!6579 (buf!7047 w3!25)))))))))

(assert (=> d!92386 d!92456))

(declare-fun d!92458 () Bool)

(declare-fun res!226056 () Bool)

(declare-fun e!191163 () Bool)

(assert (=> d!92458 (=> res!226056 e!191163)))

(assert (=> d!92458 (= res!226056 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13021 w1!591)))))

(assert (=> d!92458 (= (arrayRangesEq!1111 (buf!7047 w1!591) (buf!7047 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13021 w1!591)) e!191163)))

(declare-fun b!271312 () Bool)

(declare-fun e!191164 () Bool)

(assert (=> b!271312 (= e!191163 e!191164)))

(declare-fun res!226057 () Bool)

(assert (=> b!271312 (=> (not res!226057) (not e!191164))))

(assert (=> b!271312 (= res!226057 (= (select (arr!7566 (buf!7047 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7566 (buf!7047 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!271313 () Bool)

(assert (=> b!271313 (= e!191164 (arrayRangesEq!1111 (buf!7047 w1!591) (buf!7047 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13021 w1!591)))))

(assert (= (and d!92458 (not res!226056)) b!271312))

(assert (= (and b!271312 res!226057) b!271313))

(declare-fun m!403617 () Bool)

(assert (=> b!271312 m!403617))

(declare-fun m!403619 () Bool)

(assert (=> b!271312 m!403619))

(declare-fun m!403621 () Bool)

(assert (=> b!271313 m!403621))

(assert (=> b!271166 d!92458))

(declare-fun d!92460 () Bool)

(assert (=> d!92460 (= (select (arr!7566 (buf!7047 w2!587)) (currentByte!13021 w1!591)) (select (arr!7566 (buf!7047 w3!25)) (currentByte!13021 w1!591)))))

(assert (=> d!92460 true))

(declare-fun _$12!108 () Unit!19113)

(assert (=> d!92460 (= (choose!422 (buf!7047 w2!587) (buf!7047 w3!25) #b00000000000000000000000000000000 (currentByte!13021 w1!591) (currentByte!13021 w2!587)) _$12!108)))

(declare-fun bs!23334 () Bool)

(assert (= bs!23334 d!92460))

(assert (=> bs!23334 m!403385))

(assert (=> bs!23334 m!403387))

(assert (=> d!92388 d!92460))

(push 1)

(assert (not b!271304))

(assert (not b!271313))

(assert (not b!271289))

(assert (not d!92446))

(assert (not b!271306))

(assert (not b!271292))

(assert (not b!271291))

(assert (not bm!4340))

(assert (not d!92454))

(assert (not bm!4339))

(assert (not d!92426))

(assert (not b!271307))

(assert (not d!92444))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92486 () Bool)

(declare-fun res!226064 () Bool)

(declare-fun e!191171 () Bool)

(assert (=> d!92486 (=> res!226064 e!191171)))

(assert (=> d!92486 (= res!226064 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13021 w1!591)))))

(assert (=> d!92486 (= (arrayRangesEq!1111 (buf!7047 w1!591) (buf!7047 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13021 w1!591)) e!191171)))

(declare-fun b!271320 () Bool)

(declare-fun e!191172 () Bool)

(assert (=> b!271320 (= e!191171 e!191172)))

(declare-fun res!226065 () Bool)

(assert (=> b!271320 (=> (not res!226065) (not e!191172))))

(assert (=> b!271320 (= res!226065 (= (select (arr!7566 (buf!7047 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7566 (buf!7047 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!271321 () Bool)

(assert (=> b!271321 (= e!191172 (arrayRangesEq!1111 (buf!7047 w1!591) (buf!7047 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13021 w1!591)))))

(assert (= (and d!92486 (not res!226064)) b!271320))

(assert (= (and b!271320 res!226065) b!271321))

(declare-fun m!403653 () Bool)

(assert (=> b!271320 m!403653))

(declare-fun m!403655 () Bool)

(assert (=> b!271320 m!403655))

(declare-fun m!403657 () Bool)

(assert (=> b!271321 m!403657))

(assert (=> b!271313 d!92486))

(declare-fun d!92488 () Bool)

(declare-fun res!226066 () Bool)

(declare-fun e!191173 () Bool)

(assert (=> d!92488 (=> res!226066 e!191173)))

(assert (=> d!92488 (= res!226066 (= (_1!12216 lt!409873) (_2!12216 lt!409873)))))

(assert (=> d!92488 (= (arrayRangesEq!1111 (buf!7047 w2!587) (buf!7047 w3!25) (_1!12216 lt!409873) (_2!12216 lt!409873)) e!191173)))

(declare-fun b!271322 () Bool)

(declare-fun e!191174 () Bool)

(assert (=> b!271322 (= e!191173 e!191174)))

(declare-fun res!226067 () Bool)

(assert (=> b!271322 (=> (not res!226067) (not e!191174))))

(assert (=> b!271322 (= res!226067 (= (select (arr!7566 (buf!7047 w2!587)) (_1!12216 lt!409873)) (select (arr!7566 (buf!7047 w3!25)) (_1!12216 lt!409873))))))

(declare-fun b!271323 () Bool)

(assert (=> b!271323 (= e!191174 (arrayRangesEq!1111 (buf!7047 w2!587) (buf!7047 w3!25) (bvadd (_1!12216 lt!409873) #b00000000000000000000000000000001) (_2!12216 lt!409873)))))

(assert (= (and d!92488 (not res!226066)) b!271322))

(assert (= (and b!271322 res!226067) b!271323))

(declare-fun m!403659 () Bool)

(assert (=> b!271322 m!403659))

(declare-fun m!403661 () Bool)

(assert (=> b!271322 m!403661))

(declare-fun m!403663 () Bool)

(assert (=> b!271323 m!403663))

(assert (=> b!271306 d!92488))

(declare-fun d!92490 () Bool)

(assert (=> d!92490 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6579 (buf!7047 w2!587)) (currentByte!13021 w2!587) (currentBit!13016 w2!587))) (tuple4!467 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6579 (buf!7047 w2!587)) (currentByte!13021 w2!587) (currentBit!13016 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6579 (buf!7047 w2!587)) (currentByte!13021 w2!587) (currentBit!13016 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!271307 d!92490))

(declare-fun d!92492 () Bool)

(assert (=> d!92492 (= (remainingBits!0 ((_ sign_extend 32) (size!6579 (buf!7047 w3!25))) ((_ sign_extend 32) (currentByte!13021 w3!25)) ((_ sign_extend 32) (currentBit!13016 w3!25))) (bvsub (bvmul ((_ sign_extend 32) (size!6579 (buf!7047 w3!25))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13021 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13016 w3!25)))))))

(assert (=> d!92454 d!92492))

(assert (=> d!92454 d!92456))

(declare-fun d!92494 () Bool)

(assert (=> d!92494 (= (remainingBits!0 ((_ sign_extend 32) (size!6579 (buf!7047 w2!587))) ((_ sign_extend 32) (currentByte!13021 w2!587)) ((_ sign_extend 32) (currentBit!13016 w2!587))) (bvsub (bvmul ((_ sign_extend 32) (size!6579 (buf!7047 w2!587))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13021 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13016 w2!587)))))))

(assert (=> d!92446 d!92494))

(assert (=> d!92446 d!92450))

(declare-fun d!92496 () Bool)

(declare-fun res!226068 () Bool)

(declare-fun e!191175 () Bool)

(assert (=> d!92496 (=> res!226068 e!191175)))

(assert (=> d!92496 (= res!226068 (= (_1!12216 lt!409846) (_2!12216 lt!409846)))))

(assert (=> d!92496 (= (arrayRangesEq!1111 (buf!7047 w1!591) (buf!7047 w2!587) (_1!12216 lt!409846) (_2!12216 lt!409846)) e!191175)))

(declare-fun b!271324 () Bool)

(declare-fun e!191176 () Bool)

(assert (=> b!271324 (= e!191175 e!191176)))

(declare-fun res!226069 () Bool)

(assert (=> b!271324 (=> (not res!226069) (not e!191176))))

(assert (=> b!271324 (= res!226069 (= (select (arr!7566 (buf!7047 w1!591)) (_1!12216 lt!409846)) (select (arr!7566 (buf!7047 w2!587)) (_1!12216 lt!409846))))))

(declare-fun b!271325 () Bool)

(assert (=> b!271325 (= e!191176 (arrayRangesEq!1111 (buf!7047 w1!591) (buf!7047 w2!587) (bvadd (_1!12216 lt!409846) #b00000000000000000000000000000001) (_2!12216 lt!409846)))))

(assert (= (and d!92496 (not res!226068)) b!271324))

(assert (= (and b!271324 res!226069) b!271325))

(declare-fun m!403665 () Bool)

(assert (=> b!271324 m!403665))

(declare-fun m!403667 () Bool)

(assert (=> b!271324 m!403667))

(declare-fun m!403669 () Bool)

(assert (=> b!271325 m!403669))

(assert (=> b!271291 d!92496))

(declare-fun d!92498 () Bool)

(assert (=> d!92498 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6579 (buf!7047 w1!591)) (currentByte!13021 w1!591) (currentBit!13016 w1!591))) (tuple4!467 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6579 (buf!7047 w1!591)) (currentByte!13021 w1!591) (currentBit!13016 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6579 (buf!7047 w1!591)) (currentByte!13021 w1!591) (currentBit!13016 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!271292 d!92498))

(declare-fun d!92500 () Bool)

(assert (=> d!92500 (= (remainingBits!0 ((_ sign_extend 32) (size!6579 (buf!7047 w1!591))) ((_ sign_extend 32) (currentByte!13021 w1!591)) ((_ sign_extend 32) (currentBit!13016 w1!591))) (bvsub (bvmul ((_ sign_extend 32) (size!6579 (buf!7047 w1!591))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13021 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13016 w1!591)))))))

(assert (=> d!92444 d!92500))

(assert (=> d!92444 d!92448))

(declare-fun d!92502 () Bool)

(assert (=> d!92502 (= (byteRangesEq!0 (select (arr!7566 (buf!7047 w2!587)) (_4!233 lt!409873)) (select (arr!7566 (buf!7047 w3!25)) (_4!233 lt!409873)) #b00000000000000000000000000000000 lt!409872) (or (= #b00000000000000000000000000000000 lt!409872) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7566 (buf!7047 w2!587)) (_4!233 lt!409873))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409872))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7566 (buf!7047 w3!25)) (_4!233 lt!409873))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409872))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23339 () Bool)

(assert (= bs!23339 d!92502))

(declare-fun m!403671 () Bool)

(assert (=> bs!23339 m!403671))

(assert (=> bs!23339 m!403485))

(assert (=> b!271304 d!92502))

(declare-fun d!92504 () Bool)

(assert (=> d!92504 (= (byteRangesEq!0 (select (arr!7566 (buf!7047 w1!591)) (_4!233 lt!409846)) (select (arr!7566 (buf!7047 w2!587)) (_4!233 lt!409846)) #b00000000000000000000000000000000 lt!409845) (or (= #b00000000000000000000000000000000 lt!409845) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7566 (buf!7047 w1!591)) (_4!233 lt!409846))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409845))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7566 (buf!7047 w2!587)) (_4!233 lt!409846))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409845))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23340 () Bool)

(assert (= bs!23340 d!92504))

(declare-fun m!403673 () Bool)

(assert (=> bs!23340 m!403673))

(assert (=> bs!23340 m!403485))

(assert (=> b!271289 d!92504))

(assert (=> d!92426 d!92334))

(declare-fun d!92506 () Bool)

(assert (=> d!92506 (= (byteRangesEq!0 (select (arr!7566 (buf!7047 w2!587)) (_3!1013 lt!409873)) (select (arr!7566 (buf!7047 w3!25)) (_3!1013 lt!409873)) lt!409874 (ite c!12492 lt!409872 #b00000000000000000000000000001000)) (or (= lt!409874 (ite c!12492 lt!409872 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7566 (buf!7047 w2!587)) (_3!1013 lt!409873))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12492 lt!409872 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409874)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7566 (buf!7047 w3!25)) (_3!1013 lt!409873))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12492 lt!409872 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409874)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23341 () Bool)

(assert (= bs!23341 d!92506))

(declare-fun m!403675 () Bool)

(assert (=> bs!23341 m!403675))

(declare-fun m!403677 () Bool)

(assert (=> bs!23341 m!403677))

(assert (=> bm!4340 d!92506))

(declare-fun d!92508 () Bool)

(assert (=> d!92508 (= (byteRangesEq!0 (select (arr!7566 (buf!7047 w1!591)) (_3!1013 lt!409846)) (select (arr!7566 (buf!7047 w2!587)) (_3!1013 lt!409846)) lt!409847 (ite c!12491 lt!409845 #b00000000000000000000000000001000)) (or (= lt!409847 (ite c!12491 lt!409845 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7566 (buf!7047 w1!591)) (_3!1013 lt!409846))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12491 lt!409845 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409847)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7566 (buf!7047 w2!587)) (_3!1013 lt!409846))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12491 lt!409845 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409847)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23342 () Bool)

(assert (= bs!23342 d!92508))

(declare-fun m!403679 () Bool)

(assert (=> bs!23342 m!403679))

(declare-fun m!403681 () Bool)

(assert (=> bs!23342 m!403681))

(assert (=> bm!4339 d!92508))

(push 1)

(assert (not b!271323))

(assert (not b!271321))

(assert (not b!271325))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

