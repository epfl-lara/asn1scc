; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5840 () Bool)

(assert start!5840)

(declare-fun b!25629 () Bool)

(declare-fun e!17488 () Bool)

(declare-fun e!17482 () Bool)

(assert (=> b!25629 (= e!17488 e!17482)))

(declare-fun res!22121 () Bool)

(assert (=> b!25629 (=> res!22121 e!17482)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!36722 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!36724 () (_ BitVec 64))

(assert (=> b!25629 (= res!22121 (not (= lt!36724 (bvsub (bvadd lt!36722 to!314) i!635))))))

(declare-datatypes ((array!1670 0))(
  ( (array!1671 (arr!1178 (Array (_ BitVec 32) (_ BitVec 8))) (size!719 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1270 0))(
  ( (BitStream!1271 (buf!1043 array!1670) (currentByte!2362 (_ BitVec 32)) (currentBit!2357 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2111 0))(
  ( (Unit!2112) )
))
(declare-datatypes ((tuple2!2882 0))(
  ( (tuple2!2883 (_1!1528 Unit!2111) (_2!1528 BitStream!1270)) )
))
(declare-fun lt!36721 () tuple2!2882)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!25629 (= lt!36724 (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!36721))) (currentByte!2362 (_2!1528 lt!36721)) (currentBit!2357 (_2!1528 lt!36721))))))

(declare-fun res!22116 () Bool)

(declare-fun e!17479 () Bool)

(assert (=> start!5840 (=> (not res!22116) (not e!17479))))

(declare-fun srcBuffer!2 () array!1670)

(assert (=> start!5840 (= res!22116 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!719 srcBuffer!2))))))))

(assert (=> start!5840 e!17479))

(assert (=> start!5840 true))

(declare-fun array_inv!688 (array!1670) Bool)

(assert (=> start!5840 (array_inv!688 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!1270)

(declare-fun e!17478 () Bool)

(declare-fun inv!12 (BitStream!1270) Bool)

(assert (=> start!5840 (and (inv!12 thiss!1379) e!17478)))

(declare-fun b!25630 () Bool)

(declare-fun e!17484 () Bool)

(assert (=> b!25630 (= e!17482 e!17484)))

(declare-fun res!22118 () Bool)

(assert (=> b!25630 (=> res!22118 e!17484)))

(declare-fun lt!36717 () tuple2!2882)

(assert (=> b!25630 (= res!22118 (not (= (size!719 (buf!1043 (_2!1528 lt!36717))) (size!719 (buf!1043 (_2!1528 lt!36721))))))))

(declare-fun e!17485 () Bool)

(assert (=> b!25630 e!17485))

(declare-fun res!22123 () Bool)

(assert (=> b!25630 (=> (not res!22123) (not e!17485))))

(assert (=> b!25630 (= res!22123 (= (size!719 (buf!1043 (_2!1528 lt!36721))) (size!719 (buf!1043 thiss!1379))))))

(declare-fun b!25631 () Bool)

(declare-fun e!17486 () Bool)

(assert (=> b!25631 (= e!17486 e!17488)))

(declare-fun res!22127 () Bool)

(assert (=> b!25631 (=> res!22127 e!17488)))

(declare-fun isPrefixOf!0 (BitStream!1270 BitStream!1270) Bool)

(assert (=> b!25631 (= res!22127 (not (isPrefixOf!0 (_2!1528 lt!36717) (_2!1528 lt!36721))))))

(assert (=> b!25631 (isPrefixOf!0 thiss!1379 (_2!1528 lt!36721))))

(declare-fun lt!36720 () Unit!2111)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1270 BitStream!1270 BitStream!1270) Unit!2111)

(assert (=> b!25631 (= lt!36720 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1528 lt!36717) (_2!1528 lt!36721)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1270 array!1670 (_ BitVec 64) (_ BitVec 64)) tuple2!2882)

(assert (=> b!25631 (= lt!36721 (appendBitsMSBFirstLoop!0 (_2!1528 lt!36717) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!17480 () Bool)

(assert (=> b!25631 e!17480))

(declare-fun res!22120 () Bool)

(assert (=> b!25631 (=> (not res!22120) (not e!17480))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!25631 (= res!22120 (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36717)))) ((_ sign_extend 32) (currentByte!2362 thiss!1379)) ((_ sign_extend 32) (currentBit!2357 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!36718 () Unit!2111)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1270 array!1670 (_ BitVec 64)) Unit!2111)

(assert (=> b!25631 (= lt!36718 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1043 (_2!1528 lt!36717)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2884 0))(
  ( (tuple2!2885 (_1!1529 BitStream!1270) (_2!1529 BitStream!1270)) )
))
(declare-fun lt!36711 () tuple2!2884)

(declare-fun reader!0 (BitStream!1270 BitStream!1270) tuple2!2884)

(assert (=> b!25631 (= lt!36711 (reader!0 thiss!1379 (_2!1528 lt!36717)))))

(declare-fun b!25632 () Bool)

(assert (=> b!25632 (= e!17478 (array_inv!688 (buf!1043 thiss!1379)))))

(declare-fun b!25633 () Bool)

(assert (=> b!25633 (= e!17485 (= lt!36724 (bvsub (bvsub (bvadd (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!36717))) (currentByte!2362 (_2!1528 lt!36717)) (currentBit!2357 (_2!1528 lt!36717))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!25634 () Bool)

(declare-fun res!22126 () Bool)

(assert (=> b!25634 (=> (not res!22126) (not e!17479))))

(assert (=> b!25634 (= res!22126 (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 thiss!1379))) ((_ sign_extend 32) (currentByte!2362 thiss!1379)) ((_ sign_extend 32) (currentBit!2357 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!25635 () Bool)

(declare-fun res!22125 () Bool)

(assert (=> b!25635 (=> res!22125 e!17484)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!25635 (= res!22125 (not (invariant!0 (currentBit!2357 (_2!1528 lt!36717)) (currentByte!2362 (_2!1528 lt!36717)) (size!719 (buf!1043 (_2!1528 lt!36721))))))))

(declare-fun b!25636 () Bool)

(declare-fun e!17483 () Bool)

(assert (=> b!25636 (= e!17483 e!17486)))

(declare-fun res!22117 () Bool)

(assert (=> b!25636 (=> res!22117 e!17486)))

(assert (=> b!25636 (= res!22117 (not (isPrefixOf!0 thiss!1379 (_2!1528 lt!36717))))))

(declare-fun lt!36714 () (_ BitVec 64))

(assert (=> b!25636 (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36717)))) ((_ sign_extend 32) (currentByte!2362 (_2!1528 lt!36717))) ((_ sign_extend 32) (currentBit!2357 (_2!1528 lt!36717))) lt!36714)))

(assert (=> b!25636 (= lt!36714 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!36715 () Unit!2111)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1270 BitStream!1270 (_ BitVec 64) (_ BitVec 64)) Unit!2111)

(assert (=> b!25636 (= lt!36715 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1528 lt!36717) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1270 (_ BitVec 8) (_ BitVec 32)) tuple2!2882)

(assert (=> b!25636 (= lt!36717 (appendBitFromByte!0 thiss!1379 (select (arr!1178 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!25637 () Bool)

(declare-datatypes ((List!336 0))(
  ( (Nil!333) (Cons!332 (h!451 Bool) (t!1086 List!336)) )
))
(declare-fun head!173 (List!336) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1270 array!1670 (_ BitVec 64) (_ BitVec 64)) List!336)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1270 BitStream!1270 (_ BitVec 64)) List!336)

(assert (=> b!25637 (= e!17480 (= (head!173 (byteArrayBitContentToList!0 (_2!1528 lt!36717) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!173 (bitStreamReadBitsIntoList!0 (_2!1528 lt!36717) (_1!1529 lt!36711) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!25638 () Bool)

(declare-fun res!22128 () Bool)

(assert (=> b!25638 (=> res!22128 e!17482)))

(assert (=> b!25638 (= res!22128 (not (invariant!0 (currentBit!2357 (_2!1528 lt!36721)) (currentByte!2362 (_2!1528 lt!36721)) (size!719 (buf!1043 (_2!1528 lt!36721))))))))

(declare-fun b!25639 () Bool)

(assert (=> b!25639 (= e!17479 (not e!17483))))

(declare-fun res!22124 () Bool)

(assert (=> b!25639 (=> res!22124 e!17483)))

(assert (=> b!25639 (= res!22124 (bvsge i!635 to!314))))

(assert (=> b!25639 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!36719 () Unit!2111)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1270) Unit!2111)

(assert (=> b!25639 (= lt!36719 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!25639 (= lt!36722 (bitIndex!0 (size!719 (buf!1043 thiss!1379)) (currentByte!2362 thiss!1379) (currentBit!2357 thiss!1379)))))

(declare-fun b!25640 () Bool)

(declare-fun res!22122 () Bool)

(assert (=> b!25640 (=> res!22122 e!17484)))

(assert (=> b!25640 (= res!22122 (not (invariant!0 (currentBit!2357 (_2!1528 lt!36717)) (currentByte!2362 (_2!1528 lt!36717)) (size!719 (buf!1043 (_2!1528 lt!36717))))))))

(declare-fun b!25641 () Bool)

(declare-fun res!22119 () Bool)

(assert (=> b!25641 (=> res!22119 e!17482)))

(assert (=> b!25641 (= res!22119 (not (= (size!719 (buf!1043 thiss!1379)) (size!719 (buf!1043 (_2!1528 lt!36721))))))))

(declare-fun b!25642 () Bool)

(declare-fun lt!36723 () tuple2!2884)

(assert (=> b!25642 (= e!17484 (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 (_1!1529 lt!36723)))) ((_ sign_extend 32) (currentByte!2362 (_1!1529 lt!36723))) ((_ sign_extend 32) (currentBit!2357 (_1!1529 lt!36723))) lt!36714))))

(declare-fun lt!36716 () List!336)

(declare-fun lt!36712 () tuple2!2884)

(assert (=> b!25642 (= lt!36716 (bitStreamReadBitsIntoList!0 (_2!1528 lt!36721) (_1!1529 lt!36712) (bvsub to!314 i!635)))))

(assert (=> b!25642 (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36721)))) ((_ sign_extend 32) (currentByte!2362 (_2!1528 lt!36717))) ((_ sign_extend 32) (currentBit!2357 (_2!1528 lt!36717))) lt!36714)))

(declare-fun lt!36710 () Unit!2111)

(assert (=> b!25642 (= lt!36710 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1528 lt!36717) (buf!1043 (_2!1528 lt!36721)) lt!36714))))

(assert (=> b!25642 (= lt!36723 (reader!0 (_2!1528 lt!36717) (_2!1528 lt!36721)))))

(assert (=> b!25642 (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36721)))) ((_ sign_extend 32) (currentByte!2362 thiss!1379)) ((_ sign_extend 32) (currentBit!2357 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!36713 () Unit!2111)

(assert (=> b!25642 (= lt!36713 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1043 (_2!1528 lt!36721)) (bvsub to!314 i!635)))))

(assert (=> b!25642 (= lt!36712 (reader!0 thiss!1379 (_2!1528 lt!36721)))))

(assert (= (and start!5840 res!22116) b!25634))

(assert (= (and b!25634 res!22126) b!25639))

(assert (= (and b!25639 (not res!22124)) b!25636))

(assert (= (and b!25636 (not res!22117)) b!25631))

(assert (= (and b!25631 res!22120) b!25637))

(assert (= (and b!25631 (not res!22127)) b!25629))

(assert (= (and b!25629 (not res!22121)) b!25638))

(assert (= (and b!25638 (not res!22128)) b!25641))

(assert (= (and b!25641 (not res!22119)) b!25630))

(assert (= (and b!25630 res!22123) b!25633))

(assert (= (and b!25630 (not res!22118)) b!25640))

(assert (= (and b!25640 (not res!22122)) b!25635))

(assert (= (and b!25635 (not res!22125)) b!25642))

(assert (= start!5840 b!25632))

(declare-fun m!36561 () Bool)

(assert (=> b!25636 m!36561))

(declare-fun m!36563 () Bool)

(assert (=> b!25636 m!36563))

(declare-fun m!36565 () Bool)

(assert (=> b!25636 m!36565))

(declare-fun m!36567 () Bool)

(assert (=> b!25636 m!36567))

(assert (=> b!25636 m!36563))

(declare-fun m!36569 () Bool)

(assert (=> b!25636 m!36569))

(declare-fun m!36571 () Bool)

(assert (=> b!25638 m!36571))

(declare-fun m!36573 () Bool)

(assert (=> b!25629 m!36573))

(declare-fun m!36575 () Bool)

(assert (=> b!25635 m!36575))

(declare-fun m!36577 () Bool)

(assert (=> b!25633 m!36577))

(declare-fun m!36579 () Bool)

(assert (=> start!5840 m!36579))

(declare-fun m!36581 () Bool)

(assert (=> start!5840 m!36581))

(declare-fun m!36583 () Bool)

(assert (=> b!25637 m!36583))

(assert (=> b!25637 m!36583))

(declare-fun m!36585 () Bool)

(assert (=> b!25637 m!36585))

(declare-fun m!36587 () Bool)

(assert (=> b!25637 m!36587))

(assert (=> b!25637 m!36587))

(declare-fun m!36589 () Bool)

(assert (=> b!25637 m!36589))

(declare-fun m!36591 () Bool)

(assert (=> b!25642 m!36591))

(declare-fun m!36593 () Bool)

(assert (=> b!25642 m!36593))

(declare-fun m!36595 () Bool)

(assert (=> b!25642 m!36595))

(declare-fun m!36597 () Bool)

(assert (=> b!25642 m!36597))

(declare-fun m!36599 () Bool)

(assert (=> b!25642 m!36599))

(declare-fun m!36601 () Bool)

(assert (=> b!25642 m!36601))

(declare-fun m!36603 () Bool)

(assert (=> b!25642 m!36603))

(declare-fun m!36605 () Bool)

(assert (=> b!25642 m!36605))

(declare-fun m!36607 () Bool)

(assert (=> b!25634 m!36607))

(declare-fun m!36609 () Bool)

(assert (=> b!25632 m!36609))

(declare-fun m!36611 () Bool)

(assert (=> b!25639 m!36611))

(declare-fun m!36613 () Bool)

(assert (=> b!25639 m!36613))

(declare-fun m!36615 () Bool)

(assert (=> b!25639 m!36615))

(declare-fun m!36617 () Bool)

(assert (=> b!25631 m!36617))

(declare-fun m!36619 () Bool)

(assert (=> b!25631 m!36619))

(declare-fun m!36621 () Bool)

(assert (=> b!25631 m!36621))

(declare-fun m!36623 () Bool)

(assert (=> b!25631 m!36623))

(declare-fun m!36625 () Bool)

(assert (=> b!25631 m!36625))

(declare-fun m!36627 () Bool)

(assert (=> b!25631 m!36627))

(declare-fun m!36629 () Bool)

(assert (=> b!25631 m!36629))

(declare-fun m!36631 () Bool)

(assert (=> b!25640 m!36631))

(push 1)

(assert (not b!25642))

(assert (not b!25637))

(assert (not b!25638))

(assert (not b!25636))

(assert (not b!25631))

(assert (not start!5840))

(assert (not b!25639))

(assert (not b!25629))

(assert (not b!25633))

(assert (not b!25635))

(assert (not b!25640))

(assert (not b!25632))

(assert (not b!25634))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7708 () Bool)

