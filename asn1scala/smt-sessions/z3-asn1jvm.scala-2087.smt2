; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52876 () Bool)

(assert start!52876)

(declare-fun b!245016 () Bool)

(declare-fun res!204837 () Bool)

(declare-fun e!169798 () Bool)

(assert (=> b!245016 (=> (not res!204837) (not e!169798))))

(declare-datatypes ((array!13402 0))(
  ( (array!13403 (arr!6863 (Array (_ BitVec 32) (_ BitVec 8))) (size!5876 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10674 0))(
  ( (BitStream!10675 (buf!6351 array!13402) (currentByte!11735 (_ BitVec 32)) (currentBit!11730 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10674)

(declare-datatypes ((Unit!17853 0))(
  ( (Unit!17854) )
))
(declare-datatypes ((tuple2!21024 0))(
  ( (tuple2!21025 (_1!11434 Unit!17853) (_2!11434 BitStream!10674)) )
))
(declare-fun lt!382001 () tuple2!21024)

(declare-fun isPrefixOf!0 (BitStream!10674 BitStream!10674) Bool)

(assert (=> b!245016 (= res!204837 (isPrefixOf!0 thiss!1005 (_2!11434 lt!382001)))))

(declare-fun b!245017 () Bool)

(declare-fun res!204849 () Bool)

(declare-fun e!169807 () Bool)

(assert (=> b!245017 (=> (not res!204849) (not e!169807))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!245017 (= res!204849 (invariant!0 (currentBit!11730 thiss!1005) (currentByte!11735 thiss!1005) (size!5876 (buf!6351 (_2!11434 lt!382001)))))))

(declare-fun b!245018 () Bool)

(declare-fun e!169808 () Bool)

(declare-datatypes ((tuple2!21026 0))(
  ( (tuple2!21027 (_1!11435 BitStream!10674) (_2!11435 Bool)) )
))
(declare-fun lt!382006 () tuple2!21026)

(declare-fun lt!382005 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!245018 (= e!169808 (= (bitIndex!0 (size!5876 (buf!6351 (_1!11435 lt!382006))) (currentByte!11735 (_1!11435 lt!382006)) (currentBit!11730 (_1!11435 lt!382006))) lt!382005))))

(declare-fun b!245019 () Bool)

(declare-fun e!169799 () Bool)

(declare-fun e!169805 () Bool)

(assert (=> b!245019 (= e!169799 (not e!169805))))

(declare-fun res!204842 () Bool)

(assert (=> b!245019 (=> res!204842 e!169805)))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((tuple2!21028 0))(
  ( (tuple2!21029 (_1!11436 BitStream!10674) (_2!11436 BitStream!10674)) )
))
(declare-fun lt!382019 () tuple2!21028)

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10674 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21026)

(assert (=> b!245019 (= res!204842 (not (= (_1!11435 (checkBitsLoopPure!0 (_1!11436 lt!382019) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_2!11436 lt!382019))))))

(declare-fun lt!382020 () tuple2!21024)

(declare-fun lt!382008 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!245019 (validate_offset_bits!1 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382020)))) ((_ sign_extend 32) (currentByte!11735 (_2!11434 lt!382001))) ((_ sign_extend 32) (currentBit!11730 (_2!11434 lt!382001))) lt!382008)))

(declare-fun lt!382012 () Unit!17853)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10674 array!13402 (_ BitVec 64)) Unit!17853)

(assert (=> b!245019 (= lt!382012 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11434 lt!382001) (buf!6351 (_2!11434 lt!382020)) lt!382008))))

(declare-fun lt!382004 () tuple2!21028)

(declare-fun lt!382015 () tuple2!21026)

(assert (=> b!245019 (= lt!382015 (checkBitsLoopPure!0 (_1!11436 lt!382004) nBits!297 bit!26 from!289))))

(assert (=> b!245019 (validate_offset_bits!1 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382020)))) ((_ sign_extend 32) (currentByte!11735 thiss!1005)) ((_ sign_extend 32) (currentBit!11730 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!382007 () Unit!17853)

(assert (=> b!245019 (= lt!382007 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6351 (_2!11434 lt!382020)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10674) tuple2!21026)

(assert (=> b!245019 (= (_2!11435 (readBitPure!0 (_1!11436 lt!382004))) bit!26)))

(declare-fun reader!0 (BitStream!10674 BitStream!10674) tuple2!21028)

(assert (=> b!245019 (= lt!382019 (reader!0 (_2!11434 lt!382001) (_2!11434 lt!382020)))))

(assert (=> b!245019 (= lt!382004 (reader!0 thiss!1005 (_2!11434 lt!382020)))))

(declare-fun e!169802 () Bool)

(assert (=> b!245019 e!169802))

(declare-fun res!204841 () Bool)

(assert (=> b!245019 (=> (not res!204841) (not e!169802))))

(declare-fun lt!382002 () tuple2!21026)

(declare-fun lt!382009 () tuple2!21026)

(assert (=> b!245019 (= res!204841 (= (bitIndex!0 (size!5876 (buf!6351 (_1!11435 lt!382002))) (currentByte!11735 (_1!11435 lt!382002)) (currentBit!11730 (_1!11435 lt!382002))) (bitIndex!0 (size!5876 (buf!6351 (_1!11435 lt!382009))) (currentByte!11735 (_1!11435 lt!382009)) (currentBit!11730 (_1!11435 lt!382009)))))))

(declare-fun lt!382013 () Unit!17853)

(declare-fun lt!382014 () BitStream!10674)

(declare-fun readBitPrefixLemma!0 (BitStream!10674 BitStream!10674) Unit!17853)

(assert (=> b!245019 (= lt!382013 (readBitPrefixLemma!0 lt!382014 (_2!11434 lt!382020)))))

(assert (=> b!245019 (= lt!382009 (readBitPure!0 (BitStream!10675 (buf!6351 (_2!11434 lt!382020)) (currentByte!11735 thiss!1005) (currentBit!11730 thiss!1005))))))

(assert (=> b!245019 (= lt!382002 (readBitPure!0 lt!382014))))

(assert (=> b!245019 (= lt!382014 (BitStream!10675 (buf!6351 (_2!11434 lt!382001)) (currentByte!11735 thiss!1005) (currentBit!11730 thiss!1005)))))

(assert (=> b!245019 e!169807))

(declare-fun res!204848 () Bool)

(assert (=> b!245019 (=> (not res!204848) (not e!169807))))

(assert (=> b!245019 (= res!204848 (isPrefixOf!0 thiss!1005 (_2!11434 lt!382020)))))

(declare-fun lt!382016 () Unit!17853)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10674 BitStream!10674 BitStream!10674) Unit!17853)

(assert (=> b!245019 (= lt!382016 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11434 lt!382001) (_2!11434 lt!382020)))))

(declare-fun e!169806 () Bool)

(assert (=> b!245019 e!169806))

(declare-fun res!204840 () Bool)

(assert (=> b!245019 (=> (not res!204840) (not e!169806))))

