; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51342 () Bool)

(assert start!51342)

(declare-fun res!199851 () Bool)

(declare-fun e!165426 () Bool)

(assert (=> start!51342 (=> (not res!199851) (not e!165426))))

(declare-datatypes ((array!12857 0))(
  ( (array!12858 (arr!6632 (Array (_ BitVec 32) (_ BitVec 8))) (size!5645 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10212 0))(
  ( (BitStream!10213 (buf!6099 array!12857) (currentByte!11306 (_ BitVec 32)) (currentBit!11301 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10212)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51342 (= res!199851 (validate_offset_bits!1 ((_ sign_extend 32) (size!5645 (buf!6099 thiss!1854))) ((_ sign_extend 32) (currentByte!11306 thiss!1854)) ((_ sign_extend 32) (currentBit!11301 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51342 e!165426))

(declare-fun e!165427 () Bool)

(declare-fun inv!12 (BitStream!10212) Bool)

(assert (=> start!51342 (and (inv!12 thiss!1854) e!165427)))

(declare-fun b!239194 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239194 (= e!165426 (not (invariant!0 (currentBit!11301 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11306 thiss!1854)) (size!5645 (buf!6099 thiss!1854)))))))

(declare-fun b!239195 () Bool)

(declare-fun array_inv!5386 (array!12857) Bool)

(assert (=> b!239195 (= e!165427 (array_inv!5386 (buf!6099 thiss!1854)))))

(assert (= (and start!51342 res!199851) b!239194))

(assert (= start!51342 b!239195))

(declare-fun m!361263 () Bool)

(assert (=> start!51342 m!361263))

(declare-fun m!361265 () Bool)

(assert (=> start!51342 m!361265))

(declare-fun m!361267 () Bool)

(assert (=> b!239194 m!361267))

(declare-fun m!361269 () Bool)

(assert (=> b!239195 m!361269))

(check-sat (not b!239195) (not b!239194) (not start!51342))
(check-sat)
(get-model)

(declare-fun d!80520 () Bool)

(assert (=> d!80520 (= (array_inv!5386 (buf!6099 thiss!1854)) (bvsge (size!5645 (buf!6099 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239195 d!80520))

(declare-fun d!80522 () Bool)

(assert (=> d!80522 (= (invariant!0 (currentBit!11301 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11306 thiss!1854)) (size!5645 (buf!6099 thiss!1854))) (and (bvsge (currentBit!11301 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11301 thiss!1854) #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!11306 thiss!1854)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!11306 thiss!1854)) (size!5645 (buf!6099 thiss!1854))) (and (= (currentBit!11301 thiss!1854) #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 (currentByte!11306 thiss!1854)) (size!5645 (buf!6099 thiss!1854)))))))))

(assert (=> b!239194 d!80522))

(declare-fun d!80524 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80524 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5645 (buf!6099 thiss!1854))) ((_ sign_extend 32) (currentByte!11306 thiss!1854)) ((_ sign_extend 32) (currentBit!11301 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5645 (buf!6099 thiss!1854))) ((_ sign_extend 32) (currentByte!11306 thiss!1854)) ((_ sign_extend 32) (currentBit!11301 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20243 () Bool)

(assert (= bs!20243 d!80524))

(declare-fun m!361287 () Bool)

(assert (=> bs!20243 m!361287))

(assert (=> start!51342 d!80524))

(declare-fun d!80526 () Bool)

(assert (=> d!80526 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11301 thiss!1854) (currentByte!11306 thiss!1854) (size!5645 (buf!6099 thiss!1854))))))

(declare-fun bs!20244 () Bool)

(assert (= bs!20244 d!80526))

(declare-fun m!361289 () Bool)

(assert (=> bs!20244 m!361289))

(assert (=> start!51342 d!80526))

(check-sat (not d!80524) (not d!80526))
(check-sat)
(get-model)

(declare-fun d!80528 () Bool)

(assert (=> d!80528 (= (remainingBits!0 ((_ sign_extend 32) (size!5645 (buf!6099 thiss!1854))) ((_ sign_extend 32) (currentByte!11306 thiss!1854)) ((_ sign_extend 32) (currentBit!11301 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5645 (buf!6099 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11306 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11301 thiss!1854)))))))

(assert (=> d!80524 d!80528))

(declare-fun d!80532 () Bool)

(assert (=> d!80532 (= (invariant!0 (currentBit!11301 thiss!1854) (currentByte!11306 thiss!1854) (size!5645 (buf!6099 thiss!1854))) (and (bvsge (currentBit!11301 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11301 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11306 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11306 thiss!1854) (size!5645 (buf!6099 thiss!1854))) (and (= (currentBit!11301 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11306 thiss!1854) (size!5645 (buf!6099 thiss!1854)))))))))

(assert (=> d!80526 d!80532))

(check-sat)
