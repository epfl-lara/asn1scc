; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69112 () Bool)

(assert start!69112)

(declare-fun b!311254 () Bool)

(declare-fun e!223780 () Bool)

(declare-datatypes ((array!19009 0))(
  ( (array!19010 (arr!9328 (Array (_ BitVec 32) (_ BitVec 8))) (size!8248 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13600 0))(
  ( (BitStream!13601 (buf!7861 array!19009) (currentByte!14480 (_ BitVec 32)) (currentBit!14475 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13600)

(declare-fun array_inv!7800 (array!19009) Bool)

(assert (=> b!311254 (= e!223780 (array_inv!7800 (buf!7861 b2!97)))))

(declare-fun res!255002 () Bool)

(declare-fun e!223783 () Bool)

(assert (=> start!69112 (=> (not res!255002) (not e!223783))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b1!97 () BitStream!13600)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> start!69112 (= res!255002 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8248 (buf!7861 b1!97)) (size!8248 (buf!7861 b2!97)))))))

(assert (=> start!69112 e!223783))

(assert (=> start!69112 true))

(declare-fun e!223781 () Bool)

(declare-fun inv!12 (BitStream!13600) Bool)

(assert (=> start!69112 (and (inv!12 b1!97) e!223781)))

(assert (=> start!69112 (and (inv!12 b2!97) e!223780)))

(declare-fun b!311255 () Bool)

(assert (=> b!311255 (= e!223781 (array_inv!7800 (buf!7861 b1!97)))))

(declare-fun b!311256 () Bool)

(declare-fun res!255003 () Bool)

(assert (=> b!311256 (=> (not res!255003) (not e!223783))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311256 (= res!255003 (validate_offset_bits!1 ((_ sign_extend 32) (size!8248 (buf!7861 b1!97))) ((_ sign_extend 32) (currentByte!14480 b1!97)) ((_ sign_extend 32) (currentBit!14475 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311257 () Bool)

(declare-fun res!255004 () Bool)

(assert (=> b!311257 (=> (not res!255004) (not e!223783))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311257 (= res!255004 (bvsle (bitIndex!0 (size!8248 (buf!7861 b2!97)) (currentByte!14480 b2!97) (currentBit!14475 b2!97)) (bvadd (bitIndex!0 (size!8248 (buf!7861 b1!97)) (currentByte!14480 b1!97) (currentBit!14475 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311258 () Bool)

(assert (=> b!311258 (= e!223783 (and (bvsle ((_ sign_extend 32) (size!8248 (buf!7861 b1!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14480 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14475 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8248 (buf!7861 b1!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14480 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14475 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!69112 res!255002) b!311256))

(assert (= (and b!311256 res!255003) b!311257))

(assert (= (and b!311257 res!255004) b!311258))

(assert (= start!69112 b!311255))

(assert (= start!69112 b!311254))

(declare-fun m!449147 () Bool)

(assert (=> b!311256 m!449147))

(declare-fun m!449149 () Bool)

(assert (=> b!311254 m!449149))

(declare-fun m!449151 () Bool)

(assert (=> b!311255 m!449151))

(declare-fun m!449153 () Bool)

(assert (=> b!311257 m!449153))

(declare-fun m!449155 () Bool)

(assert (=> b!311257 m!449155))

(declare-fun m!449157 () Bool)

(assert (=> start!69112 m!449157))

(declare-fun m!449159 () Bool)

(assert (=> start!69112 m!449159))

(push 1)

(assert (not b!311255))

(assert (not b!311254))

(assert (not b!311257))

(assert (not b!311256))

(assert (not start!69112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103194 () Bool)

(assert (=> d!103194 (= (array_inv!7800 (buf!7861 b1!97)) (bvsge (size!8248 (buf!7861 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311255 d!103194))

(declare-fun d!103198 () Bool)

(assert (=> d!103198 (= (array_inv!7800 (buf!7861 b2!97)) (bvsge (size!8248 (buf!7861 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311254 d!103198))

(declare-fun d!103200 () Bool)

(declare-fun e!223817 () Bool)

(assert (=> d!103200 e!223817))

(declare-fun res!255027 () Bool)

(assert (=> d!103200 (=> (not res!255027) (not e!223817))))

(declare-fun lt!440994 () (_ BitVec 64))

(declare-fun lt!440995 () (_ BitVec 64))

(declare-fun lt!440996 () (_ BitVec 64))

(assert (=> d!103200 (= res!255027 (= lt!440994 (bvsub lt!440996 lt!440995)))))

(assert (=> d!103200 (or (= (bvand lt!440996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440995 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440996 lt!440995) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!103200 (= lt!440995 (remainingBits!0 ((_ sign_extend 32) (size!8248 (buf!7861 b2!97))) ((_ sign_extend 32) (currentByte!14480 b2!97)) ((_ sign_extend 32) (currentBit!14475 b2!97))))))

(declare-fun lt!440993 () (_ BitVec 64))

(declare-fun lt!440991 () (_ BitVec 64))

(assert (=> d!103200 (= lt!440996 (bvmul lt!440993 lt!440991))))

(assert (=> d!103200 (or (= lt!440993 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!440991 (bvsdiv (bvmul lt!440993 lt!440991) lt!440993)))))

(assert (=> d!103200 (= lt!440991 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103200 (= lt!440993 ((_ sign_extend 32) (size!8248 (buf!7861 b2!97))))))

(assert (=> d!103200 (= lt!440994 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14480 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14475 b2!97))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103200 (invariant!0 (currentBit!14475 b2!97) (currentByte!14480 b2!97) (size!8248 (buf!7861 b2!97)))))

(assert (=> d!103200 (= (bitIndex!0 (size!8248 (buf!7861 b2!97)) (currentByte!14480 b2!97) (currentBit!14475 b2!97)) lt!440994)))

(declare-fun b!311293 () Bool)

(declare-fun res!255028 () Bool)

(assert (=> b!311293 (=> (not res!255028) (not e!223817))))

(assert (=> b!311293 (= res!255028 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!440994))))

(declare-fun b!311294 () Bool)

(declare-fun lt!440992 () (_ BitVec 64))

(assert (=> b!311294 (= e!223817 (bvsle lt!440994 (bvmul lt!440992 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311294 (or (= lt!440992 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!440992 #b0000000000000000000000000000000000000000000000000000000000001000) lt!440992)))))

(assert (=> b!311294 (= lt!440992 ((_ sign_extend 32) (size!8248 (buf!7861 b2!97))))))

(assert (= (and d!103200 res!255027) b!311293))

(assert (= (and b!311293 res!255028) b!311294))

(declare-fun m!449191 () Bool)

(assert (=> d!103200 m!449191))

(declare-fun m!449193 () Bool)

(assert (=> d!103200 m!449193))

(assert (=> b!311257 d!103200))

(declare-fun d!103208 () Bool)

(declare-fun e!223818 () Bool)

(assert (=> d!103208 e!223818))

(declare-fun res!255029 () Bool)

(assert (=> d!103208 (=> (not res!255029) (not e!223818))))

(declare-fun lt!441002 () (_ BitVec 64))

(declare-fun lt!441001 () (_ BitVec 64))

(declare-fun lt!441000 () (_ BitVec 64))

(assert (=> d!103208 (= res!255029 (= lt!441000 (bvsub lt!441002 lt!441001)))))

(assert (=> d!103208 (or (= (bvand lt!441002 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441002 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441002 lt!441001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103208 (= lt!441001 (remainingBits!0 ((_ sign_extend 32) (size!8248 (buf!7861 b1!97))) ((_ sign_extend 32) (currentByte!14480 b1!97)) ((_ sign_extend 32) (currentBit!14475 b1!97))))))

(declare-fun lt!440999 () (_ BitVec 64))

(declare-fun lt!440997 () (_ BitVec 64))

(assert (=> d!103208 (= lt!441002 (bvmul lt!440999 lt!440997))))

(assert (=> d!103208 (or (= lt!440999 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!440997 (bvsdiv (bvmul lt!440999 lt!440997) lt!440999)))))

(assert (=> d!103208 (= lt!440997 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103208 (= lt!440999 ((_ sign_extend 32) (size!8248 (buf!7861 b1!97))))))

(assert (=> d!103208 (= lt!441000 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14480 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14475 b1!97))))))

(assert (=> d!103208 (invariant!0 (currentBit!14475 b1!97) (currentByte!14480 b1!97) (size!8248 (buf!7861 b1!97)))))

(assert (=> d!103208 (= (bitIndex!0 (size!8248 (buf!7861 b1!97)) (currentByte!14480 b1!97) (currentBit!14475 b1!97)) lt!441000)))

(declare-fun b!311295 () Bool)

(declare-fun res!255030 () Bool)

(assert (=> b!311295 (=> (not res!255030) (not e!223818))))

(assert (=> b!311295 (= res!255030 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441000))))

(declare-fun b!311296 () Bool)

(declare-fun lt!440998 () (_ BitVec 64))

(assert (=> b!311296 (= e!223818 (bvsle lt!441000 (bvmul lt!440998 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311296 (or (= lt!440998 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!440998 #b0000000000000000000000000000000000000000000000000000000000001000) lt!440998)))))

(assert (=> b!311296 (= lt!440998 ((_ sign_extend 32) (size!8248 (buf!7861 b1!97))))))

(assert (= (and d!103208 res!255029) b!311295))

(assert (= (and b!311295 res!255030) b!311296))

(declare-fun m!449195 () Bool)

(assert (=> d!103208 m!449195))

(declare-fun m!449197 () Bool)

(assert (=> d!103208 m!449197))

(assert (=> b!311257 d!103208))

(declare-fun d!103210 () Bool)

(assert (=> d!103210 (= (inv!12 b1!97) (invariant!0 (currentBit!14475 b1!97) (currentByte!14480 b1!97) (size!8248 (buf!7861 b1!97))))))

(declare-fun bs!26712 () Bool)

(assert (= bs!26712 d!103210))

(assert (=> bs!26712 m!449197))

(assert (=> start!69112 d!103210))

(declare-fun d!103212 () Bool)

(assert (=> d!103212 (= (inv!12 b2!97) (invariant!0 (currentBit!14475 b2!97) (currentByte!14480 b2!97) (size!8248 (buf!7861 b2!97))))))

(declare-fun bs!26713 () Bool)

(assert (= bs!26713 d!103212))

(assert (=> bs!26713 m!449193))

(assert (=> start!69112 d!103212))

(declare-fun d!103214 () Bool)

(assert (=> d!103214 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8248 (buf!7861 b1!97))) ((_ sign_extend 32) (currentByte!14480 b1!97)) ((_ sign_extend 32) (currentBit!14475 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8248 (buf!7861 b1!97))) ((_ sign_extend 32) (currentByte!14480 b1!97)) ((_ sign_extend 32) (currentBit!14475 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26714 () Bool)

(assert (= bs!26714 d!103214))

(assert (=> bs!26714 m!449195))

(assert (=> b!311256 d!103214))

(push 1)

(assert (not d!103208))

(assert (not d!103212))

(assert (not d!103210))

(assert (not d!103214))

(assert (not d!103200))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103236 () Bool)

(assert (=> d!103236 (= (remainingBits!0 ((_ sign_extend 32) (size!8248 (buf!7861 b1!97))) ((_ sign_extend 32) (currentByte!14480 b1!97)) ((_ sign_extend 32) (currentBit!14475 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8248 (buf!7861 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14480 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14475 b1!97)))))))

(assert (=> d!103214 d!103236))

(declare-fun d!103238 () Bool)

(assert (=> d!103238 (= (invariant!0 (currentBit!14475 b2!97) (currentByte!14480 b2!97) (size!8248 (buf!7861 b2!97))) (and (bvsge (currentBit!14475 b2!97) #b00000000000000000000000000000000) (bvslt (currentBit!14475 b2!97) #b00000000000000000000000000001000) (bvsge (currentByte!14480 b2!97) #b00000000000000000000000000000000) (or (bvslt (currentByte!14480 b2!97) (size!8248 (buf!7861 b2!97))) (and (= (currentBit!14475 b2!97) #b00000000000000000000000000000000) (= (currentByte!14480 b2!97) (size!8248 (buf!7861 b2!97)))))))))

(assert (=> d!103212 d!103238))

(declare-fun d!103240 () Bool)

(assert (=> d!103240 (= (remainingBits!0 ((_ sign_extend 32) (size!8248 (buf!7861 b2!97))) ((_ sign_extend 32) (currentByte!14480 b2!97)) ((_ sign_extend 32) (currentBit!14475 b2!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8248 (buf!7861 b2!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14480 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14475 b2!97)))))))

(assert (=> d!103200 d!103240))

(assert (=> d!103200 d!103238))

(assert (=> d!103208 d!103236))

(declare-fun d!103242 () Bool)

(assert (=> d!103242 (= (invariant!0 (currentBit!14475 b1!97) (currentByte!14480 b1!97) (size!8248 (buf!7861 b1!97))) (and (bvsge (currentBit!14475 b1!97) #b00000000000000000000000000000000) (bvslt (currentBit!14475 b1!97) #b00000000000000000000000000001000) (bvsge (currentByte!14480 b1!97) #b00000000000000000000000000000000) (or (bvslt (currentByte!14480 b1!97) (size!8248 (buf!7861 b1!97))) (and (= (currentBit!14475 b1!97) #b00000000000000000000000000000000) (= (currentByte!14480 b1!97) (size!8248 (buf!7861 b1!97)))))))))

(assert (=> d!103208 d!103242))

(assert (=> d!103210 d!103242))

(push 1)

(check-sat)

(pop 1)

