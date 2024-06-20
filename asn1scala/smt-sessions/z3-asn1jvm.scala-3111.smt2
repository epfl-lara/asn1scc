; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71548 () Bool)

(assert start!71548)

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20462 0))(
  ( (array!20463 (arr!10001 (Array (_ BitVec 32) (_ BitVec 8))) (size!8909 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13980 0))(
  ( (BitStream!13981 (buf!8051 array!20462) (currentByte!14848 (_ BitVec 32)) (currentBit!14843 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!13980)

(assert (=> start!71548 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8909 (buf!8051 thiss!1793))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14848 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14843 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8909 (buf!8051 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14848 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14843 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71548 true))

(declare-fun e!231764 () Bool)

(declare-fun inv!12 (BitStream!13980) Bool)

(assert (=> start!71548 (and (inv!12 thiss!1793) e!231764)))

(declare-fun b!321637 () Bool)

(declare-fun array_inv!8461 (array!20462) Bool)

(assert (=> b!321637 (= e!231764 (array_inv!8461 (buf!8051 thiss!1793)))))

(assert (= start!71548 b!321637))

(declare-fun m!459991 () Bool)

(assert (=> start!71548 m!459991))

(declare-fun m!459993 () Bool)

(assert (=> b!321637 m!459993))

(check-sat (not start!71548) (not b!321637))
(check-sat)
(get-model)

(declare-fun d!105506 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105506 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14843 thiss!1793) (currentByte!14848 thiss!1793) (size!8909 (buf!8051 thiss!1793))))))

(declare-fun bs!27774 () Bool)

(assert (= bs!27774 d!105506))

(declare-fun m!459999 () Bool)

(assert (=> bs!27774 m!459999))

(assert (=> start!71548 d!105506))

(declare-fun d!105508 () Bool)

(assert (=> d!105508 (= (array_inv!8461 (buf!8051 thiss!1793)) (bvsge (size!8909 (buf!8051 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!321637 d!105508))

(check-sat (not d!105506))
(check-sat)
(get-model)

(declare-fun d!105510 () Bool)

(assert (=> d!105510 (= (invariant!0 (currentBit!14843 thiss!1793) (currentByte!14848 thiss!1793) (size!8909 (buf!8051 thiss!1793))) (and (bvsge (currentBit!14843 thiss!1793) #b00000000000000000000000000000000) (bvslt (currentBit!14843 thiss!1793) #b00000000000000000000000000001000) (bvsge (currentByte!14848 thiss!1793) #b00000000000000000000000000000000) (or (bvslt (currentByte!14848 thiss!1793) (size!8909 (buf!8051 thiss!1793))) (and (= (currentBit!14843 thiss!1793) #b00000000000000000000000000000000) (= (currentByte!14848 thiss!1793) (size!8909 (buf!8051 thiss!1793)))))))))

(assert (=> d!105506 d!105510))

(check-sat)
