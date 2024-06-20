; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1566 () Bool)

(assert start!1566)

(declare-fun res!8477 () Bool)

(declare-fun e!4868 () Bool)

(assert (=> start!1566 (=> (not res!8477) (not e!4868))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!523 0))(
  ( (array!524 (arr!630 (Array (_ BitVec 32) (_ BitVec 8))) (size!228 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!523)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1566 (= res!8477 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!228 srcBuffer!6))))))))

(assert (=> start!1566 e!4868))

(assert (=> start!1566 true))

(declare-fun array_inv!223 (array!523) Bool)

(assert (=> start!1566 (array_inv!223 srcBuffer!6)))

(declare-datatypes ((BitStream!434 0))(
  ( (BitStream!435 (buf!561 array!523) (currentByte!1564 (_ BitVec 32)) (currentBit!1559 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!434)

(declare-fun e!4867 () Bool)

(declare-fun inv!12 (BitStream!434) Bool)

(assert (=> start!1566 (and (inv!12 thiss!1486) e!4867)))

(declare-fun b!7740 () Bool)

(assert (=> b!7740 (= e!4867 (array_inv!223 (buf!561 thiss!1486)))))

(declare-fun b!7741 () Bool)

(declare-fun res!8473 () Bool)

(declare-fun e!4863 () Bool)

(assert (=> b!7741 (=> (not res!8473) (not e!4863))))

(declare-datatypes ((Unit!602 0))(
  ( (Unit!603) )
))
(declare-datatypes ((tuple2!1060 0))(
  ( (tuple2!1061 (_1!558 Unit!602) (_2!558 BitStream!434)) )
))
(declare-fun lt!9953 () tuple2!1060)

(assert (=> b!7741 (= res!8473 (= (size!228 (buf!561 thiss!1486)) (size!228 (buf!561 (_2!558 lt!9953)))))))

(declare-fun b!7742 () Bool)

(declare-fun res!8476 () Bool)

(assert (=> b!7742 (=> (not res!8476) (not e!4863))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!7742 (= res!8476 (= (bitIndex!0 (size!228 (buf!561 (_2!558 lt!9953))) (currentByte!1564 (_2!558 lt!9953)) (currentBit!1559 (_2!558 lt!9953))) (bvadd (bitIndex!0 (size!228 (buf!561 thiss!1486)) (currentByte!1564 thiss!1486) (currentBit!1559 thiss!1486)) nBits!460)))))

(declare-fun b!7743 () Bool)

(declare-fun e!4862 () Bool)

(assert (=> b!7743 (= e!4863 (not e!4862))))

(declare-fun res!8474 () Bool)

(assert (=> b!7743 (=> res!8474 e!4862)))

(declare-datatypes ((tuple2!1062 0))(
  ( (tuple2!1063 (_1!559 array!523) (_2!559 BitStream!434)) )
))
(declare-fun lt!9949 () tuple2!1062)

(declare-datatypes ((List!128 0))(
  ( (Nil!125) (Cons!124 (h!243 Bool) (t!878 List!128)) )
))
(declare-fun lt!9950 () List!128)

(declare-fun byteArrayBitContentToList!0 (BitStream!434 array!523 (_ BitVec 64) (_ BitVec 64)) List!128)

(assert (=> b!7743 (= res!8474 (not (= (byteArrayBitContentToList!0 (_2!558 lt!9953) (_1!559 lt!9949) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9950)))))

(declare-datatypes ((tuple2!1064 0))(
  ( (tuple2!1065 (_1!560 BitStream!434) (_2!560 BitStream!434)) )
))
(declare-fun lt!9951 () tuple2!1064)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!434 BitStream!434 (_ BitVec 64)) List!128)

(assert (=> b!7743 (= lt!9950 (bitStreamReadBitsIntoList!0 (_2!558 lt!9953) (_1!560 lt!9951) nBits!460))))

(declare-fun readBits!0 (BitStream!434 (_ BitVec 64)) tuple2!1062)

(assert (=> b!7743 (= lt!9949 (readBits!0 (_1!560 lt!9951) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7743 (validate_offset_bits!1 ((_ sign_extend 32) (size!228 (buf!561 (_2!558 lt!9953)))) ((_ sign_extend 32) (currentByte!1564 thiss!1486)) ((_ sign_extend 32) (currentBit!1559 thiss!1486)) nBits!460)))

(declare-fun lt!9952 () Unit!602)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!434 array!523 (_ BitVec 64)) Unit!602)

(assert (=> b!7743 (= lt!9952 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!561 (_2!558 lt!9953)) nBits!460))))

(declare-fun reader!0 (BitStream!434 BitStream!434) tuple2!1064)

(assert (=> b!7743 (= lt!9951 (reader!0 thiss!1486 (_2!558 lt!9953)))))

(declare-fun b!7744 () Bool)

(declare-fun res!8472 () Bool)

(assert (=> b!7744 (=> res!8472 e!4862)))

(assert (=> b!7744 (= res!8472 (not (= lt!9950 (byteArrayBitContentToList!0 (_2!558 lt!9953) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!7745 () Bool)

(declare-fun e!4866 () Bool)

(assert (=> b!7745 (= e!4862 e!4866)))

(declare-fun res!8478 () Bool)

(assert (=> b!7745 (=> res!8478 e!4866)))

(declare-fun checkByteArrayBitContent!0 (BitStream!434 array!523 array!523 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7745 (= res!8478 (not (checkByteArrayBitContent!0 (_2!558 lt!9953) srcBuffer!6 (_1!559 lt!9949) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!9948 () Unit!602)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!434 array!523 array!523 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!602)

(assert (=> b!7745 (= lt!9948 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!558 lt!9953) srcBuffer!6 (_1!559 lt!9949) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!7746 () Bool)

(assert (=> b!7746 (= e!4866 (or (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle nBits!460 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!228 (_1!559 lt!9949)))))))))

(declare-fun b!7747 () Bool)

(assert (=> b!7747 (= e!4868 e!4863)))

(declare-fun res!8479 () Bool)

(assert (=> b!7747 (=> (not res!8479) (not e!4863))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!7747 (= res!8479 (invariant!0 (currentBit!1559 (_2!558 lt!9953)) (currentByte!1564 (_2!558 lt!9953)) (size!228 (buf!561 (_2!558 lt!9953)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!434 array!523 (_ BitVec 64) (_ BitVec 64)) tuple2!1060)

(assert (=> b!7747 (= lt!9953 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!7748 () Bool)

(declare-fun res!8475 () Bool)

(assert (=> b!7748 (=> (not res!8475) (not e!4868))))

(assert (=> b!7748 (= res!8475 (validate_offset_bits!1 ((_ sign_extend 32) (size!228 (buf!561 thiss!1486))) ((_ sign_extend 32) (currentByte!1564 thiss!1486)) ((_ sign_extend 32) (currentBit!1559 thiss!1486)) nBits!460))))

(declare-fun b!7749 () Bool)

(declare-fun res!8471 () Bool)

(assert (=> b!7749 (=> (not res!8471) (not e!4863))))

(declare-fun isPrefixOf!0 (BitStream!434 BitStream!434) Bool)

(assert (=> b!7749 (= res!8471 (isPrefixOf!0 thiss!1486 (_2!558 lt!9953)))))

(assert (= (and start!1566 res!8477) b!7748))

(assert (= (and b!7748 res!8475) b!7747))

(assert (= (and b!7747 res!8479) b!7741))

(assert (= (and b!7741 res!8473) b!7742))

(assert (= (and b!7742 res!8476) b!7749))

(assert (= (and b!7749 res!8471) b!7743))

(assert (= (and b!7743 (not res!8474)) b!7744))

(assert (= (and b!7744 (not res!8472)) b!7745))

(assert (= (and b!7745 (not res!8478)) b!7746))

(assert (= start!1566 b!7740))

(declare-fun m!9891 () Bool)

(assert (=> b!7740 m!9891))

(declare-fun m!9893 () Bool)

(assert (=> b!7749 m!9893))

(declare-fun m!9895 () Bool)

(assert (=> b!7748 m!9895))

(declare-fun m!9897 () Bool)

(assert (=> b!7743 m!9897))

(declare-fun m!9899 () Bool)

(assert (=> b!7743 m!9899))

(declare-fun m!9901 () Bool)

(assert (=> b!7743 m!9901))

(declare-fun m!9903 () Bool)

(assert (=> b!7743 m!9903))

(declare-fun m!9905 () Bool)

(assert (=> b!7743 m!9905))

(declare-fun m!9907 () Bool)

(assert (=> b!7743 m!9907))

(declare-fun m!9909 () Bool)

(assert (=> b!7745 m!9909))

(declare-fun m!9911 () Bool)

(assert (=> b!7745 m!9911))

(declare-fun m!9913 () Bool)

(assert (=> b!7747 m!9913))

(declare-fun m!9915 () Bool)

(assert (=> b!7747 m!9915))

(declare-fun m!9917 () Bool)

(assert (=> b!7742 m!9917))

(declare-fun m!9919 () Bool)

(assert (=> b!7742 m!9919))

(declare-fun m!9921 () Bool)

(assert (=> b!7744 m!9921))

(declare-fun m!9923 () Bool)

(assert (=> start!1566 m!9923))

(declare-fun m!9925 () Bool)

(assert (=> start!1566 m!9925))

(push 1)

(assert (not b!7745))

(assert (not b!7744))

(assert (not b!7740))

(assert (not b!7747))

(assert (not b!7748))

(assert (not b!7749))

(assert (not start!1566))

(assert (not b!7743))

(assert (not b!7742))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2258 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2258 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!228 (buf!561 (_2!558 lt!9953)))) ((_ sign_extend 32) (currentByte!1564 thiss!1486)) ((_ sign_extend 32) (currentBit!1559 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!228 (buf!561 (_2!558 lt!9953)))) ((_ sign_extend 32) (currentByte!1564 thiss!1486)) ((_ sign_extend 32) (currentBit!1559 thiss!1486))) nBits!460))))

(declare-fun bs!793 () Bool)

(assert (= bs!793 d!2258))

(declare-fun m!9939 () Bool)

(assert (=> bs!793 m!9939))

(assert (=> b!7743 d!2258))

(declare-fun b!7773 () Bool)

(declare-datatypes ((tuple2!1070 0))(
  ( (tuple2!1071 (_1!564 List!128) (_2!564 BitStream!434)) )
))
(declare-fun e!4882 () tuple2!1070)

(assert (=> b!7773 (= e!4882 (tuple2!1071 Nil!125 (_1!560 lt!9951)))))

(declare-fun d!2260 () Bool)

(declare-fun e!4883 () Bool)

(assert (=> d!2260 e!4883))

(declare-fun c!398 () Bool)

(assert (=> d!2260 (= c!398 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!9962 () List!128)

(assert (=> d!2260 (= lt!9962 (_1!564 e!4882))))

(declare-fun c!397 () Bool)

(assert (=> d!2260 (= c!397 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2260 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2260 (= (bitStreamReadBitsIntoList!0 (_2!558 lt!9953) (_1!560 lt!9951) nBits!460) lt!9962)))

(declare-fun b!7776 () Bool)

(declare-fun length!18 (List!128) Int)

(assert (=> b!7776 (= e!4883 (> (length!18 lt!9962) 0))))

(declare-fun b!7775 () Bool)

(declare-fun isEmpty!23 (List!128) Bool)

(assert (=> b!7775 (= e!4883 (isEmpty!23 lt!9962))))

(declare-fun lt!9961 () (_ BitVec 64))

(declare-datatypes ((tuple2!1072 0))(
  ( (tuple2!1073 (_1!565 Bool) (_2!565 BitStream!434)) )
))
(declare-fun lt!9960 () tuple2!1072)

(declare-fun b!7774 () Bool)

(assert (=> b!7774 (= e!4882 (tuple2!1071 (Cons!124 (_1!565 lt!9960) (bitStreamReadBitsIntoList!0 (_2!558 lt!9953) (_2!565 lt!9960) (bvsub nBits!460 lt!9961))) (_2!565 lt!9960)))))

(declare-fun readBit!0 (BitStream!434) tuple2!1072)

(assert (=> b!7774 (= lt!9960 (readBit!0 (_1!560 lt!9951)))))

(assert (=> b!7774 (= lt!9961 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!2260 c!397) b!7773))

(assert (= (and d!2260 (not c!397)) b!7774))

(assert (= (and d!2260 c!398) b!7775))

(assert (= (and d!2260 (not c!398)) b!7776))

(declare-fun m!9941 () Bool)

(assert (=> b!7776 m!9941))

(declare-fun m!9943 () Bool)

(assert (=> b!7775 m!9943))

(declare-fun m!9945 () Bool)

(assert (=> b!7774 m!9945))

(declare-fun m!9947 () Bool)

(assert (=> b!7774 m!9947))

(assert (=> b!7743 d!2260))

(declare-fun d!2264 () Bool)

(assert (=> d!2264 (validate_offset_bits!1 ((_ sign_extend 32) (size!228 (buf!561 (_2!558 lt!9953)))) ((_ sign_extend 32) (currentByte!1564 thiss!1486)) ((_ sign_extend 32) (currentBit!1559 thiss!1486)) nBits!460)))

(declare-fun lt!9965 () Unit!602)

(declare-fun choose!9 (BitStream!434 array!523 (_ BitVec 64) BitStream!434) Unit!602)

(assert (=> d!2264 (= lt!9965 (choose!9 thiss!1486 (buf!561 (_2!558 lt!9953)) nBits!460 (BitStream!435 (buf!561 (_2!558 lt!9953)) (currentByte!1564 thiss!1486) (currentBit!1559 thiss!1486))))))

(assert (=> d!2264 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!561 (_2!558 lt!9953)) nBits!460) lt!9965)))

(declare-fun bs!794 () Bool)

(assert (= bs!794 d!2264))

(assert (=> bs!794 m!9905))

(declare-fun m!9949 () Bool)

(assert (=> bs!794 m!9949))

(assert (=> b!7743 d!2264))

(declare-fun d!2266 () Bool)

(declare-fun c!404 () Bool)

(assert (=> d!2266 (= c!404 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!4889 () List!128)

(assert (=> d!2266 (= (byteArrayBitContentToList!0 (_2!558 lt!9953) (_1!559 lt!9949) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!4889)))

(declare-fun b!7787 () Bool)

(assert (=> b!7787 (= e!4889 Nil!125)))

(declare-fun b!7788 () Bool)

(assert (=> b!7788 (= e!4889 (Cons!124 (not (= (bvand ((_ sign_extend 24) (select (arr!630 (_1!559 lt!9949)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!558 lt!9953) (_1!559 lt!9949) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2266 c!404) b!7787))

(assert (= (and d!2266 (not c!404)) b!7788))

(declare-fun m!9957 () Bool)

(assert (=> b!7788 m!9957))

(declare-fun m!9959 () Bool)

(assert (=> b!7788 m!9959))

(declare-fun m!9961 () Bool)

(assert (=> b!7788 m!9961))

(assert (=> b!7743 d!2266))

(declare-fun lt!10085 () tuple2!1062)

(declare-fun b!7843 () Bool)

(declare-fun e!4908 () Bool)

(assert (=> b!7843 (= e!4908 (= (byteArrayBitContentToList!0 (_2!559 lt!10085) (_1!559 lt!10085) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!559 lt!10085) (_1!560 lt!9951) nBits!460)))))

(declare-fun b!7844 () Bool)

(declare-fun res!8527 () Bool)

(assert (=> b!7844 (=> (not res!8527) (not e!4908))))

(declare-fun lt!10081 () (_ BitVec 64))

(assert (=> b!7844 (= res!8527 (= (bvadd lt!10081 nBits!460) (bitIndex!0 (size!228 (buf!561 (_2!559 lt!10085))) (currentByte!1564 (_2!559 lt!10085)) (currentBit!1559 (_2!559 lt!10085)))))))

(assert (=> b!7844 (or (not (= (bvand lt!10081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!10081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!10081 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7844 (= lt!10081 (bitIndex!0 (size!228 (buf!561 (_1!560 lt!9951))) (currentByte!1564 (_1!560 lt!9951)) (currentBit!1559 (_1!560 lt!9951))))))

(declare-fun b!7846 () Bool)

(declare-fun res!8523 () Bool)

(assert (=> b!7846 (=> (not res!8523) (not e!4908))))

(assert (=> b!7846 (= res!8523 (invariant!0 (currentBit!1559 (_2!559 lt!10085)) (currentByte!1564 (_2!559 lt!10085)) (size!228 (buf!561 (_2!559 lt!10085)))))))

(declare-fun b!7847 () Bool)

(declare-fun res!8526 () Bool)

(assert (=> b!7847 (=> (not res!8526) (not e!4908))))

(assert (=> b!7847 (= res!8526 (bvsle (currentByte!1564 (_1!560 lt!9951)) (currentByte!1564 (_2!559 lt!10085))))))

(declare-fun b!7845 () Bool)

(declare-fun res!8524 () Bool)

(assert (=> b!7845 (=> (not res!8524) (not e!4908))))

(declare-fun lt!10086 () (_ BitVec 64))

(assert (=> b!7845 (= res!8524 (= (size!228 (_1!559 lt!10085)) ((_ extract 31 0) lt!10086)))))

(assert (=> b!7845 (and (bvslt lt!10086 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!10086 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!10083 () (_ BitVec 64))

(declare-fun lt!10087 () (_ BitVec 64))

(assert (=> b!7845 (= lt!10086 (bvsdiv lt!10083 lt!10087))))

(assert (=> b!7845 (and (not (= lt!10087 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!10083 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!10087 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!7845 (= lt!10087 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!10088 () (_ BitVec 64))

(declare-fun lt!10084 () (_ BitVec 64))

(assert (=> b!7845 (= lt!10083 (bvsub lt!10088 lt!10084))))

(assert (=> b!7845 (or (= (bvand lt!10088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!10084 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!10088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!10088 lt!10084) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7845 (= lt!10084 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!10082 () (_ BitVec 64))

(assert (=> b!7845 (= lt!10088 (bvadd nBits!460 lt!10082))))

(assert (=> b!7845 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!10082 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!10082) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7845 (= lt!10082 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun d!2272 () Bool)

(assert (=> d!2272 e!4908))

(declare-fun res!8525 () Bool)

(assert (=> d!2272 (=> (not res!8525) (not e!4908))))

(assert (=> d!2272 (= res!8525 (= (buf!561 (_2!559 lt!10085)) (buf!561 (_1!560 lt!9951))))))

(declare-datatypes ((tuple3!58 0))(
  ( (tuple3!59 (_1!566 Unit!602) (_2!566 BitStream!434) (_3!29 array!523)) )
))
(declare-fun lt!10080 () tuple3!58)

(assert (=> d!2272 (= lt!10085 (tuple2!1063 (_3!29 lt!10080) (_2!566 lt!10080)))))

(declare-fun readBitsLoop!0 (BitStream!434 (_ BitVec 64) array!523 (_ BitVec 64) (_ BitVec 64)) tuple3!58)

(assert (=> d!2272 (= lt!10080 (readBitsLoop!0 (_1!560 lt!9951) nBits!460 (array!524 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2272 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!2272 (= (readBits!0 (_1!560 lt!9951) nBits!460) lt!10085)))

(assert (= (and d!2272 res!8525) b!7844))

(assert (= (and b!7844 res!8527) b!7846))

(assert (= (and b!7846 res!8523) b!7845))

(assert (= (and b!7845 res!8524) b!7847))

(assert (= (and b!7847 res!8526) b!7843))

(declare-fun m!10023 () Bool)

(assert (=> b!7843 m!10023))

(declare-fun m!10025 () Bool)

(assert (=> b!7843 m!10025))

(declare-fun m!10027 () Bool)

(assert (=> b!7844 m!10027))

(declare-fun m!10029 () Bool)

(assert (=> b!7844 m!10029))

(declare-fun m!10031 () Bool)

(assert (=> b!7846 m!10031))

(declare-fun m!10033 () Bool)

(assert (=> d!2272 m!10033))

(assert (=> b!7743 d!2272))

(declare-fun lt!10193 () (_ BitVec 64))

(declare-fun lt!10206 () tuple2!1064)

(declare-fun e!4919 () Bool)

(declare-fun b!7873 () Bool)

(declare-fun lt!10196 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!434 (_ BitVec 64)) BitStream!434)

(assert (=> b!7873 (= e!4919 (= (_1!560 lt!10206) (withMovedBitIndex!0 (_2!560 lt!10206) (bvsub lt!10196 lt!10193))))))

(assert (=> b!7873 (or (= (bvand lt!10196 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!10193 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!10196 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!10196 lt!10193) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7873 (= lt!10193 (bitIndex!0 (size!228 (buf!561 (_2!558 lt!9953))) (currentByte!1564 (_2!558 lt!9953)) (currentBit!1559 (_2!558 lt!9953))))))

(assert (=> b!7873 (= lt!10196 (bitIndex!0 (size!228 (buf!561 thiss!1486)) (currentByte!1564 thiss!1486) (currentBit!1559 thiss!1486)))))

(declare-fun d!2288 () Bool)

(assert (=> d!2288 e!4919))

(declare-fun res!8545 () Bool)

(assert (=> d!2288 (=> (not res!8545) (not e!4919))))

(assert (=> d!2288 (= res!8545 (isPrefixOf!0 (_1!560 lt!10206) (_2!560 lt!10206)))))

(declare-fun lt!10205 () BitStream!434)

(assert (=> d!2288 (= lt!10206 (tuple2!1065 lt!10205 (_2!558 lt!9953)))))

(declare-fun lt!10209 () Unit!602)

(declare-fun lt!10211 () Unit!602)

(assert (=> d!2288 (= lt!10209 lt!10211)))

(assert (=> d!2288 (isPrefixOf!0 lt!10205 (_2!558 lt!9953))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!434 BitStream!434 BitStream!434) Unit!602)

(assert (=> d!2288 (= lt!10211 (lemmaIsPrefixTransitive!0 lt!10205 (_2!558 lt!9953) (_2!558 lt!9953)))))

(declare-fun lt!10194 () Unit!602)

(declare-fun lt!10201 () Unit!602)

(assert (=> d!2288 (= lt!10194 lt!10201)))

(assert (=> d!2288 (isPrefixOf!0 lt!10205 (_2!558 lt!9953))))

(assert (=> d!2288 (= lt!10201 (lemmaIsPrefixTransitive!0 lt!10205 thiss!1486 (_2!558 lt!9953)))))

(declare-fun lt!10200 () Unit!602)

(declare-fun e!4920 () Unit!602)

(assert (=> d!2288 (= lt!10200 e!4920)))

(declare-fun c!420 () Bool)

(assert (=> d!2288 (= c!420 (not (= (size!228 (buf!561 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!10203 () Unit!602)

(declare-fun lt!10192 () Unit!602)

(assert (=> d!2288 (= lt!10203 lt!10192)))

(assert (=> d!2288 (isPrefixOf!0 (_2!558 lt!9953) (_2!558 lt!9953))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!434) Unit!602)

(assert (=> d!2288 (= lt!10192 (lemmaIsPrefixRefl!0 (_2!558 lt!9953)))))

(declare-fun lt!10197 () Unit!602)

(declare-fun lt!10195 () Unit!602)

(assert (=> d!2288 (= lt!10197 lt!10195)))

(assert (=> d!2288 (= lt!10195 (lemmaIsPrefixRefl!0 (_2!558 lt!9953)))))

(declare-fun lt!10208 () Unit!602)

(declare-fun lt!10204 () Unit!602)

(assert (=> d!2288 (= lt!10208 lt!10204)))

(assert (=> d!2288 (isPrefixOf!0 lt!10205 lt!10205)))

(assert (=> d!2288 (= lt!10204 (lemmaIsPrefixRefl!0 lt!10205))))

(declare-fun lt!10198 () Unit!602)

(declare-fun lt!10202 () Unit!602)

(assert (=> d!2288 (= lt!10198 lt!10202)))

(assert (=> d!2288 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2288 (= lt!10202 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2288 (= lt!10205 (BitStream!435 (buf!561 (_2!558 lt!9953)) (currentByte!1564 thiss!1486) (currentBit!1559 thiss!1486)))))

(assert (=> d!2288 (isPrefixOf!0 thiss!1486 (_2!558 lt!9953))))

(assert (=> d!2288 (= (reader!0 thiss!1486 (_2!558 lt!9953)) lt!10206)))

(declare-fun b!7874 () Bool)

(declare-fun res!8543 () Bool)

(assert (=> b!7874 (=> (not res!8543) (not e!4919))))

(assert (=> b!7874 (= res!8543 (isPrefixOf!0 (_2!560 lt!10206) (_2!558 lt!9953)))))

(declare-fun b!7875 () Bool)

(declare-fun lt!10207 () Unit!602)

(assert (=> b!7875 (= e!4920 lt!10207)))

(declare-fun lt!10199 () (_ BitVec 64))

(assert (=> b!7875 (= lt!10199 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10210 () (_ BitVec 64))

(assert (=> b!7875 (= lt!10210 (bitIndex!0 (size!228 (buf!561 thiss!1486)) (currentByte!1564 thiss!1486) (currentBit!1559 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!523 array!523 (_ BitVec 64) (_ BitVec 64)) Unit!602)

(assert (=> b!7875 (= lt!10207 (arrayBitRangesEqSymmetric!0 (buf!561 thiss!1486) (buf!561 (_2!558 lt!9953)) lt!10199 lt!10210))))

(declare-fun arrayBitRangesEq!0 (array!523 array!523 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7875 (arrayBitRangesEq!0 (buf!561 (_2!558 lt!9953)) (buf!561 thiss!1486) lt!10199 lt!10210)))

(declare-fun b!7876 () Bool)

(declare-fun res!8544 () Bool)

(assert (=> b!7876 (=> (not res!8544) (not e!4919))))

(assert (=> b!7876 (= res!8544 (isPrefixOf!0 (_1!560 lt!10206) thiss!1486))))

(declare-fun b!7877 () Bool)

(declare-fun Unit!613 () Unit!602)

(assert (=> b!7877 (= e!4920 Unit!613)))

(assert (= (and d!2288 c!420) b!7875))

(assert (= (and d!2288 (not c!420)) b!7877))

(assert (= (and d!2288 res!8545) b!7876))

(assert (= (and b!7876 res!8544) b!7874))

(assert (= (and b!7874 res!8543) b!7873))

(declare-fun m!10069 () Bool)

(assert (=> b!7876 m!10069))

(declare-fun m!10071 () Bool)

(assert (=> b!7873 m!10071))

(assert (=> b!7873 m!9917))

(assert (=> b!7873 m!9919))

(assert (=> b!7875 m!9919))

(declare-fun m!10073 () Bool)

(assert (=> b!7875 m!10073))

(declare-fun m!10075 () Bool)

(assert (=> b!7875 m!10075))

(declare-fun m!10077 () Bool)

(assert (=> b!7874 m!10077))

(declare-fun m!10079 () Bool)

(assert (=> d!2288 m!10079))

(declare-fun m!10081 () Bool)

(assert (=> d!2288 m!10081))

(declare-fun m!10083 () Bool)

(assert (=> d!2288 m!10083))

(declare-fun m!10085 () Bool)

(assert (=> d!2288 m!10085))

(declare-fun m!10087 () Bool)

(assert (=> d!2288 m!10087))

(declare-fun m!10089 () Bool)

(assert (=> d!2288 m!10089))

(declare-fun m!10091 () Bool)

(assert (=> d!2288 m!10091))

(declare-fun m!10093 () Bool)

(assert (=> d!2288 m!10093))

(assert (=> d!2288 m!9893))

(declare-fun m!10095 () Bool)

(assert (=> d!2288 m!10095))

(declare-fun m!10097 () Bool)

(assert (=> d!2288 m!10097))

(assert (=> b!7743 d!2288))

(declare-fun d!2300 () Bool)

(assert (=> d!2300 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!228 (buf!561 thiss!1486))) ((_ sign_extend 32) (currentByte!1564 thiss!1486)) ((_ sign_extend 32) (currentBit!1559 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!228 (buf!561 thiss!1486))) ((_ sign_extend 32) (currentByte!1564 thiss!1486)) ((_ sign_extend 32) (currentBit!1559 thiss!1486))) nBits!460))))

(declare-fun bs!799 () Bool)

(assert (= bs!799 d!2300))

(declare-fun m!10099 () Bool)

(assert (=> bs!799 m!10099))

(assert (=> b!7748 d!2300))

(declare-fun d!2302 () Bool)

(assert (=> d!2302 (= (invariant!0 (currentBit!1559 (_2!558 lt!9953)) (currentByte!1564 (_2!558 lt!9953)) (size!228 (buf!561 (_2!558 lt!9953)))) (and (bvsge (currentBit!1559 (_2!558 lt!9953)) #b00000000000000000000000000000000) (bvslt (currentBit!1559 (_2!558 lt!9953)) #b00000000000000000000000000001000) (bvsge (currentByte!1564 (_2!558 lt!9953)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1564 (_2!558 lt!9953)) (size!228 (buf!561 (_2!558 lt!9953)))) (and (= (currentBit!1559 (_2!558 lt!9953)) #b00000000000000000000000000000000) (= (currentByte!1564 (_2!558 lt!9953)) (size!228 (buf!561 (_2!558 lt!9953))))))))))

(assert (=> b!7747 d!2302))

(declare-fun b!7962 () Bool)

(declare-fun e!4958 () Bool)

(declare-fun lt!10501 () (_ BitVec 64))

(assert (=> b!7962 (= e!4958 (validate_offset_bits!1 ((_ sign_extend 32) (size!228 (buf!561 thiss!1486))) ((_ sign_extend 32) (currentByte!1564 thiss!1486)) ((_ sign_extend 32) (currentBit!1559 thiss!1486)) lt!10501))))

(declare-fun b!7963 () Bool)

(declare-fun lt!10472 () tuple2!1060)

(declare-fun e!4959 () Bool)

(declare-fun lt!10479 () tuple2!1064)

(assert (=> b!7963 (= e!4959 (= (bitStreamReadBitsIntoList!0 (_2!558 lt!10472) (_1!560 lt!10479) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!558 lt!10472) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!7963 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7963 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!10488 () Unit!602)

(declare-fun lt!10509 () Unit!602)

(assert (=> b!7963 (= lt!10488 lt!10509)))

(assert (=> b!7963 (validate_offset_bits!1 ((_ sign_extend 32) (size!228 (buf!561 (_2!558 lt!10472)))) ((_ sign_extend 32) (currentByte!1564 thiss!1486)) ((_ sign_extend 32) (currentBit!1559 thiss!1486)) lt!10501)))

(assert (=> b!7963 (= lt!10509 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!561 (_2!558 lt!10472)) lt!10501))))

(assert (=> b!7963 e!4958))

(declare-fun res!8611 () Bool)

(assert (=> b!7963 (=> (not res!8611) (not e!4958))))

(assert (=> b!7963 (= res!8611 (and (= (size!228 (buf!561 thiss!1486)) (size!228 (buf!561 (_2!558 lt!10472)))) (bvsge lt!10501 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7963 (= lt!10501 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!7963 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7963 (= lt!10479 (reader!0 thiss!1486 (_2!558 lt!10472)))))

(declare-fun d!2304 () Bool)

(assert (=> d!2304 e!4959))

(declare-fun res!8606 () Bool)

(assert (=> d!2304 (=> (not res!8606) (not e!4959))))

(declare-fun lt!10499 () (_ BitVec 64))

(assert (=> d!2304 (= res!8606 (= (bitIndex!0 (size!228 (buf!561 (_2!558 lt!10472))) (currentByte!1564 (_2!558 lt!10472)) (currentBit!1559 (_2!558 lt!10472))) (bvsub lt!10499 from!367)))))

(assert (=> d!2304 (or (= (bvand lt!10499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!10499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!10499 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!10491 () (_ BitVec 64))

(assert (=> d!2304 (= lt!10499 (bvadd lt!10491 from!367 nBits!460))))

(assert (=> d!2304 (or (not (= (bvand lt!10491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!10491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!10491 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2304 (= lt!10491 (bitIndex!0 (size!228 (buf!561 thiss!1486)) (currentByte!1564 thiss!1486) (currentBit!1559 thiss!1486)))))

(declare-fun e!4960 () tuple2!1060)

(assert (=> d!2304 (= lt!10472 e!4960)))

(declare-fun c!433 () Bool)

(assert (=> d!2304 (= c!433 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!10478 () Unit!602)

(declare-fun lt!10493 () Unit!602)

(assert (=> d!2304 (= lt!10478 lt!10493)))

(assert (=> d!2304 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2304 (= lt!10493 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!10502 () (_ BitVec 64))

(assert (=> d!2304 (= lt!10502 (bitIndex!0 (size!228 (buf!561 thiss!1486)) (currentByte!1564 thiss!1486) (currentBit!1559 thiss!1486)))))

(assert (=> d!2304 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2304 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!10472)))

(declare-fun b!7964 () Bool)

(declare-fun res!8609 () Bool)

(assert (=> b!7964 (=> (not res!8609) (not e!4959))))

(assert (=> b!7964 (= res!8609 (= (size!228 (buf!561 thiss!1486)) (size!228 (buf!561 (_2!558 lt!10472)))))))

(declare-fun call!89 () tuple2!1064)

(declare-fun bm!86 () Bool)

(declare-fun lt!10498 () tuple2!1060)

(assert (=> bm!86 (= call!89 (reader!0 thiss!1486 (ite c!433 (_2!558 lt!10498) thiss!1486)))))

(declare-fun b!7965 () Bool)

(declare-fun res!8607 () Bool)

(assert (=> b!7965 (=> (not res!8607) (not e!4959))))

(assert (=> b!7965 (= res!8607 (= (size!228 (buf!561 (_2!558 lt!10472))) (size!228 (buf!561 thiss!1486))))))

(declare-fun b!7966 () Bool)

(declare-fun res!8608 () Bool)

(assert (=> b!7966 (=> (not res!8608) (not e!4959))))

(assert (=> b!7966 (= res!8608 (isPrefixOf!0 thiss!1486 (_2!558 lt!10472)))))

(declare-fun b!7967 () Bool)

(declare-fun res!8610 () Bool)

(assert (=> b!7967 (=> (not res!8610) (not e!4959))))

(assert (=> b!7967 (= res!8610 (invariant!0 (currentBit!1559 (_2!558 lt!10472)) (currentByte!1564 (_2!558 lt!10472)) (size!228 (buf!561 (_2!558 lt!10472)))))))

(declare-fun b!7968 () Bool)

(declare-fun Unit!614 () Unit!602)

(assert (=> b!7968 (= e!4960 (tuple2!1061 Unit!614 thiss!1486))))

(assert (=> b!7968 (= (size!228 (buf!561 thiss!1486)) (size!228 (buf!561 thiss!1486)))))

(declare-fun lt!10481 () Unit!602)

(declare-fun Unit!615 () Unit!602)

(assert (=> b!7968 (= lt!10481 Unit!615)))

(assert (=> b!7968 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!559 (readBits!0 (_1!560 call!89) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!7969 () Bool)

(declare-fun lt!10483 () tuple2!1060)

(declare-fun Unit!616 () Unit!602)

(assert (=> b!7969 (= e!4960 (tuple2!1061 Unit!616 (_2!558 lt!10483)))))

(declare-fun appendBitFromByte!0 (BitStream!434 (_ BitVec 8) (_ BitVec 32)) tuple2!1060)

(assert (=> b!7969 (= lt!10498 (appendBitFromByte!0 thiss!1486 (select (arr!630 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!10512 () (_ BitVec 64))

(assert (=> b!7969 (= lt!10512 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!10514 () (_ BitVec 64))

(assert (=> b!7969 (= lt!10514 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!10496 () Unit!602)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!434 BitStream!434 (_ BitVec 64) (_ BitVec 64)) Unit!602)

(assert (=> b!7969 (= lt!10496 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!558 lt!10498) lt!10512 lt!10514))))

(assert (=> b!7969 (validate_offset_bits!1 ((_ sign_extend 32) (size!228 (buf!561 (_2!558 lt!10498)))) ((_ sign_extend 32) (currentByte!1564 (_2!558 lt!10498))) ((_ sign_extend 32) (currentBit!1559 (_2!558 lt!10498))) (bvsub lt!10512 lt!10514))))

(declare-fun lt!10473 () Unit!602)

(assert (=> b!7969 (= lt!10473 lt!10496)))

(declare-fun lt!10513 () tuple2!1064)

(assert (=> b!7969 (= lt!10513 call!89)))

(declare-fun lt!10485 () (_ BitVec 64))

(assert (=> b!7969 (= lt!10485 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!10508 () Unit!602)

(assert (=> b!7969 (= lt!10508 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!561 (_2!558 lt!10498)) lt!10485))))

(assert (=> b!7969 (validate_offset_bits!1 ((_ sign_extend 32) (size!228 (buf!561 (_2!558 lt!10498)))) ((_ sign_extend 32) (currentByte!1564 thiss!1486)) ((_ sign_extend 32) (currentBit!1559 thiss!1486)) lt!10485)))

(declare-fun lt!10505 () Unit!602)

(assert (=> b!7969 (= lt!10505 lt!10508)))

(declare-fun head!33 (List!128) Bool)

(assert (=> b!7969 (= (head!33 (byteArrayBitContentToList!0 (_2!558 lt!10498) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!33 (bitStreamReadBitsIntoList!0 (_2!558 lt!10498) (_1!560 lt!10513) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!10489 () Unit!602)

(declare-fun Unit!619 () Unit!602)

(assert (=> b!7969 (= lt!10489 Unit!619)))

(assert (=> b!7969 (= lt!10483 (appendBitsMSBFirstLoop!0 (_2!558 lt!10498) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!10484 () Unit!602)

(assert (=> b!7969 (= lt!10484 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!558 lt!10498) (_2!558 lt!10483)))))

(assert (=> b!7969 (isPrefixOf!0 thiss!1486 (_2!558 lt!10483))))

(declare-fun lt!10487 () Unit!602)

(assert (=> b!7969 (= lt!10487 lt!10484)))

(assert (=> b!7969 (= (size!228 (buf!561 (_2!558 lt!10483))) (size!228 (buf!561 thiss!1486)))))

(declare-fun lt!10506 () Unit!602)

(declare-fun Unit!620 () Unit!602)

(assert (=> b!7969 (= lt!10506 Unit!620)))

(assert (=> b!7969 (= (bitIndex!0 (size!228 (buf!561 (_2!558 lt!10483))) (currentByte!1564 (_2!558 lt!10483)) (currentBit!1559 (_2!558 lt!10483))) (bvsub (bvadd (bitIndex!0 (size!228 (buf!561 thiss!1486)) (currentByte!1564 thiss!1486) (currentBit!1559 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!10480 () Unit!602)

(declare-fun Unit!621 () Unit!602)

(assert (=> b!7969 (= lt!10480 Unit!621)))

(assert (=> b!7969 (= (bitIndex!0 (size!228 (buf!561 (_2!558 lt!10483))) (currentByte!1564 (_2!558 lt!10483)) (currentBit!1559 (_2!558 lt!10483))) (bvsub (bvsub (bvadd (bitIndex!0 (size!228 (buf!561 (_2!558 lt!10498))) (currentByte!1564 (_2!558 lt!10498)) (currentBit!1559 (_2!558 lt!10498))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!10500 () Unit!602)

(declare-fun Unit!622 () Unit!602)

(assert (=> b!7969 (= lt!10500 Unit!622)))

(declare-fun lt!10497 () tuple2!1064)

(assert (=> b!7969 (= lt!10497 (reader!0 thiss!1486 (_2!558 lt!10483)))))

(declare-fun lt!10490 () (_ BitVec 64))

(assert (=> b!7969 (= lt!10490 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!10495 () Unit!602)

(assert (=> b!7969 (= lt!10495 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!561 (_2!558 lt!10483)) lt!10490))))

(assert (=> b!7969 (validate_offset_bits!1 ((_ sign_extend 32) (size!228 (buf!561 (_2!558 lt!10483)))) ((_ sign_extend 32) (currentByte!1564 thiss!1486)) ((_ sign_extend 32) (currentBit!1559 thiss!1486)) lt!10490)))

(declare-fun lt!10492 () Unit!602)

(assert (=> b!7969 (= lt!10492 lt!10495)))

(declare-fun lt!10507 () tuple2!1064)

(assert (=> b!7969 (= lt!10507 (reader!0 (_2!558 lt!10498) (_2!558 lt!10483)))))

(declare-fun lt!10504 () (_ BitVec 64))

(assert (=> b!7969 (= lt!10504 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!10471 () Unit!602)

(assert (=> b!7969 (= lt!10471 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!558 lt!10498) (buf!561 (_2!558 lt!10483)) lt!10504))))

(assert (=> b!7969 (validate_offset_bits!1 ((_ sign_extend 32) (size!228 (buf!561 (_2!558 lt!10483)))) ((_ sign_extend 32) (currentByte!1564 (_2!558 lt!10498))) ((_ sign_extend 32) (currentBit!1559 (_2!558 lt!10498))) lt!10504)))

(declare-fun lt!10482 () Unit!602)

(assert (=> b!7969 (= lt!10482 lt!10471)))

(declare-fun lt!10503 () List!128)

(assert (=> b!7969 (= lt!10503 (byteArrayBitContentToList!0 (_2!558 lt!10483) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!10486 () List!128)

(assert (=> b!7969 (= lt!10486 (byteArrayBitContentToList!0 (_2!558 lt!10483) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!10476 () List!128)

(assert (=> b!7969 (= lt!10476 (bitStreamReadBitsIntoList!0 (_2!558 lt!10483) (_1!560 lt!10497) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!10511 () List!128)

(assert (=> b!7969 (= lt!10511 (bitStreamReadBitsIntoList!0 (_2!558 lt!10483) (_1!560 lt!10507) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!10474 () (_ BitVec 64))

(assert (=> b!7969 (= lt!10474 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!10477 () Unit!602)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!434 BitStream!434 BitStream!434 BitStream!434 (_ BitVec 64) List!128) Unit!602)

(assert (=> b!7969 (= lt!10477 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!558 lt!10483) (_2!558 lt!10483) (_1!560 lt!10497) (_1!560 lt!10507) lt!10474 lt!10476))))

(declare-fun tail!41 (List!128) List!128)

(assert (=> b!7969 (= (bitStreamReadBitsIntoList!0 (_2!558 lt!10483) (_1!560 lt!10507) (bvsub lt!10474 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!41 lt!10476))))

(declare-fun lt!10475 () Unit!602)

(assert (=> b!7969 (= lt!10475 lt!10477)))

(declare-fun lt!10510 () Unit!602)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!523 array!523 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!602)

(assert (=> b!7969 (= lt!10510 (arrayBitRangesEqImpliesEq!0 (buf!561 (_2!558 lt!10498)) (buf!561 (_2!558 lt!10483)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!10502 (bitIndex!0 (size!228 (buf!561 (_2!558 lt!10498))) (currentByte!1564 (_2!558 lt!10498)) (currentBit!1559 (_2!558 lt!10498)))))))

(declare-fun bitAt!0 (array!523 (_ BitVec 64)) Bool)

(assert (=> b!7969 (= (bitAt!0 (buf!561 (_2!558 lt!10498)) lt!10502) (bitAt!0 (buf!561 (_2!558 lt!10483)) lt!10502))))

(declare-fun lt!10494 () Unit!602)

(assert (=> b!7969 (= lt!10494 lt!10510)))

(assert (= (and d!2304 c!433) b!7969))

(assert (= (and d!2304 (not c!433)) b!7968))

(assert (= (or b!7969 b!7968) bm!86))

(assert (= (and d!2304 res!8606) b!7967))

(assert (= (and b!7967 res!8610) b!7964))

(assert (= (and b!7964 res!8609) b!7966))

(assert (= (and b!7966 res!8608) b!7965))

(assert (= (and b!7965 res!8607) b!7963))

(assert (= (and b!7963 res!8611) b!7962))

(declare-fun m!10219 () Bool)

(assert (=> b!7966 m!10219))

(declare-fun m!10221 () Bool)

(assert (=> b!7963 m!10221))

(declare-fun m!10223 () Bool)

(assert (=> b!7963 m!10223))

(declare-fun m!10225 () Bool)

(assert (=> b!7963 m!10225))

(declare-fun m!10227 () Bool)

(assert (=> b!7963 m!10227))

(declare-fun m!10229 () Bool)

(assert (=> b!7963 m!10229))

(declare-fun m!10231 () Bool)

(assert (=> b!7969 m!10231))

(declare-fun m!10233 () Bool)

(assert (=> b!7969 m!10233))

(declare-fun m!10235 () Bool)

(assert (=> b!7969 m!10235))

(declare-fun m!10237 () Bool)

(assert (=> b!7969 m!10237))

(declare-fun m!10239 () Bool)

(assert (=> b!7969 m!10239))

(declare-fun m!10241 () Bool)

(assert (=> b!7969 m!10241))

(declare-fun m!10243 () Bool)

(assert (=> b!7969 m!10243))

(declare-fun m!10245 () Bool)

(assert (=> b!7969 m!10245))

(declare-fun m!10247 () Bool)

(assert (=> b!7969 m!10247))

(declare-fun m!10249 () Bool)

(assert (=> b!7969 m!10249))

(declare-fun m!10251 () Bool)

(assert (=> b!7969 m!10251))

(declare-fun m!10253 () Bool)

(assert (=> b!7969 m!10253))

(declare-fun m!10255 () Bool)

(assert (=> b!7969 m!10255))

(declare-fun m!10257 () Bool)

(assert (=> b!7969 m!10257))

(assert (=> b!7969 m!10235))

(declare-fun m!10259 () Bool)

(assert (=> b!7969 m!10259))

(declare-fun m!10261 () Bool)

(assert (=> b!7969 m!10261))

(declare-fun m!10263 () Bool)

(assert (=> b!7969 m!10263))

(declare-fun m!10265 () Bool)

(assert (=> b!7969 m!10265))

(declare-fun m!10267 () Bool)

(assert (=> b!7969 m!10267))

(declare-fun m!10269 () Bool)

(assert (=> b!7969 m!10269))

(assert (=> b!7969 m!10257))

(declare-fun m!10271 () Bool)

(assert (=> b!7969 m!10271))

(declare-fun m!10273 () Bool)

(assert (=> b!7969 m!10273))

(declare-fun m!10275 () Bool)

(assert (=> b!7969 m!10275))

(declare-fun m!10277 () Bool)

(assert (=> b!7969 m!10277))

(declare-fun m!10279 () Bool)

(assert (=> b!7969 m!10279))

(declare-fun m!10281 () Bool)

(assert (=> b!7969 m!10281))

(declare-fun m!10283 () Bool)

(assert (=> b!7969 m!10283))

(declare-fun m!10285 () Bool)

(assert (=> b!7969 m!10285))

(declare-fun m!10287 () Bool)

(assert (=> b!7969 m!10287))

(declare-fun m!10289 () Bool)

(assert (=> b!7969 m!10289))

(declare-fun m!10291 () Bool)

(assert (=> b!7969 m!10291))

(assert (=> b!7969 m!10265))

(assert (=> b!7969 m!10261))

(assert (=> b!7969 m!9919))

(declare-fun m!10293 () Bool)

(assert (=> b!7968 m!10293))

(declare-fun m!10295 () Bool)

(assert (=> b!7968 m!10295))

(declare-fun m!10297 () Bool)

(assert (=> d!2304 m!10297))

(assert (=> d!2304 m!9919))

(assert (=> d!2304 m!10087))

(assert (=> d!2304 m!10091))

(declare-fun m!10299 () Bool)

(assert (=> b!7967 m!10299))

(declare-fun m!10301 () Bool)

(assert (=> bm!86 m!10301))

(declare-fun m!10303 () Bool)

(assert (=> b!7962 m!10303))

(assert (=> b!7747 d!2304))

(declare-fun d!2326 () Bool)

(declare-fun e!4969 () Bool)

(assert (=> d!2326 e!4969))

(declare-fun res!8625 () Bool)

(assert (=> d!2326 (=> (not res!8625) (not e!4969))))

(declare-fun lt!10575 () (_ BitVec 64))

(declare-fun lt!10577 () (_ BitVec 64))

(declare-fun lt!10574 () (_ BitVec 64))

(assert (=> d!2326 (= res!8625 (= lt!10575 (bvsub lt!10577 lt!10574)))))

(assert (=> d!2326 (or (= (bvand lt!10577 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!10574 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!10577 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!10577 lt!10574) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2326 (= lt!10574 (remainingBits!0 ((_ sign_extend 32) (size!228 (buf!561 (_2!558 lt!9953)))) ((_ sign_extend 32) (currentByte!1564 (_2!558 lt!9953))) ((_ sign_extend 32) (currentBit!1559 (_2!558 lt!9953)))))))

(declare-fun lt!10578 () (_ BitVec 64))

(declare-fun lt!10576 () (_ BitVec 64))

(assert (=> d!2326 (= lt!10577 (bvmul lt!10578 lt!10576))))

(assert (=> d!2326 (or (= lt!10578 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!10576 (bvsdiv (bvmul lt!10578 lt!10576) lt!10578)))))

(assert (=> d!2326 (= lt!10576 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2326 (= lt!10578 ((_ sign_extend 32) (size!228 (buf!561 (_2!558 lt!9953)))))))

(assert (=> d!2326 (= lt!10575 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1564 (_2!558 lt!9953))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1559 (_2!558 lt!9953)))))))

(assert (=> d!2326 (invariant!0 (currentBit!1559 (_2!558 lt!9953)) (currentByte!1564 (_2!558 lt!9953)) (size!228 (buf!561 (_2!558 lt!9953))))))

(assert (=> d!2326 (= (bitIndex!0 (size!228 (buf!561 (_2!558 lt!9953))) (currentByte!1564 (_2!558 lt!9953)) (currentBit!1559 (_2!558 lt!9953))) lt!10575)))

(declare-fun b!7986 () Bool)

(declare-fun res!8624 () Bool)

(assert (=> b!7986 (=> (not res!8624) (not e!4969))))

(assert (=> b!7986 (= res!8624 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!10575))))

(declare-fun b!7987 () Bool)

(declare-fun lt!10579 () (_ BitVec 64))

(assert (=> b!7987 (= e!4969 (bvsle lt!10575 (bvmul lt!10579 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!7987 (or (= lt!10579 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!10579 #b0000000000000000000000000000000000000000000000000000000000001000) lt!10579)))))

(assert (=> b!7987 (= lt!10579 ((_ sign_extend 32) (size!228 (buf!561 (_2!558 lt!9953)))))))

(assert (= (and d!2326 res!8625) b!7986))

(assert (= (and b!7986 res!8624) b!7987))

(declare-fun m!10307 () Bool)

(assert (=> d!2326 m!10307))

(assert (=> d!2326 m!9913))

(assert (=> b!7742 d!2326))

(declare-fun d!2330 () Bool)

(declare-fun e!4970 () Bool)

(assert (=> d!2330 e!4970))

(declare-fun res!8627 () Bool)

(assert (=> d!2330 (=> (not res!8627) (not e!4970))))

(declare-fun lt!10591 () (_ BitVec 64))

(declare-fun lt!10593 () (_ BitVec 64))

(declare-fun lt!10590 () (_ BitVec 64))

(assert (=> d!2330 (= res!8627 (= lt!10591 (bvsub lt!10593 lt!10590)))))

(assert (=> d!2330 (or (= (bvand lt!10593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!10590 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!10593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!10593 lt!10590) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2330 (= lt!10590 (remainingBits!0 ((_ sign_extend 32) (size!228 (buf!561 thiss!1486))) ((_ sign_extend 32) (currentByte!1564 thiss!1486)) ((_ sign_extend 32) (currentBit!1559 thiss!1486))))))

(declare-fun lt!10594 () (_ BitVec 64))

(declare-fun lt!10592 () (_ BitVec 64))

(assert (=> d!2330 (= lt!10593 (bvmul lt!10594 lt!10592))))

(assert (=> d!2330 (or (= lt!10594 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!10592 (bvsdiv (bvmul lt!10594 lt!10592) lt!10594)))))

(assert (=> d!2330 (= lt!10592 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2330 (= lt!10594 ((_ sign_extend 32) (size!228 (buf!561 thiss!1486))))))

(assert (=> d!2330 (= lt!10591 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1564 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1559 thiss!1486))))))

(assert (=> d!2330 (invariant!0 (currentBit!1559 thiss!1486) (currentByte!1564 thiss!1486) (size!228 (buf!561 thiss!1486)))))

(assert (=> d!2330 (= (bitIndex!0 (size!228 (buf!561 thiss!1486)) (currentByte!1564 thiss!1486) (currentBit!1559 thiss!1486)) lt!10591)))

(declare-fun b!7988 () Bool)

(declare-fun res!8626 () Bool)

(assert (=> b!7988 (=> (not res!8626) (not e!4970))))

(assert (=> b!7988 (= res!8626 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!10591))))

(declare-fun b!7989 () Bool)

(declare-fun lt!10595 () (_ BitVec 64))

(assert (=> b!7989 (= e!4970 (bvsle lt!10591 (bvmul lt!10595 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!7989 (or (= lt!10595 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!10595 #b0000000000000000000000000000000000000000000000000000000000001000) lt!10595)))))

(assert (=> b!7989 (= lt!10595 ((_ sign_extend 32) (size!228 (buf!561 thiss!1486))))))

(assert (= (and d!2330 res!8627) b!7988))

(assert (= (and b!7988 res!8626) b!7989))

(assert (=> d!2330 m!10099))

(declare-fun m!10309 () Bool)

(assert (=> d!2330 m!10309))

(assert (=> b!7742 d!2330))

(declare-fun d!2332 () Bool)

(declare-fun res!8644 () Bool)

(declare-fun e!4979 () Bool)

(assert (=> d!2332 (=> res!8644 e!4979)))

(assert (=> d!2332 (= res!8644 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2332 (= (checkByteArrayBitContent!0 (_2!558 lt!9953) srcBuffer!6 (_1!559 lt!9949) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!4979)))

(declare-fun b!8006 () Bool)

(declare-fun e!4980 () Bool)

(assert (=> b!8006 (= e!4979 e!4980)))

(declare-fun res!8645 () Bool)

(assert (=> b!8006 (=> (not res!8645) (not e!4980))))

(assert (=> b!8006 (= res!8645 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!630 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!630 (_1!559 lt!9949)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!8007 () Bool)

(assert (=> b!8007 (= e!4980 (checkByteArrayBitContent!0 (_2!558 lt!9953) srcBuffer!6 (_1!559 lt!9949) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!2332 (not res!8644)) b!8006))

(assert (= (and b!8006 res!8645) b!8007))

(assert (=> b!8006 m!10265))

(declare-fun m!10311 () Bool)

(assert (=> b!8006 m!10311))

(assert (=> b!8006 m!9957))

(assert (=> b!8006 m!9959))

(declare-fun m!10313 () Bool)

(assert (=> b!8007 m!10313))

(assert (=> b!7745 d!2332))

(declare-fun d!2334 () Bool)

(assert (=> d!2334 (checkByteArrayBitContent!0 (_2!558 lt!9953) srcBuffer!6 (_1!559 lt!9949) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!10656 () Unit!602)

(declare-fun choose!65 (BitStream!434 array!523 array!523 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!602)

(assert (=> d!2334 (= lt!10656 (choose!65 (_2!558 lt!9953) srcBuffer!6 (_1!559 lt!9949) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2334 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2334 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!558 lt!9953) srcBuffer!6 (_1!559 lt!9949) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!10656)))

(declare-fun bs!802 () Bool)

(assert (= bs!802 d!2334))

(assert (=> bs!802 m!9909))

(declare-fun m!10315 () Bool)

(assert (=> bs!802 m!10315))

(assert (=> b!7745 d!2334))

(declare-fun d!2336 () Bool)

(assert (=> d!2336 (= (array_inv!223 (buf!561 thiss!1486)) (bvsge (size!228 (buf!561 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!7740 d!2336))

(declare-fun d!2338 () Bool)

(declare-fun res!8660 () Bool)

(declare-fun e!4989 () Bool)

(assert (=> d!2338 (=> (not res!8660) (not e!4989))))

(assert (=> d!2338 (= res!8660 (= (size!228 (buf!561 thiss!1486)) (size!228 (buf!561 (_2!558 lt!9953)))))))

(assert (=> d!2338 (= (isPrefixOf!0 thiss!1486 (_2!558 lt!9953)) e!4989)))

(declare-fun b!8022 () Bool)

(declare-fun res!8658 () Bool)

(assert (=> b!8022 (=> (not res!8658) (not e!4989))))

(assert (=> b!8022 (= res!8658 (bvsle (bitIndex!0 (size!228 (buf!561 thiss!1486)) (currentByte!1564 thiss!1486) (currentBit!1559 thiss!1486)) (bitIndex!0 (size!228 (buf!561 (_2!558 lt!9953))) (currentByte!1564 (_2!558 lt!9953)) (currentBit!1559 (_2!558 lt!9953)))))))

(declare-fun b!8023 () Bool)

(declare-fun e!4988 () Bool)

(assert (=> b!8023 (= e!4989 e!4988)))

(declare-fun res!8659 () Bool)

(assert (=> b!8023 (=> res!8659 e!4988)))

(assert (=> b!8023 (= res!8659 (= (size!228 (buf!561 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!8024 () Bool)

(assert (=> b!8024 (= e!4988 (arrayBitRangesEq!0 (buf!561 thiss!1486) (buf!561 (_2!558 lt!9953)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!228 (buf!561 thiss!1486)) (currentByte!1564 thiss!1486) (currentBit!1559 thiss!1486))))))

(assert (= (and d!2338 res!8660) b!8022))

(assert (= (and b!8022 res!8658) b!8023))

(assert (= (and b!8023 (not res!8659)) b!8024))

(assert (=> b!8022 m!9919))

(assert (=> b!8022 m!9917))

(assert (=> b!8024 m!9919))

(assert (=> b!8024 m!9919))

(declare-fun m!10317 () Bool)

(assert (=> b!8024 m!10317))

(assert (=> b!7749 d!2338))

(declare-fun d!2340 () Bool)

(assert (=> d!2340 (= (array_inv!223 srcBuffer!6) (bvsge (size!228 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1566 d!2340))

(declare-fun d!2342 () Bool)

(assert (=> d!2342 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1559 thiss!1486) (currentByte!1564 thiss!1486) (size!228 (buf!561 thiss!1486))))))

(declare-fun bs!803 () Bool)

(assert (= bs!803 d!2342))

(assert (=> bs!803 m!10309))

(assert (=> start!1566 d!2342))

(declare-fun d!2344 () Bool)

(declare-fun c!437 () Bool)

(assert (=> d!2344 (= c!437 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!4990 () List!128)

(assert (=> d!2344 (= (byteArrayBitContentToList!0 (_2!558 lt!9953) srcBuffer!6 from!367 nBits!460) e!4990)))

(declare-fun b!8025 () Bool)

(assert (=> b!8025 (= e!4990 Nil!125)))

(declare-fun b!8026 () Bool)

(assert (=> b!8026 (= e!4990 (Cons!124 (not (= (bvand ((_ sign_extend 24) (select (arr!630 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!558 lt!9953) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2344 c!437) b!8025))

(assert (= (and d!2344 (not c!437)) b!8026))

(assert (=> b!8026 m!10265))

(assert (=> b!8026 m!10311))

(declare-fun m!10359 () Bool)

(assert (=> b!8026 m!10359))

(assert (=> b!7744 d!2344))

(push 1)

(assert (not d!2264))

(assert (not d!2326))

(assert (not d!2304))

(assert (not bm!86))

(assert (not b!7843))

(assert (not b!7967))

(assert (not b!8024))

(assert (not d!2334))

(assert (not b!7875))

(assert (not d!2272))

(assert (not b!7962))

(assert (not d!2258))

(assert (not b!7873))

(assert (not b!7844))

(assert (not b!7846))

(assert (not d!2330))

(assert (not b!7968))

(assert (not b!8026))

(assert (not b!7775))

(assert (not b!8007))

(assert (not b!7776))

(assert (not b!7963))

(assert (not b!7874))

(assert (not b!8022))

(assert (not b!7969))

(assert (not d!2342))

(assert (not d!2288))

(assert (not b!7966))

(assert (not b!7774))

(assert (not b!7788))

(assert (not d!2300))

(assert (not b!7876))

(check-sat)

(pop 1)

(push 1)

(check-sat)

