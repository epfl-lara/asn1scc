; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5684 () Bool)

(assert start!5684)

(declare-datatypes ((array!1607 0))(
  ( (array!1608 (arr!1145 (Array (_ BitVec 32) (_ BitVec 8))) (size!689 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1210 0))(
  ( (BitStream!1211 (buf!1010 array!1607) (currentByte!2323 (_ BitVec 32)) (currentBit!2318 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2021 0))(
  ( (Unit!2022) )
))
(declare-datatypes ((tuple2!2738 0))(
  ( (tuple2!2739 (_1!1456 Unit!2021) (_2!1456 BitStream!1210)) )
))
(declare-fun lt!34483 () tuple2!2738)

(declare-fun lt!34484 () (_ BitVec 64))

(declare-fun b!24000 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun e!16318 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24000 (= e!16318 (= lt!34484 (bvsub (bvsub (bvadd (bitIndex!0 (size!689 (buf!1010 (_2!1456 lt!34483))) (currentByte!2323 (_2!1456 lt!34483)) (currentBit!2318 (_2!1456 lt!34483))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!24001 () Bool)

(declare-fun e!16309 () Bool)

(declare-fun e!16313 () Bool)

(assert (=> b!24001 (= e!16309 e!16313)))

(declare-fun res!20684 () Bool)

(assert (=> b!24001 (=> res!20684 e!16313)))

(declare-fun lt!34485 () (_ BitVec 64))

(assert (=> b!24001 (= res!20684 (not (= lt!34484 (bvsub (bvadd lt!34485 to!314) i!635))))))

(declare-fun lt!34489 () tuple2!2738)

(assert (=> b!24001 (= lt!34484 (bitIndex!0 (size!689 (buf!1010 (_2!1456 lt!34489))) (currentByte!2323 (_2!1456 lt!34489)) (currentBit!2318 (_2!1456 lt!34489))))))

(declare-fun b!24002 () Bool)

(declare-fun e!16308 () Bool)

(assert (=> b!24002 (= e!16308 e!16309)))

(declare-fun res!20689 () Bool)

(assert (=> b!24002 (=> res!20689 e!16309)))

(declare-fun isPrefixOf!0 (BitStream!1210 BitStream!1210) Bool)

(assert (=> b!24002 (= res!20689 (not (isPrefixOf!0 (_2!1456 lt!34483) (_2!1456 lt!34489))))))

(declare-fun thiss!1379 () BitStream!1210)

(assert (=> b!24002 (isPrefixOf!0 thiss!1379 (_2!1456 lt!34489))))

(declare-fun lt!34487 () Unit!2021)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1210 BitStream!1210 BitStream!1210) Unit!2021)

(assert (=> b!24002 (= lt!34487 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1456 lt!34483) (_2!1456 lt!34489)))))

(declare-fun srcBuffer!2 () array!1607)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1210 array!1607 (_ BitVec 64) (_ BitVec 64)) tuple2!2738)

(assert (=> b!24002 (= lt!34489 (appendBitsMSBFirstLoop!0 (_2!1456 lt!34483) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!16314 () Bool)

(assert (=> b!24002 e!16314))

(declare-fun res!20688 () Bool)

(assert (=> b!24002 (=> (not res!20688) (not e!16314))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24002 (= res!20688 (validate_offset_bits!1 ((_ sign_extend 32) (size!689 (buf!1010 (_2!1456 lt!34483)))) ((_ sign_extend 32) (currentByte!2323 thiss!1379)) ((_ sign_extend 32) (currentBit!2318 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34486 () Unit!2021)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1210 array!1607 (_ BitVec 64)) Unit!2021)

(assert (=> b!24002 (= lt!34486 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1010 (_2!1456 lt!34483)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2740 0))(
  ( (tuple2!2741 (_1!1457 BitStream!1210) (_2!1457 BitStream!1210)) )
))
(declare-fun lt!34480 () tuple2!2740)

(declare-fun reader!0 (BitStream!1210 BitStream!1210) tuple2!2740)

(assert (=> b!24002 (= lt!34480 (reader!0 thiss!1379 (_2!1456 lt!34483)))))

(declare-fun b!24003 () Bool)

(declare-fun e!16310 () Bool)

(assert (=> b!24003 (= e!16313 e!16310)))

(declare-fun res!20694 () Bool)

(assert (=> b!24003 (=> res!20694 e!16310)))

(assert (=> b!24003 (= res!20694 (not (= (size!689 (buf!1010 (_2!1456 lt!34483))) (size!689 (buf!1010 (_2!1456 lt!34489))))))))

(assert (=> b!24003 e!16318))

(declare-fun res!20682 () Bool)

(assert (=> b!24003 (=> (not res!20682) (not e!16318))))

(assert (=> b!24003 (= res!20682 (= (size!689 (buf!1010 (_2!1456 lt!34489))) (size!689 (buf!1010 thiss!1379))))))

(declare-fun b!24004 () Bool)

(declare-fun e!16315 () Bool)

(assert (=> b!24004 (= e!16315 e!16308)))

(declare-fun res!20685 () Bool)

(assert (=> b!24004 (=> res!20685 e!16308)))

(assert (=> b!24004 (= res!20685 (not (isPrefixOf!0 thiss!1379 (_2!1456 lt!34483))))))

(declare-fun lt!34477 () (_ BitVec 64))

(assert (=> b!24004 (validate_offset_bits!1 ((_ sign_extend 32) (size!689 (buf!1010 (_2!1456 lt!34483)))) ((_ sign_extend 32) (currentByte!2323 (_2!1456 lt!34483))) ((_ sign_extend 32) (currentBit!2318 (_2!1456 lt!34483))) lt!34477)))

(assert (=> b!24004 (= lt!34477 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34488 () Unit!2021)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1210 BitStream!1210 (_ BitVec 64) (_ BitVec 64)) Unit!2021)

(assert (=> b!24004 (= lt!34488 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1456 lt!34483) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1210 (_ BitVec 8) (_ BitVec 32)) tuple2!2738)

(assert (=> b!24004 (= lt!34483 (appendBitFromByte!0 thiss!1379 (select (arr!1145 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!24005 () Bool)

(declare-fun res!20692 () Bool)

(assert (=> b!24005 (=> res!20692 e!16310)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24005 (= res!20692 (not (invariant!0 (currentBit!2318 (_2!1456 lt!34483)) (currentByte!2323 (_2!1456 lt!34483)) (size!689 (buf!1010 (_2!1456 lt!34489))))))))

(declare-fun b!24006 () Bool)

(declare-fun e!16316 () Bool)

(declare-fun array_inv!658 (array!1607) Bool)

(assert (=> b!24006 (= e!16316 (array_inv!658 (buf!1010 thiss!1379)))))

(declare-fun b!24007 () Bool)

(declare-fun res!20691 () Bool)

(assert (=> b!24007 (=> res!20691 e!16313)))

(assert (=> b!24007 (= res!20691 (not (= (size!689 (buf!1010 thiss!1379)) (size!689 (buf!1010 (_2!1456 lt!34489))))))))

(declare-fun b!24008 () Bool)

(declare-fun e!16317 () Bool)

(assert (=> b!24008 (= e!16317 (not e!16315))))

(declare-fun res!20690 () Bool)

(assert (=> b!24008 (=> res!20690 e!16315)))

(assert (=> b!24008 (= res!20690 (bvsge i!635 to!314))))

(assert (=> b!24008 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34482 () Unit!2021)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1210) Unit!2021)

(assert (=> b!24008 (= lt!34482 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!24008 (= lt!34485 (bitIndex!0 (size!689 (buf!1010 thiss!1379)) (currentByte!2323 thiss!1379) (currentBit!2318 thiss!1379)))))

(declare-fun b!24009 () Bool)

(declare-fun res!20687 () Bool)

(assert (=> b!24009 (=> res!20687 e!16310)))

(assert (=> b!24009 (= res!20687 (not (invariant!0 (currentBit!2318 (_2!1456 lt!34483)) (currentByte!2323 (_2!1456 lt!34483)) (size!689 (buf!1010 (_2!1456 lt!34483))))))))

(declare-fun res!20683 () Bool)

(assert (=> start!5684 (=> (not res!20683) (not e!16317))))

(assert (=> start!5684 (= res!20683 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!689 srcBuffer!2))))))))

(assert (=> start!5684 e!16317))

(assert (=> start!5684 true))

(assert (=> start!5684 (array_inv!658 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1210) Bool)

(assert (=> start!5684 (and (inv!12 thiss!1379) e!16316)))

(declare-fun b!24010 () Bool)

(declare-datatypes ((List!306 0))(
  ( (Nil!303) (Cons!302 (h!421 Bool) (t!1056 List!306)) )
))
(declare-fun head!143 (List!306) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1210 array!1607 (_ BitVec 64) (_ BitVec 64)) List!306)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1210 BitStream!1210 (_ BitVec 64)) List!306)

(assert (=> b!24010 (= e!16314 (= (head!143 (byteArrayBitContentToList!0 (_2!1456 lt!34483) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!143 (bitStreamReadBitsIntoList!0 (_2!1456 lt!34483) (_1!1457 lt!34480) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!24011 () Bool)

(assert (=> b!24011 (= e!16310 true)))

(assert (=> b!24011 (validate_offset_bits!1 ((_ sign_extend 32) (size!689 (buf!1010 (_2!1456 lt!34489)))) ((_ sign_extend 32) (currentByte!2323 (_2!1456 lt!34483))) ((_ sign_extend 32) (currentBit!2318 (_2!1456 lt!34483))) lt!34477)))

(declare-fun lt!34476 () Unit!2021)

(assert (=> b!24011 (= lt!34476 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1456 lt!34483) (buf!1010 (_2!1456 lt!34489)) lt!34477))))

(declare-fun lt!34479 () tuple2!2740)

(assert (=> b!24011 (= lt!34479 (reader!0 (_2!1456 lt!34483) (_2!1456 lt!34489)))))

(assert (=> b!24011 (validate_offset_bits!1 ((_ sign_extend 32) (size!689 (buf!1010 (_2!1456 lt!34489)))) ((_ sign_extend 32) (currentByte!2323 thiss!1379)) ((_ sign_extend 32) (currentBit!2318 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34478 () Unit!2021)

(assert (=> b!24011 (= lt!34478 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1010 (_2!1456 lt!34489)) (bvsub to!314 i!635)))))

(declare-fun lt!34481 () tuple2!2740)

(assert (=> b!24011 (= lt!34481 (reader!0 thiss!1379 (_2!1456 lt!34489)))))

(declare-fun b!24012 () Bool)

(declare-fun res!20686 () Bool)

(assert (=> b!24012 (=> res!20686 e!16313)))

(assert (=> b!24012 (= res!20686 (not (invariant!0 (currentBit!2318 (_2!1456 lt!34489)) (currentByte!2323 (_2!1456 lt!34489)) (size!689 (buf!1010 (_2!1456 lt!34489))))))))

(declare-fun b!24013 () Bool)

(declare-fun res!20693 () Bool)

(assert (=> b!24013 (=> (not res!20693) (not e!16317))))

(assert (=> b!24013 (= res!20693 (validate_offset_bits!1 ((_ sign_extend 32) (size!689 (buf!1010 thiss!1379))) ((_ sign_extend 32) (currentByte!2323 thiss!1379)) ((_ sign_extend 32) (currentBit!2318 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!5684 res!20683) b!24013))

(assert (= (and b!24013 res!20693) b!24008))

(assert (= (and b!24008 (not res!20690)) b!24004))

(assert (= (and b!24004 (not res!20685)) b!24002))

(assert (= (and b!24002 res!20688) b!24010))

(assert (= (and b!24002 (not res!20689)) b!24001))

(assert (= (and b!24001 (not res!20684)) b!24012))

(assert (= (and b!24012 (not res!20686)) b!24007))

(assert (= (and b!24007 (not res!20691)) b!24003))

(assert (= (and b!24003 res!20682) b!24000))

(assert (= (and b!24003 (not res!20694)) b!24009))

(assert (= (and b!24009 (not res!20687)) b!24005))

(assert (= (and b!24005 (not res!20692)) b!24011))

(assert (= start!5684 b!24006))

(declare-fun m!33801 () Bool)

(assert (=> start!5684 m!33801))

(declare-fun m!33803 () Bool)

(assert (=> start!5684 m!33803))

(declare-fun m!33805 () Bool)

(assert (=> b!24009 m!33805))

(declare-fun m!33807 () Bool)

(assert (=> b!24005 m!33807))

(declare-fun m!33809 () Bool)

(assert (=> b!24000 m!33809))

(declare-fun m!33811 () Bool)

(assert (=> b!24004 m!33811))

(declare-fun m!33813 () Bool)

(assert (=> b!24004 m!33813))

(declare-fun m!33815 () Bool)

(assert (=> b!24004 m!33815))

(assert (=> b!24004 m!33813))

(declare-fun m!33817 () Bool)

(assert (=> b!24004 m!33817))

(declare-fun m!33819 () Bool)

(assert (=> b!24004 m!33819))

(declare-fun m!33821 () Bool)

(assert (=> b!24013 m!33821))

(declare-fun m!33823 () Bool)

(assert (=> b!24012 m!33823))

(declare-fun m!33825 () Bool)

(assert (=> b!24008 m!33825))

(declare-fun m!33827 () Bool)

(assert (=> b!24008 m!33827))

(declare-fun m!33829 () Bool)

(assert (=> b!24008 m!33829))

(declare-fun m!33831 () Bool)

(assert (=> b!24006 m!33831))

(declare-fun m!33833 () Bool)

(assert (=> b!24011 m!33833))

(declare-fun m!33835 () Bool)

(assert (=> b!24011 m!33835))

(declare-fun m!33837 () Bool)

(assert (=> b!24011 m!33837))

(declare-fun m!33839 () Bool)

(assert (=> b!24011 m!33839))

(declare-fun m!33841 () Bool)

(assert (=> b!24011 m!33841))

(declare-fun m!33843 () Bool)

(assert (=> b!24011 m!33843))

(declare-fun m!33845 () Bool)

(assert (=> b!24001 m!33845))

(declare-fun m!33847 () Bool)

(assert (=> b!24010 m!33847))

(assert (=> b!24010 m!33847))

(declare-fun m!33849 () Bool)

(assert (=> b!24010 m!33849))

(declare-fun m!33851 () Bool)

(assert (=> b!24010 m!33851))

(assert (=> b!24010 m!33851))

(declare-fun m!33853 () Bool)

(assert (=> b!24010 m!33853))

(declare-fun m!33855 () Bool)

(assert (=> b!24002 m!33855))

(declare-fun m!33857 () Bool)

(assert (=> b!24002 m!33857))

(declare-fun m!33859 () Bool)

(assert (=> b!24002 m!33859))

(declare-fun m!33861 () Bool)

(assert (=> b!24002 m!33861))

(declare-fun m!33863 () Bool)

(assert (=> b!24002 m!33863))

(declare-fun m!33865 () Bool)

(assert (=> b!24002 m!33865))

(declare-fun m!33867 () Bool)

(assert (=> b!24002 m!33867))

(push 1)

