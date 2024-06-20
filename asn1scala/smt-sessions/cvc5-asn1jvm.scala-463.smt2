; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13008 () Bool)

(assert start!13008)

(declare-fun res!55299 () Bool)

(declare-fun e!43781 () Bool)

(assert (=> start!13008 (=> (not res!55299) (not e!43781))))

(declare-datatypes ((array!2857 0))(
  ( (array!2858 (arr!1886 (Array (_ BitVec 32) (_ BitVec 8))) (size!1319 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2857)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!13008 (= res!55299 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1319 srcBuffer!2))))))))

(assert (=> start!13008 e!43781))

(assert (=> start!13008 true))

(declare-fun array_inv!1192 (array!2857) Bool)

(assert (=> start!13008 (array_inv!1192 srcBuffer!2)))

(declare-datatypes ((BitStream!2266 0))(
  ( (BitStream!2267 (buf!1700 array!2857) (currentByte!3378 (_ BitVec 32)) (currentBit!3373 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2266)

(declare-fun e!43789 () Bool)

(declare-fun inv!12 (BitStream!2266) Bool)

(assert (=> start!13008 (and (inv!12 thiss!1379) e!43789)))

(declare-fun b!66732 () Bool)

(declare-fun res!55286 () Bool)

(declare-fun e!43782 () Bool)

(assert (=> b!66732 (=> res!55286 e!43782)))

(declare-datatypes ((List!708 0))(
  ( (Nil!705) (Cons!704 (h!823 Bool) (t!1458 List!708)) )
))
(declare-fun lt!106130 () List!708)

(declare-fun lt!106147 () Bool)

(declare-fun head!527 (List!708) Bool)

(assert (=> b!66732 (= res!55286 (not (= (head!527 lt!106130) lt!106147)))))

(declare-fun b!66733 () Bool)

(declare-fun res!55295 () Bool)

(declare-fun e!43790 () Bool)

(assert (=> b!66733 (=> res!55295 e!43790)))

(declare-datatypes ((Unit!4499 0))(
  ( (Unit!4500) )
))
(declare-datatypes ((tuple2!5892 0))(
  ( (tuple2!5893 (_1!3057 Unit!4499) (_2!3057 BitStream!2266)) )
))
(declare-fun lt!106131 () tuple2!5892)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!66733 (= res!55295 (not (invariant!0 (currentBit!3373 (_2!3057 lt!106131)) (currentByte!3378 (_2!3057 lt!106131)) (size!1319 (buf!1700 (_2!3057 lt!106131))))))))

(declare-fun b!66734 () Bool)

(declare-fun res!55287 () Bool)

(declare-fun e!43780 () Bool)

(assert (=> b!66734 (=> res!55287 e!43780)))

(declare-fun lt!106142 () tuple2!5892)

(assert (=> b!66734 (= res!55287 (not (invariant!0 (currentBit!3373 (_2!3057 lt!106142)) (currentByte!3378 (_2!3057 lt!106142)) (size!1319 (buf!1700 (_2!3057 lt!106131))))))))

(declare-fun b!66735 () Bool)

(declare-fun res!55292 () Bool)

(declare-fun e!43793 () Bool)

(assert (=> b!66735 (=> res!55292 e!43793)))

(declare-fun length!336 (List!708) Int)

(assert (=> b!66735 (= res!55292 (<= (length!336 lt!106130) 0))))

(declare-fun b!66736 () Bool)

(declare-fun e!43791 () Bool)

(assert (=> b!66736 (= e!43782 e!43791)))

(declare-fun res!55294 () Bool)

(assert (=> b!66736 (=> res!55294 e!43791)))

(declare-fun lt!106144 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2266 array!2857 (_ BitVec 64) (_ BitVec 64)) List!708)

(assert (=> b!66736 (= res!55294 (not (= (head!527 (byteArrayBitContentToList!0 (_2!3057 lt!106131) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!106144)))))

(declare-fun bitAt!0 (array!2857 (_ BitVec 64)) Bool)

(assert (=> b!66736 (= lt!106144 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!66737 () Bool)

(declare-fun e!43785 () Bool)

(assert (=> b!66737 (= e!43793 e!43785)))

(declare-fun res!55290 () Bool)

(assert (=> b!66737 (=> res!55290 e!43785)))

(declare-fun lt!106145 () List!708)

(declare-fun lt!106137 () List!708)

(assert (=> b!66737 (= res!55290 (not (= lt!106145 lt!106137)))))

(assert (=> b!66737 (= lt!106137 lt!106145)))

(declare-fun tail!312 (List!708) List!708)

(assert (=> b!66737 (= lt!106145 (tail!312 lt!106130))))

(declare-datatypes ((tuple2!5894 0))(
  ( (tuple2!5895 (_1!3058 BitStream!2266) (_2!3058 BitStream!2266)) )
))
(declare-fun lt!106134 () tuple2!5894)

(declare-fun lt!106136 () tuple2!5894)

(declare-fun lt!106138 () Unit!4499)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2266 BitStream!2266 BitStream!2266 BitStream!2266 (_ BitVec 64) List!708) Unit!4499)

(assert (=> b!66737 (= lt!106138 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3057 lt!106131) (_2!3057 lt!106131) (_1!3058 lt!106134) (_1!3058 lt!106136) (bvsub to!314 i!635) lt!106130))))

(declare-fun b!66738 () Bool)

(declare-fun res!55285 () Bool)

(assert (=> b!66738 (=> res!55285 e!43790)))

(assert (=> b!66738 (= res!55285 (not (= (size!1319 (buf!1700 thiss!1379)) (size!1319 (buf!1700 (_2!3057 lt!106131))))))))

(declare-fun b!66739 () Bool)

(declare-fun e!43788 () Bool)

(declare-fun e!43786 () Bool)

(assert (=> b!66739 (= e!43788 e!43786)))

(declare-fun res!55289 () Bool)

(assert (=> b!66739 (=> res!55289 e!43786)))

(declare-fun isPrefixOf!0 (BitStream!2266 BitStream!2266) Bool)

(assert (=> b!66739 (= res!55289 (not (isPrefixOf!0 (_2!3057 lt!106142) (_2!3057 lt!106131))))))

(assert (=> b!66739 (isPrefixOf!0 thiss!1379 (_2!3057 lt!106131))))

(declare-fun lt!106128 () Unit!4499)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2266 BitStream!2266 BitStream!2266) Unit!4499)

(assert (=> b!66739 (= lt!106128 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3057 lt!106142) (_2!3057 lt!106131)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2266 array!2857 (_ BitVec 64) (_ BitVec 64)) tuple2!5892)

