; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38514 () Bool)

(assert start!38514)

(declare-fun b!173198 () Bool)

(declare-fun res!143454 () Bool)

(declare-fun e!120947 () Bool)

(assert (=> b!173198 (=> (not res!143454) (not e!120947))))

(declare-datatypes ((array!9320 0))(
  ( (array!9321 (arr!5044 (Array (_ BitVec 32) (_ BitVec 8))) (size!4114 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7336 0))(
  ( (BitStream!7337 (buf!4542 array!9320) (currentByte!8629 (_ BitVec 32)) (currentBit!8624 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7336)

(declare-fun nBits!340 () (_ BitVec 32))

(declare-datatypes ((Unit!12397 0))(
  ( (Unit!12398) )
))
(declare-datatypes ((tuple2!14908 0))(
  ( (tuple2!14909 (_1!8096 Unit!12397) (_2!8096 BitStream!7336)) )
))
(declare-fun lt!266659 () tuple2!14908)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173198 (= res!143454 (= (bitIndex!0 (size!4114 (buf!4542 (_2!8096 lt!266659))) (currentByte!8629 (_2!8096 lt!266659)) (currentBit!8624 (_2!8096 lt!266659))) (bvadd (bitIndex!0 (size!4114 (buf!4542 thiss!1187)) (currentByte!8629 thiss!1187) (currentBit!8624 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!173199 () Bool)

(assert (=> b!173199 (= e!120947 (not true))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173199 (validate_offset_bits!1 ((_ sign_extend 32) (size!4114 (buf!4542 (_2!8096 lt!266659)))) ((_ sign_extend 32) (currentByte!8629 thiss!1187)) ((_ sign_extend 32) (currentBit!8624 thiss!1187)) ((_ sign_extend 32) nBits!340))))

(declare-fun lt!266660 () Unit!12397)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7336 array!9320 (_ BitVec 64)) Unit!12397)

(assert (=> b!173199 (= lt!266660 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4542 (_2!8096 lt!266659)) ((_ sign_extend 32) nBits!340)))))

(declare-datatypes ((tuple2!14910 0))(
  ( (tuple2!14911 (_1!8097 BitStream!7336) (_2!8097 BitStream!7336)) )
))
(declare-fun lt!266658 () tuple2!14910)

(declare-fun reader!0 (BitStream!7336 BitStream!7336) tuple2!14910)

(assert (=> b!173199 (= lt!266658 (reader!0 thiss!1187 (_2!8096 lt!266659)))))

(declare-fun b!173200 () Bool)

(declare-fun res!143457 () Bool)

(declare-fun e!120948 () Bool)

(assert (=> b!173200 (=> (not res!143457) (not e!120948))))

(assert (=> b!173200 (= res!143457 (validate_offset_bits!1 ((_ sign_extend 32) (size!4114 (buf!4542 thiss!1187))) ((_ sign_extend 32) (currentByte!8629 thiss!1187)) ((_ sign_extend 32) (currentBit!8624 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!173201 () Bool)

(declare-fun res!143460 () Bool)

(assert (=> b!173201 (=> (not res!143460) (not e!120947))))

(declare-fun isPrefixOf!0 (BitStream!7336 BitStream!7336) Bool)

(assert (=> b!173201 (= res!143460 (isPrefixOf!0 thiss!1187 (_2!8096 lt!266659)))))

(declare-fun b!173202 () Bool)

(declare-fun e!120949 () Bool)

(declare-fun array_inv!3855 (array!9320) Bool)

(assert (=> b!173202 (= e!120949 (array_inv!3855 (buf!4542 thiss!1187)))))

(declare-fun b!173203 () Bool)

(declare-fun res!143456 () Bool)

(assert (=> b!173203 (=> (not res!143456) (not e!120948))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173203 (= res!143456 (invariant!0 (currentBit!8624 thiss!1187) (currentByte!8629 thiss!1187) (size!4114 (buf!4542 thiss!1187))))))

(declare-fun res!143458 () Bool)

(assert (=> start!38514 (=> (not res!143458) (not e!120948))))

(assert (=> start!38514 (= res!143458 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38514 e!120948))

(assert (=> start!38514 true))

(declare-fun inv!12 (BitStream!7336) Bool)

(assert (=> start!38514 (and (inv!12 thiss!1187) e!120949)))

(declare-fun b!173204 () Bool)

(assert (=> b!173204 (= e!120948 e!120947)))

(declare-fun res!143459 () Bool)

(assert (=> b!173204 (=> (not res!143459) (not e!120947))))

(assert (=> b!173204 (= res!143459 (= (size!4114 (buf!4542 (_2!8096 lt!266659))) (size!4114 (buf!4542 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7336 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14908)

(assert (=> b!173204 (= lt!266659 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!173205 () Bool)

(declare-fun res!143455 () Bool)

(assert (=> b!173205 (=> (not res!143455) (not e!120947))))

(assert (=> b!173205 (= res!143455 (= (size!4114 (buf!4542 thiss!1187)) (size!4114 (buf!4542 (_2!8096 lt!266659)))))))

(assert (= (and start!38514 res!143458) b!173200))

(assert (= (and b!173200 res!143457) b!173203))

(assert (= (and b!173203 res!143456) b!173204))

(assert (= (and b!173204 res!143459) b!173198))

(assert (= (and b!173198 res!143454) b!173205))

(assert (= (and b!173205 res!143455) b!173201))

(assert (= (and b!173201 res!143460) b!173199))

(assert (= start!38514 b!173202))

(declare-fun m!272295 () Bool)

(assert (=> b!173201 m!272295))

(declare-fun m!272297 () Bool)

(assert (=> b!173203 m!272297))

(declare-fun m!272299 () Bool)

(assert (=> b!173200 m!272299))

(declare-fun m!272301 () Bool)

(assert (=> start!38514 m!272301))

(declare-fun m!272303 () Bool)

(assert (=> b!173204 m!272303))

(declare-fun m!272305 () Bool)

(assert (=> b!173199 m!272305))

(declare-fun m!272307 () Bool)

(assert (=> b!173199 m!272307))

(declare-fun m!272309 () Bool)

(assert (=> b!173199 m!272309))

(declare-fun m!272311 () Bool)

(assert (=> b!173202 m!272311))

(declare-fun m!272313 () Bool)

(assert (=> b!173198 m!272313))

(declare-fun m!272315 () Bool)

(assert (=> b!173198 m!272315))

(push 1)

(assert (not b!173204))

(assert (not b!173203))

(assert (not b!173198))

(assert (not b!173201))

(assert (not b!173199))

(assert (not b!173202))

(assert (not start!38514))

(assert (not b!173200))

(check-sat)

(pop 1)

