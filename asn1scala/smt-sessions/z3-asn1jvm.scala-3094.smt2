; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71286 () Bool)

(assert start!71286)

(declare-fun res!263929 () Bool)

(declare-fun e!231400 () Bool)

(assert (=> start!71286 (=> (not res!263929) (not e!231400))))

(declare-datatypes ((array!20342 0))(
  ( (array!20343 (arr!9953 (Array (_ BitVec 32) (_ BitVec 8))) (size!8861 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13884 0))(
  ( (BitStream!13885 (buf!8003 array!20342) (currentByte!14774 (_ BitVec 32)) (currentBit!14769 (_ BitVec 32))) )
))
(declare-fun thiss!900 () BitStream!13884)

(declare-fun diffInBytes!21 () (_ BitVec 32))

(declare-fun moveByteIndexPrecond!0 (BitStream!13884 (_ BitVec 32)) Bool)

(assert (=> start!71286 (= res!263929 (moveByteIndexPrecond!0 thiss!900 diffInBytes!21))))

(assert (=> start!71286 e!231400))

(declare-fun e!231401 () Bool)

(declare-fun inv!12 (BitStream!13884) Bool)

(assert (=> start!71286 (and (inv!12 thiss!900) e!231401)))

(assert (=> start!71286 true))

(declare-fun b!321384 () Bool)

(assert (=> b!321384 (= e!231400 (and (= (bvand (currentByte!14774 thiss!900) #b10000000000000000000000000000000) (bvand diffInBytes!21 #b10000000000000000000000000000000)) (not (= (bvand (currentByte!14774 thiss!900) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!14774 thiss!900) diffInBytes!21) #b10000000000000000000000000000000)))))))

(declare-fun b!321385 () Bool)

(declare-fun array_inv!8413 (array!20342) Bool)

(assert (=> b!321385 (= e!231401 (array_inv!8413 (buf!8003 thiss!900)))))

(assert (= (and start!71286 res!263929) b!321384))

(assert (= start!71286 b!321385))

(declare-fun m!459687 () Bool)

(assert (=> start!71286 m!459687))

(declare-fun m!459689 () Bool)

(assert (=> start!71286 m!459689))

(declare-fun m!459691 () Bool)

(assert (=> b!321385 m!459691))

(check-sat (not start!71286) (not b!321385))
(check-sat)
(get-model)

(declare-fun d!105312 () Bool)

(assert (=> d!105312 (= (moveByteIndexPrecond!0 thiss!900 diffInBytes!21) (and (bvsle (bvneg (size!8861 (buf!8003 thiss!900))) diffInBytes!21) (bvsle diffInBytes!21 (size!8861 (buf!8003 thiss!900))) (let ((res!99 (bvadd ((_ sign_extend 32) (currentByte!14774 thiss!900)) ((_ sign_extend 32) diffInBytes!21)))) (or (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 res!99) (bvslt res!99 ((_ sign_extend 32) (size!8861 (buf!8003 thiss!900))))) (and (= (currentBit!14769 thiss!900) #b00000000000000000000000000000000) (= res!99 ((_ sign_extend 32) (size!8861 (buf!8003 thiss!900)))))))))))

(assert (=> start!71286 d!105312))

(declare-fun d!105320 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105320 (= (inv!12 thiss!900) (invariant!0 (currentBit!14769 thiss!900) (currentByte!14774 thiss!900) (size!8861 (buf!8003 thiss!900))))))

(declare-fun bs!27693 () Bool)

(assert (= bs!27693 d!105320))

(declare-fun m!459699 () Bool)

(assert (=> bs!27693 m!459699))

(assert (=> start!71286 d!105320))

(declare-fun d!105324 () Bool)

(assert (=> d!105324 (= (array_inv!8413 (buf!8003 thiss!900)) (bvsge (size!8861 (buf!8003 thiss!900)) #b00000000000000000000000000000000))))

(assert (=> b!321385 d!105324))

(check-sat (not d!105320))
(check-sat)
