; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71258 () Bool)

(assert start!71258)

(declare-fun res!263923 () Bool)

(declare-fun e!231382 () Bool)

(assert (=> start!71258 (=> (not res!263923) (not e!231382))))

(declare-datatypes ((array!20335 0))(
  ( (array!20336 (arr!9951 (Array (_ BitVec 32) (_ BitVec 8))) (size!8859 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13880 0))(
  ( (BitStream!13881 (buf!8001 array!20335) (currentByte!14769 (_ BitVec 32)) (currentBit!14764 (_ BitVec 32))) )
))
(declare-fun thiss!900 () BitStream!13880)

(declare-fun diffInBytes!21 () (_ BitVec 32))

(declare-fun moveByteIndexPrecond!0 (BitStream!13880 (_ BitVec 32)) Bool)

(assert (=> start!71258 (= res!263923 (moveByteIndexPrecond!0 thiss!900 diffInBytes!21))))

(assert (=> start!71258 e!231382))

(declare-fun e!231383 () Bool)

(declare-fun inv!12 (BitStream!13880) Bool)

(assert (=> start!71258 (and (inv!12 thiss!900) e!231383)))

(assert (=> start!71258 true))

(declare-fun b!321369 () Bool)

(assert (=> b!321369 (= e!231382 (not (inv!12 (BitStream!13881 (buf!8001 thiss!900) (bvadd (currentByte!14769 thiss!900) diffInBytes!21) (currentBit!14764 thiss!900)))))))

(declare-fun b!321370 () Bool)

(declare-fun array_inv!8411 (array!20335) Bool)

(assert (=> b!321370 (= e!231383 (array_inv!8411 (buf!8001 thiss!900)))))

(assert (= (and start!71258 res!263923) b!321369))

(assert (= start!71258 b!321370))

(declare-fun m!459661 () Bool)

(assert (=> start!71258 m!459661))

(declare-fun m!459663 () Bool)

(assert (=> start!71258 m!459663))

(declare-fun m!459665 () Bool)

(assert (=> b!321369 m!459665))

(declare-fun m!459667 () Bool)

(assert (=> b!321370 m!459667))

(push 1)

(assert (not b!321370))

(assert (not b!321369))

(assert (not start!71258))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105280 () Bool)

(assert (=> d!105280 (= (array_inv!8411 (buf!8001 thiss!900)) (bvsge (size!8859 (buf!8001 thiss!900)) #b00000000000000000000000000000000))))

(assert (=> b!321370 d!105280))

(declare-fun d!105282 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105282 (= (inv!12 (BitStream!13881 (buf!8001 thiss!900) (bvadd (currentByte!14769 thiss!900) diffInBytes!21) (currentBit!14764 thiss!900))) (invariant!0 (currentBit!14764 (BitStream!13881 (buf!8001 thiss!900) (bvadd (currentByte!14769 thiss!900) diffInBytes!21) (currentBit!14764 thiss!900))) (currentByte!14769 (BitStream!13881 (buf!8001 thiss!900) (bvadd (currentByte!14769 thiss!900) diffInBytes!21) (currentBit!14764 thiss!900))) (size!8859 (buf!8001 (BitStream!13881 (buf!8001 thiss!900) (bvadd (currentByte!14769 thiss!900) diffInBytes!21) (currentBit!14764 thiss!900))))))))

(declare-fun bs!27684 () Bool)

(assert (= bs!27684 d!105282))

(declare-fun m!459669 () Bool)

(assert (=> bs!27684 m!459669))

(assert (=> b!321369 d!105282))

(declare-fun d!105288 () Bool)

(assert (=> d!105288 (= (moveByteIndexPrecond!0 thiss!900 diffInBytes!21) (and (bvsle (bvneg (size!8859 (buf!8001 thiss!900))) diffInBytes!21) (bvsle diffInBytes!21 (size!8859 (buf!8001 thiss!900))) (let ((res!99 (bvadd ((_ sign_extend 32) (currentByte!14769 thiss!900)) ((_ sign_extend 32) diffInBytes!21)))) (or (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 res!99) (bvslt res!99 ((_ sign_extend 32) (size!8859 (buf!8001 thiss!900))))) (and (= (currentBit!14764 thiss!900) #b00000000000000000000000000000000) (= res!99 ((_ sign_extend 32) (size!8859 (buf!8001 thiss!900)))))))))))

(assert (=> start!71258 d!105288))

(declare-fun d!105296 () Bool)

(assert (=> d!105296 (= (inv!12 thiss!900) (invariant!0 (currentBit!14764 thiss!900) (currentByte!14769 thiss!900) (size!8859 (buf!8001 thiss!900))))))

(declare-fun bs!27689 () Bool)

(assert (= bs!27689 d!105296))

(declare-fun m!459679 () Bool)

(assert (=> bs!27689 m!459679))

(assert (=> start!71258 d!105296))

(push 1)

(assert (not d!105282))

(assert (not d!105296))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105306 () Bool)