(declare-fun e!17606 () Bool)

(assert (=> d!7708 e!17606))

(declare-fun res!22276 () Bool)

(assert (=> d!7708 (=> (not res!22276) (not e!17606))))

(declare-fun lt!37018 () (_ BitVec 64))

(declare-fun lt!37023 () (_ BitVec 64))

(declare-fun lt!37021 () (_ BitVec 64))

(assert (=> d!7708 (= res!22276 (= lt!37018 (bvsub lt!37023 lt!37021)))))

(assert (=> d!7708 (or (= (bvand lt!37023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!37021 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!37023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!37023 lt!37021) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!7708 (= lt!37021 (remainingBits!0 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36717)))) ((_ sign_extend 32) (currentByte!2362 (_2!1528 lt!36717))) ((_ sign_extend 32) (currentBit!2357 (_2!1528 lt!36717)))))))

(declare-fun lt!37019 () (_ BitVec 64))

(declare-fun lt!37022 () (_ BitVec 64))

(assert (=> d!7708 (= lt!37023 (bvmul lt!37019 lt!37022))))

(assert (=> d!7708 (or (= lt!37019 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!37022 (bvsdiv (bvmul lt!37019 lt!37022) lt!37019)))))

(assert (=> d!7708 (= lt!37022 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7708 (= lt!37019 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36717)))))))

(assert (=> d!7708 (= lt!37018 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2362 (_2!1528 lt!36717))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2357 (_2!1528 lt!36717)))))))

(assert (=> d!7708 (invariant!0 (currentBit!2357 (_2!1528 lt!36717)) (currentByte!2362 (_2!1528 lt!36717)) (size!719 (buf!1043 (_2!1528 lt!36717))))))

(assert (=> d!7708 (= (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!36717))) (currentByte!2362 (_2!1528 lt!36717)) (currentBit!2357 (_2!1528 lt!36717))) lt!37018)))

(declare-fun b!25828 () Bool)

(declare-fun res!22275 () Bool)

(assert (=> b!25828 (=> (not res!22275) (not e!17606))))

(assert (=> b!25828 (= res!22275 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!37018))))

(declare-fun b!25829 () Bool)

(declare-fun lt!37020 () (_ BitVec 64))

(assert (=> b!25829 (= e!17606 (bvsle lt!37018 (bvmul lt!37020 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!25829 (or (= lt!37020 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!37020 #b0000000000000000000000000000000000000000000000000000000000001000) lt!37020)))))

(assert (=> b!25829 (= lt!37020 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36717)))))))

(assert (= (and d!7708 res!22276) b!25828))

(assert (= (and b!25828 res!22275) b!25829))

(declare-fun m!36929 () Bool)

(assert (=> d!7708 m!36929))

(assert (=> d!7708 m!36631))

(assert (=> b!25633 d!7708))

(declare-fun d!7710 () Bool)

(assert (=> d!7710 (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36721)))) ((_ sign_extend 32) (currentByte!2362 (_2!1528 lt!36717))) ((_ sign_extend 32) (currentBit!2357 (_2!1528 lt!36717))) lt!36714)))

(declare-fun lt!37026 () Unit!2111)

(declare-fun choose!9 (BitStream!1270 array!1670 (_ BitVec 64) BitStream!1270) Unit!2111)

(assert (=> d!7710 (= lt!37026 (choose!9 (_2!1528 lt!36717) (buf!1043 (_2!1528 lt!36721)) lt!36714 (BitStream!1271 (buf!1043 (_2!1528 lt!36721)) (currentByte!2362 (_2!1528 lt!36717)) (currentBit!2357 (_2!1528 lt!36717)))))))

(assert (=> d!7710 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1528 lt!36717) (buf!1043 (_2!1528 lt!36721)) lt!36714) lt!37026)))

(declare-fun bs!2222 () Bool)

(assert (= bs!2222 d!7710))

(assert (=> bs!2222 m!36599))

(declare-fun m!36931 () Bool)

(assert (=> bs!2222 m!36931))

(assert (=> b!25642 d!7710))

(declare-fun d!7712 () Bool)

(assert (=> d!7712 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36721)))) ((_ sign_extend 32) (currentByte!2362 thiss!1379)) ((_ sign_extend 32) (currentBit!2357 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36721)))) ((_ sign_extend 32) (currentByte!2362 thiss!1379)) ((_ sign_extend 32) (currentBit!2357 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2223 () Bool)

(assert (= bs!2223 d!7712))

(declare-fun m!36933 () Bool)

(assert (=> bs!2223 m!36933))

(assert (=> b!25642 d!7712))

(declare-fun d!7714 () Bool)

(assert (=> d!7714 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36721)))) ((_ sign_extend 32) (currentByte!2362 (_2!1528 lt!36717))) ((_ sign_extend 32) (currentBit!2357 (_2!1528 lt!36717))) lt!36714) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36721)))) ((_ sign_extend 32) (currentByte!2362 (_2!1528 lt!36717))) ((_ sign_extend 32) (currentBit!2357 (_2!1528 lt!36717)))) lt!36714))))

(declare-fun bs!2224 () Bool)

(assert (= bs!2224 d!7714))

(declare-fun m!36935 () Bool)

(assert (=> bs!2224 m!36935))

(assert (=> b!25642 d!7714))

(declare-fun d!7716 () Bool)

(assert (=> d!7716 (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36721)))) ((_ sign_extend 32) (currentByte!2362 thiss!1379)) ((_ sign_extend 32) (currentBit!2357 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!37027 () Unit!2111)

(assert (=> d!7716 (= lt!37027 (choose!9 thiss!1379 (buf!1043 (_2!1528 lt!36721)) (bvsub to!314 i!635) (BitStream!1271 (buf!1043 (_2!1528 lt!36721)) (currentByte!2362 thiss!1379) (currentBit!2357 thiss!1379))))))

(assert (=> d!7716 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1043 (_2!1528 lt!36721)) (bvsub to!314 i!635)) lt!37027)))

(declare-fun bs!2225 () Bool)

(assert (= bs!2225 d!7716))

(assert (=> bs!2225 m!36595))

(declare-fun m!36937 () Bool)

(assert (=> bs!2225 m!36937))

(assert (=> b!25642 d!7716))

(declare-fun d!7718 () Bool)

(assert (=> d!7718 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 (_1!1529 lt!36723)))) ((_ sign_extend 32) (currentByte!2362 (_1!1529 lt!36723))) ((_ sign_extend 32) (currentBit!2357 (_1!1529 lt!36723))) lt!36714) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!719 (buf!1043 (_1!1529 lt!36723)))) ((_ sign_extend 32) (currentByte!2362 (_1!1529 lt!36723))) ((_ sign_extend 32) (currentBit!2357 (_1!1529 lt!36723)))) lt!36714))))

(declare-fun bs!2226 () Bool)

(assert (= bs!2226 d!7718))

(declare-fun m!36939 () Bool)

(assert (=> bs!2226 m!36939))

(assert (=> b!25642 d!7718))

(declare-fun d!7720 () Bool)

(declare-fun e!17611 () Bool)

(assert (=> d!7720 e!17611))

(declare-fun c!1741 () Bool)

