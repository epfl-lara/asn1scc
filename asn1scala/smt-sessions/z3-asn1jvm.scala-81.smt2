; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1564 () Bool)

(assert start!1564)

(declare-fun b!7710 () Bool)

(declare-fun e!4846 () Bool)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((array!521 0))(
  ( (array!522 (arr!629 (Array (_ BitVec 32) (_ BitVec 8))) (size!227 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!432 0))(
  ( (BitStream!433 (buf!560 array!521) (currentByte!1563 (_ BitVec 32)) (currentBit!1558 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!1054 0))(
  ( (tuple2!1055 (_1!555 array!521) (_2!555 BitStream!432)) )
))
(declare-fun lt!9931 () tuple2!1054)

(assert (=> b!7710 (= e!4846 (or (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle nBits!460 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!227 (_1!555 lt!9931)))))))))

(declare-fun b!7711 () Bool)

(declare-fun res!8447 () Bool)

(declare-fun e!4844 () Bool)

(assert (=> b!7711 (=> (not res!8447) (not e!4844))))

(declare-fun thiss!1486 () BitStream!432)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7711 (= res!8447 (validate_offset_bits!1 ((_ sign_extend 32) (size!227 (buf!560 thiss!1486))) ((_ sign_extend 32) (currentByte!1563 thiss!1486)) ((_ sign_extend 32) (currentBit!1558 thiss!1486)) nBits!460))))

(declare-fun b!7712 () Bool)

(declare-fun e!4847 () Bool)

(assert (=> b!7712 (= e!4847 e!4846)))

(declare-fun res!8451 () Bool)

(assert (=> b!7712 (=> res!8451 e!4846)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((Unit!600 0))(
  ( (Unit!601) )
))
(declare-datatypes ((tuple2!1056 0))(
  ( (tuple2!1057 (_1!556 Unit!600) (_2!556 BitStream!432)) )
))
(declare-fun lt!9930 () tuple2!1056)

(declare-fun srcBuffer!6 () array!521)

(declare-fun checkByteArrayBitContent!0 (BitStream!432 array!521 array!521 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7712 (= res!8451 (not (checkByteArrayBitContent!0 (_2!556 lt!9930) srcBuffer!6 (_1!555 lt!9931) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!9933 () Unit!600)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!432 array!521 array!521 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!600)

(assert (=> b!7712 (= lt!9933 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!556 lt!9930) srcBuffer!6 (_1!555 lt!9931) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!7713 () Bool)

(declare-fun e!4842 () Bool)

(assert (=> b!7713 (= e!4844 e!4842)))

(declare-fun res!8444 () Bool)

(assert (=> b!7713 (=> (not res!8444) (not e!4842))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!7713 (= res!8444 (invariant!0 (currentBit!1558 (_2!556 lt!9930)) (currentByte!1563 (_2!556 lt!9930)) (size!227 (buf!560 (_2!556 lt!9930)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!432 array!521 (_ BitVec 64) (_ BitVec 64)) tuple2!1056)

(assert (=> b!7713 (= lt!9930 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!8448 () Bool)

(assert (=> start!1564 (=> (not res!8448) (not e!4844))))

(assert (=> start!1564 (= res!8448 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!227 srcBuffer!6))))))))

(assert (=> start!1564 e!4844))

(assert (=> start!1564 true))

(declare-fun array_inv!222 (array!521) Bool)

(assert (=> start!1564 (array_inv!222 srcBuffer!6)))

(declare-fun e!4843 () Bool)

(declare-fun inv!12 (BitStream!432) Bool)

(assert (=> start!1564 (and (inv!12 thiss!1486) e!4843)))

(declare-fun b!7714 () Bool)

(declare-fun res!8446 () Bool)

(assert (=> b!7714 (=> (not res!8446) (not e!4842))))

(declare-fun isPrefixOf!0 (BitStream!432 BitStream!432) Bool)

(assert (=> b!7714 (= res!8446 (isPrefixOf!0 thiss!1486 (_2!556 lt!9930)))))

(declare-fun b!7715 () Bool)

(declare-fun res!8445 () Bool)

(assert (=> b!7715 (=> (not res!8445) (not e!4842))))

(assert (=> b!7715 (= res!8445 (= (size!227 (buf!560 thiss!1486)) (size!227 (buf!560 (_2!556 lt!9930)))))))

(declare-fun b!7716 () Bool)

(declare-fun res!8452 () Bool)

(assert (=> b!7716 (=> res!8452 e!4847)))

(declare-datatypes ((List!127 0))(
  ( (Nil!124) (Cons!123 (h!242 Bool) (t!877 List!127)) )
))
(declare-fun lt!9932 () List!127)

(declare-fun byteArrayBitContentToList!0 (BitStream!432 array!521 (_ BitVec 64) (_ BitVec 64)) List!127)

(assert (=> b!7716 (= res!8452 (not (= lt!9932 (byteArrayBitContentToList!0 (_2!556 lt!9930) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!7717 () Bool)

(declare-fun res!8449 () Bool)

(assert (=> b!7717 (=> (not res!8449) (not e!4842))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!7717 (= res!8449 (= (bitIndex!0 (size!227 (buf!560 (_2!556 lt!9930))) (currentByte!1563 (_2!556 lt!9930)) (currentBit!1558 (_2!556 lt!9930))) (bvadd (bitIndex!0 (size!227 (buf!560 thiss!1486)) (currentByte!1563 thiss!1486) (currentBit!1558 thiss!1486)) nBits!460)))))

(declare-fun b!7718 () Bool)

(assert (=> b!7718 (= e!4843 (array_inv!222 (buf!560 thiss!1486)))))

(declare-fun b!7719 () Bool)

(assert (=> b!7719 (= e!4842 (not e!4847))))

(declare-fun res!8450 () Bool)

(assert (=> b!7719 (=> res!8450 e!4847)))

(assert (=> b!7719 (= res!8450 (not (= (byteArrayBitContentToList!0 (_2!556 lt!9930) (_1!555 lt!9931) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9932)))))

(declare-datatypes ((tuple2!1058 0))(
  ( (tuple2!1059 (_1!557 BitStream!432) (_2!557 BitStream!432)) )
))
(declare-fun lt!9935 () tuple2!1058)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!432 BitStream!432 (_ BitVec 64)) List!127)

(assert (=> b!7719 (= lt!9932 (bitStreamReadBitsIntoList!0 (_2!556 lt!9930) (_1!557 lt!9935) nBits!460))))

(declare-fun readBits!0 (BitStream!432 (_ BitVec 64)) tuple2!1054)

(assert (=> b!7719 (= lt!9931 (readBits!0 (_1!557 lt!9935) nBits!460))))

(assert (=> b!7719 (validate_offset_bits!1 ((_ sign_extend 32) (size!227 (buf!560 (_2!556 lt!9930)))) ((_ sign_extend 32) (currentByte!1563 thiss!1486)) ((_ sign_extend 32) (currentBit!1558 thiss!1486)) nBits!460)))

(declare-fun lt!9934 () Unit!600)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!432 array!521 (_ BitVec 64)) Unit!600)

(assert (=> b!7719 (= lt!9934 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!560 (_2!556 lt!9930)) nBits!460))))

(declare-fun reader!0 (BitStream!432 BitStream!432) tuple2!1058)

(assert (=> b!7719 (= lt!9935 (reader!0 thiss!1486 (_2!556 lt!9930)))))

(assert (= (and start!1564 res!8448) b!7711))

(assert (= (and b!7711 res!8447) b!7713))

(assert (= (and b!7713 res!8444) b!7715))

(assert (= (and b!7715 res!8445) b!7717))

(assert (= (and b!7717 res!8449) b!7714))

(assert (= (and b!7714 res!8446) b!7719))

(assert (= (and b!7719 (not res!8450)) b!7716))

(assert (= (and b!7716 (not res!8452)) b!7712))

(assert (= (and b!7712 (not res!8451)) b!7710))

(assert (= start!1564 b!7718))

(declare-fun m!9855 () Bool)

(assert (=> b!7713 m!9855))

(declare-fun m!9857 () Bool)

(assert (=> b!7713 m!9857))

(declare-fun m!9859 () Bool)

(assert (=> b!7719 m!9859))

(declare-fun m!9861 () Bool)

(assert (=> b!7719 m!9861))

(declare-fun m!9863 () Bool)

(assert (=> b!7719 m!9863))

(declare-fun m!9865 () Bool)

(assert (=> b!7719 m!9865))

(declare-fun m!9867 () Bool)

(assert (=> b!7719 m!9867))

(declare-fun m!9869 () Bool)

(assert (=> b!7719 m!9869))

(declare-fun m!9871 () Bool)

(assert (=> b!7716 m!9871))

(declare-fun m!9873 () Bool)

(assert (=> b!7717 m!9873))

(declare-fun m!9875 () Bool)

(assert (=> b!7717 m!9875))

(declare-fun m!9877 () Bool)

(assert (=> b!7711 m!9877))

(declare-fun m!9879 () Bool)

(assert (=> b!7712 m!9879))

(declare-fun m!9881 () Bool)

(assert (=> b!7712 m!9881))

(declare-fun m!9883 () Bool)

(assert (=> b!7714 m!9883))

(declare-fun m!9885 () Bool)

(assert (=> start!1564 m!9885))

(declare-fun m!9887 () Bool)

(assert (=> start!1564 m!9887))

(declare-fun m!9889 () Bool)

(assert (=> b!7718 m!9889))

(check-sat (not b!7714) (not b!7711) (not b!7718) (not b!7719) (not start!1564) (not b!7716) (not b!7717) (not b!7713) (not b!7712))
(check-sat)
(get-model)

(declare-fun d!2248 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2248 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!227 (buf!560 thiss!1486))) ((_ sign_extend 32) (currentByte!1563 thiss!1486)) ((_ sign_extend 32) (currentBit!1558 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!227 (buf!560 thiss!1486))) ((_ sign_extend 32) (currentByte!1563 thiss!1486)) ((_ sign_extend 32) (currentBit!1558 thiss!1486))) nBits!460))))

