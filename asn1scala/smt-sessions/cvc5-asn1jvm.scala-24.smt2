; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!600 () Bool)

(assert start!600)

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!145 0))(
  ( (array!146 (arr!442 (Array (_ BitVec 32) (_ BitVec 8))) (size!55 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!145)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((BitStream!88 0))(
  ( (BitStream!89 (buf!364 array!145) (currentByte!1310 (_ BitVec 32)) (currentBit!1305 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!88)

(assert (=> start!600 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!55 srcBuffer!6)))) (bvsle ((_ sign_extend 32) (size!55 (buf!364 thiss!1486))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1310 thiss!1486)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1305 thiss!1486)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!55 (buf!364 thiss!1486))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1310 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1305 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!600 true))

(declare-fun array_inv!50 (array!145) Bool)

(assert (=> start!600 (array_inv!50 srcBuffer!6)))

(declare-fun e!1177 () Bool)

(declare-fun inv!12 (BitStream!88) Bool)

(assert (=> start!600 (and (inv!12 thiss!1486) e!1177)))

(declare-fun b!1821 () Bool)

(assert (=> b!1821 (= e!1177 (array_inv!50 (buf!364 thiss!1486)))))

(assert (= start!600 b!1821))

(declare-fun m!1253 () Bool)

(assert (=> start!600 m!1253))

(declare-fun m!1255 () Bool)

(assert (=> start!600 m!1255))

(declare-fun m!1257 () Bool)

(assert (=> b!1821 m!1257))

(push 1)

(assert (not start!600))

(assert (not b!1821))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1306 () Bool)

(assert (=> d!1306 (= (array_inv!50 srcBuffer!6) (bvsge (size!55 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!600 d!1306))

(declare-fun d!1308 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!1308 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1305 thiss!1486) (currentByte!1310 thiss!1486) (size!55 (buf!364 thiss!1486))))))

(declare-fun bs!494 () Bool)

(assert (= bs!494 d!1308))

(declare-fun m!1275 () Bool)

(assert (=> bs!494 m!1275))

(assert (=> start!600 d!1308))

(declare-fun d!1312 () Bool)

(assert (=> d!1312 (= (array_inv!50 (buf!364 thiss!1486)) (bvsge (size!55 (buf!364 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!1821 d!1312))

(push 1)

