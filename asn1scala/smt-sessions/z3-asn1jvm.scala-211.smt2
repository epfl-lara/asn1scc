; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4200 () Bool)

(assert start!4200)

(declare-fun res!15452 () Bool)

(declare-fun e!11239 () Bool)

(assert (=> start!4200 (=> (not res!15452) (not e!11239))))

(declare-fun nBits!604 () (_ BitVec 64))

(assert (=> start!4200 (= res!15452 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4200 e!11239))

(assert (=> start!4200 true))

(declare-datatypes ((array!1153 0))(
  ( (array!1154 (arr!920 (Array (_ BitVec 32) (_ BitVec 8))) (size!491 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!852 0))(
  ( (BitStream!853 (buf!809 array!1153) (currentByte!2003 (_ BitVec 32)) (currentBit!1998 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!852)

(declare-fun e!11240 () Bool)

(declare-fun inv!12 (BitStream!852) Bool)

(assert (=> start!4200 (and (inv!12 thiss!1917) e!11240)))

(declare-fun b!17505 () Bool)

(declare-fun res!15451 () Bool)

(assert (=> b!17505 (=> (not res!15451) (not e!11239))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17505 (= res!15451 (validate_offset_bits!1 ((_ sign_extend 32) (size!491 (buf!809 thiss!1917))) ((_ sign_extend 32) (currentByte!2003 thiss!1917)) ((_ sign_extend 32) (currentBit!1998 thiss!1917)) nBits!604))))

(declare-fun b!17506 () Bool)

(assert (=> b!17506 (= e!11239 (bvsgt nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(declare-fun b!17507 () Bool)

(declare-fun array_inv!461 (array!1153) Bool)

(assert (=> b!17507 (= e!11240 (array_inv!461 (buf!809 thiss!1917)))))

(assert (= (and start!4200 res!15452) b!17505))

(assert (= (and b!17505 res!15451) b!17506))

(assert (= start!4200 b!17507))

(declare-fun m!23815 () Bool)

(assert (=> start!4200 m!23815))

(declare-fun m!23817 () Bool)

(assert (=> b!17505 m!23817))

(declare-fun m!23819 () Bool)

(assert (=> b!17507 m!23819))

(check-sat (not b!17507) (not b!17505) (not start!4200))
(check-sat)
(get-model)

(declare-fun d!5738 () Bool)

(assert (=> d!5738 (= (array_inv!461 (buf!809 thiss!1917)) (bvsge (size!491 (buf!809 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!17507 d!5738))

(declare-fun d!5740 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5740 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!491 (buf!809 thiss!1917))) ((_ sign_extend 32) (currentByte!2003 thiss!1917)) ((_ sign_extend 32) (currentBit!1998 thiss!1917)) nBits!604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!491 (buf!809 thiss!1917))) ((_ sign_extend 32) (currentByte!2003 thiss!1917)) ((_ sign_extend 32) (currentBit!1998 thiss!1917))) nBits!604))))

(declare-fun bs!1642 () Bool)

(assert (= bs!1642 d!5740))

(declare-fun m!23835 () Bool)

(assert (=> bs!1642 m!23835))

(assert (=> b!17505 d!5740))

(declare-fun d!5742 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!5742 (= (inv!12 thiss!1917) (invariant!0 (currentBit!1998 thiss!1917) (currentByte!2003 thiss!1917) (size!491 (buf!809 thiss!1917))))))

(declare-fun bs!1643 () Bool)

(assert (= bs!1643 d!5742))

(declare-fun m!23837 () Bool)

(assert (=> bs!1643 m!23837))

(assert (=> start!4200 d!5742))

(check-sat (not d!5740) (not d!5742))
(check-sat)
(get-model)

(declare-fun d!5752 () Bool)

(assert (=> d!5752 (= (remainingBits!0 ((_ sign_extend 32) (size!491 (buf!809 thiss!1917))) ((_ sign_extend 32) (currentByte!2003 thiss!1917)) ((_ sign_extend 32) (currentBit!1998 thiss!1917))) (bvsub (bvmul ((_ sign_extend 32) (size!491 (buf!809 thiss!1917))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2003 thiss!1917)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1998 thiss!1917)))))))

(assert (=> d!5740 d!5752))

(declare-fun d!5754 () Bool)

(assert (=> d!5754 (= (invariant!0 (currentBit!1998 thiss!1917) (currentByte!2003 thiss!1917) (size!491 (buf!809 thiss!1917))) (and (bvsge (currentBit!1998 thiss!1917) #b00000000000000000000000000000000) (bvslt (currentBit!1998 thiss!1917) #b00000000000000000000000000001000) (bvsge (currentByte!2003 thiss!1917) #b00000000000000000000000000000000) (or (bvslt (currentByte!2003 thiss!1917) (size!491 (buf!809 thiss!1917))) (and (= (currentBit!1998 thiss!1917) #b00000000000000000000000000000000) (= (currentByte!2003 thiss!1917) (size!491 (buf!809 thiss!1917)))))))))

(assert (=> d!5742 d!5754))

(check-sat)