(assert (=> b!66739 (= lt!106131 (appendBitsMSBFirstLoop!0 (_2!3057 lt!106142) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!43792 () Bool)

(assert (=> b!66739 e!43792))

(declare-fun res!55288 () Bool)

(assert (=> b!66739 (=> (not res!55288) (not e!43792))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!66739 (= res!55288 (validate_offset_bits!1 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106142)))) ((_ sign_extend 32) (currentByte!3378 thiss!1379)) ((_ sign_extend 32) (currentBit!3373 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!106135 () Unit!4499)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2266 array!2857 (_ BitVec 64)) Unit!4499)

(assert (=> b!66739 (= lt!106135 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1700 (_2!3057 lt!106142)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!106146 () tuple2!5894)

(declare-fun reader!0 (BitStream!2266 BitStream!2266) tuple2!5894)

(assert (=> b!66739 (= lt!106146 (reader!0 thiss!1379 (_2!3057 lt!106142)))))

(declare-fun b!66740 () Bool)

(declare-fun lt!106148 () (_ BitVec 64))

(declare-fun lt!106141 () (_ BitVec 64))

(assert (=> b!66740 (= e!43791 (or (= lt!106141 (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!106141 (bvand lt!106148 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!106133 () (_ BitVec 64))

(assert (=> b!66740 (= lt!106141 (bvand lt!106133 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!66741 () Bool)

(assert (=> b!66741 (= e!43789 (array_inv!1192 (buf!1700 thiss!1379)))))

(declare-fun b!66742 () Bool)

(assert (=> b!66742 (= e!43790 e!43780)))

(declare-fun res!55298 () Bool)

(assert (=> b!66742 (=> res!55298 e!43780)))

(assert (=> b!66742 (= res!55298 (not (= (size!1319 (buf!1700 (_2!3057 lt!106142))) (size!1319 (buf!1700 (_2!3057 lt!106131))))))))

(declare-fun lt!106140 () (_ BitVec 64))

(assert (=> b!66742 (= lt!106140 (bvsub lt!106148 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!66742 (= lt!106148 (bvsub lt!106133 i!635))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!66742 (= lt!106133 (bvadd (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106142))) (currentByte!3378 (_2!3057 lt!106142)) (currentBit!3373 (_2!3057 lt!106142))) to!314))))

(assert (=> b!66742 (= (size!1319 (buf!1700 (_2!3057 lt!106131))) (size!1319 (buf!1700 thiss!1379)))))

(declare-fun b!66743 () Bool)

(declare-fun res!55281 () Bool)

(assert (=> b!66743 (=> (not res!55281) (not e!43781))))

(assert (=> b!66743 (= res!55281 (validate_offset_bits!1 ((_ sign_extend 32) (size!1319 (buf!1700 thiss!1379))) ((_ sign_extend 32) (currentByte!3378 thiss!1379)) ((_ sign_extend 32) (currentBit!3373 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!66744 () Bool)

(assert (=> b!66744 (= e!43785 e!43782)))

(declare-fun res!55283 () Bool)

(assert (=> b!66744 (=> res!55283 e!43782)))

(declare-fun lt!106129 () (_ BitVec 64))

(assert (=> b!66744 (= res!55283 (not (= lt!106147 (bitAt!0 (buf!1700 (_1!3058 lt!106136)) lt!106129))))))

(assert (=> b!66744 (= lt!106147 (bitAt!0 (buf!1700 (_1!3058 lt!106134)) lt!106129))))

(declare-fun b!66745 () Bool)

(declare-fun res!55282 () Bool)

(assert (=> b!66745 (=> res!55282 e!43791)))

(assert (=> b!66745 (= res!55282 (not (= (bitAt!0 (buf!1700 (_2!3057 lt!106142)) lt!106129) lt!106144)))))

(declare-fun b!66746 () Bool)

(declare-fun res!55284 () Bool)

(assert (=> b!66746 (=> res!55284 e!43780)))

(assert (=> b!66746 (= res!55284 (not (invariant!0 (currentBit!3373 (_2!3057 lt!106142)) (currentByte!3378 (_2!3057 lt!106142)) (size!1319 (buf!1700 (_2!3057 lt!106142))))))))

(declare-fun b!66747 () Bool)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2266 BitStream!2266 (_ BitVec 64)) List!708)

(assert (=> b!66747 (= e!43792 (= (head!527 (byteArrayBitContentToList!0 (_2!3057 lt!106142) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!527 (bitStreamReadBitsIntoList!0 (_2!3057 lt!106142) (_1!3058 lt!106146) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!66748 () Bool)

(assert (=> b!66748 (= e!43780 e!43793)))

(declare-fun res!55297 () Bool)

(assert (=> b!66748 (=> res!55297 e!43793)))

(assert (=> b!66748 (= res!55297 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!106149 () (_ BitVec 64))

(assert (=> b!66748 (= lt!106137 (bitStreamReadBitsIntoList!0 (_2!3057 lt!106131) (_1!3058 lt!106136) lt!106149))))

(assert (=> b!66748 (= lt!106130 (bitStreamReadBitsIntoList!0 (_2!3057 lt!106131) (_1!3058 lt!106134) (bvsub to!314 i!635)))))

(assert (=> b!66748 (validate_offset_bits!1 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106131)))) ((_ sign_extend 32) (currentByte!3378 (_2!3057 lt!106142))) ((_ sign_extend 32) (currentBit!3373 (_2!3057 lt!106142))) lt!106149)))

(declare-fun lt!106143 () Unit!4499)

(assert (=> b!66748 (= lt!106143 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3057 lt!106142) (buf!1700 (_2!3057 lt!106131)) lt!106149))))

(assert (=> b!66748 (= lt!106136 (reader!0 (_2!3057 lt!106142) (_2!3057 lt!106131)))))

(assert (=> b!66748 (validate_offset_bits!1 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106131)))) ((_ sign_extend 32) (currentByte!3378 thiss!1379)) ((_ sign_extend 32) (currentBit!3373 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!106139 () Unit!4499)

(assert (=> b!66748 (= lt!106139 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1700 (_2!3057 lt!106131)) (bvsub to!314 i!635)))))

(assert (=> b!66748 (= lt!106134 (reader!0 thiss!1379 (_2!3057 lt!106131)))))

(declare-fun b!66749 () Bool)

(declare-fun e!43787 () Bool)

(assert (=> b!66749 (= e!43781 (not e!43787))))

(declare-fun res!55293 () Bool)

(assert (=> b!66749 (=> res!55293 e!43787)))

(assert (=> b!66749 (= res!55293 (bvsge i!635 to!314))))

(assert (=> b!66749 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!106132 () Unit!4499)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2266) Unit!4499)

(assert (=> b!66749 (= lt!106132 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!66749 (= lt!106129 (bitIndex!0 (size!1319 (buf!1700 thiss!1379)) (currentByte!3378 thiss!1379) (currentBit!3373 thiss!1379)))))

(declare-fun b!66750 () Bool)

(assert (=> b!66750 (= e!43786 e!43790)))

(declare-fun res!55296 () Bool)

(assert (=> b!66750 (=> res!55296 e!43790)))

(assert (=> b!66750 (= res!55296 (not (= lt!106140 (bvsub (bvadd lt!106129 to!314) i!635))))))

(assert (=> b!66750 (= lt!106140 (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106131))) (currentByte!3378 (_2!3057 lt!106131)) (currentBit!3373 (_2!3057 lt!106131))))))

(declare-fun b!66751 () Bool)

(assert (=> b!66751 (= e!43787 e!43788)))

(declare-fun res!55291 () Bool)

(assert (=> b!66751 (=> res!55291 e!43788)))

(assert (=> b!66751 (= res!55291 (not (isPrefixOf!0 thiss!1379 (_2!3057 lt!106142))))))

(assert (=> b!66751 (validate_offset_bits!1 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106142)))) ((_ sign_extend 32) (currentByte!3378 (_2!3057 lt!106142))) ((_ sign_extend 32) (currentBit!3373 (_2!3057 lt!106142))) lt!106149)))

(assert (=> b!66751 (= lt!106149 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!106150 () Unit!4499)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2266 BitStream!2266 (_ BitVec 64) (_ BitVec 64)) Unit!4499)

(assert (=> b!66751 (= lt!106150 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3057 lt!106142) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2266 (_ BitVec 8) (_ BitVec 32)) tuple2!5892)

(assert (=> b!66751 (= lt!106142 (appendBitFromByte!0 thiss!1379 (select (arr!1886 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!13008 res!55299) b!66743))

(assert (= (and b!66743 res!55281) b!66749))

(assert (= (and b!66749 (not res!55293)) b!66751))

(assert (= (and b!66751 (not res!55291)) b!66739))

(assert (= (and b!66739 res!55288) b!66747))

(assert (= (and b!66739 (not res!55289)) b!66750))

(assert (= (and b!66750 (not res!55296)) b!66733))

(assert (= (and b!66733 (not res!55295)) b!66738))

(assert (= (and b!66738 (not res!55285)) b!66742))

(assert (= (and b!66742 (not res!55298)) b!66746))

(assert (= (and b!66746 (not res!55284)) b!66734))

(assert (= (and b!66734 (not res!55287)) b!66748))

(assert (= (and b!66748 (not res!55297)) b!66735))

(assert (= (and b!66735 (not res!55292)) b!66737))

(assert (= (and b!66737 (not res!55290)) b!66744))

(assert (= (and b!66744 (not res!55283)) b!66732))

(assert (= (and b!66732 (not res!55286)) b!66736))

(assert (= (and b!66736 (not res!55294)) b!66745))

(assert (= (and b!66745 (not res!55282)) b!66740))

(assert (= start!13008 b!66741))

(declare-fun m!106147 () Bool)

(assert (=> b!66749 m!106147))

(declare-fun m!106149 () Bool)

(assert (=> b!66749 m!106149))

(declare-fun m!106151 () Bool)

(assert (=> b!66749 m!106151))

(declare-fun m!106153 () Bool)

(assert (=> b!66745 m!106153))

(declare-fun m!106155 () Bool)

(assert (=> b!66735 m!106155))

(declare-fun m!106157 () Bool)

(assert (=> b!66737 m!106157))

(declare-fun m!106159 () Bool)

(assert (=> b!66737 m!106159))

(declare-fun m!106161 () Bool)

(assert (=> b!66733 m!106161))

(declare-fun m!106163 () Bool)

(assert (=> b!66741 m!106163))

(declare-fun m!106165 () Bool)

(assert (=> b!66747 m!106165))

(assert (=> b!66747 m!106165))

(declare-fun m!106167 () Bool)

(assert (=> b!66747 m!106167))

(declare-fun m!106169 () Bool)

(assert (=> b!66747 m!106169))

(assert (=> b!66747 m!106169))

(declare-fun m!106171 () Bool)

(assert (=> b!66747 m!106171))

(declare-fun m!106173 () Bool)

(assert (=> b!66751 m!106173))

(declare-fun m!106175 () Bool)

(assert (=> b!66751 m!106175))

(declare-fun m!106177 () Bool)

(assert (=> b!66751 m!106177))

(declare-fun m!106179 () Bool)

(assert (=> b!66751 m!106179))

(declare-fun m!106181 () Bool)

(assert (=> b!66751 m!106181))

(assert (=> b!66751 m!106175))

(declare-fun m!106183 () Bool)

(assert (=> b!66736 m!106183))

(assert (=> b!66736 m!106183))

(declare-fun m!106185 () Bool)

(assert (=> b!66736 m!106185))

(declare-fun m!106187 () Bool)

(assert (=> b!66736 m!106187))

(declare-fun m!106189 () Bool)

(assert (=> b!66732 m!106189))

(declare-fun m!106191 () Bool)

(assert (=> b!66739 m!106191))

(declare-fun m!106193 () Bool)

(assert (=> b!66739 m!106193))

(declare-fun m!106195 () Bool)

(assert (=> b!66739 m!106195))

(declare-fun m!106197 () Bool)

(assert (=> b!66739 m!106197))

(declare-fun m!106199 () Bool)

(assert (=> b!66739 m!106199))

(declare-fun m!106201 () Bool)

(assert (=> b!66739 m!106201))

(declare-fun m!106203 () Bool)

(assert (=> b!66739 m!106203))

(declare-fun m!106205 () Bool)

(assert (=> b!66746 m!106205))

(declare-fun m!106207 () Bool)

(assert (=> b!66748 m!106207))

(declare-fun m!106209 () Bool)

(assert (=> b!66748 m!106209))

(declare-fun m!106211 () Bool)

(assert (=> b!66748 m!106211))

(declare-fun m!106213 () Bool)

(assert (=> b!66748 m!106213))

(declare-fun m!106215 () Bool)

(assert (=> b!66748 m!106215))

(declare-fun m!106217 () Bool)

(assert (=> b!66748 m!106217))

(declare-fun m!106219 () Bool)

(assert (=> b!66748 m!106219))

(declare-fun m!106221 () Bool)

(assert (=> b!66748 m!106221))

(declare-fun m!106223 () Bool)

(assert (=> b!66743 m!106223))

(declare-fun m!106225 () Bool)

(assert (=> b!66744 m!106225))

(declare-fun m!106227 () Bool)

(assert (=> b!66744 m!106227))

(declare-fun m!106229 () Bool)

(assert (=> b!66750 m!106229))

(declare-fun m!106231 () Bool)

(assert (=> start!13008 m!106231))

(declare-fun m!106233 () Bool)

(assert (=> start!13008 m!106233))

(declare-fun m!106235 () Bool)

(assert (=> b!66742 m!106235))

(declare-fun m!106237 () Bool)

(assert (=> b!66734 m!106237))

(push 1)

(assert (not b!66737))

(assert (not b!66734))

(assert (not b!66748))

(assert (not b!66746))

(assert (not b!66732))

(assert (not b!66749))

(assert (not b!66743))

(assert (not b!66750))

(assert (not b!66741))

(assert (not b!66742))

(assert (not b!66735))

(assert (not b!66736))

(assert (not b!66739))

(assert (not b!66733))

(assert (not b!66744))

(assert (not start!13008))

(assert (not b!66747))

(assert (not b!66745))

(assert (not b!66751))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!21044 () Bool)

(assert (=> d!21044 (= (head!527 lt!106130) (h!823 lt!106130))))

(assert (=> b!66732 d!21044))

(declare-fun d!21046 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!21046 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1319 (buf!1700 thiss!1379))) ((_ sign_extend 32) (currentByte!3378 thiss!1379)) ((_ sign_extend 32) (currentBit!3373 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1319 (buf!1700 thiss!1379))) ((_ sign_extend 32) (currentByte!3378 thiss!1379)) ((_ sign_extend 32) (currentBit!3373 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5111 () Bool)

(assert (= bs!5111 d!21046))

(declare-fun m!106441 () Bool)

(assert (=> bs!5111 m!106441))

(assert (=> b!66743 d!21046))

(declare-fun d!21048 () Bool)

(assert (=> d!21048 (= (array_inv!1192 (buf!1700 thiss!1379)) (bvsge (size!1319 (buf!1700 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!66741 d!21048))

(declare-fun d!21050 () Bool)

(declare-fun e!43895 () Bool)

(assert (=> d!21050 e!43895))

(declare-fun res!55427 () Bool)

(assert (=> d!21050 (=> (not res!55427) (not e!43895))))

(declare-fun lt!106320 () (_ BitVec 64))

(declare-fun lt!106316 () (_ BitVec 64))

(declare-fun lt!106319 () (_ BitVec 64))

(assert (=> d!21050 (= res!55427 (= lt!106320 (bvsub lt!106316 lt!106319)))))

(assert (=> d!21050 (or (= (bvand lt!106316 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!106319 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!106316 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!106316 lt!106319) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21050 (= lt!106319 (remainingBits!0 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106142)))) ((_ sign_extend 32) (currentByte!3378 (_2!3057 lt!106142))) ((_ sign_extend 32) (currentBit!3373 (_2!3057 lt!106142)))))))

(declare-fun lt!106317 () (_ BitVec 64))

(declare-fun lt!106318 () (_ BitVec 64))

(assert (=> d!21050 (= lt!106316 (bvmul lt!106317 lt!106318))))

(assert (=> d!21050 (or (= lt!106317 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!106318 (bvsdiv (bvmul lt!106317 lt!106318) lt!106317)))))

(assert (=> d!21050 (= lt!106318 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21050 (= lt!106317 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106142)))))))

(assert (=> d!21050 (= lt!106320 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3378 (_2!3057 lt!106142))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3373 (_2!3057 lt!106142)))))))

(assert (=> d!21050 (invariant!0 (currentBit!3373 (_2!3057 lt!106142)) (currentByte!3378 (_2!3057 lt!106142)) (size!1319 (buf!1700 (_2!3057 lt!106142))))))

(assert (=> d!21050 (= (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106142))) (currentByte!3378 (_2!3057 lt!106142)) (currentBit!3373 (_2!3057 lt!106142))) lt!106320)))

(declare-fun b!66903 () Bool)

(declare-fun res!55428 () Bool)

(assert (=> b!66903 (=> (not res!55428) (not e!43895))))

(assert (=> b!66903 (= res!55428 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!106320))))

(declare-fun b!66904 () Bool)

(declare-fun lt!106321 () (_ BitVec 64))

(assert (=> b!66904 (= e!43895 (bvsle lt!106320 (bvmul lt!106321 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!66904 (or (= lt!106321 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!106321 #b0000000000000000000000000000000000000000000000000000000000001000) lt!106321)))))

(assert (=> b!66904 (= lt!106321 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106142)))))))

(assert (= (and d!21050 res!55427) b!66903))

(assert (= (and b!66903 res!55428) b!66904))

(declare-fun m!106443 () Bool)

(assert (=> d!21050 m!106443))

(assert (=> d!21050 m!106205))

(assert (=> b!66742 d!21050))

(declare-fun d!21052 () Bool)

(declare-fun res!55437 () Bool)

(declare-fun e!43900 () Bool)

(assert (=> d!21052 (=> (not res!55437) (not e!43900))))

(assert (=> d!21052 (= res!55437 (= (size!1319 (buf!1700 thiss!1379)) (size!1319 (buf!1700 (_2!3057 lt!106142)))))))

(assert (=> d!21052 (= (isPrefixOf!0 thiss!1379 (_2!3057 lt!106142)) e!43900)))

(declare-fun b!66911 () Bool)

(declare-fun res!55435 () Bool)

(assert (=> b!66911 (=> (not res!55435) (not e!43900))))

(assert (=> b!66911 (= res!55435 (bvsle (bitIndex!0 (size!1319 (buf!1700 thiss!1379)) (currentByte!3378 thiss!1379) (currentBit!3373 thiss!1379)) (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106142))) (currentByte!3378 (_2!3057 lt!106142)) (currentBit!3373 (_2!3057 lt!106142)))))))

(declare-fun b!66912 () Bool)

(declare-fun e!43901 () Bool)

(assert (=> b!66912 (= e!43900 e!43901)))

(declare-fun res!55436 () Bool)

(assert (=> b!66912 (=> res!55436 e!43901)))

(assert (=> b!66912 (= res!55436 (= (size!1319 (buf!1700 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!66913 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2857 array!2857 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!66913 (= e!43901 (arrayBitRangesEq!0 (buf!1700 thiss!1379) (buf!1700 (_2!3057 lt!106142)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1319 (buf!1700 thiss!1379)) (currentByte!3378 thiss!1379) (currentBit!3373 thiss!1379))))))

(assert (= (and d!21052 res!55437) b!66911))

(assert (= (and b!66911 res!55435) b!66912))

(assert (= (and b!66912 (not res!55436)) b!66913))

(assert (=> b!66911 m!106151))

(assert (=> b!66911 m!106235))

(assert (=> b!66913 m!106151))

(assert (=> b!66913 m!106151))

(declare-fun m!106445 () Bool)

(assert (=> b!66913 m!106445))

(assert (=> b!66751 d!21052))

(declare-fun d!21054 () Bool)

(assert (=> d!21054 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106142)))) ((_ sign_extend 32) (currentByte!3378 (_2!3057 lt!106142))) ((_ sign_extend 32) (currentBit!3373 (_2!3057 lt!106142))) lt!106149) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106142)))) ((_ sign_extend 32) (currentByte!3378 (_2!3057 lt!106142))) ((_ sign_extend 32) (currentBit!3373 (_2!3057 lt!106142)))) lt!106149))))

(declare-fun bs!5112 () Bool)

(assert (= bs!5112 d!21054))

(assert (=> bs!5112 m!106443))

(assert (=> b!66751 d!21054))

(declare-fun d!21056 () Bool)

(declare-fun e!43904 () Bool)

(assert (=> d!21056 e!43904))

(declare-fun res!55440 () Bool)

(assert (=> d!21056 (=> (not res!55440) (not e!43904))))

(assert (=> d!21056 (= res!55440 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!106324 () Unit!4499)

(declare-fun choose!27 (BitStream!2266 BitStream!2266 (_ BitVec 64) (_ BitVec 64)) Unit!4499)

(assert (=> d!21056 (= lt!106324 (choose!27 thiss!1379 (_2!3057 lt!106142) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!21056 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!21056 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3057 lt!106142) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!106324)))

(declare-fun b!66916 () Bool)

(assert (=> b!66916 (= e!43904 (validate_offset_bits!1 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106142)))) ((_ sign_extend 32) (currentByte!3378 (_2!3057 lt!106142))) ((_ sign_extend 32) (currentBit!3373 (_2!3057 lt!106142))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!21056 res!55440) b!66916))

(declare-fun m!106447 () Bool)

(assert (=> d!21056 m!106447))

(declare-fun m!106449 () Bool)

(assert (=> b!66916 m!106449))

(assert (=> b!66751 d!21056))

(declare-fun b!66944 () Bool)

(declare-fun res!55470 () Bool)

(declare-fun e!43920 () Bool)

(assert (=> b!66944 (=> (not res!55470) (not e!43920))))

(declare-fun lt!106399 () (_ BitVec 64))

(declare-fun lt!106393 () tuple2!5892)

(declare-fun lt!106390 () (_ BitVec 64))

(assert (=> b!66944 (= res!55470 (= (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106393))) (currentByte!3378 (_2!3057 lt!106393)) (currentBit!3373 (_2!3057 lt!106393))) (bvadd lt!106390 lt!106399)))))

