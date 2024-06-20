; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!652 () Bool)

(assert start!652)

(declare-fun res!3726 () Bool)

(declare-fun e!1328 () Bool)

(assert (=> start!652 (=> (not res!3726) (not e!1328))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!176 0))(
  ( (array!177 (arr!455 (Array (_ BitVec 32) (_ BitVec 8))) (size!68 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!176)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!652 (= res!3726 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!68 srcBuffer!6))))))))

(assert (=> start!652 e!1328))

(assert (=> start!652 true))

(declare-fun array_inv!63 (array!176) Bool)

(assert (=> start!652 (array_inv!63 srcBuffer!6)))

(declare-datatypes ((BitStream!114 0))(
  ( (BitStream!115 (buf!377 array!176) (currentByte!1326 (_ BitVec 32)) (currentBit!1321 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!114)

(declare-fun e!1325 () Bool)

(declare-fun inv!12 (BitStream!114) Bool)

(assert (=> start!652 (and (inv!12 thiss!1486) e!1325)))

(declare-fun b!1915 () Bool)

(declare-fun res!3727 () Bool)

(assert (=> b!1915 (=> (not res!3727) (not e!1328))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1915 (= res!3727 (validate_offset_bits!1 ((_ sign_extend 32) (size!68 (buf!377 thiss!1486))) ((_ sign_extend 32) (currentByte!1326 thiss!1486)) ((_ sign_extend 32) (currentBit!1321 thiss!1486)) nBits!460))))

(declare-fun b!1916 () Bool)

(assert (=> b!1916 (= e!1328 (and (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvadd from!367 nBits!460))) (bvsge from!367 #b0111111111111111111111111111111111111111111111111111111111111111)))))

(declare-fun b!1917 () Bool)

(assert (=> b!1917 (= e!1325 (array_inv!63 (buf!377 thiss!1486)))))

(assert (= (and start!652 res!3726) b!1915))

(assert (= (and b!1915 res!3727) b!1916))

(assert (= start!652 b!1917))

(declare-fun m!1361 () Bool)

(assert (=> start!652 m!1361))

(declare-fun m!1363 () Bool)

(assert (=> start!652 m!1363))

(declare-fun m!1365 () Bool)

(assert (=> b!1915 m!1365))

(declare-fun m!1367 () Bool)

(assert (=> b!1917 m!1367))

(check-sat (not start!652) (not b!1917) (not b!1915))
(check-sat)
