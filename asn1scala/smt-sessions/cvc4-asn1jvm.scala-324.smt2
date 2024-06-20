; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6942 () Bool)

(assert start!6942)

(declare-fun b!33882 () Bool)

(declare-fun e!22523 () Bool)

(declare-fun e!22521 () Bool)

(assert (=> b!33882 (= e!22523 e!22521)))

(declare-fun res!29064 () Bool)

(assert (=> b!33882 (=> res!29064 e!22521)))

(declare-datatypes ((array!1878 0))(
  ( (array!1879 (arr!1306 (Array (_ BitVec 32) (_ BitVec 8))) (size!831 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1878)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((BitStream!1454 0))(
  ( (BitStream!1455 (buf!1159 array!1878) (currentByte!2526 (_ BitVec 32)) (currentBit!2521 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2517 0))(
  ( (Unit!2518) )
))
(declare-datatypes ((tuple2!3438 0))(
  ( (tuple2!3439 (_1!1806 Unit!2517) (_2!1806 BitStream!1454)) )
))
(declare-fun lt!49645 () tuple2!3438)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!49657 () Bool)

(declare-datatypes ((List!428 0))(
  ( (Nil!425) (Cons!424 (h!543 Bool) (t!1178 List!428)) )
))
(declare-fun head!265 (List!428) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1454 array!1878 (_ BitVec 64) (_ BitVec 64)) List!428)

(assert (=> b!33882 (= res!29064 (not (= (head!265 (byteArrayBitContentToList!0 (_2!1806 lt!49645) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!49657)))))

(declare-fun bitAt!0 (array!1878 (_ BitVec 64)) Bool)

(assert (=> b!33882 (= lt!49657 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!33883 () Bool)

(declare-fun e!22518 () Bool)

(declare-fun e!22519 () Bool)

(assert (=> b!33883 (= e!22518 e!22519)))

(declare-fun res!29063 () Bool)

(assert (=> b!33883 (=> res!29063 e!22519)))

(declare-fun lt!49641 () tuple2!3438)

(assert (=> b!33883 (= res!29063 (not (= (size!831 (buf!1159 (_2!1806 lt!49641))) (size!831 (buf!1159 (_2!1806 lt!49645))))))))

(declare-fun lt!49638 () (_ BitVec 64))

(declare-fun lt!49640 () (_ BitVec 64))

(assert (=> b!33883 (= lt!49638 (bvsub (bvsub (bvadd lt!49640 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!33883 (= lt!49640 (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!49641))) (currentByte!2526 (_2!1806 lt!49641)) (currentBit!2521 (_2!1806 lt!49641))))))

(declare-fun thiss!1379 () BitStream!1454)

(assert (=> b!33883 (= (size!831 (buf!1159 (_2!1806 lt!49645))) (size!831 (buf!1159 thiss!1379)))))

(declare-fun b!33884 () Bool)

(declare-fun e!22515 () Bool)

(assert (=> b!33884 (= e!22515 e!22518)))

(declare-fun res!29069 () Bool)

(assert (=> b!33884 (=> res!29069 e!22518)))

(declare-fun lt!49654 () (_ BitVec 64))

(assert (=> b!33884 (= res!29069 (not (= lt!49638 (bvsub (bvadd lt!49654 to!314) i!635))))))

(assert (=> b!33884 (= lt!49638 (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!49645))) (currentByte!2526 (_2!1806 lt!49645)) (currentBit!2521 (_2!1806 lt!49645))))))

(declare-fun b!33885 () Bool)

(declare-fun e!22516 () Bool)

(assert (=> b!33885 (= e!22519 e!22516)))

(declare-fun res!29061 () Bool)

(assert (=> b!33885 (=> res!29061 e!22516)))

(assert (=> b!33885 (= res!29061 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!49637 () (_ BitVec 64))

(declare-fun lt!49651 () List!428)

(declare-datatypes ((tuple2!3440 0))(
  ( (tuple2!3441 (_1!1807 BitStream!1454) (_2!1807 BitStream!1454)) )
))
(declare-fun lt!49650 () tuple2!3440)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1454 BitStream!1454 (_ BitVec 64)) List!428)

(assert (=> b!33885 (= lt!49651 (bitStreamReadBitsIntoList!0 (_2!1806 lt!49645) (_1!1807 lt!49650) lt!49637))))

(declare-fun lt!49644 () List!428)

(declare-fun lt!49655 () tuple2!3440)

(assert (=> b!33885 (= lt!49644 (bitStreamReadBitsIntoList!0 (_2!1806 lt!49645) (_1!1807 lt!49655) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!33885 (validate_offset_bits!1 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49645)))) ((_ sign_extend 32) (currentByte!2526 (_2!1806 lt!49641))) ((_ sign_extend 32) (currentBit!2521 (_2!1806 lt!49641))) lt!49637)))

(declare-fun lt!49643 () Unit!2517)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1454 array!1878 (_ BitVec 64)) Unit!2517)

(assert (=> b!33885 (= lt!49643 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1806 lt!49641) (buf!1159 (_2!1806 lt!49645)) lt!49637))))

(declare-fun reader!0 (BitStream!1454 BitStream!1454) tuple2!3440)

(assert (=> b!33885 (= lt!49650 (reader!0 (_2!1806 lt!49641) (_2!1806 lt!49645)))))

(assert (=> b!33885 (validate_offset_bits!1 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49645)))) ((_ sign_extend 32) (currentByte!2526 thiss!1379)) ((_ sign_extend 32) (currentBit!2521 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!49656 () Unit!2517)

(assert (=> b!33885 (= lt!49656 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1159 (_2!1806 lt!49645)) (bvsub to!314 i!635)))))

(assert (=> b!33885 (= lt!49655 (reader!0 thiss!1379 (_2!1806 lt!49645)))))

(declare-fun b!33886 () Bool)

(declare-fun e!22526 () Bool)

(assert (=> b!33886 (= e!22526 e!22515)))

(declare-fun res!29068 () Bool)

(assert (=> b!33886 (=> res!29068 e!22515)))

(declare-fun isPrefixOf!0 (BitStream!1454 BitStream!1454) Bool)

(assert (=> b!33886 (= res!29068 (not (isPrefixOf!0 (_2!1806 lt!49641) (_2!1806 lt!49645))))))

(assert (=> b!33886 (isPrefixOf!0 thiss!1379 (_2!1806 lt!49645))))

(declare-fun lt!49646 () Unit!2517)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1454 BitStream!1454 BitStream!1454) Unit!2517)

(assert (=> b!33886 (= lt!49646 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1806 lt!49641) (_2!1806 lt!49645)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1454 array!1878 (_ BitVec 64) (_ BitVec 64)) tuple2!3438)

