; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21874 () Bool)

(assert start!21874)

(declare-fun res!91161 () Bool)

(declare-fun e!72428 () Bool)

(assert (=> start!21874 (=> (not res!91161) (not e!72428))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!21874 (= res!91161 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21874 e!72428))

(assert (=> start!21874 true))

(declare-datatypes ((array!5054 0))(
  ( (array!5055 (arr!2892 (Array (_ BitVec 32) (_ BitVec 8))) (size!2299 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4072 0))(
  ( (BitStream!4073 (buf!2693 array!5054) (currentByte!5247 (_ BitVec 32)) (currentBit!5242 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4072)

(declare-fun e!72424 () Bool)

(declare-fun inv!12 (BitStream!4072) Bool)

(assert (=> start!21874 (and (inv!12 thiss!1305) e!72424)))

(declare-fun b!110432 () Bool)

(declare-fun e!72427 () Bool)

(assert (=> b!110432 (= e!72427 true)))

(declare-datatypes ((Unit!6763 0))(
  ( (Unit!6764) )
))
(declare-fun lt!167127 () Unit!6763)

(declare-fun lt!167126 () (_ BitVec 64))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4072 array!5054 (_ BitVec 64)) Unit!6763)

(assert (=> b!110432 (= lt!167127 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2693 thiss!1305) lt!167126))))

(declare-datatypes ((tuple2!9192 0))(
  ( (tuple2!9193 (_1!4853 BitStream!4072) (_2!4853 BitStream!4072)) )
))
(declare-fun lt!167125 () tuple2!9192)

(declare-fun reader!0 (BitStream!4072 BitStream!4072) tuple2!9192)

(assert (=> b!110432 (= lt!167125 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!110433 () Bool)

(declare-fun e!72425 () Bool)

(assert (=> b!110433 (= e!72428 e!72425)))

(declare-fun res!91163 () Bool)

(assert (=> b!110433 (=> (not res!91163) (not e!72425))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110433 (= res!91163 (validate_offset_bits!1 ((_ sign_extend 32) (size!2299 (buf!2693 thiss!1305))) ((_ sign_extend 32) (currentByte!5247 thiss!1305)) ((_ sign_extend 32) (currentBit!5242 thiss!1305)) lt!167126))))

(assert (=> b!110433 (= lt!167126 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110434 () Bool)

(declare-fun array_inv!2101 (array!5054) Bool)

(assert (=> b!110434 (= e!72424 (array_inv!2101 (buf!2693 thiss!1305)))))

(declare-fun b!110435 () Bool)

(declare-fun res!91162 () Bool)

(assert (=> b!110435 (=> (not res!91162) (not e!72425))))

(assert (=> b!110435 (= res!91162 (bvsge i!615 nBits!396))))

(declare-fun b!110436 () Bool)

(declare-fun res!91164 () Bool)

(assert (=> b!110436 (=> (not res!91164) (not e!72425))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110436 (= res!91164 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110437 () Bool)

(assert (=> b!110437 (= e!72425 (not e!72427))))

(declare-fun res!91165 () Bool)

(assert (=> b!110437 (=> res!91165 e!72427)))

(declare-fun lt!167128 () (_ BitVec 64))

(assert (=> b!110437 (= res!91165 (not (= lt!167128 (bvadd lt!167128 lt!167126))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110437 (= lt!167128 (bitIndex!0 (size!2299 (buf!2693 thiss!1305)) (currentByte!5247 thiss!1305) (currentBit!5242 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4072 BitStream!4072) Bool)

(assert (=> b!110437 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!167129 () Unit!6763)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4072) Unit!6763)

(assert (=> b!110437 (= lt!167129 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (= (and start!21874 res!91161) b!110433))

(assert (= (and b!110433 res!91163) b!110436))

(assert (= (and b!110436 res!91164) b!110435))

(assert (= (and b!110435 res!91162) b!110437))

(assert (= (and b!110437 (not res!91165)) b!110432))

(assert (= start!21874 b!110434))

(declare-fun m!163997 () Bool)

(assert (=> b!110434 m!163997))

(declare-fun m!163999 () Bool)

(assert (=> b!110436 m!163999))

(declare-fun m!164001 () Bool)

(assert (=> b!110432 m!164001))

(declare-fun m!164003 () Bool)

(assert (=> b!110432 m!164003))

(declare-fun m!164005 () Bool)

(assert (=> b!110433 m!164005))

(declare-fun m!164007 () Bool)

(assert (=> start!21874 m!164007))

(declare-fun m!164009 () Bool)

(assert (=> b!110437 m!164009))

(declare-fun m!164011 () Bool)

(assert (=> b!110437 m!164011))

(declare-fun m!164013 () Bool)

(assert (=> b!110437 m!164013))

(push 1)

(assert (not b!110437))

(assert (not b!110432))

(assert (not b!110436))

(assert (not b!110433))

(assert (not start!21874))

(assert (not b!110434))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

