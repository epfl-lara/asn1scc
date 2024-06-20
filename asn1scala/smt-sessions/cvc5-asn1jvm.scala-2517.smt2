; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63560 () Bool)

(assert start!63560)

(declare-fun res!235207 () Bool)

(declare-fun e!202849 () Bool)

(assert (=> start!63560 (=> (not res!235207) (not e!202849))))

(declare-datatypes ((array!16560 0))(
  ( (array!16561 (arr!8146 (Array (_ BitVec 32) (_ BitVec 8))) (size!7150 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12670 0))(
  ( (BitStream!12671 (buf!7396 array!16560) (currentByte!13701 (_ BitVec 32)) (currentBit!13696 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12670)

(assert (=> start!63560 (= res!235207 (and (bvsle ((_ sign_extend 32) (size!7150 (buf!7396 thiss!1929))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13701 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13696 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!7150 (buf!7396 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!13701 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!13696 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!63560 e!202849))

(declare-fun e!202851 () Bool)

(declare-fun inv!12 (BitStream!12670) Bool)

(assert (=> start!63560 (and (inv!12 thiss!1929) e!202851)))

(declare-fun b!283873 () Bool)

(declare-fun res!235208 () Bool)

(assert (=> b!283873 (=> (not res!235208) (not e!202849))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283873 (= res!235208 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13696 thiss!1929))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13701 thiss!1929))) ((_ extract 31 0) ((_ sign_extend 32) (size!7150 (buf!7396 thiss!1929))))))))

(declare-fun b!283874 () Bool)

(assert (=> b!283874 (= e!202849 (bvslt ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13696 thiss!1929)) #b00000000000000000000000000000111)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!283875 () Bool)

(declare-fun array_inv!6843 (array!16560) Bool)

(assert (=> b!283875 (= e!202851 (array_inv!6843 (buf!7396 thiss!1929)))))

(assert (= (and start!63560 res!235207) b!283873))

(assert (= (and b!283873 res!235208) b!283874))

(assert (= start!63560 b!283875))

(declare-fun m!416997 () Bool)

(assert (=> start!63560 m!416997))

(declare-fun m!416999 () Bool)

(assert (=> b!283873 m!416999))

(declare-fun m!417001 () Bool)

(assert (=> b!283875 m!417001))

(push 1)

(assert (not b!283875))

(assert (not b!283873))

(assert (not start!63560))

(check-sat)

(pop 1)

(push 1)

(check-sat)

