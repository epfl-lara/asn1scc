; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37636 () Bool)

(assert start!37636)

(declare-fun res!141702 () Bool)

(declare-fun e!119150 () Bool)

(assert (=> start!37636 (=> (not res!141702) (not e!119150))))

(declare-datatypes ((array!9047 0))(
  ( (array!9048 (arr!4935 (Array (_ BitVec 32) (_ BitVec 8))) (size!4005 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7148 0))(
  ( (BitStream!7149 (buf!4448 array!9047) (currentByte!8435 (_ BitVec 32)) (currentBit!8430 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7148)

(declare-fun from!235 () (_ BitVec 64))

(declare-fun nBits!283 () (_ BitVec 64))

(assert (=> start!37636 (= res!141702 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283) (bvsle ((_ sign_extend 32) (size!4005 (buf!4448 bs!64))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8435 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8430 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4005 (buf!4448 bs!64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8435 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8430 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!37636 e!119150))

(assert (=> start!37636 true))

(declare-fun e!119151 () Bool)

(declare-fun inv!12 (BitStream!7148) Bool)

(assert (=> start!37636 (and (inv!12 bs!64) e!119151)))

(declare-fun b!170761 () Bool)

(declare-fun res!141701 () Bool)

(assert (=> b!170761 (=> (not res!141701) (not e!119150))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!170761 (= res!141701 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8430 bs!64))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8435 bs!64))) ((_ extract 31 0) ((_ sign_extend 32) (size!4005 (buf!4448 bs!64))))))))

(declare-fun b!170762 () Bool)

(assert (=> b!170762 (= e!119150 (bvslt (bvsub nBits!283 from!235) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!170763 () Bool)

(declare-fun array_inv!3746 (array!9047) Bool)

(assert (=> b!170763 (= e!119151 (array_inv!3746 (buf!4448 bs!64)))))

(assert (= (and start!37636 res!141702) b!170761))

(assert (= (and b!170761 res!141701) b!170762))

(assert (= start!37636 b!170763))

(declare-fun m!269917 () Bool)

(assert (=> start!37636 m!269917))

(declare-fun m!269919 () Bool)

(assert (=> b!170761 m!269919))

(declare-fun m!269921 () Bool)

(assert (=> b!170763 m!269921))

(push 1)

(assert (not b!170763))

(assert (not b!170761))

(assert (not start!37636))

(check-sat)

(pop 1)

(push 1)

(check-sat)

