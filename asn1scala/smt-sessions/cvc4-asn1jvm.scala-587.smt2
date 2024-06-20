; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16868 () Bool)

(assert start!16868)

(declare-fun b!82927 () Bool)

(declare-fun res!68280 () Bool)

(declare-fun e!54960 () Bool)

(assert (=> b!82927 (=> (not res!68280) (not e!54960))))

(declare-datatypes ((array!3771 0))(
  ( (array!3772 (arr!2357 (Array (_ BitVec 32) (_ BitVec 8))) (size!1720 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3002 0))(
  ( (BitStream!3003 (buf!2110 array!3771) (currentByte!4168 (_ BitVec 32)) (currentBit!4163 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3002)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82927 (= res!68280 (validate_offset_bits!1 ((_ sign_extend 32) (size!1720 (buf!2110 b1!98))) ((_ sign_extend 32) (currentByte!4168 b1!98)) ((_ sign_extend 32) (currentBit!4163 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82929 () Bool)

(declare-fun e!54961 () Bool)

(declare-fun b2!98 () BitStream!3002)

(declare-fun array_inv!1566 (array!3771) Bool)

(assert (=> b!82929 (= e!54961 (array_inv!1566 (buf!2110 b2!98)))))

(declare-fun b!82930 () Bool)

(declare-fun e!54959 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!82930 (= e!54959 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4163 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4168 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1720 (buf!2110 b2!98))))))))

(declare-fun b!82931 () Bool)

(declare-fun e!54958 () Bool)

(assert (=> b!82931 (= e!54960 e!54958)))

(declare-fun res!68281 () Bool)

(assert (=> b!82931 (=> (not res!68281) (not e!54958))))

(declare-fun lt!132163 () (_ BitVec 64))

(declare-fun lt!132164 () (_ BitVec 64))

(assert (=> b!82931 (= res!68281 (= lt!132163 lt!132164))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82931 (= lt!132164 (bitIndex!0 (size!1720 (buf!2110 b2!98)) (currentByte!4168 b2!98) (currentBit!4163 b2!98)))))

(declare-fun lt!132162 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> b!82931 (= lt!132163 (bvadd lt!132162 b1b2Diff!1))))

(assert (=> b!82931 (= lt!132162 (bitIndex!0 (size!1720 (buf!2110 b1!98)) (currentByte!4168 b1!98) (currentBit!4163 b1!98)))))

(declare-fun b!82932 () Bool)

(declare-fun e!54962 () Bool)

(assert (=> b!82932 (= e!54962 (array_inv!1566 (buf!2110 b1!98)))))

(declare-fun b!82933 () Bool)

(declare-fun e!54956 () Bool)

(assert (=> b!82933 (= e!54956 e!54959)))

(declare-fun res!68278 () Bool)

(assert (=> b!82933 (=> res!68278 e!54959)))

(declare-fun lt!132167 () (_ BitVec 64))

(declare-fun lt!132161 () (_ BitVec 64))

(assert (=> b!82933 (= res!68278 (or (not (= lt!132167 (bvsub lt!132161 lt!132163))) (bvslt lt!132167 (bvsub b1ValidateOffsetBits!11 b1b2Diff!1)) (bvsgt ((_ sign_extend 32) (size!1720 (buf!2110 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4168 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4163 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1720 (buf!2110 b2!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4168 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4163 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!82933 (= lt!132167 (bvsub lt!132161 lt!132164))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82933 (= lt!132167 (remainingBits!0 ((_ sign_extend 32) (size!1720 (buf!2110 b2!98))) ((_ sign_extend 32) (currentByte!4168 b2!98)) ((_ sign_extend 32) (currentBit!4163 b2!98))))))

(assert (=> b!82933 (= lt!132161 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1720 (buf!2110 b2!98)))))))

(declare-datatypes ((Unit!5549 0))(
  ( (Unit!5550) )
))
(declare-fun lt!132165 () Unit!5549)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3002) Unit!5549)

(assert (=> b!82933 (= lt!132165 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!82928 () Bool)

(assert (=> b!82928 (= e!54958 (not e!54956))))

(declare-fun res!68277 () Bool)

(assert (=> b!82928 (=> res!68277 e!54956)))

(declare-fun lt!132168 () (_ BitVec 64))

(assert (=> b!82928 (= res!68277 (bvsgt lt!132162 (bvsub lt!132168 b1ValidateOffsetBits!11)))))

(assert (=> b!82928 (= (remainingBits!0 ((_ sign_extend 32) (size!1720 (buf!2110 b1!98))) ((_ sign_extend 32) (currentByte!4168 b1!98)) ((_ sign_extend 32) (currentBit!4163 b1!98))) (bvsub lt!132168 lt!132162))))

(assert (=> b!82928 (= lt!132168 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1720 (buf!2110 b1!98)))))))

(declare-fun lt!132166 () Unit!5549)

(assert (=> b!82928 (= lt!132166 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun res!68279 () Bool)

(assert (=> start!16868 (=> (not res!68279) (not e!54960))))

(assert (=> start!16868 (= res!68279 (and (= (size!1720 (buf!2110 b1!98)) (size!1720 (buf!2110 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16868 e!54960))

(declare-fun inv!12 (BitStream!3002) Bool)

(assert (=> start!16868 (and (inv!12 b1!98) e!54962)))

(assert (=> start!16868 (and (inv!12 b2!98) e!54961)))

(assert (=> start!16868 true))

(assert (= (and start!16868 res!68279) b!82927))

(assert (= (and b!82927 res!68280) b!82931))

(assert (= (and b!82931 res!68281) b!82928))

(assert (= (and b!82928 (not res!68277)) b!82933))

(assert (= (and b!82933 (not res!68278)) b!82930))

(assert (= start!16868 b!82932))

(assert (= start!16868 b!82929))

(declare-fun m!129441 () Bool)

(assert (=> b!82933 m!129441))

(declare-fun m!129443 () Bool)

(assert (=> b!82933 m!129443))

(declare-fun m!129445 () Bool)

(assert (=> b!82932 m!129445))

(declare-fun m!129447 () Bool)

(assert (=> b!82931 m!129447))

(declare-fun m!129449 () Bool)

(assert (=> b!82931 m!129449))

(declare-fun m!129451 () Bool)

(assert (=> b!82930 m!129451))

(declare-fun m!129453 () Bool)

(assert (=> b!82929 m!129453))

(declare-fun m!129455 () Bool)

(assert (=> b!82928 m!129455))

(declare-fun m!129457 () Bool)

(assert (=> b!82928 m!129457))

(declare-fun m!129459 () Bool)

(assert (=> start!16868 m!129459))

(declare-fun m!129461 () Bool)

(assert (=> start!16868 m!129461))

(declare-fun m!129463 () Bool)

(assert (=> b!82927 m!129463))

(push 1)

(assert (not b!82931))

(assert (not b!82927))

(assert (not b!82932))

(assert (not b!82930))

(assert (not b!82929))

(assert (not b!82928))

(assert (not start!16868))

(assert (not b!82933))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26426 () Bool)

(declare-fun e!54974 () Bool)

(assert (=> d!26426 e!54974))

(declare-fun res!68302 () Bool)

(assert (=> d!26426 (=> (not res!68302) (not e!54974))))

(declare-fun lt!132274 () (_ BitVec 64))

(declare-fun lt!132270 () (_ BitVec 64))

(declare-fun lt!132269 () (_ BitVec 64))

(assert (=> d!26426 (= res!68302 (= lt!132274 (bvsub lt!132269 lt!132270)))))

(assert (=> d!26426 (or (= (bvand lt!132269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132270 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132269 lt!132270) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26426 (= lt!132270 (remainingBits!0 ((_ sign_extend 32) (size!1720 (buf!2110 b2!98))) ((_ sign_extend 32) (currentByte!4168 b2!98)) ((_ sign_extend 32) (currentBit!4163 b2!98))))))

(declare-fun lt!132271 () (_ BitVec 64))

(declare-fun lt!132273 () (_ BitVec 64))

(assert (=> d!26426 (= lt!132269 (bvmul lt!132271 lt!132273))))

(assert (=> d!26426 (or (= lt!132271 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132273 (bvsdiv (bvmul lt!132271 lt!132273) lt!132271)))))

(assert (=> d!26426 (= lt!132273 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26426 (= lt!132271 ((_ sign_extend 32) (size!1720 (buf!2110 b2!98))))))

(assert (=> d!26426 (= lt!132274 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4168 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4163 b2!98))))))

(assert (=> d!26426 (invariant!0 (currentBit!4163 b2!98) (currentByte!4168 b2!98) (size!1720 (buf!2110 b2!98)))))

(assert (=> d!26426 (= (bitIndex!0 (size!1720 (buf!2110 b2!98)) (currentByte!4168 b2!98) (currentBit!4163 b2!98)) lt!132274)))

(declare-fun b!82956 () Bool)

(declare-fun res!68303 () Bool)

(assert (=> b!82956 (=> (not res!68303) (not e!54974))))

(assert (=> b!82956 (= res!68303 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132274))))

(declare-fun b!82957 () Bool)

(declare-fun lt!132272 () (_ BitVec 64))

(assert (=> b!82957 (= e!54974 (bvsle lt!132274 (bvmul lt!132272 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82957 (or (= lt!132272 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132272 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132272)))))

(assert (=> b!82957 (= lt!132272 ((_ sign_extend 32) (size!1720 (buf!2110 b2!98))))))

(assert (= (and d!26426 res!68302) b!82956))

(assert (= (and b!82956 res!68303) b!82957))

(assert (=> d!26426 m!129441))

(declare-fun m!129481 () Bool)

(assert (=> d!26426 m!129481))

(assert (=> b!82931 d!26426))

(declare-fun d!26442 () Bool)

(declare-fun e!54975 () Bool)

(assert (=> d!26442 e!54975))

(declare-fun res!68304 () Bool)

(assert (=> d!26442 (=> (not res!68304) (not e!54975))))

(declare-fun lt!132280 () (_ BitVec 64))

(declare-fun lt!132276 () (_ BitVec 64))

(declare-fun lt!132275 () (_ BitVec 64))

(assert (=> d!26442 (= res!68304 (= lt!132280 (bvsub lt!132275 lt!132276)))))

(assert (=> d!26442 (or (= (bvand lt!132275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132276 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132275 lt!132276) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26442 (= lt!132276 (remainingBits!0 ((_ sign_extend 32) (size!1720 (buf!2110 b1!98))) ((_ sign_extend 32) (currentByte!4168 b1!98)) ((_ sign_extend 32) (currentBit!4163 b1!98))))))

(declare-fun lt!132277 () (_ BitVec 64))

(declare-fun lt!132279 () (_ BitVec 64))

(assert (=> d!26442 (= lt!132275 (bvmul lt!132277 lt!132279))))

(assert (=> d!26442 (or (= lt!132277 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132279 (bvsdiv (bvmul lt!132277 lt!132279) lt!132277)))))

(assert (=> d!26442 (= lt!132279 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26442 (= lt!132277 ((_ sign_extend 32) (size!1720 (buf!2110 b1!98))))))

(assert (=> d!26442 (= lt!132280 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4168 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4163 b1!98))))))

(assert (=> d!26442 (invariant!0 (currentBit!4163 b1!98) (currentByte!4168 b1!98) (size!1720 (buf!2110 b1!98)))))

(assert (=> d!26442 (= (bitIndex!0 (size!1720 (buf!2110 b1!98)) (currentByte!4168 b1!98) (currentBit!4163 b1!98)) lt!132280)))

(declare-fun b!82958 () Bool)

(declare-fun res!68305 () Bool)

(assert (=> b!82958 (=> (not res!68305) (not e!54975))))

(assert (=> b!82958 (= res!68305 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132280))))

(declare-fun b!82959 () Bool)

(declare-fun lt!132278 () (_ BitVec 64))

(assert (=> b!82959 (= e!54975 (bvsle lt!132280 (bvmul lt!132278 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82959 (or (= lt!132278 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132278 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132278)))))

(assert (=> b!82959 (= lt!132278 ((_ sign_extend 32) (size!1720 (buf!2110 b1!98))))))

(assert (= (and d!26442 res!68304) b!82958))

(assert (= (and b!82958 res!68305) b!82959))

(assert (=> d!26442 m!129455))

(declare-fun m!129483 () Bool)

(assert (=> d!26442 m!129483))

(assert (=> b!82931 d!26442))

(declare-fun d!26444 () Bool)

(assert (=> d!26444 (= (remainingBits!0 ((_ sign_extend 32) (size!1720 (buf!2110 b2!98))) ((_ sign_extend 32) (currentByte!4168 b2!98)) ((_ sign_extend 32) (currentBit!4163 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1720 (buf!2110 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4168 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4163 b2!98)))))))

(assert (=> b!82933 d!26444))

(declare-fun d!26446 () Bool)

(declare-fun lt!132295 () (_ BitVec 64))

(declare-fun lt!132291 () (_ BitVec 64))

(assert (=> d!26446 (= (remainingBits!0 ((_ sign_extend 32) (size!1720 (buf!2110 b2!98))) ((_ sign_extend 32) (currentByte!4168 b2!98)) ((_ sign_extend 32) (currentBit!4163 b2!98))) (bvsub lt!132295 lt!132291))))

(assert (=> d!26446 (or (= (bvand lt!132295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132291 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132295 lt!132291) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26446 (= lt!132291 (bitIndex!0 (size!1720 (buf!2110 b2!98)) (currentByte!4168 b2!98) (currentBit!4163 b2!98)))))

(declare-fun lt!132293 () (_ BitVec 64))

(declare-fun lt!132292 () (_ BitVec 64))

(assert (=> d!26446 (= lt!132295 (bvmul lt!132293 lt!132292))))