(assert (=> b!245019 (= res!204840 (= (size!5876 (buf!6351 (_2!11434 lt!382001))) (size!5876 (buf!6351 (_2!11434 lt!382020)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10674 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21024)

(assert (=> b!245019 (= lt!382020 (appendNBitsLoop!0 (_2!11434 lt!382001) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245019 (validate_offset_bits!1 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382001)))) ((_ sign_extend 32) (currentByte!11735 (_2!11434 lt!382001))) ((_ sign_extend 32) (currentBit!11730 (_2!11434 lt!382001))) lt!382008)))

(assert (=> b!245019 (= lt!382008 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!382017 () Unit!17853)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10674 BitStream!10674 (_ BitVec 64) (_ BitVec 64)) Unit!17853)

(assert (=> b!245019 (= lt!382017 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11434 lt!382001) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!169804 () Bool)

(assert (=> b!245019 e!169804))

(declare-fun res!204839 () Bool)

(assert (=> b!245019 (=> (not res!204839) (not e!169804))))

(assert (=> b!245019 (= res!204839 (= (size!5876 (buf!6351 thiss!1005)) (size!5876 (buf!6351 (_2!11434 lt!382001)))))))

(declare-fun appendBit!0 (BitStream!10674 Bool) tuple2!21024)

(assert (=> b!245019 (= lt!382001 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!245020 () Bool)

(declare-fun e!169803 () Bool)

(assert (=> b!245020 (= e!169806 e!169803)))

(declare-fun res!204844 () Bool)

(assert (=> b!245020 (=> (not res!204844) (not e!169803))))

(declare-fun lt!382011 () (_ BitVec 64))

(assert (=> b!245020 (= res!204844 (= (bitIndex!0 (size!5876 (buf!6351 (_2!11434 lt!382020))) (currentByte!11735 (_2!11434 lt!382020)) (currentBit!11730 (_2!11434 lt!382020))) (bvadd (bitIndex!0 (size!5876 (buf!6351 (_2!11434 lt!382001))) (currentByte!11735 (_2!11434 lt!382001)) (currentBit!11730 (_2!11434 lt!382001))) lt!382011)))))

(assert (=> b!245020 (= lt!382011 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!245021 () Bool)

(assert (=> b!245021 (= e!169807 (invariant!0 (currentBit!11730 thiss!1005) (currentByte!11735 thiss!1005) (size!5876 (buf!6351 (_2!11434 lt!382020)))))))

(declare-fun b!245023 () Bool)

(assert (=> b!245023 (= e!169798 e!169808)))

(declare-fun res!204838 () Bool)

(assert (=> b!245023 (=> (not res!204838) (not e!169808))))

(assert (=> b!245023 (= res!204838 (and (= (_2!11435 lt!382006) bit!26) (= (_1!11435 lt!382006) (_2!11434 lt!382001))))))

(declare-fun readerFrom!0 (BitStream!10674 (_ BitVec 32) (_ BitVec 32)) BitStream!10674)

(assert (=> b!245023 (= lt!382006 (readBitPure!0 (readerFrom!0 (_2!11434 lt!382001) (currentBit!11730 thiss!1005) (currentByte!11735 thiss!1005))))))

(declare-fun b!245024 () Bool)

(declare-fun res!204846 () Bool)

(assert (=> b!245024 (=> (not res!204846) (not e!169799))))

(assert (=> b!245024 (= res!204846 (bvslt from!289 nBits!297))))

(declare-fun b!245025 () Bool)

(assert (=> b!245025 (= e!169804 e!169798)))

(declare-fun res!204836 () Bool)

(assert (=> b!245025 (=> (not res!204836) (not e!169798))))

(declare-fun lt!382018 () (_ BitVec 64))

(assert (=> b!245025 (= res!204836 (= lt!382005 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!382018)))))

(assert (=> b!245025 (= lt!382005 (bitIndex!0 (size!5876 (buf!6351 (_2!11434 lt!382001))) (currentByte!11735 (_2!11434 lt!382001)) (currentBit!11730 (_2!11434 lt!382001))))))

(assert (=> b!245025 (= lt!382018 (bitIndex!0 (size!5876 (buf!6351 thiss!1005)) (currentByte!11735 thiss!1005) (currentBit!11730 thiss!1005)))))

(declare-fun b!245026 () Bool)

(declare-fun lt!382003 () tuple2!21026)

(declare-fun lt!382000 () tuple2!21028)

(assert (=> b!245026 (= e!169803 (not (or (not (_2!11435 lt!382003)) (not (= (_1!11435 lt!382003) (_2!11436 lt!382000))))))))

(assert (=> b!245026 (= lt!382003 (checkBitsLoopPure!0 (_1!11436 lt!382000) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245026 (validate_offset_bits!1 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382020)))) ((_ sign_extend 32) (currentByte!11735 (_2!11434 lt!382001))) ((_ sign_extend 32) (currentBit!11730 (_2!11434 lt!382001))) lt!382011)))

(declare-fun lt!382010 () Unit!17853)

(assert (=> b!245026 (= lt!382010 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11434 lt!382001) (buf!6351 (_2!11434 lt!382020)) lt!382011))))

(assert (=> b!245026 (= lt!382000 (reader!0 (_2!11434 lt!382001) (_2!11434 lt!382020)))))

(declare-fun b!245027 () Bool)

(declare-fun res!204843 () Bool)

(assert (=> b!245027 (=> (not res!204843) (not e!169803))))

(assert (=> b!245027 (= res!204843 (isPrefixOf!0 (_2!11434 lt!382001) (_2!11434 lt!382020)))))

(declare-fun b!245028 () Bool)

(declare-fun e!169800 () Bool)

(declare-fun array_inv!5617 (array!13402) Bool)

(assert (=> b!245028 (= e!169800 (array_inv!5617 (buf!6351 thiss!1005)))))

(declare-fun b!245029 () Bool)

(assert (=> b!245029 (= e!169802 (= (_2!11435 lt!382002) (_2!11435 lt!382009)))))

(declare-fun b!245030 () Bool)

(declare-fun res!204847 () Bool)

(assert (=> b!245030 (=> (not res!204847) (not e!169799))))

(assert (=> b!245030 (= res!204847 (validate_offset_bits!1 ((_ sign_extend 32) (size!5876 (buf!6351 thiss!1005))) ((_ sign_extend 32) (currentByte!11735 thiss!1005)) ((_ sign_extend 32) (currentBit!11730 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!245022 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!10674 (_ BitVec 64)) Bool)

(assert (=> b!245022 (= e!169805 (moveBitIndexPrecond!0 (_1!11436 lt!382004) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun res!204845 () Bool)

(assert (=> start!52876 (=> (not res!204845) (not e!169799))))

(assert (=> start!52876 (= res!204845 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52876 e!169799))

(assert (=> start!52876 true))

(declare-fun inv!12 (BitStream!10674) Bool)

(assert (=> start!52876 (and (inv!12 thiss!1005) e!169800)))

(assert (= (and start!52876 res!204845) b!245030))

(assert (= (and b!245030 res!204847) b!245024))

(assert (= (and b!245024 res!204846) b!245019))

(assert (= (and b!245019 res!204839) b!245025))

(assert (= (and b!245025 res!204836) b!245016))

(assert (= (and b!245016 res!204837) b!245023))

(assert (= (and b!245023 res!204838) b!245018))

(assert (= (and b!245019 res!204840) b!245020))

(assert (= (and b!245020 res!204844) b!245027))

(assert (= (and b!245027 res!204843) b!245026))

(assert (= (and b!245019 res!204848) b!245017))

(assert (= (and b!245017 res!204849) b!245021))

(assert (= (and b!245019 res!204841) b!245029))

(assert (= (and b!245019 (not res!204842)) b!245022))

(assert (= start!52876 b!245028))

(declare-fun m!369397 () Bool)

(assert (=> b!245018 m!369397))

(declare-fun m!369399 () Bool)

(assert (=> b!245030 m!369399))

(declare-fun m!369401 () Bool)

(assert (=> start!52876 m!369401))

(declare-fun m!369403 () Bool)

(assert (=> b!245017 m!369403))

(declare-fun m!369405 () Bool)

(assert (=> b!245025 m!369405))

(declare-fun m!369407 () Bool)

(assert (=> b!245025 m!369407))

(declare-fun m!369409 () Bool)

(assert (=> b!245020 m!369409))

(assert (=> b!245020 m!369405))

(declare-fun m!369411 () Bool)

(assert (=> b!245026 m!369411))

(declare-fun m!369413 () Bool)

(assert (=> b!245026 m!369413))

(declare-fun m!369415 () Bool)

(assert (=> b!245026 m!369415))

(declare-fun m!369417 () Bool)

(assert (=> b!245026 m!369417))

(declare-fun m!369419 () Bool)

(assert (=> b!245028 m!369419))

(declare-fun m!369421 () Bool)

(assert (=> b!245021 m!369421))

(declare-fun m!369423 () Bool)

(assert (=> b!245016 m!369423))

(declare-fun m!369425 () Bool)

(assert (=> b!245023 m!369425))

(assert (=> b!245023 m!369425))

(declare-fun m!369427 () Bool)

(assert (=> b!245023 m!369427))

(declare-fun m!369429 () Bool)

(assert (=> b!245022 m!369429))

(declare-fun m!369431 () Bool)

(assert (=> b!245019 m!369431))

(declare-fun m!369433 () Bool)

(assert (=> b!245019 m!369433))

(declare-fun m!369435 () Bool)

(assert (=> b!245019 m!369435))

(declare-fun m!369437 () Bool)

(assert (=> b!245019 m!369437))

(declare-fun m!369439 () Bool)

(assert (=> b!245019 m!369439))

(declare-fun m!369441 () Bool)

(assert (=> b!245019 m!369441))

(declare-fun m!369443 () Bool)

(assert (=> b!245019 m!369443))

(declare-fun m!369445 () Bool)

(assert (=> b!245019 m!369445))

(declare-fun m!369447 () Bool)

(assert (=> b!245019 m!369447))

(declare-fun m!369449 () Bool)

(assert (=> b!245019 m!369449))

(declare-fun m!369451 () Bool)

(assert (=> b!245019 m!369451))

(declare-fun m!369453 () Bool)

(assert (=> b!245019 m!369453))

(declare-fun m!369455 () Bool)

(assert (=> b!245019 m!369455))

(assert (=> b!245019 m!369417))

(declare-fun m!369457 () Bool)

(assert (=> b!245019 m!369457))

(declare-fun m!369459 () Bool)

(assert (=> b!245019 m!369459))

(declare-fun m!369461 () Bool)

(assert (=> b!245019 m!369461))

(declare-fun m!369463 () Bool)

(assert (=> b!245019 m!369463))

(declare-fun m!369465 () Bool)

(assert (=> b!245019 m!369465))

(declare-fun m!369467 () Bool)

(assert (=> b!245019 m!369467))

(declare-fun m!369469 () Bool)

(assert (=> b!245027 m!369469))

(check-sat (not b!245026) (not b!245022) (not start!52876) (not b!245017) (not b!245020) (not b!245030) (not b!245028) (not b!245019) (not b!245027) (not b!245025) (not b!245018) (not b!245021) (not b!245023) (not b!245016))
(check-sat)
(get-model)

(declare-fun d!82142 () Bool)

(declare-fun res!204898 () Bool)

(declare-fun e!169846 () Bool)

(assert (=> d!82142 (=> (not res!204898) (not e!169846))))

(assert (=> d!82142 (= res!204898 (= (size!5876 (buf!6351 thiss!1005)) (size!5876 (buf!6351 (_2!11434 lt!382001)))))))

(assert (=> d!82142 (= (isPrefixOf!0 thiss!1005 (_2!11434 lt!382001)) e!169846)))

(declare-fun b!245082 () Bool)

(declare-fun res!204900 () Bool)

(assert (=> b!245082 (=> (not res!204900) (not e!169846))))

(assert (=> b!245082 (= res!204900 (bvsle (bitIndex!0 (size!5876 (buf!6351 thiss!1005)) (currentByte!11735 thiss!1005) (currentBit!11730 thiss!1005)) (bitIndex!0 (size!5876 (buf!6351 (_2!11434 lt!382001))) (currentByte!11735 (_2!11434 lt!382001)) (currentBit!11730 (_2!11434 lt!382001)))))))

(declare-fun b!245083 () Bool)

(declare-fun e!169847 () Bool)

(assert (=> b!245083 (= e!169846 e!169847)))

(declare-fun res!204899 () Bool)

(assert (=> b!245083 (=> res!204899 e!169847)))

(assert (=> b!245083 (= res!204899 (= (size!5876 (buf!6351 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!245084 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13402 array!13402 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!245084 (= e!169847 (arrayBitRangesEq!0 (buf!6351 thiss!1005) (buf!6351 (_2!11434 lt!382001)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5876 (buf!6351 thiss!1005)) (currentByte!11735 thiss!1005) (currentBit!11730 thiss!1005))))))

(assert (= (and d!82142 res!204898) b!245082))

(assert (= (and b!245082 res!204900) b!245083))

(assert (= (and b!245083 (not res!204899)) b!245084))

(assert (=> b!245082 m!369407))

(assert (=> b!245082 m!369405))

(assert (=> b!245084 m!369407))

(assert (=> b!245084 m!369407))

(declare-fun m!369545 () Bool)

(assert (=> b!245084 m!369545))

(assert (=> b!245016 d!82142))

(declare-fun d!82144 () Bool)

(declare-fun res!204901 () Bool)

(declare-fun e!169848 () Bool)

(assert (=> d!82144 (=> (not res!204901) (not e!169848))))

(assert (=> d!82144 (= res!204901 (= (size!5876 (buf!6351 (_2!11434 lt!382001))) (size!5876 (buf!6351 (_2!11434 lt!382020)))))))

(assert (=> d!82144 (= (isPrefixOf!0 (_2!11434 lt!382001) (_2!11434 lt!382020)) e!169848)))

(declare-fun b!245085 () Bool)

(declare-fun res!204903 () Bool)

(assert (=> b!245085 (=> (not res!204903) (not e!169848))))

(assert (=> b!245085 (= res!204903 (bvsle (bitIndex!0 (size!5876 (buf!6351 (_2!11434 lt!382001))) (currentByte!11735 (_2!11434 lt!382001)) (currentBit!11730 (_2!11434 lt!382001))) (bitIndex!0 (size!5876 (buf!6351 (_2!11434 lt!382020))) (currentByte!11735 (_2!11434 lt!382020)) (currentBit!11730 (_2!11434 lt!382020)))))))

(declare-fun b!245086 () Bool)

(declare-fun e!169849 () Bool)

(assert (=> b!245086 (= e!169848 e!169849)))

(declare-fun res!204902 () Bool)

(assert (=> b!245086 (=> res!204902 e!169849)))

(assert (=> b!245086 (= res!204902 (= (size!5876 (buf!6351 (_2!11434 lt!382001))) #b00000000000000000000000000000000))))

(declare-fun b!245087 () Bool)

(assert (=> b!245087 (= e!169849 (arrayBitRangesEq!0 (buf!6351 (_2!11434 lt!382001)) (buf!6351 (_2!11434 lt!382020)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5876 (buf!6351 (_2!11434 lt!382001))) (currentByte!11735 (_2!11434 lt!382001)) (currentBit!11730 (_2!11434 lt!382001)))))))

(assert (= (and d!82144 res!204901) b!245085))

(assert (= (and b!245085 res!204903) b!245086))

(assert (= (and b!245086 (not res!204902)) b!245087))

(assert (=> b!245085 m!369405))

(assert (=> b!245085 m!369409))

(assert (=> b!245087 m!369405))

(assert (=> b!245087 m!369405))

(declare-fun m!369547 () Bool)

(assert (=> b!245087 m!369547))

(assert (=> b!245027 d!82144))

(declare-fun d!82146 () Bool)

(assert (=> d!82146 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11730 thiss!1005) (currentByte!11735 thiss!1005) (size!5876 (buf!6351 thiss!1005))))))

(declare-fun bs!20787 () Bool)

(assert (= bs!20787 d!82146))

(declare-fun m!369549 () Bool)

(assert (=> bs!20787 m!369549))

(assert (=> start!52876 d!82146))

(declare-fun d!82148 () Bool)

(assert (=> d!82148 (= (invariant!0 (currentBit!11730 thiss!1005) (currentByte!11735 thiss!1005) (size!5876 (buf!6351 (_2!11434 lt!382001)))) (and (bvsge (currentBit!11730 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11730 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11735 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11735 thiss!1005) (size!5876 (buf!6351 (_2!11434 lt!382001)))) (and (= (currentBit!11730 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11735 thiss!1005) (size!5876 (buf!6351 (_2!11434 lt!382001))))))))))

(assert (=> b!245017 d!82148))

(declare-fun d!82150 () Bool)

(declare-datatypes ((tuple2!21036 0))(
  ( (tuple2!21037 (_1!11440 Bool) (_2!11440 BitStream!10674)) )
))
(declare-fun lt!382086 () tuple2!21036)

(declare-fun checkBitsLoop!0 (BitStream!10674 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21036)

(assert (=> d!82150 (= lt!382086 (checkBitsLoop!0 (_1!11436 lt!382000) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82150 (= (checkBitsLoopPure!0 (_1!11436 lt!382000) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21027 (_2!11440 lt!382086) (_1!11440 lt!382086)))))

(declare-fun bs!20788 () Bool)

(assert (= bs!20788 d!82150))

(declare-fun m!369551 () Bool)

(assert (=> bs!20788 m!369551))

(assert (=> b!245026 d!82150))

(declare-fun d!82152 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!82152 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382020)))) ((_ sign_extend 32) (currentByte!11735 (_2!11434 lt!382001))) ((_ sign_extend 32) (currentBit!11730 (_2!11434 lt!382001))) lt!382011) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382020)))) ((_ sign_extend 32) (currentByte!11735 (_2!11434 lt!382001))) ((_ sign_extend 32) (currentBit!11730 (_2!11434 lt!382001)))) lt!382011))))

(declare-fun bs!20789 () Bool)

(assert (= bs!20789 d!82152))

(declare-fun m!369553 () Bool)

(assert (=> bs!20789 m!369553))

(assert (=> b!245026 d!82152))

(declare-fun d!82154 () Bool)

(assert (=> d!82154 (validate_offset_bits!1 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382020)))) ((_ sign_extend 32) (currentByte!11735 (_2!11434 lt!382001))) ((_ sign_extend 32) (currentBit!11730 (_2!11434 lt!382001))) lt!382011)))

