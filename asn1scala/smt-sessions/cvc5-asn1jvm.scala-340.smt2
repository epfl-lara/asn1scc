; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8072 () Bool)

(assert start!8072)

(declare-fun b!40079 () Bool)

(declare-fun e!26359 () Bool)

(declare-fun e!26365 () Bool)

(assert (=> b!40079 (= e!26359 e!26365)))

(declare-fun res!34055 () Bool)

(assert (=> b!40079 (=> res!34055 e!26365)))

(declare-datatypes ((array!1994 0))(
  ( (array!1995 (arr!1400 (Array (_ BitVec 32) (_ BitVec 8))) (size!901 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1546 0))(
  ( (BitStream!1547 (buf!1229 array!1994) (currentByte!2647 (_ BitVec 32)) (currentBit!2642 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2847 0))(
  ( (Unit!2848) )
))
(declare-datatypes ((tuple2!3850 0))(
  ( (tuple2!3851 (_1!2012 Unit!2847) (_2!2012 BitStream!1546)) )
))
(declare-fun lt!61144 () tuple2!3850)

(declare-fun lt!61142 () tuple2!3850)

(declare-fun isPrefixOf!0 (BitStream!1546 BitStream!1546) Bool)

(assert (=> b!40079 (= res!34055 (not (isPrefixOf!0 (_2!2012 lt!61144) (_2!2012 lt!61142))))))

(declare-fun thiss!1379 () BitStream!1546)

(assert (=> b!40079 (isPrefixOf!0 thiss!1379 (_2!2012 lt!61142))))

(declare-fun lt!61149 () Unit!2847)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1546 BitStream!1546 BitStream!1546) Unit!2847)

(assert (=> b!40079 (= lt!61149 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2012 lt!61144) (_2!2012 lt!61142)))))

(declare-fun srcBuffer!2 () array!1994)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1546 array!1994 (_ BitVec 64) (_ BitVec 64)) tuple2!3850)

