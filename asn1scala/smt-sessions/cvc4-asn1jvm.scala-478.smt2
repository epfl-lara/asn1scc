; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14092 () Bool)

(assert start!14092)

(declare-datatypes ((array!2975 0))(
  ( (array!2976 (arr!1981 (Array (_ BitVec 32) (_ BitVec 8))) (size!1390 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2975)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun e!47638 () Bool)

(declare-datatypes ((BitStream!2360 0))(
  ( (BitStream!2361 (buf!1771 array!2975) (currentByte!3497 (_ BitVec 32)) (currentBit!3492 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4833 0))(
  ( (Unit!4834) )
))
(declare-datatypes ((tuple2!6312 0))(
  ( (tuple2!6313 (_1!3270 Unit!4833) (_2!3270 BitStream!2360)) )
))
(declare-fun lt!117554 () tuple2!6312)

(declare-fun b!72977 () Bool)

(declare-datatypes ((tuple2!6314 0))(
  ( (tuple2!6315 (_1!3271 BitStream!2360) (_2!3271 BitStream!2360)) )
))
(declare-fun lt!117544 () tuple2!6314)

(declare-datatypes ((List!755 0))(
  ( (Nil!752) (Cons!751 (h!870 Bool) (t!1505 List!755)) )
))
(declare-fun head!574 (List!755) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2360 array!2975 (_ BitVec 64) (_ BitVec 64)) List!755)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2360 BitStream!2360 (_ BitVec 64)) List!755)

(assert (=> b!72977 (= e!47638 (= (head!574 (byteArrayBitContentToList!0 (_2!3270 lt!117554) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!574 (bitStreamReadBitsIntoList!0 (_2!3270 lt!117554) (_1!3271 lt!117544) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!72978 () Bool)

(declare-fun e!47641 () Bool)

(declare-fun e!47640 () Bool)

(assert (=> b!72978 (= e!47641 e!47640)))

(declare-fun res!60289 () Bool)

(assert (=> b!72978 (=> res!60289 e!47640)))

(declare-fun lt!117556 () Bool)

(declare-fun lt!117546 () Bool)

(assert (=> b!72978 (= res!60289 (not (= lt!117556 lt!117546)))))

(declare-fun lt!117536 () Bool)

(assert (=> b!72978 (= lt!117536 lt!117556)))

(declare-fun lt!117545 () tuple2!6312)

(declare-fun lt!117534 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2975 (_ BitVec 64)) Bool)

(assert (=> b!72978 (= lt!117556 (bitAt!0 (buf!1771 (_2!3270 lt!117545)) lt!117534))))

(declare-fun lt!117543 () Unit!4833)

(declare-fun lt!117549 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2975 array!2975 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4833)

(assert (=> b!72978 (= lt!117543 (arrayBitRangesEqImpliesEq!0 (buf!1771 (_2!3270 lt!117554)) (buf!1771 (_2!3270 lt!117545)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!117534 lt!117549))))

(declare-fun res!60305 () Bool)

(declare-fun e!47636 () Bool)

(assert (=> start!14092 (=> (not res!60305) (not e!47636))))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!14092 (= res!60305 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1390 srcBuffer!2))))))))

(assert (=> start!14092 e!47636))

(assert (=> start!14092 true))

(declare-fun array_inv!1239 (array!2975) Bool)

(assert (=> start!14092 (array_inv!1239 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!2360)

(declare-fun e!47627 () Bool)

(declare-fun inv!12 (BitStream!2360) Bool)

(assert (=> start!14092 (and (inv!12 thiss!1379) e!47627)))

(declare-fun b!72979 () Bool)

(declare-fun e!47637 () Bool)

(declare-fun e!47628 () Bool)

(assert (=> b!72979 (= e!47637 e!47628)))

(declare-fun res!60297 () Bool)

(assert (=> b!72979 (=> res!60297 e!47628)))

(declare-fun lt!117535 () List!755)

(declare-fun lt!117547 () List!755)

(assert (=> b!72979 (= res!60297 (not (= lt!117535 lt!117547)))))

(assert (=> b!72979 (= lt!117547 lt!117535)))

(declare-fun lt!117542 () List!755)

(declare-fun tail!359 (List!755) List!755)

(assert (=> b!72979 (= lt!117535 (tail!359 lt!117542))))

(declare-fun lt!117539 () tuple2!6314)

(declare-fun lt!117533 () tuple2!6314)

(declare-fun lt!117553 () Unit!4833)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2360 BitStream!2360 BitStream!2360 BitStream!2360 (_ BitVec 64) List!755) Unit!4833)

(assert (=> b!72979 (= lt!117553 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3270 lt!117545) (_2!3270 lt!117545) (_1!3271 lt!117539) (_1!3271 lt!117533) (bvsub to!314 i!635) lt!117542))))

