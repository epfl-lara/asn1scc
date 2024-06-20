; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51600 () Bool)

(assert start!51600)

(declare-fun res!199932 () Bool)

(declare-fun e!165669 () Bool)

(assert (=> start!51600 (=> (not res!199932) (not e!165669))))

(declare-datatypes ((array!12932 0))(
  ( (array!12933 (arr!6659 (Array (_ BitVec 32) (_ BitVec 8))) (size!5672 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10266 0))(
  ( (BitStream!10267 (buf!6126 array!12932) (currentByte!11393 (_ BitVec 32)) (currentBit!11388 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10266)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51600 (= res!199932 (validate_offset_bits!1 ((_ sign_extend 32) (size!5672 (buf!6126 thiss!1854))) ((_ sign_extend 32) (currentByte!11393 thiss!1854)) ((_ sign_extend 32) (currentBit!11388 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51600 e!165669))

(declare-fun e!165670 () Bool)

(declare-fun inv!12 (BitStream!10266) Bool)

(assert (=> start!51600 (and (inv!12 thiss!1854) e!165670)))

(declare-fun b!239356 () Bool)

(assert (=> b!239356 (= e!165669 (not (inv!12 (BitStream!10267 (buf!6126 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11393 thiss!1854)) (currentBit!11388 thiss!1854)))))))

(declare-fun b!239357 () Bool)

(declare-fun array_inv!5413 (array!12932) Bool)

(assert (=> b!239357 (= e!165670 (array_inv!5413 (buf!6126 thiss!1854)))))

(assert (= (and start!51600 res!199932) b!239356))

(assert (= start!51600 b!239357))

(declare-fun m!361515 () Bool)

(assert (=> start!51600 m!361515))

(declare-fun m!361517 () Bool)

(assert (=> start!51600 m!361517))

(declare-fun m!361519 () Bool)

(assert (=> b!239356 m!361519))

(declare-fun m!361521 () Bool)

(assert (=> b!239357 m!361521))

(check-sat (not start!51600) (not b!239356) (not b!239357))
(check-sat)
(get-model)

(declare-fun d!80748 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80748 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5672 (buf!6126 thiss!1854))) ((_ sign_extend 32) (currentByte!11393 thiss!1854)) ((_ sign_extend 32) (currentBit!11388 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5672 (buf!6126 thiss!1854))) ((_ sign_extend 32) (currentByte!11393 thiss!1854)) ((_ sign_extend 32) (currentBit!11388 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20314 () Bool)

(assert (= bs!20314 d!80748))

(declare-fun m!361543 () Bool)

(assert (=> bs!20314 m!361543))

(assert (=> start!51600 d!80748))

(declare-fun d!80750 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80750 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11388 thiss!1854) (currentByte!11393 thiss!1854) (size!5672 (buf!6126 thiss!1854))))))

(declare-fun bs!20315 () Bool)

(assert (= bs!20315 d!80750))

(declare-fun m!361545 () Bool)

(assert (=> bs!20315 m!361545))

(assert (=> start!51600 d!80750))

(declare-fun d!80752 () Bool)

(assert (=> d!80752 (= (inv!12 (BitStream!10267 (buf!6126 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11393 thiss!1854)) (currentBit!11388 thiss!1854))) (invariant!0 (currentBit!11388 (BitStream!10267 (buf!6126 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11393 thiss!1854)) (currentBit!11388 thiss!1854))) (currentByte!11393 (BitStream!10267 (buf!6126 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11393 thiss!1854)) (currentBit!11388 thiss!1854))) (size!5672 (buf!6126 (BitStream!10267 (buf!6126 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11393 thiss!1854)) (currentBit!11388 thiss!1854))))))))

(declare-fun bs!20316 () Bool)

(assert (= bs!20316 d!80752))

(declare-fun m!361547 () Bool)

(assert (=> bs!20316 m!361547))

(assert (=> b!239356 d!80752))

(declare-fun d!80754 () Bool)

(assert (=> d!80754 (= (array_inv!5413 (buf!6126 thiss!1854)) (bvsge (size!5672 (buf!6126 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239357 d!80754))

(check-sat (not d!80752) (not d!80748) (not d!80750))
(check-sat)
(get-model)

(declare-fun d!80762 () Bool)

(assert (=> d!80762 (= (invariant!0 (currentBit!11388 (BitStream!10267 (buf!6126 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11393 thiss!1854)) (currentBit!11388 thiss!1854))) (currentByte!11393 (BitStream!10267 (buf!6126 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11393 thiss!1854)) (currentBit!11388 thiss!1854))) (size!5672 (buf!6126 (BitStream!10267 (buf!6126 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11393 thiss!1854)) (currentBit!11388 thiss!1854))))) (and (bvsge (currentBit!11388 (BitStream!10267 (buf!6126 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11393 thiss!1854)) (currentBit!11388 thiss!1854))) #b00000000000000000000000000000000) (bvslt (currentBit!11388 (BitStream!10267 (buf!6126 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11393 thiss!1854)) (currentBit!11388 thiss!1854))) #b00000000000000000000000000001000) (bvsge (currentByte!11393 (BitStream!10267 (buf!6126 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11393 thiss!1854)) (currentBit!11388 thiss!1854))) #b00000000000000000000000000000000) (or (bvslt (currentByte!11393 (BitStream!10267 (buf!6126 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11393 thiss!1854)) (currentBit!11388 thiss!1854))) (size!5672 (buf!6126 (BitStream!10267 (buf!6126 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11393 thiss!1854)) (currentBit!11388 thiss!1854))))) (and (= (currentBit!11388 (BitStream!10267 (buf!6126 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11393 thiss!1854)) (currentBit!11388 thiss!1854))) #b00000000000000000000000000000000) (= (currentByte!11393 (BitStream!10267 (buf!6126 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11393 thiss!1854)) (currentBit!11388 thiss!1854))) (size!5672 (buf!6126 (BitStream!10267 (buf!6126 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11393 thiss!1854)) (currentBit!11388 thiss!1854)))))))))))

(assert (=> d!80752 d!80762))

(declare-fun d!80768 () Bool)

(assert (=> d!80768 (= (remainingBits!0 ((_ sign_extend 32) (size!5672 (buf!6126 thiss!1854))) ((_ sign_extend 32) (currentByte!11393 thiss!1854)) ((_ sign_extend 32) (currentBit!11388 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5672 (buf!6126 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11393 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11388 thiss!1854)))))))

(assert (=> d!80748 d!80768))

(declare-fun d!80772 () Bool)

(assert (=> d!80772 (= (invariant!0 (currentBit!11388 thiss!1854) (currentByte!11393 thiss!1854) (size!5672 (buf!6126 thiss!1854))) (and (bvsge (currentBit!11388 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11388 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11393 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11393 thiss!1854) (size!5672 (buf!6126 thiss!1854))) (and (= (currentBit!11388 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11393 thiss!1854) (size!5672 (buf!6126 thiss!1854)))))))))

(assert (=> d!80750 d!80772))

(check-sat)