(assert (=> d!7720 (= c!1741 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!37036 () List!336)

(declare-datatypes ((tuple2!2902 0))(
  ( (tuple2!2903 (_1!1538 List!336) (_2!1538 BitStream!1270)) )
))
(declare-fun e!17612 () tuple2!2902)

(assert (=> d!7720 (= lt!37036 (_1!1538 e!17612))))

(declare-fun c!1740 () Bool)

(assert (=> d!7720 (= c!1740 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7720 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7720 (= (bitStreamReadBitsIntoList!0 (_2!1528 lt!36721) (_1!1529 lt!36712) (bvsub to!314 i!635)) lt!37036)))

(declare-fun b!25840 () Bool)

(declare-fun isEmpty!68 (List!336) Bool)

(assert (=> b!25840 (= e!17611 (isEmpty!68 lt!37036))))

(declare-fun b!25838 () Bool)

(assert (=> b!25838 (= e!17612 (tuple2!2903 Nil!333 (_1!1529 lt!36712)))))

(declare-fun b!25839 () Bool)

(declare-fun lt!37035 () (_ BitVec 64))

(declare-datatypes ((tuple2!2904 0))(
  ( (tuple2!2905 (_1!1539 Bool) (_2!1539 BitStream!1270)) )
))
(declare-fun lt!37034 () tuple2!2904)

(assert (=> b!25839 (= e!17612 (tuple2!2903 (Cons!332 (_1!1539 lt!37034) (bitStreamReadBitsIntoList!0 (_2!1528 lt!36721) (_2!1539 lt!37034) (bvsub (bvsub to!314 i!635) lt!37035))) (_2!1539 lt!37034)))))

(declare-fun readBit!0 (BitStream!1270) tuple2!2904)

(assert (=> b!25839 (= lt!37034 (readBit!0 (_1!1529 lt!36712)))))

(assert (=> b!25839 (= lt!37035 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!25841 () Bool)

(declare-fun length!63 (List!336) Int)

(assert (=> b!25841 (= e!17611 (> (length!63 lt!37036) 0))))

(assert (= (and d!7720 c!1740) b!25838))

(assert (= (and d!7720 (not c!1740)) b!25839))

(assert (= (and d!7720 c!1741) b!25840))

(assert (= (and d!7720 (not c!1741)) b!25841))

(declare-fun m!36941 () Bool)

(assert (=> b!25840 m!36941))

(declare-fun m!36943 () Bool)

(assert (=> b!25839 m!36943))

(declare-fun m!36945 () Bool)

(assert (=> b!25839 m!36945))

(declare-fun m!36947 () Bool)

(assert (=> b!25841 m!36947))

(assert (=> b!25642 d!7720))

(declare-fun b!25852 () Bool)

(declare-fun e!17618 () Unit!2111)

(declare-fun lt!37092 () Unit!2111)

(assert (=> b!25852 (= e!17618 lt!37092)))

(declare-fun lt!37096 () (_ BitVec 64))

(assert (=> b!25852 (= lt!37096 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!37087 () (_ BitVec 64))

(assert (=> b!25852 (= lt!37087 (bitIndex!0 (size!719 (buf!1043 thiss!1379)) (currentByte!2362 thiss!1379) (currentBit!2357 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1670 array!1670 (_ BitVec 64) (_ BitVec 64)) Unit!2111)

(assert (=> b!25852 (= lt!37092 (arrayBitRangesEqSymmetric!0 (buf!1043 thiss!1379) (buf!1043 (_2!1528 lt!36721)) lt!37096 lt!37087))))

(declare-fun arrayBitRangesEq!0 (array!1670 array!1670 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!25852 (arrayBitRangesEq!0 (buf!1043 (_2!1528 lt!36721)) (buf!1043 thiss!1379) lt!37096 lt!37087)))

(declare-fun b!25853 () Bool)

(declare-fun Unit!2128 () Unit!2111)

(assert (=> b!25853 (= e!17618 Unit!2128)))

(declare-fun d!7722 () Bool)

(declare-fun e!17617 () Bool)

(assert (=> d!7722 e!17617))

(declare-fun res!22283 () Bool)

(assert (=> d!7722 (=> (not res!22283) (not e!17617))))

(declare-fun lt!37078 () tuple2!2884)

(assert (=> d!7722 (= res!22283 (isPrefixOf!0 (_1!1529 lt!37078) (_2!1529 lt!37078)))))

(declare-fun lt!37094 () BitStream!1270)

(assert (=> d!7722 (= lt!37078 (tuple2!2885 lt!37094 (_2!1528 lt!36721)))))

(declare-fun lt!37089 () Unit!2111)

(declare-fun lt!37080 () Unit!2111)

(assert (=> d!7722 (= lt!37089 lt!37080)))

(assert (=> d!7722 (isPrefixOf!0 lt!37094 (_2!1528 lt!36721))))

(assert (=> d!7722 (= lt!37080 (lemmaIsPrefixTransitive!0 lt!37094 (_2!1528 lt!36721) (_2!1528 lt!36721)))))

(declare-fun lt!37083 () Unit!2111)

(declare-fun lt!37088 () Unit!2111)

(assert (=> d!7722 (= lt!37083 lt!37088)))

(assert (=> d!7722 (isPrefixOf!0 lt!37094 (_2!1528 lt!36721))))

(assert (=> d!7722 (= lt!37088 (lemmaIsPrefixTransitive!0 lt!37094 thiss!1379 (_2!1528 lt!36721)))))

(declare-fun lt!37084 () Unit!2111)

(assert (=> d!7722 (= lt!37084 e!17618)))

(declare-fun c!1744 () Bool)

(assert (=> d!7722 (= c!1744 (not (= (size!719 (buf!1043 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!37090 () Unit!2111)

(declare-fun lt!37095 () Unit!2111)

(assert (=> d!7722 (= lt!37090 lt!37095)))

(assert (=> d!7722 (isPrefixOf!0 (_2!1528 lt!36721) (_2!1528 lt!36721))))

(assert (=> d!7722 (= lt!37095 (lemmaIsPrefixRefl!0 (_2!1528 lt!36721)))))

(declare-fun lt!37093 () Unit!2111)

(declare-fun lt!37077 () Unit!2111)

(assert (=> d!7722 (= lt!37093 lt!37077)))

(assert (=> d!7722 (= lt!37077 (lemmaIsPrefixRefl!0 (_2!1528 lt!36721)))))

(declare-fun lt!37086 () Unit!2111)

(declare-fun lt!37082 () Unit!2111)

(assert (=> d!7722 (= lt!37086 lt!37082)))

(assert (=> d!7722 (isPrefixOf!0 lt!37094 lt!37094)))

(assert (=> d!7722 (= lt!37082 (lemmaIsPrefixRefl!0 lt!37094))))

(declare-fun lt!37079 () Unit!2111)

(declare-fun lt!37085 () Unit!2111)

(assert (=> d!7722 (= lt!37079 lt!37085)))

(assert (=> d!7722 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!7722 (= lt!37085 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!7722 (= lt!37094 (BitStream!1271 (buf!1043 (_2!1528 lt!36721)) (currentByte!2362 thiss!1379) (currentBit!2357 thiss!1379)))))

(assert (=> d!7722 (isPrefixOf!0 thiss!1379 (_2!1528 lt!36721))))

(assert (=> d!7722 (= (reader!0 thiss!1379 (_2!1528 lt!36721)) lt!37078)))

(declare-fun b!25854 () Bool)

(declare-fun lt!37091 () (_ BitVec 64))

(declare-fun lt!37081 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1270 (_ BitVec 64)) BitStream!1270)

(assert (=> b!25854 (= e!17617 (= (_1!1529 lt!37078) (withMovedBitIndex!0 (_2!1529 lt!37078) (bvsub lt!37091 lt!37081))))))

(assert (=> b!25854 (or (= (bvand lt!37091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!37081 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!37091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!37091 lt!37081) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25854 (= lt!37081 (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!36721))) (currentByte!2362 (_2!1528 lt!36721)) (currentBit!2357 (_2!1528 lt!36721))))))

(assert (=> b!25854 (= lt!37091 (bitIndex!0 (size!719 (buf!1043 thiss!1379)) (currentByte!2362 thiss!1379) (currentBit!2357 thiss!1379)))))

(declare-fun b!25855 () Bool)

(declare-fun res!22284 () Bool)

(assert (=> b!25855 (=> (not res!22284) (not e!17617))))

(assert (=> b!25855 (= res!22284 (isPrefixOf!0 (_1!1529 lt!37078) thiss!1379))))

(declare-fun b!25856 () Bool)

(declare-fun res!22285 () Bool)

(assert (=> b!25856 (=> (not res!22285) (not e!17617))))

(assert (=> b!25856 (= res!22285 (isPrefixOf!0 (_2!1529 lt!37078) (_2!1528 lt!36721)))))

(assert (= (and d!7722 c!1744) b!25852))

(assert (= (and d!7722 (not c!1744)) b!25853))

(assert (= (and d!7722 res!22283) b!25855))

(assert (= (and b!25855 res!22284) b!25856))

(assert (= (and b!25856 res!22285) b!25854))

(declare-fun m!36949 () Bool)

(assert (=> d!7722 m!36949))

(declare-fun m!36951 () Bool)

(assert (=> d!7722 m!36951))

(declare-fun m!36953 () Bool)

(assert (=> d!7722 m!36953))

(declare-fun m!36955 () Bool)

(assert (=> d!7722 m!36955))

(declare-fun m!36957 () Bool)

(assert (=> d!7722 m!36957))

(assert (=> d!7722 m!36625))

(declare-fun m!36959 () Bool)

(assert (=> d!7722 m!36959))

(declare-fun m!36961 () Bool)

(assert (=> d!7722 m!36961))

(assert (=> d!7722 m!36611))

(declare-fun m!36963 () Bool)

(assert (=> d!7722 m!36963))

(assert (=> d!7722 m!36613))

(assert (=> b!25852 m!36615))

(declare-fun m!36965 () Bool)

(assert (=> b!25852 m!36965))

(declare-fun m!36967 () Bool)

(assert (=> b!25852 m!36967))

(declare-fun m!36969 () Bool)

(assert (=> b!25855 m!36969))

(declare-fun m!36971 () Bool)

(assert (=> b!25854 m!36971))

(assert (=> b!25854 m!36573))

(assert (=> b!25854 m!36615))

(declare-fun m!36973 () Bool)

(assert (=> b!25856 m!36973))

(assert (=> b!25642 d!7722))

(declare-fun b!25857 () Bool)

(declare-fun e!17620 () Unit!2111)

(declare-fun lt!37112 () Unit!2111)

(assert (=> b!25857 (= e!17620 lt!37112)))

(declare-fun lt!37116 () (_ BitVec 64))

(assert (=> b!25857 (= lt!37116 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!37107 () (_ BitVec 64))

(assert (=> b!25857 (= lt!37107 (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!36717))) (currentByte!2362 (_2!1528 lt!36717)) (currentBit!2357 (_2!1528 lt!36717))))))

(assert (=> b!25857 (= lt!37112 (arrayBitRangesEqSymmetric!0 (buf!1043 (_2!1528 lt!36717)) (buf!1043 (_2!1528 lt!36721)) lt!37116 lt!37107))))

(assert (=> b!25857 (arrayBitRangesEq!0 (buf!1043 (_2!1528 lt!36721)) (buf!1043 (_2!1528 lt!36717)) lt!37116 lt!37107)))

(declare-fun b!25858 () Bool)

(declare-fun Unit!2131 () Unit!2111)

(assert (=> b!25858 (= e!17620 Unit!2131)))

(declare-fun d!7724 () Bool)

(declare-fun e!17619 () Bool)

(assert (=> d!7724 e!17619))

(declare-fun res!22286 () Bool)

(assert (=> d!7724 (=> (not res!22286) (not e!17619))))

(declare-fun lt!37098 () tuple2!2884)

(assert (=> d!7724 (= res!22286 (isPrefixOf!0 (_1!1529 lt!37098) (_2!1529 lt!37098)))))

(declare-fun lt!37114 () BitStream!1270)

(assert (=> d!7724 (= lt!37098 (tuple2!2885 lt!37114 (_2!1528 lt!36721)))))

(declare-fun lt!37109 () Unit!2111)

(declare-fun lt!37100 () Unit!2111)

(assert (=> d!7724 (= lt!37109 lt!37100)))

(assert (=> d!7724 (isPrefixOf!0 lt!37114 (_2!1528 lt!36721))))

(assert (=> d!7724 (= lt!37100 (lemmaIsPrefixTransitive!0 lt!37114 (_2!1528 lt!36721) (_2!1528 lt!36721)))))

(declare-fun lt!37103 () Unit!2111)

(declare-fun lt!37108 () Unit!2111)

(assert (=> d!7724 (= lt!37103 lt!37108)))

(assert (=> d!7724 (isPrefixOf!0 lt!37114 (_2!1528 lt!36721))))

(assert (=> d!7724 (= lt!37108 (lemmaIsPrefixTransitive!0 lt!37114 (_2!1528 lt!36717) (_2!1528 lt!36721)))))

(declare-fun lt!37104 () Unit!2111)

(assert (=> d!7724 (= lt!37104 e!17620)))

(declare-fun c!1745 () Bool)

(assert (=> d!7724 (= c!1745 (not (= (size!719 (buf!1043 (_2!1528 lt!36717))) #b00000000000000000000000000000000)))))

(declare-fun lt!37110 () Unit!2111)

(declare-fun lt!37115 () Unit!2111)

(assert (=> d!7724 (= lt!37110 lt!37115)))

(assert (=> d!7724 (isPrefixOf!0 (_2!1528 lt!36721) (_2!1528 lt!36721))))

(assert (=> d!7724 (= lt!37115 (lemmaIsPrefixRefl!0 (_2!1528 lt!36721)))))

(declare-fun lt!37113 () Unit!2111)

(declare-fun lt!37097 () Unit!2111)

(assert (=> d!7724 (= lt!37113 lt!37097)))

(assert (=> d!7724 (= lt!37097 (lemmaIsPrefixRefl!0 (_2!1528 lt!36721)))))

(declare-fun lt!37106 () Unit!2111)

(declare-fun lt!37102 () Unit!2111)

(assert (=> d!7724 (= lt!37106 lt!37102)))

(assert (=> d!7724 (isPrefixOf!0 lt!37114 lt!37114)))

(assert (=> d!7724 (= lt!37102 (lemmaIsPrefixRefl!0 lt!37114))))

(declare-fun lt!37099 () Unit!2111)

(declare-fun lt!37105 () Unit!2111)

(assert (=> d!7724 (= lt!37099 lt!37105)))

(assert (=> d!7724 (isPrefixOf!0 (_2!1528 lt!36717) (_2!1528 lt!36717))))

(assert (=> d!7724 (= lt!37105 (lemmaIsPrefixRefl!0 (_2!1528 lt!36717)))))

(assert (=> d!7724 (= lt!37114 (BitStream!1271 (buf!1043 (_2!1528 lt!36721)) (currentByte!2362 (_2!1528 lt!36717)) (currentBit!2357 (_2!1528 lt!36717))))))

(assert (=> d!7724 (isPrefixOf!0 (_2!1528 lt!36717) (_2!1528 lt!36721))))

(assert (=> d!7724 (= (reader!0 (_2!1528 lt!36717) (_2!1528 lt!36721)) lt!37098)))

(declare-fun b!25859 () Bool)

(declare-fun lt!37111 () (_ BitVec 64))

(declare-fun lt!37101 () (_ BitVec 64))

(assert (=> b!25859 (= e!17619 (= (_1!1529 lt!37098) (withMovedBitIndex!0 (_2!1529 lt!37098) (bvsub lt!37111 lt!37101))))))

(assert (=> b!25859 (or (= (bvand lt!37111 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!37101 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!37111 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!37111 lt!37101) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25859 (= lt!37101 (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!36721))) (currentByte!2362 (_2!1528 lt!36721)) (currentBit!2357 (_2!1528 lt!36721))))))

(assert (=> b!25859 (= lt!37111 (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!36717))) (currentByte!2362 (_2!1528 lt!36717)) (currentBit!2357 (_2!1528 lt!36717))))))

(declare-fun b!25860 () Bool)

(declare-fun res!22287 () Bool)

(assert (=> b!25860 (=> (not res!22287) (not e!17619))))

(assert (=> b!25860 (= res!22287 (isPrefixOf!0 (_1!1529 lt!37098) (_2!1528 lt!36717)))))

(declare-fun b!25861 () Bool)

(declare-fun res!22288 () Bool)

(assert (=> b!25861 (=> (not res!22288) (not e!17619))))

(assert (=> b!25861 (= res!22288 (isPrefixOf!0 (_2!1529 lt!37098) (_2!1528 lt!36721)))))

(assert (= (and d!7724 c!1745) b!25857))

(assert (= (and d!7724 (not c!1745)) b!25858))

(assert (= (and d!7724 res!22286) b!25860))

(assert (= (and b!25860 res!22287) b!25861))

(assert (= (and b!25861 res!22288) b!25859))

(declare-fun m!36975 () Bool)

(assert (=> d!7724 m!36975))

(declare-fun m!36977 () Bool)

(assert (=> d!7724 m!36977))

(declare-fun m!36979 () Bool)

(assert (=> d!7724 m!36979))

(assert (=> d!7724 m!36955))

(declare-fun m!36981 () Bool)

(assert (=> d!7724 m!36981))

(assert (=> d!7724 m!36629))

(assert (=> d!7724 m!36959))

(declare-fun m!36983 () Bool)

(assert (=> d!7724 m!36983))

(declare-fun m!36985 () Bool)

(assert (=> d!7724 m!36985))

(declare-fun m!36987 () Bool)

(assert (=> d!7724 m!36987))

(declare-fun m!36989 () Bool)

(assert (=> d!7724 m!36989))

(assert (=> b!25857 m!36577))

(declare-fun m!36991 () Bool)

(assert (=> b!25857 m!36991))

(declare-fun m!36993 () Bool)

(assert (=> b!25857 m!36993))

(declare-fun m!36995 () Bool)

(assert (=> b!25860 m!36995))

(declare-fun m!36997 () Bool)

(assert (=> b!25859 m!36997))

(assert (=> b!25859 m!36573))

(assert (=> b!25859 m!36577))

(declare-fun m!36999 () Bool)

(assert (=> b!25861 m!36999))

(assert (=> b!25642 d!7724))

(declare-fun d!7726 () Bool)

(assert (=> d!7726 (= (array_inv!688 (buf!1043 thiss!1379)) (bvsge (size!719 (buf!1043 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!25632 d!7726))

(declare-fun d!7728 () Bool)

(assert (=> d!7728 (= (array_inv!688 srcBuffer!2) (bvsge (size!719 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!5840 d!7728))

(declare-fun d!7730 () Bool)

(assert (=> d!7730 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2357 thiss!1379) (currentByte!2362 thiss!1379) (size!719 (buf!1043 thiss!1379))))))

(declare-fun bs!2227 () Bool)

(assert (= bs!2227 d!7730))

(declare-fun m!37001 () Bool)

(assert (=> bs!2227 m!37001))

(assert (=> start!5840 d!7730))

(declare-fun d!7732 () Bool)

(declare-fun res!22295 () Bool)

(declare-fun e!17626 () Bool)

(assert (=> d!7732 (=> (not res!22295) (not e!17626))))

(assert (=> d!7732 (= res!22295 (= (size!719 (buf!1043 thiss!1379)) (size!719 (buf!1043 (_2!1528 lt!36717)))))))

(assert (=> d!7732 (= (isPrefixOf!0 thiss!1379 (_2!1528 lt!36717)) e!17626)))

(declare-fun b!25868 () Bool)

(declare-fun res!22296 () Bool)

(assert (=> b!25868 (=> (not res!22296) (not e!17626))))

(assert (=> b!25868 (= res!22296 (bvsle (bitIndex!0 (size!719 (buf!1043 thiss!1379)) (currentByte!2362 thiss!1379) (currentBit!2357 thiss!1379)) (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!36717))) (currentByte!2362 (_2!1528 lt!36717)) (currentBit!2357 (_2!1528 lt!36717)))))))

(declare-fun b!25869 () Bool)

(declare-fun e!17625 () Bool)

(assert (=> b!25869 (= e!17626 e!17625)))

(declare-fun res!22297 () Bool)

(assert (=> b!25869 (=> res!22297 e!17625)))

(assert (=> b!25869 (= res!22297 (= (size!719 (buf!1043 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!25870 () Bool)

(assert (=> b!25870 (= e!17625 (arrayBitRangesEq!0 (buf!1043 thiss!1379) (buf!1043 (_2!1528 lt!36717)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!719 (buf!1043 thiss!1379)) (currentByte!2362 thiss!1379) (currentBit!2357 thiss!1379))))))

(assert (= (and d!7732 res!22295) b!25868))

(assert (= (and b!25868 res!22296) b!25869))

(assert (= (and b!25869 (not res!22297)) b!25870))

(assert (=> b!25868 m!36615))

(assert (=> b!25868 m!36577))

(assert (=> b!25870 m!36615))

(assert (=> b!25870 m!36615))

(declare-fun m!37003 () Bool)

(assert (=> b!25870 m!37003))

(assert (=> b!25636 d!7732))

(declare-fun d!7734 () Bool)

(assert (=> d!7734 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36717)))) ((_ sign_extend 32) (currentByte!2362 (_2!1528 lt!36717))) ((_ sign_extend 32) (currentBit!2357 (_2!1528 lt!36717))) lt!36714) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36717)))) ((_ sign_extend 32) (currentByte!2362 (_2!1528 lt!36717))) ((_ sign_extend 32) (currentBit!2357 (_2!1528 lt!36717)))) lt!36714))))

(declare-fun bs!2228 () Bool)

(assert (= bs!2228 d!7734))

(assert (=> bs!2228 m!36929))

(assert (=> b!25636 d!7734))

(declare-fun d!7736 () Bool)

(declare-fun e!17629 () Bool)

(assert (=> d!7736 e!17629))

(declare-fun res!22300 () Bool)

(assert (=> d!7736 (=> (not res!22300) (not e!17629))))

(assert (=> d!7736 (= res!22300 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!37119 () Unit!2111)

(declare-fun choose!27 (BitStream!1270 BitStream!1270 (_ BitVec 64) (_ BitVec 64)) Unit!2111)

(assert (=> d!7736 (= lt!37119 (choose!27 thiss!1379 (_2!1528 lt!36717) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!7736 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!7736 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1528 lt!36717) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!37119)))

(declare-fun b!25873 () Bool)

(assert (=> b!25873 (= e!17629 (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36717)))) ((_ sign_extend 32) (currentByte!2362 (_2!1528 lt!36717))) ((_ sign_extend 32) (currentBit!2357 (_2!1528 lt!36717))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!7736 res!22300) b!25873))

(declare-fun m!37005 () Bool)

(assert (=> d!7736 m!37005))

(declare-fun m!37007 () Bool)

(assert (=> b!25873 m!37007))

(assert (=> b!25636 d!7736))

(declare-fun b!25906 () Bool)

(declare-fun res!22329 () Bool)

(declare-fun e!17644 () Bool)

(assert (=> b!25906 (=> (not res!22329) (not e!17644))))

(declare-fun lt!37215 () tuple2!2882)

(assert (=> b!25906 (= res!22329 (isPrefixOf!0 thiss!1379 (_2!1528 lt!37215)))))

(declare-fun d!7738 () Bool)

(assert (=> d!7738 e!17644))

(declare-fun res!22332 () Bool)

(assert (=> d!7738 (=> (not res!22332) (not e!17644))))

(assert (=> d!7738 (= res!22332 (= (size!719 (buf!1043 (_2!1528 lt!37215))) (size!719 (buf!1043 thiss!1379))))))

(declare-fun lt!37216 () (_ BitVec 8))

(declare-fun lt!37212 () array!1670)

(assert (=> d!7738 (= lt!37216 (select (arr!1178 lt!37212) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!7738 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!719 lt!37212)))))

(assert (=> d!7738 (= lt!37212 (array!1671 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!37209 () tuple2!2882)

(assert (=> d!7738 (= lt!37215 (tuple2!2883 (_1!1528 lt!37209) (_2!1528 lt!37209)))))

(declare-fun lt!37214 () tuple2!2882)

(assert (=> d!7738 (= lt!37209 lt!37214)))

(declare-fun e!17645 () Bool)

(assert (=> d!7738 e!17645))

(declare-fun res!22328 () Bool)

(assert (=> d!7738 (=> (not res!22328) (not e!17645))))

(assert (=> d!7738 (= res!22328 (= (size!719 (buf!1043 thiss!1379)) (size!719 (buf!1043 (_2!1528 lt!37214)))))))

(declare-fun lt!37208 () Bool)

(declare-fun appendBit!0 (BitStream!1270 Bool) tuple2!2882)

(assert (=> d!7738 (= lt!37214 (appendBit!0 thiss!1379 lt!37208))))

(assert (=> d!7738 (= lt!37208 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1178 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!7738 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!7738 (= (appendBitFromByte!0 thiss!1379 (select (arr!1178 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!37215)))

(declare-fun b!25907 () Bool)

(declare-fun e!17646 () Bool)

(assert (=> b!25907 (= e!17644 e!17646)))

(declare-fun res!22326 () Bool)

(assert (=> b!25907 (=> (not res!22326) (not e!17646))))

(declare-datatypes ((tuple2!2908 0))(
  ( (tuple2!2909 (_1!1541 BitStream!1270) (_2!1541 Bool)) )
))
(declare-fun lt!37213 () tuple2!2908)

(assert (=> b!25907 (= res!22326 (and (= (_2!1541 lt!37213) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1178 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!37216)) #b00000000000000000000000000000000))) (= (_1!1541 lt!37213) (_2!1528 lt!37215))))))

(declare-datatypes ((tuple2!2910 0))(
  ( (tuple2!2911 (_1!1542 array!1670) (_2!1542 BitStream!1270)) )
))
(declare-fun lt!37210 () tuple2!2910)

(declare-fun lt!37217 () BitStream!1270)

(declare-fun readBits!0 (BitStream!1270 (_ BitVec 64)) tuple2!2910)

(assert (=> b!25907 (= lt!37210 (readBits!0 lt!37217 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1270) tuple2!2908)

(assert (=> b!25907 (= lt!37213 (readBitPure!0 lt!37217))))

(declare-fun readerFrom!0 (BitStream!1270 (_ BitVec 32) (_ BitVec 32)) BitStream!1270)

(assert (=> b!25907 (= lt!37217 (readerFrom!0 (_2!1528 lt!37215) (currentBit!2357 thiss!1379) (currentByte!2362 thiss!1379)))))

(declare-fun b!25908 () Bool)

(declare-fun e!17647 () Bool)

(assert (=> b!25908 (= e!17645 e!17647)))

(declare-fun res!22330 () Bool)

(assert (=> b!25908 (=> (not res!22330) (not e!17647))))

(declare-fun lt!37218 () tuple2!2908)

(assert (=> b!25908 (= res!22330 (and (= (_2!1541 lt!37218) lt!37208) (= (_1!1541 lt!37218) (_2!1528 lt!37214))))))

(assert (=> b!25908 (= lt!37218 (readBitPure!0 (readerFrom!0 (_2!1528 lt!37214) (currentBit!2357 thiss!1379) (currentByte!2362 thiss!1379))))))

(declare-fun b!25909 () Bool)

(declare-fun res!22333 () Bool)

(assert (=> b!25909 (=> (not res!22333) (not e!17644))))

(declare-fun lt!37207 () (_ BitVec 64))

(declare-fun lt!37211 () (_ BitVec 64))

(assert (=> b!25909 (= res!22333 (= (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!37215))) (currentByte!2362 (_2!1528 lt!37215)) (currentBit!2357 (_2!1528 lt!37215))) (bvadd lt!37207 lt!37211)))))

(assert (=> b!25909 (or (not (= (bvand lt!37207 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!37211 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!37207 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!37207 lt!37211) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25909 (= lt!37211 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!25909 (= lt!37207 (bitIndex!0 (size!719 (buf!1043 thiss!1379)) (currentByte!2362 thiss!1379) (currentBit!2357 thiss!1379)))))

(declare-fun b!25910 () Bool)

(assert (=> b!25910 (= e!17647 (= (bitIndex!0 (size!719 (buf!1043 (_1!1541 lt!37218))) (currentByte!2362 (_1!1541 lt!37218)) (currentBit!2357 (_1!1541 lt!37218))) (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!37214))) (currentByte!2362 (_2!1528 lt!37214)) (currentBit!2357 (_2!1528 lt!37214)))))))

(declare-fun b!25911 () Bool)

(declare-fun res!22327 () Bool)

(assert (=> b!25911 (=> (not res!22327) (not e!17645))))

(assert (=> b!25911 (= res!22327 (isPrefixOf!0 thiss!1379 (_2!1528 lt!37214)))))

(declare-fun b!25912 () Bool)

(assert (=> b!25912 (= e!17646 (= (bitIndex!0 (size!719 (buf!1043 (_1!1541 lt!37213))) (currentByte!2362 (_1!1541 lt!37213)) (currentBit!2357 (_1!1541 lt!37213))) (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!37215))) (currentByte!2362 (_2!1528 lt!37215)) (currentBit!2357 (_2!1528 lt!37215)))))))

(declare-fun b!25913 () Bool)

(declare-fun res!22331 () Bool)

(assert (=> b!25913 (=> (not res!22331) (not e!17645))))

(assert (=> b!25913 (= res!22331 (= (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!37214))) (currentByte!2362 (_2!1528 lt!37214)) (currentBit!2357 (_2!1528 lt!37214))) (bvadd (bitIndex!0 (size!719 (buf!1043 thiss!1379)) (currentByte!2362 thiss!1379) (currentBit!2357 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!7738 res!22328) b!25913))

(assert (= (and b!25913 res!22331) b!25911))

(assert (= (and b!25911 res!22327) b!25908))

(assert (= (and b!25908 res!22330) b!25910))

(assert (= (and d!7738 res!22332) b!25909))

(assert (= (and b!25909 res!22333) b!25906))

(assert (= (and b!25906 res!22329) b!25907))

(assert (= (and b!25907 res!22326) b!25912))

(declare-fun m!37041 () Bool)

(assert (=> b!25910 m!37041))

(declare-fun m!37043 () Bool)

(assert (=> b!25910 m!37043))

(declare-fun m!37045 () Bool)

(assert (=> b!25908 m!37045))

(assert (=> b!25908 m!37045))

(declare-fun m!37047 () Bool)

(assert (=> b!25908 m!37047))

(declare-fun m!37049 () Bool)

(assert (=> b!25912 m!37049))

(declare-fun m!37051 () Bool)

(assert (=> b!25912 m!37051))

(assert (=> b!25909 m!37051))

(assert (=> b!25909 m!36615))

(declare-fun m!37053 () Bool)

(assert (=> b!25906 m!37053))

(declare-fun m!37055 () Bool)

(assert (=> b!25911 m!37055))

(declare-fun m!37057 () Bool)

(assert (=> b!25907 m!37057))

(declare-fun m!37059 () Bool)

(assert (=> b!25907 m!37059))

(declare-fun m!37061 () Bool)

(assert (=> b!25907 m!37061))

(assert (=> b!25913 m!37043))

(assert (=> b!25913 m!36615))

(declare-fun m!37063 () Bool)

(assert (=> d!7738 m!37063))

(declare-fun m!37065 () Bool)

(assert (=> d!7738 m!37065))

(declare-fun m!37067 () Bool)

(assert (=> d!7738 m!37067))

(assert (=> b!25636 d!7738))

(declare-fun d!7750 () Bool)

(assert (=> d!7750 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 thiss!1379))) ((_ sign_extend 32) (currentByte!2362 thiss!1379)) ((_ sign_extend 32) (currentBit!2357 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!719 (buf!1043 thiss!1379))) ((_ sign_extend 32) (currentByte!2362 thiss!1379)) ((_ sign_extend 32) (currentBit!2357 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2232 () Bool)

(assert (= bs!2232 d!7750))

(declare-fun m!37069 () Bool)

(assert (=> bs!2232 m!37069))

(assert (=> b!25634 d!7750))

(declare-fun d!7752 () Bool)

(assert (=> d!7752 (= (invariant!0 (currentBit!2357 (_2!1528 lt!36717)) (currentByte!2362 (_2!1528 lt!36717)) (size!719 (buf!1043 (_2!1528 lt!36721)))) (and (bvsge (currentBit!2357 (_2!1528 lt!36717)) #b00000000000000000000000000000000) (bvslt (currentBit!2357 (_2!1528 lt!36717)) #b00000000000000000000000000001000) (bvsge (currentByte!2362 (_2!1528 lt!36717)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2362 (_2!1528 lt!36717)) (size!719 (buf!1043 (_2!1528 lt!36721)))) (and (= (currentBit!2357 (_2!1528 lt!36717)) #b00000000000000000000000000000000) (= (currentByte!2362 (_2!1528 lt!36717)) (size!719 (buf!1043 (_2!1528 lt!36721))))))))))

(assert (=> b!25635 d!7752))

(declare-fun d!7754 () Bool)

(assert (=> d!7754 (= (invariant!0 (currentBit!2357 (_2!1528 lt!36721)) (currentByte!2362 (_2!1528 lt!36721)) (size!719 (buf!1043 (_2!1528 lt!36721)))) (and (bvsge (currentBit!2357 (_2!1528 lt!36721)) #b00000000000000000000000000000000) (bvslt (currentBit!2357 (_2!1528 lt!36721)) #b00000000000000000000000000001000) (bvsge (currentByte!2362 (_2!1528 lt!36721)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2362 (_2!1528 lt!36721)) (size!719 (buf!1043 (_2!1528 lt!36721)))) (and (= (currentBit!2357 (_2!1528 lt!36721)) #b00000000000000000000000000000000) (= (currentByte!2362 (_2!1528 lt!36721)) (size!719 (buf!1043 (_2!1528 lt!36721))))))))))

(assert (=> b!25638 d!7754))

(declare-fun d!7756 () Bool)

(declare-fun res!22334 () Bool)

(declare-fun e!17649 () Bool)

(assert (=> d!7756 (=> (not res!22334) (not e!17649))))

(assert (=> d!7756 (= res!22334 (= (size!719 (buf!1043 thiss!1379)) (size!719 (buf!1043 thiss!1379))))))

(assert (=> d!7756 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!17649)))

(declare-fun b!25914 () Bool)

(declare-fun res!22335 () Bool)

(assert (=> b!25914 (=> (not res!22335) (not e!17649))))

(assert (=> b!25914 (= res!22335 (bvsle (bitIndex!0 (size!719 (buf!1043 thiss!1379)) (currentByte!2362 thiss!1379) (currentBit!2357 thiss!1379)) (bitIndex!0 (size!719 (buf!1043 thiss!1379)) (currentByte!2362 thiss!1379) (currentBit!2357 thiss!1379))))))

(declare-fun b!25915 () Bool)

(declare-fun e!17648 () Bool)

(assert (=> b!25915 (= e!17649 e!17648)))

(declare-fun res!22336 () Bool)

(assert (=> b!25915 (=> res!22336 e!17648)))

(assert (=> b!25915 (= res!22336 (= (size!719 (buf!1043 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!25916 () Bool)

(assert (=> b!25916 (= e!17648 (arrayBitRangesEq!0 (buf!1043 thiss!1379) (buf!1043 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!719 (buf!1043 thiss!1379)) (currentByte!2362 thiss!1379) (currentBit!2357 thiss!1379))))))

(assert (= (and d!7756 res!22334) b!25914))

(assert (= (and b!25914 res!22335) b!25915))

(assert (= (and b!25915 (not res!22336)) b!25916))

(assert (=> b!25914 m!36615))

(assert (=> b!25914 m!36615))

(assert (=> b!25916 m!36615))

(assert (=> b!25916 m!36615))

(declare-fun m!37071 () Bool)

(assert (=> b!25916 m!37071))

(assert (=> b!25639 d!7756))

(declare-fun d!7758 () Bool)

(assert (=> d!7758 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!37221 () Unit!2111)

(declare-fun choose!11 (BitStream!1270) Unit!2111)

(assert (=> d!7758 (= lt!37221 (choose!11 thiss!1379))))

(assert (=> d!7758 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!37221)))

(declare-fun bs!2234 () Bool)

(assert (= bs!2234 d!7758))

(assert (=> bs!2234 m!36611))

(declare-fun m!37073 () Bool)

(assert (=> bs!2234 m!37073))

(assert (=> b!25639 d!7758))

(declare-fun d!7760 () Bool)

(declare-fun e!17650 () Bool)

(assert (=> d!7760 e!17650))

(declare-fun res!22338 () Bool)

(assert (=> d!7760 (=> (not res!22338) (not e!17650))))

(declare-fun lt!37222 () (_ BitVec 64))

(declare-fun lt!37227 () (_ BitVec 64))

(declare-fun lt!37225 () (_ BitVec 64))

(assert (=> d!7760 (= res!22338 (= lt!37222 (bvsub lt!37227 lt!37225)))))

(assert (=> d!7760 (or (= (bvand lt!37227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!37225 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!37227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!37227 lt!37225) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7760 (= lt!37225 (remainingBits!0 ((_ sign_extend 32) (size!719 (buf!1043 thiss!1379))) ((_ sign_extend 32) (currentByte!2362 thiss!1379)) ((_ sign_extend 32) (currentBit!2357 thiss!1379))))))

(declare-fun lt!37223 () (_ BitVec 64))

(declare-fun lt!37226 () (_ BitVec 64))

(assert (=> d!7760 (= lt!37227 (bvmul lt!37223 lt!37226))))

(assert (=> d!7760 (or (= lt!37223 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!37226 (bvsdiv (bvmul lt!37223 lt!37226) lt!37223)))))

(assert (=> d!7760 (= lt!37226 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7760 (= lt!37223 ((_ sign_extend 32) (size!719 (buf!1043 thiss!1379))))))

(assert (=> d!7760 (= lt!37222 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2362 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2357 thiss!1379))))))

(assert (=> d!7760 (invariant!0 (currentBit!2357 thiss!1379) (currentByte!2362 thiss!1379) (size!719 (buf!1043 thiss!1379)))))

(assert (=> d!7760 (= (bitIndex!0 (size!719 (buf!1043 thiss!1379)) (currentByte!2362 thiss!1379) (currentBit!2357 thiss!1379)) lt!37222)))

(declare-fun b!25917 () Bool)

(declare-fun res!22337 () Bool)

(assert (=> b!25917 (=> (not res!22337) (not e!17650))))

(assert (=> b!25917 (= res!22337 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!37222))))

(declare-fun b!25918 () Bool)

(declare-fun lt!37224 () (_ BitVec 64))

(assert (=> b!25918 (= e!17650 (bvsle lt!37222 (bvmul lt!37224 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!25918 (or (= lt!37224 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!37224 #b0000000000000000000000000000000000000000000000000000000000001000) lt!37224)))))

(assert (=> b!25918 (= lt!37224 ((_ sign_extend 32) (size!719 (buf!1043 thiss!1379))))))

(assert (= (and d!7760 res!22338) b!25917))

(assert (= (and b!25917 res!22337) b!25918))

(assert (=> d!7760 m!37069))

(assert (=> d!7760 m!37001))

(assert (=> b!25639 d!7760))

(declare-fun d!7762 () Bool)

(assert (=> d!7762 (= (head!173 (byteArrayBitContentToList!0 (_2!1528 lt!36717) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!451 (byteArrayBitContentToList!0 (_2!1528 lt!36717) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!25637 d!7762))

(declare-fun d!7764 () Bool)

(declare-fun c!1751 () Bool)

(assert (=> d!7764 (= c!1751 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!17653 () List!336)

(assert (=> d!7764 (= (byteArrayBitContentToList!0 (_2!1528 lt!36717) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!17653)))

(declare-fun b!25923 () Bool)

(assert (=> b!25923 (= e!17653 Nil!333)))

(declare-fun b!25924 () Bool)

(assert (=> b!25924 (= e!17653 (Cons!332 (not (= (bvand ((_ sign_extend 24) (select (arr!1178 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1528 lt!36717) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!7764 c!1751) b!25923))

(assert (= (and d!7764 (not c!1751)) b!25924))

(assert (=> b!25924 m!36563))

(assert (=> b!25924 m!37067))

(declare-fun m!37075 () Bool)

(assert (=> b!25924 m!37075))

(assert (=> b!25637 d!7764))

(declare-fun d!7766 () Bool)

(assert (=> d!7766 (= (head!173 (bitStreamReadBitsIntoList!0 (_2!1528 lt!36717) (_1!1529 lt!36711) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!451 (bitStreamReadBitsIntoList!0 (_2!1528 lt!36717) (_1!1529 lt!36711) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!25637 d!7766))

(declare-fun d!7768 () Bool)

(declare-fun e!17654 () Bool)

(assert (=> d!7768 e!17654))

(declare-fun c!1753 () Bool)

(assert (=> d!7768 (= c!1753 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!37230 () List!336)

(declare-fun e!17655 () tuple2!2902)

(assert (=> d!7768 (= lt!37230 (_1!1538 e!17655))))

(declare-fun c!1752 () Bool)

(assert (=> d!7768 (= c!1752 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7768 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7768 (= (bitStreamReadBitsIntoList!0 (_2!1528 lt!36717) (_1!1529 lt!36711) #b0000000000000000000000000000000000000000000000000000000000000001) lt!37230)))

(declare-fun b!25927 () Bool)

(assert (=> b!25927 (= e!17654 (isEmpty!68 lt!37230))))

(declare-fun b!25925 () Bool)

(assert (=> b!25925 (= e!17655 (tuple2!2903 Nil!333 (_1!1529 lt!36711)))))

(declare-fun lt!37228 () tuple2!2904)

(declare-fun lt!37229 () (_ BitVec 64))

(declare-fun b!25926 () Bool)

(assert (=> b!25926 (= e!17655 (tuple2!2903 (Cons!332 (_1!1539 lt!37228) (bitStreamReadBitsIntoList!0 (_2!1528 lt!36717) (_2!1539 lt!37228) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!37229))) (_2!1539 lt!37228)))))

(assert (=> b!25926 (= lt!37228 (readBit!0 (_1!1529 lt!36711)))))

(assert (=> b!25926 (= lt!37229 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!25928 () Bool)

(assert (=> b!25928 (= e!17654 (> (length!63 lt!37230) 0))))

(assert (= (and d!7768 c!1752) b!25925))

(assert (= (and d!7768 (not c!1752)) b!25926))

(assert (= (and d!7768 c!1753) b!25927))

(assert (= (and d!7768 (not c!1753)) b!25928))

(declare-fun m!37077 () Bool)

(assert (=> b!25927 m!37077))

(declare-fun m!37079 () Bool)

(assert (=> b!25926 m!37079))

(declare-fun m!37081 () Bool)

(assert (=> b!25926 m!37081))

(declare-fun m!37083 () Bool)

(assert (=> b!25928 m!37083))

(assert (=> b!25637 d!7768))

(declare-fun d!7770 () Bool)

(assert (=> d!7770 (isPrefixOf!0 thiss!1379 (_2!1528 lt!36721))))

(declare-fun lt!37233 () Unit!2111)

(declare-fun choose!30 (BitStream!1270 BitStream!1270 BitStream!1270) Unit!2111)

(assert (=> d!7770 (= lt!37233 (choose!30 thiss!1379 (_2!1528 lt!36717) (_2!1528 lt!36721)))))

(assert (=> d!7770 (isPrefixOf!0 thiss!1379 (_2!1528 lt!36717))))

(assert (=> d!7770 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1528 lt!36717) (_2!1528 lt!36721)) lt!37233)))

(declare-fun bs!2235 () Bool)

(assert (= bs!2235 d!7770))

(assert (=> bs!2235 m!36625))

(declare-fun m!37085 () Bool)

(assert (=> bs!2235 m!37085))

(assert (=> bs!2235 m!36565))

(assert (=> b!25631 d!7770))

(declare-fun lt!37706 () tuple2!2884)

(declare-fun lt!37726 () tuple2!2882)

(declare-fun e!17724 () Bool)

(declare-fun b!26074 () Bool)

(assert (=> b!26074 (= e!17724 (= (bitStreamReadBitsIntoList!0 (_2!1528 lt!37726) (_1!1529 lt!37706) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1528 lt!37726) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!26074 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!26074 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!37718 () Unit!2111)

(declare-fun lt!37694 () Unit!2111)

(assert (=> b!26074 (= lt!37718 lt!37694)))

(declare-fun lt!37722 () (_ BitVec 64))

(assert (=> b!26074 (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!37726)))) ((_ sign_extend 32) (currentByte!2362 (_2!1528 lt!36717))) ((_ sign_extend 32) (currentBit!2357 (_2!1528 lt!36717))) lt!37722)))

(assert (=> b!26074 (= lt!37694 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1528 lt!36717) (buf!1043 (_2!1528 lt!37726)) lt!37722))))

(declare-fun e!17725 () Bool)

(assert (=> b!26074 e!17725))

(declare-fun res!22442 () Bool)

(assert (=> b!26074 (=> (not res!22442) (not e!17725))))

(assert (=> b!26074 (= res!22442 (and (= (size!719 (buf!1043 (_2!1528 lt!36717))) (size!719 (buf!1043 (_2!1528 lt!37726)))) (bvsge lt!37722 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!26074 (= lt!37722 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!26074 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!26074 (= lt!37706 (reader!0 (_2!1528 lt!36717) (_2!1528 lt!37726)))))

(declare-fun b!26075 () Bool)

(declare-fun e!17726 () tuple2!2882)

(declare-fun lt!37709 () tuple2!2882)

(declare-fun Unit!2138 () Unit!2111)

(assert (=> b!26075 (= e!17726 (tuple2!2883 Unit!2138 (_2!1528 lt!37709)))))

(declare-fun lt!37685 () tuple2!2882)

(assert (=> b!26075 (= lt!37685 (appendBitFromByte!0 (_2!1528 lt!36717) (select (arr!1178 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!37712 () (_ BitVec 64))

(assert (=> b!26075 (= lt!37712 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!37692 () (_ BitVec 64))

(assert (=> b!26075 (= lt!37692 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!37701 () Unit!2111)

(assert (=> b!26075 (= lt!37701 (validateOffsetBitsIneqLemma!0 (_2!1528 lt!36717) (_2!1528 lt!37685) lt!37712 lt!37692))))

(assert (=> b!26075 (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!37685)))) ((_ sign_extend 32) (currentByte!2362 (_2!1528 lt!37685))) ((_ sign_extend 32) (currentBit!2357 (_2!1528 lt!37685))) (bvsub lt!37712 lt!37692))))

(declare-fun lt!37698 () Unit!2111)

(assert (=> b!26075 (= lt!37698 lt!37701)))

(declare-fun lt!37719 () tuple2!2884)

(assert (=> b!26075 (= lt!37719 (reader!0 (_2!1528 lt!36717) (_2!1528 lt!37685)))))

(declare-fun lt!37703 () (_ BitVec 64))

(assert (=> b!26075 (= lt!37703 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!37687 () Unit!2111)

(assert (=> b!26075 (= lt!37687 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1528 lt!36717) (buf!1043 (_2!1528 lt!37685)) lt!37703))))

(assert (=> b!26075 (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!37685)))) ((_ sign_extend 32) (currentByte!2362 (_2!1528 lt!36717))) ((_ sign_extend 32) (currentBit!2357 (_2!1528 lt!36717))) lt!37703)))

(declare-fun lt!37720 () Unit!2111)

(assert (=> b!26075 (= lt!37720 lt!37687)))

(assert (=> b!26075 (= (head!173 (byteArrayBitContentToList!0 (_2!1528 lt!37685) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!173 (bitStreamReadBitsIntoList!0 (_2!1528 lt!37685) (_1!1529 lt!37719) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!37689 () Unit!2111)

(declare-fun Unit!2139 () Unit!2111)

(assert (=> b!26075 (= lt!37689 Unit!2139)))

(assert (=> b!26075 (= lt!37709 (appendBitsMSBFirstLoop!0 (_2!1528 lt!37685) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!37723 () Unit!2111)

(assert (=> b!26075 (= lt!37723 (lemmaIsPrefixTransitive!0 (_2!1528 lt!36717) (_2!1528 lt!37685) (_2!1528 lt!37709)))))

(assert (=> b!26075 (isPrefixOf!0 (_2!1528 lt!36717) (_2!1528 lt!37709))))

(declare-fun lt!37724 () Unit!2111)

(assert (=> b!26075 (= lt!37724 lt!37723)))

(assert (=> b!26075 (= (size!719 (buf!1043 (_2!1528 lt!37709))) (size!719 (buf!1043 (_2!1528 lt!36717))))))

(declare-fun lt!37683 () Unit!2111)

(declare-fun Unit!2140 () Unit!2111)

(assert (=> b!26075 (= lt!37683 Unit!2140)))

(assert (=> b!26075 (= (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!37709))) (currentByte!2362 (_2!1528 lt!37709)) (currentBit!2357 (_2!1528 lt!37709))) (bvsub (bvadd (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!36717))) (currentByte!2362 (_2!1528 lt!36717)) (currentBit!2357 (_2!1528 lt!36717))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!37700 () Unit!2111)

(declare-fun Unit!2141 () Unit!2111)

(assert (=> b!26075 (= lt!37700 Unit!2141)))

(assert (=> b!26075 (= (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!37709))) (currentByte!2362 (_2!1528 lt!37709)) (currentBit!2357 (_2!1528 lt!37709))) (bvsub (bvsub (bvadd (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!37685))) (currentByte!2362 (_2!1528 lt!37685)) (currentBit!2357 (_2!1528 lt!37685))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!37688 () Unit!2111)

(declare-fun Unit!2142 () Unit!2111)

(assert (=> b!26075 (= lt!37688 Unit!2142)))

(declare-fun lt!37696 () tuple2!2884)

(declare-fun call!355 () tuple2!2884)

(assert (=> b!26075 (= lt!37696 call!355)))

(declare-fun lt!37684 () (_ BitVec 64))

(assert (=> b!26075 (= lt!37684 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!37707 () Unit!2111)

(assert (=> b!26075 (= lt!37707 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1528 lt!36717) (buf!1043 (_2!1528 lt!37709)) lt!37684))))

(assert (=> b!26075 (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!37709)))) ((_ sign_extend 32) (currentByte!2362 (_2!1528 lt!36717))) ((_ sign_extend 32) (currentBit!2357 (_2!1528 lt!36717))) lt!37684)))

(declare-fun lt!37717 () Unit!2111)

(assert (=> b!26075 (= lt!37717 lt!37707)))

(declare-fun lt!37716 () tuple2!2884)

(assert (=> b!26075 (= lt!37716 (reader!0 (_2!1528 lt!37685) (_2!1528 lt!37709)))))

(declare-fun lt!37725 () (_ BitVec 64))

(assert (=> b!26075 (= lt!37725 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!37704 () Unit!2111)

(assert (=> b!26075 (= lt!37704 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1528 lt!37685) (buf!1043 (_2!1528 lt!37709)) lt!37725))))

(assert (=> b!26075 (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!37709)))) ((_ sign_extend 32) (currentByte!2362 (_2!1528 lt!37685))) ((_ sign_extend 32) (currentBit!2357 (_2!1528 lt!37685))) lt!37725)))

(declare-fun lt!37691 () Unit!2111)

(assert (=> b!26075 (= lt!37691 lt!37704)))

(declare-fun lt!37695 () List!336)

(assert (=> b!26075 (= lt!37695 (byteArrayBitContentToList!0 (_2!1528 lt!37709) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!37690 () List!336)

(assert (=> b!26075 (= lt!37690 (byteArrayBitContentToList!0 (_2!1528 lt!37709) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!37693 () List!336)

(assert (=> b!26075 (= lt!37693 (bitStreamReadBitsIntoList!0 (_2!1528 lt!37709) (_1!1529 lt!37696) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!37713 () List!336)

(assert (=> b!26075 (= lt!37713 (bitStreamReadBitsIntoList!0 (_2!1528 lt!37709) (_1!1529 lt!37716) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!37705 () (_ BitVec 64))

(assert (=> b!26075 (= lt!37705 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!37715 () Unit!2111)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1270 BitStream!1270 BitStream!1270 BitStream!1270 (_ BitVec 64) List!336) Unit!2111)

(assert (=> b!26075 (= lt!37715 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1528 lt!37709) (_2!1528 lt!37709) (_1!1529 lt!37696) (_1!1529 lt!37716) lt!37705 lt!37693))))

(declare-fun tail!91 (List!336) List!336)

(assert (=> b!26075 (= (bitStreamReadBitsIntoList!0 (_2!1528 lt!37709) (_1!1529 lt!37716) (bvsub lt!37705 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!91 lt!37693))))

(declare-fun lt!37711 () Unit!2111)

(assert (=> b!26075 (= lt!37711 lt!37715)))

(declare-fun lt!37699 () (_ BitVec 64))

(declare-fun lt!37697 () Unit!2111)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1670 array!1670 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2111)

(assert (=> b!26075 (= lt!37697 (arrayBitRangesEqImpliesEq!0 (buf!1043 (_2!1528 lt!37685)) (buf!1043 (_2!1528 lt!37709)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!37699 (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!37685))) (currentByte!2362 (_2!1528 lt!37685)) (currentBit!2357 (_2!1528 lt!37685)))))))

(declare-fun bitAt!0 (array!1670 (_ BitVec 64)) Bool)

(assert (=> b!26075 (= (bitAt!0 (buf!1043 (_2!1528 lt!37685)) lt!37699) (bitAt!0 (buf!1043 (_2!1528 lt!37709)) lt!37699))))

(declare-fun lt!37714 () Unit!2111)

(assert (=> b!26075 (= lt!37714 lt!37697)))

(declare-fun c!1775 () Bool)

(declare-fun bm!352 () Bool)

(assert (=> bm!352 (= call!355 (reader!0 (_2!1528 lt!36717) (ite c!1775 (_2!1528 lt!37709) (_2!1528 lt!36717))))))

(declare-fun b!26076 () Bool)

(declare-fun res!22444 () Bool)

(assert (=> b!26076 (=> (not res!22444) (not e!17724))))

(assert (=> b!26076 (= res!22444 (isPrefixOf!0 (_2!1528 lt!36717) (_2!1528 lt!37726)))))

(declare-fun b!26077 () Bool)

(assert (=> b!26077 (= e!17725 (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36717)))) ((_ sign_extend 32) (currentByte!2362 (_2!1528 lt!36717))) ((_ sign_extend 32) (currentBit!2357 (_2!1528 lt!36717))) lt!37722))))

(declare-fun b!26078 () Bool)

(declare-fun res!22441 () Bool)

(assert (=> b!26078 (=> (not res!22441) (not e!17724))))

(assert (=> b!26078 (= res!22441 (= (size!719 (buf!1043 (_2!1528 lt!37726))) (size!719 (buf!1043 (_2!1528 lt!36717)))))))

(declare-fun b!26079 () Bool)

(declare-fun res!22443 () Bool)

(assert (=> b!26079 (=> (not res!22443) (not e!17724))))

(assert (=> b!26079 (= res!22443 (invariant!0 (currentBit!2357 (_2!1528 lt!37726)) (currentByte!2362 (_2!1528 lt!37726)) (size!719 (buf!1043 (_2!1528 lt!37726)))))))

(declare-fun b!26080 () Bool)

(declare-fun Unit!2144 () Unit!2111)

(assert (=> b!26080 (= e!17726 (tuple2!2883 Unit!2144 (_2!1528 lt!36717)))))

(assert (=> b!26080 (= (size!719 (buf!1043 (_2!1528 lt!36717))) (size!719 (buf!1043 (_2!1528 lt!36717))))))

(declare-fun lt!37721 () Unit!2111)

(declare-fun Unit!2145 () Unit!2111)

(assert (=> b!26080 (= lt!37721 Unit!2145)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1270 array!1670 array!1670 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!26080 (checkByteArrayBitContent!0 (_2!1528 lt!36717) srcBuffer!2 (_1!1542 (readBits!0 (_1!1529 call!355) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!26081 () Bool)

(declare-fun res!22446 () Bool)

(assert (=> b!26081 (=> (not res!22446) (not e!17724))))

(assert (=> b!26081 (= res!22446 (= (size!719 (buf!1043 (_2!1528 lt!36717))) (size!719 (buf!1043 (_2!1528 lt!37726)))))))

(declare-fun d!7772 () Bool)

(assert (=> d!7772 e!17724))

(declare-fun res!22445 () Bool)

(assert (=> d!7772 (=> (not res!22445) (not e!17724))))

(declare-fun lt!37702 () (_ BitVec 64))

(assert (=> d!7772 (= res!22445 (= (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!37726))) (currentByte!2362 (_2!1528 lt!37726)) (currentBit!2357 (_2!1528 lt!37726))) (bvsub lt!37702 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!7772 (or (= (bvand lt!37702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!37702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!37702 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!37710 () (_ BitVec 64))

(assert (=> d!7772 (= lt!37702 (bvadd lt!37710 to!314))))

(assert (=> d!7772 (or (not (= (bvand lt!37710 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!37710 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!37710 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7772 (= lt!37710 (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!36717))) (currentByte!2362 (_2!1528 lt!36717)) (currentBit!2357 (_2!1528 lt!36717))))))

(assert (=> d!7772 (= lt!37726 e!17726)))

(assert (=> d!7772 (= c!1775 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!37708 () Unit!2111)

(declare-fun lt!37686 () Unit!2111)

(assert (=> d!7772 (= lt!37708 lt!37686)))

(assert (=> d!7772 (isPrefixOf!0 (_2!1528 lt!36717) (_2!1528 lt!36717))))

(assert (=> d!7772 (= lt!37686 (lemmaIsPrefixRefl!0 (_2!1528 lt!36717)))))

(assert (=> d!7772 (= lt!37699 (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!36717))) (currentByte!2362 (_2!1528 lt!36717)) (currentBit!2357 (_2!1528 lt!36717))))))

(assert (=> d!7772 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7772 (= (appendBitsMSBFirstLoop!0 (_2!1528 lt!36717) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!37726)))

(assert (= (and d!7772 c!1775) b!26075))

(assert (= (and d!7772 (not c!1775)) b!26080))

(assert (= (or b!26075 b!26080) bm!352))

(assert (= (and d!7772 res!22445) b!26079))

(assert (= (and b!26079 res!22443) b!26081))

(assert (= (and b!26081 res!22446) b!26076))

(assert (= (and b!26076 res!22444) b!26078))

(assert (= (and b!26078 res!22441) b!26074))

(assert (= (and b!26074 res!22442) b!26077))

(declare-fun m!37383 () Bool)

(assert (=> b!26079 m!37383))

(declare-fun m!37385 () Bool)

(assert (=> b!26075 m!37385))

(declare-fun m!37387 () Bool)

(assert (=> b!26075 m!37387))

(declare-fun m!37389 () Bool)

(assert (=> b!26075 m!37389))

(declare-fun m!37391 () Bool)

(assert (=> b!26075 m!37391))

(declare-fun m!37393 () Bool)

(assert (=> b!26075 m!37393))

(declare-fun m!37395 () Bool)

(assert (=> b!26075 m!37395))

(declare-fun m!37397 () Bool)

(assert (=> b!26075 m!37397))

(declare-fun m!37399 () Bool)

(assert (=> b!26075 m!37399))

(declare-fun m!37401 () Bool)

(assert (=> b!26075 m!37401))

(declare-fun m!37403 () Bool)

(assert (=> b!26075 m!37403))

(declare-fun m!37405 () Bool)

(assert (=> b!26075 m!37405))

(declare-fun m!37407 () Bool)

(assert (=> b!26075 m!37407))

(declare-fun m!37409 () Bool)

(assert (=> b!26075 m!37409))

(declare-fun m!37411 () Bool)

(assert (=> b!26075 m!37411))

(declare-fun m!37413 () Bool)

(assert (=> b!26075 m!37413))

(assert (=> b!26075 m!37385))

(declare-fun m!37415 () Bool)

(assert (=> b!26075 m!37415))

(assert (=> b!26075 m!37395))

(declare-fun m!37417 () Bool)

(assert (=> b!26075 m!37417))

(declare-fun m!37419 () Bool)

(assert (=> b!26075 m!37419))

(declare-fun m!37421 () Bool)

(assert (=> b!26075 m!37421))

(declare-fun m!37423 () Bool)

(assert (=> b!26075 m!37423))

(declare-fun m!37425 () Bool)

(assert (=> b!26075 m!37425))

(declare-fun m!37427 () Bool)

(assert (=> b!26075 m!37427))

(declare-fun m!37429 () Bool)

(assert (=> b!26075 m!37429))

(declare-fun m!37431 () Bool)

(assert (=> b!26075 m!37431))

(declare-fun m!37433 () Bool)

(assert (=> b!26075 m!37433))

(declare-fun m!37435 () Bool)

(assert (=> b!26075 m!37435))

(declare-fun m!37437 () Bool)

(assert (=> b!26075 m!37437))

(declare-fun m!37439 () Bool)

(assert (=> b!26075 m!37439))

(assert (=> b!26075 m!37405))

(declare-fun m!37443 () Bool)

(assert (=> b!26075 m!37443))

(declare-fun m!37445 () Bool)

(assert (=> b!26075 m!37445))

(assert (=> b!26075 m!36577))

(declare-fun m!37447 () Bool)

(assert (=> b!26075 m!37447))

(assert (=> b!26075 m!37431))

(declare-fun m!37449 () Bool)

(assert (=> b!26080 m!37449))

(declare-fun m!37451 () Bool)

(assert (=> b!26080 m!37451))

(declare-fun m!37453 () Bool)

(assert (=> bm!352 m!37453))

(declare-fun m!37455 () Bool)

(assert (=> b!26077 m!37455))

(declare-fun m!37457 () Bool)

(assert (=> d!7772 m!37457))

(assert (=> d!7772 m!36577))

(assert (=> d!7772 m!36985))

(assert (=> d!7772 m!36989))

(declare-fun m!37459 () Bool)

(assert (=> b!26076 m!37459))

(declare-fun m!37461 () Bool)

(assert (=> b!26074 m!37461))

(declare-fun m!37463 () Bool)

(assert (=> b!26074 m!37463))

(declare-fun m!37465 () Bool)

(assert (=> b!26074 m!37465))

(declare-fun m!37467 () Bool)

(assert (=> b!26074 m!37467))

(declare-fun m!37469 () Bool)

(assert (=> b!26074 m!37469))

(assert (=> b!25631 d!7772))

(declare-fun d!7836 () Bool)

(declare-fun res!22456 () Bool)

(declare-fun e!17733 () Bool)

(assert (=> d!7836 (=> (not res!22456) (not e!17733))))

(assert (=> d!7836 (= res!22456 (= (size!719 (buf!1043 thiss!1379)) (size!719 (buf!1043 (_2!1528 lt!36721)))))))

(assert (=> d!7836 (= (isPrefixOf!0 thiss!1379 (_2!1528 lt!36721)) e!17733)))

(declare-fun b!26091 () Bool)

(declare-fun res!22457 () Bool)

(assert (=> b!26091 (=> (not res!22457) (not e!17733))))

(assert (=> b!26091 (= res!22457 (bvsle (bitIndex!0 (size!719 (buf!1043 thiss!1379)) (currentByte!2362 thiss!1379) (currentBit!2357 thiss!1379)) (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!36721))) (currentByte!2362 (_2!1528 lt!36721)) (currentBit!2357 (_2!1528 lt!36721)))))))

(declare-fun b!26092 () Bool)

(declare-fun e!17732 () Bool)

(assert (=> b!26092 (= e!17733 e!17732)))

(declare-fun res!22458 () Bool)

(assert (=> b!26092 (=> res!22458 e!17732)))

(assert (=> b!26092 (= res!22458 (= (size!719 (buf!1043 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!26093 () Bool)

(assert (=> b!26093 (= e!17732 (arrayBitRangesEq!0 (buf!1043 thiss!1379) (buf!1043 (_2!1528 lt!36721)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!719 (buf!1043 thiss!1379)) (currentByte!2362 thiss!1379) (currentBit!2357 thiss!1379))))))

(assert (= (and d!7836 res!22456) b!26091))

(assert (= (and b!26091 res!22457) b!26092))

(assert (= (and b!26092 (not res!22458)) b!26093))

(assert (=> b!26091 m!36615))

(assert (=> b!26091 m!36573))

(assert (=> b!26093 m!36615))

(assert (=> b!26093 m!36615))

(declare-fun m!37473 () Bool)

(assert (=> b!26093 m!37473))

(assert (=> b!25631 d!7836))

(declare-fun d!7838 () Bool)

(declare-fun res!22459 () Bool)

(declare-fun e!17735 () Bool)

(assert (=> d!7838 (=> (not res!22459) (not e!17735))))

(assert (=> d!7838 (= res!22459 (= (size!719 (buf!1043 (_2!1528 lt!36717))) (size!719 (buf!1043 (_2!1528 lt!36721)))))))

(assert (=> d!7838 (= (isPrefixOf!0 (_2!1528 lt!36717) (_2!1528 lt!36721)) e!17735)))

(declare-fun b!26094 () Bool)

(declare-fun res!22460 () Bool)

(assert (=> b!26094 (=> (not res!22460) (not e!17735))))

(assert (=> b!26094 (= res!22460 (bvsle (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!36717))) (currentByte!2362 (_2!1528 lt!36717)) (currentBit!2357 (_2!1528 lt!36717))) (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!36721))) (currentByte!2362 (_2!1528 lt!36721)) (currentBit!2357 (_2!1528 lt!36721)))))))

(declare-fun b!26095 () Bool)

(declare-fun e!17734 () Bool)

(assert (=> b!26095 (= e!17735 e!17734)))

(declare-fun res!22461 () Bool)

(assert (=> b!26095 (=> res!22461 e!17734)))

(assert (=> b!26095 (= res!22461 (= (size!719 (buf!1043 (_2!1528 lt!36717))) #b00000000000000000000000000000000))))

(declare-fun b!26096 () Bool)

(assert (=> b!26096 (= e!17734 (arrayBitRangesEq!0 (buf!1043 (_2!1528 lt!36717)) (buf!1043 (_2!1528 lt!36721)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!36717))) (currentByte!2362 (_2!1528 lt!36717)) (currentBit!2357 (_2!1528 lt!36717)))))))

(assert (= (and d!7838 res!22459) b!26094))

(assert (= (and b!26094 res!22460) b!26095))

(assert (= (and b!26095 (not res!22461)) b!26096))

(assert (=> b!26094 m!36577))

(assert (=> b!26094 m!36573))

(assert (=> b!26096 m!36577))

(assert (=> b!26096 m!36577))

(declare-fun m!37475 () Bool)

(assert (=> b!26096 m!37475))

(assert (=> b!25631 d!7838))

(declare-fun b!26097 () Bool)

(declare-fun e!17737 () Unit!2111)

(declare-fun lt!37762 () Unit!2111)

(assert (=> b!26097 (= e!17737 lt!37762)))

(declare-fun lt!37766 () (_ BitVec 64))

(assert (=> b!26097 (= lt!37766 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!37757 () (_ BitVec 64))

(assert (=> b!26097 (= lt!37757 (bitIndex!0 (size!719 (buf!1043 thiss!1379)) (currentByte!2362 thiss!1379) (currentBit!2357 thiss!1379)))))

(assert (=> b!26097 (= lt!37762 (arrayBitRangesEqSymmetric!0 (buf!1043 thiss!1379) (buf!1043 (_2!1528 lt!36717)) lt!37766 lt!37757))))

(assert (=> b!26097 (arrayBitRangesEq!0 (buf!1043 (_2!1528 lt!36717)) (buf!1043 thiss!1379) lt!37766 lt!37757)))

(declare-fun b!26098 () Bool)

(declare-fun Unit!2146 () Unit!2111)

(assert (=> b!26098 (= e!17737 Unit!2146)))

(declare-fun d!7840 () Bool)

(declare-fun e!17736 () Bool)

(assert (=> d!7840 e!17736))

(declare-fun res!22462 () Bool)

(assert (=> d!7840 (=> (not res!22462) (not e!17736))))

(declare-fun lt!37748 () tuple2!2884)

(assert (=> d!7840 (= res!22462 (isPrefixOf!0 (_1!1529 lt!37748) (_2!1529 lt!37748)))))

(declare-fun lt!37764 () BitStream!1270)

(assert (=> d!7840 (= lt!37748 (tuple2!2885 lt!37764 (_2!1528 lt!36717)))))

(declare-fun lt!37759 () Unit!2111)

(declare-fun lt!37750 () Unit!2111)

(assert (=> d!7840 (= lt!37759 lt!37750)))

(assert (=> d!7840 (isPrefixOf!0 lt!37764 (_2!1528 lt!36717))))

(assert (=> d!7840 (= lt!37750 (lemmaIsPrefixTransitive!0 lt!37764 (_2!1528 lt!36717) (_2!1528 lt!36717)))))

(declare-fun lt!37753 () Unit!2111)

(declare-fun lt!37758 () Unit!2111)

(assert (=> d!7840 (= lt!37753 lt!37758)))

(assert (=> d!7840 (isPrefixOf!0 lt!37764 (_2!1528 lt!36717))))

(assert (=> d!7840 (= lt!37758 (lemmaIsPrefixTransitive!0 lt!37764 thiss!1379 (_2!1528 lt!36717)))))

(declare-fun lt!37754 () Unit!2111)

(assert (=> d!7840 (= lt!37754 e!17737)))

(declare-fun c!1776 () Bool)

(assert (=> d!7840 (= c!1776 (not (= (size!719 (buf!1043 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!37760 () Unit!2111)

(declare-fun lt!37765 () Unit!2111)

(assert (=> d!7840 (= lt!37760 lt!37765)))

(assert (=> d!7840 (isPrefixOf!0 (_2!1528 lt!36717) (_2!1528 lt!36717))))

(assert (=> d!7840 (= lt!37765 (lemmaIsPrefixRefl!0 (_2!1528 lt!36717)))))

(declare-fun lt!37763 () Unit!2111)

(declare-fun lt!37745 () Unit!2111)

(assert (=> d!7840 (= lt!37763 lt!37745)))

(assert (=> d!7840 (= lt!37745 (lemmaIsPrefixRefl!0 (_2!1528 lt!36717)))))

(declare-fun lt!37756 () Unit!2111)

(declare-fun lt!37752 () Unit!2111)

(assert (=> d!7840 (= lt!37756 lt!37752)))

(assert (=> d!7840 (isPrefixOf!0 lt!37764 lt!37764)))

(assert (=> d!7840 (= lt!37752 (lemmaIsPrefixRefl!0 lt!37764))))

(declare-fun lt!37749 () Unit!2111)

(declare-fun lt!37755 () Unit!2111)

(assert (=> d!7840 (= lt!37749 lt!37755)))

(assert (=> d!7840 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!7840 (= lt!37755 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!7840 (= lt!37764 (BitStream!1271 (buf!1043 (_2!1528 lt!36717)) (currentByte!2362 thiss!1379) (currentBit!2357 thiss!1379)))))

(assert (=> d!7840 (isPrefixOf!0 thiss!1379 (_2!1528 lt!36717))))

(assert (=> d!7840 (= (reader!0 thiss!1379 (_2!1528 lt!36717)) lt!37748)))

(declare-fun b!26099 () Bool)

(declare-fun lt!37751 () (_ BitVec 64))

(declare-fun lt!37761 () (_ BitVec 64))

(assert (=> b!26099 (= e!17736 (= (_1!1529 lt!37748) (withMovedBitIndex!0 (_2!1529 lt!37748) (bvsub lt!37761 lt!37751))))))

(assert (=> b!26099 (or (= (bvand lt!37761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!37751 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!37761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!37761 lt!37751) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!26099 (= lt!37751 (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!36717))) (currentByte!2362 (_2!1528 lt!36717)) (currentBit!2357 (_2!1528 lt!36717))))))

(assert (=> b!26099 (= lt!37761 (bitIndex!0 (size!719 (buf!1043 thiss!1379)) (currentByte!2362 thiss!1379) (currentBit!2357 thiss!1379)))))

(declare-fun b!26100 () Bool)

(declare-fun res!22463 () Bool)

(assert (=> b!26100 (=> (not res!22463) (not e!17736))))

(assert (=> b!26100 (= res!22463 (isPrefixOf!0 (_1!1529 lt!37748) thiss!1379))))

(declare-fun b!26101 () Bool)

(declare-fun res!22464 () Bool)

(assert (=> b!26101 (=> (not res!22464) (not e!17736))))

(assert (=> b!26101 (= res!22464 (isPrefixOf!0 (_2!1529 lt!37748) (_2!1528 lt!36717)))))

(assert (= (and d!7840 c!1776) b!26097))

(assert (= (and d!7840 (not c!1776)) b!26098))

(assert (= (and d!7840 res!22462) b!26100))

(assert (= (and b!26100 res!22463) b!26101))

(assert (= (and b!26101 res!22464) b!26099))

(declare-fun m!37479 () Bool)

(assert (=> d!7840 m!37479))

(declare-fun m!37481 () Bool)

(assert (=> d!7840 m!37481))

(declare-fun m!37483 () Bool)

(assert (=> d!7840 m!37483))

(assert (=> d!7840 m!36989))

(declare-fun m!37485 () Bool)

(assert (=> d!7840 m!37485))

(assert (=> d!7840 m!36565))

(assert (=> d!7840 m!36985))

(declare-fun m!37487 () Bool)

(assert (=> d!7840 m!37487))

(assert (=> d!7840 m!36611))

(declare-fun m!37489 () Bool)

(assert (=> d!7840 m!37489))

(assert (=> d!7840 m!36613))

(assert (=> b!26097 m!36615))

(declare-fun m!37491 () Bool)

(assert (=> b!26097 m!37491))

(declare-fun m!37493 () Bool)

(assert (=> b!26097 m!37493))

(declare-fun m!37495 () Bool)

(assert (=> b!26100 m!37495))

(declare-fun m!37497 () Bool)

(assert (=> b!26099 m!37497))

(assert (=> b!26099 m!36577))

(assert (=> b!26099 m!36615))

(declare-fun m!37499 () Bool)

(assert (=> b!26101 m!37499))

(assert (=> b!25631 d!7840))

(declare-fun d!7846 () Bool)

(assert (=> d!7846 (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36717)))) ((_ sign_extend 32) (currentByte!2362 thiss!1379)) ((_ sign_extend 32) (currentBit!2357 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!37780 () Unit!2111)

(assert (=> d!7846 (= lt!37780 (choose!9 thiss!1379 (buf!1043 (_2!1528 lt!36717)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1271 (buf!1043 (_2!1528 lt!36717)) (currentByte!2362 thiss!1379) (currentBit!2357 thiss!1379))))))

(assert (=> d!7846 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1043 (_2!1528 lt!36717)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!37780)))

(declare-fun bs!2247 () Bool)

(assert (= bs!2247 d!7846))

(assert (=> bs!2247 m!36617))

(declare-fun m!37503 () Bool)

(assert (=> bs!2247 m!37503))

(assert (=> b!25631 d!7846))

(declare-fun d!7848 () Bool)

(assert (=> d!7848 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36717)))) ((_ sign_extend 32) (currentByte!2362 thiss!1379)) ((_ sign_extend 32) (currentBit!2357 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36717)))) ((_ sign_extend 32) (currentByte!2362 thiss!1379)) ((_ sign_extend 32) (currentBit!2357 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2248 () Bool)

(assert (= bs!2248 d!7848))

(declare-fun m!37505 () Bool)

(assert (=> bs!2248 m!37505))

(assert (=> b!25631 d!7848))

(declare-fun d!7850 () Bool)

(declare-fun e!17740 () Bool)

(assert (=> d!7850 e!17740))

(declare-fun res!22470 () Bool)

(assert (=> d!7850 (=> (not res!22470) (not e!17740))))

(declare-fun lt!37786 () (_ BitVec 64))

(declare-fun lt!37781 () (_ BitVec 64))

(declare-fun lt!37784 () (_ BitVec 64))

(assert (=> d!7850 (= res!22470 (= lt!37781 (bvsub lt!37786 lt!37784)))))

(assert (=> d!7850 (or (= (bvand lt!37786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!37784 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!37786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!37786 lt!37784) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7850 (= lt!37784 (remainingBits!0 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36721)))) ((_ sign_extend 32) (currentByte!2362 (_2!1528 lt!36721))) ((_ sign_extend 32) (currentBit!2357 (_2!1528 lt!36721)))))))

(declare-fun lt!37782 () (_ BitVec 64))

(declare-fun lt!37785 () (_ BitVec 64))

(assert (=> d!7850 (= lt!37786 (bvmul lt!37782 lt!37785))))

(assert (=> d!7850 (or (= lt!37782 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!37785 (bvsdiv (bvmul lt!37782 lt!37785) lt!37782)))))

(assert (=> d!7850 (= lt!37785 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7850 (= lt!37782 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36721)))))))

(assert (=> d!7850 (= lt!37781 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2362 (_2!1528 lt!36721))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2357 (_2!1528 lt!36721)))))))

(assert (=> d!7850 (invariant!0 (currentBit!2357 (_2!1528 lt!36721)) (currentByte!2362 (_2!1528 lt!36721)) (size!719 (buf!1043 (_2!1528 lt!36721))))))

(assert (=> d!7850 (= (bitIndex!0 (size!719 (buf!1043 (_2!1528 lt!36721))) (currentByte!2362 (_2!1528 lt!36721)) (currentBit!2357 (_2!1528 lt!36721))) lt!37781)))

(declare-fun b!26106 () Bool)

(declare-fun res!22469 () Bool)

(assert (=> b!26106 (=> (not res!22469) (not e!17740))))

(assert (=> b!26106 (= res!22469 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!37781))))

(declare-fun b!26107 () Bool)

(declare-fun lt!37783 () (_ BitVec 64))

(assert (=> b!26107 (= e!17740 (bvsle lt!37781 (bvmul lt!37783 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!26107 (or (= lt!37783 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!37783 #b0000000000000000000000000000000000000000000000000000000000001000) lt!37783)))))

(assert (=> b!26107 (= lt!37783 ((_ sign_extend 32) (size!719 (buf!1043 (_2!1528 lt!36721)))))))

(assert (= (and d!7850 res!22470) b!26106))

(assert (= (and b!26106 res!22469) b!26107))

(declare-fun m!37507 () Bool)

(assert (=> d!7850 m!37507))

(assert (=> d!7850 m!36571))

(assert (=> b!25629 d!7850))

(declare-fun d!7852 () Bool)

(assert (=> d!7852 (= (invariant!0 (currentBit!2357 (_2!1528 lt!36717)) (currentByte!2362 (_2!1528 lt!36717)) (size!719 (buf!1043 (_2!1528 lt!36717)))) (and (bvsge (currentBit!2357 (_2!1528 lt!36717)) #b00000000000000000000000000000000) (bvslt (currentBit!2357 (_2!1528 lt!36717)) #b00000000000000000000000000001000) (bvsge (currentByte!2362 (_2!1528 lt!36717)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2362 (_2!1528 lt!36717)) (size!719 (buf!1043 (_2!1528 lt!36717)))) (and (= (currentBit!2357 (_2!1528 lt!36717)) #b00000000000000000000000000000000) (= (currentByte!2362 (_2!1528 lt!36717)) (size!719 (buf!1043 (_2!1528 lt!36717))))))))))

(assert (=> b!25640 d!7852))

(push 1)

(assert (not b!25926))

(assert (not b!26091))

(assert (not b!26075))

(assert (not b!25860))

(assert (not d!7734))

(assert (not d!7712))

(assert (not d!7772))

(assert (not b!25924))

(assert (not b!26094))

(assert (not b!26079))

(assert (not b!25861))

(assert (not b!25910))

(assert (not d!7710))

(assert (not b!25907))

(assert (not b!25911))

(assert (not b!25841))

(assert (not d!7848))

(assert (not d!7846))

(assert (not b!25916))

(assert (not b!25912))

(assert (not b!25927))

(assert (not b!25857))

(assert (not b!26076))

(assert (not d!7708))

(assert (not b!26100))

(assert (not b!26099))

(assert (not b!26101))

(assert (not d!7840))

(assert (not d!7736))

(assert (not b!26077))

(assert (not b!25909))

(assert (not d!7722))

(assert (not b!25856))

(assert (not d!7716))

(assert (not bm!352))

(assert (not d!7730))

(assert (not d!7760))

(assert (not b!25839))

(assert (not b!25855))

(assert (not b!26074))

(assert (not b!26096))

(assert (not b!26093))

(assert (not d!7718))

(assert (not b!25870))

(assert (not d!7750))

(assert (not b!25873))

(assert (not b!25906))

(assert (not b!25852))

(assert (not d!7758))

(assert (not d!7724))

(assert (not b!25928))

(assert (not b!25913))

(assert (not b!26080))

(assert (not d!7714))

(assert (not d!7850))

(assert (not b!25840))

(assert (not b!25859))

(assert (not b!25914))

(assert (not b!25908))

(assert (not b!26097))

(assert (not d!7770))

(assert (not b!25868))

(assert (not b!25854))

(assert (not d!7738))

(check-sat)

(pop 1)

(push 1)

(check-sat)

