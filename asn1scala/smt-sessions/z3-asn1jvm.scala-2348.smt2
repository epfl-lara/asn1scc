; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59890 () Bool)

(assert start!59890)

(declare-fun lt!411065 () Bool)

(declare-datatypes ((array!15298 0))(
  ( (array!15299 (arr!7637 (Array (_ BitVec 32) (_ BitVec 8))) (size!6650 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12114 0))(
  ( (BitStream!12115 (buf!7118 array!15298) (currentByte!13131 (_ BitVec 32)) (currentBit!13126 (_ BitVec 32))) )
))
(declare-fun thiss!890 () BitStream!12114)

(declare-fun diffInBits!18 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12114 (_ BitVec 64)) Bool)

(assert (=> start!59890 (= lt!411065 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(assert (=> start!59890 false))

(declare-fun e!193101 () Bool)

(declare-fun inv!12 (BitStream!12114) Bool)

(assert (=> start!59890 (and (inv!12 thiss!890) e!193101)))

(assert (=> start!59890 true))

(declare-fun b!273227 () Bool)

(declare-fun array_inv!6374 (array!15298) Bool)

(assert (=> b!273227 (= e!193101 (array_inv!6374 (buf!7118 thiss!890)))))

(assert (= start!59890 b!273227))

(declare-fun m!406101 () Bool)

(assert (=> start!59890 m!406101))

(declare-fun m!406103 () Bool)

(assert (=> start!59890 m!406103))

(declare-fun m!406105 () Bool)

(assert (=> b!273227 m!406105))

(check-sat (not b!273227) (not start!59890))
