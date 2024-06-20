; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24864 () Bool)

(assert start!24864)

(declare-fun b!125882 () Bool)

(declare-fun res!104280 () Bool)

(declare-fun e!82868 () Bool)

(assert (=> b!125882 (=> (not res!104280) (not e!82868))))

(declare-datatypes ((array!5684 0))(
  ( (array!5685 (arr!3171 (Array (_ BitVec 32) (_ BitVec 8))) (size!2572 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4468 0))(
  ( (BitStream!4469 (buf!2951 array!5684) (currentByte!5675 (_ BitVec 32)) (currentBit!5670 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4468)

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!125882 (= res!104280 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2572 (buf!2951 thiss!1614))) ((_ sign_extend 32) (currentByte!5675 thiss!1614)) ((_ sign_extend 32) (currentBit!5670 thiss!1614)) noOfBytes!1))))

(declare-fun res!104281 () Bool)

(assert (=> start!24864 (=> (not res!104281) (not e!82868))))

(declare-fun arr!227 () array!5684)

(assert (=> start!24864 (= res!104281 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2572 arr!227))))))

(assert (=> start!24864 e!82868))

(assert (=> start!24864 true))

(declare-fun array_inv!2361 (array!5684) Bool)

(assert (=> start!24864 (array_inv!2361 arr!227)))

(declare-fun e!82869 () Bool)

(declare-fun inv!12 (BitStream!4468) Bool)

(assert (=> start!24864 (and (inv!12 thiss!1614) e!82869)))

(declare-fun b!125883 () Bool)

(declare-fun res!104284 () Bool)

(declare-fun e!82870 () Bool)

(assert (=> b!125883 (=> (not res!104284) (not e!82870))))

(declare-datatypes ((Unit!7744 0))(
  ( (Unit!7745) )
))
(declare-datatypes ((tuple2!10498 0))(
  ( (tuple2!10499 (_1!5528 Unit!7744) (_2!5528 BitStream!4468)) )
))
(declare-fun lt!196945 () tuple2!10498)

(declare-fun isPrefixOf!0 (BitStream!4468 BitStream!4468) Bool)

(assert (=> b!125883 (= res!104284 (isPrefixOf!0 thiss!1614 (_2!5528 lt!196945)))))

(declare-fun b!125884 () Bool)

(declare-fun e!82865 () Bool)

(assert (=> b!125884 (= e!82870 (not e!82865))))

(declare-fun res!104282 () Bool)

(assert (=> b!125884 (=> res!104282 e!82865)))

(declare-datatypes ((tuple2!10500 0))(
  ( (tuple2!10501 (_1!5529 BitStream!4468) (_2!5529 BitStream!4468)) )
))
(declare-fun lt!196947 () tuple2!10500)

(declare-datatypes ((tuple2!10502 0))(
  ( (tuple2!10503 (_1!5530 BitStream!4468) (_2!5530 array!5684)) )
))
(declare-fun lt!196948 () tuple2!10502)

