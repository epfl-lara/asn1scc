; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37620 () Bool)

(assert start!37620)

(declare-fun res!141678 () Bool)

(declare-fun e!119105 () Bool)

(assert (=> start!37620 (=> (not res!141678) (not e!119105))))

(declare-datatypes ((array!9036 0))(
  ( (array!9037 (arr!4930 (Array (_ BitVec 32) (_ BitVec 8))) (size!4000 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7138 0))(
  ( (BitStream!7139 (buf!4443 array!9036) (currentByte!8429 (_ BitVec 32)) (currentBit!8424 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7138)

(declare-fun from!235 () (_ BitVec 64))

(declare-fun nBits!283 () (_ BitVec 64))

(assert (=> start!37620 (= res!141678 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283) (bvsle ((_ sign_extend 32) (size!4000 (buf!4443 bs!64))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8429 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8424 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4000 (buf!4443 bs!64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8429 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8424 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!37620 e!119105))

(assert (=> start!37620 true))

(declare-fun e!119106 () Bool)

(declare-fun inv!12 (BitStream!7138) Bool)

(assert (=> start!37620 (and (inv!12 bs!64) e!119106)))

(declare-fun b!170723 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!170723 (= e!119105 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8424 bs!64))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8429 bs!64))) ((_ extract 31 0) ((_ sign_extend 32) (size!4000 (buf!4443 bs!64)))))))))

(declare-fun b!170724 () Bool)

(declare-fun array_inv!3741 (array!9036) Bool)

(assert (=> b!170724 (= e!119106 (array_inv!3741 (buf!4443 bs!64)))))

(assert (= (and start!37620 res!141678) b!170723))

(assert (= start!37620 b!170724))

(declare-fun m!269885 () Bool)

(assert (=> start!37620 m!269885))

(declare-fun m!269887 () Bool)

(assert (=> b!170723 m!269887))

(declare-fun m!269889 () Bool)

(assert (=> b!170724 m!269889))

(push 1)

(assert (not b!170724))

(assert (not b!170723))

(assert (not start!37620))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

