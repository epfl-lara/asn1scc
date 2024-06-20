; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51526 () Bool)

(assert start!51526)

(declare-fun res!199911 () Bool)

(declare-fun e!165606 () Bool)

(assert (=> start!51526 (=> (not res!199911) (not e!165606))))

(declare-datatypes ((array!12912 0))(
  ( (array!12913 (arr!6652 (Array (_ BitVec 32) (_ BitVec 8))) (size!5665 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10252 0))(
  ( (BitStream!10253 (buf!6119 array!12912) (currentByte!11368 (_ BitVec 32)) (currentBit!11363 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10252)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51526 (= res!199911 (validate_offset_bits!1 ((_ sign_extend 32) (size!5665 (buf!6119 thiss!1854))) ((_ sign_extend 32) (currentByte!11368 thiss!1854)) ((_ sign_extend 32) (currentBit!11363 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51526 e!165606))

(declare-fun e!165607 () Bool)

(declare-fun inv!12 (BitStream!10252) Bool)

(assert (=> start!51526 (and (inv!12 thiss!1854) e!165607)))

(declare-fun b!239314 () Bool)

(assert (=> b!239314 (= e!165606 (bvsgt ((_ sign_extend 24) ((_ extract 7 0) (currentBit!11363 thiss!1854))) #b00000000000000000000000000100000))))

(declare-fun b!239315 () Bool)

(declare-fun array_inv!5406 (array!12912) Bool)

(assert (=> b!239315 (= e!165607 (array_inv!5406 (buf!6119 thiss!1854)))))

(assert (= (and start!51526 res!199911) b!239314))

(assert (= start!51526 b!239315))

(declare-fun m!361447 () Bool)

(assert (=> start!51526 m!361447))

(declare-fun m!361449 () Bool)

(assert (=> start!51526 m!361449))

(declare-fun m!361451 () Bool)

(assert (=> b!239315 m!361451))

(push 1)

(assert (not start!51526))

(assert (not b!239315))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80668 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80668 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5665 (buf!6119 thiss!1854))) ((_ sign_extend 32) (currentByte!11368 thiss!1854)) ((_ sign_extend 32) (currentBit!11363 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5665 (buf!6119 thiss!1854))) ((_ sign_extend 32) (currentByte!11368 thiss!1854)) ((_ sign_extend 32) (currentBit!11363 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20290 () Bool)

(assert (= bs!20290 d!80668))

(declare-fun m!361465 () Bool)

(assert (=> bs!20290 m!361465))

(assert (=> start!51526 d!80668))

(declare-fun d!80670 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80670 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11363 thiss!1854) (currentByte!11368 thiss!1854) (size!5665 (buf!6119 thiss!1854))))))

(declare-fun bs!20291 () Bool)

(assert (= bs!20291 d!80670))

(declare-fun m!361467 () Bool)

(assert (=> bs!20291 m!361467))

(assert (=> start!51526 d!80670))

(declare-fun d!80676 () Bool)

(assert (=> d!80676 (= (array_inv!5406 (buf!6119 thiss!1854)) (bvsge (size!5665 (buf!6119 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239315 d!80676))

(push 1)

(assert (not d!80670))

(assert (not d!80668))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80686 () Bool)

(assert (=> d!80686 (= (invariant!0 (currentBit!11363 thiss!1854) (currentByte!11368 thiss!1854) (size!5665 (buf!6119 thiss!1854))) (and (bvsge (currentBit!11363 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11363 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11368 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11368 thiss!1854) (size!5665 (buf!6119 thiss!1854))) (and (= (currentBit!11363 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11368 thiss!1854) (size!5665 (buf!6119 thiss!1854)))))))))

(assert (=> d!80670 d!80686))

(declare-fun d!80690 () Bool)

(assert (=> d!80690 (= (remainingBits!0 ((_ sign_extend 32) (size!5665 (buf!6119 thiss!1854))) ((_ sign_extend 32) (currentByte!11368 thiss!1854)) ((_ sign_extend 32) (currentBit!11363 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5665 (buf!6119 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11368 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11363 thiss!1854)))))))

(assert (=> d!80668 d!80690))

(push 1)

(check-sat)

