; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16470 () Bool)

(assert start!16470)

(declare-fun b!82083 () Bool)

(declare-fun res!67666 () Bool)

(declare-fun e!54133 () Bool)

(assert (=> b!82083 (=> (not res!67666) (not e!54133))))

(declare-datatypes ((array!3679 0))(
  ( (array!3680 (arr!2323 (Array (_ BitVec 32) (_ BitVec 8))) (size!1686 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2934 0))(
  ( (BitStream!2935 (buf!2076 array!3679) (currentByte!4044 (_ BitVec 32)) (currentBit!4039 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2934)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82083 (= res!67666 (validate_offset_bits!1 ((_ sign_extend 32) (size!1686 (buf!2076 b1!98))) ((_ sign_extend 32) (currentByte!4044 b1!98)) ((_ sign_extend 32) (currentBit!4039 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82084 () Bool)

(declare-fun e!54137 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!82084 (= e!54137 (not (invariant!0 (currentBit!4039 b1!98) (currentByte!4044 b1!98) (size!1686 (buf!2076 b1!98)))))))

(declare-fun lt!130506 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82084 (= (remainingBits!0 ((_ sign_extend 32) (size!1686 (buf!2076 b1!98))) ((_ sign_extend 32) (currentByte!4044 b1!98)) ((_ sign_extend 32) (currentBit!4039 b1!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1686 (buf!2076 b1!98)))) lt!130506))))

(declare-datatypes ((Unit!5481 0))(
  ( (Unit!5482) )
))
(declare-fun lt!130505 () Unit!5481)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2934) Unit!5481)

(assert (=> b!82084 (= lt!130505 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82086 () Bool)

(declare-fun e!54138 () Bool)

(declare-fun b2!98 () BitStream!2934)

(declare-fun array_inv!1532 (array!3679) Bool)

(assert (=> b!82086 (= e!54138 (array_inv!1532 (buf!2076 b2!98)))))

(declare-fun b!82087 () Bool)

(assert (=> b!82087 (= e!54133 e!54137)))

(declare-fun res!67664 () Bool)

(assert (=> b!82087 (=> (not res!67664) (not e!54137))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82087 (= res!67664 (= (bvadd lt!130506 b1b2Diff!1) (bitIndex!0 (size!1686 (buf!2076 b2!98)) (currentByte!4044 b2!98) (currentBit!4039 b2!98))))))

(assert (=> b!82087 (= lt!130506 (bitIndex!0 (size!1686 (buf!2076 b1!98)) (currentByte!4044 b1!98) (currentBit!4039 b1!98)))))

(declare-fun res!67665 () Bool)

(assert (=> start!16470 (=> (not res!67665) (not e!54133))))

(assert (=> start!16470 (= res!67665 (and (= (size!1686 (buf!2076 b1!98)) (size!1686 (buf!2076 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16470 e!54133))

(declare-fun e!54135 () Bool)

(declare-fun inv!12 (BitStream!2934) Bool)

(assert (=> start!16470 (and (inv!12 b1!98) e!54135)))

(assert (=> start!16470 (and (inv!12 b2!98) e!54138)))

(assert (=> start!16470 true))

(declare-fun b!82085 () Bool)

(assert (=> b!82085 (= e!54135 (array_inv!1532 (buf!2076 b1!98)))))

(assert (= (and start!16470 res!67665) b!82083))

(assert (= (and b!82083 res!67666) b!82087))

(assert (= (and b!82087 res!67664) b!82084))

(assert (= start!16470 b!82085))

(assert (= start!16470 b!82086))

(declare-fun m!128507 () Bool)

(assert (=> start!16470 m!128507))

(declare-fun m!128509 () Bool)

(assert (=> start!16470 m!128509))

(declare-fun m!128511 () Bool)

(assert (=> b!82087 m!128511))

(declare-fun m!128513 () Bool)

(assert (=> b!82087 m!128513))

(declare-fun m!128515 () Bool)

(assert (=> b!82086 m!128515))

(declare-fun m!128517 () Bool)

(assert (=> b!82084 m!128517))

(declare-fun m!128519 () Bool)

(assert (=> b!82084 m!128519))

(declare-fun m!128521 () Bool)

(assert (=> b!82084 m!128521))

(declare-fun m!128523 () Bool)

(assert (=> b!82085 m!128523))

(declare-fun m!128525 () Bool)

(assert (=> b!82083 m!128525))

(check-sat (not b!82083) (not start!16470) (not b!82087) (not b!82086) (not b!82084) (not b!82085))
(check-sat)
(get-model)

(declare-fun d!25812 () Bool)

(declare-fun e!54159 () Bool)

(assert (=> d!25812 e!54159))

(declare-fun res!67681 () Bool)

(assert (=> d!25812 (=> (not res!67681) (not e!54159))))

(declare-fun lt!130529 () (_ BitVec 64))

(declare-fun lt!130525 () (_ BitVec 64))

(declare-fun lt!130530 () (_ BitVec 64))

(assert (=> d!25812 (= res!67681 (= lt!130530 (bvsub lt!130525 lt!130529)))))

(assert (=> d!25812 (or (= (bvand lt!130525 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130529 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130525 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130525 lt!130529) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25812 (= lt!130529 (remainingBits!0 ((_ sign_extend 32) (size!1686 (buf!2076 b2!98))) ((_ sign_extend 32) (currentByte!4044 b2!98)) ((_ sign_extend 32) (currentBit!4039 b2!98))))))

(declare-fun lt!130526 () (_ BitVec 64))

(declare-fun lt!130527 () (_ BitVec 64))

(assert (=> d!25812 (= lt!130525 (bvmul lt!130526 lt!130527))))

(assert (=> d!25812 (or (= lt!130526 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130527 (bvsdiv (bvmul lt!130526 lt!130527) lt!130526)))))

(assert (=> d!25812 (= lt!130527 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25812 (= lt!130526 ((_ sign_extend 32) (size!1686 (buf!2076 b2!98))))))

(assert (=> d!25812 (= lt!130530 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4044 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4039 b2!98))))))

(assert (=> d!25812 (invariant!0 (currentBit!4039 b2!98) (currentByte!4044 b2!98) (size!1686 (buf!2076 b2!98)))))

(assert (=> d!25812 (= (bitIndex!0 (size!1686 (buf!2076 b2!98)) (currentByte!4044 b2!98) (currentBit!4039 b2!98)) lt!130530)))

(declare-fun b!82107 () Bool)

(declare-fun res!67680 () Bool)

(assert (=> b!82107 (=> (not res!67680) (not e!54159))))

(assert (=> b!82107 (= res!67680 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130530))))

(declare-fun b!82108 () Bool)

(declare-fun lt!130528 () (_ BitVec 64))

(assert (=> b!82108 (= e!54159 (bvsle lt!130530 (bvmul lt!130528 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82108 (or (= lt!130528 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130528 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130528)))))

(assert (=> b!82108 (= lt!130528 ((_ sign_extend 32) (size!1686 (buf!2076 b2!98))))))

(assert (= (and d!25812 res!67681) b!82107))

(assert (= (and b!82107 res!67680) b!82108))

(declare-fun m!128547 () Bool)

(assert (=> d!25812 m!128547))

(declare-fun m!128549 () Bool)

(assert (=> d!25812 m!128549))

(assert (=> b!82087 d!25812))

(declare-fun d!25814 () Bool)

(declare-fun e!54160 () Bool)

(assert (=> d!25814 e!54160))

(declare-fun res!67683 () Bool)

(assert (=> d!25814 (=> (not res!67683) (not e!54160))))

(declare-fun lt!130535 () (_ BitVec 64))

(declare-fun lt!130536 () (_ BitVec 64))

(declare-fun lt!130531 () (_ BitVec 64))

(assert (=> d!25814 (= res!67683 (= lt!130536 (bvsub lt!130531 lt!130535)))))

(assert (=> d!25814 (or (= (bvand lt!130531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130535 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130531 lt!130535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25814 (= lt!130535 (remainingBits!0 ((_ sign_extend 32) (size!1686 (buf!2076 b1!98))) ((_ sign_extend 32) (currentByte!4044 b1!98)) ((_ sign_extend 32) (currentBit!4039 b1!98))))))

(declare-fun lt!130532 () (_ BitVec 64))

(declare-fun lt!130533 () (_ BitVec 64))

(assert (=> d!25814 (= lt!130531 (bvmul lt!130532 lt!130533))))

(assert (=> d!25814 (or (= lt!130532 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130533 (bvsdiv (bvmul lt!130532 lt!130533) lt!130532)))))

(assert (=> d!25814 (= lt!130533 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25814 (= lt!130532 ((_ sign_extend 32) (size!1686 (buf!2076 b1!98))))))

(assert (=> d!25814 (= lt!130536 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4044 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4039 b1!98))))))

(assert (=> d!25814 (invariant!0 (currentBit!4039 b1!98) (currentByte!4044 b1!98) (size!1686 (buf!2076 b1!98)))))

(assert (=> d!25814 (= (bitIndex!0 (size!1686 (buf!2076 b1!98)) (currentByte!4044 b1!98) (currentBit!4039 b1!98)) lt!130536)))

(declare-fun b!82109 () Bool)

(declare-fun res!67682 () Bool)

(assert (=> b!82109 (=> (not res!67682) (not e!54160))))

(assert (=> b!82109 (= res!67682 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130536))))

(declare-fun b!82110 () Bool)

(declare-fun lt!130534 () (_ BitVec 64))

(assert (=> b!82110 (= e!54160 (bvsle lt!130536 (bvmul lt!130534 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82110 (or (= lt!130534 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130534 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130534)))))

(assert (=> b!82110 (= lt!130534 ((_ sign_extend 32) (size!1686 (buf!2076 b1!98))))))

(assert (= (and d!25814 res!67683) b!82109))

(assert (= (and b!82109 res!67682) b!82110))

(assert (=> d!25814 m!128519))

(assert (=> d!25814 m!128517))

(assert (=> b!82087 d!25814))

(declare-fun d!25816 () Bool)

(assert (=> d!25816 (= (inv!12 b1!98) (invariant!0 (currentBit!4039 b1!98) (currentByte!4044 b1!98) (size!1686 (buf!2076 b1!98))))))

(declare-fun bs!6325 () Bool)

(assert (= bs!6325 d!25816))

(assert (=> bs!6325 m!128517))

(assert (=> start!16470 d!25816))

(declare-fun d!25822 () Bool)

(assert (=> d!25822 (= (inv!12 b2!98) (invariant!0 (currentBit!4039 b2!98) (currentByte!4044 b2!98) (size!1686 (buf!2076 b2!98))))))

(declare-fun bs!6326 () Bool)

(assert (= bs!6326 d!25822))

(assert (=> bs!6326 m!128549))

(assert (=> start!16470 d!25822))

(declare-fun d!25824 () Bool)

(assert (=> d!25824 (= (array_inv!1532 (buf!2076 b2!98)) (bvsge (size!1686 (buf!2076 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82086 d!25824))

(declare-fun d!25828 () Bool)

(assert (=> d!25828 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1686 (buf!2076 b1!98))) ((_ sign_extend 32) (currentByte!4044 b1!98)) ((_ sign_extend 32) (currentBit!4039 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1686 (buf!2076 b1!98))) ((_ sign_extend 32) (currentByte!4044 b1!98)) ((_ sign_extend 32) (currentBit!4039 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6329 () Bool)

(assert (= bs!6329 d!25828))

(assert (=> bs!6329 m!128519))

(assert (=> b!82083 d!25828))

(declare-fun d!25834 () Bool)

(assert (=> d!25834 (= (invariant!0 (currentBit!4039 b1!98) (currentByte!4044 b1!98) (size!1686 (buf!2076 b1!98))) (and (bvsge (currentBit!4039 b1!98) #b00000000000000000000000000000000) (bvslt (currentBit!4039 b1!98) #b00000000000000000000000000001000) (bvsge (currentByte!4044 b1!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!4044 b1!98) (size!1686 (buf!2076 b1!98))) (and (= (currentBit!4039 b1!98) #b00000000000000000000000000000000) (= (currentByte!4044 b1!98) (size!1686 (buf!2076 b1!98)))))))))

(assert (=> b!82084 d!25834))

(declare-fun d!25838 () Bool)

(assert (=> d!25838 (= (remainingBits!0 ((_ sign_extend 32) (size!1686 (buf!2076 b1!98))) ((_ sign_extend 32) (currentByte!4044 b1!98)) ((_ sign_extend 32) (currentBit!4039 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1686 (buf!2076 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4044 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4039 b1!98)))))))

(assert (=> b!82084 d!25838))

(declare-fun d!25842 () Bool)

(declare-fun lt!130575 () (_ BitVec 64))

(declare-fun lt!130574 () (_ BitVec 64))

(assert (=> d!25842 (= (remainingBits!0 ((_ sign_extend 32) (size!1686 (buf!2076 b1!98))) ((_ sign_extend 32) (currentByte!4044 b1!98)) ((_ sign_extend 32) (currentBit!4039 b1!98))) (bvsub lt!130575 lt!130574))))

(assert (=> d!25842 (or (= (bvand lt!130575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130574 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130575 lt!130574) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25842 (= lt!130574 (bitIndex!0 (size!1686 (buf!2076 b1!98)) (currentByte!4044 b1!98) (currentBit!4039 b1!98)))))

(declare-fun lt!130576 () (_ BitVec 64))

(declare-fun lt!130578 () (_ BitVec 64))

(assert (=> d!25842 (= lt!130575 (bvmul lt!130576 lt!130578))))

(assert (=> d!25842 (or (= lt!130576 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130578 (bvsdiv (bvmul lt!130576 lt!130578) lt!130576)))))

(assert (=> d!25842 (= lt!130578 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25842 (= lt!130576 ((_ sign_extend 32) (size!1686 (buf!2076 b1!98))))))

(declare-fun lt!130577 () Unit!5481)

(declare-fun choose!23 (BitStream!2934) Unit!5481)

(assert (=> d!25842 (= lt!130577 (choose!23 b1!98))))

(assert (=> d!25842 (= (remainingBitsBitIndexLemma!0 b1!98) lt!130577)))

(declare-fun bs!6331 () Bool)

(assert (= bs!6331 d!25842))

(assert (=> bs!6331 m!128519))

(assert (=> bs!6331 m!128513))

(declare-fun m!128553 () Bool)

(assert (=> bs!6331 m!128553))

(assert (=> b!82084 d!25842))

(declare-fun d!25848 () Bool)

(assert (=> d!25848 (= (array_inv!1532 (buf!2076 b1!98)) (bvsge (size!1686 (buf!2076 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82085 d!25848))

(check-sat (not d!25814) (not d!25842) (not d!25812) (not d!25816) (not d!25828) (not d!25822))
