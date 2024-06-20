; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1440 () Bool)

(assert start!1440)

(declare-fun b!6863 () Bool)

(declare-fun res!7756 () Bool)

(declare-fun e!4337 () Bool)

(assert (=> b!6863 (=> (not res!7756) (not e!4337))))

(declare-datatypes ((array!478 0))(
  ( (array!479 (arr!606 (Array (_ BitVec 32) (_ BitVec 8))) (size!207 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!392 0))(
  ( (BitStream!393 (buf!537 array!478) (currentByte!1534 (_ BitVec 32)) (currentBit!1529 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!392)

(declare-datatypes ((Unit!536 0))(
  ( (Unit!537) )
))
(declare-datatypes ((tuple2!922 0))(
  ( (tuple2!923 (_1!486 Unit!536) (_2!486 BitStream!392)) )
))
(declare-fun lt!8799 () tuple2!922)

(declare-fun isPrefixOf!0 (BitStream!392 BitStream!392) Bool)

(assert (=> b!6863 (= res!7756 (isPrefixOf!0 thiss!1486 (_2!486 lt!8799)))))

(declare-fun b!6864 () Bool)

(declare-fun res!7758 () Bool)

(declare-fun e!4340 () Bool)

(assert (=> b!6864 (=> res!7758 e!4340)))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!478)

(declare-datatypes ((List!107 0))(
  ( (Nil!104) (Cons!103 (h!222 Bool) (t!857 List!107)) )
))
(declare-fun lt!8801 () List!107)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun byteArrayBitContentToList!0 (BitStream!392 array!478 (_ BitVec 64) (_ BitVec 64)) List!107)

(assert (=> b!6864 (= res!7758 (not (= lt!8801 (byteArrayBitContentToList!0 (_2!486 lt!8799) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!6865 () Bool)

(declare-fun res!7753 () Bool)

(declare-fun e!4334 () Bool)

(assert (=> b!6865 (=> res!7753 e!4334)))

(assert (=> b!6865 (= res!7753 (bvsgt nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(declare-fun b!6866 () Bool)

(declare-fun e!4339 () Bool)

(declare-fun array_inv!202 (array!478) Bool)

(assert (=> b!6866 (= e!4339 (array_inv!202 (buf!537 thiss!1486)))))

(declare-fun res!7754 () Bool)

(declare-fun e!4336 () Bool)

(assert (=> start!1440 (=> (not res!7754) (not e!4336))))

(assert (=> start!1440 (= res!7754 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!207 srcBuffer!6))))))))

(assert (=> start!1440 e!4336))

(assert (=> start!1440 true))

(assert (=> start!1440 (array_inv!202 srcBuffer!6)))

(declare-fun inv!12 (BitStream!392) Bool)

(assert (=> start!1440 (and (inv!12 thiss!1486) e!4339)))

(declare-fun b!6867 () Bool)

(assert (=> b!6867 (= e!4336 e!4337)))

(declare-fun res!7762 () Bool)

(assert (=> b!6867 (=> (not res!7762) (not e!4337))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!6867 (= res!7762 (invariant!0 (currentBit!1529 (_2!486 lt!8799)) (currentByte!1534 (_2!486 lt!8799)) (size!207 (buf!537 (_2!486 lt!8799)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!392 array!478 (_ BitVec 64) (_ BitVec 64)) tuple2!922)

(assert (=> b!6867 (= lt!8799 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!6868 () Bool)

(declare-fun res!7759 () Bool)

(assert (=> b!6868 (=> (not res!7759) (not e!4336))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6868 (= res!7759 (validate_offset_bits!1 ((_ sign_extend 32) (size!207 (buf!537 thiss!1486))) ((_ sign_extend 32) (currentByte!1534 thiss!1486)) ((_ sign_extend 32) (currentBit!1529 thiss!1486)) nBits!460))))

(declare-fun b!6869 () Bool)

(assert (=> b!6869 (= e!4340 e!4334)))

(declare-fun res!7757 () Bool)

(assert (=> b!6869 (=> res!7757 e!4334)))

(declare-datatypes ((tuple2!924 0))(
  ( (tuple2!925 (_1!487 array!478) (_2!487 BitStream!392)) )
))
(declare-fun lt!8797 () tuple2!924)

(declare-fun checkByteArrayBitContent!0 (BitStream!392 array!478 array!478 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6869 (= res!7757 (not (checkByteArrayBitContent!0 (_2!486 lt!8799) srcBuffer!6 (_1!487 lt!8797) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!8800 () Unit!536)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!392 array!478 array!478 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!536)

(assert (=> b!6869 (= lt!8800 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!486 lt!8799) srcBuffer!6 (_1!487 lt!8797) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!6870 () Bool)

(declare-datatypes ((tuple2!926 0))(
  ( (tuple2!927 (_1!488 BitStream!392) (_2!488 BitStream!392)) )
))
(declare-fun lt!8796 () tuple2!926)

(assert (=> b!6870 (= e!4334 (validate_offset_bits!1 ((_ sign_extend 32) (size!207 (buf!537 (_1!488 lt!8796)))) ((_ sign_extend 32) (currentByte!1534 (_1!488 lt!8796))) ((_ sign_extend 32) (currentBit!1529 (_1!488 lt!8796))) nBits!460))))

(declare-fun b!6871 () Bool)

(declare-fun res!7761 () Bool)

(assert (=> b!6871 (=> (not res!7761) (not e!4337))))

(assert (=> b!6871 (= res!7761 (= (size!207 (buf!537 thiss!1486)) (size!207 (buf!537 (_2!486 lt!8799)))))))

(declare-fun b!6872 () Bool)

(assert (=> b!6872 (= e!4337 (not e!4340))))

(declare-fun res!7755 () Bool)

(assert (=> b!6872 (=> res!7755 e!4340)))

(assert (=> b!6872 (= res!7755 (not (= (byteArrayBitContentToList!0 (_2!486 lt!8799) (_1!487 lt!8797) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!8801)))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!392 BitStream!392 (_ BitVec 64)) List!107)

(assert (=> b!6872 (= lt!8801 (bitStreamReadBitsIntoList!0 (_2!486 lt!8799) (_1!488 lt!8796) nBits!460))))

(declare-fun readBits!0 (BitStream!392 (_ BitVec 64)) tuple2!924)

(assert (=> b!6872 (= lt!8797 (readBits!0 (_1!488 lt!8796) nBits!460))))

(assert (=> b!6872 (validate_offset_bits!1 ((_ sign_extend 32) (size!207 (buf!537 (_2!486 lt!8799)))) ((_ sign_extend 32) (currentByte!1534 thiss!1486)) ((_ sign_extend 32) (currentBit!1529 thiss!1486)) nBits!460)))

(declare-fun lt!8798 () Unit!536)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!392 array!478 (_ BitVec 64)) Unit!536)

(assert (=> b!6872 (= lt!8798 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!537 (_2!486 lt!8799)) nBits!460))))

(declare-fun reader!0 (BitStream!392 BitStream!392) tuple2!926)

(assert (=> b!6872 (= lt!8796 (reader!0 thiss!1486 (_2!486 lt!8799)))))

(declare-fun b!6873 () Bool)

(declare-fun res!7760 () Bool)

(assert (=> b!6873 (=> (not res!7760) (not e!4337))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!6873 (= res!7760 (= (bitIndex!0 (size!207 (buf!537 (_2!486 lt!8799))) (currentByte!1534 (_2!486 lt!8799)) (currentBit!1529 (_2!486 lt!8799))) (bvadd (bitIndex!0 (size!207 (buf!537 thiss!1486)) (currentByte!1534 thiss!1486) (currentBit!1529 thiss!1486)) nBits!460)))))

(assert (= (and start!1440 res!7754) b!6868))

(assert (= (and b!6868 res!7759) b!6867))

(assert (= (and b!6867 res!7762) b!6871))

(assert (= (and b!6871 res!7761) b!6873))

(assert (= (and b!6873 res!7760) b!6863))

(assert (= (and b!6863 res!7756) b!6872))

(assert (= (and b!6872 (not res!7755)) b!6864))

(assert (= (and b!6864 (not res!7758)) b!6869))

(assert (= (and b!6869 (not res!7757)) b!6865))

(assert (= (and b!6865 (not res!7753)) b!6870))

(assert (= start!1440 b!6866))

(declare-fun m!8671 () Bool)

(assert (=> b!6870 m!8671))

(declare-fun m!8673 () Bool)

(assert (=> b!6866 m!8673))

(declare-fun m!8675 () Bool)

(assert (=> b!6872 m!8675))

(declare-fun m!8677 () Bool)

(assert (=> b!6872 m!8677))

(declare-fun m!8679 () Bool)

(assert (=> b!6872 m!8679))

(declare-fun m!8681 () Bool)

(assert (=> b!6872 m!8681))

(declare-fun m!8683 () Bool)

(assert (=> b!6872 m!8683))

(declare-fun m!8685 () Bool)

(assert (=> b!6872 m!8685))

(declare-fun m!8687 () Bool)

(assert (=> b!6864 m!8687))

(declare-fun m!8689 () Bool)

(assert (=> b!6867 m!8689))

(declare-fun m!8691 () Bool)

(assert (=> b!6867 m!8691))

(declare-fun m!8693 () Bool)

(assert (=> b!6869 m!8693))

(declare-fun m!8695 () Bool)

(assert (=> b!6869 m!8695))

(declare-fun m!8697 () Bool)

(assert (=> b!6868 m!8697))

(declare-fun m!8699 () Bool)

(assert (=> start!1440 m!8699))

(declare-fun m!8701 () Bool)

(assert (=> start!1440 m!8701))

(declare-fun m!8703 () Bool)

(assert (=> b!6873 m!8703))

(declare-fun m!8705 () Bool)

(assert (=> b!6873 m!8705))

(declare-fun m!8707 () Bool)

(assert (=> b!6863 m!8707))

(push 1)

(assert (not b!6866))

(assert (not b!6864))

(assert (not b!6873))

(assert (not start!1440))

(assert (not b!6863))

(assert (not b!6869))

(assert (not b!6867))

(assert (not b!6868))

(assert (not b!6870))

(assert (not b!6872))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2138 () Bool)

(declare-fun res!7784 () Bool)

(declare-fun e!4362 () Bool)

(assert (=> d!2138 (=> (not res!7784) (not e!4362))))

(assert (=> d!2138 (= res!7784 (= (size!207 (buf!537 thiss!1486)) (size!207 (buf!537 (_2!486 lt!8799)))))))

(assert (=> d!2138 (= (isPrefixOf!0 thiss!1486 (_2!486 lt!8799)) e!4362)))

(declare-fun b!6903 () Bool)

(declare-fun res!7785 () Bool)

(assert (=> b!6903 (=> (not res!7785) (not e!4362))))

(assert (=> b!6903 (= res!7785 (bvsle (bitIndex!0 (size!207 (buf!537 thiss!1486)) (currentByte!1534 thiss!1486) (currentBit!1529 thiss!1486)) (bitIndex!0 (size!207 (buf!537 (_2!486 lt!8799))) (currentByte!1534 (_2!486 lt!8799)) (currentBit!1529 (_2!486 lt!8799)))))))

(declare-fun b!6904 () Bool)

(declare-fun e!4361 () Bool)

(assert (=> b!6904 (= e!4362 e!4361)))

(declare-fun res!7786 () Bool)

(assert (=> b!6904 (=> res!7786 e!4361)))

(assert (=> b!6904 (= res!7786 (= (size!207 (buf!537 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!6905 () Bool)

(declare-fun arrayBitRangesEq!0 (array!478 array!478 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6905 (= e!4361 (arrayBitRangesEq!0 (buf!537 thiss!1486) (buf!537 (_2!486 lt!8799)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!207 (buf!537 thiss!1486)) (currentByte!1534 thiss!1486) (currentBit!1529 thiss!1486))))))

(assert (= (and d!2138 res!7784) b!6903))

(assert (= (and b!6903 res!7785) b!6904))

(assert (= (and b!6904 (not res!7786)) b!6905))

(assert (=> b!6903 m!8705))

(assert (=> b!6903 m!8703))

(assert (=> b!6905 m!8705))

(assert (=> b!6905 m!8705))

(declare-fun m!8743 () Bool)

(assert (=> b!6905 m!8743))

(assert (=> b!6863 d!2138))

(declare-fun d!2148 () Bool)

(declare-fun c!351 () Bool)

(assert (=> d!2148 (= c!351 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!4368 () List!107)

(assert (=> d!2148 (= (byteArrayBitContentToList!0 (_2!486 lt!8799) srcBuffer!6 from!367 nBits!460) e!4368)))

(declare-fun b!6916 () Bool)

(assert (=> b!6916 (= e!4368 Nil!104)))

(declare-fun b!6917 () Bool)

(assert (=> b!6917 (= e!4368 (Cons!103 (not (= (bvand ((_ sign_extend 24) (select (arr!606 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!486 lt!8799) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2148 c!351) b!6916))

(assert (= (and d!2148 (not c!351)) b!6917))

(declare-fun m!8747 () Bool)

(assert (=> b!6917 m!8747))

(declare-fun m!8749 () Bool)

(assert (=> b!6917 m!8749))

(declare-fun m!8751 () Bool)

(assert (=> b!6917 m!8751))

(assert (=> b!6864 d!2148))

(declare-fun d!2154 () Bool)

(declare-fun res!7791 () Bool)

(declare-fun e!4373 () Bool)

(assert (=> d!2154 (=> res!7791 e!4373)))

(assert (=> d!2154 (= res!7791 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2154 (= (checkByteArrayBitContent!0 (_2!486 lt!8799) srcBuffer!6 (_1!487 lt!8797) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!4373)))

(declare-fun b!6922 () Bool)

(declare-fun e!4374 () Bool)

(assert (=> b!6922 (= e!4373 e!4374)))

(declare-fun res!7792 () Bool)

(assert (=> b!6922 (=> (not res!7792) (not e!4374))))

(assert (=> b!6922 (= res!7792 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!606 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!606 (_1!487 lt!8797)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!6923 () Bool)

(assert (=> b!6923 (= e!4374 (checkByteArrayBitContent!0 (_2!486 lt!8799) srcBuffer!6 (_1!487 lt!8797) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!2154 (not res!7791)) b!6922))

(assert (= (and b!6922 res!7792) b!6923))

(assert (=> b!6922 m!8747))

(assert (=> b!6922 m!8749))

(declare-fun m!8753 () Bool)

(assert (=> b!6922 m!8753))

(declare-fun m!8755 () Bool)

(assert (=> b!6922 m!8755))

(declare-fun m!8757 () Bool)

(assert (=> b!6923 m!8757))

(assert (=> b!6869 d!2154))

(declare-fun d!2156 () Bool)

(assert (=> d!2156 (checkByteArrayBitContent!0 (_2!486 lt!8799) srcBuffer!6 (_1!487 lt!8797) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!8810 () Unit!536)

(declare-fun choose!65 (BitStream!392 array!478 array!478 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!536)

(assert (=> d!2156 (= lt!8810 (choose!65 (_2!486 lt!8799) srcBuffer!6 (_1!487 lt!8797) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2156 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2156 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!486 lt!8799) srcBuffer!6 (_1!487 lt!8797) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!8810)))

(declare-fun bs!757 () Bool)

(assert (= bs!757 d!2156))

(assert (=> bs!757 m!8693))

(declare-fun m!8759 () Bool)

(assert (=> bs!757 m!8759))

(assert (=> b!6869 d!2156))

(declare-fun d!2158 () Bool)

(assert (=> d!2158 (= (array_inv!202 srcBuffer!6) (bvsge (size!207 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1440 d!2158))

(declare-fun d!2160 () Bool)

(assert (=> d!2160 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1529 thiss!1486) (currentByte!1534 thiss!1486) (size!207 (buf!537 thiss!1486))))))

(declare-fun bs!758 () Bool)

(assert (= bs!758 d!2160))

(declare-fun m!8761 () Bool)

(assert (=> bs!758 m!8761))

(assert (=> start!1440 d!2160))

(declare-fun d!2162 () Bool)

(assert (=> d!2162 (= (invariant!0 (currentBit!1529 (_2!486 lt!8799)) (currentByte!1534 (_2!486 lt!8799)) (size!207 (buf!537 (_2!486 lt!8799)))) (and (bvsge (currentBit!1529 (_2!486 lt!8799)) #b00000000000000000000000000000000) (bvslt (currentBit!1529 (_2!486 lt!8799)) #b00000000000000000000000000001000) (bvsge (currentByte!1534 (_2!486 lt!8799)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1534 (_2!486 lt!8799)) (size!207 (buf!537 (_2!486 lt!8799)))) (and (= (currentBit!1529 (_2!486 lt!8799)) #b00000000000000000000000000000000) (= (currentByte!1534 (_2!486 lt!8799)) (size!207 (buf!537 (_2!486 lt!8799))))))))))

(assert (=> b!6867 d!2162))

(declare-fun lt!9152 () tuple2!922)

(declare-fun e!4407 () Bool)

(declare-fun b!7006 () Bool)

(declare-fun lt!9167 () tuple2!926)

(assert (=> b!7006 (= e!4407 (= (bitStreamReadBitsIntoList!0 (_2!486 lt!9152) (_1!488 lt!9167) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!486 lt!9152) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!7006 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7006 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!9161 () Unit!536)

(declare-fun lt!9150 () Unit!536)

(assert (=> b!7006 (= lt!9161 lt!9150)))

(declare-fun lt!9146 () (_ BitVec 64))

(assert (=> b!7006 (validate_offset_bits!1 ((_ sign_extend 32) (size!207 (buf!537 (_2!486 lt!9152)))) ((_ sign_extend 32) (currentByte!1534 thiss!1486)) ((_ sign_extend 32) (currentBit!1529 thiss!1486)) lt!9146)))

(assert (=> b!7006 (= lt!9150 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!537 (_2!486 lt!9152)) lt!9146))))

(declare-fun e!4406 () Bool)

(assert (=> b!7006 e!4406))

(declare-fun res!7852 () Bool)

(assert (=> b!7006 (=> (not res!7852) (not e!4406))))

(assert (=> b!7006 (= res!7852 (and (= (size!207 (buf!537 thiss!1486)) (size!207 (buf!537 (_2!486 lt!9152)))) (bvsge lt!9146 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7006 (= lt!9146 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!7006 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7006 (= lt!9167 (reader!0 thiss!1486 (_2!486 lt!9152)))))

(declare-fun b!7007 () Bool)

(assert (=> b!7007 (= e!4406 (validate_offset_bits!1 ((_ sign_extend 32) (size!207 (buf!537 thiss!1486))) ((_ sign_extend 32) (currentByte!1534 thiss!1486)) ((_ sign_extend 32) (currentBit!1529 thiss!1486)) lt!9146))))

(declare-fun b!7008 () Bool)

(declare-fun res!7851 () Bool)

(assert (=> b!7008 (=> (not res!7851) (not e!4407))))

(assert (=> b!7008 (= res!7851 (= (size!207 (buf!537 (_2!486 lt!9152))) (size!207 (buf!537 thiss!1486))))))

(declare-fun b!7009 () Bool)

(declare-fun res!7849 () Bool)

(assert (=> b!7009 (=> (not res!7849) (not e!4407))))

(assert (=> b!7009 (= res!7849 (= (size!207 (buf!537 thiss!1486)) (size!207 (buf!537 (_2!486 lt!9152)))))))

(declare-fun b!7010 () Bool)

(declare-fun res!7848 () Bool)

(assert (=> b!7010 (=> (not res!7848) (not e!4407))))

(assert (=> b!7010 (= res!7848 (invariant!0 (currentBit!1529 (_2!486 lt!9152)) (currentByte!1534 (_2!486 lt!9152)) (size!207 (buf!537 (_2!486 lt!9152)))))))

(declare-fun b!7011 () Bool)

(declare-fun e!4405 () tuple2!922)

(declare-fun Unit!546 () Unit!536)

(assert (=> b!7011 (= e!4405 (tuple2!923 Unit!546 thiss!1486))))

(assert (=> b!7011 (= (size!207 (buf!537 thiss!1486)) (size!207 (buf!537 thiss!1486)))))

(declare-fun lt!9133 () Unit!536)

(declare-fun Unit!547 () Unit!536)

(assert (=> b!7011 (= lt!9133 Unit!547)))

(declare-fun call!80 () tuple2!926)

(assert (=> b!7011 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!487 (readBits!0 (_1!488 call!80) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!7012 () Bool)

(declare-fun res!7847 () Bool)

(assert (=> b!7012 (=> (not res!7847) (not e!4407))))

(assert (=> b!7012 (= res!7847 (isPrefixOf!0 thiss!1486 (_2!486 lt!9152)))))

(declare-fun lt!9132 () tuple2!922)

(declare-fun lt!9169 () tuple2!922)

(declare-fun c!366 () Bool)

(declare-fun bm!77 () Bool)

(assert (=> bm!77 (= call!80 (reader!0 (ite c!366 (_2!486 lt!9169) thiss!1486) (ite c!366 (_2!486 lt!9132) thiss!1486)))))

(declare-fun d!2164 () Bool)

(assert (=> d!2164 e!4407))

(declare-fun res!7850 () Bool)

(assert (=> d!2164 (=> (not res!7850) (not e!4407))))

(declare-fun lt!9154 () (_ BitVec 64))

(assert (=> d!2164 (= res!7850 (= (bitIndex!0 (size!207 (buf!537 (_2!486 lt!9152))) (currentByte!1534 (_2!486 lt!9152)) (currentBit!1529 (_2!486 lt!9152))) (bvsub lt!9154 from!367)))))

(assert (=> d!2164 (or (= (bvand lt!9154 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!9154 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!9154 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!9170 () (_ BitVec 64))

(assert (=> d!2164 (= lt!9154 (bvadd lt!9170 from!367 nBits!460))))

(assert (=> d!2164 (or (not (= (bvand lt!9170 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!9170 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!9170 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2164 (= lt!9170 (bitIndex!0 (size!207 (buf!537 thiss!1486)) (currentByte!1534 thiss!1486) (currentBit!1529 thiss!1486)))))

(assert (=> d!2164 (= lt!9152 e!4405)))

(assert (=> d!2164 (= c!366 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!9157 () Unit!536)

(declare-fun lt!9142 () Unit!536)

(assert (=> d!2164 (= lt!9157 lt!9142)))

(assert (=> d!2164 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!392) Unit!536)

(assert (=> d!2164 (= lt!9142 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!9159 () (_ BitVec 64))

(assert (=> d!2164 (= lt!9159 (bitIndex!0 (size!207 (buf!537 thiss!1486)) (currentByte!1534 thiss!1486) (currentBit!1529 thiss!1486)))))

(assert (=> d!2164 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2164 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!9152)))

(declare-fun b!7013 () Bool)

(declare-fun Unit!551 () Unit!536)

(assert (=> b!7013 (= e!4405 (tuple2!923 Unit!551 (_2!486 lt!9132)))))

(declare-fun appendBitFromByte!0 (BitStream!392 (_ BitVec 8) (_ BitVec 32)) tuple2!922)

(assert (=> b!7013 (= lt!9169 (appendBitFromByte!0 thiss!1486 (select (arr!606 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!9165 () (_ BitVec 64))

(assert (=> b!7013 (= lt!9165 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!9164 () (_ BitVec 64))

(assert (=> b!7013 (= lt!9164 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!9127 () Unit!536)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!392 BitStream!392 (_ BitVec 64) (_ BitVec 64)) Unit!536)

(assert (=> b!7013 (= lt!9127 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!486 lt!9169) lt!9165 lt!9164))))

(assert (=> b!7013 (validate_offset_bits!1 ((_ sign_extend 32) (size!207 (buf!537 (_2!486 lt!9169)))) ((_ sign_extend 32) (currentByte!1534 (_2!486 lt!9169))) ((_ sign_extend 32) (currentBit!1529 (_2!486 lt!9169))) (bvsub lt!9165 lt!9164))))

(declare-fun lt!9156 () Unit!536)

(assert (=> b!7013 (= lt!9156 lt!9127)))

(declare-fun lt!9162 () tuple2!926)

(assert (=> b!7013 (= lt!9162 (reader!0 thiss!1486 (_2!486 lt!9169)))))

(declare-fun lt!9136 () (_ BitVec 64))

(assert (=> b!7013 (= lt!9136 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!9129 () Unit!536)

(assert (=> b!7013 (= lt!9129 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!537 (_2!486 lt!9169)) lt!9136))))

(assert (=> b!7013 (validate_offset_bits!1 ((_ sign_extend 32) (size!207 (buf!537 (_2!486 lt!9169)))) ((_ sign_extend 32) (currentByte!1534 thiss!1486)) ((_ sign_extend 32) (currentBit!1529 thiss!1486)) lt!9136)))

(declare-fun lt!9149 () Unit!536)

(assert (=> b!7013 (= lt!9149 lt!9129)))

(declare-fun head!31 (List!107) Bool)

(assert (=> b!7013 (= (head!31 (byteArrayBitContentToList!0 (_2!486 lt!9169) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!31 (bitStreamReadBitsIntoList!0 (_2!486 lt!9169) (_1!488 lt!9162) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!9128 () Unit!536)

(declare-fun Unit!556 () Unit!536)

(assert (=> b!7013 (= lt!9128 Unit!556)))

(assert (=> b!7013 (= lt!9132 (appendBitsMSBFirstLoop!0 (_2!486 lt!9169) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!9131 () Unit!536)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!392 BitStream!392 BitStream!392) Unit!536)

(assert (=> b!7013 (= lt!9131 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!486 lt!9169) (_2!486 lt!9132)))))

(assert (=> b!7013 (isPrefixOf!0 thiss!1486 (_2!486 lt!9132))))

(declare-fun lt!9137 () Unit!536)

(assert (=> b!7013 (= lt!9137 lt!9131)))

(assert (=> b!7013 (= (size!207 (buf!537 (_2!486 lt!9132))) (size!207 (buf!537 thiss!1486)))))

(declare-fun lt!9151 () Unit!536)

(declare-fun Unit!557 () Unit!536)

(assert (=> b!7013 (= lt!9151 Unit!557)))

(assert (=> b!7013 (= (bitIndex!0 (size!207 (buf!537 (_2!486 lt!9132))) (currentByte!1534 (_2!486 lt!9132)) (currentBit!1529 (_2!486 lt!9132))) (bvsub (bvadd (bitIndex!0 (size!207 (buf!537 thiss!1486)) (currentByte!1534 thiss!1486) (currentBit!1529 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!9144 () Unit!536)

(declare-fun Unit!558 () Unit!536)

(assert (=> b!7013 (= lt!9144 Unit!558)))

(assert (=> b!7013 (= (bitIndex!0 (size!207 (buf!537 (_2!486 lt!9132))) (currentByte!1534 (_2!486 lt!9132)) (currentBit!1529 (_2!486 lt!9132))) (bvsub (bvsub (bvadd (bitIndex!0 (size!207 (buf!537 (_2!486 lt!9169))) (currentByte!1534 (_2!486 lt!9169)) (currentBit!1529 (_2!486 lt!9169))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!9138 () Unit!536)

(declare-fun Unit!559 () Unit!536)

(assert (=> b!7013 (= lt!9138 Unit!559)))

(declare-fun lt!9140 () tuple2!926)

(assert (=> b!7013 (= lt!9140 (reader!0 thiss!1486 (_2!486 lt!9132)))))

(declare-fun lt!9160 () (_ BitVec 64))

(assert (=> b!7013 (= lt!9160 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!9134 () Unit!536)

(assert (=> b!7013 (= lt!9134 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!537 (_2!486 lt!9132)) lt!9160))))

(assert (=> b!7013 (validate_offset_bits!1 ((_ sign_extend 32) (size!207 (buf!537 (_2!486 lt!9132)))) ((_ sign_extend 32) (currentByte!1534 thiss!1486)) ((_ sign_extend 32) (currentBit!1529 thiss!1486)) lt!9160)))

(declare-fun lt!9153 () Unit!536)

(assert (=> b!7013 (= lt!9153 lt!9134)))

(declare-fun lt!9166 () tuple2!926)

(assert (=> b!7013 (= lt!9166 call!80)))

(declare-fun lt!9135 () (_ BitVec 64))

(assert (=> b!7013 (= lt!9135 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!9158 () Unit!536)

(assert (=> b!7013 (= lt!9158 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!486 lt!9169) (buf!537 (_2!486 lt!9132)) lt!9135))))

(assert (=> b!7013 (validate_offset_bits!1 ((_ sign_extend 32) (size!207 (buf!537 (_2!486 lt!9132)))) ((_ sign_extend 32) (currentByte!1534 (_2!486 lt!9169))) ((_ sign_extend 32) (currentBit!1529 (_2!486 lt!9169))) lt!9135)))

(declare-fun lt!9143 () Unit!536)

(assert (=> b!7013 (= lt!9143 lt!9158)))

(declare-fun lt!9163 () List!107)

(assert (=> b!7013 (= lt!9163 (byteArrayBitContentToList!0 (_2!486 lt!9132) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!9155 () List!107)

(assert (=> b!7013 (= lt!9155 (byteArrayBitContentToList!0 (_2!486 lt!9132) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!9139 () List!107)

(assert (=> b!7013 (= lt!9139 (bitStreamReadBitsIntoList!0 (_2!486 lt!9132) (_1!488 lt!9140) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!9147 () List!107)

(assert (=> b!7013 (= lt!9147 (bitStreamReadBitsIntoList!0 (_2!486 lt!9132) (_1!488 lt!9166) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!9130 () (_ BitVec 64))

(assert (=> b!7013 (= lt!9130 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!9145 () Unit!536)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!392 BitStream!392 BitStream!392 BitStream!392 (_ BitVec 64) List!107) Unit!536)

(assert (=> b!7013 (= lt!9145 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!486 lt!9132) (_2!486 lt!9132) (_1!488 lt!9140) (_1!488 lt!9166) lt!9130 lt!9139))))

(declare-fun tail!39 (List!107) List!107)

(assert (=> b!7013 (= (bitStreamReadBitsIntoList!0 (_2!486 lt!9132) (_1!488 lt!9166) (bvsub lt!9130 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!39 lt!9139))))

(declare-fun lt!9141 () Unit!536)

(assert (=> b!7013 (= lt!9141 lt!9145)))

(declare-fun lt!9168 () Unit!536)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!478 array!478 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!536)

(assert (=> b!7013 (= lt!9168 (arrayBitRangesEqImpliesEq!0 (buf!537 (_2!486 lt!9169)) (buf!537 (_2!486 lt!9132)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!9159 (bitIndex!0 (size!207 (buf!537 (_2!486 lt!9169))) (currentByte!1534 (_2!486 lt!9169)) (currentBit!1529 (_2!486 lt!9169)))))))

(declare-fun bitAt!0 (array!478 (_ BitVec 64)) Bool)

(assert (=> b!7013 (= (bitAt!0 (buf!537 (_2!486 lt!9169)) lt!9159) (bitAt!0 (buf!537 (_2!486 lt!9132)) lt!9159))))

(declare-fun lt!9148 () Unit!536)

(assert (=> b!7013 (= lt!9148 lt!9168)))

(assert (= (and d!2164 c!366) b!7013))

(assert (= (and d!2164 (not c!366)) b!7011))

(assert (= (or b!7013 b!7011) bm!77))

(assert (= (and d!2164 res!7850) b!7010))

(assert (= (and b!7010 res!7848) b!7009))

(assert (= (and b!7009 res!7849) b!7012))

(assert (= (and b!7012 res!7847) b!7008))

(assert (= (and b!7008 res!7851) b!7006))

(assert (= (and b!7006 res!7852) b!7007))

(declare-fun m!8903 () Bool)

(assert (=> b!7011 m!8903))

(declare-fun m!8905 () Bool)

(assert (=> b!7011 m!8905))

(declare-fun m!8907 () Bool)

(assert (=> b!7007 m!8907))

(declare-fun m!8909 () Bool)

(assert (=> b!7013 m!8909))

(declare-fun m!8911 () Bool)

(assert (=> b!7013 m!8911))

(declare-fun m!8913 () Bool)

(assert (=> b!7013 m!8913))

(declare-fun m!8915 () Bool)

(assert (=> b!7013 m!8915))

(declare-fun m!8917 () Bool)

(assert (=> b!7013 m!8917))

(declare-fun m!8919 () Bool)

(assert (=> b!7013 m!8919))

(declare-fun m!8921 () Bool)

(assert (=> b!7013 m!8921))

(declare-fun m!8923 () Bool)

(assert (=> b!7013 m!8923))

(declare-fun m!8925 () Bool)

(assert (=> b!7013 m!8925))

(declare-fun m!8927 () Bool)

(assert (=> b!7013 m!8927))

(declare-fun m!8929 () Bool)

(assert (=> b!7013 m!8929))

(declare-fun m!8931 () Bool)

(assert (=> b!7013 m!8931))

(declare-fun m!8933 () Bool)

(assert (=> b!7013 m!8933))

(declare-fun m!8935 () Bool)

(assert (=> b!7013 m!8935))

(assert (=> b!7013 m!8747))

(assert (=> b!7013 m!8925))

(declare-fun m!8937 () Bool)

(assert (=> b!7013 m!8937))

(assert (=> b!7013 m!8747))

(declare-fun m!8939 () Bool)

(assert (=> b!7013 m!8939))

(declare-fun m!8941 () Bool)

(assert (=> b!7013 m!8941))

(assert (=> b!7013 m!8911))

(declare-fun m!8943 () Bool)

(assert (=> b!7013 m!8943))

(declare-fun m!8945 () Bool)

(assert (=> b!7013 m!8945))

(declare-fun m!8947 () Bool)

(assert (=> b!7013 m!8947))

(declare-fun m!8949 () Bool)

(assert (=> b!7013 m!8949))

(declare-fun m!8951 () Bool)

(assert (=> b!7013 m!8951))

(declare-fun m!8953 () Bool)

(assert (=> b!7013 m!8953))

(declare-fun m!8955 () Bool)

(assert (=> b!7013 m!8955))

(declare-fun m!8957 () Bool)

(assert (=> b!7013 m!8957))

(declare-fun m!8959 () Bool)

(assert (=> b!7013 m!8959))

(assert (=> b!7013 m!8949))

(declare-fun m!8961 () Bool)

(assert (=> b!7013 m!8961))

(declare-fun m!8963 () Bool)

(assert (=> b!7013 m!8963))

(declare-fun m!8965 () Bool)

(assert (=> b!7013 m!8965))

(assert (=> b!7013 m!8705))

(declare-fun m!8967 () Bool)

(assert (=> b!7013 m!8967))

(declare-fun m!8969 () Bool)

(assert (=> bm!77 m!8969))

(declare-fun m!8971 () Bool)

(assert (=> b!7012 m!8971))

(declare-fun m!8973 () Bool)

(assert (=> b!7010 m!8973))

(declare-fun m!8975 () Bool)

(assert (=> d!2164 m!8975))

(assert (=> d!2164 m!8705))

(declare-fun m!8977 () Bool)

(assert (=> d!2164 m!8977))

(declare-fun m!8979 () Bool)

(assert (=> d!2164 m!8979))

(declare-fun m!8981 () Bool)

(assert (=> b!7006 m!8981))

(declare-fun m!8983 () Bool)

(assert (=> b!7006 m!8983))

(declare-fun m!8985 () Bool)

(assert (=> b!7006 m!8985))

(declare-fun m!8987 () Bool)

(assert (=> b!7006 m!8987))

(declare-fun m!8989 () Bool)

(assert (=> b!7006 m!8989))

(assert (=> b!6867 d!2164))

(declare-fun d!2180 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2180 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!207 (buf!537 thiss!1486))) ((_ sign_extend 32) (currentByte!1534 thiss!1486)) ((_ sign_extend 32) (currentBit!1529 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!207 (buf!537 thiss!1486))) ((_ sign_extend 32) (currentByte!1534 thiss!1486)) ((_ sign_extend 32) (currentBit!1529 thiss!1486))) nBits!460))))

(declare-fun bs!760 () Bool)

(assert (= bs!760 d!2180))

(declare-fun m!8991 () Bool)

(assert (=> bs!760 m!8991))

(assert (=> b!6868 d!2180))

(declare-fun d!2182 () Bool)

(declare-fun e!4418 () Bool)

(assert (=> d!2182 e!4418))

(declare-fun res!7871 () Bool)

(assert (=> d!2182 (=> (not res!7871) (not e!4418))))

(declare-fun lt!9211 () (_ BitVec 64))

(declare-fun lt!9212 () (_ BitVec 64))

(declare-fun lt!9208 () (_ BitVec 64))

(assert (=> d!2182 (= res!7871 (= lt!9212 (bvsub lt!9208 lt!9211)))))

(assert (=> d!2182 (or (= (bvand lt!9208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!9211 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!9208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!9208 lt!9211) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2182 (= lt!9211 (remainingBits!0 ((_ sign_extend 32) (size!207 (buf!537 (_2!486 lt!8799)))) ((_ sign_extend 32) (currentByte!1534 (_2!486 lt!8799))) ((_ sign_extend 32) (currentBit!1529 (_2!486 lt!8799)))))))

(declare-fun lt!9207 () (_ BitVec 64))

(declare-fun lt!9210 () (_ BitVec 64))

(assert (=> d!2182 (= lt!9208 (bvmul lt!9207 lt!9210))))

(assert (=> d!2182 (or (= lt!9207 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!9210 (bvsdiv (bvmul lt!9207 lt!9210) lt!9207)))))

(assert (=> d!2182 (= lt!9210 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2182 (= lt!9207 ((_ sign_extend 32) (size!207 (buf!537 (_2!486 lt!8799)))))))

(assert (=> d!2182 (= lt!9212 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1534 (_2!486 lt!8799))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1529 (_2!486 lt!8799)))))))

(assert (=> d!2182 (invariant!0 (currentBit!1529 (_2!486 lt!8799)) (currentByte!1534 (_2!486 lt!8799)) (size!207 (buf!537 (_2!486 lt!8799))))))

(assert (=> d!2182 (= (bitIndex!0 (size!207 (buf!537 (_2!486 lt!8799))) (currentByte!1534 (_2!486 lt!8799)) (currentBit!1529 (_2!486 lt!8799))) lt!9212)))

(declare-fun b!7032 () Bool)

(declare-fun res!7872 () Bool)

(assert (=> b!7032 (=> (not res!7872) (not e!4418))))

(assert (=> b!7032 (= res!7872 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!9212))))

(declare-fun b!7033 () Bool)

(declare-fun lt!9209 () (_ BitVec 64))

(assert (=> b!7033 (= e!4418 (bvsle lt!9212 (bvmul lt!9209 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!7033 (or (= lt!9209 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!9209 #b0000000000000000000000000000000000000000000000000000000000001000) lt!9209)))))

(assert (=> b!7033 (= lt!9209 ((_ sign_extend 32) (size!207 (buf!537 (_2!486 lt!8799)))))))

(assert (= (and d!2182 res!7871) b!7032))

(assert (= (and b!7032 res!7872) b!7033))

(declare-fun m!8997 () Bool)

(assert (=> d!2182 m!8997))

(assert (=> d!2182 m!8689))

(assert (=> b!6873 d!2182))

(declare-fun d!2188 () Bool)

(declare-fun e!4419 () Bool)

(assert (=> d!2188 e!4419))

(declare-fun res!7873 () Bool)

(assert (=> d!2188 (=> (not res!7873) (not e!4419))))

(declare-fun lt!9217 () (_ BitVec 64))

(declare-fun lt!9218 () (_ BitVec 64))

(declare-fun lt!9214 () (_ BitVec 64))

(assert (=> d!2188 (= res!7873 (= lt!9218 (bvsub lt!9214 lt!9217)))))

(assert (=> d!2188 (or (= (bvand lt!9214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!9217 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!9214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!9214 lt!9217) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2188 (= lt!9217 (remainingBits!0 ((_ sign_extend 32) (size!207 (buf!537 thiss!1486))) ((_ sign_extend 32) (currentByte!1534 thiss!1486)) ((_ sign_extend 32) (currentBit!1529 thiss!1486))))))

(declare-fun lt!9213 () (_ BitVec 64))

(declare-fun lt!9216 () (_ BitVec 64))

(assert (=> d!2188 (= lt!9214 (bvmul lt!9213 lt!9216))))

(assert (=> d!2188 (or (= lt!9213 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!9216 (bvsdiv (bvmul lt!9213 lt!9216) lt!9213)))))

(assert (=> d!2188 (= lt!9216 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2188 (= lt!9213 ((_ sign_extend 32) (size!207 (buf!537 thiss!1486))))))

(assert (=> d!2188 (= lt!9218 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1534 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1529 thiss!1486))))))

(assert (=> d!2188 (invariant!0 (currentBit!1529 thiss!1486) (currentByte!1534 thiss!1486) (size!207 (buf!537 thiss!1486)))))

(assert (=> d!2188 (= (bitIndex!0 (size!207 (buf!537 thiss!1486)) (currentByte!1534 thiss!1486) (currentBit!1529 thiss!1486)) lt!9218)))

(declare-fun b!7034 () Bool)

(declare-fun res!7874 () Bool)

(assert (=> b!7034 (=> (not res!7874) (not e!4419))))

(assert (=> b!7034 (= res!7874 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!9218))))

(declare-fun b!7035 () Bool)

(declare-fun lt!9215 () (_ BitVec 64))

(assert (=> b!7035 (= e!4419 (bvsle lt!9218 (bvmul lt!9215 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!7035 (or (= lt!9215 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!9215 #b0000000000000000000000000000000000000000000000000000000000001000) lt!9215)))))

(assert (=> b!7035 (= lt!9215 ((_ sign_extend 32) (size!207 (buf!537 thiss!1486))))))

(assert (= (and d!2188 res!7873) b!7034))

(assert (= (and b!7034 res!7874) b!7035))

(assert (=> d!2188 m!8991))

(assert (=> d!2188 m!8761))

(assert (=> b!6873 d!2188))

(declare-fun d!2190 () Bool)

(assert (=> d!2190 (= (array_inv!202 (buf!537 thiss!1486)) (bvsge (size!207 (buf!537 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!6866 d!2190))

(declare-fun b!7065 () Bool)

(declare-fun e!4433 () Unit!536)

(declare-fun Unit!561 () Unit!536)

(assert (=> b!7065 (= e!4433 Unit!561)))

(declare-fun d!2192 () Bool)

(declare-fun e!4434 () Bool)

(assert (=> d!2192 e!4434))

(declare-fun res!7891 () Bool)

(assert (=> d!2192 (=> (not res!7891) (not e!4434))))

(declare-fun lt!9382 () tuple2!926)

(assert (=> d!2192 (= res!7891 (isPrefixOf!0 (_1!488 lt!9382) (_2!488 lt!9382)))))

(declare-fun lt!9390 () BitStream!392)

(assert (=> d!2192 (= lt!9382 (tuple2!927 lt!9390 (_2!486 lt!8799)))))

(declare-fun lt!9386 () Unit!536)

(declare-fun lt!9379 () Unit!536)

(assert (=> d!2192 (= lt!9386 lt!9379)))

(assert (=> d!2192 (isPrefixOf!0 lt!9390 (_2!486 lt!8799))))

(assert (=> d!2192 (= lt!9379 (lemmaIsPrefixTransitive!0 lt!9390 (_2!486 lt!8799) (_2!486 lt!8799)))))

(declare-fun lt!9385 () Unit!536)

(declare-fun lt!9381 () Unit!536)

(assert (=> d!2192 (= lt!9385 lt!9381)))

(assert (=> d!2192 (isPrefixOf!0 lt!9390 (_2!486 lt!8799))))

(assert (=> d!2192 (= lt!9381 (lemmaIsPrefixTransitive!0 lt!9390 thiss!1486 (_2!486 lt!8799)))))

(declare-fun lt!9393 () Unit!536)

(assert (=> d!2192 (= lt!9393 e!4433)))

(declare-fun c!374 () Bool)

(assert (=> d!2192 (= c!374 (not (= (size!207 (buf!537 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!9389 () Unit!536)

(declare-fun lt!9380 () Unit!536)

(assert (=> d!2192 (= lt!9389 lt!9380)))

(assert (=> d!2192 (isPrefixOf!0 (_2!486 lt!8799) (_2!486 lt!8799))))

(assert (=> d!2192 (= lt!9380 (lemmaIsPrefixRefl!0 (_2!486 lt!8799)))))

(declare-fun lt!9394 () Unit!536)

(declare-fun lt!9383 () Unit!536)

(assert (=> d!2192 (= lt!9394 lt!9383)))

(assert (=> d!2192 (= lt!9383 (lemmaIsPrefixRefl!0 (_2!486 lt!8799)))))

(declare-fun lt!9375 () Unit!536)

(declare-fun lt!9388 () Unit!536)

(assert (=> d!2192 (= lt!9375 lt!9388)))

(assert (=> d!2192 (isPrefixOf!0 lt!9390 lt!9390)))

(assert (=> d!2192 (= lt!9388 (lemmaIsPrefixRefl!0 lt!9390))))

(declare-fun lt!9384 () Unit!536)

(declare-fun lt!9391 () Unit!536)

(assert (=> d!2192 (= lt!9384 lt!9391)))

(assert (=> d!2192 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2192 (= lt!9391 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2192 (= lt!9390 (BitStream!393 (buf!537 (_2!486 lt!8799)) (currentByte!1534 thiss!1486) (currentBit!1529 thiss!1486)))))

(assert (=> d!2192 (isPrefixOf!0 thiss!1486 (_2!486 lt!8799))))

(assert (=> d!2192 (= (reader!0 thiss!1486 (_2!486 lt!8799)) lt!9382)))

(declare-fun b!7066 () Bool)

(declare-fun res!7890 () Bool)

(assert (=> b!7066 (=> (not res!7890) (not e!4434))))

(assert (=> b!7066 (= res!7890 (isPrefixOf!0 (_2!488 lt!9382) (_2!486 lt!8799)))))

(declare-fun lt!9387 () (_ BitVec 64))

(declare-fun b!7067 () Bool)

(declare-fun lt!9378 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!392 (_ BitVec 64)) BitStream!392)

(assert (=> b!7067 (= e!4434 (= (_1!488 lt!9382) (withMovedBitIndex!0 (_2!488 lt!9382) (bvsub lt!9387 lt!9378))))))

(assert (=> b!7067 (or (= (bvand lt!9387 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!9378 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!9387 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!9387 lt!9378) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7067 (= lt!9378 (bitIndex!0 (size!207 (buf!537 (_2!486 lt!8799))) (currentByte!1534 (_2!486 lt!8799)) (currentBit!1529 (_2!486 lt!8799))))))

(assert (=> b!7067 (= lt!9387 (bitIndex!0 (size!207 (buf!537 thiss!1486)) (currentByte!1534 thiss!1486) (currentBit!1529 thiss!1486)))))

(declare-fun b!7068 () Bool)

(declare-fun res!7892 () Bool)

(assert (=> b!7068 (=> (not res!7892) (not e!4434))))

(assert (=> b!7068 (= res!7892 (isPrefixOf!0 (_1!488 lt!9382) thiss!1486))))

(declare-fun b!7069 () Bool)

(declare-fun lt!9392 () Unit!536)

(assert (=> b!7069 (= e!4433 lt!9392)))

(declare-fun lt!9376 () (_ BitVec 64))

(assert (=> b!7069 (= lt!9376 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!9377 () (_ BitVec 64))

(assert (=> b!7069 (= lt!9377 (bitIndex!0 (size!207 (buf!537 thiss!1486)) (currentByte!1534 thiss!1486) (currentBit!1529 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!478 array!478 (_ BitVec 64) (_ BitVec 64)) Unit!536)

(assert (=> b!7069 (= lt!9392 (arrayBitRangesEqSymmetric!0 (buf!537 thiss!1486) (buf!537 (_2!486 lt!8799)) lt!9376 lt!9377))))

(assert (=> b!7069 (arrayBitRangesEq!0 (buf!537 (_2!486 lt!8799)) (buf!537 thiss!1486) lt!9376 lt!9377)))

(assert (= (and d!2192 c!374) b!7069))

(assert (= (and d!2192 (not c!374)) b!7065))

(assert (= (and d!2192 res!7891) b!7068))

(assert (= (and b!7068 res!7892) b!7066))

(assert (= (and b!7066 res!7890) b!7067))

(declare-fun m!9007 () Bool)

(assert (=> b!7066 m!9007))

(declare-fun m!9009 () Bool)

(assert (=> b!7067 m!9009))

(assert (=> b!7067 m!8703))

(assert (=> b!7067 m!8705))

(declare-fun m!9011 () Bool)

(assert (=> b!7068 m!9011))

(assert (=> d!2192 m!8979))

(declare-fun m!9013 () Bool)

(assert (=> d!2192 m!9013))

(declare-fun m!9015 () Bool)

(assert (=> d!2192 m!9015))

(declare-fun m!9017 () Bool)

(assert (=> d!2192 m!9017))

(assert (=> d!2192 m!8707))

(declare-fun m!9019 () Bool)

(assert (=> d!2192 m!9019))

(declare-fun m!9021 () Bool)

(assert (=> d!2192 m!9021))

(declare-fun m!9023 () Bool)

(assert (=> d!2192 m!9023))

(declare-fun m!9025 () Bool)

(assert (=> d!2192 m!9025))

(declare-fun m!9027 () Bool)

(assert (=> d!2192 m!9027))

(assert (=> d!2192 m!8977))

(assert (=> b!7069 m!8705))

(declare-fun m!9029 () Bool)

(assert (=> b!7069 m!9029))

(declare-fun m!9031 () Bool)

(assert (=> b!7069 m!9031))

(assert (=> b!6872 d!2192))

(declare-fun d!2206 () Bool)

(assert (=> d!2206 (validate_offset_bits!1 ((_ sign_extend 32) (size!207 (buf!537 (_2!486 lt!8799)))) ((_ sign_extend 32) (currentByte!1534 thiss!1486)) ((_ sign_extend 32) (currentBit!1529 thiss!1486)) nBits!460)))

(declare-fun lt!9429 () Unit!536)

(declare-fun choose!9 (BitStream!392 array!478 (_ BitVec 64) BitStream!392) Unit!536)

(assert (=> d!2206 (= lt!9429 (choose!9 thiss!1486 (buf!537 (_2!486 lt!8799)) nBits!460 (BitStream!393 (buf!537 (_2!486 lt!8799)) (currentByte!1534 thiss!1486) (currentBit!1529 thiss!1486))))))

(assert (=> d!2206 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!537 (_2!486 lt!8799)) nBits!460) lt!9429)))

(declare-fun bs!764 () Bool)

(assert (= bs!764 d!2206))

(assert (=> bs!764 m!8681))

(declare-fun m!9041 () Bool)

(assert (=> bs!764 m!9041))

(assert (=> b!6872 d!2206))

(declare-fun b!7132 () Bool)

(declare-fun res!7953 () Bool)

(declare-fun e!4457 () Bool)

(assert (=> b!7132 (=> (not res!7953) (not e!4457))))

(declare-fun lt!9545 () tuple2!924)

(declare-fun lt!9549 () (_ BitVec 64))

(assert (=> b!7132 (= res!7953 (= (size!207 (_1!487 lt!9545)) ((_ extract 31 0) lt!9549)))))

(assert (=> b!7132 (and (bvslt lt!9549 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!9549 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!9548 () (_ BitVec 64))

(declare-fun lt!9544 () (_ BitVec 64))

(assert (=> b!7132 (= lt!9549 (bvsdiv lt!9548 lt!9544))))

(assert (=> b!7132 (and (not (= lt!9544 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!9548 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!9544 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!7132 (= lt!9544 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!9551 () (_ BitVec 64))

(declare-fun lt!9550 () (_ BitVec 64))

(assert (=> b!7132 (= lt!9548 (bvsub lt!9551 lt!9550))))

(assert (=> b!7132 (or (= (bvand lt!9551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!9550 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!9551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!9551 lt!9550) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7132 (= lt!9550 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!9546 () (_ BitVec 64))

(assert (=> b!7132 (= lt!9551 (bvadd nBits!460 lt!9546))))

(assert (=> b!7132 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!9546 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!9546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7132 (= lt!9546 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!7133 () Bool)

(declare-fun res!7954 () Bool)

(assert (=> b!7133 (=> (not res!7954) (not e!4457))))

(declare-fun lt!9543 () (_ BitVec 64))

(assert (=> b!7133 (= res!7954 (= (bvadd lt!9543 nBits!460) (bitIndex!0 (size!207 (buf!537 (_2!487 lt!9545))) (currentByte!1534 (_2!487 lt!9545)) (currentBit!1529 (_2!487 lt!9545)))))))

(assert (=> b!7133 (or (not (= (bvand lt!9543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!9543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!9543 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7133 (= lt!9543 (bitIndex!0 (size!207 (buf!537 (_1!488 lt!8796))) (currentByte!1534 (_1!488 lt!8796)) (currentBit!1529 (_1!488 lt!8796))))))

(declare-fun b!7134 () Bool)

(declare-fun res!7951 () Bool)

(assert (=> b!7134 (=> (not res!7951) (not e!4457))))

(assert (=> b!7134 (= res!7951 (bvsle (currentByte!1534 (_1!488 lt!8796)) (currentByte!1534 (_2!487 lt!9545))))))

(declare-fun b!7135 () Bool)

(assert (=> b!7135 (= e!4457 (= (byteArrayBitContentToList!0 (_2!487 lt!9545) (_1!487 lt!9545) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!487 lt!9545) (_1!488 lt!8796) nBits!460)))))

(declare-fun d!2208 () Bool)

(assert (=> d!2208 e!4457))

(declare-fun res!7955 () Bool)

(assert (=> d!2208 (=> (not res!7955) (not e!4457))))

(assert (=> d!2208 (= res!7955 (= (buf!537 (_2!487 lt!9545)) (buf!537 (_1!488 lt!8796))))))

(declare-datatypes ((tuple3!54 0))(
  ( (tuple3!55 (_1!495 Unit!536) (_2!495 BitStream!392) (_3!27 array!478)) )
))
(declare-fun lt!9547 () tuple3!54)

(assert (=> d!2208 (= lt!9545 (tuple2!925 (_3!27 lt!9547) (_2!495 lt!9547)))))

(declare-fun readBitsLoop!0 (BitStream!392 (_ BitVec 64) array!478 (_ BitVec 64) (_ BitVec 64)) tuple3!54)

(assert (=> d!2208 (= lt!9547 (readBitsLoop!0 (_1!488 lt!8796) nBits!460 (array!479 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2208 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!2208 (= (readBits!0 (_1!488 lt!8796) nBits!460) lt!9545)))

(declare-fun b!7136 () Bool)

(declare-fun res!7952 () Bool)

(assert (=> b!7136 (=> (not res!7952) (not e!4457))))

(assert (=> b!7136 (= res!7952 (invariant!0 (currentBit!1529 (_2!487 lt!9545)) (currentByte!1534 (_2!487 lt!9545)) (size!207 (buf!537 (_2!487 lt!9545)))))))

(assert (= (and d!2208 res!7955) b!7133))

(assert (= (and b!7133 res!7954) b!7136))

(assert (= (and b!7136 res!7952) b!7132))

(assert (= (and b!7132 res!7953) b!7134))

(assert (= (and b!7134 res!7951) b!7135))

(declare-fun m!9161 () Bool)

(assert (=> b!7133 m!9161))

(declare-fun m!9163 () Bool)

(assert (=> b!7133 m!9163))

(declare-fun m!9165 () Bool)

(assert (=> b!7135 m!9165))

(declare-fun m!9167 () Bool)

(assert (=> b!7135 m!9167))

(declare-fun m!9169 () Bool)

(assert (=> d!2208 m!9169))

(declare-fun m!9173 () Bool)

(assert (=> b!7136 m!9173))

(assert (=> b!6872 d!2208))

(declare-fun b!7162 () Bool)

(declare-fun e!4471 () Bool)

(declare-fun lt!9570 () List!107)

(declare-fun length!16 (List!107) Int)

(assert (=> b!7162 (= e!4471 (> (length!16 lt!9570) 0))))

(declare-fun b!7161 () Bool)

(declare-fun isEmpty!21 (List!107) Bool)

(assert (=> b!7161 (= e!4471 (isEmpty!21 lt!9570))))

(declare-fun d!2224 () Bool)

(assert (=> d!2224 e!4471))

(declare-fun c!387 () Bool)

(assert (=> d!2224 (= c!387 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!936 0))(
  ( (tuple2!937 (_1!496 List!107) (_2!496 BitStream!392)) )
))
(declare-fun e!4470 () tuple2!936)

(assert (=> d!2224 (= lt!9570 (_1!496 e!4470))))

(declare-fun c!388 () Bool)

(assert (=> d!2224 (= c!388 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2224 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2224 (= (bitStreamReadBitsIntoList!0 (_2!486 lt!8799) (_1!488 lt!8796) nBits!460) lt!9570)))

(declare-fun b!7159 () Bool)

(assert (=> b!7159 (= e!4470 (tuple2!937 Nil!104 (_1!488 lt!8796)))))

(declare-datatypes ((tuple2!938 0))(
  ( (tuple2!939 (_1!497 Bool) (_2!497 BitStream!392)) )
))
(declare-fun lt!9571 () tuple2!938)

(declare-fun b!7160 () Bool)

(declare-fun lt!9572 () (_ BitVec 64))

(assert (=> b!7160 (= e!4470 (tuple2!937 (Cons!103 (_1!497 lt!9571) (bitStreamReadBitsIntoList!0 (_2!486 lt!8799) (_2!497 lt!9571) (bvsub nBits!460 lt!9572))) (_2!497 lt!9571)))))

(declare-fun readBit!0 (BitStream!392) tuple2!938)

(assert (=> b!7160 (= lt!9571 (readBit!0 (_1!488 lt!8796)))))

(assert (=> b!7160 (= lt!9572 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!2224 c!388) b!7159))

(assert (= (and d!2224 (not c!388)) b!7160))

(assert (= (and d!2224 c!387) b!7161))

(assert (= (and d!2224 (not c!387)) b!7162))

(declare-fun m!9185 () Bool)

(assert (=> b!7162 m!9185))

(declare-fun m!9187 () Bool)

(assert (=> b!7161 m!9187))

(declare-fun m!9189 () Bool)

(assert (=> b!7160 m!9189))

(declare-fun m!9191 () Bool)

(assert (=> b!7160 m!9191))

(assert (=> b!6872 d!2224))

(declare-fun d!2228 () Bool)

(declare-fun c!389 () Bool)

(assert (=> d!2228 (= c!389 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!4472 () List!107)

(assert (=> d!2228 (= (byteArrayBitContentToList!0 (_2!486 lt!8799) (_1!487 lt!8797) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!4472)))

(declare-fun b!7163 () Bool)

(assert (=> b!7163 (= e!4472 Nil!104)))

(declare-fun b!7164 () Bool)

(assert (=> b!7164 (= e!4472 (Cons!103 (not (= (bvand ((_ sign_extend 24) (select (arr!606 (_1!487 lt!8797)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!486 lt!8799) (_1!487 lt!8797) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2228 c!389) b!7163))

(assert (= (and d!2228 (not c!389)) b!7164))

(assert (=> b!7164 m!8753))

(assert (=> b!7164 m!8755))

(declare-fun m!9193 () Bool)

(assert (=> b!7164 m!9193))

(assert (=> b!6872 d!2228))

(declare-fun d!2230 () Bool)

(assert (=> d!2230 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!207 (buf!537 (_2!486 lt!8799)))) ((_ sign_extend 32) (currentByte!1534 thiss!1486)) ((_ sign_extend 32) (currentBit!1529 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!207 (buf!537 (_2!486 lt!8799)))) ((_ sign_extend 32) (currentByte!1534 thiss!1486)) ((_ sign_extend 32) (currentBit!1529 thiss!1486))) nBits!460))))

(declare-fun bs!768 () Bool)

(assert (= bs!768 d!2230))

(declare-fun m!9197 () Bool)

(assert (=> bs!768 m!9197))

(assert (=> b!6872 d!2230))

(declare-fun d!2232 () Bool)

(assert (=> d!2232 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!207 (buf!537 (_1!488 lt!8796)))) ((_ sign_extend 32) (currentByte!1534 (_1!488 lt!8796))) ((_ sign_extend 32) (currentBit!1529 (_1!488 lt!8796))) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!207 (buf!537 (_1!488 lt!8796)))) ((_ sign_extend 32) (currentByte!1534 (_1!488 lt!8796))) ((_ sign_extend 32) (currentBit!1529 (_1!488 lt!8796)))) nBits!460))))

(declare-fun bs!769 () Bool)

(assert (= bs!769 d!2232))

(declare-fun m!9199 () Bool)

(assert (=> bs!769 m!9199))

(assert (=> b!6870 d!2232))

(push 1)

(assert (not b!7133))

(assert (not b!7011))

(assert (not b!7007))

(assert (not bm!77))

(assert (not b!7067))

(assert (not d!2208))

(assert (not d!2180))

(assert (not b!7068))

(assert (not b!7164))

(assert (not d!2164))

(assert (not d!2156))

(assert (not d!2160))

(assert (not d!2182))

(assert (not b!7013))

(assert (not d!2192))

(assert (not d!2188))

(assert (not b!7161))

(assert (not b!7010))

(assert (not b!6917))

(assert (not b!7012))

(assert (not d!2206))

(assert (not b!7160))

(assert (not b!7066))

(assert (not b!6903))

(assert (not b!6923))

(assert (not d!2232))

(assert (not b!7135))

(assert (not b!7069))

(assert (not b!7136))

(assert (not b!6905))

(assert (not d!2230))

(assert (not b!7162))

(assert (not b!7006))

(check-sat)

(pop 1)

(push 1)

(check-sat)

