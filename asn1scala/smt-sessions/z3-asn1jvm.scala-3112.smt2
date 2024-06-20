; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71564 () Bool)

(assert start!71564)

(declare-fun res!264037 () Bool)

(declare-fun e!231787 () Bool)

(assert (=> start!71564 (=> (not res!264037) (not e!231787))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20470 0))(
  ( (array!20471 (arr!10004 (Array (_ BitVec 32) (_ BitVec 8))) (size!8912 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13986 0))(
  ( (BitStream!13987 (buf!8054 array!20470) (currentByte!14852 (_ BitVec 32)) (currentBit!14847 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!13986)

(assert (=> start!71564 (= res!264037 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8912 (buf!8054 thiss!1793))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14852 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14847 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8912 (buf!8054 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14852 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14847 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71564 e!231787))

(assert (=> start!71564 true))

(declare-fun e!231788 () Bool)

(declare-fun inv!12 (BitStream!13986) Bool)

(assert (=> start!71564 (and (inv!12 thiss!1793) e!231788)))

(declare-fun b!321651 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321651 (= e!231787 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14847 thiss!1793))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14852 thiss!1793))) ((_ extract 31 0) ((_ sign_extend 32) (size!8912 (buf!8054 thiss!1793)))))))))

(declare-fun b!321652 () Bool)

(declare-fun array_inv!8464 (array!20470) Bool)

(assert (=> b!321652 (= e!231788 (array_inv!8464 (buf!8054 thiss!1793)))))

(assert (= (and start!71564 res!264037) b!321651))

(assert (= start!71564 b!321652))

(declare-fun m!460009 () Bool)

(assert (=> start!71564 m!460009))

(declare-fun m!460011 () Bool)

(assert (=> b!321651 m!460011))

(declare-fun m!460013 () Bool)

(assert (=> b!321652 m!460013))

(check-sat (not b!321652) (not b!321651) (not start!71564))
(check-sat)
(get-model)

(declare-fun d!105518 () Bool)

(assert (=> d!105518 (= (array_inv!8464 (buf!8054 thiss!1793)) (bvsge (size!8912 (buf!8054 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!321652 d!105518))

(declare-fun d!105520 () Bool)

(assert (=> d!105520 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14847 thiss!1793))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14852 thiss!1793))) ((_ extract 31 0) ((_ sign_extend 32) (size!8912 (buf!8054 thiss!1793))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14847 thiss!1793))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14847 thiss!1793))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14852 thiss!1793))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14852 thiss!1793))) ((_ extract 31 0) ((_ sign_extend 32) (size!8912 (buf!8054 thiss!1793))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14847 thiss!1793))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14852 thiss!1793))) ((_ extract 31 0) ((_ sign_extend 32) (size!8912 (buf!8054 thiss!1793)))))))))))

(assert (=> b!321651 d!105520))

(declare-fun d!105522 () Bool)

(assert (=> d!105522 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14847 thiss!1793) (currentByte!14852 thiss!1793) (size!8912 (buf!8054 thiss!1793))))))

(declare-fun bs!27779 () Bool)

(assert (= bs!27779 d!105522))

(declare-fun m!460021 () Bool)

(assert (=> bs!27779 m!460021))

(assert (=> start!71564 d!105522))

(check-sat (not d!105522))
(check-sat)
