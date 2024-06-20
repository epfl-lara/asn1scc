; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25676 () Bool)

(assert start!25676)

(declare-fun b!130963 () Bool)

(declare-fun e!86810 () Bool)

(declare-fun e!86812 () Bool)

(assert (=> b!130963 (= e!86810 (not e!86812))))

(declare-fun res!108605 () Bool)

(assert (=> b!130963 (=> res!108605 e!86812)))

(declare-datatypes ((array!6056 0))(
  ( (array!6057 (arr!3365 (Array (_ BitVec 32) (_ BitVec 8))) (size!2742 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4748 0))(
  ( (BitStream!4749 (buf!3103 array!6056) (currentByte!5876 (_ BitVec 32)) (currentBit!5871 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11300 0))(
  ( (tuple2!11301 (_1!5950 BitStream!4748) (_2!5950 array!6056)) )
))
(declare-fun lt!202005 () tuple2!11300)

(declare-fun arr!237 () array!6056)

(declare-datatypes ((tuple2!11302 0))(
  ( (tuple2!11303 (_1!5951 BitStream!4748) (_2!5951 BitStream!4748)) )
))
(declare-fun lt!202001 () tuple2!11302)

(assert (=> b!130963 (= res!108605 (or (not (= (size!2742 (_2!5950 lt!202005)) (size!2742 arr!237))) (not (= (_1!5950 lt!202005) (_2!5951 lt!202001)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4748 array!6056 (_ BitVec 32) (_ BitVec 32)) tuple2!11300)

(assert (=> b!130963 (= lt!202005 (readByteArrayLoopPure!0 (_1!5951 lt!202001) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8098 0))(
  ( (Unit!8099) )
))
(declare-datatypes ((tuple2!11304 0))(
  ( (tuple2!11305 (_1!5952 Unit!8098) (_2!5952 BitStream!4748)) )
))
(declare-fun lt!202000 () tuple2!11304)

(declare-fun lt!202012 () tuple2!11304)

(declare-fun lt!202011 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130963 (validate_offset_bits!1 ((_ sign_extend 32) (size!2742 (buf!3103 (_2!5952 lt!202000)))) ((_ sign_extend 32) (currentByte!5876 (_2!5952 lt!202012))) ((_ sign_extend 32) (currentBit!5871 (_2!5952 lt!202012))) lt!202011)))

(declare-fun lt!202010 () Unit!8098)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4748 array!6056 (_ BitVec 64)) Unit!8098)

(assert (=> b!130963 (= lt!202010 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5952 lt!202012) (buf!3103 (_2!5952 lt!202000)) lt!202011))))

(declare-fun reader!0 (BitStream!4748 BitStream!4748) tuple2!11302)

(assert (=> b!130963 (= lt!202001 (reader!0 (_2!5952 lt!202012) (_2!5952 lt!202000)))))

(declare-fun res!108616 () Bool)

(declare-fun e!86811 () Bool)

(assert (=> start!25676 (=> (not res!108616) (not e!86811))))

(assert (=> start!25676 (= res!108616 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2742 arr!237))))))

(assert (=> start!25676 e!86811))

(assert (=> start!25676 true))

(declare-fun array_inv!2531 (array!6056) Bool)

(assert (=> start!25676 (array_inv!2531 arr!237)))

(declare-fun thiss!1634 () BitStream!4748)

(declare-fun e!86804 () Bool)

(declare-fun inv!12 (BitStream!4748) Bool)

(assert (=> start!25676 (and (inv!12 thiss!1634) e!86804)))

(declare-fun b!130964 () Bool)

(declare-fun e!86805 () Bool)

(assert (=> b!130964 (= e!86805 e!86810)))

(declare-fun res!108612 () Bool)

(assert (=> b!130964 (=> (not res!108612) (not e!86810))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!130964 (= res!108612 (= (bitIndex!0 (size!2742 (buf!3103 (_2!5952 lt!202000))) (currentByte!5876 (_2!5952 lt!202000)) (currentBit!5871 (_2!5952 lt!202000))) (bvadd (bitIndex!0 (size!2742 (buf!3103 (_2!5952 lt!202012))) (currentByte!5876 (_2!5952 lt!202012)) (currentBit!5871 (_2!5952 lt!202012))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!202011))))))

(assert (=> b!130964 (= lt!202011 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!130965 () Bool)

(declare-fun res!108614 () Bool)

(assert (=> b!130965 (=> (not res!108614) (not e!86810))))

(declare-fun isPrefixOf!0 (BitStream!4748 BitStream!4748) Bool)

(assert (=> b!130965 (= res!108614 (isPrefixOf!0 (_2!5952 lt!202012) (_2!5952 lt!202000)))))

(declare-fun b!130966 () Bool)

(declare-fun res!108613 () Bool)

(declare-fun e!86806 () Bool)

(assert (=> b!130966 (=> (not res!108613) (not e!86806))))

(assert (=> b!130966 (= res!108613 (isPrefixOf!0 thiss!1634 (_2!5952 lt!202012)))))

(declare-fun b!130967 () Bool)

(assert (=> b!130967 (= e!86811 (not true))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!130967 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2742 (buf!3103 (_2!5952 lt!202000)))) ((_ sign_extend 32) (currentByte!5876 thiss!1634)) ((_ sign_extend 32) (currentBit!5871 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!202013 () Unit!8098)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4748 array!6056 (_ BitVec 32)) Unit!8098)

(assert (=> b!130967 (= lt!202013 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3103 (_2!5952 lt!202000)) (bvsub to!404 from!447)))))

