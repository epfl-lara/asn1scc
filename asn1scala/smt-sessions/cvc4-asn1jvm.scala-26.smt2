; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!642 () Bool)

(assert start!642)

(declare-fun res!3697 () Bool)

(declare-fun e!1265 () Bool)

(assert (=> start!642 (=> (not res!3697) (not e!1265))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!166 0))(
  ( (array!167 (arr!450 (Array (_ BitVec 32) (_ BitVec 8))) (size!63 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!166)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!642 (= res!3697 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!63 srcBuffer!6))))))))

(assert (=> start!642 e!1265))

(assert (=> start!642 true))

(declare-fun array_inv!58 (array!166) Bool)

(assert (=> start!642 (array_inv!58 srcBuffer!6)))

(declare-datatypes ((BitStream!104 0))(
  ( (BitStream!105 (buf!372 array!166) (currentByte!1321 (_ BitVec 32)) (currentBit!1316 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!104)

(declare-fun e!1267 () Bool)

(declare-fun inv!12 (BitStream!104) Bool)

(assert (=> start!642 (and (inv!12 thiss!1486) e!1267)))

(declare-fun b!1870 () Bool)

(declare-fun res!3696 () Bool)

(assert (=> b!1870 (=> (not res!3696) (not e!1265))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1870 (= res!3696 (validate_offset_bits!1 ((_ sign_extend 32) (size!63 (buf!372 thiss!1486))) ((_ sign_extend 32) (currentByte!1321 thiss!1486)) ((_ sign_extend 32) (currentBit!1316 thiss!1486)) nBits!460))))

(declare-fun b!1871 () Bool)

(assert (=> b!1871 (= e!1265 (bvslt (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1872 () Bool)

(assert (=> b!1872 (= e!1267 (array_inv!58 (buf!372 thiss!1486)))))

(assert (= (and start!642 res!3697) b!1870))

(assert (= (and b!1870 res!3696) b!1871))

(assert (= start!642 b!1872))

(declare-fun m!1321 () Bool)

(assert (=> start!642 m!1321))

(declare-fun m!1323 () Bool)

(assert (=> start!642 m!1323))

(declare-fun m!1325 () Bool)

(assert (=> b!1870 m!1325))

(declare-fun m!1327 () Bool)

(assert (=> b!1872 m!1327))

(push 1)

(assert (not b!1870))

(assert (not b!1872))

(assert (not start!642))

(check-sat)

(pop 1)

(push 1)

(check-sat)

