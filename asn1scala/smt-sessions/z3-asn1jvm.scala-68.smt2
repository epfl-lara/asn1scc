; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1318 () Bool)

(assert start!1318)

(declare-fun b!6030 () Bool)

(declare-fun res!7076 () Bool)

(declare-fun e!3841 () Bool)

(assert (=> b!6030 (=> (not res!7076) (not e!3841))))

(declare-datatypes ((array!437 0))(
  ( (array!438 (arr!584 (Array (_ BitVec 32) (_ BitVec 8))) (size!188 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!354 0))(
  ( (BitStream!355 (buf!515 array!437) (currentByte!1506 (_ BitVec 32)) (currentBit!1501 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!474 0))(
  ( (Unit!475) )
))
(declare-datatypes ((tuple2!796 0))(
  ( (tuple2!797 (_1!420 Unit!474) (_2!420 BitStream!354)) )
))
(declare-fun lt!7683 () tuple2!796)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!354)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!6030 (= res!7076 (= (bitIndex!0 (size!188 (buf!515 (_2!420 lt!7683))) (currentByte!1506 (_2!420 lt!7683)) (currentBit!1501 (_2!420 lt!7683))) (bvadd (bitIndex!0 (size!188 (buf!515 thiss!1486)) (currentByte!1506 thiss!1486) (currentBit!1501 thiss!1486)) nBits!460)))))

(declare-fun b!6031 () Bool)

(declare-fun res!7075 () Bool)

(declare-fun e!3844 () Bool)

(assert (=> b!6031 (=> res!7075 e!3844)))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!437)

(declare-datatypes ((List!88 0))(
  ( (Nil!85) (Cons!84 (h!203 Bool) (t!838 List!88)) )
))
(declare-fun lt!7681 () List!88)

(declare-fun byteArrayBitContentToList!0 (BitStream!354 array!437 (_ BitVec 64) (_ BitVec 64)) List!88)

