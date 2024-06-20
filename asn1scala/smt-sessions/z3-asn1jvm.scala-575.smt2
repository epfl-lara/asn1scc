; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16422 () Bool)

(assert start!16422)

(declare-fun b!82007 () Bool)

(declare-fun res!67612 () Bool)

(declare-fun e!54067 () Bool)

(assert (=> b!82007 (=> (not res!67612) (not e!54067))))

(declare-datatypes ((array!3670 0))(
  ( (array!3671 (arr!2320 (Array (_ BitVec 32) (_ BitVec 8))) (size!1683 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2928 0))(
  ( (BitStream!2929 (buf!2073 array!3670) (currentByte!4029 (_ BitVec 32)) (currentBit!4024 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2928)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82007 (= res!67612 (validate_offset_bits!1 ((_ sign_extend 32) (size!1683 (buf!2073 b1!98))) ((_ sign_extend 32) (currentByte!4029 b1!98)) ((_ sign_extend 32) (currentBit!4024 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82008 () Bool)

(declare-fun e!54066 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!82008 (= e!54066 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4024 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4029 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1683 (buf!2073 b1!98))))))))

(declare-fun b!82009 () Bool)

(declare-fun e!54064 () Bool)

(assert (=> b!82009 (= e!54067 e!54064)))

(declare-fun res!67609 () Bool)

(assert (=> b!82009 (=> (not res!67609) (not e!54064))))

(declare-fun lt!130371 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b2!98 () BitStream!2928)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82009 (= res!67609 (= (bvadd lt!130371 b1b2Diff!1) (bitIndex!0 (size!1683 (buf!2073 b2!98)) (currentByte!4029 b2!98) (currentBit!4024 b2!98))))))

(assert (=> b!82009 (= lt!130371 (bitIndex!0 (size!1683 (buf!2073 b1!98)) (currentByte!4029 b1!98) (currentBit!4024 b1!98)))))

(declare-fun res!67610 () Bool)

(assert (=> start!16422 (=> (not res!67610) (not e!54067))))

(assert (=> start!16422 (= res!67610 (and (= (size!1683 (buf!2073 b1!98)) (size!1683 (buf!2073 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16422 e!54067))

(declare-fun e!54069 () Bool)

(declare-fun inv!12 (BitStream!2928) Bool)

(assert (=> start!16422 (and (inv!12 b1!98) e!54069)))

(declare-fun e!54065 () Bool)

(assert (=> start!16422 (and (inv!12 b2!98) e!54065)))

(assert (=> start!16422 true))

(declare-fun b!82010 () Bool)

(assert (=> b!82010 (= e!54064 (not e!54066))))

(declare-fun res!67611 () Bool)

(assert (=> b!82010 (=> res!67611 e!54066)))

(assert (=> b!82010 (= res!67611 (or (bvsgt ((_ sign_extend 32) (size!1683 (buf!2073 b1!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4029 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4024 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1683 (buf!2073 b1!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4029 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4024 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82010 (= (remainingBits!0 ((_ sign_extend 32) (size!1683 (buf!2073 b1!98))) ((_ sign_extend 32) (currentByte!4029 b1!98)) ((_ sign_extend 32) (currentBit!4024 b1!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1683 (buf!2073 b1!98)))) lt!130371))))

(declare-datatypes ((Unit!5475 0))(
  ( (Unit!5476) )
))
(declare-fun lt!130370 () Unit!5475)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2928) Unit!5475)

(assert (=> b!82010 (= lt!130370 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82011 () Bool)

(declare-fun array_inv!1529 (array!3670) Bool)

(assert (=> b!82011 (= e!54065 (array_inv!1529 (buf!2073 b2!98)))))

(declare-fun b!82012 () Bool)

(assert (=> b!82012 (= e!54069 (array_inv!1529 (buf!2073 b1!98)))))

(assert (= (and start!16422 res!67610) b!82007))

(assert (= (and b!82007 res!67612) b!82009))

(assert (= (and b!82009 res!67609) b!82010))

(assert (= (and b!82010 (not res!67611)) b!82008))

(assert (= start!16422 b!82012))

(assert (= start!16422 b!82011))

(declare-fun m!128423 () Bool)

(assert (=> b!82008 m!128423))

(declare-fun m!128425 () Bool)

(assert (=> b!82007 m!128425))

(declare-fun m!128427 () Bool)

(assert (=> b!82009 m!128427))

(declare-fun m!128429 () Bool)

(assert (=> b!82009 m!128429))

(declare-fun m!128431 () Bool)

(assert (=> b!82012 m!128431))

(declare-fun m!128433 () Bool)

(assert (=> b!82010 m!128433))

(declare-fun m!128435 () Bool)

(assert (=> b!82010 m!128435))

(declare-fun m!128437 () Bool)

(assert (=> start!16422 m!128437))

(declare-fun m!128439 () Bool)

(assert (=> start!16422 m!128439))

(declare-fun m!128441 () Bool)

(assert (=> b!82011 m!128441))

(check-sat (not b!82012) (not b!82009) (not b!82010) (not b!82011) (not b!82008) (not b!82007) (not start!16422))
(check-sat)
(get-model)

(declare-fun d!25750 () Bool)

(assert (=> d!25750 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1683 (buf!2073 b1!98))) ((_ sign_extend 32) (currentByte!4029 b1!98)) ((_ sign_extend 32) (currentBit!4024 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1683 (buf!2073 b1!98))) ((_ sign_extend 32) (currentByte!4029 b1!98)) ((_ sign_extend 32) (currentBit!4024 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6310 () Bool)

(assert (= bs!6310 d!25750))

(assert (=> bs!6310 m!128433))

(assert (=> b!82007 d!25750))

(declare-fun d!25752 () Bool)

(assert (=> d!25752 (= (array_inv!1529 (buf!2073 b1!98)) (bvsge (size!1683 (buf!2073 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82012 d!25752))

(declare-fun d!25754 () Bool)

(assert (=> d!25754 (= (inv!12 b1!98) (invariant!0 (currentBit!4024 b1!98) (currentByte!4029 b1!98) (size!1683 (buf!2073 b1!98))))))

(declare-fun bs!6311 () Bool)

(assert (= bs!6311 d!25754))

(declare-fun m!128463 () Bool)

(assert (=> bs!6311 m!128463))

(assert (=> start!16422 d!25754))

(declare-fun d!25756 () Bool)

(assert (=> d!25756 (= (inv!12 b2!98) (invariant!0 (currentBit!4024 b2!98) (currentByte!4029 b2!98) (size!1683 (buf!2073 b2!98))))))

(declare-fun bs!6312 () Bool)

(assert (= bs!6312 d!25756))

(declare-fun m!128465 () Bool)

(assert (=> bs!6312 m!128465))

(assert (=> start!16422 d!25756))

(declare-fun d!25758 () Bool)

(assert (=> d!25758 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4024 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4029 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1683 (buf!2073 b1!98))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4024 b1!98))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4024 b1!98))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4029 b1!98))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4029 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1683 (buf!2073 b1!98))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4024 b1!98))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4029 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1683 (buf!2073 b1!98)))))))))))