(assert (=> b!66944 (or (not (= (bvand lt!106390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!106399 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!106390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!106390 lt!106399) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66944 (= lt!106399 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!66944 (= lt!106390 (bitIndex!0 (size!1319 (buf!1700 thiss!1379)) (currentByte!3378 thiss!1379) (currentBit!3373 thiss!1379)))))

(declare-fun b!66945 () Bool)

(declare-fun e!43919 () Bool)

(assert (=> b!66945 (= e!43920 e!43919)))

(declare-fun res!55464 () Bool)

(assert (=> b!66945 (=> (not res!55464) (not e!43919))))

(declare-datatypes ((tuple2!5912 0))(
  ( (tuple2!5913 (_1!3067 BitStream!2266) (_2!3067 Bool)) )
))
(declare-fun lt!106397 () tuple2!5912)

(declare-fun lt!106391 () (_ BitVec 8))

(assert (=> b!66945 (= res!55464 (and (= (_2!3067 lt!106397) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1886 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!106391)) #b00000000000000000000000000000000))) (= (_1!3067 lt!106397) (_2!3057 lt!106393))))))

(declare-datatypes ((tuple2!5914 0))(
  ( (tuple2!5915 (_1!3068 array!2857) (_2!3068 BitStream!2266)) )
))
(declare-fun lt!106400 () tuple2!5914)

(declare-fun lt!106398 () BitStream!2266)

(declare-fun readBits!0 (BitStream!2266 (_ BitVec 64)) tuple2!5914)

(assert (=> b!66945 (= lt!106400 (readBits!0 lt!106398 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2266) tuple2!5912)

(assert (=> b!66945 (= lt!106397 (readBitPure!0 lt!106398))))

(declare-fun readerFrom!0 (BitStream!2266 (_ BitVec 32) (_ BitVec 32)) BitStream!2266)

(assert (=> b!66945 (= lt!106398 (readerFrom!0 (_2!3057 lt!106393) (currentBit!3373 thiss!1379) (currentByte!3378 thiss!1379)))))

(declare-fun b!66946 () Bool)

(declare-fun e!43918 () Bool)

(declare-fun lt!106389 () tuple2!5912)

(declare-fun lt!106392 () tuple2!5892)

(assert (=> b!66946 (= e!43918 (= (bitIndex!0 (size!1319 (buf!1700 (_1!3067 lt!106389))) (currentByte!3378 (_1!3067 lt!106389)) (currentBit!3373 (_1!3067 lt!106389))) (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106392))) (currentByte!3378 (_2!3057 lt!106392)) (currentBit!3373 (_2!3057 lt!106392)))))))

(declare-fun b!66947 () Bool)

(assert (=> b!66947 (= e!43919 (= (bitIndex!0 (size!1319 (buf!1700 (_1!3067 lt!106397))) (currentByte!3378 (_1!3067 lt!106397)) (currentBit!3373 (_1!3067 lt!106397))) (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106393))) (currentByte!3378 (_2!3057 lt!106393)) (currentBit!3373 (_2!3057 lt!106393)))))))

(declare-fun b!66948 () Bool)

(declare-fun res!55468 () Bool)

(declare-fun e!43917 () Bool)

(assert (=> b!66948 (=> (not res!55468) (not e!43917))))

(assert (=> b!66948 (= res!55468 (isPrefixOf!0 thiss!1379 (_2!3057 lt!106392)))))

(declare-fun b!66949 () Bool)

(declare-fun res!55466 () Bool)

(assert (=> b!66949 (=> (not res!55466) (not e!43917))))

(assert (=> b!66949 (= res!55466 (= (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106392))) (currentByte!3378 (_2!3057 lt!106392)) (currentBit!3373 (_2!3057 lt!106392))) (bvadd (bitIndex!0 (size!1319 (buf!1700 thiss!1379)) (currentByte!3378 thiss!1379) (currentBit!3373 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!21058 () Bool)

(assert (=> d!21058 e!43920))

(declare-fun res!55465 () Bool)

(assert (=> d!21058 (=> (not res!55465) (not e!43920))))

(assert (=> d!21058 (= res!55465 (= (size!1319 (buf!1700 (_2!3057 lt!106393))) (size!1319 (buf!1700 thiss!1379))))))

(declare-fun lt!106396 () array!2857)

(assert (=> d!21058 (= lt!106391 (select (arr!1886 lt!106396) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!21058 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1319 lt!106396)))))

(assert (=> d!21058 (= lt!106396 (array!2858 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!106395 () tuple2!5892)

(assert (=> d!21058 (= lt!106393 (tuple2!5893 (_1!3057 lt!106395) (_2!3057 lt!106395)))))

(assert (=> d!21058 (= lt!106395 lt!106392)))

(assert (=> d!21058 e!43917))

(declare-fun res!55469 () Bool)

(assert (=> d!21058 (=> (not res!55469) (not e!43917))))

(assert (=> d!21058 (= res!55469 (= (size!1319 (buf!1700 thiss!1379)) (size!1319 (buf!1700 (_2!3057 lt!106392)))))))

(declare-fun lt!106394 () Bool)

(declare-fun appendBit!0 (BitStream!2266 Bool) tuple2!5892)

(assert (=> d!21058 (= lt!106392 (appendBit!0 thiss!1379 lt!106394))))

(assert (=> d!21058 (= lt!106394 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1886 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!21058 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!21058 (= (appendBitFromByte!0 thiss!1379 (select (arr!1886 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!106393)))

(declare-fun b!66950 () Bool)

(declare-fun res!55467 () Bool)

(assert (=> b!66950 (=> (not res!55467) (not e!43920))))

(assert (=> b!66950 (= res!55467 (isPrefixOf!0 thiss!1379 (_2!3057 lt!106393)))))

(declare-fun b!66951 () Bool)

(assert (=> b!66951 (= e!43917 e!43918)))

(declare-fun res!55463 () Bool)

(assert (=> b!66951 (=> (not res!55463) (not e!43918))))

(assert (=> b!66951 (= res!55463 (and (= (_2!3067 lt!106389) lt!106394) (= (_1!3067 lt!106389) (_2!3057 lt!106392))))))

(assert (=> b!66951 (= lt!106389 (readBitPure!0 (readerFrom!0 (_2!3057 lt!106392) (currentBit!3373 thiss!1379) (currentByte!3378 thiss!1379))))))

(assert (= (and d!21058 res!55469) b!66949))

(assert (= (and b!66949 res!55466) b!66948))

(assert (= (and b!66948 res!55468) b!66951))

(assert (= (and b!66951 res!55463) b!66946))

(assert (= (and d!21058 res!55465) b!66944))

(assert (= (and b!66944 res!55470) b!66950))

(assert (= (and b!66950 res!55467) b!66945))

(assert (= (and b!66945 res!55464) b!66947))

(declare-fun m!106453 () Bool)

(assert (=> b!66951 m!106453))

(assert (=> b!66951 m!106453))

(declare-fun m!106455 () Bool)

(assert (=> b!66951 m!106455))

(declare-fun m!106457 () Bool)

(assert (=> b!66945 m!106457))

(declare-fun m!106459 () Bool)

(assert (=> b!66945 m!106459))

(declare-fun m!106461 () Bool)

(assert (=> b!66945 m!106461))

(declare-fun m!106463 () Bool)

(assert (=> b!66949 m!106463))

(assert (=> b!66949 m!106151))

(declare-fun m!106465 () Bool)

(assert (=> b!66944 m!106465))

(assert (=> b!66944 m!106151))

(declare-fun m!106467 () Bool)

(assert (=> b!66947 m!106467))

(assert (=> b!66947 m!106465))

(declare-fun m!106469 () Bool)

(assert (=> b!66950 m!106469))

(declare-fun m!106471 () Bool)

(assert (=> d!21058 m!106471))

(declare-fun m!106473 () Bool)

(assert (=> d!21058 m!106473))

(declare-fun m!106475 () Bool)

(assert (=> d!21058 m!106475))

(declare-fun m!106477 () Bool)

(assert (=> b!66946 m!106477))

(assert (=> b!66946 m!106463))

(declare-fun m!106479 () Bool)

(assert (=> b!66948 m!106479))

(assert (=> b!66751 d!21058))

(declare-fun d!21072 () Bool)

(declare-fun res!55476 () Bool)

(declare-fun e!43923 () Bool)

(assert (=> d!21072 (=> (not res!55476) (not e!43923))))

(assert (=> d!21072 (= res!55476 (= (size!1319 (buf!1700 thiss!1379)) (size!1319 (buf!1700 thiss!1379))))))

(assert (=> d!21072 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!43923)))

(declare-fun b!66957 () Bool)

(declare-fun res!55474 () Bool)

(assert (=> b!66957 (=> (not res!55474) (not e!43923))))

(assert (=> b!66957 (= res!55474 (bvsle (bitIndex!0 (size!1319 (buf!1700 thiss!1379)) (currentByte!3378 thiss!1379) (currentBit!3373 thiss!1379)) (bitIndex!0 (size!1319 (buf!1700 thiss!1379)) (currentByte!3378 thiss!1379) (currentBit!3373 thiss!1379))))))

(declare-fun b!66958 () Bool)

(declare-fun e!43924 () Bool)

(assert (=> b!66958 (= e!43923 e!43924)))

(declare-fun res!55475 () Bool)

(assert (=> b!66958 (=> res!55475 e!43924)))

(assert (=> b!66958 (= res!55475 (= (size!1319 (buf!1700 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!66959 () Bool)

(assert (=> b!66959 (= e!43924 (arrayBitRangesEq!0 (buf!1700 thiss!1379) (buf!1700 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1319 (buf!1700 thiss!1379)) (currentByte!3378 thiss!1379) (currentBit!3373 thiss!1379))))))

(assert (= (and d!21072 res!55476) b!66957))

(assert (= (and b!66957 res!55474) b!66958))

(assert (= (and b!66958 (not res!55475)) b!66959))

(assert (=> b!66957 m!106151))

(assert (=> b!66957 m!106151))

(assert (=> b!66959 m!106151))

(assert (=> b!66959 m!106151))

(declare-fun m!106483 () Bool)

(assert (=> b!66959 m!106483))

(assert (=> b!66749 d!21072))

(declare-fun d!21074 () Bool)

(assert (=> d!21074 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!106423 () Unit!4499)

(declare-fun choose!11 (BitStream!2266) Unit!4499)

(assert (=> d!21074 (= lt!106423 (choose!11 thiss!1379))))

(assert (=> d!21074 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!106423)))

(declare-fun bs!5115 () Bool)

(assert (= bs!5115 d!21074))

(assert (=> bs!5115 m!106147))

(declare-fun m!106509 () Bool)

(assert (=> bs!5115 m!106509))

(assert (=> b!66749 d!21074))

(declare-fun d!21078 () Bool)

(declare-fun e!43925 () Bool)

(assert (=> d!21078 e!43925))

(declare-fun res!55477 () Bool)

(assert (=> d!21078 (=> (not res!55477) (not e!43925))))

(declare-fun lt!106428 () (_ BitVec 64))

(declare-fun lt!106424 () (_ BitVec 64))

(declare-fun lt!106427 () (_ BitVec 64))

(assert (=> d!21078 (= res!55477 (= lt!106428 (bvsub lt!106424 lt!106427)))))

(assert (=> d!21078 (or (= (bvand lt!106424 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!106427 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!106424 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!106424 lt!106427) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21078 (= lt!106427 (remainingBits!0 ((_ sign_extend 32) (size!1319 (buf!1700 thiss!1379))) ((_ sign_extend 32) (currentByte!3378 thiss!1379)) ((_ sign_extend 32) (currentBit!3373 thiss!1379))))))

(declare-fun lt!106425 () (_ BitVec 64))

(declare-fun lt!106426 () (_ BitVec 64))

(assert (=> d!21078 (= lt!106424 (bvmul lt!106425 lt!106426))))

(assert (=> d!21078 (or (= lt!106425 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!106426 (bvsdiv (bvmul lt!106425 lt!106426) lt!106425)))))

(assert (=> d!21078 (= lt!106426 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21078 (= lt!106425 ((_ sign_extend 32) (size!1319 (buf!1700 thiss!1379))))))

(assert (=> d!21078 (= lt!106428 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3378 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3373 thiss!1379))))))

(assert (=> d!21078 (invariant!0 (currentBit!3373 thiss!1379) (currentByte!3378 thiss!1379) (size!1319 (buf!1700 thiss!1379)))))

(assert (=> d!21078 (= (bitIndex!0 (size!1319 (buf!1700 thiss!1379)) (currentByte!3378 thiss!1379) (currentBit!3373 thiss!1379)) lt!106428)))

(declare-fun b!66960 () Bool)

(declare-fun res!55478 () Bool)

(assert (=> b!66960 (=> (not res!55478) (not e!43925))))

(assert (=> b!66960 (= res!55478 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!106428))))

(declare-fun b!66961 () Bool)

(declare-fun lt!106429 () (_ BitVec 64))

(assert (=> b!66961 (= e!43925 (bvsle lt!106428 (bvmul lt!106429 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!66961 (or (= lt!106429 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!106429 #b0000000000000000000000000000000000000000000000000000000000001000) lt!106429)))))

(assert (=> b!66961 (= lt!106429 ((_ sign_extend 32) (size!1319 (buf!1700 thiss!1379))))))

(assert (= (and d!21078 res!55477) b!66960))

(assert (= (and b!66960 res!55478) b!66961))

(assert (=> d!21078 m!106441))

(declare-fun m!106511 () Bool)

(assert (=> d!21078 m!106511))

(assert (=> b!66749 d!21078))

(declare-fun d!21080 () Bool)

(declare-fun e!43926 () Bool)

(assert (=> d!21080 e!43926))

(declare-fun res!55479 () Bool)

(assert (=> d!21080 (=> (not res!55479) (not e!43926))))

(declare-fun lt!106433 () (_ BitVec 64))

(declare-fun lt!106430 () (_ BitVec 64))

(declare-fun lt!106434 () (_ BitVec 64))

(assert (=> d!21080 (= res!55479 (= lt!106434 (bvsub lt!106430 lt!106433)))))

(assert (=> d!21080 (or (= (bvand lt!106430 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!106433 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!106430 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!106430 lt!106433) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21080 (= lt!106433 (remainingBits!0 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106131)))) ((_ sign_extend 32) (currentByte!3378 (_2!3057 lt!106131))) ((_ sign_extend 32) (currentBit!3373 (_2!3057 lt!106131)))))))

(declare-fun lt!106431 () (_ BitVec 64))

(declare-fun lt!106432 () (_ BitVec 64))

(assert (=> d!21080 (= lt!106430 (bvmul lt!106431 lt!106432))))

(assert (=> d!21080 (or (= lt!106431 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!106432 (bvsdiv (bvmul lt!106431 lt!106432) lt!106431)))))

(assert (=> d!21080 (= lt!106432 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21080 (= lt!106431 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106131)))))))

(assert (=> d!21080 (= lt!106434 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3378 (_2!3057 lt!106131))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3373 (_2!3057 lt!106131)))))))

(assert (=> d!21080 (invariant!0 (currentBit!3373 (_2!3057 lt!106131)) (currentByte!3378 (_2!3057 lt!106131)) (size!1319 (buf!1700 (_2!3057 lt!106131))))))

(assert (=> d!21080 (= (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106131))) (currentByte!3378 (_2!3057 lt!106131)) (currentBit!3373 (_2!3057 lt!106131))) lt!106434)))

(declare-fun b!66962 () Bool)

(declare-fun res!55480 () Bool)

(assert (=> b!66962 (=> (not res!55480) (not e!43926))))

(assert (=> b!66962 (= res!55480 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!106434))))

(declare-fun b!66963 () Bool)

(declare-fun lt!106435 () (_ BitVec 64))

(assert (=> b!66963 (= e!43926 (bvsle lt!106434 (bvmul lt!106435 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!66963 (or (= lt!106435 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!106435 #b0000000000000000000000000000000000000000000000000000000000001000) lt!106435)))))

(assert (=> b!66963 (= lt!106435 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106131)))))))

(assert (= (and d!21080 res!55479) b!66962))

(assert (= (and b!66962 res!55480) b!66963))

(declare-fun m!106513 () Bool)

(assert (=> d!21080 m!106513))

(assert (=> d!21080 m!106161))

(assert (=> b!66750 d!21080))

(declare-fun d!21082 () Bool)

(declare-fun res!55483 () Bool)

(declare-fun e!43927 () Bool)

(assert (=> d!21082 (=> (not res!55483) (not e!43927))))

(assert (=> d!21082 (= res!55483 (= (size!1319 (buf!1700 (_2!3057 lt!106142))) (size!1319 (buf!1700 (_2!3057 lt!106131)))))))

(assert (=> d!21082 (= (isPrefixOf!0 (_2!3057 lt!106142) (_2!3057 lt!106131)) e!43927)))

(declare-fun b!66964 () Bool)

(declare-fun res!55481 () Bool)

(assert (=> b!66964 (=> (not res!55481) (not e!43927))))

(assert (=> b!66964 (= res!55481 (bvsle (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106142))) (currentByte!3378 (_2!3057 lt!106142)) (currentBit!3373 (_2!3057 lt!106142))) (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106131))) (currentByte!3378 (_2!3057 lt!106131)) (currentBit!3373 (_2!3057 lt!106131)))))))

(declare-fun b!66965 () Bool)

(declare-fun e!43928 () Bool)

(assert (=> b!66965 (= e!43927 e!43928)))

(declare-fun res!55482 () Bool)

(assert (=> b!66965 (=> res!55482 e!43928)))

(assert (=> b!66965 (= res!55482 (= (size!1319 (buf!1700 (_2!3057 lt!106142))) #b00000000000000000000000000000000))))

(declare-fun b!66966 () Bool)

(assert (=> b!66966 (= e!43928 (arrayBitRangesEq!0 (buf!1700 (_2!3057 lt!106142)) (buf!1700 (_2!3057 lt!106131)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106142))) (currentByte!3378 (_2!3057 lt!106142)) (currentBit!3373 (_2!3057 lt!106142)))))))

(assert (= (and d!21082 res!55483) b!66964))

(assert (= (and b!66964 res!55481) b!66965))

(assert (= (and b!66965 (not res!55482)) b!66966))

(assert (=> b!66964 m!106235))

(assert (=> b!66964 m!106229))

(assert (=> b!66966 m!106235))

(assert (=> b!66966 m!106235))

(declare-fun m!106515 () Bool)

(assert (=> b!66966 m!106515))

(assert (=> b!66739 d!21082))

(declare-fun d!21084 () Bool)

(assert (=> d!21084 (isPrefixOf!0 thiss!1379 (_2!3057 lt!106131))))

(declare-fun lt!106438 () Unit!4499)

(declare-fun choose!30 (BitStream!2266 BitStream!2266 BitStream!2266) Unit!4499)

(assert (=> d!21084 (= lt!106438 (choose!30 thiss!1379 (_2!3057 lt!106142) (_2!3057 lt!106131)))))

(assert (=> d!21084 (isPrefixOf!0 thiss!1379 (_2!3057 lt!106142))))

(assert (=> d!21084 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3057 lt!106142) (_2!3057 lt!106131)) lt!106438)))

(declare-fun bs!5116 () Bool)

(assert (= bs!5116 d!21084))

(assert (=> bs!5116 m!106193))

(declare-fun m!106517 () Bool)

(assert (=> bs!5116 m!106517))

(assert (=> bs!5116 m!106179))

(assert (=> b!66739 d!21084))

(declare-fun d!21086 () Bool)

(assert (=> d!21086 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106142)))) ((_ sign_extend 32) (currentByte!3378 thiss!1379)) ((_ sign_extend 32) (currentBit!3373 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106142)))) ((_ sign_extend 32) (currentByte!3378 thiss!1379)) ((_ sign_extend 32) (currentBit!3373 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5117 () Bool)

(assert (= bs!5117 d!21086))

(declare-fun m!106519 () Bool)

(assert (=> bs!5117 m!106519))

(assert (=> b!66739 d!21086))

(declare-fun d!21088 () Bool)

(declare-fun res!55486 () Bool)

(declare-fun e!43929 () Bool)

(assert (=> d!21088 (=> (not res!55486) (not e!43929))))

(assert (=> d!21088 (= res!55486 (= (size!1319 (buf!1700 thiss!1379)) (size!1319 (buf!1700 (_2!3057 lt!106131)))))))

(assert (=> d!21088 (= (isPrefixOf!0 thiss!1379 (_2!3057 lt!106131)) e!43929)))

(declare-fun b!66967 () Bool)

(declare-fun res!55484 () Bool)

(assert (=> b!66967 (=> (not res!55484) (not e!43929))))

(assert (=> b!66967 (= res!55484 (bvsle (bitIndex!0 (size!1319 (buf!1700 thiss!1379)) (currentByte!3378 thiss!1379) (currentBit!3373 thiss!1379)) (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106131))) (currentByte!3378 (_2!3057 lt!106131)) (currentBit!3373 (_2!3057 lt!106131)))))))

