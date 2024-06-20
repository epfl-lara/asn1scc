; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25812 () Bool)

(assert start!25812)

(declare-fun b!131853 () Bool)

(declare-fun res!109426 () Bool)

(declare-fun e!87414 () Bool)

(assert (=> b!131853 (=> (not res!109426) (not e!87414))))

(declare-datatypes ((array!6087 0))(
  ( (array!6088 (arr!3385 (Array (_ BitVec 32) (_ BitVec 8))) (size!2756 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4776 0))(
  ( (BitStream!4777 (buf!3123 array!6087) (currentByte!5902 (_ BitVec 32)) (currentBit!5897 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4776)

(declare-datatypes ((Unit!8135 0))(
  ( (Unit!8136) )
))
(declare-datatypes ((tuple2!11418 0))(
  ( (tuple2!11419 (_1!6012 Unit!8135) (_2!6012 BitStream!4776)) )
))
(declare-fun lt!203404 () tuple2!11418)

(declare-fun isPrefixOf!0 (BitStream!4776 BitStream!4776) Bool)

(assert (=> b!131853 (= res!109426 (isPrefixOf!0 thiss!1634 (_2!6012 lt!203404)))))

(declare-fun b!131854 () Bool)

(declare-fun e!87410 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!131854 (= e!87410 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun lt!203394 () tuple2!11418)

(declare-fun lt!203392 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!131854 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2756 (buf!3123 (_2!6012 lt!203394)))) ((_ sign_extend 32) (currentByte!5902 (_2!6012 lt!203404))) ((_ sign_extend 32) (currentBit!5897 (_2!6012 lt!203404))) lt!203392)))

(declare-fun lt!203405 () Unit!8135)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4776 array!6087 (_ BitVec 32)) Unit!8135)

(assert (=> b!131854 (= lt!203405 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6012 lt!203404) (buf!3123 (_2!6012 lt!203394)) lt!203392))))

(declare-fun e!87415 () Bool)

(assert (=> b!131854 e!87415))

(declare-fun res!109427 () Bool)

(assert (=> b!131854 (=> (not res!109427) (not e!87415))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!131854 (= res!109427 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2756 (buf!3123 (_2!6012 lt!203394)))) ((_ sign_extend 32) (currentByte!5902 thiss!1634)) ((_ sign_extend 32) (currentBit!5897 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!203408 () Unit!8135)

(assert (=> b!131854 (= lt!203408 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3123 (_2!6012 lt!203394)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!11420 0))(
  ( (tuple2!11421 (_1!6013 BitStream!4776) (_2!6013 BitStream!4776)) )
))
(declare-fun lt!203395 () tuple2!11420)

(declare-fun arr!237 () array!6087)

(declare-datatypes ((tuple2!11422 0))(
  ( (tuple2!11423 (_1!6014 BitStream!4776) (_2!6014 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!4776) tuple2!11422)

(assert (=> b!131854 (= (_2!6014 (readBytePure!0 (_1!6013 lt!203395))) (select (arr!3385 arr!237) from!447))))

(declare-fun lt!203400 () tuple2!11420)

(declare-fun reader!0 (BitStream!4776 BitStream!4776) tuple2!11420)

(assert (=> b!131854 (= lt!203400 (reader!0 (_2!6012 lt!203404) (_2!6012 lt!203394)))))

(assert (=> b!131854 (= lt!203395 (reader!0 thiss!1634 (_2!6012 lt!203394)))))

(declare-fun e!87409 () Bool)

(assert (=> b!131854 e!87409))

(declare-fun res!109428 () Bool)

(assert (=> b!131854 (=> (not res!109428) (not e!87409))))

(declare-fun lt!203399 () tuple2!11422)

(declare-fun lt!203398 () tuple2!11422)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!131854 (= res!109428 (= (bitIndex!0 (size!2756 (buf!3123 (_1!6014 lt!203399))) (currentByte!5902 (_1!6014 lt!203399)) (currentBit!5897 (_1!6014 lt!203399))) (bitIndex!0 (size!2756 (buf!3123 (_1!6014 lt!203398))) (currentByte!5902 (_1!6014 lt!203398)) (currentBit!5897 (_1!6014 lt!203398)))))))

(declare-fun lt!203402 () Unit!8135)

(declare-fun lt!203390 () BitStream!4776)

(declare-fun readBytePrefixLemma!0 (BitStream!4776 BitStream!4776) Unit!8135)

(assert (=> b!131854 (= lt!203402 (readBytePrefixLemma!0 lt!203390 (_2!6012 lt!203394)))))

(assert (=> b!131854 (= lt!203398 (readBytePure!0 (BitStream!4777 (buf!3123 (_2!6012 lt!203394)) (currentByte!5902 thiss!1634) (currentBit!5897 thiss!1634))))))

(assert (=> b!131854 (= lt!203399 (readBytePure!0 lt!203390))))

(assert (=> b!131854 (= lt!203390 (BitStream!4777 (buf!3123 (_2!6012 lt!203404)) (currentByte!5902 thiss!1634) (currentBit!5897 thiss!1634)))))

(declare-fun e!87418 () Bool)

(assert (=> b!131854 e!87418))

(declare-fun res!109423 () Bool)

(assert (=> b!131854 (=> (not res!109423) (not e!87418))))

(assert (=> b!131854 (= res!109423 (isPrefixOf!0 thiss!1634 (_2!6012 lt!203394)))))

(declare-fun lt!203397 () Unit!8135)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4776 BitStream!4776 BitStream!4776) Unit!8135)

(assert (=> b!131854 (= lt!203397 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6012 lt!203404) (_2!6012 lt!203394)))))

