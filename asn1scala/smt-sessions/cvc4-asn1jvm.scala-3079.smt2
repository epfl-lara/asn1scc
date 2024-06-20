; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70956 () Bool)

(assert start!70956)

(declare-fun nBits!545 () (_ BitVec 32))

(declare-datatypes ((array!20227 0))(
  ( (array!20228 (arr!9909 (Array (_ BitVec 32) (_ BitVec 8))) (size!8817 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13796 0))(
  ( (BitStream!13797 (buf!7959 array!20227) (currentByte!14687 (_ BitVec 32)) (currentBit!14682 (_ BitVec 32))) )
))
(declare-fun thiss!1788 () BitStream!13796)

(assert (=> start!70956 (and (bvsge nBits!545 #b00000000000000000000000000000000) (bvsle nBits!545 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!8817 (buf!7959 thiss!1788))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14687 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14682 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!70956 true))

(declare-fun e!230852 () Bool)

(declare-fun inv!12 (BitStream!13796) Bool)

(assert (=> start!70956 (and (inv!12 thiss!1788) e!230852)))

(declare-fun b!320707 () Bool)

(declare-fun array_inv!8369 (array!20227) Bool)

(assert (=> b!320707 (= e!230852 (array_inv!8369 (buf!7959 thiss!1788)))))

(assert (= start!70956 b!320707))

(declare-fun m!459069 () Bool)

(assert (=> start!70956 m!459069))

(declare-fun m!459071 () Bool)

(assert (=> b!320707 m!459071))

(push 1)

(assert (not b!320707))

(assert (not start!70956))

(check-sat)

(pop 1)

(push 1)

(check-sat)