(declare-fun bs!791 () Bool)

(assert (= bs!791 d!2248))

(declare-fun m!9927 () Bool)

(assert (=> bs!791 m!9927))

(assert (=> b!7711 d!2248))

(declare-fun d!2250 () Bool)

(declare-fun c!392 () Bool)

(assert (=> d!2250 (= c!392 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!4871 () List!127)

(assert (=> d!2250 (= (byteArrayBitContentToList!0 (_2!556 lt!9930) srcBuffer!6 from!367 nBits!460) e!4871)))

(declare-fun b!7754 () Bool)

(assert (=> b!7754 (= e!4871 Nil!124)))

(declare-fun b!7755 () Bool)

(assert (=> b!7755 (= e!4871 (Cons!123 (not (= (bvand ((_ sign_extend 24) (select (arr!629 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!556 lt!9930) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2250 c!392) b!7754))

(assert (= (and d!2250 (not c!392)) b!7755))

(declare-fun m!9929 () Bool)

(assert (=> b!7755 m!9929))

(declare-fun m!9931 () Bool)

(assert (=> b!7755 m!9931))

(declare-fun m!9933 () Bool)

(assert (=> b!7755 m!9933))

(assert (=> b!7716 d!2250))

(declare-fun d!2252 () Bool)

(declare-fun res!8487 () Bool)

(declare-fun e!4877 () Bool)

(assert (=> d!2252 (=> (not res!8487) (not e!4877))))

(assert (=> d!2252 (= res!8487 (= (size!227 (buf!560 thiss!1486)) (size!227 (buf!560 (_2!556 lt!9930)))))))

(assert (=> d!2252 (= (isPrefixOf!0 thiss!1486 (_2!556 lt!9930)) e!4877)))

(declare-fun b!7762 () Bool)

(declare-fun res!8486 () Bool)

(assert (=> b!7762 (=> (not res!8486) (not e!4877))))

(assert (=> b!7762 (= res!8486 (bvsle (bitIndex!0 (size!227 (buf!560 thiss!1486)) (currentByte!1563 thiss!1486) (currentBit!1558 thiss!1486)) (bitIndex!0 (size!227 (buf!560 (_2!556 lt!9930))) (currentByte!1563 (_2!556 lt!9930)) (currentBit!1558 (_2!556 lt!9930)))))))

(declare-fun b!7763 () Bool)

(declare-fun e!4876 () Bool)

(assert (=> b!7763 (= e!4877 e!4876)))

(declare-fun res!8488 () Bool)

(assert (=> b!7763 (=> res!8488 e!4876)))

(assert (=> b!7763 (= res!8488 (= (size!227 (buf!560 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!7764 () Bool)

(declare-fun arrayBitRangesEq!0 (array!521 array!521 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7764 (= e!4876 (arrayBitRangesEq!0 (buf!560 thiss!1486) (buf!560 (_2!556 lt!9930)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!227 (buf!560 thiss!1486)) (currentByte!1563 thiss!1486) (currentBit!1558 thiss!1486))))))

(assert (= (and d!2252 res!8487) b!7762))

(assert (= (and b!7762 res!8486) b!7763))

(assert (= (and b!7763 (not res!8488)) b!7764))

(assert (=> b!7762 m!9875))

(assert (=> b!7762 m!9873))

(assert (=> b!7764 m!9875))

(assert (=> b!7764 m!9875))

(declare-fun m!9935 () Bool)

(assert (=> b!7764 m!9935))

(assert (=> b!7714 d!2252))

(declare-fun d!2254 () Bool)

(assert (=> d!2254 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!227 (buf!560 (_2!556 lt!9930)))) ((_ sign_extend 32) (currentByte!1563 thiss!1486)) ((_ sign_extend 32) (currentBit!1558 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!227 (buf!560 (_2!556 lt!9930)))) ((_ sign_extend 32) (currentByte!1563 thiss!1486)) ((_ sign_extend 32) (currentBit!1558 thiss!1486))) nBits!460))))

(declare-fun bs!792 () Bool)

(assert (= bs!792 d!2254))

(declare-fun m!9937 () Bool)

(assert (=> bs!792 m!9937))

(assert (=> b!7719 d!2254))

(declare-fun b!7799 () Bool)

(declare-fun res!8500 () Bool)

(declare-fun e!4892 () Bool)

(assert (=> b!7799 (=> (not res!8500) (not e!4892))))

(declare-fun lt!9991 () tuple2!1054)

(assert (=> b!7799 (= res!8500 (bvsle (currentByte!1563 (_1!557 lt!9935)) (currentByte!1563 (_2!555 lt!9991))))))

(declare-fun d!2256 () Bool)

(assert (=> d!2256 e!4892))

(declare-fun res!8502 () Bool)

(assert (=> d!2256 (=> (not res!8502) (not e!4892))))

(assert (=> d!2256 (= res!8502 (= (buf!560 (_2!555 lt!9991)) (buf!560 (_1!557 lt!9935))))))

(declare-datatypes ((tuple3!56 0))(
  ( (tuple3!57 (_1!561 Unit!600) (_2!561 BitStream!432) (_3!28 array!521)) )
))
(declare-fun lt!9990 () tuple3!56)

(assert (=> d!2256 (= lt!9991 (tuple2!1055 (_3!28 lt!9990) (_2!561 lt!9990)))))

(declare-fun readBitsLoop!0 (BitStream!432 (_ BitVec 64) array!521 (_ BitVec 64) (_ BitVec 64)) tuple3!56)

(assert (=> d!2256 (= lt!9990 (readBitsLoop!0 (_1!557 lt!9935) nBits!460 (array!522 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2256 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!2256 (= (readBits!0 (_1!557 lt!9935) nBits!460) lt!9991)))

(declare-fun b!7800 () Bool)

(declare-fun res!8503 () Bool)

(assert (=> b!7800 (=> (not res!8503) (not e!4892))))

(assert (=> b!7800 (= res!8503 (invariant!0 (currentBit!1558 (_2!555 lt!9991)) (currentByte!1563 (_2!555 lt!9991)) (size!227 (buf!560 (_2!555 lt!9991)))))))

(declare-fun b!7801 () Bool)

(declare-fun res!8501 () Bool)

(assert (=> b!7801 (=> (not res!8501) (not e!4892))))

(declare-fun lt!9985 () (_ BitVec 64))

(assert (=> b!7801 (= res!8501 (= (size!227 (_1!555 lt!9991)) ((_ extract 31 0) lt!9985)))))

(assert (=> b!7801 (and (bvslt lt!9985 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!9985 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!9984 () (_ BitVec 64))

(declare-fun lt!9992 () (_ BitVec 64))

(assert (=> b!7801 (= lt!9985 (bvsdiv lt!9984 lt!9992))))

(assert (=> b!7801 (and (not (= lt!9992 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!9984 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!9992 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!7801 (= lt!9992 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!9987 () (_ BitVec 64))

(declare-fun lt!9988 () (_ BitVec 64))

(assert (=> b!7801 (= lt!9984 (bvsub lt!9987 lt!9988))))

(assert (=> b!7801 (or (= (bvand lt!9987 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!9988 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!9987 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!9987 lt!9988) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7801 (= lt!9988 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!9986 () (_ BitVec 64))

(assert (=> b!7801 (= lt!9987 (bvadd nBits!460 lt!9986))))

(assert (=> b!7801 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!9986 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!9986) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7801 (= lt!9986 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!7802 () Bool)

(declare-fun res!8499 () Bool)

(assert (=> b!7802 (=> (not res!8499) (not e!4892))))

(declare-fun lt!9989 () (_ BitVec 64))

(assert (=> b!7802 (= res!8499 (= (bvadd lt!9989 nBits!460) (bitIndex!0 (size!227 (buf!560 (_2!555 lt!9991))) (currentByte!1563 (_2!555 lt!9991)) (currentBit!1558 (_2!555 lt!9991)))))))

(assert (=> b!7802 (or (not (= (bvand lt!9989 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!9989 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!9989 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7802 (= lt!9989 (bitIndex!0 (size!227 (buf!560 (_1!557 lt!9935))) (currentByte!1563 (_1!557 lt!9935)) (currentBit!1558 (_1!557 lt!9935))))))

(declare-fun b!7803 () Bool)

(assert (=> b!7803 (= e!4892 (= (byteArrayBitContentToList!0 (_2!555 lt!9991) (_1!555 lt!9991) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!555 lt!9991) (_1!557 lt!9935) nBits!460)))))

(assert (= (and d!2256 res!8502) b!7802))

(assert (= (and b!7802 res!8499) b!7800))

(assert (= (and b!7800 res!8503) b!7801))

(assert (= (and b!7801 res!8501) b!7799))

(assert (= (and b!7799 res!8500) b!7803))

(declare-fun m!9965 () Bool)

(assert (=> d!2256 m!9965))

(declare-fun m!9967 () Bool)

(assert (=> b!7800 m!9967))

(declare-fun m!9969 () Bool)

(assert (=> b!7802 m!9969))

(declare-fun m!9971 () Bool)

(assert (=> b!7802 m!9971))

(declare-fun m!9973 () Bool)

(assert (=> b!7803 m!9973))

(declare-fun m!9975 () Bool)

(assert (=> b!7803 m!9975))

(assert (=> b!7719 d!2256))

(declare-fun b!7812 () Bool)

(declare-datatypes ((tuple2!1066 0))(
  ( (tuple2!1067 (_1!562 List!127) (_2!562 BitStream!432)) )
))
(declare-fun e!4898 () tuple2!1066)

(assert (=> b!7812 (= e!4898 (tuple2!1067 Nil!124 (_1!557 lt!9935)))))

(declare-fun d!2278 () Bool)

(declare-fun e!4897 () Bool)

(assert (=> d!2278 e!4897))

(declare-fun c!409 () Bool)

(assert (=> d!2278 (= c!409 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!9999 () List!127)

(assert (=> d!2278 (= lt!9999 (_1!562 e!4898))))

(declare-fun c!410 () Bool)

(assert (=> d!2278 (= c!410 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2278 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2278 (= (bitStreamReadBitsIntoList!0 (_2!556 lt!9930) (_1!557 lt!9935) nBits!460) lt!9999)))

(declare-fun b!7814 () Bool)

(declare-fun isEmpty!22 (List!127) Bool)

(assert (=> b!7814 (= e!4897 (isEmpty!22 lt!9999))))

(declare-fun b!7815 () Bool)

(declare-fun length!17 (List!127) Int)

(assert (=> b!7815 (= e!4897 (> (length!17 lt!9999) 0))))

(declare-fun lt!10000 () (_ BitVec 64))

(declare-fun b!7813 () Bool)

(declare-datatypes ((tuple2!1068 0))(
  ( (tuple2!1069 (_1!563 Bool) (_2!563 BitStream!432)) )
))
(declare-fun lt!10001 () tuple2!1068)

(assert (=> b!7813 (= e!4898 (tuple2!1067 (Cons!123 (_1!563 lt!10001) (bitStreamReadBitsIntoList!0 (_2!556 lt!9930) (_2!563 lt!10001) (bvsub nBits!460 lt!10000))) (_2!563 lt!10001)))))

(declare-fun readBit!0 (BitStream!432) tuple2!1068)

(assert (=> b!7813 (= lt!10001 (readBit!0 (_1!557 lt!9935)))))

(assert (=> b!7813 (= lt!10000 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!2278 c!410) b!7812))

(assert (= (and d!2278 (not c!410)) b!7813))

(assert (= (and d!2278 c!409) b!7814))

(assert (= (and d!2278 (not c!409)) b!7815))

(declare-fun m!9977 () Bool)

(assert (=> b!7814 m!9977))

(declare-fun m!9979 () Bool)

(assert (=> b!7815 m!9979))

(declare-fun m!9981 () Bool)

(assert (=> b!7813 m!9981))

(declare-fun m!9983 () Bool)

(assert (=> b!7813 m!9983))

(assert (=> b!7719 d!2278))

(declare-fun d!2280 () Bool)

(declare-fun c!411 () Bool)

(assert (=> d!2280 (= c!411 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!4899 () List!127)

(assert (=> d!2280 (= (byteArrayBitContentToList!0 (_2!556 lt!9930) (_1!555 lt!9931) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!4899)))

(declare-fun b!7816 () Bool)

(assert (=> b!7816 (= e!4899 Nil!124)))

(declare-fun b!7817 () Bool)

(assert (=> b!7817 (= e!4899 (Cons!123 (not (= (bvand ((_ sign_extend 24) (select (arr!629 (_1!555 lt!9931)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!556 lt!9930) (_1!555 lt!9931) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2280 c!411) b!7816))

(assert (= (and d!2280 (not c!411)) b!7817))

(declare-fun m!9985 () Bool)

(assert (=> b!7817 m!9985))

(declare-fun m!9987 () Bool)

(assert (=> b!7817 m!9987))

(declare-fun m!9989 () Bool)

(assert (=> b!7817 m!9989))

(assert (=> b!7719 d!2280))

(declare-fun b!7858 () Bool)

(declare-fun res!8535 () Bool)

(declare-fun e!4913 () Bool)

(assert (=> b!7858 (=> (not res!8535) (not e!4913))))

(declare-fun lt!10145 () tuple2!1058)

(assert (=> b!7858 (= res!8535 (isPrefixOf!0 (_1!557 lt!10145) thiss!1486))))

(declare-fun lt!10141 () (_ BitVec 64))

(declare-fun b!7859 () Bool)

(declare-fun lt!10138 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!432 (_ BitVec 64)) BitStream!432)

(assert (=> b!7859 (= e!4913 (= (_1!557 lt!10145) (withMovedBitIndex!0 (_2!557 lt!10145) (bvsub lt!10138 lt!10141))))))

(assert (=> b!7859 (or (= (bvand lt!10138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!10141 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!10138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!10138 lt!10141) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7859 (= lt!10141 (bitIndex!0 (size!227 (buf!560 (_2!556 lt!9930))) (currentByte!1563 (_2!556 lt!9930)) (currentBit!1558 (_2!556 lt!9930))))))

(assert (=> b!7859 (= lt!10138 (bitIndex!0 (size!227 (buf!560 thiss!1486)) (currentByte!1563 thiss!1486) (currentBit!1558 thiss!1486)))))

(declare-fun b!7860 () Bool)

(declare-fun e!4914 () Unit!600)

(declare-fun lt!10146 () Unit!600)

(assert (=> b!7860 (= e!4914 lt!10146)))

(declare-fun lt!10148 () (_ BitVec 64))

(assert (=> b!7860 (= lt!10148 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10144 () (_ BitVec 64))

(assert (=> b!7860 (= lt!10144 (bitIndex!0 (size!227 (buf!560 thiss!1486)) (currentByte!1563 thiss!1486) (currentBit!1558 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!521 array!521 (_ BitVec 64) (_ BitVec 64)) Unit!600)

(assert (=> b!7860 (= lt!10146 (arrayBitRangesEqSymmetric!0 (buf!560 thiss!1486) (buf!560 (_2!556 lt!9930)) lt!10148 lt!10144))))

(assert (=> b!7860 (arrayBitRangesEq!0 (buf!560 (_2!556 lt!9930)) (buf!560 thiss!1486) lt!10148 lt!10144)))

(declare-fun d!2282 () Bool)

(assert (=> d!2282 e!4913))

(declare-fun res!8534 () Bool)

(assert (=> d!2282 (=> (not res!8534) (not e!4913))))

(assert (=> d!2282 (= res!8534 (isPrefixOf!0 (_1!557 lt!10145) (_2!557 lt!10145)))))

(declare-fun lt!10131 () BitStream!432)

(assert (=> d!2282 (= lt!10145 (tuple2!1059 lt!10131 (_2!556 lt!9930)))))

(declare-fun lt!10142 () Unit!600)

(declare-fun lt!10147 () Unit!600)

(assert (=> d!2282 (= lt!10142 lt!10147)))

(assert (=> d!2282 (isPrefixOf!0 lt!10131 (_2!556 lt!9930))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!432 BitStream!432 BitStream!432) Unit!600)

(assert (=> d!2282 (= lt!10147 (lemmaIsPrefixTransitive!0 lt!10131 (_2!556 lt!9930) (_2!556 lt!9930)))))

(declare-fun lt!10129 () Unit!600)

(declare-fun lt!10140 () Unit!600)

(assert (=> d!2282 (= lt!10129 lt!10140)))

(assert (=> d!2282 (isPrefixOf!0 lt!10131 (_2!556 lt!9930))))

(assert (=> d!2282 (= lt!10140 (lemmaIsPrefixTransitive!0 lt!10131 thiss!1486 (_2!556 lt!9930)))))

(declare-fun lt!10136 () Unit!600)

(assert (=> d!2282 (= lt!10136 e!4914)))

(declare-fun c!417 () Bool)

(assert (=> d!2282 (= c!417 (not (= (size!227 (buf!560 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!10130 () Unit!600)

(declare-fun lt!10133 () Unit!600)

(assert (=> d!2282 (= lt!10130 lt!10133)))

(assert (=> d!2282 (isPrefixOf!0 (_2!556 lt!9930) (_2!556 lt!9930))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!432) Unit!600)

(assert (=> d!2282 (= lt!10133 (lemmaIsPrefixRefl!0 (_2!556 lt!9930)))))

(declare-fun lt!10137 () Unit!600)

(declare-fun lt!10132 () Unit!600)

(assert (=> d!2282 (= lt!10137 lt!10132)))

(assert (=> d!2282 (= lt!10132 (lemmaIsPrefixRefl!0 (_2!556 lt!9930)))))

(declare-fun lt!10139 () Unit!600)

(declare-fun lt!10143 () Unit!600)

(assert (=> d!2282 (= lt!10139 lt!10143)))

(assert (=> d!2282 (isPrefixOf!0 lt!10131 lt!10131)))

(assert (=> d!2282 (= lt!10143 (lemmaIsPrefixRefl!0 lt!10131))))

(declare-fun lt!10134 () Unit!600)

(declare-fun lt!10135 () Unit!600)

(assert (=> d!2282 (= lt!10134 lt!10135)))

(assert (=> d!2282 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2282 (= lt!10135 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2282 (= lt!10131 (BitStream!433 (buf!560 (_2!556 lt!9930)) (currentByte!1563 thiss!1486) (currentBit!1558 thiss!1486)))))

(assert (=> d!2282 (isPrefixOf!0 thiss!1486 (_2!556 lt!9930))))

(assert (=> d!2282 (= (reader!0 thiss!1486 (_2!556 lt!9930)) lt!10145)))

(declare-fun b!7861 () Bool)

(declare-fun Unit!604 () Unit!600)

(assert (=> b!7861 (= e!4914 Unit!604)))

(declare-fun b!7862 () Bool)

(declare-fun res!8536 () Bool)

(assert (=> b!7862 (=> (not res!8536) (not e!4913))))

(assert (=> b!7862 (= res!8536 (isPrefixOf!0 (_2!557 lt!10145) (_2!556 lt!9930)))))

(assert (= (and d!2282 c!417) b!7860))

(assert (= (and d!2282 (not c!417)) b!7861))

(assert (= (and d!2282 res!8534) b!7858))

(assert (= (and b!7858 res!8535) b!7862))

(assert (= (and b!7862 res!8536) b!7859))

(assert (=> b!7860 m!9875))

(declare-fun m!10035 () Bool)

(assert (=> b!7860 m!10035))

(declare-fun m!10037 () Bool)

(assert (=> b!7860 m!10037))

(declare-fun m!10039 () Bool)

(assert (=> b!7858 m!10039))

(declare-fun m!10041 () Bool)

(assert (=> b!7862 m!10041))

(declare-fun m!10043 () Bool)

(assert (=> b!7859 m!10043))

(assert (=> b!7859 m!9873))

(assert (=> b!7859 m!9875))

(declare-fun m!10045 () Bool)

(assert (=> d!2282 m!10045))

(declare-fun m!10047 () Bool)

(assert (=> d!2282 m!10047))

(assert (=> d!2282 m!9883))

(declare-fun m!10049 () Bool)

(assert (=> d!2282 m!10049))

(declare-fun m!10051 () Bool)

(assert (=> d!2282 m!10051))

(declare-fun m!10053 () Bool)

(assert (=> d!2282 m!10053))

(declare-fun m!10055 () Bool)

(assert (=> d!2282 m!10055))

(declare-fun m!10057 () Bool)

(assert (=> d!2282 m!10057))

(declare-fun m!10059 () Bool)

(assert (=> d!2282 m!10059))

(declare-fun m!10061 () Bool)

(assert (=> d!2282 m!10061))

(declare-fun m!10063 () Bool)

(assert (=> d!2282 m!10063))

(assert (=> b!7719 d!2282))

(declare-fun d!2290 () Bool)

(assert (=> d!2290 (validate_offset_bits!1 ((_ sign_extend 32) (size!227 (buf!560 (_2!556 lt!9930)))) ((_ sign_extend 32) (currentByte!1563 thiss!1486)) ((_ sign_extend 32) (currentBit!1558 thiss!1486)) nBits!460)))

(declare-fun lt!10151 () Unit!600)

(declare-fun choose!9 (BitStream!432 array!521 (_ BitVec 64) BitStream!432) Unit!600)

(assert (=> d!2290 (= lt!10151 (choose!9 thiss!1486 (buf!560 (_2!556 lt!9930)) nBits!460 (BitStream!433 (buf!560 (_2!556 lt!9930)) (currentByte!1563 thiss!1486) (currentBit!1558 thiss!1486))))))

(assert (=> d!2290 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!560 (_2!556 lt!9930)) nBits!460) lt!10151)))

(declare-fun bs!797 () Bool)

(assert (= bs!797 d!2290))

(assert (=> bs!797 m!9869))

(declare-fun m!10065 () Bool)

(assert (=> bs!797 m!10065))

(assert (=> b!7719 d!2290))

(declare-fun d!2292 () Bool)

(assert (=> d!2292 (= (array_inv!222 srcBuffer!6) (bvsge (size!227 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1564 d!2292))

(declare-fun d!2294 () Bool)

(assert (=> d!2294 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1558 thiss!1486) (currentByte!1563 thiss!1486) (size!227 (buf!560 thiss!1486))))))

(declare-fun bs!798 () Bool)

(assert (= bs!798 d!2294))

(declare-fun m!10067 () Bool)

(assert (=> bs!798 m!10067))

(assert (=> start!1564 d!2294))

(declare-fun d!2296 () Bool)

(assert (=> d!2296 (= (invariant!0 (currentBit!1558 (_2!556 lt!9930)) (currentByte!1563 (_2!556 lt!9930)) (size!227 (buf!560 (_2!556 lt!9930)))) (and (bvsge (currentBit!1558 (_2!556 lt!9930)) #b00000000000000000000000000000000) (bvslt (currentBit!1558 (_2!556 lt!9930)) #b00000000000000000000000000001000) (bvsge (currentByte!1563 (_2!556 lt!9930)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1563 (_2!556 lt!9930)) (size!227 (buf!560 (_2!556 lt!9930)))) (and (= (currentBit!1558 (_2!556 lt!9930)) #b00000000000000000000000000000000) (= (currentByte!1563 (_2!556 lt!9930)) (size!227 (buf!560 (_2!556 lt!9930))))))))))

(assert (=> b!7713 d!2296))

(declare-fun b!7936 () Bool)

(declare-fun res!8585 () Bool)

(declare-fun e!4946 () Bool)

(assert (=> b!7936 (=> (not res!8585) (not e!4946))))

(declare-fun lt!10399 () tuple2!1056)

(assert (=> b!7936 (= res!8585 (isPrefixOf!0 thiss!1486 (_2!556 lt!10399)))))

(declare-fun b!7937 () Bool)

(declare-fun res!8584 () Bool)

(assert (=> b!7937 (=> (not res!8584) (not e!4946))))

(assert (=> b!7937 (= res!8584 (invariant!0 (currentBit!1558 (_2!556 lt!10399)) (currentByte!1563 (_2!556 lt!10399)) (size!227 (buf!560 (_2!556 lt!10399)))))))

(declare-fun b!7938 () Bool)

(declare-fun res!8582 () Bool)

(assert (=> b!7938 (=> (not res!8582) (not e!4946))))

(assert (=> b!7938 (= res!8582 (= (size!227 (buf!560 thiss!1486)) (size!227 (buf!560 (_2!556 lt!10399)))))))

(declare-fun lt!10427 () tuple2!1056)

(declare-fun c!432 () Bool)

(declare-fun call!86 () tuple2!1058)

(declare-fun lt!10430 () tuple2!1056)

(declare-fun bm!83 () Bool)

(assert (=> bm!83 (= call!86 (reader!0 (ite c!432 (_2!556 lt!10430) thiss!1486) (ite c!432 (_2!556 lt!10427) thiss!1486)))))

(declare-fun d!2298 () Bool)

(assert (=> d!2298 e!4946))

(declare-fun res!8586 () Bool)

(assert (=> d!2298 (=> (not res!8586) (not e!4946))))

(declare-fun lt!10407 () (_ BitVec 64))

(assert (=> d!2298 (= res!8586 (= (bitIndex!0 (size!227 (buf!560 (_2!556 lt!10399))) (currentByte!1563 (_2!556 lt!10399)) (currentBit!1558 (_2!556 lt!10399))) (bvsub lt!10407 from!367)))))

(assert (=> d!2298 (or (= (bvand lt!10407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!10407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!10407 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!10411 () (_ BitVec 64))

(assert (=> d!2298 (= lt!10407 (bvadd lt!10411 from!367 nBits!460))))

(assert (=> d!2298 (or (not (= (bvand lt!10411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!10411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!10411 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2298 (= lt!10411 (bitIndex!0 (size!227 (buf!560 thiss!1486)) (currentByte!1563 thiss!1486) (currentBit!1558 thiss!1486)))))

(declare-fun e!4945 () tuple2!1056)

(assert (=> d!2298 (= lt!10399 e!4945)))

(assert (=> d!2298 (= c!432 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!10420 () Unit!600)

(declare-fun lt!10419 () Unit!600)

(assert (=> d!2298 (= lt!10420 lt!10419)))

(assert (=> d!2298 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2298 (= lt!10419 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!10402 () (_ BitVec 64))

(assert (=> d!2298 (= lt!10402 (bitIndex!0 (size!227 (buf!560 thiss!1486)) (currentByte!1563 thiss!1486) (currentBit!1558 thiss!1486)))))

(assert (=> d!2298 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2298 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!10399)))

(declare-fun lt!10418 () tuple2!1058)

(declare-fun b!7939 () Bool)

(assert (=> b!7939 (= e!4946 (= (bitStreamReadBitsIntoList!0 (_2!556 lt!10399) (_1!557 lt!10418) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!556 lt!10399) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!7939 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7939 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!10416 () Unit!600)

(declare-fun lt!10409 () Unit!600)

(assert (=> b!7939 (= lt!10416 lt!10409)))

(declare-fun lt!10432 () (_ BitVec 64))

(assert (=> b!7939 (validate_offset_bits!1 ((_ sign_extend 32) (size!227 (buf!560 (_2!556 lt!10399)))) ((_ sign_extend 32) (currentByte!1563 thiss!1486)) ((_ sign_extend 32) (currentBit!1558 thiss!1486)) lt!10432)))

(assert (=> b!7939 (= lt!10409 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!560 (_2!556 lt!10399)) lt!10432))))

(declare-fun e!4947 () Bool)

(assert (=> b!7939 e!4947))

(declare-fun res!8583 () Bool)

(assert (=> b!7939 (=> (not res!8583) (not e!4947))))

(assert (=> b!7939 (= res!8583 (and (= (size!227 (buf!560 thiss!1486)) (size!227 (buf!560 (_2!556 lt!10399)))) (bvsge lt!10432 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7939 (= lt!10432 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!7939 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7939 (= lt!10418 (reader!0 thiss!1486 (_2!556 lt!10399)))))

(declare-fun b!7940 () Bool)

(declare-fun Unit!605 () Unit!600)

(assert (=> b!7940 (= e!4945 (tuple2!1057 Unit!605 (_2!556 lt!10427)))))

(declare-fun appendBitFromByte!0 (BitStream!432 (_ BitVec 8) (_ BitVec 32)) tuple2!1056)

(assert (=> b!7940 (= lt!10430 (appendBitFromByte!0 thiss!1486 (select (arr!629 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!10422 () (_ BitVec 64))

(assert (=> b!7940 (= lt!10422 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!10406 () (_ BitVec 64))

(assert (=> b!7940 (= lt!10406 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!10413 () Unit!600)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!432 BitStream!432 (_ BitVec 64) (_ BitVec 64)) Unit!600)

(assert (=> b!7940 (= lt!10413 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!556 lt!10430) lt!10422 lt!10406))))

(assert (=> b!7940 (validate_offset_bits!1 ((_ sign_extend 32) (size!227 (buf!560 (_2!556 lt!10430)))) ((_ sign_extend 32) (currentByte!1563 (_2!556 lt!10430))) ((_ sign_extend 32) (currentBit!1558 (_2!556 lt!10430))) (bvsub lt!10422 lt!10406))))

(declare-fun lt!10425 () Unit!600)

(assert (=> b!7940 (= lt!10425 lt!10413)))

(declare-fun lt!10431 () tuple2!1058)

(assert (=> b!7940 (= lt!10431 (reader!0 thiss!1486 (_2!556 lt!10430)))))

(declare-fun lt!10395 () (_ BitVec 64))

(assert (=> b!7940 (= lt!10395 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!10400 () Unit!600)

(assert (=> b!7940 (= lt!10400 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!560 (_2!556 lt!10430)) lt!10395))))

(assert (=> b!7940 (validate_offset_bits!1 ((_ sign_extend 32) (size!227 (buf!560 (_2!556 lt!10430)))) ((_ sign_extend 32) (currentByte!1563 thiss!1486)) ((_ sign_extend 32) (currentBit!1558 thiss!1486)) lt!10395)))

(declare-fun lt!10438 () Unit!600)

(assert (=> b!7940 (= lt!10438 lt!10400)))

(declare-fun head!32 (List!127) Bool)

(assert (=> b!7940 (= (head!32 (byteArrayBitContentToList!0 (_2!556 lt!10430) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!32 (bitStreamReadBitsIntoList!0 (_2!556 lt!10430) (_1!557 lt!10431) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!10433 () Unit!600)

(declare-fun Unit!606 () Unit!600)

(assert (=> b!7940 (= lt!10433 Unit!606)))

(assert (=> b!7940 (= lt!10427 (appendBitsMSBFirstLoop!0 (_2!556 lt!10430) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!10434 () Unit!600)

(assert (=> b!7940 (= lt!10434 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!556 lt!10430) (_2!556 lt!10427)))))

(assert (=> b!7940 (isPrefixOf!0 thiss!1486 (_2!556 lt!10427))))

(declare-fun lt!10428 () Unit!600)

(assert (=> b!7940 (= lt!10428 lt!10434)))

(assert (=> b!7940 (= (size!227 (buf!560 (_2!556 lt!10427))) (size!227 (buf!560 thiss!1486)))))

(declare-fun lt!10396 () Unit!600)

(declare-fun Unit!607 () Unit!600)

(assert (=> b!7940 (= lt!10396 Unit!607)))

(assert (=> b!7940 (= (bitIndex!0 (size!227 (buf!560 (_2!556 lt!10427))) (currentByte!1563 (_2!556 lt!10427)) (currentBit!1558 (_2!556 lt!10427))) (bvsub (bvadd (bitIndex!0 (size!227 (buf!560 thiss!1486)) (currentByte!1563 thiss!1486) (currentBit!1558 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!10405 () Unit!600)

(declare-fun Unit!608 () Unit!600)

(assert (=> b!7940 (= lt!10405 Unit!608)))

(assert (=> b!7940 (= (bitIndex!0 (size!227 (buf!560 (_2!556 lt!10427))) (currentByte!1563 (_2!556 lt!10427)) (currentBit!1558 (_2!556 lt!10427))) (bvsub (bvsub (bvadd (bitIndex!0 (size!227 (buf!560 (_2!556 lt!10430))) (currentByte!1563 (_2!556 lt!10430)) (currentBit!1558 (_2!556 lt!10430))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!10435 () Unit!600)

(declare-fun Unit!609 () Unit!600)

(assert (=> b!7940 (= lt!10435 Unit!609)))

(declare-fun lt!10421 () tuple2!1058)

(assert (=> b!7940 (= lt!10421 (reader!0 thiss!1486 (_2!556 lt!10427)))))

(declare-fun lt!10404 () (_ BitVec 64))

(assert (=> b!7940 (= lt!10404 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!10429 () Unit!600)

(assert (=> b!7940 (= lt!10429 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!560 (_2!556 lt!10427)) lt!10404))))

(assert (=> b!7940 (validate_offset_bits!1 ((_ sign_extend 32) (size!227 (buf!560 (_2!556 lt!10427)))) ((_ sign_extend 32) (currentByte!1563 thiss!1486)) ((_ sign_extend 32) (currentBit!1558 thiss!1486)) lt!10404)))

(declare-fun lt!10436 () Unit!600)

(assert (=> b!7940 (= lt!10436 lt!10429)))

(declare-fun lt!10401 () tuple2!1058)

(assert (=> b!7940 (= lt!10401 call!86)))

(declare-fun lt!10398 () (_ BitVec 64))

(assert (=> b!7940 (= lt!10398 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!10410 () Unit!600)

(assert (=> b!7940 (= lt!10410 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!556 lt!10430) (buf!560 (_2!556 lt!10427)) lt!10398))))

(assert (=> b!7940 (validate_offset_bits!1 ((_ sign_extend 32) (size!227 (buf!560 (_2!556 lt!10427)))) ((_ sign_extend 32) (currentByte!1563 (_2!556 lt!10430))) ((_ sign_extend 32) (currentBit!1558 (_2!556 lt!10430))) lt!10398)))

(declare-fun lt!10414 () Unit!600)

(assert (=> b!7940 (= lt!10414 lt!10410)))

(declare-fun lt!10426 () List!127)

(assert (=> b!7940 (= lt!10426 (byteArrayBitContentToList!0 (_2!556 lt!10427) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!10417 () List!127)

(assert (=> b!7940 (= lt!10417 (byteArrayBitContentToList!0 (_2!556 lt!10427) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!10408 () List!127)

(assert (=> b!7940 (= lt!10408 (bitStreamReadBitsIntoList!0 (_2!556 lt!10427) (_1!557 lt!10421) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!10415 () List!127)

(assert (=> b!7940 (= lt!10415 (bitStreamReadBitsIntoList!0 (_2!556 lt!10427) (_1!557 lt!10401) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!10424 () (_ BitVec 64))

(assert (=> b!7940 (= lt!10424 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!10412 () Unit!600)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!432 BitStream!432 BitStream!432 BitStream!432 (_ BitVec 64) List!127) Unit!600)

(assert (=> b!7940 (= lt!10412 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!556 lt!10427) (_2!556 lt!10427) (_1!557 lt!10421) (_1!557 lt!10401) lt!10424 lt!10408))))

(declare-fun tail!40 (List!127) List!127)

(assert (=> b!7940 (= (bitStreamReadBitsIntoList!0 (_2!556 lt!10427) (_1!557 lt!10401) (bvsub lt!10424 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!40 lt!10408))))

(declare-fun lt!10397 () Unit!600)

(assert (=> b!7940 (= lt!10397 lt!10412)))

(declare-fun lt!10423 () Unit!600)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!521 array!521 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!600)

(assert (=> b!7940 (= lt!10423 (arrayBitRangesEqImpliesEq!0 (buf!560 (_2!556 lt!10430)) (buf!560 (_2!556 lt!10427)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!10402 (bitIndex!0 (size!227 (buf!560 (_2!556 lt!10430))) (currentByte!1563 (_2!556 lt!10430)) (currentBit!1558 (_2!556 lt!10430)))))))

(declare-fun bitAt!0 (array!521 (_ BitVec 64)) Bool)

(assert (=> b!7940 (= (bitAt!0 (buf!560 (_2!556 lt!10430)) lt!10402) (bitAt!0 (buf!560 (_2!556 lt!10427)) lt!10402))))

(declare-fun lt!10403 () Unit!600)

(assert (=> b!7940 (= lt!10403 lt!10423)))

(declare-fun b!7941 () Bool)

(declare-fun res!8587 () Bool)

(assert (=> b!7941 (=> (not res!8587) (not e!4946))))

(assert (=> b!7941 (= res!8587 (= (size!227 (buf!560 (_2!556 lt!10399))) (size!227 (buf!560 thiss!1486))))))

(declare-fun b!7942 () Bool)

(assert (=> b!7942 (= e!4947 (validate_offset_bits!1 ((_ sign_extend 32) (size!227 (buf!560 thiss!1486))) ((_ sign_extend 32) (currentByte!1563 thiss!1486)) ((_ sign_extend 32) (currentBit!1558 thiss!1486)) lt!10432))))

(declare-fun b!7943 () Bool)

(declare-fun Unit!610 () Unit!600)

(assert (=> b!7943 (= e!4945 (tuple2!1057 Unit!610 thiss!1486))))

(assert (=> b!7943 (= (size!227 (buf!560 thiss!1486)) (size!227 (buf!560 thiss!1486)))))

(declare-fun lt!10437 () Unit!600)

(declare-fun Unit!611 () Unit!600)

(assert (=> b!7943 (= lt!10437 Unit!611)))

(assert (=> b!7943 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!555 (readBits!0 (_1!557 call!86) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (= (and d!2298 c!432) b!7940))

(assert (= (and d!2298 (not c!432)) b!7943))

(assert (= (or b!7940 b!7943) bm!83))

(assert (= (and d!2298 res!8586) b!7937))

(assert (= (and b!7937 res!8584) b!7938))

(assert (= (and b!7938 res!8582) b!7936))

(assert (= (and b!7936 res!8585) b!7941))

(assert (= (and b!7941 res!8587) b!7939))

(assert (= (and b!7939 res!8583) b!7942))

(declare-fun m!10131 () Bool)

(assert (=> bm!83 m!10131))

(declare-fun m!10133 () Bool)

(assert (=> b!7943 m!10133))

(declare-fun m!10135 () Bool)

(assert (=> b!7943 m!10135))

(declare-fun m!10137 () Bool)

(assert (=> b!7940 m!10137))

(declare-fun m!10139 () Bool)

(assert (=> b!7940 m!10139))

(declare-fun m!10141 () Bool)

(assert (=> b!7940 m!10141))

(declare-fun m!10143 () Bool)

(assert (=> b!7940 m!10143))

(declare-fun m!10145 () Bool)

(assert (=> b!7940 m!10145))

(declare-fun m!10147 () Bool)

(assert (=> b!7940 m!10147))

(declare-fun m!10149 () Bool)

(assert (=> b!7940 m!10149))

(declare-fun m!10151 () Bool)

(assert (=> b!7940 m!10151))

(declare-fun m!10153 () Bool)

(assert (=> b!7940 m!10153))

(assert (=> b!7940 m!9929))

(declare-fun m!10155 () Bool)

(assert (=> b!7940 m!10155))

(assert (=> b!7940 m!10151))

(declare-fun m!10157 () Bool)

(assert (=> b!7940 m!10157))

(assert (=> b!7940 m!9929))

(declare-fun m!10159 () Bool)

(assert (=> b!7940 m!10159))

(declare-fun m!10161 () Bool)

(assert (=> b!7940 m!10161))

(declare-fun m!10163 () Bool)

(assert (=> b!7940 m!10163))

(declare-fun m!10165 () Bool)

(assert (=> b!7940 m!10165))

(declare-fun m!10167 () Bool)

(assert (=> b!7940 m!10167))

(assert (=> b!7940 m!10149))

(declare-fun m!10169 () Bool)

(assert (=> b!7940 m!10169))

(declare-fun m!10171 () Bool)

(assert (=> b!7940 m!10171))

(declare-fun m!10173 () Bool)

(assert (=> b!7940 m!10173))

(declare-fun m!10175 () Bool)

(assert (=> b!7940 m!10175))

(declare-fun m!10177 () Bool)

(assert (=> b!7940 m!10177))

(declare-fun m!10179 () Bool)

(assert (=> b!7940 m!10179))

(declare-fun m!10181 () Bool)

(assert (=> b!7940 m!10181))

(declare-fun m!10183 () Bool)

(assert (=> b!7940 m!10183))

(declare-fun m!10185 () Bool)

(assert (=> b!7940 m!10185))

(declare-fun m!10187 () Bool)

(assert (=> b!7940 m!10187))

(declare-fun m!10189 () Bool)

(assert (=> b!7940 m!10189))

(declare-fun m!10191 () Bool)

(assert (=> b!7940 m!10191))

(assert (=> b!7940 m!9875))

(declare-fun m!10193 () Bool)

(assert (=> b!7940 m!10193))

(assert (=> b!7940 m!10137))

(declare-fun m!10195 () Bool)

(assert (=> b!7940 m!10195))

(declare-fun m!10197 () Bool)

(assert (=> b!7939 m!10197))

(declare-fun m!10199 () Bool)

(assert (=> b!7939 m!10199))

(declare-fun m!10201 () Bool)

(assert (=> b!7939 m!10201))

(declare-fun m!10203 () Bool)

(assert (=> b!7939 m!10203))

(declare-fun m!10205 () Bool)

(assert (=> b!7939 m!10205))

(declare-fun m!10207 () Bool)

(assert (=> b!7942 m!10207))

(declare-fun m!10209 () Bool)

(assert (=> b!7936 m!10209))

(declare-fun m!10211 () Bool)

(assert (=> d!2298 m!10211))

(assert (=> d!2298 m!9875))

(assert (=> d!2298 m!10053))

(assert (=> d!2298 m!10061))

(declare-fun m!10213 () Bool)

(assert (=> b!7937 m!10213))

(assert (=> b!7713 d!2298))

(declare-fun d!2318 () Bool)

(assert (=> d!2318 (= (array_inv!222 (buf!560 thiss!1486)) (bvsge (size!227 (buf!560 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!7718 d!2318))

(declare-fun d!2320 () Bool)

(declare-fun res!8604 () Bool)

(declare-fun e!4956 () Bool)

(assert (=> d!2320 (=> res!8604 e!4956)))

(assert (=> d!2320 (= res!8604 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2320 (= (checkByteArrayBitContent!0 (_2!556 lt!9930) srcBuffer!6 (_1!555 lt!9931) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!4956)))

(declare-fun b!7960 () Bool)

(declare-fun e!4957 () Bool)

(assert (=> b!7960 (= e!4956 e!4957)))

(declare-fun res!8605 () Bool)

(assert (=> b!7960 (=> (not res!8605) (not e!4957))))

(assert (=> b!7960 (= res!8605 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!629 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!629 (_1!555 lt!9931)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!7961 () Bool)

(assert (=> b!7961 (= e!4957 (checkByteArrayBitContent!0 (_2!556 lt!9930) srcBuffer!6 (_1!555 lt!9931) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!2320 (not res!8604)) b!7960))

(assert (= (and b!7960 res!8605) b!7961))

(assert (=> b!7960 m!9929))

(assert (=> b!7960 m!9931))

(assert (=> b!7960 m!9985))

(assert (=> b!7960 m!9987))

(declare-fun m!10215 () Bool)

(assert (=> b!7961 m!10215))

(assert (=> b!7712 d!2320))

(declare-fun d!2322 () Bool)

(assert (=> d!2322 (checkByteArrayBitContent!0 (_2!556 lt!9930) srcBuffer!6 (_1!555 lt!9931) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!10517 () Unit!600)

(declare-fun choose!65 (BitStream!432 array!521 array!521 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!600)

(assert (=> d!2322 (= lt!10517 (choose!65 (_2!556 lt!9930) srcBuffer!6 (_1!555 lt!9931) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2322 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2322 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!556 lt!9930) srcBuffer!6 (_1!555 lt!9931) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!10517)))

(declare-fun bs!801 () Bool)

(assert (= bs!801 d!2322))

(assert (=> bs!801 m!9879))

(declare-fun m!10217 () Bool)

(assert (=> bs!801 m!10217))

(assert (=> b!7712 d!2322))

(declare-fun d!2324 () Bool)

(declare-fun e!4963 () Bool)

(assert (=> d!2324 e!4963))

(declare-fun res!8617 () Bool)

(assert (=> d!2324 (=> (not res!8617) (not e!4963))))

(declare-fun lt!10534 () (_ BitVec 64))

(declare-fun lt!10533 () (_ BitVec 64))

(declare-fun lt!10532 () (_ BitVec 64))

(assert (=> d!2324 (= res!8617 (= lt!10533 (bvsub lt!10532 lt!10534)))))

(assert (=> d!2324 (or (= (bvand lt!10532 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!10534 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!10532 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!10532 lt!10534) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2324 (= lt!10534 (remainingBits!0 ((_ sign_extend 32) (size!227 (buf!560 (_2!556 lt!9930)))) ((_ sign_extend 32) (currentByte!1563 (_2!556 lt!9930))) ((_ sign_extend 32) (currentBit!1558 (_2!556 lt!9930)))))))

(declare-fun lt!10530 () (_ BitVec 64))

(declare-fun lt!10535 () (_ BitVec 64))

(assert (=> d!2324 (= lt!10532 (bvmul lt!10530 lt!10535))))

(assert (=> d!2324 (or (= lt!10530 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!10535 (bvsdiv (bvmul lt!10530 lt!10535) lt!10530)))))

(assert (=> d!2324 (= lt!10535 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2324 (= lt!10530 ((_ sign_extend 32) (size!227 (buf!560 (_2!556 lt!9930)))))))

(assert (=> d!2324 (= lt!10533 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1563 (_2!556 lt!9930))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1558 (_2!556 lt!9930)))))))

(assert (=> d!2324 (invariant!0 (currentBit!1558 (_2!556 lt!9930)) (currentByte!1563 (_2!556 lt!9930)) (size!227 (buf!560 (_2!556 lt!9930))))))

(assert (=> d!2324 (= (bitIndex!0 (size!227 (buf!560 (_2!556 lt!9930))) (currentByte!1563 (_2!556 lt!9930)) (currentBit!1558 (_2!556 lt!9930))) lt!10533)))

(declare-fun b!7974 () Bool)

(declare-fun res!8616 () Bool)

(assert (=> b!7974 (=> (not res!8616) (not e!4963))))

(assert (=> b!7974 (= res!8616 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!10533))))

(declare-fun b!7975 () Bool)

(declare-fun lt!10531 () (_ BitVec 64))

(assert (=> b!7975 (= e!4963 (bvsle lt!10533 (bvmul lt!10531 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!7975 (or (= lt!10531 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!10531 #b0000000000000000000000000000000000000000000000000000000000001000) lt!10531)))))

(assert (=> b!7975 (= lt!10531 ((_ sign_extend 32) (size!227 (buf!560 (_2!556 lt!9930)))))))

(assert (= (and d!2324 res!8617) b!7974))

(assert (= (and b!7974 res!8616) b!7975))

(declare-fun m!10305 () Bool)

(assert (=> d!2324 m!10305))

(assert (=> d!2324 m!9855))

(assert (=> b!7717 d!2324))

(declare-fun d!2328 () Bool)

(declare-fun e!4964 () Bool)

(assert (=> d!2328 e!4964))

(declare-fun res!8619 () Bool)

(assert (=> d!2328 (=> (not res!8619) (not e!4964))))

(declare-fun lt!10544 () (_ BitVec 64))

(declare-fun lt!10543 () (_ BitVec 64))

(declare-fun lt!10542 () (_ BitVec 64))

(assert (=> d!2328 (= res!8619 (= lt!10543 (bvsub lt!10542 lt!10544)))))

(assert (=> d!2328 (or (= (bvand lt!10542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!10544 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!10542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!10542 lt!10544) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2328 (= lt!10544 (remainingBits!0 ((_ sign_extend 32) (size!227 (buf!560 thiss!1486))) ((_ sign_extend 32) (currentByte!1563 thiss!1486)) ((_ sign_extend 32) (currentBit!1558 thiss!1486))))))

(declare-fun lt!10540 () (_ BitVec 64))

(declare-fun lt!10545 () (_ BitVec 64))

(assert (=> d!2328 (= lt!10542 (bvmul lt!10540 lt!10545))))

(assert (=> d!2328 (or (= lt!10540 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!10545 (bvsdiv (bvmul lt!10540 lt!10545) lt!10540)))))

(assert (=> d!2328 (= lt!10545 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2328 (= lt!10540 ((_ sign_extend 32) (size!227 (buf!560 thiss!1486))))))

(assert (=> d!2328 (= lt!10543 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1563 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1558 thiss!1486))))))

(assert (=> d!2328 (invariant!0 (currentBit!1558 thiss!1486) (currentByte!1563 thiss!1486) (size!227 (buf!560 thiss!1486)))))

(assert (=> d!2328 (= (bitIndex!0 (size!227 (buf!560 thiss!1486)) (currentByte!1563 thiss!1486) (currentBit!1558 thiss!1486)) lt!10543)))

(declare-fun b!7976 () Bool)

(declare-fun res!8618 () Bool)

(assert (=> b!7976 (=> (not res!8618) (not e!4964))))

(assert (=> b!7976 (= res!8618 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!10543))))

(declare-fun b!7977 () Bool)

(declare-fun lt!10541 () (_ BitVec 64))

(assert (=> b!7977 (= e!4964 (bvsle lt!10543 (bvmul lt!10541 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!7977 (or (= lt!10541 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!10541 #b0000000000000000000000000000000000000000000000000000000000001000) lt!10541)))))

(assert (=> b!7977 (= lt!10541 ((_ sign_extend 32) (size!227 (buf!560 thiss!1486))))))

(assert (= (and d!2328 res!8619) b!7976))

(assert (= (and b!7976 res!8618) b!7977))

(assert (=> d!2328 m!9927))

(assert (=> d!2328 m!10067))

(assert (=> b!7717 d!2328))

(check-sat (not b!7802) (not b!7862) (not b!7800) (not d!2290) (not b!7815) (not b!7860) (not d!2322) (not d!2294) (not b!7817) (not d!2256) (not b!7937) (not d!2298) (not b!7762) (not b!7961) (not d!2324) (not b!7813) (not b!7803) (not d!2248) (not d!2282) (not b!7936) (not b!7943) (not b!7764) (not b!7814) (not b!7755) (not b!7940) (not b!7942) (not bm!83) (not d!2328) (not b!7859) (not b!7858) (not b!7939) (not d!2254))
(check-sat)
