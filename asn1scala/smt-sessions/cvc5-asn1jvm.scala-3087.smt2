; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71050 () Bool)

(assert start!71050)

(declare-fun res!263523 () Bool)

(declare-fun e!231024 () Bool)

(assert (=> start!71050 (=> (not res!263523) (not e!231024))))

(declare-fun nBits!542 () (_ BitVec 32))

(assert (=> start!71050 (= res!263523 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000)))))

(assert (=> start!71050 e!231024))

(assert (=> start!71050 true))

(declare-datatypes ((array!20280 0))(
  ( (array!20281 (arr!9931 (Array (_ BitVec 32) (_ BitVec 8))) (size!8839 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13840 0))(
  ( (BitStream!13841 (buf!7981 array!20280) (currentByte!14716 (_ BitVec 32)) (currentBit!14711 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13840)

(declare-fun e!231023 () Bool)

(declare-fun inv!12 (BitStream!13840) Bool)

(assert (=> start!71050 (and (inv!12 thiss!1780) e!231023)))

(declare-fun b!320831 () Bool)

(declare-fun res!263524 () Bool)

(assert (=> b!320831 (=> (not res!263524) (not e!231024))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320831 (= res!263524 (validate_offset_bits!1 ((_ sign_extend 32) (size!8839 (buf!7981 thiss!1780))) ((_ sign_extend 32) (currentByte!14716 thiss!1780)) ((_ sign_extend 32) (currentBit!14711 thiss!1780)) ((_ sign_extend 32) nBits!542)))))

(declare-fun b!320832 () Bool)

(assert (=> b!320832 (= e!231024 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!8839 (buf!7981 thiss!1780))) ((_ sign_extend 32) (currentByte!14716 thiss!1780)) ((_ sign_extend 32) (currentBit!14711 thiss!1780)) ((_ sign_extend 32) nBits!542))))))

(declare-fun b!320833 () Bool)

(declare-fun array_inv!8391 (array!20280) Bool)

(assert (=> b!320833 (= e!231023 (array_inv!8391 (buf!7981 thiss!1780)))))

(assert (= (and start!71050 res!263523) b!320831))

(assert (= (and b!320831 res!263524) b!320832))

(assert (= start!71050 b!320833))

(declare-fun m!459195 () Bool)

(assert (=> start!71050 m!459195))

(declare-fun m!459197 () Bool)

(assert (=> b!320831 m!459197))

(assert (=> b!320832 m!459197))

(declare-fun m!459199 () Bool)

(assert (=> b!320833 m!459199))

(push 1)

(assert (not b!320833))

(assert (not b!320832))

(assert (not b!320831))

(assert (not start!71050))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

