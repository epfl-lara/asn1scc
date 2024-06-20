; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2202 () Bool)

(assert start!2202)

(declare-fun res!10293 () Bool)

(declare-fun e!6287 () Bool)

(assert (=> start!2202 (=> (not res!10293) (not e!6287))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!607 0))(
  ( (array!608 (arr!678 (Array (_ BitVec 32) (_ BitVec 8))) (size!261 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!607)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!2202 (= res!10293 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!261 srcBuffer!6))))))))

(assert (=> start!2202 e!6287))

(assert (=> start!2202 true))

(declare-fun array_inv!253 (array!607) Bool)

(assert (=> start!2202 (array_inv!253 srcBuffer!6)))

(declare-datatypes ((BitStream!488 0))(
  ( (BitStream!489 (buf!603 array!607) (currentByte!1660 (_ BitVec 32)) (currentBit!1655 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!488)

(declare-fun e!6284 () Bool)

(declare-fun inv!12 (BitStream!488) Bool)

(assert (=> start!2202 (and (inv!12 thiss!1486) e!6284)))

(declare-fun b!10288 () Bool)

(declare-fun res!10294 () Bool)

(assert (=> b!10288 (=> (not res!10294) (not e!6287))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10288 (= res!10294 (validate_offset_bits!1 ((_ sign_extend 32) (size!261 (buf!603 thiss!1486))) ((_ sign_extend 32) (currentByte!1660 thiss!1486)) ((_ sign_extend 32) (currentBit!1655 thiss!1486)) nBits!460))))

(declare-fun b!10289 () Bool)

(assert (=> b!10289 (= e!6287 (and (= (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!10290 () Bool)

(assert (=> b!10290 (= e!6284 (array_inv!253 (buf!603 thiss!1486)))))

(assert (= (and start!2202 res!10293) b!10288))

(assert (= (and b!10288 res!10294) b!10289))

(assert (= start!2202 b!10290))

(declare-fun m!15021 () Bool)

(assert (=> start!2202 m!15021))

(declare-fun m!15023 () Bool)

(assert (=> start!2202 m!15023))

(declare-fun m!15025 () Bool)

(assert (=> b!10288 m!15025))

(declare-fun m!15027 () Bool)

(assert (=> b!10290 m!15027))

(push 1)

(assert (not b!10288))

(assert (not b!10290))

(assert (not start!2202))

(check-sat)

(pop 1)

(push 1)

(check-sat)

