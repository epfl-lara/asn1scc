; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51716 () Bool)

(assert start!51716)

(declare-fun res!199971 () Bool)

(declare-fun e!165788 () Bool)

(assert (=> start!51716 (=> (not res!199971) (not e!165788))))

(declare-datatypes ((array!12967 0))(
  ( (array!12968 (arr!6672 (Array (_ BitVec 32) (_ BitVec 8))) (size!5685 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10292 0))(
  ( (BitStream!10293 (buf!6139 array!12967) (currentByte!11433 (_ BitVec 32)) (currentBit!11428 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10292)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51716 (= res!199971 (validate_offset_bits!1 ((_ sign_extend 32) (size!5685 (buf!6139 thiss!1854))) ((_ sign_extend 32) (currentByte!11433 thiss!1854)) ((_ sign_extend 32) (currentBit!11428 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51716 e!165788))

(declare-fun e!165786 () Bool)

(declare-fun inv!12 (BitStream!10292) Bool)

(assert (=> start!51716 (and (inv!12 thiss!1854) e!165786)))

(declare-fun b!239434 () Bool)

(declare-fun lt!374055 () (_ BitVec 64))

(declare-fun lt!374054 () (_ BitVec 64))

(assert (=> b!239434 (= e!165788 (and (= lt!374055 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!374055 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!374054) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!239434 (= lt!374055 (bvand lt!374054 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!239434 (= lt!374054 (bitIndex!0 (size!5685 (buf!6139 thiss!1854)) (currentByte!11433 thiss!1854) (currentBit!11428 thiss!1854)))))

(declare-fun b!239435 () Bool)

(declare-fun array_inv!5426 (array!12967) Bool)

(assert (=> b!239435 (= e!165786 (array_inv!5426 (buf!6139 thiss!1854)))))

(assert (= (and start!51716 res!199971) b!239434))

(assert (= start!51716 b!239435))

(declare-fun m!361643 () Bool)

(assert (=> start!51716 m!361643))

(declare-fun m!361645 () Bool)

(assert (=> start!51716 m!361645))

(declare-fun m!361647 () Bool)

(assert (=> b!239434 m!361647))

(declare-fun m!361649 () Bool)

(assert (=> b!239435 m!361649))

(push 1)

(assert (not b!239435))

(assert (not start!51716))

(assert (not b!239434))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80852 () Bool)

(assert (=> d!80852 (= (array_inv!5426 (buf!6139 thiss!1854)) (bvsge (size!5685 (buf!6139 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239435 d!80852))

(declare-fun d!80854 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80854 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5685 (buf!6139 thiss!1854))) ((_ sign_extend 32) (currentByte!11433 thiss!1854)) ((_ sign_extend 32) (currentBit!11428 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5685 (buf!6139 thiss!1854))) ((_ sign_extend 32) (currentByte!11433 thiss!1854)) ((_ sign_extend 32) (currentBit!11428 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20345 () Bool)

(assert (= bs!20345 d!80854))

(declare-fun m!361659 () Bool)

(assert (=> bs!20345 m!361659))

(assert (=> start!51716 d!80854))

(declare-fun d!80858 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80858 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11428 thiss!1854) (currentByte!11433 thiss!1854) (size!5685 (buf!6139 thiss!1854))))))

(declare-fun bs!20346 () Bool)

(assert (= bs!20346 d!80858))

(declare-fun m!361661 () Bool)

(assert (=> bs!20346 m!361661))

(assert (=> start!51716 d!80858))

(declare-fun d!80860 () Bool)

(declare-fun e!165797 () Bool)

(assert (=> d!80860 e!165797))

(declare-fun res!199989 () Bool)

(assert (=> d!80860 (=> (not res!199989) (not e!165797))))

(declare-fun lt!374105 () (_ BitVec 64))

(declare-fun lt!374108 () (_ BitVec 64))

(declare-fun lt!374109 () (_ BitVec 64))

(assert (=> d!80860 (= res!199989 (= lt!374109 (bvsub lt!374108 lt!374105)))))

(assert (=> d!80860 (or (= (bvand lt!374108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374105 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374108 lt!374105) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80860 (= lt!374105 (remainingBits!0 ((_ sign_extend 32) (size!5685 (buf!6139 thiss!1854))) ((_ sign_extend 32) (currentByte!11433 thiss!1854)) ((_ sign_extend 32) (currentBit!11428 thiss!1854))))))

(declare-fun lt!374104 () (_ BitVec 64))

(declare-fun lt!374106 () (_ BitVec 64))

(assert (=> d!80860 (= lt!374108 (bvmul lt!374104 lt!374106))))

(assert (=> d!80860 (or (= lt!374104 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374106 (bvsdiv (bvmul lt!374104 lt!374106) lt!374104)))))

(assert (=> d!80860 (= lt!374106 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80860 (= lt!374104 ((_ sign_extend 32) (size!5685 (buf!6139 thiss!1854))))))

(assert (=> d!80860 (= lt!374109 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11433 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11428 thiss!1854))))))

(assert (=> d!80860 (invariant!0 (currentBit!11428 thiss!1854) (currentByte!11433 thiss!1854) (size!5685 (buf!6139 thiss!1854)))))

(assert (=> d!80860 (= (bitIndex!0 (size!5685 (buf!6139 thiss!1854)) (currentByte!11433 thiss!1854) (currentBit!11428 thiss!1854)) lt!374109)))

(declare-fun b!239452 () Bool)

(declare-fun res!199988 () Bool)

(assert (=> b!239452 (=> (not res!199988) (not e!165797))))

(assert (=> b!239452 (= res!199988 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374109))))

(declare-fun b!239453 () Bool)

(declare-fun lt!374107 () (_ BitVec 64))

(assert (=> b!239453 (= e!165797 (bvsle lt!374109 (bvmul lt!374107 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239453 (or (= lt!374107 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374107 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374107)))))

(assert (=> b!239453 (= lt!374107 ((_ sign_extend 32) (size!5685 (buf!6139 thiss!1854))))))

(assert (= (and d!80860 res!199989) b!239452))

(assert (= (and b!239452 res!199988) b!239453))

(assert (=> d!80860 m!361659))

(assert (=> d!80860 m!361661))

(assert (=> b!239434 d!80860))

(push 1)

(assert (not d!80860))

(assert (not d!80858))

(assert (not d!80854))

(check-sat)

(pop 1)

(push 1)

(check-sat)

