; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14062 () Bool)

(assert start!14062)

(declare-fun b!72014 () Bool)

(declare-fun res!59376 () Bool)

(declare-fun e!46894 () Bool)

(assert (=> b!72014 (=> res!59376 e!46894)))

(declare-datatypes ((array!2945 0))(
  ( (array!2946 (arr!1966 (Array (_ BitVec 32) (_ BitVec 8))) (size!1375 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2330 0))(
  ( (BitStream!2331 (buf!1756 array!2945) (currentByte!3482 (_ BitVec 32)) (currentBit!3477 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4803 0))(
  ( (Unit!4804) )
))
(declare-datatypes ((tuple2!6222 0))(
  ( (tuple2!6223 (_1!3225 Unit!4803) (_2!3225 BitStream!2330)) )
))
(declare-fun lt!116407 () tuple2!6222)

(declare-fun lt!116404 () tuple2!6222)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!72014 (= res!59376 (not (invariant!0 (currentBit!3477 (_2!3225 lt!116407)) (currentByte!3482 (_2!3225 lt!116407)) (size!1375 (buf!1756 (_2!3225 lt!116404))))))))

(declare-fun b!72015 () Bool)

(declare-fun res!59382 () Bool)

(assert (=> b!72015 (=> res!59382 e!46894)))

(assert (=> b!72015 (= res!59382 (not (invariant!0 (currentBit!3477 (_2!3225 lt!116407)) (currentByte!3482 (_2!3225 lt!116407)) (size!1375 (buf!1756 (_2!3225 lt!116407))))))))

(declare-fun b!72016 () Bool)

(declare-fun e!46893 () Bool)

(declare-fun e!46891 () Bool)

(assert (=> b!72016 (= e!46893 e!46891)))

(declare-fun res!59385 () Bool)

(assert (=> b!72016 (=> res!59385 e!46891)))

(declare-fun lt!116396 () (_ BitVec 64))

(declare-datatypes ((tuple2!6224 0))(
  ( (tuple2!6225 (_1!3226 BitStream!2330) (_2!3226 BitStream!2330)) )
))
(declare-fun lt!116391 () tuple2!6224)

(declare-fun lt!116400 () Bool)

(declare-fun bitAt!0 (array!2945 (_ BitVec 64)) Bool)

(assert (=> b!72016 (= res!59385 (not (= lt!116400 (bitAt!0 (buf!1756 (_1!3226 lt!116391)) lt!116396))))))

(declare-fun lt!116401 () tuple2!6224)

(assert (=> b!72016 (= lt!116400 (bitAt!0 (buf!1756 (_1!3226 lt!116401)) lt!116396))))

(declare-fun b!72017 () Bool)

(declare-fun e!46892 () Bool)

(assert (=> b!72017 (= e!46894 e!46892)))

(declare-fun res!59380 () Bool)

(assert (=> b!72017 (=> res!59380 e!46892)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!72017 (= res!59380 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!116409 () (_ BitVec 64))

(declare-datatypes ((List!740 0))(
  ( (Nil!737) (Cons!736 (h!855 Bool) (t!1490 List!740)) )
))
(declare-fun lt!116408 () List!740)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2330 BitStream!2330 (_ BitVec 64)) List!740)

(assert (=> b!72017 (= lt!116408 (bitStreamReadBitsIntoList!0 (_2!3225 lt!116404) (_1!3226 lt!116391) lt!116409))))

(declare-fun lt!116399 () List!740)

(assert (=> b!72017 (= lt!116399 (bitStreamReadBitsIntoList!0 (_2!3225 lt!116404) (_1!3226 lt!116401) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!72017 (validate_offset_bits!1 ((_ sign_extend 32) (size!1375 (buf!1756 (_2!3225 lt!116404)))) ((_ sign_extend 32) (currentByte!3482 (_2!3225 lt!116407))) ((_ sign_extend 32) (currentBit!3477 (_2!3225 lt!116407))) lt!116409)))

(declare-fun lt!116398 () Unit!4803)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2330 array!2945 (_ BitVec 64)) Unit!4803)

(assert (=> b!72017 (= lt!116398 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3225 lt!116407) (buf!1756 (_2!3225 lt!116404)) lt!116409))))

(declare-fun reader!0 (BitStream!2330 BitStream!2330) tuple2!6224)

(assert (=> b!72017 (= lt!116391 (reader!0 (_2!3225 lt!116407) (_2!3225 lt!116404)))))

(declare-fun thiss!1379 () BitStream!2330)

