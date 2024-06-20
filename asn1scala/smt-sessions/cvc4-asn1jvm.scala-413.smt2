; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10510 () Bool)

(assert start!10510)

(declare-fun res!44028 () Bool)

(declare-fun e!35124 () Bool)

(assert (=> start!10510 (=> (not res!44028) (not e!35124))))

(declare-datatypes ((array!2492 0))(
  ( (array!2493 (arr!1675 (Array (_ BitVec 32) (_ BitVec 8))) (size!1139 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2492)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10510 (= res!44028 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1139 srcBuffer!2))))))))

(assert (=> start!10510 e!35124))

(assert (=> start!10510 true))

(declare-fun array_inv!1044 (array!2492) Bool)

(assert (=> start!10510 (array_inv!1044 srcBuffer!2)))

(declare-datatypes ((BitStream!1970 0))(
  ( (BitStream!1971 (buf!1489 array!2492) (currentByte!3038 (_ BitVec 32)) (currentBit!3033 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1970)

(declare-fun e!35121 () Bool)

(declare-fun inv!12 (BitStream!1970) Bool)

(assert (=> start!10510 (and (inv!12 thiss!1379) e!35121)))

(declare-fun b!52731 () Bool)

(declare-fun e!35126 () Bool)

(declare-datatypes ((Unit!3682 0))(
  ( (Unit!3683) )
))
(declare-datatypes ((tuple2!4796 0))(
  ( (tuple2!4797 (_1!2503 Unit!3682) (_2!2503 BitStream!1970)) )
))
(declare-fun lt!81714 () tuple2!4796)

(declare-fun lt!81713 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52731 (= e!35126 (bvsle (bitIndex!0 (size!1139 (buf!1489 (_2!2503 lt!81714))) (currentByte!3038 (_2!2503 lt!81714)) (currentBit!3033 (_2!2503 lt!81714))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!81713)))))

(declare-fun b!52732 () Bool)

(declare-fun res!44026 () Bool)

(assert (=> b!52732 (=> (not res!44026) (not e!35124))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52732 (= res!44026 (validate_offset_bits!1 ((_ sign_extend 32) (size!1139 (buf!1489 thiss!1379))) ((_ sign_extend 32) (currentByte!3038 thiss!1379)) ((_ sign_extend 32) (currentBit!3033 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52733 () Bool)

(assert (=> b!52733 (= e!35121 (array_inv!1044 (buf!1489 thiss!1379)))))

(declare-fun b!52734 () Bool)

(declare-fun e!35123 () Bool)

(assert (=> b!52734 (= e!35123 e!35126)))

(declare-fun res!44027 () Bool)

(assert (=> b!52734 (=> res!44027 e!35126)))

(assert (=> b!52734 (= res!44027 (not (= (size!1139 (buf!1489 thiss!1379)) (size!1139 (buf!1489 (_2!2503 lt!81714))))))))

(declare-fun appendBitFromByte!0 (BitStream!1970 (_ BitVec 8) (_ BitVec 32)) tuple2!4796)

(assert (=> b!52734 (= lt!81714 (appendBitFromByte!0 thiss!1379 (select (arr!1675 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!52735 () Bool)

(assert (=> b!52735 (= e!35124 (not e!35123))))

(declare-fun res!44025 () Bool)

(assert (=> b!52735 (=> res!44025 e!35123)))

(assert (=> b!52735 (= res!44025 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1970 BitStream!1970) Bool)

(assert (=> b!52735 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!81715 () Unit!3682)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1970) Unit!3682)

(assert (=> b!52735 (= lt!81715 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!52735 (= lt!81713 (bitIndex!0 (size!1139 (buf!1489 thiss!1379)) (currentByte!3038 thiss!1379) (currentBit!3033 thiss!1379)))))

(assert (= (and start!10510 res!44028) b!52732))

(assert (= (and b!52732 res!44026) b!52735))

(assert (= (and b!52735 (not res!44025)) b!52734))

(assert (= (and b!52734 (not res!44027)) b!52731))

(assert (= start!10510 b!52733))

(declare-fun m!83141 () Bool)

(assert (=> start!10510 m!83141))

(declare-fun m!83143 () Bool)

(assert (=> start!10510 m!83143))

(declare-fun m!83145 () Bool)

(assert (=> b!52731 m!83145))

(declare-fun m!83147 () Bool)

(assert (=> b!52734 m!83147))

(assert (=> b!52734 m!83147))

(declare-fun m!83149 () Bool)

(assert (=> b!52734 m!83149))

(declare-fun m!83151 () Bool)

(assert (=> b!52733 m!83151))

(declare-fun m!83153 () Bool)

(assert (=> b!52735 m!83153))

(declare-fun m!83155 () Bool)

(assert (=> b!52735 m!83155))

(declare-fun m!83157 () Bool)

(assert (=> b!52735 m!83157))

(declare-fun m!83159 () Bool)

(assert (=> b!52732 m!83159))

(push 1)

(assert (not b!52734))

(assert (not b!52733))

(assert (not b!52731))

(assert (not b!52732))

(assert (not start!10510))

(assert (not b!52735))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!16702 () Bool)

(assert (=> d!16702 (= (array_inv!1044 (buf!1489 thiss!1379)) (bvsge (size!1139 (buf!1489 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!52733 d!16702))

(declare-fun b!52837 () Bool)

(declare-fun res!44132 () Bool)

(declare-fun e!35179 () Bool)

(assert (=> b!52837 (=> (not res!44132) (not e!35179))))

(declare-fun lt!81870 () tuple2!4796)

(assert (=> b!52837 (= res!44132 (isPrefixOf!0 thiss!1379 (_2!2503 lt!81870)))))

(declare-fun b!52838 () Bool)

(declare-fun e!35181 () Bool)

(assert (=> b!52838 (= e!35179 e!35181)))

(declare-fun res!44133 () Bool)

(assert (=> b!52838 (=> (not res!44133) (not e!35181))))

(declare-datatypes ((tuple2!4806 0))(
  ( (tuple2!4807 (_1!2508 BitStream!1970) (_2!2508 Bool)) )
))
(declare-fun lt!81877 () tuple2!4806)

(declare-fun lt!81868 () (_ BitVec 8))

(assert (=> b!52838 (= res!44133 (and (= (_2!2508 lt!81877) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1675 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!81868)) #b00000000000000000000000000000000))) (= (_1!2508 lt!81877) (_2!2503 lt!81870))))))

(declare-datatypes ((tuple2!4808 0))(
  ( (tuple2!4809 (_1!2509 array!2492) (_2!2509 BitStream!1970)) )
))
(declare-fun lt!81866 () tuple2!4808)

(declare-fun lt!81872 () BitStream!1970)

(declare-fun readBits!0 (BitStream!1970 (_ BitVec 64)) tuple2!4808)

(assert (=> b!52838 (= lt!81866 (readBits!0 lt!81872 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1970) tuple2!4806)

(assert (=> b!52838 (= lt!81877 (readBitPure!0 lt!81872))))

(declare-fun readerFrom!0 (BitStream!1970 (_ BitVec 32) (_ BitVec 32)) BitStream!1970)

(assert (=> b!52838 (= lt!81872 (readerFrom!0 (_2!2503 lt!81870) (currentBit!3033 thiss!1379) (currentByte!3038 thiss!1379)))))

(declare-fun b!52839 () Bool)

(declare-fun res!44130 () Bool)

(declare-fun e!35180 () Bool)

(assert (=> b!52839 (=> (not res!44130) (not e!35180))))

(declare-fun lt!81876 () tuple2!4796)

(assert (=> b!52839 (= res!44130 (= (bitIndex!0 (size!1139 (buf!1489 (_2!2503 lt!81876))) (currentByte!3038 (_2!2503 lt!81876)) (currentBit!3033 (_2!2503 lt!81876))) (bvadd (bitIndex!0 (size!1139 (buf!1489 thiss!1379)) (currentByte!3038 thiss!1379) (currentBit!3033 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!52840 () Bool)

(declare-fun e!35182 () Bool)

(declare-fun lt!81871 () tuple2!4806)

(assert (=> b!52840 (= e!35182 (= (bitIndex!0 (size!1139 (buf!1489 (_1!2508 lt!81871))) (currentByte!3038 (_1!2508 lt!81871)) (currentBit!3033 (_1!2508 lt!81871))) (bitIndex!0 (size!1139 (buf!1489 (_2!2503 lt!81876))) (currentByte!3038 (_2!2503 lt!81876)) (currentBit!3033 (_2!2503 lt!81876)))))))

(declare-fun b!52841 () Bool)

(assert (=> b!52841 (= e!35181 (= (bitIndex!0 (size!1139 (buf!1489 (_1!2508 lt!81877))) (currentByte!3038 (_1!2508 lt!81877)) (currentBit!3033 (_1!2508 lt!81877))) (bitIndex!0 (size!1139 (buf!1489 (_2!2503 lt!81870))) (currentByte!3038 (_2!2503 lt!81870)) (currentBit!3033 (_2!2503 lt!81870)))))))

(declare-fun d!16704 () Bool)

(assert (=> d!16704 e!35179))

(declare-fun res!44129 () Bool)

(assert (=> d!16704 (=> (not res!44129) (not e!35179))))

(assert (=> d!16704 (= res!44129 (= (size!1139 (buf!1489 (_2!2503 lt!81870))) (size!1139 (buf!1489 thiss!1379))))))

(declare-fun lt!81874 () array!2492)

(assert (=> d!16704 (= lt!81868 (select (arr!1675 lt!81874) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!16704 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1139 lt!81874)))))

(assert (=> d!16704 (= lt!81874 (array!2493 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!81875 () tuple2!4796)

(assert (=> d!16704 (= lt!81870 (tuple2!4797 (_1!2503 lt!81875) (_2!2503 lt!81875)))))

(assert (=> d!16704 (= lt!81875 lt!81876)))

(assert (=> d!16704 e!35180))

(declare-fun res!44128 () Bool)

(assert (=> d!16704 (=> (not res!44128) (not e!35180))))

(assert (=> d!16704 (= res!44128 (= (size!1139 (buf!1489 thiss!1379)) (size!1139 (buf!1489 (_2!2503 lt!81876)))))))

(declare-fun lt!81873 () Bool)

(declare-fun appendBit!0 (BitStream!1970 Bool) tuple2!4796)

(assert (=> d!16704 (= lt!81876 (appendBit!0 thiss!1379 lt!81873))))

(assert (=> d!16704 (= lt!81873 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1675 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!16704 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!16704 (= (appendBitFromByte!0 thiss!1379 (select (arr!1675 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!81870)))

(declare-fun b!52842 () Bool)

(declare-fun res!44131 () Bool)

(assert (=> b!52842 (=> (not res!44131) (not e!35180))))

(assert (=> b!52842 (= res!44131 (isPrefixOf!0 thiss!1379 (_2!2503 lt!81876)))))

(declare-fun b!52843 () Bool)

(assert (=> b!52843 (= e!35180 e!35182)))

(declare-fun res!44127 () Bool)

(assert (=> b!52843 (=> (not res!44127) (not e!35182))))

(assert (=> b!52843 (= res!44127 (and (= (_2!2508 lt!81871) lt!81873) (= (_1!2508 lt!81871) (_2!2503 lt!81876))))))

(assert (=> b!52843 (= lt!81871 (readBitPure!0 (readerFrom!0 (_2!2503 lt!81876) (currentBit!3033 thiss!1379) (currentByte!3038 thiss!1379))))))

(declare-fun b!52844 () Bool)

(declare-fun res!44134 () Bool)

(assert (=> b!52844 (=> (not res!44134) (not e!35179))))

(declare-fun lt!81869 () (_ BitVec 64))

(declare-fun lt!81867 () (_ BitVec 64))

(assert (=> b!52844 (= res!44134 (= (bitIndex!0 (size!1139 (buf!1489 (_2!2503 lt!81870))) (currentByte!3038 (_2!2503 lt!81870)) (currentBit!3033 (_2!2503 lt!81870))) (bvadd lt!81869 lt!81867)))))

(assert (=> b!52844 (or (not (= (bvand lt!81869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!81867 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!81869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!81869 lt!81867) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!52844 (= lt!81867 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!52844 (= lt!81869 (bitIndex!0 (size!1139 (buf!1489 thiss!1379)) (currentByte!3038 thiss!1379) (currentBit!3033 thiss!1379)))))

(assert (= (and d!16704 res!44128) b!52839))

(assert (= (and b!52839 res!44130) b!52842))

(assert (= (and b!52842 res!44131) b!52843))

(assert (= (and b!52843 res!44127) b!52840))

(assert (= (and d!16704 res!44129) b!52844))

(assert (= (and b!52844 res!44134) b!52837))

(assert (= (and b!52837 res!44132) b!52838))

(assert (= (and b!52838 res!44133) b!52841))

(declare-fun m!83241 () Bool)

(assert (=> b!52842 m!83241))

(declare-fun m!83243 () Bool)

(assert (=> b!52844 m!83243))

(assert (=> b!52844 m!83157))

(declare-fun m!83245 () Bool)

(assert (=> b!52843 m!83245))

(assert (=> b!52843 m!83245))

(declare-fun m!83247 () Bool)

(assert (=> b!52843 m!83247))

(declare-fun m!83249 () Bool)

(assert (=> b!52841 m!83249))

(assert (=> b!52841 m!83243))

(declare-fun m!83251 () Bool)

(assert (=> b!52839 m!83251))

(assert (=> b!52839 m!83157))

(declare-fun m!83253 () Bool)

(assert (=> b!52837 m!83253))

(declare-fun m!83255 () Bool)

(assert (=> b!52840 m!83255))

(assert (=> b!52840 m!83251))

(declare-fun m!83257 () Bool)

(assert (=> d!16704 m!83257))

(declare-fun m!83259 () Bool)

(assert (=> d!16704 m!83259))

(declare-fun m!83261 () Bool)

(assert (=> d!16704 m!83261))

(declare-fun m!83263 () Bool)

(assert (=> b!52838 m!83263))

(declare-fun m!83265 () Bool)

(assert (=> b!52838 m!83265))

(declare-fun m!83267 () Bool)

(assert (=> b!52838 m!83267))

(assert (=> b!52734 d!16704))

(declare-fun d!16730 () Bool)

(assert (=> d!16730 (= (array_inv!1044 srcBuffer!2) (bvsge (size!1139 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10510 d!16730))

(declare-fun d!16732 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!16732 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3033 thiss!1379) (currentByte!3038 thiss!1379) (size!1139 (buf!1489 thiss!1379))))))

(declare-fun bs!4241 () Bool)

(assert (= bs!4241 d!16732))

(declare-fun m!83269 () Bool)

(assert (=> bs!4241 m!83269))

(assert (=> start!10510 d!16732))

(declare-fun d!16734 () Bool)

(declare-fun res!44142 () Bool)

(declare-fun e!35187 () Bool)

(assert (=> d!16734 (=> (not res!44142) (not e!35187))))

(assert (=> d!16734 (= res!44142 (= (size!1139 (buf!1489 thiss!1379)) (size!1139 (buf!1489 thiss!1379))))))

(assert (=> d!16734 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!35187)))

(declare-fun b!52851 () Bool)

(declare-fun res!44141 () Bool)

(assert (=> b!52851 (=> (not res!44141) (not e!35187))))

(assert (=> b!52851 (= res!44141 (bvsle (bitIndex!0 (size!1139 (buf!1489 thiss!1379)) (currentByte!3038 thiss!1379) (currentBit!3033 thiss!1379)) (bitIndex!0 (size!1139 (buf!1489 thiss!1379)) (currentByte!3038 thiss!1379) (currentBit!3033 thiss!1379))))))

(declare-fun b!52852 () Bool)

(declare-fun e!35188 () Bool)

(assert (=> b!52852 (= e!35187 e!35188)))

(declare-fun res!44143 () Bool)

(assert (=> b!52852 (=> res!44143 e!35188)))

(assert (=> b!52852 (= res!44143 (= (size!1139 (buf!1489 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!52853 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2492 array!2492 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52853 (= e!35188 (arrayBitRangesEq!0 (buf!1489 thiss!1379) (buf!1489 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1139 (buf!1489 thiss!1379)) (currentByte!3038 thiss!1379) (currentBit!3033 thiss!1379))))))

(assert (= (and d!16734 res!44142) b!52851))

(assert (= (and b!52851 res!44141) b!52852))

(assert (= (and b!52852 (not res!44143)) b!52853))

(assert (=> b!52851 m!83157))

(assert (=> b!52851 m!83157))

(assert (=> b!52853 m!83157))

(assert (=> b!52853 m!83157))

(declare-fun m!83271 () Bool)

(assert (=> b!52853 m!83271))

(assert (=> b!52735 d!16734))

(declare-fun d!16736 () Bool)

(assert (=> d!16736 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!81880 () Unit!3682)

(declare-fun choose!11 (BitStream!1970) Unit!3682)

(assert (=> d!16736 (= lt!81880 (choose!11 thiss!1379))))

(assert (=> d!16736 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!81880)))

(declare-fun bs!4243 () Bool)

(assert (= bs!4243 d!16736))

(assert (=> bs!4243 m!83153))

(declare-fun m!83273 () Bool)

(assert (=> bs!4243 m!83273))

(assert (=> b!52735 d!16736))

(declare-fun d!16738 () Bool)

(declare-fun e!35191 () Bool)

(assert (=> d!16738 e!35191))

(declare-fun res!44148 () Bool)

(assert (=> d!16738 (=> (not res!44148) (not e!35191))))

(declare-fun lt!81894 () (_ BitVec 64))

(declare-fun lt!81897 () (_ BitVec 64))

(declare-fun lt!81898 () (_ BitVec 64))

(assert (=> d!16738 (= res!44148 (= lt!81894 (bvsub lt!81898 lt!81897)))))

(assert (=> d!16738 (or (= (bvand lt!81898 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!81897 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!81898 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!81898 lt!81897) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!16738 (= lt!81897 (remainingBits!0 ((_ sign_extend 32) (size!1139 (buf!1489 thiss!1379))) ((_ sign_extend 32) (currentByte!3038 thiss!1379)) ((_ sign_extend 32) (currentBit!3033 thiss!1379))))))

(declare-fun lt!81895 () (_ BitVec 64))

(declare-fun lt!81893 () (_ BitVec 64))

(assert (=> d!16738 (= lt!81898 (bvmul lt!81895 lt!81893))))

(assert (=> d!16738 (or (= lt!81895 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!81893 (bvsdiv (bvmul lt!81895 lt!81893) lt!81895)))))

(assert (=> d!16738 (= lt!81893 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16738 (= lt!81895 ((_ sign_extend 32) (size!1139 (buf!1489 thiss!1379))))))

(assert (=> d!16738 (= lt!81894 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3038 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3033 thiss!1379))))))

(assert (=> d!16738 (invariant!0 (currentBit!3033 thiss!1379) (currentByte!3038 thiss!1379) (size!1139 (buf!1489 thiss!1379)))))

(assert (=> d!16738 (= (bitIndex!0 (size!1139 (buf!1489 thiss!1379)) (currentByte!3038 thiss!1379) (currentBit!3033 thiss!1379)) lt!81894)))

(declare-fun b!52858 () Bool)

(declare-fun res!44149 () Bool)

(assert (=> b!52858 (=> (not res!44149) (not e!35191))))

(assert (=> b!52858 (= res!44149 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!81894))))

(declare-fun b!52859 () Bool)

(declare-fun lt!81896 () (_ BitVec 64))

(assert (=> b!52859 (= e!35191 (bvsle lt!81894 (bvmul lt!81896 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!52859 (or (= lt!81896 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!81896 #b0000000000000000000000000000000000000000000000000000000000001000) lt!81896)))))

(assert (=> b!52859 (= lt!81896 ((_ sign_extend 32) (size!1139 (buf!1489 thiss!1379))))))

(assert (= (and d!16738 res!44148) b!52858))

(assert (= (and b!52858 res!44149) b!52859))

(declare-fun m!83275 () Bool)

(assert (=> d!16738 m!83275))

(assert (=> d!16738 m!83269))

(assert (=> b!52735 d!16738))

(declare-fun d!16740 () Bool)

(declare-fun e!35192 () Bool)

(assert (=> d!16740 e!35192))

(declare-fun res!44150 () Bool)

(assert (=> d!16740 (=> (not res!44150) (not e!35192))))

(declare-fun lt!81903 () (_ BitVec 64))

(declare-fun lt!81904 () (_ BitVec 64))

(declare-fun lt!81900 () (_ BitVec 64))

(assert (=> d!16740 (= res!44150 (= lt!81900 (bvsub lt!81904 lt!81903)))))

(assert (=> d!16740 (or (= (bvand lt!81904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!81903 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!81904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!81904 lt!81903) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16740 (= lt!81903 (remainingBits!0 ((_ sign_extend 32) (size!1139 (buf!1489 (_2!2503 lt!81714)))) ((_ sign_extend 32) (currentByte!3038 (_2!2503 lt!81714))) ((_ sign_extend 32) (currentBit!3033 (_2!2503 lt!81714)))))))

(declare-fun lt!81901 () (_ BitVec 64))

(declare-fun lt!81899 () (_ BitVec 64))

(assert (=> d!16740 (= lt!81904 (bvmul lt!81901 lt!81899))))

(assert (=> d!16740 (or (= lt!81901 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!81899 (bvsdiv (bvmul lt!81901 lt!81899) lt!81901)))))

(assert (=> d!16740 (= lt!81899 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16740 (= lt!81901 ((_ sign_extend 32) (size!1139 (buf!1489 (_2!2503 lt!81714)))))))

(assert (=> d!16740 (= lt!81900 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3038 (_2!2503 lt!81714))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3033 (_2!2503 lt!81714)))))))

(assert (=> d!16740 (invariant!0 (currentBit!3033 (_2!2503 lt!81714)) (currentByte!3038 (_2!2503 lt!81714)) (size!1139 (buf!1489 (_2!2503 lt!81714))))))

(assert (=> d!16740 (= (bitIndex!0 (size!1139 (buf!1489 (_2!2503 lt!81714))) (currentByte!3038 (_2!2503 lt!81714)) (currentBit!3033 (_2!2503 lt!81714))) lt!81900)))

(declare-fun b!52860 () Bool)

(declare-fun res!44151 () Bool)

(assert (=> b!52860 (=> (not res!44151) (not e!35192))))

(assert (=> b!52860 (= res!44151 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!81900))))

(declare-fun b!52861 () Bool)

(declare-fun lt!81902 () (_ BitVec 64))

(assert (=> b!52861 (= e!35192 (bvsle lt!81900 (bvmul lt!81902 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!52861 (or (= lt!81902 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!81902 #b0000000000000000000000000000000000000000000000000000000000001000) lt!81902)))))

(assert (=> b!52861 (= lt!81902 ((_ sign_extend 32) (size!1139 (buf!1489 (_2!2503 lt!81714)))))))

(assert (= (and d!16740 res!44150) b!52860))

(assert (= (and b!52860 res!44151) b!52861))

(declare-fun m!83277 () Bool)

(assert (=> d!16740 m!83277))

(declare-fun m!83279 () Bool)

(assert (=> d!16740 m!83279))

(assert (=> b!52731 d!16740))

(declare-fun d!16742 () Bool)

(assert (=> d!16742 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1139 (buf!1489 thiss!1379))) ((_ sign_extend 32) (currentByte!3038 thiss!1379)) ((_ sign_extend 32) (currentBit!3033 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1139 (buf!1489 thiss!1379))) ((_ sign_extend 32) (currentByte!3038 thiss!1379)) ((_ sign_extend 32) (currentBit!3033 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4244 () Bool)

(assert (= bs!4244 d!16742))

(assert (=> bs!4244 m!83275))

(assert (=> b!52732 d!16742))

(push 1)

(assert (not b!52843))

(assert (not b!52844))

(assert (not d!16742))

(assert (not d!16732))

(assert (not d!16740))

(assert (not b!52840))

(assert (not b!52839))

(assert (not b!52838))

(assert (not b!52851))

(assert (not b!52853))

(assert (not d!16738))

(assert (not b!52841))

(assert (not d!16704))

(assert (not b!52837))

(assert (not b!52842))

(assert (not d!16736))

(check-sat)

(pop 1)

(push 1)

(check-sat)

