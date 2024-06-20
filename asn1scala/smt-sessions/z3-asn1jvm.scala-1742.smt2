; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47914 () Bool)

(assert start!47914)

(declare-fun b!227902 () Bool)

(declare-fun res!191188 () Bool)

(declare-fun e!156070 () Bool)

(assert (=> b!227902 (=> (not res!191188) (not e!156070))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!227902 (= res!191188 (bvslt i!761 to!496))))

(declare-fun b!227904 () Bool)

(declare-fun e!156069 () Bool)

(declare-datatypes ((array!11473 0))(
  ( (array!11474 (arr!6014 (Array (_ BitVec 32) (_ BitVec 8))) (size!5033 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9162 0))(
  ( (BitStream!9163 (buf!5574 array!11473) (currentByte!10424 (_ BitVec 32)) (currentBit!10419 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9162)

(declare-fun array_inv!4774 (array!11473) Bool)

(assert (=> b!227904 (= e!156069 (array_inv!4774 (buf!5574 thiss!1870)))))

(declare-fun b!227903 () Bool)

(declare-datatypes ((Unit!17073 0))(
  ( (Unit!17074) )
))
(declare-datatypes ((tuple3!1448 0))(
  ( (tuple3!1449 (_1!10672 Unit!17073) (_2!10672 BitStream!9162) (_3!866 array!11473)) )
))
(declare-fun lt!364993 () tuple3!1448)

(assert (=> b!227903 (= e!156070 (not (bvslt i!761 (size!5033 (_3!866 lt!364993)))))))

(declare-datatypes ((tuple2!19612 0))(
  ( (tuple2!19613 (_1!10673 (_ BitVec 8)) (_2!10673 BitStream!9162)) )
))
(declare-fun lt!364991 () tuple2!19612)

(assert (=> b!227903 (= (_1!10673 lt!364991) (select (arr!6014 (_3!866 lt!364993)) i!761))))

(declare-fun lt!364986 () Unit!17073)

(declare-fun lt!364987 () array!11473)

(declare-fun arrayRangesEqImpliesEq!125 (array!11473 array!11473 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17073)

(assert (=> b!227903 (= lt!364986 (arrayRangesEqImpliesEq!125 lt!364987 (_3!866 lt!364993) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arr!308 () array!11473)

(declare-fun arrayRangesEq!869 (array!11473 array!11473 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227903 (arrayRangesEq!869 arr!308 (_3!866 lt!364993) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364994 () Unit!17073)

(declare-fun arrayRangesEqTransitive!292 (array!11473 array!11473 array!11473 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17073)

(assert (=> b!227903 (= lt!364994 (arrayRangesEqTransitive!292 arr!308 lt!364987 (_3!866 lt!364993) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227903 (arrayRangesEq!869 arr!308 lt!364987 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364995 () Unit!17073)

(declare-fun arrayUpdatedAtPrefixLemma!428 (array!11473 (_ BitVec 32) (_ BitVec 8)) Unit!17073)

(assert (=> b!227903 (= lt!364995 (arrayUpdatedAtPrefixLemma!428 arr!308 i!761 (_1!10673 lt!364991)))))

(declare-fun lt!364990 () (_ BitVec 64))

(declare-fun lt!364989 () (_ BitVec 64))

(declare-fun lt!364992 () (_ BitVec 64))

(declare-fun lt!364988 () (_ BitVec 32))

(assert (=> b!227903 (and (= (bvadd lt!364989 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!364988))) lt!364990) (= (bvadd lt!364992 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!364990) (= (buf!5574 thiss!1870) (buf!5574 (_2!10672 lt!364993))) (= (size!5033 arr!308) (size!5033 (_3!866 lt!364993))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227903 (= lt!364990 (bitIndex!0 (size!5033 (buf!5574 (_2!10672 lt!364993))) (currentByte!10424 (_2!10672 lt!364993)) (currentBit!10419 (_2!10672 lt!364993))))))

(assert (=> b!227903 (= lt!364989 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!364992))))

(assert (=> b!227903 (= lt!364989 (bitIndex!0 (size!5033 (buf!5574 (_2!10673 lt!364991))) (currentByte!10424 (_2!10673 lt!364991)) (currentBit!10419 (_2!10673 lt!364991))))))

(assert (=> b!227903 (= lt!364992 (bitIndex!0 (size!5033 (buf!5574 thiss!1870)) (currentByte!10424 thiss!1870) (currentBit!10419 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9162 array!11473 (_ BitVec 32) (_ BitVec 32)) tuple3!1448)

(assert (=> b!227903 (= lt!364993 (readByteArrayLoop!0 (_2!10673 lt!364991) lt!364987 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227903 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5033 (buf!5574 (_2!10673 lt!364991)))) ((_ sign_extend 32) (currentByte!10424 (_2!10673 lt!364991))) ((_ sign_extend 32) (currentBit!10419 (_2!10673 lt!364991))) lt!364988)))

(assert (=> b!227903 (= lt!364988 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!364985 () Unit!17073)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9162 BitStream!9162 (_ BitVec 64) (_ BitVec 32)) Unit!17073)

(assert (=> b!227903 (= lt!364985 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10673 lt!364991) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227903 (= lt!364987 (array!11474 (store (arr!6014 arr!308) i!761 (_1!10673 lt!364991)) (size!5033 arr!308)))))

(declare-fun readByte!0 (BitStream!9162) tuple2!19612)

(assert (=> b!227903 (= lt!364991 (readByte!0 thiss!1870))))

(declare-fun b!227901 () Bool)

(declare-fun res!191186 () Bool)

(assert (=> b!227901 (=> (not res!191186) (not e!156070))))

(assert (=> b!227901 (= res!191186 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5033 (buf!5574 thiss!1870))) ((_ sign_extend 32) (currentByte!10424 thiss!1870)) ((_ sign_extend 32) (currentBit!10419 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!191187 () Bool)

(assert (=> start!47914 (=> (not res!191187) (not e!156070))))

(assert (=> start!47914 (= res!191187 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5033 arr!308))))))

(assert (=> start!47914 e!156070))

(assert (=> start!47914 true))

(assert (=> start!47914 (array_inv!4774 arr!308)))

(declare-fun inv!12 (BitStream!9162) Bool)

(assert (=> start!47914 (and (inv!12 thiss!1870) e!156069)))

(assert (= (and start!47914 res!191187) b!227901))

(assert (= (and b!227901 res!191186) b!227902))

(assert (= (and b!227902 res!191188) b!227903))

(assert (= start!47914 b!227904))

(declare-fun m!350851 () Bool)

(assert (=> b!227904 m!350851))

(declare-fun m!350853 () Bool)

(assert (=> b!227903 m!350853))

(declare-fun m!350855 () Bool)

(assert (=> b!227903 m!350855))

(declare-fun m!350857 () Bool)

(assert (=> b!227903 m!350857))

(declare-fun m!350859 () Bool)

(assert (=> b!227903 m!350859))

(declare-fun m!350861 () Bool)

(assert (=> b!227903 m!350861))

(declare-fun m!350863 () Bool)

(assert (=> b!227903 m!350863))

(declare-fun m!350865 () Bool)

(assert (=> b!227903 m!350865))

(declare-fun m!350867 () Bool)

(assert (=> b!227903 m!350867))

(declare-fun m!350869 () Bool)

(assert (=> b!227903 m!350869))

(declare-fun m!350871 () Bool)

(assert (=> b!227903 m!350871))

(declare-fun m!350873 () Bool)

(assert (=> b!227903 m!350873))

(declare-fun m!350875 () Bool)

(assert (=> b!227903 m!350875))

(declare-fun m!350877 () Bool)

(assert (=> b!227903 m!350877))

(declare-fun m!350879 () Bool)

(assert (=> b!227903 m!350879))

(declare-fun m!350881 () Bool)

(assert (=> b!227901 m!350881))

(declare-fun m!350883 () Bool)

(assert (=> start!47914 m!350883))

(declare-fun m!350885 () Bool)

(assert (=> start!47914 m!350885))

(check-sat (not b!227904) (not b!227903) (not start!47914) (not b!227901))
(check-sat)
