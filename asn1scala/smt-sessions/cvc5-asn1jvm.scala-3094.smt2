; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71284 () Bool)

(assert start!71284)

(declare-fun res!263926 () Bool)

(declare-fun e!231391 () Bool)

(assert (=> start!71284 (=> (not res!263926) (not e!231391))))

(declare-datatypes ((array!20340 0))(
  ( (array!20341 (arr!9952 (Array (_ BitVec 32) (_ BitVec 8))) (size!8860 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13882 0))(
  ( (BitStream!13883 (buf!8002 array!20340) (currentByte!14773 (_ BitVec 32)) (currentBit!14768 (_ BitVec 32))) )
))
(declare-fun thiss!900 () BitStream!13882)

(declare-fun diffInBytes!21 () (_ BitVec 32))

(declare-fun moveByteIndexPrecond!0 (BitStream!13882 (_ BitVec 32)) Bool)

(assert (=> start!71284 (= res!263926 (moveByteIndexPrecond!0 thiss!900 diffInBytes!21))))

(assert (=> start!71284 e!231391))

(declare-fun e!231392 () Bool)

(declare-fun inv!12 (BitStream!13882) Bool)

(assert (=> start!71284 (and (inv!12 thiss!900) e!231392)))

(assert (=> start!71284 true))

(declare-fun b!321378 () Bool)

(assert (=> b!321378 (= e!231391 (and (= (bvand (currentByte!14773 thiss!900) #b10000000000000000000000000000000) (bvand diffInBytes!21 #b10000000000000000000000000000000)) (not (= (bvand (currentByte!14773 thiss!900) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!14773 thiss!900) diffInBytes!21) #b10000000000000000000000000000000)))))))

(declare-fun b!321379 () Bool)

(declare-fun array_inv!8412 (array!20340) Bool)

(assert (=> b!321379 (= e!231392 (array_inv!8412 (buf!8002 thiss!900)))))

(assert (= (and start!71284 res!263926) b!321378))

(assert (= start!71284 b!321379))

(declare-fun m!459681 () Bool)

(assert (=> start!71284 m!459681))

(declare-fun m!459683 () Bool)

(assert (=> start!71284 m!459683))

(declare-fun m!459685 () Bool)

(assert (=> b!321379 m!459685))

(push 1)

(assert (not start!71284))

(assert (not b!321379))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105314 () Bool)

(assert (=> d!105314 (= (moveByteIndexPrecond!0 thiss!900 diffInBytes!21) (and (bvsle (bvneg (size!8860 (buf!8002 thiss!900))) diffInBytes!21) (bvsle diffInBytes!21 (size!8860 (buf!8002 thiss!900))) (let ((res!99 (bvadd ((_ sign_extend 32) (currentByte!14773 thiss!900)) ((_ sign_extend 32) diffInBytes!21)))) (or (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 res!99) (bvslt res!99 ((_ sign_extend 32) (size!8860 (buf!8002 thiss!900))))) (and (= (currentBit!14768 thiss!900) #b00000000000000000000000000000000) (= res!99 ((_ sign_extend 32) (size!8860 (buf!8002 thiss!900)))))))))))

(assert (=> start!71284 d!105314))

(declare-fun d!105322 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105322 (= (inv!12 thiss!900) (invariant!0 (currentBit!14768 thiss!900) (currentByte!14773 thiss!900) (size!8860 (buf!8002 thiss!900))))))

(declare-fun bs!27694 () Bool)

(assert (= bs!27694 d!105322))

(declare-fun m!459701 () Bool)

(assert (=> bs!27694 m!459701))

(assert (=> start!71284 d!105322))

(declare-fun d!105326 () Bool)

(assert (=> d!105326 (= (array_inv!8412 (buf!8002 thiss!900)) (bvsge (size!8860 (buf!8002 thiss!900)) #b00000000000000000000000000000000))))

(assert (=> b!321379 d!105326))

(push 1)

(assert (not d!105322))

(check-sat)

(pop 1)

(push 1)

(check-sat)

