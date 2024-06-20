; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15658 () Bool)

(assert start!15658)

(declare-fun b!79277 () Bool)

(declare-fun e!52038 () Bool)

(declare-fun e!52035 () Bool)

(assert (=> b!79277 (= e!52038 (not e!52035))))

(declare-fun res!65624 () Bool)

(assert (=> b!79277 (=> res!65624 e!52035)))

(declare-datatypes ((array!3386 0))(
  ( (array!3387 (arr!2165 (Array (_ BitVec 32) (_ BitVec 8))) (size!1564 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2690 0))(
  ( (BitStream!2691 (buf!1954 array!3386) (currentByte!3825 (_ BitVec 32)) (currentBit!3820 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5213 0))(
  ( (Unit!5214) )
))
(declare-datatypes ((tuple2!7078 0))(
  ( (tuple2!7079 (_1!3676 Unit!5213) (_2!3676 BitStream!2690)) )
))
(declare-fun lt!126141 () tuple2!7078)

(declare-fun thiss!1107 () BitStream!2690)

(assert (=> b!79277 (= res!65624 (not (= (size!1564 (buf!1954 (_2!3676 lt!126141))) (size!1564 (buf!1954 thiss!1107)))))))

(declare-fun e!52037 () Bool)

(assert (=> b!79277 e!52037))

(declare-fun res!65628 () Bool)

(assert (=> b!79277 (=> (not res!65628) (not e!52037))))

(assert (=> b!79277 (= res!65628 (= (size!1564 (buf!1954 thiss!1107)) (size!1564 (buf!1954 (_2!3676 lt!126141)))))))

(declare-fun lt!126147 () Bool)

(declare-fun appendBit!0 (BitStream!2690 Bool) tuple2!7078)

(assert (=> b!79277 (= lt!126141 (appendBit!0 thiss!1107 lt!126147))))

(declare-fun b!215 () (_ BitVec 8))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> b!79277 (= lt!126147 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!79278 () Bool)

(declare-fun res!65625 () Bool)

(assert (=> b!79278 (=> (not res!65625) (not e!52038))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79278 (= res!65625 (validate_offset_bit!0 ((_ sign_extend 32) (size!1564 (buf!1954 thiss!1107))) ((_ sign_extend 32) (currentByte!3825 thiss!1107)) ((_ sign_extend 32) (currentBit!3820 thiss!1107))))))

(declare-fun b!79279 () Bool)

(declare-fun res!65629 () Bool)

(declare-fun e!52036 () Bool)

(assert (=> b!79279 (=> (not res!65629) (not e!52036))))

(declare-fun isPrefixOf!0 (BitStream!2690 BitStream!2690) Bool)

(assert (=> b!79279 (= res!65629 (isPrefixOf!0 thiss!1107 (_2!3676 lt!126141)))))

(declare-fun b!79280 () Bool)

(declare-fun e!52041 () Bool)

(declare-fun array_inv!1410 (array!3386) Bool)

(assert (=> b!79280 (= e!52041 (array_inv!1410 (buf!1954 thiss!1107)))))

(declare-fun b!79281 () Bool)

(declare-fun lt!126146 () (_ BitVec 64))

(declare-fun lt!126144 () (_ BitVec 64))

(assert (=> b!79281 (= e!52035 (or (not (= lt!126146 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!126146 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!126144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!79281 (= lt!126146 (bvand lt!126144 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!79281 (= lt!126144 (bitIndex!0 (size!1564 (buf!1954 thiss!1107)) (currentByte!3825 thiss!1107) (currentBit!3820 thiss!1107)))))

(declare-fun b!79282 () Bool)

(declare-fun e!52040 () Bool)

(declare-datatypes ((tuple2!7080 0))(
  ( (tuple2!7081 (_1!3677 BitStream!2690) (_2!3677 Bool)) )
))
(declare-fun lt!126143 () tuple2!7080)

(declare-fun lt!126145 () (_ BitVec 64))

(assert (=> b!79282 (= e!52040 (= (bitIndex!0 (size!1564 (buf!1954 (_1!3677 lt!126143))) (currentByte!3825 (_1!3677 lt!126143)) (currentBit!3820 (_1!3677 lt!126143))) lt!126145))))

(declare-fun b!79284 () Bool)

(assert (=> b!79284 (= e!52037 e!52036)))

(declare-fun res!65623 () Bool)

(assert (=> b!79284 (=> (not res!65623) (not e!52036))))

(declare-fun lt!126142 () (_ BitVec 64))

(assert (=> b!79284 (= res!65623 (= lt!126145 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!126142)))))

(assert (=> b!79284 (= lt!126145 (bitIndex!0 (size!1564 (buf!1954 (_2!3676 lt!126141))) (currentByte!3825 (_2!3676 lt!126141)) (currentBit!3820 (_2!3676 lt!126141))))))

(assert (=> b!79284 (= lt!126142 (bitIndex!0 (size!1564 (buf!1954 thiss!1107)) (currentByte!3825 thiss!1107) (currentBit!3820 thiss!1107)))))

(declare-fun res!65627 () Bool)

(assert (=> start!15658 (=> (not res!65627) (not e!52038))))

(assert (=> start!15658 (= res!65627 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15658 e!52038))

(assert (=> start!15658 true))

(declare-fun inv!12 (BitStream!2690) Bool)

(assert (=> start!15658 (and (inv!12 thiss!1107) e!52041)))

(declare-fun b!79283 () Bool)

(assert (=> b!79283 (= e!52036 e!52040)))

(declare-fun res!65626 () Bool)

(assert (=> b!79283 (=> (not res!65626) (not e!52040))))

(assert (=> b!79283 (= res!65626 (and (= (_2!3677 lt!126143) lt!126147) (= (_1!3677 lt!126143) (_2!3676 lt!126141))))))

(declare-fun readBitPure!0 (BitStream!2690) tuple2!7080)

(declare-fun readerFrom!0 (BitStream!2690 (_ BitVec 32) (_ BitVec 32)) BitStream!2690)

(assert (=> b!79283 (= lt!126143 (readBitPure!0 (readerFrom!0 (_2!3676 lt!126141) (currentBit!3820 thiss!1107) (currentByte!3825 thiss!1107))))))

(assert (= (and start!15658 res!65627) b!79278))

(assert (= (and b!79278 res!65625) b!79277))

(assert (= (and b!79277 res!65628) b!79284))

(assert (= (and b!79284 res!65623) b!79279))

(assert (= (and b!79279 res!65629) b!79283))

(assert (= (and b!79283 res!65626) b!79282))

(assert (= (and b!79277 (not res!65624)) b!79281))

(assert (= start!15658 b!79280))

(declare-fun m!124703 () Bool)

(assert (=> b!79282 m!124703))

(declare-fun m!124705 () Bool)

(assert (=> b!79278 m!124705))

(declare-fun m!124707 () Bool)

(assert (=> b!79283 m!124707))

(assert (=> b!79283 m!124707))

(declare-fun m!124709 () Bool)

(assert (=> b!79283 m!124709))

(declare-fun m!124711 () Bool)

(assert (=> b!79281 m!124711))

(declare-fun m!124713 () Bool)

(assert (=> b!79280 m!124713))

(declare-fun m!124715 () Bool)

(assert (=> b!79279 m!124715))

(declare-fun m!124717 () Bool)

(assert (=> start!15658 m!124717))

(declare-fun m!124719 () Bool)

(assert (=> b!79277 m!124719))

(declare-fun m!124721 () Bool)

(assert (=> b!79277 m!124721))

(declare-fun m!124723 () Bool)

(assert (=> b!79284 m!124723))

(assert (=> b!79284 m!124711))

(push 1)

(assert (not b!79279))

(assert (not b!79277))

(assert (not b!79284))

(assert (not start!15658))

(assert (not b!79283))

(assert (not b!79281))

(assert (not b!79280))

(assert (not b!79278))

(assert (not b!79282))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!25024 () Bool)

(assert (=> d!25024 (= (array_inv!1410 (buf!1954 thiss!1107)) (bvsge (size!1564 (buf!1954 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!79280 d!25024))

(declare-fun d!25026 () Bool)

(declare-fun e!52068 () Bool)

(assert (=> d!25026 e!52068))

(declare-fun res!65678 () Bool)

(assert (=> d!25026 (=> (not res!65678) (not e!52068))))

(declare-fun lt!126214 () (_ BitVec 64))

(declare-fun lt!126217 () (_ BitVec 64))

(declare-fun lt!126218 () (_ BitVec 64))

(assert (=> d!25026 (= res!65678 (= lt!126214 (bvsub lt!126217 lt!126218)))))

(assert (=> d!25026 (or (= (bvand lt!126217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!126218 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!126217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!126217 lt!126218) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!25026 (= lt!126218 (remainingBits!0 ((_ sign_extend 32) (size!1564 (buf!1954 (_1!3677 lt!126143)))) ((_ sign_extend 32) (currentByte!3825 (_1!3677 lt!126143))) ((_ sign_extend 32) (currentBit!3820 (_1!3677 lt!126143)))))))

(declare-fun lt!126213 () (_ BitVec 64))

(declare-fun lt!126215 () (_ BitVec 64))

(assert (=> d!25026 (= lt!126217 (bvmul lt!126213 lt!126215))))

(assert (=> d!25026 (or (= lt!126213 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!126215 (bvsdiv (bvmul lt!126213 lt!126215) lt!126213)))))

(assert (=> d!25026 (= lt!126215 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25026 (= lt!126213 ((_ sign_extend 32) (size!1564 (buf!1954 (_1!3677 lt!126143)))))))

(assert (=> d!25026 (= lt!126214 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3825 (_1!3677 lt!126143))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3820 (_1!3677 lt!126143)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!25026 (invariant!0 (currentBit!3820 (_1!3677 lt!126143)) (currentByte!3825 (_1!3677 lt!126143)) (size!1564 (buf!1954 (_1!3677 lt!126143))))))

(assert (=> d!25026 (= (bitIndex!0 (size!1564 (buf!1954 (_1!3677 lt!126143))) (currentByte!3825 (_1!3677 lt!126143)) (currentBit!3820 (_1!3677 lt!126143))) lt!126214)))

(declare-fun b!79333 () Bool)

(declare-fun res!65677 () Bool)

(assert (=> b!79333 (=> (not res!65677) (not e!52068))))

(assert (=> b!79333 (= res!65677 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!126214))))

(declare-fun b!79334 () Bool)

(declare-fun lt!126216 () (_ BitVec 64))

(assert (=> b!79334 (= e!52068 (bvsle lt!126214 (bvmul lt!126216 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!79334 (or (= lt!126216 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!126216 #b0000000000000000000000000000000000000000000000000000000000001000) lt!126216)))))

(assert (=> b!79334 (= lt!126216 ((_ sign_extend 32) (size!1564 (buf!1954 (_1!3677 lt!126143)))))))

(assert (= (and d!25026 res!65678) b!79333))

(assert (= (and b!79333 res!65677) b!79334))

(declare-fun m!124755 () Bool)

(assert (=> d!25026 m!124755))

(declare-fun m!124757 () Bool)

(assert (=> d!25026 m!124757))

(assert (=> b!79282 d!25026))

(declare-fun d!25030 () Bool)

(declare-fun e!52069 () Bool)

(assert (=> d!25030 e!52069))

(declare-fun res!65680 () Bool)

(assert (=> d!25030 (=> (not res!65680) (not e!52069))))

(declare-fun lt!126223 () (_ BitVec 64))

(declare-fun lt!126224 () (_ BitVec 64))

(declare-fun lt!126220 () (_ BitVec 64))

(assert (=> d!25030 (= res!65680 (= lt!126220 (bvsub lt!126223 lt!126224)))))

(assert (=> d!25030 (or (= (bvand lt!126223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!126224 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!126223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!126223 lt!126224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25030 (= lt!126224 (remainingBits!0 ((_ sign_extend 32) (size!1564 (buf!1954 thiss!1107))) ((_ sign_extend 32) (currentByte!3825 thiss!1107)) ((_ sign_extend 32) (currentBit!3820 thiss!1107))))))

(declare-fun lt!126219 () (_ BitVec 64))

(declare-fun lt!126221 () (_ BitVec 64))

(assert (=> d!25030 (= lt!126223 (bvmul lt!126219 lt!126221))))

(assert (=> d!25030 (or (= lt!126219 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!126221 (bvsdiv (bvmul lt!126219 lt!126221) lt!126219)))))

(assert (=> d!25030 (= lt!126221 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25030 (= lt!126219 ((_ sign_extend 32) (size!1564 (buf!1954 thiss!1107))))))

(assert (=> d!25030 (= lt!126220 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3825 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3820 thiss!1107))))))

(assert (=> d!25030 (invariant!0 (currentBit!3820 thiss!1107) (currentByte!3825 thiss!1107) (size!1564 (buf!1954 thiss!1107)))))

(assert (=> d!25030 (= (bitIndex!0 (size!1564 (buf!1954 thiss!1107)) (currentByte!3825 thiss!1107) (currentBit!3820 thiss!1107)) lt!126220)))

(declare-fun b!79335 () Bool)

(declare-fun res!65679 () Bool)

(assert (=> b!79335 (=> (not res!65679) (not e!52069))))

(assert (=> b!79335 (= res!65679 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!126220))))

(declare-fun b!79336 () Bool)

(declare-fun lt!126222 () (_ BitVec 64))

(assert (=> b!79336 (= e!52069 (bvsle lt!126220 (bvmul lt!126222 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!79336 (or (= lt!126222 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!126222 #b0000000000000000000000000000000000000000000000000000000000001000) lt!126222)))))

(assert (=> b!79336 (= lt!126222 ((_ sign_extend 32) (size!1564 (buf!1954 thiss!1107))))))

(assert (= (and d!25030 res!65680) b!79335))

(assert (= (and b!79335 res!65679) b!79336))

(declare-fun m!124759 () Bool)

(assert (=> d!25030 m!124759))

(declare-fun m!124761 () Bool)

(assert (=> d!25030 m!124761))

(assert (=> b!79281 d!25030))

(declare-fun d!25032 () Bool)

(declare-datatypes ((tuple2!7086 0))(
  ( (tuple2!7087 (_1!3680 Bool) (_2!3680 BitStream!2690)) )
))
(declare-fun lt!126231 () tuple2!7086)

(declare-fun readBit!0 (BitStream!2690) tuple2!7086)

(assert (=> d!25032 (= lt!126231 (readBit!0 (readerFrom!0 (_2!3676 lt!126141) (currentBit!3820 thiss!1107) (currentByte!3825 thiss!1107))))))

(assert (=> d!25032 (= (readBitPure!0 (readerFrom!0 (_2!3676 lt!126141) (currentBit!3820 thiss!1107) (currentByte!3825 thiss!1107))) (tuple2!7081 (_2!3680 lt!126231) (_1!3680 lt!126231)))))

(declare-fun bs!6065 () Bool)

(assert (= bs!6065 d!25032))

(assert (=> bs!6065 m!124707))

(declare-fun m!124775 () Bool)

(assert (=> bs!6065 m!124775))

(assert (=> b!79283 d!25032))

(declare-fun d!25036 () Bool)

(declare-fun e!52080 () Bool)

(assert (=> d!25036 e!52080))

(declare-fun res!65697 () Bool)

(assert (=> d!25036 (=> (not res!65697) (not e!52080))))

(assert (=> d!25036 (= res!65697 (invariant!0 (currentBit!3820 (_2!3676 lt!126141)) (currentByte!3825 (_2!3676 lt!126141)) (size!1564 (buf!1954 (_2!3676 lt!126141)))))))

(assert (=> d!25036 (= (readerFrom!0 (_2!3676 lt!126141) (currentBit!3820 thiss!1107) (currentByte!3825 thiss!1107)) (BitStream!2691 (buf!1954 (_2!3676 lt!126141)) (currentByte!3825 thiss!1107) (currentBit!3820 thiss!1107)))))

(declare-fun b!79352 () Bool)

(assert (=> b!79352 (= e!52080 (invariant!0 (currentBit!3820 thiss!1107) (currentByte!3825 thiss!1107) (size!1564 (buf!1954 (_2!3676 lt!126141)))))))

(assert (= (and d!25036 res!65697) b!79352))

(declare-fun m!124781 () Bool)

(assert (=> d!25036 m!124781))

(declare-fun m!124783 () Bool)

(assert (=> b!79352 m!124783))

(assert (=> b!79283 d!25036))

(declare-fun d!25042 () Bool)

(assert (=> d!25042 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1564 (buf!1954 thiss!1107))) ((_ sign_extend 32) (currentByte!3825 thiss!1107)) ((_ sign_extend 32) (currentBit!3820 thiss!1107))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1564 (buf!1954 thiss!1107))) ((_ sign_extend 32) (currentByte!3825 thiss!1107)) ((_ sign_extend 32) (currentBit!3820 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6068 () Bool)

(assert (= bs!6068 d!25042))

(assert (=> bs!6068 m!124759))

(assert (=> b!79278 d!25042))

(declare-fun b!79378 () Bool)

(declare-fun e!52093 () Bool)

(declare-fun lt!126275 () tuple2!7080)

(declare-fun lt!126276 () tuple2!7078)

(assert (=> b!79378 (= e!52093 (= (bitIndex!0 (size!1564 (buf!1954 (_1!3677 lt!126275))) (currentByte!3825 (_1!3677 lt!126275)) (currentBit!3820 (_1!3677 lt!126275))) (bitIndex!0 (size!1564 (buf!1954 (_2!3676 lt!126276))) (currentByte!3825 (_2!3676 lt!126276)) (currentBit!3820 (_2!3676 lt!126276)))))))

(declare-fun d!25044 () Bool)

(declare-fun e!52094 () Bool)

(assert (=> d!25044 e!52094))

(declare-fun res!65722 () Bool)

(assert (=> d!25044 (=> (not res!65722) (not e!52094))))

(assert (=> d!25044 (= res!65722 (= (size!1564 (buf!1954 thiss!1107)) (size!1564 (buf!1954 (_2!3676 lt!126276)))))))

(declare-fun choose!16 (BitStream!2690 Bool) tuple2!7078)

(assert (=> d!25044 (= lt!126276 (choose!16 thiss!1107 lt!126147))))

(assert (=> d!25044 (validate_offset_bit!0 ((_ sign_extend 32) (size!1564 (buf!1954 thiss!1107))) ((_ sign_extend 32) (currentByte!3825 thiss!1107)) ((_ sign_extend 32) (currentBit!3820 thiss!1107)))))

(assert (=> d!25044 (= (appendBit!0 thiss!1107 lt!126147) lt!126276)))

(declare-fun b!79375 () Bool)

(declare-fun res!65720 () Bool)

(assert (=> b!79375 (=> (not res!65720) (not e!52094))))

(declare-fun lt!126274 () (_ BitVec 64))

(declare-fun lt!126273 () (_ BitVec 64))

(assert (=> b!79375 (= res!65720 (= (bitIndex!0 (size!1564 (buf!1954 (_2!3676 lt!126276))) (currentByte!3825 (_2!3676 lt!126276)) (currentBit!3820 (_2!3676 lt!126276))) (bvadd lt!126274 lt!126273)))))

(assert (=> b!79375 (or (not (= (bvand lt!126274 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!126273 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!126274 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!126274 lt!126273) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!79375 (= lt!126273 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!79375 (= lt!126274 (bitIndex!0 (size!1564 (buf!1954 thiss!1107)) (currentByte!3825 thiss!1107) (currentBit!3820 thiss!1107)))))

(declare-fun b!79376 () Bool)

(declare-fun res!65723 () Bool)

(assert (=> b!79376 (=> (not res!65723) (not e!52094))))

(assert (=> b!79376 (= res!65723 (isPrefixOf!0 thiss!1107 (_2!3676 lt!126276)))))

(declare-fun b!79377 () Bool)

(assert (=> b!79377 (= e!52094 e!52093)))

(declare-fun res!65721 () Bool)

(assert (=> b!79377 (=> (not res!65721) (not e!52093))))

(assert (=> b!79377 (= res!65721 (and (= (_2!3677 lt!126275) lt!126147) (= (_1!3677 lt!126275) (_2!3676 lt!126276))))))

(assert (=> b!79377 (= lt!126275 (readBitPure!0 (readerFrom!0 (_2!3676 lt!126276) (currentBit!3820 thiss!1107) (currentByte!3825 thiss!1107))))))

(assert (= (and d!25044 res!65722) b!79375))

(assert (= (and b!79375 res!65720) b!79376))

(assert (= (and b!79376 res!65723) b!79377))

(assert (= (and b!79377 res!65721) b!79378))

(declare-fun m!124799 () Bool)

(assert (=> d!25044 m!124799))

(assert (=> d!25044 m!124705))

(declare-fun m!124801 () Bool)

(assert (=> b!79377 m!124801))

(assert (=> b!79377 m!124801))

(declare-fun m!124803 () Bool)

(assert (=> b!79377 m!124803))

(declare-fun m!124805 () Bool)

(assert (=> b!79376 m!124805))

(declare-fun m!124807 () Bool)

(assert (=> b!79378 m!124807))

(declare-fun m!124809 () Bool)

(assert (=> b!79378 m!124809))

(assert (=> b!79375 m!124809))

(assert (=> b!79375 m!124711))

(assert (=> b!79277 d!25044))

(declare-fun d!25058 () Bool)

(assert (=> d!25058 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3820 thiss!1107) (currentByte!3825 thiss!1107) (size!1564 (buf!1954 thiss!1107))))))

(declare-fun bs!6071 () Bool)

(assert (= bs!6071 d!25058))

(assert (=> bs!6071 m!124761))

(assert (=> start!15658 d!25058))

(declare-fun d!25060 () Bool)

(declare-fun res!65732 () Bool)

(declare-fun e!52099 () Bool)

(assert (=> d!25060 (=> (not res!65732) (not e!52099))))

(assert (=> d!25060 (= res!65732 (= (size!1564 (buf!1954 thiss!1107)) (size!1564 (buf!1954 (_2!3676 lt!126141)))))))

(assert (=> d!25060 (= (isPrefixOf!0 thiss!1107 (_2!3676 lt!126141)) e!52099)))

(declare-fun b!79385 () Bool)

(declare-fun res!65731 () Bool)

(assert (=> b!79385 (=> (not res!65731) (not e!52099))))

(assert (=> b!79385 (= res!65731 (bvsle (bitIndex!0 (size!1564 (buf!1954 thiss!1107)) (currentByte!3825 thiss!1107) (currentBit!3820 thiss!1107)) (bitIndex!0 (size!1564 (buf!1954 (_2!3676 lt!126141))) (currentByte!3825 (_2!3676 lt!126141)) (currentBit!3820 (_2!3676 lt!126141)))))))

(declare-fun b!79386 () Bool)

(declare-fun e!52100 () Bool)

(assert (=> b!79386 (= e!52099 e!52100)))

(declare-fun res!65730 () Bool)

(assert (=> b!79386 (=> res!65730 e!52100)))

(assert (=> b!79386 (= res!65730 (= (size!1564 (buf!1954 thiss!1107)) #b00000000000000000000000000000000))))

(declare-fun b!79387 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3386 array!3386 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79387 (= e!52100 (arrayBitRangesEq!0 (buf!1954 thiss!1107) (buf!1954 (_2!3676 lt!126141)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1564 (buf!1954 thiss!1107)) (currentByte!3825 thiss!1107) (currentBit!3820 thiss!1107))))))

(assert (= (and d!25060 res!65732) b!79385))

(assert (= (and b!79385 res!65731) b!79386))

(assert (= (and b!79386 (not res!65730)) b!79387))

(assert (=> b!79385 m!124711))

(assert (=> b!79385 m!124723))

(assert (=> b!79387 m!124711))

(assert (=> b!79387 m!124711))

(declare-fun m!124811 () Bool)

(assert (=> b!79387 m!124811))

(assert (=> b!79279 d!25060))

(declare-fun d!25062 () Bool)

(declare-fun e!52101 () Bool)

(assert (=> d!25062 e!52101))

(declare-fun res!65734 () Bool)

(assert (=> d!25062 (=> (not res!65734) (not e!52101))))

(declare-fun lt!126281 () (_ BitVec 64))

(declare-fun lt!126282 () (_ BitVec 64))

(declare-fun lt!126278 () (_ BitVec 64))

(assert (=> d!25062 (= res!65734 (= lt!126278 (bvsub lt!126281 lt!126282)))))

(assert (=> d!25062 (or (= (bvand lt!126281 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!126282 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!126281 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!126281 lt!126282) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25062 (= lt!126282 (remainingBits!0 ((_ sign_extend 32) (size!1564 (buf!1954 (_2!3676 lt!126141)))) ((_ sign_extend 32) (currentByte!3825 (_2!3676 lt!126141))) ((_ sign_extend 32) (currentBit!3820 (_2!3676 lt!126141)))))))

(declare-fun lt!126277 () (_ BitVec 64))

(declare-fun lt!126279 () (_ BitVec 64))

(assert (=> d!25062 (= lt!126281 (bvmul lt!126277 lt!126279))))

(assert (=> d!25062 (or (= lt!126277 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!126279 (bvsdiv (bvmul lt!126277 lt!126279) lt!126277)))))

(assert (=> d!25062 (= lt!126279 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25062 (= lt!126277 ((_ sign_extend 32) (size!1564 (buf!1954 (_2!3676 lt!126141)))))))

(assert (=> d!25062 (= lt!126278 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3825 (_2!3676 lt!126141))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3820 (_2!3676 lt!126141)))))))

(assert (=> d!25062 (invariant!0 (currentBit!3820 (_2!3676 lt!126141)) (currentByte!3825 (_2!3676 lt!126141)) (size!1564 (buf!1954 (_2!3676 lt!126141))))))

(assert (=> d!25062 (= (bitIndex!0 (size!1564 (buf!1954 (_2!3676 lt!126141))) (currentByte!3825 (_2!3676 lt!126141)) (currentBit!3820 (_2!3676 lt!126141))) lt!126278)))

(declare-fun b!79388 () Bool)

(declare-fun res!65733 () Bool)

(assert (=> b!79388 (=> (not res!65733) (not e!52101))))

(assert (=> b!79388 (= res!65733 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!126278))))

(declare-fun b!79389 () Bool)

(declare-fun lt!126280 () (_ BitVec 64))

(assert (=> b!79389 (= e!52101 (bvsle lt!126278 (bvmul lt!126280 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!79389 (or (= lt!126280 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!126280 #b0000000000000000000000000000000000000000000000000000000000001000) lt!126280)))))

(assert (=> b!79389 (= lt!126280 ((_ sign_extend 32) (size!1564 (buf!1954 (_2!3676 lt!126141)))))))

(assert (= (and d!25062 res!65734) b!79388))

(assert (= (and b!79388 res!65733) b!79389))

(declare-fun m!124813 () Bool)

(assert (=> d!25062 m!124813))

(assert (=> d!25062 m!124781))

(assert (=> b!79284 d!25062))

(assert (=> b!79284 d!25030))

(push 1)

(assert (not d!25030))

(assert (not b!79377))

(assert (not d!25042))

(assert (not b!79378))

(assert (not b!79387))

(assert (not b!79375))

(assert (not d!25058))

(assert (not b!79385))

(assert (not d!25062))

(assert (not b!79352))

(assert (not d!25026))

(assert (not d!25044))

(assert (not d!25032))

(assert (not d!25036))

(assert (not b!79376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

