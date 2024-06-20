; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6134 () Bool)

(assert start!6134)

(declare-fun res!24965 () Bool)

(declare-fun e!19379 () Bool)

(assert (=> start!6134 (=> (not res!24965) (not e!19379))))

(declare-datatypes ((array!1760 0))(
  ( (array!1761 (arr!1226 (Array (_ BitVec 32) (_ BitVec 8))) (size!763 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1760)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!6134 (= res!24965 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!763 srcBuffer!2))))))))

(assert (=> start!6134 e!19379))

(assert (=> start!6134 true))

(declare-fun array_inv!730 (array!1760) Bool)

(assert (=> start!6134 (array_inv!730 srcBuffer!2)))

(declare-datatypes ((BitStream!1354 0))(
  ( (BitStream!1355 (buf!1091 array!1760) (currentByte!2422 (_ BitVec 32)) (currentBit!2417 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1354)

(declare-fun e!19381 () Bool)

(declare-fun inv!12 (BitStream!1354) Bool)

(assert (=> start!6134 (and (inv!12 thiss!1379) e!19381)))

(declare-fun b!28846 () Bool)

(declare-fun res!24964 () Bool)

(declare-fun e!19374 () Bool)

(assert (=> b!28846 (=> res!24964 e!19374)))

(declare-datatypes ((Unit!2247 0))(
  ( (Unit!2248) )
))
(declare-datatypes ((tuple2!3098 0))(
  ( (tuple2!3099 (_1!1636 Unit!2247) (_2!1636 BitStream!1354)) )
))
(declare-fun lt!40932 () tuple2!3098)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!28846 (= res!24964 (not (invariant!0 (currentBit!2417 (_2!1636 lt!40932)) (currentByte!2422 (_2!1636 lt!40932)) (size!763 (buf!1091 (_2!1636 lt!40932))))))))

(declare-fun b!28847 () Bool)

(assert (=> b!28847 (= e!19381 (array_inv!730 (buf!1091 thiss!1379)))))

(declare-fun b!28848 () Bool)

(declare-fun e!19373 () Bool)

(declare-fun e!19380 () Bool)

(assert (=> b!28848 (= e!19373 e!19380)))

(declare-fun res!24970 () Bool)

(assert (=> b!28848 (=> res!24970 e!19380)))

(declare-fun lt!40928 () tuple2!3098)

(declare-fun isPrefixOf!0 (BitStream!1354 BitStream!1354) Bool)

(assert (=> b!28848 (= res!24970 (not (isPrefixOf!0 (_2!1636 lt!40928) (_2!1636 lt!40932))))))

(assert (=> b!28848 (isPrefixOf!0 thiss!1379 (_2!1636 lt!40932))))

(declare-fun lt!40921 () Unit!2247)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1354 BitStream!1354 BitStream!1354) Unit!2247)

(assert (=> b!28848 (= lt!40921 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1636 lt!40928) (_2!1636 lt!40932)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1354 array!1760 (_ BitVec 64) (_ BitVec 64)) tuple2!3098)

(assert (=> b!28848 (= lt!40932 (appendBitsMSBFirstLoop!0 (_2!1636 lt!40928) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!19375 () Bool)

(assert (=> b!28848 e!19375))

(declare-fun res!24975 () Bool)

(assert (=> b!28848 (=> (not res!24975) (not e!19375))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!28848 (= res!24975 (validate_offset_bits!1 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40928)))) ((_ sign_extend 32) (currentByte!2422 thiss!1379)) ((_ sign_extend 32) (currentBit!2417 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!40924 () Unit!2247)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1354 array!1760 (_ BitVec 64)) Unit!2247)

(assert (=> b!28848 (= lt!40924 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1091 (_2!1636 lt!40928)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!3100 0))(
  ( (tuple2!3101 (_1!1637 BitStream!1354) (_2!1637 BitStream!1354)) )
))
(declare-fun lt!40926 () tuple2!3100)

(declare-fun reader!0 (BitStream!1354 BitStream!1354) tuple2!3100)

(assert (=> b!28848 (= lt!40926 (reader!0 thiss!1379 (_2!1636 lt!40928)))))

(declare-fun b!28849 () Bool)

(declare-fun res!24966 () Bool)

(assert (=> b!28849 (=> (not res!24966) (not e!19379))))

(assert (=> b!28849 (= res!24966 (validate_offset_bits!1 ((_ sign_extend 32) (size!763 (buf!1091 thiss!1379))) ((_ sign_extend 32) (currentByte!2422 thiss!1379)) ((_ sign_extend 32) (currentBit!2417 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!28850 () Bool)

(assert (=> b!28850 (= e!19380 e!19374)))

(declare-fun res!24971 () Bool)

(assert (=> b!28850 (=> res!24971 e!19374)))

(declare-fun lt!40930 () (_ BitVec 64))

(declare-fun lt!40936 () (_ BitVec 64))

(assert (=> b!28850 (= res!24971 (not (= lt!40936 (bvsub (bvadd lt!40930 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!28850 (= lt!40936 (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!40932))) (currentByte!2422 (_2!1636 lt!40932)) (currentBit!2417 (_2!1636 lt!40932))))))

(declare-fun b!28851 () Bool)

(declare-fun res!24963 () Bool)

(declare-fun e!19372 () Bool)

(assert (=> b!28851 (=> res!24963 e!19372)))

(assert (=> b!28851 (= res!24963 (not (invariant!0 (currentBit!2417 (_2!1636 lt!40928)) (currentByte!2422 (_2!1636 lt!40928)) (size!763 (buf!1091 (_2!1636 lt!40932))))))))

(declare-datatypes ((List!378 0))(
  ( (Nil!375) (Cons!374 (h!493 Bool) (t!1128 List!378)) )
))
(declare-fun lt!40923 () List!378)

(declare-fun e!19371 () Bool)

(declare-fun lt!40935 () List!378)

(declare-fun b!28852 () Bool)

(declare-fun lt!40925 () tuple2!3100)

(assert (=> b!28852 (= e!19371 (or (not (= lt!40923 lt!40935)) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!40930) (bvslt lt!40930 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!763 (buf!1091 (_1!1637 lt!40925)))))))))))

(assert (=> b!28852 (= lt!40935 lt!40923)))

(declare-fun lt!40933 () List!378)

(declare-fun tail!95 (List!378) List!378)

(assert (=> b!28852 (= lt!40923 (tail!95 lt!40933))))

(declare-fun lt!40920 () Unit!2247)

(declare-fun lt!40934 () tuple2!3100)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1354 BitStream!1354 BitStream!1354 BitStream!1354 (_ BitVec 64) List!378) Unit!2247)

(assert (=> b!28852 (= lt!40920 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1636 lt!40932) (_2!1636 lt!40932) (_1!1637 lt!40925) (_1!1637 lt!40934) (bvsub to!314 i!635) lt!40933))))

(declare-fun b!28853 () Bool)

(declare-fun e!19378 () Bool)

(assert (=> b!28853 (= e!19379 (not e!19378))))

(declare-fun res!24967 () Bool)

(assert (=> b!28853 (=> res!24967 e!19378)))

(assert (=> b!28853 (= res!24967 (bvsge i!635 to!314))))

(assert (=> b!28853 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!40919 () Unit!2247)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1354) Unit!2247)

(assert (=> b!28853 (= lt!40919 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!28853 (= lt!40930 (bitIndex!0 (size!763 (buf!1091 thiss!1379)) (currentByte!2422 thiss!1379) (currentBit!2417 thiss!1379)))))

(declare-fun b!28854 () Bool)

(assert (=> b!28854 (= e!19374 e!19372)))

(declare-fun res!24973 () Bool)

(assert (=> b!28854 (=> res!24973 e!19372)))

(assert (=> b!28854 (= res!24973 (not (= (size!763 (buf!1091 (_2!1636 lt!40928))) (size!763 (buf!1091 (_2!1636 lt!40932))))))))

(declare-fun e!19376 () Bool)

(assert (=> b!28854 e!19376))

(declare-fun res!24969 () Bool)

(assert (=> b!28854 (=> (not res!24969) (not e!19376))))

(assert (=> b!28854 (= res!24969 (= (size!763 (buf!1091 (_2!1636 lt!40932))) (size!763 (buf!1091 thiss!1379))))))

(declare-fun b!28855 () Bool)

(assert (=> b!28855 (= e!19372 e!19371)))

(declare-fun res!24968 () Bool)

(assert (=> b!28855 (=> res!24968 e!19371)))

(assert (=> b!28855 (= res!24968 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!40922 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1354 BitStream!1354 (_ BitVec 64)) List!378)

(assert (=> b!28855 (= lt!40935 (bitStreamReadBitsIntoList!0 (_2!1636 lt!40932) (_1!1637 lt!40934) lt!40922))))

(assert (=> b!28855 (= lt!40933 (bitStreamReadBitsIntoList!0 (_2!1636 lt!40932) (_1!1637 lt!40925) (bvsub to!314 i!635)))))

(assert (=> b!28855 (validate_offset_bits!1 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40932)))) ((_ sign_extend 32) (currentByte!2422 (_2!1636 lt!40928))) ((_ sign_extend 32) (currentBit!2417 (_2!1636 lt!40928))) lt!40922)))

(declare-fun lt!40929 () Unit!2247)

(assert (=> b!28855 (= lt!40929 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1636 lt!40928) (buf!1091 (_2!1636 lt!40932)) lt!40922))))

(assert (=> b!28855 (= lt!40934 (reader!0 (_2!1636 lt!40928) (_2!1636 lt!40932)))))

(assert (=> b!28855 (validate_offset_bits!1 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40932)))) ((_ sign_extend 32) (currentByte!2422 thiss!1379)) ((_ sign_extend 32) (currentBit!2417 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!40927 () Unit!2247)

(assert (=> b!28855 (= lt!40927 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1091 (_2!1636 lt!40932)) (bvsub to!314 i!635)))))

(assert (=> b!28855 (= lt!40925 (reader!0 thiss!1379 (_2!1636 lt!40932)))))

(declare-fun b!28856 () Bool)

(declare-fun res!24961 () Bool)

(assert (=> b!28856 (=> res!24961 e!19374)))

(assert (=> b!28856 (= res!24961 (not (= (size!763 (buf!1091 thiss!1379)) (size!763 (buf!1091 (_2!1636 lt!40932))))))))

(declare-fun b!28857 () Bool)

(assert (=> b!28857 (= e!19378 e!19373)))

(declare-fun res!24972 () Bool)

(assert (=> b!28857 (=> res!24972 e!19373)))

(assert (=> b!28857 (= res!24972 (not (isPrefixOf!0 thiss!1379 (_2!1636 lt!40928))))))

(assert (=> b!28857 (validate_offset_bits!1 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40928)))) ((_ sign_extend 32) (currentByte!2422 (_2!1636 lt!40928))) ((_ sign_extend 32) (currentBit!2417 (_2!1636 lt!40928))) lt!40922)))

(assert (=> b!28857 (= lt!40922 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!40931 () Unit!2247)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1354 BitStream!1354 (_ BitVec 64) (_ BitVec 64)) Unit!2247)

(assert (=> b!28857 (= lt!40931 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1636 lt!40928) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1354 (_ BitVec 8) (_ BitVec 32)) tuple2!3098)

