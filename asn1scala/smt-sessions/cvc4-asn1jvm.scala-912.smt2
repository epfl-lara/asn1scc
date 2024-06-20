; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25658 () Bool)

(assert start!25658)

(declare-fun b!130585 () Bool)

(declare-fun res!108258 () Bool)

(declare-fun e!86538 () Bool)

(assert (=> b!130585 (=> (not res!108258) (not e!86538))))

(declare-datatypes ((array!6038 0))(
  ( (array!6039 (arr!3356 (Array (_ BitVec 32) (_ BitVec 8))) (size!2733 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4730 0))(
  ( (BitStream!4731 (buf!3094 array!6038) (currentByte!5867 (_ BitVec 32)) (currentBit!5862 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8080 0))(
  ( (Unit!8081) )
))
(declare-datatypes ((tuple2!11228 0))(
  ( (tuple2!11229 (_1!5914 Unit!8080) (_2!5914 BitStream!4730)) )
))
(declare-fun lt!201562 () tuple2!11228)

(declare-fun thiss!1634 () BitStream!4730)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!130585 (= res!108258 (= (bitIndex!0 (size!2733 (buf!3094 (_2!5914 lt!201562))) (currentByte!5867 (_2!5914 lt!201562)) (currentBit!5862 (_2!5914 lt!201562))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2733 (buf!3094 thiss!1634)) (currentByte!5867 thiss!1634) (currentBit!5862 thiss!1634)))))))

(declare-fun b!130586 () Bool)

(declare-fun res!108255 () Bool)

(declare-fun e!86539 () Bool)