(assert (=> b!33886 (= lt!49645 (appendBitsMSBFirstLoop!0 (_2!1806 lt!49641) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!22528 () Bool)

(assert (=> b!33886 e!22528))

(declare-fun res!29071 () Bool)

(assert (=> b!33886 (=> (not res!29071) (not e!22528))))

(assert (=> b!33886 (= res!29071 (validate_offset_bits!1 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49641)))) ((_ sign_extend 32) (currentByte!2526 thiss!1379)) ((_ sign_extend 32) (currentBit!2521 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49648 () Unit!2517)

(assert (=> b!33886 (= lt!49648 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1159 (_2!1806 lt!49641)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49647 () tuple2!3440)

(assert (=> b!33886 (= lt!49647 (reader!0 thiss!1379 (_2!1806 lt!49641)))))

(declare-fun b!33887 () Bool)

(assert (=> b!33887 (= e!22528 (= (head!265 (byteArrayBitContentToList!0 (_2!1806 lt!49641) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!265 (bitStreamReadBitsIntoList!0 (_2!1806 lt!49641) (_1!1807 lt!49647) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!33888 () Bool)

(declare-fun res!29067 () Bool)

(assert (=> b!33888 (=> res!29067 e!22516)))

(declare-fun length!154 (List!428) Int)

(assert (=> b!33888 (= res!29067 (<= (length!154 lt!49644) 0))))

(declare-fun res!29077 () Bool)

(declare-fun e!22517 () Bool)

(assert (=> start!6942 (=> (not res!29077) (not e!22517))))

(assert (=> start!6942 (= res!29077 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!831 srcBuffer!2))))))))

(assert (=> start!6942 e!22517))

(assert (=> start!6942 true))

(declare-fun array_inv!780 (array!1878) Bool)

(assert (=> start!6942 (array_inv!780 srcBuffer!2)))

(declare-fun e!22522 () Bool)

(declare-fun inv!12 (BitStream!1454) Bool)

(assert (=> start!6942 (and (inv!12 thiss!1379) e!22522)))

(declare-fun b!33889 () Bool)

(declare-fun res!29070 () Bool)

(assert (=> b!33889 (=> res!29070 e!22519)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!33889 (= res!29070 (not (invariant!0 (currentBit!2521 (_2!1806 lt!49641)) (currentByte!2526 (_2!1806 lt!49641)) (size!831 (buf!1159 (_2!1806 lt!49645))))))))

(declare-fun b!33890 () Bool)

(assert (=> b!33890 (= e!22522 (array_inv!780 (buf!1159 thiss!1379)))))

(declare-fun b!33891 () Bool)

(declare-fun e!22514 () Bool)

(assert (=> b!33891 (= e!22516 e!22514)))

(declare-fun res!29075 () Bool)

(assert (=> b!33891 (=> res!29075 e!22514)))

(declare-fun lt!49636 () List!428)

(assert (=> b!33891 (= res!29075 (not (= lt!49636 lt!49651)))))

(assert (=> b!33891 (= lt!49651 lt!49636)))

(declare-fun tail!145 (List!428) List!428)

(assert (=> b!33891 (= lt!49636 (tail!145 lt!49644))))

(declare-fun lt!49639 () Unit!2517)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1454 BitStream!1454 BitStream!1454 BitStream!1454 (_ BitVec 64) List!428) Unit!2517)

(assert (=> b!33891 (= lt!49639 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1806 lt!49645) (_2!1806 lt!49645) (_1!1807 lt!49655) (_1!1807 lt!49650) (bvsub to!314 i!635) lt!49644))))

(declare-fun b!33892 () Bool)

(declare-fun res!29079 () Bool)

(assert (=> b!33892 (=> (not res!29079) (not e!22517))))

(assert (=> b!33892 (= res!29079 (validate_offset_bits!1 ((_ sign_extend 32) (size!831 (buf!1159 thiss!1379))) ((_ sign_extend 32) (currentByte!2526 thiss!1379)) ((_ sign_extend 32) (currentBit!2521 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!33893 () Bool)

(declare-fun res!29066 () Bool)

(assert (=> b!33893 (=> res!29066 e!22523)))

(declare-fun lt!49653 () Bool)

(assert (=> b!33893 (= res!29066 (not (= (head!265 lt!49644) lt!49653)))))

(declare-fun b!33894 () Bool)

(declare-fun e!22520 () Bool)

(assert (=> b!33894 (= e!22520 e!22526)))

(declare-fun res!29065 () Bool)

(assert (=> b!33894 (=> res!29065 e!22526)))

(assert (=> b!33894 (= res!29065 (not (isPrefixOf!0 thiss!1379 (_2!1806 lt!49641))))))

(assert (=> b!33894 (validate_offset_bits!1 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49641)))) ((_ sign_extend 32) (currentByte!2526 (_2!1806 lt!49641))) ((_ sign_extend 32) (currentBit!2521 (_2!1806 lt!49641))) lt!49637)))

(assert (=> b!33894 (= lt!49637 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49649 () Unit!2517)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1454 BitStream!1454 (_ BitVec 64) (_ BitVec 64)) Unit!2517)

(assert (=> b!33894 (= lt!49649 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1806 lt!49641) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1454 (_ BitVec 8) (_ BitVec 32)) tuple2!3438)

(assert (=> b!33894 (= lt!49641 (appendBitFromByte!0 thiss!1379 (select (arr!1306 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!33895 () Bool)

(declare-fun res!29072 () Bool)

(assert (=> b!33895 (=> res!29072 e!22518)))

(assert (=> b!33895 (= res!29072 (not (invariant!0 (currentBit!2521 (_2!1806 lt!49645)) (currentByte!2526 (_2!1806 lt!49645)) (size!831 (buf!1159 (_2!1806 lt!49645))))))))

(declare-fun b!33896 () Bool)

(assert (=> b!33896 (= e!22514 e!22523)))

(declare-fun res!29078 () Bool)

(assert (=> b!33896 (=> res!29078 e!22523)))

(assert (=> b!33896 (= res!29078 (not (= lt!49653 (bitAt!0 (buf!1159 (_1!1807 lt!49650)) lt!49654))))))

(assert (=> b!33896 (= lt!49653 (bitAt!0 (buf!1159 (_1!1807 lt!49655)) lt!49654))))

(declare-fun b!33897 () Bool)

(declare-fun e!22527 () Bool)

(assert (=> b!33897 (= e!22527 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!49654) (bvslt lt!49654 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49641))))))))))

(declare-fun lt!49642 () Bool)

(assert (=> b!33897 (= lt!49642 (bitAt!0 (buf!1159 (_2!1806 lt!49645)) lt!49654))))

(declare-fun lt!49652 () Unit!2517)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1878 array!1878 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2517)

(assert (=> b!33897 (= lt!49652 (arrayBitRangesEqImpliesEq!0 (buf!1159 (_2!1806 lt!49641)) (buf!1159 (_2!1806 lt!49645)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!49654 lt!49640))))

(declare-fun b!33898 () Bool)

(assert (=> b!33898 (= e!22517 (not e!22520))))

(declare-fun res!29062 () Bool)

(assert (=> b!33898 (=> res!29062 e!22520)))

(assert (=> b!33898 (= res!29062 (bvsge i!635 to!314))))

(assert (=> b!33898 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!49635 () Unit!2517)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1454) Unit!2517)

(assert (=> b!33898 (= lt!49635 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!33898 (= lt!49654 (bitIndex!0 (size!831 (buf!1159 thiss!1379)) (currentByte!2526 thiss!1379) (currentBit!2521 thiss!1379)))))

(declare-fun b!33899 () Bool)

(declare-fun res!29076 () Bool)

(assert (=> b!33899 (=> res!29076 e!22518)))

(assert (=> b!33899 (= res!29076 (not (= (size!831 (buf!1159 thiss!1379)) (size!831 (buf!1159 (_2!1806 lt!49645))))))))

(declare-fun b!33900 () Bool)

(declare-fun res!29073 () Bool)

(assert (=> b!33900 (=> res!29073 e!22519)))

(assert (=> b!33900 (= res!29073 (not (invariant!0 (currentBit!2521 (_2!1806 lt!49641)) (currentByte!2526 (_2!1806 lt!49641)) (size!831 (buf!1159 (_2!1806 lt!49641))))))))

(declare-fun b!33901 () Bool)

(assert (=> b!33901 (= e!22521 e!22527)))

(declare-fun res!29074 () Bool)

(assert (=> b!33901 (=> res!29074 e!22527)))

(assert (=> b!33901 (= res!29074 (not (= lt!49642 lt!49657)))))

(assert (=> b!33901 (= lt!49642 (bitAt!0 (buf!1159 (_2!1806 lt!49641)) lt!49654))))

(assert (= (and start!6942 res!29077) b!33892))

(assert (= (and b!33892 res!29079) b!33898))

(assert (= (and b!33898 (not res!29062)) b!33894))

(assert (= (and b!33894 (not res!29065)) b!33886))

(assert (= (and b!33886 res!29071) b!33887))

(assert (= (and b!33886 (not res!29068)) b!33884))

(assert (= (and b!33884 (not res!29069)) b!33895))

(assert (= (and b!33895 (not res!29072)) b!33899))

(assert (= (and b!33899 (not res!29076)) b!33883))

(assert (= (and b!33883 (not res!29063)) b!33900))

(assert (= (and b!33900 (not res!29073)) b!33889))

(assert (= (and b!33889 (not res!29070)) b!33885))

(assert (= (and b!33885 (not res!29061)) b!33888))

(assert (= (and b!33888 (not res!29067)) b!33891))

(assert (= (and b!33891 (not res!29075)) b!33896))

(assert (= (and b!33896 (not res!29078)) b!33893))

(assert (= (and b!33893 (not res!29066)) b!33882))

(assert (= (and b!33882 (not res!29064)) b!33901))

(assert (= (and b!33901 (not res!29074)) b!33897))

(assert (= start!6942 b!33890))

(declare-fun m!50301 () Bool)

(assert (=> b!33893 m!50301))

(declare-fun m!50303 () Bool)

(assert (=> b!33889 m!50303))

(declare-fun m!50305 () Bool)

(assert (=> b!33897 m!50305))

(declare-fun m!50307 () Bool)

(assert (=> b!33897 m!50307))

(declare-fun m!50309 () Bool)

(assert (=> b!33900 m!50309))

(declare-fun m!50311 () Bool)

(assert (=> b!33895 m!50311))

(declare-fun m!50313 () Bool)

(assert (=> b!33885 m!50313))

(declare-fun m!50315 () Bool)

(assert (=> b!33885 m!50315))

(declare-fun m!50317 () Bool)

(assert (=> b!33885 m!50317))

(declare-fun m!50319 () Bool)

(assert (=> b!33885 m!50319))

(declare-fun m!50321 () Bool)

(assert (=> b!33885 m!50321))

(declare-fun m!50323 () Bool)

(assert (=> b!33885 m!50323))

(declare-fun m!50325 () Bool)

(assert (=> b!33885 m!50325))

(declare-fun m!50327 () Bool)

(assert (=> b!33885 m!50327))

(declare-fun m!50329 () Bool)

(assert (=> b!33886 m!50329))

(declare-fun m!50331 () Bool)

(assert (=> b!33886 m!50331))

(declare-fun m!50333 () Bool)

(assert (=> b!33886 m!50333))

(declare-fun m!50335 () Bool)

(assert (=> b!33886 m!50335))

(declare-fun m!50337 () Bool)

(assert (=> b!33886 m!50337))

(declare-fun m!50339 () Bool)

(assert (=> b!33886 m!50339))

(declare-fun m!50341 () Bool)

(assert (=> b!33886 m!50341))

(declare-fun m!50343 () Bool)

(assert (=> b!33892 m!50343))

(declare-fun m!50345 () Bool)

(assert (=> b!33890 m!50345))

(declare-fun m!50347 () Bool)

(assert (=> b!33883 m!50347))

(declare-fun m!50349 () Bool)

(assert (=> b!33882 m!50349))

(assert (=> b!33882 m!50349))

(declare-fun m!50351 () Bool)

(assert (=> b!33882 m!50351))

(declare-fun m!50353 () Bool)

(assert (=> b!33882 m!50353))

(declare-fun m!50355 () Bool)

(assert (=> start!6942 m!50355))

(declare-fun m!50357 () Bool)

(assert (=> start!6942 m!50357))

(declare-fun m!50359 () Bool)

(assert (=> b!33888 m!50359))

(declare-fun m!50361 () Bool)

(assert (=> b!33891 m!50361))

(declare-fun m!50363 () Bool)

(assert (=> b!33891 m!50363))

(declare-fun m!50365 () Bool)

(assert (=> b!33901 m!50365))

(declare-fun m!50367 () Bool)

(assert (=> b!33898 m!50367))

(declare-fun m!50369 () Bool)

(assert (=> b!33898 m!50369))

(declare-fun m!50371 () Bool)

(assert (=> b!33898 m!50371))

(declare-fun m!50373 () Bool)

(assert (=> b!33887 m!50373))

(assert (=> b!33887 m!50373))

(declare-fun m!50375 () Bool)

(assert (=> b!33887 m!50375))

(declare-fun m!50377 () Bool)

(assert (=> b!33887 m!50377))

(assert (=> b!33887 m!50377))

(declare-fun m!50379 () Bool)

(assert (=> b!33887 m!50379))

(declare-fun m!50381 () Bool)

(assert (=> b!33894 m!50381))

(declare-fun m!50383 () Bool)

(assert (=> b!33894 m!50383))

(declare-fun m!50385 () Bool)

(assert (=> b!33894 m!50385))

(declare-fun m!50387 () Bool)

(assert (=> b!33894 m!50387))

(assert (=> b!33894 m!50381))

(declare-fun m!50389 () Bool)

(assert (=> b!33894 m!50389))

(declare-fun m!50391 () Bool)

(assert (=> b!33896 m!50391))

(declare-fun m!50393 () Bool)

(assert (=> b!33896 m!50393))

(declare-fun m!50395 () Bool)

(assert (=> b!33884 m!50395))

(push 1)

(assert (not b!33891))

(assert (not b!33893))

(assert (not b!33901))

(assert (not b!33897))

(assert (not b!33884))

(assert (not b!33895))

(assert (not b!33892))

(assert (not b!33886))

(assert (not b!33885))

(assert (not b!33890))

(assert (not b!33887))

(assert (not b!33883))

(assert (not b!33882))

(assert (not b!33900))

(assert (not b!33888))

(assert (not start!6942))

(assert (not b!33898))

(assert (not b!33896))

(assert (not b!33894))

(assert (not b!33889))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9638 () Bool)

(assert (=> d!9638 (= (array_inv!780 (buf!1159 thiss!1379)) (bvsge (size!831 (buf!1159 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!33890 d!9638))

(declare-fun d!9640 () Bool)

(assert (=> d!9640 (= (bitAt!0 (buf!1159 (_2!1806 lt!49641)) lt!49654) (not (= (bvand ((_ sign_extend 24) (select (arr!1306 (buf!1159 (_2!1806 lt!49641))) ((_ extract 31 0) (bvsdiv lt!49654 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!49654 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2649 () Bool)

(assert (= bs!2649 d!9640))

(declare-fun m!50429 () Bool)

(assert (=> bs!2649 m!50429))

(declare-fun m!50431 () Bool)

(assert (=> bs!2649 m!50431))

(assert (=> b!33901 d!9640))

(declare-fun d!9642 () Bool)

(assert (=> d!9642 (= (invariant!0 (currentBit!2521 (_2!1806 lt!49641)) (currentByte!2526 (_2!1806 lt!49641)) (size!831 (buf!1159 (_2!1806 lt!49645)))) (and (bvsge (currentBit!2521 (_2!1806 lt!49641)) #b00000000000000000000000000000000) (bvslt (currentBit!2521 (_2!1806 lt!49641)) #b00000000000000000000000000001000) (bvsge (currentByte!2526 (_2!1806 lt!49641)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2526 (_2!1806 lt!49641)) (size!831 (buf!1159 (_2!1806 lt!49645)))) (and (= (currentBit!2521 (_2!1806 lt!49641)) #b00000000000000000000000000000000) (= (currentByte!2526 (_2!1806 lt!49641)) (size!831 (buf!1159 (_2!1806 lt!49645))))))))))

(assert (=> b!33889 d!9642))

(declare-fun d!9644 () Bool)

(assert (=> d!9644 (= (invariant!0 (currentBit!2521 (_2!1806 lt!49641)) (currentByte!2526 (_2!1806 lt!49641)) (size!831 (buf!1159 (_2!1806 lt!49641)))) (and (bvsge (currentBit!2521 (_2!1806 lt!49641)) #b00000000000000000000000000000000) (bvslt (currentBit!2521 (_2!1806 lt!49641)) #b00000000000000000000000000001000) (bvsge (currentByte!2526 (_2!1806 lt!49641)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2526 (_2!1806 lt!49641)) (size!831 (buf!1159 (_2!1806 lt!49641)))) (and (= (currentBit!2521 (_2!1806 lt!49641)) #b00000000000000000000000000000000) (= (currentByte!2526 (_2!1806 lt!49641)) (size!831 (buf!1159 (_2!1806 lt!49641))))))))))

(assert (=> b!33900 d!9644))

(declare-fun d!9646 () Bool)

(assert (=> d!9646 (= (head!265 (byteArrayBitContentToList!0 (_2!1806 lt!49641) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!543 (byteArrayBitContentToList!0 (_2!1806 lt!49641) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!33887 d!9646))

(declare-fun d!9650 () Bool)

(declare-fun c!2226 () Bool)

(assert (=> d!9650 (= c!2226 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22546 () List!428)

(assert (=> d!9650 (= (byteArrayBitContentToList!0 (_2!1806 lt!49641) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!22546)))

(declare-fun b!33929 () Bool)

(assert (=> b!33929 (= e!22546 Nil!425)))

(declare-fun b!33930 () Bool)

(assert (=> b!33930 (= e!22546 (Cons!424 (not (= (bvand ((_ sign_extend 24) (select (arr!1306 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1806 lt!49641) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!9650 c!2226) b!33929))

(assert (= (and d!9650 (not c!2226)) b!33930))

(assert (=> b!33930 m!50381))

(declare-fun m!50437 () Bool)

(assert (=> b!33930 m!50437))

(declare-fun m!50439 () Bool)

(assert (=> b!33930 m!50439))

(assert (=> b!33887 d!9650))

(declare-fun d!9660 () Bool)

(assert (=> d!9660 (= (head!265 (bitStreamReadBitsIntoList!0 (_2!1806 lt!49641) (_1!1807 lt!49647) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!543 (bitStreamReadBitsIntoList!0 (_2!1806 lt!49641) (_1!1807 lt!49647) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!33887 d!9660))

(declare-fun b!33945 () Bool)

(declare-datatypes ((tuple2!3450 0))(
  ( (tuple2!3451 (_1!1812 List!428) (_2!1812 BitStream!1454)) )
))
(declare-fun e!22554 () tuple2!3450)

(assert (=> b!33945 (= e!22554 (tuple2!3451 Nil!425 (_1!1807 lt!49647)))))

(declare-fun b!33947 () Bool)

(declare-fun e!22555 () Bool)

(declare-fun lt!49705 () List!428)

(declare-fun isEmpty!91 (List!428) Bool)

(assert (=> b!33947 (= e!22555 (isEmpty!91 lt!49705))))

(declare-fun d!9662 () Bool)

(assert (=> d!9662 e!22555))

(declare-fun c!2235 () Bool)

(assert (=> d!9662 (= c!2235 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9662 (= lt!49705 (_1!1812 e!22554))))

(declare-fun c!2234 () Bool)

(assert (=> d!9662 (= c!2234 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9662 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9662 (= (bitStreamReadBitsIntoList!0 (_2!1806 lt!49641) (_1!1807 lt!49647) #b0000000000000000000000000000000000000000000000000000000000000001) lt!49705)))

(declare-fun b!33946 () Bool)

(declare-datatypes ((tuple2!3452 0))(
  ( (tuple2!3453 (_1!1813 Bool) (_2!1813 BitStream!1454)) )
))
(declare-fun lt!49703 () tuple2!3452)

(declare-fun lt!49704 () (_ BitVec 64))

(assert (=> b!33946 (= e!22554 (tuple2!3451 (Cons!424 (_1!1813 lt!49703) (bitStreamReadBitsIntoList!0 (_2!1806 lt!49641) (_2!1813 lt!49703) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!49704))) (_2!1813 lt!49703)))))

(declare-fun readBit!0 (BitStream!1454) tuple2!3452)

(assert (=> b!33946 (= lt!49703 (readBit!0 (_1!1807 lt!49647)))))

(assert (=> b!33946 (= lt!49704 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!33948 () Bool)

(assert (=> b!33948 (= e!22555 (> (length!154 lt!49705) 0))))

(assert (= (and d!9662 c!2234) b!33945))

(assert (= (and d!9662 (not c!2234)) b!33946))

(assert (= (and d!9662 c!2235) b!33947))

(assert (= (and d!9662 (not c!2235)) b!33948))

(declare-fun m!50445 () Bool)

(assert (=> b!33947 m!50445))

(declare-fun m!50447 () Bool)

(assert (=> b!33946 m!50447))

(declare-fun m!50449 () Bool)

(assert (=> b!33946 m!50449))

(declare-fun m!50451 () Bool)

(assert (=> b!33948 m!50451))

(assert (=> b!33887 d!9662))

(declare-fun d!9668 () Bool)

(declare-fun res!29111 () Bool)

(declare-fun e!22560 () Bool)

(assert (=> d!9668 (=> (not res!29111) (not e!22560))))

(assert (=> d!9668 (= res!29111 (= (size!831 (buf!1159 thiss!1379)) (size!831 (buf!1159 thiss!1379))))))

(assert (=> d!9668 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!22560)))

(declare-fun b!33955 () Bool)

(declare-fun res!29110 () Bool)

(assert (=> b!33955 (=> (not res!29110) (not e!22560))))

(assert (=> b!33955 (= res!29110 (bvsle (bitIndex!0 (size!831 (buf!1159 thiss!1379)) (currentByte!2526 thiss!1379) (currentBit!2521 thiss!1379)) (bitIndex!0 (size!831 (buf!1159 thiss!1379)) (currentByte!2526 thiss!1379) (currentBit!2521 thiss!1379))))))

(declare-fun b!33956 () Bool)

(declare-fun e!22561 () Bool)

(assert (=> b!33956 (= e!22560 e!22561)))

(declare-fun res!29109 () Bool)

(assert (=> b!33956 (=> res!29109 e!22561)))

(assert (=> b!33956 (= res!29109 (= (size!831 (buf!1159 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!33957 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1878 array!1878 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!33957 (= e!22561 (arrayBitRangesEq!0 (buf!1159 thiss!1379) (buf!1159 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!831 (buf!1159 thiss!1379)) (currentByte!2526 thiss!1379) (currentBit!2521 thiss!1379))))))

(assert (= (and d!9668 res!29111) b!33955))

(assert (= (and b!33955 res!29110) b!33956))

(assert (= (and b!33956 (not res!29109)) b!33957))

(assert (=> b!33955 m!50371))

(assert (=> b!33955 m!50371))

(assert (=> b!33957 m!50371))

(assert (=> b!33957 m!50371))

(declare-fun m!50453 () Bool)

(assert (=> b!33957 m!50453))

(assert (=> b!33898 d!9668))

(declare-fun d!9670 () Bool)

(assert (=> d!9670 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!49714 () Unit!2517)

(declare-fun choose!11 (BitStream!1454) Unit!2517)

(assert (=> d!9670 (= lt!49714 (choose!11 thiss!1379))))

(assert (=> d!9670 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!49714)))

(declare-fun bs!2651 () Bool)

(assert (= bs!2651 d!9670))

(assert (=> bs!2651 m!50367))

(declare-fun m!50455 () Bool)

(assert (=> bs!2651 m!50455))

(assert (=> b!33898 d!9670))

(declare-fun d!9672 () Bool)

(declare-fun e!22571 () Bool)

(assert (=> d!9672 e!22571))

(declare-fun res!29117 () Bool)

(assert (=> d!9672 (=> (not res!29117) (not e!22571))))

(declare-fun lt!49733 () (_ BitVec 64))

(declare-fun lt!49736 () (_ BitVec 64))

(declare-fun lt!49734 () (_ BitVec 64))

(assert (=> d!9672 (= res!29117 (= lt!49733 (bvsub lt!49734 lt!49736)))))

(assert (=> d!9672 (or (= (bvand lt!49734 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!49736 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!49734 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!49734 lt!49736) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!9672 (= lt!49736 (remainingBits!0 ((_ sign_extend 32) (size!831 (buf!1159 thiss!1379))) ((_ sign_extend 32) (currentByte!2526 thiss!1379)) ((_ sign_extend 32) (currentBit!2521 thiss!1379))))))

(declare-fun lt!49737 () (_ BitVec 64))

(declare-fun lt!49738 () (_ BitVec 64))

(assert (=> d!9672 (= lt!49734 (bvmul lt!49737 lt!49738))))

(assert (=> d!9672 (or (= lt!49737 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!49738 (bvsdiv (bvmul lt!49737 lt!49738) lt!49737)))))

(assert (=> d!9672 (= lt!49738 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9672 (= lt!49737 ((_ sign_extend 32) (size!831 (buf!1159 thiss!1379))))))

(assert (=> d!9672 (= lt!49733 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2526 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2521 thiss!1379))))))

(assert (=> d!9672 (invariant!0 (currentBit!2521 thiss!1379) (currentByte!2526 thiss!1379) (size!831 (buf!1159 thiss!1379)))))

(assert (=> d!9672 (= (bitIndex!0 (size!831 (buf!1159 thiss!1379)) (currentByte!2526 thiss!1379) (currentBit!2521 thiss!1379)) lt!49733)))

(declare-fun b!33976 () Bool)

(declare-fun res!29116 () Bool)

(assert (=> b!33976 (=> (not res!29116) (not e!22571))))

(assert (=> b!33976 (= res!29116 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!49733))))

(declare-fun b!33977 () Bool)

(declare-fun lt!49735 () (_ BitVec 64))

(assert (=> b!33977 (= e!22571 (bvsle lt!49733 (bvmul lt!49735 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!33977 (or (= lt!49735 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!49735 #b0000000000000000000000000000000000000000000000000000000000001000) lt!49735)))))

(assert (=> b!33977 (= lt!49735 ((_ sign_extend 32) (size!831 (buf!1159 thiss!1379))))))

(assert (= (and d!9672 res!29117) b!33976))

(assert (= (and b!33976 res!29116) b!33977))

(declare-fun m!50475 () Bool)

(assert (=> d!9672 m!50475))

(declare-fun m!50477 () Bool)

(assert (=> d!9672 m!50477))

(assert (=> b!33898 d!9672))

(declare-fun d!9690 () Bool)

(declare-fun size!833 (List!428) Int)

(assert (=> d!9690 (= (length!154 lt!49644) (size!833 lt!49644))))

(declare-fun bs!2657 () Bool)

(assert (= bs!2657 d!9690))

(declare-fun m!50479 () Bool)

(assert (=> bs!2657 m!50479))

(assert (=> b!33888 d!9690))

(declare-fun d!9692 () Bool)

(declare-fun res!29126 () Bool)

(declare-fun e!22576 () Bool)

(assert (=> d!9692 (=> (not res!29126) (not e!22576))))

(assert (=> d!9692 (= res!29126 (= (size!831 (buf!1159 (_2!1806 lt!49641))) (size!831 (buf!1159 (_2!1806 lt!49645)))))))

(assert (=> d!9692 (= (isPrefixOf!0 (_2!1806 lt!49641) (_2!1806 lt!49645)) e!22576)))

(declare-fun b!33984 () Bool)

(declare-fun res!29125 () Bool)

(assert (=> b!33984 (=> (not res!29125) (not e!22576))))

(assert (=> b!33984 (= res!29125 (bvsle (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!49641))) (currentByte!2526 (_2!1806 lt!49641)) (currentBit!2521 (_2!1806 lt!49641))) (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!49645))) (currentByte!2526 (_2!1806 lt!49645)) (currentBit!2521 (_2!1806 lt!49645)))))))

(declare-fun b!33985 () Bool)

(declare-fun e!22577 () Bool)

(assert (=> b!33985 (= e!22576 e!22577)))

(declare-fun res!29124 () Bool)

(assert (=> b!33985 (=> res!29124 e!22577)))

(assert (=> b!33985 (= res!29124 (= (size!831 (buf!1159 (_2!1806 lt!49641))) #b00000000000000000000000000000000))))

(declare-fun b!33986 () Bool)

(assert (=> b!33986 (= e!22577 (arrayBitRangesEq!0 (buf!1159 (_2!1806 lt!49641)) (buf!1159 (_2!1806 lt!49645)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!49641))) (currentByte!2526 (_2!1806 lt!49641)) (currentBit!2521 (_2!1806 lt!49641)))))))

(assert (= (and d!9692 res!29126) b!33984))

(assert (= (and b!33984 res!29125) b!33985))

(assert (= (and b!33985 (not res!29124)) b!33986))

(assert (=> b!33984 m!50347))

(assert (=> b!33984 m!50395))

(assert (=> b!33986 m!50347))

(assert (=> b!33986 m!50347))

(declare-fun m!50481 () Bool)

(assert (=> b!33986 m!50481))

(assert (=> b!33886 d!9692))

(declare-fun d!9694 () Bool)

(assert (=> d!9694 (isPrefixOf!0 thiss!1379 (_2!1806 lt!49645))))

(declare-fun lt!49741 () Unit!2517)

(declare-fun choose!30 (BitStream!1454 BitStream!1454 BitStream!1454) Unit!2517)

(assert (=> d!9694 (= lt!49741 (choose!30 thiss!1379 (_2!1806 lt!49641) (_2!1806 lt!49645)))))

(assert (=> d!9694 (isPrefixOf!0 thiss!1379 (_2!1806 lt!49641))))

(assert (=> d!9694 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1806 lt!49641) (_2!1806 lt!49645)) lt!49741)))

(declare-fun bs!2658 () Bool)

(assert (= bs!2658 d!9694))

(assert (=> bs!2658 m!50333))

(declare-fun m!50485 () Bool)

(assert (=> bs!2658 m!50485))

(assert (=> bs!2658 m!50387))

(assert (=> b!33886 d!9694))

(declare-fun d!9698 () Bool)

(declare-fun res!29132 () Bool)

(declare-fun e!22580 () Bool)

(assert (=> d!9698 (=> (not res!29132) (not e!22580))))

(assert (=> d!9698 (= res!29132 (= (size!831 (buf!1159 thiss!1379)) (size!831 (buf!1159 (_2!1806 lt!49645)))))))

(assert (=> d!9698 (= (isPrefixOf!0 thiss!1379 (_2!1806 lt!49645)) e!22580)))

(declare-fun b!33990 () Bool)

(declare-fun res!29131 () Bool)

(assert (=> b!33990 (=> (not res!29131) (not e!22580))))

(assert (=> b!33990 (= res!29131 (bvsle (bitIndex!0 (size!831 (buf!1159 thiss!1379)) (currentByte!2526 thiss!1379) (currentBit!2521 thiss!1379)) (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!49645))) (currentByte!2526 (_2!1806 lt!49645)) (currentBit!2521 (_2!1806 lt!49645)))))))

(declare-fun b!33991 () Bool)

(declare-fun e!22581 () Bool)

(assert (=> b!33991 (= e!22580 e!22581)))

(declare-fun res!29130 () Bool)

(assert (=> b!33991 (=> res!29130 e!22581)))

(assert (=> b!33991 (= res!29130 (= (size!831 (buf!1159 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!33992 () Bool)

(assert (=> b!33992 (= e!22581 (arrayBitRangesEq!0 (buf!1159 thiss!1379) (buf!1159 (_2!1806 lt!49645)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!831 (buf!1159 thiss!1379)) (currentByte!2526 thiss!1379) (currentBit!2521 thiss!1379))))))

(assert (= (and d!9698 res!29132) b!33990))

(assert (= (and b!33990 res!29131) b!33991))

(assert (= (and b!33991 (not res!29130)) b!33992))

(assert (=> b!33990 m!50371))

(assert (=> b!33990 m!50395))

(assert (=> b!33992 m!50371))

(assert (=> b!33992 m!50371))

(declare-fun m!50487 () Bool)

(assert (=> b!33992 m!50487))

(assert (=> b!33886 d!9698))

(declare-fun b!34017 () Bool)

(declare-fun lt!49819 () (_ BitVec 64))

(declare-fun lt!49817 () (_ BitVec 64))

(declare-fun lt!49822 () tuple2!3440)

(declare-fun e!22596 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1454 (_ BitVec 64)) BitStream!1454)

(assert (=> b!34017 (= e!22596 (= (_1!1807 lt!49822) (withMovedBitIndex!0 (_2!1807 lt!49822) (bvsub lt!49817 lt!49819))))))

(assert (=> b!34017 (or (= (bvand lt!49817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!49819 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!49817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!49817 lt!49819) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34017 (= lt!49819 (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!49641))) (currentByte!2526 (_2!1806 lt!49641)) (currentBit!2521 (_2!1806 lt!49641))))))

(assert (=> b!34017 (= lt!49817 (bitIndex!0 (size!831 (buf!1159 thiss!1379)) (currentByte!2526 thiss!1379) (currentBit!2521 thiss!1379)))))

(declare-fun d!9700 () Bool)

(assert (=> d!9700 e!22596))

(declare-fun res!29154 () Bool)

(assert (=> d!9700 (=> (not res!29154) (not e!22596))))

(assert (=> d!9700 (= res!29154 (isPrefixOf!0 (_1!1807 lt!49822) (_2!1807 lt!49822)))))

(declare-fun lt!49831 () BitStream!1454)

(assert (=> d!9700 (= lt!49822 (tuple2!3441 lt!49831 (_2!1806 lt!49641)))))

(declare-fun lt!49821 () Unit!2517)

(declare-fun lt!49812 () Unit!2517)

(assert (=> d!9700 (= lt!49821 lt!49812)))

(assert (=> d!9700 (isPrefixOf!0 lt!49831 (_2!1806 lt!49641))))

(assert (=> d!9700 (= lt!49812 (lemmaIsPrefixTransitive!0 lt!49831 (_2!1806 lt!49641) (_2!1806 lt!49641)))))

(declare-fun lt!49824 () Unit!2517)

(declare-fun lt!49816 () Unit!2517)

(assert (=> d!9700 (= lt!49824 lt!49816)))

(assert (=> d!9700 (isPrefixOf!0 lt!49831 (_2!1806 lt!49641))))

(assert (=> d!9700 (= lt!49816 (lemmaIsPrefixTransitive!0 lt!49831 thiss!1379 (_2!1806 lt!49641)))))

(declare-fun lt!49823 () Unit!2517)

(declare-fun e!22595 () Unit!2517)

(assert (=> d!9700 (= lt!49823 e!22595)))

(declare-fun c!2245 () Bool)

(assert (=> d!9700 (= c!2245 (not (= (size!831 (buf!1159 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!49826 () Unit!2517)

(declare-fun lt!49820 () Unit!2517)

(assert (=> d!9700 (= lt!49826 lt!49820)))

(assert (=> d!9700 (isPrefixOf!0 (_2!1806 lt!49641) (_2!1806 lt!49641))))

(assert (=> d!9700 (= lt!49820 (lemmaIsPrefixRefl!0 (_2!1806 lt!49641)))))

(declare-fun lt!49813 () Unit!2517)

(declare-fun lt!49829 () Unit!2517)

(assert (=> d!9700 (= lt!49813 lt!49829)))

(assert (=> d!9700 (= lt!49829 (lemmaIsPrefixRefl!0 (_2!1806 lt!49641)))))

(declare-fun lt!49825 () Unit!2517)

(declare-fun lt!49830 () Unit!2517)

(assert (=> d!9700 (= lt!49825 lt!49830)))

(assert (=> d!9700 (isPrefixOf!0 lt!49831 lt!49831)))

(assert (=> d!9700 (= lt!49830 (lemmaIsPrefixRefl!0 lt!49831))))

(declare-fun lt!49815 () Unit!2517)

(declare-fun lt!49818 () Unit!2517)

(assert (=> d!9700 (= lt!49815 lt!49818)))

(assert (=> d!9700 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!9700 (= lt!49818 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!9700 (= lt!49831 (BitStream!1455 (buf!1159 (_2!1806 lt!49641)) (currentByte!2526 thiss!1379) (currentBit!2521 thiss!1379)))))

(assert (=> d!9700 (isPrefixOf!0 thiss!1379 (_2!1806 lt!49641))))

(assert (=> d!9700 (= (reader!0 thiss!1379 (_2!1806 lt!49641)) lt!49822)))

(declare-fun b!34018 () Bool)

(declare-fun res!29155 () Bool)

(assert (=> b!34018 (=> (not res!29155) (not e!22596))))

(assert (=> b!34018 (= res!29155 (isPrefixOf!0 (_2!1807 lt!49822) (_2!1806 lt!49641)))))

(declare-fun b!34019 () Bool)

(declare-fun res!29153 () Bool)

(assert (=> b!34019 (=> (not res!29153) (not e!22596))))

(assert (=> b!34019 (= res!29153 (isPrefixOf!0 (_1!1807 lt!49822) thiss!1379))))

(declare-fun b!34020 () Bool)

(declare-fun Unit!2529 () Unit!2517)

(assert (=> b!34020 (= e!22595 Unit!2529)))

(declare-fun b!34021 () Bool)

(declare-fun lt!49828 () Unit!2517)

(assert (=> b!34021 (= e!22595 lt!49828)))

(declare-fun lt!49814 () (_ BitVec 64))

(assert (=> b!34021 (= lt!49814 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!49827 () (_ BitVec 64))

(assert (=> b!34021 (= lt!49827 (bitIndex!0 (size!831 (buf!1159 thiss!1379)) (currentByte!2526 thiss!1379) (currentBit!2521 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1878 array!1878 (_ BitVec 64) (_ BitVec 64)) Unit!2517)

(assert (=> b!34021 (= lt!49828 (arrayBitRangesEqSymmetric!0 (buf!1159 thiss!1379) (buf!1159 (_2!1806 lt!49641)) lt!49814 lt!49827))))

(assert (=> b!34021 (arrayBitRangesEq!0 (buf!1159 (_2!1806 lt!49641)) (buf!1159 thiss!1379) lt!49814 lt!49827)))

(assert (= (and d!9700 c!2245) b!34021))

(assert (= (and d!9700 (not c!2245)) b!34020))

(assert (= (and d!9700 res!29154) b!34019))

(assert (= (and b!34019 res!29153) b!34018))

(assert (= (and b!34018 res!29155) b!34017))

(declare-fun m!50503 () Bool)

(assert (=> d!9700 m!50503))

(assert (=> d!9700 m!50369))

(declare-fun m!50505 () Bool)

(assert (=> d!9700 m!50505))

(assert (=> d!9700 m!50387))

(declare-fun m!50507 () Bool)

(assert (=> d!9700 m!50507))

(assert (=> d!9700 m!50367))

(declare-fun m!50509 () Bool)

(assert (=> d!9700 m!50509))

(declare-fun m!50511 () Bool)

(assert (=> d!9700 m!50511))

(declare-fun m!50513 () Bool)

(assert (=> d!9700 m!50513))

(declare-fun m!50515 () Bool)

(assert (=> d!9700 m!50515))

(declare-fun m!50517 () Bool)

(assert (=> d!9700 m!50517))

(declare-fun m!50519 () Bool)

(assert (=> b!34018 m!50519))

(declare-fun m!50521 () Bool)

(assert (=> b!34017 m!50521))

(assert (=> b!34017 m!50347))

(assert (=> b!34017 m!50371))

(assert (=> b!34021 m!50371))

(declare-fun m!50523 () Bool)

(assert (=> b!34021 m!50523))

(declare-fun m!50525 () Bool)

(assert (=> b!34021 m!50525))

(declare-fun m!50527 () Bool)

(assert (=> b!34019 m!50527))

(assert (=> b!33886 d!9700))

(declare-fun d!9714 () Bool)

(assert (=> d!9714 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49641)))) ((_ sign_extend 32) (currentByte!2526 thiss!1379)) ((_ sign_extend 32) (currentBit!2521 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49641)))) ((_ sign_extend 32) (currentByte!2526 thiss!1379)) ((_ sign_extend 32) (currentBit!2521 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2662 () Bool)

(assert (= bs!2662 d!9714))

(declare-fun m!50529 () Bool)

(assert (=> bs!2662 m!50529))

(assert (=> b!33886 d!9714))

(declare-fun d!9716 () Bool)

(assert (=> d!9716 (validate_offset_bits!1 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49641)))) ((_ sign_extend 32) (currentByte!2526 thiss!1379)) ((_ sign_extend 32) (currentBit!2521 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!49834 () Unit!2517)

(declare-fun choose!9 (BitStream!1454 array!1878 (_ BitVec 64) BitStream!1454) Unit!2517)

(assert (=> d!9716 (= lt!49834 (choose!9 thiss!1379 (buf!1159 (_2!1806 lt!49641)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1455 (buf!1159 (_2!1806 lt!49641)) (currentByte!2526 thiss!1379) (currentBit!2521 thiss!1379))))))

(assert (=> d!9716 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1159 (_2!1806 lt!49641)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!49834)))

(declare-fun bs!2663 () Bool)

(assert (= bs!2663 d!9716))

(assert (=> bs!2663 m!50341))

(declare-fun m!50531 () Bool)

(assert (=> bs!2663 m!50531))

(assert (=> b!33886 d!9716))

(declare-fun b!34215 () Bool)

(declare-fun e!22688 () tuple2!3438)

(declare-fun lt!50398 () tuple2!3438)

(declare-fun Unit!2530 () Unit!2517)

(assert (=> b!34215 (= e!22688 (tuple2!3439 Unit!2530 (_2!1806 lt!50398)))))

(declare-fun lt!50395 () tuple2!3438)

(assert (=> b!34215 (= lt!50395 (appendBitFromByte!0 (_2!1806 lt!49641) (select (arr!1306 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!50387 () (_ BitVec 64))

(assert (=> b!34215 (= lt!50387 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!50412 () (_ BitVec 64))

(assert (=> b!34215 (= lt!50412 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!50413 () Unit!2517)

(assert (=> b!34215 (= lt!50413 (validateOffsetBitsIneqLemma!0 (_2!1806 lt!49641) (_2!1806 lt!50395) lt!50387 lt!50412))))

(assert (=> b!34215 (validate_offset_bits!1 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!50395)))) ((_ sign_extend 32) (currentByte!2526 (_2!1806 lt!50395))) ((_ sign_extend 32) (currentBit!2521 (_2!1806 lt!50395))) (bvsub lt!50387 lt!50412))))

(declare-fun lt!50400 () Unit!2517)

(assert (=> b!34215 (= lt!50400 lt!50413)))

(declare-fun lt!50416 () tuple2!3440)

(assert (=> b!34215 (= lt!50416 (reader!0 (_2!1806 lt!49641) (_2!1806 lt!50395)))))

(declare-fun lt!50414 () (_ BitVec 64))

(assert (=> b!34215 (= lt!50414 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!50399 () Unit!2517)

(assert (=> b!34215 (= lt!50399 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1806 lt!49641) (buf!1159 (_2!1806 lt!50395)) lt!50414))))

(assert (=> b!34215 (validate_offset_bits!1 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!50395)))) ((_ sign_extend 32) (currentByte!2526 (_2!1806 lt!49641))) ((_ sign_extend 32) (currentBit!2521 (_2!1806 lt!49641))) lt!50414)))

(declare-fun lt!50394 () Unit!2517)

(assert (=> b!34215 (= lt!50394 lt!50399)))

(assert (=> b!34215 (= (head!265 (byteArrayBitContentToList!0 (_2!1806 lt!50395) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!265 (bitStreamReadBitsIntoList!0 (_2!1806 lt!50395) (_1!1807 lt!50416) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!50410 () Unit!2517)

(declare-fun Unit!2531 () Unit!2517)

(assert (=> b!34215 (= lt!50410 Unit!2531)))

(assert (=> b!34215 (= lt!50398 (appendBitsMSBFirstLoop!0 (_2!1806 lt!50395) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!50404 () Unit!2517)

(assert (=> b!34215 (= lt!50404 (lemmaIsPrefixTransitive!0 (_2!1806 lt!49641) (_2!1806 lt!50395) (_2!1806 lt!50398)))))

(assert (=> b!34215 (isPrefixOf!0 (_2!1806 lt!49641) (_2!1806 lt!50398))))

(declare-fun lt!50384 () Unit!2517)

(assert (=> b!34215 (= lt!50384 lt!50404)))

(assert (=> b!34215 (= (size!831 (buf!1159 (_2!1806 lt!50398))) (size!831 (buf!1159 (_2!1806 lt!49641))))))

(declare-fun lt!50391 () Unit!2517)

(declare-fun Unit!2532 () Unit!2517)

(assert (=> b!34215 (= lt!50391 Unit!2532)))

(assert (=> b!34215 (= (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!50398))) (currentByte!2526 (_2!1806 lt!50398)) (currentBit!2521 (_2!1806 lt!50398))) (bvsub (bvadd (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!49641))) (currentByte!2526 (_2!1806 lt!49641)) (currentBit!2521 (_2!1806 lt!49641))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!50377 () Unit!2517)

(declare-fun Unit!2533 () Unit!2517)

(assert (=> b!34215 (= lt!50377 Unit!2533)))

(assert (=> b!34215 (= (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!50398))) (currentByte!2526 (_2!1806 lt!50398)) (currentBit!2521 (_2!1806 lt!50398))) (bvsub (bvsub (bvadd (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!50395))) (currentByte!2526 (_2!1806 lt!50395)) (currentBit!2521 (_2!1806 lt!50395))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!50376 () Unit!2517)

(declare-fun Unit!2534 () Unit!2517)

(assert (=> b!34215 (= lt!50376 Unit!2534)))

(declare-fun lt!50409 () tuple2!3440)

(assert (=> b!34215 (= lt!50409 (reader!0 (_2!1806 lt!49641) (_2!1806 lt!50398)))))

(declare-fun lt!50386 () (_ BitVec 64))

(assert (=> b!34215 (= lt!50386 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!50406 () Unit!2517)

(assert (=> b!34215 (= lt!50406 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1806 lt!49641) (buf!1159 (_2!1806 lt!50398)) lt!50386))))

(assert (=> b!34215 (validate_offset_bits!1 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!50398)))) ((_ sign_extend 32) (currentByte!2526 (_2!1806 lt!49641))) ((_ sign_extend 32) (currentBit!2521 (_2!1806 lt!49641))) lt!50386)))

(declare-fun lt!50396 () Unit!2517)

(assert (=> b!34215 (= lt!50396 lt!50406)))

(declare-fun lt!50415 () tuple2!3440)

(declare-fun call!424 () tuple2!3440)

(assert (=> b!34215 (= lt!50415 call!424)))

(declare-fun lt!50374 () (_ BitVec 64))

(assert (=> b!34215 (= lt!50374 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!50383 () Unit!2517)

(assert (=> b!34215 (= lt!50383 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1806 lt!50395) (buf!1159 (_2!1806 lt!50398)) lt!50374))))

(assert (=> b!34215 (validate_offset_bits!1 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!50398)))) ((_ sign_extend 32) (currentByte!2526 (_2!1806 lt!50395))) ((_ sign_extend 32) (currentBit!2521 (_2!1806 lt!50395))) lt!50374)))

(declare-fun lt!50381 () Unit!2517)

(assert (=> b!34215 (= lt!50381 lt!50383)))

(declare-fun lt!50411 () List!428)

(assert (=> b!34215 (= lt!50411 (byteArrayBitContentToList!0 (_2!1806 lt!50398) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!50393 () List!428)

(assert (=> b!34215 (= lt!50393 (byteArrayBitContentToList!0 (_2!1806 lt!50398) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!50382 () List!428)

(assert (=> b!34215 (= lt!50382 (bitStreamReadBitsIntoList!0 (_2!1806 lt!50398) (_1!1807 lt!50409) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!50407 () List!428)

(assert (=> b!34215 (= lt!50407 (bitStreamReadBitsIntoList!0 (_2!1806 lt!50398) (_1!1807 lt!50415) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!50385 () (_ BitVec 64))

(assert (=> b!34215 (= lt!50385 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!50403 () Unit!2517)

(assert (=> b!34215 (= lt!50403 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1806 lt!50398) (_2!1806 lt!50398) (_1!1807 lt!50409) (_1!1807 lt!50415) lt!50385 lt!50382))))

(assert (=> b!34215 (= (bitStreamReadBitsIntoList!0 (_2!1806 lt!50398) (_1!1807 lt!50415) (bvsub lt!50385 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!145 lt!50382))))

(declare-fun lt!50401 () Unit!2517)

(assert (=> b!34215 (= lt!50401 lt!50403)))

(declare-fun lt!50390 () Unit!2517)

(declare-fun lt!50389 () (_ BitVec 64))

(assert (=> b!34215 (= lt!50390 (arrayBitRangesEqImpliesEq!0 (buf!1159 (_2!1806 lt!50395)) (buf!1159 (_2!1806 lt!50398)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!50389 (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!50395))) (currentByte!2526 (_2!1806 lt!50395)) (currentBit!2521 (_2!1806 lt!50395)))))))

(assert (=> b!34215 (= (bitAt!0 (buf!1159 (_2!1806 lt!50395)) lt!50389) (bitAt!0 (buf!1159 (_2!1806 lt!50398)) lt!50389))))

(declare-fun lt!50402 () Unit!2517)

(assert (=> b!34215 (= lt!50402 lt!50390)))

(declare-fun b!34216 () Bool)

(declare-fun res!29285 () Bool)

(declare-fun e!22689 () Bool)

(assert (=> b!34216 (=> (not res!29285) (not e!22689))))

(declare-fun lt!50379 () tuple2!3438)

(assert (=> b!34216 (= res!29285 (invariant!0 (currentBit!2521 (_2!1806 lt!50379)) (currentByte!2526 (_2!1806 lt!50379)) (size!831 (buf!1159 (_2!1806 lt!50379)))))))

(declare-fun d!9718 () Bool)

(assert (=> d!9718 e!22689))

(declare-fun res!29284 () Bool)

(assert (=> d!9718 (=> (not res!29284) (not e!22689))))

(declare-fun lt!50375 () (_ BitVec 64))

(assert (=> d!9718 (= res!29284 (= (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!50379))) (currentByte!2526 (_2!1806 lt!50379)) (currentBit!2521 (_2!1806 lt!50379))) (bvsub lt!50375 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!9718 (or (= (bvand lt!50375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!50375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!50375 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!50373 () (_ BitVec 64))

(assert (=> d!9718 (= lt!50375 (bvadd lt!50373 to!314))))

(assert (=> d!9718 (or (not (= (bvand lt!50373 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!50373 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!50373 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9718 (= lt!50373 (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!49641))) (currentByte!2526 (_2!1806 lt!49641)) (currentBit!2521 (_2!1806 lt!49641))))))

(assert (=> d!9718 (= lt!50379 e!22688)))

(declare-fun c!2279 () Bool)

(assert (=> d!9718 (= c!2279 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!50408 () Unit!2517)

(declare-fun lt!50380 () Unit!2517)

(assert (=> d!9718 (= lt!50408 lt!50380)))

(assert (=> d!9718 (isPrefixOf!0 (_2!1806 lt!49641) (_2!1806 lt!49641))))

(assert (=> d!9718 (= lt!50380 (lemmaIsPrefixRefl!0 (_2!1806 lt!49641)))))

(assert (=> d!9718 (= lt!50389 (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!49641))) (currentByte!2526 (_2!1806 lt!49641)) (currentBit!2521 (_2!1806 lt!49641))))))

(assert (=> d!9718 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9718 (= (appendBitsMSBFirstLoop!0 (_2!1806 lt!49641) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!50379)))

(declare-fun b!34217 () Bool)

(declare-fun e!22687 () Bool)

(declare-fun lt!50397 () (_ BitVec 64))

(assert (=> b!34217 (= e!22687 (validate_offset_bits!1 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49641)))) ((_ sign_extend 32) (currentByte!2526 (_2!1806 lt!49641))) ((_ sign_extend 32) (currentBit!2521 (_2!1806 lt!49641))) lt!50397))))

(declare-fun bm!421 () Bool)

(assert (=> bm!421 (= call!424 (reader!0 (ite c!2279 (_2!1806 lt!50395) (_2!1806 lt!49641)) (ite c!2279 (_2!1806 lt!50398) (_2!1806 lt!49641))))))

(declare-fun lt!50405 () tuple2!3440)

(declare-fun b!34218 () Bool)

(assert (=> b!34218 (= e!22689 (= (bitStreamReadBitsIntoList!0 (_2!1806 lt!50379) (_1!1807 lt!50405) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1806 lt!50379) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!34218 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34218 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!50388 () Unit!2517)

(declare-fun lt!50392 () Unit!2517)

(assert (=> b!34218 (= lt!50388 lt!50392)))

(assert (=> b!34218 (validate_offset_bits!1 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!50379)))) ((_ sign_extend 32) (currentByte!2526 (_2!1806 lt!49641))) ((_ sign_extend 32) (currentBit!2521 (_2!1806 lt!49641))) lt!50397)))

(assert (=> b!34218 (= lt!50392 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1806 lt!49641) (buf!1159 (_2!1806 lt!50379)) lt!50397))))

(assert (=> b!34218 e!22687))

(declare-fun res!29281 () Bool)

(assert (=> b!34218 (=> (not res!29281) (not e!22687))))

(assert (=> b!34218 (= res!29281 (and (= (size!831 (buf!1159 (_2!1806 lt!49641))) (size!831 (buf!1159 (_2!1806 lt!50379)))) (bvsge lt!50397 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34218 (= lt!50397 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!34218 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34218 (= lt!50405 (reader!0 (_2!1806 lt!49641) (_2!1806 lt!50379)))))

(declare-fun b!34219 () Bool)

(declare-fun res!29282 () Bool)

(assert (=> b!34219 (=> (not res!29282) (not e!22689))))

(assert (=> b!34219 (= res!29282 (= (size!831 (buf!1159 (_2!1806 lt!49641))) (size!831 (buf!1159 (_2!1806 lt!50379)))))))

(declare-fun b!34220 () Bool)

(declare-fun Unit!2535 () Unit!2517)

(assert (=> b!34220 (= e!22688 (tuple2!3439 Unit!2535 (_2!1806 lt!49641)))))

(assert (=> b!34220 (= (size!831 (buf!1159 (_2!1806 lt!49641))) (size!831 (buf!1159 (_2!1806 lt!49641))))))

(declare-fun lt!50378 () Unit!2517)

(declare-fun Unit!2536 () Unit!2517)

(assert (=> b!34220 (= lt!50378 Unit!2536)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1454 array!1878 array!1878 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3454 0))(
  ( (tuple2!3455 (_1!1814 array!1878) (_2!1814 BitStream!1454)) )
))
(declare-fun readBits!0 (BitStream!1454 (_ BitVec 64)) tuple2!3454)

(assert (=> b!34220 (checkByteArrayBitContent!0 (_2!1806 lt!49641) srcBuffer!2 (_1!1814 (readBits!0 (_1!1807 call!424) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!34221 () Bool)

(declare-fun res!29283 () Bool)

(assert (=> b!34221 (=> (not res!29283) (not e!22689))))

(assert (=> b!34221 (= res!29283 (isPrefixOf!0 (_2!1806 lt!49641) (_2!1806 lt!50379)))))

(declare-fun b!34222 () Bool)

(declare-fun res!29286 () Bool)

(assert (=> b!34222 (=> (not res!29286) (not e!22689))))

(assert (=> b!34222 (= res!29286 (= (size!831 (buf!1159 (_2!1806 lt!50379))) (size!831 (buf!1159 (_2!1806 lt!49641)))))))

(assert (= (and d!9718 c!2279) b!34215))

(assert (= (and d!9718 (not c!2279)) b!34220))

(assert (= (or b!34215 b!34220) bm!421))

(assert (= (and d!9718 res!29284) b!34216))

(assert (= (and b!34216 res!29285) b!34219))

(assert (= (and b!34219 res!29282) b!34221))

(assert (= (and b!34221 res!29283) b!34222))

(assert (= (and b!34222 res!29286) b!34218))

(assert (= (and b!34218 res!29281) b!34217))

(declare-fun m!50903 () Bool)

(assert (=> b!34217 m!50903))

(declare-fun m!50905 () Bool)

(assert (=> b!34221 m!50905))

(declare-fun m!50907 () Bool)

(assert (=> b!34218 m!50907))

(declare-fun m!50909 () Bool)

(assert (=> b!34218 m!50909))

(declare-fun m!50911 () Bool)

(assert (=> b!34218 m!50911))

(declare-fun m!50913 () Bool)

(assert (=> b!34218 m!50913))

(declare-fun m!50915 () Bool)

(assert (=> b!34218 m!50915))

(declare-fun m!50917 () Bool)

(assert (=> b!34216 m!50917))

(declare-fun m!50919 () Bool)

(assert (=> d!9718 m!50919))

(assert (=> d!9718 m!50347))

(assert (=> d!9718 m!50511))

(assert (=> d!9718 m!50517))

(declare-fun m!50921 () Bool)

(assert (=> bm!421 m!50921))

(declare-fun m!50923 () Bool)

(assert (=> b!34220 m!50923))

(declare-fun m!50925 () Bool)

(assert (=> b!34220 m!50925))

(declare-fun m!50927 () Bool)

(assert (=> b!34215 m!50927))

(declare-fun m!50929 () Bool)

(assert (=> b!34215 m!50929))

(declare-fun m!50931 () Bool)

(assert (=> b!34215 m!50931))

(declare-fun m!50933 () Bool)

(assert (=> b!34215 m!50933))

(declare-fun m!50935 () Bool)

(assert (=> b!34215 m!50935))

(declare-fun m!50937 () Bool)

(assert (=> b!34215 m!50937))

(assert (=> b!34215 m!50347))

(declare-fun m!50939 () Bool)

(assert (=> b!34215 m!50939))

(declare-fun m!50941 () Bool)

(assert (=> b!34215 m!50941))

(declare-fun m!50943 () Bool)

(assert (=> b!34215 m!50943))

(declare-fun m!50945 () Bool)

(assert (=> b!34215 m!50945))

(declare-fun m!50947 () Bool)

(assert (=> b!34215 m!50947))

(declare-fun m!50949 () Bool)

(assert (=> b!34215 m!50949))

(declare-fun m!50951 () Bool)

(assert (=> b!34215 m!50951))

(assert (=> b!34215 m!50939))

(assert (=> b!34215 m!50947))

(declare-fun m!50953 () Bool)

(assert (=> b!34215 m!50953))

(declare-fun m!50955 () Bool)

(assert (=> b!34215 m!50955))

(declare-fun m!50957 () Bool)

(assert (=> b!34215 m!50957))

(declare-fun m!50959 () Bool)

(assert (=> b!34215 m!50959))

(declare-fun m!50961 () Bool)

(assert (=> b!34215 m!50961))

(declare-fun m!50963 () Bool)

(assert (=> b!34215 m!50963))

(declare-fun m!50965 () Bool)

(assert (=> b!34215 m!50965))

(declare-fun m!50967 () Bool)

(assert (=> b!34215 m!50967))

(declare-fun m!50969 () Bool)

(assert (=> b!34215 m!50969))

(declare-fun m!50971 () Bool)

(assert (=> b!34215 m!50971))

(declare-fun m!50973 () Bool)

(assert (=> b!34215 m!50973))

(declare-fun m!50975 () Bool)

(assert (=> b!34215 m!50975))

(declare-fun m!50977 () Bool)

(assert (=> b!34215 m!50977))

(assert (=> b!34215 m!50933))

(declare-fun m!50979 () Bool)

(assert (=> b!34215 m!50979))

(declare-fun m!50981 () Bool)

(assert (=> b!34215 m!50981))

(declare-fun m!50983 () Bool)

(assert (=> b!34215 m!50983))

(declare-fun m!50985 () Bool)

(assert (=> b!34215 m!50985))

(assert (=> b!34215 m!50949))

(declare-fun m!50987 () Bool)

(assert (=> b!34215 m!50987))

(assert (=> b!33886 d!9718))

(declare-fun d!9800 () Bool)

(assert (=> d!9800 (= (bitAt!0 (buf!1159 (_2!1806 lt!49645)) lt!49654) (not (= (bvand ((_ sign_extend 24) (select (arr!1306 (buf!1159 (_2!1806 lt!49645))) ((_ extract 31 0) (bvsdiv lt!49654 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!49654 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2679 () Bool)

(assert (= bs!2679 d!9800))

(declare-fun m!50989 () Bool)

(assert (=> bs!2679 m!50989))

(assert (=> bs!2679 m!50431))

(assert (=> b!33897 d!9800))

(declare-fun d!9802 () Bool)

(assert (=> d!9802 (= (bitAt!0 (buf!1159 (_2!1806 lt!49641)) lt!49654) (bitAt!0 (buf!1159 (_2!1806 lt!49645)) lt!49654))))

(declare-fun lt!50419 () Unit!2517)

(declare-fun choose!31 (array!1878 array!1878 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2517)

(assert (=> d!9802 (= lt!50419 (choose!31 (buf!1159 (_2!1806 lt!49641)) (buf!1159 (_2!1806 lt!49645)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!49654 lt!49640))))

(assert (=> d!9802 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!49640))))

(assert (=> d!9802 (= (arrayBitRangesEqImpliesEq!0 (buf!1159 (_2!1806 lt!49641)) (buf!1159 (_2!1806 lt!49645)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!49654 lt!49640) lt!50419)))

(declare-fun bs!2680 () Bool)

(assert (= bs!2680 d!9802))

(assert (=> bs!2680 m!50365))

(assert (=> bs!2680 m!50305))

(declare-fun m!50991 () Bool)

(assert (=> bs!2680 m!50991))

(assert (=> b!33897 d!9802))

(declare-fun d!9804 () Bool)

(assert (=> d!9804 (= (invariant!0 (currentBit!2521 (_2!1806 lt!49645)) (currentByte!2526 (_2!1806 lt!49645)) (size!831 (buf!1159 (_2!1806 lt!49645)))) (and (bvsge (currentBit!2521 (_2!1806 lt!49645)) #b00000000000000000000000000000000) (bvslt (currentBit!2521 (_2!1806 lt!49645)) #b00000000000000000000000000001000) (bvsge (currentByte!2526 (_2!1806 lt!49645)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2526 (_2!1806 lt!49645)) (size!831 (buf!1159 (_2!1806 lt!49645)))) (and (= (currentBit!2521 (_2!1806 lt!49645)) #b00000000000000000000000000000000) (= (currentByte!2526 (_2!1806 lt!49645)) (size!831 (buf!1159 (_2!1806 lt!49645))))))))))

(assert (=> b!33895 d!9804))

(declare-fun d!9806 () Bool)

(assert (=> d!9806 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49645)))) ((_ sign_extend 32) (currentByte!2526 thiss!1379)) ((_ sign_extend 32) (currentBit!2521 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49645)))) ((_ sign_extend 32) (currentByte!2526 thiss!1379)) ((_ sign_extend 32) (currentBit!2521 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2681 () Bool)

(assert (= bs!2681 d!9806))

(declare-fun m!50993 () Bool)

(assert (=> bs!2681 m!50993))

(assert (=> b!33885 d!9806))

(declare-fun b!34223 () Bool)

(declare-fun e!22691 () Bool)

(declare-fun lt!50427 () (_ BitVec 64))

(declare-fun lt!50425 () (_ BitVec 64))

(declare-fun lt!50430 () tuple2!3440)

(assert (=> b!34223 (= e!22691 (= (_1!1807 lt!50430) (withMovedBitIndex!0 (_2!1807 lt!50430) (bvsub lt!50425 lt!50427))))))

(assert (=> b!34223 (or (= (bvand lt!50425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!50427 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!50425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!50425 lt!50427) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34223 (= lt!50427 (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!49645))) (currentByte!2526 (_2!1806 lt!49645)) (currentBit!2521 (_2!1806 lt!49645))))))

(assert (=> b!34223 (= lt!50425 (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!49641))) (currentByte!2526 (_2!1806 lt!49641)) (currentBit!2521 (_2!1806 lt!49641))))))

(declare-fun d!9808 () Bool)

(assert (=> d!9808 e!22691))

(declare-fun res!29288 () Bool)

(assert (=> d!9808 (=> (not res!29288) (not e!22691))))

(assert (=> d!9808 (= res!29288 (isPrefixOf!0 (_1!1807 lt!50430) (_2!1807 lt!50430)))))

(declare-fun lt!50439 () BitStream!1454)

(assert (=> d!9808 (= lt!50430 (tuple2!3441 lt!50439 (_2!1806 lt!49645)))))

(declare-fun lt!50429 () Unit!2517)

(declare-fun lt!50420 () Unit!2517)

(assert (=> d!9808 (= lt!50429 lt!50420)))

(assert (=> d!9808 (isPrefixOf!0 lt!50439 (_2!1806 lt!49645))))

(assert (=> d!9808 (= lt!50420 (lemmaIsPrefixTransitive!0 lt!50439 (_2!1806 lt!49645) (_2!1806 lt!49645)))))

(declare-fun lt!50432 () Unit!2517)

(declare-fun lt!50424 () Unit!2517)

(assert (=> d!9808 (= lt!50432 lt!50424)))

(assert (=> d!9808 (isPrefixOf!0 lt!50439 (_2!1806 lt!49645))))

(assert (=> d!9808 (= lt!50424 (lemmaIsPrefixTransitive!0 lt!50439 (_2!1806 lt!49641) (_2!1806 lt!49645)))))

(declare-fun lt!50431 () Unit!2517)

(declare-fun e!22690 () Unit!2517)

(assert (=> d!9808 (= lt!50431 e!22690)))

(declare-fun c!2280 () Bool)

(assert (=> d!9808 (= c!2280 (not (= (size!831 (buf!1159 (_2!1806 lt!49641))) #b00000000000000000000000000000000)))))

(declare-fun lt!50434 () Unit!2517)

(declare-fun lt!50428 () Unit!2517)

(assert (=> d!9808 (= lt!50434 lt!50428)))

(assert (=> d!9808 (isPrefixOf!0 (_2!1806 lt!49645) (_2!1806 lt!49645))))

(assert (=> d!9808 (= lt!50428 (lemmaIsPrefixRefl!0 (_2!1806 lt!49645)))))

(declare-fun lt!50421 () Unit!2517)

(declare-fun lt!50437 () Unit!2517)

(assert (=> d!9808 (= lt!50421 lt!50437)))

(assert (=> d!9808 (= lt!50437 (lemmaIsPrefixRefl!0 (_2!1806 lt!49645)))))

(declare-fun lt!50433 () Unit!2517)

(declare-fun lt!50438 () Unit!2517)

(assert (=> d!9808 (= lt!50433 lt!50438)))

(assert (=> d!9808 (isPrefixOf!0 lt!50439 lt!50439)))

(assert (=> d!9808 (= lt!50438 (lemmaIsPrefixRefl!0 lt!50439))))

(declare-fun lt!50423 () Unit!2517)

(declare-fun lt!50426 () Unit!2517)

(assert (=> d!9808 (= lt!50423 lt!50426)))

(assert (=> d!9808 (isPrefixOf!0 (_2!1806 lt!49641) (_2!1806 lt!49641))))

(assert (=> d!9808 (= lt!50426 (lemmaIsPrefixRefl!0 (_2!1806 lt!49641)))))

(assert (=> d!9808 (= lt!50439 (BitStream!1455 (buf!1159 (_2!1806 lt!49645)) (currentByte!2526 (_2!1806 lt!49641)) (currentBit!2521 (_2!1806 lt!49641))))))

(assert (=> d!9808 (isPrefixOf!0 (_2!1806 lt!49641) (_2!1806 lt!49645))))

(assert (=> d!9808 (= (reader!0 (_2!1806 lt!49641) (_2!1806 lt!49645)) lt!50430)))

(declare-fun b!34224 () Bool)

(declare-fun res!29289 () Bool)

(assert (=> b!34224 (=> (not res!29289) (not e!22691))))

(assert (=> b!34224 (= res!29289 (isPrefixOf!0 (_2!1807 lt!50430) (_2!1806 lt!49645)))))

(declare-fun b!34225 () Bool)

(declare-fun res!29287 () Bool)

(assert (=> b!34225 (=> (not res!29287) (not e!22691))))

(assert (=> b!34225 (= res!29287 (isPrefixOf!0 (_1!1807 lt!50430) (_2!1806 lt!49641)))))

(declare-fun b!34226 () Bool)

(declare-fun Unit!2537 () Unit!2517)

(assert (=> b!34226 (= e!22690 Unit!2537)))

(declare-fun b!34227 () Bool)

(declare-fun lt!50436 () Unit!2517)

(assert (=> b!34227 (= e!22690 lt!50436)))

(declare-fun lt!50422 () (_ BitVec 64))

(assert (=> b!34227 (= lt!50422 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!50435 () (_ BitVec 64))

(assert (=> b!34227 (= lt!50435 (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!49641))) (currentByte!2526 (_2!1806 lt!49641)) (currentBit!2521 (_2!1806 lt!49641))))))

(assert (=> b!34227 (= lt!50436 (arrayBitRangesEqSymmetric!0 (buf!1159 (_2!1806 lt!49641)) (buf!1159 (_2!1806 lt!49645)) lt!50422 lt!50435))))

(assert (=> b!34227 (arrayBitRangesEq!0 (buf!1159 (_2!1806 lt!49645)) (buf!1159 (_2!1806 lt!49641)) lt!50422 lt!50435)))

(assert (= (and d!9808 c!2280) b!34227))

(assert (= (and d!9808 (not c!2280)) b!34226))

(assert (= (and d!9808 res!29288) b!34225))

(assert (= (and b!34225 res!29287) b!34224))

(assert (= (and b!34224 res!29289) b!34223))

(declare-fun m!50995 () Bool)

(assert (=> d!9808 m!50995))

(assert (=> d!9808 m!50517))

(declare-fun m!50997 () Bool)

(assert (=> d!9808 m!50997))

(assert (=> d!9808 m!50339))

(declare-fun m!50999 () Bool)

(assert (=> d!9808 m!50999))

(assert (=> d!9808 m!50511))

(declare-fun m!51001 () Bool)

(assert (=> d!9808 m!51001))

(declare-fun m!51003 () Bool)

(assert (=> d!9808 m!51003))

(declare-fun m!51005 () Bool)

(assert (=> d!9808 m!51005))

(declare-fun m!51007 () Bool)

(assert (=> d!9808 m!51007))

(declare-fun m!51009 () Bool)

(assert (=> d!9808 m!51009))

(declare-fun m!51011 () Bool)

(assert (=> b!34224 m!51011))

(declare-fun m!51013 () Bool)

(assert (=> b!34223 m!51013))

(assert (=> b!34223 m!50395))

(assert (=> b!34223 m!50347))

(assert (=> b!34227 m!50347))

(declare-fun m!51015 () Bool)

(assert (=> b!34227 m!51015))

(declare-fun m!51017 () Bool)

(assert (=> b!34227 m!51017))

(declare-fun m!51019 () Bool)

(assert (=> b!34225 m!51019))

(assert (=> b!33885 d!9808))

(declare-fun b!34228 () Bool)

(declare-fun e!22692 () tuple2!3450)

(assert (=> b!34228 (= e!22692 (tuple2!3451 Nil!425 (_1!1807 lt!49650)))))

(declare-fun b!34230 () Bool)

(declare-fun e!22693 () Bool)

(declare-fun lt!50442 () List!428)

(assert (=> b!34230 (= e!22693 (isEmpty!91 lt!50442))))

(declare-fun d!9810 () Bool)

(assert (=> d!9810 e!22693))

(declare-fun c!2282 () Bool)

(assert (=> d!9810 (= c!2282 (= lt!49637 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9810 (= lt!50442 (_1!1812 e!22692))))

(declare-fun c!2281 () Bool)

(assert (=> d!9810 (= c!2281 (= lt!49637 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9810 (bvsge lt!49637 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9810 (= (bitStreamReadBitsIntoList!0 (_2!1806 lt!49645) (_1!1807 lt!49650) lt!49637) lt!50442)))

(declare-fun lt!50440 () tuple2!3452)

(declare-fun lt!50441 () (_ BitVec 64))

(declare-fun b!34229 () Bool)

(assert (=> b!34229 (= e!22692 (tuple2!3451 (Cons!424 (_1!1813 lt!50440) (bitStreamReadBitsIntoList!0 (_2!1806 lt!49645) (_2!1813 lt!50440) (bvsub lt!49637 lt!50441))) (_2!1813 lt!50440)))))

(assert (=> b!34229 (= lt!50440 (readBit!0 (_1!1807 lt!49650)))))

(assert (=> b!34229 (= lt!50441 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!34231 () Bool)

(assert (=> b!34231 (= e!22693 (> (length!154 lt!50442) 0))))

(assert (= (and d!9810 c!2281) b!34228))

(assert (= (and d!9810 (not c!2281)) b!34229))

(assert (= (and d!9810 c!2282) b!34230))

(assert (= (and d!9810 (not c!2282)) b!34231))

(declare-fun m!51021 () Bool)

(assert (=> b!34230 m!51021))

(declare-fun m!51023 () Bool)

(assert (=> b!34229 m!51023))

(declare-fun m!51025 () Bool)

(assert (=> b!34229 m!51025))

(declare-fun m!51027 () Bool)

(assert (=> b!34231 m!51027))

(assert (=> b!33885 d!9810))

(declare-fun d!9812 () Bool)

(assert (=> d!9812 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49645)))) ((_ sign_extend 32) (currentByte!2526 (_2!1806 lt!49641))) ((_ sign_extend 32) (currentBit!2521 (_2!1806 lt!49641))) lt!49637) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49645)))) ((_ sign_extend 32) (currentByte!2526 (_2!1806 lt!49641))) ((_ sign_extend 32) (currentBit!2521 (_2!1806 lt!49641)))) lt!49637))))

(declare-fun bs!2682 () Bool)

(assert (= bs!2682 d!9812))

(declare-fun m!51029 () Bool)

(assert (=> bs!2682 m!51029))

(assert (=> b!33885 d!9812))

(declare-fun d!9814 () Bool)

(assert (=> d!9814 (validate_offset_bits!1 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49645)))) ((_ sign_extend 32) (currentByte!2526 thiss!1379)) ((_ sign_extend 32) (currentBit!2521 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!50443 () Unit!2517)

(assert (=> d!9814 (= lt!50443 (choose!9 thiss!1379 (buf!1159 (_2!1806 lt!49645)) (bvsub to!314 i!635) (BitStream!1455 (buf!1159 (_2!1806 lt!49645)) (currentByte!2526 thiss!1379) (currentBit!2521 thiss!1379))))))

(assert (=> d!9814 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1159 (_2!1806 lt!49645)) (bvsub to!314 i!635)) lt!50443)))

(declare-fun bs!2683 () Bool)

(assert (= bs!2683 d!9814))

(assert (=> bs!2683 m!50323))

(declare-fun m!51031 () Bool)

(assert (=> bs!2683 m!51031))

(assert (=> b!33885 d!9814))

(declare-fun e!22695 () Bool)

(declare-fun lt!50451 () (_ BitVec 64))

(declare-fun lt!50454 () tuple2!3440)

(declare-fun b!34232 () Bool)

(declare-fun lt!50449 () (_ BitVec 64))

(assert (=> b!34232 (= e!22695 (= (_1!1807 lt!50454) (withMovedBitIndex!0 (_2!1807 lt!50454) (bvsub lt!50449 lt!50451))))))

(assert (=> b!34232 (or (= (bvand lt!50449 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!50451 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!50449 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!50449 lt!50451) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34232 (= lt!50451 (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!49645))) (currentByte!2526 (_2!1806 lt!49645)) (currentBit!2521 (_2!1806 lt!49645))))))

(assert (=> b!34232 (= lt!50449 (bitIndex!0 (size!831 (buf!1159 thiss!1379)) (currentByte!2526 thiss!1379) (currentBit!2521 thiss!1379)))))

(declare-fun d!9816 () Bool)

(assert (=> d!9816 e!22695))

(declare-fun res!29291 () Bool)

(assert (=> d!9816 (=> (not res!29291) (not e!22695))))

(assert (=> d!9816 (= res!29291 (isPrefixOf!0 (_1!1807 lt!50454) (_2!1807 lt!50454)))))

(declare-fun lt!50463 () BitStream!1454)

(assert (=> d!9816 (= lt!50454 (tuple2!3441 lt!50463 (_2!1806 lt!49645)))))

(declare-fun lt!50453 () Unit!2517)

(declare-fun lt!50444 () Unit!2517)

(assert (=> d!9816 (= lt!50453 lt!50444)))

(assert (=> d!9816 (isPrefixOf!0 lt!50463 (_2!1806 lt!49645))))

(assert (=> d!9816 (= lt!50444 (lemmaIsPrefixTransitive!0 lt!50463 (_2!1806 lt!49645) (_2!1806 lt!49645)))))

(declare-fun lt!50456 () Unit!2517)

(declare-fun lt!50448 () Unit!2517)

(assert (=> d!9816 (= lt!50456 lt!50448)))

(assert (=> d!9816 (isPrefixOf!0 lt!50463 (_2!1806 lt!49645))))

(assert (=> d!9816 (= lt!50448 (lemmaIsPrefixTransitive!0 lt!50463 thiss!1379 (_2!1806 lt!49645)))))

(declare-fun lt!50455 () Unit!2517)

(declare-fun e!22694 () Unit!2517)

(assert (=> d!9816 (= lt!50455 e!22694)))

(declare-fun c!2283 () Bool)

(assert (=> d!9816 (= c!2283 (not (= (size!831 (buf!1159 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!50458 () Unit!2517)

(declare-fun lt!50452 () Unit!2517)

(assert (=> d!9816 (= lt!50458 lt!50452)))

(assert (=> d!9816 (isPrefixOf!0 (_2!1806 lt!49645) (_2!1806 lt!49645))))

(assert (=> d!9816 (= lt!50452 (lemmaIsPrefixRefl!0 (_2!1806 lt!49645)))))

(declare-fun lt!50445 () Unit!2517)

(declare-fun lt!50461 () Unit!2517)

(assert (=> d!9816 (= lt!50445 lt!50461)))

(assert (=> d!9816 (= lt!50461 (lemmaIsPrefixRefl!0 (_2!1806 lt!49645)))))

(declare-fun lt!50457 () Unit!2517)

(declare-fun lt!50462 () Unit!2517)

(assert (=> d!9816 (= lt!50457 lt!50462)))

(assert (=> d!9816 (isPrefixOf!0 lt!50463 lt!50463)))

(assert (=> d!9816 (= lt!50462 (lemmaIsPrefixRefl!0 lt!50463))))

(declare-fun lt!50447 () Unit!2517)

(declare-fun lt!50450 () Unit!2517)

(assert (=> d!9816 (= lt!50447 lt!50450)))

(assert (=> d!9816 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!9816 (= lt!50450 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!9816 (= lt!50463 (BitStream!1455 (buf!1159 (_2!1806 lt!49645)) (currentByte!2526 thiss!1379) (currentBit!2521 thiss!1379)))))

(assert (=> d!9816 (isPrefixOf!0 thiss!1379 (_2!1806 lt!49645))))

(assert (=> d!9816 (= (reader!0 thiss!1379 (_2!1806 lt!49645)) lt!50454)))

(declare-fun b!34233 () Bool)

(declare-fun res!29292 () Bool)

(assert (=> b!34233 (=> (not res!29292) (not e!22695))))

(assert (=> b!34233 (= res!29292 (isPrefixOf!0 (_2!1807 lt!50454) (_2!1806 lt!49645)))))

(declare-fun b!34234 () Bool)

(declare-fun res!29290 () Bool)

(assert (=> b!34234 (=> (not res!29290) (not e!22695))))

(assert (=> b!34234 (= res!29290 (isPrefixOf!0 (_1!1807 lt!50454) thiss!1379))))

(declare-fun b!34235 () Bool)

(declare-fun Unit!2538 () Unit!2517)

(assert (=> b!34235 (= e!22694 Unit!2538)))

(declare-fun b!34236 () Bool)

(declare-fun lt!50460 () Unit!2517)

(assert (=> b!34236 (= e!22694 lt!50460)))

(declare-fun lt!50446 () (_ BitVec 64))

(assert (=> b!34236 (= lt!50446 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!50459 () (_ BitVec 64))

(assert (=> b!34236 (= lt!50459 (bitIndex!0 (size!831 (buf!1159 thiss!1379)) (currentByte!2526 thiss!1379) (currentBit!2521 thiss!1379)))))

(assert (=> b!34236 (= lt!50460 (arrayBitRangesEqSymmetric!0 (buf!1159 thiss!1379) (buf!1159 (_2!1806 lt!49645)) lt!50446 lt!50459))))

(assert (=> b!34236 (arrayBitRangesEq!0 (buf!1159 (_2!1806 lt!49645)) (buf!1159 thiss!1379) lt!50446 lt!50459)))

(assert (= (and d!9816 c!2283) b!34236))

(assert (= (and d!9816 (not c!2283)) b!34235))

(assert (= (and d!9816 res!29291) b!34234))

(assert (= (and b!34234 res!29290) b!34233))

(assert (= (and b!34233 res!29292) b!34232))

(declare-fun m!51033 () Bool)

(assert (=> d!9816 m!51033))

(assert (=> d!9816 m!50369))

(declare-fun m!51035 () Bool)

(assert (=> d!9816 m!51035))

(assert (=> d!9816 m!50333))

(declare-fun m!51037 () Bool)

(assert (=> d!9816 m!51037))

(assert (=> d!9816 m!50367))

(declare-fun m!51039 () Bool)

(assert (=> d!9816 m!51039))

(assert (=> d!9816 m!51003))

(declare-fun m!51041 () Bool)

(assert (=> d!9816 m!51041))

(declare-fun m!51043 () Bool)

(assert (=> d!9816 m!51043))

(assert (=> d!9816 m!51009))

(declare-fun m!51045 () Bool)

(assert (=> b!34233 m!51045))

(declare-fun m!51047 () Bool)

(assert (=> b!34232 m!51047))

(assert (=> b!34232 m!50395))

(assert (=> b!34232 m!50371))

(assert (=> b!34236 m!50371))

(declare-fun m!51049 () Bool)

(assert (=> b!34236 m!51049))

(declare-fun m!51051 () Bool)

(assert (=> b!34236 m!51051))

(declare-fun m!51053 () Bool)

(assert (=> b!34234 m!51053))

(assert (=> b!33885 d!9816))

(declare-fun b!34237 () Bool)

(declare-fun e!22696 () tuple2!3450)

(assert (=> b!34237 (= e!22696 (tuple2!3451 Nil!425 (_1!1807 lt!49655)))))

(declare-fun b!34239 () Bool)

(declare-fun e!22697 () Bool)

(declare-fun lt!50466 () List!428)

(assert (=> b!34239 (= e!22697 (isEmpty!91 lt!50466))))

(declare-fun d!9818 () Bool)

(assert (=> d!9818 e!22697))

(declare-fun c!2285 () Bool)

(assert (=> d!9818 (= c!2285 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9818 (= lt!50466 (_1!1812 e!22696))))

(declare-fun c!2284 () Bool)

(assert (=> d!9818 (= c!2284 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9818 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9818 (= (bitStreamReadBitsIntoList!0 (_2!1806 lt!49645) (_1!1807 lt!49655) (bvsub to!314 i!635)) lt!50466)))

(declare-fun lt!50464 () tuple2!3452)

(declare-fun lt!50465 () (_ BitVec 64))

(declare-fun b!34238 () Bool)

(assert (=> b!34238 (= e!22696 (tuple2!3451 (Cons!424 (_1!1813 lt!50464) (bitStreamReadBitsIntoList!0 (_2!1806 lt!49645) (_2!1813 lt!50464) (bvsub (bvsub to!314 i!635) lt!50465))) (_2!1813 lt!50464)))))

(assert (=> b!34238 (= lt!50464 (readBit!0 (_1!1807 lt!49655)))))

(assert (=> b!34238 (= lt!50465 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!34240 () Bool)

(assert (=> b!34240 (= e!22697 (> (length!154 lt!50466) 0))))

(assert (= (and d!9818 c!2284) b!34237))

(assert (= (and d!9818 (not c!2284)) b!34238))

(assert (= (and d!9818 c!2285) b!34239))

(assert (= (and d!9818 (not c!2285)) b!34240))

(declare-fun m!51055 () Bool)

(assert (=> b!34239 m!51055))

(declare-fun m!51057 () Bool)

(assert (=> b!34238 m!51057))

(declare-fun m!51059 () Bool)

(assert (=> b!34238 m!51059))

(declare-fun m!51061 () Bool)

(assert (=> b!34240 m!51061))

(assert (=> b!33885 d!9818))

(declare-fun d!9820 () Bool)

(assert (=> d!9820 (validate_offset_bits!1 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49645)))) ((_ sign_extend 32) (currentByte!2526 (_2!1806 lt!49641))) ((_ sign_extend 32) (currentBit!2521 (_2!1806 lt!49641))) lt!49637)))

(declare-fun lt!50467 () Unit!2517)

(assert (=> d!9820 (= lt!50467 (choose!9 (_2!1806 lt!49641) (buf!1159 (_2!1806 lt!49645)) lt!49637 (BitStream!1455 (buf!1159 (_2!1806 lt!49645)) (currentByte!2526 (_2!1806 lt!49641)) (currentBit!2521 (_2!1806 lt!49641)))))))

(assert (=> d!9820 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1806 lt!49641) (buf!1159 (_2!1806 lt!49645)) lt!49637) lt!50467)))

(declare-fun bs!2684 () Bool)

(assert (= bs!2684 d!9820))

(assert (=> bs!2684 m!50327))

(declare-fun m!51063 () Bool)

(assert (=> bs!2684 m!51063))

(assert (=> b!33885 d!9820))

(declare-fun d!9822 () Bool)

(assert (=> d!9822 (= (bitAt!0 (buf!1159 (_1!1807 lt!49650)) lt!49654) (not (= (bvand ((_ sign_extend 24) (select (arr!1306 (buf!1159 (_1!1807 lt!49650))) ((_ extract 31 0) (bvsdiv lt!49654 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!49654 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2685 () Bool)

(assert (= bs!2685 d!9822))

(declare-fun m!51065 () Bool)

(assert (=> bs!2685 m!51065))

(assert (=> bs!2685 m!50431))

(assert (=> b!33896 d!9822))

(declare-fun d!9824 () Bool)

(assert (=> d!9824 (= (bitAt!0 (buf!1159 (_1!1807 lt!49655)) lt!49654) (not (= (bvand ((_ sign_extend 24) (select (arr!1306 (buf!1159 (_1!1807 lt!49655))) ((_ extract 31 0) (bvsdiv lt!49654 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!49654 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2686 () Bool)

(assert (= bs!2686 d!9824))

(declare-fun m!51067 () Bool)

(assert (=> bs!2686 m!51067))

(assert (=> bs!2686 m!50431))

(assert (=> b!33896 d!9824))

(declare-fun d!9826 () Bool)

(declare-fun e!22698 () Bool)

(assert (=> d!9826 e!22698))

(declare-fun res!29294 () Bool)

(assert (=> d!9826 (=> (not res!29294) (not e!22698))))

(declare-fun lt!50471 () (_ BitVec 64))

(declare-fun lt!50468 () (_ BitVec 64))

(declare-fun lt!50469 () (_ BitVec 64))

(assert (=> d!9826 (= res!29294 (= lt!50468 (bvsub lt!50469 lt!50471)))))

(assert (=> d!9826 (or (= (bvand lt!50469 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!50471 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!50469 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!50469 lt!50471) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9826 (= lt!50471 (remainingBits!0 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49641)))) ((_ sign_extend 32) (currentByte!2526 (_2!1806 lt!49641))) ((_ sign_extend 32) (currentBit!2521 (_2!1806 lt!49641)))))))

(declare-fun lt!50472 () (_ BitVec 64))

(declare-fun lt!50473 () (_ BitVec 64))

(assert (=> d!9826 (= lt!50469 (bvmul lt!50472 lt!50473))))

(assert (=> d!9826 (or (= lt!50472 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!50473 (bvsdiv (bvmul lt!50472 lt!50473) lt!50472)))))

(assert (=> d!9826 (= lt!50473 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9826 (= lt!50472 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49641)))))))

(assert (=> d!9826 (= lt!50468 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2526 (_2!1806 lt!49641))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2521 (_2!1806 lt!49641)))))))

(assert (=> d!9826 (invariant!0 (currentBit!2521 (_2!1806 lt!49641)) (currentByte!2526 (_2!1806 lt!49641)) (size!831 (buf!1159 (_2!1806 lt!49641))))))

(assert (=> d!9826 (= (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!49641))) (currentByte!2526 (_2!1806 lt!49641)) (currentBit!2521 (_2!1806 lt!49641))) lt!50468)))

(declare-fun b!34241 () Bool)

(declare-fun res!29293 () Bool)

(assert (=> b!34241 (=> (not res!29293) (not e!22698))))

(assert (=> b!34241 (= res!29293 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!50468))))

(declare-fun b!34242 () Bool)

(declare-fun lt!50470 () (_ BitVec 64))

(assert (=> b!34242 (= e!22698 (bvsle lt!50468 (bvmul lt!50470 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!34242 (or (= lt!50470 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!50470 #b0000000000000000000000000000000000000000000000000000000000001000) lt!50470)))))

(assert (=> b!34242 (= lt!50470 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49641)))))))

(assert (= (and d!9826 res!29294) b!34241))

(assert (= (and b!34241 res!29293) b!34242))

(declare-fun m!51069 () Bool)

(assert (=> d!9826 m!51069))

(assert (=> d!9826 m!50309))

(assert (=> b!33883 d!9826))

(declare-fun d!9828 () Bool)

(declare-fun res!29297 () Bool)

(declare-fun e!22699 () Bool)

(assert (=> d!9828 (=> (not res!29297) (not e!22699))))

(assert (=> d!9828 (= res!29297 (= (size!831 (buf!1159 thiss!1379)) (size!831 (buf!1159 (_2!1806 lt!49641)))))))

(assert (=> d!9828 (= (isPrefixOf!0 thiss!1379 (_2!1806 lt!49641)) e!22699)))

(declare-fun b!34243 () Bool)

(declare-fun res!29296 () Bool)

(assert (=> b!34243 (=> (not res!29296) (not e!22699))))

(assert (=> b!34243 (= res!29296 (bvsle (bitIndex!0 (size!831 (buf!1159 thiss!1379)) (currentByte!2526 thiss!1379) (currentBit!2521 thiss!1379)) (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!49641))) (currentByte!2526 (_2!1806 lt!49641)) (currentBit!2521 (_2!1806 lt!49641)))))))

(declare-fun b!34244 () Bool)

(declare-fun e!22700 () Bool)

(assert (=> b!34244 (= e!22699 e!22700)))

(declare-fun res!29295 () Bool)

(assert (=> b!34244 (=> res!29295 e!22700)))

(assert (=> b!34244 (= res!29295 (= (size!831 (buf!1159 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!34245 () Bool)

(assert (=> b!34245 (= e!22700 (arrayBitRangesEq!0 (buf!1159 thiss!1379) (buf!1159 (_2!1806 lt!49641)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!831 (buf!1159 thiss!1379)) (currentByte!2526 thiss!1379) (currentBit!2521 thiss!1379))))))

(assert (= (and d!9828 res!29297) b!34243))

(assert (= (and b!34243 res!29296) b!34244))

(assert (= (and b!34244 (not res!29295)) b!34245))

(assert (=> b!34243 m!50371))

(assert (=> b!34243 m!50347))

(assert (=> b!34245 m!50371))

(assert (=> b!34245 m!50371))

(declare-fun m!51071 () Bool)

(assert (=> b!34245 m!51071))

(assert (=> b!33894 d!9828))

(declare-fun d!9830 () Bool)

(assert (=> d!9830 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49641)))) ((_ sign_extend 32) (currentByte!2526 (_2!1806 lt!49641))) ((_ sign_extend 32) (currentBit!2521 (_2!1806 lt!49641))) lt!49637) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49641)))) ((_ sign_extend 32) (currentByte!2526 (_2!1806 lt!49641))) ((_ sign_extend 32) (currentBit!2521 (_2!1806 lt!49641)))) lt!49637))))

(declare-fun bs!2687 () Bool)

(assert (= bs!2687 d!9830))

(assert (=> bs!2687 m!51069))

(assert (=> b!33894 d!9830))

(declare-fun d!9832 () Bool)

(declare-fun e!22703 () Bool)

(assert (=> d!9832 e!22703))

(declare-fun res!29300 () Bool)

(assert (=> d!9832 (=> (not res!29300) (not e!22703))))

(assert (=> d!9832 (= res!29300 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!50476 () Unit!2517)

(declare-fun choose!27 (BitStream!1454 BitStream!1454 (_ BitVec 64) (_ BitVec 64)) Unit!2517)

(assert (=> d!9832 (= lt!50476 (choose!27 thiss!1379 (_2!1806 lt!49641) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!9832 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!9832 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1806 lt!49641) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!50476)))

(declare-fun b!34248 () Bool)

(assert (=> b!34248 (= e!22703 (validate_offset_bits!1 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49641)))) ((_ sign_extend 32) (currentByte!2526 (_2!1806 lt!49641))) ((_ sign_extend 32) (currentBit!2521 (_2!1806 lt!49641))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!9832 res!29300) b!34248))

(declare-fun m!51073 () Bool)

(assert (=> d!9832 m!51073))

(declare-fun m!51075 () Bool)

(assert (=> b!34248 m!51075))

(assert (=> b!33894 d!9832))

(declare-fun b!34266 () Bool)

(declare-fun res!29318 () Bool)

(declare-fun e!22713 () Bool)

(assert (=> b!34266 (=> (not res!29318) (not e!22713))))

(declare-fun lt!50507 () tuple2!3438)

(assert (=> b!34266 (= res!29318 (isPrefixOf!0 thiss!1379 (_2!1806 lt!50507)))))

(declare-fun b!34267 () Bool)

(declare-fun e!22714 () Bool)

(declare-fun e!22715 () Bool)

(assert (=> b!34267 (= e!22714 e!22715)))

(declare-fun res!29321 () Bool)

(assert (=> b!34267 (=> (not res!29321) (not e!22715))))

(declare-datatypes ((tuple2!3464 0))(
  ( (tuple2!3465 (_1!1819 BitStream!1454) (_2!1819 Bool)) )
))
(declare-fun lt!50508 () tuple2!3464)

(declare-fun lt!50503 () tuple2!3438)

(declare-fun lt!50506 () Bool)

(assert (=> b!34267 (= res!29321 (and (= (_2!1819 lt!50508) lt!50506) (= (_1!1819 lt!50508) (_2!1806 lt!50503))))))

(declare-fun readBitPure!0 (BitStream!1454) tuple2!3464)

(declare-fun readerFrom!0 (BitStream!1454 (_ BitVec 32) (_ BitVec 32)) BitStream!1454)

(assert (=> b!34267 (= lt!50508 (readBitPure!0 (readerFrom!0 (_2!1806 lt!50503) (currentBit!2521 thiss!1379) (currentByte!2526 thiss!1379))))))

(declare-fun b!34268 () Bool)

(declare-fun e!22712 () Bool)

(declare-fun lt!50510 () tuple2!3464)

(assert (=> b!34268 (= e!22712 (= (bitIndex!0 (size!831 (buf!1159 (_1!1819 lt!50510))) (currentByte!2526 (_1!1819 lt!50510)) (currentBit!2521 (_1!1819 lt!50510))) (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!50507))) (currentByte!2526 (_2!1806 lt!50507)) (currentBit!2521 (_2!1806 lt!50507)))))))

(declare-fun b!34269 () Bool)

(declare-fun res!29323 () Bool)

(assert (=> b!34269 (=> (not res!29323) (not e!22714))))

(assert (=> b!34269 (= res!29323 (= (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!50503))) (currentByte!2526 (_2!1806 lt!50503)) (currentBit!2521 (_2!1806 lt!50503))) (bvadd (bitIndex!0 (size!831 (buf!1159 thiss!1379)) (currentByte!2526 thiss!1379) (currentBit!2521 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!34270 () Bool)

(declare-fun res!29320 () Bool)

(assert (=> b!34270 (=> (not res!29320) (not e!22714))))

(assert (=> b!34270 (= res!29320 (isPrefixOf!0 thiss!1379 (_2!1806 lt!50503)))))

(declare-fun d!9834 () Bool)

(assert (=> d!9834 e!22713))

(declare-fun res!29324 () Bool)

(assert (=> d!9834 (=> (not res!29324) (not e!22713))))

(assert (=> d!9834 (= res!29324 (= (size!831 (buf!1159 (_2!1806 lt!50507))) (size!831 (buf!1159 thiss!1379))))))

(declare-fun lt!50509 () (_ BitVec 8))

(declare-fun lt!50504 () array!1878)

(assert (=> d!9834 (= lt!50509 (select (arr!1306 lt!50504) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!9834 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!831 lt!50504)))))

(assert (=> d!9834 (= lt!50504 (array!1879 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!50501 () tuple2!3438)

(assert (=> d!9834 (= lt!50507 (tuple2!3439 (_1!1806 lt!50501) (_2!1806 lt!50501)))))

(assert (=> d!9834 (= lt!50501 lt!50503)))

(assert (=> d!9834 e!22714))

(declare-fun res!29319 () Bool)

(assert (=> d!9834 (=> (not res!29319) (not e!22714))))

(assert (=> d!9834 (= res!29319 (= (size!831 (buf!1159 thiss!1379)) (size!831 (buf!1159 (_2!1806 lt!50503)))))))

(declare-fun appendBit!0 (BitStream!1454 Bool) tuple2!3438)

(assert (=> d!9834 (= lt!50503 (appendBit!0 thiss!1379 lt!50506))))

(assert (=> d!9834 (= lt!50506 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1306 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!9834 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!9834 (= (appendBitFromByte!0 thiss!1379 (select (arr!1306 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!50507)))

(declare-fun b!34271 () Bool)

(declare-fun res!29317 () Bool)

(assert (=> b!34271 (=> (not res!29317) (not e!22713))))

(declare-fun lt!50512 () (_ BitVec 64))

(declare-fun lt!50505 () (_ BitVec 64))

(assert (=> b!34271 (= res!29317 (= (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!50507))) (currentByte!2526 (_2!1806 lt!50507)) (currentBit!2521 (_2!1806 lt!50507))) (bvadd lt!50512 lt!50505)))))

(assert (=> b!34271 (or (not (= (bvand lt!50512 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!50505 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!50512 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!50512 lt!50505) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34271 (= lt!50505 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!34271 (= lt!50512 (bitIndex!0 (size!831 (buf!1159 thiss!1379)) (currentByte!2526 thiss!1379) (currentBit!2521 thiss!1379)))))

(declare-fun b!34272 () Bool)

(assert (=> b!34272 (= e!22713 e!22712)))

(declare-fun res!29322 () Bool)

(assert (=> b!34272 (=> (not res!29322) (not e!22712))))

(assert (=> b!34272 (= res!29322 (and (= (_2!1819 lt!50510) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1306 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!50509)) #b00000000000000000000000000000000))) (= (_1!1819 lt!50510) (_2!1806 lt!50507))))))

(declare-fun lt!50502 () tuple2!3454)

(declare-fun lt!50511 () BitStream!1454)

(assert (=> b!34272 (= lt!50502 (readBits!0 lt!50511 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!34272 (= lt!50510 (readBitPure!0 lt!50511))))

(assert (=> b!34272 (= lt!50511 (readerFrom!0 (_2!1806 lt!50507) (currentBit!2521 thiss!1379) (currentByte!2526 thiss!1379)))))

(declare-fun b!34273 () Bool)

(assert (=> b!34273 (= e!22715 (= (bitIndex!0 (size!831 (buf!1159 (_1!1819 lt!50508))) (currentByte!2526 (_1!1819 lt!50508)) (currentBit!2521 (_1!1819 lt!50508))) (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!50503))) (currentByte!2526 (_2!1806 lt!50503)) (currentBit!2521 (_2!1806 lt!50503)))))))

(assert (= (and d!9834 res!29319) b!34269))

(assert (= (and b!34269 res!29323) b!34270))

(assert (= (and b!34270 res!29320) b!34267))

(assert (= (and b!34267 res!29321) b!34273))

(assert (= (and d!9834 res!29324) b!34271))

(assert (= (and b!34271 res!29317) b!34266))

(assert (= (and b!34266 res!29318) b!34272))

(assert (= (and b!34272 res!29322) b!34268))

(declare-fun m!51077 () Bool)

(assert (=> b!34267 m!51077))

(assert (=> b!34267 m!51077))

(declare-fun m!51079 () Bool)

(assert (=> b!34267 m!51079))

(declare-fun m!51081 () Bool)

(assert (=> b!34266 m!51081))

(declare-fun m!51083 () Bool)

(assert (=> b!34273 m!51083))

(declare-fun m!51085 () Bool)

(assert (=> b!34273 m!51085))

(declare-fun m!51087 () Bool)

(assert (=> b!34268 m!51087))

(declare-fun m!51089 () Bool)

(assert (=> b!34268 m!51089))

(assert (=> b!34271 m!51089))

(assert (=> b!34271 m!50371))

(declare-fun m!51091 () Bool)

(assert (=> b!34272 m!51091))

(declare-fun m!51093 () Bool)

(assert (=> b!34272 m!51093))

(declare-fun m!51095 () Bool)

(assert (=> b!34272 m!51095))

(declare-fun m!51097 () Bool)

(assert (=> b!34270 m!51097))

(assert (=> b!34269 m!51085))

(assert (=> b!34269 m!50371))

(declare-fun m!51099 () Bool)

(assert (=> d!9834 m!51099))

(declare-fun m!51101 () Bool)

(assert (=> d!9834 m!51101))

(assert (=> d!9834 m!50437))

(assert (=> b!33894 d!9834))

(declare-fun d!9836 () Bool)

(assert (=> d!9836 (= (array_inv!780 srcBuffer!2) (bvsge (size!831 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6942 d!9836))

(declare-fun d!9838 () Bool)

(assert (=> d!9838 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2521 thiss!1379) (currentByte!2526 thiss!1379) (size!831 (buf!1159 thiss!1379))))))

(declare-fun bs!2688 () Bool)

(assert (= bs!2688 d!9838))

(assert (=> bs!2688 m!50477))

(assert (=> start!6942 d!9838))

(declare-fun d!9840 () Bool)

(declare-fun e!22716 () Bool)

(assert (=> d!9840 e!22716))

(declare-fun res!29326 () Bool)

(assert (=> d!9840 (=> (not res!29326) (not e!22716))))

(declare-fun lt!50513 () (_ BitVec 64))

(declare-fun lt!50514 () (_ BitVec 64))

(declare-fun lt!50516 () (_ BitVec 64))

(assert (=> d!9840 (= res!29326 (= lt!50513 (bvsub lt!50514 lt!50516)))))

(assert (=> d!9840 (or (= (bvand lt!50514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!50516 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!50514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!50514 lt!50516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9840 (= lt!50516 (remainingBits!0 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49645)))) ((_ sign_extend 32) (currentByte!2526 (_2!1806 lt!49645))) ((_ sign_extend 32) (currentBit!2521 (_2!1806 lt!49645)))))))

(declare-fun lt!50517 () (_ BitVec 64))

(declare-fun lt!50518 () (_ BitVec 64))

(assert (=> d!9840 (= lt!50514 (bvmul lt!50517 lt!50518))))

(assert (=> d!9840 (or (= lt!50517 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!50518 (bvsdiv (bvmul lt!50517 lt!50518) lt!50517)))))

(assert (=> d!9840 (= lt!50518 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9840 (= lt!50517 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49645)))))))

(assert (=> d!9840 (= lt!50513 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2526 (_2!1806 lt!49645))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2521 (_2!1806 lt!49645)))))))

(assert (=> d!9840 (invariant!0 (currentBit!2521 (_2!1806 lt!49645)) (currentByte!2526 (_2!1806 lt!49645)) (size!831 (buf!1159 (_2!1806 lt!49645))))))

(assert (=> d!9840 (= (bitIndex!0 (size!831 (buf!1159 (_2!1806 lt!49645))) (currentByte!2526 (_2!1806 lt!49645)) (currentBit!2521 (_2!1806 lt!49645))) lt!50513)))

(declare-fun b!34274 () Bool)

(declare-fun res!29325 () Bool)

(assert (=> b!34274 (=> (not res!29325) (not e!22716))))

(assert (=> b!34274 (= res!29325 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!50513))))

(declare-fun b!34275 () Bool)

(declare-fun lt!50515 () (_ BitVec 64))

(assert (=> b!34275 (= e!22716 (bvsle lt!50513 (bvmul lt!50515 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!34275 (or (= lt!50515 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!50515 #b0000000000000000000000000000000000000000000000000000000000001000) lt!50515)))))

(assert (=> b!34275 (= lt!50515 ((_ sign_extend 32) (size!831 (buf!1159 (_2!1806 lt!49645)))))))

(assert (= (and d!9840 res!29326) b!34274))

(assert (= (and b!34274 res!29325) b!34275))

(declare-fun m!51103 () Bool)

(assert (=> d!9840 m!51103))

(assert (=> d!9840 m!50311))

(assert (=> b!33884 d!9840))

(declare-fun d!9842 () Bool)

(assert (=> d!9842 (= (head!265 (byteArrayBitContentToList!0 (_2!1806 lt!49645) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!543 (byteArrayBitContentToList!0 (_2!1806 lt!49645) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!33882 d!9842))

(declare-fun d!9844 () Bool)

(declare-fun c!2286 () Bool)

(assert (=> d!9844 (= c!2286 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22717 () List!428)

(assert (=> d!9844 (= (byteArrayBitContentToList!0 (_2!1806 lt!49645) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!22717)))

(declare-fun b!34276 () Bool)

(assert (=> b!34276 (= e!22717 Nil!425)))

(declare-fun b!34277 () Bool)

(assert (=> b!34277 (= e!22717 (Cons!424 (not (= (bvand ((_ sign_extend 24) (select (arr!1306 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1806 lt!49645) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!9844 c!2286) b!34276))

(assert (= (and d!9844 (not c!2286)) b!34277))

(assert (=> b!34277 m!50381))

(assert (=> b!34277 m!50437))

(declare-fun m!51105 () Bool)

(assert (=> b!34277 m!51105))

(assert (=> b!33882 d!9844))

(declare-fun d!9846 () Bool)

(assert (=> d!9846 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1306 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2689 () Bool)

(assert (= bs!2689 d!9846))

(assert (=> bs!2689 m!50381))

(assert (=> bs!2689 m!50437))

(assert (=> b!33882 d!9846))

(declare-fun d!9848 () Bool)

(assert (=> d!9848 (= (head!265 lt!49644) (h!543 lt!49644))))

(assert (=> b!33893 d!9848))

(declare-fun d!9850 () Bool)

(assert (=> d!9850 (= (tail!145 lt!49644) (t!1178 lt!49644))))

(assert (=> b!33891 d!9850))

(declare-fun d!9852 () Bool)

(declare-fun e!22720 () Bool)

(assert (=> d!9852 e!22720))

(declare-fun res!29329 () Bool)

(assert (=> d!9852 (=> (not res!29329) (not e!22720))))

(declare-fun lt!50524 () (_ BitVec 64))

(assert (=> d!9852 (= res!29329 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!50524 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!50524) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!9852 (= lt!50524 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!50523 () Unit!2517)

(declare-fun choose!42 (BitStream!1454 BitStream!1454 BitStream!1454 BitStream!1454 (_ BitVec 64) List!428) Unit!2517)

(assert (=> d!9852 (= lt!50523 (choose!42 (_2!1806 lt!49645) (_2!1806 lt!49645) (_1!1807 lt!49655) (_1!1807 lt!49650) (bvsub to!314 i!635) lt!49644))))

(assert (=> d!9852 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9852 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1806 lt!49645) (_2!1806 lt!49645) (_1!1807 lt!49655) (_1!1807 lt!49650) (bvsub to!314 i!635) lt!49644) lt!50523)))

(declare-fun b!34280 () Bool)

(assert (=> b!34280 (= e!22720 (= (bitStreamReadBitsIntoList!0 (_2!1806 lt!49645) (_1!1807 lt!49650) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!145 lt!49644)))))

(assert (= (and d!9852 res!29329) b!34280))

(declare-fun m!51107 () Bool)

(assert (=> d!9852 m!51107))

(declare-fun m!51109 () Bool)

(assert (=> b!34280 m!51109))

(assert (=> b!34280 m!50361))

(assert (=> b!33891 d!9852))

(declare-fun d!9854 () Bool)

(assert (=> d!9854 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!831 (buf!1159 thiss!1379))) ((_ sign_extend 32) (currentByte!2526 thiss!1379)) ((_ sign_extend 32) (currentBit!2521 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!831 (buf!1159 thiss!1379))) ((_ sign_extend 32) (currentByte!2526 thiss!1379)) ((_ sign_extend 32) (currentBit!2521 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2690 () Bool)

(assert (= bs!2690 d!9854))

(assert (=> bs!2690 m!50475))

(assert (=> b!33892 d!9854))

(push 1)

(assert (not b!34230))

(assert (not b!34238))

(assert (not b!34231))

(assert (not b!34268))

(assert (not d!9808))

(assert (not b!34271))

(assert (not b!34236))

(assert (not b!34218))

(assert (not bm!421))

(assert (not b!34232))

(assert (not b!34240))

(assert (not b!34277))

(assert (not b!33990))

(assert (not b!34221))

(assert (not b!33948))

(assert (not b!34272))

(assert (not b!34267))

(assert (not b!33984))

(assert (not d!9694))

(assert (not b!33946))

(assert (not b!34270))

(assert (not b!34225))

(assert (not d!9832))

(assert (not d!9716))

(assert (not b!33947))

(assert (not b!33955))

(assert (not b!34216))

(assert (not b!34239))

(assert (not b!34224))

(assert (not b!34273))

(assert (not d!9802))

(assert (not b!34018))

(assert (not b!33930))

(assert (not b!34215))

(assert (not b!34220))

(assert (not d!9718))

(assert (not d!9826))

(assert (not d!9690))

(assert (not d!9812))

(assert (not b!33957))

(assert (not b!34233))

(assert (not b!34227))

(assert (not d!9852))

(assert (not d!9672))

(assert (not b!34234))

(assert (not b!34229))

(assert (not b!34223))

(assert (not d!9820))

(assert (not d!9834))

(assert (not b!34019))

(assert (not b!34021))

(assert (not d!9670))

(assert (not d!9806))

(assert (not d!9854))

(assert (not b!34243))

(assert (not d!9840))

(assert (not d!9714))

(assert (not b!34217))

(assert (not b!34266))

(assert (not b!34280))

(assert (not d!9814))

(assert (not b!34245))

(assert (not d!9816))

(assert (not d!9700))

(assert (not b!33986))

(assert (not b!34017))

(assert (not b!33992))

(assert (not d!9838))

(assert (not b!34269))

(assert (not b!34248))

(assert (not d!9830))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