(declare-fun e!87416 () Bool)

(assert (=> b!131854 e!87416))

(declare-fun res!109424 () Bool)

(assert (=> b!131854 (=> (not res!109424) (not e!87416))))

(assert (=> b!131854 (= res!109424 (= (size!2756 (buf!3123 (_2!6012 lt!203404))) (size!2756 (buf!3123 (_2!6012 lt!203394)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4776 array!6087 (_ BitVec 32) (_ BitVec 32)) tuple2!11418)

(assert (=> b!131854 (= lt!203394 (appendByteArrayLoop!0 (_2!6012 lt!203404) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!131854 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2756 (buf!3123 (_2!6012 lt!203404)))) ((_ sign_extend 32) (currentByte!5902 (_2!6012 lt!203404))) ((_ sign_extend 32) (currentBit!5897 (_2!6012 lt!203404))) lt!203392)))

(assert (=> b!131854 (= lt!203392 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!203407 () Unit!8135)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4776 BitStream!4776 (_ BitVec 64) (_ BitVec 32)) Unit!8135)

(assert (=> b!131854 (= lt!203407 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6012 lt!203404) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!131854 e!87414))

(declare-fun res!109425 () Bool)

(assert (=> b!131854 (=> (not res!109425) (not e!87414))))

(assert (=> b!131854 (= res!109425 (= (size!2756 (buf!3123 thiss!1634)) (size!2756 (buf!3123 (_2!6012 lt!203404)))))))

(declare-fun appendByte!0 (BitStream!4776 (_ BitVec 8)) tuple2!11418)

(assert (=> b!131854 (= lt!203404 (appendByte!0 thiss!1634 (select (arr!3385 arr!237) from!447)))))

(declare-fun res!109429 () Bool)

(assert (=> start!25812 (=> (not res!109429) (not e!87410))))

(assert (=> start!25812 (= res!109429 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2756 arr!237))))))

(assert (=> start!25812 e!87410))

(assert (=> start!25812 true))

(declare-fun array_inv!2545 (array!6087) Bool)

(assert (=> start!25812 (array_inv!2545 arr!237)))

(declare-fun e!87417 () Bool)

(declare-fun inv!12 (BitStream!4776) Bool)

(assert (=> start!25812 (and (inv!12 thiss!1634) e!87417)))

(declare-fun b!131855 () Bool)

(assert (=> b!131855 (= e!87409 (= (_2!6014 lt!203399) (_2!6014 lt!203398)))))

(declare-datatypes ((tuple2!11424 0))(
  ( (tuple2!11425 (_1!6015 BitStream!4776) (_2!6015 array!6087)) )
))
(declare-fun lt!203403 () tuple2!11424)

(declare-fun b!131856 () Bool)

(declare-fun e!87419 () Bool)

