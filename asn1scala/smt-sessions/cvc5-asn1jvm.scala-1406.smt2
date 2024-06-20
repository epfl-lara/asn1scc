; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38692 () Bool)

(assert start!38692)

(declare-fun b!174104 () Bool)

(declare-fun res!144184 () Bool)

(declare-fun e!121462 () Bool)

(assert (=> b!174104 (=> (not res!144184) (not e!121462))))

(declare-datatypes ((array!9367 0))(
  ( (array!9368 (arr!5062 (Array (_ BitVec 32) (_ BitVec 8))) (size!4132 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7372 0))(
  ( (BitStream!7373 (buf!4563 array!9367) (currentByte!8677 (_ BitVec 32)) (currentBit!8672 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7372)

(declare-datatypes ((Unit!12518 0))(
  ( (Unit!12519) )
))
(declare-datatypes ((tuple2!15004 0))(
  ( (tuple2!15005 (_1!8144 Unit!12518) (_2!8144 BitStream!7372)) )
))
(declare-fun lt!268672 () tuple2!15004)

(declare-fun isPrefixOf!0 (BitStream!7372 BitStream!7372) Bool)

(assert (=> b!174104 (= res!144184 (isPrefixOf!0 thiss!1187 (_2!8144 lt!268672)))))

(declare-fun b!174105 () Bool)

(declare-fun res!144183 () Bool)

(declare-fun e!121464 () Bool)

(assert (=> b!174105 (=> (not res!144183) (not e!121464))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!174105 (= res!144183 (invariant!0 (currentBit!8672 thiss!1187) (currentByte!8677 thiss!1187) (size!4132 (buf!4563 thiss!1187))))))

(declare-fun b!174106 () Bool)

(declare-fun e!121465 () Bool)

(declare-fun array_inv!3873 (array!9367) Bool)

(assert (=> b!174106 (= e!121465 (array_inv!3873 (buf!4563 thiss!1187)))))

(declare-fun b!174107 () Bool)

(assert (=> b!174107 (= e!121462 false)))

(declare-datatypes ((tuple2!15006 0))(
  ( (tuple2!15007 (_1!8145 BitStream!7372) (_2!8145 BitStream!7372)) )
))
(declare-fun lt!268673 () tuple2!15006)

(declare-fun reader!0 (BitStream!7372 BitStream!7372) tuple2!15006)

(assert (=> b!174107 (= lt!268673 (reader!0 thiss!1187 (_2!8144 lt!268672)))))

(declare-fun b!174108 () Bool)

(declare-fun res!144180 () Bool)

(assert (=> b!174108 (=> (not res!144180) (not e!121462))))

(assert (=> b!174108 (= res!144180 (= (size!4132 (buf!4563 thiss!1187)) (size!4132 (buf!4563 (_2!8144 lt!268672)))))))

(declare-fun b!174109 () Bool)

(declare-fun res!144186 () Bool)

(assert (=> b!174109 (=> (not res!144186) (not e!121462))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!174109 (= res!144186 (= (bitIndex!0 (size!4132 (buf!4563 (_2!8144 lt!268672))) (currentByte!8677 (_2!8144 lt!268672)) (currentBit!8672 (_2!8144 lt!268672))) (bvadd (bitIndex!0 (size!4132 (buf!4563 thiss!1187)) (currentByte!8677 thiss!1187) (currentBit!8672 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!174111 () Bool)

(assert (=> b!174111 (= e!121464 e!121462)))

(declare-fun res!144185 () Bool)

(assert (=> b!174111 (=> (not res!144185) (not e!121462))))

(assert (=> b!174111 (= res!144185 (= (size!4132 (buf!4563 (_2!8144 lt!268672))) (size!4132 (buf!4563 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7372 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15004)

(assert (=> b!174111 (= lt!268672 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!174110 () Bool)

(declare-fun res!144181 () Bool)

(assert (=> b!174110 (=> (not res!144181) (not e!121464))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!174110 (= res!144181 (validate_offset_bits!1 ((_ sign_extend 32) (size!4132 (buf!4563 thiss!1187))) ((_ sign_extend 32) (currentByte!8677 thiss!1187)) ((_ sign_extend 32) (currentBit!8672 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun res!144182 () Bool)

(assert (=> start!38692 (=> (not res!144182) (not e!121464))))

(assert (=> start!38692 (= res!144182 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38692 e!121464))

(assert (=> start!38692 true))

(declare-fun inv!12 (BitStream!7372) Bool)

(assert (=> start!38692 (and (inv!12 thiss!1187) e!121465)))

(assert (= (and start!38692 res!144182) b!174110))

(assert (= (and b!174110 res!144181) b!174105))

(assert (= (and b!174105 res!144183) b!174111))

(assert (= (and b!174111 res!144185) b!174109))

(assert (= (and b!174109 res!144186) b!174108))

(assert (= (and b!174108 res!144180) b!174104))

(assert (= (and b!174104 res!144184) b!174107))

(assert (= start!38692 b!174106))

(declare-fun m!273513 () Bool)

(assert (=> b!174111 m!273513))

(declare-fun m!273515 () Bool)

(assert (=> b!174109 m!273515))

(declare-fun m!273517 () Bool)

(assert (=> b!174109 m!273517))

(declare-fun m!273519 () Bool)

(assert (=> b!174105 m!273519))

(declare-fun m!273521 () Bool)

(assert (=> b!174110 m!273521))

(declare-fun m!273523 () Bool)

(assert (=> start!38692 m!273523))

(declare-fun m!273525 () Bool)

(assert (=> b!174106 m!273525))

(declare-fun m!273527 () Bool)

(assert (=> b!174104 m!273527))

(declare-fun m!273529 () Bool)

(assert (=> b!174107 m!273529))

(push 1)

(assert (not b!174104))

(assert (not b!174106))

(assert (not b!174109))

(assert (not b!174107))

(assert (not b!174111))

(assert (not b!174110))

(assert (not b!174105))

(assert (not start!38692))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

