; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7920 () Bool)

(assert start!7920)

(declare-fun b!39023 () Bool)

(declare-fun e!25661 () Bool)

(declare-fun e!25665 () Bool)

(assert (=> b!39023 (= e!25661 e!25665)))

(declare-fun res!33165 () Bool)

(assert (=> b!39023 (=> res!33165 e!25665)))

(declare-fun lt!59373 () Bool)

(declare-datatypes ((array!1971 0))(
  ( (array!1972 (arr!1384 (Array (_ BitVec 32) (_ BitVec 8))) (size!888 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1526 0))(
  ( (BitStream!1527 (buf!1216 array!1971) (currentByte!2628 (_ BitVec 32)) (currentBit!2623 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3772 0))(
  ( (tuple2!3773 (_1!1973 BitStream!1526) (_2!1973 BitStream!1526)) )
))
(declare-fun lt!59367 () tuple2!3772)

(declare-fun lt!59379 () (_ BitVec 64))

(declare-fun bitAt!0 (array!1971 (_ BitVec 64)) Bool)

(assert (=> b!39023 (= res!33165 (not (= lt!59373 (bitAt!0 (buf!1216 (_1!1973 lt!59367)) lt!59379))))))

(declare-fun lt!59372 () tuple2!3772)

(assert (=> b!39023 (= lt!59373 (bitAt!0 (buf!1216 (_1!1973 lt!59372)) lt!59379))))

(declare-fun b!39024 () Bool)

(declare-fun res!33159 () Bool)

(declare-fun e!25674 () Bool)

(assert (=> b!39024 (=> res!33159 e!25674)))

(declare-datatypes ((Unit!2797 0))(
  ( (Unit!2798) )
))
(declare-datatypes ((tuple2!3774 0))(
  ( (tuple2!3775 (_1!1974 Unit!2797) (_2!1974 BitStream!1526)) )
))
(declare-fun lt!59365 () tuple2!3774)

(declare-fun lt!59383 () tuple2!3774)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!39024 (= res!33159 (not (invariant!0 (currentBit!2623 (_2!1974 lt!59365)) (currentByte!2628 (_2!1974 lt!59365)) (size!888 (buf!1216 (_2!1974 lt!59383))))))))

(declare-fun b!39025 () Bool)

(declare-fun res!33153 () Bool)

(declare-fun e!25668 () Bool)

(assert (=> b!39025 (=> res!33153 e!25668)))

(declare-fun thiss!1379 () BitStream!1526)

(assert (=> b!39025 (= res!33153 (not (= (size!888 (buf!1216 thiss!1379)) (size!888 (buf!1216 (_2!1974 lt!59383))))))))

(declare-fun b!39026 () Bool)

(declare-fun e!25675 () Bool)

(declare-fun e!25667 () Bool)

(assert (=> b!39026 (= e!25675 e!25667)))

(declare-fun res!33164 () Bool)

(assert (=> b!39026 (=> res!33164 e!25667)))

(declare-fun lt!59380 () Bool)

(declare-fun lt!59378 () Bool)

(assert (=> b!39026 (= res!33164 (not (= lt!59380 lt!59378)))))

(assert (=> b!39026 (= lt!59380 (bitAt!0 (buf!1216 (_2!1974 lt!59365)) lt!59379))))

(declare-fun b!39027 () Bool)

(declare-fun e!25670 () Bool)

(declare-fun array_inv!816 (array!1971) Bool)

(assert (=> b!39027 (= e!25670 (array_inv!816 (buf!1216 thiss!1379)))))

(declare-fun b!39028 () Bool)

(declare-fun res!33155 () Bool)

(assert (=> b!39028 (=> res!33155 e!25668)))

(assert (=> b!39028 (= res!33155 (not (invariant!0 (currentBit!2623 (_2!1974 lt!59383)) (currentByte!2628 (_2!1974 lt!59383)) (size!888 (buf!1216 (_2!1974 lt!59383))))))))

(declare-fun b!39029 () Bool)

(declare-fun e!25672 () Bool)

(assert (=> b!39029 (= e!25672 e!25661)))

(declare-fun res!33168 () Bool)

(assert (=> b!39029 (=> res!33168 e!25661)))

(declare-datatypes ((List!464 0))(
  ( (Nil!461) (Cons!460 (h!579 Bool) (t!1214 List!464)) )
))
(declare-fun lt!59362 () List!464)

(declare-fun lt!59382 () List!464)

(assert (=> b!39029 (= res!33168 (not (= lt!59362 lt!59382)))))

(assert (=> b!39029 (= lt!59382 lt!59362)))

(declare-fun lt!59370 () List!464)

(declare-fun tail!181 (List!464) List!464)

(assert (=> b!39029 (= lt!59362 (tail!181 lt!59370))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!59366 () Unit!2797)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1526 BitStream!1526 BitStream!1526 BitStream!1526 (_ BitVec 64) List!464) Unit!2797)

(assert (=> b!39029 (= lt!59366 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1974 lt!59383) (_2!1974 lt!59383) (_1!1973 lt!59372) (_1!1973 lt!59367) (bvsub to!314 i!635) lt!59370))))

