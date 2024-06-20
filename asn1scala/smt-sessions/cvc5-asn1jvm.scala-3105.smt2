; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71498 () Bool)

(assert start!71498)

(declare-fun res!263971 () Bool)

(declare-fun e!231634 () Bool)

(assert (=> start!71498 (=> (not res!263971) (not e!231634))))

(declare-fun nBits!568 () (_ BitVec 32))

(declare-datatypes ((array!20428 0))(
  ( (array!20429 (arr!9985 (Array (_ BitVec 32) (_ BitVec 8))) (size!8893 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13948 0))(
  ( (BitStream!13949 (buf!8035 array!20428) (currentByte!14830 (_ BitVec 32)) (currentBit!14825 (_ BitVec 32))) )
))
(declare-fun thiss!1811 () BitStream!13948)

(declare-fun i!747 () (_ BitVec 32))

(assert (=> start!71498 (= res!263971 (and (bvsle #b00000000000000000000000000000000 i!747) (bvsle i!747 nBits!568) (bvsle nBits!568 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8893 (buf!8035 thiss!1811))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14830 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14825 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8893 (buf!8035 thiss!1811))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14830 thiss!1811)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14825 thiss!1811)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71498 e!231634))

(assert (=> start!71498 true))

(declare-fun e!231635 () Bool)

(declare-fun inv!12 (BitStream!13948) Bool)

(assert (=> start!71498 (and (inv!12 thiss!1811) e!231635)))

(declare-fun b!321528 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321528 (= e!231634 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14825 thiss!1811))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14830 thiss!1811))) ((_ extract 31 0) ((_ sign_extend 32) (size!8893 (buf!8035 thiss!1811)))))))))

(declare-fun b!321529 () Bool)

(declare-fun array_inv!8445 (array!20428) Bool)

(assert (=> b!321529 (= e!231635 (array_inv!8445 (buf!8035 thiss!1811)))))

(assert (= (and start!71498 res!263971) b!321528))

(assert (= start!71498 b!321529))

(declare-fun m!459899 () Bool)

(assert (=> start!71498 m!459899))

(declare-fun m!459901 () Bool)

(assert (=> b!321528 m!459901))

(declare-fun m!459903 () Bool)

(assert (=> b!321529 m!459903))

(push 1)

(assert (not start!71498))

(assert (not b!321528))

(assert (not b!321529))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105488 () Bool)

(assert (=> d!105488 (= (inv!12 thiss!1811) (invariant!0 (currentBit!14825 thiss!1811) (currentByte!14830 thiss!1811) (size!8893 (buf!8035 thiss!1811))))))

(declare-fun bs!27755 () Bool)

(assert (= bs!27755 d!105488))

(declare-fun m!459919 () Bool)

(assert (=> bs!27755 m!459919))

(assert (=> start!71498 d!105488))

(declare-fun d!105490 () Bool)

