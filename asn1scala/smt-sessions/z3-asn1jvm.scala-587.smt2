; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16866 () Bool)

(assert start!16866)

(declare-fun b!82906 () Bool)

(declare-fun e!54936 () Bool)

(declare-datatypes ((array!3769 0))(
  ( (array!3770 (arr!2356 (Array (_ BitVec 32) (_ BitVec 8))) (size!1719 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3000 0))(
  ( (BitStream!3001 (buf!2109 array!3769) (currentByte!4167 (_ BitVec 32)) (currentBit!4162 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3000)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!82906 (= e!54936 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4162 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4167 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1719 (buf!2109 b2!98))))))))

(declare-fun b!82907 () Bool)

(declare-fun res!68264 () Bool)

(declare-fun e!54938 () Bool)

(assert (=> b!82907 (=> (not res!68264) (not e!54938))))

(declare-fun b1!98 () BitStream!3000)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82907 (= res!68264 (validate_offset_bits!1 ((_ sign_extend 32) (size!1719 (buf!2109 b1!98))) ((_ sign_extend 32) (currentByte!4167 b1!98)) ((_ sign_extend 32) (currentBit!4162 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82908 () Bool)

(declare-fun e!54935 () Bool)

(declare-fun array_inv!1565 (array!3769) Bool)

(assert (=> b!82908 (= e!54935 (array_inv!1565 (buf!2109 b2!98)))))

(declare-fun b!82909 () Bool)

(declare-fun e!54932 () Bool)

(declare-fun e!54933 () Bool)

(assert (=> b!82909 (= e!54932 (not e!54933))))

(declare-fun res!68262 () Bool)

(assert (=> b!82909 (=> res!68262 e!54933)))

(declare-fun lt!132142 () (_ BitVec 64))

(declare-fun lt!132138 () (_ BitVec 64))

(assert (=> b!82909 (= res!68262 (bvsgt lt!132138 (bvsub lt!132142 b1ValidateOffsetBits!11)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82909 (= (remainingBits!0 ((_ sign_extend 32) (size!1719 (buf!2109 b1!98))) ((_ sign_extend 32) (currentByte!4167 b1!98)) ((_ sign_extend 32) (currentBit!4162 b1!98))) (bvsub lt!132142 lt!132138))))

(assert (=> b!82909 (= lt!132142 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1719 (buf!2109 b1!98)))))))

(declare-datatypes ((Unit!5547 0))(
  ( (Unit!5548) )
))
(declare-fun lt!132143 () Unit!5547)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3000) Unit!5547)

