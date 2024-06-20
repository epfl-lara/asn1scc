; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!654 () Bool)

(assert start!654)

(declare-fun res!3732 () Bool)

(declare-fun e!1340 () Bool)

(assert (=> start!654 (=> (not res!3732) (not e!1340))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!178 0))(
  ( (array!179 (arr!456 (Array (_ BitVec 32) (_ BitVec 8))) (size!69 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!178)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!654 (= res!3732 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!69 srcBuffer!6))))))))

(assert (=> start!654 e!1340))

(assert (=> start!654 true))

(declare-fun array_inv!64 (array!178) Bool)

(assert (=> start!654 (array_inv!64 srcBuffer!6)))

(declare-datatypes ((BitStream!116 0))(
  ( (BitStream!117 (buf!378 array!178) (currentByte!1327 (_ BitVec 32)) (currentBit!1322 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!116)

(declare-fun e!1338 () Bool)

(declare-fun inv!12 (BitStream!116) Bool)

(assert (=> start!654 (and (inv!12 thiss!1486) e!1338)))

(declare-fun b!1924 () Bool)

(declare-fun res!3733 () Bool)

(assert (=> b!1924 (=> (not res!3733) (not e!1340))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1924 (= res!3733 (validate_offset_bits!1 ((_ sign_extend 32) (size!69 (buf!378 thiss!1486))) ((_ sign_extend 32) (currentByte!1327 thiss!1486)) ((_ sign_extend 32) (currentBit!1322 thiss!1486)) nBits!460))))

(declare-fun b!1925 () Bool)

(assert (=> b!1925 (= e!1340 (and (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvadd from!367 nBits!460))) (bvsge from!367 #b0111111111111111111111111111111111111111111111111111111111111111)))))

(declare-fun b!1926 () Bool)

(assert (=> b!1926 (= e!1338 (array_inv!64 (buf!378 thiss!1486)))))

(assert (= (and start!654 res!3732) b!1924))

(assert (= (and b!1924 res!3733) b!1925))

(assert (= start!654 b!1926))

(declare-fun m!1369 () Bool)

(assert (=> start!654 m!1369))

(declare-fun m!1371 () Bool)

(assert (=> start!654 m!1371))

(declare-fun m!1373 () Bool)

(assert (=> b!1924 m!1373))

(declare-fun m!1375 () Bool)

(assert (=> b!1926 m!1375))

(push 1)

(assert (not b!1926))

(assert (not b!1924))

(assert (not start!654))

(check-sat)

(pop 1)

(push 1)

(check-sat)