(assert (=> b!40079 (= lt!61142 (appendBitsMSBFirstLoop!0 (_2!2012 lt!61144) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!26362 () Bool)

(assert (=> b!40079 e!26362))

(declare-fun res!34049 () Bool)

(assert (=> b!40079 (=> (not res!34049) (not e!26362))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!40079 (= res!34049 (validate_offset_bits!1 ((_ sign_extend 32) (size!901 (buf!1229 (_2!2012 lt!61144)))) ((_ sign_extend 32) (currentByte!2647 thiss!1379)) ((_ sign_extend 32) (currentBit!2642 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!61154 () Unit!2847)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1546 array!1994 (_ BitVec 64)) Unit!2847)

(assert (=> b!40079 (= lt!61154 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1229 (_2!2012 lt!61144)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!3852 0))(
  ( (tuple2!3853 (_1!2013 BitStream!1546) (_2!2013 BitStream!1546)) )
))
(declare-fun lt!61157 () tuple2!3852)

(declare-fun reader!0 (BitStream!1546 BitStream!1546) tuple2!3852)

(assert (=> b!40079 (= lt!61157 (reader!0 thiss!1379 (_2!2012 lt!61144)))))

(declare-fun b!40080 () Bool)

(declare-fun e!26353 () Bool)

(assert (=> b!40080 (= e!26365 e!26353)))

(declare-fun res!34050 () Bool)

(assert (=> b!40080 (=> res!34050 e!26353)))

(declare-fun lt!61160 () (_ BitVec 64))

(declare-fun lt!61155 () (_ BitVec 64))

(assert (=> b!40080 (= res!34050 (not (= lt!61155 (bvsub (bvadd lt!61160 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!40080 (= lt!61155 (bitIndex!0 (size!901 (buf!1229 (_2!2012 lt!61142))) (currentByte!2647 (_2!2012 lt!61142)) (currentBit!2642 (_2!2012 lt!61142))))))

(declare-fun b!40081 () Bool)

(declare-fun e!26356 () Bool)

(declare-fun array_inv!826 (array!1994) Bool)

(assert (=> b!40081 (= e!26356 (array_inv!826 (buf!1229 thiss!1379)))))

(declare-fun b!40082 () Bool)

(declare-fun e!26368 () Bool)

(assert (=> b!40082 (= e!26368 true)))

(declare-datatypes ((tuple2!3854 0))(
  ( (tuple2!3855 (_1!2014 BitStream!1546) (_2!2014 Bool)) )
))
(declare-fun lt!61152 () tuple2!3854)

(declare-fun lt!61148 () tuple2!3852)

(declare-fun readBitPure!0 (BitStream!1546) tuple2!3854)

(assert (=> b!40082 (= lt!61152 (readBitPure!0 (_1!2013 lt!61148)))))

(declare-fun b!40083 () Bool)

(declare-fun e!26366 () Bool)

(assert (=> b!40083 (= e!26366 e!26368)))

(declare-fun res!34044 () Bool)

(assert (=> b!40083 (=> res!34044 e!26368)))

(declare-fun lt!61141 () Bool)

(declare-fun lt!61151 () Bool)

(assert (=> b!40083 (= res!34044 (not (= lt!61141 lt!61151)))))

(declare-fun lt!61150 () Bool)

(assert (=> b!40083 (= lt!61150 lt!61141)))

(declare-fun bitAt!0 (array!1994 (_ BitVec 64)) Bool)

(assert (=> b!40083 (= lt!61141 (bitAt!0 (buf!1229 (_2!2012 lt!61142)) lt!61160))))

(declare-fun lt!61143 () Unit!2847)

(declare-fun lt!61153 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1994 array!1994 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2847)

(assert (=> b!40083 (= lt!61143 (arrayBitRangesEqImpliesEq!0 (buf!1229 (_2!2012 lt!61144)) (buf!1229 (_2!2012 lt!61142)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!61160 lt!61153))))

(declare-fun res!34046 () Bool)

(declare-fun e!26363 () Bool)

(assert (=> start!8072 (=> (not res!34046) (not e!26363))))

(assert (=> start!8072 (= res!34046 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!901 srcBuffer!2))))))))

(assert (=> start!8072 e!26363))

(assert (=> start!8072 true))

(assert (=> start!8072 (array_inv!826 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1546) Bool)

(assert (=> start!8072 (and (inv!12 thiss!1379) e!26356)))

(declare-fun b!40084 () Bool)

(declare-fun res!34048 () Bool)

(assert (=> b!40084 (=> res!34048 e!26353)))

(assert (=> b!40084 (= res!34048 (not (= (size!901 (buf!1229 thiss!1379)) (size!901 (buf!1229 (_2!2012 lt!61142))))))))

(declare-fun b!40085 () Bool)

(declare-fun res!34052 () Bool)

(assert (=> b!40085 (=> res!34052 e!26353)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!40085 (= res!34052 (not (invariant!0 (currentBit!2642 (_2!2012 lt!61142)) (currentByte!2647 (_2!2012 lt!61142)) (size!901 (buf!1229 (_2!2012 lt!61142))))))))

(declare-fun b!40086 () Bool)

(declare-fun e!26357 () Bool)

(declare-fun e!26358 () Bool)

(assert (=> b!40086 (= e!26357 e!26358)))

(declare-fun res!34041 () Bool)

(assert (=> b!40086 (=> res!34041 e!26358)))

(assert (=> b!40086 (= res!34041 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!474 0))(
  ( (Nil!471) (Cons!470 (h!589 Bool) (t!1224 List!474)) )
))
(declare-fun lt!61146 () List!474)

(declare-fun lt!61161 () tuple2!3852)

(declare-fun lt!61159 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1546 BitStream!1546 (_ BitVec 64)) List!474)

(assert (=> b!40086 (= lt!61146 (bitStreamReadBitsIntoList!0 (_2!2012 lt!61142) (_1!2013 lt!61161) lt!61159))))

(declare-fun lt!61158 () List!474)

(assert (=> b!40086 (= lt!61158 (bitStreamReadBitsIntoList!0 (_2!2012 lt!61142) (_1!2013 lt!61148) (bvsub to!314 i!635)))))

(assert (=> b!40086 (validate_offset_bits!1 ((_ sign_extend 32) (size!901 (buf!1229 (_2!2012 lt!61142)))) ((_ sign_extend 32) (currentByte!2647 (_2!2012 lt!61144))) ((_ sign_extend 32) (currentBit!2642 (_2!2012 lt!61144))) lt!61159)))

(declare-fun lt!61162 () Unit!2847)

(assert (=> b!40086 (= lt!61162 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2012 lt!61144) (buf!1229 (_2!2012 lt!61142)) lt!61159))))

(assert (=> b!40086 (= lt!61161 (reader!0 (_2!2012 lt!61144) (_2!2012 lt!61142)))))

(assert (=> b!40086 (validate_offset_bits!1 ((_ sign_extend 32) (size!901 (buf!1229 (_2!2012 lt!61142)))) ((_ sign_extend 32) (currentByte!2647 thiss!1379)) ((_ sign_extend 32) (currentBit!2642 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!61156 () Unit!2847)

(assert (=> b!40086 (= lt!61156 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1229 (_2!2012 lt!61142)) (bvsub to!314 i!635)))))

(assert (=> b!40086 (= lt!61148 (reader!0 thiss!1379 (_2!2012 lt!61142)))))

(declare-fun b!40087 () Bool)

(declare-fun e!26360 () Bool)

(assert (=> b!40087 (= e!26358 e!26360)))

(declare-fun res!34056 () Bool)

(assert (=> b!40087 (=> res!34056 e!26360)))

(declare-fun lt!61139 () List!474)

(assert (=> b!40087 (= res!34056 (not (= lt!61139 lt!61146)))))

(assert (=> b!40087 (= lt!61146 lt!61139)))

(declare-fun tail!191 (List!474) List!474)

(assert (=> b!40087 (= lt!61139 (tail!191 lt!61158))))

(declare-fun lt!61147 () Unit!2847)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1546 BitStream!1546 BitStream!1546 BitStream!1546 (_ BitVec 64) List!474) Unit!2847)

(assert (=> b!40087 (= lt!61147 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2012 lt!61142) (_2!2012 lt!61142) (_1!2013 lt!61148) (_1!2013 lt!61161) (bvsub to!314 i!635) lt!61158))))

(declare-fun b!40088 () Bool)

(declare-fun res!34047 () Bool)

(assert (=> b!40088 (=> (not res!34047) (not e!26363))))

(assert (=> b!40088 (= res!34047 (validate_offset_bits!1 ((_ sign_extend 32) (size!901 (buf!1229 thiss!1379))) ((_ sign_extend 32) (currentByte!2647 thiss!1379)) ((_ sign_extend 32) (currentBit!2642 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!40089 () Bool)

(declare-fun res!34042 () Bool)

(assert (=> b!40089 (=> res!34042 e!26357)))

(assert (=> b!40089 (= res!34042 (not (invariant!0 (currentBit!2642 (_2!2012 lt!61144)) (currentByte!2647 (_2!2012 lt!61144)) (size!901 (buf!1229 (_2!2012 lt!61142))))))))

(declare-fun b!40090 () Bool)

(declare-fun res!34054 () Bool)

(declare-fun e!26355 () Bool)

(assert (=> b!40090 (=> res!34054 e!26355)))

(declare-fun lt!61140 () Bool)

(declare-fun head!311 (List!474) Bool)

(assert (=> b!40090 (= res!34054 (not (= (head!311 lt!61158) lt!61140)))))

(declare-fun b!40091 () Bool)

(assert (=> b!40091 (= e!26360 e!26355)))

(declare-fun res!34051 () Bool)

(assert (=> b!40091 (=> res!34051 e!26355)))

(assert (=> b!40091 (= res!34051 (not (= lt!61140 (bitAt!0 (buf!1229 (_1!2013 lt!61161)) lt!61160))))))

(assert (=> b!40091 (= lt!61140 (bitAt!0 (buf!1229 (_1!2013 lt!61148)) lt!61160))))

(declare-fun b!40092 () Bool)

(assert (=> b!40092 (= e!26353 e!26357)))

(declare-fun res!34057 () Bool)

(assert (=> b!40092 (=> res!34057 e!26357)))

(assert (=> b!40092 (= res!34057 (not (= (size!901 (buf!1229 (_2!2012 lt!61144))) (size!901 (buf!1229 (_2!2012 lt!61142))))))))

(assert (=> b!40092 (= lt!61155 (bvsub (bvsub (bvadd lt!61153 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!40092 (= lt!61153 (bitIndex!0 (size!901 (buf!1229 (_2!2012 lt!61144))) (currentByte!2647 (_2!2012 lt!61144)) (currentBit!2642 (_2!2012 lt!61144))))))

(assert (=> b!40092 (= (size!901 (buf!1229 (_2!2012 lt!61142))) (size!901 (buf!1229 thiss!1379)))))

(declare-fun b!40093 () Bool)

(declare-fun e!26361 () Bool)

(assert (=> b!40093 (= e!26363 (not e!26361))))

(declare-fun res!34059 () Bool)

(assert (=> b!40093 (=> res!34059 e!26361)))

(assert (=> b!40093 (= res!34059 (bvsge i!635 to!314))))

(assert (=> b!40093 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!61145 () Unit!2847)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1546) Unit!2847)

(assert (=> b!40093 (= lt!61145 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!40093 (= lt!61160 (bitIndex!0 (size!901 (buf!1229 thiss!1379)) (currentByte!2647 thiss!1379) (currentBit!2642 thiss!1379)))))

(declare-fun b!40094 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1546 array!1994 (_ BitVec 64) (_ BitVec 64)) List!474)

(assert (=> b!40094 (= e!26362 (= (head!311 (byteArrayBitContentToList!0 (_2!2012 lt!61144) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!311 (bitStreamReadBitsIntoList!0 (_2!2012 lt!61144) (_1!2013 lt!61157) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!40095 () Bool)

(declare-fun e!26354 () Bool)

(assert (=> b!40095 (= e!26354 e!26366)))

(declare-fun res!34040 () Bool)

(assert (=> b!40095 (=> res!34040 e!26366)))

(assert (=> b!40095 (= res!34040 (not (= lt!61150 lt!61151)))))

(assert (=> b!40095 (= lt!61150 (bitAt!0 (buf!1229 (_2!2012 lt!61144)) lt!61160))))

(declare-fun b!40096 () Bool)

(declare-fun res!34053 () Bool)

(assert (=> b!40096 (=> res!34053 e!26358)))

(declare-fun length!200 (List!474) Int)

(assert (=> b!40096 (= res!34053 (<= (length!200 lt!61158) 0))))

(declare-fun b!40097 () Bool)

(declare-fun res!34058 () Bool)

(assert (=> b!40097 (=> res!34058 e!26357)))

(assert (=> b!40097 (= res!34058 (not (invariant!0 (currentBit!2642 (_2!2012 lt!61144)) (currentByte!2647 (_2!2012 lt!61144)) (size!901 (buf!1229 (_2!2012 lt!61144))))))))

(declare-fun b!40098 () Bool)

(assert (=> b!40098 (= e!26355 e!26354)))

(declare-fun res!34045 () Bool)

(assert (=> b!40098 (=> res!34045 e!26354)))

(assert (=> b!40098 (= res!34045 (not (= (head!311 (byteArrayBitContentToList!0 (_2!2012 lt!61142) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!61151)))))

(assert (=> b!40098 (= lt!61151 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!40099 () Bool)

(assert (=> b!40099 (= e!26361 e!26359)))

(declare-fun res!34043 () Bool)

(assert (=> b!40099 (=> res!34043 e!26359)))

(assert (=> b!40099 (= res!34043 (not (isPrefixOf!0 thiss!1379 (_2!2012 lt!61144))))))

(assert (=> b!40099 (validate_offset_bits!1 ((_ sign_extend 32) (size!901 (buf!1229 (_2!2012 lt!61144)))) ((_ sign_extend 32) (currentByte!2647 (_2!2012 lt!61144))) ((_ sign_extend 32) (currentBit!2642 (_2!2012 lt!61144))) lt!61159)))

(assert (=> b!40099 (= lt!61159 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!61138 () Unit!2847)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1546 BitStream!1546 (_ BitVec 64) (_ BitVec 64)) Unit!2847)

(assert (=> b!40099 (= lt!61138 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2012 lt!61144) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1546 (_ BitVec 8) (_ BitVec 32)) tuple2!3850)

(assert (=> b!40099 (= lt!61144 (appendBitFromByte!0 thiss!1379 (select (arr!1400 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!8072 res!34046) b!40088))

(assert (= (and b!40088 res!34047) b!40093))

(assert (= (and b!40093 (not res!34059)) b!40099))

(assert (= (and b!40099 (not res!34043)) b!40079))

(assert (= (and b!40079 res!34049) b!40094))

(assert (= (and b!40079 (not res!34055)) b!40080))

(assert (= (and b!40080 (not res!34050)) b!40085))

(assert (= (and b!40085 (not res!34052)) b!40084))

(assert (= (and b!40084 (not res!34048)) b!40092))

(assert (= (and b!40092 (not res!34057)) b!40097))

(assert (= (and b!40097 (not res!34058)) b!40089))

(assert (= (and b!40089 (not res!34042)) b!40086))

(assert (= (and b!40086 (not res!34041)) b!40096))

(assert (= (and b!40096 (not res!34053)) b!40087))

(assert (= (and b!40087 (not res!34056)) b!40091))

(assert (= (and b!40091 (not res!34051)) b!40090))

(assert (= (and b!40090 (not res!34054)) b!40098))

(assert (= (and b!40098 (not res!34045)) b!40095))

(assert (= (and b!40095 (not res!34040)) b!40083))

(assert (= (and b!40083 (not res!34044)) b!40082))

(assert (= start!8072 b!40081))

(declare-fun m!61281 () Bool)

(assert (=> b!40098 m!61281))

(assert (=> b!40098 m!61281))

(declare-fun m!61283 () Bool)

(assert (=> b!40098 m!61283))

(declare-fun m!61285 () Bool)

(assert (=> b!40098 m!61285))

(declare-fun m!61287 () Bool)

(assert (=> b!40089 m!61287))

(declare-fun m!61289 () Bool)

(assert (=> b!40093 m!61289))

(declare-fun m!61291 () Bool)

(assert (=> b!40093 m!61291))

(declare-fun m!61293 () Bool)

(assert (=> b!40093 m!61293))

(declare-fun m!61295 () Bool)

(assert (=> b!40095 m!61295))

(declare-fun m!61297 () Bool)

(assert (=> b!40080 m!61297))

(declare-fun m!61299 () Bool)

(assert (=> b!40081 m!61299))

(declare-fun m!61301 () Bool)

(assert (=> b!40090 m!61301))

(declare-fun m!61303 () Bool)

(assert (=> b!40092 m!61303))

(declare-fun m!61305 () Bool)

(assert (=> b!40097 m!61305))

(declare-fun m!61307 () Bool)

(assert (=> b!40096 m!61307))

(declare-fun m!61309 () Bool)

(assert (=> b!40085 m!61309))

(declare-fun m!61311 () Bool)

(assert (=> b!40083 m!61311))

(declare-fun m!61313 () Bool)

(assert (=> b!40083 m!61313))

(declare-fun m!61315 () Bool)

(assert (=> b!40088 m!61315))

(declare-fun m!61317 () Bool)

(assert (=> b!40087 m!61317))

(declare-fun m!61319 () Bool)

(assert (=> b!40087 m!61319))

(declare-fun m!61321 () Bool)

(assert (=> b!40079 m!61321))

(declare-fun m!61323 () Bool)

(assert (=> b!40079 m!61323))

(declare-fun m!61325 () Bool)

(assert (=> b!40079 m!61325))

(declare-fun m!61327 () Bool)

(assert (=> b!40079 m!61327))

(declare-fun m!61329 () Bool)

(assert (=> b!40079 m!61329))

(declare-fun m!61331 () Bool)

(assert (=> b!40079 m!61331))

(declare-fun m!61333 () Bool)

(assert (=> b!40079 m!61333))

(declare-fun m!61335 () Bool)

(assert (=> b!40099 m!61335))

(declare-fun m!61337 () Bool)

(assert (=> b!40099 m!61337))

(declare-fun m!61339 () Bool)

(assert (=> b!40099 m!61339))

(assert (=> b!40099 m!61339))

(declare-fun m!61341 () Bool)

(assert (=> b!40099 m!61341))

(declare-fun m!61343 () Bool)

(assert (=> b!40099 m!61343))

(declare-fun m!61345 () Bool)

(assert (=> start!8072 m!61345))

(declare-fun m!61347 () Bool)

(assert (=> start!8072 m!61347))

(declare-fun m!61349 () Bool)

(assert (=> b!40091 m!61349))

(declare-fun m!61351 () Bool)

(assert (=> b!40091 m!61351))

(declare-fun m!61353 () Bool)

(assert (=> b!40086 m!61353))

(declare-fun m!61355 () Bool)

(assert (=> b!40086 m!61355))

(declare-fun m!61357 () Bool)

(assert (=> b!40086 m!61357))

(declare-fun m!61359 () Bool)

(assert (=> b!40086 m!61359))

(declare-fun m!61361 () Bool)

(assert (=> b!40086 m!61361))

(declare-fun m!61363 () Bool)

(assert (=> b!40086 m!61363))

(declare-fun m!61365 () Bool)

(assert (=> b!40086 m!61365))

(declare-fun m!61367 () Bool)

(assert (=> b!40086 m!61367))

(declare-fun m!61369 () Bool)

(assert (=> b!40082 m!61369))

(declare-fun m!61371 () Bool)

(assert (=> b!40094 m!61371))

(assert (=> b!40094 m!61371))

(declare-fun m!61373 () Bool)

(assert (=> b!40094 m!61373))

(declare-fun m!61375 () Bool)

(assert (=> b!40094 m!61375))

(assert (=> b!40094 m!61375))

(declare-fun m!61377 () Bool)

(assert (=> b!40094 m!61377))

(push 1)

(assert (not b!40090))

(assert (not b!40081))

(assert (not b!40095))

(assert (not b!40083))

(assert (not b!40088))

(assert (not b!40092))

(assert (not b!40079))

(assert (not start!8072))

(assert (not b!40086))

(assert (not b!40094))

(assert (not b!40093))

(assert (not b!40097))

(assert (not b!40091))

(assert (not b!40089))

(assert (not b!40087))

(assert (not b!40082))

(assert (not b!40096))

(assert (not b!40099))

(assert (not b!40080))

(assert (not b!40085))

(assert (not b!40098))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

