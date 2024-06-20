; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5710 () Bool)

(assert start!5710)

(declare-fun b!24546 () Bool)

(declare-fun res!21199 () Bool)

(declare-fun e!16737 () Bool)

(assert (=> b!24546 (=> res!21199 e!16737)))

(declare-datatypes ((array!1633 0))(
  ( (array!1634 (arr!1158 (Array (_ BitVec 32) (_ BitVec 8))) (size!702 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1236 0))(
  ( (BitStream!1237 (buf!1023 array!1633) (currentByte!2336 (_ BitVec 32)) (currentBit!2331 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2047 0))(
  ( (Unit!2048) )
))
(declare-datatypes ((tuple2!2790 0))(
  ( (tuple2!2791 (_1!1482 Unit!2047) (_2!1482 BitStream!1236)) )
))
(declare-fun lt!35033 () tuple2!2790)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24546 (= res!21199 (not (invariant!0 (currentBit!2331 (_2!1482 lt!35033)) (currentByte!2336 (_2!1482 lt!35033)) (size!702 (buf!1023 (_2!1482 lt!35033))))))))

(declare-fun b!24547 () Bool)

(declare-fun e!16740 () Bool)

(declare-fun e!16741 () Bool)

(assert (=> b!24547 (= e!16740 e!16741)))

(declare-fun res!21195 () Bool)

(assert (=> b!24547 (=> res!21195 e!16741)))

(declare-fun lt!35026 () tuple2!2790)

(declare-fun isPrefixOf!0 (BitStream!1236 BitStream!1236) Bool)

(assert (=> b!24547 (= res!21195 (not (isPrefixOf!0 (_2!1482 lt!35026) (_2!1482 lt!35033))))))

(declare-fun thiss!1379 () BitStream!1236)

(assert (=> b!24547 (isPrefixOf!0 thiss!1379 (_2!1482 lt!35033))))

(declare-fun lt!35032 () Unit!2047)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1236 BitStream!1236 BitStream!1236) Unit!2047)

(assert (=> b!24547 (= lt!35032 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1482 lt!35026) (_2!1482 lt!35033)))))

(declare-fun srcBuffer!2 () array!1633)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1236 array!1633 (_ BitVec 64) (_ BitVec 64)) tuple2!2790)

