; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1662 () Bool)

(assert start!1662)

(declare-fun res!8710 () Bool)

(declare-fun e!5071 () Bool)

(assert (=> start!1662 (=> (not res!8710) (not e!5071))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!538 0))(
  ( (array!539 (arr!639 (Array (_ BitVec 32) (_ BitVec 8))) (size!234 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!538)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1662 (= res!8710 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!234 srcBuffer!6))))))))

(assert (=> start!1662 e!5071))

(assert (=> start!1662 true))

(declare-fun array_inv!229 (array!538) Bool)

(assert (=> start!1662 (array_inv!229 srcBuffer!6)))

(declare-datatypes ((BitStream!446 0))(
  ( (BitStream!447 (buf!570 array!538) (currentByte!1579 (_ BitVec 32)) (currentBit!1574 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!446)

(declare-fun e!5072 () Bool)

(declare-fun inv!12 (BitStream!446) Bool)

(assert (=> start!1662 (and (inv!12 thiss!1486) e!5072)))

(declare-fun b!8092 () Bool)

(declare-fun res!8709 () Bool)

(assert (=> b!8092 (=> (not res!8709) (not e!5071))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8092 (= res!8709 (validate_offset_bits!1 ((_ sign_extend 32) (size!234 (buf!570 thiss!1486))) ((_ sign_extend 32) (currentByte!1579 thiss!1486)) ((_ sign_extend 32) (currentBit!1574 thiss!1486)) nBits!460))))

(declare-fun b!8093 () Bool)

(declare-datatypes ((Unit!638 0))(
  ( (Unit!639) )
))
(declare-datatypes ((tuple2!1088 0))(
  ( (tuple2!1089 (_1!575 Unit!638) (_2!575 BitStream!446)) )
))
(declare-fun lt!10745 () tuple2!1088)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!8093 (= e!5071 (not (invariant!0 (currentBit!1574 (_2!575 lt!10745)) (currentByte!1579 (_2!575 lt!10745)) (size!234 (buf!570 (_2!575 lt!10745))))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!446 array!538 (_ BitVec 64) (_ BitVec 64)) tuple2!1088)

(assert (=> b!8093 (= lt!10745 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!8094 () Bool)

(assert (=> b!8094 (= e!5072 (array_inv!229 (buf!570 thiss!1486)))))

(assert (= (and start!1662 res!8710) b!8092))

(assert (= (and b!8092 res!8709) b!8093))

(assert (= start!1662 b!8094))

(declare-fun m!10467 () Bool)

(assert (=> start!1662 m!10467))

(declare-fun m!10469 () Bool)

(assert (=> start!1662 m!10469))

(declare-fun m!10471 () Bool)

(assert (=> b!8092 m!10471))

(declare-fun m!10473 () Bool)

(assert (=> b!8093 m!10473))

(declare-fun m!10475 () Bool)

(assert (=> b!8093 m!10475))

(declare-fun m!10477 () Bool)

(assert (=> b!8094 m!10477))

(push 1)

(assert (not b!8092))

(assert (not start!1662))

(assert (not b!8094))

(assert (not b!8093))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2360 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2360 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!234 (buf!570 thiss!1486))) ((_ sign_extend 32) (currentByte!1579 thiss!1486)) ((_ sign_extend 32) (currentBit!1574 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!234 (buf!570 thiss!1486))) ((_ sign_extend 32) (currentByte!1579 thiss!1486)) ((_ sign_extend 32) (currentBit!1574 thiss!1486))) nBits!460))))

(declare-fun bs!812 () Bool)

(assert (= bs!812 d!2360))

(declare-fun m!10479 () Bool)

(assert (=> bs!812 m!10479))

(assert (=> b!8092 d!2360))

(declare-fun d!2364 () Bool)

(assert (=> d!2364 (= (array_inv!229 srcBuffer!6) (bvsge (size!234 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1662 d!2364))

(declare-fun d!2366 () Bool)

(assert (=> d!2366 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1574 thiss!1486) (currentByte!1579 thiss!1486) (size!234 (buf!570 thiss!1486))))))

(declare-fun bs!813 () Bool)

(assert (= bs!813 d!2366))

(declare-fun m!10481 () Bool)

(assert (=> bs!813 m!10481))

(assert (=> start!1662 d!2366))

(declare-fun d!2370 () Bool)

