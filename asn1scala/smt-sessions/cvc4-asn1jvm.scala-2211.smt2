; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56100 () Bool)

(assert start!56100)

(declare-fun res!217984 () Bool)

(declare-fun e!180765 () Bool)

(assert (=> start!56100 (=> (not res!217984) (not e!180765))))

(declare-datatypes ((array!14259 0))(
  ( (array!14260 (arr!7227 (Array (_ BitVec 32) (_ BitVec 8))) (size!6240 (_ BitVec 32))) )
))
(declare-fun buf!79 () array!14259)

(declare-datatypes ((BitStream!11402 0))(
  ( (BitStream!11403 (buf!6762 array!14259) (currentByte!12437 (_ BitVec 32)) (currentBit!12432 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11402)

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56100 (= res!217984 (and (= (size!6240 (buf!6762 b1!100)) (size!6240 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!6240 (buf!6762 b1!100))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12437 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12432 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!6240 (buf!6762 b1!100))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!12437 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!12432 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!56100 e!180765))

(declare-fun e!180764 () Bool)

(declare-fun inv!12 (BitStream!11402) Bool)

(assert (=> start!56100 (and (inv!12 b1!100) e!180764)))

(declare-fun array_inv!5981 (array!14259) Bool)

(assert (=> start!56100 (array_inv!5981 buf!79)))

(assert (=> start!56100 true))

(declare-fun b!260349 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260349 (= e!180765 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12432 b1!100))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12437 b1!100))) ((_ extract 31 0) ((_ sign_extend 32) (size!6240 (buf!6762 b1!100)))))))))

(declare-fun b!260350 () Bool)

(assert (=> b!260350 (= e!180764 (array_inv!5981 (buf!6762 b1!100)))))

(assert (= (and start!56100 res!217984) b!260349))

(assert (= start!56100 b!260350))

(declare-fun m!389611 () Bool)

(assert (=> start!56100 m!389611))

(declare-fun m!389613 () Bool)

(assert (=> start!56100 m!389613))

(declare-fun m!389615 () Bool)

(assert (=> b!260349 m!389615))

(declare-fun m!389617 () Bool)

(assert (=> b!260350 m!389617))

(push 1)

(assert (not b!260349))

(assert (not b!260350))

(assert (not start!56100))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

