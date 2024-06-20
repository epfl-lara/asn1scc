; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71310 () Bool)

(assert start!71310)

(declare-fun res!263938 () Bool)

(declare-fun e!231427 () Bool)

(assert (=> start!71310 (=> (not res!263938) (not e!231427))))

(declare-datatypes ((array!20351 0))(
  ( (array!20352 (arr!9956 (Array (_ BitVec 32) (_ BitVec 8))) (size!8864 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13890 0))(
  ( (BitStream!13891 (buf!8006 array!20351) (currentByte!14777 (_ BitVec 32)) (currentBit!14772 (_ BitVec 32))) )
))
(declare-fun thiss!900 () BitStream!13890)

(declare-fun diffInBytes!21 () (_ BitVec 32))

(declare-fun moveByteIndexPrecond!0 (BitStream!13890 (_ BitVec 32)) Bool)

(assert (=> start!71310 (= res!263938 (moveByteIndexPrecond!0 thiss!900 diffInBytes!21))))

(assert (=> start!71310 e!231427))

(declare-fun e!231428 () Bool)

(declare-fun inv!12 (BitStream!13890) Bool)

(assert (=> start!71310 (and (inv!12 thiss!900) e!231428)))

(assert (=> start!71310 true))

(declare-fun b!321405 () Bool)

(assert (=> b!321405 (= e!231427 (and (= (bvand (currentByte!14777 thiss!900) #b10000000000000000000000000000000) (bvand diffInBytes!21 #b10000000000000000000000000000000)) (not (= (bvand (currentByte!14777 thiss!900) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!14777 thiss!900) diffInBytes!21) #b10000000000000000000000000000000)))))))

(declare-fun b!321406 () Bool)

(declare-fun array_inv!8416 (array!20351) Bool)

(assert (=> b!321406 (= e!231428 (array_inv!8416 (buf!8006 thiss!900)))))

(assert (= (and start!71310 res!263938) b!321405))

(assert (= start!71310 b!321406))

(declare-fun m!459711 () Bool)

(assert (=> start!71310 m!459711))

(declare-fun m!459713 () Bool)

(assert (=> start!71310 m!459713))

(declare-fun m!459715 () Bool)

(assert (=> b!321406 m!459715))

(check-sat (not b!321406) (not start!71310))
(check-sat)
(get-model)

(declare-fun d!105332 () Bool)

(assert (=> d!105332 (= (array_inv!8416 (buf!8006 thiss!900)) (bvsge (size!8864 (buf!8006 thiss!900)) #b00000000000000000000000000000000))))

(assert (=> b!321406 d!105332))

(declare-fun d!105334 () Bool)

(assert (=> d!105334 (= (moveByteIndexPrecond!0 thiss!900 diffInBytes!21) (and (bvsle (bvneg (size!8864 (buf!8006 thiss!900))) diffInBytes!21) (bvsle diffInBytes!21 (size!8864 (buf!8006 thiss!900))) (let ((res!99 (bvadd ((_ sign_extend 32) (currentByte!14777 thiss!900)) ((_ sign_extend 32) diffInBytes!21)))) (or (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 res!99) (bvslt res!99 ((_ sign_extend 32) (size!8864 (buf!8006 thiss!900))))) (and (= (currentBit!14772 thiss!900) #b00000000000000000000000000000000) (= res!99 ((_ sign_extend 32) (size!8864 (buf!8006 thiss!900)))))))))))

(assert (=> start!71310 d!105334))

(declare-fun d!105342 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105342 (= (inv!12 thiss!900) (invariant!0 (currentBit!14772 thiss!900) (currentByte!14777 thiss!900) (size!8864 (buf!8006 thiss!900))))))

(declare-fun bs!27699 () Bool)

(assert (= bs!27699 d!105342))

(declare-fun m!459723 () Bool)

(assert (=> bs!27699 m!459723))

(assert (=> start!71310 d!105342))

(check-sat (not d!105342))
(check-sat)