(assert (=> d!2370 (= (array_inv!229 (buf!570 thiss!1486)) (bvsge (size!234 (buf!570 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!8094 d!2370))

(declare-fun d!2372 () Bool)

(assert (=> d!2372 (= (invariant!0 (currentBit!1574 (_2!575 lt!10745)) (currentByte!1579 (_2!575 lt!10745)) (size!234 (buf!570 (_2!575 lt!10745)))) (and (bvsge (currentBit!1574 (_2!575 lt!10745)) #b00000000000000000000000000000000) (bvslt (currentBit!1574 (_2!575 lt!10745)) #b00000000000000000000000000001000) (bvsge (currentByte!1579 (_2!575 lt!10745)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1579 (_2!575 lt!10745)) (size!234 (buf!570 (_2!575 lt!10745)))) (and (= (currentBit!1574 (_2!575 lt!10745)) #b00000000000000000000000000000000) (= (currentByte!1579 (_2!575 lt!10745)) (size!234 (buf!570 (_2!575 lt!10745))))))))))

(assert (=> b!8093 d!2372))

(declare-fun c!445 () Bool)

(declare-fun bm!97 () Bool)

(declare-fun lt!11065 () tuple2!1088)

(declare-datatypes ((tuple2!1090 0))(
  ( (tuple2!1091 (_1!576 BitStream!446) (_2!576 BitStream!446)) )
))
(declare-fun call!100 () tuple2!1090)

(declare-fun reader!0 (BitStream!446 BitStream!446) tuple2!1090)

(assert (=> bm!97 (= call!100 (reader!0 thiss!1486 (ite c!445 (_2!575 lt!11065) thiss!1486)))))

(declare-fun b!8151 () Bool)

(declare-fun res!8754 () Bool)

(declare-fun e!5096 () Bool)

(assert (=> b!8151 (=> (not res!8754) (not e!5096))))

(declare-fun lt!11080 () tuple2!1088)

(assert (=> b!8151 (= res!8754 (= (size!234 (buf!570 thiss!1486)) (size!234 (buf!570 (_2!575 lt!11080)))))))

(declare-fun b!8152 () Bool)

(declare-fun e!5095 () tuple2!1088)

(declare-fun Unit!641 () Unit!638)

(assert (=> b!8152 (= e!5095 (tuple2!1089 Unit!641 thiss!1486))))

(assert (=> b!8152 (= (size!234 (buf!570 thiss!1486)) (size!234 (buf!570 thiss!1486)))))

(declare-fun lt!11058 () Unit!638)

(declare-fun Unit!642 () Unit!638)

(assert (=> b!8152 (= lt!11058 Unit!642)))

(declare-fun checkByteArrayBitContent!0 (BitStream!446 array!538 array!538 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!1094 0))(
  ( (tuple2!1095 (_1!578 array!538) (_2!578 BitStream!446)) )
))
(declare-fun readBits!0 (BitStream!446 (_ BitVec 64)) tuple2!1094)

(assert (=> b!8152 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!578 (readBits!0 (_1!576 call!100) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun d!2378 () Bool)

(assert (=> d!2378 e!5096))

(declare-fun res!8757 () Bool)

(assert (=> d!2378 (=> (not res!8757) (not e!5096))))

(declare-fun lt!11072 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!2378 (= res!8757 (= (bitIndex!0 (size!234 (buf!570 (_2!575 lt!11080))) (currentByte!1579 (_2!575 lt!11080)) (currentBit!1574 (_2!575 lt!11080))) (bvsub lt!11072 from!367)))))

(assert (=> d!2378 (or (= (bvand lt!11072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!11072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!11072 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!11096 () (_ BitVec 64))

(assert (=> d!2378 (= lt!11072 (bvadd lt!11096 from!367 nBits!460))))

(assert (=> d!2378 (or (not (= (bvand lt!11096 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!11096 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!11096 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2378 (= lt!11096 (bitIndex!0 (size!234 (buf!570 thiss!1486)) (currentByte!1579 thiss!1486) (currentBit!1574 thiss!1486)))))

(assert (=> d!2378 (= lt!11080 e!5095)))

(assert (=> d!2378 (= c!445 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!11070 () Unit!638)

(declare-fun lt!11059 () Unit!638)

(assert (=> d!2378 (= lt!11070 lt!11059)))

(declare-fun isPrefixOf!0 (BitStream!446 BitStream!446) Bool)

(assert (=> d!2378 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!446) Unit!638)

(assert (=> d!2378 (= lt!11059 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!11094 () (_ BitVec 64))

(assert (=> d!2378 (= lt!11094 (bitIndex!0 (size!234 (buf!570 thiss!1486)) (currentByte!1579 thiss!1486) (currentBit!1574 thiss!1486)))))

(assert (=> d!2378 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2378 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!11080)))

(declare-fun b!8153 () Bool)

(declare-fun res!8753 () Bool)

(assert (=> b!8153 (=> (not res!8753) (not e!5096))))

(assert (=> b!8153 (= res!8753 (isPrefixOf!0 thiss!1486 (_2!575 lt!11080)))))

(declare-fun lt!11084 () tuple2!1090)

(declare-fun b!8154 () Bool)

(declare-datatypes ((List!130 0))(
  ( (Nil!127) (Cons!126 (h!245 Bool) (t!880 List!130)) )
))
(declare-fun bitStreamReadBitsIntoList!0 (BitStream!446 BitStream!446 (_ BitVec 64)) List!130)

(declare-fun byteArrayBitContentToList!0 (BitStream!446 array!538 (_ BitVec 64) (_ BitVec 64)) List!130)

(assert (=> b!8154 (= e!5096 (= (bitStreamReadBitsIntoList!0 (_2!575 lt!11080) (_1!576 lt!11084) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!575 lt!11080) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!8154 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8154 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!11088 () Unit!638)

(declare-fun lt!11097 () Unit!638)

(assert (=> b!8154 (= lt!11088 lt!11097)))

(declare-fun lt!11081 () (_ BitVec 64))

(assert (=> b!8154 (validate_offset_bits!1 ((_ sign_extend 32) (size!234 (buf!570 (_2!575 lt!11080)))) ((_ sign_extend 32) (currentByte!1579 thiss!1486)) ((_ sign_extend 32) (currentBit!1574 thiss!1486)) lt!11081)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!446 array!538 (_ BitVec 64)) Unit!638)

(assert (=> b!8154 (= lt!11097 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!570 (_2!575 lt!11080)) lt!11081))))

(declare-fun e!5094 () Bool)

(assert (=> b!8154 e!5094))

(declare-fun res!8758 () Bool)

(assert (=> b!8154 (=> (not res!8758) (not e!5094))))

(assert (=> b!8154 (= res!8758 (and (= (size!234 (buf!570 thiss!1486)) (size!234 (buf!570 (_2!575 lt!11080)))) (bvsge lt!11081 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8154 (= lt!11081 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!8154 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8154 (= lt!11084 (reader!0 thiss!1486 (_2!575 lt!11080)))))

(declare-fun b!8155 () Bool)

(declare-fun res!8755 () Bool)

(assert (=> b!8155 (=> (not res!8755) (not e!5096))))

(assert (=> b!8155 (= res!8755 (= (size!234 (buf!570 (_2!575 lt!11080))) (size!234 (buf!570 thiss!1486))))))

(declare-fun b!8156 () Bool)

(assert (=> b!8156 (= e!5094 (validate_offset_bits!1 ((_ sign_extend 32) (size!234 (buf!570 thiss!1486))) ((_ sign_extend 32) (currentByte!1579 thiss!1486)) ((_ sign_extend 32) (currentBit!1574 thiss!1486)) lt!11081))))

(declare-fun b!8157 () Bool)

(declare-fun res!8756 () Bool)

(assert (=> b!8157 (=> (not res!8756) (not e!5096))))

(assert (=> b!8157 (= res!8756 (invariant!0 (currentBit!1574 (_2!575 lt!11080)) (currentByte!1579 (_2!575 lt!11080)) (size!234 (buf!570 (_2!575 lt!11080)))))))

(declare-fun b!8158 () Bool)

(declare-fun Unit!651 () Unit!638)

(assert (=> b!8158 (= e!5095 (tuple2!1089 Unit!651 (_2!575 lt!11065)))))

(declare-fun lt!11093 () tuple2!1088)

(declare-fun appendBitFromByte!0 (BitStream!446 (_ BitVec 8) (_ BitVec 32)) tuple2!1088)

(assert (=> b!8158 (= lt!11093 (appendBitFromByte!0 thiss!1486 (select (arr!639 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!11095 () (_ BitVec 64))

(assert (=> b!8158 (= lt!11095 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11069 () (_ BitVec 64))

(assert (=> b!8158 (= lt!11069 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!11055 () Unit!638)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!446 BitStream!446 (_ BitVec 64) (_ BitVec 64)) Unit!638)

(assert (=> b!8158 (= lt!11055 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!575 lt!11093) lt!11095 lt!11069))))

(assert (=> b!8158 (validate_offset_bits!1 ((_ sign_extend 32) (size!234 (buf!570 (_2!575 lt!11093)))) ((_ sign_extend 32) (currentByte!1579 (_2!575 lt!11093))) ((_ sign_extend 32) (currentBit!1574 (_2!575 lt!11093))) (bvsub lt!11095 lt!11069))))

(declare-fun lt!11083 () Unit!638)

(assert (=> b!8158 (= lt!11083 lt!11055)))

(declare-fun lt!11090 () tuple2!1090)

(assert (=> b!8158 (= lt!11090 (reader!0 thiss!1486 (_2!575 lt!11093)))))

(declare-fun lt!11085 () (_ BitVec 64))

(assert (=> b!8158 (= lt!11085 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!11089 () Unit!638)

(assert (=> b!8158 (= lt!11089 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!570 (_2!575 lt!11093)) lt!11085))))

(assert (=> b!8158 (validate_offset_bits!1 ((_ sign_extend 32) (size!234 (buf!570 (_2!575 lt!11093)))) ((_ sign_extend 32) (currentByte!1579 thiss!1486)) ((_ sign_extend 32) (currentBit!1574 thiss!1486)) lt!11085)))

(declare-fun lt!11057 () Unit!638)

(assert (=> b!8158 (= lt!11057 lt!11089)))

(declare-fun head!36 (List!130) Bool)

(assert (=> b!8158 (= (head!36 (byteArrayBitContentToList!0 (_2!575 lt!11093) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!36 (bitStreamReadBitsIntoList!0 (_2!575 lt!11093) (_1!576 lt!11090) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11075 () Unit!638)

(declare-fun Unit!653 () Unit!638)

(assert (=> b!8158 (= lt!11075 Unit!653)))

(assert (=> b!8158 (= lt!11065 (appendBitsMSBFirstLoop!0 (_2!575 lt!11093) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!11079 () Unit!638)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!446 BitStream!446 BitStream!446) Unit!638)

(assert (=> b!8158 (= lt!11079 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!575 lt!11093) (_2!575 lt!11065)))))

(assert (=> b!8158 (isPrefixOf!0 thiss!1486 (_2!575 lt!11065))))

(declare-fun lt!11077 () Unit!638)

(assert (=> b!8158 (= lt!11077 lt!11079)))

(assert (=> b!8158 (= (size!234 (buf!570 (_2!575 lt!11065))) (size!234 (buf!570 thiss!1486)))))

(declare-fun lt!11092 () Unit!638)

(declare-fun Unit!655 () Unit!638)

(assert (=> b!8158 (= lt!11092 Unit!655)))

(assert (=> b!8158 (= (bitIndex!0 (size!234 (buf!570 (_2!575 lt!11065))) (currentByte!1579 (_2!575 lt!11065)) (currentBit!1574 (_2!575 lt!11065))) (bvsub (bvadd (bitIndex!0 (size!234 (buf!570 thiss!1486)) (currentByte!1579 thiss!1486) (currentBit!1574 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!11071 () Unit!638)

(declare-fun Unit!658 () Unit!638)

(assert (=> b!8158 (= lt!11071 Unit!658)))

(assert (=> b!8158 (= (bitIndex!0 (size!234 (buf!570 (_2!575 lt!11065))) (currentByte!1579 (_2!575 lt!11065)) (currentBit!1574 (_2!575 lt!11065))) (bvsub (bvsub (bvadd (bitIndex!0 (size!234 (buf!570 (_2!575 lt!11093))) (currentByte!1579 (_2!575 lt!11093)) (currentBit!1574 (_2!575 lt!11093))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!11054 () Unit!638)

(declare-fun Unit!660 () Unit!638)

(assert (=> b!8158 (= lt!11054 Unit!660)))

(declare-fun lt!11087 () tuple2!1090)

(assert (=> b!8158 (= lt!11087 call!100)))

(declare-fun lt!11073 () (_ BitVec 64))

(assert (=> b!8158 (= lt!11073 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11061 () Unit!638)

(assert (=> b!8158 (= lt!11061 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!570 (_2!575 lt!11065)) lt!11073))))

(assert (=> b!8158 (validate_offset_bits!1 ((_ sign_extend 32) (size!234 (buf!570 (_2!575 lt!11065)))) ((_ sign_extend 32) (currentByte!1579 thiss!1486)) ((_ sign_extend 32) (currentBit!1574 thiss!1486)) lt!11073)))

(declare-fun lt!11066 () Unit!638)

(assert (=> b!8158 (= lt!11066 lt!11061)))

(declare-fun lt!11060 () tuple2!1090)

(assert (=> b!8158 (= lt!11060 (reader!0 (_2!575 lt!11093) (_2!575 lt!11065)))))

(declare-fun lt!11063 () (_ BitVec 64))

(assert (=> b!8158 (= lt!11063 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!11064 () Unit!638)

(assert (=> b!8158 (= lt!11064 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!575 lt!11093) (buf!570 (_2!575 lt!11065)) lt!11063))))

(assert (=> b!8158 (validate_offset_bits!1 ((_ sign_extend 32) (size!234 (buf!570 (_2!575 lt!11065)))) ((_ sign_extend 32) (currentByte!1579 (_2!575 lt!11093))) ((_ sign_extend 32) (currentBit!1574 (_2!575 lt!11093))) lt!11063)))

(declare-fun lt!11082 () Unit!638)

(assert (=> b!8158 (= lt!11082 lt!11064)))

(declare-fun lt!11056 () List!130)

(assert (=> b!8158 (= lt!11056 (byteArrayBitContentToList!0 (_2!575 lt!11065) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!11076 () List!130)

(assert (=> b!8158 (= lt!11076 (byteArrayBitContentToList!0 (_2!575 lt!11065) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11074 () List!130)

(assert (=> b!8158 (= lt!11074 (bitStreamReadBitsIntoList!0 (_2!575 lt!11065) (_1!576 lt!11087) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!11067 () List!130)

(assert (=> b!8158 (= lt!11067 (bitStreamReadBitsIntoList!0 (_2!575 lt!11065) (_1!576 lt!11060) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11091 () (_ BitVec 64))

(assert (=> b!8158 (= lt!11091 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11086 () Unit!638)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!446 BitStream!446 BitStream!446 BitStream!446 (_ BitVec 64) List!130) Unit!638)

(assert (=> b!8158 (= lt!11086 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!575 lt!11065) (_2!575 lt!11065) (_1!576 lt!11087) (_1!576 lt!11060) lt!11091 lt!11074))))

(declare-fun tail!45 (List!130) List!130)

(assert (=> b!8158 (= (bitStreamReadBitsIntoList!0 (_2!575 lt!11065) (_1!576 lt!11060) (bvsub lt!11091 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!45 lt!11074))))

(declare-fun lt!11078 () Unit!638)

(assert (=> b!8158 (= lt!11078 lt!11086)))

(declare-fun lt!11068 () Unit!638)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!538 array!538 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!638)

(assert (=> b!8158 (= lt!11068 (arrayBitRangesEqImpliesEq!0 (buf!570 (_2!575 lt!11093)) (buf!570 (_2!575 lt!11065)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!11094 (bitIndex!0 (size!234 (buf!570 (_2!575 lt!11093))) (currentByte!1579 (_2!575 lt!11093)) (currentBit!1574 (_2!575 lt!11093)))))))

(declare-fun bitAt!0 (array!538 (_ BitVec 64)) Bool)

(assert (=> b!8158 (= (bitAt!0 (buf!570 (_2!575 lt!11093)) lt!11094) (bitAt!0 (buf!570 (_2!575 lt!11065)) lt!11094))))

(declare-fun lt!11062 () Unit!638)

(assert (=> b!8158 (= lt!11062 lt!11068)))

(assert (= (and d!2378 c!445) b!8158))

(assert (= (and d!2378 (not c!445)) b!8152))

(assert (= (or b!8158 b!8152) bm!97))

(assert (= (and d!2378 res!8757) b!8157))

(assert (= (and b!8157 res!8756) b!8151))

(assert (= (and b!8151 res!8754) b!8153))

(assert (= (and b!8153 res!8753) b!8155))

(assert (= (and b!8155 res!8755) b!8154))

(assert (= (and b!8154 res!8758) b!8156))

(declare-fun m!10485 () Bool)

(assert (=> b!8153 m!10485))

(declare-fun m!10487 () Bool)

(assert (=> d!2378 m!10487))

(declare-fun m!10491 () Bool)

(assert (=> d!2378 m!10491))

(declare-fun m!10495 () Bool)

(assert (=> d!2378 m!10495))

(declare-fun m!10499 () Bool)

(assert (=> d!2378 m!10499))

(declare-fun m!10503 () Bool)

(assert (=> b!8157 m!10503))

(declare-fun m!10507 () Bool)

(assert (=> b!8154 m!10507))

(declare-fun m!10511 () Bool)

(assert (=> b!8154 m!10511))

(declare-fun m!10515 () Bool)

(assert (=> b!8154 m!10515))

(declare-fun m!10517 () Bool)

(assert (=> b!8154 m!10517))

(declare-fun m!10523 () Bool)

(assert (=> b!8154 m!10523))

(declare-fun m!10525 () Bool)

(assert (=> b!8152 m!10525))

(declare-fun m!10531 () Bool)

(assert (=> b!8152 m!10531))

(declare-fun m!10537 () Bool)

(assert (=> b!8158 m!10537))

(declare-fun m!10539 () Bool)

(assert (=> b!8158 m!10539))

(declare-fun m!10543 () Bool)

(assert (=> b!8158 m!10543))

(declare-fun m!10545 () Bool)

(assert (=> b!8158 m!10545))

(declare-fun m!10549 () Bool)

(assert (=> b!8158 m!10549))

(declare-fun m!10551 () Bool)

(assert (=> b!8158 m!10551))

(declare-fun m!10555 () Bool)

(assert (=> b!8158 m!10555))

(assert (=> b!8158 m!10491))

(declare-fun m!10561 () Bool)

(assert (=> b!8158 m!10561))

(declare-fun m!10565 () Bool)

(assert (=> b!8158 m!10565))

(declare-fun m!10569 () Bool)

(assert (=> b!8158 m!10569))

(declare-fun m!10571 () Bool)

(assert (=> b!8158 m!10571))

(declare-fun m!10575 () Bool)

(assert (=> b!8158 m!10575))

(declare-fun m!10579 () Bool)

(assert (=> b!8158 m!10579))

(declare-fun m!10581 () Bool)

(assert (=> b!8158 m!10581))

(declare-fun m!10585 () Bool)

(assert (=> b!8158 m!10585))

(declare-fun m!10589 () Bool)

(assert (=> b!8158 m!10589))

(declare-fun m!10593 () Bool)

(assert (=> b!8158 m!10593))

(declare-fun m!10599 () Bool)

(assert (=> b!8158 m!10599))

(declare-fun m!10601 () Bool)

(assert (=> b!8158 m!10601))

(declare-fun m!10605 () Bool)

(assert (=> b!8158 m!10605))

(declare-fun m!10609 () Bool)

(assert (=> b!8158 m!10609))

(assert (=> b!8158 m!10575))

(declare-fun m!10615 () Bool)

(assert (=> b!8158 m!10615))

(assert (=> b!8158 m!10599))

(declare-fun m!10621 () Bool)

(assert (=> b!8158 m!10621))

(declare-fun m!10623 () Bool)

(assert (=> b!8158 m!10623))

(declare-fun m!10627 () Bool)

(assert (=> b!8158 m!10627))

(declare-fun m!10631 () Bool)

(assert (=> b!8158 m!10631))

(declare-fun m!10637 () Bool)

(assert (=> b!8158 m!10637))

(declare-fun m!10639 () Bool)

(assert (=> b!8158 m!10639))

(assert (=> b!8158 m!10569))

(declare-fun m!10645 () Bool)

(assert (=> b!8158 m!10645))

(assert (=> b!8158 m!10645))

(declare-fun m!10651 () Bool)

(assert (=> b!8158 m!10651))

(declare-fun m!10657 () Bool)

(assert (=> b!8158 m!10657))

(declare-fun m!10661 () Bool)

(assert (=> bm!97 m!10661))

(declare-fun m!10665 () Bool)

(assert (=> b!8156 m!10665))

(assert (=> b!8093 d!2378))

(push 1)

