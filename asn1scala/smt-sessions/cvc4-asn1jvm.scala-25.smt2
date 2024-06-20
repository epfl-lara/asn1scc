; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!624 () Bool)

(assert start!624)

(declare-fun res!3679 () Bool)

(declare-fun e!1229 () Bool)

(assert (=> start!624 (=> (not res!3679) (not e!1229))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!158 0))(
  ( (array!159 (arr!447 (Array (_ BitVec 32) (_ BitVec 8))) (size!60 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!158)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((BitStream!98 0))(
  ( (BitStream!99 (buf!369 array!158) (currentByte!1316 (_ BitVec 32)) (currentBit!1311 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!98)

(assert (=> start!624 (= res!3679 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!60 srcBuffer!6)))) (bvsle ((_ sign_extend 32) (size!60 (buf!369 thiss!1486))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1316 thiss!1486)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1311 thiss!1486)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!60 (buf!369 thiss!1486))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1316 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1311 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!624 e!1229))

(assert (=> start!624 true))

(declare-fun array_inv!55 (array!158) Bool)

(assert (=> start!624 (array_inv!55 srcBuffer!6)))

(declare-fun e!1230 () Bool)

(declare-fun inv!12 (BitStream!98) Bool)

(assert (=> start!624 (and (inv!12 thiss!1486) e!1230)))

(declare-fun b!1844 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1844 (= e!1229 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1311 thiss!1486))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1316 thiss!1486))) ((_ extract 31 0) ((_ sign_extend 32) (size!60 (buf!369 thiss!1486)))))))))

(declare-fun b!1845 () Bool)

(assert (=> b!1845 (= e!1230 (array_inv!55 (buf!369 thiss!1486)))))

(assert (= (and start!624 res!3679) b!1844))

(assert (= start!624 b!1845))

(declare-fun m!1293 () Bool)

(assert (=> start!624 m!1293))

(declare-fun m!1295 () Bool)

(assert (=> start!624 m!1295))

(declare-fun m!1297 () Bool)

(assert (=> b!1844 m!1297))

(declare-fun m!1299 () Bool)

(assert (=> b!1845 m!1299))

(push 1)

(assert (not b!1844))

(assert (not start!624))

(assert (not b!1845))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1320 () Bool)

(assert (=> d!1320 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1311 thiss!1486))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1316 thiss!1486))) ((_ extract 31 0) ((_ sign_extend 32) (size!60 (buf!369 thiss!1486))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1311 thiss!1486))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1311 thiss!1486))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1316 thiss!1486))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1316 thiss!1486))) ((_ extract 31 0) ((_ sign_extend 32) (size!60 (buf!369 thiss!1486))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1311 thiss!1486))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1316 thiss!1486))) ((_ extract 31 0) ((_ sign_extend 32) (size!60 (buf!369 thiss!1486)))))))))))

(assert (=> b!1844 d!1320))

(declare-fun d!1326 () Bool)

