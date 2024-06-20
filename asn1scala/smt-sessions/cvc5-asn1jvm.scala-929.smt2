; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26348 () Bool)

(assert start!26348)

(declare-fun b!134713 () Bool)

(declare-fun e!89389 () Bool)

(declare-datatypes ((array!6148 0))(
  ( (array!6149 (arr!3447 (Array (_ BitVec 32) (_ BitVec 8))) (size!2782 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4828 0))(
  ( (BitStream!4829 (buf!3175 array!6148) (currentByte!5972 (_ BitVec 32)) (currentBit!5967 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11652 0))(
  ( (tuple2!11653 (_1!6142 BitStream!4828) (_2!6142 (_ BitVec 8))) )
))
(declare-fun lt!208968 () tuple2!11652)

(declare-fun lt!208970 () tuple2!11652)

(assert (=> b!134713 (= e!89389 (= (_2!6142 lt!208968) (_2!6142 lt!208970)))))

(declare-fun b!134714 () Bool)

(declare-fun e!89382 () Bool)

(assert (=> b!134714 (= e!89382 (not true))))

(declare-datatypes ((tuple2!11654 0))(
  ( (tuple2!11655 (_1!6143 BitStream!4828) (_2!6143 array!6148)) )
))
(declare-fun lt!208967 () tuple2!11654)

(declare-fun lt!208981 () tuple2!11654)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arrayRangesEq!185 (array!6148 array!6148 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134714 (arrayRangesEq!185 (_2!6143 lt!208967) (_2!6143 lt!208981) #b00000000000000000000000000000000 to!404)))

(declare-fun arr!237 () array!6148)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!11656 0))(
  ( (tuple2!11657 (_1!6144 BitStream!4828) (_2!6144 BitStream!4828)) )
))
(declare-fun lt!208977 () tuple2!11656)

(declare-datatypes ((Unit!8402 0))(
  ( (Unit!8403) )
))
(declare-fun lt!208985 () Unit!8402)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4828 array!6148 (_ BitVec 32) (_ BitVec 32)) Unit!8402)

(assert (=> b!134714 (= lt!208985 (readByteArrayLoopArrayPrefixLemma!0 (_1!6144 lt!208977) arr!237 from!447 to!404))))

(declare-fun lt!208963 () array!6148)

(declare-fun readByteArrayLoopPure!0 (BitStream!4828 array!6148 (_ BitVec 32) (_ BitVec 32)) tuple2!11654)

(declare-fun withMovedByteIndex!0 (BitStream!4828 (_ BitVec 32)) BitStream!4828)

(assert (=> b!134714 (= lt!208981 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6144 lt!208977) #b00000000000000000000000000000001) lt!208963 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!208978 () tuple2!11656)

(declare-fun lt!208964 () tuple2!11654)

(assert (=> b!134714 (= lt!208964 (readByteArrayLoopPure!0 (_1!6144 lt!208978) lt!208963 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!208966 () tuple2!11652)

(assert (=> b!134714 (= lt!208963 (array!6149 (store (arr!3447 arr!237) from!447 (_2!6142 lt!208966)) (size!2782 arr!237)))))

(declare-datatypes ((tuple2!11658 0))(
  ( (tuple2!11659 (_1!6145 Unit!8402) (_2!6145 BitStream!4828)) )
))
(declare-fun lt!208969 () tuple2!11658)

(declare-fun lt!208965 () tuple2!11658)

(declare-fun lt!208974 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!134714 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2782 (buf!3175 (_2!6145 lt!208969)))) ((_ sign_extend 32) (currentByte!5972 (_2!6145 lt!208965))) ((_ sign_extend 32) (currentBit!5967 (_2!6145 lt!208965))) lt!208974)))

(declare-fun lt!208972 () Unit!8402)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4828 array!6148 (_ BitVec 32)) Unit!8402)

(assert (=> b!134714 (= lt!208972 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6145 lt!208965) (buf!3175 (_2!6145 lt!208969)) lt!208974))))

(assert (=> b!134714 (= (_1!6143 lt!208967) (_2!6144 lt!208977))))

