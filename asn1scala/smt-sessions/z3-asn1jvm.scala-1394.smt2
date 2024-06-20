; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38444 () Bool)

(assert start!38444)

(declare-fun b!172662 () Bool)

(declare-fun res!143009 () Bool)

(declare-fun e!120649 () Bool)

(assert (=> b!172662 (=> (not res!143009) (not e!120649))))

(declare-datatypes ((array!9283 0))(
  ( (array!9284 (arr!5027 (Array (_ BitVec 32) (_ BitVec 8))) (size!4097 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7302 0))(
  ( (BitStream!7303 (buf!4525 array!9283) (currentByte!8603 (_ BitVec 32)) (currentBit!8598 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7302)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172662 (= res!143009 (invariant!0 (currentBit!8598 thiss!1187) (currentByte!8603 thiss!1187) (size!4097 (buf!4525 thiss!1187))))))

(declare-fun b!172663 () Bool)

(declare-fun res!143005 () Bool)

(declare-fun e!120651 () Bool)

(assert (=> b!172663 (=> (not res!143005) (not e!120651))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-datatypes ((Unit!12341 0))(
  ( (Unit!12342) )
))
(declare-datatypes ((tuple2!14844 0))(
  ( (tuple2!14845 (_1!8064 Unit!12341) (_2!8064 BitStream!7302)) )
))
(declare-fun lt!265973 () tuple2!14844)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172663 (= res!143005 (= (bitIndex!0 (size!4097 (buf!4525 (_2!8064 lt!265973))) (currentByte!8603 (_2!8064 lt!265973)) (currentBit!8598 (_2!8064 lt!265973))) (bvadd (bitIndex!0 (size!4097 (buf!4525 thiss!1187)) (currentByte!8603 thiss!1187) (currentBit!8598 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!172664 () Bool)

(assert (=> b!172664 (= e!120651 (not (invariant!0 (currentBit!8598 (_2!8064 lt!265973)) (currentByte!8603 (_2!8064 lt!265973)) (size!4097 (buf!4525 (_2!8064 lt!265973))))))))

(declare-fun b!172665 () Bool)

(declare-fun res!143007 () Bool)

(assert (=> b!172665 (=> (not res!143007) (not e!120649))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172665 (= res!143007 (validate_offset_bits!1 ((_ sign_extend 32) (size!4097 (buf!4525 thiss!1187))) ((_ sign_extend 32) (currentByte!8603 thiss!1187)) ((_ sign_extend 32) (currentBit!8598 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!172666 () Bool)

(assert (=> b!172666 (= e!120649 e!120651)))

(declare-fun res!143010 () Bool)

(assert (=> b!172666 (=> (not res!143010) (not e!120651))))

(assert (=> b!172666 (= res!143010 (= (size!4097 (buf!4525 (_2!8064 lt!265973))) (size!4097 (buf!4525 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7302 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14844)

(assert (=> b!172666 (= lt!265973 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun res!143008 () Bool)

(assert (=> start!38444 (=> (not res!143008) (not e!120649))))

(assert (=> start!38444 (= res!143008 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38444 e!120649))

(assert (=> start!38444 true))

(declare-fun e!120652 () Bool)

(declare-fun inv!12 (BitStream!7302) Bool)

(assert (=> start!38444 (and (inv!12 thiss!1187) e!120652)))

(declare-fun b!172667 () Bool)

(declare-fun array_inv!3838 (array!9283) Bool)

(assert (=> b!172667 (= e!120652 (array_inv!3838 (buf!4525 thiss!1187)))))

(declare-fun b!172668 () Bool)

(declare-fun res!143006 () Bool)

(assert (=> b!172668 (=> (not res!143006) (not e!120651))))

(assert (=> b!172668 (= res!143006 (= (size!4097 (buf!4525 thiss!1187)) (size!4097 (buf!4525 (_2!8064 lt!265973)))))))

(assert (= (and start!38444 res!143008) b!172665))

(assert (= (and b!172665 res!143007) b!172662))

(assert (= (and b!172662 res!143009) b!172666))

(assert (= (and b!172666 res!143010) b!172663))

(assert (= (and b!172663 res!143005) b!172668))

(assert (= (and b!172668 res!143006) b!172664))

(assert (= start!38444 b!172667))

(declare-fun m!271811 () Bool)

(assert (=> b!172664 m!271811))

(declare-fun m!271813 () Bool)

(assert (=> b!172667 m!271813))

(declare-fun m!271815 () Bool)

(assert (=> b!172663 m!271815))

(declare-fun m!271817 () Bool)

(assert (=> b!172663 m!271817))

(declare-fun m!271819 () Bool)

(assert (=> b!172665 m!271819))

(declare-fun m!271821 () Bool)

(assert (=> start!38444 m!271821))

(declare-fun m!271823 () Bool)

(assert (=> b!172666 m!271823))

(declare-fun m!271825 () Bool)

(assert (=> b!172662 m!271825))

(check-sat (not b!172663) (not b!172664) (not b!172662) (not b!172665) (not b!172667) (not start!38444) (not b!172666))
(check-sat)
(get-model)

