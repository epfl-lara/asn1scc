; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16106 () Bool)

(assert start!16106)

(declare-fun res!67131 () Bool)

(declare-fun e!53345 () Bool)

(assert (=> start!16106 (=> (not res!67131) (not e!53345))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!16106 (= res!67131 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!16106 e!53345))

(assert (=> start!16106 true))

(declare-datatypes ((array!3595 0))(
  ( (array!3596 (arr!2277 (Array (_ BitVec 32) (_ BitVec 8))) (size!1655 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2872 0))(
  ( (BitStream!2873 (buf!2045 array!3595) (currentByte!3961 (_ BitVec 32)) (currentBit!3956 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2872)

(declare-fun e!53346 () Bool)

(declare-fun inv!12 (BitStream!2872) Bool)

(assert (=> start!16106 (and (inv!12 thiss!1716) e!53346)))

(declare-fun b!81184 () Bool)

(declare-fun res!67132 () Bool)

(assert (=> b!81184 (=> (not res!67132) (not e!53345))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!81184 (= res!67132 (validate_offset_bits!1 ((_ sign_extend 32) (size!1655 (buf!2045 thiss!1716))) ((_ sign_extend 32) (currentByte!3961 thiss!1716)) ((_ sign_extend 32) (currentBit!3956 thiss!1716)) nBits!516))))

(declare-fun b!81185 () Bool)

(declare-datatypes ((Unit!5416 0))(
  ( (Unit!5417) )
))
(declare-datatypes ((tuple3!346 0))(
  ( (tuple3!347 (_1!3787 Unit!5416) (_2!3787 BitStream!2872) (_3!194 array!3595)) )
))
(declare-fun readBitsLoop!0 (BitStream!2872 (_ BitVec 64) array!3595 (_ BitVec 64) (_ BitVec 64)) tuple3!346)

(assert (=> b!81185 (= e!53345 (bvsgt (currentByte!3961 thiss!1716) (currentByte!3961 (_2!3787 (readBitsLoop!0 thiss!1716 nBits!516 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516)))))))

(declare-fun b!81186 () Bool)

(declare-fun array_inv!1501 (array!3595) Bool)

(assert (=> b!81186 (= e!53346 (array_inv!1501 (buf!2045 thiss!1716)))))

(assert (= (and start!16106 res!67131) b!81184))

(assert (= (and b!81184 res!67132) b!81185))

(assert (= start!16106 b!81186))

(declare-fun m!127077 () Bool)

(assert (=> start!16106 m!127077))

(declare-fun m!127079 () Bool)

(assert (=> b!81184 m!127079))

(declare-fun m!127081 () Bool)

(assert (=> b!81185 m!127081))

(declare-fun m!127083 () Bool)

(assert (=> b!81186 m!127083))

(push 1)

(assert (not start!16106))

(assert (not b!81184))

(assert (not b!81186))

(assert (not b!81185))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!25352 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!25352 (= (inv!12 thiss!1716) (invariant!0 (currentBit!3956 thiss!1716) (currentByte!3961 thiss!1716) (size!1655 (buf!2045 thiss!1716))))))

(declare-fun bs!6210 () Bool)

(assert (= bs!6210 d!25352))

(declare-fun m!127101 () Bool)

(assert (=> bs!6210 m!127101))

(assert (=> start!16106 d!25352))

(declare-fun d!25354 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!25354 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1655 (buf!2045 thiss!1716))) ((_ sign_extend 32) (currentByte!3961 thiss!1716)) ((_ sign_extend 32) (currentBit!3956 thiss!1716)) nBits!516) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1655 (buf!2045 thiss!1716))) ((_ sign_extend 32) (currentByte!3961 thiss!1716)) ((_ sign_extend 32) (currentBit!3956 thiss!1716))) nBits!516))))

(declare-fun bs!6211 () Bool)

(assert (= bs!6211 d!25354))

(declare-fun m!127103 () Bool)

(assert (=> bs!6211 m!127103))

(assert (=> b!81184 d!25354))

(declare-fun d!25356 () Bool)

