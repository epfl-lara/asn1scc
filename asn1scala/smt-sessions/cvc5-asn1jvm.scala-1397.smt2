; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38496 () Bool)

(assert start!38496)

(declare-fun b!172982 () Bool)

(declare-fun res!143270 () Bool)

(declare-fun e!120840 () Bool)

(assert (=> b!172982 (=> (not res!143270) (not e!120840))))

(declare-datatypes ((array!9302 0))(
  ( (array!9303 (arr!5035 (Array (_ BitVec 32) (_ BitVec 8))) (size!4105 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7318 0))(
  ( (BitStream!7319 (buf!4533 array!9302) (currentByte!8620 (_ BitVec 32)) (currentBit!8615 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7318)

(declare-datatypes ((Unit!12379 0))(
  ( (Unit!12380) )
))
(declare-datatypes ((tuple2!14872 0))(
  ( (tuple2!14873 (_1!8078 Unit!12379) (_2!8078 BitStream!7318)) )
))
(declare-fun lt!266602 () tuple2!14872)

(declare-fun isPrefixOf!0 (BitStream!7318 BitStream!7318) Bool)

(assert (=> b!172982 (= res!143270 (isPrefixOf!0 thiss!1187 (_2!8078 lt!266602)))))

(declare-fun b!172983 () Bool)

(declare-fun res!143265 () Bool)

(assert (=> b!172983 (=> (not res!143265) (not e!120840))))

(assert (=> b!172983 (= res!143265 (= (size!4105 (buf!4533 thiss!1187)) (size!4105 (buf!4533 (_2!8078 lt!266602)))))))

(declare-fun b!172984 () Bool)

(declare-fun res!143269 () Bool)

(declare-fun e!120838 () Bool)

(assert (=> b!172984 (=> (not res!143269) (not e!120838))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172984 (= res!143269 (invariant!0 (currentBit!8615 thiss!1187) (currentByte!8620 thiss!1187) (size!4105 (buf!4533 thiss!1187))))))

(declare-fun b!172985 () Bool)

(declare-fun res!143271 () Bool)

(assert (=> b!172985 (=> (not res!143271) (not e!120838))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172985 (= res!143271 (validate_offset_bits!1 ((_ sign_extend 32) (size!4105 (buf!4533 thiss!1187))) ((_ sign_extend 32) (currentByte!8620 thiss!1187)) ((_ sign_extend 32) (currentBit!8615 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!172986 () Bool)

(declare-fun res!143268 () Bool)

(assert (=> b!172986 (=> (not res!143268) (not e!120840))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172986 (= res!143268 (= (bitIndex!0 (size!4105 (buf!4533 (_2!8078 lt!266602))) (currentByte!8620 (_2!8078 lt!266602)) (currentBit!8615 (_2!8078 lt!266602))) (bvadd (bitIndex!0 (size!4105 (buf!4533 thiss!1187)) (currentByte!8620 thiss!1187) (currentBit!8615 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!172987 () Bool)

(declare-fun e!120841 () Bool)

(declare-fun array_inv!3846 (array!9302) Bool)

(assert (=> b!172987 (= e!120841 (array_inv!3846 (buf!4533 thiss!1187)))))

(declare-fun b!172988 () Bool)

(assert (=> b!172988 (= e!120838 e!120840)))

(declare-fun res!143267 () Bool)

(assert (=> b!172988 (=> (not res!143267) (not e!120840))))

(assert (=> b!172988 (= res!143267 (= (size!4105 (buf!4533 (_2!8078 lt!266602))) (size!4105 (buf!4533 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7318 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14872)

(assert (=> b!172988 (= lt!266602 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!172989 () Bool)

(assert (=> b!172989 (= e!120840 false)))

(declare-datatypes ((tuple2!14874 0))(
  ( (tuple2!14875 (_1!8079 BitStream!7318) (_2!8079 BitStream!7318)) )
))
(declare-fun lt!266603 () tuple2!14874)

(declare-fun reader!0 (BitStream!7318 BitStream!7318) tuple2!14874)

(assert (=> b!172989 (= lt!266603 (reader!0 thiss!1187 (_2!8078 lt!266602)))))

(declare-fun res!143266 () Bool)

(assert (=> start!38496 (=> (not res!143266) (not e!120838))))

(assert (=> start!38496 (= res!143266 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38496 e!120838))

(assert (=> start!38496 true))

(declare-fun inv!12 (BitStream!7318) Bool)

(assert (=> start!38496 (and (inv!12 thiss!1187) e!120841)))

(assert (= (and start!38496 res!143266) b!172985))

(assert (= (and b!172985 res!143271) b!172984))

(assert (= (and b!172984 res!143269) b!172988))

(assert (= (and b!172988 res!143267) b!172986))

(assert (= (and b!172986 res!143268) b!172983))

(assert (= (and b!172983 res!143265) b!172982))

(assert (= (and b!172982 res!143270) b!172989))

(assert (= start!38496 b!172987))

(declare-fun m!272133 () Bool)

(assert (=> b!172988 m!272133))

(declare-fun m!272135 () Bool)

(assert (=> b!172984 m!272135))

(declare-fun m!272137 () Bool)

(assert (=> b!172987 m!272137))

(declare-fun m!272139 () Bool)

(assert (=> start!38496 m!272139))

(declare-fun m!272141 () Bool)

(assert (=> b!172985 m!272141))

(declare-fun m!272143 () Bool)

(assert (=> b!172982 m!272143))

(declare-fun m!272145 () Bool)

(assert (=> b!172986 m!272145))

(declare-fun m!272147 () Bool)

(assert (=> b!172986 m!272147))

(declare-fun m!272149 () Bool)

(assert (=> b!172989 m!272149))

(push 1)

(assert (not b!172985))

(assert (not b!172986))

(assert (not b!172989))

(assert (not b!172982))

(assert (not b!172987))

(assert (not b!172988))

(assert (not b!172984))

(assert (not start!38496))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