(declare-fun lt!382089 () Unit!17853)

(declare-fun choose!9 (BitStream!10674 array!13402 (_ BitVec 64) BitStream!10674) Unit!17853)

(assert (=> d!82154 (= lt!382089 (choose!9 (_2!11434 lt!382001) (buf!6351 (_2!11434 lt!382020)) lt!382011 (BitStream!10675 (buf!6351 (_2!11434 lt!382020)) (currentByte!11735 (_2!11434 lt!382001)) (currentBit!11730 (_2!11434 lt!382001)))))))

(assert (=> d!82154 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11434 lt!382001) (buf!6351 (_2!11434 lt!382020)) lt!382011) lt!382089)))

(declare-fun bs!20790 () Bool)

(assert (= bs!20790 d!82154))

(assert (=> bs!20790 m!369413))

(declare-fun m!369555 () Bool)

(assert (=> bs!20790 m!369555))

(assert (=> b!245026 d!82154))

(declare-fun d!82156 () Bool)

(declare-fun e!169854 () Bool)

(assert (=> d!82156 e!169854))

(declare-fun res!204910 () Bool)

(assert (=> d!82156 (=> (not res!204910) (not e!169854))))

(declare-fun lt!382136 () tuple2!21028)

(assert (=> d!82156 (= res!204910 (isPrefixOf!0 (_1!11436 lt!382136) (_2!11436 lt!382136)))))

(declare-fun lt!382139 () BitStream!10674)

(assert (=> d!82156 (= lt!382136 (tuple2!21029 lt!382139 (_2!11434 lt!382020)))))

(declare-fun lt!382146 () Unit!17853)

(declare-fun lt!382144 () Unit!17853)

(assert (=> d!82156 (= lt!382146 lt!382144)))

(assert (=> d!82156 (isPrefixOf!0 lt!382139 (_2!11434 lt!382020))))

(assert (=> d!82156 (= lt!382144 (lemmaIsPrefixTransitive!0 lt!382139 (_2!11434 lt!382020) (_2!11434 lt!382020)))))

(declare-fun lt!382138 () Unit!17853)

(declare-fun lt!382132 () Unit!17853)

(assert (=> d!82156 (= lt!382138 lt!382132)))

(assert (=> d!82156 (isPrefixOf!0 lt!382139 (_2!11434 lt!382020))))

(assert (=> d!82156 (= lt!382132 (lemmaIsPrefixTransitive!0 lt!382139 (_2!11434 lt!382001) (_2!11434 lt!382020)))))

(declare-fun lt!382130 () Unit!17853)

(declare-fun e!169855 () Unit!17853)

(assert (=> d!82156 (= lt!382130 e!169855)))

(declare-fun c!11479 () Bool)

(assert (=> d!82156 (= c!11479 (not (= (size!5876 (buf!6351 (_2!11434 lt!382001))) #b00000000000000000000000000000000)))))

(declare-fun lt!382135 () Unit!17853)

(declare-fun lt!382133 () Unit!17853)

(assert (=> d!82156 (= lt!382135 lt!382133)))

(assert (=> d!82156 (isPrefixOf!0 (_2!11434 lt!382020) (_2!11434 lt!382020))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10674) Unit!17853)

(assert (=> d!82156 (= lt!382133 (lemmaIsPrefixRefl!0 (_2!11434 lt!382020)))))

(declare-fun lt!382140 () Unit!17853)

(declare-fun lt!382141 () Unit!17853)

(assert (=> d!82156 (= lt!382140 lt!382141)))

(assert (=> d!82156 (= lt!382141 (lemmaIsPrefixRefl!0 (_2!11434 lt!382020)))))

(declare-fun lt!382148 () Unit!17853)

(declare-fun lt!382134 () Unit!17853)

(assert (=> d!82156 (= lt!382148 lt!382134)))

(assert (=> d!82156 (isPrefixOf!0 lt!382139 lt!382139)))

(assert (=> d!82156 (= lt!382134 (lemmaIsPrefixRefl!0 lt!382139))))

(declare-fun lt!382142 () Unit!17853)

(declare-fun lt!382143 () Unit!17853)

(assert (=> d!82156 (= lt!382142 lt!382143)))

(assert (=> d!82156 (isPrefixOf!0 (_2!11434 lt!382001) (_2!11434 lt!382001))))

(assert (=> d!82156 (= lt!382143 (lemmaIsPrefixRefl!0 (_2!11434 lt!382001)))))

(assert (=> d!82156 (= lt!382139 (BitStream!10675 (buf!6351 (_2!11434 lt!382020)) (currentByte!11735 (_2!11434 lt!382001)) (currentBit!11730 (_2!11434 lt!382001))))))

(assert (=> d!82156 (isPrefixOf!0 (_2!11434 lt!382001) (_2!11434 lt!382020))))

(assert (=> d!82156 (= (reader!0 (_2!11434 lt!382001) (_2!11434 lt!382020)) lt!382136)))

(declare-fun b!245098 () Bool)

(declare-fun res!204912 () Bool)

(assert (=> b!245098 (=> (not res!204912) (not e!169854))))

(assert (=> b!245098 (= res!204912 (isPrefixOf!0 (_1!11436 lt!382136) (_2!11434 lt!382001)))))

(declare-fun b!245099 () Bool)

(declare-fun Unit!17857 () Unit!17853)

(assert (=> b!245099 (= e!169855 Unit!17857)))

(declare-fun b!245100 () Bool)

(declare-fun res!204911 () Bool)

(assert (=> b!245100 (=> (not res!204911) (not e!169854))))

(assert (=> b!245100 (= res!204911 (isPrefixOf!0 (_2!11436 lt!382136) (_2!11434 lt!382020)))))

(declare-fun b!245101 () Bool)

(declare-fun lt!382147 () Unit!17853)

(assert (=> b!245101 (= e!169855 lt!382147)))

(declare-fun lt!382145 () (_ BitVec 64))

(assert (=> b!245101 (= lt!382145 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!382149 () (_ BitVec 64))

(assert (=> b!245101 (= lt!382149 (bitIndex!0 (size!5876 (buf!6351 (_2!11434 lt!382001))) (currentByte!11735 (_2!11434 lt!382001)) (currentBit!11730 (_2!11434 lt!382001))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13402 array!13402 (_ BitVec 64) (_ BitVec 64)) Unit!17853)

(assert (=> b!245101 (= lt!382147 (arrayBitRangesEqSymmetric!0 (buf!6351 (_2!11434 lt!382001)) (buf!6351 (_2!11434 lt!382020)) lt!382145 lt!382149))))

(assert (=> b!245101 (arrayBitRangesEq!0 (buf!6351 (_2!11434 lt!382020)) (buf!6351 (_2!11434 lt!382001)) lt!382145 lt!382149)))

(declare-fun b!245102 () Bool)

(declare-fun lt!382131 () (_ BitVec 64))

(declare-fun lt!382137 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!10674 (_ BitVec 64)) BitStream!10674)

(assert (=> b!245102 (= e!169854 (= (_1!11436 lt!382136) (withMovedBitIndex!0 (_2!11436 lt!382136) (bvsub lt!382131 lt!382137))))))

(assert (=> b!245102 (or (= (bvand lt!382131 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382137 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382131 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382131 lt!382137) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245102 (= lt!382137 (bitIndex!0 (size!5876 (buf!6351 (_2!11434 lt!382020))) (currentByte!11735 (_2!11434 lt!382020)) (currentBit!11730 (_2!11434 lt!382020))))))

(assert (=> b!245102 (= lt!382131 (bitIndex!0 (size!5876 (buf!6351 (_2!11434 lt!382001))) (currentByte!11735 (_2!11434 lt!382001)) (currentBit!11730 (_2!11434 lt!382001))))))

(assert (= (and d!82156 c!11479) b!245101))

(assert (= (and d!82156 (not c!11479)) b!245099))

(assert (= (and d!82156 res!204910) b!245098))

(assert (= (and b!245098 res!204912) b!245100))

(assert (= (and b!245100 res!204911) b!245102))

(declare-fun m!369557 () Bool)

(assert (=> b!245098 m!369557))

(assert (=> b!245101 m!369405))

(declare-fun m!369559 () Bool)

(assert (=> b!245101 m!369559))

(declare-fun m!369561 () Bool)

(assert (=> b!245101 m!369561))

(declare-fun m!369563 () Bool)

(assert (=> d!82156 m!369563))

(declare-fun m!369565 () Bool)

(assert (=> d!82156 m!369565))

(declare-fun m!369567 () Bool)

(assert (=> d!82156 m!369567))

(declare-fun m!369569 () Bool)

(assert (=> d!82156 m!369569))

(declare-fun m!369571 () Bool)

(assert (=> d!82156 m!369571))

(declare-fun m!369573 () Bool)

(assert (=> d!82156 m!369573))

(declare-fun m!369575 () Bool)

(assert (=> d!82156 m!369575))

(declare-fun m!369577 () Bool)

(assert (=> d!82156 m!369577))

(declare-fun m!369579 () Bool)

(assert (=> d!82156 m!369579))

(declare-fun m!369581 () Bool)

(assert (=> d!82156 m!369581))

(assert (=> d!82156 m!369469))

(declare-fun m!369583 () Bool)

(assert (=> b!245102 m!369583))

(assert (=> b!245102 m!369409))

(assert (=> b!245102 m!369405))

(declare-fun m!369585 () Bool)

(assert (=> b!245100 m!369585))

(assert (=> b!245026 d!82156))

(declare-fun d!82158 () Bool)

(declare-fun e!169858 () Bool)

(assert (=> d!82158 e!169858))

(declare-fun res!204918 () Bool)

(assert (=> d!82158 (=> (not res!204918) (not e!169858))))

(declare-fun lt!382162 () (_ BitVec 64))

(declare-fun lt!382165 () (_ BitVec 64))

(declare-fun lt!382163 () (_ BitVec 64))

(assert (=> d!82158 (= res!204918 (= lt!382165 (bvsub lt!382162 lt!382163)))))

(assert (=> d!82158 (or (= (bvand lt!382162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382163 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382162 lt!382163) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82158 (= lt!382163 (remainingBits!0 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382001)))) ((_ sign_extend 32) (currentByte!11735 (_2!11434 lt!382001))) ((_ sign_extend 32) (currentBit!11730 (_2!11434 lt!382001)))))))

(declare-fun lt!382166 () (_ BitVec 64))

(declare-fun lt!382167 () (_ BitVec 64))

(assert (=> d!82158 (= lt!382162 (bvmul lt!382166 lt!382167))))

(assert (=> d!82158 (or (= lt!382166 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!382167 (bvsdiv (bvmul lt!382166 lt!382167) lt!382166)))))

(assert (=> d!82158 (= lt!382167 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82158 (= lt!382166 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382001)))))))

(assert (=> d!82158 (= lt!382165 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11735 (_2!11434 lt!382001))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11730 (_2!11434 lt!382001)))))))

(assert (=> d!82158 (invariant!0 (currentBit!11730 (_2!11434 lt!382001)) (currentByte!11735 (_2!11434 lt!382001)) (size!5876 (buf!6351 (_2!11434 lt!382001))))))

(assert (=> d!82158 (= (bitIndex!0 (size!5876 (buf!6351 (_2!11434 lt!382001))) (currentByte!11735 (_2!11434 lt!382001)) (currentBit!11730 (_2!11434 lt!382001))) lt!382165)))

(declare-fun b!245107 () Bool)

(declare-fun res!204917 () Bool)

(assert (=> b!245107 (=> (not res!204917) (not e!169858))))

(assert (=> b!245107 (= res!204917 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382165))))

