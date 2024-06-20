; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38502 () Bool)

(assert start!38502)

(declare-fun b!173054 () Bool)

(declare-fun e!120874 () Bool)

(declare-datatypes ((array!9308 0))(
  ( (array!9309 (arr!5038 (Array (_ BitVec 32) (_ BitVec 8))) (size!4108 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7324 0))(
  ( (BitStream!7325 (buf!4536 array!9308) (currentByte!8623 (_ BitVec 32)) (currentBit!8618 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7324)

(declare-fun array_inv!3849 (array!9308) Bool)

(assert (=> b!173054 (= e!120874 (array_inv!3849 (buf!4536 thiss!1187)))))

(declare-fun b!173056 () Bool)

(declare-fun res!143334 () Bool)

(declare-fun e!120877 () Bool)

(assert (=> b!173056 (=> (not res!143334) (not e!120877))))

(declare-datatypes ((Unit!12385 0))(
  ( (Unit!12386) )
))
(declare-datatypes ((tuple2!14884 0))(
  ( (tuple2!14885 (_1!8084 Unit!12385) (_2!8084 BitStream!7324)) )
))
(declare-fun lt!266620 () tuple2!14884)

(assert (=> b!173056 (= res!143334 (= (size!4108 (buf!4536 thiss!1187)) (size!4108 (buf!4536 (_2!8084 lt!266620)))))))

(declare-fun b!173057 () Bool)

(assert (=> b!173057 (= e!120877 false)))

(declare-datatypes ((tuple2!14886 0))(
  ( (tuple2!14887 (_1!8085 BitStream!7324) (_2!8085 BitStream!7324)) )
))
(declare-fun lt!266621 () tuple2!14886)

(declare-fun reader!0 (BitStream!7324 BitStream!7324) tuple2!14886)

(assert (=> b!173057 (= lt!266621 (reader!0 thiss!1187 (_2!8084 lt!266620)))))

(declare-fun b!173058 () Bool)

(declare-fun res!143332 () Bool)

(declare-fun e!120875 () Bool)

(assert (=> b!173058 (=> (not res!143332) (not e!120875))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173058 (= res!143332 (validate_offset_bits!1 ((_ sign_extend 32) (size!4108 (buf!4536 thiss!1187))) ((_ sign_extend 32) (currentByte!8623 thiss!1187)) ((_ sign_extend 32) (currentBit!8618 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!173059 () Bool)

(declare-fun res!143333 () Bool)

(assert (=> b!173059 (=> (not res!143333) (not e!120877))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173059 (= res!143333 (= (bitIndex!0 (size!4108 (buf!4536 (_2!8084 lt!266620))) (currentByte!8623 (_2!8084 lt!266620)) (currentBit!8618 (_2!8084 lt!266620))) (bvadd (bitIndex!0 (size!4108 (buf!4536 thiss!1187)) (currentByte!8623 thiss!1187) (currentBit!8618 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!173060 () Bool)

(assert (=> b!173060 (= e!120875 e!120877)))

(declare-fun res!143329 () Bool)

(assert (=> b!173060 (=> (not res!143329) (not e!120877))))

(assert (=> b!173060 (= res!143329 (= (size!4108 (buf!4536 (_2!8084 lt!266620))) (size!4108 (buf!4536 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7324 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14884)

(assert (=> b!173060 (= lt!266620 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!173061 () Bool)

(declare-fun res!143330 () Bool)

(assert (=> b!173061 (=> (not res!143330) (not e!120875))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173061 (= res!143330 (invariant!0 (currentBit!8618 thiss!1187) (currentByte!8623 thiss!1187) (size!4108 (buf!4536 thiss!1187))))))

(declare-fun b!173055 () Bool)

(declare-fun res!143328 () Bool)

(assert (=> b!173055 (=> (not res!143328) (not e!120877))))

(declare-fun isPrefixOf!0 (BitStream!7324 BitStream!7324) Bool)

(assert (=> b!173055 (= res!143328 (isPrefixOf!0 thiss!1187 (_2!8084 lt!266620)))))

(declare-fun res!143331 () Bool)

(assert (=> start!38502 (=> (not res!143331) (not e!120875))))

(assert (=> start!38502 (= res!143331 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38502 e!120875))

(assert (=> start!38502 true))

(declare-fun inv!12 (BitStream!7324) Bool)

(assert (=> start!38502 (and (inv!12 thiss!1187) e!120874)))

(assert (= (and start!38502 res!143331) b!173058))

(assert (= (and b!173058 res!143332) b!173061))

(assert (= (and b!173061 res!143330) b!173060))

(assert (= (and b!173060 res!143329) b!173059))

(assert (= (and b!173059 res!143333) b!173056))

(assert (= (and b!173056 res!143334) b!173055))

(assert (= (and b!173055 res!143328) b!173057))

(assert (= start!38502 b!173054))

(declare-fun m!272187 () Bool)

(assert (=> b!173060 m!272187))

(declare-fun m!272189 () Bool)

(assert (=> b!173057 m!272189))

(declare-fun m!272191 () Bool)

(assert (=> b!173058 m!272191))

(declare-fun m!272193 () Bool)

(assert (=> b!173059 m!272193))

(declare-fun m!272195 () Bool)

(assert (=> b!173059 m!272195))

(declare-fun m!272197 () Bool)

(assert (=> b!173054 m!272197))

(declare-fun m!272199 () Bool)

(assert (=> b!173061 m!272199))

(declare-fun m!272201 () Bool)

(assert (=> start!38502 m!272201))

(declare-fun m!272203 () Bool)

(assert (=> b!173055 m!272203))

(push 1)

(assert (not b!173059))

(assert (not b!173055))

(assert (not b!173057))

(assert (not b!173060))

(assert (not b!173054))

(assert (not b!173058))

(assert (not b!173061))

(assert (not start!38502))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

