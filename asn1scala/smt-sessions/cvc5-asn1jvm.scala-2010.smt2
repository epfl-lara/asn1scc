; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51406 () Bool)

(assert start!51406)

(declare-fun res!199866 () Bool)

(declare-fun e!165471 () Bool)

(assert (=> start!51406 (=> (not res!199866) (not e!165471))))

(declare-datatypes ((array!12873 0))(
  ( (array!12874 (arr!6637 (Array (_ BitVec 32) (_ BitVec 8))) (size!5650 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10222 0))(
  ( (BitStream!10223 (buf!6104 array!12873) (currentByte!11326 (_ BitVec 32)) (currentBit!11321 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10222)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51406 (= res!199866 (validate_offset_bits!1 ((_ sign_extend 32) (size!5650 (buf!6104 thiss!1854))) ((_ sign_extend 32) (currentByte!11326 thiss!1854)) ((_ sign_extend 32) (currentBit!11321 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51406 e!165471))

(declare-fun e!165472 () Bool)

(declare-fun inv!12 (BitStream!10222) Bool)

(assert (=> start!51406 (and (inv!12 thiss!1854) e!165472)))

(declare-fun b!239224 () Bool)

(assert (=> b!239224 (= e!165471 (bvsge (currentBit!11321 thiss!1854) #b00000000000000000000000010000000))))

(declare-fun b!239225 () Bool)

(declare-fun array_inv!5391 (array!12873) Bool)

(assert (=> b!239225 (= e!165472 (array_inv!5391 (buf!6104 thiss!1854)))))

(assert (= (and start!51406 res!199866) b!239224))

(assert (= start!51406 b!239225))

(declare-fun m!361321 () Bool)

(assert (=> start!51406 m!361321))

(declare-fun m!361323 () Bool)

(assert (=> start!51406 m!361323))

(declare-fun m!361325 () Bool)

(assert (=> b!239225 m!361325))

(push 1)

(assert (not b!239225))

(assert (not start!51406))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80569 () Bool)

(assert (=> d!80569 (= (array_inv!5391 (buf!6104 thiss!1854)) (bvsge (size!5650 (buf!6104 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239225 d!80569))

(declare-fun d!80574 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80574 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5650 (buf!6104 thiss!1854))) ((_ sign_extend 32) (currentByte!11326 thiss!1854)) ((_ sign_extend 32) (currentBit!11321 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5650 (buf!6104 thiss!1854))) ((_ sign_extend 32) (currentByte!11326 thiss!1854)) ((_ sign_extend 32) (currentBit!11321 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20258 () Bool)

(assert (= bs!20258 d!80574))

(declare-fun m!361341 () Bool)

(assert (=> bs!20258 m!361341))

(assert (=> start!51406 d!80574))

(declare-fun d!80578 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80578 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11321 thiss!1854) (currentByte!11326 thiss!1854) (size!5650 (buf!6104 thiss!1854))))))

(declare-fun bs!20259 () Bool)

(assert (= bs!20259 d!80578))

(declare-fun m!361343 () Bool)

(assert (=> bs!20259 m!361343))

(assert (=> start!51406 d!80578))

(push 1)

(assert (not d!80574))

(assert (not d!80578))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80588 () Bool)

(assert (=> d!80588 (= (remainingBits!0 ((_ sign_extend 32) (size!5650 (buf!6104 thiss!1854))) ((_ sign_extend 32) (currentByte!11326 thiss!1854)) ((_ sign_extend 32) (currentBit!11321 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5650 (buf!6104 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11326 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11321 thiss!1854)))))))

(assert (=> d!80574 d!80588))

(declare-fun d!80592 () Bool)

(assert (=> d!80592 (= (invariant!0 (currentBit!11321 thiss!1854) (currentByte!11326 thiss!1854) (size!5650 (buf!6104 thiss!1854))) (and (bvsge (currentBit!11321 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11321 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11326 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11326 thiss!1854) (size!5650 (buf!6104 thiss!1854))) (and (= (currentBit!11321 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11326 thiss!1854) (size!5650 (buf!6104 thiss!1854)))))))))

(assert (=> d!80578 d!80592))

(push 1)

(check-sat)