(declare-fun b!245108 () Bool)

(declare-fun lt!382164 () (_ BitVec 64))

(assert (=> b!245108 (= e!169858 (bvsle lt!382165 (bvmul lt!382164 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245108 (or (= lt!382164 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!382164 #b0000000000000000000000000000000000000000000000000000000000001000) lt!382164)))))

(assert (=> b!245108 (= lt!382164 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382001)))))))

(assert (= (and d!82158 res!204918) b!245107))

(assert (= (and b!245107 res!204917) b!245108))

(declare-fun m!369587 () Bool)

(assert (=> d!82158 m!369587))

(declare-fun m!369589 () Bool)

(assert (=> d!82158 m!369589))

(assert (=> b!245025 d!82158))

(declare-fun d!82160 () Bool)

(declare-fun e!169859 () Bool)

(assert (=> d!82160 e!169859))

(declare-fun res!204920 () Bool)

(assert (=> d!82160 (=> (not res!204920) (not e!169859))))

(declare-fun lt!382171 () (_ BitVec 64))

(declare-fun lt!382169 () (_ BitVec 64))

(declare-fun lt!382168 () (_ BitVec 64))

(assert (=> d!82160 (= res!204920 (= lt!382171 (bvsub lt!382168 lt!382169)))))

(assert (=> d!82160 (or (= (bvand lt!382168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382169 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382168 lt!382169) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82160 (= lt!382169 (remainingBits!0 ((_ sign_extend 32) (size!5876 (buf!6351 thiss!1005))) ((_ sign_extend 32) (currentByte!11735 thiss!1005)) ((_ sign_extend 32) (currentBit!11730 thiss!1005))))))

(declare-fun lt!382172 () (_ BitVec 64))

(declare-fun lt!382173 () (_ BitVec 64))

(assert (=> d!82160 (= lt!382168 (bvmul lt!382172 lt!382173))))

(assert (=> d!82160 (or (= lt!382172 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!382173 (bvsdiv (bvmul lt!382172 lt!382173) lt!382172)))))

(assert (=> d!82160 (= lt!382173 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82160 (= lt!382172 ((_ sign_extend 32) (size!5876 (buf!6351 thiss!1005))))))

(assert (=> d!82160 (= lt!382171 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11735 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11730 thiss!1005))))))

(assert (=> d!82160 (invariant!0 (currentBit!11730 thiss!1005) (currentByte!11735 thiss!1005) (size!5876 (buf!6351 thiss!1005)))))

(assert (=> d!82160 (= (bitIndex!0 (size!5876 (buf!6351 thiss!1005)) (currentByte!11735 thiss!1005) (currentBit!11730 thiss!1005)) lt!382171)))

(declare-fun b!245109 () Bool)

(declare-fun res!204919 () Bool)

(assert (=> b!245109 (=> (not res!204919) (not e!169859))))

(assert (=> b!245109 (= res!204919 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382171))))

(declare-fun b!245110 () Bool)

(declare-fun lt!382170 () (_ BitVec 64))

(assert (=> b!245110 (= e!169859 (bvsle lt!382171 (bvmul lt!382170 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245110 (or (= lt!382170 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!382170 #b0000000000000000000000000000000000000000000000000000000000001000) lt!382170)))))

(assert (=> b!245110 (= lt!382170 ((_ sign_extend 32) (size!5876 (buf!6351 thiss!1005))))))

(assert (= (and d!82160 res!204920) b!245109))

(assert (= (and b!245109 res!204919) b!245110))

(declare-fun m!369591 () Bool)

(assert (=> d!82160 m!369591))

(assert (=> d!82160 m!369549))

(assert (=> b!245025 d!82160))

(declare-fun d!82162 () Bool)

(declare-fun lt!382176 () tuple2!21036)

(declare-fun readBit!0 (BitStream!10674) tuple2!21036)

(assert (=> d!82162 (= lt!382176 (readBit!0 (readerFrom!0 (_2!11434 lt!382001) (currentBit!11730 thiss!1005) (currentByte!11735 thiss!1005))))))

(assert (=> d!82162 (= (readBitPure!0 (readerFrom!0 (_2!11434 lt!382001) (currentBit!11730 thiss!1005) (currentByte!11735 thiss!1005))) (tuple2!21027 (_2!11440 lt!382176) (_1!11440 lt!382176)))))

(declare-fun bs!20791 () Bool)

(assert (= bs!20791 d!82162))

(assert (=> bs!20791 m!369425))

(declare-fun m!369593 () Bool)

(assert (=> bs!20791 m!369593))

(assert (=> b!245023 d!82162))

(declare-fun d!82164 () Bool)

(declare-fun e!169862 () Bool)

(assert (=> d!82164 e!169862))

(declare-fun res!204924 () Bool)

(assert (=> d!82164 (=> (not res!204924) (not e!169862))))

(assert (=> d!82164 (= res!204924 (invariant!0 (currentBit!11730 (_2!11434 lt!382001)) (currentByte!11735 (_2!11434 lt!382001)) (size!5876 (buf!6351 (_2!11434 lt!382001)))))))

(assert (=> d!82164 (= (readerFrom!0 (_2!11434 lt!382001) (currentBit!11730 thiss!1005) (currentByte!11735 thiss!1005)) (BitStream!10675 (buf!6351 (_2!11434 lt!382001)) (currentByte!11735 thiss!1005) (currentBit!11730 thiss!1005)))))

(declare-fun b!245113 () Bool)

(assert (=> b!245113 (= e!169862 (invariant!0 (currentBit!11730 thiss!1005) (currentByte!11735 thiss!1005) (size!5876 (buf!6351 (_2!11434 lt!382001)))))))

(assert (= (and d!82164 res!204924) b!245113))

(assert (=> d!82164 m!369589))

(assert (=> b!245113 m!369403))

(assert (=> b!245023 d!82164))

(declare-fun d!82166 () Bool)

(declare-fun res!204927 () Bool)

(declare-fun e!169865 () Bool)

(assert (=> d!82166 (=> (not res!204927) (not e!169865))))

(assert (=> d!82166 (= res!204927 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!5876 (buf!6351 (_1!11436 lt!382004))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5876 (buf!6351 (_1!11436 lt!382004))))))))))

(assert (=> d!82166 (= (moveBitIndexPrecond!0 (_1!11436 lt!382004) #b0000000000000000000000000000000000000000000000000000000000000001) e!169865)))

(declare-fun b!245117 () Bool)

(declare-fun lt!382179 () (_ BitVec 64))

(assert (=> b!245117 (= e!169865 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382179) (bvsle lt!382179 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5876 (buf!6351 (_1!11436 lt!382004))))))))))

(assert (=> b!245117 (= lt!382179 (bvadd (bitIndex!0 (size!5876 (buf!6351 (_1!11436 lt!382004))) (currentByte!11735 (_1!11436 lt!382004)) (currentBit!11730 (_1!11436 lt!382004))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!82166 res!204927) b!245117))

(declare-fun m!369595 () Bool)

(assert (=> b!245117 m!369595))

(assert (=> b!245022 d!82166))

(declare-fun d!82168 () Bool)

(declare-fun e!169866 () Bool)

(assert (=> d!82168 e!169866))

(declare-fun res!204929 () Bool)

(assert (=> d!82168 (=> (not res!204929) (not e!169866))))

(declare-fun lt!382180 () (_ BitVec 64))

(declare-fun lt!382183 () (_ BitVec 64))

(declare-fun lt!382181 () (_ BitVec 64))

(assert (=> d!82168 (= res!204929 (= lt!382183 (bvsub lt!382180 lt!382181)))))

(assert (=> d!82168 (or (= (bvand lt!382180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382181 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382180 lt!382181) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82168 (= lt!382181 (remainingBits!0 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382020)))) ((_ sign_extend 32) (currentByte!11735 (_2!11434 lt!382020))) ((_ sign_extend 32) (currentBit!11730 (_2!11434 lt!382020)))))))

(declare-fun lt!382184 () (_ BitVec 64))

(declare-fun lt!382185 () (_ BitVec 64))

(assert (=> d!82168 (= lt!382180 (bvmul lt!382184 lt!382185))))

(assert (=> d!82168 (or (= lt!382184 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!382185 (bvsdiv (bvmul lt!382184 lt!382185) lt!382184)))))

(assert (=> d!82168 (= lt!382185 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82168 (= lt!382184 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382020)))))))

