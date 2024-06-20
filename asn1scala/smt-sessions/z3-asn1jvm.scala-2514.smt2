; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63516 () Bool)

(assert start!63516)

(declare-datatypes ((array!16539 0))(
  ( (array!16540 (arr!8138 (Array (_ BitVec 32) (_ BitVec 8))) (size!7142 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12654 0))(
  ( (BitStream!12655 (buf!7388 array!16539) (currentByte!13689 (_ BitVec 32)) (currentBit!13684 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12654)

(assert (=> start!63516 (or (bvsgt ((_ sign_extend 32) (size!7142 (buf!7388 thiss!1929))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!13689 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!13684 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!202790 () Bool)

(declare-fun inv!12 (BitStream!12654) Bool)

(assert (=> start!63516 (and (inv!12 thiss!1929) e!202790)))

(declare-fun b!283836 () Bool)

(declare-fun array_inv!6835 (array!16539) Bool)

(assert (=> b!283836 (= e!202790 (array_inv!6835 (buf!7388 thiss!1929)))))

(assert (= start!63516 b!283836))

(declare-fun m!416951 () Bool)

(assert (=> start!63516 m!416951))

(declare-fun m!416953 () Bool)

(assert (=> b!283836 m!416953))

(check-sat (not b!283836) (not start!63516))
(check-sat)
