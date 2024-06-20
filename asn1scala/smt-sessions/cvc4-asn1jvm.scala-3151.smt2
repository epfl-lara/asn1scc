; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72348 () Bool)

(assert start!72348)

(declare-datatypes ((array!20729 0))(
  ( (array!20730 (arr!10113 (Array (_ BitVec 32) (_ BitVec 8))) (size!9021 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14204 0))(
  ( (BitStream!14205 (buf!8163 array!20729) (currentByte!15058 (_ BitVec 32)) (currentBit!15053 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14204)

(assert (=> start!72348 (or (bvsgt ((_ sign_extend 32) (size!9021 (buf!8163 thiss!1702))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!15058 thiss!1702)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!15053 thiss!1702)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!233435 () Bool)

(declare-fun inv!12 (BitStream!14204) Bool)

(assert (=> start!72348 (and (inv!12 thiss!1702) e!233435)))

(declare-fun b!324010 () Bool)

(declare-fun array_inv!8573 (array!20729) Bool)

(assert (=> b!324010 (= e!233435 (array_inv!8573 (buf!8163 thiss!1702)))))

(assert (= start!72348 b!324010))

(declare-fun m!462075 () Bool)

(assert (=> start!72348 m!462075))

(declare-fun m!462077 () Bool)

(assert (=> b!324010 m!462077))

(push 1)

(assert (not start!72348))

(assert (not b!324010))

(check-sat)

(pop 1)

(push 1)

(check-sat)

