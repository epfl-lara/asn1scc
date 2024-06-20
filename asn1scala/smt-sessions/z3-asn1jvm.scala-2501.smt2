; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63302 () Bool)

(assert start!63302)

(declare-fun res!235040 () Bool)

(declare-fun e!202465 () Bool)

(assert (=> start!63302 (=> (not res!235040) (not e!202465))))

(declare-datatypes ((array!16458 0))(
  ( (array!16459 (arr!8105 (Array (_ BitVec 32) (_ BitVec 8))) (size!7109 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12588 0))(
  ( (BitStream!12589 (buf!7355 array!16458) (currentByte!13624 (_ BitVec 32)) (currentBit!13619 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12588)

(assert (=> start!63302 (= res!235040 (and (bvsle ((_ sign_extend 32) (size!7109 (buf!7355 thiss!1939))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13624 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13619 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!7109 (buf!7355 thiss!1939))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!13624 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!13619 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!63302 e!202465))

(declare-fun e!202467 () Bool)

(declare-fun inv!12 (BitStream!12588) Bool)

(assert (=> start!63302 (and (inv!12 thiss!1939) e!202467)))

(declare-fun b!283582 () Bool)

(declare-fun res!235039 () Bool)

(assert (=> b!283582 (=> (not res!235039) (not e!202465))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283582 (= res!235039 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13619 thiss!1939))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13624 thiss!1939))) ((_ extract 31 0) ((_ sign_extend 32) (size!7109 (buf!7355 thiss!1939))))))))

(declare-fun b!283583 () Bool)

(assert (=> b!283583 (= e!202465 (bvslt ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13624 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13619 thiss!1939))) #b00000000000000000000000000001111)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!283584 () Bool)

(declare-fun array_inv!6802 (array!16458) Bool)

(assert (=> b!283584 (= e!202467 (array_inv!6802 (buf!7355 thiss!1939)))))

(assert (= (and start!63302 res!235040) b!283582))

(assert (= (and b!283582 res!235039) b!283583))

(assert (= start!63302 b!283584))

(declare-fun m!416611 () Bool)

(assert (=> start!63302 m!416611))

(declare-fun m!416613 () Bool)

(assert (=> b!283582 m!416613))

(declare-fun m!416615 () Bool)

(assert (=> b!283584 m!416615))

(check-sat (not b!283582) (not start!63302) (not b!283584))
(check-sat)
