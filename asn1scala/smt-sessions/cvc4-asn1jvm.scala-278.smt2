; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5652 () Bool)

(assert start!5652)

(declare-fun b!23328 () Bool)

(declare-fun e!15782 () Bool)

(declare-fun e!15780 () Bool)

(assert (=> b!23328 (= e!15782 e!15780)))

(declare-fun res!20062 () Bool)

(assert (=> b!23328 (=> res!20062 e!15780)))

(declare-datatypes ((array!1575 0))(
  ( (array!1576 (arr!1129 (Array (_ BitVec 32) (_ BitVec 8))) (size!673 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1178 0))(
  ( (BitStream!1179 (buf!994 array!1575) (currentByte!2307 (_ BitVec 32)) (currentBit!2302 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1178)

(declare-datatypes ((Unit!1989 0))(
  ( (Unit!1990) )
))
(declare-datatypes ((tuple2!2674 0))(
  ( (tuple2!2675 (_1!1424 Unit!1989) (_2!1424 BitStream!1178)) )
))
(declare-fun lt!33889 () tuple2!2674)

(declare-fun isPrefixOf!0 (BitStream!1178 BitStream!1178) Bool)

(assert (=> b!23328 (= res!20062 (not (isPrefixOf!0 thiss!1379 (_2!1424 lt!33889))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23328 (validate_offset_bits!1 ((_ sign_extend 32) (size!673 (buf!994 (_2!1424 lt!33889)))) ((_ sign_extend 32) (currentByte!2307 (_2!1424 lt!33889))) ((_ sign_extend 32) (currentBit!2302 (_2!1424 lt!33889))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33895 () Unit!1989)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1178 BitStream!1178 (_ BitVec 64) (_ BitVec 64)) Unit!1989)

(assert (=> b!23328 (= lt!33895 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1424 lt!33889) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1575)

(declare-fun appendBitFromByte!0 (BitStream!1178 (_ BitVec 8) (_ BitVec 32)) tuple2!2674)

(assert (=> b!23328 (= lt!33889 (appendBitFromByte!0 thiss!1379 (select (arr!1129 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!20066 () Bool)

(declare-fun e!15787 () Bool)

(assert (=> start!5652 (=> (not res!20066) (not e!15787))))

(assert (=> start!5652 (= res!20066 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!673 srcBuffer!2))))))))

(assert (=> start!5652 e!15787))

(assert (=> start!5652 true))

(declare-fun array_inv!642 (array!1575) Bool)

(assert (=> start!5652 (array_inv!642 srcBuffer!2)))

(declare-fun e!15781 () Bool)

(declare-fun inv!12 (BitStream!1178) Bool)

(assert (=> start!5652 (and (inv!12 thiss!1379) e!15781)))

(declare-fun b!23329 () Bool)

(assert (=> b!23329 (= e!15781 (array_inv!642 (buf!994 thiss!1379)))))

(declare-fun b!23330 () Bool)

(declare-fun e!15786 () Bool)

(assert (=> b!23330 (= e!15786 true)))

(declare-datatypes ((tuple2!2676 0))(
  ( (tuple2!2677 (_1!1425 BitStream!1178) (_2!1425 BitStream!1178)) )
))
(declare-fun lt!33892 () tuple2!2676)

(declare-fun lt!33893 () tuple2!2674)

(declare-fun reader!0 (BitStream!1178 BitStream!1178) tuple2!2676)

(assert (=> b!23330 (= lt!33892 (reader!0 thiss!1379 (_2!1424 lt!33893)))))

(declare-fun b!23331 () Bool)

(declare-fun res!20064 () Bool)

(assert (=> b!23331 (=> (not res!20064) (not e!15787))))

(assert (=> b!23331 (= res!20064 (validate_offset_bits!1 ((_ sign_extend 32) (size!673 (buf!994 thiss!1379))) ((_ sign_extend 32) (currentByte!2307 thiss!1379)) ((_ sign_extend 32) (currentBit!2302 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!23332 () Bool)

(declare-fun e!15788 () Bool)

(assert (=> b!23332 (= e!15780 e!15788)))

(declare-fun res!20065 () Bool)

(assert (=> b!23332 (=> res!20065 e!15788)))

(assert (=> b!23332 (= res!20065 (not (isPrefixOf!0 (_2!1424 lt!33889) (_2!1424 lt!33893))))))

(assert (=> b!23332 (isPrefixOf!0 thiss!1379 (_2!1424 lt!33893))))

(declare-fun lt!33896 () Unit!1989)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1178 BitStream!1178 BitStream!1178) Unit!1989)

(assert (=> b!23332 (= lt!33896 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1424 lt!33889) (_2!1424 lt!33893)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1178 array!1575 (_ BitVec 64) (_ BitVec 64)) tuple2!2674)

(assert (=> b!23332 (= lt!33893 (appendBitsMSBFirstLoop!0 (_2!1424 lt!33889) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!15785 () Bool)

(assert (=> b!23332 e!15785))

(declare-fun res!20069 () Bool)

(assert (=> b!23332 (=> (not res!20069) (not e!15785))))

(assert (=> b!23332 (= res!20069 (validate_offset_bits!1 ((_ sign_extend 32) (size!673 (buf!994 (_2!1424 lt!33889)))) ((_ sign_extend 32) (currentByte!2307 thiss!1379)) ((_ sign_extend 32) (currentBit!2302 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33891 () Unit!1989)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1178 array!1575 (_ BitVec 64)) Unit!1989)

(assert (=> b!23332 (= lt!33891 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!994 (_2!1424 lt!33889)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33897 () tuple2!2676)

(assert (=> b!23332 (= lt!33897 (reader!0 thiss!1379 (_2!1424 lt!33889)))))

(declare-fun b!23333 () Bool)

(declare-fun res!20060 () Bool)

(assert (=> b!23333 (=> res!20060 e!15786)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23333 (= res!20060 (not (invariant!0 (currentBit!2302 (_2!1424 lt!33889)) (currentByte!2307 (_2!1424 lt!33889)) (size!673 (buf!994 (_2!1424 lt!33889))))))))

(declare-fun b!23334 () Bool)

(declare-fun e!15783 () Bool)

(assert (=> b!23334 (= e!15783 e!15786)))

(declare-fun res!20058 () Bool)

(assert (=> b!23334 (=> res!20058 e!15786)))

(assert (=> b!23334 (= res!20058 (not (= (size!673 (buf!994 (_2!1424 lt!33889))) (size!673 (buf!994 (_2!1424 lt!33893))))))))

(declare-fun e!15790 () Bool)

(assert (=> b!23334 e!15790))

(declare-fun res!20067 () Bool)

(assert (=> b!23334 (=> (not res!20067) (not e!15790))))

(assert (=> b!23334 (= res!20067 (= (size!673 (buf!994 (_2!1424 lt!33893))) (size!673 (buf!994 thiss!1379))))))

(declare-fun b!23335 () Bool)

(declare-fun res!20070 () Bool)

(assert (=> b!23335 (=> res!20070 e!15783)))

(assert (=> b!23335 (= res!20070 (not (= (size!673 (buf!994 thiss!1379)) (size!673 (buf!994 (_2!1424 lt!33893))))))))

(declare-fun b!23336 () Bool)

(declare-fun res!20059 () Bool)

(assert (=> b!23336 (=> res!20059 e!15786)))

(assert (=> b!23336 (= res!20059 (not (invariant!0 (currentBit!2302 (_2!1424 lt!33889)) (currentByte!2307 (_2!1424 lt!33889)) (size!673 (buf!994 (_2!1424 lt!33893))))))))

(declare-fun b!23337 () Bool)

(assert (=> b!23337 (= e!15788 e!15783)))

(declare-fun res!20063 () Bool)

(assert (=> b!23337 (=> res!20063 e!15783)))

(declare-fun lt!33894 () (_ BitVec 64))

(declare-fun lt!33890 () (_ BitVec 64))

(assert (=> b!23337 (= res!20063 (not (= lt!33890 (bvsub (bvadd lt!33894 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23337 (= lt!33890 (bitIndex!0 (size!673 (buf!994 (_2!1424 lt!33893))) (currentByte!2307 (_2!1424 lt!33893)) (currentBit!2302 (_2!1424 lt!33893))))))

(declare-fun b!23338 () Bool)

(declare-datatypes ((List!290 0))(
  ( (Nil!287) (Cons!286 (h!405 Bool) (t!1040 List!290)) )
))
(declare-fun head!127 (List!290) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1178 array!1575 (_ BitVec 64) (_ BitVec 64)) List!290)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1178 BitStream!1178 (_ BitVec 64)) List!290)

(assert (=> b!23338 (= e!15785 (= (head!127 (byteArrayBitContentToList!0 (_2!1424 lt!33889) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!127 (bitStreamReadBitsIntoList!0 (_2!1424 lt!33889) (_1!1425 lt!33897) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!23339 () Bool)

(assert (=> b!23339 (= e!15790 (= lt!33890 (bvsub (bvsub (bvadd (bitIndex!0 (size!673 (buf!994 (_2!1424 lt!33889))) (currentByte!2307 (_2!1424 lt!33889)) (currentBit!2302 (_2!1424 lt!33889))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!23340 () Bool)

(declare-fun res!20068 () Bool)

(assert (=> b!23340 (=> res!20068 e!15783)))

(assert (=> b!23340 (= res!20068 (not (invariant!0 (currentBit!2302 (_2!1424 lt!33893)) (currentByte!2307 (_2!1424 lt!33893)) (size!673 (buf!994 (_2!1424 lt!33893))))))))

(declare-fun b!23341 () Bool)

(assert (=> b!23341 (= e!15787 (not e!15782))))

(declare-fun res!20061 () Bool)

(assert (=> b!23341 (=> res!20061 e!15782)))

(assert (=> b!23341 (= res!20061 (bvsge i!635 to!314))))

(assert (=> b!23341 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!33898 () Unit!1989)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1178) Unit!1989)

(assert (=> b!23341 (= lt!33898 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!23341 (= lt!33894 (bitIndex!0 (size!673 (buf!994 thiss!1379)) (currentByte!2307 thiss!1379) (currentBit!2302 thiss!1379)))))

(assert (= (and start!5652 res!20066) b!23331))

(assert (= (and b!23331 res!20064) b!23341))

(assert (= (and b!23341 (not res!20061)) b!23328))

(assert (= (and b!23328 (not res!20062)) b!23332))

(assert (= (and b!23332 res!20069) b!23338))

(assert (= (and b!23332 (not res!20065)) b!23337))

(assert (= (and b!23337 (not res!20063)) b!23340))

(assert (= (and b!23340 (not res!20068)) b!23335))

(assert (= (and b!23335 (not res!20070)) b!23334))

(assert (= (and b!23334 res!20067) b!23339))

(assert (= (and b!23334 (not res!20058)) b!23333))

(assert (= (and b!23333 (not res!20060)) b!23336))

(assert (= (and b!23336 (not res!20059)) b!23330))

(assert (= start!5652 b!23329))

(declare-fun m!32777 () Bool)

(assert (=> b!23340 m!32777))

(declare-fun m!32779 () Bool)

(assert (=> b!23338 m!32779))

(assert (=> b!23338 m!32779))

(declare-fun m!32781 () Bool)

(assert (=> b!23338 m!32781))

(declare-fun m!32783 () Bool)

(assert (=> b!23338 m!32783))

(assert (=> b!23338 m!32783))

(declare-fun m!32785 () Bool)

(assert (=> b!23338 m!32785))

(declare-fun m!32787 () Bool)

(assert (=> b!23341 m!32787))

(declare-fun m!32789 () Bool)

(assert (=> b!23341 m!32789))

(declare-fun m!32791 () Bool)

(assert (=> b!23341 m!32791))

(declare-fun m!32793 () Bool)

(assert (=> b!23329 m!32793))

(declare-fun m!32795 () Bool)

(assert (=> b!23332 m!32795))

(declare-fun m!32797 () Bool)

(assert (=> b!23332 m!32797))

(declare-fun m!32799 () Bool)

(assert (=> b!23332 m!32799))

(declare-fun m!32801 () Bool)

(assert (=> b!23332 m!32801))

(declare-fun m!32803 () Bool)

(assert (=> b!23332 m!32803))

(declare-fun m!32805 () Bool)

(assert (=> b!23332 m!32805))

(declare-fun m!32807 () Bool)

(assert (=> b!23332 m!32807))

(declare-fun m!32809 () Bool)

(assert (=> b!23333 m!32809))

(declare-fun m!32811 () Bool)

(assert (=> b!23337 m!32811))

(declare-fun m!32813 () Bool)

(assert (=> b!23328 m!32813))

(declare-fun m!32815 () Bool)

(assert (=> b!23328 m!32815))

(declare-fun m!32817 () Bool)

(assert (=> b!23328 m!32817))

(declare-fun m!32819 () Bool)

(assert (=> b!23328 m!32819))

(assert (=> b!23328 m!32815))

(declare-fun m!32821 () Bool)

(assert (=> b!23328 m!32821))

(declare-fun m!32823 () Bool)

(assert (=> b!23330 m!32823))

(declare-fun m!32825 () Bool)

(assert (=> b!23331 m!32825))

(declare-fun m!32827 () Bool)

(assert (=> b!23339 m!32827))

(declare-fun m!32829 () Bool)

(assert (=> b!23336 m!32829))

(declare-fun m!32831 () Bool)

(assert (=> start!5652 m!32831))

(declare-fun m!32833 () Bool)

(assert (=> start!5652 m!32833))

(push 1)

(assert (not b!23328))

(assert (not b!23329))

(assert (not b!23330))

(assert (not b!23331))

(assert (not b!23336))

(assert (not b!23339))

(assert (not b!23340))

(assert (not b!23341))

(assert (not b!23338))

(assert (not b!23337))

(assert (not b!23333))

(assert (not b!23332))

(assert (not start!5652))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