(declare-fun lt!202008 () tuple2!11302)

(declare-datatypes ((tuple2!11306 0))(
  ( (tuple2!11307 (_1!5953 BitStream!4748) (_2!5953 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!4748) tuple2!11306)

(assert (=> b!130967 (= (_2!5953 (readBytePure!0 (_1!5951 lt!202008))) (select (arr!3365 arr!237) from!447))))

(declare-fun lt!202003 () tuple2!11302)

(assert (=> b!130967 (= lt!202003 (reader!0 (_2!5952 lt!202012) (_2!5952 lt!202000)))))

(assert (=> b!130967 (= lt!202008 (reader!0 thiss!1634 (_2!5952 lt!202000)))))

(declare-fun e!86809 () Bool)

(assert (=> b!130967 e!86809))

(declare-fun res!108609 () Bool)

(assert (=> b!130967 (=> (not res!108609) (not e!86809))))

(declare-fun lt!202009 () tuple2!11306)

(declare-fun lt!201999 () tuple2!11306)

(assert (=> b!130967 (= res!108609 (= (bitIndex!0 (size!2742 (buf!3103 (_1!5953 lt!202009))) (currentByte!5876 (_1!5953 lt!202009)) (currentBit!5871 (_1!5953 lt!202009))) (bitIndex!0 (size!2742 (buf!3103 (_1!5953 lt!201999))) (currentByte!5876 (_1!5953 lt!201999)) (currentBit!5871 (_1!5953 lt!201999)))))))

(declare-fun lt!201997 () Unit!8098)

(declare-fun lt!202006 () BitStream!4748)

(declare-fun readBytePrefixLemma!0 (BitStream!4748 BitStream!4748) Unit!8098)

(assert (=> b!130967 (= lt!201997 (readBytePrefixLemma!0 lt!202006 (_2!5952 lt!202000)))))

(assert (=> b!130967 (= lt!201999 (readBytePure!0 (BitStream!4749 (buf!3103 (_2!5952 lt!202000)) (currentByte!5876 thiss!1634) (currentBit!5871 thiss!1634))))))

(assert (=> b!130967 (= lt!202009 (readBytePure!0 lt!202006))))

(assert (=> b!130967 (= lt!202006 (BitStream!4749 (buf!3103 (_2!5952 lt!202012)) (currentByte!5876 thiss!1634) (currentBit!5871 thiss!1634)))))

(declare-fun e!86813 () Bool)

(assert (=> b!130967 e!86813))

(declare-fun res!108611 () Bool)

(assert (=> b!130967 (=> (not res!108611) (not e!86813))))

(assert (=> b!130967 (= res!108611 (isPrefixOf!0 thiss!1634 (_2!5952 lt!202000)))))

(declare-fun lt!202002 () Unit!8098)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4748 BitStream!4748 BitStream!4748) Unit!8098)

(assert (=> b!130967 (= lt!202002 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5952 lt!202012) (_2!5952 lt!202000)))))

(assert (=> b!130967 e!86805))

(declare-fun res!108608 () Bool)

