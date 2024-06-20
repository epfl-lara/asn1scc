; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72830 () Bool)

(assert start!72830)

(declare-fun b!324614 () Bool)

(declare-fun res!266413 () Bool)

(declare-fun e!233996 () Bool)

(assert (=> b!324614 (=> (not res!266413) (not e!233996))))

(declare-datatypes ((array!20878 0))(
  ( (array!20879 (arr!10166 (Array (_ BitVec 32) (_ BitVec 8))) (size!9074 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14310 0))(
  ( (BitStream!14311 (buf!8216 array!20878) (currentByte!15199 (_ BitVec 32)) (currentBit!15194 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14310)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324614 (= res!266413 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9074 (buf!8216 thiss!877)) (currentByte!15199 thiss!877) (currentBit!15194 thiss!877))) (bitIndex!0 (size!9074 (buf!8216 thiss!877)) (currentByte!15199 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15194 thiss!877)))))))

(declare-fun b!324616 () Bool)

(declare-fun e!233995 () Bool)

(declare-fun array_inv!8626 (array!20878) Bool)

(assert (=> b!324616 (= e!233995 (array_inv!8626 (buf!8216 thiss!877)))))

(declare-fun b!324613 () Bool)

(declare-fun res!266411 () Bool)

(assert (=> b!324613 (=> (not res!266411) (not e!233996))))

(assert (=> b!324613 (= res!266411 (bvslt (currentBit!15194 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324615 () Bool)

(assert (=> b!324615 (= e!233996 (or (bvsgt ((_ sign_extend 32) (size!9074 (buf!8216 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!15199 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15194 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun res!266412 () Bool)

(assert (=> start!72830 (=> (not res!266412) (not e!233996))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72830 (= res!266412 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9074 (buf!8216 thiss!877))) ((_ sign_extend 32) (currentByte!15199 thiss!877)) ((_ sign_extend 32) (currentBit!15194 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72830 e!233996))

(declare-fun inv!12 (BitStream!14310) Bool)

(assert (=> start!72830 (and (inv!12 thiss!877) e!233995)))

(assert (= (and start!72830 res!266412) b!324613))

(assert (= (and b!324613 res!266411) b!324614))

(assert (= (and b!324614 res!266413) b!324615))

(assert (= start!72830 b!324616))

(declare-fun m!462701 () Bool)

(assert (=> b!324614 m!462701))

(declare-fun m!462703 () Bool)

(assert (=> b!324614 m!462703))

(declare-fun m!462705 () Bool)

(assert (=> b!324616 m!462705))

(declare-fun m!462707 () Bool)

(assert (=> start!72830 m!462707))

(declare-fun m!462709 () Bool)

(assert (=> start!72830 m!462709))

(check-sat (not b!324616) (not b!324614) (not start!72830))
(check-sat)
