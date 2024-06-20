; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72650 () Bool)

(assert start!72650)

(declare-datatypes ((array!20812 0))(
  ( (array!20813 (arr!10141 (Array (_ BitVec 32) (_ BitVec 8))) (size!9049 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14260 0))(
  ( (BitStream!14261 (buf!8191 array!20812) (currentByte!15143 (_ BitVec 32)) (currentBit!15138 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14260)

(assert (=> start!72650 (or (bvsgt ((_ sign_extend 32) (size!9049 (buf!8191 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!15143 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!15138 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!233762 () Bool)

(declare-fun inv!12 (BitStream!14260) Bool)

(assert (=> start!72650 (and (inv!12 thiss!877) e!233762)))

(declare-fun b!324340 () Bool)

(declare-fun array_inv!8601 (array!20812) Bool)

(assert (=> b!324340 (= e!233762 (array_inv!8601 (buf!8191 thiss!877)))))

(assert (= start!72650 b!324340))

(declare-fun m!462455 () Bool)

(assert (=> start!72650 m!462455))

(declare-fun m!462457 () Bool)

(assert (=> b!324340 m!462457))

(push 1)

(assert (not b!324340))

(assert (not start!72650))

(check-sat)

(pop 1)

(push 1)

(check-sat)

