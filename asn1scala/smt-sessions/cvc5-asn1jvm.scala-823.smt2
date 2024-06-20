; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24392 () Bool)

(assert start!24392)

(declare-fun b!124031 () Bool)

(declare-fun res!102816 () Bool)

(declare-fun e!81312 () Bool)

(assert (=> b!124031 (=> (not res!102816) (not e!81312))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124031 (= res!102816 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!124032 () Bool)

(declare-fun e!81311 () Bool)

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!124032 (= e!81311 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000))))))

(declare-datatypes ((array!5453 0))(
  ( (array!5454 (arr!3060 (Array (_ BitVec 32) (_ BitVec 8))) (size!2467 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4408 0))(
  ( (BitStream!4409 (buf!2913 array!5453) (currentByte!5619 (_ BitVec 32)) (currentBit!5614 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10420 0))(
  ( (tuple2!10421 (_1!5478 BitStream!4408) (_2!5478 BitStream!4408)) )
))
(declare-fun lt!195735 () tuple2!10420)

(declare-fun thiss!1305 () BitStream!4408)

(declare-fun reader!0 (BitStream!4408 BitStream!4408) tuple2!10420)

(assert (=> b!124032 (= lt!195735 (reader!0 thiss!1305 thiss!1305))))

(declare-fun res!102819 () Bool)

(declare-fun e!81310 () Bool)

(assert (=> start!24392 (=> (not res!102819) (not e!81310))))

(assert (=> start!24392 (= res!102819 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24392 e!81310))

(assert (=> start!24392 true))

(declare-fun e!81309 () Bool)

(declare-fun inv!12 (BitStream!4408) Bool)

(assert (=> start!24392 (and (inv!12 thiss!1305) e!81309)))

(declare-fun b!124033 () Bool)

(declare-fun res!102815 () Bool)

(assert (=> b!124033 (=> (not res!102815) (not e!81312))))

(assert (=> b!124033 (= res!102815 (bvsge i!615 nBits!396))))

(declare-fun b!124034 () Bool)

(assert (=> b!124034 (= e!81312 (not e!81311))))

(declare-fun res!102818 () Bool)

(assert (=> b!124034 (=> res!102818 e!81311)))

(declare-fun lt!195734 () (_ BitVec 64))

(declare-fun lt!195733 () (_ BitVec 64))

(assert (=> b!124034 (= res!102818 (not (= lt!195734 (bvadd lt!195734 lt!195733))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124034 (= lt!195734 (bitIndex!0 (size!2467 (buf!2913 thiss!1305)) (currentByte!5619 thiss!1305) (currentBit!5614 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4408 BitStream!4408) Bool)

(assert (=> b!124034 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7678 0))(
  ( (Unit!7679) )
))
(declare-fun lt!195732 () Unit!7678)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4408) Unit!7678)

(assert (=> b!124034 (= lt!195732 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!124035 () Bool)

(declare-fun array_inv!2269 (array!5453) Bool)

(assert (=> b!124035 (= e!81309 (array_inv!2269 (buf!2913 thiss!1305)))))

(declare-fun b!124036 () Bool)

(assert (=> b!124036 (= e!81310 e!81312)))

(declare-fun res!102817 () Bool)

(assert (=> b!124036 (=> (not res!102817) (not e!81312))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124036 (= res!102817 (validate_offset_bits!1 ((_ sign_extend 32) (size!2467 (buf!2913 thiss!1305))) ((_ sign_extend 32) (currentByte!5619 thiss!1305)) ((_ sign_extend 32) (currentBit!5614 thiss!1305)) lt!195733))))

(assert (=> b!124036 (= lt!195733 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!24392 res!102819) b!124036))

(assert (= (and b!124036 res!102817) b!124031))

(assert (= (and b!124031 res!102816) b!124033))

(assert (= (and b!124033 res!102815) b!124034))

(assert (= (and b!124034 (not res!102818)) b!124032))

(assert (= start!24392 b!124035))

(declare-fun m!189259 () Bool)

(assert (=> b!124031 m!189259))

(declare-fun m!189261 () Bool)

(assert (=> start!24392 m!189261))

(declare-fun m!189263 () Bool)

(assert (=> b!124034 m!189263))

(declare-fun m!189265 () Bool)

(assert (=> b!124034 m!189265))

(declare-fun m!189267 () Bool)

(assert (=> b!124034 m!189267))

(declare-fun m!189269 () Bool)

(assert (=> b!124036 m!189269))

(declare-fun m!189271 () Bool)

(assert (=> b!124035 m!189271))

(declare-fun m!189273 () Bool)

(assert (=> b!124032 m!189273))

(push 1)

(assert (not b!124031))

(assert (not b!124034))

(assert (not b!124035))

(assert (not start!24392))

(assert (not b!124032))

(assert (not b!124036))

(check-sat)

(pop 1)

(push 1)

(check-sat)

