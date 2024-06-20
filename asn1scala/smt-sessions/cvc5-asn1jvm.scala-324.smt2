; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6938 () Bool)

(assert start!6938)

(declare-fun b!33762 () Bool)

(declare-fun e!22432 () Bool)

(declare-fun e!22438 () Bool)

(assert (=> b!33762 (= e!22432 e!22438)))

(declare-fun res!28962 () Bool)

(assert (=> b!33762 (=> res!28962 e!22438)))

(declare-fun lt!49507 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!49515 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!33762 (= res!28962 (not (= lt!49507 (bvsub (bvadd lt!49515 to!314) i!635))))))

(declare-datatypes ((array!1874 0))(
  ( (array!1875 (arr!1304 (Array (_ BitVec 32) (_ BitVec 8))) (size!829 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1450 0))(
  ( (BitStream!1451 (buf!1157 array!1874) (currentByte!2524 (_ BitVec 32)) (currentBit!2519 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2513 0))(
  ( (Unit!2514) )
))
(declare-datatypes ((tuple2!3430 0))(
  ( (tuple2!3431 (_1!1802 Unit!2513) (_2!1802 BitStream!1450)) )
))
(declare-fun lt!49509 () tuple2!3430)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!33762 (= lt!49507 (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!49509))) (currentByte!2524 (_2!1802 lt!49509)) (currentBit!2519 (_2!1802 lt!49509))))))

(declare-fun b!33763 () Bool)

(declare-fun res!28954 () Bool)

(assert (=> b!33763 (=> res!28954 e!22438)))

(declare-fun thiss!1379 () BitStream!1450)

(assert (=> b!33763 (= res!28954 (not (= (size!829 (buf!1157 thiss!1379)) (size!829 (buf!1157 (_2!1802 lt!49509))))))))

(declare-fun b!33764 () Bool)

(declare-fun e!22430 () Bool)

(declare-fun e!22436 () Bool)

(assert (=> b!33764 (= e!22430 e!22436)))

(declare-fun res!28960 () Bool)

(assert (=> b!33764 (=> res!28960 e!22436)))

(declare-fun lt!49518 () tuple2!3430)

(declare-fun isPrefixOf!0 (BitStream!1450 BitStream!1450) Bool)

(assert (=> b!33764 (= res!28960 (not (isPrefixOf!0 thiss!1379 (_2!1802 lt!49518))))))

(declare-fun lt!49504 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!33764 (validate_offset_bits!1 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49518)))) ((_ sign_extend 32) (currentByte!2524 (_2!1802 lt!49518))) ((_ sign_extend 32) (currentBit!2519 (_2!1802 lt!49518))) lt!49504)))

(assert (=> b!33764 (= lt!49504 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49506 () Unit!2513)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1450 BitStream!1450 (_ BitVec 64) (_ BitVec 64)) Unit!2513)

(assert (=> b!33764 (= lt!49506 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1802 lt!49518) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1874)

(declare-fun appendBitFromByte!0 (BitStream!1450 (_ BitVec 8) (_ BitVec 32)) tuple2!3430)

(assert (=> b!33764 (= lt!49518 (appendBitFromByte!0 thiss!1379 (select (arr!1304 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!33765 () Bool)

(declare-fun e!22429 () Bool)

(assert (=> b!33765 (= e!22429 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!49515) (bvslt lt!49515 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49518))))))))))

(declare-fun lt!49498 () Bool)

(declare-fun bitAt!0 (array!1874 (_ BitVec 64)) Bool)

(assert (=> b!33765 (= lt!49498 (bitAt!0 (buf!1157 (_2!1802 lt!49509)) lt!49515))))

(declare-fun lt!49512 () Unit!2513)

(declare-fun lt!49516 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1874 array!1874 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2513)

(assert (=> b!33765 (= lt!49512 (arrayBitRangesEqImpliesEq!0 (buf!1157 (_2!1802 lt!49518)) (buf!1157 (_2!1802 lt!49509)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!49515 lt!49516))))

(declare-fun b!33766 () Bool)

(declare-fun e!22426 () Bool)

(assert (=> b!33766 (= e!22438 e!22426)))

(declare-fun res!28955 () Bool)

(assert (=> b!33766 (=> res!28955 e!22426)))

(assert (=> b!33766 (= res!28955 (not (= (size!829 (buf!1157 (_2!1802 lt!49518))) (size!829 (buf!1157 (_2!1802 lt!49509))))))))

(assert (=> b!33766 (= lt!49507 (bvsub (bvsub (bvadd lt!49516 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!33766 (= lt!49516 (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!49518))) (currentByte!2524 (_2!1802 lt!49518)) (currentBit!2519 (_2!1802 lt!49518))))))

(assert (=> b!33766 (= (size!829 (buf!1157 (_2!1802 lt!49509))) (size!829 (buf!1157 thiss!1379)))))

(declare-fun b!33767 () Bool)

(declare-fun e!22428 () Bool)

(declare-fun e!22425 () Bool)

(assert (=> b!33767 (= e!22428 e!22425)))

(declare-fun res!28963 () Bool)

(assert (=> b!33767 (=> res!28963 e!22425)))

(declare-fun lt!49500 () Bool)

(declare-datatypes ((List!426 0))(
  ( (Nil!423) (Cons!422 (h!541 Bool) (t!1176 List!426)) )
))
(declare-fun head!263 (List!426) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1450 array!1874 (_ BitVec 64) (_ BitVec 64)) List!426)

(assert (=> b!33767 (= res!28963 (not (= (head!263 (byteArrayBitContentToList!0 (_2!1802 lt!49509) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!49500)))))

(assert (=> b!33767 (= lt!49500 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!33768 () Bool)

(declare-fun res!28964 () Bool)

(assert (=> b!33768 (=> res!28964 e!22428)))

(declare-fun lt!49513 () List!426)

(declare-fun lt!49514 () Bool)

(assert (=> b!33768 (= res!28964 (not (= (head!263 lt!49513) lt!49514)))))

(declare-fun b!33769 () Bool)

(assert (=> b!33769 (= e!22425 e!22429)))

(declare-fun res!28948 () Bool)

(assert (=> b!33769 (=> res!28948 e!22429)))

(assert (=> b!33769 (= res!28948 (not (= lt!49498 lt!49500)))))

(assert (=> b!33769 (= lt!49498 (bitAt!0 (buf!1157 (_2!1802 lt!49518)) lt!49515))))

(declare-fun b!33770 () Bool)

(declare-fun res!28961 () Bool)

(assert (=> b!33770 (=> res!28961 e!22426)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!33770 (= res!28961 (not (invariant!0 (currentBit!2519 (_2!1802 lt!49518)) (currentByte!2524 (_2!1802 lt!49518)) (size!829 (buf!1157 (_2!1802 lt!49518))))))))

(declare-fun b!33771 () Bool)

(declare-fun res!28965 () Bool)

(assert (=> b!33771 (=> res!28965 e!22426)))

(assert (=> b!33771 (= res!28965 (not (invariant!0 (currentBit!2519 (_2!1802 lt!49518)) (currentByte!2524 (_2!1802 lt!49518)) (size!829 (buf!1157 (_2!1802 lt!49509))))))))

(declare-fun b!33772 () Bool)

(declare-fun res!28959 () Bool)

(declare-fun e!22427 () Bool)

(assert (=> b!33772 (=> (not res!28959) (not e!22427))))

(assert (=> b!33772 (= res!28959 (validate_offset_bits!1 ((_ sign_extend 32) (size!829 (buf!1157 thiss!1379))) ((_ sign_extend 32) (currentByte!2524 thiss!1379)) ((_ sign_extend 32) (currentBit!2519 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!33773 () Bool)

(assert (=> b!33773 (= e!22436 e!22432)))

(declare-fun res!28950 () Bool)

(assert (=> b!33773 (=> res!28950 e!22432)))

(assert (=> b!33773 (= res!28950 (not (isPrefixOf!0 (_2!1802 lt!49518) (_2!1802 lt!49509))))))

(assert (=> b!33773 (isPrefixOf!0 thiss!1379 (_2!1802 lt!49509))))

(declare-fun lt!49503 () Unit!2513)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1450 BitStream!1450 BitStream!1450) Unit!2513)

(assert (=> b!33773 (= lt!49503 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1802 lt!49518) (_2!1802 lt!49509)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1450 array!1874 (_ BitVec 64) (_ BitVec 64)) tuple2!3430)

(assert (=> b!33773 (= lt!49509 (appendBitsMSBFirstLoop!0 (_2!1802 lt!49518) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!22424 () Bool)

(assert (=> b!33773 e!22424))

(declare-fun res!28952 () Bool)

(assert (=> b!33773 (=> (not res!28952) (not e!22424))))

(assert (=> b!33773 (= res!28952 (validate_offset_bits!1 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49518)))) ((_ sign_extend 32) (currentByte!2524 thiss!1379)) ((_ sign_extend 32) (currentBit!2519 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49497 () Unit!2513)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1450 array!1874 (_ BitVec 64)) Unit!2513)

(assert (=> b!33773 (= lt!49497 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1157 (_2!1802 lt!49518)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!3432 0))(
  ( (tuple2!3433 (_1!1803 BitStream!1450) (_2!1803 BitStream!1450)) )
))
(declare-fun lt!49505 () tuple2!3432)

(declare-fun reader!0 (BitStream!1450 BitStream!1450) tuple2!3432)

(assert (=> b!33773 (= lt!49505 (reader!0 thiss!1379 (_2!1802 lt!49518)))))

(declare-fun b!33774 () Bool)

(declare-fun e!22434 () Bool)

(declare-fun array_inv!778 (array!1874) Bool)

(assert (=> b!33774 (= e!22434 (array_inv!778 (buf!1157 thiss!1379)))))

(declare-fun b!33776 () Bool)

(assert (=> b!33776 (= e!22427 (not e!22430))))

(declare-fun res!28953 () Bool)

(assert (=> b!33776 (=> res!28953 e!22430)))

(assert (=> b!33776 (= res!28953 (bvsge i!635 to!314))))

(assert (=> b!33776 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!49511 () Unit!2513)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1450) Unit!2513)

(assert (=> b!33776 (= lt!49511 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!33776 (= lt!49515 (bitIndex!0 (size!829 (buf!1157 thiss!1379)) (currentByte!2524 thiss!1379) (currentBit!2519 thiss!1379)))))

(declare-fun b!33777 () Bool)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1450 BitStream!1450 (_ BitVec 64)) List!426)

(assert (=> b!33777 (= e!22424 (= (head!263 (byteArrayBitContentToList!0 (_2!1802 lt!49518) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!263 (bitStreamReadBitsIntoList!0 (_2!1802 lt!49518) (_1!1803 lt!49505) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!33778 () Bool)

(declare-fun e!22431 () Bool)

(assert (=> b!33778 (= e!22431 e!22428)))

(declare-fun res!28956 () Bool)

(assert (=> b!33778 (=> res!28956 e!22428)))

(declare-fun lt!49510 () tuple2!3432)

(assert (=> b!33778 (= res!28956 (not (= lt!49514 (bitAt!0 (buf!1157 (_1!1803 lt!49510)) lt!49515))))))

(declare-fun lt!49517 () tuple2!3432)

(assert (=> b!33778 (= lt!49514 (bitAt!0 (buf!1157 (_1!1803 lt!49517)) lt!49515))))

(declare-fun b!33779 () Bool)

(declare-fun res!28958 () Bool)

(assert (=> b!33779 (=> res!28958 e!22438)))

(assert (=> b!33779 (= res!28958 (not (invariant!0 (currentBit!2519 (_2!1802 lt!49509)) (currentByte!2524 (_2!1802 lt!49509)) (size!829 (buf!1157 (_2!1802 lt!49509))))))))

(declare-fun b!33780 () Bool)

(declare-fun e!22435 () Bool)

(assert (=> b!33780 (= e!22435 e!22431)))

(declare-fun res!28957 () Bool)

(assert (=> b!33780 (=> res!28957 e!22431)))

(declare-fun lt!49501 () List!426)

(declare-fun lt!49502 () List!426)

(assert (=> b!33780 (= res!28957 (not (= lt!49501 lt!49502)))))

(assert (=> b!33780 (= lt!49502 lt!49501)))

(declare-fun tail!143 (List!426) List!426)

(assert (=> b!33780 (= lt!49501 (tail!143 lt!49513))))

(declare-fun lt!49519 () Unit!2513)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1450 BitStream!1450 BitStream!1450 BitStream!1450 (_ BitVec 64) List!426) Unit!2513)

(assert (=> b!33780 (= lt!49519 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1802 lt!49509) (_2!1802 lt!49509) (_1!1803 lt!49517) (_1!1803 lt!49510) (bvsub to!314 i!635) lt!49513))))

(declare-fun b!33781 () Bool)

(declare-fun res!28951 () Bool)

(assert (=> b!33781 (=> res!28951 e!22435)))

(declare-fun length!152 (List!426) Int)

(assert (=> b!33781 (= res!28951 (<= (length!152 lt!49513) 0))))

(declare-fun b!33775 () Bool)

(assert (=> b!33775 (= e!22426 e!22435)))

(declare-fun res!28947 () Bool)

(assert (=> b!33775 (=> res!28947 e!22435)))

(assert (=> b!33775 (= res!28947 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!33775 (= lt!49502 (bitStreamReadBitsIntoList!0 (_2!1802 lt!49509) (_1!1803 lt!49510) lt!49504))))

(assert (=> b!33775 (= lt!49513 (bitStreamReadBitsIntoList!0 (_2!1802 lt!49509) (_1!1803 lt!49517) (bvsub to!314 i!635)))))

(assert (=> b!33775 (validate_offset_bits!1 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49509)))) ((_ sign_extend 32) (currentByte!2524 (_2!1802 lt!49518))) ((_ sign_extend 32) (currentBit!2519 (_2!1802 lt!49518))) lt!49504)))

(declare-fun lt!49499 () Unit!2513)

(assert (=> b!33775 (= lt!49499 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1802 lt!49518) (buf!1157 (_2!1802 lt!49509)) lt!49504))))

(assert (=> b!33775 (= lt!49510 (reader!0 (_2!1802 lt!49518) (_2!1802 lt!49509)))))

(assert (=> b!33775 (validate_offset_bits!1 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49509)))) ((_ sign_extend 32) (currentByte!2524 thiss!1379)) ((_ sign_extend 32) (currentBit!2519 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!49508 () Unit!2513)

(assert (=> b!33775 (= lt!49508 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1157 (_2!1802 lt!49509)) (bvsub to!314 i!635)))))

(assert (=> b!33775 (= lt!49517 (reader!0 thiss!1379 (_2!1802 lt!49509)))))

(declare-fun res!28949 () Bool)

(assert (=> start!6938 (=> (not res!28949) (not e!22427))))

(assert (=> start!6938 (= res!28949 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!829 srcBuffer!2))))))))

(assert (=> start!6938 e!22427))

