; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24386 () Bool)

(assert start!24386)

(declare-fun res!102779 () Bool)

(declare-fun e!81273 () Bool)

(assert (=> start!24386 (=> (not res!102779) (not e!81273))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!24386 (= res!102779 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24386 e!81273))

(assert (=> start!24386 true))

(declare-datatypes ((array!5447 0))(
  ( (array!5448 (arr!3057 (Array (_ BitVec 32) (_ BitVec 8))) (size!2464 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4402 0))(
  ( (BitStream!4403 (buf!2910 array!5447) (currentByte!5616 (_ BitVec 32)) (currentBit!5611 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4402)

(declare-fun e!81270 () Bool)

(declare-fun inv!12 (BitStream!4402) Bool)

(assert (=> start!24386 (and (inv!12 thiss!1305) e!81270)))

(declare-fun b!123984 () Bool)

(declare-fun e!81272 () Bool)

(assert (=> b!123984 (= e!81273 e!81272)))

(declare-fun res!102777 () Bool)

(assert (=> b!123984 (=> (not res!102777) (not e!81272))))

(declare-fun lt!195697 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!123984 (= res!102777 (validate_offset_bits!1 ((_ sign_extend 32) (size!2464 (buf!2910 thiss!1305))) ((_ sign_extend 32) (currentByte!5616 thiss!1305)) ((_ sign_extend 32) (currentBit!5611 thiss!1305)) lt!195697))))

(assert (=> b!123984 (= lt!195697 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun lt!195698 () (_ BitVec 64))

(declare-fun lt!195699 () (_ BitVec 64))

(declare-fun b!123985 () Bool)

(assert (=> b!123985 (= e!81272 (not (or (not (= lt!195699 (bvand lt!195697 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!195699 (bvand (bvadd lt!195698 lt!195697) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!123985 (= lt!195699 (bvand lt!195698 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!123985 (= lt!195698 (bitIndex!0 (size!2464 (buf!2910 thiss!1305)) (currentByte!5616 thiss!1305) (currentBit!5611 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4402 BitStream!4402) Bool)

(assert (=> b!123985 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7672 0))(
  ( (Unit!7673) )
))
(declare-fun lt!195696 () Unit!7672)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4402) Unit!7672)

(assert (=> b!123985 (= lt!195696 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!123986 () Bool)

(declare-fun array_inv!2266 (array!5447) Bool)

(assert (=> b!123986 (= e!81270 (array_inv!2266 (buf!2910 thiss!1305)))))

(declare-fun b!123987 () Bool)

(declare-fun res!102780 () Bool)

(assert (=> b!123987 (=> (not res!102780) (not e!81272))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!123987 (= res!102780 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!123988 () Bool)

(declare-fun res!102778 () Bool)

(assert (=> b!123988 (=> (not res!102778) (not e!81272))))

(assert (=> b!123988 (= res!102778 (bvsge i!615 nBits!396))))

(assert (= (and start!24386 res!102779) b!123984))

(assert (= (and b!123984 res!102777) b!123987))

(assert (= (and b!123987 res!102780) b!123988))

(assert (= (and b!123988 res!102778) b!123985))

(assert (= start!24386 b!123986))

(declare-fun m!189217 () Bool)

(assert (=> b!123987 m!189217))

(declare-fun m!189219 () Bool)

(assert (=> b!123986 m!189219))

(declare-fun m!189221 () Bool)

(assert (=> b!123984 m!189221))

(declare-fun m!189223 () Bool)

(assert (=> start!24386 m!189223))

(declare-fun m!189225 () Bool)

(assert (=> b!123985 m!189225))

(declare-fun m!189227 () Bool)

(assert (=> b!123985 m!189227))

(declare-fun m!189229 () Bool)

(assert (=> b!123985 m!189229))

(push 1)

(assert (not b!123984))

(assert (not b!123985))

(assert (not b!123986))

(assert (not b!123987))

(assert (not start!24386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

