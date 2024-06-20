; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12012 () Bool)

(assert start!12012)

(declare-fun b!61176 () Bool)

(declare-fun res!50996 () Bool)

(declare-fun e!40785 () Bool)

(assert (=> b!61176 (=> res!50996 e!40785)))

(declare-datatypes ((List!678 0))(
  ( (Nil!675) (Cons!674 (h!793 Bool) (t!1428 List!678)) )
))
(declare-fun lt!95650 () List!678)

(declare-fun length!306 (List!678) Int)

(assert (=> b!61176 (= res!50996 (<= (length!306 lt!95650) 0))))

(declare-fun res!50982 () Bool)

(declare-fun e!40784 () Bool)

(assert (=> start!12012 (=> (not res!50982) (not e!40784))))

(declare-datatypes ((array!2770 0))(
  ( (array!2771 (arr!1826 (Array (_ BitVec 32) (_ BitVec 8))) (size!1262 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2770)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!12012 (= res!50982 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1262 srcBuffer!2))))))))

(assert (=> start!12012 e!40784))

(assert (=> start!12012 true))

(declare-fun array_inv!1162 (array!2770) Bool)

(assert (=> start!12012 (array_inv!1162 srcBuffer!2)))

(declare-datatypes ((BitStream!2206 0))(
  ( (BitStream!2207 (buf!1643 array!2770) (currentByte!3267 (_ BitVec 32)) (currentBit!3262 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2206)

(declare-fun e!40787 () Bool)

(declare-fun inv!12 (BitStream!2206) Bool)

(assert (=> start!12012 (and (inv!12 thiss!1379) e!40787)))

(declare-fun b!61177 () Bool)

(declare-fun e!40783 () Bool)

(declare-fun e!40782 () Bool)

(assert (=> b!61177 (= e!40783 e!40782)))

(declare-fun res!50985 () Bool)

(assert (=> b!61177 (=> res!50985 e!40782)))

(declare-datatypes ((Unit!4171 0))(
  ( (Unit!4172) )
))
(declare-datatypes ((tuple2!5558 0))(
  ( (tuple2!5559 (_1!2890 Unit!4171) (_2!2890 BitStream!2206)) )
))
(declare-fun lt!95652 () tuple2!5558)

(declare-fun lt!95649 () tuple2!5558)

(declare-fun isPrefixOf!0 (BitStream!2206 BitStream!2206) Bool)

(assert (=> b!61177 (= res!50985 (not (isPrefixOf!0 (_2!2890 lt!95652) (_2!2890 lt!95649))))))

(assert (=> b!61177 (isPrefixOf!0 thiss!1379 (_2!2890 lt!95649))))

(declare-fun lt!95645 () Unit!4171)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2206 BitStream!2206 BitStream!2206) Unit!4171)

(assert (=> b!61177 (= lt!95645 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2890 lt!95652) (_2!2890 lt!95649)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2206 array!2770 (_ BitVec 64) (_ BitVec 64)) tuple2!5558)

(assert (=> b!61177 (= lt!95649 (appendBitsMSBFirstLoop!0 (_2!2890 lt!95652) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!40792 () Bool)

(assert (=> b!61177 e!40792))

(declare-fun res!50988 () Bool)

(assert (=> b!61177 (=> (not res!50988) (not e!40792))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!61177 (= res!50988 (validate_offset_bits!1 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95652)))) ((_ sign_extend 32) (currentByte!3267 thiss!1379)) ((_ sign_extend 32) (currentBit!3262 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!95648 () Unit!4171)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2206 array!2770 (_ BitVec 64)) Unit!4171)

(assert (=> b!61177 (= lt!95648 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1643 (_2!2890 lt!95652)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5560 0))(
  ( (tuple2!5561 (_1!2891 BitStream!2206) (_2!2891 BitStream!2206)) )
))
(declare-fun lt!95651 () tuple2!5560)

(declare-fun reader!0 (BitStream!2206 BitStream!2206) tuple2!5560)

(assert (=> b!61177 (= lt!95651 (reader!0 thiss!1379 (_2!2890 lt!95652)))))

(declare-fun b!61178 () Bool)

(declare-fun res!50992 () Bool)

(declare-fun e!40791 () Bool)

(assert (=> b!61178 (=> res!50992 e!40791)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!61178 (= res!50992 (not (invariant!0 (currentBit!3262 (_2!2890 lt!95652)) (currentByte!3267 (_2!2890 lt!95652)) (size!1262 (buf!1643 (_2!2890 lt!95652))))))))

(declare-fun b!61179 () Bool)

(assert (=> b!61179 (= e!40791 e!40785)))

(declare-fun res!50983 () Bool)

(assert (=> b!61179 (=> res!50983 e!40785)))

(assert (=> b!61179 (= res!50983 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!95639 () List!678)

(declare-fun lt!95643 () tuple2!5560)

(declare-fun lt!95653 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2206 BitStream!2206 (_ BitVec 64)) List!678)

(assert (=> b!61179 (= lt!95639 (bitStreamReadBitsIntoList!0 (_2!2890 lt!95649) (_1!2891 lt!95643) lt!95653))))

(declare-fun lt!95640 () tuple2!5560)

(assert (=> b!61179 (= lt!95650 (bitStreamReadBitsIntoList!0 (_2!2890 lt!95649) (_1!2891 lt!95640) (bvsub to!314 i!635)))))

(assert (=> b!61179 (validate_offset_bits!1 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95649)))) ((_ sign_extend 32) (currentByte!3267 (_2!2890 lt!95652))) ((_ sign_extend 32) (currentBit!3262 (_2!2890 lt!95652))) lt!95653)))

(declare-fun lt!95642 () Unit!4171)

(assert (=> b!61179 (= lt!95642 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2890 lt!95652) (buf!1643 (_2!2890 lt!95649)) lt!95653))))

(assert (=> b!61179 (= lt!95643 (reader!0 (_2!2890 lt!95652) (_2!2890 lt!95649)))))

(assert (=> b!61179 (validate_offset_bits!1 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95649)))) ((_ sign_extend 32) (currentByte!3267 thiss!1379)) ((_ sign_extend 32) (currentBit!3262 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!95647 () Unit!4171)

(assert (=> b!61179 (= lt!95647 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1643 (_2!2890 lt!95649)) (bvsub to!314 i!635)))))

(assert (=> b!61179 (= lt!95640 (reader!0 thiss!1379 (_2!2890 lt!95649)))))

(declare-fun b!61180 () Bool)

(declare-fun res!50995 () Bool)

(declare-fun e!40788 () Bool)

(assert (=> b!61180 (=> res!50995 e!40788)))

(assert (=> b!61180 (= res!50995 (not (= (size!1262 (buf!1643 thiss!1379)) (size!1262 (buf!1643 (_2!2890 lt!95649))))))))

(declare-fun b!61181 () Bool)

(assert (=> b!61181 (= e!40782 e!40788)))

(declare-fun res!50990 () Bool)

(assert (=> b!61181 (=> res!50990 e!40788)))

(declare-fun lt!95638 () (_ BitVec 64))

(declare-fun lt!95641 () (_ BitVec 64))

(assert (=> b!61181 (= res!50990 (not (= lt!95641 (bvsub (bvadd lt!95638 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!61181 (= lt!95641 (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!95649))) (currentByte!3267 (_2!2890 lt!95649)) (currentBit!3262 (_2!2890 lt!95649))))))

(declare-fun b!61182 () Bool)

(assert (=> b!61182 (= e!40788 e!40791)))

(declare-fun res!50986 () Bool)

(assert (=> b!61182 (=> res!50986 e!40791)))

(assert (=> b!61182 (= res!50986 (not (= (size!1262 (buf!1643 (_2!2890 lt!95652))) (size!1262 (buf!1643 (_2!2890 lt!95649))))))))

(declare-fun e!40786 () Bool)

(assert (=> b!61182 e!40786))

(declare-fun res!50989 () Bool)

(assert (=> b!61182 (=> (not res!50989) (not e!40786))))

(assert (=> b!61182 (= res!50989 (= (size!1262 (buf!1643 (_2!2890 lt!95649))) (size!1262 (buf!1643 thiss!1379))))))

(declare-fun b!61183 () Bool)

(declare-fun e!40789 () Bool)

(assert (=> b!61183 (= e!40789 e!40783)))

(declare-fun res!50984 () Bool)

(assert (=> b!61183 (=> res!50984 e!40783)))

(assert (=> b!61183 (= res!50984 (not (isPrefixOf!0 thiss!1379 (_2!2890 lt!95652))))))

(assert (=> b!61183 (validate_offset_bits!1 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95652)))) ((_ sign_extend 32) (currentByte!3267 (_2!2890 lt!95652))) ((_ sign_extend 32) (currentBit!3262 (_2!2890 lt!95652))) lt!95653)))

(assert (=> b!61183 (= lt!95653 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!95646 () Unit!4171)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2206 BitStream!2206 (_ BitVec 64) (_ BitVec 64)) Unit!4171)

(assert (=> b!61183 (= lt!95646 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2890 lt!95652) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2206 (_ BitVec 8) (_ BitVec 32)) tuple2!5558)

