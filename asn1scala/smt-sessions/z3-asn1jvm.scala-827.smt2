; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24418 () Bool)

(assert start!24418)

(declare-fun b!124265 () Bool)

(declare-fun res!103011 () Bool)

(declare-fun e!81506 () Bool)

(assert (=> b!124265 (=> (not res!103011) (not e!81506))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!124265 (= res!103011 (bvsge i!615 nBits!396))))

(declare-fun res!103014 () Bool)

(declare-fun e!81507 () Bool)

(assert (=> start!24418 (=> (not res!103014) (not e!81507))))

(assert (=> start!24418 (= res!103014 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24418 e!81507))

(assert (=> start!24418 true))

(declare-datatypes ((array!5479 0))(
  ( (array!5480 (arr!3073 (Array (_ BitVec 32) (_ BitVec 8))) (size!2480 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4434 0))(
  ( (BitStream!4435 (buf!2926 array!5479) (currentByte!5632 (_ BitVec 32)) (currentBit!5627 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4434)

(declare-fun e!81504 () Bool)

(declare-fun inv!12 (BitStream!4434) Bool)

(assert (=> start!24418 (and (inv!12 thiss!1305) e!81504)))

(declare-fun b!124266 () Bool)

(assert (=> b!124266 (= e!81507 e!81506)))

(declare-fun res!103010 () Bool)

(assert (=> b!124266 (=> (not res!103010) (not e!81506))))

(declare-fun lt!195890 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124266 (= res!103010 (validate_offset_bits!1 ((_ sign_extend 32) (size!2480 (buf!2926 thiss!1305))) ((_ sign_extend 32) (currentByte!5632 thiss!1305)) ((_ sign_extend 32) (currentBit!5627 thiss!1305)) lt!195890))))

(assert (=> b!124266 (= lt!195890 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!124267 () Bool)

(declare-fun e!81505 () Bool)

(assert (=> b!124267 (= e!81506 (not e!81505))))

(declare-fun res!103013 () Bool)

(assert (=> b!124267 (=> res!103013 e!81505)))

(declare-fun lt!195889 () (_ BitVec 64))

(assert (=> b!124267 (= res!103013 (not (= lt!195889 (bvadd lt!195889 lt!195890))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124267 (= lt!195889 (bitIndex!0 (size!2480 (buf!2926 thiss!1305)) (currentByte!5632 thiss!1305) (currentBit!5627 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4434 BitStream!4434) Bool)

(assert (=> b!124267 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7704 0))(
  ( (Unit!7705) )
))
(declare-fun lt!195891 () Unit!7704)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4434) Unit!7704)

(assert (=> b!124267 (= lt!195891 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!124268 () Bool)

(declare-fun res!103012 () Bool)

(assert (=> b!124268 (=> (not res!103012) (not e!81506))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124268 (= res!103012 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!124269 () Bool)

(assert (=> b!124269 (= e!81505 true)))

(declare-datatypes ((tuple2!10446 0))(
  ( (tuple2!10447 (_1!5491 BitStream!4434) (_2!5491 BitStream!4434)) )
))
(declare-fun lt!195888 () tuple2!10446)

(declare-fun reader!0 (BitStream!4434 BitStream!4434) tuple2!10446)

(assert (=> b!124269 (= lt!195888 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!124270 () Bool)

(declare-fun array_inv!2282 (array!5479) Bool)

(assert (=> b!124270 (= e!81504 (array_inv!2282 (buf!2926 thiss!1305)))))

(assert (= (and start!24418 res!103014) b!124266))

(assert (= (and b!124266 res!103010) b!124268))

(assert (= (and b!124268 res!103012) b!124265))

(assert (= (and b!124265 res!103011) b!124267))

(assert (= (and b!124267 (not res!103013)) b!124269))

(assert (= start!24418 b!124270))

(declare-fun m!189467 () Bool)

(assert (=> b!124270 m!189467))

(declare-fun m!189469 () Bool)

(assert (=> b!124269 m!189469))

(declare-fun m!189471 () Bool)

(assert (=> start!24418 m!189471))

(declare-fun m!189473 () Bool)

(assert (=> b!124266 m!189473))

(declare-fun m!189475 () Bool)

(assert (=> b!124267 m!189475))

(declare-fun m!189477 () Bool)

(assert (=> b!124267 m!189477))

(declare-fun m!189479 () Bool)

(assert (=> b!124267 m!189479))

(declare-fun m!189481 () Bool)

(assert (=> b!124268 m!189481))

(check-sat (not start!24418) (not b!124266) (not b!124267) (not b!124268) (not b!124270) (not b!124269))
