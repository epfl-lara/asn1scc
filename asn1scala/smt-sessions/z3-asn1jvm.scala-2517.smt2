; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63562 () Bool)

(assert start!63562)

(declare-fun res!235214 () Bool)

(declare-fun e!202860 () Bool)

(assert (=> start!63562 (=> (not res!235214) (not e!202860))))

(declare-datatypes ((array!16562 0))(
  ( (array!16563 (arr!8147 (Array (_ BitVec 32) (_ BitVec 8))) (size!7151 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12672 0))(
  ( (BitStream!12673 (buf!7397 array!16562) (currentByte!13702 (_ BitVec 32)) (currentBit!13697 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12672)

(assert (=> start!63562 (= res!235214 (and (bvsle ((_ sign_extend 32) (size!7151 (buf!7397 thiss!1929))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13702 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13697 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!7151 (buf!7397 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!13702 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!13697 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!63562 e!202860))

(declare-fun e!202858 () Bool)

(declare-fun inv!12 (BitStream!12672) Bool)

(assert (=> start!63562 (and (inv!12 thiss!1929) e!202858)))

(declare-fun b!283882 () Bool)

(declare-fun res!235213 () Bool)

(assert (=> b!283882 (=> (not res!235213) (not e!202860))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283882 (= res!235213 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13697 thiss!1929))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13702 thiss!1929))) ((_ extract 31 0) ((_ sign_extend 32) (size!7151 (buf!7397 thiss!1929))))))))

(declare-fun b!283883 () Bool)

(assert (=> b!283883 (= e!202860 (bvslt ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13697 thiss!1929)) #b00000000000000000000000000000111)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!283884 () Bool)

(declare-fun array_inv!6844 (array!16562) Bool)

(assert (=> b!283884 (= e!202858 (array_inv!6844 (buf!7397 thiss!1929)))))

(assert (= (and start!63562 res!235214) b!283882))

(assert (= (and b!283882 res!235213) b!283883))

(assert (= start!63562 b!283884))

(declare-fun m!417003 () Bool)

(assert (=> start!63562 m!417003))

(declare-fun m!417005 () Bool)

(assert (=> b!283882 m!417005))

(declare-fun m!417007 () Bool)

(assert (=> b!283884 m!417007))

(check-sat (not b!283884) (not b!283882) (not start!63562))
(check-sat)
