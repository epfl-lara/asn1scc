; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1658 () Bool)

(assert start!1658)

(declare-fun res!8697 () Bool)

(declare-fun e!5047 () Bool)

(assert (=> start!1658 (=> (not res!8697) (not e!5047))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!534 0))(
  ( (array!535 (arr!637 (Array (_ BitVec 32) (_ BitVec 8))) (size!232 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!534)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1658 (= res!8697 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!232 srcBuffer!6))))))))

(assert (=> start!1658 e!5047))

(assert (=> start!1658 true))

(declare-fun array_inv!227 (array!534) Bool)

(assert (=> start!1658 (array_inv!227 srcBuffer!6)))

(declare-datatypes ((BitStream!442 0))(
  ( (BitStream!443 (buf!568 array!534) (currentByte!1577 (_ BitVec 32)) (currentBit!1572 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!442)

(declare-fun e!5048 () Bool)

(declare-fun inv!12 (BitStream!442) Bool)

(assert (=> start!1658 (and (inv!12 thiss!1486) e!5048)))

(declare-fun b!8074 () Bool)

(declare-fun res!8698 () Bool)

(assert (=> b!8074 (=> (not res!8698) (not e!5047))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8074 (= res!8698 (validate_offset_bits!1 ((_ sign_extend 32) (size!232 (buf!568 thiss!1486))) ((_ sign_extend 32) (currentByte!1577 thiss!1486)) ((_ sign_extend 32) (currentBit!1572 thiss!1486)) nBits!460))))

(declare-fun b!8075 () Bool)

(declare-datatypes ((Unit!634 0))(
  ( (Unit!635) )
))
(declare-datatypes ((tuple2!1084 0))(
  ( (tuple2!1085 (_1!573 Unit!634) (_2!573 BitStream!442)) )
))
(declare-fun lt!10739 () tuple2!1084)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!8075 (= e!5047 (not (invariant!0 (currentBit!1572 (_2!573 lt!10739)) (currentByte!1577 (_2!573 lt!10739)) (size!232 (buf!568 (_2!573 lt!10739))))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!442 array!534 (_ BitVec 64) (_ BitVec 64)) tuple2!1084)

(assert (=> b!8075 (= lt!10739 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!8076 () Bool)

(assert (=> b!8076 (= e!5048 (array_inv!227 (buf!568 thiss!1486)))))

(assert (= (and start!1658 res!8697) b!8074))

(assert (= (and b!8074 res!8698) b!8075))

(assert (= start!1658 b!8076))

(declare-fun m!10443 () Bool)

(assert (=> start!1658 m!10443))

(declare-fun m!10445 () Bool)

(assert (=> start!1658 m!10445))

(declare-fun m!10447 () Bool)

(assert (=> b!8074 m!10447))

(declare-fun m!10449 () Bool)

(assert (=> b!8075 m!10449))

(declare-fun m!10451 () Bool)

(assert (=> b!8075 m!10451))

(declare-fun m!10453 () Bool)

(assert (=> b!8076 m!10453))

(push 1)

(assert (not b!8076))

(assert (not b!8075))

(assert (not b!8074))

(assert (not start!1658))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2374 () Bool)

(assert (=> d!2374 (= (array_inv!227 (buf!568 thiss!1486)) (bvsge (size!232 (buf!568 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!8076 d!2374))

(declare-fun d!2376 () Bool)

(assert (=> d!2376 (= (invariant!0 (currentBit!1572 (_2!573 lt!10739)) (currentByte!1577 (_2!573 lt!10739)) (size!232 (buf!568 (_2!573 lt!10739)))) (and (bvsge (currentBit!1572 (_2!573 lt!10739)) #b00000000000000000000000000000000) (bvslt (currentBit!1572 (_2!573 lt!10739)) #b00000000000000000000000000001000) (bvsge (currentByte!1577 (_2!573 lt!10739)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1577 (_2!573 lt!10739)) (size!232 (buf!568 (_2!573 lt!10739)))) (and (= (currentBit!1572 (_2!573 lt!10739)) #b00000000000000000000000000000000) (= (currentByte!1577 (_2!573 lt!10739)) (size!232 (buf!568 (_2!573 lt!10739))))))))))

(assert (=> b!8075 d!2376))

(declare-fun b!8159 () Bool)

(declare-fun e!5099 () tuple2!1084)

(declare-fun Unit!647 () Unit!634)

(assert (=> b!8159 (= e!5099 (tuple2!1085 Unit!647 thiss!1486))))

(assert (=> b!8159 (= (size!232 (buf!568 thiss!1486)) (size!232 (buf!568 thiss!1486)))))

(declare-fun lt!11128 () Unit!634)

(declare-fun Unit!648 () Unit!634)

(assert (=> b!8159 (= lt!11128 Unit!648)))

(declare-datatypes ((tuple2!1096 0))(
  ( (tuple2!1097 (_1!579 BitStream!442) (_2!579 BitStream!442)) )
))
(declare-fun call!101 () tuple2!1096)

(declare-fun checkByteArrayBitContent!0 (BitStream!442 array!534 array!534 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!1098 0))(
  ( (tuple2!1099 (_1!580 array!534) (_2!580 BitStream!442)) )
))
(declare-fun readBits!0 (BitStream!442 (_ BitVec 64)) tuple2!1098)

(assert (=> b!8159 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!580 (readBits!0 (_1!579 call!101) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11107 () tuple2!1096)

(declare-fun b!8160 () Bool)

(declare-fun lt!11135 () tuple2!1084)

(declare-fun e!5097 () Bool)

(declare-datatypes ((List!131 0))(
  ( (Nil!128) (Cons!127 (h!246 Bool) (t!881 List!131)) )
))
(declare-fun bitStreamReadBitsIntoList!0 (BitStream!442 BitStream!442 (_ BitVec 64)) List!131)

(declare-fun byteArrayBitContentToList!0 (BitStream!442 array!534 (_ BitVec 64) (_ BitVec 64)) List!131)

(assert (=> b!8160 (= e!5097 (= (bitStreamReadBitsIntoList!0 (_2!573 lt!11135) (_1!579 lt!11107) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!573 lt!11135) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!8160 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8160 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!11113 () Unit!634)

(declare-fun lt!11131 () Unit!634)

(assert (=> b!8160 (= lt!11113 lt!11131)))

(declare-fun lt!11111 () (_ BitVec 64))

(assert (=> b!8160 (validate_offset_bits!1 ((_ sign_extend 32) (size!232 (buf!568 (_2!573 lt!11135)))) ((_ sign_extend 32) (currentByte!1577 thiss!1486)) ((_ sign_extend 32) (currentBit!1572 thiss!1486)) lt!11111)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!442 array!534 (_ BitVec 64)) Unit!634)

(assert (=> b!8160 (= lt!11131 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!568 (_2!573 lt!11135)) lt!11111))))

(declare-fun e!5098 () Bool)

(assert (=> b!8160 e!5098))

(declare-fun res!8759 () Bool)

(assert (=> b!8160 (=> (not res!8759) (not e!5098))))

(assert (=> b!8160 (= res!8759 (and (= (size!232 (buf!568 thiss!1486)) (size!232 (buf!568 (_2!573 lt!11135)))) (bvsge lt!11111 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8160 (= lt!11111 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!8160 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!442 BitStream!442) tuple2!1096)

(assert (=> b!8160 (= lt!11107 (reader!0 thiss!1486 (_2!573 lt!11135)))))

(declare-fun c!446 () Bool)

(declare-fun bm!98 () Bool)

(declare-fun lt!11141 () tuple2!1084)

(assert (=> bm!98 (= call!101 (reader!0 thiss!1486 (ite c!446 (_2!573 lt!11141) thiss!1486)))))

(declare-fun b!8161 () Bool)

(declare-fun res!8763 () Bool)

(assert (=> b!8161 (=> (not res!8763) (not e!5097))))

(assert (=> b!8161 (= res!8763 (= (size!232 (buf!568 (_2!573 lt!11135))) (size!232 (buf!568 thiss!1486))))))

(declare-fun b!8162 () Bool)

(declare-fun res!8761 () Bool)

(assert (=> b!8162 (=> (not res!8761) (not e!5097))))

(assert (=> b!8162 (= res!8761 (invariant!0 (currentBit!1572 (_2!573 lt!11135)) (currentByte!1577 (_2!573 lt!11135)) (size!232 (buf!568 (_2!573 lt!11135)))))))

(declare-fun b!8163 () Bool)

(declare-fun res!8760 () Bool)

(assert (=> b!8163 (=> (not res!8760) (not e!5097))))

(assert (=> b!8163 (= res!8760 (= (size!232 (buf!568 thiss!1486)) (size!232 (buf!568 (_2!573 lt!11135)))))))

(declare-fun b!8164 () Bool)

(declare-fun res!8762 () Bool)

(assert (=> b!8164 (=> (not res!8762) (not e!5097))))

(declare-fun isPrefixOf!0 (BitStream!442 BitStream!442) Bool)

(assert (=> b!8164 (= res!8762 (isPrefixOf!0 thiss!1486 (_2!573 lt!11135)))))

(declare-fun d!2380 () Bool)

(assert (=> d!2380 e!5097))

(declare-fun res!8764 () Bool)

(assert (=> d!2380 (=> (not res!8764) (not e!5097))))

(declare-fun lt!11136 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!2380 (= res!8764 (= (bitIndex!0 (size!232 (buf!568 (_2!573 lt!11135))) (currentByte!1577 (_2!573 lt!11135)) (currentBit!1572 (_2!573 lt!11135))) (bvsub lt!11136 from!367)))))

(assert (=> d!2380 (or (= (bvand lt!11136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!11136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!11136 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!11116 () (_ BitVec 64))

(assert (=> d!2380 (= lt!11136 (bvadd lt!11116 from!367 nBits!460))))

(assert (=> d!2380 (or (not (= (bvand lt!11116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!11116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!11116 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2380 (= lt!11116 (bitIndex!0 (size!232 (buf!568 thiss!1486)) (currentByte!1577 thiss!1486) (currentBit!1572 thiss!1486)))))

(assert (=> d!2380 (= lt!11135 e!5099)))

(assert (=> d!2380 (= c!446 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!11120 () Unit!634)

(declare-fun lt!11105 () Unit!634)

(assert (=> d!2380 (= lt!11120 lt!11105)))

(assert (=> d!2380 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!442) Unit!634)

(assert (=> d!2380 (= lt!11105 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!11098 () (_ BitVec 64))

(assert (=> d!2380 (= lt!11098 (bitIndex!0 (size!232 (buf!568 thiss!1486)) (currentByte!1577 thiss!1486) (currentBit!1572 thiss!1486)))))

(assert (=> d!2380 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2380 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!11135)))

(declare-fun b!8165 () Bool)

(declare-fun lt!11114 () tuple2!1084)

(declare-fun Unit!652 () Unit!634)

(assert (=> b!8165 (= e!5099 (tuple2!1085 Unit!652 (_2!573 lt!11114)))))

(declare-fun appendBitFromByte!0 (BitStream!442 (_ BitVec 8) (_ BitVec 32)) tuple2!1084)

(assert (=> b!8165 (= lt!11141 (appendBitFromByte!0 thiss!1486 (select (arr!637 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!11104 () (_ BitVec 64))

(assert (=> b!8165 (= lt!11104 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11112 () (_ BitVec 64))

(assert (=> b!8165 (= lt!11112 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!11134 () Unit!634)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!442 BitStream!442 (_ BitVec 64) (_ BitVec 64)) Unit!634)

(assert (=> b!8165 (= lt!11134 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!573 lt!11141) lt!11104 lt!11112))))

(assert (=> b!8165 (validate_offset_bits!1 ((_ sign_extend 32) (size!232 (buf!568 (_2!573 lt!11141)))) ((_ sign_extend 32) (currentByte!1577 (_2!573 lt!11141))) ((_ sign_extend 32) (currentBit!1572 (_2!573 lt!11141))) (bvsub lt!11104 lt!11112))))

(declare-fun lt!11123 () Unit!634)

(assert (=> b!8165 (= lt!11123 lt!11134)))

(declare-fun lt!11138 () tuple2!1096)

(assert (=> b!8165 (= lt!11138 call!101)))

(declare-fun lt!11115 () (_ BitVec 64))

(assert (=> b!8165 (= lt!11115 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!11127 () Unit!634)

(assert (=> b!8165 (= lt!11127 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!568 (_2!573 lt!11141)) lt!11115))))

(assert (=> b!8165 (validate_offset_bits!1 ((_ sign_extend 32) (size!232 (buf!568 (_2!573 lt!11141)))) ((_ sign_extend 32) (currentByte!1577 thiss!1486)) ((_ sign_extend 32) (currentBit!1572 thiss!1486)) lt!11115)))

(declare-fun lt!11108 () Unit!634)

(assert (=> b!8165 (= lt!11108 lt!11127)))

(declare-fun head!37 (List!131) Bool)

(assert (=> b!8165 (= (head!37 (byteArrayBitContentToList!0 (_2!573 lt!11141) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!37 (bitStreamReadBitsIntoList!0 (_2!573 lt!11141) (_1!579 lt!11138) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11140 () Unit!634)

(declare-fun Unit!654 () Unit!634)

(assert (=> b!8165 (= lt!11140 Unit!654)))

(assert (=> b!8165 (= lt!11114 (appendBitsMSBFirstLoop!0 (_2!573 lt!11141) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!11119 () Unit!634)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!442 BitStream!442 BitStream!442) Unit!634)

(assert (=> b!8165 (= lt!11119 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!573 lt!11141) (_2!573 lt!11114)))))

(assert (=> b!8165 (isPrefixOf!0 thiss!1486 (_2!573 lt!11114))))

(declare-fun lt!11130 () Unit!634)

(assert (=> b!8165 (= lt!11130 lt!11119)))

(assert (=> b!8165 (= (size!232 (buf!568 (_2!573 lt!11114))) (size!232 (buf!568 thiss!1486)))))

(declare-fun lt!11126 () Unit!634)

(declare-fun Unit!656 () Unit!634)

(assert (=> b!8165 (= lt!11126 Unit!656)))

(assert (=> b!8165 (= (bitIndex!0 (size!232 (buf!568 (_2!573 lt!11114))) (currentByte!1577 (_2!573 lt!11114)) (currentBit!1572 (_2!573 lt!11114))) (bvsub (bvadd (bitIndex!0 (size!232 (buf!568 thiss!1486)) (currentByte!1577 thiss!1486) (currentBit!1572 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!11122 () Unit!634)

(declare-fun Unit!657 () Unit!634)

(assert (=> b!8165 (= lt!11122 Unit!657)))

(assert (=> b!8165 (= (bitIndex!0 (size!232 (buf!568 (_2!573 lt!11114))) (currentByte!1577 (_2!573 lt!11114)) (currentBit!1572 (_2!573 lt!11114))) (bvsub (bvsub (bvadd (bitIndex!0 (size!232 (buf!568 (_2!573 lt!11141))) (currentByte!1577 (_2!573 lt!11141)) (currentBit!1572 (_2!573 lt!11141))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!11124 () Unit!634)

(declare-fun Unit!659 () Unit!634)

(assert (=> b!8165 (= lt!11124 Unit!659)))

(declare-fun lt!11132 () tuple2!1096)

(assert (=> b!8165 (= lt!11132 (reader!0 thiss!1486 (_2!573 lt!11114)))))

(declare-fun lt!11101 () (_ BitVec 64))

(assert (=> b!8165 (= lt!11101 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11137 () Unit!634)

(assert (=> b!8165 (= lt!11137 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!568 (_2!573 lt!11114)) lt!11101))))

(assert (=> b!8165 (validate_offset_bits!1 ((_ sign_extend 32) (size!232 (buf!568 (_2!573 lt!11114)))) ((_ sign_extend 32) (currentByte!1577 thiss!1486)) ((_ sign_extend 32) (currentBit!1572 thiss!1486)) lt!11101)))

(declare-fun lt!11129 () Unit!634)

(assert (=> b!8165 (= lt!11129 lt!11137)))

(declare-fun lt!11139 () tuple2!1096)

(assert (=> b!8165 (= lt!11139 (reader!0 (_2!573 lt!11141) (_2!573 lt!11114)))))

(declare-fun lt!11099 () (_ BitVec 64))

(assert (=> b!8165 (= lt!11099 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!11125 () Unit!634)

(assert (=> b!8165 (= lt!11125 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!573 lt!11141) (buf!568 (_2!573 lt!11114)) lt!11099))))

(assert (=> b!8165 (validate_offset_bits!1 ((_ sign_extend 32) (size!232 (buf!568 (_2!573 lt!11114)))) ((_ sign_extend 32) (currentByte!1577 (_2!573 lt!11141))) ((_ sign_extend 32) (currentBit!1572 (_2!573 lt!11141))) lt!11099)))

(declare-fun lt!11100 () Unit!634)

(assert (=> b!8165 (= lt!11100 lt!11125)))

(declare-fun lt!11121 () List!131)

(assert (=> b!8165 (= lt!11121 (byteArrayBitContentToList!0 (_2!573 lt!11114) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!11110 () List!131)

(assert (=> b!8165 (= lt!11110 (byteArrayBitContentToList!0 (_2!573 lt!11114) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11133 () List!131)

(assert (=> b!8165 (= lt!11133 (bitStreamReadBitsIntoList!0 (_2!573 lt!11114) (_1!579 lt!11132) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!11109 () List!131)

(assert (=> b!8165 (= lt!11109 (bitStreamReadBitsIntoList!0 (_2!573 lt!11114) (_1!579 lt!11139) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11102 () (_ BitVec 64))

(assert (=> b!8165 (= lt!11102 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11117 () Unit!634)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!442 BitStream!442 BitStream!442 BitStream!442 (_ BitVec 64) List!131) Unit!634)

(assert (=> b!8165 (= lt!11117 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!573 lt!11114) (_2!573 lt!11114) (_1!579 lt!11132) (_1!579 lt!11139) lt!11102 lt!11133))))

(declare-fun tail!44 (List!131) List!131)

(assert (=> b!8165 (= (bitStreamReadBitsIntoList!0 (_2!573 lt!11114) (_1!579 lt!11139) (bvsub lt!11102 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!44 lt!11133))))

(declare-fun lt!11106 () Unit!634)

(assert (=> b!8165 (= lt!11106 lt!11117)))

(declare-fun lt!11118 () Unit!634)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!534 array!534 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!634)

(assert (=> b!8165 (= lt!11118 (arrayBitRangesEqImpliesEq!0 (buf!568 (_2!573 lt!11141)) (buf!568 (_2!573 lt!11114)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!11098 (bitIndex!0 (size!232 (buf!568 (_2!573 lt!11141))) (currentByte!1577 (_2!573 lt!11141)) (currentBit!1572 (_2!573 lt!11141)))))))

(declare-fun bitAt!0 (array!534 (_ BitVec 64)) Bool)

(assert (=> b!8165 (= (bitAt!0 (buf!568 (_2!573 lt!11141)) lt!11098) (bitAt!0 (buf!568 (_2!573 lt!11114)) lt!11098))))

(declare-fun lt!11103 () Unit!634)

(assert (=> b!8165 (= lt!11103 lt!11118)))

(declare-fun b!8166 () Bool)

(assert (=> b!8166 (= e!5098 (validate_offset_bits!1 ((_ sign_extend 32) (size!232 (buf!568 thiss!1486))) ((_ sign_extend 32) (currentByte!1577 thiss!1486)) ((_ sign_extend 32) (currentBit!1572 thiss!1486)) lt!11111))))

(assert (= (and d!2380 c!446) b!8165))

(assert (= (and d!2380 (not c!446)) b!8159))

(assert (= (or b!8165 b!8159) bm!98))

(assert (= (and d!2380 res!8764) b!8162))

(assert (= (and b!8162 res!8761) b!8163))

(assert (= (and b!8163 res!8760) b!8164))

(assert (= (and b!8164 res!8762) b!8161))

(assert (= (and b!8161 res!8763) b!8160))

(assert (= (and b!8160 res!8759) b!8166))

(declare-fun m!10671 () Bool)

(assert (=> b!8166 m!10671))

(declare-fun m!10673 () Bool)

(assert (=> b!8160 m!10673))

(declare-fun m!10675 () Bool)

(assert (=> b!8160 m!10675))

(declare-fun m!10677 () Bool)

(assert (=> b!8160 m!10677))

(declare-fun m!10679 () Bool)

(assert (=> b!8160 m!10679))

(declare-fun m!10681 () Bool)

(assert (=> b!8160 m!10681))

(declare-fun m!10683 () Bool)

(assert (=> d!2380 m!10683))

(declare-fun m!10685 () Bool)

(assert (=> d!2380 m!10685))

(declare-fun m!10687 () Bool)

(assert (=> d!2380 m!10687))

(declare-fun m!10689 () Bool)

(assert (=> d!2380 m!10689))

(declare-fun m!10691 () Bool)

(assert (=> b!8162 m!10691))

(declare-fun m!10693 () Bool)

(assert (=> b!8165 m!10693))

(declare-fun m!10695 () Bool)

(assert (=> b!8165 m!10695))

(declare-fun m!10697 () Bool)

(assert (=> b!8165 m!10697))

(declare-fun m!10699 () Bool)

(assert (=> b!8165 m!10699))

(declare-fun m!10701 () Bool)

(assert (=> b!8165 m!10701))

(declare-fun m!10703 () Bool)

(assert (=> b!8165 m!10703))

(declare-fun m!10705 () Bool)

(assert (=> b!8165 m!10705))

(declare-fun m!10707 () Bool)

(assert (=> b!8165 m!10707))

(declare-fun m!10709 () Bool)

(assert (=> b!8165 m!10709))

(declare-fun m!10711 () Bool)

(assert (=> b!8165 m!10711))

(declare-fun m!10713 () Bool)

(assert (=> b!8165 m!10713))

(declare-fun m!10715 () Bool)

(assert (=> b!8165 m!10715))

(assert (=> b!8165 m!10705))

(declare-fun m!10717 () Bool)

(assert (=> b!8165 m!10717))

(assert (=> b!8165 m!10709))

(declare-fun m!10719 () Bool)

(assert (=> b!8165 m!10719))

(declare-fun m!10721 () Bool)

(assert (=> b!8165 m!10721))

(declare-fun m!10723 () Bool)

(assert (=> b!8165 m!10723))

(assert (=> b!8165 m!10721))

(declare-fun m!10725 () Bool)

(assert (=> b!8165 m!10725))

(declare-fun m!10727 () Bool)

(assert (=> b!8165 m!10727))

(assert (=> b!8165 m!10699))

(declare-fun m!10729 () Bool)

(assert (=> b!8165 m!10729))

(declare-fun m!10731 () Bool)

(assert (=> b!8165 m!10731))

(declare-fun m!10733 () Bool)

(assert (=> b!8165 m!10733))

(declare-fun m!10735 () Bool)

(assert (=> b!8165 m!10735))

(declare-fun m!10737 () Bool)

(assert (=> b!8165 m!10737))

(declare-fun m!10739 () Bool)

(assert (=> b!8165 m!10739))

(declare-fun m!10741 () Bool)

(assert (=> b!8165 m!10741))

(declare-fun m!10743 () Bool)

(assert (=> b!8165 m!10743))

(declare-fun m!10745 () Bool)

(assert (=> b!8165 m!10745))

(declare-fun m!10747 () Bool)

(assert (=> b!8165 m!10747))

(assert (=> b!8165 m!10685))

(declare-fun m!10749 () Bool)

(assert (=> b!8165 m!10749))

(declare-fun m!10751 () Bool)

(assert (=> b!8165 m!10751))

(declare-fun m!10753 () Bool)

(assert (=> b!8165 m!10753))

(declare-fun m!10755 () Bool)

(assert (=> b!8159 m!10755))

(declare-fun m!10757 () Bool)

(assert (=> b!8159 m!10757))

(declare-fun m!10759 () Bool)

(assert (=> bm!98 m!10759))

(declare-fun m!10761 () Bool)

(assert (=> b!8164 m!10761))

(assert (=> b!8075 d!2380))

(declare-fun d!2390 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2390 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!232 (buf!568 thiss!1486))) ((_ sign_extend 32) (currentByte!1577 thiss!1486)) ((_ sign_extend 32) (currentBit!1572 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!232 (buf!568 thiss!1486))) ((_ sign_extend 32) (currentByte!1577 thiss!1486)) ((_ sign_extend 32) (currentBit!1572 thiss!1486))) nBits!460))))

(declare-fun bs!816 () Bool)

(assert (= bs!816 d!2390))

(declare-fun m!10763 () Bool)

(assert (=> bs!816 m!10763))

(assert (=> b!8074 d!2390))

(declare-fun d!2392 () Bool)

(assert (=> d!2392 (= (array_inv!227 srcBuffer!6) (bvsge (size!232 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1658 d!2392))

(declare-fun d!2394 () Bool)

(assert (=> d!2394 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1572 thiss!1486) (currentByte!1577 thiss!1486) (size!232 (buf!568 thiss!1486))))))

(declare-fun bs!817 () Bool)

(assert (= bs!817 d!2394))

(declare-fun m!10765 () Bool)

(assert (=> bs!817 m!10765))

(assert (=> start!1658 d!2394))

(push 1)

(assert (not d!2390))

(assert (not d!2380))

(assert (not d!2394))

(assert (not b!8164))

(assert (not bm!98))

(assert (not b!8160))

(assert (not b!8162))

(assert (not b!8165))

(assert (not b!8166))

(assert (not b!8159))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

