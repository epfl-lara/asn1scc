; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2376 () Bool)

(assert start!2376)

(declare-fun b!11319 () Bool)

(declare-fun e!6928 () Bool)

(declare-datatypes ((array!667 0))(
  ( (array!668 (arr!708 (Array (_ BitVec 32) (_ BitVec 8))) (size!288 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!542 0))(
  ( (BitStream!543 (buf!633 array!667) (currentByte!1705 (_ BitVec 32)) (currentBit!1700 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!1402 0))(
  ( (tuple2!1403 (_1!747 BitStream!542) (_2!747 BitStream!542)) )
))
(declare-fun lt!17716 () tuple2!1402)

(declare-datatypes ((tuple2!1404 0))(
  ( (tuple2!1405 (_1!748 array!667) (_2!748 BitStream!542)) )
))
(declare-fun lt!17715 () tuple2!1404)

(declare-fun inv!12 (BitStream!542) Bool)

(assert (=> b!11319 (= e!6928 (inv!12 (BitStream!543 (buf!633 (_1!747 lt!17716)) (currentByte!1705 (_1!747 lt!17716)) (currentBit!1700 (_2!748 lt!17715)))))))

(declare-fun b!11320 () Bool)

(declare-fun e!6927 () Bool)

(declare-fun e!6926 () Bool)

(assert (=> b!11320 (= e!6927 e!6926)))

(declare-fun res!11132 () Bool)

(assert (=> b!11320 (=> (not res!11132) (not e!6926))))

(declare-datatypes ((Unit!972 0))(
  ( (Unit!973) )
))
(declare-datatypes ((tuple2!1406 0))(
  ( (tuple2!1407 (_1!749 Unit!972) (_2!749 BitStream!542)) )
))
(declare-fun lt!17717 () tuple2!1406)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!11320 (= res!11132 (invariant!0 (currentBit!1700 (_2!749 lt!17717)) (currentByte!1705 (_2!749 lt!17717)) (size!288 (buf!633 (_2!749 lt!17717)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!667)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!542)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!542 array!667 (_ BitVec 64) (_ BitVec 64)) tuple2!1406)

(assert (=> b!11320 (= lt!17717 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!11321 () Bool)

(declare-fun res!11130 () Bool)

(declare-fun e!6930 () Bool)

(assert (=> b!11321 (=> res!11130 e!6930)))

(declare-datatypes ((List!167 0))(
  ( (Nil!164) (Cons!163 (h!282 Bool) (t!917 List!167)) )
))
(declare-fun lt!17718 () List!167)

(declare-fun byteArrayBitContentToList!0 (BitStream!542 array!667 (_ BitVec 64) (_ BitVec 64)) List!167)

(assert (=> b!11321 (= res!11130 (not (= lt!17718 (byteArrayBitContentToList!0 (_2!749 lt!17717) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!11322 () Bool)

(declare-fun res!11134 () Bool)

(assert (=> b!11322 (=> (not res!11134) (not e!6926))))

(declare-fun isPrefixOf!0 (BitStream!542 BitStream!542) Bool)

(assert (=> b!11322 (= res!11134 (isPrefixOf!0 thiss!1486 (_2!749 lt!17717)))))

(declare-fun b!11323 () Bool)

(assert (=> b!11323 (= e!6930 e!6928)))

(declare-fun res!11131 () Bool)

(assert (=> b!11323 (=> res!11131 e!6928)))

(declare-fun checkByteArrayBitContent!0 (BitStream!542 array!667 array!667 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!11323 (= res!11131 (not (checkByteArrayBitContent!0 (_2!749 lt!17717) srcBuffer!6 (_1!748 lt!17715) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!17720 () Unit!972)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!542 array!667 array!667 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!972)

(assert (=> b!11323 (= lt!17720 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!749 lt!17717) srcBuffer!6 (_1!748 lt!17715) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!11324 () Bool)

(declare-fun res!11137 () Bool)

(assert (=> b!11324 (=> (not res!11137) (not e!6926))))

(assert (=> b!11324 (= res!11137 (= (size!288 (buf!633 thiss!1486)) (size!288 (buf!633 (_2!749 lt!17717)))))))

(declare-fun b!11325 () Bool)

(assert (=> b!11325 (= e!6926 (not e!6930))))

(declare-fun res!11135 () Bool)

(assert (=> b!11325 (=> res!11135 e!6930)))

(assert (=> b!11325 (= res!11135 (not (= (byteArrayBitContentToList!0 (_2!749 lt!17717) (_1!748 lt!17715) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!17718)))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!542 BitStream!542 (_ BitVec 64)) List!167)

(assert (=> b!11325 (= lt!17718 (bitStreamReadBitsIntoList!0 (_2!749 lt!17717) (_1!747 lt!17716) nBits!460))))

(declare-fun readBits!0 (BitStream!542 (_ BitVec 64)) tuple2!1404)

(assert (=> b!11325 (= lt!17715 (readBits!0 (_1!747 lt!17716) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!11325 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17717)))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486)) nBits!460)))

(declare-fun lt!17719 () Unit!972)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!542 array!667 (_ BitVec 64)) Unit!972)

(assert (=> b!11325 (= lt!17719 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!633 (_2!749 lt!17717)) nBits!460))))

(declare-fun reader!0 (BitStream!542 BitStream!542) tuple2!1402)

(assert (=> b!11325 (= lt!17716 (reader!0 thiss!1486 (_2!749 lt!17717)))))

(declare-fun b!11326 () Bool)

(declare-fun res!11129 () Bool)

(assert (=> b!11326 (=> (not res!11129) (not e!6927))))

(assert (=> b!11326 (= res!11129 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 thiss!1486))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486)) nBits!460))))

(declare-fun res!11133 () Bool)

(assert (=> start!2376 (=> (not res!11133) (not e!6927))))

(assert (=> start!2376 (= res!11133 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!288 srcBuffer!6))))))))

(assert (=> start!2376 e!6927))

(assert (=> start!2376 true))

(declare-fun array_inv!280 (array!667) Bool)

(assert (=> start!2376 (array_inv!280 srcBuffer!6)))

(declare-fun e!6929 () Bool)

(assert (=> start!2376 (and (inv!12 thiss!1486) e!6929)))

(declare-fun b!11327 () Bool)

(declare-fun res!11136 () Bool)

(assert (=> b!11327 (=> (not res!11136) (not e!6926))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!11327 (= res!11136 (= (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17717))) (currentByte!1705 (_2!749 lt!17717)) (currentBit!1700 (_2!749 lt!17717))) (bvadd (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)) nBits!460)))))

(declare-fun b!11328 () Bool)

(assert (=> b!11328 (= e!6929 (array_inv!280 (buf!633 thiss!1486)))))

(assert (= (and start!2376 res!11133) b!11326))

(assert (= (and b!11326 res!11129) b!11320))

(assert (= (and b!11320 res!11132) b!11324))

(assert (= (and b!11324 res!11137) b!11327))

(assert (= (and b!11327 res!11136) b!11322))

(assert (= (and b!11322 res!11134) b!11325))

(assert (= (and b!11325 (not res!11135)) b!11321))

(assert (= (and b!11321 (not res!11130)) b!11323))

(assert (= (and b!11323 (not res!11131)) b!11319))

(assert (= start!2376 b!11328))

(declare-fun m!16509 () Bool)

(assert (=> b!11328 m!16509))

(declare-fun m!16511 () Bool)

(assert (=> b!11320 m!16511))

(declare-fun m!16513 () Bool)

(assert (=> b!11320 m!16513))

(declare-fun m!16515 () Bool)

(assert (=> b!11319 m!16515))

(declare-fun m!16517 () Bool)

(assert (=> b!11325 m!16517))

(declare-fun m!16519 () Bool)

(assert (=> b!11325 m!16519))

(declare-fun m!16521 () Bool)

(assert (=> b!11325 m!16521))

(declare-fun m!16523 () Bool)

(assert (=> b!11325 m!16523))

(declare-fun m!16525 () Bool)

(assert (=> b!11325 m!16525))

(declare-fun m!16527 () Bool)

(assert (=> b!11325 m!16527))

(declare-fun m!16529 () Bool)

(assert (=> b!11323 m!16529))

(declare-fun m!16531 () Bool)

(assert (=> b!11323 m!16531))

(declare-fun m!16533 () Bool)

(assert (=> b!11326 m!16533))

(declare-fun m!16535 () Bool)

(assert (=> b!11322 m!16535))

(declare-fun m!16537 () Bool)

(assert (=> start!2376 m!16537))

(declare-fun m!16539 () Bool)

(assert (=> start!2376 m!16539))

(declare-fun m!16541 () Bool)

(assert (=> b!11327 m!16541))

(declare-fun m!16543 () Bool)

(assert (=> b!11327 m!16543))

(declare-fun m!16545 () Bool)

(assert (=> b!11321 m!16545))

(push 1)

(assert (not b!11328))

(assert (not b!11327))

(assert (not start!2376))

(assert (not b!11322))

(assert (not b!11319))

(assert (not b!11320))

(assert (not b!11321))

(assert (not b!11323))

(assert (not b!11325))

(assert (not b!11326))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3466 () Bool)

(assert (=> d!3466 (= (inv!12 (BitStream!543 (buf!633 (_1!747 lt!17716)) (currentByte!1705 (_1!747 lt!17716)) (currentBit!1700 (_2!748 lt!17715)))) (invariant!0 (currentBit!1700 (BitStream!543 (buf!633 (_1!747 lt!17716)) (currentByte!1705 (_1!747 lt!17716)) (currentBit!1700 (_2!748 lt!17715)))) (currentByte!1705 (BitStream!543 (buf!633 (_1!747 lt!17716)) (currentByte!1705 (_1!747 lt!17716)) (currentBit!1700 (_2!748 lt!17715)))) (size!288 (buf!633 (BitStream!543 (buf!633 (_1!747 lt!17716)) (currentByte!1705 (_1!747 lt!17716)) (currentBit!1700 (_2!748 lt!17715)))))))))

(declare-fun bs!1028 () Bool)

(assert (= bs!1028 d!3466))

(declare-fun m!16559 () Bool)

(assert (=> bs!1028 m!16559))

(assert (=> b!11319 d!3466))

(declare-fun d!3474 () Bool)

(assert (=> d!3474 (= (invariant!0 (currentBit!1700 (_2!749 lt!17717)) (currentByte!1705 (_2!749 lt!17717)) (size!288 (buf!633 (_2!749 lt!17717)))) (and (bvsge (currentBit!1700 (_2!749 lt!17717)) #b00000000000000000000000000000000) (bvslt (currentBit!1700 (_2!749 lt!17717)) #b00000000000000000000000000001000) (bvsge (currentByte!1705 (_2!749 lt!17717)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1705 (_2!749 lt!17717)) (size!288 (buf!633 (_2!749 lt!17717)))) (and (= (currentBit!1700 (_2!749 lt!17717)) #b00000000000000000000000000000000) (= (currentByte!1705 (_2!749 lt!17717)) (size!288 (buf!633 (_2!749 lt!17717))))))))))

(assert (=> b!11320 d!3474))

(declare-fun b!11421 () Bool)

(declare-fun res!11200 () Bool)

(declare-fun e!6974 () Bool)

(assert (=> b!11421 (=> (not res!11200) (not e!6974))))

(declare-fun lt!17970 () tuple2!1406)

(assert (=> b!11421 (= res!11200 (invariant!0 (currentBit!1700 (_2!749 lt!17970)) (currentByte!1705 (_2!749 lt!17970)) (size!288 (buf!633 (_2!749 lt!17970)))))))

(declare-fun b!11422 () Bool)

(declare-fun res!11203 () Bool)

(assert (=> b!11422 (=> (not res!11203) (not e!6974))))

(assert (=> b!11422 (= res!11203 (= (size!288 (buf!633 (_2!749 lt!17970))) (size!288 (buf!633 thiss!1486))))))

(declare-fun b!11423 () Bool)

(declare-fun lt!17944 () tuple2!1402)

(assert (=> b!11423 (= e!6974 (= (bitStreamReadBitsIntoList!0 (_2!749 lt!17970) (_1!747 lt!17944) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!749 lt!17970) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!11423 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11423 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!17973 () Unit!972)

(declare-fun lt!17971 () Unit!972)

(assert (=> b!11423 (= lt!17973 lt!17971)))

(declare-fun lt!17943 () (_ BitVec 64))

(assert (=> b!11423 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17970)))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486)) lt!17943)))

(assert (=> b!11423 (= lt!17971 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!633 (_2!749 lt!17970)) lt!17943))))

(declare-fun e!6976 () Bool)

(assert (=> b!11423 e!6976))

(declare-fun res!11201 () Bool)

(assert (=> b!11423 (=> (not res!11201) (not e!6976))))

(assert (=> b!11423 (= res!11201 (and (= (size!288 (buf!633 thiss!1486)) (size!288 (buf!633 (_2!749 lt!17970)))) (bvsge lt!17943 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11423 (= lt!17943 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!11423 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11423 (= lt!17944 (reader!0 thiss!1486 (_2!749 lt!17970)))))

(declare-fun b!11424 () Bool)

(declare-fun res!11204 () Bool)

(assert (=> b!11424 (=> (not res!11204) (not e!6974))))

(assert (=> b!11424 (= res!11204 (= (size!288 (buf!633 thiss!1486)) (size!288 (buf!633 (_2!749 lt!17970)))))))

(declare-fun b!11425 () Bool)

(declare-fun res!11202 () Bool)

(assert (=> b!11425 (=> (not res!11202) (not e!6974))))

(assert (=> b!11425 (= res!11202 (isPrefixOf!0 thiss!1486 (_2!749 lt!17970)))))

(declare-fun b!11426 () Bool)

(assert (=> b!11426 (= e!6976 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 thiss!1486))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486)) lt!17943))))

(declare-fun bm!206 () Bool)

(declare-fun c!783 () Bool)

(declare-fun call!209 () tuple2!1402)

(declare-fun lt!17953 () tuple2!1406)

(assert (=> bm!206 (= call!209 (reader!0 thiss!1486 (ite c!783 (_2!749 lt!17953) thiss!1486)))))

(declare-fun d!3476 () Bool)

(assert (=> d!3476 e!6974))

(declare-fun res!11205 () Bool)

(assert (=> d!3476 (=> (not res!11205) (not e!6974))))

(declare-fun lt!17964 () (_ BitVec 64))

(assert (=> d!3476 (= res!11205 (= (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17970))) (currentByte!1705 (_2!749 lt!17970)) (currentBit!1700 (_2!749 lt!17970))) (bvsub lt!17964 from!367)))))

(assert (=> d!3476 (or (= (bvand lt!17964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!17964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!17964 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!17940 () (_ BitVec 64))

(assert (=> d!3476 (= lt!17964 (bvadd lt!17940 from!367 nBits!460))))

(assert (=> d!3476 (or (not (= (bvand lt!17940 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!17940 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!17940 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3476 (= lt!17940 (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)))))

(declare-fun e!6975 () tuple2!1406)

(assert (=> d!3476 (= lt!17970 e!6975)))

(assert (=> d!3476 (= c!783 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!17965 () Unit!972)

(declare-fun lt!17972 () Unit!972)

(assert (=> d!3476 (= lt!17965 lt!17972)))

(assert (=> d!3476 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!542) Unit!972)

(assert (=> d!3476 (= lt!17972 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!17938 () (_ BitVec 64))

(assert (=> d!3476 (= lt!17938 (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)))))

(assert (=> d!3476 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3476 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!17970)))

(declare-fun b!11427 () Bool)

(declare-fun Unit!977 () Unit!972)

(assert (=> b!11427 (= e!6975 (tuple2!1407 Unit!977 thiss!1486))))

(assert (=> b!11427 (= (size!288 (buf!633 thiss!1486)) (size!288 (buf!633 thiss!1486)))))

(declare-fun lt!17951 () Unit!972)

(declare-fun Unit!978 () Unit!972)

(assert (=> b!11427 (= lt!17951 Unit!978)))

(assert (=> b!11427 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!748 (readBits!0 (_1!747 call!209) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!11428 () Bool)

(declare-fun lt!17961 () tuple2!1406)

(declare-fun Unit!979 () Unit!972)

(assert (=> b!11428 (= e!6975 (tuple2!1407 Unit!979 (_2!749 lt!17961)))))

(declare-fun appendBitFromByte!0 (BitStream!542 (_ BitVec 8) (_ BitVec 32)) tuple2!1406)

(assert (=> b!11428 (= lt!17953 (appendBitFromByte!0 thiss!1486 (select (arr!708 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!17941 () (_ BitVec 64))

(assert (=> b!11428 (= lt!17941 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!17933 () (_ BitVec 64))

(assert (=> b!11428 (= lt!17933 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!17936 () Unit!972)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!542 BitStream!542 (_ BitVec 64) (_ BitVec 64)) Unit!972)

(assert (=> b!11428 (= lt!17936 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!749 lt!17953) lt!17941 lt!17933))))

(assert (=> b!11428 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17953)))) ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17953))) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17953))) (bvsub lt!17941 lt!17933))))

(declare-fun lt!17962 () Unit!972)

(assert (=> b!11428 (= lt!17962 lt!17936)))

(declare-fun lt!17955 () tuple2!1402)

(assert (=> b!11428 (= lt!17955 call!209)))

(declare-fun lt!17957 () (_ BitVec 64))

(assert (=> b!11428 (= lt!17957 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!17950 () Unit!972)

(assert (=> b!11428 (= lt!17950 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!633 (_2!749 lt!17953)) lt!17957))))

(assert (=> b!11428 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17953)))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486)) lt!17957)))

(declare-fun lt!17942 () Unit!972)

(assert (=> b!11428 (= lt!17942 lt!17950)))

(declare-fun head!62 (List!167) Bool)

(assert (=> b!11428 (= (head!62 (byteArrayBitContentToList!0 (_2!749 lt!17953) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!62 (bitStreamReadBitsIntoList!0 (_2!749 lt!17953) (_1!747 lt!17955) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!17974 () Unit!972)

(declare-fun Unit!981 () Unit!972)

(assert (=> b!11428 (= lt!17974 Unit!981)))

(assert (=> b!11428 (= lt!17961 (appendBitsMSBFirstLoop!0 (_2!749 lt!17953) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!17932 () Unit!972)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!542 BitStream!542 BitStream!542) Unit!972)

(assert (=> b!11428 (= lt!17932 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!749 lt!17953) (_2!749 lt!17961)))))

(assert (=> b!11428 (isPrefixOf!0 thiss!1486 (_2!749 lt!17961))))

(declare-fun lt!17969 () Unit!972)

(assert (=> b!11428 (= lt!17969 lt!17932)))

(assert (=> b!11428 (= (size!288 (buf!633 (_2!749 lt!17961))) (size!288 (buf!633 thiss!1486)))))

(declare-fun lt!17959 () Unit!972)

(declare-fun Unit!982 () Unit!972)

(assert (=> b!11428 (= lt!17959 Unit!982)))

(assert (=> b!11428 (= (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17961))) (currentByte!1705 (_2!749 lt!17961)) (currentBit!1700 (_2!749 lt!17961))) (bvsub (bvadd (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!17935 () Unit!972)

(declare-fun Unit!983 () Unit!972)

(assert (=> b!11428 (= lt!17935 Unit!983)))

(assert (=> b!11428 (= (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17961))) (currentByte!1705 (_2!749 lt!17961)) (currentBit!1700 (_2!749 lt!17961))) (bvsub (bvsub (bvadd (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17953))) (currentByte!1705 (_2!749 lt!17953)) (currentBit!1700 (_2!749 lt!17953))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!17949 () Unit!972)

(declare-fun Unit!984 () Unit!972)

(assert (=> b!11428 (= lt!17949 Unit!984)))

(declare-fun lt!17945 () tuple2!1402)

(assert (=> b!11428 (= lt!17945 (reader!0 thiss!1486 (_2!749 lt!17961)))))

(declare-fun lt!17954 () (_ BitVec 64))

(assert (=> b!11428 (= lt!17954 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!17948 () Unit!972)

(assert (=> b!11428 (= lt!17948 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!633 (_2!749 lt!17961)) lt!17954))))

(assert (=> b!11428 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17961)))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486)) lt!17954)))

(declare-fun lt!17966 () Unit!972)

(assert (=> b!11428 (= lt!17966 lt!17948)))

(declare-fun lt!17960 () tuple2!1402)

(assert (=> b!11428 (= lt!17960 (reader!0 (_2!749 lt!17953) (_2!749 lt!17961)))))

(declare-fun lt!17937 () (_ BitVec 64))

(assert (=> b!11428 (= lt!17937 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!17975 () Unit!972)

(assert (=> b!11428 (= lt!17975 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!749 lt!17953) (buf!633 (_2!749 lt!17961)) lt!17937))))

(assert (=> b!11428 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17961)))) ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17953))) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17953))) lt!17937)))

(declare-fun lt!17968 () Unit!972)

(assert (=> b!11428 (= lt!17968 lt!17975)))

(declare-fun lt!17956 () List!167)

(assert (=> b!11428 (= lt!17956 (byteArrayBitContentToList!0 (_2!749 lt!17961) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!17958 () List!167)

(assert (=> b!11428 (= lt!17958 (byteArrayBitContentToList!0 (_2!749 lt!17961) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!17939 () List!167)

(assert (=> b!11428 (= lt!17939 (bitStreamReadBitsIntoList!0 (_2!749 lt!17961) (_1!747 lt!17945) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!17952 () List!167)

(assert (=> b!11428 (= lt!17952 (bitStreamReadBitsIntoList!0 (_2!749 lt!17961) (_1!747 lt!17960) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!17934 () (_ BitVec 64))

(assert (=> b!11428 (= lt!17934 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!17946 () Unit!972)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!542 BitStream!542 BitStream!542 BitStream!542 (_ BitVec 64) List!167) Unit!972)

(assert (=> b!11428 (= lt!17946 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!749 lt!17961) (_2!749 lt!17961) (_1!747 lt!17945) (_1!747 lt!17960) lt!17934 lt!17939))))

(declare-fun tail!70 (List!167) List!167)

(assert (=> b!11428 (= (bitStreamReadBitsIntoList!0 (_2!749 lt!17961) (_1!747 lt!17960) (bvsub lt!17934 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!70 lt!17939))))

(declare-fun lt!17963 () Unit!972)

(assert (=> b!11428 (= lt!17963 lt!17946)))

(declare-fun lt!17947 () Unit!972)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!667 array!667 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!972)

(assert (=> b!11428 (= lt!17947 (arrayBitRangesEqImpliesEq!0 (buf!633 (_2!749 lt!17953)) (buf!633 (_2!749 lt!17961)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!17938 (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17953))) (currentByte!1705 (_2!749 lt!17953)) (currentBit!1700 (_2!749 lt!17953)))))))

(declare-fun bitAt!0 (array!667 (_ BitVec 64)) Bool)

(assert (=> b!11428 (= (bitAt!0 (buf!633 (_2!749 lt!17953)) lt!17938) (bitAt!0 (buf!633 (_2!749 lt!17961)) lt!17938))))

(declare-fun lt!17967 () Unit!972)

(assert (=> b!11428 (= lt!17967 lt!17947)))

(assert (= (and d!3476 c!783) b!11428))

(assert (= (and d!3476 (not c!783)) b!11427))

(assert (= (or b!11428 b!11427) bm!206))

(assert (= (and d!3476 res!11205) b!11421))

(assert (= (and b!11421 res!11200) b!11424))

(assert (= (and b!11424 res!11204) b!11425))

(assert (= (and b!11425 res!11202) b!11422))

(assert (= (and b!11422 res!11203) b!11423))

(assert (= (and b!11423 res!11201) b!11426))

(declare-fun m!16629 () Bool)

(assert (=> b!11427 m!16629))

(declare-fun m!16631 () Bool)

(assert (=> b!11427 m!16631))

(declare-fun m!16633 () Bool)

(assert (=> bm!206 m!16633))

(declare-fun m!16635 () Bool)

(assert (=> d!3476 m!16635))

(assert (=> d!3476 m!16543))

(declare-fun m!16637 () Bool)

(assert (=> d!3476 m!16637))

(declare-fun m!16639 () Bool)

(assert (=> d!3476 m!16639))

(declare-fun m!16641 () Bool)

(assert (=> b!11426 m!16641))

(declare-fun m!16643 () Bool)

(assert (=> b!11421 m!16643))

(declare-fun m!16645 () Bool)

(assert (=> b!11425 m!16645))

(declare-fun m!16647 () Bool)

(assert (=> b!11423 m!16647))

(declare-fun m!16649 () Bool)

(assert (=> b!11423 m!16649))

(declare-fun m!16651 () Bool)

(assert (=> b!11423 m!16651))

(declare-fun m!16653 () Bool)

(assert (=> b!11423 m!16653))

(declare-fun m!16655 () Bool)

(assert (=> b!11423 m!16655))

(declare-fun m!16657 () Bool)

(assert (=> b!11428 m!16657))

(declare-fun m!16659 () Bool)

(assert (=> b!11428 m!16659))

(declare-fun m!16661 () Bool)

(assert (=> b!11428 m!16661))

(declare-fun m!16663 () Bool)

(assert (=> b!11428 m!16663))

(declare-fun m!16665 () Bool)

(assert (=> b!11428 m!16665))

(declare-fun m!16667 () Bool)

(assert (=> b!11428 m!16667))

(declare-fun m!16669 () Bool)

(assert (=> b!11428 m!16669))

(declare-fun m!16671 () Bool)

(assert (=> b!11428 m!16671))

(declare-fun m!16673 () Bool)

(assert (=> b!11428 m!16673))

(declare-fun m!16675 () Bool)

(assert (=> b!11428 m!16675))

(declare-fun m!16677 () Bool)

(assert (=> b!11428 m!16677))

(declare-fun m!16679 () Bool)

(assert (=> b!11428 m!16679))

(assert (=> b!11428 m!16671))

(declare-fun m!16681 () Bool)

(assert (=> b!11428 m!16681))

(declare-fun m!16683 () Bool)

(assert (=> b!11428 m!16683))

(declare-fun m!16685 () Bool)

(assert (=> b!11428 m!16685))

(assert (=> b!11428 m!16543))

(declare-fun m!16687 () Bool)

(assert (=> b!11428 m!16687))

(assert (=> b!11428 m!16675))

(declare-fun m!16689 () Bool)

(assert (=> b!11428 m!16689))

(declare-fun m!16691 () Bool)

(assert (=> b!11428 m!16691))

(declare-fun m!16693 () Bool)

(assert (=> b!11428 m!16693))

(declare-fun m!16695 () Bool)

(assert (=> b!11428 m!16695))

(declare-fun m!16697 () Bool)

(assert (=> b!11428 m!16697))

(declare-fun m!16699 () Bool)

(assert (=> b!11428 m!16699))

(assert (=> b!11428 m!16659))

(declare-fun m!16701 () Bool)

(assert (=> b!11428 m!16701))

(declare-fun m!16703 () Bool)

(assert (=> b!11428 m!16703))

(declare-fun m!16705 () Bool)

(assert (=> b!11428 m!16705))

(declare-fun m!16707 () Bool)

(assert (=> b!11428 m!16707))

(declare-fun m!16709 () Bool)

(assert (=> b!11428 m!16709))

(declare-fun m!16711 () Bool)

(assert (=> b!11428 m!16711))

(declare-fun m!16713 () Bool)

(assert (=> b!11428 m!16713))

(declare-fun m!16715 () Bool)

(assert (=> b!11428 m!16715))

(declare-fun m!16717 () Bool)

(assert (=> b!11428 m!16717))

(assert (=> b!11428 m!16711))

(assert (=> b!11320 d!3476))

(declare-fun d!3502 () Bool)

(assert (=> d!3502 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17717)))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486)) nBits!460)))

(declare-fun lt!17978 () Unit!972)

(declare-fun choose!9 (BitStream!542 array!667 (_ BitVec 64) BitStream!542) Unit!972)

(assert (=> d!3502 (= lt!17978 (choose!9 thiss!1486 (buf!633 (_2!749 lt!17717)) nBits!460 (BitStream!543 (buf!633 (_2!749 lt!17717)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486))))))

(assert (=> d!3502 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!633 (_2!749 lt!17717)) nBits!460) lt!17978)))

(declare-fun bs!1031 () Bool)

(assert (= bs!1031 d!3502))

(assert (=> bs!1031 m!16517))

(declare-fun m!16719 () Bool)

(assert (=> bs!1031 m!16719))

(assert (=> b!11325 d!3502))

(declare-fun b!11437 () Bool)

(declare-datatypes ((tuple2!1412 0))(
  ( (tuple2!1413 (_1!753 List!167) (_2!753 BitStream!542)) )
))
(declare-fun e!6982 () tuple2!1412)

(assert (=> b!11437 (= e!6982 (tuple2!1413 Nil!164 (_1!747 lt!17716)))))

(declare-fun b!11440 () Bool)

(declare-fun e!6981 () Bool)

(declare-fun lt!17986 () List!167)

(declare-fun length!33 (List!167) Int)

(assert (=> b!11440 (= e!6981 (> (length!33 lt!17986) 0))))

(declare-fun b!11439 () Bool)

(declare-fun isEmpty!38 (List!167) Bool)

(assert (=> b!11439 (= e!6981 (isEmpty!38 lt!17986))))

(declare-fun b!11438 () Bool)

