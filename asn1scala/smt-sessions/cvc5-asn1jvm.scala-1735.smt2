; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47810 () Bool)

(assert start!47810)

(declare-fun res!190853 () Bool)

(declare-fun e!155686 () Bool)

(assert (=> start!47810 (=> (not res!190853) (not e!155686))))

(declare-datatypes ((array!11426 0))(
  ( (array!11427 (arr!5989 (Array (_ BitVec 32) (_ BitVec 8))) (size!5011 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11426)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47810 (= res!190853 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5011 arr!308))))))

(assert (=> start!47810 e!155686))

(assert (=> start!47810 true))

(declare-fun array_inv!4752 (array!11426) Bool)

(assert (=> start!47810 (array_inv!4752 arr!308)))

(declare-datatypes ((BitStream!9118 0))(
  ( (BitStream!9119 (buf!5552 array!11426) (currentByte!10396 (_ BitVec 32)) (currentBit!10391 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9118)

(declare-fun e!155687 () Bool)

(declare-fun inv!12 (BitStream!9118) Bool)

(assert (=> start!47810 (and (inv!12 thiss!1870) e!155687)))

(declare-fun b!227488 () Bool)

(declare-fun res!190854 () Bool)

(assert (=> b!227488 (=> (not res!190854) (not e!155686))))

(assert (=> b!227488 (= res!190854 (bvslt i!761 to!496))))

(declare-fun b!227487 () Bool)

(declare-fun res!190855 () Bool)

(assert (=> b!227487 (=> (not res!190855) (not e!155686))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227487 (= res!190855 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5011 (buf!5552 thiss!1870))) ((_ sign_extend 32) (currentByte!10396 thiss!1870)) ((_ sign_extend 32) (currentBit!10391 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227490 () Bool)

(assert (=> b!227490 (= e!155687 (array_inv!4752 (buf!5552 thiss!1870)))))

(declare-fun b!227489 () Bool)

(assert (=> b!227489 (= e!155686 (not true))))

(declare-datatypes ((Unit!16996 0))(
  ( (Unit!16997) )
))
(declare-datatypes ((tuple3!1404 0))(
  ( (tuple3!1405 (_1!10622 Unit!16996) (_2!10622 BitStream!9118) (_3!844 array!11426)) )
))
(declare-fun lt!363803 () tuple3!1404)

(declare-fun arrayRangesEq!847 (array!11426 array!11426 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227489 (arrayRangesEq!847 arr!308 (_3!844 lt!363803) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!363801 () array!11426)

(declare-fun lt!363802 () Unit!16996)

(declare-fun arrayRangesEqTransitive!270 (array!11426 array!11426 array!11426 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16996)

(assert (=> b!227489 (= lt!363802 (arrayRangesEqTransitive!270 arr!308 lt!363801 (_3!844 lt!363803) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227489 (arrayRangesEq!847 arr!308 lt!363801 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!363799 () Unit!16996)

(declare-datatypes ((tuple2!19556 0))(
  ( (tuple2!19557 (_1!10623 (_ BitVec 8)) (_2!10623 BitStream!9118)) )
))
(declare-fun lt!363806 () tuple2!19556)

(declare-fun arrayUpdatedAtPrefixLemma!406 (array!11426 (_ BitVec 32) (_ BitVec 8)) Unit!16996)

(assert (=> b!227489 (= lt!363799 (arrayUpdatedAtPrefixLemma!406 arr!308 i!761 (_1!10623 lt!363806)))))

(declare-fun lt!363804 () (_ BitVec 64))

(declare-fun lt!363798 () (_ BitVec 64))

(declare-fun lt!363800 () (_ BitVec 32))

(declare-fun lt!363805 () (_ BitVec 64))

(assert (=> b!227489 (and (= (bvadd lt!363798 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!363800))) lt!363805) (= (bvadd lt!363804 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!363805) (= (buf!5552 thiss!1870) (buf!5552 (_2!10622 lt!363803))) (= (size!5011 arr!308) (size!5011 (_3!844 lt!363803))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227489 (= lt!363805 (bitIndex!0 (size!5011 (buf!5552 (_2!10622 lt!363803))) (currentByte!10396 (_2!10622 lt!363803)) (currentBit!10391 (_2!10622 lt!363803))))))

(assert (=> b!227489 (= lt!363798 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!363804))))

(assert (=> b!227489 (= lt!363798 (bitIndex!0 (size!5011 (buf!5552 (_2!10623 lt!363806))) (currentByte!10396 (_2!10623 lt!363806)) (currentBit!10391 (_2!10623 lt!363806))))))

(assert (=> b!227489 (= lt!363804 (bitIndex!0 (size!5011 (buf!5552 thiss!1870)) (currentByte!10396 thiss!1870) (currentBit!10391 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9118 array!11426 (_ BitVec 32) (_ BitVec 32)) tuple3!1404)

(assert (=> b!227489 (= lt!363803 (readByteArrayLoop!0 (_2!10623 lt!363806) lt!363801 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227489 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5011 (buf!5552 (_2!10623 lt!363806)))) ((_ sign_extend 32) (currentByte!10396 (_2!10623 lt!363806))) ((_ sign_extend 32) (currentBit!10391 (_2!10623 lt!363806))) lt!363800)))

(assert (=> b!227489 (= lt!363800 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!363807 () Unit!16996)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9118 BitStream!9118 (_ BitVec 64) (_ BitVec 32)) Unit!16996)

(assert (=> b!227489 (= lt!363807 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10623 lt!363806) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227489 (= lt!363801 (array!11427 (store (arr!5989 arr!308) i!761 (_1!10623 lt!363806)) (size!5011 arr!308)))))

(declare-fun readByte!0 (BitStream!9118) tuple2!19556)

(assert (=> b!227489 (= lt!363806 (readByte!0 thiss!1870))))

(assert (= (and start!47810 res!190853) b!227487))

(assert (= (and b!227487 res!190855) b!227488))

(assert (= (and b!227488 res!190854) b!227489))

(assert (= start!47810 b!227490))

(declare-fun m!349885 () Bool)

(assert (=> start!47810 m!349885))

(declare-fun m!349887 () Bool)

(assert (=> start!47810 m!349887))

(declare-fun m!349889 () Bool)

(assert (=> b!227487 m!349889))

(declare-fun m!349891 () Bool)

(assert (=> b!227490 m!349891))

(declare-fun m!349893 () Bool)

(assert (=> b!227489 m!349893))

(declare-fun m!349895 () Bool)

(assert (=> b!227489 m!349895))

(declare-fun m!349897 () Bool)

(assert (=> b!227489 m!349897))

(declare-fun m!349899 () Bool)

(assert (=> b!227489 m!349899))

(declare-fun m!349901 () Bool)

(assert (=> b!227489 m!349901))

(declare-fun m!349903 () Bool)

(assert (=> b!227489 m!349903))

(declare-fun m!349905 () Bool)

(assert (=> b!227489 m!349905))

(declare-fun m!349907 () Bool)

(assert (=> b!227489 m!349907))

(declare-fun m!349909 () Bool)

(assert (=> b!227489 m!349909))

(declare-fun m!349911 () Bool)

(assert (=> b!227489 m!349911))

(declare-fun m!349913 () Bool)

(assert (=> b!227489 m!349913))

(declare-fun m!349915 () Bool)

(assert (=> b!227489 m!349915))

(push 1)

(assert (not b!227487))

(assert (not b!227489))

(assert (not b!227490))

(assert (not start!47810))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

