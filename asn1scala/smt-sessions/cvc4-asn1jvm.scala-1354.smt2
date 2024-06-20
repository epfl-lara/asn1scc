; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37596 () Bool)

(assert start!37596)

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(declare-datatypes ((array!9025 0))(
  ( (array!9026 (arr!4926 (Array (_ BitVec 32) (_ BitVec 8))) (size!3996 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7130 0))(
  ( (BitStream!7131 (buf!4439 array!9025) (currentByte!8423 (_ BitVec 32)) (currentBit!8418 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7130)

(assert (=> start!37596 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283) (or (bvsgt ((_ sign_extend 32) (size!3996 (buf!4439 bs!64))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!8423 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!8418 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!37596 true))

(declare-fun e!119079 () Bool)

(declare-fun inv!12 (BitStream!7130) Bool)

(assert (=> start!37596 (and (inv!12 bs!64) e!119079)))

(declare-fun b!170709 () Bool)

(declare-fun array_inv!3737 (array!9025) Bool)

(assert (=> b!170709 (= e!119079 (array_inv!3737 (buf!4439 bs!64)))))

(assert (= start!37596 b!170709))

(declare-fun m!269863 () Bool)

(assert (=> start!37596 m!269863))

(declare-fun m!269865 () Bool)

(assert (=> b!170709 m!269865))

(push 1)

(assert (not start!37596))

(assert (not b!170709))

(check-sat)

