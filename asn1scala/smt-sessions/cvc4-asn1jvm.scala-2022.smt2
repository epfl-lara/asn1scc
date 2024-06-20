; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51746 () Bool)

(assert start!51746)

(declare-fun res!199998 () Bool)

(declare-fun e!165822 () Bool)

(assert (=> start!51746 (=> (not res!199998) (not e!165822))))

(declare-datatypes ((array!12976 0))(
  ( (array!12977 (arr!6675 (Array (_ BitVec 32) (_ BitVec 8))) (size!5688 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10298 0))(
  ( (BitStream!10299 (buf!6142 array!12976) (currentByte!11442 (_ BitVec 32)) (currentBit!11437 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10298)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51746 (= res!199998 (validate_offset_bits!1 ((_ sign_extend 32) (size!5688 (buf!6142 thiss!1854))) ((_ sign_extend 32) (currentByte!11442 thiss!1854)) ((_ sign_extend 32) (currentBit!11437 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51746 e!165822))

(declare-fun e!165823 () Bool)

(declare-fun inv!12 (BitStream!10298) Bool)

(assert (=> start!51746 (and (inv!12 thiss!1854) e!165823)))

(declare-fun b!239470 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!239470 (= e!165822 (not (= (bitIndex!0 (size!5688 (buf!6142 thiss!1854)) (bvadd #b00000000000000000000000000000001 (currentByte!11442 thiss!1854)) (currentBit!11437 thiss!1854)) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!5688 (buf!6142 thiss!1854)) (currentByte!11442 thiss!1854) (currentBit!11437 thiss!1854))))))))

(declare-fun b!239471 () Bool)

(declare-fun array_inv!5429 (array!12976) Bool)

(assert (=> b!239471 (= e!165823 (array_inv!5429 (buf!6142 thiss!1854)))))

(assert (= (and start!51746 res!199998) b!239470))

(assert (= start!51746 b!239471))

(declare-fun m!361683 () Bool)

(assert (=> start!51746 m!361683))

(declare-fun m!361685 () Bool)

(assert (=> start!51746 m!361685))

(declare-fun m!361687 () Bool)

(assert (=> b!239470 m!361687))

(declare-fun m!361689 () Bool)

(assert (=> b!239470 m!361689))

(declare-fun m!361691 () Bool)

(assert (=> b!239471 m!361691))

(push 1)

(assert (not b!239471))

(assert (not start!51746))

(assert (not b!239470))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80882 () Bool)

(assert (=> d!80882 (= (array_inv!5429 (buf!6142 thiss!1854)) (bvsge (size!5688 (buf!6142 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239471 d!80882))

(declare-fun d!80884 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80884 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5688 (buf!6142 thiss!1854))) ((_ sign_extend 32) (currentByte!11442 thiss!1854)) ((_ sign_extend 32) (currentBit!11437 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5688 (buf!6142 thiss!1854))) ((_ sign_extend 32) (currentByte!11442 thiss!1854)) ((_ sign_extend 32) (currentBit!11437 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20354 () Bool)

(assert (= bs!20354 d!80884))

(declare-fun m!361701 () Bool)

(assert (=> bs!20354 m!361701))

(assert (=> start!51746 d!80884))

(declare-fun d!80886 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80886 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11437 thiss!1854) (currentByte!11442 thiss!1854) (size!5688 (buf!6142 thiss!1854))))))

(declare-fun bs!20355 () Bool)

(assert (= bs!20355 d!80886))

(declare-fun m!361703 () Bool)

(assert (=> bs!20355 m!361703))

(assert (=> start!51746 d!80886))

(declare-fun d!80888 () Bool)

(declare-fun e!165835 () Bool)

(assert (=> d!80888 e!165835))

(declare-fun res!200020 () Bool)

(assert (=> d!80888 (=> (not res!200020) (not e!165835))))

(declare-fun lt!374172 () (_ BitVec 64))

(declare-fun lt!374170 () (_ BitVec 64))

(declare-fun lt!374175 () (_ BitVec 64))

(assert (=> d!80888 (= res!200020 (= lt!374170 (bvsub lt!374172 lt!374175)))))

(assert (=> d!80888 (or (= (bvand lt!374172 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374175 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374172 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374172 lt!374175) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80888 (= lt!374175 (remainingBits!0 ((_ sign_extend 32) (size!5688 (buf!6142 thiss!1854))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!11442 thiss!1854))) ((_ sign_extend 32) (currentBit!11437 thiss!1854))))))

(declare-fun lt!374171 () (_ BitVec 64))

(declare-fun lt!374174 () (_ BitVec 64))

(assert (=> d!80888 (= lt!374172 (bvmul lt!374171 lt!374174))))

(assert (=> d!80888 (or (= lt!374171 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374174 (bvsdiv (bvmul lt!374171 lt!374174) lt!374171)))))

(assert (=> d!80888 (= lt!374174 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80888 (= lt!374171 ((_ sign_extend 32) (size!5688 (buf!6142 thiss!1854))))))

(assert (=> d!80888 (= lt!374170 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!11442 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11437 thiss!1854))))))

(assert (=> d!80888 (invariant!0 (currentBit!11437 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11442 thiss!1854)) (size!5688 (buf!6142 thiss!1854)))))

(assert (=> d!80888 (= (bitIndex!0 (size!5688 (buf!6142 thiss!1854)) (bvadd #b00000000000000000000000000000001 (currentByte!11442 thiss!1854)) (currentBit!11437 thiss!1854)) lt!374170)))

(declare-fun b!239492 () Bool)

(declare-fun res!200019 () Bool)

(assert (=> b!239492 (=> (not res!200019) (not e!165835))))

(assert (=> b!239492 (= res!200019 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374170))))

(declare-fun b!239493 () Bool)

(declare-fun lt!374173 () (_ BitVec 64))

(assert (=> b!239493 (= e!165835 (bvsle lt!374170 (bvmul lt!374173 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239493 (or (= lt!374173 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374173 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374173)))))

(assert (=> b!239493 (= lt!374173 ((_ sign_extend 32) (size!5688 (buf!6142 thiss!1854))))))

(assert (= (and d!80888 res!200020) b!239492))

(assert (= (and b!239492 res!200019) b!239493))

(declare-fun m!361713 () Bool)

(assert (=> d!80888 m!361713))

(declare-fun m!361715 () Bool)

(assert (=> d!80888 m!361715))

(assert (=> b!239470 d!80888))

(declare-fun d!80896 () Bool)

(declare-fun e!165836 () Bool)

(assert (=> d!80896 e!165836))

(declare-fun res!200022 () Bool)

(assert (=> d!80896 (=> (not res!200022) (not e!165836))))

(declare-fun lt!374176 () (_ BitVec 64))

(declare-fun lt!374178 () (_ BitVec 64))

(declare-fun lt!374181 () (_ BitVec 64))

(assert (=> d!80896 (= res!200022 (= lt!374176 (bvsub lt!374178 lt!374181)))))

(assert (=> d!80896 (or (= (bvand lt!374178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374181 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374178 lt!374181) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80896 (= lt!374181 (remainingBits!0 ((_ sign_extend 32) (size!5688 (buf!6142 thiss!1854))) ((_ sign_extend 32) (currentByte!11442 thiss!1854)) ((_ sign_extend 32) (currentBit!11437 thiss!1854))))))

(declare-fun lt!374177 () (_ BitVec 64))

(declare-fun lt!374180 () (_ BitVec 64))

(assert (=> d!80896 (= lt!374178 (bvmul lt!374177 lt!374180))))

(assert (=> d!80896 (or (= lt!374177 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374180 (bvsdiv (bvmul lt!374177 lt!374180) lt!374177)))))

(assert (=> d!80896 (= lt!374180 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80896 (= lt!374177 ((_ sign_extend 32) (size!5688 (buf!6142 thiss!1854))))))

(assert (=> d!80896 (= lt!374176 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11442 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11437 thiss!1854))))))

(assert (=> d!80896 (invariant!0 (currentBit!11437 thiss!1854) (currentByte!11442 thiss!1854) (size!5688 (buf!6142 thiss!1854)))))

(assert (=> d!80896 (= (bitIndex!0 (size!5688 (buf!6142 thiss!1854)) (currentByte!11442 thiss!1854) (currentBit!11437 thiss!1854)) lt!374176)))

(declare-fun b!239494 () Bool)

(declare-fun res!200021 () Bool)

(assert (=> b!239494 (=> (not res!200021) (not e!165836))))

(assert (=> b!239494 (= res!200021 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374176))))

(declare-fun b!239495 () Bool)

(declare-fun lt!374179 () (_ BitVec 64))

(assert (=> b!239495 (= e!165836 (bvsle lt!374176 (bvmul lt!374179 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239495 (or (= lt!374179 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374179 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374179)))))

(assert (=> b!239495 (= lt!374179 ((_ sign_extend 32) (size!5688 (buf!6142 thiss!1854))))))

(assert (= (and d!80896 res!200022) b!239494))

(assert (= (and b!239494 res!200021) b!239495))

(assert (=> d!80896 m!361701))

(assert (=> d!80896 m!361703))

(assert (=> b!239470 d!80896))

(push 1)

(assert (not d!80884))

(assert (not d!80886))

(assert (not d!80896))

(assert (not d!80888))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

