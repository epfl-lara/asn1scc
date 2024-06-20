; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71308 () Bool)

(assert start!71308)

(declare-fun res!263935 () Bool)

(declare-fun e!231418 () Bool)

(assert (=> start!71308 (=> (not res!263935) (not e!231418))))

(declare-datatypes ((array!20349 0))(
  ( (array!20350 (arr!9955 (Array (_ BitVec 32) (_ BitVec 8))) (size!8863 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13888 0))(
  ( (BitStream!13889 (buf!8005 array!20349) (currentByte!14776 (_ BitVec 32)) (currentBit!14771 (_ BitVec 32))) )
))
(declare-fun thiss!900 () BitStream!13888)

(declare-fun diffInBytes!21 () (_ BitVec 32))

(declare-fun moveByteIndexPrecond!0 (BitStream!13888 (_ BitVec 32)) Bool)

(assert (=> start!71308 (= res!263935 (moveByteIndexPrecond!0 thiss!900 diffInBytes!21))))

(assert (=> start!71308 e!231418))

(declare-fun e!231419 () Bool)

(declare-fun inv!12 (BitStream!13888) Bool)

(assert (=> start!71308 (and (inv!12 thiss!900) e!231419)))

(assert (=> start!71308 true))

(declare-fun b!321399 () Bool)

(assert (=> b!321399 (= e!231418 (and (= (bvand (currentByte!14776 thiss!900) #b10000000000000000000000000000000) (bvand diffInBytes!21 #b10000000000000000000000000000000)) (not (= (bvand (currentByte!14776 thiss!900) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!14776 thiss!900) diffInBytes!21) #b10000000000000000000000000000000)))))))

(declare-fun b!321400 () Bool)

(declare-fun array_inv!8415 (array!20349) Bool)

(assert (=> b!321400 (= e!231419 (array_inv!8415 (buf!8005 thiss!900)))))

(assert (= (and start!71308 res!263935) b!321399))

(assert (= start!71308 b!321400))

(declare-fun m!459705 () Bool)

(assert (=> start!71308 m!459705))

(declare-fun m!459707 () Bool)

(assert (=> start!71308 m!459707))

(declare-fun m!459709 () Bool)

(assert (=> b!321400 m!459709))

(push 1)

(assert (not start!71308))

(assert (not b!321400))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105336 () Bool)

(assert (=> d!105336 (= (moveByteIndexPrecond!0 thiss!900 diffInBytes!21) (and (bvsle (bvneg (size!8863 (buf!8005 thiss!900))) diffInBytes!21) (bvsle diffInBytes!21 (size!8863 (buf!8005 thiss!900))) (let ((res!99 (bvadd ((_ sign_extend 32) (currentByte!14776 thiss!900)) ((_ sign_extend 32) diffInBytes!21)))) (or (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 res!99) (bvslt res!99 ((_ sign_extend 32) (size!8863 (buf!8005 thiss!900))))) (and (= (currentBit!14771 thiss!900) #b00000000000000000000000000000000) (= res!99 ((_ sign_extend 32) (size!8863 (buf!8005 thiss!900)))))))))))

(assert (=> start!71308 d!105336))

(declare-fun d!105344 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105344 (= (inv!12 thiss!900) (invariant!0 (currentBit!14771 thiss!900) (currentByte!14776 thiss!900) (size!8863 (buf!8005 thiss!900))))))

(declare-fun bs!27700 () Bool)

(assert (= bs!27700 d!105344))

(declare-fun m!459725 () Bool)

(assert (=> bs!27700 m!459725))

(assert (=> start!71308 d!105344))

(declare-fun d!105346 () Bool)

(assert (=> d!105346 (= (array_inv!8415 (buf!8005 thiss!900)) (bvsge (size!8863 (buf!8005 thiss!900)) #b00000000000000000000000000000000))))

(assert (=> b!321400 d!105346))

(push 1)

(assert (not d!105344))

(check-sat)

(pop 1)

