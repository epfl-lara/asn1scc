; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55832 () Bool)

(assert start!55832)

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun lt!401294 () (_ BitVec 64))

(declare-fun lt!401290 () (_ BitVec 64))

(declare-fun e!180064 () Bool)

(declare-fun b!259491 () Bool)

(assert (=> b!259491 (= e!180064 (not (or (not (= lt!401290 (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!401290 (bvand (bvadd lt!401294 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!259491 (= lt!401290 (bvand lt!401294 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!14200 0))(
  ( (array!14201 (arr!7206 (Array (_ BitVec 32) (_ BitVec 8))) (size!6219 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11360 0))(
  ( (BitStream!11361 (buf!6741 array!14200) (currentByte!12385 (_ BitVec 32)) (currentBit!12380 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11360)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!259491 (= lt!401294 (bitIndex!0 (size!6219 (buf!6741 thiss!1754)) (currentByte!12385 thiss!1754) (currentBit!12380 thiss!1754)))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22242 0))(
  ( (tuple2!22243 (_1!12057 Bool) (_2!12057 BitStream!11360)) )
))
(declare-fun lt!401293 () tuple2!22242)

(declare-fun lt!401292 () tuple2!22242)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun checkBitsLoop!0 (BitStream!11360 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22242)

(assert (=> b!259491 (= lt!401293 (checkBitsLoop!0 (_2!12057 lt!401292) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259491 (validate_offset_bits!1 ((_ sign_extend 32) (size!6219 (buf!6741 (_2!12057 lt!401292)))) ((_ sign_extend 32) (currentByte!12385 (_2!12057 lt!401292))) ((_ sign_extend 32) (currentBit!12380 (_2!12057 lt!401292))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18481 0))(
  ( (Unit!18482) )
))
(declare-fun lt!401291 () Unit!18481)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11360 BitStream!11360 (_ BitVec 64) (_ BitVec 64)) Unit!18481)

(assert (=> b!259491 (= lt!401291 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12057 lt!401292) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!259492 () Bool)

(declare-fun res!217372 () Bool)

(declare-fun e!180065 () Bool)

(assert (=> b!259492 (=> (not res!217372) (not e!180065))))

(assert (=> b!259492 (= res!217372 (not (= from!526 nBits!535)))))

(declare-fun b!259493 () Bool)

(declare-fun res!217370 () Bool)

(assert (=> b!259493 (=> (not res!217370) (not e!180065))))

(assert (=> b!259493 (= res!217370 (validate_offset_bits!1 ((_ sign_extend 32) (size!6219 (buf!6741 thiss!1754))) ((_ sign_extend 32) (currentByte!12385 thiss!1754)) ((_ sign_extend 32) (currentBit!12380 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!217369 () Bool)

(assert (=> start!55832 (=> (not res!217369) (not e!180065))))

(assert (=> start!55832 (= res!217369 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55832 e!180065))

(assert (=> start!55832 true))

(declare-fun e!180066 () Bool)

(declare-fun inv!12 (BitStream!11360) Bool)

(assert (=> start!55832 (and (inv!12 thiss!1754) e!180066)))

(declare-fun b!259494 () Bool)

(declare-fun array_inv!5960 (array!14200) Bool)

(assert (=> b!259494 (= e!180066 (array_inv!5960 (buf!6741 thiss!1754)))))

(declare-fun b!259495 () Bool)

(assert (=> b!259495 (= e!180065 e!180064)))

(declare-fun res!217371 () Bool)

(assert (=> b!259495 (=> (not res!217371) (not e!180064))))

(assert (=> b!259495 (= res!217371 (= (_1!12057 lt!401292) expected!109))))

(declare-fun readBit!0 (BitStream!11360) tuple2!22242)

(assert (=> b!259495 (= lt!401292 (readBit!0 thiss!1754))))

(assert (= (and start!55832 res!217369) b!259493))

(assert (= (and b!259493 res!217370) b!259492))

(assert (= (and b!259492 res!217372) b!259495))

(assert (= (and b!259495 res!217371) b!259491))

(assert (= start!55832 b!259494))

(declare-fun m!388807 () Bool)

(assert (=> start!55832 m!388807))

(declare-fun m!388809 () Bool)

(assert (=> b!259494 m!388809))

(declare-fun m!388811 () Bool)

(assert (=> b!259495 m!388811))

(declare-fun m!388813 () Bool)

(assert (=> b!259491 m!388813))

(declare-fun m!388815 () Bool)

(assert (=> b!259491 m!388815))

(declare-fun m!388817 () Bool)

(assert (=> b!259491 m!388817))

(declare-fun m!388819 () Bool)

(assert (=> b!259491 m!388819))

(declare-fun m!388821 () Bool)

(assert (=> b!259493 m!388821))

(push 1)

(assert (not b!259493))

(assert (not start!55832))

(assert (not b!259491))

(assert (not b!259494))

(assert (not b!259495))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87048 () Bool)

(assert (=> d!87048 (= (array_inv!5960 (buf!6741 thiss!1754)) (bvsge (size!6219 (buf!6741 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!259494 d!87048))

(declare-fun d!87050 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87050 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12380 thiss!1754) (currentByte!12385 thiss!1754) (size!6219 (buf!6741 thiss!1754))))))

(declare-fun bs!22055 () Bool)

(assert (= bs!22055 d!87050))

(declare-fun m!388827 () Bool)

(assert (=> bs!22055 m!388827))

(assert (=> start!55832 d!87050))

(declare-fun d!87052 () Bool)

(declare-fun e!180084 () Bool)

(assert (=> d!87052 e!180084))

(declare-fun res!217384 () Bool)

(assert (=> d!87052 (=> (not res!217384) (not e!180084))))

(declare-datatypes ((tuple2!22246 0))(
  ( (tuple2!22247 (_1!12059 Unit!18481) (_2!12059 BitStream!11360)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11360) tuple2!22246)

(assert (=> d!87052 (= res!217384 (= (buf!6741 (_2!12059 (increaseBitIndex!0 thiss!1754))) (buf!6741 thiss!1754)))))

(declare-fun lt!401348 () Bool)

(assert (=> d!87052 (= lt!401348 (not (= (bvand ((_ sign_extend 24) (select (arr!7206 (buf!6741 thiss!1754)) (currentByte!12385 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12380 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401349 () tuple2!22242)

(assert (=> d!87052 (= lt!401349 (tuple2!22243 (not (= (bvand ((_ sign_extend 24) (select (arr!7206 (buf!6741 thiss!1754)) (currentByte!12385 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12380 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12059 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!87052 (validate_offset_bit!0 ((_ sign_extend 32) (size!6219 (buf!6741 thiss!1754))) ((_ sign_extend 32) (currentByte!12385 thiss!1754)) ((_ sign_extend 32) (currentBit!12380 thiss!1754)))))

(assert (=> d!87052 (= (readBit!0 thiss!1754) lt!401349)))

(declare-fun lt!401352 () (_ BitVec 64))

(declare-fun b!259507 () Bool)

(declare-fun lt!401354 () (_ BitVec 64))

(assert (=> b!259507 (= e!180084 (= (bitIndex!0 (size!6219 (buf!6741 (_2!12059 (increaseBitIndex!0 thiss!1754)))) (currentByte!12385 (_2!12059 (increaseBitIndex!0 thiss!1754))) (currentBit!12380 (_2!12059 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!401354 lt!401352)))))

(assert (=> b!259507 (or (not (= (bvand lt!401354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401352 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401354 lt!401352) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259507 (= lt!401352 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259507 (= lt!401354 (bitIndex!0 (size!6219 (buf!6741 thiss!1754)) (currentByte!12385 thiss!1754) (currentBit!12380 thiss!1754)))))

(declare-fun lt!401351 () Bool)

(assert (=> b!259507 (= lt!401351 (not (= (bvand ((_ sign_extend 24) (select (arr!7206 (buf!6741 thiss!1754)) (currentByte!12385 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12380 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401350 () Bool)

(assert (=> b!259507 (= lt!401350 (not (= (bvand ((_ sign_extend 24) (select (arr!7206 (buf!6741 thiss!1754)) (currentByte!12385 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12380 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401353 () Bool)

(assert (=> b!259507 (= lt!401353 (not (= (bvand ((_ sign_extend 24) (select (arr!7206 (buf!6741 thiss!1754)) (currentByte!12385 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12380 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!87052 res!217384) b!259507))

(declare-fun m!388843 () Bool)

(assert (=> d!87052 m!388843))

(declare-fun m!388845 () Bool)

(assert (=> d!87052 m!388845))

(declare-fun m!388847 () Bool)

(assert (=> d!87052 m!388847))

(declare-fun m!388849 () Bool)

(assert (=> d!87052 m!388849))

(assert (=> b!259507 m!388813))

(declare-fun m!388851 () Bool)

(assert (=> b!259507 m!388851))

(assert (=> b!259507 m!388845))

(assert (=> b!259507 m!388847))

(assert (=> b!259507 m!388843))

(assert (=> b!259495 d!87052))

(declare-fun d!87058 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87058 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6219 (buf!6741 thiss!1754))) ((_ sign_extend 32) (currentByte!12385 thiss!1754)) ((_ sign_extend 32) (currentBit!12380 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6219 (buf!6741 thiss!1754))) ((_ sign_extend 32) (currentByte!12385 thiss!1754)) ((_ sign_extend 32) (currentBit!12380 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22056 () Bool)

(assert (= bs!22056 d!87058))

(declare-fun m!388853 () Bool)

(assert (=> bs!22056 m!388853))

(assert (=> b!259493 d!87058))

(declare-fun d!87060 () Bool)

(declare-fun e!180090 () Bool)

(assert (=> d!87060 e!180090))

(declare-fun res!217395 () Bool)

(assert (=> d!87060 (=> (not res!217395) (not e!180090))))

(declare-fun lt!401385 () (_ BitVec 64))

(declare-fun lt!401387 () (_ BitVec 64))

(declare-fun lt!401386 () (_ BitVec 64))

(assert (=> d!87060 (= res!217395 (= lt!401387 (bvsub lt!401386 lt!401385)))))

(assert (=> d!87060 (or (= (bvand lt!401386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401385 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401386 lt!401385) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87060 (= lt!401385 (remainingBits!0 ((_ sign_extend 32) (size!6219 (buf!6741 thiss!1754))) ((_ sign_extend 32) (currentByte!12385 thiss!1754)) ((_ sign_extend 32) (currentBit!12380 thiss!1754))))))

(declare-fun lt!401388 () (_ BitVec 64))

(declare-fun lt!401389 () (_ BitVec 64))

(assert (=> d!87060 (= lt!401386 (bvmul lt!401388 lt!401389))))

(assert (=> d!87060 (or (= lt!401388 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!401389 (bvsdiv (bvmul lt!401388 lt!401389) lt!401388)))))

(assert (=> d!87060 (= lt!401389 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87060 (= lt!401388 ((_ sign_extend 32) (size!6219 (buf!6741 thiss!1754))))))

(assert (=> d!87060 (= lt!401387 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12385 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12380 thiss!1754))))))

(assert (=> d!87060 (invariant!0 (currentBit!12380 thiss!1754) (currentByte!12385 thiss!1754) (size!6219 (buf!6741 thiss!1754)))))

(assert (=> d!87060 (= (bitIndex!0 (size!6219 (buf!6741 thiss!1754)) (currentByte!12385 thiss!1754) (currentBit!12380 thiss!1754)) lt!401387)))

(declare-fun b!259518 () Bool)

(declare-fun res!217396 () Bool)

(assert (=> b!259518 (=> (not res!217396) (not e!180090))))

(assert (=> b!259518 (= res!217396 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!401387))))

(declare-fun b!259519 () Bool)

(declare-fun lt!401390 () (_ BitVec 64))

(assert (=> b!259519 (= e!180090 (bvsle lt!401387 (bvmul lt!401390 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259519 (or (= lt!401390 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!401390 #b0000000000000000000000000000000000000000000000000000000000001000) lt!401390)))))

(assert (=> b!259519 (= lt!401390 ((_ sign_extend 32) (size!6219 (buf!6741 thiss!1754))))))

(assert (= (and d!87060 res!217395) b!259518))

(assert (= (and b!259518 res!217396) b!259519))

(assert (=> d!87060 m!388853))

(assert (=> d!87060 m!388827))

(assert (=> b!259491 d!87060))

(declare-fun b!259598 () Bool)

(declare-fun e!180141 () tuple2!22242)

(declare-fun lt!401506 () tuple2!22242)

(assert (=> b!259598 (= e!180141 (tuple2!22243 false (_2!12057 lt!401506)))))

(declare-fun b!259599 () Bool)

(declare-fun res!217445 () Bool)

(declare-fun e!180143 () Bool)

(assert (=> b!259599 (=> (not res!217445) (not e!180143))))

(declare-fun lt!401503 () tuple2!22242)

(assert (=> b!259599 (= res!217445 (and (= (buf!6741 (_2!12057 lt!401292)) (buf!6741 (_2!12057 lt!401503))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!12057 lt!401503))))))

(declare-fun e!180144 () Bool)

(declare-fun b!259600 () Bool)

(declare-fun lt!401508 () (_ BitVec 64))

(assert (=> b!259600 (= e!180144 (= (bvsub lt!401508 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6219 (buf!6741 (_2!12057 lt!401503))) (currentByte!12385 (_2!12057 lt!401503)) (currentBit!12380 (_2!12057 lt!401503)))))))

(assert (=> b!259600 (or (= (bvand lt!401508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401508 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!401509 () (_ BitVec 64))

(assert (=> b!259600 (= lt!401508 (bvadd lt!401509 nBits!535))))

(assert (=> b!259600 (or (not (= (bvand lt!401509 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401509 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401509 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259600 (= lt!401509 (bitIndex!0 (size!6219 (buf!6741 (_2!12057 lt!401292))) (currentByte!12385 (_2!12057 lt!401292)) (currentBit!12380 (_2!12057 lt!401292))))))

(declare-fun b!259601 () Bool)

(declare-fun e!180145 () tuple2!22242)

(assert (=> b!259601 (= e!180145 e!180141)))

(assert (=> b!259601 (= lt!401506 (readBit!0 (_2!12057 lt!401292)))))

(declare-fun c!11912 () Bool)

(assert (=> b!259601 (= c!11912 (not (= (_1!12057 lt!401506) expected!109)))))

(declare-fun b!259602 () Bool)

(assert (=> b!259602 (= e!180145 (tuple2!22243 true (_2!12057 lt!401292)))))

(declare-fun b!259603 () Bool)

(declare-fun e!180142 () Bool)

(assert (=> b!259603 (= e!180143 e!180142)))

(declare-fun res!217444 () Bool)

(assert (=> b!259603 (=> res!217444 e!180142)))

(assert (=> b!259603 (= res!217444 (or (not (_1!12057 lt!401503)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun d!87064 () Bool)

(assert (=> d!87064 e!180143))

(declare-fun res!217446 () Bool)

(assert (=> d!87064 (=> (not res!217446) (not e!180143))))

(declare-fun lt!401510 () (_ BitVec 64))

(assert (=> d!87064 (= res!217446 (bvsge (bvsub lt!401510 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6219 (buf!6741 (_2!12057 lt!401503))) (currentByte!12385 (_2!12057 lt!401503)) (currentBit!12380 (_2!12057 lt!401503)))))))

(assert (=> d!87064 (or (= (bvand lt!401510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401510 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!401507 () (_ BitVec 64))

(assert (=> d!87064 (= lt!401510 (bvadd lt!401507 nBits!535))))

(assert (=> d!87064 (or (not (= (bvand lt!401507 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401507 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401507 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87064 (= lt!401507 (bitIndex!0 (size!6219 (buf!6741 (_2!12057 lt!401292))) (currentByte!12385 (_2!12057 lt!401292)) (currentBit!12380 (_2!12057 lt!401292))))))

(assert (=> d!87064 (= lt!401503 e!180145)))

(declare-fun c!11913 () Bool)

(assert (=> d!87064 (= c!11913 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!87064 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!87064 (= (checkBitsLoop!0 (_2!12057 lt!401292) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!401503)))

(declare-fun b!259604 () Bool)

(declare-datatypes ((tuple2!22254 0))(
  ( (tuple2!22255 (_1!12063 BitStream!11360) (_2!12063 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11360) tuple2!22254)

(assert (=> b!259604 (= e!180142 (= expected!109 (_2!12063 (readBitPure!0 (_2!12057 lt!401292)))))))

(declare-fun b!259605 () Bool)

(declare-fun res!217443 () Bool)

(assert (=> b!259605 (=> (not res!217443) (not e!180143))))

(assert (=> b!259605 (= res!217443 e!180144)))

(declare-fun res!217447 () Bool)

(assert (=> b!259605 (=> res!217447 e!180144)))

(assert (=> b!259605 (= res!217447 (not (_1!12057 lt!401503)))))

(declare-fun lt!401512 () tuple2!22242)

(declare-fun b!259606 () Bool)

(assert (=> b!259606 (= lt!401512 (checkBitsLoop!0 (_2!12057 lt!401506) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!401511 () Unit!18481)

(declare-fun lt!401513 () Unit!18481)

(assert (=> b!259606 (= lt!401511 lt!401513)))

(declare-fun lt!401504 () (_ BitVec 64))

(declare-fun lt!401505 () (_ BitVec 64))

(assert (=> b!259606 (validate_offset_bits!1 ((_ sign_extend 32) (size!6219 (buf!6741 (_2!12057 lt!401506)))) ((_ sign_extend 32) (currentByte!12385 (_2!12057 lt!401506))) ((_ sign_extend 32) (currentBit!12380 (_2!12057 lt!401506))) (bvsub lt!401504 lt!401505))))

(assert (=> b!259606 (= lt!401513 (validateOffsetBitsIneqLemma!0 (_2!12057 lt!401292) (_2!12057 lt!401506) lt!401504 lt!401505))))

(assert (=> b!259606 (= lt!401505 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259606 (= lt!401504 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!259606 (= e!180141 (tuple2!22243 (_1!12057 lt!401512) (_2!12057 lt!401512)))))

(assert (= (and d!87064 c!11913) b!259602))

(assert (= (and d!87064 (not c!11913)) b!259601))

(assert (= (and b!259601 c!11912) b!259598))

(assert (= (and b!259601 (not c!11912)) b!259606))

(assert (= (and d!87064 res!217446) b!259599))

(assert (= (and b!259599 res!217445) b!259605))

(assert (= (and b!259605 (not res!217447)) b!259600))

(assert (= (and b!259605 res!217443) b!259603))

(assert (= (and b!259603 (not res!217444)) b!259604))

(declare-fun m!388899 () Bool)

(assert (=> b!259601 m!388899))

(declare-fun m!388901 () Bool)

(assert (=> b!259604 m!388901))

(declare-fun m!388903 () Bool)

(assert (=> b!259600 m!388903))

(declare-fun m!388905 () Bool)

(assert (=> b!259600 m!388905))

(assert (=> d!87064 m!388903))

(assert (=> d!87064 m!388905))

(declare-fun m!388907 () Bool)

(assert (=> b!259606 m!388907))

(declare-fun m!388909 () Bool)

(assert (=> b!259606 m!388909))

(declare-fun m!388911 () Bool)

(assert (=> b!259606 m!388911))

(assert (=> b!259491 d!87064))

(declare-fun d!87082 () Bool)

(assert (=> d!87082 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6219 (buf!6741 (_2!12057 lt!401292)))) ((_ sign_extend 32) (currentByte!12385 (_2!12057 lt!401292))) ((_ sign_extend 32) (currentBit!12380 (_2!12057 lt!401292))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6219 (buf!6741 (_2!12057 lt!401292)))) ((_ sign_extend 32) (currentByte!12385 (_2!12057 lt!401292))) ((_ sign_extend 32) (currentBit!12380 (_2!12057 lt!401292)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!22061 () Bool)

(assert (= bs!22061 d!87082))

(declare-fun m!388915 () Bool)

(assert (=> bs!22061 m!388915))

(assert (=> b!259491 d!87082))

(declare-fun d!87084 () Bool)

(declare-fun e!180151 () Bool)

(assert (=> d!87084 e!180151))

(declare-fun res!217453 () Bool)

(assert (=> d!87084 (=> (not res!217453) (not e!180151))))

(assert (=> d!87084 (= res!217453 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!401519 () Unit!18481)

(declare-fun choose!27 (BitStream!11360 BitStream!11360 (_ BitVec 64) (_ BitVec 64)) Unit!18481)

(assert (=> d!87084 (= lt!401519 (choose!27 thiss!1754 (_2!12057 lt!401292) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!87084 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!87084 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12057 lt!401292) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!401519)))

(declare-fun b!259612 () Bool)

(assert (=> b!259612 (= e!180151 (validate_offset_bits!1 ((_ sign_extend 32) (size!6219 (buf!6741 (_2!12057 lt!401292)))) ((_ sign_extend 32) (currentByte!12385 (_2!12057 lt!401292))) ((_ sign_extend 32) (currentBit!12380 (_2!12057 lt!401292))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!87084 res!217453) b!259612))

(declare-fun m!388917 () Bool)

(assert (=> d!87084 m!388917))

(assert (=> b!259612 m!388817))

(assert (=> b!259491 d!87084))

(push 1)

(assert (not d!87060))

(assert (not b!259612))

(assert (not b!259604))

(assert (not d!87082))

(assert (not d!87052))

(assert (not b!259507))

(assert (not b!259606))

(assert (not d!87084))

(assert (not d!87058))

(assert (not d!87050))

(assert (not d!87064))

(assert (not b!259601))

(assert (not b!259600))

(check-sat)

(pop 1)

(push 1)

(check-sat)