(assert (=> b!130586 (=> (not res!108255) (not e!86539))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!130586 (= res!108255 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2733 (buf!3094 thiss!1634))) ((_ sign_extend 32) (currentByte!5867 thiss!1634)) ((_ sign_extend 32) (currentBit!5862 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun arr!237 () array!6038)

(declare-datatypes ((tuple2!11230 0))(
  ( (tuple2!11231 (_1!5915 BitStream!4730) (_2!5915 (_ BitVec 8))) )
))
(declare-fun lt!201565 () tuple2!11230)

(declare-fun b!130587 () Bool)

(declare-datatypes ((tuple2!11232 0))(
  ( (tuple2!11233 (_1!5916 BitStream!4730) (_2!5916 BitStream!4730)) )
))
(declare-fun lt!201570 () tuple2!11232)

(assert (=> b!130587 (= e!86538 (and (= (_2!5915 lt!201565) (select (arr!3356 arr!237) from!447)) (= (_1!5915 lt!201565) (_2!5916 lt!201570))))))

(declare-fun readBytePure!0 (BitStream!4730) tuple2!11230)

(assert (=> b!130587 (= lt!201565 (readBytePure!0 (_1!5916 lt!201570)))))

(declare-fun reader!0 (BitStream!4730 BitStream!4730) tuple2!11232)

(assert (=> b!130587 (= lt!201570 (reader!0 thiss!1634 (_2!5914 lt!201562)))))

(declare-fun b!130588 () Bool)

(declare-fun e!86542 () Bool)

(declare-fun e!86543 () Bool)

(assert (=> b!130588 (= e!86542 e!86543)))

(declare-fun res!108257 () Bool)

(assert (=> b!130588 (=> (not res!108257) (not e!86543))))

(declare-fun lt!201566 () tuple2!11228)

(declare-fun lt!201567 () (_ BitVec 64))

(assert (=> b!130588 (= res!108257 (= (bitIndex!0 (size!2733 (buf!3094 (_2!5914 lt!201566))) (currentByte!5867 (_2!5914 lt!201566)) (currentBit!5862 (_2!5914 lt!201566))) (bvadd (bitIndex!0 (size!2733 (buf!3094 (_2!5914 lt!201562))) (currentByte!5867 (_2!5914 lt!201562)) (currentBit!5862 (_2!5914 lt!201562))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!201567))))))

(assert (=> b!130588 (= lt!201567 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!130589 () Bool)

(assert (=> b!130589 (= e!86539 (not true))))

(declare-fun lt!201558 () tuple2!11232)

(assert (=> b!130589 (= (_2!5915 (readBytePure!0 (_1!5916 lt!201558))) (select (arr!3356 arr!237) from!447))))

(declare-fun lt!201571 () tuple2!11232)

(assert (=> b!130589 (= lt!201571 (reader!0 (_2!5914 lt!201562) (_2!5914 lt!201566)))))

(assert (=> b!130589 (= lt!201558 (reader!0 thiss!1634 (_2!5914 lt!201566)))))

(declare-fun e!86541 () Bool)

(assert (=> b!130589 e!86541))

(declare-fun res!108263 () Bool)

(assert (=> b!130589 (=> (not res!108263) (not e!86541))))

(declare-fun lt!201564 () tuple2!11230)

(declare-fun lt!201559 () tuple2!11230)

(assert (=> b!130589 (= res!108263 (= (bitIndex!0 (size!2733 (buf!3094 (_1!5915 lt!201564))) (currentByte!5867 (_1!5915 lt!201564)) (currentBit!5862 (_1!5915 lt!201564))) (bitIndex!0 (size!2733 (buf!3094 (_1!5915 lt!201559))) (currentByte!5867 (_1!5915 lt!201559)) (currentBit!5862 (_1!5915 lt!201559)))))))

(declare-fun lt!201572 () Unit!8080)

(declare-fun lt!201563 () BitStream!4730)

(declare-fun readBytePrefixLemma!0 (BitStream!4730 BitStream!4730) Unit!8080)

(assert (=> b!130589 (= lt!201572 (readBytePrefixLemma!0 lt!201563 (_2!5914 lt!201566)))))

(assert (=> b!130589 (= lt!201559 (readBytePure!0 (BitStream!4731 (buf!3094 (_2!5914 lt!201566)) (currentByte!5867 thiss!1634) (currentBit!5862 thiss!1634))))))

(assert (=> b!130589 (= lt!201564 (readBytePure!0 lt!201563))))

(assert (=> b!130589 (= lt!201563 (BitStream!4731 (buf!3094 (_2!5914 lt!201562)) (currentByte!5867 thiss!1634) (currentBit!5862 thiss!1634)))))

(declare-fun e!86537 () Bool)

(assert (=> b!130589 e!86537))

(declare-fun res!108265 () Bool)

(assert (=> b!130589 (=> (not res!108265) (not e!86537))))

(declare-fun isPrefixOf!0 (BitStream!4730 BitStream!4730) Bool)

(assert (=> b!130589 (= res!108265 (isPrefixOf!0 thiss!1634 (_2!5914 lt!201566)))))

(declare-fun lt!201568 () Unit!8080)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4730 BitStream!4730 BitStream!4730) Unit!8080)

(assert (=> b!130589 (= lt!201568 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5914 lt!201562) (_2!5914 lt!201566)))))

(assert (=> b!130589 e!86542))

(declare-fun res!108260 () Bool)

(assert (=> b!130589 (=> (not res!108260) (not e!86542))))

