; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24396 () Bool)

(assert start!24396)

(declare-fun b!124067 () Bool)

(declare-fun e!81341 () Bool)

(declare-fun e!81338 () Bool)

(assert (=> b!124067 (= e!81341 e!81338)))

(declare-fun res!102847 () Bool)

(assert (=> b!124067 (=> (not res!102847) (not e!81338))))

(declare-datatypes ((array!5457 0))(
  ( (array!5458 (arr!3062 (Array (_ BitVec 32) (_ BitVec 8))) (size!2469 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4412 0))(
  ( (BitStream!4413 (buf!2915 array!5457) (currentByte!5621 (_ BitVec 32)) (currentBit!5616 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4412)

(declare-fun lt!195756 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124067 (= res!102847 (validate_offset_bits!1 ((_ sign_extend 32) (size!2469 (buf!2915 thiss!1305))) ((_ sign_extend 32) (currentByte!5621 thiss!1305)) ((_ sign_extend 32) (currentBit!5616 thiss!1305)) lt!195756))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!124067 (= lt!195756 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!102849 () Bool)

(assert (=> start!24396 (=> (not res!102849) (not e!81341))))

(assert (=> start!24396 (= res!102849 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24396 e!81341))

(assert (=> start!24396 true))

(declare-fun e!81339 () Bool)

(declare-fun inv!12 (BitStream!4412) Bool)

(assert (=> start!24396 (and (inv!12 thiss!1305) e!81339)))

(declare-fun b!124068 () Bool)

(declare-fun e!81342 () Bool)

(assert (=> b!124068 (= e!81342 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000))))))

(declare-datatypes ((tuple2!10424 0))(
  ( (tuple2!10425 (_1!5480 BitStream!4412) (_2!5480 BitStream!4412)) )
))
(declare-fun lt!195758 () tuple2!10424)

(declare-fun reader!0 (BitStream!4412 BitStream!4412) tuple2!10424)

(assert (=> b!124068 (= lt!195758 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!124069 () Bool)

(declare-fun res!102848 () Bool)

(assert (=> b!124069 (=> (not res!102848) (not e!81338))))

(assert (=> b!124069 (= res!102848 (bvsge i!615 nBits!396))))

(declare-fun b!124070 () Bool)

(declare-fun array_inv!2271 (array!5457) Bool)

(assert (=> b!124070 (= e!81339 (array_inv!2271 (buf!2915 thiss!1305)))))

(declare-fun b!124071 () Bool)

(declare-fun res!102846 () Bool)

(assert (=> b!124071 (=> (not res!102846) (not e!81338))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124071 (= res!102846 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!124072 () Bool)

(assert (=> b!124072 (= e!81338 (not e!81342))))

(declare-fun res!102845 () Bool)

(assert (=> b!124072 (=> res!102845 e!81342)))

(declare-fun lt!195757 () (_ BitVec 64))

(assert (=> b!124072 (= res!102845 (not (= lt!195757 (bvadd lt!195757 lt!195756))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124072 (= lt!195757 (bitIndex!0 (size!2469 (buf!2915 thiss!1305)) (currentByte!5621 thiss!1305) (currentBit!5616 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4412 BitStream!4412) Bool)

(assert (=> b!124072 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7682 0))(
  ( (Unit!7683) )
))
(declare-fun lt!195759 () Unit!7682)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4412) Unit!7682)

(assert (=> b!124072 (= lt!195759 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (= (and start!24396 res!102849) b!124067))

(assert (= (and b!124067 res!102847) b!124071))

(assert (= (and b!124071 res!102846) b!124069))

(assert (= (and b!124069 res!102848) b!124072))

(assert (= (and b!124072 (not res!102845)) b!124068))

(assert (= start!24396 b!124070))

(declare-fun m!189291 () Bool)

(assert (=> b!124070 m!189291))

(declare-fun m!189293 () Bool)

(assert (=> b!124072 m!189293))

(declare-fun m!189295 () Bool)

(assert (=> b!124072 m!189295))

(declare-fun m!189297 () Bool)

(assert (=> b!124072 m!189297))

(declare-fun m!189299 () Bool)

(assert (=> b!124071 m!189299))

(declare-fun m!189301 () Bool)

(assert (=> start!24396 m!189301))

(declare-fun m!189303 () Bool)

(assert (=> b!124067 m!189303))

(declare-fun m!189305 () Bool)

(assert (=> b!124068 m!189305))

(push 1)

(assert (not b!124067))

(assert (not b!124070))

(assert (not b!124068))

(assert (not b!124072))

(assert (not start!24396))

(assert (not b!124071))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

