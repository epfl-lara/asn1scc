; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22330 () Bool)

(assert start!22330)

(declare-fun b!112904 () Bool)

(declare-fun res!93221 () Bool)

(declare-fun e!74085 () Bool)

(assert (=> b!112904 (=> (not res!93221) (not e!74085))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!112904 (= res!93221 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!112905 () Bool)

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!112905 (= e!74085 (and (bvslt i!615 nBits!396) (let ((bdg!5565 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) (or (bvslt bdg!5565 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt bdg!5565 #b0000000000000000000000000000000000000000000000000000000001000000)))))))

(declare-fun b!112903 () Bool)

(declare-fun res!93219 () Bool)

(assert (=> b!112903 (=> (not res!93219) (not e!74085))))

(declare-datatypes ((array!5121 0))(
  ( (array!5122 (arr!2921 (Array (_ BitVec 32) (_ BitVec 8))) (size!2328 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4130 0))(
  ( (BitStream!4131 (buf!2736 array!5121) (currentByte!5310 (_ BitVec 32)) (currentBit!5305 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4130)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!112903 (= res!93219 (validate_offset_bits!1 ((_ sign_extend 32) (size!2328 (buf!2736 thiss!1305))) ((_ sign_extend 32) (currentByte!5310 thiss!1305)) ((_ sign_extend 32) (currentBit!5305 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun res!93220 () Bool)

(assert (=> start!22330 (=> (not res!93220) (not e!74085))))

(assert (=> start!22330 (= res!93220 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22330 e!74085))

(assert (=> start!22330 true))

(declare-fun e!74084 () Bool)

(declare-fun inv!12 (BitStream!4130) Bool)

(assert (=> start!22330 (and (inv!12 thiss!1305) e!74084)))

(declare-fun b!112906 () Bool)

(declare-fun array_inv!2130 (array!5121) Bool)

(assert (=> b!112906 (= e!74084 (array_inv!2130 (buf!2736 thiss!1305)))))

(assert (= (and start!22330 res!93220) b!112903))

(assert (= (and b!112903 res!93219) b!112904))

(assert (= (and b!112904 res!93221) b!112905))

(assert (= start!22330 b!112906))

(declare-fun m!168977 () Bool)

(assert (=> b!112904 m!168977))

(declare-fun m!168979 () Bool)

(assert (=> b!112903 m!168979))

(declare-fun m!168981 () Bool)

(assert (=> start!22330 m!168981))

(declare-fun m!168983 () Bool)

(assert (=> b!112906 m!168983))

(push 1)

(assert (not b!112906))

(assert (not start!22330))

(assert (not b!112903))

(assert (not b!112904))

(check-sat)

(pop 1)

(push 1)

(check-sat)