(assert (=> d!82168 (= lt!382183 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11735 (_2!11434 lt!382020))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11730 (_2!11434 lt!382020)))))))

(assert (=> d!82168 (invariant!0 (currentBit!11730 (_2!11434 lt!382020)) (currentByte!11735 (_2!11434 lt!382020)) (size!5876 (buf!6351 (_2!11434 lt!382020))))))

(assert (=> d!82168 (= (bitIndex!0 (size!5876 (buf!6351 (_2!11434 lt!382020))) (currentByte!11735 (_2!11434 lt!382020)) (currentBit!11730 (_2!11434 lt!382020))) lt!382183)))

(declare-fun b!245118 () Bool)

(declare-fun res!204928 () Bool)

(assert (=> b!245118 (=> (not res!204928) (not e!169866))))

(assert (=> b!245118 (= res!204928 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382183))))

(declare-fun b!245119 () Bool)

(declare-fun lt!382182 () (_ BitVec 64))

(assert (=> b!245119 (= e!169866 (bvsle lt!382183 (bvmul lt!382182 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245119 (or (= lt!382182 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!382182 #b0000000000000000000000000000000000000000000000000000000000001000) lt!382182)))))

(assert (=> b!245119 (= lt!382182 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382020)))))))

(assert (= (and d!82168 res!204929) b!245118))

(assert (= (and b!245118 res!204928) b!245119))

(declare-fun m!369597 () Bool)

(assert (=> d!82168 m!369597))

(declare-fun m!369599 () Bool)

(assert (=> d!82168 m!369599))

(assert (=> b!245020 d!82168))

(assert (=> b!245020 d!82158))

(declare-fun d!82170 () Bool)

(assert (=> d!82170 (= (invariant!0 (currentBit!11730 thiss!1005) (currentByte!11735 thiss!1005) (size!5876 (buf!6351 (_2!11434 lt!382020)))) (and (bvsge (currentBit!11730 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11730 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11735 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11735 thiss!1005) (size!5876 (buf!6351 (_2!11434 lt!382020)))) (and (= (currentBit!11730 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11735 thiss!1005) (size!5876 (buf!6351 (_2!11434 lt!382020))))))))))

(assert (=> b!245021 d!82170))

(declare-fun d!82172 () Bool)

(declare-fun e!169867 () Bool)

(assert (=> d!82172 e!169867))

(declare-fun res!204931 () Bool)

(assert (=> d!82172 (=> (not res!204931) (not e!169867))))

(declare-fun lt!382187 () (_ BitVec 64))

(declare-fun lt!382186 () (_ BitVec 64))

(declare-fun lt!382189 () (_ BitVec 64))

(assert (=> d!82172 (= res!204931 (= lt!382189 (bvsub lt!382186 lt!382187)))))

(assert (=> d!82172 (or (= (bvand lt!382186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382187 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382186 lt!382187) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82172 (= lt!382187 (remainingBits!0 ((_ sign_extend 32) (size!5876 (buf!6351 (_1!11435 lt!382002)))) ((_ sign_extend 32) (currentByte!11735 (_1!11435 lt!382002))) ((_ sign_extend 32) (currentBit!11730 (_1!11435 lt!382002)))))))

(declare-fun lt!382190 () (_ BitVec 64))

(declare-fun lt!382191 () (_ BitVec 64))

(assert (=> d!82172 (= lt!382186 (bvmul lt!382190 lt!382191))))

(assert (=> d!82172 (or (= lt!382190 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!382191 (bvsdiv (bvmul lt!382190 lt!382191) lt!382190)))))

(assert (=> d!82172 (= lt!382191 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82172 (= lt!382190 ((_ sign_extend 32) (size!5876 (buf!6351 (_1!11435 lt!382002)))))))

(assert (=> d!82172 (= lt!382189 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11735 (_1!11435 lt!382002))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11730 (_1!11435 lt!382002)))))))

(assert (=> d!82172 (invariant!0 (currentBit!11730 (_1!11435 lt!382002)) (currentByte!11735 (_1!11435 lt!382002)) (size!5876 (buf!6351 (_1!11435 lt!382002))))))

(assert (=> d!82172 (= (bitIndex!0 (size!5876 (buf!6351 (_1!11435 lt!382002))) (currentByte!11735 (_1!11435 lt!382002)) (currentBit!11730 (_1!11435 lt!382002))) lt!382189)))

(declare-fun b!245120 () Bool)

(declare-fun res!204930 () Bool)

(assert (=> b!245120 (=> (not res!204930) (not e!169867))))

(assert (=> b!245120 (= res!204930 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382189))))

(declare-fun b!245121 () Bool)

(declare-fun lt!382188 () (_ BitVec 64))

(assert (=> b!245121 (= e!169867 (bvsle lt!382189 (bvmul lt!382188 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245121 (or (= lt!382188 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!382188 #b0000000000000000000000000000000000000000000000000000000000001000) lt!382188)))))

(assert (=> b!245121 (= lt!382188 ((_ sign_extend 32) (size!5876 (buf!6351 (_1!11435 lt!382002)))))))

(assert (= (and d!82172 res!204931) b!245120))

(assert (= (and b!245120 res!204930) b!245121))

(declare-fun m!369601 () Bool)

(assert (=> d!82172 m!369601))

(declare-fun m!369603 () Bool)

(assert (=> d!82172 m!369603))

(assert (=> b!245019 d!82172))

(declare-fun d!82174 () Bool)

(assert (=> d!82174 (validate_offset_bits!1 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382020)))) ((_ sign_extend 32) (currentByte!11735 thiss!1005)) ((_ sign_extend 32) (currentBit!11730 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!382192 () Unit!17853)

(assert (=> d!82174 (= lt!382192 (choose!9 thiss!1005 (buf!6351 (_2!11434 lt!382020)) (bvsub nBits!297 from!289) (BitStream!10675 (buf!6351 (_2!11434 lt!382020)) (currentByte!11735 thiss!1005) (currentBit!11730 thiss!1005))))))

(assert (=> d!82174 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6351 (_2!11434 lt!382020)) (bvsub nBits!297 from!289)) lt!382192)))

(declare-fun bs!20792 () Bool)

(assert (= bs!20792 d!82174))

(assert (=> bs!20792 m!369437))

(declare-fun m!369605 () Bool)

(assert (=> bs!20792 m!369605))

(assert (=> b!245019 d!82174))

(declare-fun d!82176 () Bool)

(assert (=> d!82176 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382001)))) ((_ sign_extend 32) (currentByte!11735 (_2!11434 lt!382001))) ((_ sign_extend 32) (currentBit!11730 (_2!11434 lt!382001))) lt!382008) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382001)))) ((_ sign_extend 32) (currentByte!11735 (_2!11434 lt!382001))) ((_ sign_extend 32) (currentBit!11730 (_2!11434 lt!382001)))) lt!382008))))

(declare-fun bs!20793 () Bool)

(assert (= bs!20793 d!82176))

(assert (=> bs!20793 m!369587))

(assert (=> b!245019 d!82176))

(declare-fun d!82178 () Bool)

(assert (=> d!82178 (isPrefixOf!0 thiss!1005 (_2!11434 lt!382020))))

(declare-fun lt!382195 () Unit!17853)

(declare-fun choose!30 (BitStream!10674 BitStream!10674 BitStream!10674) Unit!17853)

(assert (=> d!82178 (= lt!382195 (choose!30 thiss!1005 (_2!11434 lt!382001) (_2!11434 lt!382020)))))

(assert (=> d!82178 (isPrefixOf!0 thiss!1005 (_2!11434 lt!382001))))

(assert (=> d!82178 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11434 lt!382001) (_2!11434 lt!382020)) lt!382195)))

(declare-fun bs!20794 () Bool)

(assert (= bs!20794 d!82178))

(assert (=> bs!20794 m!369465))

(declare-fun m!369607 () Bool)

(assert (=> bs!20794 m!369607))

(assert (=> bs!20794 m!369423))

(assert (=> b!245019 d!82178))

(declare-fun d!82180 () Bool)

(assert (=> d!82180 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382020)))) ((_ sign_extend 32) (currentByte!11735 thiss!1005)) ((_ sign_extend 32) (currentBit!11730 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382020)))) ((_ sign_extend 32) (currentByte!11735 thiss!1005)) ((_ sign_extend 32) (currentBit!11730 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20795 () Bool)

(assert (= bs!20795 d!82180))

(declare-fun m!369609 () Bool)

(assert (=> bs!20795 m!369609))

(assert (=> b!245019 d!82180))

(declare-fun d!82182 () Bool)

(declare-fun lt!382196 () tuple2!21036)

(assert (=> d!82182 (= lt!382196 (readBit!0 lt!382014))))

(assert (=> d!82182 (= (readBitPure!0 lt!382014) (tuple2!21027 (_2!11440 lt!382196) (_1!11440 lt!382196)))))

(declare-fun bs!20796 () Bool)

(assert (= bs!20796 d!82182))

(declare-fun m!369611 () Bool)

(assert (=> bs!20796 m!369611))

(assert (=> b!245019 d!82182))

(declare-fun d!82184 () Bool)

(declare-fun e!169872 () Bool)

(assert (=> d!82184 e!169872))

(declare-fun res!204942 () Bool)

(assert (=> d!82184 (=> (not res!204942) (not e!169872))))

(declare-fun lt!382220 () tuple2!21024)

(assert (=> d!82184 (= res!204942 (= (size!5876 (buf!6351 (_2!11434 lt!382001))) (size!5876 (buf!6351 (_2!11434 lt!382220)))))))

(declare-fun choose!51 (BitStream!10674 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21024)

(assert (=> d!82184 (= lt!382220 (choose!51 (_2!11434 lt!382001) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82184 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!82184 (= (appendNBitsLoop!0 (_2!11434 lt!382001) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!382220)))

(declare-fun b!245131 () Bool)

(declare-fun res!204943 () Bool)

(assert (=> b!245131 (=> (not res!204943) (not e!169872))))

(assert (=> b!245131 (= res!204943 (isPrefixOf!0 (_2!11434 lt!382001) (_2!11434 lt!382220)))))

(declare-fun b!245133 () Bool)

(declare-fun e!169873 () Bool)

(declare-fun lt!382218 () (_ BitVec 64))

(assert (=> b!245133 (= e!169873 (validate_offset_bits!1 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382001)))) ((_ sign_extend 32) (currentByte!11735 (_2!11434 lt!382001))) ((_ sign_extend 32) (currentBit!11730 (_2!11434 lt!382001))) lt!382218))))

(declare-fun b!245132 () Bool)

(declare-fun lt!382219 () tuple2!21026)

(declare-fun lt!382217 () tuple2!21028)

(assert (=> b!245132 (= e!169872 (and (_2!11435 lt!382219) (= (_1!11435 lt!382219) (_2!11436 lt!382217))))))

(assert (=> b!245132 (= lt!382219 (checkBitsLoopPure!0 (_1!11436 lt!382217) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!382216 () Unit!17853)

(declare-fun lt!382215 () Unit!17853)

(assert (=> b!245132 (= lt!382216 lt!382215)))

(assert (=> b!245132 (validate_offset_bits!1 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382220)))) ((_ sign_extend 32) (currentByte!11735 (_2!11434 lt!382001))) ((_ sign_extend 32) (currentBit!11730 (_2!11434 lt!382001))) lt!382218)))

