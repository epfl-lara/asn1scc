; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59210 () Bool)

(assert start!59210)

(declare-fun b!271091 () Bool)

(declare-fun e!190968 () Bool)

(declare-datatypes ((array!15116 0))(
  ( (array!15117 (arr!7564 (Array (_ BitVec 32) (_ BitVec 8))) (size!6577 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11968 0))(
  ( (BitStream!11969 (buf!7045 array!15116) (currentByte!13019 (_ BitVec 32)) (currentBit!13014 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11968)

(declare-fun array_inv!6301 (array!15116) Bool)

(assert (=> b!271091 (= e!190968 (array_inv!6301 (buf!7045 w1!591)))))

(declare-fun res!225881 () Bool)

(declare-fun e!190970 () Bool)

(assert (=> start!59210 (=> (not res!225881) (not e!190970))))

(declare-fun w2!587 () BitStream!11968)

(declare-fun isPrefixOf!0 (BitStream!11968 BitStream!11968) Bool)

(assert (=> start!59210 (= res!225881 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59210 e!190970))

(declare-fun inv!12 (BitStream!11968) Bool)

(assert (=> start!59210 (and (inv!12 w1!591) e!190968)))

(declare-fun e!190971 () Bool)

(assert (=> start!59210 (and (inv!12 w2!587) e!190971)))

(declare-fun w3!25 () BitStream!11968)

(declare-fun e!190973 () Bool)

(assert (=> start!59210 (and (inv!12 w3!25) e!190973)))

(declare-fun b!271092 () Bool)

(assert (=> b!271092 (= e!190971 (array_inv!6301 (buf!7045 w2!587)))))

(declare-fun b!271093 () Bool)

(declare-fun e!190969 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271093 (= e!190969 (byteRangesEq!0 (select (arr!7564 (buf!7045 w1!591)) (currentByte!13019 w1!591)) (select (arr!7564 (buf!7045 w3!25)) (currentByte!13019 w1!591)) #b00000000000000000000000000000000 (currentBit!13014 w1!591)))))

(declare-fun b!271094 () Bool)

(declare-fun e!190967 () Bool)

(assert (=> b!271094 (= e!190967 e!190969)))

(declare-fun res!225882 () Bool)

(assert (=> b!271094 (=> res!225882 e!190969)))

(assert (=> b!271094 (= res!225882 (not (= ((_ sign_extend 24) (select (arr!7564 (buf!7045 w2!587)) (currentByte!13019 w1!591))) ((_ sign_extend 24) (select (arr!7564 (buf!7045 w3!25)) (currentByte!13019 w1!591))))))))

(assert (=> b!271094 (= (select (arr!7564 (buf!7045 w2!587)) (currentByte!13019 w1!591)) (select (arr!7564 (buf!7045 w3!25)) (currentByte!13019 w1!591)))))

(declare-datatypes ((Unit!19109 0))(
  ( (Unit!19110) )
))
(declare-fun lt!409723 () Unit!19109)

(declare-fun arrayRangesEqImpliesEq!169 (array!15116 array!15116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19109)

(assert (=> b!271094 (= lt!409723 (arrayRangesEqImpliesEq!169 (buf!7045 w2!587) (buf!7045 w3!25) #b00000000000000000000000000000000 (currentByte!13019 w1!591) (currentByte!13019 w2!587)))))

(declare-fun b!271095 () Bool)

(declare-fun res!225883 () Bool)

(assert (=> b!271095 (=> (not res!225883) (not e!190970))))

(assert (=> b!271095 (= res!225883 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!271096 () Bool)

(assert (=> b!271096 (= e!190973 (array_inv!6301 (buf!7045 w3!25)))))

(declare-fun b!271097 () Bool)

(assert (=> b!271097 (= e!190970 (not e!190967))))

(declare-fun res!225880 () Bool)

(assert (=> b!271097 (=> res!225880 e!190967)))

(assert (=> b!271097 (= res!225880 (or (bvsge (currentByte!13019 w1!591) (size!6577 (buf!7045 w1!591))) (bvsge (currentByte!13019 w1!591) (currentByte!13019 w2!587))))))

(declare-fun arrayRangesEq!1109 (array!15116 array!15116 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271097 (arrayRangesEq!1109 (buf!7045 w1!591) (buf!7045 w3!25) #b00000000000000000000000000000000 (currentByte!13019 w1!591))))

(declare-fun lt!409724 () Unit!19109)

(declare-fun arrayRangesEqTransitive!372 (array!15116 array!15116 array!15116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19109)

(assert (=> b!271097 (= lt!409724 (arrayRangesEqTransitive!372 (buf!7045 w1!591) (buf!7045 w2!587) (buf!7045 w3!25) #b00000000000000000000000000000000 (currentByte!13019 w1!591) (currentByte!13019 w2!587)))))

(assert (= (and start!59210 res!225881) b!271095))

(assert (= (and b!271095 res!225883) b!271097))

(assert (= (and b!271097 (not res!225880)) b!271094))

(assert (= (and b!271094 (not res!225882)) b!271093))

(assert (= start!59210 b!271091))

(assert (= start!59210 b!271092))

(assert (= start!59210 b!271096))

(declare-fun m!403311 () Bool)

(assert (=> start!59210 m!403311))

(declare-fun m!403313 () Bool)

(assert (=> start!59210 m!403313))

(declare-fun m!403315 () Bool)

(assert (=> start!59210 m!403315))

(declare-fun m!403317 () Bool)

(assert (=> start!59210 m!403317))

(declare-fun m!403319 () Bool)

(assert (=> b!271095 m!403319))

(declare-fun m!403321 () Bool)

(assert (=> b!271093 m!403321))

(declare-fun m!403323 () Bool)

(assert (=> b!271093 m!403323))

(assert (=> b!271093 m!403321))

(assert (=> b!271093 m!403323))

(declare-fun m!403325 () Bool)

(assert (=> b!271093 m!403325))

(declare-fun m!403327 () Bool)

(assert (=> b!271094 m!403327))

(assert (=> b!271094 m!403323))

(declare-fun m!403329 () Bool)

(assert (=> b!271094 m!403329))

(declare-fun m!403331 () Bool)

(assert (=> b!271097 m!403331))

(declare-fun m!403333 () Bool)

(assert (=> b!271097 m!403333))

(declare-fun m!403335 () Bool)

(assert (=> b!271091 m!403335))

(declare-fun m!403337 () Bool)

(assert (=> b!271096 m!403337))

(declare-fun m!403339 () Bool)

(assert (=> b!271092 m!403339))

(push 1)

(assert (not b!271094))

(assert (not b!271092))

(assert (not b!271093))

(assert (not b!271095))

(assert (not b!271097))

(assert (not b!271096))

(assert (not b!271091))

(assert (not start!59210))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92326 () Bool)

(assert (=> d!92326 (= (byteRangesEq!0 (select (arr!7564 (buf!7045 w1!591)) (currentByte!13019 w1!591)) (select (arr!7564 (buf!7045 w3!25)) (currentByte!13019 w1!591)) #b00000000000000000000000000000000 (currentBit!13014 w1!591)) (or (= #b00000000000000000000000000000000 (currentBit!13014 w1!591)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7564 (buf!7045 w1!591)) (currentByte!13019 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13014 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7564 (buf!7045 w3!25)) (currentByte!13019 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13014 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23311 () Bool)

(assert (= bs!23311 d!92326))

(declare-fun m!403401 () Bool)

(assert (=> bs!23311 m!403401))

(declare-fun m!403403 () Bool)

(assert (=> bs!23311 m!403403))

(assert (=> b!271093 d!92326))

(declare-fun d!92328 () Bool)

(declare-fun res!225921 () Bool)

(declare-fun e!191040 () Bool)

(assert (=> d!92328 (=> res!225921 e!191040)))

(assert (=> d!92328 (= res!225921 (= #b00000000000000000000000000000000 (currentByte!13019 w1!591)))))

(assert (=> d!92328 (= (arrayRangesEq!1109 (buf!7045 w1!591) (buf!7045 w3!25) #b00000000000000000000000000000000 (currentByte!13019 w1!591)) e!191040)))

(declare-fun b!271153 () Bool)

(declare-fun e!191041 () Bool)

(assert (=> b!271153 (= e!191040 e!191041)))

(declare-fun res!225922 () Bool)

(assert (=> b!271153 (=> (not res!225922) (not e!191041))))

(assert (=> b!271153 (= res!225922 (= (select (arr!7564 (buf!7045 w1!591)) #b00000000000000000000000000000000) (select (arr!7564 (buf!7045 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!271154 () Bool)

(assert (=> b!271154 (= e!191041 (arrayRangesEq!1109 (buf!7045 w1!591) (buf!7045 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13019 w1!591)))))

(assert (= (and d!92328 (not res!225921)) b!271153))

(assert (= (and b!271153 res!225922) b!271154))

(declare-fun m!403411 () Bool)

(assert (=> b!271153 m!403411))

(declare-fun m!403413 () Bool)

(assert (=> b!271153 m!403413))

(declare-fun m!403415 () Bool)

(assert (=> b!271154 m!403415))

(assert (=> b!271097 d!92328))

(declare-fun d!92338 () Bool)

(assert (=> d!92338 (arrayRangesEq!1109 (buf!7045 w1!591) (buf!7045 w3!25) #b00000000000000000000000000000000 (currentByte!13019 w1!591))))

(declare-fun lt!409739 () Unit!19109)

(declare-fun choose!418 (array!15116 array!15116 array!15116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19109)

(assert (=> d!92338 (= lt!409739 (choose!418 (buf!7045 w1!591) (buf!7045 w2!587) (buf!7045 w3!25) #b00000000000000000000000000000000 (currentByte!13019 w1!591) (currentByte!13019 w2!587)))))

(assert (=> d!92338 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13019 w1!591)) (bvsle (currentByte!13019 w1!591) (currentByte!13019 w2!587)))))

(assert (=> d!92338 (= (arrayRangesEqTransitive!372 (buf!7045 w1!591) (buf!7045 w2!587) (buf!7045 w3!25) #b00000000000000000000000000000000 (currentByte!13019 w1!591) (currentByte!13019 w2!587)) lt!409739)))

(declare-fun bs!23312 () Bool)

(assert (= bs!23312 d!92338))

(assert (=> bs!23312 m!403331))

(declare-fun m!403427 () Bool)

(assert (=> bs!23312 m!403427))

(assert (=> b!271097 d!92338))

(declare-fun d!92342 () Bool)

(assert (=> d!92342 (= (array_inv!6301 (buf!7045 w2!587)) (bvsge (size!6577 (buf!7045 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!271092 d!92342))

(declare-fun d!92346 () Bool)

(assert (=> d!92346 (= (array_inv!6301 (buf!7045 w1!591)) (bvsge (size!6577 (buf!7045 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!271091 d!92346))

(declare-fun d!92348 () Bool)

(assert (=> d!92348 (= (array_inv!6301 (buf!7045 w3!25)) (bvsge (size!6577 (buf!7045 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!271096 d!92348))

(declare-fun d!92350 () Bool)

(declare-fun res!225944 () Bool)

(declare-fun e!191060 () Bool)

(assert (=> d!92350 (=> (not res!225944) (not e!191060))))

(assert (=> d!92350 (= res!225944 (= (size!6577 (buf!7045 w2!587)) (size!6577 (buf!7045 w3!25))))))

(assert (=> d!92350 (= (isPrefixOf!0 w2!587 w3!25) e!191060)))

(declare-fun b!271176 () Bool)

(declare-fun res!225946 () Bool)

(assert (=> b!271176 (=> (not res!225946) (not e!191060))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!271176 (= res!225946 (bvsle (bitIndex!0 (size!6577 (buf!7045 w2!587)) (currentByte!13019 w2!587) (currentBit!13014 w2!587)) (bitIndex!0 (size!6577 (buf!7045 w3!25)) (currentByte!13019 w3!25) (currentBit!13014 w3!25))))))

(declare-fun b!271177 () Bool)

(declare-fun e!191061 () Bool)

(assert (=> b!271177 (= e!191060 e!191061)))

(declare-fun res!225945 () Bool)

(assert (=> b!271177 (=> res!225945 e!191061)))

(assert (=> b!271177 (= res!225945 (= (size!6577 (buf!7045 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!271178 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15116 array!15116 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!271178 (= e!191061 (arrayBitRangesEq!0 (buf!7045 w2!587) (buf!7045 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6577 (buf!7045 w2!587)) (currentByte!13019 w2!587) (currentBit!13014 w2!587))))))

(assert (= (and d!92350 res!225944) b!271176))

(assert (= (and b!271176 res!225946) b!271177))

(assert (= (and b!271177 (not res!225945)) b!271178))

(declare-fun m!403443 () Bool)

(assert (=> b!271176 m!403443))

(declare-fun m!403445 () Bool)

(assert (=> b!271176 m!403445))

(assert (=> b!271178 m!403443))

(assert (=> b!271178 m!403443))

(declare-fun m!403447 () Bool)

(assert (=> b!271178 m!403447))

(assert (=> b!271095 d!92350))

(declare-fun d!92364 () Bool)

(declare-fun res!225947 () Bool)

(declare-fun e!191062 () Bool)

(assert (=> d!92364 (=> (not res!225947) (not e!191062))))

(assert (=> d!92364 (= res!225947 (= (size!6577 (buf!7045 w1!591)) (size!6577 (buf!7045 w2!587))))))

(assert (=> d!92364 (= (isPrefixOf!0 w1!591 w2!587) e!191062)))

(declare-fun b!271179 () Bool)

(declare-fun res!225949 () Bool)

(assert (=> b!271179 (=> (not res!225949) (not e!191062))))

(assert (=> b!271179 (= res!225949 (bvsle (bitIndex!0 (size!6577 (buf!7045 w1!591)) (currentByte!13019 w1!591) (currentBit!13014 w1!591)) (bitIndex!0 (size!6577 (buf!7045 w2!587)) (currentByte!13019 w2!587) (currentBit!13014 w2!587))))))

(declare-fun b!271180 () Bool)

(declare-fun e!191063 () Bool)

(assert (=> b!271180 (= e!191062 e!191063)))

(declare-fun res!225948 () Bool)

(assert (=> b!271180 (=> res!225948 e!191063)))

(assert (=> b!271180 (= res!225948 (= (size!6577 (buf!7045 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!271181 () Bool)

(assert (=> b!271181 (= e!191063 (arrayBitRangesEq!0 (buf!7045 w1!591) (buf!7045 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6577 (buf!7045 w1!591)) (currentByte!13019 w1!591) (currentBit!13014 w1!591))))))

(assert (= (and d!92364 res!225947) b!271179))

(assert (= (and b!271179 res!225949) b!271180))

(assert (= (and b!271180 (not res!225948)) b!271181))

(declare-fun m!403449 () Bool)

(assert (=> b!271179 m!403449))

(assert (=> b!271179 m!403443))

(assert (=> b!271181 m!403449))

(assert (=> b!271181 m!403449))

(declare-fun m!403451 () Bool)

(assert (=> b!271181 m!403451))

(assert (=> start!59210 d!92364))

(declare-fun d!92366 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92366 (= (inv!12 w1!591) (invariant!0 (currentBit!13014 w1!591) (currentByte!13019 w1!591) (size!6577 (buf!7045 w1!591))))))

(declare-fun bs!23319 () Bool)

(assert (= bs!23319 d!92366))

(declare-fun m!403459 () Bool)

(assert (=> bs!23319 m!403459))

(assert (=> start!59210 d!92366))

(declare-fun d!92374 () Bool)

(assert (=> d!92374 (= (inv!12 w2!587) (invariant!0 (currentBit!13014 w2!587) (currentByte!13019 w2!587) (size!6577 (buf!7045 w2!587))))))

(declare-fun bs!23320 () Bool)

(assert (= bs!23320 d!92374))

(declare-fun m!403461 () Bool)

(assert (=> bs!23320 m!403461))

(assert (=> start!59210 d!92374))

(declare-fun d!92376 () Bool)

(assert (=> d!92376 (= (inv!12 w3!25) (invariant!0 (currentBit!13014 w3!25) (currentByte!13019 w3!25) (size!6577 (buf!7045 w3!25))))))

(declare-fun bs!23321 () Bool)

(assert (= bs!23321 d!92376))

(declare-fun m!403463 () Bool)

(assert (=> bs!23321 m!403463))

(assert (=> start!59210 d!92376))

(declare-fun d!92378 () Bool)

(assert (=> d!92378 (and (bvsge (currentByte!13019 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13019 w1!591) (size!6577 (buf!7045 w2!587))) (bvslt (currentByte!13019 w1!591) (size!6577 (buf!7045 w3!25))) (= (select (arr!7564 (buf!7045 w2!587)) (currentByte!13019 w1!591)) (select (arr!7564 (buf!7045 w3!25)) (currentByte!13019 w1!591))))))

(declare-fun lt!409751 () Unit!19109)

(declare-fun choose!421 (array!15116 array!15116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19109)

(assert (=> d!92378 (= lt!409751 (choose!421 (buf!7045 w2!587) (buf!7045 w3!25) #b00000000000000000000000000000000 (currentByte!13019 w1!591) (currentByte!13019 w2!587)))))

(assert (=> d!92378 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13019 w2!587)))))

(assert (=> d!92378 (= (arrayRangesEqImpliesEq!169 (buf!7045 w2!587) (buf!7045 w3!25) #b00000000000000000000000000000000 (currentByte!13019 w1!591) (currentByte!13019 w2!587)) lt!409751)))

(declare-fun bs!23323 () Bool)

(assert (= bs!23323 d!92378))

(assert (=> bs!23323 m!403327))

(assert (=> bs!23323 m!403323))

(declare-fun m!403475 () Bool)

(assert (=> bs!23323 m!403475))

(assert (=> b!271094 d!92378))

(push 1)

(assert (not b!271179))

(assert (not b!271178))

(assert (not b!271181))

(assert (not d!92374))

(assert (not d!92378))

(assert (not d!92338))

(assert (not b!271176))

(assert (not d!92366))

(assert (not b!271154))

(assert (not d!92376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92408 () Bool)

(assert (=> d!92408 (= (invariant!0 (currentBit!13014 w3!25) (currentByte!13019 w3!25) (size!6577 (buf!7045 w3!25))) (and (bvsge (currentBit!13014 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!13014 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!13019 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!13019 w3!25) (size!6577 (buf!7045 w3!25))) (and (= (currentBit!13014 w3!25) #b00000000000000000000000000000000) (= (currentByte!13019 w3!25) (size!6577 (buf!7045 w3!25)))))))))

(assert (=> d!92376 d!92408))

(declare-fun d!92412 () Bool)

(assert (=> d!92412 (= (select (arr!7564 (buf!7045 w2!587)) (currentByte!13019 w1!591)) (select (arr!7564 (buf!7045 w3!25)) (currentByte!13019 w1!591)))))

(assert (=> d!92412 true))

(declare-fun _$12!102 () Unit!19109)

(assert (=> d!92412 (= (choose!421 (buf!7045 w2!587) (buf!7045 w3!25) #b00000000000000000000000000000000 (currentByte!13019 w1!591) (currentByte!13019 w2!587)) _$12!102)))

(declare-fun bs!23329 () Bool)

(assert (= bs!23329 d!92412))

(assert (=> bs!23329 m!403327))

(assert (=> bs!23329 m!403323))

(assert (=> d!92378 d!92412))

(declare-fun b!271248 () Bool)

(declare-fun e!191116 () Bool)

(declare-fun e!191118 () Bool)

(assert (=> b!271248 (= e!191116 e!191118)))

(declare-fun c!12487 () Bool)

(declare-datatypes ((tuple4!464 0))(
  ( (tuple4!465 (_1!12215 (_ BitVec 32)) (_2!12215 (_ BitVec 32)) (_3!1012 (_ BitVec 32)) (_4!232 (_ BitVec 32))) )
))
(declare-fun lt!409804 () tuple4!464)

(assert (=> b!271248 (= c!12487 (= (_3!1012 lt!409804) (_4!232 lt!409804)))))

(declare-fun b!271249 () Bool)

(declare-fun e!191117 () Bool)

(assert (=> b!271249 (= e!191118 e!191117)))

(declare-fun res!226006 () Bool)

(declare-fun lt!409805 () (_ BitVec 32))

(assert (=> b!271249 (= res!226006 (byteRangesEq!0 (select (arr!7564 (buf!7045 w2!587)) (_3!1012 lt!409804)) (select (arr!7564 (buf!7045 w3!25)) (_3!1012 lt!409804)) lt!409805 #b00000000000000000000000000001000))))

(assert (=> b!271249 (=> (not res!226006) (not e!191117))))

(declare-fun lt!409803 () (_ BitVec 32))

(declare-fun bm!4335 () Bool)

(declare-fun call!4338 () Bool)

(assert (=> bm!4335 (= call!4338 (byteRangesEq!0 (ite c!12487 (select (arr!7564 (buf!7045 w2!587)) (_3!1012 lt!409804)) (select (arr!7564 (buf!7045 w2!587)) (_4!232 lt!409804))) (ite c!12487 (select (arr!7564 (buf!7045 w3!25)) (_3!1012 lt!409804)) (select (arr!7564 (buf!7045 w3!25)) (_4!232 lt!409804))) (ite c!12487 lt!409805 #b00000000000000000000000000000000) lt!409803))))

(declare-fun e!191120 () Bool)

(declare-fun b!271250 () Bool)

(assert (=> b!271250 (= e!191120 (arrayRangesEq!1109 (buf!7045 w2!587) (buf!7045 w3!25) (_1!12215 lt!409804) (_2!12215 lt!409804)))))

(declare-fun b!271251 () Bool)

(assert (=> b!271251 (= e!191118 call!4338)))

(declare-fun d!92418 () Bool)

(declare-fun res!226007 () Bool)

(declare-fun e!191115 () Bool)

(assert (=> d!92418 (=> res!226007 e!191115)))

(assert (=> d!92418 (= res!226007 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6577 (buf!7045 w2!587)) (currentByte!13019 w2!587) (currentBit!13014 w2!587))))))

(assert (=> d!92418 (= (arrayBitRangesEq!0 (buf!7045 w2!587) (buf!7045 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6577 (buf!7045 w2!587)) (currentByte!13019 w2!587) (currentBit!13014 w2!587))) e!191115)))

(declare-fun b!271252 () Bool)

(declare-fun res!226008 () Bool)

(assert (=> b!271252 (= res!226008 (= lt!409803 #b00000000000000000000000000000000))))

(declare-fun e!191119 () Bool)

(assert (=> b!271252 (=> res!226008 e!191119)))

(assert (=> b!271252 (= e!191117 e!191119)))

(declare-fun b!271253 () Bool)

(assert (=> b!271253 (= e!191115 e!191116)))

(declare-fun res!226004 () Bool)

(assert (=> b!271253 (=> (not res!226004) (not e!191116))))

(assert (=> b!271253 (= res!226004 e!191120)))

(declare-fun res!226005 () Bool)

(assert (=> b!271253 (=> res!226005 e!191120)))

(assert (=> b!271253 (= res!226005 (bvsge (_1!12215 lt!409804) (_2!12215 lt!409804)))))

(assert (=> b!271253 (= lt!409803 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6577 (buf!7045 w2!587)) (currentByte!13019 w2!587) (currentBit!13014 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271253 (= lt!409805 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!464)

(assert (=> b!271253 (= lt!409804 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6577 (buf!7045 w2!587)) (currentByte!13019 w2!587) (currentBit!13014 w2!587))))))

(declare-fun b!271254 () Bool)

(assert (=> b!271254 (= e!191119 call!4338)))

(assert (= (and d!92418 (not res!226007)) b!271253))

(assert (= (and b!271253 (not res!226005)) b!271250))

(assert (= (and b!271253 res!226004) b!271248))

(assert (= (and b!271248 c!12487) b!271251))

(assert (= (and b!271248 (not c!12487)) b!271249))

(assert (= (and b!271249 res!226006) b!271252))

(assert (= (and b!271252 (not res!226008)) b!271254))

(assert (= (or b!271251 b!271254) bm!4335))

(declare-fun m!403535 () Bool)

(assert (=> b!271249 m!403535))

(declare-fun m!403537 () Bool)

(assert (=> b!271249 m!403537))

(assert (=> b!271249 m!403535))

(assert (=> b!271249 m!403537))

(declare-fun m!403539 () Bool)

(assert (=> b!271249 m!403539))

(assert (=> bm!4335 m!403537))

(declare-fun m!403541 () Bool)

(assert (=> bm!4335 m!403541))

(declare-fun m!403543 () Bool)

(assert (=> bm!4335 m!403543))

(declare-fun m!403545 () Bool)

(assert (=> bm!4335 m!403545))

(assert (=> bm!4335 m!403535))

(declare-fun m!403547 () Bool)

(assert (=> b!271250 m!403547))

(assert (=> b!271253 m!403443))

(declare-fun m!403549 () Bool)

(assert (=> b!271253 m!403549))

(assert (=> b!271178 d!92418))

(declare-fun d!92424 () Bool)

(declare-fun e!191123 () Bool)

(assert (=> d!92424 e!191123))

(declare-fun res!226013 () Bool)

(assert (=> d!92424 (=> (not res!226013) (not e!191123))))

(declare-fun lt!409820 () (_ BitVec 64))

(declare-fun lt!409821 () (_ BitVec 64))

(declare-fun lt!409823 () (_ BitVec 64))

(assert (=> d!92424 (= res!226013 (= lt!409820 (bvsub lt!409823 lt!409821)))))

(assert (=> d!92424 (or (= (bvand lt!409823 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409821 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409823 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409823 lt!409821) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!92424 (= lt!409821 (remainingBits!0 ((_ sign_extend 32) (size!6577 (buf!7045 w2!587))) ((_ sign_extend 32) (currentByte!13019 w2!587)) ((_ sign_extend 32) (currentBit!13014 w2!587))))))

(declare-fun lt!409818 () (_ BitVec 64))

(declare-fun lt!409819 () (_ BitVec 64))

(assert (=> d!92424 (= lt!409823 (bvmul lt!409818 lt!409819))))

(assert (=> d!92424 (or (= lt!409818 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409819 (bvsdiv (bvmul lt!409818 lt!409819) lt!409818)))))

(assert (=> d!92424 (= lt!409819 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!92424 (= lt!409818 ((_ sign_extend 32) (size!6577 (buf!7045 w2!587))))))

(assert (=> d!92424 (= lt!409820 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13019 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13014 w2!587))))))

(assert (=> d!92424 (invariant!0 (currentBit!13014 w2!587) (currentByte!13019 w2!587) (size!6577 (buf!7045 w2!587)))))

(assert (=> d!92424 (= (bitIndex!0 (size!6577 (buf!7045 w2!587)) (currentByte!13019 w2!587) (currentBit!13014 w2!587)) lt!409820)))

(declare-fun b!271259 () Bool)

(declare-fun res!226014 () Bool)

(assert (=> b!271259 (=> (not res!226014) (not e!191123))))

(assert (=> b!271259 (= res!226014 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409820))))

(declare-fun b!271260 () Bool)

(declare-fun lt!409822 () (_ BitVec 64))

(assert (=> b!271260 (= e!191123 (bvsle lt!409820 (bvmul lt!409822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271260 (or (= lt!409822 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409822 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409822)))))

(assert (=> b!271260 (= lt!409822 ((_ sign_extend 32) (size!6577 (buf!7045 w2!587))))))

(assert (= (and d!92424 res!226013) b!271259))

(assert (= (and b!271259 res!226014) b!271260))

(declare-fun m!403551 () Bool)

(assert (=> d!92424 m!403551))

(assert (=> d!92424 m!403461))

(assert (=> b!271178 d!92424))

(assert (=> d!92338 d!92328))

(declare-fun d!92430 () Bool)

(assert (=> d!92430 (arrayRangesEq!1109 (buf!7045 w1!591) (buf!7045 w3!25) #b00000000000000000000000000000000 (currentByte!13019 w1!591))))

(assert (=> d!92430 true))

(declare-fun _$16!149 () Unit!19109)

(assert (=> d!92430 (= (choose!418 (buf!7045 w1!591) (buf!7045 w2!587) (buf!7045 w3!25) #b00000000000000000000000000000000 (currentByte!13019 w1!591) (currentByte!13019 w2!587)) _$16!149)))

(declare-fun bs!23333 () Bool)

(assert (= bs!23333 d!92430))

(assert (=> bs!23333 m!403331))

(assert (=> d!92338 d!92430))

(declare-fun b!271261 () Bool)

(declare-fun e!191125 () Bool)

(declare-fun e!191127 () Bool)

(assert (=> b!271261 (= e!191125 e!191127)))

(declare-fun c!12488 () Bool)

(declare-fun lt!409825 () tuple4!464)

(assert (=> b!271261 (= c!12488 (= (_3!1012 lt!409825) (_4!232 lt!409825)))))

(declare-fun b!271262 () Bool)

(declare-fun e!191126 () Bool)

(assert (=> b!271262 (= e!191127 e!191126)))

(declare-fun lt!409826 () (_ BitVec 32))

(declare-fun res!226017 () Bool)

(assert (=> b!271262 (= res!226017 (byteRangesEq!0 (select (arr!7564 (buf!7045 w1!591)) (_3!1012 lt!409825)) (select (arr!7564 (buf!7045 w2!587)) (_3!1012 lt!409825)) lt!409826 #b00000000000000000000000000001000))))

(assert (=> b!271262 (=> (not res!226017) (not e!191126))))

(declare-fun lt!409824 () (_ BitVec 32))

(declare-fun call!4339 () Bool)

(declare-fun bm!4336 () Bool)

(assert (=> bm!4336 (= call!4339 (byteRangesEq!0 (ite c!12488 (select (arr!7564 (buf!7045 w1!591)) (_3!1012 lt!409825)) (select (arr!7564 (buf!7045 w1!591)) (_4!232 lt!409825))) (ite c!12488 (select (arr!7564 (buf!7045 w2!587)) (_3!1012 lt!409825)) (select (arr!7564 (buf!7045 w2!587)) (_4!232 lt!409825))) (ite c!12488 lt!409826 #b00000000000000000000000000000000) lt!409824))))

(declare-fun e!191129 () Bool)

(declare-fun b!271263 () Bool)

(assert (=> b!271263 (= e!191129 (arrayRangesEq!1109 (buf!7045 w1!591) (buf!7045 w2!587) (_1!12215 lt!409825) (_2!12215 lt!409825)))))

(declare-fun b!271264 () Bool)

(assert (=> b!271264 (= e!191127 call!4339)))

(declare-fun d!92432 () Bool)

(declare-fun res!226018 () Bool)

(declare-fun e!191124 () Bool)

(assert (=> d!92432 (=> res!226018 e!191124)))

(assert (=> d!92432 (= res!226018 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6577 (buf!7045 w1!591)) (currentByte!13019 w1!591) (currentBit!13014 w1!591))))))

(assert (=> d!92432 (= (arrayBitRangesEq!0 (buf!7045 w1!591) (buf!7045 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6577 (buf!7045 w1!591)) (currentByte!13019 w1!591) (currentBit!13014 w1!591))) e!191124)))

(declare-fun b!271265 () Bool)

(declare-fun res!226019 () Bool)

(assert (=> b!271265 (= res!226019 (= lt!409824 #b00000000000000000000000000000000))))

(declare-fun e!191128 () Bool)

(assert (=> b!271265 (=> res!226019 e!191128)))

(assert (=> b!271265 (= e!191126 e!191128)))

(declare-fun b!271266 () Bool)

(assert (=> b!271266 (= e!191124 e!191125)))

(declare-fun res!226015 () Bool)

(assert (=> b!271266 (=> (not res!226015) (not e!191125))))

(assert (=> b!271266 (= res!226015 e!191129)))

(declare-fun res!226016 () Bool)

(assert (=> b!271266 (=> res!226016 e!191129)))

(assert (=> b!271266 (= res!226016 (bvsge (_1!12215 lt!409825) (_2!12215 lt!409825)))))

(assert (=> b!271266 (= lt!409824 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6577 (buf!7045 w1!591)) (currentByte!13019 w1!591) (currentBit!13014 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271266 (= lt!409826 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271266 (= lt!409825 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6577 (buf!7045 w1!591)) (currentByte!13019 w1!591) (currentBit!13014 w1!591))))))

(declare-fun b!271267 () Bool)

(assert (=> b!271267 (= e!191128 call!4339)))

(assert (= (and d!92432 (not res!226018)) b!271266))

(assert (= (and b!271266 (not res!226016)) b!271263))

(assert (= (and b!271266 res!226015) b!271261))

(assert (= (and b!271261 c!12488) b!271264))

(assert (= (and b!271261 (not c!12488)) b!271262))

(assert (= (and b!271262 res!226017) b!271265))

(assert (= (and b!271265 (not res!226019)) b!271267))

(assert (= (or b!271264 b!271267) bm!4336))

(declare-fun m!403553 () Bool)

(assert (=> b!271262 m!403553))

(declare-fun m!403555 () Bool)

(assert (=> b!271262 m!403555))

(assert (=> b!271262 m!403553))

(assert (=> b!271262 m!403555))

(declare-fun m!403557 () Bool)

(assert (=> b!271262 m!403557))

(assert (=> bm!4336 m!403555))

(declare-fun m!403559 () Bool)

(assert (=> bm!4336 m!403559))

(declare-fun m!403561 () Bool)

(assert (=> bm!4336 m!403561))

(declare-fun m!403563 () Bool)

(assert (=> bm!4336 m!403563))

(assert (=> bm!4336 m!403553))

(declare-fun m!403565 () Bool)

(assert (=> b!271263 m!403565))

(assert (=> b!271266 m!403449))

(declare-fun m!403567 () Bool)

(assert (=> b!271266 m!403567))

(assert (=> b!271181 d!92432))

(declare-fun d!92434 () Bool)

(declare-fun e!191130 () Bool)

(assert (=> d!92434 e!191130))

(declare-fun res!226020 () Bool)

(assert (=> d!92434 (=> (not res!226020) (not e!191130))))

(declare-fun lt!409832 () (_ BitVec 64))

(declare-fun lt!409830 () (_ BitVec 64))

(declare-fun lt!409829 () (_ BitVec 64))

(assert (=> d!92434 (= res!226020 (= lt!409829 (bvsub lt!409832 lt!409830)))))

(assert (=> d!92434 (or (= (bvand lt!409832 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409830 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409832 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409832 lt!409830) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!92434 (= lt!409830 (remainingBits!0 ((_ sign_extend 32) (size!6577 (buf!7045 w1!591))) ((_ sign_extend 32) (currentByte!13019 w1!591)) ((_ sign_extend 32) (currentBit!13014 w1!591))))))

(declare-fun lt!409827 () (_ BitVec 64))

(declare-fun lt!409828 () (_ BitVec 64))

(assert (=> d!92434 (= lt!409832 (bvmul lt!409827 lt!409828))))

(assert (=> d!92434 (or (= lt!409827 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409828 (bvsdiv (bvmul lt!409827 lt!409828) lt!409827)))))

(assert (=> d!92434 (= lt!409828 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!92434 (= lt!409827 ((_ sign_extend 32) (size!6577 (buf!7045 w1!591))))))

(assert (=> d!92434 (= lt!409829 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13019 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13014 w1!591))))))

(assert (=> d!92434 (invariant!0 (currentBit!13014 w1!591) (currentByte!13019 w1!591) (size!6577 (buf!7045 w1!591)))))

(assert (=> d!92434 (= (bitIndex!0 (size!6577 (buf!7045 w1!591)) (currentByte!13019 w1!591) (currentBit!13014 w1!591)) lt!409829)))

(declare-fun b!271268 () Bool)

(declare-fun res!226021 () Bool)

(assert (=> b!271268 (=> (not res!226021) (not e!191130))))

(assert (=> b!271268 (= res!226021 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409829))))

(declare-fun b!271269 () Bool)

(declare-fun lt!409831 () (_ BitVec 64))

(assert (=> b!271269 (= e!191130 (bvsle lt!409829 (bvmul lt!409831 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271269 (or (= lt!409831 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409831 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409831)))))

(assert (=> b!271269 (= lt!409831 ((_ sign_extend 32) (size!6577 (buf!7045 w1!591))))))

(assert (= (and d!92434 res!226020) b!271268))

(assert (= (and b!271268 res!226021) b!271269))

(declare-fun m!403569 () Bool)

(assert (=> d!92434 m!403569))

(assert (=> d!92434 m!403459))

(assert (=> b!271181 d!92434))

(declare-fun d!92436 () Bool)

(assert (=> d!92436 (= (invariant!0 (currentBit!13014 w2!587) (currentByte!13019 w2!587) (size!6577 (buf!7045 w2!587))) (and (bvsge (currentBit!13014 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!13014 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!13019 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!13019 w2!587) (size!6577 (buf!7045 w2!587))) (and (= (currentBit!13014 w2!587) #b00000000000000000000000000000000) (= (currentByte!13019 w2!587) (size!6577 (buf!7045 w2!587)))))))))

(assert (=> d!92374 d!92436))

(declare-fun d!92438 () Bool)

(assert (=> d!92438 (= (invariant!0 (currentBit!13014 w1!591) (currentByte!13019 w1!591) (size!6577 (buf!7045 w1!591))) (and (bvsge (currentBit!13014 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!13014 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!13019 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!13019 w1!591) (size!6577 (buf!7045 w1!591))) (and (= (currentBit!13014 w1!591) #b00000000000000000000000000000000) (= (currentByte!13019 w1!591) (size!6577 (buf!7045 w1!591)))))))))

(assert (=> d!92366 d!92438))

(assert (=> b!271179 d!92434))

(assert (=> b!271179 d!92424))

(declare-fun d!92440 () Bool)

(declare-fun res!226022 () Bool)

(declare-fun e!191131 () Bool)

(assert (=> d!92440 (=> res!226022 e!191131)))

(assert (=> d!92440 (= res!226022 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13019 w1!591)))))

(assert (=> d!92440 (= (arrayRangesEq!1109 (buf!7045 w1!591) (buf!7045 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13019 w1!591)) e!191131)))

(declare-fun b!271270 () Bool)

(declare-fun e!191132 () Bool)

(assert (=> b!271270 (= e!191131 e!191132)))

(declare-fun res!226023 () Bool)

(assert (=> b!271270 (=> (not res!226023) (not e!191132))))

(assert (=> b!271270 (= res!226023 (= (select (arr!7564 (buf!7045 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7564 (buf!7045 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!271271 () Bool)

(assert (=> b!271271 (= e!191132 (arrayRangesEq!1109 (buf!7045 w1!591) (buf!7045 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13019 w1!591)))))

(assert (= (and d!92440 (not res!226022)) b!271270))

(assert (= (and b!271270 res!226023) b!271271))

(declare-fun m!403571 () Bool)

(assert (=> b!271270 m!403571))

(declare-fun m!403573 () Bool)

(assert (=> b!271270 m!403573))

(declare-fun m!403575 () Bool)

(assert (=> b!271271 m!403575))

(assert (=> b!271154 d!92440))

(assert (=> b!271176 d!92424))

(declare-fun d!92442 () Bool)

(declare-fun e!191133 () Bool)

(assert (=> d!92442 e!191133))

(declare-fun res!226024 () Bool)

(assert (=> d!92442 (=> (not res!226024) (not e!191133))))

(declare-fun lt!409835 () (_ BitVec 64))

(declare-fun lt!409836 () (_ BitVec 64))

(declare-fun lt!409838 () (_ BitVec 64))

(assert (=> d!92442 (= res!226024 (= lt!409835 (bvsub lt!409838 lt!409836)))))

(assert (=> d!92442 (or (= (bvand lt!409838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409836 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409838 lt!409836) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!92442 (= lt!409836 (remainingBits!0 ((_ sign_extend 32) (size!6577 (buf!7045 w3!25))) ((_ sign_extend 32) (currentByte!13019 w3!25)) ((_ sign_extend 32) (currentBit!13014 w3!25))))))

(declare-fun lt!409833 () (_ BitVec 64))

(declare-fun lt!409834 () (_ BitVec 64))

(assert (=> d!92442 (= lt!409838 (bvmul lt!409833 lt!409834))))

(assert (=> d!92442 (or (= lt!409833 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409834 (bvsdiv (bvmul lt!409833 lt!409834) lt!409833)))))

(assert (=> d!92442 (= lt!409834 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!92442 (= lt!409833 ((_ sign_extend 32) (size!6577 (buf!7045 w3!25))))))

(assert (=> d!92442 (= lt!409835 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13019 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13014 w3!25))))))

(assert (=> d!92442 (invariant!0 (currentBit!13014 w3!25) (currentByte!13019 w3!25) (size!6577 (buf!7045 w3!25)))))

(assert (=> d!92442 (= (bitIndex!0 (size!6577 (buf!7045 w3!25)) (currentByte!13019 w3!25) (currentBit!13014 w3!25)) lt!409835)))

(declare-fun b!271272 () Bool)

(declare-fun res!226025 () Bool)

(assert (=> b!271272 (=> (not res!226025) (not e!191133))))

(assert (=> b!271272 (= res!226025 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409835))))

(declare-fun b!271273 () Bool)

(declare-fun lt!409837 () (_ BitVec 64))

(assert (=> b!271273 (= e!191133 (bvsle lt!409835 (bvmul lt!409837 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271273 (or (= lt!409837 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409837 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409837)))))

(assert (=> b!271273 (= lt!409837 ((_ sign_extend 32) (size!6577 (buf!7045 w3!25))))))

(assert (= (and d!92442 res!226024) b!271272))

(assert (= (and b!271272 res!226025) b!271273))

(declare-fun m!403577 () Bool)

(assert (=> d!92442 m!403577))

(assert (=> d!92442 m!403463))

(assert (=> b!271176 d!92442))

(push 1)

(assert (not d!92430))

(assert (not d!92424))

(assert (not b!271249))

(assert (not b!271250))

(assert (not b!271271))

(assert (not bm!4336))

(assert (not b!271263))

(assert (not b!271253))

(assert (not bm!4335))

(assert (not b!271262))

(assert (not b!271266))

(assert (not d!92434))

(assert (not d!92442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92510 () Bool)

(assert (=> d!92510 (= (remainingBits!0 ((_ sign_extend 32) (size!6577 (buf!7045 w3!25))) ((_ sign_extend 32) (currentByte!13019 w3!25)) ((_ sign_extend 32) (currentBit!13014 w3!25))) (bvsub (bvmul ((_ sign_extend 32) (size!6577 (buf!7045 w3!25))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13019 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13014 w3!25)))))))

(assert (=> d!92442 d!92510))

(assert (=> d!92442 d!92408))

(declare-fun d!92512 () Bool)

(assert (=> d!92512 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6577 (buf!7045 w2!587)) (currentByte!13019 w2!587) (currentBit!13014 w2!587))) (tuple4!465 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6577 (buf!7045 w2!587)) (currentByte!13019 w2!587) (currentBit!13014 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6577 (buf!7045 w2!587)) (currentByte!13019 w2!587) (currentBit!13014 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!271253 d!92512))

(declare-fun d!92514 () Bool)

(declare-fun res!226070 () Bool)

(declare-fun e!191177 () Bool)

(assert (=> d!92514 (=> res!226070 e!191177)))

(assert (=> d!92514 (= res!226070 (= (_1!12215 lt!409825) (_2!12215 lt!409825)))))

(assert (=> d!92514 (= (arrayRangesEq!1109 (buf!7045 w1!591) (buf!7045 w2!587) (_1!12215 lt!409825) (_2!12215 lt!409825)) e!191177)))

(declare-fun b!271326 () Bool)

(declare-fun e!191178 () Bool)

(assert (=> b!271326 (= e!191177 e!191178)))

(declare-fun res!226071 () Bool)

(assert (=> b!271326 (=> (not res!226071) (not e!191178))))

(assert (=> b!271326 (= res!226071 (= (select (arr!7564 (buf!7045 w1!591)) (_1!12215 lt!409825)) (select (arr!7564 (buf!7045 w2!587)) (_1!12215 lt!409825))))))

(declare-fun b!271327 () Bool)

(assert (=> b!271327 (= e!191178 (arrayRangesEq!1109 (buf!7045 w1!591) (buf!7045 w2!587) (bvadd (_1!12215 lt!409825) #b00000000000000000000000000000001) (_2!12215 lt!409825)))))

(assert (= (and d!92514 (not res!226070)) b!271326))

(assert (= (and b!271326 res!226071) b!271327))

(declare-fun m!403683 () Bool)

(assert (=> b!271326 m!403683))

(declare-fun m!403685 () Bool)

(assert (=> b!271326 m!403685))

(declare-fun m!403687 () Bool)

(assert (=> b!271327 m!403687))

(assert (=> b!271263 d!92514))

(declare-fun d!92516 () Bool)

(assert (=> d!92516 (= (remainingBits!0 ((_ sign_extend 32) (size!6577 (buf!7045 w1!591))) ((_ sign_extend 32) (currentByte!13019 w1!591)) ((_ sign_extend 32) (currentBit!13014 w1!591))) (bvsub (bvmul ((_ sign_extend 32) (size!6577 (buf!7045 w1!591))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13019 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13014 w1!591)))))))

(assert (=> d!92434 d!92516))

(assert (=> d!92434 d!92438))

(declare-fun d!92518 () Bool)

(assert (=> d!92518 (= (byteRangesEq!0 (ite c!12488 (select (arr!7564 (buf!7045 w1!591)) (_3!1012 lt!409825)) (select (arr!7564 (buf!7045 w1!591)) (_4!232 lt!409825))) (ite c!12488 (select (arr!7564 (buf!7045 w2!587)) (_3!1012 lt!409825)) (select (arr!7564 (buf!7045 w2!587)) (_4!232 lt!409825))) (ite c!12488 lt!409826 #b00000000000000000000000000000000) lt!409824) (or (= (ite c!12488 lt!409826 #b00000000000000000000000000000000) lt!409824) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12488 (select (arr!7564 (buf!7045 w1!591)) (_3!1012 lt!409825)) (select (arr!7564 (buf!7045 w1!591)) (_4!232 lt!409825)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409824))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12488 lt!409826 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12488 (select (arr!7564 (buf!7045 w2!587)) (_3!1012 lt!409825)) (select (arr!7564 (buf!7045 w2!587)) (_4!232 lt!409825)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409824))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12488 lt!409826 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23343 () Bool)

(assert (= bs!23343 d!92518))

(declare-fun m!403689 () Bool)

(assert (=> bs!23343 m!403689))

(declare-fun m!403691 () Bool)

(assert (=> bs!23343 m!403691))

(assert (=> bm!4336 d!92518))

(declare-fun d!92520 () Bool)

(declare-fun res!226072 () Bool)

(declare-fun e!191179 () Bool)

(assert (=> d!92520 (=> res!226072 e!191179)))

(assert (=> d!92520 (= res!226072 (= (_1!12215 lt!409804) (_2!12215 lt!409804)))))

(assert (=> d!92520 (= (arrayRangesEq!1109 (buf!7045 w2!587) (buf!7045 w3!25) (_1!12215 lt!409804) (_2!12215 lt!409804)) e!191179)))

(declare-fun b!271328 () Bool)

(declare-fun e!191180 () Bool)

(assert (=> b!271328 (= e!191179 e!191180)))

(declare-fun res!226073 () Bool)

(assert (=> b!271328 (=> (not res!226073) (not e!191180))))

(assert (=> b!271328 (= res!226073 (= (select (arr!7564 (buf!7045 w2!587)) (_1!12215 lt!409804)) (select (arr!7564 (buf!7045 w3!25)) (_1!12215 lt!409804))))))

(declare-fun b!271329 () Bool)

(assert (=> b!271329 (= e!191180 (arrayRangesEq!1109 (buf!7045 w2!587) (buf!7045 w3!25) (bvadd (_1!12215 lt!409804) #b00000000000000000000000000000001) (_2!12215 lt!409804)))))

(assert (= (and d!92520 (not res!226072)) b!271328))

(assert (= (and b!271328 res!226073) b!271329))

(declare-fun m!403693 () Bool)

(assert (=> b!271328 m!403693))

(declare-fun m!403695 () Bool)

(assert (=> b!271328 m!403695))

(declare-fun m!403697 () Bool)

(assert (=> b!271329 m!403697))

(assert (=> b!271250 d!92520))

(assert (=> d!92430 d!92328))

(declare-fun d!92522 () Bool)

(assert (=> d!92522 (= (byteRangesEq!0 (select (arr!7564 (buf!7045 w1!591)) (_3!1012 lt!409825)) (select (arr!7564 (buf!7045 w2!587)) (_3!1012 lt!409825)) lt!409826 #b00000000000000000000000000001000) (or (= lt!409826 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7564 (buf!7045 w1!591)) (_3!1012 lt!409825))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409826)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7564 (buf!7045 w2!587)) (_3!1012 lt!409825))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409826)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23344 () Bool)

(assert (= bs!23344 d!92522))

(declare-fun m!403699 () Bool)

(assert (=> bs!23344 m!403699))

(declare-fun m!403701 () Bool)

(assert (=> bs!23344 m!403701))

(assert (=> b!271262 d!92522))

(declare-fun d!92524 () Bool)

(assert (=> d!92524 (= (remainingBits!0 ((_ sign_extend 32) (size!6577 (buf!7045 w2!587))) ((_ sign_extend 32) (currentByte!13019 w2!587)) ((_ sign_extend 32) (currentBit!13014 w2!587))) (bvsub (bvmul ((_ sign_extend 32) (size!6577 (buf!7045 w2!587))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13019 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13014 w2!587)))))))

(assert (=> d!92424 d!92524))

(assert (=> d!92424 d!92436))

(declare-fun d!92526 () Bool)

(assert (=> d!92526 (= (byteRangesEq!0 (ite c!12487 (select (arr!7564 (buf!7045 w2!587)) (_3!1012 lt!409804)) (select (arr!7564 (buf!7045 w2!587)) (_4!232 lt!409804))) (ite c!12487 (select (arr!7564 (buf!7045 w3!25)) (_3!1012 lt!409804)) (select (arr!7564 (buf!7045 w3!25)) (_4!232 lt!409804))) (ite c!12487 lt!409805 #b00000000000000000000000000000000) lt!409803) (or (= (ite c!12487 lt!409805 #b00000000000000000000000000000000) lt!409803) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12487 (select (arr!7564 (buf!7045 w2!587)) (_3!1012 lt!409804)) (select (arr!7564 (buf!7045 w2!587)) (_4!232 lt!409804)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409803))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12487 lt!409805 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12487 (select (arr!7564 (buf!7045 w3!25)) (_3!1012 lt!409804)) (select (arr!7564 (buf!7045 w3!25)) (_4!232 lt!409804)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409803))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12487 lt!409805 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23345 () Bool)

(assert (= bs!23345 d!92526))

(declare-fun m!403703 () Bool)

(assert (=> bs!23345 m!403703))

(declare-fun m!403705 () Bool)

(assert (=> bs!23345 m!403705))

(assert (=> bm!4335 d!92526))

(declare-fun d!92528 () Bool)

(assert (=> d!92528 (= (byteRangesEq!0 (select (arr!7564 (buf!7045 w2!587)) (_3!1012 lt!409804)) (select (arr!7564 (buf!7045 w3!25)) (_3!1012 lt!409804)) lt!409805 #b00000000000000000000000000001000) (or (= lt!409805 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7564 (buf!7045 w2!587)) (_3!1012 lt!409804))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409805)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7564 (buf!7045 w3!25)) (_3!1012 lt!409804))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409805)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23346 () Bool)

(assert (= bs!23346 d!92528))

(assert (=> bs!23346 m!403699))

(declare-fun m!403707 () Bool)

(assert (=> bs!23346 m!403707))

(assert (=> b!271249 d!92528))

(declare-fun d!92530 () Bool)

(declare-fun res!226074 () Bool)

(declare-fun e!191181 () Bool)

(assert (=> d!92530 (=> res!226074 e!191181)))

(assert (=> d!92530 (= res!226074 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13019 w1!591)))))

(assert (=> d!92530 (= (arrayRangesEq!1109 (buf!7045 w1!591) (buf!7045 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13019 w1!591)) e!191181)))

(declare-fun b!271330 () Bool)

(declare-fun e!191182 () Bool)

(assert (=> b!271330 (= e!191181 e!191182)))

(declare-fun res!226075 () Bool)

(assert (=> b!271330 (=> (not res!226075) (not e!191182))))

(assert (=> b!271330 (= res!226075 (= (select (arr!7564 (buf!7045 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7564 (buf!7045 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!271331 () Bool)

(assert (=> b!271331 (= e!191182 (arrayRangesEq!1109 (buf!7045 w1!591) (buf!7045 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13019 w1!591)))))

(assert (= (and d!92530 (not res!226074)) b!271330))

(assert (= (and b!271330 res!226075) b!271331))

(declare-fun m!403709 () Bool)

(assert (=> b!271330 m!403709))

(declare-fun m!403711 () Bool)

(assert (=> b!271330 m!403711))

(declare-fun m!403713 () Bool)

(assert (=> b!271331 m!403713))

(assert (=> b!271271 d!92530))

(declare-fun d!92532 () Bool)

(assert (=> d!92532 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6577 (buf!7045 w1!591)) (currentByte!13019 w1!591) (currentBit!13014 w1!591))) (tuple4!465 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6577 (buf!7045 w1!591)) (currentByte!13019 w1!591) (currentBit!13014 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6577 (buf!7045 w1!591)) (currentByte!13019 w1!591) (currentBit!13014 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!271266 d!92532))

(push 1)

(assert (not b!271331))

(assert (not b!271329))

(assert (not b!271327))

(check-sat)

(pop 1)

(push 1)

(check-sat)

