; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72832 () Bool)

(assert start!72832)

(declare-fun b!324628 () Bool)

(declare-fun e!234006 () Bool)

(declare-datatypes ((array!20880 0))(
  ( (array!20881 (arr!10167 (Array (_ BitVec 32) (_ BitVec 8))) (size!9075 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14312 0))(
  ( (BitStream!14313 (buf!8217 array!20880) (currentByte!15200 (_ BitVec 32)) (currentBit!15195 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14312)

(declare-fun array_inv!8627 (array!20880) Bool)

(assert (=> b!324628 (= e!234006 (array_inv!8627 (buf!8217 thiss!877)))))

(declare-fun b!324625 () Bool)

(declare-fun res!266422 () Bool)

(declare-fun e!234005 () Bool)

(assert (=> b!324625 (=> (not res!266422) (not e!234005))))

(assert (=> b!324625 (= res!266422 (bvslt (currentBit!15195 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324627 () Bool)

(assert (=> b!324627 (= e!234005 (or (bvsgt ((_ sign_extend 32) (size!9075 (buf!8217 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!15200 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15195 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun res!266421 () Bool)

(assert (=> start!72832 (=> (not res!266421) (not e!234005))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72832 (= res!266421 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9075 (buf!8217 thiss!877))) ((_ sign_extend 32) (currentByte!15200 thiss!877)) ((_ sign_extend 32) (currentBit!15195 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72832 e!234005))

(declare-fun inv!12 (BitStream!14312) Bool)

(assert (=> start!72832 (and (inv!12 thiss!877) e!234006)))

(declare-fun b!324626 () Bool)

(declare-fun res!266420 () Bool)

(assert (=> b!324626 (=> (not res!266420) (not e!234005))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324626 (= res!266420 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9075 (buf!8217 thiss!877)) (currentByte!15200 thiss!877) (currentBit!15195 thiss!877))) (bitIndex!0 (size!9075 (buf!8217 thiss!877)) (currentByte!15200 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15195 thiss!877)))))))

(assert (= (and start!72832 res!266421) b!324625))

(assert (= (and b!324625 res!266422) b!324626))

(assert (= (and b!324626 res!266420) b!324627))

(assert (= start!72832 b!324628))

(declare-fun m!462711 () Bool)

(assert (=> b!324628 m!462711))

(declare-fun m!462713 () Bool)

(assert (=> start!72832 m!462713))

(declare-fun m!462715 () Bool)

(assert (=> start!72832 m!462715))

(declare-fun m!462717 () Bool)

(assert (=> b!324626 m!462717))

(declare-fun m!462719 () Bool)

(assert (=> b!324626 m!462719))

(push 1)

(assert (not start!72832))

(assert (not b!324628))

(assert (not b!324626))

(check-sat)

(pop 1)

(push 1)

(check-sat)

