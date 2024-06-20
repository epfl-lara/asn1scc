; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38492 () Bool)

(assert start!38492)

(declare-fun b!172938 () Bool)

(declare-fun res!143230 () Bool)

(declare-fun e!120814 () Bool)

(assert (=> b!172938 (=> (not res!143230) (not e!120814))))

(declare-datatypes ((array!9298 0))(
  ( (array!9299 (arr!5033 (Array (_ BitVec 32) (_ BitVec 8))) (size!4103 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7314 0))(
  ( (BitStream!7315 (buf!4531 array!9298) (currentByte!8618 (_ BitVec 32)) (currentBit!8613 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7314)

(declare-datatypes ((Unit!12375 0))(
  ( (Unit!12376) )
))
(declare-datatypes ((tuple2!14868 0))(
  ( (tuple2!14869 (_1!8076 Unit!12375) (_2!8076 BitStream!7314)) )
))
(declare-fun lt!266591 () tuple2!14868)

(assert (=> b!172938 (= res!143230 (= (size!4103 (buf!4531 thiss!1187)) (size!4103 (buf!4531 (_2!8076 lt!266591)))))))

(declare-fun b!172939 () Bool)

(declare-fun res!143231 () Bool)

(assert (=> b!172939 (=> (not res!143231) (not e!120814))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172939 (= res!143231 (= (bitIndex!0 (size!4103 (buf!4531 (_2!8076 lt!266591))) (currentByte!8618 (_2!8076 lt!266591)) (currentBit!8613 (_2!8076 lt!266591))) (bvadd (bitIndex!0 (size!4103 (buf!4531 thiss!1187)) (currentByte!8618 thiss!1187) (currentBit!8613 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun res!143227 () Bool)

(declare-fun e!120815 () Bool)

(assert (=> start!38492 (=> (not res!143227) (not e!120815))))

(assert (=> start!38492 (= res!143227 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38492 e!120815))

(assert (=> start!38492 true))

(declare-fun e!120817 () Bool)

(declare-fun inv!12 (BitStream!7314) Bool)

(assert (=> start!38492 (and (inv!12 thiss!1187) e!120817)))

(declare-fun b!172940 () Bool)

(declare-fun res!143232 () Bool)

(assert (=> b!172940 (=> (not res!143232) (not e!120815))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172940 (= res!143232 (validate_offset_bits!1 ((_ sign_extend 32) (size!4103 (buf!4531 thiss!1187))) ((_ sign_extend 32) (currentByte!8618 thiss!1187)) ((_ sign_extend 32) (currentBit!8613 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!172941 () Bool)

(assert (=> b!172941 (= e!120815 e!120814)))

(declare-fun res!143228 () Bool)

(assert (=> b!172941 (=> (not res!143228) (not e!120814))))

(assert (=> b!172941 (= res!143228 (= (size!4103 (buf!4531 (_2!8076 lt!266591))) (size!4103 (buf!4531 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7314 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14868)

(assert (=> b!172941 (= lt!266591 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!172942 () Bool)

(declare-fun res!143229 () Bool)

(assert (=> b!172942 (=> (not res!143229) (not e!120815))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172942 (= res!143229 (invariant!0 (currentBit!8613 thiss!1187) (currentByte!8618 thiss!1187) (size!4103 (buf!4531 thiss!1187))))))

(declare-fun b!172943 () Bool)

(declare-fun array_inv!3844 (array!9298) Bool)

(assert (=> b!172943 (= e!120817 (array_inv!3844 (buf!4531 thiss!1187)))))

(declare-fun b!172944 () Bool)

(assert (=> b!172944 (= e!120814 false)))

(declare-fun lt!266590 () Bool)

(declare-fun isPrefixOf!0 (BitStream!7314 BitStream!7314) Bool)

(assert (=> b!172944 (= lt!266590 (isPrefixOf!0 thiss!1187 (_2!8076 lt!266591)))))

(assert (= (and start!38492 res!143227) b!172940))

(assert (= (and b!172940 res!143232) b!172942))

(assert (= (and b!172942 res!143229) b!172941))

(assert (= (and b!172941 res!143228) b!172939))

(assert (= (and b!172939 res!143231) b!172938))

(assert (= (and b!172938 res!143230) b!172944))

(assert (= start!38492 b!172943))

(declare-fun m!272101 () Bool)

(assert (=> b!172939 m!272101))

(declare-fun m!272103 () Bool)

(assert (=> b!172939 m!272103))

(declare-fun m!272105 () Bool)

(assert (=> b!172940 m!272105))

(declare-fun m!272107 () Bool)

(assert (=> start!38492 m!272107))

(declare-fun m!272109 () Bool)

(assert (=> b!172941 m!272109))

(declare-fun m!272111 () Bool)

(assert (=> b!172943 m!272111))

(declare-fun m!272113 () Bool)

(assert (=> b!172942 m!272113))

(declare-fun m!272115 () Bool)

(assert (=> b!172944 m!272115))

(check-sat (not start!38492) (not b!172943) (not b!172941) (not b!172939) (not b!172940) (not b!172942) (not b!172944))