(declare-fun srcBuffer!2 () array!1971)

(declare-fun b!39030 () Bool)

(declare-fun lt!59369 () tuple2!3772)

(declare-fun e!25663 () Bool)

(declare-fun head!301 (List!464) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1526 array!1971 (_ BitVec 64) (_ BitVec 64)) List!464)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1526 BitStream!1526 (_ BitVec 64)) List!464)

(assert (=> b!39030 (= e!25663 (= (head!301 (byteArrayBitContentToList!0 (_2!1974 lt!59365) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!301 (bitStreamReadBitsIntoList!0 (_2!1974 lt!59365) (_1!1973 lt!59369) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!39031 () Bool)

(declare-fun e!25660 () Bool)

(assert (=> b!39031 (= e!25660 true)))

(declare-datatypes ((tuple2!3776 0))(
  ( (tuple2!3777 (_1!1975 BitStream!1526) (_2!1975 Bool)) )
))
(declare-fun lt!59375 () tuple2!3776)

(declare-fun readBitPure!0 (BitStream!1526) tuple2!3776)

(assert (=> b!39031 (= lt!59375 (readBitPure!0 (_1!1973 lt!59372)))))

(declare-fun res!33150 () Bool)

(declare-fun e!25671 () Bool)

(assert (=> start!7920 (=> (not res!33150) (not e!25671))))

(assert (=> start!7920 (= res!33150 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!888 srcBuffer!2))))))))

(assert (=> start!7920 e!25671))

(assert (=> start!7920 true))

(assert (=> start!7920 (array_inv!816 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1526) Bool)

(assert (=> start!7920 (and (inv!12 thiss!1379) e!25670)))

(declare-fun b!39032 () Bool)

(declare-fun e!25664 () Bool)

(declare-fun e!25673 () Bool)

(assert (=> b!39032 (= e!25664 e!25673)))

(declare-fun res!33149 () Bool)

(assert (=> b!39032 (=> res!33149 e!25673)))

(declare-fun isPrefixOf!0 (BitStream!1526 BitStream!1526) Bool)

(assert (=> b!39032 (= res!33149 (not (isPrefixOf!0 (_2!1974 lt!59365) (_2!1974 lt!59383))))))

(assert (=> b!39032 (isPrefixOf!0 thiss!1379 (_2!1974 lt!59383))))

(declare-fun lt!59371 () Unit!2797)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1526 BitStream!1526 BitStream!1526) Unit!2797)

(assert (=> b!39032 (= lt!59371 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1974 lt!59365) (_2!1974 lt!59383)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1526 array!1971 (_ BitVec 64) (_ BitVec 64)) tuple2!3774)

