; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43048 () Bool)

(assert start!43048)

(declare-fun i!590 () (_ BitVec 32))

(declare-fun e!139119 () Bool)

(declare-fun b!202959 () Bool)

(declare-fun lt!316425 () (_ BitVec 64))

(declare-fun lt!316420 () (_ BitVec 64))

(assert (=> b!202959 (= e!139119 (or (= lt!316425 (bvand ((_ sign_extend 32) i!590) #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!316425 (bvand (bvsub lt!316420 ((_ sign_extend 32) i!590)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!202959 (= lt!316425 (bvand lt!316420 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!316423 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!202959 (= lt!316420 (bvadd lt!316423 ((_ sign_extend 32) nBits!348)))))

(declare-datatypes ((array!10302 0))(
  ( (array!10303 (arr!5463 (Array (_ BitVec 32) (_ BitVec 8))) (size!4533 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8174 0))(
  ( (BitStream!8175 (buf!5038 array!10302) (currentByte!9487 (_ BitVec 32)) (currentBit!9482 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8174)

(declare-datatypes ((Unit!14425 0))(
  ( (Unit!14426) )
))
(declare-datatypes ((tuple2!17368 0))(
  ( (tuple2!17369 (_1!9336 Unit!14425) (_2!9336 BitStream!8174)) )
))
(declare-fun lt!316424 () tuple2!17368)

(declare-fun isPrefixOf!0 (BitStream!8174 BitStream!8174) Bool)

(assert (=> b!202959 (isPrefixOf!0 thiss!1204 (_2!9336 lt!316424))))

(declare-fun lt!316427 () tuple2!17368)

(declare-fun lt!316430 () Unit!14425)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8174 BitStream!8174 BitStream!8174) Unit!14425)

(assert (=> b!202959 (= lt!316430 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9336 lt!316427) (_2!9336 lt!316424)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8174 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17368)

(assert (=> b!202959 (= lt!316424 (appendBitsLSBFirstLoopTR!0 (_2!9336 lt!316427) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!202960 () Bool)

(declare-fun e!139122 () Bool)

(declare-fun e!139123 () Bool)

(assert (=> b!202960 (= e!139122 e!139123)))

(declare-fun res!170016 () Bool)

(assert (=> b!202960 (=> (not res!170016) (not e!139123))))

(declare-fun lt!316421 () (_ BitVec 64))

(declare-fun lt!316428 () (_ BitVec 64))

(assert (=> b!202960 (= res!170016 (= lt!316421 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!316428)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!202960 (= lt!316421 (bitIndex!0 (size!4533 (buf!5038 (_2!9336 lt!316427))) (currentByte!9487 (_2!9336 lt!316427)) (currentBit!9482 (_2!9336 lt!316427))))))

(assert (=> b!202960 (= lt!316428 (bitIndex!0 (size!4533 (buf!5038 thiss!1204)) (currentByte!9487 thiss!1204) (currentBit!9482 thiss!1204)))))

(declare-fun b!202961 () Bool)

(declare-fun res!170015 () Bool)

(declare-fun e!139124 () Bool)

(assert (=> b!202961 (=> (not res!170015) (not e!139124))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202961 (= res!170015 (validate_offset_bits!1 ((_ sign_extend 32) (size!4533 (buf!5038 thiss!1204))) ((_ sign_extend 32) (currentByte!9487 thiss!1204)) ((_ sign_extend 32) (currentBit!9482 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!202963 () Bool)

(declare-fun e!139121 () Bool)

(declare-datatypes ((tuple2!17370 0))(
  ( (tuple2!17371 (_1!9337 BitStream!8174) (_2!9337 Bool)) )
))
(declare-fun lt!316422 () tuple2!17370)

(assert (=> b!202963 (= e!139121 (= (bitIndex!0 (size!4533 (buf!5038 (_1!9337 lt!316422))) (currentByte!9487 (_1!9337 lt!316422)) (currentBit!9482 (_1!9337 lt!316422))) lt!316421))))

(declare-fun b!202964 () Bool)

(declare-fun res!170014 () Bool)

(assert (=> b!202964 (=> (not res!170014) (not e!139123))))

(assert (=> b!202964 (= res!170014 (isPrefixOf!0 thiss!1204 (_2!9336 lt!316427)))))

(declare-fun b!202965 () Bool)

(assert (=> b!202965 (= e!139124 (not e!139119))))

(declare-fun res!170018 () Bool)

(assert (=> b!202965 (=> res!170018 e!139119)))

(declare-fun lt!316429 () (_ BitVec 64))

(assert (=> b!202965 (= res!170018 (not (= lt!316423 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!316429))))))

(assert (=> b!202965 (= lt!316423 (bitIndex!0 (size!4533 (buf!5038 (_2!9336 lt!316427))) (currentByte!9487 (_2!9336 lt!316427)) (currentBit!9482 (_2!9336 lt!316427))))))

(assert (=> b!202965 (= lt!316429 (bitIndex!0 (size!4533 (buf!5038 thiss!1204)) (currentByte!9487 thiss!1204) (currentBit!9482 thiss!1204)))))

(assert (=> b!202965 e!139122))

(declare-fun res!170017 () Bool)

(assert (=> b!202965 (=> (not res!170017) (not e!139122))))

(assert (=> b!202965 (= res!170017 (= (size!4533 (buf!5038 thiss!1204)) (size!4533 (buf!5038 (_2!9336 lt!316427)))))))

(declare-fun lt!316426 () Bool)

(declare-fun appendBit!0 (BitStream!8174 Bool) tuple2!17368)

(assert (=> b!202965 (= lt!316427 (appendBit!0 thiss!1204 lt!316426))))

(assert (=> b!202965 (= lt!316426 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!202966 () Bool)

(declare-fun res!170010 () Bool)

(assert (=> b!202966 (=> (not res!170010) (not e!139124))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!202966 (= res!170010 (invariant!0 (currentBit!9482 thiss!1204) (currentByte!9487 thiss!1204) (size!4533 (buf!5038 thiss!1204))))))

(declare-fun b!202967 () Bool)

(declare-fun e!139125 () Bool)

(declare-fun array_inv!4274 (array!10302) Bool)

(assert (=> b!202967 (= e!139125 (array_inv!4274 (buf!5038 thiss!1204)))))

(declare-fun b!202968 () Bool)

(assert (=> b!202968 (= e!139123 e!139121)))

(declare-fun res!170013 () Bool)

(assert (=> b!202968 (=> (not res!170013) (not e!139121))))

(assert (=> b!202968 (= res!170013 (and (= (_2!9337 lt!316422) lt!316426) (= (_1!9337 lt!316422) (_2!9336 lt!316427))))))

(declare-fun readBitPure!0 (BitStream!8174) tuple2!17370)

(declare-fun readerFrom!0 (BitStream!8174 (_ BitVec 32) (_ BitVec 32)) BitStream!8174)

(assert (=> b!202968 (= lt!316422 (readBitPure!0 (readerFrom!0 (_2!9336 lt!316427) (currentBit!9482 thiss!1204) (currentByte!9487 thiss!1204))))))

(declare-fun res!170012 () Bool)

(assert (=> start!43048 (=> (not res!170012) (not e!139124))))

(assert (=> start!43048 (= res!170012 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43048 e!139124))

(assert (=> start!43048 true))

(declare-fun inv!12 (BitStream!8174) Bool)

(assert (=> start!43048 (and (inv!12 thiss!1204) e!139125)))

(declare-fun b!202962 () Bool)

(declare-fun res!170011 () Bool)

(assert (=> b!202962 (=> (not res!170011) (not e!139124))))

(assert (=> b!202962 (= res!170011 (not (= i!590 nBits!348)))))

(assert (= (and start!43048 res!170012) b!202961))

(assert (= (and b!202961 res!170015) b!202966))

(assert (= (and b!202966 res!170010) b!202962))

(assert (= (and b!202962 res!170011) b!202965))

(assert (= (and b!202965 res!170017) b!202960))

(assert (= (and b!202960 res!170016) b!202964))

(assert (= (and b!202964 res!170014) b!202968))

(assert (= (and b!202968 res!170013) b!202963))

(assert (= (and b!202965 (not res!170018)) b!202959))

(assert (= start!43048 b!202967))

(declare-fun m!313631 () Bool)

(assert (=> b!202964 m!313631))

(declare-fun m!313633 () Bool)

(assert (=> b!202963 m!313633))

(declare-fun m!313635 () Bool)

(assert (=> b!202968 m!313635))

(assert (=> b!202968 m!313635))

(declare-fun m!313637 () Bool)

(assert (=> b!202968 m!313637))

(declare-fun m!313639 () Bool)

(assert (=> b!202961 m!313639))

(declare-fun m!313641 () Bool)

(assert (=> b!202966 m!313641))

(declare-fun m!313643 () Bool)

(assert (=> start!43048 m!313643))

(declare-fun m!313645 () Bool)

(assert (=> b!202959 m!313645))

(declare-fun m!313647 () Bool)

(assert (=> b!202959 m!313647))

(declare-fun m!313649 () Bool)

(assert (=> b!202959 m!313649))

(declare-fun m!313651 () Bool)

(assert (=> b!202967 m!313651))

(declare-fun m!313653 () Bool)

(assert (=> b!202965 m!313653))

(declare-fun m!313655 () Bool)

(assert (=> b!202965 m!313655))

(declare-fun m!313657 () Bool)

(assert (=> b!202965 m!313657))

(assert (=> b!202960 m!313653))

(assert (=> b!202960 m!313655))

(push 1)

(assert (not start!43048))

(assert (not b!202967))

(assert (not b!202959))

(assert (not b!202964))

(assert (not b!202961))

(assert (not b!202963))

(assert (not b!202960))

(assert (not b!202966))

(assert (not b!202965))

(assert (not b!202968))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69399 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69399 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4533 (buf!5038 thiss!1204))) ((_ sign_extend 32) (currentByte!9487 thiss!1204)) ((_ sign_extend 32) (currentBit!9482 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4533 (buf!5038 thiss!1204))) ((_ sign_extend 32) (currentByte!9487 thiss!1204)) ((_ sign_extend 32) (currentBit!9482 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17113 () Bool)

(assert (= bs!17113 d!69399))

(declare-fun m!313675 () Bool)

(assert (=> bs!17113 m!313675))

(assert (=> b!202961 d!69399))

(declare-fun d!69401 () Bool)

(assert (=> d!69401 (= (array_inv!4274 (buf!5038 thiss!1204)) (bvsge (size!4533 (buf!5038 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!202967 d!69401))

(declare-fun d!69403 () Bool)

(assert (=> d!69403 (= (invariant!0 (currentBit!9482 thiss!1204) (currentByte!9487 thiss!1204) (size!4533 (buf!5038 thiss!1204))) (and (bvsge (currentBit!9482 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9482 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9487 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9487 thiss!1204) (size!4533 (buf!5038 thiss!1204))) (and (= (currentBit!9482 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9487 thiss!1204) (size!4533 (buf!5038 thiss!1204)))))))))

(assert (=> b!202966 d!69403))

(declare-fun d!69407 () Bool)

(declare-fun e!139147 () Bool)

(assert (=> d!69407 e!139147))

(declare-fun res!170054 () Bool)

(assert (=> d!69407 (=> (not res!170054) (not e!139147))))

(declare-fun lt!316473 () (_ BitVec 64))

(declare-fun lt!316475 () (_ BitVec 64))

(declare-fun lt!316474 () (_ BitVec 64))

(assert (=> d!69407 (= res!170054 (= lt!316474 (bvsub lt!316475 lt!316473)))))

(assert (=> d!69407 (or (= (bvand lt!316475 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316473 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!316475 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!316475 lt!316473) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69407 (= lt!316473 (remainingBits!0 ((_ sign_extend 32) (size!4533 (buf!5038 (_2!9336 lt!316427)))) ((_ sign_extend 32) (currentByte!9487 (_2!9336 lt!316427))) ((_ sign_extend 32) (currentBit!9482 (_2!9336 lt!316427)))))))

(declare-fun lt!316478 () (_ BitVec 64))

(declare-fun lt!316476 () (_ BitVec 64))

(assert (=> d!69407 (= lt!316475 (bvmul lt!316478 lt!316476))))

(assert (=> d!69407 (or (= lt!316478 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!316476 (bvsdiv (bvmul lt!316478 lt!316476) lt!316478)))))

(assert (=> d!69407 (= lt!316476 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69407 (= lt!316478 ((_ sign_extend 32) (size!4533 (buf!5038 (_2!9336 lt!316427)))))))

(assert (=> d!69407 (= lt!316474 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9487 (_2!9336 lt!316427))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9482 (_2!9336 lt!316427)))))))

(assert (=> d!69407 (invariant!0 (currentBit!9482 (_2!9336 lt!316427)) (currentByte!9487 (_2!9336 lt!316427)) (size!4533 (buf!5038 (_2!9336 lt!316427))))))

(assert (=> d!69407 (= (bitIndex!0 (size!4533 (buf!5038 (_2!9336 lt!316427))) (currentByte!9487 (_2!9336 lt!316427)) (currentBit!9482 (_2!9336 lt!316427))) lt!316474)))

(declare-fun b!203002 () Bool)

(declare-fun res!170053 () Bool)

(assert (=> b!203002 (=> (not res!170053) (not e!139147))))

(assert (=> b!203002 (= res!170053 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!316474))))

(declare-fun b!203003 () Bool)

(declare-fun lt!316477 () (_ BitVec 64))

(assert (=> b!203003 (= e!139147 (bvsle lt!316474 (bvmul lt!316477 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203003 (or (= lt!316477 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!316477 #b0000000000000000000000000000000000000000000000000000000000001000) lt!316477)))))

(assert (=> b!203003 (= lt!316477 ((_ sign_extend 32) (size!4533 (buf!5038 (_2!9336 lt!316427)))))))

(assert (= (and d!69407 res!170054) b!203002))

(assert (= (and b!203002 res!170053) b!203003))

(declare-fun m!313679 () Bool)

(assert (=> d!69407 m!313679))

(declare-fun m!313681 () Bool)

(assert (=> d!69407 m!313681))

(assert (=> b!202965 d!69407))

(declare-fun d!69409 () Bool)

(declare-fun e!139148 () Bool)

(assert (=> d!69409 e!139148))

(declare-fun res!170056 () Bool)

(assert (=> d!69409 (=> (not res!170056) (not e!139148))))

(declare-fun lt!316481 () (_ BitVec 64))

(declare-fun lt!316479 () (_ BitVec 64))

(declare-fun lt!316480 () (_ BitVec 64))

(assert (=> d!69409 (= res!170056 (= lt!316480 (bvsub lt!316481 lt!316479)))))

(assert (=> d!69409 (or (= (bvand lt!316481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316479 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!316481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!316481 lt!316479) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69409 (= lt!316479 (remainingBits!0 ((_ sign_extend 32) (size!4533 (buf!5038 thiss!1204))) ((_ sign_extend 32) (currentByte!9487 thiss!1204)) ((_ sign_extend 32) (currentBit!9482 thiss!1204))))))

(declare-fun lt!316484 () (_ BitVec 64))

(declare-fun lt!316482 () (_ BitVec 64))

(assert (=> d!69409 (= lt!316481 (bvmul lt!316484 lt!316482))))

(assert (=> d!69409 (or (= lt!316484 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!316482 (bvsdiv (bvmul lt!316484 lt!316482) lt!316484)))))

(assert (=> d!69409 (= lt!316482 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69409 (= lt!316484 ((_ sign_extend 32) (size!4533 (buf!5038 thiss!1204))))))

(assert (=> d!69409 (= lt!316480 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9487 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9482 thiss!1204))))))

(assert (=> d!69409 (invariant!0 (currentBit!9482 thiss!1204) (currentByte!9487 thiss!1204) (size!4533 (buf!5038 thiss!1204)))))

(assert (=> d!69409 (= (bitIndex!0 (size!4533 (buf!5038 thiss!1204)) (currentByte!9487 thiss!1204) (currentBit!9482 thiss!1204)) lt!316480)))

(declare-fun b!203004 () Bool)

(declare-fun res!170055 () Bool)

(assert (=> b!203004 (=> (not res!170055) (not e!139148))))

(assert (=> b!203004 (= res!170055 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!316480))))

(declare-fun b!203005 () Bool)

(declare-fun lt!316483 () (_ BitVec 64))

(assert (=> b!203005 (= e!139148 (bvsle lt!316480 (bvmul lt!316483 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203005 (or (= lt!316483 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!316483 #b0000000000000000000000000000000000000000000000000000000000001000) lt!316483)))))

(assert (=> b!203005 (= lt!316483 ((_ sign_extend 32) (size!4533 (buf!5038 thiss!1204))))))

(assert (= (and d!69409 res!170056) b!203004))

(assert (= (and b!203004 res!170055) b!203005))

(assert (=> d!69409 m!313675))

(assert (=> d!69409 m!313641))

(assert (=> b!202965 d!69409))

(declare-fun d!69411 () Bool)

(declare-fun e!139162 () Bool)

(assert (=> d!69411 e!139162))

(declare-fun res!170085 () Bool)

(assert (=> d!69411 (=> (not res!170085) (not e!139162))))

(declare-fun lt!316517 () tuple2!17368)

(assert (=> d!69411 (= res!170085 (= (size!4533 (buf!5038 thiss!1204)) (size!4533 (buf!5038 (_2!9336 lt!316517)))))))

(declare-fun choose!16 (BitStream!8174 Bool) tuple2!17368)

(assert (=> d!69411 (= lt!316517 (choose!16 thiss!1204 lt!316426))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69411 (validate_offset_bit!0 ((_ sign_extend 32) (size!4533 (buf!5038 thiss!1204))) ((_ sign_extend 32) (currentByte!9487 thiss!1204)) ((_ sign_extend 32) (currentBit!9482 thiss!1204)))))

(assert (=> d!69411 (= (appendBit!0 thiss!1204 lt!316426) lt!316517)))

(declare-fun b!203035 () Bool)

(declare-fun e!139163 () Bool)

(assert (=> b!203035 (= e!139162 e!139163)))

(declare-fun res!170084 () Bool)

(assert (=> b!203035 (=> (not res!170084) (not e!139163))))

(declare-fun lt!316514 () tuple2!17370)

(assert (=> b!203035 (= res!170084 (and (= (_2!9337 lt!316514) lt!316426) (= (_1!9337 lt!316514) (_2!9336 lt!316517))))))

(assert (=> b!203035 (= lt!316514 (readBitPure!0 (readerFrom!0 (_2!9336 lt!316517) (currentBit!9482 thiss!1204) (currentByte!9487 thiss!1204))))))

(declare-fun b!203034 () Bool)

(declare-fun res!170083 () Bool)

(assert (=> b!203034 (=> (not res!170083) (not e!139162))))

(assert (=> b!203034 (= res!170083 (isPrefixOf!0 thiss!1204 (_2!9336 lt!316517)))))

(declare-fun b!203033 () Bool)

(declare-fun res!170082 () Bool)

(assert (=> b!203033 (=> (not res!170082) (not e!139162))))

(declare-fun lt!316515 () (_ BitVec 64))

(declare-fun lt!316516 () (_ BitVec 64))

(assert (=> b!203033 (= res!170082 (= (bitIndex!0 (size!4533 (buf!5038 (_2!9336 lt!316517))) (currentByte!9487 (_2!9336 lt!316517)) (currentBit!9482 (_2!9336 lt!316517))) (bvadd lt!316515 lt!316516)))))

(assert (=> b!203033 (or (not (= (bvand lt!316515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316516 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!316515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!316515 lt!316516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203033 (= lt!316516 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!203033 (= lt!316515 (bitIndex!0 (size!4533 (buf!5038 thiss!1204)) (currentByte!9487 thiss!1204) (currentBit!9482 thiss!1204)))))

(declare-fun b!203036 () Bool)

(assert (=> b!203036 (= e!139163 (= (bitIndex!0 (size!4533 (buf!5038 (_1!9337 lt!316514))) (currentByte!9487 (_1!9337 lt!316514)) (currentBit!9482 (_1!9337 lt!316514))) (bitIndex!0 (size!4533 (buf!5038 (_2!9336 lt!316517))) (currentByte!9487 (_2!9336 lt!316517)) (currentBit!9482 (_2!9336 lt!316517)))))))

(assert (= (and d!69411 res!170085) b!203033))

(assert (= (and b!203033 res!170082) b!203034))

(assert (= (and b!203034 res!170083) b!203035))

(assert (= (and b!203035 res!170084) b!203036))

(declare-fun m!313707 () Bool)

(assert (=> d!69411 m!313707))

(declare-fun m!313709 () Bool)

(assert (=> d!69411 m!313709))

(declare-fun m!313711 () Bool)

(assert (=> b!203035 m!313711))

(assert (=> b!203035 m!313711))

(declare-fun m!313713 () Bool)

(assert (=> b!203035 m!313713))

(declare-fun m!313715 () Bool)

(assert (=> b!203033 m!313715))

(assert (=> b!203033 m!313655))

(declare-fun m!313717 () Bool)

(assert (=> b!203036 m!313717))

(assert (=> b!203036 m!313715))

(declare-fun m!313719 () Bool)

(assert (=> b!203034 m!313719))

(assert (=> b!202965 d!69411))

(assert (=> b!202960 d!69407))

(assert (=> b!202960 d!69409))

(declare-fun d!69421 () Bool)

(declare-fun res!170094 () Bool)

(declare-fun e!139169 () Bool)

(assert (=> d!69421 (=> (not res!170094) (not e!139169))))

(assert (=> d!69421 (= res!170094 (= (size!4533 (buf!5038 thiss!1204)) (size!4533 (buf!5038 (_2!9336 lt!316424)))))))

(assert (=> d!69421 (= (isPrefixOf!0 thiss!1204 (_2!9336 lt!316424)) e!139169)))

(declare-fun b!203043 () Bool)

(declare-fun res!170092 () Bool)

(assert (=> b!203043 (=> (not res!170092) (not e!139169))))

(assert (=> b!203043 (= res!170092 (bvsle (bitIndex!0 (size!4533 (buf!5038 thiss!1204)) (currentByte!9487 thiss!1204) (currentBit!9482 thiss!1204)) (bitIndex!0 (size!4533 (buf!5038 (_2!9336 lt!316424))) (currentByte!9487 (_2!9336 lt!316424)) (currentBit!9482 (_2!9336 lt!316424)))))))

(declare-fun b!203044 () Bool)

(declare-fun e!139168 () Bool)

(assert (=> b!203044 (= e!139169 e!139168)))

(declare-fun res!170093 () Bool)

(assert (=> b!203044 (=> res!170093 e!139168)))

(assert (=> b!203044 (= res!170093 (= (size!4533 (buf!5038 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!203045 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10302 array!10302 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!203045 (= e!139168 (arrayBitRangesEq!0 (buf!5038 thiss!1204) (buf!5038 (_2!9336 lt!316424)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4533 (buf!5038 thiss!1204)) (currentByte!9487 thiss!1204) (currentBit!9482 thiss!1204))))))

(assert (= (and d!69421 res!170094) b!203043))

(assert (= (and b!203043 res!170092) b!203044))

(assert (= (and b!203044 (not res!170093)) b!203045))

(assert (=> b!203043 m!313655))

(declare-fun m!313721 () Bool)

(assert (=> b!203043 m!313721))

(assert (=> b!203045 m!313655))

(assert (=> b!203045 m!313655))

(declare-fun m!313723 () Bool)

(assert (=> b!203045 m!313723))

(assert (=> b!202959 d!69421))

(declare-fun d!69423 () Bool)

(assert (=> d!69423 (isPrefixOf!0 thiss!1204 (_2!9336 lt!316424))))

(declare-fun lt!316520 () Unit!14425)

(declare-fun choose!30 (BitStream!8174 BitStream!8174 BitStream!8174) Unit!14425)

(assert (=> d!69423 (= lt!316520 (choose!30 thiss!1204 (_2!9336 lt!316427) (_2!9336 lt!316424)))))

(assert (=> d!69423 (isPrefixOf!0 thiss!1204 (_2!9336 lt!316427))))

(assert (=> d!69423 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9336 lt!316427) (_2!9336 lt!316424)) lt!316520)))

(declare-fun bs!17115 () Bool)

(assert (= bs!17115 d!69423))

(assert (=> bs!17115 m!313645))

(declare-fun m!313725 () Bool)

(assert (=> bs!17115 m!313725))

(assert (=> bs!17115 m!313631))

(assert (=> b!202959 d!69423))

(declare-fun b!203167 () Bool)

(declare-fun res!170196 () Bool)

(declare-fun e!139238 () Bool)

(assert (=> b!203167 (=> (not res!170196) (not e!139238))))

(declare-fun lt!316897 () (_ BitVec 64))

(declare-fun lt!316866 () tuple2!17368)

(declare-fun lt!316875 () (_ BitVec 64))

(assert (=> b!203167 (= res!170196 (= (bitIndex!0 (size!4533 (buf!5038 (_2!9336 lt!316866))) (currentByte!9487 (_2!9336 lt!316866)) (currentBit!9482 (_2!9336 lt!316866))) (bvsub lt!316875 lt!316897)))))

(assert (=> b!203167 (or (= (bvand lt!316875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316897 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!316875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!316875 lt!316897) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203167 (= lt!316897 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!316886 () (_ BitVec 64))

(declare-fun lt!316870 () (_ BitVec 64))

(assert (=> b!203167 (= lt!316875 (bvadd lt!316886 lt!316870))))

(assert (=> b!203167 (or (not (= (bvand lt!316886 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316870 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!316886 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!316886 lt!316870) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203167 (= lt!316870 ((_ sign_extend 32) nBits!348))))

(assert (=> b!203167 (= lt!316886 (bitIndex!0 (size!4533 (buf!5038 (_2!9336 lt!316427))) (currentByte!9487 (_2!9336 lt!316427)) (currentBit!9482 (_2!9336 lt!316427))))))

(declare-fun b!203168 () Bool)

(declare-fun res!170195 () Bool)

(assert (=> b!203168 (=> (not res!170195) (not e!139238))))

(assert (=> b!203168 (= res!170195 (isPrefixOf!0 (_2!9336 lt!316427) (_2!9336 lt!316866)))))

(declare-fun b!203169 () Bool)

(declare-fun res!170200 () Bool)

(assert (=> b!203169 (=> (not res!170200) (not e!139238))))

(assert (=> b!203169 (= res!170200 (= (size!4533 (buf!5038 (_2!9336 lt!316427))) (size!4533 (buf!5038 (_2!9336 lt!316866)))))))

(declare-fun b!203170 () Bool)

(declare-fun e!139243 () (_ BitVec 64))

(assert (=> b!203170 (= e!139243 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!203171 () Bool)

(declare-fun e!139239 () Bool)

(assert (=> b!203171 (= e!139238 e!139239)))

(declare-fun res!170199 () Bool)

(assert (=> b!203171 (=> (not res!170199) (not e!139239))))

(declare-datatypes ((tuple2!17380 0))(
  ( (tuple2!17381 (_1!9342 BitStream!8174) (_2!9342 (_ BitVec 64))) )
))
(declare-fun lt!316903 () tuple2!17380)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!203171 (= res!170199 (= (_2!9342 lt!316903) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-datatypes ((tuple2!17382 0))(
  ( (tuple2!17383 (_1!9343 BitStream!8174) (_2!9343 BitStream!8174)) )
))
(declare-fun lt!316885 () tuple2!17382)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17380)

(assert (=> b!203171 (= lt!316903 (readNBitsLSBFirstsLoopPure!0 (_1!9343 lt!316885) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!316874 () Unit!14425)

(declare-fun lt!316873 () Unit!14425)

(assert (=> b!203171 (= lt!316874 lt!316873)))

(declare-fun lt!316876 () (_ BitVec 64))

(assert (=> b!203171 (validate_offset_bits!1 ((_ sign_extend 32) (size!4533 (buf!5038 (_2!9336 lt!316866)))) ((_ sign_extend 32) (currentByte!9487 (_2!9336 lt!316427))) ((_ sign_extend 32) (currentBit!9482 (_2!9336 lt!316427))) lt!316876)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8174 array!10302 (_ BitVec 64)) Unit!14425)

(assert (=> b!203171 (= lt!316873 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9336 lt!316427) (buf!5038 (_2!9336 lt!316866)) lt!316876))))

(declare-fun e!139242 () Bool)

(assert (=> b!203171 e!139242))

(declare-fun res!170194 () Bool)

(assert (=> b!203171 (=> (not res!170194) (not e!139242))))

(assert (=> b!203171 (= res!170194 (and (= (size!4533 (buf!5038 (_2!9336 lt!316427))) (size!4533 (buf!5038 (_2!9336 lt!316866)))) (bvsge lt!316876 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203171 (= lt!316876 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!203171 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!8174 BitStream!8174) tuple2!17382)

(assert (=> b!203171 (= lt!316885 (reader!0 (_2!9336 lt!316427) (_2!9336 lt!316866)))))

(declare-fun b!203172 () Bool)

(declare-fun res!170201 () Bool)

(declare-fun lt!316891 () tuple2!17368)

(assert (=> b!203172 (= res!170201 (= (bitIndex!0 (size!4533 (buf!5038 (_2!9336 lt!316891))) (currentByte!9487 (_2!9336 lt!316891)) (currentBit!9482 (_2!9336 lt!316891))) (bvadd (bitIndex!0 (size!4533 (buf!5038 (_2!9336 lt!316427))) (currentByte!9487 (_2!9336 lt!316427)) (currentBit!9482 (_2!9336 lt!316427))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!139237 () Bool)

(assert (=> b!203172 (=> (not res!170201) (not e!139237))))

(declare-fun b!203173 () Bool)

(assert (=> b!203173 (= e!139243 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!203174 () Bool)

(assert (=> b!203174 (= e!139242 (validate_offset_bits!1 ((_ sign_extend 32) (size!4533 (buf!5038 (_2!9336 lt!316427)))) ((_ sign_extend 32) (currentByte!9487 (_2!9336 lt!316427))) ((_ sign_extend 32) (currentBit!9482 (_2!9336 lt!316427))) lt!316876))))

(declare-fun b!203175 () Bool)

(declare-fun e!139241 () tuple2!17368)

(declare-fun Unit!14439 () Unit!14425)

(assert (=> b!203175 (= e!139241 (tuple2!17369 Unit!14439 (_2!9336 lt!316427)))))

(declare-fun lt!316888 () Unit!14425)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8174) Unit!14425)

(assert (=> b!203175 (= lt!316888 (lemmaIsPrefixRefl!0 (_2!9336 lt!316427)))))

(declare-fun call!3204 () Bool)

(assert (=> b!203175 call!3204))

(declare-fun lt!316867 () Unit!14425)

(assert (=> b!203175 (= lt!316867 lt!316888)))

(declare-fun b!203176 () Bool)

(declare-fun e!139244 () Bool)

(declare-fun lt!316908 () tuple2!17380)

(declare-fun lt!316899 () tuple2!17382)

(assert (=> b!203176 (= e!139244 (= (_1!9342 lt!316908) (_2!9343 lt!316899)))))

(declare-fun b!203177 () Bool)

(assert (=> b!203177 (= e!139239 (= (_1!9342 lt!316903) (_2!9343 lt!316885)))))

(declare-fun b!203178 () Bool)

(declare-fun e!139245 () Bool)

(declare-fun lt!316894 () tuple2!17370)

(declare-fun lt!316881 () tuple2!17370)

(assert (=> b!203178 (= e!139245 (= (_2!9337 lt!316894) (_2!9337 lt!316881)))))

(declare-fun c!10074 () Bool)

(declare-fun bm!3201 () Bool)

(assert (=> bm!3201 (= call!3204 (isPrefixOf!0 (_2!9336 lt!316427) (ite c!10074 (_2!9336 lt!316427) (_2!9336 lt!316891))))))

(declare-fun d!69425 () Bool)

(assert (=> d!69425 e!139238))

(declare-fun res!170197 () Bool)

(assert (=> d!69425 (=> (not res!170197) (not e!139238))))

(assert (=> d!69425 (= res!170197 (invariant!0 (currentBit!9482 (_2!9336 lt!316866)) (currentByte!9487 (_2!9336 lt!316866)) (size!4533 (buf!5038 (_2!9336 lt!316866)))))))

(assert (=> d!69425 (= lt!316866 e!139241)))

(assert (=> d!69425 (= c!10074 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69425 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69425 (= (appendBitsLSBFirstLoopTR!0 (_2!9336 lt!316427) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!316866)))

(declare-fun b!203179 () Bool)

(declare-fun res!170203 () Bool)

(assert (=> b!203179 (= res!170203 call!3204)))

(assert (=> b!203179 (=> (not res!170203) (not e!139237))))

(declare-fun b!203180 () Bool)

(declare-fun e!139240 () Bool)

(declare-fun lt!316872 () tuple2!17370)

(assert (=> b!203180 (= e!139240 (= (bitIndex!0 (size!4533 (buf!5038 (_1!9337 lt!316872))) (currentByte!9487 (_1!9337 lt!316872)) (currentBit!9482 (_1!9337 lt!316872))) (bitIndex!0 (size!4533 (buf!5038 (_2!9336 lt!316891))) (currentByte!9487 (_2!9336 lt!316891)) (currentBit!9482 (_2!9336 lt!316891)))))))

(declare-fun b!203181 () Bool)

(declare-fun lt!316893 () tuple2!17368)

(assert (=> b!203181 (= e!139241 (tuple2!17369 (_1!9336 lt!316893) (_2!9336 lt!316893)))))

(declare-fun lt!316901 () Bool)

(assert (=> b!203181 (= lt!316901 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203181 (= lt!316891 (appendBit!0 (_2!9336 lt!316427) lt!316901))))

(declare-fun res!170198 () Bool)

(assert (=> b!203181 (= res!170198 (= (size!4533 (buf!5038 (_2!9336 lt!316427))) (size!4533 (buf!5038 (_2!9336 lt!316891)))))))

(assert (=> b!203181 (=> (not res!170198) (not e!139237))))

(assert (=> b!203181 e!139237))

(declare-fun lt!316871 () tuple2!17368)

(assert (=> b!203181 (= lt!316871 lt!316891)))

(assert (=> b!203181 (= lt!316893 (appendBitsLSBFirstLoopTR!0 (_2!9336 lt!316871) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!316880 () Unit!14425)

(assert (=> b!203181 (= lt!316880 (lemmaIsPrefixTransitive!0 (_2!9336 lt!316427) (_2!9336 lt!316871) (_2!9336 lt!316893)))))

(assert (=> b!203181 (isPrefixOf!0 (_2!9336 lt!316427) (_2!9336 lt!316893))))

(declare-fun lt!316887 () Unit!14425)

(assert (=> b!203181 (= lt!316887 lt!316880)))

(assert (=> b!203181 (invariant!0 (currentBit!9482 (_2!9336 lt!316427)) (currentByte!9487 (_2!9336 lt!316427)) (size!4533 (buf!5038 (_2!9336 lt!316871))))))

(declare-fun lt!316895 () BitStream!8174)

(assert (=> b!203181 (= lt!316895 (BitStream!8175 (buf!5038 (_2!9336 lt!316871)) (currentByte!9487 (_2!9336 lt!316427)) (currentBit!9482 (_2!9336 lt!316427))))))

(assert (=> b!203181 (invariant!0 (currentBit!9482 lt!316895) (currentByte!9487 lt!316895) (size!4533 (buf!5038 (_2!9336 lt!316893))))))

(declare-fun lt!316892 () BitStream!8174)

(assert (=> b!203181 (= lt!316892 (BitStream!8175 (buf!5038 (_2!9336 lt!316893)) (currentByte!9487 lt!316895) (currentBit!9482 lt!316895)))))

(assert (=> b!203181 (= lt!316894 (readBitPure!0 lt!316895))))

(assert (=> b!203181 (= lt!316881 (readBitPure!0 lt!316892))))

(declare-fun lt!316904 () Unit!14425)

(declare-fun readBitPrefixLemma!0 (BitStream!8174 BitStream!8174) Unit!14425)

(assert (=> b!203181 (= lt!316904 (readBitPrefixLemma!0 lt!316895 (_2!9336 lt!316893)))))

(declare-fun res!170202 () Bool)

(assert (=> b!203181 (= res!170202 (= (bitIndex!0 (size!4533 (buf!5038 (_1!9337 lt!316894))) (currentByte!9487 (_1!9337 lt!316894)) (currentBit!9482 (_1!9337 lt!316894))) (bitIndex!0 (size!4533 (buf!5038 (_1!9337 lt!316881))) (currentByte!9487 (_1!9337 lt!316881)) (currentBit!9482 (_1!9337 lt!316881)))))))

(assert (=> b!203181 (=> (not res!170202) (not e!139245))))

(assert (=> b!203181 e!139245))

(declare-fun lt!316909 () Unit!14425)

(assert (=> b!203181 (= lt!316909 lt!316904)))

(declare-fun lt!316898 () tuple2!17382)

(assert (=> b!203181 (= lt!316898 (reader!0 (_2!9336 lt!316427) (_2!9336 lt!316893)))))

(declare-fun lt!316869 () tuple2!17382)

(assert (=> b!203181 (= lt!316869 (reader!0 (_2!9336 lt!316871) (_2!9336 lt!316893)))))

(declare-fun lt!316906 () tuple2!17370)

(assert (=> b!203181 (= lt!316906 (readBitPure!0 (_1!9343 lt!316898)))))

(assert (=> b!203181 (= (_2!9337 lt!316906) lt!316901)))

(declare-fun lt!316900 () Unit!14425)

(declare-fun Unit!14447 () Unit!14425)

(assert (=> b!203181 (= lt!316900 Unit!14447)))

(declare-fun lt!316910 () (_ BitVec 64))

(assert (=> b!203181 (= lt!316910 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!316914 () (_ BitVec 64))

(assert (=> b!203181 (= lt!316914 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!316916 () Unit!14425)

(assert (=> b!203181 (= lt!316916 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9336 lt!316427) (buf!5038 (_2!9336 lt!316893)) lt!316914))))

(assert (=> b!203181 (validate_offset_bits!1 ((_ sign_extend 32) (size!4533 (buf!5038 (_2!9336 lt!316893)))) ((_ sign_extend 32) (currentByte!9487 (_2!9336 lt!316427))) ((_ sign_extend 32) (currentBit!9482 (_2!9336 lt!316427))) lt!316914)))

(declare-fun lt!316902 () Unit!14425)

(assert (=> b!203181 (= lt!316902 lt!316916)))

(declare-fun lt!316884 () tuple2!17380)

(assert (=> b!203181 (= lt!316884 (readNBitsLSBFirstsLoopPure!0 (_1!9343 lt!316898) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!316910))))

(declare-fun lt!316863 () (_ BitVec 64))

(assert (=> b!203181 (= lt!316863 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!316889 () Unit!14425)

(assert (=> b!203181 (= lt!316889 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9336 lt!316871) (buf!5038 (_2!9336 lt!316893)) lt!316863))))

(assert (=> b!203181 (validate_offset_bits!1 ((_ sign_extend 32) (size!4533 (buf!5038 (_2!9336 lt!316893)))) ((_ sign_extend 32) (currentByte!9487 (_2!9336 lt!316871))) ((_ sign_extend 32) (currentBit!9482 (_2!9336 lt!316871))) lt!316863)))

(declare-fun lt!316879 () Unit!14425)

(assert (=> b!203181 (= lt!316879 lt!316889)))

(declare-fun lt!316917 () tuple2!17380)

(assert (=> b!203181 (= lt!316917 (readNBitsLSBFirstsLoopPure!0 (_1!9343 lt!316869) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!316910 (ite (_2!9337 lt!316906) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!316912 () tuple2!17380)

(assert (=> b!203181 (= lt!316912 (readNBitsLSBFirstsLoopPure!0 (_1!9343 lt!316898) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!316910))))

(declare-fun c!10075 () Bool)

(assert (=> b!203181 (= c!10075 (_2!9337 (readBitPure!0 (_1!9343 lt!316898))))))

(declare-fun lt!316882 () tuple2!17380)

(declare-fun withMovedBitIndex!0 (BitStream!8174 (_ BitVec 64)) BitStream!8174)

(assert (=> b!203181 (= lt!316882 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9343 lt!316898) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!316910 e!139243)))))

(declare-fun lt!316862 () Unit!14425)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14425)

(assert (=> b!203181 (= lt!316862 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9343 lt!316898) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!316910))))

(assert (=> b!203181 (and (= (_2!9342 lt!316912) (_2!9342 lt!316882)) (= (_1!9342 lt!316912) (_1!9342 lt!316882)))))

(declare-fun lt!316907 () Unit!14425)

(assert (=> b!203181 (= lt!316907 lt!316862)))

(assert (=> b!203181 (= (_1!9343 lt!316898) (withMovedBitIndex!0 (_2!9343 lt!316898) (bvsub (bitIndex!0 (size!4533 (buf!5038 (_2!9336 lt!316427))) (currentByte!9487 (_2!9336 lt!316427)) (currentBit!9482 (_2!9336 lt!316427))) (bitIndex!0 (size!4533 (buf!5038 (_2!9336 lt!316893))) (currentByte!9487 (_2!9336 lt!316893)) (currentBit!9482 (_2!9336 lt!316893))))))))

(declare-fun lt!316915 () Unit!14425)

(declare-fun Unit!14451 () Unit!14425)

(assert (=> b!203181 (= lt!316915 Unit!14451)))

(assert (=> b!203181 (= (_1!9343 lt!316869) (withMovedBitIndex!0 (_2!9343 lt!316869) (bvsub (bitIndex!0 (size!4533 (buf!5038 (_2!9336 lt!316871))) (currentByte!9487 (_2!9336 lt!316871)) (currentBit!9482 (_2!9336 lt!316871))) (bitIndex!0 (size!4533 (buf!5038 (_2!9336 lt!316893))) (currentByte!9487 (_2!9336 lt!316893)) (currentBit!9482 (_2!9336 lt!316893))))))))

(declare-fun lt!316896 () Unit!14425)

(declare-fun Unit!14452 () Unit!14425)

(assert (=> b!203181 (= lt!316896 Unit!14452)))

(assert (=> b!203181 (= (bitIndex!0 (size!4533 (buf!5038 (_2!9336 lt!316427))) (currentByte!9487 (_2!9336 lt!316427)) (currentBit!9482 (_2!9336 lt!316427))) (bvsub (bitIndex!0 (size!4533 (buf!5038 (_2!9336 lt!316871))) (currentByte!9487 (_2!9336 lt!316871)) (currentBit!9482 (_2!9336 lt!316871))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!316878 () Unit!14425)

(declare-fun Unit!14453 () Unit!14425)

(assert (=> b!203181 (= lt!316878 Unit!14453)))

(assert (=> b!203181 (= (_2!9342 lt!316884) (_2!9342 lt!316917))))

(declare-fun lt!316905 () Unit!14425)

(declare-fun Unit!14454 () Unit!14425)

(assert (=> b!203181 (= lt!316905 Unit!14454)))

(assert (=> b!203181 (invariant!0 (currentBit!9482 (_2!9336 lt!316893)) (currentByte!9487 (_2!9336 lt!316893)) (size!4533 (buf!5038 (_2!9336 lt!316893))))))

(declare-fun lt!316877 () Unit!14425)

(declare-fun Unit!14455 () Unit!14425)

(assert (=> b!203181 (= lt!316877 Unit!14455)))

(assert (=> b!203181 (= (size!4533 (buf!5038 (_2!9336 lt!316427))) (size!4533 (buf!5038 (_2!9336 lt!316893))))))

(declare-fun lt!316883 () Unit!14425)

(declare-fun Unit!14456 () Unit!14425)

(assert (=> b!203181 (= lt!316883 Unit!14456)))

(assert (=> b!203181 (= (bitIndex!0 (size!4533 (buf!5038 (_2!9336 lt!316893))) (currentByte!9487 (_2!9336 lt!316893)) (currentBit!9482 (_2!9336 lt!316893))) (bvsub (bvadd (bitIndex!0 (size!4533 (buf!5038 (_2!9336 lt!316427))) (currentByte!9487 (_2!9336 lt!316427)) (currentBit!9482 (_2!9336 lt!316427))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!316864 () Unit!14425)

(declare-fun Unit!14457 () Unit!14425)

(assert (=> b!203181 (= lt!316864 Unit!14457)))

(declare-fun lt!316890 () Unit!14425)

(declare-fun Unit!14458 () Unit!14425)

(assert (=> b!203181 (= lt!316890 Unit!14458)))

(assert (=> b!203181 (= lt!316899 (reader!0 (_2!9336 lt!316427) (_2!9336 lt!316893)))))

(declare-fun lt!316911 () (_ BitVec 64))

(assert (=> b!203181 (= lt!316911 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!316865 () Unit!14425)

(assert (=> b!203181 (= lt!316865 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9336 lt!316427) (buf!5038 (_2!9336 lt!316893)) lt!316911))))

(assert (=> b!203181 (validate_offset_bits!1 ((_ sign_extend 32) (size!4533 (buf!5038 (_2!9336 lt!316893)))) ((_ sign_extend 32) (currentByte!9487 (_2!9336 lt!316427))) ((_ sign_extend 32) (currentBit!9482 (_2!9336 lt!316427))) lt!316911)))

(declare-fun lt!316913 () Unit!14425)

(assert (=> b!203181 (= lt!316913 lt!316865)))

(assert (=> b!203181 (= lt!316908 (readNBitsLSBFirstsLoopPure!0 (_1!9343 lt!316899) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!170193 () Bool)

(assert (=> b!203181 (= res!170193 (= (_2!9342 lt!316908) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!203181 (=> (not res!170193) (not e!139244))))

(assert (=> b!203181 e!139244))

(declare-fun lt!316868 () Unit!14425)

(declare-fun Unit!14459 () Unit!14425)

(assert (=> b!203181 (= lt!316868 Unit!14459)))

(declare-fun b!203182 () Bool)

(assert (=> b!203182 (= lt!316872 (readBitPure!0 (readerFrom!0 (_2!9336 lt!316891) (currentBit!9482 (_2!9336 lt!316427)) (currentByte!9487 (_2!9336 lt!316427)))))))

(declare-fun res!170192 () Bool)

(assert (=> b!203182 (= res!170192 (and (= (_2!9337 lt!316872) lt!316901) (= (_1!9337 lt!316872) (_2!9336 lt!316891))))))

(assert (=> b!203182 (=> (not res!170192) (not e!139240))))

(assert (=> b!203182 (= e!139237 e!139240)))

(assert (= (and d!69425 c!10074) b!203175))

(assert (= (and d!69425 (not c!10074)) b!203181))

(assert (= (and b!203181 res!170198) b!203172))

(assert (= (and b!203172 res!170201) b!203179))

(assert (= (and b!203179 res!170203) b!203182))

(assert (= (and b!203182 res!170192) b!203180))

(assert (= (and b!203181 res!170202) b!203178))

(assert (= (and b!203181 c!10075) b!203173))

(assert (= (and b!203181 (not c!10075)) b!203170))

(assert (= (and b!203181 res!170193) b!203176))

(assert (= (or b!203175 b!203179) bm!3201))

(assert (= (and d!69425 res!170197) b!203169))

(assert (= (and b!203169 res!170200) b!203167))

(assert (= (and b!203167 res!170196) b!203168))

(assert (= (and b!203168 res!170195) b!203171))

(assert (= (and b!203171 res!170194) b!203174))

(assert (= (and b!203171 res!170199) b!203177))

(declare-fun m!313851 () Bool)

(assert (=> b!203168 m!313851))

(declare-fun m!313853 () Bool)

(assert (=> b!203180 m!313853))

(declare-fun m!313855 () Bool)

(assert (=> b!203180 m!313855))

(declare-fun m!313857 () Bool)

(assert (=> bm!3201 m!313857))

(assert (=> b!203172 m!313855))

(assert (=> b!203172 m!313653))

(declare-fun m!313859 () Bool)

(assert (=> b!203182 m!313859))

(assert (=> b!203182 m!313859))

(declare-fun m!313861 () Bool)

(assert (=> b!203182 m!313861))

(declare-fun m!313863 () Bool)

(assert (=> b!203174 m!313863))

(declare-fun m!313865 () Bool)

(assert (=> b!203167 m!313865))

(assert (=> b!203167 m!313653))

(declare-fun m!313867 () Bool)

(assert (=> d!69425 m!313867))

(declare-fun m!313869 () Bool)

(assert (=> b!203181 m!313869))

(declare-fun m!313871 () Bool)

(assert (=> b!203181 m!313871))

(declare-fun m!313873 () Bool)

(assert (=> b!203181 m!313873))

(declare-fun m!313875 () Bool)

(assert (=> b!203181 m!313875))

(declare-fun m!313877 () Bool)

(assert (=> b!203181 m!313877))

(declare-fun m!313879 () Bool)

(assert (=> b!203181 m!313879))

(declare-fun m!313881 () Bool)

(assert (=> b!203181 m!313881))

(declare-fun m!313883 () Bool)

(assert (=> b!203181 m!313883))

(declare-fun m!313885 () Bool)

(assert (=> b!203181 m!313885))

(declare-fun m!313887 () Bool)

(assert (=> b!203181 m!313887))

(declare-fun m!313889 () Bool)

(assert (=> b!203181 m!313889))

(declare-fun m!313891 () Bool)

(assert (=> b!203181 m!313891))

(declare-fun m!313893 () Bool)

(assert (=> b!203181 m!313893))

(declare-fun m!313895 () Bool)

(assert (=> b!203181 m!313895))

(declare-fun m!313897 () Bool)

(assert (=> b!203181 m!313897))

(declare-fun m!313899 () Bool)

(assert (=> b!203181 m!313899))

(declare-fun m!313901 () Bool)

(assert (=> b!203181 m!313901))

(declare-fun m!313903 () Bool)

(assert (=> b!203181 m!313903))

(declare-fun m!313905 () Bool)

(assert (=> b!203181 m!313905))

(declare-fun m!313907 () Bool)

(assert (=> b!203181 m!313907))

(declare-fun m!313909 () Bool)

(assert (=> b!203181 m!313909))

(declare-fun m!313911 () Bool)

(assert (=> b!203181 m!313911))

(declare-fun m!313913 () Bool)

(assert (=> b!203181 m!313913))

(declare-fun m!313915 () Bool)

(assert (=> b!203181 m!313915))

(declare-fun m!313917 () Bool)

(assert (=> b!203181 m!313917))

(declare-fun m!313919 () Bool)

(assert (=> b!203181 m!313919))

(declare-fun m!313921 () Bool)

(assert (=> b!203181 m!313921))

(declare-fun m!313923 () Bool)

(assert (=> b!203181 m!313923))

(declare-fun m!313925 () Bool)

(assert (=> b!203181 m!313925))

(declare-fun m!313927 () Bool)

(assert (=> b!203181 m!313927))

(declare-fun m!313929 () Bool)

(assert (=> b!203181 m!313929))

(declare-fun m!313931 () Bool)

(assert (=> b!203181 m!313931))

(assert (=> b!203181 m!313653))

(assert (=> b!203181 m!313889))

(declare-fun m!313933 () Bool)

(assert (=> b!203181 m!313933))

(declare-fun m!313935 () Bool)

(assert (=> b!203171 m!313935))

(declare-fun m!313937 () Bool)

(assert (=> b!203171 m!313937))

(declare-fun m!313939 () Bool)

(assert (=> b!203171 m!313939))

(assert (=> b!203171 m!313895))

(assert (=> b!203171 m!313879))

(declare-fun m!313941 () Bool)

(assert (=> b!203171 m!313941))

(declare-fun m!313943 () Bool)

(assert (=> b!203175 m!313943))

(assert (=> b!202959 d!69425))

(declare-fun d!69449 () Bool)

(assert (=> d!69449 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9482 thiss!1204) (currentByte!9487 thiss!1204) (size!4533 (buf!5038 thiss!1204))))))

(declare-fun bs!17119 () Bool)

(assert (= bs!17119 d!69449))

(assert (=> bs!17119 m!313641))

(assert (=> start!43048 d!69449))

(declare-fun d!69451 () Bool)

(declare-fun res!170208 () Bool)

(declare-fun e!139251 () Bool)

(assert (=> d!69451 (=> (not res!170208) (not e!139251))))

(assert (=> d!69451 (= res!170208 (= (size!4533 (buf!5038 thiss!1204)) (size!4533 (buf!5038 (_2!9336 lt!316427)))))))

(assert (=> d!69451 (= (isPrefixOf!0 thiss!1204 (_2!9336 lt!316427)) e!139251)))

(declare-fun b!203189 () Bool)

(declare-fun res!170206 () Bool)

(assert (=> b!203189 (=> (not res!170206) (not e!139251))))

(assert (=> b!203189 (= res!170206 (bvsle (bitIndex!0 (size!4533 (buf!5038 thiss!1204)) (currentByte!9487 thiss!1204) (currentBit!9482 thiss!1204)) (bitIndex!0 (size!4533 (buf!5038 (_2!9336 lt!316427))) (currentByte!9487 (_2!9336 lt!316427)) (currentBit!9482 (_2!9336 lt!316427)))))))

(declare-fun b!203190 () Bool)

(declare-fun e!139250 () Bool)

(assert (=> b!203190 (= e!139251 e!139250)))

(declare-fun res!170207 () Bool)

(assert (=> b!203190 (=> res!170207 e!139250)))

(assert (=> b!203190 (= res!170207 (= (size!4533 (buf!5038 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!203191 () Bool)

(assert (=> b!203191 (= e!139250 (arrayBitRangesEq!0 (buf!5038 thiss!1204) (buf!5038 (_2!9336 lt!316427)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4533 (buf!5038 thiss!1204)) (currentByte!9487 thiss!1204) (currentBit!9482 thiss!1204))))))

(assert (= (and d!69451 res!170208) b!203189))

(assert (= (and b!203189 res!170206) b!203190))

(assert (= (and b!203190 (not res!170207)) b!203191))

(assert (=> b!203189 m!313655))

(assert (=> b!203189 m!313653))

(assert (=> b!203191 m!313655))

(assert (=> b!203191 m!313655))

(declare-fun m!313945 () Bool)

(assert (=> b!203191 m!313945))

(assert (=> b!202964 d!69451))

(declare-fun d!69453 () Bool)

(declare-fun e!139252 () Bool)

(assert (=> d!69453 e!139252))

(declare-fun res!170210 () Bool)

(assert (=> d!69453 (=> (not res!170210) (not e!139252))))

(declare-fun lt!316987 () (_ BitVec 64))

(declare-fun lt!316988 () (_ BitVec 64))

(declare-fun lt!316986 () (_ BitVec 64))

(assert (=> d!69453 (= res!170210 (= lt!316987 (bvsub lt!316988 lt!316986)))))

(assert (=> d!69453 (or (= (bvand lt!316988 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316986 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!316988 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!316988 lt!316986) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69453 (= lt!316986 (remainingBits!0 ((_ sign_extend 32) (size!4533 (buf!5038 (_1!9337 lt!316422)))) ((_ sign_extend 32) (currentByte!9487 (_1!9337 lt!316422))) ((_ sign_extend 32) (currentBit!9482 (_1!9337 lt!316422)))))))

(declare-fun lt!316991 () (_ BitVec 64))

(declare-fun lt!316989 () (_ BitVec 64))

(assert (=> d!69453 (= lt!316988 (bvmul lt!316991 lt!316989))))

(assert (=> d!69453 (or (= lt!316991 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!316989 (bvsdiv (bvmul lt!316991 lt!316989) lt!316991)))))

(assert (=> d!69453 (= lt!316989 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69453 (= lt!316991 ((_ sign_extend 32) (size!4533 (buf!5038 (_1!9337 lt!316422)))))))

(assert (=> d!69453 (= lt!316987 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9487 (_1!9337 lt!316422))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9482 (_1!9337 lt!316422)))))))

(assert (=> d!69453 (invariant!0 (currentBit!9482 (_1!9337 lt!316422)) (currentByte!9487 (_1!9337 lt!316422)) (size!4533 (buf!5038 (_1!9337 lt!316422))))))

(assert (=> d!69453 (= (bitIndex!0 (size!4533 (buf!5038 (_1!9337 lt!316422))) (currentByte!9487 (_1!9337 lt!316422)) (currentBit!9482 (_1!9337 lt!316422))) lt!316987)))

(declare-fun b!203192 () Bool)

(declare-fun res!170209 () Bool)

(assert (=> b!203192 (=> (not res!170209) (not e!139252))))

(assert (=> b!203192 (= res!170209 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!316987))))

(declare-fun b!203193 () Bool)

(declare-fun lt!316990 () (_ BitVec 64))

(assert (=> b!203193 (= e!139252 (bvsle lt!316987 (bvmul lt!316990 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203193 (or (= lt!316990 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!316990 #b0000000000000000000000000000000000000000000000000000000000001000) lt!316990)))))

(assert (=> b!203193 (= lt!316990 ((_ sign_extend 32) (size!4533 (buf!5038 (_1!9337 lt!316422)))))))

(assert (= (and d!69453 res!170210) b!203192))

(assert (= (and b!203192 res!170209) b!203193))

(declare-fun m!313947 () Bool)

(assert (=> d!69453 m!313947))

(declare-fun m!313949 () Bool)

(assert (=> d!69453 m!313949))

(assert (=> b!202963 d!69453))

(declare-fun d!69455 () Bool)

(declare-datatypes ((tuple2!17388 0))(
  ( (tuple2!17389 (_1!9346 Bool) (_2!9346 BitStream!8174)) )
))
(declare-fun lt!317004 () tuple2!17388)

(declare-fun readBit!0 (BitStream!8174) tuple2!17388)

(assert (=> d!69455 (= lt!317004 (readBit!0 (readerFrom!0 (_2!9336 lt!316427) (currentBit!9482 thiss!1204) (currentByte!9487 thiss!1204))))))

(assert (=> d!69455 (= (readBitPure!0 (readerFrom!0 (_2!9336 lt!316427) (currentBit!9482 thiss!1204) (currentByte!9487 thiss!1204))) (tuple2!17371 (_2!9346 lt!317004) (_1!9346 lt!317004)))))

(declare-fun bs!17120 () Bool)

(assert (= bs!17120 d!69455))

(assert (=> bs!17120 m!313635))

(declare-fun m!313951 () Bool)

(assert (=> bs!17120 m!313951))

(assert (=> b!202968 d!69455))

(declare-fun d!69457 () Bool)

(declare-fun e!139263 () Bool)

(assert (=> d!69457 e!139263))

(declare-fun res!170228 () Bool)

(assert (=> d!69457 (=> (not res!170228) (not e!139263))))

(assert (=> d!69457 (= res!170228 (invariant!0 (currentBit!9482 (_2!9336 lt!316427)) (currentByte!9487 (_2!9336 lt!316427)) (size!4533 (buf!5038 (_2!9336 lt!316427)))))))

(assert (=> d!69457 (= (readerFrom!0 (_2!9336 lt!316427) (currentBit!9482 thiss!1204) (currentByte!9487 thiss!1204)) (BitStream!8175 (buf!5038 (_2!9336 lt!316427)) (currentByte!9487 thiss!1204) (currentBit!9482 thiss!1204)))))

(declare-fun b!203210 () Bool)

(assert (=> b!203210 (= e!139263 (invariant!0 (currentBit!9482 thiss!1204) (currentByte!9487 thiss!1204) (size!4533 (buf!5038 (_2!9336 lt!316427)))))))

(assert (= (and d!69457 res!170228) b!203210))

(assert (=> d!69457 m!313681))

(declare-fun m!313953 () Bool)

(assert (=> b!203210 m!313953))

(assert (=> b!202968 d!69457))

(push 1)

(assert (not b!203167))

(assert (not d!69407))

(assert (not b!203035))

(assert (not b!203036))

(assert (not d!69457))

(assert (not b!203043))

(assert (not b!203180))

(assert (not b!203189))

(assert (not d!69409))

(assert (not b!203045))

(assert (not b!203034))

(assert (not b!203174))

(assert (not bm!3201))

(assert (not b!203171))

(assert (not d!69425))

(assert (not b!203182))

(assert (not d!69449))

(assert (not d!69423))

(assert (not b!203191))

(assert (not d!69399))

(assert (not b!203175))

(assert (not b!203181))

(assert (not b!203033))

(assert (not d!69453))

(assert (not b!203168))

(assert (not b!203210))

(assert (not d!69411))

(assert (not d!69455))

(assert (not b!203172))

(check-sat)

(pop 1)

(push 1)

(check-sat)