(declare-fun arrayRangesEq!159 (array!6087 array!6087 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131856 (= e!87419 (not (arrayRangesEq!159 arr!237 (_2!6015 lt!203403) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!131857 () Bool)

(declare-fun res!109434 () Bool)

(assert (=> b!131857 (=> (not res!109434) (not e!87410))))

(assert (=> b!131857 (= res!109434 (bvslt from!447 to!404))))

(declare-fun b!131858 () Bool)

(assert (=> b!131858 (= e!87417 (array_inv!2545 (buf!3123 thiss!1634)))))

(declare-fun b!131859 () Bool)

(declare-fun res!109431 () Bool)

(assert (=> b!131859 (=> (not res!109431) (not e!87410))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131859 (= res!109431 (invariant!0 (currentBit!5897 thiss!1634) (currentByte!5902 thiss!1634) (size!2756 (buf!3123 thiss!1634))))))

(declare-fun b!131860 () Bool)

(assert (=> b!131860 (= e!87418 (invariant!0 (currentBit!5897 thiss!1634) (currentByte!5902 thiss!1634) (size!2756 (buf!3123 (_2!6012 lt!203404)))))))

(declare-fun b!131861 () Bool)

(declare-fun res!109433 () Bool)

(assert (=> b!131861 (=> (not res!109433) (not e!87414))))

(assert (=> b!131861 (= res!109433 (= (bitIndex!0 (size!2756 (buf!3123 (_2!6012 lt!203404))) (currentByte!5902 (_2!6012 lt!203404)) (currentBit!5897 (_2!6012 lt!203404))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2756 (buf!3123 thiss!1634)) (currentByte!5902 thiss!1634) (currentBit!5897 thiss!1634)))))))

(declare-fun b!131862 () Bool)

(declare-fun readByteArrayLoopPure!0 (BitStream!4776 array!6087 (_ BitVec 32) (_ BitVec 32)) tuple2!11424)

(assert (=> b!131862 (= e!87415 (= (_1!6015 (readByteArrayLoopPure!0 (_1!6013 lt!203395) arr!237 from!447 to!404)) (_2!6013 lt!203395)))))

(declare-fun lt!203401 () tuple2!11420)

(declare-fun lt!203396 () tuple2!11422)

(declare-fun b!131863 () Bool)

(assert (=> b!131863 (= e!87414 (and (= (_2!6014 lt!203396) (select (arr!3385 arr!237) from!447)) (= (_1!6014 lt!203396) (_2!6013 lt!203401))))))

(assert (=> b!131863 (= lt!203396 (readBytePure!0 (_1!6013 lt!203401)))))

(assert (=> b!131863 (= lt!203401 (reader!0 thiss!1634 (_2!6012 lt!203404)))))

(declare-fun b!131864 () Bool)

(declare-fun e!87411 () Bool)

(assert (=> b!131864 (= e!87416 e!87411)))

(declare-fun res!109422 () Bool)

(assert (=> b!131864 (=> (not res!109422) (not e!87411))))

(declare-fun lt!203406 () (_ BitVec 64))

(assert (=> b!131864 (= res!109422 (= (bitIndex!0 (size!2756 (buf!3123 (_2!6012 lt!203394))) (currentByte!5902 (_2!6012 lt!203394)) (currentBit!5897 (_2!6012 lt!203394))) (bvadd (bitIndex!0 (size!2756 (buf!3123 (_2!6012 lt!203404))) (currentByte!5902 (_2!6012 lt!203404)) (currentBit!5897 (_2!6012 lt!203404))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!203406))))))

(assert (=> b!131864 (= lt!203406 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!131865 () Bool)

(assert (=> b!131865 (= e!87411 (not e!87419))))

(declare-fun res!109435 () Bool)

(assert (=> b!131865 (=> res!109435 e!87419)))

(declare-fun lt!203393 () tuple2!11420)

(assert (=> b!131865 (= res!109435 (or (not (= (size!2756 (_2!6015 lt!203403)) (size!2756 arr!237))) (not (= (_1!6015 lt!203403) (_2!6013 lt!203393)))))))

(assert (=> b!131865 (= lt!203403 (readByteArrayLoopPure!0 (_1!6013 lt!203393) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!131865 (validate_offset_bits!1 ((_ sign_extend 32) (size!2756 (buf!3123 (_2!6012 lt!203394)))) ((_ sign_extend 32) (currentByte!5902 (_2!6012 lt!203404))) ((_ sign_extend 32) (currentBit!5897 (_2!6012 lt!203404))) lt!203406)))

(declare-fun lt!203391 () Unit!8135)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4776 array!6087 (_ BitVec 64)) Unit!8135)

(assert (=> b!131865 (= lt!203391 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6012 lt!203404) (buf!3123 (_2!6012 lt!203394)) lt!203406))))

(assert (=> b!131865 (= lt!203393 (reader!0 (_2!6012 lt!203404) (_2!6012 lt!203394)))))

(declare-fun b!131866 () Bool)

(declare-fun res!109432 () Bool)

(assert (=> b!131866 (=> (not res!109432) (not e!87410))))

(assert (=> b!131866 (= res!109432 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2756 (buf!3123 thiss!1634))) ((_ sign_extend 32) (currentByte!5902 thiss!1634)) ((_ sign_extend 32) (currentBit!5897 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!131867 () Bool)

(declare-fun res!109430 () Bool)

(assert (=> b!131867 (=> (not res!109430) (not e!87411))))

(assert (=> b!131867 (= res!109430 (isPrefixOf!0 (_2!6012 lt!203404) (_2!6012 lt!203394)))))

(assert (= (and start!25812 res!109429) b!131866))

(assert (= (and b!131866 res!109432) b!131857))

(assert (= (and b!131857 res!109434) b!131859))

(assert (= (and b!131859 res!109431) b!131854))

(assert (= (and b!131854 res!109425) b!131861))

(assert (= (and b!131861 res!109433) b!131853))

(assert (= (and b!131853 res!109426) b!131863))

(assert (= (and b!131854 res!109424) b!131864))

(assert (= (and b!131864 res!109422) b!131867))

(assert (= (and b!131867 res!109430) b!131865))

(assert (= (and b!131865 (not res!109435)) b!131856))

(assert (= (and b!131854 res!109423) b!131860))

(assert (= (and b!131854 res!109428) b!131855))

(assert (= (and b!131854 res!109427) b!131862))

(assert (= start!25812 b!131858))

(declare-fun m!199047 () Bool)

(assert (=> b!131866 m!199047))

(declare-fun m!199049 () Bool)

(assert (=> b!131854 m!199049))

(declare-fun m!199051 () Bool)

(assert (=> b!131854 m!199051))

(declare-fun m!199053 () Bool)

(assert (=> b!131854 m!199053))

(declare-fun m!199055 () Bool)

(assert (=> b!131854 m!199055))

(declare-fun m!199057 () Bool)

(assert (=> b!131854 m!199057))

(declare-fun m!199059 () Bool)

(assert (=> b!131854 m!199059))

(declare-fun m!199061 () Bool)

(assert (=> b!131854 m!199061))

(declare-fun m!199063 () Bool)

(assert (=> b!131854 m!199063))

(declare-fun m!199065 () Bool)

(assert (=> b!131854 m!199065))

(declare-fun m!199067 () Bool)

(assert (=> b!131854 m!199067))

(declare-fun m!199069 () Bool)

(assert (=> b!131854 m!199069))

(declare-fun m!199071 () Bool)

(assert (=> b!131854 m!199071))

(declare-fun m!199073 () Bool)

(assert (=> b!131854 m!199073))

(assert (=> b!131854 m!199069))

(declare-fun m!199075 () Bool)

(assert (=> b!131854 m!199075))

(declare-fun m!199077 () Bool)

(assert (=> b!131854 m!199077))

(declare-fun m!199079 () Bool)

(assert (=> b!131854 m!199079))

(declare-fun m!199081 () Bool)

(assert (=> b!131854 m!199081))

(declare-fun m!199083 () Bool)

(assert (=> b!131854 m!199083))

(declare-fun m!199085 () Bool)

(assert (=> b!131854 m!199085))

(declare-fun m!199087 () Bool)

(assert (=> b!131853 m!199087))

(declare-fun m!199089 () Bool)

(assert (=> b!131861 m!199089))

(declare-fun m!199091 () Bool)

(assert (=> b!131861 m!199091))

(declare-fun m!199093 () Bool)

(assert (=> b!131867 m!199093))

(declare-fun m!199095 () Bool)

(assert (=> b!131860 m!199095))

(declare-fun m!199097 () Bool)

(assert (=> b!131856 m!199097))

(declare-fun m!199099 () Bool)

(assert (=> b!131864 m!199099))

(assert (=> b!131864 m!199089))

(declare-fun m!199101 () Bool)

(assert (=> b!131858 m!199101))

(declare-fun m!199103 () Bool)

(assert (=> b!131865 m!199103))

(declare-fun m!199105 () Bool)

(assert (=> b!131865 m!199105))

(declare-fun m!199107 () Bool)

(assert (=> b!131865 m!199107))

(assert (=> b!131865 m!199081))

(declare-fun m!199109 () Bool)

(assert (=> b!131862 m!199109))

(assert (=> b!131863 m!199069))

(declare-fun m!199111 () Bool)

(assert (=> b!131863 m!199111))

(declare-fun m!199113 () Bool)

(assert (=> b!131863 m!199113))

(declare-fun m!199115 () Bool)

(assert (=> start!25812 m!199115))

(declare-fun m!199117 () Bool)

(assert (=> start!25812 m!199117))

(declare-fun m!199119 () Bool)

(assert (=> b!131859 m!199119))

(check-sat (not b!131856) (not b!131858) (not b!131863) (not b!131860) (not b!131854) (not b!131865) (not b!131853) (not b!131867) (not start!25812) (not b!131861) (not b!131864) (not b!131862) (not b!131866) (not b!131859))
