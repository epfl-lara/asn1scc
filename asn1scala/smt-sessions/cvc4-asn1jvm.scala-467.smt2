; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13396 () Bool)

(assert start!13396)

(declare-fun b!68760 () Bool)

(declare-fun res!56865 () Bool)

(declare-fun e!44966 () Bool)

(assert (=> b!68760 (=> res!56865 e!44966)))

(declare-datatypes ((array!2894 0))(
  ( (array!2895 (arr!1918 (Array (_ BitVec 32) (_ BitVec 8))) (size!1342 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2294 0))(
  ( (BitStream!2295 (buf!1723 array!2894) (currentByte!3419 (_ BitVec 32)) (currentBit!3414 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2294)

(declare-datatypes ((Unit!4617 0))(
  ( (Unit!4618) )
))
(declare-datatypes ((tuple2!6020 0))(
  ( (tuple2!6021 (_1!3121 Unit!4617) (_2!3121 BitStream!2294)) )
))
(declare-fun lt!110018 () tuple2!6020)

(assert (=> b!68760 (= res!56865 (not (= (size!1342 (buf!1723 thiss!1379)) (size!1342 (buf!1723 (_2!3121 lt!110018))))))))

(declare-fun b!68761 () Bool)

(declare-fun e!44963 () Bool)

(declare-fun e!44962 () Bool)

(assert (=> b!68761 (= e!44963 e!44962)))

(declare-fun res!56873 () Bool)

(assert (=> b!68761 (=> res!56873 e!44962)))

(declare-datatypes ((List!722 0))(
  ( (Nil!719) (Cons!718 (h!837 Bool) (t!1472 List!722)) )
))
(declare-fun lt!110012 () List!722)

(declare-fun lt!110009 () List!722)

(assert (=> b!68761 (= res!56873 (not (= lt!110012 lt!110009)))))

(assert (=> b!68761 (= lt!110009 lt!110012)))

(declare-fun lt!110023 () List!722)

(declare-fun tail!326 (List!722) List!722)

(assert (=> b!68761 (= lt!110012 (tail!326 lt!110023))))

(declare-datatypes ((tuple2!6022 0))(
  ( (tuple2!6023 (_1!3122 BitStream!2294) (_2!3122 BitStream!2294)) )
))
(declare-fun lt!110020 () tuple2!6022)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!110004 () Unit!4617)

(declare-fun lt!110005 () tuple2!6022)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2294 BitStream!2294 BitStream!2294 BitStream!2294 (_ BitVec 64) List!722) Unit!4617)

(assert (=> b!68761 (= lt!110004 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3121 lt!110018) (_2!3121 lt!110018) (_1!3122 lt!110005) (_1!3122 lt!110020) (bvsub to!314 i!635) lt!110023))))

(declare-fun b!68763 () Bool)

(declare-fun e!44965 () Bool)

(assert (=> b!68763 (= e!44962 e!44965)))

(declare-fun res!56871 () Bool)

(assert (=> b!68763 (=> res!56871 e!44965)))

(declare-fun lt!110003 () Bool)

(declare-fun lt!110007 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2894 (_ BitVec 64)) Bool)

(assert (=> b!68763 (= res!56871 (not (= lt!110003 (bitAt!0 (buf!1723 (_1!3122 lt!110020)) lt!110007))))))

(assert (=> b!68763 (= lt!110003 (bitAt!0 (buf!1723 (_1!3122 lt!110005)) lt!110007))))

(declare-fun b!68764 () Bool)

(declare-fun res!56869 () Bool)

(assert (=> b!68764 (=> res!56869 e!44965)))

(declare-fun head!541 (List!722) Bool)

(assert (=> b!68764 (= res!56869 (not (= (head!541 lt!110023) lt!110003)))))

(declare-fun b!68765 () Bool)

(declare-fun e!44970 () Bool)

(declare-fun e!44975 () Bool)

(assert (=> b!68765 (= e!44970 e!44975)))

(declare-fun res!56863 () Bool)

(assert (=> b!68765 (=> res!56863 e!44975)))

(declare-fun lt!110019 () tuple2!6020)

(declare-fun isPrefixOf!0 (BitStream!2294 BitStream!2294) Bool)

(assert (=> b!68765 (= res!56863 (not (isPrefixOf!0 thiss!1379 (_2!3121 lt!110019))))))

(declare-fun lt!110014 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!68765 (validate_offset_bits!1 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110019)))) ((_ sign_extend 32) (currentByte!3419 (_2!3121 lt!110019))) ((_ sign_extend 32) (currentBit!3414 (_2!3121 lt!110019))) lt!110014)))

(assert (=> b!68765 (= lt!110014 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!110022 () Unit!4617)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2294 BitStream!2294 (_ BitVec 64) (_ BitVec 64)) Unit!4617)

(assert (=> b!68765 (= lt!110022 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3121 lt!110019) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2894)

(declare-fun appendBitFromByte!0 (BitStream!2294 (_ BitVec 8) (_ BitVec 32)) tuple2!6020)

(assert (=> b!68765 (= lt!110019 (appendBitFromByte!0 thiss!1379 (select (arr!1918 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!68766 () Bool)

(declare-fun res!56874 () Bool)

(declare-fun e!44971 () Bool)

(assert (=> b!68766 (=> (not res!56874) (not e!44971))))

(assert (=> b!68766 (= res!56874 (validate_offset_bits!1 ((_ sign_extend 32) (size!1342 (buf!1723 thiss!1379))) ((_ sign_extend 32) (currentByte!3419 thiss!1379)) ((_ sign_extend 32) (currentBit!3414 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!68767 () Bool)

(declare-fun e!44973 () Bool)

(assert (=> b!68767 (= e!44973 e!44963)))

(declare-fun res!56870 () Bool)

(assert (=> b!68767 (=> res!56870 e!44963)))

(assert (=> b!68767 (= res!56870 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2294 BitStream!2294 (_ BitVec 64)) List!722)

(assert (=> b!68767 (= lt!110009 (bitStreamReadBitsIntoList!0 (_2!3121 lt!110018) (_1!3122 lt!110020) lt!110014))))

(assert (=> b!68767 (= lt!110023 (bitStreamReadBitsIntoList!0 (_2!3121 lt!110018) (_1!3122 lt!110005) (bvsub to!314 i!635)))))

(assert (=> b!68767 (validate_offset_bits!1 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110018)))) ((_ sign_extend 32) (currentByte!3419 (_2!3121 lt!110019))) ((_ sign_extend 32) (currentBit!3414 (_2!3121 lt!110019))) lt!110014)))

(declare-fun lt!110016 () Unit!4617)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2294 array!2894 (_ BitVec 64)) Unit!4617)

(assert (=> b!68767 (= lt!110016 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3121 lt!110019) (buf!1723 (_2!3121 lt!110018)) lt!110014))))

(declare-fun reader!0 (BitStream!2294 BitStream!2294) tuple2!6022)

(assert (=> b!68767 (= lt!110020 (reader!0 (_2!3121 lt!110019) (_2!3121 lt!110018)))))

(assert (=> b!68767 (validate_offset_bits!1 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110018)))) ((_ sign_extend 32) (currentByte!3419 thiss!1379)) ((_ sign_extend 32) (currentBit!3414 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!110011 () Unit!4617)

(assert (=> b!68767 (= lt!110011 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1723 (_2!3121 lt!110018)) (bvsub to!314 i!635)))))

(assert (=> b!68767 (= lt!110005 (reader!0 thiss!1379 (_2!3121 lt!110018)))))

(declare-fun b!68768 () Bool)

(declare-fun e!44972 () Bool)

(assert (=> b!68768 (= e!44965 e!44972)))

(declare-fun res!56880 () Bool)

(assert (=> b!68768 (=> res!56880 e!44972)))

(declare-fun lt!110006 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2294 array!2894 (_ BitVec 64) (_ BitVec 64)) List!722)

(assert (=> b!68768 (= res!56880 (not (= (head!541 (byteArrayBitContentToList!0 (_2!3121 lt!110018) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!110006)))))

(assert (=> b!68768 (= lt!110006 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!68769 () Bool)

(declare-fun res!56866 () Bool)

(assert (=> b!68769 (=> res!56866 e!44963)))

(declare-fun length!350 (List!722) Int)

(assert (=> b!68769 (= res!56866 (<= (length!350 lt!110023) 0))))

(declare-fun b!68770 () Bool)

(declare-fun e!44967 () Bool)

(declare-fun array_inv!1206 (array!2894) Bool)

(assert (=> b!68770 (= e!44967 (array_inv!1206 (buf!1723 thiss!1379)))))

(declare-fun b!68771 () Bool)

(declare-fun e!44974 () Bool)

(assert (=> b!68771 (= e!44975 e!44974)))

(declare-fun res!56862 () Bool)

(assert (=> b!68771 (=> res!56862 e!44974)))

(assert (=> b!68771 (= res!56862 (not (isPrefixOf!0 (_2!3121 lt!110019) (_2!3121 lt!110018))))))

(assert (=> b!68771 (isPrefixOf!0 thiss!1379 (_2!3121 lt!110018))))

(declare-fun lt!110013 () Unit!4617)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2294 BitStream!2294 BitStream!2294) Unit!4617)

(assert (=> b!68771 (= lt!110013 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3121 lt!110019) (_2!3121 lt!110018)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2294 array!2894 (_ BitVec 64) (_ BitVec 64)) tuple2!6020)

(assert (=> b!68771 (= lt!110018 (appendBitsMSBFirstLoop!0 (_2!3121 lt!110019) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!44969 () Bool)

(assert (=> b!68771 e!44969))

(declare-fun res!56872 () Bool)

(assert (=> b!68771 (=> (not res!56872) (not e!44969))))

(assert (=> b!68771 (= res!56872 (validate_offset_bits!1 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110019)))) ((_ sign_extend 32) (currentByte!3419 thiss!1379)) ((_ sign_extend 32) (currentBit!3414 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!110021 () Unit!4617)

(assert (=> b!68771 (= lt!110021 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1723 (_2!3121 lt!110019)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!110008 () tuple2!6022)

(assert (=> b!68771 (= lt!110008 (reader!0 thiss!1379 (_2!3121 lt!110019)))))

(declare-fun res!56868 () Bool)

(assert (=> start!13396 (=> (not res!56868) (not e!44971))))

(assert (=> start!13396 (= res!56868 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1342 srcBuffer!2))))))))

(assert (=> start!13396 e!44971))

(assert (=> start!13396 true))

(assert (=> start!13396 (array_inv!1206 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2294) Bool)

(assert (=> start!13396 (and (inv!12 thiss!1379) e!44967)))

(declare-fun b!68762 () Bool)

(declare-fun lt!110010 () (_ BitVec 64))

(assert (=> b!68762 (= e!44972 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!110010) (bvsle lt!110010 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110019))))))))))

(declare-fun b!68772 () Bool)