(declare-fun b!72980 () Bool)

(declare-fun e!47633 () Bool)

(declare-fun e!47631 () Bool)

(assert (=> b!72980 (= e!47633 e!47631)))

(declare-fun res!60288 () Bool)

(assert (=> b!72980 (=> res!60288 e!47631)))

(assert (=> b!72980 (= res!60288 (not (= (head!574 (byteArrayBitContentToList!0 (_2!3270 lt!117545) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!117546)))))

(assert (=> b!72980 (= lt!117546 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!72981 () Bool)

(declare-fun e!47634 () Bool)

(declare-fun e!47635 () Bool)

(assert (=> b!72981 (= e!47634 e!47635)))

(declare-fun res!60306 () Bool)

(assert (=> b!72981 (=> res!60306 e!47635)))

(declare-fun lt!117551 () (_ BitVec 64))

(assert (=> b!72981 (= res!60306 (not (= lt!117551 (bvsub (bvadd lt!117534 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!72981 (= lt!117551 (bitIndex!0 (size!1390 (buf!1771 (_2!3270 lt!117545))) (currentByte!3497 (_2!3270 lt!117545)) (currentBit!3492 (_2!3270 lt!117545))))))

(declare-fun b!72982 () Bool)

(declare-fun e!47639 () Bool)

(assert (=> b!72982 (= e!47636 (not e!47639))))

(declare-fun res!60304 () Bool)

(assert (=> b!72982 (=> res!60304 e!47639)))

(assert (=> b!72982 (= res!60304 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2360 BitStream!2360) Bool)

(assert (=> b!72982 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!117555 () Unit!4833)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2360) Unit!4833)

(assert (=> b!72982 (= lt!117555 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!72982 (= lt!117534 (bitIndex!0 (size!1390 (buf!1771 thiss!1379)) (currentByte!3497 thiss!1379) (currentBit!3492 thiss!1379)))))

(declare-fun b!72983 () Bool)

(declare-fun e!47630 () Bool)

(assert (=> b!72983 (= e!47630 e!47637)))

(declare-fun res!60300 () Bool)

(assert (=> b!72983 (=> res!60300 e!47637)))

(assert (=> b!72983 (= res!60300 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!117552 () (_ BitVec 64))

(assert (=> b!72983 (= lt!117547 (bitStreamReadBitsIntoList!0 (_2!3270 lt!117545) (_1!3271 lt!117533) lt!117552))))

(assert (=> b!72983 (= lt!117542 (bitStreamReadBitsIntoList!0 (_2!3270 lt!117545) (_1!3271 lt!117539) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!72983 (validate_offset_bits!1 ((_ sign_extend 32) (size!1390 (buf!1771 (_2!3270 lt!117545)))) ((_ sign_extend 32) (currentByte!3497 (_2!3270 lt!117554))) ((_ sign_extend 32) (currentBit!3492 (_2!3270 lt!117554))) lt!117552)))

(declare-fun lt!117540 () Unit!4833)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2360 array!2975 (_ BitVec 64)) Unit!4833)

(assert (=> b!72983 (= lt!117540 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3270 lt!117554) (buf!1771 (_2!3270 lt!117545)) lt!117552))))

(declare-fun reader!0 (BitStream!2360 BitStream!2360) tuple2!6314)

(assert (=> b!72983 (= lt!117533 (reader!0 (_2!3270 lt!117554) (_2!3270 lt!117545)))))

(assert (=> b!72983 (validate_offset_bits!1 ((_ sign_extend 32) (size!1390 (buf!1771 (_2!3270 lt!117545)))) ((_ sign_extend 32) (currentByte!3497 thiss!1379)) ((_ sign_extend 32) (currentBit!3492 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!117537 () Unit!4833)

(assert (=> b!72983 (= lt!117537 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1771 (_2!3270 lt!117545)) (bvsub to!314 i!635)))))

(assert (=> b!72983 (= lt!117539 (reader!0 thiss!1379 (_2!3270 lt!117545)))))

(declare-fun b!72984 () Bool)

(declare-fun res!60298 () Bool)

(assert (=> b!72984 (=> res!60298 e!47635)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!72984 (= res!60298 (not (invariant!0 (currentBit!3492 (_2!3270 lt!117545)) (currentByte!3497 (_2!3270 lt!117545)) (size!1390 (buf!1771 (_2!3270 lt!117545))))))))

(declare-fun b!72985 () Bool)

(declare-fun e!47629 () Bool)

(assert (=> b!72985 (= e!47639 e!47629)))

(declare-fun res!60303 () Bool)

(assert (=> b!72985 (=> res!60303 e!47629)))

(assert (=> b!72985 (= res!60303 (not (isPrefixOf!0 thiss!1379 (_2!3270 lt!117554))))))

(assert (=> b!72985 (validate_offset_bits!1 ((_ sign_extend 32) (size!1390 (buf!1771 (_2!3270 lt!117554)))) ((_ sign_extend 32) (currentByte!3497 (_2!3270 lt!117554))) ((_ sign_extend 32) (currentBit!3492 (_2!3270 lt!117554))) lt!117552)))

(assert (=> b!72985 (= lt!117552 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!117541 () Unit!4833)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2360 BitStream!2360 (_ BitVec 64) (_ BitVec 64)) Unit!4833)

(assert (=> b!72985 (= lt!117541 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3270 lt!117554) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2360 (_ BitVec 8) (_ BitVec 32)) tuple2!6312)

(assert (=> b!72985 (= lt!117554 (appendBitFromByte!0 thiss!1379 (select (arr!1981 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!72986 () Bool)

(assert (=> b!72986 (= e!47627 (array_inv!1239 (buf!1771 thiss!1379)))))

(declare-fun b!72987 () Bool)

(assert (=> b!72987 (= e!47629 e!47634)))

(declare-fun res!60301 () Bool)

(assert (=> b!72987 (=> res!60301 e!47634)))

(assert (=> b!72987 (= res!60301 (not (isPrefixOf!0 (_2!3270 lt!117554) (_2!3270 lt!117545))))))

(assert (=> b!72987 (isPrefixOf!0 thiss!1379 (_2!3270 lt!117545))))

(declare-fun lt!117548 () Unit!4833)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2360 BitStream!2360 BitStream!2360) Unit!4833)

(assert (=> b!72987 (= lt!117548 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3270 lt!117554) (_2!3270 lt!117545)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2360 array!2975 (_ BitVec 64) (_ BitVec 64)) tuple2!6312)

(assert (=> b!72987 (= lt!117545 (appendBitsMSBFirstLoop!0 (_2!3270 lt!117554) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!72987 e!47638))

(declare-fun res!60294 () Bool)

(assert (=> b!72987 (=> (not res!60294) (not e!47638))))

(assert (=> b!72987 (= res!60294 (validate_offset_bits!1 ((_ sign_extend 32) (size!1390 (buf!1771 (_2!3270 lt!117554)))) ((_ sign_extend 32) (currentByte!3497 thiss!1379)) ((_ sign_extend 32) (currentBit!3492 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!117550 () Unit!4833)

(assert (=> b!72987 (= lt!117550 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1771 (_2!3270 lt!117554)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!72987 (= lt!117544 (reader!0 thiss!1379 (_2!3270 lt!117554)))))

(declare-fun b!72988 () Bool)

(declare-fun res!60299 () Bool)

(assert (=> b!72988 (=> (not res!60299) (not e!47636))))

(assert (=> b!72988 (= res!60299 (validate_offset_bits!1 ((_ sign_extend 32) (size!1390 (buf!1771 thiss!1379))) ((_ sign_extend 32) (currentByte!3497 thiss!1379)) ((_ sign_extend 32) (currentBit!3492 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!72989 () Bool)

(declare-fun res!60293 () Bool)

(assert (=> b!72989 (=> res!60293 e!47630)))

(assert (=> b!72989 (= res!60293 (not (invariant!0 (currentBit!3492 (_2!3270 lt!117554)) (currentByte!3497 (_2!3270 lt!117554)) (size!1390 (buf!1771 (_2!3270 lt!117545))))))))

(declare-fun b!72990 () Bool)

(declare-fun res!60292 () Bool)

(assert (=> b!72990 (=> res!60292 e!47633)))

(declare-fun lt!117538 () Bool)

(assert (=> b!72990 (= res!60292 (not (= (head!574 lt!117542) lt!117538)))))

(declare-fun b!72991 () Bool)

(declare-fun res!60290 () Bool)

(assert (=> b!72991 (=> res!60290 e!47630)))

(assert (=> b!72991 (= res!60290 (not (invariant!0 (currentBit!3492 (_2!3270 lt!117554)) (currentByte!3497 (_2!3270 lt!117554)) (size!1390 (buf!1771 (_2!3270 lt!117554))))))))

(declare-fun b!72992 () Bool)

(assert (=> b!72992 (= e!47640 true)))

(declare-datatypes ((tuple2!6316 0))(
  ( (tuple2!6317 (_1!3272 BitStream!2360) (_2!3272 Bool)) )
))
(declare-fun lt!117532 () tuple2!6316)

(declare-fun readBitPure!0 (BitStream!2360) tuple2!6316)

(assert (=> b!72992 (= lt!117532 (readBitPure!0 (_1!3271 lt!117539)))))

(declare-fun b!72993 () Bool)

(assert (=> b!72993 (= e!47631 e!47641)))

(declare-fun res!60302 () Bool)

(assert (=> b!72993 (=> res!60302 e!47641)))

(assert (=> b!72993 (= res!60302 (not (= lt!117536 lt!117546)))))

(assert (=> b!72993 (= lt!117536 (bitAt!0 (buf!1771 (_2!3270 lt!117554)) lt!117534))))

(declare-fun b!72994 () Bool)

(assert (=> b!72994 (= e!47635 e!47630)))

(declare-fun res!60291 () Bool)

(assert (=> b!72994 (=> res!60291 e!47630)))

(assert (=> b!72994 (= res!60291 (not (= (size!1390 (buf!1771 (_2!3270 lt!117554))) (size!1390 (buf!1771 (_2!3270 lt!117545))))))))

(assert (=> b!72994 (= lt!117551 (bvsub (bvsub (bvadd lt!117549 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!72994 (= lt!117549 (bitIndex!0 (size!1390 (buf!1771 (_2!3270 lt!117554))) (currentByte!3497 (_2!3270 lt!117554)) (currentBit!3492 (_2!3270 lt!117554))))))

(assert (=> b!72994 (= (size!1390 (buf!1771 (_2!3270 lt!117545))) (size!1390 (buf!1771 thiss!1379)))))

(declare-fun b!72995 () Bool)

(declare-fun res!60296 () Bool)

(assert (=> b!72995 (=> res!60296 e!47637)))

(declare-fun length!383 (List!755) Int)

(assert (=> b!72995 (= res!60296 (<= (length!383 lt!117542) 0))))

(declare-fun b!72996 () Bool)

(assert (=> b!72996 (= e!47628 e!47633)))

(declare-fun res!60295 () Bool)

(assert (=> b!72996 (=> res!60295 e!47633)))

(assert (=> b!72996 (= res!60295 (not (= lt!117538 (bitAt!0 (buf!1771 (_1!3271 lt!117533)) lt!117534))))))

(assert (=> b!72996 (= lt!117538 (bitAt!0 (buf!1771 (_1!3271 lt!117539)) lt!117534))))

(declare-fun b!72997 () Bool)

(declare-fun res!60287 () Bool)

(assert (=> b!72997 (=> res!60287 e!47635)))

(assert (=> b!72997 (= res!60287 (not (= (size!1390 (buf!1771 thiss!1379)) (size!1390 (buf!1771 (_2!3270 lt!117545))))))))

(assert (= (and start!14092 res!60305) b!72988))

(assert (= (and b!72988 res!60299) b!72982))

(assert (= (and b!72982 (not res!60304)) b!72985))

(assert (= (and b!72985 (not res!60303)) b!72987))

(assert (= (and b!72987 res!60294) b!72977))

(assert (= (and b!72987 (not res!60301)) b!72981))

(assert (= (and b!72981 (not res!60306)) b!72984))

(assert (= (and b!72984 (not res!60298)) b!72997))

(assert (= (and b!72997 (not res!60287)) b!72994))

(assert (= (and b!72994 (not res!60291)) b!72991))

(assert (= (and b!72991 (not res!60290)) b!72989))

(assert (= (and b!72989 (not res!60293)) b!72983))

(assert (= (and b!72983 (not res!60300)) b!72995))

(assert (= (and b!72995 (not res!60296)) b!72979))

(assert (= (and b!72979 (not res!60297)) b!72996))

(assert (= (and b!72996 (not res!60295)) b!72990))

(assert (= (and b!72990 (not res!60292)) b!72980))

(assert (= (and b!72980 (not res!60288)) b!72993))

(assert (= (and b!72993 (not res!60302)) b!72978))

(assert (= (and b!72978 (not res!60289)) b!72992))

(assert (= start!14092 b!72986))

(declare-fun m!117047 () Bool)

(assert (=> b!72990 m!117047))

(declare-fun m!117049 () Bool)

(assert (=> start!14092 m!117049))

(declare-fun m!117051 () Bool)

(assert (=> start!14092 m!117051))

(declare-fun m!117053 () Bool)

(assert (=> b!72991 m!117053))

(declare-fun m!117055 () Bool)

(assert (=> b!72988 m!117055))

(declare-fun m!117057 () Bool)

(assert (=> b!72982 m!117057))

(declare-fun m!117059 () Bool)

(assert (=> b!72982 m!117059))

(declare-fun m!117061 () Bool)

(assert (=> b!72982 m!117061))

(declare-fun m!117063 () Bool)

(assert (=> b!72983 m!117063))

(declare-fun m!117065 () Bool)

(assert (=> b!72983 m!117065))

(declare-fun m!117067 () Bool)

(assert (=> b!72983 m!117067))

(declare-fun m!117069 () Bool)

(assert (=> b!72983 m!117069))

(declare-fun m!117071 () Bool)

(assert (=> b!72983 m!117071))

(declare-fun m!117073 () Bool)

(assert (=> b!72983 m!117073))

(declare-fun m!117075 () Bool)

(assert (=> b!72983 m!117075))

(declare-fun m!117077 () Bool)

(assert (=> b!72983 m!117077))

(declare-fun m!117079 () Bool)

(assert (=> b!72984 m!117079))

(declare-fun m!117081 () Bool)

(assert (=> b!72981 m!117081))

(declare-fun m!117083 () Bool)

(assert (=> b!72987 m!117083))

(declare-fun m!117085 () Bool)

(assert (=> b!72987 m!117085))

(declare-fun m!117087 () Bool)

(assert (=> b!72987 m!117087))

(declare-fun m!117089 () Bool)

(assert (=> b!72987 m!117089))

(declare-fun m!117091 () Bool)

(assert (=> b!72987 m!117091))

(declare-fun m!117093 () Bool)

(assert (=> b!72987 m!117093))

(declare-fun m!117095 () Bool)

(assert (=> b!72987 m!117095))

(declare-fun m!117097 () Bool)

(assert (=> b!72989 m!117097))

(declare-fun m!117099 () Bool)

(assert (=> b!72992 m!117099))

(declare-fun m!117101 () Bool)

(assert (=> b!72978 m!117101))

(declare-fun m!117103 () Bool)

(assert (=> b!72978 m!117103))

(declare-fun m!117105 () Bool)

(assert (=> b!72996 m!117105))

(declare-fun m!117107 () Bool)

(assert (=> b!72996 m!117107))

(declare-fun m!117109 () Bool)

(assert (=> b!72986 m!117109))

(declare-fun m!117111 () Bool)

(assert (=> b!72985 m!117111))

(declare-fun m!117113 () Bool)

(assert (=> b!72985 m!117113))

(declare-fun m!117115 () Bool)

(assert (=> b!72985 m!117115))

(assert (=> b!72985 m!117111))

(declare-fun m!117117 () Bool)

(assert (=> b!72985 m!117117))

(declare-fun m!117119 () Bool)

(assert (=> b!72985 m!117119))

(declare-fun m!117121 () Bool)

(assert (=> b!72993 m!117121))

(declare-fun m!117123 () Bool)

(assert (=> b!72977 m!117123))

(assert (=> b!72977 m!117123))

(declare-fun m!117125 () Bool)

(assert (=> b!72977 m!117125))

(declare-fun m!117127 () Bool)

(assert (=> b!72977 m!117127))

(assert (=> b!72977 m!117127))

(declare-fun m!117129 () Bool)

(assert (=> b!72977 m!117129))

(declare-fun m!117131 () Bool)

(assert (=> b!72980 m!117131))

(assert (=> b!72980 m!117131))

(declare-fun m!117133 () Bool)

(assert (=> b!72980 m!117133))

(declare-fun m!117135 () Bool)

(assert (=> b!72980 m!117135))

(declare-fun m!117137 () Bool)

(assert (=> b!72995 m!117137))

(declare-fun m!117139 () Bool)

(assert (=> b!72994 m!117139))

(declare-fun m!117141 () Bool)

(assert (=> b!72979 m!117141))

(declare-fun m!117143 () Bool)

(assert (=> b!72979 m!117143))

(push 1)

(assert (not b!72979))

(assert (not b!72989))

(assert (not b!72981))

(assert (not b!72988))

(assert (not b!72984))

(assert (not b!72990))

(assert (not b!72991))

(assert (not b!72986))

(assert (not b!72987))

(assert (not start!14092))

(assert (not b!72994))

(assert (not b!72982))

(assert (not b!72983))

(assert (not b!72977))

(assert (not b!72996))

(assert (not b!72995))

(assert (not b!72993))

(assert (not b!72992))

(assert (not b!72978))

(assert (not b!72980))

(assert (not b!72985))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

