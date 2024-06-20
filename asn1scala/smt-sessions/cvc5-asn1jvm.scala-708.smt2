; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19906 () Bool)

(assert start!19906)

(declare-fun res!81283 () Bool)

(declare-fun e!64862 () Bool)

(assert (=> start!19906 (=> (not res!81283) (not e!64862))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!19906 (= res!81283 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!19906 e!64862))

(assert (=> start!19906 true))

(declare-datatypes ((array!4656 0))(
  ( (array!4657 (arr!2718 (Array (_ BitVec 32) (_ BitVec 8))) (size!2125 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3724 0))(
  ( (BitStream!3725 (buf!2482 array!4656) (currentByte!4922 (_ BitVec 32)) (currentBit!4917 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3724)

(declare-fun e!64863 () Bool)

(declare-fun inv!12 (BitStream!3724) Bool)

(assert (=> start!19906 (and (inv!12 thiss!1305) e!64863)))

(declare-fun b!99114 () Bool)

(declare-fun res!81284 () Bool)

(assert (=> b!99114 (=> (not res!81284) (not e!64862))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99114 (= res!81284 (validate_offset_bits!1 ((_ sign_extend 32) (size!2125 (buf!2482 thiss!1305))) ((_ sign_extend 32) (currentByte!4922 thiss!1305)) ((_ sign_extend 32) (currentBit!4917 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99115 () Bool)

(assert (=> b!99115 (= e!64862 (bvsgt #b00000000000000000000000000000000 nBits!396))))

(declare-fun b!99116 () Bool)

(declare-fun array_inv!1927 (array!4656) Bool)

(assert (=> b!99116 (= e!64863 (array_inv!1927 (buf!2482 thiss!1305)))))

(assert (= (and start!19906 res!81283) b!99114))

(assert (= (and b!99114 res!81284) b!99115))

(assert (= start!19906 b!99116))

(declare-fun m!144547 () Bool)

(assert (=> start!19906 m!144547))

(declare-fun m!144549 () Bool)

(assert (=> b!99114 m!144549))

(declare-fun m!144551 () Bool)

(assert (=> b!99116 m!144551))

(push 1)

(assert (not b!99116))

(assert (not b!99114))

(assert (not start!19906))

(check-sat)

(pop 1)

(push 1)

(check-sat)

