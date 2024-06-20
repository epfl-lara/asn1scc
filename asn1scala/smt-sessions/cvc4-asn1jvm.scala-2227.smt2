; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56612 () Bool)

(assert start!56612)

(declare-fun res!218708 () Bool)

(declare-fun e!181580 () Bool)

(assert (=> start!56612 (=> (not res!218708) (not e!181580))))

(declare-datatypes ((array!14392 0))(
  ( (array!14393 (arr!7275 (Array (_ BitVec 32) (_ BitVec 8))) (size!6288 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11498 0))(
  ( (BitStream!11499 (buf!6810 array!14392) (currentByte!12554 (_ BitVec 32)) (currentBit!12549 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11498)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56612 (= res!218708 (validate_offset_bit!0 ((_ sign_extend 32) (size!6288 (buf!6810 thiss!914))) ((_ sign_extend 32) (currentByte!12554 thiss!914)) ((_ sign_extend 32) (currentBit!12549 thiss!914))))))

(assert (=> start!56612 e!181580))

(declare-fun e!181581 () Bool)

(declare-fun inv!12 (BitStream!11498) Bool)

(assert (=> start!56612 (and (inv!12 thiss!914) e!181581)))

(assert (=> start!56612 true))

(declare-fun b!261214 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261214 (= e!181580 (and b!187 (or (bvslt (currentByte!12554 thiss!914) #b00000000000000000000000000000000) (bvsge (currentByte!12554 thiss!914) (size!6288 (buf!6810 thiss!914))))))))

(declare-fun b!261215 () Bool)

(declare-fun array_inv!6029 (array!14392) Bool)

(assert (=> b!261215 (= e!181581 (array_inv!6029 (buf!6810 thiss!914)))))

(assert (= (and start!56612 res!218708) b!261214))

(assert (= start!56612 b!261215))

(declare-fun m!390841 () Bool)

(assert (=> start!56612 m!390841))

(declare-fun m!390843 () Bool)

(assert (=> start!56612 m!390843))

(declare-fun m!390845 () Bool)

(assert (=> b!261215 m!390845))

(push 1)

(assert (not start!56612))

(assert (not b!261215))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87856 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87856 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6288 (buf!6810 thiss!914))) ((_ sign_extend 32) (currentByte!12554 thiss!914)) ((_ sign_extend 32) (currentBit!12549 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6288 (buf!6810 thiss!914))) ((_ sign_extend 32) (currentByte!12554 thiss!914)) ((_ sign_extend 32) (currentBit!12549 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22249 () Bool)

(assert (= bs!22249 d!87856))

(declare-fun m!390855 () Bool)

(assert (=> bs!22249 m!390855))

(assert (=> start!56612 d!87856))

(declare-fun d!87858 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87858 (= (inv!12 thiss!914) (invariant!0 (currentBit!12549 thiss!914) (currentByte!12554 thiss!914) (size!6288 (buf!6810 thiss!914))))))

(declare-fun bs!22250 () Bool)

(assert (= bs!22250 d!87858))

(declare-fun m!390857 () Bool)

(assert (=> bs!22250 m!390857))

(assert (=> start!56612 d!87858))

(declare-fun d!87860 () Bool)

(assert (=> d!87860 (= (array_inv!6029 (buf!6810 thiss!914)) (bvsge (size!6288 (buf!6810 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261215 d!87860))

(push 1)

(assert (not d!87856))

(assert (not d!87858))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87870 () Bool)

(assert (=> d!87870 (= (remainingBits!0 ((_ sign_extend 32) (size!6288 (buf!6810 thiss!914))) ((_ sign_extend 32) (currentByte!12554 thiss!914)) ((_ sign_extend 32) (currentBit!12549 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6288 (buf!6810 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12554 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12549 thiss!914)))))))

(assert (=> d!87856 d!87870))

(declare-fun d!87872 () Bool)

(assert (=> d!87872 (= (invariant!0 (currentBit!12549 thiss!914) (currentByte!12554 thiss!914) (size!6288 (buf!6810 thiss!914))) (and (bvsge (currentBit!12549 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12549 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12554 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12554 thiss!914) (size!6288 (buf!6810 thiss!914))) (and (= (currentBit!12549 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12554 thiss!914) (size!6288 (buf!6810 thiss!914)))))))))

(assert (=> d!87858 d!87872))

(push 1)

(check-sat)

