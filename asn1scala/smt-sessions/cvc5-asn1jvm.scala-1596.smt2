; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45358 () Bool)

(assert start!45358)

(declare-fun res!185353 () Bool)

(declare-fun e!149406 () Bool)

(assert (=> start!45358 (=> (not res!185353) (not e!149406))))

(declare-datatypes ((array!10699 0))(
  ( (array!10700 (arr!5629 (Array (_ BitVec 32) (_ BitVec 8))) (size!4699 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8506 0))(
  ( (BitStream!8507 (buf!5246 array!10699) (currentByte!9849 (_ BitVec 32)) (currentBit!9844 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8506)

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun i!541 () (_ BitVec 32))

(assert (=> start!45358 (= res!185353 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4699 (buf!5246 bs!62))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9849 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9844 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4699 (buf!5246 bs!62))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!9849 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!9844 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!45358 e!149406))

(assert (=> start!45358 true))

(declare-fun e!149405 () Bool)

(declare-fun inv!12 (BitStream!8506) Bool)

(assert (=> start!45358 (and (inv!12 bs!62) e!149405)))

(declare-fun b!220009 () Bool)

(declare-fun res!185354 () Bool)

(assert (=> b!220009 (=> (not res!185354) (not e!149406))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!220009 (= res!185354 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9844 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9849 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (size!4699 (buf!5246 bs!62))))))))

(declare-fun b!220010 () Bool)

(assert (=> b!220010 (= e!149406 (bvslt ((_ sign_extend 32) (bvsub nBits!265 i!541)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220011 () Bool)

(declare-fun array_inv!4440 (array!10699) Bool)

(assert (=> b!220011 (= e!149405 (array_inv!4440 (buf!5246 bs!62)))))

(assert (= (and start!45358 res!185353) b!220009))

(assert (= (and b!220009 res!185354) b!220010))

(assert (= start!45358 b!220011))

(declare-fun m!338755 () Bool)

(assert (=> start!45358 m!338755))

(declare-fun m!338757 () Bool)

(assert (=> b!220009 m!338757))

(declare-fun m!338759 () Bool)

(assert (=> b!220011 m!338759))

(push 1)

(assert (not start!45358))

(assert (not b!220009))

(assert (not b!220011))

(check-sat)

(pop 1)

(push 1)

(check-sat)

