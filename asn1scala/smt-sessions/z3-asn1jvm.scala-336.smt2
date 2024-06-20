; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7918 () Bool)

(assert start!7918)

(declare-fun b!38960 () Bool)

(declare-fun e!25616 () Bool)

(declare-fun e!25617 () Bool)

(assert (=> b!38960 (= e!25616 e!25617)))

(declare-fun res!33107 () Bool)

(assert (=> b!38960 (=> res!33107 e!25617)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!38960 (= res!33107 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!1969 0))(
  ( (array!1970 (arr!1383 (Array (_ BitVec 32) (_ BitVec 8))) (size!887 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1524 0))(
  ( (BitStream!1525 (buf!1215 array!1969) (currentByte!2627 (_ BitVec 32)) (currentBit!2622 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2795 0))(
  ( (Unit!2796) )
))
(declare-datatypes ((tuple2!3766 0))(
  ( (tuple2!3767 (_1!1970 Unit!2795) (_2!1970 BitStream!1524)) )
))
(declare-fun lt!59296 () tuple2!3766)

(declare-fun lt!59288 () (_ BitVec 64))

(declare-datatypes ((List!463 0))(
  ( (Nil!460) (Cons!459 (h!578 Bool) (t!1213 List!463)) )
))
(declare-fun lt!59298 () List!463)

(declare-datatypes ((tuple2!3768 0))(
  ( (tuple2!3769 (_1!1971 BitStream!1524) (_2!1971 BitStream!1524)) )
))
(declare-fun lt!59299 () tuple2!3768)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1524 BitStream!1524 (_ BitVec 64)) List!463)

(assert (=> b!38960 (= lt!59298 (bitStreamReadBitsIntoList!0 (_2!1970 lt!59296) (_1!1971 lt!59299) lt!59288))))

(declare-fun lt!59310 () tuple2!3768)

(declare-fun lt!59293 () List!463)

(assert (=> b!38960 (= lt!59293 (bitStreamReadBitsIntoList!0 (_2!1970 lt!59296) (_1!1971 lt!59310) (bvsub to!314 i!635)))))

(declare-fun lt!59304 () tuple2!3766)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!38960 (validate_offset_bits!1 ((_ sign_extend 32) (size!887 (buf!1215 (_2!1970 lt!59296)))) ((_ sign_extend 32) (currentByte!2627 (_2!1970 lt!59304))) ((_ sign_extend 32) (currentBit!2622 (_2!1970 lt!59304))) lt!59288)))

(declare-fun lt!59307 () Unit!2795)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1524 array!1969 (_ BitVec 64)) Unit!2795)

(assert (=> b!38960 (= lt!59307 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1970 lt!59304) (buf!1215 (_2!1970 lt!59296)) lt!59288))))

(declare-fun reader!0 (BitStream!1524 BitStream!1524) tuple2!3768)

(assert (=> b!38960 (= lt!59299 (reader!0 (_2!1970 lt!59304) (_2!1970 lt!59296)))))

(declare-fun thiss!1379 () BitStream!1524)

(assert (=> b!38960 (validate_offset_bits!1 ((_ sign_extend 32) (size!887 (buf!1215 (_2!1970 lt!59296)))) ((_ sign_extend 32) (currentByte!2627 thiss!1379)) ((_ sign_extend 32) (currentBit!2622 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!59311 () Unit!2795)

(assert (=> b!38960 (= lt!59311 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1215 (_2!1970 lt!59296)) (bvsub to!314 i!635)))))

(assert (=> b!38960 (= lt!59310 (reader!0 thiss!1379 (_2!1970 lt!59296)))))

(declare-fun b!38961 () Bool)

(declare-fun e!25621 () Bool)

(declare-fun e!25626 () Bool)

(assert (=> b!38961 (= e!25621 e!25626)))

(declare-fun res!33090 () Bool)

(assert (=> b!38961 (=> res!33090 e!25626)))

(declare-fun isPrefixOf!0 (BitStream!1524 BitStream!1524) Bool)

(assert (=> b!38961 (= res!33090 (not (isPrefixOf!0 (_2!1970 lt!59304) (_2!1970 lt!59296))))))

(assert (=> b!38961 (isPrefixOf!0 thiss!1379 (_2!1970 lt!59296))))

(declare-fun lt!59287 () Unit!2795)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1524 BitStream!1524 BitStream!1524) Unit!2795)

(assert (=> b!38961 (= lt!59287 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1970 lt!59304) (_2!1970 lt!59296)))))

(declare-fun srcBuffer!2 () array!1969)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1524 array!1969 (_ BitVec 64) (_ BitVec 64)) tuple2!3766)