(assert (=> b!134714 (= lt!208967 (readByteArrayLoopPure!0 (_1!6144 lt!208977) arr!237 from!447 to!404))))

(declare-fun thiss!1634 () BitStream!4828)

(assert (=> b!134714 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2782 (buf!3175 (_2!6145 lt!208969)))) ((_ sign_extend 32) (currentByte!5972 thiss!1634)) ((_ sign_extend 32) (currentBit!5967 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!208984 () Unit!8402)

(assert (=> b!134714 (= lt!208984 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3175 (_2!6145 lt!208969)) (bvsub to!404 from!447)))))

(assert (=> b!134714 (= (_2!6142 lt!208966) (select (arr!3447 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4828) tuple2!11652)

(assert (=> b!134714 (= lt!208966 (readBytePure!0 (_1!6144 lt!208977)))))

(declare-fun reader!0 (BitStream!4828 BitStream!4828) tuple2!11656)

(assert (=> b!134714 (= lt!208978 (reader!0 (_2!6145 lt!208965) (_2!6145 lt!208969)))))

(assert (=> b!134714 (= lt!208977 (reader!0 thiss!1634 (_2!6145 lt!208969)))))

(assert (=> b!134714 e!89389))

(declare-fun res!111972 () Bool)

(assert (=> b!134714 (=> (not res!111972) (not e!89389))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!134714 (= res!111972 (= (bitIndex!0 (size!2782 (buf!3175 (_1!6142 lt!208968))) (currentByte!5972 (_1!6142 lt!208968)) (currentBit!5967 (_1!6142 lt!208968))) (bitIndex!0 (size!2782 (buf!3175 (_1!6142 lt!208970))) (currentByte!5972 (_1!6142 lt!208970)) (currentBit!5967 (_1!6142 lt!208970)))))))

(declare-fun lt!208983 () Unit!8402)

(declare-fun lt!208975 () BitStream!4828)

(declare-fun readBytePrefixLemma!0 (BitStream!4828 BitStream!4828) Unit!8402)

(assert (=> b!134714 (= lt!208983 (readBytePrefixLemma!0 lt!208975 (_2!6145 lt!208969)))))

(assert (=> b!134714 (= lt!208970 (readBytePure!0 (BitStream!4829 (buf!3175 (_2!6145 lt!208969)) (currentByte!5972 thiss!1634) (currentBit!5967 thiss!1634))))))

(assert (=> b!134714 (= lt!208968 (readBytePure!0 lt!208975))))

(assert (=> b!134714 (= lt!208975 (BitStream!4829 (buf!3175 (_2!6145 lt!208965)) (currentByte!5972 thiss!1634) (currentBit!5967 thiss!1634)))))

(declare-fun e!89383 () Bool)

(assert (=> b!134714 e!89383))

(declare-fun res!111966 () Bool)

(assert (=> b!134714 (=> (not res!111966) (not e!89383))))

(declare-fun isPrefixOf!0 (BitStream!4828 BitStream!4828) Bool)

(assert (=> b!134714 (= res!111966 (isPrefixOf!0 thiss!1634 (_2!6145 lt!208969)))))

(declare-fun lt!208979 () Unit!8402)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4828 BitStream!4828 BitStream!4828) Unit!8402)

(assert (=> b!134714 (= lt!208979 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6145 lt!208965) (_2!6145 lt!208969)))))

(declare-fun e!89388 () Bool)

(assert (=> b!134714 e!89388))

(declare-fun res!111967 () Bool)

(assert (=> b!134714 (=> (not res!111967) (not e!89388))))

