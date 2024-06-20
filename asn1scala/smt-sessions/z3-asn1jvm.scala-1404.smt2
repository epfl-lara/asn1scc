; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38618 () Bool)

(assert start!38618)

(declare-fun b!173690 () Bool)

(declare-fun res!143854 () Bool)

(declare-fun e!121219 () Bool)

(assert (=> b!173690 (=> (not res!143854) (not e!121219))))

(declare-datatypes ((array!9352 0))(
  ( (array!9353 (arr!5057 (Array (_ BitVec 32) (_ BitVec 8))) (size!4127 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7362 0))(
  ( (BitStream!7363 (buf!4558 array!9352) (currentByte!8657 (_ BitVec 32)) (currentBit!8652 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7362)

(declare-fun v!186 () (_ BitVec 64))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-datatypes ((Unit!12453 0))(
  ( (Unit!12454) )
))
(declare-datatypes ((tuple2!14964 0))(
  ( (tuple2!14965 (_1!8124 Unit!12453) (_2!8124 BitStream!7362)) )
))
(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7362 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14964)

(assert (=> b!173690 (= res!143854 (= (size!4127 (buf!4558 (_2!8124 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000)))) (size!4127 (buf!4558 thiss!1187))))))

(declare-fun b!173691 () Bool)

(declare-fun e!121218 () Bool)

(declare-fun array_inv!3868 (array!9352) Bool)

(assert (=> b!173691 (= e!121218 (array_inv!3868 (buf!4558 thiss!1187)))))

(declare-fun b!173692 () Bool)

(declare-fun res!143853 () Bool)

(assert (=> b!173692 (=> (not res!143853) (not e!121219))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173692 (= res!143853 (validate_offset_bits!1 ((_ sign_extend 32) (size!4127 (buf!4558 thiss!1187))) ((_ sign_extend 32) (currentByte!8657 thiss!1187)) ((_ sign_extend 32) (currentBit!8652 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun res!143856 () Bool)

(assert (=> start!38618 (=> (not res!143856) (not e!121219))))

(assert (=> start!38618 (= res!143856 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38618 e!121219))

(assert (=> start!38618 true))

(declare-fun inv!12 (BitStream!7362) Bool)

(assert (=> start!38618 (and (inv!12 thiss!1187) e!121218)))

(declare-fun b!173693 () Bool)

(declare-fun res!143855 () Bool)

(assert (=> b!173693 (=> (not res!143855) (not e!121219))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173693 (= res!143855 (invariant!0 (currentBit!8652 thiss!1187) (currentByte!8657 thiss!1187) (size!4127 (buf!4558 thiss!1187))))))

(declare-fun lt!267518 () (_ BitVec 64))

(declare-fun lt!267517 () (_ BitVec 64))

(declare-fun b!173694 () Bool)

(assert (=> b!173694 (= e!121219 (and (= lt!267518 (bvand ((_ sign_extend 32) nBits!340) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!267518 (bvand (bvadd lt!267517 ((_ sign_extend 32) nBits!340)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!173694 (= lt!267518 (bvand lt!267517 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173694 (= lt!267517 (bitIndex!0 (size!4127 (buf!4558 thiss!1187)) (currentByte!8657 thiss!1187) (currentBit!8652 thiss!1187)))))

(assert (= (and start!38618 res!143856) b!173692))

(assert (= (and b!173692 res!143853) b!173693))

(assert (= (and b!173693 res!143855) b!173690))

(assert (= (and b!173690 res!143854) b!173694))

(assert (= start!38618 b!173691))

(declare-fun m!272955 () Bool)

(assert (=> b!173694 m!272955))

(declare-fun m!272957 () Bool)

(assert (=> b!173693 m!272957))

(declare-fun m!272959 () Bool)

(assert (=> b!173692 m!272959))

(declare-fun m!272961 () Bool)

(assert (=> b!173691 m!272961))

(declare-fun m!272963 () Bool)

(assert (=> start!38618 m!272963))

(declare-fun m!272965 () Bool)

(assert (=> b!173690 m!272965))

(check-sat (not b!173693) (not b!173694) (not b!173691) (not b!173692) (not start!38618) (not b!173690))
(check-sat)
(get-model)

