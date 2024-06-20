; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5122 () Bool)

(assert start!5122)

(declare-fun res!17732 () Bool)

(declare-fun e!13689 () Bool)

(assert (=> start!5122 (=> (not res!17732) (not e!13689))))

(declare-datatypes ((array!1457 0))(
  ( (array!1458 (arr!1063 (Array (_ BitVec 32) (_ BitVec 8))) (size!619 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1457)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5122 (= res!17732 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!619 srcBuffer!2))))))))

(assert (=> start!5122 e!13689))

(assert (=> start!5122 true))

(declare-fun array_inv!589 (array!1457) Bool)

(assert (=> start!5122 (array_inv!589 srcBuffer!2)))

(declare-datatypes ((BitStream!1072 0))(
  ( (BitStream!1073 (buf!928 array!1457) (currentByte!2217 (_ BitVec 32)) (currentBit!2212 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1072)

(declare-fun e!13683 () Bool)

(declare-fun inv!12 (BitStream!1072) Bool)

(assert (=> start!5122 (and (inv!12 thiss!1379) e!13683)))

(declare-fun b!20412 () Bool)

(declare-fun e!13688 () Bool)

(assert (=> b!20412 (= e!13688 true)))

(declare-fun e!13684 () Bool)

(assert (=> b!20412 e!13684))

(declare-fun res!17731 () Bool)

(assert (=> b!20412 (=> (not res!17731) (not e!13684))))

(declare-datatypes ((Unit!1791 0))(
  ( (Unit!1792) )
))
(declare-datatypes ((tuple2!2384 0))(
  ( (tuple2!2385 (_1!1277 Unit!1791) (_2!1277 BitStream!1072)) )
))
(declare-fun lt!29117 () tuple2!2384)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20412 (= res!17731 (validate_offset_bits!1 ((_ sign_extend 32) (size!619 (buf!928 (_2!1277 lt!29117)))) ((_ sign_extend 32) (currentByte!2217 thiss!1379)) ((_ sign_extend 32) (currentBit!2212 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29115 () Unit!1791)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1072 array!1457 (_ BitVec 64)) Unit!1791)

(assert (=> b!20412 (= lt!29115 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!928 (_2!1277 lt!29117)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2386 0))(
  ( (tuple2!2387 (_1!1278 BitStream!1072) (_2!1278 BitStream!1072)) )
))
(declare-fun lt!29119 () tuple2!2386)

(declare-fun reader!0 (BitStream!1072 BitStream!1072) tuple2!2386)

(assert (=> b!20412 (= lt!29119 (reader!0 thiss!1379 (_2!1277 lt!29117)))))

(declare-fun b!20413 () Bool)

(declare-datatypes ((List!237 0))(
  ( (Nil!234) (Cons!233 (h!352 Bool) (t!987 List!237)) )
))
(declare-fun head!74 (List!237) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1072 array!1457 (_ BitVec 64) (_ BitVec 64)) List!237)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1072 BitStream!1072 (_ BitVec 64)) List!237)

(assert (=> b!20413 (= e!13684 (= (head!74 (byteArrayBitContentToList!0 (_2!1277 lt!29117) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!74 (bitStreamReadBitsIntoList!0 (_2!1277 lt!29117) (_1!1278 lt!29119) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20414 () Bool)

(declare-fun e!13686 () Bool)

(assert (=> b!20414 (= e!13689 (not e!13686))))

(declare-fun res!17733 () Bool)

(assert (=> b!20414 (=> res!17733 e!13686)))

(assert (=> b!20414 (= res!17733 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1072 BitStream!1072) Bool)

(assert (=> b!20414 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29116 () Unit!1791)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1072) Unit!1791)

(assert (=> b!20414 (= lt!29116 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29114 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20414 (= lt!29114 (bitIndex!0 (size!619 (buf!928 thiss!1379)) (currentByte!2217 thiss!1379) (currentBit!2212 thiss!1379)))))

(declare-fun b!20415 () Bool)

(declare-fun res!17735 () Bool)

(assert (=> b!20415 (=> (not res!17735) (not e!13689))))

(assert (=> b!20415 (= res!17735 (validate_offset_bits!1 ((_ sign_extend 32) (size!619 (buf!928 thiss!1379))) ((_ sign_extend 32) (currentByte!2217 thiss!1379)) ((_ sign_extend 32) (currentBit!2212 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!20416 () Bool)

(assert (=> b!20416 (= e!13683 (array_inv!589 (buf!928 thiss!1379)))))

(declare-fun b!20417 () Bool)

(assert (=> b!20417 (= e!13686 e!13688)))

(declare-fun res!17734 () Bool)

(assert (=> b!20417 (=> res!17734 e!13688)))

(assert (=> b!20417 (= res!17734 (not (isPrefixOf!0 thiss!1379 (_2!1277 lt!29117))))))

(assert (=> b!20417 (validate_offset_bits!1 ((_ sign_extend 32) (size!619 (buf!928 (_2!1277 lt!29117)))) ((_ sign_extend 32) (currentByte!2217 (_2!1277 lt!29117))) ((_ sign_extend 32) (currentBit!2212 (_2!1277 lt!29117))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29118 () Unit!1791)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1072 BitStream!1072 (_ BitVec 64) (_ BitVec 64)) Unit!1791)

(assert (=> b!20417 (= lt!29118 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1277 lt!29117) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1072 (_ BitVec 8) (_ BitVec 32)) tuple2!2384)

(assert (=> b!20417 (= lt!29117 (appendBitFromByte!0 thiss!1379 (select (arr!1063 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!5122 res!17732) b!20415))

(assert (= (and b!20415 res!17735) b!20414))

(assert (= (and b!20414 (not res!17733)) b!20417))

(assert (= (and b!20417 (not res!17734)) b!20412))

(assert (= (and b!20412 res!17731) b!20413))

(assert (= start!5122 b!20416))

(declare-fun m!27663 () Bool)

(assert (=> b!20414 m!27663))

(declare-fun m!27665 () Bool)

(assert (=> b!20414 m!27665))

(declare-fun m!27667 () Bool)

(assert (=> b!20414 m!27667))

(declare-fun m!27669 () Bool)

(assert (=> b!20413 m!27669))

(assert (=> b!20413 m!27669))

(declare-fun m!27671 () Bool)

(assert (=> b!20413 m!27671))

(declare-fun m!27673 () Bool)

(assert (=> b!20413 m!27673))

(assert (=> b!20413 m!27673))

(declare-fun m!27675 () Bool)

(assert (=> b!20413 m!27675))

(declare-fun m!27677 () Bool)

(assert (=> b!20415 m!27677))

(declare-fun m!27679 () Bool)

(assert (=> b!20417 m!27679))

(declare-fun m!27681 () Bool)

(assert (=> b!20417 m!27681))

(declare-fun m!27683 () Bool)

(assert (=> b!20417 m!27683))

(assert (=> b!20417 m!27679))

(declare-fun m!27685 () Bool)

(assert (=> b!20417 m!27685))

(declare-fun m!27687 () Bool)

(assert (=> b!20417 m!27687))

(declare-fun m!27689 () Bool)

(assert (=> start!5122 m!27689))

(declare-fun m!27691 () Bool)

(assert (=> start!5122 m!27691))

(declare-fun m!27693 () Bool)

(assert (=> b!20416 m!27693))

(declare-fun m!27695 () Bool)

(assert (=> b!20412 m!27695))

(declare-fun m!27697 () Bool)

(assert (=> b!20412 m!27697))

(declare-fun m!27699 () Bool)

(assert (=> b!20412 m!27699))

(push 1)

(assert (not b!20412))

(assert (not b!20414))

(assert (not b!20417))

(assert (not b!20415))

(assert (not b!20413))

(assert (not b!20416))

(assert (not start!5122))

(check-sat)

