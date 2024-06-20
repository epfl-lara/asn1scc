; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71686 () Bool)

(assert start!71686)

(declare-fun b!322008 () Bool)

(declare-fun e!232058 () Bool)

(declare-datatypes ((array!20532 0))(
  ( (array!20533 (arr!10031 (Array (_ BitVec 32) (_ BitVec 8))) (size!8939 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14040 0))(
  ( (BitStream!14041 (buf!8081 array!20532) (currentByte!14892 (_ BitVec 32)) (currentBit!14887 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14040)

(declare-fun array_inv!8491 (array!20532) Bool)

(assert (=> b!322008 (= e!232058 (array_inv!8491 (buf!8081 thiss!1793)))))

(declare-fun b!322009 () Bool)

(declare-fun res!264316 () Bool)

(declare-fun e!232059 () Bool)

(assert (=> b!322009 (=> (not res!264316) (not e!232059))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322009 (= res!264316 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322010 () Bool)

(declare-fun res!264313 () Bool)

(assert (=> b!322010 (=> (not res!264313) (not e!232059))))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322010 (= res!264313 (validate_offset_bits!1 ((_ sign_extend 32) (size!8939 (buf!8081 thiss!1793))) ((_ sign_extend 32) (currentByte!14892 thiss!1793)) ((_ sign_extend 32) (currentBit!14887 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!322011 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322011 (= e!232059 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!8939 (buf!8081 thiss!1793))) ((_ sign_extend 32) (currentByte!14892 thiss!1793)) ((_ sign_extend 32) (currentBit!14887 thiss!1793)))))))

(declare-fun res!264314 () Bool)

(assert (=> start!71686 (=> (not res!264314) (not e!232059))))

(assert (=> start!71686 (= res!264314 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71686 e!232059))

(assert (=> start!71686 true))

(declare-fun inv!12 (BitStream!14040) Bool)

(assert (=> start!71686 (and (inv!12 thiss!1793) e!232058)))

(declare-fun b!322012 () Bool)

(declare-fun res!264315 () Bool)

(assert (=> b!322012 (=> (not res!264315) (not e!232059))))

(assert (=> b!322012 (= res!264315 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(assert (= (and start!71686 res!264314) b!322010))

(assert (= (and b!322010 res!264313) b!322009))

(assert (= (and b!322009 res!264316) b!322012))

(assert (= (and b!322012 res!264315) b!322011))

(assert (= start!71686 b!322008))

(declare-fun m!460261 () Bool)

(assert (=> b!322008 m!460261))

(declare-fun m!460263 () Bool)

(assert (=> b!322009 m!460263))

(declare-fun m!460265 () Bool)

(assert (=> b!322011 m!460265))

(declare-fun m!460267 () Bool)

(assert (=> start!71686 m!460267))

(declare-fun m!460269 () Bool)

(assert (=> b!322010 m!460269))

(check-sat (not b!322009) (not b!322008) (not start!71686) (not b!322010) (not b!322011))
(check-sat)
(get-model)

(declare-fun d!105604 () Bool)

(assert (=> d!105604 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!322009 d!105604))

(declare-fun d!105606 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105606 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8939 (buf!8081 thiss!1793))) ((_ sign_extend 32) (currentByte!14892 thiss!1793)) ((_ sign_extend 32) (currentBit!14887 thiss!1793))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8939 (buf!8081 thiss!1793))) ((_ sign_extend 32) (currentByte!14892 thiss!1793)) ((_ sign_extend 32) (currentBit!14887 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!27819 () Bool)

(assert (= bs!27819 d!105606))

(declare-fun m!460281 () Bool)

(assert (=> bs!27819 m!460281))

(assert (=> b!322011 d!105606))

(declare-fun d!105610 () Bool)

(assert (=> d!105610 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8939 (buf!8081 thiss!1793))) ((_ sign_extend 32) (currentByte!14892 thiss!1793)) ((_ sign_extend 32) (currentBit!14887 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8939 (buf!8081 thiss!1793))) ((_ sign_extend 32) (currentByte!14892 thiss!1793)) ((_ sign_extend 32) (currentBit!14887 thiss!1793))) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun bs!27820 () Bool)

(assert (= bs!27820 d!105610))

(assert (=> bs!27820 m!460281))

(assert (=> b!322010 d!105610))

(declare-fun d!105616 () Bool)

(assert (=> d!105616 (= (array_inv!8491 (buf!8081 thiss!1793)) (bvsge (size!8939 (buf!8081 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!322008 d!105616))

(declare-fun d!105620 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105620 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14887 thiss!1793) (currentByte!14892 thiss!1793) (size!8939 (buf!8081 thiss!1793))))))

(declare-fun bs!27823 () Bool)

(assert (= bs!27823 d!105620))

(declare-fun m!460287 () Bool)

(assert (=> bs!27823 m!460287))

(assert (=> start!71686 d!105620))

(check-sat (not d!105606) (not d!105620) (not d!105610))
(check-sat)