(assert (=> b!72017 (validate_offset_bits!1 ((_ sign_extend 32) (size!1375 (buf!1756 (_2!3225 lt!116404)))) ((_ sign_extend 32) (currentByte!3482 thiss!1379)) ((_ sign_extend 32) (currentBit!3477 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!116397 () Unit!4803)

(assert (=> b!72017 (= lt!116397 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1756 (_2!3225 lt!116404)) (bvsub to!314 i!635)))))

(assert (=> b!72017 (= lt!116401 (reader!0 thiss!1379 (_2!3225 lt!116404)))))

(declare-fun b!72018 () Bool)

(declare-fun res!59377 () Bool)

(assert (=> b!72018 (=> res!59377 e!46891)))

(declare-fun head!559 (List!740) Bool)

(assert (=> b!72018 (= res!59377 (not (= (head!559 lt!116399) lt!116400)))))

(declare-fun res!59384 () Bool)

(declare-fun e!46898 () Bool)

(assert (=> start!14062 (=> (not res!59384) (not e!46898))))

(declare-fun srcBuffer!2 () array!2945)

(assert (=> start!14062 (= res!59384 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1375 srcBuffer!2))))))))

(assert (=> start!14062 e!46898))

(assert (=> start!14062 true))

(declare-fun array_inv!1224 (array!2945) Bool)

(assert (=> start!14062 (array_inv!1224 srcBuffer!2)))

(declare-fun e!46890 () Bool)

(declare-fun inv!12 (BitStream!2330) Bool)

(assert (=> start!14062 (and (inv!12 thiss!1379) e!46890)))

(declare-fun b!72019 () Bool)

(assert (=> b!72019 (= e!46892 e!46893)))

(declare-fun res!59371 () Bool)

(assert (=> b!72019 (=> res!59371 e!46893)))

(declare-fun lt!116393 () List!740)

(assert (=> b!72019 (= res!59371 (not (= lt!116393 lt!116408)))))

(assert (=> b!72019 (= lt!116408 lt!116393)))

(declare-fun tail!344 (List!740) List!740)

(assert (=> b!72019 (= lt!116393 (tail!344 lt!116399))))

(declare-fun lt!116402 () Unit!4803)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2330 BitStream!2330 BitStream!2330 BitStream!2330 (_ BitVec 64) List!740) Unit!4803)

(assert (=> b!72019 (= lt!116402 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3225 lt!116404) (_2!3225 lt!116404) (_1!3226 lt!116401) (_1!3226 lt!116391) (bvsub to!314 i!635) lt!116399))))

(declare-fun b!72020 () Bool)

(declare-fun e!46897 () Bool)

(declare-fun e!46902 () Bool)

(assert (=> b!72020 (= e!46897 e!46902)))

(declare-fun res!59381 () Bool)

(assert (=> b!72020 (=> res!59381 e!46902)))

(declare-fun lt!116410 () (_ BitVec 64))

