; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59212 () Bool)

(assert start!59212)

(declare-fun res!225895 () Bool)

(declare-fun e!191002 () Bool)

(assert (=> start!59212 (=> (not res!225895) (not e!191002))))

(declare-datatypes ((array!15118 0))(
  ( (array!15119 (arr!7565 (Array (_ BitVec 32) (_ BitVec 8))) (size!6578 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11970 0))(
  ( (BitStream!11971 (buf!7046 array!15118) (currentByte!13020 (_ BitVec 32)) (currentBit!13015 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11970)

(declare-fun w2!587 () BitStream!11970)

(declare-fun isPrefixOf!0 (BitStream!11970 BitStream!11970) Bool)

(assert (=> start!59212 (= res!225895 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59212 e!191002))

(declare-fun e!190999 () Bool)

(declare-fun inv!12 (BitStream!11970) Bool)

(assert (=> start!59212 (and (inv!12 w1!591) e!190999)))

(declare-fun e!190994 () Bool)

(assert (=> start!59212 (and (inv!12 w2!587) e!190994)))

(declare-fun w3!25 () BitStream!11970)

(declare-fun e!190998 () Bool)

(assert (=> start!59212 (and (inv!12 w3!25) e!190998)))

(declare-fun b!271112 () Bool)

(declare-fun array_inv!6302 (array!15118) Bool)

(assert (=> b!271112 (= e!190998 (array_inv!6302 (buf!7046 w3!25)))))

(declare-fun b!271113 () Bool)

(declare-fun res!225892 () Bool)

(assert (=> b!271113 (=> (not res!225892) (not e!191002))))

(assert (=> b!271113 (= res!225892 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!271114 () Bool)

(assert (=> b!271114 (= e!190994 (array_inv!6302 (buf!7046 w2!587)))))

(declare-fun b!271115 () Bool)

(declare-fun e!191000 () Bool)

(declare-fun e!190997 () Bool)

(assert (=> b!271115 (= e!191000 e!190997)))

(declare-fun res!225893 () Bool)

(assert (=> b!271115 (=> res!225893 e!190997)))

(assert (=> b!271115 (= res!225893 (not (= ((_ sign_extend 24) (select (arr!7565 (buf!7046 w2!587)) (currentByte!13020 w1!591))) ((_ sign_extend 24) (select (arr!7565 (buf!7046 w3!25)) (currentByte!13020 w1!591))))))))

(assert (=> b!271115 (= (select (arr!7565 (buf!7046 w2!587)) (currentByte!13020 w1!591)) (select (arr!7565 (buf!7046 w3!25)) (currentByte!13020 w1!591)))))

(declare-datatypes ((Unit!19111 0))(
  ( (Unit!19112) )
))
(declare-fun lt!409729 () Unit!19111)

(declare-fun arrayRangesEqImpliesEq!170 (array!15118 array!15118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19111)

(assert (=> b!271115 (= lt!409729 (arrayRangesEqImpliesEq!170 (buf!7046 w2!587) (buf!7046 w3!25) #b00000000000000000000000000000000 (currentByte!13020 w1!591) (currentByte!13020 w2!587)))))

(declare-fun b!271116 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271116 (= e!190997 (byteRangesEq!0 (select (arr!7565 (buf!7046 w1!591)) (currentByte!13020 w1!591)) (select (arr!7565 (buf!7046 w3!25)) (currentByte!13020 w1!591)) #b00000000000000000000000000000000 (currentBit!13015 w1!591)))))

(declare-fun b!271117 () Bool)

(assert (=> b!271117 (= e!190999 (array_inv!6302 (buf!7046 w1!591)))))

(declare-fun b!271118 () Bool)

(assert (=> b!271118 (= e!191002 (not e!191000))))

(declare-fun res!225894 () Bool)

(assert (=> b!271118 (=> res!225894 e!191000)))

(assert (=> b!271118 (= res!225894 (or (bvsge (currentByte!13020 w1!591) (size!6578 (buf!7046 w1!591))) (bvsge (currentByte!13020 w1!591) (currentByte!13020 w2!587))))))

(declare-fun arrayRangesEq!1110 (array!15118 array!15118 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271118 (arrayRangesEq!1110 (buf!7046 w1!591) (buf!7046 w3!25) #b00000000000000000000000000000000 (currentByte!13020 w1!591))))

(declare-fun lt!409730 () Unit!19111)

(declare-fun arrayRangesEqTransitive!373 (array!15118 array!15118 array!15118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19111)

(assert (=> b!271118 (= lt!409730 (arrayRangesEqTransitive!373 (buf!7046 w1!591) (buf!7046 w2!587) (buf!7046 w3!25) #b00000000000000000000000000000000 (currentByte!13020 w1!591) (currentByte!13020 w2!587)))))

(assert (= (and start!59212 res!225895) b!271113))

(assert (= (and b!271113 res!225892) b!271118))

(assert (= (and b!271118 (not res!225894)) b!271115))

(assert (= (and b!271115 (not res!225893)) b!271116))

(assert (= start!59212 b!271117))

(assert (= start!59212 b!271114))

(assert (= start!59212 b!271112))

(declare-fun m!403341 () Bool)

(assert (=> b!271115 m!403341))

(declare-fun m!403343 () Bool)

(assert (=> b!271115 m!403343))

(declare-fun m!403345 () Bool)

(assert (=> b!271115 m!403345))

(declare-fun m!403347 () Bool)

(assert (=> b!271113 m!403347))

(declare-fun m!403349 () Bool)

(assert (=> b!271117 m!403349))

(declare-fun m!403351 () Bool)

(assert (=> b!271116 m!403351))

(assert (=> b!271116 m!403343))

(assert (=> b!271116 m!403351))

(assert (=> b!271116 m!403343))

(declare-fun m!403353 () Bool)

(assert (=> b!271116 m!403353))

(declare-fun m!403355 () Bool)

(assert (=> b!271114 m!403355))

(declare-fun m!403357 () Bool)

(assert (=> b!271112 m!403357))

(declare-fun m!403359 () Bool)

(assert (=> start!59212 m!403359))

(declare-fun m!403361 () Bool)

(assert (=> start!59212 m!403361))

(declare-fun m!403363 () Bool)

(assert (=> start!59212 m!403363))

(declare-fun m!403365 () Bool)

(assert (=> start!59212 m!403365))

(declare-fun m!403367 () Bool)

(assert (=> b!271118 m!403367))

(declare-fun m!403369 () Bool)

(assert (=> b!271118 m!403369))

(check-sat (not b!271114) (not b!271112) (not b!271113) (not start!59212) (not b!271116) (not b!271118) (not b!271117) (not b!271115))
(check-sat)
(get-model)

(declare-fun d!92324 () Bool)

(declare-fun res!225914 () Bool)

(declare-fun e!191035 () Bool)

(assert (=> d!92324 (=> (not res!225914) (not e!191035))))

(assert (=> d!92324 (= res!225914 (= (size!6578 (buf!7046 w2!587)) (size!6578 (buf!7046 w3!25))))))

(assert (=> d!92324 (= (isPrefixOf!0 w2!587 w3!25) e!191035)))

(declare-fun b!271146 () Bool)

(declare-fun res!225915 () Bool)

(assert (=> b!271146 (=> (not res!225915) (not e!191035))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!271146 (= res!225915 (bvsle (bitIndex!0 (size!6578 (buf!7046 w2!587)) (currentByte!13020 w2!587) (currentBit!13015 w2!587)) (bitIndex!0 (size!6578 (buf!7046 w3!25)) (currentByte!13020 w3!25) (currentBit!13015 w3!25))))))

(declare-fun b!271147 () Bool)

(declare-fun e!191034 () Bool)

(assert (=> b!271147 (= e!191035 e!191034)))

(declare-fun res!225916 () Bool)

(assert (=> b!271147 (=> res!225916 e!191034)))

(assert (=> b!271147 (= res!225916 (= (size!6578 (buf!7046 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!271148 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15118 array!15118 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!271148 (= e!191034 (arrayBitRangesEq!0 (buf!7046 w2!587) (buf!7046 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6578 (buf!7046 w2!587)) (currentByte!13020 w2!587) (currentBit!13015 w2!587))))))

(assert (= (and d!92324 res!225914) b!271146))

(assert (= (and b!271146 res!225915) b!271147))

(assert (= (and b!271147 (not res!225916)) b!271148))

(declare-fun m!403405 () Bool)

(assert (=> b!271146 m!403405))

(declare-fun m!403407 () Bool)

(assert (=> b!271146 m!403407))

(assert (=> b!271148 m!403405))

(assert (=> b!271148 m!403405))

(declare-fun m!403409 () Bool)

(assert (=> b!271148 m!403409))

(assert (=> b!271113 d!92324))

(declare-fun d!92336 () Bool)

(declare-fun res!225931 () Bool)

(declare-fun e!191050 () Bool)

(assert (=> d!92336 (=> res!225931 e!191050)))

(assert (=> d!92336 (= res!225931 (= #b00000000000000000000000000000000 (currentByte!13020 w1!591)))))

(assert (=> d!92336 (= (arrayRangesEq!1110 (buf!7046 w1!591) (buf!7046 w3!25) #b00000000000000000000000000000000 (currentByte!13020 w1!591)) e!191050)))

(declare-fun b!271163 () Bool)

(declare-fun e!191051 () Bool)

(assert (=> b!271163 (= e!191050 e!191051)))

(declare-fun res!225932 () Bool)

(assert (=> b!271163 (=> (not res!225932) (not e!191051))))

(assert (=> b!271163 (= res!225932 (= (select (arr!7565 (buf!7046 w1!591)) #b00000000000000000000000000000000) (select (arr!7565 (buf!7046 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!271164 () Bool)

(assert (=> b!271164 (= e!191051 (arrayRangesEq!1110 (buf!7046 w1!591) (buf!7046 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13020 w1!591)))))

(assert (= (and d!92336 (not res!225931)) b!271163))

(assert (= (and b!271163 res!225932) b!271164))

(declare-fun m!403417 () Bool)

(assert (=> b!271163 m!403417))

(declare-fun m!403419 () Bool)

(assert (=> b!271163 m!403419))

(declare-fun m!403421 () Bool)

(assert (=> b!271164 m!403421))

(assert (=> b!271118 d!92336))

(declare-fun d!92340 () Bool)

(assert (=> d!92340 (arrayRangesEq!1110 (buf!7046 w1!591) (buf!7046 w3!25) #b00000000000000000000000000000000 (currentByte!13020 w1!591))))

(declare-fun lt!409742 () Unit!19111)

(declare-fun choose!417 (array!15118 array!15118 array!15118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19111)

(assert (=> d!92340 (= lt!409742 (choose!417 (buf!7046 w1!591) (buf!7046 w2!587) (buf!7046 w3!25) #b00000000000000000000000000000000 (currentByte!13020 w1!591) (currentByte!13020 w2!587)))))

(assert (=> d!92340 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13020 w1!591)) (bvsle (currentByte!13020 w1!591) (currentByte!13020 w2!587)))))

(assert (=> d!92340 (= (arrayRangesEqTransitive!373 (buf!7046 w1!591) (buf!7046 w2!587) (buf!7046 w3!25) #b00000000000000000000000000000000 (currentByte!13020 w1!591) (currentByte!13020 w2!587)) lt!409742)))

(declare-fun bs!23313 () Bool)

(assert (= bs!23313 d!92340))

(assert (=> bs!23313 m!403367))

(declare-fun m!403431 () Bool)

(assert (=> bs!23313 m!403431))

(assert (=> b!271118 d!92340))

(declare-fun d!92352 () Bool)

(assert (=> d!92352 (= (array_inv!6302 (buf!7046 w1!591)) (bvsge (size!6578 (buf!7046 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!271117 d!92352))

(declare-fun d!92354 () Bool)

(assert (=> d!92354 (= (array_inv!6302 (buf!7046 w3!25)) (bvsge (size!6578 (buf!7046 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!271112 d!92354))

(declare-fun d!92356 () Bool)

(assert (=> d!92356 (= (byteRangesEq!0 (select (arr!7565 (buf!7046 w1!591)) (currentByte!13020 w1!591)) (select (arr!7565 (buf!7046 w3!25)) (currentByte!13020 w1!591)) #b00000000000000000000000000000000 (currentBit!13015 w1!591)) (or (= #b00000000000000000000000000000000 (currentBit!13015 w1!591)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7565 (buf!7046 w1!591)) (currentByte!13020 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13015 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7565 (buf!7046 w3!25)) (currentByte!13020 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13015 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23315 () Bool)

(assert (= bs!23315 d!92356))

(declare-fun m!403435 () Bool)

(assert (=> bs!23315 m!403435))

(declare-fun m!403437 () Bool)

(assert (=> bs!23315 m!403437))

(assert (=> b!271116 d!92356))

(declare-fun d!92360 () Bool)

(declare-fun res!225941 () Bool)

(declare-fun e!191059 () Bool)

(assert (=> d!92360 (=> (not res!225941) (not e!191059))))

(assert (=> d!92360 (= res!225941 (= (size!6578 (buf!7046 w1!591)) (size!6578 (buf!7046 w2!587))))))

(assert (=> d!92360 (= (isPrefixOf!0 w1!591 w2!587) e!191059)))

(declare-fun b!271173 () Bool)

(declare-fun res!225942 () Bool)

(assert (=> b!271173 (=> (not res!225942) (not e!191059))))

(assert (=> b!271173 (= res!225942 (bvsle (bitIndex!0 (size!6578 (buf!7046 w1!591)) (currentByte!13020 w1!591) (currentBit!13015 w1!591)) (bitIndex!0 (size!6578 (buf!7046 w2!587)) (currentByte!13020 w2!587) (currentBit!13015 w2!587))))))

(declare-fun b!271174 () Bool)

(declare-fun e!191058 () Bool)

(assert (=> b!271174 (= e!191059 e!191058)))

(declare-fun res!225943 () Bool)

(assert (=> b!271174 (=> res!225943 e!191058)))

(assert (=> b!271174 (= res!225943 (= (size!6578 (buf!7046 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!271175 () Bool)

(assert (=> b!271175 (= e!191058 (arrayBitRangesEq!0 (buf!7046 w1!591) (buf!7046 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6578 (buf!7046 w1!591)) (currentByte!13020 w1!591) (currentBit!13015 w1!591))))))

(assert (= (and d!92360 res!225941) b!271173))

(assert (= (and b!271173 res!225942) b!271174))

(assert (= (and b!271174 (not res!225943)) b!271175))

(declare-fun m!403439 () Bool)

(assert (=> b!271173 m!403439))

(assert (=> b!271173 m!403405))

(assert (=> b!271175 m!403439))

(assert (=> b!271175 m!403439))

(declare-fun m!403441 () Bool)

(assert (=> b!271175 m!403441))

(assert (=> start!59212 d!92360))

(declare-fun d!92362 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92362 (= (inv!12 w1!591) (invariant!0 (currentBit!13015 w1!591) (currentByte!13020 w1!591) (size!6578 (buf!7046 w1!591))))))

(declare-fun bs!23316 () Bool)

(assert (= bs!23316 d!92362))

(declare-fun m!403453 () Bool)

(assert (=> bs!23316 m!403453))

(assert (=> start!59212 d!92362))

(declare-fun d!92368 () Bool)

(assert (=> d!92368 (= (inv!12 w2!587) (invariant!0 (currentBit!13015 w2!587) (currentByte!13020 w2!587) (size!6578 (buf!7046 w2!587))))))

(declare-fun bs!23317 () Bool)

(assert (= bs!23317 d!92368))

(declare-fun m!403455 () Bool)

(assert (=> bs!23317 m!403455))

(assert (=> start!59212 d!92368))

(declare-fun d!92370 () Bool)

(assert (=> d!92370 (= (inv!12 w3!25) (invariant!0 (currentBit!13015 w3!25) (currentByte!13020 w3!25) (size!6578 (buf!7046 w3!25))))))

(declare-fun bs!23318 () Bool)

(assert (= bs!23318 d!92370))

(declare-fun m!403457 () Bool)

(assert (=> bs!23318 m!403457))

(assert (=> start!59212 d!92370))

(declare-fun d!92372 () Bool)

(assert (=> d!92372 (and (bvsge (currentByte!13020 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13020 w1!591) (size!6578 (buf!7046 w2!587))) (bvslt (currentByte!13020 w1!591) (size!6578 (buf!7046 w3!25))) (= (select (arr!7565 (buf!7046 w2!587)) (currentByte!13020 w1!591)) (select (arr!7565 (buf!7046 w3!25)) (currentByte!13020 w1!591))))))

(declare-fun lt!409748 () Unit!19111)

(declare-fun choose!420 (array!15118 array!15118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19111)

(assert (=> d!92372 (= lt!409748 (choose!420 (buf!7046 w2!587) (buf!7046 w3!25) #b00000000000000000000000000000000 (currentByte!13020 w1!591) (currentByte!13020 w2!587)))))

(assert (=> d!92372 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13020 w2!587)))))

(assert (=> d!92372 (= (arrayRangesEqImpliesEq!170 (buf!7046 w2!587) (buf!7046 w3!25) #b00000000000000000000000000000000 (currentByte!13020 w1!591) (currentByte!13020 w2!587)) lt!409748)))

(declare-fun bs!23322 () Bool)

(assert (= bs!23322 d!92372))

(assert (=> bs!23322 m!403341))

(assert (=> bs!23322 m!403343))

(declare-fun m!403471 () Bool)

(assert (=> bs!23322 m!403471))

(assert (=> b!271115 d!92372))

(declare-fun d!92382 () Bool)

(assert (=> d!92382 (= (array_inv!6302 (buf!7046 w2!587)) (bvsge (size!6578 (buf!7046 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!271114 d!92382))

(check-sat (not d!92368) (not d!92362) (not b!271173) (not d!92370) (not b!271146) (not b!271175) (not b!271148) (not d!92372) (not d!92340) (not b!271164))
(check-sat)
(get-model)

(declare-fun d!92396 () Bool)

(assert (=> d!92396 (= (invariant!0 (currentBit!13015 w1!591) (currentByte!13020 w1!591) (size!6578 (buf!7046 w1!591))) (and (bvsge (currentBit!13015 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!13015 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!13020 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!13020 w1!591) (size!6578 (buf!7046 w1!591))) (and (= (currentBit!13015 w1!591) #b00000000000000000000000000000000) (= (currentByte!13020 w1!591) (size!6578 (buf!7046 w1!591)))))))))

(assert (=> d!92362 d!92396))

(declare-fun d!92398 () Bool)

(declare-fun e!191074 () Bool)

(assert (=> d!92398 e!191074))

(declare-fun res!225967 () Bool)

(assert (=> d!92398 (=> (not res!225967) (not e!191074))))

(declare-fun lt!409767 () (_ BitVec 64))

(declare-fun lt!409771 () (_ BitVec 64))

(declare-fun lt!409769 () (_ BitVec 64))

(assert (=> d!92398 (= res!225967 (= lt!409771 (bvsub lt!409767 lt!409769)))))

(assert (=> d!92398 (or (= (bvand lt!409767 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409769 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409767 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409767 lt!409769) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!92398 (= lt!409769 (remainingBits!0 ((_ sign_extend 32) (size!6578 (buf!7046 w1!591))) ((_ sign_extend 32) (currentByte!13020 w1!591)) ((_ sign_extend 32) (currentBit!13015 w1!591))))))

(declare-fun lt!409768 () (_ BitVec 64))

(declare-fun lt!409770 () (_ BitVec 64))

(assert (=> d!92398 (= lt!409767 (bvmul lt!409768 lt!409770))))

(assert (=> d!92398 (or (= lt!409768 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409770 (bvsdiv (bvmul lt!409768 lt!409770) lt!409768)))))

(assert (=> d!92398 (= lt!409770 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!92398 (= lt!409768 ((_ sign_extend 32) (size!6578 (buf!7046 w1!591))))))

(assert (=> d!92398 (= lt!409771 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13020 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13015 w1!591))))))

(assert (=> d!92398 (invariant!0 (currentBit!13015 w1!591) (currentByte!13020 w1!591) (size!6578 (buf!7046 w1!591)))))

(assert (=> d!92398 (= (bitIndex!0 (size!6578 (buf!7046 w1!591)) (currentByte!13020 w1!591) (currentBit!13015 w1!591)) lt!409771)))

(declare-fun b!271198 () Bool)

(declare-fun res!225966 () Bool)

(assert (=> b!271198 (=> (not res!225966) (not e!191074))))

(assert (=> b!271198 (= res!225966 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409771))))

(declare-fun b!271199 () Bool)

(declare-fun lt!409772 () (_ BitVec 64))

(assert (=> b!271199 (= e!191074 (bvsle lt!409771 (bvmul lt!409772 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271199 (or (= lt!409772 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409772 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409772)))))

(assert (=> b!271199 (= lt!409772 ((_ sign_extend 32) (size!6578 (buf!7046 w1!591))))))

(assert (= (and d!92398 res!225967) b!271198))

(assert (= (and b!271198 res!225966) b!271199))

(declare-fun m!403491 () Bool)

(assert (=> d!92398 m!403491))

(assert (=> d!92398 m!403453))

(assert (=> b!271173 d!92398))

(declare-fun d!92400 () Bool)

(declare-fun e!191075 () Bool)

(assert (=> d!92400 e!191075))

(declare-fun res!225969 () Bool)

(assert (=> d!92400 (=> (not res!225969) (not e!191075))))

(declare-fun lt!409773 () (_ BitVec 64))

(declare-fun lt!409777 () (_ BitVec 64))

(declare-fun lt!409775 () (_ BitVec 64))

(assert (=> d!92400 (= res!225969 (= lt!409777 (bvsub lt!409773 lt!409775)))))

(assert (=> d!92400 (or (= (bvand lt!409773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409775 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409773 lt!409775) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!92400 (= lt!409775 (remainingBits!0 ((_ sign_extend 32) (size!6578 (buf!7046 w2!587))) ((_ sign_extend 32) (currentByte!13020 w2!587)) ((_ sign_extend 32) (currentBit!13015 w2!587))))))

(declare-fun lt!409774 () (_ BitVec 64))

(declare-fun lt!409776 () (_ BitVec 64))

(assert (=> d!92400 (= lt!409773 (bvmul lt!409774 lt!409776))))

(assert (=> d!92400 (or (= lt!409774 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409776 (bvsdiv (bvmul lt!409774 lt!409776) lt!409774)))))

(assert (=> d!92400 (= lt!409776 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!92400 (= lt!409774 ((_ sign_extend 32) (size!6578 (buf!7046 w2!587))))))

(assert (=> d!92400 (= lt!409777 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13020 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13015 w2!587))))))

(assert (=> d!92400 (invariant!0 (currentBit!13015 w2!587) (currentByte!13020 w2!587) (size!6578 (buf!7046 w2!587)))))

(assert (=> d!92400 (= (bitIndex!0 (size!6578 (buf!7046 w2!587)) (currentByte!13020 w2!587) (currentBit!13015 w2!587)) lt!409777)))

(declare-fun b!271200 () Bool)

(declare-fun res!225968 () Bool)

(assert (=> b!271200 (=> (not res!225968) (not e!191075))))

(assert (=> b!271200 (= res!225968 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409777))))

(declare-fun b!271201 () Bool)

(declare-fun lt!409778 () (_ BitVec 64))

(assert (=> b!271201 (= e!191075 (bvsle lt!409777 (bvmul lt!409778 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271201 (or (= lt!409778 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409778 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409778)))))

(assert (=> b!271201 (= lt!409778 ((_ sign_extend 32) (size!6578 (buf!7046 w2!587))))))

(assert (= (and d!92400 res!225969) b!271200))

(assert (= (and b!271200 res!225968) b!271201))

(declare-fun m!403493 () Bool)

(assert (=> d!92400 m!403493))

(assert (=> d!92400 m!403455))

(assert (=> b!271173 d!92400))

(declare-fun d!92402 () Bool)

(declare-fun res!225970 () Bool)

(declare-fun e!191076 () Bool)

(assert (=> d!92402 (=> res!225970 e!191076)))

(assert (=> d!92402 (= res!225970 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13020 w1!591)))))

(assert (=> d!92402 (= (arrayRangesEq!1110 (buf!7046 w1!591) (buf!7046 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13020 w1!591)) e!191076)))

(declare-fun b!271202 () Bool)

(declare-fun e!191077 () Bool)

(assert (=> b!271202 (= e!191076 e!191077)))

(declare-fun res!225971 () Bool)

(assert (=> b!271202 (=> (not res!225971) (not e!191077))))

(assert (=> b!271202 (= res!225971 (= (select (arr!7565 (buf!7046 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7565 (buf!7046 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!271203 () Bool)

(assert (=> b!271203 (= e!191077 (arrayRangesEq!1110 (buf!7046 w1!591) (buf!7046 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13020 w1!591)))))

(assert (= (and d!92402 (not res!225970)) b!271202))

(assert (= (and b!271202 res!225971) b!271203))

(declare-fun m!403495 () Bool)

(assert (=> b!271202 m!403495))

(declare-fun m!403497 () Bool)

(assert (=> b!271202 m!403497))

(declare-fun m!403499 () Bool)

(assert (=> b!271203 m!403499))

(assert (=> b!271164 d!92402))

(declare-fun d!92404 () Bool)

(assert (=> d!92404 (= (invariant!0 (currentBit!13015 w2!587) (currentByte!13020 w2!587) (size!6578 (buf!7046 w2!587))) (and (bvsge (currentBit!13015 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!13015 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!13020 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!13020 w2!587) (size!6578 (buf!7046 w2!587))) (and (= (currentBit!13015 w2!587) #b00000000000000000000000000000000) (= (currentByte!13020 w2!587) (size!6578 (buf!7046 w2!587)))))))))

(assert (=> d!92368 d!92404))

(declare-fun b!271218 () Bool)

(declare-datatypes ((tuple4!462 0))(
  ( (tuple4!463 (_1!12214 (_ BitVec 32)) (_2!12214 (_ BitVec 32)) (_3!1011 (_ BitVec 32)) (_4!231 (_ BitVec 32))) )
))
(declare-fun lt!409785 () tuple4!462)

(declare-fun e!191090 () Bool)

(assert (=> b!271218 (= e!191090 (arrayRangesEq!1110 (buf!7046 w2!587) (buf!7046 w3!25) (_1!12214 lt!409785) (_2!12214 lt!409785)))))

(declare-fun b!271219 () Bool)

(declare-fun e!191091 () Bool)

(declare-fun e!191094 () Bool)

(assert (=> b!271219 (= e!191091 e!191094)))

(declare-fun res!225985 () Bool)

(declare-fun call!4334 () Bool)

(assert (=> b!271219 (= res!225985 call!4334)))

(assert (=> b!271219 (=> (not res!225985) (not e!191094))))

(declare-fun d!92406 () Bool)

(declare-fun res!225983 () Bool)

(declare-fun e!191095 () Bool)

(assert (=> d!92406 (=> res!225983 e!191095)))

(assert (=> d!92406 (= res!225983 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6578 (buf!7046 w2!587)) (currentByte!13020 w2!587) (currentBit!13015 w2!587))))))

(assert (=> d!92406 (= (arrayBitRangesEq!0 (buf!7046 w2!587) (buf!7046 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6578 (buf!7046 w2!587)) (currentByte!13020 w2!587) (currentBit!13015 w2!587))) e!191095)))

(declare-fun b!271220 () Bool)

(declare-fun res!225984 () Bool)

(declare-fun lt!409786 () (_ BitVec 32))

(assert (=> b!271220 (= res!225984 (= lt!409786 #b00000000000000000000000000000000))))

(declare-fun e!191092 () Bool)

(assert (=> b!271220 (=> res!225984 e!191092)))

(assert (=> b!271220 (= e!191094 e!191092)))

(declare-fun b!271221 () Bool)

(assert (=> b!271221 (= e!191091 call!4334)))

(declare-fun c!12483 () Bool)

(declare-fun lt!409787 () (_ BitVec 32))

(declare-fun bm!4331 () Bool)

(assert (=> bm!4331 (= call!4334 (byteRangesEq!0 (select (arr!7565 (buf!7046 w2!587)) (_3!1011 lt!409785)) (select (arr!7565 (buf!7046 w3!25)) (_3!1011 lt!409785)) lt!409787 (ite c!12483 lt!409786 #b00000000000000000000000000001000)))))

(declare-fun b!271222 () Bool)

(declare-fun e!191093 () Bool)

(assert (=> b!271222 (= e!191093 e!191091)))

(assert (=> b!271222 (= c!12483 (= (_3!1011 lt!409785) (_4!231 lt!409785)))))

(declare-fun b!271223 () Bool)

(assert (=> b!271223 (= e!191095 e!191093)))

(declare-fun res!225986 () Bool)

(assert (=> b!271223 (=> (not res!225986) (not e!191093))))

(assert (=> b!271223 (= res!225986 e!191090)))

(declare-fun res!225982 () Bool)

(assert (=> b!271223 (=> res!225982 e!191090)))

(assert (=> b!271223 (= res!225982 (bvsge (_1!12214 lt!409785) (_2!12214 lt!409785)))))

(assert (=> b!271223 (= lt!409786 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6578 (buf!7046 w2!587)) (currentByte!13020 w2!587) (currentBit!13015 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271223 (= lt!409787 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!462)

(assert (=> b!271223 (= lt!409785 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6578 (buf!7046 w2!587)) (currentByte!13020 w2!587) (currentBit!13015 w2!587))))))

(declare-fun b!271224 () Bool)

(assert (=> b!271224 (= e!191092 (byteRangesEq!0 (select (arr!7565 (buf!7046 w2!587)) (_4!231 lt!409785)) (select (arr!7565 (buf!7046 w3!25)) (_4!231 lt!409785)) #b00000000000000000000000000000000 lt!409786))))

(assert (= (and d!92406 (not res!225983)) b!271223))

(assert (= (and b!271223 (not res!225982)) b!271218))

(assert (= (and b!271223 res!225986) b!271222))

(assert (= (and b!271222 c!12483) b!271221))

(assert (= (and b!271222 (not c!12483)) b!271219))

(assert (= (and b!271219 res!225985) b!271220))

(assert (= (and b!271220 (not res!225984)) b!271224))

(assert (= (or b!271221 b!271219) bm!4331))

(declare-fun m!403501 () Bool)

(assert (=> b!271218 m!403501))

(declare-fun m!403503 () Bool)

(assert (=> bm!4331 m!403503))

(declare-fun m!403505 () Bool)

(assert (=> bm!4331 m!403505))

(assert (=> bm!4331 m!403503))

(assert (=> bm!4331 m!403505))

(declare-fun m!403507 () Bool)

(assert (=> bm!4331 m!403507))

(assert (=> b!271223 m!403405))

(declare-fun m!403509 () Bool)

(assert (=> b!271223 m!403509))

(declare-fun m!403511 () Bool)

(assert (=> b!271224 m!403511))

(declare-fun m!403513 () Bool)

(assert (=> b!271224 m!403513))

(assert (=> b!271224 m!403511))

(assert (=> b!271224 m!403513))

(declare-fun m!403515 () Bool)

(assert (=> b!271224 m!403515))

(assert (=> b!271148 d!92406))

(assert (=> b!271148 d!92400))

(declare-fun b!271225 () Bool)

(declare-fun lt!409788 () tuple4!462)

(declare-fun e!191096 () Bool)

(assert (=> b!271225 (= e!191096 (arrayRangesEq!1110 (buf!7046 w1!591) (buf!7046 w2!587) (_1!12214 lt!409788) (_2!12214 lt!409788)))))

(declare-fun b!271226 () Bool)

(declare-fun e!191097 () Bool)

(declare-fun e!191100 () Bool)

(assert (=> b!271226 (= e!191097 e!191100)))

(declare-fun res!225990 () Bool)

(declare-fun call!4335 () Bool)

(assert (=> b!271226 (= res!225990 call!4335)))

(assert (=> b!271226 (=> (not res!225990) (not e!191100))))

(declare-fun d!92410 () Bool)

(declare-fun res!225988 () Bool)

(declare-fun e!191101 () Bool)

(assert (=> d!92410 (=> res!225988 e!191101)))

(assert (=> d!92410 (= res!225988 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6578 (buf!7046 w1!591)) (currentByte!13020 w1!591) (currentBit!13015 w1!591))))))

(assert (=> d!92410 (= (arrayBitRangesEq!0 (buf!7046 w1!591) (buf!7046 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6578 (buf!7046 w1!591)) (currentByte!13020 w1!591) (currentBit!13015 w1!591))) e!191101)))

(declare-fun b!271227 () Bool)

(declare-fun res!225989 () Bool)

(declare-fun lt!409789 () (_ BitVec 32))

(assert (=> b!271227 (= res!225989 (= lt!409789 #b00000000000000000000000000000000))))

(declare-fun e!191098 () Bool)

(assert (=> b!271227 (=> res!225989 e!191098)))

(assert (=> b!271227 (= e!191100 e!191098)))

(declare-fun b!271228 () Bool)

(assert (=> b!271228 (= e!191097 call!4335)))

(declare-fun c!12484 () Bool)

(declare-fun bm!4332 () Bool)

(declare-fun lt!409790 () (_ BitVec 32))

(assert (=> bm!4332 (= call!4335 (byteRangesEq!0 (select (arr!7565 (buf!7046 w1!591)) (_3!1011 lt!409788)) (select (arr!7565 (buf!7046 w2!587)) (_3!1011 lt!409788)) lt!409790 (ite c!12484 lt!409789 #b00000000000000000000000000001000)))))

(declare-fun b!271229 () Bool)

(declare-fun e!191099 () Bool)

(assert (=> b!271229 (= e!191099 e!191097)))

(assert (=> b!271229 (= c!12484 (= (_3!1011 lt!409788) (_4!231 lt!409788)))))

(declare-fun b!271230 () Bool)

(assert (=> b!271230 (= e!191101 e!191099)))

(declare-fun res!225991 () Bool)

(assert (=> b!271230 (=> (not res!225991) (not e!191099))))

(assert (=> b!271230 (= res!225991 e!191096)))

(declare-fun res!225987 () Bool)

(assert (=> b!271230 (=> res!225987 e!191096)))

(assert (=> b!271230 (= res!225987 (bvsge (_1!12214 lt!409788) (_2!12214 lt!409788)))))

(assert (=> b!271230 (= lt!409789 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6578 (buf!7046 w1!591)) (currentByte!13020 w1!591) (currentBit!13015 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271230 (= lt!409790 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271230 (= lt!409788 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6578 (buf!7046 w1!591)) (currentByte!13020 w1!591) (currentBit!13015 w1!591))))))

(declare-fun b!271231 () Bool)

(assert (=> b!271231 (= e!191098 (byteRangesEq!0 (select (arr!7565 (buf!7046 w1!591)) (_4!231 lt!409788)) (select (arr!7565 (buf!7046 w2!587)) (_4!231 lt!409788)) #b00000000000000000000000000000000 lt!409789))))

(assert (= (and d!92410 (not res!225988)) b!271230))

(assert (= (and b!271230 (not res!225987)) b!271225))

(assert (= (and b!271230 res!225991) b!271229))

(assert (= (and b!271229 c!12484) b!271228))

(assert (= (and b!271229 (not c!12484)) b!271226))

(assert (= (and b!271226 res!225990) b!271227))

(assert (= (and b!271227 (not res!225989)) b!271231))

(assert (= (or b!271228 b!271226) bm!4332))

(declare-fun m!403517 () Bool)

(assert (=> b!271225 m!403517))

(declare-fun m!403519 () Bool)

(assert (=> bm!4332 m!403519))

(declare-fun m!403521 () Bool)

(assert (=> bm!4332 m!403521))

(assert (=> bm!4332 m!403519))

(assert (=> bm!4332 m!403521))

(declare-fun m!403523 () Bool)

(assert (=> bm!4332 m!403523))

(assert (=> b!271230 m!403439))

(declare-fun m!403525 () Bool)

(assert (=> b!271230 m!403525))

(declare-fun m!403527 () Bool)

(assert (=> b!271231 m!403527))

(declare-fun m!403529 () Bool)

(assert (=> b!271231 m!403529))

(assert (=> b!271231 m!403527))

(assert (=> b!271231 m!403529))

(declare-fun m!403531 () Bool)

(assert (=> b!271231 m!403531))

(assert (=> b!271175 d!92410))

(assert (=> b!271175 d!92398))

(declare-fun d!92414 () Bool)

(assert (=> d!92414 (= (invariant!0 (currentBit!13015 w3!25) (currentByte!13020 w3!25) (size!6578 (buf!7046 w3!25))) (and (bvsge (currentBit!13015 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!13015 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!13020 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!13020 w3!25) (size!6578 (buf!7046 w3!25))) (and (= (currentBit!13015 w3!25) #b00000000000000000000000000000000) (= (currentByte!13020 w3!25) (size!6578 (buf!7046 w3!25)))))))))

(assert (=> d!92370 d!92414))

(declare-fun d!92416 () Bool)

(assert (=> d!92416 (= (select (arr!7565 (buf!7046 w2!587)) (currentByte!13020 w1!591)) (select (arr!7565 (buf!7046 w3!25)) (currentByte!13020 w1!591)))))

(assert (=> d!92416 true))

(declare-fun _$12!105 () Unit!19111)

(assert (=> d!92416 (= (choose!420 (buf!7046 w2!587) (buf!7046 w3!25) #b00000000000000000000000000000000 (currentByte!13020 w1!591) (currentByte!13020 w2!587)) _$12!105)))

(declare-fun bs!23330 () Bool)

(assert (= bs!23330 d!92416))

(assert (=> bs!23330 m!403341))

(assert (=> bs!23330 m!403343))

(assert (=> d!92372 d!92416))

(assert (=> d!92340 d!92336))

(declare-fun d!92420 () Bool)

(assert (=> d!92420 (arrayRangesEq!1110 (buf!7046 w1!591) (buf!7046 w3!25) #b00000000000000000000000000000000 (currentByte!13020 w1!591))))

(assert (=> d!92420 true))

(declare-fun _$16!143 () Unit!19111)

(assert (=> d!92420 (= (choose!417 (buf!7046 w1!591) (buf!7046 w2!587) (buf!7046 w3!25) #b00000000000000000000000000000000 (currentByte!13020 w1!591) (currentByte!13020 w2!587)) _$16!143)))

(declare-fun bs!23331 () Bool)

(assert (= bs!23331 d!92420))

(assert (=> bs!23331 m!403367))

(assert (=> d!92340 d!92420))

(assert (=> b!271146 d!92400))

(declare-fun d!92422 () Bool)

(declare-fun e!191102 () Bool)

(assert (=> d!92422 e!191102))

(declare-fun res!225993 () Bool)

(assert (=> d!92422 (=> (not res!225993) (not e!191102))))

(declare-fun lt!409795 () (_ BitVec 64))

(declare-fun lt!409791 () (_ BitVec 64))

(declare-fun lt!409793 () (_ BitVec 64))

(assert (=> d!92422 (= res!225993 (= lt!409795 (bvsub lt!409791 lt!409793)))))

(assert (=> d!92422 (or (= (bvand lt!409791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409793 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409791 lt!409793) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!92422 (= lt!409793 (remainingBits!0 ((_ sign_extend 32) (size!6578 (buf!7046 w3!25))) ((_ sign_extend 32) (currentByte!13020 w3!25)) ((_ sign_extend 32) (currentBit!13015 w3!25))))))

(declare-fun lt!409792 () (_ BitVec 64))

(declare-fun lt!409794 () (_ BitVec 64))

(assert (=> d!92422 (= lt!409791 (bvmul lt!409792 lt!409794))))

(assert (=> d!92422 (or (= lt!409792 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409794 (bvsdiv (bvmul lt!409792 lt!409794) lt!409792)))))

(assert (=> d!92422 (= lt!409794 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!92422 (= lt!409792 ((_ sign_extend 32) (size!6578 (buf!7046 w3!25))))))

(assert (=> d!92422 (= lt!409795 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13020 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13015 w3!25))))))

(assert (=> d!92422 (invariant!0 (currentBit!13015 w3!25) (currentByte!13020 w3!25) (size!6578 (buf!7046 w3!25)))))

(assert (=> d!92422 (= (bitIndex!0 (size!6578 (buf!7046 w3!25)) (currentByte!13020 w3!25) (currentBit!13015 w3!25)) lt!409795)))

(declare-fun b!271232 () Bool)

(declare-fun res!225992 () Bool)

(assert (=> b!271232 (=> (not res!225992) (not e!191102))))

(assert (=> b!271232 (= res!225992 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409795))))

(declare-fun b!271233 () Bool)

(declare-fun lt!409796 () (_ BitVec 64))

(assert (=> b!271233 (= e!191102 (bvsle lt!409795 (bvmul lt!409796 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271233 (or (= lt!409796 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409796 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409796)))))

(assert (=> b!271233 (= lt!409796 ((_ sign_extend 32) (size!6578 (buf!7046 w3!25))))))

(assert (= (and d!92422 res!225993) b!271232))

(assert (= (and b!271232 res!225992) b!271233))

(declare-fun m!403533 () Bool)

(assert (=> d!92422 m!403533))

(assert (=> d!92422 m!403457))

(assert (=> b!271146 d!92422))

(check-sat (not b!271223) (not bm!4332) (not b!271218) (not d!92420) (not b!271230) (not d!92400) (not d!92398) (not b!271203) (not b!271231) (not bm!4331) (not b!271225) (not b!271224) (not d!92422))
(check-sat)
(get-model)

(declare-fun d!92462 () Bool)

(assert (=> d!92462 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6578 (buf!7046 w1!591)) (currentByte!13020 w1!591) (currentBit!13015 w1!591))) (tuple4!463 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6578 (buf!7046 w1!591)) (currentByte!13020 w1!591) (currentBit!13015 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6578 (buf!7046 w1!591)) (currentByte!13020 w1!591) (currentBit!13015 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!271230 d!92462))

(declare-fun d!92464 () Bool)

(assert (=> d!92464 (= (byteRangesEq!0 (select (arr!7565 (buf!7046 w2!587)) (_4!231 lt!409785)) (select (arr!7565 (buf!7046 w3!25)) (_4!231 lt!409785)) #b00000000000000000000000000000000 lt!409786) (or (= #b00000000000000000000000000000000 lt!409786) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7565 (buf!7046 w2!587)) (_4!231 lt!409785))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409786))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7565 (buf!7046 w3!25)) (_4!231 lt!409785))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409786))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23335 () Bool)

(assert (= bs!23335 d!92464))

(declare-fun m!403623 () Bool)

(assert (=> bs!23335 m!403623))

(assert (=> bs!23335 m!403437))

(assert (=> b!271224 d!92464))

(declare-fun d!92466 () Bool)

(assert (=> d!92466 (= (byteRangesEq!0 (select (arr!7565 (buf!7046 w1!591)) (_3!1011 lt!409788)) (select (arr!7565 (buf!7046 w2!587)) (_3!1011 lt!409788)) lt!409790 (ite c!12484 lt!409789 #b00000000000000000000000000001000)) (or (= lt!409790 (ite c!12484 lt!409789 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7565 (buf!7046 w1!591)) (_3!1011 lt!409788))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12484 lt!409789 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409790)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7565 (buf!7046 w2!587)) (_3!1011 lt!409788))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12484 lt!409789 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409790)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23336 () Bool)

(assert (= bs!23336 d!92466))

(declare-fun m!403625 () Bool)

(assert (=> bs!23336 m!403625))

(declare-fun m!403627 () Bool)

(assert (=> bs!23336 m!403627))

(assert (=> bm!4332 d!92466))

(declare-fun d!92468 () Bool)

(assert (=> d!92468 (= (remainingBits!0 ((_ sign_extend 32) (size!6578 (buf!7046 w1!591))) ((_ sign_extend 32) (currentByte!13020 w1!591)) ((_ sign_extend 32) (currentBit!13015 w1!591))) (bvsub (bvmul ((_ sign_extend 32) (size!6578 (buf!7046 w1!591))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13020 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13015 w1!591)))))))

(assert (=> d!92398 d!92468))

(assert (=> d!92398 d!92396))

(declare-fun d!92470 () Bool)

(assert (=> d!92470 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6578 (buf!7046 w2!587)) (currentByte!13020 w2!587) (currentBit!13015 w2!587))) (tuple4!463 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6578 (buf!7046 w2!587)) (currentByte!13020 w2!587) (currentBit!13015 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6578 (buf!7046 w2!587)) (currentByte!13020 w2!587) (currentBit!13015 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!271223 d!92470))

(declare-fun d!92472 () Bool)

(assert (=> d!92472 (= (byteRangesEq!0 (select (arr!7565 (buf!7046 w2!587)) (_3!1011 lt!409785)) (select (arr!7565 (buf!7046 w3!25)) (_3!1011 lt!409785)) lt!409787 (ite c!12483 lt!409786 #b00000000000000000000000000001000)) (or (= lt!409787 (ite c!12483 lt!409786 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7565 (buf!7046 w2!587)) (_3!1011 lt!409785))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12483 lt!409786 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409787)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7565 (buf!7046 w3!25)) (_3!1011 lt!409785))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12483 lt!409786 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409787)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23337 () Bool)

(assert (= bs!23337 d!92472))

(declare-fun m!403629 () Bool)

(assert (=> bs!23337 m!403629))

(declare-fun m!403631 () Bool)

(assert (=> bs!23337 m!403631))

(assert (=> bm!4331 d!92472))

(declare-fun d!92474 () Bool)

(assert (=> d!92474 (= (remainingBits!0 ((_ sign_extend 32) (size!6578 (buf!7046 w2!587))) ((_ sign_extend 32) (currentByte!13020 w2!587)) ((_ sign_extend 32) (currentBit!13015 w2!587))) (bvsub (bvmul ((_ sign_extend 32) (size!6578 (buf!7046 w2!587))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13020 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13015 w2!587)))))))

(assert (=> d!92400 d!92474))

(assert (=> d!92400 d!92404))

(declare-fun d!92476 () Bool)

(declare-fun res!226058 () Bool)

(declare-fun e!191165 () Bool)

(assert (=> d!92476 (=> res!226058 e!191165)))

(assert (=> d!92476 (= res!226058 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13020 w1!591)))))

(assert (=> d!92476 (= (arrayRangesEq!1110 (buf!7046 w1!591) (buf!7046 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13020 w1!591)) e!191165)))

(declare-fun b!271314 () Bool)

(declare-fun e!191166 () Bool)

(assert (=> b!271314 (= e!191165 e!191166)))

(declare-fun res!226059 () Bool)

(assert (=> b!271314 (=> (not res!226059) (not e!191166))))

(assert (=> b!271314 (= res!226059 (= (select (arr!7565 (buf!7046 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7565 (buf!7046 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!271315 () Bool)

(assert (=> b!271315 (= e!191166 (arrayRangesEq!1110 (buf!7046 w1!591) (buf!7046 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13020 w1!591)))))

(assert (= (and d!92476 (not res!226058)) b!271314))

(assert (= (and b!271314 res!226059) b!271315))

(declare-fun m!403633 () Bool)

(assert (=> b!271314 m!403633))

(declare-fun m!403635 () Bool)

(assert (=> b!271314 m!403635))

(declare-fun m!403637 () Bool)

(assert (=> b!271315 m!403637))

(assert (=> b!271203 d!92476))

(declare-fun d!92478 () Bool)

(declare-fun res!226060 () Bool)

(declare-fun e!191167 () Bool)

(assert (=> d!92478 (=> res!226060 e!191167)))

(assert (=> d!92478 (= res!226060 (= (_1!12214 lt!409788) (_2!12214 lt!409788)))))

(assert (=> d!92478 (= (arrayRangesEq!1110 (buf!7046 w1!591) (buf!7046 w2!587) (_1!12214 lt!409788) (_2!12214 lt!409788)) e!191167)))

(declare-fun b!271316 () Bool)

(declare-fun e!191168 () Bool)

(assert (=> b!271316 (= e!191167 e!191168)))

(declare-fun res!226061 () Bool)

(assert (=> b!271316 (=> (not res!226061) (not e!191168))))

(assert (=> b!271316 (= res!226061 (= (select (arr!7565 (buf!7046 w1!591)) (_1!12214 lt!409788)) (select (arr!7565 (buf!7046 w2!587)) (_1!12214 lt!409788))))))

(declare-fun b!271317 () Bool)

(assert (=> b!271317 (= e!191168 (arrayRangesEq!1110 (buf!7046 w1!591) (buf!7046 w2!587) (bvadd (_1!12214 lt!409788) #b00000000000000000000000000000001) (_2!12214 lt!409788)))))

(assert (= (and d!92478 (not res!226060)) b!271316))

(assert (= (and b!271316 res!226061) b!271317))

(declare-fun m!403639 () Bool)

(assert (=> b!271316 m!403639))

(declare-fun m!403641 () Bool)

(assert (=> b!271316 m!403641))

(declare-fun m!403643 () Bool)

(assert (=> b!271317 m!403643))

(assert (=> b!271225 d!92478))

(declare-fun d!92480 () Bool)

(declare-fun res!226062 () Bool)

(declare-fun e!191169 () Bool)

(assert (=> d!92480 (=> res!226062 e!191169)))

(assert (=> d!92480 (= res!226062 (= (_1!12214 lt!409785) (_2!12214 lt!409785)))))

(assert (=> d!92480 (= (arrayRangesEq!1110 (buf!7046 w2!587) (buf!7046 w3!25) (_1!12214 lt!409785) (_2!12214 lt!409785)) e!191169)))

(declare-fun b!271318 () Bool)

(declare-fun e!191170 () Bool)

(assert (=> b!271318 (= e!191169 e!191170)))

(declare-fun res!226063 () Bool)

(assert (=> b!271318 (=> (not res!226063) (not e!191170))))

(assert (=> b!271318 (= res!226063 (= (select (arr!7565 (buf!7046 w2!587)) (_1!12214 lt!409785)) (select (arr!7565 (buf!7046 w3!25)) (_1!12214 lt!409785))))))

(declare-fun b!271319 () Bool)

(assert (=> b!271319 (= e!191170 (arrayRangesEq!1110 (buf!7046 w2!587) (buf!7046 w3!25) (bvadd (_1!12214 lt!409785) #b00000000000000000000000000000001) (_2!12214 lt!409785)))))

(assert (= (and d!92480 (not res!226062)) b!271318))

(assert (= (and b!271318 res!226063) b!271319))

(declare-fun m!403645 () Bool)

(assert (=> b!271318 m!403645))

(declare-fun m!403647 () Bool)

(assert (=> b!271318 m!403647))

(declare-fun m!403649 () Bool)

(assert (=> b!271319 m!403649))

(assert (=> b!271218 d!92480))

(declare-fun d!92482 () Bool)

(assert (=> d!92482 (= (remainingBits!0 ((_ sign_extend 32) (size!6578 (buf!7046 w3!25))) ((_ sign_extend 32) (currentByte!13020 w3!25)) ((_ sign_extend 32) (currentBit!13015 w3!25))) (bvsub (bvmul ((_ sign_extend 32) (size!6578 (buf!7046 w3!25))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13020 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13015 w3!25)))))))

(assert (=> d!92422 d!92482))

(assert (=> d!92422 d!92414))

(assert (=> d!92420 d!92336))

(declare-fun d!92484 () Bool)

(assert (=> d!92484 (= (byteRangesEq!0 (select (arr!7565 (buf!7046 w1!591)) (_4!231 lt!409788)) (select (arr!7565 (buf!7046 w2!587)) (_4!231 lt!409788)) #b00000000000000000000000000000000 lt!409789) (or (= #b00000000000000000000000000000000 lt!409789) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7565 (buf!7046 w1!591)) (_4!231 lt!409788))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409789))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7565 (buf!7046 w2!587)) (_4!231 lt!409788))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409789))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23338 () Bool)

(assert (= bs!23338 d!92484))

(declare-fun m!403651 () Bool)

(assert (=> bs!23338 m!403651))

(assert (=> bs!23338 m!403437))

(assert (=> b!271231 d!92484))

(check-sat (not b!271317) (not b!271315) (not b!271319))
(check-sat)
