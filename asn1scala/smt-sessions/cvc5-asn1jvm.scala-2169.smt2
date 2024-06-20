; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55060 () Bool)

(assert start!55060)

(declare-fun b!257043 () Bool)

(declare-fun res!215428 () Bool)

(declare-fun e!178196 () Bool)

(assert (=> b!257043 (=> (not res!215428) (not e!178196))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!257043 (= res!215428 (not (= from!526 nBits!535)))))

(declare-fun b!257044 () Bool)

(declare-fun res!215425 () Bool)

(assert (=> b!257044 (=> (not res!215425) (not e!178196))))

(declare-datatypes ((array!13947 0))(
  ( (array!13948 (arr!7102 (Array (_ BitVec 32) (_ BitVec 8))) (size!6115 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11152 0))(
  ( (BitStream!11153 (buf!6637 array!13947) (currentByte!12167 (_ BitVec 32)) (currentBit!12162 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11152)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257044 (= res!215425 (validate_offset_bits!1 ((_ sign_extend 32) (size!6115 (buf!6637 thiss!1754))) ((_ sign_extend 32) (currentByte!12167 thiss!1754)) ((_ sign_extend 32) (currentBit!12162 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257045 () Bool)

(declare-fun e!178195 () Bool)

(declare-fun array_inv!5856 (array!13947) Bool)

(assert (=> b!257045 (= e!178195 (array_inv!5856 (buf!6637 thiss!1754)))))

(declare-fun res!215427 () Bool)

(assert (=> start!55060 (=> (not res!215427) (not e!178196))))

(assert (=> start!55060 (= res!215427 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55060 e!178196))

(assert (=> start!55060 true))

(declare-fun inv!12 (BitStream!11152) Bool)

(assert (=> start!55060 (and (inv!12 thiss!1754) e!178195)))

(declare-fun b!257046 () Bool)

(declare-fun e!178198 () Bool)

(assert (=> b!257046 (= e!178196 e!178198)))

(declare-fun res!215426 () Bool)

(assert (=> b!257046 (=> (not res!215426) (not e!178198))))

(declare-datatypes ((tuple2!21974 0))(
  ( (tuple2!21975 (_1!11923 Bool) (_2!11923 BitStream!11152)) )
))
(declare-fun lt!398351 () tuple2!21974)

(declare-fun expected!109 () Bool)

(assert (=> b!257046 (= res!215426 (not (= (_1!11923 lt!398351) expected!109)))))

(declare-fun readBit!0 (BitStream!11152) tuple2!21974)

(assert (=> b!257046 (= lt!398351 (readBit!0 thiss!1754))))

(declare-fun b!257047 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!257047 (= e!178198 (not (invariant!0 (currentBit!12162 (_2!11923 lt!398351)) (currentByte!12167 (_2!11923 lt!398351)) (size!6115 (buf!6637 (_2!11923 lt!398351))))))))

(assert (= (and start!55060 res!215427) b!257044))

(assert (= (and b!257044 res!215425) b!257043))

(assert (= (and b!257043 res!215428) b!257046))

(assert (= (and b!257046 res!215426) b!257047))

(assert (= start!55060 b!257045))

(declare-fun m!386603 () Bool)

(assert (=> start!55060 m!386603))

(declare-fun m!386605 () Bool)

(assert (=> b!257046 m!386605))

(declare-fun m!386607 () Bool)

(assert (=> b!257047 m!386607))

(declare-fun m!386609 () Bool)

(assert (=> b!257044 m!386609))

(declare-fun m!386611 () Bool)

(assert (=> b!257045 m!386611))

(push 1)

(assert (not start!55060))

(assert (not b!257046))

(assert (not b!257045))

(assert (not b!257047))

(assert (not b!257044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86292 () Bool)

(assert (=> d!86292 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12162 thiss!1754) (currentByte!12167 thiss!1754) (size!6115 (buf!6637 thiss!1754))))))

(declare-fun bs!21826 () Bool)

(assert (= bs!21826 d!86292))

(declare-fun m!386635 () Bool)

(assert (=> bs!21826 m!386635))

(assert (=> start!55060 d!86292))

(declare-fun d!86294 () Bool)

(assert (=> d!86294 (= (invariant!0 (currentBit!12162 (_2!11923 lt!398351)) (currentByte!12167 (_2!11923 lt!398351)) (size!6115 (buf!6637 (_2!11923 lt!398351)))) (and (bvsge (currentBit!12162 (_2!11923 lt!398351)) #b00000000000000000000000000000000) (bvslt (currentBit!12162 (_2!11923 lt!398351)) #b00000000000000000000000000001000) (bvsge (currentByte!12167 (_2!11923 lt!398351)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12167 (_2!11923 lt!398351)) (size!6115 (buf!6637 (_2!11923 lt!398351)))) (and (= (currentBit!12162 (_2!11923 lt!398351)) #b00000000000000000000000000000000) (= (currentByte!12167 (_2!11923 lt!398351)) (size!6115 (buf!6637 (_2!11923 lt!398351))))))))))

(assert (=> b!257047 d!86294))

(declare-fun d!86298 () Bool)

(declare-fun e!178242 () Bool)

(assert (=> d!86298 e!178242))

(declare-fun res!215460 () Bool)

(assert (=> d!86298 (=> (not res!215460) (not e!178242))))

(declare-datatypes ((Unit!18371 0))(
  ( (Unit!18372) )
))
(declare-datatypes ((tuple2!21982 0))(
  ( (tuple2!21983 (_1!11927 Unit!18371) (_2!11927 BitStream!11152)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11152) tuple2!21982)

(assert (=> d!86298 (= res!215460 (= (buf!6637 (_2!11927 (increaseBitIndex!0 thiss!1754))) (buf!6637 thiss!1754)))))

(declare-fun lt!398408 () Bool)

(assert (=> d!86298 (= lt!398408 (not (= (bvand ((_ sign_extend 24) (select (arr!7102 (buf!6637 thiss!1754)) (currentByte!12167 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12162 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398413 () tuple2!21974)

(assert (=> d!86298 (= lt!398413 (tuple2!21975 (not (= (bvand ((_ sign_extend 24) (select (arr!7102 (buf!6637 thiss!1754)) (currentByte!12167 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12162 thiss!1754)))) #b00000000000000000000000000000000)) (_2!11927 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86298 (validate_offset_bit!0 ((_ sign_extend 32) (size!6115 (buf!6637 thiss!1754))) ((_ sign_extend 32) (currentByte!12167 thiss!1754)) ((_ sign_extend 32) (currentBit!12162 thiss!1754)))))

(assert (=> d!86298 (= (readBit!0 thiss!1754) lt!398413)))

(declare-fun b!257085 () Bool)

(declare-fun lt!398409 () (_ BitVec 64))

(declare-fun lt!398407 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257085 (= e!178242 (= (bitIndex!0 (size!6115 (buf!6637 (_2!11927 (increaseBitIndex!0 thiss!1754)))) (currentByte!12167 (_2!11927 (increaseBitIndex!0 thiss!1754))) (currentBit!12162 (_2!11927 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!398407 lt!398409)))))

(assert (=> b!257085 (or (not (= (bvand lt!398407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398409 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!398407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!398407 lt!398409) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257085 (= lt!398409 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257085 (= lt!398407 (bitIndex!0 (size!6115 (buf!6637 thiss!1754)) (currentByte!12167 thiss!1754) (currentBit!12162 thiss!1754)))))

(declare-fun lt!398411 () Bool)

(assert (=> b!257085 (= lt!398411 (not (= (bvand ((_ sign_extend 24) (select (arr!7102 (buf!6637 thiss!1754)) (currentByte!12167 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12162 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398412 () Bool)

(assert (=> b!257085 (= lt!398412 (not (= (bvand ((_ sign_extend 24) (select (arr!7102 (buf!6637 thiss!1754)) (currentByte!12167 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12162 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398410 () Bool)

(assert (=> b!257085 (= lt!398410 (not (= (bvand ((_ sign_extend 24) (select (arr!7102 (buf!6637 thiss!1754)) (currentByte!12167 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12162 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86298 res!215460) b!257085))

(declare-fun m!386651 () Bool)

(assert (=> d!86298 m!386651))

(declare-fun m!386653 () Bool)

(assert (=> d!86298 m!386653))

(declare-fun m!386655 () Bool)

(assert (=> d!86298 m!386655))

(declare-fun m!386657 () Bool)

(assert (=> d!86298 m!386657))

(assert (=> b!257085 m!386655))

(declare-fun m!386663 () Bool)

(assert (=> b!257085 m!386663))

(declare-fun m!386667 () Bool)

(assert (=> b!257085 m!386667))

(assert (=> b!257085 m!386651))

(assert (=> b!257085 m!386653))

(assert (=> b!257046 d!86298))

(declare-fun d!86302 () Bool)

(assert (=> d!86302 (= (array_inv!5856 (buf!6637 thiss!1754)) (bvsge (size!6115 (buf!6637 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!257045 d!86302))

(declare-fun d!86306 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86306 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6115 (buf!6637 thiss!1754))) ((_ sign_extend 32) (currentByte!12167 thiss!1754)) ((_ sign_extend 32) (currentBit!12162 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6115 (buf!6637 thiss!1754))) ((_ sign_extend 32) (currentByte!12167 thiss!1754)) ((_ sign_extend 32) (currentBit!12162 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21828 () Bool)

(assert (= bs!21828 d!86306))

(declare-fun m!386675 () Bool)

(assert (=> bs!21828 m!386675))

(assert (=> b!257044 d!86306))

(push 1)

(assert (not b!257085))

(assert (not d!86298))

(assert (not d!86306))

(assert (not d!86292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86324 () Bool)

(declare-fun e!178253 () Bool)

(assert (=> d!86324 e!178253))

(declare-fun res!215480 () Bool)

(assert (=> d!86324 (=> (not res!215480) (not e!178253))))

(declare-fun lt!398472 () (_ BitVec 64))

(declare-fun lt!398476 () (_ BitVec 64))

(declare-fun lt!398473 () (_ BitVec 64))

(assert (=> d!86324 (= res!215480 (= lt!398476 (bvsub lt!398472 lt!398473)))))

(assert (=> d!86324 (or (= (bvand lt!398472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398473 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398472 lt!398473) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86324 (= lt!398473 (remainingBits!0 ((_ sign_extend 32) (size!6115 (buf!6637 (_2!11927 (increaseBitIndex!0 thiss!1754))))) ((_ sign_extend 32) (currentByte!12167 (_2!11927 (increaseBitIndex!0 thiss!1754)))) ((_ sign_extend 32) (currentBit!12162 (_2!11927 (increaseBitIndex!0 thiss!1754))))))))

(declare-fun lt!398474 () (_ BitVec 64))

(declare-fun lt!398475 () (_ BitVec 64))

(assert (=> d!86324 (= lt!398472 (bvmul lt!398474 lt!398475))))

(assert (=> d!86324 (or (= lt!398474 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!398475 (bvsdiv (bvmul lt!398474 lt!398475) lt!398474)))))

(assert (=> d!86324 (= lt!398475 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86324 (= lt!398474 ((_ sign_extend 32) (size!6115 (buf!6637 (_2!11927 (increaseBitIndex!0 thiss!1754))))))))

(assert (=> d!86324 (= lt!398476 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12167 (_2!11927 (increaseBitIndex!0 thiss!1754)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12162 (_2!11927 (increaseBitIndex!0 thiss!1754))))))))

(assert (=> d!86324 (invariant!0 (currentBit!12162 (_2!11927 (increaseBitIndex!0 thiss!1754))) (currentByte!12167 (_2!11927 (increaseBitIndex!0 thiss!1754))) (size!6115 (buf!6637 (_2!11927 (increaseBitIndex!0 thiss!1754)))))))

(assert (=> d!86324 (= (bitIndex!0 (size!6115 (buf!6637 (_2!11927 (increaseBitIndex!0 thiss!1754)))) (currentByte!12167 (_2!11927 (increaseBitIndex!0 thiss!1754))) (currentBit!12162 (_2!11927 (increaseBitIndex!0 thiss!1754)))) lt!398476)))

(declare-fun b!257105 () Bool)

(declare-fun res!215481 () Bool)

(assert (=> b!257105 (=> (not res!215481) (not e!178253))))

(assert (=> b!257105 (= res!215481 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!398476))))

(declare-fun b!257106 () Bool)

(declare-fun lt!398477 () (_ BitVec 64))

(assert (=> b!257106 (= e!178253 (bvsle lt!398476 (bvmul lt!398477 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!257106 (or (= lt!398477 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!398477 #b0000000000000000000000000000000000000000000000000000000000001000) lt!398477)))))

(assert (=> b!257106 (= lt!398477 ((_ sign_extend 32) (size!6115 (buf!6637 (_2!11927 (increaseBitIndex!0 thiss!1754))))))))

(assert (= (and d!86324 res!215480) b!257105))

(assert (= (and b!257105 res!215481) b!257106))

(declare-fun m!386689 () Bool)

(assert (=> d!86324 m!386689))

(declare-fun m!386691 () Bool)

(assert (=> d!86324 m!386691))

(assert (=> b!257085 d!86324))

(declare-fun d!86328 () Bool)

(declare-fun e!178256 () Bool)

(assert (=> d!86328 e!178256))

(declare-fun res!215487 () Bool)

(assert (=> d!86328 (=> (not res!215487) (not e!178256))))

(declare-fun lt!398491 () (_ BitVec 64))

(declare-fun lt!398490 () tuple2!21982)

(declare-fun lt!398488 () (_ BitVec 64))

(assert (=> d!86328 (= res!215487 (= (bvadd lt!398488 lt!398491) (bitIndex!0 (size!6115 (buf!6637 (_2!11927 lt!398490))) (currentByte!12167 (_2!11927 lt!398490)) (currentBit!12162 (_2!11927 lt!398490)))))))

(assert (=> d!86328 (or (not (= (bvand lt!398488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398491 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!398488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!398488 lt!398491) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86328 (= lt!398491 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!86328 (= lt!398488 (bitIndex!0 (size!6115 (buf!6637 thiss!1754)) (currentByte!12167 thiss!1754) (currentBit!12162 thiss!1754)))))

(declare-fun Unit!18377 () Unit!18371)

(declare-fun Unit!18378 () Unit!18371)

(assert (=> d!86328 (= lt!398490 (ite (bvslt (currentBit!12162 thiss!1754) #b00000000000000000000000000000111) (tuple2!21983 Unit!18377 (BitStream!11153 (buf!6637 thiss!1754) (currentByte!12167 thiss!1754) (bvadd (currentBit!12162 thiss!1754) #b00000000000000000000000000000001))) (tuple2!21983 Unit!18378 (BitStream!11153 (buf!6637 thiss!1754) (bvadd (currentByte!12167 thiss!1754) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!86328 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6115 (buf!6637 thiss!1754))) ((_ sign_extend 32) (currentByte!12167 thiss!1754)) ((_ sign_extend 32) (currentBit!12162 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!86328 (= (increaseBitIndex!0 thiss!1754) lt!398490)))

(declare-fun b!257111 () Bool)

(declare-fun res!215486 () Bool)

(assert (=> b!257111 (=> (not res!215486) (not e!178256))))

(declare-fun lt!398489 () (_ BitVec 64))

(declare-fun lt!398492 () (_ BitVec 64))

(assert (=> b!257111 (= res!215486 (= (bvsub lt!398489 lt!398492) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!257111 (or (= (bvand lt!398489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398492 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398489 lt!398492) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257111 (= lt!398492 (remainingBits!0 ((_ sign_extend 32) (size!6115 (buf!6637 (_2!11927 lt!398490)))) ((_ sign_extend 32) (currentByte!12167 (_2!11927 lt!398490))) ((_ sign_extend 32) (currentBit!12162 (_2!11927 lt!398490)))))))

(assert (=> b!257111 (= lt!398489 (remainingBits!0 ((_ sign_extend 32) (size!6115 (buf!6637 thiss!1754))) ((_ sign_extend 32) (currentByte!12167 thiss!1754)) ((_ sign_extend 32) (currentBit!12162 thiss!1754))))))

(declare-fun b!257112 () Bool)

(assert (=> b!257112 (= e!178256 (= (size!6115 (buf!6637 thiss!1754)) (size!6115 (buf!6637 (_2!11927 lt!398490)))))))

(assert (= (and d!86328 res!215487) b!257111))

(assert (= (and b!257111 res!215486) b!257112))

(declare-fun m!386693 () Bool)

(assert (=> d!86328 m!386693))

(assert (=> d!86328 m!386663))

(assert (=> d!86328 m!386675))

(declare-fun m!386695 () Bool)

(assert (=> b!257111 m!386695))

(assert (=> b!257111 m!386675))

(assert (=> b!257085 d!86328))

(declare-fun d!86336 () Bool)

(declare-fun e!178257 () Bool)

(assert (=> d!86336 e!178257))

(declare-fun res!215488 () Bool)

(assert (=> d!86336 (=> (not res!215488) (not e!178257))))

(declare-fun lt!398494 () (_ BitVec 64))

(declare-fun lt!398497 () (_ BitVec 64))

(declare-fun lt!398493 () (_ BitVec 64))

(assert (=> d!86336 (= res!215488 (= lt!398497 (bvsub lt!398493 lt!398494)))))

(assert (=> d!86336 (or (= (bvand lt!398493 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398494 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398493 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398493 lt!398494) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86336 (= lt!398494 (remainingBits!0 ((_ sign_extend 32) (size!6115 (buf!6637 thiss!1754))) ((_ sign_extend 32) (currentByte!12167 thiss!1754)) ((_ sign_extend 32) (currentBit!12162 thiss!1754))))))

(declare-fun lt!398495 () (_ BitVec 64))

(declare-fun lt!398496 () (_ BitVec 64))

(assert (=> d!86336 (= lt!398493 (bvmul lt!398495 lt!398496))))

(assert (=> d!86336 (or (= lt!398495 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!398496 (bvsdiv (bvmul lt!398495 lt!398496) lt!398495)))))

(assert (=> d!86336 (= lt!398496 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86336 (= lt!398495 ((_ sign_extend 32) (size!6115 (buf!6637 thiss!1754))))))

(assert (=> d!86336 (= lt!398497 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12167 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12162 thiss!1754))))))

(assert (=> d!86336 (invariant!0 (currentBit!12162 thiss!1754) (currentByte!12167 thiss!1754) (size!6115 (buf!6637 thiss!1754)))))

(assert (=> d!86336 (= (bitIndex!0 (size!6115 (buf!6637 thiss!1754)) (currentByte!12167 thiss!1754) (currentBit!12162 thiss!1754)) lt!398497)))

(declare-fun b!257113 () Bool)

(declare-fun res!215489 () Bool)

(assert (=> b!257113 (=> (not res!215489) (not e!178257))))

(assert (=> b!257113 (= res!215489 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!398497))))

(declare-fun b!257114 () Bool)

(declare-fun lt!398498 () (_ BitVec 64))

(assert (=> b!257114 (= e!178257 (bvsle lt!398497 (bvmul lt!398498 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!257114 (or (= lt!398498 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!398498 #b0000000000000000000000000000000000000000000000000000000000001000) lt!398498)))))

(assert (=> b!257114 (= lt!398498 ((_ sign_extend 32) (size!6115 (buf!6637 thiss!1754))))))

(assert (= (and d!86336 res!215488) b!257113))

(assert (= (and b!257113 res!215489) b!257114))

(assert (=> d!86336 m!386675))

(assert (=> d!86336 m!386635))

(assert (=> b!257085 d!86336))

(assert (=> d!86298 d!86328))

(declare-fun d!86338 () Bool)

(assert (=> d!86338 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6115 (buf!6637 thiss!1754))) ((_ sign_extend 32) (currentByte!12167 thiss!1754)) ((_ sign_extend 32) (currentBit!12162 thiss!1754))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6115 (buf!6637 thiss!1754))) ((_ sign_extend 32) (currentByte!12167 thiss!1754)) ((_ sign_extend 32) (currentBit!12162 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21832 () Bool)

(assert (= bs!21832 d!86338))

(assert (=> bs!21832 m!386675))

(assert (=> d!86298 d!86338))

(declare-fun d!86340 () Bool)

(assert (=> d!86340 (= (remainingBits!0 ((_ sign_extend 32) (size!6115 (buf!6637 thiss!1754))) ((_ sign_extend 32) (currentByte!12167 thiss!1754)) ((_ sign_extend 32) (currentBit!12162 thiss!1754))) (bvsub (bvmul ((_ sign_extend 32) (size!6115 (buf!6637 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12167 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12162 thiss!1754)))))))

(assert (=> d!86306 d!86340))

(declare-fun d!86342 () Bool)

(assert (=> d!86342 (= (invariant!0 (currentBit!12162 thiss!1754) (currentByte!12167 thiss!1754) (size!6115 (buf!6637 thiss!1754))) (and (bvsge (currentBit!12162 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12162 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12167 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12167 thiss!1754) (size!6115 (buf!6637 thiss!1754))) (and (= (currentBit!12162 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12167 thiss!1754) (size!6115 (buf!6637 thiss!1754)))))))))

(assert (=> d!86292 d!86342))

(push 1)

(assert (not d!86328))

(assert (not d!86338))

(assert (not d!86336))

(assert (not b!257111))

(assert (not d!86324))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

