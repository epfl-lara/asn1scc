; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56210 () Bool)

(assert start!56210)

(declare-datatypes ((array!14301 0))(
  ( (array!14302 (arr!7243 (Array (_ BitVec 32) (_ BitVec 8))) (size!6256 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11434 0))(
  ( (BitStream!11435 (buf!6778 array!14301) (currentByte!12471 (_ BitVec 32)) (currentBit!12466 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11434)

(assert (=> start!56210 (or (bvsgt ((_ sign_extend 32) (size!6256 (buf!6778 thiss!914))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!12471 thiss!914)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!12466 thiss!914)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!180951 () Bool)

(declare-fun inv!12 (BitStream!11434) Bool)

(assert (=> start!56210 (and (inv!12 thiss!914) e!180951)))

(declare-fun b!260497 () Bool)

(declare-fun array_inv!5997 (array!14301) Bool)

(assert (=> b!260497 (= e!180951 (array_inv!5997 (buf!6778 thiss!914)))))

(assert (= start!56210 b!260497))

(declare-fun m!389799 () Bool)

(assert (=> start!56210 m!389799))

(declare-fun m!389801 () Bool)

(assert (=> b!260497 m!389801))

(push 1)

(assert (not b!260497))

(assert (not start!56210))

(check-sat)

(pop 1)

(push 1)

(check-sat)

