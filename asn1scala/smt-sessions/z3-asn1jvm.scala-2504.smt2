; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63338 () Bool)

(assert start!63338)

(declare-datatypes ((array!16473 0))(
  ( (array!16474 (arr!8111 (Array (_ BitVec 32) (_ BitVec 8))) (size!7115 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12600 0))(
  ( (BitStream!12601 (buf!7361 array!16473) (currentByte!13633 (_ BitVec 32)) (currentBit!13628 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12600)

(assert (=> start!63338 (not (= (bvand (currentByte!13633 thiss!1939) #b00000000000000000000000000000001) (bvsdiv (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13633 thiss!1939) #b00000000000000000000000000000001)) #b00000000000000000000000000001000)))))

(declare-fun e!202514 () Bool)

(declare-fun inv!12 (BitStream!12600) Bool)

(assert (=> start!63338 (and (inv!12 thiss!1939) e!202514)))

(declare-fun b!283617 () Bool)

(declare-fun array_inv!6808 (array!16473) Bool)

(assert (=> b!283617 (= e!202514 (array_inv!6808 (buf!7361 thiss!1939)))))

(assert (= start!63338 b!283617))

(declare-fun m!416663 () Bool)

(assert (=> start!63338 m!416663))

(declare-fun m!416665 () Bool)

(assert (=> b!283617 m!416665))

(check-sat (not start!63338) (not b!283617))
