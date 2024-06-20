; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25492 () Bool)

(assert start!25492)

(declare-fun b!129057 () Bool)

(declare-fun res!106852 () Bool)

(declare-fun e!85550 () Bool)

(assert (=> b!129057 (=> (not res!106852) (not e!85550))))

(declare-datatypes ((array!5977 0))(
  ( (array!5978 (arr!3321 (Array (_ BitVec 32) (_ BitVec 8))) (size!2704 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4672 0))(
  ( (BitStream!4673 (buf!3062 array!5977) (currentByte!5823 (_ BitVec 32)) (currentBit!5818 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4672)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129057 (= res!106852 (invariant!0 (currentBit!5818 thiss!1634) (currentByte!5823 thiss!1634) (size!2704 (buf!3062 thiss!1634))))))

(declare-fun b!129058 () Bool)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!5977)

(declare-fun e!85548 () Bool)

(declare-datatypes ((tuple2!10990 0))(
  ( (tuple2!10991 (_1!5792 BitStream!4672) (_2!5792 array!5977)) )
))
(declare-fun lt!199730 () tuple2!10990)

(declare-fun arrayRangesEq!107 (array!5977 array!5977 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129058 (= e!85548 (not (arrayRangesEq!107 arr!237 (_2!5792 lt!199730) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!129059 () Bool)

(declare-fun res!106850 () Bool)

(declare-fun e!85549 () Bool)

(assert (=> b!129059 (=> (not res!106850) (not e!85549))))

(declare-datatypes ((Unit!8013 0))(
  ( (Unit!8014) )
))
(declare-datatypes ((tuple2!10992 0))(
  ( (tuple2!10993 (_1!5793 Unit!8013) (_2!5793 BitStream!4672)) )
))
(declare-fun lt!199731 () tuple2!10992)

(declare-fun isPrefixOf!0 (BitStream!4672 BitStream!4672) Bool)

(assert (=> b!129059 (= res!106850 (isPrefixOf!0 thiss!1634 (_2!5793 lt!199731)))))

(declare-fun b!129060 () Bool)

(assert (=> b!129060 (= e!85550 (not true))))

(declare-fun lt!199725 () Bool)

(declare-fun lt!199729 () tuple2!10992)

(assert (=> b!129060 (= lt!199725 (isPrefixOf!0 (_2!5793 lt!199731) (_2!5793 lt!199729)))))

(declare-fun lt!199728 () Bool)

(assert (=> b!129060 (= lt!199728 (isPrefixOf!0 thiss!1634 (_2!5793 lt!199731)))))

(declare-fun e!85546 () Bool)

(assert (=> b!129060 e!85546))

(declare-fun res!106847 () Bool)

(assert (=> b!129060 (=> (not res!106847) (not e!85546))))

(assert (=> b!129060 (= res!106847 (= (size!2704 (buf!3062 (_2!5793 lt!199731))) (size!2704 (buf!3062 (_2!5793 lt!199729)))))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun appendByteArrayLoop!0 (BitStream!4672 array!5977 (_ BitVec 32) (_ BitVec 32)) tuple2!10992)

(assert (=> b!129060 (= lt!199729 (appendByteArrayLoop!0 (_2!5793 lt!199731) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129060 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2704 (buf!3062 (_2!5793 lt!199731)))) ((_ sign_extend 32) (currentByte!5823 (_2!5793 lt!199731))) ((_ sign_extend 32) (currentBit!5818 (_2!5793 lt!199731))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!199727 () Unit!8013)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4672 BitStream!4672 (_ BitVec 64) (_ BitVec 32)) Unit!8013)

(assert (=> b!129060 (= lt!199727 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5793 lt!199731) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!129060 e!85549))

(declare-fun res!106842 () Bool)

(assert (=> b!129060 (=> (not res!106842) (not e!85549))))

(assert (=> b!129060 (= res!106842 (= (size!2704 (buf!3062 thiss!1634)) (size!2704 (buf!3062 (_2!5793 lt!199731)))))))

(declare-fun appendByte!0 (BitStream!4672 (_ BitVec 8)) tuple2!10992)

(assert (=> b!129060 (= lt!199731 (appendByte!0 thiss!1634 (select (arr!3321 arr!237) from!447)))))

(declare-fun b!129061 () Bool)

(declare-datatypes ((tuple2!10994 0))(
  ( (tuple2!10995 (_1!5794 BitStream!4672) (_2!5794 (_ BitVec 8))) )
))
(declare-fun lt!199732 () tuple2!10994)

(declare-datatypes ((tuple2!10996 0))(
  ( (tuple2!10997 (_1!5795 BitStream!4672) (_2!5795 BitStream!4672)) )
))
(declare-fun lt!199724 () tuple2!10996)

(assert (=> b!129061 (= e!85549 (and (= (_2!5794 lt!199732) (select (arr!3321 arr!237) from!447)) (= (_1!5794 lt!199732) (_2!5795 lt!199724))))))

(declare-fun readBytePure!0 (BitStream!4672) tuple2!10994)

(assert (=> b!129061 (= lt!199732 (readBytePure!0 (_1!5795 lt!199724)))))

(declare-fun reader!0 (BitStream!4672 BitStream!4672) tuple2!10996)

(assert (=> b!129061 (= lt!199724 (reader!0 thiss!1634 (_2!5793 lt!199731)))))

(declare-fun b!129062 () Bool)

(declare-fun res!106846 () Bool)

(assert (=> b!129062 (=> (not res!106846) (not e!85550))))

(assert (=> b!129062 (= res!106846 (bvslt from!447 to!404))))

(declare-fun res!106844 () Bool)

(assert (=> start!25492 (=> (not res!106844) (not e!85550))))

(assert (=> start!25492 (= res!106844 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2704 arr!237))))))

(assert (=> start!25492 e!85550))

(assert (=> start!25492 true))

(declare-fun array_inv!2493 (array!5977) Bool)

(assert (=> start!25492 (array_inv!2493 arr!237)))

(declare-fun e!85543 () Bool)

(declare-fun inv!12 (BitStream!4672) Bool)

(assert (=> start!25492 (and (inv!12 thiss!1634) e!85543)))

(declare-fun b!129063 () Bool)

(declare-fun res!106843 () Bool)

(assert (=> b!129063 (=> (not res!106843) (not e!85549))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129063 (= res!106843 (= (bitIndex!0 (size!2704 (buf!3062 (_2!5793 lt!199731))) (currentByte!5823 (_2!5793 lt!199731)) (currentBit!5818 (_2!5793 lt!199731))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2704 (buf!3062 thiss!1634)) (currentByte!5823 thiss!1634) (currentBit!5818 thiss!1634)))))))

(declare-fun b!129064 () Bool)

(declare-fun res!106851 () Bool)

(assert (=> b!129064 (=> (not res!106851) (not e!85550))))

(assert (=> b!129064 (= res!106851 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2704 (buf!3062 thiss!1634))) ((_ sign_extend 32) (currentByte!5823 thiss!1634)) ((_ sign_extend 32) (currentBit!5818 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!129065 () Bool)

(declare-fun res!106848 () Bool)

(declare-fun e!85547 () Bool)

(assert (=> b!129065 (=> (not res!106848) (not e!85547))))

(assert (=> b!129065 (= res!106848 (isPrefixOf!0 (_2!5793 lt!199731) (_2!5793 lt!199729)))))

(declare-fun b!129066 () Bool)

(assert (=> b!129066 (= e!85543 (array_inv!2493 (buf!3062 thiss!1634)))))

(declare-fun b!129067 () Bool)

(assert (=> b!129067 (= e!85546 e!85547)))

(declare-fun res!106845 () Bool)

(assert (=> b!129067 (=> (not res!106845) (not e!85547))))

(declare-fun lt!199733 () (_ BitVec 64))

(assert (=> b!129067 (= res!106845 (= (bitIndex!0 (size!2704 (buf!3062 (_2!5793 lt!199729))) (currentByte!5823 (_2!5793 lt!199729)) (currentBit!5818 (_2!5793 lt!199729))) (bvadd (bitIndex!0 (size!2704 (buf!3062 (_2!5793 lt!199731))) (currentByte!5823 (_2!5793 lt!199731)) (currentBit!5818 (_2!5793 lt!199731))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!199733))))))

(assert (=> b!129067 (= lt!199733 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!129068 () Bool)

(assert (=> b!129068 (= e!85547 (not e!85548))))

(declare-fun res!106849 () Bool)

(assert (=> b!129068 (=> res!106849 e!85548)))

(declare-fun lt!199723 () tuple2!10996)

(assert (=> b!129068 (= res!106849 (or (not (= (size!2704 (_2!5792 lt!199730)) (size!2704 arr!237))) (not (= (_1!5792 lt!199730) (_2!5795 lt!199723)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4672 array!5977 (_ BitVec 32) (_ BitVec 32)) tuple2!10990)

(assert (=> b!129068 (= lt!199730 (readByteArrayLoopPure!0 (_1!5795 lt!199723) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129068 (validate_offset_bits!1 ((_ sign_extend 32) (size!2704 (buf!3062 (_2!5793 lt!199729)))) ((_ sign_extend 32) (currentByte!5823 (_2!5793 lt!199731))) ((_ sign_extend 32) (currentBit!5818 (_2!5793 lt!199731))) lt!199733)))

(declare-fun lt!199726 () Unit!8013)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4672 array!5977 (_ BitVec 64)) Unit!8013)

(assert (=> b!129068 (= lt!199726 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5793 lt!199731) (buf!3062 (_2!5793 lt!199729)) lt!199733))))

(assert (=> b!129068 (= lt!199723 (reader!0 (_2!5793 lt!199731) (_2!5793 lt!199729)))))

(assert (= (and start!25492 res!106844) b!129064))

(assert (= (and b!129064 res!106851) b!129062))

(assert (= (and b!129062 res!106846) b!129057))

(assert (= (and b!129057 res!106852) b!129060))

(assert (= (and b!129060 res!106842) b!129063))

(assert (= (and b!129063 res!106843) b!129059))

(assert (= (and b!129059 res!106850) b!129061))

(assert (= (and b!129060 res!106847) b!129067))

(assert (= (and b!129067 res!106845) b!129065))

(assert (= (and b!129065 res!106848) b!129068))

(assert (= (and b!129068 (not res!106849)) b!129058))

(assert (= start!25492 b!129066))

(declare-fun m!194821 () Bool)

(assert (=> b!129064 m!194821))

(declare-fun m!194823 () Bool)

(assert (=> b!129060 m!194823))

(declare-fun m!194825 () Bool)

(assert (=> b!129060 m!194825))

(declare-fun m!194827 () Bool)

(assert (=> b!129060 m!194827))

(declare-fun m!194829 () Bool)

(assert (=> b!129060 m!194829))

(declare-fun m!194831 () Bool)

(assert (=> b!129060 m!194831))

(declare-fun m!194833 () Bool)

(assert (=> b!129060 m!194833))

(assert (=> b!129060 m!194831))

(declare-fun m!194835 () Bool)

(assert (=> b!129060 m!194835))

(assert (=> b!129059 m!194823))

(assert (=> b!129065 m!194825))

(declare-fun m!194837 () Bool)

(assert (=> b!129068 m!194837))

(declare-fun m!194839 () Bool)

(assert (=> b!129068 m!194839))

(declare-fun m!194841 () Bool)

(assert (=> b!129068 m!194841))

(declare-fun m!194843 () Bool)

(assert (=> b!129068 m!194843))

(declare-fun m!194845 () Bool)

(assert (=> b!129067 m!194845))

(declare-fun m!194847 () Bool)

(assert (=> b!129067 m!194847))

(assert (=> b!129063 m!194847))

(declare-fun m!194849 () Bool)

(assert (=> b!129063 m!194849))

(declare-fun m!194851 () Bool)

(assert (=> b!129066 m!194851))

(assert (=> b!129061 m!194831))

(declare-fun m!194853 () Bool)

(assert (=> b!129061 m!194853))

(declare-fun m!194855 () Bool)

(assert (=> b!129061 m!194855))

(declare-fun m!194857 () Bool)

(assert (=> b!129057 m!194857))

(declare-fun m!194859 () Bool)

(assert (=> b!129058 m!194859))

(declare-fun m!194861 () Bool)

(assert (=> start!25492 m!194861))

(declare-fun m!194863 () Bool)

(assert (=> start!25492 m!194863))

(push 1)

(assert (not b!129057))

(assert (not start!25492))

(assert (not b!129066))

(assert (not b!129067))

(assert (not b!129064))

(assert (not b!129060))

(assert (not b!129061))

(assert (not b!129063))

(assert (not b!129059))

(assert (not b!129058))

(assert (not b!129068))

(assert (not b!129065))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

