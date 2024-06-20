; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72680 () Bool)

(assert start!72680)

(declare-fun res!266221 () Bool)

(declare-fun e!233818 () Bool)

(assert (=> start!72680 (=> (not res!266221) (not e!233818))))

(declare-datatypes ((array!20831 0))(
  ( (array!20832 (arr!10149 (Array (_ BitVec 32) (_ BitVec 8))) (size!9057 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14276 0))(
  ( (BitStream!14277 (buf!8199 array!20831) (currentByte!15152 (_ BitVec 32)) (currentBit!15147 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14276)

(assert (=> start!72680 (= res!266221 (and (bvsle ((_ sign_extend 32) (size!9057 (buf!8199 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15152 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15147 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!9057 (buf!8199 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!15152 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!15147 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!72680 e!233818))

(declare-fun e!233819 () Bool)

(declare-fun inv!12 (BitStream!14276) Bool)

(assert (=> start!72680 (and (inv!12 thiss!877) e!233819)))

(declare-fun b!324372 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324372 (= e!233818 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15147 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15152 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9057 (buf!8199 thiss!877)))))))))

(declare-fun b!324373 () Bool)

(declare-fun array_inv!8609 (array!20831) Bool)

(assert (=> b!324373 (= e!233819 (array_inv!8609 (buf!8199 thiss!877)))))

(assert (= (and start!72680 res!266221) b!324372))

(assert (= start!72680 b!324373))

(declare-fun m!462495 () Bool)

(assert (=> start!72680 m!462495))

(declare-fun m!462497 () Bool)

(assert (=> b!324372 m!462497))

(declare-fun m!462499 () Bool)

(assert (=> b!324373 m!462499))

(push 1)

(assert (not start!72680))

(assert (not b!324372))

(assert (not b!324373))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

