; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56220 () Bool)

(assert start!56220)

(declare-datatypes ((array!14311 0))(
  ( (array!14312 (arr!7248 (Array (_ BitVec 32) (_ BitVec 8))) (size!6261 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11444 0))(
  ( (BitStream!11445 (buf!6783 array!14311) (currentByte!12476 (_ BitVec 32)) (currentBit!12471 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11444)

(assert (=> start!56220 (and (bvsle ((_ sign_extend 32) (size!6261 (buf!6783 thiss!914))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12476 thiss!914)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12471 thiss!914)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!6261 (buf!6783 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!12476 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!12471 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!180981 () Bool)

(declare-fun inv!12 (BitStream!11444) Bool)

(assert (=> start!56220 (and (inv!12 thiss!914) e!180981)))

(declare-fun b!260512 () Bool)

(declare-fun array_inv!6002 (array!14311) Bool)

(assert (=> b!260512 (= e!180981 (array_inv!6002 (buf!6783 thiss!914)))))

(assert (= start!56220 b!260512))

(declare-fun m!389819 () Bool)

(assert (=> start!56220 m!389819))

(declare-fun m!389821 () Bool)

(assert (=> b!260512 m!389821))

(push 1)

(assert (not start!56220))

(assert (not b!260512))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

