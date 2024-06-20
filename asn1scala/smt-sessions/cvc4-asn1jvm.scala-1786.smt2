; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48754 () Bool)

(assert start!48754)

(declare-fun b!230823 () Bool)

(declare-fun e!158587 () Bool)

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!230823 (= e!158587 (and (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!230824 () Bool)

(declare-fun e!158591 () Bool)

(declare-datatypes ((array!11789 0))(
  ( (array!11790 (arr!6153 (Array (_ BitVec 32) (_ BitVec 8))) (size!5166 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9428 0))(
  ( (BitStream!9429 (buf!5707 array!11789) (currentByte!10699 (_ BitVec 32)) (currentBit!10694 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9428)

(declare-fun array_inv!4907 (array!11789) Bool)

(assert (=> b!230824 (= e!158591 (array_inv!4907 (buf!5707 b1!101)))))

(declare-fun b!230825 () Bool)

(declare-fun e!158589 () Bool)

(declare-fun b2!99 () BitStream!9428)

(assert (=> b!230825 (= e!158589 (array_inv!4907 (buf!5707 b2!99)))))

(declare-fun b!230822 () Bool)

(declare-fun res!193436 () Bool)

(assert (=> b!230822 (=> (not res!193436) (not e!158587))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230822 (= res!193436 (bvsle bits!86 (bitIndex!0 (size!5166 (buf!5707 b2!99)) (currentByte!10699 b2!99) (currentBit!10694 b2!99))))))

(declare-fun res!193437 () Bool)

(assert (=> start!48754 (=> (not res!193437) (not e!158587))))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!48754 (= res!193437 (and (= (size!5166 (buf!5707 b1!101)) (size!5166 (buf!5707 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48754 e!158587))

(declare-fun inv!12 (BitStream!9428) Bool)

(assert (=> start!48754 (and (inv!12 b1!101) e!158591)))

(assert (=> start!48754 (and (inv!12 b2!99) e!158589)))

(assert (=> start!48754 true))

(assert (= (and start!48754 res!193437) b!230822))

(assert (= (and b!230822 res!193436) b!230823))

(assert (= start!48754 b!230824))

(assert (= start!48754 b!230825))

(declare-fun m!354049 () Bool)

(assert (=> b!230824 m!354049))

(declare-fun m!354051 () Bool)

(assert (=> b!230825 m!354051))

(declare-fun m!354053 () Bool)

(assert (=> b!230822 m!354053))

(declare-fun m!354055 () Bool)

(assert (=> start!48754 m!354055))

(declare-fun m!354057 () Bool)

(assert (=> start!48754 m!354057))

(push 1)

(assert (not b!230822))

(assert (not b!230824))

(assert (not start!48754))

(assert (not b!230825))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78330 () Bool)

(declare-fun e!158600 () Bool)

(assert (=> d!78330 e!158600))

(declare-fun res!193454 () Bool)

(assert (=> d!78330 (=> (not res!193454) (not e!158600))))

(declare-fun lt!368369 () (_ BitVec 64))

(declare-fun lt!368371 () (_ BitVec 64))

(declare-fun lt!368368 () (_ BitVec 64))

(assert (=> d!78330 (= res!193454 (= lt!368368 (bvsub lt!368369 lt!368371)))))

(assert (=> d!78330 (or (= (bvand lt!368369 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368371 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368369 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368369 lt!368371) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!78330 (= lt!368371 (remainingBits!0 ((_ sign_extend 32) (size!5166 (buf!5707 b2!99))) ((_ sign_extend 32) (currentByte!10699 b2!99)) ((_ sign_extend 32) (currentBit!10694 b2!99))))))

(declare-fun lt!368373 () (_ BitVec 64))

(declare-fun lt!368372 () (_ BitVec 64))

(assert (=> d!78330 (= lt!368369 (bvmul lt!368373 lt!368372))))

(assert (=> d!78330 (or (= lt!368373 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368372 (bvsdiv (bvmul lt!368373 lt!368372) lt!368373)))))

(assert (=> d!78330 (= lt!368372 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78330 (= lt!368373 ((_ sign_extend 32) (size!5166 (buf!5707 b2!99))))))

(assert (=> d!78330 (= lt!368368 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10699 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10694 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78330 (invariant!0 (currentBit!10694 b2!99) (currentByte!10699 b2!99) (size!5166 (buf!5707 b2!99)))))

(assert (=> d!78330 (= (bitIndex!0 (size!5166 (buf!5707 b2!99)) (currentByte!10699 b2!99) (currentBit!10694 b2!99)) lt!368368)))

(declare-fun b!230842 () Bool)

(declare-fun res!193455 () Bool)

(assert (=> b!230842 (=> (not res!193455) (not e!158600))))

(assert (=> b!230842 (= res!193455 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368368))))

(declare-fun b!230843 () Bool)

(declare-fun lt!368370 () (_ BitVec 64))

(assert (=> b!230843 (= e!158600 (bvsle lt!368368 (bvmul lt!368370 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230843 (or (= lt!368370 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368370 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368370)))))

(assert (=> b!230843 (= lt!368370 ((_ sign_extend 32) (size!5166 (buf!5707 b2!99))))))

(assert (= (and d!78330 res!193454) b!230842))

(assert (= (and b!230842 res!193455) b!230843))

(declare-fun m!354071 () Bool)

(assert (=> d!78330 m!354071))

(declare-fun m!354073 () Bool)

(assert (=> d!78330 m!354073))

(assert (=> b!230822 d!78330))

(declare-fun d!78332 () Bool)

(assert (=> d!78332 (= (array_inv!4907 (buf!5707 b1!101)) (bvsge (size!5166 (buf!5707 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230824 d!78332))

(declare-fun d!78334 () Bool)

(assert (=> d!78334 (= (inv!12 b1!101) (invariant!0 (currentBit!10694 b1!101) (currentByte!10699 b1!101) (size!5166 (buf!5707 b1!101))))))

(declare-fun bs!19202 () Bool)

(assert (= bs!19202 d!78334))

(declare-fun m!354075 () Bool)

(assert (=> bs!19202 m!354075))

(assert (=> start!48754 d!78334))

(declare-fun d!78336 () Bool)

(assert (=> d!78336 (= (inv!12 b2!99) (invariant!0 (currentBit!10694 b2!99) (currentByte!10699 b2!99) (size!5166 (buf!5707 b2!99))))))

(declare-fun bs!19203 () Bool)

(assert (= bs!19203 d!78336))

(assert (=> bs!19203 m!354073))

(assert (=> start!48754 d!78336))

(declare-fun d!78338 () Bool)

(assert (=> d!78338 (= (array_inv!4907 (buf!5707 b2!99)) (bvsge (size!5166 (buf!5707 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230825 d!78338))

(push 1)

(assert (not d!78330))

(assert (not d!78334))

(assert (not d!78336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

