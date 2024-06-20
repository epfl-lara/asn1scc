; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!648 () Bool)

(assert start!648)

(declare-fun res!3714 () Bool)

(declare-fun e!1301 () Bool)

(assert (=> start!648 (=> (not res!3714) (not e!1301))))

(declare-datatypes ((array!172 0))(
  ( (array!173 (arr!453 (Array (_ BitVec 32) (_ BitVec 8))) (size!66 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!172)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun from!367 () (_ BitVec 64))

(assert (=> start!648 (= res!3714 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!66 srcBuffer!6))))))))

(assert (=> start!648 e!1301))

(assert (=> start!648 true))

(declare-fun array_inv!61 (array!172) Bool)

(assert (=> start!648 (array_inv!61 srcBuffer!6)))

(declare-datatypes ((BitStream!110 0))(
  ( (BitStream!111 (buf!375 array!172) (currentByte!1324 (_ BitVec 32)) (currentBit!1319 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!110)

(declare-fun e!1303 () Bool)

(declare-fun inv!12 (BitStream!110) Bool)

(assert (=> start!648 (and (inv!12 thiss!1486) e!1303)))

(declare-fun b!1897 () Bool)

(declare-fun res!3715 () Bool)

(assert (=> b!1897 (=> (not res!3715) (not e!1301))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1897 (= res!3715 (validate_offset_bits!1 ((_ sign_extend 32) (size!66 (buf!375 thiss!1486))) ((_ sign_extend 32) (currentByte!1324 thiss!1486)) ((_ sign_extend 32) (currentBit!1319 thiss!1486)) nBits!460))))

(declare-fun b!1898 () Bool)

(assert (=> b!1898 (= e!1301 (and (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvadd from!367 nBits!460)))))))

(declare-fun b!1899 () Bool)

(assert (=> b!1899 (= e!1303 (array_inv!61 (buf!375 thiss!1486)))))

(assert (= (and start!648 res!3714) b!1897))

(assert (= (and b!1897 res!3715) b!1898))

(assert (= start!648 b!1899))

(declare-fun m!1345 () Bool)

(assert (=> start!648 m!1345))

(declare-fun m!1347 () Bool)

(assert (=> start!648 m!1347))

(declare-fun m!1349 () Bool)

(assert (=> b!1897 m!1349))

(declare-fun m!1351 () Bool)

(assert (=> b!1899 m!1351))

(push 1)

(assert (not b!1897))

(assert (not start!648))

(assert (not b!1899))

(check-sat)

(pop 1)

(push 1)

(check-sat)