(declare-fun b!66968 () Bool)

(declare-fun e!43930 () Bool)

(assert (=> b!66968 (= e!43929 e!43930)))

(declare-fun res!55485 () Bool)

(assert (=> b!66968 (=> res!55485 e!43930)))

(assert (=> b!66968 (= res!55485 (= (size!1319 (buf!1700 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!66969 () Bool)

(assert (=> b!66969 (= e!43930 (arrayBitRangesEq!0 (buf!1700 thiss!1379) (buf!1700 (_2!3057 lt!106131)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1319 (buf!1700 thiss!1379)) (currentByte!3378 thiss!1379) (currentBit!3373 thiss!1379))))))

(assert (= (and d!21088 res!55486) b!66967))

(assert (= (and b!66967 res!55484) b!66968))

(assert (= (and b!66968 (not res!55485)) b!66969))

(assert (=> b!66967 m!106151))

(assert (=> b!66967 m!106229))

(assert (=> b!66969 m!106151))

(assert (=> b!66969 m!106151))

(declare-fun m!106521 () Bool)

(assert (=> b!66969 m!106521))

(assert (=> b!66739 d!21088))

(declare-fun e!43998 () Bool)

(declare-fun lt!106943 () tuple2!5892)

(declare-fun b!67111 () Bool)

(declare-fun lt!106949 () tuple2!5894)

(assert (=> b!67111 (= e!43998 (= (bitStreamReadBitsIntoList!0 (_2!3057 lt!106943) (_1!3058 lt!106949) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3057 lt!106943) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!67111 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67111 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!106939 () Unit!4499)

(declare-fun lt!106957 () Unit!4499)

(assert (=> b!67111 (= lt!106939 lt!106957)))

(declare-fun lt!106942 () (_ BitVec 64))

(assert (=> b!67111 (validate_offset_bits!1 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106943)))) ((_ sign_extend 32) (currentByte!3378 (_2!3057 lt!106142))) ((_ sign_extend 32) (currentBit!3373 (_2!3057 lt!106142))) lt!106942)))

(assert (=> b!67111 (= lt!106957 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3057 lt!106142) (buf!1700 (_2!3057 lt!106943)) lt!106942))))

(declare-fun e!43997 () Bool)

(assert (=> b!67111 e!43997))

(declare-fun res!55598 () Bool)

(assert (=> b!67111 (=> (not res!55598) (not e!43997))))

(assert (=> b!67111 (= res!55598 (and (= (size!1319 (buf!1700 (_2!3057 lt!106142))) (size!1319 (buf!1700 (_2!3057 lt!106943)))) (bvsge lt!106942 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67111 (= lt!106942 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!67111 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67111 (= lt!106949 (reader!0 (_2!3057 lt!106142) (_2!3057 lt!106943)))))

(declare-fun d!21090 () Bool)

(assert (=> d!21090 e!43998))

(declare-fun res!55596 () Bool)

(assert (=> d!21090 (=> (not res!55596) (not e!43998))))

(declare-fun lt!106945 () (_ BitVec 64))

(assert (=> d!21090 (= res!55596 (= (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106943))) (currentByte!3378 (_2!3057 lt!106943)) (currentBit!3373 (_2!3057 lt!106943))) (bvsub lt!106945 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!21090 (or (= (bvand lt!106945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!106945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!106945 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!106974 () (_ BitVec 64))

(assert (=> d!21090 (= lt!106945 (bvadd lt!106974 to!314))))

(assert (=> d!21090 (or (not (= (bvand lt!106974 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!106974 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!106974 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21090 (= lt!106974 (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106142))) (currentByte!3378 (_2!3057 lt!106142)) (currentBit!3373 (_2!3057 lt!106142))))))

(declare-fun e!43996 () tuple2!5892)

(assert (=> d!21090 (= lt!106943 e!43996)))

(declare-fun c!4890 () Bool)

(assert (=> d!21090 (= c!4890 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!106968 () Unit!4499)

(declare-fun lt!106969 () Unit!4499)

(assert (=> d!21090 (= lt!106968 lt!106969)))

(assert (=> d!21090 (isPrefixOf!0 (_2!3057 lt!106142) (_2!3057 lt!106142))))

(assert (=> d!21090 (= lt!106969 (lemmaIsPrefixRefl!0 (_2!3057 lt!106142)))))

(declare-fun lt!106967 () (_ BitVec 64))

(assert (=> d!21090 (= lt!106967 (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106142))) (currentByte!3378 (_2!3057 lt!106142)) (currentBit!3373 (_2!3057 lt!106142))))))

(assert (=> d!21090 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21090 (= (appendBitsMSBFirstLoop!0 (_2!3057 lt!106142) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!106943)))

(declare-fun b!67112 () Bool)

(declare-fun lt!106972 () tuple2!5892)

(declare-fun Unit!4515 () Unit!4499)

(assert (=> b!67112 (= e!43996 (tuple2!5893 Unit!4515 (_2!3057 lt!106972)))))

(declare-fun lt!106966 () tuple2!5892)

(assert (=> b!67112 (= lt!106966 (appendBitFromByte!0 (_2!3057 lt!106142) (select (arr!1886 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!106959 () (_ BitVec 64))

(assert (=> b!67112 (= lt!106959 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!106941 () (_ BitVec 64))

(assert (=> b!67112 (= lt!106941 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!106938 () Unit!4499)

(assert (=> b!67112 (= lt!106938 (validateOffsetBitsIneqLemma!0 (_2!3057 lt!106142) (_2!3057 lt!106966) lt!106959 lt!106941))))

(assert (=> b!67112 (validate_offset_bits!1 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106966)))) ((_ sign_extend 32) (currentByte!3378 (_2!3057 lt!106966))) ((_ sign_extend 32) (currentBit!3373 (_2!3057 lt!106966))) (bvsub lt!106959 lt!106941))))

(declare-fun lt!106947 () Unit!4499)

(assert (=> b!67112 (= lt!106947 lt!106938)))

(declare-fun lt!106975 () tuple2!5894)

(assert (=> b!67112 (= lt!106975 (reader!0 (_2!3057 lt!106142) (_2!3057 lt!106966)))))

(declare-fun lt!106948 () (_ BitVec 64))

(assert (=> b!67112 (= lt!106948 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!106952 () Unit!4499)

(assert (=> b!67112 (= lt!106952 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3057 lt!106142) (buf!1700 (_2!3057 lt!106966)) lt!106948))))

(assert (=> b!67112 (validate_offset_bits!1 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106966)))) ((_ sign_extend 32) (currentByte!3378 (_2!3057 lt!106142))) ((_ sign_extend 32) (currentBit!3373 (_2!3057 lt!106142))) lt!106948)))

(declare-fun lt!106946 () Unit!4499)

(assert (=> b!67112 (= lt!106946 lt!106952)))

(assert (=> b!67112 (= (head!527 (byteArrayBitContentToList!0 (_2!3057 lt!106966) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!527 (bitStreamReadBitsIntoList!0 (_2!3057 lt!106966) (_1!3058 lt!106975) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!106953 () Unit!4499)

(declare-fun Unit!4516 () Unit!4499)

(assert (=> b!67112 (= lt!106953 Unit!4516)))

(assert (=> b!67112 (= lt!106972 (appendBitsMSBFirstLoop!0 (_2!3057 lt!106966) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!106971 () Unit!4499)

(assert (=> b!67112 (= lt!106971 (lemmaIsPrefixTransitive!0 (_2!3057 lt!106142) (_2!3057 lt!106966) (_2!3057 lt!106972)))))

(assert (=> b!67112 (isPrefixOf!0 (_2!3057 lt!106142) (_2!3057 lt!106972))))

(declare-fun lt!106944 () Unit!4499)

(assert (=> b!67112 (= lt!106944 lt!106971)))

(assert (=> b!67112 (= (size!1319 (buf!1700 (_2!3057 lt!106972))) (size!1319 (buf!1700 (_2!3057 lt!106142))))))

(declare-fun lt!106954 () Unit!4499)

(declare-fun Unit!4517 () Unit!4499)

(assert (=> b!67112 (= lt!106954 Unit!4517)))

(assert (=> b!67112 (= (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106972))) (currentByte!3378 (_2!3057 lt!106972)) (currentBit!3373 (_2!3057 lt!106972))) (bvsub (bvadd (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106142))) (currentByte!3378 (_2!3057 lt!106142)) (currentBit!3373 (_2!3057 lt!106142))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!106956 () Unit!4499)

(declare-fun Unit!4518 () Unit!4499)

(assert (=> b!67112 (= lt!106956 Unit!4518)))

(assert (=> b!67112 (= (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106972))) (currentByte!3378 (_2!3057 lt!106972)) (currentBit!3373 (_2!3057 lt!106972))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106966))) (currentByte!3378 (_2!3057 lt!106966)) (currentBit!3373 (_2!3057 lt!106966))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!106961 () Unit!4499)

(declare-fun Unit!4519 () Unit!4499)

(assert (=> b!67112 (= lt!106961 Unit!4519)))

(declare-fun lt!106937 () tuple2!5894)

(assert (=> b!67112 (= lt!106937 (reader!0 (_2!3057 lt!106142) (_2!3057 lt!106972)))))

(declare-fun lt!106963 () (_ BitVec 64))

(assert (=> b!67112 (= lt!106963 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!106958 () Unit!4499)

(assert (=> b!67112 (= lt!106958 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3057 lt!106142) (buf!1700 (_2!3057 lt!106972)) lt!106963))))

(assert (=> b!67112 (validate_offset_bits!1 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106972)))) ((_ sign_extend 32) (currentByte!3378 (_2!3057 lt!106142))) ((_ sign_extend 32) (currentBit!3373 (_2!3057 lt!106142))) lt!106963)))

(declare-fun lt!106976 () Unit!4499)

(assert (=> b!67112 (= lt!106976 lt!106958)))

(declare-fun lt!106950 () tuple2!5894)

(declare-fun call!861 () tuple2!5894)

(assert (=> b!67112 (= lt!106950 call!861)))

(declare-fun lt!106934 () (_ BitVec 64))

(assert (=> b!67112 (= lt!106934 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!106964 () Unit!4499)

(assert (=> b!67112 (= lt!106964 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3057 lt!106966) (buf!1700 (_2!3057 lt!106972)) lt!106934))))

(assert (=> b!67112 (validate_offset_bits!1 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106972)))) ((_ sign_extend 32) (currentByte!3378 (_2!3057 lt!106966))) ((_ sign_extend 32) (currentBit!3373 (_2!3057 lt!106966))) lt!106934)))

(declare-fun lt!106955 () Unit!4499)

(assert (=> b!67112 (= lt!106955 lt!106964)))

(declare-fun lt!106951 () List!708)

(assert (=> b!67112 (= lt!106951 (byteArrayBitContentToList!0 (_2!3057 lt!106972) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!106960 () List!708)

(assert (=> b!67112 (= lt!106960 (byteArrayBitContentToList!0 (_2!3057 lt!106972) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!106965 () List!708)

(assert (=> b!67112 (= lt!106965 (bitStreamReadBitsIntoList!0 (_2!3057 lt!106972) (_1!3058 lt!106937) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!106970 () List!708)

(assert (=> b!67112 (= lt!106970 (bitStreamReadBitsIntoList!0 (_2!3057 lt!106972) (_1!3058 lt!106950) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!106936 () (_ BitVec 64))

(assert (=> b!67112 (= lt!106936 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!106973 () Unit!4499)

(assert (=> b!67112 (= lt!106973 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3057 lt!106972) (_2!3057 lt!106972) (_1!3058 lt!106937) (_1!3058 lt!106950) lt!106936 lt!106965))))

(assert (=> b!67112 (= (bitStreamReadBitsIntoList!0 (_2!3057 lt!106972) (_1!3058 lt!106950) (bvsub lt!106936 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!312 lt!106965))))

(declare-fun lt!106962 () Unit!4499)

(assert (=> b!67112 (= lt!106962 lt!106973)))

(declare-fun lt!106940 () Unit!4499)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2857 array!2857 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4499)

(assert (=> b!67112 (= lt!106940 (arrayBitRangesEqImpliesEq!0 (buf!1700 (_2!3057 lt!106966)) (buf!1700 (_2!3057 lt!106972)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!106967 (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106966))) (currentByte!3378 (_2!3057 lt!106966)) (currentBit!3373 (_2!3057 lt!106966)))))))

(assert (=> b!67112 (= (bitAt!0 (buf!1700 (_2!3057 lt!106966)) lt!106967) (bitAt!0 (buf!1700 (_2!3057 lt!106972)) lt!106967))))

(declare-fun lt!106935 () Unit!4499)

(assert (=> b!67112 (= lt!106935 lt!106940)))

(declare-fun b!67113 () Bool)

(declare-fun res!55593 () Bool)

(assert (=> b!67113 (=> (not res!55593) (not e!43998))))

(assert (=> b!67113 (= res!55593 (isPrefixOf!0 (_2!3057 lt!106142) (_2!3057 lt!106943)))))

(declare-fun b!67114 () Bool)

(declare-fun res!55597 () Bool)

(assert (=> b!67114 (=> (not res!55597) (not e!43998))))

(assert (=> b!67114 (= res!55597 (= (size!1319 (buf!1700 (_2!3057 lt!106142))) (size!1319 (buf!1700 (_2!3057 lt!106943)))))))

(declare-fun b!67115 () Bool)

(assert (=> b!67115 (= e!43997 (validate_offset_bits!1 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106142)))) ((_ sign_extend 32) (currentByte!3378 (_2!3057 lt!106142))) ((_ sign_extend 32) (currentBit!3373 (_2!3057 lt!106142))) lt!106942))))

(declare-fun b!67116 () Bool)

(declare-fun Unit!4520 () Unit!4499)

(assert (=> b!67116 (= e!43996 (tuple2!5893 Unit!4520 (_2!3057 lt!106142)))))

(assert (=> b!67116 (= (size!1319 (buf!1700 (_2!3057 lt!106142))) (size!1319 (buf!1700 (_2!3057 lt!106142))))))

(declare-fun lt!106933 () Unit!4499)

(declare-fun Unit!4521 () Unit!4499)

(assert (=> b!67116 (= lt!106933 Unit!4521)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2266 array!2857 array!2857 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!67116 (checkByteArrayBitContent!0 (_2!3057 lt!106142) srcBuffer!2 (_1!3068 (readBits!0 (_1!3058 call!861) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!67117 () Bool)

(declare-fun res!55594 () Bool)

(assert (=> b!67117 (=> (not res!55594) (not e!43998))))

(assert (=> b!67117 (= res!55594 (invariant!0 (currentBit!3373 (_2!3057 lt!106943)) (currentByte!3378 (_2!3057 lt!106943)) (size!1319 (buf!1700 (_2!3057 lt!106943)))))))

(declare-fun bm!858 () Bool)

(assert (=> bm!858 (= call!861 (reader!0 (ite c!4890 (_2!3057 lt!106966) (_2!3057 lt!106142)) (ite c!4890 (_2!3057 lt!106972) (_2!3057 lt!106142))))))

(declare-fun b!67118 () Bool)

(declare-fun res!55595 () Bool)

(assert (=> b!67118 (=> (not res!55595) (not e!43998))))

(assert (=> b!67118 (= res!55595 (= (size!1319 (buf!1700 (_2!3057 lt!106943))) (size!1319 (buf!1700 (_2!3057 lt!106142)))))))

(assert (= (and d!21090 c!4890) b!67112))

(assert (= (and d!21090 (not c!4890)) b!67116))

(assert (= (or b!67112 b!67116) bm!858))

(assert (= (and d!21090 res!55596) b!67117))

(assert (= (and b!67117 res!55594) b!67114))

(assert (= (and b!67114 res!55597) b!67113))

(assert (= (and b!67113 res!55593) b!67118))

(assert (= (and b!67118 res!55595) b!67111))

(assert (= (and b!67111 res!55598) b!67115))

(declare-fun m!106771 () Bool)

(assert (=> b!67117 m!106771))

(declare-fun m!106773 () Bool)

(assert (=> b!67116 m!106773))

(declare-fun m!106775 () Bool)

(assert (=> b!67116 m!106775))

(declare-fun m!106777 () Bool)

(assert (=> bm!858 m!106777))

(declare-fun m!106779 () Bool)

(assert (=> d!21090 m!106779))

(assert (=> d!21090 m!106235))

(declare-fun m!106781 () Bool)

(assert (=> d!21090 m!106781))

(declare-fun m!106783 () Bool)

(assert (=> d!21090 m!106783))

(declare-fun m!106785 () Bool)

(assert (=> b!67115 m!106785))

(declare-fun m!106787 () Bool)

(assert (=> b!67112 m!106787))

(declare-fun m!106789 () Bool)

(assert (=> b!67112 m!106789))

(declare-fun m!106791 () Bool)

(assert (=> b!67112 m!106791))

(declare-fun m!106793 () Bool)

(assert (=> b!67112 m!106793))

(declare-fun m!106795 () Bool)

(assert (=> b!67112 m!106795))

(declare-fun m!106797 () Bool)

(assert (=> b!67112 m!106797))

(declare-fun m!106799 () Bool)

(assert (=> b!67112 m!106799))

(declare-fun m!106801 () Bool)

(assert (=> b!67112 m!106801))

(declare-fun m!106803 () Bool)

(assert (=> b!67112 m!106803))

(declare-fun m!106805 () Bool)

(assert (=> b!67112 m!106805))

(assert (=> b!67112 m!106803))

(assert (=> b!67112 m!106235))

(declare-fun m!106807 () Bool)

(assert (=> b!67112 m!106807))

(declare-fun m!106809 () Bool)

(assert (=> b!67112 m!106809))

(declare-fun m!106811 () Bool)

(assert (=> b!67112 m!106811))

(assert (=> b!67112 m!106795))

(declare-fun m!106813 () Bool)

(assert (=> b!67112 m!106813))

(declare-fun m!106815 () Bool)

(assert (=> b!67112 m!106815))

(declare-fun m!106817 () Bool)

(assert (=> b!67112 m!106817))

(declare-fun m!106819 () Bool)

(assert (=> b!67112 m!106819))

(declare-fun m!106821 () Bool)

(assert (=> b!67112 m!106821))

(assert (=> b!67112 m!106817))

(declare-fun m!106823 () Bool)

(assert (=> b!67112 m!106823))

(declare-fun m!106825 () Bool)

(assert (=> b!67112 m!106825))

(declare-fun m!106827 () Bool)

(assert (=> b!67112 m!106827))

(declare-fun m!106829 () Bool)

(assert (=> b!67112 m!106829))

(declare-fun m!106831 () Bool)

(assert (=> b!67112 m!106831))

(declare-fun m!106833 () Bool)

(assert (=> b!67112 m!106833))

(declare-fun m!106835 () Bool)

(assert (=> b!67112 m!106835))

(assert (=> b!67112 m!106827))

(declare-fun m!106837 () Bool)

(assert (=> b!67112 m!106837))

(declare-fun m!106839 () Bool)

(assert (=> b!67112 m!106839))

(declare-fun m!106841 () Bool)

(assert (=> b!67112 m!106841))

(declare-fun m!106843 () Bool)

(assert (=> b!67112 m!106843))

(declare-fun m!106845 () Bool)

(assert (=> b!67112 m!106845))

(declare-fun m!106847 () Bool)

(assert (=> b!67112 m!106847))

(declare-fun m!106849 () Bool)

(assert (=> b!67113 m!106849))

(declare-fun m!106851 () Bool)

(assert (=> b!67111 m!106851))

(declare-fun m!106853 () Bool)

(assert (=> b!67111 m!106853))

(declare-fun m!106855 () Bool)

(assert (=> b!67111 m!106855))

(declare-fun m!106857 () Bool)

(assert (=> b!67111 m!106857))

(declare-fun m!106859 () Bool)

(assert (=> b!67111 m!106859))

(assert (=> b!66739 d!21090))

(declare-fun b!67155 () Bool)

(declare-fun res!55630 () Bool)

(declare-fun e!44020 () Bool)

(assert (=> b!67155 (=> (not res!55630) (not e!44020))))

(declare-fun lt!107077 () tuple2!5894)

(assert (=> b!67155 (= res!55630 (isPrefixOf!0 (_2!3058 lt!107077) (_2!3057 lt!106142)))))

(declare-fun b!67156 () Bool)

(declare-fun res!55629 () Bool)

(assert (=> b!67156 (=> (not res!55629) (not e!44020))))

(assert (=> b!67156 (= res!55629 (isPrefixOf!0 (_1!3058 lt!107077) thiss!1379))))

(declare-fun b!67157 () Bool)

(declare-fun e!44019 () Unit!4499)

(declare-fun Unit!4523 () Unit!4499)

(assert (=> b!67157 (= e!44019 Unit!4523)))

(declare-fun b!67158 () Bool)

(declare-fun lt!107070 () (_ BitVec 64))

(declare-fun lt!107086 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2266 (_ BitVec 64)) BitStream!2266)

(assert (=> b!67158 (= e!44020 (= (_1!3058 lt!107077) (withMovedBitIndex!0 (_2!3058 lt!107077) (bvsub lt!107086 lt!107070))))))

(assert (=> b!67158 (or (= (bvand lt!107086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107070 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107086 lt!107070) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67158 (= lt!107070 (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106142))) (currentByte!3378 (_2!3057 lt!106142)) (currentBit!3373 (_2!3057 lt!106142))))))

(assert (=> b!67158 (= lt!107086 (bitIndex!0 (size!1319 (buf!1700 thiss!1379)) (currentByte!3378 thiss!1379) (currentBit!3373 thiss!1379)))))

(declare-fun d!21164 () Bool)

(assert (=> d!21164 e!44020))

(declare-fun res!55631 () Bool)

(assert (=> d!21164 (=> (not res!55631) (not e!44020))))

(assert (=> d!21164 (= res!55631 (isPrefixOf!0 (_1!3058 lt!107077) (_2!3058 lt!107077)))))

(declare-fun lt!107081 () BitStream!2266)

(assert (=> d!21164 (= lt!107077 (tuple2!5895 lt!107081 (_2!3057 lt!106142)))))

(declare-fun lt!107078 () Unit!4499)

(declare-fun lt!107085 () Unit!4499)

(assert (=> d!21164 (= lt!107078 lt!107085)))

(assert (=> d!21164 (isPrefixOf!0 lt!107081 (_2!3057 lt!106142))))

(assert (=> d!21164 (= lt!107085 (lemmaIsPrefixTransitive!0 lt!107081 (_2!3057 lt!106142) (_2!3057 lt!106142)))))

(declare-fun lt!107073 () Unit!4499)

(declare-fun lt!107080 () Unit!4499)

(assert (=> d!21164 (= lt!107073 lt!107080)))

(assert (=> d!21164 (isPrefixOf!0 lt!107081 (_2!3057 lt!106142))))

(assert (=> d!21164 (= lt!107080 (lemmaIsPrefixTransitive!0 lt!107081 thiss!1379 (_2!3057 lt!106142)))))

(declare-fun lt!107083 () Unit!4499)

(assert (=> d!21164 (= lt!107083 e!44019)))

(declare-fun c!4894 () Bool)

(assert (=> d!21164 (= c!4894 (not (= (size!1319 (buf!1700 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!107079 () Unit!4499)

(declare-fun lt!107075 () Unit!4499)

(assert (=> d!21164 (= lt!107079 lt!107075)))

(assert (=> d!21164 (isPrefixOf!0 (_2!3057 lt!106142) (_2!3057 lt!106142))))

(assert (=> d!21164 (= lt!107075 (lemmaIsPrefixRefl!0 (_2!3057 lt!106142)))))

(declare-fun lt!107082 () Unit!4499)

(declare-fun lt!107076 () Unit!4499)

(assert (=> d!21164 (= lt!107082 lt!107076)))

(assert (=> d!21164 (= lt!107076 (lemmaIsPrefixRefl!0 (_2!3057 lt!106142)))))

(declare-fun lt!107084 () Unit!4499)

(declare-fun lt!107071 () Unit!4499)

(assert (=> d!21164 (= lt!107084 lt!107071)))

(assert (=> d!21164 (isPrefixOf!0 lt!107081 lt!107081)))

(assert (=> d!21164 (= lt!107071 (lemmaIsPrefixRefl!0 lt!107081))))

(declare-fun lt!107072 () Unit!4499)

(declare-fun lt!107089 () Unit!4499)

(assert (=> d!21164 (= lt!107072 lt!107089)))

(assert (=> d!21164 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21164 (= lt!107089 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21164 (= lt!107081 (BitStream!2267 (buf!1700 (_2!3057 lt!106142)) (currentByte!3378 thiss!1379) (currentBit!3373 thiss!1379)))))

(assert (=> d!21164 (isPrefixOf!0 thiss!1379 (_2!3057 lt!106142))))

(assert (=> d!21164 (= (reader!0 thiss!1379 (_2!3057 lt!106142)) lt!107077)))

(declare-fun b!67159 () Bool)

(declare-fun lt!107087 () Unit!4499)

(assert (=> b!67159 (= e!44019 lt!107087)))

(declare-fun lt!107088 () (_ BitVec 64))

(assert (=> b!67159 (= lt!107088 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107074 () (_ BitVec 64))

(assert (=> b!67159 (= lt!107074 (bitIndex!0 (size!1319 (buf!1700 thiss!1379)) (currentByte!3378 thiss!1379) (currentBit!3373 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2857 array!2857 (_ BitVec 64) (_ BitVec 64)) Unit!4499)

(assert (=> b!67159 (= lt!107087 (arrayBitRangesEqSymmetric!0 (buf!1700 thiss!1379) (buf!1700 (_2!3057 lt!106142)) lt!107088 lt!107074))))

(assert (=> b!67159 (arrayBitRangesEq!0 (buf!1700 (_2!3057 lt!106142)) (buf!1700 thiss!1379) lt!107088 lt!107074)))

(assert (= (and d!21164 c!4894) b!67159))

(assert (= (and d!21164 (not c!4894)) b!67157))

(assert (= (and d!21164 res!55631) b!67156))

(assert (= (and b!67156 res!55629) b!67155))

(assert (= (and b!67155 res!55630) b!67158))

(assert (=> b!67159 m!106151))

(declare-fun m!106965 () Bool)

(assert (=> b!67159 m!106965))

(declare-fun m!106967 () Bool)

(assert (=> b!67159 m!106967))

(declare-fun m!106969 () Bool)

(assert (=> b!67156 m!106969))

(declare-fun m!106971 () Bool)

(assert (=> d!21164 m!106971))

(declare-fun m!106973 () Bool)

(assert (=> d!21164 m!106973))

(assert (=> d!21164 m!106147))

(declare-fun m!106975 () Bool)

(assert (=> d!21164 m!106975))

(declare-fun m!106977 () Bool)

(assert (=> d!21164 m!106977))

(assert (=> d!21164 m!106179))

(assert (=> d!21164 m!106149))

(declare-fun m!106979 () Bool)

(assert (=> d!21164 m!106979))

(assert (=> d!21164 m!106781))

(declare-fun m!106981 () Bool)

(assert (=> d!21164 m!106981))

(assert (=> d!21164 m!106783))

(declare-fun m!106983 () Bool)

(assert (=> b!67158 m!106983))

(assert (=> b!67158 m!106235))

(assert (=> b!67158 m!106151))

(declare-fun m!106985 () Bool)

(assert (=> b!67155 m!106985))

(assert (=> b!66739 d!21164))

(declare-fun d!21184 () Bool)

(assert (=> d!21184 (validate_offset_bits!1 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106142)))) ((_ sign_extend 32) (currentByte!3378 thiss!1379)) ((_ sign_extend 32) (currentBit!3373 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!107092 () Unit!4499)

(declare-fun choose!9 (BitStream!2266 array!2857 (_ BitVec 64) BitStream!2266) Unit!4499)

(assert (=> d!21184 (= lt!107092 (choose!9 thiss!1379 (buf!1700 (_2!3057 lt!106142)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2267 (buf!1700 (_2!3057 lt!106142)) (currentByte!3378 thiss!1379) (currentBit!3373 thiss!1379))))))

(assert (=> d!21184 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1700 (_2!3057 lt!106142)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!107092)))

(declare-fun bs!5137 () Bool)

(assert (= bs!5137 d!21184))

(assert (=> bs!5137 m!106199))

(declare-fun m!106987 () Bool)

(assert (=> bs!5137 m!106987))

(assert (=> b!66739 d!21184))

(declare-fun d!21186 () Bool)

(assert (=> d!21186 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106131)))) ((_ sign_extend 32) (currentByte!3378 (_2!3057 lt!106142))) ((_ sign_extend 32) (currentBit!3373 (_2!3057 lt!106142))) lt!106149) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106131)))) ((_ sign_extend 32) (currentByte!3378 (_2!3057 lt!106142))) ((_ sign_extend 32) (currentBit!3373 (_2!3057 lt!106142)))) lt!106149))))

(declare-fun bs!5138 () Bool)

(assert (= bs!5138 d!21186))

(declare-fun m!106989 () Bool)

(assert (=> bs!5138 m!106989))

(assert (=> b!66748 d!21186))

(declare-fun b!67160 () Bool)

(declare-fun res!55633 () Bool)

(declare-fun e!44022 () Bool)

(assert (=> b!67160 (=> (not res!55633) (not e!44022))))

(declare-fun lt!107100 () tuple2!5894)

(assert (=> b!67160 (= res!55633 (isPrefixOf!0 (_2!3058 lt!107100) (_2!3057 lt!106131)))))

(declare-fun b!67161 () Bool)

(declare-fun res!55632 () Bool)

(assert (=> b!67161 (=> (not res!55632) (not e!44022))))

(assert (=> b!67161 (= res!55632 (isPrefixOf!0 (_1!3058 lt!107100) (_2!3057 lt!106142)))))

(declare-fun b!67162 () Bool)

(declare-fun e!44021 () Unit!4499)

(declare-fun Unit!4524 () Unit!4499)

(assert (=> b!67162 (= e!44021 Unit!4524)))

(declare-fun lt!107109 () (_ BitVec 64))

(declare-fun lt!107093 () (_ BitVec 64))

(declare-fun b!67163 () Bool)

(assert (=> b!67163 (= e!44022 (= (_1!3058 lt!107100) (withMovedBitIndex!0 (_2!3058 lt!107100) (bvsub lt!107109 lt!107093))))))

(assert (=> b!67163 (or (= (bvand lt!107109 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107093 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107109 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107109 lt!107093) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67163 (= lt!107093 (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106131))) (currentByte!3378 (_2!3057 lt!106131)) (currentBit!3373 (_2!3057 lt!106131))))))

(assert (=> b!67163 (= lt!107109 (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106142))) (currentByte!3378 (_2!3057 lt!106142)) (currentBit!3373 (_2!3057 lt!106142))))))

(declare-fun d!21188 () Bool)

(assert (=> d!21188 e!44022))

(declare-fun res!55634 () Bool)

(assert (=> d!21188 (=> (not res!55634) (not e!44022))))

(assert (=> d!21188 (= res!55634 (isPrefixOf!0 (_1!3058 lt!107100) (_2!3058 lt!107100)))))

(declare-fun lt!107104 () BitStream!2266)

(assert (=> d!21188 (= lt!107100 (tuple2!5895 lt!107104 (_2!3057 lt!106131)))))

(declare-fun lt!107101 () Unit!4499)

(declare-fun lt!107108 () Unit!4499)

(assert (=> d!21188 (= lt!107101 lt!107108)))

(assert (=> d!21188 (isPrefixOf!0 lt!107104 (_2!3057 lt!106131))))

(assert (=> d!21188 (= lt!107108 (lemmaIsPrefixTransitive!0 lt!107104 (_2!3057 lt!106131) (_2!3057 lt!106131)))))

(declare-fun lt!107096 () Unit!4499)

(declare-fun lt!107103 () Unit!4499)

(assert (=> d!21188 (= lt!107096 lt!107103)))

(assert (=> d!21188 (isPrefixOf!0 lt!107104 (_2!3057 lt!106131))))

(assert (=> d!21188 (= lt!107103 (lemmaIsPrefixTransitive!0 lt!107104 (_2!3057 lt!106142) (_2!3057 lt!106131)))))

(declare-fun lt!107106 () Unit!4499)

(assert (=> d!21188 (= lt!107106 e!44021)))

(declare-fun c!4895 () Bool)

(assert (=> d!21188 (= c!4895 (not (= (size!1319 (buf!1700 (_2!3057 lt!106142))) #b00000000000000000000000000000000)))))

(declare-fun lt!107102 () Unit!4499)

(declare-fun lt!107098 () Unit!4499)

(assert (=> d!21188 (= lt!107102 lt!107098)))

(assert (=> d!21188 (isPrefixOf!0 (_2!3057 lt!106131) (_2!3057 lt!106131))))

(assert (=> d!21188 (= lt!107098 (lemmaIsPrefixRefl!0 (_2!3057 lt!106131)))))

(declare-fun lt!107105 () Unit!4499)

(declare-fun lt!107099 () Unit!4499)

(assert (=> d!21188 (= lt!107105 lt!107099)))

(assert (=> d!21188 (= lt!107099 (lemmaIsPrefixRefl!0 (_2!3057 lt!106131)))))

(declare-fun lt!107107 () Unit!4499)

(declare-fun lt!107094 () Unit!4499)

(assert (=> d!21188 (= lt!107107 lt!107094)))

(assert (=> d!21188 (isPrefixOf!0 lt!107104 lt!107104)))

(assert (=> d!21188 (= lt!107094 (lemmaIsPrefixRefl!0 lt!107104))))

(declare-fun lt!107095 () Unit!4499)

(declare-fun lt!107112 () Unit!4499)

(assert (=> d!21188 (= lt!107095 lt!107112)))

(assert (=> d!21188 (isPrefixOf!0 (_2!3057 lt!106142) (_2!3057 lt!106142))))

(assert (=> d!21188 (= lt!107112 (lemmaIsPrefixRefl!0 (_2!3057 lt!106142)))))

(assert (=> d!21188 (= lt!107104 (BitStream!2267 (buf!1700 (_2!3057 lt!106131)) (currentByte!3378 (_2!3057 lt!106142)) (currentBit!3373 (_2!3057 lt!106142))))))

(assert (=> d!21188 (isPrefixOf!0 (_2!3057 lt!106142) (_2!3057 lt!106131))))

(assert (=> d!21188 (= (reader!0 (_2!3057 lt!106142) (_2!3057 lt!106131)) lt!107100)))

(declare-fun b!67164 () Bool)

(declare-fun lt!107110 () Unit!4499)

(assert (=> b!67164 (= e!44021 lt!107110)))

(declare-fun lt!107111 () (_ BitVec 64))

(assert (=> b!67164 (= lt!107111 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107097 () (_ BitVec 64))

(assert (=> b!67164 (= lt!107097 (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106142))) (currentByte!3378 (_2!3057 lt!106142)) (currentBit!3373 (_2!3057 lt!106142))))))

(assert (=> b!67164 (= lt!107110 (arrayBitRangesEqSymmetric!0 (buf!1700 (_2!3057 lt!106142)) (buf!1700 (_2!3057 lt!106131)) lt!107111 lt!107097))))

(assert (=> b!67164 (arrayBitRangesEq!0 (buf!1700 (_2!3057 lt!106131)) (buf!1700 (_2!3057 lt!106142)) lt!107111 lt!107097)))

(assert (= (and d!21188 c!4895) b!67164))

(assert (= (and d!21188 (not c!4895)) b!67162))

(assert (= (and d!21188 res!55634) b!67161))

(assert (= (and b!67161 res!55632) b!67160))

(assert (= (and b!67160 res!55633) b!67163))

(assert (=> b!67164 m!106235))

(declare-fun m!106991 () Bool)

(assert (=> b!67164 m!106991))

(declare-fun m!106993 () Bool)

(assert (=> b!67164 m!106993))

(declare-fun m!106995 () Bool)

(assert (=> b!67161 m!106995))

(declare-fun m!106997 () Bool)

(assert (=> d!21188 m!106997))

(declare-fun m!106999 () Bool)

(assert (=> d!21188 m!106999))

(assert (=> d!21188 m!106781))

(declare-fun m!107001 () Bool)

(assert (=> d!21188 m!107001))

(declare-fun m!107003 () Bool)

(assert (=> d!21188 m!107003))

(assert (=> d!21188 m!106203))

(assert (=> d!21188 m!106783))

(declare-fun m!107005 () Bool)

(assert (=> d!21188 m!107005))

(declare-fun m!107007 () Bool)

(assert (=> d!21188 m!107007))

(declare-fun m!107009 () Bool)

(assert (=> d!21188 m!107009))

(declare-fun m!107011 () Bool)

(assert (=> d!21188 m!107011))

(declare-fun m!107013 () Bool)

(assert (=> b!67163 m!107013))

(assert (=> b!67163 m!106229))

(assert (=> b!67163 m!106235))

(declare-fun m!107015 () Bool)

(assert (=> b!67160 m!107015))

(assert (=> b!66748 d!21188))

(declare-fun d!21190 () Bool)

(assert (=> d!21190 (validate_offset_bits!1 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106131)))) ((_ sign_extend 32) (currentByte!3378 (_2!3057 lt!106142))) ((_ sign_extend 32) (currentBit!3373 (_2!3057 lt!106142))) lt!106149)))

(declare-fun lt!107113 () Unit!4499)

(assert (=> d!21190 (= lt!107113 (choose!9 (_2!3057 lt!106142) (buf!1700 (_2!3057 lt!106131)) lt!106149 (BitStream!2267 (buf!1700 (_2!3057 lt!106131)) (currentByte!3378 (_2!3057 lt!106142)) (currentBit!3373 (_2!3057 lt!106142)))))))

(assert (=> d!21190 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3057 lt!106142) (buf!1700 (_2!3057 lt!106131)) lt!106149) lt!107113)))

(declare-fun bs!5139 () Bool)

(assert (= bs!5139 d!21190))

(assert (=> bs!5139 m!106207))

(declare-fun m!107017 () Bool)

(assert (=> bs!5139 m!107017))

(assert (=> b!66748 d!21190))

(declare-fun b!67175 () Bool)

(declare-fun e!44027 () Bool)

(declare-fun lt!107121 () List!708)

(declare-fun isEmpty!211 (List!708) Bool)

(assert (=> b!67175 (= e!44027 (isEmpty!211 lt!107121))))

(declare-fun b!67173 () Bool)

(declare-datatypes ((tuple2!5918 0))(
  ( (tuple2!5919 (_1!3070 List!708) (_2!3070 BitStream!2266)) )
))
(declare-fun e!44028 () tuple2!5918)

(assert (=> b!67173 (= e!44028 (tuple2!5919 Nil!705 (_1!3058 lt!106134)))))

(declare-datatypes ((tuple2!5920 0))(
  ( (tuple2!5921 (_1!3071 Bool) (_2!3071 BitStream!2266)) )
))
(declare-fun lt!107120 () tuple2!5920)

(declare-fun lt!107122 () (_ BitVec 64))

(declare-fun b!67174 () Bool)

(assert (=> b!67174 (= e!44028 (tuple2!5919 (Cons!704 (_1!3071 lt!107120) (bitStreamReadBitsIntoList!0 (_2!3057 lt!106131) (_2!3071 lt!107120) (bvsub (bvsub to!314 i!635) lt!107122))) (_2!3071 lt!107120)))))

(declare-fun readBit!0 (BitStream!2266) tuple2!5920)

(assert (=> b!67174 (= lt!107120 (readBit!0 (_1!3058 lt!106134)))))

(assert (=> b!67174 (= lt!107122 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!21192 () Bool)

(assert (=> d!21192 e!44027))

(declare-fun c!4900 () Bool)

(assert (=> d!21192 (= c!4900 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21192 (= lt!107121 (_1!3070 e!44028))))

(declare-fun c!4901 () Bool)

(assert (=> d!21192 (= c!4901 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21192 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21192 (= (bitStreamReadBitsIntoList!0 (_2!3057 lt!106131) (_1!3058 lt!106134) (bvsub to!314 i!635)) lt!107121)))

(declare-fun b!67176 () Bool)

(assert (=> b!67176 (= e!44027 (> (length!336 lt!107121) 0))))

(assert (= (and d!21192 c!4901) b!67173))

(assert (= (and d!21192 (not c!4901)) b!67174))

(assert (= (and d!21192 c!4900) b!67175))

(assert (= (and d!21192 (not c!4900)) b!67176))

(declare-fun m!107019 () Bool)

(assert (=> b!67175 m!107019))

(declare-fun m!107021 () Bool)

(assert (=> b!67174 m!107021))

(declare-fun m!107023 () Bool)

(assert (=> b!67174 m!107023))

(declare-fun m!107025 () Bool)

(assert (=> b!67176 m!107025))

(assert (=> b!66748 d!21192))

(declare-fun b!67177 () Bool)

(declare-fun res!55636 () Bool)

(declare-fun e!44030 () Bool)

(assert (=> b!67177 (=> (not res!55636) (not e!44030))))

(declare-fun lt!107130 () tuple2!5894)

(assert (=> b!67177 (= res!55636 (isPrefixOf!0 (_2!3058 lt!107130) (_2!3057 lt!106131)))))

(declare-fun b!67178 () Bool)

(declare-fun res!55635 () Bool)

(assert (=> b!67178 (=> (not res!55635) (not e!44030))))

(assert (=> b!67178 (= res!55635 (isPrefixOf!0 (_1!3058 lt!107130) thiss!1379))))

(declare-fun b!67179 () Bool)

(declare-fun e!44029 () Unit!4499)

(declare-fun Unit!4531 () Unit!4499)

(assert (=> b!67179 (= e!44029 Unit!4531)))

(declare-fun lt!107139 () (_ BitVec 64))

(declare-fun b!67180 () Bool)

(declare-fun lt!107123 () (_ BitVec 64))

(assert (=> b!67180 (= e!44030 (= (_1!3058 lt!107130) (withMovedBitIndex!0 (_2!3058 lt!107130) (bvsub lt!107139 lt!107123))))))

(assert (=> b!67180 (or (= (bvand lt!107139 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107123 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107139 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107139 lt!107123) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67180 (= lt!107123 (bitIndex!0 (size!1319 (buf!1700 (_2!3057 lt!106131))) (currentByte!3378 (_2!3057 lt!106131)) (currentBit!3373 (_2!3057 lt!106131))))))

(assert (=> b!67180 (= lt!107139 (bitIndex!0 (size!1319 (buf!1700 thiss!1379)) (currentByte!3378 thiss!1379) (currentBit!3373 thiss!1379)))))

(declare-fun d!21194 () Bool)

(assert (=> d!21194 e!44030))

(declare-fun res!55637 () Bool)

(assert (=> d!21194 (=> (not res!55637) (not e!44030))))

(assert (=> d!21194 (= res!55637 (isPrefixOf!0 (_1!3058 lt!107130) (_2!3058 lt!107130)))))

(declare-fun lt!107134 () BitStream!2266)

(assert (=> d!21194 (= lt!107130 (tuple2!5895 lt!107134 (_2!3057 lt!106131)))))

(declare-fun lt!107131 () Unit!4499)

(declare-fun lt!107138 () Unit!4499)

(assert (=> d!21194 (= lt!107131 lt!107138)))

(assert (=> d!21194 (isPrefixOf!0 lt!107134 (_2!3057 lt!106131))))

(assert (=> d!21194 (= lt!107138 (lemmaIsPrefixTransitive!0 lt!107134 (_2!3057 lt!106131) (_2!3057 lt!106131)))))

(declare-fun lt!107126 () Unit!4499)

(declare-fun lt!107133 () Unit!4499)

(assert (=> d!21194 (= lt!107126 lt!107133)))

(assert (=> d!21194 (isPrefixOf!0 lt!107134 (_2!3057 lt!106131))))

(assert (=> d!21194 (= lt!107133 (lemmaIsPrefixTransitive!0 lt!107134 thiss!1379 (_2!3057 lt!106131)))))

(declare-fun lt!107136 () Unit!4499)

(assert (=> d!21194 (= lt!107136 e!44029)))

(declare-fun c!4902 () Bool)

(assert (=> d!21194 (= c!4902 (not (= (size!1319 (buf!1700 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!107132 () Unit!4499)

(declare-fun lt!107128 () Unit!4499)

(assert (=> d!21194 (= lt!107132 lt!107128)))

(assert (=> d!21194 (isPrefixOf!0 (_2!3057 lt!106131) (_2!3057 lt!106131))))

(assert (=> d!21194 (= lt!107128 (lemmaIsPrefixRefl!0 (_2!3057 lt!106131)))))

(declare-fun lt!107135 () Unit!4499)

(declare-fun lt!107129 () Unit!4499)

(assert (=> d!21194 (= lt!107135 lt!107129)))

(assert (=> d!21194 (= lt!107129 (lemmaIsPrefixRefl!0 (_2!3057 lt!106131)))))

(declare-fun lt!107137 () Unit!4499)

(declare-fun lt!107124 () Unit!4499)

(assert (=> d!21194 (= lt!107137 lt!107124)))

(assert (=> d!21194 (isPrefixOf!0 lt!107134 lt!107134)))

(assert (=> d!21194 (= lt!107124 (lemmaIsPrefixRefl!0 lt!107134))))

(declare-fun lt!107125 () Unit!4499)

(declare-fun lt!107142 () Unit!4499)

(assert (=> d!21194 (= lt!107125 lt!107142)))

(assert (=> d!21194 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21194 (= lt!107142 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21194 (= lt!107134 (BitStream!2267 (buf!1700 (_2!3057 lt!106131)) (currentByte!3378 thiss!1379) (currentBit!3373 thiss!1379)))))

(assert (=> d!21194 (isPrefixOf!0 thiss!1379 (_2!3057 lt!106131))))

(assert (=> d!21194 (= (reader!0 thiss!1379 (_2!3057 lt!106131)) lt!107130)))

(declare-fun b!67181 () Bool)

(declare-fun lt!107140 () Unit!4499)

(assert (=> b!67181 (= e!44029 lt!107140)))

(declare-fun lt!107141 () (_ BitVec 64))

(assert (=> b!67181 (= lt!107141 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107127 () (_ BitVec 64))

(assert (=> b!67181 (= lt!107127 (bitIndex!0 (size!1319 (buf!1700 thiss!1379)) (currentByte!3378 thiss!1379) (currentBit!3373 thiss!1379)))))

(assert (=> b!67181 (= lt!107140 (arrayBitRangesEqSymmetric!0 (buf!1700 thiss!1379) (buf!1700 (_2!3057 lt!106131)) lt!107141 lt!107127))))

(assert (=> b!67181 (arrayBitRangesEq!0 (buf!1700 (_2!3057 lt!106131)) (buf!1700 thiss!1379) lt!107141 lt!107127)))

(assert (= (and d!21194 c!4902) b!67181))

(assert (= (and d!21194 (not c!4902)) b!67179))

(assert (= (and d!21194 res!55637) b!67178))

(assert (= (and b!67178 res!55635) b!67177))

(assert (= (and b!67177 res!55636) b!67180))

(assert (=> b!67181 m!106151))

(declare-fun m!107027 () Bool)

(assert (=> b!67181 m!107027))

(declare-fun m!107029 () Bool)

(assert (=> b!67181 m!107029))

(declare-fun m!107031 () Bool)

(assert (=> b!67178 m!107031))

(declare-fun m!107033 () Bool)

(assert (=> d!21194 m!107033))

(declare-fun m!107035 () Bool)

(assert (=> d!21194 m!107035))

(assert (=> d!21194 m!106147))

(declare-fun m!107037 () Bool)

(assert (=> d!21194 m!107037))

(declare-fun m!107039 () Bool)

(assert (=> d!21194 m!107039))

(assert (=> d!21194 m!106193))

(assert (=> d!21194 m!106149))

(declare-fun m!107041 () Bool)

(assert (=> d!21194 m!107041))

(assert (=> d!21194 m!107007))

(declare-fun m!107043 () Bool)

(assert (=> d!21194 m!107043))

(assert (=> d!21194 m!107011))

(declare-fun m!107045 () Bool)

(assert (=> b!67180 m!107045))

(assert (=> b!67180 m!106229))

(assert (=> b!67180 m!106151))

(declare-fun m!107047 () Bool)

(assert (=> b!67177 m!107047))

(assert (=> b!66748 d!21194))

(declare-fun d!21196 () Bool)

(assert (=> d!21196 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106131)))) ((_ sign_extend 32) (currentByte!3378 thiss!1379)) ((_ sign_extend 32) (currentBit!3373 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106131)))) ((_ sign_extend 32) (currentByte!3378 thiss!1379)) ((_ sign_extend 32) (currentBit!3373 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5140 () Bool)

(assert (= bs!5140 d!21196))

(declare-fun m!107049 () Bool)

(assert (=> bs!5140 m!107049))

(assert (=> b!66748 d!21196))

(declare-fun d!21198 () Bool)

(assert (=> d!21198 (validate_offset_bits!1 ((_ sign_extend 32) (size!1319 (buf!1700 (_2!3057 lt!106131)))) ((_ sign_extend 32) (currentByte!3378 thiss!1379)) ((_ sign_extend 32) (currentBit!3373 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!107143 () Unit!4499)

(assert (=> d!21198 (= lt!107143 (choose!9 thiss!1379 (buf!1700 (_2!3057 lt!106131)) (bvsub to!314 i!635) (BitStream!2267 (buf!1700 (_2!3057 lt!106131)) (currentByte!3378 thiss!1379) (currentBit!3373 thiss!1379))))))

(assert (=> d!21198 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1700 (_2!3057 lt!106131)) (bvsub to!314 i!635)) lt!107143)))

(declare-fun bs!5141 () Bool)

(assert (= bs!5141 d!21198))

(assert (=> bs!5141 m!106215))

(declare-fun m!107051 () Bool)

(assert (=> bs!5141 m!107051))

(assert (=> b!66748 d!21198))

(declare-fun b!67184 () Bool)

(declare-fun e!44031 () Bool)

(declare-fun lt!107145 () List!708)

(assert (=> b!67184 (= e!44031 (isEmpty!211 lt!107145))))

(declare-fun b!67182 () Bool)

(declare-fun e!44032 () tuple2!5918)

(assert (=> b!67182 (= e!44032 (tuple2!5919 Nil!705 (_1!3058 lt!106136)))))

(declare-fun lt!107144 () tuple2!5920)

(declare-fun lt!107146 () (_ BitVec 64))

(declare-fun b!67183 () Bool)

(assert (=> b!67183 (= e!44032 (tuple2!5919 (Cons!704 (_1!3071 lt!107144) (bitStreamReadBitsIntoList!0 (_2!3057 lt!106131) (_2!3071 lt!107144) (bvsub lt!106149 lt!107146))) (_2!3071 lt!107144)))))

(assert (=> b!67183 (= lt!107144 (readBit!0 (_1!3058 lt!106136)))))

(assert (=> b!67183 (= lt!107146 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!21200 () Bool)

(assert (=> d!21200 e!44031))

(declare-fun c!4903 () Bool)

(assert (=> d!21200 (= c!4903 (= lt!106149 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21200 (= lt!107145 (_1!3070 e!44032))))

(declare-fun c!4904 () Bool)

(assert (=> d!21200 (= c!4904 (= lt!106149 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21200 (bvsge lt!106149 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21200 (= (bitStreamReadBitsIntoList!0 (_2!3057 lt!106131) (_1!3058 lt!106136) lt!106149) lt!107145)))

(declare-fun b!67185 () Bool)

(assert (=> b!67185 (= e!44031 (> (length!336 lt!107145) 0))))

(assert (= (and d!21200 c!4904) b!67182))

(assert (= (and d!21200 (not c!4904)) b!67183))

(assert (= (and d!21200 c!4903) b!67184))

(assert (= (and d!21200 (not c!4903)) b!67185))

(declare-fun m!107053 () Bool)

(assert (=> b!67184 m!107053))

(declare-fun m!107055 () Bool)

(assert (=> b!67183 m!107055))

(declare-fun m!107057 () Bool)

(assert (=> b!67183 m!107057))

(declare-fun m!107059 () Bool)

(assert (=> b!67185 m!107059))

(assert (=> b!66748 d!21200))

(declare-fun d!21202 () Bool)

(assert (=> d!21202 (= (tail!312 lt!106130) (t!1458 lt!106130))))

(assert (=> b!66737 d!21202))

(declare-fun d!21204 () Bool)

(declare-fun e!44035 () Bool)

(assert (=> d!21204 e!44035))

(declare-fun res!55640 () Bool)

(assert (=> d!21204 (=> (not res!55640) (not e!44035))))

(declare-fun lt!107152 () (_ BitVec 64))

(assert (=> d!21204 (= res!55640 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107152 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!107152) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!21204 (= lt!107152 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!107151 () Unit!4499)

(declare-fun choose!42 (BitStream!2266 BitStream!2266 BitStream!2266 BitStream!2266 (_ BitVec 64) List!708) Unit!4499)

(assert (=> d!21204 (= lt!107151 (choose!42 (_2!3057 lt!106131) (_2!3057 lt!106131) (_1!3058 lt!106134) (_1!3058 lt!106136) (bvsub to!314 i!635) lt!106130))))

(assert (=> d!21204 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21204 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3057 lt!106131) (_2!3057 lt!106131) (_1!3058 lt!106134) (_1!3058 lt!106136) (bvsub to!314 i!635) lt!106130) lt!107151)))

(declare-fun b!67188 () Bool)

(assert (=> b!67188 (= e!44035 (= (bitStreamReadBitsIntoList!0 (_2!3057 lt!106131) (_1!3058 lt!106136) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!312 lt!106130)))))

(assert (= (and d!21204 res!55640) b!67188))

(declare-fun m!107061 () Bool)

(assert (=> d!21204 m!107061))

(declare-fun m!107063 () Bool)

(assert (=> b!67188 m!107063))

(assert (=> b!67188 m!106157))

(assert (=> b!66737 d!21204))

(declare-fun d!21206 () Bool)

(assert (=> d!21206 (= (head!527 (byteArrayBitContentToList!0 (_2!3057 lt!106131) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!823 (byteArrayBitContentToList!0 (_2!3057 lt!106131) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!66736 d!21206))

(declare-fun d!21208 () Bool)

(declare-fun c!4907 () Bool)

(assert (=> d!21208 (= c!4907 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!44038 () List!708)

(assert (=> d!21208 (= (byteArrayBitContentToList!0 (_2!3057 lt!106131) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!44038)))

(declare-fun b!67193 () Bool)

(assert (=> b!67193 (= e!44038 Nil!705)))

(declare-fun b!67194 () Bool)

(assert (=> b!67194 (= e!44038 (Cons!704 (not (= (bvand ((_ sign_extend 24) (select (arr!1886 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3057 lt!106131) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21208 c!4907) b!67193))

(assert (= (and d!21208 (not c!4907)) b!67194))

(assert (=> b!67194 m!106175))

(assert (=> b!67194 m!106475))

(declare-fun m!107065 () Bool)

(assert (=> b!67194 m!107065))

(assert (=> b!66736 d!21208))

(declare-fun d!21210 () Bool)

(assert (=> d!21210 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1886 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5142 () Bool)

(assert (= bs!5142 d!21210))

(assert (=> bs!5142 m!106175))

(assert (=> bs!5142 m!106475))

(assert (=> b!66736 d!21210))

(declare-fun d!21212 () Bool)

(assert (=> d!21212 (= (head!527 (byteArrayBitContentToList!0 (_2!3057 lt!106142) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!823 (byteArrayBitContentToList!0 (_2!3057 lt!106142) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!66747 d!21212))

(declare-fun d!21214 () Bool)

(declare-fun c!4908 () Bool)

(assert (=> d!21214 (= c!4908 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!44039 () List!708)

(assert (=> d!21214 (= (byteArrayBitContentToList!0 (_2!3057 lt!106142) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!44039)))

(declare-fun b!67195 () Bool)

(assert (=> b!67195 (= e!44039 Nil!705)))

(declare-fun b!67196 () Bool)

(assert (=> b!67196 (= e!44039 (Cons!704 (not (= (bvand ((_ sign_extend 24) (select (arr!1886 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3057 lt!106142) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21214 c!4908) b!67195))

(assert (= (and d!21214 (not c!4908)) b!67196))

(assert (=> b!67196 m!106175))

(assert (=> b!67196 m!106475))

(declare-fun m!107067 () Bool)

(assert (=> b!67196 m!107067))

(assert (=> b!66747 d!21214))

(declare-fun d!21216 () Bool)

(assert (=> d!21216 (= (head!527 (bitStreamReadBitsIntoList!0 (_2!3057 lt!106142) (_1!3058 lt!106146) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!823 (bitStreamReadBitsIntoList!0 (_2!3057 lt!106142) (_1!3058 lt!106146) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!66747 d!21216))

(declare-fun b!67199 () Bool)

(declare-fun e!44040 () Bool)

(declare-fun lt!107154 () List!708)

(assert (=> b!67199 (= e!44040 (isEmpty!211 lt!107154))))

(declare-fun b!67197 () Bool)

(declare-fun e!44041 () tuple2!5918)

(assert (=> b!67197 (= e!44041 (tuple2!5919 Nil!705 (_1!3058 lt!106146)))))

(declare-fun lt!107153 () tuple2!5920)

(declare-fun b!67198 () Bool)

(declare-fun lt!107155 () (_ BitVec 64))

(assert (=> b!67198 (= e!44041 (tuple2!5919 (Cons!704 (_1!3071 lt!107153) (bitStreamReadBitsIntoList!0 (_2!3057 lt!106142) (_2!3071 lt!107153) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!107155))) (_2!3071 lt!107153)))))

(assert (=> b!67198 (= lt!107153 (readBit!0 (_1!3058 lt!106146)))))

(assert (=> b!67198 (= lt!107155 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!21218 () Bool)

(assert (=> d!21218 e!44040))

(declare-fun c!4909 () Bool)

(assert (=> d!21218 (= c!4909 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21218 (= lt!107154 (_1!3070 e!44041))))

(declare-fun c!4910 () Bool)

(assert (=> d!21218 (= c!4910 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21218 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21218 (= (bitStreamReadBitsIntoList!0 (_2!3057 lt!106142) (_1!3058 lt!106146) #b0000000000000000000000000000000000000000000000000000000000000001) lt!107154)))

(declare-fun b!67200 () Bool)

(assert (=> b!67200 (= e!44040 (> (length!336 lt!107154) 0))))

(assert (= (and d!21218 c!4910) b!67197))

(assert (= (and d!21218 (not c!4910)) b!67198))

(assert (= (and d!21218 c!4909) b!67199))

(assert (= (and d!21218 (not c!4909)) b!67200))

(declare-fun m!107069 () Bool)

(assert (=> b!67199 m!107069))

(declare-fun m!107071 () Bool)

(assert (=> b!67198 m!107071))

(declare-fun m!107073 () Bool)

(assert (=> b!67198 m!107073))

(declare-fun m!107075 () Bool)

(assert (=> b!67200 m!107075))

(assert (=> b!66747 d!21218))

(declare-fun d!21220 () Bool)

(assert (=> d!21220 (= (array_inv!1192 srcBuffer!2) (bvsge (size!1319 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13008 d!21220))

(declare-fun d!21222 () Bool)

(assert (=> d!21222 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3373 thiss!1379) (currentByte!3378 thiss!1379) (size!1319 (buf!1700 thiss!1379))))))

(declare-fun bs!5143 () Bool)

(assert (= bs!5143 d!21222))

(assert (=> bs!5143 m!106511))

(assert (=> start!13008 d!21222))

(declare-fun d!21224 () Bool)

(assert (=> d!21224 (= (bitAt!0 (buf!1700 (_2!3057 lt!106142)) lt!106129) (not (= (bvand ((_ sign_extend 24) (select (arr!1886 (buf!1700 (_2!3057 lt!106142))) ((_ extract 31 0) (bvsdiv lt!106129 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!106129 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5144 () Bool)

(assert (= bs!5144 d!21224))

(declare-fun m!107077 () Bool)

(assert (=> bs!5144 m!107077))

(declare-fun m!107079 () Bool)

(assert (=> bs!5144 m!107079))

(assert (=> b!66745 d!21224))

(declare-fun d!21226 () Bool)

(assert (=> d!21226 (= (invariant!0 (currentBit!3373 (_2!3057 lt!106142)) (currentByte!3378 (_2!3057 lt!106142)) (size!1319 (buf!1700 (_2!3057 lt!106142)))) (and (bvsge (currentBit!3373 (_2!3057 lt!106142)) #b00000000000000000000000000000000) (bvslt (currentBit!3373 (_2!3057 lt!106142)) #b00000000000000000000000000001000) (bvsge (currentByte!3378 (_2!3057 lt!106142)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3378 (_2!3057 lt!106142)) (size!1319 (buf!1700 (_2!3057 lt!106142)))) (and (= (currentBit!3373 (_2!3057 lt!106142)) #b00000000000000000000000000000000) (= (currentByte!3378 (_2!3057 lt!106142)) (size!1319 (buf!1700 (_2!3057 lt!106142))))))))))

(assert (=> b!66746 d!21226))

(declare-fun d!21228 () Bool)

(declare-fun size!1323 (List!708) Int)

(assert (=> d!21228 (= (length!336 lt!106130) (size!1323 lt!106130))))

(declare-fun bs!5145 () Bool)

(assert (= bs!5145 d!21228))

(declare-fun m!107081 () Bool)

(assert (=> bs!5145 m!107081))

(assert (=> b!66735 d!21228))

(declare-fun d!21230 () Bool)

(assert (=> d!21230 (= (bitAt!0 (buf!1700 (_1!3058 lt!106136)) lt!106129) (not (= (bvand ((_ sign_extend 24) (select (arr!1886 (buf!1700 (_1!3058 lt!106136))) ((_ extract 31 0) (bvsdiv lt!106129 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!106129 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5146 () Bool)

(assert (= bs!5146 d!21230))

(declare-fun m!107083 () Bool)

(assert (=> bs!5146 m!107083))

(assert (=> bs!5146 m!107079))

(assert (=> b!66744 d!21230))

(declare-fun d!21232 () Bool)

(assert (=> d!21232 (= (bitAt!0 (buf!1700 (_1!3058 lt!106134)) lt!106129) (not (= (bvand ((_ sign_extend 24) (select (arr!1886 (buf!1700 (_1!3058 lt!106134))) ((_ extract 31 0) (bvsdiv lt!106129 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!106129 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5147 () Bool)

(assert (= bs!5147 d!21232))

(declare-fun m!107085 () Bool)

(assert (=> bs!5147 m!107085))

(assert (=> bs!5147 m!107079))

(assert (=> b!66744 d!21232))

(declare-fun d!21234 () Bool)

(assert (=> d!21234 (= (invariant!0 (currentBit!3373 (_2!3057 lt!106131)) (currentByte!3378 (_2!3057 lt!106131)) (size!1319 (buf!1700 (_2!3057 lt!106131)))) (and (bvsge (currentBit!3373 (_2!3057 lt!106131)) #b00000000000000000000000000000000) (bvslt (currentBit!3373 (_2!3057 lt!106131)) #b00000000000000000000000000001000) (bvsge (currentByte!3378 (_2!3057 lt!106131)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3378 (_2!3057 lt!106131)) (size!1319 (buf!1700 (_2!3057 lt!106131)))) (and (= (currentBit!3373 (_2!3057 lt!106131)) #b00000000000000000000000000000000) (= (currentByte!3378 (_2!3057 lt!106131)) (size!1319 (buf!1700 (_2!3057 lt!106131))))))))))

(assert (=> b!66733 d!21234))

(declare-fun d!21236 () Bool)

(assert (=> d!21236 (= (invariant!0 (currentBit!3373 (_2!3057 lt!106142)) (currentByte!3378 (_2!3057 lt!106142)) (size!1319 (buf!1700 (_2!3057 lt!106131)))) (and (bvsge (currentBit!3373 (_2!3057 lt!106142)) #b00000000000000000000000000000000) (bvslt (currentBit!3373 (_2!3057 lt!106142)) #b00000000000000000000000000001000) (bvsge (currentByte!3378 (_2!3057 lt!106142)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3378 (_2!3057 lt!106142)) (size!1319 (buf!1700 (_2!3057 lt!106131)))) (and (= (currentBit!3373 (_2!3057 lt!106142)) #b00000000000000000000000000000000) (= (currentByte!3378 (_2!3057 lt!106142)) (size!1319 (buf!1700 (_2!3057 lt!106131))))))))))

(assert (=> b!66734 d!21236))

(push 1)

(assert (not b!66950))

(assert (not d!21080))

(assert (not b!67158))

(assert (not d!21054))

(assert (not b!67117))

(assert (not b!66945))

(assert (not d!21046))

(assert (not b!67163))

(assert (not b!66964))

(assert (not b!66911))

(assert (not d!21084))

(assert (not d!21050))

(assert (not b!66969))

(assert (not b!67159))

(assert (not b!67188))

(assert (not b!67185))

(assert (not d!21164))

(assert (not b!67116))

(assert (not b!67180))

(assert (not d!21074))

(assert (not b!66959))

(assert (not b!67196))

(assert (not b!66957))

(assert (not b!67178))

(assert (not b!66948))

(assert (not d!21190))

(assert (not b!66913))

(assert (not b!67164))

(assert (not d!21086))

(assert (not d!21204))

(assert (not b!66947))

(assert (not b!67176))

(assert (not d!21196))

(assert (not b!66949))

(assert (not d!21078))

(assert (not d!21186))

(assert (not d!21188))

(assert (not b!66944))

(assert (not d!21056))

(assert (not b!67199))

(assert (not b!67200))

(assert (not d!21228))

(assert (not b!67183))

(assert (not bm!858))

(assert (not b!67175))

(assert (not b!66946))

(assert (not b!67184))

(assert (not b!67113))

(assert (not b!66951))

(assert (not b!67111))

(assert (not b!66966))

(assert (not b!67161))

(assert (not b!67181))

(assert (not b!67115))

(assert (not b!67194))

(assert (not d!21198))

(assert (not b!67198))

(assert (not d!21090))

(assert (not b!66967))

(assert (not d!21058))

(assert (not b!67177))

(assert (not b!66916))

(assert (not b!67112))

(assert (not b!67156))

(assert (not d!21184))

(assert (not b!67155))

(assert (not b!67160))

(assert (not d!21194))

(assert (not b!67174))

(assert (not d!21222))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

