; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24410 () Bool)

(assert start!24410)

(declare-fun b!124193 () Bool)

(declare-fun e!81445 () Bool)

(declare-datatypes ((array!5471 0))(
  ( (array!5472 (arr!3069 (Array (_ BitVec 32) (_ BitVec 8))) (size!2476 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4426 0))(
  ( (BitStream!4427 (buf!2922 array!5471) (currentByte!5628 (_ BitVec 32)) (currentBit!5623 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4426)

(declare-fun array_inv!2278 (array!5471) Bool)

(assert (=> b!124193 (= e!81445 (array_inv!2278 (buf!2922 thiss!1305)))))

(declare-fun b!124194 () Bool)

(declare-fun res!102954 () Bool)

(declare-fun e!81443 () Bool)

(assert (=> b!124194 (=> (not res!102954) (not e!81443))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!124194 (= res!102954 (bvsge i!615 nBits!396))))

(declare-fun b!124195 () Bool)

(declare-fun e!81447 () Bool)

(assert (=> b!124195 (= e!81447 true)))

(declare-datatypes ((tuple2!10438 0))(
  ( (tuple2!10439 (_1!5487 BitStream!4426) (_2!5487 BitStream!4426)) )
))
(declare-fun lt!195841 () tuple2!10438)

(declare-fun reader!0 (BitStream!4426 BitStream!4426) tuple2!10438)

(assert (=> b!124195 (= lt!195841 (reader!0 thiss!1305 thiss!1305))))

(declare-fun res!102953 () Bool)

(declare-fun e!81444 () Bool)

(assert (=> start!24410 (=> (not res!102953) (not e!81444))))

(assert (=> start!24410 (= res!102953 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24410 e!81444))

(assert (=> start!24410 true))

(declare-fun inv!12 (BitStream!4426) Bool)

(assert (=> start!24410 (and (inv!12 thiss!1305) e!81445)))

(declare-fun b!124196 () Bool)

(assert (=> b!124196 (= e!81443 (not e!81447))))

(declare-fun res!102951 () Bool)

(assert (=> b!124196 (=> res!102951 e!81447)))

(declare-fun lt!195840 () (_ BitVec 64))

(declare-fun lt!195843 () (_ BitVec 64))

(assert (=> b!124196 (= res!102951 (not (= lt!195840 (bvadd lt!195840 lt!195843))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124196 (= lt!195840 (bitIndex!0 (size!2476 (buf!2922 thiss!1305)) (currentByte!5628 thiss!1305) (currentBit!5623 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4426 BitStream!4426) Bool)

(assert (=> b!124196 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7696 0))(
  ( (Unit!7697) )
))
(declare-fun lt!195842 () Unit!7696)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4426) Unit!7696)

(assert (=> b!124196 (= lt!195842 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!124197 () Bool)

(declare-fun res!102952 () Bool)

(assert (=> b!124197 (=> (not res!102952) (not e!81443))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124197 (= res!102952 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!124198 () Bool)

(assert (=> b!124198 (= e!81444 e!81443)))

(declare-fun res!102950 () Bool)

(assert (=> b!124198 (=> (not res!102950) (not e!81443))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124198 (= res!102950 (validate_offset_bits!1 ((_ sign_extend 32) (size!2476 (buf!2922 thiss!1305))) ((_ sign_extend 32) (currentByte!5628 thiss!1305)) ((_ sign_extend 32) (currentBit!5623 thiss!1305)) lt!195843))))

(assert (=> b!124198 (= lt!195843 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!24410 res!102953) b!124198))

(assert (= (and b!124198 res!102950) b!124197))

(assert (= (and b!124197 res!102952) b!124194))

(assert (= (and b!124194 res!102954) b!124196))

(assert (= (and b!124196 (not res!102951)) b!124195))

(assert (= start!24410 b!124193))

(declare-fun m!189403 () Bool)

(assert (=> b!124198 m!189403))

(declare-fun m!189405 () Bool)

(assert (=> b!124193 m!189405))

(declare-fun m!189407 () Bool)

(assert (=> b!124195 m!189407))

(declare-fun m!189409 () Bool)

(assert (=> b!124196 m!189409))

(declare-fun m!189411 () Bool)

(assert (=> b!124196 m!189411))

(declare-fun m!189413 () Bool)

(assert (=> b!124196 m!189413))

(declare-fun m!189415 () Bool)

(assert (=> start!24410 m!189415))

(declare-fun m!189417 () Bool)

(assert (=> b!124197 m!189417))

(push 1)

(assert (not b!124198))

(assert (not b!124197))

(assert (not start!24410))

(assert (not b!124195))

(assert (not b!124193))

(assert (not b!124196))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

