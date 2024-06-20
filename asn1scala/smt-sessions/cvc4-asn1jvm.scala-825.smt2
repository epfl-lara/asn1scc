; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24408 () Bool)

(assert start!24408)

(declare-fun b!124175 () Bool)

(declare-fun res!102935 () Bool)

(declare-fun e!81431 () Bool)

(assert (=> b!124175 (=> (not res!102935) (not e!81431))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!124175 (= res!102935 (bvsge i!615 nBits!396))))

(declare-fun b!124176 () Bool)

(declare-fun e!81430 () Bool)

(assert (=> b!124176 (= e!81431 (not e!81430))))

(declare-fun res!102936 () Bool)

(assert (=> b!124176 (=> res!102936 e!81430)))

(declare-fun lt!195831 () (_ BitVec 64))

(declare-fun lt!195829 () (_ BitVec 64))

(assert (=> b!124176 (= res!102936 (not (= lt!195831 (bvadd lt!195831 lt!195829))))))

(declare-datatypes ((array!5469 0))(
  ( (array!5470 (arr!3068 (Array (_ BitVec 32) (_ BitVec 8))) (size!2475 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4424 0))(
  ( (BitStream!4425 (buf!2921 array!5469) (currentByte!5627 (_ BitVec 32)) (currentBit!5622 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4424)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124176 (= lt!195831 (bitIndex!0 (size!2475 (buf!2921 thiss!1305)) (currentByte!5627 thiss!1305) (currentBit!5622 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4424 BitStream!4424) Bool)

(assert (=> b!124176 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7694 0))(
  ( (Unit!7695) )
))
(declare-fun lt!195828 () Unit!7694)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4424) Unit!7694)

(assert (=> b!124176 (= lt!195828 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!124177 () Bool)

(assert (=> b!124177 (= e!81430 true)))

(declare-datatypes ((tuple2!10436 0))(
  ( (tuple2!10437 (_1!5486 BitStream!4424) (_2!5486 BitStream!4424)) )
))
(declare-fun lt!195830 () tuple2!10436)

(declare-fun reader!0 (BitStream!4424 BitStream!4424) tuple2!10436)

(assert (=> b!124177 (= lt!195830 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!124178 () Bool)

(declare-fun res!102939 () Bool)

(assert (=> b!124178 (=> (not res!102939) (not e!81431))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124178 (= res!102939 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!124179 () Bool)

(declare-fun e!81432 () Bool)

(declare-fun array_inv!2277 (array!5469) Bool)

(assert (=> b!124179 (= e!81432 (array_inv!2277 (buf!2921 thiss!1305)))))

(declare-fun res!102938 () Bool)

(declare-fun e!81429 () Bool)

(assert (=> start!24408 (=> (not res!102938) (not e!81429))))

(assert (=> start!24408 (= res!102938 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24408 e!81429))

(assert (=> start!24408 true))

(declare-fun inv!12 (BitStream!4424) Bool)

(assert (=> start!24408 (and (inv!12 thiss!1305) e!81432)))

(declare-fun b!124180 () Bool)

(assert (=> b!124180 (= e!81429 e!81431)))

(declare-fun res!102937 () Bool)

(assert (=> b!124180 (=> (not res!102937) (not e!81431))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124180 (= res!102937 (validate_offset_bits!1 ((_ sign_extend 32) (size!2475 (buf!2921 thiss!1305))) ((_ sign_extend 32) (currentByte!5627 thiss!1305)) ((_ sign_extend 32) (currentBit!5622 thiss!1305)) lt!195829))))

(assert (=> b!124180 (= lt!195829 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!24408 res!102938) b!124180))

(assert (= (and b!124180 res!102937) b!124178))

(assert (= (and b!124178 res!102939) b!124175))

(assert (= (and b!124175 res!102935) b!124176))

(assert (= (and b!124176 (not res!102936)) b!124177))

(assert (= start!24408 b!124179))

(declare-fun m!189387 () Bool)

(assert (=> b!124178 m!189387))

(declare-fun m!189389 () Bool)

(assert (=> b!124179 m!189389))

(declare-fun m!189391 () Bool)

(assert (=> b!124177 m!189391))

(declare-fun m!189393 () Bool)

(assert (=> start!24408 m!189393))

(declare-fun m!189395 () Bool)

(assert (=> b!124176 m!189395))

(declare-fun m!189397 () Bool)

(assert (=> b!124176 m!189397))

(declare-fun m!189399 () Bool)

(assert (=> b!124176 m!189399))

(declare-fun m!189401 () Bool)

(assert (=> b!124180 m!189401))

(push 1)

(assert (not b!124180))

(assert (not b!124176))

(assert (not b!124179))

(assert (not start!24408))

(assert (not b!124177))

(assert (not b!124178))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