(assert (=> b!68772 (= e!44969 (= (head!541 (byteArrayBitContentToList!0 (_2!3121 lt!110019) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!541 (bitStreamReadBitsIntoList!0 (_2!3121 lt!110019) (_1!3122 lt!110008) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!68773 () Bool)

(assert (=> b!68773 (= e!44971 (not e!44970))))

(declare-fun res!56877 () Bool)

(assert (=> b!68773 (=> res!56877 e!44970)))

(assert (=> b!68773 (= res!56877 (bvsge i!635 to!314))))

(assert (=> b!68773 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!110015 () Unit!4617)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2294) Unit!4617)

(assert (=> b!68773 (= lt!110015 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!68773 (= lt!110007 (bitIndex!0 (size!1342 (buf!1723 thiss!1379)) (currentByte!3419 thiss!1379) (currentBit!3414 thiss!1379)))))

(declare-fun b!68774 () Bool)

(declare-fun res!56876 () Bool)

(assert (=> b!68774 (=> res!56876 e!44973)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!68774 (= res!56876 (not (invariant!0 (currentBit!3414 (_2!3121 lt!110019)) (currentByte!3419 (_2!3121 lt!110019)) (size!1342 (buf!1723 (_2!3121 lt!110018))))))))

(declare-fun b!68775 () Bool)

(assert (=> b!68775 (= e!44966 e!44973)))

(declare-fun res!56864 () Bool)

(assert (=> b!68775 (=> res!56864 e!44973)))

(assert (=> b!68775 (= res!56864 (not (= (size!1342 (buf!1723 (_2!3121 lt!110019))) (size!1342 (buf!1723 (_2!3121 lt!110018))))))))

(declare-fun lt!110017 () (_ BitVec 64))

(assert (=> b!68775 (= lt!110017 (bvsub (bvsub (bvadd lt!110010 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!68775 (= lt!110010 (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110019))) (currentByte!3419 (_2!3121 lt!110019)) (currentBit!3414 (_2!3121 lt!110019))))))

(assert (=> b!68775 (= (size!1342 (buf!1723 (_2!3121 lt!110018))) (size!1342 (buf!1723 thiss!1379)))))

(declare-fun b!68776 () Bool)

(declare-fun res!56867 () Bool)

(assert (=> b!68776 (=> res!56867 e!44973)))

(assert (=> b!68776 (= res!56867 (not (invariant!0 (currentBit!3414 (_2!3121 lt!110019)) (currentByte!3419 (_2!3121 lt!110019)) (size!1342 (buf!1723 (_2!3121 lt!110019))))))))

(declare-fun b!68777 () Bool)

(assert (=> b!68777 (= e!44974 e!44966)))

(declare-fun res!56879 () Bool)

(assert (=> b!68777 (=> res!56879 e!44966)))

(assert (=> b!68777 (= res!56879 (not (= lt!110017 (bvsub (bvadd lt!110007 to!314) i!635))))))

(assert (=> b!68777 (= lt!110017 (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110018))) (currentByte!3419 (_2!3121 lt!110018)) (currentBit!3414 (_2!3121 lt!110018))))))

(declare-fun b!68778 () Bool)

(declare-fun res!56875 () Bool)

(assert (=> b!68778 (=> res!56875 e!44972)))

(assert (=> b!68778 (= res!56875 (not (= (bitAt!0 (buf!1723 (_2!3121 lt!110019)) lt!110007) lt!110006)))))

(declare-fun b!68779 () Bool)

(declare-fun res!56878 () Bool)

(assert (=> b!68779 (=> res!56878 e!44966)))

(assert (=> b!68779 (= res!56878 (not (invariant!0 (currentBit!3414 (_2!3121 lt!110018)) (currentByte!3419 (_2!3121 lt!110018)) (size!1342 (buf!1723 (_2!3121 lt!110018))))))))

(assert (= (and start!13396 res!56868) b!68766))

(assert (= (and b!68766 res!56874) b!68773))

(assert (= (and b!68773 (not res!56877)) b!68765))

(assert (= (and b!68765 (not res!56863)) b!68771))

(assert (= (and b!68771 res!56872) b!68772))

(assert (= (and b!68771 (not res!56862)) b!68777))

(assert (= (and b!68777 (not res!56879)) b!68779))

(assert (= (and b!68779 (not res!56878)) b!68760))

(assert (= (and b!68760 (not res!56865)) b!68775))

(assert (= (and b!68775 (not res!56864)) b!68776))

(assert (= (and b!68776 (not res!56867)) b!68774))

(assert (= (and b!68774 (not res!56876)) b!68767))

(assert (= (and b!68767 (not res!56870)) b!68769))

(assert (= (and b!68769 (not res!56866)) b!68761))

(assert (= (and b!68761 (not res!56873)) b!68763))

(assert (= (and b!68763 (not res!56871)) b!68764))

(assert (= (and b!68764 (not res!56869)) b!68768))

(assert (= (and b!68768 (not res!56880)) b!68778))

(assert (= (and b!68778 (not res!56875)) b!68762))

(assert (= start!13396 b!68770))

(declare-fun m!109787 () Bool)

(assert (=> b!68763 m!109787))

(declare-fun m!109789 () Bool)

(assert (=> b!68763 m!109789))

(declare-fun m!109791 () Bool)

(assert (=> b!68777 m!109791))

(declare-fun m!109793 () Bool)

(assert (=> b!68764 m!109793))

(declare-fun m!109795 () Bool)

(assert (=> start!13396 m!109795))

(declare-fun m!109797 () Bool)

(assert (=> start!13396 m!109797))

(declare-fun m!109799 () Bool)

(assert (=> b!68774 m!109799))

(declare-fun m!109801 () Bool)

(assert (=> b!68773 m!109801))

(declare-fun m!109803 () Bool)

(assert (=> b!68773 m!109803))

(declare-fun m!109805 () Bool)

(assert (=> b!68773 m!109805))

(declare-fun m!109807 () Bool)

(assert (=> b!68769 m!109807))

(declare-fun m!109809 () Bool)

(assert (=> b!68775 m!109809))

(declare-fun m!109811 () Bool)

(assert (=> b!68768 m!109811))

(assert (=> b!68768 m!109811))

(declare-fun m!109813 () Bool)

(assert (=> b!68768 m!109813))

(declare-fun m!109815 () Bool)

(assert (=> b!68768 m!109815))

(declare-fun m!109817 () Bool)

(assert (=> b!68766 m!109817))

(declare-fun m!109819 () Bool)

(assert (=> b!68776 m!109819))

(declare-fun m!109821 () Bool)

(assert (=> b!68778 m!109821))

(declare-fun m!109823 () Bool)

(assert (=> b!68772 m!109823))

(assert (=> b!68772 m!109823))

(declare-fun m!109825 () Bool)

(assert (=> b!68772 m!109825))

(declare-fun m!109827 () Bool)

(assert (=> b!68772 m!109827))

(assert (=> b!68772 m!109827))

(declare-fun m!109829 () Bool)

(assert (=> b!68772 m!109829))

(declare-fun m!109831 () Bool)

(assert (=> b!68767 m!109831))

(declare-fun m!109833 () Bool)

(assert (=> b!68767 m!109833))

(declare-fun m!109835 () Bool)

(assert (=> b!68767 m!109835))

(declare-fun m!109837 () Bool)

(assert (=> b!68767 m!109837))

(declare-fun m!109839 () Bool)

(assert (=> b!68767 m!109839))

(declare-fun m!109841 () Bool)

(assert (=> b!68767 m!109841))

(declare-fun m!109843 () Bool)

(assert (=> b!68767 m!109843))

(declare-fun m!109845 () Bool)

(assert (=> b!68767 m!109845))

(declare-fun m!109847 () Bool)

(assert (=> b!68771 m!109847))

(declare-fun m!109849 () Bool)

(assert (=> b!68771 m!109849))

(declare-fun m!109851 () Bool)

(assert (=> b!68771 m!109851))

(declare-fun m!109853 () Bool)

(assert (=> b!68771 m!109853))

(declare-fun m!109855 () Bool)

(assert (=> b!68771 m!109855))

(declare-fun m!109857 () Bool)

(assert (=> b!68771 m!109857))

(declare-fun m!109859 () Bool)

(assert (=> b!68771 m!109859))

(declare-fun m!109861 () Bool)

(assert (=> b!68761 m!109861))

(declare-fun m!109863 () Bool)

(assert (=> b!68761 m!109863))

(declare-fun m!109865 () Bool)

(assert (=> b!68765 m!109865))

(declare-fun m!109867 () Bool)

(assert (=> b!68765 m!109867))

(declare-fun m!109869 () Bool)

(assert (=> b!68765 m!109869))

(assert (=> b!68765 m!109865))

(declare-fun m!109871 () Bool)

(assert (=> b!68765 m!109871))

(declare-fun m!109873 () Bool)

(assert (=> b!68765 m!109873))

(declare-fun m!109875 () Bool)

(assert (=> b!68779 m!109875))

(declare-fun m!109877 () Bool)

(assert (=> b!68770 m!109877))

(push 1)

(assert (not b!68764))

(assert (not b!68775))

(assert (not b!68776))

(assert (not b!68769))

(assert (not b!68766))

(assert (not b!68778))

(assert (not b!68768))

(assert (not b!68761))

(assert (not b!68772))

(assert (not b!68774))

(assert (not b!68770))

(assert (not start!13396))

(assert (not b!68765))

(assert (not b!68763))

(assert (not b!68777))

(assert (not b!68767))

(assert (not b!68771))

(assert (not b!68779))

(assert (not b!68773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!21936 () Bool)

(assert (=> d!21936 (= (head!541 lt!110023) (h!837 lt!110023))))

(assert (=> b!68764 d!21936))

(declare-fun d!21938 () Bool)

(assert (=> d!21938 (= (bitAt!0 (buf!1723 (_1!3122 lt!110020)) lt!110007) (not (= (bvand ((_ sign_extend 24) (select (arr!1918 (buf!1723 (_1!3122 lt!110020))) ((_ extract 31 0) (bvsdiv lt!110007 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!110007 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5290 () Bool)

(assert (= bs!5290 d!21938))

(declare-fun m!110041 () Bool)

(assert (=> bs!5290 m!110041))

(declare-fun m!110043 () Bool)

(assert (=> bs!5290 m!110043))

(assert (=> b!68763 d!21938))

(declare-fun d!21940 () Bool)

(assert (=> d!21940 (= (bitAt!0 (buf!1723 (_1!3122 lt!110005)) lt!110007) (not (= (bvand ((_ sign_extend 24) (select (arr!1918 (buf!1723 (_1!3122 lt!110005))) ((_ extract 31 0) (bvsdiv lt!110007 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!110007 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5291 () Bool)

(assert (= bs!5291 d!21940))

(declare-fun m!110045 () Bool)

(assert (=> bs!5291 m!110045))

(assert (=> bs!5291 m!110043))

(assert (=> b!68763 d!21940))

(declare-fun d!21942 () Bool)

(assert (=> d!21942 (= (invariant!0 (currentBit!3414 (_2!3121 lt!110019)) (currentByte!3419 (_2!3121 lt!110019)) (size!1342 (buf!1723 (_2!3121 lt!110018)))) (and (bvsge (currentBit!3414 (_2!3121 lt!110019)) #b00000000000000000000000000000000) (bvslt (currentBit!3414 (_2!3121 lt!110019)) #b00000000000000000000000000001000) (bvsge (currentByte!3419 (_2!3121 lt!110019)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3419 (_2!3121 lt!110019)) (size!1342 (buf!1723 (_2!3121 lt!110018)))) (and (= (currentBit!3414 (_2!3121 lt!110019)) #b00000000000000000000000000000000) (= (currentByte!3419 (_2!3121 lt!110019)) (size!1342 (buf!1723 (_2!3121 lt!110018))))))))))

(assert (=> b!68774 d!21942))

(declare-fun d!21944 () Bool)

(declare-fun res!56958 () Bool)

(declare-fun e!45043 () Bool)

(assert (=> d!21944 (=> (not res!56958) (not e!45043))))

(assert (=> d!21944 (= res!56958 (= (size!1342 (buf!1723 thiss!1379)) (size!1342 (buf!1723 thiss!1379))))))

(assert (=> d!21944 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!45043)))

(declare-fun b!68905 () Bool)

(declare-fun res!56957 () Bool)

(assert (=> b!68905 (=> (not res!56957) (not e!45043))))

(assert (=> b!68905 (= res!56957 (bvsle (bitIndex!0 (size!1342 (buf!1723 thiss!1379)) (currentByte!3419 thiss!1379) (currentBit!3414 thiss!1379)) (bitIndex!0 (size!1342 (buf!1723 thiss!1379)) (currentByte!3419 thiss!1379) (currentBit!3414 thiss!1379))))))

(declare-fun b!68906 () Bool)

(declare-fun e!45042 () Bool)

(assert (=> b!68906 (= e!45043 e!45042)))

(declare-fun res!56959 () Bool)

(assert (=> b!68906 (=> res!56959 e!45042)))

(assert (=> b!68906 (= res!56959 (= (size!1342 (buf!1723 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!68907 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2894 array!2894 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!68907 (= e!45042 (arrayBitRangesEq!0 (buf!1723 thiss!1379) (buf!1723 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1342 (buf!1723 thiss!1379)) (currentByte!3419 thiss!1379) (currentBit!3414 thiss!1379))))))

(assert (= (and d!21944 res!56958) b!68905))

(assert (= (and b!68905 res!56957) b!68906))

(assert (= (and b!68906 (not res!56959)) b!68907))

(assert (=> b!68905 m!109805))

(assert (=> b!68905 m!109805))

(assert (=> b!68907 m!109805))

(assert (=> b!68907 m!109805))

(declare-fun m!110047 () Bool)

(assert (=> b!68907 m!110047))

(assert (=> b!68773 d!21944))

(declare-fun d!21946 () Bool)

(assert (=> d!21946 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!110233 () Unit!4617)

(declare-fun choose!11 (BitStream!2294) Unit!4617)

(assert (=> d!21946 (= lt!110233 (choose!11 thiss!1379))))

(assert (=> d!21946 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!110233)))

(declare-fun bs!5293 () Bool)

(assert (= bs!5293 d!21946))

(assert (=> bs!5293 m!109801))

(declare-fun m!110049 () Bool)

(assert (=> bs!5293 m!110049))

(assert (=> b!68773 d!21946))

(declare-fun d!21948 () Bool)

(declare-fun e!45046 () Bool)

(assert (=> d!21948 e!45046))

(declare-fun res!56964 () Bool)

(assert (=> d!21948 (=> (not res!56964) (not e!45046))))

(declare-fun lt!110247 () (_ BitVec 64))

(declare-fun lt!110246 () (_ BitVec 64))

(declare-fun lt!110249 () (_ BitVec 64))

(assert (=> d!21948 (= res!56964 (= lt!110246 (bvsub lt!110247 lt!110249)))))

(assert (=> d!21948 (or (= (bvand lt!110247 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110249 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!110247 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!110247 lt!110249) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!21948 (= lt!110249 (remainingBits!0 ((_ sign_extend 32) (size!1342 (buf!1723 thiss!1379))) ((_ sign_extend 32) (currentByte!3419 thiss!1379)) ((_ sign_extend 32) (currentBit!3414 thiss!1379))))))

(declare-fun lt!110250 () (_ BitVec 64))

(declare-fun lt!110248 () (_ BitVec 64))

(assert (=> d!21948 (= lt!110247 (bvmul lt!110250 lt!110248))))

(assert (=> d!21948 (or (= lt!110250 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!110248 (bvsdiv (bvmul lt!110250 lt!110248) lt!110250)))))

(assert (=> d!21948 (= lt!110248 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21948 (= lt!110250 ((_ sign_extend 32) (size!1342 (buf!1723 thiss!1379))))))

(assert (=> d!21948 (= lt!110246 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3419 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3414 thiss!1379))))))

(assert (=> d!21948 (invariant!0 (currentBit!3414 thiss!1379) (currentByte!3419 thiss!1379) (size!1342 (buf!1723 thiss!1379)))))

(assert (=> d!21948 (= (bitIndex!0 (size!1342 (buf!1723 thiss!1379)) (currentByte!3419 thiss!1379) (currentBit!3414 thiss!1379)) lt!110246)))

(declare-fun b!68912 () Bool)

(declare-fun res!56965 () Bool)

(assert (=> b!68912 (=> (not res!56965) (not e!45046))))

(assert (=> b!68912 (= res!56965 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!110246))))

(declare-fun b!68913 () Bool)

(declare-fun lt!110251 () (_ BitVec 64))

(assert (=> b!68913 (= e!45046 (bvsle lt!110246 (bvmul lt!110251 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!68913 (or (= lt!110251 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!110251 #b0000000000000000000000000000000000000000000000000000000000001000) lt!110251)))))

(assert (=> b!68913 (= lt!110251 ((_ sign_extend 32) (size!1342 (buf!1723 thiss!1379))))))

(assert (= (and d!21948 res!56964) b!68912))

(assert (= (and b!68912 res!56965) b!68913))

(declare-fun m!110051 () Bool)

(assert (=> d!21948 m!110051))

(declare-fun m!110053 () Bool)

(assert (=> d!21948 m!110053))

(assert (=> b!68773 d!21948))

(declare-fun d!21950 () Bool)

(assert (=> d!21950 (= (tail!326 lt!110023) (t!1472 lt!110023))))

(assert (=> b!68761 d!21950))

(declare-fun d!21952 () Bool)

(declare-fun e!45053 () Bool)

(assert (=> d!21952 e!45053))

(declare-fun res!56974 () Bool)

(assert (=> d!21952 (=> (not res!56974) (not e!45053))))

(declare-fun lt!110297 () (_ BitVec 64))

(assert (=> d!21952 (= res!56974 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110297 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!110297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!21952 (= lt!110297 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!110296 () Unit!4617)

(declare-fun choose!42 (BitStream!2294 BitStream!2294 BitStream!2294 BitStream!2294 (_ BitVec 64) List!722) Unit!4617)

(assert (=> d!21952 (= lt!110296 (choose!42 (_2!3121 lt!110018) (_2!3121 lt!110018) (_1!3122 lt!110005) (_1!3122 lt!110020) (bvsub to!314 i!635) lt!110023))))

(assert (=> d!21952 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21952 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3121 lt!110018) (_2!3121 lt!110018) (_1!3122 lt!110005) (_1!3122 lt!110020) (bvsub to!314 i!635) lt!110023) lt!110296)))

(declare-fun b!68926 () Bool)

(assert (=> b!68926 (= e!45053 (= (bitStreamReadBitsIntoList!0 (_2!3121 lt!110018) (_1!3122 lt!110020) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!326 lt!110023)))))

(assert (= (and d!21952 res!56974) b!68926))

(declare-fun m!110055 () Bool)

(assert (=> d!21952 m!110055))

(declare-fun m!110057 () Bool)

(assert (=> b!68926 m!110057))

(assert (=> b!68926 m!109861))

(assert (=> b!68761 d!21952))

(declare-fun d!21954 () Bool)

(assert (=> d!21954 (= (head!541 (byteArrayBitContentToList!0 (_2!3121 lt!110019) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!837 (byteArrayBitContentToList!0 (_2!3121 lt!110019) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!68772 d!21954))

(declare-fun d!21956 () Bool)

(declare-fun c!5091 () Bool)

(assert (=> d!21956 (= c!5091 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!45062 () List!722)

(assert (=> d!21956 (= (byteArrayBitContentToList!0 (_2!3121 lt!110019) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!45062)))

(declare-fun b!68945 () Bool)

(assert (=> b!68945 (= e!45062 Nil!719)))

(declare-fun b!68946 () Bool)

(assert (=> b!68946 (= e!45062 (Cons!718 (not (= (bvand ((_ sign_extend 24) (select (arr!1918 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3121 lt!110019) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21956 c!5091) b!68945))

(assert (= (and d!21956 (not c!5091)) b!68946))

(assert (=> b!68946 m!109865))

(declare-fun m!110125 () Bool)

(assert (=> b!68946 m!110125))

(declare-fun m!110127 () Bool)

(assert (=> b!68946 m!110127))

(assert (=> b!68772 d!21956))

(declare-fun d!21970 () Bool)

(assert (=> d!21970 (= (head!541 (bitStreamReadBitsIntoList!0 (_2!3121 lt!110019) (_1!3122 lt!110008) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!837 (bitStreamReadBitsIntoList!0 (_2!3121 lt!110019) (_1!3122 lt!110008) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!68772 d!21970))

(declare-fun b!68955 () Bool)

(declare-datatypes ((tuple2!6036 0))(
  ( (tuple2!6037 (_1!3129 List!722) (_2!3129 BitStream!2294)) )
))
(declare-fun e!45067 () tuple2!6036)

(assert (=> b!68955 (= e!45067 (tuple2!6037 Nil!719 (_1!3122 lt!110008)))))

(declare-fun b!68958 () Bool)

(declare-fun e!45068 () Bool)

(declare-fun lt!110350 () List!722)

(assert (=> b!68958 (= e!45068 (> (length!350 lt!110350) 0))))

(declare-fun d!21972 () Bool)

(assert (=> d!21972 e!45068))

(declare-fun c!5096 () Bool)

(assert (=> d!21972 (= c!5096 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21972 (= lt!110350 (_1!3129 e!45067))))

(declare-fun c!5097 () Bool)

(assert (=> d!21972 (= c!5097 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21972 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21972 (= (bitStreamReadBitsIntoList!0 (_2!3121 lt!110019) (_1!3122 lt!110008) #b0000000000000000000000000000000000000000000000000000000000000001) lt!110350)))

(declare-fun b!68957 () Bool)

(declare-fun isEmpty!221 (List!722) Bool)

(assert (=> b!68957 (= e!45068 (isEmpty!221 lt!110350))))

(declare-fun lt!110348 () (_ BitVec 64))

(declare-fun b!68956 () Bool)

(declare-datatypes ((tuple2!6040 0))(
  ( (tuple2!6041 (_1!3131 Bool) (_2!3131 BitStream!2294)) )
))
(declare-fun lt!110349 () tuple2!6040)

(assert (=> b!68956 (= e!45067 (tuple2!6037 (Cons!718 (_1!3131 lt!110349) (bitStreamReadBitsIntoList!0 (_2!3121 lt!110019) (_2!3131 lt!110349) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!110348))) (_2!3131 lt!110349)))))

(declare-fun readBit!0 (BitStream!2294) tuple2!6040)

(assert (=> b!68956 (= lt!110349 (readBit!0 (_1!3122 lt!110008)))))

(assert (=> b!68956 (= lt!110348 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!21972 c!5097) b!68955))

(assert (= (and d!21972 (not c!5097)) b!68956))

(assert (= (and d!21972 c!5096) b!68957))

(assert (= (and d!21972 (not c!5096)) b!68958))

(declare-fun m!110129 () Bool)

(assert (=> b!68958 m!110129))

(declare-fun m!110131 () Bool)

(assert (=> b!68957 m!110131))

(declare-fun m!110133 () Bool)

(assert (=> b!68956 m!110133))

(declare-fun m!110135 () Bool)

(assert (=> b!68956 m!110135))

(assert (=> b!68772 d!21972))

(declare-fun d!21974 () Bool)

(assert (=> d!21974 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110019)))) ((_ sign_extend 32) (currentByte!3419 thiss!1379)) ((_ sign_extend 32) (currentBit!3414 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110019)))) ((_ sign_extend 32) (currentByte!3419 thiss!1379)) ((_ sign_extend 32) (currentBit!3414 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5297 () Bool)

(assert (= bs!5297 d!21974))

(declare-fun m!110137 () Bool)

(assert (=> bs!5297 m!110137))

(assert (=> b!68771 d!21974))

(declare-fun d!21976 () Bool)

(assert (=> d!21976 (validate_offset_bits!1 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110019)))) ((_ sign_extend 32) (currentByte!3419 thiss!1379)) ((_ sign_extend 32) (currentBit!3414 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!110353 () Unit!4617)

(declare-fun choose!9 (BitStream!2294 array!2894 (_ BitVec 64) BitStream!2294) Unit!4617)

(assert (=> d!21976 (= lt!110353 (choose!9 thiss!1379 (buf!1723 (_2!3121 lt!110019)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2295 (buf!1723 (_2!3121 lt!110019)) (currentByte!3419 thiss!1379) (currentBit!3414 thiss!1379))))))

(assert (=> d!21976 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1723 (_2!3121 lt!110019)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!110353)))

(declare-fun bs!5298 () Bool)

(assert (= bs!5298 d!21976))

(assert (=> bs!5298 m!109857))

(declare-fun m!110139 () Bool)

(assert (=> bs!5298 m!110139))

(assert (=> b!68771 d!21976))

(declare-fun lt!110769 () tuple2!6022)

(declare-fun b!69036 () Bool)

(declare-fun lt!110753 () tuple2!6020)

(declare-fun e!45101 () Bool)

(assert (=> b!69036 (= e!45101 (= (bitStreamReadBitsIntoList!0 (_2!3121 lt!110753) (_1!3122 lt!110769) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3121 lt!110753) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!69036 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69036 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!110765 () Unit!4617)

(declare-fun lt!110778 () Unit!4617)

(assert (=> b!69036 (= lt!110765 lt!110778)))

(declare-fun lt!110779 () (_ BitVec 64))

(assert (=> b!69036 (validate_offset_bits!1 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110753)))) ((_ sign_extend 32) (currentByte!3419 (_2!3121 lt!110019))) ((_ sign_extend 32) (currentBit!3414 (_2!3121 lt!110019))) lt!110779)))

(assert (=> b!69036 (= lt!110778 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3121 lt!110019) (buf!1723 (_2!3121 lt!110753)) lt!110779))))

(declare-fun e!45100 () Bool)

(assert (=> b!69036 e!45100))

(declare-fun res!57039 () Bool)

(assert (=> b!69036 (=> (not res!57039) (not e!45100))))

(assert (=> b!69036 (= res!57039 (and (= (size!1342 (buf!1723 (_2!3121 lt!110019))) (size!1342 (buf!1723 (_2!3121 lt!110753)))) (bvsge lt!110779 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69036 (= lt!110779 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!69036 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69036 (= lt!110769 (reader!0 (_2!3121 lt!110019) (_2!3121 lt!110753)))))

(declare-fun lt!110785 () tuple2!6020)

(declare-fun bm!886 () Bool)

(declare-fun call!889 () tuple2!6022)

(declare-fun c!5108 () Bool)

(assert (=> bm!886 (= call!889 (reader!0 (_2!3121 lt!110019) (ite c!5108 (_2!3121 lt!110785) (_2!3121 lt!110019))))))

(declare-fun b!69037 () Bool)

(declare-fun e!45099 () tuple2!6020)

(declare-fun Unit!4638 () Unit!4617)

(assert (=> b!69037 (= e!45099 (tuple2!6021 Unit!4638 (_2!3121 lt!110019)))))

(assert (=> b!69037 (= (size!1342 (buf!1723 (_2!3121 lt!110019))) (size!1342 (buf!1723 (_2!3121 lt!110019))))))

(declare-fun lt!110772 () Unit!4617)

(declare-fun Unit!4639 () Unit!4617)

(assert (=> b!69037 (= lt!110772 Unit!4639)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2294 array!2894 array!2894 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!6042 0))(
  ( (tuple2!6043 (_1!3132 array!2894) (_2!3132 BitStream!2294)) )
))
(declare-fun readBits!0 (BitStream!2294 (_ BitVec 64)) tuple2!6042)

(assert (=> b!69037 (checkByteArrayBitContent!0 (_2!3121 lt!110019) srcBuffer!2 (_1!3132 (readBits!0 (_1!3122 call!889) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!69038 () Bool)

(declare-fun lt!110750 () tuple2!6020)

(declare-fun Unit!4640 () Unit!4617)

(assert (=> b!69038 (= e!45099 (tuple2!6021 Unit!4640 (_2!3121 lt!110750)))))

(assert (=> b!69038 (= lt!110785 (appendBitFromByte!0 (_2!3121 lt!110019) (select (arr!1918 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!110773 () (_ BitVec 64))

(assert (=> b!69038 (= lt!110773 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!110784 () (_ BitVec 64))

(assert (=> b!69038 (= lt!110784 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!110791 () Unit!4617)

(assert (=> b!69038 (= lt!110791 (validateOffsetBitsIneqLemma!0 (_2!3121 lt!110019) (_2!3121 lt!110785) lt!110773 lt!110784))))

(assert (=> b!69038 (validate_offset_bits!1 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110785)))) ((_ sign_extend 32) (currentByte!3419 (_2!3121 lt!110785))) ((_ sign_extend 32) (currentBit!3414 (_2!3121 lt!110785))) (bvsub lt!110773 lt!110784))))

(declare-fun lt!110760 () Unit!4617)

(assert (=> b!69038 (= lt!110760 lt!110791)))

(declare-fun lt!110761 () tuple2!6022)

(assert (=> b!69038 (= lt!110761 call!889)))

(declare-fun lt!110776 () (_ BitVec 64))

(assert (=> b!69038 (= lt!110776 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!110790 () Unit!4617)

(assert (=> b!69038 (= lt!110790 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3121 lt!110019) (buf!1723 (_2!3121 lt!110785)) lt!110776))))

(assert (=> b!69038 (validate_offset_bits!1 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110785)))) ((_ sign_extend 32) (currentByte!3419 (_2!3121 lt!110019))) ((_ sign_extend 32) (currentBit!3414 (_2!3121 lt!110019))) lt!110776)))

(declare-fun lt!110755 () Unit!4617)

(assert (=> b!69038 (= lt!110755 lt!110790)))

(assert (=> b!69038 (= (head!541 (byteArrayBitContentToList!0 (_2!3121 lt!110785) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!541 (bitStreamReadBitsIntoList!0 (_2!3121 lt!110785) (_1!3122 lt!110761) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!110786 () Unit!4617)

(declare-fun Unit!4641 () Unit!4617)

(assert (=> b!69038 (= lt!110786 Unit!4641)))

(assert (=> b!69038 (= lt!110750 (appendBitsMSBFirstLoop!0 (_2!3121 lt!110785) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!110777 () Unit!4617)

(assert (=> b!69038 (= lt!110777 (lemmaIsPrefixTransitive!0 (_2!3121 lt!110019) (_2!3121 lt!110785) (_2!3121 lt!110750)))))

(assert (=> b!69038 (isPrefixOf!0 (_2!3121 lt!110019) (_2!3121 lt!110750))))

(declare-fun lt!110757 () Unit!4617)

(assert (=> b!69038 (= lt!110757 lt!110777)))

(assert (=> b!69038 (= (size!1342 (buf!1723 (_2!3121 lt!110750))) (size!1342 (buf!1723 (_2!3121 lt!110019))))))

(declare-fun lt!110771 () Unit!4617)

(declare-fun Unit!4642 () Unit!4617)

(assert (=> b!69038 (= lt!110771 Unit!4642)))

(assert (=> b!69038 (= (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110750))) (currentByte!3419 (_2!3121 lt!110750)) (currentBit!3414 (_2!3121 lt!110750))) (bvsub (bvadd (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110019))) (currentByte!3419 (_2!3121 lt!110019)) (currentBit!3414 (_2!3121 lt!110019))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!110762 () Unit!4617)

(declare-fun Unit!4643 () Unit!4617)

(assert (=> b!69038 (= lt!110762 Unit!4643)))

(assert (=> b!69038 (= (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110750))) (currentByte!3419 (_2!3121 lt!110750)) (currentBit!3414 (_2!3121 lt!110750))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110785))) (currentByte!3419 (_2!3121 lt!110785)) (currentBit!3414 (_2!3121 lt!110785))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!110788 () Unit!4617)

(declare-fun Unit!4644 () Unit!4617)

(assert (=> b!69038 (= lt!110788 Unit!4644)))

(declare-fun lt!110751 () tuple2!6022)

(assert (=> b!69038 (= lt!110751 (reader!0 (_2!3121 lt!110019) (_2!3121 lt!110750)))))

(declare-fun lt!110754 () (_ BitVec 64))

(assert (=> b!69038 (= lt!110754 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!110766 () Unit!4617)

(assert (=> b!69038 (= lt!110766 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3121 lt!110019) (buf!1723 (_2!3121 lt!110750)) lt!110754))))

(assert (=> b!69038 (validate_offset_bits!1 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110750)))) ((_ sign_extend 32) (currentByte!3419 (_2!3121 lt!110019))) ((_ sign_extend 32) (currentBit!3414 (_2!3121 lt!110019))) lt!110754)))

(declare-fun lt!110763 () Unit!4617)

(assert (=> b!69038 (= lt!110763 lt!110766)))

(declare-fun lt!110775 () tuple2!6022)

(assert (=> b!69038 (= lt!110775 (reader!0 (_2!3121 lt!110785) (_2!3121 lt!110750)))))

(declare-fun lt!110793 () (_ BitVec 64))

(assert (=> b!69038 (= lt!110793 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!110752 () Unit!4617)

(assert (=> b!69038 (= lt!110752 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3121 lt!110785) (buf!1723 (_2!3121 lt!110750)) lt!110793))))

(assert (=> b!69038 (validate_offset_bits!1 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110750)))) ((_ sign_extend 32) (currentByte!3419 (_2!3121 lt!110785))) ((_ sign_extend 32) (currentBit!3414 (_2!3121 lt!110785))) lt!110793)))

(declare-fun lt!110764 () Unit!4617)

(assert (=> b!69038 (= lt!110764 lt!110752)))

(declare-fun lt!110768 () List!722)

(assert (=> b!69038 (= lt!110768 (byteArrayBitContentToList!0 (_2!3121 lt!110750) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!110758 () List!722)

(assert (=> b!69038 (= lt!110758 (byteArrayBitContentToList!0 (_2!3121 lt!110750) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!110767 () List!722)

(assert (=> b!69038 (= lt!110767 (bitStreamReadBitsIntoList!0 (_2!3121 lt!110750) (_1!3122 lt!110751) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!110787 () List!722)

(assert (=> b!69038 (= lt!110787 (bitStreamReadBitsIntoList!0 (_2!3121 lt!110750) (_1!3122 lt!110775) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!110792 () (_ BitVec 64))

(assert (=> b!69038 (= lt!110792 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!110782 () Unit!4617)

(assert (=> b!69038 (= lt!110782 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3121 lt!110750) (_2!3121 lt!110750) (_1!3122 lt!110751) (_1!3122 lt!110775) lt!110792 lt!110767))))

(assert (=> b!69038 (= (bitStreamReadBitsIntoList!0 (_2!3121 lt!110750) (_1!3122 lt!110775) (bvsub lt!110792 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!326 lt!110767))))

(declare-fun lt!110780 () Unit!4617)

(assert (=> b!69038 (= lt!110780 lt!110782)))

(declare-fun lt!110759 () (_ BitVec 64))

(declare-fun lt!110770 () Unit!4617)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2894 array!2894 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4617)

(assert (=> b!69038 (= lt!110770 (arrayBitRangesEqImpliesEq!0 (buf!1723 (_2!3121 lt!110785)) (buf!1723 (_2!3121 lt!110750)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!110759 (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110785))) (currentByte!3419 (_2!3121 lt!110785)) (currentBit!3414 (_2!3121 lt!110785)))))))

(assert (=> b!69038 (= (bitAt!0 (buf!1723 (_2!3121 lt!110785)) lt!110759) (bitAt!0 (buf!1723 (_2!3121 lt!110750)) lt!110759))))

(declare-fun lt!110783 () Unit!4617)

(assert (=> b!69038 (= lt!110783 lt!110770)))

(declare-fun b!69039 () Bool)

(assert (=> b!69039 (= e!45100 (validate_offset_bits!1 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110019)))) ((_ sign_extend 32) (currentByte!3419 (_2!3121 lt!110019))) ((_ sign_extend 32) (currentBit!3414 (_2!3121 lt!110019))) lt!110779))))

(declare-fun b!69041 () Bool)

(declare-fun res!57041 () Bool)

(assert (=> b!69041 (=> (not res!57041) (not e!45101))))

(assert (=> b!69041 (= res!57041 (= (size!1342 (buf!1723 (_2!3121 lt!110753))) (size!1342 (buf!1723 (_2!3121 lt!110019)))))))

(declare-fun b!69042 () Bool)

(declare-fun res!57043 () Bool)

(assert (=> b!69042 (=> (not res!57043) (not e!45101))))

(assert (=> b!69042 (= res!57043 (= (size!1342 (buf!1723 (_2!3121 lt!110019))) (size!1342 (buf!1723 (_2!3121 lt!110753)))))))

(declare-fun b!69043 () Bool)

(declare-fun res!57040 () Bool)

(assert (=> b!69043 (=> (not res!57040) (not e!45101))))

(assert (=> b!69043 (= res!57040 (isPrefixOf!0 (_2!3121 lt!110019) (_2!3121 lt!110753)))))

(declare-fun b!69040 () Bool)

(declare-fun res!57042 () Bool)

(assert (=> b!69040 (=> (not res!57042) (not e!45101))))

(assert (=> b!69040 (= res!57042 (invariant!0 (currentBit!3414 (_2!3121 lt!110753)) (currentByte!3419 (_2!3121 lt!110753)) (size!1342 (buf!1723 (_2!3121 lt!110753)))))))

(declare-fun d!21978 () Bool)

(assert (=> d!21978 e!45101))

(declare-fun res!57038 () Bool)

(assert (=> d!21978 (=> (not res!57038) (not e!45101))))

(declare-fun lt!110789 () (_ BitVec 64))

(assert (=> d!21978 (= res!57038 (= (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110753))) (currentByte!3419 (_2!3121 lt!110753)) (currentBit!3414 (_2!3121 lt!110753))) (bvsub lt!110789 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!21978 (or (= (bvand lt!110789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!110789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!110789 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!110756 () (_ BitVec 64))

(assert (=> d!21978 (= lt!110789 (bvadd lt!110756 to!314))))

(assert (=> d!21978 (or (not (= (bvand lt!110756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!110756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!110756 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21978 (= lt!110756 (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110019))) (currentByte!3419 (_2!3121 lt!110019)) (currentBit!3414 (_2!3121 lt!110019))))))

(assert (=> d!21978 (= lt!110753 e!45099)))

(assert (=> d!21978 (= c!5108 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!110774 () Unit!4617)

(declare-fun lt!110781 () Unit!4617)

(assert (=> d!21978 (= lt!110774 lt!110781)))

(assert (=> d!21978 (isPrefixOf!0 (_2!3121 lt!110019) (_2!3121 lt!110019))))

(assert (=> d!21978 (= lt!110781 (lemmaIsPrefixRefl!0 (_2!3121 lt!110019)))))

(assert (=> d!21978 (= lt!110759 (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110019))) (currentByte!3419 (_2!3121 lt!110019)) (currentBit!3414 (_2!3121 lt!110019))))))

(assert (=> d!21978 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21978 (= (appendBitsMSBFirstLoop!0 (_2!3121 lt!110019) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!110753)))

(assert (= (and d!21978 c!5108) b!69038))

(assert (= (and d!21978 (not c!5108)) b!69037))

(assert (= (or b!69038 b!69037) bm!886))

(assert (= (and d!21978 res!57038) b!69040))

(assert (= (and b!69040 res!57042) b!69042))

(assert (= (and b!69042 res!57043) b!69043))

(assert (= (and b!69043 res!57040) b!69041))

(assert (= (and b!69041 res!57041) b!69036))

(assert (= (and b!69036 res!57039) b!69039))

(declare-fun m!110373 () Bool)

(assert (=> b!69036 m!110373))

(declare-fun m!110375 () Bool)

(assert (=> b!69036 m!110375))

(declare-fun m!110377 () Bool)

(assert (=> b!69036 m!110377))

(declare-fun m!110379 () Bool)

(assert (=> b!69036 m!110379))

(declare-fun m!110381 () Bool)

(assert (=> b!69036 m!110381))

(declare-fun m!110383 () Bool)

(assert (=> b!69037 m!110383))

(declare-fun m!110385 () Bool)

(assert (=> b!69037 m!110385))

(declare-fun m!110387 () Bool)

(assert (=> b!69043 m!110387))

(declare-fun m!110389 () Bool)

(assert (=> b!69040 m!110389))

(declare-fun m!110391 () Bool)

(assert (=> b!69039 m!110391))

(declare-fun m!110393 () Bool)

(assert (=> bm!886 m!110393))

(declare-fun m!110395 () Bool)

(assert (=> d!21978 m!110395))

(assert (=> d!21978 m!109809))

(declare-fun m!110397 () Bool)

(assert (=> d!21978 m!110397))

(declare-fun m!110399 () Bool)

(assert (=> d!21978 m!110399))

(declare-fun m!110401 () Bool)

(assert (=> b!69038 m!110401))

(declare-fun m!110403 () Bool)

(assert (=> b!69038 m!110403))

(declare-fun m!110405 () Bool)

(assert (=> b!69038 m!110405))

(assert (=> b!69038 m!110401))

(declare-fun m!110407 () Bool)

(assert (=> b!69038 m!110407))

(declare-fun m!110409 () Bool)

(assert (=> b!69038 m!110409))

(declare-fun m!110411 () Bool)

(assert (=> b!69038 m!110411))

(declare-fun m!110413 () Bool)

(assert (=> b!69038 m!110413))

(declare-fun m!110415 () Bool)

(assert (=> b!69038 m!110415))

(declare-fun m!110417 () Bool)

(assert (=> b!69038 m!110417))

(declare-fun m!110419 () Bool)

(assert (=> b!69038 m!110419))

(declare-fun m!110421 () Bool)

(assert (=> b!69038 m!110421))

(declare-fun m!110423 () Bool)

(assert (=> b!69038 m!110423))

(declare-fun m!110425 () Bool)

(assert (=> b!69038 m!110425))

(declare-fun m!110427 () Bool)

(assert (=> b!69038 m!110427))

(declare-fun m!110429 () Bool)

(assert (=> b!69038 m!110429))

(declare-fun m!110431 () Bool)

(assert (=> b!69038 m!110431))

(declare-fun m!110433 () Bool)

(assert (=> b!69038 m!110433))

(declare-fun m!110435 () Bool)

(assert (=> b!69038 m!110435))

(declare-fun m!110437 () Bool)

(assert (=> b!69038 m!110437))

(assert (=> b!69038 m!109809))

(declare-fun m!110439 () Bool)

(assert (=> b!69038 m!110439))

(declare-fun m!110441 () Bool)

(assert (=> b!69038 m!110441))

(declare-fun m!110443 () Bool)

(assert (=> b!69038 m!110443))

(declare-fun m!110445 () Bool)

(assert (=> b!69038 m!110445))

(assert (=> b!69038 m!110437))

(declare-fun m!110447 () Bool)

(assert (=> b!69038 m!110447))

(declare-fun m!110449 () Bool)

(assert (=> b!69038 m!110449))

(declare-fun m!110451 () Bool)

(assert (=> b!69038 m!110451))

(declare-fun m!110453 () Bool)

(assert (=> b!69038 m!110453))

(assert (=> b!69038 m!110445))

(declare-fun m!110455 () Bool)

(assert (=> b!69038 m!110455))

(declare-fun m!110457 () Bool)

(assert (=> b!69038 m!110457))

(assert (=> b!69038 m!110451))

(declare-fun m!110459 () Bool)

(assert (=> b!69038 m!110459))

(declare-fun m!110461 () Bool)

(assert (=> b!69038 m!110461))

(assert (=> b!68771 d!21978))

(declare-fun d!22002 () Bool)

(assert (=> d!22002 (isPrefixOf!0 thiss!1379 (_2!3121 lt!110018))))

(declare-fun lt!110800 () Unit!4617)

(declare-fun choose!30 (BitStream!2294 BitStream!2294 BitStream!2294) Unit!4617)

(assert (=> d!22002 (= lt!110800 (choose!30 thiss!1379 (_2!3121 lt!110019) (_2!3121 lt!110018)))))

(assert (=> d!22002 (isPrefixOf!0 thiss!1379 (_2!3121 lt!110019))))

(assert (=> d!22002 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3121 lt!110019) (_2!3121 lt!110018)) lt!110800)))

(declare-fun bs!5305 () Bool)

(assert (= bs!5305 d!22002))

(assert (=> bs!5305 m!109859))

(declare-fun m!110469 () Bool)

(assert (=> bs!5305 m!110469))

(assert (=> bs!5305 m!109867))

(assert (=> b!68771 d!22002))

(declare-fun d!22010 () Bool)

(declare-fun res!57063 () Bool)

(declare-fun e!45115 () Bool)

(assert (=> d!22010 (=> (not res!57063) (not e!45115))))

(assert (=> d!22010 (= res!57063 (= (size!1342 (buf!1723 thiss!1379)) (size!1342 (buf!1723 (_2!3121 lt!110018)))))))

(assert (=> d!22010 (= (isPrefixOf!0 thiss!1379 (_2!3121 lt!110018)) e!45115)))

(declare-fun b!69062 () Bool)

(declare-fun res!57062 () Bool)

(assert (=> b!69062 (=> (not res!57062) (not e!45115))))

(assert (=> b!69062 (= res!57062 (bvsle (bitIndex!0 (size!1342 (buf!1723 thiss!1379)) (currentByte!3419 thiss!1379) (currentBit!3414 thiss!1379)) (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110018))) (currentByte!3419 (_2!3121 lt!110018)) (currentBit!3414 (_2!3121 lt!110018)))))))

(declare-fun b!69063 () Bool)

(declare-fun e!45114 () Bool)

(assert (=> b!69063 (= e!45115 e!45114)))

(declare-fun res!57064 () Bool)

(assert (=> b!69063 (=> res!57064 e!45114)))

(assert (=> b!69063 (= res!57064 (= (size!1342 (buf!1723 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!69064 () Bool)

(assert (=> b!69064 (= e!45114 (arrayBitRangesEq!0 (buf!1723 thiss!1379) (buf!1723 (_2!3121 lt!110018)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1342 (buf!1723 thiss!1379)) (currentByte!3419 thiss!1379) (currentBit!3414 thiss!1379))))))

(assert (= (and d!22010 res!57063) b!69062))

(assert (= (and b!69062 res!57062) b!69063))

(assert (= (and b!69063 (not res!57064)) b!69064))

(assert (=> b!69062 m!109805))

(assert (=> b!69062 m!109791))

(assert (=> b!69064 m!109805))

(assert (=> b!69064 m!109805))

(declare-fun m!110473 () Bool)

(assert (=> b!69064 m!110473))

(assert (=> b!68771 d!22010))

(declare-fun b!69078 () Bool)

(declare-fun e!45124 () Unit!4617)

(declare-fun lt!110859 () Unit!4617)

(assert (=> b!69078 (= e!45124 lt!110859)))

(declare-fun lt!110860 () (_ BitVec 64))

(assert (=> b!69078 (= lt!110860 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110863 () (_ BitVec 64))

(assert (=> b!69078 (= lt!110863 (bitIndex!0 (size!1342 (buf!1723 thiss!1379)) (currentByte!3419 thiss!1379) (currentBit!3414 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2894 array!2894 (_ BitVec 64) (_ BitVec 64)) Unit!4617)

(assert (=> b!69078 (= lt!110859 (arrayBitRangesEqSymmetric!0 (buf!1723 thiss!1379) (buf!1723 (_2!3121 lt!110019)) lt!110860 lt!110863))))

(assert (=> b!69078 (arrayBitRangesEq!0 (buf!1723 (_2!3121 lt!110019)) (buf!1723 thiss!1379) lt!110860 lt!110863)))

(declare-fun b!69079 () Bool)

(declare-fun Unit!4646 () Unit!4617)

(assert (=> b!69079 (= e!45124 Unit!4646)))

(declare-fun lt!110855 () tuple2!6022)

(declare-fun e!45123 () Bool)

(declare-fun b!69080 () Bool)

(declare-fun lt!110856 () (_ BitVec 64))

(declare-fun lt!110847 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2294 (_ BitVec 64)) BitStream!2294)

(assert (=> b!69080 (= e!45123 (= (_1!3122 lt!110855) (withMovedBitIndex!0 (_2!3122 lt!110855) (bvsub lt!110847 lt!110856))))))

(assert (=> b!69080 (or (= (bvand lt!110847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110856 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!110847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!110847 lt!110856) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69080 (= lt!110856 (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110019))) (currentByte!3419 (_2!3121 lt!110019)) (currentBit!3414 (_2!3121 lt!110019))))))

(assert (=> b!69080 (= lt!110847 (bitIndex!0 (size!1342 (buf!1723 thiss!1379)) (currentByte!3419 thiss!1379) (currentBit!3414 thiss!1379)))))

(declare-fun d!22014 () Bool)

(assert (=> d!22014 e!45123))

(declare-fun res!57075 () Bool)

(assert (=> d!22014 (=> (not res!57075) (not e!45123))))

(assert (=> d!22014 (= res!57075 (isPrefixOf!0 (_1!3122 lt!110855) (_2!3122 lt!110855)))))

(declare-fun lt!110857 () BitStream!2294)

(assert (=> d!22014 (= lt!110855 (tuple2!6023 lt!110857 (_2!3121 lt!110019)))))

(declare-fun lt!110854 () Unit!4617)

(declare-fun lt!110862 () Unit!4617)

(assert (=> d!22014 (= lt!110854 lt!110862)))

(assert (=> d!22014 (isPrefixOf!0 lt!110857 (_2!3121 lt!110019))))

(assert (=> d!22014 (= lt!110862 (lemmaIsPrefixTransitive!0 lt!110857 (_2!3121 lt!110019) (_2!3121 lt!110019)))))

(declare-fun lt!110846 () Unit!4617)

(declare-fun lt!110853 () Unit!4617)

(assert (=> d!22014 (= lt!110846 lt!110853)))

(assert (=> d!22014 (isPrefixOf!0 lt!110857 (_2!3121 lt!110019))))

(assert (=> d!22014 (= lt!110853 (lemmaIsPrefixTransitive!0 lt!110857 thiss!1379 (_2!3121 lt!110019)))))

(declare-fun lt!110851 () Unit!4617)

(assert (=> d!22014 (= lt!110851 e!45124)))

(declare-fun c!5111 () Bool)

(assert (=> d!22014 (= c!5111 (not (= (size!1342 (buf!1723 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!110848 () Unit!4617)

(declare-fun lt!110852 () Unit!4617)

(assert (=> d!22014 (= lt!110848 lt!110852)))

(assert (=> d!22014 (isPrefixOf!0 (_2!3121 lt!110019) (_2!3121 lt!110019))))

(assert (=> d!22014 (= lt!110852 (lemmaIsPrefixRefl!0 (_2!3121 lt!110019)))))

(declare-fun lt!110850 () Unit!4617)

(declare-fun lt!110861 () Unit!4617)

(assert (=> d!22014 (= lt!110850 lt!110861)))

(assert (=> d!22014 (= lt!110861 (lemmaIsPrefixRefl!0 (_2!3121 lt!110019)))))

(declare-fun lt!110858 () Unit!4617)

(declare-fun lt!110844 () Unit!4617)

(assert (=> d!22014 (= lt!110858 lt!110844)))

(assert (=> d!22014 (isPrefixOf!0 lt!110857 lt!110857)))

(assert (=> d!22014 (= lt!110844 (lemmaIsPrefixRefl!0 lt!110857))))

(declare-fun lt!110845 () Unit!4617)

(declare-fun lt!110849 () Unit!4617)

(assert (=> d!22014 (= lt!110845 lt!110849)))

(assert (=> d!22014 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!22014 (= lt!110849 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!22014 (= lt!110857 (BitStream!2295 (buf!1723 (_2!3121 lt!110019)) (currentByte!3419 thiss!1379) (currentBit!3414 thiss!1379)))))

(assert (=> d!22014 (isPrefixOf!0 thiss!1379 (_2!3121 lt!110019))))

(assert (=> d!22014 (= (reader!0 thiss!1379 (_2!3121 lt!110019)) lt!110855)))

(declare-fun b!69081 () Bool)

(declare-fun res!57074 () Bool)

(assert (=> b!69081 (=> (not res!57074) (not e!45123))))

(assert (=> b!69081 (= res!57074 (isPrefixOf!0 (_1!3122 lt!110855) thiss!1379))))

(declare-fun b!69082 () Bool)

(declare-fun res!57076 () Bool)

(assert (=> b!69082 (=> (not res!57076) (not e!45123))))

(assert (=> b!69082 (= res!57076 (isPrefixOf!0 (_2!3122 lt!110855) (_2!3121 lt!110019)))))

(assert (= (and d!22014 c!5111) b!69078))

(assert (= (and d!22014 (not c!5111)) b!69079))

(assert (= (and d!22014 res!57075) b!69081))

(assert (= (and b!69081 res!57074) b!69082))

(assert (= (and b!69082 res!57076) b!69080))

(declare-fun m!110479 () Bool)

(assert (=> b!69082 m!110479))

(declare-fun m!110481 () Bool)

(assert (=> b!69080 m!110481))

(assert (=> b!69080 m!109809))

(assert (=> b!69080 m!109805))

(declare-fun m!110483 () Bool)

(assert (=> b!69081 m!110483))

(assert (=> b!69078 m!109805))

(declare-fun m!110485 () Bool)

(assert (=> b!69078 m!110485))

(declare-fun m!110487 () Bool)

(assert (=> b!69078 m!110487))

(declare-fun m!110489 () Bool)

(assert (=> d!22014 m!110489))

(assert (=> d!22014 m!109803))

(declare-fun m!110491 () Bool)

(assert (=> d!22014 m!110491))

(assert (=> d!22014 m!109801))

(assert (=> d!22014 m!110399))

(assert (=> d!22014 m!110397))

(declare-fun m!110493 () Bool)

(assert (=> d!22014 m!110493))

(declare-fun m!110495 () Bool)

(assert (=> d!22014 m!110495))

(declare-fun m!110497 () Bool)

(assert (=> d!22014 m!110497))

(declare-fun m!110499 () Bool)

(assert (=> d!22014 m!110499))

(assert (=> d!22014 m!109867))

(assert (=> b!68771 d!22014))

(declare-fun d!22018 () Bool)

(declare-fun res!57078 () Bool)

(declare-fun e!45126 () Bool)

(assert (=> d!22018 (=> (not res!57078) (not e!45126))))

(assert (=> d!22018 (= res!57078 (= (size!1342 (buf!1723 (_2!3121 lt!110019))) (size!1342 (buf!1723 (_2!3121 lt!110018)))))))

(assert (=> d!22018 (= (isPrefixOf!0 (_2!3121 lt!110019) (_2!3121 lt!110018)) e!45126)))

(declare-fun b!69083 () Bool)

(declare-fun res!57077 () Bool)

(assert (=> b!69083 (=> (not res!57077) (not e!45126))))

(assert (=> b!69083 (= res!57077 (bvsle (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110019))) (currentByte!3419 (_2!3121 lt!110019)) (currentBit!3414 (_2!3121 lt!110019))) (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110018))) (currentByte!3419 (_2!3121 lt!110018)) (currentBit!3414 (_2!3121 lt!110018)))))))

(declare-fun b!69084 () Bool)

(declare-fun e!45125 () Bool)

(assert (=> b!69084 (= e!45126 e!45125)))

(declare-fun res!57079 () Bool)

(assert (=> b!69084 (=> res!57079 e!45125)))

(assert (=> b!69084 (= res!57079 (= (size!1342 (buf!1723 (_2!3121 lt!110019))) #b00000000000000000000000000000000))))

(declare-fun b!69085 () Bool)

(assert (=> b!69085 (= e!45125 (arrayBitRangesEq!0 (buf!1723 (_2!3121 lt!110019)) (buf!1723 (_2!3121 lt!110018)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110019))) (currentByte!3419 (_2!3121 lt!110019)) (currentBit!3414 (_2!3121 lt!110019)))))))

(assert (= (and d!22018 res!57078) b!69083))

(assert (= (and b!69083 res!57077) b!69084))

(assert (= (and b!69084 (not res!57079)) b!69085))

(assert (=> b!69083 m!109809))

(assert (=> b!69083 m!109791))

(assert (=> b!69085 m!109809))

(assert (=> b!69085 m!109809))

(declare-fun m!110501 () Bool)

(assert (=> b!69085 m!110501))

(assert (=> b!68771 d!22018))

(declare-fun d!22020 () Bool)

(assert (=> d!22020 (= (array_inv!1206 srcBuffer!2) (bvsge (size!1342 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13396 d!22020))

(declare-fun d!22022 () Bool)

(assert (=> d!22022 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3414 thiss!1379) (currentByte!3419 thiss!1379) (size!1342 (buf!1723 thiss!1379))))))

(declare-fun bs!5307 () Bool)

(assert (= bs!5307 d!22022))

(assert (=> bs!5307 m!110053))

(assert (=> start!13396 d!22022))

(declare-fun d!22024 () Bool)

(assert (=> d!22024 (= (array_inv!1206 (buf!1723 thiss!1379)) (bvsge (size!1342 (buf!1723 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!68770 d!22024))

(declare-fun d!22026 () Bool)

(declare-fun size!1345 (List!722) Int)

(assert (=> d!22026 (= (length!350 lt!110023) (size!1345 lt!110023))))

(declare-fun bs!5308 () Bool)

(assert (= bs!5308 d!22026))

(declare-fun m!110503 () Bool)

(assert (=> bs!5308 m!110503))

(assert (=> b!68769 d!22026))

(declare-fun d!22028 () Bool)

(assert (=> d!22028 (= (invariant!0 (currentBit!3414 (_2!3121 lt!110018)) (currentByte!3419 (_2!3121 lt!110018)) (size!1342 (buf!1723 (_2!3121 lt!110018)))) (and (bvsge (currentBit!3414 (_2!3121 lt!110018)) #b00000000000000000000000000000000) (bvslt (currentBit!3414 (_2!3121 lt!110018)) #b00000000000000000000000000001000) (bvsge (currentByte!3419 (_2!3121 lt!110018)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3419 (_2!3121 lt!110018)) (size!1342 (buf!1723 (_2!3121 lt!110018)))) (and (= (currentBit!3414 (_2!3121 lt!110018)) #b00000000000000000000000000000000) (= (currentByte!3419 (_2!3121 lt!110018)) (size!1342 (buf!1723 (_2!3121 lt!110018))))))))))

(assert (=> b!68779 d!22028))

(declare-fun d!22030 () Bool)

(assert (=> d!22030 (= (head!541 (byteArrayBitContentToList!0 (_2!3121 lt!110018) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!837 (byteArrayBitContentToList!0 (_2!3121 lt!110018) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!68768 d!22030))

(declare-fun d!22032 () Bool)

(declare-fun c!5112 () Bool)

(assert (=> d!22032 (= c!5112 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!45127 () List!722)

(assert (=> d!22032 (= (byteArrayBitContentToList!0 (_2!3121 lt!110018) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!45127)))

(declare-fun b!69086 () Bool)

(assert (=> b!69086 (= e!45127 Nil!719)))

(declare-fun b!69087 () Bool)

(assert (=> b!69087 (= e!45127 (Cons!718 (not (= (bvand ((_ sign_extend 24) (select (arr!1918 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3121 lt!110018) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!22032 c!5112) b!69086))

(assert (= (and d!22032 (not c!5112)) b!69087))

(assert (=> b!69087 m!109865))

(assert (=> b!69087 m!110125))

(declare-fun m!110505 () Bool)

(assert (=> b!69087 m!110505))

(assert (=> b!68768 d!22032))

(declare-fun d!22034 () Bool)

(assert (=> d!22034 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1918 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5309 () Bool)

(assert (= bs!5309 d!22034))

(assert (=> bs!5309 m!109865))

(assert (=> bs!5309 m!110125))

(assert (=> b!68768 d!22034))

(declare-fun b!69088 () Bool)

(declare-fun e!45129 () Unit!4617)

(declare-fun lt!110879 () Unit!4617)

(assert (=> b!69088 (= e!45129 lt!110879)))

(declare-fun lt!110880 () (_ BitVec 64))

(assert (=> b!69088 (= lt!110880 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110883 () (_ BitVec 64))

(assert (=> b!69088 (= lt!110883 (bitIndex!0 (size!1342 (buf!1723 thiss!1379)) (currentByte!3419 thiss!1379) (currentBit!3414 thiss!1379)))))

(assert (=> b!69088 (= lt!110879 (arrayBitRangesEqSymmetric!0 (buf!1723 thiss!1379) (buf!1723 (_2!3121 lt!110018)) lt!110880 lt!110883))))

(assert (=> b!69088 (arrayBitRangesEq!0 (buf!1723 (_2!3121 lt!110018)) (buf!1723 thiss!1379) lt!110880 lt!110883)))

(declare-fun b!69089 () Bool)

(declare-fun Unit!4647 () Unit!4617)

(assert (=> b!69089 (= e!45129 Unit!4647)))

(declare-fun lt!110876 () (_ BitVec 64))

(declare-fun lt!110867 () (_ BitVec 64))

(declare-fun b!69090 () Bool)

(declare-fun e!45128 () Bool)

(declare-fun lt!110875 () tuple2!6022)

(assert (=> b!69090 (= e!45128 (= (_1!3122 lt!110875) (withMovedBitIndex!0 (_2!3122 lt!110875) (bvsub lt!110867 lt!110876))))))

(assert (=> b!69090 (or (= (bvand lt!110867 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110876 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!110867 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!110867 lt!110876) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69090 (= lt!110876 (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110018))) (currentByte!3419 (_2!3121 lt!110018)) (currentBit!3414 (_2!3121 lt!110018))))))

(assert (=> b!69090 (= lt!110867 (bitIndex!0 (size!1342 (buf!1723 thiss!1379)) (currentByte!3419 thiss!1379) (currentBit!3414 thiss!1379)))))

(declare-fun d!22036 () Bool)

(assert (=> d!22036 e!45128))

(declare-fun res!57081 () Bool)

(assert (=> d!22036 (=> (not res!57081) (not e!45128))))

(assert (=> d!22036 (= res!57081 (isPrefixOf!0 (_1!3122 lt!110875) (_2!3122 lt!110875)))))

(declare-fun lt!110877 () BitStream!2294)

(assert (=> d!22036 (= lt!110875 (tuple2!6023 lt!110877 (_2!3121 lt!110018)))))

(declare-fun lt!110874 () Unit!4617)

(declare-fun lt!110882 () Unit!4617)

(assert (=> d!22036 (= lt!110874 lt!110882)))

(assert (=> d!22036 (isPrefixOf!0 lt!110877 (_2!3121 lt!110018))))

(assert (=> d!22036 (= lt!110882 (lemmaIsPrefixTransitive!0 lt!110877 (_2!3121 lt!110018) (_2!3121 lt!110018)))))

(declare-fun lt!110866 () Unit!4617)

(declare-fun lt!110873 () Unit!4617)

(assert (=> d!22036 (= lt!110866 lt!110873)))

(assert (=> d!22036 (isPrefixOf!0 lt!110877 (_2!3121 lt!110018))))

(assert (=> d!22036 (= lt!110873 (lemmaIsPrefixTransitive!0 lt!110877 thiss!1379 (_2!3121 lt!110018)))))

(declare-fun lt!110871 () Unit!4617)

(assert (=> d!22036 (= lt!110871 e!45129)))

(declare-fun c!5113 () Bool)

(assert (=> d!22036 (= c!5113 (not (= (size!1342 (buf!1723 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!110868 () Unit!4617)

(declare-fun lt!110872 () Unit!4617)

(assert (=> d!22036 (= lt!110868 lt!110872)))

(assert (=> d!22036 (isPrefixOf!0 (_2!3121 lt!110018) (_2!3121 lt!110018))))

(assert (=> d!22036 (= lt!110872 (lemmaIsPrefixRefl!0 (_2!3121 lt!110018)))))

(declare-fun lt!110870 () Unit!4617)

(declare-fun lt!110881 () Unit!4617)

(assert (=> d!22036 (= lt!110870 lt!110881)))

(assert (=> d!22036 (= lt!110881 (lemmaIsPrefixRefl!0 (_2!3121 lt!110018)))))

(declare-fun lt!110878 () Unit!4617)

(declare-fun lt!110864 () Unit!4617)

(assert (=> d!22036 (= lt!110878 lt!110864)))

(assert (=> d!22036 (isPrefixOf!0 lt!110877 lt!110877)))

(assert (=> d!22036 (= lt!110864 (lemmaIsPrefixRefl!0 lt!110877))))

(declare-fun lt!110865 () Unit!4617)

(declare-fun lt!110869 () Unit!4617)

(assert (=> d!22036 (= lt!110865 lt!110869)))

(assert (=> d!22036 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!22036 (= lt!110869 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!22036 (= lt!110877 (BitStream!2295 (buf!1723 (_2!3121 lt!110018)) (currentByte!3419 thiss!1379) (currentBit!3414 thiss!1379)))))

(assert (=> d!22036 (isPrefixOf!0 thiss!1379 (_2!3121 lt!110018))))

(assert (=> d!22036 (= (reader!0 thiss!1379 (_2!3121 lt!110018)) lt!110875)))

(declare-fun b!69091 () Bool)

(declare-fun res!57080 () Bool)

(assert (=> b!69091 (=> (not res!57080) (not e!45128))))

(assert (=> b!69091 (= res!57080 (isPrefixOf!0 (_1!3122 lt!110875) thiss!1379))))

(declare-fun b!69092 () Bool)

(declare-fun res!57082 () Bool)

(assert (=> b!69092 (=> (not res!57082) (not e!45128))))

(assert (=> b!69092 (= res!57082 (isPrefixOf!0 (_2!3122 lt!110875) (_2!3121 lt!110018)))))

(assert (= (and d!22036 c!5113) b!69088))

(assert (= (and d!22036 (not c!5113)) b!69089))

(assert (= (and d!22036 res!57081) b!69091))

(assert (= (and b!69091 res!57080) b!69092))

(assert (= (and b!69092 res!57082) b!69090))

(declare-fun m!110507 () Bool)

(assert (=> b!69092 m!110507))

(declare-fun m!110509 () Bool)

(assert (=> b!69090 m!110509))

(assert (=> b!69090 m!109791))

(assert (=> b!69090 m!109805))

(declare-fun m!110511 () Bool)

(assert (=> b!69091 m!110511))

(assert (=> b!69088 m!109805))

(declare-fun m!110513 () Bool)

(assert (=> b!69088 m!110513))

(declare-fun m!110515 () Bool)

(assert (=> b!69088 m!110515))

(declare-fun m!110517 () Bool)

(assert (=> d!22036 m!110517))

(assert (=> d!22036 m!109803))

(declare-fun m!110519 () Bool)

(assert (=> d!22036 m!110519))

(assert (=> d!22036 m!109801))

(declare-fun m!110521 () Bool)

(assert (=> d!22036 m!110521))

(declare-fun m!110523 () Bool)

(assert (=> d!22036 m!110523))

(declare-fun m!110525 () Bool)

(assert (=> d!22036 m!110525))

(declare-fun m!110527 () Bool)

(assert (=> d!22036 m!110527))

(declare-fun m!110529 () Bool)

(assert (=> d!22036 m!110529))

(declare-fun m!110531 () Bool)

(assert (=> d!22036 m!110531))

(assert (=> d!22036 m!109859))

(assert (=> b!68767 d!22036))

(declare-fun b!69093 () Bool)

(declare-fun e!45130 () tuple2!6036)

(assert (=> b!69093 (= e!45130 (tuple2!6037 Nil!719 (_1!3122 lt!110005)))))

(declare-fun b!69096 () Bool)

(declare-fun e!45131 () Bool)

(declare-fun lt!110886 () List!722)

(assert (=> b!69096 (= e!45131 (> (length!350 lt!110886) 0))))

(declare-fun d!22038 () Bool)

(assert (=> d!22038 e!45131))

(declare-fun c!5114 () Bool)

(assert (=> d!22038 (= c!5114 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22038 (= lt!110886 (_1!3129 e!45130))))

(declare-fun c!5115 () Bool)

(assert (=> d!22038 (= c!5115 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22038 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22038 (= (bitStreamReadBitsIntoList!0 (_2!3121 lt!110018) (_1!3122 lt!110005) (bvsub to!314 i!635)) lt!110886)))

(declare-fun b!69095 () Bool)

(assert (=> b!69095 (= e!45131 (isEmpty!221 lt!110886))))

(declare-fun lt!110884 () (_ BitVec 64))

(declare-fun b!69094 () Bool)

(declare-fun lt!110885 () tuple2!6040)

(assert (=> b!69094 (= e!45130 (tuple2!6037 (Cons!718 (_1!3131 lt!110885) (bitStreamReadBitsIntoList!0 (_2!3121 lt!110018) (_2!3131 lt!110885) (bvsub (bvsub to!314 i!635) lt!110884))) (_2!3131 lt!110885)))))

(assert (=> b!69094 (= lt!110885 (readBit!0 (_1!3122 lt!110005)))))

(assert (=> b!69094 (= lt!110884 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!22038 c!5115) b!69093))

(assert (= (and d!22038 (not c!5115)) b!69094))

(assert (= (and d!22038 c!5114) b!69095))

(assert (= (and d!22038 (not c!5114)) b!69096))

(declare-fun m!110533 () Bool)

(assert (=> b!69096 m!110533))

(declare-fun m!110535 () Bool)

(assert (=> b!69095 m!110535))

(declare-fun m!110537 () Bool)

(assert (=> b!69094 m!110537))

(declare-fun m!110539 () Bool)

(assert (=> b!69094 m!110539))

(assert (=> b!68767 d!22038))

(declare-fun d!22040 () Bool)

(assert (=> d!22040 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110018)))) ((_ sign_extend 32) (currentByte!3419 (_2!3121 lt!110019))) ((_ sign_extend 32) (currentBit!3414 (_2!3121 lt!110019))) lt!110014) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110018)))) ((_ sign_extend 32) (currentByte!3419 (_2!3121 lt!110019))) ((_ sign_extend 32) (currentBit!3414 (_2!3121 lt!110019)))) lt!110014))))

(declare-fun bs!5310 () Bool)

(assert (= bs!5310 d!22040))

(declare-fun m!110541 () Bool)

(assert (=> bs!5310 m!110541))

(assert (=> b!68767 d!22040))

(declare-fun d!22042 () Bool)

(assert (=> d!22042 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110018)))) ((_ sign_extend 32) (currentByte!3419 thiss!1379)) ((_ sign_extend 32) (currentBit!3414 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110018)))) ((_ sign_extend 32) (currentByte!3419 thiss!1379)) ((_ sign_extend 32) (currentBit!3414 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5311 () Bool)

(assert (= bs!5311 d!22042))

(declare-fun m!110543 () Bool)

(assert (=> bs!5311 m!110543))

(assert (=> b!68767 d!22042))

(declare-fun d!22044 () Bool)

(assert (=> d!22044 (validate_offset_bits!1 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110018)))) ((_ sign_extend 32) (currentByte!3419 thiss!1379)) ((_ sign_extend 32) (currentBit!3414 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!110887 () Unit!4617)

(assert (=> d!22044 (= lt!110887 (choose!9 thiss!1379 (buf!1723 (_2!3121 lt!110018)) (bvsub to!314 i!635) (BitStream!2295 (buf!1723 (_2!3121 lt!110018)) (currentByte!3419 thiss!1379) (currentBit!3414 thiss!1379))))))

(assert (=> d!22044 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1723 (_2!3121 lt!110018)) (bvsub to!314 i!635)) lt!110887)))

(declare-fun bs!5312 () Bool)

(assert (= bs!5312 d!22044))

(assert (=> bs!5312 m!109837))

(declare-fun m!110545 () Bool)

(assert (=> bs!5312 m!110545))

(assert (=> b!68767 d!22044))

(declare-fun b!69097 () Bool)

(declare-fun e!45133 () Unit!4617)

(declare-fun lt!110903 () Unit!4617)

(assert (=> b!69097 (= e!45133 lt!110903)))

(declare-fun lt!110904 () (_ BitVec 64))

(assert (=> b!69097 (= lt!110904 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110907 () (_ BitVec 64))

(assert (=> b!69097 (= lt!110907 (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110019))) (currentByte!3419 (_2!3121 lt!110019)) (currentBit!3414 (_2!3121 lt!110019))))))

(assert (=> b!69097 (= lt!110903 (arrayBitRangesEqSymmetric!0 (buf!1723 (_2!3121 lt!110019)) (buf!1723 (_2!3121 lt!110018)) lt!110904 lt!110907))))

(assert (=> b!69097 (arrayBitRangesEq!0 (buf!1723 (_2!3121 lt!110018)) (buf!1723 (_2!3121 lt!110019)) lt!110904 lt!110907)))

(declare-fun b!69098 () Bool)

(declare-fun Unit!4648 () Unit!4617)

(assert (=> b!69098 (= e!45133 Unit!4648)))

(declare-fun lt!110899 () tuple2!6022)

(declare-fun lt!110891 () (_ BitVec 64))

(declare-fun lt!110900 () (_ BitVec 64))

(declare-fun e!45132 () Bool)

(declare-fun b!69099 () Bool)

(assert (=> b!69099 (= e!45132 (= (_1!3122 lt!110899) (withMovedBitIndex!0 (_2!3122 lt!110899) (bvsub lt!110891 lt!110900))))))

(assert (=> b!69099 (or (= (bvand lt!110891 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110900 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!110891 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!110891 lt!110900) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69099 (= lt!110900 (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110018))) (currentByte!3419 (_2!3121 lt!110018)) (currentBit!3414 (_2!3121 lt!110018))))))

(assert (=> b!69099 (= lt!110891 (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110019))) (currentByte!3419 (_2!3121 lt!110019)) (currentBit!3414 (_2!3121 lt!110019))))))

(declare-fun d!22046 () Bool)

(assert (=> d!22046 e!45132))

(declare-fun res!57084 () Bool)

(assert (=> d!22046 (=> (not res!57084) (not e!45132))))

(assert (=> d!22046 (= res!57084 (isPrefixOf!0 (_1!3122 lt!110899) (_2!3122 lt!110899)))))

(declare-fun lt!110901 () BitStream!2294)

(assert (=> d!22046 (= lt!110899 (tuple2!6023 lt!110901 (_2!3121 lt!110018)))))

(declare-fun lt!110898 () Unit!4617)

(declare-fun lt!110906 () Unit!4617)

(assert (=> d!22046 (= lt!110898 lt!110906)))

(assert (=> d!22046 (isPrefixOf!0 lt!110901 (_2!3121 lt!110018))))

(assert (=> d!22046 (= lt!110906 (lemmaIsPrefixTransitive!0 lt!110901 (_2!3121 lt!110018) (_2!3121 lt!110018)))))

(declare-fun lt!110890 () Unit!4617)

(declare-fun lt!110897 () Unit!4617)

(assert (=> d!22046 (= lt!110890 lt!110897)))

(assert (=> d!22046 (isPrefixOf!0 lt!110901 (_2!3121 lt!110018))))

(assert (=> d!22046 (= lt!110897 (lemmaIsPrefixTransitive!0 lt!110901 (_2!3121 lt!110019) (_2!3121 lt!110018)))))

(declare-fun lt!110895 () Unit!4617)

(assert (=> d!22046 (= lt!110895 e!45133)))

(declare-fun c!5116 () Bool)

(assert (=> d!22046 (= c!5116 (not (= (size!1342 (buf!1723 (_2!3121 lt!110019))) #b00000000000000000000000000000000)))))

(declare-fun lt!110892 () Unit!4617)

(declare-fun lt!110896 () Unit!4617)

(assert (=> d!22046 (= lt!110892 lt!110896)))

(assert (=> d!22046 (isPrefixOf!0 (_2!3121 lt!110018) (_2!3121 lt!110018))))

(assert (=> d!22046 (= lt!110896 (lemmaIsPrefixRefl!0 (_2!3121 lt!110018)))))

(declare-fun lt!110894 () Unit!4617)

(declare-fun lt!110905 () Unit!4617)

(assert (=> d!22046 (= lt!110894 lt!110905)))

(assert (=> d!22046 (= lt!110905 (lemmaIsPrefixRefl!0 (_2!3121 lt!110018)))))

(declare-fun lt!110902 () Unit!4617)

(declare-fun lt!110888 () Unit!4617)

(assert (=> d!22046 (= lt!110902 lt!110888)))

(assert (=> d!22046 (isPrefixOf!0 lt!110901 lt!110901)))

(assert (=> d!22046 (= lt!110888 (lemmaIsPrefixRefl!0 lt!110901))))

(declare-fun lt!110889 () Unit!4617)

(declare-fun lt!110893 () Unit!4617)

(assert (=> d!22046 (= lt!110889 lt!110893)))

(assert (=> d!22046 (isPrefixOf!0 (_2!3121 lt!110019) (_2!3121 lt!110019))))

(assert (=> d!22046 (= lt!110893 (lemmaIsPrefixRefl!0 (_2!3121 lt!110019)))))

(assert (=> d!22046 (= lt!110901 (BitStream!2295 (buf!1723 (_2!3121 lt!110018)) (currentByte!3419 (_2!3121 lt!110019)) (currentBit!3414 (_2!3121 lt!110019))))))

(assert (=> d!22046 (isPrefixOf!0 (_2!3121 lt!110019) (_2!3121 lt!110018))))

(assert (=> d!22046 (= (reader!0 (_2!3121 lt!110019) (_2!3121 lt!110018)) lt!110899)))

(declare-fun b!69100 () Bool)

(declare-fun res!57083 () Bool)

(assert (=> b!69100 (=> (not res!57083) (not e!45132))))

(assert (=> b!69100 (= res!57083 (isPrefixOf!0 (_1!3122 lt!110899) (_2!3121 lt!110019)))))

(declare-fun b!69101 () Bool)

(declare-fun res!57085 () Bool)

(assert (=> b!69101 (=> (not res!57085) (not e!45132))))

(assert (=> b!69101 (= res!57085 (isPrefixOf!0 (_2!3122 lt!110899) (_2!3121 lt!110018)))))

(assert (= (and d!22046 c!5116) b!69097))

(assert (= (and d!22046 (not c!5116)) b!69098))

(assert (= (and d!22046 res!57084) b!69100))

(assert (= (and b!69100 res!57083) b!69101))

(assert (= (and b!69101 res!57085) b!69099))

(declare-fun m!110547 () Bool)

(assert (=> b!69101 m!110547))

(declare-fun m!110549 () Bool)

(assert (=> b!69099 m!110549))

(assert (=> b!69099 m!109791))

(assert (=> b!69099 m!109809))

(declare-fun m!110551 () Bool)

(assert (=> b!69100 m!110551))

(assert (=> b!69097 m!109809))

(declare-fun m!110553 () Bool)

(assert (=> b!69097 m!110553))

(declare-fun m!110555 () Bool)

(assert (=> b!69097 m!110555))

(declare-fun m!110557 () Bool)

(assert (=> d!22046 m!110557))

(assert (=> d!22046 m!110399))

(declare-fun m!110559 () Bool)

(assert (=> d!22046 m!110559))

(assert (=> d!22046 m!110397))

(assert (=> d!22046 m!110521))

(assert (=> d!22046 m!110523))

(declare-fun m!110561 () Bool)

(assert (=> d!22046 m!110561))

(declare-fun m!110563 () Bool)

(assert (=> d!22046 m!110563))

(declare-fun m!110565 () Bool)

(assert (=> d!22046 m!110565))

(declare-fun m!110567 () Bool)

(assert (=> d!22046 m!110567))

(assert (=> d!22046 m!109849))

(assert (=> b!68767 d!22046))

(declare-fun d!22048 () Bool)

(assert (=> d!22048 (validate_offset_bits!1 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110018)))) ((_ sign_extend 32) (currentByte!3419 (_2!3121 lt!110019))) ((_ sign_extend 32) (currentBit!3414 (_2!3121 lt!110019))) lt!110014)))

(declare-fun lt!110908 () Unit!4617)

(assert (=> d!22048 (= lt!110908 (choose!9 (_2!3121 lt!110019) (buf!1723 (_2!3121 lt!110018)) lt!110014 (BitStream!2295 (buf!1723 (_2!3121 lt!110018)) (currentByte!3419 (_2!3121 lt!110019)) (currentBit!3414 (_2!3121 lt!110019)))))))

(assert (=> d!22048 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3121 lt!110019) (buf!1723 (_2!3121 lt!110018)) lt!110014) lt!110908)))

(declare-fun bs!5313 () Bool)

(assert (= bs!5313 d!22048))

(assert (=> bs!5313 m!109841))

(declare-fun m!110569 () Bool)

(assert (=> bs!5313 m!110569))

(assert (=> b!68767 d!22048))

(declare-fun b!69102 () Bool)

(declare-fun e!45134 () tuple2!6036)

(assert (=> b!69102 (= e!45134 (tuple2!6037 Nil!719 (_1!3122 lt!110020)))))

(declare-fun b!69105 () Bool)

(declare-fun e!45135 () Bool)

(declare-fun lt!110911 () List!722)

(assert (=> b!69105 (= e!45135 (> (length!350 lt!110911) 0))))

(declare-fun d!22050 () Bool)

(assert (=> d!22050 e!45135))

(declare-fun c!5117 () Bool)

(assert (=> d!22050 (= c!5117 (= lt!110014 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22050 (= lt!110911 (_1!3129 e!45134))))

(declare-fun c!5118 () Bool)

(assert (=> d!22050 (= c!5118 (= lt!110014 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22050 (bvsge lt!110014 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22050 (= (bitStreamReadBitsIntoList!0 (_2!3121 lt!110018) (_1!3122 lt!110020) lt!110014) lt!110911)))

(declare-fun b!69104 () Bool)

(assert (=> b!69104 (= e!45135 (isEmpty!221 lt!110911))))

(declare-fun lt!110909 () (_ BitVec 64))

(declare-fun b!69103 () Bool)

(declare-fun lt!110910 () tuple2!6040)

(assert (=> b!69103 (= e!45134 (tuple2!6037 (Cons!718 (_1!3131 lt!110910) (bitStreamReadBitsIntoList!0 (_2!3121 lt!110018) (_2!3131 lt!110910) (bvsub lt!110014 lt!110909))) (_2!3131 lt!110910)))))

(assert (=> b!69103 (= lt!110910 (readBit!0 (_1!3122 lt!110020)))))

(assert (=> b!69103 (= lt!110909 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!22050 c!5118) b!69102))

(assert (= (and d!22050 (not c!5118)) b!69103))

(assert (= (and d!22050 c!5117) b!69104))

(assert (= (and d!22050 (not c!5117)) b!69105))

(declare-fun m!110571 () Bool)

(assert (=> b!69105 m!110571))

(declare-fun m!110573 () Bool)

(assert (=> b!69104 m!110573))

(declare-fun m!110575 () Bool)

(assert (=> b!69103 m!110575))

(declare-fun m!110577 () Bool)

(assert (=> b!69103 m!110577))

(assert (=> b!68767 d!22050))

(declare-fun d!22052 () Bool)

(assert (=> d!22052 (= (bitAt!0 (buf!1723 (_2!3121 lt!110019)) lt!110007) (not (= (bvand ((_ sign_extend 24) (select (arr!1918 (buf!1723 (_2!3121 lt!110019))) ((_ extract 31 0) (bvsdiv lt!110007 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!110007 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5314 () Bool)

(assert (= bs!5314 d!22052))

(declare-fun m!110579 () Bool)

(assert (=> bs!5314 m!110579))

(assert (=> bs!5314 m!110043))

(assert (=> b!68778 d!22052))

(declare-fun d!22054 () Bool)

(declare-fun e!45136 () Bool)

(assert (=> d!22054 e!45136))

(declare-fun res!57086 () Bool)

(assert (=> d!22054 (=> (not res!57086) (not e!45136))))

(declare-fun lt!110913 () (_ BitVec 64))

(declare-fun lt!110915 () (_ BitVec 64))

(declare-fun lt!110912 () (_ BitVec 64))

(assert (=> d!22054 (= res!57086 (= lt!110912 (bvsub lt!110913 lt!110915)))))

(assert (=> d!22054 (or (= (bvand lt!110913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110915 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!110913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!110913 lt!110915) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22054 (= lt!110915 (remainingBits!0 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110018)))) ((_ sign_extend 32) (currentByte!3419 (_2!3121 lt!110018))) ((_ sign_extend 32) (currentBit!3414 (_2!3121 lt!110018)))))))

(declare-fun lt!110916 () (_ BitVec 64))

(declare-fun lt!110914 () (_ BitVec 64))

(assert (=> d!22054 (= lt!110913 (bvmul lt!110916 lt!110914))))

(assert (=> d!22054 (or (= lt!110916 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!110914 (bvsdiv (bvmul lt!110916 lt!110914) lt!110916)))))

(assert (=> d!22054 (= lt!110914 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22054 (= lt!110916 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110018)))))))

(assert (=> d!22054 (= lt!110912 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3419 (_2!3121 lt!110018))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3414 (_2!3121 lt!110018)))))))

(assert (=> d!22054 (invariant!0 (currentBit!3414 (_2!3121 lt!110018)) (currentByte!3419 (_2!3121 lt!110018)) (size!1342 (buf!1723 (_2!3121 lt!110018))))))

(assert (=> d!22054 (= (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110018))) (currentByte!3419 (_2!3121 lt!110018)) (currentBit!3414 (_2!3121 lt!110018))) lt!110912)))

(declare-fun b!69106 () Bool)

(declare-fun res!57087 () Bool)

(assert (=> b!69106 (=> (not res!57087) (not e!45136))))

(assert (=> b!69106 (= res!57087 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!110912))))

(declare-fun b!69107 () Bool)

(declare-fun lt!110917 () (_ BitVec 64))

(assert (=> b!69107 (= e!45136 (bvsle lt!110912 (bvmul lt!110917 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!69107 (or (= lt!110917 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!110917 #b0000000000000000000000000000000000000000000000000000000000001000) lt!110917)))))

(assert (=> b!69107 (= lt!110917 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110018)))))))

(assert (= (and d!22054 res!57086) b!69106))

(assert (= (and b!69106 res!57087) b!69107))

(declare-fun m!110581 () Bool)

(assert (=> d!22054 m!110581))

(assert (=> d!22054 m!109875))

(assert (=> b!68777 d!22054))

(declare-fun d!22056 () Bool)

(assert (=> d!22056 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1342 (buf!1723 thiss!1379))) ((_ sign_extend 32) (currentByte!3419 thiss!1379)) ((_ sign_extend 32) (currentBit!3414 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1342 (buf!1723 thiss!1379))) ((_ sign_extend 32) (currentByte!3419 thiss!1379)) ((_ sign_extend 32) (currentBit!3414 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5315 () Bool)

(assert (= bs!5315 d!22056))

(assert (=> bs!5315 m!110051))

(assert (=> b!68766 d!22056))

(declare-fun d!22058 () Bool)

(declare-fun res!57089 () Bool)

(declare-fun e!45138 () Bool)

(assert (=> d!22058 (=> (not res!57089) (not e!45138))))

(assert (=> d!22058 (= res!57089 (= (size!1342 (buf!1723 thiss!1379)) (size!1342 (buf!1723 (_2!3121 lt!110019)))))))

(assert (=> d!22058 (= (isPrefixOf!0 thiss!1379 (_2!3121 lt!110019)) e!45138)))

(declare-fun b!69108 () Bool)

(declare-fun res!57088 () Bool)

(assert (=> b!69108 (=> (not res!57088) (not e!45138))))

(assert (=> b!69108 (= res!57088 (bvsle (bitIndex!0 (size!1342 (buf!1723 thiss!1379)) (currentByte!3419 thiss!1379) (currentBit!3414 thiss!1379)) (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110019))) (currentByte!3419 (_2!3121 lt!110019)) (currentBit!3414 (_2!3121 lt!110019)))))))

(declare-fun b!69109 () Bool)

(declare-fun e!45137 () Bool)

(assert (=> b!69109 (= e!45138 e!45137)))

(declare-fun res!57090 () Bool)

(assert (=> b!69109 (=> res!57090 e!45137)))

(assert (=> b!69109 (= res!57090 (= (size!1342 (buf!1723 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!69110 () Bool)

(assert (=> b!69110 (= e!45137 (arrayBitRangesEq!0 (buf!1723 thiss!1379) (buf!1723 (_2!3121 lt!110019)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1342 (buf!1723 thiss!1379)) (currentByte!3419 thiss!1379) (currentBit!3414 thiss!1379))))))

(assert (= (and d!22058 res!57089) b!69108))

(assert (= (and b!69108 res!57088) b!69109))

(assert (= (and b!69109 (not res!57090)) b!69110))

(assert (=> b!69108 m!109805))

(assert (=> b!69108 m!109809))

(assert (=> b!69110 m!109805))

(assert (=> b!69110 m!109805))

(declare-fun m!110583 () Bool)

(assert (=> b!69110 m!110583))

(assert (=> b!68765 d!22058))

(declare-fun d!22060 () Bool)

(assert (=> d!22060 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110019)))) ((_ sign_extend 32) (currentByte!3419 (_2!3121 lt!110019))) ((_ sign_extend 32) (currentBit!3414 (_2!3121 lt!110019))) lt!110014) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110019)))) ((_ sign_extend 32) (currentByte!3419 (_2!3121 lt!110019))) ((_ sign_extend 32) (currentBit!3414 (_2!3121 lt!110019)))) lt!110014))))

(declare-fun bs!5316 () Bool)

(assert (= bs!5316 d!22060))

(declare-fun m!110585 () Bool)

(assert (=> bs!5316 m!110585))

(assert (=> b!68765 d!22060))

(declare-fun d!22062 () Bool)

(declare-fun e!45141 () Bool)

(assert (=> d!22062 e!45141))

(declare-fun res!57093 () Bool)

(assert (=> d!22062 (=> (not res!57093) (not e!45141))))

(assert (=> d!22062 (= res!57093 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!110920 () Unit!4617)

(declare-fun choose!27 (BitStream!2294 BitStream!2294 (_ BitVec 64) (_ BitVec 64)) Unit!4617)

(assert (=> d!22062 (= lt!110920 (choose!27 thiss!1379 (_2!3121 lt!110019) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!22062 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!22062 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3121 lt!110019) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!110920)))

(declare-fun b!69113 () Bool)

(assert (=> b!69113 (= e!45141 (validate_offset_bits!1 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110019)))) ((_ sign_extend 32) (currentByte!3419 (_2!3121 lt!110019))) ((_ sign_extend 32) (currentBit!3414 (_2!3121 lt!110019))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!22062 res!57093) b!69113))

(declare-fun m!110587 () Bool)

(assert (=> d!22062 m!110587))

(declare-fun m!110589 () Bool)

(assert (=> b!69113 m!110589))

(assert (=> b!68765 d!22062))

(declare-fun b!69178 () Bool)

(declare-fun res!57145 () Bool)

(declare-fun e!45175 () Bool)

(assert (=> b!69178 (=> (not res!57145) (not e!45175))))

(declare-fun lt!111016 () tuple2!6020)

(declare-fun lt!111011 () (_ BitVec 64))

(declare-fun lt!111007 () (_ BitVec 64))

(assert (=> b!69178 (= res!57145 (= (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!111016))) (currentByte!3419 (_2!3121 lt!111016)) (currentBit!3414 (_2!3121 lt!111016))) (bvadd lt!111011 lt!111007)))))

(assert (=> b!69178 (or (not (= (bvand lt!111011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!111007 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!111011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!111011 lt!111007) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69178 (= lt!111007 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!69178 (= lt!111011 (bitIndex!0 (size!1342 (buf!1723 thiss!1379)) (currentByte!3419 thiss!1379) (currentBit!3414 thiss!1379)))))

(declare-fun b!69179 () Bool)

(declare-fun res!57149 () Bool)

(declare-fun e!45178 () Bool)

(assert (=> b!69179 (=> (not res!57149) (not e!45178))))

(declare-fun lt!111015 () tuple2!6020)

(assert (=> b!69179 (= res!57149 (isPrefixOf!0 thiss!1379 (_2!3121 lt!111015)))))

(declare-fun b!69180 () Bool)

(declare-fun e!45177 () Bool)

(assert (=> b!69180 (= e!45175 e!45177)))

(declare-fun res!57150 () Bool)

(assert (=> b!69180 (=> (not res!57150) (not e!45177))))

(declare-datatypes ((tuple2!6046 0))(
  ( (tuple2!6047 (_1!3134 BitStream!2294) (_2!3134 Bool)) )
))
(declare-fun lt!111010 () tuple2!6046)

(declare-fun lt!111014 () (_ BitVec 8))

(assert (=> b!69180 (= res!57150 (and (= (_2!3134 lt!111010) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1918 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!111014)) #b00000000000000000000000000000000))) (= (_1!3134 lt!111010) (_2!3121 lt!111016))))))

(declare-fun lt!111012 () tuple2!6042)

(declare-fun lt!111005 () BitStream!2294)

(assert (=> b!69180 (= lt!111012 (readBits!0 lt!111005 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2294) tuple2!6046)

(assert (=> b!69180 (= lt!111010 (readBitPure!0 lt!111005))))

(declare-fun readerFrom!0 (BitStream!2294 (_ BitVec 32) (_ BitVec 32)) BitStream!2294)

(assert (=> b!69180 (= lt!111005 (readerFrom!0 (_2!3121 lt!111016) (currentBit!3414 thiss!1379) (currentByte!3419 thiss!1379)))))

(declare-fun d!22064 () Bool)

(assert (=> d!22064 e!45175))

(declare-fun res!57147 () Bool)

(assert (=> d!22064 (=> (not res!57147) (not e!45175))))

(assert (=> d!22064 (= res!57147 (= (size!1342 (buf!1723 (_2!3121 lt!111016))) (size!1342 (buf!1723 thiss!1379))))))

(declare-fun lt!111013 () array!2894)

(assert (=> d!22064 (= lt!111014 (select (arr!1918 lt!111013) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!22064 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1342 lt!111013)))))

(assert (=> d!22064 (= lt!111013 (array!2895 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!111008 () tuple2!6020)

(assert (=> d!22064 (= lt!111016 (tuple2!6021 (_1!3121 lt!111008) (_2!3121 lt!111008)))))

(assert (=> d!22064 (= lt!111008 lt!111015)))

(assert (=> d!22064 e!45178))

(declare-fun res!57148 () Bool)

(assert (=> d!22064 (=> (not res!57148) (not e!45178))))

(assert (=> d!22064 (= res!57148 (= (size!1342 (buf!1723 thiss!1379)) (size!1342 (buf!1723 (_2!3121 lt!111015)))))))

(declare-fun lt!111006 () Bool)

(declare-fun appendBit!0 (BitStream!2294 Bool) tuple2!6020)

(assert (=> d!22064 (= lt!111015 (appendBit!0 thiss!1379 lt!111006))))

(assert (=> d!22064 (= lt!111006 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1918 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!22064 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!22064 (= (appendBitFromByte!0 thiss!1379 (select (arr!1918 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!111016)))

(declare-fun b!69181 () Bool)

(assert (=> b!69181 (= e!45177 (= (bitIndex!0 (size!1342 (buf!1723 (_1!3134 lt!111010))) (currentByte!3419 (_1!3134 lt!111010)) (currentBit!3414 (_1!3134 lt!111010))) (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!111016))) (currentByte!3419 (_2!3121 lt!111016)) (currentBit!3414 (_2!3121 lt!111016)))))))

(declare-fun b!69182 () Bool)

(declare-fun res!57144 () Bool)

(assert (=> b!69182 (=> (not res!57144) (not e!45178))))

(assert (=> b!69182 (= res!57144 (= (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!111015))) (currentByte!3419 (_2!3121 lt!111015)) (currentBit!3414 (_2!3121 lt!111015))) (bvadd (bitIndex!0 (size!1342 (buf!1723 thiss!1379)) (currentByte!3419 thiss!1379) (currentBit!3414 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!69183 () Bool)

(declare-fun e!45176 () Bool)

(declare-fun lt!111009 () tuple2!6046)

(assert (=> b!69183 (= e!45176 (= (bitIndex!0 (size!1342 (buf!1723 (_1!3134 lt!111009))) (currentByte!3419 (_1!3134 lt!111009)) (currentBit!3414 (_1!3134 lt!111009))) (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!111015))) (currentByte!3419 (_2!3121 lt!111015)) (currentBit!3414 (_2!3121 lt!111015)))))))

(declare-fun b!69184 () Bool)

(declare-fun res!57151 () Bool)

(assert (=> b!69184 (=> (not res!57151) (not e!45175))))

(assert (=> b!69184 (= res!57151 (isPrefixOf!0 thiss!1379 (_2!3121 lt!111016)))))

(declare-fun b!69185 () Bool)

(assert (=> b!69185 (= e!45178 e!45176)))

(declare-fun res!57146 () Bool)

(assert (=> b!69185 (=> (not res!57146) (not e!45176))))

(assert (=> b!69185 (= res!57146 (and (= (_2!3134 lt!111009) lt!111006) (= (_1!3134 lt!111009) (_2!3121 lt!111015))))))

(assert (=> b!69185 (= lt!111009 (readBitPure!0 (readerFrom!0 (_2!3121 lt!111015) (currentBit!3414 thiss!1379) (currentByte!3419 thiss!1379))))))

(assert (= (and d!22064 res!57148) b!69182))

(assert (= (and b!69182 res!57144) b!69179))

(assert (= (and b!69179 res!57149) b!69185))

(assert (= (and b!69185 res!57146) b!69183))

(assert (= (and d!22064 res!57147) b!69178))

(assert (= (and b!69178 res!57145) b!69184))

(assert (= (and b!69184 res!57151) b!69180))

(assert (= (and b!69180 res!57150) b!69181))

(declare-fun m!110651 () Bool)

(assert (=> b!69182 m!110651))

(assert (=> b!69182 m!109805))

(declare-fun m!110653 () Bool)

(assert (=> b!69185 m!110653))

(assert (=> b!69185 m!110653))

(declare-fun m!110655 () Bool)

(assert (=> b!69185 m!110655))

(declare-fun m!110657 () Bool)

(assert (=> d!22064 m!110657))

(declare-fun m!110659 () Bool)

(assert (=> d!22064 m!110659))

(assert (=> d!22064 m!110125))

(declare-fun m!110661 () Bool)

(assert (=> b!69184 m!110661))

(declare-fun m!110663 () Bool)

(assert (=> b!69178 m!110663))

(assert (=> b!69178 m!109805))

(declare-fun m!110665 () Bool)

(assert (=> b!69183 m!110665))

(assert (=> b!69183 m!110651))

(declare-fun m!110667 () Bool)

(assert (=> b!69179 m!110667))

(declare-fun m!110669 () Bool)

(assert (=> b!69180 m!110669))

(declare-fun m!110671 () Bool)

(assert (=> b!69180 m!110671))

(declare-fun m!110673 () Bool)

(assert (=> b!69180 m!110673))

(declare-fun m!110675 () Bool)

(assert (=> b!69181 m!110675))

(assert (=> b!69181 m!110663))

(assert (=> b!68765 d!22064))

(declare-fun d!22110 () Bool)

(assert (=> d!22110 (= (invariant!0 (currentBit!3414 (_2!3121 lt!110019)) (currentByte!3419 (_2!3121 lt!110019)) (size!1342 (buf!1723 (_2!3121 lt!110019)))) (and (bvsge (currentBit!3414 (_2!3121 lt!110019)) #b00000000000000000000000000000000) (bvslt (currentBit!3414 (_2!3121 lt!110019)) #b00000000000000000000000000001000) (bvsge (currentByte!3419 (_2!3121 lt!110019)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3419 (_2!3121 lt!110019)) (size!1342 (buf!1723 (_2!3121 lt!110019)))) (and (= (currentBit!3414 (_2!3121 lt!110019)) #b00000000000000000000000000000000) (= (currentByte!3419 (_2!3121 lt!110019)) (size!1342 (buf!1723 (_2!3121 lt!110019))))))))))

(assert (=> b!68776 d!22110))

(declare-fun d!22112 () Bool)

(declare-fun e!45179 () Bool)

(assert (=> d!22112 e!45179))

(declare-fun res!57152 () Bool)

(assert (=> d!22112 (=> (not res!57152) (not e!45179))))

(declare-fun lt!111020 () (_ BitVec 64))

(declare-fun lt!111017 () (_ BitVec 64))

(declare-fun lt!111018 () (_ BitVec 64))

(assert (=> d!22112 (= res!57152 (= lt!111017 (bvsub lt!111018 lt!111020)))))

(assert (=> d!22112 (or (= (bvand lt!111018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!111020 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!111018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!111018 lt!111020) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22112 (= lt!111020 (remainingBits!0 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110019)))) ((_ sign_extend 32) (currentByte!3419 (_2!3121 lt!110019))) ((_ sign_extend 32) (currentBit!3414 (_2!3121 lt!110019)))))))

(declare-fun lt!111021 () (_ BitVec 64))

(declare-fun lt!111019 () (_ BitVec 64))

(assert (=> d!22112 (= lt!111018 (bvmul lt!111021 lt!111019))))

(assert (=> d!22112 (or (= lt!111021 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!111019 (bvsdiv (bvmul lt!111021 lt!111019) lt!111021)))))

(assert (=> d!22112 (= lt!111019 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22112 (= lt!111021 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110019)))))))

(assert (=> d!22112 (= lt!111017 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3419 (_2!3121 lt!110019))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3414 (_2!3121 lt!110019)))))))

(assert (=> d!22112 (invariant!0 (currentBit!3414 (_2!3121 lt!110019)) (currentByte!3419 (_2!3121 lt!110019)) (size!1342 (buf!1723 (_2!3121 lt!110019))))))

(assert (=> d!22112 (= (bitIndex!0 (size!1342 (buf!1723 (_2!3121 lt!110019))) (currentByte!3419 (_2!3121 lt!110019)) (currentBit!3414 (_2!3121 lt!110019))) lt!111017)))

(declare-fun b!69186 () Bool)

(declare-fun res!57153 () Bool)

(assert (=> b!69186 (=> (not res!57153) (not e!45179))))

(assert (=> b!69186 (= res!57153 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!111017))))

(declare-fun b!69187 () Bool)

(declare-fun lt!111022 () (_ BitVec 64))

(assert (=> b!69187 (= e!45179 (bvsle lt!111017 (bvmul lt!111022 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!69187 (or (= lt!111022 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!111022 #b0000000000000000000000000000000000000000000000000000000000001000) lt!111022)))))

(assert (=> b!69187 (= lt!111022 ((_ sign_extend 32) (size!1342 (buf!1723 (_2!3121 lt!110019)))))))

(assert (= (and d!22112 res!57152) b!69186))

(assert (= (and b!69186 res!57153) b!69187))

(assert (=> d!22112 m!110585))

(assert (=> d!22112 m!109819))

(assert (=> b!68775 d!22112))

(push 1)

(assert (not d!21952))

(assert (not b!68926))

(assert (not d!22048))

(assert (not b!69080))

(assert (not b!68907))

(assert (not b!69178))

(assert (not b!69090))

(assert (not d!22064))

(assert (not b!69181))

(assert (not b!69180))

(assert (not b!69101))

(assert (not b!69062))

(assert (not d!22042))

(assert (not d!21976))

(assert (not b!69094))

(assert (not b!69097))

(assert (not d!21946))

(assert (not b!69082))

(assert (not b!69043))

(assert (not b!69110))

(assert (not b!69104))

(assert (not b!69085))

(assert (not b!69183))

(assert (not d!22022))

(assert (not d!22112))

(assert (not d!22026))

(assert (not b!69037))

(assert (not b!69184))

(assert (not b!69108))

(assert (not d!22060))

(assert (not b!69087))

(assert (not b!69039))

(assert (not b!69100))

(assert (not d!22062))

(assert (not d!21974))

(assert (not b!69038))

(assert (not b!69064))

(assert (not bm!886))

(assert (not d!22040))

(assert (not d!22014))

(assert (not b!68946))

(assert (not b!69099))

(assert (not b!68958))

(assert (not b!69113))

(assert (not b!69078))

(assert (not b!68957))

(assert (not d!21978))

(assert (not d!22044))

(assert (not b!69081))

(assert (not d!22036))

(assert (not b!69185))

(assert (not d!22054))

(assert (not b!69105))

(assert (not b!69096))

(assert (not b!68956))

(assert (not b!69095))

(assert (not b!69103))

(assert (not d!22002))

(assert (not d!22056))

(assert (not b!69040))

(assert (not b!69036))

(assert (not b!69092))

(assert (not b!69182))

(assert (not d!22046))

(assert (not b!69083))

(assert (not b!69088))

(assert (not d!21948))

(assert (not b!68905))

(assert (not b!69179))

(assert (not b!69091))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

