; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16820 () Bool)

(assert start!16820)

(declare-fun b!82819 () Bool)

(declare-fun e!54854 () Bool)

(declare-datatypes ((array!3760 0))(
  ( (array!3761 (arr!2353 (Array (_ BitVec 32) (_ BitVec 8))) (size!1716 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2994 0))(
  ( (BitStream!2995 (buf!2106 array!3760) (currentByte!4154 (_ BitVec 32)) (currentBit!4149 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2994)

(declare-fun array_inv!1562 (array!3760) Bool)

(assert (=> b!82819 (= e!54854 (array_inv!1562 (buf!2106 b2!98)))))

(declare-fun b!82820 () Bool)

(declare-fun res!68198 () Bool)

(declare-fun e!54857 () Bool)

(assert (=> b!82820 (=> (not res!68198) (not e!54857))))

(declare-fun b1!98 () BitStream!2994)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82820 (= res!68198 (validate_offset_bits!1 ((_ sign_extend 32) (size!1716 (buf!2106 b1!98))) ((_ sign_extend 32) (currentByte!4154 b1!98)) ((_ sign_extend 32) (currentBit!4149 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82821 () Bool)

(declare-fun e!54858 () Bool)

(assert (=> b!82821 (= e!54858 (array_inv!1562 (buf!2106 b1!98)))))

(declare-fun res!68197 () Bool)

(assert (=> start!16820 (=> (not res!68197) (not e!54857))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> start!16820 (= res!68197 (and (= (size!1716 (buf!2106 b1!98)) (size!1716 (buf!2106 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16820 e!54857))

(declare-fun inv!12 (BitStream!2994) Bool)

(assert (=> start!16820 (and (inv!12 b1!98) e!54858)))

(assert (=> start!16820 (and (inv!12 b2!98) e!54854)))

(assert (=> start!16820 true))

(declare-fun b!82822 () Bool)

(declare-fun e!54853 () Bool)

(assert (=> b!82822 (= e!54857 e!54853)))

(declare-fun res!68199 () Bool)

(assert (=> b!82822 (=> (not res!68199) (not e!54853))))

(declare-fun lt!131938 () (_ BitVec 64))

(declare-fun lt!131936 () (_ BitVec 64))

(assert (=> b!82822 (= res!68199 (= lt!131938 lt!131936))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82822 (= lt!131936 (bitIndex!0 (size!1716 (buf!2106 b2!98)) (currentByte!4154 b2!98) (currentBit!4149 b2!98)))))

(declare-fun lt!131935 () (_ BitVec 64))

(assert (=> b!82822 (= lt!131938 (bvadd lt!131935 b1b2Diff!1))))

(assert (=> b!82822 (= lt!131935 (bitIndex!0 (size!1716 (buf!2106 b1!98)) (currentByte!4154 b1!98) (currentBit!4149 b1!98)))))

(declare-fun lt!131940 () (_ BitVec 64))

(declare-fun b!82823 () Bool)

(declare-fun e!54852 () Bool)

(declare-fun lt!131933 () (_ BitVec 64))

(assert (=> b!82823 (= e!54852 (or (not (= lt!131933 (bvsub lt!131940 lt!131938))) (bvslt lt!131933 (bvsub b1ValidateOffsetBits!11 b1b2Diff!1)) (bvsgt ((_ sign_extend 32) (size!1716 (buf!2106 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4154 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4149 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (and (bvsge ((_ sign_extend 32) (size!1716 (buf!2106 b2!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4154 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4149 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!82823 (= lt!131933 (bvsub lt!131940 lt!131936))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82823 (= lt!131933 (remainingBits!0 ((_ sign_extend 32) (size!1716 (buf!2106 b2!98))) ((_ sign_extend 32) (currentByte!4154 b2!98)) ((_ sign_extend 32) (currentBit!4149 b2!98))))))

(assert (=> b!82823 (= lt!131940 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1716 (buf!2106 b2!98)))))))

(declare-datatypes ((Unit!5541 0))(
  ( (Unit!5542) )
))
(declare-fun lt!131934 () Unit!5541)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2994) Unit!5541)

(assert (=> b!82823 (= lt!131934 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!82824 () Bool)

(assert (=> b!82824 (= e!54853 (not e!54852))))

(declare-fun res!68200 () Bool)

(assert (=> b!82824 (=> res!68200 e!54852)))

(declare-fun lt!131939 () (_ BitVec 64))

(assert (=> b!82824 (= res!68200 (bvsgt lt!131935 (bvsub lt!131939 b1ValidateOffsetBits!11)))))

(assert (=> b!82824 (= (remainingBits!0 ((_ sign_extend 32) (size!1716 (buf!2106 b1!98))) ((_ sign_extend 32) (currentByte!4154 b1!98)) ((_ sign_extend 32) (currentBit!4149 b1!98))) (bvsub lt!131939 lt!131935))))

(assert (=> b!82824 (= lt!131939 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1716 (buf!2106 b1!98)))))))

(declare-fun lt!131937 () Unit!5541)

(assert (=> b!82824 (= lt!131937 (remainingBitsBitIndexLemma!0 b1!98))))

(assert (= (and start!16820 res!68197) b!82820))

(assert (= (and b!82820 res!68198) b!82822))

(assert (= (and b!82822 res!68199) b!82824))

(assert (= (and b!82824 (not res!68200)) b!82823))

(assert (= start!16820 b!82821))

(assert (= start!16820 b!82819))

(declare-fun m!129325 () Bool)

(assert (=> b!82823 m!129325))

(declare-fun m!129327 () Bool)

(assert (=> b!82823 m!129327))

(declare-fun m!129329 () Bool)

(assert (=> b!82819 m!129329))

(declare-fun m!129331 () Bool)

(assert (=> start!16820 m!129331))

(declare-fun m!129333 () Bool)

(assert (=> start!16820 m!129333))

(declare-fun m!129335 () Bool)

(assert (=> b!82824 m!129335))

(declare-fun m!129337 () Bool)

(assert (=> b!82824 m!129337))

(declare-fun m!129339 () Bool)

(assert (=> b!82820 m!129339))

(declare-fun m!129341 () Bool)

(assert (=> b!82821 m!129341))

(declare-fun m!129343 () Bool)

(assert (=> b!82822 m!129343))

(declare-fun m!129345 () Bool)

(assert (=> b!82822 m!129345))

(check-sat (not start!16820) (not b!82821) (not b!82823) (not b!82824) (not b!82820) (not b!82819) (not b!82822))
(check-sat)
(get-model)

(declare-fun d!26316 () Bool)

(assert (=> d!26316 (= (array_inv!1562 (buf!2106 b2!98)) (bvsge (size!1716 (buf!2106 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82819 d!26316))

(declare-fun d!26318 () Bool)

(assert (=> d!26318 (= (remainingBits!0 ((_ sign_extend 32) (size!1716 (buf!2106 b1!98))) ((_ sign_extend 32) (currentByte!4154 b1!98)) ((_ sign_extend 32) (currentBit!4149 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1716 (buf!2106 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4154 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4149 b1!98)))))))

(assert (=> b!82824 d!26318))

(declare-fun d!26320 () Bool)

(declare-fun lt!131976 () (_ BitVec 64))

(declare-fun lt!131975 () (_ BitVec 64))

(assert (=> d!26320 (= (remainingBits!0 ((_ sign_extend 32) (size!1716 (buf!2106 b1!98))) ((_ sign_extend 32) (currentByte!4154 b1!98)) ((_ sign_extend 32) (currentBit!4149 b1!98))) (bvsub lt!131976 lt!131975))))

(assert (=> d!26320 (or (= (bvand lt!131976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131975 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131976 lt!131975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26320 (= lt!131975 (bitIndex!0 (size!1716 (buf!2106 b1!98)) (currentByte!4154 b1!98) (currentBit!4149 b1!98)))))

(declare-fun lt!131978 () (_ BitVec 64))

(declare-fun lt!131977 () (_ BitVec 64))

(assert (=> d!26320 (= lt!131976 (bvmul lt!131978 lt!131977))))

(assert (=> d!26320 (or (= lt!131978 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131977 (bvsdiv (bvmul lt!131978 lt!131977) lt!131978)))))

(assert (=> d!26320 (= lt!131977 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26320 (= lt!131978 ((_ sign_extend 32) (size!1716 (buf!2106 b1!98))))))

(declare-fun lt!131979 () Unit!5541)

(declare-fun choose!23 (BitStream!2994) Unit!5541)

(assert (=> d!26320 (= lt!131979 (choose!23 b1!98))))

(assert (=> d!26320 (= (remainingBitsBitIndexLemma!0 b1!98) lt!131979)))

(declare-fun bs!6458 () Bool)

(assert (= bs!6458 d!26320))

(assert (=> bs!6458 m!129335))

(assert (=> bs!6458 m!129345))

(declare-fun m!129369 () Bool)

(assert (=> bs!6458 m!129369))

(assert (=> b!82824 d!26320))

(declare-fun d!26322 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26322 (= (inv!12 b1!98) (invariant!0 (currentBit!4149 b1!98) (currentByte!4154 b1!98) (size!1716 (buf!2106 b1!98))))))

(declare-fun bs!6459 () Bool)

(assert (= bs!6459 d!26322))

(declare-fun m!129371 () Bool)

(assert (=> bs!6459 m!129371))

(assert (=> start!16820 d!26322))

(declare-fun d!26324 () Bool)

(assert (=> d!26324 (= (inv!12 b2!98) (invariant!0 (currentBit!4149 b2!98) (currentByte!4154 b2!98) (size!1716 (buf!2106 b2!98))))))

(declare-fun bs!6460 () Bool)

(assert (= bs!6460 d!26324))

(declare-fun m!129373 () Bool)

(assert (=> bs!6460 m!129373))

(assert (=> start!16820 d!26324))

(declare-fun d!26326 () Bool)

(assert (=> d!26326 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1716 (buf!2106 b1!98))) ((_ sign_extend 32) (currentByte!4154 b1!98)) ((_ sign_extend 32) (currentBit!4149 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1716 (buf!2106 b1!98))) ((_ sign_extend 32) (currentByte!4154 b1!98)) ((_ sign_extend 32) (currentBit!4149 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6461 () Bool)

(assert (= bs!6461 d!26326))

(assert (=> bs!6461 m!129335))

(assert (=> b!82820 d!26326))

(declare-fun d!26328 () Bool)

(assert (=> d!26328 (= (array_inv!1562 (buf!2106 b1!98)) (bvsge (size!1716 (buf!2106 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82821 d!26328))

(declare-fun d!26330 () Bool)

(assert (=> d!26330 (= (remainingBits!0 ((_ sign_extend 32) (size!1716 (buf!2106 b2!98))) ((_ sign_extend 32) (currentByte!4154 b2!98)) ((_ sign_extend 32) (currentBit!4149 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1716 (buf!2106 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4154 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4149 b2!98)))))))

(assert (=> b!82823 d!26330))

(declare-fun d!26332 () Bool)

(declare-fun lt!131981 () (_ BitVec 64))

(declare-fun lt!131980 () (_ BitVec 64))

(assert (=> d!26332 (= (remainingBits!0 ((_ sign_extend 32) (size!1716 (buf!2106 b2!98))) ((_ sign_extend 32) (currentByte!4154 b2!98)) ((_ sign_extend 32) (currentBit!4149 b2!98))) (bvsub lt!131981 lt!131980))))

(assert (=> d!26332 (or (= (bvand lt!131981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131980 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131981 lt!131980) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26332 (= lt!131980 (bitIndex!0 (size!1716 (buf!2106 b2!98)) (currentByte!4154 b2!98) (currentBit!4149 b2!98)))))

(declare-fun lt!131983 () (_ BitVec 64))

(declare-fun lt!131982 () (_ BitVec 64))

(assert (=> d!26332 (= lt!131981 (bvmul lt!131983 lt!131982))))

(assert (=> d!26332 (or (= lt!131983 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131982 (bvsdiv (bvmul lt!131983 lt!131982) lt!131983)))))

(assert (=> d!26332 (= lt!131982 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26332 (= lt!131983 ((_ sign_extend 32) (size!1716 (buf!2106 b2!98))))))

(declare-fun lt!131984 () Unit!5541)

(assert (=> d!26332 (= lt!131984 (choose!23 b2!98))))

(assert (=> d!26332 (= (remainingBitsBitIndexLemma!0 b2!98) lt!131984)))

(declare-fun bs!6462 () Bool)

(assert (= bs!6462 d!26332))

(assert (=> bs!6462 m!129325))

(assert (=> bs!6462 m!129343))

(declare-fun m!129375 () Bool)

(assert (=> bs!6462 m!129375))

(assert (=> b!82823 d!26332))

(declare-fun d!26334 () Bool)

(declare-fun e!54882 () Bool)

(assert (=> d!26334 e!54882))

(declare-fun res!68217 () Bool)

(assert (=> d!26334 (=> (not res!68217) (not e!54882))))

(declare-fun lt!132002 () (_ BitVec 64))

(declare-fun lt!131997 () (_ BitVec 64))

(declare-fun lt!132001 () (_ BitVec 64))

(assert (=> d!26334 (= res!68217 (= lt!132002 (bvsub lt!131997 lt!132001)))))

(assert (=> d!26334 (or (= (bvand lt!131997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131997 lt!132001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26334 (= lt!132001 (remainingBits!0 ((_ sign_extend 32) (size!1716 (buf!2106 b2!98))) ((_ sign_extend 32) (currentByte!4154 b2!98)) ((_ sign_extend 32) (currentBit!4149 b2!98))))))

(declare-fun lt!131998 () (_ BitVec 64))

(declare-fun lt!131999 () (_ BitVec 64))

(assert (=> d!26334 (= lt!131997 (bvmul lt!131998 lt!131999))))

(assert (=> d!26334 (or (= lt!131998 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131999 (bvsdiv (bvmul lt!131998 lt!131999) lt!131998)))))

(assert (=> d!26334 (= lt!131999 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26334 (= lt!131998 ((_ sign_extend 32) (size!1716 (buf!2106 b2!98))))))

(assert (=> d!26334 (= lt!132002 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4154 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4149 b2!98))))))

(assert (=> d!26334 (invariant!0 (currentBit!4149 b2!98) (currentByte!4154 b2!98) (size!1716 (buf!2106 b2!98)))))

(assert (=> d!26334 (= (bitIndex!0 (size!1716 (buf!2106 b2!98)) (currentByte!4154 b2!98) (currentBit!4149 b2!98)) lt!132002)))

(declare-fun b!82848 () Bool)

(declare-fun res!68218 () Bool)

(assert (=> b!82848 (=> (not res!68218) (not e!54882))))

(assert (=> b!82848 (= res!68218 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132002))))

(declare-fun b!82849 () Bool)

(declare-fun lt!132000 () (_ BitVec 64))

(assert (=> b!82849 (= e!54882 (bvsle lt!132002 (bvmul lt!132000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82849 (or (= lt!132000 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132000 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132000)))))

(assert (=> b!82849 (= lt!132000 ((_ sign_extend 32) (size!1716 (buf!2106 b2!98))))))

(assert (= (and d!26334 res!68217) b!82848))

(assert (= (and b!82848 res!68218) b!82849))

(assert (=> d!26334 m!129325))

(assert (=> d!26334 m!129373))

(assert (=> b!82822 d!26334))

(declare-fun d!26336 () Bool)

(declare-fun e!54883 () Bool)

(assert (=> d!26336 e!54883))

(declare-fun res!68219 () Bool)

(assert (=> d!26336 (=> (not res!68219) (not e!54883))))

(declare-fun lt!132007 () (_ BitVec 64))

(declare-fun lt!132008 () (_ BitVec 64))

(declare-fun lt!132003 () (_ BitVec 64))

(assert (=> d!26336 (= res!68219 (= lt!132008 (bvsub lt!132003 lt!132007)))))

(assert (=> d!26336 (or (= (bvand lt!132003 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132007 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132003 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132003 lt!132007) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26336 (= lt!132007 (remainingBits!0 ((_ sign_extend 32) (size!1716 (buf!2106 b1!98))) ((_ sign_extend 32) (currentByte!4154 b1!98)) ((_ sign_extend 32) (currentBit!4149 b1!98))))))

(declare-fun lt!132004 () (_ BitVec 64))

(declare-fun lt!132005 () (_ BitVec 64))

(assert (=> d!26336 (= lt!132003 (bvmul lt!132004 lt!132005))))

(assert (=> d!26336 (or (= lt!132004 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132005 (bvsdiv (bvmul lt!132004 lt!132005) lt!132004)))))

(assert (=> d!26336 (= lt!132005 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26336 (= lt!132004 ((_ sign_extend 32) (size!1716 (buf!2106 b1!98))))))

(assert (=> d!26336 (= lt!132008 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4154 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4149 b1!98))))))

(assert (=> d!26336 (invariant!0 (currentBit!4149 b1!98) (currentByte!4154 b1!98) (size!1716 (buf!2106 b1!98)))))

(assert (=> d!26336 (= (bitIndex!0 (size!1716 (buf!2106 b1!98)) (currentByte!4154 b1!98) (currentBit!4149 b1!98)) lt!132008)))

(declare-fun b!82850 () Bool)

(declare-fun res!68220 () Bool)

(assert (=> b!82850 (=> (not res!68220) (not e!54883))))

(assert (=> b!82850 (= res!68220 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132008))))

(declare-fun b!82851 () Bool)

(declare-fun lt!132006 () (_ BitVec 64))

(assert (=> b!82851 (= e!54883 (bvsle lt!132008 (bvmul lt!132006 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82851 (or (= lt!132006 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132006 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132006)))))

(assert (=> b!82851 (= lt!132006 ((_ sign_extend 32) (size!1716 (buf!2106 b1!98))))))

(assert (= (and d!26336 res!68219) b!82850))

(assert (= (and b!82850 res!68220) b!82851))

(assert (=> d!26336 m!129335))

(assert (=> d!26336 m!129371))

(assert (=> b!82822 d!26336))

(check-sat (not d!26320) (not d!26336) (not d!26324) (not d!26334) (not d!26332) (not d!26322) (not d!26326))
