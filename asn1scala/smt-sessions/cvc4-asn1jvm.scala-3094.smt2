; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71288 () Bool)

(assert start!71288)

(declare-fun res!263932 () Bool)

(declare-fun e!231409 () Bool)

(assert (=> start!71288 (=> (not res!263932) (not e!231409))))

(declare-datatypes ((array!20344 0))(
  ( (array!20345 (arr!9954 (Array (_ BitVec 32) (_ BitVec 8))) (size!8862 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13886 0))(
  ( (BitStream!13887 (buf!8004 array!20344) (currentByte!14775 (_ BitVec 32)) (currentBit!14770 (_ BitVec 32))) )
))
(declare-fun thiss!900 () BitStream!13886)

(declare-fun diffInBytes!21 () (_ BitVec 32))

(declare-fun moveByteIndexPrecond!0 (BitStream!13886 (_ BitVec 32)) Bool)

(assert (=> start!71288 (= res!263932 (moveByteIndexPrecond!0 thiss!900 diffInBytes!21))))

(assert (=> start!71288 e!231409))

(declare-fun e!231410 () Bool)

(declare-fun inv!12 (BitStream!13886) Bool)

(assert (=> start!71288 (and (inv!12 thiss!900) e!231410)))

(assert (=> start!71288 true))

(declare-fun b!321390 () Bool)

(assert (=> b!321390 (= e!231409 (and (= (bvand (currentByte!14775 thiss!900) #b10000000000000000000000000000000) (bvand diffInBytes!21 #b10000000000000000000000000000000)) (not (= (bvand (currentByte!14775 thiss!900) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!14775 thiss!900) diffInBytes!21) #b10000000000000000000000000000000)))))))

(declare-fun b!321391 () Bool)

(declare-fun array_inv!8414 (array!20344) Bool)

(assert (=> b!321391 (= e!231410 (array_inv!8414 (buf!8004 thiss!900)))))

(assert (= (and start!71288 res!263932) b!321390))

(assert (= start!71288 b!321391))

(declare-fun m!459693 () Bool)

(assert (=> start!71288 m!459693))

(declare-fun m!459695 () Bool)

(assert (=> start!71288 m!459695))

(declare-fun m!459697 () Bool)

(assert (=> b!321391 m!459697))

(push 1)

(assert (not b!321391))

(assert (not start!71288))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105316 () Bool)

(assert (=> d!105316 (= (array_inv!8414 (buf!8004 thiss!900)) (bvsge (size!8862 (buf!8004 thiss!900)) #b00000000000000000000000000000000))))

(assert (=> b!321391 d!105316))

(declare-fun d!105318 () Bool)

(assert (=> d!105318 (= (moveByteIndexPrecond!0 thiss!900 diffInBytes!21) (and (bvsle (bvneg (size!8862 (buf!8004 thiss!900))) diffInBytes!21) (bvsle diffInBytes!21 (size!8862 (buf!8004 thiss!900))) (let ((res!99 (bvadd ((_ sign_extend 32) (currentByte!14775 thiss!900)) ((_ sign_extend 32) diffInBytes!21)))) (or (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 res!99) (bvslt res!99 ((_ sign_extend 32) (size!8862 (buf!8004 thiss!900))))) (and (= (currentBit!14770 thiss!900) #b00000000000000000000000000000000) (= res!99 ((_ sign_extend 32) (size!8862 (buf!8004 thiss!900)))))))))))

(assert (=> start!71288 d!105318))

(declare-fun d!105328 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105328 (= (inv!12 thiss!900) (invariant!0 (currentBit!14770 thiss!900) (currentByte!14775 thiss!900) (size!8862 (buf!8004 thiss!900))))))

(declare-fun bs!27695 () Bool)

(assert (= bs!27695 d!105328))

(declare-fun m!459703 () Bool)

(assert (=> bs!27695 m!459703))

(assert (=> start!71288 d!105328))

(push 1)

