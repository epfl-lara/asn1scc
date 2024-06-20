; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72676 () Bool)

(assert start!72676)

(declare-fun res!266215 () Bool)

(declare-fun e!233800 () Bool)

(assert (=> start!72676 (=> (not res!266215) (not e!233800))))

(declare-datatypes ((array!20827 0))(
  ( (array!20828 (arr!10147 (Array (_ BitVec 32) (_ BitVec 8))) (size!9055 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14272 0))(
  ( (BitStream!14273 (buf!8197 array!20827) (currentByte!15150 (_ BitVec 32)) (currentBit!15145 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14272)

(assert (=> start!72676 (= res!266215 (and (bvsle ((_ sign_extend 32) (size!9055 (buf!8197 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15150 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15145 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!9055 (buf!8197 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!15150 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!15145 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!72676 e!233800))

(declare-fun e!233801 () Bool)

(declare-fun inv!12 (BitStream!14272) Bool)

(assert (=> start!72676 (and (inv!12 thiss!877) e!233801)))

(declare-fun b!324360 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324360 (= e!233800 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15145 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15150 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9055 (buf!8197 thiss!877)))))))))

(declare-fun b!324361 () Bool)

(declare-fun array_inv!8607 (array!20827) Bool)

(assert (=> b!324361 (= e!233801 (array_inv!8607 (buf!8197 thiss!877)))))

(assert (= (and start!72676 res!266215) b!324360))

(assert (= start!72676 b!324361))

(declare-fun m!462483 () Bool)

(assert (=> start!72676 m!462483))

(declare-fun m!462485 () Bool)

(assert (=> b!324360 m!462485))

(declare-fun m!462487 () Bool)

(assert (=> b!324361 m!462487))

(push 1)

(assert (not start!72676))

(assert (not b!324360))

(assert (not b!324361))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

