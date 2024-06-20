; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13520 () Bool)

(assert start!13520)

(declare-fun b!69288 () Bool)

(declare-fun res!57251 () Bool)

(declare-fun e!45263 () Bool)

(assert (=> b!69288 (=> res!57251 e!45263)))

(declare-datatypes ((array!2901 0))(
  ( (array!2902 (arr!1926 (Array (_ BitVec 32) (_ BitVec 8))) (size!1347 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2298 0))(
  ( (BitStream!2299 (buf!1728 array!2901) (currentByte!3430 (_ BitVec 32)) (currentBit!3425 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2298)

(declare-datatypes ((Unit!4651 0))(
  ( (Unit!4652) )
))
(declare-datatypes ((tuple2!6052 0))(
  ( (tuple2!6053 (_1!3137 Unit!4651) (_2!3137 BitStream!2298)) )
))
(declare-fun lt!111142 () tuple2!6052)

(assert (=> b!69288 (= res!57251 (not (= (size!1347 (buf!1728 thiss!1379)) (size!1347 (buf!1728 (_2!3137 lt!111142))))))))

(declare-fun b!69290 () Bool)

(declare-fun e!45255 () Bool)

(declare-fun e!45259 () Bool)

(assert (=> b!69290 (= e!45255 e!45259)))

(declare-fun res!57249 () Bool)

(assert (=> b!69290 (=> res!57249 e!45259)))

(declare-fun lt!111130 () tuple2!6052)

(declare-fun isPrefixOf!0 (BitStream!2298 BitStream!2298) Bool)

(assert (=> b!69290 (= res!57249 (not (isPrefixOf!0 (_2!3137 lt!111130) (_2!3137 lt!111142))))))

(assert (=> b!69290 (isPrefixOf!0 thiss!1379 (_2!3137 lt!111142))))

(declare-fun lt!111141 () Unit!4651)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2298 BitStream!2298 BitStream!2298) Unit!4651)

(assert (=> b!69290 (= lt!111141 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3137 lt!111130) (_2!3137 lt!111142)))))

(declare-fun srcBuffer!2 () array!2901)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2298 array!2901 (_ BitVec 64) (_ BitVec 64)) tuple2!6052)

(assert (=> b!69290 (= lt!111142 (appendBitsMSBFirstLoop!0 (_2!3137 lt!111130) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!45258 () Bool)

(assert (=> b!69290 e!45258))

(declare-fun res!57260 () Bool)

(assert (=> b!69290 (=> (not res!57260) (not e!45258))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!69290 (= res!57260 (validate_offset_bits!1 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111130)))) ((_ sign_extend 32) (currentByte!3430 thiss!1379)) ((_ sign_extend 32) (currentBit!3425 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!111139 () Unit!4651)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2298 array!2901 (_ BitVec 64)) Unit!4651)

(assert (=> b!69290 (= lt!111139 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1728 (_2!3137 lt!111130)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!6054 0))(
  ( (tuple2!6055 (_1!3138 BitStream!2298) (_2!3138 BitStream!2298)) )
))
(declare-fun lt!111131 () tuple2!6054)

(declare-fun reader!0 (BitStream!2298 BitStream!2298) tuple2!6054)

(assert (=> b!69290 (= lt!111131 (reader!0 thiss!1379 (_2!3137 lt!111130)))))

(declare-fun b!69291 () Bool)

(assert (=> b!69291 (= e!45259 e!45263)))

(declare-fun res!57267 () Bool)

(assert (=> b!69291 (=> res!57267 e!45263)))

(declare-fun lt!111134 () (_ BitVec 64))

(declare-fun lt!111129 () (_ BitVec 64))

(assert (=> b!69291 (= res!57267 (not (= lt!111129 (bvsub (bvadd lt!111134 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!69291 (= lt!111129 (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111142))) (currentByte!3430 (_2!3137 lt!111142)) (currentBit!3425 (_2!3137 lt!111142))))))

(declare-fun b!69292 () Bool)

(declare-fun e!45256 () Bool)

(assert (=> b!69292 (= e!45256 e!45255)))

(declare-fun res!57250 () Bool)

(assert (=> b!69292 (=> res!57250 e!45255)))

(assert (=> b!69292 (= res!57250 (not (isPrefixOf!0 thiss!1379 (_2!3137 lt!111130))))))

(declare-fun lt!111145 () (_ BitVec 64))

(assert (=> b!69292 (validate_offset_bits!1 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111130)))) ((_ sign_extend 32) (currentByte!3430 (_2!3137 lt!111130))) ((_ sign_extend 32) (currentBit!3425 (_2!3137 lt!111130))) lt!111145)))

(assert (=> b!69292 (= lt!111145 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!111146 () Unit!4651)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2298 BitStream!2298 (_ BitVec 64) (_ BitVec 64)) Unit!4651)

(assert (=> b!69292 (= lt!111146 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3137 lt!111130) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2298 (_ BitVec 8) (_ BitVec 32)) tuple2!6052)

(assert (=> b!69292 (= lt!111130 (appendBitFromByte!0 thiss!1379 (select (arr!1926 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!69293 () Bool)

(declare-fun res!57266 () Bool)

(declare-fun e!45261 () Bool)

(assert (=> b!69293 (=> res!57266 e!45261)))

(declare-datatypes ((List!724 0))(
  ( (Nil!721) (Cons!720 (h!839 Bool) (t!1474 List!724)) )
))
(declare-fun lt!111137 () List!724)

(declare-fun lt!111144 () Bool)

(declare-fun head!543 (List!724) Bool)

(assert (=> b!69293 (= res!57266 (not (= (head!543 lt!111137) lt!111144)))))

(declare-fun b!69294 () Bool)

(declare-fun res!57263 () Bool)

(assert (=> b!69294 (=> res!57263 e!45263)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!69294 (= res!57263 (not (invariant!0 (currentBit!3425 (_2!3137 lt!111142)) (currentByte!3430 (_2!3137 lt!111142)) (size!1347 (buf!1728 (_2!3137 lt!111142))))))))

(declare-fun b!69295 () Bool)

(declare-fun res!57252 () Bool)

(declare-fun e!45251 () Bool)

(assert (=> b!69295 (=> (not res!57252) (not e!45251))))

(assert (=> b!69295 (= res!57252 (validate_offset_bits!1 ((_ sign_extend 32) (size!1347 (buf!1728 thiss!1379))) ((_ sign_extend 32) (currentByte!3430 thiss!1379)) ((_ sign_extend 32) (currentBit!3425 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!69289 () Bool)

(declare-fun e!45252 () Bool)

(assert (=> b!69289 (= e!45261 e!45252)))

(declare-fun res!57264 () Bool)

(assert (=> b!69289 (=> res!57264 e!45252)))

(declare-fun lt!111148 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2298 array!2901 (_ BitVec 64) (_ BitVec 64)) List!724)

(assert (=> b!69289 (= res!57264 (not (= (head!543 (byteArrayBitContentToList!0 (_2!3137 lt!111142) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!111148)))))

(declare-fun bitAt!0 (array!2901 (_ BitVec 64)) Bool)

(assert (=> b!69289 (= lt!111148 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun res!57255 () Bool)

(assert (=> start!13520 (=> (not res!57255) (not e!45251))))

(assert (=> start!13520 (= res!57255 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1347 srcBuffer!2))))))))

(assert (=> start!13520 e!45251))

(assert (=> start!13520 true))

(declare-fun array_inv!1208 (array!2901) Bool)

(assert (=> start!13520 (array_inv!1208 srcBuffer!2)))

(declare-fun e!45254 () Bool)

(declare-fun inv!12 (BitStream!2298) Bool)

(assert (=> start!13520 (and (inv!12 thiss!1379) e!45254)))

(declare-fun b!69296 () Bool)

(assert (=> b!69296 (= e!45251 (not e!45256))))

(declare-fun res!57253 () Bool)

(assert (=> b!69296 (=> res!57253 e!45256)))

(assert (=> b!69296 (= res!57253 (bvsge i!635 to!314))))

(assert (=> b!69296 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!111138 () Unit!4651)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2298) Unit!4651)

(assert (=> b!69296 (= lt!111138 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!69296 (= lt!111134 (bitIndex!0 (size!1347 (buf!1728 thiss!1379)) (currentByte!3430 thiss!1379) (currentBit!3425 thiss!1379)))))

(declare-fun b!69297 () Bool)

(declare-fun lt!111147 () (_ BitVec 64))

(assert (=> b!69297 (= e!45252 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!111147) (bvsgt lt!111147 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111130)))))) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!111134) (bvslt lt!111134 lt!111147))))))

(declare-fun b!69298 () Bool)

(declare-fun res!57265 () Bool)

(assert (=> b!69298 (=> res!57265 e!45252)))

(assert (=> b!69298 (= res!57265 (not (= (bitAt!0 (buf!1728 (_2!3137 lt!111130)) lt!111134) lt!111148)))))

(declare-fun b!69299 () Bool)

(declare-fun res!57254 () Bool)

(declare-fun e!45253 () Bool)

(assert (=> b!69299 (=> res!57254 e!45253)))

(assert (=> b!69299 (= res!57254 (not (invariant!0 (currentBit!3425 (_2!3137 lt!111130)) (currentByte!3430 (_2!3137 lt!111130)) (size!1347 (buf!1728 (_2!3137 lt!111130))))))))

(declare-fun b!69300 () Bool)

(assert (=> b!69300 (= e!45254 (array_inv!1208 (buf!1728 thiss!1379)))))

(declare-fun b!69301 () Bool)

(declare-fun e!45250 () Bool)

(assert (=> b!69301 (= e!45253 e!45250)))

(declare-fun res!57257 () Bool)

(assert (=> b!69301 (=> res!57257 e!45250)))

(assert (=> b!69301 (= res!57257 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!111140 () List!724)

(declare-fun lt!111133 () tuple2!6054)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2298 BitStream!2298 (_ BitVec 64)) List!724)

(assert (=> b!69301 (= lt!111140 (bitStreamReadBitsIntoList!0 (_2!3137 lt!111142) (_1!3138 lt!111133) lt!111145))))

(declare-fun lt!111136 () tuple2!6054)

(assert (=> b!69301 (= lt!111137 (bitStreamReadBitsIntoList!0 (_2!3137 lt!111142) (_1!3138 lt!111136) (bvsub to!314 i!635)))))

(assert (=> b!69301 (validate_offset_bits!1 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111142)))) ((_ sign_extend 32) (currentByte!3430 (_2!3137 lt!111130))) ((_ sign_extend 32) (currentBit!3425 (_2!3137 lt!111130))) lt!111145)))

(declare-fun lt!111135 () Unit!4651)

(assert (=> b!69301 (= lt!111135 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3137 lt!111130) (buf!1728 (_2!3137 lt!111142)) lt!111145))))

(assert (=> b!69301 (= lt!111133 (reader!0 (_2!3137 lt!111130) (_2!3137 lt!111142)))))

(assert (=> b!69301 (validate_offset_bits!1 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111142)))) ((_ sign_extend 32) (currentByte!3430 thiss!1379)) ((_ sign_extend 32) (currentBit!3425 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!111128 () Unit!4651)

(assert (=> b!69301 (= lt!111128 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1728 (_2!3137 lt!111142)) (bvsub to!314 i!635)))))

(assert (=> b!69301 (= lt!111136 (reader!0 thiss!1379 (_2!3137 lt!111142)))))

(declare-fun b!69302 () Bool)

(declare-fun e!45262 () Bool)

(assert (=> b!69302 (= e!45262 e!45261)))

(declare-fun res!57258 () Bool)

(assert (=> b!69302 (=> res!57258 e!45261)))

(assert (=> b!69302 (= res!57258 (not (= lt!111144 (bitAt!0 (buf!1728 (_1!3138 lt!111133)) lt!111134))))))

(assert (=> b!69302 (= lt!111144 (bitAt!0 (buf!1728 (_1!3138 lt!111136)) lt!111134))))

(declare-fun b!69303 () Bool)

