; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45362 () Bool)

(assert start!45362)

(declare-fun res!185366 () Bool)

(declare-fun e!149422 () Bool)

(assert (=> start!45362 (=> (not res!185366) (not e!149422))))

(declare-datatypes ((array!10703 0))(
  ( (array!10704 (arr!5631 (Array (_ BitVec 32) (_ BitVec 8))) (size!4701 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8510 0))(
  ( (BitStream!8511 (buf!5248 array!10703) (currentByte!9851 (_ BitVec 32)) (currentBit!9846 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8510)

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun i!541 () (_ BitVec 32))

(assert (=> start!45362 (= res!185366 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4701 (buf!5248 bs!62))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9851 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9846 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4701 (buf!5248 bs!62))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!9851 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!9846 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!45362 e!149422))

(assert (=> start!45362 true))

(declare-fun e!149424 () Bool)

(declare-fun inv!12 (BitStream!8510) Bool)

(assert (=> start!45362 (and (inv!12 bs!62) e!149424)))

(declare-fun b!220027 () Bool)

(declare-fun res!185365 () Bool)

(assert (=> b!220027 (=> (not res!185365) (not e!149422))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!220027 (= res!185365 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9846 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9851 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (size!4701 (buf!5248 bs!62))))))))

(declare-fun b!220028 () Bool)

(assert (=> b!220028 (= e!149422 (bvslt ((_ sign_extend 32) (bvsub nBits!265 i!541)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220029 () Bool)

(declare-fun array_inv!4442 (array!10703) Bool)

(assert (=> b!220029 (= e!149424 (array_inv!4442 (buf!5248 bs!62)))))

(assert (= (and start!45362 res!185366) b!220027))

(assert (= (and b!220027 res!185365) b!220028))

(assert (= start!45362 b!220029))

(declare-fun m!338767 () Bool)

(assert (=> start!45362 m!338767))

(declare-fun m!338769 () Bool)

(assert (=> b!220027 m!338769))

(declare-fun m!338771 () Bool)

(assert (=> b!220029 m!338771))

(push 1)

(assert (not b!220027))

(assert (not b!220029))

(assert (not start!45362))

(check-sat)

(pop 1)

(push 1)

(check-sat)

