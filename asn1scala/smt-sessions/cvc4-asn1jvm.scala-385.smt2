; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9768 () Bool)

(assert start!9768)

(declare-datatypes ((array!2315 0))(
  ( (array!2316 (arr!1576 (Array (_ BitVec 32) (_ BitVec 8))) (size!1050 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1820 0))(
  ( (BitStream!1821 (buf!1402 array!2315) (currentByte!2919 (_ BitVec 32)) (currentBit!2914 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3418 0))(
  ( (Unit!3419) )
))
(declare-datatypes ((tuple2!4604 0))(
  ( (tuple2!4605 (_1!2401 Unit!3418) (_2!2401 BitStream!1820)) )
))
(declare-fun lt!75814 () tuple2!4604)

(declare-fun e!32323 () Bool)

(declare-fun lt!75808 () Bool)

(declare-fun lt!75810 () (_ BitVec 64))

(declare-fun b!48843 () Bool)

(declare-fun bitAt!0 (array!2315 (_ BitVec 64)) Bool)

(assert (=> b!48843 (= e!32323 (= (bitAt!0 (buf!1402 (_2!2401 lt!75814)) lt!75810) lt!75808))))

(declare-fun b!48844 () Bool)

(declare-fun e!32322 () Bool)

(assert (=> b!48844 (= e!32322 e!32323)))

(declare-fun res!41022 () Bool)

(assert (=> b!48844 (=> res!41022 e!32323)))

(declare-fun srcBuffer!2 () array!2315)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!75819 () tuple2!4604)

(declare-datatypes ((List!551 0))(
  ( (Nil!548) (Cons!547 (h!666 Bool) (t!1301 List!551)) )
))
(declare-fun head!370 (List!551) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1820 array!2315 (_ BitVec 64) (_ BitVec 64)) List!551)

(assert (=> b!48844 (= res!41022 (not (= (head!370 (byteArrayBitContentToList!0 (_2!2401 lt!75819) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!75808)))))

(assert (=> b!48844 (= lt!75808 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!48845 () Bool)

(declare-fun e!32314 () Bool)

(declare-fun e!32315 () Bool)

(assert (=> b!48845 (= e!32314 e!32315)))

(declare-fun res!41016 () Bool)

(assert (=> b!48845 (=> res!41016 e!32315)))

(declare-fun isPrefixOf!0 (BitStream!1820 BitStream!1820) Bool)

(assert (=> b!48845 (= res!41016 (not (isPrefixOf!0 (_2!2401 lt!75814) (_2!2401 lt!75819))))))

(declare-fun thiss!1379 () BitStream!1820)

(assert (=> b!48845 (isPrefixOf!0 thiss!1379 (_2!2401 lt!75819))))

(declare-fun lt!75812 () Unit!3418)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1820 BitStream!1820 BitStream!1820) Unit!3418)

(assert (=> b!48845 (= lt!75812 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2401 lt!75814) (_2!2401 lt!75819)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1820 array!2315 (_ BitVec 64) (_ BitVec 64)) tuple2!4604)

(assert (=> b!48845 (= lt!75819 (appendBitsMSBFirstLoop!0 (_2!2401 lt!75814) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!32319 () Bool)

(assert (=> b!48845 e!32319))

(declare-fun res!41033 () Bool)

(assert (=> b!48845 (=> (not res!41033) (not e!32319))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!48845 (= res!41033 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))) ((_ sign_extend 32) (currentByte!2919 thiss!1379)) ((_ sign_extend 32) (currentBit!2914 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!75813 () Unit!3418)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1820 array!2315 (_ BitVec 64)) Unit!3418)

(assert (=> b!48845 (= lt!75813 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1402 (_2!2401 lt!75814)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4606 0))(
  ( (tuple2!4607 (_1!2402 BitStream!1820) (_2!2402 BitStream!1820)) )
))
(declare-fun lt!75822 () tuple2!4606)

(declare-fun reader!0 (BitStream!1820 BitStream!1820) tuple2!4606)

(assert (=> b!48845 (= lt!75822 (reader!0 thiss!1379 (_2!2401 lt!75814)))))

(declare-fun b!48846 () Bool)

(declare-fun e!32316 () Bool)

(declare-fun e!32310 () Bool)

(assert (=> b!48846 (= e!32316 e!32310)))

(declare-fun res!41024 () Bool)

(assert (=> b!48846 (=> res!41024 e!32310)))

(declare-fun lt!75818 () List!551)

(declare-fun lt!75809 () List!551)

(assert (=> b!48846 (= res!41024 (not (= lt!75818 lt!75809)))))

(assert (=> b!48846 (= lt!75809 lt!75818)))

(declare-fun lt!75806 () List!551)

(declare-fun tail!237 (List!551) List!551)

(assert (=> b!48846 (= lt!75818 (tail!237 lt!75806))))

(declare-fun lt!75811 () Unit!3418)

(declare-fun lt!75804 () tuple2!4606)

(declare-fun lt!75823 () tuple2!4606)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1820 BitStream!1820 BitStream!1820 BitStream!1820 (_ BitVec 64) List!551) Unit!3418)

(assert (=> b!48846 (= lt!75811 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2401 lt!75819) (_2!2401 lt!75819) (_1!2402 lt!75823) (_1!2402 lt!75804) (bvsub to!314 i!635) lt!75806))))

(declare-fun lt!75807 () (_ BitVec 64))

(declare-fun b!48847 () Bool)

(declare-fun e!32312 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!48847 (= e!32312 (= lt!75807 (bvsub (bvsub (bvadd (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!48848 () Bool)

(declare-fun e!32311 () Bool)

(assert (=> b!48848 (= e!32311 e!32316)))

(declare-fun res!41021 () Bool)

(assert (=> b!48848 (=> res!41021 e!32316)))

(assert (=> b!48848 (= res!41021 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!75820 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1820 BitStream!1820 (_ BitVec 64)) List!551)

(assert (=> b!48848 (= lt!75809 (bitStreamReadBitsIntoList!0 (_2!2401 lt!75819) (_1!2402 lt!75804) lt!75820))))

(assert (=> b!48848 (= lt!75806 (bitStreamReadBitsIntoList!0 (_2!2401 lt!75819) (_1!2402 lt!75823) (bvsub to!314 i!635)))))

(assert (=> b!48848 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75819)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))) lt!75820)))

(declare-fun lt!75805 () Unit!3418)

(assert (=> b!48848 (= lt!75805 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2401 lt!75814) (buf!1402 (_2!2401 lt!75819)) lt!75820))))

(assert (=> b!48848 (= lt!75804 (reader!0 (_2!2401 lt!75814) (_2!2401 lt!75819)))))

(assert (=> b!48848 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75819)))) ((_ sign_extend 32) (currentByte!2919 thiss!1379)) ((_ sign_extend 32) (currentBit!2914 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!75815 () Unit!3418)

(assert (=> b!48848 (= lt!75815 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1402 (_2!2401 lt!75819)) (bvsub to!314 i!635)))))

(assert (=> b!48848 (= lt!75823 (reader!0 thiss!1379 (_2!2401 lt!75819)))))

(declare-fun b!48849 () Bool)

(declare-fun res!41026 () Bool)

(declare-fun e!32320 () Bool)

(assert (=> b!48849 (=> (not res!41026) (not e!32320))))

(assert (=> b!48849 (= res!41026 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 thiss!1379))) ((_ sign_extend 32) (currentByte!2919 thiss!1379)) ((_ sign_extend 32) (currentBit!2914 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!48851 () Bool)

(assert (=> b!48851 (= e!32310 e!32322)))

(declare-fun res!41017 () Bool)

(assert (=> b!48851 (=> res!41017 e!32322)))

(declare-fun lt!75821 () Bool)

(assert (=> b!48851 (= res!41017 (not (= lt!75821 (bitAt!0 (buf!1402 (_1!2402 lt!75804)) lt!75810))))))

(assert (=> b!48851 (= lt!75821 (bitAt!0 (buf!1402 (_1!2402 lt!75823)) lt!75810))))

(declare-fun b!48852 () Bool)

(declare-fun e!32317 () Bool)

(assert (=> b!48852 (= e!32317 e!32314)))

(declare-fun res!41031 () Bool)

(assert (=> b!48852 (=> res!41031 e!32314)))

(assert (=> b!48852 (= res!41031 (not (isPrefixOf!0 thiss!1379 (_2!2401 lt!75814))))))

(assert (=> b!48852 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))) lt!75820)))

(assert (=> b!48852 (= lt!75820 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!75817 () Unit!3418)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1820 BitStream!1820 (_ BitVec 64) (_ BitVec 64)) Unit!3418)

(assert (=> b!48852 (= lt!75817 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2401 lt!75814) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1820 (_ BitVec 8) (_ BitVec 32)) tuple2!4604)

(assert (=> b!48852 (= lt!75814 (appendBitFromByte!0 thiss!1379 (select (arr!1576 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!48853 () Bool)

(declare-fun res!41028 () Bool)

(assert (=> b!48853 (=> res!41028 e!32311)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!48853 (= res!41028 (not (invariant!0 (currentBit!2914 (_2!2401 lt!75814)) (currentByte!2919 (_2!2401 lt!75814)) (size!1050 (buf!1402 (_2!2401 lt!75819))))))))

(declare-fun b!48854 () Bool)

(assert (=> b!48854 (= e!32319 (= (head!370 (byteArrayBitContentToList!0 (_2!2401 lt!75814) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!370 (bitStreamReadBitsIntoList!0 (_2!2401 lt!75814) (_1!2402 lt!75822) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!48855 () Bool)

(declare-fun res!41025 () Bool)

(declare-fun e!32321 () Bool)

(assert (=> b!48855 (=> res!41025 e!32321)))

(assert (=> b!48855 (= res!41025 (not (= (size!1050 (buf!1402 thiss!1379)) (size!1050 (buf!1402 (_2!2401 lt!75819))))))))

(declare-fun b!48856 () Bool)

(assert (=> b!48856 (= e!32315 e!32321)))

(declare-fun res!41032 () Bool)

(assert (=> b!48856 (=> res!41032 e!32321)))

(assert (=> b!48856 (= res!41032 (not (= lt!75807 (bvsub (bvadd lt!75810 to!314) i!635))))))

(assert (=> b!48856 (= lt!75807 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75819))) (currentByte!2919 (_2!2401 lt!75819)) (currentBit!2914 (_2!2401 lt!75819))))))

(declare-fun b!48857 () Bool)

(declare-fun res!41029 () Bool)

(assert (=> b!48857 (=> res!41029 e!32322)))

(assert (=> b!48857 (= res!41029 (not (= (head!370 lt!75806) lt!75821)))))

(declare-fun b!48858 () Bool)

(declare-fun res!41030 () Bool)

(assert (=> b!48858 (=> res!41030 e!32316)))

(declare-fun length!246 (List!551) Int)

(assert (=> b!48858 (= res!41030 (<= (length!246 lt!75806) 0))))

(declare-fun res!41018 () Bool)

(assert (=> start!9768 (=> (not res!41018) (not e!32320))))

(assert (=> start!9768 (= res!41018 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1050 srcBuffer!2))))))))

(assert (=> start!9768 e!32320))

(assert (=> start!9768 true))

(declare-fun array_inv!963 (array!2315) Bool)

(assert (=> start!9768 (array_inv!963 srcBuffer!2)))

(declare-fun e!32324 () Bool)

(declare-fun inv!12 (BitStream!1820) Bool)

(assert (=> start!9768 (and (inv!12 thiss!1379) e!32324)))

(declare-fun b!48850 () Bool)

(declare-fun res!41034 () Bool)

(assert (=> b!48850 (=> res!41034 e!32311)))

(assert (=> b!48850 (= res!41034 (not (invariant!0 (currentBit!2914 (_2!2401 lt!75814)) (currentByte!2919 (_2!2401 lt!75814)) (size!1050 (buf!1402 (_2!2401 lt!75814))))))))

(declare-fun b!48859 () Bool)

(assert (=> b!48859 (= e!32324 (array_inv!963 (buf!1402 thiss!1379)))))

(declare-fun b!48860 () Bool)

(assert (=> b!48860 (= e!32320 (not e!32317))))

(declare-fun res!41020 () Bool)

(assert (=> b!48860 (=> res!41020 e!32317)))

(assert (=> b!48860 (= res!41020 (bvsge i!635 to!314))))

(assert (=> b!48860 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!75816 () Unit!3418)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1820) Unit!3418)

(assert (=> b!48860 (= lt!75816 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!48860 (= lt!75810 (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379)))))

(declare-fun b!48861 () Bool)

(assert (=> b!48861 (= e!32321 e!32311)))

(declare-fun res!41023 () Bool)

(assert (=> b!48861 (=> res!41023 e!32311)))

(assert (=> b!48861 (= res!41023 (not (= (size!1050 (buf!1402 (_2!2401 lt!75814))) (size!1050 (buf!1402 (_2!2401 lt!75819))))))))

(assert (=> b!48861 e!32312))

(declare-fun res!41019 () Bool)

(assert (=> b!48861 (=> (not res!41019) (not e!32312))))

(assert (=> b!48861 (= res!41019 (= (size!1050 (buf!1402 (_2!2401 lt!75819))) (size!1050 (buf!1402 thiss!1379))))))

(declare-fun b!48862 () Bool)

(declare-fun res!41027 () Bool)

(assert (=> b!48862 (=> res!41027 e!32321)))

(assert (=> b!48862 (= res!41027 (not (invariant!0 (currentBit!2914 (_2!2401 lt!75819)) (currentByte!2919 (_2!2401 lt!75819)) (size!1050 (buf!1402 (_2!2401 lt!75819))))))))

(assert (= (and start!9768 res!41018) b!48849))

(assert (= (and b!48849 res!41026) b!48860))

(assert (= (and b!48860 (not res!41020)) b!48852))

(assert (= (and b!48852 (not res!41031)) b!48845))

(assert (= (and b!48845 res!41033) b!48854))

(assert (= (and b!48845 (not res!41016)) b!48856))

(assert (= (and b!48856 (not res!41032)) b!48862))

(assert (= (and b!48862 (not res!41027)) b!48855))

(assert (= (and b!48855 (not res!41025)) b!48861))

(assert (= (and b!48861 res!41019) b!48847))

(assert (= (and b!48861 (not res!41023)) b!48850))

(assert (= (and b!48850 (not res!41034)) b!48853))

(assert (= (and b!48853 (not res!41028)) b!48848))

(assert (= (and b!48848 (not res!41021)) b!48858))

(assert (= (and b!48858 (not res!41030)) b!48846))

(assert (= (and b!48846 (not res!41024)) b!48851))

(assert (= (and b!48851 (not res!41017)) b!48857))

(assert (= (and b!48857 (not res!41029)) b!48844))

(assert (= (and b!48844 (not res!41022)) b!48843))

(assert (= start!9768 b!48859))

(declare-fun m!75975 () Bool)

(assert (=> b!48851 m!75975))

(declare-fun m!75977 () Bool)

(assert (=> b!48851 m!75977))

(declare-fun m!75979 () Bool)

(assert (=> b!48843 m!75979))

(declare-fun m!75981 () Bool)

(assert (=> b!48853 m!75981))

(declare-fun m!75983 () Bool)

(assert (=> b!48845 m!75983))

(declare-fun m!75985 () Bool)

(assert (=> b!48845 m!75985))

(declare-fun m!75987 () Bool)

(assert (=> b!48845 m!75987))

(declare-fun m!75989 () Bool)

(assert (=> b!48845 m!75989))

(declare-fun m!75991 () Bool)

(assert (=> b!48845 m!75991))

(declare-fun m!75993 () Bool)

(assert (=> b!48845 m!75993))

(declare-fun m!75995 () Bool)

(assert (=> b!48845 m!75995))

(declare-fun m!75997 () Bool)

(assert (=> b!48859 m!75997))

(declare-fun m!75999 () Bool)

(assert (=> b!48848 m!75999))

(declare-fun m!76001 () Bool)

(assert (=> b!48848 m!76001))

(declare-fun m!76003 () Bool)

(assert (=> b!48848 m!76003))

(declare-fun m!76005 () Bool)

(assert (=> b!48848 m!76005))

(declare-fun m!76007 () Bool)

(assert (=> b!48848 m!76007))

(declare-fun m!76009 () Bool)

(assert (=> b!48848 m!76009))

(declare-fun m!76011 () Bool)

(assert (=> b!48848 m!76011))

(declare-fun m!76013 () Bool)

(assert (=> b!48848 m!76013))

(declare-fun m!76015 () Bool)

(assert (=> b!48856 m!76015))

(declare-fun m!76017 () Bool)

(assert (=> b!48846 m!76017))

(declare-fun m!76019 () Bool)

(assert (=> b!48846 m!76019))

(declare-fun m!76021 () Bool)

(assert (=> start!9768 m!76021))

(declare-fun m!76023 () Bool)

(assert (=> start!9768 m!76023))

(declare-fun m!76025 () Bool)

(assert (=> b!48857 m!76025))

(declare-fun m!76027 () Bool)

(assert (=> b!48854 m!76027))

(assert (=> b!48854 m!76027))

(declare-fun m!76029 () Bool)

(assert (=> b!48854 m!76029))

(declare-fun m!76031 () Bool)

(assert (=> b!48854 m!76031))

(assert (=> b!48854 m!76031))

(declare-fun m!76033 () Bool)

(assert (=> b!48854 m!76033))

(declare-fun m!76035 () Bool)

(assert (=> b!48847 m!76035))

(declare-fun m!76037 () Bool)

(assert (=> b!48844 m!76037))

(assert (=> b!48844 m!76037))

(declare-fun m!76039 () Bool)

(assert (=> b!48844 m!76039))

(declare-fun m!76041 () Bool)

(assert (=> b!48844 m!76041))

(declare-fun m!76043 () Bool)

(assert (=> b!48850 m!76043))

(declare-fun m!76045 () Bool)

(assert (=> b!48862 m!76045))

(declare-fun m!76047 () Bool)

(assert (=> b!48860 m!76047))

(declare-fun m!76049 () Bool)

(assert (=> b!48860 m!76049))

(declare-fun m!76051 () Bool)

(assert (=> b!48860 m!76051))

(declare-fun m!76053 () Bool)

(assert (=> b!48858 m!76053))

(declare-fun m!76055 () Bool)

(assert (=> b!48849 m!76055))

(declare-fun m!76057 () Bool)

(assert (=> b!48852 m!76057))

(declare-fun m!76059 () Bool)

(assert (=> b!48852 m!76059))

(declare-fun m!76061 () Bool)

(assert (=> b!48852 m!76061))

(declare-fun m!76063 () Bool)

(assert (=> b!48852 m!76063))

(assert (=> b!48852 m!76059))

(declare-fun m!76065 () Bool)

(assert (=> b!48852 m!76065))

(push 1)

(assert (not b!48858))

(assert (not b!48851))

(assert (not b!48860))

(assert (not b!48845))

(assert (not b!48843))

(assert (not b!48857))

(assert (not b!48844))

(assert (not b!48854))

(assert (not b!48848))

(assert (not b!48849))

(assert (not b!48847))

(assert (not start!9768))

(assert (not b!48853))

(assert (not b!48852))

(assert (not b!48850))

(assert (not b!48859))

(assert (not b!48862))

(assert (not b!48856))

(assert (not b!48846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!15002 () Bool)

(declare-fun e!32388 () Bool)

(assert (=> d!15002 e!32388))

(declare-fun res!41139 () Bool)

(assert (=> d!15002 (=> (not res!41139) (not e!32388))))

(declare-fun lt!76236 () (_ BitVec 64))

(declare-fun lt!76240 () (_ BitVec 64))

(declare-fun lt!76238 () (_ BitVec 64))

(assert (=> d!15002 (= res!41139 (= lt!76240 (bvsub lt!76238 lt!76236)))))

(assert (=> d!15002 (or (= (bvand lt!76238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76236 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76238 lt!76236) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!15002 (= lt!76236 (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75819)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75819))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75819)))))))

(declare-fun lt!76239 () (_ BitVec 64))

(declare-fun lt!76237 () (_ BitVec 64))

(assert (=> d!15002 (= lt!76238 (bvmul lt!76239 lt!76237))))

(assert (=> d!15002 (or (= lt!76239 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!76237 (bvsdiv (bvmul lt!76239 lt!76237) lt!76239)))))

(assert (=> d!15002 (= lt!76237 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15002 (= lt!76239 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75819)))))))

(assert (=> d!15002 (= lt!76240 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75819))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75819)))))))

(assert (=> d!15002 (invariant!0 (currentBit!2914 (_2!2401 lt!75819)) (currentByte!2919 (_2!2401 lt!75819)) (size!1050 (buf!1402 (_2!2401 lt!75819))))))

(assert (=> d!15002 (= (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75819))) (currentByte!2919 (_2!2401 lt!75819)) (currentBit!2914 (_2!2401 lt!75819))) lt!76240)))

(declare-fun b!48985 () Bool)

(declare-fun res!41140 () Bool)

(assert (=> b!48985 (=> (not res!41140) (not e!32388))))

(assert (=> b!48985 (= res!41140 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!76240))))

(declare-fun b!48986 () Bool)

(declare-fun lt!76235 () (_ BitVec 64))

(assert (=> b!48986 (= e!32388 (bvsle lt!76240 (bvmul lt!76235 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!48986 (or (= lt!76235 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!76235 #b0000000000000000000000000000000000000000000000000000000000001000) lt!76235)))))

(assert (=> b!48986 (= lt!76235 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75819)))))))

(assert (= (and d!15002 res!41139) b!48985))

(assert (= (and b!48985 res!41140) b!48986))

(declare-fun m!76325 () Bool)

(assert (=> d!15002 m!76325))

(assert (=> d!15002 m!76045))

(assert (=> b!48856 d!15002))

(declare-fun b!49075 () Bool)

(declare-fun res!41196 () Bool)

(declare-fun e!32430 () Bool)

(assert (=> b!49075 (=> (not res!41196) (not e!32430))))

(declare-fun lt!76472 () tuple2!4606)

(assert (=> b!49075 (= res!41196 (isPrefixOf!0 (_2!2402 lt!76472) (_2!2401 lt!75814)))))

(declare-fun lt!76473 () (_ BitVec 64))

(declare-fun b!49076 () Bool)

(declare-fun lt!76464 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1820 (_ BitVec 64)) BitStream!1820)

(assert (=> b!49076 (= e!32430 (= (_1!2402 lt!76472) (withMovedBitIndex!0 (_2!2402 lt!76472) (bvsub lt!76464 lt!76473))))))

(assert (=> b!49076 (or (= (bvand lt!76464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76473 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76464 lt!76473) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49076 (= lt!76473 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))))))

(assert (=> b!49076 (= lt!76464 (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379)))))

(declare-fun d!15004 () Bool)

(assert (=> d!15004 e!32430))

(declare-fun res!41195 () Bool)

(assert (=> d!15004 (=> (not res!41195) (not e!32430))))

(assert (=> d!15004 (= res!41195 (isPrefixOf!0 (_1!2402 lt!76472) (_2!2402 lt!76472)))))

(declare-fun lt!76463 () BitStream!1820)

(assert (=> d!15004 (= lt!76472 (tuple2!4607 lt!76463 (_2!2401 lt!75814)))))

(declare-fun lt!76477 () Unit!3418)

(declare-fun lt!76467 () Unit!3418)

(assert (=> d!15004 (= lt!76477 lt!76467)))

(assert (=> d!15004 (isPrefixOf!0 lt!76463 (_2!2401 lt!75814))))

(assert (=> d!15004 (= lt!76467 (lemmaIsPrefixTransitive!0 lt!76463 (_2!2401 lt!75814) (_2!2401 lt!75814)))))

(declare-fun lt!76469 () Unit!3418)

(declare-fun lt!76466 () Unit!3418)

(assert (=> d!15004 (= lt!76469 lt!76466)))

(assert (=> d!15004 (isPrefixOf!0 lt!76463 (_2!2401 lt!75814))))

(assert (=> d!15004 (= lt!76466 (lemmaIsPrefixTransitive!0 lt!76463 thiss!1379 (_2!2401 lt!75814)))))

(declare-fun lt!76474 () Unit!3418)

(declare-fun e!32429 () Unit!3418)

(assert (=> d!15004 (= lt!76474 e!32429)))

(declare-fun c!3450 () Bool)

(assert (=> d!15004 (= c!3450 (not (= (size!1050 (buf!1402 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!76468 () Unit!3418)

(declare-fun lt!76471 () Unit!3418)

(assert (=> d!15004 (= lt!76468 lt!76471)))

(assert (=> d!15004 (isPrefixOf!0 (_2!2401 lt!75814) (_2!2401 lt!75814))))

(assert (=> d!15004 (= lt!76471 (lemmaIsPrefixRefl!0 (_2!2401 lt!75814)))))

(declare-fun lt!76460 () Unit!3418)

(declare-fun lt!76476 () Unit!3418)

(assert (=> d!15004 (= lt!76460 lt!76476)))

(assert (=> d!15004 (= lt!76476 (lemmaIsPrefixRefl!0 (_2!2401 lt!75814)))))

(declare-fun lt!76479 () Unit!3418)

(declare-fun lt!76461 () Unit!3418)

(assert (=> d!15004 (= lt!76479 lt!76461)))

(assert (=> d!15004 (isPrefixOf!0 lt!76463 lt!76463)))

(assert (=> d!15004 (= lt!76461 (lemmaIsPrefixRefl!0 lt!76463))))

(declare-fun lt!76475 () Unit!3418)

(declare-fun lt!76470 () Unit!3418)

(assert (=> d!15004 (= lt!76475 lt!76470)))

(assert (=> d!15004 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!15004 (= lt!76470 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!15004 (= lt!76463 (BitStream!1821 (buf!1402 (_2!2401 lt!75814)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379)))))

(assert (=> d!15004 (isPrefixOf!0 thiss!1379 (_2!2401 lt!75814))))

(assert (=> d!15004 (= (reader!0 thiss!1379 (_2!2401 lt!75814)) lt!76472)))

(declare-fun b!49077 () Bool)

(declare-fun lt!76462 () Unit!3418)

(assert (=> b!49077 (= e!32429 lt!76462)))

(declare-fun lt!76465 () (_ BitVec 64))

(assert (=> b!49077 (= lt!76465 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76478 () (_ BitVec 64))

(assert (=> b!49077 (= lt!76478 (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2315 array!2315 (_ BitVec 64) (_ BitVec 64)) Unit!3418)

(assert (=> b!49077 (= lt!76462 (arrayBitRangesEqSymmetric!0 (buf!1402 thiss!1379) (buf!1402 (_2!2401 lt!75814)) lt!76465 lt!76478))))

(declare-fun arrayBitRangesEq!0 (array!2315 array!2315 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!49077 (arrayBitRangesEq!0 (buf!1402 (_2!2401 lt!75814)) (buf!1402 thiss!1379) lt!76465 lt!76478)))

(declare-fun b!49078 () Bool)

(declare-fun res!41194 () Bool)

(assert (=> b!49078 (=> (not res!41194) (not e!32430))))

(assert (=> b!49078 (= res!41194 (isPrefixOf!0 (_1!2402 lt!76472) thiss!1379))))

(declare-fun b!49079 () Bool)

(declare-fun Unit!3440 () Unit!3418)

(assert (=> b!49079 (= e!32429 Unit!3440)))

(assert (= (and d!15004 c!3450) b!49077))

(assert (= (and d!15004 (not c!3450)) b!49079))

(assert (= (and d!15004 res!41195) b!49078))

(assert (= (and b!49078 res!41194) b!49075))

(assert (= (and b!49075 res!41196) b!49076))

(declare-fun m!76497 () Bool)

(assert (=> b!49078 m!76497))

(assert (=> b!49077 m!76051))

(declare-fun m!76499 () Bool)

(assert (=> b!49077 m!76499))

(declare-fun m!76501 () Bool)

(assert (=> b!49077 m!76501))

(declare-fun m!76503 () Bool)

(assert (=> b!49075 m!76503))

(declare-fun m!76505 () Bool)

(assert (=> b!49076 m!76505))

(assert (=> b!49076 m!76035))

(assert (=> b!49076 m!76051))

(declare-fun m!76507 () Bool)

(assert (=> d!15004 m!76507))

(assert (=> d!15004 m!76061))

(declare-fun m!76509 () Bool)

(assert (=> d!15004 m!76509))

(declare-fun m!76511 () Bool)

(assert (=> d!15004 m!76511))

(assert (=> d!15004 m!76049))

(declare-fun m!76513 () Bool)

(assert (=> d!15004 m!76513))

(declare-fun m!76515 () Bool)

(assert (=> d!15004 m!76515))

(declare-fun m!76517 () Bool)

(assert (=> d!15004 m!76517))

(declare-fun m!76519 () Bool)

(assert (=> d!15004 m!76519))

(declare-fun m!76521 () Bool)

(assert (=> d!15004 m!76521))

(assert (=> d!15004 m!76047))

(assert (=> b!48845 d!15004))

(declare-fun d!15064 () Bool)

(declare-fun res!41214 () Bool)

(declare-fun e!32445 () Bool)

(assert (=> d!15064 (=> (not res!41214) (not e!32445))))

(assert (=> d!15064 (= res!41214 (= (size!1050 (buf!1402 thiss!1379)) (size!1050 (buf!1402 (_2!2401 lt!75819)))))))

(assert (=> d!15064 (= (isPrefixOf!0 thiss!1379 (_2!2401 lt!75819)) e!32445)))

(declare-fun b!49101 () Bool)

(declare-fun res!41215 () Bool)

(assert (=> b!49101 (=> (not res!41215) (not e!32445))))

(assert (=> b!49101 (= res!41215 (bvsle (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379)) (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75819))) (currentByte!2919 (_2!2401 lt!75819)) (currentBit!2914 (_2!2401 lt!75819)))))))

(declare-fun b!49103 () Bool)

(declare-fun e!32444 () Bool)

(assert (=> b!49103 (= e!32445 e!32444)))

(declare-fun res!41213 () Bool)

(assert (=> b!49103 (=> res!41213 e!32444)))

(assert (=> b!49103 (= res!41213 (= (size!1050 (buf!1402 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!49104 () Bool)

(assert (=> b!49104 (= e!32444 (arrayBitRangesEq!0 (buf!1402 thiss!1379) (buf!1402 (_2!2401 lt!75819)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379))))))

(assert (= (and d!15064 res!41214) b!49101))

(assert (= (and b!49101 res!41215) b!49103))

(assert (= (and b!49103 (not res!41213)) b!49104))

(assert (=> b!49101 m!76051))

(assert (=> b!49101 m!76015))

(assert (=> b!49104 m!76051))

(assert (=> b!49104 m!76051))

(declare-fun m!76549 () Bool)

(assert (=> b!49104 m!76549))

(assert (=> b!48845 d!15064))

(declare-fun d!15074 () Bool)

(assert (=> d!15074 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))) ((_ sign_extend 32) (currentByte!2919 thiss!1379)) ((_ sign_extend 32) (currentBit!2914 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!76528 () Unit!3418)

(declare-fun choose!9 (BitStream!1820 array!2315 (_ BitVec 64) BitStream!1820) Unit!3418)

(assert (=> d!15074 (= lt!76528 (choose!9 thiss!1379 (buf!1402 (_2!2401 lt!75814)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1821 (buf!1402 (_2!2401 lt!75814)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379))))))

(assert (=> d!15074 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1402 (_2!2401 lt!75814)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!76528)))

(declare-fun bs!3850 () Bool)

(assert (= bs!3850 d!15074))

(assert (=> bs!3850 m!75993))

(declare-fun m!76571 () Bool)

(assert (=> bs!3850 m!76571))

(assert (=> b!48845 d!15074))

(declare-fun d!15082 () Bool)

(assert (=> d!15082 (isPrefixOf!0 thiss!1379 (_2!2401 lt!75819))))

(declare-fun lt!76531 () Unit!3418)

(declare-fun choose!30 (BitStream!1820 BitStream!1820 BitStream!1820) Unit!3418)

(assert (=> d!15082 (= lt!76531 (choose!30 thiss!1379 (_2!2401 lt!75814) (_2!2401 lt!75819)))))

(assert (=> d!15082 (isPrefixOf!0 thiss!1379 (_2!2401 lt!75814))))

(assert (=> d!15082 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2401 lt!75814) (_2!2401 lt!75819)) lt!76531)))

(declare-fun bs!3853 () Bool)

(assert (= bs!3853 d!15082))

(assert (=> bs!3853 m!75989))

(declare-fun m!76577 () Bool)

(assert (=> bs!3853 m!76577))

(assert (=> bs!3853 m!76061))

(assert (=> b!48845 d!15082))

(declare-fun d!15090 () Bool)

(declare-fun e!32484 () Bool)

(assert (=> d!15090 e!32484))

(declare-fun res!41258 () Bool)

(assert (=> d!15090 (=> (not res!41258) (not e!32484))))

(declare-fun lt!76694 () (_ BitVec 64))

(declare-fun lt!76669 () tuple2!4604)

(assert (=> d!15090 (= res!41258 (= (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76669))) (currentByte!2919 (_2!2401 lt!76669)) (currentBit!2914 (_2!2401 lt!76669))) (bvsub lt!76694 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!15090 (or (= (bvand lt!76694 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76694 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76694 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!76677 () (_ BitVec 64))

(assert (=> d!15090 (= lt!76694 (bvadd lt!76677 to!314))))

(assert (=> d!15090 (or (not (= (bvand lt!76677 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!76677 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!76677 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15090 (= lt!76677 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))))))

(declare-fun e!32483 () tuple2!4604)

(assert (=> d!15090 (= lt!76669 e!32483)))

(declare-fun c!3473 () Bool)

(assert (=> d!15090 (= c!3473 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!76666 () Unit!3418)

(declare-fun lt!76679 () Unit!3418)

(assert (=> d!15090 (= lt!76666 lt!76679)))

(assert (=> d!15090 (isPrefixOf!0 (_2!2401 lt!75814) (_2!2401 lt!75814))))

(assert (=> d!15090 (= lt!76679 (lemmaIsPrefixRefl!0 (_2!2401 lt!75814)))))

(declare-fun lt!76699 () (_ BitVec 64))

(assert (=> d!15090 (= lt!76699 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))))))

(assert (=> d!15090 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15090 (= (appendBitsMSBFirstLoop!0 (_2!2401 lt!75814) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!76669)))

(declare-fun b!49181 () Bool)

(declare-fun res!41253 () Bool)

(assert (=> b!49181 (=> (not res!41253) (not e!32484))))

(assert (=> b!49181 (= res!41253 (invariant!0 (currentBit!2914 (_2!2401 lt!76669)) (currentByte!2919 (_2!2401 lt!76669)) (size!1050 (buf!1402 (_2!2401 lt!76669)))))))

(declare-fun lt!76672 () tuple2!4606)

(declare-fun b!49182 () Bool)

(assert (=> b!49182 (= e!32484 (= (bitStreamReadBitsIntoList!0 (_2!2401 lt!76669) (_1!2402 lt!76672) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2401 lt!76669) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!49182 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49182 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!76700 () Unit!3418)

(declare-fun lt!76692 () Unit!3418)

(assert (=> b!49182 (= lt!76700 lt!76692)))

(declare-fun lt!76696 () (_ BitVec 64))

(assert (=> b!49182 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76669)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))) lt!76696)))

(assert (=> b!49182 (= lt!76692 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2401 lt!75814) (buf!1402 (_2!2401 lt!76669)) lt!76696))))

(declare-fun e!32482 () Bool)

(assert (=> b!49182 e!32482))

(declare-fun res!41257 () Bool)

(assert (=> b!49182 (=> (not res!41257) (not e!32482))))

(assert (=> b!49182 (= res!41257 (and (= (size!1050 (buf!1402 (_2!2401 lt!75814))) (size!1050 (buf!1402 (_2!2401 lt!76669)))) (bvsge lt!76696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49182 (= lt!76696 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!49182 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49182 (= lt!76672 (reader!0 (_2!2401 lt!75814) (_2!2401 lt!76669)))))

(declare-fun b!49183 () Bool)

(declare-fun res!41254 () Bool)

(assert (=> b!49183 (=> (not res!41254) (not e!32484))))

(assert (=> b!49183 (= res!41254 (= (size!1050 (buf!1402 (_2!2401 lt!75814))) (size!1050 (buf!1402 (_2!2401 lt!76669)))))))

(declare-fun b!49184 () Bool)

(declare-fun res!41256 () Bool)

(assert (=> b!49184 (=> (not res!41256) (not e!32484))))

(assert (=> b!49184 (= res!41256 (isPrefixOf!0 (_2!2401 lt!75814) (_2!2401 lt!76669)))))

(declare-fun b!49185 () Bool)

(declare-fun Unit!3441 () Unit!3418)

(assert (=> b!49185 (= e!32483 (tuple2!4605 Unit!3441 (_2!2401 lt!75814)))))

(assert (=> b!49185 (= (size!1050 (buf!1402 (_2!2401 lt!75814))) (size!1050 (buf!1402 (_2!2401 lt!75814))))))

(declare-fun lt!76691 () Unit!3418)

(declare-fun Unit!3442 () Unit!3418)

(assert (=> b!49185 (= lt!76691 Unit!3442)))

(declare-fun call!619 () tuple2!4606)

(declare-fun checkByteArrayBitContent!0 (BitStream!1820 array!2315 array!2315 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4624 0))(
  ( (tuple2!4625 (_1!2411 array!2315) (_2!2411 BitStream!1820)) )
))
(declare-fun readBits!0 (BitStream!1820 (_ BitVec 64)) tuple2!4624)

(assert (=> b!49185 (checkByteArrayBitContent!0 (_2!2401 lt!75814) srcBuffer!2 (_1!2411 (readBits!0 (_1!2402 call!619) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!49186 () Bool)

(assert (=> b!49186 (= e!32482 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))) lt!76696))))

(declare-fun b!49187 () Bool)

(declare-fun lt!76704 () tuple2!4604)

(declare-fun Unit!3443 () Unit!3418)

(assert (=> b!49187 (= e!32483 (tuple2!4605 Unit!3443 (_2!2401 lt!76704)))))

(declare-fun lt!76678 () tuple2!4604)

(assert (=> b!49187 (= lt!76678 (appendBitFromByte!0 (_2!2401 lt!75814) (select (arr!1576 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!76690 () (_ BitVec 64))

(assert (=> b!49187 (= lt!76690 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!76697 () (_ BitVec 64))

(assert (=> b!49187 (= lt!76697 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!76703 () Unit!3418)

(assert (=> b!49187 (= lt!76703 (validateOffsetBitsIneqLemma!0 (_2!2401 lt!75814) (_2!2401 lt!76678) lt!76690 lt!76697))))

(assert (=> b!49187 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76678)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76678))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76678))) (bvsub lt!76690 lt!76697))))

(declare-fun lt!76705 () Unit!3418)

(assert (=> b!49187 (= lt!76705 lt!76703)))

(declare-fun lt!76670 () tuple2!4606)

(assert (=> b!49187 (= lt!76670 call!619)))

(declare-fun lt!76695 () (_ BitVec 64))

(assert (=> b!49187 (= lt!76695 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!76667 () Unit!3418)

(assert (=> b!49187 (= lt!76667 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2401 lt!75814) (buf!1402 (_2!2401 lt!76678)) lt!76695))))

(assert (=> b!49187 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76678)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))) lt!76695)))

(declare-fun lt!76684 () Unit!3418)

(assert (=> b!49187 (= lt!76684 lt!76667)))

(assert (=> b!49187 (= (head!370 (byteArrayBitContentToList!0 (_2!2401 lt!76678) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!370 (bitStreamReadBitsIntoList!0 (_2!2401 lt!76678) (_1!2402 lt!76670) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!76693 () Unit!3418)

(declare-fun Unit!3444 () Unit!3418)

(assert (=> b!49187 (= lt!76693 Unit!3444)))

(assert (=> b!49187 (= lt!76704 (appendBitsMSBFirstLoop!0 (_2!2401 lt!76678) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!76668 () Unit!3418)

(assert (=> b!49187 (= lt!76668 (lemmaIsPrefixTransitive!0 (_2!2401 lt!75814) (_2!2401 lt!76678) (_2!2401 lt!76704)))))

(assert (=> b!49187 (isPrefixOf!0 (_2!2401 lt!75814) (_2!2401 lt!76704))))

(declare-fun lt!76671 () Unit!3418)

(assert (=> b!49187 (= lt!76671 lt!76668)))

(assert (=> b!49187 (= (size!1050 (buf!1402 (_2!2401 lt!76704))) (size!1050 (buf!1402 (_2!2401 lt!75814))))))

(declare-fun lt!76688 () Unit!3418)

(declare-fun Unit!3445 () Unit!3418)

(assert (=> b!49187 (= lt!76688 Unit!3445)))

(assert (=> b!49187 (= (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76704))) (currentByte!2919 (_2!2401 lt!76704)) (currentBit!2914 (_2!2401 lt!76704))) (bvsub (bvadd (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!76701 () Unit!3418)

(declare-fun Unit!3446 () Unit!3418)

(assert (=> b!49187 (= lt!76701 Unit!3446)))

(assert (=> b!49187 (= (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76704))) (currentByte!2919 (_2!2401 lt!76704)) (currentBit!2914 (_2!2401 lt!76704))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76678))) (currentByte!2919 (_2!2401 lt!76678)) (currentBit!2914 (_2!2401 lt!76678))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!76675 () Unit!3418)

(declare-fun Unit!3447 () Unit!3418)

(assert (=> b!49187 (= lt!76675 Unit!3447)))

(declare-fun lt!76682 () tuple2!4606)

(assert (=> b!49187 (= lt!76682 (reader!0 (_2!2401 lt!75814) (_2!2401 lt!76704)))))

(declare-fun lt!76687 () (_ BitVec 64))

(assert (=> b!49187 (= lt!76687 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!76674 () Unit!3418)

(assert (=> b!49187 (= lt!76674 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2401 lt!75814) (buf!1402 (_2!2401 lt!76704)) lt!76687))))

(assert (=> b!49187 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76704)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))) lt!76687)))

(declare-fun lt!76685 () Unit!3418)

(assert (=> b!49187 (= lt!76685 lt!76674)))

(declare-fun lt!76662 () tuple2!4606)

(assert (=> b!49187 (= lt!76662 (reader!0 (_2!2401 lt!76678) (_2!2401 lt!76704)))))

(declare-fun lt!76689 () (_ BitVec 64))

(assert (=> b!49187 (= lt!76689 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!76663 () Unit!3418)

(assert (=> b!49187 (= lt!76663 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2401 lt!76678) (buf!1402 (_2!2401 lt!76704)) lt!76689))))

(assert (=> b!49187 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76704)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76678))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76678))) lt!76689)))

(declare-fun lt!76664 () Unit!3418)

(assert (=> b!49187 (= lt!76664 lt!76663)))

(declare-fun lt!76702 () List!551)

(assert (=> b!49187 (= lt!76702 (byteArrayBitContentToList!0 (_2!2401 lt!76704) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!76673 () List!551)

(assert (=> b!49187 (= lt!76673 (byteArrayBitContentToList!0 (_2!2401 lt!76704) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!76665 () List!551)

(assert (=> b!49187 (= lt!76665 (bitStreamReadBitsIntoList!0 (_2!2401 lt!76704) (_1!2402 lt!76682) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!76676 () List!551)

(assert (=> b!49187 (= lt!76676 (bitStreamReadBitsIntoList!0 (_2!2401 lt!76704) (_1!2402 lt!76662) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!76680 () (_ BitVec 64))

(assert (=> b!49187 (= lt!76680 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!76681 () Unit!3418)

(assert (=> b!49187 (= lt!76681 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2401 lt!76704) (_2!2401 lt!76704) (_1!2402 lt!76682) (_1!2402 lt!76662) lt!76680 lt!76665))))

(assert (=> b!49187 (= (bitStreamReadBitsIntoList!0 (_2!2401 lt!76704) (_1!2402 lt!76662) (bvsub lt!76680 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!237 lt!76665))))

(declare-fun lt!76683 () Unit!3418)

(assert (=> b!49187 (= lt!76683 lt!76681)))

(declare-fun lt!76698 () Unit!3418)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2315 array!2315 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3418)

(assert (=> b!49187 (= lt!76698 (arrayBitRangesEqImpliesEq!0 (buf!1402 (_2!2401 lt!76678)) (buf!1402 (_2!2401 lt!76704)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!76699 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76678))) (currentByte!2919 (_2!2401 lt!76678)) (currentBit!2914 (_2!2401 lt!76678)))))))

(assert (=> b!49187 (= (bitAt!0 (buf!1402 (_2!2401 lt!76678)) lt!76699) (bitAt!0 (buf!1402 (_2!2401 lt!76704)) lt!76699))))

(declare-fun lt!76686 () Unit!3418)

(assert (=> b!49187 (= lt!76686 lt!76698)))

(declare-fun bm!616 () Bool)

(assert (=> bm!616 (= call!619 (reader!0 (_2!2401 lt!75814) (ite c!3473 (_2!2401 lt!76678) (_2!2401 lt!75814))))))

(declare-fun b!49188 () Bool)

(declare-fun res!41255 () Bool)

(assert (=> b!49188 (=> (not res!41255) (not e!32484))))

(assert (=> b!49188 (= res!41255 (= (size!1050 (buf!1402 (_2!2401 lt!76669))) (size!1050 (buf!1402 (_2!2401 lt!75814)))))))

(assert (= (and d!15090 c!3473) b!49187))

(assert (= (and d!15090 (not c!3473)) b!49185))

(assert (= (or b!49187 b!49185) bm!616))

(assert (= (and d!15090 res!41258) b!49181))

(assert (= (and b!49181 res!41253) b!49183))

(assert (= (and b!49183 res!41254) b!49184))

(assert (= (and b!49184 res!41256) b!49188))

(assert (= (and b!49188 res!41255) b!49182))

(assert (= (and b!49182 res!41257) b!49186))

(declare-fun m!76633 () Bool)

(assert (=> d!15090 m!76633))

(assert (=> d!15090 m!76035))

(assert (=> d!15090 m!76517))

(assert (=> d!15090 m!76513))

(declare-fun m!76635 () Bool)

(assert (=> b!49187 m!76635))

(declare-fun m!76637 () Bool)

(assert (=> b!49187 m!76637))

(declare-fun m!76639 () Bool)

(assert (=> b!49187 m!76639))

(declare-fun m!76641 () Bool)

(assert (=> b!49187 m!76641))

(declare-fun m!76643 () Bool)

(assert (=> b!49187 m!76643))

(declare-fun m!76645 () Bool)

(assert (=> b!49187 m!76645))

(declare-fun m!76647 () Bool)

(assert (=> b!49187 m!76647))

(declare-fun m!76649 () Bool)

(assert (=> b!49187 m!76649))

(declare-fun m!76651 () Bool)

(assert (=> b!49187 m!76651))

(declare-fun m!76653 () Bool)

(assert (=> b!49187 m!76653))

(declare-fun m!76655 () Bool)

(assert (=> b!49187 m!76655))

(declare-fun m!76657 () Bool)

(assert (=> b!49187 m!76657))

(declare-fun m!76659 () Bool)

(assert (=> b!49187 m!76659))

(declare-fun m!76661 () Bool)

(assert (=> b!49187 m!76661))

(declare-fun m!76663 () Bool)

(assert (=> b!49187 m!76663))

(declare-fun m!76665 () Bool)

(assert (=> b!49187 m!76665))

(declare-fun m!76667 () Bool)

(assert (=> b!49187 m!76667))

(declare-fun m!76669 () Bool)

(assert (=> b!49187 m!76669))

(declare-fun m!76671 () Bool)

(assert (=> b!49187 m!76671))

(declare-fun m!76673 () Bool)

(assert (=> b!49187 m!76673))

(declare-fun m!76675 () Bool)

(assert (=> b!49187 m!76675))

(assert (=> b!49187 m!76655))

(declare-fun m!76677 () Bool)

(assert (=> b!49187 m!76677))

(declare-fun m!76679 () Bool)

(assert (=> b!49187 m!76679))

(declare-fun m!76681 () Bool)

(assert (=> b!49187 m!76681))

(declare-fun m!76683 () Bool)

(assert (=> b!49187 m!76683))

(assert (=> b!49187 m!76643))

(declare-fun m!76685 () Bool)

(assert (=> b!49187 m!76685))

(assert (=> b!49187 m!76035))

(declare-fun m!76687 () Bool)

(assert (=> b!49187 m!76687))

(declare-fun m!76689 () Bool)

(assert (=> b!49187 m!76689))

(declare-fun m!76691 () Bool)

(assert (=> b!49187 m!76691))

(declare-fun m!76693 () Bool)

(assert (=> b!49187 m!76693))

(assert (=> b!49187 m!76657))

(declare-fun m!76695 () Bool)

(assert (=> b!49187 m!76695))

(assert (=> b!49187 m!76687))

(declare-fun m!76697 () Bool)

(assert (=> bm!616 m!76697))

(declare-fun m!76699 () Bool)

(assert (=> b!49182 m!76699))

(declare-fun m!76701 () Bool)

(assert (=> b!49182 m!76701))

(declare-fun m!76703 () Bool)

(assert (=> b!49182 m!76703))

(declare-fun m!76705 () Bool)

(assert (=> b!49182 m!76705))

(declare-fun m!76707 () Bool)

(assert (=> b!49182 m!76707))

(declare-fun m!76709 () Bool)

(assert (=> b!49184 m!76709))

(declare-fun m!76711 () Bool)

(assert (=> b!49185 m!76711))

(declare-fun m!76713 () Bool)

(assert (=> b!49185 m!76713))

(declare-fun m!76715 () Bool)

(assert (=> b!49186 m!76715))

(declare-fun m!76717 () Bool)

(assert (=> b!49181 m!76717))

(assert (=> b!48845 d!15090))

(declare-fun d!15130 () Bool)

(declare-fun res!41260 () Bool)

(declare-fun e!32486 () Bool)

(assert (=> d!15130 (=> (not res!41260) (not e!32486))))

(assert (=> d!15130 (= res!41260 (= (size!1050 (buf!1402 (_2!2401 lt!75814))) (size!1050 (buf!1402 (_2!2401 lt!75819)))))))

(assert (=> d!15130 (= (isPrefixOf!0 (_2!2401 lt!75814) (_2!2401 lt!75819)) e!32486)))

(declare-fun b!49189 () Bool)

(declare-fun res!41261 () Bool)

(assert (=> b!49189 (=> (not res!41261) (not e!32486))))

(assert (=> b!49189 (= res!41261 (bvsle (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))) (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75819))) (currentByte!2919 (_2!2401 lt!75819)) (currentBit!2914 (_2!2401 lt!75819)))))))

(declare-fun b!49190 () Bool)

(declare-fun e!32485 () Bool)

(assert (=> b!49190 (= e!32486 e!32485)))

(declare-fun res!41259 () Bool)

(assert (=> b!49190 (=> res!41259 e!32485)))

(assert (=> b!49190 (= res!41259 (= (size!1050 (buf!1402 (_2!2401 lt!75814))) #b00000000000000000000000000000000))))

(declare-fun b!49191 () Bool)

(assert (=> b!49191 (= e!32485 (arrayBitRangesEq!0 (buf!1402 (_2!2401 lt!75814)) (buf!1402 (_2!2401 lt!75819)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814)))))))

(assert (= (and d!15130 res!41260) b!49189))

(assert (= (and b!49189 res!41261) b!49190))

(assert (= (and b!49190 (not res!41259)) b!49191))

(assert (=> b!49189 m!76035))

(assert (=> b!49189 m!76015))

(assert (=> b!49191 m!76035))

(assert (=> b!49191 m!76035))

(declare-fun m!76719 () Bool)

(assert (=> b!49191 m!76719))

(assert (=> b!48845 d!15130))

(declare-fun d!15132 () Bool)

(assert (=> d!15132 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))) ((_ sign_extend 32) (currentByte!2919 thiss!1379)) ((_ sign_extend 32) (currentBit!2914 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))) ((_ sign_extend 32) (currentByte!2919 thiss!1379)) ((_ sign_extend 32) (currentBit!2914 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3859 () Bool)

(assert (= bs!3859 d!15132))

(declare-fun m!76721 () Bool)

(assert (=> bs!3859 m!76721))

(assert (=> b!48845 d!15132))

(declare-fun d!15134 () Bool)

(assert (=> d!15134 (= (head!370 (byteArrayBitContentToList!0 (_2!2401 lt!75819) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!666 (byteArrayBitContentToList!0 (_2!2401 lt!75819) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!48844 d!15134))

(declare-fun d!15136 () Bool)

(declare-fun c!3476 () Bool)

(assert (=> d!15136 (= c!3476 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32489 () List!551)

(assert (=> d!15136 (= (byteArrayBitContentToList!0 (_2!2401 lt!75819) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!32489)))

(declare-fun b!49196 () Bool)

(assert (=> b!49196 (= e!32489 Nil!548)))

(declare-fun b!49197 () Bool)

(assert (=> b!49197 (= e!32489 (Cons!547 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2401 lt!75819) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15136 c!3476) b!49196))

(assert (= (and d!15136 (not c!3476)) b!49197))

(assert (=> b!49197 m!76059))

(declare-fun m!76723 () Bool)

(assert (=> b!49197 m!76723))

(declare-fun m!76725 () Bool)

(assert (=> b!49197 m!76725))

(assert (=> b!48844 d!15136))

(declare-fun d!15138 () Bool)

(assert (=> d!15138 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1576 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3860 () Bool)

(assert (= bs!3860 d!15138))

(assert (=> bs!3860 m!76059))

(assert (=> bs!3860 m!76723))

(assert (=> b!48844 d!15138))

(declare-fun d!15140 () Bool)

(assert (=> d!15140 (= (head!370 (byteArrayBitContentToList!0 (_2!2401 lt!75814) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!666 (byteArrayBitContentToList!0 (_2!2401 lt!75814) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!48854 d!15140))

(declare-fun d!15142 () Bool)

(declare-fun c!3477 () Bool)

(assert (=> d!15142 (= c!3477 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32490 () List!551)

(assert (=> d!15142 (= (byteArrayBitContentToList!0 (_2!2401 lt!75814) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!32490)))

(declare-fun b!49198 () Bool)

(assert (=> b!49198 (= e!32490 Nil!548)))

(declare-fun b!49199 () Bool)

(assert (=> b!49199 (= e!32490 (Cons!547 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2401 lt!75814) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15142 c!3477) b!49198))

(assert (= (and d!15142 (not c!3477)) b!49199))

(assert (=> b!49199 m!76059))

(assert (=> b!49199 m!76723))

(declare-fun m!76727 () Bool)

(assert (=> b!49199 m!76727))

(assert (=> b!48854 d!15142))

(declare-fun d!15144 () Bool)

(assert (=> d!15144 (= (head!370 (bitStreamReadBitsIntoList!0 (_2!2401 lt!75814) (_1!2402 lt!75822) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!666 (bitStreamReadBitsIntoList!0 (_2!2401 lt!75814) (_1!2402 lt!75822) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!48854 d!15144))

(declare-fun d!15146 () Bool)

(declare-fun e!32495 () Bool)

(assert (=> d!15146 e!32495))

(declare-fun c!3482 () Bool)

(assert (=> d!15146 (= c!3482 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!76714 () List!551)

(declare-datatypes ((tuple2!4626 0))(
  ( (tuple2!4627 (_1!2412 List!551) (_2!2412 BitStream!1820)) )
))
(declare-fun e!32496 () tuple2!4626)

(assert (=> d!15146 (= lt!76714 (_1!2412 e!32496))))

(declare-fun c!3483 () Bool)

(assert (=> d!15146 (= c!3483 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15146 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15146 (= (bitStreamReadBitsIntoList!0 (_2!2401 lt!75814) (_1!2402 lt!75822) #b0000000000000000000000000000000000000000000000000000000000000001) lt!76714)))

(declare-fun b!49209 () Bool)

(declare-datatypes ((tuple2!4628 0))(
  ( (tuple2!4629 (_1!2413 Bool) (_2!2413 BitStream!1820)) )
))
(declare-fun lt!76713 () tuple2!4628)

(declare-fun lt!76712 () (_ BitVec 64))

(assert (=> b!49209 (= e!32496 (tuple2!4627 (Cons!547 (_1!2413 lt!76713) (bitStreamReadBitsIntoList!0 (_2!2401 lt!75814) (_2!2413 lt!76713) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!76712))) (_2!2413 lt!76713)))))

(declare-fun readBit!0 (BitStream!1820) tuple2!4628)

(assert (=> b!49209 (= lt!76713 (readBit!0 (_1!2402 lt!75822)))))

(assert (=> b!49209 (= lt!76712 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!49208 () Bool)

(assert (=> b!49208 (= e!32496 (tuple2!4627 Nil!548 (_1!2402 lt!75822)))))

(declare-fun b!49210 () Bool)

(declare-fun isEmpty!145 (List!551) Bool)

(assert (=> b!49210 (= e!32495 (isEmpty!145 lt!76714))))

(declare-fun b!49211 () Bool)

(assert (=> b!49211 (= e!32495 (> (length!246 lt!76714) 0))))

(assert (= (and d!15146 c!3483) b!49208))

(assert (= (and d!15146 (not c!3483)) b!49209))

(assert (= (and d!15146 c!3482) b!49210))

(assert (= (and d!15146 (not c!3482)) b!49211))

(declare-fun m!76729 () Bool)

(assert (=> b!49209 m!76729))

(declare-fun m!76731 () Bool)

(assert (=> b!49209 m!76731))

(declare-fun m!76733 () Bool)

(assert (=> b!49210 m!76733))

(declare-fun m!76735 () Bool)

(assert (=> b!49211 m!76735))

(assert (=> b!48854 d!15146))

(declare-fun d!15148 () Bool)

(assert (=> d!15148 (= (array_inv!963 srcBuffer!2) (bvsge (size!1050 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!9768 d!15148))

(declare-fun d!15150 () Bool)

(assert (=> d!15150 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2914 thiss!1379) (currentByte!2919 thiss!1379) (size!1050 (buf!1402 thiss!1379))))))

(declare-fun bs!3861 () Bool)

(assert (= bs!3861 d!15150))

(declare-fun m!76737 () Bool)

(assert (=> bs!3861 m!76737))

(assert (=> start!9768 d!15150))

(declare-fun d!15152 () Bool)

(assert (=> d!15152 (= (bitAt!0 (buf!1402 (_2!2401 lt!75814)) lt!75810) (not (= (bvand ((_ sign_extend 24) (select (arr!1576 (buf!1402 (_2!2401 lt!75814))) ((_ extract 31 0) (bvsdiv lt!75810 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!75810 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3862 () Bool)

(assert (= bs!3862 d!15152))

(declare-fun m!76739 () Bool)

(assert (=> bs!3862 m!76739))

(declare-fun m!76741 () Bool)

(assert (=> bs!3862 m!76741))

(assert (=> b!48843 d!15152))

(declare-fun d!15154 () Bool)

(assert (=> d!15154 (= (invariant!0 (currentBit!2914 (_2!2401 lt!75814)) (currentByte!2919 (_2!2401 lt!75814)) (size!1050 (buf!1402 (_2!2401 lt!75819)))) (and (bvsge (currentBit!2914 (_2!2401 lt!75814)) #b00000000000000000000000000000000) (bvslt (currentBit!2914 (_2!2401 lt!75814)) #b00000000000000000000000000001000) (bvsge (currentByte!2919 (_2!2401 lt!75814)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2919 (_2!2401 lt!75814)) (size!1050 (buf!1402 (_2!2401 lt!75819)))) (and (= (currentBit!2914 (_2!2401 lt!75814)) #b00000000000000000000000000000000) (= (currentByte!2919 (_2!2401 lt!75814)) (size!1050 (buf!1402 (_2!2401 lt!75819))))))))))

(assert (=> b!48853 d!15154))

(declare-fun d!15156 () Bool)

(declare-fun res!41263 () Bool)

(declare-fun e!32498 () Bool)

(assert (=> d!15156 (=> (not res!41263) (not e!32498))))

(assert (=> d!15156 (= res!41263 (= (size!1050 (buf!1402 thiss!1379)) (size!1050 (buf!1402 (_2!2401 lt!75814)))))))

(assert (=> d!15156 (= (isPrefixOf!0 thiss!1379 (_2!2401 lt!75814)) e!32498)))

(declare-fun b!49212 () Bool)

(declare-fun res!41264 () Bool)

(assert (=> b!49212 (=> (not res!41264) (not e!32498))))

(assert (=> b!49212 (= res!41264 (bvsle (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379)) (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814)))))))

(declare-fun b!49213 () Bool)

(declare-fun e!32497 () Bool)

(assert (=> b!49213 (= e!32498 e!32497)))

(declare-fun res!41262 () Bool)

(assert (=> b!49213 (=> res!41262 e!32497)))

(assert (=> b!49213 (= res!41262 (= (size!1050 (buf!1402 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!49214 () Bool)

(assert (=> b!49214 (= e!32497 (arrayBitRangesEq!0 (buf!1402 thiss!1379) (buf!1402 (_2!2401 lt!75814)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379))))))

(assert (= (and d!15156 res!41263) b!49212))

(assert (= (and b!49212 res!41264) b!49213))

(assert (= (and b!49213 (not res!41262)) b!49214))

(assert (=> b!49212 m!76051))

(assert (=> b!49212 m!76035))

(assert (=> b!49214 m!76051))

(assert (=> b!49214 m!76051))

(declare-fun m!76743 () Bool)

(assert (=> b!49214 m!76743))

(assert (=> b!48852 d!15156))

(declare-fun d!15158 () Bool)

(assert (=> d!15158 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))) lt!75820) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814)))) lt!75820))))

(declare-fun bs!3863 () Bool)

(assert (= bs!3863 d!15158))

(declare-fun m!76745 () Bool)

(assert (=> bs!3863 m!76745))

(assert (=> b!48852 d!15158))

(declare-fun d!15160 () Bool)

(declare-fun e!32501 () Bool)

(assert (=> d!15160 e!32501))

(declare-fun res!41267 () Bool)

(assert (=> d!15160 (=> (not res!41267) (not e!32501))))

(assert (=> d!15160 (= res!41267 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!76717 () Unit!3418)

(declare-fun choose!27 (BitStream!1820 BitStream!1820 (_ BitVec 64) (_ BitVec 64)) Unit!3418)

(assert (=> d!15160 (= lt!76717 (choose!27 thiss!1379 (_2!2401 lt!75814) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!15160 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!15160 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2401 lt!75814) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!76717)))

(declare-fun b!49217 () Bool)

(assert (=> b!49217 (= e!32501 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!15160 res!41267) b!49217))

(declare-fun m!76747 () Bool)

(assert (=> d!15160 m!76747))

(declare-fun m!76749 () Bool)

(assert (=> b!49217 m!76749))

(assert (=> b!48852 d!15160))

(declare-fun d!15162 () Bool)

(declare-fun e!32510 () Bool)

(assert (=> d!15162 e!32510))

(declare-fun res!41287 () Bool)

(assert (=> d!15162 (=> (not res!41287) (not e!32510))))

(declare-fun lt!76751 () tuple2!4604)

(assert (=> d!15162 (= res!41287 (= (size!1050 (buf!1402 (_2!2401 lt!76751))) (size!1050 (buf!1402 thiss!1379))))))

(declare-fun lt!76747 () (_ BitVec 8))

(declare-fun lt!76743 () array!2315)

(assert (=> d!15162 (= lt!76747 (select (arr!1576 lt!76743) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!15162 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1050 lt!76743)))))

(assert (=> d!15162 (= lt!76743 (array!2316 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!76745 () tuple2!4604)

(assert (=> d!15162 (= lt!76751 (tuple2!4605 (_1!2401 lt!76745) (_2!2401 lt!76745)))))

(declare-fun lt!76750 () tuple2!4604)

(assert (=> d!15162 (= lt!76745 lt!76750)))

(declare-fun e!32513 () Bool)

(assert (=> d!15162 e!32513))

(declare-fun res!41286 () Bool)

(assert (=> d!15162 (=> (not res!41286) (not e!32513))))

(assert (=> d!15162 (= res!41286 (= (size!1050 (buf!1402 thiss!1379)) (size!1050 (buf!1402 (_2!2401 lt!76750)))))))

(declare-fun lt!76742 () Bool)

(declare-fun appendBit!0 (BitStream!1820 Bool) tuple2!4604)

(assert (=> d!15162 (= lt!76750 (appendBit!0 thiss!1379 lt!76742))))

(assert (=> d!15162 (= lt!76742 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1576 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!15162 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!15162 (= (appendBitFromByte!0 thiss!1379 (select (arr!1576 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!76751)))

(declare-fun b!49235 () Bool)

(declare-fun e!32511 () Bool)

(assert (=> b!49235 (= e!32510 e!32511)))

(declare-fun res!41285 () Bool)

(assert (=> b!49235 (=> (not res!41285) (not e!32511))))

(declare-datatypes ((tuple2!4630 0))(
  ( (tuple2!4631 (_1!2414 BitStream!1820) (_2!2414 Bool)) )
))
(declare-fun lt!76746 () tuple2!4630)

(assert (=> b!49235 (= res!41285 (and (= (_2!2414 lt!76746) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1576 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!76747)) #b00000000000000000000000000000000))) (= (_1!2414 lt!76746) (_2!2401 lt!76751))))))

(declare-fun lt!76753 () tuple2!4624)

(declare-fun lt!76752 () BitStream!1820)

(assert (=> b!49235 (= lt!76753 (readBits!0 lt!76752 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1820) tuple2!4630)

(assert (=> b!49235 (= lt!76746 (readBitPure!0 lt!76752))))

(declare-fun readerFrom!0 (BitStream!1820 (_ BitVec 32) (_ BitVec 32)) BitStream!1820)

(assert (=> b!49235 (= lt!76752 (readerFrom!0 (_2!2401 lt!76751) (currentBit!2914 thiss!1379) (currentByte!2919 thiss!1379)))))

(declare-fun b!49236 () Bool)

(declare-fun e!32512 () Bool)

(assert (=> b!49236 (= e!32513 e!32512)))

(declare-fun res!41288 () Bool)

(assert (=> b!49236 (=> (not res!41288) (not e!32512))))

(declare-fun lt!76749 () tuple2!4630)

(assert (=> b!49236 (= res!41288 (and (= (_2!2414 lt!76749) lt!76742) (= (_1!2414 lt!76749) (_2!2401 lt!76750))))))

(assert (=> b!49236 (= lt!76749 (readBitPure!0 (readerFrom!0 (_2!2401 lt!76750) (currentBit!2914 thiss!1379) (currentByte!2919 thiss!1379))))))

(declare-fun b!49237 () Bool)

(declare-fun res!41291 () Bool)

(assert (=> b!49237 (=> (not res!41291) (not e!32510))))

(assert (=> b!49237 (= res!41291 (isPrefixOf!0 thiss!1379 (_2!2401 lt!76751)))))

(declare-fun b!49238 () Bool)

(declare-fun res!41284 () Bool)

(assert (=> b!49238 (=> (not res!41284) (not e!32513))))

(assert (=> b!49238 (= res!41284 (= (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76750))) (currentByte!2919 (_2!2401 lt!76750)) (currentBit!2914 (_2!2401 lt!76750))) (bvadd (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!49239 () Bool)

(declare-fun res!41290 () Bool)

(assert (=> b!49239 (=> (not res!41290) (not e!32513))))

(assert (=> b!49239 (= res!41290 (isPrefixOf!0 thiss!1379 (_2!2401 lt!76750)))))

(declare-fun b!49240 () Bool)

(assert (=> b!49240 (= e!32511 (= (bitIndex!0 (size!1050 (buf!1402 (_1!2414 lt!76746))) (currentByte!2919 (_1!2414 lt!76746)) (currentBit!2914 (_1!2414 lt!76746))) (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76751))) (currentByte!2919 (_2!2401 lt!76751)) (currentBit!2914 (_2!2401 lt!76751)))))))

(declare-fun b!49241 () Bool)

(assert (=> b!49241 (= e!32512 (= (bitIndex!0 (size!1050 (buf!1402 (_1!2414 lt!76749))) (currentByte!2919 (_1!2414 lt!76749)) (currentBit!2914 (_1!2414 lt!76749))) (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76750))) (currentByte!2919 (_2!2401 lt!76750)) (currentBit!2914 (_2!2401 lt!76750)))))))

(declare-fun b!49242 () Bool)

(declare-fun res!41289 () Bool)

(assert (=> b!49242 (=> (not res!41289) (not e!32510))))

(declare-fun lt!76748 () (_ BitVec 64))

(declare-fun lt!76744 () (_ BitVec 64))

(assert (=> b!49242 (= res!41289 (= (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76751))) (currentByte!2919 (_2!2401 lt!76751)) (currentBit!2914 (_2!2401 lt!76751))) (bvadd lt!76748 lt!76744)))))

(assert (=> b!49242 (or (not (= (bvand lt!76748 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76744 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!76748 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!76748 lt!76744) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49242 (= lt!76744 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!49242 (= lt!76748 (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379)))))

(assert (= (and d!15162 res!41286) b!49238))

(assert (= (and b!49238 res!41284) b!49239))

(assert (= (and b!49239 res!41290) b!49236))

(assert (= (and b!49236 res!41288) b!49241))

(assert (= (and d!15162 res!41287) b!49242))

(assert (= (and b!49242 res!41289) b!49237))

(assert (= (and b!49237 res!41291) b!49235))

(assert (= (and b!49235 res!41285) b!49240))

(declare-fun m!76751 () Bool)

(assert (=> b!49237 m!76751))

(declare-fun m!76753 () Bool)

(assert (=> b!49238 m!76753))

(assert (=> b!49238 m!76051))

(declare-fun m!76755 () Bool)

(assert (=> b!49239 m!76755))

(declare-fun m!76757 () Bool)

(assert (=> b!49241 m!76757))

(assert (=> b!49241 m!76753))

(declare-fun m!76759 () Bool)

(assert (=> b!49240 m!76759))

(declare-fun m!76761 () Bool)

(assert (=> b!49240 m!76761))

(declare-fun m!76763 () Bool)

(assert (=> b!49236 m!76763))

(assert (=> b!49236 m!76763))

(declare-fun m!76765 () Bool)

(assert (=> b!49236 m!76765))

(declare-fun m!76767 () Bool)

(assert (=> b!49235 m!76767))

(declare-fun m!76769 () Bool)

(assert (=> b!49235 m!76769))

(declare-fun m!76771 () Bool)

(assert (=> b!49235 m!76771))

(assert (=> b!49242 m!76761))

(assert (=> b!49242 m!76051))

(declare-fun m!76773 () Bool)

(assert (=> d!15162 m!76773))

(declare-fun m!76775 () Bool)

(assert (=> d!15162 m!76775))

(assert (=> d!15162 m!76723))

(assert (=> b!48852 d!15162))

(declare-fun d!15164 () Bool)

(assert (=> d!15164 (= (invariant!0 (currentBit!2914 (_2!2401 lt!75819)) (currentByte!2919 (_2!2401 lt!75819)) (size!1050 (buf!1402 (_2!2401 lt!75819)))) (and (bvsge (currentBit!2914 (_2!2401 lt!75819)) #b00000000000000000000000000000000) (bvslt (currentBit!2914 (_2!2401 lt!75819)) #b00000000000000000000000000001000) (bvsge (currentByte!2919 (_2!2401 lt!75819)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2919 (_2!2401 lt!75819)) (size!1050 (buf!1402 (_2!2401 lt!75819)))) (and (= (currentBit!2914 (_2!2401 lt!75819)) #b00000000000000000000000000000000) (= (currentByte!2919 (_2!2401 lt!75819)) (size!1050 (buf!1402 (_2!2401 lt!75819))))))))))

(assert (=> b!48862 d!15164))

(declare-fun d!15166 () Bool)

(assert (=> d!15166 (= (bitAt!0 (buf!1402 (_1!2402 lt!75804)) lt!75810) (not (= (bvand ((_ sign_extend 24) (select (arr!1576 (buf!1402 (_1!2402 lt!75804))) ((_ extract 31 0) (bvsdiv lt!75810 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!75810 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3864 () Bool)

(assert (= bs!3864 d!15166))

(declare-fun m!76777 () Bool)

(assert (=> bs!3864 m!76777))

(assert (=> bs!3864 m!76741))

(assert (=> b!48851 d!15166))

(declare-fun d!15168 () Bool)

(assert (=> d!15168 (= (bitAt!0 (buf!1402 (_1!2402 lt!75823)) lt!75810) (not (= (bvand ((_ sign_extend 24) (select (arr!1576 (buf!1402 (_1!2402 lt!75823))) ((_ extract 31 0) (bvsdiv lt!75810 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!75810 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3865 () Bool)

(assert (= bs!3865 d!15168))

(declare-fun m!76779 () Bool)

(assert (=> bs!3865 m!76779))

(assert (=> bs!3865 m!76741))

(assert (=> b!48851 d!15168))

(declare-fun d!15170 () Bool)

(assert (=> d!15170 (= (invariant!0 (currentBit!2914 (_2!2401 lt!75814)) (currentByte!2919 (_2!2401 lt!75814)) (size!1050 (buf!1402 (_2!2401 lt!75814)))) (and (bvsge (currentBit!2914 (_2!2401 lt!75814)) #b00000000000000000000000000000000) (bvslt (currentBit!2914 (_2!2401 lt!75814)) #b00000000000000000000000000001000) (bvsge (currentByte!2919 (_2!2401 lt!75814)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2919 (_2!2401 lt!75814)) (size!1050 (buf!1402 (_2!2401 lt!75814)))) (and (= (currentBit!2914 (_2!2401 lt!75814)) #b00000000000000000000000000000000) (= (currentByte!2919 (_2!2401 lt!75814)) (size!1050 (buf!1402 (_2!2401 lt!75814))))))))))

(assert (=> b!48850 d!15170))

(declare-fun d!15172 () Bool)

(declare-fun res!41293 () Bool)

(declare-fun e!32515 () Bool)

(assert (=> d!15172 (=> (not res!41293) (not e!32515))))

(assert (=> d!15172 (= res!41293 (= (size!1050 (buf!1402 thiss!1379)) (size!1050 (buf!1402 thiss!1379))))))

(assert (=> d!15172 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!32515)))

(declare-fun b!49243 () Bool)

(declare-fun res!41294 () Bool)

(assert (=> b!49243 (=> (not res!41294) (not e!32515))))

(assert (=> b!49243 (= res!41294 (bvsle (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379)) (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379))))))

(declare-fun b!49244 () Bool)

(declare-fun e!32514 () Bool)

(assert (=> b!49244 (= e!32515 e!32514)))

(declare-fun res!41292 () Bool)

(assert (=> b!49244 (=> res!41292 e!32514)))

(assert (=> b!49244 (= res!41292 (= (size!1050 (buf!1402 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!49245 () Bool)

(assert (=> b!49245 (= e!32514 (arrayBitRangesEq!0 (buf!1402 thiss!1379) (buf!1402 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379))))))

(assert (= (and d!15172 res!41293) b!49243))

(assert (= (and b!49243 res!41294) b!49244))

(assert (= (and b!49244 (not res!41292)) b!49245))

(assert (=> b!49243 m!76051))

(assert (=> b!49243 m!76051))

(assert (=> b!49245 m!76051))

(assert (=> b!49245 m!76051))

(declare-fun m!76781 () Bool)

(assert (=> b!49245 m!76781))

(assert (=> b!48860 d!15172))

(declare-fun d!15174 () Bool)

(assert (=> d!15174 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!76756 () Unit!3418)

(declare-fun choose!11 (BitStream!1820) Unit!3418)

(assert (=> d!15174 (= lt!76756 (choose!11 thiss!1379))))

(assert (=> d!15174 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!76756)))

(declare-fun bs!3867 () Bool)

(assert (= bs!3867 d!15174))

(assert (=> bs!3867 m!76047))

(declare-fun m!76783 () Bool)

(assert (=> bs!3867 m!76783))

(assert (=> b!48860 d!15174))

(declare-fun d!15176 () Bool)

(declare-fun e!32516 () Bool)

(assert (=> d!15176 e!32516))

(declare-fun res!41295 () Bool)

(assert (=> d!15176 (=> (not res!41295) (not e!32516))))

(declare-fun lt!76760 () (_ BitVec 64))

(declare-fun lt!76758 () (_ BitVec 64))

(declare-fun lt!76762 () (_ BitVec 64))

(assert (=> d!15176 (= res!41295 (= lt!76762 (bvsub lt!76760 lt!76758)))))

(assert (=> d!15176 (or (= (bvand lt!76760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76758 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76760 lt!76758) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15176 (= lt!76758 (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 thiss!1379))) ((_ sign_extend 32) (currentByte!2919 thiss!1379)) ((_ sign_extend 32) (currentBit!2914 thiss!1379))))))

(declare-fun lt!76761 () (_ BitVec 64))

(declare-fun lt!76759 () (_ BitVec 64))

(assert (=> d!15176 (= lt!76760 (bvmul lt!76761 lt!76759))))

(assert (=> d!15176 (or (= lt!76761 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!76759 (bvsdiv (bvmul lt!76761 lt!76759) lt!76761)))))

(assert (=> d!15176 (= lt!76759 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15176 (= lt!76761 ((_ sign_extend 32) (size!1050 (buf!1402 thiss!1379))))))

(assert (=> d!15176 (= lt!76762 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2919 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2914 thiss!1379))))))

(assert (=> d!15176 (invariant!0 (currentBit!2914 thiss!1379) (currentByte!2919 thiss!1379) (size!1050 (buf!1402 thiss!1379)))))

(assert (=> d!15176 (= (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379)) lt!76762)))

(declare-fun b!49246 () Bool)

(declare-fun res!41296 () Bool)

(assert (=> b!49246 (=> (not res!41296) (not e!32516))))

(assert (=> b!49246 (= res!41296 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!76762))))

(declare-fun b!49247 () Bool)

(declare-fun lt!76757 () (_ BitVec 64))

(assert (=> b!49247 (= e!32516 (bvsle lt!76762 (bvmul lt!76757 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49247 (or (= lt!76757 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!76757 #b0000000000000000000000000000000000000000000000000000000000001000) lt!76757)))))

(assert (=> b!49247 (= lt!76757 ((_ sign_extend 32) (size!1050 (buf!1402 thiss!1379))))))

(assert (= (and d!15176 res!41295) b!49246))

(assert (= (and b!49246 res!41296) b!49247))

(declare-fun m!76785 () Bool)

(assert (=> d!15176 m!76785))

(assert (=> d!15176 m!76737))

(assert (=> b!48860 d!15176))

(declare-fun d!15178 () Bool)

(assert (=> d!15178 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 thiss!1379))) ((_ sign_extend 32) (currentByte!2919 thiss!1379)) ((_ sign_extend 32) (currentBit!2914 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 thiss!1379))) ((_ sign_extend 32) (currentByte!2919 thiss!1379)) ((_ sign_extend 32) (currentBit!2914 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3868 () Bool)

(assert (= bs!3868 d!15178))

(assert (=> bs!3868 m!76785))

(assert (=> b!48849 d!15178))

(declare-fun d!15180 () Bool)

(assert (=> d!15180 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75819)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))) lt!75820) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75819)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814)))) lt!75820))))

(declare-fun bs!3869 () Bool)

(assert (= bs!3869 d!15180))

(declare-fun m!76787 () Bool)

(assert (=> bs!3869 m!76787))

(assert (=> b!48848 d!15180))

(declare-fun d!15182 () Bool)

(assert (=> d!15182 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75819)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))) lt!75820)))

(declare-fun lt!76763 () Unit!3418)

(assert (=> d!15182 (= lt!76763 (choose!9 (_2!2401 lt!75814) (buf!1402 (_2!2401 lt!75819)) lt!75820 (BitStream!1821 (buf!1402 (_2!2401 lt!75819)) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814)))))))

(assert (=> d!15182 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2401 lt!75814) (buf!1402 (_2!2401 lt!75819)) lt!75820) lt!76763)))

(declare-fun bs!3870 () Bool)

(assert (= bs!3870 d!15182))

(assert (=> bs!3870 m!76005))

(declare-fun m!76789 () Bool)

(assert (=> bs!3870 m!76789))

(assert (=> b!48848 d!15182))

(declare-fun d!15184 () Bool)

(assert (=> d!15184 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75819)))) ((_ sign_extend 32) (currentByte!2919 thiss!1379)) ((_ sign_extend 32) (currentBit!2914 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!76764 () Unit!3418)

(assert (=> d!15184 (= lt!76764 (choose!9 thiss!1379 (buf!1402 (_2!2401 lt!75819)) (bvsub to!314 i!635) (BitStream!1821 (buf!1402 (_2!2401 lt!75819)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379))))))

(assert (=> d!15184 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1402 (_2!2401 lt!75819)) (bvsub to!314 i!635)) lt!76764)))

(declare-fun bs!3871 () Bool)

(assert (= bs!3871 d!15184))

(assert (=> bs!3871 m!76009))

(declare-fun m!76791 () Bool)

(assert (=> bs!3871 m!76791))

(assert (=> b!48848 d!15184))

(declare-fun d!15186 () Bool)

(declare-fun e!32517 () Bool)

(assert (=> d!15186 e!32517))

(declare-fun c!3484 () Bool)

(assert (=> d!15186 (= c!3484 (= lt!75820 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!76767 () List!551)

(declare-fun e!32518 () tuple2!4626)

(assert (=> d!15186 (= lt!76767 (_1!2412 e!32518))))

(declare-fun c!3485 () Bool)

(assert (=> d!15186 (= c!3485 (= lt!75820 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15186 (bvsge lt!75820 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15186 (= (bitStreamReadBitsIntoList!0 (_2!2401 lt!75819) (_1!2402 lt!75804) lt!75820) lt!76767)))

(declare-fun b!49249 () Bool)

(declare-fun lt!76765 () (_ BitVec 64))

(declare-fun lt!76766 () tuple2!4628)

(assert (=> b!49249 (= e!32518 (tuple2!4627 (Cons!547 (_1!2413 lt!76766) (bitStreamReadBitsIntoList!0 (_2!2401 lt!75819) (_2!2413 lt!76766) (bvsub lt!75820 lt!76765))) (_2!2413 lt!76766)))))

(assert (=> b!49249 (= lt!76766 (readBit!0 (_1!2402 lt!75804)))))

(assert (=> b!49249 (= lt!76765 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!49248 () Bool)

(assert (=> b!49248 (= e!32518 (tuple2!4627 Nil!548 (_1!2402 lt!75804)))))

(declare-fun b!49250 () Bool)

(assert (=> b!49250 (= e!32517 (isEmpty!145 lt!76767))))

(declare-fun b!49251 () Bool)

(assert (=> b!49251 (= e!32517 (> (length!246 lt!76767) 0))))

(assert (= (and d!15186 c!3485) b!49248))

(assert (= (and d!15186 (not c!3485)) b!49249))

(assert (= (and d!15186 c!3484) b!49250))

(assert (= (and d!15186 (not c!3484)) b!49251))

(declare-fun m!76793 () Bool)

(assert (=> b!49249 m!76793))

(declare-fun m!76795 () Bool)

(assert (=> b!49249 m!76795))

(declare-fun m!76797 () Bool)

(assert (=> b!49250 m!76797))

(declare-fun m!76799 () Bool)

(assert (=> b!49251 m!76799))

(assert (=> b!48848 d!15186))

(declare-fun b!49252 () Bool)

(declare-fun res!41299 () Bool)

(declare-fun e!32520 () Bool)

(assert (=> b!49252 (=> (not res!41299) (not e!32520))))

(declare-fun lt!76780 () tuple2!4606)

(assert (=> b!49252 (= res!41299 (isPrefixOf!0 (_2!2402 lt!76780) (_2!2401 lt!75819)))))

(declare-fun lt!76781 () (_ BitVec 64))

(declare-fun lt!76772 () (_ BitVec 64))

(declare-fun b!49253 () Bool)

(assert (=> b!49253 (= e!32520 (= (_1!2402 lt!76780) (withMovedBitIndex!0 (_2!2402 lt!76780) (bvsub lt!76772 lt!76781))))))

(assert (=> b!49253 (or (= (bvand lt!76772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76781 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76772 lt!76781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49253 (= lt!76781 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75819))) (currentByte!2919 (_2!2401 lt!75819)) (currentBit!2914 (_2!2401 lt!75819))))))

(assert (=> b!49253 (= lt!76772 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))))))

(declare-fun d!15188 () Bool)

(assert (=> d!15188 e!32520))

(declare-fun res!41298 () Bool)

(assert (=> d!15188 (=> (not res!41298) (not e!32520))))

(assert (=> d!15188 (= res!41298 (isPrefixOf!0 (_1!2402 lt!76780) (_2!2402 lt!76780)))))

(declare-fun lt!76771 () BitStream!1820)

(assert (=> d!15188 (= lt!76780 (tuple2!4607 lt!76771 (_2!2401 lt!75819)))))

(declare-fun lt!76785 () Unit!3418)

(declare-fun lt!76775 () Unit!3418)

(assert (=> d!15188 (= lt!76785 lt!76775)))

(assert (=> d!15188 (isPrefixOf!0 lt!76771 (_2!2401 lt!75819))))

(assert (=> d!15188 (= lt!76775 (lemmaIsPrefixTransitive!0 lt!76771 (_2!2401 lt!75819) (_2!2401 lt!75819)))))

(declare-fun lt!76777 () Unit!3418)

(declare-fun lt!76774 () Unit!3418)

(assert (=> d!15188 (= lt!76777 lt!76774)))

(assert (=> d!15188 (isPrefixOf!0 lt!76771 (_2!2401 lt!75819))))

(assert (=> d!15188 (= lt!76774 (lemmaIsPrefixTransitive!0 lt!76771 (_2!2401 lt!75814) (_2!2401 lt!75819)))))

(declare-fun lt!76782 () Unit!3418)

(declare-fun e!32519 () Unit!3418)

(assert (=> d!15188 (= lt!76782 e!32519)))

(declare-fun c!3486 () Bool)

(assert (=> d!15188 (= c!3486 (not (= (size!1050 (buf!1402 (_2!2401 lt!75814))) #b00000000000000000000000000000000)))))

(declare-fun lt!76776 () Unit!3418)

(declare-fun lt!76779 () Unit!3418)

(assert (=> d!15188 (= lt!76776 lt!76779)))

(assert (=> d!15188 (isPrefixOf!0 (_2!2401 lt!75819) (_2!2401 lt!75819))))

(assert (=> d!15188 (= lt!76779 (lemmaIsPrefixRefl!0 (_2!2401 lt!75819)))))

(declare-fun lt!76768 () Unit!3418)

(declare-fun lt!76784 () Unit!3418)

(assert (=> d!15188 (= lt!76768 lt!76784)))

(assert (=> d!15188 (= lt!76784 (lemmaIsPrefixRefl!0 (_2!2401 lt!75819)))))

(declare-fun lt!76787 () Unit!3418)

(declare-fun lt!76769 () Unit!3418)

(assert (=> d!15188 (= lt!76787 lt!76769)))

(assert (=> d!15188 (isPrefixOf!0 lt!76771 lt!76771)))

(assert (=> d!15188 (= lt!76769 (lemmaIsPrefixRefl!0 lt!76771))))

(declare-fun lt!76783 () Unit!3418)

(declare-fun lt!76778 () Unit!3418)

(assert (=> d!15188 (= lt!76783 lt!76778)))

(assert (=> d!15188 (isPrefixOf!0 (_2!2401 lt!75814) (_2!2401 lt!75814))))

(assert (=> d!15188 (= lt!76778 (lemmaIsPrefixRefl!0 (_2!2401 lt!75814)))))

(assert (=> d!15188 (= lt!76771 (BitStream!1821 (buf!1402 (_2!2401 lt!75819)) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))))))

(assert (=> d!15188 (isPrefixOf!0 (_2!2401 lt!75814) (_2!2401 lt!75819))))

(assert (=> d!15188 (= (reader!0 (_2!2401 lt!75814) (_2!2401 lt!75819)) lt!76780)))

(declare-fun b!49254 () Bool)

(declare-fun lt!76770 () Unit!3418)

(assert (=> b!49254 (= e!32519 lt!76770)))

(declare-fun lt!76773 () (_ BitVec 64))

(assert (=> b!49254 (= lt!76773 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76786 () (_ BitVec 64))

(assert (=> b!49254 (= lt!76786 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))))))

(assert (=> b!49254 (= lt!76770 (arrayBitRangesEqSymmetric!0 (buf!1402 (_2!2401 lt!75814)) (buf!1402 (_2!2401 lt!75819)) lt!76773 lt!76786))))

(assert (=> b!49254 (arrayBitRangesEq!0 (buf!1402 (_2!2401 lt!75819)) (buf!1402 (_2!2401 lt!75814)) lt!76773 lt!76786)))

(declare-fun b!49255 () Bool)

(declare-fun res!41297 () Bool)

(assert (=> b!49255 (=> (not res!41297) (not e!32520))))

(assert (=> b!49255 (= res!41297 (isPrefixOf!0 (_1!2402 lt!76780) (_2!2401 lt!75814)))))

(declare-fun b!49256 () Bool)

(declare-fun Unit!3448 () Unit!3418)

(assert (=> b!49256 (= e!32519 Unit!3448)))

(assert (= (and d!15188 c!3486) b!49254))

(assert (= (and d!15188 (not c!3486)) b!49256))

(assert (= (and d!15188 res!41298) b!49255))

(assert (= (and b!49255 res!41297) b!49252))

(assert (= (and b!49252 res!41299) b!49253))

(declare-fun m!76801 () Bool)

(assert (=> b!49255 m!76801))

(assert (=> b!49254 m!76035))

(declare-fun m!76803 () Bool)

(assert (=> b!49254 m!76803))

(declare-fun m!76805 () Bool)

(assert (=> b!49254 m!76805))

(declare-fun m!76807 () Bool)

(assert (=> b!49252 m!76807))

(declare-fun m!76809 () Bool)

(assert (=> b!49253 m!76809))

(assert (=> b!49253 m!76015))

(assert (=> b!49253 m!76035))

(declare-fun m!76811 () Bool)

(assert (=> d!15188 m!76811))

(assert (=> d!15188 m!75983))

(declare-fun m!76813 () Bool)

(assert (=> d!15188 m!76813))

(declare-fun m!76815 () Bool)

(assert (=> d!15188 m!76815))

(assert (=> d!15188 m!76513))

(declare-fun m!76817 () Bool)

(assert (=> d!15188 m!76817))

(declare-fun m!76819 () Bool)

(assert (=> d!15188 m!76819))

(declare-fun m!76821 () Bool)

(assert (=> d!15188 m!76821))

(declare-fun m!76823 () Bool)

(assert (=> d!15188 m!76823))

(declare-fun m!76825 () Bool)

(assert (=> d!15188 m!76825))

(assert (=> d!15188 m!76517))

(assert (=> b!48848 d!15188))

(declare-fun b!49257 () Bool)

(declare-fun res!41302 () Bool)

(declare-fun e!32522 () Bool)

(assert (=> b!49257 (=> (not res!41302) (not e!32522))))

(declare-fun lt!76800 () tuple2!4606)

(assert (=> b!49257 (= res!41302 (isPrefixOf!0 (_2!2402 lt!76800) (_2!2401 lt!75819)))))

(declare-fun lt!76792 () (_ BitVec 64))

(declare-fun lt!76801 () (_ BitVec 64))

(declare-fun b!49258 () Bool)

(assert (=> b!49258 (= e!32522 (= (_1!2402 lt!76800) (withMovedBitIndex!0 (_2!2402 lt!76800) (bvsub lt!76792 lt!76801))))))

(assert (=> b!49258 (or (= (bvand lt!76792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76801 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76792 lt!76801) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49258 (= lt!76801 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75819))) (currentByte!2919 (_2!2401 lt!75819)) (currentBit!2914 (_2!2401 lt!75819))))))

(assert (=> b!49258 (= lt!76792 (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379)))))

(declare-fun d!15190 () Bool)

(assert (=> d!15190 e!32522))

(declare-fun res!41301 () Bool)

(assert (=> d!15190 (=> (not res!41301) (not e!32522))))

(assert (=> d!15190 (= res!41301 (isPrefixOf!0 (_1!2402 lt!76800) (_2!2402 lt!76800)))))

(declare-fun lt!76791 () BitStream!1820)

(assert (=> d!15190 (= lt!76800 (tuple2!4607 lt!76791 (_2!2401 lt!75819)))))

(declare-fun lt!76805 () Unit!3418)

(declare-fun lt!76795 () Unit!3418)

(assert (=> d!15190 (= lt!76805 lt!76795)))

(assert (=> d!15190 (isPrefixOf!0 lt!76791 (_2!2401 lt!75819))))

(assert (=> d!15190 (= lt!76795 (lemmaIsPrefixTransitive!0 lt!76791 (_2!2401 lt!75819) (_2!2401 lt!75819)))))

(declare-fun lt!76797 () Unit!3418)

(declare-fun lt!76794 () Unit!3418)

(assert (=> d!15190 (= lt!76797 lt!76794)))

(assert (=> d!15190 (isPrefixOf!0 lt!76791 (_2!2401 lt!75819))))

(assert (=> d!15190 (= lt!76794 (lemmaIsPrefixTransitive!0 lt!76791 thiss!1379 (_2!2401 lt!75819)))))

(declare-fun lt!76802 () Unit!3418)

(declare-fun e!32521 () Unit!3418)

(assert (=> d!15190 (= lt!76802 e!32521)))

(declare-fun c!3487 () Bool)

(assert (=> d!15190 (= c!3487 (not (= (size!1050 (buf!1402 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!76796 () Unit!3418)

(declare-fun lt!76799 () Unit!3418)

(assert (=> d!15190 (= lt!76796 lt!76799)))

(assert (=> d!15190 (isPrefixOf!0 (_2!2401 lt!75819) (_2!2401 lt!75819))))

(assert (=> d!15190 (= lt!76799 (lemmaIsPrefixRefl!0 (_2!2401 lt!75819)))))

(declare-fun lt!76788 () Unit!3418)

(declare-fun lt!76804 () Unit!3418)

(assert (=> d!15190 (= lt!76788 lt!76804)))

(assert (=> d!15190 (= lt!76804 (lemmaIsPrefixRefl!0 (_2!2401 lt!75819)))))

(declare-fun lt!76807 () Unit!3418)

(declare-fun lt!76789 () Unit!3418)

(assert (=> d!15190 (= lt!76807 lt!76789)))

(assert (=> d!15190 (isPrefixOf!0 lt!76791 lt!76791)))

(assert (=> d!15190 (= lt!76789 (lemmaIsPrefixRefl!0 lt!76791))))

(declare-fun lt!76803 () Unit!3418)

(declare-fun lt!76798 () Unit!3418)

(assert (=> d!15190 (= lt!76803 lt!76798)))

(assert (=> d!15190 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!15190 (= lt!76798 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!15190 (= lt!76791 (BitStream!1821 (buf!1402 (_2!2401 lt!75819)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379)))))

(assert (=> d!15190 (isPrefixOf!0 thiss!1379 (_2!2401 lt!75819))))

(assert (=> d!15190 (= (reader!0 thiss!1379 (_2!2401 lt!75819)) lt!76800)))

(declare-fun b!49259 () Bool)

(declare-fun lt!76790 () Unit!3418)

(assert (=> b!49259 (= e!32521 lt!76790)))

(declare-fun lt!76793 () (_ BitVec 64))

(assert (=> b!49259 (= lt!76793 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76806 () (_ BitVec 64))

(assert (=> b!49259 (= lt!76806 (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379)))))

(assert (=> b!49259 (= lt!76790 (arrayBitRangesEqSymmetric!0 (buf!1402 thiss!1379) (buf!1402 (_2!2401 lt!75819)) lt!76793 lt!76806))))

(assert (=> b!49259 (arrayBitRangesEq!0 (buf!1402 (_2!2401 lt!75819)) (buf!1402 thiss!1379) lt!76793 lt!76806)))

(declare-fun b!49260 () Bool)

(declare-fun res!41300 () Bool)

(assert (=> b!49260 (=> (not res!41300) (not e!32522))))

(assert (=> b!49260 (= res!41300 (isPrefixOf!0 (_1!2402 lt!76800) thiss!1379))))

(declare-fun b!49261 () Bool)

(declare-fun Unit!3449 () Unit!3418)

(assert (=> b!49261 (= e!32521 Unit!3449)))

(assert (= (and d!15190 c!3487) b!49259))

(assert (= (and d!15190 (not c!3487)) b!49261))

(assert (= (and d!15190 res!41301) b!49260))

(assert (= (and b!49260 res!41300) b!49257))

(assert (= (and b!49257 res!41302) b!49258))

(declare-fun m!76827 () Bool)

(assert (=> b!49260 m!76827))

(assert (=> b!49259 m!76051))

(declare-fun m!76829 () Bool)

(assert (=> b!49259 m!76829))

(declare-fun m!76831 () Bool)

(assert (=> b!49259 m!76831))

(declare-fun m!76833 () Bool)

(assert (=> b!49257 m!76833))

(declare-fun m!76835 () Bool)

(assert (=> b!49258 m!76835))

(assert (=> b!49258 m!76015))

(assert (=> b!49258 m!76051))

(declare-fun m!76837 () Bool)

(assert (=> d!15190 m!76837))

(assert (=> d!15190 m!75989))

(declare-fun m!76839 () Bool)

(assert (=> d!15190 m!76839))

(declare-fun m!76841 () Bool)

(assert (=> d!15190 m!76841))

(assert (=> d!15190 m!76049))

(assert (=> d!15190 m!76817))

(declare-fun m!76843 () Bool)

(assert (=> d!15190 m!76843))

(assert (=> d!15190 m!76821))

(declare-fun m!76845 () Bool)

(assert (=> d!15190 m!76845))

(declare-fun m!76847 () Bool)

(assert (=> d!15190 m!76847))

(assert (=> d!15190 m!76047))

(assert (=> b!48848 d!15190))

(declare-fun d!15192 () Bool)

(declare-fun e!32523 () Bool)

(assert (=> d!15192 e!32523))

(declare-fun c!3488 () Bool)

(assert (=> d!15192 (= c!3488 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!76810 () List!551)

(declare-fun e!32524 () tuple2!4626)

(assert (=> d!15192 (= lt!76810 (_1!2412 e!32524))))

(declare-fun c!3489 () Bool)

(assert (=> d!15192 (= c!3489 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15192 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15192 (= (bitStreamReadBitsIntoList!0 (_2!2401 lt!75819) (_1!2402 lt!75823) (bvsub to!314 i!635)) lt!76810)))

(declare-fun b!49263 () Bool)

(declare-fun lt!76809 () tuple2!4628)

(declare-fun lt!76808 () (_ BitVec 64))

(assert (=> b!49263 (= e!32524 (tuple2!4627 (Cons!547 (_1!2413 lt!76809) (bitStreamReadBitsIntoList!0 (_2!2401 lt!75819) (_2!2413 lt!76809) (bvsub (bvsub to!314 i!635) lt!76808))) (_2!2413 lt!76809)))))

(assert (=> b!49263 (= lt!76809 (readBit!0 (_1!2402 lt!75823)))))

(assert (=> b!49263 (= lt!76808 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!49262 () Bool)

(assert (=> b!49262 (= e!32524 (tuple2!4627 Nil!548 (_1!2402 lt!75823)))))

(declare-fun b!49264 () Bool)

(assert (=> b!49264 (= e!32523 (isEmpty!145 lt!76810))))

(declare-fun b!49265 () Bool)

(assert (=> b!49265 (= e!32523 (> (length!246 lt!76810) 0))))

(assert (= (and d!15192 c!3489) b!49262))

(assert (= (and d!15192 (not c!3489)) b!49263))

(assert (= (and d!15192 c!3488) b!49264))

(assert (= (and d!15192 (not c!3488)) b!49265))

(declare-fun m!76849 () Bool)

(assert (=> b!49263 m!76849))

(declare-fun m!76851 () Bool)

(assert (=> b!49263 m!76851))

(declare-fun m!76853 () Bool)

(assert (=> b!49264 m!76853))

(declare-fun m!76855 () Bool)

(assert (=> b!49265 m!76855))

(assert (=> b!48848 d!15192))

(declare-fun d!15194 () Bool)

(assert (=> d!15194 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75819)))) ((_ sign_extend 32) (currentByte!2919 thiss!1379)) ((_ sign_extend 32) (currentBit!2914 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75819)))) ((_ sign_extend 32) (currentByte!2919 thiss!1379)) ((_ sign_extend 32) (currentBit!2914 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3872 () Bool)

(assert (= bs!3872 d!15194))

(declare-fun m!76857 () Bool)

(assert (=> bs!3872 m!76857))

(assert (=> b!48848 d!15194))

(declare-fun d!15196 () Bool)

(assert (=> d!15196 (= (array_inv!963 (buf!1402 thiss!1379)) (bvsge (size!1050 (buf!1402 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!48859 d!15196))

(declare-fun d!15198 () Bool)

(declare-fun size!1053 (List!551) Int)

(assert (=> d!15198 (= (length!246 lt!75806) (size!1053 lt!75806))))

(declare-fun bs!3873 () Bool)

(assert (= bs!3873 d!15198))

(declare-fun m!76859 () Bool)

(assert (=> bs!3873 m!76859))

(assert (=> b!48858 d!15198))

(declare-fun d!15200 () Bool)

(declare-fun e!32525 () Bool)

(assert (=> d!15200 e!32525))

(declare-fun res!41303 () Bool)

(assert (=> d!15200 (=> (not res!41303) (not e!32525))))

(declare-fun lt!76814 () (_ BitVec 64))

(declare-fun lt!76812 () (_ BitVec 64))

(declare-fun lt!76816 () (_ BitVec 64))

(assert (=> d!15200 (= res!41303 (= lt!76816 (bvsub lt!76814 lt!76812)))))

(assert (=> d!15200 (or (= (bvand lt!76814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76812 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76814 lt!76812) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15200 (= lt!76812 (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814)))))))

(declare-fun lt!76815 () (_ BitVec 64))

(declare-fun lt!76813 () (_ BitVec 64))

(assert (=> d!15200 (= lt!76814 (bvmul lt!76815 lt!76813))))

(assert (=> d!15200 (or (= lt!76815 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!76813 (bvsdiv (bvmul lt!76815 lt!76813) lt!76815)))))

(assert (=> d!15200 (= lt!76813 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15200 (= lt!76815 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))))))

(assert (=> d!15200 (= lt!76816 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814)))))))

(assert (=> d!15200 (invariant!0 (currentBit!2914 (_2!2401 lt!75814)) (currentByte!2919 (_2!2401 lt!75814)) (size!1050 (buf!1402 (_2!2401 lt!75814))))))

(assert (=> d!15200 (= (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))) lt!76816)))

(declare-fun b!49266 () Bool)

(declare-fun res!41304 () Bool)

(assert (=> b!49266 (=> (not res!41304) (not e!32525))))

(assert (=> b!49266 (= res!41304 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!76816))))

(declare-fun b!49267 () Bool)

(declare-fun lt!76811 () (_ BitVec 64))

(assert (=> b!49267 (= e!32525 (bvsle lt!76816 (bvmul lt!76811 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49267 (or (= lt!76811 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!76811 #b0000000000000000000000000000000000000000000000000000000000001000) lt!76811)))))

(assert (=> b!49267 (= lt!76811 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))))))

(assert (= (and d!15200 res!41303) b!49266))

(assert (= (and b!49266 res!41304) b!49267))

(assert (=> d!15200 m!76745))

(assert (=> d!15200 m!76043))

(assert (=> b!48847 d!15200))

(declare-fun d!15202 () Bool)

(assert (=> d!15202 (= (tail!237 lt!75806) (t!1301 lt!75806))))

(assert (=> b!48846 d!15202))

(declare-fun d!15204 () Bool)

(declare-fun e!32528 () Bool)

(assert (=> d!15204 e!32528))

(declare-fun res!41307 () Bool)

(assert (=> d!15204 (=> (not res!41307) (not e!32528))))

(declare-fun lt!76822 () (_ BitVec 64))

(assert (=> d!15204 (= res!41307 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76822 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!76822) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!15204 (= lt!76822 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!76821 () Unit!3418)

(declare-fun choose!42 (BitStream!1820 BitStream!1820 BitStream!1820 BitStream!1820 (_ BitVec 64) List!551) Unit!3418)

(assert (=> d!15204 (= lt!76821 (choose!42 (_2!2401 lt!75819) (_2!2401 lt!75819) (_1!2402 lt!75823) (_1!2402 lt!75804) (bvsub to!314 i!635) lt!75806))))

(assert (=> d!15204 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15204 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2401 lt!75819) (_2!2401 lt!75819) (_1!2402 lt!75823) (_1!2402 lt!75804) (bvsub to!314 i!635) lt!75806) lt!76821)))

(declare-fun b!49270 () Bool)

(assert (=> b!49270 (= e!32528 (= (bitStreamReadBitsIntoList!0 (_2!2401 lt!75819) (_1!2402 lt!75804) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!237 lt!75806)))))

(assert (= (and d!15204 res!41307) b!49270))

(declare-fun m!76861 () Bool)

(assert (=> d!15204 m!76861))

(declare-fun m!76863 () Bool)

(assert (=> b!49270 m!76863))

(assert (=> b!49270 m!76017))

(assert (=> b!48846 d!15204))

(declare-fun d!15206 () Bool)

(assert (=> d!15206 (= (head!370 lt!75806) (h!666 lt!75806))))

(assert (=> b!48857 d!15206))

(push 1)

(assert (not b!49209))

(assert (not b!49211))

(assert (not b!49182))

(assert (not b!49181))

(assert (not b!49258))

(assert (not b!49075))

(assert (not b!49242))

(assert (not b!49263))

(assert (not b!49101))

(assert (not b!49210))

(assert (not d!15200))

(assert (not d!15002))

(assert (not b!49257))

(assert (not b!49212))

(assert (not b!49265))

(assert (not b!49184))

(assert (not b!49254))

(assert (not b!49189))

(assert (not d!15176))

(assert (not d!15150))

(assert (not b!49197))

(assert (not b!49250))

(assert (not d!15178))

(assert (not d!15204))

(assert (not d!15198))

(assert (not b!49253))

(assert (not b!49239))

(assert (not b!49241))

(assert (not b!49238))

(assert (not b!49260))

(assert (not b!49249))

(assert (not d!15074))

(assert (not d!15132))

(assert (not d!15182))

(assert (not b!49077))

(assert (not d!15004))

(assert (not b!49237))

(assert (not b!49199))

(assert (not d!15188))

(assert (not d!15184))

(assert (not b!49191))

(assert (not b!49252))

(assert (not d!15174))

(assert (not b!49264))

(assert (not b!49255))

(assert (not b!49235))

(assert (not d!15180))

(assert (not d!15194))

(assert (not b!49240))

(assert (not b!49236))

(assert (not b!49076))

(assert (not b!49186))

(assert (not b!49078))

(assert (not b!49185))

(assert (not b!49187))

(assert (not d!15082))

(assert (not b!49214))

(assert (not bm!616))

(assert (not b!49251))

(assert (not d!15158))

(assert (not b!49104))

(assert (not d!15090))

(assert (not b!49245))

(assert (not b!49243))

(assert (not b!49270))

(assert (not d!15160))

(assert (not d!15190))

(assert (not b!49217))

(assert (not b!49259))

(assert (not d!15162))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!15208 () Bool)

(declare-fun lt!76825 () Int)

(assert (=> d!15208 (>= lt!76825 0)))

(declare-fun e!32531 () Int)

(assert (=> d!15208 (= lt!76825 e!32531)))

(declare-fun c!3492 () Bool)

(assert (=> d!15208 (= c!3492 (is-Nil!548 lt!75806))))

(assert (=> d!15208 (= (size!1053 lt!75806) lt!76825)))

(declare-fun b!49275 () Bool)

(assert (=> b!49275 (= e!32531 0)))

(declare-fun b!49276 () Bool)

(assert (=> b!49276 (= e!32531 (+ 1 (size!1053 (t!1301 lt!75806))))))

(assert (= (and d!15208 c!3492) b!49275))

(assert (= (and d!15208 (not c!3492)) b!49276))

(declare-fun m!76865 () Bool)

(assert (=> b!49276 m!76865))

(assert (=> d!15198 d!15208))

(assert (=> b!49101 d!15176))

(assert (=> b!49101 d!15002))

(declare-fun d!15210 () Bool)

(assert (=> d!15210 (= (isEmpty!145 lt!76767) (is-Nil!548 lt!76767))))

(assert (=> b!49250 d!15210))

(declare-fun b!49277 () Bool)

(declare-fun res!41310 () Bool)

(declare-fun e!32533 () Bool)

(assert (=> b!49277 (=> (not res!41310) (not e!32533))))

(declare-fun lt!76838 () tuple2!4606)

(assert (=> b!49277 (= res!41310 (isPrefixOf!0 (_2!2402 lt!76838) (ite c!3473 (_2!2401 lt!76678) (_2!2401 lt!75814))))))

(declare-fun lt!76839 () (_ BitVec 64))

(declare-fun b!49278 () Bool)

(declare-fun lt!76830 () (_ BitVec 64))

(assert (=> b!49278 (= e!32533 (= (_1!2402 lt!76838) (withMovedBitIndex!0 (_2!2402 lt!76838) (bvsub lt!76830 lt!76839))))))

(assert (=> b!49278 (or (= (bvand lt!76830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76839 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76830 lt!76839) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49278 (= lt!76839 (bitIndex!0 (size!1050 (buf!1402 (ite c!3473 (_2!2401 lt!76678) (_2!2401 lt!75814)))) (currentByte!2919 (ite c!3473 (_2!2401 lt!76678) (_2!2401 lt!75814))) (currentBit!2914 (ite c!3473 (_2!2401 lt!76678) (_2!2401 lt!75814)))))))

(assert (=> b!49278 (= lt!76830 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))))))

(declare-fun d!15212 () Bool)

(assert (=> d!15212 e!32533))

(declare-fun res!41309 () Bool)

(assert (=> d!15212 (=> (not res!41309) (not e!32533))))

(assert (=> d!15212 (= res!41309 (isPrefixOf!0 (_1!2402 lt!76838) (_2!2402 lt!76838)))))

(declare-fun lt!76829 () BitStream!1820)

(assert (=> d!15212 (= lt!76838 (tuple2!4607 lt!76829 (ite c!3473 (_2!2401 lt!76678) (_2!2401 lt!75814))))))

(declare-fun lt!76843 () Unit!3418)

(declare-fun lt!76833 () Unit!3418)

(assert (=> d!15212 (= lt!76843 lt!76833)))

(assert (=> d!15212 (isPrefixOf!0 lt!76829 (ite c!3473 (_2!2401 lt!76678) (_2!2401 lt!75814)))))

(assert (=> d!15212 (= lt!76833 (lemmaIsPrefixTransitive!0 lt!76829 (ite c!3473 (_2!2401 lt!76678) (_2!2401 lt!75814)) (ite c!3473 (_2!2401 lt!76678) (_2!2401 lt!75814))))))

(declare-fun lt!76835 () Unit!3418)

(declare-fun lt!76832 () Unit!3418)

(assert (=> d!15212 (= lt!76835 lt!76832)))

(assert (=> d!15212 (isPrefixOf!0 lt!76829 (ite c!3473 (_2!2401 lt!76678) (_2!2401 lt!75814)))))

(assert (=> d!15212 (= lt!76832 (lemmaIsPrefixTransitive!0 lt!76829 (_2!2401 lt!75814) (ite c!3473 (_2!2401 lt!76678) (_2!2401 lt!75814))))))

(declare-fun lt!76840 () Unit!3418)

(declare-fun e!32532 () Unit!3418)

(assert (=> d!15212 (= lt!76840 e!32532)))

(declare-fun c!3493 () Bool)

(assert (=> d!15212 (= c!3493 (not (= (size!1050 (buf!1402 (_2!2401 lt!75814))) #b00000000000000000000000000000000)))))

(declare-fun lt!76834 () Unit!3418)

(declare-fun lt!76837 () Unit!3418)

(assert (=> d!15212 (= lt!76834 lt!76837)))

(assert (=> d!15212 (isPrefixOf!0 (ite c!3473 (_2!2401 lt!76678) (_2!2401 lt!75814)) (ite c!3473 (_2!2401 lt!76678) (_2!2401 lt!75814)))))

(assert (=> d!15212 (= lt!76837 (lemmaIsPrefixRefl!0 (ite c!3473 (_2!2401 lt!76678) (_2!2401 lt!75814))))))

(declare-fun lt!76826 () Unit!3418)

(declare-fun lt!76842 () Unit!3418)

(assert (=> d!15212 (= lt!76826 lt!76842)))

(assert (=> d!15212 (= lt!76842 (lemmaIsPrefixRefl!0 (ite c!3473 (_2!2401 lt!76678) (_2!2401 lt!75814))))))

(declare-fun lt!76845 () Unit!3418)

(declare-fun lt!76827 () Unit!3418)

(assert (=> d!15212 (= lt!76845 lt!76827)))

(assert (=> d!15212 (isPrefixOf!0 lt!76829 lt!76829)))

(assert (=> d!15212 (= lt!76827 (lemmaIsPrefixRefl!0 lt!76829))))

(declare-fun lt!76841 () Unit!3418)

(declare-fun lt!76836 () Unit!3418)

(assert (=> d!15212 (= lt!76841 lt!76836)))

(assert (=> d!15212 (isPrefixOf!0 (_2!2401 lt!75814) (_2!2401 lt!75814))))

(assert (=> d!15212 (= lt!76836 (lemmaIsPrefixRefl!0 (_2!2401 lt!75814)))))

(assert (=> d!15212 (= lt!76829 (BitStream!1821 (buf!1402 (ite c!3473 (_2!2401 lt!76678) (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))))))

(assert (=> d!15212 (isPrefixOf!0 (_2!2401 lt!75814) (ite c!3473 (_2!2401 lt!76678) (_2!2401 lt!75814)))))

(assert (=> d!15212 (= (reader!0 (_2!2401 lt!75814) (ite c!3473 (_2!2401 lt!76678) (_2!2401 lt!75814))) lt!76838)))

(declare-fun b!49279 () Bool)

(declare-fun lt!76828 () Unit!3418)

(assert (=> b!49279 (= e!32532 lt!76828)))

(declare-fun lt!76831 () (_ BitVec 64))

(assert (=> b!49279 (= lt!76831 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76844 () (_ BitVec 64))

(assert (=> b!49279 (= lt!76844 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))))))

(assert (=> b!49279 (= lt!76828 (arrayBitRangesEqSymmetric!0 (buf!1402 (_2!2401 lt!75814)) (buf!1402 (ite c!3473 (_2!2401 lt!76678) (_2!2401 lt!75814))) lt!76831 lt!76844))))

(assert (=> b!49279 (arrayBitRangesEq!0 (buf!1402 (ite c!3473 (_2!2401 lt!76678) (_2!2401 lt!75814))) (buf!1402 (_2!2401 lt!75814)) lt!76831 lt!76844)))

(declare-fun b!49280 () Bool)

(declare-fun res!41308 () Bool)

(assert (=> b!49280 (=> (not res!41308) (not e!32533))))

(assert (=> b!49280 (= res!41308 (isPrefixOf!0 (_1!2402 lt!76838) (_2!2401 lt!75814)))))

(declare-fun b!49281 () Bool)

(declare-fun Unit!3450 () Unit!3418)

(assert (=> b!49281 (= e!32532 Unit!3450)))

(assert (= (and d!15212 c!3493) b!49279))

(assert (= (and d!15212 (not c!3493)) b!49281))

(assert (= (and d!15212 res!41309) b!49280))

(assert (= (and b!49280 res!41308) b!49277))

(assert (= (and b!49277 res!41310) b!49278))

(declare-fun m!76867 () Bool)

(assert (=> b!49280 m!76867))

(assert (=> b!49279 m!76035))

(declare-fun m!76869 () Bool)

(assert (=> b!49279 m!76869))

(declare-fun m!76871 () Bool)

(assert (=> b!49279 m!76871))

(declare-fun m!76873 () Bool)

(assert (=> b!49277 m!76873))

(declare-fun m!76875 () Bool)

(assert (=> b!49278 m!76875))

(declare-fun m!76877 () Bool)

(assert (=> b!49278 m!76877))

(assert (=> b!49278 m!76035))

(declare-fun m!76879 () Bool)

(assert (=> d!15212 m!76879))

(declare-fun m!76881 () Bool)

(assert (=> d!15212 m!76881))

(declare-fun m!76883 () Bool)

(assert (=> d!15212 m!76883))

(declare-fun m!76885 () Bool)

(assert (=> d!15212 m!76885))

(assert (=> d!15212 m!76513))

(declare-fun m!76887 () Bool)

(assert (=> d!15212 m!76887))

(declare-fun m!76889 () Bool)

(assert (=> d!15212 m!76889))

(declare-fun m!76891 () Bool)

(assert (=> d!15212 m!76891))

(declare-fun m!76893 () Bool)

(assert (=> d!15212 m!76893))

(declare-fun m!76895 () Bool)

(assert (=> d!15212 m!76895))

(assert (=> d!15212 m!76517))

(assert (=> bm!616 d!15212))

(assert (=> b!49077 d!15176))

(declare-fun d!15214 () Bool)

(assert (=> d!15214 (arrayBitRangesEq!0 (buf!1402 (_2!2401 lt!75814)) (buf!1402 thiss!1379) lt!76465 lt!76478)))

(declare-fun lt!76848 () Unit!3418)

(declare-fun choose!8 (array!2315 array!2315 (_ BitVec 64) (_ BitVec 64)) Unit!3418)

(assert (=> d!15214 (= lt!76848 (choose!8 (buf!1402 thiss!1379) (buf!1402 (_2!2401 lt!75814)) lt!76465 lt!76478))))

(assert (=> d!15214 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!76465) (bvsle lt!76465 lt!76478))))

(assert (=> d!15214 (= (arrayBitRangesEqSymmetric!0 (buf!1402 thiss!1379) (buf!1402 (_2!2401 lt!75814)) lt!76465 lt!76478) lt!76848)))

(declare-fun bs!3874 () Bool)

(assert (= bs!3874 d!15214))

(assert (=> bs!3874 m!76501))

(declare-fun m!76897 () Bool)

(assert (=> bs!3874 m!76897))

(assert (=> b!49077 d!15214))

(declare-fun e!32550 () Bool)

(declare-fun b!49296 () Bool)

(declare-datatypes ((tuple4!20 0))(
  ( (tuple4!21 (_1!2415 (_ BitVec 32)) (_2!2415 (_ BitVec 32)) (_3!99 (_ BitVec 32)) (_4!10 (_ BitVec 32))) )
))
(declare-fun lt!76855 () tuple4!20)

(declare-fun arrayRangesEq!11 (array!2315 array!2315 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!49296 (= e!32550 (arrayRangesEq!11 (buf!1402 (_2!2401 lt!75814)) (buf!1402 thiss!1379) (_1!2415 lt!76855) (_2!2415 lt!76855)))))

(declare-fun b!49297 () Bool)

(declare-fun e!32551 () Bool)

(declare-fun call!622 () Bool)

(assert (=> b!49297 (= e!32551 call!622)))

(declare-fun b!49298 () Bool)

(declare-fun res!41323 () Bool)

(declare-fun lt!76856 () (_ BitVec 32))

(assert (=> b!49298 (= res!41323 (= lt!76856 #b00000000000000000000000000000000))))

(declare-fun e!32547 () Bool)

(assert (=> b!49298 (=> res!41323 e!32547)))

(declare-fun e!32546 () Bool)

(assert (=> b!49298 (= e!32546 e!32547)))

(declare-fun b!49299 () Bool)

(assert (=> b!49299 (= e!32547 call!622)))

(declare-fun bm!619 () Bool)

(declare-fun c!3496 () Bool)

(declare-fun lt!76857 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!619 (= call!622 (byteRangesEq!0 (ite c!3496 (select (arr!1576 (buf!1402 (_2!2401 lt!75814))) (_3!99 lt!76855)) (select (arr!1576 (buf!1402 (_2!2401 lt!75814))) (_4!10 lt!76855))) (ite c!3496 (select (arr!1576 (buf!1402 thiss!1379)) (_3!99 lt!76855)) (select (arr!1576 (buf!1402 thiss!1379)) (_4!10 lt!76855))) (ite c!3496 lt!76857 #b00000000000000000000000000000000) lt!76856))))

(declare-fun d!15216 () Bool)

(declare-fun res!41322 () Bool)

(declare-fun e!32548 () Bool)

(assert (=> d!15216 (=> res!41322 e!32548)))

(assert (=> d!15216 (= res!41322 (bvsge lt!76465 lt!76478))))

(assert (=> d!15216 (= (arrayBitRangesEq!0 (buf!1402 (_2!2401 lt!75814)) (buf!1402 thiss!1379) lt!76465 lt!76478) e!32548)))

(declare-fun b!49300 () Bool)

(declare-fun e!32549 () Bool)

(assert (=> b!49300 (= e!32548 e!32549)))

(declare-fun res!41324 () Bool)

(assert (=> b!49300 (=> (not res!41324) (not e!32549))))

(assert (=> b!49300 (= res!41324 e!32550)))

(declare-fun res!41321 () Bool)

(assert (=> b!49300 (=> res!41321 e!32550)))

(assert (=> b!49300 (= res!41321 (bvsge (_1!2415 lt!76855) (_2!2415 lt!76855)))))

(assert (=> b!49300 (= lt!76856 ((_ extract 31 0) (bvsrem lt!76478 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49300 (= lt!76857 ((_ extract 31 0) (bvsrem lt!76465 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!20)

(assert (=> b!49300 (= lt!76855 (arrayBitIndices!0 lt!76465 lt!76478))))

(declare-fun b!49301 () Bool)

(assert (=> b!49301 (= e!32549 e!32551)))

(assert (=> b!49301 (= c!3496 (= (_3!99 lt!76855) (_4!10 lt!76855)))))

(declare-fun b!49302 () Bool)

(assert (=> b!49302 (= e!32551 e!32546)))

(declare-fun res!41325 () Bool)

(assert (=> b!49302 (= res!41325 (byteRangesEq!0 (select (arr!1576 (buf!1402 (_2!2401 lt!75814))) (_3!99 lt!76855)) (select (arr!1576 (buf!1402 thiss!1379)) (_3!99 lt!76855)) lt!76857 #b00000000000000000000000000001000))))

(assert (=> b!49302 (=> (not res!41325) (not e!32546))))

(assert (= (and d!15216 (not res!41322)) b!49300))

(assert (= (and b!49300 (not res!41321)) b!49296))

(assert (= (and b!49300 res!41324) b!49301))

(assert (= (and b!49301 c!3496) b!49297))

(assert (= (and b!49301 (not c!3496)) b!49302))

(assert (= (and b!49302 res!41325) b!49298))

(assert (= (and b!49298 (not res!41323)) b!49299))

(assert (= (or b!49297 b!49299) bm!619))

(declare-fun m!76899 () Bool)

(assert (=> b!49296 m!76899))

(declare-fun m!76901 () Bool)

(assert (=> bm!619 m!76901))

(declare-fun m!76903 () Bool)

(assert (=> bm!619 m!76903))

(declare-fun m!76905 () Bool)

(assert (=> bm!619 m!76905))

(declare-fun m!76907 () Bool)

(assert (=> bm!619 m!76907))

(declare-fun m!76909 () Bool)

(assert (=> bm!619 m!76909))

(declare-fun m!76911 () Bool)

(assert (=> b!49300 m!76911))

(assert (=> b!49302 m!76903))

(assert (=> b!49302 m!76905))

(assert (=> b!49302 m!76903))

(assert (=> b!49302 m!76905))

(declare-fun m!76913 () Bool)

(assert (=> b!49302 m!76913))

(assert (=> b!49077 d!15216))

(declare-fun d!15218 () Bool)

(assert (=> d!15218 (= (length!246 lt!76810) (size!1053 lt!76810))))

(declare-fun bs!3875 () Bool)

(assert (= bs!3875 d!15218))

(declare-fun m!76915 () Bool)

(assert (=> bs!3875 m!76915))

(assert (=> b!49265 d!15218))

(assert (=> b!49212 d!15176))

(assert (=> b!49212 d!15200))

(declare-fun d!15220 () Bool)

(declare-fun c!3497 () Bool)

(assert (=> d!15220 (= c!3497 (= (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32552 () List!551)

(assert (=> d!15220 (= (byteArrayBitContentToList!0 (_2!2401 lt!75819) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) e!32552)))

(declare-fun b!49303 () Bool)

(assert (=> b!49303 (= e!32552 Nil!548)))

(declare-fun b!49304 () Bool)

(assert (=> b!49304 (= e!32552 (Cons!547 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2401 lt!75819) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15220 c!3497) b!49303))

(assert (= (and d!15220 (not c!3497)) b!49304))

(declare-fun m!76917 () Bool)

(assert (=> b!49304 m!76917))

(declare-fun m!76919 () Bool)

(assert (=> b!49304 m!76919))

(declare-fun m!76921 () Bool)

(assert (=> b!49304 m!76921))

(assert (=> b!49197 d!15220))

(declare-fun lt!76858 () tuple4!20)

(declare-fun e!32557 () Bool)

(declare-fun b!49305 () Bool)

(assert (=> b!49305 (= e!32557 (arrayRangesEq!11 (buf!1402 thiss!1379) (buf!1402 (_2!2401 lt!75814)) (_1!2415 lt!76858) (_2!2415 lt!76858)))))

(declare-fun b!49306 () Bool)

(declare-fun e!32558 () Bool)

(declare-fun call!623 () Bool)

(assert (=> b!49306 (= e!32558 call!623)))

(declare-fun b!49307 () Bool)

(declare-fun res!41328 () Bool)

(declare-fun lt!76859 () (_ BitVec 32))

(assert (=> b!49307 (= res!41328 (= lt!76859 #b00000000000000000000000000000000))))

(declare-fun e!32554 () Bool)

(assert (=> b!49307 (=> res!41328 e!32554)))

(declare-fun e!32553 () Bool)

(assert (=> b!49307 (= e!32553 e!32554)))

(declare-fun b!49308 () Bool)

(assert (=> b!49308 (= e!32554 call!623)))

(declare-fun c!3498 () Bool)

(declare-fun lt!76860 () (_ BitVec 32))

(declare-fun bm!620 () Bool)

(assert (=> bm!620 (= call!623 (byteRangesEq!0 (ite c!3498 (select (arr!1576 (buf!1402 thiss!1379)) (_3!99 lt!76858)) (select (arr!1576 (buf!1402 thiss!1379)) (_4!10 lt!76858))) (ite c!3498 (select (arr!1576 (buf!1402 (_2!2401 lt!75814))) (_3!99 lt!76858)) (select (arr!1576 (buf!1402 (_2!2401 lt!75814))) (_4!10 lt!76858))) (ite c!3498 lt!76860 #b00000000000000000000000000000000) lt!76859))))

(declare-fun d!15222 () Bool)

(declare-fun res!41327 () Bool)

(declare-fun e!32555 () Bool)

(assert (=> d!15222 (=> res!41327 e!32555)))

(assert (=> d!15222 (= res!41327 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379))))))

(assert (=> d!15222 (= (arrayBitRangesEq!0 (buf!1402 thiss!1379) (buf!1402 (_2!2401 lt!75814)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379))) e!32555)))

(declare-fun b!49309 () Bool)

(declare-fun e!32556 () Bool)

(assert (=> b!49309 (= e!32555 e!32556)))

(declare-fun res!41329 () Bool)

(assert (=> b!49309 (=> (not res!41329) (not e!32556))))

(assert (=> b!49309 (= res!41329 e!32557)))

(declare-fun res!41326 () Bool)

(assert (=> b!49309 (=> res!41326 e!32557)))

(assert (=> b!49309 (= res!41326 (bvsge (_1!2415 lt!76858) (_2!2415 lt!76858)))))

(assert (=> b!49309 (= lt!76859 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49309 (= lt!76860 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49309 (= lt!76858 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379))))))

(declare-fun b!49310 () Bool)

(assert (=> b!49310 (= e!32556 e!32558)))

(assert (=> b!49310 (= c!3498 (= (_3!99 lt!76858) (_4!10 lt!76858)))))

(declare-fun b!49311 () Bool)

(assert (=> b!49311 (= e!32558 e!32553)))

(declare-fun res!41330 () Bool)

(assert (=> b!49311 (= res!41330 (byteRangesEq!0 (select (arr!1576 (buf!1402 thiss!1379)) (_3!99 lt!76858)) (select (arr!1576 (buf!1402 (_2!2401 lt!75814))) (_3!99 lt!76858)) lt!76860 #b00000000000000000000000000001000))))

(assert (=> b!49311 (=> (not res!41330) (not e!32553))))

(assert (= (and d!15222 (not res!41327)) b!49309))

(assert (= (and b!49309 (not res!41326)) b!49305))

(assert (= (and b!49309 res!41329) b!49310))

(assert (= (and b!49310 c!3498) b!49306))

(assert (= (and b!49310 (not c!3498)) b!49311))

(assert (= (and b!49311 res!41330) b!49307))

(assert (= (and b!49307 (not res!41328)) b!49308))

(assert (= (or b!49306 b!49308) bm!620))

(declare-fun m!76923 () Bool)

(assert (=> b!49305 m!76923))

(declare-fun m!76925 () Bool)

(assert (=> bm!620 m!76925))

(declare-fun m!76927 () Bool)

(assert (=> bm!620 m!76927))

(declare-fun m!76929 () Bool)

(assert (=> bm!620 m!76929))

(declare-fun m!76931 () Bool)

(assert (=> bm!620 m!76931))

(declare-fun m!76933 () Bool)

(assert (=> bm!620 m!76933))

(assert (=> b!49309 m!76051))

(declare-fun m!76935 () Bool)

(assert (=> b!49309 m!76935))

(assert (=> b!49311 m!76927))

(assert (=> b!49311 m!76929))

(assert (=> b!49311 m!76927))

(assert (=> b!49311 m!76929))

(declare-fun m!76937 () Bool)

(assert (=> b!49311 m!76937))

(assert (=> b!49214 d!15222))

(assert (=> b!49214 d!15176))

(declare-fun d!15224 () Bool)

(declare-fun e!32559 () Bool)

(assert (=> d!15224 e!32559))

(declare-fun c!3499 () Bool)

(assert (=> d!15224 (= c!3499 (= (bvsub (bvsub to!314 i!635) lt!76808) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!76863 () List!551)

(declare-fun e!32560 () tuple2!4626)

(assert (=> d!15224 (= lt!76863 (_1!2412 e!32560))))

(declare-fun c!3500 () Bool)

(assert (=> d!15224 (= c!3500 (= (bvsub (bvsub to!314 i!635) lt!76808) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15224 (bvsge (bvsub (bvsub to!314 i!635) lt!76808) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15224 (= (bitStreamReadBitsIntoList!0 (_2!2401 lt!75819) (_2!2413 lt!76809) (bvsub (bvsub to!314 i!635) lt!76808)) lt!76863)))

(declare-fun b!49313 () Bool)

(declare-fun lt!76862 () tuple2!4628)

(declare-fun lt!76861 () (_ BitVec 64))

(assert (=> b!49313 (= e!32560 (tuple2!4627 (Cons!547 (_1!2413 lt!76862) (bitStreamReadBitsIntoList!0 (_2!2401 lt!75819) (_2!2413 lt!76862) (bvsub (bvsub (bvsub to!314 i!635) lt!76808) lt!76861))) (_2!2413 lt!76862)))))

(assert (=> b!49313 (= lt!76862 (readBit!0 (_2!2413 lt!76809)))))

(assert (=> b!49313 (= lt!76861 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!49312 () Bool)

(assert (=> b!49312 (= e!32560 (tuple2!4627 Nil!548 (_2!2413 lt!76809)))))

(declare-fun b!49314 () Bool)

(assert (=> b!49314 (= e!32559 (isEmpty!145 lt!76863))))

(declare-fun b!49315 () Bool)

(assert (=> b!49315 (= e!32559 (> (length!246 lt!76863) 0))))

(assert (= (and d!15224 c!3500) b!49312))

(assert (= (and d!15224 (not c!3500)) b!49313))

(assert (= (and d!15224 c!3499) b!49314))

(assert (= (and d!15224 (not c!3499)) b!49315))

(declare-fun m!76939 () Bool)

(assert (=> b!49313 m!76939))

(declare-fun m!76941 () Bool)

(assert (=> b!49313 m!76941))

(declare-fun m!76943 () Bool)

(assert (=> b!49314 m!76943))

(declare-fun m!76945 () Bool)

(assert (=> b!49315 m!76945))

(assert (=> b!49263 d!15224))

(declare-fun d!15226 () Bool)

(declare-fun e!32567 () Bool)

(assert (=> d!15226 e!32567))

(declare-fun res!41333 () Bool)

(assert (=> d!15226 (=> (not res!41333) (not e!32567))))

(declare-fun increaseBitIndex!0 (BitStream!1820) tuple2!4604)

(assert (=> d!15226 (= res!41333 (= (buf!1402 (_2!2401 (increaseBitIndex!0 (_1!2402 lt!75823)))) (buf!1402 (_1!2402 lt!75823))))))

(declare-fun lt!76882 () Bool)

(assert (=> d!15226 (= lt!76882 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 (buf!1402 (_1!2402 lt!75823))) (currentByte!2919 (_1!2402 lt!75823)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2914 (_1!2402 lt!75823))))) #b00000000000000000000000000000000)))))

(declare-fun lt!76878 () tuple2!4628)

(assert (=> d!15226 (= lt!76878 (tuple2!4629 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 (buf!1402 (_1!2402 lt!75823))) (currentByte!2919 (_1!2402 lt!75823)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2914 (_1!2402 lt!75823))))) #b00000000000000000000000000000000)) (_2!2401 (increaseBitIndex!0 (_1!2402 lt!75823)))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!15226 (validate_offset_bit!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_1!2402 lt!75823)))) ((_ sign_extend 32) (currentByte!2919 (_1!2402 lt!75823))) ((_ sign_extend 32) (currentBit!2914 (_1!2402 lt!75823))))))

(assert (=> d!15226 (= (readBit!0 (_1!2402 lt!75823)) lt!76878)))

(declare-fun b!49318 () Bool)

(declare-fun lt!76879 () (_ BitVec 64))

(declare-fun lt!76883 () (_ BitVec 64))

(assert (=> b!49318 (= e!32567 (= (bitIndex!0 (size!1050 (buf!1402 (_2!2401 (increaseBitIndex!0 (_1!2402 lt!75823))))) (currentByte!2919 (_2!2401 (increaseBitIndex!0 (_1!2402 lt!75823)))) (currentBit!2914 (_2!2401 (increaseBitIndex!0 (_1!2402 lt!75823))))) (bvadd lt!76883 lt!76879)))))

(assert (=> b!49318 (or (not (= (bvand lt!76883 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76879 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!76883 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!76883 lt!76879) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49318 (= lt!76879 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!49318 (= lt!76883 (bitIndex!0 (size!1050 (buf!1402 (_1!2402 lt!75823))) (currentByte!2919 (_1!2402 lt!75823)) (currentBit!2914 (_1!2402 lt!75823))))))

(declare-fun lt!76884 () Bool)

(assert (=> b!49318 (= lt!76884 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 (buf!1402 (_1!2402 lt!75823))) (currentByte!2919 (_1!2402 lt!75823)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2914 (_1!2402 lt!75823))))) #b00000000000000000000000000000000)))))

(declare-fun lt!76881 () Bool)

(assert (=> b!49318 (= lt!76881 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 (buf!1402 (_1!2402 lt!75823))) (currentByte!2919 (_1!2402 lt!75823)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2914 (_1!2402 lt!75823))))) #b00000000000000000000000000000000)))))

(declare-fun lt!76880 () Bool)

(assert (=> b!49318 (= lt!76880 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 (buf!1402 (_1!2402 lt!75823))) (currentByte!2919 (_1!2402 lt!75823)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2914 (_1!2402 lt!75823))))) #b00000000000000000000000000000000)))))

(assert (= (and d!15226 res!41333) b!49318))

(declare-fun m!76947 () Bool)

(assert (=> d!15226 m!76947))

(declare-fun m!76949 () Bool)

(assert (=> d!15226 m!76949))

(declare-fun m!76951 () Bool)

(assert (=> d!15226 m!76951))

(declare-fun m!76953 () Bool)

(assert (=> d!15226 m!76953))

(declare-fun m!76955 () Bool)

(assert (=> b!49318 m!76955))

(declare-fun m!76957 () Bool)

(assert (=> b!49318 m!76957))

(assert (=> b!49318 m!76951))

(assert (=> b!49318 m!76947))

(assert (=> b!49318 m!76949))

(assert (=> b!49263 d!15226))

(declare-fun d!15228 () Bool)

(assert (=> d!15228 (= (isEmpty!145 lt!76714) (is-Nil!548 lt!76714))))

(assert (=> b!49210 d!15228))

(assert (=> b!49259 d!15176))

(declare-fun d!15230 () Bool)

(assert (=> d!15230 (arrayBitRangesEq!0 (buf!1402 (_2!2401 lt!75819)) (buf!1402 thiss!1379) lt!76793 lt!76806)))

(declare-fun lt!76885 () Unit!3418)

(assert (=> d!15230 (= lt!76885 (choose!8 (buf!1402 thiss!1379) (buf!1402 (_2!2401 lt!75819)) lt!76793 lt!76806))))

(assert (=> d!15230 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!76793) (bvsle lt!76793 lt!76806))))

(assert (=> d!15230 (= (arrayBitRangesEqSymmetric!0 (buf!1402 thiss!1379) (buf!1402 (_2!2401 lt!75819)) lt!76793 lt!76806) lt!76885)))

(declare-fun bs!3876 () Bool)

(assert (= bs!3876 d!15230))

(assert (=> bs!3876 m!76831))

(declare-fun m!76959 () Bool)

(assert (=> bs!3876 m!76959))

(assert (=> b!49259 d!15230))

(declare-fun lt!76886 () tuple4!20)

(declare-fun e!32572 () Bool)

(declare-fun b!49319 () Bool)

(assert (=> b!49319 (= e!32572 (arrayRangesEq!11 (buf!1402 (_2!2401 lt!75819)) (buf!1402 thiss!1379) (_1!2415 lt!76886) (_2!2415 lt!76886)))))

(declare-fun b!49320 () Bool)

(declare-fun e!32573 () Bool)

(declare-fun call!624 () Bool)

(assert (=> b!49320 (= e!32573 call!624)))

(declare-fun b!49321 () Bool)

(declare-fun res!41336 () Bool)

(declare-fun lt!76887 () (_ BitVec 32))

(assert (=> b!49321 (= res!41336 (= lt!76887 #b00000000000000000000000000000000))))

(declare-fun e!32569 () Bool)

(assert (=> b!49321 (=> res!41336 e!32569)))

(declare-fun e!32568 () Bool)

(assert (=> b!49321 (= e!32568 e!32569)))

(declare-fun b!49322 () Bool)

(assert (=> b!49322 (= e!32569 call!624)))

(declare-fun lt!76888 () (_ BitVec 32))

(declare-fun c!3501 () Bool)

(declare-fun bm!621 () Bool)

(assert (=> bm!621 (= call!624 (byteRangesEq!0 (ite c!3501 (select (arr!1576 (buf!1402 (_2!2401 lt!75819))) (_3!99 lt!76886)) (select (arr!1576 (buf!1402 (_2!2401 lt!75819))) (_4!10 lt!76886))) (ite c!3501 (select (arr!1576 (buf!1402 thiss!1379)) (_3!99 lt!76886)) (select (arr!1576 (buf!1402 thiss!1379)) (_4!10 lt!76886))) (ite c!3501 lt!76888 #b00000000000000000000000000000000) lt!76887))))

(declare-fun d!15232 () Bool)

(declare-fun res!41335 () Bool)

(declare-fun e!32570 () Bool)

(assert (=> d!15232 (=> res!41335 e!32570)))

(assert (=> d!15232 (= res!41335 (bvsge lt!76793 lt!76806))))

(assert (=> d!15232 (= (arrayBitRangesEq!0 (buf!1402 (_2!2401 lt!75819)) (buf!1402 thiss!1379) lt!76793 lt!76806) e!32570)))

(declare-fun b!49323 () Bool)

(declare-fun e!32571 () Bool)

(assert (=> b!49323 (= e!32570 e!32571)))

(declare-fun res!41337 () Bool)

(assert (=> b!49323 (=> (not res!41337) (not e!32571))))

(assert (=> b!49323 (= res!41337 e!32572)))

(declare-fun res!41334 () Bool)

(assert (=> b!49323 (=> res!41334 e!32572)))

(assert (=> b!49323 (= res!41334 (bvsge (_1!2415 lt!76886) (_2!2415 lt!76886)))))

(assert (=> b!49323 (= lt!76887 ((_ extract 31 0) (bvsrem lt!76806 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49323 (= lt!76888 ((_ extract 31 0) (bvsrem lt!76793 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49323 (= lt!76886 (arrayBitIndices!0 lt!76793 lt!76806))))

(declare-fun b!49324 () Bool)

(assert (=> b!49324 (= e!32571 e!32573)))

(assert (=> b!49324 (= c!3501 (= (_3!99 lt!76886) (_4!10 lt!76886)))))

(declare-fun b!49325 () Bool)

(assert (=> b!49325 (= e!32573 e!32568)))

(declare-fun res!41338 () Bool)

(assert (=> b!49325 (= res!41338 (byteRangesEq!0 (select (arr!1576 (buf!1402 (_2!2401 lt!75819))) (_3!99 lt!76886)) (select (arr!1576 (buf!1402 thiss!1379)) (_3!99 lt!76886)) lt!76888 #b00000000000000000000000000001000))))

(assert (=> b!49325 (=> (not res!41338) (not e!32568))))

(assert (= (and d!15232 (not res!41335)) b!49323))

(assert (= (and b!49323 (not res!41334)) b!49319))

(assert (= (and b!49323 res!41337) b!49324))

(assert (= (and b!49324 c!3501) b!49320))

(assert (= (and b!49324 (not c!3501)) b!49325))

(assert (= (and b!49325 res!41338) b!49321))

(assert (= (and b!49321 (not res!41336)) b!49322))

(assert (= (or b!49320 b!49322) bm!621))

(declare-fun m!76961 () Bool)

(assert (=> b!49319 m!76961))

(declare-fun m!76963 () Bool)

(assert (=> bm!621 m!76963))

(declare-fun m!76965 () Bool)

(assert (=> bm!621 m!76965))

(declare-fun m!76967 () Bool)

(assert (=> bm!621 m!76967))

(declare-fun m!76969 () Bool)

(assert (=> bm!621 m!76969))

(declare-fun m!76971 () Bool)

(assert (=> bm!621 m!76971))

(declare-fun m!76973 () Bool)

(assert (=> b!49323 m!76973))

(assert (=> b!49325 m!76965))

(assert (=> b!49325 m!76967))

(assert (=> b!49325 m!76965))

(assert (=> b!49325 m!76967))

(declare-fun m!76975 () Bool)

(assert (=> b!49325 m!76975))

(assert (=> b!49259 d!15232))

(assert (=> d!15004 d!15172))

(declare-fun d!15234 () Bool)

(assert (=> d!15234 (isPrefixOf!0 lt!76463 (_2!2401 lt!75814))))

(declare-fun lt!76889 () Unit!3418)

(assert (=> d!15234 (= lt!76889 (choose!30 lt!76463 thiss!1379 (_2!2401 lt!75814)))))

(assert (=> d!15234 (isPrefixOf!0 lt!76463 thiss!1379)))

(assert (=> d!15234 (= (lemmaIsPrefixTransitive!0 lt!76463 thiss!1379 (_2!2401 lt!75814)) lt!76889)))

(declare-fun bs!3877 () Bool)

(assert (= bs!3877 d!15234))

(assert (=> bs!3877 m!76511))

(declare-fun m!76977 () Bool)

(assert (=> bs!3877 m!76977))

(declare-fun m!76979 () Bool)

(assert (=> bs!3877 m!76979))

(assert (=> d!15004 d!15234))

(declare-fun d!15236 () Bool)

(declare-fun res!41340 () Bool)

(declare-fun e!32575 () Bool)

(assert (=> d!15236 (=> (not res!41340) (not e!32575))))

(assert (=> d!15236 (= res!41340 (= (size!1050 (buf!1402 (_2!2401 lt!75814))) (size!1050 (buf!1402 (_2!2401 lt!75814)))))))

(assert (=> d!15236 (= (isPrefixOf!0 (_2!2401 lt!75814) (_2!2401 lt!75814)) e!32575)))

(declare-fun b!49326 () Bool)

(declare-fun res!41341 () Bool)

(assert (=> b!49326 (=> (not res!41341) (not e!32575))))

(assert (=> b!49326 (= res!41341 (bvsle (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))) (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814)))))))

(declare-fun b!49327 () Bool)

(declare-fun e!32574 () Bool)

(assert (=> b!49327 (= e!32575 e!32574)))

(declare-fun res!41339 () Bool)

(assert (=> b!49327 (=> res!41339 e!32574)))

(assert (=> b!49327 (= res!41339 (= (size!1050 (buf!1402 (_2!2401 lt!75814))) #b00000000000000000000000000000000))))

(declare-fun b!49328 () Bool)

(assert (=> b!49328 (= e!32574 (arrayBitRangesEq!0 (buf!1402 (_2!2401 lt!75814)) (buf!1402 (_2!2401 lt!75814)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814)))))))

(assert (= (and d!15236 res!41340) b!49326))

(assert (= (and b!49326 res!41341) b!49327))

(assert (= (and b!49327 (not res!41339)) b!49328))

(assert (=> b!49326 m!76035))

(assert (=> b!49326 m!76035))

(assert (=> b!49328 m!76035))

(assert (=> b!49328 m!76035))

(declare-fun m!76981 () Bool)

(assert (=> b!49328 m!76981))

(assert (=> d!15004 d!15236))

(declare-fun d!15238 () Bool)

(declare-fun res!41343 () Bool)

(declare-fun e!32577 () Bool)

(assert (=> d!15238 (=> (not res!41343) (not e!32577))))

(assert (=> d!15238 (= res!41343 (= (size!1050 (buf!1402 lt!76463)) (size!1050 (buf!1402 lt!76463))))))

(assert (=> d!15238 (= (isPrefixOf!0 lt!76463 lt!76463) e!32577)))

(declare-fun b!49329 () Bool)

(declare-fun res!41344 () Bool)

(assert (=> b!49329 (=> (not res!41344) (not e!32577))))

(assert (=> b!49329 (= res!41344 (bvsle (bitIndex!0 (size!1050 (buf!1402 lt!76463)) (currentByte!2919 lt!76463) (currentBit!2914 lt!76463)) (bitIndex!0 (size!1050 (buf!1402 lt!76463)) (currentByte!2919 lt!76463) (currentBit!2914 lt!76463))))))

(declare-fun b!49330 () Bool)

(declare-fun e!32576 () Bool)

(assert (=> b!49330 (= e!32577 e!32576)))

(declare-fun res!41342 () Bool)

(assert (=> b!49330 (=> res!41342 e!32576)))

(assert (=> b!49330 (= res!41342 (= (size!1050 (buf!1402 lt!76463)) #b00000000000000000000000000000000))))

(declare-fun b!49331 () Bool)

(assert (=> b!49331 (= e!32576 (arrayBitRangesEq!0 (buf!1402 lt!76463) (buf!1402 lt!76463) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 lt!76463)) (currentByte!2919 lt!76463) (currentBit!2914 lt!76463))))))

(assert (= (and d!15238 res!41343) b!49329))

(assert (= (and b!49329 res!41344) b!49330))

(assert (= (and b!49330 (not res!41342)) b!49331))

(declare-fun m!76983 () Bool)

(assert (=> b!49329 m!76983))

(assert (=> b!49329 m!76983))

(assert (=> b!49331 m!76983))

(assert (=> b!49331 m!76983))

(declare-fun m!76985 () Bool)

(assert (=> b!49331 m!76985))

(assert (=> d!15004 d!15238))

(declare-fun d!15240 () Bool)

(declare-fun res!41346 () Bool)

(declare-fun e!32579 () Bool)

(assert (=> d!15240 (=> (not res!41346) (not e!32579))))

(assert (=> d!15240 (= res!41346 (= (size!1050 (buf!1402 lt!76463)) (size!1050 (buf!1402 (_2!2401 lt!75814)))))))

(assert (=> d!15240 (= (isPrefixOf!0 lt!76463 (_2!2401 lt!75814)) e!32579)))

(declare-fun b!49332 () Bool)

(declare-fun res!41347 () Bool)

(assert (=> b!49332 (=> (not res!41347) (not e!32579))))

(assert (=> b!49332 (= res!41347 (bvsle (bitIndex!0 (size!1050 (buf!1402 lt!76463)) (currentByte!2919 lt!76463) (currentBit!2914 lt!76463)) (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814)))))))

(declare-fun b!49333 () Bool)

(declare-fun e!32578 () Bool)

(assert (=> b!49333 (= e!32579 e!32578)))

(declare-fun res!41345 () Bool)

(assert (=> b!49333 (=> res!41345 e!32578)))

(assert (=> b!49333 (= res!41345 (= (size!1050 (buf!1402 lt!76463)) #b00000000000000000000000000000000))))

(declare-fun b!49334 () Bool)

(assert (=> b!49334 (= e!32578 (arrayBitRangesEq!0 (buf!1402 lt!76463) (buf!1402 (_2!2401 lt!75814)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 lt!76463)) (currentByte!2919 lt!76463) (currentBit!2914 lt!76463))))))

(assert (= (and d!15240 res!41346) b!49332))

(assert (= (and b!49332 res!41347) b!49333))

(assert (= (and b!49333 (not res!41345)) b!49334))

(assert (=> b!49332 m!76983))

(assert (=> b!49332 m!76035))

(assert (=> b!49334 m!76983))

(assert (=> b!49334 m!76983))

(declare-fun m!76987 () Bool)

(assert (=> b!49334 m!76987))

(assert (=> d!15004 d!15240))

(assert (=> d!15004 d!15174))

(declare-fun d!15242 () Bool)

(assert (=> d!15242 (isPrefixOf!0 lt!76463 lt!76463)))

(declare-fun lt!76890 () Unit!3418)

(assert (=> d!15242 (= lt!76890 (choose!11 lt!76463))))

(assert (=> d!15242 (= (lemmaIsPrefixRefl!0 lt!76463) lt!76890)))

(declare-fun bs!3878 () Bool)

(assert (= bs!3878 d!15242))

(assert (=> bs!3878 m!76519))

(declare-fun m!76989 () Bool)

(assert (=> bs!3878 m!76989))

(assert (=> d!15004 d!15242))

(declare-fun d!15244 () Bool)

(assert (=> d!15244 (isPrefixOf!0 (_2!2401 lt!75814) (_2!2401 lt!75814))))

(declare-fun lt!76891 () Unit!3418)

(assert (=> d!15244 (= lt!76891 (choose!11 (_2!2401 lt!75814)))))

(assert (=> d!15244 (= (lemmaIsPrefixRefl!0 (_2!2401 lt!75814)) lt!76891)))

(declare-fun bs!3879 () Bool)

(assert (= bs!3879 d!15244))

(assert (=> bs!3879 m!76517))

(declare-fun m!76991 () Bool)

(assert (=> bs!3879 m!76991))

(assert (=> d!15004 d!15244))

(declare-fun d!15246 () Bool)

(assert (=> d!15246 (isPrefixOf!0 lt!76463 (_2!2401 lt!75814))))

(declare-fun lt!76892 () Unit!3418)

(assert (=> d!15246 (= lt!76892 (choose!30 lt!76463 (_2!2401 lt!75814) (_2!2401 lt!75814)))))

(assert (=> d!15246 (isPrefixOf!0 lt!76463 (_2!2401 lt!75814))))

(assert (=> d!15246 (= (lemmaIsPrefixTransitive!0 lt!76463 (_2!2401 lt!75814) (_2!2401 lt!75814)) lt!76892)))

(declare-fun bs!3880 () Bool)

(assert (= bs!3880 d!15246))

(assert (=> bs!3880 m!76511))

(declare-fun m!76993 () Bool)

(assert (=> bs!3880 m!76993))

(assert (=> bs!3880 m!76511))

(assert (=> d!15004 d!15246))

(assert (=> d!15004 d!15156))

(declare-fun d!15248 () Bool)

(declare-fun res!41349 () Bool)

(declare-fun e!32581 () Bool)

(assert (=> d!15248 (=> (not res!41349) (not e!32581))))

(assert (=> d!15248 (= res!41349 (= (size!1050 (buf!1402 (_1!2402 lt!76472))) (size!1050 (buf!1402 (_2!2402 lt!76472)))))))

(assert (=> d!15248 (= (isPrefixOf!0 (_1!2402 lt!76472) (_2!2402 lt!76472)) e!32581)))

(declare-fun b!49335 () Bool)

(declare-fun res!41350 () Bool)

(assert (=> b!49335 (=> (not res!41350) (not e!32581))))

(assert (=> b!49335 (= res!41350 (bvsle (bitIndex!0 (size!1050 (buf!1402 (_1!2402 lt!76472))) (currentByte!2919 (_1!2402 lt!76472)) (currentBit!2914 (_1!2402 lt!76472))) (bitIndex!0 (size!1050 (buf!1402 (_2!2402 lt!76472))) (currentByte!2919 (_2!2402 lt!76472)) (currentBit!2914 (_2!2402 lt!76472)))))))

(declare-fun b!49336 () Bool)

(declare-fun e!32580 () Bool)

(assert (=> b!49336 (= e!32581 e!32580)))

(declare-fun res!41348 () Bool)

(assert (=> b!49336 (=> res!41348 e!32580)))

(assert (=> b!49336 (= res!41348 (= (size!1050 (buf!1402 (_1!2402 lt!76472))) #b00000000000000000000000000000000))))

(declare-fun b!49337 () Bool)

(assert (=> b!49337 (= e!32580 (arrayBitRangesEq!0 (buf!1402 (_1!2402 lt!76472)) (buf!1402 (_2!2402 lt!76472)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 (_1!2402 lt!76472))) (currentByte!2919 (_1!2402 lt!76472)) (currentBit!2914 (_1!2402 lt!76472)))))))

(assert (= (and d!15248 res!41349) b!49335))

(assert (= (and b!49335 res!41350) b!49336))

(assert (= (and b!49336 (not res!41348)) b!49337))

(declare-fun m!76995 () Bool)

(assert (=> b!49335 m!76995))

(declare-fun m!76997 () Bool)

(assert (=> b!49335 m!76997))

(assert (=> b!49337 m!76995))

(assert (=> b!49337 m!76995))

(declare-fun m!76999 () Bool)

(assert (=> b!49337 m!76999))

(assert (=> d!15004 d!15248))

(assert (=> d!15082 d!15064))

(declare-fun d!15250 () Bool)

(assert (=> d!15250 (isPrefixOf!0 thiss!1379 (_2!2401 lt!75819))))

(assert (=> d!15250 true))

(declare-fun _$15!156 () Unit!3418)

(assert (=> d!15250 (= (choose!30 thiss!1379 (_2!2401 lt!75814) (_2!2401 lt!75819)) _$15!156)))

(declare-fun bs!3881 () Bool)

(assert (= bs!3881 d!15250))

(assert (=> bs!3881 m!75989))

(assert (=> d!15082 d!15250))

(assert (=> d!15082 d!15156))

(declare-fun d!15252 () Bool)

(declare-fun res!41352 () Bool)

(declare-fun e!32583 () Bool)

(assert (=> d!15252 (=> (not res!41352) (not e!32583))))

(assert (=> d!15252 (= res!41352 (= (size!1050 (buf!1402 thiss!1379)) (size!1050 (buf!1402 (_2!2401 lt!76751)))))))

(assert (=> d!15252 (= (isPrefixOf!0 thiss!1379 (_2!2401 lt!76751)) e!32583)))

(declare-fun b!49338 () Bool)

(declare-fun res!41353 () Bool)

(assert (=> b!49338 (=> (not res!41353) (not e!32583))))

(assert (=> b!49338 (= res!41353 (bvsle (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379)) (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76751))) (currentByte!2919 (_2!2401 lt!76751)) (currentBit!2914 (_2!2401 lt!76751)))))))

(declare-fun b!49339 () Bool)

(declare-fun e!32582 () Bool)

(assert (=> b!49339 (= e!32583 e!32582)))

(declare-fun res!41351 () Bool)

(assert (=> b!49339 (=> res!41351 e!32582)))

(assert (=> b!49339 (= res!41351 (= (size!1050 (buf!1402 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!49340 () Bool)

(assert (=> b!49340 (= e!32582 (arrayBitRangesEq!0 (buf!1402 thiss!1379) (buf!1402 (_2!2401 lt!76751)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379))))))

(assert (= (and d!15252 res!41352) b!49338))

(assert (= (and b!49338 res!41353) b!49339))

(assert (= (and b!49339 (not res!41351)) b!49340))

(assert (=> b!49338 m!76051))

(assert (=> b!49338 m!76761))

(assert (=> b!49340 m!76051))

(assert (=> b!49340 m!76051))

(declare-fun m!77001 () Bool)

(assert (=> b!49340 m!77001))

(assert (=> b!49237 d!15252))

(declare-fun d!15254 () Bool)

(assert (=> d!15254 (= (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))) ((_ sign_extend 32) (currentByte!2919 thiss!1379)) ((_ sign_extend 32) (currentBit!2914 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2919 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2914 thiss!1379)))))))

(assert (=> d!15132 d!15254))

(declare-fun d!15256 () Bool)

(declare-fun res!41355 () Bool)

(declare-fun e!32585 () Bool)

(assert (=> d!15256 (=> (not res!41355) (not e!32585))))

(assert (=> d!15256 (= res!41355 (= (size!1050 (buf!1402 thiss!1379)) (size!1050 (buf!1402 (_2!2401 lt!76750)))))))

(assert (=> d!15256 (= (isPrefixOf!0 thiss!1379 (_2!2401 lt!76750)) e!32585)))

(declare-fun b!49341 () Bool)

(declare-fun res!41356 () Bool)

(assert (=> b!49341 (=> (not res!41356) (not e!32585))))

(assert (=> b!49341 (= res!41356 (bvsle (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379)) (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76750))) (currentByte!2919 (_2!2401 lt!76750)) (currentBit!2914 (_2!2401 lt!76750)))))))

(declare-fun b!49342 () Bool)

(declare-fun e!32584 () Bool)

(assert (=> b!49342 (= e!32585 e!32584)))

(declare-fun res!41354 () Bool)

(assert (=> b!49342 (=> res!41354 e!32584)))

(assert (=> b!49342 (= res!41354 (= (size!1050 (buf!1402 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!49343 () Bool)

(assert (=> b!49343 (= e!32584 (arrayBitRangesEq!0 (buf!1402 thiss!1379) (buf!1402 (_2!2401 lt!76750)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379))))))

(assert (= (and d!15256 res!41355) b!49341))

(assert (= (and b!49341 res!41356) b!49342))

(assert (= (and b!49342 (not res!41354)) b!49343))

(assert (=> b!49341 m!76051))

(assert (=> b!49341 m!76753))

(assert (=> b!49343 m!76051))

(assert (=> b!49343 m!76051))

(declare-fun m!77003 () Bool)

(assert (=> b!49343 m!77003))

(assert (=> b!49239 d!15256))

(declare-fun d!15258 () Bool)

(assert (=> d!15258 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76669)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))) lt!76696)))

(declare-fun lt!76893 () Unit!3418)

(assert (=> d!15258 (= lt!76893 (choose!9 (_2!2401 lt!75814) (buf!1402 (_2!2401 lt!76669)) lt!76696 (BitStream!1821 (buf!1402 (_2!2401 lt!76669)) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814)))))))

(assert (=> d!15258 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2401 lt!75814) (buf!1402 (_2!2401 lt!76669)) lt!76696) lt!76893)))

(declare-fun bs!3882 () Bool)

(assert (= bs!3882 d!15258))

(assert (=> bs!3882 m!76701))

(declare-fun m!77005 () Bool)

(assert (=> bs!3882 m!77005))

(assert (=> b!49182 d!15258))

(declare-fun d!15260 () Bool)

(declare-fun c!3502 () Bool)

(assert (=> d!15260 (= c!3502 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32586 () List!551)

(assert (=> d!15260 (= (byteArrayBitContentToList!0 (_2!2401 lt!76669) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) e!32586)))

(declare-fun b!49344 () Bool)

(assert (=> b!49344 (= e!32586 Nil!548)))

(declare-fun b!49345 () Bool)

(assert (=> b!49345 (= e!32586 (Cons!547 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2401 lt!76669) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15260 c!3502) b!49344))

(assert (= (and d!15260 (not c!3502)) b!49345))

(assert (=> b!49345 m!76643))

(declare-fun m!77007 () Bool)

(assert (=> b!49345 m!77007))

(declare-fun m!77009 () Bool)

(assert (=> b!49345 m!77009))

(assert (=> b!49182 d!15260))

(declare-fun d!15262 () Bool)

(declare-fun e!32587 () Bool)

(assert (=> d!15262 e!32587))

(declare-fun c!3503 () Bool)

(assert (=> d!15262 (= c!3503 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!76896 () List!551)

(declare-fun e!32588 () tuple2!4626)

(assert (=> d!15262 (= lt!76896 (_1!2412 e!32588))))

(declare-fun c!3504 () Bool)

(assert (=> d!15262 (= c!3504 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15262 (bvsge (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15262 (= (bitStreamReadBitsIntoList!0 (_2!2401 lt!76669) (_1!2402 lt!76672) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) lt!76896)))

(declare-fun lt!76894 () (_ BitVec 64))

(declare-fun lt!76895 () tuple2!4628)

(declare-fun b!49347 () Bool)

(assert (=> b!49347 (= e!32588 (tuple2!4627 (Cons!547 (_1!2413 lt!76895) (bitStreamReadBitsIntoList!0 (_2!2401 lt!76669) (_2!2413 lt!76895) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!76894))) (_2!2413 lt!76895)))))

(assert (=> b!49347 (= lt!76895 (readBit!0 (_1!2402 lt!76672)))))

(assert (=> b!49347 (= lt!76894 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!49346 () Bool)

(assert (=> b!49346 (= e!32588 (tuple2!4627 Nil!548 (_1!2402 lt!76672)))))

(declare-fun b!49348 () Bool)

(assert (=> b!49348 (= e!32587 (isEmpty!145 lt!76896))))

(declare-fun b!49349 () Bool)

(assert (=> b!49349 (= e!32587 (> (length!246 lt!76896) 0))))

(assert (= (and d!15262 c!3504) b!49346))

(assert (= (and d!15262 (not c!3504)) b!49347))

(assert (= (and d!15262 c!3503) b!49348))

(assert (= (and d!15262 (not c!3503)) b!49349))

(declare-fun m!77011 () Bool)

(assert (=> b!49347 m!77011))

(declare-fun m!77013 () Bool)

(assert (=> b!49347 m!77013))

(declare-fun m!77015 () Bool)

(assert (=> b!49348 m!77015))

(declare-fun m!77017 () Bool)

(assert (=> b!49349 m!77017))

(assert (=> b!49182 d!15262))

(declare-fun b!49350 () Bool)

(declare-fun res!41359 () Bool)

(declare-fun e!32590 () Bool)

(assert (=> b!49350 (=> (not res!41359) (not e!32590))))

(declare-fun lt!76909 () tuple2!4606)

(assert (=> b!49350 (= res!41359 (isPrefixOf!0 (_2!2402 lt!76909) (_2!2401 lt!76669)))))

(declare-fun lt!76910 () (_ BitVec 64))

(declare-fun b!49351 () Bool)

(declare-fun lt!76901 () (_ BitVec 64))

(assert (=> b!49351 (= e!32590 (= (_1!2402 lt!76909) (withMovedBitIndex!0 (_2!2402 lt!76909) (bvsub lt!76901 lt!76910))))))

(assert (=> b!49351 (or (= (bvand lt!76901 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76910 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76901 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76901 lt!76910) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49351 (= lt!76910 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76669))) (currentByte!2919 (_2!2401 lt!76669)) (currentBit!2914 (_2!2401 lt!76669))))))

(assert (=> b!49351 (= lt!76901 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))))))

(declare-fun d!15264 () Bool)

(assert (=> d!15264 e!32590))

(declare-fun res!41358 () Bool)

(assert (=> d!15264 (=> (not res!41358) (not e!32590))))

(assert (=> d!15264 (= res!41358 (isPrefixOf!0 (_1!2402 lt!76909) (_2!2402 lt!76909)))))

(declare-fun lt!76900 () BitStream!1820)

(assert (=> d!15264 (= lt!76909 (tuple2!4607 lt!76900 (_2!2401 lt!76669)))))

(declare-fun lt!76914 () Unit!3418)

(declare-fun lt!76904 () Unit!3418)

(assert (=> d!15264 (= lt!76914 lt!76904)))

(assert (=> d!15264 (isPrefixOf!0 lt!76900 (_2!2401 lt!76669))))

(assert (=> d!15264 (= lt!76904 (lemmaIsPrefixTransitive!0 lt!76900 (_2!2401 lt!76669) (_2!2401 lt!76669)))))

(declare-fun lt!76906 () Unit!3418)

(declare-fun lt!76903 () Unit!3418)

(assert (=> d!15264 (= lt!76906 lt!76903)))

(assert (=> d!15264 (isPrefixOf!0 lt!76900 (_2!2401 lt!76669))))

(assert (=> d!15264 (= lt!76903 (lemmaIsPrefixTransitive!0 lt!76900 (_2!2401 lt!75814) (_2!2401 lt!76669)))))

(declare-fun lt!76911 () Unit!3418)

(declare-fun e!32589 () Unit!3418)

(assert (=> d!15264 (= lt!76911 e!32589)))

(declare-fun c!3505 () Bool)

(assert (=> d!15264 (= c!3505 (not (= (size!1050 (buf!1402 (_2!2401 lt!75814))) #b00000000000000000000000000000000)))))

(declare-fun lt!76905 () Unit!3418)

(declare-fun lt!76908 () Unit!3418)

(assert (=> d!15264 (= lt!76905 lt!76908)))

(assert (=> d!15264 (isPrefixOf!0 (_2!2401 lt!76669) (_2!2401 lt!76669))))

(assert (=> d!15264 (= lt!76908 (lemmaIsPrefixRefl!0 (_2!2401 lt!76669)))))

(declare-fun lt!76897 () Unit!3418)

(declare-fun lt!76913 () Unit!3418)

(assert (=> d!15264 (= lt!76897 lt!76913)))

(assert (=> d!15264 (= lt!76913 (lemmaIsPrefixRefl!0 (_2!2401 lt!76669)))))

(declare-fun lt!76916 () Unit!3418)

(declare-fun lt!76898 () Unit!3418)

(assert (=> d!15264 (= lt!76916 lt!76898)))

(assert (=> d!15264 (isPrefixOf!0 lt!76900 lt!76900)))

(assert (=> d!15264 (= lt!76898 (lemmaIsPrefixRefl!0 lt!76900))))

(declare-fun lt!76912 () Unit!3418)

(declare-fun lt!76907 () Unit!3418)

(assert (=> d!15264 (= lt!76912 lt!76907)))

(assert (=> d!15264 (isPrefixOf!0 (_2!2401 lt!75814) (_2!2401 lt!75814))))

(assert (=> d!15264 (= lt!76907 (lemmaIsPrefixRefl!0 (_2!2401 lt!75814)))))

(assert (=> d!15264 (= lt!76900 (BitStream!1821 (buf!1402 (_2!2401 lt!76669)) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))))))

(assert (=> d!15264 (isPrefixOf!0 (_2!2401 lt!75814) (_2!2401 lt!76669))))

(assert (=> d!15264 (= (reader!0 (_2!2401 lt!75814) (_2!2401 lt!76669)) lt!76909)))

(declare-fun b!49352 () Bool)

(declare-fun lt!76899 () Unit!3418)

(assert (=> b!49352 (= e!32589 lt!76899)))

(declare-fun lt!76902 () (_ BitVec 64))

(assert (=> b!49352 (= lt!76902 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76915 () (_ BitVec 64))

(assert (=> b!49352 (= lt!76915 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))))))

(assert (=> b!49352 (= lt!76899 (arrayBitRangesEqSymmetric!0 (buf!1402 (_2!2401 lt!75814)) (buf!1402 (_2!2401 lt!76669)) lt!76902 lt!76915))))

(assert (=> b!49352 (arrayBitRangesEq!0 (buf!1402 (_2!2401 lt!76669)) (buf!1402 (_2!2401 lt!75814)) lt!76902 lt!76915)))

(declare-fun b!49353 () Bool)

(declare-fun res!41357 () Bool)

(assert (=> b!49353 (=> (not res!41357) (not e!32590))))

(assert (=> b!49353 (= res!41357 (isPrefixOf!0 (_1!2402 lt!76909) (_2!2401 lt!75814)))))

(declare-fun b!49354 () Bool)

(declare-fun Unit!3451 () Unit!3418)

(assert (=> b!49354 (= e!32589 Unit!3451)))

(assert (= (and d!15264 c!3505) b!49352))

(assert (= (and d!15264 (not c!3505)) b!49354))

(assert (= (and d!15264 res!41358) b!49353))

(assert (= (and b!49353 res!41357) b!49350))

(assert (= (and b!49350 res!41359) b!49351))

(declare-fun m!77019 () Bool)

(assert (=> b!49353 m!77019))

(assert (=> b!49352 m!76035))

(declare-fun m!77021 () Bool)

(assert (=> b!49352 m!77021))

(declare-fun m!77023 () Bool)

(assert (=> b!49352 m!77023))

(declare-fun m!77025 () Bool)

(assert (=> b!49350 m!77025))

(declare-fun m!77027 () Bool)

(assert (=> b!49351 m!77027))

(assert (=> b!49351 m!76633))

(assert (=> b!49351 m!76035))

(declare-fun m!77029 () Bool)

(assert (=> d!15264 m!77029))

(assert (=> d!15264 m!76709))

(declare-fun m!77031 () Bool)

(assert (=> d!15264 m!77031))

(declare-fun m!77033 () Bool)

(assert (=> d!15264 m!77033))

(assert (=> d!15264 m!76513))

(declare-fun m!77035 () Bool)

(assert (=> d!15264 m!77035))

(declare-fun m!77037 () Bool)

(assert (=> d!15264 m!77037))

(declare-fun m!77039 () Bool)

(assert (=> d!15264 m!77039))

(declare-fun m!77041 () Bool)

(assert (=> d!15264 m!77041))

(declare-fun m!77043 () Bool)

(assert (=> d!15264 m!77043))

(assert (=> d!15264 m!76517))

(assert (=> b!49182 d!15264))

(declare-fun d!15266 () Bool)

(assert (=> d!15266 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76669)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))) lt!76696) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76669)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814)))) lt!76696))))

(declare-fun bs!3883 () Bool)

(assert (= bs!3883 d!15266))

(declare-fun m!77045 () Bool)

(assert (=> bs!3883 m!77045))

(assert (=> b!49182 d!15266))

(declare-fun e!32595 () Bool)

(declare-fun lt!76917 () tuple4!20)

(declare-fun b!49355 () Bool)

(assert (=> b!49355 (= e!32595 (arrayRangesEq!11 (buf!1402 (_2!2401 lt!75814)) (buf!1402 (_2!2401 lt!75819)) (_1!2415 lt!76917) (_2!2415 lt!76917)))))

(declare-fun b!49356 () Bool)

(declare-fun e!32596 () Bool)

(declare-fun call!625 () Bool)

(assert (=> b!49356 (= e!32596 call!625)))

(declare-fun b!49357 () Bool)

(declare-fun res!41362 () Bool)

(declare-fun lt!76918 () (_ BitVec 32))

(assert (=> b!49357 (= res!41362 (= lt!76918 #b00000000000000000000000000000000))))

(declare-fun e!32592 () Bool)

(assert (=> b!49357 (=> res!41362 e!32592)))

(declare-fun e!32591 () Bool)

(assert (=> b!49357 (= e!32591 e!32592)))

(declare-fun b!49358 () Bool)

(assert (=> b!49358 (= e!32592 call!625)))

(declare-fun c!3506 () Bool)

(declare-fun lt!76919 () (_ BitVec 32))

(declare-fun bm!622 () Bool)

(assert (=> bm!622 (= call!625 (byteRangesEq!0 (ite c!3506 (select (arr!1576 (buf!1402 (_2!2401 lt!75814))) (_3!99 lt!76917)) (select (arr!1576 (buf!1402 (_2!2401 lt!75814))) (_4!10 lt!76917))) (ite c!3506 (select (arr!1576 (buf!1402 (_2!2401 lt!75819))) (_3!99 lt!76917)) (select (arr!1576 (buf!1402 (_2!2401 lt!75819))) (_4!10 lt!76917))) (ite c!3506 lt!76919 #b00000000000000000000000000000000) lt!76918))))

(declare-fun d!15268 () Bool)

(declare-fun res!41361 () Bool)

(declare-fun e!32593 () Bool)

(assert (=> d!15268 (=> res!41361 e!32593)))

(assert (=> d!15268 (= res!41361 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814)))))))

(assert (=> d!15268 (= (arrayBitRangesEq!0 (buf!1402 (_2!2401 lt!75814)) (buf!1402 (_2!2401 lt!75819)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814)))) e!32593)))

(declare-fun b!49359 () Bool)

(declare-fun e!32594 () Bool)

(assert (=> b!49359 (= e!32593 e!32594)))

(declare-fun res!41363 () Bool)

(assert (=> b!49359 (=> (not res!41363) (not e!32594))))

(assert (=> b!49359 (= res!41363 e!32595)))

(declare-fun res!41360 () Bool)

(assert (=> b!49359 (=> res!41360 e!32595)))

(assert (=> b!49359 (= res!41360 (bvsge (_1!2415 lt!76917) (_2!2415 lt!76917)))))

(assert (=> b!49359 (= lt!76918 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49359 (= lt!76919 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49359 (= lt!76917 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814)))))))

(declare-fun b!49360 () Bool)

(assert (=> b!49360 (= e!32594 e!32596)))

(assert (=> b!49360 (= c!3506 (= (_3!99 lt!76917) (_4!10 lt!76917)))))

(declare-fun b!49361 () Bool)

(assert (=> b!49361 (= e!32596 e!32591)))

(declare-fun res!41364 () Bool)

(assert (=> b!49361 (= res!41364 (byteRangesEq!0 (select (arr!1576 (buf!1402 (_2!2401 lt!75814))) (_3!99 lt!76917)) (select (arr!1576 (buf!1402 (_2!2401 lt!75819))) (_3!99 lt!76917)) lt!76919 #b00000000000000000000000000001000))))

(assert (=> b!49361 (=> (not res!41364) (not e!32591))))

(assert (= (and d!15268 (not res!41361)) b!49359))

(assert (= (and b!49359 (not res!41360)) b!49355))

(assert (= (and b!49359 res!41363) b!49360))

(assert (= (and b!49360 c!3506) b!49356))

(assert (= (and b!49360 (not c!3506)) b!49361))

(assert (= (and b!49361 res!41364) b!49357))

(assert (= (and b!49357 (not res!41362)) b!49358))

(assert (= (or b!49356 b!49358) bm!622))

(declare-fun m!77047 () Bool)

(assert (=> b!49355 m!77047))

(declare-fun m!77049 () Bool)

(assert (=> bm!622 m!77049))

(declare-fun m!77051 () Bool)

(assert (=> bm!622 m!77051))

(declare-fun m!77053 () Bool)

(assert (=> bm!622 m!77053))

(declare-fun m!77055 () Bool)

(assert (=> bm!622 m!77055))

(declare-fun m!77057 () Bool)

(assert (=> bm!622 m!77057))

(assert (=> b!49359 m!76035))

(declare-fun m!77059 () Bool)

(assert (=> b!49359 m!77059))

(assert (=> b!49361 m!77051))

(assert (=> b!49361 m!77053))

(assert (=> b!49361 m!77051))

(assert (=> b!49361 m!77053))

(declare-fun m!77061 () Bool)

(assert (=> b!49361 m!77061))

(assert (=> b!49191 d!15268))

(assert (=> b!49191 d!15200))

(declare-fun d!15270 () Bool)

(assert (=> d!15270 (isPrefixOf!0 lt!76771 (_2!2401 lt!75819))))

(declare-fun lt!76920 () Unit!3418)

(assert (=> d!15270 (= lt!76920 (choose!30 lt!76771 (_2!2401 lt!75819) (_2!2401 lt!75819)))))

(assert (=> d!15270 (isPrefixOf!0 lt!76771 (_2!2401 lt!75819))))

(assert (=> d!15270 (= (lemmaIsPrefixTransitive!0 lt!76771 (_2!2401 lt!75819) (_2!2401 lt!75819)) lt!76920)))

(declare-fun bs!3884 () Bool)

(assert (= bs!3884 d!15270))

(assert (=> bs!3884 m!76815))

(declare-fun m!77063 () Bool)

(assert (=> bs!3884 m!77063))

(assert (=> bs!3884 m!76815))

(assert (=> d!15188 d!15270))

(declare-fun d!15272 () Bool)

(assert (=> d!15272 (isPrefixOf!0 lt!76771 lt!76771)))

(declare-fun lt!76921 () Unit!3418)

(assert (=> d!15272 (= lt!76921 (choose!11 lt!76771))))

(assert (=> d!15272 (= (lemmaIsPrefixRefl!0 lt!76771) lt!76921)))

(declare-fun bs!3885 () Bool)

(assert (= bs!3885 d!15272))

(assert (=> bs!3885 m!76823))

(declare-fun m!77065 () Bool)

(assert (=> bs!3885 m!77065))

(assert (=> d!15188 d!15272))

(assert (=> d!15188 d!15236))

(declare-fun d!15274 () Bool)

(declare-fun res!41366 () Bool)

(declare-fun e!32598 () Bool)

(assert (=> d!15274 (=> (not res!41366) (not e!32598))))

(assert (=> d!15274 (= res!41366 (= (size!1050 (buf!1402 (_1!2402 lt!76780))) (size!1050 (buf!1402 (_2!2402 lt!76780)))))))

(assert (=> d!15274 (= (isPrefixOf!0 (_1!2402 lt!76780) (_2!2402 lt!76780)) e!32598)))

(declare-fun b!49362 () Bool)

(declare-fun res!41367 () Bool)

(assert (=> b!49362 (=> (not res!41367) (not e!32598))))

(assert (=> b!49362 (= res!41367 (bvsle (bitIndex!0 (size!1050 (buf!1402 (_1!2402 lt!76780))) (currentByte!2919 (_1!2402 lt!76780)) (currentBit!2914 (_1!2402 lt!76780))) (bitIndex!0 (size!1050 (buf!1402 (_2!2402 lt!76780))) (currentByte!2919 (_2!2402 lt!76780)) (currentBit!2914 (_2!2402 lt!76780)))))))

(declare-fun b!49363 () Bool)

(declare-fun e!32597 () Bool)

(assert (=> b!49363 (= e!32598 e!32597)))

(declare-fun res!41365 () Bool)

(assert (=> b!49363 (=> res!41365 e!32597)))

(assert (=> b!49363 (= res!41365 (= (size!1050 (buf!1402 (_1!2402 lt!76780))) #b00000000000000000000000000000000))))

(declare-fun b!49364 () Bool)

(assert (=> b!49364 (= e!32597 (arrayBitRangesEq!0 (buf!1402 (_1!2402 lt!76780)) (buf!1402 (_2!2402 lt!76780)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 (_1!2402 lt!76780))) (currentByte!2919 (_1!2402 lt!76780)) (currentBit!2914 (_1!2402 lt!76780)))))))

(assert (= (and d!15274 res!41366) b!49362))

(assert (= (and b!49362 res!41367) b!49363))

(assert (= (and b!49363 (not res!41365)) b!49364))

(declare-fun m!77067 () Bool)

(assert (=> b!49362 m!77067))

(declare-fun m!77069 () Bool)

(assert (=> b!49362 m!77069))

(assert (=> b!49364 m!77067))

(assert (=> b!49364 m!77067))

(declare-fun m!77071 () Bool)

(assert (=> b!49364 m!77071))

(assert (=> d!15188 d!15274))

(declare-fun d!15276 () Bool)

(assert (=> d!15276 (isPrefixOf!0 lt!76771 (_2!2401 lt!75819))))

(declare-fun lt!76922 () Unit!3418)

(assert (=> d!15276 (= lt!76922 (choose!30 lt!76771 (_2!2401 lt!75814) (_2!2401 lt!75819)))))

(assert (=> d!15276 (isPrefixOf!0 lt!76771 (_2!2401 lt!75814))))

(assert (=> d!15276 (= (lemmaIsPrefixTransitive!0 lt!76771 (_2!2401 lt!75814) (_2!2401 lt!75819)) lt!76922)))

(declare-fun bs!3886 () Bool)

(assert (= bs!3886 d!15276))

(assert (=> bs!3886 m!76815))

(declare-fun m!77073 () Bool)

(assert (=> bs!3886 m!77073))

(declare-fun m!77075 () Bool)

(assert (=> bs!3886 m!77075))

(assert (=> d!15188 d!15276))

(declare-fun d!15278 () Bool)

(declare-fun res!41369 () Bool)

(declare-fun e!32600 () Bool)

(assert (=> d!15278 (=> (not res!41369) (not e!32600))))

(assert (=> d!15278 (= res!41369 (= (size!1050 (buf!1402 lt!76771)) (size!1050 (buf!1402 (_2!2401 lt!75819)))))))

(assert (=> d!15278 (= (isPrefixOf!0 lt!76771 (_2!2401 lt!75819)) e!32600)))

(declare-fun b!49365 () Bool)

(declare-fun res!41370 () Bool)

(assert (=> b!49365 (=> (not res!41370) (not e!32600))))

(assert (=> b!49365 (= res!41370 (bvsle (bitIndex!0 (size!1050 (buf!1402 lt!76771)) (currentByte!2919 lt!76771) (currentBit!2914 lt!76771)) (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75819))) (currentByte!2919 (_2!2401 lt!75819)) (currentBit!2914 (_2!2401 lt!75819)))))))

(declare-fun b!49366 () Bool)

(declare-fun e!32599 () Bool)

(assert (=> b!49366 (= e!32600 e!32599)))

(declare-fun res!41368 () Bool)

(assert (=> b!49366 (=> res!41368 e!32599)))

(assert (=> b!49366 (= res!41368 (= (size!1050 (buf!1402 lt!76771)) #b00000000000000000000000000000000))))

(declare-fun b!49367 () Bool)

(assert (=> b!49367 (= e!32599 (arrayBitRangesEq!0 (buf!1402 lt!76771) (buf!1402 (_2!2401 lt!75819)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 lt!76771)) (currentByte!2919 lt!76771) (currentBit!2914 lt!76771))))))

(assert (= (and d!15278 res!41369) b!49365))

(assert (= (and b!49365 res!41370) b!49366))

(assert (= (and b!49366 (not res!41368)) b!49367))

(declare-fun m!77077 () Bool)

(assert (=> b!49365 m!77077))

(assert (=> b!49365 m!76015))

(assert (=> b!49367 m!77077))

(assert (=> b!49367 m!77077))

(declare-fun m!77079 () Bool)

(assert (=> b!49367 m!77079))

(assert (=> d!15188 d!15278))

(assert (=> d!15188 d!15130))

(declare-fun d!15280 () Bool)

(declare-fun res!41372 () Bool)

(declare-fun e!32602 () Bool)

(assert (=> d!15280 (=> (not res!41372) (not e!32602))))

(assert (=> d!15280 (= res!41372 (= (size!1050 (buf!1402 lt!76771)) (size!1050 (buf!1402 lt!76771))))))

(assert (=> d!15280 (= (isPrefixOf!0 lt!76771 lt!76771) e!32602)))

(declare-fun b!49368 () Bool)

(declare-fun res!41373 () Bool)

(assert (=> b!49368 (=> (not res!41373) (not e!32602))))

(assert (=> b!49368 (= res!41373 (bvsle (bitIndex!0 (size!1050 (buf!1402 lt!76771)) (currentByte!2919 lt!76771) (currentBit!2914 lt!76771)) (bitIndex!0 (size!1050 (buf!1402 lt!76771)) (currentByte!2919 lt!76771) (currentBit!2914 lt!76771))))))

(declare-fun b!49369 () Bool)

(declare-fun e!32601 () Bool)

(assert (=> b!49369 (= e!32602 e!32601)))

(declare-fun res!41371 () Bool)

(assert (=> b!49369 (=> res!41371 e!32601)))

(assert (=> b!49369 (= res!41371 (= (size!1050 (buf!1402 lt!76771)) #b00000000000000000000000000000000))))

(declare-fun b!49370 () Bool)

(assert (=> b!49370 (= e!32601 (arrayBitRangesEq!0 (buf!1402 lt!76771) (buf!1402 lt!76771) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 lt!76771)) (currentByte!2919 lt!76771) (currentBit!2914 lt!76771))))))

(assert (= (and d!15280 res!41372) b!49368))

(assert (= (and b!49368 res!41373) b!49369))

(assert (= (and b!49369 (not res!41371)) b!49370))

(assert (=> b!49368 m!77077))

(assert (=> b!49368 m!77077))

(assert (=> b!49370 m!77077))

(assert (=> b!49370 m!77077))

(declare-fun m!77081 () Bool)

(assert (=> b!49370 m!77081))

(assert (=> d!15188 d!15280))

(assert (=> d!15188 d!15244))

(declare-fun d!15282 () Bool)

(assert (=> d!15282 (isPrefixOf!0 (_2!2401 lt!75819) (_2!2401 lt!75819))))

(declare-fun lt!76923 () Unit!3418)

(assert (=> d!15282 (= lt!76923 (choose!11 (_2!2401 lt!75819)))))

(assert (=> d!15282 (= (lemmaIsPrefixRefl!0 (_2!2401 lt!75819)) lt!76923)))

(declare-fun bs!3887 () Bool)

(assert (= bs!3887 d!15282))

(assert (=> bs!3887 m!76821))

(declare-fun m!77083 () Bool)

(assert (=> bs!3887 m!77083))

(assert (=> d!15188 d!15282))

(declare-fun d!15284 () Bool)

(declare-fun res!41375 () Bool)

(declare-fun e!32604 () Bool)

(assert (=> d!15284 (=> (not res!41375) (not e!32604))))

(assert (=> d!15284 (= res!41375 (= (size!1050 (buf!1402 (_2!2401 lt!75819))) (size!1050 (buf!1402 (_2!2401 lt!75819)))))))

(assert (=> d!15284 (= (isPrefixOf!0 (_2!2401 lt!75819) (_2!2401 lt!75819)) e!32604)))

(declare-fun b!49371 () Bool)

(declare-fun res!41376 () Bool)

(assert (=> b!49371 (=> (not res!41376) (not e!32604))))

(assert (=> b!49371 (= res!41376 (bvsle (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75819))) (currentByte!2919 (_2!2401 lt!75819)) (currentBit!2914 (_2!2401 lt!75819))) (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75819))) (currentByte!2919 (_2!2401 lt!75819)) (currentBit!2914 (_2!2401 lt!75819)))))))

(declare-fun b!49372 () Bool)

(declare-fun e!32603 () Bool)

(assert (=> b!49372 (= e!32604 e!32603)))

(declare-fun res!41374 () Bool)

(assert (=> b!49372 (=> res!41374 e!32603)))

(assert (=> b!49372 (= res!41374 (= (size!1050 (buf!1402 (_2!2401 lt!75819))) #b00000000000000000000000000000000))))

(declare-fun b!49373 () Bool)

(assert (=> b!49373 (= e!32603 (arrayBitRangesEq!0 (buf!1402 (_2!2401 lt!75819)) (buf!1402 (_2!2401 lt!75819)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75819))) (currentByte!2919 (_2!2401 lt!75819)) (currentBit!2914 (_2!2401 lt!75819)))))))

(assert (= (and d!15284 res!41375) b!49371))

(assert (= (and b!49371 res!41376) b!49372))

(assert (= (and b!49372 (not res!41374)) b!49373))

(assert (=> b!49371 m!76015))

(assert (=> b!49371 m!76015))

(assert (=> b!49373 m!76015))

(assert (=> b!49373 m!76015))

(declare-fun m!77085 () Bool)

(assert (=> b!49373 m!77085))

(assert (=> d!15188 d!15284))

(declare-fun b!49384 () Bool)

(declare-fun res!41389 () Bool)

(declare-fun e!32607 () Bool)

(assert (=> b!49384 (=> (not res!41389) (not e!32607))))

(declare-fun lt!76948 () tuple2!4624)

(assert (=> b!49384 (= res!41389 (bvsle (currentByte!2919 lt!76752) (currentByte!2919 (_2!2411 lt!76948))))))

(declare-fun d!15286 () Bool)

(assert (=> d!15286 e!32607))

(declare-fun res!41391 () Bool)

(assert (=> d!15286 (=> (not res!41391) (not e!32607))))

(assert (=> d!15286 (= res!41391 (= (buf!1402 (_2!2411 lt!76948)) (buf!1402 lt!76752)))))

(declare-datatypes ((tuple3!178 0))(
  ( (tuple3!179 (_1!2416 Unit!3418) (_2!2416 BitStream!1820) (_3!100 array!2315)) )
))
(declare-fun lt!76945 () tuple3!178)

(assert (=> d!15286 (= lt!76948 (tuple2!4625 (_3!100 lt!76945) (_2!2416 lt!76945)))))

(declare-fun readBitsLoop!0 (BitStream!1820 (_ BitVec 64) array!2315 (_ BitVec 64) (_ BitVec 64)) tuple3!178)

(assert (=> d!15286 (= lt!76945 (readBitsLoop!0 lt!76752 #b0000000000000000000000000000000000000000000000000000000000000001 (array!2316 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!15286 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!15286 (= (readBits!0 lt!76752 #b0000000000000000000000000000000000000000000000000000000000000001) lt!76948)))

(declare-fun b!49385 () Bool)

(declare-fun res!41390 () Bool)

(assert (=> b!49385 (=> (not res!41390) (not e!32607))))

(declare-fun lt!76944 () (_ BitVec 64))

(assert (=> b!49385 (= res!41390 (= (bvadd lt!76944 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!1050 (buf!1402 (_2!2411 lt!76948))) (currentByte!2919 (_2!2411 lt!76948)) (currentBit!2914 (_2!2411 lt!76948)))))))

(assert (=> b!49385 (or (not (= (bvand lt!76944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!76944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!76944 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49385 (= lt!76944 (bitIndex!0 (size!1050 (buf!1402 lt!76752)) (currentByte!2919 lt!76752) (currentBit!2914 lt!76752)))))

(declare-fun b!49386 () Bool)

(declare-fun res!41387 () Bool)

(assert (=> b!49386 (=> (not res!41387) (not e!32607))))

(declare-fun lt!76949 () (_ BitVec 64))

(assert (=> b!49386 (= res!41387 (= (size!1050 (_1!2411 lt!76948)) ((_ extract 31 0) lt!76949)))))

(assert (=> b!49386 (and (bvslt lt!76949 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!76949 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!76946 () (_ BitVec 64))

(declare-fun lt!76950 () (_ BitVec 64))

(assert (=> b!49386 (= lt!76949 (bvsdiv lt!76946 lt!76950))))

(assert (=> b!49386 (and (not (= lt!76950 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!76946 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!76950 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!49386 (= lt!76950 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!76943 () (_ BitVec 64))

(declare-fun lt!76942 () (_ BitVec 64))

(assert (=> b!49386 (= lt!76946 (bvsub lt!76943 lt!76942))))

(assert (=> b!49386 (or (= (bvand lt!76943 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76942 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76943 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76943 lt!76942) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49386 (= lt!76942 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!76947 () (_ BitVec 64))

(assert (=> b!49386 (= lt!76943 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!76947))))

(assert (=> b!49386 (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76947 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!76947) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49386 (= lt!76947 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!49387 () Bool)

(declare-fun res!41388 () Bool)

(assert (=> b!49387 (=> (not res!41388) (not e!32607))))

(assert (=> b!49387 (= res!41388 (invariant!0 (currentBit!2914 (_2!2411 lt!76948)) (currentByte!2919 (_2!2411 lt!76948)) (size!1050 (buf!1402 (_2!2411 lt!76948)))))))

(declare-fun b!49388 () Bool)

(assert (=> b!49388 (= e!32607 (= (byteArrayBitContentToList!0 (_2!2411 lt!76948) (_1!2411 lt!76948) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bitStreamReadBitsIntoList!0 (_2!2411 lt!76948) lt!76752 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!15286 res!41391) b!49385))

(assert (= (and b!49385 res!41390) b!49387))

(assert (= (and b!49387 res!41388) b!49386))

(assert (= (and b!49386 res!41387) b!49384))

(assert (= (and b!49384 res!41389) b!49388))

(declare-fun m!77087 () Bool)

(assert (=> d!15286 m!77087))

(declare-fun m!77089 () Bool)

(assert (=> b!49385 m!77089))

(declare-fun m!77091 () Bool)

(assert (=> b!49385 m!77091))

(declare-fun m!77093 () Bool)

(assert (=> b!49387 m!77093))

(declare-fun m!77095 () Bool)

(assert (=> b!49388 m!77095))

(declare-fun m!77097 () Bool)

(assert (=> b!49388 m!77097))

(assert (=> b!49235 d!15286))

(declare-fun d!15288 () Bool)

(declare-fun lt!76953 () tuple2!4628)

(assert (=> d!15288 (= lt!76953 (readBit!0 lt!76752))))

(assert (=> d!15288 (= (readBitPure!0 lt!76752) (tuple2!4631 (_2!2413 lt!76953) (_1!2413 lt!76953)))))

(declare-fun bs!3888 () Bool)

(assert (= bs!3888 d!15288))

(declare-fun m!77099 () Bool)

(assert (=> bs!3888 m!77099))

(assert (=> b!49235 d!15288))

(declare-fun d!15290 () Bool)

(declare-fun e!32610 () Bool)

(assert (=> d!15290 e!32610))

(declare-fun res!41395 () Bool)

(assert (=> d!15290 (=> (not res!41395) (not e!32610))))

(assert (=> d!15290 (= res!41395 (invariant!0 (currentBit!2914 (_2!2401 lt!76751)) (currentByte!2919 (_2!2401 lt!76751)) (size!1050 (buf!1402 (_2!2401 lt!76751)))))))

(assert (=> d!15290 (= (readerFrom!0 (_2!2401 lt!76751) (currentBit!2914 thiss!1379) (currentByte!2919 thiss!1379)) (BitStream!1821 (buf!1402 (_2!2401 lt!76751)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379)))))

(declare-fun b!49391 () Bool)

(assert (=> b!49391 (= e!32610 (invariant!0 (currentBit!2914 thiss!1379) (currentByte!2919 thiss!1379) (size!1050 (buf!1402 (_2!2401 lt!76751)))))))

(assert (= (and d!15290 res!41395) b!49391))

(declare-fun m!77101 () Bool)

(assert (=> d!15290 m!77101))

(declare-fun m!77103 () Bool)

(assert (=> b!49391 m!77103))

(assert (=> b!49235 d!15290))

(declare-fun d!15292 () Bool)

(declare-fun res!41397 () Bool)

(declare-fun e!32612 () Bool)

(assert (=> d!15292 (=> (not res!41397) (not e!32612))))

(assert (=> d!15292 (= res!41397 (= (size!1050 (buf!1402 (_2!2402 lt!76800))) (size!1050 (buf!1402 (_2!2401 lt!75819)))))))

(assert (=> d!15292 (= (isPrefixOf!0 (_2!2402 lt!76800) (_2!2401 lt!75819)) e!32612)))

(declare-fun b!49392 () Bool)

(declare-fun res!41398 () Bool)

(assert (=> b!49392 (=> (not res!41398) (not e!32612))))

(assert (=> b!49392 (= res!41398 (bvsle (bitIndex!0 (size!1050 (buf!1402 (_2!2402 lt!76800))) (currentByte!2919 (_2!2402 lt!76800)) (currentBit!2914 (_2!2402 lt!76800))) (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75819))) (currentByte!2919 (_2!2401 lt!75819)) (currentBit!2914 (_2!2401 lt!75819)))))))

(declare-fun b!49393 () Bool)

(declare-fun e!32611 () Bool)

(assert (=> b!49393 (= e!32612 e!32611)))

(declare-fun res!41396 () Bool)

(assert (=> b!49393 (=> res!41396 e!32611)))

(assert (=> b!49393 (= res!41396 (= (size!1050 (buf!1402 (_2!2402 lt!76800))) #b00000000000000000000000000000000))))

(declare-fun b!49394 () Bool)

(assert (=> b!49394 (= e!32611 (arrayBitRangesEq!0 (buf!1402 (_2!2402 lt!76800)) (buf!1402 (_2!2401 lt!75819)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 (_2!2402 lt!76800))) (currentByte!2919 (_2!2402 lt!76800)) (currentBit!2914 (_2!2402 lt!76800)))))))

(assert (= (and d!15292 res!41397) b!49392))

(assert (= (and b!49392 res!41398) b!49393))

(assert (= (and b!49393 (not res!41396)) b!49394))

(declare-fun m!77105 () Bool)

(assert (=> b!49392 m!77105))

(assert (=> b!49392 m!76015))

(assert (=> b!49394 m!77105))

(assert (=> b!49394 m!77105))

(declare-fun m!77107 () Bool)

(assert (=> b!49394 m!77107))

(assert (=> b!49257 d!15292))

(declare-fun d!15294 () Bool)

(declare-fun e!32615 () Bool)

(assert (=> d!15294 e!32615))

(declare-fun res!41401 () Bool)

(assert (=> d!15294 (=> (not res!41401) (not e!32615))))

(declare-fun lt!76959 () (_ BitVec 64))

(declare-fun lt!76958 () BitStream!1820)

(assert (=> d!15294 (= res!41401 (= (bvadd lt!76959 (bvsub lt!76464 lt!76473)) (bitIndex!0 (size!1050 (buf!1402 lt!76958)) (currentByte!2919 lt!76958) (currentBit!2914 lt!76958))))))

(assert (=> d!15294 (or (not (= (bvand lt!76959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76464 lt!76473) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!76959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!76959 (bvsub lt!76464 lt!76473)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15294 (= lt!76959 (bitIndex!0 (size!1050 (buf!1402 (_2!2402 lt!76472))) (currentByte!2919 (_2!2402 lt!76472)) (currentBit!2914 (_2!2402 lt!76472))))))

(declare-fun moveBitIndex!0 (BitStream!1820 (_ BitVec 64)) tuple2!4604)

(assert (=> d!15294 (= lt!76958 (_2!2401 (moveBitIndex!0 (_2!2402 lt!76472) (bvsub lt!76464 lt!76473))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!1820 (_ BitVec 64)) Bool)

(assert (=> d!15294 (moveBitIndexPrecond!0 (_2!2402 lt!76472) (bvsub lt!76464 lt!76473))))

(assert (=> d!15294 (= (withMovedBitIndex!0 (_2!2402 lt!76472) (bvsub lt!76464 lt!76473)) lt!76958)))

(declare-fun b!49397 () Bool)

(assert (=> b!49397 (= e!32615 (= (size!1050 (buf!1402 (_2!2402 lt!76472))) (size!1050 (buf!1402 lt!76958))))))

(assert (= (and d!15294 res!41401) b!49397))

(declare-fun m!77109 () Bool)

(assert (=> d!15294 m!77109))

(assert (=> d!15294 m!76997))

(declare-fun m!77111 () Bool)

(assert (=> d!15294 m!77111))

(declare-fun m!77113 () Bool)

(assert (=> d!15294 m!77113))

(assert (=> b!49076 d!15294))

(assert (=> b!49076 d!15200))

(assert (=> b!49076 d!15176))

(declare-fun d!15296 () Bool)

(assert (=> d!15296 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!15296 true))

(declare-fun _$1!300 () Unit!3418)

(assert (=> d!15296 (= (choose!27 thiss!1379 (_2!2401 lt!75814) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!300)))

(declare-fun bs!3889 () Bool)

(assert (= bs!3889 d!15296))

(assert (=> bs!3889 m!76749))

(assert (=> d!15160 d!15296))

(declare-fun d!15298 () Bool)

(assert (=> d!15298 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))) lt!76696) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814)))) lt!76696))))

(declare-fun bs!3890 () Bool)

(assert (= bs!3890 d!15298))

(assert (=> bs!3890 m!76745))

(assert (=> b!49186 d!15298))

(assert (=> b!49254 d!15200))

(declare-fun d!15300 () Bool)

(assert (=> d!15300 (arrayBitRangesEq!0 (buf!1402 (_2!2401 lt!75819)) (buf!1402 (_2!2401 lt!75814)) lt!76773 lt!76786)))

(declare-fun lt!76960 () Unit!3418)

(assert (=> d!15300 (= lt!76960 (choose!8 (buf!1402 (_2!2401 lt!75814)) (buf!1402 (_2!2401 lt!75819)) lt!76773 lt!76786))))

(assert (=> d!15300 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!76773) (bvsle lt!76773 lt!76786))))

(assert (=> d!15300 (= (arrayBitRangesEqSymmetric!0 (buf!1402 (_2!2401 lt!75814)) (buf!1402 (_2!2401 lt!75819)) lt!76773 lt!76786) lt!76960)))

(declare-fun bs!3891 () Bool)

(assert (= bs!3891 d!15300))

(assert (=> bs!3891 m!76805))

(declare-fun m!77115 () Bool)

(assert (=> bs!3891 m!77115))

(assert (=> b!49254 d!15300))

(declare-fun b!49398 () Bool)

(declare-fun e!32620 () Bool)

(declare-fun lt!76961 () tuple4!20)

(assert (=> b!49398 (= e!32620 (arrayRangesEq!11 (buf!1402 (_2!2401 lt!75819)) (buf!1402 (_2!2401 lt!75814)) (_1!2415 lt!76961) (_2!2415 lt!76961)))))

(declare-fun b!49399 () Bool)

(declare-fun e!32621 () Bool)

(declare-fun call!626 () Bool)

(assert (=> b!49399 (= e!32621 call!626)))

(declare-fun b!49400 () Bool)

(declare-fun res!41404 () Bool)

(declare-fun lt!76962 () (_ BitVec 32))

(assert (=> b!49400 (= res!41404 (= lt!76962 #b00000000000000000000000000000000))))

(declare-fun e!32617 () Bool)

(assert (=> b!49400 (=> res!41404 e!32617)))

(declare-fun e!32616 () Bool)

(assert (=> b!49400 (= e!32616 e!32617)))

(declare-fun b!49401 () Bool)

(assert (=> b!49401 (= e!32617 call!626)))

(declare-fun bm!623 () Bool)

(declare-fun lt!76963 () (_ BitVec 32))

(declare-fun c!3507 () Bool)

(assert (=> bm!623 (= call!626 (byteRangesEq!0 (ite c!3507 (select (arr!1576 (buf!1402 (_2!2401 lt!75819))) (_3!99 lt!76961)) (select (arr!1576 (buf!1402 (_2!2401 lt!75819))) (_4!10 lt!76961))) (ite c!3507 (select (arr!1576 (buf!1402 (_2!2401 lt!75814))) (_3!99 lt!76961)) (select (arr!1576 (buf!1402 (_2!2401 lt!75814))) (_4!10 lt!76961))) (ite c!3507 lt!76963 #b00000000000000000000000000000000) lt!76962))))

(declare-fun d!15302 () Bool)

(declare-fun res!41403 () Bool)

(declare-fun e!32618 () Bool)

(assert (=> d!15302 (=> res!41403 e!32618)))

(assert (=> d!15302 (= res!41403 (bvsge lt!76773 lt!76786))))

(assert (=> d!15302 (= (arrayBitRangesEq!0 (buf!1402 (_2!2401 lt!75819)) (buf!1402 (_2!2401 lt!75814)) lt!76773 lt!76786) e!32618)))

(declare-fun b!49402 () Bool)

(declare-fun e!32619 () Bool)

(assert (=> b!49402 (= e!32618 e!32619)))

(declare-fun res!41405 () Bool)

(assert (=> b!49402 (=> (not res!41405) (not e!32619))))

(assert (=> b!49402 (= res!41405 e!32620)))

(declare-fun res!41402 () Bool)

(assert (=> b!49402 (=> res!41402 e!32620)))

(assert (=> b!49402 (= res!41402 (bvsge (_1!2415 lt!76961) (_2!2415 lt!76961)))))

(assert (=> b!49402 (= lt!76962 ((_ extract 31 0) (bvsrem lt!76786 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49402 (= lt!76963 ((_ extract 31 0) (bvsrem lt!76773 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49402 (= lt!76961 (arrayBitIndices!0 lt!76773 lt!76786))))

(declare-fun b!49403 () Bool)

(assert (=> b!49403 (= e!32619 e!32621)))

(assert (=> b!49403 (= c!3507 (= (_3!99 lt!76961) (_4!10 lt!76961)))))

(declare-fun b!49404 () Bool)

(assert (=> b!49404 (= e!32621 e!32616)))

(declare-fun res!41406 () Bool)

(assert (=> b!49404 (= res!41406 (byteRangesEq!0 (select (arr!1576 (buf!1402 (_2!2401 lt!75819))) (_3!99 lt!76961)) (select (arr!1576 (buf!1402 (_2!2401 lt!75814))) (_3!99 lt!76961)) lt!76963 #b00000000000000000000000000001000))))

(assert (=> b!49404 (=> (not res!41406) (not e!32616))))

(assert (= (and d!15302 (not res!41403)) b!49402))

(assert (= (and b!49402 (not res!41402)) b!49398))

(assert (= (and b!49402 res!41405) b!49403))

(assert (= (and b!49403 c!3507) b!49399))

(assert (= (and b!49403 (not c!3507)) b!49404))

(assert (= (and b!49404 res!41406) b!49400))

(assert (= (and b!49400 (not res!41404)) b!49401))

(assert (= (or b!49399 b!49401) bm!623))

(declare-fun m!77117 () Bool)

(assert (=> b!49398 m!77117))

(declare-fun m!77119 () Bool)

(assert (=> bm!623 m!77119))

(declare-fun m!77121 () Bool)

(assert (=> bm!623 m!77121))

(declare-fun m!77123 () Bool)

(assert (=> bm!623 m!77123))

(declare-fun m!77125 () Bool)

(assert (=> bm!623 m!77125))

(declare-fun m!77127 () Bool)

(assert (=> bm!623 m!77127))

(declare-fun m!77129 () Bool)

(assert (=> b!49402 m!77129))

(assert (=> b!49404 m!77121))

(assert (=> b!49404 m!77123))

(assert (=> b!49404 m!77121))

(assert (=> b!49404 m!77123))

(declare-fun m!77131 () Bool)

(assert (=> b!49404 m!77131))

(assert (=> b!49254 d!15302))

(declare-fun d!15304 () Bool)

(declare-fun res!41408 () Bool)

(declare-fun e!32623 () Bool)

(assert (=> d!15304 (=> (not res!41408) (not e!32623))))

(assert (=> d!15304 (= res!41408 (= (size!1050 (buf!1402 (_2!2402 lt!76780))) (size!1050 (buf!1402 (_2!2401 lt!75819)))))))

(assert (=> d!15304 (= (isPrefixOf!0 (_2!2402 lt!76780) (_2!2401 lt!75819)) e!32623)))

(declare-fun b!49405 () Bool)

(declare-fun res!41409 () Bool)

(assert (=> b!49405 (=> (not res!41409) (not e!32623))))

(assert (=> b!49405 (= res!41409 (bvsle (bitIndex!0 (size!1050 (buf!1402 (_2!2402 lt!76780))) (currentByte!2919 (_2!2402 lt!76780)) (currentBit!2914 (_2!2402 lt!76780))) (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75819))) (currentByte!2919 (_2!2401 lt!75819)) (currentBit!2914 (_2!2401 lt!75819)))))))

(declare-fun b!49406 () Bool)

(declare-fun e!32622 () Bool)

(assert (=> b!49406 (= e!32623 e!32622)))

(declare-fun res!41407 () Bool)

(assert (=> b!49406 (=> res!41407 e!32622)))

(assert (=> b!49406 (= res!41407 (= (size!1050 (buf!1402 (_2!2402 lt!76780))) #b00000000000000000000000000000000))))

(declare-fun b!49407 () Bool)

(assert (=> b!49407 (= e!32622 (arrayBitRangesEq!0 (buf!1402 (_2!2402 lt!76780)) (buf!1402 (_2!2401 lt!75819)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 (_2!2402 lt!76780))) (currentByte!2919 (_2!2402 lt!76780)) (currentBit!2914 (_2!2402 lt!76780)))))))

(assert (= (and d!15304 res!41408) b!49405))

(assert (= (and b!49405 res!41409) b!49406))

(assert (= (and b!49406 (not res!41407)) b!49407))

(assert (=> b!49405 m!77069))

(assert (=> b!49405 m!76015))

(assert (=> b!49407 m!77069))

(assert (=> b!49407 m!77069))

(declare-fun m!77133 () Bool)

(assert (=> b!49407 m!77133))

(assert (=> b!49252 d!15304))

(declare-fun d!15306 () Bool)

(declare-fun res!41411 () Bool)

(declare-fun e!32625 () Bool)

(assert (=> d!15306 (=> (not res!41411) (not e!32625))))

(assert (=> d!15306 (= res!41411 (= (size!1050 (buf!1402 (_2!2402 lt!76472))) (size!1050 (buf!1402 (_2!2401 lt!75814)))))))

(assert (=> d!15306 (= (isPrefixOf!0 (_2!2402 lt!76472) (_2!2401 lt!75814)) e!32625)))

(declare-fun b!49408 () Bool)

(declare-fun res!41412 () Bool)

(assert (=> b!49408 (=> (not res!41412) (not e!32625))))

(assert (=> b!49408 (= res!41412 (bvsle (bitIndex!0 (size!1050 (buf!1402 (_2!2402 lt!76472))) (currentByte!2919 (_2!2402 lt!76472)) (currentBit!2914 (_2!2402 lt!76472))) (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814)))))))

(declare-fun b!49409 () Bool)

(declare-fun e!32624 () Bool)

(assert (=> b!49409 (= e!32625 e!32624)))

(declare-fun res!41410 () Bool)

(assert (=> b!49409 (=> res!41410 e!32624)))

(assert (=> b!49409 (= res!41410 (= (size!1050 (buf!1402 (_2!2402 lt!76472))) #b00000000000000000000000000000000))))

(declare-fun b!49410 () Bool)

(assert (=> b!49410 (= e!32624 (arrayBitRangesEq!0 (buf!1402 (_2!2402 lt!76472)) (buf!1402 (_2!2401 lt!75814)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 (_2!2402 lt!76472))) (currentByte!2919 (_2!2402 lt!76472)) (currentBit!2914 (_2!2402 lt!76472)))))))

(assert (= (and d!15306 res!41411) b!49408))

(assert (= (and b!49408 res!41412) b!49409))

(assert (= (and b!49409 (not res!41410)) b!49410))

(assert (=> b!49408 m!76997))

(assert (=> b!49408 m!76035))

(assert (=> b!49410 m!76997))

(assert (=> b!49410 m!76997))

(declare-fun m!77135 () Bool)

(assert (=> b!49410 m!77135))

(assert (=> b!49075 d!15306))

(declare-fun d!15308 () Bool)

(assert (=> d!15308 (= (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75819)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814)))) (bvsub (bvmul ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75819)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))))))))

(assert (=> d!15180 d!15308))

(declare-fun d!15310 () Bool)

(assert (=> d!15310 (= (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75819)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75819))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75819)))) (bvsub (bvmul ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75819)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75819))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75819))))))))

(assert (=> d!15002 d!15310))

(assert (=> d!15002 d!15164))

(declare-fun d!15312 () Bool)

(declare-fun e!32626 () Bool)

(assert (=> d!15312 e!32626))

(declare-fun res!41413 () Bool)

(assert (=> d!15312 (=> (not res!41413) (not e!32626))))

(declare-fun lt!76969 () (_ BitVec 64))

(declare-fun lt!76967 () (_ BitVec 64))

(declare-fun lt!76965 () (_ BitVec 64))

(assert (=> d!15312 (= res!41413 (= lt!76969 (bvsub lt!76967 lt!76965)))))

(assert (=> d!15312 (or (= (bvand lt!76967 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76965 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76967 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76967 lt!76965) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15312 (= lt!76965 (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_1!2414 lt!76749)))) ((_ sign_extend 32) (currentByte!2919 (_1!2414 lt!76749))) ((_ sign_extend 32) (currentBit!2914 (_1!2414 lt!76749)))))))

(declare-fun lt!76968 () (_ BitVec 64))

(declare-fun lt!76966 () (_ BitVec 64))

(assert (=> d!15312 (= lt!76967 (bvmul lt!76968 lt!76966))))

(assert (=> d!15312 (or (= lt!76968 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!76966 (bvsdiv (bvmul lt!76968 lt!76966) lt!76968)))))

(assert (=> d!15312 (= lt!76966 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15312 (= lt!76968 ((_ sign_extend 32) (size!1050 (buf!1402 (_1!2414 lt!76749)))))))

(assert (=> d!15312 (= lt!76969 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2919 (_1!2414 lt!76749))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2914 (_1!2414 lt!76749)))))))

(assert (=> d!15312 (invariant!0 (currentBit!2914 (_1!2414 lt!76749)) (currentByte!2919 (_1!2414 lt!76749)) (size!1050 (buf!1402 (_1!2414 lt!76749))))))

(assert (=> d!15312 (= (bitIndex!0 (size!1050 (buf!1402 (_1!2414 lt!76749))) (currentByte!2919 (_1!2414 lt!76749)) (currentBit!2914 (_1!2414 lt!76749))) lt!76969)))

(declare-fun b!49411 () Bool)

(declare-fun res!41414 () Bool)

(assert (=> b!49411 (=> (not res!41414) (not e!32626))))

(assert (=> b!49411 (= res!41414 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!76969))))

(declare-fun b!49412 () Bool)

(declare-fun lt!76964 () (_ BitVec 64))

(assert (=> b!49412 (= e!32626 (bvsle lt!76969 (bvmul lt!76964 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49412 (or (= lt!76964 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!76964 #b0000000000000000000000000000000000000000000000000000000000001000) lt!76964)))))

(assert (=> b!49412 (= lt!76964 ((_ sign_extend 32) (size!1050 (buf!1402 (_1!2414 lt!76749)))))))

(assert (= (and d!15312 res!41413) b!49411))

(assert (= (and b!49411 res!41414) b!49412))

(declare-fun m!77137 () Bool)

(assert (=> d!15312 m!77137))

(declare-fun m!77139 () Bool)

(assert (=> d!15312 m!77139))

(assert (=> b!49241 d!15312))

(declare-fun d!15314 () Bool)

(declare-fun e!32627 () Bool)

(assert (=> d!15314 e!32627))

(declare-fun res!41415 () Bool)

(assert (=> d!15314 (=> (not res!41415) (not e!32627))))

(declare-fun lt!76971 () (_ BitVec 64))

(declare-fun lt!76973 () (_ BitVec 64))

(declare-fun lt!76975 () (_ BitVec 64))

(assert (=> d!15314 (= res!41415 (= lt!76975 (bvsub lt!76973 lt!76971)))))

(assert (=> d!15314 (or (= (bvand lt!76973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76971 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76973 lt!76971) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15314 (= lt!76971 (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76750)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76750))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76750)))))))

(declare-fun lt!76974 () (_ BitVec 64))

(declare-fun lt!76972 () (_ BitVec 64))

(assert (=> d!15314 (= lt!76973 (bvmul lt!76974 lt!76972))))

(assert (=> d!15314 (or (= lt!76974 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!76972 (bvsdiv (bvmul lt!76974 lt!76972) lt!76974)))))

(assert (=> d!15314 (= lt!76972 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15314 (= lt!76974 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76750)))))))

(assert (=> d!15314 (= lt!76975 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76750))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76750)))))))

(assert (=> d!15314 (invariant!0 (currentBit!2914 (_2!2401 lt!76750)) (currentByte!2919 (_2!2401 lt!76750)) (size!1050 (buf!1402 (_2!2401 lt!76750))))))

(assert (=> d!15314 (= (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76750))) (currentByte!2919 (_2!2401 lt!76750)) (currentBit!2914 (_2!2401 lt!76750))) lt!76975)))

(declare-fun b!49413 () Bool)

(declare-fun res!41416 () Bool)

(assert (=> b!49413 (=> (not res!41416) (not e!32627))))

(assert (=> b!49413 (= res!41416 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!76975))))

(declare-fun b!49414 () Bool)

(declare-fun lt!76970 () (_ BitVec 64))

(assert (=> b!49414 (= e!32627 (bvsle lt!76975 (bvmul lt!76970 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49414 (or (= lt!76970 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!76970 #b0000000000000000000000000000000000000000000000000000000000001000) lt!76970)))))

(assert (=> b!49414 (= lt!76970 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76750)))))))

(assert (= (and d!15314 res!41415) b!49413))

(assert (= (and b!49413 res!41416) b!49414))

(declare-fun m!77141 () Bool)

(assert (=> d!15314 m!77141))

(declare-fun m!77143 () Bool)

(assert (=> d!15314 m!77143))

(assert (=> b!49241 d!15314))

(declare-fun d!15316 () Bool)

(declare-fun res!41418 () Bool)

(declare-fun e!32629 () Bool)

(assert (=> d!15316 (=> (not res!41418) (not e!32629))))

(assert (=> d!15316 (= res!41418 (= (size!1050 (buf!1402 (_2!2401 lt!75814))) (size!1050 (buf!1402 (_2!2401 lt!76669)))))))

(assert (=> d!15316 (= (isPrefixOf!0 (_2!2401 lt!75814) (_2!2401 lt!76669)) e!32629)))

(declare-fun b!49415 () Bool)

(declare-fun res!41419 () Bool)

(assert (=> b!49415 (=> (not res!41419) (not e!32629))))

(assert (=> b!49415 (= res!41419 (bvsle (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))) (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76669))) (currentByte!2919 (_2!2401 lt!76669)) (currentBit!2914 (_2!2401 lt!76669)))))))

(declare-fun b!49416 () Bool)

(declare-fun e!32628 () Bool)

(assert (=> b!49416 (= e!32629 e!32628)))

(declare-fun res!41417 () Bool)

(assert (=> b!49416 (=> res!41417 e!32628)))

(assert (=> b!49416 (= res!41417 (= (size!1050 (buf!1402 (_2!2401 lt!75814))) #b00000000000000000000000000000000))))

(declare-fun b!49417 () Bool)

(assert (=> b!49417 (= e!32628 (arrayBitRangesEq!0 (buf!1402 (_2!2401 lt!75814)) (buf!1402 (_2!2401 lt!76669)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814)))))))

(assert (= (and d!15316 res!41418) b!49415))

(assert (= (and b!49415 res!41419) b!49416))

(assert (= (and b!49416 (not res!41417)) b!49417))

(assert (=> b!49415 m!76035))

(assert (=> b!49415 m!76633))

(assert (=> b!49417 m!76035))

(assert (=> b!49417 m!76035))

(declare-fun m!77145 () Bool)

(assert (=> b!49417 m!77145))

(assert (=> b!49184 d!15316))

(declare-fun b!49418 () Bool)

(declare-fun e!32634 () Bool)

(declare-fun lt!76976 () tuple4!20)

(assert (=> b!49418 (= e!32634 (arrayRangesEq!11 (buf!1402 thiss!1379) (buf!1402 (_2!2401 lt!75819)) (_1!2415 lt!76976) (_2!2415 lt!76976)))))

(declare-fun b!49419 () Bool)

(declare-fun e!32635 () Bool)

(declare-fun call!627 () Bool)

(assert (=> b!49419 (= e!32635 call!627)))

(declare-fun b!49420 () Bool)

(declare-fun res!41422 () Bool)

(declare-fun lt!76977 () (_ BitVec 32))

(assert (=> b!49420 (= res!41422 (= lt!76977 #b00000000000000000000000000000000))))

(declare-fun e!32631 () Bool)

(assert (=> b!49420 (=> res!41422 e!32631)))

(declare-fun e!32630 () Bool)

(assert (=> b!49420 (= e!32630 e!32631)))

(declare-fun b!49421 () Bool)

(assert (=> b!49421 (= e!32631 call!627)))

(declare-fun bm!624 () Bool)

(declare-fun c!3508 () Bool)

(declare-fun lt!76978 () (_ BitVec 32))

(assert (=> bm!624 (= call!627 (byteRangesEq!0 (ite c!3508 (select (arr!1576 (buf!1402 thiss!1379)) (_3!99 lt!76976)) (select (arr!1576 (buf!1402 thiss!1379)) (_4!10 lt!76976))) (ite c!3508 (select (arr!1576 (buf!1402 (_2!2401 lt!75819))) (_3!99 lt!76976)) (select (arr!1576 (buf!1402 (_2!2401 lt!75819))) (_4!10 lt!76976))) (ite c!3508 lt!76978 #b00000000000000000000000000000000) lt!76977))))

(declare-fun d!15318 () Bool)

(declare-fun res!41421 () Bool)

(declare-fun e!32632 () Bool)

(assert (=> d!15318 (=> res!41421 e!32632)))

(assert (=> d!15318 (= res!41421 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379))))))

(assert (=> d!15318 (= (arrayBitRangesEq!0 (buf!1402 thiss!1379) (buf!1402 (_2!2401 lt!75819)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379))) e!32632)))

(declare-fun b!49422 () Bool)

(declare-fun e!32633 () Bool)

(assert (=> b!49422 (= e!32632 e!32633)))

(declare-fun res!41423 () Bool)

(assert (=> b!49422 (=> (not res!41423) (not e!32633))))

(assert (=> b!49422 (= res!41423 e!32634)))

(declare-fun res!41420 () Bool)

(assert (=> b!49422 (=> res!41420 e!32634)))

(assert (=> b!49422 (= res!41420 (bvsge (_1!2415 lt!76976) (_2!2415 lt!76976)))))

(assert (=> b!49422 (= lt!76977 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49422 (= lt!76978 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49422 (= lt!76976 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379))))))

(declare-fun b!49423 () Bool)

(assert (=> b!49423 (= e!32633 e!32635)))

(assert (=> b!49423 (= c!3508 (= (_3!99 lt!76976) (_4!10 lt!76976)))))

(declare-fun b!49424 () Bool)

(assert (=> b!49424 (= e!32635 e!32630)))

(declare-fun res!41424 () Bool)

(assert (=> b!49424 (= res!41424 (byteRangesEq!0 (select (arr!1576 (buf!1402 thiss!1379)) (_3!99 lt!76976)) (select (arr!1576 (buf!1402 (_2!2401 lt!75819))) (_3!99 lt!76976)) lt!76978 #b00000000000000000000000000001000))))

(assert (=> b!49424 (=> (not res!41424) (not e!32630))))

(assert (= (and d!15318 (not res!41421)) b!49422))

(assert (= (and b!49422 (not res!41420)) b!49418))

(assert (= (and b!49422 res!41423) b!49423))

(assert (= (and b!49423 c!3508) b!49419))

(assert (= (and b!49423 (not c!3508)) b!49424))

(assert (= (and b!49424 res!41424) b!49420))

(assert (= (and b!49420 (not res!41422)) b!49421))

(assert (= (or b!49419 b!49421) bm!624))

(declare-fun m!77147 () Bool)

(assert (=> b!49418 m!77147))

(declare-fun m!77149 () Bool)

(assert (=> bm!624 m!77149))

(declare-fun m!77151 () Bool)

(assert (=> bm!624 m!77151))

(declare-fun m!77153 () Bool)

(assert (=> bm!624 m!77153))

(declare-fun m!77155 () Bool)

(assert (=> bm!624 m!77155))

(declare-fun m!77157 () Bool)

(assert (=> bm!624 m!77157))

(assert (=> b!49422 m!76051))

(assert (=> b!49422 m!76935))

(assert (=> b!49424 m!77151))

(assert (=> b!49424 m!77153))

(assert (=> b!49424 m!77151))

(assert (=> b!49424 m!77153))

(declare-fun m!77159 () Bool)

(assert (=> b!49424 m!77159))

(assert (=> b!49104 d!15318))

(assert (=> b!49104 d!15176))

(declare-fun b!49425 () Bool)

(declare-fun e!32640 () Bool)

(declare-fun lt!76979 () tuple4!20)

(assert (=> b!49425 (= e!32640 (arrayRangesEq!11 (buf!1402 thiss!1379) (buf!1402 thiss!1379) (_1!2415 lt!76979) (_2!2415 lt!76979)))))

(declare-fun b!49426 () Bool)

(declare-fun e!32641 () Bool)

(declare-fun call!628 () Bool)

(assert (=> b!49426 (= e!32641 call!628)))

(declare-fun b!49427 () Bool)

(declare-fun res!41427 () Bool)

(declare-fun lt!76980 () (_ BitVec 32))

(assert (=> b!49427 (= res!41427 (= lt!76980 #b00000000000000000000000000000000))))

(declare-fun e!32637 () Bool)

(assert (=> b!49427 (=> res!41427 e!32637)))

(declare-fun e!32636 () Bool)

(assert (=> b!49427 (= e!32636 e!32637)))

(declare-fun b!49428 () Bool)

(assert (=> b!49428 (= e!32637 call!628)))

(declare-fun c!3509 () Bool)

(declare-fun bm!625 () Bool)

(declare-fun lt!76981 () (_ BitVec 32))

(assert (=> bm!625 (= call!628 (byteRangesEq!0 (ite c!3509 (select (arr!1576 (buf!1402 thiss!1379)) (_3!99 lt!76979)) (select (arr!1576 (buf!1402 thiss!1379)) (_4!10 lt!76979))) (ite c!3509 (select (arr!1576 (buf!1402 thiss!1379)) (_3!99 lt!76979)) (select (arr!1576 (buf!1402 thiss!1379)) (_4!10 lt!76979))) (ite c!3509 lt!76981 #b00000000000000000000000000000000) lt!76980))))

(declare-fun d!15320 () Bool)

(declare-fun res!41426 () Bool)

(declare-fun e!32638 () Bool)

(assert (=> d!15320 (=> res!41426 e!32638)))

(assert (=> d!15320 (= res!41426 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379))))))

(assert (=> d!15320 (= (arrayBitRangesEq!0 (buf!1402 thiss!1379) (buf!1402 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379))) e!32638)))

(declare-fun b!49429 () Bool)

(declare-fun e!32639 () Bool)

(assert (=> b!49429 (= e!32638 e!32639)))

(declare-fun res!41428 () Bool)

(assert (=> b!49429 (=> (not res!41428) (not e!32639))))

(assert (=> b!49429 (= res!41428 e!32640)))

(declare-fun res!41425 () Bool)

(assert (=> b!49429 (=> res!41425 e!32640)))

(assert (=> b!49429 (= res!41425 (bvsge (_1!2415 lt!76979) (_2!2415 lt!76979)))))

(assert (=> b!49429 (= lt!76980 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49429 (= lt!76981 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49429 (= lt!76979 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379))))))

(declare-fun b!49430 () Bool)

(assert (=> b!49430 (= e!32639 e!32641)))

(assert (=> b!49430 (= c!3509 (= (_3!99 lt!76979) (_4!10 lt!76979)))))

(declare-fun b!49431 () Bool)

(assert (=> b!49431 (= e!32641 e!32636)))

(declare-fun res!41429 () Bool)

(assert (=> b!49431 (= res!41429 (byteRangesEq!0 (select (arr!1576 (buf!1402 thiss!1379)) (_3!99 lt!76979)) (select (arr!1576 (buf!1402 thiss!1379)) (_3!99 lt!76979)) lt!76981 #b00000000000000000000000000001000))))

(assert (=> b!49431 (=> (not res!41429) (not e!32636))))

(assert (= (and d!15320 (not res!41426)) b!49429))

(assert (= (and b!49429 (not res!41425)) b!49425))

(assert (= (and b!49429 res!41428) b!49430))

(assert (= (and b!49430 c!3509) b!49426))

(assert (= (and b!49430 (not c!3509)) b!49431))

(assert (= (and b!49431 res!41429) b!49427))

(assert (= (and b!49427 (not res!41427)) b!49428))

(assert (= (or b!49426 b!49428) bm!625))

(declare-fun m!77161 () Bool)

(assert (=> b!49425 m!77161))

(declare-fun m!77163 () Bool)

(assert (=> bm!625 m!77163))

(declare-fun m!77165 () Bool)

(assert (=> bm!625 m!77165))

(assert (=> bm!625 m!77165))

(declare-fun m!77167 () Bool)

(assert (=> bm!625 m!77167))

(assert (=> bm!625 m!77167))

(assert (=> b!49429 m!76051))

(assert (=> b!49429 m!76935))

(assert (=> b!49431 m!77165))

(assert (=> b!49431 m!77165))

(assert (=> b!49431 m!77165))

(assert (=> b!49431 m!77165))

(declare-fun m!77169 () Bool)

(assert (=> b!49431 m!77169))

(assert (=> b!49245 d!15320))

(assert (=> b!49245 d!15176))

(declare-fun d!15322 () Bool)

(declare-fun e!32646 () Bool)

(assert (=> d!15322 e!32646))

(declare-fun res!41441 () Bool)

(assert (=> d!15322 (=> (not res!41441) (not e!32646))))

(declare-fun lt!76993 () tuple2!4604)

(assert (=> d!15322 (= res!41441 (= (size!1050 (buf!1402 thiss!1379)) (size!1050 (buf!1402 (_2!2401 lt!76993)))))))

(declare-fun choose!16 (BitStream!1820 Bool) tuple2!4604)

(assert (=> d!15322 (= lt!76993 (choose!16 thiss!1379 lt!76742))))

(assert (=> d!15322 (validate_offset_bit!0 ((_ sign_extend 32) (size!1050 (buf!1402 thiss!1379))) ((_ sign_extend 32) (currentByte!2919 thiss!1379)) ((_ sign_extend 32) (currentBit!2914 thiss!1379)))))

(assert (=> d!15322 (= (appendBit!0 thiss!1379 lt!76742) lt!76993)))

(declare-fun b!49443 () Bool)

(declare-fun e!32647 () Bool)

(assert (=> b!49443 (= e!32646 e!32647)))

(declare-fun res!41439 () Bool)

(assert (=> b!49443 (=> (not res!41439) (not e!32647))))

(declare-fun lt!76991 () tuple2!4630)

(assert (=> b!49443 (= res!41439 (and (= (_2!2414 lt!76991) lt!76742) (= (_1!2414 lt!76991) (_2!2401 lt!76993))))))

(assert (=> b!49443 (= lt!76991 (readBitPure!0 (readerFrom!0 (_2!2401 lt!76993) (currentBit!2914 thiss!1379) (currentByte!2919 thiss!1379))))))

(declare-fun b!49442 () Bool)

(declare-fun res!41440 () Bool)

(assert (=> b!49442 (=> (not res!41440) (not e!32646))))

(assert (=> b!49442 (= res!41440 (isPrefixOf!0 thiss!1379 (_2!2401 lt!76993)))))

(declare-fun b!49441 () Bool)

(declare-fun res!41438 () Bool)

(assert (=> b!49441 (=> (not res!41438) (not e!32646))))

(declare-fun lt!76990 () (_ BitVec 64))

(declare-fun lt!76992 () (_ BitVec 64))

(assert (=> b!49441 (= res!41438 (= (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76993))) (currentByte!2919 (_2!2401 lt!76993)) (currentBit!2914 (_2!2401 lt!76993))) (bvadd lt!76990 lt!76992)))))

(assert (=> b!49441 (or (not (= (bvand lt!76990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76992 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!76990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!76990 lt!76992) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49441 (= lt!76992 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!49441 (= lt!76990 (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379)))))

(declare-fun b!49444 () Bool)

(assert (=> b!49444 (= e!32647 (= (bitIndex!0 (size!1050 (buf!1402 (_1!2414 lt!76991))) (currentByte!2919 (_1!2414 lt!76991)) (currentBit!2914 (_1!2414 lt!76991))) (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76993))) (currentByte!2919 (_2!2401 lt!76993)) (currentBit!2914 (_2!2401 lt!76993)))))))

(assert (= (and d!15322 res!41441) b!49441))

(assert (= (and b!49441 res!41438) b!49442))

(assert (= (and b!49442 res!41440) b!49443))

(assert (= (and b!49443 res!41439) b!49444))

(declare-fun m!77171 () Bool)

(assert (=> d!15322 m!77171))

(declare-fun m!77173 () Bool)

(assert (=> d!15322 m!77173))

(declare-fun m!77175 () Bool)

(assert (=> b!49444 m!77175))

(declare-fun m!77177 () Bool)

(assert (=> b!49444 m!77177))

(declare-fun m!77179 () Bool)

(assert (=> b!49443 m!77179))

(assert (=> b!49443 m!77179))

(declare-fun m!77181 () Bool)

(assert (=> b!49443 m!77181))

(assert (=> b!49441 m!77177))

(assert (=> b!49441 m!76051))

(declare-fun m!77183 () Bool)

(assert (=> b!49442 m!77183))

(assert (=> d!15162 d!15322))

(declare-fun d!15324 () Bool)

(declare-fun res!41443 () Bool)

(declare-fun e!32649 () Bool)

(assert (=> d!15324 (=> (not res!41443) (not e!32649))))

(assert (=> d!15324 (= res!41443 (= (size!1050 (buf!1402 (_1!2402 lt!76472))) (size!1050 (buf!1402 thiss!1379))))))

(assert (=> d!15324 (= (isPrefixOf!0 (_1!2402 lt!76472) thiss!1379) e!32649)))

(declare-fun b!49445 () Bool)

(declare-fun res!41444 () Bool)

(assert (=> b!49445 (=> (not res!41444) (not e!32649))))

(assert (=> b!49445 (= res!41444 (bvsle (bitIndex!0 (size!1050 (buf!1402 (_1!2402 lt!76472))) (currentByte!2919 (_1!2402 lt!76472)) (currentBit!2914 (_1!2402 lt!76472))) (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379))))))

(declare-fun b!49446 () Bool)

(declare-fun e!32648 () Bool)

(assert (=> b!49446 (= e!32649 e!32648)))

(declare-fun res!41442 () Bool)

(assert (=> b!49446 (=> res!41442 e!32648)))

(assert (=> b!49446 (= res!41442 (= (size!1050 (buf!1402 (_1!2402 lt!76472))) #b00000000000000000000000000000000))))

(declare-fun b!49447 () Bool)

(assert (=> b!49447 (= e!32648 (arrayBitRangesEq!0 (buf!1402 (_1!2402 lt!76472)) (buf!1402 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 (_1!2402 lt!76472))) (currentByte!2919 (_1!2402 lt!76472)) (currentBit!2914 (_1!2402 lt!76472)))))))

(assert (= (and d!15324 res!41443) b!49445))

(assert (= (and b!49445 res!41444) b!49446))

(assert (= (and b!49446 (not res!41442)) b!49447))

(assert (=> b!49445 m!76995))

(assert (=> b!49445 m!76051))

(assert (=> b!49447 m!76995))

(assert (=> b!49447 m!76995))

(declare-fun m!77185 () Bool)

(assert (=> b!49447 m!77185))

(assert (=> b!49078 d!15324))

(assert (=> b!49243 d!15176))

(declare-fun d!15326 () Bool)

(assert (=> d!15326 (= (invariant!0 (currentBit!2914 thiss!1379) (currentByte!2919 thiss!1379) (size!1050 (buf!1402 thiss!1379))) (and (bvsge (currentBit!2914 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2914 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2919 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2919 thiss!1379) (size!1050 (buf!1402 thiss!1379))) (and (= (currentBit!2914 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2919 thiss!1379) (size!1050 (buf!1402 thiss!1379)))))))))

(assert (=> d!15150 d!15326))

(declare-fun d!15328 () Bool)

(declare-fun e!32650 () Bool)

(assert (=> d!15328 e!32650))

(declare-fun res!41445 () Bool)

(assert (=> d!15328 (=> (not res!41445) (not e!32650))))

(declare-fun lt!76997 () (_ BitVec 64))

(declare-fun lt!76999 () (_ BitVec 64))

(declare-fun lt!76995 () (_ BitVec 64))

(assert (=> d!15328 (= res!41445 (= lt!76999 (bvsub lt!76997 lt!76995)))))

(assert (=> d!15328 (or (= (bvand lt!76997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76995 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76997 lt!76995) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15328 (= lt!76995 (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76669)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76669))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76669)))))))

(declare-fun lt!76998 () (_ BitVec 64))

(declare-fun lt!76996 () (_ BitVec 64))

(assert (=> d!15328 (= lt!76997 (bvmul lt!76998 lt!76996))))

(assert (=> d!15328 (or (= lt!76998 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!76996 (bvsdiv (bvmul lt!76998 lt!76996) lt!76998)))))

(assert (=> d!15328 (= lt!76996 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15328 (= lt!76998 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76669)))))))

(assert (=> d!15328 (= lt!76999 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76669))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76669)))))))

(assert (=> d!15328 (invariant!0 (currentBit!2914 (_2!2401 lt!76669)) (currentByte!2919 (_2!2401 lt!76669)) (size!1050 (buf!1402 (_2!2401 lt!76669))))))

(assert (=> d!15328 (= (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76669))) (currentByte!2919 (_2!2401 lt!76669)) (currentBit!2914 (_2!2401 lt!76669))) lt!76999)))

(declare-fun b!49448 () Bool)

(declare-fun res!41446 () Bool)

(assert (=> b!49448 (=> (not res!41446) (not e!32650))))

(assert (=> b!49448 (= res!41446 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!76999))))

(declare-fun b!49449 () Bool)

(declare-fun lt!76994 () (_ BitVec 64))

(assert (=> b!49449 (= e!32650 (bvsle lt!76999 (bvmul lt!76994 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49449 (or (= lt!76994 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!76994 #b0000000000000000000000000000000000000000000000000000000000001000) lt!76994)))))

(assert (=> b!49449 (= lt!76994 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76669)))))))

(assert (= (and d!15328 res!41445) b!49448))

(assert (= (and b!49448 res!41446) b!49449))

(declare-fun m!77187 () Bool)

(assert (=> d!15328 m!77187))

(assert (=> d!15328 m!76717))

(assert (=> d!15090 d!15328))

(assert (=> d!15090 d!15200))

(assert (=> d!15090 d!15236))

(assert (=> d!15090 d!15244))

(declare-fun d!15330 () Bool)

(assert (=> d!15330 (= (length!246 lt!76767) (size!1053 lt!76767))))

(declare-fun bs!3892 () Bool)

(assert (= bs!3892 d!15330))

(declare-fun m!77189 () Bool)

(assert (=> bs!3892 m!77189))

(assert (=> b!49251 d!15330))

(declare-fun d!15332 () Bool)

(assert (=> d!15332 (= (bitStreamReadBitsIntoList!0 (_2!2401 lt!75819) (_1!2402 lt!75804) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!237 lt!75806))))

(assert (=> d!15332 true))

(declare-fun _$34!41 () Unit!3418)

(assert (=> d!15332 (= (choose!42 (_2!2401 lt!75819) (_2!2401 lt!75819) (_1!2402 lt!75823) (_1!2402 lt!75804) (bvsub to!314 i!635) lt!75806) _$34!41)))

(declare-fun bs!3893 () Bool)

(assert (= bs!3893 d!15332))

(assert (=> bs!3893 m!76863))

(assert (=> bs!3893 m!76017))

(assert (=> d!15204 d!15332))

(assert (=> d!15174 d!15172))

(declare-fun d!15334 () Bool)

(assert (=> d!15334 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!15334 true))

(declare-fun _$14!238 () Unit!3418)

(assert (=> d!15334 (= (choose!11 thiss!1379) _$14!238)))

(declare-fun bs!3895 () Bool)

(assert (= bs!3895 d!15334))

(assert (=> bs!3895 m!76047))

(assert (=> d!15174 d!15334))

(declare-fun d!15336 () Bool)

(assert (=> d!15336 (= (length!246 lt!76714) (size!1053 lt!76714))))

(declare-fun bs!3896 () Bool)

(assert (= bs!3896 d!15336))

(declare-fun m!77191 () Bool)

(assert (=> bs!3896 m!77191))

(assert (=> b!49211 d!15336))

(assert (=> b!49189 d!15200))

(assert (=> b!49189 d!15002))

(assert (=> d!15074 d!15132))

(declare-fun d!15338 () Bool)

(assert (=> d!15338 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))) ((_ sign_extend 32) (currentByte!2919 thiss!1379)) ((_ sign_extend 32) (currentBit!2914 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!15338 true))

(declare-fun _$6!195 () Unit!3418)

(assert (=> d!15338 (= (choose!9 thiss!1379 (buf!1402 (_2!2401 lt!75814)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1821 (buf!1402 (_2!2401 lt!75814)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379))) _$6!195)))

(declare-fun bs!3897 () Bool)

(assert (= bs!3897 d!15338))

(assert (=> bs!3897 m!75993))

(assert (=> d!15074 d!15338))

(assert (=> d!15190 d!15172))

(declare-fun d!15340 () Bool)

(assert (=> d!15340 (isPrefixOf!0 lt!76791 (_2!2401 lt!75819))))

(declare-fun lt!77000 () Unit!3418)

(assert (=> d!15340 (= lt!77000 (choose!30 lt!76791 (_2!2401 lt!75819) (_2!2401 lt!75819)))))

(assert (=> d!15340 (isPrefixOf!0 lt!76791 (_2!2401 lt!75819))))

(assert (=> d!15340 (= (lemmaIsPrefixTransitive!0 lt!76791 (_2!2401 lt!75819) (_2!2401 lt!75819)) lt!77000)))

(declare-fun bs!3898 () Bool)

(assert (= bs!3898 d!15340))

(assert (=> bs!3898 m!76841))

(declare-fun m!77193 () Bool)

(assert (=> bs!3898 m!77193))

(assert (=> bs!3898 m!76841))

(assert (=> d!15190 d!15340))

(declare-fun d!15342 () Bool)

(assert (=> d!15342 (isPrefixOf!0 lt!76791 lt!76791)))

(declare-fun lt!77001 () Unit!3418)

(assert (=> d!15342 (= lt!77001 (choose!11 lt!76791))))

(assert (=> d!15342 (= (lemmaIsPrefixRefl!0 lt!76791) lt!77001)))

(declare-fun bs!3899 () Bool)

(assert (= bs!3899 d!15342))

(assert (=> bs!3899 m!76845))

(declare-fun m!77195 () Bool)

(assert (=> bs!3899 m!77195))

(assert (=> d!15190 d!15342))

(assert (=> d!15190 d!15174))

(declare-fun d!15344 () Bool)

(declare-fun res!41448 () Bool)

(declare-fun e!32652 () Bool)

(assert (=> d!15344 (=> (not res!41448) (not e!32652))))

(assert (=> d!15344 (= res!41448 (= (size!1050 (buf!1402 lt!76791)) (size!1050 (buf!1402 (_2!2401 lt!75819)))))))

(assert (=> d!15344 (= (isPrefixOf!0 lt!76791 (_2!2401 lt!75819)) e!32652)))

(declare-fun b!49450 () Bool)

(declare-fun res!41449 () Bool)

(assert (=> b!49450 (=> (not res!41449) (not e!32652))))

(assert (=> b!49450 (= res!41449 (bvsle (bitIndex!0 (size!1050 (buf!1402 lt!76791)) (currentByte!2919 lt!76791) (currentBit!2914 lt!76791)) (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75819))) (currentByte!2919 (_2!2401 lt!75819)) (currentBit!2914 (_2!2401 lt!75819)))))))

(declare-fun b!49451 () Bool)

(declare-fun e!32651 () Bool)

(assert (=> b!49451 (= e!32652 e!32651)))

(declare-fun res!41447 () Bool)

(assert (=> b!49451 (=> res!41447 e!32651)))

(assert (=> b!49451 (= res!41447 (= (size!1050 (buf!1402 lt!76791)) #b00000000000000000000000000000000))))

(declare-fun b!49452 () Bool)

(assert (=> b!49452 (= e!32651 (arrayBitRangesEq!0 (buf!1402 lt!76791) (buf!1402 (_2!2401 lt!75819)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 lt!76791)) (currentByte!2919 lt!76791) (currentBit!2914 lt!76791))))))

(assert (= (and d!15344 res!41448) b!49450))

(assert (= (and b!49450 res!41449) b!49451))

(assert (= (and b!49451 (not res!41447)) b!49452))

(declare-fun m!77197 () Bool)

(assert (=> b!49450 m!77197))

(assert (=> b!49450 m!76015))

(assert (=> b!49452 m!77197))

(assert (=> b!49452 m!77197))

(declare-fun m!77199 () Bool)

(assert (=> b!49452 m!77199))

(assert (=> d!15190 d!15344))

(declare-fun d!15346 () Bool)

(declare-fun res!41451 () Bool)

(declare-fun e!32654 () Bool)

(assert (=> d!15346 (=> (not res!41451) (not e!32654))))

(assert (=> d!15346 (= res!41451 (= (size!1050 (buf!1402 (_1!2402 lt!76800))) (size!1050 (buf!1402 (_2!2402 lt!76800)))))))

(assert (=> d!15346 (= (isPrefixOf!0 (_1!2402 lt!76800) (_2!2402 lt!76800)) e!32654)))

(declare-fun b!49453 () Bool)

(declare-fun res!41452 () Bool)

(assert (=> b!49453 (=> (not res!41452) (not e!32654))))

(assert (=> b!49453 (= res!41452 (bvsle (bitIndex!0 (size!1050 (buf!1402 (_1!2402 lt!76800))) (currentByte!2919 (_1!2402 lt!76800)) (currentBit!2914 (_1!2402 lt!76800))) (bitIndex!0 (size!1050 (buf!1402 (_2!2402 lt!76800))) (currentByte!2919 (_2!2402 lt!76800)) (currentBit!2914 (_2!2402 lt!76800)))))))

(declare-fun b!49454 () Bool)

(declare-fun e!32653 () Bool)

(assert (=> b!49454 (= e!32654 e!32653)))

(declare-fun res!41450 () Bool)

(assert (=> b!49454 (=> res!41450 e!32653)))

(assert (=> b!49454 (= res!41450 (= (size!1050 (buf!1402 (_1!2402 lt!76800))) #b00000000000000000000000000000000))))

(declare-fun b!49455 () Bool)

(assert (=> b!49455 (= e!32653 (arrayBitRangesEq!0 (buf!1402 (_1!2402 lt!76800)) (buf!1402 (_2!2402 lt!76800)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 (_1!2402 lt!76800))) (currentByte!2919 (_1!2402 lt!76800)) (currentBit!2914 (_1!2402 lt!76800)))))))

(assert (= (and d!15346 res!41451) b!49453))

(assert (= (and b!49453 res!41452) b!49454))

(assert (= (and b!49454 (not res!41450)) b!49455))

(declare-fun m!77201 () Bool)

(assert (=> b!49453 m!77201))

(assert (=> b!49453 m!77105))

(assert (=> b!49455 m!77201))

(assert (=> b!49455 m!77201))

(declare-fun m!77203 () Bool)

(assert (=> b!49455 m!77203))

(assert (=> d!15190 d!15346))

(declare-fun d!15348 () Bool)

(declare-fun res!41454 () Bool)

(declare-fun e!32656 () Bool)

(assert (=> d!15348 (=> (not res!41454) (not e!32656))))

(assert (=> d!15348 (= res!41454 (= (size!1050 (buf!1402 lt!76791)) (size!1050 (buf!1402 lt!76791))))))

(assert (=> d!15348 (= (isPrefixOf!0 lt!76791 lt!76791) e!32656)))

(declare-fun b!49456 () Bool)

(declare-fun res!41455 () Bool)

(assert (=> b!49456 (=> (not res!41455) (not e!32656))))

(assert (=> b!49456 (= res!41455 (bvsle (bitIndex!0 (size!1050 (buf!1402 lt!76791)) (currentByte!2919 lt!76791) (currentBit!2914 lt!76791)) (bitIndex!0 (size!1050 (buf!1402 lt!76791)) (currentByte!2919 lt!76791) (currentBit!2914 lt!76791))))))

(declare-fun b!49457 () Bool)

(declare-fun e!32655 () Bool)

(assert (=> b!49457 (= e!32656 e!32655)))

(declare-fun res!41453 () Bool)

(assert (=> b!49457 (=> res!41453 e!32655)))

(assert (=> b!49457 (= res!41453 (= (size!1050 (buf!1402 lt!76791)) #b00000000000000000000000000000000))))

(declare-fun b!49458 () Bool)

(assert (=> b!49458 (= e!32655 (arrayBitRangesEq!0 (buf!1402 lt!76791) (buf!1402 lt!76791) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 lt!76791)) (currentByte!2919 lt!76791) (currentBit!2914 lt!76791))))))

(assert (= (and d!15348 res!41454) b!49456))

(assert (= (and b!49456 res!41455) b!49457))

(assert (= (and b!49457 (not res!41453)) b!49458))

(assert (=> b!49456 m!77197))

(assert (=> b!49456 m!77197))

(assert (=> b!49458 m!77197))

(assert (=> b!49458 m!77197))

(declare-fun m!77205 () Bool)

(assert (=> b!49458 m!77205))

(assert (=> d!15190 d!15348))

(assert (=> d!15190 d!15064))

(declare-fun d!15350 () Bool)

(assert (=> d!15350 (isPrefixOf!0 lt!76791 (_2!2401 lt!75819))))

(declare-fun lt!77002 () Unit!3418)

(assert (=> d!15350 (= lt!77002 (choose!30 lt!76791 thiss!1379 (_2!2401 lt!75819)))))

(assert (=> d!15350 (isPrefixOf!0 lt!76791 thiss!1379)))

(assert (=> d!15350 (= (lemmaIsPrefixTransitive!0 lt!76791 thiss!1379 (_2!2401 lt!75819)) lt!77002)))

(declare-fun bs!3900 () Bool)

(assert (= bs!3900 d!15350))

(assert (=> bs!3900 m!76841))

(declare-fun m!77207 () Bool)

(assert (=> bs!3900 m!77207))

(declare-fun m!77209 () Bool)

(assert (=> bs!3900 m!77209))

(assert (=> d!15190 d!15350))

(assert (=> d!15190 d!15282))

(assert (=> d!15190 d!15284))

(declare-fun d!15352 () Bool)

(declare-fun e!32657 () Bool)

(assert (=> d!15352 e!32657))

(declare-fun c!3510 () Bool)

(assert (=> d!15352 (= c!3510 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!76712) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77005 () List!551)

(declare-fun e!32658 () tuple2!4626)

(assert (=> d!15352 (= lt!77005 (_1!2412 e!32658))))

(declare-fun c!3511 () Bool)

(assert (=> d!15352 (= c!3511 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!76712) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15352 (bvsge (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!76712) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15352 (= (bitStreamReadBitsIntoList!0 (_2!2401 lt!75814) (_2!2413 lt!76713) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!76712)) lt!77005)))

(declare-fun lt!77004 () tuple2!4628)

(declare-fun lt!77003 () (_ BitVec 64))

(declare-fun b!49460 () Bool)

(assert (=> b!49460 (= e!32658 (tuple2!4627 (Cons!547 (_1!2413 lt!77004) (bitStreamReadBitsIntoList!0 (_2!2401 lt!75814) (_2!2413 lt!77004) (bvsub (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!76712) lt!77003))) (_2!2413 lt!77004)))))

(assert (=> b!49460 (= lt!77004 (readBit!0 (_2!2413 lt!76713)))))

(assert (=> b!49460 (= lt!77003 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!49459 () Bool)

(assert (=> b!49459 (= e!32658 (tuple2!4627 Nil!548 (_2!2413 lt!76713)))))

(declare-fun b!49461 () Bool)

(assert (=> b!49461 (= e!32657 (isEmpty!145 lt!77005))))

(declare-fun b!49462 () Bool)

(assert (=> b!49462 (= e!32657 (> (length!246 lt!77005) 0))))

(assert (= (and d!15352 c!3511) b!49459))

(assert (= (and d!15352 (not c!3511)) b!49460))

(assert (= (and d!15352 c!3510) b!49461))

(assert (= (and d!15352 (not c!3510)) b!49462))

(declare-fun m!77211 () Bool)

(assert (=> b!49460 m!77211))

(declare-fun m!77213 () Bool)

(assert (=> b!49460 m!77213))

(declare-fun m!77215 () Bool)

(assert (=> b!49461 m!77215))

(declare-fun m!77217 () Bool)

(assert (=> b!49462 m!77217))

(assert (=> b!49209 d!15352))

(declare-fun d!15354 () Bool)

(declare-fun e!32659 () Bool)

(assert (=> d!15354 e!32659))

(declare-fun res!41456 () Bool)

(assert (=> d!15354 (=> (not res!41456) (not e!32659))))

(assert (=> d!15354 (= res!41456 (= (buf!1402 (_2!2401 (increaseBitIndex!0 (_1!2402 lt!75822)))) (buf!1402 (_1!2402 lt!75822))))))

(declare-fun lt!77010 () Bool)

(assert (=> d!15354 (= lt!77010 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 (buf!1402 (_1!2402 lt!75822))) (currentByte!2919 (_1!2402 lt!75822)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2914 (_1!2402 lt!75822))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77006 () tuple2!4628)

(assert (=> d!15354 (= lt!77006 (tuple2!4629 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 (buf!1402 (_1!2402 lt!75822))) (currentByte!2919 (_1!2402 lt!75822)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2914 (_1!2402 lt!75822))))) #b00000000000000000000000000000000)) (_2!2401 (increaseBitIndex!0 (_1!2402 lt!75822)))))))

(assert (=> d!15354 (validate_offset_bit!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_1!2402 lt!75822)))) ((_ sign_extend 32) (currentByte!2919 (_1!2402 lt!75822))) ((_ sign_extend 32) (currentBit!2914 (_1!2402 lt!75822))))))

(assert (=> d!15354 (= (readBit!0 (_1!2402 lt!75822)) lt!77006)))

(declare-fun lt!77011 () (_ BitVec 64))

(declare-fun lt!77007 () (_ BitVec 64))

(declare-fun b!49463 () Bool)

(assert (=> b!49463 (= e!32659 (= (bitIndex!0 (size!1050 (buf!1402 (_2!2401 (increaseBitIndex!0 (_1!2402 lt!75822))))) (currentByte!2919 (_2!2401 (increaseBitIndex!0 (_1!2402 lt!75822)))) (currentBit!2914 (_2!2401 (increaseBitIndex!0 (_1!2402 lt!75822))))) (bvadd lt!77011 lt!77007)))))

(assert (=> b!49463 (or (not (= (bvand lt!77011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77007 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77011 lt!77007) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49463 (= lt!77007 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!49463 (= lt!77011 (bitIndex!0 (size!1050 (buf!1402 (_1!2402 lt!75822))) (currentByte!2919 (_1!2402 lt!75822)) (currentBit!2914 (_1!2402 lt!75822))))))

(declare-fun lt!77012 () Bool)

(assert (=> b!49463 (= lt!77012 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 (buf!1402 (_1!2402 lt!75822))) (currentByte!2919 (_1!2402 lt!75822)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2914 (_1!2402 lt!75822))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77009 () Bool)

(assert (=> b!49463 (= lt!77009 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 (buf!1402 (_1!2402 lt!75822))) (currentByte!2919 (_1!2402 lt!75822)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2914 (_1!2402 lt!75822))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77008 () Bool)

(assert (=> b!49463 (= lt!77008 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 (buf!1402 (_1!2402 lt!75822))) (currentByte!2919 (_1!2402 lt!75822)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2914 (_1!2402 lt!75822))))) #b00000000000000000000000000000000)))))

(assert (= (and d!15354 res!41456) b!49463))

(declare-fun m!77219 () Bool)

(assert (=> d!15354 m!77219))

(declare-fun m!77221 () Bool)

(assert (=> d!15354 m!77221))

(declare-fun m!77223 () Bool)

(assert (=> d!15354 m!77223))

(declare-fun m!77225 () Bool)

(assert (=> d!15354 m!77225))

(declare-fun m!77227 () Bool)

(assert (=> b!49463 m!77227))

(declare-fun m!77229 () Bool)

(assert (=> b!49463 m!77229))

(assert (=> b!49463 m!77223))

(assert (=> b!49463 m!77219))

(assert (=> b!49463 m!77221))

(assert (=> b!49209 d!15354))

(assert (=> d!15184 d!15194))

(declare-fun d!15356 () Bool)

(assert (=> d!15356 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75819)))) ((_ sign_extend 32) (currentByte!2919 thiss!1379)) ((_ sign_extend 32) (currentBit!2914 thiss!1379)) (bvsub to!314 i!635))))

(assert (=> d!15356 true))

(declare-fun _$6!196 () Unit!3418)

(assert (=> d!15356 (= (choose!9 thiss!1379 (buf!1402 (_2!2401 lt!75819)) (bvsub to!314 i!635) (BitStream!1821 (buf!1402 (_2!2401 lt!75819)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379))) _$6!196)))

(declare-fun bs!3901 () Bool)

(assert (= bs!3901 d!15356))

(assert (=> bs!3901 m!76009))

(assert (=> d!15184 d!15356))

(declare-fun d!15358 () Bool)

(assert (=> d!15358 (= (isEmpty!145 lt!76810) (is-Nil!548 lt!76810))))

(assert (=> b!49264 d!15358))

(declare-fun d!15360 () Bool)

(declare-fun c!3512 () Bool)

(assert (=> d!15360 (= c!3512 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32660 () List!551)

(assert (=> d!15360 (= (byteArrayBitContentToList!0 (_2!2401 lt!75814) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)) e!32660)))

(declare-fun b!49464 () Bool)

(assert (=> b!49464 (= e!32660 Nil!548)))

(declare-fun b!49465 () Bool)

(assert (=> b!49465 (= e!32660 (Cons!547 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2401 lt!75814) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15360 c!3512) b!49464))

(assert (= (and d!15360 (not c!3512)) b!49465))

(assert (=> b!49465 m!76917))

(assert (=> b!49465 m!76919))

(declare-fun m!77231 () Bool)

(assert (=> b!49465 m!77231))

(assert (=> b!49199 d!15360))

(assert (=> b!49238 d!15314))

(assert (=> b!49238 d!15176))

(declare-fun d!15362 () Bool)

(assert (=> d!15362 (= (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814)))) (bvsub (bvmul ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))))))))

(assert (=> d!15158 d!15362))

(declare-fun d!15364 () Bool)

(assert (=> d!15364 (= (invariant!0 (currentBit!2914 (_2!2401 lt!76669)) (currentByte!2919 (_2!2401 lt!76669)) (size!1050 (buf!1402 (_2!2401 lt!76669)))) (and (bvsge (currentBit!2914 (_2!2401 lt!76669)) #b00000000000000000000000000000000) (bvslt (currentBit!2914 (_2!2401 lt!76669)) #b00000000000000000000000000001000) (bvsge (currentByte!2919 (_2!2401 lt!76669)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2919 (_2!2401 lt!76669)) (size!1050 (buf!1402 (_2!2401 lt!76669)))) (and (= (currentBit!2914 (_2!2401 lt!76669)) #b00000000000000000000000000000000) (= (currentByte!2919 (_2!2401 lt!76669)) (size!1050 (buf!1402 (_2!2401 lt!76669))))))))))

(assert (=> b!49181 d!15364))

(declare-fun d!15366 () Bool)

(declare-fun res!41458 () Bool)

(declare-fun e!32662 () Bool)

(assert (=> d!15366 (=> (not res!41458) (not e!32662))))

(assert (=> d!15366 (= res!41458 (= (size!1050 (buf!1402 (_1!2402 lt!76800))) (size!1050 (buf!1402 thiss!1379))))))

(assert (=> d!15366 (= (isPrefixOf!0 (_1!2402 lt!76800) thiss!1379) e!32662)))

(declare-fun b!49466 () Bool)

(declare-fun res!41459 () Bool)

(assert (=> b!49466 (=> (not res!41459) (not e!32662))))

(assert (=> b!49466 (= res!41459 (bvsle (bitIndex!0 (size!1050 (buf!1402 (_1!2402 lt!76800))) (currentByte!2919 (_1!2402 lt!76800)) (currentBit!2914 (_1!2402 lt!76800))) (bitIndex!0 (size!1050 (buf!1402 thiss!1379)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379))))))

(declare-fun b!49467 () Bool)

(declare-fun e!32661 () Bool)

(assert (=> b!49467 (= e!32662 e!32661)))

(declare-fun res!41457 () Bool)

(assert (=> b!49467 (=> res!41457 e!32661)))

(assert (=> b!49467 (= res!41457 (= (size!1050 (buf!1402 (_1!2402 lt!76800))) #b00000000000000000000000000000000))))

(declare-fun b!49468 () Bool)

(assert (=> b!49468 (= e!32661 (arrayBitRangesEq!0 (buf!1402 (_1!2402 lt!76800)) (buf!1402 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 (_1!2402 lt!76800))) (currentByte!2919 (_1!2402 lt!76800)) (currentBit!2914 (_1!2402 lt!76800)))))))

(assert (= (and d!15366 res!41458) b!49466))

(assert (= (and b!49466 res!41459) b!49467))

(assert (= (and b!49467 (not res!41457)) b!49468))

(assert (=> b!49466 m!77201))

(assert (=> b!49466 m!76051))

(assert (=> b!49468 m!77201))

(assert (=> b!49468 m!77201))

(declare-fun m!77233 () Bool)

(assert (=> b!49468 m!77233))

(assert (=> b!49260 d!15366))

(declare-fun d!15368 () Bool)

(declare-fun e!32663 () Bool)

(assert (=> d!15368 e!32663))

(declare-fun c!3513 () Bool)

(assert (=> d!15368 (= c!3513 (= (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77015 () List!551)

(declare-fun e!32664 () tuple2!4626)

(assert (=> d!15368 (= lt!77015 (_1!2412 e!32664))))

(declare-fun c!3514 () Bool)

(assert (=> d!15368 (= c!3514 (= (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15368 (bvsge (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15368 (= (bitStreamReadBitsIntoList!0 (_2!2401 lt!75819) (_1!2402 lt!75804) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) lt!77015)))

(declare-fun b!49470 () Bool)

(declare-fun lt!77013 () (_ BitVec 64))

(declare-fun lt!77014 () tuple2!4628)

(assert (=> b!49470 (= e!32664 (tuple2!4627 (Cons!547 (_1!2413 lt!77014) (bitStreamReadBitsIntoList!0 (_2!2401 lt!75819) (_2!2413 lt!77014) (bvsub (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!77013))) (_2!2413 lt!77014)))))

(assert (=> b!49470 (= lt!77014 (readBit!0 (_1!2402 lt!75804)))))

(assert (=> b!49470 (= lt!77013 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!49469 () Bool)

(assert (=> b!49469 (= e!32664 (tuple2!4627 Nil!548 (_1!2402 lt!75804)))))

(declare-fun b!49471 () Bool)

(assert (=> b!49471 (= e!32663 (isEmpty!145 lt!77015))))

(declare-fun b!49472 () Bool)

(assert (=> b!49472 (= e!32663 (> (length!246 lt!77015) 0))))

(assert (= (and d!15368 c!3514) b!49469))

(assert (= (and d!15368 (not c!3514)) b!49470))

(assert (= (and d!15368 c!3513) b!49471))

(assert (= (and d!15368 (not c!3513)) b!49472))

(declare-fun m!77235 () Bool)

(assert (=> b!49470 m!77235))

(assert (=> b!49470 m!76795))

(declare-fun m!77237 () Bool)

(assert (=> b!49471 m!77237))

(declare-fun m!77239 () Bool)

(assert (=> b!49472 m!77239))

(assert (=> b!49270 d!15368))

(assert (=> b!49270 d!15202))

(declare-fun d!15370 () Bool)

(declare-fun e!32665 () Bool)

(assert (=> d!15370 e!32665))

(declare-fun res!41460 () Bool)

(assert (=> d!15370 (=> (not res!41460) (not e!32665))))

(declare-fun lt!77016 () BitStream!1820)

(declare-fun lt!77017 () (_ BitVec 64))

(assert (=> d!15370 (= res!41460 (= (bvadd lt!77017 (bvsub lt!76792 lt!76801)) (bitIndex!0 (size!1050 (buf!1402 lt!77016)) (currentByte!2919 lt!77016) (currentBit!2914 lt!77016))))))

(assert (=> d!15370 (or (not (= (bvand lt!77017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76792 lt!76801) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77017 (bvsub lt!76792 lt!76801)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15370 (= lt!77017 (bitIndex!0 (size!1050 (buf!1402 (_2!2402 lt!76800))) (currentByte!2919 (_2!2402 lt!76800)) (currentBit!2914 (_2!2402 lt!76800))))))

(assert (=> d!15370 (= lt!77016 (_2!2401 (moveBitIndex!0 (_2!2402 lt!76800) (bvsub lt!76792 lt!76801))))))

(assert (=> d!15370 (moveBitIndexPrecond!0 (_2!2402 lt!76800) (bvsub lt!76792 lt!76801))))

(assert (=> d!15370 (= (withMovedBitIndex!0 (_2!2402 lt!76800) (bvsub lt!76792 lt!76801)) lt!77016)))

(declare-fun b!49473 () Bool)

(assert (=> b!49473 (= e!32665 (= (size!1050 (buf!1402 (_2!2402 lt!76800))) (size!1050 (buf!1402 lt!77016))))))

(assert (= (and d!15370 res!41460) b!49473))

(declare-fun m!77241 () Bool)

(assert (=> d!15370 m!77241))

(assert (=> d!15370 m!77105))

(declare-fun m!77243 () Bool)

(assert (=> d!15370 m!77243))

(declare-fun m!77245 () Bool)

(assert (=> d!15370 m!77245))

(assert (=> b!49258 d!15370))

(assert (=> b!49258 d!15002))

(assert (=> b!49258 d!15176))

(declare-fun d!15372 () Bool)

(assert (=> d!15372 (= (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 thiss!1379))) ((_ sign_extend 32) (currentByte!2919 thiss!1379)) ((_ sign_extend 32) (currentBit!2914 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1050 (buf!1402 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2919 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2914 thiss!1379)))))))

(assert (=> d!15178 d!15372))

(declare-fun d!15374 () Bool)

(declare-fun lt!77018 () tuple2!4628)

(assert (=> d!15374 (= lt!77018 (readBit!0 (readerFrom!0 (_2!2401 lt!76750) (currentBit!2914 thiss!1379) (currentByte!2919 thiss!1379))))))

(assert (=> d!15374 (= (readBitPure!0 (readerFrom!0 (_2!2401 lt!76750) (currentBit!2914 thiss!1379) (currentByte!2919 thiss!1379))) (tuple2!4631 (_2!2413 lt!77018) (_1!2413 lt!77018)))))

(declare-fun bs!3902 () Bool)

(assert (= bs!3902 d!15374))

(assert (=> bs!3902 m!76763))

(declare-fun m!77247 () Bool)

(assert (=> bs!3902 m!77247))

(assert (=> b!49236 d!15374))

(declare-fun d!15376 () Bool)

(declare-fun e!32666 () Bool)

(assert (=> d!15376 e!32666))

(declare-fun res!41461 () Bool)

(assert (=> d!15376 (=> (not res!41461) (not e!32666))))

(assert (=> d!15376 (= res!41461 (invariant!0 (currentBit!2914 (_2!2401 lt!76750)) (currentByte!2919 (_2!2401 lt!76750)) (size!1050 (buf!1402 (_2!2401 lt!76750)))))))

(assert (=> d!15376 (= (readerFrom!0 (_2!2401 lt!76750) (currentBit!2914 thiss!1379) (currentByte!2919 thiss!1379)) (BitStream!1821 (buf!1402 (_2!2401 lt!76750)) (currentByte!2919 thiss!1379) (currentBit!2914 thiss!1379)))))

(declare-fun b!49474 () Bool)

(assert (=> b!49474 (= e!32666 (invariant!0 (currentBit!2914 thiss!1379) (currentByte!2919 thiss!1379) (size!1050 (buf!1402 (_2!2401 lt!76750)))))))

(assert (= (and d!15376 res!41461) b!49474))

(assert (=> d!15376 m!77143))

(declare-fun m!77249 () Bool)

(assert (=> b!49474 m!77249))

(assert (=> b!49236 d!15376))

(assert (=> d!15200 d!15362))

(assert (=> d!15200 d!15170))

(assert (=> d!15176 d!15372))

(assert (=> d!15176 d!15326))

(assert (=> d!15182 d!15180))

(declare-fun d!15378 () Bool)

(assert (=> d!15378 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75819)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))) lt!75820)))

(assert (=> d!15378 true))

(declare-fun _$6!197 () Unit!3418)

(assert (=> d!15378 (= (choose!9 (_2!2401 lt!75814) (buf!1402 (_2!2401 lt!75819)) lt!75820 (BitStream!1821 (buf!1402 (_2!2401 lt!75819)) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814)))) _$6!197)))

(declare-fun bs!3903 () Bool)

(assert (= bs!3903 d!15378))

(assert (=> bs!3903 m!76005))

(assert (=> d!15182 d!15378))

(declare-fun d!15380 () Bool)

(declare-fun e!32667 () Bool)

(assert (=> d!15380 e!32667))

(declare-fun c!3515 () Bool)

(assert (=> d!15380 (= c!3515 (= (bvsub lt!75820 lt!76765) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77021 () List!551)

(declare-fun e!32668 () tuple2!4626)

(assert (=> d!15380 (= lt!77021 (_1!2412 e!32668))))

(declare-fun c!3516 () Bool)

(assert (=> d!15380 (= c!3516 (= (bvsub lt!75820 lt!76765) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15380 (bvsge (bvsub lt!75820 lt!76765) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15380 (= (bitStreamReadBitsIntoList!0 (_2!2401 lt!75819) (_2!2413 lt!76766) (bvsub lt!75820 lt!76765)) lt!77021)))

(declare-fun b!49476 () Bool)

(declare-fun lt!77019 () (_ BitVec 64))

(declare-fun lt!77020 () tuple2!4628)

(assert (=> b!49476 (= e!32668 (tuple2!4627 (Cons!547 (_1!2413 lt!77020) (bitStreamReadBitsIntoList!0 (_2!2401 lt!75819) (_2!2413 lt!77020) (bvsub (bvsub lt!75820 lt!76765) lt!77019))) (_2!2413 lt!77020)))))

(assert (=> b!49476 (= lt!77020 (readBit!0 (_2!2413 lt!76766)))))

(assert (=> b!49476 (= lt!77019 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!49475 () Bool)

(assert (=> b!49475 (= e!32668 (tuple2!4627 Nil!548 (_2!2413 lt!76766)))))

(declare-fun b!49477 () Bool)

(assert (=> b!49477 (= e!32667 (isEmpty!145 lt!77021))))

(declare-fun b!49478 () Bool)

(assert (=> b!49478 (= e!32667 (> (length!246 lt!77021) 0))))

(assert (= (and d!15380 c!3516) b!49475))

(assert (= (and d!15380 (not c!3516)) b!49476))

(assert (= (and d!15380 c!3515) b!49477))

(assert (= (and d!15380 (not c!3515)) b!49478))

(declare-fun m!77251 () Bool)

(assert (=> b!49476 m!77251))

(declare-fun m!77253 () Bool)

(assert (=> b!49476 m!77253))

(declare-fun m!77255 () Bool)

(assert (=> b!49477 m!77255))

(declare-fun m!77257 () Bool)

(assert (=> b!49478 m!77257))

(assert (=> b!49249 d!15380))

(declare-fun d!15382 () Bool)

(declare-fun e!32669 () Bool)

(assert (=> d!15382 e!32669))

(declare-fun res!41462 () Bool)

(assert (=> d!15382 (=> (not res!41462) (not e!32669))))

(assert (=> d!15382 (= res!41462 (= (buf!1402 (_2!2401 (increaseBitIndex!0 (_1!2402 lt!75804)))) (buf!1402 (_1!2402 lt!75804))))))

(declare-fun lt!77026 () Bool)

(assert (=> d!15382 (= lt!77026 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 (buf!1402 (_1!2402 lt!75804))) (currentByte!2919 (_1!2402 lt!75804)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2914 (_1!2402 lt!75804))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77022 () tuple2!4628)

(assert (=> d!15382 (= lt!77022 (tuple2!4629 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 (buf!1402 (_1!2402 lt!75804))) (currentByte!2919 (_1!2402 lt!75804)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2914 (_1!2402 lt!75804))))) #b00000000000000000000000000000000)) (_2!2401 (increaseBitIndex!0 (_1!2402 lt!75804)))))))

(assert (=> d!15382 (validate_offset_bit!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_1!2402 lt!75804)))) ((_ sign_extend 32) (currentByte!2919 (_1!2402 lt!75804))) ((_ sign_extend 32) (currentBit!2914 (_1!2402 lt!75804))))))

(assert (=> d!15382 (= (readBit!0 (_1!2402 lt!75804)) lt!77022)))

(declare-fun lt!77027 () (_ BitVec 64))

(declare-fun b!49479 () Bool)

(declare-fun lt!77023 () (_ BitVec 64))

(assert (=> b!49479 (= e!32669 (= (bitIndex!0 (size!1050 (buf!1402 (_2!2401 (increaseBitIndex!0 (_1!2402 lt!75804))))) (currentByte!2919 (_2!2401 (increaseBitIndex!0 (_1!2402 lt!75804)))) (currentBit!2914 (_2!2401 (increaseBitIndex!0 (_1!2402 lt!75804))))) (bvadd lt!77027 lt!77023)))))

(assert (=> b!49479 (or (not (= (bvand lt!77027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77023 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77027 lt!77023) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49479 (= lt!77023 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!49479 (= lt!77027 (bitIndex!0 (size!1050 (buf!1402 (_1!2402 lt!75804))) (currentByte!2919 (_1!2402 lt!75804)) (currentBit!2914 (_1!2402 lt!75804))))))

(declare-fun lt!77028 () Bool)

(assert (=> b!49479 (= lt!77028 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 (buf!1402 (_1!2402 lt!75804))) (currentByte!2919 (_1!2402 lt!75804)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2914 (_1!2402 lt!75804))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77025 () Bool)

(assert (=> b!49479 (= lt!77025 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 (buf!1402 (_1!2402 lt!75804))) (currentByte!2919 (_1!2402 lt!75804)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2914 (_1!2402 lt!75804))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77024 () Bool)

(assert (=> b!49479 (= lt!77024 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 (buf!1402 (_1!2402 lt!75804))) (currentByte!2919 (_1!2402 lt!75804)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2914 (_1!2402 lt!75804))))) #b00000000000000000000000000000000)))))

(assert (= (and d!15382 res!41462) b!49479))

(declare-fun m!77259 () Bool)

(assert (=> d!15382 m!77259))

(declare-fun m!77261 () Bool)

(assert (=> d!15382 m!77261))

(declare-fun m!77263 () Bool)

(assert (=> d!15382 m!77263))

(declare-fun m!77265 () Bool)

(assert (=> d!15382 m!77265))

(declare-fun m!77267 () Bool)

(assert (=> b!49479 m!77267))

(declare-fun m!77269 () Bool)

(assert (=> b!49479 m!77269))

(assert (=> b!49479 m!77263))

(assert (=> b!49479 m!77259))

(assert (=> b!49479 m!77261))

(assert (=> b!49249 d!15382))

(declare-fun d!15384 () Bool)

(declare-fun e!32670 () Bool)

(assert (=> d!15384 e!32670))

(declare-fun res!41466 () Bool)

(assert (=> d!15384 (=> (not res!41466) (not e!32670))))

(declare-fun lt!77038 () tuple2!4604)

(assert (=> d!15384 (= res!41466 (= (size!1050 (buf!1402 (_2!2401 lt!77038))) (size!1050 (buf!1402 (_2!2401 lt!75814)))))))

(declare-fun lt!77034 () (_ BitVec 8))

(declare-fun lt!77030 () array!2315)

(assert (=> d!15384 (= lt!77034 (select (arr!1576 lt!77030) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!15384 (and (bvsge ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1050 lt!77030)))))

(assert (=> d!15384 (= lt!77030 (array!2316 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!77032 () tuple2!4604)

(assert (=> d!15384 (= lt!77038 (tuple2!4605 (_1!2401 lt!77032) (_2!2401 lt!77032)))))

(declare-fun lt!77037 () tuple2!4604)

(assert (=> d!15384 (= lt!77032 lt!77037)))

(declare-fun e!32673 () Bool)

(assert (=> d!15384 e!32673))

(declare-fun res!41465 () Bool)

(assert (=> d!15384 (=> (not res!41465) (not e!32673))))

(assert (=> d!15384 (= res!41465 (= (size!1050 (buf!1402 (_2!2401 lt!75814))) (size!1050 (buf!1402 (_2!2401 lt!77037)))))))

(declare-fun lt!77029 () Bool)

(assert (=> d!15384 (= lt!77037 (appendBit!0 (_2!2401 lt!75814) lt!77029))))

(assert (=> d!15384 (= lt!77029 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1576 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!15384 (and (bvsge ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!15384 (= (appendBitFromByte!0 (_2!2401 lt!75814) (select (arr!1576 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!77038)))

(declare-fun b!49480 () Bool)

(declare-fun e!32671 () Bool)

(assert (=> b!49480 (= e!32670 e!32671)))

(declare-fun res!41464 () Bool)

(assert (=> b!49480 (=> (not res!41464) (not e!32671))))

(declare-fun lt!77033 () tuple2!4630)

(assert (=> b!49480 (= res!41464 (and (= (_2!2414 lt!77033) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1576 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!77034)) #b00000000000000000000000000000000))) (= (_1!2414 lt!77033) (_2!2401 lt!77038))))))

(declare-fun lt!77040 () tuple2!4624)

(declare-fun lt!77039 () BitStream!1820)

(assert (=> b!49480 (= lt!77040 (readBits!0 lt!77039 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!49480 (= lt!77033 (readBitPure!0 lt!77039))))

(assert (=> b!49480 (= lt!77039 (readerFrom!0 (_2!2401 lt!77038) (currentBit!2914 (_2!2401 lt!75814)) (currentByte!2919 (_2!2401 lt!75814))))))

(declare-fun b!49481 () Bool)

(declare-fun e!32672 () Bool)

(assert (=> b!49481 (= e!32673 e!32672)))

(declare-fun res!41467 () Bool)

(assert (=> b!49481 (=> (not res!41467) (not e!32672))))

(declare-fun lt!77036 () tuple2!4630)

(assert (=> b!49481 (= res!41467 (and (= (_2!2414 lt!77036) lt!77029) (= (_1!2414 lt!77036) (_2!2401 lt!77037))))))

(assert (=> b!49481 (= lt!77036 (readBitPure!0 (readerFrom!0 (_2!2401 lt!77037) (currentBit!2914 (_2!2401 lt!75814)) (currentByte!2919 (_2!2401 lt!75814)))))))

(declare-fun b!49482 () Bool)

(declare-fun res!41470 () Bool)

(assert (=> b!49482 (=> (not res!41470) (not e!32670))))

(assert (=> b!49482 (= res!41470 (isPrefixOf!0 (_2!2401 lt!75814) (_2!2401 lt!77038)))))

(declare-fun b!49483 () Bool)

(declare-fun res!41463 () Bool)

(assert (=> b!49483 (=> (not res!41463) (not e!32673))))

(assert (=> b!49483 (= res!41463 (= (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!77037))) (currentByte!2919 (_2!2401 lt!77037)) (currentBit!2914 (_2!2401 lt!77037))) (bvadd (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!49484 () Bool)

(declare-fun res!41469 () Bool)

(assert (=> b!49484 (=> (not res!41469) (not e!32673))))

(assert (=> b!49484 (= res!41469 (isPrefixOf!0 (_2!2401 lt!75814) (_2!2401 lt!77037)))))

(declare-fun b!49485 () Bool)

(assert (=> b!49485 (= e!32671 (= (bitIndex!0 (size!1050 (buf!1402 (_1!2414 lt!77033))) (currentByte!2919 (_1!2414 lt!77033)) (currentBit!2914 (_1!2414 lt!77033))) (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!77038))) (currentByte!2919 (_2!2401 lt!77038)) (currentBit!2914 (_2!2401 lt!77038)))))))

(declare-fun b!49486 () Bool)

(assert (=> b!49486 (= e!32672 (= (bitIndex!0 (size!1050 (buf!1402 (_1!2414 lt!77036))) (currentByte!2919 (_1!2414 lt!77036)) (currentBit!2914 (_1!2414 lt!77036))) (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!77037))) (currentByte!2919 (_2!2401 lt!77037)) (currentBit!2914 (_2!2401 lt!77037)))))))

(declare-fun b!49487 () Bool)

(declare-fun res!41468 () Bool)

(assert (=> b!49487 (=> (not res!41468) (not e!32670))))

(declare-fun lt!77031 () (_ BitVec 64))

(declare-fun lt!77035 () (_ BitVec 64))

(assert (=> b!49487 (= res!41468 (= (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!77038))) (currentByte!2919 (_2!2401 lt!77038)) (currentBit!2914 (_2!2401 lt!77038))) (bvadd lt!77035 lt!77031)))))

(assert (=> b!49487 (or (not (= (bvand lt!77035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77031 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77035 lt!77031) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49487 (= lt!77031 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!49487 (= lt!77035 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))))))

(assert (= (and d!15384 res!41465) b!49483))

(assert (= (and b!49483 res!41463) b!49484))

(assert (= (and b!49484 res!41469) b!49481))

(assert (= (and b!49481 res!41467) b!49486))

(assert (= (and d!15384 res!41466) b!49487))

(assert (= (and b!49487 res!41468) b!49482))

(assert (= (and b!49482 res!41470) b!49480))

(assert (= (and b!49480 res!41464) b!49485))

(declare-fun m!77271 () Bool)

(assert (=> b!49482 m!77271))

(declare-fun m!77273 () Bool)

(assert (=> b!49483 m!77273))

(assert (=> b!49483 m!76035))

(declare-fun m!77275 () Bool)

(assert (=> b!49484 m!77275))

(declare-fun m!77277 () Bool)

(assert (=> b!49486 m!77277))

(assert (=> b!49486 m!77273))

(declare-fun m!77279 () Bool)

(assert (=> b!49485 m!77279))

(declare-fun m!77281 () Bool)

(assert (=> b!49485 m!77281))

(declare-fun m!77283 () Bool)

(assert (=> b!49481 m!77283))

(assert (=> b!49481 m!77283))

(declare-fun m!77285 () Bool)

(assert (=> b!49481 m!77285))

(declare-fun m!77287 () Bool)

(assert (=> b!49480 m!77287))

(declare-fun m!77289 () Bool)

(assert (=> b!49480 m!77289))

(declare-fun m!77291 () Bool)

(assert (=> b!49480 m!77291))

(assert (=> b!49487 m!77281))

(assert (=> b!49487 m!76035))

(declare-fun m!77293 () Bool)

(assert (=> d!15384 m!77293))

(declare-fun m!77295 () Bool)

(assert (=> d!15384 m!77295))

(assert (=> d!15384 m!77007))

(assert (=> b!49187 d!15384))

(declare-fun d!15386 () Bool)

(declare-fun e!32674 () Bool)

(assert (=> d!15386 e!32674))

(declare-fun c!3517 () Bool)

(assert (=> d!15386 (= c!3517 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77043 () List!551)

(declare-fun e!32675 () tuple2!4626)

(assert (=> d!15386 (= lt!77043 (_1!2412 e!32675))))

(declare-fun c!3518 () Bool)

(assert (=> d!15386 (= c!3518 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15386 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15386 (= (bitStreamReadBitsIntoList!0 (_2!2401 lt!76678) (_1!2402 lt!76670) #b0000000000000000000000000000000000000000000000000000000000000001) lt!77043)))

(declare-fun lt!77042 () tuple2!4628)

(declare-fun lt!77041 () (_ BitVec 64))

(declare-fun b!49489 () Bool)

(assert (=> b!49489 (= e!32675 (tuple2!4627 (Cons!547 (_1!2413 lt!77042) (bitStreamReadBitsIntoList!0 (_2!2401 lt!76678) (_2!2413 lt!77042) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!77041))) (_2!2413 lt!77042)))))

(assert (=> b!49489 (= lt!77042 (readBit!0 (_1!2402 lt!76670)))))

(assert (=> b!49489 (= lt!77041 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!49488 () Bool)

(assert (=> b!49488 (= e!32675 (tuple2!4627 Nil!548 (_1!2402 lt!76670)))))

(declare-fun b!49490 () Bool)

(assert (=> b!49490 (= e!32674 (isEmpty!145 lt!77043))))

(declare-fun b!49491 () Bool)

(assert (=> b!49491 (= e!32674 (> (length!246 lt!77043) 0))))

(assert (= (and d!15386 c!3518) b!49488))

(assert (= (and d!15386 (not c!3518)) b!49489))

(assert (= (and d!15386 c!3517) b!49490))

(assert (= (and d!15386 (not c!3517)) b!49491))

(declare-fun m!77297 () Bool)

(assert (=> b!49489 m!77297))

(declare-fun m!77299 () Bool)

(assert (=> b!49489 m!77299))

(declare-fun m!77301 () Bool)

(assert (=> b!49490 m!77301))

(declare-fun m!77303 () Bool)

(assert (=> b!49491 m!77303))

(assert (=> b!49187 d!15386))

(declare-fun d!15388 () Bool)

(declare-fun c!3519 () Bool)

(assert (=> d!15388 (= c!3519 (= (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32676 () List!551)

(assert (=> d!15388 (= (byteArrayBitContentToList!0 (_2!2401 lt!76704) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)) e!32676)))

(declare-fun b!49492 () Bool)

(assert (=> b!49492 (= e!32676 Nil!548)))

(declare-fun b!49493 () Bool)

(assert (=> b!49493 (= e!32676 (Cons!547 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2401 lt!76704) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15388 c!3519) b!49492))

(assert (= (and d!15388 (not c!3519)) b!49493))

(declare-fun m!77305 () Bool)

(assert (=> b!49493 m!77305))

(declare-fun m!77307 () Bool)

(assert (=> b!49493 m!77307))

(declare-fun m!77309 () Bool)

(assert (=> b!49493 m!77309))

(assert (=> b!49187 d!15388))

(declare-fun d!15390 () Bool)

(declare-fun res!41472 () Bool)

(declare-fun e!32678 () Bool)

(assert (=> d!15390 (=> (not res!41472) (not e!32678))))

(assert (=> d!15390 (= res!41472 (= (size!1050 (buf!1402 (_2!2401 lt!75814))) (size!1050 (buf!1402 (_2!2401 lt!76704)))))))

(assert (=> d!15390 (= (isPrefixOf!0 (_2!2401 lt!75814) (_2!2401 lt!76704)) e!32678)))

(declare-fun b!49494 () Bool)

(declare-fun res!41473 () Bool)

(assert (=> b!49494 (=> (not res!41473) (not e!32678))))

(assert (=> b!49494 (= res!41473 (bvsle (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))) (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76704))) (currentByte!2919 (_2!2401 lt!76704)) (currentBit!2914 (_2!2401 lt!76704)))))))

(declare-fun b!49495 () Bool)

(declare-fun e!32677 () Bool)

(assert (=> b!49495 (= e!32678 e!32677)))

(declare-fun res!41471 () Bool)

(assert (=> b!49495 (=> res!41471 e!32677)))

(assert (=> b!49495 (= res!41471 (= (size!1050 (buf!1402 (_2!2401 lt!75814))) #b00000000000000000000000000000000))))

(declare-fun b!49496 () Bool)

(assert (=> b!49496 (= e!32677 (arrayBitRangesEq!0 (buf!1402 (_2!2401 lt!75814)) (buf!1402 (_2!2401 lt!76704)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814)))))))

(assert (= (and d!15390 res!41472) b!49494))

(assert (= (and b!49494 res!41473) b!49495))

(assert (= (and b!49495 (not res!41471)) b!49496))

(assert (=> b!49494 m!76035))

(assert (=> b!49494 m!76679))

(assert (=> b!49496 m!76035))

(assert (=> b!49496 m!76035))

(declare-fun m!77311 () Bool)

(assert (=> b!49496 m!77311))

(assert (=> b!49187 d!15390))

(declare-fun d!15392 () Bool)

(declare-fun c!3520 () Bool)

(assert (=> d!15392 (= c!3520 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32679 () List!551)

(assert (=> d!15392 (= (byteArrayBitContentToList!0 (_2!2401 lt!76704) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) e!32679)))

(declare-fun b!49497 () Bool)

(assert (=> b!49497 (= e!32679 Nil!548)))

(declare-fun b!49498 () Bool)

(assert (=> b!49498 (= e!32679 (Cons!547 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2401 lt!76704) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15392 c!3520) b!49497))

(assert (= (and d!15392 (not c!3520)) b!49498))

(assert (=> b!49498 m!76643))

(assert (=> b!49498 m!77007))

(assert (=> b!49498 m!76651))

(assert (=> b!49187 d!15392))

(declare-fun d!15394 () Bool)

(declare-fun e!32680 () Bool)

(assert (=> d!15394 e!32680))

(declare-fun c!3521 () Bool)

(assert (=> d!15394 (= c!3521 (= (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77046 () List!551)

(declare-fun e!32681 () tuple2!4626)

(assert (=> d!15394 (= lt!77046 (_1!2412 e!32681))))

(declare-fun c!3522 () Bool)

(assert (=> d!15394 (= c!3522 (= (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15394 (bvsge (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15394 (= (bitStreamReadBitsIntoList!0 (_2!2401 lt!76704) (_1!2402 lt!76662) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)) lt!77046)))

(declare-fun lt!77044 () (_ BitVec 64))

(declare-fun lt!77045 () tuple2!4628)

(declare-fun b!49500 () Bool)

(assert (=> b!49500 (= e!32681 (tuple2!4627 (Cons!547 (_1!2413 lt!77045) (bitStreamReadBitsIntoList!0 (_2!2401 lt!76704) (_2!2413 lt!77045) (bvsub (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!77044))) (_2!2413 lt!77045)))))

(assert (=> b!49500 (= lt!77045 (readBit!0 (_1!2402 lt!76662)))))

(assert (=> b!49500 (= lt!77044 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!49499 () Bool)

(assert (=> b!49499 (= e!32681 (tuple2!4627 Nil!548 (_1!2402 lt!76662)))))

(declare-fun b!49501 () Bool)

(assert (=> b!49501 (= e!32680 (isEmpty!145 lt!77046))))

(declare-fun b!49502 () Bool)

(assert (=> b!49502 (= e!32680 (> (length!246 lt!77046) 0))))

(assert (= (and d!15394 c!3522) b!49499))

(assert (= (and d!15394 (not c!3522)) b!49500))

(assert (= (and d!15394 c!3521) b!49501))

(assert (= (and d!15394 (not c!3521)) b!49502))

(declare-fun m!77313 () Bool)

(assert (=> b!49500 m!77313))

(declare-fun m!77315 () Bool)

(assert (=> b!49500 m!77315))

(declare-fun m!77317 () Bool)

(assert (=> b!49501 m!77317))

(declare-fun m!77319 () Bool)

(assert (=> b!49502 m!77319))

(assert (=> b!49187 d!15394))

(declare-fun d!15396 () Bool)

(assert (=> d!15396 (= (tail!237 lt!76665) (t!1301 lt!76665))))

(assert (=> b!49187 d!15396))

(declare-fun b!49503 () Bool)

(declare-fun res!41476 () Bool)

(declare-fun e!32683 () Bool)

(assert (=> b!49503 (=> (not res!41476) (not e!32683))))

(declare-fun lt!77059 () tuple2!4606)

(assert (=> b!49503 (= res!41476 (isPrefixOf!0 (_2!2402 lt!77059) (_2!2401 lt!76704)))))

(declare-fun lt!77051 () (_ BitVec 64))

(declare-fun lt!77060 () (_ BitVec 64))

(declare-fun b!49504 () Bool)

(assert (=> b!49504 (= e!32683 (= (_1!2402 lt!77059) (withMovedBitIndex!0 (_2!2402 lt!77059) (bvsub lt!77051 lt!77060))))))

(assert (=> b!49504 (or (= (bvand lt!77051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77060 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77051 lt!77060) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49504 (= lt!77060 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76704))) (currentByte!2919 (_2!2401 lt!76704)) (currentBit!2914 (_2!2401 lt!76704))))))

(assert (=> b!49504 (= lt!77051 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76678))) (currentByte!2919 (_2!2401 lt!76678)) (currentBit!2914 (_2!2401 lt!76678))))))

(declare-fun d!15398 () Bool)

(assert (=> d!15398 e!32683))

(declare-fun res!41475 () Bool)

(assert (=> d!15398 (=> (not res!41475) (not e!32683))))

(assert (=> d!15398 (= res!41475 (isPrefixOf!0 (_1!2402 lt!77059) (_2!2402 lt!77059)))))

(declare-fun lt!77050 () BitStream!1820)

(assert (=> d!15398 (= lt!77059 (tuple2!4607 lt!77050 (_2!2401 lt!76704)))))

(declare-fun lt!77064 () Unit!3418)

(declare-fun lt!77054 () Unit!3418)

(assert (=> d!15398 (= lt!77064 lt!77054)))

(assert (=> d!15398 (isPrefixOf!0 lt!77050 (_2!2401 lt!76704))))

(assert (=> d!15398 (= lt!77054 (lemmaIsPrefixTransitive!0 lt!77050 (_2!2401 lt!76704) (_2!2401 lt!76704)))))

(declare-fun lt!77056 () Unit!3418)

(declare-fun lt!77053 () Unit!3418)

(assert (=> d!15398 (= lt!77056 lt!77053)))

(assert (=> d!15398 (isPrefixOf!0 lt!77050 (_2!2401 lt!76704))))

(assert (=> d!15398 (= lt!77053 (lemmaIsPrefixTransitive!0 lt!77050 (_2!2401 lt!76678) (_2!2401 lt!76704)))))

(declare-fun lt!77061 () Unit!3418)

(declare-fun e!32682 () Unit!3418)

(assert (=> d!15398 (= lt!77061 e!32682)))

(declare-fun c!3523 () Bool)

(assert (=> d!15398 (= c!3523 (not (= (size!1050 (buf!1402 (_2!2401 lt!76678))) #b00000000000000000000000000000000)))))

(declare-fun lt!77055 () Unit!3418)

(declare-fun lt!77058 () Unit!3418)

(assert (=> d!15398 (= lt!77055 lt!77058)))

(assert (=> d!15398 (isPrefixOf!0 (_2!2401 lt!76704) (_2!2401 lt!76704))))

(assert (=> d!15398 (= lt!77058 (lemmaIsPrefixRefl!0 (_2!2401 lt!76704)))))

(declare-fun lt!77047 () Unit!3418)

(declare-fun lt!77063 () Unit!3418)

(assert (=> d!15398 (= lt!77047 lt!77063)))

(assert (=> d!15398 (= lt!77063 (lemmaIsPrefixRefl!0 (_2!2401 lt!76704)))))

(declare-fun lt!77066 () Unit!3418)

(declare-fun lt!77048 () Unit!3418)

(assert (=> d!15398 (= lt!77066 lt!77048)))

(assert (=> d!15398 (isPrefixOf!0 lt!77050 lt!77050)))

(assert (=> d!15398 (= lt!77048 (lemmaIsPrefixRefl!0 lt!77050))))

(declare-fun lt!77062 () Unit!3418)

(declare-fun lt!77057 () Unit!3418)

(assert (=> d!15398 (= lt!77062 lt!77057)))

(assert (=> d!15398 (isPrefixOf!0 (_2!2401 lt!76678) (_2!2401 lt!76678))))

(assert (=> d!15398 (= lt!77057 (lemmaIsPrefixRefl!0 (_2!2401 lt!76678)))))

(assert (=> d!15398 (= lt!77050 (BitStream!1821 (buf!1402 (_2!2401 lt!76704)) (currentByte!2919 (_2!2401 lt!76678)) (currentBit!2914 (_2!2401 lt!76678))))))

(assert (=> d!15398 (isPrefixOf!0 (_2!2401 lt!76678) (_2!2401 lt!76704))))

(assert (=> d!15398 (= (reader!0 (_2!2401 lt!76678) (_2!2401 lt!76704)) lt!77059)))

(declare-fun b!49505 () Bool)

(declare-fun lt!77049 () Unit!3418)

(assert (=> b!49505 (= e!32682 lt!77049)))

(declare-fun lt!77052 () (_ BitVec 64))

(assert (=> b!49505 (= lt!77052 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77065 () (_ BitVec 64))

(assert (=> b!49505 (= lt!77065 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76678))) (currentByte!2919 (_2!2401 lt!76678)) (currentBit!2914 (_2!2401 lt!76678))))))

(assert (=> b!49505 (= lt!77049 (arrayBitRangesEqSymmetric!0 (buf!1402 (_2!2401 lt!76678)) (buf!1402 (_2!2401 lt!76704)) lt!77052 lt!77065))))

(assert (=> b!49505 (arrayBitRangesEq!0 (buf!1402 (_2!2401 lt!76704)) (buf!1402 (_2!2401 lt!76678)) lt!77052 lt!77065)))

(declare-fun b!49506 () Bool)

(declare-fun res!41474 () Bool)

(assert (=> b!49506 (=> (not res!41474) (not e!32683))))

(assert (=> b!49506 (= res!41474 (isPrefixOf!0 (_1!2402 lt!77059) (_2!2401 lt!76678)))))

(declare-fun b!49507 () Bool)

(declare-fun Unit!3452 () Unit!3418)

(assert (=> b!49507 (= e!32682 Unit!3452)))

(assert (= (and d!15398 c!3523) b!49505))

(assert (= (and d!15398 (not c!3523)) b!49507))

(assert (= (and d!15398 res!41475) b!49506))

(assert (= (and b!49506 res!41474) b!49503))

(assert (= (and b!49503 res!41476) b!49504))

(declare-fun m!77321 () Bool)

(assert (=> b!49506 m!77321))

(assert (=> b!49505 m!76657))

(declare-fun m!77323 () Bool)

(assert (=> b!49505 m!77323))

(declare-fun m!77325 () Bool)

(assert (=> b!49505 m!77325))

(declare-fun m!77327 () Bool)

(assert (=> b!49503 m!77327))

(declare-fun m!77329 () Bool)

(assert (=> b!49504 m!77329))

(assert (=> b!49504 m!76679))

(assert (=> b!49504 m!76657))

(declare-fun m!77331 () Bool)

(assert (=> d!15398 m!77331))

(declare-fun m!77333 () Bool)

(assert (=> d!15398 m!77333))

(declare-fun m!77335 () Bool)

(assert (=> d!15398 m!77335))

(declare-fun m!77337 () Bool)

(assert (=> d!15398 m!77337))

(declare-fun m!77339 () Bool)

(assert (=> d!15398 m!77339))

(declare-fun m!77341 () Bool)

(assert (=> d!15398 m!77341))

(declare-fun m!77343 () Bool)

(assert (=> d!15398 m!77343))

(declare-fun m!77345 () Bool)

(assert (=> d!15398 m!77345))

(declare-fun m!77347 () Bool)

(assert (=> d!15398 m!77347))

(declare-fun m!77349 () Bool)

(assert (=> d!15398 m!77349))

(declare-fun m!77351 () Bool)

(assert (=> d!15398 m!77351))

(assert (=> b!49187 d!15398))

(declare-fun d!15400 () Bool)

(declare-fun e!32684 () Bool)

(assert (=> d!15400 e!32684))

(declare-fun res!41477 () Bool)

(assert (=> d!15400 (=> (not res!41477) (not e!32684))))

(declare-fun lt!77068 () (_ BitVec 64))

(assert (=> d!15400 (= res!41477 (or (= (bvand lt!76680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77068 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76680 lt!77068) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!15400 (= lt!77068 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!77067 () Unit!3418)

(assert (=> d!15400 (= lt!77067 (choose!42 (_2!2401 lt!76704) (_2!2401 lt!76704) (_1!2402 lt!76682) (_1!2402 lt!76662) lt!76680 lt!76665))))

(assert (=> d!15400 (bvsgt lt!76680 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15400 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2401 lt!76704) (_2!2401 lt!76704) (_1!2402 lt!76682) (_1!2402 lt!76662) lt!76680 lt!76665) lt!77067)))

(declare-fun b!49508 () Bool)

(assert (=> b!49508 (= e!32684 (= (bitStreamReadBitsIntoList!0 (_2!2401 lt!76704) (_1!2402 lt!76662) (bvsub lt!76680 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!237 lt!76665)))))

(assert (= (and d!15400 res!41477) b!49508))

(declare-fun m!77353 () Bool)

(assert (=> d!15400 m!77353))

(assert (=> b!49508 m!76653))

(assert (=> b!49508 m!76683))

(assert (=> b!49187 d!15400))

(assert (=> b!49187 d!15200))

(declare-fun d!15402 () Bool)

(assert (=> d!15402 (= (bitAt!0 (buf!1402 (_2!2401 lt!76678)) lt!76699) (not (= (bvand ((_ sign_extend 24) (select (arr!1576 (buf!1402 (_2!2401 lt!76678))) ((_ extract 31 0) (bvsdiv lt!76699 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!76699 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3904 () Bool)

(assert (= bs!3904 d!15402))

(declare-fun m!77355 () Bool)

(assert (=> bs!3904 m!77355))

(declare-fun m!77357 () Bool)

(assert (=> bs!3904 m!77357))

(assert (=> b!49187 d!15402))

(declare-fun d!15404 () Bool)

(declare-fun e!32685 () Bool)

(assert (=> d!15404 e!32685))

(declare-fun c!3524 () Bool)

(assert (=> d!15404 (= c!3524 (= (bvsub lt!76680 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77071 () List!551)

(declare-fun e!32686 () tuple2!4626)

(assert (=> d!15404 (= lt!77071 (_1!2412 e!32686))))

(declare-fun c!3525 () Bool)

(assert (=> d!15404 (= c!3525 (= (bvsub lt!76680 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15404 (bvsge (bvsub lt!76680 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15404 (= (bitStreamReadBitsIntoList!0 (_2!2401 lt!76704) (_1!2402 lt!76662) (bvsub lt!76680 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!77071)))

(declare-fun lt!77069 () (_ BitVec 64))

(declare-fun lt!77070 () tuple2!4628)

(declare-fun b!49510 () Bool)

(assert (=> b!49510 (= e!32686 (tuple2!4627 (Cons!547 (_1!2413 lt!77070) (bitStreamReadBitsIntoList!0 (_2!2401 lt!76704) (_2!2413 lt!77070) (bvsub (bvsub lt!76680 #b0000000000000000000000000000000000000000000000000000000000000001) lt!77069))) (_2!2413 lt!77070)))))

(assert (=> b!49510 (= lt!77070 (readBit!0 (_1!2402 lt!76662)))))

(assert (=> b!49510 (= lt!77069 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!49509 () Bool)

(assert (=> b!49509 (= e!32686 (tuple2!4627 Nil!548 (_1!2402 lt!76662)))))

(declare-fun b!49511 () Bool)

(assert (=> b!49511 (= e!32685 (isEmpty!145 lt!77071))))

(declare-fun b!49512 () Bool)

(assert (=> b!49512 (= e!32685 (> (length!246 lt!77071) 0))))

(assert (= (and d!15404 c!3525) b!49509))

(assert (= (and d!15404 (not c!3525)) b!49510))

(assert (= (and d!15404 c!3524) b!49511))

(assert (= (and d!15404 (not c!3524)) b!49512))

(declare-fun m!77359 () Bool)

(assert (=> b!49510 m!77359))

(assert (=> b!49510 m!77315))

(declare-fun m!77361 () Bool)

(assert (=> b!49511 m!77361))

(declare-fun m!77363 () Bool)

(assert (=> b!49512 m!77363))

(assert (=> b!49187 d!15404))

(declare-fun d!15406 () Bool)

(assert (=> d!15406 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76704)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))) lt!76687) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76704)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814)))) lt!76687))))

(declare-fun bs!3905 () Bool)

(assert (= bs!3905 d!15406))

(declare-fun m!77365 () Bool)

(assert (=> bs!3905 m!77365))

(assert (=> b!49187 d!15406))

(declare-fun d!15408 () Bool)

(assert (=> d!15408 (= (bitAt!0 (buf!1402 (_2!2401 lt!76704)) lt!76699) (not (= (bvand ((_ sign_extend 24) (select (arr!1576 (buf!1402 (_2!2401 lt!76704))) ((_ extract 31 0) (bvsdiv lt!76699 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!76699 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3906 () Bool)

(assert (= bs!3906 d!15408))

(declare-fun m!77367 () Bool)

(assert (=> bs!3906 m!77367))

(assert (=> bs!3906 m!77357))

(assert (=> b!49187 d!15408))

(declare-fun d!15410 () Bool)

(declare-fun e!32687 () Bool)

(assert (=> d!15410 e!32687))

(declare-fun c!3526 () Bool)

(assert (=> d!15410 (= c!3526 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77074 () List!551)

(declare-fun e!32688 () tuple2!4626)

(assert (=> d!15410 (= lt!77074 (_1!2412 e!32688))))

(declare-fun c!3527 () Bool)

(assert (=> d!15410 (= c!3527 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15410 (bvsge (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15410 (= (bitStreamReadBitsIntoList!0 (_2!2401 lt!76704) (_1!2402 lt!76682) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) lt!77074)))

(declare-fun b!49514 () Bool)

(declare-fun lt!77073 () tuple2!4628)

(declare-fun lt!77072 () (_ BitVec 64))

(assert (=> b!49514 (= e!32688 (tuple2!4627 (Cons!547 (_1!2413 lt!77073) (bitStreamReadBitsIntoList!0 (_2!2401 lt!76704) (_2!2413 lt!77073) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!77072))) (_2!2413 lt!77073)))))

(assert (=> b!49514 (= lt!77073 (readBit!0 (_1!2402 lt!76682)))))

(assert (=> b!49514 (= lt!77072 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!49513 () Bool)

(assert (=> b!49513 (= e!32688 (tuple2!4627 Nil!548 (_1!2402 lt!76682)))))

(declare-fun b!49515 () Bool)

(assert (=> b!49515 (= e!32687 (isEmpty!145 lt!77074))))

(declare-fun b!49516 () Bool)

(assert (=> b!49516 (= e!32687 (> (length!246 lt!77074) 0))))

(assert (= (and d!15410 c!3527) b!49513))

(assert (= (and d!15410 (not c!3527)) b!49514))

(assert (= (and d!15410 c!3526) b!49515))

(assert (= (and d!15410 (not c!3526)) b!49516))

(declare-fun m!77369 () Bool)

(assert (=> b!49514 m!77369))

(declare-fun m!77371 () Bool)

(assert (=> b!49514 m!77371))

(declare-fun m!77373 () Bool)

(assert (=> b!49515 m!77373))

(declare-fun m!77375 () Bool)

(assert (=> b!49516 m!77375))

(assert (=> b!49187 d!15410))

(declare-fun d!15412 () Bool)

(declare-fun c!3528 () Bool)

(assert (=> d!15412 (= c!3528 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32689 () List!551)

(assert (=> d!15412 (= (byteArrayBitContentToList!0 (_2!2401 lt!76678) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) e!32689)))

(declare-fun b!49517 () Bool)

(assert (=> b!49517 (= e!32689 Nil!548)))

(declare-fun b!49518 () Bool)

(assert (=> b!49518 (= e!32689 (Cons!547 (not (= (bvand ((_ sign_extend 24) (select (arr!1576 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2401 lt!76678) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15412 c!3528) b!49517))

(assert (= (and d!15412 (not c!3528)) b!49518))

(assert (=> b!49518 m!76643))

(assert (=> b!49518 m!77007))

(declare-fun m!77377 () Bool)

(assert (=> b!49518 m!77377))

(assert (=> b!49187 d!15412))

(declare-fun d!15414 () Bool)

(assert (=> d!15414 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76678)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))) lt!76695) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76678)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814)))) lt!76695))))

(declare-fun bs!3907 () Bool)

(assert (= bs!3907 d!15414))

(declare-fun m!77379 () Bool)

(assert (=> bs!3907 m!77379))

(assert (=> b!49187 d!15414))

(declare-fun d!15416 () Bool)

(assert (=> d!15416 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76678)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))) lt!76695)))

(declare-fun lt!77075 () Unit!3418)

(assert (=> d!15416 (= lt!77075 (choose!9 (_2!2401 lt!75814) (buf!1402 (_2!2401 lt!76678)) lt!76695 (BitStream!1821 (buf!1402 (_2!2401 lt!76678)) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814)))))))

(assert (=> d!15416 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2401 lt!75814) (buf!1402 (_2!2401 lt!76678)) lt!76695) lt!77075)))

(declare-fun bs!3908 () Bool)

(assert (= bs!3908 d!15416))

(assert (=> bs!3908 m!76663))

(declare-fun m!77381 () Bool)

(assert (=> bs!3908 m!77381))

(assert (=> b!49187 d!15416))

(declare-fun d!15418 () Bool)

(declare-fun e!32690 () Bool)

(assert (=> d!15418 e!32690))

(declare-fun res!41478 () Bool)

(assert (=> d!15418 (=> (not res!41478) (not e!32690))))

(assert (=> d!15418 (= res!41478 (or (= (bvand lt!76690 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76697 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76690 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76690 lt!76697) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!77076 () Unit!3418)

(assert (=> d!15418 (= lt!77076 (choose!27 (_2!2401 lt!75814) (_2!2401 lt!76678) lt!76690 lt!76697))))

(assert (=> d!15418 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!76697) (bvsle lt!76697 lt!76690))))

(assert (=> d!15418 (= (validateOffsetBitsIneqLemma!0 (_2!2401 lt!75814) (_2!2401 lt!76678) lt!76690 lt!76697) lt!77076)))

(declare-fun b!49519 () Bool)

(assert (=> b!49519 (= e!32690 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76678)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76678))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76678))) (bvsub lt!76690 lt!76697)))))

(assert (= (and d!15418 res!41478) b!49519))

(declare-fun m!77383 () Bool)

(assert (=> d!15418 m!77383))

(assert (=> b!49519 m!76667))

(assert (=> b!49187 d!15418))

(declare-fun d!15420 () Bool)

(assert (=> d!15420 (= (head!370 (byteArrayBitContentToList!0 (_2!2401 lt!76678) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!666 (byteArrayBitContentToList!0 (_2!2401 lt!76678) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!49187 d!15420))

(declare-fun d!15422 () Bool)

(assert (=> d!15422 (isPrefixOf!0 (_2!2401 lt!75814) (_2!2401 lt!76704))))

(declare-fun lt!77077 () Unit!3418)

(assert (=> d!15422 (= lt!77077 (choose!30 (_2!2401 lt!75814) (_2!2401 lt!76678) (_2!2401 lt!76704)))))

(assert (=> d!15422 (isPrefixOf!0 (_2!2401 lt!75814) (_2!2401 lt!76678))))

(assert (=> d!15422 (= (lemmaIsPrefixTransitive!0 (_2!2401 lt!75814) (_2!2401 lt!76678) (_2!2401 lt!76704)) lt!77077)))

(declare-fun bs!3909 () Bool)

(assert (= bs!3909 d!15422))

(assert (=> bs!3909 m!76639))

(declare-fun m!77385 () Bool)

(assert (=> bs!3909 m!77385))

(declare-fun m!77387 () Bool)

(assert (=> bs!3909 m!77387))

(assert (=> b!49187 d!15422))

(declare-fun d!15424 () Bool)

(assert (=> d!15424 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76678)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76678))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76678))) (bvsub lt!76690 lt!76697)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76678)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76678))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76678)))) (bvsub lt!76690 lt!76697)))))

(declare-fun bs!3910 () Bool)

(assert (= bs!3910 d!15424))

(declare-fun m!77389 () Bool)

(assert (=> bs!3910 m!77389))

(assert (=> b!49187 d!15424))

(declare-fun b!49520 () Bool)

(declare-fun res!41481 () Bool)

(declare-fun e!32692 () Bool)

(assert (=> b!49520 (=> (not res!41481) (not e!32692))))

(declare-fun lt!77090 () tuple2!4606)

(assert (=> b!49520 (= res!41481 (isPrefixOf!0 (_2!2402 lt!77090) (_2!2401 lt!76704)))))

(declare-fun lt!77091 () (_ BitVec 64))

(declare-fun lt!77082 () (_ BitVec 64))

(declare-fun b!49521 () Bool)

(assert (=> b!49521 (= e!32692 (= (_1!2402 lt!77090) (withMovedBitIndex!0 (_2!2402 lt!77090) (bvsub lt!77082 lt!77091))))))

(assert (=> b!49521 (or (= (bvand lt!77082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77091 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77082 lt!77091) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49521 (= lt!77091 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76704))) (currentByte!2919 (_2!2401 lt!76704)) (currentBit!2914 (_2!2401 lt!76704))))))

(assert (=> b!49521 (= lt!77082 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))))))

(declare-fun d!15426 () Bool)

(assert (=> d!15426 e!32692))

(declare-fun res!41480 () Bool)

(assert (=> d!15426 (=> (not res!41480) (not e!32692))))

(assert (=> d!15426 (= res!41480 (isPrefixOf!0 (_1!2402 lt!77090) (_2!2402 lt!77090)))))

(declare-fun lt!77081 () BitStream!1820)

(assert (=> d!15426 (= lt!77090 (tuple2!4607 lt!77081 (_2!2401 lt!76704)))))

(declare-fun lt!77095 () Unit!3418)

(declare-fun lt!77085 () Unit!3418)

(assert (=> d!15426 (= lt!77095 lt!77085)))

(assert (=> d!15426 (isPrefixOf!0 lt!77081 (_2!2401 lt!76704))))

(assert (=> d!15426 (= lt!77085 (lemmaIsPrefixTransitive!0 lt!77081 (_2!2401 lt!76704) (_2!2401 lt!76704)))))

(declare-fun lt!77087 () Unit!3418)

(declare-fun lt!77084 () Unit!3418)

(assert (=> d!15426 (= lt!77087 lt!77084)))

(assert (=> d!15426 (isPrefixOf!0 lt!77081 (_2!2401 lt!76704))))

(assert (=> d!15426 (= lt!77084 (lemmaIsPrefixTransitive!0 lt!77081 (_2!2401 lt!75814) (_2!2401 lt!76704)))))

(declare-fun lt!77092 () Unit!3418)

(declare-fun e!32691 () Unit!3418)

(assert (=> d!15426 (= lt!77092 e!32691)))

(declare-fun c!3529 () Bool)

(assert (=> d!15426 (= c!3529 (not (= (size!1050 (buf!1402 (_2!2401 lt!75814))) #b00000000000000000000000000000000)))))

(declare-fun lt!77086 () Unit!3418)

(declare-fun lt!77089 () Unit!3418)

(assert (=> d!15426 (= lt!77086 lt!77089)))

(assert (=> d!15426 (isPrefixOf!0 (_2!2401 lt!76704) (_2!2401 lt!76704))))

(assert (=> d!15426 (= lt!77089 (lemmaIsPrefixRefl!0 (_2!2401 lt!76704)))))

(declare-fun lt!77078 () Unit!3418)

(declare-fun lt!77094 () Unit!3418)

(assert (=> d!15426 (= lt!77078 lt!77094)))

(assert (=> d!15426 (= lt!77094 (lemmaIsPrefixRefl!0 (_2!2401 lt!76704)))))

(declare-fun lt!77097 () Unit!3418)

(declare-fun lt!77079 () Unit!3418)

(assert (=> d!15426 (= lt!77097 lt!77079)))

(assert (=> d!15426 (isPrefixOf!0 lt!77081 lt!77081)))

(assert (=> d!15426 (= lt!77079 (lemmaIsPrefixRefl!0 lt!77081))))

(declare-fun lt!77093 () Unit!3418)

(declare-fun lt!77088 () Unit!3418)

(assert (=> d!15426 (= lt!77093 lt!77088)))

(assert (=> d!15426 (isPrefixOf!0 (_2!2401 lt!75814) (_2!2401 lt!75814))))

(assert (=> d!15426 (= lt!77088 (lemmaIsPrefixRefl!0 (_2!2401 lt!75814)))))

(assert (=> d!15426 (= lt!77081 (BitStream!1821 (buf!1402 (_2!2401 lt!76704)) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))))))

(assert (=> d!15426 (isPrefixOf!0 (_2!2401 lt!75814) (_2!2401 lt!76704))))

(assert (=> d!15426 (= (reader!0 (_2!2401 lt!75814) (_2!2401 lt!76704)) lt!77090)))

(declare-fun b!49522 () Bool)

(declare-fun lt!77080 () Unit!3418)

(assert (=> b!49522 (= e!32691 lt!77080)))

(declare-fun lt!77083 () (_ BitVec 64))

(assert (=> b!49522 (= lt!77083 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77096 () (_ BitVec 64))

(assert (=> b!49522 (= lt!77096 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814))))))

(assert (=> b!49522 (= lt!77080 (arrayBitRangesEqSymmetric!0 (buf!1402 (_2!2401 lt!75814)) (buf!1402 (_2!2401 lt!76704)) lt!77083 lt!77096))))

(assert (=> b!49522 (arrayBitRangesEq!0 (buf!1402 (_2!2401 lt!76704)) (buf!1402 (_2!2401 lt!75814)) lt!77083 lt!77096)))

(declare-fun b!49523 () Bool)

(declare-fun res!41479 () Bool)

(assert (=> b!49523 (=> (not res!41479) (not e!32692))))

(assert (=> b!49523 (= res!41479 (isPrefixOf!0 (_1!2402 lt!77090) (_2!2401 lt!75814)))))

(declare-fun b!49524 () Bool)

(declare-fun Unit!3453 () Unit!3418)

(assert (=> b!49524 (= e!32691 Unit!3453)))

(assert (= (and d!15426 c!3529) b!49522))

(assert (= (and d!15426 (not c!3529)) b!49524))

(assert (= (and d!15426 res!41480) b!49523))

(assert (= (and b!49523 res!41479) b!49520))

(assert (= (and b!49520 res!41481) b!49521))

(declare-fun m!77391 () Bool)

(assert (=> b!49523 m!77391))

(assert (=> b!49522 m!76035))

(declare-fun m!77393 () Bool)

(assert (=> b!49522 m!77393))

(declare-fun m!77395 () Bool)

(assert (=> b!49522 m!77395))

(declare-fun m!77397 () Bool)

(assert (=> b!49520 m!77397))

(declare-fun m!77399 () Bool)

(assert (=> b!49521 m!77399))

(assert (=> b!49521 m!76679))

(assert (=> b!49521 m!76035))

(declare-fun m!77401 () Bool)

(assert (=> d!15426 m!77401))

(assert (=> d!15426 m!76639))

(declare-fun m!77403 () Bool)

(assert (=> d!15426 m!77403))

(declare-fun m!77405 () Bool)

(assert (=> d!15426 m!77405))

(assert (=> d!15426 m!76513))

(assert (=> d!15426 m!77341))

(declare-fun m!77407 () Bool)

(assert (=> d!15426 m!77407))

(assert (=> d!15426 m!77345))

(declare-fun m!77409 () Bool)

(assert (=> d!15426 m!77409))

(declare-fun m!77411 () Bool)

(assert (=> d!15426 m!77411))

(assert (=> d!15426 m!76517))

(assert (=> b!49187 d!15426))

(declare-fun d!15428 () Bool)

(declare-fun e!32695 () Bool)

(assert (=> d!15428 e!32695))

(declare-fun res!41487 () Bool)

(assert (=> d!15428 (=> (not res!41487) (not e!32695))))

(declare-fun lt!77105 () tuple2!4604)

(declare-fun lt!77130 () (_ BitVec 64))

(assert (=> d!15428 (= res!41487 (= (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!77105))) (currentByte!2919 (_2!2401 lt!77105)) (currentBit!2914 (_2!2401 lt!77105))) (bvsub lt!77130 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!15428 (or (= (bvand lt!77130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77130 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!77113 () (_ BitVec 64))

(assert (=> d!15428 (= lt!77130 (bvadd lt!77113 to!314))))

(assert (=> d!15428 (or (not (= (bvand lt!77113 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77113 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77113 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15428 (= lt!77113 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76678))) (currentByte!2919 (_2!2401 lt!76678)) (currentBit!2914 (_2!2401 lt!76678))))))

(declare-fun e!32694 () tuple2!4604)

(assert (=> d!15428 (= lt!77105 e!32694)))

(declare-fun c!3530 () Bool)

(assert (=> d!15428 (= c!3530 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!77102 () Unit!3418)

(declare-fun lt!77115 () Unit!3418)

(assert (=> d!15428 (= lt!77102 lt!77115)))

(assert (=> d!15428 (isPrefixOf!0 (_2!2401 lt!76678) (_2!2401 lt!76678))))

(assert (=> d!15428 (= lt!77115 (lemmaIsPrefixRefl!0 (_2!2401 lt!76678)))))

(declare-fun lt!77135 () (_ BitVec 64))

(assert (=> d!15428 (= lt!77135 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76678))) (currentByte!2919 (_2!2401 lt!76678)) (currentBit!2914 (_2!2401 lt!76678))))))

(assert (=> d!15428 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15428 (= (appendBitsMSBFirstLoop!0 (_2!2401 lt!76678) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314) lt!77105)))

(declare-fun b!49525 () Bool)

(declare-fun res!41482 () Bool)

(assert (=> b!49525 (=> (not res!41482) (not e!32695))))

(assert (=> b!49525 (= res!41482 (invariant!0 (currentBit!2914 (_2!2401 lt!77105)) (currentByte!2919 (_2!2401 lt!77105)) (size!1050 (buf!1402 (_2!2401 lt!77105)))))))

(declare-fun lt!77108 () tuple2!4606)

(declare-fun b!49526 () Bool)

(assert (=> b!49526 (= e!32695 (= (bitStreamReadBitsIntoList!0 (_2!2401 lt!77105) (_1!2402 lt!77108) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))) (byteArrayBitContentToList!0 (_2!2401 lt!77105) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!49526 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49526 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!77136 () Unit!3418)

(declare-fun lt!77128 () Unit!3418)

(assert (=> b!49526 (= lt!77136 lt!77128)))

(declare-fun lt!77132 () (_ BitVec 64))

(assert (=> b!49526 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!77105)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76678))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76678))) lt!77132)))

(assert (=> b!49526 (= lt!77128 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2401 lt!76678) (buf!1402 (_2!2401 lt!77105)) lt!77132))))

(declare-fun e!32693 () Bool)

(assert (=> b!49526 e!32693))

(declare-fun res!41486 () Bool)

(assert (=> b!49526 (=> (not res!41486) (not e!32693))))

(assert (=> b!49526 (= res!41486 (and (= (size!1050 (buf!1402 (_2!2401 lt!76678))) (size!1050 (buf!1402 (_2!2401 lt!77105)))) (bvsge lt!77132 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49526 (= lt!77132 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!49526 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49526 (= lt!77108 (reader!0 (_2!2401 lt!76678) (_2!2401 lt!77105)))))

(declare-fun b!49527 () Bool)

(declare-fun res!41483 () Bool)

(assert (=> b!49527 (=> (not res!41483) (not e!32695))))

(assert (=> b!49527 (= res!41483 (= (size!1050 (buf!1402 (_2!2401 lt!76678))) (size!1050 (buf!1402 (_2!2401 lt!77105)))))))

(declare-fun b!49528 () Bool)

(declare-fun res!41485 () Bool)

(assert (=> b!49528 (=> (not res!41485) (not e!32695))))

(assert (=> b!49528 (= res!41485 (isPrefixOf!0 (_2!2401 lt!76678) (_2!2401 lt!77105)))))

(declare-fun b!49529 () Bool)

(declare-fun Unit!3454 () Unit!3418)

(assert (=> b!49529 (= e!32694 (tuple2!4605 Unit!3454 (_2!2401 lt!76678)))))

(assert (=> b!49529 (= (size!1050 (buf!1402 (_2!2401 lt!76678))) (size!1050 (buf!1402 (_2!2401 lt!76678))))))

(declare-fun lt!77127 () Unit!3418)

(declare-fun Unit!3455 () Unit!3418)

(assert (=> b!49529 (= lt!77127 Unit!3455)))

(declare-fun call!629 () tuple2!4606)

(assert (=> b!49529 (checkByteArrayBitContent!0 (_2!2401 lt!76678) srcBuffer!2 (_1!2411 (readBits!0 (_1!2402 call!629) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!49530 () Bool)

(assert (=> b!49530 (= e!32693 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76678)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76678))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76678))) lt!77132))))

(declare-fun b!49531 () Bool)

(declare-fun lt!77140 () tuple2!4604)

(declare-fun Unit!3456 () Unit!3418)

(assert (=> b!49531 (= e!32694 (tuple2!4605 Unit!3456 (_2!2401 lt!77140)))))

(declare-fun lt!77114 () tuple2!4604)

(assert (=> b!49531 (= lt!77114 (appendBitFromByte!0 (_2!2401 lt!76678) (select (arr!1576 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!77126 () (_ BitVec 64))

(assert (=> b!49531 (= lt!77126 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77133 () (_ BitVec 64))

(assert (=> b!49531 (= lt!77133 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!77139 () Unit!3418)

(assert (=> b!49531 (= lt!77139 (validateOffsetBitsIneqLemma!0 (_2!2401 lt!76678) (_2!2401 lt!77114) lt!77126 lt!77133))))

(assert (=> b!49531 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!77114)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!77114))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!77114))) (bvsub lt!77126 lt!77133))))

(declare-fun lt!77141 () Unit!3418)

(assert (=> b!49531 (= lt!77141 lt!77139)))

(declare-fun lt!77106 () tuple2!4606)

(assert (=> b!49531 (= lt!77106 call!629)))

(declare-fun lt!77131 () (_ BitVec 64))

(assert (=> b!49531 (= lt!77131 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!77103 () Unit!3418)

(assert (=> b!49531 (= lt!77103 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2401 lt!76678) (buf!1402 (_2!2401 lt!77114)) lt!77131))))

(assert (=> b!49531 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!77114)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76678))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76678))) lt!77131)))

(declare-fun lt!77120 () Unit!3418)

(assert (=> b!49531 (= lt!77120 lt!77103)))

(assert (=> b!49531 (= (head!370 (byteArrayBitContentToList!0 (_2!2401 lt!77114) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!370 (bitStreamReadBitsIntoList!0 (_2!2401 lt!77114) (_1!2402 lt!77106) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77129 () Unit!3418)

(declare-fun Unit!3457 () Unit!3418)

(assert (=> b!49531 (= lt!77129 Unit!3457)))

(assert (=> b!49531 (= lt!77140 (appendBitsMSBFirstLoop!0 (_2!2401 lt!77114) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!77104 () Unit!3418)

(assert (=> b!49531 (= lt!77104 (lemmaIsPrefixTransitive!0 (_2!2401 lt!76678) (_2!2401 lt!77114) (_2!2401 lt!77140)))))

(assert (=> b!49531 (isPrefixOf!0 (_2!2401 lt!76678) (_2!2401 lt!77140))))

(declare-fun lt!77107 () Unit!3418)

(assert (=> b!49531 (= lt!77107 lt!77104)))

(assert (=> b!49531 (= (size!1050 (buf!1402 (_2!2401 lt!77140))) (size!1050 (buf!1402 (_2!2401 lt!76678))))))

(declare-fun lt!77124 () Unit!3418)

(declare-fun Unit!3458 () Unit!3418)

(assert (=> b!49531 (= lt!77124 Unit!3458)))

(assert (=> b!49531 (= (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!77140))) (currentByte!2919 (_2!2401 lt!77140)) (currentBit!2914 (_2!2401 lt!77140))) (bvsub (bvadd (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76678))) (currentByte!2919 (_2!2401 lt!76678)) (currentBit!2914 (_2!2401 lt!76678))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77137 () Unit!3418)

(declare-fun Unit!3459 () Unit!3418)

(assert (=> b!49531 (= lt!77137 Unit!3459)))

(assert (=> b!49531 (= (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!77140))) (currentByte!2919 (_2!2401 lt!77140)) (currentBit!2914 (_2!2401 lt!77140))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!77114))) (currentByte!2919 (_2!2401 lt!77114)) (currentBit!2914 (_2!2401 lt!77114))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!77111 () Unit!3418)

(declare-fun Unit!3460 () Unit!3418)

(assert (=> b!49531 (= lt!77111 Unit!3460)))

(declare-fun lt!77118 () tuple2!4606)

(assert (=> b!49531 (= lt!77118 (reader!0 (_2!2401 lt!76678) (_2!2401 lt!77140)))))

(declare-fun lt!77123 () (_ BitVec 64))

(assert (=> b!49531 (= lt!77123 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77110 () Unit!3418)

(assert (=> b!49531 (= lt!77110 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2401 lt!76678) (buf!1402 (_2!2401 lt!77140)) lt!77123))))

(assert (=> b!49531 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!77140)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76678))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76678))) lt!77123)))

(declare-fun lt!77121 () Unit!3418)

(assert (=> b!49531 (= lt!77121 lt!77110)))

(declare-fun lt!77098 () tuple2!4606)

(assert (=> b!49531 (= lt!77098 (reader!0 (_2!2401 lt!77114) (_2!2401 lt!77140)))))

(declare-fun lt!77125 () (_ BitVec 64))

(assert (=> b!49531 (= lt!77125 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!77099 () Unit!3418)

(assert (=> b!49531 (= lt!77099 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2401 lt!77114) (buf!1402 (_2!2401 lt!77140)) lt!77125))))

(assert (=> b!49531 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!77140)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!77114))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!77114))) lt!77125)))

(declare-fun lt!77100 () Unit!3418)

(assert (=> b!49531 (= lt!77100 lt!77099)))

(declare-fun lt!77138 () List!551)

(assert (=> b!49531 (= lt!77138 (byteArrayBitContentToList!0 (_2!2401 lt!77140) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!77109 () List!551)

(assert (=> b!49531 (= lt!77109 (byteArrayBitContentToList!0 (_2!2401 lt!77140) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77101 () List!551)

(assert (=> b!49531 (= lt!77101 (bitStreamReadBitsIntoList!0 (_2!2401 lt!77140) (_1!2402 lt!77118) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!77112 () List!551)

(assert (=> b!49531 (= lt!77112 (bitStreamReadBitsIntoList!0 (_2!2401 lt!77140) (_1!2402 lt!77098) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77116 () (_ BitVec 64))

(assert (=> b!49531 (= lt!77116 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77117 () Unit!3418)

(assert (=> b!49531 (= lt!77117 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2401 lt!77140) (_2!2401 lt!77140) (_1!2402 lt!77118) (_1!2402 lt!77098) lt!77116 lt!77101))))

(assert (=> b!49531 (= (bitStreamReadBitsIntoList!0 (_2!2401 lt!77140) (_1!2402 lt!77098) (bvsub lt!77116 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!237 lt!77101))))

(declare-fun lt!77119 () Unit!3418)

(assert (=> b!49531 (= lt!77119 lt!77117)))

(declare-fun lt!77134 () Unit!3418)

(assert (=> b!49531 (= lt!77134 (arrayBitRangesEqImpliesEq!0 (buf!1402 (_2!2401 lt!77114)) (buf!1402 (_2!2401 lt!77140)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!77135 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!77114))) (currentByte!2919 (_2!2401 lt!77114)) (currentBit!2914 (_2!2401 lt!77114)))))))

(assert (=> b!49531 (= (bitAt!0 (buf!1402 (_2!2401 lt!77114)) lt!77135) (bitAt!0 (buf!1402 (_2!2401 lt!77140)) lt!77135))))

(declare-fun lt!77122 () Unit!3418)

(assert (=> b!49531 (= lt!77122 lt!77134)))

(declare-fun bm!626 () Bool)

(assert (=> bm!626 (= call!629 (reader!0 (_2!2401 lt!76678) (ite c!3530 (_2!2401 lt!77114) (_2!2401 lt!76678))))))

(declare-fun b!49532 () Bool)

(declare-fun res!41484 () Bool)

(assert (=> b!49532 (=> (not res!41484) (not e!32695))))

(assert (=> b!49532 (= res!41484 (= (size!1050 (buf!1402 (_2!2401 lt!77105))) (size!1050 (buf!1402 (_2!2401 lt!76678)))))))

(assert (= (and d!15428 c!3530) b!49531))

(assert (= (and d!15428 (not c!3530)) b!49529))

(assert (= (or b!49531 b!49529) bm!626))

(assert (= (and d!15428 res!41487) b!49525))

(assert (= (and b!49525 res!41482) b!49527))

(assert (= (and b!49527 res!41483) b!49528))

(assert (= (and b!49528 res!41485) b!49532))

(assert (= (and b!49532 res!41484) b!49526))

(assert (= (and b!49526 res!41486) b!49530))

(declare-fun m!77413 () Bool)

(assert (=> d!15428 m!77413))

(assert (=> d!15428 m!76657))

(assert (=> d!15428 m!77351))

(assert (=> d!15428 m!77339))

(declare-fun m!77415 () Bool)

(assert (=> b!49531 m!77415))

(declare-fun m!77417 () Bool)

(assert (=> b!49531 m!77417))

(declare-fun m!77419 () Bool)

(assert (=> b!49531 m!77419))

(declare-fun m!77421 () Bool)

(assert (=> b!49531 m!77421))

(assert (=> b!49531 m!77305))

(declare-fun m!77423 () Bool)

(assert (=> b!49531 m!77423))

(declare-fun m!77425 () Bool)

(assert (=> b!49531 m!77425))

(declare-fun m!77427 () Bool)

(assert (=> b!49531 m!77427))

(declare-fun m!77429 () Bool)

(assert (=> b!49531 m!77429))

(declare-fun m!77431 () Bool)

(assert (=> b!49531 m!77431))

(declare-fun m!77433 () Bool)

(assert (=> b!49531 m!77433))

(declare-fun m!77435 () Bool)

(assert (=> b!49531 m!77435))

(declare-fun m!77437 () Bool)

(assert (=> b!49531 m!77437))

(declare-fun m!77439 () Bool)

(assert (=> b!49531 m!77439))

(declare-fun m!77441 () Bool)

(assert (=> b!49531 m!77441))

(declare-fun m!77443 () Bool)

(assert (=> b!49531 m!77443))

(declare-fun m!77445 () Bool)

(assert (=> b!49531 m!77445))

(declare-fun m!77447 () Bool)

(assert (=> b!49531 m!77447))

(declare-fun m!77449 () Bool)

(assert (=> b!49531 m!77449))

(declare-fun m!77451 () Bool)

(assert (=> b!49531 m!77451))

(declare-fun m!77453 () Bool)

(assert (=> b!49531 m!77453))

(assert (=> b!49531 m!77433))

(declare-fun m!77455 () Bool)

(assert (=> b!49531 m!77455))

(declare-fun m!77457 () Bool)

(assert (=> b!49531 m!77457))

(declare-fun m!77459 () Bool)

(assert (=> b!49531 m!77459))

(declare-fun m!77461 () Bool)

(assert (=> b!49531 m!77461))

(assert (=> b!49531 m!77305))

(declare-fun m!77463 () Bool)

(assert (=> b!49531 m!77463))

(assert (=> b!49531 m!76657))

(declare-fun m!77465 () Bool)

(assert (=> b!49531 m!77465))

(declare-fun m!77467 () Bool)

(assert (=> b!49531 m!77467))

(declare-fun m!77469 () Bool)

(assert (=> b!49531 m!77469))

(declare-fun m!77471 () Bool)

(assert (=> b!49531 m!77471))

(assert (=> b!49531 m!77435))

(declare-fun m!77473 () Bool)

(assert (=> b!49531 m!77473))

(assert (=> b!49531 m!77465))

(declare-fun m!77475 () Bool)

(assert (=> bm!626 m!77475))

(declare-fun m!77477 () Bool)

(assert (=> b!49526 m!77477))

(declare-fun m!77479 () Bool)

(assert (=> b!49526 m!77479))

(declare-fun m!77481 () Bool)

(assert (=> b!49526 m!77481))

(declare-fun m!77483 () Bool)

(assert (=> b!49526 m!77483))

(declare-fun m!77485 () Bool)

(assert (=> b!49526 m!77485))

(declare-fun m!77487 () Bool)

(assert (=> b!49528 m!77487))

(declare-fun m!77489 () Bool)

(assert (=> b!49529 m!77489))

(declare-fun m!77491 () Bool)

(assert (=> b!49529 m!77491))

(declare-fun m!77493 () Bool)

(assert (=> b!49530 m!77493))

(declare-fun m!77495 () Bool)

(assert (=> b!49525 m!77495))

(assert (=> b!49187 d!15428))

(declare-fun d!15430 () Bool)

(assert (=> d!15430 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76704)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76678))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76678))) lt!76689) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76704)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76678))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76678)))) lt!76689))))

(declare-fun bs!3911 () Bool)

(assert (= bs!3911 d!15430))

(declare-fun m!77497 () Bool)

(assert (=> bs!3911 m!77497))

(assert (=> b!49187 d!15430))

(declare-fun d!15432 () Bool)

(declare-fun e!32696 () Bool)

(assert (=> d!15432 e!32696))

(declare-fun res!41488 () Bool)

(assert (=> d!15432 (=> (not res!41488) (not e!32696))))

(declare-fun lt!77147 () (_ BitVec 64))

(declare-fun lt!77145 () (_ BitVec 64))

(declare-fun lt!77143 () (_ BitVec 64))

(assert (=> d!15432 (= res!41488 (= lt!77147 (bvsub lt!77145 lt!77143)))))

(assert (=> d!15432 (or (= (bvand lt!77145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77143 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77145 lt!77143) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15432 (= lt!77143 (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76704)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76704))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76704)))))))

(declare-fun lt!77146 () (_ BitVec 64))

(declare-fun lt!77144 () (_ BitVec 64))

(assert (=> d!15432 (= lt!77145 (bvmul lt!77146 lt!77144))))

(assert (=> d!15432 (or (= lt!77146 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!77144 (bvsdiv (bvmul lt!77146 lt!77144) lt!77146)))))

(assert (=> d!15432 (= lt!77144 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15432 (= lt!77146 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76704)))))))

(assert (=> d!15432 (= lt!77147 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76704))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76704)))))))

(assert (=> d!15432 (invariant!0 (currentBit!2914 (_2!2401 lt!76704)) (currentByte!2919 (_2!2401 lt!76704)) (size!1050 (buf!1402 (_2!2401 lt!76704))))))

(assert (=> d!15432 (= (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76704))) (currentByte!2919 (_2!2401 lt!76704)) (currentBit!2914 (_2!2401 lt!76704))) lt!77147)))

(declare-fun b!49533 () Bool)

(declare-fun res!41489 () Bool)

(assert (=> b!49533 (=> (not res!41489) (not e!32696))))

(assert (=> b!49533 (= res!41489 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!77147))))

(declare-fun b!49534 () Bool)

(declare-fun lt!77142 () (_ BitVec 64))

(assert (=> b!49534 (= e!32696 (bvsle lt!77147 (bvmul lt!77142 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49534 (or (= lt!77142 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!77142 #b0000000000000000000000000000000000000000000000000000000000001000) lt!77142)))))

(assert (=> b!49534 (= lt!77142 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76704)))))))

(assert (= (and d!15432 res!41488) b!49533))

(assert (= (and b!49533 res!41489) b!49534))

(declare-fun m!77499 () Bool)

(assert (=> d!15432 m!77499))

(declare-fun m!77501 () Bool)

(assert (=> d!15432 m!77501))

(assert (=> b!49187 d!15432))

(declare-fun d!15434 () Bool)

(assert (=> d!15434 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76704)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))) lt!76687)))

(declare-fun lt!77148 () Unit!3418)

(assert (=> d!15434 (= lt!77148 (choose!9 (_2!2401 lt!75814) (buf!1402 (_2!2401 lt!76704)) lt!76687 (BitStream!1821 (buf!1402 (_2!2401 lt!76704)) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814)))))))

(assert (=> d!15434 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2401 lt!75814) (buf!1402 (_2!2401 lt!76704)) lt!76687) lt!77148)))

(declare-fun bs!3912 () Bool)

(assert (= bs!3912 d!15434))

(assert (=> bs!3912 m!76675))

(declare-fun m!77503 () Bool)

(assert (=> bs!3912 m!77503))

(assert (=> b!49187 d!15434))

(declare-fun d!15436 () Bool)

(assert (=> d!15436 (= (head!370 (bitStreamReadBitsIntoList!0 (_2!2401 lt!76678) (_1!2402 lt!76670) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!666 (bitStreamReadBitsIntoList!0 (_2!2401 lt!76678) (_1!2402 lt!76670) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!49187 d!15436))

(declare-fun d!15438 () Bool)

(declare-fun e!32697 () Bool)

(assert (=> d!15438 e!32697))

(declare-fun res!41490 () Bool)

(assert (=> d!15438 (=> (not res!41490) (not e!32697))))

(declare-fun lt!77154 () (_ BitVec 64))

(declare-fun lt!77150 () (_ BitVec 64))

(declare-fun lt!77152 () (_ BitVec 64))

(assert (=> d!15438 (= res!41490 (= lt!77154 (bvsub lt!77152 lt!77150)))))

(assert (=> d!15438 (or (= (bvand lt!77152 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77150 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77152 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77152 lt!77150) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15438 (= lt!77150 (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76678)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76678))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76678)))))))

(declare-fun lt!77153 () (_ BitVec 64))

(declare-fun lt!77151 () (_ BitVec 64))

(assert (=> d!15438 (= lt!77152 (bvmul lt!77153 lt!77151))))

(assert (=> d!15438 (or (= lt!77153 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!77151 (bvsdiv (bvmul lt!77153 lt!77151) lt!77153)))))

(assert (=> d!15438 (= lt!77151 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15438 (= lt!77153 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76678)))))))

(assert (=> d!15438 (= lt!77154 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76678))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76678)))))))

(assert (=> d!15438 (invariant!0 (currentBit!2914 (_2!2401 lt!76678)) (currentByte!2919 (_2!2401 lt!76678)) (size!1050 (buf!1402 (_2!2401 lt!76678))))))

(assert (=> d!15438 (= (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76678))) (currentByte!2919 (_2!2401 lt!76678)) (currentBit!2914 (_2!2401 lt!76678))) lt!77154)))

(declare-fun b!49535 () Bool)

(declare-fun res!41491 () Bool)

(assert (=> b!49535 (=> (not res!41491) (not e!32697))))

(assert (=> b!49535 (= res!41491 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!77154))))

(declare-fun b!49536 () Bool)

(declare-fun lt!77149 () (_ BitVec 64))

(assert (=> b!49536 (= e!32697 (bvsle lt!77154 (bvmul lt!77149 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49536 (or (= lt!77149 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!77149 #b0000000000000000000000000000000000000000000000000000000000001000) lt!77149)))))

(assert (=> b!49536 (= lt!77149 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76678)))))))

(assert (= (and d!15438 res!41490) b!49535))

(assert (= (and b!49535 res!41491) b!49536))

(assert (=> d!15438 m!77389))

(declare-fun m!77505 () Bool)

(assert (=> d!15438 m!77505))

(assert (=> b!49187 d!15438))

(declare-fun d!15440 () Bool)

(assert (=> d!15440 (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76704)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76678))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76678))) lt!76689)))

(declare-fun lt!77155 () Unit!3418)

(assert (=> d!15440 (= lt!77155 (choose!9 (_2!2401 lt!76678) (buf!1402 (_2!2401 lt!76704)) lt!76689 (BitStream!1821 (buf!1402 (_2!2401 lt!76704)) (currentByte!2919 (_2!2401 lt!76678)) (currentBit!2914 (_2!2401 lt!76678)))))))

(assert (=> d!15440 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2401 lt!76678) (buf!1402 (_2!2401 lt!76704)) lt!76689) lt!77155)))

(declare-fun bs!3913 () Bool)

(assert (= bs!3913 d!15440))

(assert (=> bs!3913 m!76645))

(declare-fun m!77507 () Bool)

(assert (=> bs!3913 m!77507))

(assert (=> b!49187 d!15440))

(declare-fun d!15442 () Bool)

(assert (=> d!15442 (= (bitAt!0 (buf!1402 (_2!2401 lt!76678)) lt!76699) (bitAt!0 (buf!1402 (_2!2401 lt!76704)) lt!76699))))

(declare-fun lt!77158 () Unit!3418)

(declare-fun choose!31 (array!2315 array!2315 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3418)

(assert (=> d!15442 (= lt!77158 (choose!31 (buf!1402 (_2!2401 lt!76678)) (buf!1402 (_2!2401 lt!76704)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!76699 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76678))) (currentByte!2919 (_2!2401 lt!76678)) (currentBit!2914 (_2!2401 lt!76678)))))))

(assert (=> d!15442 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76678))) (currentByte!2919 (_2!2401 lt!76678)) (currentBit!2914 (_2!2401 lt!76678)))))))

(assert (=> d!15442 (= (arrayBitRangesEqImpliesEq!0 (buf!1402 (_2!2401 lt!76678)) (buf!1402 (_2!2401 lt!76704)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!76699 (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76678))) (currentByte!2919 (_2!2401 lt!76678)) (currentBit!2914 (_2!2401 lt!76678)))) lt!77158)))

(declare-fun bs!3914 () Bool)

(assert (= bs!3914 d!15442))

(assert (=> bs!3914 m!76665))

(assert (=> bs!3914 m!76673))

(assert (=> bs!3914 m!76657))

(declare-fun m!77509 () Bool)

(assert (=> bs!3914 m!77509))

(assert (=> b!49187 d!15442))

(declare-fun d!15444 () Bool)

(declare-fun res!41493 () Bool)

(declare-fun e!32699 () Bool)

(assert (=> d!15444 (=> (not res!41493) (not e!32699))))

(assert (=> d!15444 (= res!41493 (= (size!1050 (buf!1402 (_1!2402 lt!76780))) (size!1050 (buf!1402 (_2!2401 lt!75814)))))))

(assert (=> d!15444 (= (isPrefixOf!0 (_1!2402 lt!76780) (_2!2401 lt!75814)) e!32699)))

(declare-fun b!49537 () Bool)

(declare-fun res!41494 () Bool)

(assert (=> b!49537 (=> (not res!41494) (not e!32699))))

(assert (=> b!49537 (= res!41494 (bvsle (bitIndex!0 (size!1050 (buf!1402 (_1!2402 lt!76780))) (currentByte!2919 (_1!2402 lt!76780)) (currentBit!2914 (_1!2402 lt!76780))) (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!75814))) (currentByte!2919 (_2!2401 lt!75814)) (currentBit!2914 (_2!2401 lt!75814)))))))

(declare-fun b!49538 () Bool)

(declare-fun e!32698 () Bool)

(assert (=> b!49538 (= e!32699 e!32698)))

(declare-fun res!41492 () Bool)

(assert (=> b!49538 (=> res!41492 e!32698)))

(assert (=> b!49538 (= res!41492 (= (size!1050 (buf!1402 (_1!2402 lt!76780))) #b00000000000000000000000000000000))))

(declare-fun b!49539 () Bool)

(assert (=> b!49539 (= e!32698 (arrayBitRangesEq!0 (buf!1402 (_1!2402 lt!76780)) (buf!1402 (_2!2401 lt!75814)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1050 (buf!1402 (_1!2402 lt!76780))) (currentByte!2919 (_1!2402 lt!76780)) (currentBit!2914 (_1!2402 lt!76780)))))))

(assert (= (and d!15444 res!41493) b!49537))

(assert (= (and b!49537 res!41494) b!49538))

(assert (= (and b!49538 (not res!41492)) b!49539))

(assert (=> b!49537 m!77067))

(assert (=> b!49537 m!76035))

(assert (=> b!49539 m!77067))

(assert (=> b!49539 m!77067))

(declare-fun m!77511 () Bool)

(assert (=> b!49539 m!77511))

(assert (=> b!49255 d!15444))

(declare-fun d!15446 () Bool)

(declare-fun e!32700 () Bool)

(assert (=> d!15446 e!32700))

(declare-fun res!41495 () Bool)

(assert (=> d!15446 (=> (not res!41495) (not e!32700))))

(declare-fun lt!77160 () (_ BitVec 64))

(declare-fun lt!77164 () (_ BitVec 64))

(declare-fun lt!77162 () (_ BitVec 64))

(assert (=> d!15446 (= res!41495 (= lt!77164 (bvsub lt!77162 lt!77160)))))

(assert (=> d!15446 (or (= (bvand lt!77162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77160 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77162 lt!77160) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15446 (= lt!77160 (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_1!2414 lt!76746)))) ((_ sign_extend 32) (currentByte!2919 (_1!2414 lt!76746))) ((_ sign_extend 32) (currentBit!2914 (_1!2414 lt!76746)))))))

(declare-fun lt!77163 () (_ BitVec 64))

(declare-fun lt!77161 () (_ BitVec 64))

(assert (=> d!15446 (= lt!77162 (bvmul lt!77163 lt!77161))))

(assert (=> d!15446 (or (= lt!77163 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!77161 (bvsdiv (bvmul lt!77163 lt!77161) lt!77163)))))

(assert (=> d!15446 (= lt!77161 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15446 (= lt!77163 ((_ sign_extend 32) (size!1050 (buf!1402 (_1!2414 lt!76746)))))))

(assert (=> d!15446 (= lt!77164 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2919 (_1!2414 lt!76746))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2914 (_1!2414 lt!76746)))))))

(assert (=> d!15446 (invariant!0 (currentBit!2914 (_1!2414 lt!76746)) (currentByte!2919 (_1!2414 lt!76746)) (size!1050 (buf!1402 (_1!2414 lt!76746))))))

(assert (=> d!15446 (= (bitIndex!0 (size!1050 (buf!1402 (_1!2414 lt!76746))) (currentByte!2919 (_1!2414 lt!76746)) (currentBit!2914 (_1!2414 lt!76746))) lt!77164)))

(declare-fun b!49540 () Bool)

(declare-fun res!41496 () Bool)

(assert (=> b!49540 (=> (not res!41496) (not e!32700))))

(assert (=> b!49540 (= res!41496 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!77164))))

(declare-fun b!49541 () Bool)

(declare-fun lt!77159 () (_ BitVec 64))

(assert (=> b!49541 (= e!32700 (bvsle lt!77164 (bvmul lt!77159 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49541 (or (= lt!77159 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!77159 #b0000000000000000000000000000000000000000000000000000000000001000) lt!77159)))))

(assert (=> b!49541 (= lt!77159 ((_ sign_extend 32) (size!1050 (buf!1402 (_1!2414 lt!76746)))))))

(assert (= (and d!15446 res!41495) b!49540))

(assert (= (and b!49540 res!41496) b!49541))

(declare-fun m!77513 () Bool)

(assert (=> d!15446 m!77513))

(declare-fun m!77515 () Bool)

(assert (=> d!15446 m!77515))

(assert (=> b!49240 d!15446))

(declare-fun d!15448 () Bool)

(declare-fun e!32701 () Bool)

(assert (=> d!15448 e!32701))

(declare-fun res!41497 () Bool)

(assert (=> d!15448 (=> (not res!41497) (not e!32701))))

(declare-fun lt!77170 () (_ BitVec 64))

(declare-fun lt!77168 () (_ BitVec 64))

(declare-fun lt!77166 () (_ BitVec 64))

(assert (=> d!15448 (= res!41497 (= lt!77170 (bvsub lt!77168 lt!77166)))))

(assert (=> d!15448 (or (= (bvand lt!77168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77166 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77168 lt!77166) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15448 (= lt!77166 (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76751)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76751))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76751)))))))

(declare-fun lt!77169 () (_ BitVec 64))

(declare-fun lt!77167 () (_ BitVec 64))

(assert (=> d!15448 (= lt!77168 (bvmul lt!77169 lt!77167))))

(assert (=> d!15448 (or (= lt!77169 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!77167 (bvsdiv (bvmul lt!77169 lt!77167) lt!77169)))))

(assert (=> d!15448 (= lt!77167 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15448 (= lt!77169 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76751)))))))

(assert (=> d!15448 (= lt!77170 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!76751))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!76751)))))))

(assert (=> d!15448 (invariant!0 (currentBit!2914 (_2!2401 lt!76751)) (currentByte!2919 (_2!2401 lt!76751)) (size!1050 (buf!1402 (_2!2401 lt!76751))))))

(assert (=> d!15448 (= (bitIndex!0 (size!1050 (buf!1402 (_2!2401 lt!76751))) (currentByte!2919 (_2!2401 lt!76751)) (currentBit!2914 (_2!2401 lt!76751))) lt!77170)))

(declare-fun b!49542 () Bool)

(declare-fun res!41498 () Bool)

(assert (=> b!49542 (=> (not res!41498) (not e!32701))))

(assert (=> b!49542 (= res!41498 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!77170))))

(declare-fun b!49543 () Bool)

(declare-fun lt!77165 () (_ BitVec 64))

(assert (=> b!49543 (= e!32701 (bvsle lt!77170 (bvmul lt!77165 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49543 (or (= lt!77165 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!77165 #b0000000000000000000000000000000000000000000000000000000000001000) lt!77165)))))

(assert (=> b!49543 (= lt!77165 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!76751)))))))

(assert (= (and d!15448 res!41497) b!49542))

(assert (= (and b!49542 res!41498) b!49543))

(declare-fun m!77517 () Bool)

(assert (=> d!15448 m!77517))

(assert (=> d!15448 m!77101))

(assert (=> b!49240 d!15448))

(declare-fun d!15450 () Bool)

(assert (=> d!15450 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75814)))) ((_ sign_extend 32) (currentByte!2919 (_2!2401 lt!75814))) ((_ sign_extend 32) (currentBit!2914 (_2!2401 lt!75814)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3915 () Bool)

(assert (= bs!3915 d!15450))

(assert (=> bs!3915 m!76745))

(assert (=> b!49217 d!15450))

(declare-fun d!15452 () Bool)

(assert (=> d!15452 (= (remainingBits!0 ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75819)))) ((_ sign_extend 32) (currentByte!2919 thiss!1379)) ((_ sign_extend 32) (currentBit!2914 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1050 (buf!1402 (_2!2401 lt!75819)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2919 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2914 thiss!1379)))))))

(assert (=> d!15194 d!15452))

(assert (=> b!49242 d!15448))

(assert (=> b!49242 d!15176))

(declare-fun d!15454 () Bool)

(declare-fun res!41503 () Bool)

(declare-fun e!32706 () Bool)

(assert (=> d!15454 (=> res!41503 e!32706)))

(assert (=> d!15454 (= res!41503 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15454 (= (checkByteArrayBitContent!0 (_2!2401 lt!75814) srcBuffer!2 (_1!2411 (readBits!0 (_1!2402 call!619) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) e!32706)))

(declare-fun b!49548 () Bool)

(declare-fun e!32707 () Bool)

(assert (=> b!49548 (= e!32706 e!32707)))

(declare-fun res!41504 () Bool)

(assert (=> b!49548 (=> (not res!41504) (not e!32707))))

(assert (=> b!49548 (= res!41504 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!1576 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!1576 (_1!2411 (readBits!0 (_1!2402 call!619) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!49549 () Bool)

(assert (=> b!49549 (= e!32707 (checkByteArrayBitContent!0 (_2!2401 lt!75814) srcBuffer!2 (_1!2411 (readBits!0 (_1!2402 call!619) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!15454 (not res!41503)) b!49548))

(assert (= (and b!49548 res!41504) b!49549))

(assert (=> b!49548 m!76643))

(assert (=> b!49548 m!77007))

(declare-fun m!77519 () Bool)

(assert (=> b!49548 m!77519))

(declare-fun m!77521 () Bool)

(assert (=> b!49548 m!77521))

(declare-fun m!77523 () Bool)

(assert (=> b!49549 m!77523))

(assert (=> b!49185 d!15454))

(declare-fun b!49550 () Bool)

(declare-fun res!41507 () Bool)

(declare-fun e!32708 () Bool)

(assert (=> b!49550 (=> (not res!41507) (not e!32708))))

(declare-fun lt!77177 () tuple2!4624)

(assert (=> b!49550 (= res!41507 (bvsle (currentByte!2919 (_1!2402 call!619)) (currentByte!2919 (_2!2411 lt!77177))))))

(declare-fun d!15456 () Bool)

(assert (=> d!15456 e!32708))

(declare-fun res!41509 () Bool)

(assert (=> d!15456 (=> (not res!41509) (not e!32708))))

(assert (=> d!15456 (= res!41509 (= (buf!1402 (_2!2411 lt!77177)) (buf!1402 (_1!2402 call!619))))))

(declare-fun lt!77174 () tuple3!178)

(assert (=> d!15456 (= lt!77177 (tuple2!4625 (_3!100 lt!77174) (_2!2416 lt!77174)))))

(assert (=> d!15456 (= lt!77174 (readBitsLoop!0 (_1!2402 call!619) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) (array!2316 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!15456 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (bvsle (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!15456 (= (readBits!0 (_1!2402 call!619) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) lt!77177)))

(declare-fun b!49551 () Bool)

(declare-fun res!41508 () Bool)

(assert (=> b!49551 (=> (not res!41508) (not e!32708))))

(declare-fun lt!77173 () (_ BitVec 64))

(assert (=> b!49551 (= res!41508 (= (bvadd lt!77173 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (bitIndex!0 (size!1050 (buf!1402 (_2!2411 lt!77177))) (currentByte!2919 (_2!2411 lt!77177)) (currentBit!2914 (_2!2411 lt!77177)))))))

(assert (=> b!49551 (or (not (= (bvand lt!77173 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77173 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77173 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49551 (= lt!77173 (bitIndex!0 (size!1050 (buf!1402 (_1!2402 call!619))) (currentByte!2919 (_1!2402 call!619)) (currentBit!2914 (_1!2402 call!619))))))

(declare-fun b!49552 () Bool)

(declare-fun res!41505 () Bool)

(assert (=> b!49552 (=> (not res!41505) (not e!32708))))

(declare-fun lt!77178 () (_ BitVec 64))

(assert (=> b!49552 (= res!41505 (= (size!1050 (_1!2411 lt!77177)) ((_ extract 31 0) lt!77178)))))

(assert (=> b!49552 (and (bvslt lt!77178 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!77178 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!77175 () (_ BitVec 64))

(declare-fun lt!77179 () (_ BitVec 64))

(assert (=> b!49552 (= lt!77178 (bvsdiv lt!77175 lt!77179))))

(assert (=> b!49552 (and (not (= lt!77179 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!77175 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!77179 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!49552 (= lt!77179 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!77172 () (_ BitVec 64))

(declare-fun lt!77171 () (_ BitVec 64))

(assert (=> b!49552 (= lt!77175 (bvsub lt!77172 lt!77171))))

(assert (=> b!49552 (or (= (bvand lt!77172 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77171 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77172 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77172 lt!77171) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49552 (= lt!77171 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!77176 () (_ BitVec 64))

(assert (=> b!49552 (= lt!77172 (bvadd (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!77176))))

(assert (=> b!49552 (or (not (= (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77176 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!77176) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49552 (= lt!77176 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!49553 () Bool)

(declare-fun res!41506 () Bool)

(assert (=> b!49553 (=> (not res!41506) (not e!32708))))

(assert (=> b!49553 (= res!41506 (invariant!0 (currentBit!2914 (_2!2411 lt!77177)) (currentByte!2919 (_2!2411 lt!77177)) (size!1050 (buf!1402 (_2!2411 lt!77177)))))))

(declare-fun b!49554 () Bool)

(assert (=> b!49554 (= e!32708 (= (byteArrayBitContentToList!0 (_2!2411 lt!77177) (_1!2411 lt!77177) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (bitStreamReadBitsIntoList!0 (_2!2411 lt!77177) (_1!2402 call!619) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (= (and d!15456 res!41509) b!49551))

(assert (= (and b!49551 res!41508) b!49553))

(assert (= (and b!49553 res!41506) b!49552))

(assert (= (and b!49552 res!41505) b!49550))

(assert (= (and b!49550 res!41507) b!49554))

(declare-fun m!77525 () Bool)

(assert (=> d!15456 m!77525))

(declare-fun m!77527 () Bool)

(assert (=> b!49551 m!77527))

(declare-fun m!77529 () Bool)

(assert (=> b!49551 m!77529))

(declare-fun m!77531 () Bool)

(assert (=> b!49553 m!77531))

(declare-fun m!77533 () Bool)

(assert (=> b!49554 m!77533))

(declare-fun m!77535 () Bool)

(assert (=> b!49554 m!77535))

(assert (=> b!49185 d!15456))

(declare-fun d!15458 () Bool)

(declare-fun e!32709 () Bool)

(assert (=> d!15458 e!32709))

(declare-fun res!41510 () Bool)

(assert (=> d!15458 (=> (not res!41510) (not e!32709))))

(declare-fun lt!77180 () BitStream!1820)

(declare-fun lt!77181 () (_ BitVec 64))

(assert (=> d!15458 (= res!41510 (= (bvadd lt!77181 (bvsub lt!76772 lt!76781)) (bitIndex!0 (size!1050 (buf!1402 lt!77180)) (currentByte!2919 lt!77180) (currentBit!2914 lt!77180))))))

(assert (=> d!15458 (or (not (= (bvand lt!77181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76772 lt!76781) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77181 (bvsub lt!76772 lt!76781)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15458 (= lt!77181 (bitIndex!0 (size!1050 (buf!1402 (_2!2402 lt!76780))) (currentByte!2919 (_2!2402 lt!76780)) (currentBit!2914 (_2!2402 lt!76780))))))

(assert (=> d!15458 (= lt!77180 (_2!2401 (moveBitIndex!0 (_2!2402 lt!76780) (bvsub lt!76772 lt!76781))))))

(assert (=> d!15458 (moveBitIndexPrecond!0 (_2!2402 lt!76780) (bvsub lt!76772 lt!76781))))

(assert (=> d!15458 (= (withMovedBitIndex!0 (_2!2402 lt!76780) (bvsub lt!76772 lt!76781)) lt!77180)))

(declare-fun b!49555 () Bool)

(assert (=> b!49555 (= e!32709 (= (size!1050 (buf!1402 (_2!2402 lt!76780))) (size!1050 (buf!1402 lt!77180))))))

(assert (= (and d!15458 res!41510) b!49555))

(declare-fun m!77537 () Bool)

(assert (=> d!15458 m!77537))

(assert (=> d!15458 m!77069))

(declare-fun m!77539 () Bool)

(assert (=> d!15458 m!77539))

(declare-fun m!77541 () Bool)

(assert (=> d!15458 m!77541))

(assert (=> b!49253 d!15458))

(assert (=> b!49253 d!15002))

(assert (=> b!49253 d!15200))

(push 1)

(assert (not d!15370))

(assert (not b!49351))

(assert (not b!49278))

(assert (not d!15336))

(assert (not b!49523))

(assert (not b!49447))

(assert (not b!49516))

(assert (not b!49370))

(assert (not b!49466))

(assert (not b!49331))

(assert (not b!49477))

(assert (not b!49349))

(assert (not d!15322))

(assert (not b!49510))

(assert (not d!15334))

(assert (not b!49431))

(assert (not d!15376))

(assert (not d!15374))

(assert (not b!49528))

(assert (not b!49387))

(assert (not b!49394))

(assert (not b!49309))

(assert (not b!49452))

(assert (not b!49277))

(assert (not b!49444))

(assert (not d!15230))

(assert (not d!15458))

(assert (not d!15282))

(assert (not b!49494))

(assert (not b!49371))

(assert (not d!15244))

(assert (not d!15246))

(assert (not b!49468))

(assert (not d!15438))

(assert (not d!15212))

(assert (not b!49314))

(assert (not b!49335))

(assert (not d!15286))

(assert (not b!49404))

(assert (not b!49429))

(assert (not d!15406))

(assert (not d!15258))

(assert (not b!49455))

(assert (not b!49318))

(assert (not b!49484))

(assert (not b!49304))

(assert (not b!49474))

(assert (not d!15416))

(assert (not b!49352))

(assert (not d!15414))

(assert (not b!49365))

(assert (not b!49362))

(assert (not b!49361))

(assert (not d!15422))

(assert (not b!49450))

(assert (not b!49402))

(assert (not d!15426))

(assert (not b!49461))

(assert (not b!49332))

(assert (not b!49350))

(assert (not b!49518))

(assert (not d!15226))

(assert (not d!15448))

(assert (not d!15270))

(assert (not b!49311))

(assert (not b!49483))

(assert (not b!49456))

(assert (not b!49408))

(assert (not b!49405))

(assert (not b!49554))

(assert (not b!49462))

(assert (not b!49490))

(assert (not b!49458))

(assert (not d!15276))

(assert (not b!49348))

(assert (not b!49498))

(assert (not b!49525))

(assert (not b!49445))

(assert (not b!49422))

(assert (not d!15242))

(assert (not d!15330))

(assert (not b!49514))

(assert (not b!49522))

(assert (not b!49551))

(assert (not d!15382))

(assert (not b!49410))

(assert (not b!49343))

(assert (not d!15442))

(assert (not d!15294))

(assert (not d!15288))

(assert (not b!49353))

(assert (not b!49487))

(assert (not d!15356))

(assert (not b!49465))

(assert (not bm!620))

(assert (not b!49501))

(assert (not b!49506))

(assert (not d!15354))

(assert (not d!15234))

(assert (not b!49486))

(assert (not b!49296))

(assert (not d!15428))

(assert (not b!49539))

(assert (not b!49276))

(assert (not b!49519))

(assert (not b!49392))

(assert (not b!49280))

(assert (not d!15450))

(assert (not b!49470))

(assert (not b!49463))

(assert (not d!15272))

(assert (not d!15328))

(assert (not d!15266))

(assert (not b!49315))

(assert (not b!49478))

(assert (not b!49385))

(assert (not b!49368))

(assert (not b!49328))

(assert (not d!15340))

(assert (not b!49391))

(assert (not b!49471))

(assert (not bm!619))

(assert (not b!49480))

(assert (not b!49511))

(assert (not b!49337))

(assert (not b!49302))

(assert (not d!15418))

(assert (not b!49460))

(assert (not d!15384))

(assert (not b!49526))

(assert (not b!49334))

(assert (not b!49367))

(assert (not d!15350))

(assert (not b!49441))

(assert (not b!49529))

(assert (not d!15456))

(assert (not b!49323))

(assert (not b!49485))

(assert (not b!49329))

(assert (not b!49504))

(assert (not b!49503))

(assert (not b!49364))

(assert (not b!49476))

(assert (not d!15446))

(assert (not d!15430))

(assert (not b!49505))

(assert (not bm!623))

(assert (not b!49493))

(assert (not b!49319))

(assert (not bm!624))

(assert (not bm!621))

(assert (not b!49305))

(assert (not d!15296))

(assert (not d!15332))

(assert (not b!49479))

(assert (not d!15434))

(assert (not b!49500))

(assert (not d!15250))

(assert (not b!49347))

(assert (not b!49359))

(assert (not d!15338))

(assert (not b!49502))

(assert (not d!15400))

(assert (not b!49425))

(assert (not b!49512))

(assert (not d!15432))

(assert (not b!49515))

(assert (not b!49491))

(assert (not b!49443))

(assert (not b!49398))

(assert (not d!15290))

(assert (not b!49417))

(assert (not b!49415))

(assert (not d!15218))

(assert (not b!49424))

(assert (not b!49496))

(assert (not b!49388))

(assert (not b!49553))

(assert (not d!15398))

(assert (not b!49531))

(assert (not b!49489))

(assert (not b!49338))

(assert (not b!49482))

(assert (not d!15298))

(assert (not d!15424))

(assert (not d!15314))

(assert (not b!49453))

(assert (not b!49521))

(assert (not d!15312))

(assert (not b!49418))

(assert (not bm!622))

(assert (not b!49508))

(assert (not d!15214))

(assert (not b!49340))

(assert (not d!15342))

(assert (not d!15300))

(assert (not b!49407))

(assert (not b!49279))

(assert (not b!49472))

(assert (not b!49549))

(assert (not b!49530))

(assert (not b!49341))

(assert (not d!15378))

(assert (not b!49345))

(assert (not bm!626))

(assert (not b!49326))

(assert (not d!15440))

(assert (not b!49325))

(assert (not b!49313))

(assert (not b!49373))

(assert (not b!49442))

(assert (not bm!625))

(assert (not b!49355))

(assert (not b!49537))

(assert (not b!49520))

(assert (not b!49481))

(assert (not d!15264))

(assert (not b!49300))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

