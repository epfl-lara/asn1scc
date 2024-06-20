; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19900 () Bool)

(assert start!19900)

(declare-fun res!81266 () Bool)

(declare-fun e!64834 () Bool)

(assert (=> start!19900 (=> (not res!81266) (not e!64834))))

(declare-datatypes ((array!4650 0))(
  ( (array!4651 (arr!2715 (Array (_ BitVec 32) (_ BitVec 8))) (size!2122 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3718 0))(
  ( (BitStream!3719 (buf!2479 array!4650) (currentByte!4919 (_ BitVec 32)) (currentBit!4914 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3718)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!19900 (= res!81266 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!2122 (buf!2479 thiss!1305))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4919 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4914 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!2122 (buf!2479 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4919 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4914 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!19900 e!64834))

(assert (=> start!19900 true))

(declare-fun e!64836 () Bool)

(declare-fun inv!12 (BitStream!3718) Bool)

(assert (=> start!19900 (and (inv!12 thiss!1305) e!64836)))

(declare-fun b!99087 () Bool)

(declare-fun res!81265 () Bool)

(assert (=> b!99087 (=> (not res!81265) (not e!64834))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!99087 (= res!81265 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4914 thiss!1305))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4919 thiss!1305))) ((_ extract 31 0) ((_ sign_extend 32) (size!2122 (buf!2479 thiss!1305))))))))

(declare-fun b!99088 () Bool)

(assert (=> b!99088 (= e!64834 (bvslt ((_ sign_extend 32) (bvsub nBits!396 i!615)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!99089 () Bool)

(declare-fun array_inv!1924 (array!4650) Bool)

(assert (=> b!99089 (= e!64836 (array_inv!1924 (buf!2479 thiss!1305)))))

(assert (= (and start!19900 res!81266) b!99087))

(assert (= (and b!99087 res!81265) b!99088))

(assert (= start!19900 b!99089))

(declare-fun m!144529 () Bool)

(assert (=> start!19900 m!144529))

(declare-fun m!144531 () Bool)

(assert (=> b!99087 m!144531))

(declare-fun m!144533 () Bool)

(assert (=> b!99089 m!144533))

(push 1)

(assert (not b!99087))

(assert (not start!19900))

(assert (not b!99089))

(check-sat)

(pop 1)

(push 1)

(check-sat)

