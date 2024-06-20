; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28746 () Bool)

(assert start!28746)

(declare-fun b!148701 () Bool)

(declare-fun e!99225 () Bool)

(declare-fun e!99221 () Bool)

(assert (=> b!148701 (= e!99225 (not e!99221))))

(declare-fun res!124484 () Bool)

(assert (=> b!148701 (=> res!124484 e!99221)))

(declare-datatypes ((array!6668 0))(
  ( (array!6669 (arr!3800 (Array (_ BitVec 32) (_ BitVec 8))) (size!3016 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6668)

(declare-datatypes ((BitStream!5290 0))(
  ( (BitStream!5291 (buf!3491 array!6668) (currentByte!6405 (_ BitVec 32)) (currentBit!6400 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13206 0))(
  ( (tuple2!13207 (_1!6967 BitStream!5290) (_2!6967 array!6668)) )
))
(declare-fun lt!231872 () tuple2!13206)

(declare-datatypes ((tuple2!13208 0))(
  ( (tuple2!13209 (_1!6968 BitStream!5290) (_2!6968 BitStream!5290)) )
))
(declare-fun lt!231874 () tuple2!13208)

(assert (=> b!148701 (= res!124484 (or (not (= (size!3016 (_2!6967 lt!231872)) (size!3016 arr!237))) (not (= (_1!6967 lt!231872) (_2!6968 lt!231874)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5290 array!6668 (_ BitVec 32) (_ BitVec 32)) tuple2!13206)

(assert (=> b!148701 (= lt!231872 (readByteArrayLoopPure!0 (_1!6968 lt!231874) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!9423 0))(
  ( (Unit!9424) )
))
(declare-datatypes ((tuple2!13210 0))(
  ( (tuple2!13211 (_1!6969 Unit!9423) (_2!6969 BitStream!5290)) )
))
(declare-fun lt!231881 () tuple2!13210)

(declare-fun lt!231880 () tuple2!13210)

(declare-fun lt!231893 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!148701 (validate_offset_bits!1 ((_ sign_extend 32) (size!3016 (buf!3491 (_2!6969 lt!231881)))) ((_ sign_extend 32) (currentByte!6405 (_2!6969 lt!231880))) ((_ sign_extend 32) (currentBit!6400 (_2!6969 lt!231880))) lt!231893)))

(declare-fun lt!231885 () Unit!9423)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5290 array!6668 (_ BitVec 64)) Unit!9423)

(assert (=> b!148701 (= lt!231885 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6969 lt!231880) (buf!3491 (_2!6969 lt!231881)) lt!231893))))

(declare-fun reader!0 (BitStream!5290 BitStream!5290) tuple2!13208)

(assert (=> b!148701 (= lt!231874 (reader!0 (_2!6969 lt!231880) (_2!6969 lt!231881)))))

(declare-fun b!148702 () Bool)

(declare-fun e!99222 () Bool)

(assert (=> b!148702 (= e!99222 e!99225)))

(declare-fun res!124493 () Bool)

(assert (=> b!148702 (=> (not res!124493) (not e!99225))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!148702 (= res!124493 (= (bitIndex!0 (size!3016 (buf!3491 (_2!6969 lt!231881))) (currentByte!6405 (_2!6969 lt!231881)) (currentBit!6400 (_2!6969 lt!231881))) (bvadd (bitIndex!0 (size!3016 (buf!3491 (_2!6969 lt!231880))) (currentByte!6405 (_2!6969 lt!231880)) (currentBit!6400 (_2!6969 lt!231880))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!231893))))))

(assert (=> b!148702 (= lt!231893 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!148703 () Bool)

(declare-fun e!99223 () Bool)

(declare-datatypes ((tuple2!13212 0))(
  ( (tuple2!13213 (_1!6970 BitStream!5290) (_2!6970 (_ BitVec 8))) )
))
(declare-fun lt!231895 () tuple2!13212)

(declare-fun lt!231889 () tuple2!13212)

(assert (=> b!148703 (= e!99223 (= (_2!6970 lt!231895) (_2!6970 lt!231889)))))

(declare-fun b!148704 () Bool)

(declare-fun res!124490 () Bool)

(assert (=> b!148704 (=> (not res!124490) (not e!99225))))

(declare-fun isPrefixOf!0 (BitStream!5290 BitStream!5290) Bool)

(assert (=> b!148704 (= res!124490 (isPrefixOf!0 (_2!6969 lt!231880) (_2!6969 lt!231881)))))

(declare-fun res!124487 () Bool)

(declare-fun e!99216 () Bool)

(assert (=> start!28746 (=> (not res!124487) (not e!99216))))

(assert (=> start!28746 (= res!124487 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3016 arr!237))))))

(assert (=> start!28746 e!99216))

(assert (=> start!28746 true))

(declare-fun array_inv!2805 (array!6668) Bool)

(assert (=> start!28746 (array_inv!2805 arr!237)))

(declare-fun thiss!1634 () BitStream!5290)

(declare-fun e!99218 () Bool)

(declare-fun inv!12 (BitStream!5290) Bool)

(assert (=> start!28746 (and (inv!12 thiss!1634) e!99218)))

(declare-fun b!148705 () Bool)

(declare-fun res!124480 () Bool)

(assert (=> b!148705 (=> (not res!124480) (not e!99216))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!148705 (= res!124480 (invariant!0 (currentBit!6400 thiss!1634) (currentByte!6405 thiss!1634) (size!3016 (buf!3491 thiss!1634))))))

(declare-fun b!148706 () Bool)

(declare-fun e!99220 () Bool)

(assert (=> b!148706 (= e!99220 (invariant!0 (currentBit!6400 thiss!1634) (currentByte!6405 thiss!1634) (size!3016 (buf!3491 (_2!6969 lt!231880)))))))

(declare-fun lt!231882 () tuple2!13206)

(declare-fun b!148707 () Bool)

(declare-fun e!99224 () Bool)

(declare-fun lt!231884 () tuple2!13206)

(assert (=> b!148707 (= e!99224 (or (bvsgt #b00000000000000000000000000000000 to!404) (bvsgt (size!3016 arr!237) (size!3016 (_2!6967 lt!231882))) (bvsgt (size!3016 (_2!6967 lt!231882)) (size!3016 (_2!6967 lt!231884))) (bvsle to!404 (size!3016 (_2!6967 lt!231882)))))))

(declare-fun arrayRangesEq!332 (array!6668 array!6668 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!148707 (arrayRangesEq!332 (_2!6967 lt!231882) (_2!6967 lt!231884) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!231894 () Unit!9423)

(declare-fun arrayRangesEqSymmetricLemma!64 (array!6668 array!6668 (_ BitVec 32) (_ BitVec 32)) Unit!9423)

(assert (=> b!148707 (= lt!231894 (arrayRangesEqSymmetricLemma!64 (_2!6967 lt!231884) (_2!6967 lt!231882) #b00000000000000000000000000000000 to!404))))

(declare-fun b!148708 () Bool)

(assert (=> b!148708 (= e!99218 (array_inv!2805 (buf!3491 thiss!1634)))))

(declare-fun b!148709 () Bool)

(declare-fun lt!231890 () tuple2!13212)

(declare-fun lt!231888 () tuple2!13208)

(declare-fun e!99226 () Bool)

(assert (=> b!148709 (= e!99226 (and (= (_2!6970 lt!231890) (select (arr!3800 arr!237) from!447)) (= (_1!6970 lt!231890) (_2!6968 lt!231888))))))

(declare-fun readBytePure!0 (BitStream!5290) tuple2!13212)

(assert (=> b!148709 (= lt!231890 (readBytePure!0 (_1!6968 lt!231888)))))

(assert (=> b!148709 (= lt!231888 (reader!0 thiss!1634 (_2!6969 lt!231880)))))

(declare-fun b!148710 () Bool)

(assert (=> b!148710 (= e!99221 (not (arrayRangesEq!332 arr!237 (_2!6967 lt!231872) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!148711 () Bool)

(assert (=> b!148711 (= e!99216 (not e!99224))))

(declare-fun res!124489 () Bool)

(assert (=> b!148711 (=> res!124489 e!99224)))

(assert (=> b!148711 (= res!124489 (not (arrayRangesEq!332 (_2!6967 lt!231884) (_2!6967 lt!231882) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!231878 () tuple2!13206)

(assert (=> b!148711 (arrayRangesEq!332 (_2!6967 lt!231884) (_2!6967 lt!231878) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!231887 () tuple2!13208)

(declare-fun lt!231875 () Unit!9423)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5290 array!6668 (_ BitVec 32) (_ BitVec 32)) Unit!9423)

(assert (=> b!148711 (= lt!231875 (readByteArrayLoopArrayPrefixLemma!0 (_1!6968 lt!231887) arr!237 from!447 to!404))))

(declare-fun lt!231886 () array!6668)

(declare-fun withMovedByteIndex!0 (BitStream!5290 (_ BitVec 32)) BitStream!5290)

(assert (=> b!148711 (= lt!231878 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6968 lt!231887) #b00000000000000000000000000000001) lt!231886 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!231897 () tuple2!13208)

(assert (=> b!148711 (= lt!231882 (readByteArrayLoopPure!0 (_1!6968 lt!231897) lt!231886 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!231883 () tuple2!13212)

(assert (=> b!148711 (= lt!231886 (array!6669 (store (arr!3800 arr!237) from!447 (_2!6970 lt!231883)) (size!3016 arr!237)))))

(declare-fun lt!231873 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!148711 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3016 (buf!3491 (_2!6969 lt!231881)))) ((_ sign_extend 32) (currentByte!6405 (_2!6969 lt!231880))) ((_ sign_extend 32) (currentBit!6400 (_2!6969 lt!231880))) lt!231873)))

(declare-fun lt!231892 () Unit!9423)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5290 array!6668 (_ BitVec 32)) Unit!9423)

(assert (=> b!148711 (= lt!231892 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6969 lt!231880) (buf!3491 (_2!6969 lt!231881)) lt!231873))))

(assert (=> b!148711 (= (_1!6967 lt!231884) (_2!6968 lt!231887))))

(assert (=> b!148711 (= lt!231884 (readByteArrayLoopPure!0 (_1!6968 lt!231887) arr!237 from!447 to!404))))

(assert (=> b!148711 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3016 (buf!3491 (_2!6969 lt!231881)))) ((_ sign_extend 32) (currentByte!6405 thiss!1634)) ((_ sign_extend 32) (currentBit!6400 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!231879 () Unit!9423)

(assert (=> b!148711 (= lt!231879 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3491 (_2!6969 lt!231881)) (bvsub to!404 from!447)))))

(assert (=> b!148711 (= (_2!6970 lt!231883) (select (arr!3800 arr!237) from!447))))

(assert (=> b!148711 (= lt!231883 (readBytePure!0 (_1!6968 lt!231887)))))

(assert (=> b!148711 (= lt!231897 (reader!0 (_2!6969 lt!231880) (_2!6969 lt!231881)))))

(assert (=> b!148711 (= lt!231887 (reader!0 thiss!1634 (_2!6969 lt!231881)))))

(assert (=> b!148711 e!99223))

(declare-fun res!124492 () Bool)

(assert (=> b!148711 (=> (not res!124492) (not e!99223))))

(assert (=> b!148711 (= res!124492 (= (bitIndex!0 (size!3016 (buf!3491 (_1!6970 lt!231895))) (currentByte!6405 (_1!6970 lt!231895)) (currentBit!6400 (_1!6970 lt!231895))) (bitIndex!0 (size!3016 (buf!3491 (_1!6970 lt!231889))) (currentByte!6405 (_1!6970 lt!231889)) (currentBit!6400 (_1!6970 lt!231889)))))))

(declare-fun lt!231877 () Unit!9423)

(declare-fun lt!231891 () BitStream!5290)

(declare-fun readBytePrefixLemma!0 (BitStream!5290 BitStream!5290) Unit!9423)

(assert (=> b!148711 (= lt!231877 (readBytePrefixLemma!0 lt!231891 (_2!6969 lt!231881)))))

(assert (=> b!148711 (= lt!231889 (readBytePure!0 (BitStream!5291 (buf!3491 (_2!6969 lt!231881)) (currentByte!6405 thiss!1634) (currentBit!6400 thiss!1634))))))

(assert (=> b!148711 (= lt!231895 (readBytePure!0 lt!231891))))

(assert (=> b!148711 (= lt!231891 (BitStream!5291 (buf!3491 (_2!6969 lt!231880)) (currentByte!6405 thiss!1634) (currentBit!6400 thiss!1634)))))

(assert (=> b!148711 e!99220))

(declare-fun res!124488 () Bool)

(assert (=> b!148711 (=> (not res!124488) (not e!99220))))

(assert (=> b!148711 (= res!124488 (isPrefixOf!0 thiss!1634 (_2!6969 lt!231881)))))

(declare-fun lt!231896 () Unit!9423)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5290 BitStream!5290 BitStream!5290) Unit!9423)

(assert (=> b!148711 (= lt!231896 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6969 lt!231880) (_2!6969 lt!231881)))))

(assert (=> b!148711 e!99222))

(declare-fun res!124486 () Bool)

(assert (=> b!148711 (=> (not res!124486) (not e!99222))))

(assert (=> b!148711 (= res!124486 (= (size!3016 (buf!3491 (_2!6969 lt!231880))) (size!3016 (buf!3491 (_2!6969 lt!231881)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5290 array!6668 (_ BitVec 32) (_ BitVec 32)) tuple2!13210)

(assert (=> b!148711 (= lt!231881 (appendByteArrayLoop!0 (_2!6969 lt!231880) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!148711 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3016 (buf!3491 (_2!6969 lt!231880)))) ((_ sign_extend 32) (currentByte!6405 (_2!6969 lt!231880))) ((_ sign_extend 32) (currentBit!6400 (_2!6969 lt!231880))) lt!231873)))

(assert (=> b!148711 (= lt!231873 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!231876 () Unit!9423)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5290 BitStream!5290 (_ BitVec 64) (_ BitVec 32)) Unit!9423)

(assert (=> b!148711 (= lt!231876 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6969 lt!231880) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!148711 e!99226))

(declare-fun res!124481 () Bool)

(assert (=> b!148711 (=> (not res!124481) (not e!99226))))

(assert (=> b!148711 (= res!124481 (= (size!3016 (buf!3491 thiss!1634)) (size!3016 (buf!3491 (_2!6969 lt!231880)))))))

(declare-fun appendByte!0 (BitStream!5290 (_ BitVec 8)) tuple2!13210)

(assert (=> b!148711 (= lt!231880 (appendByte!0 thiss!1634 (select (arr!3800 arr!237) from!447)))))

(declare-fun b!148712 () Bool)

(declare-fun res!124485 () Bool)

(assert (=> b!148712 (=> (not res!124485) (not e!99216))))

(assert (=> b!148712 (= res!124485 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3016 (buf!3491 thiss!1634))) ((_ sign_extend 32) (currentByte!6405 thiss!1634)) ((_ sign_extend 32) (currentBit!6400 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!148713 () Bool)

(declare-fun res!124483 () Bool)

(assert (=> b!148713 (=> (not res!124483) (not e!99216))))

(assert (=> b!148713 (= res!124483 (bvslt from!447 to!404))))

(declare-fun b!148714 () Bool)

(declare-fun res!124482 () Bool)

(assert (=> b!148714 (=> (not res!124482) (not e!99226))))

(assert (=> b!148714 (= res!124482 (= (bitIndex!0 (size!3016 (buf!3491 (_2!6969 lt!231880))) (currentByte!6405 (_2!6969 lt!231880)) (currentBit!6400 (_2!6969 lt!231880))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3016 (buf!3491 thiss!1634)) (currentByte!6405 thiss!1634) (currentBit!6400 thiss!1634)))))))

(declare-fun b!148715 () Bool)

(declare-fun res!124491 () Bool)

(assert (=> b!148715 (=> (not res!124491) (not e!99226))))

(assert (=> b!148715 (= res!124491 (isPrefixOf!0 thiss!1634 (_2!6969 lt!231880)))))

(assert (= (and start!28746 res!124487) b!148712))

(assert (= (and b!148712 res!124485) b!148713))

(assert (= (and b!148713 res!124483) b!148705))

(assert (= (and b!148705 res!124480) b!148711))

(assert (= (and b!148711 res!124481) b!148714))

(assert (= (and b!148714 res!124482) b!148715))

(assert (= (and b!148715 res!124491) b!148709))

(assert (= (and b!148711 res!124486) b!148702))

(assert (= (and b!148702 res!124493) b!148704))

(assert (= (and b!148704 res!124490) b!148701))

(assert (= (and b!148701 (not res!124484)) b!148710))

(assert (= (and b!148711 res!124488) b!148706))

(assert (= (and b!148711 res!124492) b!148703))

(assert (= (and b!148711 (not res!124489)) b!148707))

(assert (= start!28746 b!148708))

(declare-fun m!231021 () Bool)

(assert (=> b!148704 m!231021))

(declare-fun m!231023 () Bool)

(assert (=> b!148714 m!231023))

(declare-fun m!231025 () Bool)

(assert (=> b!148714 m!231025))

(declare-fun m!231027 () Bool)

(assert (=> b!148711 m!231027))

(declare-fun m!231029 () Bool)

(assert (=> b!148711 m!231029))

(declare-fun m!231031 () Bool)

(assert (=> b!148711 m!231031))

(declare-fun m!231033 () Bool)

(assert (=> b!148711 m!231033))

(declare-fun m!231035 () Bool)

(assert (=> b!148711 m!231035))

(declare-fun m!231037 () Bool)

(assert (=> b!148711 m!231037))

(declare-fun m!231039 () Bool)

(assert (=> b!148711 m!231039))

(declare-fun m!231041 () Bool)

(assert (=> b!148711 m!231041))

(declare-fun m!231043 () Bool)

(assert (=> b!148711 m!231043))

(declare-fun m!231045 () Bool)

(assert (=> b!148711 m!231045))

(declare-fun m!231047 () Bool)

(assert (=> b!148711 m!231047))

(declare-fun m!231049 () Bool)

(assert (=> b!148711 m!231049))

(assert (=> b!148711 m!231047))

(declare-fun m!231051 () Bool)

(assert (=> b!148711 m!231051))

(declare-fun m!231053 () Bool)

(assert (=> b!148711 m!231053))

(declare-fun m!231055 () Bool)

(assert (=> b!148711 m!231055))

(declare-fun m!231057 () Bool)

(assert (=> b!148711 m!231057))

(declare-fun m!231059 () Bool)

(assert (=> b!148711 m!231059))

(declare-fun m!231061 () Bool)

(assert (=> b!148711 m!231061))

(declare-fun m!231063 () Bool)

(assert (=> b!148711 m!231063))

(declare-fun m!231065 () Bool)

(assert (=> b!148711 m!231065))

(declare-fun m!231067 () Bool)

(assert (=> b!148711 m!231067))

(declare-fun m!231069 () Bool)

(assert (=> b!148711 m!231069))

(declare-fun m!231071 () Bool)

(assert (=> b!148711 m!231071))

(declare-fun m!231073 () Bool)

(assert (=> b!148711 m!231073))

(declare-fun m!231075 () Bool)

(assert (=> b!148711 m!231075))

(declare-fun m!231077 () Bool)

(assert (=> b!148711 m!231077))

(declare-fun m!231079 () Bool)

(assert (=> b!148711 m!231079))

(assert (=> b!148711 m!231075))

(assert (=> b!148709 m!231075))

(declare-fun m!231081 () Bool)

(assert (=> b!148709 m!231081))

(declare-fun m!231083 () Bool)

(assert (=> b!148709 m!231083))

(declare-fun m!231085 () Bool)

(assert (=> b!148715 m!231085))

(declare-fun m!231087 () Bool)

(assert (=> b!148702 m!231087))

(assert (=> b!148702 m!231023))

(declare-fun m!231089 () Bool)

(assert (=> start!28746 m!231089))

(declare-fun m!231091 () Bool)

(assert (=> start!28746 m!231091))

(declare-fun m!231093 () Bool)

(assert (=> b!148707 m!231093))

(declare-fun m!231095 () Bool)

(assert (=> b!148707 m!231095))

(declare-fun m!231097 () Bool)

(assert (=> b!148701 m!231097))

(declare-fun m!231099 () Bool)

(assert (=> b!148701 m!231099))

(declare-fun m!231101 () Bool)

(assert (=> b!148701 m!231101))

(assert (=> b!148701 m!231071))

(declare-fun m!231103 () Bool)

(assert (=> b!148705 m!231103))

(declare-fun m!231105 () Bool)

(assert (=> b!148706 m!231105))

(declare-fun m!231107 () Bool)

(assert (=> b!148712 m!231107))

(declare-fun m!231109 () Bool)

(assert (=> b!148708 m!231109))

(declare-fun m!231111 () Bool)

(assert (=> b!148710 m!231111))

(push 1)

(assert (not b!148701))

(assert (not b!148710))

(assert (not b!148705))

(assert (not b!148706))

(assert (not b!148708))

(assert (not b!148707))

(assert (not b!148714))

(assert (not start!28746))

(assert (not b!148715))

(assert (not b!148711))

(assert (not b!148702))

(assert (not b!148712))

(assert (not b!148709))

(assert (not b!148704))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

