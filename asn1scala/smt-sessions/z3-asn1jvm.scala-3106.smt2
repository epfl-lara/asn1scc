; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71518 () Bool)

(assert start!71518)

(declare-fun res!263988 () Bool)

(declare-fun e!231671 () Bool)

(assert (=> start!71518 (=> (not res!263988) (not e!231671))))

(declare-fun nBits!568 () (_ BitVec 32))

(declare-fun i!747 () (_ BitVec 32))

(declare-datatypes ((array!20438 0))(
  ( (array!20439 (arr!9989 (Array (_ BitVec 32) (_ BitVec 8))) (size!8897 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13956 0))(
  ( (BitStream!13957 (buf!8039 array!20438) (currentByte!14836 (_ BitVec 32)) (currentBit!14831 (_ BitVec 32))) )
))
(declare-fun thiss!1811 () BitStream!13956)

(assert (=> start!71518 (= res!263988 (and (bvsle #b00000000000000000000000000000000 i!747) (bvsle i!747 nBits!568) (bvsle nBits!568 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8897 (buf!8039 thiss!1811))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14836 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14831 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8897 (buf!8039 thiss!1811))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14836 thiss!1811)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14831 thiss!1811)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71518 e!231671))

(assert (=> start!71518 true))

(declare-fun e!231672 () Bool)

(declare-fun inv!12 (BitStream!13956) Bool)

(assert (=> start!71518 (and (inv!12 thiss!1811) e!231672)))

(declare-fun b!321557 () Bool)

(declare-fun res!263989 () Bool)

(assert (=> b!321557 (=> (not res!263989) (not e!231671))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321557 (= res!263989 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14831 thiss!1811))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14836 thiss!1811))) ((_ extract 31 0) ((_ sign_extend 32) (size!8897 (buf!8039 thiss!1811))))))))

(declare-fun b!321558 () Bool)

(assert (=> b!321558 (= e!231671 (bvslt ((_ sign_extend 32) (bvsub nBits!568 i!747)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!321559 () Bool)

(declare-fun array_inv!8449 (array!20438) Bool)

(assert (=> b!321559 (= e!231672 (array_inv!8449 (buf!8039 thiss!1811)))))

(assert (= (and start!71518 res!263988) b!321557))

(assert (= (and b!321557 res!263989) b!321558))

(assert (= start!71518 b!321559))

(declare-fun m!459927 () Bool)

(assert (=> start!71518 m!459927))

(declare-fun m!459929 () Bool)

(assert (=> b!321557 m!459929))

(declare-fun m!459931 () Bool)

(assert (=> b!321559 m!459931))

(check-sat (not b!321557) (not start!71518) (not b!321559))
(check-sat)
