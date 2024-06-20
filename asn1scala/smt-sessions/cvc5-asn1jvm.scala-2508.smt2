; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63394 () Bool)

(assert start!63394)

(declare-fun res!235058 () Bool)

(declare-fun e!202565 () Bool)

(assert (=> start!63394 (=> (not res!235058) (not e!202565))))

(declare-datatypes ((array!16495 0))(
  ( (array!16496 (arr!8119 (Array (_ BitVec 32) (_ BitVec 8))) (size!7123 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12616 0))(
  ( (BitStream!12617 (buf!7369 array!16495) (currentByte!13646 (_ BitVec 32)) (currentBit!13641 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12616)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63394 (= res!235058 (validate_offset_bits!1 ((_ sign_extend 32) (size!7123 (buf!7369 thiss!1939))) ((_ sign_extend 32) (currentByte!13646 thiss!1939)) ((_ sign_extend 32) (currentBit!13641 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13646 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13641 thiss!1939))) #b00000000000000000000000000001111))))))

(assert (=> start!63394 e!202565))

(declare-fun e!202566 () Bool)

(declare-fun inv!12 (BitStream!12616) Bool)

(assert (=> start!63394 (and (inv!12 thiss!1939) e!202566)))

(declare-fun b!283643 () Bool)

(declare-datatypes ((Unit!19847 0))(
  ( (Unit!19848) )
))
(declare-datatypes ((tuple2!22590 0))(
  ( (tuple2!22591 (_1!12489 Unit!19847) (_2!12489 BitStream!12616)) )
))
(declare-fun lt!417978 () tuple2!22590)

(assert (=> b!283643 (= e!202565 (not (inv!12 (BitStream!12617 (buf!7369 (_2!12489 lt!417978)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13646 (_2!12489 lt!417978))) #b00000000000000000000000000000010)) (currentBit!13641 (_2!12489 lt!417978))))))))

(declare-fun alignToByte!0 (BitStream!12616) tuple2!22590)

(assert (=> b!283643 (= lt!417978 (alignToByte!0 thiss!1939))))

(declare-fun b!283644 () Bool)

(declare-fun array_inv!6816 (array!16495) Bool)

(assert (=> b!283644 (= e!202566 (array_inv!6816 (buf!7369 thiss!1939)))))

(assert (= (and start!63394 res!235058) b!283643))

(assert (= start!63394 b!283644))

(declare-fun m!416707 () Bool)

(assert (=> start!63394 m!416707))

(declare-fun m!416709 () Bool)

(assert (=> start!63394 m!416709))

(declare-fun m!416711 () Bool)

(assert (=> b!283643 m!416711))

(declare-fun m!416713 () Bool)

(assert (=> b!283643 m!416713))

(declare-fun m!416715 () Bool)

(assert (=> b!283644 m!416715))

(push 1)

(assert (not start!63394))

(assert (not b!283644))

(assert (not b!283643))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97372 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97372 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7123 (buf!7369 thiss!1939))) ((_ sign_extend 32) (currentByte!13646 thiss!1939)) ((_ sign_extend 32) (currentBit!13641 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13646 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13641 thiss!1939))) #b00000000000000000000000000001111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7123 (buf!7369 thiss!1939))) ((_ sign_extend 32) (currentByte!13646 thiss!1939)) ((_ sign_extend 32) (currentBit!13641 thiss!1939))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13646 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13641 thiss!1939))) #b00000000000000000000000000001111))))))

(declare-fun bs!24585 () Bool)

(assert (= bs!24585 d!97372))

(declare-fun m!416737 () Bool)

(assert (=> bs!24585 m!416737))

(assert (=> start!63394 d!97372))

(declare-fun d!97374 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97374 (= (inv!12 thiss!1939) (invariant!0 (currentBit!13641 thiss!1939) (currentByte!13646 thiss!1939) (size!7123 (buf!7369 thiss!1939))))))

(declare-fun bs!24586 () Bool)

(assert (= bs!24586 d!97374))

(declare-fun m!416739 () Bool)

(assert (=> bs!24586 m!416739))

(assert (=> start!63394 d!97374))

(declare-fun d!97376 () Bool)

(assert (=> d!97376 (= (array_inv!6816 (buf!7369 thiss!1939)) (bvsge (size!7123 (buf!7369 thiss!1939)) #b00000000000000000000000000000000))))

(assert (=> b!283644 d!97376))

(declare-fun d!97382 () Bool)

(assert (=> d!97382 (= (inv!12 (BitStream!12617 (buf!7369 (_2!12489 lt!417978)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13646 (_2!12489 lt!417978))) #b00000000000000000000000000000010)) (currentBit!13641 (_2!12489 lt!417978)))) (invariant!0 (currentBit!13641 (BitStream!12617 (buf!7369 (_2!12489 lt!417978)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13646 (_2!12489 lt!417978))) #b00000000000000000000000000000010)) (currentBit!13641 (_2!12489 lt!417978)))) (currentByte!13646 (BitStream!12617 (buf!7369 (_2!12489 lt!417978)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13646 (_2!12489 lt!417978))) #b00000000000000000000000000000010)) (currentBit!13641 (_2!12489 lt!417978)))) (size!7123 (buf!7369 (BitStream!12617 (buf!7369 (_2!12489 lt!417978)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13646 (_2!12489 lt!417978))) #b00000000000000000000000000000010)) (currentBit!13641 (_2!12489 lt!417978)))))))))

(declare-fun bs!24588 () Bool)

(assert (= bs!24588 d!97382))

(declare-fun m!416743 () Bool)

(assert (=> bs!24588 m!416743))

(assert (=> b!283643 d!97382))

(declare-fun d!97384 () Bool)

(declare-fun e!202594 () Bool)

(assert (=> d!97384 e!202594))

(declare-fun res!235074 () Bool)

(assert (=> d!97384 (=> (not res!235074) (not e!202594))))

(assert (=> d!97384 (= res!235074 (validate_offset_bits!1 ((_ sign_extend 32) (size!7123 (buf!7369 thiss!1939))) ((_ sign_extend 32) (currentByte!13646 thiss!1939)) ((_ sign_extend 32) (currentBit!13641 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13641 thiss!1939)) #b00000000000000000000000000000111))))))

(declare-fun Unit!19853 () Unit!19847)

(declare-fun Unit!19854 () Unit!19847)

(assert (=> d!97384 (= (alignToByte!0 thiss!1939) (ite (not (= (currentBit!13641 thiss!1939) #b00000000000000000000000000000000)) (tuple2!22591 Unit!19853 (BitStream!12617 (buf!7369 thiss!1939) (bvadd (currentByte!13646 thiss!1939) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!22591 Unit!19854 thiss!1939)))))

(declare-fun b!283665 () Bool)

(declare-fun e!202593 () Bool)

(assert (=> b!283665 (= e!202594 e!202593)))

(declare-fun res!235073 () Bool)

(assert (=> b!283665 (=> (not res!235073) (not e!202593))))

(declare-fun lt!417999 () tuple2!22590)

(assert (=> b!283665 (= res!235073 (= (buf!7369 (_2!12489 lt!417999)) (buf!7369 thiss!1939)))))

(declare-fun Unit!19855 () Unit!19847)

(declare-fun Unit!19856 () Unit!19847)

(assert (=> b!283665 (= lt!417999 (ite (not (= (currentBit!13641 thiss!1939) #b00000000000000000000000000000000)) (tuple2!22591 Unit!19855 (BitStream!12617 (buf!7369 thiss!1939) (bvadd (currentByte!13646 thiss!1939) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!22591 Unit!19856 thiss!1939)))))

(declare-fun lt!417997 () (_ BitVec 64))

(declare-fun b!283666 () Bool)

(declare-fun lt!417998 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!283666 (= e!202593 (bvsle (bitIndex!0 (size!7123 (buf!7369 (_2!12489 lt!417999))) (currentByte!13646 (_2!12489 lt!417999)) (currentBit!13641 (_2!12489 lt!417999))) (bvadd lt!417997 lt!417998)))))

(assert (=> b!283666 (or (not (= (bvand lt!417997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!417998 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!417997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!417997 lt!417998) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!283666 (= lt!417998 #b0000000000000000000000000000000000000000000000000000000000000111)))

(assert (=> b!283666 (= lt!417997 (bitIndex!0 (size!7123 (buf!7369 thiss!1939)) (currentByte!13646 thiss!1939) (currentBit!13641 thiss!1939)))))

(assert (= (and d!97384 res!235074) b!283665))

(assert (= (and b!283665 res!235073) b!283666))

(declare-fun m!416747 () Bool)

(assert (=> d!97384 m!416747))

(declare-fun m!416749 () Bool)

(assert (=> b!283666 m!416749))

(declare-fun m!416751 () Bool)

(assert (=> b!283666 m!416751))

(assert (=> b!283643 d!97384))

(push 1)

(assert (not d!97372))

(assert (not d!97374))

(assert (not d!97382))

(assert (not b!283666))

(assert (not d!97384))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97400 () Bool)

(assert (=> d!97400 (= (invariant!0 (currentBit!13641 thiss!1939) (currentByte!13646 thiss!1939) (size!7123 (buf!7369 thiss!1939))) (and (bvsge (currentBit!13641 thiss!1939) #b00000000000000000000000000000000) (bvslt (currentBit!13641 thiss!1939) #b00000000000000000000000000001000) (bvsge (currentByte!13646 thiss!1939) #b00000000000000000000000000000000) (or (bvslt (currentByte!13646 thiss!1939) (size!7123 (buf!7369 thiss!1939))) (and (= (currentBit!13641 thiss!1939) #b00000000000000000000000000000000) (= (currentByte!13646 thiss!1939) (size!7123 (buf!7369 thiss!1939)))))))))

(assert (=> d!97374 d!97400))

(declare-fun d!97402 () Bool)

(assert (=> d!97402 (= (remainingBits!0 ((_ sign_extend 32) (size!7123 (buf!7369 thiss!1939))) ((_ sign_extend 32) (currentByte!13646 thiss!1939)) ((_ sign_extend 32) (currentBit!13641 thiss!1939))) (bvsub (bvmul ((_ sign_extend 32) (size!7123 (buf!7369 thiss!1939))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13646 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13641 thiss!1939)))))))

(assert (=> d!97372 d!97402))

(declare-fun d!97404 () Bool)

(assert (=> d!97404 (= (invariant!0 (currentBit!13641 (BitStream!12617 (buf!7369 (_2!12489 lt!417978)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13646 (_2!12489 lt!417978))) #b00000000000000000000000000000010)) (currentBit!13641 (_2!12489 lt!417978)))) (currentByte!13646 (BitStream!12617 (buf!7369 (_2!12489 lt!417978)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13646 (_2!12489 lt!417978))) #b00000000000000000000000000000010)) (currentBit!13641 (_2!12489 lt!417978)))) (size!7123 (buf!7369 (BitStream!12617 (buf!7369 (_2!12489 lt!417978)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13646 (_2!12489 lt!417978))) #b00000000000000000000000000000010)) (currentBit!13641 (_2!12489 lt!417978)))))) (and (bvsge (currentBit!13641 (BitStream!12617 (buf!7369 (_2!12489 lt!417978)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13646 (_2!12489 lt!417978))) #b00000000000000000000000000000010)) (currentBit!13641 (_2!12489 lt!417978)))) #b00000000000000000000000000000000) (bvslt (currentBit!13641 (BitStream!12617 (buf!7369 (_2!12489 lt!417978)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13646 (_2!12489 lt!417978))) #b00000000000000000000000000000010)) (currentBit!13641 (_2!12489 lt!417978)))) #b00000000000000000000000000001000) (bvsge (currentByte!13646 (BitStream!12617 (buf!7369 (_2!12489 lt!417978)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13646 (_2!12489 lt!417978))) #b00000000000000000000000000000010)) (currentBit!13641 (_2!12489 lt!417978)))) #b00000000000000000000000000000000) (or (bvslt (currentByte!13646 (BitStream!12617 (buf!7369 (_2!12489 lt!417978)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13646 (_2!12489 lt!417978))) #b00000000000000000000000000000010)) (currentBit!13641 (_2!12489 lt!417978)))) (size!7123 (buf!7369 (BitStream!12617 (buf!7369 (_2!12489 lt!417978)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13646 (_2!12489 lt!417978))) #b00000000000000000000000000000010)) (currentBit!13641 (_2!12489 lt!417978)))))) (and (= (currentBit!13641 (BitStream!12617 (buf!7369 (_2!12489 lt!417978)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13646 (_2!12489 lt!417978))) #b00000000000000000000000000000010)) (currentBit!13641 (_2!12489 lt!417978)))) #b00000000000000000000000000000000) (= (currentByte!13646 (BitStream!12617 (buf!7369 (_2!12489 lt!417978)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13646 (_2!12489 lt!417978))) #b00000000000000000000000000000010)) (currentBit!13641 (_2!12489 lt!417978)))) (size!7123 (buf!7369 (BitStream!12617 (buf!7369 (_2!12489 lt!417978)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13646 (_2!12489 lt!417978))) #b00000000000000000000000000000010)) (currentBit!13641 (_2!12489 lt!417978))))))))))))

(assert (=> d!97382 d!97404))

(declare-fun d!97408 () Bool)

(assert (=> d!97408 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7123 (buf!7369 thiss!1939))) ((_ sign_extend 32) (currentByte!13646 thiss!1939)) ((_ sign_extend 32) (currentBit!13641 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13641 thiss!1939)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7123 (buf!7369 thiss!1939))) ((_ sign_extend 32) (currentByte!13646 thiss!1939)) ((_ sign_extend 32) (currentBit!13641 thiss!1939))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13641 thiss!1939)) #b00000000000000000000000000000111))))))

(declare-fun bs!24595 () Bool)

(assert (= bs!24595 d!97408))

(assert (=> bs!24595 m!416737))

(assert (=> d!97384 d!97408))

(declare-fun d!97412 () Bool)

(declare-fun e!202605 () Bool)

(assert (=> d!97412 e!202605))

(declare-fun res!235087 () Bool)

(assert (=> d!97412 (=> (not res!235087) (not e!202605))))

(declare-fun lt!418024 () (_ BitVec 64))

(declare-fun lt!418026 () (_ BitVec 64))

(declare-fun lt!418027 () (_ BitVec 64))

(assert (=> d!97412 (= res!235087 (= lt!418024 (bvsub lt!418027 lt!418026)))))

(assert (=> d!97412 (or (= (bvand lt!418027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418026 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418027 lt!418026) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97412 (= lt!418026 (remainingBits!0 ((_ sign_extend 32) (size!7123 (buf!7369 (_2!12489 lt!417999)))) ((_ sign_extend 32) (currentByte!13646 (_2!12489 lt!417999))) ((_ sign_extend 32) (currentBit!13641 (_2!12489 lt!417999)))))))

(declare-fun lt!418029 () (_ BitVec 64))

(declare-fun lt!418025 () (_ BitVec 64))

(assert (=> d!97412 (= lt!418027 (bvmul lt!418029 lt!418025))))

(assert (=> d!97412 (or (= lt!418029 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418025 (bvsdiv (bvmul lt!418029 lt!418025) lt!418029)))))

(assert (=> d!97412 (= lt!418025 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97412 (= lt!418029 ((_ sign_extend 32) (size!7123 (buf!7369 (_2!12489 lt!417999)))))))

(assert (=> d!97412 (= lt!418024 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13646 (_2!12489 lt!417999))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13641 (_2!12489 lt!417999)))))))

(assert (=> d!97412 (invariant!0 (currentBit!13641 (_2!12489 lt!417999)) (currentByte!13646 (_2!12489 lt!417999)) (size!7123 (buf!7369 (_2!12489 lt!417999))))))

(assert (=> d!97412 (= (bitIndex!0 (size!7123 (buf!7369 (_2!12489 lt!417999))) (currentByte!13646 (_2!12489 lt!417999)) (currentBit!13641 (_2!12489 lt!417999))) lt!418024)))

(declare-fun b!283679 () Bool)

(declare-fun res!235088 () Bool)

(assert (=> b!283679 (=> (not res!235088) (not e!202605))))

(assert (=> b!283679 (= res!235088 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418024))))

(declare-fun b!283680 () Bool)

(declare-fun lt!418028 () (_ BitVec 64))

(assert (=> b!283680 (= e!202605 (bvsle lt!418024 (bvmul lt!418028 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!283680 (or (= lt!418028 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418028 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418028)))))

(assert (=> b!283680 (= lt!418028 ((_ sign_extend 32) (size!7123 (buf!7369 (_2!12489 lt!417999)))))))

(assert (= (and d!97412 res!235087) b!283679))

(assert (= (and b!283679 res!235088) b!283680))

(declare-fun m!416773 () Bool)

(assert (=> d!97412 m!416773))

(declare-fun m!416775 () Bool)

(assert (=> d!97412 m!416775))

(assert (=> b!283666 d!97412))

(declare-fun d!97426 () Bool)

(declare-fun e!202606 () Bool)

(assert (=> d!97426 e!202606))

(declare-fun res!235089 () Bool)

(assert (=> d!97426 (=> (not res!235089) (not e!202606))))

(declare-fun lt!418030 () (_ BitVec 64))

(declare-fun lt!418033 () (_ BitVec 64))

(declare-fun lt!418032 () (_ BitVec 64))

(assert (=> d!97426 (= res!235089 (= lt!418030 (bvsub lt!418033 lt!418032)))))

(assert (=> d!97426 (or (= (bvand lt!418033 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418032 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418033 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418033 lt!418032) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97426 (= lt!418032 (remainingBits!0 ((_ sign_extend 32) (size!7123 (buf!7369 thiss!1939))) ((_ sign_extend 32) (currentByte!13646 thiss!1939)) ((_ sign_extend 32) (currentBit!13641 thiss!1939))))))

(declare-fun lt!418035 () (_ BitVec 64))

(declare-fun lt!418031 () (_ BitVec 64))

(assert (=> d!97426 (= lt!418033 (bvmul lt!418035 lt!418031))))

(assert (=> d!97426 (or (= lt!418035 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418031 (bvsdiv (bvmul lt!418035 lt!418031) lt!418035)))))

(assert (=> d!97426 (= lt!418031 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97426 (= lt!418035 ((_ sign_extend 32) (size!7123 (buf!7369 thiss!1939))))))

(assert (=> d!97426 (= lt!418030 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13646 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13641 thiss!1939))))))

(assert (=> d!97426 (invariant!0 (currentBit!13641 thiss!1939) (currentByte!13646 thiss!1939) (size!7123 (buf!7369 thiss!1939)))))

(assert (=> d!97426 (= (bitIndex!0 (size!7123 (buf!7369 thiss!1939)) (currentByte!13646 thiss!1939) (currentBit!13641 thiss!1939)) lt!418030)))

(declare-fun b!283681 () Bool)

(declare-fun res!235090 () Bool)

(assert (=> b!283681 (=> (not res!235090) (not e!202606))))

(assert (=> b!283681 (= res!235090 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418030))))

(declare-fun b!283682 () Bool)

(declare-fun lt!418034 () (_ BitVec 64))

(assert (=> b!283682 (= e!202606 (bvsle lt!418030 (bvmul lt!418034 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!283682 (or (= lt!418034 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418034 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418034)))))

(assert (=> b!283682 (= lt!418034 ((_ sign_extend 32) (size!7123 (buf!7369 thiss!1939))))))

(assert (= (and d!97426 res!235089) b!283681))

(assert (= (and b!283681 res!235090) b!283682))

(assert (=> d!97426 m!416737))

(assert (=> d!97426 m!416739))

(assert (=> b!283666 d!97426))

(push 1)

(assert (not d!97426))

(assert (not d!97408))

(assert (not d!97412))

(check-sat)

(pop 1)

(push 1)

(check-sat)

