; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2198 () Bool)

(assert start!2198)

(declare-fun res!10281 () Bool)

(declare-fun e!6260 () Bool)

(assert (=> start!2198 (=> (not res!10281) (not e!6260))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!603 0))(
  ( (array!604 (arr!676 (Array (_ BitVec 32) (_ BitVec 8))) (size!259 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!603)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!2198 (= res!10281 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!259 srcBuffer!6))))))))

(assert (=> start!2198 e!6260))

(assert (=> start!2198 true))

(declare-fun array_inv!251 (array!603) Bool)

(assert (=> start!2198 (array_inv!251 srcBuffer!6)))

(declare-datatypes ((BitStream!484 0))(
  ( (BitStream!485 (buf!601 array!603) (currentByte!1658 (_ BitVec 32)) (currentBit!1653 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!484)

(declare-fun e!6261 () Bool)

(declare-fun inv!12 (BitStream!484) Bool)

(assert (=> start!2198 (and (inv!12 thiss!1486) e!6261)))

(declare-fun b!10270 () Bool)

(declare-fun res!10282 () Bool)

(assert (=> b!10270 (=> (not res!10282) (not e!6260))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10270 (= res!10282 (validate_offset_bits!1 ((_ sign_extend 32) (size!259 (buf!601 thiss!1486))) ((_ sign_extend 32) (currentByte!1658 thiss!1486)) ((_ sign_extend 32) (currentBit!1653 thiss!1486)) nBits!460))))

(declare-fun b!10271 () Bool)

(assert (=> b!10271 (= e!6260 (and (= (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!10272 () Bool)

(assert (=> b!10272 (= e!6261 (array_inv!251 (buf!601 thiss!1486)))))

(assert (= (and start!2198 res!10281) b!10270))

(assert (= (and b!10270 res!10282) b!10271))

(assert (= start!2198 b!10272))

(declare-fun m!15005 () Bool)

(assert (=> start!2198 m!15005))

(declare-fun m!15007 () Bool)

(assert (=> start!2198 m!15007))

(declare-fun m!15009 () Bool)

(assert (=> b!10270 m!15009))

(declare-fun m!15011 () Bool)

(assert (=> b!10272 m!15011))

(push 1)

(assert (not b!10272))

(assert (not start!2198))

(assert (not b!10270))

(check-sat)

(pop 1)

(push 1)

(check-sat)

