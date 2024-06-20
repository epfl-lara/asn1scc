; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5638 () Bool)

(assert start!5638)

(declare-fun b!23034 () Bool)

(declare-fun e!15550 () Bool)

(declare-fun e!15554 () Bool)

(assert (=> b!23034 (= e!15550 e!15554)))

(declare-fun res!19797 () Bool)

(assert (=> b!23034 (=> res!19797 e!15554)))

(declare-datatypes ((array!1561 0))(
  ( (array!1562 (arr!1122 (Array (_ BitVec 32) (_ BitVec 8))) (size!666 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1164 0))(
  ( (BitStream!1165 (buf!987 array!1561) (currentByte!2300 (_ BitVec 32)) (currentBit!2295 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1975 0))(
  ( (Unit!1976) )
))
(declare-datatypes ((tuple2!2646 0))(
  ( (tuple2!2647 (_1!1410 Unit!1975) (_2!1410 BitStream!1164)) )
))
(declare-fun lt!33679 () tuple2!2646)

(declare-fun lt!33683 () tuple2!2646)

(assert (=> b!23034 (= res!19797 (not (= (size!666 (buf!987 (_2!1410 lt!33679))) (size!666 (buf!987 (_2!1410 lt!33683))))))))

(declare-fun e!15551 () Bool)

(assert (=> b!23034 e!15551))

(declare-fun res!19795 () Bool)

(assert (=> b!23034 (=> (not res!19795) (not e!15551))))

(declare-fun thiss!1379 () BitStream!1164)

(assert (=> b!23034 (= res!19795 (= (size!666 (buf!987 (_2!1410 lt!33683))) (size!666 (buf!987 thiss!1379))))))

(declare-fun b!23035 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!2648 0))(
  ( (tuple2!2649 (_1!1411 BitStream!1164) (_2!1411 BitStream!1164)) )
))
(declare-fun lt!33686 () tuple2!2648)

(declare-fun e!15553 () Bool)

(declare-fun srcBuffer!2 () array!1561)

(declare-datatypes ((List!283 0))(
  ( (Nil!280) (Cons!279 (h!398 Bool) (t!1033 List!283)) )
))
(declare-fun head!120 (List!283) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1164 array!1561 (_ BitVec 64) (_ BitVec 64)) List!283)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1164 BitStream!1164 (_ BitVec 64)) List!283)

