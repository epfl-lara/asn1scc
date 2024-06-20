; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72654 () Bool)

(assert start!72654)

(declare-datatypes ((array!20816 0))(
  ( (array!20817 (arr!10143 (Array (_ BitVec 32) (_ BitVec 8))) (size!9051 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14264 0))(
  ( (BitStream!14265 (buf!8193 array!20816) (currentByte!15145 (_ BitVec 32)) (currentBit!15140 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14264)

(assert (=> start!72654 (or (bvsgt ((_ sign_extend 32) (size!9051 (buf!8193 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!15145 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!15140 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!233774 () Bool)

(declare-fun inv!12 (BitStream!14264) Bool)

(assert (=> start!72654 (and (inv!12 thiss!877) e!233774)))

(declare-fun b!324346 () Bool)

(declare-fun array_inv!8603 (array!20816) Bool)

(assert (=> b!324346 (= e!233774 (array_inv!8603 (buf!8193 thiss!877)))))

(assert (= start!72654 b!324346))

(declare-fun m!462463 () Bool)

(assert (=> start!72654 m!462463))

(declare-fun m!462465 () Bool)

(assert (=> b!324346 m!462465))

(push 1)

(assert (not b!324346))

(assert (not start!72654))

(check-sat)

(pop 1)

(push 1)

(check-sat)

