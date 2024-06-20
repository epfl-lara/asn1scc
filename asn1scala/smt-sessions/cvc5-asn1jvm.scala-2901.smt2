; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69502 () Bool)

(assert start!69502)

(declare-fun b!312336 () Bool)

(declare-fun res!255833 () Bool)

(declare-fun e!224620 () Bool)

(assert (=> b!312336 (=> (not res!255833) (not e!224620))))

(declare-datatypes ((array!19123 0))(
  ( (array!19124 (arr!9370 (Array (_ BitVec 32) (_ BitVec 8))) (size!8290 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13684 0))(
  ( (BitStream!13685 (buf!7903 array!19123) (currentByte!14616 (_ BitVec 32)) (currentBit!14611 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13684)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312336 (= res!255833 (validate_offset_bits!1 ((_ sign_extend 32) (size!8290 (buf!7903 b1!97))) ((_ sign_extend 32) (currentByte!14616 b1!97)) ((_ sign_extend 32) (currentBit!14611 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312339 () Bool)

(declare-fun e!224622 () Bool)

(declare-fun b2!97 () BitStream!13684)

(declare-fun array_inv!7842 (array!19123) Bool)

(assert (=> b!312339 (= e!224622 (array_inv!7842 (buf!7903 b2!97)))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun lt!441913 () (_ BitVec 64))

(declare-fun lt!441914 () (_ BitVec 64))

(declare-fun b!312337 () Bool)

(assert (=> b!312337 (= e!224620 (and (= lt!441914 (bvand advancedAtMostBits!9 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!441914 (bvand (bvadd lt!441913 advancedAtMostBits!9) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!312337 (= lt!441914 (bvand lt!441913 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312337 (= lt!441913 (bitIndex!0 (size!8290 (buf!7903 b1!97)) (currentByte!14616 b1!97) (currentBit!14611 b1!97)))))

(declare-fun res!255832 () Bool)

(assert (=> start!69502 (=> (not res!255832) (not e!224620))))

(assert (=> start!69502 (= res!255832 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8290 (buf!7903 b1!97)) (size!8290 (buf!7903 b2!97)))))))

(assert (=> start!69502 e!224620))

(assert (=> start!69502 true))

(declare-fun e!224619 () Bool)

(declare-fun inv!12 (BitStream!13684) Bool)

(assert (=> start!69502 (and (inv!12 b1!97) e!224619)))

(assert (=> start!69502 (and (inv!12 b2!97) e!224622)))

(declare-fun b!312338 () Bool)

(assert (=> b!312338 (= e!224619 (array_inv!7842 (buf!7903 b1!97)))))

(assert (= (and start!69502 res!255832) b!312336))

(assert (= (and b!312336 res!255833) b!312337))

(assert (= start!69502 b!312338))

(assert (= start!69502 b!312339))

(declare-fun m!450011 () Bool)

(assert (=> b!312339 m!450011))

(declare-fun m!450013 () Bool)

(assert (=> b!312336 m!450013))

(declare-fun m!450015 () Bool)

(assert (=> b!312338 m!450015))

(declare-fun m!450017 () Bool)

(assert (=> b!312337 m!450017))

(declare-fun m!450019 () Bool)

(assert (=> start!69502 m!450019))

(declare-fun m!450021 () Bool)

(assert (=> start!69502 m!450021))

(push 1)

(assert (not b!312338))

(assert (not b!312337))

(assert (not b!312336))

(assert (not b!312339))

(assert (not start!69502))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103736 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!103736 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8290 (buf!7903 b1!97))) ((_ sign_extend 32) (currentByte!14616 b1!97)) ((_ sign_extend 32) (currentBit!14611 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8290 (buf!7903 b1!97))) ((_ sign_extend 32) (currentByte!14616 b1!97)) ((_ sign_extend 32) (currentBit!14611 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26842 () Bool)

(assert (= bs!26842 d!103736))

(declare-fun m!450051 () Bool)

(assert (=> bs!26842 m!450051))

(assert (=> b!312336 d!103736))

(declare-fun d!103738 () Bool)

(assert (=> d!103738 (= (array_inv!7842 (buf!7903 b2!97)) (bvsge (size!8290 (buf!7903 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!312339 d!103738))

(declare-fun d!103740 () Bool)

(assert (=> d!103740 (= (array_inv!7842 (buf!7903 b1!97)) (bvsge (size!8290 (buf!7903 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!312338 d!103740))

(declare-fun d!103742 () Bool)

(declare-fun e!224659 () Bool)

(assert (=> d!103742 e!224659))

(declare-fun res!255856 () Bool)

(assert (=> d!103742 (=> (not res!255856) (not e!224659))))

(declare-fun lt!441959 () (_ BitVec 64))

(declare-fun lt!441960 () (_ BitVec 64))

(declare-fun lt!441957 () (_ BitVec 64))

(assert (=> d!103742 (= res!255856 (= lt!441957 (bvsub lt!441959 lt!441960)))))

(assert (=> d!103742 (or (= (bvand lt!441959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441960 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441959 lt!441960) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103742 (= lt!441960 (remainingBits!0 ((_ sign_extend 32) (size!8290 (buf!7903 b1!97))) ((_ sign_extend 32) (currentByte!14616 b1!97)) ((_ sign_extend 32) (currentBit!14611 b1!97))))))

(declare-fun lt!441958 () (_ BitVec 64))

(declare-fun lt!441962 () (_ BitVec 64))

(assert (=> d!103742 (= lt!441959 (bvmul lt!441958 lt!441962))))

(assert (=> d!103742 (or (= lt!441958 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441962 (bvsdiv (bvmul lt!441958 lt!441962) lt!441958)))))

(assert (=> d!103742 (= lt!441962 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103742 (= lt!441958 ((_ sign_extend 32) (size!8290 (buf!7903 b1!97))))))

(assert (=> d!103742 (= lt!441957 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14616 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14611 b1!97))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103742 (invariant!0 (currentBit!14611 b1!97) (currentByte!14616 b1!97) (size!8290 (buf!7903 b1!97)))))

(assert (=> d!103742 (= (bitIndex!0 (size!8290 (buf!7903 b1!97)) (currentByte!14616 b1!97) (currentBit!14611 b1!97)) lt!441957)))

(declare-fun b!312374 () Bool)

(declare-fun res!255857 () Bool)

(assert (=> b!312374 (=> (not res!255857) (not e!224659))))

(assert (=> b!312374 (= res!255857 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441957))))

(declare-fun b!312375 () Bool)

(declare-fun lt!441961 () (_ BitVec 64))

(assert (=> b!312375 (= e!224659 (bvsle lt!441957 (bvmul lt!441961 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312375 (or (= lt!441961 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441961 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441961)))))

(assert (=> b!312375 (= lt!441961 ((_ sign_extend 32) (size!8290 (buf!7903 b1!97))))))

(assert (= (and d!103742 res!255856) b!312374))

(assert (= (and b!312374 res!255857) b!312375))

(assert (=> d!103742 m!450051))

(declare-fun m!450055 () Bool)

(assert (=> d!103742 m!450055))

(assert (=> b!312337 d!103742))

(declare-fun d!103750 () Bool)

(assert (=> d!103750 (= (inv!12 b1!97) (invariant!0 (currentBit!14611 b1!97) (currentByte!14616 b1!97) (size!8290 (buf!7903 b1!97))))))

(declare-fun bs!26844 () Bool)

(assert (= bs!26844 d!103750))

(assert (=> bs!26844 m!450055))

(assert (=> start!69502 d!103750))

(declare-fun d!103752 () Bool)

(assert (=> d!103752 (= (inv!12 b2!97) (invariant!0 (currentBit!14611 b2!97) (currentByte!14616 b2!97) (size!8290 (buf!7903 b2!97))))))

(declare-fun bs!26845 () Bool)

(assert (= bs!26845 d!103752))

(declare-fun m!450057 () Bool)

(assert (=> bs!26845 m!450057))

(assert (=> start!69502 d!103752))

(push 1)

(assert (not d!103742))

(assert (not d!103736))

(assert (not d!103752))

(assert (not d!103750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

