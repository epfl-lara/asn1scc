; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71254 () Bool)

(assert start!71254)

(declare-fun res!263917 () Bool)

(declare-fun e!231364 () Bool)

(assert (=> start!71254 (=> (not res!263917) (not e!231364))))

(declare-datatypes ((array!20331 0))(
  ( (array!20332 (arr!9949 (Array (_ BitVec 32) (_ BitVec 8))) (size!8857 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13876 0))(
  ( (BitStream!13877 (buf!7999 array!20331) (currentByte!14767 (_ BitVec 32)) (currentBit!14762 (_ BitVec 32))) )
))
(declare-fun thiss!900 () BitStream!13876)

(declare-fun diffInBytes!21 () (_ BitVec 32))

(declare-fun moveByteIndexPrecond!0 (BitStream!13876 (_ BitVec 32)) Bool)

(assert (=> start!71254 (= res!263917 (moveByteIndexPrecond!0 thiss!900 diffInBytes!21))))

(assert (=> start!71254 e!231364))

(declare-fun e!231365 () Bool)

(declare-fun inv!12 (BitStream!13876) Bool)

(assert (=> start!71254 (and (inv!12 thiss!900) e!231365)))

(assert (=> start!71254 true))

(declare-fun b!321357 () Bool)

(assert (=> b!321357 (= e!231364 (not (inv!12 (BitStream!13877 (buf!7999 thiss!900) (bvadd (currentByte!14767 thiss!900) diffInBytes!21) (currentBit!14762 thiss!900)))))))

(declare-fun b!321358 () Bool)

(declare-fun array_inv!8409 (array!20331) Bool)

(assert (=> b!321358 (= e!231365 (array_inv!8409 (buf!7999 thiss!900)))))

(assert (= (and start!71254 res!263917) b!321357))

(assert (= start!71254 b!321358))

(declare-fun m!459645 () Bool)

(assert (=> start!71254 m!459645))

(declare-fun m!459647 () Bool)

(assert (=> start!71254 m!459647))

(declare-fun m!459649 () Bool)

(assert (=> b!321357 m!459649))

(declare-fun m!459651 () Bool)

(assert (=> b!321358 m!459651))

(push 1)

(assert (not start!71254))

(assert (not b!321358))

(assert (not b!321357))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105274 () Bool)

(assert (=> d!105274 (= (moveByteIndexPrecond!0 thiss!900 diffInBytes!21) (and (bvsle (bvneg (size!8857 (buf!7999 thiss!900))) diffInBytes!21) (bvsle diffInBytes!21 (size!8857 (buf!7999 thiss!900))) (let ((res!99 (bvadd ((_ sign_extend 32) (currentByte!14767 thiss!900)) ((_ sign_extend 32) diffInBytes!21)))) (or (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 res!99) (bvslt res!99 ((_ sign_extend 32) (size!8857 (buf!7999 thiss!900))))) (and (= (currentBit!14762 thiss!900) #b00000000000000000000000000000000) (= res!99 ((_ sign_extend 32) (size!8857 (buf!7999 thiss!900)))))))))))

(assert (=> start!71254 d!105274))

(declare-fun d!105286 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105286 (= (inv!12 thiss!900) (invariant!0 (currentBit!14762 thiss!900) (currentByte!14767 thiss!900) (size!8857 (buf!7999 thiss!900))))))

(declare-fun bs!27686 () Bool)

(assert (= bs!27686 d!105286))

(declare-fun m!459673 () Bool)

(assert (=> bs!27686 m!459673))

(assert (=> start!71254 d!105286))

(declare-fun d!105292 () Bool)

(assert (=> d!105292 (= (array_inv!8409 (buf!7999 thiss!900)) (bvsge (size!8857 (buf!7999 thiss!900)) #b00000000000000000000000000000000))))

(assert (=> b!321358 d!105292))

(declare-fun d!105294 () Bool)

(assert (=> d!105294 (= (inv!12 (BitStream!13877 (buf!7999 thiss!900) (bvadd (currentByte!14767 thiss!900) diffInBytes!21) (currentBit!14762 thiss!900))) (invariant!0 (currentBit!14762 (BitStream!13877 (buf!7999 thiss!900) (bvadd (currentByte!14767 thiss!900) diffInBytes!21) (currentBit!14762 thiss!900))) (currentByte!14767 (BitStream!13877 (buf!7999 thiss!900) (bvadd (currentByte!14767 thiss!900) diffInBytes!21) (currentBit!14762 thiss!900))) (size!8857 (buf!7999 (BitStream!13877 (buf!7999 thiss!900) (bvadd (currentByte!14767 thiss!900) diffInBytes!21) (currentBit!14762 thiss!900))))))))

(declare-fun bs!27688 () Bool)

(assert (= bs!27688 d!105294))

(declare-fun m!459677 () Bool)

(assert (=> bs!27688 m!459677))

(assert (=> b!321357 d!105294))

(push 1)

(assert (not d!105286))

(assert (not d!105294))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105302 () Bool)

(assert (=> d!105302 (= (invariant!0 (currentBit!14762 thiss!900) (currentByte!14767 thiss!900) (size!8857 (buf!7999 thiss!900))) (and (bvsge (currentBit!14762 thiss!900) #b00000000000000000000000000000000) (bvslt (currentBit!14762 thiss!900) #b00000000000000000000000000001000) (bvsge (currentByte!14767 thiss!900) #b00000000000000000000000000000000) (or (bvslt (currentByte!14767 thiss!900) (size!8857 (buf!7999 thiss!900))) (and (= (currentBit!14762 thiss!900) #b00000000000000000000000000000000) (= (currentByte!14767 thiss!900) (size!8857 (buf!7999 thiss!900)))))))))

(assert (=> d!105286 d!105302))

(declare-fun d!105304 () Bool)

(assert (=> d!105304 (= (invariant!0 (currentBit!14762 (BitStream!13877 (buf!7999 thiss!900) (bvadd (currentByte!14767 thiss!900) diffInBytes!21) (currentBit!14762 thiss!900))) (currentByte!14767 (BitStream!13877 (buf!7999 thiss!900) (bvadd (currentByte!14767 thiss!900) diffInBytes!21) (currentBit!14762 thiss!900))) (size!8857 (buf!7999 (BitStream!13877 (buf!7999 thiss!900) (bvadd (currentByte!14767 thiss!900) diffInBytes!21) (currentBit!14762 thiss!900))))) (and (bvsge (currentBit!14762 (BitStream!13877 (buf!7999 thiss!900) (bvadd (currentByte!14767 thiss!900) diffInBytes!21) (currentBit!14762 thiss!900))) #b00000000000000000000000000000000) (bvslt (currentBit!14762 (BitStream!13877 (buf!7999 thiss!900) (bvadd (currentByte!14767 thiss!900) diffInBytes!21) (currentBit!14762 thiss!900))) #b00000000000000000000000000001000) (bvsge (currentByte!14767 (BitStream!13877 (buf!7999 thiss!900) (bvadd (currentByte!14767 thiss!900) diffInBytes!21) (currentBit!14762 thiss!900))) #b00000000000000000000000000000000) (or (bvslt (currentByte!14767 (BitStream!13877 (buf!7999 thiss!900) (bvadd (currentByte!14767 thiss!900) diffInBytes!21) (currentBit!14762 thiss!900))) (size!8857 (buf!7999 (BitStream!13877 (buf!7999 thiss!900) (bvadd (currentByte!14767 thiss!900) diffInBytes!21) (currentBit!14762 thiss!900))))) (and (= (currentBit!14762 (BitStream!13877 (buf!7999 thiss!900) (bvadd (currentByte!14767 thiss!900) diffInBytes!21) (currentBit!14762 thiss!900))) #b00000000000000000000000000000000) (= (currentByte!14767 (BitStream!13877 (buf!7999 thiss!900) (bvadd (currentByte!14767 thiss!900) diffInBytes!21) (currentBit!14762 thiss!900))) (size!8857 (buf!7999 (BitStream!13877 (buf!7999 thiss!900) (bvadd (currentByte!14767 thiss!900) diffInBytes!21) (currentBit!14762 thiss!900)))))))))))

(assert (=> d!105294 d!105304))

(push 1)

(check-sat)

(pop 1)

