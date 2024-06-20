; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18726 () Bool)

(assert start!18726)

(declare-fun b!93077 () Bool)

(declare-fun res!76817 () Bool)

(declare-fun e!61141 () Bool)

(assert (=> b!93077 (=> (not res!76817) (not e!61141))))

(declare-datatypes ((array!4357 0))(
  ( (array!4358 (arr!2594 (Array (_ BitVec 32) (_ BitVec 8))) (size!1974 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3476 0))(
  ( (BitStream!3477 (buf!2347 array!4357) (currentByte!4680 (_ BitVec 32)) (currentBit!4675 (_ BitVec 32))) )
))
(declare-fun bitStream2!8 () BitStream!3476)

(assert (=> b!93077 (= res!76817 (and (bvsle ((_ sign_extend 32) (size!1974 (buf!2347 bitStream2!8))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4680 bitStream2!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4675 bitStream2!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1974 (buf!2347 bitStream2!8))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4680 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4675 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!93078 () Bool)

(declare-fun e!61142 () Bool)

(declare-fun array_inv!1803 (array!4357) Bool)

(assert (=> b!93078 (= e!61142 (array_inv!1803 (buf!2347 bitStream2!8)))))

(declare-fun b!93079 () Bool)

(declare-fun res!76824 () Bool)

(assert (=> b!93079 (=> (not res!76824) (not e!61141))))

(declare-fun bitStream1!8 () BitStream!3476)

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!93079 (= res!76824 (validate_offset_bits!1 ((_ sign_extend 32) (size!1974 (buf!2347 bitStream1!8))) ((_ sign_extend 32) (currentByte!4680 bitStream1!8)) ((_ sign_extend 32) (currentBit!4675 bitStream1!8)) nBits!484))))

(declare-fun b!93080 () Bool)

(declare-fun res!76820 () Bool)

(assert (=> b!93080 (=> (not res!76820) (not e!61141))))

(declare-fun base!8 () BitStream!3476)

(declare-fun isPrefixOf!0 (BitStream!3476 BitStream!3476) Bool)

(assert (=> b!93080 (= res!76820 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!93081 () Bool)

(declare-fun res!76823 () Bool)

(assert (=> b!93081 (=> (not res!76823) (not e!61141))))

(assert (=> b!93081 (= res!76823 (and (= (buf!2347 bitStream1!8) (buf!2347 bitStream2!8)) (= (buf!2347 bitStream1!8) (buf!2347 base!8))))))

(declare-fun b!93082 () Bool)

(declare-fun res!76822 () Bool)

(assert (=> b!93082 (=> (not res!76822) (not e!61141))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93082 (= res!76822 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1974 (buf!2347 bitStream1!8)) (currentByte!4680 bitStream1!8) (currentBit!4675 bitStream1!8))) (bitIndex!0 (size!1974 (buf!2347 bitStream2!8)) (currentByte!4680 bitStream2!8) (currentBit!4675 bitStream2!8))))))

(declare-fun b!93084 () Bool)

(declare-fun res!76819 () Bool)

(assert (=> b!93084 (=> (not res!76819) (not e!61141))))

(assert (=> b!93084 (= res!76819 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!93085 () Bool)

(declare-fun e!61143 () Bool)

(assert (=> b!93085 (= e!61143 (array_inv!1803 (buf!2347 base!8)))))

(declare-fun b!93086 () Bool)

(declare-fun res!76821 () Bool)

(assert (=> b!93086 (=> (not res!76821) (not e!61141))))

(declare-datatypes ((List!844 0))(
  ( (Nil!841) (Cons!840 (h!959 Bool) (t!1594 List!844)) )
))
(declare-fun listBits!13 () List!844)

(declare-fun length!435 (List!844) Int)

(assert (=> b!93086 (= res!76821 (> (length!435 listBits!13) 0))))

(declare-fun b!93087 () Bool)

(declare-fun res!76818 () Bool)

(assert (=> b!93087 (=> (not res!76818) (not e!61141))))

(assert (=> b!93087 (= res!76818 (bvslt (bitIndex!0 (size!1974 (buf!2347 base!8)) (currentByte!4680 base!8) (currentBit!4675 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!93083 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!93083 (= e!61141 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4675 bitStream2!8))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4680 bitStream2!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1974 (buf!2347 bitStream2!8)))))))))

(declare-fun res!76815 () Bool)

(assert (=> start!18726 (=> (not res!76815) (not e!61141))))

(assert (=> start!18726 (= res!76815 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18726 e!61141))

(assert (=> start!18726 true))

(declare-fun e!61139 () Bool)

(declare-fun inv!12 (BitStream!3476) Bool)

(assert (=> start!18726 (and (inv!12 bitStream1!8) e!61139)))

(assert (=> start!18726 (and (inv!12 bitStream2!8) e!61142)))

(assert (=> start!18726 (and (inv!12 base!8) e!61143)))

(declare-fun b!93088 () Bool)

(assert (=> b!93088 (= e!61139 (array_inv!1803 (buf!2347 bitStream1!8)))))

(declare-fun b!93089 () Bool)

(declare-fun res!76816 () Bool)

(assert (=> b!93089 (=> (not res!76816) (not e!61141))))

(assert (=> b!93089 (= res!76816 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(assert (= (and start!18726 res!76815) b!93086))

(assert (= (and b!93086 res!76821) b!93080))

(assert (= (and b!93080 res!76820) b!93084))

(assert (= (and b!93084 res!76819) b!93089))

(assert (= (and b!93089 res!76816) b!93081))

(assert (= (and b!93081 res!76823) b!93087))

(assert (= (and b!93087 res!76818) b!93082))

(assert (= (and b!93082 res!76822) b!93079))

(assert (= (and b!93079 res!76824) b!93077))

(assert (= (and b!93077 res!76817) b!93083))

(assert (= start!18726 b!93088))

(assert (= start!18726 b!93078))

(assert (= start!18726 b!93085))

(declare-fun m!136925 () Bool)

(assert (=> b!93084 m!136925))

(declare-fun m!136927 () Bool)

(assert (=> b!93082 m!136927))

(declare-fun m!136929 () Bool)

(assert (=> b!93082 m!136929))

(declare-fun m!136931 () Bool)

(assert (=> b!93086 m!136931))

(declare-fun m!136933 () Bool)

(assert (=> b!93079 m!136933))

(declare-fun m!136935 () Bool)

(assert (=> b!93085 m!136935))

(declare-fun m!136937 () Bool)

(assert (=> b!93089 m!136937))

(declare-fun m!136939 () Bool)

(assert (=> start!18726 m!136939))

(declare-fun m!136941 () Bool)

(assert (=> start!18726 m!136941))

(declare-fun m!136943 () Bool)

(assert (=> start!18726 m!136943))

(declare-fun m!136945 () Bool)

(assert (=> b!93087 m!136945))

(declare-fun m!136947 () Bool)

(assert (=> b!93088 m!136947))

(declare-fun m!136949 () Bool)

(assert (=> b!93083 m!136949))

(declare-fun m!136951 () Bool)

(assert (=> b!93078 m!136951))

(declare-fun m!136953 () Bool)

(assert (=> b!93080 m!136953))

(push 1)

(assert (not start!18726))

(assert (not b!93089))

(assert (not b!93086))

(assert (not b!93087))

(assert (not b!93084))

(assert (not b!93085))

(assert (not b!93088))

(assert (not b!93078))

(assert (not b!93080))

(assert (not b!93079))

(assert (not b!93083))

(assert (not b!93082))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!29028 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29028 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1974 (buf!2347 bitStream1!8))) ((_ sign_extend 32) (currentByte!4680 bitStream1!8)) ((_ sign_extend 32) (currentBit!4675 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1974 (buf!2347 bitStream1!8))) ((_ sign_extend 32) (currentByte!4680 bitStream1!8)) ((_ sign_extend 32) (currentBit!4675 bitStream1!8))) nBits!484))))