(assert (=> b!38961 (= lt!59296 (appendBitsMSBFirstLoop!0 (_2!1970 lt!59304) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!25624 () Bool)

(assert (=> b!38961 e!25624))

(declare-fun res!33096 () Bool)

(assert (=> b!38961 (=> (not res!33096) (not e!25624))))

(assert (=> b!38961 (= res!33096 (validate_offset_bits!1 ((_ sign_extend 32) (size!887 (buf!1215 (_2!1970 lt!59304)))) ((_ sign_extend 32) (currentByte!2627 thiss!1379)) ((_ sign_extend 32) (currentBit!2622 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59290 () Unit!2795)

(assert (=> b!38961 (= lt!59290 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1215 (_2!1970 lt!59304)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59308 () tuple2!3768)

(assert (=> b!38961 (= lt!59308 (reader!0 thiss!1379 (_2!1970 lt!59304)))))

(declare-fun b!38962 () Bool)

(declare-fun e!25612 () Bool)

(assert (=> b!38962 (= e!25612 e!25616)))

(declare-fun res!33092 () Bool)

(assert (=> b!38962 (=> res!33092 e!25616)))

(assert (=> b!38962 (= res!33092 (not (= (size!887 (buf!1215 (_2!1970 lt!59304))) (size!887 (buf!1215 (_2!1970 lt!59296))))))))

(declare-fun lt!59300 () (_ BitVec 64))

(declare-fun lt!59297 () (_ BitVec 64))

(assert (=> b!38962 (= lt!59297 (bvsub (bvsub (bvadd lt!59300 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!38962 (= lt!59300 (bitIndex!0 (size!887 (buf!1215 (_2!1970 lt!59304))) (currentByte!2627 (_2!1970 lt!59304)) (currentBit!2622 (_2!1970 lt!59304))))))

(assert (=> b!38962 (= (size!887 (buf!1215 (_2!1970 lt!59296))) (size!887 (buf!1215 thiss!1379)))))

(declare-fun b!38963 () Bool)

(declare-fun res!33097 () Bool)

(assert (=> b!38963 (=> res!33097 e!25617)))

(declare-fun length!189 (List!463) Int)

(assert (=> b!38963 (= res!33097 (<= (length!189 lt!59293) 0))))

(declare-fun res!33099 () Bool)

(declare-fun e!25622 () Bool)

(assert (=> start!7918 (=> (not res!33099) (not e!25622))))

(assert (=> start!7918 (= res!33099 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!887 srcBuffer!2))))))))

(assert (=> start!7918 e!25622))

(assert (=> start!7918 true))

(declare-fun array_inv!815 (array!1969) Bool)

(assert (=> start!7918 (array_inv!815 srcBuffer!2)))

(declare-fun e!25619 () Bool)

(declare-fun inv!12 (BitStream!1524) Bool)

(assert (=> start!7918 (and (inv!12 thiss!1379) e!25619)))

(declare-fun b!38964 () Bool)

(declare-fun e!25614 () Bool)

(assert (=> b!38964 (= e!25622 (not e!25614))))

(declare-fun res!33095 () Bool)

(assert (=> b!38964 (=> res!33095 e!25614)))

(assert (=> b!38964 (= res!33095 (bvsge i!635 to!314))))

(assert (=> b!38964 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!59294 () Unit!2795)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1524) Unit!2795)

(assert (=> b!38964 (= lt!59294 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!59302 () (_ BitVec 64))

(assert (=> b!38964 (= lt!59302 (bitIndex!0 (size!887 (buf!1215 thiss!1379)) (currentByte!2627 thiss!1379) (currentBit!2622 thiss!1379)))))

(declare-fun b!38965 () Bool)

(declare-fun e!25620 () Bool)

(declare-fun e!25623 () Bool)

(assert (=> b!38965 (= e!25620 e!25623)))

(declare-fun res!33093 () Bool)

(assert (=> b!38965 (=> res!33093 e!25623)))

(declare-fun lt!59309 () Bool)

(declare-fun bitAt!0 (array!1969 (_ BitVec 64)) Bool)

(assert (=> b!38965 (= res!33093 (not (= lt!59309 (bitAt!0 (buf!1215 (_1!1971 lt!59299)) lt!59302))))))

(assert (=> b!38965 (= lt!59309 (bitAt!0 (buf!1215 (_1!1971 lt!59310)) lt!59302))))

(declare-fun b!38966 () Bool)

(assert (=> b!38966 (= e!25614 e!25621)))

(declare-fun res!33089 () Bool)

(assert (=> b!38966 (=> res!33089 e!25621)))

(assert (=> b!38966 (= res!33089 (not (isPrefixOf!0 thiss!1379 (_2!1970 lt!59304))))))

(assert (=> b!38966 (validate_offset_bits!1 ((_ sign_extend 32) (size!887 (buf!1215 (_2!1970 lt!59304)))) ((_ sign_extend 32) (currentByte!2627 (_2!1970 lt!59304))) ((_ sign_extend 32) (currentBit!2622 (_2!1970 lt!59304))) lt!59288)))

(assert (=> b!38966 (= lt!59288 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59291 () Unit!2795)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1524 BitStream!1524 (_ BitVec 64) (_ BitVec 64)) Unit!2795)

(assert (=> b!38966 (= lt!59291 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1970 lt!59304) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1524 (_ BitVec 8) (_ BitVec 32)) tuple2!3766)

(assert (=> b!38966 (= lt!59304 (appendBitFromByte!0 thiss!1379 (select (arr!1383 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!38967 () Bool)

(declare-fun res!33108 () Bool)

(assert (=> b!38967 (=> (not res!33108) (not e!25622))))

(assert (=> b!38967 (= res!33108 (validate_offset_bits!1 ((_ sign_extend 32) (size!887 (buf!1215 thiss!1379))) ((_ sign_extend 32) (currentByte!2627 thiss!1379)) ((_ sign_extend 32) (currentBit!2622 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!38968 () Bool)

(assert (=> b!38968 (= e!25626 e!25612)))

(declare-fun res!33091 () Bool)

(assert (=> b!38968 (=> res!33091 e!25612)))

(assert (=> b!38968 (= res!33091 (not (= lt!59297 (bvsub (bvadd lt!59302 to!314) i!635))))))

(assert (=> b!38968 (= lt!59297 (bitIndex!0 (size!887 (buf!1215 (_2!1970 lt!59296))) (currentByte!2627 (_2!1970 lt!59296)) (currentBit!2622 (_2!1970 lt!59296))))))

(declare-fun b!38969 () Bool)

(declare-fun res!33106 () Bool)

(assert (=> b!38969 (=> res!33106 e!25616)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!38969 (= res!33106 (not (invariant!0 (currentBit!2622 (_2!1970 lt!59304)) (currentByte!2627 (_2!1970 lt!59304)) (size!887 (buf!1215 (_2!1970 lt!59296))))))))

(declare-fun b!38970 () Bool)

(declare-fun e!25613 () Bool)

(declare-fun e!25615 () Bool)

(assert (=> b!38970 (= e!25613 e!25615)))

(declare-fun res!33098 () Bool)

(assert (=> b!38970 (=> res!33098 e!25615)))

(declare-fun lt!59301 () Bool)

(declare-fun lt!59289 () Bool)

(assert (=> b!38970 (= res!33098 (not (= lt!59301 lt!59289)))))

(declare-fun lt!59303 () Bool)

(assert (=> b!38970 (= lt!59303 lt!59301)))

(assert (=> b!38970 (= lt!59301 (bitAt!0 (buf!1215 (_2!1970 lt!59296)) lt!59302))))

(declare-fun lt!59305 () Unit!2795)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1969 array!1969 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2795)

(assert (=> b!38970 (= lt!59305 (arrayBitRangesEqImpliesEq!0 (buf!1215 (_2!1970 lt!59304)) (buf!1215 (_2!1970 lt!59296)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!59302 lt!59300))))

(declare-fun b!38971 () Bool)

(assert (=> b!38971 (= e!25615 true)))

(declare-datatypes ((tuple2!3770 0))(
  ( (tuple2!3771 (_1!1972 BitStream!1524) (_2!1972 Bool)) )
))
(declare-fun lt!59306 () tuple2!3770)

(declare-fun readBitPure!0 (BitStream!1524) tuple2!3770)

(assert (=> b!38971 (= lt!59306 (readBitPure!0 (_1!1971 lt!59310)))))

(declare-fun b!38972 () Bool)

(declare-fun res!33101 () Bool)

(assert (=> b!38972 (=> res!33101 e!25616)))

(assert (=> b!38972 (= res!33101 (not (invariant!0 (currentBit!2622 (_2!1970 lt!59304)) (currentByte!2627 (_2!1970 lt!59304)) (size!887 (buf!1215 (_2!1970 lt!59304))))))))

(declare-fun b!38973 () Bool)

(declare-fun res!33103 () Bool)

(assert (=> b!38973 (=> res!33103 e!25612)))

(assert (=> b!38973 (= res!33103 (not (= (size!887 (buf!1215 thiss!1379)) (size!887 (buf!1215 (_2!1970 lt!59296))))))))

(declare-fun b!38974 () Bool)

(assert (=> b!38974 (= e!25617 e!25620)))

(declare-fun res!33105 () Bool)

(assert (=> b!38974 (=> res!33105 e!25620)))

(declare-fun lt!59292 () List!463)

(assert (=> b!38974 (= res!33105 (not (= lt!59292 lt!59298)))))

(assert (=> b!38974 (= lt!59298 lt!59292)))

(declare-fun tail!180 (List!463) List!463)

(assert (=> b!38974 (= lt!59292 (tail!180 lt!59293))))

(declare-fun lt!59295 () Unit!2795)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1524 BitStream!1524 BitStream!1524 BitStream!1524 (_ BitVec 64) List!463) Unit!2795)

(assert (=> b!38974 (= lt!59295 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1970 lt!59296) (_2!1970 lt!59296) (_1!1971 lt!59310) (_1!1971 lt!59299) (bvsub to!314 i!635) lt!59293))))

(declare-fun b!38975 () Bool)

(declare-fun res!33102 () Bool)

(assert (=> b!38975 (=> res!33102 e!25612)))

(assert (=> b!38975 (= res!33102 (not (invariant!0 (currentBit!2622 (_2!1970 lt!59296)) (currentByte!2627 (_2!1970 lt!59296)) (size!887 (buf!1215 (_2!1970 lt!59296))))))))

(declare-fun b!38976 () Bool)

(declare-fun e!25618 () Bool)

(assert (=> b!38976 (= e!25618 e!25613)))

(declare-fun res!33094 () Bool)

(assert (=> b!38976 (=> res!33094 e!25613)))

(assert (=> b!38976 (= res!33094 (not (= lt!59303 lt!59289)))))

(assert (=> b!38976 (= lt!59303 (bitAt!0 (buf!1215 (_2!1970 lt!59304)) lt!59302))))

(declare-fun b!38977 () Bool)

(declare-fun res!33100 () Bool)

(assert (=> b!38977 (=> res!33100 e!25623)))

(declare-fun head!300 (List!463) Bool)

(assert (=> b!38977 (= res!33100 (not (= (head!300 lt!59293) lt!59309)))))

(declare-fun b!38978 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1524 array!1969 (_ BitVec 64) (_ BitVec 64)) List!463)

(assert (=> b!38978 (= e!25624 (= (head!300 (byteArrayBitContentToList!0 (_2!1970 lt!59304) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!300 (bitStreamReadBitsIntoList!0 (_2!1970 lt!59304) (_1!1971 lt!59308) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!38979 () Bool)

(assert (=> b!38979 (= e!25623 e!25618)))

(declare-fun res!33104 () Bool)

(assert (=> b!38979 (=> res!33104 e!25618)))

(assert (=> b!38979 (= res!33104 (not (= (head!300 (byteArrayBitContentToList!0 (_2!1970 lt!59296) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!59289)))))

(assert (=> b!38979 (= lt!59289 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!38980 () Bool)

(assert (=> b!38980 (= e!25619 (array_inv!815 (buf!1215 thiss!1379)))))

(assert (= (and start!7918 res!33099) b!38967))

(assert (= (and b!38967 res!33108) b!38964))

(assert (= (and b!38964 (not res!33095)) b!38966))

(assert (= (and b!38966 (not res!33089)) b!38961))

(assert (= (and b!38961 res!33096) b!38978))

(assert (= (and b!38961 (not res!33090)) b!38968))

(assert (= (and b!38968 (not res!33091)) b!38975))

(assert (= (and b!38975 (not res!33102)) b!38973))

(assert (= (and b!38973 (not res!33103)) b!38962))

(assert (= (and b!38962 (not res!33092)) b!38972))

(assert (= (and b!38972 (not res!33101)) b!38969))

(assert (= (and b!38969 (not res!33106)) b!38960))

(assert (= (and b!38960 (not res!33107)) b!38963))

(assert (= (and b!38963 (not res!33097)) b!38974))

(assert (= (and b!38974 (not res!33105)) b!38965))

(assert (= (and b!38965 (not res!33093)) b!38977))

(assert (= (and b!38977 (not res!33100)) b!38979))

(assert (= (and b!38979 (not res!33104)) b!38976))

(assert (= (and b!38976 (not res!33094)) b!38970))

(assert (= (and b!38970 (not res!33098)) b!38971))

(assert (= start!7918 b!38980))

(declare-fun m!59381 () Bool)

(assert (=> b!38960 m!59381))

(declare-fun m!59383 () Bool)

(assert (=> b!38960 m!59383))

(declare-fun m!59385 () Bool)

(assert (=> b!38960 m!59385))

(declare-fun m!59387 () Bool)

(assert (=> b!38960 m!59387))

(declare-fun m!59389 () Bool)

(assert (=> b!38960 m!59389))

(declare-fun m!59391 () Bool)

(assert (=> b!38960 m!59391))

(declare-fun m!59393 () Bool)

(assert (=> b!38960 m!59393))

(declare-fun m!59395 () Bool)

(assert (=> b!38960 m!59395))

(declare-fun m!59397 () Bool)

(assert (=> b!38970 m!59397))

(declare-fun m!59399 () Bool)

(assert (=> b!38970 m!59399))

(declare-fun m!59401 () Bool)

(assert (=> b!38963 m!59401))

(declare-fun m!59403 () Bool)

(assert (=> b!38964 m!59403))

(declare-fun m!59405 () Bool)

(assert (=> b!38964 m!59405))

(declare-fun m!59407 () Bool)

(assert (=> b!38964 m!59407))

(declare-fun m!59409 () Bool)

(assert (=> b!38965 m!59409))

(declare-fun m!59411 () Bool)

(assert (=> b!38965 m!59411))

(declare-fun m!59413 () Bool)

(assert (=> b!38972 m!59413))

(declare-fun m!59415 () Bool)

(assert (=> b!38961 m!59415))

(declare-fun m!59417 () Bool)

(assert (=> b!38961 m!59417))

(declare-fun m!59419 () Bool)

(assert (=> b!38961 m!59419))

(declare-fun m!59421 () Bool)

(assert (=> b!38961 m!59421))

(declare-fun m!59423 () Bool)

(assert (=> b!38961 m!59423))

(declare-fun m!59425 () Bool)

(assert (=> b!38961 m!59425))

(declare-fun m!59427 () Bool)

(assert (=> b!38961 m!59427))

(declare-fun m!59429 () Bool)

(assert (=> start!7918 m!59429))

(declare-fun m!59431 () Bool)

(assert (=> start!7918 m!59431))

(declare-fun m!59433 () Bool)

(assert (=> b!38975 m!59433))

(declare-fun m!59435 () Bool)

(assert (=> b!38971 m!59435))

(declare-fun m!59437 () Bool)

(assert (=> b!38967 m!59437))

(declare-fun m!59439 () Bool)

(assert (=> b!38978 m!59439))

(assert (=> b!38978 m!59439))

(declare-fun m!59441 () Bool)

(assert (=> b!38978 m!59441))

(declare-fun m!59443 () Bool)

(assert (=> b!38978 m!59443))

(assert (=> b!38978 m!59443))

(declare-fun m!59445 () Bool)

(assert (=> b!38978 m!59445))

(declare-fun m!59447 () Bool)

(assert (=> b!38974 m!59447))

(declare-fun m!59449 () Bool)

(assert (=> b!38974 m!59449))

(declare-fun m!59451 () Bool)

(assert (=> b!38976 m!59451))

(declare-fun m!59453 () Bool)

(assert (=> b!38962 m!59453))

(declare-fun m!59455 () Bool)

(assert (=> b!38968 m!59455))

(declare-fun m!59457 () Bool)

(assert (=> b!38979 m!59457))

(assert (=> b!38979 m!59457))

(declare-fun m!59459 () Bool)

(assert (=> b!38979 m!59459))

(declare-fun m!59461 () Bool)

(assert (=> b!38979 m!59461))

(declare-fun m!59463 () Bool)

(assert (=> b!38966 m!59463))

(declare-fun m!59465 () Bool)

(assert (=> b!38966 m!59465))

(declare-fun m!59467 () Bool)

(assert (=> b!38966 m!59467))

(assert (=> b!38966 m!59465))

(declare-fun m!59469 () Bool)

(assert (=> b!38966 m!59469))

(declare-fun m!59471 () Bool)

(assert (=> b!38966 m!59471))

(declare-fun m!59473 () Bool)

(assert (=> b!38980 m!59473))

(declare-fun m!59475 () Bool)

(assert (=> b!38969 m!59475))

(declare-fun m!59477 () Bool)

(assert (=> b!38977 m!59477))

(check-sat (not b!38970) (not b!38978) (not b!38980) (not b!38979) (not b!38960) (not b!38969) (not start!7918) (not b!38968) (not b!38976) (not b!38975) (not b!38962) (not b!38972) (not b!38965) (not b!38977) (not b!38966) (not b!38967) (not b!38963) (not b!38971) (not b!38961) (not b!38974) (not b!38964))
