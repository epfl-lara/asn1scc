; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71546 () Bool)

(assert start!71546)

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20460 0))(
  ( (array!20461 (arr!10000 (Array (_ BitVec 32) (_ BitVec 8))) (size!8908 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13978 0))(
  ( (BitStream!13979 (buf!8050 array!20460) (currentByte!14847 (_ BitVec 32)) (currentBit!14842 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!13978)

(assert (=> start!71546 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8908 (buf!8050 thiss!1793))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14847 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14842 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8908 (buf!8050 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14847 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14842 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71546 true))

(declare-fun e!231758 () Bool)

(declare-fun inv!12 (BitStream!13978) Bool)

(assert (=> start!71546 (and (inv!12 thiss!1793) e!231758)))

(declare-fun b!321634 () Bool)

(declare-fun array_inv!8460 (array!20460) Bool)

(assert (=> b!321634 (= e!231758 (array_inv!8460 (buf!8050 thiss!1793)))))

(assert (= start!71546 b!321634))

(declare-fun m!459987 () Bool)

(assert (=> start!71546 m!459987))

(declare-fun m!459989 () Bool)

(assert (=> b!321634 m!459989))

(push 1)

(assert (not b!321634))

(assert (not start!71546))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105512 () Bool)

(assert (=> d!105512 (= (array_inv!8460 (buf!8050 thiss!1793)) (bvsge (size!8908 (buf!8050 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!321634 d!105512))

(declare-fun d!105514 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

