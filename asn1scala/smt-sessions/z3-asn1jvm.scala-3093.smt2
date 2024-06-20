; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71256 () Bool)

(assert start!71256)

(declare-fun res!263920 () Bool)

(declare-fun e!231373 () Bool)

(assert (=> start!71256 (=> (not res!263920) (not e!231373))))

(declare-datatypes ((array!20333 0))(
  ( (array!20334 (arr!9950 (Array (_ BitVec 32) (_ BitVec 8))) (size!8858 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13878 0))(
  ( (BitStream!13879 (buf!8000 array!20333) (currentByte!14768 (_ BitVec 32)) (currentBit!14763 (_ BitVec 32))) )
))
(declare-fun thiss!900 () BitStream!13878)

(declare-fun diffInBytes!21 () (_ BitVec 32))

(declare-fun moveByteIndexPrecond!0 (BitStream!13878 (_ BitVec 32)) Bool)

(assert (=> start!71256 (= res!263920 (moveByteIndexPrecond!0 thiss!900 diffInBytes!21))))

(assert (=> start!71256 e!231373))

(declare-fun e!231374 () Bool)

(declare-fun inv!12 (BitStream!13878) Bool)

(assert (=> start!71256 (and (inv!12 thiss!900) e!231374)))

(assert (=> start!71256 true))

(declare-fun b!321363 () Bool)

(assert (=> b!321363 (= e!231373 (not (inv!12 (BitStream!13879 (buf!8000 thiss!900) (bvadd (currentByte!14768 thiss!900) diffInBytes!21) (currentBit!14763 thiss!900)))))))

(declare-fun b!321364 () Bool)

(declare-fun array_inv!8410 (array!20333) Bool)

(assert (=> b!321364 (= e!231374 (array_inv!8410 (buf!8000 thiss!900)))))

(assert (= (and start!71256 res!263920) b!321363))

(assert (= start!71256 b!321364))

(declare-fun m!459653 () Bool)

(assert (=> start!71256 m!459653))

(declare-fun m!459655 () Bool)

(assert (=> start!71256 m!459655))

(declare-fun m!459657 () Bool)

(assert (=> b!321363 m!459657))

(declare-fun m!459659 () Bool)

(assert (=> b!321364 m!459659))

(check-sat (not b!321364) (not start!71256) (not b!321363))
(check-sat)
(get-model)

(declare-fun d!105276 () Bool)

(assert (=> d!105276 (= (array_inv!8410 (buf!8000 thiss!900)) (bvsge (size!8858 (buf!8000 thiss!900)) #b00000000000000000000000000000000))))

(assert (=> b!321364 d!105276))

(declare-fun d!105278 () Bool)

(assert (=> d!105278 (= (moveByteIndexPrecond!0 thiss!900 diffInBytes!21) (and (bvsle (bvneg (size!8858 (buf!8000 thiss!900))) diffInBytes!21) (bvsle diffInBytes!21 (size!8858 (buf!8000 thiss!900))) (let ((res!99 (bvadd ((_ sign_extend 32) (currentByte!14768 thiss!900)) ((_ sign_extend 32) diffInBytes!21)))) (or (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 res!99) (bvslt res!99 ((_ sign_extend 32) (size!8858 (buf!8000 thiss!900))))) (and (= (currentBit!14763 thiss!900) #b00000000000000000000000000000000) (= res!99 ((_ sign_extend 32) (size!8858 (buf!8000 thiss!900)))))))))))

(assert (=> start!71256 d!105278))

(declare-fun d!105285 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105285 (= (inv!12 thiss!900) (invariant!0 (currentBit!14763 thiss!900) (currentByte!14768 thiss!900) (size!8858 (buf!8000 thiss!900))))))

(declare-fun bs!27685 () Bool)

(assert (= bs!27685 d!105285))

(declare-fun m!459671 () Bool)

(assert (=> bs!27685 m!459671))

(assert (=> start!71256 d!105285))

(declare-fun d!105290 () Bool)

(assert (=> d!105290 (= (inv!12 (BitStream!13879 (buf!8000 thiss!900) (bvadd (currentByte!14768 thiss!900) diffInBytes!21) (currentBit!14763 thiss!900))) (invariant!0 (currentBit!14763 (BitStream!13879 (buf!8000 thiss!900) (bvadd (currentByte!14768 thiss!900) diffInBytes!21) (currentBit!14763 thiss!900))) (currentByte!14768 (BitStream!13879 (buf!8000 thiss!900) (bvadd (currentByte!14768 thiss!900) diffInBytes!21) (currentBit!14763 thiss!900))) (size!8858 (buf!8000 (BitStream!13879 (buf!8000 thiss!900) (bvadd (currentByte!14768 thiss!900) diffInBytes!21) (currentBit!14763 thiss!900))))))))

(declare-fun bs!27687 () Bool)

(assert (= bs!27687 d!105290))

(declare-fun m!459675 () Bool)

(assert (=> bs!27687 m!459675))

(assert (=> b!321363 d!105290))

(check-sat (not d!105285) (not d!105290))
(check-sat)
(get-model)

(declare-fun d!105298 () Bool)

(assert (=> d!105298 (= (invariant!0 (currentBit!14763 thiss!900) (currentByte!14768 thiss!900) (size!8858 (buf!8000 thiss!900))) (and (bvsge (currentBit!14763 thiss!900) #b00000000000000000000000000000000) (bvslt (currentBit!14763 thiss!900) #b00000000000000000000000000001000) (bvsge (currentByte!14768 thiss!900) #b00000000000000000000000000000000) (or (bvslt (currentByte!14768 thiss!900) (size!8858 (buf!8000 thiss!900))) (and (= (currentBit!14763 thiss!900) #b00000000000000000000000000000000) (= (currentByte!14768 thiss!900) (size!8858 (buf!8000 thiss!900)))))))))

(assert (=> d!105285 d!105298))

(declare-fun d!105300 () Bool)

(assert (=> d!105300 (= (invariant!0 (currentBit!14763 (BitStream!13879 (buf!8000 thiss!900) (bvadd (currentByte!14768 thiss!900) diffInBytes!21) (currentBit!14763 thiss!900))) (currentByte!14768 (BitStream!13879 (buf!8000 thiss!900) (bvadd (currentByte!14768 thiss!900) diffInBytes!21) (currentBit!14763 thiss!900))) (size!8858 (buf!8000 (BitStream!13879 (buf!8000 thiss!900) (bvadd (currentByte!14768 thiss!900) diffInBytes!21) (currentBit!14763 thiss!900))))) (and (bvsge (currentBit!14763 (BitStream!13879 (buf!8000 thiss!900) (bvadd (currentByte!14768 thiss!900) diffInBytes!21) (currentBit!14763 thiss!900))) #b00000000000000000000000000000000) (bvslt (currentBit!14763 (BitStream!13879 (buf!8000 thiss!900) (bvadd (currentByte!14768 thiss!900) diffInBytes!21) (currentBit!14763 thiss!900))) #b00000000000000000000000000001000) (bvsge (currentByte!14768 (BitStream!13879 (buf!8000 thiss!900) (bvadd (currentByte!14768 thiss!900) diffInBytes!21) (currentBit!14763 thiss!900))) #b00000000000000000000000000000000) (or (bvslt (currentByte!14768 (BitStream!13879 (buf!8000 thiss!900) (bvadd (currentByte!14768 thiss!900) diffInBytes!21) (currentBit!14763 thiss!900))) (size!8858 (buf!8000 (BitStream!13879 (buf!8000 thiss!900) (bvadd (currentByte!14768 thiss!900) diffInBytes!21) (currentBit!14763 thiss!900))))) (and (= (currentBit!14763 (BitStream!13879 (buf!8000 thiss!900) (bvadd (currentByte!14768 thiss!900) diffInBytes!21) (currentBit!14763 thiss!900))) #b00000000000000000000000000000000) (= (currentByte!14768 (BitStream!13879 (buf!8000 thiss!900) (bvadd (currentByte!14768 thiss!900) diffInBytes!21) (currentBit!14763 thiss!900))) (size!8858 (buf!8000 (BitStream!13879 (buf!8000 thiss!900) (bvadd (currentByte!14768 thiss!900) diffInBytes!21) (currentBit!14763 thiss!900)))))))))))

(assert (=> d!105290 d!105300))

(check-sat)
