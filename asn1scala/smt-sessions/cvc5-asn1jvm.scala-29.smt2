; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!656 () Bool)

(assert start!656)

(declare-fun b!1938 () Bool)

(declare-fun e!1351 () Bool)

(declare-datatypes ((array!180 0))(
  ( (array!181 (arr!457 (Array (_ BitVec 32) (_ BitVec 8))) (size!70 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!118 0))(
  ( (BitStream!119 (buf!379 array!180) (currentByte!1328 (_ BitVec 32)) (currentBit!1323 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!118)

(declare-fun array_inv!65 (array!180) Bool)

(assert (=> b!1938 (= e!1351 (array_inv!65 (buf!379 thiss!1486)))))

(declare-fun res!3741 () Bool)

(declare-fun e!1349 () Bool)

(assert (=> start!656 (=> (not res!3741) (not e!1349))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!180)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!656 (= res!3741 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!70 srcBuffer!6))))))))

(assert (=> start!656 e!1349))

(assert (=> start!656 true))

(assert (=> start!656 (array_inv!65 srcBuffer!6)))

(declare-fun inv!12 (BitStream!118) Bool)

(assert (=> start!656 (and (inv!12 thiss!1486) e!1351)))

(declare-fun b!1935 () Bool)

(declare-fun res!3740 () Bool)

(assert (=> b!1935 (=> (not res!3740) (not e!1349))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1935 (= res!3740 (validate_offset_bits!1 ((_ sign_extend 32) (size!70 (buf!379 thiss!1486))) ((_ sign_extend 32) (currentByte!1328 thiss!1486)) ((_ sign_extend 32) (currentBit!1323 thiss!1486)) nBits!460))))

(declare-fun b!1937 () Bool)

(assert (=> b!1937 (= e!1349 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!70 (buf!379 thiss!1486))) ((_ sign_extend 32) (currentByte!1328 thiss!1486)) ((_ sign_extend 32) (currentBit!1323 thiss!1486)) (bvsub (bvadd from!367 nBits!460) from!367))))))

(declare-fun b!1936 () Bool)

(declare-fun res!3742 () Bool)

(assert (=> b!1936 (=> (not res!3742) (not e!1349))))

(assert (=> b!1936 (= res!3742 (and (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvadd from!367 nBits!460))) (bvslt from!367 #b0111111111111111111111111111111111111111111111111111111111111111)))))

(assert (= (and start!656 res!3741) b!1935))

(assert (= (and b!1935 res!3740) b!1936))

(assert (= (and b!1936 res!3742) b!1937))

(assert (= start!656 b!1938))

(declare-fun m!1377 () Bool)

(assert (=> b!1938 m!1377))

(declare-fun m!1379 () Bool)

(assert (=> start!656 m!1379))

(declare-fun m!1381 () Bool)

(assert (=> start!656 m!1381))

(declare-fun m!1383 () Bool)

(assert (=> b!1935 m!1383))

(declare-fun m!1385 () Bool)

(assert (=> b!1937 m!1385))

(push 1)

(assert (not b!1935))

(assert (not start!656))

(assert (not b!1937))

(assert (not b!1938))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