(declare-fun bs!7138 () Bool)

(assert (= bs!7138 d!29028))

(declare-fun m!136975 () Bool)

(assert (=> bs!7138 m!136975))

(assert (=> b!93079 d!29028))

(declare-fun d!29030 () Bool)

(declare-fun res!76858 () Bool)

(declare-fun e!61164 () Bool)

(assert (=> d!29030 (=> (not res!76858) (not e!61164))))

(assert (=> d!29030 (= res!76858 (= (size!1974 (buf!2347 bitStream1!8)) (size!1974 (buf!2347 base!8))))))

(assert (=> d!29030 (= (isPrefixOf!0 bitStream1!8 base!8) e!61164)))

(declare-fun b!93121 () Bool)

(declare-fun res!76856 () Bool)

(assert (=> b!93121 (=> (not res!76856) (not e!61164))))

(assert (=> b!93121 (= res!76856 (bvsle (bitIndex!0 (size!1974 (buf!2347 bitStream1!8)) (currentByte!4680 bitStream1!8) (currentBit!4675 bitStream1!8)) (bitIndex!0 (size!1974 (buf!2347 base!8)) (currentByte!4680 base!8) (currentBit!4675 base!8))))))

(declare-fun b!93122 () Bool)

(declare-fun e!61163 () Bool)

