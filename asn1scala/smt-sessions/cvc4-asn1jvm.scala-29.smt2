; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!660 () Bool)

(assert start!660)

(declare-fun b!1962 () Bool)

(declare-fun e!1373 () Bool)

(declare-datatypes ((array!184 0))(
  ( (array!185 (arr!459 (Array (_ BitVec 32) (_ BitVec 8))) (size!72 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!122 0))(
  ( (BitStream!123 (buf!381 array!184) (currentByte!1330 (_ BitVec 32)) (currentBit!1325 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!122)

(declare-fun array_inv!67 (array!184) Bool)

(assert (=> b!1962 (= e!1373 (array_inv!67 (buf!381 thiss!1486)))))

(declare-fun b!1961 () Bool)

(declare-fun from!367 () (_ BitVec 64))

(declare-fun e!1375 () Bool)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1961 (= e!1375 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!72 (buf!381 thiss!1486))) ((_ sign_extend 32) (currentByte!1330 thiss!1486)) ((_ sign_extend 32) (currentBit!1325 thiss!1486)) (bvsub (bvadd from!367 nBits!460) from!367))))))

(declare-fun b!1960 () Bool)

(declare-fun res!3758 () Bool)

(assert (=> b!1960 (=> (not res!3758) (not e!1375))))

(assert (=> b!1960 (= res!3758 (and (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvadd from!367 nBits!460))) (bvslt from!367 #b0111111111111111111111111111111111111111111111111111111111111111)))))

(declare-fun b!1959 () Bool)

(declare-fun res!3760 () Bool)

(assert (=> b!1959 (=> (not res!3760) (not e!1375))))

(assert (=> b!1959 (= res!3760 (validate_offset_bits!1 ((_ sign_extend 32) (size!72 (buf!381 thiss!1486))) ((_ sign_extend 32) (currentByte!1330 thiss!1486)) ((_ sign_extend 32) (currentBit!1325 thiss!1486)) nBits!460))))

(declare-fun res!3759 () Bool)

(assert (=> start!660 (=> (not res!3759) (not e!1375))))

(declare-fun srcBuffer!6 () array!184)

(assert (=> start!660 (= res!3759 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!72 srcBuffer!6))))))))

(assert (=> start!660 e!1375))

(assert (=> start!660 true))

(assert (=> start!660 (array_inv!67 srcBuffer!6)))

(declare-fun inv!12 (BitStream!122) Bool)

(assert (=> start!660 (and (inv!12 thiss!1486) e!1373)))

(assert (= (and start!660 res!3759) b!1959))

(assert (= (and b!1959 res!3760) b!1960))

(assert (= (and b!1960 res!3758) b!1961))

(assert (= start!660 b!1962))

(declare-fun m!1397 () Bool)

(assert (=> b!1962 m!1397))

(declare-fun m!1399 () Bool)

(assert (=> b!1961 m!1399))

(declare-fun m!1401 () Bool)

(assert (=> b!1959 m!1401))

(declare-fun m!1403 () Bool)

(assert (=> start!660 m!1403))

(declare-fun m!1405 () Bool)

(assert (=> start!660 m!1405))

(push 1)

(assert (not b!1962))

(assert (not start!660))

(assert (not b!1961))

(assert (not b!1959))

(check-sat)

(pop 1)

