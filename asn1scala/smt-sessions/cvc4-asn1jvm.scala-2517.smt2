; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63564 () Bool)

(assert start!63564)

(declare-fun res!235220 () Bool)

(declare-fun e!202868 () Bool)

(assert (=> start!63564 (=> (not res!235220) (not e!202868))))

(declare-datatypes ((array!16564 0))(
  ( (array!16565 (arr!8148 (Array (_ BitVec 32) (_ BitVec 8))) (size!7152 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12674 0))(
  ( (BitStream!12675 (buf!7398 array!16564) (currentByte!13703 (_ BitVec 32)) (currentBit!13698 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12674)

(assert (=> start!63564 (= res!235220 (and (bvsle ((_ sign_extend 32) (size!7152 (buf!7398 thiss!1929))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13703 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13698 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!7152 (buf!7398 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!13703 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!13698 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!63564 e!202868))

(declare-fun e!202869 () Bool)

(declare-fun inv!12 (BitStream!12674) Bool)

(assert (=> start!63564 (and (inv!12 thiss!1929) e!202869)))

(declare-fun b!283891 () Bool)

(declare-fun res!235219 () Bool)

(assert (=> b!283891 (=> (not res!235219) (not e!202868))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283891 (= res!235219 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13698 thiss!1929))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13703 thiss!1929))) ((_ extract 31 0) ((_ sign_extend 32) (size!7152 (buf!7398 thiss!1929))))))))

(declare-fun b!283892 () Bool)

(assert (=> b!283892 (= e!202868 (bvslt ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13698 thiss!1929)) #b00000000000000000000000000000111)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!283893 () Bool)

(declare-fun array_inv!6845 (array!16564) Bool)

(assert (=> b!283893 (= e!202869 (array_inv!6845 (buf!7398 thiss!1929)))))

(assert (= (and start!63564 res!235220) b!283891))

(assert (= (and b!283891 res!235219) b!283892))

(assert (= start!63564 b!283893))

(declare-fun m!417009 () Bool)

(assert (=> start!63564 m!417009))

(declare-fun m!417011 () Bool)

(assert (=> b!283891 m!417011))

(declare-fun m!417013 () Bool)

(assert (=> b!283893 m!417013))

(push 1)

(assert (not b!283893))

(assert (not b!283891))

(assert (not start!63564))

(check-sat)

(pop 1)

(push 1)

(check-sat)

