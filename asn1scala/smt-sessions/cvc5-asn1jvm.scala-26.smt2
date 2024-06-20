; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!638 () Bool)

(assert start!638)

(declare-fun res!3685 () Bool)

(declare-fun e!1242 () Bool)

(assert (=> start!638 (=> (not res!3685) (not e!1242))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!162 0))(
  ( (array!163 (arr!448 (Array (_ BitVec 32) (_ BitVec 8))) (size!61 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!162)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!638 (= res!3685 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!61 srcBuffer!6))))))))

(assert (=> start!638 e!1242))

(assert (=> start!638 true))

(declare-fun array_inv!56 (array!162) Bool)

(assert (=> start!638 (array_inv!56 srcBuffer!6)))

(declare-datatypes ((BitStream!100 0))(
  ( (BitStream!101 (buf!370 array!162) (currentByte!1319 (_ BitVec 32)) (currentBit!1314 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!100)

(declare-fun e!1243 () Bool)

(declare-fun inv!12 (BitStream!100) Bool)

(assert (=> start!638 (and (inv!12 thiss!1486) e!1243)))

(declare-fun b!1852 () Bool)

(declare-fun res!3684 () Bool)

(assert (=> b!1852 (=> (not res!3684) (not e!1242))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1852 (= res!3684 (validate_offset_bits!1 ((_ sign_extend 32) (size!61 (buf!370 thiss!1486))) ((_ sign_extend 32) (currentByte!1319 thiss!1486)) ((_ sign_extend 32) (currentBit!1314 thiss!1486)) nBits!460))))

(declare-fun b!1853 () Bool)

(assert (=> b!1853 (= e!1242 (bvslt (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1854 () Bool)

(assert (=> b!1854 (= e!1243 (array_inv!56 (buf!370 thiss!1486)))))

(assert (= (and start!638 res!3685) b!1852))

(assert (= (and b!1852 res!3684) b!1853))

(assert (= start!638 b!1854))

(declare-fun m!1305 () Bool)

(assert (=> start!638 m!1305))

(declare-fun m!1307 () Bool)

(assert (=> start!638 m!1307))

(declare-fun m!1309 () Bool)

(assert (=> b!1852 m!1309))

(declare-fun m!1311 () Bool)

(assert (=> b!1854 m!1311))

(push 1)

(assert (not b!1852))

(assert (not start!638))

(assert (not b!1854))

(check-sat)

(pop 1)

(push 1)

(check-sat)