(assert (=> b!130967 (=> (not res!108608) (not e!86805))))

(assert (=> b!130967 (= res!108608 (= (size!2742 (buf!3103 (_2!5952 lt!202012))) (size!2742 (buf!3103 (_2!5952 lt!202000)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4748 array!6056 (_ BitVec 32) (_ BitVec 32)) tuple2!11304)

(assert (=> b!130967 (= lt!202000 (appendByteArrayLoop!0 (_2!5952 lt!202012) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!130967 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2742 (buf!3103 (_2!5952 lt!202012)))) ((_ sign_extend 32) (currentByte!5876 (_2!5952 lt!202012))) ((_ sign_extend 32) (currentBit!5871 (_2!5952 lt!202012))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!202004 () Unit!8098)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4748 BitStream!4748 (_ BitVec 64) (_ BitVec 32)) Unit!8098)

(assert (=> b!130967 (= lt!202004 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5952 lt!202012) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!130967 e!86806))

(declare-fun res!108610 () Bool)

(assert (=> b!130967 (=> (not res!108610) (not e!86806))))

(assert (=> b!130967 (= res!108610 (= (size!2742 (buf!3103 thiss!1634)) (size!2742 (buf!3103 (_2!5952 lt!202012)))))))

(declare-fun appendByte!0 (BitStream!4748 (_ BitVec 8)) tuple2!11304)

(assert (=> b!130967 (= lt!202012 (appendByte!0 thiss!1634 (select (arr!3365 arr!237) from!447)))))

(declare-fun b!130968 () Bool)

(declare-fun res!108607 () Bool)

(assert (=> b!130968 (=> (not res!108607) (not e!86806))))

(assert (=> b!130968 (= res!108607 (= (bitIndex!0 (size!2742 (buf!3103 (_2!5952 lt!202012))) (currentByte!5876 (_2!5952 lt!202012)) (currentBit!5871 (_2!5952 lt!202012))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2742 (buf!3103 thiss!1634)) (currentByte!5876 thiss!1634) (currentBit!5871 thiss!1634)))))))

(declare-fun b!130969 () Bool)

(assert (=> b!130969 (= e!86809 (= (_2!5953 lt!202009) (_2!5953 lt!201999)))))

(declare-fun b!130970 () Bool)

(declare-fun res!108604 () Bool)

(assert (=> b!130970 (=> (not res!108604) (not e!86811))))

(assert (=> b!130970 (= res!108604 (bvslt from!447 to!404))))

(declare-fun b!130971 () Bool)

(declare-fun arrayRangesEq!145 (array!6056 array!6056 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130971 (= e!86812 (not (arrayRangesEq!145 arr!237 (_2!5950 lt!202005) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!130972 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130972 (= e!86813 (invariant!0 (currentBit!5871 thiss!1634) (currentByte!5876 thiss!1634) (size!2742 (buf!3103 (_2!5952 lt!202012)))))))

(declare-fun b!130973 () Bool)

(declare-fun res!108606 () Bool)

(assert (=> b!130973 (=> (not res!108606) (not e!86811))))

(assert (=> b!130973 (= res!108606 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2742 (buf!3103 thiss!1634))) ((_ sign_extend 32) (currentByte!5876 thiss!1634)) ((_ sign_extend 32) (currentBit!5871 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!201998 () tuple2!11302)

(declare-fun b!130974 () Bool)

(declare-fun lt!202007 () tuple2!11306)

(assert (=> b!130974 (= e!86806 (and (= (_2!5953 lt!202007) (select (arr!3365 arr!237) from!447)) (= (_1!5953 lt!202007) (_2!5951 lt!201998))))))

(assert (=> b!130974 (= lt!202007 (readBytePure!0 (_1!5951 lt!201998)))))

(assert (=> b!130974 (= lt!201998 (reader!0 thiss!1634 (_2!5952 lt!202012)))))

(declare-fun b!130975 () Bool)

(declare-fun res!108615 () Bool)

(assert (=> b!130975 (=> (not res!108615) (not e!86811))))

(assert (=> b!130975 (= res!108615 (invariant!0 (currentBit!5871 thiss!1634) (currentByte!5876 thiss!1634) (size!2742 (buf!3103 thiss!1634))))))

(declare-fun b!130976 () Bool)

(assert (=> b!130976 (= e!86804 (array_inv!2531 (buf!3103 thiss!1634)))))

(assert (= (and start!25676 res!108616) b!130973))

(assert (= (and b!130973 res!108606) b!130970))

(assert (= (and b!130970 res!108604) b!130975))

(assert (= (and b!130975 res!108615) b!130967))

(assert (= (and b!130967 res!108610) b!130968))

(assert (= (and b!130968 res!108607) b!130966))

(assert (= (and b!130966 res!108613) b!130974))

(assert (= (and b!130967 res!108608) b!130964))

(assert (= (and b!130964 res!108612) b!130965))

(assert (= (and b!130965 res!108614) b!130963))

(assert (= (and b!130963 (not res!108605)) b!130971))

(assert (= (and b!130967 res!108611) b!130972))

(assert (= (and b!130967 res!108609) b!130969))

(assert (= start!25676 b!130976))

(declare-fun m!197549 () Bool)

(assert (=> b!130976 m!197549))

(declare-fun m!197551 () Bool)

(assert (=> b!130963 m!197551))

(declare-fun m!197553 () Bool)

(assert (=> b!130963 m!197553))

(declare-fun m!197555 () Bool)

(assert (=> b!130963 m!197555))

(declare-fun m!197557 () Bool)

(assert (=> b!130963 m!197557))

(declare-fun m!197559 () Bool)

(assert (=> b!130971 m!197559))

(declare-fun m!197561 () Bool)

(assert (=> b!130972 m!197561))

(declare-fun m!197563 () Bool)

(assert (=> b!130973 m!197563))

(declare-fun m!197565 () Bool)

(assert (=> b!130965 m!197565))

(declare-fun m!197567 () Bool)

(assert (=> b!130975 m!197567))

(declare-fun m!197569 () Bool)

(assert (=> b!130974 m!197569))

(declare-fun m!197571 () Bool)

(assert (=> b!130974 m!197571))

(declare-fun m!197573 () Bool)

(assert (=> b!130974 m!197573))

(declare-fun m!197575 () Bool)

(assert (=> b!130968 m!197575))

(declare-fun m!197577 () Bool)

(assert (=> b!130968 m!197577))

(declare-fun m!197579 () Bool)

(assert (=> b!130967 m!197579))

(declare-fun m!197581 () Bool)

(assert (=> b!130967 m!197581))

(declare-fun m!197583 () Bool)

(assert (=> b!130967 m!197583))

(declare-fun m!197585 () Bool)

(assert (=> b!130967 m!197585))

(declare-fun m!197587 () Bool)

(assert (=> b!130967 m!197587))

(declare-fun m!197589 () Bool)

(assert (=> b!130967 m!197589))

(assert (=> b!130967 m!197557))

(declare-fun m!197591 () Bool)

(assert (=> b!130967 m!197591))

(assert (=> b!130967 m!197569))

(declare-fun m!197593 () Bool)

(assert (=> b!130967 m!197593))

(declare-fun m!197595 () Bool)

(assert (=> b!130967 m!197595))

(declare-fun m!197597 () Bool)

(assert (=> b!130967 m!197597))

(declare-fun m!197599 () Bool)

(assert (=> b!130967 m!197599))

(declare-fun m!197601 () Bool)

(assert (=> b!130967 m!197601))

(declare-fun m!197603 () Bool)

(assert (=> b!130967 m!197603))

(declare-fun m!197605 () Bool)

(assert (=> b!130967 m!197605))

(declare-fun m!197607 () Bool)

(assert (=> b!130967 m!197607))

(assert (=> b!130967 m!197569))

(declare-fun m!197609 () Bool)

(assert (=> b!130964 m!197609))

(assert (=> b!130964 m!197575))

(declare-fun m!197611 () Bool)

(assert (=> start!25676 m!197611))

(declare-fun m!197613 () Bool)

(assert (=> start!25676 m!197613))

(declare-fun m!197615 () Bool)

(assert (=> b!130966 m!197615))

(push 1)

(assert (not b!130972))

(assert (not b!130965))

(assert (not b!130964))

(assert (not b!130968))

(assert (not b!130976))

(assert (not b!130973))

(assert (not start!25676))

(assert (not b!130975))

(assert (not b!130971))

(assert (not b!130966))

(assert (not b!130963))

(assert (not b!130967))

(assert (not b!130974))

(check-sat)