(assert (=> b!23035 (= e!15553 (= (head!120 (byteArrayBitContentToList!0 (_2!1410 lt!33679) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!120 (bitStreamReadBitsIntoList!0 (_2!1410 lt!33679) (_1!1411 lt!33686) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!23036 () Bool)

(declare-fun res!19789 () Bool)

(assert (=> b!23036 (=> res!19789 e!15554)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23036 (= res!19789 (not (invariant!0 (currentBit!2295 (_2!1410 lt!33679)) (currentByte!2300 (_2!1410 lt!33679)) (size!666 (buf!987 (_2!1410 lt!33679))))))))

(declare-fun b!23037 () Bool)

(declare-fun e!15552 () Bool)

(declare-fun e!15549 () Bool)

(assert (=> b!23037 (= e!15552 e!15549)))

(declare-fun res!19794 () Bool)

(assert (=> b!23037 (=> res!19794 e!15549)))

(declare-fun isPrefixOf!0 (BitStream!1164 BitStream!1164) Bool)

(assert (=> b!23037 (= res!19794 (not (isPrefixOf!0 thiss!1379 (_2!1410 lt!33679))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23037 (validate_offset_bits!1 ((_ sign_extend 32) (size!666 (buf!987 (_2!1410 lt!33679)))) ((_ sign_extend 32) (currentByte!2300 (_2!1410 lt!33679))) ((_ sign_extend 32) (currentBit!2295 (_2!1410 lt!33679))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33687 () Unit!1975)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1164 BitStream!1164 (_ BitVec 64) (_ BitVec 64)) Unit!1975)

(assert (=> b!23037 (= lt!33687 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1410 lt!33679) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1164 (_ BitVec 8) (_ BitVec 32)) tuple2!2646)

(assert (=> b!23037 (= lt!33679 (appendBitFromByte!0 thiss!1379 (select (arr!1122 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!23038 () Bool)

(declare-fun e!15556 () Bool)

(assert (=> b!23038 (= e!15549 e!15556)))

(declare-fun res!19791 () Bool)

(assert (=> b!23038 (=> res!19791 e!15556)))

(assert (=> b!23038 (= res!19791 (not (isPrefixOf!0 (_2!1410 lt!33679) (_2!1410 lt!33683))))))

(assert (=> b!23038 (isPrefixOf!0 thiss!1379 (_2!1410 lt!33683))))

(declare-fun lt!33688 () Unit!1975)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1164 BitStream!1164 BitStream!1164) Unit!1975)

(assert (=> b!23038 (= lt!33688 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1410 lt!33679) (_2!1410 lt!33683)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1164 array!1561 (_ BitVec 64) (_ BitVec 64)) tuple2!2646)

(assert (=> b!23038 (= lt!33683 (appendBitsMSBFirstLoop!0 (_2!1410 lt!33679) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!23038 e!15553))

(declare-fun res!19787 () Bool)

(assert (=> b!23038 (=> (not res!19787) (not e!15553))))

(assert (=> b!23038 (= res!19787 (validate_offset_bits!1 ((_ sign_extend 32) (size!666 (buf!987 (_2!1410 lt!33679)))) ((_ sign_extend 32) (currentByte!2300 thiss!1379)) ((_ sign_extend 32) (currentBit!2295 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33685 () Unit!1975)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1164 array!1561 (_ BitVec 64)) Unit!1975)

(assert (=> b!23038 (= lt!33685 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!987 (_2!1410 lt!33679)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1164 BitStream!1164) tuple2!2648)

(assert (=> b!23038 (= lt!33686 (reader!0 thiss!1379 (_2!1410 lt!33679)))))

(declare-fun b!23039 () Bool)

(declare-fun res!19792 () Bool)

(assert (=> b!23039 (=> res!19792 e!15550)))

(assert (=> b!23039 (= res!19792 (not (= (size!666 (buf!987 thiss!1379)) (size!666 (buf!987 (_2!1410 lt!33683))))))))

(declare-fun b!23040 () Bool)

(declare-fun res!19786 () Bool)

(declare-fun e!15559 () Bool)

(assert (=> b!23040 (=> (not res!19786) (not e!15559))))

(assert (=> b!23040 (= res!19786 (validate_offset_bits!1 ((_ sign_extend 32) (size!666 (buf!987 thiss!1379))) ((_ sign_extend 32) (currentByte!2300 thiss!1379)) ((_ sign_extend 32) (currentBit!2295 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun lt!33684 () (_ BitVec 64))

(declare-fun b!23041 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23041 (= e!15551 (= lt!33684 (bvsub (bvsub (bvadd (bitIndex!0 (size!666 (buf!987 (_2!1410 lt!33679))) (currentByte!2300 (_2!1410 lt!33679)) (currentBit!2295 (_2!1410 lt!33679))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!23042 () Bool)

(assert (=> b!23042 (= e!15554 true)))

(declare-fun lt!33682 () tuple2!2648)

(assert (=> b!23042 (= lt!33682 (reader!0 thiss!1379 (_2!1410 lt!33683)))))

(declare-fun b!23043 () Bool)

(assert (=> b!23043 (= e!15556 e!15550)))

(declare-fun res!19793 () Bool)

(assert (=> b!23043 (=> res!19793 e!15550)))

(declare-fun lt!33680 () (_ BitVec 64))

(assert (=> b!23043 (= res!19793 (not (= lt!33684 (bvsub (bvadd lt!33680 to!314) i!635))))))

(assert (=> b!23043 (= lt!33684 (bitIndex!0 (size!666 (buf!987 (_2!1410 lt!33683))) (currentByte!2300 (_2!1410 lt!33683)) (currentBit!2295 (_2!1410 lt!33683))))))

(declare-fun res!19790 () Bool)

(assert (=> start!5638 (=> (not res!19790) (not e!15559))))

(assert (=> start!5638 (= res!19790 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!666 srcBuffer!2))))))))

(assert (=> start!5638 e!15559))

(assert (=> start!5638 true))

(declare-fun array_inv!635 (array!1561) Bool)

(assert (=> start!5638 (array_inv!635 srcBuffer!2)))

(declare-fun e!15558 () Bool)

(declare-fun inv!12 (BitStream!1164) Bool)

(assert (=> start!5638 (and (inv!12 thiss!1379) e!15558)))

(declare-fun b!23044 () Bool)

(assert (=> b!23044 (= e!15559 (not e!15552))))

(declare-fun res!19788 () Bool)

(assert (=> b!23044 (=> res!19788 e!15552)))

(assert (=> b!23044 (= res!19788 (bvsge i!635 to!314))))

(assert (=> b!23044 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!33681 () Unit!1975)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1164) Unit!1975)

(assert (=> b!23044 (= lt!33681 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!23044 (= lt!33680 (bitIndex!0 (size!666 (buf!987 thiss!1379)) (currentByte!2300 thiss!1379) (currentBit!2295 thiss!1379)))))

(declare-fun b!23045 () Bool)

(declare-fun res!19785 () Bool)

(assert (=> b!23045 (=> res!19785 e!15550)))

(assert (=> b!23045 (= res!19785 (not (invariant!0 (currentBit!2295 (_2!1410 lt!33683)) (currentByte!2300 (_2!1410 lt!33683)) (size!666 (buf!987 (_2!1410 lt!33683))))))))

(declare-fun b!23046 () Bool)

(declare-fun res!19796 () Bool)

(assert (=> b!23046 (=> res!19796 e!15554)))

(assert (=> b!23046 (= res!19796 (not (invariant!0 (currentBit!2295 (_2!1410 lt!33679)) (currentByte!2300 (_2!1410 lt!33679)) (size!666 (buf!987 (_2!1410 lt!33683))))))))

(declare-fun b!23047 () Bool)

(assert (=> b!23047 (= e!15558 (array_inv!635 (buf!987 thiss!1379)))))

(assert (= (and start!5638 res!19790) b!23040))

(assert (= (and b!23040 res!19786) b!23044))

(assert (= (and b!23044 (not res!19788)) b!23037))

(assert (= (and b!23037 (not res!19794)) b!23038))

(assert (= (and b!23038 res!19787) b!23035))

(assert (= (and b!23038 (not res!19791)) b!23043))

(assert (= (and b!23043 (not res!19793)) b!23045))

(assert (= (and b!23045 (not res!19785)) b!23039))

(assert (= (and b!23039 (not res!19792)) b!23034))

(assert (= (and b!23034 res!19795) b!23041))

(assert (= (and b!23034 (not res!19797)) b!23036))

(assert (= (and b!23036 (not res!19789)) b!23046))

(assert (= (and b!23046 (not res!19796)) b!23042))

(assert (= start!5638 b!23047))

(declare-fun m!32371 () Bool)

(assert (=> b!23046 m!32371))

(declare-fun m!32373 () Bool)

(assert (=> b!23036 m!32373))

(declare-fun m!32375 () Bool)

(assert (=> b!23044 m!32375))

(declare-fun m!32377 () Bool)

(assert (=> b!23044 m!32377))

(declare-fun m!32379 () Bool)

(assert (=> b!23044 m!32379))

(declare-fun m!32381 () Bool)

(assert (=> b!23035 m!32381))

(assert (=> b!23035 m!32381))

(declare-fun m!32383 () Bool)

(assert (=> b!23035 m!32383))

(declare-fun m!32385 () Bool)

(assert (=> b!23035 m!32385))

(assert (=> b!23035 m!32385))

(declare-fun m!32387 () Bool)

(assert (=> b!23035 m!32387))

(declare-fun m!32389 () Bool)

(assert (=> start!5638 m!32389))

(declare-fun m!32391 () Bool)

(assert (=> start!5638 m!32391))

(declare-fun m!32393 () Bool)

(assert (=> b!23040 m!32393))

(declare-fun m!32395 () Bool)

(assert (=> b!23047 m!32395))

(declare-fun m!32397 () Bool)

(assert (=> b!23045 m!32397))

(declare-fun m!32399 () Bool)

(assert (=> b!23037 m!32399))

(declare-fun m!32401 () Bool)

(assert (=> b!23037 m!32401))

(declare-fun m!32403 () Bool)

(assert (=> b!23037 m!32403))

(declare-fun m!32405 () Bool)

(assert (=> b!23037 m!32405))

(assert (=> b!23037 m!32399))

(declare-fun m!32407 () Bool)

(assert (=> b!23037 m!32407))

(declare-fun m!32409 () Bool)

(assert (=> b!23042 m!32409))

(declare-fun m!32411 () Bool)

(assert (=> b!23043 m!32411))

(declare-fun m!32413 () Bool)

(assert (=> b!23041 m!32413))

(declare-fun m!32415 () Bool)

(assert (=> b!23038 m!32415))

(declare-fun m!32417 () Bool)

(assert (=> b!23038 m!32417))

(declare-fun m!32419 () Bool)

(assert (=> b!23038 m!32419))

(declare-fun m!32421 () Bool)

(assert (=> b!23038 m!32421))

(declare-fun m!32423 () Bool)

(assert (=> b!23038 m!32423))

(declare-fun m!32425 () Bool)

(assert (=> b!23038 m!32425))

(declare-fun m!32427 () Bool)

(assert (=> b!23038 m!32427))

(check-sat (not b!23038) (not start!5638) (not b!23037) (not b!23047) (not b!23036) (not b!23040) (not b!23035) (not b!23046) (not b!23041) (not b!23044) (not b!23043) (not b!23042) (not b!23045))