(assert (=> b!6031 (= res!7075 (not (= lt!7681 (byteArrayBitContentToList!0 (_2!420 lt!7683) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!6032 () Bool)

(declare-fun res!7077 () Bool)

(assert (=> b!6032 (=> (not res!7077) (not e!3841))))

(assert (=> b!6032 (= res!7077 (= (size!188 (buf!515 thiss!1486)) (size!188 (buf!515 (_2!420 lt!7683)))))))

(declare-fun b!6033 () Bool)

(declare-fun e!3840 () Bool)

(assert (=> b!6033 (= e!3840 e!3841)))

(declare-fun res!7081 () Bool)

(assert (=> b!6033 (=> (not res!7081) (not e!3841))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!6033 (= res!7081 (invariant!0 (currentBit!1501 (_2!420 lt!7683)) (currentByte!1506 (_2!420 lt!7683)) (size!188 (buf!515 (_2!420 lt!7683)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!354 array!437 (_ BitVec 64) (_ BitVec 64)) tuple2!796)

(assert (=> b!6033 (= lt!7683 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!6034 () Bool)

(declare-fun e!3843 () Bool)

(assert (=> b!6034 (= e!3844 e!3843)))

(declare-fun res!7078 () Bool)

(assert (=> b!6034 (=> res!7078 e!3843)))

(declare-datatypes ((tuple2!798 0))(
  ( (tuple2!799 (_1!421 array!437) (_2!421 BitStream!354)) )
))
(declare-fun lt!7685 () tuple2!798)

(declare-fun checkByteArrayBitContent!0 (BitStream!354 array!437 array!437 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6034 (= res!7078 (not (checkByteArrayBitContent!0 (_2!420 lt!7683) srcBuffer!6 (_1!421 lt!7685) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!7684 () Unit!474)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!354 array!437 array!437 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!474)

(assert (=> b!6034 (= lt!7684 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!420 lt!7683) srcBuffer!6 (_1!421 lt!7685) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!6035 () Bool)

(assert (=> b!6035 (= e!3843 (invariant!0 (currentBit!1501 thiss!1486) (currentByte!1506 thiss!1486) (size!188 (buf!515 thiss!1486))))))

(declare-fun b!6036 () Bool)

(declare-fun e!3839 () Bool)

(declare-fun array_inv!183 (array!437) Bool)

(assert (=> b!6036 (= e!3839 (array_inv!183 (buf!515 thiss!1486)))))

(declare-fun b!6037 () Bool)

(declare-fun res!7080 () Bool)

(assert (=> b!6037 (=> (not res!7080) (not e!3840))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6037 (= res!7080 (validate_offset_bits!1 ((_ sign_extend 32) (size!188 (buf!515 thiss!1486))) ((_ sign_extend 32) (currentByte!1506 thiss!1486)) ((_ sign_extend 32) (currentBit!1501 thiss!1486)) nBits!460))))

(declare-fun b!6038 () Bool)

(assert (=> b!6038 (= e!3841 (not e!3844))))

(declare-fun res!7079 () Bool)

(assert (=> b!6038 (=> res!7079 e!3844)))

(assert (=> b!6038 (= res!7079 (not (= (byteArrayBitContentToList!0 (_2!420 lt!7683) (_1!421 lt!7685) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!7681)))))

(declare-datatypes ((tuple2!800 0))(
  ( (tuple2!801 (_1!422 BitStream!354) (_2!422 BitStream!354)) )
))
(declare-fun lt!7682 () tuple2!800)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!354 BitStream!354 (_ BitVec 64)) List!88)

(assert (=> b!6038 (= lt!7681 (bitStreamReadBitsIntoList!0 (_2!420 lt!7683) (_1!422 lt!7682) nBits!460))))

(declare-fun readBits!0 (BitStream!354 (_ BitVec 64)) tuple2!798)

(assert (=> b!6038 (= lt!7685 (readBits!0 (_1!422 lt!7682) nBits!460))))

(assert (=> b!6038 (validate_offset_bits!1 ((_ sign_extend 32) (size!188 (buf!515 (_2!420 lt!7683)))) ((_ sign_extend 32) (currentByte!1506 thiss!1486)) ((_ sign_extend 32) (currentBit!1501 thiss!1486)) nBits!460)))

(declare-fun lt!7680 () Unit!474)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!354 array!437 (_ BitVec 64)) Unit!474)

(assert (=> b!6038 (= lt!7680 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!515 (_2!420 lt!7683)) nBits!460))))

(declare-fun reader!0 (BitStream!354 BitStream!354) tuple2!800)

(assert (=> b!6038 (= lt!7682 (reader!0 thiss!1486 (_2!420 lt!7683)))))

(declare-fun res!7074 () Bool)

(assert (=> start!1318 (=> (not res!7074) (not e!3840))))

(assert (=> start!1318 (= res!7074 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!188 srcBuffer!6))))))))

(assert (=> start!1318 e!3840))

(assert (=> start!1318 true))

(assert (=> start!1318 (array_inv!183 srcBuffer!6)))

(declare-fun inv!12 (BitStream!354) Bool)

(assert (=> start!1318 (and (inv!12 thiss!1486) e!3839)))

(declare-fun b!6039 () Bool)

(declare-fun res!7073 () Bool)

(assert (=> b!6039 (=> (not res!7073) (not e!3841))))

(declare-fun isPrefixOf!0 (BitStream!354 BitStream!354) Bool)

(assert (=> b!6039 (= res!7073 (isPrefixOf!0 thiss!1486 (_2!420 lt!7683)))))

(assert (= (and start!1318 res!7074) b!6037))

(assert (= (and b!6037 res!7080) b!6033))

(assert (= (and b!6033 res!7081) b!6032))

(assert (= (and b!6032 res!7077) b!6030))

(assert (= (and b!6030 res!7076) b!6039))

(assert (= (and b!6039 res!7073) b!6038))

(assert (= (and b!6038 (not res!7079)) b!6031))

(assert (= (and b!6031 (not res!7075)) b!6034))

(assert (= (and b!6034 (not res!7078)) b!6035))

(assert (= start!1318 b!6036))

(declare-fun m!7523 () Bool)

(assert (=> start!1318 m!7523))

(declare-fun m!7525 () Bool)

(assert (=> start!1318 m!7525))

(declare-fun m!7527 () Bool)

(assert (=> b!6036 m!7527))

(declare-fun m!7529 () Bool)

(assert (=> b!6035 m!7529))

(declare-fun m!7531 () Bool)

(assert (=> b!6037 m!7531))

(declare-fun m!7533 () Bool)

(assert (=> b!6038 m!7533))

(declare-fun m!7535 () Bool)

(assert (=> b!6038 m!7535))

(declare-fun m!7537 () Bool)

(assert (=> b!6038 m!7537))

(declare-fun m!7539 () Bool)

(assert (=> b!6038 m!7539))

(declare-fun m!7541 () Bool)

(assert (=> b!6038 m!7541))

(declare-fun m!7543 () Bool)

(assert (=> b!6038 m!7543))

(declare-fun m!7545 () Bool)

(assert (=> b!6033 m!7545))

(declare-fun m!7547 () Bool)

(assert (=> b!6033 m!7547))

(declare-fun m!7549 () Bool)

(assert (=> b!6030 m!7549))

(declare-fun m!7551 () Bool)

(assert (=> b!6030 m!7551))

(declare-fun m!7553 () Bool)

(assert (=> b!6039 m!7553))

(declare-fun m!7555 () Bool)

(assert (=> b!6034 m!7555))

(declare-fun m!7557 () Bool)

(assert (=> b!6034 m!7557))

(declare-fun m!7559 () Bool)

(assert (=> b!6031 m!7559))

(check-sat (not b!6035) (not b!6034) (not b!6039) (not b!6031) (not b!6037) (not start!1318) (not b!6033) (not b!6038) (not b!6030) (not b!6036))
(check-sat)
(get-model)

(declare-fun d!2002 () Bool)

(declare-fun res!7124 () Bool)

(declare-fun e!3883 () Bool)

(assert (=> d!2002 (=> (not res!7124) (not e!3883))))

(assert (=> d!2002 (= res!7124 (= (size!188 (buf!515 thiss!1486)) (size!188 (buf!515 (_2!420 lt!7683)))))))

(assert (=> d!2002 (= (isPrefixOf!0 thiss!1486 (_2!420 lt!7683)) e!3883)))

(declare-fun b!6088 () Bool)

(declare-fun res!7123 () Bool)

(assert (=> b!6088 (=> (not res!7123) (not e!3883))))

(assert (=> b!6088 (= res!7123 (bvsle (bitIndex!0 (size!188 (buf!515 thiss!1486)) (currentByte!1506 thiss!1486) (currentBit!1501 thiss!1486)) (bitIndex!0 (size!188 (buf!515 (_2!420 lt!7683))) (currentByte!1506 (_2!420 lt!7683)) (currentBit!1501 (_2!420 lt!7683)))))))

(declare-fun b!6089 () Bool)

(declare-fun e!3882 () Bool)

(assert (=> b!6089 (= e!3883 e!3882)))

(declare-fun res!7125 () Bool)

(assert (=> b!6089 (=> res!7125 e!3882)))

(assert (=> b!6089 (= res!7125 (= (size!188 (buf!515 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!6090 () Bool)

(declare-fun arrayBitRangesEq!0 (array!437 array!437 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6090 (= e!3882 (arrayBitRangesEq!0 (buf!515 thiss!1486) (buf!515 (_2!420 lt!7683)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!188 (buf!515 thiss!1486)) (currentByte!1506 thiss!1486) (currentBit!1501 thiss!1486))))))

(assert (= (and d!2002 res!7124) b!6088))

(assert (= (and b!6088 res!7123) b!6089))

(assert (= (and b!6089 (not res!7125)) b!6090))

(assert (=> b!6088 m!7551))

(assert (=> b!6088 m!7549))

(assert (=> b!6090 m!7551))

(assert (=> b!6090 m!7551))

(declare-fun m!7617 () Bool)

(assert (=> b!6090 m!7617))

(assert (=> b!6039 d!2002))

(declare-fun d!2006 () Bool)

(assert (=> d!2006 (= (array_inv!183 srcBuffer!6) (bvsge (size!188 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1318 d!2006))

(declare-fun d!2010 () Bool)

(assert (=> d!2010 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1501 thiss!1486) (currentByte!1506 thiss!1486) (size!188 (buf!515 thiss!1486))))))

(declare-fun bs!721 () Bool)

(assert (= bs!721 d!2010))

(assert (=> bs!721 m!7529))

(assert (=> start!1318 d!2010))

(declare-fun d!2016 () Bool)

(declare-fun res!7140 () Bool)

(declare-fun e!3892 () Bool)

(assert (=> d!2016 (=> res!7140 e!3892)))

(assert (=> d!2016 (= res!7140 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2016 (= (checkByteArrayBitContent!0 (_2!420 lt!7683) srcBuffer!6 (_1!421 lt!7685) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!3892)))

(declare-fun b!6107 () Bool)

(declare-fun e!3893 () Bool)

(assert (=> b!6107 (= e!3892 e!3893)))

(declare-fun res!7141 () Bool)

(assert (=> b!6107 (=> (not res!7141) (not e!3893))))

(assert (=> b!6107 (= res!7141 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!584 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!584 (_1!421 lt!7685)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!6108 () Bool)

(assert (=> b!6108 (= e!3893 (checkByteArrayBitContent!0 (_2!420 lt!7683) srcBuffer!6 (_1!421 lt!7685) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!2016 (not res!7140)) b!6107))

(assert (= (and b!6107 res!7141) b!6108))

(declare-fun m!7625 () Bool)

(assert (=> b!6107 m!7625))

(declare-fun m!7627 () Bool)

(assert (=> b!6107 m!7627))

(declare-fun m!7629 () Bool)

(assert (=> b!6107 m!7629))

(declare-fun m!7631 () Bool)

(assert (=> b!6107 m!7631))

(declare-fun m!7633 () Bool)

(assert (=> b!6108 m!7633))

(assert (=> b!6034 d!2016))

(declare-fun d!2026 () Bool)

(assert (=> d!2026 (checkByteArrayBitContent!0 (_2!420 lt!7683) srcBuffer!6 (_1!421 lt!7685) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!7757 () Unit!474)

(declare-fun choose!65 (BitStream!354 array!437 array!437 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!474)

(assert (=> d!2026 (= lt!7757 (choose!65 (_2!420 lt!7683) srcBuffer!6 (_1!421 lt!7685) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2026 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2026 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!420 lt!7683) srcBuffer!6 (_1!421 lt!7685) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!7757)))

(declare-fun bs!723 () Bool)

(assert (= bs!723 d!2026))

(assert (=> bs!723 m!7555))

(declare-fun m!7643 () Bool)

(assert (=> bs!723 m!7643))

(assert (=> b!6034 d!2026))

(declare-fun d!2034 () Bool)

(assert (=> d!2034 (= (array_inv!183 (buf!515 thiss!1486)) (bvsge (size!188 (buf!515 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!6036 d!2034))

(declare-fun d!2036 () Bool)

(assert (=> d!2036 (= (invariant!0 (currentBit!1501 thiss!1486) (currentByte!1506 thiss!1486) (size!188 (buf!515 thiss!1486))) (and (bvsge (currentBit!1501 thiss!1486) #b00000000000000000000000000000000) (bvslt (currentBit!1501 thiss!1486) #b00000000000000000000000000001000) (bvsge (currentByte!1506 thiss!1486) #b00000000000000000000000000000000) (or (bvslt (currentByte!1506 thiss!1486) (size!188 (buf!515 thiss!1486))) (and (= (currentBit!1501 thiss!1486) #b00000000000000000000000000000000) (= (currentByte!1506 thiss!1486) (size!188 (buf!515 thiss!1486)))))))))

(assert (=> b!6035 d!2036))

(declare-fun d!2038 () Bool)

(declare-fun e!3916 () Bool)

(assert (=> d!2038 e!3916))

(declare-fun res!7175 () Bool)

(assert (=> d!2038 (=> (not res!7175) (not e!3916))))

(declare-fun lt!7775 () (_ BitVec 64))

(declare-fun lt!7778 () (_ BitVec 64))

(declare-fun lt!7777 () (_ BitVec 64))

(assert (=> d!2038 (= res!7175 (= lt!7777 (bvsub lt!7778 lt!7775)))))

(assert (=> d!2038 (or (= (bvand lt!7778 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!7775 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!7778 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!7778 lt!7775) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2038 (= lt!7775 (remainingBits!0 ((_ sign_extend 32) (size!188 (buf!515 (_2!420 lt!7683)))) ((_ sign_extend 32) (currentByte!1506 (_2!420 lt!7683))) ((_ sign_extend 32) (currentBit!1501 (_2!420 lt!7683)))))))

(declare-fun lt!7776 () (_ BitVec 64))

(declare-fun lt!7773 () (_ BitVec 64))

(assert (=> d!2038 (= lt!7778 (bvmul lt!7776 lt!7773))))

(assert (=> d!2038 (or (= lt!7776 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!7773 (bvsdiv (bvmul lt!7776 lt!7773) lt!7776)))))

(assert (=> d!2038 (= lt!7773 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2038 (= lt!7776 ((_ sign_extend 32) (size!188 (buf!515 (_2!420 lt!7683)))))))

(assert (=> d!2038 (= lt!7777 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1506 (_2!420 lt!7683))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1501 (_2!420 lt!7683)))))))

(assert (=> d!2038 (invariant!0 (currentBit!1501 (_2!420 lt!7683)) (currentByte!1506 (_2!420 lt!7683)) (size!188 (buf!515 (_2!420 lt!7683))))))

(assert (=> d!2038 (= (bitIndex!0 (size!188 (buf!515 (_2!420 lt!7683))) (currentByte!1506 (_2!420 lt!7683)) (currentBit!1501 (_2!420 lt!7683))) lt!7777)))

(declare-fun b!6141 () Bool)

(declare-fun res!7174 () Bool)

(assert (=> b!6141 (=> (not res!7174) (not e!3916))))

(assert (=> b!6141 (= res!7174 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!7777))))

(declare-fun b!6142 () Bool)

(declare-fun lt!7774 () (_ BitVec 64))

(assert (=> b!6142 (= e!3916 (bvsle lt!7777 (bvmul lt!7774 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!6142 (or (= lt!7774 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!7774 #b0000000000000000000000000000000000000000000000000000000000001000) lt!7774)))))

(assert (=> b!6142 (= lt!7774 ((_ sign_extend 32) (size!188 (buf!515 (_2!420 lt!7683)))))))

(assert (= (and d!2038 res!7175) b!6141))

(assert (= (and b!6141 res!7174) b!6142))

(declare-fun m!7651 () Bool)

(assert (=> d!2038 m!7651))

(assert (=> d!2038 m!7545))

(assert (=> b!6030 d!2038))

(declare-fun d!2056 () Bool)

(declare-fun e!3917 () Bool)

(assert (=> d!2056 e!3917))

(declare-fun res!7177 () Bool)

(assert (=> d!2056 (=> (not res!7177) (not e!3917))))

(declare-fun lt!7781 () (_ BitVec 64))

(declare-fun lt!7783 () (_ BitVec 64))

(declare-fun lt!7784 () (_ BitVec 64))

(assert (=> d!2056 (= res!7177 (= lt!7783 (bvsub lt!7784 lt!7781)))))

(assert (=> d!2056 (or (= (bvand lt!7784 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!7781 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!7784 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!7784 lt!7781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2056 (= lt!7781 (remainingBits!0 ((_ sign_extend 32) (size!188 (buf!515 thiss!1486))) ((_ sign_extend 32) (currentByte!1506 thiss!1486)) ((_ sign_extend 32) (currentBit!1501 thiss!1486))))))

(declare-fun lt!7782 () (_ BitVec 64))

(declare-fun lt!7779 () (_ BitVec 64))

(assert (=> d!2056 (= lt!7784 (bvmul lt!7782 lt!7779))))

(assert (=> d!2056 (or (= lt!7782 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!7779 (bvsdiv (bvmul lt!7782 lt!7779) lt!7782)))))

(assert (=> d!2056 (= lt!7779 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2056 (= lt!7782 ((_ sign_extend 32) (size!188 (buf!515 thiss!1486))))))

(assert (=> d!2056 (= lt!7783 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1506 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1501 thiss!1486))))))

(assert (=> d!2056 (invariant!0 (currentBit!1501 thiss!1486) (currentByte!1506 thiss!1486) (size!188 (buf!515 thiss!1486)))))

(assert (=> d!2056 (= (bitIndex!0 (size!188 (buf!515 thiss!1486)) (currentByte!1506 thiss!1486) (currentBit!1501 thiss!1486)) lt!7783)))

(declare-fun b!6143 () Bool)

(declare-fun res!7176 () Bool)

(assert (=> b!6143 (=> (not res!7176) (not e!3917))))

(assert (=> b!6143 (= res!7176 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!7783))))

(declare-fun b!6144 () Bool)

(declare-fun lt!7780 () (_ BitVec 64))

(assert (=> b!6144 (= e!3917 (bvsle lt!7783 (bvmul lt!7780 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!6144 (or (= lt!7780 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!7780 #b0000000000000000000000000000000000000000000000000000000000001000) lt!7780)))))

(assert (=> b!6144 (= lt!7780 ((_ sign_extend 32) (size!188 (buf!515 thiss!1486))))))

(assert (= (and d!2056 res!7177) b!6143))

(assert (= (and b!6143 res!7176) b!6144))

(declare-fun m!7653 () Bool)

(assert (=> d!2056 m!7653))

(assert (=> d!2056 m!7529))

(assert (=> b!6030 d!2056))

(declare-fun d!2058 () Bool)

(assert (=> d!2058 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!188 (buf!515 thiss!1486))) ((_ sign_extend 32) (currentByte!1506 thiss!1486)) ((_ sign_extend 32) (currentBit!1501 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!188 (buf!515 thiss!1486))) ((_ sign_extend 32) (currentByte!1506 thiss!1486)) ((_ sign_extend 32) (currentBit!1501 thiss!1486))) nBits!460))))

(declare-fun bs!727 () Bool)

(assert (= bs!727 d!2058))

(assert (=> bs!727 m!7653))

(assert (=> b!6037 d!2058))

(declare-fun d!2060 () Bool)

(declare-fun c!299 () Bool)

(assert (=> d!2060 (= c!299 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!3920 () List!88)

(assert (=> d!2060 (= (byteArrayBitContentToList!0 (_2!420 lt!7683) srcBuffer!6 from!367 nBits!460) e!3920)))

(declare-fun b!6149 () Bool)

(assert (=> b!6149 (= e!3920 Nil!85)))

(declare-fun b!6150 () Bool)

(assert (=> b!6150 (= e!3920 (Cons!84 (not (= (bvand ((_ sign_extend 24) (select (arr!584 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!420 lt!7683) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2060 c!299) b!6149))

(assert (= (and d!2060 (not c!299)) b!6150))

(assert (=> b!6150 m!7625))

(assert (=> b!6150 m!7627))

(declare-fun m!7655 () Bool)

(assert (=> b!6150 m!7655))

(assert (=> b!6031 d!2060))

(declare-fun d!2062 () Bool)

(assert (=> d!2062 (= (invariant!0 (currentBit!1501 (_2!420 lt!7683)) (currentByte!1506 (_2!420 lt!7683)) (size!188 (buf!515 (_2!420 lt!7683)))) (and (bvsge (currentBit!1501 (_2!420 lt!7683)) #b00000000000000000000000000000000) (bvslt (currentBit!1501 (_2!420 lt!7683)) #b00000000000000000000000000001000) (bvsge (currentByte!1506 (_2!420 lt!7683)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1506 (_2!420 lt!7683)) (size!188 (buf!515 (_2!420 lt!7683)))) (and (= (currentBit!1501 (_2!420 lt!7683)) #b00000000000000000000000000000000) (= (currentByte!1506 (_2!420 lt!7683)) (size!188 (buf!515 (_2!420 lt!7683))))))))))

(assert (=> b!6033 d!2062))

(declare-fun b!6241 () Bool)

(declare-fun e!3955 () Bool)

(declare-fun lt!8143 () (_ BitVec 64))

(assert (=> b!6241 (= e!3955 (validate_offset_bits!1 ((_ sign_extend 32) (size!188 (buf!515 thiss!1486))) ((_ sign_extend 32) (currentByte!1506 thiss!1486)) ((_ sign_extend 32) (currentBit!1501 thiss!1486)) lt!8143))))

(declare-fun e!3957 () Bool)

(declare-fun b!6242 () Bool)

(declare-fun lt!8131 () tuple2!800)

(declare-fun lt!8107 () tuple2!796)

(assert (=> b!6242 (= e!3957 (= (bitStreamReadBitsIntoList!0 (_2!420 lt!8107) (_1!422 lt!8131) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!420 lt!8107) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!6242 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6242 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!8117 () Unit!474)

(declare-fun lt!8116 () Unit!474)

(assert (=> b!6242 (= lt!8117 lt!8116)))

(assert (=> b!6242 (validate_offset_bits!1 ((_ sign_extend 32) (size!188 (buf!515 (_2!420 lt!8107)))) ((_ sign_extend 32) (currentByte!1506 thiss!1486)) ((_ sign_extend 32) (currentBit!1501 thiss!1486)) lt!8143)))

(assert (=> b!6242 (= lt!8116 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!515 (_2!420 lt!8107)) lt!8143))))

(assert (=> b!6242 e!3955))

(declare-fun res!7235 () Bool)

(assert (=> b!6242 (=> (not res!7235) (not e!3955))))

(assert (=> b!6242 (= res!7235 (and (= (size!188 (buf!515 thiss!1486)) (size!188 (buf!515 (_2!420 lt!8107)))) (bvsge lt!8143 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6242 (= lt!8143 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!6242 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6242 (= lt!8131 (reader!0 thiss!1486 (_2!420 lt!8107)))))

(declare-fun b!6243 () Bool)

(declare-fun e!3956 () tuple2!796)

(declare-fun Unit!479 () Unit!474)

(assert (=> b!6243 (= e!3956 (tuple2!797 Unit!479 thiss!1486))))

(assert (=> b!6243 (= (size!188 (buf!515 thiss!1486)) (size!188 (buf!515 thiss!1486)))))

(declare-fun lt!8114 () Unit!474)

(declare-fun Unit!480 () Unit!474)

(assert (=> b!6243 (= lt!8114 Unit!480)))

(declare-fun call!71 () tuple2!800)

(assert (=> b!6243 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!421 (readBits!0 (_1!422 call!71) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!6244 () Bool)

(declare-fun res!7237 () Bool)

(assert (=> b!6244 (=> (not res!7237) (not e!3957))))

(assert (=> b!6244 (= res!7237 (= (size!188 (buf!515 (_2!420 lt!8107))) (size!188 (buf!515 thiss!1486))))))

(declare-fun d!2064 () Bool)

(assert (=> d!2064 e!3957))

(declare-fun res!7236 () Bool)

(assert (=> d!2064 (=> (not res!7236) (not e!3957))))

(declare-fun lt!8139 () (_ BitVec 64))

(assert (=> d!2064 (= res!7236 (= (bitIndex!0 (size!188 (buf!515 (_2!420 lt!8107))) (currentByte!1506 (_2!420 lt!8107)) (currentBit!1501 (_2!420 lt!8107))) (bvsub lt!8139 from!367)))))

(assert (=> d!2064 (or (= (bvand lt!8139 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!8139 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!8139 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!8118 () (_ BitVec 64))

(assert (=> d!2064 (= lt!8139 (bvadd lt!8118 from!367 nBits!460))))

(assert (=> d!2064 (or (not (= (bvand lt!8118 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!8118 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!8118 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2064 (= lt!8118 (bitIndex!0 (size!188 (buf!515 thiss!1486)) (currentByte!1506 thiss!1486) (currentBit!1501 thiss!1486)))))

(assert (=> d!2064 (= lt!8107 e!3956)))

(declare-fun c!318 () Bool)

(assert (=> d!2064 (= c!318 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!8133 () Unit!474)

(declare-fun lt!8109 () Unit!474)

(assert (=> d!2064 (= lt!8133 lt!8109)))

(assert (=> d!2064 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!354) Unit!474)

(assert (=> d!2064 (= lt!8109 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!8127 () (_ BitVec 64))

(assert (=> d!2064 (= lt!8127 (bitIndex!0 (size!188 (buf!515 thiss!1486)) (currentByte!1506 thiss!1486) (currentBit!1501 thiss!1486)))))

(assert (=> d!2064 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2064 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!8107)))

(declare-fun bm!68 () Bool)

(declare-fun lt!8145 () tuple2!796)

(assert (=> bm!68 (= call!71 (reader!0 thiss!1486 (ite c!318 (_2!420 lt!8145) thiss!1486)))))

(declare-fun b!6245 () Bool)

(declare-fun res!7232 () Bool)

(assert (=> b!6245 (=> (not res!7232) (not e!3957))))

(assert (=> b!6245 (= res!7232 (= (size!188 (buf!515 thiss!1486)) (size!188 (buf!515 (_2!420 lt!8107)))))))

(declare-fun b!6246 () Bool)

(declare-fun res!7233 () Bool)

(assert (=> b!6246 (=> (not res!7233) (not e!3957))))

(assert (=> b!6246 (= res!7233 (invariant!0 (currentBit!1501 (_2!420 lt!8107)) (currentByte!1506 (_2!420 lt!8107)) (size!188 (buf!515 (_2!420 lt!8107)))))))

(declare-fun b!6247 () Bool)

(declare-fun Unit!484 () Unit!474)

(assert (=> b!6247 (= e!3956 (tuple2!797 Unit!484 (_2!420 lt!8145)))))

(declare-fun lt!8126 () tuple2!796)

(declare-fun appendBitFromByte!0 (BitStream!354 (_ BitVec 8) (_ BitVec 32)) tuple2!796)

(assert (=> b!6247 (= lt!8126 (appendBitFromByte!0 thiss!1486 (select (arr!584 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!8106 () (_ BitVec 64))

(assert (=> b!6247 (= lt!8106 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!8142 () (_ BitVec 64))

(assert (=> b!6247 (= lt!8142 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!8108 () Unit!474)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!354 BitStream!354 (_ BitVec 64) (_ BitVec 64)) Unit!474)

(assert (=> b!6247 (= lt!8108 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!420 lt!8126) lt!8106 lt!8142))))

(assert (=> b!6247 (validate_offset_bits!1 ((_ sign_extend 32) (size!188 (buf!515 (_2!420 lt!8126)))) ((_ sign_extend 32) (currentByte!1506 (_2!420 lt!8126))) ((_ sign_extend 32) (currentBit!1501 (_2!420 lt!8126))) (bvsub lt!8106 lt!8142))))

(declare-fun lt!8134 () Unit!474)

(assert (=> b!6247 (= lt!8134 lt!8108)))

(declare-fun lt!8144 () tuple2!800)

(assert (=> b!6247 (= lt!8144 (reader!0 thiss!1486 (_2!420 lt!8126)))))

(declare-fun lt!8112 () (_ BitVec 64))

(assert (=> b!6247 (= lt!8112 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!8132 () Unit!474)

(assert (=> b!6247 (= lt!8132 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!515 (_2!420 lt!8126)) lt!8112))))

(assert (=> b!6247 (validate_offset_bits!1 ((_ sign_extend 32) (size!188 (buf!515 (_2!420 lt!8126)))) ((_ sign_extend 32) (currentByte!1506 thiss!1486)) ((_ sign_extend 32) (currentBit!1501 thiss!1486)) lt!8112)))

(declare-fun lt!8141 () Unit!474)

(assert (=> b!6247 (= lt!8141 lt!8132)))

(declare-fun head!27 (List!88) Bool)

(assert (=> b!6247 (= (head!27 (byteArrayBitContentToList!0 (_2!420 lt!8126) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!27 (bitStreamReadBitsIntoList!0 (_2!420 lt!8126) (_1!422 lt!8144) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!8124 () Unit!474)

(declare-fun Unit!485 () Unit!474)

(assert (=> b!6247 (= lt!8124 Unit!485)))

(assert (=> b!6247 (= lt!8145 (appendBitsMSBFirstLoop!0 (_2!420 lt!8126) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!8111 () Unit!474)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!354 BitStream!354 BitStream!354) Unit!474)

(assert (=> b!6247 (= lt!8111 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!420 lt!8126) (_2!420 lt!8145)))))

(assert (=> b!6247 (isPrefixOf!0 thiss!1486 (_2!420 lt!8145))))

(declare-fun lt!8122 () Unit!474)

(assert (=> b!6247 (= lt!8122 lt!8111)))

(assert (=> b!6247 (= (size!188 (buf!515 (_2!420 lt!8145))) (size!188 (buf!515 thiss!1486)))))

(declare-fun lt!8135 () Unit!474)

(declare-fun Unit!487 () Unit!474)

(assert (=> b!6247 (= lt!8135 Unit!487)))

(assert (=> b!6247 (= (bitIndex!0 (size!188 (buf!515 (_2!420 lt!8145))) (currentByte!1506 (_2!420 lt!8145)) (currentBit!1501 (_2!420 lt!8145))) (bvsub (bvadd (bitIndex!0 (size!188 (buf!515 thiss!1486)) (currentByte!1506 thiss!1486) (currentBit!1501 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!8125 () Unit!474)

(declare-fun Unit!488 () Unit!474)

(assert (=> b!6247 (= lt!8125 Unit!488)))

(assert (=> b!6247 (= (bitIndex!0 (size!188 (buf!515 (_2!420 lt!8145))) (currentByte!1506 (_2!420 lt!8145)) (currentBit!1501 (_2!420 lt!8145))) (bvsub (bvsub (bvadd (bitIndex!0 (size!188 (buf!515 (_2!420 lt!8126))) (currentByte!1506 (_2!420 lt!8126)) (currentBit!1501 (_2!420 lt!8126))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!8120 () Unit!474)

(declare-fun Unit!490 () Unit!474)

(assert (=> b!6247 (= lt!8120 Unit!490)))

(declare-fun lt!8121 () tuple2!800)

(assert (=> b!6247 (= lt!8121 call!71)))

(declare-fun lt!8147 () (_ BitVec 64))

(assert (=> b!6247 (= lt!8147 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!8129 () Unit!474)

(assert (=> b!6247 (= lt!8129 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!515 (_2!420 lt!8145)) lt!8147))))

(assert (=> b!6247 (validate_offset_bits!1 ((_ sign_extend 32) (size!188 (buf!515 (_2!420 lt!8145)))) ((_ sign_extend 32) (currentByte!1506 thiss!1486)) ((_ sign_extend 32) (currentBit!1501 thiss!1486)) lt!8147)))

(declare-fun lt!8104 () Unit!474)

(assert (=> b!6247 (= lt!8104 lt!8129)))

(declare-fun lt!8136 () tuple2!800)

(assert (=> b!6247 (= lt!8136 (reader!0 (_2!420 lt!8126) (_2!420 lt!8145)))))

(declare-fun lt!8130 () (_ BitVec 64))

(assert (=> b!6247 (= lt!8130 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!8119 () Unit!474)

(assert (=> b!6247 (= lt!8119 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!420 lt!8126) (buf!515 (_2!420 lt!8145)) lt!8130))))

(assert (=> b!6247 (validate_offset_bits!1 ((_ sign_extend 32) (size!188 (buf!515 (_2!420 lt!8145)))) ((_ sign_extend 32) (currentByte!1506 (_2!420 lt!8126))) ((_ sign_extend 32) (currentBit!1501 (_2!420 lt!8126))) lt!8130)))

(declare-fun lt!8128 () Unit!474)

(assert (=> b!6247 (= lt!8128 lt!8119)))

(declare-fun lt!8138 () List!88)

(assert (=> b!6247 (= lt!8138 (byteArrayBitContentToList!0 (_2!420 lt!8145) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!8105 () List!88)

(assert (=> b!6247 (= lt!8105 (byteArrayBitContentToList!0 (_2!420 lt!8145) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!8110 () List!88)

(assert (=> b!6247 (= lt!8110 (bitStreamReadBitsIntoList!0 (_2!420 lt!8145) (_1!422 lt!8121) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!8137 () List!88)

(assert (=> b!6247 (= lt!8137 (bitStreamReadBitsIntoList!0 (_2!420 lt!8145) (_1!422 lt!8136) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!8123 () (_ BitVec 64))

(assert (=> b!6247 (= lt!8123 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!8115 () Unit!474)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!354 BitStream!354 BitStream!354 BitStream!354 (_ BitVec 64) List!88) Unit!474)

(assert (=> b!6247 (= lt!8115 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!420 lt!8145) (_2!420 lt!8145) (_1!422 lt!8121) (_1!422 lt!8136) lt!8123 lt!8110))))

(declare-fun tail!34 (List!88) List!88)

(assert (=> b!6247 (= (bitStreamReadBitsIntoList!0 (_2!420 lt!8145) (_1!422 lt!8136) (bvsub lt!8123 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!34 lt!8110))))

(declare-fun lt!8113 () Unit!474)

(assert (=> b!6247 (= lt!8113 lt!8115)))

(declare-fun lt!8140 () Unit!474)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!437 array!437 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!474)

(assert (=> b!6247 (= lt!8140 (arrayBitRangesEqImpliesEq!0 (buf!515 (_2!420 lt!8126)) (buf!515 (_2!420 lt!8145)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!8127 (bitIndex!0 (size!188 (buf!515 (_2!420 lt!8126))) (currentByte!1506 (_2!420 lt!8126)) (currentBit!1501 (_2!420 lt!8126)))))))

(declare-fun bitAt!0 (array!437 (_ BitVec 64)) Bool)

(assert (=> b!6247 (= (bitAt!0 (buf!515 (_2!420 lt!8126)) lt!8127) (bitAt!0 (buf!515 (_2!420 lt!8145)) lt!8127))))

(declare-fun lt!8146 () Unit!474)

(assert (=> b!6247 (= lt!8146 lt!8140)))

(declare-fun b!6248 () Bool)

(declare-fun res!7234 () Bool)

(assert (=> b!6248 (=> (not res!7234) (not e!3957))))

(assert (=> b!6248 (= res!7234 (isPrefixOf!0 thiss!1486 (_2!420 lt!8107)))))

(assert (= (and d!2064 c!318) b!6247))

(assert (= (and d!2064 (not c!318)) b!6243))

(assert (= (or b!6247 b!6243) bm!68))

(assert (= (and d!2064 res!7236) b!6246))

(assert (= (and b!6246 res!7233) b!6245))

(assert (= (and b!6245 res!7232) b!6248))

(assert (= (and b!6248 res!7234) b!6244))

(assert (= (and b!6244 res!7237) b!6242))

(assert (= (and b!6242 res!7235) b!6241))

(declare-fun m!7803 () Bool)

(assert (=> bm!68 m!7803))

(declare-fun m!7805 () Bool)

(assert (=> b!6248 m!7805))

(declare-fun m!7807 () Bool)

(assert (=> d!2064 m!7807))

(assert (=> d!2064 m!7551))

(declare-fun m!7809 () Bool)

(assert (=> d!2064 m!7809))

(declare-fun m!7811 () Bool)

(assert (=> d!2064 m!7811))

(declare-fun m!7813 () Bool)

(assert (=> b!6241 m!7813))

(declare-fun m!7815 () Bool)

(assert (=> b!6247 m!7815))

(declare-fun m!7817 () Bool)

(assert (=> b!6247 m!7817))

(declare-fun m!7819 () Bool)

(assert (=> b!6247 m!7819))

(declare-fun m!7821 () Bool)

(assert (=> b!6247 m!7821))

(declare-fun m!7823 () Bool)

(assert (=> b!6247 m!7823))

(declare-fun m!7825 () Bool)

(assert (=> b!6247 m!7825))

(declare-fun m!7827 () Bool)

(assert (=> b!6247 m!7827))

(declare-fun m!7829 () Bool)

(assert (=> b!6247 m!7829))

(declare-fun m!7831 () Bool)

(assert (=> b!6247 m!7831))

(declare-fun m!7833 () Bool)

(assert (=> b!6247 m!7833))

(assert (=> b!6247 m!7823))

(declare-fun m!7835 () Bool)

(assert (=> b!6247 m!7835))

(declare-fun m!7837 () Bool)

(assert (=> b!6247 m!7837))

(declare-fun m!7839 () Bool)

(assert (=> b!6247 m!7839))

(declare-fun m!7841 () Bool)

(assert (=> b!6247 m!7841))

(assert (=> b!6247 m!7551))

(declare-fun m!7843 () Bool)

(assert (=> b!6247 m!7843))

(declare-fun m!7845 () Bool)

(assert (=> b!6247 m!7845))

(declare-fun m!7847 () Bool)

(assert (=> b!6247 m!7847))

(declare-fun m!7849 () Bool)

(assert (=> b!6247 m!7849))

(declare-fun m!7851 () Bool)

(assert (=> b!6247 m!7851))

(declare-fun m!7853 () Bool)

(assert (=> b!6247 m!7853))

(assert (=> b!6247 m!7625))

(declare-fun m!7855 () Bool)

(assert (=> b!6247 m!7855))

(assert (=> b!6247 m!7835))

(declare-fun m!7857 () Bool)

(assert (=> b!6247 m!7857))

(declare-fun m!7859 () Bool)

(assert (=> b!6247 m!7859))

(declare-fun m!7861 () Bool)

(assert (=> b!6247 m!7861))

(assert (=> b!6247 m!7817))

(declare-fun m!7863 () Bool)

(assert (=> b!6247 m!7863))

(declare-fun m!7865 () Bool)

(assert (=> b!6247 m!7865))

(assert (=> b!6247 m!7625))

(declare-fun m!7867 () Bool)

(assert (=> b!6247 m!7867))

(declare-fun m!7869 () Bool)

(assert (=> b!6247 m!7869))

(declare-fun m!7871 () Bool)

(assert (=> b!6247 m!7871))

(declare-fun m!7873 () Bool)

(assert (=> b!6247 m!7873))

(declare-fun m!7875 () Bool)

(assert (=> b!6246 m!7875))

(declare-fun m!7877 () Bool)

(assert (=> b!6243 m!7877))

(declare-fun m!7879 () Bool)

(assert (=> b!6243 m!7879))

(declare-fun m!7881 () Bool)

(assert (=> b!6242 m!7881))

(declare-fun m!7883 () Bool)

(assert (=> b!6242 m!7883))

(declare-fun m!7885 () Bool)

(assert (=> b!6242 m!7885))

(declare-fun m!7887 () Bool)

(assert (=> b!6242 m!7887))

(declare-fun m!7889 () Bool)

(assert (=> b!6242 m!7889))

(assert (=> b!6033 d!2064))

(declare-fun d!2086 () Bool)

(declare-fun c!319 () Bool)

(assert (=> d!2086 (= c!319 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!3958 () List!88)

(assert (=> d!2086 (= (byteArrayBitContentToList!0 (_2!420 lt!7683) (_1!421 lt!7685) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!3958)))

(declare-fun b!6249 () Bool)

(assert (=> b!6249 (= e!3958 Nil!85)))

(declare-fun b!6250 () Bool)

(assert (=> b!6250 (= e!3958 (Cons!84 (not (= (bvand ((_ sign_extend 24) (select (arr!584 (_1!421 lt!7685)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!420 lt!7683) (_1!421 lt!7685) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2086 c!319) b!6249))

(assert (= (and d!2086 (not c!319)) b!6250))

(assert (=> b!6250 m!7629))

(assert (=> b!6250 m!7631))

(declare-fun m!7891 () Bool)

(assert (=> b!6250 m!7891))

(assert (=> b!6038 d!2086))

(declare-fun d!2088 () Bool)

(assert (=> d!2088 (validate_offset_bits!1 ((_ sign_extend 32) (size!188 (buf!515 (_2!420 lt!7683)))) ((_ sign_extend 32) (currentByte!1506 thiss!1486)) ((_ sign_extend 32) (currentBit!1501 thiss!1486)) nBits!460)))

(declare-fun lt!8150 () Unit!474)

(declare-fun choose!9 (BitStream!354 array!437 (_ BitVec 64) BitStream!354) Unit!474)

(assert (=> d!2088 (= lt!8150 (choose!9 thiss!1486 (buf!515 (_2!420 lt!7683)) nBits!460 (BitStream!355 (buf!515 (_2!420 lt!7683)) (currentByte!1506 thiss!1486) (currentBit!1501 thiss!1486))))))

(assert (=> d!2088 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!515 (_2!420 lt!7683)) nBits!460) lt!8150)))

(declare-fun bs!730 () Bool)

(assert (= bs!730 d!2088))

(assert (=> bs!730 m!7543))

(declare-fun m!7893 () Bool)

(assert (=> bs!730 m!7893))

(assert (=> b!6038 d!2088))

(declare-fun b!6278 () Bool)

(declare-fun res!7257 () Bool)

(declare-fun e!3968 () Bool)

(assert (=> b!6278 (=> (not res!7257) (not e!3968))))

(declare-fun lt!8233 () tuple2!798)

(assert (=> b!6278 (= res!7257 (bvsle (currentByte!1506 (_1!422 lt!7682)) (currentByte!1506 (_2!421 lt!8233))))))

(declare-fun d!2090 () Bool)

(assert (=> d!2090 e!3968))

(declare-fun res!7261 () Bool)

(assert (=> d!2090 (=> (not res!7261) (not e!3968))))

(assert (=> d!2090 (= res!7261 (= (buf!515 (_2!421 lt!8233)) (buf!515 (_1!422 lt!7682))))))

(declare-datatypes ((tuple3!46 0))(
  ( (tuple3!47 (_1!429 Unit!474) (_2!429 BitStream!354) (_3!23 array!437)) )
))
(declare-fun lt!8234 () tuple3!46)

(assert (=> d!2090 (= lt!8233 (tuple2!799 (_3!23 lt!8234) (_2!429 lt!8234)))))

(declare-fun readBitsLoop!0 (BitStream!354 (_ BitVec 64) array!437 (_ BitVec 64) (_ BitVec 64)) tuple3!46)

(assert (=> d!2090 (= lt!8234 (readBitsLoop!0 (_1!422 lt!7682) nBits!460 (array!438 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2090 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!2090 (= (readBits!0 (_1!422 lt!7682) nBits!460) lt!8233)))

(declare-fun b!6279 () Bool)

(declare-fun res!7258 () Bool)

(assert (=> b!6279 (=> (not res!7258) (not e!3968))))

(declare-fun lt!8236 () (_ BitVec 64))

(assert (=> b!6279 (= res!7258 (= (size!188 (_1!421 lt!8233)) ((_ extract 31 0) lt!8236)))))

(assert (=> b!6279 (and (bvslt lt!8236 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!8236 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!8239 () (_ BitVec 64))

(declare-fun lt!8240 () (_ BitVec 64))

(assert (=> b!6279 (= lt!8236 (bvsdiv lt!8239 lt!8240))))

(assert (=> b!6279 (and (not (= lt!8240 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!8239 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!8240 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!6279 (= lt!8240 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!8235 () (_ BitVec 64))

(declare-fun lt!8237 () (_ BitVec 64))

(assert (=> b!6279 (= lt!8239 (bvsub lt!8235 lt!8237))))

(assert (=> b!6279 (or (= (bvand lt!8235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!8237 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!8235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!8235 lt!8237) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6279 (= lt!8237 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!8238 () (_ BitVec 64))

(assert (=> b!6279 (= lt!8235 (bvadd nBits!460 lt!8238))))

(assert (=> b!6279 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!8238 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!8238) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6279 (= lt!8238 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!6280 () Bool)

(assert (=> b!6280 (= e!3968 (= (byteArrayBitContentToList!0 (_2!421 lt!8233) (_1!421 lt!8233) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!421 lt!8233) (_1!422 lt!7682) nBits!460)))))

(declare-fun b!6281 () Bool)

(declare-fun res!7260 () Bool)

(assert (=> b!6281 (=> (not res!7260) (not e!3968))))

(declare-fun lt!8232 () (_ BitVec 64))

(assert (=> b!6281 (= res!7260 (= (bvadd lt!8232 nBits!460) (bitIndex!0 (size!188 (buf!515 (_2!421 lt!8233))) (currentByte!1506 (_2!421 lt!8233)) (currentBit!1501 (_2!421 lt!8233)))))))

(assert (=> b!6281 (or (not (= (bvand lt!8232 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!8232 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!8232 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6281 (= lt!8232 (bitIndex!0 (size!188 (buf!515 (_1!422 lt!7682))) (currentByte!1506 (_1!422 lt!7682)) (currentBit!1501 (_1!422 lt!7682))))))

(declare-fun b!6282 () Bool)

(declare-fun res!7259 () Bool)

(assert (=> b!6282 (=> (not res!7259) (not e!3968))))

(assert (=> b!6282 (= res!7259 (invariant!0 (currentBit!1501 (_2!421 lt!8233)) (currentByte!1506 (_2!421 lt!8233)) (size!188 (buf!515 (_2!421 lt!8233)))))))

(assert (= (and d!2090 res!7261) b!6281))

(assert (= (and b!6281 res!7260) b!6282))

(assert (= (and b!6282 res!7259) b!6279))

(assert (= (and b!6279 res!7258) b!6278))

(assert (= (and b!6278 res!7257) b!6280))

(declare-fun m!7927 () Bool)

(assert (=> d!2090 m!7927))

(declare-fun m!7929 () Bool)

(assert (=> b!6280 m!7929))

(declare-fun m!7931 () Bool)

(assert (=> b!6280 m!7931))

(declare-fun m!7933 () Bool)

(assert (=> b!6281 m!7933))

(declare-fun m!7935 () Bool)

(assert (=> b!6281 m!7935))

(declare-fun m!7937 () Bool)

(assert (=> b!6282 m!7937))

(assert (=> b!6038 d!2090))

(declare-fun d!2100 () Bool)

(assert (=> d!2100 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!188 (buf!515 (_2!420 lt!7683)))) ((_ sign_extend 32) (currentByte!1506 thiss!1486)) ((_ sign_extend 32) (currentBit!1501 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!188 (buf!515 (_2!420 lt!7683)))) ((_ sign_extend 32) (currentByte!1506 thiss!1486)) ((_ sign_extend 32) (currentBit!1501 thiss!1486))) nBits!460))))

(declare-fun bs!733 () Bool)

(assert (= bs!733 d!2100))

(declare-fun m!7939 () Bool)

(assert (=> bs!733 m!7939))

(assert (=> b!6038 d!2100))

(declare-fun b!6332 () Bool)

(declare-fun res!7301 () Bool)

(declare-fun e!3985 () Bool)

(assert (=> b!6332 (=> (not res!7301) (not e!3985))))

(declare-fun lt!8454 () tuple2!800)

(assert (=> b!6332 (= res!7301 (isPrefixOf!0 (_1!422 lt!8454) thiss!1486))))

(declare-fun b!6334 () Bool)

(declare-fun e!3986 () Unit!474)

(declare-fun lt!8452 () Unit!474)

(assert (=> b!6334 (= e!3986 lt!8452)))

(declare-fun lt!8459 () (_ BitVec 64))

(assert (=> b!6334 (= lt!8459 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!8443 () (_ BitVec 64))

(assert (=> b!6334 (= lt!8443 (bitIndex!0 (size!188 (buf!515 thiss!1486)) (currentByte!1506 thiss!1486) (currentBit!1501 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!437 array!437 (_ BitVec 64) (_ BitVec 64)) Unit!474)

(assert (=> b!6334 (= lt!8452 (arrayBitRangesEqSymmetric!0 (buf!515 thiss!1486) (buf!515 (_2!420 lt!7683)) lt!8459 lt!8443))))

(assert (=> b!6334 (arrayBitRangesEq!0 (buf!515 (_2!420 lt!7683)) (buf!515 thiss!1486) lt!8459 lt!8443)))

(declare-fun b!6335 () Bool)

(declare-fun Unit!500 () Unit!474)

(assert (=> b!6335 (= e!3986 Unit!500)))

(declare-fun lt!8449 () (_ BitVec 64))

(declare-fun b!6336 () Bool)

(declare-fun lt!8446 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!354 (_ BitVec 64)) BitStream!354)

(assert (=> b!6336 (= e!3985 (= (_1!422 lt!8454) (withMovedBitIndex!0 (_2!422 lt!8454) (bvsub lt!8446 lt!8449))))))

(assert (=> b!6336 (or (= (bvand lt!8446 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!8449 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!8446 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!8446 lt!8449) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6336 (= lt!8449 (bitIndex!0 (size!188 (buf!515 (_2!420 lt!7683))) (currentByte!1506 (_2!420 lt!7683)) (currentBit!1501 (_2!420 lt!7683))))))

(assert (=> b!6336 (= lt!8446 (bitIndex!0 (size!188 (buf!515 thiss!1486)) (currentByte!1506 thiss!1486) (currentBit!1501 thiss!1486)))))

(declare-fun d!2102 () Bool)

(assert (=> d!2102 e!3985))

(declare-fun res!7303 () Bool)

(assert (=> d!2102 (=> (not res!7303) (not e!3985))))

(assert (=> d!2102 (= res!7303 (isPrefixOf!0 (_1!422 lt!8454) (_2!422 lt!8454)))))

(declare-fun lt!8456 () BitStream!354)

(assert (=> d!2102 (= lt!8454 (tuple2!801 lt!8456 (_2!420 lt!7683)))))

(declare-fun lt!8447 () Unit!474)

(declare-fun lt!8442 () Unit!474)

(assert (=> d!2102 (= lt!8447 lt!8442)))

(assert (=> d!2102 (isPrefixOf!0 lt!8456 (_2!420 lt!7683))))

(assert (=> d!2102 (= lt!8442 (lemmaIsPrefixTransitive!0 lt!8456 (_2!420 lt!7683) (_2!420 lt!7683)))))

(declare-fun lt!8448 () Unit!474)

(declare-fun lt!8453 () Unit!474)

(assert (=> d!2102 (= lt!8448 lt!8453)))

(assert (=> d!2102 (isPrefixOf!0 lt!8456 (_2!420 lt!7683))))

(assert (=> d!2102 (= lt!8453 (lemmaIsPrefixTransitive!0 lt!8456 thiss!1486 (_2!420 lt!7683)))))

(declare-fun lt!8445 () Unit!474)

(assert (=> d!2102 (= lt!8445 e!3986)))

(declare-fun c!329 () Bool)

(assert (=> d!2102 (= c!329 (not (= (size!188 (buf!515 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!8444 () Unit!474)

(declare-fun lt!8440 () Unit!474)

(assert (=> d!2102 (= lt!8444 lt!8440)))

(assert (=> d!2102 (isPrefixOf!0 (_2!420 lt!7683) (_2!420 lt!7683))))

(assert (=> d!2102 (= lt!8440 (lemmaIsPrefixRefl!0 (_2!420 lt!7683)))))

(declare-fun lt!8457 () Unit!474)

(declare-fun lt!8451 () Unit!474)

(assert (=> d!2102 (= lt!8457 lt!8451)))

(assert (=> d!2102 (= lt!8451 (lemmaIsPrefixRefl!0 (_2!420 lt!7683)))))

(declare-fun lt!8455 () Unit!474)

(declare-fun lt!8450 () Unit!474)

(assert (=> d!2102 (= lt!8455 lt!8450)))

(assert (=> d!2102 (isPrefixOf!0 lt!8456 lt!8456)))

(assert (=> d!2102 (= lt!8450 (lemmaIsPrefixRefl!0 lt!8456))))

(declare-fun lt!8441 () Unit!474)

(declare-fun lt!8458 () Unit!474)

(assert (=> d!2102 (= lt!8441 lt!8458)))

(assert (=> d!2102 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2102 (= lt!8458 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2102 (= lt!8456 (BitStream!355 (buf!515 (_2!420 lt!7683)) (currentByte!1506 thiss!1486) (currentBit!1501 thiss!1486)))))

(assert (=> d!2102 (isPrefixOf!0 thiss!1486 (_2!420 lt!7683))))

(assert (=> d!2102 (= (reader!0 thiss!1486 (_2!420 lt!7683)) lt!8454)))

(declare-fun b!6333 () Bool)

(declare-fun res!7302 () Bool)

(assert (=> b!6333 (=> (not res!7302) (not e!3985))))

(assert (=> b!6333 (= res!7302 (isPrefixOf!0 (_2!422 lt!8454) (_2!420 lt!7683)))))

(assert (= (and d!2102 c!329) b!6334))

(assert (= (and d!2102 (not c!329)) b!6335))

(assert (= (and d!2102 res!7303) b!6332))

(assert (= (and b!6332 res!7301) b!6333))

(assert (= (and b!6333 res!7302) b!6336))

(assert (=> b!6334 m!7551))

(declare-fun m!8037 () Bool)

(assert (=> b!6334 m!8037))

(declare-fun m!8039 () Bool)

(assert (=> b!6334 m!8039))

(declare-fun m!8041 () Bool)

(assert (=> b!6333 m!8041))

(declare-fun m!8043 () Bool)

(assert (=> b!6336 m!8043))

(assert (=> b!6336 m!7549))

(assert (=> b!6336 m!7551))

(assert (=> d!2102 m!7811))

(declare-fun m!8045 () Bool)

(assert (=> d!2102 m!8045))

(declare-fun m!8047 () Bool)

(assert (=> d!2102 m!8047))

(assert (=> d!2102 m!7553))

(assert (=> d!2102 m!7809))

(declare-fun m!8049 () Bool)

(assert (=> d!2102 m!8049))

(declare-fun m!8051 () Bool)

(assert (=> d!2102 m!8051))

(declare-fun m!8053 () Bool)

(assert (=> d!2102 m!8053))

(declare-fun m!8055 () Bool)

(assert (=> d!2102 m!8055))

(declare-fun m!8057 () Bool)

(assert (=> d!2102 m!8057))

(declare-fun m!8059 () Bool)

(assert (=> d!2102 m!8059))

(declare-fun m!8061 () Bool)

(assert (=> b!6332 m!8061))

(assert (=> b!6038 d!2102))

(declare-datatypes ((tuple2!812 0))(
  ( (tuple2!813 (_1!430 Bool) (_2!430 BitStream!354)) )
))
(declare-fun lt!8476 () tuple2!812)

(declare-fun b!6358 () Bool)

(declare-fun lt!8475 () (_ BitVec 64))

(declare-datatypes ((tuple2!814 0))(
  ( (tuple2!815 (_1!431 List!88) (_2!431 BitStream!354)) )
))
(declare-fun e!3998 () tuple2!814)

(assert (=> b!6358 (= e!3998 (tuple2!815 (Cons!84 (_1!430 lt!8476) (bitStreamReadBitsIntoList!0 (_2!420 lt!7683) (_2!430 lt!8476) (bvsub nBits!460 lt!8475))) (_2!430 lt!8476)))))

(declare-fun readBit!0 (BitStream!354) tuple2!812)

(assert (=> b!6358 (= lt!8476 (readBit!0 (_1!422 lt!7682)))))

(assert (=> b!6358 (= lt!8475 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!6357 () Bool)

(assert (=> b!6357 (= e!3998 (tuple2!815 Nil!85 (_1!422 lt!7682)))))

(declare-fun b!6360 () Bool)

(declare-fun e!3997 () Bool)

(declare-fun lt!8477 () List!88)

(declare-fun length!12 (List!88) Int)

(assert (=> b!6360 (= e!3997 (> (length!12 lt!8477) 0))))

(declare-fun b!6359 () Bool)

(declare-fun isEmpty!17 (List!88) Bool)

(assert (=> b!6359 (= e!3997 (isEmpty!17 lt!8477))))

(declare-fun d!2106 () Bool)

(assert (=> d!2106 e!3997))

(declare-fun c!340 () Bool)

(assert (=> d!2106 (= c!340 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2106 (= lt!8477 (_1!431 e!3998))))

(declare-fun c!341 () Bool)

(assert (=> d!2106 (= c!341 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2106 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2106 (= (bitStreamReadBitsIntoList!0 (_2!420 lt!7683) (_1!422 lt!7682) nBits!460) lt!8477)))

(assert (= (and d!2106 c!341) b!6357))

(assert (= (and d!2106 (not c!341)) b!6358))

(assert (= (and d!2106 c!340) b!6359))

(assert (= (and d!2106 (not c!340)) b!6360))

(declare-fun m!8071 () Bool)

(assert (=> b!6358 m!8071))

(declare-fun m!8073 () Bool)

(assert (=> b!6358 m!8073))

(declare-fun m!8075 () Bool)

(assert (=> b!6360 m!8075))

(declare-fun m!8077 () Bool)

(assert (=> b!6359 m!8077))

(assert (=> b!6038 d!2106))

(check-sat (not b!6242) (not d!2100) (not b!6358) (not d!2102) (not d!2010) (not b!6336) (not b!6250) (not b!6280) (not b!6332) (not bm!68) (not b!6246) (not d!2038) (not d!2058) (not b!6334) (not d!2026) (not b!6241) (not d!2090) (not b!6333) (not b!6248) (not d!2088) (not b!6243) (not b!6090) (not b!6360) (not b!6282) (not b!6247) (not d!2056) (not b!6359) (not b!6088) (not b!6281) (not b!6150) (not d!2064) (not b!6108))