(assert (=> b!39032 (= lt!59383 (appendBitsMSBFirstLoop!0 (_2!1974 lt!59365) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!39032 e!25663))

(declare-fun res!33167 () Bool)

(assert (=> b!39032 (=> (not res!33167) (not e!25663))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!39032 (= res!33167 (validate_offset_bits!1 ((_ sign_extend 32) (size!888 (buf!1216 (_2!1974 lt!59365)))) ((_ sign_extend 32) (currentByte!2628 thiss!1379)) ((_ sign_extend 32) (currentBit!2623 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59381 () Unit!2797)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1526 array!1971 (_ BitVec 64)) Unit!2797)

(assert (=> b!39032 (= lt!59381 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1216 (_2!1974 lt!59365)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1526 BitStream!1526) tuple2!3772)

(assert (=> b!39032 (= lt!59369 (reader!0 thiss!1379 (_2!1974 lt!59365)))))

(declare-fun b!39033 () Bool)

(assert (=> b!39033 (= e!25667 e!25660)))

(declare-fun res!33156 () Bool)

(assert (=> b!39033 (=> res!33156 e!25660)))

(declare-fun lt!59368 () Bool)

(assert (=> b!39033 (= res!33156 (not (= lt!59368 lt!59378)))))

(assert (=> b!39033 (= lt!59380 lt!59368)))

(assert (=> b!39033 (= lt!59368 (bitAt!0 (buf!1216 (_2!1974 lt!59383)) lt!59379))))

(declare-fun lt!59363 () Unit!2797)

(declare-fun lt!59385 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1971 array!1971 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2797)

(assert (=> b!39033 (= lt!59363 (arrayBitRangesEqImpliesEq!0 (buf!1216 (_2!1974 lt!59365)) (buf!1216 (_2!1974 lt!59383)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!59379 lt!59385))))

(declare-fun b!39034 () Bool)

(declare-fun res!33152 () Bool)

(assert (=> b!39034 (=> (not res!33152) (not e!25671))))

(assert (=> b!39034 (= res!33152 (validate_offset_bits!1 ((_ sign_extend 32) (size!888 (buf!1216 thiss!1379))) ((_ sign_extend 32) (currentByte!2628 thiss!1379)) ((_ sign_extend 32) (currentBit!2623 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!39035 () Bool)

(declare-fun res!33151 () Bool)

(assert (=> b!39035 (=> res!33151 e!25665)))

(assert (=> b!39035 (= res!33151 (not (= (head!301 lt!59370) lt!59373)))))

(declare-fun b!39036 () Bool)

(assert (=> b!39036 (= e!25674 e!25672)))

(declare-fun res!33163 () Bool)

(assert (=> b!39036 (=> res!33163 e!25672)))

(assert (=> b!39036 (= res!33163 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!59374 () (_ BitVec 64))

(assert (=> b!39036 (= lt!59382 (bitStreamReadBitsIntoList!0 (_2!1974 lt!59383) (_1!1973 lt!59367) lt!59374))))

(assert (=> b!39036 (= lt!59370 (bitStreamReadBitsIntoList!0 (_2!1974 lt!59383) (_1!1973 lt!59372) (bvsub to!314 i!635)))))

(assert (=> b!39036 (validate_offset_bits!1 ((_ sign_extend 32) (size!888 (buf!1216 (_2!1974 lt!59383)))) ((_ sign_extend 32) (currentByte!2628 (_2!1974 lt!59365))) ((_ sign_extend 32) (currentBit!2623 (_2!1974 lt!59365))) lt!59374)))

(declare-fun lt!59364 () Unit!2797)

(assert (=> b!39036 (= lt!59364 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1974 lt!59365) (buf!1216 (_2!1974 lt!59383)) lt!59374))))

(assert (=> b!39036 (= lt!59367 (reader!0 (_2!1974 lt!59365) (_2!1974 lt!59383)))))

(assert (=> b!39036 (validate_offset_bits!1 ((_ sign_extend 32) (size!888 (buf!1216 (_2!1974 lt!59383)))) ((_ sign_extend 32) (currentByte!2628 thiss!1379)) ((_ sign_extend 32) (currentBit!2623 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!59376 () Unit!2797)

(assert (=> b!39036 (= lt!59376 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1216 (_2!1974 lt!59383)) (bvsub to!314 i!635)))))

(assert (=> b!39036 (= lt!59372 (reader!0 thiss!1379 (_2!1974 lt!59383)))))

(declare-fun b!39037 () Bool)

(assert (=> b!39037 (= e!25668 e!25674)))

(declare-fun res!33166 () Bool)

(assert (=> b!39037 (=> res!33166 e!25674)))

(assert (=> b!39037 (= res!33166 (not (= (size!888 (buf!1216 (_2!1974 lt!59365))) (size!888 (buf!1216 (_2!1974 lt!59383))))))))

(declare-fun lt!59386 () (_ BitVec 64))

(assert (=> b!39037 (= lt!59386 (bvsub (bvsub (bvadd lt!59385 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!39037 (= lt!59385 (bitIndex!0 (size!888 (buf!1216 (_2!1974 lt!59365))) (currentByte!2628 (_2!1974 lt!59365)) (currentBit!2623 (_2!1974 lt!59365))))))

(assert (=> b!39037 (= (size!888 (buf!1216 (_2!1974 lt!59383))) (size!888 (buf!1216 thiss!1379)))))

(declare-fun b!39038 () Bool)

(declare-fun res!33158 () Bool)

(assert (=> b!39038 (=> res!33158 e!25672)))

(declare-fun length!190 (List!464) Int)

(assert (=> b!39038 (= res!33158 (<= (length!190 lt!59370) 0))))

(declare-fun b!39039 () Bool)

(declare-fun e!25666 () Bool)

(assert (=> b!39039 (= e!25671 (not e!25666))))

(declare-fun res!33160 () Bool)

(assert (=> b!39039 (=> res!33160 e!25666)))

(assert (=> b!39039 (= res!33160 (bvsge i!635 to!314))))

(assert (=> b!39039 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!59377 () Unit!2797)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1526) Unit!2797)

(assert (=> b!39039 (= lt!59377 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!39039 (= lt!59379 (bitIndex!0 (size!888 (buf!1216 thiss!1379)) (currentByte!2628 thiss!1379) (currentBit!2623 thiss!1379)))))

(declare-fun b!39040 () Bool)

(assert (=> b!39040 (= e!25673 e!25668)))

(declare-fun res!33157 () Bool)

(assert (=> b!39040 (=> res!33157 e!25668)))

(assert (=> b!39040 (= res!33157 (not (= lt!59386 (bvsub (bvadd lt!59379 to!314) i!635))))))

(assert (=> b!39040 (= lt!59386 (bitIndex!0 (size!888 (buf!1216 (_2!1974 lt!59383))) (currentByte!2628 (_2!1974 lt!59383)) (currentBit!2623 (_2!1974 lt!59383))))))

(declare-fun b!39041 () Bool)

(assert (=> b!39041 (= e!25666 e!25664)))

(declare-fun res!33162 () Bool)

(assert (=> b!39041 (=> res!33162 e!25664)))

(assert (=> b!39041 (= res!33162 (not (isPrefixOf!0 thiss!1379 (_2!1974 lt!59365))))))

(assert (=> b!39041 (validate_offset_bits!1 ((_ sign_extend 32) (size!888 (buf!1216 (_2!1974 lt!59365)))) ((_ sign_extend 32) (currentByte!2628 (_2!1974 lt!59365))) ((_ sign_extend 32) (currentBit!2623 (_2!1974 lt!59365))) lt!59374)))

(assert (=> b!39041 (= lt!59374 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59384 () Unit!2797)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1526 BitStream!1526 (_ BitVec 64) (_ BitVec 64)) Unit!2797)

(assert (=> b!39041 (= lt!59384 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1974 lt!59365) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1526 (_ BitVec 8) (_ BitVec 32)) tuple2!3774)

(assert (=> b!39041 (= lt!59365 (appendBitFromByte!0 thiss!1379 (select (arr!1384 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!39042 () Bool)

(assert (=> b!39042 (= e!25665 e!25675)))

(declare-fun res!33161 () Bool)

(assert (=> b!39042 (=> res!33161 e!25675)))

(assert (=> b!39042 (= res!33161 (not (= (head!301 (byteArrayBitContentToList!0 (_2!1974 lt!59383) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!59378)))))

(assert (=> b!39042 (= lt!59378 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!39043 () Bool)

(declare-fun res!33154 () Bool)

(assert (=> b!39043 (=> res!33154 e!25674)))

(assert (=> b!39043 (= res!33154 (not (invariant!0 (currentBit!2623 (_2!1974 lt!59365)) (currentByte!2628 (_2!1974 lt!59365)) (size!888 (buf!1216 (_2!1974 lt!59365))))))))

(assert (= (and start!7920 res!33150) b!39034))

(assert (= (and b!39034 res!33152) b!39039))

(assert (= (and b!39039 (not res!33160)) b!39041))

(assert (= (and b!39041 (not res!33162)) b!39032))

(assert (= (and b!39032 res!33167) b!39030))

(assert (= (and b!39032 (not res!33149)) b!39040))

(assert (= (and b!39040 (not res!33157)) b!39028))

(assert (= (and b!39028 (not res!33155)) b!39025))

(assert (= (and b!39025 (not res!33153)) b!39037))

(assert (= (and b!39037 (not res!33166)) b!39043))

(assert (= (and b!39043 (not res!33154)) b!39024))

(assert (= (and b!39024 (not res!33159)) b!39036))

(assert (= (and b!39036 (not res!33163)) b!39038))

(assert (= (and b!39038 (not res!33158)) b!39029))

(assert (= (and b!39029 (not res!33168)) b!39023))

(assert (= (and b!39023 (not res!33165)) b!39035))

(assert (= (and b!39035 (not res!33151)) b!39042))

(assert (= (and b!39042 (not res!33161)) b!39026))

(assert (= (and b!39026 (not res!33164)) b!39033))

(assert (= (and b!39033 (not res!33156)) b!39031))

(assert (= start!7920 b!39027))

(declare-fun m!59479 () Bool)

(assert (=> b!39039 m!59479))

(declare-fun m!59481 () Bool)

(assert (=> b!39039 m!59481))

(declare-fun m!59483 () Bool)

(assert (=> b!39039 m!59483))

(declare-fun m!59485 () Bool)

(assert (=> b!39033 m!59485))

(declare-fun m!59487 () Bool)

(assert (=> b!39033 m!59487))

(declare-fun m!59489 () Bool)

(assert (=> b!39036 m!59489))

(declare-fun m!59491 () Bool)

(assert (=> b!39036 m!59491))

(declare-fun m!59493 () Bool)

(assert (=> b!39036 m!59493))

(declare-fun m!59495 () Bool)

(assert (=> b!39036 m!59495))

(declare-fun m!59497 () Bool)

(assert (=> b!39036 m!59497))

(declare-fun m!59499 () Bool)

(assert (=> b!39036 m!59499))

(declare-fun m!59501 () Bool)

(assert (=> b!39036 m!59501))

(declare-fun m!59503 () Bool)

(assert (=> b!39036 m!59503))

(declare-fun m!59505 () Bool)

(assert (=> b!39029 m!59505))

(declare-fun m!59507 () Bool)

(assert (=> b!39029 m!59507))

(declare-fun m!59509 () Bool)

(assert (=> b!39041 m!59509))

(declare-fun m!59511 () Bool)

(assert (=> b!39041 m!59511))

(declare-fun m!59513 () Bool)

(assert (=> b!39041 m!59513))

(assert (=> b!39041 m!59509))

(declare-fun m!59515 () Bool)

(assert (=> b!39041 m!59515))

(declare-fun m!59517 () Bool)

(assert (=> b!39041 m!59517))

(declare-fun m!59519 () Bool)

(assert (=> b!39024 m!59519))

(declare-fun m!59521 () Bool)

(assert (=> b!39030 m!59521))

(assert (=> b!39030 m!59521))

(declare-fun m!59523 () Bool)

(assert (=> b!39030 m!59523))

(declare-fun m!59525 () Bool)

(assert (=> b!39030 m!59525))

(assert (=> b!39030 m!59525))

(declare-fun m!59527 () Bool)

(assert (=> b!39030 m!59527))

(declare-fun m!59529 () Bool)

(assert (=> b!39037 m!59529))

(declare-fun m!59531 () Bool)

(assert (=> b!39026 m!59531))

(declare-fun m!59533 () Bool)

(assert (=> b!39038 m!59533))

(declare-fun m!59535 () Bool)

(assert (=> b!39031 m!59535))

(declare-fun m!59537 () Bool)

(assert (=> b!39043 m!59537))

(declare-fun m!59539 () Bool)

(assert (=> b!39035 m!59539))

(declare-fun m!59541 () Bool)

(assert (=> b!39027 m!59541))

(declare-fun m!59543 () Bool)

(assert (=> start!7920 m!59543))

(declare-fun m!59545 () Bool)

(assert (=> start!7920 m!59545))

(declare-fun m!59547 () Bool)

(assert (=> b!39023 m!59547))

(declare-fun m!59549 () Bool)

(assert (=> b!39023 m!59549))

(declare-fun m!59551 () Bool)

(assert (=> b!39042 m!59551))

(assert (=> b!39042 m!59551))

(declare-fun m!59553 () Bool)

(assert (=> b!39042 m!59553))

(declare-fun m!59555 () Bool)

(assert (=> b!39042 m!59555))

(declare-fun m!59557 () Bool)

(assert (=> b!39032 m!59557))

(declare-fun m!59559 () Bool)

(assert (=> b!39032 m!59559))

(declare-fun m!59561 () Bool)

(assert (=> b!39032 m!59561))

(declare-fun m!59563 () Bool)

(assert (=> b!39032 m!59563))

(declare-fun m!59565 () Bool)

(assert (=> b!39032 m!59565))

(declare-fun m!59567 () Bool)

(assert (=> b!39032 m!59567))

(declare-fun m!59569 () Bool)

(assert (=> b!39032 m!59569))

(declare-fun m!59571 () Bool)

(assert (=> b!39040 m!59571))

(declare-fun m!59573 () Bool)

(assert (=> b!39034 m!59573))

(declare-fun m!59575 () Bool)

(assert (=> b!39028 m!59575))

(push 1)

(assert (not b!39041))

(assert (not b!39043))

(assert (not b!39033))

(assert (not start!7920))

(assert (not b!39035))

(assert (not b!39036))

(assert (not b!39029))

(assert (not b!39030))

(assert (not b!39023))

(assert (not b!39031))

(assert (not b!39034))

(assert (not b!39042))

(assert (not b!39037))

(assert (not b!39026))

(assert (not b!39038))

(assert (not b!39027))

(assert (not b!39028))

(assert (not b!39039))

(assert (not b!39040))

(assert (not b!39032))

(assert (not b!39024))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

