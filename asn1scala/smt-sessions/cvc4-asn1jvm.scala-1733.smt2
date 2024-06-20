; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47748 () Bool)

(assert start!47748)

(declare-fun b!227297 () Bool)

(declare-fun e!155529 () Bool)

(assert (=> b!227297 (= e!155529 (not true))))

(declare-datatypes ((array!11415 0))(
  ( (array!11416 (arr!5982 (Array (_ BitVec 32) (_ BitVec 8))) (size!5007 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11415)

(declare-fun lt!363180 () array!11415)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun arrayRangesEq!843 (array!11415 array!11415 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227297 (arrayRangesEq!843 arr!308 lt!363180 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16957 0))(
  ( (Unit!16958) )
))
(declare-fun lt!363183 () Unit!16957)

(declare-datatypes ((BitStream!9110 0))(
  ( (BitStream!9111 (buf!5548 array!11415) (currentByte!10386 (_ BitVec 32)) (currentBit!10381 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19536 0))(
  ( (tuple2!19537 (_1!10608 (_ BitVec 8)) (_2!10608 BitStream!9110)) )
))
(declare-fun lt!363176 () tuple2!19536)

(declare-fun arrayUpdatedAtPrefixLemma!402 (array!11415 (_ BitVec 32) (_ BitVec 8)) Unit!16957)

(assert (=> b!227297 (= lt!363183 (arrayUpdatedAtPrefixLemma!402 arr!308 i!761 (_1!10608 lt!363176)))))

(declare-fun lt!363182 () (_ BitVec 32))

(declare-fun thiss!1870 () BitStream!9110)

(declare-fun lt!363181 () (_ BitVec 64))

(declare-fun lt!363177 () (_ BitVec 64))

(declare-fun to!496 () (_ BitVec 32))

(declare-datatypes ((tuple3!1396 0))(
  ( (tuple3!1397 (_1!10609 Unit!16957) (_2!10609 BitStream!9110) (_3!840 array!11415)) )
))
(declare-fun lt!363175 () tuple3!1396)

(declare-fun lt!363178 () (_ BitVec 64))

(assert (=> b!227297 (and (= (bvadd lt!363181 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!363182))) lt!363178) (= (bvadd lt!363177 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!363178) (= (buf!5548 thiss!1870) (buf!5548 (_2!10609 lt!363175))) (= (size!5007 arr!308) (size!5007 (_3!840 lt!363175))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227297 (= lt!363178 (bitIndex!0 (size!5007 (buf!5548 (_2!10609 lt!363175))) (currentByte!10386 (_2!10609 lt!363175)) (currentBit!10381 (_2!10609 lt!363175))))))

(assert (=> b!227297 (= lt!363181 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!363177))))

(assert (=> b!227297 (= lt!363181 (bitIndex!0 (size!5007 (buf!5548 (_2!10608 lt!363176))) (currentByte!10386 (_2!10608 lt!363176)) (currentBit!10381 (_2!10608 lt!363176))))))

(assert (=> b!227297 (= lt!363177 (bitIndex!0 (size!5007 (buf!5548 thiss!1870)) (currentByte!10386 thiss!1870) (currentBit!10381 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9110 array!11415 (_ BitVec 32) (_ BitVec 32)) tuple3!1396)

(assert (=> b!227297 (= lt!363175 (readByteArrayLoop!0 (_2!10608 lt!363176) lt!363180 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227297 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5007 (buf!5548 (_2!10608 lt!363176)))) ((_ sign_extend 32) (currentByte!10386 (_2!10608 lt!363176))) ((_ sign_extend 32) (currentBit!10381 (_2!10608 lt!363176))) lt!363182)))

(assert (=> b!227297 (= lt!363182 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!363179 () Unit!16957)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9110 BitStream!9110 (_ BitVec 64) (_ BitVec 32)) Unit!16957)

(assert (=> b!227297 (= lt!363179 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10608 lt!363176) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227297 (= lt!363180 (array!11416 (store (arr!5982 arr!308) i!761 (_1!10608 lt!363176)) (size!5007 arr!308)))))

(declare-fun readByte!0 (BitStream!9110) tuple2!19536)

(assert (=> b!227297 (= lt!363176 (readByte!0 thiss!1870))))

(declare-fun res!190689 () Bool)

(assert (=> start!47748 (=> (not res!190689) (not e!155529))))

(assert (=> start!47748 (= res!190689 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5007 arr!308))))))

(assert (=> start!47748 e!155529))

(assert (=> start!47748 true))

(declare-fun array_inv!4748 (array!11415) Bool)

(assert (=> start!47748 (array_inv!4748 arr!308)))

(declare-fun e!155530 () Bool)

(declare-fun inv!12 (BitStream!9110) Bool)

(assert (=> start!47748 (and (inv!12 thiss!1870) e!155530)))

(declare-fun b!227295 () Bool)

(declare-fun res!190688 () Bool)

(assert (=> b!227295 (=> (not res!190688) (not e!155529))))

(assert (=> b!227295 (= res!190688 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5007 (buf!5548 thiss!1870))) ((_ sign_extend 32) (currentByte!10386 thiss!1870)) ((_ sign_extend 32) (currentBit!10381 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227298 () Bool)

(assert (=> b!227298 (= e!155530 (array_inv!4748 (buf!5548 thiss!1870)))))

(declare-fun b!227296 () Bool)

(declare-fun res!190690 () Bool)

(assert (=> b!227296 (=> (not res!190690) (not e!155529))))

(assert (=> b!227296 (= res!190690 (bvslt i!761 to!496))))

(assert (= (and start!47748 res!190689) b!227295))

(assert (= (and b!227295 res!190688) b!227296))

(assert (= (and b!227296 res!190690) b!227297))

(assert (= start!47748 b!227298))

(declare-fun m!349527 () Bool)

(assert (=> b!227297 m!349527))

(declare-fun m!349529 () Bool)

(assert (=> b!227297 m!349529))

(declare-fun m!349531 () Bool)

(assert (=> b!227297 m!349531))

(declare-fun m!349533 () Bool)

(assert (=> b!227297 m!349533))

(declare-fun m!349535 () Bool)

(assert (=> b!227297 m!349535))

(declare-fun m!349537 () Bool)

(assert (=> b!227297 m!349537))

(declare-fun m!349539 () Bool)

(assert (=> b!227297 m!349539))

(declare-fun m!349541 () Bool)

(assert (=> b!227297 m!349541))

(declare-fun m!349543 () Bool)

(assert (=> b!227297 m!349543))

(declare-fun m!349545 () Bool)

(assert (=> b!227297 m!349545))

(declare-fun m!349547 () Bool)

(assert (=> start!47748 m!349547))

(declare-fun m!349549 () Bool)

(assert (=> start!47748 m!349549))

(declare-fun m!349551 () Bool)

(assert (=> b!227295 m!349551))

(declare-fun m!349553 () Bool)

(assert (=> b!227298 m!349553))

(push 1)

(assert (not start!47748))

(assert (not b!227297))

(assert (not b!227295))

(assert (not b!227298))

(check-sat)

(pop 1)

