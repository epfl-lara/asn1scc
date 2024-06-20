; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!604 () Bool)

(assert start!604)

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!149 0))(
  ( (array!150 (arr!444 (Array (_ BitVec 32) (_ BitVec 8))) (size!57 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!149)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((BitStream!92 0))(
  ( (BitStream!93 (buf!366 array!149) (currentByte!1312 (_ BitVec 32)) (currentBit!1307 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!92)

(assert (=> start!604 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!57 srcBuffer!6)))) (bvsle ((_ sign_extend 32) (size!57 (buf!366 thiss!1486))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1312 thiss!1486)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1307 thiss!1486)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!57 (buf!366 thiss!1486))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1312 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1307 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!604 true))

(declare-fun array_inv!52 (array!149) Bool)

(assert (=> start!604 (array_inv!52 srcBuffer!6)))

(declare-fun e!1195 () Bool)

(declare-fun inv!12 (BitStream!92) Bool)

(assert (=> start!604 (and (inv!12 thiss!1486) e!1195)))

(declare-fun b!1827 () Bool)

(assert (=> b!1827 (= e!1195 (array_inv!52 (buf!366 thiss!1486)))))

(assert (= start!604 b!1827))

(declare-fun m!1265 () Bool)

(assert (=> start!604 m!1265))

(declare-fun m!1267 () Bool)

(assert (=> start!604 m!1267))

(declare-fun m!1269 () Bool)

(assert (=> b!1827 m!1269))

(push 1)

(assert (not start!604))

(assert (not b!1827))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1300 () Bool)

(assert (=> d!1300 (= (array_inv!52 srcBuffer!6) (bvsge (size!57 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!604 d!1300))

(declare-fun d!1302 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!1302 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1307 thiss!1486) (currentByte!1312 thiss!1486) (size!57 (buf!366 thiss!1486))))))

(declare-fun bs!493 () Bool)

(assert (= bs!493 d!1302))

(declare-fun m!1273 () Bool)

(assert (=> bs!493 m!1273))

(assert (=> start!604 d!1302))

(declare-fun d!1304 () Bool)

(assert (=> d!1304 (= (array_inv!52 (buf!366 thiss!1486)) (bvsge (size!57 (buf!366 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!1827 d!1304))

(push 1)

(assert (not d!1302))

(check-sat)

(pop 1)

(push 1)

(check-sat)

