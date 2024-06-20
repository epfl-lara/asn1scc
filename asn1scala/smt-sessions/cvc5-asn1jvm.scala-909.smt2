; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25528 () Bool)

(assert start!25528)

(declare-fun b!129853 () Bool)

(declare-fun e!86056 () Bool)

(declare-fun e!86053 () Bool)

(assert (=> b!129853 (= e!86056 (not e!86053))))

(declare-fun res!107586 () Bool)

(assert (=> b!129853 (=> res!107586 e!86053)))

(declare-datatypes ((array!6013 0))(
  ( (array!6014 (arr!3339 (Array (_ BitVec 32) (_ BitVec 8))) (size!2722 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4708 0))(
  ( (BitStream!4709 (buf!3080 array!6013) (currentByte!5841 (_ BitVec 32)) (currentBit!5836 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11134 0))(
  ( (tuple2!11135 (_1!5864 BitStream!4708) (_2!5864 BitStream!4708)) )
))
(declare-fun lt!200400 () tuple2!11134)

(declare-fun arr!237 () array!6013)

(declare-datatypes ((tuple2!11136 0))(
  ( (tuple2!11137 (_1!5865 BitStream!4708) (_2!5865 array!6013)) )
))
(declare-fun lt!200404 () tuple2!11136)

(assert (=> b!129853 (= res!107586 (or (not (= (size!2722 (_2!5865 lt!200404)) (size!2722 arr!237))) (not (= (_1!5865 lt!200404) (_2!5864 lt!200400)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4708 array!6013 (_ BitVec 32) (_ BitVec 32)) tuple2!11136)

(assert (=> b!129853 (= lt!200404 (readByteArrayLoopPure!0 (_1!5864 lt!200400) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8049 0))(
  ( (Unit!8050) )
))
(declare-datatypes ((tuple2!11138 0))(
  ( (tuple2!11139 (_1!5866 Unit!8049) (_2!5866 BitStream!4708)) )
))
(declare-fun lt!200396 () tuple2!11138)

(declare-fun lt!200403 () tuple2!11138)

(declare-fun lt!200405 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129853 (validate_offset_bits!1 ((_ sign_extend 32) (size!2722 (buf!3080 (_2!5866 lt!200396)))) ((_ sign_extend 32) (currentByte!5841 (_2!5866 lt!200403))) ((_ sign_extend 32) (currentBit!5836 (_2!5866 lt!200403))) lt!200405)))

(declare-fun lt!200406 () Unit!8049)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4708 array!6013 (_ BitVec 64)) Unit!8049)

(assert (=> b!129853 (= lt!200406 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5866 lt!200403) (buf!3080 (_2!5866 lt!200396)) lt!200405))))

(declare-fun reader!0 (BitStream!4708 BitStream!4708) tuple2!11134)

(assert (=> b!129853 (= lt!200400 (reader!0 (_2!5866 lt!200403) (_2!5866 lt!200396)))))

(declare-fun b!129854 () Bool)

(declare-fun res!107587 () Bool)

(declare-fun e!86054 () Bool)

(assert (=> b!129854 (=> (not res!107587) (not e!86054))))

(declare-fun thiss!1634 () BitStream!4708)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129854 (= res!107587 (= (bitIndex!0 (size!2722 (buf!3080 (_2!5866 lt!200403))) (currentByte!5841 (_2!5866 lt!200403)) (currentBit!5836 (_2!5866 lt!200403))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2722 (buf!3080 thiss!1634)) (currentByte!5841 thiss!1634) (currentBit!5836 thiss!1634)))))))

(declare-fun b!129855 () Bool)

(declare-fun res!107585 () Bool)

(assert (=> b!129855 (=> (not res!107585) (not e!86054))))

(declare-fun isPrefixOf!0 (BitStream!4708 BitStream!4708) Bool)

(assert (=> b!129855 (= res!107585 (isPrefixOf!0 thiss!1634 (_2!5866 lt!200403)))))

(declare-fun b!129856 () Bool)

(declare-fun e!86051 () Bool)

