; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17514 () Bool)

(assert start!17514)

(declare-fun res!69312 () Bool)

(declare-fun e!56426 () Bool)

(assert (=> start!17514 (=> (not res!69312) (not e!56426))))

(declare-fun nBits!333 () (_ BitVec 32))

(assert (=> start!17514 (= res!69312 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000)))))

(assert (=> start!17514 e!56426))

(assert (=> start!17514 true))

(declare-datatypes ((array!4004 0))(
  ( (array!4005 (arr!2449 (Array (_ BitVec 32) (_ BitVec 8))) (size!1812 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3186 0))(
  ( (BitStream!3187 (buf!2202 array!4004) (currentByte!4366 (_ BitVec 32)) (currentBit!4361 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3186)

(declare-fun e!56425 () Bool)

(declare-fun inv!12 (BitStream!3186) Bool)

(assert (=> start!17514 (and (inv!12 thiss!1136) e!56425)))

(declare-fun b!84461 () Bool)

(declare-fun res!69313 () Bool)

(assert (=> b!84461 (=> (not res!69313) (not e!56426))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!84461 (= res!69313 (validate_offset_bits!1 ((_ sign_extend 32) (size!1812 (buf!2202 thiss!1136))) ((_ sign_extend 32) (currentByte!4366 thiss!1136)) ((_ sign_extend 32) (currentBit!4361 thiss!1136)) ((_ sign_extend 32) nBits!333)))))

(declare-fun b!84462 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84462 (= e!56426 (not (invariant!0 (currentBit!4361 thiss!1136) (currentByte!4366 thiss!1136) (size!1812 (buf!2202 thiss!1136)))))))

(declare-fun b!84463 () Bool)

(declare-fun array_inv!1658 (array!4004) Bool)

(assert (=> b!84463 (= e!56425 (array_inv!1658 (buf!2202 thiss!1136)))))

(assert (= (and start!17514 res!69312) b!84461))

(assert (= (and b!84461 res!69313) b!84462))

(assert (= start!17514 b!84463))

(declare-fun m!131029 () Bool)

(assert (=> start!17514 m!131029))

(declare-fun m!131031 () Bool)

(assert (=> b!84461 m!131031))

(declare-fun m!131033 () Bool)

(assert (=> b!84462 m!131033))

(declare-fun m!131035 () Bool)

(assert (=> b!84463 m!131035))

(check-sat (not b!84462) (not b!84463) (not b!84461) (not start!17514))
(check-sat)
(get-model)

(declare-fun d!27144 () Bool)

(assert (=> d!27144 (= (invariant!0 (currentBit!4361 thiss!1136) (currentByte!4366 thiss!1136) (size!1812 (buf!2202 thiss!1136))) (and (bvsge (currentBit!4361 thiss!1136) #b00000000000000000000000000000000) (bvslt (currentBit!4361 thiss!1136) #b00000000000000000000000000001000) (bvsge (currentByte!4366 thiss!1136) #b00000000000000000000000000000000) (or (bvslt (currentByte!4366 thiss!1136) (size!1812 (buf!2202 thiss!1136))) (and (= (currentBit!4361 thiss!1136) #b00000000000000000000000000000000) (= (currentByte!4366 thiss!1136) (size!1812 (buf!2202 thiss!1136)))))))))

(assert (=> b!84462 d!27144))

(declare-fun d!27152 () Bool)

(assert (=> d!27152 (= (array_inv!1658 (buf!2202 thiss!1136)) (bvsge (size!1812 (buf!2202 thiss!1136)) #b00000000000000000000000000000000))))

(assert (=> b!84463 d!27152))

(declare-fun d!27158 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27158 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1812 (buf!2202 thiss!1136))) ((_ sign_extend 32) (currentByte!4366 thiss!1136)) ((_ sign_extend 32) (currentBit!4361 thiss!1136)) ((_ sign_extend 32) nBits!333)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1812 (buf!2202 thiss!1136))) ((_ sign_extend 32) (currentByte!4366 thiss!1136)) ((_ sign_extend 32) (currentBit!4361 thiss!1136))) ((_ sign_extend 32) nBits!333)))))

(declare-fun bs!6722 () Bool)

(assert (= bs!6722 d!27158))

(declare-fun m!131049 () Bool)

(assert (=> bs!6722 m!131049))

(assert (=> b!84461 d!27158))

(declare-fun d!27164 () Bool)

(assert (=> d!27164 (= (inv!12 thiss!1136) (invariant!0 (currentBit!4361 thiss!1136) (currentByte!4366 thiss!1136) (size!1812 (buf!2202 thiss!1136))))))

(declare-fun bs!6724 () Bool)

(assert (= bs!6724 d!27164))

(assert (=> bs!6724 m!131033))

(assert (=> start!17514 d!27164))

(check-sat (not d!27158) (not d!27164))
