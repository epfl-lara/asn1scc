; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!644 () Bool)

(assert start!644)

(declare-fun res!3703 () Bool)

(declare-fun e!1277 () Bool)

(assert (=> start!644 (=> (not res!3703) (not e!1277))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!168 0))(
  ( (array!169 (arr!451 (Array (_ BitVec 32) (_ BitVec 8))) (size!64 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!168)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!644 (= res!3703 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!64 srcBuffer!6))))))))

(assert (=> start!644 e!1277))

(assert (=> start!644 true))

(declare-fun array_inv!59 (array!168) Bool)

(assert (=> start!644 (array_inv!59 srcBuffer!6)))

(declare-datatypes ((BitStream!106 0))(
  ( (BitStream!107 (buf!373 array!168) (currentByte!1322 (_ BitVec 32)) (currentBit!1317 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!106)

(declare-fun e!1279 () Bool)

(declare-fun inv!12 (BitStream!106) Bool)

(assert (=> start!644 (and (inv!12 thiss!1486) e!1279)))

(declare-fun b!1879 () Bool)

(declare-fun res!3702 () Bool)

(assert (=> b!1879 (=> (not res!3702) (not e!1277))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1879 (= res!3702 (validate_offset_bits!1 ((_ sign_extend 32) (size!64 (buf!373 thiss!1486))) ((_ sign_extend 32) (currentByte!1322 thiss!1486)) ((_ sign_extend 32) (currentBit!1317 thiss!1486)) nBits!460))))

(declare-fun b!1880 () Bool)

(assert (=> b!1880 (= e!1277 (and (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvadd from!367 nBits!460)))))))

(declare-fun b!1881 () Bool)

(assert (=> b!1881 (= e!1279 (array_inv!59 (buf!373 thiss!1486)))))

(assert (= (and start!644 res!3703) b!1879))

(assert (= (and b!1879 res!3702) b!1880))

(assert (= start!644 b!1881))

(declare-fun m!1329 () Bool)

(assert (=> start!644 m!1329))

(declare-fun m!1331 () Bool)

(assert (=> start!644 m!1331))

(declare-fun m!1333 () Bool)

(assert (=> b!1879 m!1333))

(declare-fun m!1335 () Bool)

(assert (=> b!1881 m!1335))

(push 1)

(assert (not start!644))

(assert (not b!1881))

(assert (not b!1879))

(check-sat)

(pop 1)

(push 1)

(check-sat)

