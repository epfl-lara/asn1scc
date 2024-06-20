; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71592 () Bool)

(assert start!71592)

(declare-fun b!321753 () Bool)

(declare-fun res!264110 () Bool)

(declare-fun e!231878 () Bool)

(assert (=> b!321753 (=> (not res!264110) (not e!231878))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!321753 (= res!264110 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun b!321754 () Bool)

(declare-fun e!231877 () Bool)

(declare-datatypes ((array!20492 0))(
  ( (array!20493 (arr!10014 (Array (_ BitVec 32) (_ BitVec 8))) (size!8922 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14006 0))(
  ( (BitStream!14007 (buf!8064 array!20492) (currentByte!14863 (_ BitVec 32)) (currentBit!14858 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14006)

(declare-fun array_inv!8474 (array!20492) Bool)

(assert (=> b!321754 (= e!231877 (array_inv!8474 (buf!8064 thiss!1793)))))

(declare-fun b!321755 () Bool)

(declare-fun res!264112 () Bool)

(assert (=> b!321755 (=> (not res!264112) (not e!231878))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321755 (= res!264112 (validate_offset_bits!1 ((_ sign_extend 32) (size!8922 (buf!8064 thiss!1793))) ((_ sign_extend 32) (currentByte!14863 thiss!1793)) ((_ sign_extend 32) (currentBit!14858 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!321756 () Bool)

(declare-fun res!264109 () Bool)

(assert (=> b!321756 (=> (not res!264109) (not e!231878))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321756 (= res!264109 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!264111 () Bool)

(assert (=> start!71592 (=> (not res!264111) (not e!231878))))

(assert (=> start!71592 (= res!264111 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71592 e!231878))

(assert (=> start!71592 true))

(declare-fun inv!12 (BitStream!14006) Bool)

(assert (=> start!71592 (and (inv!12 thiss!1793) e!231877)))

(declare-fun b!321757 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321757 (= e!231878 (not (invariant!0 (currentBit!14858 thiss!1793) (currentByte!14863 thiss!1793) (size!8922 (buf!8064 thiss!1793)))))))

(assert (= (and start!71592 res!264111) b!321755))

(assert (= (and b!321755 res!264112) b!321756))

(assert (= (and b!321756 res!264109) b!321753))

(assert (= (and b!321753 res!264110) b!321757))

(assert (= start!71592 b!321754))

(declare-fun m!460079 () Bool)

(assert (=> b!321755 m!460079))

(declare-fun m!460081 () Bool)

(assert (=> b!321754 m!460081))

(declare-fun m!460083 () Bool)

(assert (=> start!71592 m!460083))

(declare-fun m!460085 () Bool)

(assert (=> b!321757 m!460085))

(declare-fun m!460087 () Bool)

(assert (=> b!321756 m!460087))

(push 1)

(assert (not start!71592))

(assert (not b!321757))

(assert (not b!321756))

(assert (not b!321754))

(assert (not b!321755))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105536 () Bool)

(assert (=> d!105536 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14858 thiss!1793) (currentByte!14863 thiss!1793) (size!8922 (buf!8064 thiss!1793))))))

(declare-fun bs!27791 () Bool)

(assert (= bs!27791 d!105536))

(assert (=> bs!27791 m!460085))

(assert (=> start!71592 d!105536))

(declare-fun d!105542 () Bool)

(assert (=> d!105542 (= (invariant!0 (currentBit!14858 thiss!1793) (currentByte!14863 thiss!1793) (size!8922 (buf!8064 thiss!1793))) (and (bvsge (currentBit!14858 thiss!1793) #b00000000000000000000000000000000) (bvslt (currentBit!14858 thiss!1793) #b00000000000000000000000000001000) (bvsge (currentByte!14863 thiss!1793) #b00000000000000000000000000000000) (or (bvslt (currentByte!14863 thiss!1793) (size!8922 (buf!8064 thiss!1793))) (and (= (currentBit!14858 thiss!1793) #b00000000000000000000000000000000) (= (currentByte!14863 thiss!1793) (size!8922 (buf!8064 thiss!1793)))))))))

(assert (=> b!321757 d!105542))

(declare-fun d!105548 () Bool)

(assert (=> d!105548 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!321756 d!105548))

(declare-fun d!105556 () Bool)

(assert (=> d!105556 (= (array_inv!8474 (buf!8064 thiss!1793)) (bvsge (size!8922 (buf!8064 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!321754 d!105556))

(declare-fun d!105560 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105560 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8922 (buf!8064 thiss!1793))) ((_ sign_extend 32) (currentByte!14863 thiss!1793)) ((_ sign_extend 32) (currentBit!14858 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8922 (buf!8064 thiss!1793))) ((_ sign_extend 32) (currentByte!14863 thiss!1793)) ((_ sign_extend 32) (currentBit!14858 thiss!1793))) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun bs!27794 () Bool)

(assert (= bs!27794 d!105560))

(declare-fun m!460093 () Bool)

(assert (=> bs!27794 m!460093))

(assert (=> b!321755 d!105560))

(push 1)

