; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71628 () Bool)

(assert start!71628)

(declare-fun b!321798 () Bool)

(declare-fun e!231905 () Bool)

(declare-datatypes ((array!20501 0))(
  ( (array!20502 (arr!10017 (Array (_ BitVec 32) (_ BitVec 8))) (size!8925 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14012 0))(
  ( (BitStream!14013 (buf!8067 array!20501) (currentByte!14872 (_ BitVec 32)) (currentBit!14867 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14012)

(declare-fun array_inv!8477 (array!20501) Bool)

(assert (=> b!321798 (= e!231905 (array_inv!8477 (buf!8067 thiss!1793)))))

(declare-fun b!321799 () Bool)

(declare-fun res!264146 () Bool)

(declare-fun e!231906 () Bool)

(assert (=> b!321799 (=> (not res!264146) (not e!231906))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!321799 (= res!264146 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun b!321800 () Bool)

(declare-fun res!264145 () Bool)

(assert (=> b!321800 (=> (not res!264145) (not e!231906))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321800 (= res!264145 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!264147 () Bool)

(assert (=> start!71628 (=> (not res!264147) (not e!231906))))

(assert (=> start!71628 (= res!264147 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71628 e!231906))

(assert (=> start!71628 true))

(declare-fun inv!12 (BitStream!14012) Bool)

(assert (=> start!71628 (and (inv!12 thiss!1793) e!231905)))

(declare-fun b!321801 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321801 (= e!231906 (not (invariant!0 (currentBit!14867 thiss!1793) (currentByte!14872 thiss!1793) (size!8925 (buf!8067 thiss!1793)))))))

(declare-fun b!321802 () Bool)

(declare-fun res!264148 () Bool)

(assert (=> b!321802 (=> (not res!264148) (not e!231906))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321802 (= res!264148 (validate_offset_bits!1 ((_ sign_extend 32) (size!8925 (buf!8067 thiss!1793))) ((_ sign_extend 32) (currentByte!14872 thiss!1793)) ((_ sign_extend 32) (currentBit!14867 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(assert (= (and start!71628 res!264147) b!321802))

(assert (= (and b!321802 res!264148) b!321800))

(assert (= (and b!321800 res!264145) b!321799))

(assert (= (and b!321799 res!264146) b!321801))

(assert (= start!71628 b!321798))

(declare-fun m!460115 () Bool)

(assert (=> b!321800 m!460115))

(declare-fun m!460117 () Bool)

(assert (=> b!321801 m!460117))

(declare-fun m!460119 () Bool)

(assert (=> b!321798 m!460119))

(declare-fun m!460121 () Bool)

(assert (=> b!321802 m!460121))

(declare-fun m!460123 () Bool)

(assert (=> start!71628 m!460123))

(push 1)

(assert (not start!71628))

(assert (not b!321802))

(assert (not b!321800))

(assert (not b!321801))

(assert (not b!321798))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105568 () Bool)

(assert (=> d!105568 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!321800 d!105568))

(declare-fun d!105572 () Bool)

(assert (=> d!105572 (= (array_inv!8477 (buf!8067 thiss!1793)) (bvsge (size!8925 (buf!8067 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!321798 d!105572))

(declare-fun d!105578 () Bool)

(assert (=> d!105578 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14867 thiss!1793) (currentByte!14872 thiss!1793) (size!8925 (buf!8067 thiss!1793))))))

(declare-fun bs!27800 () Bool)

(assert (= bs!27800 d!105578))

(assert (=> bs!27800 m!460117))

(assert (=> start!71628 d!105578))

(declare-fun d!105582 () Bool)

(assert (=> d!105582 (= (invariant!0 (currentBit!14867 thiss!1793) (currentByte!14872 thiss!1793) (size!8925 (buf!8067 thiss!1793))) (and (bvsge (currentBit!14867 thiss!1793) #b00000000000000000000000000000000) (bvslt (currentBit!14867 thiss!1793) #b00000000000000000000000000001000) (bvsge (currentByte!14872 thiss!1793) #b00000000000000000000000000000000) (or (bvslt (currentByte!14872 thiss!1793) (size!8925 (buf!8067 thiss!1793))) (and (= (currentBit!14867 thiss!1793) #b00000000000000000000000000000000) (= (currentByte!14872 thiss!1793) (size!8925 (buf!8067 thiss!1793)))))))))

(assert (=> b!321801 d!105582))

(declare-fun d!105592 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105592 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8925 (buf!8067 thiss!1793))) ((_ sign_extend 32) (currentByte!14872 thiss!1793)) ((_ sign_extend 32) (currentBit!14867 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8925 (buf!8067 thiss!1793))) ((_ sign_extend 32) (currentByte!14872 thiss!1793)) ((_ sign_extend 32) (currentBit!14867 thiss!1793))) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun bs!27803 () Bool)

(assert (= bs!27803 d!105592))

(declare-fun m!460129 () Bool)

(assert (=> bs!27803 m!460129))

(assert (=> b!321802 d!105592))

(push 1)

