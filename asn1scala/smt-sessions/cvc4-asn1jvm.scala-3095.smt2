; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71312 () Bool)

(assert start!71312)

(declare-fun res!263941 () Bool)

(declare-fun e!231436 () Bool)

(assert (=> start!71312 (=> (not res!263941) (not e!231436))))

(declare-datatypes ((array!20353 0))(
  ( (array!20354 (arr!9957 (Array (_ BitVec 32) (_ BitVec 8))) (size!8865 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13892 0))(
  ( (BitStream!13893 (buf!8007 array!20353) (currentByte!14778 (_ BitVec 32)) (currentBit!14773 (_ BitVec 32))) )
))
(declare-fun thiss!900 () BitStream!13892)

(declare-fun diffInBytes!21 () (_ BitVec 32))

(declare-fun moveByteIndexPrecond!0 (BitStream!13892 (_ BitVec 32)) Bool)

(assert (=> start!71312 (= res!263941 (moveByteIndexPrecond!0 thiss!900 diffInBytes!21))))

(assert (=> start!71312 e!231436))

(declare-fun e!231437 () Bool)

(declare-fun inv!12 (BitStream!13892) Bool)

(assert (=> start!71312 (and (inv!12 thiss!900) e!231437)))

(assert (=> start!71312 true))

(declare-fun b!321411 () Bool)

(assert (=> b!321411 (= e!231436 (and (= (bvand (currentByte!14778 thiss!900) #b10000000000000000000000000000000) (bvand diffInBytes!21 #b10000000000000000000000000000000)) (not (= (bvand (currentByte!14778 thiss!900) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!14778 thiss!900) diffInBytes!21) #b10000000000000000000000000000000)))))))

(declare-fun b!321412 () Bool)

(declare-fun array_inv!8417 (array!20353) Bool)

(assert (=> b!321412 (= e!231437 (array_inv!8417 (buf!8007 thiss!900)))))

(assert (= (and start!71312 res!263941) b!321411))

(assert (= start!71312 b!321412))

(declare-fun m!459717 () Bool)

(assert (=> start!71312 m!459717))

(declare-fun m!459719 () Bool)

(assert (=> start!71312 m!459719))

(declare-fun m!459721 () Bool)

(assert (=> b!321412 m!459721))

(push 1)

(assert (not b!321412))

(assert (not start!71312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105338 () Bool)

(assert (=> d!105338 (= (array_inv!8417 (buf!8007 thiss!900)) (bvsge (size!8865 (buf!8007 thiss!900)) #b00000000000000000000000000000000))))

(assert (=> b!321412 d!105338))

(declare-fun d!105340 () Bool)

(assert (=> d!105340 (= (moveByteIndexPrecond!0 thiss!900 diffInBytes!21) (and (bvsle (bvneg (size!8865 (buf!8007 thiss!900))) diffInBytes!21) (bvsle diffInBytes!21 (size!8865 (buf!8007 thiss!900))) (let ((res!99 (bvadd ((_ sign_extend 32) (currentByte!14778 thiss!900)) ((_ sign_extend 32) diffInBytes!21)))) (or (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 res!99) (bvslt res!99 ((_ sign_extend 32) (size!8865 (buf!8007 thiss!900))))) (and (= (currentBit!14773 thiss!900) #b00000000000000000000000000000000) (= res!99 ((_ sign_extend 32) (size!8865 (buf!8007 thiss!900)))))))))))

(assert (=> start!71312 d!105340))

(declare-fun d!105348 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105348 (= (inv!12 thiss!900) (invariant!0 (currentBit!14773 thiss!900) (currentByte!14778 thiss!900) (size!8865 (buf!8007 thiss!900))))))

