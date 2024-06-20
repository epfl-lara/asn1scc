; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71684 () Bool)

(assert start!71684)

(declare-fun b!321993 () Bool)

(declare-fun res!264301 () Bool)

(declare-fun e!232049 () Bool)

(assert (=> b!321993 (=> (not res!264301) (not e!232049))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20530 0))(
  ( (array!20531 (arr!10030 (Array (_ BitVec 32) (_ BitVec 8))) (size!8938 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14038 0))(
  ( (BitStream!14039 (buf!8080 array!20530) (currentByte!14891 (_ BitVec 32)) (currentBit!14886 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14038)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321993 (= res!264301 (validate_offset_bits!1 ((_ sign_extend 32) (size!8938 (buf!8080 thiss!1793))) ((_ sign_extend 32) (currentByte!14891 thiss!1793)) ((_ sign_extend 32) (currentBit!14886 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!321994 () Bool)

(declare-fun res!264303 () Bool)

(assert (=> b!321994 (=> (not res!264303) (not e!232049))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321994 (= res!264303 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!321996 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321996 (= e!232049 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!8938 (buf!8080 thiss!1793))) ((_ sign_extend 32) (currentByte!14891 thiss!1793)) ((_ sign_extend 32) (currentBit!14886 thiss!1793)))))))

(declare-fun b!321997 () Bool)

(declare-fun e!232048 () Bool)

(declare-fun array_inv!8490 (array!20530) Bool)

(assert (=> b!321997 (= e!232048 (array_inv!8490 (buf!8080 thiss!1793)))))

(declare-fun res!264302 () Bool)

(assert (=> start!71684 (=> (not res!264302) (not e!232049))))

(assert (=> start!71684 (= res!264302 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71684 e!232049))

(assert (=> start!71684 true))

(declare-fun inv!12 (BitStream!14038) Bool)

(assert (=> start!71684 (and (inv!12 thiss!1793) e!232048)))

(declare-fun b!321995 () Bool)

(declare-fun res!264304 () Bool)

(assert (=> b!321995 (=> (not res!264304) (not e!232049))))

(assert (=> b!321995 (= res!264304 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(assert (= (and start!71684 res!264302) b!321993))

(assert (= (and b!321993 res!264301) b!321994))

(assert (= (and b!321994 res!264303) b!321995))

(assert (= (and b!321995 res!264304) b!321996))

(assert (= start!71684 b!321997))

(declare-fun m!460251 () Bool)

(assert (=> b!321994 m!460251))

(declare-fun m!460253 () Bool)

(assert (=> b!321997 m!460253))

(declare-fun m!460255 () Bool)

(assert (=> b!321996 m!460255))

(declare-fun m!460257 () Bool)

(assert (=> start!71684 m!460257))

(declare-fun m!460259 () Bool)

(assert (=> b!321993 m!460259))

(push 1)

(assert (not b!321997))

(assert (not b!321996))

(assert (not b!321994))

(assert (not start!71684))

(assert (not b!321993))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105608 () Bool)

(assert (=> d!105608 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!321994 d!105608))

(declare-fun d!105614 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105614 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14886 thiss!1793) (currentByte!14891 thiss!1793) (size!8938 (buf!8080 thiss!1793))))))

(declare-fun bs!27822 () Bool)

(assert (= bs!27822 d!105614))

(declare-fun m!460285 () Bool)

(assert (=> bs!27822 m!460285))

(assert (=> start!71684 d!105614))

(declare-fun d!105622 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105622 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8938 (buf!8080 thiss!1793))) ((_ sign_extend 32) (currentByte!14891 thiss!1793)) ((_ sign_extend 32) (currentBit!14886 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8938 (buf!8080 thiss!1793))) ((_ sign_extend 32) (currentByte!14891 thiss!1793)) ((_ sign_extend 32) (currentBit!14886 thiss!1793))) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun bs!27824 () Bool)

(assert (= bs!27824 d!105622))

(declare-fun m!460289 () Bool)

(assert (=> bs!27824 m!460289))

(assert (=> b!321993 d!105622))

(declare-fun d!105626 () Bool)

(assert (=> d!105626 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8938 (buf!8080 thiss!1793))) ((_ sign_extend 32) (currentByte!14891 thiss!1793)) ((_ sign_extend 32) (currentBit!14886 thiss!1793))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8938 (buf!8080 thiss!1793))) ((_ sign_extend 32) (currentByte!14891 thiss!1793)) ((_ sign_extend 32) (currentBit!14886 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!27826 () Bool)

(assert (= bs!27826 d!105626))

(assert (=> bs!27826 m!460289))

(assert (=> b!321996 d!105626))

(declare-fun d!105632 () Bool)

(assert (=> d!105632 (= (array_inv!8490 (buf!8080 thiss!1793)) (bvsge (size!8938 (buf!8080 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!321997 d!105632))

(push 1)

(assert (not d!105626))

(assert (not d!105614))

(assert (not d!105622))

(check-sat)

(pop 1)

(push 1)

(check-sat)

