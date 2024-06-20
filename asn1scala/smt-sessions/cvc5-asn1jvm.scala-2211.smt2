; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56096 () Bool)

(assert start!56096)

(declare-fun res!217978 () Bool)

(declare-fun e!180741 () Bool)

(assert (=> start!56096 (=> (not res!217978) (not e!180741))))

(declare-datatypes ((array!14255 0))(
  ( (array!14256 (arr!7225 (Array (_ BitVec 32) (_ BitVec 8))) (size!6238 (_ BitVec 32))) )
))
(declare-fun buf!79 () array!14255)

(declare-datatypes ((BitStream!11398 0))(
  ( (BitStream!11399 (buf!6760 array!14255) (currentByte!12435 (_ BitVec 32)) (currentBit!12430 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11398)

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56096 (= res!217978 (and (= (size!6238 (buf!6760 b1!100)) (size!6238 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!6238 (buf!6760 b1!100))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12435 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12430 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!6238 (buf!6760 b1!100))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!12435 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!12430 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!56096 e!180741))

(declare-fun e!180740 () Bool)

(declare-fun inv!12 (BitStream!11398) Bool)

(assert (=> start!56096 (and (inv!12 b1!100) e!180740)))

(declare-fun array_inv!5979 (array!14255) Bool)

(assert (=> start!56096 (array_inv!5979 buf!79)))

(assert (=> start!56096 true))

(declare-fun b!260337 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260337 (= e!180741 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12430 b1!100))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12435 b1!100))) ((_ extract 31 0) ((_ sign_extend 32) (size!6238 (buf!6760 b1!100)))))))))

(declare-fun b!260338 () Bool)

(assert (=> b!260338 (= e!180740 (array_inv!5979 (buf!6760 b1!100)))))

(assert (= (and start!56096 res!217978) b!260337))

(assert (= start!56096 b!260338))

(declare-fun m!389595 () Bool)

(assert (=> start!56096 m!389595))

(declare-fun m!389597 () Bool)

(assert (=> start!56096 m!389597))

(declare-fun m!389599 () Bool)

(assert (=> b!260337 m!389599))

(declare-fun m!389601 () Bool)

(assert (=> b!260338 m!389601))

(push 1)

(assert (not b!260338))

(assert (not start!56096))

(assert (not b!260337))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87338 () Bool)