(assert (=> b!125884 (= res!104282 (or (not (= (size!2572 (_2!5530 lt!196948)) (size!2572 arr!227))) (not (= (_1!5530 lt!196948) (_2!5529 lt!196947)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4468 array!5684 (_ BitVec 32) (_ BitVec 32)) tuple2!10502)

(assert (=> b!125884 (= lt!196948 (readByteArrayLoopPure!0 (_1!5529 lt!196947) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!196946 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125884 (validate_offset_bits!1 ((_ sign_extend 32) (size!2572 (buf!2951 (_2!5528 lt!196945)))) ((_ sign_extend 32) (currentByte!5675 thiss!1614)) ((_ sign_extend 32) (currentBit!5670 thiss!1614)) lt!196946)))

(declare-fun lt!196949 () Unit!7744)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4468 array!5684 (_ BitVec 64)) Unit!7744)

(assert (=> b!125884 (= lt!196949 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2951 (_2!5528 lt!196945)) lt!196946))))

(declare-fun reader!0 (BitStream!4468 BitStream!4468) tuple2!10500)

(assert (=> b!125884 (= lt!196947 (reader!0 thiss!1614 (_2!5528 lt!196945)))))

(declare-fun b!125885 () Bool)

(assert (=> b!125885 (= e!82869 (array_inv!2361 (buf!2951 thiss!1614)))))

(declare-fun b!125886 () Bool)

(declare-fun e!82866 () Bool)

(assert (=> b!125886 (= e!82866 e!82870)))

(declare-fun res!104279 () Bool)

(assert (=> b!125886 (=> (not res!104279) (not e!82870))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!125886 (= res!104279 (= (bitIndex!0 (size!2572 (buf!2951 (_2!5528 lt!196945))) (currentByte!5675 (_2!5528 lt!196945)) (currentBit!5670 (_2!5528 lt!196945))) (bvadd (bitIndex!0 (size!2572 (buf!2951 thiss!1614)) (currentByte!5675 thiss!1614) (currentBit!5670 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!196946))))))

(assert (=> b!125886 (= lt!196946 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!125887 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!125887 (= e!82868 (not (invariant!0 (currentBit!5670 thiss!1614) (currentByte!5675 thiss!1614) (size!2572 (buf!2951 thiss!1614)))))))

(assert (=> b!125887 e!82866))

(declare-fun res!104283 () Bool)

(assert (=> b!125887 (=> (not res!104283) (not e!82866))))

(assert (=> b!125887 (= res!104283 (= (size!2572 (buf!2951 thiss!1614)) (size!2572 (buf!2951 (_2!5528 lt!196945)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4468 array!5684 (_ BitVec 32) (_ BitVec 32)) tuple2!10498)

(assert (=> b!125887 (= lt!196945 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!125888 () Bool)

(declare-fun arrayRangesEq!59 (array!5684 array!5684 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!125888 (= e!82865 (not (arrayRangesEq!59 arr!227 (_2!5530 lt!196948) #b00000000000000000000000000000000 noOfBytes!1)))))

(assert (= (and start!24864 res!104281) b!125882))

(assert (= (and b!125882 res!104280) b!125887))

(assert (= (and b!125887 res!104283) b!125886))

(assert (= (and b!125886 res!104279) b!125883))

(assert (= (and b!125883 res!104284) b!125884))

(assert (= (and b!125884 (not res!104282)) b!125888))

(assert (= start!24864 b!125885))

(declare-fun m!191313 () Bool)

(assert (=> b!125883 m!191313))

(declare-fun m!191315 () Bool)

(assert (=> b!125882 m!191315))

(declare-fun m!191317 () Bool)

(assert (=> b!125885 m!191317))

(declare-fun m!191319 () Bool)

(assert (=> b!125886 m!191319))

(declare-fun m!191321 () Bool)

(assert (=> b!125886 m!191321))

(declare-fun m!191323 () Bool)

(assert (=> b!125887 m!191323))

(declare-fun m!191325 () Bool)

(assert (=> b!125887 m!191325))

(declare-fun m!191327 () Bool)

(assert (=> start!24864 m!191327))

(declare-fun m!191329 () Bool)

(assert (=> start!24864 m!191329))

(declare-fun m!191331 () Bool)

(assert (=> b!125888 m!191331))

(declare-fun m!191333 () Bool)

(assert (=> b!125884 m!191333))

(declare-fun m!191335 () Bool)

(assert (=> b!125884 m!191335))

(declare-fun m!191337 () Bool)

(assert (=> b!125884 m!191337))

(declare-fun m!191339 () Bool)

(assert (=> b!125884 m!191339))

(push 1)

(assert (not b!125883))

(assert (not b!125886))

(assert (not b!125882))

(assert (not b!125888))

(assert (not start!24864))

(assert (not b!125884))

(assert (not b!125885))

(assert (not b!125887))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!40934 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!40934 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2572 (buf!2951 thiss!1614))) ((_ sign_extend 32) (currentByte!5675 thiss!1614)) ((_ sign_extend 32) (currentBit!5670 thiss!1614)) noOfBytes!1) (bvsle ((_ sign_extend 32) noOfBytes!1) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2572 (buf!2951 thiss!1614))) ((_ sign_extend 32) (currentByte!5675 thiss!1614)) ((_ sign_extend 32) (currentBit!5670 thiss!1614))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!9911 () Bool)

(assert (= bs!9911 d!40934))

(declare-fun m!191397 () Bool)

(assert (=> bs!9911 m!191397))

(assert (=> b!125882 d!40934))

(declare-fun d!40936 () Bool)

(assert (=> d!40936 (= (array_inv!2361 arr!227) (bvsge (size!2572 arr!227) #b00000000000000000000000000000000))))

(assert (=> start!24864 d!40936))

(declare-fun d!40938 () Bool)

(assert (=> d!40938 (= (inv!12 thiss!1614) (invariant!0 (currentBit!5670 thiss!1614) (currentByte!5675 thiss!1614) (size!2572 (buf!2951 thiss!1614))))))

(declare-fun bs!9912 () Bool)

(assert (= bs!9912 d!40938))

(assert (=> bs!9912 m!191323))

(assert (=> start!24864 d!40938))

(declare-fun d!40940 () Bool)

(declare-fun res!104325 () Bool)

(declare-fun e!82918 () Bool)

(assert (=> d!40940 (=> res!104325 e!82918)))

(assert (=> d!40940 (= res!104325 (= #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!40940 (= (arrayRangesEq!59 arr!227 (_2!5530 lt!196948) #b00000000000000000000000000000000 noOfBytes!1) e!82918)))

(declare-fun b!125935 () Bool)

(declare-fun e!82919 () Bool)

(assert (=> b!125935 (= e!82918 e!82919)))

(declare-fun res!104326 () Bool)

(assert (=> b!125935 (=> (not res!104326) (not e!82919))))

(assert (=> b!125935 (= res!104326 (= (select (arr!3171 arr!227) #b00000000000000000000000000000000) (select (arr!3171 (_2!5530 lt!196948)) #b00000000000000000000000000000000)))))

(declare-fun b!125936 () Bool)

(assert (=> b!125936 (= e!82919 (arrayRangesEq!59 arr!227 (_2!5530 lt!196948) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) noOfBytes!1))))

(assert (= (and d!40940 (not res!104325)) b!125935))

(assert (= (and b!125935 res!104326) b!125936))

(declare-fun m!191399 () Bool)

(assert (=> b!125935 m!191399))

(declare-fun m!191401 () Bool)

(assert (=> b!125935 m!191401))

(declare-fun m!191403 () Bool)

(assert (=> b!125936 m!191403))

(assert (=> b!125888 d!40940))

(declare-fun d!40946 () Bool)

(declare-fun res!104334 () Bool)

(declare-fun e!82925 () Bool)

(assert (=> d!40946 (=> (not res!104334) (not e!82925))))

(assert (=> d!40946 (= res!104334 (= (size!2572 (buf!2951 thiss!1614)) (size!2572 (buf!2951 (_2!5528 lt!196945)))))))

(assert (=> d!40946 (= (isPrefixOf!0 thiss!1614 (_2!5528 lt!196945)) e!82925)))

(declare-fun b!125943 () Bool)

(declare-fun res!104333 () Bool)

(assert (=> b!125943 (=> (not res!104333) (not e!82925))))

(assert (=> b!125943 (= res!104333 (bvsle (bitIndex!0 (size!2572 (buf!2951 thiss!1614)) (currentByte!5675 thiss!1614) (currentBit!5670 thiss!1614)) (bitIndex!0 (size!2572 (buf!2951 (_2!5528 lt!196945))) (currentByte!5675 (_2!5528 lt!196945)) (currentBit!5670 (_2!5528 lt!196945)))))))

(declare-fun b!125944 () Bool)

(declare-fun e!82924 () Bool)

(assert (=> b!125944 (= e!82925 e!82924)))

(declare-fun res!104335 () Bool)

(assert (=> b!125944 (=> res!104335 e!82924)))

(assert (=> b!125944 (= res!104335 (= (size!2572 (buf!2951 thiss!1614)) #b00000000000000000000000000000000))))

(declare-fun b!125945 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5684 array!5684 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125945 (= e!82924 (arrayBitRangesEq!0 (buf!2951 thiss!1614) (buf!2951 (_2!5528 lt!196945)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2572 (buf!2951 thiss!1614)) (currentByte!5675 thiss!1614) (currentBit!5670 thiss!1614))))))

(assert (= (and d!40946 res!104334) b!125943))

(assert (= (and b!125943 res!104333) b!125944))

(assert (= (and b!125944 (not res!104335)) b!125945))

(assert (=> b!125943 m!191321))

(assert (=> b!125943 m!191319))

(assert (=> b!125945 m!191321))

(assert (=> b!125945 m!191321))

(declare-fun m!191405 () Bool)

(assert (=> b!125945 m!191405))

(assert (=> b!125883 d!40946))

(declare-datatypes ((tuple3!448 0))(
  ( (tuple3!449 (_1!5537 Unit!7744) (_2!5537 BitStream!4468) (_3!279 array!5684)) )
))
(declare-fun lt!196982 () tuple3!448)

(declare-fun d!40948 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!4468 array!5684 (_ BitVec 32) (_ BitVec 32)) tuple3!448)

(assert (=> d!40948 (= lt!196982 (readByteArrayLoop!0 (_1!5529 lt!196947) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!40948 (= (readByteArrayLoopPure!0 (_1!5529 lt!196947) arr!227 #b00000000000000000000000000000000 noOfBytes!1) (tuple2!10503 (_2!5537 lt!196982) (_3!279 lt!196982)))))

(declare-fun bs!9913 () Bool)

(assert (= bs!9913 d!40948))

(declare-fun m!191407 () Bool)

(assert (=> bs!9913 m!191407))

(assert (=> b!125884 d!40948))

(declare-fun d!40952 () Bool)

(assert (=> d!40952 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2572 (buf!2951 (_2!5528 lt!196945)))) ((_ sign_extend 32) (currentByte!5675 thiss!1614)) ((_ sign_extend 32) (currentBit!5670 thiss!1614)) lt!196946) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2572 (buf!2951 (_2!5528 lt!196945)))) ((_ sign_extend 32) (currentByte!5675 thiss!1614)) ((_ sign_extend 32) (currentBit!5670 thiss!1614))) lt!196946))))

(declare-fun bs!9914 () Bool)

(assert (= bs!9914 d!40952))

(declare-fun m!191409 () Bool)

(assert (=> bs!9914 m!191409))

(assert (=> b!125884 d!40952))

(declare-fun d!40954 () Bool)

(assert (=> d!40954 (validate_offset_bits!1 ((_ sign_extend 32) (size!2572 (buf!2951 (_2!5528 lt!196945)))) ((_ sign_extend 32) (currentByte!5675 thiss!1614)) ((_ sign_extend 32) (currentBit!5670 thiss!1614)) lt!196946)))

(declare-fun lt!196985 () Unit!7744)

(declare-fun choose!9 (BitStream!4468 array!5684 (_ BitVec 64) BitStream!4468) Unit!7744)

(assert (=> d!40954 (= lt!196985 (choose!9 thiss!1614 (buf!2951 (_2!5528 lt!196945)) lt!196946 (BitStream!4469 (buf!2951 (_2!5528 lt!196945)) (currentByte!5675 thiss!1614) (currentBit!5670 thiss!1614))))))

(assert (=> d!40954 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2951 (_2!5528 lt!196945)) lt!196946) lt!196985)))

(declare-fun bs!9915 () Bool)

(assert (= bs!9915 d!40954))

(assert (=> bs!9915 m!191335))

(declare-fun m!191411 () Bool)

(assert (=> bs!9915 m!191411))

(assert (=> b!125884 d!40954))

(declare-fun b!125965 () Bool)

(declare-fun e!82936 () Unit!7744)

(declare-fun Unit!7750 () Unit!7744)

(assert (=> b!125965 (= e!82936 Unit!7750)))

(declare-fun b!125966 () Bool)

(declare-fun res!104352 () Bool)

(declare-fun e!82937 () Bool)

(assert (=> b!125966 (=> (not res!104352) (not e!82937))))

(declare-fun lt!197050 () tuple2!10500)

(assert (=> b!125966 (= res!104352 (isPrefixOf!0 (_1!5529 lt!197050) thiss!1614))))

(declare-fun b!125967 () Bool)

(declare-fun res!104351 () Bool)

(assert (=> b!125967 (=> (not res!104351) (not e!82937))))

(assert (=> b!125967 (= res!104351 (isPrefixOf!0 (_2!5529 lt!197050) (_2!5528 lt!196945)))))

(declare-fun b!125968 () Bool)

(declare-fun lt!197040 () Unit!7744)

(assert (=> b!125968 (= e!82936 lt!197040)))

(declare-fun lt!197044 () (_ BitVec 64))

(assert (=> b!125968 (= lt!197044 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!197035 () (_ BitVec 64))

(assert (=> b!125968 (= lt!197035 (bitIndex!0 (size!2572 (buf!2951 thiss!1614)) (currentByte!5675 thiss!1614) (currentBit!5670 thiss!1614)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5684 array!5684 (_ BitVec 64) (_ BitVec 64)) Unit!7744)

(assert (=> b!125968 (= lt!197040 (arrayBitRangesEqSymmetric!0 (buf!2951 thiss!1614) (buf!2951 (_2!5528 lt!196945)) lt!197044 lt!197035))))

(assert (=> b!125968 (arrayBitRangesEq!0 (buf!2951 (_2!5528 lt!196945)) (buf!2951 thiss!1614) lt!197044 lt!197035)))

(declare-fun lt!197032 () (_ BitVec 64))

(declare-fun lt!197045 () (_ BitVec 64))

(declare-fun b!125969 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4468 (_ BitVec 64)) BitStream!4468)

(assert (=> b!125969 (= e!82937 (= (_1!5529 lt!197050) (withMovedBitIndex!0 (_2!5529 lt!197050) (bvsub lt!197045 lt!197032))))))

(assert (=> b!125969 (or (= (bvand lt!197045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197032 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!197045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!197045 lt!197032) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!125969 (= lt!197032 (bitIndex!0 (size!2572 (buf!2951 (_2!5528 lt!196945))) (currentByte!5675 (_2!5528 lt!196945)) (currentBit!5670 (_2!5528 lt!196945))))))

(assert (=> b!125969 (= lt!197045 (bitIndex!0 (size!2572 (buf!2951 thiss!1614)) (currentByte!5675 thiss!1614) (currentBit!5670 thiss!1614)))))

(declare-fun d!40956 () Bool)

(assert (=> d!40956 e!82937))

(declare-fun res!104353 () Bool)

(assert (=> d!40956 (=> (not res!104353) (not e!82937))))

(assert (=> d!40956 (= res!104353 (isPrefixOf!0 (_1!5529 lt!197050) (_2!5529 lt!197050)))))

(declare-fun lt!197038 () BitStream!4468)

(assert (=> d!40956 (= lt!197050 (tuple2!10501 lt!197038 (_2!5528 lt!196945)))))

(declare-fun lt!197048 () Unit!7744)

(declare-fun lt!197046 () Unit!7744)

(assert (=> d!40956 (= lt!197048 lt!197046)))

(assert (=> d!40956 (isPrefixOf!0 lt!197038 (_2!5528 lt!196945))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4468 BitStream!4468 BitStream!4468) Unit!7744)

(assert (=> d!40956 (= lt!197046 (lemmaIsPrefixTransitive!0 lt!197038 (_2!5528 lt!196945) (_2!5528 lt!196945)))))

(declare-fun lt!197036 () Unit!7744)

(declare-fun lt!197051 () Unit!7744)

(assert (=> d!40956 (= lt!197036 lt!197051)))

(assert (=> d!40956 (isPrefixOf!0 lt!197038 (_2!5528 lt!196945))))

(assert (=> d!40956 (= lt!197051 (lemmaIsPrefixTransitive!0 lt!197038 thiss!1614 (_2!5528 lt!196945)))))

(declare-fun lt!197041 () Unit!7744)

(assert (=> d!40956 (= lt!197041 e!82936)))

(declare-fun c!7479 () Bool)

(assert (=> d!40956 (= c!7479 (not (= (size!2572 (buf!2951 thiss!1614)) #b00000000000000000000000000000000)))))

(declare-fun lt!197033 () Unit!7744)

(declare-fun lt!197043 () Unit!7744)

(assert (=> d!40956 (= lt!197033 lt!197043)))

(assert (=> d!40956 (isPrefixOf!0 (_2!5528 lt!196945) (_2!5528 lt!196945))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4468) Unit!7744)

(assert (=> d!40956 (= lt!197043 (lemmaIsPrefixRefl!0 (_2!5528 lt!196945)))))

(declare-fun lt!197049 () Unit!7744)

(declare-fun lt!197037 () Unit!7744)

(assert (=> d!40956 (= lt!197049 lt!197037)))

(assert (=> d!40956 (= lt!197037 (lemmaIsPrefixRefl!0 (_2!5528 lt!196945)))))

(declare-fun lt!197042 () Unit!7744)

(declare-fun lt!197034 () Unit!7744)

(assert (=> d!40956 (= lt!197042 lt!197034)))

(assert (=> d!40956 (isPrefixOf!0 lt!197038 lt!197038)))

(assert (=> d!40956 (= lt!197034 (lemmaIsPrefixRefl!0 lt!197038))))

(declare-fun lt!197047 () Unit!7744)

(declare-fun lt!197039 () Unit!7744)

(assert (=> d!40956 (= lt!197047 lt!197039)))

(assert (=> d!40956 (isPrefixOf!0 thiss!1614 thiss!1614)))

(assert (=> d!40956 (= lt!197039 (lemmaIsPrefixRefl!0 thiss!1614))))

(assert (=> d!40956 (= lt!197038 (BitStream!4469 (buf!2951 (_2!5528 lt!196945)) (currentByte!5675 thiss!1614) (currentBit!5670 thiss!1614)))))

(assert (=> d!40956 (isPrefixOf!0 thiss!1614 (_2!5528 lt!196945))))

(assert (=> d!40956 (= (reader!0 thiss!1614 (_2!5528 lt!196945)) lt!197050)))

(assert (= (and d!40956 c!7479) b!125968))

(assert (= (and d!40956 (not c!7479)) b!125965))

(assert (= (and d!40956 res!104353) b!125966))

(assert (= (and b!125966 res!104352) b!125967))

(assert (= (and b!125967 res!104351) b!125969))

(declare-fun m!191421 () Bool)

(assert (=> b!125967 m!191421))

(assert (=> b!125968 m!191321))

(declare-fun m!191423 () Bool)

(assert (=> b!125968 m!191423))

(declare-fun m!191425 () Bool)

(assert (=> b!125968 m!191425))

(declare-fun m!191427 () Bool)

(assert (=> b!125966 m!191427))

(declare-fun m!191429 () Bool)

(assert (=> b!125969 m!191429))

(assert (=> b!125969 m!191319))

(assert (=> b!125969 m!191321))

(declare-fun m!191431 () Bool)

(assert (=> d!40956 m!191431))

(declare-fun m!191433 () Bool)

(assert (=> d!40956 m!191433))

(declare-fun m!191435 () Bool)

(assert (=> d!40956 m!191435))

(declare-fun m!191437 () Bool)

(assert (=> d!40956 m!191437))

(declare-fun m!191439 () Bool)

(assert (=> d!40956 m!191439))

(declare-fun m!191441 () Bool)

(assert (=> d!40956 m!191441))

(assert (=> d!40956 m!191313))

(declare-fun m!191443 () Bool)

(assert (=> d!40956 m!191443))

(declare-fun m!191445 () Bool)

(assert (=> d!40956 m!191445))

(declare-fun m!191447 () Bool)

(assert (=> d!40956 m!191447))

(declare-fun m!191449 () Bool)

(assert (=> d!40956 m!191449))

(assert (=> b!125884 d!40956))

(declare-fun d!40968 () Bool)

(assert (=> d!40968 (= (array_inv!2361 (buf!2951 thiss!1614)) (bvsge (size!2572 (buf!2951 thiss!1614)) #b00000000000000000000000000000000))))

(assert (=> b!125885 d!40968))

(declare-fun d!40970 () Bool)

(declare-fun e!82953 () Bool)

(assert (=> d!40970 e!82953))

(declare-fun res!104378 () Bool)

(assert (=> d!40970 (=> (not res!104378) (not e!82953))))

(declare-fun lt!197115 () (_ BitVec 64))

(declare-fun lt!197112 () (_ BitVec 64))

(declare-fun lt!197114 () (_ BitVec 64))

(assert (=> d!40970 (= res!104378 (= lt!197115 (bvsub lt!197114 lt!197112)))))

(assert (=> d!40970 (or (= (bvand lt!197114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197112 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!197114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!197114 lt!197112) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40970 (= lt!197112 (remainingBits!0 ((_ sign_extend 32) (size!2572 (buf!2951 (_2!5528 lt!196945)))) ((_ sign_extend 32) (currentByte!5675 (_2!5528 lt!196945))) ((_ sign_extend 32) (currentBit!5670 (_2!5528 lt!196945)))))))

(declare-fun lt!197113 () (_ BitVec 64))

(declare-fun lt!197107 () (_ BitVec 64))

(assert (=> d!40970 (= lt!197114 (bvmul lt!197113 lt!197107))))

(assert (=> d!40970 (or (= lt!197113 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!197107 (bvsdiv (bvmul lt!197113 lt!197107) lt!197113)))))

(assert (=> d!40970 (= lt!197107 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40970 (= lt!197113 ((_ sign_extend 32) (size!2572 (buf!2951 (_2!5528 lt!196945)))))))

(assert (=> d!40970 (= lt!197115 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5675 (_2!5528 lt!196945))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5670 (_2!5528 lt!196945)))))))

(assert (=> d!40970 (invariant!0 (currentBit!5670 (_2!5528 lt!196945)) (currentByte!5675 (_2!5528 lt!196945)) (size!2572 (buf!2951 (_2!5528 lt!196945))))))

(assert (=> d!40970 (= (bitIndex!0 (size!2572 (buf!2951 (_2!5528 lt!196945))) (currentByte!5675 (_2!5528 lt!196945)) (currentBit!5670 (_2!5528 lt!196945))) lt!197115)))

(declare-fun b!125993 () Bool)

(declare-fun res!104377 () Bool)

(assert (=> b!125993 (=> (not res!104377) (not e!82953))))

(assert (=> b!125993 (= res!104377 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!197115))))

(declare-fun b!125994 () Bool)

(declare-fun lt!197116 () (_ BitVec 64))

(assert (=> b!125994 (= e!82953 (bvsle lt!197115 (bvmul lt!197116 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!125994 (or (= lt!197116 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!197116 #b0000000000000000000000000000000000000000000000000000000000001000) lt!197116)))))

(assert (=> b!125994 (= lt!197116 ((_ sign_extend 32) (size!2572 (buf!2951 (_2!5528 lt!196945)))))))

(assert (= (and d!40970 res!104378) b!125993))

(assert (= (and b!125993 res!104377) b!125994))

(declare-fun m!191471 () Bool)

(assert (=> d!40970 m!191471))

(declare-fun m!191473 () Bool)

(assert (=> d!40970 m!191473))

(assert (=> b!125886 d!40970))

(declare-fun d!40976 () Bool)

(declare-fun e!82958 () Bool)

(assert (=> d!40976 e!82958))

(declare-fun res!104382 () Bool)

(assert (=> d!40976 (=> (not res!104382) (not e!82958))))

(declare-fun lt!197129 () (_ BitVec 64))

(declare-fun lt!197128 () (_ BitVec 64))

(declare-fun lt!197126 () (_ BitVec 64))

(assert (=> d!40976 (= res!104382 (= lt!197129 (bvsub lt!197128 lt!197126)))))

(assert (=> d!40976 (or (= (bvand lt!197128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197126 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!197128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!197128 lt!197126) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40976 (= lt!197126 (remainingBits!0 ((_ sign_extend 32) (size!2572 (buf!2951 thiss!1614))) ((_ sign_extend 32) (currentByte!5675 thiss!1614)) ((_ sign_extend 32) (currentBit!5670 thiss!1614))))))

(declare-fun lt!197127 () (_ BitVec 64))

(declare-fun lt!197125 () (_ BitVec 64))

(assert (=> d!40976 (= lt!197128 (bvmul lt!197127 lt!197125))))

(assert (=> d!40976 (or (= lt!197127 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!197125 (bvsdiv (bvmul lt!197127 lt!197125) lt!197127)))))

(assert (=> d!40976 (= lt!197125 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40976 (= lt!197127 ((_ sign_extend 32) (size!2572 (buf!2951 thiss!1614))))))

(assert (=> d!40976 (= lt!197129 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5675 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5670 thiss!1614))))))

(assert (=> d!40976 (invariant!0 (currentBit!5670 thiss!1614) (currentByte!5675 thiss!1614) (size!2572 (buf!2951 thiss!1614)))))

(assert (=> d!40976 (= (bitIndex!0 (size!2572 (buf!2951 thiss!1614)) (currentByte!5675 thiss!1614) (currentBit!5670 thiss!1614)) lt!197129)))

(declare-fun b!126001 () Bool)

(declare-fun res!104381 () Bool)

(assert (=> b!126001 (=> (not res!104381) (not e!82958))))

(assert (=> b!126001 (= res!104381 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!197129))))

(declare-fun b!126002 () Bool)

(declare-fun lt!197130 () (_ BitVec 64))

(assert (=> b!126002 (= e!82958 (bvsle lt!197129 (bvmul lt!197130 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!126002 (or (= lt!197130 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!197130 #b0000000000000000000000000000000000000000000000000000000000001000) lt!197130)))))

(assert (=> b!126002 (= lt!197130 ((_ sign_extend 32) (size!2572 (buf!2951 thiss!1614))))))

(assert (= (and d!40976 res!104382) b!126001))

(assert (= (and b!126001 res!104381) b!126002))

(assert (=> d!40976 m!191397))

(assert (=> d!40976 m!191323))

(assert (=> b!125886 d!40976))

(declare-fun d!40980 () Bool)

(assert (=> d!40980 (= (invariant!0 (currentBit!5670 thiss!1614) (currentByte!5675 thiss!1614) (size!2572 (buf!2951 thiss!1614))) (and (bvsge (currentBit!5670 thiss!1614) #b00000000000000000000000000000000) (bvslt (currentBit!5670 thiss!1614) #b00000000000000000000000000001000) (bvsge (currentByte!5675 thiss!1614) #b00000000000000000000000000000000) (or (bvslt (currentByte!5675 thiss!1614) (size!2572 (buf!2951 thiss!1614))) (and (= (currentBit!5670 thiss!1614) #b00000000000000000000000000000000) (= (currentByte!5675 thiss!1614) (size!2572 (buf!2951 thiss!1614)))))))))

(assert (=> b!125887 d!40980))

(declare-fun d!40982 () Bool)

(declare-fun e!82990 () Bool)

(assert (=> d!40982 e!82990))

(declare-fun res!104436 () Bool)

(assert (=> d!40982 (=> (not res!104436) (not e!82990))))

(declare-fun lt!197298 () tuple2!10498)

(assert (=> d!40982 (= res!104436 (= (size!2572 (buf!2951 thiss!1614)) (size!2572 (buf!2951 (_2!5528 lt!197298)))))))

(declare-fun choose!64 (BitStream!4468 array!5684 (_ BitVec 32) (_ BitVec 32)) tuple2!10498)

(assert (=> d!40982 (= lt!197298 (choose!64 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!40982 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2572 arr!227)))))

(assert (=> d!40982 (= (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1) lt!197298)))

(declare-fun b!126064 () Bool)

(declare-fun res!104440 () Bool)

(assert (=> b!126064 (=> (not res!104440) (not e!82990))))

(declare-fun lt!197297 () (_ BitVec 64))

(declare-fun lt!197299 () (_ BitVec 64))

(assert (=> b!126064 (= res!104440 (= (bitIndex!0 (size!2572 (buf!2951 (_2!5528 lt!197298))) (currentByte!5675 (_2!5528 lt!197298)) (currentBit!5670 (_2!5528 lt!197298))) (bvadd lt!197297 lt!197299)))))

(assert (=> b!126064 (or (not (= (bvand lt!197297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197299 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!197297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!197297 lt!197299) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!197295 () (_ BitVec 64))

(assert (=> b!126064 (= lt!197299 (bvmul lt!197295 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!126064 (or (= lt!197295 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!197295 #b0000000000000000000000000000000000000000000000000000000000001000) lt!197295)))))

(assert (=> b!126064 (= lt!197295 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!126064 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!126064 (= lt!197297 (bitIndex!0 (size!2572 (buf!2951 thiss!1614)) (currentByte!5675 thiss!1614) (currentBit!5670 thiss!1614)))))

(declare-fun b!126065 () Bool)

(declare-fun e!82989 () Bool)

(assert (=> b!126065 (= e!82990 e!82989)))

(declare-fun res!104437 () Bool)

(assert (=> b!126065 (=> (not res!104437) (not e!82989))))

(declare-fun lt!197300 () tuple2!10500)

(declare-fun lt!197296 () tuple2!10502)

(assert (=> b!126065 (= res!104437 (and (= (size!2572 (_2!5530 lt!197296)) (size!2572 arr!227)) (= (_1!5530 lt!197296) (_2!5529 lt!197300))))))

(assert (=> b!126065 (= lt!197296 (readByteArrayLoopPure!0 (_1!5529 lt!197300) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!197302 () Unit!7744)

(declare-fun lt!197303 () Unit!7744)

(assert (=> b!126065 (= lt!197302 lt!197303)))

(declare-fun lt!197301 () (_ BitVec 64))

(assert (=> b!126065 (validate_offset_bits!1 ((_ sign_extend 32) (size!2572 (buf!2951 (_2!5528 lt!197298)))) ((_ sign_extend 32) (currentByte!5675 thiss!1614)) ((_ sign_extend 32) (currentBit!5670 thiss!1614)) lt!197301)))

(assert (=> b!126065 (= lt!197303 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2951 (_2!5528 lt!197298)) lt!197301))))

(declare-fun e!82991 () Bool)

(assert (=> b!126065 e!82991))

(declare-fun res!104438 () Bool)

(assert (=> b!126065 (=> (not res!104438) (not e!82991))))

(assert (=> b!126065 (= res!104438 (and (= (size!2572 (buf!2951 thiss!1614)) (size!2572 (buf!2951 (_2!5528 lt!197298)))) (bvsge lt!197301 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126065 (= lt!197301 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!126065 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!126065 (= lt!197300 (reader!0 thiss!1614 (_2!5528 lt!197298)))))

(declare-fun b!126066 () Bool)

(assert (=> b!126066 (= e!82991 (validate_offset_bits!1 ((_ sign_extend 32) (size!2572 (buf!2951 thiss!1614))) ((_ sign_extend 32) (currentByte!5675 thiss!1614)) ((_ sign_extend 32) (currentBit!5670 thiss!1614)) lt!197301))))

(declare-fun b!126067 () Bool)

(assert (=> b!126067 (= e!82989 (arrayRangesEq!59 arr!227 (_2!5530 lt!197296) #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126068 () Bool)

(declare-fun res!104439 () Bool)

(assert (=> b!126068 (=> (not res!104439) (not e!82990))))

(assert (=> b!126068 (= res!104439 (isPrefixOf!0 thiss!1614 (_2!5528 lt!197298)))))

(assert (= (and d!40982 res!104436) b!126064))

(assert (= (and b!126064 res!104440) b!126068))

(assert (= (and b!126068 res!104439) b!126065))

(assert (= (and b!126065 res!104438) b!126066))

(assert (= (and b!126065 res!104437) b!126067))

(declare-fun m!191535 () Bool)

(assert (=> d!40982 m!191535))

(declare-fun m!191543 () Bool)

(assert (=> b!126064 m!191543))

(assert (=> b!126064 m!191321))

(declare-fun m!191555 () Bool)

(assert (=> b!126067 m!191555))

(declare-fun m!191557 () Bool)

(assert (=> b!126065 m!191557))

(declare-fun m!191561 () Bool)

(assert (=> b!126065 m!191561))

(declare-fun m!191565 () Bool)

(assert (=> b!126065 m!191565))

(declare-fun m!191569 () Bool)

(assert (=> b!126065 m!191569))

(declare-fun m!191573 () Bool)

(assert (=> b!126066 m!191573))

(declare-fun m!191575 () Bool)

(assert (=> b!126068 m!191575))

(assert (=> b!125887 d!40982))

(push 1)

(assert (not d!40956))

(assert (not d!40934))

(assert (not d!40954))

(assert (not b!125945))

(assert (not d!40952))

(assert (not d!40938))

(assert (not d!40948))

(assert (not d!40976))

(assert (not b!126065))

(assert (not b!125969))

(assert (not b!125967))

(assert (not d!40970))

(assert (not b!126067))

(assert (not b!125936))

(assert (not b!125943))

(assert (not b!125966))

(assert (not b!126068))

(assert (not b!125968))

(assert (not b!126064))

(assert (not d!40982))

(assert (not b!126066))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

