; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!658 () Bool)

(assert start!658)

(declare-fun b!1948 () Bool)

(declare-fun res!3749 () Bool)

(declare-fun e!1364 () Bool)

(assert (=> b!1948 (=> (not res!3749) (not e!1364))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> b!1948 (= res!3749 (and (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvadd from!367 nBits!460))) (bvslt from!367 #b0111111111111111111111111111111111111111111111111111111111111111)))))

(declare-fun b!1947 () Bool)

(declare-fun res!3750 () Bool)

(assert (=> b!1947 (=> (not res!3750) (not e!1364))))

(declare-datatypes ((array!182 0))(
  ( (array!183 (arr!458 (Array (_ BitVec 32) (_ BitVec 8))) (size!71 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!120 0))(
  ( (BitStream!121 (buf!380 array!182) (currentByte!1329 (_ BitVec 32)) (currentBit!1324 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!120)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1947 (= res!3750 (validate_offset_bits!1 ((_ sign_extend 32) (size!71 (buf!380 thiss!1486))) ((_ sign_extend 32) (currentByte!1329 thiss!1486)) ((_ sign_extend 32) (currentBit!1324 thiss!1486)) nBits!460))))

(declare-fun res!3751 () Bool)

(assert (=> start!658 (=> (not res!3751) (not e!1364))))

(declare-fun srcBuffer!6 () array!182)

(assert (=> start!658 (= res!3751 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!71 srcBuffer!6))))))))

(assert (=> start!658 e!1364))

(assert (=> start!658 true))

(declare-fun array_inv!66 (array!182) Bool)

(assert (=> start!658 (array_inv!66 srcBuffer!6)))

(declare-fun e!1363 () Bool)

(declare-fun inv!12 (BitStream!120) Bool)

(assert (=> start!658 (and (inv!12 thiss!1486) e!1363)))

(declare-fun b!1950 () Bool)

(assert (=> b!1950 (= e!1363 (array_inv!66 (buf!380 thiss!1486)))))

(declare-fun b!1949 () Bool)

(assert (=> b!1949 (= e!1364 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!71 (buf!380 thiss!1486))) ((_ sign_extend 32) (currentByte!1329 thiss!1486)) ((_ sign_extend 32) (currentBit!1324 thiss!1486)) (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (= (and start!658 res!3751) b!1947))

(assert (= (and b!1947 res!3750) b!1948))

(assert (= (and b!1948 res!3749) b!1949))

(assert (= start!658 b!1950))

(declare-fun m!1387 () Bool)

(assert (=> b!1947 m!1387))

(declare-fun m!1389 () Bool)

(assert (=> start!658 m!1389))

(declare-fun m!1391 () Bool)

(assert (=> start!658 m!1391))

(declare-fun m!1393 () Bool)

(assert (=> b!1950 m!1393))

(declare-fun m!1395 () Bool)

(assert (=> b!1949 m!1395))

(check-sat (not b!1950) (not b!1947) (not start!658) (not b!1949))
