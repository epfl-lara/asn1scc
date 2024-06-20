; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5680 () Bool)

(assert start!5680)

(declare-fun b!23916 () Bool)

(declare-fun e!16242 () Bool)

(declare-fun e!16250 () Bool)

(assert (=> b!23916 (= e!16242 e!16250)))

(declare-fun res!20614 () Bool)

(assert (=> b!23916 (=> res!20614 e!16250)))

(declare-fun lt!34405 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!34400 () (_ BitVec 64))

(assert (=> b!23916 (= res!20614 (not (= lt!34405 (bvsub (bvadd lt!34400 to!314) i!635))))))

(declare-datatypes ((array!1603 0))(
  ( (array!1604 (arr!1143 (Array (_ BitVec 32) (_ BitVec 8))) (size!687 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1206 0))(
  ( (BitStream!1207 (buf!1008 array!1603) (currentByte!2321 (_ BitVec 32)) (currentBit!2316 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2017 0))(
  ( (Unit!2018) )
))
(declare-datatypes ((tuple2!2730 0))(
  ( (tuple2!2731 (_1!1452 Unit!2017) (_2!1452 BitStream!1206)) )
))
(declare-fun lt!34395 () tuple2!2730)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23916 (= lt!34405 (bitIndex!0 (size!687 (buf!1008 (_2!1452 lt!34395))) (currentByte!2321 (_2!1452 lt!34395)) (currentBit!2316 (_2!1452 lt!34395))))))

(declare-fun b!23917 () Bool)

(declare-fun res!20604 () Bool)

(declare-fun e!16248 () Bool)

(assert (=> b!23917 (=> (not res!20604) (not e!16248))))

(declare-fun thiss!1379 () BitStream!1206)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23917 (= res!20604 (validate_offset_bits!1 ((_ sign_extend 32) (size!687 (buf!1008 thiss!1379))) ((_ sign_extend 32) (currentByte!2321 thiss!1379)) ((_ sign_extend 32) (currentBit!2316 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!23918 () Bool)

(declare-fun e!16244 () Bool)

(declare-fun e!16249 () Bool)

(assert (=> b!23918 (= e!16244 e!16249)))

(declare-fun res!20606 () Bool)

(assert (=> b!23918 (=> res!20606 e!16249)))

(declare-fun lt!34399 () tuple2!2730)

(declare-fun isPrefixOf!0 (BitStream!1206 BitStream!1206) Bool)

(assert (=> b!23918 (= res!20606 (not (isPrefixOf!0 thiss!1379 (_2!1452 lt!34399))))))

(declare-fun lt!34397 () (_ BitVec 64))

(assert (=> b!23918 (validate_offset_bits!1 ((_ sign_extend 32) (size!687 (buf!1008 (_2!1452 lt!34399)))) ((_ sign_extend 32) (currentByte!2321 (_2!1452 lt!34399))) ((_ sign_extend 32) (currentBit!2316 (_2!1452 lt!34399))) lt!34397)))

(assert (=> b!23918 (= lt!34397 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34401 () Unit!2017)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1206 BitStream!1206 (_ BitVec 64) (_ BitVec 64)) Unit!2017)

(assert (=> b!23918 (= lt!34401 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1452 lt!34399) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1603)

(declare-fun appendBitFromByte!0 (BitStream!1206 (_ BitVec 8) (_ BitVec 32)) tuple2!2730)

(assert (=> b!23918 (= lt!34399 (appendBitFromByte!0 thiss!1379 (select (arr!1143 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!23919 () Bool)

(declare-fun res!20605 () Bool)

(declare-fun e!16246 () Bool)

(assert (=> b!23919 (=> res!20605 e!16246)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23919 (= res!20605 (not (invariant!0 (currentBit!2316 (_2!1452 lt!34399)) (currentByte!2321 (_2!1452 lt!34399)) (size!687 (buf!1008 (_2!1452 lt!34399))))))))

(declare-fun b!23920 () Bool)

(assert (=> b!23920 (= e!16248 (not e!16244))))

(declare-fun res!20611 () Bool)

(assert (=> b!23920 (=> res!20611 e!16244)))

(assert (=> b!23920 (= res!20611 (bvsge i!635 to!314))))

(assert (=> b!23920 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34393 () Unit!2017)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1206) Unit!2017)

(assert (=> b!23920 (= lt!34393 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!23920 (= lt!34400 (bitIndex!0 (size!687 (buf!1008 thiss!1379)) (currentByte!2321 thiss!1379) (currentBit!2316 thiss!1379)))))

(declare-fun b!23921 () Bool)

(declare-fun res!20612 () Bool)

(assert (=> b!23921 (=> res!20612 e!16250)))

(assert (=> b!23921 (= res!20612 (not (= (size!687 (buf!1008 thiss!1379)) (size!687 (buf!1008 (_2!1452 lt!34395))))))))

(declare-fun b!23922 () Bool)

(assert (=> b!23922 (= e!16249 e!16242)))

(declare-fun res!20609 () Bool)

(assert (=> b!23922 (=> res!20609 e!16242)))

(assert (=> b!23922 (= res!20609 (not (isPrefixOf!0 (_2!1452 lt!34399) (_2!1452 lt!34395))))))

(assert (=> b!23922 (isPrefixOf!0 thiss!1379 (_2!1452 lt!34395))))

(declare-fun lt!34392 () Unit!2017)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1206 BitStream!1206 BitStream!1206) Unit!2017)

(assert (=> b!23922 (= lt!34392 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1452 lt!34399) (_2!1452 lt!34395)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1206 array!1603 (_ BitVec 64) (_ BitVec 64)) tuple2!2730)

(assert (=> b!23922 (= lt!34395 (appendBitsMSBFirstLoop!0 (_2!1452 lt!34399) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!16247 () Bool)

(assert (=> b!23922 e!16247))

(declare-fun res!20616 () Bool)

(assert (=> b!23922 (=> (not res!20616) (not e!16247))))

(assert (=> b!23922 (= res!20616 (validate_offset_bits!1 ((_ sign_extend 32) (size!687 (buf!1008 (_2!1452 lt!34399)))) ((_ sign_extend 32) (currentByte!2321 thiss!1379)) ((_ sign_extend 32) (currentBit!2316 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34404 () Unit!2017)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1206 array!1603 (_ BitVec 64)) Unit!2017)

(assert (=> b!23922 (= lt!34404 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1008 (_2!1452 lt!34399)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2732 0))(
  ( (tuple2!2733 (_1!1453 BitStream!1206) (_2!1453 BitStream!1206)) )
))
(declare-fun lt!34396 () tuple2!2732)

(declare-fun reader!0 (BitStream!1206 BitStream!1206) tuple2!2732)

(assert (=> b!23922 (= lt!34396 (reader!0 thiss!1379 (_2!1452 lt!34399)))))

(declare-fun res!20613 () Bool)

(assert (=> start!5680 (=> (not res!20613) (not e!16248))))

(assert (=> start!5680 (= res!20613 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!687 srcBuffer!2))))))))

(assert (=> start!5680 e!16248))

(assert (=> start!5680 true))

(declare-fun array_inv!656 (array!1603) Bool)

(assert (=> start!5680 (array_inv!656 srcBuffer!2)))

(declare-fun e!16251 () Bool)

(declare-fun inv!12 (BitStream!1206) Bool)

(assert (=> start!5680 (and (inv!12 thiss!1379) e!16251)))

(declare-fun b!23923 () Bool)

(declare-fun e!16243 () Bool)

(assert (=> b!23923 (= e!16243 (= lt!34405 (bvsub (bvsub (bvadd (bitIndex!0 (size!687 (buf!1008 (_2!1452 lt!34399))) (currentByte!2321 (_2!1452 lt!34399)) (currentBit!2316 (_2!1452 lt!34399))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!23924 () Bool)

(assert (=> b!23924 (= e!16246 true)))

(assert (=> b!23924 (validate_offset_bits!1 ((_ sign_extend 32) (size!687 (buf!1008 (_2!1452 lt!34395)))) ((_ sign_extend 32) (currentByte!2321 (_2!1452 lt!34399))) ((_ sign_extend 32) (currentBit!2316 (_2!1452 lt!34399))) lt!34397)))

(declare-fun lt!34394 () Unit!2017)

(assert (=> b!23924 (= lt!34394 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1452 lt!34399) (buf!1008 (_2!1452 lt!34395)) lt!34397))))

(declare-fun lt!34403 () tuple2!2732)

(assert (=> b!23924 (= lt!34403 (reader!0 (_2!1452 lt!34399) (_2!1452 lt!34395)))))

(assert (=> b!23924 (validate_offset_bits!1 ((_ sign_extend 32) (size!687 (buf!1008 (_2!1452 lt!34395)))) ((_ sign_extend 32) (currentByte!2321 thiss!1379)) ((_ sign_extend 32) (currentBit!2316 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34398 () Unit!2017)

(assert (=> b!23924 (= lt!34398 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1008 (_2!1452 lt!34395)) (bvsub to!314 i!635)))))

(declare-fun lt!34402 () tuple2!2732)

(assert (=> b!23924 (= lt!34402 (reader!0 thiss!1379 (_2!1452 lt!34395)))))

(declare-fun b!23925 () Bool)

(declare-datatypes ((List!304 0))(
  ( (Nil!301) (Cons!300 (h!419 Bool) (t!1054 List!304)) )
))
(declare-fun head!141 (List!304) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1206 array!1603 (_ BitVec 64) (_ BitVec 64)) List!304)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1206 BitStream!1206 (_ BitVec 64)) List!304)

(assert (=> b!23925 (= e!16247 (= (head!141 (byteArrayBitContentToList!0 (_2!1452 lt!34399) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!141 (bitStreamReadBitsIntoList!0 (_2!1452 lt!34399) (_1!1453 lt!34396) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!23926 () Bool)

(assert (=> b!23926 (= e!16250 e!16246)))

(declare-fun res!20607 () Bool)

(assert (=> b!23926 (=> res!20607 e!16246)))

(assert (=> b!23926 (= res!20607 (not (= (size!687 (buf!1008 (_2!1452 lt!34399))) (size!687 (buf!1008 (_2!1452 lt!34395))))))))

(assert (=> b!23926 e!16243))

(declare-fun res!20615 () Bool)

(assert (=> b!23926 (=> (not res!20615) (not e!16243))))

(assert (=> b!23926 (= res!20615 (= (size!687 (buf!1008 (_2!1452 lt!34395))) (size!687 (buf!1008 thiss!1379))))))

(declare-fun b!23927 () Bool)

(declare-fun res!20610 () Bool)

(assert (=> b!23927 (=> res!20610 e!16246)))

(assert (=> b!23927 (= res!20610 (not (invariant!0 (currentBit!2316 (_2!1452 lt!34399)) (currentByte!2321 (_2!1452 lt!34399)) (size!687 (buf!1008 (_2!1452 lt!34395))))))))

(declare-fun b!23928 () Bool)

(assert (=> b!23928 (= e!16251 (array_inv!656 (buf!1008 thiss!1379)))))

(declare-fun b!23929 () Bool)

(declare-fun res!20608 () Bool)

(assert (=> b!23929 (=> res!20608 e!16250)))

(assert (=> b!23929 (= res!20608 (not (invariant!0 (currentBit!2316 (_2!1452 lt!34395)) (currentByte!2321 (_2!1452 lt!34395)) (size!687 (buf!1008 (_2!1452 lt!34395))))))))

(assert (= (and start!5680 res!20613) b!23917))

(assert (= (and b!23917 res!20604) b!23920))

(assert (= (and b!23920 (not res!20611)) b!23918))

(assert (= (and b!23918 (not res!20606)) b!23922))

(assert (= (and b!23922 res!20616) b!23925))

(assert (= (and b!23922 (not res!20609)) b!23916))

(assert (= (and b!23916 (not res!20614)) b!23929))

(assert (= (and b!23929 (not res!20608)) b!23921))

(assert (= (and b!23921 (not res!20612)) b!23926))

(assert (= (and b!23926 res!20615) b!23923))

(assert (= (and b!23926 (not res!20607)) b!23919))

(assert (= (and b!23919 (not res!20605)) b!23927))

(assert (= (and b!23927 (not res!20610)) b!23924))

(assert (= start!5680 b!23928))

(declare-fun m!33665 () Bool)

(assert (=> b!23917 m!33665))

(declare-fun m!33667 () Bool)

(assert (=> b!23920 m!33667))

(declare-fun m!33669 () Bool)

(assert (=> b!23920 m!33669))

(declare-fun m!33671 () Bool)

(assert (=> b!23920 m!33671))

(declare-fun m!33673 () Bool)

(assert (=> b!23928 m!33673))

(declare-fun m!33675 () Bool)

(assert (=> b!23927 m!33675))

(declare-fun m!33677 () Bool)

(assert (=> b!23925 m!33677))

(assert (=> b!23925 m!33677))

(declare-fun m!33679 () Bool)

(assert (=> b!23925 m!33679))

(declare-fun m!33681 () Bool)

(assert (=> b!23925 m!33681))

(assert (=> b!23925 m!33681))

(declare-fun m!33683 () Bool)

(assert (=> b!23925 m!33683))

(declare-fun m!33685 () Bool)

(assert (=> b!23916 m!33685))

(declare-fun m!33687 () Bool)

(assert (=> b!23919 m!33687))

(declare-fun m!33689 () Bool)

(assert (=> b!23924 m!33689))

(declare-fun m!33691 () Bool)

(assert (=> b!23924 m!33691))

(declare-fun m!33693 () Bool)

(assert (=> b!23924 m!33693))

(declare-fun m!33695 () Bool)

(assert (=> b!23924 m!33695))

(declare-fun m!33697 () Bool)

(assert (=> b!23924 m!33697))

(declare-fun m!33699 () Bool)

(assert (=> b!23924 m!33699))

(declare-fun m!33701 () Bool)

(assert (=> b!23922 m!33701))

(declare-fun m!33703 () Bool)

(assert (=> b!23922 m!33703))

(declare-fun m!33705 () Bool)

(assert (=> b!23922 m!33705))

(declare-fun m!33707 () Bool)

(assert (=> b!23922 m!33707))

(declare-fun m!33709 () Bool)

(assert (=> b!23922 m!33709))

(declare-fun m!33711 () Bool)

(assert (=> b!23922 m!33711))

(declare-fun m!33713 () Bool)

(assert (=> b!23922 m!33713))

(declare-fun m!33715 () Bool)

(assert (=> b!23918 m!33715))

(declare-fun m!33717 () Bool)

(assert (=> b!23918 m!33717))

(declare-fun m!33719 () Bool)

(assert (=> b!23918 m!33719))

(assert (=> b!23918 m!33717))

(declare-fun m!33721 () Bool)

(assert (=> b!23918 m!33721))

(declare-fun m!33723 () Bool)

(assert (=> b!23918 m!33723))

(declare-fun m!33725 () Bool)

(assert (=> start!5680 m!33725))

(declare-fun m!33727 () Bool)

(assert (=> start!5680 m!33727))

(declare-fun m!33729 () Bool)

(assert (=> b!23923 m!33729))

(declare-fun m!33731 () Bool)

(assert (=> b!23929 m!33731))

(check-sat (not b!23922) (not b!23927) (not b!23916) (not start!5680) (not b!23918) (not b!23919) (not b!23923) (not b!23917) (not b!23920) (not b!23929) (not b!23928) (not b!23924) (not b!23925))
