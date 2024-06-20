; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56078 () Bool)

(assert start!56078)

(declare-datatypes ((array!14245 0))(
  ( (array!14246 (arr!7221 (Array (_ BitVec 32) (_ BitVec 8))) (size!6234 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11390 0))(
  ( (BitStream!11391 (buf!6756 array!14245) (currentByte!12430 (_ BitVec 32)) (currentBit!12425 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11390)

(declare-fun buf!79 () array!14245)

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56078 (and (= (size!6234 (buf!6756 b1!100)) (size!6234 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvsgt ((_ sign_extend 32) (size!6234 (buf!6756 b1!100))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!12430 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!12425 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun e!180701 () Bool)

(declare-fun inv!12 (BitStream!11390) Bool)

(assert (=> start!56078 (and (inv!12 b1!100) e!180701)))

(declare-fun array_inv!5975 (array!14245) Bool)

(assert (=> start!56078 (array_inv!5975 buf!79)))

(assert (=> start!56078 true))

(declare-fun b!260323 () Bool)

(assert (=> b!260323 (= e!180701 (array_inv!5975 (buf!6756 b1!100)))))

(assert (= start!56078 b!260323))

(declare-fun m!389567 () Bool)

(assert (=> start!56078 m!389567))

(declare-fun m!389569 () Bool)

(assert (=> start!56078 m!389569))

(declare-fun m!389571 () Bool)

(assert (=> b!260323 m!389571))

(push 1)

(assert (not b!260323))

(assert (not start!56078))

(check-sat)

(pop 1)

(push 1)

(check-sat)

