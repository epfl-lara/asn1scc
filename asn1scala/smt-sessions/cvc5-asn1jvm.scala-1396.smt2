; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38490 () Bool)

(assert start!38490)

(declare-fun b!172917 () Bool)

(declare-fun res!143213 () Bool)

(declare-fun e!120802 () Bool)

(assert (=> b!172917 (=> (not res!143213) (not e!120802))))

(declare-datatypes ((array!9296 0))(
  ( (array!9297 (arr!5032 (Array (_ BitVec 32) (_ BitVec 8))) (size!4102 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7312 0))(
  ( (BitStream!7313 (buf!4530 array!9296) (currentByte!8617 (_ BitVec 32)) (currentBit!8612 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7312)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172917 (= res!143213 (invariant!0 (currentBit!8612 thiss!1187) (currentByte!8617 thiss!1187) (size!4102 (buf!4530 thiss!1187))))))

(declare-fun b!172918 () Bool)

(declare-fun res!143212 () Bool)

(assert (=> b!172918 (=> (not res!143212) (not e!120802))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172918 (= res!143212 (validate_offset_bits!1 ((_ sign_extend 32) (size!4102 (buf!4530 thiss!1187))) ((_ sign_extend 32) (currentByte!8617 thiss!1187)) ((_ sign_extend 32) (currentBit!8612 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!172919 () Bool)

(declare-fun res!143211 () Bool)

(declare-fun e!120803 () Bool)

(assert (=> b!172919 (=> (not res!143211) (not e!120803))))

(declare-datatypes ((Unit!12373 0))(
  ( (Unit!12374) )
))
(declare-datatypes ((tuple2!14866 0))(
  ( (tuple2!14867 (_1!8075 Unit!12373) (_2!8075 BitStream!7312)) )
))
(declare-fun lt!266584 () tuple2!14866)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172919 (= res!143211 (= (bitIndex!0 (size!4102 (buf!4530 (_2!8075 lt!266584))) (currentByte!8617 (_2!8075 lt!266584)) (currentBit!8612 (_2!8075 lt!266584))) (bvadd (bitIndex!0 (size!4102 (buf!4530 thiss!1187)) (currentByte!8617 thiss!1187) (currentBit!8612 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!172920 () Bool)

(declare-fun e!120804 () Bool)

(declare-fun array_inv!3843 (array!9296) Bool)

(assert (=> b!172920 (= e!120804 (array_inv!3843 (buf!4530 thiss!1187)))))

(declare-fun b!172921 () Bool)

(declare-fun res!143209 () Bool)

(assert (=> b!172921 (=> (not res!143209) (not e!120803))))

(assert (=> b!172921 (= res!143209 (= (size!4102 (buf!4530 thiss!1187)) (size!4102 (buf!4530 (_2!8075 lt!266584)))))))

(declare-fun res!143210 () Bool)

(assert (=> start!38490 (=> (not res!143210) (not e!120802))))

(assert (=> start!38490 (= res!143210 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38490 e!120802))

(assert (=> start!38490 true))

(declare-fun inv!12 (BitStream!7312) Bool)

(assert (=> start!38490 (and (inv!12 thiss!1187) e!120804)))

(declare-fun b!172922 () Bool)

(assert (=> b!172922 (= e!120802 e!120803)))

(declare-fun res!143214 () Bool)

(assert (=> b!172922 (=> (not res!143214) (not e!120803))))

(assert (=> b!172922 (= res!143214 (= (size!4102 (buf!4530 (_2!8075 lt!266584))) (size!4102 (buf!4530 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7312 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14866)

(assert (=> b!172922 (= lt!266584 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!172923 () Bool)

(assert (=> b!172923 (= e!120803 false)))

(declare-fun lt!266585 () Bool)

(declare-fun isPrefixOf!0 (BitStream!7312 BitStream!7312) Bool)

(assert (=> b!172923 (= lt!266585 (isPrefixOf!0 thiss!1187 (_2!8075 lt!266584)))))

(assert (= (and start!38490 res!143210) b!172918))

(assert (= (and b!172918 res!143212) b!172917))

(assert (= (and b!172917 res!143213) b!172922))

(assert (= (and b!172922 res!143214) b!172919))

(assert (= (and b!172919 res!143211) b!172921))

(assert (= (and b!172921 res!143209) b!172923))

(assert (= start!38490 b!172920))

(declare-fun m!272085 () Bool)

(assert (=> b!172918 m!272085))

(declare-fun m!272087 () Bool)

(assert (=> start!38490 m!272087))

(declare-fun m!272089 () Bool)

(assert (=> b!172919 m!272089))

(declare-fun m!272091 () Bool)

(assert (=> b!172919 m!272091))

(declare-fun m!272093 () Bool)

(assert (=> b!172922 m!272093))

(declare-fun m!272095 () Bool)

(assert (=> b!172920 m!272095))

(declare-fun m!272097 () Bool)

(assert (=> b!172917 m!272097))

(declare-fun m!272099 () Bool)

(assert (=> b!172923 m!272099))

(push 1)

(assert (not b!172918))

(assert (not start!38490))

(assert (not b!172919))

(assert (not b!172923))

(assert (not b!172922))

(assert (not b!172917))

(assert (not b!172920))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

