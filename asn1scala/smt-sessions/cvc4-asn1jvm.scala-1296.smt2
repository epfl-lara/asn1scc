; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36926 () Bool)

(assert start!36926)

(declare-fun res!140324 () Bool)

(declare-fun e!117211 () Bool)

(assert (=> start!36926 (=> (not res!140324) (not e!117211))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36926 (= res!140324 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36926 e!117211))

(assert (=> start!36926 true))

(declare-datatypes ((array!8806 0))(
  ( (array!8807 (arr!4824 (Array (_ BitVec 32) (_ BitVec 8))) (size!3903 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6962 0))(
  ( (BitStream!6963 (buf!4355 array!8806) (currentByte!8276 (_ BitVec 32)) (currentBit!8271 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6962)

(declare-fun e!117212 () Bool)

(declare-fun inv!12 (BitStream!6962) Bool)

(assert (=> start!36926 (and (inv!12 thiss!1894) e!117212)))

(declare-fun b!168652 () Bool)

(declare-fun res!140323 () Bool)

(assert (=> b!168652 (=> (not res!140323) (not e!117211))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168652 (= res!140323 (validate_offset_bits!1 ((_ sign_extend 32) (size!3903 (buf!4355 thiss!1894))) ((_ sign_extend 32) (currentByte!8276 thiss!1894)) ((_ sign_extend 32) (currentBit!8271 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168653 () Bool)

(assert (=> b!168653 (= e!117211 (and (bvsle (bvadd (currentBit!8271 thiss!1894) nBits!600) #b00000000000000000000000000001000) (or (bvslt nBits!600 #b00000000000000000000000000000000) (bvsge nBits!600 #b00000000000000000000000000001001))))))

(declare-fun b!168654 () Bool)

(declare-fun array_inv!3644 (array!8806) Bool)

(assert (=> b!168654 (= e!117212 (array_inv!3644 (buf!4355 thiss!1894)))))

(assert (= (and start!36926 res!140324) b!168652))

(assert (= (and b!168652 res!140323) b!168653))

(assert (= start!36926 b!168654))

(declare-fun m!268245 () Bool)

(assert (=> start!36926 m!268245))

(declare-fun m!268247 () Bool)

(assert (=> b!168652 m!268247))

(declare-fun m!268249 () Bool)

(assert (=> b!168654 m!268249))

(push 1)

(assert (not b!168654))

(assert (not start!36926))

(assert (not b!168652))

(check-sat)

(pop 1)

(push 1)

(check-sat)

