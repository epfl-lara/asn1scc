; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73110 () Bool)

(assert start!73110)

(declare-fun res!266854 () Bool)

(declare-fun e!234391 () Bool)

(assert (=> start!73110 (=> (not res!266854) (not e!234391))))

(declare-datatypes ((array!20970 0))(
  ( (array!20971 (arr!10200 (Array (_ BitVec 32) (_ BitVec 8))) (size!9108 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14378 0))(
  ( (BitStream!14379 (buf!8250 array!20970) (currentByte!15291 (_ BitVec 32)) (currentBit!15286 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14378)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73110 (= res!266854 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9108 (buf!8250 thiss!877))) ((_ sign_extend 32) (currentByte!15291 thiss!877)) ((_ sign_extend 32) (currentBit!15286 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73110 e!234391))

(declare-fun e!234392 () Bool)

(declare-fun inv!12 (BitStream!14378) Bool)

(assert (=> start!73110 (and (inv!12 thiss!877) e!234392)))

(declare-fun b!325158 () Bool)

(assert (=> b!325158 (= e!234391 false)))

(declare-fun b!325159 () Bool)

(declare-fun array_inv!8660 (array!20970) Bool)

(assert (=> b!325159 (= e!234392 (array_inv!8660 (buf!8250 thiss!877)))))

(assert (= (and start!73110 res!266854) b!325158))

(assert (= start!73110 b!325159))

(declare-fun m!463153 () Bool)

(assert (=> start!73110 m!463153))

(declare-fun m!463155 () Bool)

(assert (=> start!73110 m!463155))

(declare-fun m!463157 () Bool)

(assert (=> b!325159 m!463157))

(push 1)

(assert (not start!73110))

(assert (not b!325159))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

