; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5642 () Bool)

(assert start!5642)

(declare-fun b!23118 () Bool)

(declare-fun e!15616 () Bool)

(declare-fun e!15622 () Bool)

(assert (=> b!23118 (= e!15616 e!15622)))

(declare-fun res!19871 () Bool)

(assert (=> b!23118 (=> res!19871 e!15622)))

(declare-datatypes ((array!1565 0))(
  ( (array!1566 (arr!1124 (Array (_ BitVec 32) (_ BitVec 8))) (size!668 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1168 0))(
  ( (BitStream!1169 (buf!989 array!1565) (currentByte!2302 (_ BitVec 32)) (currentBit!2297 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1979 0))(
  ( (Unit!1980) )
))
(declare-datatypes ((tuple2!2654 0))(
  ( (tuple2!2655 (_1!1414 Unit!1979) (_2!1414 BitStream!1168)) )
))
(declare-fun lt!33748 () tuple2!2654)

(declare-fun lt!33746 () tuple2!2654)

(declare-fun isPrefixOf!0 (BitStream!1168 BitStream!1168) Bool)

(assert (=> b!23118 (= res!19871 (not (isPrefixOf!0 (_2!1414 lt!33748) (_2!1414 lt!33746))))))

(declare-fun thiss!1379 () BitStream!1168)

(assert (=> b!23118 (isPrefixOf!0 thiss!1379 (_2!1414 lt!33746))))

(declare-fun lt!33745 () Unit!1979)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1168 BitStream!1168 BitStream!1168) Unit!1979)

(assert (=> b!23118 (= lt!33745 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1414 lt!33748) (_2!1414 lt!33746)))))

(declare-fun srcBuffer!2 () array!1565)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1168 array!1565 (_ BitVec 64) (_ BitVec 64)) tuple2!2654)