(assert (=> b!28857 (= lt!40928 (appendBitFromByte!0 thiss!1379 (select (arr!1226 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!28858 () Bool)

(declare-fun res!24962 () Bool)

(assert (=> b!28858 (=> res!24962 e!19372)))

(assert (=> b!28858 (= res!24962 (not (invariant!0 (currentBit!2417 (_2!1636 lt!40928)) (currentByte!2422 (_2!1636 lt!40928)) (size!763 (buf!1091 (_2!1636 lt!40928))))))))

(declare-fun b!28859 () Bool)

(assert (=> b!28859 (= e!19376 (= lt!40936 (bvsub (bvsub (bvadd (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!40928))) (currentByte!2422 (_2!1636 lt!40928)) (currentBit!2417 (_2!1636 lt!40928))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!28860 () Bool)

(declare-fun res!24974 () Bool)

(assert (=> b!28860 (=> res!24974 e!19371)))

(declare-fun length!104 (List!378) Int)

(assert (=> b!28860 (= res!24974 (<= (length!104 lt!40933) 0))))

(declare-fun b!28861 () Bool)

(declare-fun head!215 (List!378) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1354 array!1760 (_ BitVec 64) (_ BitVec 64)) List!378)

(assert (=> b!28861 (= e!19375 (= (head!215 (byteArrayBitContentToList!0 (_2!1636 lt!40928) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!215 (bitStreamReadBitsIntoList!0 (_2!1636 lt!40928) (_1!1637 lt!40926) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!6134 res!24965) b!28849))

(assert (= (and b!28849 res!24966) b!28853))

(assert (= (and b!28853 (not res!24967)) b!28857))

(assert (= (and b!28857 (not res!24972)) b!28848))

(assert (= (and b!28848 res!24975) b!28861))

(assert (= (and b!28848 (not res!24970)) b!28850))

(assert (= (and b!28850 (not res!24971)) b!28846))

(assert (= (and b!28846 (not res!24964)) b!28856))

(assert (= (and b!28856 (not res!24961)) b!28854))

(assert (= (and b!28854 res!24969) b!28859))

(assert (= (and b!28854 (not res!24973)) b!28858))

(assert (= (and b!28858 (not res!24962)) b!28851))

(assert (= (and b!28851 (not res!24963)) b!28855))

(assert (= (and b!28855 (not res!24968)) b!28860))

(assert (= (and b!28860 (not res!24974)) b!28852))

(assert (= start!6134 b!28847))

(declare-fun m!41535 () Bool)

(assert (=> b!28857 m!41535))

(declare-fun m!41537 () Bool)

(assert (=> b!28857 m!41537))

(declare-fun m!41539 () Bool)

(assert (=> b!28857 m!41539))

(declare-fun m!41541 () Bool)

(assert (=> b!28857 m!41541))

(assert (=> b!28857 m!41537))

(declare-fun m!41543 () Bool)

(assert (=> b!28857 m!41543))

(declare-fun m!41545 () Bool)

(assert (=> start!6134 m!41545))

(declare-fun m!41547 () Bool)

(assert (=> start!6134 m!41547))

(declare-fun m!41549 () Bool)

(assert (=> b!28855 m!41549))

(declare-fun m!41551 () Bool)

(assert (=> b!28855 m!41551))

(declare-fun m!41553 () Bool)

(assert (=> b!28855 m!41553))

(declare-fun m!41555 () Bool)

(assert (=> b!28855 m!41555))

(declare-fun m!41557 () Bool)

(assert (=> b!28855 m!41557))

(declare-fun m!41559 () Bool)

(assert (=> b!28855 m!41559))

(declare-fun m!41561 () Bool)

(assert (=> b!28855 m!41561))

(declare-fun m!41563 () Bool)

(assert (=> b!28855 m!41563))

(declare-fun m!41565 () Bool)

(assert (=> b!28850 m!41565))

(declare-fun m!41567 () Bool)

(assert (=> b!28853 m!41567))

(declare-fun m!41569 () Bool)

(assert (=> b!28853 m!41569))

(declare-fun m!41571 () Bool)

(assert (=> b!28853 m!41571))

(declare-fun m!41573 () Bool)

(assert (=> b!28860 m!41573))

(declare-fun m!41575 () Bool)

(assert (=> b!28846 m!41575))

(declare-fun m!41577 () Bool)

(assert (=> b!28847 m!41577))

(declare-fun m!41579 () Bool)

(assert (=> b!28858 m!41579))

(declare-fun m!41581 () Bool)

(assert (=> b!28849 m!41581))

(declare-fun m!41583 () Bool)

(assert (=> b!28859 m!41583))

(declare-fun m!41585 () Bool)

(assert (=> b!28848 m!41585))

(declare-fun m!41587 () Bool)

(assert (=> b!28848 m!41587))

(declare-fun m!41589 () Bool)

(assert (=> b!28848 m!41589))

(declare-fun m!41591 () Bool)

(assert (=> b!28848 m!41591))

(declare-fun m!41593 () Bool)

(assert (=> b!28848 m!41593))

(declare-fun m!41595 () Bool)

(assert (=> b!28848 m!41595))

(declare-fun m!41597 () Bool)

(assert (=> b!28848 m!41597))

(declare-fun m!41599 () Bool)

(assert (=> b!28851 m!41599))

(declare-fun m!41601 () Bool)

(assert (=> b!28861 m!41601))

(assert (=> b!28861 m!41601))

(declare-fun m!41603 () Bool)

(assert (=> b!28861 m!41603))

(declare-fun m!41605 () Bool)

(assert (=> b!28861 m!41605))

(assert (=> b!28861 m!41605))

(declare-fun m!41607 () Bool)

(assert (=> b!28861 m!41607))

(declare-fun m!41609 () Bool)

(assert (=> b!28852 m!41609))

(declare-fun m!41611 () Bool)

(assert (=> b!28852 m!41611))

(push 1)

(assert (not b!28859))

(assert (not b!28860))

(assert (not b!28855))

(assert (not b!28846))

(assert (not b!28851))

(assert (not b!28849))

(assert (not start!6134))

(assert (not b!28861))

(assert (not b!28848))

(assert (not b!28853))

(assert (not b!28847))

(assert (not b!28858))

(assert (not b!28852))

(assert (not b!28857))

(assert (not b!28850))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8152 () Bool)

(assert (=> d!8152 (= (invariant!0 (currentBit!2417 (_2!1636 lt!40932)) (currentByte!2422 (_2!1636 lt!40932)) (size!763 (buf!1091 (_2!1636 lt!40932)))) (and (bvsge (currentBit!2417 (_2!1636 lt!40932)) #b00000000000000000000000000000000) (bvslt (currentBit!2417 (_2!1636 lt!40932)) #b00000000000000000000000000001000) (bvsge (currentByte!2422 (_2!1636 lt!40932)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2422 (_2!1636 lt!40932)) (size!763 (buf!1091 (_2!1636 lt!40932)))) (and (= (currentBit!2417 (_2!1636 lt!40932)) #b00000000000000000000000000000000) (= (currentByte!2422 (_2!1636 lt!40932)) (size!763 (buf!1091 (_2!1636 lt!40932))))))))))

(assert (=> b!28846 d!8152))

(declare-fun b!29037 () Bool)

(declare-fun e!19493 () Bool)

(declare-fun lt!41192 () List!378)

(declare-fun isEmpty!75 (List!378) Bool)

(assert (=> b!29037 (= e!19493 (isEmpty!75 lt!41192))))

(declare-fun d!8154 () Bool)

(assert (=> d!8154 e!19493))

(declare-fun c!1862 () Bool)

(assert (=> d!8154 (= c!1862 (= lt!40922 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3122 0))(
  ( (tuple2!3123 (_1!1648 List!378) (_2!1648 BitStream!1354)) )
))
(declare-fun e!19492 () tuple2!3122)

(assert (=> d!8154 (= lt!41192 (_1!1648 e!19492))))

(declare-fun c!1863 () Bool)

(assert (=> d!8154 (= c!1863 (= lt!40922 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8154 (bvsge lt!40922 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8154 (= (bitStreamReadBitsIntoList!0 (_2!1636 lt!40932) (_1!1637 lt!40934) lt!40922) lt!41192)))

(declare-fun b!29035 () Bool)

(assert (=> b!29035 (= e!19492 (tuple2!3123 Nil!375 (_1!1637 lt!40934)))))

(declare-fun b!29036 () Bool)

(declare-datatypes ((tuple2!3124 0))(
  ( (tuple2!3125 (_1!1649 Bool) (_2!1649 BitStream!1354)) )
))
(declare-fun lt!41193 () tuple2!3124)

(declare-fun lt!41191 () (_ BitVec 64))

(assert (=> b!29036 (= e!19492 (tuple2!3123 (Cons!374 (_1!1649 lt!41193) (bitStreamReadBitsIntoList!0 (_2!1636 lt!40932) (_2!1649 lt!41193) (bvsub lt!40922 lt!41191))) (_2!1649 lt!41193)))))

(declare-fun readBit!0 (BitStream!1354) tuple2!3124)

(assert (=> b!29036 (= lt!41193 (readBit!0 (_1!1637 lt!40934)))))

(assert (=> b!29036 (= lt!41191 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!29038 () Bool)

(assert (=> b!29038 (= e!19493 (> (length!104 lt!41192) 0))))

(assert (= (and d!8154 c!1863) b!29035))

(assert (= (and d!8154 (not c!1863)) b!29036))

(assert (= (and d!8154 c!1862) b!29037))

(assert (= (and d!8154 (not c!1862)) b!29038))

(declare-fun m!41891 () Bool)

(assert (=> b!29037 m!41891))

(declare-fun m!41893 () Bool)

(assert (=> b!29036 m!41893))

(declare-fun m!41895 () Bool)

(assert (=> b!29036 m!41895))

(declare-fun m!41897 () Bool)

(assert (=> b!29038 m!41897))

(assert (=> b!28855 d!8154))

(declare-fun d!8160 () Bool)

(declare-fun e!19512 () Bool)

(assert (=> d!8160 e!19512))

(declare-fun res!25115 () Bool)

(assert (=> d!8160 (=> (not res!25115) (not e!19512))))

(declare-fun lt!41311 () tuple2!3100)

(assert (=> d!8160 (= res!25115 (isPrefixOf!0 (_1!1637 lt!41311) (_2!1637 lt!41311)))))

(declare-fun lt!41323 () BitStream!1354)

(assert (=> d!8160 (= lt!41311 (tuple2!3101 lt!41323 (_2!1636 lt!40932)))))

(declare-fun lt!41324 () Unit!2247)

(declare-fun lt!41329 () Unit!2247)

(assert (=> d!8160 (= lt!41324 lt!41329)))

(assert (=> d!8160 (isPrefixOf!0 lt!41323 (_2!1636 lt!40932))))

(assert (=> d!8160 (= lt!41329 (lemmaIsPrefixTransitive!0 lt!41323 (_2!1636 lt!40932) (_2!1636 lt!40932)))))

(declare-fun lt!41317 () Unit!2247)

(declare-fun lt!41313 () Unit!2247)

(assert (=> d!8160 (= lt!41317 lt!41313)))

(assert (=> d!8160 (isPrefixOf!0 lt!41323 (_2!1636 lt!40932))))

(assert (=> d!8160 (= lt!41313 (lemmaIsPrefixTransitive!0 lt!41323 thiss!1379 (_2!1636 lt!40932)))))

(declare-fun lt!41318 () Unit!2247)

(declare-fun e!19513 () Unit!2247)

(assert (=> d!8160 (= lt!41318 e!19513)))

(declare-fun c!1877 () Bool)

(assert (=> d!8160 (= c!1877 (not (= (size!763 (buf!1091 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!41326 () Unit!2247)

(declare-fun lt!41325 () Unit!2247)

(assert (=> d!8160 (= lt!41326 lt!41325)))

(assert (=> d!8160 (isPrefixOf!0 (_2!1636 lt!40932) (_2!1636 lt!40932))))

(assert (=> d!8160 (= lt!41325 (lemmaIsPrefixRefl!0 (_2!1636 lt!40932)))))

(declare-fun lt!41322 () Unit!2247)

(declare-fun lt!41310 () Unit!2247)

(assert (=> d!8160 (= lt!41322 lt!41310)))

(assert (=> d!8160 (= lt!41310 (lemmaIsPrefixRefl!0 (_2!1636 lt!40932)))))

(declare-fun lt!41314 () Unit!2247)

(declare-fun lt!41321 () Unit!2247)

(assert (=> d!8160 (= lt!41314 lt!41321)))

(assert (=> d!8160 (isPrefixOf!0 lt!41323 lt!41323)))

(assert (=> d!8160 (= lt!41321 (lemmaIsPrefixRefl!0 lt!41323))))

(declare-fun lt!41327 () Unit!2247)

(declare-fun lt!41328 () Unit!2247)

(assert (=> d!8160 (= lt!41327 lt!41328)))

(assert (=> d!8160 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8160 (= lt!41328 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8160 (= lt!41323 (BitStream!1355 (buf!1091 (_2!1636 lt!40932)) (currentByte!2422 thiss!1379) (currentBit!2417 thiss!1379)))))

(assert (=> d!8160 (isPrefixOf!0 thiss!1379 (_2!1636 lt!40932))))

(assert (=> d!8160 (= (reader!0 thiss!1379 (_2!1636 lt!40932)) lt!41311)))

(declare-fun b!29080 () Bool)

(declare-fun lt!41320 () Unit!2247)

(assert (=> b!29080 (= e!19513 lt!41320)))

(declare-fun lt!41312 () (_ BitVec 64))

(assert (=> b!29080 (= lt!41312 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41319 () (_ BitVec 64))

(assert (=> b!29080 (= lt!41319 (bitIndex!0 (size!763 (buf!1091 thiss!1379)) (currentByte!2422 thiss!1379) (currentBit!2417 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1760 array!1760 (_ BitVec 64) (_ BitVec 64)) Unit!2247)

(assert (=> b!29080 (= lt!41320 (arrayBitRangesEqSymmetric!0 (buf!1091 thiss!1379) (buf!1091 (_2!1636 lt!40932)) lt!41312 lt!41319))))

(declare-fun arrayBitRangesEq!0 (array!1760 array!1760 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!29080 (arrayBitRangesEq!0 (buf!1091 (_2!1636 lt!40932)) (buf!1091 thiss!1379) lt!41312 lt!41319)))

(declare-fun b!29081 () Bool)

(declare-fun res!25116 () Bool)

(assert (=> b!29081 (=> (not res!25116) (not e!19512))))

(assert (=> b!29081 (= res!25116 (isPrefixOf!0 (_1!1637 lt!41311) thiss!1379))))

(declare-fun b!29082 () Bool)

(declare-fun lt!41315 () (_ BitVec 64))

(declare-fun lt!41316 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1354 (_ BitVec 64)) BitStream!1354)

(assert (=> b!29082 (= e!19512 (= (_1!1637 lt!41311) (withMovedBitIndex!0 (_2!1637 lt!41311) (bvsub lt!41315 lt!41316))))))

(assert (=> b!29082 (or (= (bvand lt!41315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41316 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!41315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!41315 lt!41316) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29082 (= lt!41316 (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!40932))) (currentByte!2422 (_2!1636 lt!40932)) (currentBit!2417 (_2!1636 lt!40932))))))

(assert (=> b!29082 (= lt!41315 (bitIndex!0 (size!763 (buf!1091 thiss!1379)) (currentByte!2422 thiss!1379) (currentBit!2417 thiss!1379)))))

(declare-fun b!29083 () Bool)

(declare-fun Unit!2265 () Unit!2247)

(assert (=> b!29083 (= e!19513 Unit!2265)))

(declare-fun b!29084 () Bool)

(declare-fun res!25114 () Bool)

(assert (=> b!29084 (=> (not res!25114) (not e!19512))))

(assert (=> b!29084 (= res!25114 (isPrefixOf!0 (_2!1637 lt!41311) (_2!1636 lt!40932)))))

(assert (= (and d!8160 c!1877) b!29080))

(assert (= (and d!8160 (not c!1877)) b!29083))

(assert (= (and d!8160 res!25115) b!29081))

(assert (= (and b!29081 res!25116) b!29084))

(assert (= (and b!29084 res!25114) b!29082))

(declare-fun m!41943 () Bool)

(assert (=> d!8160 m!41943))

(declare-fun m!41947 () Bool)

(assert (=> d!8160 m!41947))

(declare-fun m!41949 () Bool)

(assert (=> d!8160 m!41949))

(declare-fun m!41951 () Bool)

(assert (=> d!8160 m!41951))

(assert (=> d!8160 m!41595))

(declare-fun m!41953 () Bool)

(assert (=> d!8160 m!41953))

(assert (=> d!8160 m!41567))

(declare-fun m!41955 () Bool)

(assert (=> d!8160 m!41955))

(assert (=> d!8160 m!41569))

(declare-fun m!41957 () Bool)

(assert (=> d!8160 m!41957))

(declare-fun m!41959 () Bool)

(assert (=> d!8160 m!41959))

(declare-fun m!41961 () Bool)

(assert (=> b!29082 m!41961))

(assert (=> b!29082 m!41565))

(assert (=> b!29082 m!41571))

(assert (=> b!29080 m!41571))

(declare-fun m!41963 () Bool)

(assert (=> b!29080 m!41963))

(declare-fun m!41965 () Bool)

(assert (=> b!29080 m!41965))

(declare-fun m!41967 () Bool)

(assert (=> b!29084 m!41967))

(declare-fun m!41969 () Bool)

(assert (=> b!29081 m!41969))

(assert (=> b!28855 d!8160))

(declare-fun b!29087 () Bool)

(declare-fun e!19515 () Bool)

(declare-fun lt!41331 () List!378)

(assert (=> b!29087 (= e!19515 (isEmpty!75 lt!41331))))

(declare-fun d!8172 () Bool)

(assert (=> d!8172 e!19515))

(declare-fun c!1878 () Bool)

(assert (=> d!8172 (= c!1878 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!19514 () tuple2!3122)

(assert (=> d!8172 (= lt!41331 (_1!1648 e!19514))))

(declare-fun c!1879 () Bool)

(assert (=> d!8172 (= c!1879 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8172 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8172 (= (bitStreamReadBitsIntoList!0 (_2!1636 lt!40932) (_1!1637 lt!40925) (bvsub to!314 i!635)) lt!41331)))

(declare-fun b!29085 () Bool)

(assert (=> b!29085 (= e!19514 (tuple2!3123 Nil!375 (_1!1637 lt!40925)))))

(declare-fun b!29086 () Bool)

(declare-fun lt!41332 () tuple2!3124)

(declare-fun lt!41330 () (_ BitVec 64))

(assert (=> b!29086 (= e!19514 (tuple2!3123 (Cons!374 (_1!1649 lt!41332) (bitStreamReadBitsIntoList!0 (_2!1636 lt!40932) (_2!1649 lt!41332) (bvsub (bvsub to!314 i!635) lt!41330))) (_2!1649 lt!41332)))))

(assert (=> b!29086 (= lt!41332 (readBit!0 (_1!1637 lt!40925)))))

(assert (=> b!29086 (= lt!41330 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!29088 () Bool)

(assert (=> b!29088 (= e!19515 (> (length!104 lt!41331) 0))))

(assert (= (and d!8172 c!1879) b!29085))

(assert (= (and d!8172 (not c!1879)) b!29086))

(assert (= (and d!8172 c!1878) b!29087))

(assert (= (and d!8172 (not c!1878)) b!29088))

(declare-fun m!41973 () Bool)

(assert (=> b!29087 m!41973))

(declare-fun m!41975 () Bool)

(assert (=> b!29086 m!41975))

(declare-fun m!41977 () Bool)

(assert (=> b!29086 m!41977))

(declare-fun m!41979 () Bool)

(assert (=> b!29088 m!41979))

(assert (=> b!28855 d!8172))

(declare-fun d!8176 () Bool)

(declare-fun e!19518 () Bool)

(assert (=> d!8176 e!19518))

(declare-fun res!25121 () Bool)

(assert (=> d!8176 (=> (not res!25121) (not e!19518))))

(declare-fun lt!41354 () tuple2!3100)

(assert (=> d!8176 (= res!25121 (isPrefixOf!0 (_1!1637 lt!41354) (_2!1637 lt!41354)))))

(declare-fun lt!41366 () BitStream!1354)

(assert (=> d!8176 (= lt!41354 (tuple2!3101 lt!41366 (_2!1636 lt!40932)))))

(declare-fun lt!41367 () Unit!2247)

(declare-fun lt!41372 () Unit!2247)

(assert (=> d!8176 (= lt!41367 lt!41372)))

(assert (=> d!8176 (isPrefixOf!0 lt!41366 (_2!1636 lt!40932))))

(assert (=> d!8176 (= lt!41372 (lemmaIsPrefixTransitive!0 lt!41366 (_2!1636 lt!40932) (_2!1636 lt!40932)))))

(declare-fun lt!41360 () Unit!2247)

(declare-fun lt!41356 () Unit!2247)

(assert (=> d!8176 (= lt!41360 lt!41356)))

(assert (=> d!8176 (isPrefixOf!0 lt!41366 (_2!1636 lt!40932))))

(assert (=> d!8176 (= lt!41356 (lemmaIsPrefixTransitive!0 lt!41366 (_2!1636 lt!40928) (_2!1636 lt!40932)))))

(declare-fun lt!41361 () Unit!2247)

(declare-fun e!19519 () Unit!2247)

(assert (=> d!8176 (= lt!41361 e!19519)))

(declare-fun c!1881 () Bool)

(assert (=> d!8176 (= c!1881 (not (= (size!763 (buf!1091 (_2!1636 lt!40928))) #b00000000000000000000000000000000)))))

(declare-fun lt!41369 () Unit!2247)

(declare-fun lt!41368 () Unit!2247)

(assert (=> d!8176 (= lt!41369 lt!41368)))

(assert (=> d!8176 (isPrefixOf!0 (_2!1636 lt!40932) (_2!1636 lt!40932))))

(assert (=> d!8176 (= lt!41368 (lemmaIsPrefixRefl!0 (_2!1636 lt!40932)))))

(declare-fun lt!41365 () Unit!2247)

(declare-fun lt!41353 () Unit!2247)

(assert (=> d!8176 (= lt!41365 lt!41353)))

(assert (=> d!8176 (= lt!41353 (lemmaIsPrefixRefl!0 (_2!1636 lt!40932)))))

(declare-fun lt!41357 () Unit!2247)

(declare-fun lt!41364 () Unit!2247)

(assert (=> d!8176 (= lt!41357 lt!41364)))

(assert (=> d!8176 (isPrefixOf!0 lt!41366 lt!41366)))

(assert (=> d!8176 (= lt!41364 (lemmaIsPrefixRefl!0 lt!41366))))

(declare-fun lt!41370 () Unit!2247)

(declare-fun lt!41371 () Unit!2247)

(assert (=> d!8176 (= lt!41370 lt!41371)))

(assert (=> d!8176 (isPrefixOf!0 (_2!1636 lt!40928) (_2!1636 lt!40928))))

(assert (=> d!8176 (= lt!41371 (lemmaIsPrefixRefl!0 (_2!1636 lt!40928)))))

(assert (=> d!8176 (= lt!41366 (BitStream!1355 (buf!1091 (_2!1636 lt!40932)) (currentByte!2422 (_2!1636 lt!40928)) (currentBit!2417 (_2!1636 lt!40928))))))

(assert (=> d!8176 (isPrefixOf!0 (_2!1636 lt!40928) (_2!1636 lt!40932))))

(assert (=> d!8176 (= (reader!0 (_2!1636 lt!40928) (_2!1636 lt!40932)) lt!41354)))

(declare-fun b!29094 () Bool)

(declare-fun lt!41363 () Unit!2247)

(assert (=> b!29094 (= e!19519 lt!41363)))

(declare-fun lt!41355 () (_ BitVec 64))

(assert (=> b!29094 (= lt!41355 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41362 () (_ BitVec 64))

(assert (=> b!29094 (= lt!41362 (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!40928))) (currentByte!2422 (_2!1636 lt!40928)) (currentBit!2417 (_2!1636 lt!40928))))))

(assert (=> b!29094 (= lt!41363 (arrayBitRangesEqSymmetric!0 (buf!1091 (_2!1636 lt!40928)) (buf!1091 (_2!1636 lt!40932)) lt!41355 lt!41362))))

(assert (=> b!29094 (arrayBitRangesEq!0 (buf!1091 (_2!1636 lt!40932)) (buf!1091 (_2!1636 lt!40928)) lt!41355 lt!41362)))

(declare-fun b!29095 () Bool)

(declare-fun res!25122 () Bool)

(assert (=> b!29095 (=> (not res!25122) (not e!19518))))

(assert (=> b!29095 (= res!25122 (isPrefixOf!0 (_1!1637 lt!41354) (_2!1636 lt!40928)))))

(declare-fun lt!41359 () (_ BitVec 64))

(declare-fun b!29096 () Bool)

(declare-fun lt!41358 () (_ BitVec 64))

(assert (=> b!29096 (= e!19518 (= (_1!1637 lt!41354) (withMovedBitIndex!0 (_2!1637 lt!41354) (bvsub lt!41358 lt!41359))))))

(assert (=> b!29096 (or (= (bvand lt!41358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41359 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!41358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!41358 lt!41359) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29096 (= lt!41359 (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!40932))) (currentByte!2422 (_2!1636 lt!40932)) (currentBit!2417 (_2!1636 lt!40932))))))

(assert (=> b!29096 (= lt!41358 (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!40928))) (currentByte!2422 (_2!1636 lt!40928)) (currentBit!2417 (_2!1636 lt!40928))))))

(declare-fun b!29097 () Bool)

(declare-fun Unit!2266 () Unit!2247)

(assert (=> b!29097 (= e!19519 Unit!2266)))

(declare-fun b!29098 () Bool)

(declare-fun res!25120 () Bool)

(assert (=> b!29098 (=> (not res!25120) (not e!19518))))

(assert (=> b!29098 (= res!25120 (isPrefixOf!0 (_2!1637 lt!41354) (_2!1636 lt!40932)))))

(assert (= (and d!8176 c!1881) b!29094))

(assert (= (and d!8176 (not c!1881)) b!29097))

(assert (= (and d!8176 res!25121) b!29095))

(assert (= (and b!29095 res!25122) b!29098))

(assert (= (and b!29098 res!25120) b!29096))

(declare-fun m!42007 () Bool)

(assert (=> d!8176 m!42007))

(declare-fun m!42009 () Bool)

(assert (=> d!8176 m!42009))

(assert (=> d!8176 m!41949))

(assert (=> d!8176 m!41951))

(assert (=> d!8176 m!41587))

(declare-fun m!42011 () Bool)

(assert (=> d!8176 m!42011))

(declare-fun m!42013 () Bool)

(assert (=> d!8176 m!42013))

(declare-fun m!42015 () Bool)

(assert (=> d!8176 m!42015))

(declare-fun m!42017 () Bool)

(assert (=> d!8176 m!42017))

(declare-fun m!42019 () Bool)

(assert (=> d!8176 m!42019))

(declare-fun m!42021 () Bool)

(assert (=> d!8176 m!42021))

(declare-fun m!42025 () Bool)

(assert (=> b!29096 m!42025))

(assert (=> b!29096 m!41565))

(assert (=> b!29096 m!41583))

(assert (=> b!29094 m!41583))

(declare-fun m!42027 () Bool)

(assert (=> b!29094 m!42027))

(declare-fun m!42029 () Bool)

(assert (=> b!29094 m!42029))

(declare-fun m!42031 () Bool)

(assert (=> b!29098 m!42031))

(declare-fun m!42035 () Bool)

(assert (=> b!29095 m!42035))

(assert (=> b!28855 d!8176))

(declare-fun d!8184 () Bool)

(assert (=> d!8184 (validate_offset_bits!1 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40932)))) ((_ sign_extend 32) (currentByte!2422 (_2!1636 lt!40928))) ((_ sign_extend 32) (currentBit!2417 (_2!1636 lt!40928))) lt!40922)))

(declare-fun lt!41375 () Unit!2247)

(declare-fun choose!9 (BitStream!1354 array!1760 (_ BitVec 64) BitStream!1354) Unit!2247)

(assert (=> d!8184 (= lt!41375 (choose!9 (_2!1636 lt!40928) (buf!1091 (_2!1636 lt!40932)) lt!40922 (BitStream!1355 (buf!1091 (_2!1636 lt!40932)) (currentByte!2422 (_2!1636 lt!40928)) (currentBit!2417 (_2!1636 lt!40928)))))))

(assert (=> d!8184 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1636 lt!40928) (buf!1091 (_2!1636 lt!40932)) lt!40922) lt!41375)))

(declare-fun bs!2342 () Bool)

(assert (= bs!2342 d!8184))

(assert (=> bs!2342 m!41561))

(declare-fun m!42037 () Bool)

(assert (=> bs!2342 m!42037))

(assert (=> b!28855 d!8184))

(declare-fun d!8186 () Bool)

(assert (=> d!8186 (validate_offset_bits!1 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40932)))) ((_ sign_extend 32) (currentByte!2422 thiss!1379)) ((_ sign_extend 32) (currentBit!2417 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!41376 () Unit!2247)

(assert (=> d!8186 (= lt!41376 (choose!9 thiss!1379 (buf!1091 (_2!1636 lt!40932)) (bvsub to!314 i!635) (BitStream!1355 (buf!1091 (_2!1636 lt!40932)) (currentByte!2422 thiss!1379) (currentBit!2417 thiss!1379))))))

(assert (=> d!8186 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1091 (_2!1636 lt!40932)) (bvsub to!314 i!635)) lt!41376)))

(declare-fun bs!2343 () Bool)

(assert (= bs!2343 d!8186))

(assert (=> bs!2343 m!41559))

(declare-fun m!42039 () Bool)

(assert (=> bs!2343 m!42039))

(assert (=> b!28855 d!8186))

(declare-fun d!8188 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!8188 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40932)))) ((_ sign_extend 32) (currentByte!2422 thiss!1379)) ((_ sign_extend 32) (currentBit!2417 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40932)))) ((_ sign_extend 32) (currentByte!2422 thiss!1379)) ((_ sign_extend 32) (currentBit!2417 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2344 () Bool)

(assert (= bs!2344 d!8188))

(declare-fun m!42041 () Bool)

(assert (=> bs!2344 m!42041))

(assert (=> b!28855 d!8188))

(declare-fun d!8190 () Bool)

(assert (=> d!8190 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40932)))) ((_ sign_extend 32) (currentByte!2422 (_2!1636 lt!40928))) ((_ sign_extend 32) (currentBit!2417 (_2!1636 lt!40928))) lt!40922) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40932)))) ((_ sign_extend 32) (currentByte!2422 (_2!1636 lt!40928))) ((_ sign_extend 32) (currentBit!2417 (_2!1636 lt!40928)))) lt!40922))))

(declare-fun bs!2345 () Bool)

(assert (= bs!2345 d!8190))

(declare-fun m!42043 () Bool)

(assert (=> bs!2345 m!42043))

(assert (=> b!28855 d!8190))

(declare-fun d!8192 () Bool)

(declare-fun res!25137 () Bool)

(declare-fun e!19528 () Bool)

(assert (=> d!8192 (=> (not res!25137) (not e!19528))))

(assert (=> d!8192 (= res!25137 (= (size!763 (buf!1091 thiss!1379)) (size!763 (buf!1091 thiss!1379))))))

(assert (=> d!8192 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!19528)))

(declare-fun b!29111 () Bool)

(declare-fun res!25136 () Bool)

(assert (=> b!29111 (=> (not res!25136) (not e!19528))))

(assert (=> b!29111 (= res!25136 (bvsle (bitIndex!0 (size!763 (buf!1091 thiss!1379)) (currentByte!2422 thiss!1379) (currentBit!2417 thiss!1379)) (bitIndex!0 (size!763 (buf!1091 thiss!1379)) (currentByte!2422 thiss!1379) (currentBit!2417 thiss!1379))))))

(declare-fun b!29112 () Bool)

(declare-fun e!19527 () Bool)

(assert (=> b!29112 (= e!19528 e!19527)))

(declare-fun res!25135 () Bool)

(assert (=> b!29112 (=> res!25135 e!19527)))

(assert (=> b!29112 (= res!25135 (= (size!763 (buf!1091 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!29113 () Bool)

(assert (=> b!29113 (= e!19527 (arrayBitRangesEq!0 (buf!1091 thiss!1379) (buf!1091 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!763 (buf!1091 thiss!1379)) (currentByte!2422 thiss!1379) (currentBit!2417 thiss!1379))))))

(assert (= (and d!8192 res!25137) b!29111))

(assert (= (and b!29111 res!25136) b!29112))

(assert (= (and b!29112 (not res!25135)) b!29113))

(assert (=> b!29111 m!41571))

(assert (=> b!29111 m!41571))

(assert (=> b!29113 m!41571))

(assert (=> b!29113 m!41571))

(declare-fun m!42047 () Bool)

(assert (=> b!29113 m!42047))

(assert (=> b!28853 d!8192))

(declare-fun d!8198 () Bool)

(assert (=> d!8198 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!41397 () Unit!2247)

(declare-fun choose!11 (BitStream!1354) Unit!2247)

(assert (=> d!8198 (= lt!41397 (choose!11 thiss!1379))))

(assert (=> d!8198 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!41397)))

(declare-fun bs!2348 () Bool)

(assert (= bs!2348 d!8198))

(assert (=> bs!2348 m!41567))

(declare-fun m!42051 () Bool)

(assert (=> bs!2348 m!42051))

(assert (=> b!28853 d!8198))

(declare-fun d!8204 () Bool)

(declare-fun e!19544 () Bool)

(assert (=> d!8204 e!19544))

(declare-fun res!25154 () Bool)

(assert (=> d!8204 (=> (not res!25154) (not e!19544))))

(declare-fun lt!41416 () (_ BitVec 64))

(declare-fun lt!41418 () (_ BitVec 64))

(declare-fun lt!41420 () (_ BitVec 64))

(assert (=> d!8204 (= res!25154 (= lt!41420 (bvsub lt!41418 lt!41416)))))

(assert (=> d!8204 (or (= (bvand lt!41418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41416 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!41418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!41418 lt!41416) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8204 (= lt!41416 (remainingBits!0 ((_ sign_extend 32) (size!763 (buf!1091 thiss!1379))) ((_ sign_extend 32) (currentByte!2422 thiss!1379)) ((_ sign_extend 32) (currentBit!2417 thiss!1379))))))

(declare-fun lt!41419 () (_ BitVec 64))

(declare-fun lt!41415 () (_ BitVec 64))

(assert (=> d!8204 (= lt!41418 (bvmul lt!41419 lt!41415))))

(assert (=> d!8204 (or (= lt!41419 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!41415 (bvsdiv (bvmul lt!41419 lt!41415) lt!41419)))))

(assert (=> d!8204 (= lt!41415 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8204 (= lt!41419 ((_ sign_extend 32) (size!763 (buf!1091 thiss!1379))))))

(assert (=> d!8204 (= lt!41420 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2422 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2417 thiss!1379))))))

(assert (=> d!8204 (invariant!0 (currentBit!2417 thiss!1379) (currentByte!2422 thiss!1379) (size!763 (buf!1091 thiss!1379)))))

(assert (=> d!8204 (= (bitIndex!0 (size!763 (buf!1091 thiss!1379)) (currentByte!2422 thiss!1379) (currentBit!2417 thiss!1379)) lt!41420)))

(declare-fun b!29139 () Bool)

(declare-fun res!25153 () Bool)

(assert (=> b!29139 (=> (not res!25153) (not e!19544))))

(assert (=> b!29139 (= res!25153 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!41420))))

(declare-fun b!29140 () Bool)

(declare-fun lt!41417 () (_ BitVec 64))

(assert (=> b!29140 (= e!19544 (bvsle lt!41420 (bvmul lt!41417 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!29140 (or (= lt!41417 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!41417 #b0000000000000000000000000000000000000000000000000000000000001000) lt!41417)))))

(assert (=> b!29140 (= lt!41417 ((_ sign_extend 32) (size!763 (buf!1091 thiss!1379))))))

(assert (= (and d!8204 res!25154) b!29139))

(assert (= (and b!29139 res!25153) b!29140))

(declare-fun m!42067 () Bool)

(assert (=> d!8204 m!42067))

(declare-fun m!42069 () Bool)

(assert (=> d!8204 m!42069))

(assert (=> b!28853 d!8204))

(declare-fun d!8216 () Bool)

(assert (=> d!8216 (= (tail!95 lt!40933) (t!1128 lt!40933))))

(assert (=> b!28852 d!8216))

(declare-fun d!8218 () Bool)

(declare-fun e!19548 () Bool)

(assert (=> d!8218 e!19548))

(declare-fun res!25158 () Bool)

(assert (=> d!8218 (=> (not res!25158) (not e!19548))))

(declare-fun lt!41427 () (_ BitVec 64))

(assert (=> d!8218 (= res!25158 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41427 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!41427) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!8218 (= lt!41427 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!41426 () Unit!2247)

(declare-fun choose!42 (BitStream!1354 BitStream!1354 BitStream!1354 BitStream!1354 (_ BitVec 64) List!378) Unit!2247)

(assert (=> d!8218 (= lt!41426 (choose!42 (_2!1636 lt!40932) (_2!1636 lt!40932) (_1!1637 lt!40925) (_1!1637 lt!40934) (bvsub to!314 i!635) lt!40933))))

(assert (=> d!8218 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8218 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1636 lt!40932) (_2!1636 lt!40932) (_1!1637 lt!40925) (_1!1637 lt!40934) (bvsub to!314 i!635) lt!40933) lt!41426)))

(declare-fun b!29144 () Bool)

(assert (=> b!29144 (= e!19548 (= (bitStreamReadBitsIntoList!0 (_2!1636 lt!40932) (_1!1637 lt!40934) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!95 lt!40933)))))

(assert (= (and d!8218 res!25158) b!29144))

(declare-fun m!42075 () Bool)

(assert (=> d!8218 m!42075))

(declare-fun m!42077 () Bool)

(assert (=> b!29144 m!42077))

(assert (=> b!29144 m!41609))

(assert (=> b!28852 d!8218))

(declare-fun d!8222 () Bool)

(assert (=> d!8222 (= (invariant!0 (currentBit!2417 (_2!1636 lt!40928)) (currentByte!2422 (_2!1636 lt!40928)) (size!763 (buf!1091 (_2!1636 lt!40932)))) (and (bvsge (currentBit!2417 (_2!1636 lt!40928)) #b00000000000000000000000000000000) (bvslt (currentBit!2417 (_2!1636 lt!40928)) #b00000000000000000000000000001000) (bvsge (currentByte!2422 (_2!1636 lt!40928)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2422 (_2!1636 lt!40928)) (size!763 (buf!1091 (_2!1636 lt!40932)))) (and (= (currentBit!2417 (_2!1636 lt!40928)) #b00000000000000000000000000000000) (= (currentByte!2422 (_2!1636 lt!40928)) (size!763 (buf!1091 (_2!1636 lt!40932))))))))))

(assert (=> b!28851 d!8222))

(declare-fun d!8224 () Bool)

(assert (=> d!8224 (= (head!215 (byteArrayBitContentToList!0 (_2!1636 lt!40928) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!493 (byteArrayBitContentToList!0 (_2!1636 lt!40928) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!28861 d!8224))

(declare-fun d!8226 () Bool)

(declare-fun c!1889 () Bool)

(assert (=> d!8226 (= c!1889 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!19551 () List!378)

(assert (=> d!8226 (= (byteArrayBitContentToList!0 (_2!1636 lt!40928) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!19551)))

(declare-fun b!29149 () Bool)

(assert (=> b!29149 (= e!19551 Nil!375)))

(declare-fun b!29150 () Bool)

(assert (=> b!29150 (= e!19551 (Cons!374 (not (= (bvand ((_ sign_extend 24) (select (arr!1226 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1636 lt!40928) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!8226 c!1889) b!29149))

(assert (= (and d!8226 (not c!1889)) b!29150))

(assert (=> b!29150 m!41537))

(declare-fun m!42079 () Bool)

(assert (=> b!29150 m!42079))

(declare-fun m!42081 () Bool)

(assert (=> b!29150 m!42081))

(assert (=> b!28861 d!8226))

(declare-fun d!8228 () Bool)

(assert (=> d!8228 (= (head!215 (bitStreamReadBitsIntoList!0 (_2!1636 lt!40928) (_1!1637 lt!40926) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!493 (bitStreamReadBitsIntoList!0 (_2!1636 lt!40928) (_1!1637 lt!40926) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!28861 d!8228))

(declare-fun b!29153 () Bool)

(declare-fun e!19553 () Bool)

(declare-fun lt!41429 () List!378)

(assert (=> b!29153 (= e!19553 (isEmpty!75 lt!41429))))

(declare-fun d!8230 () Bool)

(assert (=> d!8230 e!19553))

(declare-fun c!1890 () Bool)

(assert (=> d!8230 (= c!1890 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!19552 () tuple2!3122)

(assert (=> d!8230 (= lt!41429 (_1!1648 e!19552))))

(declare-fun c!1891 () Bool)

(assert (=> d!8230 (= c!1891 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8230 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8230 (= (bitStreamReadBitsIntoList!0 (_2!1636 lt!40928) (_1!1637 lt!40926) #b0000000000000000000000000000000000000000000000000000000000000001) lt!41429)))

(declare-fun b!29151 () Bool)

(assert (=> b!29151 (= e!19552 (tuple2!3123 Nil!375 (_1!1637 lt!40926)))))

(declare-fun lt!41428 () (_ BitVec 64))

(declare-fun lt!41430 () tuple2!3124)

(declare-fun b!29152 () Bool)

(assert (=> b!29152 (= e!19552 (tuple2!3123 (Cons!374 (_1!1649 lt!41430) (bitStreamReadBitsIntoList!0 (_2!1636 lt!40928) (_2!1649 lt!41430) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!41428))) (_2!1649 lt!41430)))))

(assert (=> b!29152 (= lt!41430 (readBit!0 (_1!1637 lt!40926)))))

(assert (=> b!29152 (= lt!41428 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!29154 () Bool)

(assert (=> b!29154 (= e!19553 (> (length!104 lt!41429) 0))))

(assert (= (and d!8230 c!1891) b!29151))

(assert (= (and d!8230 (not c!1891)) b!29152))

(assert (= (and d!8230 c!1890) b!29153))

(assert (= (and d!8230 (not c!1890)) b!29154))

(declare-fun m!42083 () Bool)

(assert (=> b!29153 m!42083))

(declare-fun m!42085 () Bool)

(assert (=> b!29152 m!42085))

(declare-fun m!42087 () Bool)

(assert (=> b!29152 m!42087))

(declare-fun m!42089 () Bool)

(assert (=> b!29154 m!42089))

(assert (=> b!28861 d!8230))

(declare-fun d!8232 () Bool)

(declare-fun e!19554 () Bool)

(assert (=> d!8232 e!19554))

(declare-fun res!25160 () Bool)

(assert (=> d!8232 (=> (not res!25160) (not e!19554))))

(declare-fun lt!41432 () (_ BitVec 64))

(declare-fun lt!41434 () (_ BitVec 64))

(declare-fun lt!41436 () (_ BitVec 64))

(assert (=> d!8232 (= res!25160 (= lt!41436 (bvsub lt!41434 lt!41432)))))

(assert (=> d!8232 (or (= (bvand lt!41434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41432 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!41434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!41434 lt!41432) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8232 (= lt!41432 (remainingBits!0 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40932)))) ((_ sign_extend 32) (currentByte!2422 (_2!1636 lt!40932))) ((_ sign_extend 32) (currentBit!2417 (_2!1636 lt!40932)))))))

(declare-fun lt!41435 () (_ BitVec 64))

(declare-fun lt!41431 () (_ BitVec 64))

(assert (=> d!8232 (= lt!41434 (bvmul lt!41435 lt!41431))))

(assert (=> d!8232 (or (= lt!41435 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!41431 (bvsdiv (bvmul lt!41435 lt!41431) lt!41435)))))

(assert (=> d!8232 (= lt!41431 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8232 (= lt!41435 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40932)))))))

(assert (=> d!8232 (= lt!41436 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2422 (_2!1636 lt!40932))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2417 (_2!1636 lt!40932)))))))

(assert (=> d!8232 (invariant!0 (currentBit!2417 (_2!1636 lt!40932)) (currentByte!2422 (_2!1636 lt!40932)) (size!763 (buf!1091 (_2!1636 lt!40932))))))

(assert (=> d!8232 (= (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!40932))) (currentByte!2422 (_2!1636 lt!40932)) (currentBit!2417 (_2!1636 lt!40932))) lt!41436)))

(declare-fun b!29155 () Bool)

(declare-fun res!25159 () Bool)

(assert (=> b!29155 (=> (not res!25159) (not e!19554))))

(assert (=> b!29155 (= res!25159 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!41436))))

(declare-fun b!29156 () Bool)

(declare-fun lt!41433 () (_ BitVec 64))

(assert (=> b!29156 (= e!19554 (bvsle lt!41436 (bvmul lt!41433 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!29156 (or (= lt!41433 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!41433 #b0000000000000000000000000000000000000000000000000000000000001000) lt!41433)))))

(assert (=> b!29156 (= lt!41433 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40932)))))))

(assert (= (and d!8232 res!25160) b!29155))

(assert (= (and b!29155 res!25159) b!29156))

(declare-fun m!42091 () Bool)

(assert (=> d!8232 m!42091))

(assert (=> d!8232 m!41575))

(assert (=> b!28850 d!8232))

(declare-fun d!8234 () Bool)

(declare-fun size!768 (List!378) Int)

(assert (=> d!8234 (= (length!104 lt!40933) (size!768 lt!40933))))

(declare-fun bs!2350 () Bool)

(assert (= bs!2350 d!8234))

(declare-fun m!42093 () Bool)

(assert (=> bs!2350 m!42093))

(assert (=> b!28860 d!8234))

(declare-fun d!8236 () Bool)

(assert (=> d!8236 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!763 (buf!1091 thiss!1379))) ((_ sign_extend 32) (currentByte!2422 thiss!1379)) ((_ sign_extend 32) (currentBit!2417 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!763 (buf!1091 thiss!1379))) ((_ sign_extend 32) (currentByte!2422 thiss!1379)) ((_ sign_extend 32) (currentBit!2417 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2351 () Bool)

(assert (= bs!2351 d!8236))

(assert (=> bs!2351 m!42067))

(assert (=> b!28849 d!8236))

(declare-fun d!8238 () Bool)

(assert (=> d!8238 (= (array_inv!730 srcBuffer!2) (bvsge (size!763 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6134 d!8238))

(declare-fun d!8240 () Bool)

(assert (=> d!8240 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2417 thiss!1379) (currentByte!2422 thiss!1379) (size!763 (buf!1091 thiss!1379))))))

(declare-fun bs!2352 () Bool)

(assert (= bs!2352 d!8240))

(assert (=> bs!2352 m!42069))

(assert (=> start!6134 d!8240))

(declare-fun d!8242 () Bool)

(declare-fun e!19555 () Bool)

(assert (=> d!8242 e!19555))

(declare-fun res!25162 () Bool)

(assert (=> d!8242 (=> (not res!25162) (not e!19555))))

(declare-fun lt!41440 () (_ BitVec 64))

(declare-fun lt!41438 () (_ BitVec 64))

(declare-fun lt!41442 () (_ BitVec 64))

(assert (=> d!8242 (= res!25162 (= lt!41442 (bvsub lt!41440 lt!41438)))))

(assert (=> d!8242 (or (= (bvand lt!41440 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41438 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!41440 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!41440 lt!41438) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8242 (= lt!41438 (remainingBits!0 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40928)))) ((_ sign_extend 32) (currentByte!2422 (_2!1636 lt!40928))) ((_ sign_extend 32) (currentBit!2417 (_2!1636 lt!40928)))))))

(declare-fun lt!41441 () (_ BitVec 64))

(declare-fun lt!41437 () (_ BitVec 64))

(assert (=> d!8242 (= lt!41440 (bvmul lt!41441 lt!41437))))

(assert (=> d!8242 (or (= lt!41441 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!41437 (bvsdiv (bvmul lt!41441 lt!41437) lt!41441)))))

(assert (=> d!8242 (= lt!41437 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8242 (= lt!41441 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40928)))))))

(assert (=> d!8242 (= lt!41442 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2422 (_2!1636 lt!40928))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2417 (_2!1636 lt!40928)))))))

(assert (=> d!8242 (invariant!0 (currentBit!2417 (_2!1636 lt!40928)) (currentByte!2422 (_2!1636 lt!40928)) (size!763 (buf!1091 (_2!1636 lt!40928))))))

(assert (=> d!8242 (= (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!40928))) (currentByte!2422 (_2!1636 lt!40928)) (currentBit!2417 (_2!1636 lt!40928))) lt!41442)))

(declare-fun b!29157 () Bool)

(declare-fun res!25161 () Bool)

(assert (=> b!29157 (=> (not res!25161) (not e!19555))))

(assert (=> b!29157 (= res!25161 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!41442))))

(declare-fun b!29158 () Bool)

(declare-fun lt!41439 () (_ BitVec 64))

(assert (=> b!29158 (= e!19555 (bvsle lt!41442 (bvmul lt!41439 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!29158 (or (= lt!41439 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!41439 #b0000000000000000000000000000000000000000000000000000000000001000) lt!41439)))))

(assert (=> b!29158 (= lt!41439 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40928)))))))

(assert (= (and d!8242 res!25162) b!29157))

(assert (= (and b!29157 res!25161) b!29158))

(declare-fun m!42095 () Bool)

(assert (=> d!8242 m!42095))

(assert (=> d!8242 m!41579))

(assert (=> b!28859 d!8242))

(declare-fun d!8244 () Bool)

(assert (=> d!8244 (validate_offset_bits!1 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40928)))) ((_ sign_extend 32) (currentByte!2422 thiss!1379)) ((_ sign_extend 32) (currentBit!2417 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!41443 () Unit!2247)

(assert (=> d!8244 (= lt!41443 (choose!9 thiss!1379 (buf!1091 (_2!1636 lt!40928)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1355 (buf!1091 (_2!1636 lt!40928)) (currentByte!2422 thiss!1379) (currentBit!2417 thiss!1379))))))

(assert (=> d!8244 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1091 (_2!1636 lt!40928)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!41443)))

(declare-fun bs!2353 () Bool)

(assert (= bs!2353 d!8244))

(assert (=> bs!2353 m!41585))

(declare-fun m!42097 () Bool)

(assert (=> bs!2353 m!42097))

(assert (=> b!28848 d!8244))

(declare-fun d!8246 () Bool)

(assert (=> d!8246 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40928)))) ((_ sign_extend 32) (currentByte!2422 thiss!1379)) ((_ sign_extend 32) (currentBit!2417 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40928)))) ((_ sign_extend 32) (currentByte!2422 thiss!1379)) ((_ sign_extend 32) (currentBit!2417 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2354 () Bool)

(assert (= bs!2354 d!8246))

(declare-fun m!42099 () Bool)

(assert (=> bs!2354 m!42099))

(assert (=> b!28848 d!8246))

(declare-fun d!8248 () Bool)

(assert (=> d!8248 (isPrefixOf!0 thiss!1379 (_2!1636 lt!40932))))

(declare-fun lt!41446 () Unit!2247)

(declare-fun choose!30 (BitStream!1354 BitStream!1354 BitStream!1354) Unit!2247)

(assert (=> d!8248 (= lt!41446 (choose!30 thiss!1379 (_2!1636 lt!40928) (_2!1636 lt!40932)))))

(assert (=> d!8248 (isPrefixOf!0 thiss!1379 (_2!1636 lt!40928))))

(assert (=> d!8248 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1636 lt!40928) (_2!1636 lt!40932)) lt!41446)))

(declare-fun bs!2355 () Bool)

(assert (= bs!2355 d!8248))

(assert (=> bs!2355 m!41595))

(declare-fun m!42101 () Bool)

(assert (=> bs!2355 m!42101))

(assert (=> bs!2355 m!41539))

(assert (=> b!28848 d!8248))

(declare-fun b!29310 () Bool)

(declare-fun res!25294 () Bool)

(declare-fun e!19629 () Bool)

(assert (=> b!29310 (=> (not res!25294) (not e!19629))))

(declare-fun lt!41949 () tuple2!3098)

(assert (=> b!29310 (= res!25294 (invariant!0 (currentBit!2417 (_2!1636 lt!41949)) (currentByte!2422 (_2!1636 lt!41949)) (size!763 (buf!1091 (_2!1636 lt!41949)))))))

(declare-fun b!29311 () Bool)

(declare-fun res!25298 () Bool)

(assert (=> b!29311 (=> (not res!25298) (not e!19629))))

(assert (=> b!29311 (= res!25298 (= (size!763 (buf!1091 (_2!1636 lt!40928))) (size!763 (buf!1091 (_2!1636 lt!41949)))))))

(declare-fun d!8250 () Bool)

(assert (=> d!8250 e!19629))

(declare-fun res!25299 () Bool)

(assert (=> d!8250 (=> (not res!25299) (not e!19629))))

(declare-fun lt!41963 () (_ BitVec 64))

(assert (=> d!8250 (= res!25299 (= (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!41949))) (currentByte!2422 (_2!1636 lt!41949)) (currentBit!2417 (_2!1636 lt!41949))) (bvsub lt!41963 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!8250 (or (= (bvand lt!41963 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!41963 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!41963 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!41947 () (_ BitVec 64))

(assert (=> d!8250 (= lt!41963 (bvadd lt!41947 to!314))))

(assert (=> d!8250 (or (not (= (bvand lt!41947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!41947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!41947 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8250 (= lt!41947 (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!40928))) (currentByte!2422 (_2!1636 lt!40928)) (currentBit!2417 (_2!1636 lt!40928))))))

(declare-fun e!19631 () tuple2!3098)

(assert (=> d!8250 (= lt!41949 e!19631)))

(declare-fun c!1901 () Bool)

(assert (=> d!8250 (= c!1901 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!41980 () Unit!2247)

(declare-fun lt!41977 () Unit!2247)

(assert (=> d!8250 (= lt!41980 lt!41977)))

(assert (=> d!8250 (isPrefixOf!0 (_2!1636 lt!40928) (_2!1636 lt!40928))))

(assert (=> d!8250 (= lt!41977 (lemmaIsPrefixRefl!0 (_2!1636 lt!40928)))))

(declare-fun lt!41950 () (_ BitVec 64))

(assert (=> d!8250 (= lt!41950 (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!40928))) (currentByte!2422 (_2!1636 lt!40928)) (currentBit!2417 (_2!1636 lt!40928))))))

(assert (=> d!8250 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8250 (= (appendBitsMSBFirstLoop!0 (_2!1636 lt!40928) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!41949)))

(declare-fun lt!41945 () tuple2!3100)

(declare-fun b!29312 () Bool)

(assert (=> b!29312 (= e!19629 (= (bitStreamReadBitsIntoList!0 (_2!1636 lt!41949) (_1!1637 lt!41945) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1636 lt!41949) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!29312 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29312 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!41953 () Unit!2247)

(declare-fun lt!41961 () Unit!2247)

(assert (=> b!29312 (= lt!41953 lt!41961)))

(declare-fun lt!41982 () (_ BitVec 64))

(assert (=> b!29312 (validate_offset_bits!1 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!41949)))) ((_ sign_extend 32) (currentByte!2422 (_2!1636 lt!40928))) ((_ sign_extend 32) (currentBit!2417 (_2!1636 lt!40928))) lt!41982)))

(assert (=> b!29312 (= lt!41961 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1636 lt!40928) (buf!1091 (_2!1636 lt!41949)) lt!41982))))

(declare-fun e!19630 () Bool)

(assert (=> b!29312 e!19630))

(declare-fun res!25297 () Bool)

(assert (=> b!29312 (=> (not res!25297) (not e!19630))))

(assert (=> b!29312 (= res!25297 (and (= (size!763 (buf!1091 (_2!1636 lt!40928))) (size!763 (buf!1091 (_2!1636 lt!41949)))) (bvsge lt!41982 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29312 (= lt!41982 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!29312 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29312 (= lt!41945 (reader!0 (_2!1636 lt!40928) (_2!1636 lt!41949)))))

(declare-fun b!29313 () Bool)

(declare-fun Unit!2274 () Unit!2247)

(assert (=> b!29313 (= e!19631 (tuple2!3099 Unit!2274 (_2!1636 lt!40928)))))

(assert (=> b!29313 (= (size!763 (buf!1091 (_2!1636 lt!40928))) (size!763 (buf!1091 (_2!1636 lt!40928))))))

(declare-fun lt!41981 () Unit!2247)

(declare-fun Unit!2275 () Unit!2247)

(assert (=> b!29313 (= lt!41981 Unit!2275)))

(declare-fun call!373 () tuple2!3100)

(declare-fun checkByteArrayBitContent!0 (BitStream!1354 array!1760 array!1760 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3130 0))(
  ( (tuple2!3131 (_1!1652 array!1760) (_2!1652 BitStream!1354)) )
))
(declare-fun readBits!0 (BitStream!1354 (_ BitVec 64)) tuple2!3130)

(assert (=> b!29313 (checkByteArrayBitContent!0 (_2!1636 lt!40928) srcBuffer!2 (_1!1652 (readBits!0 (_1!1637 call!373) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!41973 () tuple2!3098)

(declare-fun lt!41958 () tuple2!3098)

(declare-fun bm!370 () Bool)

(assert (=> bm!370 (= call!373 (reader!0 (ite c!1901 (_2!1636 lt!41958) (_2!1636 lt!40928)) (ite c!1901 (_2!1636 lt!41973) (_2!1636 lt!40928))))))

(declare-fun b!29314 () Bool)

(declare-fun Unit!2276 () Unit!2247)

(assert (=> b!29314 (= e!19631 (tuple2!3099 Unit!2276 (_2!1636 lt!41973)))))

(assert (=> b!29314 (= lt!41958 (appendBitFromByte!0 (_2!1636 lt!40928) (select (arr!1226 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!41966 () (_ BitVec 64))

(assert (=> b!29314 (= lt!41966 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!41972 () (_ BitVec 64))

(assert (=> b!29314 (= lt!41972 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!41967 () Unit!2247)

(assert (=> b!29314 (= lt!41967 (validateOffsetBitsIneqLemma!0 (_2!1636 lt!40928) (_2!1636 lt!41958) lt!41966 lt!41972))))

(assert (=> b!29314 (validate_offset_bits!1 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!41958)))) ((_ sign_extend 32) (currentByte!2422 (_2!1636 lt!41958))) ((_ sign_extend 32) (currentBit!2417 (_2!1636 lt!41958))) (bvsub lt!41966 lt!41972))))

(declare-fun lt!41964 () Unit!2247)

(assert (=> b!29314 (= lt!41964 lt!41967)))

(declare-fun lt!41974 () tuple2!3100)

(assert (=> b!29314 (= lt!41974 (reader!0 (_2!1636 lt!40928) (_2!1636 lt!41958)))))

(declare-fun lt!41971 () (_ BitVec 64))

(assert (=> b!29314 (= lt!41971 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!41979 () Unit!2247)

(assert (=> b!29314 (= lt!41979 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1636 lt!40928) (buf!1091 (_2!1636 lt!41958)) lt!41971))))

(assert (=> b!29314 (validate_offset_bits!1 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!41958)))) ((_ sign_extend 32) (currentByte!2422 (_2!1636 lt!40928))) ((_ sign_extend 32) (currentBit!2417 (_2!1636 lt!40928))) lt!41971)))

(declare-fun lt!41951 () Unit!2247)

(assert (=> b!29314 (= lt!41951 lt!41979)))

(assert (=> b!29314 (= (head!215 (byteArrayBitContentToList!0 (_2!1636 lt!41958) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!215 (bitStreamReadBitsIntoList!0 (_2!1636 lt!41958) (_1!1637 lt!41974) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!41984 () Unit!2247)

(declare-fun Unit!2277 () Unit!2247)

(assert (=> b!29314 (= lt!41984 Unit!2277)))

(assert (=> b!29314 (= lt!41973 (appendBitsMSBFirstLoop!0 (_2!1636 lt!41958) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!41955 () Unit!2247)

(assert (=> b!29314 (= lt!41955 (lemmaIsPrefixTransitive!0 (_2!1636 lt!40928) (_2!1636 lt!41958) (_2!1636 lt!41973)))))

(assert (=> b!29314 (isPrefixOf!0 (_2!1636 lt!40928) (_2!1636 lt!41973))))

(declare-fun lt!41942 () Unit!2247)

(assert (=> b!29314 (= lt!41942 lt!41955)))

(assert (=> b!29314 (= (size!763 (buf!1091 (_2!1636 lt!41973))) (size!763 (buf!1091 (_2!1636 lt!40928))))))

(declare-fun lt!41970 () Unit!2247)

(declare-fun Unit!2278 () Unit!2247)

(assert (=> b!29314 (= lt!41970 Unit!2278)))

(assert (=> b!29314 (= (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!41973))) (currentByte!2422 (_2!1636 lt!41973)) (currentBit!2417 (_2!1636 lt!41973))) (bvsub (bvadd (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!40928))) (currentByte!2422 (_2!1636 lt!40928)) (currentBit!2417 (_2!1636 lt!40928))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!41952 () Unit!2247)

(declare-fun Unit!2279 () Unit!2247)

(assert (=> b!29314 (= lt!41952 Unit!2279)))

(assert (=> b!29314 (= (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!41973))) (currentByte!2422 (_2!1636 lt!41973)) (currentBit!2417 (_2!1636 lt!41973))) (bvsub (bvsub (bvadd (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!41958))) (currentByte!2422 (_2!1636 lt!41958)) (currentBit!2417 (_2!1636 lt!41958))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!41965 () Unit!2247)

(declare-fun Unit!2280 () Unit!2247)

(assert (=> b!29314 (= lt!41965 Unit!2280)))

(declare-fun lt!41957 () tuple2!3100)

(assert (=> b!29314 (= lt!41957 (reader!0 (_2!1636 lt!40928) (_2!1636 lt!41973)))))

(declare-fun lt!41969 () (_ BitVec 64))

(assert (=> b!29314 (= lt!41969 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!41960 () Unit!2247)

(assert (=> b!29314 (= lt!41960 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1636 lt!40928) (buf!1091 (_2!1636 lt!41973)) lt!41969))))

(assert (=> b!29314 (validate_offset_bits!1 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!41973)))) ((_ sign_extend 32) (currentByte!2422 (_2!1636 lt!40928))) ((_ sign_extend 32) (currentBit!2417 (_2!1636 lt!40928))) lt!41969)))

(declare-fun lt!41943 () Unit!2247)

(assert (=> b!29314 (= lt!41943 lt!41960)))

(declare-fun lt!41959 () tuple2!3100)

(assert (=> b!29314 (= lt!41959 call!373)))

(declare-fun lt!41946 () (_ BitVec 64))

(assert (=> b!29314 (= lt!41946 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!41944 () Unit!2247)

(assert (=> b!29314 (= lt!41944 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1636 lt!41958) (buf!1091 (_2!1636 lt!41973)) lt!41946))))

(assert (=> b!29314 (validate_offset_bits!1 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!41973)))) ((_ sign_extend 32) (currentByte!2422 (_2!1636 lt!41958))) ((_ sign_extend 32) (currentBit!2417 (_2!1636 lt!41958))) lt!41946)))

(declare-fun lt!41976 () Unit!2247)

(assert (=> b!29314 (= lt!41976 lt!41944)))

(declare-fun lt!41968 () List!378)

(assert (=> b!29314 (= lt!41968 (byteArrayBitContentToList!0 (_2!1636 lt!41973) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!41975 () List!378)

(assert (=> b!29314 (= lt!41975 (byteArrayBitContentToList!0 (_2!1636 lt!41973) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!41978 () List!378)

(assert (=> b!29314 (= lt!41978 (bitStreamReadBitsIntoList!0 (_2!1636 lt!41973) (_1!1637 lt!41957) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!41941 () List!378)

(assert (=> b!29314 (= lt!41941 (bitStreamReadBitsIntoList!0 (_2!1636 lt!41973) (_1!1637 lt!41959) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!41948 () (_ BitVec 64))

(assert (=> b!29314 (= lt!41948 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!41954 () Unit!2247)

(assert (=> b!29314 (= lt!41954 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1636 lt!41973) (_2!1636 lt!41973) (_1!1637 lt!41957) (_1!1637 lt!41959) lt!41948 lt!41978))))

(assert (=> b!29314 (= (bitStreamReadBitsIntoList!0 (_2!1636 lt!41973) (_1!1637 lt!41959) (bvsub lt!41948 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!95 lt!41978))))

(declare-fun lt!41956 () Unit!2247)

(assert (=> b!29314 (= lt!41956 lt!41954)))

(declare-fun lt!41962 () Unit!2247)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1760 array!1760 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2247)

(assert (=> b!29314 (= lt!41962 (arrayBitRangesEqImpliesEq!0 (buf!1091 (_2!1636 lt!41958)) (buf!1091 (_2!1636 lt!41973)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!41950 (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!41958))) (currentByte!2422 (_2!1636 lt!41958)) (currentBit!2417 (_2!1636 lt!41958)))))))

(declare-fun bitAt!0 (array!1760 (_ BitVec 64)) Bool)

(assert (=> b!29314 (= (bitAt!0 (buf!1091 (_2!1636 lt!41958)) lt!41950) (bitAt!0 (buf!1091 (_2!1636 lt!41973)) lt!41950))))

(declare-fun lt!41983 () Unit!2247)

(assert (=> b!29314 (= lt!41983 lt!41962)))

(declare-fun b!29315 () Bool)

(declare-fun res!25295 () Bool)

(assert (=> b!29315 (=> (not res!25295) (not e!19629))))

(assert (=> b!29315 (= res!25295 (isPrefixOf!0 (_2!1636 lt!40928) (_2!1636 lt!41949)))))

(declare-fun b!29316 () Bool)

(assert (=> b!29316 (= e!19630 (validate_offset_bits!1 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40928)))) ((_ sign_extend 32) (currentByte!2422 (_2!1636 lt!40928))) ((_ sign_extend 32) (currentBit!2417 (_2!1636 lt!40928))) lt!41982))))

(declare-fun b!29317 () Bool)

(declare-fun res!25296 () Bool)

(assert (=> b!29317 (=> (not res!25296) (not e!19629))))

(assert (=> b!29317 (= res!25296 (= (size!763 (buf!1091 (_2!1636 lt!41949))) (size!763 (buf!1091 (_2!1636 lt!40928)))))))

(assert (= (and d!8250 c!1901) b!29314))

(assert (= (and d!8250 (not c!1901)) b!29313))

(assert (= (or b!29314 b!29313) bm!370))

(assert (= (and d!8250 res!25299) b!29310))

(assert (= (and b!29310 res!25294) b!29311))

(assert (= (and b!29311 res!25298) b!29315))

(assert (= (and b!29315 res!25295) b!29317))

(assert (= (and b!29317 res!25296) b!29312))

(assert (= (and b!29312 res!25297) b!29316))

(declare-fun m!42393 () Bool)

(assert (=> b!29316 m!42393))

(declare-fun m!42395 () Bool)

(assert (=> bm!370 m!42395))

(declare-fun m!42397 () Bool)

(assert (=> b!29313 m!42397))

(declare-fun m!42399 () Bool)

(assert (=> b!29313 m!42399))

(declare-fun m!42401 () Bool)

(assert (=> b!29310 m!42401))

(declare-fun m!42403 () Bool)

(assert (=> b!29314 m!42403))

(declare-fun m!42405 () Bool)

(assert (=> b!29314 m!42405))

(declare-fun m!42407 () Bool)

(assert (=> b!29314 m!42407))

(declare-fun m!42409 () Bool)

(assert (=> b!29314 m!42409))

(declare-fun m!42411 () Bool)

(assert (=> b!29314 m!42411))

(declare-fun m!42413 () Bool)

(assert (=> b!29314 m!42413))

(declare-fun m!42415 () Bool)

(assert (=> b!29314 m!42415))

(declare-fun m!42417 () Bool)

(assert (=> b!29314 m!42417))

(declare-fun m!42419 () Bool)

(assert (=> b!29314 m!42419))

(assert (=> b!29314 m!42403))

(declare-fun m!42421 () Bool)

(assert (=> b!29314 m!42421))

(declare-fun m!42423 () Bool)

(assert (=> b!29314 m!42423))

(declare-fun m!42425 () Bool)

(assert (=> b!29314 m!42425))

(declare-fun m!42427 () Bool)

(assert (=> b!29314 m!42427))

(declare-fun m!42429 () Bool)

(assert (=> b!29314 m!42429))

(declare-fun m!42431 () Bool)

(assert (=> b!29314 m!42431))

(declare-fun m!42433 () Bool)

(assert (=> b!29314 m!42433))

(assert (=> b!29314 m!41583))

(declare-fun m!42435 () Bool)

(assert (=> b!29314 m!42435))

(declare-fun m!42437 () Bool)

(assert (=> b!29314 m!42437))

(declare-fun m!42439 () Bool)

(assert (=> b!29314 m!42439))

(declare-fun m!42441 () Bool)

(assert (=> b!29314 m!42441))

(declare-fun m!42443 () Bool)

(assert (=> b!29314 m!42443))

(declare-fun m!42445 () Bool)

(assert (=> b!29314 m!42445))

(assert (=> b!29314 m!42437))

(declare-fun m!42447 () Bool)

(assert (=> b!29314 m!42447))

(declare-fun m!42449 () Bool)

(assert (=> b!29314 m!42449))

(declare-fun m!42451 () Bool)

(assert (=> b!29314 m!42451))

(assert (=> b!29314 m!42449))

(declare-fun m!42453 () Bool)

(assert (=> b!29314 m!42453))

(declare-fun m!42455 () Bool)

(assert (=> b!29314 m!42455))

(declare-fun m!42457 () Bool)

(assert (=> b!29314 m!42457))

(assert (=> b!29314 m!42425))

(declare-fun m!42459 () Bool)

(assert (=> b!29314 m!42459))

(declare-fun m!42461 () Bool)

(assert (=> b!29314 m!42461))

(declare-fun m!42463 () Bool)

(assert (=> b!29314 m!42463))

(declare-fun m!42465 () Bool)

(assert (=> b!29312 m!42465))

(declare-fun m!42467 () Bool)

(assert (=> b!29312 m!42467))

(declare-fun m!42469 () Bool)

(assert (=> b!29312 m!42469))

(declare-fun m!42471 () Bool)

(assert (=> b!29312 m!42471))

(declare-fun m!42473 () Bool)

(assert (=> b!29312 m!42473))

(declare-fun m!42475 () Bool)

(assert (=> d!8250 m!42475))

(assert (=> d!8250 m!41583))

(assert (=> d!8250 m!42013))

(assert (=> d!8250 m!42017))

(declare-fun m!42477 () Bool)

(assert (=> b!29315 m!42477))

(assert (=> b!28848 d!8250))

(declare-fun d!8320 () Bool)

(declare-fun e!19632 () Bool)

(assert (=> d!8320 e!19632))

(declare-fun res!25301 () Bool)

(assert (=> d!8320 (=> (not res!25301) (not e!19632))))

(declare-fun lt!41986 () tuple2!3100)

(assert (=> d!8320 (= res!25301 (isPrefixOf!0 (_1!1637 lt!41986) (_2!1637 lt!41986)))))

(declare-fun lt!41998 () BitStream!1354)

(assert (=> d!8320 (= lt!41986 (tuple2!3101 lt!41998 (_2!1636 lt!40928)))))

(declare-fun lt!41999 () Unit!2247)

(declare-fun lt!42004 () Unit!2247)

(assert (=> d!8320 (= lt!41999 lt!42004)))

(assert (=> d!8320 (isPrefixOf!0 lt!41998 (_2!1636 lt!40928))))

(assert (=> d!8320 (= lt!42004 (lemmaIsPrefixTransitive!0 lt!41998 (_2!1636 lt!40928) (_2!1636 lt!40928)))))

(declare-fun lt!41992 () Unit!2247)

(declare-fun lt!41988 () Unit!2247)

(assert (=> d!8320 (= lt!41992 lt!41988)))

(assert (=> d!8320 (isPrefixOf!0 lt!41998 (_2!1636 lt!40928))))

(assert (=> d!8320 (= lt!41988 (lemmaIsPrefixTransitive!0 lt!41998 thiss!1379 (_2!1636 lt!40928)))))

(declare-fun lt!41993 () Unit!2247)

(declare-fun e!19633 () Unit!2247)

(assert (=> d!8320 (= lt!41993 e!19633)))

(declare-fun c!1902 () Bool)

(assert (=> d!8320 (= c!1902 (not (= (size!763 (buf!1091 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!42001 () Unit!2247)

(declare-fun lt!42000 () Unit!2247)

(assert (=> d!8320 (= lt!42001 lt!42000)))

(assert (=> d!8320 (isPrefixOf!0 (_2!1636 lt!40928) (_2!1636 lt!40928))))

(assert (=> d!8320 (= lt!42000 (lemmaIsPrefixRefl!0 (_2!1636 lt!40928)))))

(declare-fun lt!41997 () Unit!2247)

(declare-fun lt!41985 () Unit!2247)

(assert (=> d!8320 (= lt!41997 lt!41985)))

(assert (=> d!8320 (= lt!41985 (lemmaIsPrefixRefl!0 (_2!1636 lt!40928)))))

(declare-fun lt!41989 () Unit!2247)

(declare-fun lt!41996 () Unit!2247)

(assert (=> d!8320 (= lt!41989 lt!41996)))

(assert (=> d!8320 (isPrefixOf!0 lt!41998 lt!41998)))

(assert (=> d!8320 (= lt!41996 (lemmaIsPrefixRefl!0 lt!41998))))

(declare-fun lt!42002 () Unit!2247)

(declare-fun lt!42003 () Unit!2247)

(assert (=> d!8320 (= lt!42002 lt!42003)))

(assert (=> d!8320 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8320 (= lt!42003 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8320 (= lt!41998 (BitStream!1355 (buf!1091 (_2!1636 lt!40928)) (currentByte!2422 thiss!1379) (currentBit!2417 thiss!1379)))))

(assert (=> d!8320 (isPrefixOf!0 thiss!1379 (_2!1636 lt!40928))))

(assert (=> d!8320 (= (reader!0 thiss!1379 (_2!1636 lt!40928)) lt!41986)))

(declare-fun b!29318 () Bool)

(declare-fun lt!41995 () Unit!2247)

(assert (=> b!29318 (= e!19633 lt!41995)))

(declare-fun lt!41987 () (_ BitVec 64))

(assert (=> b!29318 (= lt!41987 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41994 () (_ BitVec 64))

(assert (=> b!29318 (= lt!41994 (bitIndex!0 (size!763 (buf!1091 thiss!1379)) (currentByte!2422 thiss!1379) (currentBit!2417 thiss!1379)))))

(assert (=> b!29318 (= lt!41995 (arrayBitRangesEqSymmetric!0 (buf!1091 thiss!1379) (buf!1091 (_2!1636 lt!40928)) lt!41987 lt!41994))))

(assert (=> b!29318 (arrayBitRangesEq!0 (buf!1091 (_2!1636 lt!40928)) (buf!1091 thiss!1379) lt!41987 lt!41994)))

(declare-fun b!29319 () Bool)

(declare-fun res!25302 () Bool)

(assert (=> b!29319 (=> (not res!25302) (not e!19632))))

(assert (=> b!29319 (= res!25302 (isPrefixOf!0 (_1!1637 lt!41986) thiss!1379))))

(declare-fun lt!41991 () (_ BitVec 64))

(declare-fun lt!41990 () (_ BitVec 64))

(declare-fun b!29320 () Bool)

(assert (=> b!29320 (= e!19632 (= (_1!1637 lt!41986) (withMovedBitIndex!0 (_2!1637 lt!41986) (bvsub lt!41990 lt!41991))))))

(assert (=> b!29320 (or (= (bvand lt!41990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41991 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!41990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!41990 lt!41991) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29320 (= lt!41991 (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!40928))) (currentByte!2422 (_2!1636 lt!40928)) (currentBit!2417 (_2!1636 lt!40928))))))

(assert (=> b!29320 (= lt!41990 (bitIndex!0 (size!763 (buf!1091 thiss!1379)) (currentByte!2422 thiss!1379) (currentBit!2417 thiss!1379)))))

(declare-fun b!29321 () Bool)

(declare-fun Unit!2281 () Unit!2247)

(assert (=> b!29321 (= e!19633 Unit!2281)))

(declare-fun b!29322 () Bool)

(declare-fun res!25300 () Bool)

(assert (=> b!29322 (=> (not res!25300) (not e!19632))))

(assert (=> b!29322 (= res!25300 (isPrefixOf!0 (_2!1637 lt!41986) (_2!1636 lt!40928)))))

(assert (= (and d!8320 c!1902) b!29318))

(assert (= (and d!8320 (not c!1902)) b!29321))

(assert (= (and d!8320 res!25301) b!29319))

(assert (= (and b!29319 res!25302) b!29322))

(assert (= (and b!29322 res!25300) b!29320))

(declare-fun m!42479 () Bool)

(assert (=> d!8320 m!42479))

(declare-fun m!42481 () Bool)

(assert (=> d!8320 m!42481))

(assert (=> d!8320 m!42017))

(assert (=> d!8320 m!42013))

(assert (=> d!8320 m!41539))

(declare-fun m!42483 () Bool)

(assert (=> d!8320 m!42483))

(assert (=> d!8320 m!41567))

(declare-fun m!42485 () Bool)

(assert (=> d!8320 m!42485))

(assert (=> d!8320 m!41569))

(declare-fun m!42487 () Bool)

(assert (=> d!8320 m!42487))

(declare-fun m!42489 () Bool)

(assert (=> d!8320 m!42489))

(declare-fun m!42491 () Bool)

(assert (=> b!29320 m!42491))

(assert (=> b!29320 m!41583))

(assert (=> b!29320 m!41571))

(assert (=> b!29318 m!41571))

(declare-fun m!42493 () Bool)

(assert (=> b!29318 m!42493))

(declare-fun m!42495 () Bool)

(assert (=> b!29318 m!42495))

(declare-fun m!42497 () Bool)

(assert (=> b!29322 m!42497))

(declare-fun m!42499 () Bool)

(assert (=> b!29319 m!42499))

(assert (=> b!28848 d!8320))

(declare-fun d!8322 () Bool)

(declare-fun res!25305 () Bool)

(declare-fun e!19635 () Bool)

(assert (=> d!8322 (=> (not res!25305) (not e!19635))))

(assert (=> d!8322 (= res!25305 (= (size!763 (buf!1091 thiss!1379)) (size!763 (buf!1091 (_2!1636 lt!40932)))))))

(assert (=> d!8322 (= (isPrefixOf!0 thiss!1379 (_2!1636 lt!40932)) e!19635)))

(declare-fun b!29323 () Bool)

(declare-fun res!25304 () Bool)

(assert (=> b!29323 (=> (not res!25304) (not e!19635))))

(assert (=> b!29323 (= res!25304 (bvsle (bitIndex!0 (size!763 (buf!1091 thiss!1379)) (currentByte!2422 thiss!1379) (currentBit!2417 thiss!1379)) (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!40932))) (currentByte!2422 (_2!1636 lt!40932)) (currentBit!2417 (_2!1636 lt!40932)))))))

(declare-fun b!29324 () Bool)

(declare-fun e!19634 () Bool)

(assert (=> b!29324 (= e!19635 e!19634)))

(declare-fun res!25303 () Bool)

(assert (=> b!29324 (=> res!25303 e!19634)))

(assert (=> b!29324 (= res!25303 (= (size!763 (buf!1091 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!29325 () Bool)

(assert (=> b!29325 (= e!19634 (arrayBitRangesEq!0 (buf!1091 thiss!1379) (buf!1091 (_2!1636 lt!40932)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!763 (buf!1091 thiss!1379)) (currentByte!2422 thiss!1379) (currentBit!2417 thiss!1379))))))

(assert (= (and d!8322 res!25305) b!29323))

(assert (= (and b!29323 res!25304) b!29324))

(assert (= (and b!29324 (not res!25303)) b!29325))

(assert (=> b!29323 m!41571))

(assert (=> b!29323 m!41565))

(assert (=> b!29325 m!41571))

(assert (=> b!29325 m!41571))

(declare-fun m!42501 () Bool)

(assert (=> b!29325 m!42501))

(assert (=> b!28848 d!8322))

(declare-fun d!8324 () Bool)

(declare-fun res!25308 () Bool)

(declare-fun e!19637 () Bool)

(assert (=> d!8324 (=> (not res!25308) (not e!19637))))

(assert (=> d!8324 (= res!25308 (= (size!763 (buf!1091 (_2!1636 lt!40928))) (size!763 (buf!1091 (_2!1636 lt!40932)))))))

(assert (=> d!8324 (= (isPrefixOf!0 (_2!1636 lt!40928) (_2!1636 lt!40932)) e!19637)))

(declare-fun b!29326 () Bool)

(declare-fun res!25307 () Bool)

(assert (=> b!29326 (=> (not res!25307) (not e!19637))))

(assert (=> b!29326 (= res!25307 (bvsle (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!40928))) (currentByte!2422 (_2!1636 lt!40928)) (currentBit!2417 (_2!1636 lt!40928))) (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!40932))) (currentByte!2422 (_2!1636 lt!40932)) (currentBit!2417 (_2!1636 lt!40932)))))))

(declare-fun b!29327 () Bool)

(declare-fun e!19636 () Bool)

(assert (=> b!29327 (= e!19637 e!19636)))

(declare-fun res!25306 () Bool)

(assert (=> b!29327 (=> res!25306 e!19636)))

(assert (=> b!29327 (= res!25306 (= (size!763 (buf!1091 (_2!1636 lt!40928))) #b00000000000000000000000000000000))))

(declare-fun b!29328 () Bool)

(assert (=> b!29328 (= e!19636 (arrayBitRangesEq!0 (buf!1091 (_2!1636 lt!40928)) (buf!1091 (_2!1636 lt!40932)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!40928))) (currentByte!2422 (_2!1636 lt!40928)) (currentBit!2417 (_2!1636 lt!40928)))))))

(assert (= (and d!8324 res!25308) b!29326))

(assert (= (and b!29326 res!25307) b!29327))

(assert (= (and b!29327 (not res!25306)) b!29328))

(assert (=> b!29326 m!41583))

(assert (=> b!29326 m!41565))

(assert (=> b!29328 m!41583))

(assert (=> b!29328 m!41583))

(declare-fun m!42503 () Bool)

(assert (=> b!29328 m!42503))

(assert (=> b!28848 d!8324))

(declare-fun d!8326 () Bool)

(assert (=> d!8326 (= (invariant!0 (currentBit!2417 (_2!1636 lt!40928)) (currentByte!2422 (_2!1636 lt!40928)) (size!763 (buf!1091 (_2!1636 lt!40928)))) (and (bvsge (currentBit!2417 (_2!1636 lt!40928)) #b00000000000000000000000000000000) (bvslt (currentBit!2417 (_2!1636 lt!40928)) #b00000000000000000000000000001000) (bvsge (currentByte!2422 (_2!1636 lt!40928)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2422 (_2!1636 lt!40928)) (size!763 (buf!1091 (_2!1636 lt!40928)))) (and (= (currentBit!2417 (_2!1636 lt!40928)) #b00000000000000000000000000000000) (= (currentByte!2422 (_2!1636 lt!40928)) (size!763 (buf!1091 (_2!1636 lt!40928))))))))))

(assert (=> b!28858 d!8326))

(declare-fun d!8328 () Bool)

(assert (=> d!8328 (= (array_inv!730 (buf!1091 thiss!1379)) (bvsge (size!763 (buf!1091 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!28847 d!8328))

(declare-fun d!8330 () Bool)

(declare-fun res!25311 () Bool)

(declare-fun e!19639 () Bool)

(assert (=> d!8330 (=> (not res!25311) (not e!19639))))

(assert (=> d!8330 (= res!25311 (= (size!763 (buf!1091 thiss!1379)) (size!763 (buf!1091 (_2!1636 lt!40928)))))))

(assert (=> d!8330 (= (isPrefixOf!0 thiss!1379 (_2!1636 lt!40928)) e!19639)))

(declare-fun b!29329 () Bool)

(declare-fun res!25310 () Bool)

(assert (=> b!29329 (=> (not res!25310) (not e!19639))))

(assert (=> b!29329 (= res!25310 (bvsle (bitIndex!0 (size!763 (buf!1091 thiss!1379)) (currentByte!2422 thiss!1379) (currentBit!2417 thiss!1379)) (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!40928))) (currentByte!2422 (_2!1636 lt!40928)) (currentBit!2417 (_2!1636 lt!40928)))))))

(declare-fun b!29330 () Bool)

(declare-fun e!19638 () Bool)

(assert (=> b!29330 (= e!19639 e!19638)))

(declare-fun res!25309 () Bool)

(assert (=> b!29330 (=> res!25309 e!19638)))

(assert (=> b!29330 (= res!25309 (= (size!763 (buf!1091 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!29331 () Bool)

(assert (=> b!29331 (= e!19638 (arrayBitRangesEq!0 (buf!1091 thiss!1379) (buf!1091 (_2!1636 lt!40928)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!763 (buf!1091 thiss!1379)) (currentByte!2422 thiss!1379) (currentBit!2417 thiss!1379))))))

(assert (= (and d!8330 res!25311) b!29329))

(assert (= (and b!29329 res!25310) b!29330))

(assert (= (and b!29330 (not res!25309)) b!29331))

(assert (=> b!29329 m!41571))

(assert (=> b!29329 m!41583))

(assert (=> b!29331 m!41571))

(assert (=> b!29331 m!41571))

(declare-fun m!42505 () Bool)

(assert (=> b!29331 m!42505))

(assert (=> b!28857 d!8330))

(declare-fun d!8332 () Bool)

(assert (=> d!8332 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40928)))) ((_ sign_extend 32) (currentByte!2422 (_2!1636 lt!40928))) ((_ sign_extend 32) (currentBit!2417 (_2!1636 lt!40928))) lt!40922) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40928)))) ((_ sign_extend 32) (currentByte!2422 (_2!1636 lt!40928))) ((_ sign_extend 32) (currentBit!2417 (_2!1636 lt!40928)))) lt!40922))))

(declare-fun bs!2368 () Bool)

(assert (= bs!2368 d!8332))

(assert (=> bs!2368 m!42095))

(assert (=> b!28857 d!8332))

(declare-fun d!8334 () Bool)

(declare-fun e!19642 () Bool)

(assert (=> d!8334 e!19642))

(declare-fun res!25314 () Bool)

(assert (=> d!8334 (=> (not res!25314) (not e!19642))))

(assert (=> d!8334 (= res!25314 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!42007 () Unit!2247)

(declare-fun choose!27 (BitStream!1354 BitStream!1354 (_ BitVec 64) (_ BitVec 64)) Unit!2247)

(assert (=> d!8334 (= lt!42007 (choose!27 thiss!1379 (_2!1636 lt!40928) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!8334 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!8334 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1636 lt!40928) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!42007)))

(declare-fun b!29334 () Bool)

(assert (=> b!29334 (= e!19642 (validate_offset_bits!1 ((_ sign_extend 32) (size!763 (buf!1091 (_2!1636 lt!40928)))) ((_ sign_extend 32) (currentByte!2422 (_2!1636 lt!40928))) ((_ sign_extend 32) (currentBit!2417 (_2!1636 lt!40928))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!8334 res!25314) b!29334))

(declare-fun m!42507 () Bool)

(assert (=> d!8334 m!42507))

(declare-fun m!42509 () Bool)

(assert (=> b!29334 m!42509))

(assert (=> b!28857 d!8334))

(declare-fun b!29352 () Bool)

(declare-fun res!25335 () Bool)

(declare-fun e!19652 () Bool)

(assert (=> b!29352 (=> (not res!25335) (not e!19652))))

(declare-fun lt!42039 () (_ BitVec 64))

(declare-fun lt!42034 () (_ BitVec 64))

(declare-fun lt!42042 () tuple2!3098)

(assert (=> b!29352 (= res!25335 (= (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!42042))) (currentByte!2422 (_2!1636 lt!42042)) (currentBit!2417 (_2!1636 lt!42042))) (bvadd lt!42039 lt!42034)))))

(assert (=> b!29352 (or (not (= (bvand lt!42039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!42034 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!42039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!42039 lt!42034) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29352 (= lt!42034 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!29352 (= lt!42039 (bitIndex!0 (size!763 (buf!1091 thiss!1379)) (currentByte!2422 thiss!1379) (currentBit!2417 thiss!1379)))))

(declare-fun b!29353 () Bool)

(declare-fun res!25332 () Bool)

(assert (=> b!29353 (=> (not res!25332) (not e!19652))))

(assert (=> b!29353 (= res!25332 (isPrefixOf!0 thiss!1379 (_2!1636 lt!42042)))))

(declare-fun d!8336 () Bool)

(assert (=> d!8336 e!19652))

(declare-fun res!25337 () Bool)

(assert (=> d!8336 (=> (not res!25337) (not e!19652))))

(assert (=> d!8336 (= res!25337 (= (size!763 (buf!1091 (_2!1636 lt!42042))) (size!763 (buf!1091 thiss!1379))))))

(declare-fun lt!42033 () (_ BitVec 8))

(declare-fun lt!42038 () array!1760)

(assert (=> d!8336 (= lt!42033 (select (arr!1226 lt!42038) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!8336 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!763 lt!42038)))))

(assert (=> d!8336 (= lt!42038 (array!1761 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!42032 () tuple2!3098)

(assert (=> d!8336 (= lt!42042 (tuple2!3099 (_1!1636 lt!42032) (_2!1636 lt!42032)))))

(declare-fun lt!42035 () tuple2!3098)

(assert (=> d!8336 (= lt!42032 lt!42035)))

(declare-fun e!19651 () Bool)

(assert (=> d!8336 e!19651))

(declare-fun res!25333 () Bool)

(assert (=> d!8336 (=> (not res!25333) (not e!19651))))

(assert (=> d!8336 (= res!25333 (= (size!763 (buf!1091 thiss!1379)) (size!763 (buf!1091 (_2!1636 lt!42035)))))))

(declare-fun lt!42037 () Bool)

(declare-fun appendBit!0 (BitStream!1354 Bool) tuple2!3098)

(assert (=> d!8336 (= lt!42035 (appendBit!0 thiss!1379 lt!42037))))

(assert (=> d!8336 (= lt!42037 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1226 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!8336 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!8336 (= (appendBitFromByte!0 thiss!1379 (select (arr!1226 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!42042)))

(declare-fun b!29354 () Bool)

(declare-fun e!19654 () Bool)

(assert (=> b!29354 (= e!19651 e!19654)))

(declare-fun res!25334 () Bool)

(assert (=> b!29354 (=> (not res!25334) (not e!19654))))

(declare-datatypes ((tuple2!3132 0))(
  ( (tuple2!3133 (_1!1653 BitStream!1354) (_2!1653 Bool)) )
))
(declare-fun lt!42040 () tuple2!3132)

(assert (=> b!29354 (= res!25334 (and (= (_2!1653 lt!42040) lt!42037) (= (_1!1653 lt!42040) (_2!1636 lt!42035))))))

(declare-fun readBitPure!0 (BitStream!1354) tuple2!3132)

(declare-fun readerFrom!0 (BitStream!1354 (_ BitVec 32) (_ BitVec 32)) BitStream!1354)

(assert (=> b!29354 (= lt!42040 (readBitPure!0 (readerFrom!0 (_2!1636 lt!42035) (currentBit!2417 thiss!1379) (currentByte!2422 thiss!1379))))))

(declare-fun b!29355 () Bool)

(assert (=> b!29355 (= e!19654 (= (bitIndex!0 (size!763 (buf!1091 (_1!1653 lt!42040))) (currentByte!2422 (_1!1653 lt!42040)) (currentBit!2417 (_1!1653 lt!42040))) (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!42035))) (currentByte!2422 (_2!1636 lt!42035)) (currentBit!2417 (_2!1636 lt!42035)))))))

(declare-fun b!29356 () Bool)

(declare-fun e!19653 () Bool)

(assert (=> b!29356 (= e!19652 e!19653)))

(declare-fun res!25338 () Bool)

(assert (=> b!29356 (=> (not res!25338) (not e!19653))))

(declare-fun lt!42041 () tuple2!3132)

(assert (=> b!29356 (= res!25338 (and (= (_2!1653 lt!42041) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1226 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!42033)) #b00000000000000000000000000000000))) (= (_1!1653 lt!42041) (_2!1636 lt!42042))))))

(declare-fun lt!42036 () tuple2!3130)

(declare-fun lt!42043 () BitStream!1354)

(assert (=> b!29356 (= lt!42036 (readBits!0 lt!42043 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!29356 (= lt!42041 (readBitPure!0 lt!42043))))

(assert (=> b!29356 (= lt!42043 (readerFrom!0 (_2!1636 lt!42042) (currentBit!2417 thiss!1379) (currentByte!2422 thiss!1379)))))

(declare-fun b!29357 () Bool)

(assert (=> b!29357 (= e!19653 (= (bitIndex!0 (size!763 (buf!1091 (_1!1653 lt!42041))) (currentByte!2422 (_1!1653 lt!42041)) (currentBit!2417 (_1!1653 lt!42041))) (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!42042))) (currentByte!2422 (_2!1636 lt!42042)) (currentBit!2417 (_2!1636 lt!42042)))))))

(declare-fun b!29358 () Bool)

(declare-fun res!25336 () Bool)

(assert (=> b!29358 (=> (not res!25336) (not e!19651))))

(assert (=> b!29358 (= res!25336 (= (bitIndex!0 (size!763 (buf!1091 (_2!1636 lt!42035))) (currentByte!2422 (_2!1636 lt!42035)) (currentBit!2417 (_2!1636 lt!42035))) (bvadd (bitIndex!0 (size!763 (buf!1091 thiss!1379)) (currentByte!2422 thiss!1379) (currentBit!2417 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!29359 () Bool)

(declare-fun res!25331 () Bool)

(assert (=> b!29359 (=> (not res!25331) (not e!19651))))

(assert (=> b!29359 (= res!25331 (isPrefixOf!0 thiss!1379 (_2!1636 lt!42035)))))

(assert (= (and d!8336 res!25333) b!29358))

(assert (= (and b!29358 res!25336) b!29359))

(assert (= (and b!29359 res!25331) b!29354))

(assert (= (and b!29354 res!25334) b!29355))

(assert (= (and d!8336 res!25337) b!29352))

(assert (= (and b!29352 res!25335) b!29353))

(assert (= (and b!29353 res!25332) b!29356))

(assert (= (and b!29356 res!25338) b!29357))

(declare-fun m!42511 () Bool)

(assert (=> b!29357 m!42511))

(declare-fun m!42513 () Bool)

(assert (=> b!29357 m!42513))

(declare-fun m!42515 () Bool)

(assert (=> b!29356 m!42515))

(declare-fun m!42517 () Bool)

(assert (=> b!29356 m!42517))

(declare-fun m!42519 () Bool)

(assert (=> b!29356 m!42519))

(assert (=> b!29352 m!42513))

(assert (=> b!29352 m!41571))

(declare-fun m!42521 () Bool)

(assert (=> b!29358 m!42521))

(assert (=> b!29358 m!41571))

(declare-fun m!42523 () Bool)

(assert (=> b!29359 m!42523))

(declare-fun m!42525 () Bool)

(assert (=> b!29354 m!42525))

(assert (=> b!29354 m!42525))

(declare-fun m!42527 () Bool)

(assert (=> b!29354 m!42527))

(declare-fun m!42529 () Bool)

(assert (=> b!29353 m!42529))

(declare-fun m!42531 () Bool)

(assert (=> b!29355 m!42531))

(assert (=> b!29355 m!42521))

(declare-fun m!42533 () Bool)

(assert (=> d!8336 m!42533))

(declare-fun m!42535 () Bool)

(assert (=> d!8336 m!42535))

(assert (=> d!8336 m!42079))

(assert (=> b!28857 d!8336))

(push 1)

(assert (not b!29322))

(assert (not d!8240))

(assert (not d!8320))

(assert (not d!8336))

(assert (not b!29315))

(assert (not d!8334))

(assert (not b!29153))

(assert (not d!8184))

(assert (not b!29357))

(assert (not d!8190))

(assert (not b!29320))

(assert (not d!8218))

(assert (not b!29323))

(assert (not b!29084))

(assert (not b!29328))

(assert (not b!29312))

(assert (not b!29318))

(assert (not b!29325))

(assert (not d!8204))

(assert (not b!29154))

(assert (not d!8234))

(assert (not b!29326))

(assert (not d!8232))

(assert (not d!8332))

(assert (not d!8236))

(assert (not d!8198))

(assert (not b!29087))

(assert (not b!29113))

(assert (not b!29358))

(assert (not b!29329))

(assert (not d!8248))

(assert (not b!29313))

(assert (not b!29314))

(assert (not b!29111))

(assert (not b!29038))

(assert (not b!29080))

(assert (not b!29144))

(assert (not b!29095))

(assert (not b!29150))

(assert (not b!29353))

(assert (not b!29081))

(assert (not b!29359))

(assert (not d!8242))

(assert (not d!8246))

(assert (not bm!370))

(assert (not b!29354))

(assert (not d!8176))

(assert (not d!8244))

(assert (not d!8188))

(assert (not b!29310))

(assert (not b!29319))

(assert (not b!29096))

(assert (not b!29036))

(assert (not b!29352))

(assert (not b!29082))

(assert (not b!29037))

(assert (not b!29355))

(assert (not d!8250))

(assert (not d!8160))

(assert (not b!29086))

(assert (not b!29098))

(assert (not b!29334))

(assert (not b!29094))

(assert (not b!29316))

(assert (not b!29152))

(assert (not b!29088))

(assert (not b!29356))

(assert (not b!29331))

(assert (not d!8186))

(check-sat)

(pop 1)

(push 1)

(check-sat)

