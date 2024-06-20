; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59376 () Bool)

(assert start!59376)

(declare-fun b!271578 () Bool)

(declare-fun res!226244 () Bool)

(declare-fun e!191457 () Bool)

(assert (=> b!271578 (=> (not res!226244) (not e!191457))))

(declare-datatypes ((array!15147 0))(
  ( (array!15148 (arr!7575 (Array (_ BitVec 32) (_ BitVec 8))) (size!6588 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11990 0))(
  ( (BitStream!11991 (buf!7056 array!15147) (currentByte!13039 (_ BitVec 32)) (currentBit!13034 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11990)

(declare-fun w3!25 () BitStream!11990)

(declare-fun isPrefixOf!0 (BitStream!11990 BitStream!11990) Bool)

(assert (=> b!271578 (= res!226244 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!271579 () Bool)

(declare-fun e!191461 () Bool)

(declare-fun array_inv!6312 (array!15147) Bool)

(assert (=> b!271579 (= e!191461 (array_inv!6312 (buf!7056 w2!587)))))

(declare-fun b!271580 () Bool)

(declare-fun e!191463 () Bool)

(declare-fun w1!591 () BitStream!11990)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271580 (= e!191463 (byteRangesEq!0 (select (arr!7575 (buf!7056 w1!591)) (currentByte!13039 w1!591)) (select (arr!7575 (buf!7056 w3!25)) (currentByte!13039 w1!591)) #b00000000000000000000000000000000 (currentBit!13034 w1!591)))))

(declare-fun b!271582 () Bool)

(declare-fun e!191462 () Bool)

(assert (=> b!271582 (= e!191462 (array_inv!6312 (buf!7056 w3!25)))))

(declare-fun b!271583 () Bool)

(assert (=> b!271583 (= e!191457 (not e!191463))))

(declare-fun res!226245 () Bool)

(assert (=> b!271583 (=> res!226245 e!191463)))

(assert (=> b!271583 (= res!226245 (or (bvsge (currentByte!13039 w1!591) (size!6588 (buf!7056 w1!591))) (bvslt (currentByte!13039 w1!591) (currentByte!13039 w2!587)) (bvsgt (currentBit!13034 w1!591) (currentBit!13034 w2!587))))))

(declare-fun arrayRangesEq!1120 (array!15147 array!15147 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271583 (arrayRangesEq!1120 (buf!7056 w1!591) (buf!7056 w3!25) #b00000000000000000000000000000000 (currentByte!13039 w1!591))))

(declare-datatypes ((Unit!19131 0))(
  ( (Unit!19132) )
))
(declare-fun lt!409925 () Unit!19131)

(declare-fun arrayRangesEqTransitive!383 (array!15147 array!15147 array!15147 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19131)

(assert (=> b!271583 (= lt!409925 (arrayRangesEqTransitive!383 (buf!7056 w1!591) (buf!7056 w2!587) (buf!7056 w3!25) #b00000000000000000000000000000000 (currentByte!13039 w1!591) (currentByte!13039 w2!587)))))

(declare-fun b!271581 () Bool)

(declare-fun e!191459 () Bool)

(assert (=> b!271581 (= e!191459 (array_inv!6312 (buf!7056 w1!591)))))

(declare-fun res!226246 () Bool)

(assert (=> start!59376 (=> (not res!226246) (not e!191457))))

(assert (=> start!59376 (= res!226246 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59376 e!191457))

(declare-fun inv!12 (BitStream!11990) Bool)

(assert (=> start!59376 (and (inv!12 w1!591) e!191459)))

(assert (=> start!59376 (and (inv!12 w2!587) e!191461)))

(assert (=> start!59376 (and (inv!12 w3!25) e!191462)))

(assert (= (and start!59376 res!226246) b!271578))

(assert (= (and b!271578 res!226244) b!271583))

(assert (= (and b!271583 (not res!226245)) b!271580))

(assert (= start!59376 b!271581))

(assert (= start!59376 b!271579))

(assert (= start!59376 b!271582))

(declare-fun m!404031 () Bool)

(assert (=> start!59376 m!404031))

(declare-fun m!404033 () Bool)

(assert (=> start!59376 m!404033))

(declare-fun m!404035 () Bool)

(assert (=> start!59376 m!404035))

(declare-fun m!404037 () Bool)

(assert (=> start!59376 m!404037))

(declare-fun m!404039 () Bool)

(assert (=> b!271581 m!404039))

(declare-fun m!404041 () Bool)

(assert (=> b!271578 m!404041))

(declare-fun m!404043 () Bool)

(assert (=> b!271579 m!404043))

(declare-fun m!404045 () Bool)

(assert (=> b!271580 m!404045))

(declare-fun m!404047 () Bool)

(assert (=> b!271580 m!404047))

(assert (=> b!271580 m!404045))

(assert (=> b!271580 m!404047))

(declare-fun m!404049 () Bool)

(assert (=> b!271580 m!404049))

(declare-fun m!404051 () Bool)

(assert (=> b!271582 m!404051))

(declare-fun m!404053 () Bool)

(assert (=> b!271583 m!404053))

(declare-fun m!404055 () Bool)

(assert (=> b!271583 m!404055))

(push 1)

(assert (not b!271580))

(assert (not start!59376))

(assert (not b!271583))

(assert (not b!271578))

(assert (not b!271579))

(assert (not b!271581))

(assert (not b!271582))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92670 () Bool)

(assert (=> d!92670 (= (array_inv!6312 (buf!7056 w2!587)) (bvsge (size!6588 (buf!7056 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!271579 d!92670))

(declare-fun d!92672 () Bool)

(assert (=> d!92672 (= (byteRangesEq!0 (select (arr!7575 (buf!7056 w1!591)) (currentByte!13039 w1!591)) (select (arr!7575 (buf!7056 w3!25)) (currentByte!13039 w1!591)) #b00000000000000000000000000000000 (currentBit!13034 w1!591)) (or (= #b00000000000000000000000000000000 (currentBit!13034 w1!591)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7575 (buf!7056 w1!591)) (currentByte!13039 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13034 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7575 (buf!7056 w3!25)) (currentByte!13039 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13034 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23382 () Bool)

(assert (= bs!23382 d!92672))

(declare-fun m!404073 () Bool)

(assert (=> bs!23382 m!404073))

(declare-fun m!404075 () Bool)

(assert (=> bs!23382 m!404075))

(assert (=> b!271580 d!92672))

(declare-fun d!92682 () Bool)

(assert (=> d!92682 (= (array_inv!6312 (buf!7056 w3!25)) (bvsge (size!6588 (buf!7056 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!271582 d!92682))

(declare-fun d!92684 () Bool)

(assert (=> d!92684 (= (array_inv!6312 (buf!7056 w1!591)) (bvsge (size!6588 (buf!7056 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!271581 d!92684))

(declare-fun d!92686 () Bool)

(declare-fun res!226263 () Bool)

(declare-fun e!191481 () Bool)

(assert (=> d!92686 (=> res!226263 e!191481)))

(assert (=> d!92686 (= res!226263 (= #b00000000000000000000000000000000 (currentByte!13039 w1!591)))))

(assert (=> d!92686 (= (arrayRangesEq!1120 (buf!7056 w1!591) (buf!7056 w3!25) #b00000000000000000000000000000000 (currentByte!13039 w1!591)) e!191481)))

(declare-fun b!271600 () Bool)

(declare-fun e!191482 () Bool)

(assert (=> b!271600 (= e!191481 e!191482)))

(declare-fun res!226264 () Bool)

(assert (=> b!271600 (=> (not res!226264) (not e!191482))))

(assert (=> b!271600 (= res!226264 (= (select (arr!7575 (buf!7056 w1!591)) #b00000000000000000000000000000000) (select (arr!7575 (buf!7056 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!271601 () Bool)

(assert (=> b!271601 (= e!191482 (arrayRangesEq!1120 (buf!7056 w1!591) (buf!7056 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13039 w1!591)))))

(assert (= (and d!92686 (not res!226263)) b!271600))

(assert (= (and b!271600 res!226264) b!271601))

(declare-fun m!404077 () Bool)

(assert (=> b!271600 m!404077))

(declare-fun m!404079 () Bool)

(assert (=> b!271600 m!404079))

(declare-fun m!404081 () Bool)

(assert (=> b!271601 m!404081))

(assert (=> b!271583 d!92686))

(declare-fun d!92688 () Bool)

(assert (=> d!92688 (arrayRangesEq!1120 (buf!7056 w1!591) (buf!7056 w3!25) #b00000000000000000000000000000000 (currentByte!13039 w1!591))))

(declare-fun lt!409934 () Unit!19131)

(declare-fun choose!431 (array!15147 array!15147 array!15147 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19131)

(assert (=> d!92688 (= lt!409934 (choose!431 (buf!7056 w1!591) (buf!7056 w2!587) (buf!7056 w3!25) #b00000000000000000000000000000000 (currentByte!13039 w1!591) (currentByte!13039 w2!587)))))

(assert (=> d!92688 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13039 w1!591)) (bvsle (currentByte!13039 w1!591) (currentByte!13039 w2!587)))))

(assert (=> d!92688 (= (arrayRangesEqTransitive!383 (buf!7056 w1!591) (buf!7056 w2!587) (buf!7056 w3!25) #b00000000000000000000000000000000 (currentByte!13039 w1!591) (currentByte!13039 w2!587)) lt!409934)))

(declare-fun bs!23384 () Bool)

(assert (= bs!23384 d!92688))

(assert (=> bs!23384 m!404053))

(declare-fun m!404093 () Bool)

(assert (=> bs!23384 m!404093))

(assert (=> b!271583 d!92688))

(declare-fun d!92694 () Bool)

(declare-fun res!226295 () Bool)

(declare-fun e!191504 () Bool)

(assert (=> d!92694 (=> (not res!226295) (not e!191504))))

(assert (=> d!92694 (= res!226295 (= (size!6588 (buf!7056 w2!587)) (size!6588 (buf!7056 w3!25))))))

(assert (=> d!92694 (= (isPrefixOf!0 w2!587 w3!25) e!191504)))

(declare-fun b!271632 () Bool)

(declare-fun res!226297 () Bool)

(assert (=> b!271632 (=> (not res!226297) (not e!191504))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!271632 (= res!226297 (bvsle (bitIndex!0 (size!6588 (buf!7056 w2!587)) (currentByte!13039 w2!587) (currentBit!13034 w2!587)) (bitIndex!0 (size!6588 (buf!7056 w3!25)) (currentByte!13039 w3!25) (currentBit!13034 w3!25))))))

(declare-fun b!271633 () Bool)

(declare-fun e!191503 () Bool)

(assert (=> b!271633 (= e!191504 e!191503)))

(declare-fun res!226296 () Bool)

(assert (=> b!271633 (=> res!226296 e!191503)))

(assert (=> b!271633 (= res!226296 (= (size!6588 (buf!7056 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!271634 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15147 array!15147 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!271634 (= e!191503 (arrayBitRangesEq!0 (buf!7056 w2!587) (buf!7056 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6588 (buf!7056 w2!587)) (currentByte!13039 w2!587) (currentBit!13034 w2!587))))))

(assert (= (and d!92694 res!226295) b!271632))

(assert (= (and b!271632 res!226297) b!271633))

(assert (= (and b!271633 (not res!226296)) b!271634))

(declare-fun m!404121 () Bool)

(assert (=> b!271632 m!404121))

(declare-fun m!404123 () Bool)

(assert (=> b!271632 m!404123))

(assert (=> b!271634 m!404121))

(assert (=> b!271634 m!404121))

(declare-fun m!404127 () Bool)

(assert (=> b!271634 m!404127))

(assert (=> b!271578 d!92694))

(declare-fun d!92718 () Bool)

(declare-fun res!226298 () Bool)

(declare-fun e!191506 () Bool)

(assert (=> d!92718 (=> (not res!226298) (not e!191506))))

(assert (=> d!92718 (= res!226298 (= (size!6588 (buf!7056 w1!591)) (size!6588 (buf!7056 w2!587))))))

(assert (=> d!92718 (= (isPrefixOf!0 w1!591 w2!587) e!191506)))

(declare-fun b!271635 () Bool)

(declare-fun res!226300 () Bool)

(assert (=> b!271635 (=> (not res!226300) (not e!191506))))

(assert (=> b!271635 (= res!226300 (bvsle (bitIndex!0 (size!6588 (buf!7056 w1!591)) (currentByte!13039 w1!591) (currentBit!13034 w1!591)) (bitIndex!0 (size!6588 (buf!7056 w2!587)) (currentByte!13039 w2!587) (currentBit!13034 w2!587))))))

(declare-fun b!271636 () Bool)

(declare-fun e!191505 () Bool)

(assert (=> b!271636 (= e!191506 e!191505)))

(declare-fun res!226299 () Bool)

(assert (=> b!271636 (=> res!226299 e!191505)))

(assert (=> b!271636 (= res!226299 (= (size!6588 (buf!7056 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!271637 () Bool)

(assert (=> b!271637 (= e!191505 (arrayBitRangesEq!0 (buf!7056 w1!591) (buf!7056 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6588 (buf!7056 w1!591)) (currentByte!13039 w1!591) (currentBit!13034 w1!591))))))

(assert (= (and d!92718 res!226298) b!271635))

(assert (= (and b!271635 res!226300) b!271636))

(assert (= (and b!271636 (not res!226299)) b!271637))

(declare-fun m!404131 () Bool)

(assert (=> b!271635 m!404131))

(assert (=> b!271635 m!404121))

(assert (=> b!271637 m!404131))

(assert (=> b!271637 m!404131))

(declare-fun m!404133 () Bool)

(assert (=> b!271637 m!404133))

(assert (=> start!59376 d!92718))

(declare-fun d!92720 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92720 (= (inv!12 w1!591) (invariant!0 (currentBit!13034 w1!591) (currentByte!13039 w1!591) (size!6588 (buf!7056 w1!591))))))

(declare-fun bs!23392 () Bool)

(assert (= bs!23392 d!92720))

(declare-fun m!404135 () Bool)

(assert (=> bs!23392 m!404135))

(assert (=> start!59376 d!92720))

(declare-fun d!92722 () Bool)

(assert (=> d!92722 (= (inv!12 w2!587) (invariant!0 (currentBit!13034 w2!587) (currentByte!13039 w2!587) (size!6588 (buf!7056 w2!587))))))

(declare-fun bs!23393 () Bool)

(assert (= bs!23393 d!92722))

(declare-fun m!404137 () Bool)

(assert (=> bs!23393 m!404137))

(assert (=> start!59376 d!92722))

(declare-fun d!92724 () Bool)

(assert (=> d!92724 (= (inv!12 w3!25) (invariant!0 (currentBit!13034 w3!25) (currentByte!13039 w3!25) (size!6588 (buf!7056 w3!25))))))

(declare-fun bs!23394 () Bool)

(assert (= bs!23394 d!92724))

(declare-fun m!404139 () Bool)

(assert (=> bs!23394 m!404139))

(assert (=> start!59376 d!92724))

(push 1)

(assert (not b!271601))

(assert (not b!271635))

(assert (not d!92720))

(assert (not b!271632))

(assert (not d!92724))

(assert (not d!92722))

(assert (not b!271634))

(assert (not d!92688))

(assert (not b!271637))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92764 () Bool)

(declare-fun e!191571 () Bool)

(assert (=> d!92764 e!191571))

(declare-fun res!226369 () Bool)

(assert (=> d!92764 (=> (not res!226369) (not e!191571))))

(declare-fun lt!410031 () (_ BitVec 64))

(declare-fun lt!410033 () (_ BitVec 64))

(declare-fun lt!410036 () (_ BitVec 64))

(assert (=> d!92764 (= res!226369 (= lt!410031 (bvsub lt!410036 lt!410033)))))

(assert (=> d!92764 (or (= (bvand lt!410036 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!410033 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!410036 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!410036 lt!410033) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!92764 (= lt!410033 (remainingBits!0 ((_ sign_extend 32) (size!6588 (buf!7056 w2!587))) ((_ sign_extend 32) (currentByte!13039 w2!587)) ((_ sign_extend 32) (currentBit!13034 w2!587))))))

(declare-fun lt!410035 () (_ BitVec 64))

(declare-fun lt!410034 () (_ BitVec 64))

(assert (=> d!92764 (= lt!410036 (bvmul lt!410035 lt!410034))))

(assert (=> d!92764 (or (= lt!410035 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410034 (bvsdiv (bvmul lt!410035 lt!410034) lt!410035)))))

(assert (=> d!92764 (= lt!410034 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!92764 (= lt!410035 ((_ sign_extend 32) (size!6588 (buf!7056 w2!587))))))

(assert (=> d!92764 (= lt!410031 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13039 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13034 w2!587))))))

(assert (=> d!92764 (invariant!0 (currentBit!13034 w2!587) (currentByte!13039 w2!587) (size!6588 (buf!7056 w2!587)))))

(assert (=> d!92764 (= (bitIndex!0 (size!6588 (buf!7056 w2!587)) (currentByte!13039 w2!587) (currentBit!13034 w2!587)) lt!410031)))

(declare-fun b!271722 () Bool)

(declare-fun res!226370 () Bool)

(assert (=> b!271722 (=> (not res!226370) (not e!191571))))

(assert (=> b!271722 (= res!226370 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410031))))

(declare-fun b!271723 () Bool)

(declare-fun lt!410032 () (_ BitVec 64))

(assert (=> b!271723 (= e!191571 (bvsle lt!410031 (bvmul lt!410032 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271723 (or (= lt!410032 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!410032 #b0000000000000000000000000000000000000000000000000000000000001000) lt!410032)))))

(assert (=> b!271723 (= lt!410032 ((_ sign_extend 32) (size!6588 (buf!7056 w2!587))))))

(assert (= (and d!92764 res!226369) b!271722))

(assert (= (and b!271722 res!226370) b!271723))

(declare-fun m!404229 () Bool)

(assert (=> d!92764 m!404229))

(assert (=> d!92764 m!404137))

(assert (=> b!271632 d!92764))

(declare-fun d!92768 () Bool)

(declare-fun e!191572 () Bool)

(assert (=> d!92768 e!191572))

(declare-fun res!226371 () Bool)

(assert (=> d!92768 (=> (not res!226371) (not e!191572))))

(declare-fun lt!410039 () (_ BitVec 64))

(declare-fun lt!410037 () (_ BitVec 64))

(declare-fun lt!410042 () (_ BitVec 64))

(assert (=> d!92768 (= res!226371 (= lt!410037 (bvsub lt!410042 lt!410039)))))

(assert (=> d!92768 (or (= (bvand lt!410042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!410039 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!410042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!410042 lt!410039) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!92768 (= lt!410039 (remainingBits!0 ((_ sign_extend 32) (size!6588 (buf!7056 w3!25))) ((_ sign_extend 32) (currentByte!13039 w3!25)) ((_ sign_extend 32) (currentBit!13034 w3!25))))))

(declare-fun lt!410041 () (_ BitVec 64))

(declare-fun lt!410040 () (_ BitVec 64))

(assert (=> d!92768 (= lt!410042 (bvmul lt!410041 lt!410040))))

(assert (=> d!92768 (or (= lt!410041 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410040 (bvsdiv (bvmul lt!410041 lt!410040) lt!410041)))))

(assert (=> d!92768 (= lt!410040 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!92768 (= lt!410041 ((_ sign_extend 32) (size!6588 (buf!7056 w3!25))))))

(assert (=> d!92768 (= lt!410037 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13039 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13034 w3!25))))))

(assert (=> d!92768 (invariant!0 (currentBit!13034 w3!25) (currentByte!13039 w3!25) (size!6588 (buf!7056 w3!25)))))

(assert (=> d!92768 (= (bitIndex!0 (size!6588 (buf!7056 w3!25)) (currentByte!13039 w3!25) (currentBit!13034 w3!25)) lt!410037)))

(declare-fun b!271724 () Bool)

(declare-fun res!226372 () Bool)

(assert (=> b!271724 (=> (not res!226372) (not e!191572))))

(assert (=> b!271724 (= res!226372 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410037))))

(declare-fun b!271725 () Bool)

(declare-fun lt!410038 () (_ BitVec 64))

(assert (=> b!271725 (= e!191572 (bvsle lt!410037 (bvmul lt!410038 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271725 (or (= lt!410038 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!410038 #b0000000000000000000000000000000000000000000000000000000000001000) lt!410038)))))

(assert (=> b!271725 (= lt!410038 ((_ sign_extend 32) (size!6588 (buf!7056 w3!25))))))

(assert (= (and d!92768 res!226371) b!271724))

(assert (= (and b!271724 res!226372) b!271725))

(declare-fun m!404231 () Bool)

(assert (=> d!92768 m!404231))

(assert (=> d!92768 m!404139))

(assert (=> b!271632 d!92768))

(declare-fun d!92770 () Bool)

(declare-fun res!226373 () Bool)

(declare-fun e!191573 () Bool)

(assert (=> d!92770 (=> res!226373 e!191573)))

(assert (=> d!92770 (= res!226373 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13039 w1!591)))))

(assert (=> d!92770 (= (arrayRangesEq!1120 (buf!7056 w1!591) (buf!7056 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13039 w1!591)) e!191573)))

(declare-fun b!271726 () Bool)

(declare-fun e!191574 () Bool)

(assert (=> b!271726 (= e!191573 e!191574)))

(declare-fun res!226374 () Bool)

(assert (=> b!271726 (=> (not res!226374) (not e!191574))))

(assert (=> b!271726 (= res!226374 (= (select (arr!7575 (buf!7056 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7575 (buf!7056 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!271727 () Bool)

(assert (=> b!271727 (= e!191574 (arrayRangesEq!1120 (buf!7056 w1!591) (buf!7056 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13039 w1!591)))))

(assert (= (and d!92770 (not res!226373)) b!271726))

(assert (= (and b!271726 res!226374) b!271727))

(declare-fun m!404233 () Bool)

(assert (=> b!271726 m!404233))

(declare-fun m!404235 () Bool)

(assert (=> b!271726 m!404235))

(declare-fun m!404237 () Bool)

(assert (=> b!271727 m!404237))

(assert (=> b!271601 d!92770))

(declare-fun d!92772 () Bool)

(assert (=> d!92772 (= (invariant!0 (currentBit!13034 w1!591) (currentByte!13039 w1!591) (size!6588 (buf!7056 w1!591))) (and (bvsge (currentBit!13034 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!13034 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!13039 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!13039 w1!591) (size!6588 (buf!7056 w1!591))) (and (= (currentBit!13034 w1!591) #b00000000000000000000000000000000) (= (currentByte!13039 w1!591) (size!6588 (buf!7056 w1!591)))))))))

(assert (=> d!92720 d!92772))

(declare-fun d!92774 () Bool)

(assert (=> d!92774 (= (invariant!0 (currentBit!13034 w3!25) (currentByte!13039 w3!25) (size!6588 (buf!7056 w3!25))) (and (bvsge (currentBit!13034 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!13034 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!13039 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!13039 w3!25) (size!6588 (buf!7056 w3!25))) (and (= (currentBit!13034 w3!25) #b00000000000000000000000000000000) (= (currentByte!13039 w3!25) (size!6588 (buf!7056 w3!25)))))))))

(assert (=> d!92724 d!92774))

(declare-fun d!92776 () Bool)

(declare-fun e!191575 () Bool)

(assert (=> d!92776 e!191575))

(declare-fun res!226375 () Bool)

(assert (=> d!92776 (=> (not res!226375) (not e!191575))))

(declare-fun lt!410048 () (_ BitVec 64))

(declare-fun lt!410043 () (_ BitVec 64))

(declare-fun lt!410045 () (_ BitVec 64))

(assert (=> d!92776 (= res!226375 (= lt!410043 (bvsub lt!410048 lt!410045)))))

(assert (=> d!92776 (or (= (bvand lt!410048 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!410045 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!410048 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!410048 lt!410045) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!92776 (= lt!410045 (remainingBits!0 ((_ sign_extend 32) (size!6588 (buf!7056 w1!591))) ((_ sign_extend 32) (currentByte!13039 w1!591)) ((_ sign_extend 32) (currentBit!13034 w1!591))))))

(declare-fun lt!410047 () (_ BitVec 64))

(declare-fun lt!410046 () (_ BitVec 64))

(assert (=> d!92776 (= lt!410048 (bvmul lt!410047 lt!410046))))

(assert (=> d!92776 (or (= lt!410047 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410046 (bvsdiv (bvmul lt!410047 lt!410046) lt!410047)))))

(assert (=> d!92776 (= lt!410046 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!92776 (= lt!410047 ((_ sign_extend 32) (size!6588 (buf!7056 w1!591))))))

(assert (=> d!92776 (= lt!410043 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13039 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13034 w1!591))))))

(assert (=> d!92776 (invariant!0 (currentBit!13034 w1!591) (currentByte!13039 w1!591) (size!6588 (buf!7056 w1!591)))))

(assert (=> d!92776 (= (bitIndex!0 (size!6588 (buf!7056 w1!591)) (currentByte!13039 w1!591) (currentBit!13034 w1!591)) lt!410043)))

(declare-fun b!271728 () Bool)

(declare-fun res!226376 () Bool)

(assert (=> b!271728 (=> (not res!226376) (not e!191575))))

(assert (=> b!271728 (= res!226376 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410043))))

(declare-fun b!271729 () Bool)

(declare-fun lt!410044 () (_ BitVec 64))

(assert (=> b!271729 (= e!191575 (bvsle lt!410043 (bvmul lt!410044 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271729 (or (= lt!410044 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!410044 #b0000000000000000000000000000000000000000000000000000000000001000) lt!410044)))))

(assert (=> b!271729 (= lt!410044 ((_ sign_extend 32) (size!6588 (buf!7056 w1!591))))))

(assert (= (and d!92776 res!226375) b!271728))

(assert (= (and b!271728 res!226376) b!271729))

(declare-fun m!404239 () Bool)

(assert (=> d!92776 m!404239))

(assert (=> d!92776 m!404135))

(assert (=> b!271635 d!92776))

(assert (=> b!271635 d!92764))

(declare-fun d!92778 () Bool)

(declare-fun res!226391 () Bool)

(declare-fun e!191590 () Bool)

(assert (=> d!92778 (=> res!226391 e!191590)))

(assert (=> d!92778 (= res!226391 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6588 (buf!7056 w1!591)) (currentByte!13039 w1!591) (currentBit!13034 w1!591))))))

(assert (=> d!92778 (= (arrayBitRangesEq!0 (buf!7056 w1!591) (buf!7056 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6588 (buf!7056 w1!591)) (currentByte!13039 w1!591) (currentBit!13034 w1!591))) e!191590)))

(declare-fun b!271744 () Bool)

(declare-fun res!226388 () Bool)

(declare-fun lt!410056 () (_ BitVec 32))

(assert (=> b!271744 (= res!226388 (= lt!410056 #b00000000000000000000000000000000))))

(declare-fun e!191591 () Bool)

(assert (=> b!271744 (=> res!226388 e!191591)))

(declare-fun e!191593 () Bool)

(assert (=> b!271744 (= e!191593 e!191591)))

(declare-fun b!271745 () Bool)

(declare-fun call!4354 () Bool)

(assert (=> b!271745 (= e!191591 call!4354)))

(declare-fun b!271746 () Bool)

(declare-fun e!191592 () Bool)

(assert (=> b!271746 (= e!191590 e!191592)))

(declare-fun res!226390 () Bool)

(assert (=> b!271746 (=> (not res!226390) (not e!191592))))

(declare-fun e!191589 () Bool)

(assert (=> b!271746 (= res!226390 e!191589)))

(declare-fun res!226389 () Bool)

(assert (=> b!271746 (=> res!226389 e!191589)))

(declare-datatypes ((tuple4!472 0))(
  ( (tuple4!473 (_1!12219 (_ BitVec 32)) (_2!12219 (_ BitVec 32)) (_3!1016 (_ BitVec 32)) (_4!236 (_ BitVec 32))) )
))
(declare-fun lt!410057 () tuple4!472)

(assert (=> b!271746 (= res!226389 (bvsge (_1!12219 lt!410057) (_2!12219 lt!410057)))))

(assert (=> b!271746 (= lt!410056 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6588 (buf!7056 w1!591)) (currentByte!13039 w1!591) (currentBit!13034 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!410055 () (_ BitVec 32))

(assert (=> b!271746 (= lt!410055 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!472)

(assert (=> b!271746 (= lt!410057 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6588 (buf!7056 w1!591)) (currentByte!13039 w1!591) (currentBit!13034 w1!591))))))

(declare-fun c!12503 () Bool)

(declare-fun bm!4351 () Bool)

(assert (=> bm!4351 (= call!4354 (byteRangesEq!0 (ite c!12503 (select (arr!7575 (buf!7056 w1!591)) (_3!1016 lt!410057)) (select (arr!7575 (buf!7056 w1!591)) (_4!236 lt!410057))) (ite c!12503 (select (arr!7575 (buf!7056 w2!587)) (_3!1016 lt!410057)) (select (arr!7575 (buf!7056 w2!587)) (_4!236 lt!410057))) (ite c!12503 lt!410055 #b00000000000000000000000000000000) lt!410056))))

(declare-fun b!271747 () Bool)

(declare-fun e!191588 () Bool)

(assert (=> b!271747 (= e!191588 call!4354)))

(declare-fun b!271748 () Bool)

(assert (=> b!271748 (= e!191588 e!191593)))

(declare-fun res!226387 () Bool)

(assert (=> b!271748 (= res!226387 (byteRangesEq!0 (select (arr!7575 (buf!7056 w1!591)) (_3!1016 lt!410057)) (select (arr!7575 (buf!7056 w2!587)) (_3!1016 lt!410057)) lt!410055 #b00000000000000000000000000001000))))

(assert (=> b!271748 (=> (not res!226387) (not e!191593))))

(declare-fun b!271749 () Bool)

(assert (=> b!271749 (= e!191589 (arrayRangesEq!1120 (buf!7056 w1!591) (buf!7056 w2!587) (_1!12219 lt!410057) (_2!12219 lt!410057)))))

(declare-fun b!271750 () Bool)

(assert (=> b!271750 (= e!191592 e!191588)))

(assert (=> b!271750 (= c!12503 (= (_3!1016 lt!410057) (_4!236 lt!410057)))))

(assert (= (and d!92778 (not res!226391)) b!271746))

(assert (= (and b!271746 (not res!226389)) b!271749))

(assert (= (and b!271746 res!226390) b!271750))

(assert (= (and b!271750 c!12503) b!271747))

(assert (= (and b!271750 (not c!12503)) b!271748))

(assert (= (and b!271748 res!226387) b!271744))

(assert (= (and b!271744 (not res!226388)) b!271745))

(assert (= (or b!271747 b!271745) bm!4351))

(assert (=> b!271746 m!404131))

(declare-fun m!404241 () Bool)

(assert (=> b!271746 m!404241))

(declare-fun m!404243 () Bool)

(assert (=> bm!4351 m!404243))

(declare-fun m!404245 () Bool)

(assert (=> bm!4351 m!404245))

(declare-fun m!404247 () Bool)

(assert (=> bm!4351 m!404247))

(declare-fun m!404249 () Bool)

(assert (=> bm!4351 m!404249))

(declare-fun m!404251 () Bool)

(assert (=> bm!4351 m!404251))

(assert (=> b!271748 m!404249))

(assert (=> b!271748 m!404251))

(assert (=> b!271748 m!404249))

(assert (=> b!271748 m!404251))

(declare-fun m!404253 () Bool)

(assert (=> b!271748 m!404253))

(declare-fun m!404255 () Bool)

(assert (=> b!271749 m!404255))

(assert (=> b!271637 d!92778))

(assert (=> b!271637 d!92776))

(declare-fun d!92780 () Bool)

(declare-fun res!226396 () Bool)

(declare-fun e!191596 () Bool)

(assert (=> d!92780 (=> res!226396 e!191596)))

(assert (=> d!92780 (= res!226396 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6588 (buf!7056 w2!587)) (currentByte!13039 w2!587) (currentBit!13034 w2!587))))))

(assert (=> d!92780 (= (arrayBitRangesEq!0 (buf!7056 w2!587) (buf!7056 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6588 (buf!7056 w2!587)) (currentByte!13039 w2!587) (currentBit!13034 w2!587))) e!191596)))

(declare-fun b!271751 () Bool)

(declare-fun res!226393 () Bool)

(declare-fun lt!410059 () (_ BitVec 32))

(assert (=> b!271751 (= res!226393 (= lt!410059 #b00000000000000000000000000000000))))

(declare-fun e!191597 () Bool)

(assert (=> b!271751 (=> res!226393 e!191597)))

(declare-fun e!191599 () Bool)

(assert (=> b!271751 (= e!191599 e!191597)))

(declare-fun b!271752 () Bool)

(declare-fun call!4355 () Bool)

(assert (=> b!271752 (= e!191597 call!4355)))

(declare-fun b!271753 () Bool)

(declare-fun e!191598 () Bool)

(assert (=> b!271753 (= e!191596 e!191598)))

(declare-fun res!226395 () Bool)

(assert (=> b!271753 (=> (not res!226395) (not e!191598))))

(declare-fun e!191595 () Bool)

(assert (=> b!271753 (= res!226395 e!191595)))

(declare-fun res!226394 () Bool)

(assert (=> b!271753 (=> res!226394 e!191595)))

(declare-fun lt!410060 () tuple4!472)

(assert (=> b!271753 (= res!226394 (bvsge (_1!12219 lt!410060) (_2!12219 lt!410060)))))

(assert (=> b!271753 (= lt!410059 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6588 (buf!7056 w2!587)) (currentByte!13039 w2!587) (currentBit!13034 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!410058 () (_ BitVec 32))

(assert (=> b!271753 (= lt!410058 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271753 (= lt!410060 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6588 (buf!7056 w2!587)) (currentByte!13039 w2!587) (currentBit!13034 w2!587))))))

(declare-fun c!12504 () Bool)

(declare-fun bm!4352 () Bool)

(assert (=> bm!4352 (= call!4355 (byteRangesEq!0 (ite c!12504 (select (arr!7575 (buf!7056 w2!587)) (_3!1016 lt!410060)) (select (arr!7575 (buf!7056 w2!587)) (_4!236 lt!410060))) (ite c!12504 (select (arr!7575 (buf!7056 w3!25)) (_3!1016 lt!410060)) (select (arr!7575 (buf!7056 w3!25)) (_4!236 lt!410060))) (ite c!12504 lt!410058 #b00000000000000000000000000000000) lt!410059))))

(declare-fun b!271754 () Bool)

(declare-fun e!191594 () Bool)

(assert (=> b!271754 (= e!191594 call!4355)))

(declare-fun b!271755 () Bool)

(assert (=> b!271755 (= e!191594 e!191599)))

(declare-fun res!226392 () Bool)

(assert (=> b!271755 (= res!226392 (byteRangesEq!0 (select (arr!7575 (buf!7056 w2!587)) (_3!1016 lt!410060)) (select (arr!7575 (buf!7056 w3!25)) (_3!1016 lt!410060)) lt!410058 #b00000000000000000000000000001000))))

(assert (=> b!271755 (=> (not res!226392) (not e!191599))))

(declare-fun b!271756 () Bool)

(assert (=> b!271756 (= e!191595 (arrayRangesEq!1120 (buf!7056 w2!587) (buf!7056 w3!25) (_1!12219 lt!410060) (_2!12219 lt!410060)))))

(declare-fun b!271757 () Bool)

(assert (=> b!271757 (= e!191598 e!191594)))

(assert (=> b!271757 (= c!12504 (= (_3!1016 lt!410060) (_4!236 lt!410060)))))

(assert (= (and d!92780 (not res!226396)) b!271753))

(assert (= (and b!271753 (not res!226394)) b!271756))

(assert (= (and b!271753 res!226395) b!271757))

(assert (= (and b!271757 c!12504) b!271754))

(assert (= (and b!271757 (not c!12504)) b!271755))

(assert (= (and b!271755 res!226392) b!271751))

(assert (= (and b!271751 (not res!226393)) b!271752))

(assert (= (or b!271754 b!271752) bm!4352))

(assert (=> b!271753 m!404121))

(declare-fun m!404257 () Bool)

(assert (=> b!271753 m!404257))

(declare-fun m!404259 () Bool)

(assert (=> bm!4352 m!404259))

(declare-fun m!404261 () Bool)

(assert (=> bm!4352 m!404261))

(declare-fun m!404263 () Bool)

(assert (=> bm!4352 m!404263))

(declare-fun m!404265 () Bool)

(assert (=> bm!4352 m!404265))

(declare-fun m!404267 () Bool)

(assert (=> bm!4352 m!404267))

(assert (=> b!271755 m!404265))

(assert (=> b!271755 m!404267))

(assert (=> b!271755 m!404265))

(assert (=> b!271755 m!404267))

(declare-fun m!404269 () Bool)

(assert (=> b!271755 m!404269))

(declare-fun m!404271 () Bool)

(assert (=> b!271756 m!404271))

(assert (=> b!271634 d!92780))

(assert (=> b!271634 d!92764))

(declare-fun d!92782 () Bool)

(assert (=> d!92782 (= (invariant!0 (currentBit!13034 w2!587) (currentByte!13039 w2!587) (size!6588 (buf!7056 w2!587))) (and (bvsge (currentBit!13034 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!13034 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!13039 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!13039 w2!587) (size!6588 (buf!7056 w2!587))) (and (= (currentBit!13034 w2!587) #b00000000000000000000000000000000) (= (currentByte!13039 w2!587) (size!6588 (buf!7056 w2!587)))))))))

(assert (=> d!92722 d!92782))

(assert (=> d!92688 d!92686))

(declare-fun d!92784 () Bool)

(assert (=> d!92784 (arrayRangesEq!1120 (buf!7056 w1!591) (buf!7056 w3!25) #b00000000000000000000000000000000 (currentByte!13039 w1!591))))

(assert (=> d!92784 true))

(declare-fun _$16!158 () Unit!19131)

(assert (=> d!92784 (= (choose!431 (buf!7056 w1!591) (buf!7056 w2!587) (buf!7056 w3!25) #b00000000000000000000000000000000 (currentByte!13039 w1!591) (currentByte!13039 w2!587)) _$16!158)))

(declare-fun bs!23397 () Bool)

(assert (= bs!23397 d!92784))

(assert (=> bs!23397 m!404053))

(assert (=> d!92688 d!92784))

(push 1)

(assert (not b!271756))

(assert (not b!271755))

(assert (not bm!4351))

(assert (not d!92764))

(assert (not d!92784))

(assert (not d!92776))

(assert (not b!271748))

(assert (not b!271749))

(assert (not b!271727))

(assert (not b!271753))

(assert (not bm!4352))

(assert (not b!271746))

(assert (not d!92768))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92810 () Bool)

(assert (=> d!92810 (= (remainingBits!0 ((_ sign_extend 32) (size!6588 (buf!7056 w2!587))) ((_ sign_extend 32) (currentByte!13039 w2!587)) ((_ sign_extend 32) (currentBit!13034 w2!587))) (bvsub (bvmul ((_ sign_extend 32) (size!6588 (buf!7056 w2!587))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13039 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13034 w2!587)))))))

(assert (=> d!92764 d!92810))

(assert (=> d!92764 d!92782))

(declare-fun d!92812 () Bool)

(assert (=> d!92812 (= (remainingBits!0 ((_ sign_extend 32) (size!6588 (buf!7056 w3!25))) ((_ sign_extend 32) (currentByte!13039 w3!25)) ((_ sign_extend 32) (currentBit!13034 w3!25))) (bvsub (bvmul ((_ sign_extend 32) (size!6588 (buf!7056 w3!25))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13039 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13034 w3!25)))))))

(assert (=> d!92768 d!92812))

(assert (=> d!92768 d!92774))

(declare-fun d!92814 () Bool)

(declare-fun res!226403 () Bool)

(declare-fun e!191606 () Bool)

(assert (=> d!92814 (=> res!226403 e!191606)))

(assert (=> d!92814 (= res!226403 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13039 w1!591)))))

(assert (=> d!92814 (= (arrayRangesEq!1120 (buf!7056 w1!591) (buf!7056 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13039 w1!591)) e!191606)))

(declare-fun b!271764 () Bool)

(declare-fun e!191607 () Bool)

(assert (=> b!271764 (= e!191606 e!191607)))

(declare-fun res!226404 () Bool)

(assert (=> b!271764 (=> (not res!226404) (not e!191607))))

(assert (=> b!271764 (= res!226404 (= (select (arr!7575 (buf!7056 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7575 (buf!7056 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!271765 () Bool)

(assert (=> b!271765 (= e!191607 (arrayRangesEq!1120 (buf!7056 w1!591) (buf!7056 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13039 w1!591)))))

(assert (= (and d!92814 (not res!226403)) b!271764))

(assert (= (and b!271764 res!226404) b!271765))

(declare-fun m!404305 () Bool)

(assert (=> b!271764 m!404305))

(declare-fun m!404307 () Bool)

(assert (=> b!271764 m!404307))

(declare-fun m!404309 () Bool)

(assert (=> b!271765 m!404309))

(assert (=> b!271727 d!92814))

(declare-fun d!92816 () Bool)

(assert (=> d!92816 (= (byteRangesEq!0 (select (arr!7575 (buf!7056 w2!587)) (_3!1016 lt!410060)) (select (arr!7575 (buf!7056 w3!25)) (_3!1016 lt!410060)) lt!410058 #b00000000000000000000000000001000) (or (= lt!410058 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7575 (buf!7056 w2!587)) (_3!1016 lt!410060))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410058)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7575 (buf!7056 w3!25)) (_3!1016 lt!410060))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410058)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23402 () Bool)

(assert (= bs!23402 d!92816))

(declare-fun m!404311 () Bool)

(assert (=> bs!23402 m!404311))

(declare-fun m!404313 () Bool)

(assert (=> bs!23402 m!404313))

(assert (=> b!271755 d!92816))

(declare-fun d!92818 () Bool)

(declare-fun res!226405 () Bool)

(declare-fun e!191608 () Bool)

(assert (=> d!92818 (=> res!226405 e!191608)))

(assert (=> d!92818 (= res!226405 (= (_1!12219 lt!410060) (_2!12219 lt!410060)))))

(assert (=> d!92818 (= (arrayRangesEq!1120 (buf!7056 w2!587) (buf!7056 w3!25) (_1!12219 lt!410060) (_2!12219 lt!410060)) e!191608)))

(declare-fun b!271766 () Bool)

(declare-fun e!191609 () Bool)

(assert (=> b!271766 (= e!191608 e!191609)))

(declare-fun res!226406 () Bool)

(assert (=> b!271766 (=> (not res!226406) (not e!191609))))

(assert (=> b!271766 (= res!226406 (= (select (arr!7575 (buf!7056 w2!587)) (_1!12219 lt!410060)) (select (arr!7575 (buf!7056 w3!25)) (_1!12219 lt!410060))))))

(declare-fun b!271767 () Bool)

(assert (=> b!271767 (= e!191609 (arrayRangesEq!1120 (buf!7056 w2!587) (buf!7056 w3!25) (bvadd (_1!12219 lt!410060) #b00000000000000000000000000000001) (_2!12219 lt!410060)))))

(assert (= (and d!92818 (not res!226405)) b!271766))

(assert (= (and b!271766 res!226406) b!271767))

(declare-fun m!404315 () Bool)

(assert (=> b!271766 m!404315))

(declare-fun m!404317 () Bool)

(assert (=> b!271766 m!404317))

(declare-fun m!404319 () Bool)

(assert (=> b!271767 m!404319))

(assert (=> b!271756 d!92818))

(assert (=> d!92784 d!92686))

(declare-fun d!92820 () Bool)

(assert (=> d!92820 (= (byteRangesEq!0 (select (arr!7575 (buf!7056 w1!591)) (_3!1016 lt!410057)) (select (arr!7575 (buf!7056 w2!587)) (_3!1016 lt!410057)) lt!410055 #b00000000000000000000000000001000) (or (= lt!410055 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7575 (buf!7056 w1!591)) (_3!1016 lt!410057))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410055)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7575 (buf!7056 w2!587)) (_3!1016 lt!410057))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410055)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23403 () Bool)

(assert (= bs!23403 d!92820))

(assert (=> bs!23403 m!404311))

(declare-fun m!404321 () Bool)

(assert (=> bs!23403 m!404321))

(assert (=> b!271748 d!92820))

(declare-fun d!92822 () Bool)

(declare-fun res!226407 () Bool)

(declare-fun e!191610 () Bool)

(assert (=> d!92822 (=> res!226407 e!191610)))

(assert (=> d!92822 (= res!226407 (= (_1!12219 lt!410057) (_2!12219 lt!410057)))))

(assert (=> d!92822 (= (arrayRangesEq!1120 (buf!7056 w1!591) (buf!7056 w2!587) (_1!12219 lt!410057) (_2!12219 lt!410057)) e!191610)))

(declare-fun b!271768 () Bool)

(declare-fun e!191611 () Bool)

(assert (=> b!271768 (= e!191610 e!191611)))

(declare-fun res!226408 () Bool)

(assert (=> b!271768 (=> (not res!226408) (not e!191611))))

(assert (=> b!271768 (= res!226408 (= (select (arr!7575 (buf!7056 w1!591)) (_1!12219 lt!410057)) (select (arr!7575 (buf!7056 w2!587)) (_1!12219 lt!410057))))))

(declare-fun b!271769 () Bool)

(assert (=> b!271769 (= e!191611 (arrayRangesEq!1120 (buf!7056 w1!591) (buf!7056 w2!587) (bvadd (_1!12219 lt!410057) #b00000000000000000000000000000001) (_2!12219 lt!410057)))))

(assert (= (and d!92822 (not res!226407)) b!271768))

(assert (= (and b!271768 res!226408) b!271769))

(declare-fun m!404323 () Bool)

(assert (=> b!271768 m!404323))

(declare-fun m!404325 () Bool)

(assert (=> b!271768 m!404325))

(declare-fun m!404327 () Bool)

(assert (=> b!271769 m!404327))

(assert (=> b!271749 d!92822))

(declare-fun d!92824 () Bool)

(assert (=> d!92824 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6588 (buf!7056 w2!587)) (currentByte!13039 w2!587) (currentBit!13034 w2!587))) (tuple4!473 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6588 (buf!7056 w2!587)) (currentByte!13039 w2!587) (currentBit!13034 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6588 (buf!7056 w2!587)) (currentByte!13039 w2!587) (currentBit!13034 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!271753 d!92824))

(declare-fun d!92826 () Bool)

(assert (=> d!92826 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6588 (buf!7056 w1!591)) (currentByte!13039 w1!591) (currentBit!13034 w1!591))) (tuple4!473 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6588 (buf!7056 w1!591)) (currentByte!13039 w1!591) (currentBit!13034 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6588 (buf!7056 w1!591)) (currentByte!13039 w1!591) (currentBit!13034 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!271746 d!92826))

(declare-fun d!92828 () Bool)

(assert (=> d!92828 (= (byteRangesEq!0 (ite c!12504 (select (arr!7575 (buf!7056 w2!587)) (_3!1016 lt!410060)) (select (arr!7575 (buf!7056 w2!587)) (_4!236 lt!410060))) (ite c!12504 (select (arr!7575 (buf!7056 w3!25)) (_3!1016 lt!410060)) (select (arr!7575 (buf!7056 w3!25)) (_4!236 lt!410060))) (ite c!12504 lt!410058 #b00000000000000000000000000000000) lt!410059) (or (= (ite c!12504 lt!410058 #b00000000000000000000000000000000) lt!410059) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12504 (select (arr!7575 (buf!7056 w2!587)) (_3!1016 lt!410060)) (select (arr!7575 (buf!7056 w2!587)) (_4!236 lt!410060)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410059))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12504 lt!410058 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12504 (select (arr!7575 (buf!7056 w3!25)) (_3!1016 lt!410060)) (select (arr!7575 (buf!7056 w3!25)) (_4!236 lt!410060)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410059))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12504 lt!410058 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23404 () Bool)

(assert (= bs!23404 d!92828))

(declare-fun m!404329 () Bool)

(assert (=> bs!23404 m!404329))

(declare-fun m!404331 () Bool)

(assert (=> bs!23404 m!404331))

(assert (=> bm!4352 d!92828))

(declare-fun d!92830 () Bool)

(assert (=> d!92830 (= (byteRangesEq!0 (ite c!12503 (select (arr!7575 (buf!7056 w1!591)) (_3!1016 lt!410057)) (select (arr!7575 (buf!7056 w1!591)) (_4!236 lt!410057))) (ite c!12503 (select (arr!7575 (buf!7056 w2!587)) (_3!1016 lt!410057)) (select (arr!7575 (buf!7056 w2!587)) (_4!236 lt!410057))) (ite c!12503 lt!410055 #b00000000000000000000000000000000) lt!410056) (or (= (ite c!12503 lt!410055 #b00000000000000000000000000000000) lt!410056) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12503 (select (arr!7575 (buf!7056 w1!591)) (_3!1016 lt!410057)) (select (arr!7575 (buf!7056 w1!591)) (_4!236 lt!410057)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410056))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12503 lt!410055 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12503 (select (arr!7575 (buf!7056 w2!587)) (_3!1016 lt!410057)) (select (arr!7575 (buf!7056 w2!587)) (_4!236 lt!410057)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410056))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12503 lt!410055 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23405 () Bool)

(assert (= bs!23405 d!92830))

(declare-fun m!404333 () Bool)

(assert (=> bs!23405 m!404333))

(declare-fun m!404335 () Bool)

(assert (=> bs!23405 m!404335))

(assert (=> bm!4351 d!92830))

(declare-fun d!92832 () Bool)

(assert (=> d!92832 (= (remainingBits!0 ((_ sign_extend 32) (size!6588 (buf!7056 w1!591))) ((_ sign_extend 32) (currentByte!13039 w1!591)) ((_ sign_extend 32) (currentBit!13034 w1!591))) (bvsub (bvmul ((_ sign_extend 32) (size!6588 (buf!7056 w1!591))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13039 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13034 w1!591)))))))

(assert (=> d!92776 d!92832))

(assert (=> d!92776 d!92772))

(push 1)

(assert (not b!271767))

(assert (not b!271765))

(assert (not b!271769))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