(assert (=> b!72020 (= res!59381 (not (= lt!116410 (bvsub (bvadd lt!116396 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!72020 (= lt!116410 (bitIndex!0 (size!1375 (buf!1756 (_2!3225 lt!116404))) (currentByte!3482 (_2!3225 lt!116404)) (currentBit!3477 (_2!3225 lt!116404))))))

(declare-fun b!72021 () Bool)

(assert (=> b!72021 (= e!46902 e!46894)))

(declare-fun res!59372 () Bool)

(assert (=> b!72021 (=> res!59372 e!46894)))

(assert (=> b!72021 (= res!59372 (not (= (size!1375 (buf!1756 (_2!3225 lt!116407))) (size!1375 (buf!1756 (_2!3225 lt!116404))))))))

(declare-fun lt!116389 () (_ BitVec 64))

(assert (=> b!72021 (= lt!116410 (bvsub (bvsub (bvadd lt!116389 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!72021 (= lt!116389 (bitIndex!0 (size!1375 (buf!1756 (_2!3225 lt!116407))) (currentByte!3482 (_2!3225 lt!116407)) (currentBit!3477 (_2!3225 lt!116407))))))

(assert (=> b!72021 (= (size!1375 (buf!1756 (_2!3225 lt!116404))) (size!1375 (buf!1756 thiss!1379)))))

(declare-fun b!72022 () Bool)

(declare-fun e!46895 () Bool)

(assert (=> b!72022 (= e!46898 (not e!46895))))

(declare-fun res!59373 () Bool)

(assert (=> b!72022 (=> res!59373 e!46895)))

(assert (=> b!72022 (= res!59373 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2330 BitStream!2330) Bool)

(assert (=> b!72022 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!116411 () Unit!4803)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2330) Unit!4803)

(assert (=> b!72022 (= lt!116411 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!72022 (= lt!116396 (bitIndex!0 (size!1375 (buf!1756 thiss!1379)) (currentByte!3482 thiss!1379) (currentBit!3477 thiss!1379)))))

(declare-fun b!72023 () Bool)

(declare-fun res!59369 () Bool)

(assert (=> b!72023 (=> res!59369 e!46902)))

(assert (=> b!72023 (= res!59369 (not (= (size!1375 (buf!1756 thiss!1379)) (size!1375 (buf!1756 (_2!3225 lt!116404))))))))

(declare-fun b!72024 () Bool)

(declare-fun e!46903 () Bool)

(declare-fun lt!116412 () tuple2!6224)

(declare-fun byteArrayBitContentToList!0 (BitStream!2330 array!2945 (_ BitVec 64) (_ BitVec 64)) List!740)

(assert (=> b!72024 (= e!46903 (= (head!559 (byteArrayBitContentToList!0 (_2!3225 lt!116407) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!559 (bitStreamReadBitsIntoList!0 (_2!3225 lt!116407) (_1!3226 lt!116412) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!72025 () Bool)

(declare-fun res!59374 () Bool)

(assert (=> b!72025 (=> (not res!59374) (not e!46898))))

(assert (=> b!72025 (= res!59374 (validate_offset_bits!1 ((_ sign_extend 32) (size!1375 (buf!1756 thiss!1379))) ((_ sign_extend 32) (currentByte!3482 thiss!1379)) ((_ sign_extend 32) (currentBit!3477 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!72026 () Bool)

(declare-fun e!46901 () Bool)

(assert (=> b!72026 (= e!46895 e!46901)))

(declare-fun res!59383 () Bool)

(assert (=> b!72026 (=> res!59383 e!46901)))

(assert (=> b!72026 (= res!59383 (not (isPrefixOf!0 thiss!1379 (_2!3225 lt!116407))))))

(assert (=> b!72026 (validate_offset_bits!1 ((_ sign_extend 32) (size!1375 (buf!1756 (_2!3225 lt!116407)))) ((_ sign_extend 32) (currentByte!3482 (_2!3225 lt!116407))) ((_ sign_extend 32) (currentBit!3477 (_2!3225 lt!116407))) lt!116409)))

(assert (=> b!72026 (= lt!116409 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!116413 () Unit!4803)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2330 BitStream!2330 (_ BitVec 64) (_ BitVec 64)) Unit!4803)

(assert (=> b!72026 (= lt!116413 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3225 lt!116407) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2330 (_ BitVec 8) (_ BitVec 32)) tuple2!6222)

(assert (=> b!72026 (= lt!116407 (appendBitFromByte!0 thiss!1379 (select (arr!1966 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!72027 () Bool)

(assert (=> b!72027 (= e!46890 (array_inv!1224 (buf!1756 thiss!1379)))))

(declare-fun b!72028 () Bool)

(declare-fun e!46900 () Bool)

(declare-fun e!46896 () Bool)

(assert (=> b!72028 (= e!46900 e!46896)))

(declare-fun res!59379 () Bool)

(assert (=> b!72028 (=> res!59379 e!46896)))

(declare-fun lt!116394 () Bool)

(declare-fun lt!116403 () Bool)

(assert (=> b!72028 (= res!59379 (not (= lt!116394 lt!116403)))))

(assert (=> b!72028 (= lt!116394 (bitAt!0 (buf!1756 (_2!3225 lt!116407)) lt!116396))))

(declare-fun b!72029 () Bool)

(assert (=> b!72029 (= e!46901 e!46897)))

(declare-fun res!59388 () Bool)

(assert (=> b!72029 (=> res!59388 e!46897)))

(assert (=> b!72029 (= res!59388 (not (isPrefixOf!0 (_2!3225 lt!116407) (_2!3225 lt!116404))))))

(assert (=> b!72029 (isPrefixOf!0 thiss!1379 (_2!3225 lt!116404))))

(declare-fun lt!116405 () Unit!4803)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2330 BitStream!2330 BitStream!2330) Unit!4803)

(assert (=> b!72029 (= lt!116405 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3225 lt!116407) (_2!3225 lt!116404)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2330 array!2945 (_ BitVec 64) (_ BitVec 64)) tuple2!6222)

(assert (=> b!72029 (= lt!116404 (appendBitsMSBFirstLoop!0 (_2!3225 lt!116407) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!72029 e!46903))

(declare-fun res!59378 () Bool)

(assert (=> b!72029 (=> (not res!59378) (not e!46903))))

(assert (=> b!72029 (= res!59378 (validate_offset_bits!1 ((_ sign_extend 32) (size!1375 (buf!1756 (_2!3225 lt!116407)))) ((_ sign_extend 32) (currentByte!3482 thiss!1379)) ((_ sign_extend 32) (currentBit!3477 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!116390 () Unit!4803)

(assert (=> b!72029 (= lt!116390 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1756 (_2!3225 lt!116407)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!72029 (= lt!116412 (reader!0 thiss!1379 (_2!3225 lt!116407)))))

(declare-fun b!72030 () Bool)

(assert (=> b!72030 (= e!46891 e!46900)))

(declare-fun res!59370 () Bool)

(assert (=> b!72030 (=> res!59370 e!46900)))

(assert (=> b!72030 (= res!59370 (not (= (head!559 (byteArrayBitContentToList!0 (_2!3225 lt!116404) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!116403)))))

(assert (=> b!72030 (= lt!116403 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!72031 () Bool)

(declare-fun res!59375 () Bool)

(assert (=> b!72031 (=> res!59375 e!46892)))

(declare-fun length!368 (List!740) Int)

(assert (=> b!72031 (= res!59375 (<= (length!368 lt!116399) 0))))

(declare-fun b!72032 () Bool)

(declare-fun res!59387 () Bool)

(assert (=> b!72032 (=> res!59387 e!46902)))

(assert (=> b!72032 (= res!59387 (not (invariant!0 (currentBit!3477 (_2!3225 lt!116404)) (currentByte!3482 (_2!3225 lt!116404)) (size!1375 (buf!1756 (_2!3225 lt!116404))))))))

(declare-fun b!72033 () Bool)

(declare-fun e!46899 () Bool)

(assert (=> b!72033 (= e!46899 true)))

(declare-datatypes ((tuple2!6226 0))(
  ( (tuple2!6227 (_1!3227 BitStream!2330) (_2!3227 Bool)) )
))
(declare-fun lt!116392 () tuple2!6226)

(declare-fun readBitPure!0 (BitStream!2330) tuple2!6226)

(assert (=> b!72033 (= lt!116392 (readBitPure!0 (_1!3226 lt!116401)))))

(declare-fun b!72034 () Bool)

(assert (=> b!72034 (= e!46896 e!46899)))

(declare-fun res!59386 () Bool)

(assert (=> b!72034 (=> res!59386 e!46899)))

(declare-fun lt!116406 () Bool)

(assert (=> b!72034 (= res!59386 (not (= lt!116406 lt!116403)))))

(assert (=> b!72034 (= lt!116394 lt!116406)))

(assert (=> b!72034 (= lt!116406 (bitAt!0 (buf!1756 (_2!3225 lt!116404)) lt!116396))))

(declare-fun lt!116395 () Unit!4803)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2945 array!2945 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4803)

(assert (=> b!72034 (= lt!116395 (arrayBitRangesEqImpliesEq!0 (buf!1756 (_2!3225 lt!116407)) (buf!1756 (_2!3225 lt!116404)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!116396 lt!116389))))

(assert (= (and start!14062 res!59384) b!72025))

(assert (= (and b!72025 res!59374) b!72022))

(assert (= (and b!72022 (not res!59373)) b!72026))

(assert (= (and b!72026 (not res!59383)) b!72029))

(assert (= (and b!72029 res!59378) b!72024))

(assert (= (and b!72029 (not res!59388)) b!72020))

(assert (= (and b!72020 (not res!59381)) b!72032))

(assert (= (and b!72032 (not res!59387)) b!72023))

(assert (= (and b!72023 (not res!59369)) b!72021))

(assert (= (and b!72021 (not res!59372)) b!72015))

(assert (= (and b!72015 (not res!59382)) b!72014))

(assert (= (and b!72014 (not res!59376)) b!72017))

(assert (= (and b!72017 (not res!59380)) b!72031))

(assert (= (and b!72031 (not res!59375)) b!72019))

(assert (= (and b!72019 (not res!59371)) b!72016))

(assert (= (and b!72016 (not res!59385)) b!72018))

(assert (= (and b!72018 (not res!59377)) b!72030))

(assert (= (and b!72030 (not res!59370)) b!72028))

(assert (= (and b!72028 (not res!59379)) b!72034))

(assert (= (and b!72034 (not res!59386)) b!72033))

(assert (= start!14062 b!72027))

(declare-fun m!115577 () Bool)

(assert (=> b!72026 m!115577))

(declare-fun m!115579 () Bool)

(assert (=> b!72026 m!115579))

(declare-fun m!115581 () Bool)

(assert (=> b!72026 m!115581))

(declare-fun m!115583 () Bool)

(assert (=> b!72026 m!115583))

(assert (=> b!72026 m!115581))

(declare-fun m!115585 () Bool)

(assert (=> b!72026 m!115585))

(declare-fun m!115587 () Bool)

(assert (=> b!72029 m!115587))

(declare-fun m!115589 () Bool)

(assert (=> b!72029 m!115589))

(declare-fun m!115591 () Bool)

(assert (=> b!72029 m!115591))

(declare-fun m!115593 () Bool)

(assert (=> b!72029 m!115593))

(declare-fun m!115595 () Bool)

(assert (=> b!72029 m!115595))

(declare-fun m!115597 () Bool)

(assert (=> b!72029 m!115597))

(declare-fun m!115599 () Bool)

(assert (=> b!72029 m!115599))

(declare-fun m!115601 () Bool)

(assert (=> b!72017 m!115601))

(declare-fun m!115603 () Bool)

(assert (=> b!72017 m!115603))

(declare-fun m!115605 () Bool)

(assert (=> b!72017 m!115605))

(declare-fun m!115607 () Bool)

(assert (=> b!72017 m!115607))

(declare-fun m!115609 () Bool)

(assert (=> b!72017 m!115609))

(declare-fun m!115611 () Bool)

(assert (=> b!72017 m!115611))

(declare-fun m!115613 () Bool)

(assert (=> b!72017 m!115613))

(declare-fun m!115615 () Bool)

(assert (=> b!72017 m!115615))

(declare-fun m!115617 () Bool)

(assert (=> start!14062 m!115617))

(declare-fun m!115619 () Bool)

(assert (=> start!14062 m!115619))

(declare-fun m!115621 () Bool)

(assert (=> b!72031 m!115621))

(declare-fun m!115623 () Bool)

(assert (=> b!72034 m!115623))

(declare-fun m!115625 () Bool)

(assert (=> b!72034 m!115625))

(declare-fun m!115627 () Bool)

(assert (=> b!72032 m!115627))

(declare-fun m!115629 () Bool)

(assert (=> b!72024 m!115629))

(assert (=> b!72024 m!115629))

(declare-fun m!115631 () Bool)

(assert (=> b!72024 m!115631))

(declare-fun m!115633 () Bool)

(assert (=> b!72024 m!115633))

(assert (=> b!72024 m!115633))

(declare-fun m!115635 () Bool)

(assert (=> b!72024 m!115635))

(declare-fun m!115637 () Bool)

(assert (=> b!72014 m!115637))

(declare-fun m!115639 () Bool)

(assert (=> b!72033 m!115639))

(declare-fun m!115641 () Bool)

(assert (=> b!72015 m!115641))

(declare-fun m!115643 () Bool)

(assert (=> b!72028 m!115643))

(declare-fun m!115645 () Bool)

(assert (=> b!72019 m!115645))

(declare-fun m!115647 () Bool)

(assert (=> b!72019 m!115647))

(declare-fun m!115649 () Bool)

(assert (=> b!72018 m!115649))

(declare-fun m!115651 () Bool)

(assert (=> b!72030 m!115651))

(assert (=> b!72030 m!115651))

(declare-fun m!115653 () Bool)

(assert (=> b!72030 m!115653))

(declare-fun m!115655 () Bool)

(assert (=> b!72030 m!115655))

(declare-fun m!115657 () Bool)

(assert (=> b!72022 m!115657))

(declare-fun m!115659 () Bool)

(assert (=> b!72022 m!115659))

(declare-fun m!115661 () Bool)

(assert (=> b!72022 m!115661))

(declare-fun m!115663 () Bool)

(assert (=> b!72027 m!115663))

(declare-fun m!115665 () Bool)

(assert (=> b!72025 m!115665))

(declare-fun m!115667 () Bool)

(assert (=> b!72021 m!115667))

(declare-fun m!115669 () Bool)

(assert (=> b!72016 m!115669))

(declare-fun m!115671 () Bool)

(assert (=> b!72016 m!115671))

(declare-fun m!115673 () Bool)

(assert (=> b!72020 m!115673))

(push 1)

(assert (not b!72030))

(assert (not b!72014))

(assert (not b!72021))

(assert (not b!72033))

(assert (not b!72025))

(assert (not b!72024))

(assert (not b!72029))

(assert (not b!72032))

(assert (not b!72027))

(assert (not b!72018))

(assert (not start!14062))

(assert (not b!72026))

(assert (not b!72017))

(assert (not b!72019))

(assert (not b!72015))

(assert (not b!72031))

(assert (not b!72022))

(assert (not b!72034))

(assert (not b!72028))

(assert (not b!72016))

(assert (not b!72020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

