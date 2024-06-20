; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71624 () Bool)

(assert start!71624)

(declare-fun res!264122 () Bool)

(declare-fun e!231887 () Bool)

(assert (=> start!71624 (=> (not res!264122) (not e!231887))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!71624 (= res!264122 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71624 e!231887))

(assert (=> start!71624 true))

(declare-datatypes ((array!20497 0))(
  ( (array!20498 (arr!10015 (Array (_ BitVec 32) (_ BitVec 8))) (size!8923 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14008 0))(
  ( (BitStream!14009 (buf!8065 array!20497) (currentByte!14870 (_ BitVec 32)) (currentBit!14865 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14008)

(declare-fun e!231886 () Bool)

(declare-fun inv!12 (BitStream!14008) Bool)

(assert (=> start!71624 (and (inv!12 thiss!1793) e!231886)))

(declare-fun b!321768 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321768 (= e!231887 (not (invariant!0 (currentBit!14865 thiss!1793) (currentByte!14870 thiss!1793) (size!8923 (buf!8065 thiss!1793)))))))

(declare-fun b!321769 () Bool)

(declare-fun res!264121 () Bool)

(assert (=> b!321769 (=> (not res!264121) (not e!231887))))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!321769 (= res!264121 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun b!321770 () Bool)

(declare-fun res!264123 () Bool)

(assert (=> b!321770 (=> (not res!264123) (not e!231887))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321770 (= res!264123 (validate_offset_bits!1 ((_ sign_extend 32) (size!8923 (buf!8065 thiss!1793))) ((_ sign_extend 32) (currentByte!14870 thiss!1793)) ((_ sign_extend 32) (currentBit!14865 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!321771 () Bool)

(declare-fun array_inv!8475 (array!20497) Bool)

(assert (=> b!321771 (= e!231886 (array_inv!8475 (buf!8065 thiss!1793)))))

(declare-fun b!321772 () Bool)

(declare-fun res!264124 () Bool)

(assert (=> b!321772 (=> (not res!264124) (not e!231887))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321772 (= res!264124 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!71624 res!264122) b!321770))

(assert (= (and b!321770 res!264123) b!321772))

(assert (= (and b!321772 res!264124) b!321769))

(assert (= (and b!321769 res!264121) b!321768))

(assert (= start!71624 b!321771))

(declare-fun m!460095 () Bool)

(assert (=> b!321771 m!460095))

(declare-fun m!460097 () Bool)

(assert (=> b!321768 m!460097))

(declare-fun m!460099 () Bool)

(assert (=> b!321770 m!460099))

(declare-fun m!460101 () Bool)

(assert (=> start!71624 m!460101))

(declare-fun m!460103 () Bool)

(assert (=> b!321772 m!460103))

(push 1)

(assert (not b!321772))

(assert (not b!321770))

(assert (not b!321768))

(assert (not start!71624))

(assert (not b!321771))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105566 () Bool)

(assert (=> d!105566 (= (invariant!0 (currentBit!14865 thiss!1793) (currentByte!14870 thiss!1793) (size!8923 (buf!8065 thiss!1793))) (and (bvsge (currentBit!14865 thiss!1793) #b00000000000000000000000000000000) (bvslt (currentBit!14865 thiss!1793) #b00000000000000000000000000001000) (bvsge (currentByte!14870 thiss!1793) #b00000000000000000000000000000000) (or (bvslt (currentByte!14870 thiss!1793) (size!8923 (buf!8065 thiss!1793))) (and (= (currentBit!14865 thiss!1793) #b00000000000000000000000000000000) (= (currentByte!14870 thiss!1793) (size!8923 (buf!8065 thiss!1793)))))))))

(assert (=> b!321768 d!105566))

(declare-fun d!105576 () Bool)

(assert (=> d!105576 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14865 thiss!1793) (currentByte!14870 thiss!1793) (size!8923 (buf!8065 thiss!1793))))))

(declare-fun bs!27799 () Bool)

(assert (= bs!27799 d!105576))

(assert (=> bs!27799 m!460097))

(assert (=> start!71624 d!105576))

(declare-fun d!105580 () Bool)

(assert (=> d!105580 (= (array_inv!8475 (buf!8065 thiss!1793)) (bvsge (size!8923 (buf!8065 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!321771 d!105580))

(declare-fun d!105584 () Bool)

(assert (=> d!105584 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!321772 d!105584))

(declare-fun d!105588 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105588 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8923 (buf!8065 thiss!1793))) ((_ sign_extend 32) (currentByte!14870 thiss!1793)) ((_ sign_extend 32) (currentBit!14865 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8923 (buf!8065 thiss!1793))) ((_ sign_extend 32) (currentByte!14870 thiss!1793)) ((_ sign_extend 32) (currentBit!14865 thiss!1793))) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun bs!27802 () Bool)

(assert (= bs!27802 d!105588))

(declare-fun m!460127 () Bool)

(assert (=> bs!27802 m!460127))

(assert (=> b!321770 d!105588))

(push 1)

(assert (not d!105576))

(assert (not d!105588))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