(assert (=> start!6938 true))

(assert (=> start!6938 (array_inv!778 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1450) Bool)

(assert (=> start!6938 (and (inv!12 thiss!1379) e!22434)))

(assert (= (and start!6938 res!28949) b!33772))

(assert (= (and b!33772 res!28959) b!33776))

(assert (= (and b!33776 (not res!28953)) b!33764))

(assert (= (and b!33764 (not res!28960)) b!33773))

(assert (= (and b!33773 res!28952) b!33777))

(assert (= (and b!33773 (not res!28950)) b!33762))

(assert (= (and b!33762 (not res!28962)) b!33779))

(assert (= (and b!33779 (not res!28958)) b!33763))

(assert (= (and b!33763 (not res!28954)) b!33766))

(assert (= (and b!33766 (not res!28955)) b!33770))

(assert (= (and b!33770 (not res!28961)) b!33771))

(assert (= (and b!33771 (not res!28965)) b!33775))

(assert (= (and b!33775 (not res!28947)) b!33781))

(assert (= (and b!33781 (not res!28951)) b!33780))

(assert (= (and b!33780 (not res!28957)) b!33778))

(assert (= (and b!33778 (not res!28956)) b!33768))

(assert (= (and b!33768 (not res!28964)) b!33767))

(assert (= (and b!33767 (not res!28963)) b!33769))

(assert (= (and b!33769 (not res!28948)) b!33765))

(assert (= start!6938 b!33774))

(declare-fun m!50109 () Bool)

(assert (=> b!33780 m!50109))

(declare-fun m!50111 () Bool)

(assert (=> b!33780 m!50111))

(declare-fun m!50113 () Bool)

(assert (=> b!33767 m!50113))

(assert (=> b!33767 m!50113))

(declare-fun m!50115 () Bool)

(assert (=> b!33767 m!50115))

(declare-fun m!50117 () Bool)

(assert (=> b!33767 m!50117))

(declare-fun m!50119 () Bool)

(assert (=> b!33771 m!50119))

(declare-fun m!50121 () Bool)

(assert (=> b!33777 m!50121))

(assert (=> b!33777 m!50121))

(declare-fun m!50123 () Bool)

(assert (=> b!33777 m!50123))

(declare-fun m!50125 () Bool)

(assert (=> b!33777 m!50125))

(assert (=> b!33777 m!50125))

(declare-fun m!50127 () Bool)

(assert (=> b!33777 m!50127))

(declare-fun m!50129 () Bool)

(assert (=> b!33765 m!50129))

(declare-fun m!50131 () Bool)

(assert (=> b!33765 m!50131))

(declare-fun m!50133 () Bool)

(assert (=> b!33762 m!50133))

(declare-fun m!50135 () Bool)

(assert (=> b!33776 m!50135))

(declare-fun m!50137 () Bool)

(assert (=> b!33776 m!50137))

(declare-fun m!50139 () Bool)

(assert (=> b!33776 m!50139))

(declare-fun m!50141 () Bool)

(assert (=> b!33779 m!50141))

(declare-fun m!50143 () Bool)

(assert (=> b!33770 m!50143))

(declare-fun m!50145 () Bool)

(assert (=> b!33774 m!50145))

(declare-fun m!50147 () Bool)

(assert (=> b!33775 m!50147))

(declare-fun m!50149 () Bool)

(assert (=> b!33775 m!50149))

(declare-fun m!50151 () Bool)

(assert (=> b!33775 m!50151))

(declare-fun m!50153 () Bool)

(assert (=> b!33775 m!50153))

(declare-fun m!50155 () Bool)

(assert (=> b!33775 m!50155))

(declare-fun m!50157 () Bool)

(assert (=> b!33775 m!50157))

(declare-fun m!50159 () Bool)

(assert (=> b!33775 m!50159))

(declare-fun m!50161 () Bool)

(assert (=> b!33775 m!50161))

(declare-fun m!50163 () Bool)

(assert (=> b!33764 m!50163))

(declare-fun m!50165 () Bool)

(assert (=> b!33764 m!50165))

(declare-fun m!50167 () Bool)

(assert (=> b!33764 m!50167))

(declare-fun m!50169 () Bool)

(assert (=> b!33764 m!50169))

(assert (=> b!33764 m!50163))

(declare-fun m!50171 () Bool)

(assert (=> b!33764 m!50171))

(declare-fun m!50173 () Bool)

(assert (=> b!33781 m!50173))

(declare-fun m!50175 () Bool)

(assert (=> b!33773 m!50175))

(declare-fun m!50177 () Bool)

(assert (=> b!33773 m!50177))

(declare-fun m!50179 () Bool)

(assert (=> b!33773 m!50179))

(declare-fun m!50181 () Bool)

(assert (=> b!33773 m!50181))

(declare-fun m!50183 () Bool)

(assert (=> b!33773 m!50183))

(declare-fun m!50185 () Bool)

(assert (=> b!33773 m!50185))

(declare-fun m!50187 () Bool)

(assert (=> b!33773 m!50187))

(declare-fun m!50189 () Bool)

(assert (=> b!33768 m!50189))

(declare-fun m!50191 () Bool)

(assert (=> b!33766 m!50191))

(declare-fun m!50193 () Bool)

(assert (=> b!33778 m!50193))

(declare-fun m!50195 () Bool)

(assert (=> b!33778 m!50195))

(declare-fun m!50197 () Bool)

(assert (=> b!33769 m!50197))

(declare-fun m!50199 () Bool)

(assert (=> b!33772 m!50199))

(declare-fun m!50201 () Bool)

(assert (=> start!6938 m!50201))

(declare-fun m!50203 () Bool)

(assert (=> start!6938 m!50203))

(push 1)

(assert (not b!33772))

(assert (not b!33774))

(assert (not b!33778))

(assert (not b!33764))

(assert (not b!33776))

(assert (not b!33770))

(assert (not b!33762))

(assert (not b!33773))

(assert (not start!6938))

(assert (not b!33780))

(assert (not b!33768))

(assert (not b!33779))

(assert (not b!33781))

(assert (not b!33765))

(assert (not b!33767))

(assert (not b!33777))

(assert (not b!33769))

(assert (not b!33775))

(assert (not b!33766))

(assert (not b!33771))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9632 () Bool)