(assert (=> b!82909 (= lt!132143 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun res!68265 () Bool)

(assert (=> start!16866 (=> (not res!68265) (not e!54938))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> start!16866 (= res!68265 (and (= (size!1719 (buf!2109 b1!98)) (size!1719 (buf!2109 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16866 e!54938))

(declare-fun e!54934 () Bool)

(declare-fun inv!12 (BitStream!3000) Bool)

(assert (=> start!16866 (and (inv!12 b1!98) e!54934)))

(assert (=> start!16866 (and (inv!12 b2!98) e!54935)))

(assert (=> start!16866 true))

(declare-fun b!82910 () Bool)

(assert (=> b!82910 (= e!54933 e!54936)))

(declare-fun res!68266 () Bool)

(assert (=> b!82910 (=> res!68266 e!54936)))

(declare-fun lt!132140 () (_ BitVec 64))

(declare-fun lt!132139 () (_ BitVec 64))

(declare-fun lt!132144 () (_ BitVec 64))

(assert (=> b!82910 (= res!68266 (or (not (= lt!132144 (bvsub lt!132140 lt!132139))) (bvslt lt!132144 (bvsub b1ValidateOffsetBits!11 b1b2Diff!1)) (bvsgt ((_ sign_extend 32) (size!1719 (buf!2109 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4167 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4162 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1719 (buf!2109 b2!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4167 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4162 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!132137 () (_ BitVec 64))

(assert (=> b!82910 (= lt!132144 (bvsub lt!132140 lt!132137))))

(assert (=> b!82910 (= lt!132144 (remainingBits!0 ((_ sign_extend 32) (size!1719 (buf!2109 b2!98))) ((_ sign_extend 32) (currentByte!4167 b2!98)) ((_ sign_extend 32) (currentBit!4162 b2!98))))))

(assert (=> b!82910 (= lt!132140 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1719 (buf!2109 b2!98)))))))

(declare-fun lt!132141 () Unit!5547)

(assert (=> b!82910 (= lt!132141 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!82911 () Bool)

(assert (=> b!82911 (= e!54934 (array_inv!1565 (buf!2109 b1!98)))))

(declare-fun b!82912 () Bool)

(assert (=> b!82912 (= e!54938 e!54932)))

(declare-fun res!68263 () Bool)

(assert (=> b!82912 (=> (not res!68263) (not e!54932))))

(assert (=> b!82912 (= res!68263 (= lt!132139 lt!132137))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82912 (= lt!132137 (bitIndex!0 (size!1719 (buf!2109 b2!98)) (currentByte!4167 b2!98) (currentBit!4162 b2!98)))))

(assert (=> b!82912 (= lt!132139 (bvadd lt!132138 b1b2Diff!1))))

(assert (=> b!82912 (= lt!132138 (bitIndex!0 (size!1719 (buf!2109 b1!98)) (currentByte!4167 b1!98) (currentBit!4162 b1!98)))))

(assert (= (and start!16866 res!68265) b!82907))

(assert (= (and b!82907 res!68264) b!82912))

(assert (= (and b!82912 res!68263) b!82909))

(assert (= (and b!82909 (not res!68262)) b!82910))

(assert (= (and b!82910 (not res!68266)) b!82906))

(assert (= start!16866 b!82911))

(assert (= start!16866 b!82908))

(declare-fun m!129417 () Bool)

(assert (=> start!16866 m!129417))

(declare-fun m!129419 () Bool)

(assert (=> start!16866 m!129419))

(declare-fun m!129421 () Bool)

(assert (=> b!82908 m!129421))

(declare-fun m!129423 () Bool)

(assert (=> b!82909 m!129423))

(declare-fun m!129425 () Bool)

(assert (=> b!82909 m!129425))

(declare-fun m!129427 () Bool)

(assert (=> b!82907 m!129427))

(declare-fun m!129429 () Bool)

(assert (=> b!82906 m!129429))

(declare-fun m!129431 () Bool)

(assert (=> b!82911 m!129431))

(declare-fun m!129433 () Bool)

(assert (=> b!82912 m!129433))

(declare-fun m!129435 () Bool)

(assert (=> b!82912 m!129435))

(declare-fun m!129437 () Bool)

(assert (=> b!82910 m!129437))

(declare-fun m!129439 () Bool)

(assert (=> b!82910 m!129439))

(check-sat (not start!16866) (not b!82907) (not b!82909) (not b!82912) (not b!82908) (not b!82910) (not b!82906) (not b!82911))
(check-sat)
(get-model)

(declare-fun d!26392 () Bool)

(assert (=> d!26392 (= (remainingBits!0 ((_ sign_extend 32) (size!1719 (buf!2109 b2!98))) ((_ sign_extend 32) (currentByte!4167 b2!98)) ((_ sign_extend 32) (currentBit!4162 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1719 (buf!2109 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4167 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4162 b2!98)))))))

(assert (=> b!82910 d!26392))

(declare-fun d!26394 () Bool)

(declare-fun lt!132180 () (_ BitVec 64))

(declare-fun lt!132181 () (_ BitVec 64))

(assert (=> d!26394 (= (remainingBits!0 ((_ sign_extend 32) (size!1719 (buf!2109 b2!98))) ((_ sign_extend 32) (currentByte!4167 b2!98)) ((_ sign_extend 32) (currentBit!4162 b2!98))) (bvsub lt!132180 lt!132181))))

(assert (=> d!26394 (or (= (bvand lt!132180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132181 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132180 lt!132181) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26394 (= lt!132181 (bitIndex!0 (size!1719 (buf!2109 b2!98)) (currentByte!4167 b2!98) (currentBit!4162 b2!98)))))

(declare-fun lt!132182 () (_ BitVec 64))

(declare-fun lt!132183 () (_ BitVec 64))

(assert (=> d!26394 (= lt!132180 (bvmul lt!132182 lt!132183))))

(assert (=> d!26394 (or (= lt!132182 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132183 (bvsdiv (bvmul lt!132182 lt!132183) lt!132182)))))

(assert (=> d!26394 (= lt!132183 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26394 (= lt!132182 ((_ sign_extend 32) (size!1719 (buf!2109 b2!98))))))

(declare-fun lt!132179 () Unit!5547)

(declare-fun choose!23 (BitStream!3000) Unit!5547)

(assert (=> d!26394 (= lt!132179 (choose!23 b2!98))))

(assert (=> d!26394 (= (remainingBitsBitIndexLemma!0 b2!98) lt!132179)))

(declare-fun bs!6478 () Bool)

(assert (= bs!6478 d!26394))

(assert (=> bs!6478 m!129437))

(assert (=> bs!6478 m!129433))

(declare-fun m!129465 () Bool)

(assert (=> bs!6478 m!129465))

(assert (=> b!82910 d!26394))

(declare-fun d!26396 () Bool)

(assert (=> d!26396 (= (remainingBits!0 ((_ sign_extend 32) (size!1719 (buf!2109 b1!98))) ((_ sign_extend 32) (currentByte!4167 b1!98)) ((_ sign_extend 32) (currentBit!4162 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1719 (buf!2109 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4167 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4162 b1!98)))))))

(assert (=> b!82909 d!26396))

(declare-fun d!26398 () Bool)

(declare-fun lt!132185 () (_ BitVec 64))

(declare-fun lt!132186 () (_ BitVec 64))

(assert (=> d!26398 (= (remainingBits!0 ((_ sign_extend 32) (size!1719 (buf!2109 b1!98))) ((_ sign_extend 32) (currentByte!4167 b1!98)) ((_ sign_extend 32) (currentBit!4162 b1!98))) (bvsub lt!132185 lt!132186))))

(assert (=> d!26398 (or (= (bvand lt!132185 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132186 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132185 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132185 lt!132186) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26398 (= lt!132186 (bitIndex!0 (size!1719 (buf!2109 b1!98)) (currentByte!4167 b1!98) (currentBit!4162 b1!98)))))

(declare-fun lt!132187 () (_ BitVec 64))

(declare-fun lt!132188 () (_ BitVec 64))

(assert (=> d!26398 (= lt!132185 (bvmul lt!132187 lt!132188))))

(assert (=> d!26398 (or (= lt!132187 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132188 (bvsdiv (bvmul lt!132187 lt!132188) lt!132187)))))

(assert (=> d!26398 (= lt!132188 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26398 (= lt!132187 ((_ sign_extend 32) (size!1719 (buf!2109 b1!98))))))

(declare-fun lt!132184 () Unit!5547)

(assert (=> d!26398 (= lt!132184 (choose!23 b1!98))))

(assert (=> d!26398 (= (remainingBitsBitIndexLemma!0 b1!98) lt!132184)))

(declare-fun bs!6479 () Bool)

(assert (= bs!6479 d!26398))

(assert (=> bs!6479 m!129423))

(assert (=> bs!6479 m!129435))

(declare-fun m!129467 () Bool)

(assert (=> bs!6479 m!129467))

(assert (=> b!82909 d!26398))

(declare-fun d!26400 () Bool)

(assert (=> d!26400 (= (array_inv!1565 (buf!2109 b1!98)) (bvsge (size!1719 (buf!2109 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82911 d!26400))

(declare-fun d!26402 () Bool)

(assert (=> d!26402 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4162 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4167 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1719 (buf!2109 b2!98))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4162 b2!98))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4162 b2!98))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4167 b2!98))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4167 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1719 (buf!2109 b2!98))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4162 b2!98))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4167 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1719 (buf!2109 b2!98)))))))))))

(assert (=> b!82906 d!26402))

(declare-fun d!26404 () Bool)

(assert (=> d!26404 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1719 (buf!2109 b1!98))) ((_ sign_extend 32) (currentByte!4167 b1!98)) ((_ sign_extend 32) (currentBit!4162 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1719 (buf!2109 b1!98))) ((_ sign_extend 32) (currentByte!4167 b1!98)) ((_ sign_extend 32) (currentBit!4162 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6480 () Bool)

(assert (= bs!6480 d!26404))

(assert (=> bs!6480 m!129423))

(assert (=> b!82907 d!26404))

(declare-fun d!26406 () Bool)

(declare-fun e!54966 () Bool)

(assert (=> d!26406 e!54966))

(declare-fun res!68286 () Bool)

(assert (=> d!26406 (=> (not res!68286) (not e!54966))))

(declare-fun lt!132203 () (_ BitVec 64))

(declare-fun lt!132205 () (_ BitVec 64))

(declare-fun lt!132206 () (_ BitVec 64))

(assert (=> d!26406 (= res!68286 (= lt!132205 (bvsub lt!132206 lt!132203)))))

(assert (=> d!26406 (or (= (bvand lt!132206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132203 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132206 lt!132203) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26406 (= lt!132203 (remainingBits!0 ((_ sign_extend 32) (size!1719 (buf!2109 b2!98))) ((_ sign_extend 32) (currentByte!4167 b2!98)) ((_ sign_extend 32) (currentBit!4162 b2!98))))))

(declare-fun lt!132204 () (_ BitVec 64))

(declare-fun lt!132201 () (_ BitVec 64))

(assert (=> d!26406 (= lt!132206 (bvmul lt!132204 lt!132201))))

(assert (=> d!26406 (or (= lt!132204 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132201 (bvsdiv (bvmul lt!132204 lt!132201) lt!132204)))))

(assert (=> d!26406 (= lt!132201 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26406 (= lt!132204 ((_ sign_extend 32) (size!1719 (buf!2109 b2!98))))))

(assert (=> d!26406 (= lt!132205 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4167 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4162 b2!98))))))

(assert (=> d!26406 (invariant!0 (currentBit!4162 b2!98) (currentByte!4167 b2!98) (size!1719 (buf!2109 b2!98)))))

(assert (=> d!26406 (= (bitIndex!0 (size!1719 (buf!2109 b2!98)) (currentByte!4167 b2!98) (currentBit!4162 b2!98)) lt!132205)))

(declare-fun b!82939 () Bool)

(declare-fun res!68287 () Bool)

(assert (=> b!82939 (=> (not res!68287) (not e!54966))))

(assert (=> b!82939 (= res!68287 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132205))))

(declare-fun b!82940 () Bool)

(declare-fun lt!132202 () (_ BitVec 64))

(assert (=> b!82940 (= e!54966 (bvsle lt!132205 (bvmul lt!132202 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82940 (or (= lt!132202 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132202 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132202)))))

(assert (=> b!82940 (= lt!132202 ((_ sign_extend 32) (size!1719 (buf!2109 b2!98))))))

(assert (= (and d!26406 res!68286) b!82939))

(assert (= (and b!82939 res!68287) b!82940))

(assert (=> d!26406 m!129437))

(declare-fun m!129469 () Bool)

(assert (=> d!26406 m!129469))

(assert (=> b!82912 d!26406))

(declare-fun d!26408 () Bool)

(declare-fun e!54967 () Bool)

(assert (=> d!26408 e!54967))

(declare-fun res!68288 () Bool)

(assert (=> d!26408 (=> (not res!68288) (not e!54967))))

(declare-fun lt!132209 () (_ BitVec 64))

(declare-fun lt!132211 () (_ BitVec 64))

(declare-fun lt!132212 () (_ BitVec 64))

(assert (=> d!26408 (= res!68288 (= lt!132211 (bvsub lt!132212 lt!132209)))))

(assert (=> d!26408 (or (= (bvand lt!132212 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132209 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132212 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132212 lt!132209) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26408 (= lt!132209 (remainingBits!0 ((_ sign_extend 32) (size!1719 (buf!2109 b1!98))) ((_ sign_extend 32) (currentByte!4167 b1!98)) ((_ sign_extend 32) (currentBit!4162 b1!98))))))

(declare-fun lt!132210 () (_ BitVec 64))

(declare-fun lt!132207 () (_ BitVec 64))

(assert (=> d!26408 (= lt!132212 (bvmul lt!132210 lt!132207))))

(assert (=> d!26408 (or (= lt!132210 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132207 (bvsdiv (bvmul lt!132210 lt!132207) lt!132210)))))

(assert (=> d!26408 (= lt!132207 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26408 (= lt!132210 ((_ sign_extend 32) (size!1719 (buf!2109 b1!98))))))

(assert (=> d!26408 (= lt!132211 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4167 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4162 b1!98))))))

(assert (=> d!26408 (invariant!0 (currentBit!4162 b1!98) (currentByte!4167 b1!98) (size!1719 (buf!2109 b1!98)))))

(assert (=> d!26408 (= (bitIndex!0 (size!1719 (buf!2109 b1!98)) (currentByte!4167 b1!98) (currentBit!4162 b1!98)) lt!132211)))

(declare-fun b!82941 () Bool)

(declare-fun res!68289 () Bool)

(assert (=> b!82941 (=> (not res!68289) (not e!54967))))

(assert (=> b!82941 (= res!68289 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132211))))

(declare-fun b!82942 () Bool)

(declare-fun lt!132208 () (_ BitVec 64))

(assert (=> b!82942 (= e!54967 (bvsle lt!132211 (bvmul lt!132208 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82942 (or (= lt!132208 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132208 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132208)))))

(assert (=> b!82942 (= lt!132208 ((_ sign_extend 32) (size!1719 (buf!2109 b1!98))))))

(assert (= (and d!26408 res!68288) b!82941))

(assert (= (and b!82941 res!68289) b!82942))

(assert (=> d!26408 m!129423))

(declare-fun m!129471 () Bool)

(assert (=> d!26408 m!129471))

(assert (=> b!82912 d!26408))

(declare-fun d!26410 () Bool)

(assert (=> d!26410 (= (inv!12 b1!98) (invariant!0 (currentBit!4162 b1!98) (currentByte!4167 b1!98) (size!1719 (buf!2109 b1!98))))))

(declare-fun bs!6481 () Bool)

(assert (= bs!6481 d!26410))

(assert (=> bs!6481 m!129471))

(assert (=> start!16866 d!26410))

(declare-fun d!26412 () Bool)

(assert (=> d!26412 (= (inv!12 b2!98) (invariant!0 (currentBit!4162 b2!98) (currentByte!4167 b2!98) (size!1719 (buf!2109 b2!98))))))

(declare-fun bs!6482 () Bool)

(assert (= bs!6482 d!26412))

(assert (=> bs!6482 m!129469))

(assert (=> start!16866 d!26412))

(declare-fun d!26414 () Bool)

(assert (=> d!26414 (= (array_inv!1565 (buf!2109 b2!98)) (bvsge (size!1719 (buf!2109 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82908 d!26414))

(check-sat (not d!26412) (not d!26398) (not d!26406) (not d!26404) (not d!26410) (not d!26394) (not d!26408))
