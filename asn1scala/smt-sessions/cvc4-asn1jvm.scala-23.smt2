; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!598 () Bool)

(assert start!598)

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!143 0))(
  ( (array!144 (arr!441 (Array (_ BitVec 32) (_ BitVec 8))) (size!54 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!143)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((BitStream!86 0))(
  ( (BitStream!87 (buf!363 array!143) (currentByte!1309 (_ BitVec 32)) (currentBit!1304 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!86)

(assert (=> start!598 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!54 srcBuffer!6)))) (or (bvsgt ((_ sign_extend 32) (size!54 (buf!363 thiss!1486))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1309 thiss!1486)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1304 thiss!1486)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!598 true))

(declare-fun array_inv!49 (array!143) Bool)

(assert (=> start!598 (array_inv!49 srcBuffer!6)))

(declare-fun e!1168 () Bool)

(declare-fun inv!12 (BitStream!86) Bool)

(assert (=> start!598 (and (inv!12 thiss!1486) e!1168)))

(declare-fun b!1818 () Bool)

(assert (=> b!1818 (= e!1168 (array_inv!49 (buf!363 thiss!1486)))))

(assert (= start!598 b!1818))

(declare-fun m!1247 () Bool)

(assert (=> start!598 m!1247))

(declare-fun m!1249 () Bool)

(assert (=> start!598 m!1249))

(declare-fun m!1251 () Bool)

(assert (=> b!1818 m!1251))

(push 1)

(assert (not start!598))

(assert (not b!1818))

(check-sat)

(pop 1)

(push 1)

(check-sat)

