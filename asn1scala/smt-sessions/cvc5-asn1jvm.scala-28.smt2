; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!650 () Bool)

(assert start!650)

(declare-fun res!3720 () Bool)

(declare-fun e!1315 () Bool)

(assert (=> start!650 (=> (not res!3720) (not e!1315))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!174 0))(
  ( (array!175 (arr!454 (Array (_ BitVec 32) (_ BitVec 8))) (size!67 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!174)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!650 (= res!3720 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!67 srcBuffer!6))))))))

(assert (=> start!650 e!1315))

(assert (=> start!650 true))

(declare-fun array_inv!62 (array!174) Bool)

(assert (=> start!650 (array_inv!62 srcBuffer!6)))

(declare-datatypes ((BitStream!112 0))(
  ( (BitStream!113 (buf!376 array!174) (currentByte!1325 (_ BitVec 32)) (currentBit!1320 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!112)

(declare-fun e!1313 () Bool)

(declare-fun inv!12 (BitStream!112) Bool)

(assert (=> start!650 (and (inv!12 thiss!1486) e!1313)))

(declare-fun b!1906 () Bool)

(declare-fun res!3721 () Bool)

(assert (=> b!1906 (=> (not res!3721) (not e!1315))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1906 (= res!3721 (validate_offset_bits!1 ((_ sign_extend 32) (size!67 (buf!376 thiss!1486))) ((_ sign_extend 32) (currentByte!1325 thiss!1486)) ((_ sign_extend 32) (currentBit!1320 thiss!1486)) nBits!460))))

(declare-fun b!1907 () Bool)

(assert (=> b!1907 (= e!1315 (and (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvadd from!367 nBits!460))) (bvsge from!367 #b0111111111111111111111111111111111111111111111111111111111111111)))))

(declare-fun b!1908 () Bool)

(assert (=> b!1908 (= e!1313 (array_inv!62 (buf!376 thiss!1486)))))

(assert (= (and start!650 res!3720) b!1906))

(assert (= (and b!1906 res!3721) b!1907))

(assert (= start!650 b!1908))

(declare-fun m!1353 () Bool)

(assert (=> start!650 m!1353))

(declare-fun m!1355 () Bool)

(assert (=> start!650 m!1355))

(declare-fun m!1357 () Bool)

(assert (=> b!1906 m!1357))

(declare-fun m!1359 () Bool)

(assert (=> b!1908 m!1359))

(push 1)

(assert (not b!1906))

(assert (not b!1908))

(assert (not start!650))

(check-sat)

(pop 1)

(push 1)

(check-sat)

