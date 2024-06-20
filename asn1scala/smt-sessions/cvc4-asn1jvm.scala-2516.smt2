; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63546 () Bool)

(assert start!63546)

(declare-fun res!235202 () Bool)

(declare-fun e!202840 () Bool)

(assert (=> start!63546 (=> (not res!235202) (not e!202840))))

(declare-datatypes ((array!16556 0))(
  ( (array!16557 (arr!8145 (Array (_ BitVec 32) (_ BitVec 8))) (size!7149 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12668 0))(
  ( (BitStream!12669 (buf!7395 array!16556) (currentByte!13698 (_ BitVec 32)) (currentBit!13693 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12668)

(assert (=> start!63546 (= res!235202 (and (bvsle ((_ sign_extend 32) (size!7149 (buf!7395 thiss!1929))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13698 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13693 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!7149 (buf!7395 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!13698 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!13693 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!63546 e!202840))

(declare-fun e!202841 () Bool)

(declare-fun inv!12 (BitStream!12668) Bool)

(assert (=> start!63546 (and (inv!12 thiss!1929) e!202841)))

(declare-fun b!283865 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283865 (= e!202840 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13693 thiss!1929))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13698 thiss!1929))) ((_ extract 31 0) ((_ sign_extend 32) (size!7149 (buf!7395 thiss!1929)))))))))

(declare-fun b!283866 () Bool)

(declare-fun array_inv!6842 (array!16556) Bool)

(assert (=> b!283866 (= e!202841 (array_inv!6842 (buf!7395 thiss!1929)))))

(assert (= (and start!63546 res!235202) b!283865))

(assert (= start!63546 b!283866))

(declare-fun m!416989 () Bool)

(assert (=> start!63546 m!416989))

(declare-fun m!416991 () Bool)

(assert (=> b!283865 m!416991))

(declare-fun m!416993 () Bool)

(assert (=> b!283866 m!416993))

(push 1)

(assert (not b!283865))

(assert (not start!63546))

(assert (not b!283866))

(check-sat)

(pop 1)

(push 1)

(check-sat)

