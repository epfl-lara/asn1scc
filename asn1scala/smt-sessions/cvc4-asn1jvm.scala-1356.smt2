; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37624 () Bool)

(assert start!37624)

(declare-fun res!141684 () Bool)

(declare-fun e!119123 () Bool)

(assert (=> start!37624 (=> (not res!141684) (not e!119123))))

(declare-datatypes ((array!9040 0))(
  ( (array!9041 (arr!4932 (Array (_ BitVec 32) (_ BitVec 8))) (size!4002 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7142 0))(
  ( (BitStream!7143 (buf!4445 array!9040) (currentByte!8431 (_ BitVec 32)) (currentBit!8426 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7142)

(declare-fun from!235 () (_ BitVec 64))

(declare-fun nBits!283 () (_ BitVec 64))

(assert (=> start!37624 (= res!141684 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283) (bvsle ((_ sign_extend 32) (size!4002 (buf!4445 bs!64))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8431 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8426 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4002 (buf!4445 bs!64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8431 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8426 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!37624 e!119123))

(assert (=> start!37624 true))

(declare-fun e!119124 () Bool)

(declare-fun inv!12 (BitStream!7142) Bool)

(assert (=> start!37624 (and (inv!12 bs!64) e!119124)))

(declare-fun b!170735 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!170735 (= e!119123 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8426 bs!64))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8431 bs!64))) ((_ extract 31 0) ((_ sign_extend 32) (size!4002 (buf!4445 bs!64)))))))))

(declare-fun b!170736 () Bool)

(declare-fun array_inv!3743 (array!9040) Bool)

(assert (=> b!170736 (= e!119124 (array_inv!3743 (buf!4445 bs!64)))))

(assert (= (and start!37624 res!141684) b!170735))

(assert (= start!37624 b!170736))

(declare-fun m!269897 () Bool)

(assert (=> start!37624 m!269897))

(declare-fun m!269899 () Bool)

(assert (=> b!170735 m!269899))

(declare-fun m!269901 () Bool)

(assert (=> b!170736 m!269901))

(push 1)

(assert (not start!37624))

(assert (not b!170736))

(assert (not b!170735))

(check-sat)

(pop 1)

(push 1)

(check-sat)

