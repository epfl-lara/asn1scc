; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10000 () Bool)

(assert start!10000)

(declare-fun b!50206 () Bool)

(declare-fun res!41999 () Bool)

(declare-fun e!33137 () Bool)

(assert (=> b!50206 (=> res!41999 e!33137)))

(declare-datatypes ((array!2322 0))(
  ( (array!2323 (arr!1584 (Array (_ BitVec 32) (_ BitVec 8))) (size!1055 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1824 0))(
  ( (BitStream!1825 (buf!1410 array!2322) (currentByte!2933 (_ BitVec 32)) (currentBit!2928 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1824)

(declare-datatypes ((Unit!3485 0))(
  ( (Unit!3486) )
))
(declare-datatypes ((tuple2!4636 0))(
  ( (tuple2!4637 (_1!2423 Unit!3485) (_2!2423 BitStream!1824)) )
))
(declare-fun lt!77986 () tuple2!4636)

(assert (=> b!50206 (= res!41999 (not (= (size!1055 (buf!1410 thiss!1379)) (size!1055 (buf!1410 (_2!2423 lt!77986))))))))

(declare-fun b!50207 () Bool)

(declare-fun res!42004 () Bool)

(declare-fun e!33142 () Bool)

(assert (=> b!50207 (=> res!42004 e!33142)))

(declare-fun lt!78000 () tuple2!4636)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!50207 (= res!42004 (not (invariant!0 (currentBit!2928 (_2!2423 lt!78000)) (currentByte!2933 (_2!2423 lt!78000)) (size!1055 (buf!1410 (_2!2423 lt!77986))))))))

(declare-fun b!50208 () Bool)

(declare-fun e!33134 () Bool)

(declare-fun e!33139 () Bool)

(assert (=> b!50208 (= e!33134 (not e!33139))))

(declare-fun res!41997 () Bool)

(assert (=> b!50208 (=> res!41997 e!33139)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!50208 (= res!41997 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1824 BitStream!1824) Bool)

(assert (=> b!50208 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!77998 () Unit!3485)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1824) Unit!3485)

(assert (=> b!50208 (= lt!77998 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!77994 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!50208 (= lt!77994 (bitIndex!0 (size!1055 (buf!1410 thiss!1379)) (currentByte!2933 thiss!1379) (currentBit!2928 thiss!1379)))))

(declare-fun b!50209 () Bool)

(declare-fun e!33132 () Bool)

(declare-fun e!33141 () Bool)

(assert (=> b!50209 (= e!33132 e!33141)))

(declare-fun res!41998 () Bool)

(assert (=> b!50209 (=> res!41998 e!33141)))

(assert (=> b!50209 (= res!41998 (not (isPrefixOf!0 (_2!2423 lt!78000) (_2!2423 lt!77986))))))

(assert (=> b!50209 (isPrefixOf!0 thiss!1379 (_2!2423 lt!77986))))

(declare-fun lt!77989 () Unit!3485)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1824 BitStream!1824 BitStream!1824) Unit!3485)

(assert (=> b!50209 (= lt!77989 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2423 lt!78000) (_2!2423 lt!77986)))))

(declare-fun srcBuffer!2 () array!2322)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1824 array!2322 (_ BitVec 64) (_ BitVec 64)) tuple2!4636)

