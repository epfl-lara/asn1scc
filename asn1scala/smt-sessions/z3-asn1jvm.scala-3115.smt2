; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71590 () Bool)

(assert start!71590)

(declare-fun b!321738 () Bool)

(declare-fun res!264100 () Bool)

(declare-fun e!231870 () Bool)

(assert (=> b!321738 (=> (not res!264100) (not e!231870))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20490 0))(
  ( (array!20491 (arr!10013 (Array (_ BitVec 32) (_ BitVec 8))) (size!8921 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14004 0))(
  ( (BitStream!14005 (buf!8063 array!20490) (currentByte!14862 (_ BitVec 32)) (currentBit!14857 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14004)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321738 (= res!264100 (validate_offset_bits!1 ((_ sign_extend 32) (size!8921 (buf!8063 thiss!1793))) ((_ sign_extend 32) (currentByte!14862 thiss!1793)) ((_ sign_extend 32) (currentBit!14857 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!321739 () Bool)

(declare-fun res!264098 () Bool)

(assert (=> b!321739 (=> (not res!264098) (not e!231870))))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!321739 (= res!264098 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun b!321740 () Bool)

(declare-fun e!231869 () Bool)

(declare-fun array_inv!8473 (array!20490) Bool)

(assert (=> b!321740 (= e!231869 (array_inv!8473 (buf!8063 thiss!1793)))))

(declare-fun b!321742 () Bool)

(declare-fun res!264097 () Bool)

(assert (=> b!321742 (=> (not res!264097) (not e!231870))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321742 (= res!264097 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!264099 () Bool)

(assert (=> start!71590 (=> (not res!264099) (not e!231870))))

(assert (=> start!71590 (= res!264099 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71590 e!231870))

(assert (=> start!71590 true))

(declare-fun inv!12 (BitStream!14004) Bool)

(assert (=> start!71590 (and (inv!12 thiss!1793) e!231869)))

(declare-fun b!321741 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321741 (= e!231870 (not (invariant!0 (currentBit!14857 thiss!1793) (currentByte!14862 thiss!1793) (size!8921 (buf!8063 thiss!1793)))))))

(assert (= (and start!71590 res!264099) b!321738))

(assert (= (and b!321738 res!264100) b!321742))

(assert (= (and b!321742 res!264097) b!321739))

(assert (= (and b!321739 res!264098) b!321741))

(assert (= start!71590 b!321740))

(declare-fun m!460069 () Bool)

(assert (=> b!321741 m!460069))

(declare-fun m!460071 () Bool)

(assert (=> start!71590 m!460071))

(declare-fun m!460073 () Bool)

(assert (=> b!321738 m!460073))

(declare-fun m!460075 () Bool)

(assert (=> b!321740 m!460075))

(declare-fun m!460077 () Bool)

(assert (=> b!321742 m!460077))

(check-sat (not b!321740) (not b!321741) (not b!321742) (not b!321738) (not start!71590))
(check-sat)
(get-model)

(declare-fun d!105532 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105532 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8921 (buf!8063 thiss!1793))) ((_ sign_extend 32) (currentByte!14862 thiss!1793)) ((_ sign_extend 32) (currentBit!14857 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8921 (buf!8063 thiss!1793))) ((_ sign_extend 32) (currentByte!14862 thiss!1793)) ((_ sign_extend 32) (currentBit!14857 thiss!1793))) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun bs!27789 () Bool)

(assert (= bs!27789 d!105532))

(declare-fun m!460089 () Bool)

(assert (=> bs!27789 m!460089))

(assert (=> b!321738 d!105532))

(declare-fun d!105538 () Bool)

(assert (=> d!105538 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14857 thiss!1793) (currentByte!14862 thiss!1793) (size!8921 (buf!8063 thiss!1793))))))

(declare-fun bs!27792 () Bool)

(assert (= bs!27792 d!105538))

(assert (=> bs!27792 m!460069))

(assert (=> start!71590 d!105538))

(declare-fun d!105544 () Bool)

(assert (=> d!105544 (= (invariant!0 (currentBit!14857 thiss!1793) (currentByte!14862 thiss!1793) (size!8921 (buf!8063 thiss!1793))) (and (bvsge (currentBit!14857 thiss!1793) #b00000000000000000000000000000000) (bvslt (currentBit!14857 thiss!1793) #b00000000000000000000000000001000) (bvsge (currentByte!14862 thiss!1793) #b00000000000000000000000000000000) (or (bvslt (currentByte!14862 thiss!1793) (size!8921 (buf!8063 thiss!1793))) (and (= (currentBit!14857 thiss!1793) #b00000000000000000000000000000000) (= (currentByte!14862 thiss!1793) (size!8921 (buf!8063 thiss!1793)))))))))

(assert (=> b!321741 d!105544))

(declare-fun d!105550 () Bool)

(assert (=> d!105550 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!321742 d!105550))

(declare-fun d!105558 () Bool)

(assert (=> d!105558 (= (array_inv!8473 (buf!8063 thiss!1793)) (bvsge (size!8921 (buf!8063 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!321740 d!105558))

(check-sat (not d!105532) (not d!105538))
(check-sat)
