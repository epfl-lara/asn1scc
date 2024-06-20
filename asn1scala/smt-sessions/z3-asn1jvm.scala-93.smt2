; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2200 () Bool)

(assert start!2200)

(declare-fun res!10288 () Bool)

(declare-fun e!6272 () Bool)

(assert (=> start!2200 (=> (not res!10288) (not e!6272))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((array!605 0))(
  ( (array!606 (arr!677 (Array (_ BitVec 32) (_ BitVec 8))) (size!260 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!605)

(assert (=> start!2200 (= res!10288 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!260 srcBuffer!6))))))))

(assert (=> start!2200 e!6272))

(assert (=> start!2200 true))

(declare-fun array_inv!252 (array!605) Bool)

(assert (=> start!2200 (array_inv!252 srcBuffer!6)))

(declare-datatypes ((BitStream!486 0))(
  ( (BitStream!487 (buf!602 array!605) (currentByte!1659 (_ BitVec 32)) (currentBit!1654 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!486)

(declare-fun e!6273 () Bool)

(declare-fun inv!12 (BitStream!486) Bool)

(assert (=> start!2200 (and (inv!12 thiss!1486) e!6273)))

(declare-fun b!10279 () Bool)

(declare-fun res!10287 () Bool)

(assert (=> b!10279 (=> (not res!10287) (not e!6272))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10279 (= res!10287 (validate_offset_bits!1 ((_ sign_extend 32) (size!260 (buf!602 thiss!1486))) ((_ sign_extend 32) (currentByte!1659 thiss!1486)) ((_ sign_extend 32) (currentBit!1654 thiss!1486)) nBits!460))))

(declare-fun b!10280 () Bool)

(assert (=> b!10280 (= e!6272 (and (= (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!10281 () Bool)

(assert (=> b!10281 (= e!6273 (array_inv!252 (buf!602 thiss!1486)))))

(assert (= (and start!2200 res!10288) b!10279))

(assert (= (and b!10279 res!10287) b!10280))

(assert (= start!2200 b!10281))

(declare-fun m!15013 () Bool)

(assert (=> start!2200 m!15013))

(declare-fun m!15015 () Bool)

(assert (=> start!2200 m!15015))

(declare-fun m!15017 () Bool)

(assert (=> b!10279 m!15017))

(declare-fun m!15019 () Bool)

(assert (=> b!10281 m!15019))

(check-sat (not b!10279) (not start!2200) (not b!10281))
(check-sat)
