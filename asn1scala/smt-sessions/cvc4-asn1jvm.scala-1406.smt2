; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38696 () Bool)

(assert start!38696)

(declare-fun b!174152 () Bool)

(declare-fun res!144226 () Bool)

(declare-fun e!121487 () Bool)

(assert (=> b!174152 (=> (not res!144226) (not e!121487))))

(declare-datatypes ((array!9371 0))(
  ( (array!9372 (arr!5064 (Array (_ BitVec 32) (_ BitVec 8))) (size!4134 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7376 0))(
  ( (BitStream!7377 (buf!4565 array!9371) (currentByte!8679 (_ BitVec 32)) (currentBit!8674 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7376)

(declare-datatypes ((Unit!12522 0))(
  ( (Unit!12523) )
))
(declare-datatypes ((tuple2!15012 0))(
  ( (tuple2!15013 (_1!8148 Unit!12522) (_2!8148 BitStream!7376)) )
))
(declare-fun lt!268684 () tuple2!15012)

(declare-fun isPrefixOf!0 (BitStream!7376 BitStream!7376) Bool)

(assert (=> b!174152 (= res!144226 (isPrefixOf!0 thiss!1187 (_2!8148 lt!268684)))))

(declare-fun res!144222 () Bool)

(declare-fun e!121486 () Bool)

(assert (=> start!38696 (=> (not res!144222) (not e!121486))))

(declare-fun nBits!340 () (_ BitVec 32))

(assert (=> start!38696 (= res!144222 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38696 e!121486))

(assert (=> start!38696 true))

(declare-fun e!121488 () Bool)

(declare-fun inv!12 (BitStream!7376) Bool)

(assert (=> start!38696 (and (inv!12 thiss!1187) e!121488)))

(declare-fun b!174153 () Bool)

(declare-fun res!144223 () Bool)

(assert (=> b!174153 (=> (not res!144223) (not e!121487))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!174153 (= res!144223 (= (bitIndex!0 (size!4134 (buf!4565 (_2!8148 lt!268684))) (currentByte!8679 (_2!8148 lt!268684)) (currentBit!8674 (_2!8148 lt!268684))) (bvadd (bitIndex!0 (size!4134 (buf!4565 thiss!1187)) (currentByte!8679 thiss!1187) (currentBit!8674 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!174154 () Bool)

(assert (=> b!174154 (= e!121486 e!121487)))

(declare-fun res!144225 () Bool)

(assert (=> b!174154 (=> (not res!144225) (not e!121487))))

(assert (=> b!174154 (= res!144225 (= (size!4134 (buf!4565 (_2!8148 lt!268684))) (size!4134 (buf!4565 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7376 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15012)

(assert (=> b!174154 (= lt!268684 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!174155 () Bool)

(assert (=> b!174155 (= e!121487 false)))

(declare-datatypes ((tuple2!15014 0))(
  ( (tuple2!15015 (_1!8149 BitStream!7376) (_2!8149 BitStream!7376)) )
))
(declare-fun lt!268685 () tuple2!15014)

(declare-fun reader!0 (BitStream!7376 BitStream!7376) tuple2!15014)

(assert (=> b!174155 (= lt!268685 (reader!0 thiss!1187 (_2!8148 lt!268684)))))

(declare-fun b!174156 () Bool)

(declare-fun res!144227 () Bool)

(assert (=> b!174156 (=> (not res!144227) (not e!121486))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!174156 (= res!144227 (validate_offset_bits!1 ((_ sign_extend 32) (size!4134 (buf!4565 thiss!1187))) ((_ sign_extend 32) (currentByte!8679 thiss!1187)) ((_ sign_extend 32) (currentBit!8674 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!174157 () Bool)

(declare-fun array_inv!3875 (array!9371) Bool)

(assert (=> b!174157 (= e!121488 (array_inv!3875 (buf!4565 thiss!1187)))))

(declare-fun b!174158 () Bool)

(declare-fun res!144228 () Bool)

(assert (=> b!174158 (=> (not res!144228) (not e!121487))))

(assert (=> b!174158 (= res!144228 (= (size!4134 (buf!4565 thiss!1187)) (size!4134 (buf!4565 (_2!8148 lt!268684)))))))

(declare-fun b!174159 () Bool)

(declare-fun res!144224 () Bool)

(assert (=> b!174159 (=> (not res!144224) (not e!121486))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!174159 (= res!144224 (invariant!0 (currentBit!8674 thiss!1187) (currentByte!8679 thiss!1187) (size!4134 (buf!4565 thiss!1187))))))

(assert (= (and start!38696 res!144222) b!174156))

(assert (= (and b!174156 res!144227) b!174159))

(assert (= (and b!174159 res!144224) b!174154))

(assert (= (and b!174154 res!144225) b!174153))

(assert (= (and b!174153 res!144223) b!174158))

(assert (= (and b!174158 res!144228) b!174152))

(assert (= (and b!174152 res!144226) b!174155))

(assert (= start!38696 b!174157))

(declare-fun m!273549 () Bool)

(assert (=> b!174156 m!273549))

(declare-fun m!273551 () Bool)

(assert (=> b!174153 m!273551))

(declare-fun m!273553 () Bool)

(assert (=> b!174153 m!273553))

(declare-fun m!273555 () Bool)

(assert (=> b!174157 m!273555))

(declare-fun m!273557 () Bool)

(assert (=> b!174154 m!273557))

(declare-fun m!273559 () Bool)

(assert (=> start!38696 m!273559))

(declare-fun m!273561 () Bool)

(assert (=> b!174159 m!273561))

(declare-fun m!273563 () Bool)

(assert (=> b!174152 m!273563))

(declare-fun m!273565 () Bool)

(assert (=> b!174155 m!273565))

(push 1)

(assert (not b!174156))

(assert (not b!174152))

(assert (not b!174159))

(assert (not b!174154))

(assert (not b!174153))

(assert (not start!38696))

(assert (not b!174155))

(assert (not b!174157))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