(assert (=> d!25356 (= (array_inv!1501 (buf!2045 thiss!1716)) (bvsge (size!1655 (buf!2045 thiss!1716)) #b00000000000000000000000000000000))))

(assert (=> b!81186 d!25356))

(declare-fun d!25358 () Bool)

(declare-fun e!53395 () Bool)

(assert (=> d!25358 e!53395))

(declare-fun res!67198 () Bool)

(assert (=> d!25358 (=> (not res!67198) (not e!53395))))

(declare-fun lt!129352 () (_ BitVec 64))

(declare-fun lt!129338 () tuple3!346)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!25358 (= res!67198 (= (bvsub lt!129352 #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!1655 (buf!2045 (_2!3787 lt!129338))) (currentByte!3961 (_2!3787 lt!129338)) (currentBit!3956 (_2!3787 lt!129338)))))))

(assert (=> d!25358 (or (= (bvand lt!129352 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!129352 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!129352 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!129367 () (_ BitVec 64))

(assert (=> d!25358 (= lt!129352 (bvadd lt!129367 nBits!516))))

(assert (=> d!25358 (or (not (= (bvand lt!129367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!129367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!129367 nBits!516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25358 (= lt!129367 (bitIndex!0 (size!1655 (buf!2045 thiss!1716)) (currentByte!3961 thiss!1716) (currentBit!3956 thiss!1716)))))

(declare-fun e!53394 () tuple3!346)

(assert (=> d!25358 (= lt!129338 e!53394)))

(declare-fun c!5701 () Bool)

(assert (=> d!25358 (= c!5701 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> d!25358 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!25358 (= (readBitsLoop!0 thiss!1716 nBits!516 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) lt!129338)))

(declare-datatypes ((tuple2!7188 0))(
  ( (tuple2!7189 (_1!3791 Bool) (_2!3791 BitStream!2872)) )
))
(declare-fun lt!129334 () tuple2!7188)

(declare-fun lt!129337 () (_ BitVec 64))

(declare-fun bm!1101 () Bool)

(declare-fun lt!129361 () array!3595)

(declare-fun call!1105 () Bool)

(declare-fun lt!129350 () (_ BitVec 32))

(declare-fun lt!129354 () (_ BitVec 32))

(declare-fun lt!129340 () (_ BitVec 64))

(declare-fun lt!129346 () array!3595)

(declare-fun arrayBitRangesEq!0 (array!3595 array!3595 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> bm!1101 (= call!1105 (arrayBitRangesEq!0 (ite c!5701 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!129361) (ite c!5701 (array!3596 (store (arr!2277 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129354 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2277 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129354)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129350)))) ((_ sign_extend 24) (ite (_1!3791 lt!129334) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129350) #b00000000))))) (size!1655 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) lt!129346) (ite c!5701 #b0000000000000000000000000000000000000000000000000000000000000000 lt!129337) (ite c!5701 #b0000000000000000000000000000000000000000000000000000000000000000 lt!129340)))))

(declare-fun b!81268 () Bool)

(declare-fun e!53396 () Bool)

(declare-fun bitAt!0 (array!3595 (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!7192 0))(
  ( (tuple2!7193 (_1!3793 BitStream!2872) (_2!3793 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!2872) tuple2!7192)

(assert (=> b!81268 (= e!53396 (= (bitAt!0 (_3!194 lt!129338) #b0000000000000000000000000000000000000000000000000000000000000000) (_2!3793 (readBitPure!0 thiss!1716))))))

(declare-fun b!81269 () Bool)

(declare-fun e!53393 () Bool)

(declare-fun lt!129339 () tuple3!346)

(assert (=> b!81269 (= e!53393 (and (= (buf!2045 thiss!1716) (buf!2045 (_2!3787 lt!129339))) (= (size!1655 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!1655 (_3!194 lt!129339)))))))

(declare-fun b!81270 () Bool)

(declare-fun lt!129363 () Unit!5416)

(assert (=> b!81270 (= e!53394 (tuple3!347 lt!129363 thiss!1716 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-fun lt!129368 () Unit!5416)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!3595) Unit!5416)

(assert (=> b!81270 (= lt!129368 (arrayBitRangesEqReflexiveLemma!0 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-fun call!1104 () Bool)

(assert (=> b!81270 call!1104))

(declare-fun lt!129335 () Unit!5416)

(assert (=> b!81270 (= lt!129335 lt!129368)))

(assert (=> b!81270 (= lt!129361 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!81270 (= lt!129346 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!129365 () (_ BitVec 64))

(assert (=> b!81270 (= lt!129365 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129369 () (_ BitVec 64))

(assert (=> b!81270 (= lt!129369 ((_ sign_extend 32) (size!1655 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!129360 () (_ BitVec 64))

(assert (=> b!81270 (= lt!129360 (bvmul lt!129369 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!81270 (= lt!129337 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!81270 (= lt!129340 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!3595 array!3595 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5416)

(assert (=> b!81270 (= lt!129363 (arrayBitRangesEqSlicedLemma!0 lt!129361 lt!129346 lt!129365 lt!129360 lt!129337 lt!129340))))

(assert (=> b!81270 call!1105))

(declare-fun bm!1102 () Bool)

(assert (=> bm!1102 (= call!1104 (arrayBitRangesEq!0 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (ite c!5701 (_3!194 lt!129339) (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!5701 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!1655 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!81271 () Bool)

(declare-fun res!67200 () Bool)

(assert (=> b!81271 (=> (not res!67200) (not e!53395))))

(assert (=> b!81271 (= res!67200 (invariant!0 (currentBit!3956 (_2!3787 lt!129338)) (currentByte!3961 (_2!3787 lt!129338)) (size!1655 (buf!2045 (_2!3787 lt!129338)))))))

(declare-fun b!81272 () Bool)

(declare-fun res!67197 () Bool)

(assert (=> b!81272 (=> (not res!67197) (not e!53395))))

(assert (=> b!81272 (= res!67197 (and (= (buf!2045 thiss!1716) (buf!2045 (_2!3787 lt!129338))) (= (size!1655 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!1655 (_3!194 lt!129338)))))))

(declare-fun b!81273 () Bool)

(declare-fun lt!129336 () Unit!5416)

(assert (=> b!81273 (= e!53394 (tuple3!347 lt!129336 (_2!3787 lt!129339) (_3!194 lt!129339)))))

(declare-fun readBit!0 (BitStream!2872) tuple2!7188)

(assert (=> b!81273 (= lt!129334 (readBit!0 thiss!1716))))

(declare-fun lt!129345 () (_ BitVec 32))

(assert (=> b!81273 (= lt!129345 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129353 () (_ BitVec 32))

(assert (=> b!81273 (= lt!129353 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129366 () array!3595)

(assert (=> b!81273 (= lt!129366 (array!3596 (store (arr!2277 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129345 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2277 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129345)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129353)))) ((_ sign_extend 24) (ite (_1!3791 lt!129334) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129353) #b00000000))))) (size!1655 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!129362 () (_ BitVec 64))

(assert (=> b!81273 (= lt!129362 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!129355 () (_ BitVec 64))

(assert (=> b!81273 (= lt!129355 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!129342 () Unit!5416)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2872 BitStream!2872 (_ BitVec 64) (_ BitVec 64)) Unit!5416)

(assert (=> b!81273 (= lt!129342 (validateOffsetBitsIneqLemma!0 thiss!1716 (_2!3791 lt!129334) lt!129362 lt!129355))))

(assert (=> b!81273 (validate_offset_bits!1 ((_ sign_extend 32) (size!1655 (buf!2045 (_2!3791 lt!129334)))) ((_ sign_extend 32) (currentByte!3961 (_2!3791 lt!129334))) ((_ sign_extend 32) (currentBit!3956 (_2!3791 lt!129334))) (bvsub lt!129362 lt!129355))))

(declare-fun lt!129343 () Unit!5416)

(assert (=> b!81273 (= lt!129343 lt!129342)))

(assert (=> b!81273 (= lt!129339 (readBitsLoop!0 (_2!3791 lt!129334) nBits!516 lt!129366 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!516))))

(declare-fun res!67194 () Bool)

(assert (=> b!81273 (= res!67194 (= (bvsub (bvadd (bitIndex!0 (size!1655 (buf!2045 thiss!1716)) (currentByte!3961 thiss!1716) (currentBit!3956 thiss!1716)) nBits!516) #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!1655 (buf!2045 (_2!3787 lt!129339))) (currentByte!3961 (_2!3787 lt!129339)) (currentBit!3956 (_2!3787 lt!129339)))))))

(assert (=> b!81273 (=> (not res!67194) (not e!53393))))

(assert (=> b!81273 e!53393))

(declare-fun lt!129348 () Unit!5416)

(declare-fun Unit!5426 () Unit!5416)

(assert (=> b!81273 (= lt!129348 Unit!5426)))

(assert (=> b!81273 (= lt!129354 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!81273 (= lt!129350 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129344 () Unit!5416)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!3595 (_ BitVec 64) Bool) Unit!5416)

(assert (=> b!81273 (= lt!129344 (arrayBitRangesUpdatedAtLemma!0 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (_1!3791 lt!129334)))))

(assert (=> b!81273 call!1105))

(declare-fun lt!129351 () Unit!5416)

(assert (=> b!81273 (= lt!129351 lt!129344)))

(declare-fun lt!129347 () (_ BitVec 64))

(assert (=> b!81273 (= lt!129347 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129359 () Unit!5416)

(declare-fun arrayBitRangesEqTransitive!0 (array!3595 array!3595 array!3595 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5416)

(assert (=> b!81273 (= lt!129359 (arrayBitRangesEqTransitive!0 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!129366 (_3!194 lt!129339) lt!129347 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!81273 (arrayBitRangesEq!0 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!194 lt!129339) lt!129347 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129349 () Unit!5416)

(assert (=> b!81273 (= lt!129349 lt!129359)))

(assert (=> b!81273 call!1104))

(declare-fun lt!129364 () Unit!5416)

(declare-fun Unit!5427 () Unit!5416)

(assert (=> b!81273 (= lt!129364 Unit!5427)))

(declare-fun lt!129357 () Unit!5416)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!3595 array!3595 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5416)

(assert (=> b!81273 (= lt!129357 (arrayBitRangesEqImpliesEq!0 lt!129366 (_3!194 lt!129339) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!81273 (= (bitAt!0 lt!129366 #b0000000000000000000000000000000000000000000000000000000000000000) (bitAt!0 (_3!194 lt!129339) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!129341 () Unit!5416)

(assert (=> b!81273 (= lt!129341 lt!129357)))

(declare-fun lt!129358 () Unit!5416)

(declare-fun Unit!5428 () Unit!5416)

(assert (=> b!81273 (= lt!129358 Unit!5428)))

(declare-fun lt!129356 () Bool)

(assert (=> b!81273 (= lt!129356 (= (bitAt!0 (_3!194 lt!129339) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!3791 lt!129334)))))

(declare-fun Unit!5429 () Unit!5416)

(assert (=> b!81273 (= lt!129336 Unit!5429)))

(assert (=> b!81273 lt!129356))

(declare-fun b!81274 () Bool)

(declare-fun res!67196 () Bool)

(assert (=> b!81274 (=> (not res!67196) (not e!53395))))

(assert (=> b!81274 (= res!67196 e!53396)))

(declare-fun res!67199 () Bool)

(assert (=> b!81274 (=> res!67199 e!53396)))

(assert (=> b!81274 (= res!67199 (not (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516)))))

(declare-fun b!81275 () Bool)

(declare-fun res!67195 () Bool)

(assert (=> b!81275 (=> (not res!67195) (not e!53395))))

(assert (=> b!81275 (= res!67195 (arrayBitRangesEq!0 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!194 lt!129338) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!81276 () Bool)

(declare-datatypes ((List!811 0))(
  ( (Nil!808) (Cons!807 (h!926 Bool) (t!1561 List!811)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2872 array!3595 (_ BitVec 64) (_ BitVec 64)) List!811)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2872 BitStream!2872 (_ BitVec 64)) List!811)

(assert (=> b!81276 (= e!53395 (= (byteArrayBitContentToList!0 (_2!3787 lt!129338) (_3!194 lt!129338) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000)) (bitStreamReadBitsIntoList!0 (_2!3787 lt!129338) thiss!1716 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!81276 (or (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!81276 (or (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!25358 c!5701) b!81273))

(assert (= (and d!25358 (not c!5701)) b!81270))

(assert (= (and b!81273 res!67194) b!81269))

(assert (= (or b!81273 b!81270) bm!1102))

(assert (= (or b!81273 b!81270) bm!1101))

(assert (= (and d!25358 res!67198) b!81272))

(assert (= (and b!81272 res!67197) b!81275))

(assert (= (and b!81275 res!67195) b!81274))

(assert (= (and b!81274 (not res!67199)) b!81268))

(assert (= (and b!81274 res!67196) b!81271))

(assert (= (and b!81271 res!67200) b!81276))

(declare-fun m!127171 () Bool)

(assert (=> b!81276 m!127171))

(declare-fun m!127173 () Bool)

(assert (=> b!81276 m!127173))

(declare-fun m!127175 () Bool)

(assert (=> bm!1102 m!127175))

(declare-fun m!127177 () Bool)

(assert (=> bm!1101 m!127177))

(declare-fun m!127179 () Bool)

(assert (=> bm!1101 m!127179))

(declare-fun m!127181 () Bool)

(assert (=> bm!1101 m!127181))

(declare-fun m!127183 () Bool)

(assert (=> bm!1101 m!127183))

(declare-fun m!127185 () Bool)

(assert (=> b!81270 m!127185))

(declare-fun m!127187 () Bool)

(assert (=> b!81270 m!127187))

(declare-fun m!127189 () Bool)

(assert (=> b!81268 m!127189))

(declare-fun m!127191 () Bool)

(assert (=> b!81268 m!127191))

(declare-fun m!127193 () Bool)

(assert (=> b!81273 m!127193))

(declare-fun m!127195 () Bool)

(assert (=> b!81273 m!127195))

(declare-fun m!127197 () Bool)

(assert (=> b!81273 m!127197))

(declare-fun m!127199 () Bool)

(assert (=> b!81273 m!127199))

(declare-fun m!127201 () Bool)

(assert (=> b!81273 m!127201))

(declare-fun m!127203 () Bool)

(assert (=> b!81273 m!127203))

(declare-fun m!127205 () Bool)

(assert (=> b!81273 m!127205))

(declare-fun m!127207 () Bool)

(assert (=> b!81273 m!127207))

(declare-fun m!127209 () Bool)

(assert (=> b!81273 m!127209))

(declare-fun m!127211 () Bool)

(assert (=> b!81273 m!127211))

(declare-fun m!127213 () Bool)

(assert (=> b!81273 m!127213))

(declare-fun m!127215 () Bool)

(assert (=> b!81273 m!127215))

(declare-fun m!127217 () Bool)

(assert (=> b!81273 m!127217))

(declare-fun m!127219 () Bool)

(assert (=> b!81273 m!127219))

(declare-fun m!127221 () Bool)

(assert (=> b!81273 m!127221))

(declare-fun m!127223 () Bool)

(assert (=> b!81275 m!127223))

(declare-fun m!127225 () Bool)

(assert (=> d!25358 m!127225))

(assert (=> d!25358 m!127213))

(declare-fun m!127227 () Bool)

(assert (=> b!81271 m!127227))

(assert (=> b!81185 d!25358))

(push 1)

(assert (not b!81276))

(assert (not b!81275))

(assert (not bm!1102))

(assert (not b!81271))

(assert (not d!25352))

(assert (not b!81270))

(assert (not bm!1101))

(assert (not d!25354))

(assert (not d!25358))

(assert (not b!81273))

(assert (not b!81268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!25374 () Bool)

(declare-fun e!53403 () Bool)

(assert (=> d!25374 e!53403))

(declare-fun res!67210 () Bool)

(assert (=> d!25374 (=> (not res!67210) (not e!53403))))

(declare-fun lt!129411 () (_ BitVec 64))

(assert (=> d!25374 (= res!67210 (or (= lt!129411 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!129411 #b0000000000000000000000000000000000000000000000000000000000001000) lt!129411))))))

(assert (=> d!25374 (= lt!129411 ((_ sign_extend 32) (size!1655 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!129410 () Unit!5416)

(declare-fun choose!59 (array!3595) Unit!5416)

(assert (=> d!25374 (= lt!129410 (choose!59 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(assert (=> d!25374 (= (arrayBitRangesEqReflexiveLemma!0 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129410)))

(declare-fun b!81288 () Bool)

(assert (=> b!81288 (= e!53403 (arrayBitRangesEq!0 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!1655 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!25374 res!67210) b!81288))

(declare-fun m!127287 () Bool)

(assert (=> d!25374 m!127287))

(declare-fun m!127289 () Bool)

(assert (=> b!81288 m!127289))

(assert (=> b!81270 d!25374))

(declare-fun d!25376 () Bool)

(assert (=> d!25376 (arrayBitRangesEq!0 lt!129361 lt!129346 lt!129337 lt!129340)))

(declare-fun lt!129414 () Unit!5416)

(declare-fun choose!4 (array!3595 array!3595 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5416)

(assert (=> d!25376 (= lt!129414 (choose!4 lt!129361 lt!129346 lt!129365 lt!129360 lt!129337 lt!129340))))

(assert (=> d!25376 (bvsle (size!1655 lt!129361) (size!1655 lt!129346))))

(assert (=> d!25376 (= (arrayBitRangesEqSlicedLemma!0 lt!129361 lt!129346 lt!129365 lt!129360 lt!129337 lt!129340) lt!129414)))

(declare-fun bs!6216 () Bool)

(assert (= bs!6216 d!25376))

(declare-fun m!127291 () Bool)

(assert (=> bs!6216 m!127291))

(declare-fun m!127293 () Bool)

(assert (=> bs!6216 m!127293))

(assert (=> b!81270 d!25376))

(declare-fun b!81306 () Bool)

(declare-fun e!53420 () Bool)

(declare-fun call!1110 () Bool)

(assert (=> b!81306 (= e!53420 call!1110)))

(declare-fun b!81307 () Bool)

(declare-datatypes ((tuple4!42 0))(
  ( (tuple4!43 (_1!3796 (_ BitVec 32)) (_2!3796 (_ BitVec 32)) (_3!197 (_ BitVec 32)) (_4!21 (_ BitVec 32))) )
))
(declare-fun lt!129429 () tuple4!42)

(declare-fun lt!129431 () (_ BitVec 32))

(declare-fun e!53422 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!81307 (= e!53422 (byteRangesEq!0 (select (arr!2277 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (_4!21 lt!129429)) (select (arr!2277 (_3!194 lt!129338)) (_4!21 lt!129429)) #b00000000000000000000000000000000 lt!129431))))

(declare-fun b!81308 () Bool)

(declare-fun res!67224 () Bool)

(assert (=> b!81308 (= res!67224 (= lt!129431 #b00000000000000000000000000000000))))

(assert (=> b!81308 (=> res!67224 e!53422)))

(declare-fun e!53421 () Bool)

(assert (=> b!81308 (= e!53421 e!53422)))

(declare-fun b!81309 () Bool)

(assert (=> b!81309 (= e!53420 e!53421)))

(declare-fun res!67226 () Bool)

(assert (=> b!81309 (= res!67226 call!1110)))

(assert (=> b!81309 (=> (not res!67226) (not e!53421))))

(declare-fun b!81310 () Bool)

(declare-fun e!53419 () Bool)

(assert (=> b!81310 (= e!53419 e!53420)))

(declare-fun c!5705 () Bool)

(assert (=> b!81310 (= c!5705 (= (_3!197 lt!129429) (_4!21 lt!129429)))))

(declare-fun b!81311 () Bool)

(declare-fun e!53423 () Bool)

(assert (=> b!81311 (= e!53423 e!53419)))

(declare-fun res!67227 () Bool)

(assert (=> b!81311 (=> (not res!67227) (not e!53419))))

(declare-fun e!53424 () Bool)

(assert (=> b!81311 (= res!67227 e!53424)))

(declare-fun res!67225 () Bool)

(assert (=> b!81311 (=> res!67225 e!53424)))

(assert (=> b!81311 (= res!67225 (bvsge (_1!3796 lt!129429) (_2!3796 lt!129429)))))

(assert (=> b!81311 (= lt!129431 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129430 () (_ BitVec 32))

(assert (=> b!81311 (= lt!129430 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!42)

(assert (=> b!81311 (= lt!129429 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!25378 () Bool)

(declare-fun res!67228 () Bool)

(assert (=> d!25378 (=> res!67228 e!53423)))

(assert (=> d!25378 (= res!67228 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!25378 (= (arrayBitRangesEq!0 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!194 lt!129338) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) e!53423)))

(declare-fun bm!1107 () Bool)

(assert (=> bm!1107 (= call!1110 (byteRangesEq!0 (select (arr!2277 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (_3!197 lt!129429)) (select (arr!2277 (_3!194 lt!129338)) (_3!197 lt!129429)) lt!129430 (ite c!5705 lt!129431 #b00000000000000000000000000001000)))))

(declare-fun b!81312 () Bool)

(declare-fun arrayRangesEq!22 (array!3595 array!3595 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!81312 (= e!53424 (arrayRangesEq!22 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!194 lt!129338) (_1!3796 lt!129429) (_2!3796 lt!129429)))))

(assert (= (and d!25378 (not res!67228)) b!81311))

(assert (= (and b!81311 (not res!67225)) b!81312))

(assert (= (and b!81311 res!67227) b!81310))

(assert (= (and b!81310 c!5705) b!81306))

(assert (= (and b!81310 (not c!5705)) b!81309))

(assert (= (and b!81309 res!67226) b!81308))

(assert (= (and b!81308 (not res!67224)) b!81307))

(assert (= (or b!81306 b!81309) bm!1107))

(declare-fun m!127299 () Bool)

(assert (=> b!81307 m!127299))

(declare-fun m!127303 () Bool)

(assert (=> b!81307 m!127303))

(assert (=> b!81307 m!127299))

(assert (=> b!81307 m!127303))

(declare-fun m!127307 () Bool)

(assert (=> b!81307 m!127307))

(declare-fun m!127309 () Bool)

(assert (=> b!81311 m!127309))

(declare-fun m!127311 () Bool)

(assert (=> bm!1107 m!127311))

(declare-fun m!127313 () Bool)

(assert (=> bm!1107 m!127313))

(assert (=> bm!1107 m!127311))

(assert (=> bm!1107 m!127313))

(declare-fun m!127315 () Bool)

(assert (=> bm!1107 m!127315))

(declare-fun m!127317 () Bool)

(assert (=> b!81312 m!127317))

(assert (=> b!81275 d!25378))

(declare-fun d!25386 () Bool)

(assert (=> d!25386 (= (invariant!0 (currentBit!3956 thiss!1716) (currentByte!3961 thiss!1716) (size!1655 (buf!2045 thiss!1716))) (and (bvsge (currentBit!3956 thiss!1716) #b00000000000000000000000000000000) (bvslt (currentBit!3956 thiss!1716) #b00000000000000000000000000001000) (bvsge (currentByte!3961 thiss!1716) #b00000000000000000000000000000000) (or (bvslt (currentByte!3961 thiss!1716) (size!1655 (buf!2045 thiss!1716))) (and (= (currentBit!3956 thiss!1716) #b00000000000000000000000000000000) (= (currentByte!3961 thiss!1716) (size!1655 (buf!2045 thiss!1716)))))))))

(assert (=> d!25352 d!25386))

(declare-fun b!81313 () Bool)

(declare-fun e!53426 () Bool)

(declare-fun call!1111 () Bool)

(assert (=> b!81313 (= e!53426 call!1111)))

(declare-fun e!53428 () Bool)

(declare-fun lt!129433 () tuple4!42)

(declare-fun lt!129435 () (_ BitVec 32))

(declare-fun b!81314 () Bool)

(assert (=> b!81314 (= e!53428 (byteRangesEq!0 (select (arr!2277 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (_4!21 lt!129433)) (select (arr!2277 (ite c!5701 (_3!194 lt!129339) (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) (_4!21 lt!129433)) #b00000000000000000000000000000000 lt!129435))))

(declare-fun b!81315 () Bool)

(declare-fun res!67229 () Bool)

(assert (=> b!81315 (= res!67229 (= lt!129435 #b00000000000000000000000000000000))))

(assert (=> b!81315 (=> res!67229 e!53428)))

(declare-fun e!53427 () Bool)

(assert (=> b!81315 (= e!53427 e!53428)))

(declare-fun b!81316 () Bool)

(assert (=> b!81316 (= e!53426 e!53427)))

(declare-fun res!67231 () Bool)

(assert (=> b!81316 (= res!67231 call!1111)))

(assert (=> b!81316 (=> (not res!67231) (not e!53427))))

(declare-fun b!81317 () Bool)

(declare-fun e!53425 () Bool)

(assert (=> b!81317 (= e!53425 e!53426)))

(declare-fun c!5706 () Bool)

(assert (=> b!81317 (= c!5706 (= (_3!197 lt!129433) (_4!21 lt!129433)))))

(declare-fun b!81318 () Bool)

(declare-fun e!53429 () Bool)

(assert (=> b!81318 (= e!53429 e!53425)))

(declare-fun res!67232 () Bool)

(assert (=> b!81318 (=> (not res!67232) (not e!53425))))

(declare-fun e!53430 () Bool)

(assert (=> b!81318 (= res!67232 e!53430)))

(declare-fun res!67230 () Bool)

(assert (=> b!81318 (=> res!67230 e!53430)))

(assert (=> b!81318 (= res!67230 (bvsge (_1!3796 lt!129433) (_2!3796 lt!129433)))))

(assert (=> b!81318 (= lt!129435 ((_ extract 31 0) (bvsrem (ite c!5701 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!1655 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129434 () (_ BitVec 32))

(assert (=> b!81318 (= lt!129434 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!81318 (= lt!129433 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!5701 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!1655 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun d!25388 () Bool)

(declare-fun res!67233 () Bool)

(assert (=> d!25388 (=> res!67233 e!53429)))

(assert (=> d!25388 (= res!67233 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!5701 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!1655 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!25388 (= (arrayBitRangesEq!0 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (ite c!5701 (_3!194 lt!129339) (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!5701 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!1655 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000))) e!53429)))

(declare-fun bm!1108 () Bool)

(assert (=> bm!1108 (= call!1111 (byteRangesEq!0 (select (arr!2277 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (_3!197 lt!129433)) (select (arr!2277 (ite c!5701 (_3!194 lt!129339) (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) (_3!197 lt!129433)) lt!129434 (ite c!5706 lt!129435 #b00000000000000000000000000001000)))))

(declare-fun b!81319 () Bool)

(assert (=> b!81319 (= e!53430 (arrayRangesEq!22 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (ite c!5701 (_3!194 lt!129339) (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (_1!3796 lt!129433) (_2!3796 lt!129433)))))

(assert (= (and d!25388 (not res!67233)) b!81318))

(assert (= (and b!81318 (not res!67230)) b!81319))

(assert (= (and b!81318 res!67232) b!81317))

(assert (= (and b!81317 c!5706) b!81313))

(assert (= (and b!81317 (not c!5706)) b!81316))

(assert (= (and b!81316 res!67231) b!81315))

(assert (= (and b!81315 (not res!67229)) b!81314))

(assert (= (or b!81313 b!81316) bm!1108))

(declare-fun m!127319 () Bool)

(assert (=> b!81314 m!127319))

(declare-fun m!127321 () Bool)

(assert (=> b!81314 m!127321))

(assert (=> b!81314 m!127319))

(assert (=> b!81314 m!127321))

(declare-fun m!127323 () Bool)

(assert (=> b!81314 m!127323))

(declare-fun m!127325 () Bool)

(assert (=> b!81318 m!127325))

(declare-fun m!127327 () Bool)

(assert (=> bm!1108 m!127327))

(declare-fun m!127329 () Bool)

(assert (=> bm!1108 m!127329))

(assert (=> bm!1108 m!127327))

(assert (=> bm!1108 m!127329))

(declare-fun m!127331 () Bool)

(assert (=> bm!1108 m!127331))

(declare-fun m!127333 () Bool)

(assert (=> b!81319 m!127333))

(assert (=> bm!1102 d!25388))

(declare-fun d!25390 () Bool)

(assert (=> d!25390 (= (invariant!0 (currentBit!3956 (_2!3787 lt!129338)) (currentByte!3961 (_2!3787 lt!129338)) (size!1655 (buf!2045 (_2!3787 lt!129338)))) (and (bvsge (currentBit!3956 (_2!3787 lt!129338)) #b00000000000000000000000000000000) (bvslt (currentBit!3956 (_2!3787 lt!129338)) #b00000000000000000000000000001000) (bvsge (currentByte!3961 (_2!3787 lt!129338)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3961 (_2!3787 lt!129338)) (size!1655 (buf!2045 (_2!3787 lt!129338)))) (and (= (currentBit!3956 (_2!3787 lt!129338)) #b00000000000000000000000000000000) (= (currentByte!3961 (_2!3787 lt!129338)) (size!1655 (buf!2045 (_2!3787 lt!129338))))))))))

(assert (=> b!81271 d!25390))

(declare-fun d!25392 () Bool)

(declare-fun c!5709 () Bool)

(assert (=> d!25392 (= c!5709 (= (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!53433 () List!811)

(assert (=> d!25392 (= (byteArrayBitContentToList!0 (_2!3787 lt!129338) (_3!194 lt!129338) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000)) e!53433)))

(declare-fun b!81324 () Bool)

(assert (=> b!81324 (= e!53433 Nil!808)))

(declare-fun b!81325 () Bool)

(assert (=> b!81325 (= e!53433 (Cons!807 (not (= (bvand ((_ sign_extend 24) (select (arr!2277 (_3!194 lt!129338)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3787 lt!129338) (_3!194 lt!129338) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!25392 c!5709) b!81324))

(assert (= (and d!25392 (not c!5709)) b!81325))

(declare-fun m!127335 () Bool)

(assert (=> b!81325 m!127335))

(declare-fun m!127337 () Bool)

(assert (=> b!81325 m!127337))

(declare-fun m!127339 () Bool)

(assert (=> b!81325 m!127339))

(assert (=> b!81276 d!25392))

(declare-fun b!81348 () Bool)

(declare-datatypes ((tuple2!7198 0))(
  ( (tuple2!7199 (_1!3797 List!811) (_2!3797 BitStream!2872)) )
))
(declare-fun e!53450 () tuple2!7198)

(assert (=> b!81348 (= e!53450 (tuple2!7199 Nil!808 thiss!1716))))

(declare-fun b!81349 () Bool)

(declare-fun lt!129448 () tuple2!7188)

(declare-fun lt!129450 () (_ BitVec 64))

(assert (=> b!81349 (= e!53450 (tuple2!7199 (Cons!807 (_1!3791 lt!129448) (bitStreamReadBitsIntoList!0 (_2!3787 lt!129338) (_2!3791 lt!129448) (bvsub (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) lt!129450))) (_2!3791 lt!129448)))))

(assert (=> b!81349 (= lt!129448 (readBit!0 thiss!1716))))

(assert (=> b!81349 (= lt!129450 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!81350 () Bool)

(declare-fun e!53451 () Bool)

(declare-fun lt!129449 () List!811)

(declare-fun isEmpty!241 (List!811) Bool)

(assert (=> b!81350 (= e!53451 (isEmpty!241 lt!129449))))

(declare-fun b!81351 () Bool)

(declare-fun length!400 (List!811) Int)

(assert (=> b!81351 (= e!53451 (> (length!400 lt!129449) 0))))

(declare-fun d!25394 () Bool)

(assert (=> d!25394 e!53451))

(declare-fun c!5716 () Bool)

(assert (=> d!25394 (= c!5716 (= (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!25394 (= lt!129449 (_1!3797 e!53450))))

(declare-fun c!5717 () Bool)

(assert (=> d!25394 (= c!5717 (= (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!25394 (bvsge (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!25394 (= (bitStreamReadBitsIntoList!0 (_2!3787 lt!129338) thiss!1716 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000)) lt!129449)))

(assert (= (and d!25394 c!5717) b!81348))

(assert (= (and d!25394 (not c!5717)) b!81349))

(assert (= (and d!25394 c!5716) b!81350))

(assert (= (and d!25394 (not c!5716)) b!81351))

(declare-fun m!127341 () Bool)

(assert (=> b!81349 m!127341))

(assert (=> b!81349 m!127195))

(declare-fun m!127343 () Bool)

(assert (=> b!81350 m!127343))

(declare-fun m!127345 () Bool)

(assert (=> b!81351 m!127345))

(assert (=> b!81276 d!25394))

(declare-fun b!81352 () Bool)

(declare-fun e!53453 () Bool)

(declare-fun call!1114 () Bool)

(assert (=> b!81352 (= e!53453 call!1114)))

(declare-fun lt!129453 () (_ BitVec 32))

(declare-fun lt!129451 () tuple4!42)

(declare-fun b!81353 () Bool)

(declare-fun e!53455 () Bool)

(assert (=> b!81353 (= e!53455 (byteRangesEq!0 (select (arr!2277 (ite c!5701 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!129361)) (_4!21 lt!129451)) (select (arr!2277 (ite c!5701 (array!3596 (store (arr!2277 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129354 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2277 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129354)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129350)))) ((_ sign_extend 24) (ite (_1!3791 lt!129334) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129350) #b00000000))))) (size!1655 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) lt!129346)) (_4!21 lt!129451)) #b00000000000000000000000000000000 lt!129453))))

(declare-fun b!81354 () Bool)

(declare-fun res!67244 () Bool)

(assert (=> b!81354 (= res!67244 (= lt!129453 #b00000000000000000000000000000000))))

(assert (=> b!81354 (=> res!67244 e!53455)))

(declare-fun e!53454 () Bool)

(assert (=> b!81354 (= e!53454 e!53455)))

(declare-fun b!81355 () Bool)

(assert (=> b!81355 (= e!53453 e!53454)))

(declare-fun res!67246 () Bool)

(assert (=> b!81355 (= res!67246 call!1114)))

(assert (=> b!81355 (=> (not res!67246) (not e!53454))))

(declare-fun b!81356 () Bool)

(declare-fun e!53452 () Bool)

(assert (=> b!81356 (= e!53452 e!53453)))

(declare-fun c!5718 () Bool)

(assert (=> b!81356 (= c!5718 (= (_3!197 lt!129451) (_4!21 lt!129451)))))

(declare-fun b!81357 () Bool)

(declare-fun e!53456 () Bool)

(assert (=> b!81357 (= e!53456 e!53452)))

(declare-fun res!67247 () Bool)

(assert (=> b!81357 (=> (not res!67247) (not e!53452))))

(declare-fun e!53457 () Bool)

(assert (=> b!81357 (= res!67247 e!53457)))

(declare-fun res!67245 () Bool)

(assert (=> b!81357 (=> res!67245 e!53457)))

(assert (=> b!81357 (= res!67245 (bvsge (_1!3796 lt!129451) (_2!3796 lt!129451)))))

(assert (=> b!81357 (= lt!129453 ((_ extract 31 0) (bvsrem (ite c!5701 #b0000000000000000000000000000000000000000000000000000000000000000 lt!129340) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129452 () (_ BitVec 32))

(assert (=> b!81357 (= lt!129452 ((_ extract 31 0) (bvsrem (ite c!5701 #b0000000000000000000000000000000000000000000000000000000000000000 lt!129337) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!81357 (= lt!129451 (arrayBitIndices!0 (ite c!5701 #b0000000000000000000000000000000000000000000000000000000000000000 lt!129337) (ite c!5701 #b0000000000000000000000000000000000000000000000000000000000000000 lt!129340)))))

(declare-fun d!25396 () Bool)

(declare-fun res!67248 () Bool)

(assert (=> d!25396 (=> res!67248 e!53456)))

(assert (=> d!25396 (= res!67248 (bvsge (ite c!5701 #b0000000000000000000000000000000000000000000000000000000000000000 lt!129337) (ite c!5701 #b0000000000000000000000000000000000000000000000000000000000000000 lt!129340)))))

(assert (=> d!25396 (= (arrayBitRangesEq!0 (ite c!5701 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!129361) (ite c!5701 (array!3596 (store (arr!2277 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129354 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2277 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129354)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129350)))) ((_ sign_extend 24) (ite (_1!3791 lt!129334) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129350) #b00000000))))) (size!1655 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) lt!129346) (ite c!5701 #b0000000000000000000000000000000000000000000000000000000000000000 lt!129337) (ite c!5701 #b0000000000000000000000000000000000000000000000000000000000000000 lt!129340)) e!53456)))

(declare-fun bm!1111 () Bool)

(assert (=> bm!1111 (= call!1114 (byteRangesEq!0 (select (arr!2277 (ite c!5701 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!129361)) (_3!197 lt!129451)) (select (arr!2277 (ite c!5701 (array!3596 (store (arr!2277 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129354 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2277 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129354)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129350)))) ((_ sign_extend 24) (ite (_1!3791 lt!129334) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129350) #b00000000))))) (size!1655 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) lt!129346)) (_3!197 lt!129451)) lt!129452 (ite c!5718 lt!129453 #b00000000000000000000000000001000)))))

(declare-fun b!81358 () Bool)

(assert (=> b!81358 (= e!53457 (arrayRangesEq!22 (ite c!5701 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!129361) (ite c!5701 (array!3596 (store (arr!2277 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129354 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2277 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129354)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129350)))) ((_ sign_extend 24) (ite (_1!3791 lt!129334) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129350) #b00000000))))) (size!1655 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) lt!129346) (_1!3796 lt!129451) (_2!3796 lt!129451)))))

(assert (= (and d!25396 (not res!67248)) b!81357))

(assert (= (and b!81357 (not res!67245)) b!81358))

(assert (= (and b!81357 res!67247) b!81356))

(assert (= (and b!81356 c!5718) b!81352))

(assert (= (and b!81356 (not c!5718)) b!81355))

(assert (= (and b!81355 res!67246) b!81354))

(assert (= (and b!81354 (not res!67244)) b!81353))

(assert (= (or b!81352 b!81355) bm!1111))

(declare-fun m!127347 () Bool)

(assert (=> b!81353 m!127347))

(declare-fun m!127349 () Bool)

(assert (=> b!81353 m!127349))

(assert (=> b!81353 m!127347))

(assert (=> b!81353 m!127349))

(declare-fun m!127351 () Bool)

(assert (=> b!81353 m!127351))

(declare-fun m!127353 () Bool)

(assert (=> b!81357 m!127353))

(declare-fun m!127355 () Bool)

(assert (=> bm!1111 m!127355))

(declare-fun m!127357 () Bool)

(assert (=> bm!1111 m!127357))

(assert (=> bm!1111 m!127355))

(assert (=> bm!1111 m!127357))

(declare-fun m!127359 () Bool)

(assert (=> bm!1111 m!127359))

(declare-fun m!127361 () Bool)

(assert (=> b!81358 m!127361))

(assert (=> bm!1101 d!25396))

(declare-fun d!25398 () Bool)

(assert (=> d!25398 (= (bitAt!0 (_3!194 lt!129338) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand ((_ sign_extend 24) (select (arr!2277 (_3!194 lt!129338)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!6218 () Bool)

(assert (= bs!6218 d!25398))

(assert (=> bs!6218 m!127335))

(assert (=> bs!6218 m!127337))

(assert (=> b!81268 d!25398))

(declare-fun d!25400 () Bool)

(declare-fun lt!129459 () tuple2!7188)

(assert (=> d!25400 (= lt!129459 (readBit!0 thiss!1716))))

(assert (=> d!25400 (= (readBitPure!0 thiss!1716) (tuple2!7193 (_2!3791 lt!129459) (_1!3791 lt!129459)))))

(declare-fun bs!6219 () Bool)

(assert (= bs!6219 d!25400))

(assert (=> bs!6219 m!127195))

(assert (=> b!81268 d!25400))

(declare-fun d!25404 () Bool)

(declare-fun e!53472 () Bool)

(assert (=> d!25404 e!53472))

(declare-fun res!67263 () Bool)

(assert (=> d!25404 (=> (not res!67263) (not e!53472))))

(declare-fun lt!129479 () (_ BitVec 64))

(declare-fun lt!129483 () (_ BitVec 64))

(declare-fun lt!129482 () (_ BitVec 64))

(assert (=> d!25404 (= res!67263 (= lt!129483 (bvsub lt!129482 lt!129479)))))

(assert (=> d!25404 (or (= (bvand lt!129482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!129479 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!129482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!129482 lt!129479) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25404 (= lt!129479 (remainingBits!0 ((_ sign_extend 32) (size!1655 (buf!2045 (_2!3787 lt!129338)))) ((_ sign_extend 32) (currentByte!3961 (_2!3787 lt!129338))) ((_ sign_extend 32) (currentBit!3956 (_2!3787 lt!129338)))))))

(declare-fun lt!129480 () (_ BitVec 64))

(declare-fun lt!129481 () (_ BitVec 64))

(assert (=> d!25404 (= lt!129482 (bvmul lt!129480 lt!129481))))

(assert (=> d!25404 (or (= lt!129480 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!129481 (bvsdiv (bvmul lt!129480 lt!129481) lt!129480)))))

(assert (=> d!25404 (= lt!129481 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25404 (= lt!129480 ((_ sign_extend 32) (size!1655 (buf!2045 (_2!3787 lt!129338)))))))

(assert (=> d!25404 (= lt!129483 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3961 (_2!3787 lt!129338))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3956 (_2!3787 lt!129338)))))))

(assert (=> d!25404 (invariant!0 (currentBit!3956 (_2!3787 lt!129338)) (currentByte!3961 (_2!3787 lt!129338)) (size!1655 (buf!2045 (_2!3787 lt!129338))))))

(assert (=> d!25404 (= (bitIndex!0 (size!1655 (buf!2045 (_2!3787 lt!129338))) (currentByte!3961 (_2!3787 lt!129338)) (currentBit!3956 (_2!3787 lt!129338))) lt!129483)))

(declare-fun b!81377 () Bool)

(declare-fun res!67264 () Bool)

(assert (=> b!81377 (=> (not res!67264) (not e!53472))))

(assert (=> b!81377 (= res!67264 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!129483))))

(declare-fun b!81378 () Bool)

(declare-fun lt!129478 () (_ BitVec 64))

(assert (=> b!81378 (= e!53472 (bvsle lt!129483 (bvmul lt!129478 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!81378 (or (= lt!129478 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!129478 #b0000000000000000000000000000000000000000000000000000000000001000) lt!129478)))))

(assert (=> b!81378 (= lt!129478 ((_ sign_extend 32) (size!1655 (buf!2045 (_2!3787 lt!129338)))))))

(assert (= (and d!25404 res!67263) b!81377))

(assert (= (and b!81377 res!67264) b!81378))

(declare-fun m!127399 () Bool)

(assert (=> d!25404 m!127399))

(assert (=> d!25404 m!127227))

(assert (=> d!25358 d!25404))

(declare-fun d!25420 () Bool)

(declare-fun e!53473 () Bool)

(assert (=> d!25420 e!53473))

(declare-fun res!67265 () Bool)

(assert (=> d!25420 (=> (not res!67265) (not e!53473))))

(declare-fun lt!129488 () (_ BitVec 64))

(declare-fun lt!129489 () (_ BitVec 64))

(declare-fun lt!129485 () (_ BitVec 64))

(assert (=> d!25420 (= res!67265 (= lt!129489 (bvsub lt!129488 lt!129485)))))

(assert (=> d!25420 (or (= (bvand lt!129488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!129485 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!129488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!129488 lt!129485) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25420 (= lt!129485 (remainingBits!0 ((_ sign_extend 32) (size!1655 (buf!2045 thiss!1716))) ((_ sign_extend 32) (currentByte!3961 thiss!1716)) ((_ sign_extend 32) (currentBit!3956 thiss!1716))))))

(declare-fun lt!129486 () (_ BitVec 64))

(declare-fun lt!129487 () (_ BitVec 64))

(assert (=> d!25420 (= lt!129488 (bvmul lt!129486 lt!129487))))

(assert (=> d!25420 (or (= lt!129486 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!129487 (bvsdiv (bvmul lt!129486 lt!129487) lt!129486)))))

(assert (=> d!25420 (= lt!129487 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25420 (= lt!129486 ((_ sign_extend 32) (size!1655 (buf!2045 thiss!1716))))))

(assert (=> d!25420 (= lt!129489 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3961 thiss!1716)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3956 thiss!1716))))))

(assert (=> d!25420 (invariant!0 (currentBit!3956 thiss!1716) (currentByte!3961 thiss!1716) (size!1655 (buf!2045 thiss!1716)))))

(assert (=> d!25420 (= (bitIndex!0 (size!1655 (buf!2045 thiss!1716)) (currentByte!3961 thiss!1716) (currentBit!3956 thiss!1716)) lt!129489)))

(declare-fun b!81379 () Bool)

(declare-fun res!67266 () Bool)

(assert (=> b!81379 (=> (not res!67266) (not e!53473))))

(assert (=> b!81379 (= res!67266 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!129489))))

(declare-fun b!81380 () Bool)

(declare-fun lt!129484 () (_ BitVec 64))

(assert (=> b!81380 (= e!53473 (bvsle lt!129489 (bvmul lt!129484 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!81380 (or (= lt!129484 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!129484 #b0000000000000000000000000000000000000000000000000000000000001000) lt!129484)))))

(assert (=> b!81380 (= lt!129484 ((_ sign_extend 32) (size!1655 (buf!2045 thiss!1716))))))

(assert (= (and d!25420 res!67265) b!81379))

(assert (= (and b!81379 res!67266) b!81380))

(assert (=> d!25420 m!127103))

(assert (=> d!25420 m!127101))

(assert (=> d!25358 d!25420))

(declare-fun d!25422 () Bool)

(assert (=> d!25422 (= (remainingBits!0 ((_ sign_extend 32) (size!1655 (buf!2045 thiss!1716))) ((_ sign_extend 32) (currentByte!3961 thiss!1716)) ((_ sign_extend 32) (currentBit!3956 thiss!1716))) (bvsub (bvmul ((_ sign_extend 32) (size!1655 (buf!2045 thiss!1716))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!3961 thiss!1716)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3956 thiss!1716)))))))

(assert (=> d!25354 d!25422))

(declare-fun d!25424 () Bool)

(declare-fun e!53474 () Bool)

(assert (=> d!25424 e!53474))

(declare-fun res!67267 () Bool)

(assert (=> d!25424 (=> (not res!67267) (not e!53474))))

(declare-fun lt!129494 () (_ BitVec 64))

(declare-fun lt!129491 () (_ BitVec 64))

(declare-fun lt!129495 () (_ BitVec 64))

(assert (=> d!25424 (= res!67267 (= lt!129495 (bvsub lt!129494 lt!129491)))))

(assert (=> d!25424 (or (= (bvand lt!129494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!129491 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!129494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!129494 lt!129491) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25424 (= lt!129491 (remainingBits!0 ((_ sign_extend 32) (size!1655 (buf!2045 (_2!3787 lt!129339)))) ((_ sign_extend 32) (currentByte!3961 (_2!3787 lt!129339))) ((_ sign_extend 32) (currentBit!3956 (_2!3787 lt!129339)))))))

(declare-fun lt!129492 () (_ BitVec 64))

(declare-fun lt!129493 () (_ BitVec 64))

(assert (=> d!25424 (= lt!129494 (bvmul lt!129492 lt!129493))))

(assert (=> d!25424 (or (= lt!129492 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!129493 (bvsdiv (bvmul lt!129492 lt!129493) lt!129492)))))

(assert (=> d!25424 (= lt!129493 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25424 (= lt!129492 ((_ sign_extend 32) (size!1655 (buf!2045 (_2!3787 lt!129339)))))))

(assert (=> d!25424 (= lt!129495 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3961 (_2!3787 lt!129339))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3956 (_2!3787 lt!129339)))))))

(assert (=> d!25424 (invariant!0 (currentBit!3956 (_2!3787 lt!129339)) (currentByte!3961 (_2!3787 lt!129339)) (size!1655 (buf!2045 (_2!3787 lt!129339))))))

(assert (=> d!25424 (= (bitIndex!0 (size!1655 (buf!2045 (_2!3787 lt!129339))) (currentByte!3961 (_2!3787 lt!129339)) (currentBit!3956 (_2!3787 lt!129339))) lt!129495)))

(declare-fun b!81381 () Bool)

(declare-fun res!67268 () Bool)

(assert (=> b!81381 (=> (not res!67268) (not e!53474))))

(assert (=> b!81381 (= res!67268 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!129495))))

(declare-fun b!81382 () Bool)

(declare-fun lt!129490 () (_ BitVec 64))

(assert (=> b!81382 (= e!53474 (bvsle lt!129495 (bvmul lt!129490 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!81382 (or (= lt!129490 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!129490 #b0000000000000000000000000000000000000000000000000000000000001000) lt!129490)))))

(assert (=> b!81382 (= lt!129490 ((_ sign_extend 32) (size!1655 (buf!2045 (_2!3787 lt!129339)))))))

(assert (= (and d!25424 res!67267) b!81381))

(assert (= (and b!81381 res!67268) b!81382))

(declare-fun m!127401 () Bool)

(assert (=> d!25424 m!127401))

(declare-fun m!127403 () Bool)

(assert (=> d!25424 m!127403))

(assert (=> b!81273 d!25424))

(declare-fun b!81383 () Bool)

(declare-fun e!53476 () Bool)

(declare-fun call!1117 () Bool)

(assert (=> b!81383 (= e!53476 call!1117)))

(declare-fun lt!129496 () tuple4!42)

(declare-fun e!53478 () Bool)

(declare-fun lt!129498 () (_ BitVec 32))

(declare-fun b!81384 () Bool)

(assert (=> b!81384 (= e!53478 (byteRangesEq!0 (select (arr!2277 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (_4!21 lt!129496)) (select (arr!2277 (_3!194 lt!129339)) (_4!21 lt!129496)) #b00000000000000000000000000000000 lt!129498))))

(declare-fun b!81385 () Bool)

(declare-fun res!67269 () Bool)

(assert (=> b!81385 (= res!67269 (= lt!129498 #b00000000000000000000000000000000))))

(assert (=> b!81385 (=> res!67269 e!53478)))

(declare-fun e!53477 () Bool)

(assert (=> b!81385 (= e!53477 e!53478)))

(declare-fun b!81386 () Bool)

(assert (=> b!81386 (= e!53476 e!53477)))

(declare-fun res!67271 () Bool)

(assert (=> b!81386 (= res!67271 call!1117)))

(assert (=> b!81386 (=> (not res!67271) (not e!53477))))

(declare-fun b!81387 () Bool)

(declare-fun e!53475 () Bool)

(assert (=> b!81387 (= e!53475 e!53476)))

(declare-fun c!5721 () Bool)

(assert (=> b!81387 (= c!5721 (= (_3!197 lt!129496) (_4!21 lt!129496)))))

(declare-fun b!81388 () Bool)

(declare-fun e!53479 () Bool)

(assert (=> b!81388 (= e!53479 e!53475)))

(declare-fun res!67272 () Bool)

(assert (=> b!81388 (=> (not res!67272) (not e!53475))))

(declare-fun e!53480 () Bool)

(assert (=> b!81388 (= res!67272 e!53480)))

(declare-fun res!67270 () Bool)

(assert (=> b!81388 (=> res!67270 e!53480)))

(assert (=> b!81388 (= res!67270 (bvsge (_1!3796 lt!129496) (_2!3796 lt!129496)))))

(assert (=> b!81388 (= lt!129498 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129497 () (_ BitVec 32))

(assert (=> b!81388 (= lt!129497 ((_ extract 31 0) (bvsrem lt!129347 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!81388 (= lt!129496 (arrayBitIndices!0 lt!129347 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!25426 () Bool)

(declare-fun res!67273 () Bool)

(assert (=> d!25426 (=> res!67273 e!53479)))

(assert (=> d!25426 (= res!67273 (bvsge lt!129347 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!25426 (= (arrayBitRangesEq!0 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!194 lt!129339) lt!129347 #b0000000000000000000000000000000000000000000000000000000000000000) e!53479)))

(declare-fun bm!1114 () Bool)

(assert (=> bm!1114 (= call!1117 (byteRangesEq!0 (select (arr!2277 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (_3!197 lt!129496)) (select (arr!2277 (_3!194 lt!129339)) (_3!197 lt!129496)) lt!129497 (ite c!5721 lt!129498 #b00000000000000000000000000001000)))))

(declare-fun b!81389 () Bool)

(assert (=> b!81389 (= e!53480 (arrayRangesEq!22 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!194 lt!129339) (_1!3796 lt!129496) (_2!3796 lt!129496)))))

(assert (= (and d!25426 (not res!67273)) b!81388))

(assert (= (and b!81388 (not res!67270)) b!81389))

(assert (= (and b!81388 res!67272) b!81387))

(assert (= (and b!81387 c!5721) b!81383))

(assert (= (and b!81387 (not c!5721)) b!81386))

(assert (= (and b!81386 res!67271) b!81385))

(assert (= (and b!81385 (not res!67269)) b!81384))

(assert (= (or b!81383 b!81386) bm!1114))

(declare-fun m!127405 () Bool)

(assert (=> b!81384 m!127405))

(declare-fun m!127407 () Bool)

(assert (=> b!81384 m!127407))

(assert (=> b!81384 m!127405))

(assert (=> b!81384 m!127407))

(declare-fun m!127409 () Bool)

(assert (=> b!81384 m!127409))

(declare-fun m!127411 () Bool)

(assert (=> b!81388 m!127411))

(declare-fun m!127413 () Bool)

(assert (=> bm!1114 m!127413))

(declare-fun m!127415 () Bool)

(assert (=> bm!1114 m!127415))

(assert (=> bm!1114 m!127413))

(assert (=> bm!1114 m!127415))

(declare-fun m!127417 () Bool)

(assert (=> bm!1114 m!127417))

(declare-fun m!127419 () Bool)

(assert (=> b!81389 m!127419))

(assert (=> b!81273 d!25426))

(declare-fun d!25428 () Bool)

(declare-fun e!53527 () Bool)

(assert (=> d!25428 e!53527))

(declare-fun res!67317 () Bool)

(assert (=> d!25428 (=> (not res!67317) (not e!53527))))

(declare-datatypes ((tuple2!7200 0))(
  ( (tuple2!7201 (_1!3800 Unit!5416) (_2!3800 BitStream!2872)) )
))
(declare-fun increaseBitIndex!0 (BitStream!2872) tuple2!7200)

(assert (=> d!25428 (= res!67317 (= (buf!2045 (_2!3800 (increaseBitIndex!0 thiss!1716))) (buf!2045 thiss!1716)))))

(declare-fun lt!129594 () Bool)

(assert (=> d!25428 (= lt!129594 (not (= (bvand ((_ sign_extend 24) (select (arr!2277 (buf!2045 thiss!1716)) (currentByte!3961 thiss!1716))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3956 thiss!1716)))) #b00000000000000000000000000000000)))))

(declare-fun lt!129597 () tuple2!7188)

(assert (=> d!25428 (= lt!129597 (tuple2!7189 (not (= (bvand ((_ sign_extend 24) (select (arr!2277 (buf!2045 thiss!1716)) (currentByte!3961 thiss!1716))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3956 thiss!1716)))) #b00000000000000000000000000000000)) (_2!3800 (increaseBitIndex!0 thiss!1716))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!25428 (validate_offset_bit!0 ((_ sign_extend 32) (size!1655 (buf!2045 thiss!1716))) ((_ sign_extend 32) (currentByte!3961 thiss!1716)) ((_ sign_extend 32) (currentBit!3956 thiss!1716)))))

(assert (=> d!25428 (= (readBit!0 thiss!1716) lt!129597)))

(declare-fun lt!129595 () (_ BitVec 64))

(declare-fun b!81445 () Bool)

(declare-fun lt!129596 () (_ BitVec 64))

(assert (=> b!81445 (= e!53527 (= (bitIndex!0 (size!1655 (buf!2045 (_2!3800 (increaseBitIndex!0 thiss!1716)))) (currentByte!3961 (_2!3800 (increaseBitIndex!0 thiss!1716))) (currentBit!3956 (_2!3800 (increaseBitIndex!0 thiss!1716)))) (bvadd lt!129595 lt!129596)))))

(assert (=> b!81445 (or (not (= (bvand lt!129595 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!129596 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!129595 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!129595 lt!129596) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!81445 (= lt!129596 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!81445 (= lt!129595 (bitIndex!0 (size!1655 (buf!2045 thiss!1716)) (currentByte!3961 thiss!1716) (currentBit!3956 thiss!1716)))))

(declare-fun lt!129598 () Bool)

(assert (=> b!81445 (= lt!129598 (not (= (bvand ((_ sign_extend 24) (select (arr!2277 (buf!2045 thiss!1716)) (currentByte!3961 thiss!1716))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3956 thiss!1716)))) #b00000000000000000000000000000000)))))

(declare-fun lt!129599 () Bool)

(assert (=> b!81445 (= lt!129599 (not (= (bvand ((_ sign_extend 24) (select (arr!2277 (buf!2045 thiss!1716)) (currentByte!3961 thiss!1716))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3956 thiss!1716)))) #b00000000000000000000000000000000)))))

(declare-fun lt!129600 () Bool)

(assert (=> b!81445 (= lt!129600 (not (= (bvand ((_ sign_extend 24) (select (arr!2277 (buf!2045 thiss!1716)) (currentByte!3961 thiss!1716))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3956 thiss!1716)))) #b00000000000000000000000000000000)))))

(assert (= (and d!25428 res!67317) b!81445))

(declare-fun m!127547 () Bool)

(assert (=> d!25428 m!127547))

(declare-fun m!127549 () Bool)

(assert (=> d!25428 m!127549))

(declare-fun m!127551 () Bool)

(assert (=> d!25428 m!127551))

(declare-fun m!127553 () Bool)

(assert (=> d!25428 m!127553))

(assert (=> b!81445 m!127547))

(declare-fun m!127555 () Bool)

(assert (=> b!81445 m!127555))

(assert (=> b!81445 m!127549))

(assert (=> b!81445 m!127551))

(assert (=> b!81445 m!127213))

(assert (=> b!81273 d!25428))

(declare-fun d!25454 () Bool)

(assert (=> d!25454 (arrayBitRangesEq!0 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!194 lt!129339) lt!129347 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129606 () Unit!5416)

(declare-fun choose!49 (array!3595 array!3595 array!3595 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5416)

(assert (=> d!25454 (= lt!129606 (choose!49 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!129366 (_3!194 lt!129339) lt!129347 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!25454 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!129347) (bvsle lt!129347 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!25454 (= (arrayBitRangesEqTransitive!0 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!129366 (_3!194 lt!129339) lt!129347 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!129606)))

(declare-fun bs!6227 () Bool)

(assert (= bs!6227 d!25454))

(assert (=> bs!6227 m!127197))

(declare-fun m!127559 () Bool)

(assert (=> bs!6227 m!127559))

(assert (=> b!81273 d!25454))

(declare-fun d!25458 () Bool)

(declare-fun e!53536 () Bool)

(assert (=> d!25458 e!53536))

(declare-fun res!67324 () Bool)

(assert (=> d!25458 (=> (not res!67324) (not e!53536))))

(declare-fun lt!129627 () (_ BitVec 64))

(declare-fun lt!129613 () tuple3!346)

(assert (=> d!25458 (= res!67324 (= (bvsub lt!129627 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!1655 (buf!2045 (_2!3787 lt!129613))) (currentByte!3961 (_2!3787 lt!129613)) (currentBit!3956 (_2!3787 lt!129613)))))))

(assert (=> d!25458 (or (= (bvand lt!129627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!129627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!129627 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!129642 () (_ BitVec 64))

(assert (=> d!25458 (= lt!129627 (bvadd lt!129642 nBits!516))))

(assert (=> d!25458 (or (not (= (bvand lt!129642 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!129642 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!129642 nBits!516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25458 (= lt!129642 (bitIndex!0 (size!1655 (buf!2045 (_2!3791 lt!129334))) (currentByte!3961 (_2!3791 lt!129334)) (currentBit!3956 (_2!3791 lt!129334))))))

(declare-fun e!53535 () tuple3!346)

(assert (=> d!25458 (= lt!129613 e!53535)))

(declare-fun c!5728 () Bool)

(assert (=> d!25458 (= c!5728 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!516))))

(assert (=> d!25458 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!25458 (= (readBitsLoop!0 (_2!3791 lt!129334) nBits!516 lt!129366 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!516) lt!129613)))

(declare-fun lt!129609 () tuple2!7188)

(declare-fun lt!129625 () (_ BitVec 32))

(declare-fun lt!129612 () (_ BitVec 64))

(declare-fun bm!1122 () Bool)

(declare-fun lt!129629 () (_ BitVec 32))

(declare-fun lt!129636 () array!3595)

(declare-fun lt!129615 () (_ BitVec 64))

(declare-fun call!1126 () Bool)

(declare-fun lt!129621 () array!3595)

(assert (=> bm!1122 (= call!1126 (arrayBitRangesEq!0 (ite c!5728 lt!129366 lt!129636) (ite c!5728 (array!3596 (store (arr!2277 lt!129366) lt!129629 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2277 lt!129366) lt!129629)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129625)))) ((_ sign_extend 24) (ite (_1!3791 lt!129609) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129625) #b00000000))))) (size!1655 lt!129366)) lt!129621) (ite c!5728 #b0000000000000000000000000000000000000000000000000000000000000000 lt!129612) (ite c!5728 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) lt!129615)))))

(declare-fun b!81448 () Bool)

(declare-fun e!53537 () Bool)

(assert (=> b!81448 (= e!53537 (= (bitAt!0 (_3!194 lt!129613) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)) (_2!3793 (readBitPure!0 (_2!3791 lt!129334)))))))

(declare-fun lt!129614 () tuple3!346)

(declare-fun e!53534 () Bool)

(declare-fun b!81449 () Bool)

(assert (=> b!81449 (= e!53534 (and (= (buf!2045 (_2!3791 lt!129334)) (buf!2045 (_2!3787 lt!129614))) (= (size!1655 lt!129366) (size!1655 (_3!194 lt!129614)))))))

(declare-fun b!81450 () Bool)

(declare-fun lt!129638 () Unit!5416)

(assert (=> b!81450 (= e!53535 (tuple3!347 lt!129638 (_2!3791 lt!129334) lt!129366))))

(declare-fun lt!129643 () Unit!5416)

(assert (=> b!81450 (= lt!129643 (arrayBitRangesEqReflexiveLemma!0 lt!129366))))

(declare-fun call!1125 () Bool)

(assert (=> b!81450 call!1125))

(declare-fun lt!129610 () Unit!5416)

(assert (=> b!81450 (= lt!129610 lt!129643)))

(assert (=> b!81450 (= lt!129636 lt!129366)))

(assert (=> b!81450 (= lt!129621 lt!129366)))

(declare-fun lt!129640 () (_ BitVec 64))

(assert (=> b!81450 (= lt!129640 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129644 () (_ BitVec 64))

(assert (=> b!81450 (= lt!129644 ((_ sign_extend 32) (size!1655 lt!129366)))))

(declare-fun lt!129635 () (_ BitVec 64))

(assert (=> b!81450 (= lt!129635 (bvmul lt!129644 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!81450 (= lt!129612 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!81450 (= lt!129615 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!81450 (= lt!129638 (arrayBitRangesEqSlicedLemma!0 lt!129636 lt!129621 lt!129640 lt!129635 lt!129612 lt!129615))))

(assert (=> b!81450 call!1126))

(declare-fun bm!1123 () Bool)

(assert (=> bm!1123 (= call!1125 (arrayBitRangesEq!0 lt!129366 (ite c!5728 (_3!194 lt!129614) lt!129366) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!5728 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvmul ((_ sign_extend 32) (size!1655 lt!129366)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!81451 () Bool)

(declare-fun res!67326 () Bool)

(assert (=> b!81451 (=> (not res!67326) (not e!53536))))

(assert (=> b!81451 (= res!67326 (invariant!0 (currentBit!3956 (_2!3787 lt!129613)) (currentByte!3961 (_2!3787 lt!129613)) (size!1655 (buf!2045 (_2!3787 lt!129613)))))))

(declare-fun b!81452 () Bool)

(declare-fun res!67323 () Bool)

(assert (=> b!81452 (=> (not res!67323) (not e!53536))))

(assert (=> b!81452 (= res!67323 (and (= (buf!2045 (_2!3791 lt!129334)) (buf!2045 (_2!3787 lt!129613))) (= (size!1655 lt!129366) (size!1655 (_3!194 lt!129613)))))))

(declare-fun b!81453 () Bool)

(declare-fun lt!129611 () Unit!5416)

(assert (=> b!81453 (= e!53535 (tuple3!347 lt!129611 (_2!3787 lt!129614) (_3!194 lt!129614)))))

(assert (=> b!81453 (= lt!129609 (readBit!0 (_2!3791 lt!129334)))))

(declare-fun lt!129620 () (_ BitVec 32))

(assert (=> b!81453 (= lt!129620 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129628 () (_ BitVec 32))

(assert (=> b!81453 (= lt!129628 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129641 () array!3595)

(assert (=> b!81453 (= lt!129641 (array!3596 (store (arr!2277 lt!129366) lt!129620 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2277 lt!129366) lt!129620)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129628)))) ((_ sign_extend 24) (ite (_1!3791 lt!129609) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129628) #b00000000))))) (size!1655 lt!129366)))))

(declare-fun lt!129637 () (_ BitVec 64))

(assert (=> b!81453 (= lt!129637 (bvsub nBits!516 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!129630 () (_ BitVec 64))

(assert (=> b!81453 (= lt!129630 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!129617 () Unit!5416)

(assert (=> b!81453 (= lt!129617 (validateOffsetBitsIneqLemma!0 (_2!3791 lt!129334) (_2!3791 lt!129609) lt!129637 lt!129630))))

(assert (=> b!81453 (validate_offset_bits!1 ((_ sign_extend 32) (size!1655 (buf!2045 (_2!3791 lt!129609)))) ((_ sign_extend 32) (currentByte!3961 (_2!3791 lt!129609))) ((_ sign_extend 32) (currentBit!3956 (_2!3791 lt!129609))) (bvsub lt!129637 lt!129630))))

(declare-fun lt!129618 () Unit!5416)

(assert (=> b!81453 (= lt!129618 lt!129617)))

(assert (=> b!81453 (= lt!129614 (readBitsLoop!0 (_2!3791 lt!129609) nBits!516 lt!129641 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!516))))

(declare-fun res!67320 () Bool)

(assert (=> b!81453 (= res!67320 (= (bvsub (bvadd (bitIndex!0 (size!1655 (buf!2045 (_2!3791 lt!129334))) (currentByte!3961 (_2!3791 lt!129334)) (currentBit!3956 (_2!3791 lt!129334))) nBits!516) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!1655 (buf!2045 (_2!3787 lt!129614))) (currentByte!3961 (_2!3787 lt!129614)) (currentBit!3956 (_2!3787 lt!129614)))))))

(assert (=> b!81453 (=> (not res!67320) (not e!53534))))

(assert (=> b!81453 e!53534))

(declare-fun lt!129623 () Unit!5416)

(declare-fun Unit!5438 () Unit!5416)

(assert (=> b!81453 (= lt!129623 Unit!5438)))

(assert (=> b!81453 (= lt!129629 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!81453 (= lt!129625 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129619 () Unit!5416)

(assert (=> b!81453 (= lt!129619 (arrayBitRangesUpdatedAtLemma!0 lt!129366 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (_1!3791 lt!129609)))))

(assert (=> b!81453 call!1126))

(declare-fun lt!129626 () Unit!5416)

(assert (=> b!81453 (= lt!129626 lt!129619)))

(declare-fun lt!129622 () (_ BitVec 64))

(assert (=> b!81453 (= lt!129622 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129634 () Unit!5416)

(assert (=> b!81453 (= lt!129634 (arrayBitRangesEqTransitive!0 lt!129366 lt!129641 (_3!194 lt!129614) lt!129622 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!81453 (arrayBitRangesEq!0 lt!129366 (_3!194 lt!129614) lt!129622 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!129624 () Unit!5416)

(assert (=> b!81453 (= lt!129624 lt!129634)))

(assert (=> b!81453 call!1125))

(declare-fun lt!129639 () Unit!5416)

(declare-fun Unit!5439 () Unit!5416)

(assert (=> b!81453 (= lt!129639 Unit!5439)))

(declare-fun lt!129632 () Unit!5416)

(assert (=> b!81453 (= lt!129632 (arrayBitRangesEqImpliesEq!0 lt!129641 (_3!194 lt!129614) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!81453 (= (bitAt!0 lt!129641 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 (_3!194 lt!129614) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!129616 () Unit!5416)

(assert (=> b!81453 (= lt!129616 lt!129632)))

(declare-fun lt!129633 () Unit!5416)

(declare-fun Unit!5440 () Unit!5416)

(assert (=> b!81453 (= lt!129633 Unit!5440)))

(declare-fun lt!129631 () Bool)

(assert (=> b!81453 (= lt!129631 (= (bitAt!0 (_3!194 lt!129614) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)) (_1!3791 lt!129609)))))

(declare-fun Unit!5441 () Unit!5416)

(assert (=> b!81453 (= lt!129611 Unit!5441)))

(assert (=> b!81453 lt!129631))

(declare-fun b!81454 () Bool)

(declare-fun res!67322 () Bool)

(assert (=> b!81454 (=> (not res!67322) (not e!53536))))

(assert (=> b!81454 (= res!67322 e!53537)))

(declare-fun res!67325 () Bool)

(assert (=> b!81454 (=> res!67325 e!53537)))

(assert (=> b!81454 (= res!67325 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!516)))))

(declare-fun b!81455 () Bool)

(declare-fun res!67321 () Bool)

(assert (=> b!81455 (=> (not res!67321) (not e!53536))))

(assert (=> b!81455 (= res!67321 (arrayBitRangesEq!0 lt!129366 (_3!194 lt!129613) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!81456 () Bool)

(assert (=> b!81456 (= e!53536 (= (byteArrayBitContentToList!0 (_2!3787 lt!129613) (_3!194 lt!129613) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!516 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001))) (bitStreamReadBitsIntoList!0 (_2!3787 lt!129613) (_2!3791 lt!129334) (bvsub nBits!516 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!81456 (or (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!516 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!81456 (or (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!516 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!25458 c!5728) b!81453))

(assert (= (and d!25458 (not c!5728)) b!81450))

(assert (= (and b!81453 res!67320) b!81449))

(assert (= (or b!81453 b!81450) bm!1123))

(assert (= (or b!81453 b!81450) bm!1122))

(assert (= (and d!25458 res!67324) b!81452))

(assert (= (and b!81452 res!67323) b!81455))

(assert (= (and b!81455 res!67321) b!81454))

(assert (= (and b!81454 (not res!67325)) b!81448))

(assert (= (and b!81454 res!67322) b!81451))

(assert (= (and b!81451 res!67326) b!81456))

(declare-fun m!127563 () Bool)

(assert (=> b!81456 m!127563))

(declare-fun m!127565 () Bool)

(assert (=> b!81456 m!127565))

(declare-fun m!127569 () Bool)

(assert (=> bm!1123 m!127569))

(declare-fun m!127573 () Bool)

(assert (=> bm!1122 m!127573))

(declare-fun m!127575 () Bool)

(assert (=> bm!1122 m!127575))

(declare-fun m!127579 () Bool)

(assert (=> bm!1122 m!127579))

(declare-fun m!127587 () Bool)

(assert (=> bm!1122 m!127587))

(declare-fun m!127589 () Bool)

(assert (=> b!81450 m!127589))

(declare-fun m!127591 () Bool)

(assert (=> b!81450 m!127591))

(declare-fun m!127595 () Bool)

(assert (=> b!81448 m!127595))

(declare-fun m!127597 () Bool)

(assert (=> b!81448 m!127597))

(declare-fun m!127599 () Bool)

(assert (=> b!81453 m!127599))

(declare-fun m!127601 () Bool)

(assert (=> b!81453 m!127601))

(declare-fun m!127603 () Bool)

(assert (=> b!81453 m!127603))

(declare-fun m!127605 () Bool)

(assert (=> b!81453 m!127605))

(declare-fun m!127607 () Bool)

(assert (=> b!81453 m!127607))

(declare-fun m!127609 () Bool)

(assert (=> b!81453 m!127609))

(declare-fun m!127611 () Bool)

(assert (=> b!81453 m!127611))

(declare-fun m!127613 () Bool)

(assert (=> b!81453 m!127613))

(declare-fun m!127615 () Bool)

(assert (=> b!81453 m!127615))

(declare-fun m!127617 () Bool)

(assert (=> b!81453 m!127617))

(declare-fun m!127619 () Bool)

(assert (=> b!81453 m!127619))

(declare-fun m!127621 () Bool)

(assert (=> b!81453 m!127621))

(declare-fun m!127623 () Bool)

(assert (=> b!81453 m!127623))

(declare-fun m!127625 () Bool)

(assert (=> b!81453 m!127625))

(declare-fun m!127627 () Bool)

(assert (=> b!81453 m!127627))

(declare-fun m!127629 () Bool)

(assert (=> b!81455 m!127629))

(declare-fun m!127631 () Bool)

(assert (=> d!25458 m!127631))

(assert (=> d!25458 m!127619))

(declare-fun m!127633 () Bool)

(assert (=> b!81451 m!127633))

(assert (=> b!81273 d!25458))

(declare-fun d!25464 () Bool)

(assert (=> d!25464 (= (bitAt!0 lt!129366 #b0000000000000000000000000000000000000000000000000000000000000000) (bitAt!0 (_3!194 lt!129339) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!129665 () Unit!5416)

(declare-fun choose!31 (array!3595 array!3595 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5416)

(assert (=> d!25464 (= lt!129665 (choose!31 lt!129366 (_3!194 lt!129339) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!25464 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!25464 (= (arrayBitRangesEqImpliesEq!0 lt!129366 (_3!194 lt!129339) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!129665)))

(declare-fun bs!6228 () Bool)

(assert (= bs!6228 d!25464))

(assert (=> bs!6228 m!127203))

(assert (=> bs!6228 m!127217))

(declare-fun m!127635 () Bool)

(assert (=> bs!6228 m!127635))

(assert (=> b!81273 d!25464))

(declare-fun d!25466 () Bool)

(assert (=> d!25466 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1655 (buf!2045 (_2!3791 lt!129334)))) ((_ sign_extend 32) (currentByte!3961 (_2!3791 lt!129334))) ((_ sign_extend 32) (currentBit!3956 (_2!3791 lt!129334))) (bvsub lt!129362 lt!129355)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1655 (buf!2045 (_2!3791 lt!129334)))) ((_ sign_extend 32) (currentByte!3961 (_2!3791 lt!129334))) ((_ sign_extend 32) (currentBit!3956 (_2!3791 lt!129334)))) (bvsub lt!129362 lt!129355)))))

(declare-fun bs!6229 () Bool)

(assert (= bs!6229 d!25466))

(declare-fun m!127637 () Bool)

(assert (=> bs!6229 m!127637))

(assert (=> b!81273 d!25466))

(declare-fun d!25468 () Bool)

(assert (=> d!25468 (= (bitAt!0 lt!129366 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand ((_ sign_extend 24) (select (arr!2277 lt!129366) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!6230 () Bool)

(assert (= bs!6230 d!25468))

(declare-fun m!127639 () Bool)

(assert (=> bs!6230 m!127639))

(assert (=> bs!6230 m!127337))

(assert (=> b!81273 d!25468))

(declare-fun d!25470 () Bool)

(assert (=> d!25470 (= (bitAt!0 (_3!194 lt!129339) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand ((_ sign_extend 24) (select (arr!2277 (_3!194 lt!129339)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!6231 () Bool)

(assert (= bs!6231 d!25470))

(declare-fun m!127641 () Bool)

(assert (=> bs!6231 m!127641))

(assert (=> bs!6231 m!127337))

(assert (=> b!81273 d!25470))

(declare-fun d!25472 () Bool)

(declare-fun e!53552 () Bool)

(assert (=> d!25472 e!53552))

(declare-fun res!67340 () Bool)

(assert (=> d!25472 (=> (not res!67340) (not e!53552))))

(assert (=> d!25472 (= res!67340 (or (= (bvand lt!129362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!129355 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!129362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!129362 lt!129355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!129685 () Unit!5416)

(declare-fun choose!27 (BitStream!2872 BitStream!2872 (_ BitVec 64) (_ BitVec 64)) Unit!5416)

(assert (=> d!25472 (= lt!129685 (choose!27 thiss!1716 (_2!3791 lt!129334) lt!129362 lt!129355))))

(assert (=> d!25472 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!129355) (bvsle lt!129355 lt!129362))))

(assert (=> d!25472 (= (validateOffsetBitsIneqLemma!0 thiss!1716 (_2!3791 lt!129334) lt!129362 lt!129355) lt!129685)))

(declare-fun b!81473 () Bool)

(assert (=> b!81473 (= e!53552 (validate_offset_bits!1 ((_ sign_extend 32) (size!1655 (buf!2045 (_2!3791 lt!129334)))) ((_ sign_extend 32) (currentByte!3961 (_2!3791 lt!129334))) ((_ sign_extend 32) (currentBit!3956 (_2!3791 lt!129334))) (bvsub lt!129362 lt!129355)))))

(assert (= (and d!25472 res!67340) b!81473))

(declare-fun m!127653 () Bool)

(assert (=> d!25472 m!127653))

(assert (=> b!81473 m!127209))

(assert (=> b!81273 d!25472))

(assert (=> b!81273 d!25420))

(declare-fun d!25476 () Bool)

(declare-fun e!53567 () Bool)

(assert (=> d!25476 e!53567))

(declare-fun res!67352 () Bool)

(assert (=> d!25476 (=> (not res!67352) (not e!53567))))

(declare-fun lt!129708 () (_ BitVec 32))

(assert (=> d!25476 (= res!67352 (and (bvsge lt!129708 #b00000000000000000000000000000000) (bvslt lt!129708 (size!1655 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))))))

(declare-fun lt!129706 () Unit!5416)

(declare-fun lt!129705 () (_ BitVec 8))

(declare-fun lt!129707 () (_ BitVec 32))

(declare-fun choose!53 (array!3595 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!5416)

(assert (=> d!25476 (= lt!129706 (choose!53 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (_1!3791 lt!129334) lt!129708 lt!129707 lt!129705))))

(assert (=> d!25476 (= lt!129705 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2277 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129708)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129707)))) ((_ sign_extend 24) (ite (_1!3791 lt!129334) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129707) #b00000000)))))))

(assert (=> d!25476 (= lt!129707 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!25476 (= lt!129708 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!25476 (= (arrayBitRangesUpdatedAtLemma!0 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (_1!3791 lt!129334)) lt!129706)))

(declare-fun b!81488 () Bool)

(assert (=> b!81488 (= e!53567 (arrayBitRangesEq!0 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (array!3596 (store (arr!2277 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129708 lt!129705) (size!1655 (array!3596 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!25476 res!67352) b!81488))

(declare-fun m!127687 () Bool)

(assert (=> d!25476 m!127687))

(declare-fun m!127689 () Bool)

(assert (=> d!25476 m!127689))

(declare-fun m!127691 () Bool)

(assert (=> d!25476 m!127691))

(declare-fun m!127693 () Bool)

(assert (=> b!81488 m!127693))

(declare-fun m!127695 () Bool)

(assert (=> b!81488 m!127695))

(assert (=> b!81273 d!25476))

(push 1)

(assert (not b!81357))

(assert (not d!25458))

(assert (not b!81314))

(assert (not bm!1122))

(assert (not bm!1108))

(assert (not b!81384))

(assert (not d!25466))

(assert (not d!25464))

(assert (not bm!1107))

(assert (not b!81353))

(assert (not b!81318))

(assert (not d!25454))

(assert (not b!81473))

(assert (not bm!1114))

(assert (not b!81451))

(assert (not b!81456))

(assert (not b!81350))

(assert (not d!25476))

(assert (not b!81351))

(assert (not bm!1111))

(assert (not d!25376))

(assert (not b!81448))

(assert (not b!81450))

(assert (not b!81319))

(assert (not d!25420))

(assert (not b!81445))

(assert (not b!81388))

(assert (not b!81389))

(assert (not b!81312))

(assert (not b!81488))

(assert (not b!81311))

(assert (not b!81288))

(assert (not b!81358))

(assert (not bm!1123))

(assert (not b!81453))

(assert (not b!81455))

(assert (not b!81307))

(assert (not d!25424))

(assert (not d!25400))

(assert (not d!25472))

(assert (not d!25374))

(assert (not d!25428))

(assert (not b!81325))

(assert (not b!81349))

(assert (not d!25404))

(check-sat)

(pop 1)

(push 1)

(check-sat)