(declare-fun array_inv!2511 (array!6013) Bool)

(assert (=> b!129856 (= e!86051 (array_inv!2511 (buf!3080 thiss!1634)))))

(declare-fun b!129857 () Bool)

(declare-fun res!107594 () Bool)

(declare-fun e!86059 () Bool)

(assert (=> b!129857 (=> (not res!107594) (not e!86059))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129857 (= res!107594 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2722 (buf!3080 thiss!1634))) ((_ sign_extend 32) (currentByte!5841 thiss!1634)) ((_ sign_extend 32) (currentBit!5836 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!107596 () Bool)

(assert (=> start!25528 (=> (not res!107596) (not e!86059))))

(assert (=> start!25528 (= res!107596 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2722 arr!237))))))

(assert (=> start!25528 e!86059))

(assert (=> start!25528 true))

(assert (=> start!25528 (array_inv!2511 arr!237)))

(declare-fun inv!12 (BitStream!4708) Bool)

(assert (=> start!25528 (and (inv!12 thiss!1634) e!86051)))

(declare-fun b!129858 () Bool)

(declare-fun e!86055 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129858 (= e!86055 (invariant!0 (currentBit!5836 thiss!1634) (currentByte!5841 thiss!1634) (size!2722 (buf!3080 (_2!5866 lt!200403)))))))

(declare-fun b!129859 () Bool)

(declare-fun e!86052 () Bool)

(declare-datatypes ((tuple2!11140 0))(
  ( (tuple2!11141 (_1!5867 BitStream!4708) (_2!5867 (_ BitVec 8))) )
))
(declare-fun lt!200398 () tuple2!11140)

(declare-fun lt!200407 () tuple2!11140)

(assert (=> b!129859 (= e!86052 (= (_2!5867 lt!200398) (_2!5867 lt!200407)))))

(declare-fun b!129860 () Bool)

(declare-fun lt!200397 () tuple2!11140)

(declare-fun lt!200408 () tuple2!11134)

(assert (=> b!129860 (= e!86054 (and (= (_2!5867 lt!200397) (select (arr!3339 arr!237) from!447)) (= (_1!5867 lt!200397) (_2!5864 lt!200408))))))

(declare-fun readBytePure!0 (BitStream!4708) tuple2!11140)

(assert (=> b!129860 (= lt!200397 (readBytePure!0 (_1!5864 lt!200408)))))

(assert (=> b!129860 (= lt!200408 (reader!0 thiss!1634 (_2!5866 lt!200403)))))

(declare-fun b!129861 () Bool)

(declare-fun res!107584 () Bool)

(assert (=> b!129861 (=> (not res!107584) (not e!86059))))

(assert (=> b!129861 (= res!107584 (bvslt from!447 to!404))))

(declare-fun b!129862 () Bool)

(declare-fun res!107590 () Bool)

(assert (=> b!129862 (=> (not res!107590) (not e!86059))))

(assert (=> b!129862 (= res!107590 (invariant!0 (currentBit!5836 thiss!1634) (currentByte!5841 thiss!1634) (size!2722 (buf!3080 thiss!1634))))))

(declare-fun b!129863 () Bool)

(declare-fun res!107591 () Bool)

(assert (=> b!129863 (=> (not res!107591) (not e!86056))))

(assert (=> b!129863 (= res!107591 (isPrefixOf!0 (_2!5866 lt!200403) (_2!5866 lt!200396)))))

(declare-fun b!129864 () Bool)

(declare-fun e!86057 () Bool)

(assert (=> b!129864 (= e!86057 e!86056)))

(declare-fun res!107589 () Bool)

(assert (=> b!129864 (=> (not res!107589) (not e!86056))))

(assert (=> b!129864 (= res!107589 (= (bitIndex!0 (size!2722 (buf!3080 (_2!5866 lt!200396))) (currentByte!5841 (_2!5866 lt!200396)) (currentBit!5836 (_2!5866 lt!200396))) (bvadd (bitIndex!0 (size!2722 (buf!3080 (_2!5866 lt!200403))) (currentByte!5841 (_2!5866 lt!200403)) (currentBit!5836 (_2!5866 lt!200403))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!200405))))))