(assert (=> b!61183 (= lt!95652 (appendBitFromByte!0 thiss!1379 (select (arr!1826 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!61184 () Bool)

(declare-fun head!497 (List!678) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2206 array!2770 (_ BitVec 64) (_ BitVec 64)) List!678)

(assert (=> b!61184 (= e!40792 (= (head!497 (byteArrayBitContentToList!0 (_2!2890 lt!95652) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!497 (bitStreamReadBitsIntoList!0 (_2!2890 lt!95652) (_1!2891 lt!95651) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!61185 () Bool)

(declare-fun res!50993 () Bool)

(assert (=> b!61185 (=> res!50993 e!40788)))

(assert (=> b!61185 (= res!50993 (not (invariant!0 (currentBit!3262 (_2!2890 lt!95649)) (currentByte!3267 (_2!2890 lt!95649)) (size!1262 (buf!1643 (_2!2890 lt!95649))))))))

(declare-fun b!61186 () Bool)

(assert (=> b!61186 (= e!40787 (array_inv!1162 (buf!1643 thiss!1379)))))

(declare-fun b!61187 () Bool)

(assert (=> b!61187 (= e!40784 (not e!40789))))

(declare-fun res!50997 () Bool)

(assert (=> b!61187 (=> res!50997 e!40789)))

(assert (=> b!61187 (= res!50997 (bvsge i!635 to!314))))

(assert (=> b!61187 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!95644 () Unit!4171)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2206) Unit!4171)

(assert (=> b!61187 (= lt!95644 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!61187 (= lt!95638 (bitIndex!0 (size!1262 (buf!1643 thiss!1379)) (currentByte!3267 thiss!1379) (currentBit!3262 thiss!1379)))))

(declare-fun b!61188 () Bool)

(assert (=> b!61188 (= e!40785 (isPrefixOf!0 (_1!2891 lt!95643) (_2!2890 lt!95649)))))

(declare-fun b!61189 () Bool)

(assert (=> b!61189 (= e!40786 (= lt!95641 (bvsub (bvsub (bvadd (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!95652))) (currentByte!3267 (_2!2890 lt!95652)) (currentBit!3262 (_2!2890 lt!95652))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!61190 () Bool)

(declare-fun res!50987 () Bool)

(assert (=> b!61190 (=> res!50987 e!40785)))

(assert (=> b!61190 (= res!50987 (not (isPrefixOf!0 (_1!2891 lt!95640) (_2!2890 lt!95649))))))

(declare-fun b!61191 () Bool)

(declare-fun res!50994 () Bool)

(assert (=> b!61191 (=> (not res!50994) (not e!40784))))

(assert (=> b!61191 (= res!50994 (validate_offset_bits!1 ((_ sign_extend 32) (size!1262 (buf!1643 thiss!1379))) ((_ sign_extend 32) (currentByte!3267 thiss!1379)) ((_ sign_extend 32) (currentBit!3262 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!61192 () Bool)

(declare-fun res!50991 () Bool)

(assert (=> b!61192 (=> res!50991 e!40791)))

(assert (=> b!61192 (= res!50991 (not (invariant!0 (currentBit!3262 (_2!2890 lt!95652)) (currentByte!3267 (_2!2890 lt!95652)) (size!1262 (buf!1643 (_2!2890 lt!95649))))))))

(assert (= (and start!12012 res!50982) b!61191))

(assert (= (and b!61191 res!50994) b!61187))

(assert (= (and b!61187 (not res!50997)) b!61183))

(assert (= (and b!61183 (not res!50984)) b!61177))

(assert (= (and b!61177 res!50988) b!61184))

(assert (= (and b!61177 (not res!50985)) b!61181))

(assert (= (and b!61181 (not res!50990)) b!61185))

(assert (= (and b!61185 (not res!50993)) b!61180))

(assert (= (and b!61180 (not res!50995)) b!61182))

(assert (= (and b!61182 res!50989) b!61189))

(assert (= (and b!61182 (not res!50986)) b!61178))

(assert (= (and b!61178 (not res!50992)) b!61192))

(assert (= (and b!61192 (not res!50991)) b!61179))

(assert (= (and b!61179 (not res!50983)) b!61176))

(assert (= (and b!61176 (not res!50996)) b!61190))

(assert (= (and b!61190 (not res!50987)) b!61188))

(assert (= start!12012 b!61186))

(declare-fun m!96535 () Bool)

(assert (=> b!61191 m!96535))

(declare-fun m!96537 () Bool)

(assert (=> b!61183 m!96537))

(declare-fun m!96539 () Bool)

(assert (=> b!61183 m!96539))

(declare-fun m!96541 () Bool)

(assert (=> b!61183 m!96541))

(declare-fun m!96543 () Bool)

(assert (=> b!61183 m!96543))

(assert (=> b!61183 m!96537))

(declare-fun m!96545 () Bool)

(assert (=> b!61183 m!96545))

(declare-fun m!96547 () Bool)

(assert (=> b!61187 m!96547))

(declare-fun m!96549 () Bool)

(assert (=> b!61187 m!96549))

(declare-fun m!96551 () Bool)

(assert (=> b!61187 m!96551))

(declare-fun m!96553 () Bool)

(assert (=> b!61177 m!96553))

(declare-fun m!96555 () Bool)

(assert (=> b!61177 m!96555))

(declare-fun m!96557 () Bool)

(assert (=> b!61177 m!96557))

(declare-fun m!96559 () Bool)

(assert (=> b!61177 m!96559))

(declare-fun m!96561 () Bool)

(assert (=> b!61177 m!96561))

(declare-fun m!96563 () Bool)

(assert (=> b!61177 m!96563))

(declare-fun m!96565 () Bool)

(assert (=> b!61177 m!96565))

(declare-fun m!96567 () Bool)

(assert (=> b!61181 m!96567))

(declare-fun m!96569 () Bool)

(assert (=> start!12012 m!96569))

(declare-fun m!96571 () Bool)

(assert (=> start!12012 m!96571))

(declare-fun m!96573 () Bool)

(assert (=> b!61190 m!96573))

(declare-fun m!96575 () Bool)

(assert (=> b!61186 m!96575))

(declare-fun m!96577 () Bool)

(assert (=> b!61192 m!96577))

(declare-fun m!96579 () Bool)

(assert (=> b!61179 m!96579))

(declare-fun m!96581 () Bool)

(assert (=> b!61179 m!96581))

(declare-fun m!96583 () Bool)

(assert (=> b!61179 m!96583))

(declare-fun m!96585 () Bool)

(assert (=> b!61179 m!96585))

(declare-fun m!96587 () Bool)

(assert (=> b!61179 m!96587))

(declare-fun m!96589 () Bool)

(assert (=> b!61179 m!96589))

(declare-fun m!96591 () Bool)

(assert (=> b!61179 m!96591))

(declare-fun m!96593 () Bool)

(assert (=> b!61179 m!96593))

(declare-fun m!96595 () Bool)

(assert (=> b!61185 m!96595))

(declare-fun m!96597 () Bool)

(assert (=> b!61176 m!96597))

(declare-fun m!96599 () Bool)

(assert (=> b!61178 m!96599))

(declare-fun m!96601 () Bool)

(assert (=> b!61189 m!96601))

(declare-fun m!96603 () Bool)

(assert (=> b!61184 m!96603))

(assert (=> b!61184 m!96603))

(declare-fun m!96605 () Bool)

(assert (=> b!61184 m!96605))

(declare-fun m!96607 () Bool)

(assert (=> b!61184 m!96607))

(assert (=> b!61184 m!96607))

(declare-fun m!96609 () Bool)

(assert (=> b!61184 m!96609))

(declare-fun m!96611 () Bool)

(assert (=> b!61188 m!96611))

(push 1)

(assert (not b!61185))

(assert (not b!61188))

(assert (not b!61187))

(assert (not b!61186))

(assert (not b!61191))

(assert (not b!61192))

(assert (not b!61177))

(assert (not b!61190))

(assert (not start!12012))

(assert (not b!61178))

(assert (not b!61181))

(assert (not b!61189))

(assert (not b!61176))

(assert (not b!61184))

(assert (not b!61179))

(assert (not b!61183))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!18844 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!18844 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95649)))) ((_ sign_extend 32) (currentByte!3267 thiss!1379)) ((_ sign_extend 32) (currentBit!3262 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95649)))) ((_ sign_extend 32) (currentByte!3267 thiss!1379)) ((_ sign_extend 32) (currentBit!3262 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4712 () Bool)

(assert (= bs!4712 d!18844))

(declare-fun m!96853 () Bool)

(assert (=> bs!4712 m!96853))

(assert (=> b!61179 d!18844))

(declare-fun d!18846 () Bool)

(assert (=> d!18846 (validate_offset_bits!1 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95649)))) ((_ sign_extend 32) (currentByte!3267 (_2!2890 lt!95652))) ((_ sign_extend 32) (currentBit!3262 (_2!2890 lt!95652))) lt!95653)))

(declare-fun lt!95867 () Unit!4171)

(declare-fun choose!9 (BitStream!2206 array!2770 (_ BitVec 64) BitStream!2206) Unit!4171)

(assert (=> d!18846 (= lt!95867 (choose!9 (_2!2890 lt!95652) (buf!1643 (_2!2890 lt!95649)) lt!95653 (BitStream!2207 (buf!1643 (_2!2890 lt!95649)) (currentByte!3267 (_2!2890 lt!95652)) (currentBit!3262 (_2!2890 lt!95652)))))))

(assert (=> d!18846 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2890 lt!95652) (buf!1643 (_2!2890 lt!95649)) lt!95653) lt!95867)))

(declare-fun bs!4713 () Bool)

(assert (= bs!4713 d!18846))

(assert (=> bs!4713 m!96589))

(declare-fun m!96855 () Bool)

(assert (=> bs!4713 m!96855))

(assert (=> b!61179 d!18846))

(declare-fun b!61356 () Bool)

(declare-fun e!40895 () Bool)

(declare-fun lt!95875 () List!678)

(declare-fun isEmpty!184 (List!678) Bool)

(assert (=> b!61356 (= e!40895 (isEmpty!184 lt!95875))))

(declare-fun d!18848 () Bool)

(assert (=> d!18848 e!40895))

(declare-fun c!4308 () Bool)

(assert (=> d!18848 (= c!4308 (= lt!95653 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5578 0))(
  ( (tuple2!5579 (_1!2900 List!678) (_2!2900 BitStream!2206)) )
))
(declare-fun e!40896 () tuple2!5578)

(assert (=> d!18848 (= lt!95875 (_1!2900 e!40896))))

(declare-fun c!4307 () Bool)

(assert (=> d!18848 (= c!4307 (= lt!95653 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18848 (bvsge lt!95653 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18848 (= (bitStreamReadBitsIntoList!0 (_2!2890 lt!95649) (_1!2891 lt!95643) lt!95653) lt!95875)))

(declare-fun lt!95876 () (_ BitVec 64))

(declare-datatypes ((tuple2!5580 0))(
  ( (tuple2!5581 (_1!2901 Bool) (_2!2901 BitStream!2206)) )
))
(declare-fun lt!95874 () tuple2!5580)

(declare-fun b!61355 () Bool)

(assert (=> b!61355 (= e!40896 (tuple2!5579 (Cons!674 (_1!2901 lt!95874) (bitStreamReadBitsIntoList!0 (_2!2890 lt!95649) (_2!2901 lt!95874) (bvsub lt!95653 lt!95876))) (_2!2901 lt!95874)))))

(declare-fun readBit!0 (BitStream!2206) tuple2!5580)

(assert (=> b!61355 (= lt!95874 (readBit!0 (_1!2891 lt!95643)))))

(assert (=> b!61355 (= lt!95876 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!61357 () Bool)

(assert (=> b!61357 (= e!40895 (> (length!306 lt!95875) 0))))

(declare-fun b!61354 () Bool)

(assert (=> b!61354 (= e!40896 (tuple2!5579 Nil!675 (_1!2891 lt!95643)))))

(assert (= (and d!18848 c!4307) b!61354))

(assert (= (and d!18848 (not c!4307)) b!61355))

(assert (= (and d!18848 c!4308) b!61356))

(assert (= (and d!18848 (not c!4308)) b!61357))

(declare-fun m!96857 () Bool)

(assert (=> b!61356 m!96857))

(declare-fun m!96859 () Bool)

(assert (=> b!61355 m!96859))

(declare-fun m!96861 () Bool)

(assert (=> b!61355 m!96861))

(declare-fun m!96863 () Bool)

(assert (=> b!61357 m!96863))

(assert (=> b!61179 d!18848))

(declare-fun lt!95948 () tuple2!5560)

(declare-fun lt!95946 () (_ BitVec 64))

(declare-fun e!40914 () Bool)

(declare-fun lt!95954 () (_ BitVec 64))

(declare-fun b!61389 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2206 (_ BitVec 64)) BitStream!2206)

(assert (=> b!61389 (= e!40914 (= (_1!2891 lt!95948) (withMovedBitIndex!0 (_2!2891 lt!95948) (bvsub lt!95946 lt!95954))))))

(assert (=> b!61389 (or (= (bvand lt!95946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!95954 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!95946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!95946 lt!95954) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61389 (= lt!95954 (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!95649))) (currentByte!3267 (_2!2890 lt!95649)) (currentBit!3262 (_2!2890 lt!95649))))))

(assert (=> b!61389 (= lt!95946 (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!95652))) (currentByte!3267 (_2!2890 lt!95652)) (currentBit!3262 (_2!2890 lt!95652))))))

(declare-fun b!61390 () Bool)

(declare-fun e!40913 () Unit!4171)

(declare-fun lt!95943 () Unit!4171)

(assert (=> b!61390 (= e!40913 lt!95943)))

(declare-fun lt!95944 () (_ BitVec 64))

(assert (=> b!61390 (= lt!95944 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95940 () (_ BitVec 64))

(assert (=> b!61390 (= lt!95940 (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!95652))) (currentByte!3267 (_2!2890 lt!95652)) (currentBit!3262 (_2!2890 lt!95652))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2770 array!2770 (_ BitVec 64) (_ BitVec 64)) Unit!4171)

(assert (=> b!61390 (= lt!95943 (arrayBitRangesEqSymmetric!0 (buf!1643 (_2!2890 lt!95652)) (buf!1643 (_2!2890 lt!95649)) lt!95944 lt!95940))))

(declare-fun arrayBitRangesEq!0 (array!2770 array!2770 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!61390 (arrayBitRangesEq!0 (buf!1643 (_2!2890 lt!95649)) (buf!1643 (_2!2890 lt!95652)) lt!95944 lt!95940)))

(declare-fun b!61391 () Bool)

(declare-fun res!51142 () Bool)

(assert (=> b!61391 (=> (not res!51142) (not e!40914))))

(assert (=> b!61391 (= res!51142 (isPrefixOf!0 (_1!2891 lt!95948) (_2!2890 lt!95652)))))

(declare-fun b!61392 () Bool)

(declare-fun res!51144 () Bool)

(assert (=> b!61392 (=> (not res!51144) (not e!40914))))

(assert (=> b!61392 (= res!51144 (isPrefixOf!0 (_2!2891 lt!95948) (_2!2890 lt!95649)))))

(declare-fun b!61393 () Bool)

(declare-fun Unit!4187 () Unit!4171)

(assert (=> b!61393 (= e!40913 Unit!4187)))

(declare-fun d!18850 () Bool)

(assert (=> d!18850 e!40914))

(declare-fun res!51143 () Bool)

(assert (=> d!18850 (=> (not res!51143) (not e!40914))))

(assert (=> d!18850 (= res!51143 (isPrefixOf!0 (_1!2891 lt!95948) (_2!2891 lt!95948)))))

(declare-fun lt!95939 () BitStream!2206)

(assert (=> d!18850 (= lt!95948 (tuple2!5561 lt!95939 (_2!2890 lt!95649)))))

(declare-fun lt!95953 () Unit!4171)

(declare-fun lt!95935 () Unit!4171)

(assert (=> d!18850 (= lt!95953 lt!95935)))

(assert (=> d!18850 (isPrefixOf!0 lt!95939 (_2!2890 lt!95649))))

(assert (=> d!18850 (= lt!95935 (lemmaIsPrefixTransitive!0 lt!95939 (_2!2890 lt!95649) (_2!2890 lt!95649)))))

(declare-fun lt!95947 () Unit!4171)

(declare-fun lt!95942 () Unit!4171)

(assert (=> d!18850 (= lt!95947 lt!95942)))

(assert (=> d!18850 (isPrefixOf!0 lt!95939 (_2!2890 lt!95649))))

(assert (=> d!18850 (= lt!95942 (lemmaIsPrefixTransitive!0 lt!95939 (_2!2890 lt!95652) (_2!2890 lt!95649)))))

(declare-fun lt!95949 () Unit!4171)

(assert (=> d!18850 (= lt!95949 e!40913)))

(declare-fun c!4314 () Bool)

(assert (=> d!18850 (= c!4314 (not (= (size!1262 (buf!1643 (_2!2890 lt!95652))) #b00000000000000000000000000000000)))))

(declare-fun lt!95937 () Unit!4171)

(declare-fun lt!95950 () Unit!4171)

(assert (=> d!18850 (= lt!95937 lt!95950)))

(assert (=> d!18850 (isPrefixOf!0 (_2!2890 lt!95649) (_2!2890 lt!95649))))

(assert (=> d!18850 (= lt!95950 (lemmaIsPrefixRefl!0 (_2!2890 lt!95649)))))

(declare-fun lt!95936 () Unit!4171)

(declare-fun lt!95941 () Unit!4171)

(assert (=> d!18850 (= lt!95936 lt!95941)))

(assert (=> d!18850 (= lt!95941 (lemmaIsPrefixRefl!0 (_2!2890 lt!95649)))))

(declare-fun lt!95952 () Unit!4171)

(declare-fun lt!95951 () Unit!4171)

(assert (=> d!18850 (= lt!95952 lt!95951)))

(assert (=> d!18850 (isPrefixOf!0 lt!95939 lt!95939)))

(assert (=> d!18850 (= lt!95951 (lemmaIsPrefixRefl!0 lt!95939))))

(declare-fun lt!95938 () Unit!4171)

(declare-fun lt!95945 () Unit!4171)

(assert (=> d!18850 (= lt!95938 lt!95945)))

(assert (=> d!18850 (isPrefixOf!0 (_2!2890 lt!95652) (_2!2890 lt!95652))))

(assert (=> d!18850 (= lt!95945 (lemmaIsPrefixRefl!0 (_2!2890 lt!95652)))))

(assert (=> d!18850 (= lt!95939 (BitStream!2207 (buf!1643 (_2!2890 lt!95649)) (currentByte!3267 (_2!2890 lt!95652)) (currentBit!3262 (_2!2890 lt!95652))))))

(assert (=> d!18850 (isPrefixOf!0 (_2!2890 lt!95652) (_2!2890 lt!95649))))

(assert (=> d!18850 (= (reader!0 (_2!2890 lt!95652) (_2!2890 lt!95649)) lt!95948)))

(assert (= (and d!18850 c!4314) b!61390))

(assert (= (and d!18850 (not c!4314)) b!61393))

(assert (= (and d!18850 res!51143) b!61391))

(assert (= (and b!61391 res!51142) b!61392))

(assert (= (and b!61392 res!51144) b!61389))

(assert (=> b!61390 m!96601))

(declare-fun m!96877 () Bool)

(assert (=> b!61390 m!96877))

(declare-fun m!96879 () Bool)

(assert (=> b!61390 m!96879))

(declare-fun m!96881 () Bool)

(assert (=> d!18850 m!96881))

(declare-fun m!96883 () Bool)

(assert (=> d!18850 m!96883))

(declare-fun m!96885 () Bool)

(assert (=> d!18850 m!96885))

(declare-fun m!96887 () Bool)

(assert (=> d!18850 m!96887))

(declare-fun m!96889 () Bool)

(assert (=> d!18850 m!96889))

(declare-fun m!96891 () Bool)

(assert (=> d!18850 m!96891))

(assert (=> d!18850 m!96561))

(declare-fun m!96893 () Bool)

(assert (=> d!18850 m!96893))

(declare-fun m!96895 () Bool)

(assert (=> d!18850 m!96895))

(declare-fun m!96897 () Bool)

(assert (=> d!18850 m!96897))

(declare-fun m!96899 () Bool)

(assert (=> d!18850 m!96899))

(declare-fun m!96901 () Bool)

(assert (=> b!61392 m!96901))

(declare-fun m!96903 () Bool)

(assert (=> b!61389 m!96903))

(assert (=> b!61389 m!96567))

(assert (=> b!61389 m!96601))

(declare-fun m!96905 () Bool)

(assert (=> b!61391 m!96905))

(assert (=> b!61179 d!18850))

(declare-fun b!61394 () Bool)

(declare-fun lt!95966 () (_ BitVec 64))

(declare-fun lt!95974 () (_ BitVec 64))

(declare-fun lt!95968 () tuple2!5560)

(declare-fun e!40916 () Bool)

(assert (=> b!61394 (= e!40916 (= (_1!2891 lt!95968) (withMovedBitIndex!0 (_2!2891 lt!95968) (bvsub lt!95966 lt!95974))))))

(assert (=> b!61394 (or (= (bvand lt!95966 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!95974 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!95966 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!95966 lt!95974) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61394 (= lt!95974 (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!95649))) (currentByte!3267 (_2!2890 lt!95649)) (currentBit!3262 (_2!2890 lt!95649))))))

(assert (=> b!61394 (= lt!95966 (bitIndex!0 (size!1262 (buf!1643 thiss!1379)) (currentByte!3267 thiss!1379) (currentBit!3262 thiss!1379)))))

(declare-fun b!61395 () Bool)

(declare-fun e!40915 () Unit!4171)

(declare-fun lt!95963 () Unit!4171)

(assert (=> b!61395 (= e!40915 lt!95963)))

(declare-fun lt!95964 () (_ BitVec 64))

(assert (=> b!61395 (= lt!95964 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95960 () (_ BitVec 64))

(assert (=> b!61395 (= lt!95960 (bitIndex!0 (size!1262 (buf!1643 thiss!1379)) (currentByte!3267 thiss!1379) (currentBit!3262 thiss!1379)))))

(assert (=> b!61395 (= lt!95963 (arrayBitRangesEqSymmetric!0 (buf!1643 thiss!1379) (buf!1643 (_2!2890 lt!95649)) lt!95964 lt!95960))))

(assert (=> b!61395 (arrayBitRangesEq!0 (buf!1643 (_2!2890 lt!95649)) (buf!1643 thiss!1379) lt!95964 lt!95960)))

(declare-fun b!61396 () Bool)

(declare-fun res!51145 () Bool)

(assert (=> b!61396 (=> (not res!51145) (not e!40916))))

(assert (=> b!61396 (= res!51145 (isPrefixOf!0 (_1!2891 lt!95968) thiss!1379))))

(declare-fun b!61397 () Bool)

(declare-fun res!51147 () Bool)

(assert (=> b!61397 (=> (not res!51147) (not e!40916))))

(assert (=> b!61397 (= res!51147 (isPrefixOf!0 (_2!2891 lt!95968) (_2!2890 lt!95649)))))

(declare-fun b!61398 () Bool)

(declare-fun Unit!4188 () Unit!4171)

(assert (=> b!61398 (= e!40915 Unit!4188)))

(declare-fun d!18868 () Bool)

(assert (=> d!18868 e!40916))

(declare-fun res!51146 () Bool)

(assert (=> d!18868 (=> (not res!51146) (not e!40916))))

(assert (=> d!18868 (= res!51146 (isPrefixOf!0 (_1!2891 lt!95968) (_2!2891 lt!95968)))))

(declare-fun lt!95959 () BitStream!2206)

(assert (=> d!18868 (= lt!95968 (tuple2!5561 lt!95959 (_2!2890 lt!95649)))))

(declare-fun lt!95973 () Unit!4171)

(declare-fun lt!95955 () Unit!4171)

(assert (=> d!18868 (= lt!95973 lt!95955)))

(assert (=> d!18868 (isPrefixOf!0 lt!95959 (_2!2890 lt!95649))))

(assert (=> d!18868 (= lt!95955 (lemmaIsPrefixTransitive!0 lt!95959 (_2!2890 lt!95649) (_2!2890 lt!95649)))))

(declare-fun lt!95967 () Unit!4171)

(declare-fun lt!95962 () Unit!4171)

(assert (=> d!18868 (= lt!95967 lt!95962)))

(assert (=> d!18868 (isPrefixOf!0 lt!95959 (_2!2890 lt!95649))))

(assert (=> d!18868 (= lt!95962 (lemmaIsPrefixTransitive!0 lt!95959 thiss!1379 (_2!2890 lt!95649)))))

(declare-fun lt!95969 () Unit!4171)

(assert (=> d!18868 (= lt!95969 e!40915)))

(declare-fun c!4315 () Bool)

(assert (=> d!18868 (= c!4315 (not (= (size!1262 (buf!1643 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!95957 () Unit!4171)

(declare-fun lt!95970 () Unit!4171)

(assert (=> d!18868 (= lt!95957 lt!95970)))

(assert (=> d!18868 (isPrefixOf!0 (_2!2890 lt!95649) (_2!2890 lt!95649))))

(assert (=> d!18868 (= lt!95970 (lemmaIsPrefixRefl!0 (_2!2890 lt!95649)))))

(declare-fun lt!95956 () Unit!4171)

(declare-fun lt!95961 () Unit!4171)

(assert (=> d!18868 (= lt!95956 lt!95961)))

(assert (=> d!18868 (= lt!95961 (lemmaIsPrefixRefl!0 (_2!2890 lt!95649)))))

(declare-fun lt!95972 () Unit!4171)

(declare-fun lt!95971 () Unit!4171)

(assert (=> d!18868 (= lt!95972 lt!95971)))

(assert (=> d!18868 (isPrefixOf!0 lt!95959 lt!95959)))

(assert (=> d!18868 (= lt!95971 (lemmaIsPrefixRefl!0 lt!95959))))

(declare-fun lt!95958 () Unit!4171)

(declare-fun lt!95965 () Unit!4171)

(assert (=> d!18868 (= lt!95958 lt!95965)))

(assert (=> d!18868 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!18868 (= lt!95965 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!18868 (= lt!95959 (BitStream!2207 (buf!1643 (_2!2890 lt!95649)) (currentByte!3267 thiss!1379) (currentBit!3262 thiss!1379)))))

(assert (=> d!18868 (isPrefixOf!0 thiss!1379 (_2!2890 lt!95649))))

(assert (=> d!18868 (= (reader!0 thiss!1379 (_2!2890 lt!95649)) lt!95968)))

(assert (= (and d!18868 c!4315) b!61395))

(assert (= (and d!18868 (not c!4315)) b!61398))

(assert (= (and d!18868 res!51146) b!61396))

(assert (= (and b!61396 res!51145) b!61397))

(assert (= (and b!61397 res!51147) b!61394))

(assert (=> b!61395 m!96551))

(declare-fun m!96907 () Bool)

(assert (=> b!61395 m!96907))

(declare-fun m!96909 () Bool)

(assert (=> b!61395 m!96909))

(assert (=> d!18868 m!96881))

(declare-fun m!96911 () Bool)

(assert (=> d!18868 m!96911))

(declare-fun m!96913 () Bool)

(assert (=> d!18868 m!96913))

(declare-fun m!96915 () Bool)

(assert (=> d!18868 m!96915))

(declare-fun m!96917 () Bool)

(assert (=> d!18868 m!96917))

(assert (=> d!18868 m!96547))

(assert (=> d!18868 m!96557))

(declare-fun m!96919 () Bool)

(assert (=> d!18868 m!96919))

(assert (=> d!18868 m!96895))

(assert (=> d!18868 m!96549))

(declare-fun m!96921 () Bool)

(assert (=> d!18868 m!96921))

(declare-fun m!96923 () Bool)

(assert (=> b!61397 m!96923))

(declare-fun m!96925 () Bool)

(assert (=> b!61394 m!96925))

(assert (=> b!61394 m!96567))

(assert (=> b!61394 m!96551))

(declare-fun m!96927 () Bool)

(assert (=> b!61396 m!96927))

(assert (=> b!61179 d!18868))

(declare-fun d!18870 () Bool)

(assert (=> d!18870 (validate_offset_bits!1 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95649)))) ((_ sign_extend 32) (currentByte!3267 thiss!1379)) ((_ sign_extend 32) (currentBit!3262 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!95975 () Unit!4171)

(assert (=> d!18870 (= lt!95975 (choose!9 thiss!1379 (buf!1643 (_2!2890 lt!95649)) (bvsub to!314 i!635) (BitStream!2207 (buf!1643 (_2!2890 lt!95649)) (currentByte!3267 thiss!1379) (currentBit!3262 thiss!1379))))))

(assert (=> d!18870 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1643 (_2!2890 lt!95649)) (bvsub to!314 i!635)) lt!95975)))

(declare-fun bs!4715 () Bool)

(assert (= bs!4715 d!18870))

(assert (=> bs!4715 m!96583))

(declare-fun m!96929 () Bool)

(assert (=> bs!4715 m!96929))

(assert (=> b!61179 d!18870))

(declare-fun d!18872 () Bool)

(assert (=> d!18872 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95649)))) ((_ sign_extend 32) (currentByte!3267 (_2!2890 lt!95652))) ((_ sign_extend 32) (currentBit!3262 (_2!2890 lt!95652))) lt!95653) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95649)))) ((_ sign_extend 32) (currentByte!3267 (_2!2890 lt!95652))) ((_ sign_extend 32) (currentBit!3262 (_2!2890 lt!95652)))) lt!95653))))

(declare-fun bs!4716 () Bool)

(assert (= bs!4716 d!18872))

(declare-fun m!96931 () Bool)

(assert (=> bs!4716 m!96931))

(assert (=> b!61179 d!18872))

(declare-fun b!61401 () Bool)

(declare-fun e!40917 () Bool)

(declare-fun lt!95977 () List!678)

(assert (=> b!61401 (= e!40917 (isEmpty!184 lt!95977))))

(declare-fun d!18874 () Bool)

(assert (=> d!18874 e!40917))

(declare-fun c!4317 () Bool)

(assert (=> d!18874 (= c!4317 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!40918 () tuple2!5578)

(assert (=> d!18874 (= lt!95977 (_1!2900 e!40918))))

(declare-fun c!4316 () Bool)

(assert (=> d!18874 (= c!4316 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18874 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18874 (= (bitStreamReadBitsIntoList!0 (_2!2890 lt!95649) (_1!2891 lt!95640) (bvsub to!314 i!635)) lt!95977)))

(declare-fun lt!95978 () (_ BitVec 64))

(declare-fun b!61400 () Bool)

(declare-fun lt!95976 () tuple2!5580)

(assert (=> b!61400 (= e!40918 (tuple2!5579 (Cons!674 (_1!2901 lt!95976) (bitStreamReadBitsIntoList!0 (_2!2890 lt!95649) (_2!2901 lt!95976) (bvsub (bvsub to!314 i!635) lt!95978))) (_2!2901 lt!95976)))))

(assert (=> b!61400 (= lt!95976 (readBit!0 (_1!2891 lt!95640)))))

(assert (=> b!61400 (= lt!95978 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!61402 () Bool)

(assert (=> b!61402 (= e!40917 (> (length!306 lt!95977) 0))))

(declare-fun b!61399 () Bool)

(assert (=> b!61399 (= e!40918 (tuple2!5579 Nil!675 (_1!2891 lt!95640)))))

(assert (= (and d!18874 c!4316) b!61399))

(assert (= (and d!18874 (not c!4316)) b!61400))

(assert (= (and d!18874 c!4317) b!61401))

(assert (= (and d!18874 (not c!4317)) b!61402))

(declare-fun m!96933 () Bool)

(assert (=> b!61401 m!96933))

(declare-fun m!96935 () Bool)

(assert (=> b!61400 m!96935))

(declare-fun m!96937 () Bool)

(assert (=> b!61400 m!96937))

(declare-fun m!96939 () Bool)

(assert (=> b!61402 m!96939))

(assert (=> b!61179 d!18874))

(declare-fun d!18876 () Bool)

(declare-fun res!51155 () Bool)

(declare-fun e!40928 () Bool)

(assert (=> d!18876 (=> (not res!51155) (not e!40928))))

(assert (=> d!18876 (= res!51155 (= (size!1262 (buf!1643 (_1!2891 lt!95640))) (size!1262 (buf!1643 (_2!2890 lt!95649)))))))

(assert (=> d!18876 (= (isPrefixOf!0 (_1!2891 lt!95640) (_2!2890 lt!95649)) e!40928)))

(declare-fun b!61417 () Bool)

(declare-fun res!51154 () Bool)

(assert (=> b!61417 (=> (not res!51154) (not e!40928))))

(assert (=> b!61417 (= res!51154 (bvsle (bitIndex!0 (size!1262 (buf!1643 (_1!2891 lt!95640))) (currentByte!3267 (_1!2891 lt!95640)) (currentBit!3262 (_1!2891 lt!95640))) (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!95649))) (currentByte!3267 (_2!2890 lt!95649)) (currentBit!3262 (_2!2890 lt!95649)))))))

(declare-fun b!61418 () Bool)

(declare-fun e!40927 () Bool)

(assert (=> b!61418 (= e!40928 e!40927)))

(declare-fun res!51156 () Bool)

(assert (=> b!61418 (=> res!51156 e!40927)))

(assert (=> b!61418 (= res!51156 (= (size!1262 (buf!1643 (_1!2891 lt!95640))) #b00000000000000000000000000000000))))

(declare-fun b!61419 () Bool)

(assert (=> b!61419 (= e!40927 (arrayBitRangesEq!0 (buf!1643 (_1!2891 lt!95640)) (buf!1643 (_2!2890 lt!95649)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1262 (buf!1643 (_1!2891 lt!95640))) (currentByte!3267 (_1!2891 lt!95640)) (currentBit!3262 (_1!2891 lt!95640)))))))

(assert (= (and d!18876 res!51155) b!61417))

(assert (= (and b!61417 res!51154) b!61418))

(assert (= (and b!61418 (not res!51156)) b!61419))

(declare-fun m!96941 () Bool)

(assert (=> b!61417 m!96941))

(assert (=> b!61417 m!96567))

(assert (=> b!61419 m!96941))

(assert (=> b!61419 m!96941))

(declare-fun m!96943 () Bool)

(assert (=> b!61419 m!96943))

(assert (=> b!61190 d!18876))

(declare-fun d!18878 () Bool)

(assert (=> d!18878 (= (array_inv!1162 srcBuffer!2) (bvsge (size!1262 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12012 d!18878))

(declare-fun d!18882 () Bool)

(assert (=> d!18882 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3262 thiss!1379) (currentByte!3267 thiss!1379) (size!1262 (buf!1643 thiss!1379))))))

(declare-fun bs!4717 () Bool)

(assert (= bs!4717 d!18882))

(declare-fun m!96953 () Bool)

(assert (=> bs!4717 m!96953))

(assert (=> start!12012 d!18882))

(declare-fun d!18884 () Bool)

(assert (=> d!18884 (= (invariant!0 (currentBit!3262 (_2!2890 lt!95652)) (currentByte!3267 (_2!2890 lt!95652)) (size!1262 (buf!1643 (_2!2890 lt!95652)))) (and (bvsge (currentBit!3262 (_2!2890 lt!95652)) #b00000000000000000000000000000000) (bvslt (currentBit!3262 (_2!2890 lt!95652)) #b00000000000000000000000000001000) (bvsge (currentByte!3267 (_2!2890 lt!95652)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3267 (_2!2890 lt!95652)) (size!1262 (buf!1643 (_2!2890 lt!95652)))) (and (= (currentBit!3262 (_2!2890 lt!95652)) #b00000000000000000000000000000000) (= (currentByte!3267 (_2!2890 lt!95652)) (size!1262 (buf!1643 (_2!2890 lt!95652))))))))))

(assert (=> b!61178 d!18884))

(declare-fun d!18892 () Bool)

(declare-fun e!40937 () Bool)

(assert (=> d!18892 e!40937))

(declare-fun res!51167 () Bool)

(assert (=> d!18892 (=> (not res!51167) (not e!40937))))

(declare-fun lt!96007 () (_ BitVec 64))

(declare-fun lt!96003 () (_ BitVec 64))

(declare-fun lt!96006 () (_ BitVec 64))

(assert (=> d!18892 (= res!51167 (= lt!96007 (bvsub lt!96006 lt!96003)))))

(assert (=> d!18892 (or (= (bvand lt!96006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!96003 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!96006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!96006 lt!96003) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18892 (= lt!96003 (remainingBits!0 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95652)))) ((_ sign_extend 32) (currentByte!3267 (_2!2890 lt!95652))) ((_ sign_extend 32) (currentBit!3262 (_2!2890 lt!95652)))))))

(declare-fun lt!96004 () (_ BitVec 64))

(declare-fun lt!96005 () (_ BitVec 64))

(assert (=> d!18892 (= lt!96006 (bvmul lt!96004 lt!96005))))

(assert (=> d!18892 (or (= lt!96004 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!96005 (bvsdiv (bvmul lt!96004 lt!96005) lt!96004)))))

(assert (=> d!18892 (= lt!96005 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18892 (= lt!96004 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95652)))))))

(assert (=> d!18892 (= lt!96007 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3267 (_2!2890 lt!95652))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3262 (_2!2890 lt!95652)))))))

(assert (=> d!18892 (invariant!0 (currentBit!3262 (_2!2890 lt!95652)) (currentByte!3267 (_2!2890 lt!95652)) (size!1262 (buf!1643 (_2!2890 lt!95652))))))

(assert (=> d!18892 (= (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!95652))) (currentByte!3267 (_2!2890 lt!95652)) (currentBit!3262 (_2!2890 lt!95652))) lt!96007)))

(declare-fun b!61434 () Bool)

(declare-fun res!51168 () Bool)

(assert (=> b!61434 (=> (not res!51168) (not e!40937))))

(assert (=> b!61434 (= res!51168 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!96007))))

(declare-fun b!61435 () Bool)

(declare-fun lt!96008 () (_ BitVec 64))

(assert (=> b!61435 (= e!40937 (bvsle lt!96007 (bvmul lt!96008 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!61435 (or (= lt!96008 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!96008 #b0000000000000000000000000000000000000000000000000000000000001000) lt!96008)))))

(assert (=> b!61435 (= lt!96008 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95652)))))))

(assert (= (and d!18892 res!51167) b!61434))

(assert (= (and b!61434 res!51168) b!61435))

(declare-fun m!96967 () Bool)

(assert (=> d!18892 m!96967))

(assert (=> d!18892 m!96599))

(assert (=> b!61189 d!18892))

(declare-fun d!18902 () Bool)

(assert (=> d!18902 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1262 (buf!1643 thiss!1379))) ((_ sign_extend 32) (currentByte!3267 thiss!1379)) ((_ sign_extend 32) (currentBit!3262 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1262 (buf!1643 thiss!1379))) ((_ sign_extend 32) (currentByte!3267 thiss!1379)) ((_ sign_extend 32) (currentBit!3262 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4721 () Bool)

(assert (= bs!4721 d!18902))

(declare-fun m!96969 () Bool)

(assert (=> bs!4721 m!96969))

(assert (=> b!61191 d!18902))

(declare-fun d!18904 () Bool)

(declare-fun e!40938 () Bool)

(assert (=> d!18904 e!40938))

(declare-fun res!51169 () Bool)

(assert (=> d!18904 (=> (not res!51169) (not e!40938))))

(declare-fun lt!96009 () (_ BitVec 64))

(declare-fun lt!96012 () (_ BitVec 64))

(declare-fun lt!96013 () (_ BitVec 64))

(assert (=> d!18904 (= res!51169 (= lt!96013 (bvsub lt!96012 lt!96009)))))

(assert (=> d!18904 (or (= (bvand lt!96012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!96009 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!96012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!96012 lt!96009) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18904 (= lt!96009 (remainingBits!0 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95649)))) ((_ sign_extend 32) (currentByte!3267 (_2!2890 lt!95649))) ((_ sign_extend 32) (currentBit!3262 (_2!2890 lt!95649)))))))

(declare-fun lt!96010 () (_ BitVec 64))

(declare-fun lt!96011 () (_ BitVec 64))

(assert (=> d!18904 (= lt!96012 (bvmul lt!96010 lt!96011))))

(assert (=> d!18904 (or (= lt!96010 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!96011 (bvsdiv (bvmul lt!96010 lt!96011) lt!96010)))))

(assert (=> d!18904 (= lt!96011 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18904 (= lt!96010 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95649)))))))

(assert (=> d!18904 (= lt!96013 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3267 (_2!2890 lt!95649))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3262 (_2!2890 lt!95649)))))))

