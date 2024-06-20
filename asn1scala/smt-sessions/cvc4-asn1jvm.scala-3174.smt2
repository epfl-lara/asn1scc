; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72966 () Bool)

(assert start!72966)

(declare-fun b!324845 () Bool)

(declare-fun res!266595 () Bool)

(declare-fun e!234174 () Bool)

(assert (=> b!324845 (=> (not res!266595) (not e!234174))))

(declare-datatypes ((array!20922 0))(
  ( (array!20923 (arr!10182 (Array (_ BitVec 32) (_ BitVec 8))) (size!9090 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14342 0))(
  ( (BitStream!14343 (buf!8232 array!20922) (currentByte!15243 (_ BitVec 32)) (currentBit!15238 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14342)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324845 (= res!266595 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9090 (buf!8232 thiss!877)) (currentByte!15243 thiss!877) (currentBit!15238 thiss!877))) (bitIndex!0 (size!9090 (buf!8232 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15243 thiss!877)) #b00000000000000000000000000000000)))))

(declare-fun b!324847 () Bool)

(declare-fun e!234172 () Bool)

(declare-fun array_inv!8642 (array!20922) Bool)

(assert (=> b!324847 (= e!234172 (array_inv!8642 (buf!8232 thiss!877)))))

(declare-fun b!324844 () Bool)

(declare-fun res!266594 () Bool)

(assert (=> b!324844 (=> (not res!266594) (not e!234174))))

(assert (=> b!324844 (= res!266594 (bvsge (currentBit!15238 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324846 () Bool)

(assert (=> b!324846 (= e!234174 (or (bvsgt ((_ sign_extend 32) (size!9090 (buf!8232 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!15243 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!15238 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun res!266596 () Bool)

(assert (=> start!72966 (=> (not res!266596) (not e!234174))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72966 (= res!266596 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9090 (buf!8232 thiss!877))) ((_ sign_extend 32) (currentByte!15243 thiss!877)) ((_ sign_extend 32) (currentBit!15238 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72966 e!234174))

(declare-fun inv!12 (BitStream!14342) Bool)

(assert (=> start!72966 (and (inv!12 thiss!877) e!234172)))

(assert (= (and start!72966 res!266596) b!324844))

(assert (= (and b!324844 res!266594) b!324845))

(assert (= (and b!324845 res!266595) b!324846))

(assert (= start!72966 b!324847))

(declare-fun m!462897 () Bool)

(assert (=> b!324845 m!462897))

(declare-fun m!462899 () Bool)

(assert (=> b!324845 m!462899))

(declare-fun m!462901 () Bool)

(assert (=> b!324847 m!462901))

(declare-fun m!462903 () Bool)

(assert (=> start!72966 m!462903))

(declare-fun m!462905 () Bool)

(assert (=> start!72966 m!462905))

(push 1)

(assert (not b!324845))

(assert (not b!324847))

(assert (not start!72966))

(check-sat)

(pop 1)

(push 1)

(check-sat)