(declare-datatypes ((tuple2!1414 0))(
  ( (tuple2!1415 (_1!754 Bool) (_2!754 BitStream!542)) )
))
(declare-fun lt!17985 () tuple2!1414)

(declare-fun lt!17987 () (_ BitVec 64))

(assert (=> b!11438 (= e!6982 (tuple2!1413 (Cons!163 (_1!754 lt!17985) (bitStreamReadBitsIntoList!0 (_2!749 lt!17717) (_2!754 lt!17985) (bvsub nBits!460 lt!17987))) (_2!754 lt!17985)))))

(declare-fun readBit!0 (BitStream!542) tuple2!1414)

(assert (=> b!11438 (= lt!17985 (readBit!0 (_1!747 lt!17716)))))

(assert (=> b!11438 (= lt!17987 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!3504 () Bool)

(assert (=> d!3504 e!6981))

(declare-fun c!789 () Bool)

(assert (=> d!3504 (= c!789 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3504 (= lt!17986 (_1!753 e!6982))))

(declare-fun c!788 () Bool)

(assert (=> d!3504 (= c!788 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3504 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3504 (= (bitStreamReadBitsIntoList!0 (_2!749 lt!17717) (_1!747 lt!17716) nBits!460) lt!17986)))

(assert (= (and d!3504 c!788) b!11437))

(assert (= (and d!3504 (not c!788)) b!11438))

(assert (= (and d!3504 c!789) b!11439))

(assert (= (and d!3504 (not c!789)) b!11440))

(declare-fun m!16721 () Bool)

(assert (=> b!11440 m!16721))

(declare-fun m!16723 () Bool)

(assert (=> b!11439 m!16723))

(declare-fun m!16725 () Bool)

(assert (=> b!11438 m!16725))

(declare-fun m!16727 () Bool)

(assert (=> b!11438 m!16727))

(assert (=> b!11325 d!3504))

(declare-fun d!3506 () Bool)

(declare-fun c!792 () Bool)

(assert (=> d!3506 (= c!792 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!6985 () List!167)

(assert (=> d!3506 (= (byteArrayBitContentToList!0 (_2!749 lt!17717) (_1!748 lt!17715) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!6985)))

(declare-fun b!11445 () Bool)

(assert (=> b!11445 (= e!6985 Nil!164)))

(declare-fun b!11446 () Bool)

(assert (=> b!11446 (= e!6985 (Cons!163 (not (= (bvand ((_ sign_extend 24) (select (arr!708 (_1!748 lt!17715)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!749 lt!17717) (_1!748 lt!17715) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3506 c!792) b!11445))

(assert (= (and d!3506 (not c!792)) b!11446))

(declare-fun m!16729 () Bool)

(assert (=> b!11446 m!16729))

(declare-fun m!16731 () Bool)

(assert (=> b!11446 m!16731))

(declare-fun m!16733 () Bool)

(assert (=> b!11446 m!16733))

(assert (=> b!11325 d!3506))

(declare-fun d!3508 () Bool)

(declare-fun e!7005 () Bool)

(assert (=> d!3508 e!7005))

(declare-fun res!11244 () Bool)

(assert (=> d!3508 (=> (not res!11244) (not e!7005))))

(declare-fun lt!18260 () tuple2!1402)

(assert (=> d!3508 (= res!11244 (isPrefixOf!0 (_1!747 lt!18260) (_2!747 lt!18260)))))

(declare-fun lt!18255 () BitStream!542)

(assert (=> d!3508 (= lt!18260 (tuple2!1403 lt!18255 (_2!749 lt!17717)))))

(declare-fun lt!18258 () Unit!972)

(declare-fun lt!18253 () Unit!972)

(assert (=> d!3508 (= lt!18258 lt!18253)))

(assert (=> d!3508 (isPrefixOf!0 lt!18255 (_2!749 lt!17717))))

(assert (=> d!3508 (= lt!18253 (lemmaIsPrefixTransitive!0 lt!18255 (_2!749 lt!17717) (_2!749 lt!17717)))))

(declare-fun lt!18265 () Unit!972)

(declare-fun lt!18264 () Unit!972)

(assert (=> d!3508 (= lt!18265 lt!18264)))

(assert (=> d!3508 (isPrefixOf!0 lt!18255 (_2!749 lt!17717))))

(assert (=> d!3508 (= lt!18264 (lemmaIsPrefixTransitive!0 lt!18255 thiss!1486 (_2!749 lt!17717)))))

(declare-fun lt!18254 () Unit!972)

(declare-fun e!7006 () Unit!972)

(assert (=> d!3508 (= lt!18254 e!7006)))

(declare-fun c!800 () Bool)

(assert (=> d!3508 (= c!800 (not (= (size!288 (buf!633 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!18249 () Unit!972)

(declare-fun lt!18261 () Unit!972)

(assert (=> d!3508 (= lt!18249 lt!18261)))

(assert (=> d!3508 (isPrefixOf!0 (_2!749 lt!17717) (_2!749 lt!17717))))

(assert (=> d!3508 (= lt!18261 (lemmaIsPrefixRefl!0 (_2!749 lt!17717)))))

(declare-fun lt!18252 () Unit!972)

(declare-fun lt!18250 () Unit!972)

(assert (=> d!3508 (= lt!18252 lt!18250)))

(assert (=> d!3508 (= lt!18250 (lemmaIsPrefixRefl!0 (_2!749 lt!17717)))))

(declare-fun lt!18257 () Unit!972)

(declare-fun lt!18266 () Unit!972)

(assert (=> d!3508 (= lt!18257 lt!18266)))

(assert (=> d!3508 (isPrefixOf!0 lt!18255 lt!18255)))

(assert (=> d!3508 (= lt!18266 (lemmaIsPrefixRefl!0 lt!18255))))

(declare-fun lt!18248 () Unit!972)

(declare-fun lt!18267 () Unit!972)

(assert (=> d!3508 (= lt!18248 lt!18267)))

(assert (=> d!3508 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3508 (= lt!18267 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3508 (= lt!18255 (BitStream!543 (buf!633 (_2!749 lt!17717)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)))))

(assert (=> d!3508 (isPrefixOf!0 thiss!1486 (_2!749 lt!17717))))

(assert (=> d!3508 (= (reader!0 thiss!1486 (_2!749 lt!17717)) lt!18260)))

(declare-fun lt!18263 () (_ BitVec 64))

(declare-fun lt!18251 () (_ BitVec 64))

(declare-fun b!11497 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!542 (_ BitVec 64)) BitStream!542)

(assert (=> b!11497 (= e!7005 (= (_1!747 lt!18260) (withMovedBitIndex!0 (_2!747 lt!18260) (bvsub lt!18251 lt!18263))))))

(assert (=> b!11497 (or (= (bvand lt!18251 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18263 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18251 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18251 lt!18263) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11497 (= lt!18263 (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17717))) (currentByte!1705 (_2!749 lt!17717)) (currentBit!1700 (_2!749 lt!17717))))))

(assert (=> b!11497 (= lt!18251 (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)))))

(declare-fun b!11498 () Bool)

(declare-fun res!11243 () Bool)

(assert (=> b!11498 (=> (not res!11243) (not e!7005))))

(assert (=> b!11498 (= res!11243 (isPrefixOf!0 (_2!747 lt!18260) (_2!749 lt!17717)))))

(declare-fun b!11499 () Bool)

(declare-fun Unit!996 () Unit!972)

(assert (=> b!11499 (= e!7006 Unit!996)))

(declare-fun b!11500 () Bool)

(declare-fun lt!18256 () Unit!972)

(assert (=> b!11500 (= e!7006 lt!18256)))

(declare-fun lt!18259 () (_ BitVec 64))

(assert (=> b!11500 (= lt!18259 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18262 () (_ BitVec 64))

(assert (=> b!11500 (= lt!18262 (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!667 array!667 (_ BitVec 64) (_ BitVec 64)) Unit!972)

(assert (=> b!11500 (= lt!18256 (arrayBitRangesEqSymmetric!0 (buf!633 thiss!1486) (buf!633 (_2!749 lt!17717)) lt!18259 lt!18262))))

(declare-fun arrayBitRangesEq!0 (array!667 array!667 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!11500 (arrayBitRangesEq!0 (buf!633 (_2!749 lt!17717)) (buf!633 thiss!1486) lt!18259 lt!18262)))

(declare-fun b!11501 () Bool)

(declare-fun res!11242 () Bool)

(assert (=> b!11501 (=> (not res!11242) (not e!7005))))

(assert (=> b!11501 (= res!11242 (isPrefixOf!0 (_1!747 lt!18260) thiss!1486))))

(assert (= (and d!3508 c!800) b!11500))

(assert (= (and d!3508 (not c!800)) b!11499))

(assert (= (and d!3508 res!11244) b!11501))

(assert (= (and b!11501 res!11242) b!11498))

(assert (= (and b!11498 res!11243) b!11497))

(declare-fun m!16827 () Bool)

(assert (=> d!3508 m!16827))

(declare-fun m!16829 () Bool)

(assert (=> d!3508 m!16829))

(assert (=> d!3508 m!16637))

(declare-fun m!16831 () Bool)

(assert (=> d!3508 m!16831))

(assert (=> d!3508 m!16639))

(declare-fun m!16833 () Bool)

(assert (=> d!3508 m!16833))

(declare-fun m!16835 () Bool)

(assert (=> d!3508 m!16835))

(declare-fun m!16837 () Bool)

(assert (=> d!3508 m!16837))

(declare-fun m!16839 () Bool)

(assert (=> d!3508 m!16839))

(declare-fun m!16841 () Bool)

(assert (=> d!3508 m!16841))

(assert (=> d!3508 m!16535))

(declare-fun m!16843 () Bool)

(assert (=> b!11501 m!16843))

(declare-fun m!16845 () Bool)

(assert (=> b!11498 m!16845))

(declare-fun m!16847 () Bool)

(assert (=> b!11497 m!16847))

(assert (=> b!11497 m!16541))

(assert (=> b!11497 m!16543))

(assert (=> b!11500 m!16543))

(declare-fun m!16849 () Bool)

(assert (=> b!11500 m!16849))

(declare-fun m!16851 () Bool)

(assert (=> b!11500 m!16851))

(assert (=> b!11325 d!3508))

(declare-fun d!3514 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!3514 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17717)))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17717)))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486))) nBits!460))))

(declare-fun bs!1033 () Bool)

(assert (= bs!1033 d!3514))

(declare-fun m!16853 () Bool)

(assert (=> bs!1033 m!16853))

(assert (=> b!11325 d!3514))

(declare-fun b!11543 () Bool)

(declare-fun res!11283 () Bool)

(declare-fun e!7022 () Bool)

(assert (=> b!11543 (=> (not res!11283) (not e!7022))))

(declare-fun lt!18379 () tuple2!1404)

(assert (=> b!11543 (= res!11283 (bvsle (currentByte!1705 (_1!747 lt!17716)) (currentByte!1705 (_2!748 lt!18379))))))

(declare-fun b!11544 () Bool)

(assert (=> b!11544 (= e!7022 (= (byteArrayBitContentToList!0 (_2!748 lt!18379) (_1!748 lt!18379) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!748 lt!18379) (_1!747 lt!17716) nBits!460)))))

(declare-fun b!11545 () Bool)

(declare-fun res!11284 () Bool)

(assert (=> b!11545 (=> (not res!11284) (not e!7022))))

(assert (=> b!11545 (= res!11284 (invariant!0 (currentBit!1700 (_2!748 lt!18379)) (currentByte!1705 (_2!748 lt!18379)) (size!288 (buf!633 (_2!748 lt!18379)))))))

(declare-fun b!11546 () Bool)

(declare-fun res!11286 () Bool)

(assert (=> b!11546 (=> (not res!11286) (not e!7022))))

(declare-fun lt!18375 () (_ BitVec 64))

(assert (=> b!11546 (= res!11286 (= (size!288 (_1!748 lt!18379)) ((_ extract 31 0) lt!18375)))))

(assert (=> b!11546 (and (bvslt lt!18375 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!18375 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!18378 () (_ BitVec 64))

(declare-fun lt!18372 () (_ BitVec 64))

(assert (=> b!11546 (= lt!18375 (bvsdiv lt!18378 lt!18372))))

(assert (=> b!11546 (and (not (= lt!18372 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!18378 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!18372 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!11546 (= lt!18372 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!18374 () (_ BitVec 64))

(declare-fun lt!18377 () (_ BitVec 64))

(assert (=> b!11546 (= lt!18378 (bvsub lt!18374 lt!18377))))

(assert (=> b!11546 (or (= (bvand lt!18374 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18377 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18374 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18374 lt!18377) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11546 (= lt!18377 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!18373 () (_ BitVec 64))

(assert (=> b!11546 (= lt!18374 (bvadd nBits!460 lt!18373))))

(assert (=> b!11546 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18373 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!18373) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11546 (= lt!18373 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!11542 () Bool)

(declare-fun res!11285 () Bool)

(assert (=> b!11542 (=> (not res!11285) (not e!7022))))

(declare-fun lt!18376 () (_ BitVec 64))

(assert (=> b!11542 (= res!11285 (= (bvadd lt!18376 nBits!460) (bitIndex!0 (size!288 (buf!633 (_2!748 lt!18379))) (currentByte!1705 (_2!748 lt!18379)) (currentBit!1700 (_2!748 lt!18379)))))))

(assert (=> b!11542 (or (not (= (bvand lt!18376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!18376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!18376 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11542 (= lt!18376 (bitIndex!0 (size!288 (buf!633 (_1!747 lt!17716))) (currentByte!1705 (_1!747 lt!17716)) (currentBit!1700 (_1!747 lt!17716))))))

(declare-fun d!3516 () Bool)

(assert (=> d!3516 e!7022))

(declare-fun res!11287 () Bool)

(assert (=> d!3516 (=> (not res!11287) (not e!7022))))

(assert (=> d!3516 (= res!11287 (= (buf!633 (_2!748 lt!18379)) (buf!633 (_1!747 lt!17716))))))

(declare-datatypes ((tuple3!90 0))(
  ( (tuple3!91 (_1!756 Unit!972) (_2!756 BitStream!542) (_3!48 array!667)) )
))
(declare-fun lt!18380 () tuple3!90)

(assert (=> d!3516 (= lt!18379 (tuple2!1405 (_3!48 lt!18380) (_2!756 lt!18380)))))

(declare-fun readBitsLoop!0 (BitStream!542 (_ BitVec 64) array!667 (_ BitVec 64) (_ BitVec 64)) tuple3!90)

(assert (=> d!3516 (= lt!18380 (readBitsLoop!0 (_1!747 lt!17716) nBits!460 (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3516 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!3516 (= (readBits!0 (_1!747 lt!17716) nBits!460) lt!18379)))

(assert (= (and d!3516 res!11287) b!11542))

(assert (= (and b!11542 res!11285) b!11545))

(assert (= (and b!11545 res!11284) b!11546))

(assert (= (and b!11546 res!11286) b!11543))

(assert (= (and b!11543 res!11283) b!11544))

(declare-fun m!16943 () Bool)

(assert (=> b!11544 m!16943))

(declare-fun m!16945 () Bool)

(assert (=> b!11544 m!16945))

(declare-fun m!16947 () Bool)

(assert (=> b!11545 m!16947))

(declare-fun m!16951 () Bool)

(assert (=> b!11542 m!16951))

(declare-fun m!16953 () Bool)

(assert (=> b!11542 m!16953))

(declare-fun m!16957 () Bool)

(assert (=> d!3516 m!16957))

(assert (=> b!11325 d!3516))

(declare-fun d!3530 () Bool)

(assert (=> d!3530 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 thiss!1486))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!288 (buf!633 thiss!1486))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486))) nBits!460))))

(declare-fun bs!1035 () Bool)

(assert (= bs!1035 d!3530))

(declare-fun m!16967 () Bool)

(assert (=> bs!1035 m!16967))

(assert (=> b!11326 d!3530))

(declare-fun d!3534 () Bool)

(declare-fun c!802 () Bool)

(assert (=> d!3534 (= c!802 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7026 () List!167)

(assert (=> d!3534 (= (byteArrayBitContentToList!0 (_2!749 lt!17717) srcBuffer!6 from!367 nBits!460) e!7026)))

(declare-fun b!11554 () Bool)

(assert (=> b!11554 (= e!7026 Nil!164)))

(declare-fun b!11555 () Bool)

(assert (=> b!11555 (= e!7026 (Cons!163 (not (= (bvand ((_ sign_extend 24) (select (arr!708 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!749 lt!17717) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3534 c!802) b!11554))

(assert (= (and d!3534 (not c!802)) b!11555))

(assert (=> b!11555 m!16659))

(declare-fun m!16971 () Bool)

(assert (=> b!11555 m!16971))

(declare-fun m!16973 () Bool)

(assert (=> b!11555 m!16973))

(assert (=> b!11321 d!3534))

(declare-fun d!3538 () Bool)

(declare-fun res!11302 () Bool)

(declare-fun e!7032 () Bool)

(assert (=> d!3538 (=> (not res!11302) (not e!7032))))

(assert (=> d!3538 (= res!11302 (= (size!288 (buf!633 thiss!1486)) (size!288 (buf!633 (_2!749 lt!17717)))))))

(assert (=> d!3538 (= (isPrefixOf!0 thiss!1486 (_2!749 lt!17717)) e!7032)))

(declare-fun b!11562 () Bool)

(declare-fun res!11303 () Bool)

(assert (=> b!11562 (=> (not res!11303) (not e!7032))))

(assert (=> b!11562 (= res!11303 (bvsle (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)) (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17717))) (currentByte!1705 (_2!749 lt!17717)) (currentBit!1700 (_2!749 lt!17717)))))))

(declare-fun b!11563 () Bool)

(declare-fun e!7031 () Bool)

(assert (=> b!11563 (= e!7032 e!7031)))

(declare-fun res!11301 () Bool)

(assert (=> b!11563 (=> res!11301 e!7031)))

(assert (=> b!11563 (= res!11301 (= (size!288 (buf!633 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!11564 () Bool)

(assert (=> b!11564 (= e!7031 (arrayBitRangesEq!0 (buf!633 thiss!1486) (buf!633 (_2!749 lt!17717)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486))))))

(assert (= (and d!3538 res!11302) b!11562))

(assert (= (and b!11562 res!11303) b!11563))

(assert (= (and b!11563 (not res!11301)) b!11564))

(assert (=> b!11562 m!16543))

(assert (=> b!11562 m!16541))

(assert (=> b!11564 m!16543))

(assert (=> b!11564 m!16543))

(declare-fun m!16979 () Bool)

(assert (=> b!11564 m!16979))

(assert (=> b!11322 d!3538))

(declare-fun d!3542 () Bool)

(declare-fun e!7035 () Bool)

(assert (=> d!3542 e!7035))

(declare-fun res!11308 () Bool)

(assert (=> d!3542 (=> (not res!11308) (not e!7035))))

(declare-fun lt!18409 () (_ BitVec 64))

(declare-fun lt!18411 () (_ BitVec 64))

(declare-fun lt!18408 () (_ BitVec 64))

(assert (=> d!3542 (= res!11308 (= lt!18408 (bvsub lt!18411 lt!18409)))))

(assert (=> d!3542 (or (= (bvand lt!18411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18409 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18411 lt!18409) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3542 (= lt!18409 (remainingBits!0 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17717)))) ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17717))) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17717)))))))

(declare-fun lt!18412 () (_ BitVec 64))

(declare-fun lt!18410 () (_ BitVec 64))

(assert (=> d!3542 (= lt!18411 (bvmul lt!18412 lt!18410))))

(assert (=> d!3542 (or (= lt!18412 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!18410 (bvsdiv (bvmul lt!18412 lt!18410) lt!18412)))))

(assert (=> d!3542 (= lt!18410 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3542 (= lt!18412 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17717)))))))

(assert (=> d!3542 (= lt!18408 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17717))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17717)))))))

(assert (=> d!3542 (invariant!0 (currentBit!1700 (_2!749 lt!17717)) (currentByte!1705 (_2!749 lt!17717)) (size!288 (buf!633 (_2!749 lt!17717))))))

(assert (=> d!3542 (= (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17717))) (currentByte!1705 (_2!749 lt!17717)) (currentBit!1700 (_2!749 lt!17717))) lt!18408)))

(declare-fun b!11569 () Bool)

(declare-fun res!11309 () Bool)

(assert (=> b!11569 (=> (not res!11309) (not e!7035))))

(assert (=> b!11569 (= res!11309 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!18408))))

(declare-fun b!11570 () Bool)

(declare-fun lt!18413 () (_ BitVec 64))

(assert (=> b!11570 (= e!7035 (bvsle lt!18408 (bvmul lt!18413 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!11570 (or (= lt!18413 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!18413 #b0000000000000000000000000000000000000000000000000000000000001000) lt!18413)))))

(assert (=> b!11570 (= lt!18413 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17717)))))))

(assert (= (and d!3542 res!11308) b!11569))

(assert (= (and b!11569 res!11309) b!11570))

(declare-fun m!16981 () Bool)

(assert (=> d!3542 m!16981))

(assert (=> d!3542 m!16511))

(assert (=> b!11327 d!3542))

(declare-fun d!3544 () Bool)

(declare-fun e!7036 () Bool)

(assert (=> d!3544 e!7036))

(declare-fun res!11310 () Bool)

(assert (=> d!3544 (=> (not res!11310) (not e!7036))))

(declare-fun lt!18414 () (_ BitVec 64))

(declare-fun lt!18417 () (_ BitVec 64))

(declare-fun lt!18415 () (_ BitVec 64))

(assert (=> d!3544 (= res!11310 (= lt!18414 (bvsub lt!18417 lt!18415)))))

(assert (=> d!3544 (or (= (bvand lt!18417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18415 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18417 lt!18415) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3544 (= lt!18415 (remainingBits!0 ((_ sign_extend 32) (size!288 (buf!633 thiss!1486))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486))))))

(declare-fun lt!18418 () (_ BitVec 64))

(declare-fun lt!18416 () (_ BitVec 64))

(assert (=> d!3544 (= lt!18417 (bvmul lt!18418 lt!18416))))

(assert (=> d!3544 (or (= lt!18418 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!18416 (bvsdiv (bvmul lt!18418 lt!18416) lt!18418)))))

(assert (=> d!3544 (= lt!18416 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3544 (= lt!18418 ((_ sign_extend 32) (size!288 (buf!633 thiss!1486))))))

(assert (=> d!3544 (= lt!18414 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1705 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1700 thiss!1486))))))

(assert (=> d!3544 (invariant!0 (currentBit!1700 thiss!1486) (currentByte!1705 thiss!1486) (size!288 (buf!633 thiss!1486)))))

(assert (=> d!3544 (= (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)) lt!18414)))

(declare-fun b!11571 () Bool)

(declare-fun res!11311 () Bool)

(assert (=> b!11571 (=> (not res!11311) (not e!7036))))

(assert (=> b!11571 (= res!11311 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!18414))))

(declare-fun b!11572 () Bool)

(declare-fun lt!18419 () (_ BitVec 64))

(assert (=> b!11572 (= e!7036 (bvsle lt!18414 (bvmul lt!18419 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!11572 (or (= lt!18419 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!18419 #b0000000000000000000000000000000000000000000000000000000000001000) lt!18419)))))

(assert (=> b!11572 (= lt!18419 ((_ sign_extend 32) (size!288 (buf!633 thiss!1486))))))

(assert (= (and d!3544 res!11310) b!11571))

(assert (= (and b!11571 res!11311) b!11572))

(assert (=> d!3544 m!16967))

(declare-fun m!16983 () Bool)

(assert (=> d!3544 m!16983))

(assert (=> b!11327 d!3544))

(declare-fun d!3546 () Bool)

(assert (=> d!3546 (= (array_inv!280 srcBuffer!6) (bvsge (size!288 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!2376 d!3546))

(declare-fun d!3548 () Bool)

(assert (=> d!3548 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1700 thiss!1486) (currentByte!1705 thiss!1486) (size!288 (buf!633 thiss!1486))))))

(declare-fun bs!1038 () Bool)

(assert (= bs!1038 d!3548))

(assert (=> bs!1038 m!16983))

(assert (=> start!2376 d!3548))

(declare-fun d!3550 () Bool)

(assert (=> d!3550 (= (array_inv!280 (buf!633 thiss!1486)) (bvsge (size!288 (buf!633 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!11328 d!3550))

(declare-fun d!3552 () Bool)

(declare-fun res!11316 () Bool)

(declare-fun e!7041 () Bool)

(assert (=> d!3552 (=> res!11316 e!7041)))

(assert (=> d!3552 (= res!11316 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3552 (= (checkByteArrayBitContent!0 (_2!749 lt!17717) srcBuffer!6 (_1!748 lt!17715) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!7041)))

(declare-fun b!11577 () Bool)

(declare-fun e!7042 () Bool)

(assert (=> b!11577 (= e!7041 e!7042)))

(declare-fun res!11317 () Bool)

(assert (=> b!11577 (=> (not res!11317) (not e!7042))))

(assert (=> b!11577 (= res!11317 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!708 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!708 (_1!748 lt!17715)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!11578 () Bool)

(assert (=> b!11578 (= e!7042 (checkByteArrayBitContent!0 (_2!749 lt!17717) srcBuffer!6 (_1!748 lt!17715) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!3552 (not res!11316)) b!11577))

(assert (= (and b!11577 res!11317) b!11578))

(assert (=> b!11577 m!16659))

(assert (=> b!11577 m!16971))

(assert (=> b!11577 m!16729))

(assert (=> b!11577 m!16731))

(declare-fun m!16985 () Bool)

(assert (=> b!11578 m!16985))

(assert (=> b!11323 d!3552))

(declare-fun d!3554 () Bool)

(assert (=> d!3554 (checkByteArrayBitContent!0 (_2!749 lt!17717) srcBuffer!6 (_1!748 lt!17715) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!18422 () Unit!972)

(declare-fun choose!65 (BitStream!542 array!667 array!667 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!972)

(assert (=> d!3554 (= lt!18422 (choose!65 (_2!749 lt!17717) srcBuffer!6 (_1!748 lt!17715) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3554 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3554 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!749 lt!17717) srcBuffer!6 (_1!748 lt!17715) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!18422)))

(declare-fun bs!1039 () Bool)

(assert (= bs!1039 d!3554))

(assert (=> bs!1039 m!16529))

(declare-fun m!16987 () Bool)

(assert (=> bs!1039 m!16987))

(assert (=> b!11323 d!3554))

(push 1)

(assert (not d!3508))

(assert (not bm!206))

(assert (not b!11578))

(assert (not d!3466))

(assert (not b!11446))

(assert (not b!11501))

(assert (not d!3544))

(assert (not b!11498))

(assert (not b!11439))

(assert (not b!11440))

(assert (not b!11497))

(assert (not b!11500))

(assert (not b!11438))

(assert (not b!11542))

(assert (not d!3542))

(assert (not b!11427))

(assert (not d!3476))

(assert (not b!11421))

(assert (not b!11425))

(assert (not b!11564))

(assert (not b!11426))

(assert (not d!3530))

(assert (not b!11562))

(assert (not d!3548))

(assert (not d!3514))

(assert (not d!3554))

(assert (not b!11423))

(assert (not b!11544))

(assert (not b!11555))

(assert (not b!11545))

(assert (not d!3516))

(assert (not b!11428))

(assert (not d!3502))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3886 () Bool)

(declare-fun c!882 () Bool)

(assert (=> d!3886 (= c!882 (= (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7313 () List!167)

(assert (=> d!3886 (= (byteArrayBitContentToList!0 (_2!749 lt!17717) (_1!748 lt!17715) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)) e!7313)))

(declare-fun b!12036 () Bool)

(assert (=> b!12036 (= e!7313 Nil!164)))

(declare-fun b!12037 () Bool)

(assert (=> b!12037 (= e!7313 (Cons!163 (not (= (bvand ((_ sign_extend 24) (select (arr!708 (_1!748 lt!17715)) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!749 lt!17717) (_1!748 lt!17715) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3886 c!882) b!12036))

(assert (= (and d!3886 (not c!882)) b!12037))

(declare-fun m!18043 () Bool)

(assert (=> b!12037 m!18043))

(declare-fun m!18045 () Bool)

(assert (=> b!12037 m!18045))

(declare-fun m!18047 () Bool)

(assert (=> b!12037 m!18047))

(assert (=> b!11446 d!3886))

(declare-fun d!3888 () Bool)

(declare-fun e!7314 () Bool)

(assert (=> d!3888 e!7314))

(declare-fun res!11615 () Bool)

(assert (=> d!3888 (=> (not res!11615) (not e!7314))))

(declare-fun lt!19290 () (_ BitVec 64))

(declare-fun lt!19288 () (_ BitVec 64))

(declare-fun lt!19287 () (_ BitVec 64))

(assert (=> d!3888 (= res!11615 (= lt!19287 (bvsub lt!19290 lt!19288)))))

(assert (=> d!3888 (or (= (bvand lt!19290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19288 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19290 lt!19288) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3888 (= lt!19288 (remainingBits!0 ((_ sign_extend 32) (size!288 (buf!633 (_2!748 lt!18379)))) ((_ sign_extend 32) (currentByte!1705 (_2!748 lt!18379))) ((_ sign_extend 32) (currentBit!1700 (_2!748 lt!18379)))))))

(declare-fun lt!19291 () (_ BitVec 64))

(declare-fun lt!19289 () (_ BitVec 64))

(assert (=> d!3888 (= lt!19290 (bvmul lt!19291 lt!19289))))

(assert (=> d!3888 (or (= lt!19291 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!19289 (bvsdiv (bvmul lt!19291 lt!19289) lt!19291)))))

(assert (=> d!3888 (= lt!19289 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3888 (= lt!19291 ((_ sign_extend 32) (size!288 (buf!633 (_2!748 lt!18379)))))))

(assert (=> d!3888 (= lt!19287 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1705 (_2!748 lt!18379))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1700 (_2!748 lt!18379)))))))

(assert (=> d!3888 (invariant!0 (currentBit!1700 (_2!748 lt!18379)) (currentByte!1705 (_2!748 lt!18379)) (size!288 (buf!633 (_2!748 lt!18379))))))

(assert (=> d!3888 (= (bitIndex!0 (size!288 (buf!633 (_2!748 lt!18379))) (currentByte!1705 (_2!748 lt!18379)) (currentBit!1700 (_2!748 lt!18379))) lt!19287)))

(declare-fun b!12038 () Bool)

(declare-fun res!11616 () Bool)

(assert (=> b!12038 (=> (not res!11616) (not e!7314))))

(assert (=> b!12038 (= res!11616 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!19287))))

(declare-fun b!12039 () Bool)

(declare-fun lt!19292 () (_ BitVec 64))

(assert (=> b!12039 (= e!7314 (bvsle lt!19287 (bvmul lt!19292 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!12039 (or (= lt!19292 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!19292 #b0000000000000000000000000000000000000000000000000000000000001000) lt!19292)))))

(assert (=> b!12039 (= lt!19292 ((_ sign_extend 32) (size!288 (buf!633 (_2!748 lt!18379)))))))

(assert (= (and d!3888 res!11615) b!12038))

(assert (= (and b!12038 res!11616) b!12039))

(declare-fun m!18049 () Bool)

(assert (=> d!3888 m!18049))

(assert (=> d!3888 m!16947))

(assert (=> b!11542 d!3888))

(declare-fun d!3890 () Bool)

(declare-fun e!7315 () Bool)

(assert (=> d!3890 e!7315))

(declare-fun res!11617 () Bool)

(assert (=> d!3890 (=> (not res!11617) (not e!7315))))

(declare-fun lt!19296 () (_ BitVec 64))

(declare-fun lt!19293 () (_ BitVec 64))

(declare-fun lt!19294 () (_ BitVec 64))

(assert (=> d!3890 (= res!11617 (= lt!19293 (bvsub lt!19296 lt!19294)))))

(assert (=> d!3890 (or (= (bvand lt!19296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19294 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19296 lt!19294) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3890 (= lt!19294 (remainingBits!0 ((_ sign_extend 32) (size!288 (buf!633 (_1!747 lt!17716)))) ((_ sign_extend 32) (currentByte!1705 (_1!747 lt!17716))) ((_ sign_extend 32) (currentBit!1700 (_1!747 lt!17716)))))))

(declare-fun lt!19297 () (_ BitVec 64))

(declare-fun lt!19295 () (_ BitVec 64))

(assert (=> d!3890 (= lt!19296 (bvmul lt!19297 lt!19295))))

(assert (=> d!3890 (or (= lt!19297 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!19295 (bvsdiv (bvmul lt!19297 lt!19295) lt!19297)))))

(assert (=> d!3890 (= lt!19295 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3890 (= lt!19297 ((_ sign_extend 32) (size!288 (buf!633 (_1!747 lt!17716)))))))

(assert (=> d!3890 (= lt!19293 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1705 (_1!747 lt!17716))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1700 (_1!747 lt!17716)))))))

(assert (=> d!3890 (invariant!0 (currentBit!1700 (_1!747 lt!17716)) (currentByte!1705 (_1!747 lt!17716)) (size!288 (buf!633 (_1!747 lt!17716))))))

(assert (=> d!3890 (= (bitIndex!0 (size!288 (buf!633 (_1!747 lt!17716))) (currentByte!1705 (_1!747 lt!17716)) (currentBit!1700 (_1!747 lt!17716))) lt!19293)))

(declare-fun b!12040 () Bool)

(declare-fun res!11618 () Bool)

(assert (=> b!12040 (=> (not res!11618) (not e!7315))))

(assert (=> b!12040 (= res!11618 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!19293))))

(declare-fun b!12041 () Bool)

(declare-fun lt!19298 () (_ BitVec 64))

(assert (=> b!12041 (= e!7315 (bvsle lt!19293 (bvmul lt!19298 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!12041 (or (= lt!19298 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!19298 #b0000000000000000000000000000000000000000000000000000000000001000) lt!19298)))))

(assert (=> b!12041 (= lt!19298 ((_ sign_extend 32) (size!288 (buf!633 (_1!747 lt!17716)))))))

(assert (= (and d!3890 res!11617) b!12040))

(assert (= (and b!12040 res!11618) b!12041))

(declare-fun m!18051 () Bool)

(assert (=> d!3890 m!18051))

(declare-fun m!18053 () Bool)

(assert (=> d!3890 m!18053))

(assert (=> b!11542 d!3890))

(declare-fun d!3892 () Bool)

(declare-fun res!11620 () Bool)

(declare-fun e!7317 () Bool)

(assert (=> d!3892 (=> (not res!11620) (not e!7317))))

(assert (=> d!3892 (= res!11620 (= (size!288 (buf!633 (_1!747 lt!18260))) (size!288 (buf!633 thiss!1486))))))

(assert (=> d!3892 (= (isPrefixOf!0 (_1!747 lt!18260) thiss!1486) e!7317)))

(declare-fun b!12042 () Bool)

(declare-fun res!11621 () Bool)

(assert (=> b!12042 (=> (not res!11621) (not e!7317))))

(assert (=> b!12042 (= res!11621 (bvsle (bitIndex!0 (size!288 (buf!633 (_1!747 lt!18260))) (currentByte!1705 (_1!747 lt!18260)) (currentBit!1700 (_1!747 lt!18260))) (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486))))))

(declare-fun b!12043 () Bool)

(declare-fun e!7316 () Bool)

(assert (=> b!12043 (= e!7317 e!7316)))

(declare-fun res!11619 () Bool)

(assert (=> b!12043 (=> res!11619 e!7316)))

(assert (=> b!12043 (= res!11619 (= (size!288 (buf!633 (_1!747 lt!18260))) #b00000000000000000000000000000000))))

(declare-fun b!12044 () Bool)

(assert (=> b!12044 (= e!7316 (arrayBitRangesEq!0 (buf!633 (_1!747 lt!18260)) (buf!633 thiss!1486) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!288 (buf!633 (_1!747 lt!18260))) (currentByte!1705 (_1!747 lt!18260)) (currentBit!1700 (_1!747 lt!18260)))))))

(assert (= (and d!3892 res!11620) b!12042))

(assert (= (and b!12042 res!11621) b!12043))

(assert (= (and b!12043 (not res!11619)) b!12044))

(declare-fun m!18055 () Bool)

(assert (=> b!12042 m!18055))

(assert (=> b!12042 m!16543))

(assert (=> b!12044 m!18055))

(assert (=> b!12044 m!18055))

(declare-fun m!18057 () Bool)

(assert (=> b!12044 m!18057))

(assert (=> b!11501 d!3892))

(declare-fun d!3894 () Bool)

(declare-fun e!7318 () Bool)

(assert (=> d!3894 e!7318))

(declare-fun res!11622 () Bool)

(assert (=> d!3894 (=> (not res!11622) (not e!7318))))

(declare-fun lt!19300 () (_ BitVec 64))

(declare-fun lt!19299 () (_ BitVec 64))

(declare-fun lt!19302 () (_ BitVec 64))

(assert (=> d!3894 (= res!11622 (= lt!19299 (bvsub lt!19302 lt!19300)))))

(assert (=> d!3894 (or (= (bvand lt!19302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19300 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19302 lt!19300) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3894 (= lt!19300 (remainingBits!0 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17970)))) ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17970))) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17970)))))))

(declare-fun lt!19303 () (_ BitVec 64))

(declare-fun lt!19301 () (_ BitVec 64))

(assert (=> d!3894 (= lt!19302 (bvmul lt!19303 lt!19301))))

(assert (=> d!3894 (or (= lt!19303 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!19301 (bvsdiv (bvmul lt!19303 lt!19301) lt!19303)))))

(assert (=> d!3894 (= lt!19301 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3894 (= lt!19303 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17970)))))))

(assert (=> d!3894 (= lt!19299 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17970))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17970)))))))

(assert (=> d!3894 (invariant!0 (currentBit!1700 (_2!749 lt!17970)) (currentByte!1705 (_2!749 lt!17970)) (size!288 (buf!633 (_2!749 lt!17970))))))

(assert (=> d!3894 (= (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17970))) (currentByte!1705 (_2!749 lt!17970)) (currentBit!1700 (_2!749 lt!17970))) lt!19299)))

(declare-fun b!12045 () Bool)

(declare-fun res!11623 () Bool)

(assert (=> b!12045 (=> (not res!11623) (not e!7318))))

(assert (=> b!12045 (= res!11623 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!19299))))

(declare-fun b!12046 () Bool)

(declare-fun lt!19304 () (_ BitVec 64))

(assert (=> b!12046 (= e!7318 (bvsle lt!19299 (bvmul lt!19304 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!12046 (or (= lt!19304 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!19304 #b0000000000000000000000000000000000000000000000000000000000001000) lt!19304)))))

(assert (=> b!12046 (= lt!19304 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17970)))))))

(assert (= (and d!3894 res!11622) b!12045))

(assert (= (and b!12045 res!11623) b!12046))

(declare-fun m!18059 () Bool)

(assert (=> d!3894 m!18059))

(assert (=> d!3894 m!16643))

(assert (=> d!3476 d!3894))

(assert (=> d!3476 d!3544))

(declare-fun d!3896 () Bool)

(declare-fun res!11625 () Bool)

(declare-fun e!7320 () Bool)

(assert (=> d!3896 (=> (not res!11625) (not e!7320))))

(assert (=> d!3896 (= res!11625 (= (size!288 (buf!633 thiss!1486)) (size!288 (buf!633 thiss!1486))))))

(assert (=> d!3896 (= (isPrefixOf!0 thiss!1486 thiss!1486) e!7320)))

(declare-fun b!12047 () Bool)

(declare-fun res!11626 () Bool)

(assert (=> b!12047 (=> (not res!11626) (not e!7320))))

(assert (=> b!12047 (= res!11626 (bvsle (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)) (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486))))))

(declare-fun b!12048 () Bool)

(declare-fun e!7319 () Bool)

(assert (=> b!12048 (= e!7320 e!7319)))

(declare-fun res!11624 () Bool)

(assert (=> b!12048 (=> res!11624 e!7319)))

(assert (=> b!12048 (= res!11624 (= (size!288 (buf!633 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!12049 () Bool)

(assert (=> b!12049 (= e!7319 (arrayBitRangesEq!0 (buf!633 thiss!1486) (buf!633 thiss!1486) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486))))))

(assert (= (and d!3896 res!11625) b!12047))

(assert (= (and b!12047 res!11626) b!12048))

(assert (= (and b!12048 (not res!11624)) b!12049))

(assert (=> b!12047 m!16543))

(assert (=> b!12047 m!16543))

(assert (=> b!12049 m!16543))

(assert (=> b!12049 m!16543))

(declare-fun m!18061 () Bool)

(assert (=> b!12049 m!18061))

(assert (=> d!3476 d!3896))

(declare-fun d!3898 () Bool)

(assert (=> d!3898 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lt!19307 () Unit!972)

(declare-fun choose!11 (BitStream!542) Unit!972)

(assert (=> d!3898 (= lt!19307 (choose!11 thiss!1486))))

(assert (=> d!3898 (= (lemmaIsPrefixRefl!0 thiss!1486) lt!19307)))

(declare-fun bs!1092 () Bool)

(assert (= bs!1092 d!3898))

(assert (=> bs!1092 m!16637))

(declare-fun m!18063 () Bool)

(assert (=> bs!1092 m!18063))

(assert (=> d!3476 d!3898))

(declare-fun d!3900 () Bool)

(declare-fun res!11628 () Bool)

(declare-fun e!7322 () Bool)

(assert (=> d!3900 (=> (not res!11628) (not e!7322))))

(assert (=> d!3900 (= res!11628 (= (size!288 (buf!633 (_2!747 lt!18260))) (size!288 (buf!633 (_2!749 lt!17717)))))))

(assert (=> d!3900 (= (isPrefixOf!0 (_2!747 lt!18260) (_2!749 lt!17717)) e!7322)))

(declare-fun b!12050 () Bool)

(declare-fun res!11629 () Bool)

(assert (=> b!12050 (=> (not res!11629) (not e!7322))))

(assert (=> b!12050 (= res!11629 (bvsle (bitIndex!0 (size!288 (buf!633 (_2!747 lt!18260))) (currentByte!1705 (_2!747 lt!18260)) (currentBit!1700 (_2!747 lt!18260))) (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17717))) (currentByte!1705 (_2!749 lt!17717)) (currentBit!1700 (_2!749 lt!17717)))))))

(declare-fun b!12051 () Bool)

(declare-fun e!7321 () Bool)

(assert (=> b!12051 (= e!7322 e!7321)))

(declare-fun res!11627 () Bool)

(assert (=> b!12051 (=> res!11627 e!7321)))

(assert (=> b!12051 (= res!11627 (= (size!288 (buf!633 (_2!747 lt!18260))) #b00000000000000000000000000000000))))

(declare-fun b!12052 () Bool)

(assert (=> b!12052 (= e!7321 (arrayBitRangesEq!0 (buf!633 (_2!747 lt!18260)) (buf!633 (_2!749 lt!17717)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!288 (buf!633 (_2!747 lt!18260))) (currentByte!1705 (_2!747 lt!18260)) (currentBit!1700 (_2!747 lt!18260)))))))

(assert (= (and d!3900 res!11628) b!12050))

(assert (= (and b!12050 res!11629) b!12051))

(assert (= (and b!12051 (not res!11627)) b!12052))

(declare-fun m!18065 () Bool)

(assert (=> b!12050 m!18065))

(assert (=> b!12050 m!16541))

(assert (=> b!12052 m!18065))

(assert (=> b!12052 m!18065))

(declare-fun m!18067 () Bool)

(assert (=> b!12052 m!18067))

(assert (=> b!11498 d!3900))

(declare-fun d!3902 () Bool)

(declare-fun res!11630 () Bool)

(declare-fun e!7323 () Bool)

(assert (=> d!3902 (=> res!11630 e!7323)))

(assert (=> d!3902 (= res!11630 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3902 (= (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!748 (readBits!0 (_1!747 call!209) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)) e!7323)))

(declare-fun b!12053 () Bool)

(declare-fun e!7324 () Bool)

(assert (=> b!12053 (= e!7323 e!7324)))

(declare-fun res!11631 () Bool)

(assert (=> b!12053 (=> (not res!11631) (not e!7324))))

(assert (=> b!12053 (= res!11631 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!708 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!708 (_1!748 (readBits!0 (_1!747 call!209) (bvsub (bvadd from!367 nBits!460) from!367)))) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!12054 () Bool)

(assert (=> b!12054 (= e!7324 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!748 (readBits!0 (_1!747 call!209) (bvsub (bvadd from!367 nBits!460) from!367))) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!3902 (not res!11630)) b!12053))

(assert (= (and b!12053 res!11631) b!12054))

(assert (=> b!12053 m!16659))

(assert (=> b!12053 m!16971))

(declare-fun m!18069 () Bool)

(assert (=> b!12053 m!18069))

(assert (=> b!12053 m!16731))

(declare-fun m!18071 () Bool)

(assert (=> b!12054 m!18071))

(assert (=> b!11427 d!3902))

(declare-fun b!12056 () Bool)

(declare-fun res!11632 () Bool)

(declare-fun e!7325 () Bool)

(assert (=> b!12056 (=> (not res!11632) (not e!7325))))

(declare-fun lt!19315 () tuple2!1404)

(assert (=> b!12056 (= res!11632 (bvsle (currentByte!1705 (_1!747 call!209)) (currentByte!1705 (_2!748 lt!19315))))))

(declare-fun b!12057 () Bool)

(assert (=> b!12057 (= e!7325 (= (byteArrayBitContentToList!0 (_2!748 lt!19315) (_1!748 lt!19315) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)) (bitStreamReadBitsIntoList!0 (_2!748 lt!19315) (_1!747 call!209) (bvsub (bvadd from!367 nBits!460) from!367))))))

(declare-fun b!12058 () Bool)

(declare-fun res!11633 () Bool)

(assert (=> b!12058 (=> (not res!11633) (not e!7325))))

(assert (=> b!12058 (= res!11633 (invariant!0 (currentBit!1700 (_2!748 lt!19315)) (currentByte!1705 (_2!748 lt!19315)) (size!288 (buf!633 (_2!748 lt!19315)))))))

(declare-fun b!12059 () Bool)

(declare-fun res!11635 () Bool)

(assert (=> b!12059 (=> (not res!11635) (not e!7325))))

(declare-fun lt!19311 () (_ BitVec 64))

(assert (=> b!12059 (= res!11635 (= (size!288 (_1!748 lt!19315)) ((_ extract 31 0) lt!19311)))))

(assert (=> b!12059 (and (bvslt lt!19311 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!19311 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!19314 () (_ BitVec 64))

(declare-fun lt!19308 () (_ BitVec 64))

(assert (=> b!12059 (= lt!19311 (bvsdiv lt!19314 lt!19308))))

(assert (=> b!12059 (and (not (= lt!19308 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!19314 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!19308 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!12059 (= lt!19308 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!19310 () (_ BitVec 64))

(declare-fun lt!19313 () (_ BitVec 64))

(assert (=> b!12059 (= lt!19314 (bvsub lt!19310 lt!19313))))

(assert (=> b!12059 (or (= (bvand lt!19310 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19313 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19310 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19310 lt!19313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12059 (= lt!19313 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!19309 () (_ BitVec 64))

(assert (=> b!12059 (= lt!19310 (bvadd (bvsub (bvadd from!367 nBits!460) from!367) lt!19309))))

(assert (=> b!12059 (or (not (= (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19309 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub (bvadd from!367 nBits!460) from!367) lt!19309) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12059 (= lt!19309 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!12055 () Bool)

(declare-fun res!11634 () Bool)

(assert (=> b!12055 (=> (not res!11634) (not e!7325))))

(declare-fun lt!19312 () (_ BitVec 64))

(assert (=> b!12055 (= res!11634 (= (bvadd lt!19312 (bvsub (bvadd from!367 nBits!460) from!367)) (bitIndex!0 (size!288 (buf!633 (_2!748 lt!19315))) (currentByte!1705 (_2!748 lt!19315)) (currentBit!1700 (_2!748 lt!19315)))))))

(assert (=> b!12055 (or (not (= (bvand lt!19312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!19312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!19312 (bvsub (bvadd from!367 nBits!460) from!367)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12055 (= lt!19312 (bitIndex!0 (size!288 (buf!633 (_1!747 call!209))) (currentByte!1705 (_1!747 call!209)) (currentBit!1700 (_1!747 call!209))))))

(declare-fun d!3904 () Bool)

(assert (=> d!3904 e!7325))

(declare-fun res!11636 () Bool)

(assert (=> d!3904 (=> (not res!11636) (not e!7325))))

(assert (=> d!3904 (= res!11636 (= (buf!633 (_2!748 lt!19315)) (buf!633 (_1!747 call!209))))))

(declare-fun lt!19316 () tuple3!90)

(assert (=> d!3904 (= lt!19315 (tuple2!1405 (_3!48 lt!19316) (_2!756 lt!19316)))))

(assert (=> d!3904 (= lt!19316 (readBitsLoop!0 (_1!747 call!209) (bvsub (bvadd from!367 nBits!460) from!367) (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)))))

(assert (=> d!3904 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)) (bvsle (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!3904 (= (readBits!0 (_1!747 call!209) (bvsub (bvadd from!367 nBits!460) from!367)) lt!19315)))

(assert (= (and d!3904 res!11636) b!12055))

(assert (= (and b!12055 res!11634) b!12058))

(assert (= (and b!12058 res!11633) b!12059))

(assert (= (and b!12059 res!11635) b!12056))

(assert (= (and b!12056 res!11632) b!12057))

(declare-fun m!18073 () Bool)

(assert (=> b!12057 m!18073))

(declare-fun m!18075 () Bool)

(assert (=> b!12057 m!18075))

(declare-fun m!18077 () Bool)

(assert (=> b!12058 m!18077))

(declare-fun m!18079 () Bool)

(assert (=> b!12055 m!18079))

(declare-fun m!18081 () Bool)

(assert (=> b!12055 m!18081))

(declare-fun m!18083 () Bool)

(assert (=> d!3904 m!18083))

(assert (=> b!11427 d!3904))

(declare-fun d!3906 () Bool)

(declare-fun c!883 () Bool)

(assert (=> d!3906 (= c!883 (= (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7326 () List!167)

(assert (=> d!3906 (= (byteArrayBitContentToList!0 (_2!749 lt!17717) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)) e!7326)))

(declare-fun b!12060 () Bool)

(assert (=> b!12060 (= e!7326 Nil!164)))

(declare-fun b!12061 () Bool)

(assert (=> b!12061 (= e!7326 (Cons!163 (not (= (bvand ((_ sign_extend 24) (select (arr!708 srcBuffer!6) ((_ extract 31 0) (bvsdiv (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!749 lt!17717) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3906 c!883) b!12060))

(assert (= (and d!3906 (not c!883)) b!12061))

(declare-fun m!18085 () Bool)

(assert (=> b!12061 m!18085))

(declare-fun m!18087 () Bool)

(assert (=> b!12061 m!18087))

(declare-fun m!18089 () Bool)

(assert (=> b!12061 m!18089))

(assert (=> b!11555 d!3906))

(declare-fun b!12062 () Bool)

(declare-fun e!7328 () tuple2!1412)

(assert (=> b!12062 (= e!7328 (tuple2!1413 Nil!164 (_1!747 lt!17945)))))

(declare-fun b!12065 () Bool)

(declare-fun e!7327 () Bool)

(declare-fun lt!19318 () List!167)

(assert (=> b!12065 (= e!7327 (> (length!33 lt!19318) 0))))

(declare-fun b!12064 () Bool)

(assert (=> b!12064 (= e!7327 (isEmpty!38 lt!19318))))

(declare-fun lt!19317 () tuple2!1414)

(declare-fun lt!19319 () (_ BitVec 64))

(declare-fun b!12063 () Bool)

(assert (=> b!12063 (= e!7328 (tuple2!1413 (Cons!163 (_1!754 lt!19317) (bitStreamReadBitsIntoList!0 (_2!749 lt!17961) (_2!754 lt!19317) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) lt!19319))) (_2!754 lt!19317)))))

(assert (=> b!12063 (= lt!19317 (readBit!0 (_1!747 lt!17945)))))

(assert (=> b!12063 (= lt!19319 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!3908 () Bool)

(assert (=> d!3908 e!7327))

(declare-fun c!885 () Bool)

(assert (=> d!3908 (= c!885 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3908 (= lt!19318 (_1!753 e!7328))))

(declare-fun c!884 () Bool)

(assert (=> d!3908 (= c!884 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3908 (bvsge (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3908 (= (bitStreamReadBitsIntoList!0 (_2!749 lt!17961) (_1!747 lt!17945) (bvsub (bvadd from!367 nBits!460) from!367)) lt!19318)))

(assert (= (and d!3908 c!884) b!12062))

(assert (= (and d!3908 (not c!884)) b!12063))

(assert (= (and d!3908 c!885) b!12064))

(assert (= (and d!3908 (not c!885)) b!12065))

(declare-fun m!18091 () Bool)

(assert (=> b!12065 m!18091))

(declare-fun m!18093 () Bool)

(assert (=> b!12064 m!18093))

(declare-fun m!18095 () Bool)

(assert (=> b!12063 m!18095))

(declare-fun m!18097 () Bool)

(assert (=> b!12063 m!18097))

(assert (=> b!11428 d!3908))

(declare-fun d!3910 () Bool)

(assert (=> d!3910 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17953)))) ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17953))) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17953))) (bvsub lt!17941 lt!17933)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17953)))) ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17953))) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17953)))) (bvsub lt!17941 lt!17933)))))

(declare-fun bs!1093 () Bool)

(assert (= bs!1093 d!3910))

(declare-fun m!18099 () Bool)

(assert (=> bs!1093 m!18099))

(assert (=> b!11428 d!3910))

(declare-fun b!12066 () Bool)

(declare-fun e!7330 () tuple2!1412)

(assert (=> b!12066 (= e!7330 (tuple2!1413 Nil!164 (_1!747 lt!17960)))))

(declare-fun b!12069 () Bool)

(declare-fun e!7329 () Bool)

(declare-fun lt!19321 () List!167)

(assert (=> b!12069 (= e!7329 (> (length!33 lt!19321) 0))))

(declare-fun b!12068 () Bool)

(assert (=> b!12068 (= e!7329 (isEmpty!38 lt!19321))))

(declare-fun lt!19320 () tuple2!1414)

(declare-fun lt!19322 () (_ BitVec 64))

(declare-fun b!12067 () Bool)

(assert (=> b!12067 (= e!7330 (tuple2!1413 (Cons!163 (_1!754 lt!19320) (bitStreamReadBitsIntoList!0 (_2!749 lt!17961) (_2!754 lt!19320) (bvsub (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) lt!19322))) (_2!754 lt!19320)))))

(assert (=> b!12067 (= lt!19320 (readBit!0 (_1!747 lt!17960)))))

(assert (=> b!12067 (= lt!19322 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!3912 () Bool)

(assert (=> d!3912 e!7329))

(declare-fun c!887 () Bool)

(assert (=> d!3912 (= c!887 (= (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3912 (= lt!19321 (_1!753 e!7330))))

(declare-fun c!886 () Bool)

(assert (=> d!3912 (= c!886 (= (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3912 (bvsge (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3912 (= (bitStreamReadBitsIntoList!0 (_2!749 lt!17961) (_1!747 lt!17960) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)) lt!19321)))

(assert (= (and d!3912 c!886) b!12066))

(assert (= (and d!3912 (not c!886)) b!12067))

(assert (= (and d!3912 c!887) b!12068))

(assert (= (and d!3912 (not c!887)) b!12069))

(declare-fun m!18101 () Bool)

(assert (=> b!12069 m!18101))

(declare-fun m!18103 () Bool)

(assert (=> b!12068 m!18103))

(declare-fun m!18105 () Bool)

(assert (=> b!12067 m!18105))

(declare-fun m!18107 () Bool)

(assert (=> b!12067 m!18107))

(assert (=> b!11428 d!3912))

(declare-fun d!3914 () Bool)

(declare-fun c!888 () Bool)

(assert (=> d!3914 (= c!888 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7331 () List!167)

(assert (=> d!3914 (= (byteArrayBitContentToList!0 (_2!749 lt!17953) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001) e!7331)))

(declare-fun b!12070 () Bool)

(assert (=> b!12070 (= e!7331 Nil!164)))

(declare-fun b!12071 () Bool)

(assert (=> b!12071 (= e!7331 (Cons!163 (not (= (bvand ((_ sign_extend 24) (select (arr!708 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!749 lt!17953) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3914 c!888) b!12070))

(assert (= (and d!3914 (not c!888)) b!12071))

(assert (=> b!12071 m!16659))

(assert (=> b!12071 m!16971))

(declare-fun m!18109 () Bool)

(assert (=> b!12071 m!18109))

(assert (=> b!11428 d!3914))

(declare-fun d!3916 () Bool)

(assert (=> d!3916 (= (tail!70 lt!17939) (t!917 lt!17939))))

(assert (=> b!11428 d!3916))

(declare-fun d!3918 () Bool)

(assert (=> d!3918 (= (head!62 (byteArrayBitContentToList!0 (_2!749 lt!17953) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!282 (byteArrayBitContentToList!0 (_2!749 lt!17953) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!11428 d!3918))

(declare-fun d!3920 () Bool)

(declare-fun e!7332 () Bool)

(assert (=> d!3920 e!7332))

(declare-fun res!11639 () Bool)

(assert (=> d!3920 (=> (not res!11639) (not e!7332))))

(declare-fun lt!19335 () tuple2!1402)

(assert (=> d!3920 (= res!11639 (isPrefixOf!0 (_1!747 lt!19335) (_2!747 lt!19335)))))

(declare-fun lt!19330 () BitStream!542)

(assert (=> d!3920 (= lt!19335 (tuple2!1403 lt!19330 (_2!749 lt!17961)))))

(declare-fun lt!19333 () Unit!972)

(declare-fun lt!19328 () Unit!972)

(assert (=> d!3920 (= lt!19333 lt!19328)))

(assert (=> d!3920 (isPrefixOf!0 lt!19330 (_2!749 lt!17961))))

(assert (=> d!3920 (= lt!19328 (lemmaIsPrefixTransitive!0 lt!19330 (_2!749 lt!17961) (_2!749 lt!17961)))))

(declare-fun lt!19340 () Unit!972)

(declare-fun lt!19339 () Unit!972)

(assert (=> d!3920 (= lt!19340 lt!19339)))

(assert (=> d!3920 (isPrefixOf!0 lt!19330 (_2!749 lt!17961))))

(assert (=> d!3920 (= lt!19339 (lemmaIsPrefixTransitive!0 lt!19330 (_2!749 lt!17953) (_2!749 lt!17961)))))

(declare-fun lt!19329 () Unit!972)

(declare-fun e!7333 () Unit!972)

(assert (=> d!3920 (= lt!19329 e!7333)))

(declare-fun c!889 () Bool)

(assert (=> d!3920 (= c!889 (not (= (size!288 (buf!633 (_2!749 lt!17953))) #b00000000000000000000000000000000)))))

(declare-fun lt!19324 () Unit!972)

(declare-fun lt!19336 () Unit!972)

(assert (=> d!3920 (= lt!19324 lt!19336)))

(assert (=> d!3920 (isPrefixOf!0 (_2!749 lt!17961) (_2!749 lt!17961))))

(assert (=> d!3920 (= lt!19336 (lemmaIsPrefixRefl!0 (_2!749 lt!17961)))))

(declare-fun lt!19327 () Unit!972)

(declare-fun lt!19325 () Unit!972)

(assert (=> d!3920 (= lt!19327 lt!19325)))

(assert (=> d!3920 (= lt!19325 (lemmaIsPrefixRefl!0 (_2!749 lt!17961)))))

(declare-fun lt!19332 () Unit!972)

(declare-fun lt!19341 () Unit!972)

(assert (=> d!3920 (= lt!19332 lt!19341)))

(assert (=> d!3920 (isPrefixOf!0 lt!19330 lt!19330)))

(assert (=> d!3920 (= lt!19341 (lemmaIsPrefixRefl!0 lt!19330))))

(declare-fun lt!19323 () Unit!972)

(declare-fun lt!19342 () Unit!972)

(assert (=> d!3920 (= lt!19323 lt!19342)))

(assert (=> d!3920 (isPrefixOf!0 (_2!749 lt!17953) (_2!749 lt!17953))))

(assert (=> d!3920 (= lt!19342 (lemmaIsPrefixRefl!0 (_2!749 lt!17953)))))

(assert (=> d!3920 (= lt!19330 (BitStream!543 (buf!633 (_2!749 lt!17961)) (currentByte!1705 (_2!749 lt!17953)) (currentBit!1700 (_2!749 lt!17953))))))

(assert (=> d!3920 (isPrefixOf!0 (_2!749 lt!17953) (_2!749 lt!17961))))

(assert (=> d!3920 (= (reader!0 (_2!749 lt!17953) (_2!749 lt!17961)) lt!19335)))

(declare-fun b!12072 () Bool)

(declare-fun lt!19338 () (_ BitVec 64))

(declare-fun lt!19326 () (_ BitVec 64))

(assert (=> b!12072 (= e!7332 (= (_1!747 lt!19335) (withMovedBitIndex!0 (_2!747 lt!19335) (bvsub lt!19326 lt!19338))))))

(assert (=> b!12072 (or (= (bvand lt!19326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19338 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19326 lt!19338) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12072 (= lt!19338 (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17961))) (currentByte!1705 (_2!749 lt!17961)) (currentBit!1700 (_2!749 lt!17961))))))

(assert (=> b!12072 (= lt!19326 (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17953))) (currentByte!1705 (_2!749 lt!17953)) (currentBit!1700 (_2!749 lt!17953))))))

(declare-fun b!12073 () Bool)

(declare-fun res!11638 () Bool)

(assert (=> b!12073 (=> (not res!11638) (not e!7332))))

(assert (=> b!12073 (= res!11638 (isPrefixOf!0 (_2!747 lt!19335) (_2!749 lt!17961)))))

(declare-fun b!12074 () Bool)

(declare-fun Unit!1028 () Unit!972)

(assert (=> b!12074 (= e!7333 Unit!1028)))

(declare-fun b!12075 () Bool)

(declare-fun lt!19331 () Unit!972)

(assert (=> b!12075 (= e!7333 lt!19331)))

(declare-fun lt!19334 () (_ BitVec 64))

(assert (=> b!12075 (= lt!19334 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19337 () (_ BitVec 64))

(assert (=> b!12075 (= lt!19337 (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17953))) (currentByte!1705 (_2!749 lt!17953)) (currentBit!1700 (_2!749 lt!17953))))))

(assert (=> b!12075 (= lt!19331 (arrayBitRangesEqSymmetric!0 (buf!633 (_2!749 lt!17953)) (buf!633 (_2!749 lt!17961)) lt!19334 lt!19337))))

(assert (=> b!12075 (arrayBitRangesEq!0 (buf!633 (_2!749 lt!17961)) (buf!633 (_2!749 lt!17953)) lt!19334 lt!19337)))

(declare-fun b!12076 () Bool)

(declare-fun res!11637 () Bool)

(assert (=> b!12076 (=> (not res!11637) (not e!7332))))

(assert (=> b!12076 (= res!11637 (isPrefixOf!0 (_1!747 lt!19335) (_2!749 lt!17953)))))

(assert (= (and d!3920 c!889) b!12075))

(assert (= (and d!3920 (not c!889)) b!12074))

(assert (= (and d!3920 res!11639) b!12076))

(assert (= (and b!12076 res!11637) b!12073))

(assert (= (and b!12073 res!11638) b!12072))

(declare-fun m!18111 () Bool)

(assert (=> d!3920 m!18111))

(declare-fun m!18113 () Bool)

(assert (=> d!3920 m!18113))

(declare-fun m!18115 () Bool)

(assert (=> d!3920 m!18115))

(declare-fun m!18117 () Bool)

(assert (=> d!3920 m!18117))

(declare-fun m!18119 () Bool)

(assert (=> d!3920 m!18119))

(declare-fun m!18121 () Bool)

(assert (=> d!3920 m!18121))

(declare-fun m!18123 () Bool)

(assert (=> d!3920 m!18123))

(declare-fun m!18125 () Bool)

(assert (=> d!3920 m!18125))

(declare-fun m!18127 () Bool)

(assert (=> d!3920 m!18127))

(declare-fun m!18129 () Bool)

(assert (=> d!3920 m!18129))

(declare-fun m!18131 () Bool)

(assert (=> d!3920 m!18131))

(declare-fun m!18133 () Bool)

(assert (=> b!12076 m!18133))

(declare-fun m!18135 () Bool)

(assert (=> b!12073 m!18135))

(declare-fun m!18137 () Bool)

(assert (=> b!12072 m!18137))

(assert (=> b!12072 m!16707))

(assert (=> b!12072 m!16675))

(assert (=> b!12075 m!16675))

(declare-fun m!18139 () Bool)

(assert (=> b!12075 m!18139))

(declare-fun m!18141 () Bool)

(assert (=> b!12075 m!18141))

(assert (=> b!11428 d!3920))

(declare-fun d!3922 () Bool)

(assert (=> d!3922 (= (bitAt!0 (buf!633 (_2!749 lt!17953)) lt!17938) (not (= (bvand ((_ sign_extend 24) (select (arr!708 (buf!633 (_2!749 lt!17953))) ((_ extract 31 0) (bvsdiv lt!17938 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!17938 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!1094 () Bool)

(assert (= bs!1094 d!3922))

(declare-fun m!18143 () Bool)

(assert (=> bs!1094 m!18143))

(declare-fun m!18145 () Bool)

(assert (=> bs!1094 m!18145))

(assert (=> b!11428 d!3922))

(declare-fun d!3924 () Bool)

(assert (=> d!3924 (= (bitAt!0 (buf!633 (_2!749 lt!17953)) lt!17938) (bitAt!0 (buf!633 (_2!749 lt!17961)) lt!17938))))

(declare-fun lt!19345 () Unit!972)

(declare-fun choose!31 (array!667 array!667 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!972)

(assert (=> d!3924 (= lt!19345 (choose!31 (buf!633 (_2!749 lt!17953)) (buf!633 (_2!749 lt!17961)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!17938 (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17953))) (currentByte!1705 (_2!749 lt!17953)) (currentBit!1700 (_2!749 lt!17953)))))))

(assert (=> d!3924 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17953))) (currentByte!1705 (_2!749 lt!17953)) (currentBit!1700 (_2!749 lt!17953)))))))

(assert (=> d!3924 (= (arrayBitRangesEqImpliesEq!0 (buf!633 (_2!749 lt!17953)) (buf!633 (_2!749 lt!17961)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!17938 (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17953))) (currentByte!1705 (_2!749 lt!17953)) (currentBit!1700 (_2!749 lt!17953)))) lt!19345)))

(declare-fun bs!1095 () Bool)

(assert (= bs!1095 d!3924))

(assert (=> bs!1095 m!16665))

(assert (=> bs!1095 m!16687))

(assert (=> bs!1095 m!16675))

(declare-fun m!18147 () Bool)

(assert (=> bs!1095 m!18147))

(assert (=> b!11428 d!3924))

(declare-fun d!3926 () Bool)

(assert (=> d!3926 (= (bitAt!0 (buf!633 (_2!749 lt!17961)) lt!17938) (not (= (bvand ((_ sign_extend 24) (select (arr!708 (buf!633 (_2!749 lt!17961))) ((_ extract 31 0) (bvsdiv lt!17938 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!17938 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!1096 () Bool)

(assert (= bs!1096 d!3926))

(declare-fun m!18149 () Bool)

(assert (=> bs!1096 m!18149))

(assert (=> bs!1096 m!18145))

(assert (=> b!11428 d!3926))

(declare-fun b!12094 () Bool)

(declare-fun res!11662 () Bool)

(declare-fun e!7342 () Bool)

(assert (=> b!12094 (=> (not res!11662) (not e!7342))))

(declare-fun lt!19376 () tuple2!1406)

(assert (=> b!12094 (= res!11662 (isPrefixOf!0 thiss!1486 (_2!749 lt!19376)))))

(declare-fun d!3928 () Bool)

(declare-fun e!7344 () Bool)

(assert (=> d!3928 e!7344))

(declare-fun res!11660 () Bool)

(assert (=> d!3928 (=> (not res!11660) (not e!7344))))

(declare-fun lt!19371 () tuple2!1406)

(assert (=> d!3928 (= res!11660 (= (size!288 (buf!633 (_2!749 lt!19371))) (size!288 (buf!633 thiss!1486))))))

(declare-fun lt!19379 () (_ BitVec 8))

(declare-fun lt!19372 () array!667)

(assert (=> d!3928 (= lt!19379 (select (arr!708 lt!19372) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!3928 (and (bvsge ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!288 lt!19372)))))

(assert (=> d!3928 (= lt!19372 (array!668 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!19381 () tuple2!1406)

(assert (=> d!3928 (= lt!19371 (tuple2!1407 (_1!749 lt!19381) (_2!749 lt!19381)))))

(assert (=> d!3928 (= lt!19381 lt!19376)))

(assert (=> d!3928 e!7342))

(declare-fun res!11656 () Bool)

(assert (=> d!3928 (=> (not res!11656) (not e!7342))))

(assert (=> d!3928 (= res!11656 (= (size!288 (buf!633 thiss!1486)) (size!288 (buf!633 (_2!749 lt!19376)))))))

(declare-fun lt!19380 () Bool)

(declare-fun appendBit!0 (BitStream!542 Bool) tuple2!1406)

(assert (=> d!3928 (= lt!19376 (appendBit!0 thiss!1486 lt!19380))))

(assert (=> d!3928 (= lt!19380 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!708 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!3928 (and (bvsge ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!3928 (= (appendBitFromByte!0 thiss!1486 (select (arr!708 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!19371)))

(declare-fun b!12095 () Bool)

(declare-fun e!7343 () Bool)

(declare-datatypes ((tuple2!1424 0))(
  ( (tuple2!1425 (_1!763 BitStream!542) (_2!763 Bool)) )
))
(declare-fun lt!19375 () tuple2!1424)

(assert (=> b!12095 (= e!7343 (= (bitIndex!0 (size!288 (buf!633 (_1!763 lt!19375))) (currentByte!1705 (_1!763 lt!19375)) (currentBit!1700 (_1!763 lt!19375))) (bitIndex!0 (size!288 (buf!633 (_2!749 lt!19376))) (currentByte!1705 (_2!749 lt!19376)) (currentBit!1700 (_2!749 lt!19376)))))))

(declare-fun b!12096 () Bool)

(declare-fun res!11657 () Bool)

(assert (=> b!12096 (=> (not res!11657) (not e!7342))))

(assert (=> b!12096 (= res!11657 (= (bitIndex!0 (size!288 (buf!633 (_2!749 lt!19376))) (currentByte!1705 (_2!749 lt!19376)) (currentBit!1700 (_2!749 lt!19376))) (bvadd (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!12097 () Bool)

(declare-fun e!7345 () Bool)

(assert (=> b!12097 (= e!7344 e!7345)))

(declare-fun res!11659 () Bool)

(assert (=> b!12097 (=> (not res!11659) (not e!7345))))

(declare-fun lt!19374 () tuple2!1424)

(assert (=> b!12097 (= res!11659 (and (= (_2!763 lt!19374) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!708 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!19379)) #b00000000000000000000000000000000))) (= (_1!763 lt!19374) (_2!749 lt!19371))))))

(declare-fun lt!19378 () tuple2!1404)

(declare-fun lt!19377 () BitStream!542)

(assert (=> b!12097 (= lt!19378 (readBits!0 lt!19377 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!542) tuple2!1424)

(assert (=> b!12097 (= lt!19374 (readBitPure!0 lt!19377))))

(declare-fun readerFrom!0 (BitStream!542 (_ BitVec 32) (_ BitVec 32)) BitStream!542)

(assert (=> b!12097 (= lt!19377 (readerFrom!0 (_2!749 lt!19371) (currentBit!1700 thiss!1486) (currentByte!1705 thiss!1486)))))

(declare-fun b!12098 () Bool)

(assert (=> b!12098 (= e!7342 e!7343)))

(declare-fun res!11658 () Bool)

(assert (=> b!12098 (=> (not res!11658) (not e!7343))))

(assert (=> b!12098 (= res!11658 (and (= (_2!763 lt!19375) lt!19380) (= (_1!763 lt!19375) (_2!749 lt!19376))))))

(assert (=> b!12098 (= lt!19375 (readBitPure!0 (readerFrom!0 (_2!749 lt!19376) (currentBit!1700 thiss!1486) (currentByte!1705 thiss!1486))))))

(declare-fun b!12099 () Bool)

(declare-fun res!11663 () Bool)

(assert (=> b!12099 (=> (not res!11663) (not e!7344))))

(declare-fun lt!19373 () (_ BitVec 64))

(declare-fun lt!19370 () (_ BitVec 64))

(assert (=> b!12099 (= res!11663 (= (bitIndex!0 (size!288 (buf!633 (_2!749 lt!19371))) (currentByte!1705 (_2!749 lt!19371)) (currentBit!1700 (_2!749 lt!19371))) (bvadd lt!19373 lt!19370)))))

(assert (=> b!12099 (or (not (= (bvand lt!19373 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19370 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!19373 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!19373 lt!19370) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12099 (= lt!19370 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!12099 (= lt!19373 (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)))))

(declare-fun b!12100 () Bool)

(assert (=> b!12100 (= e!7345 (= (bitIndex!0 (size!288 (buf!633 (_1!763 lt!19374))) (currentByte!1705 (_1!763 lt!19374)) (currentBit!1700 (_1!763 lt!19374))) (bitIndex!0 (size!288 (buf!633 (_2!749 lt!19371))) (currentByte!1705 (_2!749 lt!19371)) (currentBit!1700 (_2!749 lt!19371)))))))

(declare-fun b!12101 () Bool)

(declare-fun res!11661 () Bool)

(assert (=> b!12101 (=> (not res!11661) (not e!7344))))

(assert (=> b!12101 (= res!11661 (isPrefixOf!0 thiss!1486 (_2!749 lt!19371)))))

(assert (= (and d!3928 res!11656) b!12096))

(assert (= (and b!12096 res!11657) b!12094))

(assert (= (and b!12094 res!11662) b!12098))

(assert (= (and b!12098 res!11658) b!12095))

(assert (= (and d!3928 res!11660) b!12099))

(assert (= (and b!12099 res!11663) b!12101))

(assert (= (and b!12101 res!11661) b!12097))

(assert (= (and b!12097 res!11659) b!12100))

(declare-fun m!18151 () Bool)

(assert (=> b!12094 m!18151))

(declare-fun m!18153 () Bool)

(assert (=> b!12097 m!18153))

(declare-fun m!18155 () Bool)

(assert (=> b!12097 m!18155))

(declare-fun m!18157 () Bool)

(assert (=> b!12097 m!18157))

(declare-fun m!18159 () Bool)

(assert (=> b!12101 m!18159))

(declare-fun m!18161 () Bool)

(assert (=> b!12095 m!18161))

(declare-fun m!18163 () Bool)

(assert (=> b!12095 m!18163))

(declare-fun m!18165 () Bool)

(assert (=> b!12098 m!18165))

(assert (=> b!12098 m!18165))

(declare-fun m!18167 () Bool)

(assert (=> b!12098 m!18167))

(declare-fun m!18169 () Bool)

(assert (=> b!12100 m!18169))

(declare-fun m!18171 () Bool)

(assert (=> b!12100 m!18171))

(declare-fun m!18173 () Bool)

(assert (=> d!3928 m!18173))

(declare-fun m!18175 () Bool)

(assert (=> d!3928 m!18175))

(assert (=> d!3928 m!16971))

(assert (=> b!12099 m!18171))

(assert (=> b!12099 m!16543))

(assert (=> b!12096 m!18163))

(assert (=> b!12096 m!16543))

(assert (=> b!11428 d!3928))

(declare-fun d!3930 () Bool)

(assert (=> d!3930 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17961)))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486)) lt!17954) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17961)))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486))) lt!17954))))

(declare-fun bs!1097 () Bool)

(assert (= bs!1097 d!3930))

(declare-fun m!18177 () Bool)

(assert (=> bs!1097 m!18177))

(assert (=> b!11428 d!3930))

(declare-fun b!12102 () Bool)

(declare-fun e!7347 () tuple2!1412)

(assert (=> b!12102 (= e!7347 (tuple2!1413 Nil!164 (_1!747 lt!17960)))))

(declare-fun b!12105 () Bool)

(declare-fun e!7346 () Bool)

(declare-fun lt!19383 () List!167)

(assert (=> b!12105 (= e!7346 (> (length!33 lt!19383) 0))))

(declare-fun b!12104 () Bool)

(assert (=> b!12104 (= e!7346 (isEmpty!38 lt!19383))))

(declare-fun b!12103 () Bool)

(declare-fun lt!19384 () (_ BitVec 64))

(declare-fun lt!19382 () tuple2!1414)

(assert (=> b!12103 (= e!7347 (tuple2!1413 (Cons!163 (_1!754 lt!19382) (bitStreamReadBitsIntoList!0 (_2!749 lt!17961) (_2!754 lt!19382) (bvsub (bvsub lt!17934 #b0000000000000000000000000000000000000000000000000000000000000001) lt!19384))) (_2!754 lt!19382)))))

(assert (=> b!12103 (= lt!19382 (readBit!0 (_1!747 lt!17960)))))

(assert (=> b!12103 (= lt!19384 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!3932 () Bool)

(assert (=> d!3932 e!7346))

(declare-fun c!891 () Bool)

(assert (=> d!3932 (= c!891 (= (bvsub lt!17934 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3932 (= lt!19383 (_1!753 e!7347))))

(declare-fun c!890 () Bool)

(assert (=> d!3932 (= c!890 (= (bvsub lt!17934 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3932 (bvsge (bvsub lt!17934 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3932 (= (bitStreamReadBitsIntoList!0 (_2!749 lt!17961) (_1!747 lt!17960) (bvsub lt!17934 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!19383)))

(assert (= (and d!3932 c!890) b!12102))

(assert (= (and d!3932 (not c!890)) b!12103))

(assert (= (and d!3932 c!891) b!12104))

(assert (= (and d!3932 (not c!891)) b!12105))

(declare-fun m!18179 () Bool)

(assert (=> b!12105 m!18179))

(declare-fun m!18181 () Bool)

(assert (=> b!12104 m!18181))

(declare-fun m!18183 () Bool)

(assert (=> b!12103 m!18183))

(assert (=> b!12103 m!18107))

(assert (=> b!11428 d!3932))

(declare-fun d!3934 () Bool)

(declare-fun res!11665 () Bool)

(declare-fun e!7349 () Bool)

(assert (=> d!3934 (=> (not res!11665) (not e!7349))))

(assert (=> d!3934 (= res!11665 (= (size!288 (buf!633 thiss!1486)) (size!288 (buf!633 (_2!749 lt!17961)))))))

(assert (=> d!3934 (= (isPrefixOf!0 thiss!1486 (_2!749 lt!17961)) e!7349)))

(declare-fun b!12106 () Bool)

(declare-fun res!11666 () Bool)

(assert (=> b!12106 (=> (not res!11666) (not e!7349))))

(assert (=> b!12106 (= res!11666 (bvsle (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)) (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17961))) (currentByte!1705 (_2!749 lt!17961)) (currentBit!1700 (_2!749 lt!17961)))))))

(declare-fun b!12107 () Bool)

(declare-fun e!7348 () Bool)

(assert (=> b!12107 (= e!7349 e!7348)))

(declare-fun res!11664 () Bool)

(assert (=> b!12107 (=> res!11664 e!7348)))

(assert (=> b!12107 (= res!11664 (= (size!288 (buf!633 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!12108 () Bool)

(assert (=> b!12108 (= e!7348 (arrayBitRangesEq!0 (buf!633 thiss!1486) (buf!633 (_2!749 lt!17961)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486))))))

(assert (= (and d!3934 res!11665) b!12106))

(assert (= (and b!12106 res!11666) b!12107))

(assert (= (and b!12107 (not res!11664)) b!12108))

(assert (=> b!12106 m!16543))

(assert (=> b!12106 m!16707))

(assert (=> b!12108 m!16543))

(assert (=> b!12108 m!16543))

(declare-fun m!18185 () Bool)

(assert (=> b!12108 m!18185))

(assert (=> b!11428 d!3934))

(declare-fun d!3936 () Bool)

(assert (=> d!3936 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17953)))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486)) lt!17957) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17953)))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486))) lt!17957))))

(declare-fun bs!1098 () Bool)

(assert (= bs!1098 d!3936))

(declare-fun m!18187 () Bool)

(assert (=> bs!1098 m!18187))

(assert (=> b!11428 d!3936))

(declare-fun d!3938 () Bool)

(assert (=> d!3938 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17961)))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486)) lt!17954)))

(declare-fun lt!19385 () Unit!972)

(assert (=> d!3938 (= lt!19385 (choose!9 thiss!1486 (buf!633 (_2!749 lt!17961)) lt!17954 (BitStream!543 (buf!633 (_2!749 lt!17961)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486))))))

(assert (=> d!3938 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!633 (_2!749 lt!17961)) lt!17954) lt!19385)))

(declare-fun bs!1099 () Bool)

(assert (= bs!1099 d!3938))

(assert (=> bs!1099 m!16701))

(declare-fun m!18189 () Bool)

(assert (=> bs!1099 m!18189))

(assert (=> b!11428 d!3938))

(declare-fun d!3940 () Bool)

(assert (=> d!3940 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17961)))) ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17953))) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17953))) lt!17937) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17961)))) ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17953))) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17953)))) lt!17937))))

(declare-fun bs!1100 () Bool)

(assert (= bs!1100 d!3940))

(declare-fun m!18191 () Bool)

(assert (=> bs!1100 m!18191))

(assert (=> b!11428 d!3940))

(declare-fun d!3942 () Bool)

(assert (=> d!3942 (isPrefixOf!0 thiss!1486 (_2!749 lt!17961))))

(declare-fun lt!19388 () Unit!972)

(declare-fun choose!30 (BitStream!542 BitStream!542 BitStream!542) Unit!972)

(assert (=> d!3942 (= lt!19388 (choose!30 thiss!1486 (_2!749 lt!17953) (_2!749 lt!17961)))))

(assert (=> d!3942 (isPrefixOf!0 thiss!1486 (_2!749 lt!17953))))

(assert (=> d!3942 (= (lemmaIsPrefixTransitive!0 thiss!1486 (_2!749 lt!17953) (_2!749 lt!17961)) lt!19388)))

(declare-fun bs!1101 () Bool)

(assert (= bs!1101 d!3942))

(assert (=> bs!1101 m!16699))

(declare-fun m!18193 () Bool)

(assert (=> bs!1101 m!18193))

(declare-fun m!18195 () Bool)

(assert (=> bs!1101 m!18195))

(assert (=> b!11428 d!3942))

(declare-fun d!3944 () Bool)

(declare-fun c!892 () Bool)

(assert (=> d!3944 (= c!892 (= (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7350 () List!167)

(assert (=> d!3944 (= (byteArrayBitContentToList!0 (_2!749 lt!17961) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)) e!7350)))

(declare-fun b!12109 () Bool)

(assert (=> b!12109 (= e!7350 Nil!164)))

(declare-fun b!12110 () Bool)

(assert (=> b!12110 (= e!7350 (Cons!163 (not (= (bvand ((_ sign_extend 24) (select (arr!708 srcBuffer!6) ((_ extract 31 0) (bvsdiv (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!749 lt!17961) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3944 c!892) b!12109))

(assert (= (and d!3944 (not c!892)) b!12110))

(assert (=> b!12110 m!18085))

(assert (=> b!12110 m!18087))

(declare-fun m!18197 () Bool)

(assert (=> b!12110 m!18197))

(assert (=> b!11428 d!3944))

(declare-fun d!3946 () Bool)

(declare-fun e!7353 () Bool)

(assert (=> d!3946 e!7353))

(declare-fun res!11669 () Bool)

(assert (=> d!3946 (=> (not res!11669) (not e!7353))))

(assert (=> d!3946 (= res!11669 (or (= (bvand lt!17941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!17933 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!17941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!17941 lt!17933) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!19391 () Unit!972)

(declare-fun choose!27 (BitStream!542 BitStream!542 (_ BitVec 64) (_ BitVec 64)) Unit!972)

(assert (=> d!3946 (= lt!19391 (choose!27 thiss!1486 (_2!749 lt!17953) lt!17941 lt!17933))))

(assert (=> d!3946 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!17933) (bvsle lt!17933 lt!17941))))

(assert (=> d!3946 (= (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!749 lt!17953) lt!17941 lt!17933) lt!19391)))

(declare-fun b!12113 () Bool)

(assert (=> b!12113 (= e!7353 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17953)))) ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17953))) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17953))) (bvsub lt!17941 lt!17933)))))

(assert (= (and d!3946 res!11669) b!12113))

(declare-fun m!18199 () Bool)

(assert (=> d!3946 m!18199))

(assert (=> b!12113 m!16703))

(assert (=> b!11428 d!3946))

(assert (=> b!11428 d!3544))

(declare-fun d!3948 () Bool)

(assert (=> d!3948 (= (head!62 (bitStreamReadBitsIntoList!0 (_2!749 lt!17953) (_1!747 lt!17955) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!282 (bitStreamReadBitsIntoList!0 (_2!749 lt!17953) (_1!747 lt!17955) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!11428 d!3948))

(declare-fun d!3950 () Bool)

(declare-fun e!7356 () Bool)

(assert (=> d!3950 e!7356))

(declare-fun res!11672 () Bool)

(assert (=> d!3950 (=> (not res!11672) (not e!7356))))

(declare-fun lt!19397 () (_ BitVec 64))

(assert (=> d!3950 (= res!11672 (or (= (bvand lt!17934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19397 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!17934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!17934 lt!19397) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3950 (= lt!19397 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!19396 () Unit!972)

(declare-fun choose!42 (BitStream!542 BitStream!542 BitStream!542 BitStream!542 (_ BitVec 64) List!167) Unit!972)

(assert (=> d!3950 (= lt!19396 (choose!42 (_2!749 lt!17961) (_2!749 lt!17961) (_1!747 lt!17945) (_1!747 lt!17960) lt!17934 lt!17939))))

(assert (=> d!3950 (bvsgt lt!17934 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3950 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!749 lt!17961) (_2!749 lt!17961) (_1!747 lt!17945) (_1!747 lt!17960) lt!17934 lt!17939) lt!19396)))

(declare-fun b!12116 () Bool)

(assert (=> b!12116 (= e!7356 (= (bitStreamReadBitsIntoList!0 (_2!749 lt!17961) (_1!747 lt!17960) (bvsub lt!17934 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!70 lt!17939)))))

(assert (= (and d!3950 res!11672) b!12116))

(declare-fun m!18201 () Bool)

(assert (=> d!3950 m!18201))

(assert (=> b!12116 m!16693))

(assert (=> b!12116 m!16663))

(assert (=> b!11428 d!3950))

(declare-fun d!3952 () Bool)

(assert (=> d!3952 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17953)))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486)) lt!17957)))

(declare-fun lt!19398 () Unit!972)

(assert (=> d!3952 (= lt!19398 (choose!9 thiss!1486 (buf!633 (_2!749 lt!17953)) lt!17957 (BitStream!543 (buf!633 (_2!749 lt!17953)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486))))))

(assert (=> d!3952 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!633 (_2!749 lt!17953)) lt!17957) lt!19398)))

(declare-fun bs!1102 () Bool)

(assert (= bs!1102 d!3952))

(assert (=> bs!1102 m!16657))

(declare-fun m!18203 () Bool)

(assert (=> bs!1102 m!18203))

(assert (=> b!11428 d!3952))

(declare-fun d!3954 () Bool)

(declare-fun c!893 () Bool)

(assert (=> d!3954 (= c!893 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7357 () List!167)

(assert (=> d!3954 (= (byteArrayBitContentToList!0 (_2!749 lt!17961) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)) e!7357)))

(declare-fun b!12117 () Bool)

(assert (=> b!12117 (= e!7357 Nil!164)))

(declare-fun b!12118 () Bool)

(assert (=> b!12118 (= e!7357 (Cons!163 (not (= (bvand ((_ sign_extend 24) (select (arr!708 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!749 lt!17961) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3954 c!893) b!12117))

(assert (= (and d!3954 (not c!893)) b!12118))

(assert (=> b!12118 m!16659))

(assert (=> b!12118 m!16971))

(assert (=> b!12118 m!16709))

(assert (=> b!11428 d!3954))

(declare-fun d!3956 () Bool)

(assert (=> d!3956 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17961)))) ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17953))) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17953))) lt!17937)))

(declare-fun lt!19399 () Unit!972)

(assert (=> d!3956 (= lt!19399 (choose!9 (_2!749 lt!17953) (buf!633 (_2!749 lt!17961)) lt!17937 (BitStream!543 (buf!633 (_2!749 lt!17961)) (currentByte!1705 (_2!749 lt!17953)) (currentBit!1700 (_2!749 lt!17953)))))))

(assert (=> d!3956 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!749 lt!17953) (buf!633 (_2!749 lt!17961)) lt!17937) lt!19399)))

(declare-fun bs!1103 () Bool)

(assert (= bs!1103 d!3956))

(assert (=> bs!1103 m!16695))

(declare-fun m!18205 () Bool)

(assert (=> bs!1103 m!18205))

(assert (=> b!11428 d!3956))

(declare-fun d!3958 () Bool)

(declare-fun e!7358 () Bool)

(assert (=> d!3958 e!7358))

(declare-fun res!11675 () Bool)

(assert (=> d!3958 (=> (not res!11675) (not e!7358))))

(declare-fun lt!19412 () tuple2!1402)

(assert (=> d!3958 (= res!11675 (isPrefixOf!0 (_1!747 lt!19412) (_2!747 lt!19412)))))

(declare-fun lt!19407 () BitStream!542)

(assert (=> d!3958 (= lt!19412 (tuple2!1403 lt!19407 (_2!749 lt!17961)))))

(declare-fun lt!19410 () Unit!972)

(declare-fun lt!19405 () Unit!972)

(assert (=> d!3958 (= lt!19410 lt!19405)))

(assert (=> d!3958 (isPrefixOf!0 lt!19407 (_2!749 lt!17961))))

(assert (=> d!3958 (= lt!19405 (lemmaIsPrefixTransitive!0 lt!19407 (_2!749 lt!17961) (_2!749 lt!17961)))))

(declare-fun lt!19417 () Unit!972)

(declare-fun lt!19416 () Unit!972)

(assert (=> d!3958 (= lt!19417 lt!19416)))

(assert (=> d!3958 (isPrefixOf!0 lt!19407 (_2!749 lt!17961))))

(assert (=> d!3958 (= lt!19416 (lemmaIsPrefixTransitive!0 lt!19407 thiss!1486 (_2!749 lt!17961)))))

(declare-fun lt!19406 () Unit!972)

(declare-fun e!7359 () Unit!972)

(assert (=> d!3958 (= lt!19406 e!7359)))

(declare-fun c!894 () Bool)

(assert (=> d!3958 (= c!894 (not (= (size!288 (buf!633 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!19401 () Unit!972)

(declare-fun lt!19413 () Unit!972)

(assert (=> d!3958 (= lt!19401 lt!19413)))

(assert (=> d!3958 (isPrefixOf!0 (_2!749 lt!17961) (_2!749 lt!17961))))

(assert (=> d!3958 (= lt!19413 (lemmaIsPrefixRefl!0 (_2!749 lt!17961)))))

(declare-fun lt!19404 () Unit!972)

(declare-fun lt!19402 () Unit!972)

(assert (=> d!3958 (= lt!19404 lt!19402)))

(assert (=> d!3958 (= lt!19402 (lemmaIsPrefixRefl!0 (_2!749 lt!17961)))))

(declare-fun lt!19409 () Unit!972)

(declare-fun lt!19418 () Unit!972)

(assert (=> d!3958 (= lt!19409 lt!19418)))

(assert (=> d!3958 (isPrefixOf!0 lt!19407 lt!19407)))

(assert (=> d!3958 (= lt!19418 (lemmaIsPrefixRefl!0 lt!19407))))

(declare-fun lt!19400 () Unit!972)

(declare-fun lt!19419 () Unit!972)

(assert (=> d!3958 (= lt!19400 lt!19419)))

(assert (=> d!3958 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3958 (= lt!19419 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3958 (= lt!19407 (BitStream!543 (buf!633 (_2!749 lt!17961)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)))))

(assert (=> d!3958 (isPrefixOf!0 thiss!1486 (_2!749 lt!17961))))

(assert (=> d!3958 (= (reader!0 thiss!1486 (_2!749 lt!17961)) lt!19412)))

(declare-fun lt!19415 () (_ BitVec 64))

(declare-fun lt!19403 () (_ BitVec 64))

(declare-fun b!12119 () Bool)

(assert (=> b!12119 (= e!7358 (= (_1!747 lt!19412) (withMovedBitIndex!0 (_2!747 lt!19412) (bvsub lt!19403 lt!19415))))))

(assert (=> b!12119 (or (= (bvand lt!19403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19415 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19403 lt!19415) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12119 (= lt!19415 (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17961))) (currentByte!1705 (_2!749 lt!17961)) (currentBit!1700 (_2!749 lt!17961))))))

(assert (=> b!12119 (= lt!19403 (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)))))

(declare-fun b!12120 () Bool)

(declare-fun res!11674 () Bool)

(assert (=> b!12120 (=> (not res!11674) (not e!7358))))

(assert (=> b!12120 (= res!11674 (isPrefixOf!0 (_2!747 lt!19412) (_2!749 lt!17961)))))

(declare-fun b!12121 () Bool)

(declare-fun Unit!1029 () Unit!972)

(assert (=> b!12121 (= e!7359 Unit!1029)))

(declare-fun b!12122 () Bool)

(declare-fun lt!19408 () Unit!972)

(assert (=> b!12122 (= e!7359 lt!19408)))

(declare-fun lt!19411 () (_ BitVec 64))

(assert (=> b!12122 (= lt!19411 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19414 () (_ BitVec 64))

(assert (=> b!12122 (= lt!19414 (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)))))

(assert (=> b!12122 (= lt!19408 (arrayBitRangesEqSymmetric!0 (buf!633 thiss!1486) (buf!633 (_2!749 lt!17961)) lt!19411 lt!19414))))

(assert (=> b!12122 (arrayBitRangesEq!0 (buf!633 (_2!749 lt!17961)) (buf!633 thiss!1486) lt!19411 lt!19414)))

(declare-fun b!12123 () Bool)

(declare-fun res!11673 () Bool)

(assert (=> b!12123 (=> (not res!11673) (not e!7358))))

(assert (=> b!12123 (= res!11673 (isPrefixOf!0 (_1!747 lt!19412) thiss!1486))))

(assert (= (and d!3958 c!894) b!12122))

(assert (= (and d!3958 (not c!894)) b!12121))

(assert (= (and d!3958 res!11675) b!12123))

(assert (= (and b!12123 res!11673) b!12120))

(assert (= (and b!12120 res!11674) b!12119))

(declare-fun m!18207 () Bool)

(assert (=> d!3958 m!18207))

(declare-fun m!18209 () Bool)

(assert (=> d!3958 m!18209))

(assert (=> d!3958 m!16637))

(assert (=> d!3958 m!18117))

(assert (=> d!3958 m!16639))

(assert (=> d!3958 m!18121))

(declare-fun m!18211 () Bool)

(assert (=> d!3958 m!18211))

(declare-fun m!18213 () Bool)

(assert (=> d!3958 m!18213))

(declare-fun m!18215 () Bool)

(assert (=> d!3958 m!18215))

(declare-fun m!18217 () Bool)

(assert (=> d!3958 m!18217))

(assert (=> d!3958 m!16699))

(declare-fun m!18219 () Bool)

(assert (=> b!12123 m!18219))

(declare-fun m!18221 () Bool)

(assert (=> b!12120 m!18221))

(declare-fun m!18223 () Bool)

(assert (=> b!12119 m!18223))

(assert (=> b!12119 m!16707))

(assert (=> b!12119 m!16543))

(assert (=> b!12122 m!16543))

(declare-fun m!18225 () Bool)

(assert (=> b!12122 m!18225))

(declare-fun m!18227 () Bool)

(assert (=> b!12122 m!18227))

(assert (=> b!11428 d!3958))

(declare-fun b!12124 () Bool)

(declare-fun e!7361 () tuple2!1412)

(assert (=> b!12124 (= e!7361 (tuple2!1413 Nil!164 (_1!747 lt!17955)))))

(declare-fun b!12127 () Bool)

(declare-fun e!7360 () Bool)

(declare-fun lt!19421 () List!167)

(assert (=> b!12127 (= e!7360 (> (length!33 lt!19421) 0))))

(declare-fun b!12126 () Bool)

(assert (=> b!12126 (= e!7360 (isEmpty!38 lt!19421))))

(declare-fun lt!19420 () tuple2!1414)

(declare-fun b!12125 () Bool)

(declare-fun lt!19422 () (_ BitVec 64))

(assert (=> b!12125 (= e!7361 (tuple2!1413 (Cons!163 (_1!754 lt!19420) (bitStreamReadBitsIntoList!0 (_2!749 lt!17953) (_2!754 lt!19420) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!19422))) (_2!754 lt!19420)))))

(assert (=> b!12125 (= lt!19420 (readBit!0 (_1!747 lt!17955)))))

(assert (=> b!12125 (= lt!19422 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!3960 () Bool)

(assert (=> d!3960 e!7360))

(declare-fun c!896 () Bool)

(assert (=> d!3960 (= c!896 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3960 (= lt!19421 (_1!753 e!7361))))

(declare-fun c!895 () Bool)

(assert (=> d!3960 (= c!895 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3960 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3960 (= (bitStreamReadBitsIntoList!0 (_2!749 lt!17953) (_1!747 lt!17955) #b0000000000000000000000000000000000000000000000000000000000000001) lt!19421)))

(assert (= (and d!3960 c!895) b!12124))

(assert (= (and d!3960 (not c!895)) b!12125))

(assert (= (and d!3960 c!896) b!12126))

(assert (= (and d!3960 (not c!896)) b!12127))

(declare-fun m!18229 () Bool)

(assert (=> b!12127 m!18229))

(declare-fun m!18231 () Bool)

(assert (=> b!12126 m!18231))

(declare-fun m!18233 () Bool)

(assert (=> b!12125 m!18233))

(declare-fun m!18235 () Bool)

(assert (=> b!12125 m!18235))

(assert (=> b!11428 d!3960))

(declare-fun d!3962 () Bool)

(declare-fun e!7362 () Bool)

(assert (=> d!3962 e!7362))

(declare-fun res!11676 () Bool)

(assert (=> d!3962 (=> (not res!11676) (not e!7362))))

(declare-fun lt!19424 () (_ BitVec 64))

(declare-fun lt!19426 () (_ BitVec 64))

(declare-fun lt!19423 () (_ BitVec 64))

(assert (=> d!3962 (= res!11676 (= lt!19423 (bvsub lt!19426 lt!19424)))))

(assert (=> d!3962 (or (= (bvand lt!19426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19424 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19426 lt!19424) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3962 (= lt!19424 (remainingBits!0 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17961)))) ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17961))) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17961)))))))

(declare-fun lt!19427 () (_ BitVec 64))

(declare-fun lt!19425 () (_ BitVec 64))

(assert (=> d!3962 (= lt!19426 (bvmul lt!19427 lt!19425))))

(assert (=> d!3962 (or (= lt!19427 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!19425 (bvsdiv (bvmul lt!19427 lt!19425) lt!19427)))))

(assert (=> d!3962 (= lt!19425 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3962 (= lt!19427 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17961)))))))

(assert (=> d!3962 (= lt!19423 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17961))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17961)))))))

(assert (=> d!3962 (invariant!0 (currentBit!1700 (_2!749 lt!17961)) (currentByte!1705 (_2!749 lt!17961)) (size!288 (buf!633 (_2!749 lt!17961))))))

(assert (=> d!3962 (= (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17961))) (currentByte!1705 (_2!749 lt!17961)) (currentBit!1700 (_2!749 lt!17961))) lt!19423)))

(declare-fun b!12128 () Bool)

(declare-fun res!11677 () Bool)

(assert (=> b!12128 (=> (not res!11677) (not e!7362))))

(assert (=> b!12128 (= res!11677 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!19423))))

(declare-fun b!12129 () Bool)

(declare-fun lt!19428 () (_ BitVec 64))

(assert (=> b!12129 (= e!7362 (bvsle lt!19423 (bvmul lt!19428 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!12129 (or (= lt!19428 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!19428 #b0000000000000000000000000000000000000000000000000000000000001000) lt!19428)))))

(assert (=> b!12129 (= lt!19428 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17961)))))))

(assert (= (and d!3962 res!11676) b!12128))

(assert (= (and b!12128 res!11677) b!12129))

(declare-fun m!18237 () Bool)

(assert (=> d!3962 m!18237))

(declare-fun m!18239 () Bool)

(assert (=> d!3962 m!18239))

(assert (=> b!11428 d!3962))

(declare-fun d!3964 () Bool)

(declare-fun e!7363 () Bool)

(assert (=> d!3964 e!7363))

(declare-fun res!11678 () Bool)

(assert (=> d!3964 (=> (not res!11678) (not e!7363))))

(declare-fun lt!19432 () (_ BitVec 64))

(declare-fun lt!19429 () (_ BitVec 64))

(declare-fun lt!19430 () (_ BitVec 64))

(assert (=> d!3964 (= res!11678 (= lt!19429 (bvsub lt!19432 lt!19430)))))

(assert (=> d!3964 (or (= (bvand lt!19432 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19430 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19432 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19432 lt!19430) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3964 (= lt!19430 (remainingBits!0 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17953)))) ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17953))) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17953)))))))

(declare-fun lt!19433 () (_ BitVec 64))

(declare-fun lt!19431 () (_ BitVec 64))

(assert (=> d!3964 (= lt!19432 (bvmul lt!19433 lt!19431))))

(assert (=> d!3964 (or (= lt!19433 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!19431 (bvsdiv (bvmul lt!19433 lt!19431) lt!19433)))))

(assert (=> d!3964 (= lt!19431 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3964 (= lt!19433 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17953)))))))

(assert (=> d!3964 (= lt!19429 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17953))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17953)))))))

(assert (=> d!3964 (invariant!0 (currentBit!1700 (_2!749 lt!17953)) (currentByte!1705 (_2!749 lt!17953)) (size!288 (buf!633 (_2!749 lt!17953))))))

(assert (=> d!3964 (= (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17953))) (currentByte!1705 (_2!749 lt!17953)) (currentBit!1700 (_2!749 lt!17953))) lt!19429)))

(declare-fun b!12130 () Bool)

(declare-fun res!11679 () Bool)

(assert (=> b!12130 (=> (not res!11679) (not e!7363))))

(assert (=> b!12130 (= res!11679 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!19429))))

(declare-fun b!12131 () Bool)

(declare-fun lt!19434 () (_ BitVec 64))

(assert (=> b!12131 (= e!7363 (bvsle lt!19429 (bvmul lt!19434 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!12131 (or (= lt!19434 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!19434 #b0000000000000000000000000000000000000000000000000000000000001000) lt!19434)))))

(assert (=> b!12131 (= lt!19434 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17953)))))))

(assert (= (and d!3964 res!11678) b!12130))

(assert (= (and b!12130 res!11679) b!12131))

(assert (=> d!3964 m!18099))

(declare-fun m!18241 () Bool)

(assert (=> d!3964 m!18241))

(assert (=> b!11428 d!3964))

(declare-fun b!12132 () Bool)

(declare-fun res!11680 () Bool)

(declare-fun e!7364 () Bool)

(assert (=> b!12132 (=> (not res!11680) (not e!7364))))

(declare-fun lt!19473 () tuple2!1406)

(assert (=> b!12132 (= res!11680 (invariant!0 (currentBit!1700 (_2!749 lt!19473)) (currentByte!1705 (_2!749 lt!19473)) (size!288 (buf!633 (_2!749 lt!19473)))))))

(declare-fun b!12133 () Bool)

(declare-fun res!11683 () Bool)

(assert (=> b!12133 (=> (not res!11683) (not e!7364))))

(assert (=> b!12133 (= res!11683 (= (size!288 (buf!633 (_2!749 lt!19473))) (size!288 (buf!633 (_2!749 lt!17953)))))))

(declare-fun b!12134 () Bool)

(declare-fun lt!19447 () tuple2!1402)

(assert (=> b!12134 (= e!7364 (= (bitStreamReadBitsIntoList!0 (_2!749 lt!19473) (_1!747 lt!19447) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))) (byteArrayBitContentToList!0 (_2!749 lt!19473) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!12134 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12134 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!19476 () Unit!972)

(declare-fun lt!19474 () Unit!972)

(assert (=> b!12134 (= lt!19476 lt!19474)))

(declare-fun lt!19446 () (_ BitVec 64))

(assert (=> b!12134 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!19473)))) ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17953))) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17953))) lt!19446)))

(assert (=> b!12134 (= lt!19474 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!749 lt!17953) (buf!633 (_2!749 lt!19473)) lt!19446))))

(declare-fun e!7366 () Bool)

(assert (=> b!12134 e!7366))

(declare-fun res!11681 () Bool)

(assert (=> b!12134 (=> (not res!11681) (not e!7366))))

(assert (=> b!12134 (= res!11681 (and (= (size!288 (buf!633 (_2!749 lt!17953))) (size!288 (buf!633 (_2!749 lt!19473)))) (bvsge lt!19446 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12134 (= lt!19446 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!12134 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12134 (= lt!19447 (reader!0 (_2!749 lt!17953) (_2!749 lt!19473)))))

(declare-fun b!12135 () Bool)

(declare-fun res!11684 () Bool)

(assert (=> b!12135 (=> (not res!11684) (not e!7364))))

(assert (=> b!12135 (= res!11684 (= (size!288 (buf!633 (_2!749 lt!17953))) (size!288 (buf!633 (_2!749 lt!19473)))))))

(declare-fun b!12136 () Bool)

(declare-fun res!11682 () Bool)

(assert (=> b!12136 (=> (not res!11682) (not e!7364))))

(assert (=> b!12136 (= res!11682 (isPrefixOf!0 (_2!749 lt!17953) (_2!749 lt!19473)))))

(declare-fun b!12137 () Bool)

(assert (=> b!12137 (= e!7366 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17953)))) ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17953))) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17953))) lt!19446))))

(declare-fun bm!235 () Bool)

(declare-fun c!897 () Bool)

(declare-fun call!238 () tuple2!1402)

(declare-fun lt!19456 () tuple2!1406)

(assert (=> bm!235 (= call!238 (reader!0 (_2!749 lt!17953) (ite c!897 (_2!749 lt!19456) (_2!749 lt!17953))))))

(declare-fun d!3966 () Bool)

(assert (=> d!3966 e!7364))

(declare-fun res!11685 () Bool)

(assert (=> d!3966 (=> (not res!11685) (not e!7364))))

(declare-fun lt!19467 () (_ BitVec 64))

(assert (=> d!3966 (= res!11685 (= (bitIndex!0 (size!288 (buf!633 (_2!749 lt!19473))) (currentByte!1705 (_2!749 lt!19473)) (currentBit!1700 (_2!749 lt!19473))) (bvsub lt!19467 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!3966 (or (= (bvand lt!19467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19467 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!19443 () (_ BitVec 64))

(assert (=> d!3966 (= lt!19467 (bvadd lt!19443 from!367 nBits!460))))

(assert (=> d!3966 (or (not (= (bvand lt!19443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!19443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!19443 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3966 (= lt!19443 (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17953))) (currentByte!1705 (_2!749 lt!17953)) (currentBit!1700 (_2!749 lt!17953))))))

(declare-fun e!7365 () tuple2!1406)

(assert (=> d!3966 (= lt!19473 e!7365)))

(assert (=> d!3966 (= c!897 (bvslt (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!19468 () Unit!972)

(declare-fun lt!19475 () Unit!972)

(assert (=> d!3966 (= lt!19468 lt!19475)))

(assert (=> d!3966 (isPrefixOf!0 (_2!749 lt!17953) (_2!749 lt!17953))))

(assert (=> d!3966 (= lt!19475 (lemmaIsPrefixRefl!0 (_2!749 lt!17953)))))

(declare-fun lt!19441 () (_ BitVec 64))

(assert (=> d!3966 (= lt!19441 (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17953))) (currentByte!1705 (_2!749 lt!17953)) (currentBit!1700 (_2!749 lt!17953))))))

(assert (=> d!3966 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3966 (= (appendBitsMSBFirstLoop!0 (_2!749 lt!17953) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)) lt!19473)))

(declare-fun b!12138 () Bool)

(declare-fun Unit!1030 () Unit!972)

(assert (=> b!12138 (= e!7365 (tuple2!1407 Unit!1030 (_2!749 lt!17953)))))

(assert (=> b!12138 (= (size!288 (buf!633 (_2!749 lt!17953))) (size!288 (buf!633 (_2!749 lt!17953))))))

(declare-fun lt!19454 () Unit!972)

(declare-fun Unit!1031 () Unit!972)

(assert (=> b!12138 (= lt!19454 Unit!1031)))

(assert (=> b!12138 (checkByteArrayBitContent!0 (_2!749 lt!17953) srcBuffer!6 (_1!748 (readBits!0 (_1!747 call!238) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!12139 () Bool)

(declare-fun lt!19464 () tuple2!1406)

(declare-fun Unit!1032 () Unit!972)

(assert (=> b!12139 (= e!7365 (tuple2!1407 Unit!1032 (_2!749 lt!19464)))))

(assert (=> b!12139 (= lt!19456 (appendBitFromByte!0 (_2!749 lt!17953) (select (arr!708 srcBuffer!6) ((_ extract 31 0) (bvsdiv (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!19444 () (_ BitVec 64))

(assert (=> b!12139 (= lt!19444 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!19436 () (_ BitVec 64))

(assert (=> b!12139 (= lt!19436 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!19439 () Unit!972)

(assert (=> b!12139 (= lt!19439 (validateOffsetBitsIneqLemma!0 (_2!749 lt!17953) (_2!749 lt!19456) lt!19444 lt!19436))))

(assert (=> b!12139 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!19456)))) ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!19456))) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!19456))) (bvsub lt!19444 lt!19436))))

(declare-fun lt!19465 () Unit!972)

(assert (=> b!12139 (= lt!19465 lt!19439)))

(declare-fun lt!19458 () tuple2!1402)

(assert (=> b!12139 (= lt!19458 call!238)))

(declare-fun lt!19460 () (_ BitVec 64))

(assert (=> b!12139 (= lt!19460 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!19453 () Unit!972)

(assert (=> b!12139 (= lt!19453 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!749 lt!17953) (buf!633 (_2!749 lt!19456)) lt!19460))))

(assert (=> b!12139 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!19456)))) ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17953))) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17953))) lt!19460)))

(declare-fun lt!19445 () Unit!972)

(assert (=> b!12139 (= lt!19445 lt!19453)))

(assert (=> b!12139 (= (head!62 (byteArrayBitContentToList!0 (_2!749 lt!19456) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!62 (bitStreamReadBitsIntoList!0 (_2!749 lt!19456) (_1!747 lt!19458) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!19477 () Unit!972)

(declare-fun Unit!1033 () Unit!972)

(assert (=> b!12139 (= lt!19477 Unit!1033)))

(assert (=> b!12139 (= lt!19464 (appendBitsMSBFirstLoop!0 (_2!749 lt!19456) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!19435 () Unit!972)

(assert (=> b!12139 (= lt!19435 (lemmaIsPrefixTransitive!0 (_2!749 lt!17953) (_2!749 lt!19456) (_2!749 lt!19464)))))

(assert (=> b!12139 (isPrefixOf!0 (_2!749 lt!17953) (_2!749 lt!19464))))

(declare-fun lt!19472 () Unit!972)

(assert (=> b!12139 (= lt!19472 lt!19435)))

(assert (=> b!12139 (= (size!288 (buf!633 (_2!749 lt!19464))) (size!288 (buf!633 (_2!749 lt!17953))))))

(declare-fun lt!19462 () Unit!972)

(declare-fun Unit!1034 () Unit!972)

(assert (=> b!12139 (= lt!19462 Unit!1034)))

(assert (=> b!12139 (= (bitIndex!0 (size!288 (buf!633 (_2!749 lt!19464))) (currentByte!1705 (_2!749 lt!19464)) (currentBit!1700 (_2!749 lt!19464))) (bvsub (bvadd (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17953))) (currentByte!1705 (_2!749 lt!17953)) (currentBit!1700 (_2!749 lt!17953))) from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!19438 () Unit!972)

(declare-fun Unit!1035 () Unit!972)

(assert (=> b!12139 (= lt!19438 Unit!1035)))

(assert (=> b!12139 (= (bitIndex!0 (size!288 (buf!633 (_2!749 lt!19464))) (currentByte!1705 (_2!749 lt!19464)) (currentBit!1700 (_2!749 lt!19464))) (bvsub (bvsub (bvadd (bitIndex!0 (size!288 (buf!633 (_2!749 lt!19456))) (currentByte!1705 (_2!749 lt!19456)) (currentBit!1700 (_2!749 lt!19456))) from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!19452 () Unit!972)

(declare-fun Unit!1036 () Unit!972)

(assert (=> b!12139 (= lt!19452 Unit!1036)))

(declare-fun lt!19448 () tuple2!1402)

(assert (=> b!12139 (= lt!19448 (reader!0 (_2!749 lt!17953) (_2!749 lt!19464)))))

(declare-fun lt!19457 () (_ BitVec 64))

(assert (=> b!12139 (= lt!19457 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!19451 () Unit!972)

(assert (=> b!12139 (= lt!19451 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!749 lt!17953) (buf!633 (_2!749 lt!19464)) lt!19457))))

(assert (=> b!12139 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!19464)))) ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17953))) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17953))) lt!19457)))

(declare-fun lt!19469 () Unit!972)

(assert (=> b!12139 (= lt!19469 lt!19451)))

(declare-fun lt!19463 () tuple2!1402)

(assert (=> b!12139 (= lt!19463 (reader!0 (_2!749 lt!19456) (_2!749 lt!19464)))))

(declare-fun lt!19440 () (_ BitVec 64))

(assert (=> b!12139 (= lt!19440 (bvsub (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!19478 () Unit!972)

(assert (=> b!12139 (= lt!19478 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!749 lt!19456) (buf!633 (_2!749 lt!19464)) lt!19440))))

(assert (=> b!12139 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!19464)))) ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!19456))) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!19456))) lt!19440)))

