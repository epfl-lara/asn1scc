; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25534 () Bool)

(assert start!25534)

(declare-fun b!129979 () Bool)

(declare-fun res!107712 () Bool)

(declare-fun e!86143 () Bool)

(assert (=> b!129979 (=> (not res!107712) (not e!86143))))

(declare-datatypes ((array!6019 0))(
  ( (array!6020 (arr!3342 (Array (_ BitVec 32) (_ BitVec 8))) (size!2725 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4714 0))(
  ( (BitStream!4715 (buf!3083 array!6019) (currentByte!5844 (_ BitVec 32)) (currentBit!5839 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4714)

(declare-datatypes ((Unit!8055 0))(
  ( (Unit!8056) )
))
(declare-datatypes ((tuple2!11158 0))(
  ( (tuple2!11159 (_1!5876 Unit!8055) (_2!5876 BitStream!4714)) )
))
(declare-fun lt!200528 () tuple2!11158)

(declare-fun isPrefixOf!0 (BitStream!4714 BitStream!4714) Bool)

(assert (=> b!129979 (= res!107712 (isPrefixOf!0 thiss!1634 (_2!5876 lt!200528)))))

(declare-fun b!129980 () Bool)

(declare-fun e!86150 () Bool)

(declare-datatypes ((tuple2!11160 0))(
  ( (tuple2!11161 (_1!5877 BitStream!4714) (_2!5877 (_ BitVec 8))) )
))
(declare-fun lt!200524 () tuple2!11160)

(declare-fun lt!200533 () tuple2!11160)

(assert (=> b!129980 (= e!86150 (= (_2!5877 lt!200524) (_2!5877 lt!200533)))))

(declare-fun b!129981 () Bool)

(declare-fun e!86141 () Bool)

(declare-fun e!86145 () Bool)

(assert (=> b!129981 (= e!86141 (not e!86145))))

(declare-fun res!107707 () Bool)

(assert (=> b!129981 (=> res!107707 e!86145)))

(declare-datatypes ((tuple2!11162 0))(
  ( (tuple2!11163 (_1!5878 BitStream!4714) (_2!5878 BitStream!4714)) )
))
(declare-fun lt!200530 () tuple2!11162)

(declare-datatypes ((tuple2!11164 0))(
  ( (tuple2!11165 (_1!5879 BitStream!4714) (_2!5879 array!6019)) )
))
(declare-fun lt!200535 () tuple2!11164)

(declare-fun arr!237 () array!6019)

(assert (=> b!129981 (= res!107707 (or (not (= (size!2725 (_2!5879 lt!200535)) (size!2725 arr!237))) (not (= (_1!5879 lt!200535) (_2!5878 lt!200530)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4714 array!6019 (_ BitVec 32) (_ BitVec 32)) tuple2!11164)

(assert (=> b!129981 (= lt!200535 (readByteArrayLoopPure!0 (_1!5878 lt!200530) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!200537 () tuple2!11158)

(declare-fun lt!200529 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129981 (validate_offset_bits!1 ((_ sign_extend 32) (size!2725 (buf!3083 (_2!5876 lt!200537)))) ((_ sign_extend 32) (currentByte!5844 (_2!5876 lt!200528))) ((_ sign_extend 32) (currentBit!5839 (_2!5876 lt!200528))) lt!200529)))

(declare-fun lt!200523 () Unit!8055)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4714 array!6019 (_ BitVec 64)) Unit!8055)

(assert (=> b!129981 (= lt!200523 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5876 lt!200528) (buf!3083 (_2!5876 lt!200537)) lt!200529))))

(declare-fun reader!0 (BitStream!4714 BitStream!4714) tuple2!11162)

(assert (=> b!129981 (= lt!200530 (reader!0 (_2!5876 lt!200528) (_2!5876 lt!200537)))))

(declare-fun res!107711 () Bool)

(declare-fun e!86142 () Bool)

(assert (=> start!25534 (=> (not res!107711) (not e!86142))))

(assert (=> start!25534 (= res!107711 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2725 arr!237))))))

(assert (=> start!25534 e!86142))

(assert (=> start!25534 true))

(declare-fun array_inv!2514 (array!6019) Bool)

(assert (=> start!25534 (array_inv!2514 arr!237)))

(declare-fun e!86148 () Bool)

(declare-fun inv!12 (BitStream!4714) Bool)

(assert (=> start!25534 (and (inv!12 thiss!1634) e!86148)))

(declare-fun b!129982 () Bool)

(declare-fun res!107709 () Bool)

(assert (=> b!129982 (=> (not res!107709) (not e!86141))))

(assert (=> b!129982 (= res!107709 (isPrefixOf!0 (_2!5876 lt!200528) (_2!5876 lt!200537)))))

(declare-fun b!129983 () Bool)

(declare-fun res!107701 () Bool)

(assert (=> b!129983 (=> (not res!107701) (not e!86143))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129983 (= res!107701 (= (bitIndex!0 (size!2725 (buf!3083 (_2!5876 lt!200528))) (currentByte!5844 (_2!5876 lt!200528)) (currentBit!5839 (_2!5876 lt!200528))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2725 (buf!3083 thiss!1634)) (currentByte!5844 thiss!1634) (currentBit!5839 thiss!1634)))))))

(declare-fun b!129984 () Bool)

(declare-fun lt!200532 () tuple2!11162)

(declare-fun lt!200526 () tuple2!11160)

(assert (=> b!129984 (= e!86143 (and (= (_2!5877 lt!200526) (select (arr!3342 arr!237) from!447)) (= (_1!5877 lt!200526) (_2!5878 lt!200532))))))

(declare-fun readBytePure!0 (BitStream!4714) tuple2!11160)

(assert (=> b!129984 (= lt!200526 (readBytePure!0 (_1!5878 lt!200532)))))

(assert (=> b!129984 (= lt!200532 (reader!0 thiss!1634 (_2!5876 lt!200528)))))

(declare-fun b!129985 () Bool)

(declare-fun res!107708 () Bool)

(assert (=> b!129985 (=> (not res!107708) (not e!86142))))

(assert (=> b!129985 (= res!107708 (bvslt from!447 to!404))))

(declare-fun b!129986 () Bool)

(declare-fun res!107713 () Bool)

(assert (=> b!129986 (=> (not res!107713) (not e!86142))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129986 (= res!107713 (invariant!0 (currentBit!5839 thiss!1634) (currentByte!5844 thiss!1634) (size!2725 (buf!3083 thiss!1634))))))

(declare-fun b!129987 () Bool)

(assert (=> b!129987 (= e!86148 (array_inv!2514 (buf!3083 thiss!1634)))))

(declare-fun b!129988 () Bool)

(declare-fun e!86144 () Bool)

(assert (=> b!129988 (= e!86144 (invariant!0 (currentBit!5839 thiss!1634) (currentByte!5844 thiss!1634) (size!2725 (buf!3083 (_2!5876 lt!200528)))))))

(declare-fun b!129989 () Bool)

(declare-fun res!107710 () Bool)

(assert (=> b!129989 (=> (not res!107710) (not e!86142))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129989 (= res!107710 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2725 (buf!3083 thiss!1634))) ((_ sign_extend 32) (currentByte!5844 thiss!1634)) ((_ sign_extend 32) (currentBit!5839 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!129990 () Bool)

(assert (=> b!129990 (= e!86142 (not (isPrefixOf!0 (_2!5876 lt!200528) (_2!5876 lt!200537))))))

(declare-fun lt!200534 () tuple2!11162)

(assert (=> b!129990 (= lt!200534 (reader!0 thiss!1634 (_2!5876 lt!200537)))))

(assert (=> b!129990 e!86150))

(declare-fun res!107702 () Bool)

(assert (=> b!129990 (=> (not res!107702) (not e!86150))))

(assert (=> b!129990 (= res!107702 (= (bitIndex!0 (size!2725 (buf!3083 (_1!5877 lt!200524))) (currentByte!5844 (_1!5877 lt!200524)) (currentBit!5839 (_1!5877 lt!200524))) (bitIndex!0 (size!2725 (buf!3083 (_1!5877 lt!200533))) (currentByte!5844 (_1!5877 lt!200533)) (currentBit!5839 (_1!5877 lt!200533)))))))

(declare-fun lt!200525 () Unit!8055)

(declare-fun lt!200536 () BitStream!4714)

(declare-fun readBytePrefixLemma!0 (BitStream!4714 BitStream!4714) Unit!8055)

(assert (=> b!129990 (= lt!200525 (readBytePrefixLemma!0 lt!200536 (_2!5876 lt!200537)))))

(assert (=> b!129990 (= lt!200533 (readBytePure!0 (BitStream!4715 (buf!3083 (_2!5876 lt!200537)) (currentByte!5844 thiss!1634) (currentBit!5839 thiss!1634))))))

(assert (=> b!129990 (= lt!200524 (readBytePure!0 lt!200536))))

(assert (=> b!129990 (= lt!200536 (BitStream!4715 (buf!3083 (_2!5876 lt!200528)) (currentByte!5844 thiss!1634) (currentBit!5839 thiss!1634)))))

(assert (=> b!129990 e!86144))

(declare-fun res!107704 () Bool)

(assert (=> b!129990 (=> (not res!107704) (not e!86144))))

(assert (=> b!129990 (= res!107704 (isPrefixOf!0 thiss!1634 (_2!5876 lt!200537)))))

(declare-fun lt!200527 () Unit!8055)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4714 BitStream!4714 BitStream!4714) Unit!8055)

(assert (=> b!129990 (= lt!200527 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5876 lt!200528) (_2!5876 lt!200537)))))

(declare-fun e!86149 () Bool)

(assert (=> b!129990 e!86149))

(declare-fun res!107706 () Bool)

(assert (=> b!129990 (=> (not res!107706) (not e!86149))))

(assert (=> b!129990 (= res!107706 (= (size!2725 (buf!3083 (_2!5876 lt!200528))) (size!2725 (buf!3083 (_2!5876 lt!200537)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4714 array!6019 (_ BitVec 32) (_ BitVec 32)) tuple2!11158)

(assert (=> b!129990 (= lt!200537 (appendByteArrayLoop!0 (_2!5876 lt!200528) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!129990 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2725 (buf!3083 (_2!5876 lt!200528)))) ((_ sign_extend 32) (currentByte!5844 (_2!5876 lt!200528))) ((_ sign_extend 32) (currentBit!5839 (_2!5876 lt!200528))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!200531 () Unit!8055)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4714 BitStream!4714 (_ BitVec 64) (_ BitVec 32)) Unit!8055)

(assert (=> b!129990 (= lt!200531 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5876 lt!200528) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!129990 e!86143))

(declare-fun res!107703 () Bool)

(assert (=> b!129990 (=> (not res!107703) (not e!86143))))

(assert (=> b!129990 (= res!107703 (= (size!2725 (buf!3083 thiss!1634)) (size!2725 (buf!3083 (_2!5876 lt!200528)))))))

(declare-fun appendByte!0 (BitStream!4714 (_ BitVec 8)) tuple2!11158)

(assert (=> b!129990 (= lt!200528 (appendByte!0 thiss!1634 (select (arr!3342 arr!237) from!447)))))

(declare-fun b!129991 () Bool)

(declare-fun arrayRangesEq!128 (array!6019 array!6019 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129991 (= e!86145 (not (arrayRangesEq!128 arr!237 (_2!5879 lt!200535) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!129992 () Bool)

(assert (=> b!129992 (= e!86149 e!86141)))

(declare-fun res!107705 () Bool)

(assert (=> b!129992 (=> (not res!107705) (not e!86141))))

(assert (=> b!129992 (= res!107705 (= (bitIndex!0 (size!2725 (buf!3083 (_2!5876 lt!200537))) (currentByte!5844 (_2!5876 lt!200537)) (currentBit!5839 (_2!5876 lt!200537))) (bvadd (bitIndex!0 (size!2725 (buf!3083 (_2!5876 lt!200528))) (currentByte!5844 (_2!5876 lt!200528)) (currentBit!5839 (_2!5876 lt!200528))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!200529))))))

(assert (=> b!129992 (= lt!200529 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (= (and start!25534 res!107711) b!129989))

(assert (= (and b!129989 res!107710) b!129985))

(assert (= (and b!129985 res!107708) b!129986))

(assert (= (and b!129986 res!107713) b!129990))

(assert (= (and b!129990 res!107703) b!129983))

(assert (= (and b!129983 res!107701) b!129979))

(assert (= (and b!129979 res!107712) b!129984))

(assert (= (and b!129990 res!107706) b!129992))

(assert (= (and b!129992 res!107705) b!129982))

(assert (= (and b!129982 res!107709) b!129981))

(assert (= (and b!129981 (not res!107707)) b!129991))

(assert (= (and b!129990 res!107704) b!129988))

(assert (= (and b!129990 res!107702) b!129980))

(assert (= start!25534 b!129987))

(declare-fun m!195961 () Bool)

(assert (=> b!129984 m!195961))

(declare-fun m!195963 () Bool)

(assert (=> b!129984 m!195963))

(declare-fun m!195965 () Bool)

(assert (=> b!129984 m!195965))

(declare-fun m!195967 () Bool)

(assert (=> b!129989 m!195967))

(declare-fun m!195969 () Bool)

(assert (=> b!129987 m!195969))

(declare-fun m!195971 () Bool)

(assert (=> b!129990 m!195971))

(declare-fun m!195973 () Bool)

(assert (=> b!129990 m!195973))

(declare-fun m!195975 () Bool)

(assert (=> b!129990 m!195975))

(declare-fun m!195977 () Bool)

(assert (=> b!129990 m!195977))

(declare-fun m!195979 () Bool)

(assert (=> b!129990 m!195979))

(declare-fun m!195981 () Bool)

(assert (=> b!129990 m!195981))

(declare-fun m!195983 () Bool)

(assert (=> b!129990 m!195983))

(assert (=> b!129990 m!195961))

(declare-fun m!195985 () Bool)

(assert (=> b!129990 m!195985))

(declare-fun m!195987 () Bool)

(assert (=> b!129990 m!195987))

(assert (=> b!129990 m!195961))

(declare-fun m!195989 () Bool)

(assert (=> b!129990 m!195989))

(declare-fun m!195991 () Bool)

(assert (=> b!129990 m!195991))

(declare-fun m!195993 () Bool)

(assert (=> b!129990 m!195993))

(declare-fun m!195995 () Bool)

(assert (=> b!129990 m!195995))

(declare-fun m!195997 () Bool)

(assert (=> start!25534 m!195997))

(declare-fun m!195999 () Bool)

(assert (=> start!25534 m!195999))

(declare-fun m!196001 () Bool)

(assert (=> b!129986 m!196001))

(declare-fun m!196003 () Bool)

(assert (=> b!129979 m!196003))

(declare-fun m!196005 () Bool)

(assert (=> b!129991 m!196005))

(declare-fun m!196007 () Bool)

(assert (=> b!129988 m!196007))

(declare-fun m!196009 () Bool)

(assert (=> b!129992 m!196009))

(declare-fun m!196011 () Bool)

(assert (=> b!129992 m!196011))

(assert (=> b!129983 m!196011))

(declare-fun m!196013 () Bool)

(assert (=> b!129983 m!196013))

(declare-fun m!196015 () Bool)

(assert (=> b!129981 m!196015))

(declare-fun m!196017 () Bool)

(assert (=> b!129981 m!196017))

(declare-fun m!196019 () Bool)

(assert (=> b!129981 m!196019))

(declare-fun m!196021 () Bool)

(assert (=> b!129981 m!196021))

(assert (=> b!129982 m!195993))

(push 1)

(assert (not b!129982))

(assert (not start!25534))

(assert (not b!129992))

(assert (not b!129989))

(assert (not b!129981))

(assert (not b!129991))

(assert (not b!129986))

(assert (not b!129987))

(assert (not b!129979))

(assert (not b!129990))

(assert (not b!129983))

