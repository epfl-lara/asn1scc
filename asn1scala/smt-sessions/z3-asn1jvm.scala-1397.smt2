; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38498 () Bool)

(assert start!38498)

(declare-fun b!173007 () Bool)

(declare-fun e!120851 () Bool)

(declare-datatypes ((array!9304 0))(
  ( (array!9305 (arr!5036 (Array (_ BitVec 32) (_ BitVec 8))) (size!4106 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7320 0))(
  ( (BitStream!7321 (buf!4534 array!9304) (currentByte!8621 (_ BitVec 32)) (currentBit!8616 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7320)

(declare-fun array_inv!3847 (array!9304) Bool)

(assert (=> b!173007 (= e!120851 (array_inv!3847 (buf!4534 thiss!1187)))))

(declare-fun b!173008 () Bool)

(declare-fun res!143288 () Bool)

(declare-fun e!120853 () Bool)

(assert (=> b!173008 (=> (not res!143288) (not e!120853))))

(declare-datatypes ((Unit!12381 0))(
  ( (Unit!12382) )
))
(declare-datatypes ((tuple2!14876 0))(
  ( (tuple2!14877 (_1!8080 Unit!12381) (_2!8080 BitStream!7320)) )
))
(declare-fun lt!266609 () tuple2!14876)

(assert (=> b!173008 (= res!143288 (= (size!4106 (buf!4534 thiss!1187)) (size!4106 (buf!4534 (_2!8080 lt!266609)))))))

(declare-fun b!173009 () Bool)

(declare-fun res!143292 () Bool)

(assert (=> b!173009 (=> (not res!143292) (not e!120853))))

(declare-fun isPrefixOf!0 (BitStream!7320 BitStream!7320) Bool)

(assert (=> b!173009 (= res!143292 (isPrefixOf!0 thiss!1187 (_2!8080 lt!266609)))))

(declare-fun b!173010 () Bool)

(declare-fun res!143289 () Bool)

(assert (=> b!173010 (=> (not res!143289) (not e!120853))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173010 (= res!143289 (= (bitIndex!0 (size!4106 (buf!4534 (_2!8080 lt!266609))) (currentByte!8621 (_2!8080 lt!266609)) (currentBit!8616 (_2!8080 lt!266609))) (bvadd (bitIndex!0 (size!4106 (buf!4534 thiss!1187)) (currentByte!8621 thiss!1187) (currentBit!8616 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!173011 () Bool)

(declare-fun e!120850 () Bool)

(assert (=> b!173011 (= e!120850 e!120853)))

(declare-fun res!143290 () Bool)

(assert (=> b!173011 (=> (not res!143290) (not e!120853))))

(assert (=> b!173011 (= res!143290 (= (size!4106 (buf!4534 (_2!8080 lt!266609))) (size!4106 (buf!4534 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7320 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14876)

(assert (=> b!173011 (= lt!266609 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!173012 () Bool)

(declare-fun res!143287 () Bool)

(assert (=> b!173012 (=> (not res!143287) (not e!120850))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173012 (= res!143287 (invariant!0 (currentBit!8616 thiss!1187) (currentByte!8621 thiss!1187) (size!4106 (buf!4534 thiss!1187))))))

(declare-fun b!173013 () Bool)

(assert (=> b!173013 (= e!120853 false)))

(declare-datatypes ((tuple2!14878 0))(
  ( (tuple2!14879 (_1!8081 BitStream!7320) (_2!8081 BitStream!7320)) )
))
(declare-fun lt!266608 () tuple2!14878)

(declare-fun reader!0 (BitStream!7320 BitStream!7320) tuple2!14878)

(assert (=> b!173013 (= lt!266608 (reader!0 thiss!1187 (_2!8080 lt!266609)))))

(declare-fun b!173006 () Bool)

(declare-fun res!143286 () Bool)

(assert (=> b!173006 (=> (not res!143286) (not e!120850))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173006 (= res!143286 (validate_offset_bits!1 ((_ sign_extend 32) (size!4106 (buf!4534 thiss!1187))) ((_ sign_extend 32) (currentByte!8621 thiss!1187)) ((_ sign_extend 32) (currentBit!8616 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun res!143291 () Bool)

(assert (=> start!38498 (=> (not res!143291) (not e!120850))))

(assert (=> start!38498 (= res!143291 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38498 e!120850))

(assert (=> start!38498 true))

(declare-fun inv!12 (BitStream!7320) Bool)

(assert (=> start!38498 (and (inv!12 thiss!1187) e!120851)))

(assert (= (and start!38498 res!143291) b!173006))

(assert (= (and b!173006 res!143286) b!173012))

(assert (= (and b!173012 res!143287) b!173011))

(assert (= (and b!173011 res!143290) b!173010))

(assert (= (and b!173010 res!143289) b!173008))

(assert (= (and b!173008 res!143288) b!173009))

(assert (= (and b!173009 res!143292) b!173013))

(assert (= start!38498 b!173007))

(declare-fun m!272151 () Bool)

(assert (=> b!173013 m!272151))

(declare-fun m!272153 () Bool)

(assert (=> start!38498 m!272153))

(declare-fun m!272155 () Bool)

(assert (=> b!173012 m!272155))

(declare-fun m!272157 () Bool)

(assert (=> b!173006 m!272157))

(declare-fun m!272159 () Bool)

(assert (=> b!173010 m!272159))

(declare-fun m!272161 () Bool)

(assert (=> b!173010 m!272161))

(declare-fun m!272163 () Bool)

(assert (=> b!173011 m!272163))

(declare-fun m!272165 () Bool)

(assert (=> b!173007 m!272165))

(declare-fun m!272167 () Bool)

(assert (=> b!173009 m!272167))

(check-sat (not b!173011) (not b!173010) (not b!173007) (not b!173013) (not b!173012) (not b!173009) (not start!38498) (not b!173006))