(assert (=> b!93122 (= e!61164 e!61163)))

(declare-fun res!76857 () Bool)

(assert (=> b!93122 (=> res!76857 e!61163)))

(assert (=> b!93122 (= res!76857 (= (size!1974 (buf!2347 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!93123 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4357 array!4357 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!93123 (= e!61163 (arrayBitRangesEq!0 (buf!2347 bitStream1!8) (buf!2347 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1974 (buf!2347 bitStream1!8)) (currentByte!4680 bitStream1!8) (currentBit!4675 bitStream1!8))))))

(assert (= (and d!29030 res!76858) b!93121))

(assert (= (and b!93121 res!76856) b!93122))

(assert (= (and b!93122 (not res!76857)) b!93123))

(assert (=> b!93121 m!136927))

(assert (=> b!93121 m!136945))

(assert (=> b!93123 m!136927))

(assert (=> b!93123 m!136927))

(declare-fun m!136977 () Bool)

(assert (=> b!93123 m!136977))

(assert (=> b!93080 d!29030))

(declare-fun d!29032 () Bool)

(declare-fun e!61175 () Bool)

(assert (=> d!29032 e!61175))

(declare-fun res!76877 () Bool)

(assert (=> d!29032 (=> (not res!76877) (not e!61175))))

(declare-fun lt!138404 () (_ BitVec 64))

(declare-fun lt!138405 () (_ BitVec 64))

(declare-fun lt!138403 () (_ BitVec 64))

(assert (=> d!29032 (= res!76877 (= lt!138403 (bvsub lt!138405 lt!138404)))))

(assert (=> d!29032 (or (= (bvand lt!138405 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138404 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138405 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138405 lt!138404) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29032 (= lt!138404 (remainingBits!0 ((_ sign_extend 32) (size!1974 (buf!2347 base!8))) ((_ sign_extend 32) (currentByte!4680 base!8)) ((_ sign_extend 32) (currentBit!4675 base!8))))))

(declare-fun lt!138408 () (_ BitVec 64))

(declare-fun lt!138406 () (_ BitVec 64))

(assert (=> d!29032 (= lt!138405 (bvmul lt!138408 lt!138406))))

(assert (=> d!29032 (or (= lt!138408 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138406 (bvsdiv (bvmul lt!138408 lt!138406) lt!138408)))))

(assert (=> d!29032 (= lt!138406 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29032 (= lt!138408 ((_ sign_extend 32) (size!1974 (buf!2347 base!8))))))

(assert (=> d!29032 (= lt!138403 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4680 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4675 base!8))))))

(assert (=> d!29032 (invariant!0 (currentBit!4675 base!8) (currentByte!4680 base!8) (size!1974 (buf!2347 base!8)))))

(assert (=> d!29032 (= (bitIndex!0 (size!1974 (buf!2347 base!8)) (currentByte!4680 base!8) (currentBit!4675 base!8)) lt!138403)))

(declare-fun b!93142 () Bool)

(declare-fun res!76878 () Bool)

(assert (=> b!93142 (=> (not res!76878) (not e!61175))))

(assert (=> b!93142 (= res!76878 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138403))))

(declare-fun b!93143 () Bool)

(declare-fun lt!138407 () (_ BitVec 64))

(assert (=> b!93143 (= e!61175 (bvsle lt!138403 (bvmul lt!138407 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!93143 (or (= lt!138407 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138407 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138407)))))

(assert (=> b!93143 (= lt!138407 ((_ sign_extend 32) (size!1974 (buf!2347 base!8))))))

(assert (= (and d!29032 res!76877) b!93142))

(assert (= (and b!93142 res!76878) b!93143))

(declare-fun m!136987 () Bool)

(assert (=> d!29032 m!136987))

(declare-fun m!136989 () Bool)

(assert (=> d!29032 m!136989))

(assert (=> b!93087 d!29032))

(declare-fun d!29038 () Bool)

(assert (=> d!29038 (= (array_inv!1803 (buf!2347 bitStream2!8)) (bvsge (size!1974 (buf!2347 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!93078 d!29038))

(declare-fun d!29040 () Bool)

(declare-fun res!76884 () Bool)

(declare-fun e!61179 () Bool)

(assert (=> d!29040 (=> (not res!76884) (not e!61179))))

(assert (=> d!29040 (= res!76884 (= (size!1974 (buf!2347 bitStream1!8)) (size!1974 (buf!2347 bitStream2!8))))))

(assert (=> d!29040 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!61179)))

(declare-fun b!93147 () Bool)

(declare-fun res!76882 () Bool)

(assert (=> b!93147 (=> (not res!76882) (not e!61179))))

(assert (=> b!93147 (= res!76882 (bvsle (bitIndex!0 (size!1974 (buf!2347 bitStream1!8)) (currentByte!4680 bitStream1!8) (currentBit!4675 bitStream1!8)) (bitIndex!0 (size!1974 (buf!2347 bitStream2!8)) (currentByte!4680 bitStream2!8) (currentBit!4675 bitStream2!8))))))

(declare-fun b!93148 () Bool)

(declare-fun e!61178 () Bool)

(assert (=> b!93148 (= e!61179 e!61178)))

(declare-fun res!76883 () Bool)

(assert (=> b!93148 (=> res!76883 e!61178)))

(assert (=> b!93148 (= res!76883 (= (size!1974 (buf!2347 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!93149 () Bool)

(assert (=> b!93149 (= e!61178 (arrayBitRangesEq!0 (buf!2347 bitStream1!8) (buf!2347 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1974 (buf!2347 bitStream1!8)) (currentByte!4680 bitStream1!8) (currentBit!4675 bitStream1!8))))))

(assert (= (and d!29040 res!76884) b!93147))

(assert (= (and b!93147 res!76882) b!93148))

(assert (= (and b!93148 (not res!76883)) b!93149))

(assert (=> b!93147 m!136927))

(assert (=> b!93147 m!136929))

(assert (=> b!93149 m!136927))

(assert (=> b!93149 m!136927))

(declare-fun m!136993 () Bool)

(assert (=> b!93149 m!136993))

(assert (=> b!93089 d!29040))

(declare-fun d!29044 () Bool)

(assert (=> d!29044 (= (array_inv!1803 (buf!2347 bitStream1!8)) (bvsge (size!1974 (buf!2347 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!93088 d!29044))

(declare-fun d!29046 () Bool)

(assert (=> d!29046 (= (array_inv!1803 (buf!2347 base!8)) (bvsge (size!1974 (buf!2347 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!93085 d!29046))

(declare-fun d!29048 () Bool)

(declare-fun res!76887 () Bool)

(declare-fun e!61181 () Bool)

(assert (=> d!29048 (=> (not res!76887) (not e!61181))))

(assert (=> d!29048 (= res!76887 (= (size!1974 (buf!2347 bitStream2!8)) (size!1974 (buf!2347 base!8))))))

(assert (=> d!29048 (= (isPrefixOf!0 bitStream2!8 base!8) e!61181)))

(declare-fun b!93150 () Bool)

(declare-fun res!76885 () Bool)

(assert (=> b!93150 (=> (not res!76885) (not e!61181))))

(assert (=> b!93150 (= res!76885 (bvsle (bitIndex!0 (size!1974 (buf!2347 bitStream2!8)) (currentByte!4680 bitStream2!8) (currentBit!4675 bitStream2!8)) (bitIndex!0 (size!1974 (buf!2347 base!8)) (currentByte!4680 base!8) (currentBit!4675 base!8))))))

(declare-fun b!93151 () Bool)

(declare-fun e!61180 () Bool)

(assert (=> b!93151 (= e!61181 e!61180)))

(declare-fun res!76886 () Bool)

(assert (=> b!93151 (=> res!76886 e!61180)))

(assert (=> b!93151 (= res!76886 (= (size!1974 (buf!2347 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!93152 () Bool)

(assert (=> b!93152 (= e!61180 (arrayBitRangesEq!0 (buf!2347 bitStream2!8) (buf!2347 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1974 (buf!2347 bitStream2!8)) (currentByte!4680 bitStream2!8) (currentBit!4675 bitStream2!8))))))

(assert (= (and d!29048 res!76887) b!93150))

(assert (= (and b!93150 res!76885) b!93151))

(assert (= (and b!93151 (not res!76886)) b!93152))

(assert (=> b!93150 m!136929))

(assert (=> b!93150 m!136945))

(assert (=> b!93152 m!136929))

(assert (=> b!93152 m!136929))

(declare-fun m!136995 () Bool)

(assert (=> b!93152 m!136995))

(assert (=> b!93084 d!29048))

(declare-fun d!29050 () Bool)

(assert (=> d!29050 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4675 bitStream1!8) (currentByte!4680 bitStream1!8) (size!1974 (buf!2347 bitStream1!8))))))

(declare-fun bs!7140 () Bool)

(assert (= bs!7140 d!29050))

(declare-fun m!136997 () Bool)

(assert (=> bs!7140 m!136997))

(assert (=> start!18726 d!29050))

(declare-fun d!29056 () Bool)

(assert (=> d!29056 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4675 bitStream2!8) (currentByte!4680 bitStream2!8) (size!1974 (buf!2347 bitStream2!8))))))

(declare-fun bs!7141 () Bool)

(assert (= bs!7141 d!29056))

(declare-fun m!136999 () Bool)

(assert (=> bs!7141 m!136999))

(assert (=> start!18726 d!29056))

(declare-fun d!29058 () Bool)

(assert (=> d!29058 (= (inv!12 base!8) (invariant!0 (currentBit!4675 base!8) (currentByte!4680 base!8) (size!1974 (buf!2347 base!8))))))

(declare-fun bs!7142 () Bool)

(assert (= bs!7142 d!29058))

(assert (=> bs!7142 m!136989))

(assert (=> start!18726 d!29058))

(declare-fun d!29060 () Bool)

(declare-fun size!1977 (List!844) Int)

(assert (=> d!29060 (= (length!435 listBits!13) (size!1977 listBits!13))))

(declare-fun bs!7143 () Bool)

(assert (= bs!7143 d!29060))

(declare-fun m!137001 () Bool)

(assert (=> bs!7143 m!137001))

(assert (=> b!93086 d!29060))

(declare-fun d!29062 () Bool)

(declare-fun e!61182 () Bool)

(assert (=> d!29062 e!61182))

(declare-fun res!76888 () Bool)

(assert (=> d!29062 (=> (not res!76888) (not e!61182))))

(declare-fun lt!138409 () (_ BitVec 64))

(declare-fun lt!138411 () (_ BitVec 64))

(declare-fun lt!138410 () (_ BitVec 64))

(assert (=> d!29062 (= res!76888 (= lt!138409 (bvsub lt!138411 lt!138410)))))

(assert (=> d!29062 (or (= (bvand lt!138411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138410 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138411 lt!138410) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29062 (= lt!138410 (remainingBits!0 ((_ sign_extend 32) (size!1974 (buf!2347 bitStream1!8))) ((_ sign_extend 32) (currentByte!4680 bitStream1!8)) ((_ sign_extend 32) (currentBit!4675 bitStream1!8))))))

(declare-fun lt!138414 () (_ BitVec 64))

(declare-fun lt!138412 () (_ BitVec 64))

(assert (=> d!29062 (= lt!138411 (bvmul lt!138414 lt!138412))))

(assert (=> d!29062 (or (= lt!138414 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138412 (bvsdiv (bvmul lt!138414 lt!138412) lt!138414)))))

(assert (=> d!29062 (= lt!138412 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29062 (= lt!138414 ((_ sign_extend 32) (size!1974 (buf!2347 bitStream1!8))))))

(assert (=> d!29062 (= lt!138409 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4680 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4675 bitStream1!8))))))

(assert (=> d!29062 (invariant!0 (currentBit!4675 bitStream1!8) (currentByte!4680 bitStream1!8) (size!1974 (buf!2347 bitStream1!8)))))

(assert (=> d!29062 (= (bitIndex!0 (size!1974 (buf!2347 bitStream1!8)) (currentByte!4680 bitStream1!8) (currentBit!4675 bitStream1!8)) lt!138409)))

(declare-fun b!93153 () Bool)

(declare-fun res!76889 () Bool)

(assert (=> b!93153 (=> (not res!76889) (not e!61182))))

(assert (=> b!93153 (= res!76889 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138409))))

(declare-fun b!93154 () Bool)

(declare-fun lt!138413 () (_ BitVec 64))

(assert (=> b!93154 (= e!61182 (bvsle lt!138409 (bvmul lt!138413 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!93154 (or (= lt!138413 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138413 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138413)))))

(assert (=> b!93154 (= lt!138413 ((_ sign_extend 32) (size!1974 (buf!2347 bitStream1!8))))))

(assert (= (and d!29062 res!76888) b!93153))

(assert (= (and b!93153 res!76889) b!93154))

(assert (=> d!29062 m!136975))

(assert (=> d!29062 m!136997))

(assert (=> b!93082 d!29062))

(declare-fun d!29064 () Bool)

(declare-fun e!61183 () Bool)

(assert (=> d!29064 e!61183))

(declare-fun res!76890 () Bool)

(assert (=> d!29064 (=> (not res!76890) (not e!61183))))

(declare-fun lt!138415 () (_ BitVec 64))

(declare-fun lt!138416 () (_ BitVec 64))

(declare-fun lt!138417 () (_ BitVec 64))

(assert (=> d!29064 (= res!76890 (= lt!138415 (bvsub lt!138417 lt!138416)))))

(assert (=> d!29064 (or (= (bvand lt!138417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138416 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138417 lt!138416) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29064 (= lt!138416 (remainingBits!0 ((_ sign_extend 32) (size!1974 (buf!2347 bitStream2!8))) ((_ sign_extend 32) (currentByte!4680 bitStream2!8)) ((_ sign_extend 32) (currentBit!4675 bitStream2!8))))))

(declare-fun lt!138420 () (_ BitVec 64))

(declare-fun lt!138418 () (_ BitVec 64))

(assert (=> d!29064 (= lt!138417 (bvmul lt!138420 lt!138418))))

(assert (=> d!29064 (or (= lt!138420 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138418 (bvsdiv (bvmul lt!138420 lt!138418) lt!138420)))))

(assert (=> d!29064 (= lt!138418 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29064 (= lt!138420 ((_ sign_extend 32) (size!1974 (buf!2347 bitStream2!8))))))

(assert (=> d!29064 (= lt!138415 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4680 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4675 bitStream2!8))))))

(assert (=> d!29064 (invariant!0 (currentBit!4675 bitStream2!8) (currentByte!4680 bitStream2!8) (size!1974 (buf!2347 bitStream2!8)))))

(assert (=> d!29064 (= (bitIndex!0 (size!1974 (buf!2347 bitStream2!8)) (currentByte!4680 bitStream2!8) (currentBit!4675 bitStream2!8)) lt!138415)))

(declare-fun b!93155 () Bool)

(declare-fun res!76891 () Bool)

(assert (=> b!93155 (=> (not res!76891) (not e!61183))))

(assert (=> b!93155 (= res!76891 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138415))))

(declare-fun b!93156 () Bool)

(declare-fun lt!138419 () (_ BitVec 64))

(assert (=> b!93156 (= e!61183 (bvsle lt!138415 (bvmul lt!138419 #b0000000000000000000000000000000000000000000000000000000000001000)))))

