; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15804 () Bool)

(assert start!15804)

(declare-fun b!79738 () Bool)

(declare-fun e!52396 () Bool)

(declare-fun e!52395 () Bool)

(assert (=> b!79738 (= e!52396 e!52395)))

(declare-fun res!65995 () Bool)

(assert (=> b!79738 (=> (not res!65995) (not e!52395))))

(declare-datatypes ((array!3443 0))(
  ( (array!3444 (arr!2192 (Array (_ BitVec 32) (_ BitVec 8))) (size!1588 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2738 0))(
  ( (BitStream!2739 (buf!1978 array!3443) (currentByte!3864 (_ BitVec 32)) (currentBit!3859 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5243 0))(
  ( (Unit!5244) )
))
(declare-datatypes ((tuple3!242 0))(
  ( (tuple3!243 (_1!3701 Unit!5243) (_2!3701 BitStream!2738) (_3!142 array!3443)) )
))
(declare-fun lt!126705 () tuple3!242)

(declare-fun thiss!1716 () BitStream!2738)

(assert (=> b!79738 (= res!65995 (= (buf!1978 (_2!3701 lt!126705)) (buf!1978 thiss!1716)))))

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!2738 (_ BitVec 64) array!3443 (_ BitVec 64) (_ BitVec 64)) tuple3!242)

(assert (=> b!79738 (= lt!126705 (readBitsLoop!0 thiss!1716 nBits!516 (array!3444 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(declare-fun b!79739 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!79739 (= e!52395 (not (invariant!0 (currentBit!3859 (_2!3701 lt!126705)) (currentByte!3864 (_2!3701 lt!126705)) (size!1588 (buf!1978 (_2!3701 lt!126705))))))))

(declare-fun b!79737 () Bool)

(declare-fun res!65994 () Bool)

(assert (=> b!79737 (=> (not res!65994) (not e!52396))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79737 (= res!65994 (validate_offset_bits!1 ((_ sign_extend 32) (size!1588 (buf!1978 thiss!1716))) ((_ sign_extend 32) (currentByte!3864 thiss!1716)) ((_ sign_extend 32) (currentBit!3859 thiss!1716)) nBits!516))))

(declare-fun b!79740 () Bool)

(declare-fun e!52398 () Bool)

(declare-fun array_inv!1434 (array!3443) Bool)

(assert (=> b!79740 (= e!52398 (array_inv!1434 (buf!1978 thiss!1716)))))

(declare-fun res!65993 () Bool)

(assert (=> start!15804 (=> (not res!65993) (not e!52396))))

(assert (=> start!15804 (= res!65993 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15804 e!52396))

(assert (=> start!15804 true))

(declare-fun inv!12 (BitStream!2738) Bool)

(assert (=> start!15804 (and (inv!12 thiss!1716) e!52398)))

(assert (= (and start!15804 res!65993) b!79737))

(assert (= (and b!79737 res!65994) b!79738))

(assert (= (and b!79738 res!65995) b!79739))

(assert (= start!15804 b!79740))

(declare-fun m!125213 () Bool)

(assert (=> start!15804 m!125213))

(declare-fun m!125215 () Bool)

(assert (=> b!79737 m!125215))

(declare-fun m!125217 () Bool)

(assert (=> b!79740 m!125217))

(declare-fun m!125219 () Bool)

(assert (=> b!79738 m!125219))

(declare-fun m!125221 () Bool)

(assert (=> b!79739 m!125221))

(push 1)

(assert (not b!79739))

(assert (not start!15804))

(assert (not b!79737))

(assert (not b!79738))

(assert (not b!79740))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!25142 () Bool)

(assert (=> d!25142 (= (inv!12 thiss!1716) (invariant!0 (currentBit!3859 thiss!1716) (currentByte!3864 thiss!1716) (size!1588 (buf!1978 thiss!1716))))))

(declare-fun bs!6107 () Bool)

(assert (= bs!6107 d!25142))

(declare-fun m!125227 () Bool)

(assert (=> bs!6107 m!125227))

(assert (=> start!15804 d!25142))

(declare-fun d!25144 () Bool)

(assert (=> d!25144 (= (array_inv!1434 (buf!1978 thiss!1716)) (bvsge (size!1588 (buf!1978 thiss!1716)) #b00000000000000000000000000000000))))

(assert (=> b!79740 d!25144))

(declare-fun d!25146 () Bool)

(assert (=> d!25146 (= (invariant!0 (currentBit!3859 (_2!3701 lt!126705)) (currentByte!3864 (_2!3701 lt!126705)) (size!1588 (buf!1978 (_2!3701 lt!126705)))) (and (bvsge (currentBit!3859 (_2!3701 lt!126705)) #b00000000000000000000000000000000) (bvslt (currentBit!3859 (_2!3701 lt!126705)) #b00000000000000000000000000001000) (bvsge (currentByte!3864 (_2!3701 lt!126705)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3864 (_2!3701 lt!126705)) (size!1588 (buf!1978 (_2!3701 lt!126705)))) (and (= (currentBit!3859 (_2!3701 lt!126705)) #b00000000000000000000000000000000) (= (currentByte!3864 (_2!3701 lt!126705)) (size!1588 (buf!1978 (_2!3701 lt!126705))))))))))

(assert (=> b!79739 d!25146))

(declare-fun b!79813 () Bool)

(declare-fun res!66055 () Bool)

(declare-fun e!52434 () Bool)

(assert (=> b!79813 (=> (not res!66055) (not e!52434))))

(declare-fun lt!126995 () tuple3!242)

(assert (=> b!79813 (= res!66055 (invariant!0 (currentBit!3859 (_2!3701 lt!126995)) (currentByte!3864 (_2!3701 lt!126995)) (size!1588 (buf!1978 (_2!3701 lt!126995)))))))

(declare-fun b!79814 () Bool)

(declare-fun res!66052 () Bool)

(assert (=> b!79814 (=> (not res!66052) (not e!52434))))

(declare-fun arrayBitRangesEq!0 (array!3443 array!3443 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79814 (= res!66052 (arrayBitRangesEq!0 (array!3444 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!142 lt!126995) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!79815 () Bool)

(declare-datatypes ((List!794 0))(
  ( (Nil!791) (Cons!790 (h!909 Bool) (t!1544 List!794)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2738 array!3443 (_ BitVec 64) (_ BitVec 64)) List!794)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2738 BitStream!2738 (_ BitVec 64)) List!794)

(assert (=> b!79815 (= e!52434 (= (byteArrayBitContentToList!0 (_2!3701 lt!126995) (_3!142 lt!126995) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000)) (bitStreamReadBitsIntoList!0 (_2!3701 lt!126995) thiss!1716 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!79815 (or (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!79815 (or (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!79816 () Bool)

(declare-fun res!66053 () Bool)

(assert (=> b!79816 (=> (not res!66053) (not e!52434))))

(assert (=> b!79816 (= res!66053 (and (= (buf!1978 thiss!1716) (buf!1978 (_2!3701 lt!126995))) (= (size!1588 (array!3444 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!1588 (_3!142 lt!126995)))))))

(declare-fun d!25148 () Bool)

(assert (=> d!25148 e!52434))

(declare-fun res!66054 () Bool)

(assert (=> d!25148 (=> (not res!66054) (not e!52434))))

(declare-fun lt!127005 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!25148 (= res!66054 (= (bvsub lt!127005 #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!1588 (buf!1978 (_2!3701 lt!126995))) (currentByte!3864 (_2!3701 lt!126995)) (currentBit!3859 (_2!3701 lt!126995)))))))

(assert (=> d!25148 (or (= (bvand lt!127005 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!127005 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!127005 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!127012 () (_ BitVec 64))

(assert (=> d!25148 (= lt!127005 (bvadd lt!127012 nBits!516))))

(assert (=> d!25148 (or (not (= (bvand lt!127012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!127012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!127012 nBits!516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25148 (= lt!127012 (bitIndex!0 (size!1588 (buf!1978 thiss!1716)) (currentByte!3864 thiss!1716) (currentBit!3859 thiss!1716)))))

(declare-fun e!52431 () tuple3!242)

(assert (=> d!25148 (= lt!126995 e!52431)))

(declare-fun c!5648 () Bool)

(assert (=> d!25148 (= c!5648 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> d!25148 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!25148 (= (readBitsLoop!0 thiss!1716 nBits!516 (array!3444 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) lt!126995)))

(declare-fun call!999 () Bool)

(declare-fun lt!127013 () (_ BitVec 32))

(declare-datatypes ((tuple2!7126 0))(
  ( (tuple2!7127 (_1!3706 Bool) (_2!3706 BitStream!2738)) )
))
(declare-fun lt!127009 () tuple2!7126)

(declare-fun bm!995 () Bool)

(declare-fun lt!127020 () (_ BitVec 32))

(assert (=> bm!995 (= call!999 (arrayBitRangesEq!0 (array!3444 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (ite c!5648 (array!3444 (store (arr!2192 (array!3444 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!127013 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2192 (array!3444 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!127013)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!127020)))) ((_ sign_extend 24) (ite (_1!3706 lt!127009) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!127020) #b00000000))))) (size!1588 (array!3444 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) (array!3444 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!5648 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!1588 (array!3444 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!79817 () Bool)

(declare-fun lt!126999 () Unit!5243)

(assert (=> b!79817 (= e!52431 (tuple3!243 lt!126999 thiss!1716 (array!3444 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-fun lt!127002 () Unit!5243)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!3443) Unit!5243)

(assert (=> b!79817 (= lt!127002 (arrayBitRangesEqReflexiveLemma!0 (array!3444 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(assert (=> b!79817 call!999))

(declare-fun lt!127024 () Unit!5243)

(assert (=> b!79817 (= lt!127024 lt!127002)))

(declare-fun lt!127003 () array!3443)

(assert (=> b!79817 (= lt!127003 (array!3444 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!127017 () array!3443)

(assert (=> b!79817 (= lt!127017 (array!3444 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!127001 () (_ BitVec 64))

(assert (=> b!79817 (= lt!127001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127014 () (_ BitVec 64))

(assert (=> b!79817 (= lt!127014 ((_ sign_extend 32) (size!1588 (array!3444 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!126997 () (_ BitVec 64))

(assert (=> b!79817 (= lt!126997 (bvmul lt!127014 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!127018 () (_ BitVec 64))

(assert (=> b!79817 (= lt!127018 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126996 () (_ BitVec 64))

(assert (=> b!79817 (= lt!126996 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!3443 array!3443 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5243)

(assert (=> b!79817 (= lt!126999 (arrayBitRangesEqSlicedLemma!0 lt!127003 lt!127017 lt!127001 lt!126997 lt!127018 lt!126996))))

(declare-fun call!998 () Bool)

(assert (=> b!79817 call!998))

(declare-fun b!79818 () Bool)

(declare-fun res!66056 () Bool)

(assert (=> b!79818 (=> (not res!66056) (not e!52434))))

(declare-fun e!52433 () Bool)

(assert (=> b!79818 (= res!66056 e!52433)))

(declare-fun res!66058 () Bool)

(assert (=> b!79818 (=> res!66058 e!52433)))

(assert (=> b!79818 (= res!66058 (not (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516)))))

(declare-fun bm!996 () Bool)

(declare-fun lt!127011 () tuple3!242)

(assert (=> bm!996 (= call!998 (arrayBitRangesEq!0 (ite c!5648 (array!3444 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!127003) (ite c!5648 (_3!142 lt!127011) lt!127017) (ite c!5648 #b0000000000000000000000000000000000000000000000000000000000000000 lt!127018) (ite c!5648 #b0000000000000000000000000000000000000000000000000000000000000000 lt!126996)))))

(declare-fun b!79819 () Bool)

(declare-fun lt!127026 () Unit!5243)

(assert (=> b!79819 (= e!52431 (tuple3!243 lt!127026 (_2!3701 lt!127011) (_3!142 lt!127011)))))

(declare-fun readBit!0 (BitStream!2738) tuple2!7126)

(assert (=> b!79819 (= lt!127009 (readBit!0 thiss!1716))))

(declare-fun lt!126994 () (_ BitVec 32))

(assert (=> b!79819 (= lt!126994 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!127006 () (_ BitVec 32))

(assert (=> b!79819 (= lt!127006 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!127007 () array!3443)

(assert (=> b!79819 (= lt!127007 (array!3444 (store (arr!2192 (array!3444 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!126994 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2192 (array!3444 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!126994)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!127006)))) ((_ sign_extend 24) (ite (_1!3706 lt!127009) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!127006) #b00000000))))) (size!1588 (array!3444 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!127028 () (_ BitVec 64))

(assert (=> b!79819 (= lt!127028 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!127025 () (_ BitVec 64))

(assert (=> b!79819 (= lt!127025 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!127015 () Unit!5243)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2738 BitStream!2738 (_ BitVec 64) (_ BitVec 64)) Unit!5243)

(assert (=> b!79819 (= lt!127015 (validateOffsetBitsIneqLemma!0 thiss!1716 (_2!3706 lt!127009) lt!127028 lt!127025))))

(assert (=> b!79819 (validate_offset_bits!1 ((_ sign_extend 32) (size!1588 (buf!1978 (_2!3706 lt!127009)))) ((_ sign_extend 32) (currentByte!3864 (_2!3706 lt!127009))) ((_ sign_extend 32) (currentBit!3859 (_2!3706 lt!127009))) (bvsub lt!127028 lt!127025))))

(declare-fun lt!127027 () Unit!5243)

(assert (=> b!79819 (= lt!127027 lt!127015)))

(assert (=> b!79819 (= lt!127011 (readBitsLoop!0 (_2!3706 lt!127009) nBits!516 lt!127007 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!516))))

(declare-fun res!66057 () Bool)

(assert (=> b!79819 (= res!66057 (= (bvsub (bvadd (bitIndex!0 (size!1588 (buf!1978 thiss!1716)) (currentByte!3864 thiss!1716) (currentBit!3859 thiss!1716)) nBits!516) #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!1588 (buf!1978 (_2!3701 lt!127011))) (currentByte!3864 (_2!3701 lt!127011)) (currentBit!3859 (_2!3701 lt!127011)))))))

(declare-fun e!52432 () Bool)

(assert (=> b!79819 (=> (not res!66057) (not e!52432))))

(assert (=> b!79819 e!52432))

(declare-fun lt!127023 () Unit!5243)

(declare-fun Unit!5253 () Unit!5243)

(assert (=> b!79819 (= lt!127023 Unit!5253)))

(assert (=> b!79819 (= lt!127013 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!79819 (= lt!127020 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!127019 () Unit!5243)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!3443 (_ BitVec 64) Bool) Unit!5243)

(assert (=> b!79819 (= lt!127019 (arrayBitRangesUpdatedAtLemma!0 (array!3444 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (_1!3706 lt!127009)))))

(assert (=> b!79819 call!999))

