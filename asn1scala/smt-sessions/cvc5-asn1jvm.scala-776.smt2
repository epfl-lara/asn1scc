; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22326 () Bool)

(assert start!22326)

(declare-fun b!112880 () Bool)

(declare-fun res!93203 () Bool)

(declare-fun e!74067 () Bool)

(assert (=> b!112880 (=> (not res!93203) (not e!74067))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!112880 (= res!93203 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!93202 () Bool)

(assert (=> start!22326 (=> (not res!93202) (not e!74067))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!22326 (= res!93202 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22326 e!74067))

(assert (=> start!22326 true))

(declare-datatypes ((array!5117 0))(
  ( (array!5118 (arr!2919 (Array (_ BitVec 32) (_ BitVec 8))) (size!2326 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4126 0))(
  ( (BitStream!4127 (buf!2734 array!5117) (currentByte!5308 (_ BitVec 32)) (currentBit!5303 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4126)

(declare-fun e!74066 () Bool)

(declare-fun inv!12 (BitStream!4126) Bool)

(assert (=> start!22326 (and (inv!12 thiss!1305) e!74066)))

(declare-fun b!112881 () Bool)

(assert (=> b!112881 (= e!74067 (and (bvslt i!615 nBits!396) (let ((bdg!5565 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) (or (bvslt bdg!5565 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt bdg!5565 #b0000000000000000000000000000000000000000000000000000000001000000)))))))

(declare-fun b!112882 () Bool)

(declare-fun array_inv!2128 (array!5117) Bool)

(assert (=> b!112882 (= e!74066 (array_inv!2128 (buf!2734 thiss!1305)))))

(declare-fun b!112879 () Bool)

(declare-fun res!93201 () Bool)

(assert (=> b!112879 (=> (not res!93201) (not e!74067))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!112879 (= res!93201 (validate_offset_bits!1 ((_ sign_extend 32) (size!2326 (buf!2734 thiss!1305))) ((_ sign_extend 32) (currentByte!5308 thiss!1305)) ((_ sign_extend 32) (currentBit!5303 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(assert (= (and start!22326 res!93202) b!112879))

(assert (= (and b!112879 res!93201) b!112880))

(assert (= (and b!112880 res!93203) b!112881))

(assert (= start!22326 b!112882))

(declare-fun m!168961 () Bool)

(assert (=> b!112880 m!168961))

(declare-fun m!168963 () Bool)

(assert (=> start!22326 m!168963))

(declare-fun m!168965 () Bool)

(assert (=> b!112882 m!168965))

(declare-fun m!168967 () Bool)

(assert (=> b!112879 m!168967))

(push 1)

(assert (not b!112882))

(assert (not start!22326))

(assert (not b!112879))

(assert (not b!112880))

(check-sat)

(pop 1)

(push 1)

(check-sat)