(assert (=> d!18904 (invariant!0 (currentBit!3262 (_2!2890 lt!95649)) (currentByte!3267 (_2!2890 lt!95649)) (size!1262 (buf!1643 (_2!2890 lt!95649))))))

(assert (=> d!18904 (= (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!95649))) (currentByte!3267 (_2!2890 lt!95649)) (currentBit!3262 (_2!2890 lt!95649))) lt!96013)))

(declare-fun b!61436 () Bool)

(declare-fun res!51170 () Bool)

(assert (=> b!61436 (=> (not res!51170) (not e!40938))))

(assert (=> b!61436 (= res!51170 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!96013))))

(declare-fun b!61437 () Bool)

(declare-fun lt!96014 () (_ BitVec 64))

(assert (=> b!61437 (= e!40938 (bvsle lt!96013 (bvmul lt!96014 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!61437 (or (= lt!96014 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!96014 #b0000000000000000000000000000000000000000000000000000000000001000) lt!96014)))))

(assert (=> b!61437 (= lt!96014 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95649)))))))

(assert (= (and d!18904 res!51169) b!61436))

(assert (= (and b!61436 res!51170) b!61437))

(declare-fun m!96971 () Bool)

(assert (=> d!18904 m!96971))

(assert (=> d!18904 m!96595))

(assert (=> b!61181 d!18904))

(declare-fun d!18906 () Bool)

(assert (=> d!18906 (= (invariant!0 (currentBit!3262 (_2!2890 lt!95652)) (currentByte!3267 (_2!2890 lt!95652)) (size!1262 (buf!1643 (_2!2890 lt!95649)))) (and (bvsge (currentBit!3262 (_2!2890 lt!95652)) #b00000000000000000000000000000000) (bvslt (currentBit!3262 (_2!2890 lt!95652)) #b00000000000000000000000000001000) (bvsge (currentByte!3267 (_2!2890 lt!95652)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3267 (_2!2890 lt!95652)) (size!1262 (buf!1643 (_2!2890 lt!95649)))) (and (= (currentBit!3262 (_2!2890 lt!95652)) #b00000000000000000000000000000000) (= (currentByte!3267 (_2!2890 lt!95652)) (size!1262 (buf!1643 (_2!2890 lt!95649))))))))))

(assert (=> b!61192 d!18906))

(declare-fun d!18908 () Bool)

(assert (=> d!18908 (= (invariant!0 (currentBit!3262 (_2!2890 lt!95649)) (currentByte!3267 (_2!2890 lt!95649)) (size!1262 (buf!1643 (_2!2890 lt!95649)))) (and (bvsge (currentBit!3262 (_2!2890 lt!95649)) #b00000000000000000000000000000000) (bvslt (currentBit!3262 (_2!2890 lt!95649)) #b00000000000000000000000000001000) (bvsge (currentByte!3267 (_2!2890 lt!95649)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3267 (_2!2890 lt!95649)) (size!1262 (buf!1643 (_2!2890 lt!95649)))) (and (= (currentBit!3262 (_2!2890 lt!95649)) #b00000000000000000000000000000000) (= (currentByte!3267 (_2!2890 lt!95649)) (size!1262 (buf!1643 (_2!2890 lt!95649))))))))))

(assert (=> b!61185 d!18908))

(declare-fun d!18910 () Bool)

(declare-fun res!51172 () Bool)

(declare-fun e!40940 () Bool)

(assert (=> d!18910 (=> (not res!51172) (not e!40940))))

(assert (=> d!18910 (= res!51172 (= (size!1262 (buf!1643 thiss!1379)) (size!1262 (buf!1643 (_2!2890 lt!95652)))))))

(assert (=> d!18910 (= (isPrefixOf!0 thiss!1379 (_2!2890 lt!95652)) e!40940)))

(declare-fun b!61438 () Bool)

(declare-fun res!51171 () Bool)

(assert (=> b!61438 (=> (not res!51171) (not e!40940))))

(assert (=> b!61438 (= res!51171 (bvsle (bitIndex!0 (size!1262 (buf!1643 thiss!1379)) (currentByte!3267 thiss!1379) (currentBit!3262 thiss!1379)) (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!95652))) (currentByte!3267 (_2!2890 lt!95652)) (currentBit!3262 (_2!2890 lt!95652)))))))

(declare-fun b!61439 () Bool)

(declare-fun e!40939 () Bool)

(assert (=> b!61439 (= e!40940 e!40939)))

(declare-fun res!51173 () Bool)

(assert (=> b!61439 (=> res!51173 e!40939)))

(assert (=> b!61439 (= res!51173 (= (size!1262 (buf!1643 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!61440 () Bool)

(assert (=> b!61440 (= e!40939 (arrayBitRangesEq!0 (buf!1643 thiss!1379) (buf!1643 (_2!2890 lt!95652)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1262 (buf!1643 thiss!1379)) (currentByte!3267 thiss!1379) (currentBit!3262 thiss!1379))))))

(assert (= (and d!18910 res!51172) b!61438))

(assert (= (and b!61438 res!51171) b!61439))

(assert (= (and b!61439 (not res!51173)) b!61440))

(assert (=> b!61438 m!96551))

(assert (=> b!61438 m!96601))

(assert (=> b!61440 m!96551))

(assert (=> b!61440 m!96551))

(declare-fun m!96973 () Bool)

(assert (=> b!61440 m!96973))

(assert (=> b!61183 d!18910))

(declare-fun d!18912 () Bool)

(assert (=> d!18912 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95652)))) ((_ sign_extend 32) (currentByte!3267 (_2!2890 lt!95652))) ((_ sign_extend 32) (currentBit!3262 (_2!2890 lt!95652))) lt!95653) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95652)))) ((_ sign_extend 32) (currentByte!3267 (_2!2890 lt!95652))) ((_ sign_extend 32) (currentBit!3262 (_2!2890 lt!95652)))) lt!95653))))

(declare-fun bs!4722 () Bool)

(assert (= bs!4722 d!18912))

(assert (=> bs!4722 m!96967))

(assert (=> b!61183 d!18912))

(declare-fun d!18914 () Bool)

(declare-fun e!40943 () Bool)

(assert (=> d!18914 e!40943))

(declare-fun res!51176 () Bool)

(assert (=> d!18914 (=> (not res!51176) (not e!40943))))

(assert (=> d!18914 (= res!51176 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!96017 () Unit!4171)

(declare-fun choose!27 (BitStream!2206 BitStream!2206 (_ BitVec 64) (_ BitVec 64)) Unit!4171)

(assert (=> d!18914 (= lt!96017 (choose!27 thiss!1379 (_2!2890 lt!95652) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!18914 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!18914 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2890 lt!95652) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!96017)))

(declare-fun b!61443 () Bool)

(assert (=> b!61443 (= e!40943 (validate_offset_bits!1 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95652)))) ((_ sign_extend 32) (currentByte!3267 (_2!2890 lt!95652))) ((_ sign_extend 32) (currentBit!3262 (_2!2890 lt!95652))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!18914 res!51176) b!61443))

(declare-fun m!96975 () Bool)

(assert (=> d!18914 m!96975))

(declare-fun m!96977 () Bool)

(assert (=> b!61443 m!96977))

(assert (=> b!61183 d!18914))

(declare-fun b!61480 () Bool)

(declare-fun res!51210 () Bool)

(declare-fun e!40962 () Bool)

(assert (=> b!61480 (=> (not res!51210) (not e!40962))))

(declare-fun lt!96109 () tuple2!5558)

(declare-fun lt!96116 () (_ BitVec 64))

(declare-fun lt!96114 () (_ BitVec 64))

(assert (=> b!61480 (= res!51210 (= (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!96109))) (currentByte!3267 (_2!2890 lt!96109)) (currentBit!3262 (_2!2890 lt!96109))) (bvadd lt!96116 lt!96114)))))