(assert (=> b!50209 (= lt!77986 (appendBitsMSBFirstLoop!0 (_2!2423 lt!78000) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!33135 () Bool)

(assert (=> b!50209 e!33135))

(declare-fun res!41992 () Bool)

(assert (=> b!50209 (=> (not res!41992) (not e!33135))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!50209 (= res!41992 (validate_offset_bits!1 ((_ sign_extend 32) (size!1055 (buf!1410 (_2!2423 lt!78000)))) ((_ sign_extend 32) (currentByte!2933 thiss!1379)) ((_ sign_extend 32) (currentBit!2928 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!77999 () Unit!3485)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1824 array!2322 (_ BitVec 64)) Unit!3485)

(assert (=> b!50209 (= lt!77999 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1410 (_2!2423 lt!78000)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4638 0))(
  ( (tuple2!4639 (_1!2424 BitStream!1824) (_2!2424 BitStream!1824)) )
))
(declare-fun lt!77996 () tuple2!4638)

(declare-fun reader!0 (BitStream!1824 BitStream!1824) tuple2!4638)

(assert (=> b!50209 (= lt!77996 (reader!0 thiss!1379 (_2!2423 lt!78000)))))

(declare-fun b!50210 () Bool)

(declare-fun e!33138 () Bool)

(assert (=> b!50210 (= e!33142 e!33138)))

(declare-fun res!41993 () Bool)

(assert (=> b!50210 (=> res!41993 e!33138)))

(assert (=> b!50210 (= res!41993 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77995 () (_ BitVec 64))

(declare-fun lt!77985 () tuple2!4638)

(declare-datatypes ((List!553 0))(
  ( (Nil!550) (Cons!549 (h!668 Bool) (t!1303 List!553)) )
))
(declare-fun lt!78001 () List!553)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1824 BitStream!1824 (_ BitVec 64)) List!553)

(assert (=> b!50210 (= lt!78001 (bitStreamReadBitsIntoList!0 (_2!2423 lt!77986) (_1!2424 lt!77985) lt!77995))))

(declare-fun lt!77992 () List!553)

(declare-fun lt!77997 () tuple2!4638)

(assert (=> b!50210 (= lt!77992 (bitStreamReadBitsIntoList!0 (_2!2423 lt!77986) (_1!2424 lt!77997) (bvsub to!314 i!635)))))

(assert (=> b!50210 (validate_offset_bits!1 ((_ sign_extend 32) (size!1055 (buf!1410 (_2!2423 lt!77986)))) ((_ sign_extend 32) (currentByte!2933 (_2!2423 lt!78000))) ((_ sign_extend 32) (currentBit!2928 (_2!2423 lt!78000))) lt!77995)))

(declare-fun lt!77991 () Unit!3485)

(assert (=> b!50210 (= lt!77991 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2423 lt!78000) (buf!1410 (_2!2423 lt!77986)) lt!77995))))

(assert (=> b!50210 (= lt!77985 (reader!0 (_2!2423 lt!78000) (_2!2423 lt!77986)))))

(assert (=> b!50210 (validate_offset_bits!1 ((_ sign_extend 32) (size!1055 (buf!1410 (_2!2423 lt!77986)))) ((_ sign_extend 32) (currentByte!2933 thiss!1379)) ((_ sign_extend 32) (currentBit!2928 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!77987 () Unit!3485)

(assert (=> b!50210 (= lt!77987 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1410 (_2!2423 lt!77986)) (bvsub to!314 i!635)))))

(assert (=> b!50210 (= lt!77997 (reader!0 thiss!1379 (_2!2423 lt!77986)))))

(declare-fun res!41994 () Bool)

(assert (=> start!10000 (=> (not res!41994) (not e!33134))))

(assert (=> start!10000 (= res!41994 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1055 srcBuffer!2))))))))

(assert (=> start!10000 e!33134))

(assert (=> start!10000 true))

(declare-fun array_inv!965 (array!2322) Bool)

(assert (=> start!10000 (array_inv!965 srcBuffer!2)))

(declare-fun e!33136 () Bool)

(declare-fun inv!12 (BitStream!1824) Bool)

(assert (=> start!10000 (and (inv!12 thiss!1379) e!33136)))

(declare-fun b!50211 () Bool)

(assert (=> b!50211 (= e!33139 e!33132)))

(declare-fun res!42002 () Bool)

(assert (=> b!50211 (=> res!42002 e!33132)))

(assert (=> b!50211 (= res!42002 (not (isPrefixOf!0 thiss!1379 (_2!2423 lt!78000))))))

(assert (=> b!50211 (validate_offset_bits!1 ((_ sign_extend 32) (size!1055 (buf!1410 (_2!2423 lt!78000)))) ((_ sign_extend 32) (currentByte!2933 (_2!2423 lt!78000))) ((_ sign_extend 32) (currentBit!2928 (_2!2423 lt!78000))) lt!77995)))

(assert (=> b!50211 (= lt!77995 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!77990 () Unit!3485)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1824 BitStream!1824 (_ BitVec 64) (_ BitVec 64)) Unit!3485)

(assert (=> b!50211 (= lt!77990 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2423 lt!78000) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1824 (_ BitVec 8) (_ BitVec 32)) tuple2!4636)

(assert (=> b!50211 (= lt!78000 (appendBitFromByte!0 thiss!1379 (select (arr!1584 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!50212 () Bool)

(assert (=> b!50212 (= e!33138 true)))

(declare-fun tail!239 (List!553) List!553)

(assert (=> b!50212 (= lt!78001 (tail!239 lt!77992))))

(declare-fun lt!77988 () Unit!3485)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1824 BitStream!1824 BitStream!1824 BitStream!1824 (_ BitVec 64) List!553) Unit!3485)

(assert (=> b!50212 (= lt!77988 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2423 lt!77986) (_2!2423 lt!77986) (_1!2424 lt!77997) (_1!2424 lt!77985) (bvsub to!314 i!635) lt!77992))))

(declare-fun b!50213 () Bool)

(assert (=> b!50213 (= e!33137 e!33142)))

(declare-fun res!42005 () Bool)

(assert (=> b!50213 (=> res!42005 e!33142)))

(assert (=> b!50213 (= res!42005 (not (= (size!1055 (buf!1410 (_2!2423 lt!78000))) (size!1055 (buf!1410 (_2!2423 lt!77986))))))))

(declare-fun e!33143 () Bool)

(assert (=> b!50213 e!33143))

(declare-fun res!42000 () Bool)

(assert (=> b!50213 (=> (not res!42000) (not e!33143))))

(assert (=> b!50213 (= res!42000 (= (size!1055 (buf!1410 (_2!2423 lt!77986))) (size!1055 (buf!1410 thiss!1379))))))

(declare-fun b!50214 () Bool)

(declare-fun res!42001 () Bool)

(assert (=> b!50214 (=> res!42001 e!33137)))

(assert (=> b!50214 (= res!42001 (not (invariant!0 (currentBit!2928 (_2!2423 lt!77986)) (currentByte!2933 (_2!2423 lt!77986)) (size!1055 (buf!1410 (_2!2423 lt!77986))))))))

(declare-fun b!50215 () Bool)

(declare-fun head!372 (List!553) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1824 array!2322 (_ BitVec 64) (_ BitVec 64)) List!553)

(assert (=> b!50215 (= e!33135 (= (head!372 (byteArrayBitContentToList!0 (_2!2423 lt!78000) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!372 (bitStreamReadBitsIntoList!0 (_2!2423 lt!78000) (_1!2424 lt!77996) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!50216 () Bool)

(declare-fun lt!77993 () (_ BitVec 64))

(assert (=> b!50216 (= e!33143 (= lt!77993 (bvsub (bvsub (bvadd (bitIndex!0 (size!1055 (buf!1410 (_2!2423 lt!78000))) (currentByte!2933 (_2!2423 lt!78000)) (currentBit!2928 (_2!2423 lt!78000))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!50217 () Bool)

(declare-fun res!42006 () Bool)

(assert (=> b!50217 (=> (not res!42006) (not e!33134))))

(assert (=> b!50217 (= res!42006 (validate_offset_bits!1 ((_ sign_extend 32) (size!1055 (buf!1410 thiss!1379))) ((_ sign_extend 32) (currentByte!2933 thiss!1379)) ((_ sign_extend 32) (currentBit!2928 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!50218 () Bool)

(declare-fun res!41996 () Bool)

(assert (=> b!50218 (=> res!41996 e!33138)))

(declare-fun length!248 (List!553) Int)

(assert (=> b!50218 (= res!41996 (<= (length!248 lt!77992) 0))))

(declare-fun b!50219 () Bool)

(assert (=> b!50219 (= e!33141 e!33137)))

(declare-fun res!42003 () Bool)

(assert (=> b!50219 (=> res!42003 e!33137)))

(assert (=> b!50219 (= res!42003 (not (= lt!77993 (bvsub (bvadd lt!77994 to!314) i!635))))))

(assert (=> b!50219 (= lt!77993 (bitIndex!0 (size!1055 (buf!1410 (_2!2423 lt!77986))) (currentByte!2933 (_2!2423 lt!77986)) (currentBit!2928 (_2!2423 lt!77986))))))

(declare-fun b!50220 () Bool)

(declare-fun res!41995 () Bool)

(assert (=> b!50220 (=> res!41995 e!33142)))

(assert (=> b!50220 (= res!41995 (not (invariant!0 (currentBit!2928 (_2!2423 lt!78000)) (currentByte!2933 (_2!2423 lt!78000)) (size!1055 (buf!1410 (_2!2423 lt!78000))))))))

(declare-fun b!50221 () Bool)

(assert (=> b!50221 (= e!33136 (array_inv!965 (buf!1410 thiss!1379)))))

(assert (= (and start!10000 res!41994) b!50217))

(assert (= (and b!50217 res!42006) b!50208))

(assert (= (and b!50208 (not res!41997)) b!50211))

(assert (= (and b!50211 (not res!42002)) b!50209))

(assert (= (and b!50209 res!41992) b!50215))

(assert (= (and b!50209 (not res!41998)) b!50219))

(assert (= (and b!50219 (not res!42003)) b!50214))

(assert (= (and b!50214 (not res!42001)) b!50206))

(assert (= (and b!50206 (not res!41999)) b!50213))

(assert (= (and b!50213 res!42000) b!50216))

(assert (= (and b!50213 (not res!42005)) b!50220))

(assert (= (and b!50220 (not res!41995)) b!50207))

(assert (= (and b!50207 (not res!42004)) b!50210))

(assert (= (and b!50210 (not res!41993)) b!50218))

(assert (= (and b!50218 (not res!41996)) b!50212))

(assert (= start!10000 b!50221))

(declare-fun m!78981 () Bool)

(assert (=> b!50210 m!78981))

(declare-fun m!78983 () Bool)

(assert (=> b!50210 m!78983))

(declare-fun m!78985 () Bool)

(assert (=> b!50210 m!78985))

(declare-fun m!78987 () Bool)

(assert (=> b!50210 m!78987))

(declare-fun m!78989 () Bool)

(assert (=> b!50210 m!78989))

(declare-fun m!78991 () Bool)

(assert (=> b!50210 m!78991))

(declare-fun m!78993 () Bool)

(assert (=> b!50210 m!78993))

(declare-fun m!78995 () Bool)

(assert (=> b!50210 m!78995))

(declare-fun m!78997 () Bool)

(assert (=> b!50221 m!78997))

(declare-fun m!78999 () Bool)

(assert (=> start!10000 m!78999))

(declare-fun m!79001 () Bool)

(assert (=> start!10000 m!79001))

(declare-fun m!79003 () Bool)

(assert (=> b!50208 m!79003))

(declare-fun m!79005 () Bool)

(assert (=> b!50208 m!79005))

(declare-fun m!79007 () Bool)

(assert (=> b!50208 m!79007))

(declare-fun m!79009 () Bool)

(assert (=> b!50216 m!79009))

(declare-fun m!79011 () Bool)

(assert (=> b!50212 m!79011))

(declare-fun m!79013 () Bool)

(assert (=> b!50212 m!79013))

(declare-fun m!79015 () Bool)

(assert (=> b!50211 m!79015))

(declare-fun m!79017 () Bool)

(assert (=> b!50211 m!79017))

(assert (=> b!50211 m!79015))

(declare-fun m!79019 () Bool)

(assert (=> b!50211 m!79019))

(declare-fun m!79021 () Bool)

(assert (=> b!50211 m!79021))

(declare-fun m!79023 () Bool)

(assert (=> b!50211 m!79023))

(declare-fun m!79025 () Bool)

(assert (=> b!50207 m!79025))

(declare-fun m!79027 () Bool)

(assert (=> b!50214 m!79027))

(declare-fun m!79029 () Bool)

(assert (=> b!50215 m!79029))

(assert (=> b!50215 m!79029))

(declare-fun m!79031 () Bool)

(assert (=> b!50215 m!79031))

(declare-fun m!79033 () Bool)

(assert (=> b!50215 m!79033))

(assert (=> b!50215 m!79033))

(declare-fun m!79035 () Bool)

(assert (=> b!50215 m!79035))

(declare-fun m!79037 () Bool)

(assert (=> b!50217 m!79037))

(declare-fun m!79039 () Bool)

(assert (=> b!50209 m!79039))

(declare-fun m!79041 () Bool)

(assert (=> b!50209 m!79041))

(declare-fun m!79043 () Bool)

(assert (=> b!50209 m!79043))

(declare-fun m!79045 () Bool)

(assert (=> b!50209 m!79045))

(declare-fun m!79047 () Bool)

(assert (=> b!50209 m!79047))

(declare-fun m!79049 () Bool)

(assert (=> b!50209 m!79049))

(declare-fun m!79051 () Bool)

(assert (=> b!50209 m!79051))

(declare-fun m!79053 () Bool)

(assert (=> b!50218 m!79053))

(declare-fun m!79055 () Bool)

(assert (=> b!50219 m!79055))

(declare-fun m!79057 () Bool)

(assert (=> b!50220 m!79057))

(check-sat (not b!50211) (not b!50216) (not b!50221) (not b!50210) (not b!50212) (not b!50209) (not b!50207) (not b!50220) (not b!50219) (not b!50208) (not b!50218) (not b!50217) (not b!50214) (not start!10000) (not b!50215))
