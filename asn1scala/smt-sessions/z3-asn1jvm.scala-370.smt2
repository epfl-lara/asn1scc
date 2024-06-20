; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8550 () Bool)

(assert start!8550)

(declare-fun res!36295 () Bool)

(declare-fun e!28513 () Bool)

(assert (=> start!8550 (=> (not res!36295) (not e!28513))))

(declare-datatypes ((array!2194 0))(
  ( (array!2195 (arr!1491 (Array (_ BitVec 32) (_ BitVec 8))) (size!992 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2194)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8550 (= res!36295 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!992 srcBuffer!2))))))))

(assert (=> start!8550 e!28513))

(assert (=> start!8550 true))

(declare-fun array_inv!917 (array!2194) Bool)

(assert (=> start!8550 (array_inv!917 srcBuffer!2)))

(declare-datatypes ((BitStream!1728 0))(
  ( (BitStream!1729 (buf!1323 array!2194) (currentByte!2787 (_ BitVec 32)) (currentBit!2782 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1728)

(declare-fun e!28516 () Bool)

(declare-fun inv!12 (BitStream!1728) Bool)

(assert (=> start!8550 (and (inv!12 thiss!1379) e!28516)))

(declare-datatypes ((tuple2!4190 0))(
  ( (tuple2!4191 (_1!2188 BitStream!1728) (_2!2188 BitStream!1728)) )
))
(declare-fun lt!64072 () tuple2!4190)

(declare-fun e!28515 () Bool)

(declare-datatypes ((Unit!3038 0))(
  ( (Unit!3039) )
))
(declare-datatypes ((tuple2!4192 0))(
  ( (tuple2!4193 (_1!2189 Unit!3038) (_2!2189 BitStream!1728)) )
))
(declare-fun lt!64071 () tuple2!4192)

(declare-fun b!42662 () Bool)

(declare-datatypes ((List!505 0))(
  ( (Nil!502) (Cons!501 (h!620 Bool) (t!1255 List!505)) )
))
(declare-fun head!324 (List!505) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1728 array!2194 (_ BitVec 64) (_ BitVec 64)) List!505)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1728 BitStream!1728 (_ BitVec 64)) List!505)

(assert (=> b!42662 (= e!28515 (= (head!324 (byteArrayBitContentToList!0 (_2!2189 lt!64071) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!324 (bitStreamReadBitsIntoList!0 (_2!2189 lt!64071) (_1!2188 lt!64072) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!42663 () Bool)

(declare-fun e!28517 () Bool)

(assert (=> b!42663 (= e!28513 (not e!28517))))

(declare-fun res!36296 () Bool)

(assert (=> b!42663 (=> res!36296 e!28517)))

(assert (=> b!42663 (= res!36296 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1728 BitStream!1728) Bool)

(assert (=> b!42663 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!64076 () Unit!3038)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1728) Unit!3038)

(assert (=> b!42663 (= lt!64076 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!64078 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42663 (= lt!64078 (bitIndex!0 (size!992 (buf!1323 thiss!1379)) (currentByte!2787 thiss!1379) (currentBit!2782 thiss!1379)))))

(declare-fun b!42664 () Bool)

(assert (=> b!42664 (= e!28516 (array_inv!917 (buf!1323 thiss!1379)))))

(declare-fun b!42665 () Bool)

(declare-fun e!28514 () Bool)

(assert (=> b!42665 (= e!28517 e!28514)))

(declare-fun res!36297 () Bool)

(assert (=> b!42665 (=> res!36297 e!28514)))

(assert (=> b!42665 (= res!36297 (not (isPrefixOf!0 thiss!1379 (_2!2189 lt!64071))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42665 (validate_offset_bits!1 ((_ sign_extend 32) (size!992 (buf!1323 (_2!2189 lt!64071)))) ((_ sign_extend 32) (currentByte!2787 (_2!2189 lt!64071))) ((_ sign_extend 32) (currentBit!2782 (_2!2189 lt!64071))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!64077 () Unit!3038)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1728 BitStream!1728 (_ BitVec 64) (_ BitVec 64)) Unit!3038)

(assert (=> b!42665 (= lt!64077 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2189 lt!64071) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1728 (_ BitVec 8) (_ BitVec 32)) tuple2!4192)

(assert (=> b!42665 (= lt!64071 (appendBitFromByte!0 thiss!1379 (select (arr!1491 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!42666 () Bool)

(declare-fun lt!64075 () tuple2!4192)

(assert (=> b!42666 (= e!28514 (isPrefixOf!0 (_2!2189 lt!64071) (_2!2189 lt!64075)))))

(assert (=> b!42666 (isPrefixOf!0 thiss!1379 (_2!2189 lt!64075))))

(declare-fun lt!64074 () Unit!3038)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1728 BitStream!1728 BitStream!1728) Unit!3038)

(assert (=> b!42666 (= lt!64074 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2189 lt!64071) (_2!2189 lt!64075)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1728 array!2194 (_ BitVec 64) (_ BitVec 64)) tuple2!4192)

(assert (=> b!42666 (= lt!64075 (appendBitsMSBFirstLoop!0 (_2!2189 lt!64071) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!42666 e!28515))

(declare-fun res!36294 () Bool)

(assert (=> b!42666 (=> (not res!36294) (not e!28515))))

(assert (=> b!42666 (= res!36294 (validate_offset_bits!1 ((_ sign_extend 32) (size!992 (buf!1323 (_2!2189 lt!64071)))) ((_ sign_extend 32) (currentByte!2787 thiss!1379)) ((_ sign_extend 32) (currentBit!2782 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!64073 () Unit!3038)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1728 array!2194 (_ BitVec 64)) Unit!3038)

(assert (=> b!42666 (= lt!64073 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1323 (_2!2189 lt!64071)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1728 BitStream!1728) tuple2!4190)

(assert (=> b!42666 (= lt!64072 (reader!0 thiss!1379 (_2!2189 lt!64071)))))

(declare-fun b!42667 () Bool)

(declare-fun res!36293 () Bool)

(assert (=> b!42667 (=> (not res!36293) (not e!28513))))

(assert (=> b!42667 (= res!36293 (validate_offset_bits!1 ((_ sign_extend 32) (size!992 (buf!1323 thiss!1379))) ((_ sign_extend 32) (currentByte!2787 thiss!1379)) ((_ sign_extend 32) (currentBit!2782 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8550 res!36295) b!42667))

(assert (= (and b!42667 res!36293) b!42663))

(assert (= (and b!42663 (not res!36296)) b!42665))

(assert (= (and b!42665 (not res!36297)) b!42666))

(assert (= (and b!42666 res!36294) b!42662))

(assert (= start!8550 b!42664))

(declare-fun m!64697 () Bool)

(assert (=> b!42665 m!64697))

(declare-fun m!64699 () Bool)

(assert (=> b!42665 m!64699))

(declare-fun m!64701 () Bool)

(assert (=> b!42665 m!64701))

(assert (=> b!42665 m!64697))

(declare-fun m!64703 () Bool)

(assert (=> b!42665 m!64703))

(declare-fun m!64705 () Bool)

(assert (=> b!42665 m!64705))

(declare-fun m!64707 () Bool)

(assert (=> b!42667 m!64707))

(declare-fun m!64709 () Bool)

(assert (=> b!42664 m!64709))

(declare-fun m!64711 () Bool)

(assert (=> start!8550 m!64711))

(declare-fun m!64713 () Bool)

(assert (=> start!8550 m!64713))

(declare-fun m!64715 () Bool)

(assert (=> b!42663 m!64715))

(declare-fun m!64717 () Bool)

(assert (=> b!42663 m!64717))

(declare-fun m!64719 () Bool)

(assert (=> b!42663 m!64719))

(declare-fun m!64721 () Bool)

(assert (=> b!42666 m!64721))

(declare-fun m!64723 () Bool)

(assert (=> b!42666 m!64723))

(declare-fun m!64725 () Bool)

(assert (=> b!42666 m!64725))

(declare-fun m!64727 () Bool)

(assert (=> b!42666 m!64727))

(declare-fun m!64729 () Bool)

(assert (=> b!42666 m!64729))

(declare-fun m!64731 () Bool)

(assert (=> b!42666 m!64731))

(declare-fun m!64733 () Bool)

(assert (=> b!42666 m!64733))

(declare-fun m!64735 () Bool)

(assert (=> b!42662 m!64735))

(assert (=> b!42662 m!64735))

(declare-fun m!64737 () Bool)

(assert (=> b!42662 m!64737))

(declare-fun m!64739 () Bool)

(assert (=> b!42662 m!64739))

(assert (=> b!42662 m!64739))

(declare-fun m!64741 () Bool)

(assert (=> b!42662 m!64741))

(check-sat (not b!42667) (not b!42665) (not start!8550) (not b!42664) (not b!42666) (not b!42662) (not b!42663))
(check-sat)
(get-model)

(declare-fun d!12340 () Bool)

(declare-fun res!36319 () Bool)

(declare-fun e!28546 () Bool)

(assert (=> d!12340 (=> (not res!36319) (not e!28546))))

(assert (=> d!12340 (= res!36319 (= (size!992 (buf!1323 thiss!1379)) (size!992 (buf!1323 thiss!1379))))))

(assert (=> d!12340 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!28546)))

(declare-fun b!42692 () Bool)

(declare-fun res!36321 () Bool)

(assert (=> b!42692 (=> (not res!36321) (not e!28546))))

(assert (=> b!42692 (= res!36321 (bvsle (bitIndex!0 (size!992 (buf!1323 thiss!1379)) (currentByte!2787 thiss!1379) (currentBit!2782 thiss!1379)) (bitIndex!0 (size!992 (buf!1323 thiss!1379)) (currentByte!2787 thiss!1379) (currentBit!2782 thiss!1379))))))

(declare-fun b!42693 () Bool)

(declare-fun e!28545 () Bool)

(assert (=> b!42693 (= e!28546 e!28545)))

(declare-fun res!36320 () Bool)

(assert (=> b!42693 (=> res!36320 e!28545)))

(assert (=> b!42693 (= res!36320 (= (size!992 (buf!1323 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!42694 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2194 array!2194 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42694 (= e!28545 (arrayBitRangesEq!0 (buf!1323 thiss!1379) (buf!1323 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!992 (buf!1323 thiss!1379)) (currentByte!2787 thiss!1379) (currentBit!2782 thiss!1379))))))

(assert (= (and d!12340 res!36319) b!42692))

(assert (= (and b!42692 res!36321) b!42693))

(assert (= (and b!42693 (not res!36320)) b!42694))

(assert (=> b!42692 m!64719))

(assert (=> b!42692 m!64719))

(assert (=> b!42694 m!64719))

(assert (=> b!42694 m!64719))

(declare-fun m!64789 () Bool)

(assert (=> b!42694 m!64789))

(assert (=> b!42663 d!12340))

(declare-fun d!12342 () Bool)

(assert (=> d!12342 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!64105 () Unit!3038)

(declare-fun choose!11 (BitStream!1728) Unit!3038)

(assert (=> d!12342 (= lt!64105 (choose!11 thiss!1379))))

(assert (=> d!12342 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!64105)))

(declare-fun bs!3335 () Bool)

(assert (= bs!3335 d!12342))

(assert (=> bs!3335 m!64715))

(declare-fun m!64791 () Bool)

(assert (=> bs!3335 m!64791))

(assert (=> b!42663 d!12342))

(declare-fun d!12344 () Bool)

(declare-fun e!28549 () Bool)

(assert (=> d!12344 e!28549))

(declare-fun res!36326 () Bool)

(assert (=> d!12344 (=> (not res!36326) (not e!28549))))

(declare-fun lt!64118 () (_ BitVec 64))

(declare-fun lt!64121 () (_ BitVec 64))

(declare-fun lt!64122 () (_ BitVec 64))

(assert (=> d!12344 (= res!36326 (= lt!64118 (bvsub lt!64121 lt!64122)))))

(assert (=> d!12344 (or (= (bvand lt!64121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!64122 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!64121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!64121 lt!64122) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12344 (= lt!64122 (remainingBits!0 ((_ sign_extend 32) (size!992 (buf!1323 thiss!1379))) ((_ sign_extend 32) (currentByte!2787 thiss!1379)) ((_ sign_extend 32) (currentBit!2782 thiss!1379))))))

(declare-fun lt!64119 () (_ BitVec 64))

(declare-fun lt!64120 () (_ BitVec 64))

(assert (=> d!12344 (= lt!64121 (bvmul lt!64119 lt!64120))))

(assert (=> d!12344 (or (= lt!64119 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!64120 (bvsdiv (bvmul lt!64119 lt!64120) lt!64119)))))

(assert (=> d!12344 (= lt!64120 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12344 (= lt!64119 ((_ sign_extend 32) (size!992 (buf!1323 thiss!1379))))))

(assert (=> d!12344 (= lt!64118 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2787 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2782 thiss!1379))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!12344 (invariant!0 (currentBit!2782 thiss!1379) (currentByte!2787 thiss!1379) (size!992 (buf!1323 thiss!1379)))))

(assert (=> d!12344 (= (bitIndex!0 (size!992 (buf!1323 thiss!1379)) (currentByte!2787 thiss!1379) (currentBit!2782 thiss!1379)) lt!64118)))

(declare-fun b!42699 () Bool)

(declare-fun res!36327 () Bool)

(assert (=> b!42699 (=> (not res!36327) (not e!28549))))

(assert (=> b!42699 (= res!36327 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!64118))))

(declare-fun b!42700 () Bool)

(declare-fun lt!64123 () (_ BitVec 64))

(assert (=> b!42700 (= e!28549 (bvsle lt!64118 (bvmul lt!64123 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!42700 (or (= lt!64123 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!64123 #b0000000000000000000000000000000000000000000000000000000000001000) lt!64123)))))

(assert (=> b!42700 (= lt!64123 ((_ sign_extend 32) (size!992 (buf!1323 thiss!1379))))))

(assert (= (and d!12344 res!36326) b!42699))

(assert (= (and b!42699 res!36327) b!42700))

(declare-fun m!64793 () Bool)

(assert (=> d!12344 m!64793))

(declare-fun m!64795 () Bool)

(assert (=> d!12344 m!64795))

(assert (=> b!42663 d!12344))

(declare-fun d!12346 () Bool)

(assert (=> d!12346 (= (head!324 (byteArrayBitContentToList!0 (_2!2189 lt!64071) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!620 (byteArrayBitContentToList!0 (_2!2189 lt!64071) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!42662 d!12346))

(declare-fun d!12348 () Bool)

(declare-fun c!2781 () Bool)

(assert (=> d!12348 (= c!2781 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!28552 () List!505)

(assert (=> d!12348 (= (byteArrayBitContentToList!0 (_2!2189 lt!64071) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!28552)))

(declare-fun b!42705 () Bool)

(assert (=> b!42705 (= e!28552 Nil!502)))

(declare-fun b!42706 () Bool)

(assert (=> b!42706 (= e!28552 (Cons!501 (not (= (bvand ((_ sign_extend 24) (select (arr!1491 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2189 lt!64071) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!12348 c!2781) b!42705))

(assert (= (and d!12348 (not c!2781)) b!42706))

(assert (=> b!42706 m!64697))

(declare-fun m!64797 () Bool)

(assert (=> b!42706 m!64797))

(declare-fun m!64799 () Bool)

(assert (=> b!42706 m!64799))

(assert (=> b!42662 d!12348))

(declare-fun d!12350 () Bool)

(assert (=> d!12350 (= (head!324 (bitStreamReadBitsIntoList!0 (_2!2189 lt!64071) (_1!2188 lt!64072) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!620 (bitStreamReadBitsIntoList!0 (_2!2189 lt!64071) (_1!2188 lt!64072) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!42662 d!12350))

(declare-fun b!42726 () Bool)

(declare-fun e!28564 () Bool)

(declare-fun lt!64130 () List!505)

(declare-fun isEmpty!114 (List!505) Bool)

(assert (=> b!42726 (= e!28564 (isEmpty!114 lt!64130))))

(declare-fun b!42724 () Bool)

(declare-datatypes ((tuple2!4198 0))(
  ( (tuple2!4199 (_1!2192 List!505) (_2!2192 BitStream!1728)) )
))
(declare-fun e!28563 () tuple2!4198)

(assert (=> b!42724 (= e!28563 (tuple2!4199 Nil!502 (_1!2188 lt!64072)))))

(declare-datatypes ((tuple2!4200 0))(
  ( (tuple2!4201 (_1!2193 Bool) (_2!2193 BitStream!1728)) )
))
(declare-fun lt!64131 () tuple2!4200)

(declare-fun b!42725 () Bool)

(declare-fun lt!64132 () (_ BitVec 64))

(assert (=> b!42725 (= e!28563 (tuple2!4199 (Cons!501 (_1!2193 lt!64131) (bitStreamReadBitsIntoList!0 (_2!2189 lt!64071) (_2!2193 lt!64131) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!64132))) (_2!2193 lt!64131)))))

(declare-fun readBit!0 (BitStream!1728) tuple2!4200)

(assert (=> b!42725 (= lt!64131 (readBit!0 (_1!2188 lt!64072)))))

(assert (=> b!42725 (= lt!64132 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!12352 () Bool)

(assert (=> d!12352 e!28564))

(declare-fun c!2786 () Bool)

(assert (=> d!12352 (= c!2786 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12352 (= lt!64130 (_1!2192 e!28563))))

(declare-fun c!2787 () Bool)

(assert (=> d!12352 (= c!2787 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12352 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12352 (= (bitStreamReadBitsIntoList!0 (_2!2189 lt!64071) (_1!2188 lt!64072) #b0000000000000000000000000000000000000000000000000000000000000001) lt!64130)))

(declare-fun b!42727 () Bool)

(declare-fun length!212 (List!505) Int)

(assert (=> b!42727 (= e!28564 (> (length!212 lt!64130) 0))))

(assert (= (and d!12352 c!2787) b!42724))

(assert (= (and d!12352 (not c!2787)) b!42725))

(assert (= (and d!12352 c!2786) b!42726))

(assert (= (and d!12352 (not c!2786)) b!42727))

(declare-fun m!64805 () Bool)

(assert (=> b!42726 m!64805))

(declare-fun m!64807 () Bool)

(assert (=> b!42725 m!64807))

(declare-fun m!64809 () Bool)

(assert (=> b!42725 m!64809))

(declare-fun m!64811 () Bool)

(assert (=> b!42727 m!64811))

(assert (=> b!42662 d!12352))

(declare-fun d!12358 () Bool)

(assert (=> d!12358 (= (array_inv!917 (buf!1323 thiss!1379)) (bvsge (size!992 (buf!1323 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!42664 d!12358))

(declare-fun d!12362 () Bool)

(assert (=> d!12362 (= (array_inv!917 srcBuffer!2) (bvsge (size!992 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8550 d!12362))

(declare-fun d!12364 () Bool)

(assert (=> d!12364 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2782 thiss!1379) (currentByte!2787 thiss!1379) (size!992 (buf!1323 thiss!1379))))))

(declare-fun bs!3337 () Bool)

(assert (= bs!3337 d!12364))

(assert (=> bs!3337 m!64795))

(assert (=> start!8550 d!12364))

(declare-fun d!12366 () Bool)

(declare-fun res!36337 () Bool)

(declare-fun e!28566 () Bool)

(assert (=> d!12366 (=> (not res!36337) (not e!28566))))

(assert (=> d!12366 (= res!36337 (= (size!992 (buf!1323 thiss!1379)) (size!992 (buf!1323 (_2!2189 lt!64071)))))))

(assert (=> d!12366 (= (isPrefixOf!0 thiss!1379 (_2!2189 lt!64071)) e!28566)))

(declare-fun b!42728 () Bool)

(declare-fun res!36339 () Bool)

(assert (=> b!42728 (=> (not res!36339) (not e!28566))))

(assert (=> b!42728 (= res!36339 (bvsle (bitIndex!0 (size!992 (buf!1323 thiss!1379)) (currentByte!2787 thiss!1379) (currentBit!2782 thiss!1379)) (bitIndex!0 (size!992 (buf!1323 (_2!2189 lt!64071))) (currentByte!2787 (_2!2189 lt!64071)) (currentBit!2782 (_2!2189 lt!64071)))))))

(declare-fun b!42729 () Bool)

(declare-fun e!28565 () Bool)

(assert (=> b!42729 (= e!28566 e!28565)))

(declare-fun res!36338 () Bool)

(assert (=> b!42729 (=> res!36338 e!28565)))

(assert (=> b!42729 (= res!36338 (= (size!992 (buf!1323 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!42730 () Bool)

(assert (=> b!42730 (= e!28565 (arrayBitRangesEq!0 (buf!1323 thiss!1379) (buf!1323 (_2!2189 lt!64071)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!992 (buf!1323 thiss!1379)) (currentByte!2787 thiss!1379) (currentBit!2782 thiss!1379))))))

(assert (= (and d!12366 res!36337) b!42728))

(assert (= (and b!42728 res!36339) b!42729))

(assert (= (and b!42729 (not res!36338)) b!42730))

(assert (=> b!42728 m!64719))

(declare-fun m!64815 () Bool)

(assert (=> b!42728 m!64815))

(assert (=> b!42730 m!64719))

(assert (=> b!42730 m!64719))

(declare-fun m!64817 () Bool)

(assert (=> b!42730 m!64817))

(assert (=> b!42665 d!12366))

(declare-fun d!12368 () Bool)

(assert (=> d!12368 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!992 (buf!1323 (_2!2189 lt!64071)))) ((_ sign_extend 32) (currentByte!2787 (_2!2189 lt!64071))) ((_ sign_extend 32) (currentBit!2782 (_2!2189 lt!64071))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!992 (buf!1323 (_2!2189 lt!64071)))) ((_ sign_extend 32) (currentByte!2787 (_2!2189 lt!64071))) ((_ sign_extend 32) (currentBit!2782 (_2!2189 lt!64071)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3338 () Bool)

(assert (= bs!3338 d!12368))

(declare-fun m!64819 () Bool)

(assert (=> bs!3338 m!64819))

(assert (=> b!42665 d!12368))

(declare-fun d!12370 () Bool)

(declare-fun e!28572 () Bool)

(assert (=> d!12370 e!28572))

(declare-fun res!36345 () Bool)

(assert (=> d!12370 (=> (not res!36345) (not e!28572))))

(assert (=> d!12370 (= res!36345 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!64138 () Unit!3038)

(declare-fun choose!27 (BitStream!1728 BitStream!1728 (_ BitVec 64) (_ BitVec 64)) Unit!3038)

(assert (=> d!12370 (= lt!64138 (choose!27 thiss!1379 (_2!2189 lt!64071) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!12370 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!12370 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2189 lt!64071) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!64138)))

(declare-fun b!42736 () Bool)

(assert (=> b!42736 (= e!28572 (validate_offset_bits!1 ((_ sign_extend 32) (size!992 (buf!1323 (_2!2189 lt!64071)))) ((_ sign_extend 32) (currentByte!2787 (_2!2189 lt!64071))) ((_ sign_extend 32) (currentBit!2782 (_2!2189 lt!64071))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!12370 res!36345) b!42736))

(declare-fun m!64823 () Bool)

(assert (=> d!12370 m!64823))

(assert (=> b!42736 m!64699))

(assert (=> b!42665 d!12370))

(declare-fun b!42779 () Bool)

(declare-fun res!36391 () Bool)

(declare-fun e!28596 () Bool)

(assert (=> b!42779 (=> (not res!36391) (not e!28596))))

(declare-fun lt!64210 () (_ BitVec 64))

(declare-fun lt!64205 () (_ BitVec 64))

(declare-fun lt!64203 () tuple2!4192)

(assert (=> b!42779 (= res!36391 (= (bitIndex!0 (size!992 (buf!1323 (_2!2189 lt!64203))) (currentByte!2787 (_2!2189 lt!64203)) (currentBit!2782 (_2!2189 lt!64203))) (bvadd lt!64205 lt!64210)))))

(assert (=> b!42779 (or (not (= (bvand lt!64205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!64210 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!64205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!64205 lt!64210) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42779 (= lt!64210 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!42779 (= lt!64205 (bitIndex!0 (size!992 (buf!1323 thiss!1379)) (currentByte!2787 thiss!1379) (currentBit!2782 thiss!1379)))))

(declare-fun b!42780 () Bool)

(declare-fun e!28593 () Bool)

(assert (=> b!42780 (= e!28596 e!28593)))

(declare-fun res!36386 () Bool)

(assert (=> b!42780 (=> (not res!36386) (not e!28593))))

(declare-datatypes ((tuple2!4202 0))(
  ( (tuple2!4203 (_1!2194 BitStream!1728) (_2!2194 Bool)) )
))
(declare-fun lt!64202 () tuple2!4202)

(declare-fun lt!64199 () (_ BitVec 8))

(assert (=> b!42780 (= res!36386 (and (= (_2!2194 lt!64202) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1491 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!64199)) #b00000000000000000000000000000000))) (= (_1!2194 lt!64202) (_2!2189 lt!64203))))))

(declare-datatypes ((tuple2!4204 0))(
  ( (tuple2!4205 (_1!2195 array!2194) (_2!2195 BitStream!1728)) )
))
(declare-fun lt!64200 () tuple2!4204)

(declare-fun lt!64209 () BitStream!1728)

(declare-fun readBits!0 (BitStream!1728 (_ BitVec 64)) tuple2!4204)

(assert (=> b!42780 (= lt!64200 (readBits!0 lt!64209 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1728) tuple2!4202)

(assert (=> b!42780 (= lt!64202 (readBitPure!0 lt!64209))))

(declare-fun readerFrom!0 (BitStream!1728 (_ BitVec 32) (_ BitVec 32)) BitStream!1728)

(assert (=> b!42780 (= lt!64209 (readerFrom!0 (_2!2189 lt!64203) (currentBit!2782 thiss!1379) (currentByte!2787 thiss!1379)))))

(declare-fun d!12374 () Bool)

(assert (=> d!12374 e!28596))

(declare-fun res!36389 () Bool)

(assert (=> d!12374 (=> (not res!36389) (not e!28596))))

(assert (=> d!12374 (= res!36389 (= (size!992 (buf!1323 (_2!2189 lt!64203))) (size!992 (buf!1323 thiss!1379))))))

(declare-fun lt!64206 () array!2194)

(assert (=> d!12374 (= lt!64199 (select (arr!1491 lt!64206) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!12374 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!992 lt!64206)))))

(assert (=> d!12374 (= lt!64206 (array!2195 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!64207 () tuple2!4192)

(assert (=> d!12374 (= lt!64203 (tuple2!4193 (_1!2189 lt!64207) (_2!2189 lt!64207)))))

(declare-fun lt!64204 () tuple2!4192)

(assert (=> d!12374 (= lt!64207 lt!64204)))

(declare-fun e!28595 () Bool)

(assert (=> d!12374 e!28595))

(declare-fun res!36388 () Bool)

(assert (=> d!12374 (=> (not res!36388) (not e!28595))))

(assert (=> d!12374 (= res!36388 (= (size!992 (buf!1323 thiss!1379)) (size!992 (buf!1323 (_2!2189 lt!64204)))))))

(declare-fun lt!64208 () Bool)

(declare-fun appendBit!0 (BitStream!1728 Bool) tuple2!4192)

(assert (=> d!12374 (= lt!64204 (appendBit!0 thiss!1379 lt!64208))))

(assert (=> d!12374 (= lt!64208 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1491 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!12374 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!12374 (= (appendBitFromByte!0 thiss!1379 (select (arr!1491 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!64203)))

(declare-fun b!42781 () Bool)

(declare-fun res!36390 () Bool)

(assert (=> b!42781 (=> (not res!36390) (not e!28596))))

(assert (=> b!42781 (= res!36390 (isPrefixOf!0 thiss!1379 (_2!2189 lt!64203)))))

(declare-fun b!42782 () Bool)

(declare-fun e!28594 () Bool)

(assert (=> b!42782 (= e!28595 e!28594)))

(declare-fun res!36387 () Bool)

(assert (=> b!42782 (=> (not res!36387) (not e!28594))))

(declare-fun lt!64201 () tuple2!4202)

(assert (=> b!42782 (= res!36387 (and (= (_2!2194 lt!64201) lt!64208) (= (_1!2194 lt!64201) (_2!2189 lt!64204))))))

(assert (=> b!42782 (= lt!64201 (readBitPure!0 (readerFrom!0 (_2!2189 lt!64204) (currentBit!2782 thiss!1379) (currentByte!2787 thiss!1379))))))

(declare-fun b!42783 () Bool)

(declare-fun res!36393 () Bool)

(assert (=> b!42783 (=> (not res!36393) (not e!28595))))

(assert (=> b!42783 (= res!36393 (isPrefixOf!0 thiss!1379 (_2!2189 lt!64204)))))

(declare-fun b!42784 () Bool)

(assert (=> b!42784 (= e!28593 (= (bitIndex!0 (size!992 (buf!1323 (_1!2194 lt!64202))) (currentByte!2787 (_1!2194 lt!64202)) (currentBit!2782 (_1!2194 lt!64202))) (bitIndex!0 (size!992 (buf!1323 (_2!2189 lt!64203))) (currentByte!2787 (_2!2189 lt!64203)) (currentBit!2782 (_2!2189 lt!64203)))))))

(declare-fun b!42785 () Bool)

(assert (=> b!42785 (= e!28594 (= (bitIndex!0 (size!992 (buf!1323 (_1!2194 lt!64201))) (currentByte!2787 (_1!2194 lt!64201)) (currentBit!2782 (_1!2194 lt!64201))) (bitIndex!0 (size!992 (buf!1323 (_2!2189 lt!64204))) (currentByte!2787 (_2!2189 lt!64204)) (currentBit!2782 (_2!2189 lt!64204)))))))

(declare-fun b!42786 () Bool)

(declare-fun res!36392 () Bool)

(assert (=> b!42786 (=> (not res!36392) (not e!28595))))

(assert (=> b!42786 (= res!36392 (= (bitIndex!0 (size!992 (buf!1323 (_2!2189 lt!64204))) (currentByte!2787 (_2!2189 lt!64204)) (currentBit!2782 (_2!2189 lt!64204))) (bvadd (bitIndex!0 (size!992 (buf!1323 thiss!1379)) (currentByte!2787 thiss!1379) (currentBit!2782 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!12374 res!36388) b!42786))

(assert (= (and b!42786 res!36392) b!42783))

(assert (= (and b!42783 res!36393) b!42782))

(assert (= (and b!42782 res!36387) b!42785))

(assert (= (and d!12374 res!36389) b!42779))

(assert (= (and b!42779 res!36391) b!42781))

(assert (= (and b!42781 res!36390) b!42780))

(assert (= (and b!42780 res!36386) b!42784))

(declare-fun m!64853 () Bool)

(assert (=> b!42785 m!64853))

(declare-fun m!64855 () Bool)

(assert (=> b!42785 m!64855))

(declare-fun m!64857 () Bool)

(assert (=> b!42782 m!64857))

(assert (=> b!42782 m!64857))

(declare-fun m!64859 () Bool)

(assert (=> b!42782 m!64859))

(declare-fun m!64861 () Bool)

(assert (=> b!42781 m!64861))

(declare-fun m!64863 () Bool)

(assert (=> b!42780 m!64863))

(declare-fun m!64865 () Bool)

(assert (=> b!42780 m!64865))

(declare-fun m!64867 () Bool)

(assert (=> b!42780 m!64867))

(assert (=> b!42786 m!64855))

(assert (=> b!42786 m!64719))

(declare-fun m!64869 () Bool)

(assert (=> b!42779 m!64869))

(assert (=> b!42779 m!64719))

(declare-fun m!64871 () Bool)

(assert (=> d!12374 m!64871))

(declare-fun m!64873 () Bool)

(assert (=> d!12374 m!64873))

(assert (=> d!12374 m!64797))

(declare-fun m!64875 () Bool)

(assert (=> b!42783 m!64875))

(declare-fun m!64877 () Bool)

(assert (=> b!42784 m!64877))

(assert (=> b!42784 m!64869))

(assert (=> b!42665 d!12374))

(declare-fun d!12380 () Bool)

(assert (=> d!12380 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!992 (buf!1323 thiss!1379))) ((_ sign_extend 32) (currentByte!2787 thiss!1379)) ((_ sign_extend 32) (currentBit!2782 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!992 (buf!1323 thiss!1379))) ((_ sign_extend 32) (currentByte!2787 thiss!1379)) ((_ sign_extend 32) (currentBit!2782 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3339 () Bool)

(assert (= bs!3339 d!12380))

(assert (=> bs!3339 m!64793))

(assert (=> b!42667 d!12380))

(declare-fun d!12382 () Bool)

(assert (=> d!12382 (validate_offset_bits!1 ((_ sign_extend 32) (size!992 (buf!1323 (_2!2189 lt!64071)))) ((_ sign_extend 32) (currentByte!2787 thiss!1379)) ((_ sign_extend 32) (currentBit!2782 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!64213 () Unit!3038)

(declare-fun choose!9 (BitStream!1728 array!2194 (_ BitVec 64) BitStream!1728) Unit!3038)

(assert (=> d!12382 (= lt!64213 (choose!9 thiss!1379 (buf!1323 (_2!2189 lt!64071)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1729 (buf!1323 (_2!2189 lt!64071)) (currentByte!2787 thiss!1379) (currentBit!2782 thiss!1379))))))

(assert (=> d!12382 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1323 (_2!2189 lt!64071)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!64213)))

(declare-fun bs!3340 () Bool)

(assert (= bs!3340 d!12382))

(assert (=> bs!3340 m!64723))

(declare-fun m!64879 () Bool)

(assert (=> bs!3340 m!64879))

(assert (=> b!42666 d!12382))

(declare-fun d!12384 () Bool)

(declare-fun res!36394 () Bool)

(declare-fun e!28598 () Bool)

(assert (=> d!12384 (=> (not res!36394) (not e!28598))))

(assert (=> d!12384 (= res!36394 (= (size!992 (buf!1323 thiss!1379)) (size!992 (buf!1323 (_2!2189 lt!64075)))))))

(assert (=> d!12384 (= (isPrefixOf!0 thiss!1379 (_2!2189 lt!64075)) e!28598)))

(declare-fun b!42787 () Bool)

(declare-fun res!36396 () Bool)

(assert (=> b!42787 (=> (not res!36396) (not e!28598))))

(assert (=> b!42787 (= res!36396 (bvsle (bitIndex!0 (size!992 (buf!1323 thiss!1379)) (currentByte!2787 thiss!1379) (currentBit!2782 thiss!1379)) (bitIndex!0 (size!992 (buf!1323 (_2!2189 lt!64075))) (currentByte!2787 (_2!2189 lt!64075)) (currentBit!2782 (_2!2189 lt!64075)))))))

(declare-fun b!42788 () Bool)

(declare-fun e!28597 () Bool)

(assert (=> b!42788 (= e!28598 e!28597)))

(declare-fun res!36395 () Bool)

(assert (=> b!42788 (=> res!36395 e!28597)))

(assert (=> b!42788 (= res!36395 (= (size!992 (buf!1323 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!42789 () Bool)

(assert (=> b!42789 (= e!28597 (arrayBitRangesEq!0 (buf!1323 thiss!1379) (buf!1323 (_2!2189 lt!64075)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!992 (buf!1323 thiss!1379)) (currentByte!2787 thiss!1379) (currentBit!2782 thiss!1379))))))

(assert (= (and d!12384 res!36394) b!42787))

(assert (= (and b!42787 res!36396) b!42788))

(assert (= (and b!42788 (not res!36395)) b!42789))

(assert (=> b!42787 m!64719))

(declare-fun m!64881 () Bool)

(assert (=> b!42787 m!64881))

(assert (=> b!42789 m!64719))

(assert (=> b!42789 m!64719))

(declare-fun m!64883 () Bool)

(assert (=> b!42789 m!64883))

(assert (=> b!42666 d!12384))

(declare-fun b!42800 () Bool)

(declare-fun res!36405 () Bool)

(declare-fun e!28603 () Bool)

(assert (=> b!42800 (=> (not res!36405) (not e!28603))))

(declare-fun lt!64258 () tuple2!4190)

(assert (=> b!42800 (= res!36405 (isPrefixOf!0 (_2!2188 lt!64258) (_2!2189 lt!64071)))))

(declare-fun b!42801 () Bool)

(declare-fun e!28604 () Unit!3038)

(declare-fun lt!64257 () Unit!3038)

(assert (=> b!42801 (= e!28604 lt!64257)))

(declare-fun lt!64255 () (_ BitVec 64))

(assert (=> b!42801 (= lt!64255 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64269 () (_ BitVec 64))

(assert (=> b!42801 (= lt!64269 (bitIndex!0 (size!992 (buf!1323 thiss!1379)) (currentByte!2787 thiss!1379) (currentBit!2782 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2194 array!2194 (_ BitVec 64) (_ BitVec 64)) Unit!3038)

(assert (=> b!42801 (= lt!64257 (arrayBitRangesEqSymmetric!0 (buf!1323 thiss!1379) (buf!1323 (_2!2189 lt!64071)) lt!64255 lt!64269))))

(assert (=> b!42801 (arrayBitRangesEq!0 (buf!1323 (_2!2189 lt!64071)) (buf!1323 thiss!1379) lt!64255 lt!64269)))

(declare-fun b!42802 () Bool)

(declare-fun res!36404 () Bool)

(assert (=> b!42802 (=> (not res!36404) (not e!28603))))

(assert (=> b!42802 (= res!36404 (isPrefixOf!0 (_1!2188 lt!64258) thiss!1379))))

(declare-fun b!42804 () Bool)

(declare-fun lt!64256 () (_ BitVec 64))

(declare-fun lt!64260 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1728 (_ BitVec 64)) BitStream!1728)

(assert (=> b!42804 (= e!28603 (= (_1!2188 lt!64258) (withMovedBitIndex!0 (_2!2188 lt!64258) (bvsub lt!64256 lt!64260))))))

(assert (=> b!42804 (or (= (bvand lt!64256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!64260 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!64256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!64256 lt!64260) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42804 (= lt!64260 (bitIndex!0 (size!992 (buf!1323 (_2!2189 lt!64071))) (currentByte!2787 (_2!2189 lt!64071)) (currentBit!2782 (_2!2189 lt!64071))))))

(assert (=> b!42804 (= lt!64256 (bitIndex!0 (size!992 (buf!1323 thiss!1379)) (currentByte!2787 thiss!1379) (currentBit!2782 thiss!1379)))))

(declare-fun b!42803 () Bool)

(declare-fun Unit!3042 () Unit!3038)

(assert (=> b!42803 (= e!28604 Unit!3042)))

(declare-fun d!12386 () Bool)

(assert (=> d!12386 e!28603))

(declare-fun res!36403 () Bool)

(assert (=> d!12386 (=> (not res!36403) (not e!28603))))

(assert (=> d!12386 (= res!36403 (isPrefixOf!0 (_1!2188 lt!64258) (_2!2188 lt!64258)))))

(declare-fun lt!64268 () BitStream!1728)

(assert (=> d!12386 (= lt!64258 (tuple2!4191 lt!64268 (_2!2189 lt!64071)))))

(declare-fun lt!64273 () Unit!3038)

(declare-fun lt!64264 () Unit!3038)

(assert (=> d!12386 (= lt!64273 lt!64264)))

(assert (=> d!12386 (isPrefixOf!0 lt!64268 (_2!2189 lt!64071))))

(assert (=> d!12386 (= lt!64264 (lemmaIsPrefixTransitive!0 lt!64268 (_2!2189 lt!64071) (_2!2189 lt!64071)))))

(declare-fun lt!64270 () Unit!3038)

(declare-fun lt!64267 () Unit!3038)

(assert (=> d!12386 (= lt!64270 lt!64267)))

(assert (=> d!12386 (isPrefixOf!0 lt!64268 (_2!2189 lt!64071))))

(assert (=> d!12386 (= lt!64267 (lemmaIsPrefixTransitive!0 lt!64268 thiss!1379 (_2!2189 lt!64071)))))

(declare-fun lt!64265 () Unit!3038)

(assert (=> d!12386 (= lt!64265 e!28604)))

(declare-fun c!2790 () Bool)

(assert (=> d!12386 (= c!2790 (not (= (size!992 (buf!1323 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!64271 () Unit!3038)

(declare-fun lt!64266 () Unit!3038)

(assert (=> d!12386 (= lt!64271 lt!64266)))

(assert (=> d!12386 (isPrefixOf!0 (_2!2189 lt!64071) (_2!2189 lt!64071))))

(assert (=> d!12386 (= lt!64266 (lemmaIsPrefixRefl!0 (_2!2189 lt!64071)))))

(declare-fun lt!64263 () Unit!3038)

(declare-fun lt!64262 () Unit!3038)

(assert (=> d!12386 (= lt!64263 lt!64262)))

(assert (=> d!12386 (= lt!64262 (lemmaIsPrefixRefl!0 (_2!2189 lt!64071)))))

(declare-fun lt!64254 () Unit!3038)

(declare-fun lt!64272 () Unit!3038)

(assert (=> d!12386 (= lt!64254 lt!64272)))

(assert (=> d!12386 (isPrefixOf!0 lt!64268 lt!64268)))

(assert (=> d!12386 (= lt!64272 (lemmaIsPrefixRefl!0 lt!64268))))

(declare-fun lt!64261 () Unit!3038)

(declare-fun lt!64259 () Unit!3038)

(assert (=> d!12386 (= lt!64261 lt!64259)))

(assert (=> d!12386 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12386 (= lt!64259 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12386 (= lt!64268 (BitStream!1729 (buf!1323 (_2!2189 lt!64071)) (currentByte!2787 thiss!1379) (currentBit!2782 thiss!1379)))))

(assert (=> d!12386 (isPrefixOf!0 thiss!1379 (_2!2189 lt!64071))))

(assert (=> d!12386 (= (reader!0 thiss!1379 (_2!2189 lt!64071)) lt!64258)))

(assert (= (and d!12386 c!2790) b!42801))

(assert (= (and d!12386 (not c!2790)) b!42803))

(assert (= (and d!12386 res!36403) b!42802))

(assert (= (and b!42802 res!36404) b!42800))

(assert (= (and b!42800 res!36405) b!42804))

(declare-fun m!64885 () Bool)

(assert (=> b!42804 m!64885))

(assert (=> b!42804 m!64815))

(assert (=> b!42804 m!64719))

(assert (=> b!42801 m!64719))

(declare-fun m!64887 () Bool)

(assert (=> b!42801 m!64887))

(declare-fun m!64889 () Bool)

(assert (=> b!42801 m!64889))

(declare-fun m!64891 () Bool)

(assert (=> b!42800 m!64891))

(declare-fun m!64893 () Bool)

(assert (=> d!12386 m!64893))

(declare-fun m!64895 () Bool)

(assert (=> d!12386 m!64895))

(assert (=> d!12386 m!64717))

(assert (=> d!12386 m!64715))

(declare-fun m!64897 () Bool)

(assert (=> d!12386 m!64897))

(declare-fun m!64899 () Bool)

(assert (=> d!12386 m!64899))

(assert (=> d!12386 m!64705))

(declare-fun m!64901 () Bool)

(assert (=> d!12386 m!64901))

(declare-fun m!64903 () Bool)

(assert (=> d!12386 m!64903))

(declare-fun m!64905 () Bool)

(assert (=> d!12386 m!64905))

(declare-fun m!64907 () Bool)

(assert (=> d!12386 m!64907))

(declare-fun m!64909 () Bool)

(assert (=> b!42802 m!64909))

(assert (=> b!42666 d!12386))

(declare-fun d!12388 () Bool)

(assert (=> d!12388 (isPrefixOf!0 thiss!1379 (_2!2189 lt!64075))))

(declare-fun lt!64276 () Unit!3038)

(declare-fun choose!30 (BitStream!1728 BitStream!1728 BitStream!1728) Unit!3038)

(assert (=> d!12388 (= lt!64276 (choose!30 thiss!1379 (_2!2189 lt!64071) (_2!2189 lt!64075)))))

(assert (=> d!12388 (isPrefixOf!0 thiss!1379 (_2!2189 lt!64071))))

(assert (=> d!12388 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2189 lt!64071) (_2!2189 lt!64075)) lt!64276)))

(declare-fun bs!3341 () Bool)

(assert (= bs!3341 d!12388))

(assert (=> bs!3341 m!64725))

(declare-fun m!64911 () Bool)

(assert (=> bs!3341 m!64911))

(assert (=> bs!3341 m!64705))

(assert (=> b!42666 d!12388))

(declare-fun call!496 () tuple2!4190)

(declare-fun bm!493 () Bool)

(declare-fun lt!64533 () tuple2!4192)

(declare-fun c!2796 () Bool)

(assert (=> bm!493 (= call!496 (reader!0 (_2!2189 lt!64071) (ite c!2796 (_2!2189 lt!64533) (_2!2189 lt!64071))))))

(declare-fun b!42845 () Bool)

(declare-fun e!28620 () tuple2!4192)

(declare-fun Unit!3043 () Unit!3038)

(assert (=> b!42845 (= e!28620 (tuple2!4193 Unit!3043 (_2!2189 lt!64071)))))

(assert (=> b!42845 (= (size!992 (buf!1323 (_2!2189 lt!64071))) (size!992 (buf!1323 (_2!2189 lt!64071))))))

(declare-fun lt!64525 () Unit!3038)

(declare-fun Unit!3044 () Unit!3038)

(assert (=> b!42845 (= lt!64525 Unit!3044)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1728 array!2194 array!2194 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42845 (checkByteArrayBitContent!0 (_2!2189 lt!64071) srcBuffer!2 (_1!2195 (readBits!0 (_1!2188 call!496) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!42846 () Bool)

(declare-fun lt!64524 () tuple2!4192)

(declare-fun Unit!3045 () Unit!3038)

(assert (=> b!42846 (= e!28620 (tuple2!4193 Unit!3045 (_2!2189 lt!64524)))))

(assert (=> b!42846 (= lt!64533 (appendBitFromByte!0 (_2!2189 lt!64071) (select (arr!1491 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!64527 () (_ BitVec 64))

(assert (=> b!42846 (= lt!64527 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!64545 () (_ BitVec 64))

(assert (=> b!42846 (= lt!64545 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!64512 () Unit!3038)

(assert (=> b!42846 (= lt!64512 (validateOffsetBitsIneqLemma!0 (_2!2189 lt!64071) (_2!2189 lt!64533) lt!64527 lt!64545))))

(assert (=> b!42846 (validate_offset_bits!1 ((_ sign_extend 32) (size!992 (buf!1323 (_2!2189 lt!64533)))) ((_ sign_extend 32) (currentByte!2787 (_2!2189 lt!64533))) ((_ sign_extend 32) (currentBit!2782 (_2!2189 lt!64533))) (bvsub lt!64527 lt!64545))))

(declare-fun lt!64518 () Unit!3038)

(assert (=> b!42846 (= lt!64518 lt!64512)))

(declare-fun lt!64513 () tuple2!4190)

(assert (=> b!42846 (= lt!64513 call!496)))

(declare-fun lt!64517 () (_ BitVec 64))

(assert (=> b!42846 (= lt!64517 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!64510 () Unit!3038)

(assert (=> b!42846 (= lt!64510 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2189 lt!64071) (buf!1323 (_2!2189 lt!64533)) lt!64517))))

(assert (=> b!42846 (validate_offset_bits!1 ((_ sign_extend 32) (size!992 (buf!1323 (_2!2189 lt!64533)))) ((_ sign_extend 32) (currentByte!2787 (_2!2189 lt!64071))) ((_ sign_extend 32) (currentBit!2782 (_2!2189 lt!64071))) lt!64517)))

(declare-fun lt!64526 () Unit!3038)

(assert (=> b!42846 (= lt!64526 lt!64510)))

(assert (=> b!42846 (= (head!324 (byteArrayBitContentToList!0 (_2!2189 lt!64533) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!324 (bitStreamReadBitsIntoList!0 (_2!2189 lt!64533) (_1!2188 lt!64513) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!64540 () Unit!3038)

(declare-fun Unit!3046 () Unit!3038)

(assert (=> b!42846 (= lt!64540 Unit!3046)))

(assert (=> b!42846 (= lt!64524 (appendBitsMSBFirstLoop!0 (_2!2189 lt!64533) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!64504 () Unit!3038)

(assert (=> b!42846 (= lt!64504 (lemmaIsPrefixTransitive!0 (_2!2189 lt!64071) (_2!2189 lt!64533) (_2!2189 lt!64524)))))

(assert (=> b!42846 (isPrefixOf!0 (_2!2189 lt!64071) (_2!2189 lt!64524))))

(declare-fun lt!64508 () Unit!3038)

(assert (=> b!42846 (= lt!64508 lt!64504)))

(assert (=> b!42846 (= (size!992 (buf!1323 (_2!2189 lt!64524))) (size!992 (buf!1323 (_2!2189 lt!64071))))))

(declare-fun lt!64507 () Unit!3038)

(declare-fun Unit!3047 () Unit!3038)

(assert (=> b!42846 (= lt!64507 Unit!3047)))

(assert (=> b!42846 (= (bitIndex!0 (size!992 (buf!1323 (_2!2189 lt!64524))) (currentByte!2787 (_2!2189 lt!64524)) (currentBit!2782 (_2!2189 lt!64524))) (bvsub (bvadd (bitIndex!0 (size!992 (buf!1323 (_2!2189 lt!64071))) (currentByte!2787 (_2!2189 lt!64071)) (currentBit!2782 (_2!2189 lt!64071))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!64505 () Unit!3038)

(declare-fun Unit!3048 () Unit!3038)

(assert (=> b!42846 (= lt!64505 Unit!3048)))

(assert (=> b!42846 (= (bitIndex!0 (size!992 (buf!1323 (_2!2189 lt!64524))) (currentByte!2787 (_2!2189 lt!64524)) (currentBit!2782 (_2!2189 lt!64524))) (bvsub (bvsub (bvadd (bitIndex!0 (size!992 (buf!1323 (_2!2189 lt!64533))) (currentByte!2787 (_2!2189 lt!64533)) (currentBit!2782 (_2!2189 lt!64533))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!64543 () Unit!3038)

(declare-fun Unit!3050 () Unit!3038)

(assert (=> b!42846 (= lt!64543 Unit!3050)))

(declare-fun lt!64534 () tuple2!4190)

(assert (=> b!42846 (= lt!64534 (reader!0 (_2!2189 lt!64071) (_2!2189 lt!64524)))))

(declare-fun lt!64506 () (_ BitVec 64))

(assert (=> b!42846 (= lt!64506 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!64532 () Unit!3038)

(assert (=> b!42846 (= lt!64532 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2189 lt!64071) (buf!1323 (_2!2189 lt!64524)) lt!64506))))

(assert (=> b!42846 (validate_offset_bits!1 ((_ sign_extend 32) (size!992 (buf!1323 (_2!2189 lt!64524)))) ((_ sign_extend 32) (currentByte!2787 (_2!2189 lt!64071))) ((_ sign_extend 32) (currentBit!2782 (_2!2189 lt!64071))) lt!64506)))

(declare-fun lt!64514 () Unit!3038)

(assert (=> b!42846 (= lt!64514 lt!64532)))

(declare-fun lt!64516 () tuple2!4190)

(assert (=> b!42846 (= lt!64516 (reader!0 (_2!2189 lt!64533) (_2!2189 lt!64524)))))

(declare-fun lt!64523 () (_ BitVec 64))

(assert (=> b!42846 (= lt!64523 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!64542 () Unit!3038)

(assert (=> b!42846 (= lt!64542 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2189 lt!64533) (buf!1323 (_2!2189 lt!64524)) lt!64523))))

(assert (=> b!42846 (validate_offset_bits!1 ((_ sign_extend 32) (size!992 (buf!1323 (_2!2189 lt!64524)))) ((_ sign_extend 32) (currentByte!2787 (_2!2189 lt!64533))) ((_ sign_extend 32) (currentBit!2782 (_2!2189 lt!64533))) lt!64523)))

(declare-fun lt!64535 () Unit!3038)

(assert (=> b!42846 (= lt!64535 lt!64542)))

(declare-fun lt!64521 () List!505)

(assert (=> b!42846 (= lt!64521 (byteArrayBitContentToList!0 (_2!2189 lt!64524) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!64546 () List!505)

(assert (=> b!42846 (= lt!64546 (byteArrayBitContentToList!0 (_2!2189 lt!64524) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!64529 () List!505)

(assert (=> b!42846 (= lt!64529 (bitStreamReadBitsIntoList!0 (_2!2189 lt!64524) (_1!2188 lt!64534) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!64511 () List!505)

(assert (=> b!42846 (= lt!64511 (bitStreamReadBitsIntoList!0 (_2!2189 lt!64524) (_1!2188 lt!64516) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!64538 () (_ BitVec 64))

(assert (=> b!42846 (= lt!64538 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!64503 () Unit!3038)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1728 BitStream!1728 BitStream!1728 BitStream!1728 (_ BitVec 64) List!505) Unit!3038)

(assert (=> b!42846 (= lt!64503 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2189 lt!64524) (_2!2189 lt!64524) (_1!2188 lt!64534) (_1!2188 lt!64516) lt!64538 lt!64529))))

(declare-fun tail!203 (List!505) List!505)

(assert (=> b!42846 (= (bitStreamReadBitsIntoList!0 (_2!2189 lt!64524) (_1!2188 lt!64516) (bvsub lt!64538 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!203 lt!64529))))

(declare-fun lt!64539 () Unit!3038)

(assert (=> b!42846 (= lt!64539 lt!64503)))

(declare-fun lt!64515 () (_ BitVec 64))

(declare-fun lt!64530 () Unit!3038)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2194 array!2194 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3038)

(assert (=> b!42846 (= lt!64530 (arrayBitRangesEqImpliesEq!0 (buf!1323 (_2!2189 lt!64533)) (buf!1323 (_2!2189 lt!64524)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!64515 (bitIndex!0 (size!992 (buf!1323 (_2!2189 lt!64533))) (currentByte!2787 (_2!2189 lt!64533)) (currentBit!2782 (_2!2189 lt!64533)))))))

(declare-fun bitAt!0 (array!2194 (_ BitVec 64)) Bool)

(assert (=> b!42846 (= (bitAt!0 (buf!1323 (_2!2189 lt!64533)) lt!64515) (bitAt!0 (buf!1323 (_2!2189 lt!64524)) lt!64515))))

(declare-fun lt!64528 () Unit!3038)

(assert (=> b!42846 (= lt!64528 lt!64530)))

(declare-fun b!42847 () Bool)

(declare-fun res!36436 () Bool)

(declare-fun e!28622 () Bool)

(assert (=> b!42847 (=> (not res!36436) (not e!28622))))

(declare-fun lt!64537 () tuple2!4192)

(assert (=> b!42847 (= res!36436 (= (size!992 (buf!1323 (_2!2189 lt!64537))) (size!992 (buf!1323 (_2!2189 lt!64071)))))))

(declare-fun d!12390 () Bool)

(assert (=> d!12390 e!28622))

(declare-fun res!36438 () Bool)

(assert (=> d!12390 (=> (not res!36438) (not e!28622))))

(declare-fun lt!64522 () (_ BitVec 64))

(assert (=> d!12390 (= res!36438 (= (bitIndex!0 (size!992 (buf!1323 (_2!2189 lt!64537))) (currentByte!2787 (_2!2189 lt!64537)) (currentBit!2782 (_2!2189 lt!64537))) (bvsub lt!64522 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!12390 (or (= (bvand lt!64522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!64522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!64522 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!64519 () (_ BitVec 64))

(assert (=> d!12390 (= lt!64522 (bvadd lt!64519 to!314))))

(assert (=> d!12390 (or (not (= (bvand lt!64519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!64519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!64519 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12390 (= lt!64519 (bitIndex!0 (size!992 (buf!1323 (_2!2189 lt!64071))) (currentByte!2787 (_2!2189 lt!64071)) (currentBit!2782 (_2!2189 lt!64071))))))

(assert (=> d!12390 (= lt!64537 e!28620)))

(assert (=> d!12390 (= c!2796 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!64509 () Unit!3038)

(declare-fun lt!64531 () Unit!3038)

(assert (=> d!12390 (= lt!64509 lt!64531)))

(assert (=> d!12390 (isPrefixOf!0 (_2!2189 lt!64071) (_2!2189 lt!64071))))

(assert (=> d!12390 (= lt!64531 (lemmaIsPrefixRefl!0 (_2!2189 lt!64071)))))

(assert (=> d!12390 (= lt!64515 (bitIndex!0 (size!992 (buf!1323 (_2!2189 lt!64071))) (currentByte!2787 (_2!2189 lt!64071)) (currentBit!2782 (_2!2189 lt!64071))))))

(assert (=> d!12390 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12390 (= (appendBitsMSBFirstLoop!0 (_2!2189 lt!64071) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!64537)))

(declare-fun b!42848 () Bool)

(declare-fun res!36439 () Bool)

(assert (=> b!42848 (=> (not res!36439) (not e!28622))))

(assert (=> b!42848 (= res!36439 (invariant!0 (currentBit!2782 (_2!2189 lt!64537)) (currentByte!2787 (_2!2189 lt!64537)) (size!992 (buf!1323 (_2!2189 lt!64537)))))))

(declare-fun b!42849 () Bool)

(declare-fun res!36441 () Bool)

(assert (=> b!42849 (=> (not res!36441) (not e!28622))))

(assert (=> b!42849 (= res!36441 (= (size!992 (buf!1323 (_2!2189 lt!64071))) (size!992 (buf!1323 (_2!2189 lt!64537)))))))

(declare-fun b!42850 () Bool)

(declare-fun e!28621 () Bool)

(declare-fun lt!64520 () (_ BitVec 64))

(assert (=> b!42850 (= e!28621 (validate_offset_bits!1 ((_ sign_extend 32) (size!992 (buf!1323 (_2!2189 lt!64071)))) ((_ sign_extend 32) (currentByte!2787 (_2!2189 lt!64071))) ((_ sign_extend 32) (currentBit!2782 (_2!2189 lt!64071))) lt!64520))))

(declare-fun b!42851 () Bool)

(declare-fun lt!64541 () tuple2!4190)

(assert (=> b!42851 (= e!28622 (= (bitStreamReadBitsIntoList!0 (_2!2189 lt!64537) (_1!2188 lt!64541) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2189 lt!64537) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!42851 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42851 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!64536 () Unit!3038)

(declare-fun lt!64544 () Unit!3038)

(assert (=> b!42851 (= lt!64536 lt!64544)))

(assert (=> b!42851 (validate_offset_bits!1 ((_ sign_extend 32) (size!992 (buf!1323 (_2!2189 lt!64537)))) ((_ sign_extend 32) (currentByte!2787 (_2!2189 lt!64071))) ((_ sign_extend 32) (currentBit!2782 (_2!2189 lt!64071))) lt!64520)))

(assert (=> b!42851 (= lt!64544 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2189 lt!64071) (buf!1323 (_2!2189 lt!64537)) lt!64520))))

(assert (=> b!42851 e!28621))

(declare-fun res!36440 () Bool)

(assert (=> b!42851 (=> (not res!36440) (not e!28621))))

(assert (=> b!42851 (= res!36440 (and (= (size!992 (buf!1323 (_2!2189 lt!64071))) (size!992 (buf!1323 (_2!2189 lt!64537)))) (bvsge lt!64520 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42851 (= lt!64520 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!42851 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42851 (= lt!64541 (reader!0 (_2!2189 lt!64071) (_2!2189 lt!64537)))))

(declare-fun b!42852 () Bool)

(declare-fun res!36437 () Bool)

(assert (=> b!42852 (=> (not res!36437) (not e!28622))))

(assert (=> b!42852 (= res!36437 (isPrefixOf!0 (_2!2189 lt!64071) (_2!2189 lt!64537)))))

(assert (= (and d!12390 c!2796) b!42846))

(assert (= (and d!12390 (not c!2796)) b!42845))

(assert (= (or b!42846 b!42845) bm!493))

(assert (= (and d!12390 res!36438) b!42848))

(assert (= (and b!42848 res!36439) b!42849))

(assert (= (and b!42849 res!36441) b!42852))

(assert (= (and b!42852 res!36437) b!42847))

(assert (= (and b!42847 res!36436) b!42851))

(assert (= (and b!42851 res!36440) b!42850))

(declare-fun m!65007 () Bool)

(assert (=> b!42846 m!65007))

(declare-fun m!65009 () Bool)

(assert (=> b!42846 m!65009))

(declare-fun m!65011 () Bool)

(assert (=> b!42846 m!65011))

(declare-fun m!65013 () Bool)

(assert (=> b!42846 m!65013))

(declare-fun m!65015 () Bool)

(assert (=> b!42846 m!65015))

(declare-fun m!65017 () Bool)

(assert (=> b!42846 m!65017))

(declare-fun m!65019 () Bool)

(assert (=> b!42846 m!65019))

(declare-fun m!65021 () Bool)

(assert (=> b!42846 m!65021))

(declare-fun m!65023 () Bool)

(assert (=> b!42846 m!65023))

(declare-fun m!65025 () Bool)

(assert (=> b!42846 m!65025))

(declare-fun m!65027 () Bool)

(assert (=> b!42846 m!65027))

(declare-fun m!65029 () Bool)

(assert (=> b!42846 m!65029))

(declare-fun m!65031 () Bool)

(assert (=> b!42846 m!65031))

(declare-fun m!65033 () Bool)

(assert (=> b!42846 m!65033))

(declare-fun m!65035 () Bool)

(assert (=> b!42846 m!65035))

(declare-fun m!65037 () Bool)

(assert (=> b!42846 m!65037))

(declare-fun m!65039 () Bool)

(assert (=> b!42846 m!65039))

(declare-fun m!65041 () Bool)

(assert (=> b!42846 m!65041))

(declare-fun m!65043 () Bool)

(assert (=> b!42846 m!65043))

(declare-fun m!65045 () Bool)

(assert (=> b!42846 m!65045))

(assert (=> b!42846 m!65009))

(declare-fun m!65047 () Bool)

(assert (=> b!42846 m!65047))

(declare-fun m!65049 () Bool)

(assert (=> b!42846 m!65049))

(declare-fun m!65051 () Bool)

(assert (=> b!42846 m!65051))

(declare-fun m!65053 () Bool)

(assert (=> b!42846 m!65053))

(assert (=> b!42846 m!65025))

(declare-fun m!65055 () Bool)

(assert (=> b!42846 m!65055))

(assert (=> b!42846 m!65019))

(declare-fun m!65057 () Bool)

(assert (=> b!42846 m!65057))

(declare-fun m!65059 () Bool)

(assert (=> b!42846 m!65059))

(declare-fun m!65061 () Bool)

(assert (=> b!42846 m!65061))

(declare-fun m!65063 () Bool)

(assert (=> b!42846 m!65063))

(assert (=> b!42846 m!65031))

(declare-fun m!65065 () Bool)

(assert (=> b!42846 m!65065))

(assert (=> b!42846 m!64815))

(declare-fun m!65067 () Bool)

(assert (=> b!42846 m!65067))

(declare-fun m!65069 () Bool)

(assert (=> b!42851 m!65069))

(declare-fun m!65071 () Bool)

(assert (=> b!42851 m!65071))

(declare-fun m!65073 () Bool)

(assert (=> b!42851 m!65073))

(declare-fun m!65075 () Bool)

(assert (=> b!42851 m!65075))

(declare-fun m!65077 () Bool)

(assert (=> b!42851 m!65077))

(declare-fun m!65079 () Bool)

(assert (=> b!42845 m!65079))

(declare-fun m!65081 () Bool)

(assert (=> b!42845 m!65081))

(declare-fun m!65083 () Bool)

(assert (=> d!12390 m!65083))

(assert (=> d!12390 m!64815))

(assert (=> d!12390 m!64897))

(assert (=> d!12390 m!64893))

(declare-fun m!65085 () Bool)

(assert (=> b!42850 m!65085))

(declare-fun m!65087 () Bool)

(assert (=> b!42852 m!65087))

(declare-fun m!65089 () Bool)

(assert (=> b!42848 m!65089))

(declare-fun m!65091 () Bool)

(assert (=> bm!493 m!65091))

(assert (=> b!42666 d!12390))

(declare-fun d!12398 () Bool)

(declare-fun res!36448 () Bool)

(declare-fun e!28630 () Bool)

(assert (=> d!12398 (=> (not res!36448) (not e!28630))))

(assert (=> d!12398 (= res!36448 (= (size!992 (buf!1323 (_2!2189 lt!64071))) (size!992 (buf!1323 (_2!2189 lt!64075)))))))

(assert (=> d!12398 (= (isPrefixOf!0 (_2!2189 lt!64071) (_2!2189 lt!64075)) e!28630)))

(declare-fun b!42867 () Bool)

(declare-fun res!36450 () Bool)

(assert (=> b!42867 (=> (not res!36450) (not e!28630))))

(assert (=> b!42867 (= res!36450 (bvsle (bitIndex!0 (size!992 (buf!1323 (_2!2189 lt!64071))) (currentByte!2787 (_2!2189 lt!64071)) (currentBit!2782 (_2!2189 lt!64071))) (bitIndex!0 (size!992 (buf!1323 (_2!2189 lt!64075))) (currentByte!2787 (_2!2189 lt!64075)) (currentBit!2782 (_2!2189 lt!64075)))))))

(declare-fun b!42868 () Bool)

(declare-fun e!28629 () Bool)

(assert (=> b!42868 (= e!28630 e!28629)))

(declare-fun res!36449 () Bool)

(assert (=> b!42868 (=> res!36449 e!28629)))

(assert (=> b!42868 (= res!36449 (= (size!992 (buf!1323 (_2!2189 lt!64071))) #b00000000000000000000000000000000))))

(declare-fun b!42869 () Bool)

(assert (=> b!42869 (= e!28629 (arrayBitRangesEq!0 (buf!1323 (_2!2189 lt!64071)) (buf!1323 (_2!2189 lt!64075)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!992 (buf!1323 (_2!2189 lt!64071))) (currentByte!2787 (_2!2189 lt!64071)) (currentBit!2782 (_2!2189 lt!64071)))))))

(assert (= (and d!12398 res!36448) b!42867))

(assert (= (and b!42867 res!36450) b!42868))

(assert (= (and b!42868 (not res!36449)) b!42869))

(assert (=> b!42867 m!64815))

(assert (=> b!42867 m!64881))

(assert (=> b!42869 m!64815))

(assert (=> b!42869 m!64815))

(declare-fun m!65093 () Bool)

(assert (=> b!42869 m!65093))

(assert (=> b!42666 d!12398))

(declare-fun d!12400 () Bool)

(assert (=> d!12400 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!992 (buf!1323 (_2!2189 lt!64071)))) ((_ sign_extend 32) (currentByte!2787 thiss!1379)) ((_ sign_extend 32) (currentBit!2782 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!992 (buf!1323 (_2!2189 lt!64071)))) ((_ sign_extend 32) (currentByte!2787 thiss!1379)) ((_ sign_extend 32) (currentBit!2782 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3344 () Bool)

(assert (= bs!3344 d!12400))

(declare-fun m!65095 () Bool)

(assert (=> bs!3344 m!65095))

(assert (=> b!42666 d!12400))

(check-sat (not b!42706) (not b!42851) (not b!42784) (not b!42846) (not b!42728) (not b!42694) (not b!42725) (not b!42867) (not b!42780) (not d!12382) (not d!12342) (not b!42789) (not d!12388) (not b!42850) (not b!42804) (not d!12368) (not b!42783) (not b!42845) (not b!42692) (not d!12380) (not b!42848) (not bm!493) (not b!42852) (not b!42726) (not b!42786) (not b!42736) (not d!12374) (not d!12386) (not b!42727) (not b!42730) (not d!12390) (not d!12364) (not b!42869) (not b!42800) (not d!12400) (not d!12370) (not b!42802) (not b!42787) (not b!42781) (not b!42801) (not b!42779) (not b!42785) (not b!42782) (not d!12344))
