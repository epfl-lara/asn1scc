; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!594 () Bool)

(assert start!594)

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!139 0))(
  ( (array!140 (arr!439 (Array (_ BitVec 32) (_ BitVec 8))) (size!52 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!139)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((BitStream!82 0))(
  ( (BitStream!83 (buf!361 array!139) (currentByte!1307 (_ BitVec 32)) (currentBit!1302 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!82)

(assert (=> start!594 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!52 srcBuffer!6)))) (or (bvsgt ((_ sign_extend 32) (size!52 (buf!361 thiss!1486))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1307 thiss!1486)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1302 thiss!1486)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!594 true))

(declare-fun array_inv!47 (array!139) Bool)

(assert (=> start!594 (array_inv!47 srcBuffer!6)))

(declare-fun e!1150 () Bool)

(declare-fun inv!12 (BitStream!82) Bool)

(assert (=> start!594 (and (inv!12 thiss!1486) e!1150)))

(declare-fun b!1812 () Bool)

(assert (=> b!1812 (= e!1150 (array_inv!47 (buf!361 thiss!1486)))))

(assert (= start!594 b!1812))

(declare-fun m!1235 () Bool)

(assert (=> start!594 m!1235))

(declare-fun m!1237 () Bool)

(assert (=> start!594 m!1237))

(declare-fun m!1239 () Bool)

(assert (=> b!1812 m!1239))

(push 1)

(assert (not start!594))

(assert (not b!1812))

(check-sat)

(pop 1)

(push 1)

(check-sat)