(declare-fun lt!19471 () Unit!972)

(assert (=> b!12139 (= lt!19471 lt!19478)))

(declare-fun lt!19459 () List!167)

(assert (=> b!12139 (= lt!19459 (byteArrayBitContentToList!0 (_2!749 lt!19464) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!19461 () List!167)

(assert (=> b!12139 (= lt!19461 (byteArrayBitContentToList!0 (_2!749 lt!19464) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!19442 () List!167)

(assert (=> b!12139 (= lt!19442 (bitStreamReadBitsIntoList!0 (_2!749 lt!19464) (_1!747 lt!19448) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!19455 () List!167)

(assert (=> b!12139 (= lt!19455 (bitStreamReadBitsIntoList!0 (_2!749 lt!19464) (_1!747 lt!19463) (bvsub (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!19437 () (_ BitVec 64))

(assert (=> b!12139 (= lt!19437 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!19449 () Unit!972)

(assert (=> b!12139 (= lt!19449 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!749 lt!19464) (_2!749 lt!19464) (_1!747 lt!19448) (_1!747 lt!19463) lt!19437 lt!19442))))

(assert (=> b!12139 (= (bitStreamReadBitsIntoList!0 (_2!749 lt!19464) (_1!747 lt!19463) (bvsub lt!19437 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!70 lt!19442))))

(declare-fun lt!19466 () Unit!972)

(assert (=> b!12139 (= lt!19466 lt!19449)))

(declare-fun lt!19450 () Unit!972)

(assert (=> b!12139 (= lt!19450 (arrayBitRangesEqImpliesEq!0 (buf!633 (_2!749 lt!19456)) (buf!633 (_2!749 lt!19464)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!19441 (bitIndex!0 (size!288 (buf!633 (_2!749 lt!19456))) (currentByte!1705 (_2!749 lt!19456)) (currentBit!1700 (_2!749 lt!19456)))))))

(assert (=> b!12139 (= (bitAt!0 (buf!633 (_2!749 lt!19456)) lt!19441) (bitAt!0 (buf!633 (_2!749 lt!19464)) lt!19441))))

(declare-fun lt!19470 () Unit!972)

(assert (=> b!12139 (= lt!19470 lt!19450)))

(assert (= (and d!3966 c!897) b!12139))

(assert (= (and d!3966 (not c!897)) b!12138))

(assert (= (or b!12139 b!12138) bm!235))

(assert (= (and d!3966 res!11685) b!12132))

(assert (= (and b!12132 res!11680) b!12135))

(assert (= (and b!12135 res!11684) b!12136))

(assert (= (and b!12136 res!11682) b!12133))

(assert (= (and b!12133 res!11683) b!12134))

(assert (= (and b!12134 res!11681) b!12137))

(declare-fun m!18243 () Bool)

(assert (=> b!12138 m!18243))

(declare-fun m!18245 () Bool)

(assert (=> b!12138 m!18245))

(declare-fun m!18247 () Bool)

(assert (=> bm!235 m!18247))

(declare-fun m!18249 () Bool)

(assert (=> d!3966 m!18249))

(assert (=> d!3966 m!16675))

(assert (=> d!3966 m!18115))

(assert (=> d!3966 m!18119))

(declare-fun m!18251 () Bool)

(assert (=> b!12137 m!18251))

(declare-fun m!18253 () Bool)

(assert (=> b!12132 m!18253))

(declare-fun m!18255 () Bool)

(assert (=> b!12136 m!18255))

(declare-fun m!18257 () Bool)

(assert (=> b!12134 m!18257))

(declare-fun m!18259 () Bool)

(assert (=> b!12134 m!18259))

(declare-fun m!18261 () Bool)

(assert (=> b!12134 m!18261))

(declare-fun m!18263 () Bool)

(assert (=> b!12134 m!18263))

(declare-fun m!18265 () Bool)

(assert (=> b!12134 m!18265))

(declare-fun m!18267 () Bool)

(assert (=> b!12139 m!18267))

(assert (=> b!12139 m!18085))

(declare-fun m!18269 () Bool)

(assert (=> b!12139 m!18269))

(declare-fun m!18271 () Bool)

(assert (=> b!12139 m!18271))

(declare-fun m!18273 () Bool)

(assert (=> b!12139 m!18273))

(declare-fun m!18275 () Bool)

(assert (=> b!12139 m!18275))

(declare-fun m!18277 () Bool)

(assert (=> b!12139 m!18277))

(declare-fun m!18279 () Bool)

(assert (=> b!12139 m!18279))

(declare-fun m!18281 () Bool)

(assert (=> b!12139 m!18281))

(declare-fun m!18283 () Bool)

(assert (=> b!12139 m!18283))

(declare-fun m!18285 () Bool)

(assert (=> b!12139 m!18285))

(declare-fun m!18287 () Bool)

(assert (=> b!12139 m!18287))

(assert (=> b!12139 m!18279))

(declare-fun m!18289 () Bool)

(assert (=> b!12139 m!18289))

(declare-fun m!18291 () Bool)

(assert (=> b!12139 m!18291))

(declare-fun m!18293 () Bool)

(assert (=> b!12139 m!18293))

(assert (=> b!12139 m!16675))

(declare-fun m!18295 () Bool)

(assert (=> b!12139 m!18295))

(assert (=> b!12139 m!18283))

(declare-fun m!18297 () Bool)

(assert (=> b!12139 m!18297))

(declare-fun m!18299 () Bool)

(assert (=> b!12139 m!18299))

(declare-fun m!18301 () Bool)

(assert (=> b!12139 m!18301))

(declare-fun m!18303 () Bool)

(assert (=> b!12139 m!18303))

(declare-fun m!18305 () Bool)

(assert (=> b!12139 m!18305))

(declare-fun m!18307 () Bool)

(assert (=> b!12139 m!18307))

(assert (=> b!12139 m!18085))

(declare-fun m!18309 () Bool)

(assert (=> b!12139 m!18309))

(declare-fun m!18311 () Bool)

(assert (=> b!12139 m!18311))

(declare-fun m!18313 () Bool)

(assert (=> b!12139 m!18313))

(declare-fun m!18315 () Bool)

(assert (=> b!12139 m!18315))

(declare-fun m!18317 () Bool)

(assert (=> b!12139 m!18317))

(declare-fun m!18319 () Bool)

(assert (=> b!12139 m!18319))

(declare-fun m!18321 () Bool)

(assert (=> b!12139 m!18321))

(declare-fun m!18323 () Bool)

(assert (=> b!12139 m!18323))

(declare-fun m!18325 () Bool)

(assert (=> b!12139 m!18325))

(assert (=> b!12139 m!18319))

(assert (=> b!11428 d!3966))

(assert (=> b!11562 d!3544))

(assert (=> b!11562 d!3542))

(assert (=> b!11500 d!3544))

(declare-fun d!3968 () Bool)

(assert (=> d!3968 (arrayBitRangesEq!0 (buf!633 (_2!749 lt!17717)) (buf!633 thiss!1486) lt!18259 lt!18262)))

(declare-fun lt!19481 () Unit!972)

(declare-fun choose!8 (array!667 array!667 (_ BitVec 64) (_ BitVec 64)) Unit!972)

(assert (=> d!3968 (= lt!19481 (choose!8 (buf!633 thiss!1486) (buf!633 (_2!749 lt!17717)) lt!18259 lt!18262))))

(assert (=> d!3968 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!18259) (bvsle lt!18259 lt!18262))))

(assert (=> d!3968 (= (arrayBitRangesEqSymmetric!0 (buf!633 thiss!1486) (buf!633 (_2!749 lt!17717)) lt!18259 lt!18262) lt!19481)))

(declare-fun bs!1104 () Bool)

(assert (= bs!1104 d!3968))

(assert (=> bs!1104 m!16851))

(declare-fun m!18327 () Bool)

(assert (=> bs!1104 m!18327))

(assert (=> b!11500 d!3968))

(declare-fun b!12154 () Bool)

(declare-fun e!7379 () Bool)

(declare-fun e!7384 () Bool)

(assert (=> b!12154 (= e!7379 e!7384)))

(declare-fun res!11697 () Bool)

(declare-fun call!241 () Bool)

(assert (=> b!12154 (= res!11697 call!241)))

(assert (=> b!12154 (=> (not res!11697) (not e!7384))))

(declare-fun b!12155 () Bool)

(declare-fun e!7381 () Bool)

(assert (=> b!12155 (= e!7381 e!7379)))

(declare-fun c!900 () Bool)

(declare-datatypes ((tuple4!10 0))(
  ( (tuple4!11 (_1!764 (_ BitVec 32)) (_2!764 (_ BitVec 32)) (_3!51 (_ BitVec 32)) (_4!5 (_ BitVec 32))) )
))
(declare-fun lt!19490 () tuple4!10)

(assert (=> b!12155 (= c!900 (= (_3!51 lt!19490) (_4!5 lt!19490)))))

(declare-fun b!12156 () Bool)

(declare-fun e!7383 () Bool)

(declare-fun arrayRangesEq!6 (array!667 array!667 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!12156 (= e!7383 (arrayRangesEq!6 (buf!633 (_2!749 lt!17717)) (buf!633 thiss!1486) (_1!764 lt!19490) (_2!764 lt!19490)))))

(declare-fun d!3970 () Bool)

(declare-fun res!11696 () Bool)

(declare-fun e!7382 () Bool)

(assert (=> d!3970 (=> res!11696 e!7382)))

(assert (=> d!3970 (= res!11696 (bvsge lt!18259 lt!18262))))

(assert (=> d!3970 (= (arrayBitRangesEq!0 (buf!633 (_2!749 lt!17717)) (buf!633 thiss!1486) lt!18259 lt!18262) e!7382)))

(declare-fun b!12157 () Bool)

(assert (=> b!12157 (= e!7379 call!241)))

(declare-fun b!12158 () Bool)

(assert (=> b!12158 (= e!7382 e!7381)))

(declare-fun res!11699 () Bool)

(assert (=> b!12158 (=> (not res!11699) (not e!7381))))

(assert (=> b!12158 (= res!11699 e!7383)))

(declare-fun res!11698 () Bool)

(assert (=> b!12158 (=> res!11698 e!7383)))

(assert (=> b!12158 (= res!11698 (bvsge (_1!764 lt!19490) (_2!764 lt!19490)))))

(declare-fun lt!19488 () (_ BitVec 32))

(assert (=> b!12158 (= lt!19488 ((_ extract 31 0) (bvsrem lt!18262 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!19489 () (_ BitVec 32))

(assert (=> b!12158 (= lt!19489 ((_ extract 31 0) (bvsrem lt!18259 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!10)

(assert (=> b!12158 (= lt!19490 (arrayBitIndices!0 lt!18259 lt!18262))))

(declare-fun b!12159 () Bool)

(declare-fun res!11700 () Bool)

(assert (=> b!12159 (= res!11700 (= lt!19488 #b00000000000000000000000000000000))))

(declare-fun e!7380 () Bool)

(assert (=> b!12159 (=> res!11700 e!7380)))

(assert (=> b!12159 (= e!7384 e!7380)))

(declare-fun bm!238 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!238 (= call!241 (byteRangesEq!0 (select (arr!708 (buf!633 (_2!749 lt!17717))) (_3!51 lt!19490)) (select (arr!708 (buf!633 thiss!1486)) (_3!51 lt!19490)) lt!19489 (ite c!900 lt!19488 #b00000000000000000000000000001000)))))

(declare-fun b!12160 () Bool)

(assert (=> b!12160 (= e!7380 (byteRangesEq!0 (select (arr!708 (buf!633 (_2!749 lt!17717))) (_4!5 lt!19490)) (select (arr!708 (buf!633 thiss!1486)) (_4!5 lt!19490)) #b00000000000000000000000000000000 lt!19488))))

(assert (= (and d!3970 (not res!11696)) b!12158))

(assert (= (and b!12158 (not res!11698)) b!12156))

(assert (= (and b!12158 res!11699) b!12155))

(assert (= (and b!12155 c!900) b!12157))

(assert (= (and b!12155 (not c!900)) b!12154))

(assert (= (and b!12154 res!11697) b!12159))

(assert (= (and b!12159 (not res!11700)) b!12160))

(assert (= (or b!12157 b!12154) bm!238))

(declare-fun m!18329 () Bool)

(assert (=> b!12156 m!18329))

(declare-fun m!18331 () Bool)

(assert (=> b!12158 m!18331))

(declare-fun m!18333 () Bool)

(assert (=> bm!238 m!18333))

(declare-fun m!18335 () Bool)

(assert (=> bm!238 m!18335))

(assert (=> bm!238 m!18333))

(assert (=> bm!238 m!18335))

(declare-fun m!18337 () Bool)

(assert (=> bm!238 m!18337))

(declare-fun m!18339 () Bool)

(assert (=> b!12160 m!18339))

(declare-fun m!18341 () Bool)

(assert (=> b!12160 m!18341))

(assert (=> b!12160 m!18339))

(assert (=> b!12160 m!18341))

(declare-fun m!18343 () Bool)

(assert (=> b!12160 m!18343))

(assert (=> b!11500 d!3970))

(assert (=> d!3502 d!3514))

(declare-fun d!3972 () Bool)

(assert (=> d!3972 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17717)))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486)) nBits!460)))

(assert (=> d!3972 true))

(declare-fun _$6!174 () Unit!972)

(assert (=> d!3972 (= (choose!9 thiss!1486 (buf!633 (_2!749 lt!17717)) nBits!460 (BitStream!543 (buf!633 (_2!749 lt!17717)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486))) _$6!174)))

(declare-fun bs!1105 () Bool)

(assert (= bs!1105 d!3972))

(assert (=> bs!1105 m!16517))

(assert (=> d!3502 d!3972))

(declare-fun d!3974 () Bool)

(declare-fun res!11701 () Bool)

(declare-fun e!7385 () Bool)

(assert (=> d!3974 (=> res!11701 e!7385)))

(assert (=> d!3974 (= res!11701 (= (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3974 (= (checkByteArrayBitContent!0 (_2!749 lt!17717) srcBuffer!6 (_1!748 lt!17715) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)) e!7385)))

(declare-fun b!12161 () Bool)

(declare-fun e!7386 () Bool)

(assert (=> b!12161 (= e!7385 e!7386)))

(declare-fun res!11702 () Bool)

(assert (=> b!12161 (=> (not res!11702) (not e!7386))))

(assert (=> b!12161 (= res!11702 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!708 srcBuffer!6) ((_ extract 31 0) (bvsdiv (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!708 (_1!748 lt!17715)) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!12162 () Bool)

(assert (=> b!12162 (= e!7386 (checkByteArrayBitContent!0 (_2!749 lt!17717) srcBuffer!6 (_1!748 lt!17715) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!3974 (not res!11701)) b!12161))

(assert (= (and b!12161 res!11702) b!12162))

(assert (=> b!12161 m!18085))

(assert (=> b!12161 m!18087))

(assert (=> b!12161 m!18043))

(assert (=> b!12161 m!18045))

(declare-fun m!18345 () Bool)

(assert (=> b!12162 m!18345))

(assert (=> b!11578 d!3974))

(declare-fun d!3976 () Bool)

(declare-fun c!901 () Bool)

(assert (=> d!3976 (= c!901 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7387 () List!167)

(assert (=> d!3976 (= (byteArrayBitContentToList!0 (_2!748 lt!18379) (_1!748 lt!18379) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!7387)))

(declare-fun b!12163 () Bool)

(assert (=> b!12163 (= e!7387 Nil!164)))

(declare-fun b!12164 () Bool)

(assert (=> b!12164 (= e!7387 (Cons!163 (not (= (bvand ((_ sign_extend 24) (select (arr!708 (_1!748 lt!18379)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!748 lt!18379) (_1!748 lt!18379) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3976 c!901) b!12163))

(assert (= (and d!3976 (not c!901)) b!12164))

(declare-fun m!18347 () Bool)

(assert (=> b!12164 m!18347))

(assert (=> b!12164 m!16731))

(declare-fun m!18349 () Bool)

(assert (=> b!12164 m!18349))

(assert (=> b!11544 d!3976))

(declare-fun b!12165 () Bool)

(declare-fun e!7389 () tuple2!1412)

(assert (=> b!12165 (= e!7389 (tuple2!1413 Nil!164 (_1!747 lt!17716)))))

(declare-fun b!12168 () Bool)

(declare-fun e!7388 () Bool)

(declare-fun lt!19492 () List!167)

(assert (=> b!12168 (= e!7388 (> (length!33 lt!19492) 0))))

(declare-fun b!12167 () Bool)

(assert (=> b!12167 (= e!7388 (isEmpty!38 lt!19492))))

(declare-fun lt!19493 () (_ BitVec 64))

(declare-fun lt!19491 () tuple2!1414)

(declare-fun b!12166 () Bool)

(assert (=> b!12166 (= e!7389 (tuple2!1413 (Cons!163 (_1!754 lt!19491) (bitStreamReadBitsIntoList!0 (_2!748 lt!18379) (_2!754 lt!19491) (bvsub nBits!460 lt!19493))) (_2!754 lt!19491)))))

(assert (=> b!12166 (= lt!19491 (readBit!0 (_1!747 lt!17716)))))

(assert (=> b!12166 (= lt!19493 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!3978 () Bool)

(assert (=> d!3978 e!7388))

(declare-fun c!903 () Bool)

(assert (=> d!3978 (= c!903 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3978 (= lt!19492 (_1!753 e!7389))))

(declare-fun c!902 () Bool)

(assert (=> d!3978 (= c!902 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3978 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3978 (= (bitStreamReadBitsIntoList!0 (_2!748 lt!18379) (_1!747 lt!17716) nBits!460) lt!19492)))

(assert (= (and d!3978 c!902) b!12165))

(assert (= (and d!3978 (not c!902)) b!12166))

(assert (= (and d!3978 c!903) b!12167))

(assert (= (and d!3978 (not c!903)) b!12168))

(declare-fun m!18351 () Bool)

(assert (=> b!12168 m!18351))

(declare-fun m!18353 () Bool)

(assert (=> b!12167 m!18353))

(declare-fun m!18355 () Bool)

(assert (=> b!12166 m!18355))

(assert (=> b!12166 m!16727))

(assert (=> b!11544 d!3978))

(declare-fun d!3980 () Bool)

(assert (=> d!3980 (= (remainingBits!0 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17717)))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486))) (bvsub (bvmul ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17717)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!1705 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1700 thiss!1486)))))))

(assert (=> d!3514 d!3980))

(declare-fun b!12169 () Bool)

(declare-fun e!7390 () Bool)

(declare-fun e!7395 () Bool)

(assert (=> b!12169 (= e!7390 e!7395)))

(declare-fun res!11704 () Bool)

(declare-fun call!242 () Bool)

(assert (=> b!12169 (= res!11704 call!242)))

(assert (=> b!12169 (=> (not res!11704) (not e!7395))))

(declare-fun b!12170 () Bool)

(declare-fun e!7392 () Bool)

(assert (=> b!12170 (= e!7392 e!7390)))

(declare-fun c!904 () Bool)

(declare-fun lt!19496 () tuple4!10)

(assert (=> b!12170 (= c!904 (= (_3!51 lt!19496) (_4!5 lt!19496)))))

(declare-fun e!7394 () Bool)

(declare-fun b!12171 () Bool)

(assert (=> b!12171 (= e!7394 (arrayRangesEq!6 (buf!633 thiss!1486) (buf!633 (_2!749 lt!17717)) (_1!764 lt!19496) (_2!764 lt!19496)))))

(declare-fun d!3982 () Bool)

(declare-fun res!11703 () Bool)

(declare-fun e!7393 () Bool)

(assert (=> d!3982 (=> res!11703 e!7393)))

(assert (=> d!3982 (= res!11703 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486))))))

(assert (=> d!3982 (= (arrayBitRangesEq!0 (buf!633 thiss!1486) (buf!633 (_2!749 lt!17717)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486))) e!7393)))

(declare-fun b!12172 () Bool)

(assert (=> b!12172 (= e!7390 call!242)))

(declare-fun b!12173 () Bool)

(assert (=> b!12173 (= e!7393 e!7392)))

(declare-fun res!11706 () Bool)

(assert (=> b!12173 (=> (not res!11706) (not e!7392))))

(assert (=> b!12173 (= res!11706 e!7394)))

(declare-fun res!11705 () Bool)

(assert (=> b!12173 (=> res!11705 e!7394)))

(assert (=> b!12173 (= res!11705 (bvsge (_1!764 lt!19496) (_2!764 lt!19496)))))

(declare-fun lt!19494 () (_ BitVec 32))

(assert (=> b!12173 (= lt!19494 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!19495 () (_ BitVec 32))

(assert (=> b!12173 (= lt!19495 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!12173 (= lt!19496 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486))))))

(declare-fun b!12174 () Bool)

(declare-fun res!11707 () Bool)

(assert (=> b!12174 (= res!11707 (= lt!19494 #b00000000000000000000000000000000))))

(declare-fun e!7391 () Bool)

(assert (=> b!12174 (=> res!11707 e!7391)))

(assert (=> b!12174 (= e!7395 e!7391)))

(declare-fun bm!239 () Bool)

(assert (=> bm!239 (= call!242 (byteRangesEq!0 (select (arr!708 (buf!633 thiss!1486)) (_3!51 lt!19496)) (select (arr!708 (buf!633 (_2!749 lt!17717))) (_3!51 lt!19496)) lt!19495 (ite c!904 lt!19494 #b00000000000000000000000000001000)))))

(declare-fun b!12175 () Bool)

(assert (=> b!12175 (= e!7391 (byteRangesEq!0 (select (arr!708 (buf!633 thiss!1486)) (_4!5 lt!19496)) (select (arr!708 (buf!633 (_2!749 lt!17717))) (_4!5 lt!19496)) #b00000000000000000000000000000000 lt!19494))))

(assert (= (and d!3982 (not res!11703)) b!12173))

(assert (= (and b!12173 (not res!11705)) b!12171))

(assert (= (and b!12173 res!11706) b!12170))

(assert (= (and b!12170 c!904) b!12172))

(assert (= (and b!12170 (not c!904)) b!12169))

(assert (= (and b!12169 res!11704) b!12174))

(assert (= (and b!12174 (not res!11707)) b!12175))

(assert (= (or b!12172 b!12169) bm!239))

(declare-fun m!18357 () Bool)

(assert (=> b!12171 m!18357))

(assert (=> b!12173 m!16543))

(declare-fun m!18359 () Bool)

(assert (=> b!12173 m!18359))

(declare-fun m!18361 () Bool)

(assert (=> bm!239 m!18361))

(declare-fun m!18363 () Bool)

(assert (=> bm!239 m!18363))

(assert (=> bm!239 m!18361))

(assert (=> bm!239 m!18363))

(declare-fun m!18365 () Bool)

(assert (=> bm!239 m!18365))

(declare-fun m!18367 () Bool)

(assert (=> b!12175 m!18367))

(declare-fun m!18369 () Bool)

(assert (=> b!12175 m!18369))

(assert (=> b!12175 m!18367))

(assert (=> b!12175 m!18369))

(declare-fun m!18371 () Bool)

(assert (=> b!12175 m!18371))

(assert (=> b!11564 d!3982))

(assert (=> b!11564 d!3544))

(declare-fun d!3984 () Bool)

(assert (=> d!3984 (= (remainingBits!0 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17717)))) ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17717))) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17717)))) (bvsub (bvmul ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17717)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!1705 (_2!749 lt!17717))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1700 (_2!749 lt!17717))))))))

(assert (=> d!3542 d!3984))

(assert (=> d!3542 d!3474))

(declare-fun d!3986 () Bool)

(assert (=> d!3986 (= (invariant!0 (currentBit!1700 (_2!748 lt!18379)) (currentByte!1705 (_2!748 lt!18379)) (size!288 (buf!633 (_2!748 lt!18379)))) (and (bvsge (currentBit!1700 (_2!748 lt!18379)) #b00000000000000000000000000000000) (bvslt (currentBit!1700 (_2!748 lt!18379)) #b00000000000000000000000000001000) (bvsge (currentByte!1705 (_2!748 lt!18379)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1705 (_2!748 lt!18379)) (size!288 (buf!633 (_2!748 lt!18379)))) (and (= (currentBit!1700 (_2!748 lt!18379)) #b00000000000000000000000000000000) (= (currentByte!1705 (_2!748 lt!18379)) (size!288 (buf!633 (_2!748 lt!18379))))))))))

(assert (=> b!11545 d!3986))

(declare-fun d!3988 () Bool)

(assert (=> d!3988 (= (invariant!0 (currentBit!1700 (BitStream!543 (buf!633 (_1!747 lt!17716)) (currentByte!1705 (_1!747 lt!17716)) (currentBit!1700 (_2!748 lt!17715)))) (currentByte!1705 (BitStream!543 (buf!633 (_1!747 lt!17716)) (currentByte!1705 (_1!747 lt!17716)) (currentBit!1700 (_2!748 lt!17715)))) (size!288 (buf!633 (BitStream!543 (buf!633 (_1!747 lt!17716)) (currentByte!1705 (_1!747 lt!17716)) (currentBit!1700 (_2!748 lt!17715)))))) (and (bvsge (currentBit!1700 (BitStream!543 (buf!633 (_1!747 lt!17716)) (currentByte!1705 (_1!747 lt!17716)) (currentBit!1700 (_2!748 lt!17715)))) #b00000000000000000000000000000000) (bvslt (currentBit!1700 (BitStream!543 (buf!633 (_1!747 lt!17716)) (currentByte!1705 (_1!747 lt!17716)) (currentBit!1700 (_2!748 lt!17715)))) #b00000000000000000000000000001000) (bvsge (currentByte!1705 (BitStream!543 (buf!633 (_1!747 lt!17716)) (currentByte!1705 (_1!747 lt!17716)) (currentBit!1700 (_2!748 lt!17715)))) #b00000000000000000000000000000000) (or (bvslt (currentByte!1705 (BitStream!543 (buf!633 (_1!747 lt!17716)) (currentByte!1705 (_1!747 lt!17716)) (currentBit!1700 (_2!748 lt!17715)))) (size!288 (buf!633 (BitStream!543 (buf!633 (_1!747 lt!17716)) (currentByte!1705 (_1!747 lt!17716)) (currentBit!1700 (_2!748 lt!17715)))))) (and (= (currentBit!1700 (BitStream!543 (buf!633 (_1!747 lt!17716)) (currentByte!1705 (_1!747 lt!17716)) (currentBit!1700 (_2!748 lt!17715)))) #b00000000000000000000000000000000) (= (currentByte!1705 (BitStream!543 (buf!633 (_1!747 lt!17716)) (currentByte!1705 (_1!747 lt!17716)) (currentBit!1700 (_2!748 lt!17715)))) (size!288 (buf!633 (BitStream!543 (buf!633 (_1!747 lt!17716)) (currentByte!1705 (_1!747 lt!17716)) (currentBit!1700 (_2!748 lt!17715))))))))))))

(assert (=> d!3466 d!3988))

(declare-fun b!12176 () Bool)

(declare-fun e!7397 () tuple2!1412)

(assert (=> b!12176 (= e!7397 (tuple2!1413 Nil!164 (_2!754 lt!17985)))))

(declare-fun b!12179 () Bool)

(declare-fun e!7396 () Bool)

(declare-fun lt!19498 () List!167)

(assert (=> b!12179 (= e!7396 (> (length!33 lt!19498) 0))))

(declare-fun b!12178 () Bool)

(assert (=> b!12178 (= e!7396 (isEmpty!38 lt!19498))))

(declare-fun lt!19499 () (_ BitVec 64))

(declare-fun lt!19497 () tuple2!1414)

(declare-fun b!12177 () Bool)

(assert (=> b!12177 (= e!7397 (tuple2!1413 (Cons!163 (_1!754 lt!19497) (bitStreamReadBitsIntoList!0 (_2!749 lt!17717) (_2!754 lt!19497) (bvsub (bvsub nBits!460 lt!17987) lt!19499))) (_2!754 lt!19497)))))

(assert (=> b!12177 (= lt!19497 (readBit!0 (_2!754 lt!17985)))))

(assert (=> b!12177 (= lt!19499 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!3990 () Bool)

(assert (=> d!3990 e!7396))

(declare-fun c!906 () Bool)

(assert (=> d!3990 (= c!906 (= (bvsub nBits!460 lt!17987) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3990 (= lt!19498 (_1!753 e!7397))))

(declare-fun c!905 () Bool)

(assert (=> d!3990 (= c!905 (= (bvsub nBits!460 lt!17987) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3990 (bvsge (bvsub nBits!460 lt!17987) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3990 (= (bitStreamReadBitsIntoList!0 (_2!749 lt!17717) (_2!754 lt!17985) (bvsub nBits!460 lt!17987)) lt!19498)))

(assert (= (and d!3990 c!905) b!12176))

(assert (= (and d!3990 (not c!905)) b!12177))

(assert (= (and d!3990 c!906) b!12178))

(assert (= (and d!3990 (not c!906)) b!12179))

(declare-fun m!18373 () Bool)

(assert (=> b!12179 m!18373))

(declare-fun m!18375 () Bool)

(assert (=> b!12178 m!18375))

(declare-fun m!18377 () Bool)

(assert (=> b!12177 m!18377))

(declare-fun m!18379 () Bool)

(assert (=> b!12177 m!18379))

(assert (=> b!11438 d!3990))

(declare-fun d!3992 () Bool)

(declare-fun e!7404 () Bool)

(assert (=> d!3992 e!7404))

(declare-fun res!11710 () Bool)

(assert (=> d!3992 (=> (not res!11710) (not e!7404))))

(declare-fun increaseBitIndex!0 (BitStream!542) tuple2!1406)

(assert (=> d!3992 (= res!11710 (= (buf!633 (_2!749 (increaseBitIndex!0 (_1!747 lt!17716)))) (buf!633 (_1!747 lt!17716))))))

(declare-fun lt!19516 () Bool)

(assert (=> d!3992 (= lt!19516 (not (= (bvand ((_ sign_extend 24) (select (arr!708 (buf!633 (_1!747 lt!17716))) (currentByte!1705 (_1!747 lt!17716)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1700 (_1!747 lt!17716))))) #b00000000000000000000000000000000)))))

(declare-fun lt!19517 () tuple2!1414)

(assert (=> d!3992 (= lt!19517 (tuple2!1415 (not (= (bvand ((_ sign_extend 24) (select (arr!708 (buf!633 (_1!747 lt!17716))) (currentByte!1705 (_1!747 lt!17716)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1700 (_1!747 lt!17716))))) #b00000000000000000000000000000000)) (_2!749 (increaseBitIndex!0 (_1!747 lt!17716)))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!3992 (validate_offset_bit!0 ((_ sign_extend 32) (size!288 (buf!633 (_1!747 lt!17716)))) ((_ sign_extend 32) (currentByte!1705 (_1!747 lt!17716))) ((_ sign_extend 32) (currentBit!1700 (_1!747 lt!17716))))))

(assert (=> d!3992 (= (readBit!0 (_1!747 lt!17716)) lt!19517)))

(declare-fun lt!19520 () (_ BitVec 64))

(declare-fun b!12182 () Bool)

(declare-fun lt!19515 () (_ BitVec 64))

(assert (=> b!12182 (= e!7404 (= (bitIndex!0 (size!288 (buf!633 (_2!749 (increaseBitIndex!0 (_1!747 lt!17716))))) (currentByte!1705 (_2!749 (increaseBitIndex!0 (_1!747 lt!17716)))) (currentBit!1700 (_2!749 (increaseBitIndex!0 (_1!747 lt!17716))))) (bvadd lt!19515 lt!19520)))))

(assert (=> b!12182 (or (not (= (bvand lt!19515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19520 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!19515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!19515 lt!19520) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12182 (= lt!19520 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!12182 (= lt!19515 (bitIndex!0 (size!288 (buf!633 (_1!747 lt!17716))) (currentByte!1705 (_1!747 lt!17716)) (currentBit!1700 (_1!747 lt!17716))))))

(declare-fun lt!19514 () Bool)

(assert (=> b!12182 (= lt!19514 (not (= (bvand ((_ sign_extend 24) (select (arr!708 (buf!633 (_1!747 lt!17716))) (currentByte!1705 (_1!747 lt!17716)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1700 (_1!747 lt!17716))))) #b00000000000000000000000000000000)))))

(declare-fun lt!19519 () Bool)

(assert (=> b!12182 (= lt!19519 (not (= (bvand ((_ sign_extend 24) (select (arr!708 (buf!633 (_1!747 lt!17716))) (currentByte!1705 (_1!747 lt!17716)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1700 (_1!747 lt!17716))))) #b00000000000000000000000000000000)))))

(declare-fun lt!19518 () Bool)

(assert (=> b!12182 (= lt!19518 (not (= (bvand ((_ sign_extend 24) (select (arr!708 (buf!633 (_1!747 lt!17716))) (currentByte!1705 (_1!747 lt!17716)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1700 (_1!747 lt!17716))))) #b00000000000000000000000000000000)))))

(assert (= (and d!3992 res!11710) b!12182))

(declare-fun m!18381 () Bool)

(assert (=> d!3992 m!18381))

(declare-fun m!18383 () Bool)

(assert (=> d!3992 m!18383))

(declare-fun m!18385 () Bool)

(assert (=> d!3992 m!18385))

(declare-fun m!18387 () Bool)

(assert (=> d!3992 m!18387))

(declare-fun m!18389 () Bool)

(assert (=> b!12182 m!18389))

(assert (=> b!12182 m!18383))

(assert (=> b!12182 m!18385))

(assert (=> b!12182 m!16953))

(assert (=> b!12182 m!18381))

(assert (=> b!11438 d!3992))

(declare-fun d!3994 () Bool)

(assert (=> d!3994 (= (invariant!0 (currentBit!1700 (_2!749 lt!17970)) (currentByte!1705 (_2!749 lt!17970)) (size!288 (buf!633 (_2!749 lt!17970)))) (and (bvsge (currentBit!1700 (_2!749 lt!17970)) #b00000000000000000000000000000000) (bvslt (currentBit!1700 (_2!749 lt!17970)) #b00000000000000000000000000001000) (bvsge (currentByte!1705 (_2!749 lt!17970)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1705 (_2!749 lt!17970)) (size!288 (buf!633 (_2!749 lt!17970)))) (and (= (currentBit!1700 (_2!749 lt!17970)) #b00000000000000000000000000000000) (= (currentByte!1705 (_2!749 lt!17970)) (size!288 (buf!633 (_2!749 lt!17970))))))))))

(assert (=> b!11421 d!3994))

(assert (=> d!3554 d!3552))

(declare-fun d!3996 () Bool)

(assert (=> d!3996 (checkByteArrayBitContent!0 (_2!749 lt!17717) srcBuffer!6 (_1!748 lt!17715) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(assert (=> d!3996 true))

(declare-fun _$35!14 () Unit!972)

(assert (=> d!3996 (= (choose!65 (_2!749 lt!17717) srcBuffer!6 (_1!748 lt!17715) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) _$35!14)))

(declare-fun bs!1106 () Bool)

(assert (= bs!1106 d!3996))

(assert (=> bs!1106 m!16529))

(assert (=> d!3554 d!3996))

(declare-fun d!3998 () Bool)

(assert (=> d!3998 (= (isEmpty!38 lt!17986) (is-Nil!164 lt!17986))))

(assert (=> b!11439 d!3998))

(declare-fun d!4000 () Bool)

(assert (=> d!4000 (= (remainingBits!0 ((_ sign_extend 32) (size!288 (buf!633 thiss!1486))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486))) (bvsub (bvmul ((_ sign_extend 32) (size!288 (buf!633 thiss!1486))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!1705 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1700 thiss!1486)))))))

(assert (=> d!3530 d!4000))

(assert (=> d!3508 d!3538))

(assert (=> d!3508 d!3898))

(declare-fun d!4002 () Bool)

(declare-fun res!11712 () Bool)

(declare-fun e!7406 () Bool)

(assert (=> d!4002 (=> (not res!11712) (not e!7406))))

(assert (=> d!4002 (= res!11712 (= (size!288 (buf!633 lt!18255)) (size!288 (buf!633 lt!18255))))))

(assert (=> d!4002 (= (isPrefixOf!0 lt!18255 lt!18255) e!7406)))

(declare-fun b!12183 () Bool)

(declare-fun res!11713 () Bool)

(assert (=> b!12183 (=> (not res!11713) (not e!7406))))

(assert (=> b!12183 (= res!11713 (bvsle (bitIndex!0 (size!288 (buf!633 lt!18255)) (currentByte!1705 lt!18255) (currentBit!1700 lt!18255)) (bitIndex!0 (size!288 (buf!633 lt!18255)) (currentByte!1705 lt!18255) (currentBit!1700 lt!18255))))))

(declare-fun b!12184 () Bool)

(declare-fun e!7405 () Bool)

(assert (=> b!12184 (= e!7406 e!7405)))

(declare-fun res!11711 () Bool)

(assert (=> b!12184 (=> res!11711 e!7405)))

(assert (=> b!12184 (= res!11711 (= (size!288 (buf!633 lt!18255)) #b00000000000000000000000000000000))))

(declare-fun b!12185 () Bool)

(assert (=> b!12185 (= e!7405 (arrayBitRangesEq!0 (buf!633 lt!18255) (buf!633 lt!18255) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!288 (buf!633 lt!18255)) (currentByte!1705 lt!18255) (currentBit!1700 lt!18255))))))

(assert (= (and d!4002 res!11712) b!12183))

(assert (= (and b!12183 res!11713) b!12184))

(assert (= (and b!12184 (not res!11711)) b!12185))

(declare-fun m!18391 () Bool)

(assert (=> b!12183 m!18391))

(assert (=> b!12183 m!18391))

(assert (=> b!12185 m!18391))

(assert (=> b!12185 m!18391))

(declare-fun m!18393 () Bool)

(assert (=> b!12185 m!18393))

(assert (=> d!3508 d!4002))

(declare-fun d!4004 () Bool)

(declare-fun res!11715 () Bool)

(declare-fun e!7408 () Bool)

(assert (=> d!4004 (=> (not res!11715) (not e!7408))))

(assert (=> d!4004 (= res!11715 (= (size!288 (buf!633 (_1!747 lt!18260))) (size!288 (buf!633 (_2!747 lt!18260)))))))

(assert (=> d!4004 (= (isPrefixOf!0 (_1!747 lt!18260) (_2!747 lt!18260)) e!7408)))

(declare-fun b!12186 () Bool)

(declare-fun res!11716 () Bool)

(assert (=> b!12186 (=> (not res!11716) (not e!7408))))

(assert (=> b!12186 (= res!11716 (bvsle (bitIndex!0 (size!288 (buf!633 (_1!747 lt!18260))) (currentByte!1705 (_1!747 lt!18260)) (currentBit!1700 (_1!747 lt!18260))) (bitIndex!0 (size!288 (buf!633 (_2!747 lt!18260))) (currentByte!1705 (_2!747 lt!18260)) (currentBit!1700 (_2!747 lt!18260)))))))

(declare-fun b!12187 () Bool)

(declare-fun e!7407 () Bool)

(assert (=> b!12187 (= e!7408 e!7407)))

(declare-fun res!11714 () Bool)

(assert (=> b!12187 (=> res!11714 e!7407)))

(assert (=> b!12187 (= res!11714 (= (size!288 (buf!633 (_1!747 lt!18260))) #b00000000000000000000000000000000))))

(declare-fun b!12188 () Bool)

(assert (=> b!12188 (= e!7407 (arrayBitRangesEq!0 (buf!633 (_1!747 lt!18260)) (buf!633 (_2!747 lt!18260)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!288 (buf!633 (_1!747 lt!18260))) (currentByte!1705 (_1!747 lt!18260)) (currentBit!1700 (_1!747 lt!18260)))))))

(assert (= (and d!4004 res!11715) b!12186))

(assert (= (and b!12186 res!11716) b!12187))

(assert (= (and b!12187 (not res!11714)) b!12188))

(assert (=> b!12186 m!18055))

(assert (=> b!12186 m!18065))

(assert (=> b!12188 m!18055))

(assert (=> b!12188 m!18055))

(declare-fun m!18395 () Bool)

(assert (=> b!12188 m!18395))

(assert (=> d!3508 d!4004))

(declare-fun d!4006 () Bool)

(assert (=> d!4006 (isPrefixOf!0 lt!18255 (_2!749 lt!17717))))

(declare-fun lt!19521 () Unit!972)

(assert (=> d!4006 (= lt!19521 (choose!30 lt!18255 thiss!1486 (_2!749 lt!17717)))))

(assert (=> d!4006 (isPrefixOf!0 lt!18255 thiss!1486)))

(assert (=> d!4006 (= (lemmaIsPrefixTransitive!0 lt!18255 thiss!1486 (_2!749 lt!17717)) lt!19521)))

(declare-fun bs!1107 () Bool)

(assert (= bs!1107 d!4006))

(assert (=> bs!1107 m!16837))

(declare-fun m!18397 () Bool)

(assert (=> bs!1107 m!18397))

(declare-fun m!18399 () Bool)

(assert (=> bs!1107 m!18399))

(assert (=> d!3508 d!4006))

(declare-fun d!4008 () Bool)

(assert (=> d!4008 (isPrefixOf!0 lt!18255 lt!18255)))

(declare-fun lt!19522 () Unit!972)

(assert (=> d!4008 (= lt!19522 (choose!11 lt!18255))))

(assert (=> d!4008 (= (lemmaIsPrefixRefl!0 lt!18255) lt!19522)))

(declare-fun bs!1108 () Bool)

(assert (= bs!1108 d!4008))

(assert (=> bs!1108 m!16841))

(declare-fun m!18401 () Bool)

(assert (=> bs!1108 m!18401))

(assert (=> d!3508 d!4008))

(declare-fun d!4010 () Bool)

(assert (=> d!4010 (isPrefixOf!0 (_2!749 lt!17717) (_2!749 lt!17717))))

(declare-fun lt!19523 () Unit!972)

(assert (=> d!4010 (= lt!19523 (choose!11 (_2!749 lt!17717)))))

(assert (=> d!4010 (= (lemmaIsPrefixRefl!0 (_2!749 lt!17717)) lt!19523)))

(declare-fun bs!1109 () Bool)

(assert (= bs!1109 d!4010))

(assert (=> bs!1109 m!16831))

(declare-fun m!18403 () Bool)

(assert (=> bs!1109 m!18403))

(assert (=> d!3508 d!4010))

(assert (=> d!3508 d!3896))

(declare-fun d!4012 () Bool)

(declare-fun res!11718 () Bool)

(declare-fun e!7410 () Bool)

(assert (=> d!4012 (=> (not res!11718) (not e!7410))))

(assert (=> d!4012 (= res!11718 (= (size!288 (buf!633 (_2!749 lt!17717))) (size!288 (buf!633 (_2!749 lt!17717)))))))

(assert (=> d!4012 (= (isPrefixOf!0 (_2!749 lt!17717) (_2!749 lt!17717)) e!7410)))

(declare-fun b!12189 () Bool)

(declare-fun res!11719 () Bool)

(assert (=> b!12189 (=> (not res!11719) (not e!7410))))

(assert (=> b!12189 (= res!11719 (bvsle (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17717))) (currentByte!1705 (_2!749 lt!17717)) (currentBit!1700 (_2!749 lt!17717))) (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17717))) (currentByte!1705 (_2!749 lt!17717)) (currentBit!1700 (_2!749 lt!17717)))))))

(declare-fun b!12190 () Bool)

(declare-fun e!7409 () Bool)

(assert (=> b!12190 (= e!7410 e!7409)))

(declare-fun res!11717 () Bool)

(assert (=> b!12190 (=> res!11717 e!7409)))

(assert (=> b!12190 (= res!11717 (= (size!288 (buf!633 (_2!749 lt!17717))) #b00000000000000000000000000000000))))

(declare-fun b!12191 () Bool)

(assert (=> b!12191 (= e!7409 (arrayBitRangesEq!0 (buf!633 (_2!749 lt!17717)) (buf!633 (_2!749 lt!17717)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17717))) (currentByte!1705 (_2!749 lt!17717)) (currentBit!1700 (_2!749 lt!17717)))))))

(assert (= (and d!4012 res!11718) b!12189))

(assert (= (and b!12189 res!11719) b!12190))

(assert (= (and b!12190 (not res!11717)) b!12191))

(assert (=> b!12189 m!16541))

(assert (=> b!12189 m!16541))

(assert (=> b!12191 m!16541))

(assert (=> b!12191 m!16541))

(declare-fun m!18405 () Bool)

(assert (=> b!12191 m!18405))

(assert (=> d!3508 d!4012))

(declare-fun d!4014 () Bool)

(declare-fun res!11721 () Bool)

(declare-fun e!7412 () Bool)

(assert (=> d!4014 (=> (not res!11721) (not e!7412))))

(assert (=> d!4014 (= res!11721 (= (size!288 (buf!633 lt!18255)) (size!288 (buf!633 (_2!749 lt!17717)))))))

(assert (=> d!4014 (= (isPrefixOf!0 lt!18255 (_2!749 lt!17717)) e!7412)))

(declare-fun b!12192 () Bool)

(declare-fun res!11722 () Bool)

(assert (=> b!12192 (=> (not res!11722) (not e!7412))))

(assert (=> b!12192 (= res!11722 (bvsle (bitIndex!0 (size!288 (buf!633 lt!18255)) (currentByte!1705 lt!18255) (currentBit!1700 lt!18255)) (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17717))) (currentByte!1705 (_2!749 lt!17717)) (currentBit!1700 (_2!749 lt!17717)))))))

(declare-fun b!12193 () Bool)

(declare-fun e!7411 () Bool)

(assert (=> b!12193 (= e!7412 e!7411)))

(declare-fun res!11720 () Bool)

(assert (=> b!12193 (=> res!11720 e!7411)))

(assert (=> b!12193 (= res!11720 (= (size!288 (buf!633 lt!18255)) #b00000000000000000000000000000000))))

(declare-fun b!12194 () Bool)

(assert (=> b!12194 (= e!7411 (arrayBitRangesEq!0 (buf!633 lt!18255) (buf!633 (_2!749 lt!17717)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!288 (buf!633 lt!18255)) (currentByte!1705 lt!18255) (currentBit!1700 lt!18255))))))

(assert (= (and d!4014 res!11721) b!12192))

(assert (= (and b!12192 res!11722) b!12193))

(assert (= (and b!12193 (not res!11720)) b!12194))

(assert (=> b!12192 m!18391))

(assert (=> b!12192 m!16541))

(assert (=> b!12194 m!18391))

(assert (=> b!12194 m!18391))

(declare-fun m!18407 () Bool)

(assert (=> b!12194 m!18407))

(assert (=> d!3508 d!4014))

(declare-fun d!4016 () Bool)

(assert (=> d!4016 (isPrefixOf!0 lt!18255 (_2!749 lt!17717))))

(declare-fun lt!19524 () Unit!972)

(assert (=> d!4016 (= lt!19524 (choose!30 lt!18255 (_2!749 lt!17717) (_2!749 lt!17717)))))

(assert (=> d!4016 (isPrefixOf!0 lt!18255 (_2!749 lt!17717))))

(assert (=> d!4016 (= (lemmaIsPrefixTransitive!0 lt!18255 (_2!749 lt!17717) (_2!749 lt!17717)) lt!19524)))

(declare-fun bs!1110 () Bool)

(assert (= bs!1110 d!4016))

(assert (=> bs!1110 m!16837))

(declare-fun m!18409 () Bool)

(assert (=> bs!1110 m!18409))

(assert (=> bs!1110 m!16837))

(assert (=> d!3508 d!4016))

(declare-fun d!4018 () Bool)

(declare-fun res!11724 () Bool)

(declare-fun e!7414 () Bool)

(assert (=> d!4018 (=> (not res!11724) (not e!7414))))

(assert (=> d!4018 (= res!11724 (= (size!288 (buf!633 thiss!1486)) (size!288 (buf!633 (_2!749 lt!17970)))))))

(assert (=> d!4018 (= (isPrefixOf!0 thiss!1486 (_2!749 lt!17970)) e!7414)))

(declare-fun b!12195 () Bool)

(declare-fun res!11725 () Bool)

(assert (=> b!12195 (=> (not res!11725) (not e!7414))))

(assert (=> b!12195 (= res!11725 (bvsle (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)) (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17970))) (currentByte!1705 (_2!749 lt!17970)) (currentBit!1700 (_2!749 lt!17970)))))))

(declare-fun b!12196 () Bool)

(declare-fun e!7413 () Bool)

(assert (=> b!12196 (= e!7414 e!7413)))

(declare-fun res!11723 () Bool)

(assert (=> b!12196 (=> res!11723 e!7413)))

(assert (=> b!12196 (= res!11723 (= (size!288 (buf!633 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!12197 () Bool)

(assert (=> b!12197 (= e!7413 (arrayBitRangesEq!0 (buf!633 thiss!1486) (buf!633 (_2!749 lt!17970)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486))))))

(assert (= (and d!4018 res!11724) b!12195))

(assert (= (and b!12195 res!11725) b!12196))

(assert (= (and b!12196 (not res!11723)) b!12197))

(assert (=> b!12195 m!16543))

(assert (=> b!12195 m!16635))

(assert (=> b!12197 m!16543))

(assert (=> b!12197 m!16543))

(declare-fun m!18411 () Bool)

(assert (=> b!12197 m!18411))

(assert (=> b!11425 d!4018))

(declare-fun d!4020 () Bool)

(assert (=> d!4020 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 thiss!1486))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486)) lt!17943) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!288 (buf!633 thiss!1486))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486))) lt!17943))))

(declare-fun bs!1111 () Bool)

(assert (= bs!1111 d!4020))

(assert (=> bs!1111 m!16967))

(assert (=> b!11426 d!4020))

(declare-fun d!4022 () Bool)

(assert (=> d!4022 (= (invariant!0 (currentBit!1700 thiss!1486) (currentByte!1705 thiss!1486) (size!288 (buf!633 thiss!1486))) (and (bvsge (currentBit!1700 thiss!1486) #b00000000000000000000000000000000) (bvslt (currentBit!1700 thiss!1486) #b00000000000000000000000000001000) (bvsge (currentByte!1705 thiss!1486) #b00000000000000000000000000000000) (or (bvslt (currentByte!1705 thiss!1486) (size!288 (buf!633 thiss!1486))) (and (= (currentBit!1700 thiss!1486) #b00000000000000000000000000000000) (= (currentByte!1705 thiss!1486) (size!288 (buf!633 thiss!1486)))))))))

(assert (=> d!3548 d!4022))

(declare-fun d!4024 () Bool)

(declare-fun e!7417 () Bool)

(assert (=> d!4024 e!7417))

(declare-fun res!11728 () Bool)

(assert (=> d!4024 (=> (not res!11728) (not e!7417))))

(declare-fun lt!19530 () (_ BitVec 64))

(declare-fun lt!19529 () BitStream!542)

(assert (=> d!4024 (= res!11728 (= (bvadd lt!19530 (bvsub lt!18251 lt!18263)) (bitIndex!0 (size!288 (buf!633 lt!19529)) (currentByte!1705 lt!19529) (currentBit!1700 lt!19529))))))

(assert (=> d!4024 (or (not (= (bvand lt!19530 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18251 lt!18263) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!19530 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!19530 (bvsub lt!18251 lt!18263)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4024 (= lt!19530 (bitIndex!0 (size!288 (buf!633 (_2!747 lt!18260))) (currentByte!1705 (_2!747 lt!18260)) (currentBit!1700 (_2!747 lt!18260))))))

(declare-fun moveBitIndex!0 (BitStream!542 (_ BitVec 64)) tuple2!1406)

(assert (=> d!4024 (= lt!19529 (_2!749 (moveBitIndex!0 (_2!747 lt!18260) (bvsub lt!18251 lt!18263))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!542 (_ BitVec 64)) Bool)

(assert (=> d!4024 (moveBitIndexPrecond!0 (_2!747 lt!18260) (bvsub lt!18251 lt!18263))))

(assert (=> d!4024 (= (withMovedBitIndex!0 (_2!747 lt!18260) (bvsub lt!18251 lt!18263)) lt!19529)))

(declare-fun b!12200 () Bool)

(assert (=> b!12200 (= e!7417 (= (size!288 (buf!633 (_2!747 lt!18260))) (size!288 (buf!633 lt!19529))))))

(assert (= (and d!4024 res!11728) b!12200))

(declare-fun m!18413 () Bool)

(assert (=> d!4024 m!18413))

(assert (=> d!4024 m!18065))

(declare-fun m!18415 () Bool)

(assert (=> d!4024 m!18415))

(declare-fun m!18417 () Bool)

(assert (=> d!4024 m!18417))

(assert (=> b!11497 d!4024))

(assert (=> b!11497 d!3542))

(assert (=> b!11497 d!3544))

(declare-fun d!4026 () Bool)

(declare-fun e!7418 () Bool)

(assert (=> d!4026 e!7418))

(declare-fun res!11731 () Bool)

(assert (=> d!4026 (=> (not res!11731) (not e!7418))))

(declare-fun lt!19543 () tuple2!1402)

(assert (=> d!4026 (= res!11731 (isPrefixOf!0 (_1!747 lt!19543) (_2!747 lt!19543)))))

(declare-fun lt!19538 () BitStream!542)

(assert (=> d!4026 (= lt!19543 (tuple2!1403 lt!19538 (ite c!783 (_2!749 lt!17953) thiss!1486)))))

(declare-fun lt!19541 () Unit!972)

(declare-fun lt!19536 () Unit!972)

(assert (=> d!4026 (= lt!19541 lt!19536)))

(assert (=> d!4026 (isPrefixOf!0 lt!19538 (ite c!783 (_2!749 lt!17953) thiss!1486))))

(assert (=> d!4026 (= lt!19536 (lemmaIsPrefixTransitive!0 lt!19538 (ite c!783 (_2!749 lt!17953) thiss!1486) (ite c!783 (_2!749 lt!17953) thiss!1486)))))

(declare-fun lt!19548 () Unit!972)

(declare-fun lt!19547 () Unit!972)

(assert (=> d!4026 (= lt!19548 lt!19547)))

(assert (=> d!4026 (isPrefixOf!0 lt!19538 (ite c!783 (_2!749 lt!17953) thiss!1486))))

(assert (=> d!4026 (= lt!19547 (lemmaIsPrefixTransitive!0 lt!19538 thiss!1486 (ite c!783 (_2!749 lt!17953) thiss!1486)))))

(declare-fun lt!19537 () Unit!972)

(declare-fun e!7419 () Unit!972)

(assert (=> d!4026 (= lt!19537 e!7419)))

(declare-fun c!907 () Bool)

(assert (=> d!4026 (= c!907 (not (= (size!288 (buf!633 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!19532 () Unit!972)

(declare-fun lt!19544 () Unit!972)

(assert (=> d!4026 (= lt!19532 lt!19544)))

(assert (=> d!4026 (isPrefixOf!0 (ite c!783 (_2!749 lt!17953) thiss!1486) (ite c!783 (_2!749 lt!17953) thiss!1486))))

(assert (=> d!4026 (= lt!19544 (lemmaIsPrefixRefl!0 (ite c!783 (_2!749 lt!17953) thiss!1486)))))

(declare-fun lt!19535 () Unit!972)

(declare-fun lt!19533 () Unit!972)

(assert (=> d!4026 (= lt!19535 lt!19533)))

(assert (=> d!4026 (= lt!19533 (lemmaIsPrefixRefl!0 (ite c!783 (_2!749 lt!17953) thiss!1486)))))

(declare-fun lt!19540 () Unit!972)

(declare-fun lt!19549 () Unit!972)

(assert (=> d!4026 (= lt!19540 lt!19549)))

(assert (=> d!4026 (isPrefixOf!0 lt!19538 lt!19538)))

(assert (=> d!4026 (= lt!19549 (lemmaIsPrefixRefl!0 lt!19538))))

(declare-fun lt!19531 () Unit!972)

(declare-fun lt!19550 () Unit!972)

(assert (=> d!4026 (= lt!19531 lt!19550)))

(assert (=> d!4026 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!4026 (= lt!19550 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!4026 (= lt!19538 (BitStream!543 (buf!633 (ite c!783 (_2!749 lt!17953) thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)))))

(assert (=> d!4026 (isPrefixOf!0 thiss!1486 (ite c!783 (_2!749 lt!17953) thiss!1486))))

(assert (=> d!4026 (= (reader!0 thiss!1486 (ite c!783 (_2!749 lt!17953) thiss!1486)) lt!19543)))

(declare-fun lt!19534 () (_ BitVec 64))

(declare-fun lt!19546 () (_ BitVec 64))

(declare-fun b!12201 () Bool)

(assert (=> b!12201 (= e!7418 (= (_1!747 lt!19543) (withMovedBitIndex!0 (_2!747 lt!19543) (bvsub lt!19534 lt!19546))))))

(assert (=> b!12201 (or (= (bvand lt!19534 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19546 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19534 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19534 lt!19546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12201 (= lt!19546 (bitIndex!0 (size!288 (buf!633 (ite c!783 (_2!749 lt!17953) thiss!1486))) (currentByte!1705 (ite c!783 (_2!749 lt!17953) thiss!1486)) (currentBit!1700 (ite c!783 (_2!749 lt!17953) thiss!1486))))))

(assert (=> b!12201 (= lt!19534 (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)))))

(declare-fun b!12202 () Bool)

(declare-fun res!11730 () Bool)

(assert (=> b!12202 (=> (not res!11730) (not e!7418))))

(assert (=> b!12202 (= res!11730 (isPrefixOf!0 (_2!747 lt!19543) (ite c!783 (_2!749 lt!17953) thiss!1486)))))

(declare-fun b!12203 () Bool)

(declare-fun Unit!1037 () Unit!972)

(assert (=> b!12203 (= e!7419 Unit!1037)))

(declare-fun b!12204 () Bool)

(declare-fun lt!19539 () Unit!972)

(assert (=> b!12204 (= e!7419 lt!19539)))

(declare-fun lt!19542 () (_ BitVec 64))

(assert (=> b!12204 (= lt!19542 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19545 () (_ BitVec 64))

(assert (=> b!12204 (= lt!19545 (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)))))

(assert (=> b!12204 (= lt!19539 (arrayBitRangesEqSymmetric!0 (buf!633 thiss!1486) (buf!633 (ite c!783 (_2!749 lt!17953) thiss!1486)) lt!19542 lt!19545))))

(assert (=> b!12204 (arrayBitRangesEq!0 (buf!633 (ite c!783 (_2!749 lt!17953) thiss!1486)) (buf!633 thiss!1486) lt!19542 lt!19545)))

(declare-fun b!12205 () Bool)

(declare-fun res!11729 () Bool)

(assert (=> b!12205 (=> (not res!11729) (not e!7418))))

(assert (=> b!12205 (= res!11729 (isPrefixOf!0 (_1!747 lt!19543) thiss!1486))))

(assert (= (and d!4026 c!907) b!12204))

(assert (= (and d!4026 (not c!907)) b!12203))

(assert (= (and d!4026 res!11731) b!12205))

(assert (= (and b!12205 res!11729) b!12202))

(assert (= (and b!12202 res!11730) b!12201))

(declare-fun m!18419 () Bool)

(assert (=> d!4026 m!18419))

(declare-fun m!18421 () Bool)

(assert (=> d!4026 m!18421))

(assert (=> d!4026 m!16637))

(declare-fun m!18423 () Bool)

(assert (=> d!4026 m!18423))

(assert (=> d!4026 m!16639))

(declare-fun m!18425 () Bool)

(assert (=> d!4026 m!18425))

(declare-fun m!18427 () Bool)

(assert (=> d!4026 m!18427))

(declare-fun m!18429 () Bool)

(assert (=> d!4026 m!18429))

(declare-fun m!18431 () Bool)

(assert (=> d!4026 m!18431))

(declare-fun m!18433 () Bool)

(assert (=> d!4026 m!18433))

(declare-fun m!18435 () Bool)

(assert (=> d!4026 m!18435))

(declare-fun m!18437 () Bool)

(assert (=> b!12205 m!18437))

(declare-fun m!18439 () Bool)

(assert (=> b!12202 m!18439))

(declare-fun m!18441 () Bool)

(assert (=> b!12201 m!18441))

(declare-fun m!18443 () Bool)

(assert (=> b!12201 m!18443))

(assert (=> b!12201 m!16543))

(assert (=> b!12204 m!16543))

(declare-fun m!18445 () Bool)

(assert (=> b!12204 m!18445))

(declare-fun m!18447 () Bool)

(assert (=> b!12204 m!18447))

(assert (=> bm!206 d!4026))

(declare-fun d!4028 () Bool)

(declare-fun e!7429 () Bool)

(assert (=> d!4028 e!7429))

(declare-fun res!11746 () Bool)

(assert (=> d!4028 (=> (not res!11746) (not e!7429))))

(declare-fun lt!19630 () (_ BitVec 64))

(declare-fun lt!19644 () tuple3!90)

(assert (=> d!4028 (= res!11746 (= (bvsub lt!19630 #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!288 (buf!633 (_2!756 lt!19644))) (currentByte!1705 (_2!756 lt!19644)) (currentBit!1700 (_2!756 lt!19644)))))))

(assert (=> d!4028 (or (= (bvand lt!19630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19630 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!19654 () (_ BitVec 64))

(assert (=> d!4028 (= lt!19630 (bvadd lt!19654 nBits!460))))

(assert (=> d!4028 (or (not (= (bvand lt!19654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!19654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!19654 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4028 (= lt!19654 (bitIndex!0 (size!288 (buf!633 (_1!747 lt!17716))) (currentByte!1705 (_1!747 lt!17716)) (currentBit!1700 (_1!747 lt!17716))))))

(declare-fun e!7431 () tuple3!90)

(assert (=> d!4028 (= lt!19644 e!7431)))

(declare-fun c!910 () Bool)

(assert (=> d!4028 (= c!910 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!4028 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!4028 (= (readBitsLoop!0 (_1!747 lt!17716) nBits!460 (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!19644)))

(declare-fun b!12224 () Bool)

(declare-fun lt!19653 () Unit!972)

(declare-fun lt!19624 () tuple3!90)

(assert (=> b!12224 (= e!7431 (tuple3!91 lt!19653 (_2!756 lt!19624) (_3!48 lt!19624)))))

(declare-fun lt!19640 () tuple2!1414)

(assert (=> b!12224 (= lt!19640 (readBit!0 (_1!747 lt!17716)))))

(declare-fun lt!19648 () (_ BitVec 32))

(assert (=> b!12224 (= lt!19648 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!19647 () (_ BitVec 32))

(assert (=> b!12224 (= lt!19647 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!19650 () array!667)

(assert (=> b!12224 (= lt!19650 (array!668 (store (arr!708 (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!19648 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!708 (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!19648)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!19647)))) ((_ sign_extend 24) (ite (_1!754 lt!19640) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!19647) #b00000000))))) (size!288 (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!19626 () (_ BitVec 64))

(assert (=> b!12224 (= lt!19626 (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!19636 () (_ BitVec 64))

(assert (=> b!12224 (= lt!19636 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!19651 () Unit!972)

(assert (=> b!12224 (= lt!19651 (validateOffsetBitsIneqLemma!0 (_1!747 lt!17716) (_2!754 lt!19640) lt!19626 lt!19636))))

(assert (=> b!12224 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!754 lt!19640)))) ((_ sign_extend 32) (currentByte!1705 (_2!754 lt!19640))) ((_ sign_extend 32) (currentBit!1700 (_2!754 lt!19640))) (bvsub lt!19626 lt!19636))))

(declare-fun lt!19628 () Unit!972)

(assert (=> b!12224 (= lt!19628 lt!19651)))

(assert (=> b!12224 (= lt!19624 (readBitsLoop!0 (_2!754 lt!19640) nBits!460 lt!19650 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!460))))

(declare-fun res!11748 () Bool)

(assert (=> b!12224 (= res!11748 (= (bvsub (bvadd (bitIndex!0 (size!288 (buf!633 (_1!747 lt!17716))) (currentByte!1705 (_1!747 lt!17716)) (currentBit!1700 (_1!747 lt!17716))) nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!288 (buf!633 (_2!756 lt!19624))) (currentByte!1705 (_2!756 lt!19624)) (currentBit!1700 (_2!756 lt!19624)))))))

(declare-fun e!7430 () Bool)

(assert (=> b!12224 (=> (not res!11748) (not e!7430))))

(assert (=> b!12224 e!7430))

(declare-fun lt!19655 () Unit!972)

(declare-fun Unit!1038 () Unit!972)

(assert (=> b!12224 (= lt!19655 Unit!1038)))

(declare-fun lt!19633 () (_ BitVec 32))

(assert (=> b!12224 (= lt!19633 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!19643 () (_ BitVec 32))

(assert (=> b!12224 (= lt!19643 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!19652 () Unit!972)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!667 (_ BitVec 64) Bool) Unit!972)

(assert (=> b!12224 (= lt!19652 (arrayBitRangesUpdatedAtLemma!0 (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (_1!754 lt!19640)))))

(declare-fun call!247 () Bool)

(assert (=> b!12224 call!247))

(declare-fun lt!19639 () Unit!972)

(assert (=> b!12224 (= lt!19639 lt!19652)))

(declare-fun lt!19629 () (_ BitVec 64))

(assert (=> b!12224 (= lt!19629 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19634 () Unit!972)

(declare-fun arrayBitRangesEqTransitive!0 (array!667 array!667 array!667 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!972)

(assert (=> b!12224 (= lt!19634 (arrayBitRangesEqTransitive!0 (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!19650 (_3!48 lt!19624) lt!19629 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!12224 (arrayBitRangesEq!0 (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!48 lt!19624) lt!19629 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19649 () Unit!972)

(assert (=> b!12224 (= lt!19649 lt!19634)))

(declare-fun call!248 () Bool)

(assert (=> b!12224 call!248))

(declare-fun lt!19625 () Unit!972)

(declare-fun Unit!1039 () Unit!972)

(assert (=> b!12224 (= lt!19625 Unit!1039)))

(declare-fun lt!19627 () Unit!972)

(assert (=> b!12224 (= lt!19627 (arrayBitRangesEqImpliesEq!0 lt!19650 (_3!48 lt!19624) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!12224 (= (bitAt!0 lt!19650 #b0000000000000000000000000000000000000000000000000000000000000000) (bitAt!0 (_3!48 lt!19624) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!19632 () Unit!972)

(assert (=> b!12224 (= lt!19632 lt!19627)))

(declare-fun lt!19637 () Unit!972)

(declare-fun Unit!1040 () Unit!972)

(assert (=> b!12224 (= lt!19637 Unit!1040)))

(declare-fun lt!19657 () Bool)

(assert (=> b!12224 (= lt!19657 (= (bitAt!0 (_3!48 lt!19624) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!754 lt!19640)))))

(declare-fun Unit!1041 () Unit!972)

(assert (=> b!12224 (= lt!19653 Unit!1041)))

(assert (=> b!12224 lt!19657))

(declare-fun b!12225 () Bool)

(declare-fun res!11749 () Bool)

(assert (=> b!12225 (=> (not res!11749) (not e!7429))))

(assert (=> b!12225 (= res!11749 (invariant!0 (currentBit!1700 (_2!756 lt!19644)) (currentByte!1705 (_2!756 lt!19644)) (size!288 (buf!633 (_2!756 lt!19644)))))))

(declare-fun b!12226 () Bool)

(declare-fun res!11752 () Bool)

(assert (=> b!12226 (=> (not res!11752) (not e!7429))))

(declare-fun e!7428 () Bool)

(assert (=> b!12226 (= res!11752 e!7428)))

(declare-fun res!11750 () Bool)

(assert (=> b!12226 (=> res!11750 e!7428)))

(assert (=> b!12226 (= res!11750 (not (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun b!12227 () Bool)

(declare-fun lt!19645 () Unit!972)

(assert (=> b!12227 (= e!7431 (tuple3!91 lt!19645 (_1!747 lt!17716) (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-fun lt!19623 () Unit!972)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!667) Unit!972)

(assert (=> b!12227 (= lt!19623 (arrayBitRangesEqReflexiveLemma!0 (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(assert (=> b!12227 call!247))

(declare-fun lt!19631 () Unit!972)

(assert (=> b!12227 (= lt!19631 lt!19623)))

(declare-fun lt!19656 () array!667)

(assert (=> b!12227 (= lt!19656 (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!19638 () array!667)

(assert (=> b!12227 (= lt!19638 (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!19658 () (_ BitVec 64))

(assert (=> b!12227 (= lt!19658 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19642 () (_ BitVec 64))

(assert (=> b!12227 (= lt!19642 ((_ sign_extend 32) (size!288 (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!19635 () (_ BitVec 64))

(assert (=> b!12227 (= lt!19635 (bvmul lt!19642 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!19641 () (_ BitVec 64))

(assert (=> b!12227 (= lt!19641 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19646 () (_ BitVec 64))

(assert (=> b!12227 (= lt!19646 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!667 array!667 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!972)

(assert (=> b!12227 (= lt!19645 (arrayBitRangesEqSlicedLemma!0 lt!19656 lt!19638 lt!19658 lt!19635 lt!19641 lt!19646))))

(assert (=> b!12227 call!248))

(declare-fun bm!244 () Bool)

(assert (=> bm!244 (= call!247 (arrayBitRangesEq!0 (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (ite c!910 (array!668 (store (arr!708 (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!19633 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!708 (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!19633)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!19643)))) ((_ sign_extend 24) (ite (_1!754 lt!19640) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!19643) #b00000000))))) (size!288 (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!910 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!288 (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!12228 () Bool)

(declare-fun res!11751 () Bool)

(assert (=> b!12228 (=> (not res!11751) (not e!7429))))

(assert (=> b!12228 (= res!11751 (and (= (buf!633 (_1!747 lt!17716)) (buf!633 (_2!756 lt!19644))) (= (size!288 (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!288 (_3!48 lt!19644)))))))

(declare-fun bm!245 () Bool)

(assert (=> bm!245 (= call!248 (arrayBitRangesEq!0 (ite c!910 (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!19656) (ite c!910 (_3!48 lt!19624) lt!19638) (ite c!910 #b0000000000000000000000000000000000000000000000000000000000000000 lt!19641) (ite c!910 #b0000000000000000000000000000000000000000000000000000000000000000 lt!19646)))))

(declare-fun b!12229 () Bool)

(assert (=> b!12229 (= e!7428 (= (bitAt!0 (_3!48 lt!19644) #b0000000000000000000000000000000000000000000000000000000000000000) (_2!763 (readBitPure!0 (_1!747 lt!17716)))))))

(declare-fun b!12230 () Bool)

(declare-fun res!11747 () Bool)

(assert (=> b!12230 (=> (not res!11747) (not e!7429))))

(assert (=> b!12230 (= res!11747 (arrayBitRangesEq!0 (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!48 lt!19644) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!12231 () Bool)

(assert (=> b!12231 (= e!7430 (and (= (buf!633 (_1!747 lt!17716)) (buf!633 (_2!756 lt!19624))) (= (size!288 (array!668 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!288 (_3!48 lt!19624)))))))

(declare-fun b!12232 () Bool)

(assert (=> b!12232 (= e!7429 (= (byteArrayBitContentToList!0 (_2!756 lt!19644) (_3!48 lt!19644) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)) (bitStreamReadBitsIntoList!0 (_2!756 lt!19644) (_1!747 lt!17716) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!12232 (or (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12232 (or (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!4028 c!910) b!12224))

(assert (= (and d!4028 (not c!910)) b!12227))

(assert (= (and b!12224 res!11748) b!12231))

(assert (= (or b!12224 b!12227) bm!244))

(assert (= (or b!12224 b!12227) bm!245))

(assert (= (and d!4028 res!11746) b!12228))

(assert (= (and b!12228 res!11751) b!12230))

(assert (= (and b!12230 res!11747) b!12226))

(assert (= (and b!12226 (not res!11750)) b!12229))

(assert (= (and b!12226 res!11752) b!12225))

(assert (= (and b!12225 res!11749) b!12232))

(declare-fun m!18449 () Bool)

(assert (=> b!12232 m!18449))

(declare-fun m!18451 () Bool)

(assert (=> b!12232 m!18451))

(declare-fun m!18453 () Bool)

(assert (=> b!12227 m!18453))

(declare-fun m!18455 () Bool)

(assert (=> b!12227 m!18455))

(declare-fun m!18457 () Bool)

(assert (=> b!12229 m!18457))

(declare-fun m!18459 () Bool)

(assert (=> b!12229 m!18459))

(declare-fun m!18461 () Bool)

(assert (=> b!12224 m!18461))

(declare-fun m!18463 () Bool)

(assert (=> b!12224 m!18463))

(assert (=> b!12224 m!16727))

(declare-fun m!18465 () Bool)

(assert (=> b!12224 m!18465))

(declare-fun m!18467 () Bool)

(assert (=> b!12224 m!18467))

(declare-fun m!18469 () Bool)

(assert (=> b!12224 m!18469))

(declare-fun m!18471 () Bool)

(assert (=> b!12224 m!18471))

(declare-fun m!18473 () Bool)

(assert (=> b!12224 m!18473))

(declare-fun m!18475 () Bool)

(assert (=> b!12224 m!18475))

(declare-fun m!18477 () Bool)

(assert (=> b!12224 m!18477))

(declare-fun m!18479 () Bool)

(assert (=> b!12224 m!18479))

(declare-fun m!18481 () Bool)

(assert (=> b!12224 m!18481))

(declare-fun m!18483 () Bool)

(assert (=> b!12224 m!18483))

(assert (=> b!12224 m!16953))

(declare-fun m!18485 () Bool)

(assert (=> b!12224 m!18485))

(declare-fun m!18487 () Bool)

(assert (=> d!4028 m!18487))

(assert (=> d!4028 m!16953))

(declare-fun m!18489 () Bool)

(assert (=> b!12230 m!18489))

(declare-fun m!18491 () Bool)

(assert (=> bm!244 m!18491))

(declare-fun m!18493 () Bool)

(assert (=> bm!244 m!18493))

(declare-fun m!18495 () Bool)

(assert (=> bm!244 m!18495))

(declare-fun m!18497 () Bool)

(assert (=> bm!244 m!18497))

(declare-fun m!18499 () Bool)

(assert (=> b!12225 m!18499))

(declare-fun m!18501 () Bool)

(assert (=> bm!245 m!18501))

(assert (=> d!3516 d!4028))

(declare-fun d!4030 () Bool)

(declare-fun size!291 (List!167) Int)

(assert (=> d!4030 (= (length!33 lt!17986) (size!291 lt!17986))))

(declare-fun bs!1112 () Bool)

(assert (= bs!1112 d!4030))

(declare-fun m!18503 () Bool)

(assert (=> bs!1112 m!18503))

(assert (=> b!11440 d!4030))

(declare-fun d!4032 () Bool)

(declare-fun c!911 () Bool)

(assert (=> d!4032 (= c!911 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7432 () List!167)

(assert (=> d!4032 (= (byteArrayBitContentToList!0 (_2!749 lt!17970) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)) e!7432)))

(declare-fun b!12233 () Bool)

(assert (=> b!12233 (= e!7432 Nil!164)))

(declare-fun b!12234 () Bool)

(assert (=> b!12234 (= e!7432 (Cons!163 (not (= (bvand ((_ sign_extend 24) (select (arr!708 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!749 lt!17970) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!4032 c!911) b!12233))

(assert (= (and d!4032 (not c!911)) b!12234))

(assert (=> b!12234 m!16659))

(assert (=> b!12234 m!16971))

(declare-fun m!18505 () Bool)

(assert (=> b!12234 m!18505))

(assert (=> b!11423 d!4032))

(declare-fun d!4034 () Bool)

(assert (=> d!4034 (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17970)))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486)) lt!17943)))

(declare-fun lt!19659 () Unit!972)

(assert (=> d!4034 (= lt!19659 (choose!9 thiss!1486 (buf!633 (_2!749 lt!17970)) lt!17943 (BitStream!543 (buf!633 (_2!749 lt!17970)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486))))))

(assert (=> d!4034 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!633 (_2!749 lt!17970)) lt!17943) lt!19659)))

(declare-fun bs!1113 () Bool)

(assert (= bs!1113 d!4034))

(assert (=> bs!1113 m!16653))

(declare-fun m!18507 () Bool)

(assert (=> bs!1113 m!18507))

(assert (=> b!11423 d!4034))

(declare-fun d!4036 () Bool)

(assert (=> d!4036 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17970)))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486)) lt!17943) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!288 (buf!633 (_2!749 lt!17970)))) ((_ sign_extend 32) (currentByte!1705 thiss!1486)) ((_ sign_extend 32) (currentBit!1700 thiss!1486))) lt!17943))))

(declare-fun bs!1114 () Bool)

(assert (= bs!1114 d!4036))

(declare-fun m!18509 () Bool)

(assert (=> bs!1114 m!18509))

(assert (=> b!11423 d!4036))

(declare-fun b!12235 () Bool)

(declare-fun e!7434 () tuple2!1412)

(assert (=> b!12235 (= e!7434 (tuple2!1413 Nil!164 (_1!747 lt!17944)))))

(declare-fun b!12238 () Bool)

(declare-fun e!7433 () Bool)

(declare-fun lt!19661 () List!167)

(assert (=> b!12238 (= e!7433 (> (length!33 lt!19661) 0))))

(declare-fun b!12237 () Bool)

(assert (=> b!12237 (= e!7433 (isEmpty!38 lt!19661))))

(declare-fun lt!19660 () tuple2!1414)

(declare-fun lt!19662 () (_ BitVec 64))

(declare-fun b!12236 () Bool)

(assert (=> b!12236 (= e!7434 (tuple2!1413 (Cons!163 (_1!754 lt!19660) (bitStreamReadBitsIntoList!0 (_2!749 lt!17970) (_2!754 lt!19660) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) lt!19662))) (_2!754 lt!19660)))))

(assert (=> b!12236 (= lt!19660 (readBit!0 (_1!747 lt!17944)))))

(assert (=> b!12236 (= lt!19662 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!4038 () Bool)

(assert (=> d!4038 e!7433))

(declare-fun c!913 () Bool)

(assert (=> d!4038 (= c!913 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!4038 (= lt!19661 (_1!753 e!7434))))

(declare-fun c!912 () Bool)

(assert (=> d!4038 (= c!912 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!4038 (bvsge (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!4038 (= (bitStreamReadBitsIntoList!0 (_2!749 lt!17970) (_1!747 lt!17944) (bvsub (bvadd from!367 nBits!460) from!367)) lt!19661)))

(assert (= (and d!4038 c!912) b!12235))

(assert (= (and d!4038 (not c!912)) b!12236))

(assert (= (and d!4038 c!913) b!12237))

(assert (= (and d!4038 (not c!913)) b!12238))

(declare-fun m!18511 () Bool)

(assert (=> b!12238 m!18511))

(declare-fun m!18513 () Bool)

(assert (=> b!12237 m!18513))

(declare-fun m!18515 () Bool)

(assert (=> b!12236 m!18515))

(declare-fun m!18517 () Bool)

(assert (=> b!12236 m!18517))

(assert (=> b!11423 d!4038))

(declare-fun d!4040 () Bool)

(declare-fun e!7435 () Bool)

(assert (=> d!4040 e!7435))

(declare-fun res!11755 () Bool)

(assert (=> d!4040 (=> (not res!11755) (not e!7435))))

(declare-fun lt!19675 () tuple2!1402)

(assert (=> d!4040 (= res!11755 (isPrefixOf!0 (_1!747 lt!19675) (_2!747 lt!19675)))))

(declare-fun lt!19670 () BitStream!542)

(assert (=> d!4040 (= lt!19675 (tuple2!1403 lt!19670 (_2!749 lt!17970)))))

(declare-fun lt!19673 () Unit!972)

(declare-fun lt!19668 () Unit!972)

(assert (=> d!4040 (= lt!19673 lt!19668)))

(assert (=> d!4040 (isPrefixOf!0 lt!19670 (_2!749 lt!17970))))

(assert (=> d!4040 (= lt!19668 (lemmaIsPrefixTransitive!0 lt!19670 (_2!749 lt!17970) (_2!749 lt!17970)))))

(declare-fun lt!19680 () Unit!972)

(declare-fun lt!19679 () Unit!972)

(assert (=> d!4040 (= lt!19680 lt!19679)))

(assert (=> d!4040 (isPrefixOf!0 lt!19670 (_2!749 lt!17970))))

(assert (=> d!4040 (= lt!19679 (lemmaIsPrefixTransitive!0 lt!19670 thiss!1486 (_2!749 lt!17970)))))

(declare-fun lt!19669 () Unit!972)

(declare-fun e!7436 () Unit!972)

(assert (=> d!4040 (= lt!19669 e!7436)))

(declare-fun c!914 () Bool)

(assert (=> d!4040 (= c!914 (not (= (size!288 (buf!633 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!19664 () Unit!972)

(declare-fun lt!19676 () Unit!972)

(assert (=> d!4040 (= lt!19664 lt!19676)))

(assert (=> d!4040 (isPrefixOf!0 (_2!749 lt!17970) (_2!749 lt!17970))))

(assert (=> d!4040 (= lt!19676 (lemmaIsPrefixRefl!0 (_2!749 lt!17970)))))

(declare-fun lt!19667 () Unit!972)

(declare-fun lt!19665 () Unit!972)

(assert (=> d!4040 (= lt!19667 lt!19665)))

(assert (=> d!4040 (= lt!19665 (lemmaIsPrefixRefl!0 (_2!749 lt!17970)))))

(declare-fun lt!19672 () Unit!972)

(declare-fun lt!19681 () Unit!972)

(assert (=> d!4040 (= lt!19672 lt!19681)))

(assert (=> d!4040 (isPrefixOf!0 lt!19670 lt!19670)))

(assert (=> d!4040 (= lt!19681 (lemmaIsPrefixRefl!0 lt!19670))))

(declare-fun lt!19663 () Unit!972)

(declare-fun lt!19682 () Unit!972)

(assert (=> d!4040 (= lt!19663 lt!19682)))

(assert (=> d!4040 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!4040 (= lt!19682 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!4040 (= lt!19670 (BitStream!543 (buf!633 (_2!749 lt!17970)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)))))

(assert (=> d!4040 (isPrefixOf!0 thiss!1486 (_2!749 lt!17970))))

(assert (=> d!4040 (= (reader!0 thiss!1486 (_2!749 lt!17970)) lt!19675)))

(declare-fun lt!19666 () (_ BitVec 64))

(declare-fun b!12239 () Bool)

(declare-fun lt!19678 () (_ BitVec 64))

(assert (=> b!12239 (= e!7435 (= (_1!747 lt!19675) (withMovedBitIndex!0 (_2!747 lt!19675) (bvsub lt!19666 lt!19678))))))

(assert (=> b!12239 (or (= (bvand lt!19666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19678 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19666 lt!19678) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12239 (= lt!19678 (bitIndex!0 (size!288 (buf!633 (_2!749 lt!17970))) (currentByte!1705 (_2!749 lt!17970)) (currentBit!1700 (_2!749 lt!17970))))))

(assert (=> b!12239 (= lt!19666 (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)))))

(declare-fun b!12240 () Bool)

(declare-fun res!11754 () Bool)

(assert (=> b!12240 (=> (not res!11754) (not e!7435))))

(assert (=> b!12240 (= res!11754 (isPrefixOf!0 (_2!747 lt!19675) (_2!749 lt!17970)))))

(declare-fun b!12241 () Bool)

(declare-fun Unit!1042 () Unit!972)

(assert (=> b!12241 (= e!7436 Unit!1042)))

(declare-fun b!12242 () Bool)

(declare-fun lt!19671 () Unit!972)

(assert (=> b!12242 (= e!7436 lt!19671)))

(declare-fun lt!19674 () (_ BitVec 64))

(assert (=> b!12242 (= lt!19674 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19677 () (_ BitVec 64))

(assert (=> b!12242 (= lt!19677 (bitIndex!0 (size!288 (buf!633 thiss!1486)) (currentByte!1705 thiss!1486) (currentBit!1700 thiss!1486)))))

(assert (=> b!12242 (= lt!19671 (arrayBitRangesEqSymmetric!0 (buf!633 thiss!1486) (buf!633 (_2!749 lt!17970)) lt!19674 lt!19677))))

(assert (=> b!12242 (arrayBitRangesEq!0 (buf!633 (_2!749 lt!17970)) (buf!633 thiss!1486) lt!19674 lt!19677)))

(declare-fun b!12243 () Bool)

(declare-fun res!11753 () Bool)

(assert (=> b!12243 (=> (not res!11753) (not e!7435))))

(assert (=> b!12243 (= res!11753 (isPrefixOf!0 (_1!747 lt!19675) thiss!1486))))

(assert (= (and d!4040 c!914) b!12242))

(assert (= (and d!4040 (not c!914)) b!12241))

(assert (= (and d!4040 res!11755) b!12243))

(assert (= (and b!12243 res!11753) b!12240))

(assert (= (and b!12240 res!11754) b!12239))

(declare-fun m!18519 () Bool)

(assert (=> d!4040 m!18519))

(declare-fun m!18521 () Bool)

(assert (=> d!4040 m!18521))

(assert (=> d!4040 m!16637))

(declare-fun m!18523 () Bool)

(assert (=> d!4040 m!18523))

(assert (=> d!4040 m!16639))

(declare-fun m!18525 () Bool)

(assert (=> d!4040 m!18525))

(declare-fun m!18527 () Bool)

(assert (=> d!4040 m!18527))

(declare-fun m!18529 () Bool)

(assert (=> d!4040 m!18529))

(declare-fun m!18531 () Bool)

(assert (=> d!4040 m!18531))

(declare-fun m!18533 () Bool)

(assert (=> d!4040 m!18533))

(assert (=> d!4040 m!16645))

(declare-fun m!18535 () Bool)

(assert (=> b!12243 m!18535))

(declare-fun m!18537 () Bool)

(assert (=> b!12240 m!18537))

(declare-fun m!18539 () Bool)

(assert (=> b!12239 m!18539))

(assert (=> b!12239 m!16635))

(assert (=> b!12239 m!16543))

(assert (=> b!12242 m!16543))

(declare-fun m!18541 () Bool)

(assert (=> b!12242 m!18541))

(declare-fun m!18543 () Bool)

(assert (=> b!12242 m!18543))

(assert (=> b!11423 d!4040))

(assert (=> d!3544 d!4000))

(assert (=> d!3544 d!4022))

(push 1)

(assert (not b!12179))

(assert (not d!3958))

(assert (not b!12072))

(assert (not b!12044))

(assert (not b!12104))

(assert (not b!12100))

(assert (not d!4008))

(assert (not b!12067))

(assert (not b!12186))

(assert (not b!12098))

(assert (not d!3936))

(assert (not bm!238))

(assert (not bm!245))

(assert (not b!12071))

(assert (not b!12120))

(assert (not b!12134))

(assert (not b!12197))

(assert (not b!12058))

(assert (not b!12065))

(assert (not b!12204))

(assert (not d!4040))

(assert (not b!12201))

(assert (not d!3950))

(assert (not d!3968))

(assert (not b!12118))

(assert (not b!12042))

(assert (not b!12205))

(assert (not bm!239))

(assert (not b!12063))

(assert (not b!12094))

(assert (not b!12139))

(assert (not b!12177))

(assert (not b!12116))

(assert (not b!12242))

(assert (not b!12156))

(assert (not b!12075))

(assert (not b!12243))

(assert (not b!12122))

(assert (not b!12240))

(assert (not b!12175))

(assert (not b!12239))

(assert (not d!3942))

(assert (not b!12064))

(assert (not b!12192))

(assert (not b!12127))

(assert (not d!3946))

(assert (not b!12167))

(assert (not b!12110))

(assert (not b!12105))

(assert (not b!12182))

(assert (not b!12195))

(assert (not b!12166))

(assert (not d!3930))

(assert (not d!3890))

(assert (not b!12097))

(assert (not b!12113))

(assert (not b!12237))

(assert (not d!3904))

(assert (not b!12238))

(assert (not d!4036))

(assert (not b!12194))

(assert (not d!3894))

(assert (not b!12101))

(assert (not d!3952))

(assert (not b!12171))

(assert (not b!12164))

(assert (not b!12178))

(assert (not b!12173))

(assert (not b!12230))

(assert (not b!12103))

(assert (not b!12049))

(assert (not d!3964))

(assert (not b!12232))

(assert (not b!12132))

(assert (not b!12123))

(assert (not b!12136))

(assert (not b!12234))

(assert (not b!12108))

(assert (not b!12224))

(assert (not b!12183))

(assert (not d!3966))

(assert (not b!12225))

(assert (not b!12069))

(assert (not b!12137))

(assert (not d!3996))

(assert (not b!12068))

(assert (not d!3888))

(assert (not b!12037))

(assert (not d!3928))

(assert (not b!12106))

(assert (not b!12138))

(assert (not b!12236))

(assert (not d!4006))

(assert (not b!12185))

(assert (not b!12073))

(assert (not b!12047))

(assert (not d!3972))

(assert (not d!3962))

(assert (not b!12189))

(assert (not b!12119))

(assert (not b!12229))

(assert (not b!12191))

(assert (not d!3924))

(assert (not d!4026))

(assert (not d!3956))

(assert (not b!12057))

(assert (not b!12052))

(assert (not b!12160))

(assert (not d!4034))

(assert (not b!12202))

(assert (not b!12227))

(assert (not b!12158))

(assert (not d!4020))

(assert (not b!12096))

(assert (not d!3940))

(assert (not d!3938))

(assert (not d!3898))

(assert (not d!4028))

(assert (not d!3992))

(assert (not b!12054))

(assert (not d!4024))

(assert (not b!12055))

(assert (not b!12095))

(assert (not b!12099))

(assert (not bm!244))

(assert (not d!4030))

(assert (not d!3920))

(assert (not d!3910))

(assert (not b!12061))

(assert (not d!4010))

(assert (not b!12125))

(assert (not b!12126))

(assert (not b!12162))

(assert (not b!12050))

(assert (not b!12076))

(assert (not b!12188))

(assert (not d!4016))

(assert (not bm!235))

(assert (not b!12168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