(assert (=> b!134714 (= res!111967 (= (size!2782 (buf!3175 (_2!6145 lt!208965))) (size!2782 (buf!3175 (_2!6145 lt!208969)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4828 array!6148 (_ BitVec 32) (_ BitVec 32)) tuple2!11658)

(assert (=> b!134714 (= lt!208969 (appendByteArrayLoop!0 (_2!6145 lt!208965) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!134714 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2782 (buf!3175 (_2!6145 lt!208965)))) ((_ sign_extend 32) (currentByte!5972 (_2!6145 lt!208965))) ((_ sign_extend 32) (currentBit!5967 (_2!6145 lt!208965))) lt!208974)))

(assert (=> b!134714 (= lt!208974 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!208987 () Unit!8402)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4828 BitStream!4828 (_ BitVec 64) (_ BitVec 32)) Unit!8402)

(assert (=> b!134714 (= lt!208987 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6145 lt!208965) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!89385 () Bool)

(assert (=> b!134714 e!89385))

(declare-fun res!111978 () Bool)

(assert (=> b!134714 (=> (not res!111978) (not e!89385))))

(assert (=> b!134714 (= res!111978 (= (size!2782 (buf!3175 thiss!1634)) (size!2782 (buf!3175 (_2!6145 lt!208965)))))))

(declare-fun appendByte!0 (BitStream!4828 (_ BitVec 8)) tuple2!11658)

(assert (=> b!134714 (= lt!208965 (appendByte!0 thiss!1634 (select (arr!3447 arr!237) from!447)))))

(declare-fun b!134715 () Bool)

(declare-fun e!89386 () Bool)

(assert (=> b!134715 (= e!89388 e!89386)))

(declare-fun res!111974 () Bool)

(assert (=> b!134715 (=> (not res!111974) (not e!89386))))

(declare-fun lt!208982 () (_ BitVec 64))

(assert (=> b!134715 (= res!111974 (= (bitIndex!0 (size!2782 (buf!3175 (_2!6145 lt!208969))) (currentByte!5972 (_2!6145 lt!208969)) (currentBit!5967 (_2!6145 lt!208969))) (bvadd (bitIndex!0 (size!2782 (buf!3175 (_2!6145 lt!208965))) (currentByte!5972 (_2!6145 lt!208965)) (currentBit!5967 (_2!6145 lt!208965))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!208982))))))

(assert (=> b!134715 (= lt!208982 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!134716 () Bool)

(declare-fun lt!208986 () tuple2!11652)

(declare-fun lt!208971 () tuple2!11656)

(assert (=> b!134716 (= e!89385 (and (= (_2!6142 lt!208986) (select (arr!3447 arr!237) from!447)) (= (_1!6142 lt!208986) (_2!6144 lt!208971))))))

(assert (=> b!134716 (= lt!208986 (readBytePure!0 (_1!6144 lt!208971)))))

(assert (=> b!134716 (= lt!208971 (reader!0 thiss!1634 (_2!6145 lt!208965)))))

(declare-fun b!134717 () Bool)

(declare-fun res!111970 () Bool)

(assert (=> b!134717 (=> (not res!111970) (not e!89386))))

(assert (=> b!134717 (= res!111970 (isPrefixOf!0 (_2!6145 lt!208965) (_2!6145 lt!208969)))))

(declare-fun res!111969 () Bool)

(assert (=> start!26348 (=> (not res!111969) (not e!89382))))

(assert (=> start!26348 (= res!111969 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2782 arr!237))))))

(assert (=> start!26348 e!89382))

(assert (=> start!26348 true))

(declare-fun array_inv!2571 (array!6148) Bool)

(assert (=> start!26348 (array_inv!2571 arr!237)))

(declare-fun e!89387 () Bool)

(declare-fun inv!12 (BitStream!4828) Bool)

(assert (=> start!26348 (and (inv!12 thiss!1634) e!89387)))

(declare-fun b!134718 () Bool)

(declare-fun e!89390 () Bool)

(declare-fun lt!208980 () tuple2!11654)

(assert (=> b!134718 (= e!89390 (not (arrayRangesEq!185 arr!237 (_2!6143 lt!208980) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!134719 () Bool)

(declare-fun res!111971 () Bool)

(assert (=> b!134719 (=> (not res!111971) (not e!89385))))

(assert (=> b!134719 (= res!111971 (= (bitIndex!0 (size!2782 (buf!3175 (_2!6145 lt!208965))) (currentByte!5972 (_2!6145 lt!208965)) (currentBit!5967 (_2!6145 lt!208965))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2782 (buf!3175 thiss!1634)) (currentByte!5972 thiss!1634) (currentBit!5967 thiss!1634)))))))

(declare-fun b!134720 () Bool)

(assert (=> b!134720 (= e!89386 (not e!89390))))

(declare-fun res!111973 () Bool)

(assert (=> b!134720 (=> res!111973 e!89390)))

(declare-fun lt!208973 () tuple2!11656)

(assert (=> b!134720 (= res!111973 (or (not (= (size!2782 (_2!6143 lt!208980)) (size!2782 arr!237))) (not (= (_1!6143 lt!208980) (_2!6144 lt!208973)))))))

(assert (=> b!134720 (= lt!208980 (readByteArrayLoopPure!0 (_1!6144 lt!208973) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!134720 (validate_offset_bits!1 ((_ sign_extend 32) (size!2782 (buf!3175 (_2!6145 lt!208969)))) ((_ sign_extend 32) (currentByte!5972 (_2!6145 lt!208965))) ((_ sign_extend 32) (currentBit!5967 (_2!6145 lt!208965))) lt!208982)))

(declare-fun lt!208976 () Unit!8402)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4828 array!6148 (_ BitVec 64)) Unit!8402)

(assert (=> b!134720 (= lt!208976 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6145 lt!208965) (buf!3175 (_2!6145 lt!208969)) lt!208982))))

(assert (=> b!134720 (= lt!208973 (reader!0 (_2!6145 lt!208965) (_2!6145 lt!208969)))))

(declare-fun b!134721 () Bool)

(declare-fun res!111968 () Bool)

(assert (=> b!134721 (=> (not res!111968) (not e!89385))))

(assert (=> b!134721 (= res!111968 (isPrefixOf!0 thiss!1634 (_2!6145 lt!208965)))))

(declare-fun b!134722 () Bool)

(declare-fun res!111975 () Bool)

(assert (=> b!134722 (=> (not res!111975) (not e!89382))))

(assert (=> b!134722 (= res!111975 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2782 (buf!3175 thiss!1634))) ((_ sign_extend 32) (currentByte!5972 thiss!1634)) ((_ sign_extend 32) (currentBit!5967 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!134723 () Bool)

(declare-fun res!111977 () Bool)

(assert (=> b!134723 (=> (not res!111977) (not e!89382))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134723 (= res!111977 (invariant!0 (currentBit!5967 thiss!1634) (currentByte!5972 thiss!1634) (size!2782 (buf!3175 thiss!1634))))))

(declare-fun b!134724 () Bool)

(assert (=> b!134724 (= e!89383 (invariant!0 (currentBit!5967 thiss!1634) (currentByte!5972 thiss!1634) (size!2782 (buf!3175 (_2!6145 lt!208965)))))))

(declare-fun b!134725 () Bool)

(declare-fun res!111976 () Bool)

(assert (=> b!134725 (=> (not res!111976) (not e!89382))))

(assert (=> b!134725 (= res!111976 (bvslt from!447 to!404))))

(declare-fun b!134726 () Bool)

(assert (=> b!134726 (= e!89387 (array_inv!2571 (buf!3175 thiss!1634)))))

(assert (= (and start!26348 res!111969) b!134722))

(assert (= (and b!134722 res!111975) b!134725))

(assert (= (and b!134725 res!111976) b!134723))

(assert (= (and b!134723 res!111977) b!134714))

(assert (= (and b!134714 res!111978) b!134719))

(assert (= (and b!134719 res!111971) b!134721))

(assert (= (and b!134721 res!111968) b!134716))

(assert (= (and b!134714 res!111967) b!134715))

(assert (= (and b!134715 res!111974) b!134717))

(assert (= (and b!134717 res!111970) b!134720))

(assert (= (and b!134720 (not res!111973)) b!134718))

(assert (= (and b!134714 res!111966) b!134724))

(assert (= (and b!134714 res!111972) b!134713))

(assert (= start!26348 b!134726))

(declare-fun m!205141 () Bool)

(assert (=> b!134719 m!205141))

(declare-fun m!205143 () Bool)

(assert (=> b!134719 m!205143))

(declare-fun m!205145 () Bool)

(assert (=> b!134714 m!205145))

(declare-fun m!205147 () Bool)

(assert (=> b!134714 m!205147))

(declare-fun m!205149 () Bool)

(assert (=> b!134714 m!205149))

(declare-fun m!205151 () Bool)

(assert (=> b!134714 m!205151))

(declare-fun m!205153 () Bool)

(assert (=> b!134714 m!205153))

(declare-fun m!205155 () Bool)

(assert (=> b!134714 m!205155))

(declare-fun m!205157 () Bool)

(assert (=> b!134714 m!205157))

(declare-fun m!205159 () Bool)

(assert (=> b!134714 m!205159))

(declare-fun m!205161 () Bool)

(assert (=> b!134714 m!205161))

(declare-fun m!205163 () Bool)

(assert (=> b!134714 m!205163))

(assert (=> b!134714 m!205153))

(declare-fun m!205165 () Bool)

(assert (=> b!134714 m!205165))

(declare-fun m!205167 () Bool)

(assert (=> b!134714 m!205167))

(declare-fun m!205169 () Bool)

(assert (=> b!134714 m!205169))

(declare-fun m!205171 () Bool)

(assert (=> b!134714 m!205171))

(declare-fun m!205173 () Bool)

(assert (=> b!134714 m!205173))

(declare-fun m!205175 () Bool)

(assert (=> b!134714 m!205175))

(declare-fun m!205177 () Bool)

(assert (=> b!134714 m!205177))

(declare-fun m!205179 () Bool)

(assert (=> b!134714 m!205179))

(declare-fun m!205181 () Bool)

(assert (=> b!134714 m!205181))

(declare-fun m!205183 () Bool)

(assert (=> b!134714 m!205183))

(declare-fun m!205185 () Bool)

(assert (=> b!134714 m!205185))

(declare-fun m!205187 () Bool)

(assert (=> b!134714 m!205187))

(declare-fun m!205189 () Bool)

(assert (=> b!134714 m!205189))

(declare-fun m!205191 () Bool)

(assert (=> b!134714 m!205191))

(declare-fun m!205193 () Bool)

(assert (=> b!134714 m!205193))

(declare-fun m!205195 () Bool)

(assert (=> b!134714 m!205195))

(assert (=> b!134714 m!205183))

(declare-fun m!205197 () Bool)

(assert (=> start!26348 m!205197))

(declare-fun m!205199 () Bool)

(assert (=> start!26348 m!205199))

(declare-fun m!205201 () Bool)

(assert (=> b!134720 m!205201))

(declare-fun m!205203 () Bool)

(assert (=> b!134720 m!205203))

(declare-fun m!205205 () Bool)

(assert (=> b!134720 m!205205))

(assert (=> b!134720 m!205163))

(declare-fun m!205207 () Bool)

(assert (=> b!134718 m!205207))

(declare-fun m!205209 () Bool)

(assert (=> b!134722 m!205209))

(declare-fun m!205211 () Bool)

(assert (=> b!134715 m!205211))

(assert (=> b!134715 m!205141))

(declare-fun m!205213 () Bool)

(assert (=> b!134724 m!205213))

(declare-fun m!205215 () Bool)

(assert (=> b!134726 m!205215))

(declare-fun m!205217 () Bool)

(assert (=> b!134721 m!205217))

(assert (=> b!134716 m!205183))

(declare-fun m!205219 () Bool)

(assert (=> b!134716 m!205219))

(declare-fun m!205221 () Bool)

(assert (=> b!134716 m!205221))

(declare-fun m!205223 () Bool)

(assert (=> b!134723 m!205223))

(declare-fun m!205225 () Bool)

(assert (=> b!134717 m!205225))

(push 1)

(assert (not b!134726))

(assert (not b!134717))

(assert (not start!26348))

(assert (not b!134723))

(assert (not b!134724))

(assert (not b!134721))

(assert (not b!134720))

(assert (not b!134714))

(assert (not b!134722))

(assert (not b!134718))

(assert (not b!134716))

(assert (not b!134719))

(assert (not b!134715))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