(assert (=> d!9632 (= (bitAt!0 (buf!1157 (_2!1802 lt!49518)) lt!49515) (not (= (bvand ((_ sign_extend 24) (select (arr!1304 (buf!1157 (_2!1802 lt!49518))) ((_ extract 31 0) (bvsdiv lt!49515 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!49515 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2648 () Bool)

(assert (= bs!2648 d!9632))

(declare-fun m!50425 () Bool)

(assert (=> bs!2648 m!50425))

(declare-fun m!50427 () Bool)

(assert (=> bs!2648 m!50427))

(assert (=> b!33769 d!9632))

(declare-fun d!9634 () Bool)

(assert (=> d!9634 (= (tail!143 lt!49513) (t!1176 lt!49513))))

(assert (=> b!33780 d!9634))

(declare-fun d!9636 () Bool)

(declare-fun e!22543 () Bool)

(assert (=> d!9636 e!22543))

(declare-fun res!29102 () Bool)

(assert (=> d!9636 (=> (not res!29102) (not e!22543))))

(declare-fun lt!49696 () (_ BitVec 64))

(assert (=> d!9636 (= res!29102 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!49696 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!49696) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!9636 (= lt!49696 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!49695 () Unit!2513)

(declare-fun choose!42 (BitStream!1450 BitStream!1450 BitStream!1450 BitStream!1450 (_ BitVec 64) List!426) Unit!2513)

(assert (=> d!9636 (= lt!49695 (choose!42 (_2!1802 lt!49509) (_2!1802 lt!49509) (_1!1803 lt!49517) (_1!1803 lt!49510) (bvsub to!314 i!635) lt!49513))))

(assert (=> d!9636 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9636 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1802 lt!49509) (_2!1802 lt!49509) (_1!1803 lt!49517) (_1!1803 lt!49510) (bvsub to!314 i!635) lt!49513) lt!49695)))

(declare-fun b!33924 () Bool)

(assert (=> b!33924 (= e!22543 (= (bitStreamReadBitsIntoList!0 (_2!1802 lt!49509) (_1!1803 lt!49510) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!143 lt!49513)))))

(assert (= (and d!9636 res!29102) b!33924))

(declare-fun m!50433 () Bool)

(assert (=> d!9636 m!50433))

(declare-fun m!50435 () Bool)

(assert (=> b!33924 m!50435))

(assert (=> b!33924 m!50109))

(assert (=> b!33780 d!9636))

(declare-fun d!9648 () Bool)

(assert (=> d!9648 (= (invariant!0 (currentBit!2519 (_2!1802 lt!49518)) (currentByte!2524 (_2!1802 lt!49518)) (size!829 (buf!1157 (_2!1802 lt!49518)))) (and (bvsge (currentBit!2519 (_2!1802 lt!49518)) #b00000000000000000000000000000000) (bvslt (currentBit!2519 (_2!1802 lt!49518)) #b00000000000000000000000000001000) (bvsge (currentByte!2524 (_2!1802 lt!49518)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2524 (_2!1802 lt!49518)) (size!829 (buf!1157 (_2!1802 lt!49518)))) (and (= (currentBit!2519 (_2!1802 lt!49518)) #b00000000000000000000000000000000) (= (currentByte!2524 (_2!1802 lt!49518)) (size!829 (buf!1157 (_2!1802 lt!49518))))))))))

(assert (=> b!33770 d!9648))

(declare-fun d!9652 () Bool)

(assert (=> d!9652 (= (head!263 lt!49513) (h!541 lt!49513))))

(assert (=> b!33768 d!9652))

(declare-fun d!9654 () Bool)

(assert (=> d!9654 (= (invariant!0 (currentBit!2519 (_2!1802 lt!49509)) (currentByte!2524 (_2!1802 lt!49509)) (size!829 (buf!1157 (_2!1802 lt!49509)))) (and (bvsge (currentBit!2519 (_2!1802 lt!49509)) #b00000000000000000000000000000000) (bvslt (currentBit!2519 (_2!1802 lt!49509)) #b00000000000000000000000000001000) (bvsge (currentByte!2524 (_2!1802 lt!49509)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2524 (_2!1802 lt!49509)) (size!829 (buf!1157 (_2!1802 lt!49509)))) (and (= (currentBit!2519 (_2!1802 lt!49509)) #b00000000000000000000000000000000) (= (currentByte!2524 (_2!1802 lt!49509)) (size!829 (buf!1157 (_2!1802 lt!49509))))))))))

(assert (=> b!33779 d!9654))

(declare-fun d!9656 () Bool)

(assert (=> d!9656 (= (head!263 (byteArrayBitContentToList!0 (_2!1802 lt!49518) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!541 (byteArrayBitContentToList!0 (_2!1802 lt!49518) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!33777 d!9656))

(declare-fun d!9658 () Bool)

(declare-fun c!2229 () Bool)

(assert (=> d!9658 (= c!2229 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22549 () List!426)

(assert (=> d!9658 (= (byteArrayBitContentToList!0 (_2!1802 lt!49518) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!22549)))

(declare-fun b!33935 () Bool)

(assert (=> b!33935 (= e!22549 Nil!423)))

(declare-fun b!33936 () Bool)

(assert (=> b!33936 (= e!22549 (Cons!422 (not (= (bvand ((_ sign_extend 24) (select (arr!1304 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1802 lt!49518) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!9658 c!2229) b!33935))

(assert (= (and d!9658 (not c!2229)) b!33936))

(assert (=> b!33936 m!50163))

(declare-fun m!50441 () Bool)

(assert (=> b!33936 m!50441))

(declare-fun m!50443 () Bool)

(assert (=> b!33936 m!50443))

(assert (=> b!33777 d!9658))

(declare-fun d!9664 () Bool)

(assert (=> d!9664 (= (head!263 (bitStreamReadBitsIntoList!0 (_2!1802 lt!49518) (_1!1803 lt!49505) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!541 (bitStreamReadBitsIntoList!0 (_2!1802 lt!49518) (_1!1803 lt!49505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!33777 d!9664))

(declare-fun b!33968 () Bool)

(declare-fun e!22566 () Bool)

(declare-fun lt!49717 () List!426)

(declare-fun isEmpty!92 (List!426) Bool)

(assert (=> b!33968 (= e!22566 (isEmpty!92 lt!49717))))

(declare-fun d!9666 () Bool)

(assert (=> d!9666 e!22566))

(declare-fun c!2240 () Bool)

(assert (=> d!9666 (= c!2240 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3456 0))(
  ( (tuple2!3457 (_1!1815 List!426) (_2!1815 BitStream!1450)) )
))
(declare-fun e!22567 () tuple2!3456)

(assert (=> d!9666 (= lt!49717 (_1!1815 e!22567))))

(declare-fun c!2241 () Bool)

(assert (=> d!9666 (= c!2241 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9666 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9666 (= (bitStreamReadBitsIntoList!0 (_2!1802 lt!49518) (_1!1803 lt!49505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!49717)))

(declare-datatypes ((tuple2!3458 0))(
  ( (tuple2!3459 (_1!1816 Bool) (_2!1816 BitStream!1450)) )
))
(declare-fun lt!49715 () tuple2!3458)

(declare-fun b!33967 () Bool)

(declare-fun lt!49716 () (_ BitVec 64))

(assert (=> b!33967 (= e!22567 (tuple2!3457 (Cons!422 (_1!1816 lt!49715) (bitStreamReadBitsIntoList!0 (_2!1802 lt!49518) (_2!1816 lt!49715) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!49716))) (_2!1816 lt!49715)))))

(declare-fun readBit!0 (BitStream!1450) tuple2!3458)

(assert (=> b!33967 (= lt!49715 (readBit!0 (_1!1803 lt!49505)))))

(assert (=> b!33967 (= lt!49716 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!33966 () Bool)

(assert (=> b!33966 (= e!22567 (tuple2!3457 Nil!423 (_1!1803 lt!49505)))))

(declare-fun b!33969 () Bool)

(assert (=> b!33969 (= e!22566 (> (length!152 lt!49717) 0))))

(assert (= (and d!9666 c!2241) b!33966))

(assert (= (and d!9666 (not c!2241)) b!33967))

(assert (= (and d!9666 c!2240) b!33968))

(assert (= (and d!9666 (not c!2240)) b!33969))

(declare-fun m!50457 () Bool)

(assert (=> b!33968 m!50457))

(declare-fun m!50459 () Bool)

(assert (=> b!33967 m!50459))

(declare-fun m!50461 () Bool)

(assert (=> b!33967 m!50461))

(declare-fun m!50463 () Bool)

(assert (=> b!33969 m!50463))

(assert (=> b!33777 d!9666))

(declare-fun d!9674 () Bool)

(assert (=> d!9674 (= (head!263 (byteArrayBitContentToList!0 (_2!1802 lt!49509) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!541 (byteArrayBitContentToList!0 (_2!1802 lt!49509) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!33767 d!9674))

(declare-fun d!9676 () Bool)

(declare-fun c!2242 () Bool)

(assert (=> d!9676 (= c!2242 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22568 () List!426)

(assert (=> d!9676 (= (byteArrayBitContentToList!0 (_2!1802 lt!49509) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!22568)))

(declare-fun b!33970 () Bool)

(assert (=> b!33970 (= e!22568 Nil!423)))

(declare-fun b!33971 () Bool)

(assert (=> b!33971 (= e!22568 (Cons!422 (not (= (bvand ((_ sign_extend 24) (select (arr!1304 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1802 lt!49509) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!9676 c!2242) b!33970))

(assert (= (and d!9676 (not c!2242)) b!33971))

(assert (=> b!33971 m!50163))

(assert (=> b!33971 m!50441))

(declare-fun m!50465 () Bool)

(assert (=> b!33971 m!50465))

(assert (=> b!33767 d!9676))

(declare-fun d!9678 () Bool)

(assert (=> d!9678 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1304 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2652 () Bool)

(assert (= bs!2652 d!9678))

(assert (=> bs!2652 m!50163))

(assert (=> bs!2652 m!50441))

(assert (=> b!33767 d!9678))

(declare-fun d!9680 () Bool)

(assert (=> d!9680 (= (bitAt!0 (buf!1157 (_1!1803 lt!49510)) lt!49515) (not (= (bvand ((_ sign_extend 24) (select (arr!1304 (buf!1157 (_1!1803 lt!49510))) ((_ extract 31 0) (bvsdiv lt!49515 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!49515 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2653 () Bool)

(assert (= bs!2653 d!9680))

(declare-fun m!50467 () Bool)

(assert (=> bs!2653 m!50467))

(assert (=> bs!2653 m!50427))

(assert (=> b!33778 d!9680))

(declare-fun d!9682 () Bool)

(assert (=> d!9682 (= (bitAt!0 (buf!1157 (_1!1803 lt!49517)) lt!49515) (not (= (bvand ((_ sign_extend 24) (select (arr!1304 (buf!1157 (_1!1803 lt!49517))) ((_ extract 31 0) (bvsdiv lt!49515 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!49515 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2654 () Bool)

(assert (= bs!2654 d!9682))

(declare-fun m!50469 () Bool)

(assert (=> bs!2654 m!50469))

(assert (=> bs!2654 m!50427))

(assert (=> b!33778 d!9682))

(declare-fun d!9684 () Bool)

(assert (=> d!9684 (= (bitAt!0 (buf!1157 (_2!1802 lt!49509)) lt!49515) (not (= (bvand ((_ sign_extend 24) (select (arr!1304 (buf!1157 (_2!1802 lt!49509))) ((_ extract 31 0) (bvsdiv lt!49515 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!49515 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2655 () Bool)

(assert (= bs!2655 d!9684))

(declare-fun m!50471 () Bool)

(assert (=> bs!2655 m!50471))

(assert (=> bs!2655 m!50427))

(assert (=> b!33765 d!9684))

(declare-fun d!9686 () Bool)

(assert (=> d!9686 (= (bitAt!0 (buf!1157 (_2!1802 lt!49518)) lt!49515) (bitAt!0 (buf!1157 (_2!1802 lt!49509)) lt!49515))))

(declare-fun lt!49720 () Unit!2513)

(declare-fun choose!31 (array!1874 array!1874 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2513)

(assert (=> d!9686 (= lt!49720 (choose!31 (buf!1157 (_2!1802 lt!49518)) (buf!1157 (_2!1802 lt!49509)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!49515 lt!49516))))

(assert (=> d!9686 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!49516))))

(assert (=> d!9686 (= (arrayBitRangesEqImpliesEq!0 (buf!1157 (_2!1802 lt!49518)) (buf!1157 (_2!1802 lt!49509)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!49515 lt!49516) lt!49720)))

(declare-fun bs!2656 () Bool)

(assert (= bs!2656 d!9686))

(assert (=> bs!2656 m!50197))

(assert (=> bs!2656 m!50129))

(declare-fun m!50473 () Bool)

(assert (=> bs!2656 m!50473))

(assert (=> b!33765 d!9686))

(declare-fun d!9688 () Bool)

(declare-fun res!29127 () Bool)

(declare-fun e!22578 () Bool)

(assert (=> d!9688 (=> (not res!29127) (not e!22578))))

(assert (=> d!9688 (= res!29127 (= (size!829 (buf!1157 thiss!1379)) (size!829 (buf!1157 thiss!1379))))))

(assert (=> d!9688 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!22578)))

(declare-fun b!33987 () Bool)

(declare-fun res!29128 () Bool)

(assert (=> b!33987 (=> (not res!29128) (not e!22578))))

(assert (=> b!33987 (= res!29128 (bvsle (bitIndex!0 (size!829 (buf!1157 thiss!1379)) (currentByte!2524 thiss!1379) (currentBit!2519 thiss!1379)) (bitIndex!0 (size!829 (buf!1157 thiss!1379)) (currentByte!2524 thiss!1379) (currentBit!2519 thiss!1379))))))

(declare-fun b!33988 () Bool)

(declare-fun e!22579 () Bool)

(assert (=> b!33988 (= e!22578 e!22579)))

(declare-fun res!29129 () Bool)

(assert (=> b!33988 (=> res!29129 e!22579)))

(assert (=> b!33988 (= res!29129 (= (size!829 (buf!1157 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!33989 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1874 array!1874 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!33989 (= e!22579 (arrayBitRangesEq!0 (buf!1157 thiss!1379) (buf!1157 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!829 (buf!1157 thiss!1379)) (currentByte!2524 thiss!1379) (currentBit!2519 thiss!1379))))))

(assert (= (and d!9688 res!29127) b!33987))

(assert (= (and b!33987 res!29128) b!33988))

(assert (= (and b!33988 (not res!29129)) b!33989))

(assert (=> b!33987 m!50139))

(assert (=> b!33987 m!50139))

(assert (=> b!33989 m!50139))

(assert (=> b!33989 m!50139))

(declare-fun m!50483 () Bool)

(assert (=> b!33989 m!50483))

(assert (=> b!33776 d!9688))

(declare-fun d!9696 () Bool)

(assert (=> d!9696 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!49744 () Unit!2513)

(declare-fun choose!11 (BitStream!1450) Unit!2513)

(assert (=> d!9696 (= lt!49744 (choose!11 thiss!1379))))

(assert (=> d!9696 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!49744)))

(declare-fun bs!2660 () Bool)

(assert (= bs!2660 d!9696))

(assert (=> bs!2660 m!50135))

(declare-fun m!50489 () Bool)

(assert (=> bs!2660 m!50489))

(assert (=> b!33776 d!9696))

(declare-fun d!9702 () Bool)

(declare-fun e!22584 () Bool)

(assert (=> d!9702 e!22584))

(declare-fun res!29137 () Bool)

(assert (=> d!9702 (=> (not res!29137) (not e!22584))))

(declare-fun lt!49757 () (_ BitVec 64))

(declare-fun lt!49758 () (_ BitVec 64))

(declare-fun lt!49760 () (_ BitVec 64))

(assert (=> d!9702 (= res!29137 (= lt!49757 (bvsub lt!49760 lt!49758)))))

(assert (=> d!9702 (or (= (bvand lt!49760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!49758 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!49760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!49760 lt!49758) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!9702 (= lt!49758 (remainingBits!0 ((_ sign_extend 32) (size!829 (buf!1157 thiss!1379))) ((_ sign_extend 32) (currentByte!2524 thiss!1379)) ((_ sign_extend 32) (currentBit!2519 thiss!1379))))))

(declare-fun lt!49759 () (_ BitVec 64))

(declare-fun lt!49761 () (_ BitVec 64))

(assert (=> d!9702 (= lt!49760 (bvmul lt!49759 lt!49761))))

(assert (=> d!9702 (or (= lt!49759 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!49761 (bvsdiv (bvmul lt!49759 lt!49761) lt!49759)))))

(assert (=> d!9702 (= lt!49761 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9702 (= lt!49759 ((_ sign_extend 32) (size!829 (buf!1157 thiss!1379))))))

(assert (=> d!9702 (= lt!49757 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2524 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2519 thiss!1379))))))

(assert (=> d!9702 (invariant!0 (currentBit!2519 thiss!1379) (currentByte!2524 thiss!1379) (size!829 (buf!1157 thiss!1379)))))

(assert (=> d!9702 (= (bitIndex!0 (size!829 (buf!1157 thiss!1379)) (currentByte!2524 thiss!1379) (currentBit!2519 thiss!1379)) lt!49757)))

(declare-fun b!33997 () Bool)

(declare-fun res!29138 () Bool)

(assert (=> b!33997 (=> (not res!29138) (not e!22584))))

(assert (=> b!33997 (= res!29138 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!49757))))

(declare-fun b!33998 () Bool)

(declare-fun lt!49762 () (_ BitVec 64))

(assert (=> b!33998 (= e!22584 (bvsle lt!49757 (bvmul lt!49762 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!33998 (or (= lt!49762 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!49762 #b0000000000000000000000000000000000000000000000000000000000001000) lt!49762)))))

(assert (=> b!33998 (= lt!49762 ((_ sign_extend 32) (size!829 (buf!1157 thiss!1379))))))

(assert (= (and d!9702 res!29137) b!33997))

(assert (= (and b!33997 res!29138) b!33998))

(declare-fun m!50491 () Bool)

(assert (=> d!9702 m!50491))

(declare-fun m!50493 () Bool)

(assert (=> d!9702 m!50493))

(assert (=> b!33776 d!9702))

(declare-fun d!9704 () Bool)

(declare-fun e!22585 () Bool)

(assert (=> d!9704 e!22585))

(declare-fun res!29139 () Bool)

(assert (=> d!9704 (=> (not res!29139) (not e!22585))))

(declare-fun lt!49766 () (_ BitVec 64))

(declare-fun lt!49763 () (_ BitVec 64))

(declare-fun lt!49764 () (_ BitVec 64))

(assert (=> d!9704 (= res!29139 (= lt!49763 (bvsub lt!49766 lt!49764)))))

(assert (=> d!9704 (or (= (bvand lt!49766 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!49764 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!49766 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!49766 lt!49764) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9704 (= lt!49764 (remainingBits!0 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49518)))) ((_ sign_extend 32) (currentByte!2524 (_2!1802 lt!49518))) ((_ sign_extend 32) (currentBit!2519 (_2!1802 lt!49518)))))))

(declare-fun lt!49765 () (_ BitVec 64))

(declare-fun lt!49767 () (_ BitVec 64))

(assert (=> d!9704 (= lt!49766 (bvmul lt!49765 lt!49767))))

(assert (=> d!9704 (or (= lt!49765 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!49767 (bvsdiv (bvmul lt!49765 lt!49767) lt!49765)))))

(assert (=> d!9704 (= lt!49767 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9704 (= lt!49765 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49518)))))))

(assert (=> d!9704 (= lt!49763 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2524 (_2!1802 lt!49518))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2519 (_2!1802 lt!49518)))))))

(assert (=> d!9704 (invariant!0 (currentBit!2519 (_2!1802 lt!49518)) (currentByte!2524 (_2!1802 lt!49518)) (size!829 (buf!1157 (_2!1802 lt!49518))))))

(assert (=> d!9704 (= (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!49518))) (currentByte!2524 (_2!1802 lt!49518)) (currentBit!2519 (_2!1802 lt!49518))) lt!49763)))

(declare-fun b!33999 () Bool)

(declare-fun res!29140 () Bool)

(assert (=> b!33999 (=> (not res!29140) (not e!22585))))

(assert (=> b!33999 (= res!29140 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!49763))))

(declare-fun b!34000 () Bool)

(declare-fun lt!49768 () (_ BitVec 64))

(assert (=> b!34000 (= e!22585 (bvsle lt!49763 (bvmul lt!49768 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!34000 (or (= lt!49768 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!49768 #b0000000000000000000000000000000000000000000000000000000000001000) lt!49768)))))

(assert (=> b!34000 (= lt!49768 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49518)))))))

(assert (= (and d!9704 res!29139) b!33999))

(assert (= (and b!33999 res!29140) b!34000))

(declare-fun m!50495 () Bool)

(assert (=> d!9704 m!50495))

(assert (=> d!9704 m!50143))

(assert (=> b!33766 d!9704))

(declare-fun d!9706 () Bool)

(declare-fun res!29141 () Bool)

(declare-fun e!22586 () Bool)

(assert (=> d!9706 (=> (not res!29141) (not e!22586))))

(assert (=> d!9706 (= res!29141 (= (size!829 (buf!1157 thiss!1379)) (size!829 (buf!1157 (_2!1802 lt!49518)))))))

(assert (=> d!9706 (= (isPrefixOf!0 thiss!1379 (_2!1802 lt!49518)) e!22586)))

(declare-fun b!34001 () Bool)

(declare-fun res!29142 () Bool)

(assert (=> b!34001 (=> (not res!29142) (not e!22586))))

(assert (=> b!34001 (= res!29142 (bvsle (bitIndex!0 (size!829 (buf!1157 thiss!1379)) (currentByte!2524 thiss!1379) (currentBit!2519 thiss!1379)) (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!49518))) (currentByte!2524 (_2!1802 lt!49518)) (currentBit!2519 (_2!1802 lt!49518)))))))

(declare-fun b!34002 () Bool)

(declare-fun e!22587 () Bool)

(assert (=> b!34002 (= e!22586 e!22587)))

(declare-fun res!29143 () Bool)

(assert (=> b!34002 (=> res!29143 e!22587)))

(assert (=> b!34002 (= res!29143 (= (size!829 (buf!1157 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!34003 () Bool)

(assert (=> b!34003 (= e!22587 (arrayBitRangesEq!0 (buf!1157 thiss!1379) (buf!1157 (_2!1802 lt!49518)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!829 (buf!1157 thiss!1379)) (currentByte!2524 thiss!1379) (currentBit!2519 thiss!1379))))))

(assert (= (and d!9706 res!29141) b!34001))

(assert (= (and b!34001 res!29142) b!34002))

(assert (= (and b!34002 (not res!29143)) b!34003))

(assert (=> b!34001 m!50139))

(assert (=> b!34001 m!50191))

(assert (=> b!34003 m!50139))

(assert (=> b!34003 m!50139))

(declare-fun m!50497 () Bool)

(assert (=> b!34003 m!50497))

(assert (=> b!33764 d!9706))

(declare-fun d!9708 () Bool)

(assert (=> d!9708 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49518)))) ((_ sign_extend 32) (currentByte!2524 (_2!1802 lt!49518))) ((_ sign_extend 32) (currentBit!2519 (_2!1802 lt!49518))) lt!49504) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49518)))) ((_ sign_extend 32) (currentByte!2524 (_2!1802 lt!49518))) ((_ sign_extend 32) (currentBit!2519 (_2!1802 lt!49518)))) lt!49504))))

(declare-fun bs!2661 () Bool)

(assert (= bs!2661 d!9708))

(assert (=> bs!2661 m!50495))

(assert (=> b!33764 d!9708))

(declare-fun d!9710 () Bool)

(declare-fun e!22590 () Bool)

(assert (=> d!9710 e!22590))

(declare-fun res!29146 () Bool)

(assert (=> d!9710 (=> (not res!29146) (not e!22590))))

(assert (=> d!9710 (= res!29146 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!49771 () Unit!2513)

(declare-fun choose!27 (BitStream!1450 BitStream!1450 (_ BitVec 64) (_ BitVec 64)) Unit!2513)

(assert (=> d!9710 (= lt!49771 (choose!27 thiss!1379 (_2!1802 lt!49518) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!9710 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!9710 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1802 lt!49518) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!49771)))

(declare-fun b!34006 () Bool)

(assert (=> b!34006 (= e!22590 (validate_offset_bits!1 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49518)))) ((_ sign_extend 32) (currentByte!2524 (_2!1802 lt!49518))) ((_ sign_extend 32) (currentBit!2519 (_2!1802 lt!49518))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!9710 res!29146) b!34006))

(declare-fun m!50499 () Bool)

(assert (=> d!9710 m!50499))

(declare-fun m!50501 () Bool)

(assert (=> b!34006 m!50501))

(assert (=> b!33764 d!9710))

(declare-fun b!34039 () Bool)

(declare-fun res!29179 () Bool)

(declare-fun e!22606 () Bool)

(assert (=> b!34039 (=> (not res!29179) (not e!22606))))

(declare-fun lt!49867 () (_ BitVec 64))

(declare-fun lt!49860 () (_ BitVec 64))

(declare-fun lt!49864 () tuple2!3430)

(assert (=> b!34039 (= res!29179 (= (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!49864))) (currentByte!2524 (_2!1802 lt!49864)) (currentBit!2519 (_2!1802 lt!49864))) (bvadd lt!49867 lt!49860)))))

(assert (=> b!34039 (or (not (= (bvand lt!49867 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!49860 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!49867 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!49867 lt!49860) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34039 (= lt!49860 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!34039 (= lt!49867 (bitIndex!0 (size!829 (buf!1157 thiss!1379)) (currentByte!2524 thiss!1379) (currentBit!2519 thiss!1379)))))

(declare-fun b!34040 () Bool)

(declare-fun e!22608 () Bool)

(declare-datatypes ((tuple2!3460 0))(
  ( (tuple2!3461 (_1!1817 BitStream!1450) (_2!1817 Bool)) )
))
(declare-fun lt!49870 () tuple2!3460)

(declare-fun lt!49862 () tuple2!3430)

(assert (=> b!34040 (= e!22608 (= (bitIndex!0 (size!829 (buf!1157 (_1!1817 lt!49870))) (currentByte!2524 (_1!1817 lt!49870)) (currentBit!2519 (_1!1817 lt!49870))) (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!49862))) (currentByte!2524 (_2!1802 lt!49862)) (currentBit!2519 (_2!1802 lt!49862)))))))

(declare-fun b!34041 () Bool)

(declare-fun e!22605 () Bool)

(declare-fun lt!49863 () tuple2!3460)

(assert (=> b!34041 (= e!22605 (= (bitIndex!0 (size!829 (buf!1157 (_1!1817 lt!49863))) (currentByte!2524 (_1!1817 lt!49863)) (currentBit!2519 (_1!1817 lt!49863))) (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!49864))) (currentByte!2524 (_2!1802 lt!49864)) (currentBit!2519 (_2!1802 lt!49864)))))))

(declare-fun b!34042 () Bool)

(declare-fun res!29175 () Bool)

(declare-fun e!22607 () Bool)

(assert (=> b!34042 (=> (not res!29175) (not e!22607))))

(assert (=> b!34042 (= res!29175 (isPrefixOf!0 thiss!1379 (_2!1802 lt!49862)))))

(declare-fun d!9712 () Bool)

(assert (=> d!9712 e!22606))

(declare-fun res!29176 () Bool)

(assert (=> d!9712 (=> (not res!29176) (not e!22606))))

(assert (=> d!9712 (= res!29176 (= (size!829 (buf!1157 (_2!1802 lt!49864))) (size!829 (buf!1157 thiss!1379))))))

(declare-fun lt!49861 () (_ BitVec 8))

(declare-fun lt!49865 () array!1874)

(assert (=> d!9712 (= lt!49861 (select (arr!1304 lt!49865) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!9712 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!829 lt!49865)))))

(assert (=> d!9712 (= lt!49865 (array!1875 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!49859 () tuple2!3430)

(assert (=> d!9712 (= lt!49864 (tuple2!3431 (_1!1802 lt!49859) (_2!1802 lt!49859)))))

(assert (=> d!9712 (= lt!49859 lt!49862)))

(assert (=> d!9712 e!22607))

(declare-fun res!29177 () Bool)

(assert (=> d!9712 (=> (not res!29177) (not e!22607))))

(assert (=> d!9712 (= res!29177 (= (size!829 (buf!1157 thiss!1379)) (size!829 (buf!1157 (_2!1802 lt!49862)))))))

(declare-fun lt!49866 () Bool)

(declare-fun appendBit!0 (BitStream!1450 Bool) tuple2!3430)

(assert (=> d!9712 (= lt!49862 (appendBit!0 thiss!1379 lt!49866))))

(assert (=> d!9712 (= lt!49866 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1304 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!9712 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!9712 (= (appendBitFromByte!0 thiss!1379 (select (arr!1304 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!49864)))

(declare-fun b!34043 () Bool)

(declare-fun res!29172 () Bool)

(assert (=> b!34043 (=> (not res!29172) (not e!22607))))

(assert (=> b!34043 (= res!29172 (= (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!49862))) (currentByte!2524 (_2!1802 lt!49862)) (currentBit!2519 (_2!1802 lt!49862))) (bvadd (bitIndex!0 (size!829 (buf!1157 thiss!1379)) (currentByte!2524 thiss!1379) (currentBit!2519 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!34044 () Bool)

(assert (=> b!34044 (= e!22606 e!22605)))

(declare-fun res!29173 () Bool)

(assert (=> b!34044 (=> (not res!29173) (not e!22605))))

(assert (=> b!34044 (= res!29173 (and (= (_2!1817 lt!49863) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1304 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!49861)) #b00000000000000000000000000000000))) (= (_1!1817 lt!49863) (_2!1802 lt!49864))))))

(declare-datatypes ((tuple2!3462 0))(
  ( (tuple2!3463 (_1!1818 array!1874) (_2!1818 BitStream!1450)) )
))
(declare-fun lt!49868 () tuple2!3462)

(declare-fun lt!49869 () BitStream!1450)

(declare-fun readBits!0 (BitStream!1450 (_ BitVec 64)) tuple2!3462)

(assert (=> b!34044 (= lt!49868 (readBits!0 lt!49869 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1450) tuple2!3460)

(assert (=> b!34044 (= lt!49863 (readBitPure!0 lt!49869))))

(declare-fun readerFrom!0 (BitStream!1450 (_ BitVec 32) (_ BitVec 32)) BitStream!1450)

(assert (=> b!34044 (= lt!49869 (readerFrom!0 (_2!1802 lt!49864) (currentBit!2519 thiss!1379) (currentByte!2524 thiss!1379)))))

(declare-fun b!34045 () Bool)

(declare-fun res!29174 () Bool)

(assert (=> b!34045 (=> (not res!29174) (not e!22606))))

(assert (=> b!34045 (= res!29174 (isPrefixOf!0 thiss!1379 (_2!1802 lt!49864)))))

(declare-fun b!34046 () Bool)

(assert (=> b!34046 (= e!22607 e!22608)))

(declare-fun res!29178 () Bool)

(assert (=> b!34046 (=> (not res!29178) (not e!22608))))

(assert (=> b!34046 (= res!29178 (and (= (_2!1817 lt!49870) lt!49866) (= (_1!1817 lt!49870) (_2!1802 lt!49862))))))

(assert (=> b!34046 (= lt!49870 (readBitPure!0 (readerFrom!0 (_2!1802 lt!49862) (currentBit!2519 thiss!1379) (currentByte!2524 thiss!1379))))))

(assert (= (and d!9712 res!29177) b!34043))

(assert (= (and b!34043 res!29172) b!34042))

(assert (= (and b!34042 res!29175) b!34046))

(assert (= (and b!34046 res!29178) b!34040))

(assert (= (and d!9712 res!29176) b!34039))

(assert (= (and b!34039 res!29179) b!34045))

(assert (= (and b!34045 res!29174) b!34044))

(assert (= (and b!34044 res!29173) b!34041))

(declare-fun m!50533 () Bool)

(assert (=> d!9712 m!50533))

(declare-fun m!50535 () Bool)

(assert (=> d!9712 m!50535))

(assert (=> d!9712 m!50441))

(declare-fun m!50537 () Bool)

(assert (=> b!34045 m!50537))

(declare-fun m!50539 () Bool)

(assert (=> b!34044 m!50539))

(declare-fun m!50541 () Bool)

(assert (=> b!34044 m!50541))

(declare-fun m!50543 () Bool)

(assert (=> b!34044 m!50543))

(declare-fun m!50545 () Bool)

(assert (=> b!34046 m!50545))

(assert (=> b!34046 m!50545))

(declare-fun m!50547 () Bool)

(assert (=> b!34046 m!50547))

(declare-fun m!50549 () Bool)

(assert (=> b!34041 m!50549))

(declare-fun m!50551 () Bool)

(assert (=> b!34041 m!50551))

(assert (=> b!34039 m!50551))

(assert (=> b!34039 m!50139))

(declare-fun m!50553 () Bool)

(assert (=> b!34040 m!50553))

(declare-fun m!50555 () Bool)

(assert (=> b!34040 m!50555))

(declare-fun m!50557 () Bool)

(assert (=> b!34042 m!50557))

(assert (=> b!34043 m!50555))

(assert (=> b!34043 m!50139))

(assert (=> b!33764 d!9712))

(declare-fun d!9720 () Bool)

(assert (=> d!9720 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49509)))) ((_ sign_extend 32) (currentByte!2524 thiss!1379)) ((_ sign_extend 32) (currentBit!2519 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49509)))) ((_ sign_extend 32) (currentByte!2524 thiss!1379)) ((_ sign_extend 32) (currentBit!2519 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2664 () Bool)

(assert (= bs!2664 d!9720))

(declare-fun m!50559 () Bool)

(assert (=> bs!2664 m!50559))

(assert (=> b!33775 d!9720))

(declare-fun b!34049 () Bool)

(declare-fun e!22609 () Bool)

(declare-fun lt!49873 () List!426)

(assert (=> b!34049 (= e!22609 (isEmpty!92 lt!49873))))

(declare-fun d!9722 () Bool)

(assert (=> d!9722 e!22609))

(declare-fun c!2246 () Bool)

(assert (=> d!9722 (= c!2246 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22610 () tuple2!3456)

(assert (=> d!9722 (= lt!49873 (_1!1815 e!22610))))

(declare-fun c!2247 () Bool)

(assert (=> d!9722 (= c!2247 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9722 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9722 (= (bitStreamReadBitsIntoList!0 (_2!1802 lt!49509) (_1!1803 lt!49517) (bvsub to!314 i!635)) lt!49873)))

(declare-fun b!34048 () Bool)

(declare-fun lt!49872 () (_ BitVec 64))

(declare-fun lt!49871 () tuple2!3458)

(assert (=> b!34048 (= e!22610 (tuple2!3457 (Cons!422 (_1!1816 lt!49871) (bitStreamReadBitsIntoList!0 (_2!1802 lt!49509) (_2!1816 lt!49871) (bvsub (bvsub to!314 i!635) lt!49872))) (_2!1816 lt!49871)))))

(assert (=> b!34048 (= lt!49871 (readBit!0 (_1!1803 lt!49517)))))

(assert (=> b!34048 (= lt!49872 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!34047 () Bool)

(assert (=> b!34047 (= e!22610 (tuple2!3457 Nil!423 (_1!1803 lt!49517)))))

(declare-fun b!34050 () Bool)

(assert (=> b!34050 (= e!22609 (> (length!152 lt!49873) 0))))

(assert (= (and d!9722 c!2247) b!34047))

(assert (= (and d!9722 (not c!2247)) b!34048))

(assert (= (and d!9722 c!2246) b!34049))

(assert (= (and d!9722 (not c!2246)) b!34050))

(declare-fun m!50561 () Bool)

(assert (=> b!34049 m!50561))

(declare-fun m!50563 () Bool)

(assert (=> b!34048 m!50563))

(declare-fun m!50565 () Bool)

(assert (=> b!34048 m!50565))

(declare-fun m!50567 () Bool)

(assert (=> b!34050 m!50567))

(assert (=> b!33775 d!9722))

(declare-fun d!9724 () Bool)

(assert (=> d!9724 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49509)))) ((_ sign_extend 32) (currentByte!2524 (_2!1802 lt!49518))) ((_ sign_extend 32) (currentBit!2519 (_2!1802 lt!49518))) lt!49504) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49509)))) ((_ sign_extend 32) (currentByte!2524 (_2!1802 lt!49518))) ((_ sign_extend 32) (currentBit!2519 (_2!1802 lt!49518)))) lt!49504))))

(declare-fun bs!2665 () Bool)

(assert (= bs!2665 d!9724))

(declare-fun m!50569 () Bool)

(assert (=> bs!2665 m!50569))

(assert (=> b!33775 d!9724))

(declare-fun b!34065 () Bool)

(declare-fun e!22618 () Unit!2513)

(declare-fun Unit!2539 () Unit!2513)

(assert (=> b!34065 (= e!22618 Unit!2539)))

(declare-fun d!9726 () Bool)

(declare-fun e!22617 () Bool)

(assert (=> d!9726 e!22617))

(declare-fun res!29187 () Bool)

(assert (=> d!9726 (=> (not res!29187) (not e!22617))))

(declare-fun lt!50002 () tuple2!3432)

(assert (=> d!9726 (= res!29187 (isPrefixOf!0 (_1!1803 lt!50002) (_2!1803 lt!50002)))))

(declare-fun lt!50006 () BitStream!1450)

(assert (=> d!9726 (= lt!50002 (tuple2!3433 lt!50006 (_2!1802 lt!49509)))))

(declare-fun lt!50007 () Unit!2513)

(declare-fun lt!49998 () Unit!2513)

(assert (=> d!9726 (= lt!50007 lt!49998)))

(assert (=> d!9726 (isPrefixOf!0 lt!50006 (_2!1802 lt!49509))))

(assert (=> d!9726 (= lt!49998 (lemmaIsPrefixTransitive!0 lt!50006 (_2!1802 lt!49509) (_2!1802 lt!49509)))))

(declare-fun lt!49994 () Unit!2513)

(declare-fun lt!49997 () Unit!2513)

(assert (=> d!9726 (= lt!49994 lt!49997)))

(assert (=> d!9726 (isPrefixOf!0 lt!50006 (_2!1802 lt!49509))))

(assert (=> d!9726 (= lt!49997 (lemmaIsPrefixTransitive!0 lt!50006 thiss!1379 (_2!1802 lt!49509)))))

(declare-fun lt!50003 () Unit!2513)

(assert (=> d!9726 (= lt!50003 e!22618)))

(declare-fun c!2252 () Bool)

(assert (=> d!9726 (= c!2252 (not (= (size!829 (buf!1157 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!50001 () Unit!2513)

(declare-fun lt!49991 () Unit!2513)

(assert (=> d!9726 (= lt!50001 lt!49991)))

(assert (=> d!9726 (isPrefixOf!0 (_2!1802 lt!49509) (_2!1802 lt!49509))))

(assert (=> d!9726 (= lt!49991 (lemmaIsPrefixRefl!0 (_2!1802 lt!49509)))))

(declare-fun lt!49992 () Unit!2513)

(declare-fun lt!49999 () Unit!2513)

(assert (=> d!9726 (= lt!49992 lt!49999)))

(assert (=> d!9726 (= lt!49999 (lemmaIsPrefixRefl!0 (_2!1802 lt!49509)))))

(declare-fun lt!49996 () Unit!2513)

(declare-fun lt!50009 () Unit!2513)

(assert (=> d!9726 (= lt!49996 lt!50009)))

(assert (=> d!9726 (isPrefixOf!0 lt!50006 lt!50006)))

(assert (=> d!9726 (= lt!50009 (lemmaIsPrefixRefl!0 lt!50006))))

(declare-fun lt!50004 () Unit!2513)

(declare-fun lt!50008 () Unit!2513)

(assert (=> d!9726 (= lt!50004 lt!50008)))

(assert (=> d!9726 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!9726 (= lt!50008 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!9726 (= lt!50006 (BitStream!1451 (buf!1157 (_2!1802 lt!49509)) (currentByte!2524 thiss!1379) (currentBit!2519 thiss!1379)))))

(assert (=> d!9726 (isPrefixOf!0 thiss!1379 (_2!1802 lt!49509))))

(assert (=> d!9726 (= (reader!0 thiss!1379 (_2!1802 lt!49509)) lt!50002)))

(declare-fun b!34066 () Bool)

(declare-fun lt!49995 () Unit!2513)

(assert (=> b!34066 (= e!22618 lt!49995)))

(declare-fun lt!49993 () (_ BitVec 64))

(assert (=> b!34066 (= lt!49993 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!50005 () (_ BitVec 64))

(assert (=> b!34066 (= lt!50005 (bitIndex!0 (size!829 (buf!1157 thiss!1379)) (currentByte!2524 thiss!1379) (currentBit!2519 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1874 array!1874 (_ BitVec 64) (_ BitVec 64)) Unit!2513)

(assert (=> b!34066 (= lt!49995 (arrayBitRangesEqSymmetric!0 (buf!1157 thiss!1379) (buf!1157 (_2!1802 lt!49509)) lt!49993 lt!50005))))

(assert (=> b!34066 (arrayBitRangesEq!0 (buf!1157 (_2!1802 lt!49509)) (buf!1157 thiss!1379) lt!49993 lt!50005)))

(declare-fun b!34067 () Bool)

(declare-fun res!29186 () Bool)

(assert (=> b!34067 (=> (not res!29186) (not e!22617))))

(assert (=> b!34067 (= res!29186 (isPrefixOf!0 (_1!1803 lt!50002) thiss!1379))))

(declare-fun b!34068 () Bool)

(declare-fun res!29188 () Bool)

(assert (=> b!34068 (=> (not res!29188) (not e!22617))))

(assert (=> b!34068 (= res!29188 (isPrefixOf!0 (_2!1803 lt!50002) (_2!1802 lt!49509)))))

(declare-fun lt!50000 () (_ BitVec 64))

(declare-fun lt!49990 () (_ BitVec 64))

(declare-fun b!34069 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1450 (_ BitVec 64)) BitStream!1450)

(assert (=> b!34069 (= e!22617 (= (_1!1803 lt!50002) (withMovedBitIndex!0 (_2!1803 lt!50002) (bvsub lt!49990 lt!50000))))))

(assert (=> b!34069 (or (= (bvand lt!49990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!50000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!49990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!49990 lt!50000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34069 (= lt!50000 (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!49509))) (currentByte!2524 (_2!1802 lt!49509)) (currentBit!2519 (_2!1802 lt!49509))))))

(assert (=> b!34069 (= lt!49990 (bitIndex!0 (size!829 (buf!1157 thiss!1379)) (currentByte!2524 thiss!1379) (currentBit!2519 thiss!1379)))))

(assert (= (and d!9726 c!2252) b!34066))

(assert (= (and d!9726 (not c!2252)) b!34065))

(assert (= (and d!9726 res!29187) b!34067))

(assert (= (and b!34067 res!29186) b!34068))

(assert (= (and b!34068 res!29188) b!34069))

(declare-fun m!50571 () Bool)

(assert (=> b!34067 m!50571))

(declare-fun m!50573 () Bool)

(assert (=> b!34068 m!50573))

(declare-fun m!50575 () Bool)

(assert (=> d!9726 m!50575))

(declare-fun m!50577 () Bool)

(assert (=> d!9726 m!50577))

(declare-fun m!50579 () Bool)

(assert (=> d!9726 m!50579))

(assert (=> d!9726 m!50137))

(assert (=> d!9726 m!50135))

(assert (=> d!9726 m!50183))

(declare-fun m!50581 () Bool)

(assert (=> d!9726 m!50581))

(declare-fun m!50583 () Bool)

(assert (=> d!9726 m!50583))

(declare-fun m!50585 () Bool)

(assert (=> d!9726 m!50585))

(declare-fun m!50587 () Bool)

(assert (=> d!9726 m!50587))

(declare-fun m!50589 () Bool)

(assert (=> d!9726 m!50589))

(assert (=> b!34066 m!50139))

(declare-fun m!50591 () Bool)

(assert (=> b!34066 m!50591))

(declare-fun m!50593 () Bool)

(assert (=> b!34066 m!50593))

(declare-fun m!50595 () Bool)

(assert (=> b!34069 m!50595))

(assert (=> b!34069 m!50133))

(assert (=> b!34069 m!50139))

(assert (=> b!33775 d!9726))

(declare-fun d!9728 () Bool)

(assert (=> d!9728 (validate_offset_bits!1 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49509)))) ((_ sign_extend 32) (currentByte!2524 thiss!1379)) ((_ sign_extend 32) (currentBit!2519 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!50024 () Unit!2513)

(declare-fun choose!9 (BitStream!1450 array!1874 (_ BitVec 64) BitStream!1450) Unit!2513)

(assert (=> d!9728 (= lt!50024 (choose!9 thiss!1379 (buf!1157 (_2!1802 lt!49509)) (bvsub to!314 i!635) (BitStream!1451 (buf!1157 (_2!1802 lt!49509)) (currentByte!2524 thiss!1379) (currentBit!2519 thiss!1379))))))

(assert (=> d!9728 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1157 (_2!1802 lt!49509)) (bvsub to!314 i!635)) lt!50024)))

(declare-fun bs!2666 () Bool)

(assert (= bs!2666 d!9728))

(assert (=> bs!2666 m!50157))

(declare-fun m!50597 () Bool)

(assert (=> bs!2666 m!50597))

(assert (=> b!33775 d!9728))

(declare-fun b!34084 () Bool)

(declare-fun e!22623 () Bool)

(declare-fun lt!50027 () List!426)

(assert (=> b!34084 (= e!22623 (isEmpty!92 lt!50027))))

(declare-fun d!9730 () Bool)

(assert (=> d!9730 e!22623))

(declare-fun c!2253 () Bool)

(assert (=> d!9730 (= c!2253 (= lt!49504 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22624 () tuple2!3456)

(assert (=> d!9730 (= lt!50027 (_1!1815 e!22624))))

(declare-fun c!2254 () Bool)

(assert (=> d!9730 (= c!2254 (= lt!49504 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9730 (bvsge lt!49504 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9730 (= (bitStreamReadBitsIntoList!0 (_2!1802 lt!49509) (_1!1803 lt!49510) lt!49504) lt!50027)))

(declare-fun lt!50026 () (_ BitVec 64))

(declare-fun b!34083 () Bool)

(declare-fun lt!50025 () tuple2!3458)

(assert (=> b!34083 (= e!22624 (tuple2!3457 (Cons!422 (_1!1816 lt!50025) (bitStreamReadBitsIntoList!0 (_2!1802 lt!49509) (_2!1816 lt!50025) (bvsub lt!49504 lt!50026))) (_2!1816 lt!50025)))))

(assert (=> b!34083 (= lt!50025 (readBit!0 (_1!1803 lt!49510)))))

(assert (=> b!34083 (= lt!50026 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!34082 () Bool)

(assert (=> b!34082 (= e!22624 (tuple2!3457 Nil!423 (_1!1803 lt!49510)))))

(declare-fun b!34085 () Bool)

(assert (=> b!34085 (= e!22623 (> (length!152 lt!50027) 0))))

(assert (= (and d!9730 c!2254) b!34082))

(assert (= (and d!9730 (not c!2254)) b!34083))

(assert (= (and d!9730 c!2253) b!34084))

(assert (= (and d!9730 (not c!2253)) b!34085))

(declare-fun m!50599 () Bool)

(assert (=> b!34084 m!50599))

(declare-fun m!50601 () Bool)

(assert (=> b!34083 m!50601))

(declare-fun m!50603 () Bool)

(assert (=> b!34083 m!50603))

(declare-fun m!50605 () Bool)

(assert (=> b!34085 m!50605))

(assert (=> b!33775 d!9730))

(declare-fun d!9732 () Bool)

(assert (=> d!9732 (validate_offset_bits!1 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49509)))) ((_ sign_extend 32) (currentByte!2524 (_2!1802 lt!49518))) ((_ sign_extend 32) (currentBit!2519 (_2!1802 lt!49518))) lt!49504)))

(declare-fun lt!50028 () Unit!2513)

(assert (=> d!9732 (= lt!50028 (choose!9 (_2!1802 lt!49518) (buf!1157 (_2!1802 lt!49509)) lt!49504 (BitStream!1451 (buf!1157 (_2!1802 lt!49509)) (currentByte!2524 (_2!1802 lt!49518)) (currentBit!2519 (_2!1802 lt!49518)))))))

(assert (=> d!9732 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1802 lt!49518) (buf!1157 (_2!1802 lt!49509)) lt!49504) lt!50028)))

(declare-fun bs!2667 () Bool)

(assert (= bs!2667 d!9732))

(assert (=> bs!2667 m!50153))

(declare-fun m!50607 () Bool)

(assert (=> bs!2667 m!50607))

(assert (=> b!33775 d!9732))

(declare-fun b!34086 () Bool)

(declare-fun e!22626 () Unit!2513)

(declare-fun Unit!2540 () Unit!2513)

(assert (=> b!34086 (= e!22626 Unit!2540)))

(declare-fun d!9734 () Bool)

(declare-fun e!22625 () Bool)

(assert (=> d!9734 e!22625))

(declare-fun res!29202 () Bool)

(assert (=> d!9734 (=> (not res!29202) (not e!22625))))

(declare-fun lt!50041 () tuple2!3432)

(assert (=> d!9734 (= res!29202 (isPrefixOf!0 (_1!1803 lt!50041) (_2!1803 lt!50041)))))

(declare-fun lt!50045 () BitStream!1450)

(assert (=> d!9734 (= lt!50041 (tuple2!3433 lt!50045 (_2!1802 lt!49509)))))

(declare-fun lt!50046 () Unit!2513)

(declare-fun lt!50037 () Unit!2513)

(assert (=> d!9734 (= lt!50046 lt!50037)))

(assert (=> d!9734 (isPrefixOf!0 lt!50045 (_2!1802 lt!49509))))

(assert (=> d!9734 (= lt!50037 (lemmaIsPrefixTransitive!0 lt!50045 (_2!1802 lt!49509) (_2!1802 lt!49509)))))

(declare-fun lt!50033 () Unit!2513)

(declare-fun lt!50036 () Unit!2513)

(assert (=> d!9734 (= lt!50033 lt!50036)))

(assert (=> d!9734 (isPrefixOf!0 lt!50045 (_2!1802 lt!49509))))

(assert (=> d!9734 (= lt!50036 (lemmaIsPrefixTransitive!0 lt!50045 (_2!1802 lt!49518) (_2!1802 lt!49509)))))

(declare-fun lt!50042 () Unit!2513)

(assert (=> d!9734 (= lt!50042 e!22626)))

(declare-fun c!2255 () Bool)

(assert (=> d!9734 (= c!2255 (not (= (size!829 (buf!1157 (_2!1802 lt!49518))) #b00000000000000000000000000000000)))))

(declare-fun lt!50040 () Unit!2513)

(declare-fun lt!50030 () Unit!2513)

(assert (=> d!9734 (= lt!50040 lt!50030)))

(assert (=> d!9734 (isPrefixOf!0 (_2!1802 lt!49509) (_2!1802 lt!49509))))

(assert (=> d!9734 (= lt!50030 (lemmaIsPrefixRefl!0 (_2!1802 lt!49509)))))

(declare-fun lt!50031 () Unit!2513)

(declare-fun lt!50038 () Unit!2513)

(assert (=> d!9734 (= lt!50031 lt!50038)))

(assert (=> d!9734 (= lt!50038 (lemmaIsPrefixRefl!0 (_2!1802 lt!49509)))))

(declare-fun lt!50035 () Unit!2513)

(declare-fun lt!50048 () Unit!2513)

(assert (=> d!9734 (= lt!50035 lt!50048)))

(assert (=> d!9734 (isPrefixOf!0 lt!50045 lt!50045)))

(assert (=> d!9734 (= lt!50048 (lemmaIsPrefixRefl!0 lt!50045))))

(declare-fun lt!50043 () Unit!2513)

(declare-fun lt!50047 () Unit!2513)

(assert (=> d!9734 (= lt!50043 lt!50047)))

(assert (=> d!9734 (isPrefixOf!0 (_2!1802 lt!49518) (_2!1802 lt!49518))))

(assert (=> d!9734 (= lt!50047 (lemmaIsPrefixRefl!0 (_2!1802 lt!49518)))))

(assert (=> d!9734 (= lt!50045 (BitStream!1451 (buf!1157 (_2!1802 lt!49509)) (currentByte!2524 (_2!1802 lt!49518)) (currentBit!2519 (_2!1802 lt!49518))))))

(assert (=> d!9734 (isPrefixOf!0 (_2!1802 lt!49518) (_2!1802 lt!49509))))

(assert (=> d!9734 (= (reader!0 (_2!1802 lt!49518) (_2!1802 lt!49509)) lt!50041)))

(declare-fun b!34087 () Bool)

(declare-fun lt!50034 () Unit!2513)

(assert (=> b!34087 (= e!22626 lt!50034)))

(declare-fun lt!50032 () (_ BitVec 64))

(assert (=> b!34087 (= lt!50032 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!50044 () (_ BitVec 64))

(assert (=> b!34087 (= lt!50044 (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!49518))) (currentByte!2524 (_2!1802 lt!49518)) (currentBit!2519 (_2!1802 lt!49518))))))

(assert (=> b!34087 (= lt!50034 (arrayBitRangesEqSymmetric!0 (buf!1157 (_2!1802 lt!49518)) (buf!1157 (_2!1802 lt!49509)) lt!50032 lt!50044))))

(assert (=> b!34087 (arrayBitRangesEq!0 (buf!1157 (_2!1802 lt!49509)) (buf!1157 (_2!1802 lt!49518)) lt!50032 lt!50044)))

(declare-fun b!34088 () Bool)

(declare-fun res!29201 () Bool)

(assert (=> b!34088 (=> (not res!29201) (not e!22625))))

(assert (=> b!34088 (= res!29201 (isPrefixOf!0 (_1!1803 lt!50041) (_2!1802 lt!49518)))))

(declare-fun b!34089 () Bool)

(declare-fun res!29203 () Bool)

(assert (=> b!34089 (=> (not res!29203) (not e!22625))))

(assert (=> b!34089 (= res!29203 (isPrefixOf!0 (_2!1803 lt!50041) (_2!1802 lt!49509)))))

(declare-fun lt!50039 () (_ BitVec 64))

(declare-fun lt!50029 () (_ BitVec 64))

(declare-fun b!34090 () Bool)

(assert (=> b!34090 (= e!22625 (= (_1!1803 lt!50041) (withMovedBitIndex!0 (_2!1803 lt!50041) (bvsub lt!50029 lt!50039))))))

(assert (=> b!34090 (or (= (bvand lt!50029 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!50039 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!50029 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!50029 lt!50039) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34090 (= lt!50039 (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!49509))) (currentByte!2524 (_2!1802 lt!49509)) (currentBit!2519 (_2!1802 lt!49509))))))

(assert (=> b!34090 (= lt!50029 (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!49518))) (currentByte!2524 (_2!1802 lt!49518)) (currentBit!2519 (_2!1802 lt!49518))))))

(assert (= (and d!9734 c!2255) b!34087))

(assert (= (and d!9734 (not c!2255)) b!34086))

(assert (= (and d!9734 res!29202) b!34088))

(assert (= (and b!34088 res!29201) b!34089))

(assert (= (and b!34089 res!29203) b!34090))

(declare-fun m!50609 () Bool)

(assert (=> b!34088 m!50609))

(declare-fun m!50611 () Bool)

(assert (=> b!34089 m!50611))

(declare-fun m!50613 () Bool)

(assert (=> d!9734 m!50613))

(declare-fun m!50615 () Bool)

(assert (=> d!9734 m!50615))

(declare-fun m!50617 () Bool)

(assert (=> d!9734 m!50617))

(declare-fun m!50619 () Bool)

(assert (=> d!9734 m!50619))

(declare-fun m!50621 () Bool)

(assert (=> d!9734 m!50621))

(assert (=> d!9734 m!50181))

(assert (=> d!9734 m!50581))

(declare-fun m!50623 () Bool)

(assert (=> d!9734 m!50623))

(assert (=> d!9734 m!50585))

(declare-fun m!50625 () Bool)

(assert (=> d!9734 m!50625))

(declare-fun m!50627 () Bool)

(assert (=> d!9734 m!50627))

(assert (=> b!34087 m!50191))

(declare-fun m!50629 () Bool)

(assert (=> b!34087 m!50629))

(declare-fun m!50631 () Bool)

(assert (=> b!34087 m!50631))

(declare-fun m!50633 () Bool)

(assert (=> b!34090 m!50633))

(assert (=> b!34090 m!50133))

(assert (=> b!34090 m!50191))

(assert (=> b!33775 d!9734))

(declare-fun d!9736 () Bool)

(assert (=> d!9736 (validate_offset_bits!1 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49518)))) ((_ sign_extend 32) (currentByte!2524 thiss!1379)) ((_ sign_extend 32) (currentBit!2519 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!50049 () Unit!2513)

(assert (=> d!9736 (= lt!50049 (choose!9 thiss!1379 (buf!1157 (_2!1802 lt!49518)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1451 (buf!1157 (_2!1802 lt!49518)) (currentByte!2524 thiss!1379) (currentBit!2519 thiss!1379))))))

(assert (=> d!9736 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1157 (_2!1802 lt!49518)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!50049)))

(declare-fun bs!2668 () Bool)

(assert (= bs!2668 d!9736))

(assert (=> bs!2668 m!50179))

(declare-fun m!50635 () Bool)

(assert (=> bs!2668 m!50635))

(assert (=> b!33773 d!9736))

(declare-fun b!34091 () Bool)

(declare-fun e!22628 () Unit!2513)

(declare-fun Unit!2541 () Unit!2513)

(assert (=> b!34091 (= e!22628 Unit!2541)))

(declare-fun d!9738 () Bool)

(declare-fun e!22627 () Bool)

(assert (=> d!9738 e!22627))

(declare-fun res!29205 () Bool)

(assert (=> d!9738 (=> (not res!29205) (not e!22627))))

(declare-fun lt!50062 () tuple2!3432)

(assert (=> d!9738 (= res!29205 (isPrefixOf!0 (_1!1803 lt!50062) (_2!1803 lt!50062)))))

(declare-fun lt!50066 () BitStream!1450)

(assert (=> d!9738 (= lt!50062 (tuple2!3433 lt!50066 (_2!1802 lt!49518)))))

(declare-fun lt!50067 () Unit!2513)

(declare-fun lt!50058 () Unit!2513)

(assert (=> d!9738 (= lt!50067 lt!50058)))

(assert (=> d!9738 (isPrefixOf!0 lt!50066 (_2!1802 lt!49518))))

(assert (=> d!9738 (= lt!50058 (lemmaIsPrefixTransitive!0 lt!50066 (_2!1802 lt!49518) (_2!1802 lt!49518)))))

(declare-fun lt!50054 () Unit!2513)

(declare-fun lt!50057 () Unit!2513)

(assert (=> d!9738 (= lt!50054 lt!50057)))

(assert (=> d!9738 (isPrefixOf!0 lt!50066 (_2!1802 lt!49518))))

(assert (=> d!9738 (= lt!50057 (lemmaIsPrefixTransitive!0 lt!50066 thiss!1379 (_2!1802 lt!49518)))))

(declare-fun lt!50063 () Unit!2513)

(assert (=> d!9738 (= lt!50063 e!22628)))

(declare-fun c!2256 () Bool)

(assert (=> d!9738 (= c!2256 (not (= (size!829 (buf!1157 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!50061 () Unit!2513)

(declare-fun lt!50051 () Unit!2513)

(assert (=> d!9738 (= lt!50061 lt!50051)))

(assert (=> d!9738 (isPrefixOf!0 (_2!1802 lt!49518) (_2!1802 lt!49518))))

(assert (=> d!9738 (= lt!50051 (lemmaIsPrefixRefl!0 (_2!1802 lt!49518)))))

(declare-fun lt!50052 () Unit!2513)

(declare-fun lt!50059 () Unit!2513)

(assert (=> d!9738 (= lt!50052 lt!50059)))

(assert (=> d!9738 (= lt!50059 (lemmaIsPrefixRefl!0 (_2!1802 lt!49518)))))

(declare-fun lt!50056 () Unit!2513)

(declare-fun lt!50069 () Unit!2513)

(assert (=> d!9738 (= lt!50056 lt!50069)))

(assert (=> d!9738 (isPrefixOf!0 lt!50066 lt!50066)))

(assert (=> d!9738 (= lt!50069 (lemmaIsPrefixRefl!0 lt!50066))))

(declare-fun lt!50064 () Unit!2513)

(declare-fun lt!50068 () Unit!2513)

(assert (=> d!9738 (= lt!50064 lt!50068)))

(assert (=> d!9738 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!9738 (= lt!50068 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!9738 (= lt!50066 (BitStream!1451 (buf!1157 (_2!1802 lt!49518)) (currentByte!2524 thiss!1379) (currentBit!2519 thiss!1379)))))

(assert (=> d!9738 (isPrefixOf!0 thiss!1379 (_2!1802 lt!49518))))

(assert (=> d!9738 (= (reader!0 thiss!1379 (_2!1802 lt!49518)) lt!50062)))

(declare-fun b!34092 () Bool)

(declare-fun lt!50055 () Unit!2513)

(assert (=> b!34092 (= e!22628 lt!50055)))

(declare-fun lt!50053 () (_ BitVec 64))

(assert (=> b!34092 (= lt!50053 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!50065 () (_ BitVec 64))

(assert (=> b!34092 (= lt!50065 (bitIndex!0 (size!829 (buf!1157 thiss!1379)) (currentByte!2524 thiss!1379) (currentBit!2519 thiss!1379)))))

(assert (=> b!34092 (= lt!50055 (arrayBitRangesEqSymmetric!0 (buf!1157 thiss!1379) (buf!1157 (_2!1802 lt!49518)) lt!50053 lt!50065))))

(assert (=> b!34092 (arrayBitRangesEq!0 (buf!1157 (_2!1802 lt!49518)) (buf!1157 thiss!1379) lt!50053 lt!50065)))

(declare-fun b!34093 () Bool)

(declare-fun res!29204 () Bool)

(assert (=> b!34093 (=> (not res!29204) (not e!22627))))

(assert (=> b!34093 (= res!29204 (isPrefixOf!0 (_1!1803 lt!50062) thiss!1379))))

(declare-fun b!34094 () Bool)

(declare-fun res!29206 () Bool)

(assert (=> b!34094 (=> (not res!29206) (not e!22627))))

(assert (=> b!34094 (= res!29206 (isPrefixOf!0 (_2!1803 lt!50062) (_2!1802 lt!49518)))))

(declare-fun b!34095 () Bool)

(declare-fun lt!50050 () (_ BitVec 64))

(declare-fun lt!50060 () (_ BitVec 64))

(assert (=> b!34095 (= e!22627 (= (_1!1803 lt!50062) (withMovedBitIndex!0 (_2!1803 lt!50062) (bvsub lt!50050 lt!50060))))))

(assert (=> b!34095 (or (= (bvand lt!50050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!50060 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!50050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!50050 lt!50060) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34095 (= lt!50060 (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!49518))) (currentByte!2524 (_2!1802 lt!49518)) (currentBit!2519 (_2!1802 lt!49518))))))

(assert (=> b!34095 (= lt!50050 (bitIndex!0 (size!829 (buf!1157 thiss!1379)) (currentByte!2524 thiss!1379) (currentBit!2519 thiss!1379)))))

(assert (= (and d!9738 c!2256) b!34092))

(assert (= (and d!9738 (not c!2256)) b!34091))

(assert (= (and d!9738 res!29205) b!34093))

(assert (= (and b!34093 res!29204) b!34094))

(assert (= (and b!34094 res!29206) b!34095))

(declare-fun m!50637 () Bool)

(assert (=> b!34093 m!50637))

(declare-fun m!50639 () Bool)

(assert (=> b!34094 m!50639))

(declare-fun m!50641 () Bool)

(assert (=> d!9738 m!50641))

(declare-fun m!50643 () Bool)

(assert (=> d!9738 m!50643))

(declare-fun m!50645 () Bool)

(assert (=> d!9738 m!50645))

(assert (=> d!9738 m!50137))

(assert (=> d!9738 m!50135))

(assert (=> d!9738 m!50165))

(assert (=> d!9738 m!50621))

(declare-fun m!50647 () Bool)

(assert (=> d!9738 m!50647))

(assert (=> d!9738 m!50619))

(declare-fun m!50649 () Bool)

(assert (=> d!9738 m!50649))

(declare-fun m!50651 () Bool)

(assert (=> d!9738 m!50651))

(assert (=> b!34092 m!50139))

(declare-fun m!50653 () Bool)

(assert (=> b!34092 m!50653))

(declare-fun m!50655 () Bool)

(assert (=> b!34092 m!50655))

(declare-fun m!50657 () Bool)

(assert (=> b!34095 m!50657))

(assert (=> b!34095 m!50191))

(assert (=> b!34095 m!50139))

(assert (=> b!33773 d!9738))

(declare-fun d!9740 () Bool)

(declare-fun res!29207 () Bool)

(declare-fun e!22629 () Bool)

(assert (=> d!9740 (=> (not res!29207) (not e!22629))))

(assert (=> d!9740 (= res!29207 (= (size!829 (buf!1157 thiss!1379)) (size!829 (buf!1157 (_2!1802 lt!49509)))))))

(assert (=> d!9740 (= (isPrefixOf!0 thiss!1379 (_2!1802 lt!49509)) e!22629)))

(declare-fun b!34096 () Bool)

(declare-fun res!29208 () Bool)

(assert (=> b!34096 (=> (not res!29208) (not e!22629))))

(assert (=> b!34096 (= res!29208 (bvsle (bitIndex!0 (size!829 (buf!1157 thiss!1379)) (currentByte!2524 thiss!1379) (currentBit!2519 thiss!1379)) (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!49509))) (currentByte!2524 (_2!1802 lt!49509)) (currentBit!2519 (_2!1802 lt!49509)))))))

(declare-fun b!34097 () Bool)

(declare-fun e!22630 () Bool)

(assert (=> b!34097 (= e!22629 e!22630)))

(declare-fun res!29209 () Bool)

(assert (=> b!34097 (=> res!29209 e!22630)))

(assert (=> b!34097 (= res!29209 (= (size!829 (buf!1157 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!34098 () Bool)

(assert (=> b!34098 (= e!22630 (arrayBitRangesEq!0 (buf!1157 thiss!1379) (buf!1157 (_2!1802 lt!49509)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!829 (buf!1157 thiss!1379)) (currentByte!2524 thiss!1379) (currentBit!2519 thiss!1379))))))

(assert (= (and d!9740 res!29207) b!34096))

(assert (= (and b!34096 res!29208) b!34097))

(assert (= (and b!34097 (not res!29209)) b!34098))

(assert (=> b!34096 m!50139))

(assert (=> b!34096 m!50133))

(assert (=> b!34098 m!50139))

(assert (=> b!34098 m!50139))

(declare-fun m!50659 () Bool)

(assert (=> b!34098 m!50659))

(assert (=> b!33773 d!9740))

(declare-fun b!34297 () Bool)

(declare-fun e!22729 () tuple2!3430)

(declare-fun Unit!2542 () Unit!2513)

(assert (=> b!34297 (= e!22729 (tuple2!3431 Unit!2542 (_2!1802 lt!49518)))))

(assert (=> b!34297 (= (size!829 (buf!1157 (_2!1802 lt!49518))) (size!829 (buf!1157 (_2!1802 lt!49518))))))

(declare-fun lt!50615 () Unit!2513)

(declare-fun Unit!2543 () Unit!2513)

(assert (=> b!34297 (= lt!50615 Unit!2543)))

(declare-fun call!427 () tuple2!3432)

(declare-fun checkByteArrayBitContent!0 (BitStream!1450 array!1874 array!1874 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!34297 (checkByteArrayBitContent!0 (_2!1802 lt!49518) srcBuffer!2 (_1!1818 (readBits!0 (_1!1803 call!427) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!34298 () Bool)

(declare-fun lt!50624 () tuple2!3432)

(declare-fun lt!50627 () tuple2!3430)

(declare-fun e!22727 () Bool)

(assert (=> b!34298 (= e!22727 (= (bitStreamReadBitsIntoList!0 (_2!1802 lt!50627) (_1!1803 lt!50624) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1802 lt!50627) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!34298 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34298 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!50636 () Unit!2513)

(declare-fun lt!50626 () Unit!2513)

(assert (=> b!34298 (= lt!50636 lt!50626)))

(declare-fun lt!50634 () (_ BitVec 64))

(assert (=> b!34298 (validate_offset_bits!1 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!50627)))) ((_ sign_extend 32) (currentByte!2524 (_2!1802 lt!49518))) ((_ sign_extend 32) (currentBit!2519 (_2!1802 lt!49518))) lt!50634)))

(assert (=> b!34298 (= lt!50626 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1802 lt!49518) (buf!1157 (_2!1802 lt!50627)) lt!50634))))

(declare-fun e!22728 () Bool)

(assert (=> b!34298 e!22728))

(declare-fun res!29346 () Bool)

(assert (=> b!34298 (=> (not res!29346) (not e!22728))))

(assert (=> b!34298 (= res!29346 (and (= (size!829 (buf!1157 (_2!1802 lt!49518))) (size!829 (buf!1157 (_2!1802 lt!50627)))) (bvsge lt!50634 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34298 (= lt!50634 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!34298 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34298 (= lt!50624 (reader!0 (_2!1802 lt!49518) (_2!1802 lt!50627)))))

(declare-fun b!34299 () Bool)

(declare-fun res!29342 () Bool)

(assert (=> b!34299 (=> (not res!29342) (not e!22727))))

(assert (=> b!34299 (= res!29342 (= (size!829 (buf!1157 (_2!1802 lt!49518))) (size!829 (buf!1157 (_2!1802 lt!50627)))))))

(declare-fun b!34300 () Bool)

(declare-fun res!29343 () Bool)

(assert (=> b!34300 (=> (not res!29343) (not e!22727))))

(assert (=> b!34300 (= res!29343 (= (size!829 (buf!1157 (_2!1802 lt!50627))) (size!829 (buf!1157 (_2!1802 lt!49518)))))))

(declare-fun d!9742 () Bool)

(assert (=> d!9742 e!22727))

(declare-fun res!29344 () Bool)

(assert (=> d!9742 (=> (not res!29344) (not e!22727))))

(declare-fun lt!50614 () (_ BitVec 64))

(assert (=> d!9742 (= res!29344 (= (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!50627))) (currentByte!2524 (_2!1802 lt!50627)) (currentBit!2519 (_2!1802 lt!50627))) (bvsub lt!50614 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!9742 (or (= (bvand lt!50614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!50614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!50614 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!50655 () (_ BitVec 64))

(assert (=> d!9742 (= lt!50614 (bvadd lt!50655 to!314))))

(assert (=> d!9742 (or (not (= (bvand lt!50655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!50655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!50655 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9742 (= lt!50655 (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!49518))) (currentByte!2524 (_2!1802 lt!49518)) (currentBit!2519 (_2!1802 lt!49518))))))

(assert (=> d!9742 (= lt!50627 e!22729)))

(declare-fun c!2289 () Bool)

(assert (=> d!9742 (= c!2289 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!50651 () Unit!2513)

(declare-fun lt!50625 () Unit!2513)

(assert (=> d!9742 (= lt!50651 lt!50625)))

(assert (=> d!9742 (isPrefixOf!0 (_2!1802 lt!49518) (_2!1802 lt!49518))))

(assert (=> d!9742 (= lt!50625 (lemmaIsPrefixRefl!0 (_2!1802 lt!49518)))))

(declare-fun lt!50649 () (_ BitVec 64))

(assert (=> d!9742 (= lt!50649 (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!49518))) (currentByte!2524 (_2!1802 lt!49518)) (currentBit!2519 (_2!1802 lt!49518))))))

(assert (=> d!9742 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9742 (= (appendBitsMSBFirstLoop!0 (_2!1802 lt!49518) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!50627)))

(declare-fun b!34301 () Bool)

(assert (=> b!34301 (= e!22728 (validate_offset_bits!1 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49518)))) ((_ sign_extend 32) (currentByte!2524 (_2!1802 lt!49518))) ((_ sign_extend 32) (currentBit!2519 (_2!1802 lt!49518))) lt!50634))))

(declare-fun b!34302 () Bool)

(declare-fun lt!50652 () tuple2!3430)

(declare-fun Unit!2544 () Unit!2513)

(assert (=> b!34302 (= e!22729 (tuple2!3431 Unit!2544 (_2!1802 lt!50652)))))

(declare-fun lt!50618 () tuple2!3430)

(assert (=> b!34302 (= lt!50618 (appendBitFromByte!0 (_2!1802 lt!49518) (select (arr!1304 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!50619 () (_ BitVec 64))

(assert (=> b!34302 (= lt!50619 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!50637 () (_ BitVec 64))

(assert (=> b!34302 (= lt!50637 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!50646 () Unit!2513)

(assert (=> b!34302 (= lt!50646 (validateOffsetBitsIneqLemma!0 (_2!1802 lt!49518) (_2!1802 lt!50618) lt!50619 lt!50637))))

(assert (=> b!34302 (validate_offset_bits!1 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!50618)))) ((_ sign_extend 32) (currentByte!2524 (_2!1802 lt!50618))) ((_ sign_extend 32) (currentBit!2519 (_2!1802 lt!50618))) (bvsub lt!50619 lt!50637))))

(declare-fun lt!50635 () Unit!2513)

(assert (=> b!34302 (= lt!50635 lt!50646)))

(declare-fun lt!50656 () tuple2!3432)

(assert (=> b!34302 (= lt!50656 (reader!0 (_2!1802 lt!49518) (_2!1802 lt!50618)))))

(declare-fun lt!50639 () (_ BitVec 64))

(assert (=> b!34302 (= lt!50639 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!50638 () Unit!2513)

(assert (=> b!34302 (= lt!50638 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1802 lt!49518) (buf!1157 (_2!1802 lt!50618)) lt!50639))))

(assert (=> b!34302 (validate_offset_bits!1 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!50618)))) ((_ sign_extend 32) (currentByte!2524 (_2!1802 lt!49518))) ((_ sign_extend 32) (currentBit!2519 (_2!1802 lt!49518))) lt!50639)))

(declare-fun lt!50621 () Unit!2513)

(assert (=> b!34302 (= lt!50621 lt!50638)))

(assert (=> b!34302 (= (head!263 (byteArrayBitContentToList!0 (_2!1802 lt!50618) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!263 (bitStreamReadBitsIntoList!0 (_2!1802 lt!50618) (_1!1803 lt!50656) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!50647 () Unit!2513)

(declare-fun Unit!2545 () Unit!2513)

(assert (=> b!34302 (= lt!50647 Unit!2545)))

(assert (=> b!34302 (= lt!50652 (appendBitsMSBFirstLoop!0 (_2!1802 lt!50618) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!50653 () Unit!2513)

(assert (=> b!34302 (= lt!50653 (lemmaIsPrefixTransitive!0 (_2!1802 lt!49518) (_2!1802 lt!50618) (_2!1802 lt!50652)))))

(assert (=> b!34302 (isPrefixOf!0 (_2!1802 lt!49518) (_2!1802 lt!50652))))

(declare-fun lt!50641 () Unit!2513)

(assert (=> b!34302 (= lt!50641 lt!50653)))

(assert (=> b!34302 (= (size!829 (buf!1157 (_2!1802 lt!50652))) (size!829 (buf!1157 (_2!1802 lt!49518))))))

(declare-fun lt!50648 () Unit!2513)

(declare-fun Unit!2546 () Unit!2513)

(assert (=> b!34302 (= lt!50648 Unit!2546)))

(assert (=> b!34302 (= (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!50652))) (currentByte!2524 (_2!1802 lt!50652)) (currentBit!2519 (_2!1802 lt!50652))) (bvsub (bvadd (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!49518))) (currentByte!2524 (_2!1802 lt!49518)) (currentBit!2519 (_2!1802 lt!49518))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!50629 () Unit!2513)

(declare-fun Unit!2547 () Unit!2513)

(assert (=> b!34302 (= lt!50629 Unit!2547)))

(assert (=> b!34302 (= (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!50652))) (currentByte!2524 (_2!1802 lt!50652)) (currentBit!2519 (_2!1802 lt!50652))) (bvsub (bvsub (bvadd (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!50618))) (currentByte!2524 (_2!1802 lt!50618)) (currentBit!2519 (_2!1802 lt!50618))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!50643 () Unit!2513)

(declare-fun Unit!2548 () Unit!2513)

(assert (=> b!34302 (= lt!50643 Unit!2548)))

(declare-fun lt!50644 () tuple2!3432)

(assert (=> b!34302 (= lt!50644 call!427)))

(declare-fun lt!50654 () (_ BitVec 64))

(assert (=> b!34302 (= lt!50654 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!50628 () Unit!2513)

(assert (=> b!34302 (= lt!50628 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1802 lt!49518) (buf!1157 (_2!1802 lt!50652)) lt!50654))))

(assert (=> b!34302 (validate_offset_bits!1 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!50652)))) ((_ sign_extend 32) (currentByte!2524 (_2!1802 lt!49518))) ((_ sign_extend 32) (currentBit!2519 (_2!1802 lt!49518))) lt!50654)))

(declare-fun lt!50650 () Unit!2513)

(assert (=> b!34302 (= lt!50650 lt!50628)))

(declare-fun lt!50640 () tuple2!3432)

(assert (=> b!34302 (= lt!50640 (reader!0 (_2!1802 lt!50618) (_2!1802 lt!50652)))))

(declare-fun lt!50613 () (_ BitVec 64))

(assert (=> b!34302 (= lt!50613 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!50630 () Unit!2513)

(assert (=> b!34302 (= lt!50630 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1802 lt!50618) (buf!1157 (_2!1802 lt!50652)) lt!50613))))

(assert (=> b!34302 (validate_offset_bits!1 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!50652)))) ((_ sign_extend 32) (currentByte!2524 (_2!1802 lt!50618))) ((_ sign_extend 32) (currentBit!2519 (_2!1802 lt!50618))) lt!50613)))

(declare-fun lt!50642 () Unit!2513)

(assert (=> b!34302 (= lt!50642 lt!50630)))

(declare-fun lt!50645 () List!426)

(assert (=> b!34302 (= lt!50645 (byteArrayBitContentToList!0 (_2!1802 lt!50652) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!50622 () List!426)

(assert (=> b!34302 (= lt!50622 (byteArrayBitContentToList!0 (_2!1802 lt!50652) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!50620 () List!426)

(assert (=> b!34302 (= lt!50620 (bitStreamReadBitsIntoList!0 (_2!1802 lt!50652) (_1!1803 lt!50644) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!50617 () List!426)

(assert (=> b!34302 (= lt!50617 (bitStreamReadBitsIntoList!0 (_2!1802 lt!50652) (_1!1803 lt!50640) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!50631 () (_ BitVec 64))

(assert (=> b!34302 (= lt!50631 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!50616 () Unit!2513)

(assert (=> b!34302 (= lt!50616 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1802 lt!50652) (_2!1802 lt!50652) (_1!1803 lt!50644) (_1!1803 lt!50640) lt!50631 lt!50620))))

(assert (=> b!34302 (= (bitStreamReadBitsIntoList!0 (_2!1802 lt!50652) (_1!1803 lt!50640) (bvsub lt!50631 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!143 lt!50620))))

(declare-fun lt!50633 () Unit!2513)

(assert (=> b!34302 (= lt!50633 lt!50616)))

(declare-fun lt!50623 () Unit!2513)

(assert (=> b!34302 (= lt!50623 (arrayBitRangesEqImpliesEq!0 (buf!1157 (_2!1802 lt!50618)) (buf!1157 (_2!1802 lt!50652)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!50649 (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!50618))) (currentByte!2524 (_2!1802 lt!50618)) (currentBit!2519 (_2!1802 lt!50618)))))))

(assert (=> b!34302 (= (bitAt!0 (buf!1157 (_2!1802 lt!50618)) lt!50649) (bitAt!0 (buf!1157 (_2!1802 lt!50652)) lt!50649))))

(declare-fun lt!50632 () Unit!2513)

(assert (=> b!34302 (= lt!50632 lt!50623)))

(declare-fun b!34303 () Bool)

(declare-fun res!29347 () Bool)

(assert (=> b!34303 (=> (not res!29347) (not e!22727))))

(assert (=> b!34303 (= res!29347 (isPrefixOf!0 (_2!1802 lt!49518) (_2!1802 lt!50627)))))

(declare-fun b!34304 () Bool)

(declare-fun res!29345 () Bool)

(assert (=> b!34304 (=> (not res!29345) (not e!22727))))

(assert (=> b!34304 (= res!29345 (invariant!0 (currentBit!2519 (_2!1802 lt!50627)) (currentByte!2524 (_2!1802 lt!50627)) (size!829 (buf!1157 (_2!1802 lt!50627)))))))

(declare-fun bm!424 () Bool)

(assert (=> bm!424 (= call!427 (reader!0 (_2!1802 lt!49518) (ite c!2289 (_2!1802 lt!50652) (_2!1802 lt!49518))))))

(assert (= (and d!9742 c!2289) b!34302))

(assert (= (and d!9742 (not c!2289)) b!34297))

(assert (= (or b!34302 b!34297) bm!424))

(assert (= (and d!9742 res!29344) b!34304))

(assert (= (and b!34304 res!29345) b!34299))

(assert (= (and b!34299 res!29342) b!34303))

(assert (= (and b!34303 res!29347) b!34300))

(assert (= (and b!34300 res!29343) b!34298))

(assert (= (and b!34298 res!29346) b!34301))

(declare-fun m!51111 () Bool)

(assert (=> d!9742 m!51111))

(assert (=> d!9742 m!50191))

(assert (=> d!9742 m!50621))

(assert (=> d!9742 m!50619))

(declare-fun m!51113 () Bool)

(assert (=> b!34297 m!51113))

(declare-fun m!51115 () Bool)

(assert (=> b!34297 m!51115))

(declare-fun m!51117 () Bool)

(assert (=> bm!424 m!51117))

(declare-fun m!51119 () Bool)

(assert (=> b!34304 m!51119))

(declare-fun m!51121 () Bool)

(assert (=> b!34298 m!51121))

(declare-fun m!51123 () Bool)

(assert (=> b!34298 m!51123))

(declare-fun m!51125 () Bool)

(assert (=> b!34298 m!51125))

(declare-fun m!51127 () Bool)

(assert (=> b!34298 m!51127))

(declare-fun m!51129 () Bool)

(assert (=> b!34298 m!51129))

(declare-fun m!51131 () Bool)

(assert (=> b!34302 m!51131))

(declare-fun m!51133 () Bool)

(assert (=> b!34302 m!51133))

(declare-fun m!51135 () Bool)

(assert (=> b!34302 m!51135))

(declare-fun m!51137 () Bool)

(assert (=> b!34302 m!51137))

(declare-fun m!51139 () Bool)

(assert (=> b!34302 m!51139))

(declare-fun m!51141 () Bool)

(assert (=> b!34302 m!51141))

(assert (=> b!34302 m!51133))

(declare-fun m!51143 () Bool)

(assert (=> b!34302 m!51143))

(declare-fun m!51145 () Bool)

(assert (=> b!34302 m!51145))

(declare-fun m!51147 () Bool)

(assert (=> b!34302 m!51147))

(declare-fun m!51149 () Bool)

(assert (=> b!34302 m!51149))

(declare-fun m!51151 () Bool)

(assert (=> b!34302 m!51151))

(declare-fun m!51153 () Bool)

(assert (=> b!34302 m!51153))

(declare-fun m!51155 () Bool)

(assert (=> b!34302 m!51155))

(declare-fun m!51157 () Bool)

(assert (=> b!34302 m!51157))

(declare-fun m!51159 () Bool)

(assert (=> b!34302 m!51159))

(declare-fun m!51161 () Bool)

(assert (=> b!34302 m!51161))

(declare-fun m!51163 () Bool)

(assert (=> b!34302 m!51163))

(declare-fun m!51165 () Bool)

(assert (=> b!34302 m!51165))

(declare-fun m!51167 () Bool)

(assert (=> b!34302 m!51167))

(assert (=> b!34302 m!50191))

(declare-fun m!51169 () Bool)

(assert (=> b!34302 m!51169))

(declare-fun m!51171 () Bool)

(assert (=> b!34302 m!51171))

(declare-fun m!51173 () Bool)

(assert (=> b!34302 m!51173))

(assert (=> b!34302 m!51163))

(declare-fun m!51175 () Bool)

(assert (=> b!34302 m!51175))

(declare-fun m!51177 () Bool)

(assert (=> b!34302 m!51177))

(declare-fun m!51179 () Bool)

(assert (=> b!34302 m!51179))

(assert (=> b!34302 m!51139))

(declare-fun m!51181 () Bool)

(assert (=> b!34302 m!51181))

(declare-fun m!51183 () Bool)

(assert (=> b!34302 m!51183))

(declare-fun m!51185 () Bool)

(assert (=> b!34302 m!51185))

(assert (=> b!34302 m!51153))

(declare-fun m!51187 () Bool)

(assert (=> b!34302 m!51187))

(declare-fun m!51189 () Bool)

(assert (=> b!34302 m!51189))

(declare-fun m!51191 () Bool)

(assert (=> b!34302 m!51191))

(declare-fun m!51193 () Bool)

(assert (=> b!34301 m!51193))

(declare-fun m!51195 () Bool)

(assert (=> b!34303 m!51195))

(assert (=> b!33773 d!9742))

(declare-fun d!9856 () Bool)

(assert (=> d!9856 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49518)))) ((_ sign_extend 32) (currentByte!2524 thiss!1379)) ((_ sign_extend 32) (currentBit!2519 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49518)))) ((_ sign_extend 32) (currentByte!2524 thiss!1379)) ((_ sign_extend 32) (currentBit!2519 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2691 () Bool)

(assert (= bs!2691 d!9856))

(declare-fun m!51197 () Bool)

(assert (=> bs!2691 m!51197))

(assert (=> b!33773 d!9856))

(declare-fun d!9858 () Bool)

(assert (=> d!9858 (isPrefixOf!0 thiss!1379 (_2!1802 lt!49509))))

(declare-fun lt!50659 () Unit!2513)

(declare-fun choose!30 (BitStream!1450 BitStream!1450 BitStream!1450) Unit!2513)

(assert (=> d!9858 (= lt!50659 (choose!30 thiss!1379 (_2!1802 lt!49518) (_2!1802 lt!49509)))))

(assert (=> d!9858 (isPrefixOf!0 thiss!1379 (_2!1802 lt!49518))))

(assert (=> d!9858 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1802 lt!49518) (_2!1802 lt!49509)) lt!50659)))

(declare-fun bs!2692 () Bool)

(assert (= bs!2692 d!9858))

(assert (=> bs!2692 m!50183))

(declare-fun m!51199 () Bool)

(assert (=> bs!2692 m!51199))

(assert (=> bs!2692 m!50165))

(assert (=> b!33773 d!9858))

(declare-fun d!9860 () Bool)

(declare-fun res!29348 () Bool)

(declare-fun e!22730 () Bool)

(assert (=> d!9860 (=> (not res!29348) (not e!22730))))

(assert (=> d!9860 (= res!29348 (= (size!829 (buf!1157 (_2!1802 lt!49518))) (size!829 (buf!1157 (_2!1802 lt!49509)))))))

(assert (=> d!9860 (= (isPrefixOf!0 (_2!1802 lt!49518) (_2!1802 lt!49509)) e!22730)))

(declare-fun b!34305 () Bool)

(declare-fun res!29349 () Bool)

(assert (=> b!34305 (=> (not res!29349) (not e!22730))))

(assert (=> b!34305 (= res!29349 (bvsle (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!49518))) (currentByte!2524 (_2!1802 lt!49518)) (currentBit!2519 (_2!1802 lt!49518))) (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!49509))) (currentByte!2524 (_2!1802 lt!49509)) (currentBit!2519 (_2!1802 lt!49509)))))))

(declare-fun b!34306 () Bool)

(declare-fun e!22731 () Bool)

(assert (=> b!34306 (= e!22730 e!22731)))

(declare-fun res!29350 () Bool)

(assert (=> b!34306 (=> res!29350 e!22731)))

(assert (=> b!34306 (= res!29350 (= (size!829 (buf!1157 (_2!1802 lt!49518))) #b00000000000000000000000000000000))))

(declare-fun b!34307 () Bool)

(assert (=> b!34307 (= e!22731 (arrayBitRangesEq!0 (buf!1157 (_2!1802 lt!49518)) (buf!1157 (_2!1802 lt!49509)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!49518))) (currentByte!2524 (_2!1802 lt!49518)) (currentBit!2519 (_2!1802 lt!49518)))))))

(assert (= (and d!9860 res!29348) b!34305))

(assert (= (and b!34305 res!29349) b!34306))

(assert (= (and b!34306 (not res!29350)) b!34307))

(assert (=> b!34305 m!50191))

(assert (=> b!34305 m!50133))

(assert (=> b!34307 m!50191))

(assert (=> b!34307 m!50191))

(declare-fun m!51201 () Bool)

(assert (=> b!34307 m!51201))

(assert (=> b!33773 d!9860))

(declare-fun d!9862 () Bool)

(assert (=> d!9862 (= (array_inv!778 srcBuffer!2) (bvsge (size!829 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6938 d!9862))

(declare-fun d!9864 () Bool)

(assert (=> d!9864 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2519 thiss!1379) (currentByte!2524 thiss!1379) (size!829 (buf!1157 thiss!1379))))))

(declare-fun bs!2693 () Bool)

(assert (= bs!2693 d!9864))

(assert (=> bs!2693 m!50493))

(assert (=> start!6938 d!9864))

(declare-fun d!9866 () Bool)

(assert (=> d!9866 (= (array_inv!778 (buf!1157 thiss!1379)) (bvsge (size!829 (buf!1157 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!33774 d!9866))

(declare-fun d!9868 () Bool)

(assert (=> d!9868 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!829 (buf!1157 thiss!1379))) ((_ sign_extend 32) (currentByte!2524 thiss!1379)) ((_ sign_extend 32) (currentBit!2519 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!829 (buf!1157 thiss!1379))) ((_ sign_extend 32) (currentByte!2524 thiss!1379)) ((_ sign_extend 32) (currentBit!2519 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2694 () Bool)

(assert (= bs!2694 d!9868))

(assert (=> bs!2694 m!50491))

(assert (=> b!33772 d!9868))

(declare-fun d!9870 () Bool)

(declare-fun e!22732 () Bool)

(assert (=> d!9870 e!22732))

(declare-fun res!29351 () Bool)

(assert (=> d!9870 (=> (not res!29351) (not e!22732))))

(declare-fun lt!50660 () (_ BitVec 64))

(declare-fun lt!50661 () (_ BitVec 64))

(declare-fun lt!50663 () (_ BitVec 64))

(assert (=> d!9870 (= res!29351 (= lt!50660 (bvsub lt!50663 lt!50661)))))

(assert (=> d!9870 (or (= (bvand lt!50663 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!50661 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!50663 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!50663 lt!50661) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9870 (= lt!50661 (remainingBits!0 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49509)))) ((_ sign_extend 32) (currentByte!2524 (_2!1802 lt!49509))) ((_ sign_extend 32) (currentBit!2519 (_2!1802 lt!49509)))))))

(declare-fun lt!50662 () (_ BitVec 64))

(declare-fun lt!50664 () (_ BitVec 64))

(assert (=> d!9870 (= lt!50663 (bvmul lt!50662 lt!50664))))

(assert (=> d!9870 (or (= lt!50662 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!50664 (bvsdiv (bvmul lt!50662 lt!50664) lt!50662)))))

(assert (=> d!9870 (= lt!50664 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9870 (= lt!50662 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49509)))))))

(assert (=> d!9870 (= lt!50660 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2524 (_2!1802 lt!49509))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2519 (_2!1802 lt!49509)))))))

(assert (=> d!9870 (invariant!0 (currentBit!2519 (_2!1802 lt!49509)) (currentByte!2524 (_2!1802 lt!49509)) (size!829 (buf!1157 (_2!1802 lt!49509))))))

(assert (=> d!9870 (= (bitIndex!0 (size!829 (buf!1157 (_2!1802 lt!49509))) (currentByte!2524 (_2!1802 lt!49509)) (currentBit!2519 (_2!1802 lt!49509))) lt!50660)))

(declare-fun b!34308 () Bool)

(declare-fun res!29352 () Bool)

(assert (=> b!34308 (=> (not res!29352) (not e!22732))))

(assert (=> b!34308 (= res!29352 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!50660))))

(declare-fun b!34309 () Bool)

(declare-fun lt!50665 () (_ BitVec 64))

(assert (=> b!34309 (= e!22732 (bvsle lt!50660 (bvmul lt!50665 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!34309 (or (= lt!50665 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!50665 #b0000000000000000000000000000000000000000000000000000000000001000) lt!50665)))))

(assert (=> b!34309 (= lt!50665 ((_ sign_extend 32) (size!829 (buf!1157 (_2!1802 lt!49509)))))))

(assert (= (and d!9870 res!29351) b!34308))

(assert (= (and b!34308 res!29352) b!34309))

(declare-fun m!51203 () Bool)

(assert (=> d!9870 m!51203))

(assert (=> d!9870 m!50141))

(assert (=> b!33762 d!9870))

(declare-fun d!9872 () Bool)

(declare-fun size!834 (List!426) Int)

(assert (=> d!9872 (= (length!152 lt!49513) (size!834 lt!49513))))

(declare-fun bs!2695 () Bool)

(assert (= bs!2695 d!9872))

(declare-fun m!51205 () Bool)

(assert (=> bs!2695 m!51205))

(assert (=> b!33781 d!9872))

(declare-fun d!9874 () Bool)

(assert (=> d!9874 (= (invariant!0 (currentBit!2519 (_2!1802 lt!49518)) (currentByte!2524 (_2!1802 lt!49518)) (size!829 (buf!1157 (_2!1802 lt!49509)))) (and (bvsge (currentBit!2519 (_2!1802 lt!49518)) #b00000000000000000000000000000000) (bvslt (currentBit!2519 (_2!1802 lt!49518)) #b00000000000000000000000000001000) (bvsge (currentByte!2524 (_2!1802 lt!49518)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2524 (_2!1802 lt!49518)) (size!829 (buf!1157 (_2!1802 lt!49509)))) (and (= (currentBit!2519 (_2!1802 lt!49518)) #b00000000000000000000000000000000) (= (currentByte!2524 (_2!1802 lt!49518)) (size!829 (buf!1157 (_2!1802 lt!49509))))))))))

(assert (=> b!33771 d!9874))

(push 1)

(assert (not b!34304))

(assert (not b!34301))

(assert (not b!34089))

(assert (not b!33924))

(assert (not d!9742))

(assert (not b!34048))

(assert (not b!34045))

(assert (not b!33967))

(assert (not b!34067))

(assert (not b!34298))

(assert (not d!9858))

(assert (not d!9734))

(assert (not b!34087))

(assert (not d!9726))

(assert (not b!34092))

(assert (not b!33968))

(assert (not b!34039))

(assert (not d!9636))

(assert (not b!34090))

(assert (not b!34307))

(assert (not d!9872))

(assert (not d!9710))

(assert (not b!34050))

(assert (not bm!424))

(assert (not b!34066))

(assert (not d!9870))

(assert (not d!9702))

(assert (not b!33969))

(assert (not b!34088))

(assert (not b!34302))

(assert (not b!34083))

(assert (not b!34069))

(assert (not d!9736))

(assert (not d!9720))

(assert (not b!34085))

(assert (not b!34006))

(assert (not b!34068))

(assert (not b!34044))

(assert (not b!34041))

(assert (not d!9696))

(assert (not b!34093))

(assert (not b!34305))

(assert (not d!9728))

(assert (not b!34040))

(assert (not b!34303))

(assert (not b!33987))

(assert (not d!9724))

(assert (not d!9856))

(assert (not b!33936))

(assert (not b!34098))

(assert (not b!33989))

(assert (not b!33971))

(assert (not d!9732))

(assert (not b!34096))

(assert (not d!9704))

(assert (not b!34094))

(assert (not b!34003))

(assert (not b!34095))

(assert (not b!34042))

(assert (not b!34001))

(assert (not b!34043))

(assert (not d!9708))

(assert (not d!9864))

(assert (not d!9712))

(assert (not b!34049))

(assert (not b!34046))

(assert (not b!34297))

(assert (not b!34084))

(assert (not d!9738))

(assert (not d!9868))

(assert (not d!9686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

