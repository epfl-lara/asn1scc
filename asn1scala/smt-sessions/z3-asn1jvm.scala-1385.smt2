; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38270 () Bool)

(assert start!38270)

(declare-fun b!172086 () Bool)

(declare-fun e!120245 () Bool)

(declare-datatypes ((array!9215 0))(
  ( (array!9216 (arr!5000 (Array (_ BitVec 32) (_ BitVec 8))) (size!4070 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7248 0))(
  ( (BitStream!7249 (buf!4498 array!9215) (currentByte!8553 (_ BitVec 32)) (currentBit!8548 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7248)

(declare-fun array_inv!3811 (array!9215) Bool)

(assert (=> b!172086 (= e!120245 (array_inv!3811 (buf!4498 thiss!1817)))))

(declare-fun res!142581 () Bool)

(declare-fun e!120246 () Bool)

(assert (=> start!38270 (=> (not res!142581) (not e!120246))))

(declare-fun nBits!575 () (_ BitVec 32))

(assert (=> start!38270 (= res!142581 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000)))))

(assert (=> start!38270 e!120246))

(assert (=> start!38270 true))

(declare-fun inv!12 (BitStream!7248) Bool)

(assert (=> start!38270 (and (inv!12 thiss!1817) e!120245)))

(declare-fun b!172083 () Bool)

(declare-fun res!142579 () Bool)

(assert (=> b!172083 (=> (not res!142579) (not e!120246))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172083 (= res!142579 (validate_offset_bits!1 ((_ sign_extend 32) (size!4070 (buf!4498 thiss!1817))) ((_ sign_extend 32) (currentByte!8553 thiss!1817)) ((_ sign_extend 32) (currentBit!8548 thiss!1817)) ((_ sign_extend 32) nBits!575)))))

(declare-fun b!172084 () Bool)

(declare-fun res!142580 () Bool)

(assert (=> b!172084 (=> (not res!142580) (not e!120246))))

(declare-datatypes ((tuple2!14788 0))(
  ( (tuple2!14789 (_1!8036 (_ BitVec 64)) (_2!8036 BitStream!7248)) )
))
(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!7248 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!14788)

(assert (=> b!172084 (= res!142580 (= (buf!4498 (_2!8036 (readNLeastSignificantBitsLoop!0 thiss!1817 nBits!575 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))) (buf!4498 thiss!1817)))))

(declare-fun lt!265141 () (_ BitVec 64))

(declare-fun lt!265142 () (_ BitVec 64))

(declare-fun b!172085 () Bool)

(assert (=> b!172085 (= e!120246 (and (= lt!265142 (bvand ((_ sign_extend 32) nBits!575) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!265142 (bvand (bvadd lt!265141 ((_ sign_extend 32) nBits!575)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!172085 (= lt!265142 (bvand lt!265141 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172085 (= lt!265141 (bitIndex!0 (size!4070 (buf!4498 thiss!1817)) (currentByte!8553 thiss!1817) (currentBit!8548 thiss!1817)))))

(assert (= (and start!38270 res!142581) b!172083))

(assert (= (and b!172083 res!142579) b!172084))

(assert (= (and b!172084 res!142580) b!172085))

(assert (= start!38270 b!172086))

(declare-fun m!271287 () Bool)

(assert (=> b!172085 m!271287))

(declare-fun m!271289 () Bool)

(assert (=> b!172084 m!271289))

(declare-fun m!271291 () Bool)

(assert (=> b!172083 m!271291))

(declare-fun m!271293 () Bool)

(assert (=> start!38270 m!271293))

(declare-fun m!271295 () Bool)

(assert (=> b!172086 m!271295))

(check-sat (not b!172085) (not b!172086) (not b!172084) (not b!172083) (not start!38270))
(check-sat)
(get-model)

(declare-fun d!61005 () Bool)

(assert (=> d!61005 (= (array_inv!3811 (buf!4498 thiss!1817)) (bvsge (size!4070 (buf!4498 thiss!1817)) #b00000000000000000000000000000000))))

(assert (=> b!172086 d!61005))

(declare-fun d!61007 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!61007 (= (inv!12 thiss!1817) (invariant!0 (currentBit!8548 thiss!1817) (currentByte!8553 thiss!1817) (size!4070 (buf!4498 thiss!1817))))))

(declare-fun bs!15171 () Bool)

(assert (= bs!15171 d!61007))

(declare-fun m!271307 () Bool)

(assert (=> bs!15171 m!271307))

(assert (=> start!38270 d!61007))

(declare-fun d!61009 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61009 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4070 (buf!4498 thiss!1817))) ((_ sign_extend 32) (currentByte!8553 thiss!1817)) ((_ sign_extend 32) (currentBit!8548 thiss!1817)) ((_ sign_extend 32) nBits!575)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4070 (buf!4498 thiss!1817))) ((_ sign_extend 32) (currentByte!8553 thiss!1817)) ((_ sign_extend 32) (currentBit!8548 thiss!1817))) ((_ sign_extend 32) nBits!575)))))

(declare-fun bs!15172 () Bool)

(assert (= bs!15172 d!61009))

(declare-fun m!271309 () Bool)

(assert (=> bs!15172 m!271309))

(assert (=> b!172083 d!61009))

(declare-fun b!172141 () Bool)

(declare-fun res!142623 () Bool)

(declare-fun e!120277 () Bool)

(assert (=> b!172141 (=> (not res!142623) (not e!120277))))

(declare-fun lt!265206 () tuple2!14788)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172141 (= res!142623 (= (bvand (_1!8036 lt!265206) (onesLSBLong!0 nBits!575)) (_1!8036 lt!265206)))))

(declare-fun b!172142 () Bool)

(declare-fun res!142621 () Bool)

(assert (=> b!172142 (=> (not res!142621) (not e!120277))))

(declare-fun lt!265210 () (_ BitVec 64))

(declare-fun lt!265211 () (_ BitVec 64))

(assert (=> b!172142 (= res!142621 (= (bitIndex!0 (size!4070 (buf!4498 (_2!8036 lt!265206))) (currentByte!8553 (_2!8036 lt!265206)) (currentBit!8548 (_2!8036 lt!265206))) (bvadd lt!265211 lt!265210)))))

(assert (=> b!172142 (or (not (= (bvand lt!265211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265210 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!265211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!265211 lt!265210) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!172142 (= lt!265210 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172142 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172142 (= lt!265211 (bitIndex!0 (size!4070 (buf!4498 thiss!1817)) (currentByte!8553 thiss!1817) (currentBit!8548 thiss!1817)))))

(declare-fun b!172143 () Bool)

(declare-fun e!120275 () tuple2!14788)

(assert (=> b!172143 (= e!120275 (tuple2!14789 #b0000000000000000000000000000000000000000000000000000000000000000 thiss!1817))))

(declare-fun b!172144 () Bool)

(declare-fun res!142625 () Bool)

(assert (=> b!172144 (=> (not res!142625) (not e!120277))))

(declare-fun lt!265205 () (_ BitVec 64))

(declare-fun lt!265208 () (_ BitVec 64))

(assert (=> b!172144 (= res!142625 (= (bvlshr (_1!8036 lt!265206) lt!265208) (bvlshr #b0000000000000000000000000000000000000000000000000000000000000000 lt!265205)))))

(assert (=> b!172144 (and (bvsge lt!265205 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265205 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!172144 (= lt!265205 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172144 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172144 (and (bvsge lt!265208 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265208 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!172144 (= lt!265208 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172144 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(declare-fun d!61011 () Bool)

(assert (=> d!61011 e!120277))

(declare-fun res!142624 () Bool)

(assert (=> d!61011 (=> (not res!142624) (not e!120277))))

(assert (=> d!61011 (= res!142624 (= (buf!4498 (_2!8036 lt!265206)) (buf!4498 thiss!1817)))))

(assert (=> d!61011 (= lt!265206 e!120275)))

(declare-fun c!9058 () Bool)

(assert (=> d!61011 (= c!9058 (= nBits!575 #b00000000000000000000000000000000))))

(assert (=> d!61011 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!575) (bvsle nBits!575 #b00000000000000000000000001000000))))

(assert (=> d!61011 (= (readNLeastSignificantBitsLoop!0 thiss!1817 nBits!575 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) lt!265206)))

(declare-fun b!172145 () Bool)

(declare-fun e!120276 () Bool)

(assert (=> b!172145 (= e!120277 e!120276)))

(declare-fun res!142622 () Bool)

(assert (=> b!172145 (=> res!142622 e!120276)))

(assert (=> b!172145 (= res!142622 (bvsge #b00000000000000000000000000000000 nBits!575))))

(declare-fun b!172146 () Bool)

(declare-fun lt!265204 () tuple2!14788)

(assert (=> b!172146 (= e!120275 (tuple2!14789 (_1!8036 lt!265204) (_2!8036 lt!265204)))))

(declare-datatypes ((tuple2!14792 0))(
  ( (tuple2!14793 (_1!8038 Bool) (_2!8038 BitStream!7248)) )
))
(declare-fun lt!265207 () tuple2!14792)

(declare-fun readBit!0 (BitStream!7248) tuple2!14792)

(assert (=> b!172146 (= lt!265207 (readBit!0 thiss!1817))))

(assert (=> b!172146 (= lt!265204 (readNLeastSignificantBitsLoop!0 (_2!8038 lt!265207) nBits!575 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!8038 lt!265207) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!575 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172147 () Bool)

(declare-fun lt!265203 () (_ BitVec 64))

(declare-datatypes ((tuple2!14796 0))(
  ( (tuple2!14797 (_1!8040 BitStream!7248) (_2!8040 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!7248) tuple2!14796)

(assert (=> b!172147 (= e!120276 (= (= (bvand (bvlshr (_1!8036 lt!265206) lt!265203) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!8040 (readBitPure!0 thiss!1817))))))

(assert (=> b!172147 (and (bvsge lt!265203 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265203 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!265209 () (_ BitVec 32))

(assert (=> b!172147 (= lt!265203 ((_ sign_extend 32) (bvsub lt!265209 #b00000000000000000000000000000000)))))

(assert (=> b!172147 (or (= (bvand lt!265209 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand lt!265209 #b10000000000000000000000000000000) (bvand (bvsub lt!265209 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172147 (= lt!265209 (bvsub nBits!575 #b00000000000000000000000000000001))))

(assert (=> b!172147 (or (= (bvand nBits!575 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(assert (= (and d!61011 c!9058) b!172143))

(assert (= (and d!61011 (not c!9058)) b!172146))

(assert (= (and d!61011 res!142624) b!172142))

(assert (= (and b!172142 res!142621) b!172144))

(assert (= (and b!172144 res!142625) b!172141))

(assert (= (and b!172141 res!142623) b!172145))

(assert (= (and b!172145 (not res!142622)) b!172147))

(declare-fun m!271313 () Bool)

(assert (=> b!172141 m!271313))

(declare-fun m!271315 () Bool)

(assert (=> b!172142 m!271315))

(assert (=> b!172142 m!271287))

(declare-fun m!271317 () Bool)

(assert (=> b!172146 m!271317))

(declare-fun m!271319 () Bool)

(assert (=> b!172146 m!271319))

(declare-fun m!271321 () Bool)

(assert (=> b!172147 m!271321))

(assert (=> b!172084 d!61011))

(declare-fun d!61017 () Bool)

(declare-fun e!120286 () Bool)

(assert (=> d!61017 e!120286))

(declare-fun res!142640 () Bool)

(assert (=> d!61017 (=> (not res!142640) (not e!120286))))

(declare-fun lt!265243 () (_ BitVec 64))

(declare-fun lt!265245 () (_ BitVec 64))

(declare-fun lt!265242 () (_ BitVec 64))

(assert (=> d!61017 (= res!142640 (= lt!265243 (bvsub lt!265242 lt!265245)))))

(assert (=> d!61017 (or (= (bvand lt!265242 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265245 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!265242 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!265242 lt!265245) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61017 (= lt!265245 (remainingBits!0 ((_ sign_extend 32) (size!4070 (buf!4498 thiss!1817))) ((_ sign_extend 32) (currentByte!8553 thiss!1817)) ((_ sign_extend 32) (currentBit!8548 thiss!1817))))))

(declare-fun lt!265244 () (_ BitVec 64))

(declare-fun lt!265246 () (_ BitVec 64))

(assert (=> d!61017 (= lt!265242 (bvmul lt!265244 lt!265246))))

(assert (=> d!61017 (or (= lt!265244 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!265246 (bvsdiv (bvmul lt!265244 lt!265246) lt!265244)))))

(assert (=> d!61017 (= lt!265246 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61017 (= lt!265244 ((_ sign_extend 32) (size!4070 (buf!4498 thiss!1817))))))

(assert (=> d!61017 (= lt!265243 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8553 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8548 thiss!1817))))))

(assert (=> d!61017 (invariant!0 (currentBit!8548 thiss!1817) (currentByte!8553 thiss!1817) (size!4070 (buf!4498 thiss!1817)))))

(assert (=> d!61017 (= (bitIndex!0 (size!4070 (buf!4498 thiss!1817)) (currentByte!8553 thiss!1817) (currentBit!8548 thiss!1817)) lt!265243)))

(declare-fun b!172166 () Bool)

(declare-fun res!142641 () Bool)

(assert (=> b!172166 (=> (not res!142641) (not e!120286))))

(assert (=> b!172166 (= res!142641 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!265243))))

(declare-fun b!172167 () Bool)

(declare-fun lt!265247 () (_ BitVec 64))

(assert (=> b!172167 (= e!120286 (bvsle lt!265243 (bvmul lt!265247 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!172167 (or (= lt!265247 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!265247 #b0000000000000000000000000000000000000000000000000000000000001000) lt!265247)))))

(assert (=> b!172167 (= lt!265247 ((_ sign_extend 32) (size!4070 (buf!4498 thiss!1817))))))

(assert (= (and d!61017 res!142640) b!172166))

(assert (= (and b!172166 res!142641) b!172167))

(assert (=> d!61017 m!271309))

(assert (=> d!61017 m!271307))

(assert (=> b!172085 d!61017))

(check-sat (not b!172142) (not b!172141) (not b!172146) (not d!61009) (not d!61017) (not d!61007) (not b!172147))
