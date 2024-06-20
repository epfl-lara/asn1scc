; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56212 () Bool)

(assert start!56212)

(declare-datatypes ((array!14303 0))(
  ( (array!14304 (arr!7244 (Array (_ BitVec 32) (_ BitVec 8))) (size!6257 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11436 0))(
  ( (BitStream!11437 (buf!6779 array!14303) (currentByte!12472 (_ BitVec 32)) (currentBit!12467 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11436)

(assert (=> start!56212 (or (bvsgt ((_ sign_extend 32) (size!6257 (buf!6779 thiss!914))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!12472 thiss!914)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!12467 thiss!914)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!180957 () Bool)

(declare-fun inv!12 (BitStream!11436) Bool)

(assert (=> start!56212 (and (inv!12 thiss!914) e!180957)))

(declare-fun b!260500 () Bool)

(declare-fun array_inv!5998 (array!14303) Bool)

(assert (=> b!260500 (= e!180957 (array_inv!5998 (buf!6779 thiss!914)))))

(assert (= start!56212 b!260500))

(declare-fun m!389803 () Bool)

(assert (=> start!56212 m!389803))

(declare-fun m!389805 () Bool)

(assert (=> b!260500 m!389805))

(check-sat (not b!260500) (not start!56212))
(check-sat)
