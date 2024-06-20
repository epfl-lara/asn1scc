; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124 () Bool)

(assert start!124)

(declare-datatypes ((array!48 0))(
  ( (array!49 (arr!406 (Array (_ BitVec 32) (_ BitVec 8))) (size!19 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!22 0))(
  ( (BitStream!23 (buf!331 array!48) (currentByte!1223 (_ BitVec 32)) (currentBit!1218 (_ BitVec 32))) )
))
(declare-fun thiss!932 () BitStream!22)

(assert (=> start!124 (or (bvsgt ((_ sign_extend 32) (size!19 (buf!331 thiss!932))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1223 thiss!932)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1218 thiss!932)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!112 () Bool)

(declare-fun inv!12 (BitStream!22) Bool)

(assert (=> start!124 (and (inv!12 thiss!932) e!112)))

(declare-fun b!379 () Bool)

(declare-fun array_inv!16 (array!48) Bool)

(assert (=> b!379 (= e!112 (array_inv!16 (buf!331 thiss!932)))))

(assert (= start!124 b!379))

(declare-fun m!121 () Bool)

(assert (=> start!124 m!121))

(declare-fun m!123 () Bool)

(assert (=> b!379 m!123))

(push 1)

(assert (not start!124))

(assert (not b!379))

(check-sat)

(pop 1)

(push 1)

(check-sat)