(assert (=> b!24547 (= lt!35033 (appendBitsMSBFirstLoop!0 (_2!1482 lt!35026) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!16743 () Bool)

(assert (=> b!24547 e!16743))

(declare-fun res!21189 () Bool)

(assert (=> b!24547 (=> (not res!21189) (not e!16743))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24547 (= res!21189 (validate_offset_bits!1 ((_ sign_extend 32) (size!702 (buf!1023 (_2!1482 lt!35026)))) ((_ sign_extend 32) (currentByte!2336 thiss!1379)) ((_ sign_extend 32) (currentBit!2331 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35035 () Unit!2047)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1236 array!1633 (_ BitVec 64)) Unit!2047)

(assert (=> b!24547 (= lt!35035 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1023 (_2!1482 lt!35026)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2792 0))(
  ( (tuple2!2793 (_1!1483 BitStream!1236) (_2!1483 BitStream!1236)) )
))
(declare-fun lt!35029 () tuple2!2792)

(declare-fun reader!0 (BitStream!1236 BitStream!1236) tuple2!2792)

(assert (=> b!24547 (= lt!35029 (reader!0 thiss!1379 (_2!1482 lt!35026)))))

(declare-fun b!24548 () Bool)

(declare-fun e!16738 () Bool)

(assert (=> b!24548 (= e!16738 e!16740)))

(declare-fun res!21198 () Bool)

(assert (=> b!24548 (=> res!21198 e!16740)))

(assert (=> b!24548 (= res!21198 (not (isPrefixOf!0 thiss!1379 (_2!1482 lt!35026))))))

(declare-fun lt!35023 () (_ BitVec 64))

(assert (=> b!24548 (validate_offset_bits!1 ((_ sign_extend 32) (size!702 (buf!1023 (_2!1482 lt!35026)))) ((_ sign_extend 32) (currentByte!2336 (_2!1482 lt!35026))) ((_ sign_extend 32) (currentBit!2331 (_2!1482 lt!35026))) lt!35023)))

(assert (=> b!24548 (= lt!35023 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35028 () Unit!2047)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1236 BitStream!1236 (_ BitVec 64) (_ BitVec 64)) Unit!2047)

(assert (=> b!24548 (= lt!35028 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1482 lt!35026) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1236 (_ BitVec 8) (_ BitVec 32)) tuple2!2790)

(assert (=> b!24548 (= lt!35026 (appendBitFromByte!0 thiss!1379 (select (arr!1158 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!24549 () Bool)

(declare-fun res!21201 () Bool)

(assert (=> b!24549 (=> res!21201 e!16737)))

(assert (=> b!24549 (= res!21201 (not (= (size!702 (buf!1023 thiss!1379)) (size!702 (buf!1023 (_2!1482 lt!35033))))))))

(declare-fun b!24550 () Bool)

(declare-fun res!21194 () Bool)

(declare-fun e!16747 () Bool)

(assert (=> b!24550 (=> res!21194 e!16747)))

(assert (=> b!24550 (= res!21194 (not (invariant!0 (currentBit!2331 (_2!1482 lt!35026)) (currentByte!2336 (_2!1482 lt!35026)) (size!702 (buf!1023 (_2!1482 lt!35033))))))))

(declare-fun b!24551 () Bool)

(assert (=> b!24551 (= e!16741 e!16737)))

(declare-fun res!21191 () Bool)

(assert (=> b!24551 (=> res!21191 e!16737)))

(declare-fun lt!35030 () (_ BitVec 64))

(declare-fun lt!35025 () (_ BitVec 64))

(assert (=> b!24551 (= res!21191 (not (= lt!35030 (bvsub (bvadd lt!35025 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24551 (= lt!35030 (bitIndex!0 (size!702 (buf!1023 (_2!1482 lt!35033))) (currentByte!2336 (_2!1482 lt!35033)) (currentBit!2331 (_2!1482 lt!35033))))))

(declare-fun res!21193 () Bool)

(declare-fun e!16746 () Bool)

(assert (=> start!5710 (=> (not res!21193) (not e!16746))))

(assert (=> start!5710 (= res!21193 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!702 srcBuffer!2))))))))

(assert (=> start!5710 e!16746))

(assert (=> start!5710 true))

(declare-fun array_inv!671 (array!1633) Bool)

(assert (=> start!5710 (array_inv!671 srcBuffer!2)))

(declare-fun e!16745 () Bool)

(declare-fun inv!12 (BitStream!1236) Bool)

(assert (=> start!5710 (and (inv!12 thiss!1379) e!16745)))

(declare-fun b!24552 () Bool)

(assert (=> b!24552 (= e!16737 e!16747)))

(declare-fun res!21196 () Bool)

(assert (=> b!24552 (=> res!21196 e!16747)))

(assert (=> b!24552 (= res!21196 (not (= (size!702 (buf!1023 (_2!1482 lt!35026))) (size!702 (buf!1023 (_2!1482 lt!35033))))))))

(declare-fun e!16742 () Bool)

(assert (=> b!24552 e!16742))

(declare-fun res!21200 () Bool)

(assert (=> b!24552 (=> (not res!21200) (not e!16742))))

(assert (=> b!24552 (= res!21200 (= (size!702 (buf!1023 (_2!1482 lt!35033))) (size!702 (buf!1023 thiss!1379))))))

(declare-fun b!24553 () Bool)

(assert (=> b!24553 (= e!16742 (= lt!35030 (bvsub (bvsub (bvadd (bitIndex!0 (size!702 (buf!1023 (_2!1482 lt!35026))) (currentByte!2336 (_2!1482 lt!35026)) (currentBit!2331 (_2!1482 lt!35026))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!24554 () Bool)

(assert (=> b!24554 (= e!16746 (not e!16738))))

(declare-fun res!21197 () Bool)

(assert (=> b!24554 (=> res!21197 e!16738)))

(assert (=> b!24554 (= res!21197 (bvsge i!635 to!314))))

(assert (=> b!24554 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!35031 () Unit!2047)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1236) Unit!2047)

(assert (=> b!24554 (= lt!35031 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!24554 (= lt!35025 (bitIndex!0 (size!702 (buf!1023 thiss!1379)) (currentByte!2336 thiss!1379) (currentBit!2331 thiss!1379)))))

(declare-fun b!24555 () Bool)

(assert (=> b!24555 (= e!16747 true)))

(assert (=> b!24555 (validate_offset_bits!1 ((_ sign_extend 32) (size!702 (buf!1023 (_2!1482 lt!35033)))) ((_ sign_extend 32) (currentByte!2336 (_2!1482 lt!35026))) ((_ sign_extend 32) (currentBit!2331 (_2!1482 lt!35026))) lt!35023)))

(declare-fun lt!35027 () Unit!2047)

(assert (=> b!24555 (= lt!35027 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1482 lt!35026) (buf!1023 (_2!1482 lt!35033)) lt!35023))))

(declare-fun lt!35034 () tuple2!2792)

(assert (=> b!24555 (= lt!35034 (reader!0 (_2!1482 lt!35026) (_2!1482 lt!35033)))))

(assert (=> b!24555 (validate_offset_bits!1 ((_ sign_extend 32) (size!702 (buf!1023 (_2!1482 lt!35033)))) ((_ sign_extend 32) (currentByte!2336 thiss!1379)) ((_ sign_extend 32) (currentBit!2331 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!35022 () Unit!2047)

(assert (=> b!24555 (= lt!35022 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1023 (_2!1482 lt!35033)) (bvsub to!314 i!635)))))

(declare-fun lt!35024 () tuple2!2792)

(assert (=> b!24555 (= lt!35024 (reader!0 thiss!1379 (_2!1482 lt!35033)))))

(declare-fun b!24556 () Bool)

(declare-fun res!21190 () Bool)

(assert (=> b!24556 (=> res!21190 e!16747)))

(assert (=> b!24556 (= res!21190 (not (invariant!0 (currentBit!2331 (_2!1482 lt!35026)) (currentByte!2336 (_2!1482 lt!35026)) (size!702 (buf!1023 (_2!1482 lt!35026))))))))

(declare-fun b!24557 () Bool)

(declare-fun res!21192 () Bool)

(assert (=> b!24557 (=> (not res!21192) (not e!16746))))

(assert (=> b!24557 (= res!21192 (validate_offset_bits!1 ((_ sign_extend 32) (size!702 (buf!1023 thiss!1379))) ((_ sign_extend 32) (currentByte!2336 thiss!1379)) ((_ sign_extend 32) (currentBit!2331 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!24558 () Bool)

(assert (=> b!24558 (= e!16745 (array_inv!671 (buf!1023 thiss!1379)))))

(declare-fun b!24559 () Bool)

(declare-datatypes ((List!319 0))(
  ( (Nil!316) (Cons!315 (h!434 Bool) (t!1069 List!319)) )
))
(declare-fun head!156 (List!319) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1236 array!1633 (_ BitVec 64) (_ BitVec 64)) List!319)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1236 BitStream!1236 (_ BitVec 64)) List!319)

(assert (=> b!24559 (= e!16743 (= (head!156 (byteArrayBitContentToList!0 (_2!1482 lt!35026) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!156 (bitStreamReadBitsIntoList!0 (_2!1482 lt!35026) (_1!1483 lt!35029) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!5710 res!21193) b!24557))

(assert (= (and b!24557 res!21192) b!24554))

(assert (= (and b!24554 (not res!21197)) b!24548))

(assert (= (and b!24548 (not res!21198)) b!24547))

(assert (= (and b!24547 res!21189) b!24559))

(assert (= (and b!24547 (not res!21195)) b!24551))

(assert (= (and b!24551 (not res!21191)) b!24546))

(assert (= (and b!24546 (not res!21199)) b!24549))

(assert (= (and b!24549 (not res!21201)) b!24552))

(assert (= (and b!24552 res!21200) b!24553))

(assert (= (and b!24552 (not res!21196)) b!24556))

(assert (= (and b!24556 (not res!21190)) b!24550))

(assert (= (and b!24550 (not res!21194)) b!24555))

(assert (= start!5710 b!24558))

(declare-fun m!34685 () Bool)

(assert (=> b!24554 m!34685))

(declare-fun m!34687 () Bool)

(assert (=> b!24554 m!34687))

(declare-fun m!34689 () Bool)

(assert (=> b!24554 m!34689))

(declare-fun m!34691 () Bool)

(assert (=> b!24555 m!34691))

(declare-fun m!34693 () Bool)

(assert (=> b!24555 m!34693))

(declare-fun m!34695 () Bool)

(assert (=> b!24555 m!34695))

(declare-fun m!34697 () Bool)

(assert (=> b!24555 m!34697))

(declare-fun m!34699 () Bool)

(assert (=> b!24555 m!34699))

(declare-fun m!34701 () Bool)

(assert (=> b!24555 m!34701))

(declare-fun m!34703 () Bool)

(assert (=> b!24547 m!34703))

(declare-fun m!34705 () Bool)

(assert (=> b!24547 m!34705))

(declare-fun m!34707 () Bool)

(assert (=> b!24547 m!34707))

(declare-fun m!34709 () Bool)

(assert (=> b!24547 m!34709))

(declare-fun m!34711 () Bool)

(assert (=> b!24547 m!34711))

(declare-fun m!34713 () Bool)

(assert (=> b!24547 m!34713))

(declare-fun m!34715 () Bool)

(assert (=> b!24547 m!34715))

(declare-fun m!34717 () Bool)

(assert (=> b!24551 m!34717))

(declare-fun m!34719 () Bool)

(assert (=> b!24548 m!34719))

(declare-fun m!34721 () Bool)

(assert (=> b!24548 m!34721))

(declare-fun m!34723 () Bool)

(assert (=> b!24548 m!34723))

(assert (=> b!24548 m!34721))

(declare-fun m!34725 () Bool)

(assert (=> b!24548 m!34725))

(declare-fun m!34727 () Bool)

(assert (=> b!24548 m!34727))

(declare-fun m!34729 () Bool)

(assert (=> b!24557 m!34729))

(declare-fun m!34731 () Bool)

(assert (=> b!24559 m!34731))

(assert (=> b!24559 m!34731))

(declare-fun m!34733 () Bool)

(assert (=> b!24559 m!34733))

(declare-fun m!34735 () Bool)

(assert (=> b!24559 m!34735))

(assert (=> b!24559 m!34735))

(declare-fun m!34737 () Bool)

(assert (=> b!24559 m!34737))

(declare-fun m!34739 () Bool)

(assert (=> b!24546 m!34739))

(declare-fun m!34741 () Bool)

(assert (=> b!24556 m!34741))

(declare-fun m!34743 () Bool)

(assert (=> b!24550 m!34743))

(declare-fun m!34745 () Bool)

(assert (=> b!24553 m!34745))

(declare-fun m!34747 () Bool)

(assert (=> start!5710 m!34747))

(declare-fun m!34749 () Bool)

(assert (=> start!5710 m!34749))

(declare-fun m!34751 () Bool)

(assert (=> b!24558 m!34751))

(check-sat (not b!24546) (not b!24554) (not b!24547) (not b!24557) (not b!24559) (not b!24550) (not b!24553) (not b!24556) (not b!24558) (not b!24555) (not b!24551) (not start!5710) (not b!24548))
