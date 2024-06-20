; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49176 () Bool)

(assert start!49176)

(declare-fun b!233484 () Bool)

(declare-fun e!160892 () Bool)

(declare-fun e!160888 () Bool)

(assert (=> b!233484 (= e!160892 e!160888)))

(declare-fun res!195340 () Bool)

(assert (=> b!233484 (=> (not res!195340) (not e!160888))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!369471 () (_ BitVec 64))

(declare-fun lt!369469 () (_ BitVec 64))

(declare-fun lt!369467 () (_ BitVec 64))

(assert (=> b!233484 (= res!195340 (and (= lt!369467 lt!369469) (= (bvsub lt!369467 bits!86) lt!369471)))))

(declare-datatypes ((array!12064 0))(
  ( (array!12065 (arr!6280 (Array (_ BitVec 32) (_ BitVec 8))) (size!5293 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9682 0))(
  ( (BitStream!9683 (buf!5834 array!12064) (currentByte!10868 (_ BitVec 32)) (currentBit!10863 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9682)

(assert (=> b!233484 (= lt!369469 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10868 b2!99))) ((_ sign_extend 32) (currentBit!10863 b2!99))))))

(declare-fun b!233485 () Bool)

(declare-fun e!160887 () Bool)

(assert (=> b!233485 (= e!160888 e!160887)))

(declare-fun res!195345 () Bool)

(assert (=> b!233485 (=> (not res!195345) (not e!160887))))

(declare-fun lt!369468 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun lt!369470 () (_ BitVec 64))

(assert (=> b!233485 (= res!195345 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!369468 (bvsub lt!369469 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!369468 lt!369469) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369470))))))

(assert (=> b!233485 (= lt!369468 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5293 (buf!5834 b2!99)))))))

(declare-fun b!233487 () Bool)

(declare-fun e!160886 () Bool)

(declare-fun e!160885 () Bool)

(assert (=> b!233487 (= e!160886 e!160885)))

(declare-fun res!195341 () Bool)

(assert (=> b!233487 (=> (not res!195341) (not e!160885))))

(assert (=> b!233487 (= res!195341 (bvsle bits!86 lt!369467))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233487 (= lt!369467 (bitIndex!0 (size!5293 (buf!5834 b2!99)) (currentByte!10868 b2!99) (currentBit!10863 b2!99)))))

(declare-fun b!233488 () Bool)

(declare-fun e!160884 () Bool)

(assert (=> b!233488 (= e!160884 e!160892)))

(declare-fun res!195344 () Bool)

(assert (=> b!233488 (=> (not res!195344) (not e!160892))))

(declare-fun b1!101 () BitStream!9682)

(assert (=> b!233488 (= res!195344 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5293 (buf!5834 b1!101)))) lt!369471) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233488 (= lt!369471 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10868 b1!101))) ((_ sign_extend 32) (currentBit!10863 b1!101))))))

(declare-fun b!233489 () Bool)

(declare-fun e!160891 () Bool)

(declare-fun array_inv!5034 (array!12064) Bool)

(assert (=> b!233489 (= e!160891 (array_inv!5034 (buf!5834 b2!99)))))

(declare-fun b!233490 () Bool)

(declare-fun e!160883 () Bool)

(assert (=> b!233490 (= e!160883 (array_inv!5034 (buf!5834 b1!101)))))

(declare-fun b!233491 () Bool)

(declare-fun res!195338 () Bool)

(assert (=> b!233491 (=> (not res!195338) (not e!160887))))

(declare-fun lt!369466 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233491 (= res!195338 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5293 (buf!5834 b2!99))) ((_ sign_extend 32) (currentByte!10868 b2!99)) ((_ sign_extend 32) (currentBit!10863 b2!99)) (bvsub bytes!19 lt!369466)))))

(declare-fun b!233492 () Bool)

(assert (=> b!233492 (= e!160887 (and (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!233493 () Bool)

(assert (=> b!233493 (= e!160885 e!160884)))

(declare-fun res!195339 () Bool)

(assert (=> b!233493 (=> (not res!195339) (not e!160884))))

(assert (=> b!233493 (= res!195339 (bvsle lt!369466 bytes!19))))

(assert (=> b!233493 (= lt!369466 ((_ extract 31 0) lt!369470))))

(assert (=> b!233493 (= lt!369470 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun res!195342 () Bool)

(assert (=> start!49176 (=> (not res!195342) (not e!160886))))

(assert (=> start!49176 (= res!195342 (and (= (size!5293 (buf!5834 b1!101)) (size!5293 (buf!5834 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49176 e!160886))

(declare-fun inv!12 (BitStream!9682) Bool)

(assert (=> start!49176 (and (inv!12 b1!101) e!160883)))

(assert (=> start!49176 (and (inv!12 b2!99) e!160891)))

(assert (=> start!49176 true))

(declare-fun b!233486 () Bool)

(declare-fun res!195343 () Bool)

(assert (=> b!233486 (=> (not res!195343) (not e!160884))))

(assert (=> b!233486 (= res!195343 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5293 (buf!5834 b1!101))) ((_ sign_extend 32) (currentByte!10868 b1!101)) ((_ sign_extend 32) (currentBit!10863 b1!101)) bytes!19))))

(declare-fun b!233494 () Bool)

(declare-fun res!195337 () Bool)

(assert (=> b!233494 (=> (not res!195337) (not e!160884))))

(assert (=> b!233494 (= res!195337 (= lt!369467 (bvadd (bitIndex!0 (size!5293 (buf!5834 b1!101)) (currentByte!10868 b1!101) (currentBit!10863 b1!101)) bits!86)))))

(declare-fun b!233495 () Bool)

(declare-fun res!195336 () Bool)

(assert (=> b!233495 (=> (not res!195336) (not e!160884))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233495 (= res!195336 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5293 (buf!5834 b1!101))) ((_ sign_extend 32) (currentByte!10868 b1!101)) ((_ sign_extend 32) (currentBit!10863 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!49176 res!195342) b!233487))

(assert (= (and b!233487 res!195341) b!233493))

(assert (= (and b!233493 res!195339) b!233486))

(assert (= (and b!233486 res!195343) b!233494))

(assert (= (and b!233494 res!195337) b!233495))

(assert (= (and b!233495 res!195336) b!233488))

(assert (= (and b!233488 res!195344) b!233484))

(assert (= (and b!233484 res!195340) b!233485))

(assert (= (and b!233485 res!195345) b!233491))

(assert (= (and b!233491 res!195338) b!233492))

(assert (= start!49176 b!233490))

(assert (= start!49176 b!233489))

(declare-fun m!356063 () Bool)

(assert (=> b!233490 m!356063))

(declare-fun m!356065 () Bool)

(assert (=> b!233487 m!356065))

(declare-fun m!356067 () Bool)

(assert (=> b!233486 m!356067))

(declare-fun m!356069 () Bool)

(assert (=> start!49176 m!356069))

(declare-fun m!356071 () Bool)

(assert (=> start!49176 m!356071))

(declare-fun m!356073 () Bool)

(assert (=> b!233495 m!356073))

(declare-fun m!356075 () Bool)

(assert (=> b!233491 m!356075))

(declare-fun m!356077 () Bool)

(assert (=> b!233489 m!356077))

(declare-fun m!356079 () Bool)

(assert (=> b!233494 m!356079))

(push 1)

(assert (not b!233490))

(assert (not b!233495))

(assert (not b!233494))

(assert (not b!233487))

(assert (not b!233486))

(assert (not b!233489))

(assert (not b!233491))

(assert (not start!49176))

(check-sat)

(pop 1)

(push 1)

(check-sat)