(assert (=> b!69303 (= e!45258 (= (head!543 (byteArrayBitContentToList!0 (_2!3137 lt!111130) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!543 (bitStreamReadBitsIntoList!0 (_2!3137 lt!111130) (_1!3138 lt!111131) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!69304 () Bool)

(declare-fun res!57256 () Bool)

(assert (=> b!69304 (=> res!57256 e!45250)))

(declare-fun length!352 (List!724) Int)

(assert (=> b!69304 (= res!57256 (<= (length!352 lt!111137) 0))))

(declare-fun b!69305 () Bool)

(declare-fun res!57262 () Bool)

(assert (=> b!69305 (=> res!57262 e!45253)))

(assert (=> b!69305 (= res!57262 (not (invariant!0 (currentBit!3425 (_2!3137 lt!111130)) (currentByte!3430 (_2!3137 lt!111130)) (size!1347 (buf!1728 (_2!3137 lt!111142))))))))

(declare-fun b!69306 () Bool)

(assert (=> b!69306 (= e!45263 e!45253)))

(declare-fun res!57259 () Bool)

(assert (=> b!69306 (=> res!57259 e!45253)))

(assert (=> b!69306 (= res!57259 (not (= (size!1347 (buf!1728 (_2!3137 lt!111130))) (size!1347 (buf!1728 (_2!3137 lt!111142))))))))

(assert (=> b!69306 (= lt!111129 (bvsub (bvsub (bvadd lt!111147 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!69306 (= lt!111147 (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111130))) (currentByte!3430 (_2!3137 lt!111130)) (currentBit!3425 (_2!3137 lt!111130))))))

(assert (=> b!69306 (= (size!1347 (buf!1728 (_2!3137 lt!111142))) (size!1347 (buf!1728 thiss!1379)))))

(declare-fun b!69307 () Bool)

(assert (=> b!69307 (= e!45250 e!45262)))

(declare-fun res!57261 () Bool)

(assert (=> b!69307 (=> res!57261 e!45262)))

(declare-fun lt!111132 () List!724)

(assert (=> b!69307 (= res!57261 (not (= lt!111132 lt!111140)))))

(assert (=> b!69307 (= lt!111140 lt!111132)))

(declare-fun tail!328 (List!724) List!724)

(assert (=> b!69307 (= lt!111132 (tail!328 lt!111137))))

(declare-fun lt!111143 () Unit!4651)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2298 BitStream!2298 BitStream!2298 BitStream!2298 (_ BitVec 64) List!724) Unit!4651)

(assert (=> b!69307 (= lt!111143 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3137 lt!111142) (_2!3137 lt!111142) (_1!3138 lt!111136) (_1!3138 lt!111133) (bvsub to!314 i!635) lt!111137))))

(assert (= (and start!13520 res!57255) b!69295))

(assert (= (and b!69295 res!57252) b!69296))

(assert (= (and b!69296 (not res!57253)) b!69292))

(assert (= (and b!69292 (not res!57250)) b!69290))

(assert (= (and b!69290 res!57260) b!69303))

(assert (= (and b!69290 (not res!57249)) b!69291))

(assert (= (and b!69291 (not res!57267)) b!69294))

(assert (= (and b!69294 (not res!57263)) b!69288))

(assert (= (and b!69288 (not res!57251)) b!69306))

(assert (= (and b!69306 (not res!57259)) b!69299))

(assert (= (and b!69299 (not res!57254)) b!69305))

(assert (= (and b!69305 (not res!57262)) b!69301))

(assert (= (and b!69301 (not res!57257)) b!69304))

(assert (= (and b!69304 (not res!57256)) b!69307))

(assert (= (and b!69307 (not res!57261)) b!69302))

(assert (= (and b!69302 (not res!57258)) b!69293))

(assert (= (and b!69293 (not res!57266)) b!69289))

(assert (= (and b!69289 (not res!57264)) b!69298))

(assert (= (and b!69298 (not res!57265)) b!69297))

(assert (= start!13520 b!69300))

(declare-fun m!110769 () Bool)

(assert (=> b!69302 m!110769))

(declare-fun m!110771 () Bool)

(assert (=> b!69302 m!110771))

(declare-fun m!110773 () Bool)

(assert (=> b!69293 m!110773))

(declare-fun m!110775 () Bool)

(assert (=> b!69291 m!110775))

(declare-fun m!110777 () Bool)

(assert (=> b!69301 m!110777))

(declare-fun m!110779 () Bool)

(assert (=> b!69301 m!110779))

(declare-fun m!110781 () Bool)

(assert (=> b!69301 m!110781))

(declare-fun m!110783 () Bool)

(assert (=> b!69301 m!110783))

(declare-fun m!110785 () Bool)

(assert (=> b!69301 m!110785))

(declare-fun m!110787 () Bool)

(assert (=> b!69301 m!110787))

(declare-fun m!110789 () Bool)

(assert (=> b!69301 m!110789))

(declare-fun m!110791 () Bool)

(assert (=> b!69301 m!110791))

(declare-fun m!110793 () Bool)

(assert (=> b!69294 m!110793))

(declare-fun m!110795 () Bool)

(assert (=> b!69299 m!110795))

(declare-fun m!110797 () Bool)

(assert (=> b!69303 m!110797))

(assert (=> b!69303 m!110797))

(declare-fun m!110799 () Bool)

(assert (=> b!69303 m!110799))

(declare-fun m!110801 () Bool)

(assert (=> b!69303 m!110801))

(assert (=> b!69303 m!110801))

(declare-fun m!110803 () Bool)

(assert (=> b!69303 m!110803))

(declare-fun m!110805 () Bool)

(assert (=> b!69306 m!110805))

(declare-fun m!110807 () Bool)

(assert (=> b!69292 m!110807))

(declare-fun m!110809 () Bool)

(assert (=> b!69292 m!110809))

(declare-fun m!110811 () Bool)

(assert (=> b!69292 m!110811))

(assert (=> b!69292 m!110809))

(declare-fun m!110813 () Bool)

(assert (=> b!69292 m!110813))

(declare-fun m!110815 () Bool)

(assert (=> b!69292 m!110815))

(declare-fun m!110817 () Bool)

(assert (=> b!69295 m!110817))

(declare-fun m!110819 () Bool)

(assert (=> b!69307 m!110819))

(declare-fun m!110821 () Bool)

(assert (=> b!69307 m!110821))

(declare-fun m!110823 () Bool)

(assert (=> b!69289 m!110823))

(assert (=> b!69289 m!110823))

(declare-fun m!110825 () Bool)

(assert (=> b!69289 m!110825))

(declare-fun m!110827 () Bool)

(assert (=> b!69289 m!110827))

(declare-fun m!110829 () Bool)

(assert (=> b!69304 m!110829))

(declare-fun m!110831 () Bool)

(assert (=> b!69300 m!110831))

(declare-fun m!110833 () Bool)

(assert (=> b!69296 m!110833))

(declare-fun m!110835 () Bool)

(assert (=> b!69296 m!110835))

(declare-fun m!110837 () Bool)

(assert (=> b!69296 m!110837))

(declare-fun m!110839 () Bool)

(assert (=> b!69305 m!110839))

(declare-fun m!110841 () Bool)

(assert (=> b!69290 m!110841))

(declare-fun m!110843 () Bool)

(assert (=> b!69290 m!110843))

(declare-fun m!110845 () Bool)

(assert (=> b!69290 m!110845))

(declare-fun m!110847 () Bool)

(assert (=> b!69290 m!110847))

(declare-fun m!110849 () Bool)

(assert (=> b!69290 m!110849))

(declare-fun m!110851 () Bool)

(assert (=> b!69290 m!110851))

(declare-fun m!110853 () Bool)

(assert (=> b!69290 m!110853))

(declare-fun m!110855 () Bool)

(assert (=> start!13520 m!110855))

(declare-fun m!110857 () Bool)

(assert (=> start!13520 m!110857))

(declare-fun m!110859 () Bool)

(assert (=> b!69298 m!110859))

(check-sat (not b!69295) (not b!69303) (not b!69294) (not b!69296) (not b!69302) (not b!69300) (not b!69290) (not b!69298) (not start!13520) (not b!69291) (not b!69293) (not b!69301) (not b!69304) (not b!69289) (not b!69299) (not b!69292) (not b!69306) (not b!69307) (not b!69305))
(check-sat)
(get-model)

(declare-fun d!22116 () Bool)

(declare-fun res!57332 () Bool)

(declare-fun e!45310 () Bool)

(assert (=> d!22116 (=> (not res!57332) (not e!45310))))

(assert (=> d!22116 (= res!57332 (= (size!1347 (buf!1728 thiss!1379)) (size!1347 (buf!1728 thiss!1379))))))

(assert (=> d!22116 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!45310)))

(declare-fun b!69374 () Bool)

(declare-fun res!57333 () Bool)

(assert (=> b!69374 (=> (not res!57333) (not e!45310))))

(assert (=> b!69374 (= res!57333 (bvsle (bitIndex!0 (size!1347 (buf!1728 thiss!1379)) (currentByte!3430 thiss!1379) (currentBit!3425 thiss!1379)) (bitIndex!0 (size!1347 (buf!1728 thiss!1379)) (currentByte!3430 thiss!1379) (currentBit!3425 thiss!1379))))))

(declare-fun b!69375 () Bool)

(declare-fun e!45311 () Bool)

(assert (=> b!69375 (= e!45310 e!45311)))

(declare-fun res!57331 () Bool)

(assert (=> b!69375 (=> res!57331 e!45311)))

(assert (=> b!69375 (= res!57331 (= (size!1347 (buf!1728 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!69376 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2901 array!2901 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!69376 (= e!45311 (arrayBitRangesEq!0 (buf!1728 thiss!1379) (buf!1728 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1347 (buf!1728 thiss!1379)) (currentByte!3430 thiss!1379) (currentBit!3425 thiss!1379))))))

(assert (= (and d!22116 res!57332) b!69374))

(assert (= (and b!69374 res!57333) b!69375))

(assert (= (and b!69375 (not res!57331)) b!69376))

(assert (=> b!69374 m!110837))

(assert (=> b!69374 m!110837))

(assert (=> b!69376 m!110837))

(assert (=> b!69376 m!110837))

(declare-fun m!110953 () Bool)

(assert (=> b!69376 m!110953))

(assert (=> b!69296 d!22116))

(declare-fun d!22118 () Bool)

(assert (=> d!22118 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!111214 () Unit!4651)

(declare-fun choose!11 (BitStream!2298) Unit!4651)

(assert (=> d!22118 (= lt!111214 (choose!11 thiss!1379))))

(assert (=> d!22118 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!111214)))

(declare-fun bs!5329 () Bool)

(assert (= bs!5329 d!22118))

(assert (=> bs!5329 m!110833))

(declare-fun m!110955 () Bool)

(assert (=> bs!5329 m!110955))

(assert (=> b!69296 d!22118))

(declare-fun d!22120 () Bool)

(declare-fun e!45314 () Bool)

(assert (=> d!22120 e!45314))

(declare-fun res!57338 () Bool)

(assert (=> d!22120 (=> (not res!57338) (not e!45314))))

(declare-fun lt!111230 () (_ BitVec 64))

(declare-fun lt!111229 () (_ BitVec 64))

(declare-fun lt!111228 () (_ BitVec 64))

(assert (=> d!22120 (= res!57338 (= lt!111230 (bvsub lt!111228 lt!111229)))))

(assert (=> d!22120 (or (= (bvand lt!111228 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!111229 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!111228 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!111228 lt!111229) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!22120 (= lt!111229 (remainingBits!0 ((_ sign_extend 32) (size!1347 (buf!1728 thiss!1379))) ((_ sign_extend 32) (currentByte!3430 thiss!1379)) ((_ sign_extend 32) (currentBit!3425 thiss!1379))))))

(declare-fun lt!111231 () (_ BitVec 64))

(declare-fun lt!111232 () (_ BitVec 64))

(assert (=> d!22120 (= lt!111228 (bvmul lt!111231 lt!111232))))

(assert (=> d!22120 (or (= lt!111231 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!111232 (bvsdiv (bvmul lt!111231 lt!111232) lt!111231)))))

(assert (=> d!22120 (= lt!111232 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22120 (= lt!111231 ((_ sign_extend 32) (size!1347 (buf!1728 thiss!1379))))))

(assert (=> d!22120 (= lt!111230 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3430 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3425 thiss!1379))))))

(assert (=> d!22120 (invariant!0 (currentBit!3425 thiss!1379) (currentByte!3430 thiss!1379) (size!1347 (buf!1728 thiss!1379)))))

(assert (=> d!22120 (= (bitIndex!0 (size!1347 (buf!1728 thiss!1379)) (currentByte!3430 thiss!1379) (currentBit!3425 thiss!1379)) lt!111230)))

(declare-fun b!69381 () Bool)

(declare-fun res!57339 () Bool)

(assert (=> b!69381 (=> (not res!57339) (not e!45314))))

(assert (=> b!69381 (= res!57339 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!111230))))

(declare-fun b!69382 () Bool)

(declare-fun lt!111227 () (_ BitVec 64))

(assert (=> b!69382 (= e!45314 (bvsle lt!111230 (bvmul lt!111227 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!69382 (or (= lt!111227 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!111227 #b0000000000000000000000000000000000000000000000000000000000001000) lt!111227)))))

(assert (=> b!69382 (= lt!111227 ((_ sign_extend 32) (size!1347 (buf!1728 thiss!1379))))))

(assert (= (and d!22120 res!57338) b!69381))

(assert (= (and b!69381 res!57339) b!69382))

(declare-fun m!110957 () Bool)

(assert (=> d!22120 m!110957))

(declare-fun m!110959 () Bool)

(assert (=> d!22120 m!110959))

(assert (=> b!69296 d!22120))

(declare-fun d!22122 () Bool)

(assert (=> d!22122 (= (tail!328 lt!111137) (t!1474 lt!111137))))

(assert (=> b!69307 d!22122))

(declare-fun d!22124 () Bool)

(declare-fun e!45317 () Bool)

(assert (=> d!22124 e!45317))

(declare-fun res!57342 () Bool)

(assert (=> d!22124 (=> (not res!57342) (not e!45317))))

(declare-fun lt!111238 () (_ BitVec 64))

(assert (=> d!22124 (= res!57342 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!111238 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!111238) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!22124 (= lt!111238 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!111237 () Unit!4651)

(declare-fun choose!42 (BitStream!2298 BitStream!2298 BitStream!2298 BitStream!2298 (_ BitVec 64) List!724) Unit!4651)

(assert (=> d!22124 (= lt!111237 (choose!42 (_2!3137 lt!111142) (_2!3137 lt!111142) (_1!3138 lt!111136) (_1!3138 lt!111133) (bvsub to!314 i!635) lt!111137))))

(assert (=> d!22124 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22124 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3137 lt!111142) (_2!3137 lt!111142) (_1!3138 lt!111136) (_1!3138 lt!111133) (bvsub to!314 i!635) lt!111137) lt!111237)))

(declare-fun b!69385 () Bool)

(assert (=> b!69385 (= e!45317 (= (bitStreamReadBitsIntoList!0 (_2!3137 lt!111142) (_1!3138 lt!111133) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!328 lt!111137)))))

(assert (= (and d!22124 res!57342) b!69385))

(declare-fun m!110961 () Bool)

(assert (=> d!22124 m!110961))

(declare-fun m!110963 () Bool)

(assert (=> b!69385 m!110963))

(assert (=> b!69385 m!110819))

(assert (=> b!69307 d!22124))

(declare-fun d!22126 () Bool)

(assert (=> d!22126 (= (bitAt!0 (buf!1728 (_2!3137 lt!111130)) lt!111134) (not (= (bvand ((_ sign_extend 24) (select (arr!1926 (buf!1728 (_2!3137 lt!111130))) ((_ extract 31 0) (bvsdiv lt!111134 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!111134 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5330 () Bool)

(assert (= bs!5330 d!22126))

(declare-fun m!110965 () Bool)

(assert (=> bs!5330 m!110965))

(declare-fun m!110967 () Bool)

(assert (=> bs!5330 m!110967))

(assert (=> b!69298 d!22126))

(declare-fun d!22128 () Bool)

(assert (=> d!22128 (= (array_inv!1208 srcBuffer!2) (bvsge (size!1347 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13520 d!22128))

(declare-fun d!22130 () Bool)

(assert (=> d!22130 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3425 thiss!1379) (currentByte!3430 thiss!1379) (size!1347 (buf!1728 thiss!1379))))))

(declare-fun bs!5331 () Bool)

(assert (= bs!5331 d!22130))

(assert (=> bs!5331 m!110959))

(assert (=> start!13520 d!22130))

(declare-fun d!22132 () Bool)

(assert (=> d!22132 (= (invariant!0 (currentBit!3425 (_2!3137 lt!111142)) (currentByte!3430 (_2!3137 lt!111142)) (size!1347 (buf!1728 (_2!3137 lt!111142)))) (and (bvsge (currentBit!3425 (_2!3137 lt!111142)) #b00000000000000000000000000000000) (bvslt (currentBit!3425 (_2!3137 lt!111142)) #b00000000000000000000000000001000) (bvsge (currentByte!3430 (_2!3137 lt!111142)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3430 (_2!3137 lt!111142)) (size!1347 (buf!1728 (_2!3137 lt!111142)))) (and (= (currentBit!3425 (_2!3137 lt!111142)) #b00000000000000000000000000000000) (= (currentByte!3430 (_2!3137 lt!111142)) (size!1347 (buf!1728 (_2!3137 lt!111142))))))))))

(assert (=> b!69294 d!22132))

(declare-fun d!22134 () Bool)

(assert (=> d!22134 (= (invariant!0 (currentBit!3425 (_2!3137 lt!111130)) (currentByte!3430 (_2!3137 lt!111130)) (size!1347 (buf!1728 (_2!3137 lt!111142)))) (and (bvsge (currentBit!3425 (_2!3137 lt!111130)) #b00000000000000000000000000000000) (bvslt (currentBit!3425 (_2!3137 lt!111130)) #b00000000000000000000000000001000) (bvsge (currentByte!3430 (_2!3137 lt!111130)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3430 (_2!3137 lt!111130)) (size!1347 (buf!1728 (_2!3137 lt!111142)))) (and (= (currentBit!3425 (_2!3137 lt!111130)) #b00000000000000000000000000000000) (= (currentByte!3430 (_2!3137 lt!111130)) (size!1347 (buf!1728 (_2!3137 lt!111142))))))))))

(assert (=> b!69305 d!22134))

(declare-fun d!22136 () Bool)

(declare-fun size!1349 (List!724) Int)

(assert (=> d!22136 (= (length!352 lt!111137) (size!1349 lt!111137))))

(declare-fun bs!5332 () Bool)

(assert (= bs!5332 d!22136))

(declare-fun m!110969 () Bool)

(assert (=> bs!5332 m!110969))

(assert (=> b!69304 d!22136))

(declare-fun d!22138 () Bool)

(declare-fun e!45318 () Bool)

(assert (=> d!22138 e!45318))

(declare-fun res!57343 () Bool)

(assert (=> d!22138 (=> (not res!57343) (not e!45318))))

(declare-fun lt!111242 () (_ BitVec 64))

(declare-fun lt!111240 () (_ BitVec 64))

(declare-fun lt!111241 () (_ BitVec 64))

(assert (=> d!22138 (= res!57343 (= lt!111242 (bvsub lt!111240 lt!111241)))))

(assert (=> d!22138 (or (= (bvand lt!111240 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!111241 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!111240 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!111240 lt!111241) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22138 (= lt!111241 (remainingBits!0 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111130)))) ((_ sign_extend 32) (currentByte!3430 (_2!3137 lt!111130))) ((_ sign_extend 32) (currentBit!3425 (_2!3137 lt!111130)))))))

(declare-fun lt!111243 () (_ BitVec 64))

(declare-fun lt!111244 () (_ BitVec 64))

(assert (=> d!22138 (= lt!111240 (bvmul lt!111243 lt!111244))))

(assert (=> d!22138 (or (= lt!111243 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!111244 (bvsdiv (bvmul lt!111243 lt!111244) lt!111243)))))

(assert (=> d!22138 (= lt!111244 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22138 (= lt!111243 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111130)))))))

(assert (=> d!22138 (= lt!111242 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3430 (_2!3137 lt!111130))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3425 (_2!3137 lt!111130)))))))

(assert (=> d!22138 (invariant!0 (currentBit!3425 (_2!3137 lt!111130)) (currentByte!3430 (_2!3137 lt!111130)) (size!1347 (buf!1728 (_2!3137 lt!111130))))))

(assert (=> d!22138 (= (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111130))) (currentByte!3430 (_2!3137 lt!111130)) (currentBit!3425 (_2!3137 lt!111130))) lt!111242)))

(declare-fun b!69386 () Bool)

(declare-fun res!57344 () Bool)

(assert (=> b!69386 (=> (not res!57344) (not e!45318))))

(assert (=> b!69386 (= res!57344 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!111242))))

(declare-fun b!69387 () Bool)

(declare-fun lt!111239 () (_ BitVec 64))

(assert (=> b!69387 (= e!45318 (bvsle lt!111242 (bvmul lt!111239 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!69387 (or (= lt!111239 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!111239 #b0000000000000000000000000000000000000000000000000000000000001000) lt!111239)))))

(assert (=> b!69387 (= lt!111239 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111130)))))))

(assert (= (and d!22138 res!57343) b!69386))

(assert (= (and b!69386 res!57344) b!69387))

(declare-fun m!110971 () Bool)

(assert (=> d!22138 m!110971))

(assert (=> d!22138 m!110795))

(assert (=> b!69306 d!22138))

(declare-fun d!22140 () Bool)

(assert (=> d!22140 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1347 (buf!1728 thiss!1379))) ((_ sign_extend 32) (currentByte!3430 thiss!1379)) ((_ sign_extend 32) (currentBit!3425 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1347 (buf!1728 thiss!1379))) ((_ sign_extend 32) (currentByte!3430 thiss!1379)) ((_ sign_extend 32) (currentBit!3425 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5333 () Bool)

(assert (= bs!5333 d!22140))

(assert (=> bs!5333 m!110957))

(assert (=> b!69295 d!22140))

(declare-fun d!22142 () Bool)

(assert (=> d!22142 (= (bitAt!0 (buf!1728 (_1!3138 lt!111133)) lt!111134) (not (= (bvand ((_ sign_extend 24) (select (arr!1926 (buf!1728 (_1!3138 lt!111133))) ((_ extract 31 0) (bvsdiv lt!111134 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!111134 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5334 () Bool)

(assert (= bs!5334 d!22142))

(declare-fun m!110973 () Bool)

(assert (=> bs!5334 m!110973))

(assert (=> bs!5334 m!110967))

(assert (=> b!69302 d!22142))

(declare-fun d!22144 () Bool)

(assert (=> d!22144 (= (bitAt!0 (buf!1728 (_1!3138 lt!111136)) lt!111134) (not (= (bvand ((_ sign_extend 24) (select (arr!1926 (buf!1728 (_1!3138 lt!111136))) ((_ extract 31 0) (bvsdiv lt!111134 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!111134 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5335 () Bool)

(assert (= bs!5335 d!22144))

(declare-fun m!110975 () Bool)

(assert (=> bs!5335 m!110975))

(assert (=> bs!5335 m!110967))

(assert (=> b!69302 d!22144))

(declare-fun d!22146 () Bool)

(declare-fun e!45319 () Bool)

(assert (=> d!22146 e!45319))

(declare-fun res!57345 () Bool)

(assert (=> d!22146 (=> (not res!57345) (not e!45319))))

(declare-fun lt!111246 () (_ BitVec 64))

(declare-fun lt!111247 () (_ BitVec 64))

(declare-fun lt!111248 () (_ BitVec 64))

(assert (=> d!22146 (= res!57345 (= lt!111248 (bvsub lt!111246 lt!111247)))))

(assert (=> d!22146 (or (= (bvand lt!111246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!111247 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!111246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!111246 lt!111247) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22146 (= lt!111247 (remainingBits!0 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111142)))) ((_ sign_extend 32) (currentByte!3430 (_2!3137 lt!111142))) ((_ sign_extend 32) (currentBit!3425 (_2!3137 lt!111142)))))))

(declare-fun lt!111249 () (_ BitVec 64))

(declare-fun lt!111250 () (_ BitVec 64))

(assert (=> d!22146 (= lt!111246 (bvmul lt!111249 lt!111250))))

(assert (=> d!22146 (or (= lt!111249 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!111250 (bvsdiv (bvmul lt!111249 lt!111250) lt!111249)))))

(assert (=> d!22146 (= lt!111250 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22146 (= lt!111249 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111142)))))))

(assert (=> d!22146 (= lt!111248 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3430 (_2!3137 lt!111142))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3425 (_2!3137 lt!111142)))))))

(assert (=> d!22146 (invariant!0 (currentBit!3425 (_2!3137 lt!111142)) (currentByte!3430 (_2!3137 lt!111142)) (size!1347 (buf!1728 (_2!3137 lt!111142))))))

(assert (=> d!22146 (= (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111142))) (currentByte!3430 (_2!3137 lt!111142)) (currentBit!3425 (_2!3137 lt!111142))) lt!111248)))

(declare-fun b!69388 () Bool)

(declare-fun res!57346 () Bool)

(assert (=> b!69388 (=> (not res!57346) (not e!45319))))

(assert (=> b!69388 (= res!57346 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!111248))))

(declare-fun b!69389 () Bool)

(declare-fun lt!111245 () (_ BitVec 64))

(assert (=> b!69389 (= e!45319 (bvsle lt!111248 (bvmul lt!111245 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!69389 (or (= lt!111245 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!111245 #b0000000000000000000000000000000000000000000000000000000000001000) lt!111245)))))

(assert (=> b!69389 (= lt!111245 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111142)))))))

(assert (= (and d!22146 res!57345) b!69388))

(assert (= (and b!69388 res!57346) b!69389))

(declare-fun m!110977 () Bool)

(assert (=> d!22146 m!110977))

(assert (=> d!22146 m!110793))

(assert (=> b!69291 d!22146))

(declare-fun d!22148 () Bool)

(assert (=> d!22148 (= (head!543 lt!111137) (h!839 lt!111137))))

(assert (=> b!69293 d!22148))

(declare-fun d!22150 () Bool)

(declare-fun res!57348 () Bool)

(declare-fun e!45320 () Bool)

(assert (=> d!22150 (=> (not res!57348) (not e!45320))))

(assert (=> d!22150 (= res!57348 (= (size!1347 (buf!1728 thiss!1379)) (size!1347 (buf!1728 (_2!3137 lt!111130)))))))

(assert (=> d!22150 (= (isPrefixOf!0 thiss!1379 (_2!3137 lt!111130)) e!45320)))

(declare-fun b!69390 () Bool)

(declare-fun res!57349 () Bool)

(assert (=> b!69390 (=> (not res!57349) (not e!45320))))

(assert (=> b!69390 (= res!57349 (bvsle (bitIndex!0 (size!1347 (buf!1728 thiss!1379)) (currentByte!3430 thiss!1379) (currentBit!3425 thiss!1379)) (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111130))) (currentByte!3430 (_2!3137 lt!111130)) (currentBit!3425 (_2!3137 lt!111130)))))))

(declare-fun b!69391 () Bool)

(declare-fun e!45321 () Bool)

(assert (=> b!69391 (= e!45320 e!45321)))

(declare-fun res!57347 () Bool)

(assert (=> b!69391 (=> res!57347 e!45321)))

(assert (=> b!69391 (= res!57347 (= (size!1347 (buf!1728 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!69392 () Bool)

(assert (=> b!69392 (= e!45321 (arrayBitRangesEq!0 (buf!1728 thiss!1379) (buf!1728 (_2!3137 lt!111130)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1347 (buf!1728 thiss!1379)) (currentByte!3430 thiss!1379) (currentBit!3425 thiss!1379))))))

(assert (= (and d!22150 res!57348) b!69390))

(assert (= (and b!69390 res!57349) b!69391))

(assert (= (and b!69391 (not res!57347)) b!69392))

(assert (=> b!69390 m!110837))

(assert (=> b!69390 m!110805))

(assert (=> b!69392 m!110837))

(assert (=> b!69392 m!110837))

(declare-fun m!110979 () Bool)

(assert (=> b!69392 m!110979))

(assert (=> b!69292 d!22150))

(declare-fun d!22152 () Bool)

(assert (=> d!22152 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111130)))) ((_ sign_extend 32) (currentByte!3430 (_2!3137 lt!111130))) ((_ sign_extend 32) (currentBit!3425 (_2!3137 lt!111130))) lt!111145) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111130)))) ((_ sign_extend 32) (currentByte!3430 (_2!3137 lt!111130))) ((_ sign_extend 32) (currentBit!3425 (_2!3137 lt!111130)))) lt!111145))))

(declare-fun bs!5336 () Bool)

(assert (= bs!5336 d!22152))

(assert (=> bs!5336 m!110971))

(assert (=> b!69292 d!22152))

(declare-fun d!22154 () Bool)

(declare-fun e!45324 () Bool)

(assert (=> d!22154 e!45324))

(declare-fun res!57352 () Bool)

(assert (=> d!22154 (=> (not res!57352) (not e!45324))))

(assert (=> d!22154 (= res!57352 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!111253 () Unit!4651)

(declare-fun choose!27 (BitStream!2298 BitStream!2298 (_ BitVec 64) (_ BitVec 64)) Unit!4651)

(assert (=> d!22154 (= lt!111253 (choose!27 thiss!1379 (_2!3137 lt!111130) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!22154 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!22154 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3137 lt!111130) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!111253)))

(declare-fun b!69395 () Bool)

(assert (=> b!69395 (= e!45324 (validate_offset_bits!1 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111130)))) ((_ sign_extend 32) (currentByte!3430 (_2!3137 lt!111130))) ((_ sign_extend 32) (currentBit!3425 (_2!3137 lt!111130))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!22154 res!57352) b!69395))

(declare-fun m!110981 () Bool)

(assert (=> d!22154 m!110981))

(declare-fun m!110983 () Bool)

(assert (=> b!69395 m!110983))

(assert (=> b!69292 d!22154))

(declare-fun b!69413 () Bool)

(declare-fun e!45334 () Bool)

(declare-datatypes ((tuple2!6060 0))(
  ( (tuple2!6061 (_1!3141 BitStream!2298) (_2!3141 Bool)) )
))
(declare-fun lt!111284 () tuple2!6060)

(declare-fun lt!111288 () tuple2!6052)

(assert (=> b!69413 (= e!45334 (= (bitIndex!0 (size!1347 (buf!1728 (_1!3141 lt!111284))) (currentByte!3430 (_1!3141 lt!111284)) (currentBit!3425 (_1!3141 lt!111284))) (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111288))) (currentByte!3430 (_2!3137 lt!111288)) (currentBit!3425 (_2!3137 lt!111288)))))))

(declare-fun b!69414 () Bool)

(declare-fun e!45333 () Bool)

(assert (=> b!69414 (= e!45333 e!45334)))

(declare-fun res!57372 () Bool)

(assert (=> b!69414 (=> (not res!57372) (not e!45334))))

(declare-fun lt!111286 () Bool)

(assert (=> b!69414 (= res!57372 (and (= (_2!3141 lt!111284) lt!111286) (= (_1!3141 lt!111284) (_2!3137 lt!111288))))))

(declare-fun readBitPure!0 (BitStream!2298) tuple2!6060)

(declare-fun readerFrom!0 (BitStream!2298 (_ BitVec 32) (_ BitVec 32)) BitStream!2298)

(assert (=> b!69414 (= lt!111284 (readBitPure!0 (readerFrom!0 (_2!3137 lt!111288) (currentBit!3425 thiss!1379) (currentByte!3430 thiss!1379))))))

(declare-fun b!69415 () Bool)

(declare-fun e!45335 () Bool)

(declare-fun e!45336 () Bool)

(assert (=> b!69415 (= e!45335 e!45336)))

(declare-fun res!57371 () Bool)

(assert (=> b!69415 (=> (not res!57371) (not e!45336))))

(declare-fun lt!111279 () tuple2!6052)

(declare-fun lt!111280 () (_ BitVec 8))

(declare-fun lt!111282 () tuple2!6060)

(assert (=> b!69415 (= res!57371 (and (= (_2!3141 lt!111282) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1926 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!111280)) #b00000000000000000000000000000000))) (= (_1!3141 lt!111282) (_2!3137 lt!111279))))))

(declare-datatypes ((tuple2!6062 0))(
  ( (tuple2!6063 (_1!3142 array!2901) (_2!3142 BitStream!2298)) )
))
(declare-fun lt!111283 () tuple2!6062)

(declare-fun lt!111281 () BitStream!2298)

(declare-fun readBits!0 (BitStream!2298 (_ BitVec 64)) tuple2!6062)

(assert (=> b!69415 (= lt!111283 (readBits!0 lt!111281 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!69415 (= lt!111282 (readBitPure!0 lt!111281))))

(assert (=> b!69415 (= lt!111281 (readerFrom!0 (_2!3137 lt!111279) (currentBit!3425 thiss!1379) (currentByte!3430 thiss!1379)))))

(declare-fun b!69416 () Bool)

(assert (=> b!69416 (= e!45336 (= (bitIndex!0 (size!1347 (buf!1728 (_1!3141 lt!111282))) (currentByte!3430 (_1!3141 lt!111282)) (currentBit!3425 (_1!3141 lt!111282))) (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111279))) (currentByte!3430 (_2!3137 lt!111279)) (currentBit!3425 (_2!3137 lt!111279)))))))

(declare-fun b!69417 () Bool)

(declare-fun res!57375 () Bool)

(assert (=> b!69417 (=> (not res!57375) (not e!45335))))

(declare-fun lt!111278 () (_ BitVec 64))

(declare-fun lt!111289 () (_ BitVec 64))

(assert (=> b!69417 (= res!57375 (= (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111279))) (currentByte!3430 (_2!3137 lt!111279)) (currentBit!3425 (_2!3137 lt!111279))) (bvadd lt!111289 lt!111278)))))

(assert (=> b!69417 (or (not (= (bvand lt!111289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!111278 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!111289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!111289 lt!111278) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69417 (= lt!111278 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!69417 (= lt!111289 (bitIndex!0 (size!1347 (buf!1728 thiss!1379)) (currentByte!3430 thiss!1379) (currentBit!3425 thiss!1379)))))

(declare-fun b!69418 () Bool)

(declare-fun res!57373 () Bool)

(assert (=> b!69418 (=> (not res!57373) (not e!45333))))

(assert (=> b!69418 (= res!57373 (isPrefixOf!0 thiss!1379 (_2!3137 lt!111288)))))

(declare-fun b!69419 () Bool)

(declare-fun res!57374 () Bool)

(assert (=> b!69419 (=> (not res!57374) (not e!45333))))

(assert (=> b!69419 (= res!57374 (= (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111288))) (currentByte!3430 (_2!3137 lt!111288)) (currentBit!3425 (_2!3137 lt!111288))) (bvadd (bitIndex!0 (size!1347 (buf!1728 thiss!1379)) (currentByte!3430 thiss!1379) (currentBit!3425 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!22156 () Bool)

(assert (=> d!22156 e!45335))

(declare-fun res!57376 () Bool)

(assert (=> d!22156 (=> (not res!57376) (not e!45335))))

(assert (=> d!22156 (= res!57376 (= (size!1347 (buf!1728 (_2!3137 lt!111279))) (size!1347 (buf!1728 thiss!1379))))))

(declare-fun lt!111287 () array!2901)

(assert (=> d!22156 (= lt!111280 (select (arr!1926 lt!111287) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!22156 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1347 lt!111287)))))

(assert (=> d!22156 (= lt!111287 (array!2902 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!111285 () tuple2!6052)

(assert (=> d!22156 (= lt!111279 (tuple2!6053 (_1!3137 lt!111285) (_2!3137 lt!111285)))))

(assert (=> d!22156 (= lt!111285 lt!111288)))

(assert (=> d!22156 e!45333))

(declare-fun res!57369 () Bool)

(assert (=> d!22156 (=> (not res!57369) (not e!45333))))

(assert (=> d!22156 (= res!57369 (= (size!1347 (buf!1728 thiss!1379)) (size!1347 (buf!1728 (_2!3137 lt!111288)))))))

(declare-fun appendBit!0 (BitStream!2298 Bool) tuple2!6052)

(assert (=> d!22156 (= lt!111288 (appendBit!0 thiss!1379 lt!111286))))

(assert (=> d!22156 (= lt!111286 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1926 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!22156 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!22156 (= (appendBitFromByte!0 thiss!1379 (select (arr!1926 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!111279)))

(declare-fun b!69420 () Bool)

(declare-fun res!57370 () Bool)

(assert (=> b!69420 (=> (not res!57370) (not e!45335))))

(assert (=> b!69420 (= res!57370 (isPrefixOf!0 thiss!1379 (_2!3137 lt!111279)))))

(assert (= (and d!22156 res!57369) b!69419))

(assert (= (and b!69419 res!57374) b!69418))

(assert (= (and b!69418 res!57373) b!69414))

(assert (= (and b!69414 res!57372) b!69413))

(assert (= (and d!22156 res!57376) b!69417))

(assert (= (and b!69417 res!57375) b!69420))

(assert (= (and b!69420 res!57370) b!69415))

(assert (= (and b!69415 res!57371) b!69416))

(declare-fun m!110985 () Bool)

(assert (=> b!69417 m!110985))

(assert (=> b!69417 m!110837))

(declare-fun m!110987 () Bool)

(assert (=> b!69414 m!110987))

(assert (=> b!69414 m!110987))

(declare-fun m!110989 () Bool)

(assert (=> b!69414 m!110989))

(declare-fun m!110991 () Bool)

(assert (=> b!69416 m!110991))

(assert (=> b!69416 m!110985))

(declare-fun m!110993 () Bool)

(assert (=> b!69418 m!110993))

(declare-fun m!110995 () Bool)

(assert (=> b!69415 m!110995))

(declare-fun m!110997 () Bool)

(assert (=> b!69415 m!110997))

(declare-fun m!110999 () Bool)

(assert (=> b!69415 m!110999))

(declare-fun m!111001 () Bool)

(assert (=> d!22156 m!111001))

(declare-fun m!111003 () Bool)

(assert (=> d!22156 m!111003))

(declare-fun m!111005 () Bool)

(assert (=> d!22156 m!111005))

(declare-fun m!111007 () Bool)

(assert (=> b!69419 m!111007))

(assert (=> b!69419 m!110837))

(declare-fun m!111009 () Bool)

(assert (=> b!69420 m!111009))

(declare-fun m!111011 () Bool)

(assert (=> b!69413 m!111011))

(assert (=> b!69413 m!111007))

(assert (=> b!69292 d!22156))

(declare-fun d!22158 () Bool)

(assert (=> d!22158 (= (head!543 (byteArrayBitContentToList!0 (_2!3137 lt!111130) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!839 (byteArrayBitContentToList!0 (_2!3137 lt!111130) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!69303 d!22158))

(declare-fun d!22160 () Bool)

(declare-fun c!5127 () Bool)

(assert (=> d!22160 (= c!5127 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!45339 () List!724)

(assert (=> d!22160 (= (byteArrayBitContentToList!0 (_2!3137 lt!111130) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!45339)))

(declare-fun b!69425 () Bool)

(assert (=> b!69425 (= e!45339 Nil!721)))

(declare-fun b!69426 () Bool)

(assert (=> b!69426 (= e!45339 (Cons!720 (not (= (bvand ((_ sign_extend 24) (select (arr!1926 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3137 lt!111130) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!22160 c!5127) b!69425))

(assert (= (and d!22160 (not c!5127)) b!69426))

(assert (=> b!69426 m!110809))

(assert (=> b!69426 m!111005))

(declare-fun m!111013 () Bool)

(assert (=> b!69426 m!111013))

(assert (=> b!69303 d!22160))

(declare-fun d!22162 () Bool)

(assert (=> d!22162 (= (head!543 (bitStreamReadBitsIntoList!0 (_2!3137 lt!111130) (_1!3138 lt!111131) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!839 (bitStreamReadBitsIntoList!0 (_2!3137 lt!111130) (_1!3138 lt!111131) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!69303 d!22162))

(declare-fun b!69437 () Bool)

(declare-fun e!45345 () Bool)

(declare-fun lt!111297 () List!724)

(declare-fun isEmpty!222 (List!724) Bool)

(assert (=> b!69437 (= e!45345 (isEmpty!222 lt!111297))))

(declare-fun d!22164 () Bool)

(assert (=> d!22164 e!45345))

(declare-fun c!5132 () Bool)

(assert (=> d!22164 (= c!5132 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6064 0))(
  ( (tuple2!6065 (_1!3143 List!724) (_2!3143 BitStream!2298)) )
))
(declare-fun e!45344 () tuple2!6064)

(assert (=> d!22164 (= lt!111297 (_1!3143 e!45344))))

(declare-fun c!5133 () Bool)

(assert (=> d!22164 (= c!5133 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22164 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22164 (= (bitStreamReadBitsIntoList!0 (_2!3137 lt!111130) (_1!3138 lt!111131) #b0000000000000000000000000000000000000000000000000000000000000001) lt!111297)))

(declare-fun b!69436 () Bool)

(declare-datatypes ((tuple2!6066 0))(
  ( (tuple2!6067 (_1!3144 Bool) (_2!3144 BitStream!2298)) )
))
(declare-fun lt!111298 () tuple2!6066)

(declare-fun lt!111296 () (_ BitVec 64))

(assert (=> b!69436 (= e!45344 (tuple2!6065 (Cons!720 (_1!3144 lt!111298) (bitStreamReadBitsIntoList!0 (_2!3137 lt!111130) (_2!3144 lt!111298) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!111296))) (_2!3144 lt!111298)))))

(declare-fun readBit!0 (BitStream!2298) tuple2!6066)

(assert (=> b!69436 (= lt!111298 (readBit!0 (_1!3138 lt!111131)))))

(assert (=> b!69436 (= lt!111296 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!69435 () Bool)

(assert (=> b!69435 (= e!45344 (tuple2!6065 Nil!721 (_1!3138 lt!111131)))))

(declare-fun b!69438 () Bool)

(assert (=> b!69438 (= e!45345 (> (length!352 lt!111297) 0))))

(assert (= (and d!22164 c!5133) b!69435))

(assert (= (and d!22164 (not c!5133)) b!69436))

(assert (= (and d!22164 c!5132) b!69437))

(assert (= (and d!22164 (not c!5132)) b!69438))

(declare-fun m!111015 () Bool)

(assert (=> b!69437 m!111015))

(declare-fun m!111017 () Bool)

(assert (=> b!69436 m!111017))

(declare-fun m!111019 () Bool)

(assert (=> b!69436 m!111019))

(declare-fun m!111021 () Bool)

(assert (=> b!69438 m!111021))

(assert (=> b!69303 d!22164))

(declare-fun d!22166 () Bool)

(assert (=> d!22166 (= (head!543 (byteArrayBitContentToList!0 (_2!3137 lt!111142) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!839 (byteArrayBitContentToList!0 (_2!3137 lt!111142) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!69289 d!22166))

(declare-fun d!22168 () Bool)

(declare-fun c!5134 () Bool)

(assert (=> d!22168 (= c!5134 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!45346 () List!724)

(assert (=> d!22168 (= (byteArrayBitContentToList!0 (_2!3137 lt!111142) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!45346)))

(declare-fun b!69439 () Bool)

(assert (=> b!69439 (= e!45346 Nil!721)))

(declare-fun b!69440 () Bool)

(assert (=> b!69440 (= e!45346 (Cons!720 (not (= (bvand ((_ sign_extend 24) (select (arr!1926 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3137 lt!111142) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!22168 c!5134) b!69439))

(assert (= (and d!22168 (not c!5134)) b!69440))

(assert (=> b!69440 m!110809))

(assert (=> b!69440 m!111005))

(declare-fun m!111023 () Bool)

(assert (=> b!69440 m!111023))

(assert (=> b!69289 d!22168))

(declare-fun d!22170 () Bool)

(assert (=> d!22170 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1926 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5337 () Bool)

(assert (= bs!5337 d!22170))

(assert (=> bs!5337 m!110809))

(assert (=> bs!5337 m!111005))

(assert (=> b!69289 d!22170))

(declare-fun d!22172 () Bool)

(assert (=> d!22172 (= (invariant!0 (currentBit!3425 (_2!3137 lt!111130)) (currentByte!3430 (_2!3137 lt!111130)) (size!1347 (buf!1728 (_2!3137 lt!111130)))) (and (bvsge (currentBit!3425 (_2!3137 lt!111130)) #b00000000000000000000000000000000) (bvslt (currentBit!3425 (_2!3137 lt!111130)) #b00000000000000000000000000001000) (bvsge (currentByte!3430 (_2!3137 lt!111130)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3430 (_2!3137 lt!111130)) (size!1347 (buf!1728 (_2!3137 lt!111130)))) (and (= (currentBit!3425 (_2!3137 lt!111130)) #b00000000000000000000000000000000) (= (currentByte!3430 (_2!3137 lt!111130)) (size!1347 (buf!1728 (_2!3137 lt!111130))))))))))

(assert (=> b!69299 d!22172))

(declare-fun d!22174 () Bool)

(assert (=> d!22174 (validate_offset_bits!1 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111130)))) ((_ sign_extend 32) (currentByte!3430 thiss!1379)) ((_ sign_extend 32) (currentBit!3425 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!111301 () Unit!4651)

(declare-fun choose!9 (BitStream!2298 array!2901 (_ BitVec 64) BitStream!2298) Unit!4651)

(assert (=> d!22174 (= lt!111301 (choose!9 thiss!1379 (buf!1728 (_2!3137 lt!111130)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2299 (buf!1728 (_2!3137 lt!111130)) (currentByte!3430 thiss!1379) (currentBit!3425 thiss!1379))))))

(assert (=> d!22174 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1728 (_2!3137 lt!111130)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!111301)))

(declare-fun bs!5338 () Bool)

(assert (= bs!5338 d!22174))

(assert (=> bs!5338 m!110847))

(declare-fun m!111025 () Bool)

(assert (=> bs!5338 m!111025))

(assert (=> b!69290 d!22174))

(declare-fun b!69596 () Bool)

(declare-fun res!57493 () Bool)

(declare-fun e!45431 () Bool)

(assert (=> b!69596 (=> (not res!57493) (not e!45431))))

(declare-fun lt!111630 () tuple2!6052)

(assert (=> b!69596 (= res!57493 (= (size!1347 (buf!1728 (_2!3137 lt!111130))) (size!1347 (buf!1728 (_2!3137 lt!111630)))))))

(declare-fun b!69597 () Bool)

(declare-fun res!57494 () Bool)

(assert (=> b!69597 (=> (not res!57494) (not e!45431))))

(assert (=> b!69597 (= res!57494 (isPrefixOf!0 (_2!3137 lt!111130) (_2!3137 lt!111630)))))

(declare-fun b!69598 () Bool)

(declare-fun e!45429 () tuple2!6052)

(declare-fun Unit!4655 () Unit!4651)

(assert (=> b!69598 (= e!45429 (tuple2!6053 Unit!4655 (_2!3137 lt!111130)))))

(assert (=> b!69598 (= (size!1347 (buf!1728 (_2!3137 lt!111130))) (size!1347 (buf!1728 (_2!3137 lt!111130))))))

(declare-fun lt!111636 () Unit!4651)

(declare-fun Unit!4656 () Unit!4651)

(assert (=> b!69598 (= lt!111636 Unit!4656)))

(declare-fun call!892 () tuple2!6054)

(declare-fun checkByteArrayBitContent!0 (BitStream!2298 array!2901 array!2901 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!69598 (checkByteArrayBitContent!0 (_2!3137 lt!111130) srcBuffer!2 (_1!3142 (readBits!0 (_1!3138 call!892) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!111633 () tuple2!6054)

(declare-fun b!69599 () Bool)

(assert (=> b!69599 (= e!45431 (= (bitStreamReadBitsIntoList!0 (_2!3137 lt!111630) (_1!3138 lt!111633) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3137 lt!111630) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!69599 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69599 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!111628 () Unit!4651)

(declare-fun lt!111647 () Unit!4651)

(assert (=> b!69599 (= lt!111628 lt!111647)))

(declare-fun lt!111642 () (_ BitVec 64))

(assert (=> b!69599 (validate_offset_bits!1 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111630)))) ((_ sign_extend 32) (currentByte!3430 (_2!3137 lt!111130))) ((_ sign_extend 32) (currentBit!3425 (_2!3137 lt!111130))) lt!111642)))

(assert (=> b!69599 (= lt!111647 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3137 lt!111130) (buf!1728 (_2!3137 lt!111630)) lt!111642))))

(declare-fun e!45430 () Bool)

(assert (=> b!69599 e!45430))

(declare-fun res!57490 () Bool)

(assert (=> b!69599 (=> (not res!57490) (not e!45430))))

(assert (=> b!69599 (= res!57490 (and (= (size!1347 (buf!1728 (_2!3137 lt!111130))) (size!1347 (buf!1728 (_2!3137 lt!111630)))) (bvsge lt!111642 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69599 (= lt!111642 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!69599 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69599 (= lt!111633 (reader!0 (_2!3137 lt!111130) (_2!3137 lt!111630)))))

(declare-fun b!69600 () Bool)

(assert (=> b!69600 (= e!45430 (validate_offset_bits!1 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111130)))) ((_ sign_extend 32) (currentByte!3430 (_2!3137 lt!111130))) ((_ sign_extend 32) (currentBit!3425 (_2!3137 lt!111130))) lt!111642))))

(declare-fun b!69601 () Bool)

(declare-fun lt!111634 () tuple2!6052)

(declare-fun Unit!4657 () Unit!4651)

(assert (=> b!69601 (= e!45429 (tuple2!6053 Unit!4657 (_2!3137 lt!111634)))))

(declare-fun lt!111622 () tuple2!6052)

(assert (=> b!69601 (= lt!111622 (appendBitFromByte!0 (_2!3137 lt!111130) (select (arr!1926 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!111615 () (_ BitVec 64))

(assert (=> b!69601 (= lt!111615 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!111631 () (_ BitVec 64))

(assert (=> b!69601 (= lt!111631 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!111644 () Unit!4651)

(assert (=> b!69601 (= lt!111644 (validateOffsetBitsIneqLemma!0 (_2!3137 lt!111130) (_2!3137 lt!111622) lt!111615 lt!111631))))

(assert (=> b!69601 (validate_offset_bits!1 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111622)))) ((_ sign_extend 32) (currentByte!3430 (_2!3137 lt!111622))) ((_ sign_extend 32) (currentBit!3425 (_2!3137 lt!111622))) (bvsub lt!111615 lt!111631))))

(declare-fun lt!111632 () Unit!4651)

(assert (=> b!69601 (= lt!111632 lt!111644)))

(declare-fun lt!111620 () tuple2!6054)

(assert (=> b!69601 (= lt!111620 call!892)))

(declare-fun lt!111623 () (_ BitVec 64))

(assert (=> b!69601 (= lt!111623 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!111643 () Unit!4651)

(assert (=> b!69601 (= lt!111643 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3137 lt!111130) (buf!1728 (_2!3137 lt!111622)) lt!111623))))

(assert (=> b!69601 (validate_offset_bits!1 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111622)))) ((_ sign_extend 32) (currentByte!3430 (_2!3137 lt!111130))) ((_ sign_extend 32) (currentBit!3425 (_2!3137 lt!111130))) lt!111623)))

(declare-fun lt!111652 () Unit!4651)

(assert (=> b!69601 (= lt!111652 lt!111643)))

(assert (=> b!69601 (= (head!543 (byteArrayBitContentToList!0 (_2!3137 lt!111622) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!543 (bitStreamReadBitsIntoList!0 (_2!3137 lt!111622) (_1!3138 lt!111620) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!111627 () Unit!4651)

(declare-fun Unit!4658 () Unit!4651)

(assert (=> b!69601 (= lt!111627 Unit!4658)))

(assert (=> b!69601 (= lt!111634 (appendBitsMSBFirstLoop!0 (_2!3137 lt!111622) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!111648 () Unit!4651)

(assert (=> b!69601 (= lt!111648 (lemmaIsPrefixTransitive!0 (_2!3137 lt!111130) (_2!3137 lt!111622) (_2!3137 lt!111634)))))

(assert (=> b!69601 (isPrefixOf!0 (_2!3137 lt!111130) (_2!3137 lt!111634))))

(declare-fun lt!111637 () Unit!4651)

(assert (=> b!69601 (= lt!111637 lt!111648)))

(assert (=> b!69601 (= (size!1347 (buf!1728 (_2!3137 lt!111634))) (size!1347 (buf!1728 (_2!3137 lt!111130))))))

(declare-fun lt!111624 () Unit!4651)

(declare-fun Unit!4659 () Unit!4651)

(assert (=> b!69601 (= lt!111624 Unit!4659)))

(assert (=> b!69601 (= (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111634))) (currentByte!3430 (_2!3137 lt!111634)) (currentBit!3425 (_2!3137 lt!111634))) (bvsub (bvadd (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111130))) (currentByte!3430 (_2!3137 lt!111130)) (currentBit!3425 (_2!3137 lt!111130))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!111617 () Unit!4651)

(declare-fun Unit!4660 () Unit!4651)

(assert (=> b!69601 (= lt!111617 Unit!4660)))

(assert (=> b!69601 (= (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111634))) (currentByte!3430 (_2!3137 lt!111634)) (currentBit!3425 (_2!3137 lt!111634))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111622))) (currentByte!3430 (_2!3137 lt!111622)) (currentBit!3425 (_2!3137 lt!111622))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!111626 () Unit!4651)

(declare-fun Unit!4661 () Unit!4651)

(assert (=> b!69601 (= lt!111626 Unit!4661)))

(declare-fun lt!111618 () tuple2!6054)

(assert (=> b!69601 (= lt!111618 (reader!0 (_2!3137 lt!111130) (_2!3137 lt!111634)))))

(declare-fun lt!111638 () (_ BitVec 64))

(assert (=> b!69601 (= lt!111638 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!111651 () Unit!4651)

(assert (=> b!69601 (= lt!111651 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3137 lt!111130) (buf!1728 (_2!3137 lt!111634)) lt!111638))))

(assert (=> b!69601 (validate_offset_bits!1 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111634)))) ((_ sign_extend 32) (currentByte!3430 (_2!3137 lt!111130))) ((_ sign_extend 32) (currentBit!3425 (_2!3137 lt!111130))) lt!111638)))

(declare-fun lt!111613 () Unit!4651)

(assert (=> b!69601 (= lt!111613 lt!111651)))

(declare-fun lt!111649 () tuple2!6054)

(assert (=> b!69601 (= lt!111649 (reader!0 (_2!3137 lt!111622) (_2!3137 lt!111634)))))

(declare-fun lt!111640 () (_ BitVec 64))

(assert (=> b!69601 (= lt!111640 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!111639 () Unit!4651)

(assert (=> b!69601 (= lt!111639 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3137 lt!111622) (buf!1728 (_2!3137 lt!111634)) lt!111640))))

(assert (=> b!69601 (validate_offset_bits!1 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111634)))) ((_ sign_extend 32) (currentByte!3430 (_2!3137 lt!111622))) ((_ sign_extend 32) (currentBit!3425 (_2!3137 lt!111622))) lt!111640)))

(declare-fun lt!111610 () Unit!4651)

(assert (=> b!69601 (= lt!111610 lt!111639)))

(declare-fun lt!111614 () List!724)

(assert (=> b!69601 (= lt!111614 (byteArrayBitContentToList!0 (_2!3137 lt!111634) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!111621 () List!724)

(assert (=> b!69601 (= lt!111621 (byteArrayBitContentToList!0 (_2!3137 lt!111634) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!111650 () List!724)

(assert (=> b!69601 (= lt!111650 (bitStreamReadBitsIntoList!0 (_2!3137 lt!111634) (_1!3138 lt!111618) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!111619 () List!724)

(assert (=> b!69601 (= lt!111619 (bitStreamReadBitsIntoList!0 (_2!3137 lt!111634) (_1!3138 lt!111649) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!111625 () (_ BitVec 64))

(assert (=> b!69601 (= lt!111625 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!111629 () Unit!4651)

(assert (=> b!69601 (= lt!111629 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3137 lt!111634) (_2!3137 lt!111634) (_1!3138 lt!111618) (_1!3138 lt!111649) lt!111625 lt!111650))))

(assert (=> b!69601 (= (bitStreamReadBitsIntoList!0 (_2!3137 lt!111634) (_1!3138 lt!111649) (bvsub lt!111625 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!328 lt!111650))))

(declare-fun lt!111635 () Unit!4651)

(assert (=> b!69601 (= lt!111635 lt!111629)))

(declare-fun lt!111646 () (_ BitVec 64))

(declare-fun lt!111645 () Unit!4651)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2901 array!2901 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4651)

(assert (=> b!69601 (= lt!111645 (arrayBitRangesEqImpliesEq!0 (buf!1728 (_2!3137 lt!111622)) (buf!1728 (_2!3137 lt!111634)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!111646 (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111622))) (currentByte!3430 (_2!3137 lt!111622)) (currentBit!3425 (_2!3137 lt!111622)))))))

(assert (=> b!69601 (= (bitAt!0 (buf!1728 (_2!3137 lt!111622)) lt!111646) (bitAt!0 (buf!1728 (_2!3137 lt!111634)) lt!111646))))

(declare-fun lt!111653 () Unit!4651)

(assert (=> b!69601 (= lt!111653 lt!111645)))

(declare-fun bm!889 () Bool)

(declare-fun c!5155 () Bool)

(assert (=> bm!889 (= call!892 (reader!0 (_2!3137 lt!111130) (ite c!5155 (_2!3137 lt!111622) (_2!3137 lt!111130))))))

(declare-fun d!22176 () Bool)

(assert (=> d!22176 e!45431))

(declare-fun res!57491 () Bool)

(assert (=> d!22176 (=> (not res!57491) (not e!45431))))

(declare-fun lt!111641 () (_ BitVec 64))

(assert (=> d!22176 (= res!57491 (= (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111630))) (currentByte!3430 (_2!3137 lt!111630)) (currentBit!3425 (_2!3137 lt!111630))) (bvsub lt!111641 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!22176 (or (= (bvand lt!111641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!111641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!111641 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!111611 () (_ BitVec 64))

(assert (=> d!22176 (= lt!111641 (bvadd lt!111611 to!314))))

(assert (=> d!22176 (or (not (= (bvand lt!111611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!111611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!111611 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22176 (= lt!111611 (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111130))) (currentByte!3430 (_2!3137 lt!111130)) (currentBit!3425 (_2!3137 lt!111130))))))

(assert (=> d!22176 (= lt!111630 e!45429)))

(assert (=> d!22176 (= c!5155 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!111616 () Unit!4651)

(declare-fun lt!111612 () Unit!4651)

(assert (=> d!22176 (= lt!111616 lt!111612)))

(assert (=> d!22176 (isPrefixOf!0 (_2!3137 lt!111130) (_2!3137 lt!111130))))

(assert (=> d!22176 (= lt!111612 (lemmaIsPrefixRefl!0 (_2!3137 lt!111130)))))

(assert (=> d!22176 (= lt!111646 (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111130))) (currentByte!3430 (_2!3137 lt!111130)) (currentBit!3425 (_2!3137 lt!111130))))))

(assert (=> d!22176 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22176 (= (appendBitsMSBFirstLoop!0 (_2!3137 lt!111130) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!111630)))

(declare-fun b!69602 () Bool)

(declare-fun res!57492 () Bool)

(assert (=> b!69602 (=> (not res!57492) (not e!45431))))

(assert (=> b!69602 (= res!57492 (= (size!1347 (buf!1728 (_2!3137 lt!111630))) (size!1347 (buf!1728 (_2!3137 lt!111130)))))))

(declare-fun b!69603 () Bool)

(declare-fun res!57495 () Bool)

(assert (=> b!69603 (=> (not res!57495) (not e!45431))))

(assert (=> b!69603 (= res!57495 (invariant!0 (currentBit!3425 (_2!3137 lt!111630)) (currentByte!3430 (_2!3137 lt!111630)) (size!1347 (buf!1728 (_2!3137 lt!111630)))))))

(assert (= (and d!22176 c!5155) b!69601))

(assert (= (and d!22176 (not c!5155)) b!69598))

(assert (= (or b!69601 b!69598) bm!889))

(assert (= (and d!22176 res!57491) b!69603))

(assert (= (and b!69603 res!57495) b!69596))

(assert (= (and b!69596 res!57493) b!69597))

(assert (= (and b!69597 res!57494) b!69602))

(assert (= (and b!69602 res!57492) b!69599))

(assert (= (and b!69599 res!57490) b!69600))

(declare-fun m!111221 () Bool)

(assert (=> b!69598 m!111221))

(declare-fun m!111223 () Bool)

(assert (=> b!69598 m!111223))

(declare-fun m!111225 () Bool)

(assert (=> bm!889 m!111225))

(declare-fun m!111227 () Bool)

(assert (=> b!69603 m!111227))

(declare-fun m!111229 () Bool)

(assert (=> b!69600 m!111229))

(declare-fun m!111231 () Bool)

(assert (=> b!69597 m!111231))

(declare-fun m!111233 () Bool)

(assert (=> d!22176 m!111233))

(assert (=> d!22176 m!110805))

(declare-fun m!111235 () Bool)

(assert (=> d!22176 m!111235))

(declare-fun m!111237 () Bool)

(assert (=> d!22176 m!111237))

(declare-fun m!111239 () Bool)

(assert (=> b!69599 m!111239))

(declare-fun m!111241 () Bool)

(assert (=> b!69599 m!111241))

(declare-fun m!111243 () Bool)

(assert (=> b!69599 m!111243))

(declare-fun m!111245 () Bool)

(assert (=> b!69599 m!111245))

(declare-fun m!111247 () Bool)

(assert (=> b!69599 m!111247))

(declare-fun m!111249 () Bool)

(assert (=> b!69601 m!111249))

(declare-fun m!111251 () Bool)

(assert (=> b!69601 m!111251))

(declare-fun m!111253 () Bool)

(assert (=> b!69601 m!111253))

(declare-fun m!111255 () Bool)

(assert (=> b!69601 m!111255))

(declare-fun m!111257 () Bool)

(assert (=> b!69601 m!111257))

(declare-fun m!111259 () Bool)

(assert (=> b!69601 m!111259))

(declare-fun m!111261 () Bool)

(assert (=> b!69601 m!111261))

(declare-fun m!111263 () Bool)

(assert (=> b!69601 m!111263))

(declare-fun m!111265 () Bool)

(assert (=> b!69601 m!111265))

(declare-fun m!111267 () Bool)

(assert (=> b!69601 m!111267))

(declare-fun m!111269 () Bool)

(assert (=> b!69601 m!111269))

(declare-fun m!111271 () Bool)

(assert (=> b!69601 m!111271))

(assert (=> b!69601 m!111253))

(declare-fun m!111273 () Bool)

(assert (=> b!69601 m!111273))

(declare-fun m!111275 () Bool)

(assert (=> b!69601 m!111275))

(declare-fun m!111277 () Bool)

(assert (=> b!69601 m!111277))

(declare-fun m!111279 () Bool)

(assert (=> b!69601 m!111279))

(declare-fun m!111281 () Bool)

(assert (=> b!69601 m!111281))

(declare-fun m!111283 () Bool)

(assert (=> b!69601 m!111283))

(declare-fun m!111285 () Bool)

(assert (=> b!69601 m!111285))

(declare-fun m!111287 () Bool)

(assert (=> b!69601 m!111287))

(declare-fun m!111289 () Bool)

(assert (=> b!69601 m!111289))

(declare-fun m!111291 () Bool)

(assert (=> b!69601 m!111291))

(declare-fun m!111293 () Bool)

(assert (=> b!69601 m!111293))

(assert (=> b!69601 m!110805))

(assert (=> b!69601 m!111287))

(assert (=> b!69601 m!111269))

(declare-fun m!111295 () Bool)

(assert (=> b!69601 m!111295))

(declare-fun m!111297 () Bool)

(assert (=> b!69601 m!111297))

(declare-fun m!111299 () Bool)

(assert (=> b!69601 m!111299))

(declare-fun m!111301 () Bool)

(assert (=> b!69601 m!111301))

(declare-fun m!111303 () Bool)

(assert (=> b!69601 m!111303))

(assert (=> b!69601 m!111277))

(declare-fun m!111305 () Bool)

(assert (=> b!69601 m!111305))

(declare-fun m!111307 () Bool)

(assert (=> b!69601 m!111307))

(declare-fun m!111309 () Bool)

(assert (=> b!69601 m!111309))

(assert (=> b!69290 d!22176))

(declare-fun d!22272 () Bool)

(assert (=> d!22272 (isPrefixOf!0 thiss!1379 (_2!3137 lt!111142))))

(declare-fun lt!111656 () Unit!4651)

(declare-fun choose!30 (BitStream!2298 BitStream!2298 BitStream!2298) Unit!4651)

(assert (=> d!22272 (= lt!111656 (choose!30 thiss!1379 (_2!3137 lt!111130) (_2!3137 lt!111142)))))

(assert (=> d!22272 (isPrefixOf!0 thiss!1379 (_2!3137 lt!111130))))

(assert (=> d!22272 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3137 lt!111130) (_2!3137 lt!111142)) lt!111656)))

(declare-fun bs!5355 () Bool)

(assert (= bs!5355 d!22272))

(assert (=> bs!5355 m!110849))

(declare-fun m!111311 () Bool)

(assert (=> bs!5355 m!111311))

(assert (=> bs!5355 m!110807))

(assert (=> b!69290 d!22272))

(declare-fun d!22274 () Bool)

(assert (=> d!22274 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111130)))) ((_ sign_extend 32) (currentByte!3430 thiss!1379)) ((_ sign_extend 32) (currentBit!3425 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111130)))) ((_ sign_extend 32) (currentByte!3430 thiss!1379)) ((_ sign_extend 32) (currentBit!3425 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5356 () Bool)

(assert (= bs!5356 d!22274))

(declare-fun m!111313 () Bool)

(assert (=> bs!5356 m!111313))

(assert (=> b!69290 d!22274))

(declare-fun d!22276 () Bool)

(declare-fun res!57497 () Bool)

(declare-fun e!45432 () Bool)

(assert (=> d!22276 (=> (not res!57497) (not e!45432))))

(assert (=> d!22276 (= res!57497 (= (size!1347 (buf!1728 (_2!3137 lt!111130))) (size!1347 (buf!1728 (_2!3137 lt!111142)))))))

(assert (=> d!22276 (= (isPrefixOf!0 (_2!3137 lt!111130) (_2!3137 lt!111142)) e!45432)))

(declare-fun b!69604 () Bool)

(declare-fun res!57498 () Bool)

(assert (=> b!69604 (=> (not res!57498) (not e!45432))))

(assert (=> b!69604 (= res!57498 (bvsle (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111130))) (currentByte!3430 (_2!3137 lt!111130)) (currentBit!3425 (_2!3137 lt!111130))) (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111142))) (currentByte!3430 (_2!3137 lt!111142)) (currentBit!3425 (_2!3137 lt!111142)))))))

(declare-fun b!69605 () Bool)

(declare-fun e!45433 () Bool)

(assert (=> b!69605 (= e!45432 e!45433)))

(declare-fun res!57496 () Bool)

(assert (=> b!69605 (=> res!57496 e!45433)))

(assert (=> b!69605 (= res!57496 (= (size!1347 (buf!1728 (_2!3137 lt!111130))) #b00000000000000000000000000000000))))

(declare-fun b!69606 () Bool)

(assert (=> b!69606 (= e!45433 (arrayBitRangesEq!0 (buf!1728 (_2!3137 lt!111130)) (buf!1728 (_2!3137 lt!111142)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111130))) (currentByte!3430 (_2!3137 lt!111130)) (currentBit!3425 (_2!3137 lt!111130)))))))

(assert (= (and d!22276 res!57497) b!69604))

(assert (= (and b!69604 res!57498) b!69605))

(assert (= (and b!69605 (not res!57496)) b!69606))

(assert (=> b!69604 m!110805))

(assert (=> b!69604 m!110775))

(assert (=> b!69606 m!110805))

(assert (=> b!69606 m!110805))

(declare-fun m!111315 () Bool)

(assert (=> b!69606 m!111315))

(assert (=> b!69290 d!22276))

(declare-fun d!22278 () Bool)

(declare-fun res!57500 () Bool)

(declare-fun e!45434 () Bool)

(assert (=> d!22278 (=> (not res!57500) (not e!45434))))

(assert (=> d!22278 (= res!57500 (= (size!1347 (buf!1728 thiss!1379)) (size!1347 (buf!1728 (_2!3137 lt!111142)))))))

(assert (=> d!22278 (= (isPrefixOf!0 thiss!1379 (_2!3137 lt!111142)) e!45434)))

(declare-fun b!69607 () Bool)

(declare-fun res!57501 () Bool)

(assert (=> b!69607 (=> (not res!57501) (not e!45434))))

(assert (=> b!69607 (= res!57501 (bvsle (bitIndex!0 (size!1347 (buf!1728 thiss!1379)) (currentByte!3430 thiss!1379) (currentBit!3425 thiss!1379)) (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111142))) (currentByte!3430 (_2!3137 lt!111142)) (currentBit!3425 (_2!3137 lt!111142)))))))

(declare-fun b!69608 () Bool)

(declare-fun e!45435 () Bool)

(assert (=> b!69608 (= e!45434 e!45435)))

(declare-fun res!57499 () Bool)

(assert (=> b!69608 (=> res!57499 e!45435)))

(assert (=> b!69608 (= res!57499 (= (size!1347 (buf!1728 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!69609 () Bool)

(assert (=> b!69609 (= e!45435 (arrayBitRangesEq!0 (buf!1728 thiss!1379) (buf!1728 (_2!3137 lt!111142)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1347 (buf!1728 thiss!1379)) (currentByte!3430 thiss!1379) (currentBit!3425 thiss!1379))))))

(assert (= (and d!22278 res!57500) b!69607))

(assert (= (and b!69607 res!57501) b!69608))

(assert (= (and b!69608 (not res!57499)) b!69609))

(assert (=> b!69607 m!110837))

(assert (=> b!69607 m!110775))

(assert (=> b!69609 m!110837))

(assert (=> b!69609 m!110837))

(declare-fun m!111317 () Bool)

(assert (=> b!69609 m!111317))

(assert (=> b!69290 d!22278))

(declare-fun b!69620 () Bool)

(declare-fun res!57508 () Bool)

(declare-fun e!45440 () Bool)

(assert (=> b!69620 (=> (not res!57508) (not e!45440))))

(declare-fun lt!111708 () tuple2!6054)

(assert (=> b!69620 (= res!57508 (isPrefixOf!0 (_1!3138 lt!111708) thiss!1379))))

(declare-fun b!69622 () Bool)

(declare-fun res!57510 () Bool)

(assert (=> b!69622 (=> (not res!57510) (not e!45440))))

(assert (=> b!69622 (= res!57510 (isPrefixOf!0 (_2!3138 lt!111708) (_2!3137 lt!111130)))))

(declare-fun b!69623 () Bool)

(declare-fun e!45441 () Unit!4651)

(declare-fun lt!111712 () Unit!4651)

(assert (=> b!69623 (= e!45441 lt!111712)))

(declare-fun lt!111699 () (_ BitVec 64))

(assert (=> b!69623 (= lt!111699 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111707 () (_ BitVec 64))

(assert (=> b!69623 (= lt!111707 (bitIndex!0 (size!1347 (buf!1728 thiss!1379)) (currentByte!3430 thiss!1379) (currentBit!3425 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2901 array!2901 (_ BitVec 64) (_ BitVec 64)) Unit!4651)

(assert (=> b!69623 (= lt!111712 (arrayBitRangesEqSymmetric!0 (buf!1728 thiss!1379) (buf!1728 (_2!3137 lt!111130)) lt!111699 lt!111707))))

(assert (=> b!69623 (arrayBitRangesEq!0 (buf!1728 (_2!3137 lt!111130)) (buf!1728 thiss!1379) lt!111699 lt!111707)))

(declare-fun b!69624 () Bool)

(declare-fun Unit!4662 () Unit!4651)

(assert (=> b!69624 (= e!45441 Unit!4662)))

(declare-fun b!69621 () Bool)

(declare-fun lt!111713 () (_ BitVec 64))

(declare-fun lt!111702 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2298 (_ BitVec 64)) BitStream!2298)

(assert (=> b!69621 (= e!45440 (= (_1!3138 lt!111708) (withMovedBitIndex!0 (_2!3138 lt!111708) (bvsub lt!111702 lt!111713))))))

(assert (=> b!69621 (or (= (bvand lt!111702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!111713 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!111702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!111702 lt!111713) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69621 (= lt!111713 (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111130))) (currentByte!3430 (_2!3137 lt!111130)) (currentBit!3425 (_2!3137 lt!111130))))))

(assert (=> b!69621 (= lt!111702 (bitIndex!0 (size!1347 (buf!1728 thiss!1379)) (currentByte!3430 thiss!1379) (currentBit!3425 thiss!1379)))))

(declare-fun d!22280 () Bool)

(assert (=> d!22280 e!45440))

(declare-fun res!57509 () Bool)

(assert (=> d!22280 (=> (not res!57509) (not e!45440))))

(assert (=> d!22280 (= res!57509 (isPrefixOf!0 (_1!3138 lt!111708) (_2!3138 lt!111708)))))

(declare-fun lt!111705 () BitStream!2298)

(assert (=> d!22280 (= lt!111708 (tuple2!6055 lt!111705 (_2!3137 lt!111130)))))

(declare-fun lt!111703 () Unit!4651)

(declare-fun lt!111709 () Unit!4651)

(assert (=> d!22280 (= lt!111703 lt!111709)))

(assert (=> d!22280 (isPrefixOf!0 lt!111705 (_2!3137 lt!111130))))

(assert (=> d!22280 (= lt!111709 (lemmaIsPrefixTransitive!0 lt!111705 (_2!3137 lt!111130) (_2!3137 lt!111130)))))

(declare-fun lt!111711 () Unit!4651)

(declare-fun lt!111700 () Unit!4651)

(assert (=> d!22280 (= lt!111711 lt!111700)))

(assert (=> d!22280 (isPrefixOf!0 lt!111705 (_2!3137 lt!111130))))

(assert (=> d!22280 (= lt!111700 (lemmaIsPrefixTransitive!0 lt!111705 thiss!1379 (_2!3137 lt!111130)))))

(declare-fun lt!111715 () Unit!4651)

(assert (=> d!22280 (= lt!111715 e!45441)))

(declare-fun c!5158 () Bool)

(assert (=> d!22280 (= c!5158 (not (= (size!1347 (buf!1728 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!111698 () Unit!4651)

(declare-fun lt!111716 () Unit!4651)

(assert (=> d!22280 (= lt!111698 lt!111716)))

(assert (=> d!22280 (isPrefixOf!0 (_2!3137 lt!111130) (_2!3137 lt!111130))))

(assert (=> d!22280 (= lt!111716 (lemmaIsPrefixRefl!0 (_2!3137 lt!111130)))))

(declare-fun lt!111697 () Unit!4651)

(declare-fun lt!111714 () Unit!4651)

(assert (=> d!22280 (= lt!111697 lt!111714)))

(assert (=> d!22280 (= lt!111714 (lemmaIsPrefixRefl!0 (_2!3137 lt!111130)))))

(declare-fun lt!111701 () Unit!4651)

(declare-fun lt!111704 () Unit!4651)

(assert (=> d!22280 (= lt!111701 lt!111704)))

(assert (=> d!22280 (isPrefixOf!0 lt!111705 lt!111705)))

(assert (=> d!22280 (= lt!111704 (lemmaIsPrefixRefl!0 lt!111705))))

(declare-fun lt!111706 () Unit!4651)

(declare-fun lt!111710 () Unit!4651)

(assert (=> d!22280 (= lt!111706 lt!111710)))

(assert (=> d!22280 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!22280 (= lt!111710 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!22280 (= lt!111705 (BitStream!2299 (buf!1728 (_2!3137 lt!111130)) (currentByte!3430 thiss!1379) (currentBit!3425 thiss!1379)))))

(assert (=> d!22280 (isPrefixOf!0 thiss!1379 (_2!3137 lt!111130))))

(assert (=> d!22280 (= (reader!0 thiss!1379 (_2!3137 lt!111130)) lt!111708)))

(assert (= (and d!22280 c!5158) b!69623))

(assert (= (and d!22280 (not c!5158)) b!69624))

(assert (= (and d!22280 res!57509) b!69620))

(assert (= (and b!69620 res!57508) b!69622))

(assert (= (and b!69622 res!57510) b!69621))

(declare-fun m!111319 () Bool)

(assert (=> b!69621 m!111319))

(assert (=> b!69621 m!110805))

(assert (=> b!69621 m!110837))

(declare-fun m!111321 () Bool)

(assert (=> b!69620 m!111321))

(declare-fun m!111323 () Bool)

(assert (=> d!22280 m!111323))

(declare-fun m!111325 () Bool)

(assert (=> d!22280 m!111325))

(assert (=> d!22280 m!110807))

(declare-fun m!111327 () Bool)

(assert (=> d!22280 m!111327))

(declare-fun m!111329 () Bool)

(assert (=> d!22280 m!111329))

(declare-fun m!111331 () Bool)

(assert (=> d!22280 m!111331))

(assert (=> d!22280 m!110835))

(declare-fun m!111333 () Bool)

(assert (=> d!22280 m!111333))

(assert (=> d!22280 m!110833))

(assert (=> d!22280 m!111235))

(assert (=> d!22280 m!111237))

(assert (=> b!69623 m!110837))

(declare-fun m!111335 () Bool)

(assert (=> b!69623 m!111335))

(declare-fun m!111337 () Bool)

(assert (=> b!69623 m!111337))

(declare-fun m!111339 () Bool)

(assert (=> b!69622 m!111339))

(assert (=> b!69290 d!22280))

(declare-fun b!69627 () Bool)

(declare-fun e!45443 () Bool)

(declare-fun lt!111718 () List!724)

(assert (=> b!69627 (= e!45443 (isEmpty!222 lt!111718))))

(declare-fun d!22282 () Bool)

(assert (=> d!22282 e!45443))

(declare-fun c!5159 () Bool)

(assert (=> d!22282 (= c!5159 (= lt!111145 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!45442 () tuple2!6064)

(assert (=> d!22282 (= lt!111718 (_1!3143 e!45442))))

(declare-fun c!5160 () Bool)

(assert (=> d!22282 (= c!5160 (= lt!111145 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22282 (bvsge lt!111145 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22282 (= (bitStreamReadBitsIntoList!0 (_2!3137 lt!111142) (_1!3138 lt!111133) lt!111145) lt!111718)))

(declare-fun lt!111717 () (_ BitVec 64))

(declare-fun lt!111719 () tuple2!6066)

(declare-fun b!69626 () Bool)

(assert (=> b!69626 (= e!45442 (tuple2!6065 (Cons!720 (_1!3144 lt!111719) (bitStreamReadBitsIntoList!0 (_2!3137 lt!111142) (_2!3144 lt!111719) (bvsub lt!111145 lt!111717))) (_2!3144 lt!111719)))))

(assert (=> b!69626 (= lt!111719 (readBit!0 (_1!3138 lt!111133)))))

(assert (=> b!69626 (= lt!111717 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!69625 () Bool)

(assert (=> b!69625 (= e!45442 (tuple2!6065 Nil!721 (_1!3138 lt!111133)))))

(declare-fun b!69628 () Bool)

(assert (=> b!69628 (= e!45443 (> (length!352 lt!111718) 0))))

(assert (= (and d!22282 c!5160) b!69625))

(assert (= (and d!22282 (not c!5160)) b!69626))

(assert (= (and d!22282 c!5159) b!69627))

(assert (= (and d!22282 (not c!5159)) b!69628))

(declare-fun m!111341 () Bool)

(assert (=> b!69627 m!111341))

(declare-fun m!111343 () Bool)

(assert (=> b!69626 m!111343))

(declare-fun m!111345 () Bool)

(assert (=> b!69626 m!111345))

(declare-fun m!111347 () Bool)

(assert (=> b!69628 m!111347))

(assert (=> b!69301 d!22282))

(declare-fun b!69629 () Bool)

(declare-fun res!57511 () Bool)

(declare-fun e!45444 () Bool)

(assert (=> b!69629 (=> (not res!57511) (not e!45444))))

(declare-fun lt!111731 () tuple2!6054)

(assert (=> b!69629 (= res!57511 (isPrefixOf!0 (_1!3138 lt!111731) thiss!1379))))

(declare-fun b!69631 () Bool)

(declare-fun res!57513 () Bool)

(assert (=> b!69631 (=> (not res!57513) (not e!45444))))

(assert (=> b!69631 (= res!57513 (isPrefixOf!0 (_2!3138 lt!111731) (_2!3137 lt!111142)))))

(declare-fun b!69632 () Bool)

(declare-fun e!45445 () Unit!4651)

(declare-fun lt!111735 () Unit!4651)

(assert (=> b!69632 (= e!45445 lt!111735)))

(declare-fun lt!111722 () (_ BitVec 64))

(assert (=> b!69632 (= lt!111722 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111730 () (_ BitVec 64))

(assert (=> b!69632 (= lt!111730 (bitIndex!0 (size!1347 (buf!1728 thiss!1379)) (currentByte!3430 thiss!1379) (currentBit!3425 thiss!1379)))))

(assert (=> b!69632 (= lt!111735 (arrayBitRangesEqSymmetric!0 (buf!1728 thiss!1379) (buf!1728 (_2!3137 lt!111142)) lt!111722 lt!111730))))

(assert (=> b!69632 (arrayBitRangesEq!0 (buf!1728 (_2!3137 lt!111142)) (buf!1728 thiss!1379) lt!111722 lt!111730)))

(declare-fun b!69633 () Bool)

(declare-fun Unit!4663 () Unit!4651)

(assert (=> b!69633 (= e!45445 Unit!4663)))

(declare-fun lt!111736 () (_ BitVec 64))

(declare-fun b!69630 () Bool)

(declare-fun lt!111725 () (_ BitVec 64))

(assert (=> b!69630 (= e!45444 (= (_1!3138 lt!111731) (withMovedBitIndex!0 (_2!3138 lt!111731) (bvsub lt!111725 lt!111736))))))

(assert (=> b!69630 (or (= (bvand lt!111725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!111736 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!111725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!111725 lt!111736) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69630 (= lt!111736 (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111142))) (currentByte!3430 (_2!3137 lt!111142)) (currentBit!3425 (_2!3137 lt!111142))))))

(assert (=> b!69630 (= lt!111725 (bitIndex!0 (size!1347 (buf!1728 thiss!1379)) (currentByte!3430 thiss!1379) (currentBit!3425 thiss!1379)))))

(declare-fun d!22284 () Bool)

(assert (=> d!22284 e!45444))

(declare-fun res!57512 () Bool)

(assert (=> d!22284 (=> (not res!57512) (not e!45444))))

(assert (=> d!22284 (= res!57512 (isPrefixOf!0 (_1!3138 lt!111731) (_2!3138 lt!111731)))))

(declare-fun lt!111728 () BitStream!2298)

(assert (=> d!22284 (= lt!111731 (tuple2!6055 lt!111728 (_2!3137 lt!111142)))))

(declare-fun lt!111726 () Unit!4651)

(declare-fun lt!111732 () Unit!4651)

(assert (=> d!22284 (= lt!111726 lt!111732)))

(assert (=> d!22284 (isPrefixOf!0 lt!111728 (_2!3137 lt!111142))))

(assert (=> d!22284 (= lt!111732 (lemmaIsPrefixTransitive!0 lt!111728 (_2!3137 lt!111142) (_2!3137 lt!111142)))))

(declare-fun lt!111734 () Unit!4651)

(declare-fun lt!111723 () Unit!4651)

(assert (=> d!22284 (= lt!111734 lt!111723)))

(assert (=> d!22284 (isPrefixOf!0 lt!111728 (_2!3137 lt!111142))))

(assert (=> d!22284 (= lt!111723 (lemmaIsPrefixTransitive!0 lt!111728 thiss!1379 (_2!3137 lt!111142)))))

(declare-fun lt!111738 () Unit!4651)

(assert (=> d!22284 (= lt!111738 e!45445)))

(declare-fun c!5161 () Bool)

(assert (=> d!22284 (= c!5161 (not (= (size!1347 (buf!1728 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!111721 () Unit!4651)

(declare-fun lt!111739 () Unit!4651)

(assert (=> d!22284 (= lt!111721 lt!111739)))

(assert (=> d!22284 (isPrefixOf!0 (_2!3137 lt!111142) (_2!3137 lt!111142))))

(assert (=> d!22284 (= lt!111739 (lemmaIsPrefixRefl!0 (_2!3137 lt!111142)))))

(declare-fun lt!111720 () Unit!4651)

(declare-fun lt!111737 () Unit!4651)

(assert (=> d!22284 (= lt!111720 lt!111737)))

(assert (=> d!22284 (= lt!111737 (lemmaIsPrefixRefl!0 (_2!3137 lt!111142)))))

(declare-fun lt!111724 () Unit!4651)

(declare-fun lt!111727 () Unit!4651)

(assert (=> d!22284 (= lt!111724 lt!111727)))

(assert (=> d!22284 (isPrefixOf!0 lt!111728 lt!111728)))

(assert (=> d!22284 (= lt!111727 (lemmaIsPrefixRefl!0 lt!111728))))

(declare-fun lt!111729 () Unit!4651)

(declare-fun lt!111733 () Unit!4651)

(assert (=> d!22284 (= lt!111729 lt!111733)))

(assert (=> d!22284 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!22284 (= lt!111733 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!22284 (= lt!111728 (BitStream!2299 (buf!1728 (_2!3137 lt!111142)) (currentByte!3430 thiss!1379) (currentBit!3425 thiss!1379)))))

(assert (=> d!22284 (isPrefixOf!0 thiss!1379 (_2!3137 lt!111142))))

(assert (=> d!22284 (= (reader!0 thiss!1379 (_2!3137 lt!111142)) lt!111731)))

(assert (= (and d!22284 c!5161) b!69632))

(assert (= (and d!22284 (not c!5161)) b!69633))

(assert (= (and d!22284 res!57512) b!69629))

(assert (= (and b!69629 res!57511) b!69631))

(assert (= (and b!69631 res!57513) b!69630))

(declare-fun m!111349 () Bool)

(assert (=> b!69630 m!111349))

(assert (=> b!69630 m!110775))

(assert (=> b!69630 m!110837))

(declare-fun m!111351 () Bool)

(assert (=> b!69629 m!111351))

(declare-fun m!111353 () Bool)

(assert (=> d!22284 m!111353))

(declare-fun m!111355 () Bool)

(assert (=> d!22284 m!111355))

(assert (=> d!22284 m!110849))

(declare-fun m!111357 () Bool)

(assert (=> d!22284 m!111357))

(declare-fun m!111359 () Bool)

(assert (=> d!22284 m!111359))

(declare-fun m!111361 () Bool)

(assert (=> d!22284 m!111361))

(assert (=> d!22284 m!110835))

(declare-fun m!111363 () Bool)

(assert (=> d!22284 m!111363))

(assert (=> d!22284 m!110833))

(declare-fun m!111365 () Bool)

(assert (=> d!22284 m!111365))

(declare-fun m!111367 () Bool)

(assert (=> d!22284 m!111367))

(assert (=> b!69632 m!110837))

(declare-fun m!111369 () Bool)

(assert (=> b!69632 m!111369))

(declare-fun m!111371 () Bool)

(assert (=> b!69632 m!111371))

(declare-fun m!111373 () Bool)

(assert (=> b!69631 m!111373))

(assert (=> b!69301 d!22284))

(declare-fun d!22286 () Bool)

(assert (=> d!22286 (validate_offset_bits!1 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111142)))) ((_ sign_extend 32) (currentByte!3430 thiss!1379)) ((_ sign_extend 32) (currentBit!3425 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!111740 () Unit!4651)

(assert (=> d!22286 (= lt!111740 (choose!9 thiss!1379 (buf!1728 (_2!3137 lt!111142)) (bvsub to!314 i!635) (BitStream!2299 (buf!1728 (_2!3137 lt!111142)) (currentByte!3430 thiss!1379) (currentBit!3425 thiss!1379))))))

(assert (=> d!22286 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1728 (_2!3137 lt!111142)) (bvsub to!314 i!635)) lt!111740)))

(declare-fun bs!5357 () Bool)

(assert (= bs!5357 d!22286))

(assert (=> bs!5357 m!110777))

(declare-fun m!111375 () Bool)

(assert (=> bs!5357 m!111375))

(assert (=> b!69301 d!22286))

(declare-fun d!22288 () Bool)

(assert (=> d!22288 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111142)))) ((_ sign_extend 32) (currentByte!3430 (_2!3137 lt!111130))) ((_ sign_extend 32) (currentBit!3425 (_2!3137 lt!111130))) lt!111145) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111142)))) ((_ sign_extend 32) (currentByte!3430 (_2!3137 lt!111130))) ((_ sign_extend 32) (currentBit!3425 (_2!3137 lt!111130)))) lt!111145))))

(declare-fun bs!5358 () Bool)

(assert (= bs!5358 d!22288))

(declare-fun m!111377 () Bool)

(assert (=> bs!5358 m!111377))

(assert (=> b!69301 d!22288))

(declare-fun b!69634 () Bool)

(declare-fun res!57514 () Bool)

(declare-fun e!45446 () Bool)

(assert (=> b!69634 (=> (not res!57514) (not e!45446))))

(declare-fun lt!111752 () tuple2!6054)

(assert (=> b!69634 (= res!57514 (isPrefixOf!0 (_1!3138 lt!111752) (_2!3137 lt!111130)))))

(declare-fun b!69636 () Bool)

(declare-fun res!57516 () Bool)

(assert (=> b!69636 (=> (not res!57516) (not e!45446))))

(assert (=> b!69636 (= res!57516 (isPrefixOf!0 (_2!3138 lt!111752) (_2!3137 lt!111142)))))

(declare-fun b!69637 () Bool)

(declare-fun e!45447 () Unit!4651)

(declare-fun lt!111756 () Unit!4651)

(assert (=> b!69637 (= e!45447 lt!111756)))

(declare-fun lt!111743 () (_ BitVec 64))

(assert (=> b!69637 (= lt!111743 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111751 () (_ BitVec 64))

(assert (=> b!69637 (= lt!111751 (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111130))) (currentByte!3430 (_2!3137 lt!111130)) (currentBit!3425 (_2!3137 lt!111130))))))

(assert (=> b!69637 (= lt!111756 (arrayBitRangesEqSymmetric!0 (buf!1728 (_2!3137 lt!111130)) (buf!1728 (_2!3137 lt!111142)) lt!111743 lt!111751))))

(assert (=> b!69637 (arrayBitRangesEq!0 (buf!1728 (_2!3137 lt!111142)) (buf!1728 (_2!3137 lt!111130)) lt!111743 lt!111751)))

(declare-fun b!69638 () Bool)

(declare-fun Unit!4664 () Unit!4651)

(assert (=> b!69638 (= e!45447 Unit!4664)))

(declare-fun lt!111746 () (_ BitVec 64))

(declare-fun b!69635 () Bool)

(declare-fun lt!111757 () (_ BitVec 64))

(assert (=> b!69635 (= e!45446 (= (_1!3138 lt!111752) (withMovedBitIndex!0 (_2!3138 lt!111752) (bvsub lt!111746 lt!111757))))))

(assert (=> b!69635 (or (= (bvand lt!111746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!111757 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!111746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!111746 lt!111757) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69635 (= lt!111757 (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111142))) (currentByte!3430 (_2!3137 lt!111142)) (currentBit!3425 (_2!3137 lt!111142))))))

(assert (=> b!69635 (= lt!111746 (bitIndex!0 (size!1347 (buf!1728 (_2!3137 lt!111130))) (currentByte!3430 (_2!3137 lt!111130)) (currentBit!3425 (_2!3137 lt!111130))))))

(declare-fun d!22290 () Bool)

(assert (=> d!22290 e!45446))

(declare-fun res!57515 () Bool)

(assert (=> d!22290 (=> (not res!57515) (not e!45446))))

(assert (=> d!22290 (= res!57515 (isPrefixOf!0 (_1!3138 lt!111752) (_2!3138 lt!111752)))))

(declare-fun lt!111749 () BitStream!2298)

(assert (=> d!22290 (= lt!111752 (tuple2!6055 lt!111749 (_2!3137 lt!111142)))))

(declare-fun lt!111747 () Unit!4651)

(declare-fun lt!111753 () Unit!4651)

(assert (=> d!22290 (= lt!111747 lt!111753)))

(assert (=> d!22290 (isPrefixOf!0 lt!111749 (_2!3137 lt!111142))))

(assert (=> d!22290 (= lt!111753 (lemmaIsPrefixTransitive!0 lt!111749 (_2!3137 lt!111142) (_2!3137 lt!111142)))))

(declare-fun lt!111755 () Unit!4651)

(declare-fun lt!111744 () Unit!4651)

(assert (=> d!22290 (= lt!111755 lt!111744)))

(assert (=> d!22290 (isPrefixOf!0 lt!111749 (_2!3137 lt!111142))))

(assert (=> d!22290 (= lt!111744 (lemmaIsPrefixTransitive!0 lt!111749 (_2!3137 lt!111130) (_2!3137 lt!111142)))))

(declare-fun lt!111759 () Unit!4651)

(assert (=> d!22290 (= lt!111759 e!45447)))

(declare-fun c!5162 () Bool)

(assert (=> d!22290 (= c!5162 (not (= (size!1347 (buf!1728 (_2!3137 lt!111130))) #b00000000000000000000000000000000)))))

(declare-fun lt!111742 () Unit!4651)

(declare-fun lt!111760 () Unit!4651)

(assert (=> d!22290 (= lt!111742 lt!111760)))

(assert (=> d!22290 (isPrefixOf!0 (_2!3137 lt!111142) (_2!3137 lt!111142))))

(assert (=> d!22290 (= lt!111760 (lemmaIsPrefixRefl!0 (_2!3137 lt!111142)))))

(declare-fun lt!111741 () Unit!4651)

(declare-fun lt!111758 () Unit!4651)

(assert (=> d!22290 (= lt!111741 lt!111758)))

(assert (=> d!22290 (= lt!111758 (lemmaIsPrefixRefl!0 (_2!3137 lt!111142)))))

(declare-fun lt!111745 () Unit!4651)

(declare-fun lt!111748 () Unit!4651)

(assert (=> d!22290 (= lt!111745 lt!111748)))

(assert (=> d!22290 (isPrefixOf!0 lt!111749 lt!111749)))

(assert (=> d!22290 (= lt!111748 (lemmaIsPrefixRefl!0 lt!111749))))

(declare-fun lt!111750 () Unit!4651)

(declare-fun lt!111754 () Unit!4651)

(assert (=> d!22290 (= lt!111750 lt!111754)))

(assert (=> d!22290 (isPrefixOf!0 (_2!3137 lt!111130) (_2!3137 lt!111130))))

(assert (=> d!22290 (= lt!111754 (lemmaIsPrefixRefl!0 (_2!3137 lt!111130)))))

(assert (=> d!22290 (= lt!111749 (BitStream!2299 (buf!1728 (_2!3137 lt!111142)) (currentByte!3430 (_2!3137 lt!111130)) (currentBit!3425 (_2!3137 lt!111130))))))

(assert (=> d!22290 (isPrefixOf!0 (_2!3137 lt!111130) (_2!3137 lt!111142))))

(assert (=> d!22290 (= (reader!0 (_2!3137 lt!111130) (_2!3137 lt!111142)) lt!111752)))

(assert (= (and d!22290 c!5162) b!69637))

(assert (= (and d!22290 (not c!5162)) b!69638))

(assert (= (and d!22290 res!57515) b!69634))

(assert (= (and b!69634 res!57514) b!69636))

(assert (= (and b!69636 res!57516) b!69635))

(declare-fun m!111379 () Bool)

(assert (=> b!69635 m!111379))

(assert (=> b!69635 m!110775))

(assert (=> b!69635 m!110805))

(declare-fun m!111381 () Bool)

(assert (=> b!69634 m!111381))

(declare-fun m!111383 () Bool)

(assert (=> d!22290 m!111383))

(declare-fun m!111385 () Bool)

(assert (=> d!22290 m!111385))

(assert (=> d!22290 m!110841))

(declare-fun m!111387 () Bool)

(assert (=> d!22290 m!111387))

(declare-fun m!111389 () Bool)

(assert (=> d!22290 m!111389))

(declare-fun m!111391 () Bool)

(assert (=> d!22290 m!111391))

(assert (=> d!22290 m!111237))

(declare-fun m!111393 () Bool)

(assert (=> d!22290 m!111393))

(assert (=> d!22290 m!111235))

(assert (=> d!22290 m!111365))

(assert (=> d!22290 m!111367))

(assert (=> b!69637 m!110805))

(declare-fun m!111395 () Bool)

(assert (=> b!69637 m!111395))

(declare-fun m!111397 () Bool)

(assert (=> b!69637 m!111397))

(declare-fun m!111399 () Bool)

(assert (=> b!69636 m!111399))

(assert (=> b!69301 d!22290))

(declare-fun d!22292 () Bool)

(assert (=> d!22292 (validate_offset_bits!1 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111142)))) ((_ sign_extend 32) (currentByte!3430 (_2!3137 lt!111130))) ((_ sign_extend 32) (currentBit!3425 (_2!3137 lt!111130))) lt!111145)))

(declare-fun lt!111761 () Unit!4651)

(assert (=> d!22292 (= lt!111761 (choose!9 (_2!3137 lt!111130) (buf!1728 (_2!3137 lt!111142)) lt!111145 (BitStream!2299 (buf!1728 (_2!3137 lt!111142)) (currentByte!3430 (_2!3137 lt!111130)) (currentBit!3425 (_2!3137 lt!111130)))))))

(assert (=> d!22292 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3137 lt!111130) (buf!1728 (_2!3137 lt!111142)) lt!111145) lt!111761)))

(declare-fun bs!5359 () Bool)

(assert (= bs!5359 d!22292))

(assert (=> bs!5359 m!110779))

(declare-fun m!111401 () Bool)

(assert (=> bs!5359 m!111401))

(assert (=> b!69301 d!22292))

(declare-fun d!22294 () Bool)

(assert (=> d!22294 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111142)))) ((_ sign_extend 32) (currentByte!3430 thiss!1379)) ((_ sign_extend 32) (currentBit!3425 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1347 (buf!1728 (_2!3137 lt!111142)))) ((_ sign_extend 32) (currentByte!3430 thiss!1379)) ((_ sign_extend 32) (currentBit!3425 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5360 () Bool)

(assert (= bs!5360 d!22294))

(declare-fun m!111403 () Bool)

(assert (=> bs!5360 m!111403))

(assert (=> b!69301 d!22294))

(declare-fun b!69641 () Bool)

(declare-fun e!45449 () Bool)

(declare-fun lt!111763 () List!724)

(assert (=> b!69641 (= e!45449 (isEmpty!222 lt!111763))))

(declare-fun d!22296 () Bool)

(assert (=> d!22296 e!45449))

(declare-fun c!5163 () Bool)

(assert (=> d!22296 (= c!5163 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!45448 () tuple2!6064)

(assert (=> d!22296 (= lt!111763 (_1!3143 e!45448))))

(declare-fun c!5164 () Bool)

(assert (=> d!22296 (= c!5164 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22296 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22296 (= (bitStreamReadBitsIntoList!0 (_2!3137 lt!111142) (_1!3138 lt!111136) (bvsub to!314 i!635)) lt!111763)))

(declare-fun b!69640 () Bool)

(declare-fun lt!111762 () (_ BitVec 64))

(declare-fun lt!111764 () tuple2!6066)

(assert (=> b!69640 (= e!45448 (tuple2!6065 (Cons!720 (_1!3144 lt!111764) (bitStreamReadBitsIntoList!0 (_2!3137 lt!111142) (_2!3144 lt!111764) (bvsub (bvsub to!314 i!635) lt!111762))) (_2!3144 lt!111764)))))

(assert (=> b!69640 (= lt!111764 (readBit!0 (_1!3138 lt!111136)))))

(assert (=> b!69640 (= lt!111762 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!69639 () Bool)

(assert (=> b!69639 (= e!45448 (tuple2!6065 Nil!721 (_1!3138 lt!111136)))))

(declare-fun b!69642 () Bool)

(assert (=> b!69642 (= e!45449 (> (length!352 lt!111763) 0))))

(assert (= (and d!22296 c!5164) b!69639))

(assert (= (and d!22296 (not c!5164)) b!69640))

(assert (= (and d!22296 c!5163) b!69641))

(assert (= (and d!22296 (not c!5163)) b!69642))

(declare-fun m!111405 () Bool)

(assert (=> b!69641 m!111405))

(declare-fun m!111407 () Bool)

(assert (=> b!69640 m!111407))

(declare-fun m!111409 () Bool)

(assert (=> b!69640 m!111409))

(declare-fun m!111411 () Bool)

(assert (=> b!69642 m!111411))

(assert (=> b!69301 d!22296))

(declare-fun d!22298 () Bool)

(assert (=> d!22298 (= (array_inv!1208 (buf!1728 thiss!1379)) (bvsge (size!1347 (buf!1728 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!69300 d!22298))

(check-sat (not d!22156) (not b!69437) (not d!22130) (not d!22118) (not b!69635) (not b!69604) (not d!22294) (not b!69621) (not d!22292) (not b!69603) (not b!69392) (not d!22174) (not b!69609) (not b!69416) (not b!69627) (not b!69634) (not b!69601) (not b!69630) (not b!69629) (not b!69599) (not d!22152) (not b!69607) (not b!69641) (not b!69417) (not b!69420) (not b!69642) (not b!69632) (not d!22138) (not b!69436) (not d!22274) (not b!69620) (not b!69376) (not b!69385) (not b!69623) (not b!69628) (not d!22146) (not b!69395) (not bm!889) (not b!69413) (not d!22124) (not b!69598) (not d!22286) (not b!69636) (not d!22176) (not b!69440) (not d!22136) (not b!69414) (not d!22290) (not b!69415) (not b!69390) (not d!22284) (not b!69631) (not d!22140) (not b!69419) (not d!22288) (not b!69374) (not b!69426) (not b!69597) (not d!22272) (not b!69640) (not b!69622) (not b!69600) (not b!69438) (not b!69626) (not b!69606) (not d!22154) (not d!22280) (not d!22120) (not b!69637) (not b!69418))
(check-sat)
