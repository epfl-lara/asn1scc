; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47918 () Bool)

(assert start!47918)

(declare-fun res!191206 () Bool)

(declare-fun e!156094 () Bool)

(assert (=> start!47918 (=> (not res!191206) (not e!156094))))

(declare-datatypes ((array!11477 0))(
  ( (array!11478 (arr!6016 (Array (_ BitVec 32) (_ BitVec 8))) (size!5035 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11477)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47918 (= res!191206 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5035 arr!308))))))

(assert (=> start!47918 e!156094))

(assert (=> start!47918 true))

(declare-fun array_inv!4776 (array!11477) Bool)

(assert (=> start!47918 (array_inv!4776 arr!308)))

(declare-datatypes ((BitStream!9166 0))(
  ( (BitStream!9167 (buf!5576 array!11477) (currentByte!10426 (_ BitVec 32)) (currentBit!10421 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9166)

(declare-fun e!156093 () Bool)

(declare-fun inv!12 (BitStream!9166) Bool)

(assert (=> start!47918 (and (inv!12 thiss!1870) e!156093)))

(declare-fun b!227928 () Bool)

(assert (=> b!227928 (= e!156093 (array_inv!4776 (buf!5576 thiss!1870)))))

(declare-fun b!227925 () Bool)

(declare-fun res!191205 () Bool)

(assert (=> b!227925 (=> (not res!191205) (not e!156094))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227925 (= res!191205 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5035 (buf!5576 thiss!1870))) ((_ sign_extend 32) (currentByte!10426 thiss!1870)) ((_ sign_extend 32) (currentBit!10421 thiss!1870)) (bvsub to!496 i!761)))))

(declare-datatypes ((tuple2!19616 0))(
  ( (tuple2!19617 (_1!10676 (_ BitVec 8)) (_2!10676 BitStream!9166)) )
))
(declare-fun lt!365051 () tuple2!19616)

(declare-datatypes ((Unit!17077 0))(
  ( (Unit!17078) )
))
(declare-datatypes ((tuple3!1452 0))(
  ( (tuple3!1453 (_1!10677 Unit!17077) (_2!10677 BitStream!9166) (_3!868 array!11477)) )
))
(declare-fun lt!365058 () tuple3!1452)

(declare-fun b!227927 () Bool)

(assert (=> b!227927 (= e!156094 (not (= (select (arr!6016 (_3!868 lt!365058)) i!761) (_1!10676 lt!365051))))))

(assert (=> b!227927 (= (_1!10676 lt!365051) (select (arr!6016 (_3!868 lt!365058)) i!761))))

(declare-fun lt!365054 () array!11477)

(declare-fun lt!365052 () Unit!17077)

(declare-fun arrayRangesEqImpliesEq!127 (array!11477 array!11477 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17077)

(assert (=> b!227927 (= lt!365052 (arrayRangesEqImpliesEq!127 lt!365054 (_3!868 lt!365058) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arrayRangesEq!871 (array!11477 array!11477 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227927 (arrayRangesEq!871 arr!308 (_3!868 lt!365058) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365061 () Unit!17077)

(declare-fun arrayRangesEqTransitive!294 (array!11477 array!11477 array!11477 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17077)

(assert (=> b!227927 (= lt!365061 (arrayRangesEqTransitive!294 arr!308 lt!365054 (_3!868 lt!365058) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227927 (arrayRangesEq!871 arr!308 lt!365054 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365059 () Unit!17077)

(declare-fun arrayUpdatedAtPrefixLemma!430 (array!11477 (_ BitVec 32) (_ BitVec 8)) Unit!17077)

(assert (=> b!227927 (= lt!365059 (arrayUpdatedAtPrefixLemma!430 arr!308 i!761 (_1!10676 lt!365051)))))

(declare-fun lt!365060 () (_ BitVec 64))

(declare-fun lt!365055 () (_ BitVec 64))

(declare-fun lt!365057 () (_ BitVec 32))

(declare-fun lt!365056 () (_ BitVec 64))

(assert (=> b!227927 (and (= (bvadd lt!365060 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!365057))) lt!365056) (= (bvadd lt!365055 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!365056) (= (buf!5576 thiss!1870) (buf!5576 (_2!10677 lt!365058))) (= (size!5035 arr!308) (size!5035 (_3!868 lt!365058))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227927 (= lt!365056 (bitIndex!0 (size!5035 (buf!5576 (_2!10677 lt!365058))) (currentByte!10426 (_2!10677 lt!365058)) (currentBit!10421 (_2!10677 lt!365058))))))

(assert (=> b!227927 (= lt!365060 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!365055))))

(assert (=> b!227927 (= lt!365060 (bitIndex!0 (size!5035 (buf!5576 (_2!10676 lt!365051))) (currentByte!10426 (_2!10676 lt!365051)) (currentBit!10421 (_2!10676 lt!365051))))))

(assert (=> b!227927 (= lt!365055 (bitIndex!0 (size!5035 (buf!5576 thiss!1870)) (currentByte!10426 thiss!1870) (currentBit!10421 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9166 array!11477 (_ BitVec 32) (_ BitVec 32)) tuple3!1452)

(assert (=> b!227927 (= lt!365058 (readByteArrayLoop!0 (_2!10676 lt!365051) lt!365054 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227927 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5035 (buf!5576 (_2!10676 lt!365051)))) ((_ sign_extend 32) (currentByte!10426 (_2!10676 lt!365051))) ((_ sign_extend 32) (currentBit!10421 (_2!10676 lt!365051))) lt!365057)))

(assert (=> b!227927 (= lt!365057 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!365053 () Unit!17077)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9166 BitStream!9166 (_ BitVec 64) (_ BitVec 32)) Unit!17077)

(assert (=> b!227927 (= lt!365053 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10676 lt!365051) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227927 (= lt!365054 (array!11478 (store (arr!6016 arr!308) i!761 (_1!10676 lt!365051)) (size!5035 arr!308)))))

(declare-fun readByte!0 (BitStream!9166) tuple2!19616)

(assert (=> b!227927 (= lt!365051 (readByte!0 thiss!1870))))

(declare-fun b!227926 () Bool)

(declare-fun res!191204 () Bool)

(assert (=> b!227926 (=> (not res!191204) (not e!156094))))

(assert (=> b!227926 (= res!191204 (bvslt i!761 to!496))))

(assert (= (and start!47918 res!191206) b!227925))

(assert (= (and b!227925 res!191205) b!227926))

(assert (= (and b!227926 res!191204) b!227927))

(assert (= start!47918 b!227928))

(declare-fun m!350923 () Bool)

(assert (=> start!47918 m!350923))

(declare-fun m!350925 () Bool)

(assert (=> start!47918 m!350925))

(declare-fun m!350927 () Bool)

(assert (=> b!227928 m!350927))

(declare-fun m!350929 () Bool)

(assert (=> b!227925 m!350929))

(declare-fun m!350931 () Bool)

(assert (=> b!227927 m!350931))

(declare-fun m!350933 () Bool)

(assert (=> b!227927 m!350933))

(declare-fun m!350935 () Bool)

(assert (=> b!227927 m!350935))

(declare-fun m!350937 () Bool)

(assert (=> b!227927 m!350937))

(declare-fun m!350939 () Bool)

(assert (=> b!227927 m!350939))

(declare-fun m!350941 () Bool)

(assert (=> b!227927 m!350941))

(declare-fun m!350943 () Bool)

(assert (=> b!227927 m!350943))

(declare-fun m!350945 () Bool)

(assert (=> b!227927 m!350945))

(declare-fun m!350947 () Bool)

(assert (=> b!227927 m!350947))

(declare-fun m!350949 () Bool)

(assert (=> b!227927 m!350949))

(declare-fun m!350951 () Bool)

(assert (=> b!227927 m!350951))

(declare-fun m!350953 () Bool)

(assert (=> b!227927 m!350953))

(declare-fun m!350955 () Bool)

(assert (=> b!227927 m!350955))

(declare-fun m!350957 () Bool)

(assert (=> b!227927 m!350957))

(push 1)

(assert (not b!227928))

(assert (not start!47918))

(assert (not b!227927))

(assert (not b!227925))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