(assert (=> b!82008 d!25758))

(declare-fun d!25760 () Bool)

(assert (=> d!25760 (= (remainingBits!0 ((_ sign_extend 32) (size!1683 (buf!2073 b1!98))) ((_ sign_extend 32) (currentByte!4029 b1!98)) ((_ sign_extend 32) (currentBit!4024 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1683 (buf!2073 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4029 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4024 b1!98)))))))

(assert (=> b!82010 d!25760))

(declare-fun d!25762 () Bool)

(declare-fun lt!130391 () (_ BitVec 64))

(declare-fun lt!130392 () (_ BitVec 64))

(assert (=> d!25762 (= (remainingBits!0 ((_ sign_extend 32) (size!1683 (buf!2073 b1!98))) ((_ sign_extend 32) (currentByte!4029 b1!98)) ((_ sign_extend 32) (currentBit!4024 b1!98))) (bvsub lt!130391 lt!130392))))

(assert (=> d!25762 (or (= (bvand lt!130391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130392 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130391 lt!130392) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25762 (= lt!130392 (bitIndex!0 (size!1683 (buf!2073 b1!98)) (currentByte!4029 b1!98) (currentBit!4024 b1!98)))))

(declare-fun lt!130390 () (_ BitVec 64))

(declare-fun lt!130389 () (_ BitVec 64))

(assert (=> d!25762 (= lt!130391 (bvmul lt!130390 lt!130389))))

(assert (=> d!25762 (or (= lt!130390 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130389 (bvsdiv (bvmul lt!130390 lt!130389) lt!130390)))))

(assert (=> d!25762 (= lt!130389 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25762 (= lt!130390 ((_ sign_extend 32) (size!1683 (buf!2073 b1!98))))))

(declare-fun lt!130388 () Unit!5475)

(declare-fun choose!23 (BitStream!2928) Unit!5475)

(assert (=> d!25762 (= lt!130388 (choose!23 b1!98))))

(assert (=> d!25762 (= (remainingBitsBitIndexLemma!0 b1!98) lt!130388)))

(declare-fun bs!6313 () Bool)

(assert (= bs!6313 d!25762))

(assert (=> bs!6313 m!128433))

(assert (=> bs!6313 m!128429))

(declare-fun m!128467 () Bool)

(assert (=> bs!6313 m!128467))

(assert (=> b!82010 d!25762))

(declare-fun d!25764 () Bool)

(declare-fun e!54093 () Bool)

(assert (=> d!25764 e!54093))

(declare-fun res!67629 () Bool)

(assert (=> d!25764 (=> (not res!67629) (not e!54093))))

(declare-fun lt!130410 () (_ BitVec 64))

(declare-fun lt!130409 () (_ BitVec 64))

(declare-fun lt!130407 () (_ BitVec 64))

(assert (=> d!25764 (= res!67629 (= lt!130409 (bvsub lt!130407 lt!130410)))))

(assert (=> d!25764 (or (= (bvand lt!130407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130410 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130407 lt!130410) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25764 (= lt!130410 (remainingBits!0 ((_ sign_extend 32) (size!1683 (buf!2073 b2!98))) ((_ sign_extend 32) (currentByte!4029 b2!98)) ((_ sign_extend 32) (currentBit!4024 b2!98))))))

(declare-fun lt!130405 () (_ BitVec 64))

(declare-fun lt!130406 () (_ BitVec 64))

(assert (=> d!25764 (= lt!130407 (bvmul lt!130405 lt!130406))))

(assert (=> d!25764 (or (= lt!130405 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130406 (bvsdiv (bvmul lt!130405 lt!130406) lt!130405)))))

(assert (=> d!25764 (= lt!130406 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25764 (= lt!130405 ((_ sign_extend 32) (size!1683 (buf!2073 b2!98))))))

(assert (=> d!25764 (= lt!130409 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4029 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4024 b2!98))))))

(assert (=> d!25764 (invariant!0 (currentBit!4024 b2!98) (currentByte!4029 b2!98) (size!1683 (buf!2073 b2!98)))))

(assert (=> d!25764 (= (bitIndex!0 (size!1683 (buf!2073 b2!98)) (currentByte!4029 b2!98) (currentBit!4024 b2!98)) lt!130409)))

(declare-fun b!82036 () Bool)

(declare-fun res!67630 () Bool)

(assert (=> b!82036 (=> (not res!67630) (not e!54093))))

(assert (=> b!82036 (= res!67630 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130409))))

(declare-fun b!82037 () Bool)

(declare-fun lt!130408 () (_ BitVec 64))

(assert (=> b!82037 (= e!54093 (bvsle lt!130409 (bvmul lt!130408 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82037 (or (= lt!130408 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130408 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130408)))))

(assert (=> b!82037 (= lt!130408 ((_ sign_extend 32) (size!1683 (buf!2073 b2!98))))))

(assert (= (and d!25764 res!67629) b!82036))

(assert (= (and b!82036 res!67630) b!82037))

(declare-fun m!128469 () Bool)

(assert (=> d!25764 m!128469))

(assert (=> d!25764 m!128465))

(assert (=> b!82009 d!25764))

(declare-fun d!25776 () Bool)

(declare-fun e!54094 () Bool)

(assert (=> d!25776 e!54094))

(declare-fun res!67631 () Bool)

(assert (=> d!25776 (=> (not res!67631) (not e!54094))))

(declare-fun lt!130415 () (_ BitVec 64))

(declare-fun lt!130413 () (_ BitVec 64))

(declare-fun lt!130416 () (_ BitVec 64))

(assert (=> d!25776 (= res!67631 (= lt!130415 (bvsub lt!130413 lt!130416)))))

(assert (=> d!25776 (or (= (bvand lt!130413 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130416 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130413 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130413 lt!130416) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25776 (= lt!130416 (remainingBits!0 ((_ sign_extend 32) (size!1683 (buf!2073 b1!98))) ((_ sign_extend 32) (currentByte!4029 b1!98)) ((_ sign_extend 32) (currentBit!4024 b1!98))))))

(declare-fun lt!130411 () (_ BitVec 64))

(declare-fun lt!130412 () (_ BitVec 64))

(assert (=> d!25776 (= lt!130413 (bvmul lt!130411 lt!130412))))

(assert (=> d!25776 (or (= lt!130411 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130412 (bvsdiv (bvmul lt!130411 lt!130412) lt!130411)))))

(assert (=> d!25776 (= lt!130412 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25776 (= lt!130411 ((_ sign_extend 32) (size!1683 (buf!2073 b1!98))))))

(assert (=> d!25776 (= lt!130415 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4029 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4024 b1!98))))))

(assert (=> d!25776 (invariant!0 (currentBit!4024 b1!98) (currentByte!4029 b1!98) (size!1683 (buf!2073 b1!98)))))

(assert (=> d!25776 (= (bitIndex!0 (size!1683 (buf!2073 b1!98)) (currentByte!4029 b1!98) (currentBit!4024 b1!98)) lt!130415)))

(declare-fun b!82038 () Bool)

(declare-fun res!67632 () Bool)

(assert (=> b!82038 (=> (not res!67632) (not e!54094))))

(assert (=> b!82038 (= res!67632 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130415))))

(declare-fun b!82039 () Bool)

(declare-fun lt!130414 () (_ BitVec 64))

(assert (=> b!82039 (= e!54094 (bvsle lt!130415 (bvmul lt!130414 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82039 (or (= lt!130414 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130414 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130414)))))

(assert (=> b!82039 (= lt!130414 ((_ sign_extend 32) (size!1683 (buf!2073 b1!98))))))

(assert (= (and d!25776 res!67631) b!82038))

(assert (= (and b!82038 res!67632) b!82039))

(assert (=> d!25776 m!128433))

(assert (=> d!25776 m!128463))

(assert (=> b!82009 d!25776))

(declare-fun d!25778 () Bool)

(assert (=> d!25778 (= (array_inv!1529 (buf!2073 b2!98)) (bvsge (size!1683 (buf!2073 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82011 d!25778))

(check-sat (not d!25756) (not d!25776) (not d!25750) (not d!25754) (not d!25762) (not d!25764))
