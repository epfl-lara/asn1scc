; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63254 () Bool)

(assert start!63254)

(declare-datatypes ((array!16435 0))(
  ( (array!16436 (arr!8096 (Array (_ BitVec 32) (_ BitVec 8))) (size!7100 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12570 0))(
  ( (BitStream!12571 (buf!7346 array!16435) (currentByte!13611 (_ BitVec 32)) (currentBit!13606 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12570)

(assert (=> start!63254 (or (bvsgt ((_ sign_extend 32) (size!7100 (buf!7346 thiss!1939))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!13611 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!13606 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!202397 () Bool)

(declare-fun inv!12 (BitStream!12570) Bool)

(assert (=> start!63254 (and (inv!12 thiss!1939) e!202397)))

(declare-fun b!283536 () Bool)

(declare-fun array_inv!6793 (array!16435) Bool)

(assert (=> b!283536 (= e!202397 (array_inv!6793 (buf!7346 thiss!1939)))))

(assert (= start!63254 b!283536))

(declare-fun m!416557 () Bool)

(assert (=> start!63254 m!416557))

(declare-fun m!416559 () Bool)

(assert (=> b!283536 m!416559))

(check-sat (not b!283536) (not start!63254))
(check-sat)
