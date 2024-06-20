; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19910 () Bool)

(assert start!19910)

(declare-fun res!81295 () Bool)

(declare-fun e!64879 () Bool)

(assert (=> start!19910 (=> (not res!81295) (not e!64879))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!19910 (= res!81295 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!19910 e!64879))

(assert (=> start!19910 true))

(declare-datatypes ((array!4660 0))(
  ( (array!4661 (arr!2720 (Array (_ BitVec 32) (_ BitVec 8))) (size!2127 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3728 0))(
  ( (BitStream!3729 (buf!2484 array!4660) (currentByte!4924 (_ BitVec 32)) (currentBit!4919 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3728)

(declare-fun e!64881 () Bool)

(declare-fun inv!12 (BitStream!3728) Bool)

(assert (=> start!19910 (and (inv!12 thiss!1305) e!64881)))

(declare-fun b!99132 () Bool)

(declare-fun res!81296 () Bool)

(assert (=> b!99132 (=> (not res!81296) (not e!64879))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99132 (= res!81296 (validate_offset_bits!1 ((_ sign_extend 32) (size!2127 (buf!2484 thiss!1305))) ((_ sign_extend 32) (currentByte!4924 thiss!1305)) ((_ sign_extend 32) (currentBit!4919 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99133 () Bool)

(assert (=> b!99133 (= e!64879 (bvsgt #b00000000000000000000000000000000 nBits!396))))

(declare-fun b!99134 () Bool)

(declare-fun array_inv!1929 (array!4660) Bool)

(assert (=> b!99134 (= e!64881 (array_inv!1929 (buf!2484 thiss!1305)))))

(assert (= (and start!19910 res!81295) b!99132))

(assert (= (and b!99132 res!81296) b!99133))

(assert (= start!19910 b!99134))

(declare-fun m!144559 () Bool)

(assert (=> start!19910 m!144559))

(declare-fun m!144561 () Bool)

(assert (=> b!99132 m!144561))

(declare-fun m!144563 () Bool)

(assert (=> b!99134 m!144563))

(push 1)

(assert (not start!19910))

(assert (not b!99134))

(assert (not b!99132))

(check-sat)

(pop 1)

(push 1)

(check-sat)