(assert (=> b!23118 (= lt!33746 (appendBitsMSBFirstLoop!0 (_2!1414 lt!33748) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!15619 () Bool)

(assert (=> b!23118 e!15619))

(declare-fun res!19873 () Bool)

(assert (=> b!23118 (=> (not res!19873) (not e!15619))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23118 (= res!19873 (validate_offset_bits!1 ((_ sign_extend 32) (size!668 (buf!989 (_2!1414 lt!33748)))) ((_ sign_extend 32) (currentByte!2302 thiss!1379)) ((_ sign_extend 32) (currentBit!2297 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33747 () Unit!1979)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1168 array!1565 (_ BitVec 64)) Unit!1979)

(assert (=> b!23118 (= lt!33747 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!989 (_2!1414 lt!33748)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2656 0))(
  ( (tuple2!2657 (_1!1415 BitStream!1168) (_2!1415 BitStream!1168)) )
))
(declare-fun lt!33741 () tuple2!2656)

(declare-fun reader!0 (BitStream!1168 BitStream!1168) tuple2!2656)

(assert (=> b!23118 (= lt!33741 (reader!0 thiss!1379 (_2!1414 lt!33748)))))

(declare-fun b!23119 () Bool)

(declare-fun e!15623 () Bool)

(declare-fun e!15624 () Bool)

(assert (=> b!23119 (= e!15623 (not e!15624))))

(declare-fun res!19870 () Bool)

(assert (=> b!23119 (=> res!19870 e!15624)))

(assert (=> b!23119 (= res!19870 (bvsge i!635 to!314))))

(assert (=> b!23119 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!33739 () Unit!1979)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1168) Unit!1979)

(assert (=> b!23119 (= lt!33739 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!33743 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23119 (= lt!33743 (bitIndex!0 (size!668 (buf!989 thiss!1379)) (currentByte!2302 thiss!1379) (currentBit!2297 thiss!1379)))))

(declare-fun res!19874 () Bool)

(assert (=> start!5642 (=> (not res!19874) (not e!15623))))

(assert (=> start!5642 (= res!19874 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!668 srcBuffer!2))))))))

(assert (=> start!5642 e!15623))

(assert (=> start!5642 true))

(declare-fun array_inv!637 (array!1565) Bool)

(assert (=> start!5642 (array_inv!637 srcBuffer!2)))

(declare-fun e!15618 () Bool)

(declare-fun inv!12 (BitStream!1168) Bool)

(assert (=> start!5642 (and (inv!12 thiss!1379) e!15618)))

(declare-fun b!23120 () Bool)

(declare-fun res!19863 () Bool)

(declare-fun e!15617 () Bool)

(assert (=> b!23120 (=> res!19863 e!15617)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23120 (= res!19863 (not (invariant!0 (currentBit!2297 (_2!1414 lt!33746)) (currentByte!2302 (_2!1414 lt!33746)) (size!668 (buf!989 (_2!1414 lt!33746))))))))

(declare-fun b!23121 () Bool)

(declare-fun res!19875 () Bool)

(declare-fun e!15621 () Bool)

(assert (=> b!23121 (=> res!19875 e!15621)))

(assert (=> b!23121 (= res!19875 (not (invariant!0 (currentBit!2297 (_2!1414 lt!33748)) (currentByte!2302 (_2!1414 lt!33748)) (size!668 (buf!989 (_2!1414 lt!33746))))))))

(declare-fun b!23122 () Bool)

(declare-fun res!19869 () Bool)

(assert (=> b!23122 (=> (not res!19869) (not e!15623))))

(assert (=> b!23122 (= res!19869 (validate_offset_bits!1 ((_ sign_extend 32) (size!668 (buf!989 thiss!1379))) ((_ sign_extend 32) (currentByte!2302 thiss!1379)) ((_ sign_extend 32) (currentBit!2297 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!23123 () Bool)

(declare-fun res!19868 () Bool)

(assert (=> b!23123 (=> res!19868 e!15617)))

(assert (=> b!23123 (= res!19868 (not (= (size!668 (buf!989 thiss!1379)) (size!668 (buf!989 (_2!1414 lt!33746))))))))

(declare-fun b!23124 () Bool)

(assert (=> b!23124 (= e!15617 e!15621)))

(declare-fun res!19872 () Bool)

(assert (=> b!23124 (=> res!19872 e!15621)))

(assert (=> b!23124 (= res!19872 (not (= (size!668 (buf!989 (_2!1414 lt!33748))) (size!668 (buf!989 (_2!1414 lt!33746))))))))

(declare-fun e!15625 () Bool)

(assert (=> b!23124 e!15625))

(declare-fun res!19865 () Bool)

(assert (=> b!23124 (=> (not res!19865) (not e!15625))))

(assert (=> b!23124 (= res!19865 (= (size!668 (buf!989 (_2!1414 lt!33746))) (size!668 (buf!989 thiss!1379))))))

(declare-fun b!23125 () Bool)

(assert (=> b!23125 (= e!15624 e!15616)))

(declare-fun res!19867 () Bool)

(assert (=> b!23125 (=> res!19867 e!15616)))

(assert (=> b!23125 (= res!19867 (not (isPrefixOf!0 thiss!1379 (_2!1414 lt!33748))))))

(assert (=> b!23125 (validate_offset_bits!1 ((_ sign_extend 32) (size!668 (buf!989 (_2!1414 lt!33748)))) ((_ sign_extend 32) (currentByte!2302 (_2!1414 lt!33748))) ((_ sign_extend 32) (currentBit!2297 (_2!1414 lt!33748))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33744 () Unit!1979)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1168 BitStream!1168 (_ BitVec 64) (_ BitVec 64)) Unit!1979)

(assert (=> b!23125 (= lt!33744 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1414 lt!33748) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1168 (_ BitVec 8) (_ BitVec 32)) tuple2!2654)

(assert (=> b!23125 (= lt!33748 (appendBitFromByte!0 thiss!1379 (select (arr!1124 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!23126 () Bool)

(assert (=> b!23126 (= e!15622 e!15617)))

(declare-fun res!19866 () Bool)

(assert (=> b!23126 (=> res!19866 e!15617)))

(declare-fun lt!33742 () (_ BitVec 64))

(assert (=> b!23126 (= res!19866 (not (= lt!33742 (bvsub (bvadd lt!33743 to!314) i!635))))))

(assert (=> b!23126 (= lt!33742 (bitIndex!0 (size!668 (buf!989 (_2!1414 lt!33746))) (currentByte!2302 (_2!1414 lt!33746)) (currentBit!2297 (_2!1414 lt!33746))))))

(declare-fun b!23127 () Bool)

(declare-fun res!19864 () Bool)

(assert (=> b!23127 (=> res!19864 e!15621)))

(assert (=> b!23127 (= res!19864 (not (invariant!0 (currentBit!2297 (_2!1414 lt!33748)) (currentByte!2302 (_2!1414 lt!33748)) (size!668 (buf!989 (_2!1414 lt!33748))))))))

(declare-fun b!23128 () Bool)

(assert (=> b!23128 (= e!15618 (array_inv!637 (buf!989 thiss!1379)))))

(declare-fun b!23129 () Bool)

(assert (=> b!23129 (= e!15621 true)))

(declare-fun lt!33740 () tuple2!2656)

(assert (=> b!23129 (= lt!33740 (reader!0 thiss!1379 (_2!1414 lt!33746)))))

(declare-fun b!23130 () Bool)

(assert (=> b!23130 (= e!15625 (= lt!33742 (bvsub (bvsub (bvadd (bitIndex!0 (size!668 (buf!989 (_2!1414 lt!33748))) (currentByte!2302 (_2!1414 lt!33748)) (currentBit!2297 (_2!1414 lt!33748))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!23131 () Bool)

(declare-datatypes ((List!285 0))(
  ( (Nil!282) (Cons!281 (h!400 Bool) (t!1035 List!285)) )
))
(declare-fun head!122 (List!285) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1168 array!1565 (_ BitVec 64) (_ BitVec 64)) List!285)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1168 BitStream!1168 (_ BitVec 64)) List!285)

(assert (=> b!23131 (= e!15619 (= (head!122 (byteArrayBitContentToList!0 (_2!1414 lt!33748) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!122 (bitStreamReadBitsIntoList!0 (_2!1414 lt!33748) (_1!1415 lt!33741) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!5642 res!19874) b!23122))

(assert (= (and b!23122 res!19869) b!23119))

(assert (= (and b!23119 (not res!19870)) b!23125))

(assert (= (and b!23125 (not res!19867)) b!23118))

(assert (= (and b!23118 res!19873) b!23131))

(assert (= (and b!23118 (not res!19871)) b!23126))

(assert (= (and b!23126 (not res!19866)) b!23120))

(assert (= (and b!23120 (not res!19863)) b!23123))

(assert (= (and b!23123 (not res!19868)) b!23124))

(assert (= (and b!23124 res!19865) b!23130))

(assert (= (and b!23124 (not res!19872)) b!23127))

(assert (= (and b!23127 (not res!19864)) b!23121))

(assert (= (and b!23121 (not res!19875)) b!23129))

(assert (= start!5642 b!23128))

(declare-fun m!32487 () Bool)

(assert (=> b!23122 m!32487))

(declare-fun m!32489 () Bool)

(assert (=> b!23118 m!32489))

(declare-fun m!32491 () Bool)

(assert (=> b!23118 m!32491))

(declare-fun m!32493 () Bool)

(assert (=> b!23118 m!32493))

(declare-fun m!32495 () Bool)

(assert (=> b!23118 m!32495))

(declare-fun m!32497 () Bool)

(assert (=> b!23118 m!32497))

(declare-fun m!32499 () Bool)

(assert (=> b!23118 m!32499))

(declare-fun m!32501 () Bool)

(assert (=> b!23118 m!32501))

(declare-fun m!32503 () Bool)

(assert (=> b!23125 m!32503))

(declare-fun m!32505 () Bool)

(assert (=> b!23125 m!32505))

(declare-fun m!32507 () Bool)

(assert (=> b!23125 m!32507))

(declare-fun m!32509 () Bool)

(assert (=> b!23125 m!32509))

(assert (=> b!23125 m!32505))

(declare-fun m!32511 () Bool)

(assert (=> b!23125 m!32511))

(declare-fun m!32513 () Bool)

(assert (=> b!23129 m!32513))

(declare-fun m!32515 () Bool)

(assert (=> b!23120 m!32515))

(declare-fun m!32517 () Bool)

(assert (=> b!23128 m!32517))

(declare-fun m!32519 () Bool)

(assert (=> b!23121 m!32519))

(declare-fun m!32521 () Bool)

(assert (=> start!5642 m!32521))

(declare-fun m!32523 () Bool)

(assert (=> start!5642 m!32523))

(declare-fun m!32525 () Bool)

(assert (=> b!23127 m!32525))

(declare-fun m!32527 () Bool)

(assert (=> b!23119 m!32527))

(declare-fun m!32529 () Bool)

(assert (=> b!23119 m!32529))

(declare-fun m!32531 () Bool)

(assert (=> b!23119 m!32531))

(declare-fun m!32533 () Bool)

(assert (=> b!23130 m!32533))

(declare-fun m!32535 () Bool)

(assert (=> b!23131 m!32535))

(assert (=> b!23131 m!32535))

(declare-fun m!32537 () Bool)

(assert (=> b!23131 m!32537))

(declare-fun m!32539 () Bool)

(assert (=> b!23131 m!32539))

(assert (=> b!23131 m!32539))

(declare-fun m!32541 () Bool)

(assert (=> b!23131 m!32541))

(declare-fun m!32543 () Bool)

(assert (=> b!23126 m!32543))

(push 1)

