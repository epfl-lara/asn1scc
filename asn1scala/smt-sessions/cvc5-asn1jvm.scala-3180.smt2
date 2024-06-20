; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73106 () Bool)

(assert start!73106)

(declare-fun res!266848 () Bool)

(declare-fun e!234373 () Bool)

(assert (=> start!73106 (=> (not res!266848) (not e!234373))))

(declare-datatypes ((array!20966 0))(
  ( (array!20967 (arr!10198 (Array (_ BitVec 32) (_ BitVec 8))) (size!9106 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14374 0))(
  ( (BitStream!14375 (buf!8248 array!20966) (currentByte!15289 (_ BitVec 32)) (currentBit!15284 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14374)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73106 (= res!266848 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9106 (buf!8248 thiss!877))) ((_ sign_extend 32) (currentByte!15289 thiss!877)) ((_ sign_extend 32) (currentBit!15284 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73106 e!234373))

(declare-fun e!234374 () Bool)

(declare-fun inv!12 (BitStream!14374) Bool)

(assert (=> start!73106 (and (inv!12 thiss!877) e!234374)))

(declare-fun b!325146 () Bool)

(assert (=> b!325146 (= e!234373 false)))

(declare-fun b!325147 () Bool)

(declare-fun array_inv!8658 (array!20966) Bool)

(assert (=> b!325147 (= e!234374 (array_inv!8658 (buf!8248 thiss!877)))))

(assert (= (and start!73106 res!266848) b!325146))

(assert (= start!73106 b!325147))

(declare-fun m!463141 () Bool)

(assert (=> start!73106 m!463141))

(declare-fun m!463143 () Bool)

(assert (=> start!73106 m!463143))

(declare-fun m!463145 () Bool)

(assert (=> b!325147 m!463145))

(push 1)

(assert (not b!325147))

(assert (not start!73106))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