(assert (=> b!61480 (or (not (= (bvand lt!96116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!96114 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!96116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!96116 lt!96114) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61480 (= lt!96114 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!61480 (= lt!96116 (bitIndex!0 (size!1262 (buf!1643 thiss!1379)) (currentByte!3267 thiss!1379) (currentBit!3262 thiss!1379)))))

(declare-fun b!61481 () Bool)

(declare-fun res!51206 () Bool)

(declare-fun e!40961 () Bool)

(assert (=> b!61481 (=> (not res!51206) (not e!40961))))

(declare-fun lt!96106 () tuple2!5558)

(assert (=> b!61481 (= res!51206 (isPrefixOf!0 thiss!1379 (_2!2890 lt!96106)))))

(declare-fun b!61482 () Bool)

(declare-fun e!40963 () Bool)

(declare-datatypes ((tuple2!5586 0))(
  ( (tuple2!5587 (_1!2904 BitStream!2206) (_2!2904 Bool)) )
))
(declare-fun lt!96111 () tuple2!5586)

(assert (=> b!61482 (= e!40963 (= (bitIndex!0 (size!1262 (buf!1643 (_1!2904 lt!96111))) (currentByte!3267 (_1!2904 lt!96111)) (currentBit!3262 (_1!2904 lt!96111))) (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!96106))) (currentByte!3267 (_2!2890 lt!96106)) (currentBit!3262 (_2!2890 lt!96106)))))))

(declare-fun b!61483 () Bool)

(declare-fun res!51212 () Bool)

(assert (=> b!61483 (=> (not res!51212) (not e!40961))))

(assert (=> b!61483 (= res!51212 (= (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!96106))) (currentByte!3267 (_2!2890 lt!96106)) (currentBit!3262 (_2!2890 lt!96106))) (bvadd (bitIndex!0 (size!1262 (buf!1643 thiss!1379)) (currentByte!3267 thiss!1379) (currentBit!3262 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!61484 () Bool)

(declare-fun e!40960 () Bool)

(assert (=> b!61484 (= e!40962 e!40960)))

(declare-fun res!51211 () Bool)

(assert (=> b!61484 (=> (not res!51211) (not e!40960))))

(declare-fun lt!96108 () (_ BitVec 8))

(declare-fun lt!96115 () tuple2!5586)

(assert (=> b!61484 (= res!51211 (and (= (_2!2904 lt!96115) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1826 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!96108)) #b00000000000000000000000000000000))) (= (_1!2904 lt!96115) (_2!2890 lt!96109))))))

(declare-datatypes ((tuple2!5588 0))(
  ( (tuple2!5589 (_1!2905 array!2770) (_2!2905 BitStream!2206)) )
))
(declare-fun lt!96107 () tuple2!5588)

(declare-fun lt!96112 () BitStream!2206)

(declare-fun readBits!0 (BitStream!2206 (_ BitVec 64)) tuple2!5588)

(assert (=> b!61484 (= lt!96107 (readBits!0 lt!96112 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2206) tuple2!5586)

(assert (=> b!61484 (= lt!96115 (readBitPure!0 lt!96112))))

(declare-fun readerFrom!0 (BitStream!2206 (_ BitVec 32) (_ BitVec 32)) BitStream!2206)

(assert (=> b!61484 (= lt!96112 (readerFrom!0 (_2!2890 lt!96109) (currentBit!3262 thiss!1379) (currentByte!3267 thiss!1379)))))

(declare-fun d!18916 () Bool)

(assert (=> d!18916 e!40962))

(declare-fun res!51207 () Bool)

(assert (=> d!18916 (=> (not res!51207) (not e!40962))))

(assert (=> d!18916 (= res!51207 (= (size!1262 (buf!1643 (_2!2890 lt!96109))) (size!1262 (buf!1643 thiss!1379))))))

(declare-fun lt!96113 () array!2770)

(assert (=> d!18916 (= lt!96108 (select (arr!1826 lt!96113) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!18916 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1262 lt!96113)))))

(assert (=> d!18916 (= lt!96113 (array!2771 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!96110 () tuple2!5558)

(assert (=> d!18916 (= lt!96109 (tuple2!5559 (_1!2890 lt!96110) (_2!2890 lt!96110)))))

(assert (=> d!18916 (= lt!96110 lt!96106)))

(assert (=> d!18916 e!40961))

(declare-fun res!51205 () Bool)

(assert (=> d!18916 (=> (not res!51205) (not e!40961))))

(assert (=> d!18916 (= res!51205 (= (size!1262 (buf!1643 thiss!1379)) (size!1262 (buf!1643 (_2!2890 lt!96106)))))))

(declare-fun lt!96105 () Bool)

(declare-fun appendBit!0 (BitStream!2206 Bool) tuple2!5558)

(assert (=> d!18916 (= lt!96106 (appendBit!0 thiss!1379 lt!96105))))

(assert (=> d!18916 (= lt!96105 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1826 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!18916 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!18916 (= (appendBitFromByte!0 thiss!1379 (select (arr!1826 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!96109)))

(declare-fun b!61479 () Bool)

(assert (=> b!61479 (= e!40960 (= (bitIndex!0 (size!1262 (buf!1643 (_1!2904 lt!96115))) (currentByte!3267 (_1!2904 lt!96115)) (currentBit!3262 (_1!2904 lt!96115))) (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!96109))) (currentByte!3267 (_2!2890 lt!96109)) (currentBit!3262 (_2!2890 lt!96109)))))))

(declare-fun b!61485 () Bool)

(assert (=> b!61485 (= e!40961 e!40963)))

(declare-fun res!51208 () Bool)

(assert (=> b!61485 (=> (not res!51208) (not e!40963))))

(assert (=> b!61485 (= res!51208 (and (= (_2!2904 lt!96111) lt!96105) (= (_1!2904 lt!96111) (_2!2890 lt!96106))))))

(assert (=> b!61485 (= lt!96111 (readBitPure!0 (readerFrom!0 (_2!2890 lt!96106) (currentBit!3262 thiss!1379) (currentByte!3267 thiss!1379))))))

(declare-fun b!61486 () Bool)

(declare-fun res!51209 () Bool)

(assert (=> b!61486 (=> (not res!51209) (not e!40962))))

(assert (=> b!61486 (= res!51209 (isPrefixOf!0 thiss!1379 (_2!2890 lt!96109)))))

(assert (= (and d!18916 res!51205) b!61483))

(assert (= (and b!61483 res!51212) b!61481))

(assert (= (and b!61481 res!51206) b!61485))

(assert (= (and b!61485 res!51208) b!61482))

(assert (= (and d!18916 res!51207) b!61480))

(assert (= (and b!61480 res!51210) b!61486))

(assert (= (and b!61486 res!51209) b!61484))

(assert (= (and b!61484 res!51211) b!61479))

(declare-fun m!97009 () Bool)

(assert (=> b!61486 m!97009))

(declare-fun m!97011 () Bool)

(assert (=> b!61484 m!97011))

(declare-fun m!97013 () Bool)

(assert (=> b!61484 m!97013))

(declare-fun m!97015 () Bool)

(assert (=> b!61484 m!97015))

(declare-fun m!97017 () Bool)

(assert (=> b!61485 m!97017))

(assert (=> b!61485 m!97017))

(declare-fun m!97019 () Bool)

(assert (=> b!61485 m!97019))

(declare-fun m!97021 () Bool)

(assert (=> b!61483 m!97021))

(assert (=> b!61483 m!96551))

(declare-fun m!97023 () Bool)

(assert (=> d!18916 m!97023))

(declare-fun m!97025 () Bool)

(assert (=> d!18916 m!97025))

(declare-fun m!97027 () Bool)

(assert (=> d!18916 m!97027))

(declare-fun m!97029 () Bool)

(assert (=> b!61481 m!97029))

(declare-fun m!97031 () Bool)

(assert (=> b!61479 m!97031))

(declare-fun m!97033 () Bool)

(assert (=> b!61479 m!97033))

(declare-fun m!97035 () Bool)

(assert (=> b!61482 m!97035))

(assert (=> b!61482 m!97021))

(assert (=> b!61480 m!97033))

(assert (=> b!61480 m!96551))

(assert (=> b!61183 d!18916))

(declare-fun d!18924 () Bool)

(assert (=> d!18924 (= (head!497 (byteArrayBitContentToList!0 (_2!2890 lt!95652) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!793 (byteArrayBitContentToList!0 (_2!2890 lt!95652) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!61184 d!18924))

(declare-fun d!18926 () Bool)

(declare-fun c!4329 () Bool)

(assert (=> d!18926 (= c!4329 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!40966 () List!678)

(assert (=> d!18926 (= (byteArrayBitContentToList!0 (_2!2890 lt!95652) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!40966)))

(declare-fun b!61491 () Bool)

(assert (=> b!61491 (= e!40966 Nil!675)))

(declare-fun b!61492 () Bool)

(assert (=> b!61492 (= e!40966 (Cons!674 (not (= (bvand ((_ sign_extend 24) (select (arr!1826 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2890 lt!95652) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!18926 c!4329) b!61491))

(assert (= (and d!18926 (not c!4329)) b!61492))

(assert (=> b!61492 m!96537))

(assert (=> b!61492 m!97027))

(declare-fun m!97037 () Bool)

(assert (=> b!61492 m!97037))

(assert (=> b!61184 d!18926))

(declare-fun d!18928 () Bool)

(assert (=> d!18928 (= (head!497 (bitStreamReadBitsIntoList!0 (_2!2890 lt!95652) (_1!2891 lt!95651) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!793 (bitStreamReadBitsIntoList!0 (_2!2890 lt!95652) (_1!2891 lt!95651) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!61184 d!18928))

(declare-fun b!61495 () Bool)

(declare-fun e!40967 () Bool)

(declare-fun lt!96118 () List!678)

(assert (=> b!61495 (= e!40967 (isEmpty!184 lt!96118))))

(declare-fun d!18930 () Bool)

(assert (=> d!18930 e!40967))

(declare-fun c!4331 () Bool)

(assert (=> d!18930 (= c!4331 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!40968 () tuple2!5578)

(assert (=> d!18930 (= lt!96118 (_1!2900 e!40968))))

(declare-fun c!4330 () Bool)

(assert (=> d!18930 (= c!4330 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18930 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18930 (= (bitStreamReadBitsIntoList!0 (_2!2890 lt!95652) (_1!2891 lt!95651) #b0000000000000000000000000000000000000000000000000000000000000001) lt!96118)))

(declare-fun lt!96119 () (_ BitVec 64))

(declare-fun lt!96117 () tuple2!5580)

(declare-fun b!61494 () Bool)

(assert (=> b!61494 (= e!40968 (tuple2!5579 (Cons!674 (_1!2901 lt!96117) (bitStreamReadBitsIntoList!0 (_2!2890 lt!95652) (_2!2901 lt!96117) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!96119))) (_2!2901 lt!96117)))))

(assert (=> b!61494 (= lt!96117 (readBit!0 (_1!2891 lt!95651)))))

(assert (=> b!61494 (= lt!96119 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!61496 () Bool)

(assert (=> b!61496 (= e!40967 (> (length!306 lt!96118) 0))))

(declare-fun b!61493 () Bool)

(assert (=> b!61493 (= e!40968 (tuple2!5579 Nil!675 (_1!2891 lt!95651)))))

(assert (= (and d!18930 c!4330) b!61493))

(assert (= (and d!18930 (not c!4330)) b!61494))

(assert (= (and d!18930 c!4331) b!61495))

(assert (= (and d!18930 (not c!4331)) b!61496))

(declare-fun m!97039 () Bool)

(assert (=> b!61495 m!97039))

(declare-fun m!97041 () Bool)

(assert (=> b!61494 m!97041))

(declare-fun m!97043 () Bool)

(assert (=> b!61494 m!97043))

(declare-fun m!97045 () Bool)

(assert (=> b!61496 m!97045))

(assert (=> b!61184 d!18930))

(declare-fun d!18932 () Bool)

(declare-fun res!51214 () Bool)

(declare-fun e!40970 () Bool)

(assert (=> d!18932 (=> (not res!51214) (not e!40970))))

(assert (=> d!18932 (= res!51214 (= (size!1262 (buf!1643 thiss!1379)) (size!1262 (buf!1643 thiss!1379))))))

(assert (=> d!18932 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!40970)))

(declare-fun b!61497 () Bool)

(declare-fun res!51213 () Bool)

(assert (=> b!61497 (=> (not res!51213) (not e!40970))))

(assert (=> b!61497 (= res!51213 (bvsle (bitIndex!0 (size!1262 (buf!1643 thiss!1379)) (currentByte!3267 thiss!1379) (currentBit!3262 thiss!1379)) (bitIndex!0 (size!1262 (buf!1643 thiss!1379)) (currentByte!3267 thiss!1379) (currentBit!3262 thiss!1379))))))

(declare-fun b!61498 () Bool)

(declare-fun e!40969 () Bool)

(assert (=> b!61498 (= e!40970 e!40969)))

(declare-fun res!51215 () Bool)

(assert (=> b!61498 (=> res!51215 e!40969)))

(assert (=> b!61498 (= res!51215 (= (size!1262 (buf!1643 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!61499 () Bool)

(assert (=> b!61499 (= e!40969 (arrayBitRangesEq!0 (buf!1643 thiss!1379) (buf!1643 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1262 (buf!1643 thiss!1379)) (currentByte!3267 thiss!1379) (currentBit!3262 thiss!1379))))))

(assert (= (and d!18932 res!51214) b!61497))

(assert (= (and b!61497 res!51213) b!61498))

(assert (= (and b!61498 (not res!51215)) b!61499))

(assert (=> b!61497 m!96551))

(assert (=> b!61497 m!96551))

(assert (=> b!61499 m!96551))

(assert (=> b!61499 m!96551))

(declare-fun m!97047 () Bool)

(assert (=> b!61499 m!97047))

(assert (=> b!61187 d!18932))

(declare-fun d!18934 () Bool)

(assert (=> d!18934 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!96122 () Unit!4171)

(declare-fun choose!11 (BitStream!2206) Unit!4171)

(assert (=> d!18934 (= lt!96122 (choose!11 thiss!1379))))

(assert (=> d!18934 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!96122)))

(declare-fun bs!4725 () Bool)

(assert (= bs!4725 d!18934))

(assert (=> bs!4725 m!96547))

(declare-fun m!97049 () Bool)

(assert (=> bs!4725 m!97049))

(assert (=> b!61187 d!18934))

(declare-fun d!18936 () Bool)

(declare-fun e!40971 () Bool)

(assert (=> d!18936 e!40971))

(declare-fun res!51216 () Bool)

(assert (=> d!18936 (=> (not res!51216) (not e!40971))))

(declare-fun lt!96126 () (_ BitVec 64))

(declare-fun lt!96123 () (_ BitVec 64))

(declare-fun lt!96127 () (_ BitVec 64))

(assert (=> d!18936 (= res!51216 (= lt!96127 (bvsub lt!96126 lt!96123)))))

(assert (=> d!18936 (or (= (bvand lt!96126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!96123 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!96126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!96126 lt!96123) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18936 (= lt!96123 (remainingBits!0 ((_ sign_extend 32) (size!1262 (buf!1643 thiss!1379))) ((_ sign_extend 32) (currentByte!3267 thiss!1379)) ((_ sign_extend 32) (currentBit!3262 thiss!1379))))))

(declare-fun lt!96124 () (_ BitVec 64))

(declare-fun lt!96125 () (_ BitVec 64))

(assert (=> d!18936 (= lt!96126 (bvmul lt!96124 lt!96125))))

(assert (=> d!18936 (or (= lt!96124 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!96125 (bvsdiv (bvmul lt!96124 lt!96125) lt!96124)))))

(assert (=> d!18936 (= lt!96125 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18936 (= lt!96124 ((_ sign_extend 32) (size!1262 (buf!1643 thiss!1379))))))

(assert (=> d!18936 (= lt!96127 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3267 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3262 thiss!1379))))))

(assert (=> d!18936 (invariant!0 (currentBit!3262 thiss!1379) (currentByte!3267 thiss!1379) (size!1262 (buf!1643 thiss!1379)))))

(assert (=> d!18936 (= (bitIndex!0 (size!1262 (buf!1643 thiss!1379)) (currentByte!3267 thiss!1379) (currentBit!3262 thiss!1379)) lt!96127)))

(declare-fun b!61500 () Bool)

(declare-fun res!51217 () Bool)

(assert (=> b!61500 (=> (not res!51217) (not e!40971))))

(assert (=> b!61500 (= res!51217 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!96127))))

(declare-fun b!61501 () Bool)

(declare-fun lt!96128 () (_ BitVec 64))

(assert (=> b!61501 (= e!40971 (bvsle lt!96127 (bvmul lt!96128 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!61501 (or (= lt!96128 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!96128 #b0000000000000000000000000000000000000000000000000000000000001000) lt!96128)))))

(assert (=> b!61501 (= lt!96128 ((_ sign_extend 32) (size!1262 (buf!1643 thiss!1379))))))

(assert (= (and d!18936 res!51216) b!61500))

(assert (= (and b!61500 res!51217) b!61501))

(assert (=> d!18936 m!96969))

(assert (=> d!18936 m!96953))

(assert (=> b!61187 d!18936))

(declare-fun lt!96142 () tuple2!5560)

(declare-fun b!61502 () Bool)

(declare-fun lt!96148 () (_ BitVec 64))

(declare-fun lt!96140 () (_ BitVec 64))

(declare-fun e!40973 () Bool)

(assert (=> b!61502 (= e!40973 (= (_1!2891 lt!96142) (withMovedBitIndex!0 (_2!2891 lt!96142) (bvsub lt!96140 lt!96148))))))

(assert (=> b!61502 (or (= (bvand lt!96140 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!96148 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!96140 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!96140 lt!96148) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61502 (= lt!96148 (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!95652))) (currentByte!3267 (_2!2890 lt!95652)) (currentBit!3262 (_2!2890 lt!95652))))))

(assert (=> b!61502 (= lt!96140 (bitIndex!0 (size!1262 (buf!1643 thiss!1379)) (currentByte!3267 thiss!1379) (currentBit!3262 thiss!1379)))))

(declare-fun b!61503 () Bool)

(declare-fun e!40972 () Unit!4171)

(declare-fun lt!96137 () Unit!4171)

(assert (=> b!61503 (= e!40972 lt!96137)))

(declare-fun lt!96138 () (_ BitVec 64))

(assert (=> b!61503 (= lt!96138 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96134 () (_ BitVec 64))

(assert (=> b!61503 (= lt!96134 (bitIndex!0 (size!1262 (buf!1643 thiss!1379)) (currentByte!3267 thiss!1379) (currentBit!3262 thiss!1379)))))

(assert (=> b!61503 (= lt!96137 (arrayBitRangesEqSymmetric!0 (buf!1643 thiss!1379) (buf!1643 (_2!2890 lt!95652)) lt!96138 lt!96134))))

(assert (=> b!61503 (arrayBitRangesEq!0 (buf!1643 (_2!2890 lt!95652)) (buf!1643 thiss!1379) lt!96138 lt!96134)))

(declare-fun b!61504 () Bool)

(declare-fun res!51218 () Bool)

(assert (=> b!61504 (=> (not res!51218) (not e!40973))))

(assert (=> b!61504 (= res!51218 (isPrefixOf!0 (_1!2891 lt!96142) thiss!1379))))

(declare-fun b!61505 () Bool)

(declare-fun res!51220 () Bool)

(assert (=> b!61505 (=> (not res!51220) (not e!40973))))

(assert (=> b!61505 (= res!51220 (isPrefixOf!0 (_2!2891 lt!96142) (_2!2890 lt!95652)))))

(declare-fun b!61506 () Bool)

(declare-fun Unit!4191 () Unit!4171)

(assert (=> b!61506 (= e!40972 Unit!4191)))

(declare-fun d!18938 () Bool)

(assert (=> d!18938 e!40973))

(declare-fun res!51219 () Bool)

(assert (=> d!18938 (=> (not res!51219) (not e!40973))))

(assert (=> d!18938 (= res!51219 (isPrefixOf!0 (_1!2891 lt!96142) (_2!2891 lt!96142)))))

(declare-fun lt!96133 () BitStream!2206)

(assert (=> d!18938 (= lt!96142 (tuple2!5561 lt!96133 (_2!2890 lt!95652)))))

(declare-fun lt!96147 () Unit!4171)

(declare-fun lt!96129 () Unit!4171)

(assert (=> d!18938 (= lt!96147 lt!96129)))

(assert (=> d!18938 (isPrefixOf!0 lt!96133 (_2!2890 lt!95652))))

(assert (=> d!18938 (= lt!96129 (lemmaIsPrefixTransitive!0 lt!96133 (_2!2890 lt!95652) (_2!2890 lt!95652)))))

(declare-fun lt!96141 () Unit!4171)

(declare-fun lt!96136 () Unit!4171)

(assert (=> d!18938 (= lt!96141 lt!96136)))

(assert (=> d!18938 (isPrefixOf!0 lt!96133 (_2!2890 lt!95652))))

(assert (=> d!18938 (= lt!96136 (lemmaIsPrefixTransitive!0 lt!96133 thiss!1379 (_2!2890 lt!95652)))))

(declare-fun lt!96143 () Unit!4171)

(assert (=> d!18938 (= lt!96143 e!40972)))

(declare-fun c!4332 () Bool)

(assert (=> d!18938 (= c!4332 (not (= (size!1262 (buf!1643 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!96131 () Unit!4171)

(declare-fun lt!96144 () Unit!4171)

(assert (=> d!18938 (= lt!96131 lt!96144)))

(assert (=> d!18938 (isPrefixOf!0 (_2!2890 lt!95652) (_2!2890 lt!95652))))

(assert (=> d!18938 (= lt!96144 (lemmaIsPrefixRefl!0 (_2!2890 lt!95652)))))

(declare-fun lt!96130 () Unit!4171)

(declare-fun lt!96135 () Unit!4171)

(assert (=> d!18938 (= lt!96130 lt!96135)))

(assert (=> d!18938 (= lt!96135 (lemmaIsPrefixRefl!0 (_2!2890 lt!95652)))))

(declare-fun lt!96146 () Unit!4171)

(declare-fun lt!96145 () Unit!4171)

(assert (=> d!18938 (= lt!96146 lt!96145)))

(assert (=> d!18938 (isPrefixOf!0 lt!96133 lt!96133)))

(assert (=> d!18938 (= lt!96145 (lemmaIsPrefixRefl!0 lt!96133))))

(declare-fun lt!96132 () Unit!4171)

(declare-fun lt!96139 () Unit!4171)

(assert (=> d!18938 (= lt!96132 lt!96139)))

(assert (=> d!18938 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!18938 (= lt!96139 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!18938 (= lt!96133 (BitStream!2207 (buf!1643 (_2!2890 lt!95652)) (currentByte!3267 thiss!1379) (currentBit!3262 thiss!1379)))))

(assert (=> d!18938 (isPrefixOf!0 thiss!1379 (_2!2890 lt!95652))))

(assert (=> d!18938 (= (reader!0 thiss!1379 (_2!2890 lt!95652)) lt!96142)))

(assert (= (and d!18938 c!4332) b!61503))

(assert (= (and d!18938 (not c!4332)) b!61506))

(assert (= (and d!18938 res!51219) b!61504))

(assert (= (and b!61504 res!51218) b!61505))

(assert (= (and b!61505 res!51220) b!61502))

(assert (=> b!61503 m!96551))

(declare-fun m!97051 () Bool)

(assert (=> b!61503 m!97051))

(declare-fun m!97053 () Bool)

(assert (=> b!61503 m!97053))

(assert (=> d!18938 m!96897))

(declare-fun m!97055 () Bool)

(assert (=> d!18938 m!97055))

(declare-fun m!97057 () Bool)

(assert (=> d!18938 m!97057))

(declare-fun m!97059 () Bool)

(assert (=> d!18938 m!97059))

(declare-fun m!97061 () Bool)

(assert (=> d!18938 m!97061))

(assert (=> d!18938 m!96547))

(assert (=> d!18938 m!96539))

(declare-fun m!97063 () Bool)

(assert (=> d!18938 m!97063))

(assert (=> d!18938 m!96891))

(assert (=> d!18938 m!96549))

(declare-fun m!97065 () Bool)

(assert (=> d!18938 m!97065))

(declare-fun m!97067 () Bool)

(assert (=> b!61505 m!97067))

(declare-fun m!97069 () Bool)

(assert (=> b!61502 m!97069))

(assert (=> b!61502 m!96601))

(assert (=> b!61502 m!96551))

(declare-fun m!97071 () Bool)

(assert (=> b!61504 m!97071))

(assert (=> b!61177 d!18938))

(declare-fun d!18940 () Bool)

(assert (=> d!18940 (isPrefixOf!0 thiss!1379 (_2!2890 lt!95649))))

(declare-fun lt!96151 () Unit!4171)

(declare-fun choose!30 (BitStream!2206 BitStream!2206 BitStream!2206) Unit!4171)

(assert (=> d!18940 (= lt!96151 (choose!30 thiss!1379 (_2!2890 lt!95652) (_2!2890 lt!95649)))))

(assert (=> d!18940 (isPrefixOf!0 thiss!1379 (_2!2890 lt!95652))))

(assert (=> d!18940 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2890 lt!95652) (_2!2890 lt!95649)) lt!96151)))

(declare-fun bs!4726 () Bool)

(assert (= bs!4726 d!18940))

(assert (=> bs!4726 m!96557))

(declare-fun m!97073 () Bool)

(assert (=> bs!4726 m!97073))

(assert (=> bs!4726 m!96539))

(assert (=> b!61177 d!18940))

(declare-fun d!18942 () Bool)

(declare-fun res!51222 () Bool)

(declare-fun e!40975 () Bool)

(assert (=> d!18942 (=> (not res!51222) (not e!40975))))

(assert (=> d!18942 (= res!51222 (= (size!1262 (buf!1643 thiss!1379)) (size!1262 (buf!1643 (_2!2890 lt!95649)))))))

(assert (=> d!18942 (= (isPrefixOf!0 thiss!1379 (_2!2890 lt!95649)) e!40975)))

(declare-fun b!61507 () Bool)

(declare-fun res!51221 () Bool)

(assert (=> b!61507 (=> (not res!51221) (not e!40975))))

(assert (=> b!61507 (= res!51221 (bvsle (bitIndex!0 (size!1262 (buf!1643 thiss!1379)) (currentByte!3267 thiss!1379) (currentBit!3262 thiss!1379)) (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!95649))) (currentByte!3267 (_2!2890 lt!95649)) (currentBit!3262 (_2!2890 lt!95649)))))))

(declare-fun b!61508 () Bool)

(declare-fun e!40974 () Bool)

(assert (=> b!61508 (= e!40975 e!40974)))

(declare-fun res!51223 () Bool)

(assert (=> b!61508 (=> res!51223 e!40974)))

(assert (=> b!61508 (= res!51223 (= (size!1262 (buf!1643 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!61509 () Bool)

(assert (=> b!61509 (= e!40974 (arrayBitRangesEq!0 (buf!1643 thiss!1379) (buf!1643 (_2!2890 lt!95649)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1262 (buf!1643 thiss!1379)) (currentByte!3267 thiss!1379) (currentBit!3262 thiss!1379))))))

(assert (= (and d!18942 res!51222) b!61507))

(assert (= (and b!61507 res!51221) b!61508))

(assert (= (and b!61508 (not res!51223)) b!61509))

(assert (=> b!61507 m!96551))

(assert (=> b!61507 m!96567))

(assert (=> b!61509 m!96551))

(assert (=> b!61509 m!96551))

(declare-fun m!97075 () Bool)

(assert (=> b!61509 m!97075))

(assert (=> b!61177 d!18942))

(declare-fun d!18944 () Bool)

(assert (=> d!18944 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95652)))) ((_ sign_extend 32) (currentByte!3267 thiss!1379)) ((_ sign_extend 32) (currentBit!3262 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95652)))) ((_ sign_extend 32) (currentByte!3267 thiss!1379)) ((_ sign_extend 32) (currentBit!3262 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4727 () Bool)

(assert (= bs!4727 d!18944))

(declare-fun m!97077 () Bool)

(assert (=> bs!4727 m!97077))

(assert (=> b!61177 d!18944))

(declare-fun d!18946 () Bool)

(assert (=> d!18946 (validate_offset_bits!1 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95652)))) ((_ sign_extend 32) (currentByte!3267 thiss!1379)) ((_ sign_extend 32) (currentBit!3262 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!96152 () Unit!4171)

(assert (=> d!18946 (= lt!96152 (choose!9 thiss!1379 (buf!1643 (_2!2890 lt!95652)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2207 (buf!1643 (_2!2890 lt!95652)) (currentByte!3267 thiss!1379) (currentBit!3262 thiss!1379))))))

(assert (=> d!18946 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1643 (_2!2890 lt!95652)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!96152)))

(declare-fun bs!4728 () Bool)

(assert (= bs!4728 d!18946))

(assert (=> bs!4728 m!96563))

(declare-fun m!97079 () Bool)

(assert (=> bs!4728 m!97079))

(assert (=> b!61177 d!18946))

(declare-fun b!61642 () Bool)

(declare-fun res!51328 () Bool)

(declare-fun e!41039 () Bool)

(assert (=> b!61642 (=> (not res!51328) (not e!41039))))

(declare-fun lt!96611 () tuple2!5558)

(assert (=> b!61642 (= res!51328 (= (size!1262 (buf!1643 (_2!2890 lt!95652))) (size!1262 (buf!1643 (_2!2890 lt!96611)))))))

(declare-fun call!781 () tuple2!5560)

(declare-fun c!4347 () Bool)

(declare-fun bm!778 () Bool)

(declare-fun lt!96627 () tuple2!5558)

(assert (=> bm!778 (= call!781 (reader!0 (_2!2890 lt!95652) (ite c!4347 (_2!2890 lt!96627) (_2!2890 lt!95652))))))

(declare-fun d!18948 () Bool)

(assert (=> d!18948 e!41039))

(declare-fun res!51327 () Bool)

(assert (=> d!18948 (=> (not res!51327) (not e!41039))))

(declare-fun lt!96615 () (_ BitVec 64))

(assert (=> d!18948 (= res!51327 (= (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!96611))) (currentByte!3267 (_2!2890 lt!96611)) (currentBit!3262 (_2!2890 lt!96611))) (bvsub lt!96615 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!18948 (or (= (bvand lt!96615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!96615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!96615 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!96588 () (_ BitVec 64))

(assert (=> d!18948 (= lt!96615 (bvadd lt!96588 to!314))))

(assert (=> d!18948 (or (not (= (bvand lt!96588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!96588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!96588 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18948 (= lt!96588 (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!95652))) (currentByte!3267 (_2!2890 lt!95652)) (currentBit!3262 (_2!2890 lt!95652))))))

(declare-fun e!41040 () tuple2!5558)

(assert (=> d!18948 (= lt!96611 e!41040)))

(assert (=> d!18948 (= c!4347 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!96604 () Unit!4171)

(declare-fun lt!96612 () Unit!4171)

(assert (=> d!18948 (= lt!96604 lt!96612)))

(assert (=> d!18948 (isPrefixOf!0 (_2!2890 lt!95652) (_2!2890 lt!95652))))

(assert (=> d!18948 (= lt!96612 (lemmaIsPrefixRefl!0 (_2!2890 lt!95652)))))

(declare-fun lt!96600 () (_ BitVec 64))

(assert (=> d!18948 (= lt!96600 (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!95652))) (currentByte!3267 (_2!2890 lt!95652)) (currentBit!3262 (_2!2890 lt!95652))))))

(assert (=> d!18948 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18948 (= (appendBitsMSBFirstLoop!0 (_2!2890 lt!95652) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!96611)))

(declare-fun b!61643 () Bool)

(declare-fun res!51331 () Bool)

(assert (=> b!61643 (=> (not res!51331) (not e!41039))))

(assert (=> b!61643 (= res!51331 (isPrefixOf!0 (_2!2890 lt!95652) (_2!2890 lt!96611)))))

(declare-fun b!61644 () Bool)

(declare-fun lt!96626 () tuple2!5558)

(declare-fun Unit!4196 () Unit!4171)

(assert (=> b!61644 (= e!41040 (tuple2!5559 Unit!4196 (_2!2890 lt!96626)))))

(assert (=> b!61644 (= lt!96627 (appendBitFromByte!0 (_2!2890 lt!95652) (select (arr!1826 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!96614 () (_ BitVec 64))

(assert (=> b!61644 (= lt!96614 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!96608 () (_ BitVec 64))

(assert (=> b!61644 (= lt!96608 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!96630 () Unit!4171)

(assert (=> b!61644 (= lt!96630 (validateOffsetBitsIneqLemma!0 (_2!2890 lt!95652) (_2!2890 lt!96627) lt!96614 lt!96608))))

(assert (=> b!61644 (validate_offset_bits!1 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!96627)))) ((_ sign_extend 32) (currentByte!3267 (_2!2890 lt!96627))) ((_ sign_extend 32) (currentBit!3262 (_2!2890 lt!96627))) (bvsub lt!96614 lt!96608))))

(declare-fun lt!96602 () Unit!4171)

(assert (=> b!61644 (= lt!96602 lt!96630)))

(declare-fun lt!96622 () tuple2!5560)

(assert (=> b!61644 (= lt!96622 call!781)))

(declare-fun lt!96619 () (_ BitVec 64))

(assert (=> b!61644 (= lt!96619 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!96596 () Unit!4171)

(assert (=> b!61644 (= lt!96596 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2890 lt!95652) (buf!1643 (_2!2890 lt!96627)) lt!96619))))

(assert (=> b!61644 (validate_offset_bits!1 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!96627)))) ((_ sign_extend 32) (currentByte!3267 (_2!2890 lt!95652))) ((_ sign_extend 32) (currentBit!3262 (_2!2890 lt!95652))) lt!96619)))

(declare-fun lt!96601 () Unit!4171)

(assert (=> b!61644 (= lt!96601 lt!96596)))

(assert (=> b!61644 (= (head!497 (byteArrayBitContentToList!0 (_2!2890 lt!96627) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!497 (bitStreamReadBitsIntoList!0 (_2!2890 lt!96627) (_1!2891 lt!96622) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!96591 () Unit!4171)

(declare-fun Unit!4197 () Unit!4171)

(assert (=> b!61644 (= lt!96591 Unit!4197)))

(assert (=> b!61644 (= lt!96626 (appendBitsMSBFirstLoop!0 (_2!2890 lt!96627) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!96631 () Unit!4171)

(assert (=> b!61644 (= lt!96631 (lemmaIsPrefixTransitive!0 (_2!2890 lt!95652) (_2!2890 lt!96627) (_2!2890 lt!96626)))))

(assert (=> b!61644 (isPrefixOf!0 (_2!2890 lt!95652) (_2!2890 lt!96626))))

(declare-fun lt!96621 () Unit!4171)

(assert (=> b!61644 (= lt!96621 lt!96631)))

(assert (=> b!61644 (= (size!1262 (buf!1643 (_2!2890 lt!96626))) (size!1262 (buf!1643 (_2!2890 lt!95652))))))

(declare-fun lt!96605 () Unit!4171)

(declare-fun Unit!4198 () Unit!4171)

(assert (=> b!61644 (= lt!96605 Unit!4198)))

(assert (=> b!61644 (= (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!96626))) (currentByte!3267 (_2!2890 lt!96626)) (currentBit!3262 (_2!2890 lt!96626))) (bvsub (bvadd (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!95652))) (currentByte!3267 (_2!2890 lt!95652)) (currentBit!3262 (_2!2890 lt!95652))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!96597 () Unit!4171)

(declare-fun Unit!4199 () Unit!4171)

(assert (=> b!61644 (= lt!96597 Unit!4199)))

(assert (=> b!61644 (= (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!96626))) (currentByte!3267 (_2!2890 lt!96626)) (currentBit!3262 (_2!2890 lt!96626))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!96627))) (currentByte!3267 (_2!2890 lt!96627)) (currentBit!3262 (_2!2890 lt!96627))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!96607 () Unit!4171)

(declare-fun Unit!4201 () Unit!4171)

(assert (=> b!61644 (= lt!96607 Unit!4201)))

(declare-fun lt!96590 () tuple2!5560)

(assert (=> b!61644 (= lt!96590 (reader!0 (_2!2890 lt!95652) (_2!2890 lt!96626)))))

(declare-fun lt!96589 () (_ BitVec 64))

(assert (=> b!61644 (= lt!96589 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!96609 () Unit!4171)

(assert (=> b!61644 (= lt!96609 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2890 lt!95652) (buf!1643 (_2!2890 lt!96626)) lt!96589))))

(assert (=> b!61644 (validate_offset_bits!1 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!96626)))) ((_ sign_extend 32) (currentByte!3267 (_2!2890 lt!95652))) ((_ sign_extend 32) (currentBit!3262 (_2!2890 lt!95652))) lt!96589)))

(declare-fun lt!96610 () Unit!4171)

(assert (=> b!61644 (= lt!96610 lt!96609)))

(declare-fun lt!96620 () tuple2!5560)

(assert (=> b!61644 (= lt!96620 (reader!0 (_2!2890 lt!96627) (_2!2890 lt!96626)))))

(declare-fun lt!96617 () (_ BitVec 64))

(assert (=> b!61644 (= lt!96617 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!96592 () Unit!4171)

(assert (=> b!61644 (= lt!96592 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2890 lt!96627) (buf!1643 (_2!2890 lt!96626)) lt!96617))))

(assert (=> b!61644 (validate_offset_bits!1 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!96626)))) ((_ sign_extend 32) (currentByte!3267 (_2!2890 lt!96627))) ((_ sign_extend 32) (currentBit!3262 (_2!2890 lt!96627))) lt!96617)))

(declare-fun lt!96628 () Unit!4171)

(assert (=> b!61644 (= lt!96628 lt!96592)))

(declare-fun lt!96594 () List!678)

(assert (=> b!61644 (= lt!96594 (byteArrayBitContentToList!0 (_2!2890 lt!96626) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!96616 () List!678)

(assert (=> b!61644 (= lt!96616 (byteArrayBitContentToList!0 (_2!2890 lt!96626) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!96618 () List!678)

(assert (=> b!61644 (= lt!96618 (bitStreamReadBitsIntoList!0 (_2!2890 lt!96626) (_1!2891 lt!96590) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!96599 () List!678)

(assert (=> b!61644 (= lt!96599 (bitStreamReadBitsIntoList!0 (_2!2890 lt!96626) (_1!2891 lt!96620) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!96595 () (_ BitVec 64))

(assert (=> b!61644 (= lt!96595 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!96623 () Unit!4171)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2206 BitStream!2206 BitStream!2206 BitStream!2206 (_ BitVec 64) List!678) Unit!4171)

(assert (=> b!61644 (= lt!96623 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2890 lt!96626) (_2!2890 lt!96626) (_1!2891 lt!96590) (_1!2891 lt!96620) lt!96595 lt!96618))))

(declare-fun tail!287 (List!678) List!678)

(assert (=> b!61644 (= (bitStreamReadBitsIntoList!0 (_2!2890 lt!96626) (_1!2891 lt!96620) (bvsub lt!96595 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!287 lt!96618))))

(declare-fun lt!96598 () Unit!4171)

(assert (=> b!61644 (= lt!96598 lt!96623)))

(declare-fun lt!96625 () Unit!4171)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2770 array!2770 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4171)

(assert (=> b!61644 (= lt!96625 (arrayBitRangesEqImpliesEq!0 (buf!1643 (_2!2890 lt!96627)) (buf!1643 (_2!2890 lt!96626)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!96600 (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!96627))) (currentByte!3267 (_2!2890 lt!96627)) (currentBit!3262 (_2!2890 lt!96627)))))))

(declare-fun bitAt!0 (array!2770 (_ BitVec 64)) Bool)

(assert (=> b!61644 (= (bitAt!0 (buf!1643 (_2!2890 lt!96627)) lt!96600) (bitAt!0 (buf!1643 (_2!2890 lt!96626)) lt!96600))))

(declare-fun lt!96624 () Unit!4171)

(assert (=> b!61644 (= lt!96624 lt!96625)))

(declare-fun b!61645 () Bool)

(declare-fun res!51329 () Bool)

(assert (=> b!61645 (=> (not res!51329) (not e!41039))))

(assert (=> b!61645 (= res!51329 (invariant!0 (currentBit!3262 (_2!2890 lt!96611)) (currentByte!3267 (_2!2890 lt!96611)) (size!1262 (buf!1643 (_2!2890 lt!96611)))))))

(declare-fun lt!96603 () tuple2!5560)

(declare-fun b!61646 () Bool)

(assert (=> b!61646 (= e!41039 (= (bitStreamReadBitsIntoList!0 (_2!2890 lt!96611) (_1!2891 lt!96603) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2890 lt!96611) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!61646 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61646 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!96593 () Unit!4171)

(declare-fun lt!96606 () Unit!4171)

(assert (=> b!61646 (= lt!96593 lt!96606)))

(declare-fun lt!96629 () (_ BitVec 64))

(assert (=> b!61646 (validate_offset_bits!1 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!96611)))) ((_ sign_extend 32) (currentByte!3267 (_2!2890 lt!95652))) ((_ sign_extend 32) (currentBit!3262 (_2!2890 lt!95652))) lt!96629)))

(assert (=> b!61646 (= lt!96606 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2890 lt!95652) (buf!1643 (_2!2890 lt!96611)) lt!96629))))

(declare-fun e!41041 () Bool)

(assert (=> b!61646 e!41041))

(declare-fun res!51330 () Bool)

(assert (=> b!61646 (=> (not res!51330) (not e!41041))))

(assert (=> b!61646 (= res!51330 (and (= (size!1262 (buf!1643 (_2!2890 lt!95652))) (size!1262 (buf!1643 (_2!2890 lt!96611)))) (bvsge lt!96629 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61646 (= lt!96629 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!61646 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61646 (= lt!96603 (reader!0 (_2!2890 lt!95652) (_2!2890 lt!96611)))))

(declare-fun b!61647 () Bool)

(declare-fun res!51332 () Bool)

(assert (=> b!61647 (=> (not res!51332) (not e!41039))))

(assert (=> b!61647 (= res!51332 (= (size!1262 (buf!1643 (_2!2890 lt!96611))) (size!1262 (buf!1643 (_2!2890 lt!95652)))))))

(declare-fun b!61648 () Bool)

(declare-fun Unit!4203 () Unit!4171)

(assert (=> b!61648 (= e!41040 (tuple2!5559 Unit!4203 (_2!2890 lt!95652)))))

(assert (=> b!61648 (= (size!1262 (buf!1643 (_2!2890 lt!95652))) (size!1262 (buf!1643 (_2!2890 lt!95652))))))

(declare-fun lt!96613 () Unit!4171)

(declare-fun Unit!4204 () Unit!4171)

(assert (=> b!61648 (= lt!96613 Unit!4204)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2206 array!2770 array!2770 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!61648 (checkByteArrayBitContent!0 (_2!2890 lt!95652) srcBuffer!2 (_1!2905 (readBits!0 (_1!2891 call!781) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!61649 () Bool)

(assert (=> b!61649 (= e!41041 (validate_offset_bits!1 ((_ sign_extend 32) (size!1262 (buf!1643 (_2!2890 lt!95652)))) ((_ sign_extend 32) (currentByte!3267 (_2!2890 lt!95652))) ((_ sign_extend 32) (currentBit!3262 (_2!2890 lt!95652))) lt!96629))))

(assert (= (and d!18948 c!4347) b!61644))

(assert (= (and d!18948 (not c!4347)) b!61648))

(assert (= (or b!61644 b!61648) bm!778))

(assert (= (and d!18948 res!51327) b!61645))

(assert (= (and b!61645 res!51329) b!61642))

(assert (= (and b!61642 res!51328) b!61643))

(assert (= (and b!61643 res!51331) b!61647))

(assert (= (and b!61647 res!51332) b!61646))

(assert (= (and b!61646 res!51330) b!61649))

(declare-fun m!97349 () Bool)

(assert (=> b!61646 m!97349))

(declare-fun m!97351 () Bool)

(assert (=> b!61646 m!97351))

(declare-fun m!97353 () Bool)

(assert (=> b!61646 m!97353))

(declare-fun m!97355 () Bool)

(assert (=> b!61646 m!97355))

(declare-fun m!97357 () Bool)

(assert (=> b!61646 m!97357))

(declare-fun m!97359 () Bool)

(assert (=> d!18948 m!97359))

(assert (=> d!18948 m!96601))

(assert (=> d!18948 m!96891))

(assert (=> d!18948 m!96897))

(declare-fun m!97361 () Bool)

(assert (=> bm!778 m!97361))

(declare-fun m!97363 () Bool)

(assert (=> b!61648 m!97363))

(declare-fun m!97365 () Bool)

(assert (=> b!61648 m!97365))

(declare-fun m!97367 () Bool)

(assert (=> b!61643 m!97367))

(declare-fun m!97369 () Bool)

(assert (=> b!61649 m!97369))

(declare-fun m!97371 () Bool)

(assert (=> b!61644 m!97371))

(declare-fun m!97373 () Bool)

(assert (=> b!61644 m!97373))

(assert (=> b!61644 m!96601))

(declare-fun m!97375 () Bool)

(assert (=> b!61644 m!97375))

(declare-fun m!97377 () Bool)

(assert (=> b!61644 m!97377))

(declare-fun m!97379 () Bool)

(assert (=> b!61644 m!97379))

(declare-fun m!97381 () Bool)

(assert (=> b!61644 m!97381))

(declare-fun m!97383 () Bool)

(assert (=> b!61644 m!97383))

(declare-fun m!97385 () Bool)

(assert (=> b!61644 m!97385))

(declare-fun m!97387 () Bool)

(assert (=> b!61644 m!97387))

(declare-fun m!97389 () Bool)

(assert (=> b!61644 m!97389))

(declare-fun m!97391 () Bool)

(assert (=> b!61644 m!97391))

(declare-fun m!97393 () Bool)

(assert (=> b!61644 m!97393))

(declare-fun m!97395 () Bool)

(assert (=> b!61644 m!97395))

(declare-fun m!97397 () Bool)

(assert (=> b!61644 m!97397))

(declare-fun m!97399 () Bool)

(assert (=> b!61644 m!97399))

(declare-fun m!97401 () Bool)

(assert (=> b!61644 m!97401))

(declare-fun m!97403 () Bool)

(assert (=> b!61644 m!97403))

(declare-fun m!97405 () Bool)

(assert (=> b!61644 m!97405))

(declare-fun m!97407 () Bool)

(assert (=> b!61644 m!97407))

(declare-fun m!97409 () Bool)

(assert (=> b!61644 m!97409))

(assert (=> b!61644 m!97379))

(declare-fun m!97411 () Bool)

(assert (=> b!61644 m!97411))

(declare-fun m!97413 () Bool)

(assert (=> b!61644 m!97413))

(declare-fun m!97415 () Bool)

(assert (=> b!61644 m!97415))

(assert (=> b!61644 m!97377))

(declare-fun m!97417 () Bool)

(assert (=> b!61644 m!97417))

(assert (=> b!61644 m!97389))

(declare-fun m!97419 () Bool)

(assert (=> b!61644 m!97419))

(declare-fun m!97421 () Bool)

(assert (=> b!61644 m!97421))

(declare-fun m!97423 () Bool)

(assert (=> b!61644 m!97423))

(declare-fun m!97425 () Bool)

(assert (=> b!61644 m!97425))

(assert (=> b!61644 m!97413))

(declare-fun m!97427 () Bool)

(assert (=> b!61644 m!97427))

(declare-fun m!97429 () Bool)

(assert (=> b!61644 m!97429))

(declare-fun m!97431 () Bool)

(assert (=> b!61644 m!97431))

(declare-fun m!97433 () Bool)

(assert (=> b!61645 m!97433))

(assert (=> b!61177 d!18948))

(declare-fun d!19006 () Bool)

(declare-fun res!51334 () Bool)

(declare-fun e!41043 () Bool)

(assert (=> d!19006 (=> (not res!51334) (not e!41043))))

(assert (=> d!19006 (= res!51334 (= (size!1262 (buf!1643 (_2!2890 lt!95652))) (size!1262 (buf!1643 (_2!2890 lt!95649)))))))

(assert (=> d!19006 (= (isPrefixOf!0 (_2!2890 lt!95652) (_2!2890 lt!95649)) e!41043)))

(declare-fun b!61650 () Bool)

(declare-fun res!51333 () Bool)

(assert (=> b!61650 (=> (not res!51333) (not e!41043))))

(assert (=> b!61650 (= res!51333 (bvsle (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!95652))) (currentByte!3267 (_2!2890 lt!95652)) (currentBit!3262 (_2!2890 lt!95652))) (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!95649))) (currentByte!3267 (_2!2890 lt!95649)) (currentBit!3262 (_2!2890 lt!95649)))))))

(declare-fun b!61651 () Bool)

(declare-fun e!41042 () Bool)

(assert (=> b!61651 (= e!41043 e!41042)))

(declare-fun res!51335 () Bool)

(assert (=> b!61651 (=> res!51335 e!41042)))

(assert (=> b!61651 (= res!51335 (= (size!1262 (buf!1643 (_2!2890 lt!95652))) #b00000000000000000000000000000000))))

(declare-fun b!61652 () Bool)

(assert (=> b!61652 (= e!41042 (arrayBitRangesEq!0 (buf!1643 (_2!2890 lt!95652)) (buf!1643 (_2!2890 lt!95649)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!95652))) (currentByte!3267 (_2!2890 lt!95652)) (currentBit!3262 (_2!2890 lt!95652)))))))

(assert (= (and d!19006 res!51334) b!61650))

(assert (= (and b!61650 res!51333) b!61651))

(assert (= (and b!61651 (not res!51335)) b!61652))

(assert (=> b!61650 m!96601))

(assert (=> b!61650 m!96567))

(assert (=> b!61652 m!96601))

(assert (=> b!61652 m!96601))

(declare-fun m!97435 () Bool)

(assert (=> b!61652 m!97435))

(assert (=> b!61177 d!19006))

(declare-fun d!19008 () Bool)

(declare-fun res!51337 () Bool)

(declare-fun e!41045 () Bool)

(assert (=> d!19008 (=> (not res!51337) (not e!41045))))

(assert (=> d!19008 (= res!51337 (= (size!1262 (buf!1643 (_1!2891 lt!95643))) (size!1262 (buf!1643 (_2!2890 lt!95649)))))))

(assert (=> d!19008 (= (isPrefixOf!0 (_1!2891 lt!95643) (_2!2890 lt!95649)) e!41045)))

(declare-fun b!61653 () Bool)

(declare-fun res!51336 () Bool)

(assert (=> b!61653 (=> (not res!51336) (not e!41045))))

(assert (=> b!61653 (= res!51336 (bvsle (bitIndex!0 (size!1262 (buf!1643 (_1!2891 lt!95643))) (currentByte!3267 (_1!2891 lt!95643)) (currentBit!3262 (_1!2891 lt!95643))) (bitIndex!0 (size!1262 (buf!1643 (_2!2890 lt!95649))) (currentByte!3267 (_2!2890 lt!95649)) (currentBit!3262 (_2!2890 lt!95649)))))))

(declare-fun b!61654 () Bool)

(declare-fun e!41044 () Bool)

(assert (=> b!61654 (= e!41045 e!41044)))

(declare-fun res!51338 () Bool)

(assert (=> b!61654 (=> res!51338 e!41044)))

(assert (=> b!61654 (= res!51338 (= (size!1262 (buf!1643 (_1!2891 lt!95643))) #b00000000000000000000000000000000))))

(declare-fun b!61655 () Bool)

(assert (=> b!61655 (= e!41044 (arrayBitRangesEq!0 (buf!1643 (_1!2891 lt!95643)) (buf!1643 (_2!2890 lt!95649)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1262 (buf!1643 (_1!2891 lt!95643))) (currentByte!3267 (_1!2891 lt!95643)) (currentBit!3262 (_1!2891 lt!95643)))))))

(assert (= (and d!19008 res!51337) b!61653))

(assert (= (and b!61653 res!51336) b!61654))

(assert (= (and b!61654 (not res!51338)) b!61655))

(declare-fun m!97437 () Bool)

(assert (=> b!61653 m!97437))

(assert (=> b!61653 m!96567))

(assert (=> b!61655 m!97437))

(assert (=> b!61655 m!97437))

(declare-fun m!97439 () Bool)

(assert (=> b!61655 m!97439))

(assert (=> b!61188 d!19008))

(declare-fun d!19010 () Bool)

(assert (=> d!19010 (= (array_inv!1162 (buf!1643 thiss!1379)) (bvsge (size!1262 (buf!1643 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!61186 d!19010))

(declare-fun d!19012 () Bool)

(declare-fun size!1267 (List!678) Int)

(assert (=> d!19012 (= (length!306 lt!95650) (size!1267 lt!95650))))

(declare-fun bs!4738 () Bool)

(assert (= bs!4738 d!19012))

(declare-fun m!97441 () Bool)

(assert (=> bs!4738 m!97441))

(assert (=> b!61176 d!19012))

(push 1)

(assert (not bm!778))

(assert (not b!61357))

(assert (not b!61504))

(assert (not b!61650))

(assert (not b!61484))

(assert (not b!61502))

(assert (not b!61394))

(assert (not b!61509))

(assert (not b!61401))

(assert (not b!61497))

(assert (not d!18946))

(assert (not b!61391))

(assert (not d!18936))

(assert (not d!18902))

(assert (not d!18912))

(assert (not b!61440))

(assert (not b!61396))

(assert (not d!18904))

(assert (not b!61402))

(assert (not d!18914))

(assert (not b!61392))

(assert (not b!61649))

(assert (not b!61419))

(assert (not b!61438))

(assert (not b!61483))

(assert (not b!61644))

(assert (not b!61499))

(assert (not b!61482))

(assert (not b!61496))

(assert (not b!61486))

(assert (not b!61653))

(assert (not d!18944))

(assert (not b!61494))

(assert (not b!61648))

(assert (not b!61397))

(assert (not d!18868))

(assert (not b!61495))

(assert (not b!61395))

(assert (not b!61481))

(assert (not d!18916))

(assert (not b!61492))

(assert (not b!61643))

(assert (not b!61655))

(assert (not d!18870))

(assert (not b!61479))

(assert (not d!18940))

(assert (not d!18892))

(assert (not d!18934))

(assert (not d!19012))

(assert (not b!61390))

(assert (not b!61507))

(assert (not b!61485))

(assert (not d!18850))

(assert (not d!18938))

(assert (not b!61355))

(assert (not b!61503))

(assert (not d!18844))

(assert (not b!61443))

(assert (not d!18882))

(assert (not b!61505))

(assert (not d!18948))

(assert (not b!61417))

(assert (not b!61652))

(assert (not b!61480))

(assert (not b!61356))

(assert (not b!61389))

(assert (not b!61646))

(assert (not b!61645))

(assert (not b!61400))

(assert (not d!18872))

(assert (not d!18846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

