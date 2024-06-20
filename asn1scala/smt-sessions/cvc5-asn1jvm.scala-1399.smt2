; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38508 () Bool)

(assert start!38508)

(declare-fun b!173126 () Bool)

(declare-fun res!143393 () Bool)

(declare-fun e!120910 () Bool)

(assert (=> b!173126 (=> (not res!143393) (not e!120910))))

(declare-datatypes ((array!9314 0))(
  ( (array!9315 (arr!5041 (Array (_ BitVec 32) (_ BitVec 8))) (size!4111 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7330 0))(
  ( (BitStream!7331 (buf!4539 array!9314) (currentByte!8626 (_ BitVec 32)) (currentBit!8621 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7330)

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173126 (= res!143393 (validate_offset_bits!1 ((_ sign_extend 32) (size!4111 (buf!4539 thiss!1187))) ((_ sign_extend 32) (currentByte!8626 thiss!1187)) ((_ sign_extend 32) (currentBit!8621 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!173127 () Bool)

(declare-fun res!143392 () Bool)

(declare-fun e!120913 () Bool)

(assert (=> b!173127 (=> (not res!143392) (not e!120913))))

(declare-datatypes ((Unit!12391 0))(
  ( (Unit!12392) )
))
(declare-datatypes ((tuple2!14896 0))(
  ( (tuple2!14897 (_1!8090 Unit!12391) (_2!8090 BitStream!7330)) )
))
(declare-fun lt!266638 () tuple2!14896)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173127 (= res!143392 (= (bitIndex!0 (size!4111 (buf!4539 (_2!8090 lt!266638))) (currentByte!8626 (_2!8090 lt!266638)) (currentBit!8621 (_2!8090 lt!266638))) (bvadd (bitIndex!0 (size!4111 (buf!4539 thiss!1187)) (currentByte!8626 thiss!1187) (currentBit!8621 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!173128 () Bool)

(declare-fun res!143396 () Bool)

(assert (=> b!173128 (=> (not res!143396) (not e!120910))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173128 (= res!143396 (invariant!0 (currentBit!8621 thiss!1187) (currentByte!8626 thiss!1187) (size!4111 (buf!4539 thiss!1187))))))

(declare-fun b!173129 () Bool)

(assert (=> b!173129 (= e!120913 false)))

(declare-datatypes ((tuple2!14898 0))(
  ( (tuple2!14899 (_1!8091 BitStream!7330) (_2!8091 BitStream!7330)) )
))
(declare-fun lt!266639 () tuple2!14898)

(declare-fun reader!0 (BitStream!7330 BitStream!7330) tuple2!14898)

(assert (=> b!173129 (= lt!266639 (reader!0 thiss!1187 (_2!8090 lt!266638)))))

(declare-fun b!173130 () Bool)

(declare-fun res!143394 () Bool)

(assert (=> b!173130 (=> (not res!143394) (not e!120913))))

(declare-fun isPrefixOf!0 (BitStream!7330 BitStream!7330) Bool)

(assert (=> b!173130 (= res!143394 (isPrefixOf!0 thiss!1187 (_2!8090 lt!266638)))))

(declare-fun res!143395 () Bool)

(assert (=> start!38508 (=> (not res!143395) (not e!120910))))

(assert (=> start!38508 (= res!143395 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38508 e!120910))

(assert (=> start!38508 true))

(declare-fun e!120912 () Bool)

(declare-fun inv!12 (BitStream!7330) Bool)

(assert (=> start!38508 (and (inv!12 thiss!1187) e!120912)))

(declare-fun b!173131 () Bool)

(declare-fun array_inv!3852 (array!9314) Bool)

(assert (=> b!173131 (= e!120912 (array_inv!3852 (buf!4539 thiss!1187)))))

(declare-fun b!173132 () Bool)

(assert (=> b!173132 (= e!120910 e!120913)))

(declare-fun res!143397 () Bool)

(assert (=> b!173132 (=> (not res!143397) (not e!120913))))

(assert (=> b!173132 (= res!143397 (= (size!4111 (buf!4539 (_2!8090 lt!266638))) (size!4111 (buf!4539 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7330 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14896)

(assert (=> b!173132 (= lt!266638 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!173133 () Bool)

(declare-fun res!143391 () Bool)

(assert (=> b!173133 (=> (not res!143391) (not e!120913))))

(assert (=> b!173133 (= res!143391 (= (size!4111 (buf!4539 thiss!1187)) (size!4111 (buf!4539 (_2!8090 lt!266638)))))))

(assert (= (and start!38508 res!143395) b!173126))

(assert (= (and b!173126 res!143393) b!173128))

(assert (= (and b!173128 res!143396) b!173132))

(assert (= (and b!173132 res!143397) b!173127))

(assert (= (and b!173127 res!143392) b!173133))

(assert (= (and b!173133 res!143391) b!173130))

(assert (= (and b!173130 res!143394) b!173129))

(assert (= start!38508 b!173131))

(declare-fun m!272241 () Bool)

(assert (=> b!173129 m!272241))

(declare-fun m!272243 () Bool)

(assert (=> b!173132 m!272243))

(declare-fun m!272245 () Bool)

(assert (=> b!173128 m!272245))

(declare-fun m!272247 () Bool)

(assert (=> b!173126 m!272247))

(declare-fun m!272249 () Bool)

(assert (=> start!38508 m!272249))

(declare-fun m!272251 () Bool)

(assert (=> b!173127 m!272251))

(declare-fun m!272253 () Bool)

(assert (=> b!173127 m!272253))

(declare-fun m!272255 () Bool)

(assert (=> b!173131 m!272255))

(declare-fun m!272257 () Bool)

(assert (=> b!173130 m!272257))

(push 1)

(assert (not b!173127))

(assert (not b!173129))

(assert (not b!173131))

(assert (not b!173132))

(assert (not b!173130))

(assert (not start!38508))

(assert (not b!173128))

(assert (not b!173126))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