(assert (=> b!129864 (= lt!200405 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!129865 () Bool)

(declare-fun arrayRangesEq!125 (array!6013 array!6013 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129865 (= e!86053 (not (arrayRangesEq!125 arr!237 (_2!5865 lt!200404) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!129866 () Bool)

(assert (=> b!129866 (= e!86059 (not true))))

(assert (=> b!129866 e!86052))

(declare-fun res!107592 () Bool)

(assert (=> b!129866 (=> (not res!107592) (not e!86052))))

(assert (=> b!129866 (= res!107592 (= (bitIndex!0 (size!2722 (buf!3080 (_1!5867 lt!200398))) (currentByte!5841 (_1!5867 lt!200398)) (currentBit!5836 (_1!5867 lt!200398))) (bitIndex!0 (size!2722 (buf!3080 (_1!5867 lt!200407))) (currentByte!5841 (_1!5867 lt!200407)) (currentBit!5836 (_1!5867 lt!200407)))))))

(declare-fun lt!200402 () Unit!8049)

(declare-fun lt!200399 () BitStream!4708)

(declare-fun readBytePrefixLemma!0 (BitStream!4708 BitStream!4708) Unit!8049)

(assert (=> b!129866 (= lt!200402 (readBytePrefixLemma!0 lt!200399 (_2!5866 lt!200396)))))

(assert (=> b!129866 (= lt!200407 (readBytePure!0 (BitStream!4709 (buf!3080 (_2!5866 lt!200396)) (currentByte!5841 thiss!1634) (currentBit!5836 thiss!1634))))))

(assert (=> b!129866 (= lt!200398 (readBytePure!0 lt!200399))))

(assert (=> b!129866 (= lt!200399 (BitStream!4709 (buf!3080 (_2!5866 lt!200403)) (currentByte!5841 thiss!1634) (currentBit!5836 thiss!1634)))))

(assert (=> b!129866 e!86055))

(declare-fun res!107595 () Bool)

(assert (=> b!129866 (=> (not res!107595) (not e!86055))))

(assert (=> b!129866 (= res!107595 (isPrefixOf!0 thiss!1634 (_2!5866 lt!200396)))))

(declare-fun lt!200395 () Unit!8049)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4708 BitStream!4708 BitStream!4708) Unit!8049)

(assert (=> b!129866 (= lt!200395 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5866 lt!200403) (_2!5866 lt!200396)))))

(assert (=> b!129866 e!86057))

(declare-fun res!107588 () Bool)

(assert (=> b!129866 (=> (not res!107588) (not e!86057))))

(assert (=> b!129866 (= res!107588 (= (size!2722 (buf!3080 (_2!5866 lt!200403))) (size!2722 (buf!3080 (_2!5866 lt!200396)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4708 array!6013 (_ BitVec 32) (_ BitVec 32)) tuple2!11138)

(assert (=> b!129866 (= lt!200396 (appendByteArrayLoop!0 (_2!5866 lt!200403) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!129866 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2722 (buf!3080 (_2!5866 lt!200403)))) ((_ sign_extend 32) (currentByte!5841 (_2!5866 lt!200403))) ((_ sign_extend 32) (currentBit!5836 (_2!5866 lt!200403))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!200401 () Unit!8049)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4708 BitStream!4708 (_ BitVec 64) (_ BitVec 32)) Unit!8049)

(assert (=> b!129866 (= lt!200401 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5866 lt!200403) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!129866 e!86054))

(declare-fun res!107593 () Bool)

(assert (=> b!129866 (=> (not res!107593) (not e!86054))))

(assert (=> b!129866 (= res!107593 (= (size!2722 (buf!3080 thiss!1634)) (size!2722 (buf!3080 (_2!5866 lt!200403)))))))

(declare-fun appendByte!0 (BitStream!4708 (_ BitVec 8)) tuple2!11138)

(assert (=> b!129866 (= lt!200403 (appendByte!0 thiss!1634 (select (arr!3339 arr!237) from!447)))))

(assert (= (and start!25528 res!107596) b!129857))

(assert (= (and b!129857 res!107594) b!129861))

(assert (= (and b!129861 res!107584) b!129862))

(assert (= (and b!129862 res!107590) b!129866))

(assert (= (and b!129866 res!107593) b!129854))

(assert (= (and b!129854 res!107587) b!129855))

(assert (= (and b!129855 res!107585) b!129860))

(assert (= (and b!129866 res!107588) b!129864))

(assert (= (and b!129864 res!107589) b!129863))

(assert (= (and b!129863 res!107591) b!129853))

(assert (= (and b!129853 (not res!107586)) b!129865))

(assert (= (and b!129866 res!107595) b!129858))

(assert (= (and b!129866 res!107592) b!129859))

(assert (= start!25528 b!129856))

(declare-fun m!195781 () Bool)

(assert (=> b!129863 m!195781))

(declare-fun m!195783 () Bool)

(assert (=> b!129857 m!195783))

(declare-fun m!195785 () Bool)

(assert (=> b!129856 m!195785))

(declare-fun m!195787 () Bool)

(assert (=> start!25528 m!195787))

(declare-fun m!195789 () Bool)

(assert (=> start!25528 m!195789))

(declare-fun m!195791 () Bool)

(assert (=> b!129864 m!195791))

(declare-fun m!195793 () Bool)

(assert (=> b!129864 m!195793))

(assert (=> b!129854 m!195793))

(declare-fun m!195795 () Bool)

(assert (=> b!129854 m!195795))

(declare-fun m!195797 () Bool)

(assert (=> b!129860 m!195797))

(declare-fun m!195799 () Bool)

(assert (=> b!129860 m!195799))

(declare-fun m!195801 () Bool)

(assert (=> b!129860 m!195801))

(declare-fun m!195803 () Bool)

(assert (=> b!129858 m!195803))

(declare-fun m!195805 () Bool)

(assert (=> b!129862 m!195805))

(declare-fun m!195807 () Bool)

(assert (=> b!129855 m!195807))

(declare-fun m!195809 () Bool)

(assert (=> b!129866 m!195809))

(declare-fun m!195811 () Bool)

(assert (=> b!129866 m!195811))

(declare-fun m!195813 () Bool)

(assert (=> b!129866 m!195813))

(declare-fun m!195815 () Bool)

(assert (=> b!129866 m!195815))

(assert (=> b!129866 m!195797))

(declare-fun m!195817 () Bool)

(assert (=> b!129866 m!195817))

(assert (=> b!129866 m!195797))

(declare-fun m!195819 () Bool)

(assert (=> b!129866 m!195819))

(declare-fun m!195821 () Bool)

(assert (=> b!129866 m!195821))

(declare-fun m!195823 () Bool)

(assert (=> b!129866 m!195823))

(declare-fun m!195825 () Bool)

(assert (=> b!129866 m!195825))

(declare-fun m!195827 () Bool)

(assert (=> b!129866 m!195827))

(declare-fun m!195829 () Bool)

(assert (=> b!129866 m!195829))

(declare-fun m!195831 () Bool)

(assert (=> b!129865 m!195831))

(declare-fun m!195833 () Bool)

(assert (=> b!129853 m!195833))

(declare-fun m!195835 () Bool)

(assert (=> b!129853 m!195835))

(declare-fun m!195837 () Bool)

(assert (=> b!129853 m!195837))

(declare-fun m!195839 () Bool)

(assert (=> b!129853 m!195839))

(push 1)

(assert (not b!129854))

(assert (not b!129857))

(assert (not b!129860))

(assert (not b!129856))

(assert (not b!129853))

(assert (not b!129858))

(assert (not b!129863))

(assert (not b!129862))

(assert (not b!129865))

(assert (not start!25528))

(assert (not b!129864))

(assert (not b!129866))

(assert (not b!129855))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

