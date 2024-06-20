; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!646 () Bool)

(assert start!646)

(declare-fun res!3709 () Bool)

(declare-fun e!1290 () Bool)

(assert (=> start!646 (=> (not res!3709) (not e!1290))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!170 0))(
  ( (array!171 (arr!452 (Array (_ BitVec 32) (_ BitVec 8))) (size!65 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!170)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!646 (= res!3709 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!65 srcBuffer!6))))))))

(assert (=> start!646 e!1290))

(assert (=> start!646 true))

(declare-fun array_inv!60 (array!170) Bool)

(assert (=> start!646 (array_inv!60 srcBuffer!6)))

(declare-datatypes ((BitStream!108 0))(
  ( (BitStream!109 (buf!374 array!170) (currentByte!1323 (_ BitVec 32)) (currentBit!1318 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!108)

(declare-fun e!1289 () Bool)

(declare-fun inv!12 (BitStream!108) Bool)

(assert (=> start!646 (and (inv!12 thiss!1486) e!1289)))

(declare-fun b!1888 () Bool)

(declare-fun res!3708 () Bool)

(assert (=> b!1888 (=> (not res!3708) (not e!1290))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1888 (= res!3708 (validate_offset_bits!1 ((_ sign_extend 32) (size!65 (buf!374 thiss!1486))) ((_ sign_extend 32) (currentByte!1323 thiss!1486)) ((_ sign_extend 32) (currentBit!1318 thiss!1486)) nBits!460))))

(declare-fun b!1889 () Bool)

(assert (=> b!1889 (= e!1290 (and (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvadd from!367 nBits!460)))))))

(declare-fun b!1890 () Bool)

(assert (=> b!1890 (= e!1289 (array_inv!60 (buf!374 thiss!1486)))))

(assert (= (and start!646 res!3709) b!1888))

(assert (= (and b!1888 res!3708) b!1889))

(assert (= start!646 b!1890))

(declare-fun m!1337 () Bool)

(assert (=> start!646 m!1337))

(declare-fun m!1339 () Bool)

(assert (=> start!646 m!1339))

(declare-fun m!1341 () Bool)

(assert (=> b!1888 m!1341))

(declare-fun m!1343 () Bool)

(assert (=> b!1890 m!1343))

(check-sat (not b!1888) (not b!1890) (not start!646))
(check-sat)
