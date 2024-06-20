; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56214 () Bool)

(assert start!56214)

(declare-datatypes ((array!14305 0))(
  ( (array!14306 (arr!7245 (Array (_ BitVec 32) (_ BitVec 8))) (size!6258 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11438 0))(
  ( (BitStream!11439 (buf!6780 array!14305) (currentByte!12473 (_ BitVec 32)) (currentBit!12468 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11438)

(assert (=> start!56214 (or (bvsgt ((_ sign_extend 32) (size!6258 (buf!6780 thiss!914))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!12473 thiss!914)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!12468 thiss!914)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!180963 () Bool)

(declare-fun inv!12 (BitStream!11438) Bool)

(assert (=> start!56214 (and (inv!12 thiss!914) e!180963)))

(declare-fun b!260503 () Bool)

(declare-fun array_inv!5999 (array!14305) Bool)

(assert (=> b!260503 (= e!180963 (array_inv!5999 (buf!6780 thiss!914)))))

(assert (= start!56214 b!260503))

(declare-fun m!389807 () Bool)

(assert (=> start!56214 m!389807))

(declare-fun m!389809 () Bool)

(assert (=> b!260503 m!389809))

(push 1)

(assert (not start!56214))

(assert (not b!260503))

(check-sat)

(pop 1)

(push 1)

(check-sat)

