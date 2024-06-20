; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37594 () Bool)

(assert start!37594)

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(declare-datatypes ((array!9023 0))(
  ( (array!9024 (arr!4925 (Array (_ BitVec 32) (_ BitVec 8))) (size!3995 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7128 0))(
  ( (BitStream!7129 (buf!4438 array!9023) (currentByte!8422 (_ BitVec 32)) (currentBit!8417 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7128)

(assert (=> start!37594 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283) (or (bvsgt ((_ sign_extend 32) (size!3995 (buf!4438 bs!64))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!8422 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!8417 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!37594 true))

(declare-fun e!119073 () Bool)

(declare-fun inv!12 (BitStream!7128) Bool)

(assert (=> start!37594 (and (inv!12 bs!64) e!119073)))

(declare-fun b!170706 () Bool)

(declare-fun array_inv!3736 (array!9023) Bool)

(assert (=> b!170706 (= e!119073 (array_inv!3736 (buf!4438 bs!64)))))

(assert (= start!37594 b!170706))

(declare-fun m!269859 () Bool)

(assert (=> start!37594 m!269859))

(declare-fun m!269861 () Bool)

(assert (=> b!170706 m!269861))

(check-sat (not b!170706) (not start!37594))
(check-sat)