(assert (=> b!245132 (= lt!382215 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11434 lt!382001) (buf!6351 (_2!11434 lt!382220)) lt!382218))))

(assert (=> b!245132 e!169873))

(declare-fun res!204941 () Bool)

(assert (=> b!245132 (=> (not res!204941) (not e!169873))))

(assert (=> b!245132 (= res!204941 (and (= (size!5876 (buf!6351 (_2!11434 lt!382001))) (size!5876 (buf!6351 (_2!11434 lt!382220)))) (bvsge lt!382218 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245132 (= lt!382218 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245132 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245132 (= lt!382217 (reader!0 (_2!11434 lt!382001) (_2!11434 lt!382220)))))

(declare-fun b!245130 () Bool)

(declare-fun res!204940 () Bool)

(assert (=> b!245130 (=> (not res!204940) (not e!169872))))

(declare-fun lt!382213 () (_ BitVec 64))

(declare-fun lt!382214 () (_ BitVec 64))

(assert (=> b!245130 (= res!204940 (= (bitIndex!0 (size!5876 (buf!6351 (_2!11434 lt!382220))) (currentByte!11735 (_2!11434 lt!382220)) (currentBit!11730 (_2!11434 lt!382220))) (bvadd lt!382213 lt!382214)))))

(assert (=> b!245130 (or (not (= (bvand lt!382213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382214 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!382213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!382213 lt!382214) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245130 (= lt!382214 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245130 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245130 (= lt!382213 (bitIndex!0 (size!5876 (buf!6351 (_2!11434 lt!382001))) (currentByte!11735 (_2!11434 lt!382001)) (currentBit!11730 (_2!11434 lt!382001))))))

(assert (= (and d!82184 res!204942) b!245130))

(assert (= (and b!245130 res!204940) b!245131))

(assert (= (and b!245131 res!204943) b!245132))

(assert (= (and b!245132 res!204941) b!245133))

(declare-fun m!369613 () Bool)

(assert (=> b!245130 m!369613))

(assert (=> b!245130 m!369405))

(declare-fun m!369615 () Bool)

(assert (=> b!245133 m!369615))

(declare-fun m!369617 () Bool)

(assert (=> d!82184 m!369617))

(declare-fun m!369619 () Bool)

(assert (=> b!245132 m!369619))

(declare-fun m!369621 () Bool)

(assert (=> b!245132 m!369621))

(declare-fun m!369623 () Bool)

(assert (=> b!245132 m!369623))

(declare-fun m!369625 () Bool)

(assert (=> b!245132 m!369625))

(declare-fun m!369627 () Bool)

(assert (=> b!245131 m!369627))

(assert (=> b!245019 d!82184))

(declare-fun d!82186 () Bool)

(declare-fun e!169874 () Bool)

(assert (=> d!82186 e!169874))

(declare-fun res!204944 () Bool)

(assert (=> d!82186 (=> (not res!204944) (not e!169874))))

(declare-fun lt!382227 () tuple2!21028)

(assert (=> d!82186 (= res!204944 (isPrefixOf!0 (_1!11436 lt!382227) (_2!11436 lt!382227)))))

(declare-fun lt!382230 () BitStream!10674)

(assert (=> d!82186 (= lt!382227 (tuple2!21029 lt!382230 (_2!11434 lt!382020)))))

(declare-fun lt!382237 () Unit!17853)

(declare-fun lt!382235 () Unit!17853)

(assert (=> d!82186 (= lt!382237 lt!382235)))

(assert (=> d!82186 (isPrefixOf!0 lt!382230 (_2!11434 lt!382020))))

(assert (=> d!82186 (= lt!382235 (lemmaIsPrefixTransitive!0 lt!382230 (_2!11434 lt!382020) (_2!11434 lt!382020)))))

(declare-fun lt!382229 () Unit!17853)

(declare-fun lt!382223 () Unit!17853)

(assert (=> d!82186 (= lt!382229 lt!382223)))

(assert (=> d!82186 (isPrefixOf!0 lt!382230 (_2!11434 lt!382020))))

(assert (=> d!82186 (= lt!382223 (lemmaIsPrefixTransitive!0 lt!382230 thiss!1005 (_2!11434 lt!382020)))))

(declare-fun lt!382221 () Unit!17853)

(declare-fun e!169875 () Unit!17853)

(assert (=> d!82186 (= lt!382221 e!169875)))

(declare-fun c!11480 () Bool)

(assert (=> d!82186 (= c!11480 (not (= (size!5876 (buf!6351 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!382226 () Unit!17853)

(declare-fun lt!382224 () Unit!17853)

(assert (=> d!82186 (= lt!382226 lt!382224)))

(assert (=> d!82186 (isPrefixOf!0 (_2!11434 lt!382020) (_2!11434 lt!382020))))

(assert (=> d!82186 (= lt!382224 (lemmaIsPrefixRefl!0 (_2!11434 lt!382020)))))

(declare-fun lt!382231 () Unit!17853)

(declare-fun lt!382232 () Unit!17853)

(assert (=> d!82186 (= lt!382231 lt!382232)))

(assert (=> d!82186 (= lt!382232 (lemmaIsPrefixRefl!0 (_2!11434 lt!382020)))))

(declare-fun lt!382239 () Unit!17853)

(declare-fun lt!382225 () Unit!17853)

(assert (=> d!82186 (= lt!382239 lt!382225)))

(assert (=> d!82186 (isPrefixOf!0 lt!382230 lt!382230)))

(assert (=> d!82186 (= lt!382225 (lemmaIsPrefixRefl!0 lt!382230))))

(declare-fun lt!382233 () Unit!17853)

(declare-fun lt!382234 () Unit!17853)

(assert (=> d!82186 (= lt!382233 lt!382234)))

(assert (=> d!82186 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!82186 (= lt!382234 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!82186 (= lt!382230 (BitStream!10675 (buf!6351 (_2!11434 lt!382020)) (currentByte!11735 thiss!1005) (currentBit!11730 thiss!1005)))))

(assert (=> d!82186 (isPrefixOf!0 thiss!1005 (_2!11434 lt!382020))))

(assert (=> d!82186 (= (reader!0 thiss!1005 (_2!11434 lt!382020)) lt!382227)))

(declare-fun b!245134 () Bool)

(declare-fun res!204946 () Bool)

(assert (=> b!245134 (=> (not res!204946) (not e!169874))))

(assert (=> b!245134 (= res!204946 (isPrefixOf!0 (_1!11436 lt!382227) thiss!1005))))

(declare-fun b!245135 () Bool)

(declare-fun Unit!17858 () Unit!17853)

(assert (=> b!245135 (= e!169875 Unit!17858)))

(declare-fun b!245136 () Bool)

(declare-fun res!204945 () Bool)

(assert (=> b!245136 (=> (not res!204945) (not e!169874))))

(assert (=> b!245136 (= res!204945 (isPrefixOf!0 (_2!11436 lt!382227) (_2!11434 lt!382020)))))

(declare-fun b!245137 () Bool)

(declare-fun lt!382238 () Unit!17853)

(assert (=> b!245137 (= e!169875 lt!382238)))

(declare-fun lt!382236 () (_ BitVec 64))

(assert (=> b!245137 (= lt!382236 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!382240 () (_ BitVec 64))

(assert (=> b!245137 (= lt!382240 (bitIndex!0 (size!5876 (buf!6351 thiss!1005)) (currentByte!11735 thiss!1005) (currentBit!11730 thiss!1005)))))

(assert (=> b!245137 (= lt!382238 (arrayBitRangesEqSymmetric!0 (buf!6351 thiss!1005) (buf!6351 (_2!11434 lt!382020)) lt!382236 lt!382240))))

(assert (=> b!245137 (arrayBitRangesEq!0 (buf!6351 (_2!11434 lt!382020)) (buf!6351 thiss!1005) lt!382236 lt!382240)))

(declare-fun lt!382222 () (_ BitVec 64))

(declare-fun b!245138 () Bool)

(declare-fun lt!382228 () (_ BitVec 64))

(assert (=> b!245138 (= e!169874 (= (_1!11436 lt!382227) (withMovedBitIndex!0 (_2!11436 lt!382227) (bvsub lt!382222 lt!382228))))))

(assert (=> b!245138 (or (= (bvand lt!382222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382228 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382222 lt!382228) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245138 (= lt!382228 (bitIndex!0 (size!5876 (buf!6351 (_2!11434 lt!382020))) (currentByte!11735 (_2!11434 lt!382020)) (currentBit!11730 (_2!11434 lt!382020))))))

(assert (=> b!245138 (= lt!382222 (bitIndex!0 (size!5876 (buf!6351 thiss!1005)) (currentByte!11735 thiss!1005) (currentBit!11730 thiss!1005)))))

(assert (= (and d!82186 c!11480) b!245137))

(assert (= (and d!82186 (not c!11480)) b!245135))

(assert (= (and d!82186 res!204944) b!245134))

(assert (= (and b!245134 res!204946) b!245136))

(assert (= (and b!245136 res!204945) b!245138))

(declare-fun m!369629 () Bool)

(assert (=> b!245134 m!369629))

(assert (=> b!245137 m!369407))

(declare-fun m!369631 () Bool)

(assert (=> b!245137 m!369631))

(declare-fun m!369633 () Bool)

(assert (=> b!245137 m!369633))

(declare-fun m!369635 () Bool)

(assert (=> d!82186 m!369635))

(assert (=> d!82186 m!369565))

(declare-fun m!369637 () Bool)

(assert (=> d!82186 m!369637))

(declare-fun m!369639 () Bool)

(assert (=> d!82186 m!369639))

(declare-fun m!369641 () Bool)

(assert (=> d!82186 m!369641))

(declare-fun m!369643 () Bool)

(assert (=> d!82186 m!369643))

(declare-fun m!369645 () Bool)

(assert (=> d!82186 m!369645))

(assert (=> d!82186 m!369577))

(declare-fun m!369647 () Bool)

(assert (=> d!82186 m!369647))

(declare-fun m!369649 () Bool)

(assert (=> d!82186 m!369649))

(assert (=> d!82186 m!369465))

(declare-fun m!369651 () Bool)

(assert (=> b!245138 m!369651))

(assert (=> b!245138 m!369409))

(assert (=> b!245138 m!369407))

(declare-fun m!369653 () Bool)

(assert (=> b!245136 m!369653))

(assert (=> b!245019 d!82186))

(declare-fun d!82188 () Bool)

(assert (=> d!82188 (validate_offset_bits!1 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382020)))) ((_ sign_extend 32) (currentByte!11735 (_2!11434 lt!382001))) ((_ sign_extend 32) (currentBit!11730 (_2!11434 lt!382001))) lt!382008)))

(declare-fun lt!382241 () Unit!17853)

(assert (=> d!82188 (= lt!382241 (choose!9 (_2!11434 lt!382001) (buf!6351 (_2!11434 lt!382020)) lt!382008 (BitStream!10675 (buf!6351 (_2!11434 lt!382020)) (currentByte!11735 (_2!11434 lt!382001)) (currentBit!11730 (_2!11434 lt!382001)))))))

(assert (=> d!82188 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11434 lt!382001) (buf!6351 (_2!11434 lt!382020)) lt!382008) lt!382241)))

(declare-fun bs!20797 () Bool)

(assert (= bs!20797 d!82188))

(assert (=> bs!20797 m!369441))

(declare-fun m!369655 () Bool)

(assert (=> bs!20797 m!369655))

(assert (=> b!245019 d!82188))

(declare-fun d!82190 () Bool)

(declare-fun lt!382242 () tuple2!21036)

(assert (=> d!82190 (= lt!382242 (readBit!0 (_1!11436 lt!382004)))))

(assert (=> d!82190 (= (readBitPure!0 (_1!11436 lt!382004)) (tuple2!21027 (_2!11440 lt!382242) (_1!11440 lt!382242)))))

(declare-fun bs!20798 () Bool)

(assert (= bs!20798 d!82190))

(declare-fun m!369657 () Bool)

(assert (=> bs!20798 m!369657))

(assert (=> b!245019 d!82190))

(declare-fun d!82192 () Bool)

(declare-fun e!169876 () Bool)

(assert (=> d!82192 e!169876))

(declare-fun res!204948 () Bool)

(assert (=> d!82192 (=> (not res!204948) (not e!169876))))

(declare-fun lt!382244 () (_ BitVec 64))

(declare-fun lt!382243 () (_ BitVec 64))

(declare-fun lt!382246 () (_ BitVec 64))

(assert (=> d!82192 (= res!204948 (= lt!382246 (bvsub lt!382243 lt!382244)))))

(assert (=> d!82192 (or (= (bvand lt!382243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382244 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382243 lt!382244) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82192 (= lt!382244 (remainingBits!0 ((_ sign_extend 32) (size!5876 (buf!6351 (_1!11435 lt!382009)))) ((_ sign_extend 32) (currentByte!11735 (_1!11435 lt!382009))) ((_ sign_extend 32) (currentBit!11730 (_1!11435 lt!382009)))))))

(declare-fun lt!382247 () (_ BitVec 64))

(declare-fun lt!382248 () (_ BitVec 64))

(assert (=> d!82192 (= lt!382243 (bvmul lt!382247 lt!382248))))

(assert (=> d!82192 (or (= lt!382247 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!382248 (bvsdiv (bvmul lt!382247 lt!382248) lt!382247)))))

(assert (=> d!82192 (= lt!382248 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82192 (= lt!382247 ((_ sign_extend 32) (size!5876 (buf!6351 (_1!11435 lt!382009)))))))

(assert (=> d!82192 (= lt!382246 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11735 (_1!11435 lt!382009))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11730 (_1!11435 lt!382009)))))))

(assert (=> d!82192 (invariant!0 (currentBit!11730 (_1!11435 lt!382009)) (currentByte!11735 (_1!11435 lt!382009)) (size!5876 (buf!6351 (_1!11435 lt!382009))))))

(assert (=> d!82192 (= (bitIndex!0 (size!5876 (buf!6351 (_1!11435 lt!382009))) (currentByte!11735 (_1!11435 lt!382009)) (currentBit!11730 (_1!11435 lt!382009))) lt!382246)))

(declare-fun b!245139 () Bool)

(declare-fun res!204947 () Bool)

(assert (=> b!245139 (=> (not res!204947) (not e!169876))))

(assert (=> b!245139 (= res!204947 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382246))))

(declare-fun b!245140 () Bool)

(declare-fun lt!382245 () (_ BitVec 64))

(assert (=> b!245140 (= e!169876 (bvsle lt!382246 (bvmul lt!382245 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245140 (or (= lt!382245 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!382245 #b0000000000000000000000000000000000000000000000000000000000001000) lt!382245)))))

(assert (=> b!245140 (= lt!382245 ((_ sign_extend 32) (size!5876 (buf!6351 (_1!11435 lt!382009)))))))

(assert (= (and d!82192 res!204948) b!245139))

(assert (= (and b!245139 res!204947) b!245140))

(declare-fun m!369659 () Bool)

(assert (=> d!82192 m!369659))

(declare-fun m!369661 () Bool)

(assert (=> d!82192 m!369661))

(assert (=> b!245019 d!82192))

(declare-fun lt!382249 () tuple2!21036)

(declare-fun d!82194 () Bool)

(assert (=> d!82194 (= lt!382249 (checkBitsLoop!0 (_1!11436 lt!382004) nBits!297 bit!26 from!289))))

(assert (=> d!82194 (= (checkBitsLoopPure!0 (_1!11436 lt!382004) nBits!297 bit!26 from!289) (tuple2!21027 (_2!11440 lt!382249) (_1!11440 lt!382249)))))

(declare-fun bs!20799 () Bool)

(assert (= bs!20799 d!82194))

(declare-fun m!369663 () Bool)

(assert (=> bs!20799 m!369663))

(assert (=> b!245019 d!82194))

(declare-fun d!82196 () Bool)

(declare-fun lt!382250 () tuple2!21036)

(assert (=> d!82196 (= lt!382250 (checkBitsLoop!0 (_1!11436 lt!382019) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82196 (= (checkBitsLoopPure!0 (_1!11436 lt!382019) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21027 (_2!11440 lt!382250) (_1!11440 lt!382250)))))

(declare-fun bs!20800 () Bool)

(assert (= bs!20800 d!82196))

(declare-fun m!369665 () Bool)

(assert (=> bs!20800 m!369665))

(assert (=> b!245019 d!82196))

(declare-fun d!82198 () Bool)

(declare-fun res!204949 () Bool)

(declare-fun e!169877 () Bool)

(assert (=> d!82198 (=> (not res!204949) (not e!169877))))

(assert (=> d!82198 (= res!204949 (= (size!5876 (buf!6351 thiss!1005)) (size!5876 (buf!6351 (_2!11434 lt!382020)))))))

(assert (=> d!82198 (= (isPrefixOf!0 thiss!1005 (_2!11434 lt!382020)) e!169877)))

(declare-fun b!245141 () Bool)

(declare-fun res!204951 () Bool)

(assert (=> b!245141 (=> (not res!204951) (not e!169877))))

(assert (=> b!245141 (= res!204951 (bvsle (bitIndex!0 (size!5876 (buf!6351 thiss!1005)) (currentByte!11735 thiss!1005) (currentBit!11730 thiss!1005)) (bitIndex!0 (size!5876 (buf!6351 (_2!11434 lt!382020))) (currentByte!11735 (_2!11434 lt!382020)) (currentBit!11730 (_2!11434 lt!382020)))))))

(declare-fun b!245142 () Bool)

(declare-fun e!169878 () Bool)

(assert (=> b!245142 (= e!169877 e!169878)))

(declare-fun res!204950 () Bool)

(assert (=> b!245142 (=> res!204950 e!169878)))

(assert (=> b!245142 (= res!204950 (= (size!5876 (buf!6351 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!245143 () Bool)

(assert (=> b!245143 (= e!169878 (arrayBitRangesEq!0 (buf!6351 thiss!1005) (buf!6351 (_2!11434 lt!382020)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5876 (buf!6351 thiss!1005)) (currentByte!11735 thiss!1005) (currentBit!11730 thiss!1005))))))

(assert (= (and d!82198 res!204949) b!245141))

(assert (= (and b!245141 res!204951) b!245142))

(assert (= (and b!245142 (not res!204950)) b!245143))

(assert (=> b!245141 m!369407))

(assert (=> b!245141 m!369409))

(assert (=> b!245143 m!369407))

(assert (=> b!245143 m!369407))

(declare-fun m!369667 () Bool)

(assert (=> b!245143 m!369667))

(assert (=> b!245019 d!82198))

(declare-fun b!245153 () Bool)

(declare-fun res!204962 () Bool)

(declare-fun e!169883 () Bool)

(assert (=> b!245153 (=> (not res!204962) (not e!169883))))

(declare-fun lt!382261 () (_ BitVec 64))

(declare-fun lt!382262 () (_ BitVec 64))

(declare-fun lt!382259 () tuple2!21024)

(assert (=> b!245153 (= res!204962 (= (bitIndex!0 (size!5876 (buf!6351 (_2!11434 lt!382259))) (currentByte!11735 (_2!11434 lt!382259)) (currentBit!11730 (_2!11434 lt!382259))) (bvadd lt!382262 lt!382261)))))

(assert (=> b!245153 (or (not (= (bvand lt!382262 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382261 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!382262 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!382262 lt!382261) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245153 (= lt!382261 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!245153 (= lt!382262 (bitIndex!0 (size!5876 (buf!6351 thiss!1005)) (currentByte!11735 thiss!1005) (currentBit!11730 thiss!1005)))))

(declare-fun b!245154 () Bool)

(declare-fun res!204961 () Bool)

(assert (=> b!245154 (=> (not res!204961) (not e!169883))))

(assert (=> b!245154 (= res!204961 (isPrefixOf!0 thiss!1005 (_2!11434 lt!382259)))))

(declare-fun b!245156 () Bool)

(declare-fun e!169884 () Bool)

(declare-fun lt!382260 () tuple2!21026)

(assert (=> b!245156 (= e!169884 (= (bitIndex!0 (size!5876 (buf!6351 (_1!11435 lt!382260))) (currentByte!11735 (_1!11435 lt!382260)) (currentBit!11730 (_1!11435 lt!382260))) (bitIndex!0 (size!5876 (buf!6351 (_2!11434 lt!382259))) (currentByte!11735 (_2!11434 lt!382259)) (currentBit!11730 (_2!11434 lt!382259)))))))

(declare-fun b!245155 () Bool)

(assert (=> b!245155 (= e!169883 e!169884)))

(declare-fun res!204960 () Bool)

(assert (=> b!245155 (=> (not res!204960) (not e!169884))))

(assert (=> b!245155 (= res!204960 (and (= (_2!11435 lt!382260) bit!26) (= (_1!11435 lt!382260) (_2!11434 lt!382259))))))

(assert (=> b!245155 (= lt!382260 (readBitPure!0 (readerFrom!0 (_2!11434 lt!382259) (currentBit!11730 thiss!1005) (currentByte!11735 thiss!1005))))))

(declare-fun d!82200 () Bool)

(assert (=> d!82200 e!169883))

(declare-fun res!204963 () Bool)

(assert (=> d!82200 (=> (not res!204963) (not e!169883))))

(assert (=> d!82200 (= res!204963 (= (size!5876 (buf!6351 thiss!1005)) (size!5876 (buf!6351 (_2!11434 lt!382259)))))))

(declare-fun choose!16 (BitStream!10674 Bool) tuple2!21024)

(assert (=> d!82200 (= lt!382259 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!82200 (validate_offset_bit!0 ((_ sign_extend 32) (size!5876 (buf!6351 thiss!1005))) ((_ sign_extend 32) (currentByte!11735 thiss!1005)) ((_ sign_extend 32) (currentBit!11730 thiss!1005)))))

(assert (=> d!82200 (= (appendBit!0 thiss!1005 bit!26) lt!382259)))

(assert (= (and d!82200 res!204963) b!245153))

(assert (= (and b!245153 res!204962) b!245154))

(assert (= (and b!245154 res!204961) b!245155))

(assert (= (and b!245155 res!204960) b!245156))

(declare-fun m!369669 () Bool)

(assert (=> d!82200 m!369669))

(declare-fun m!369671 () Bool)

(assert (=> d!82200 m!369671))

(declare-fun m!369673 () Bool)

(assert (=> b!245156 m!369673))

(declare-fun m!369675 () Bool)

(assert (=> b!245156 m!369675))

(assert (=> b!245153 m!369675))

(assert (=> b!245153 m!369407))

(declare-fun m!369677 () Bool)

(assert (=> b!245155 m!369677))

(assert (=> b!245155 m!369677))

(declare-fun m!369679 () Bool)

(assert (=> b!245155 m!369679))

(declare-fun m!369681 () Bool)

(assert (=> b!245154 m!369681))

(assert (=> b!245019 d!82200))

(declare-fun d!82202 () Bool)

(declare-fun e!169887 () Bool)

(assert (=> d!82202 e!169887))

(declare-fun res!204966 () Bool)

(assert (=> d!82202 (=> (not res!204966) (not e!169887))))

(assert (=> d!82202 (= res!204966 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!382265 () Unit!17853)

(declare-fun choose!27 (BitStream!10674 BitStream!10674 (_ BitVec 64) (_ BitVec 64)) Unit!17853)

(assert (=> d!82202 (= lt!382265 (choose!27 thiss!1005 (_2!11434 lt!382001) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!82202 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!82202 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11434 lt!382001) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!382265)))

(declare-fun b!245159 () Bool)

(assert (=> b!245159 (= e!169887 (validate_offset_bits!1 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382001)))) ((_ sign_extend 32) (currentByte!11735 (_2!11434 lt!382001))) ((_ sign_extend 32) (currentBit!11730 (_2!11434 lt!382001))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!82202 res!204966) b!245159))

(declare-fun m!369683 () Bool)

(assert (=> d!82202 m!369683))

(declare-fun m!369685 () Bool)

(assert (=> b!245159 m!369685))

(assert (=> b!245019 d!82202))

(declare-fun d!82204 () Bool)

(assert (=> d!82204 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382020)))) ((_ sign_extend 32) (currentByte!11735 (_2!11434 lt!382001))) ((_ sign_extend 32) (currentBit!11730 (_2!11434 lt!382001))) lt!382008) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5876 (buf!6351 (_2!11434 lt!382020)))) ((_ sign_extend 32) (currentByte!11735 (_2!11434 lt!382001))) ((_ sign_extend 32) (currentBit!11730 (_2!11434 lt!382001)))) lt!382008))))

(declare-fun bs!20801 () Bool)

(assert (= bs!20801 d!82204))

(assert (=> bs!20801 m!369553))

(assert (=> b!245019 d!82204))

(declare-fun d!82206 () Bool)

(declare-fun lt!382266 () tuple2!21036)

(assert (=> d!82206 (= lt!382266 (readBit!0 (BitStream!10675 (buf!6351 (_2!11434 lt!382020)) (currentByte!11735 thiss!1005) (currentBit!11730 thiss!1005))))))

(assert (=> d!82206 (= (readBitPure!0 (BitStream!10675 (buf!6351 (_2!11434 lt!382020)) (currentByte!11735 thiss!1005) (currentBit!11730 thiss!1005))) (tuple2!21027 (_2!11440 lt!382266) (_1!11440 lt!382266)))))

(declare-fun bs!20802 () Bool)

(assert (= bs!20802 d!82206))

(declare-fun m!369687 () Bool)

(assert (=> bs!20802 m!369687))

(assert (=> b!245019 d!82206))

(assert (=> b!245019 d!82156))

(declare-fun d!82208 () Bool)

(declare-fun e!169890 () Bool)

(assert (=> d!82208 e!169890))

(declare-fun res!204969 () Bool)

(assert (=> d!82208 (=> (not res!204969) (not e!169890))))

(declare-fun lt!382278 () tuple2!21026)

(declare-fun lt!382275 () tuple2!21026)

(assert (=> d!82208 (= res!204969 (= (bitIndex!0 (size!5876 (buf!6351 (_1!11435 lt!382278))) (currentByte!11735 (_1!11435 lt!382278)) (currentBit!11730 (_1!11435 lt!382278))) (bitIndex!0 (size!5876 (buf!6351 (_1!11435 lt!382275))) (currentByte!11735 (_1!11435 lt!382275)) (currentBit!11730 (_1!11435 lt!382275)))))))

(declare-fun lt!382277 () Unit!17853)

(declare-fun lt!382276 () BitStream!10674)

(declare-fun choose!50 (BitStream!10674 BitStream!10674 BitStream!10674 tuple2!21026 tuple2!21026 BitStream!10674 Bool tuple2!21026 tuple2!21026 BitStream!10674 Bool) Unit!17853)

(assert (=> d!82208 (= lt!382277 (choose!50 lt!382014 (_2!11434 lt!382020) lt!382276 lt!382278 (tuple2!21027 (_1!11435 lt!382278) (_2!11435 lt!382278)) (_1!11435 lt!382278) (_2!11435 lt!382278) lt!382275 (tuple2!21027 (_1!11435 lt!382275) (_2!11435 lt!382275)) (_1!11435 lt!382275) (_2!11435 lt!382275)))))

(assert (=> d!82208 (= lt!382275 (readBitPure!0 lt!382276))))

(assert (=> d!82208 (= lt!382278 (readBitPure!0 lt!382014))))

(assert (=> d!82208 (= lt!382276 (BitStream!10675 (buf!6351 (_2!11434 lt!382020)) (currentByte!11735 lt!382014) (currentBit!11730 lt!382014)))))

(assert (=> d!82208 (invariant!0 (currentBit!11730 lt!382014) (currentByte!11735 lt!382014) (size!5876 (buf!6351 (_2!11434 lt!382020))))))

(assert (=> d!82208 (= (readBitPrefixLemma!0 lt!382014 (_2!11434 lt!382020)) lt!382277)))

(declare-fun b!245162 () Bool)

(assert (=> b!245162 (= e!169890 (= (_2!11435 lt!382278) (_2!11435 lt!382275)))))

(assert (= (and d!82208 res!204969) b!245162))

(declare-fun m!369689 () Bool)

(assert (=> d!82208 m!369689))

(assert (=> d!82208 m!369451))

(declare-fun m!369691 () Bool)

(assert (=> d!82208 m!369691))

(declare-fun m!369693 () Bool)

(assert (=> d!82208 m!369693))

(declare-fun m!369695 () Bool)

(assert (=> d!82208 m!369695))

(declare-fun m!369697 () Bool)

(assert (=> d!82208 m!369697))

(assert (=> b!245019 d!82208))

(declare-fun d!82210 () Bool)

(assert (=> d!82210 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5876 (buf!6351 thiss!1005))) ((_ sign_extend 32) (currentByte!11735 thiss!1005)) ((_ sign_extend 32) (currentBit!11730 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5876 (buf!6351 thiss!1005))) ((_ sign_extend 32) (currentByte!11735 thiss!1005)) ((_ sign_extend 32) (currentBit!11730 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20803 () Bool)

(assert (= bs!20803 d!82210))

(assert (=> bs!20803 m!369591))

(assert (=> b!245030 d!82210))

(declare-fun d!82212 () Bool)

(assert (=> d!82212 (= (array_inv!5617 (buf!6351 thiss!1005)) (bvsge (size!5876 (buf!6351 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!245028 d!82212))

(declare-fun d!82214 () Bool)

(declare-fun e!169891 () Bool)

(assert (=> d!82214 e!169891))

(declare-fun res!204971 () Bool)

(assert (=> d!82214 (=> (not res!204971) (not e!169891))))

(declare-fun lt!382280 () (_ BitVec 64))

(declare-fun lt!382282 () (_ BitVec 64))

(declare-fun lt!382279 () (_ BitVec 64))

(assert (=> d!82214 (= res!204971 (= lt!382282 (bvsub lt!382279 lt!382280)))))

(assert (=> d!82214 (or (= (bvand lt!382279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382280 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382279 lt!382280) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82214 (= lt!382280 (remainingBits!0 ((_ sign_extend 32) (size!5876 (buf!6351 (_1!11435 lt!382006)))) ((_ sign_extend 32) (currentByte!11735 (_1!11435 lt!382006))) ((_ sign_extend 32) (currentBit!11730 (_1!11435 lt!382006)))))))

(declare-fun lt!382283 () (_ BitVec 64))

(declare-fun lt!382284 () (_ BitVec 64))

(assert (=> d!82214 (= lt!382279 (bvmul lt!382283 lt!382284))))

(assert (=> d!82214 (or (= lt!382283 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!382284 (bvsdiv (bvmul lt!382283 lt!382284) lt!382283)))))

(assert (=> d!82214 (= lt!382284 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82214 (= lt!382283 ((_ sign_extend 32) (size!5876 (buf!6351 (_1!11435 lt!382006)))))))

(assert (=> d!82214 (= lt!382282 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11735 (_1!11435 lt!382006))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11730 (_1!11435 lt!382006)))))))

(assert (=> d!82214 (invariant!0 (currentBit!11730 (_1!11435 lt!382006)) (currentByte!11735 (_1!11435 lt!382006)) (size!5876 (buf!6351 (_1!11435 lt!382006))))))

(assert (=> d!82214 (= (bitIndex!0 (size!5876 (buf!6351 (_1!11435 lt!382006))) (currentByte!11735 (_1!11435 lt!382006)) (currentBit!11730 (_1!11435 lt!382006))) lt!382282)))

(declare-fun b!245163 () Bool)

(declare-fun res!204970 () Bool)

(assert (=> b!245163 (=> (not res!204970) (not e!169891))))

(assert (=> b!245163 (= res!204970 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382282))))

(declare-fun b!245164 () Bool)

(declare-fun lt!382281 () (_ BitVec 64))

(assert (=> b!245164 (= e!169891 (bvsle lt!382282 (bvmul lt!382281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245164 (or (= lt!382281 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!382281 #b0000000000000000000000000000000000000000000000000000000000001000) lt!382281)))))

(assert (=> b!245164 (= lt!382281 ((_ sign_extend 32) (size!5876 (buf!6351 (_1!11435 lt!382006)))))))

(assert (= (and d!82214 res!204971) b!245163))

(assert (= (and b!245163 res!204970) b!245164))

(declare-fun m!369699 () Bool)

(assert (=> d!82214 m!369699))

(declare-fun m!369701 () Bool)

(assert (=> d!82214 m!369701))

(assert (=> b!245018 d!82214))

(check-sat (not b!245141) (not d!82180) (not b!245082) (not d!82192) (not d!82168) (not b!245098) (not b!245155) (not d!82178) (not d!82152) (not d!82206) (not b!245131) (not d!82210) (not b!245132) (not b!245133) (not b!245084) (not d!82150) (not d!82158) (not d!82184) (not b!245130) (not b!245113) (not d!82154) (not d!82200) (not b!245143) (not b!245117) (not b!245137) (not b!245134) (not d!82160) (not d!82204) (not d!82214) (not b!245087) (not d!82182) (not d!82156) (not b!245085) (not d!82188) (not d!82196) (not b!245138) (not b!245154) (not d!82186) (not d!82202) (not d!82164) (not b!245101) (not b!245156) (not d!82174) (not b!245100) (not d!82162) (not d!82172) (not b!245136) (not d!82208) (not b!245159) (not b!245153) (not d!82194) (not b!245102) (not d!82190) (not d!82176) (not d!82146))
(check-sat)