(assert (=> b!130589 (= res!108260 (= (size!2733 (buf!3094 (_2!5914 lt!201562))) (size!2733 (buf!3094 (_2!5914 lt!201566)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4730 array!6038 (_ BitVec 32) (_ BitVec 32)) tuple2!11228)

(assert (=> b!130589 (= lt!201566 (appendByteArrayLoop!0 (_2!5914 lt!201562) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!130589 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2733 (buf!3094 (_2!5914 lt!201562)))) ((_ sign_extend 32) (currentByte!5867 (_2!5914 lt!201562))) ((_ sign_extend 32) (currentBit!5862 (_2!5914 lt!201562))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!201557 () Unit!8080)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4730 BitStream!4730 (_ BitVec 64) (_ BitVec 32)) Unit!8080)

(assert (=> b!130589 (= lt!201557 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5914 lt!201562) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!130589 e!86538))

(declare-fun res!108259 () Bool)

(assert (=> b!130589 (=> (not res!108259) (not e!86538))))

(assert (=> b!130589 (= res!108259 (= (size!2733 (buf!3094 thiss!1634)) (size!2733 (buf!3094 (_2!5914 lt!201562)))))))

(declare-fun appendByte!0 (BitStream!4730 (_ BitVec 8)) tuple2!11228)

(assert (=> b!130589 (= lt!201562 (appendByte!0 thiss!1634 (select (arr!3356 arr!237) from!447)))))

(declare-fun b!130590 () Bool)

(declare-fun e!86535 () Bool)

(declare-fun array_inv!2522 (array!6038) Bool)

(assert (=> b!130590 (= e!86535 (array_inv!2522 (buf!3094 thiss!1634)))))

(declare-fun b!130591 () Bool)

(declare-fun res!108253 () Bool)

(assert (=> b!130591 (=> (not res!108253) (not e!86538))))

(assert (=> b!130591 (= res!108253 (isPrefixOf!0 thiss!1634 (_2!5914 lt!201562)))))

(declare-fun b!130592 () Bool)

(declare-fun e!86534 () Bool)

(declare-datatypes ((tuple2!11234 0))(
  ( (tuple2!11235 (_1!5917 BitStream!4730) (_2!5917 array!6038)) )
))
(declare-fun lt!201569 () tuple2!11234)

(declare-fun arrayRangesEq!136 (array!6038 array!6038 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130592 (= e!86534 (not (arrayRangesEq!136 arr!237 (_2!5917 lt!201569) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!130593 () Bool)

(declare-fun res!108262 () Bool)

(assert (=> b!130593 (=> (not res!108262) (not e!86539))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130593 (= res!108262 (invariant!0 (currentBit!5862 thiss!1634) (currentByte!5867 thiss!1634) (size!2733 (buf!3094 thiss!1634))))))

(declare-fun b!130594 () Bool)

(assert (=> b!130594 (= e!86537 (invariant!0 (currentBit!5862 thiss!1634) (currentByte!5867 thiss!1634) (size!2733 (buf!3094 (_2!5914 lt!201562)))))))

(declare-fun res!108261 () Bool)

(assert (=> start!25658 (=> (not res!108261) (not e!86539))))

(assert (=> start!25658 (= res!108261 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2733 arr!237))))))

(assert (=> start!25658 e!86539))

(assert (=> start!25658 true))

(assert (=> start!25658 (array_inv!2522 arr!237)))

(declare-fun inv!12 (BitStream!4730) Bool)

(assert (=> start!25658 (and (inv!12 thiss!1634) e!86535)))

(declare-fun b!130595 () Bool)

(declare-fun res!108256 () Bool)

(assert (=> b!130595 (=> (not res!108256) (not e!86543))))

(assert (=> b!130595 (= res!108256 (isPrefixOf!0 (_2!5914 lt!201562) (_2!5914 lt!201566)))))

(declare-fun b!130596 () Bool)

(declare-fun res!108254 () Bool)

(assert (=> b!130596 (=> (not res!108254) (not e!86539))))

(assert (=> b!130596 (= res!108254 (bvslt from!447 to!404))))

(declare-fun b!130597 () Bool)

(assert (=> b!130597 (= e!86543 (not e!86534))))

(declare-fun res!108264 () Bool)

(assert (=> b!130597 (=> res!108264 e!86534)))

(declare-fun lt!201560 () tuple2!11232)

(assert (=> b!130597 (= res!108264 (or (not (= (size!2733 (_2!5917 lt!201569)) (size!2733 arr!237))) (not (= (_1!5917 lt!201569) (_2!5916 lt!201560)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4730 array!6038 (_ BitVec 32) (_ BitVec 32)) tuple2!11234)

(assert (=> b!130597 (= lt!201569 (readByteArrayLoopPure!0 (_1!5916 lt!201560) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130597 (validate_offset_bits!1 ((_ sign_extend 32) (size!2733 (buf!3094 (_2!5914 lt!201566)))) ((_ sign_extend 32) (currentByte!5867 (_2!5914 lt!201562))) ((_ sign_extend 32) (currentBit!5862 (_2!5914 lt!201562))) lt!201567)))

(declare-fun lt!201561 () Unit!8080)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4730 array!6038 (_ BitVec 64)) Unit!8080)

(assert (=> b!130597 (= lt!201561 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5914 lt!201562) (buf!3094 (_2!5914 lt!201566)) lt!201567))))

(assert (=> b!130597 (= lt!201560 (reader!0 (_2!5914 lt!201562) (_2!5914 lt!201566)))))

(declare-fun b!130598 () Bool)

(assert (=> b!130598 (= e!86541 (= (_2!5915 lt!201564) (_2!5915 lt!201559)))))

(assert (= (and start!25658 res!108261) b!130586))

(assert (= (and b!130586 res!108255) b!130596))

(assert (= (and b!130596 res!108254) b!130593))

(assert (= (and b!130593 res!108262) b!130589))

(assert (= (and b!130589 res!108259) b!130585))

(assert (= (and b!130585 res!108258) b!130591))

(assert (= (and b!130591 res!108253) b!130587))

(assert (= (and b!130589 res!108260) b!130588))

(assert (= (and b!130588 res!108257) b!130595))

(assert (= (and b!130595 res!108256) b!130597))

(assert (= (and b!130597 (not res!108264)) b!130592))

(assert (= (and b!130589 res!108265) b!130594))

(assert (= (and b!130589 res!108263) b!130598))

(assert (= start!25658 b!130590))

(declare-fun m!196965 () Bool)

(assert (=> b!130593 m!196965))

(declare-fun m!196967 () Bool)

(assert (=> b!130595 m!196967))

(declare-fun m!196969 () Bool)

(assert (=> start!25658 m!196969))

(declare-fun m!196971 () Bool)

(assert (=> start!25658 m!196971))

(declare-fun m!196973 () Bool)

(assert (=> b!130588 m!196973))

(declare-fun m!196975 () Bool)

(assert (=> b!130588 m!196975))

(declare-fun m!196977 () Bool)

(assert (=> b!130594 m!196977))

(declare-fun m!196979 () Bool)

(assert (=> b!130586 m!196979))

(declare-fun m!196981 () Bool)

(assert (=> b!130592 m!196981))

(declare-fun m!196983 () Bool)

(assert (=> b!130589 m!196983))

(declare-fun m!196985 () Bool)

(assert (=> b!130589 m!196985))

(declare-fun m!196987 () Bool)

(assert (=> b!130589 m!196987))

(declare-fun m!196989 () Bool)

(assert (=> b!130589 m!196989))

(declare-fun m!196991 () Bool)

(assert (=> b!130589 m!196991))

(declare-fun m!196993 () Bool)

(assert (=> b!130589 m!196993))

(declare-fun m!196995 () Bool)

(assert (=> b!130589 m!196995))

(declare-fun m!196997 () Bool)

(assert (=> b!130589 m!196997))

(declare-fun m!196999 () Bool)

(assert (=> b!130589 m!196999))

(declare-fun m!197001 () Bool)

(assert (=> b!130589 m!197001))

(declare-fun m!197003 () Bool)

(assert (=> b!130589 m!197003))

(declare-fun m!197005 () Bool)

(assert (=> b!130589 m!197005))

(declare-fun m!197007 () Bool)

(assert (=> b!130589 m!197007))

(declare-fun m!197009 () Bool)

(assert (=> b!130589 m!197009))

(declare-fun m!197011 () Bool)

(assert (=> b!130589 m!197011))

(assert (=> b!130589 m!196993))

(assert (=> b!130585 m!196975))

(declare-fun m!197013 () Bool)

(assert (=> b!130585 m!197013))

(declare-fun m!197015 () Bool)

(assert (=> b!130597 m!197015))

(declare-fun m!197017 () Bool)

(assert (=> b!130597 m!197017))

(declare-fun m!197019 () Bool)

(assert (=> b!130597 m!197019))

(assert (=> b!130597 m!196983))

(declare-fun m!197021 () Bool)

(assert (=> b!130590 m!197021))

(declare-fun m!197023 () Bool)

(assert (=> b!130591 m!197023))

(assert (=> b!130587 m!196993))

(declare-fun m!197025 () Bool)

(assert (=> b!130587 m!197025))

(declare-fun m!197027 () Bool)

(assert (=> b!130587 m!197027))

(push 1)

(assert (not b!130597))

(assert (not b!130590))

(assert (not b!130593))

(assert (not b!130585))

(assert (not start!25658))

(assert (not b!130587))

(assert (not b!130595))

(assert (not b!130588))

(assert (not b!130591))

(assert (not b!130594))

(assert (not b!130589))

(assert (not b!130586))

(assert (not b!130592))

(check-sat)

