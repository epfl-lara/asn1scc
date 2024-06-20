; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71626 () Bool)

(assert start!71626)

(declare-fun b!321783 () Bool)

(declare-fun e!231896 () Bool)

(declare-datatypes ((array!20499 0))(
  ( (array!20500 (arr!10016 (Array (_ BitVec 32) (_ BitVec 8))) (size!8924 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14010 0))(
  ( (BitStream!14011 (buf!8066 array!20499) (currentByte!14871 (_ BitVec 32)) (currentBit!14866 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14010)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321783 (= e!231896 (not (invariant!0 (currentBit!14866 thiss!1793) (currentByte!14871 thiss!1793) (size!8924 (buf!8066 thiss!1793)))))))

(declare-fun b!321784 () Bool)

(declare-fun e!231895 () Bool)

(declare-fun array_inv!8476 (array!20499) Bool)

(assert (=> b!321784 (= e!231895 (array_inv!8476 (buf!8066 thiss!1793)))))

(declare-fun b!321785 () Bool)

(declare-fun res!264134 () Bool)

(assert (=> b!321785 (=> (not res!264134) (not e!231896))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321785 (= res!264134 (validate_offset_bits!1 ((_ sign_extend 32) (size!8924 (buf!8066 thiss!1793))) ((_ sign_extend 32) (currentByte!14871 thiss!1793)) ((_ sign_extend 32) (currentBit!14866 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!321786 () Bool)

(declare-fun res!264136 () Bool)

(assert (=> b!321786 (=> (not res!264136) (not e!231896))))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!321786 (= res!264136 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun b!321787 () Bool)

(declare-fun res!264133 () Bool)

(assert (=> b!321787 (=> (not res!264133) (not e!231896))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321787 (= res!264133 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!264135 () Bool)

(assert (=> start!71626 (=> (not res!264135) (not e!231896))))

(assert (=> start!71626 (= res!264135 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71626 e!231896))

(assert (=> start!71626 true))

(declare-fun inv!12 (BitStream!14010) Bool)

(assert (=> start!71626 (and (inv!12 thiss!1793) e!231895)))

(assert (= (and start!71626 res!264135) b!321785))

(assert (= (and b!321785 res!264134) b!321787))

(assert (= (and b!321787 res!264133) b!321786))

(assert (= (and b!321786 res!264136) b!321783))

(assert (= start!71626 b!321784))

(declare-fun m!460105 () Bool)

(assert (=> b!321783 m!460105))

(declare-fun m!460107 () Bool)

(assert (=> b!321785 m!460107))

(declare-fun m!460109 () Bool)

(assert (=> b!321784 m!460109))

(declare-fun m!460111 () Bool)

(assert (=> start!71626 m!460111))

(declare-fun m!460113 () Bool)

(assert (=> b!321787 m!460113))

(check-sat (not b!321784) (not b!321783) (not b!321785) (not start!71626) (not b!321787))
(check-sat)
(get-model)

(declare-fun d!105564 () Bool)

(assert (=> d!105564 (= (array_inv!8476 (buf!8066 thiss!1793)) (bvsge (size!8924 (buf!8066 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!321784 d!105564))

(declare-fun d!105570 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105570 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8924 (buf!8066 thiss!1793))) ((_ sign_extend 32) (currentByte!14871 thiss!1793)) ((_ sign_extend 32) (currentBit!14866 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8924 (buf!8066 thiss!1793))) ((_ sign_extend 32) (currentByte!14871 thiss!1793)) ((_ sign_extend 32) (currentBit!14866 thiss!1793))) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun bs!27798 () Bool)

(assert (= bs!27798 d!105570))

(declare-fun m!460125 () Bool)

(assert (=> bs!27798 m!460125))

(assert (=> b!321785 d!105570))

(declare-fun d!105574 () Bool)

(assert (=> d!105574 (= (invariant!0 (currentBit!14866 thiss!1793) (currentByte!14871 thiss!1793) (size!8924 (buf!8066 thiss!1793))) (and (bvsge (currentBit!14866 thiss!1793) #b00000000000000000000000000000000) (bvslt (currentBit!14866 thiss!1793) #b00000000000000000000000000001000) (bvsge (currentByte!14871 thiss!1793) #b00000000000000000000000000000000) (or (bvslt (currentByte!14871 thiss!1793) (size!8924 (buf!8066 thiss!1793))) (and (= (currentBit!14866 thiss!1793) #b00000000000000000000000000000000) (= (currentByte!14871 thiss!1793) (size!8924 (buf!8066 thiss!1793)))))))))

(assert (=> b!321783 d!105574))

(declare-fun d!105586 () Bool)

(assert (=> d!105586 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14866 thiss!1793) (currentByte!14871 thiss!1793) (size!8924 (buf!8066 thiss!1793))))))

(declare-fun bs!27801 () Bool)

(assert (= bs!27801 d!105586))

(assert (=> bs!27801 m!460105))

(assert (=> start!71626 d!105586))

(declare-fun d!105590 () Bool)

(assert (=> d!105590 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!321787 d!105590))

(check-sat (not d!105586) (not d!105570))
(check-sat)
