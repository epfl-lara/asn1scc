; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6934 () Bool)

(assert start!6934)

(declare-fun b!33658 () Bool)

(declare-fun res!28849 () Bool)

(declare-fun e!22354 () Bool)

(assert (=> b!33658 (=> res!28849 e!22354)))

(declare-datatypes ((List!424 0))(
  ( (Nil!421) (Cons!420 (h!539 Bool) (t!1174 List!424)) )
))
(declare-fun lt!49386 () List!424)

(declare-fun length!150 (List!424) Int)

(assert (=> b!33658 (= res!28849 (<= (length!150 lt!49386) 0))))

(declare-fun b!33659 () Bool)

(declare-fun res!28852 () Bool)

(declare-fun e!22347 () Bool)

(assert (=> b!33659 (=> res!28852 e!22347)))

(declare-datatypes ((array!1870 0))(
  ( (array!1871 (arr!1302 (Array (_ BitVec 32) (_ BitVec 8))) (size!827 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1446 0))(
  ( (BitStream!1447 (buf!1155 array!1870) (currentByte!2522 (_ BitVec 32)) (currentBit!2517 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2509 0))(
  ( (Unit!2510) )
))
(declare-datatypes ((tuple2!3422 0))(
  ( (tuple2!3423 (_1!1798 Unit!2509) (_2!1798 BitStream!1446)) )
))
(declare-fun lt!49392 () tuple2!3422)

(declare-fun lt!49398 () tuple2!3422)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!33659 (= res!28852 (not (invariant!0 (currentBit!2517 (_2!1798 lt!49392)) (currentByte!2522 (_2!1798 lt!49392)) (size!827 (buf!1155 (_2!1798 lt!49398))))))))

(declare-fun e!22355 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!49395 () (_ BitVec 64))

(declare-fun b!33660 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!33660 (= e!22355 (= lt!49395 (bvsub (bvsub (bvadd (bitIndex!0 (size!827 (buf!1155 (_2!1798 lt!49392))) (currentByte!2522 (_2!1798 lt!49392)) (currentBit!2517 (_2!1798 lt!49392))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!28850 () Bool)

(declare-fun e!22352 () Bool)

(assert (=> start!6934 (=> (not res!28850) (not e!22352))))

(declare-fun srcBuffer!2 () array!1870)

(assert (=> start!6934 (= res!28850 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!827 srcBuffer!2))))))))

(assert (=> start!6934 e!22352))

(assert (=> start!6934 true))

(declare-fun array_inv!776 (array!1870) Bool)

(assert (=> start!6934 (array_inv!776 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!1446)

(declare-fun e!22350 () Bool)

(declare-fun inv!12 (BitStream!1446) Bool)

(assert (=> start!6934 (and (inv!12 thiss!1379) e!22350)))

(declare-fun e!22357 () Bool)

(declare-datatypes ((tuple2!3424 0))(
  ( (tuple2!3425 (_1!1799 BitStream!1446) (_2!1799 BitStream!1446)) )
))
(declare-fun lt!49388 () tuple2!3424)

(declare-fun b!33661 () Bool)

(declare-fun head!261 (List!424) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1446 array!1870 (_ BitVec 64) (_ BitVec 64)) List!424)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1446 BitStream!1446 (_ BitVec 64)) List!424)

(assert (=> b!33661 (= e!22357 (= (head!261 (byteArrayBitContentToList!0 (_2!1798 lt!49392) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!261 (bitStreamReadBitsIntoList!0 (_2!1798 lt!49392) (_1!1799 lt!49388) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!33662 () Bool)

(declare-fun res!28863 () Bool)

(declare-fun e!22348 () Bool)

(assert (=> b!33662 (=> res!28863 e!22348)))

(assert (=> b!33662 (= res!28863 (not (= (size!827 (buf!1155 thiss!1379)) (size!827 (buf!1155 (_2!1798 lt!49398))))))))

(declare-fun b!33663 () Bool)

(declare-fun e!22356 () Bool)

(assert (=> b!33663 (= e!22356 e!22348)))

(declare-fun res!28853 () Bool)

(assert (=> b!33663 (=> res!28853 e!22348)))

(declare-fun lt!49390 () (_ BitVec 64))

(assert (=> b!33663 (= res!28853 (not (= lt!49395 (bvsub (bvadd lt!49390 to!314) i!635))))))

(assert (=> b!33663 (= lt!49395 (bitIndex!0 (size!827 (buf!1155 (_2!1798 lt!49398))) (currentByte!2522 (_2!1798 lt!49398)) (currentBit!2517 (_2!1798 lt!49398))))))

(declare-fun b!33664 () Bool)

(assert (=> b!33664 (= e!22348 e!22347)))

(declare-fun res!28859 () Bool)

(assert (=> b!33664 (=> res!28859 e!22347)))

(assert (=> b!33664 (= res!28859 (not (= (size!827 (buf!1155 (_2!1798 lt!49392))) (size!827 (buf!1155 (_2!1798 lt!49398))))))))

(assert (=> b!33664 e!22355))

(declare-fun res!28857 () Bool)

(assert (=> b!33664 (=> (not res!28857) (not e!22355))))

(assert (=> b!33664 (= res!28857 (= (size!827 (buf!1155 (_2!1798 lt!49398))) (size!827 (buf!1155 thiss!1379))))))

(declare-fun b!33665 () Bool)

(declare-fun res!28855 () Bool)

(assert (=> b!33665 (=> res!28855 e!22348)))

(assert (=> b!33665 (= res!28855 (not (invariant!0 (currentBit!2517 (_2!1798 lt!49398)) (currentByte!2522 (_2!1798 lt!49398)) (size!827 (buf!1155 (_2!1798 lt!49398))))))))

(declare-fun b!33666 () Bool)

(declare-fun e!22349 () Bool)

(assert (=> b!33666 (= e!22352 (not e!22349))))

(declare-fun res!28861 () Bool)

(assert (=> b!33666 (=> res!28861 e!22349)))

(assert (=> b!33666 (= res!28861 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1446 BitStream!1446) Bool)

(assert (=> b!33666 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!49394 () Unit!2509)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1446) Unit!2509)

(assert (=> b!33666 (= lt!49394 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!33666 (= lt!49390 (bitIndex!0 (size!827 (buf!1155 thiss!1379)) (currentByte!2522 thiss!1379) (currentBit!2517 thiss!1379)))))

(declare-fun b!33667 () Bool)

(assert (=> b!33667 (= e!22347 e!22354)))

(declare-fun res!28851 () Bool)

(assert (=> b!33667 (=> res!28851 e!22354)))

(assert (=> b!33667 (= res!28851 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!49384 () tuple2!3424)

(declare-fun lt!49385 () (_ BitVec 64))

(declare-fun lt!49397 () List!424)

(assert (=> b!33667 (= lt!49397 (bitStreamReadBitsIntoList!0 (_2!1798 lt!49398) (_1!1799 lt!49384) lt!49385))))

(declare-fun lt!49399 () tuple2!3424)

(assert (=> b!33667 (= lt!49386 (bitStreamReadBitsIntoList!0 (_2!1798 lt!49398) (_1!1799 lt!49399) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!33667 (validate_offset_bits!1 ((_ sign_extend 32) (size!827 (buf!1155 (_2!1798 lt!49398)))) ((_ sign_extend 32) (currentByte!2522 (_2!1798 lt!49392))) ((_ sign_extend 32) (currentBit!2517 (_2!1798 lt!49392))) lt!49385)))

(declare-fun lt!49396 () Unit!2509)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1446 array!1870 (_ BitVec 64)) Unit!2509)

(assert (=> b!33667 (= lt!49396 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1798 lt!49392) (buf!1155 (_2!1798 lt!49398)) lt!49385))))

(declare-fun reader!0 (BitStream!1446 BitStream!1446) tuple2!3424)

(assert (=> b!33667 (= lt!49384 (reader!0 (_2!1798 lt!49392) (_2!1798 lt!49398)))))

(assert (=> b!33667 (validate_offset_bits!1 ((_ sign_extend 32) (size!827 (buf!1155 (_2!1798 lt!49398)))) ((_ sign_extend 32) (currentByte!2522 thiss!1379)) ((_ sign_extend 32) (currentBit!2517 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!49387 () Unit!2509)

(assert (=> b!33667 (= lt!49387 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1155 (_2!1798 lt!49398)) (bvsub to!314 i!635)))))

(assert (=> b!33667 (= lt!49399 (reader!0 thiss!1379 (_2!1798 lt!49398)))))

(declare-fun b!33668 () Bool)

(assert (=> b!33668 (= e!22350 (array_inv!776 (buf!1155 thiss!1379)))))

(declare-fun b!33669 () Bool)

(declare-fun res!28862 () Bool)

(assert (=> b!33669 (=> res!28862 e!22347)))

(assert (=> b!33669 (= res!28862 (not (invariant!0 (currentBit!2517 (_2!1798 lt!49392)) (currentByte!2522 (_2!1798 lt!49392)) (size!827 (buf!1155 (_2!1798 lt!49392))))))))

(declare-fun b!33670 () Bool)

(declare-fun res!28858 () Bool)

(assert (=> b!33670 (=> (not res!28858) (not e!22352))))

(assert (=> b!33670 (= res!28858 (validate_offset_bits!1 ((_ sign_extend 32) (size!827 (buf!1155 thiss!1379))) ((_ sign_extend 32) (currentByte!2522 thiss!1379)) ((_ sign_extend 32) (currentBit!2517 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!33671 () Bool)

(assert (=> b!33671 (= e!22354 true)))

(declare-fun tail!141 (List!424) List!424)

(assert (=> b!33671 (= lt!49397 (tail!141 lt!49386))))

(declare-fun lt!49389 () Unit!2509)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1446 BitStream!1446 BitStream!1446 BitStream!1446 (_ BitVec 64) List!424) Unit!2509)

(assert (=> b!33671 (= lt!49389 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1798 lt!49398) (_2!1798 lt!49398) (_1!1799 lt!49399) (_1!1799 lt!49384) (bvsub to!314 i!635) lt!49386))))

(declare-fun b!33672 () Bool)

(declare-fun e!22346 () Bool)

(assert (=> b!33672 (= e!22346 e!22356)))

(declare-fun res!28860 () Bool)

(assert (=> b!33672 (=> res!28860 e!22356)))

(assert (=> b!33672 (= res!28860 (not (isPrefixOf!0 (_2!1798 lt!49392) (_2!1798 lt!49398))))))

(assert (=> b!33672 (isPrefixOf!0 thiss!1379 (_2!1798 lt!49398))))

(declare-fun lt!49391 () Unit!2509)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1446 BitStream!1446 BitStream!1446) Unit!2509)

(assert (=> b!33672 (= lt!49391 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1798 lt!49392) (_2!1798 lt!49398)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1446 array!1870 (_ BitVec 64) (_ BitVec 64)) tuple2!3422)

(assert (=> b!33672 (= lt!49398 (appendBitsMSBFirstLoop!0 (_2!1798 lt!49392) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!33672 e!22357))

(declare-fun res!28854 () Bool)

(assert (=> b!33672 (=> (not res!28854) (not e!22357))))

(assert (=> b!33672 (= res!28854 (validate_offset_bits!1 ((_ sign_extend 32) (size!827 (buf!1155 (_2!1798 lt!49392)))) ((_ sign_extend 32) (currentByte!2522 thiss!1379)) ((_ sign_extend 32) (currentBit!2517 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49383 () Unit!2509)

(assert (=> b!33672 (= lt!49383 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1155 (_2!1798 lt!49392)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!33672 (= lt!49388 (reader!0 thiss!1379 (_2!1798 lt!49392)))))

(declare-fun b!33673 () Bool)

(assert (=> b!33673 (= e!22349 e!22346)))

(declare-fun res!28856 () Bool)

(assert (=> b!33673 (=> res!28856 e!22346)))

(assert (=> b!33673 (= res!28856 (not (isPrefixOf!0 thiss!1379 (_2!1798 lt!49392))))))

(assert (=> b!33673 (validate_offset_bits!1 ((_ sign_extend 32) (size!827 (buf!1155 (_2!1798 lt!49392)))) ((_ sign_extend 32) (currentByte!2522 (_2!1798 lt!49392))) ((_ sign_extend 32) (currentBit!2517 (_2!1798 lt!49392))) lt!49385)))

(assert (=> b!33673 (= lt!49385 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49393 () Unit!2509)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1446 BitStream!1446 (_ BitVec 64) (_ BitVec 64)) Unit!2509)

(assert (=> b!33673 (= lt!49393 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1798 lt!49392) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1446 (_ BitVec 8) (_ BitVec 32)) tuple2!3422)

(assert (=> b!33673 (= lt!49392 (appendBitFromByte!0 thiss!1379 (select (arr!1302 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!6934 res!28850) b!33670))

(assert (= (and b!33670 res!28858) b!33666))

(assert (= (and b!33666 (not res!28861)) b!33673))

(assert (= (and b!33673 (not res!28856)) b!33672))

(assert (= (and b!33672 res!28854) b!33661))

(assert (= (and b!33672 (not res!28860)) b!33663))

(assert (= (and b!33663 (not res!28853)) b!33665))

(assert (= (and b!33665 (not res!28855)) b!33662))

(assert (= (and b!33662 (not res!28863)) b!33664))

(assert (= (and b!33664 res!28857) b!33660))

(assert (= (and b!33664 (not res!28859)) b!33669))

(assert (= (and b!33669 (not res!28862)) b!33659))

(assert (= (and b!33659 (not res!28852)) b!33667))

(assert (= (and b!33667 (not res!28851)) b!33658))

(assert (= (and b!33658 (not res!28849)) b!33671))

(assert (= start!6934 b!33668))

(declare-fun m!49953 () Bool)

(assert (=> b!33672 m!49953))

(declare-fun m!49955 () Bool)

(assert (=> b!33672 m!49955))

(declare-fun m!49957 () Bool)

(assert (=> b!33672 m!49957))

(declare-fun m!49959 () Bool)

(assert (=> b!33672 m!49959))

(declare-fun m!49961 () Bool)

(assert (=> b!33672 m!49961))

(declare-fun m!49963 () Bool)

(assert (=> b!33672 m!49963))

(declare-fun m!49965 () Bool)

(assert (=> b!33672 m!49965))

(declare-fun m!49967 () Bool)

(assert (=> b!33665 m!49967))

(declare-fun m!49969 () Bool)

(assert (=> b!33663 m!49969))

(declare-fun m!49971 () Bool)

(assert (=> b!33669 m!49971))

(declare-fun m!49973 () Bool)

(assert (=> start!6934 m!49973))

(declare-fun m!49975 () Bool)

(assert (=> start!6934 m!49975))

(declare-fun m!49977 () Bool)

(assert (=> b!33659 m!49977))

(declare-fun m!49979 () Bool)

(assert (=> b!33666 m!49979))

(declare-fun m!49981 () Bool)

(assert (=> b!33666 m!49981))

(declare-fun m!49983 () Bool)

(assert (=> b!33666 m!49983))

(declare-fun m!49985 () Bool)

(assert (=> b!33667 m!49985))

(declare-fun m!49987 () Bool)

(assert (=> b!33667 m!49987))

(declare-fun m!49989 () Bool)

(assert (=> b!33667 m!49989))

(declare-fun m!49991 () Bool)

(assert (=> b!33667 m!49991))

(declare-fun m!49993 () Bool)

(assert (=> b!33667 m!49993))

(declare-fun m!49995 () Bool)

(assert (=> b!33667 m!49995))

(declare-fun m!49997 () Bool)

(assert (=> b!33667 m!49997))

(declare-fun m!49999 () Bool)

(assert (=> b!33667 m!49999))

(declare-fun m!50001 () Bool)

(assert (=> b!33670 m!50001))

(declare-fun m!50003 () Bool)

(assert (=> b!33673 m!50003))

(declare-fun m!50005 () Bool)

(assert (=> b!33673 m!50005))

(declare-fun m!50007 () Bool)

(assert (=> b!33673 m!50007))

(declare-fun m!50009 () Bool)

(assert (=> b!33673 m!50009))

(assert (=> b!33673 m!50007))

(declare-fun m!50011 () Bool)

(assert (=> b!33673 m!50011))

(declare-fun m!50013 () Bool)

(assert (=> b!33661 m!50013))

(assert (=> b!33661 m!50013))

(declare-fun m!50015 () Bool)

(assert (=> b!33661 m!50015))

(declare-fun m!50017 () Bool)

(assert (=> b!33661 m!50017))

(assert (=> b!33661 m!50017))

(declare-fun m!50019 () Bool)

(assert (=> b!33661 m!50019))

(declare-fun m!50021 () Bool)

(assert (=> b!33658 m!50021))

(declare-fun m!50023 () Bool)

(assert (=> b!33660 m!50023))

(declare-fun m!50025 () Bool)

(assert (=> b!33671 m!50025))

(declare-fun m!50027 () Bool)

(assert (=> b!33671 m!50027))

(declare-fun m!50029 () Bool)

(assert (=> b!33668 m!50029))

(check-sat (not b!33659) (not b!33668) (not b!33665) (not b!33672) (not b!33666) (not b!33670) (not b!33658) (not b!33673) (not b!33667) (not b!33663) (not b!33669) (not b!33671) (not start!6934) (not b!33661) (not b!33660))
