; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71588 () Bool)

(assert start!71588)

(declare-fun res!264088 () Bool)

(declare-fun e!231859 () Bool)

(assert (=> start!71588 (=> (not res!264088) (not e!231859))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!71588 (= res!264088 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71588 e!231859))

(assert (=> start!71588 true))

(declare-datatypes ((array!20488 0))(
  ( (array!20489 (arr!10012 (Array (_ BitVec 32) (_ BitVec 8))) (size!8920 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14002 0))(
  ( (BitStream!14003 (buf!8062 array!20488) (currentByte!14861 (_ BitVec 32)) (currentBit!14856 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14002)

(declare-fun e!231861 () Bool)

(declare-fun inv!12 (BitStream!14002) Bool)

(assert (=> start!71588 (and (inv!12 thiss!1793) e!231861)))

(declare-fun b!321723 () Bool)

(declare-fun array_inv!8472 (array!20488) Bool)

(assert (=> b!321723 (= e!231861 (array_inv!8472 (buf!8062 thiss!1793)))))

(declare-fun b!321724 () Bool)

(declare-fun res!264086 () Bool)

(assert (=> b!321724 (=> (not res!264086) (not e!231859))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321724 (= res!264086 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!321725 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321725 (= e!231859 (not (invariant!0 (currentBit!14856 thiss!1793) (currentByte!14861 thiss!1793) (size!8920 (buf!8062 thiss!1793)))))))

(declare-fun b!321726 () Bool)

(declare-fun res!264085 () Bool)

(assert (=> b!321726 (=> (not res!264085) (not e!231859))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321726 (= res!264085 (validate_offset_bits!1 ((_ sign_extend 32) (size!8920 (buf!8062 thiss!1793))) ((_ sign_extend 32) (currentByte!14861 thiss!1793)) ((_ sign_extend 32) (currentBit!14856 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!321727 () Bool)

(declare-fun res!264087 () Bool)

(assert (=> b!321727 (=> (not res!264087) (not e!231859))))

(assert (=> b!321727 (= res!264087 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(assert (= (and start!71588 res!264088) b!321726))

(assert (= (and b!321726 res!264085) b!321724))

(assert (= (and b!321724 res!264086) b!321727))

(assert (= (and b!321727 res!264087) b!321725))

(assert (= start!71588 b!321723))

(declare-fun m!460059 () Bool)

(assert (=> b!321724 m!460059))

(declare-fun m!460061 () Bool)

(assert (=> b!321723 m!460061))

(declare-fun m!460063 () Bool)

(assert (=> b!321726 m!460063))

(declare-fun m!460065 () Bool)

(assert (=> b!321725 m!460065))

(declare-fun m!460067 () Bool)

(assert (=> start!71588 m!460067))

(push 1)

(assert (not start!71588))

(assert (not b!321726))

(assert (not b!321725))

(assert (not b!321723))

(assert (not b!321724))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105534 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105534 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8920 (buf!8062 thiss!1793))) ((_ sign_extend 32) (currentByte!14861 thiss!1793)) ((_ sign_extend 32) (currentBit!14856 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8920 (buf!8062 thiss!1793))) ((_ sign_extend 32) (currentByte!14861 thiss!1793)) ((_ sign_extend 32) (currentBit!14856 thiss!1793))) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun bs!27790 () Bool)

(assert (= bs!27790 d!105534))

(declare-fun m!460091 () Bool)

(assert (=> bs!27790 m!460091))

(assert (=> b!321726 d!105534))

(declare-fun d!105540 () Bool)

(assert (=> d!105540 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!321724 d!105540))

(declare-fun d!105546 () Bool)

(assert (=> d!105546 (= (invariant!0 (currentBit!14856 thiss!1793) (currentByte!14861 thiss!1793) (size!8920 (buf!8062 thiss!1793))) (and (bvsge (currentBit!14856 thiss!1793) #b00000000000000000000000000000000) (bvslt (currentBit!14856 thiss!1793) #b00000000000000000000000000001000) (bvsge (currentByte!14861 thiss!1793) #b00000000000000000000000000000000) (or (bvslt (currentByte!14861 thiss!1793) (size!8920 (buf!8062 thiss!1793))) (and (= (currentBit!14856 thiss!1793) #b00000000000000000000000000000000) (= (currentByte!14861 thiss!1793) (size!8920 (buf!8062 thiss!1793)))))))))

(assert (=> b!321725 d!105546))

(declare-fun d!105552 () Bool)

(assert (=> d!105552 (= (array_inv!8472 (buf!8062 thiss!1793)) (bvsge (size!8920 (buf!8062 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!321723 d!105552))

(declare-fun d!105554 () Bool)

(assert (=> d!105554 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14856 thiss!1793) (currentByte!14861 thiss!1793) (size!8920 (buf!8062 thiss!1793))))))

(declare-fun bs!27793 () Bool)

(assert (= bs!27793 d!105554))

(assert (=> bs!27793 m!460065))

(assert (=> start!71588 d!105554))

(push 1)

(assert (not d!105554))

(assert (not d!105534))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

