; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5682 () Bool)

(assert start!5682)

(declare-fun lt!34445 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!1605 0))(
  ( (array!1606 (arr!1144 (Array (_ BitVec 32) (_ BitVec 8))) (size!688 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1208 0))(
  ( (BitStream!1209 (buf!1009 array!1605) (currentByte!2322 (_ BitVec 32)) (currentBit!2317 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2019 0))(
  ( (Unit!2020) )
))
(declare-datatypes ((tuple2!2734 0))(
  ( (tuple2!2735 (_1!1454 Unit!2019) (_2!1454 BitStream!1208)) )
))
(declare-fun lt!34438 () tuple2!2734)

(declare-fun b!23958 () Bool)

(declare-fun e!16284 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23958 (= e!16284 (= lt!34445 (bvsub (bvsub (bvadd (bitIndex!0 (size!688 (buf!1009 (_2!1454 lt!34438))) (currentByte!2322 (_2!1454 lt!34438)) (currentBit!2317 (_2!1454 lt!34438))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!23959 () Bool)

(declare-fun res!20653 () Bool)

(declare-fun e!16277 () Bool)

(assert (=> b!23959 (=> res!20653 e!16277)))

(declare-fun lt!34444 () tuple2!2734)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23959 (= res!20653 (not (invariant!0 (currentBit!2317 (_2!1454 lt!34438)) (currentByte!2322 (_2!1454 lt!34438)) (size!688 (buf!1009 (_2!1454 lt!34444))))))))

(declare-fun res!20650 () Bool)

(declare-fun e!16283 () Bool)

(assert (=> start!5682 (=> (not res!20650) (not e!16283))))

(declare-fun srcBuffer!2 () array!1605)

(assert (=> start!5682 (= res!20650 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!688 srcBuffer!2))))))))

(assert (=> start!5682 e!16283))

(assert (=> start!5682 true))

(declare-fun array_inv!657 (array!1605) Bool)

(assert (=> start!5682 (array_inv!657 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!1208)

(declare-fun e!16280 () Bool)

(declare-fun inv!12 (BitStream!1208) Bool)

(assert (=> start!5682 (and (inv!12 thiss!1379) e!16280)))

(declare-fun b!23960 () Bool)

(declare-fun res!20644 () Bool)

(assert (=> b!23960 (=> res!20644 e!16277)))

(assert (=> b!23960 (= res!20644 (not (invariant!0 (currentBit!2317 (_2!1454 lt!34438)) (currentByte!2322 (_2!1454 lt!34438)) (size!688 (buf!1009 (_2!1454 lt!34438))))))))

(declare-fun b!23961 () Bool)

(assert (=> b!23961 (= e!16280 (array_inv!657 (buf!1009 thiss!1379)))))

(declare-fun b!23962 () Bool)

(declare-fun e!16275 () Bool)

(declare-fun e!16278 () Bool)

(assert (=> b!23962 (= e!16275 e!16278)))

(declare-fun res!20648 () Bool)

(assert (=> b!23962 (=> res!20648 e!16278)))

(declare-fun isPrefixOf!0 (BitStream!1208 BitStream!1208) Bool)

(assert (=> b!23962 (= res!20648 (not (isPrefixOf!0 thiss!1379 (_2!1454 lt!34438))))))

(declare-fun lt!34443 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23962 (validate_offset_bits!1 ((_ sign_extend 32) (size!688 (buf!1009 (_2!1454 lt!34438)))) ((_ sign_extend 32) (currentByte!2322 (_2!1454 lt!34438))) ((_ sign_extend 32) (currentBit!2317 (_2!1454 lt!34438))) lt!34443)))

(assert (=> b!23962 (= lt!34443 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34434 () Unit!2019)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1208 BitStream!1208 (_ BitVec 64) (_ BitVec 64)) Unit!2019)

(assert (=> b!23962 (= lt!34434 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1454 lt!34438) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1208 (_ BitVec 8) (_ BitVec 32)) tuple2!2734)

(assert (=> b!23962 (= lt!34438 (appendBitFromByte!0 thiss!1379 (select (arr!1144 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!23963 () Bool)

(declare-fun res!20647 () Bool)

(assert (=> b!23963 (=> (not res!20647) (not e!16283))))

(assert (=> b!23963 (= res!20647 (validate_offset_bits!1 ((_ sign_extend 32) (size!688 (buf!1009 thiss!1379))) ((_ sign_extend 32) (currentByte!2322 thiss!1379)) ((_ sign_extend 32) (currentBit!2317 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!23964 () Bool)

(declare-fun res!20645 () Bool)

(declare-fun e!16281 () Bool)

(assert (=> b!23964 (=> res!20645 e!16281)))

(assert (=> b!23964 (= res!20645 (not (invariant!0 (currentBit!2317 (_2!1454 lt!34444)) (currentByte!2322 (_2!1454 lt!34444)) (size!688 (buf!1009 (_2!1454 lt!34444))))))))

(declare-fun b!23965 () Bool)

(assert (=> b!23965 (= e!16283 (not e!16275))))

(declare-fun res!20651 () Bool)

(assert (=> b!23965 (=> res!20651 e!16275)))

(assert (=> b!23965 (= res!20651 (bvsge i!635 to!314))))

(assert (=> b!23965 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34441 () Unit!2019)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1208) Unit!2019)

(assert (=> b!23965 (= lt!34441 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!34435 () (_ BitVec 64))

(assert (=> b!23965 (= lt!34435 (bitIndex!0 (size!688 (buf!1009 thiss!1379)) (currentByte!2322 thiss!1379) (currentBit!2317 thiss!1379)))))

(declare-fun b!23966 () Bool)

(assert (=> b!23966 (= e!16277 true)))

(assert (=> b!23966 (validate_offset_bits!1 ((_ sign_extend 32) (size!688 (buf!1009 (_2!1454 lt!34444)))) ((_ sign_extend 32) (currentByte!2322 (_2!1454 lt!34438))) ((_ sign_extend 32) (currentBit!2317 (_2!1454 lt!34438))) lt!34443)))

(declare-fun lt!34442 () Unit!2019)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1208 array!1605 (_ BitVec 64)) Unit!2019)

(assert (=> b!23966 (= lt!34442 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1454 lt!34438) (buf!1009 (_2!1454 lt!34444)) lt!34443))))

(declare-datatypes ((tuple2!2736 0))(
  ( (tuple2!2737 (_1!1455 BitStream!1208) (_2!1455 BitStream!1208)) )
))
(declare-fun lt!34446 () tuple2!2736)

(declare-fun reader!0 (BitStream!1208 BitStream!1208) tuple2!2736)

(assert (=> b!23966 (= lt!34446 (reader!0 (_2!1454 lt!34438) (_2!1454 lt!34444)))))

(assert (=> b!23966 (validate_offset_bits!1 ((_ sign_extend 32) (size!688 (buf!1009 (_2!1454 lt!34444)))) ((_ sign_extend 32) (currentByte!2322 thiss!1379)) ((_ sign_extend 32) (currentBit!2317 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34447 () Unit!2019)

(assert (=> b!23966 (= lt!34447 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1009 (_2!1454 lt!34444)) (bvsub to!314 i!635)))))

(declare-fun lt!34440 () tuple2!2736)

(assert (=> b!23966 (= lt!34440 (reader!0 thiss!1379 (_2!1454 lt!34444)))))

(declare-fun b!23967 () Bool)

(declare-fun e!16282 () Bool)

(assert (=> b!23967 (= e!16282 e!16281)))

(declare-fun res!20654 () Bool)

(assert (=> b!23967 (=> res!20654 e!16281)))

(assert (=> b!23967 (= res!20654 (not (= lt!34445 (bvsub (bvadd lt!34435 to!314) i!635))))))

(assert (=> b!23967 (= lt!34445 (bitIndex!0 (size!688 (buf!1009 (_2!1454 lt!34444))) (currentByte!2322 (_2!1454 lt!34444)) (currentBit!2317 (_2!1454 lt!34444))))))

(declare-fun b!23968 () Bool)

(assert (=> b!23968 (= e!16281 e!16277)))

(declare-fun res!20643 () Bool)

(assert (=> b!23968 (=> res!20643 e!16277)))

(assert (=> b!23968 (= res!20643 (not (= (size!688 (buf!1009 (_2!1454 lt!34438))) (size!688 (buf!1009 (_2!1454 lt!34444))))))))

(assert (=> b!23968 e!16284))

(declare-fun res!20655 () Bool)

(assert (=> b!23968 (=> (not res!20655) (not e!16284))))

(assert (=> b!23968 (= res!20655 (= (size!688 (buf!1009 (_2!1454 lt!34444))) (size!688 (buf!1009 thiss!1379))))))

(declare-fun e!16279 () Bool)

(declare-fun b!23969 () Bool)

(declare-fun lt!34437 () tuple2!2736)

(declare-datatypes ((List!305 0))(
  ( (Nil!302) (Cons!301 (h!420 Bool) (t!1055 List!305)) )
))
(declare-fun head!142 (List!305) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1208 array!1605 (_ BitVec 64) (_ BitVec 64)) List!305)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1208 BitStream!1208 (_ BitVec 64)) List!305)

(assert (=> b!23969 (= e!16279 (= (head!142 (byteArrayBitContentToList!0 (_2!1454 lt!34438) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!142 (bitStreamReadBitsIntoList!0 (_2!1454 lt!34438) (_1!1455 lt!34437) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!23970 () Bool)

(assert (=> b!23970 (= e!16278 e!16282)))

(declare-fun res!20646 () Bool)

(assert (=> b!23970 (=> res!20646 e!16282)))

(assert (=> b!23970 (= res!20646 (not (isPrefixOf!0 (_2!1454 lt!34438) (_2!1454 lt!34444))))))

(assert (=> b!23970 (isPrefixOf!0 thiss!1379 (_2!1454 lt!34444))))

(declare-fun lt!34439 () Unit!2019)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1208 BitStream!1208 BitStream!1208) Unit!2019)

(assert (=> b!23970 (= lt!34439 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1454 lt!34438) (_2!1454 lt!34444)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1208 array!1605 (_ BitVec 64) (_ BitVec 64)) tuple2!2734)

(assert (=> b!23970 (= lt!34444 (appendBitsMSBFirstLoop!0 (_2!1454 lt!34438) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!23970 e!16279))

(declare-fun res!20649 () Bool)

(assert (=> b!23970 (=> (not res!20649) (not e!16279))))

(assert (=> b!23970 (= res!20649 (validate_offset_bits!1 ((_ sign_extend 32) (size!688 (buf!1009 (_2!1454 lt!34438)))) ((_ sign_extend 32) (currentByte!2322 thiss!1379)) ((_ sign_extend 32) (currentBit!2317 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34436 () Unit!2019)

(assert (=> b!23970 (= lt!34436 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1009 (_2!1454 lt!34438)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!23970 (= lt!34437 (reader!0 thiss!1379 (_2!1454 lt!34438)))))

(declare-fun b!23971 () Bool)

(declare-fun res!20652 () Bool)

(assert (=> b!23971 (=> res!20652 e!16281)))

(assert (=> b!23971 (= res!20652 (not (= (size!688 (buf!1009 thiss!1379)) (size!688 (buf!1009 (_2!1454 lt!34444))))))))

(assert (= (and start!5682 res!20650) b!23963))

(assert (= (and b!23963 res!20647) b!23965))

(assert (= (and b!23965 (not res!20651)) b!23962))

(assert (= (and b!23962 (not res!20648)) b!23970))

(assert (= (and b!23970 res!20649) b!23969))

(assert (= (and b!23970 (not res!20646)) b!23967))

(assert (= (and b!23967 (not res!20654)) b!23964))

(assert (= (and b!23964 (not res!20645)) b!23971))

(assert (= (and b!23971 (not res!20652)) b!23968))

(assert (= (and b!23968 res!20655) b!23958))

(assert (= (and b!23968 (not res!20643)) b!23960))

(assert (= (and b!23960 (not res!20644)) b!23959))

(assert (= (and b!23959 (not res!20653)) b!23966))

(assert (= start!5682 b!23961))

(declare-fun m!33733 () Bool)

(assert (=> b!23964 m!33733))

(declare-fun m!33735 () Bool)

(assert (=> b!23966 m!33735))

(declare-fun m!33737 () Bool)

(assert (=> b!23966 m!33737))

(declare-fun m!33739 () Bool)

(assert (=> b!23966 m!33739))

(declare-fun m!33741 () Bool)

(assert (=> b!23966 m!33741))

(declare-fun m!33743 () Bool)

(assert (=> b!23966 m!33743))

(declare-fun m!33745 () Bool)

(assert (=> b!23966 m!33745))

(declare-fun m!33747 () Bool)

(assert (=> b!23959 m!33747))

(declare-fun m!33749 () Bool)

(assert (=> b!23960 m!33749))

(declare-fun m!33751 () Bool)

(assert (=> b!23967 m!33751))

(declare-fun m!33753 () Bool)

(assert (=> start!5682 m!33753))

(declare-fun m!33755 () Bool)

(assert (=> start!5682 m!33755))

(declare-fun m!33757 () Bool)

(assert (=> b!23961 m!33757))

(declare-fun m!33759 () Bool)

(assert (=> b!23958 m!33759))

(declare-fun m!33761 () Bool)

(assert (=> b!23969 m!33761))

(assert (=> b!23969 m!33761))

(declare-fun m!33763 () Bool)

(assert (=> b!23969 m!33763))

(declare-fun m!33765 () Bool)

(assert (=> b!23969 m!33765))

(assert (=> b!23969 m!33765))

(declare-fun m!33767 () Bool)

(assert (=> b!23969 m!33767))

(declare-fun m!33769 () Bool)

(assert (=> b!23962 m!33769))

(declare-fun m!33771 () Bool)

(assert (=> b!23962 m!33771))

(declare-fun m!33773 () Bool)

(assert (=> b!23962 m!33773))

(declare-fun m!33775 () Bool)

(assert (=> b!23962 m!33775))

(assert (=> b!23962 m!33771))

(declare-fun m!33777 () Bool)

(assert (=> b!23962 m!33777))

(declare-fun m!33779 () Bool)

(assert (=> b!23965 m!33779))

(declare-fun m!33781 () Bool)

(assert (=> b!23965 m!33781))

(declare-fun m!33783 () Bool)

(assert (=> b!23965 m!33783))

(declare-fun m!33785 () Bool)

(assert (=> b!23970 m!33785))

(declare-fun m!33787 () Bool)

(assert (=> b!23970 m!33787))

(declare-fun m!33789 () Bool)

(assert (=> b!23970 m!33789))

(declare-fun m!33791 () Bool)

(assert (=> b!23970 m!33791))

(declare-fun m!33793 () Bool)

(assert (=> b!23970 m!33793))

(declare-fun m!33795 () Bool)

(assert (=> b!23970 m!33795))

(declare-fun m!33797 () Bool)

(assert (=> b!23970 m!33797))

(declare-fun m!33799 () Bool)

(assert (=> b!23963 m!33799))

(push 1)

(assert (not b!23964))

(assert (not b!23970))

(assert (not b!23962))

(assert (not b!23969))

(assert (not b!23965))

(assert (not b!23961))

(assert (not b!23966))

(assert (not b!23960))

(assert (not b!23963))

(assert (not b!23958))

(assert (not start!5682))

(assert (not b!23967))

(assert (not b!23959))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

