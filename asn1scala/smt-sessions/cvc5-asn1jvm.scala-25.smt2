; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!620 () Bool)

(assert start!620)

(declare-fun res!3673 () Bool)

(declare-fun e!1206 () Bool)

(assert (=> start!620 (=> (not res!3673) (not e!1206))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((array!154 0))(
  ( (array!155 (arr!445 (Array (_ BitVec 32) (_ BitVec 8))) (size!58 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!94 0))(
  ( (BitStream!95 (buf!367 array!154) (currentByte!1314 (_ BitVec 32)) (currentBit!1309 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!94)

(declare-fun srcBuffer!6 () array!154)

(assert (=> start!620 (= res!3673 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!58 srcBuffer!6)))) (bvsle ((_ sign_extend 32) (size!58 (buf!367 thiss!1486))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1314 thiss!1486)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1309 thiss!1486)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!58 (buf!367 thiss!1486))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1314 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1309 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!620 e!1206))

(assert (=> start!620 true))

(declare-fun array_inv!53 (array!154) Bool)

(assert (=> start!620 (array_inv!53 srcBuffer!6)))

(declare-fun e!1205 () Bool)

(declare-fun inv!12 (BitStream!94) Bool)

(assert (=> start!620 (and (inv!12 thiss!1486) e!1205)))

(declare-fun b!1832 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1832 (= e!1206 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1309 thiss!1486))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1314 thiss!1486))) ((_ extract 31 0) ((_ sign_extend 32) (size!58 (buf!367 thiss!1486)))))))))

(declare-fun b!1833 () Bool)

(assert (=> b!1833 (= e!1205 (array_inv!53 (buf!367 thiss!1486)))))

(assert (= (and start!620 res!3673) b!1832))

(assert (= start!620 b!1833))

(declare-fun m!1277 () Bool)

(assert (=> start!620 m!1277))

(declare-fun m!1279 () Bool)

(assert (=> start!620 m!1279))

(declare-fun m!1281 () Bool)

(assert (=> b!1832 m!1281))

(declare-fun m!1283 () Bool)

(assert (=> b!1833 m!1283))

(push 1)

(assert (not b!1833))

(assert (not b!1832))

(assert (not start!620))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(push 1)

(assert (not b!1833))

