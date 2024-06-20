; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56080 () Bool)

(assert start!56080)

(declare-datatypes ((array!14247 0))(
  ( (array!14248 (arr!7222 (Array (_ BitVec 32) (_ BitVec 8))) (size!6235 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11392 0))(
  ( (BitStream!11393 (buf!6757 array!14247) (currentByte!12431 (_ BitVec 32)) (currentBit!12426 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11392)

(declare-fun buf!79 () array!14247)

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56080 (and (= (size!6235 (buf!6757 b1!100)) (size!6235 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!6235 (buf!6757 b1!100))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12431 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12426 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!6235 (buf!6757 b1!100))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!12431 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!12426 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!180710 () Bool)

(declare-fun inv!12 (BitStream!11392) Bool)

(assert (=> start!56080 (and (inv!12 b1!100) e!180710)))

(declare-fun array_inv!5976 (array!14247) Bool)

(assert (=> start!56080 (array_inv!5976 buf!79)))

(assert (=> start!56080 true))

(declare-fun b!260326 () Bool)

(assert (=> b!260326 (= e!180710 (array_inv!5976 (buf!6757 b1!100)))))

(assert (= start!56080 b!260326))

(declare-fun m!389573 () Bool)

(assert (=> start!56080 m!389573))

(declare-fun m!389575 () Bool)

(assert (=> start!56080 m!389575))

(declare-fun m!389577 () Bool)

(assert (=> b!260326 m!389577))

(push 1)

(assert (not start!56080))

(assert (not b!260326))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87322 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87322 (= (inv!12 b1!100) (invariant!0 (currentBit!12426 b1!100) (currentByte!12431 b1!100) (size!6235 (buf!6757 b1!100))))))

(declare-fun bs!22120 () Bool)

(assert (= bs!22120 d!87322))

(declare-fun m!389593 () Bool)

(assert (=> bs!22120 m!389593))

(assert (=> start!56080 d!87322))

(declare-fun d!87324 () Bool)

(assert (=> d!87324 (= (array_inv!5976 buf!79) (bvsge (size!6235 buf!79) #b00000000000000000000000000000000))))

(assert (=> start!56080 d!87324))

