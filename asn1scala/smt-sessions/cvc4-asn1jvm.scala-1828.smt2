; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49144 () Bool)

(assert start!49144)

(declare-fun b!233425 () Bool)

(declare-fun e!160845 () Bool)

(declare-fun e!160847 () Bool)

(assert (=> b!233425 (= e!160845 e!160847)))

(declare-fun res!195285 () Bool)

(assert (=> b!233425 (=> (not res!195285) (not e!160847))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!369376 () (_ BitVec 64))

(declare-fun lt!369377 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun lt!369380 () (_ BitVec 64))

(assert (=> b!233425 (= res!195285 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!369377 (bvsub lt!369380 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!369377 lt!369380) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369376))))))

(declare-datatypes ((array!12059 0))(
  ( (array!12060 (arr!6279 (Array (_ BitVec 32) (_ BitVec 8))) (size!5292 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9680 0))(
  ( (BitStream!9681 (buf!5833 array!12059) (currentByte!10858 (_ BitVec 32)) (currentBit!10853 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9680)

(assert (=> b!233425 (= lt!369377 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5292 (buf!5833 b2!99)))))))

(declare-fun b!233426 () Bool)

(declare-fun e!160842 () Bool)

(assert (=> b!233426 (= e!160842 e!160845)))

(declare-fun res!195290 () Bool)

(assert (=> b!233426 (=> (not res!195290) (not e!160845))))

(declare-fun lt!369381 () (_ BitVec 64))

(declare-fun lt!369379 () (_ BitVec 64))

(assert (=> b!233426 (= res!195290 (and (= lt!369381 lt!369380) (= (bvsub lt!369381 bits!86) lt!369379)))))

(assert (=> b!233426 (= lt!369380 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10858 b2!99))) ((_ sign_extend 32) (currentBit!10853 b2!99))))))

(declare-fun b!233427 () Bool)

(declare-fun e!160844 () Bool)

(declare-fun e!160841 () Bool)

(assert (=> b!233427 (= e!160844 e!160841)))

(declare-fun res!195291 () Bool)

(assert (=> b!233427 (=> (not res!195291) (not e!160841))))

(declare-fun lt!369378 () (_ BitVec 32))

(assert (=> b!233427 (= res!195291 (bvsle lt!369378 bytes!19))))

(assert (=> b!233427 (= lt!369378 ((_ extract 31 0) lt!369376))))

(assert (=> b!233427 (= lt!369376 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!233428 () Bool)

(declare-fun e!160846 () Bool)

(declare-fun array_inv!5033 (array!12059) Bool)

(assert (=> b!233428 (= e!160846 (array_inv!5033 (buf!5833 b2!99)))))

(declare-fun b!233429 () Bool)

(declare-fun res!195287 () Bool)

(assert (=> b!233429 (=> (not res!195287) (not e!160841))))

(declare-fun b1!101 () BitStream!9680)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233429 (= res!195287 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5292 (buf!5833 b1!101))) ((_ sign_extend 32) (currentByte!10858 b1!101)) ((_ sign_extend 32) (currentBit!10853 b1!101)) bytes!19))))

(declare-fun b!233430 () Bool)

(declare-fun e!160849 () Bool)

(assert (=> b!233430 (= e!160849 e!160844)))

(declare-fun res!195284 () Bool)

(assert (=> b!233430 (=> (not res!195284) (not e!160844))))

(assert (=> b!233430 (= res!195284 (bvsle bits!86 lt!369381))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233430 (= lt!369381 (bitIndex!0 (size!5292 (buf!5833 b2!99)) (currentByte!10858 b2!99) (currentBit!10853 b2!99)))))

(declare-fun b!233431 () Bool)

(assert (=> b!233431 (= e!160847 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!5292 (buf!5833 b2!99))) ((_ sign_extend 32) (currentByte!10858 b2!99)) ((_ sign_extend 32) (currentBit!10853 b2!99)) (bvsub bytes!19 lt!369378))))))

(declare-fun b!233432 () Bool)

(declare-fun res!195288 () Bool)

(assert (=> b!233432 (=> (not res!195288) (not e!160841))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233432 (= res!195288 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5292 (buf!5833 b1!101))) ((_ sign_extend 32) (currentByte!10858 b1!101)) ((_ sign_extend 32) (currentBit!10853 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!233433 () Bool)

(assert (=> b!233433 (= e!160841 e!160842)))

(declare-fun res!195286 () Bool)

(assert (=> b!233433 (=> (not res!195286) (not e!160842))))

(assert (=> b!233433 (= res!195286 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5292 (buf!5833 b1!101)))) lt!369379) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233433 (= lt!369379 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10858 b1!101))) ((_ sign_extend 32) (currentBit!10853 b1!101))))))

(declare-fun res!195289 () Bool)

(assert (=> start!49144 (=> (not res!195289) (not e!160849))))

(assert (=> start!49144 (= res!195289 (and (= (size!5292 (buf!5833 b1!101)) (size!5292 (buf!5833 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49144 e!160849))

(declare-fun e!160848 () Bool)

(declare-fun inv!12 (BitStream!9680) Bool)

(assert (=> start!49144 (and (inv!12 b1!101) e!160848)))

(assert (=> start!49144 (and (inv!12 b2!99) e!160846)))

(assert (=> start!49144 true))

(declare-fun b!233434 () Bool)

(assert (=> b!233434 (= e!160848 (array_inv!5033 (buf!5833 b1!101)))))

(declare-fun b!233435 () Bool)

(declare-fun res!195283 () Bool)

(assert (=> b!233435 (=> (not res!195283) (not e!160841))))

(assert (=> b!233435 (= res!195283 (= lt!369381 (bvadd (bitIndex!0 (size!5292 (buf!5833 b1!101)) (currentByte!10858 b1!101) (currentBit!10853 b1!101)) bits!86)))))

(assert (= (and start!49144 res!195289) b!233430))

(assert (= (and b!233430 res!195284) b!233427))

(assert (= (and b!233427 res!195291) b!233429))

(assert (= (and b!233429 res!195287) b!233435))

(assert (= (and b!233435 res!195283) b!233432))

(assert (= (and b!233432 res!195288) b!233433))

(assert (= (and b!233433 res!195286) b!233426))

(assert (= (and b!233426 res!195290) b!233425))

(assert (= (and b!233425 res!195285) b!233431))

(assert (= start!49144 b!233434))

(assert (= start!49144 b!233428))

(declare-fun m!356027 () Bool)

(assert (=> b!233430 m!356027))

(declare-fun m!356029 () Bool)

(assert (=> start!49144 m!356029))

(declare-fun m!356031 () Bool)

(assert (=> start!49144 m!356031))

(declare-fun m!356033 () Bool)

(assert (=> b!233434 m!356033))

(declare-fun m!356035 () Bool)

(assert (=> b!233431 m!356035))

(declare-fun m!356037 () Bool)

(assert (=> b!233435 m!356037))

(declare-fun m!356039 () Bool)

(assert (=> b!233429 m!356039))

(declare-fun m!356041 () Bool)

(assert (=> b!233432 m!356041))

(declare-fun m!356043 () Bool)

(assert (=> b!233428 m!356043))

(push 1)

(assert (not b!233435))

(assert (not b!233428))

(assert (not b!233429))

(assert (not b!233430))

(assert (not start!49144))

(assert (not b!233434))

(assert (not b!233431))

(assert (not b!233432))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78640 () Bool)

(assert (=> d!78640 (= (array_inv!5033 (buf!5833 b2!99)) (bvsge (size!5292 (buf!5833 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!233428 d!78640))

(declare-fun d!78642 () Bool)

(assert (=> d!78642 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5292 (buf!5833 b2!99))) ((_ sign_extend 32) (currentByte!10858 b2!99)) ((_ sign_extend 32) (currentBit!10853 b2!99)) (bvsub bytes!19 lt!369378)) (bvsle ((_ sign_extend 32) (bvsub bytes!19 lt!369378)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5292 (buf!5833 b2!99))) ((_ sign_extend 32) (currentByte!10858 b2!99)) ((_ sign_extend 32) (currentBit!10853 b2!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19373 () Bool)

(assert (= bs!19373 d!78642))

(declare-fun m!356051 () Bool)

(assert (=> bs!19373 m!356051))

(assert (=> b!233431 d!78642))

(declare-fun d!78644 () Bool)

(assert (=> d!78644 (= (remainingBits!0 ((_ sign_extend 32) (size!5292 (buf!5833 b1!101))) ((_ sign_extend 32) (currentByte!10858 b1!101)) ((_ sign_extend 32) (currentBit!10853 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5292 (buf!5833 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10858 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10853 b1!101)))))))

(assert (=> b!233432 d!78644))

(declare-fun d!78646 () Bool)

(declare-fun e!160857 () Bool)

(assert (=> d!78646 e!160857))

(declare-fun res!195304 () Bool)

(assert (=> d!78646 (=> (not res!195304) (not e!160857))))

(declare-fun lt!369420 () (_ BitVec 64))

(declare-fun lt!369422 () (_ BitVec 64))

(declare-fun lt!369421 () (_ BitVec 64))

(assert (=> d!78646 (= res!195304 (= lt!369422 (bvsub lt!369421 lt!369420)))))

(assert (=> d!78646 (or (= (bvand lt!369421 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369420 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369421 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369421 lt!369420) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78646 (= lt!369420 (remainingBits!0 ((_ sign_extend 32) (size!5292 (buf!5833 b2!99))) ((_ sign_extend 32) (currentByte!10858 b2!99)) ((_ sign_extend 32) (currentBit!10853 b2!99))))))

(declare-fun lt!369423 () (_ BitVec 64))

(declare-fun lt!369419 () (_ BitVec 64))

(assert (=> d!78646 (= lt!369421 (bvmul lt!369423 lt!369419))))

(assert (=> d!78646 (or (= lt!369423 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369419 (bvsdiv (bvmul lt!369423 lt!369419) lt!369423)))))

(assert (=> d!78646 (= lt!369419 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78646 (= lt!369423 ((_ sign_extend 32) (size!5292 (buf!5833 b2!99))))))

(assert (=> d!78646 (= lt!369422 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10858 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10853 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78646 (invariant!0 (currentBit!10853 b2!99) (currentByte!10858 b2!99) (size!5292 (buf!5833 b2!99)))))

(assert (=> d!78646 (= (bitIndex!0 (size!5292 (buf!5833 b2!99)) (currentByte!10858 b2!99) (currentBit!10853 b2!99)) lt!369422)))

(declare-fun b!233448 () Bool)

(declare-fun res!195305 () Bool)

(assert (=> b!233448 (=> (not res!195305) (not e!160857))))

(assert (=> b!233448 (= res!195305 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369422))))

(declare-fun b!233449 () Bool)

(declare-fun lt!369418 () (_ BitVec 64))

(assert (=> b!233449 (= e!160857 (bvsle lt!369422 (bvmul lt!369418 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233449 (or (= lt!369418 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369418 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369418)))))

(assert (=> b!233449 (= lt!369418 ((_ sign_extend 32) (size!5292 (buf!5833 b2!99))))))

(assert (= (and d!78646 res!195304) b!233448))

(assert (= (and b!233448 res!195305) b!233449))

(assert (=> d!78646 m!356051))

(declare-fun m!356053 () Bool)

(assert (=> d!78646 m!356053))

(assert (=> b!233430 d!78646))

(declare-fun d!78648 () Bool)

(declare-fun e!160858 () Bool)

(assert (=> d!78648 e!160858))

(declare-fun res!195306 () Bool)

(assert (=> d!78648 (=> (not res!195306) (not e!160858))))

(declare-fun lt!369426 () (_ BitVec 64))

(declare-fun lt!369428 () (_ BitVec 64))

(declare-fun lt!369427 () (_ BitVec 64))

(assert (=> d!78648 (= res!195306 (= lt!369428 (bvsub lt!369427 lt!369426)))))

(assert (=> d!78648 (or (= (bvand lt!369427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369426 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369427 lt!369426) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78648 (= lt!369426 (remainingBits!0 ((_ sign_extend 32) (size!5292 (buf!5833 b1!101))) ((_ sign_extend 32) (currentByte!10858 b1!101)) ((_ sign_extend 32) (currentBit!10853 b1!101))))))

(declare-fun lt!369429 () (_ BitVec 64))

(declare-fun lt!369425 () (_ BitVec 64))

(assert (=> d!78648 (= lt!369427 (bvmul lt!369429 lt!369425))))

(assert (=> d!78648 (or (= lt!369429 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369425 (bvsdiv (bvmul lt!369429 lt!369425) lt!369429)))))

(assert (=> d!78648 (= lt!369425 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78648 (= lt!369429 ((_ sign_extend 32) (size!5292 (buf!5833 b1!101))))))

(assert (=> d!78648 (= lt!369428 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10858 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10853 b1!101))))))

(assert (=> d!78648 (invariant!0 (currentBit!10853 b1!101) (currentByte!10858 b1!101) (size!5292 (buf!5833 b1!101)))))

(assert (=> d!78648 (= (bitIndex!0 (size!5292 (buf!5833 b1!101)) (currentByte!10858 b1!101) (currentBit!10853 b1!101)) lt!369428)))

(declare-fun b!233450 () Bool)

(declare-fun res!195307 () Bool)

(assert (=> b!233450 (=> (not res!195307) (not e!160858))))

(assert (=> b!233450 (= res!195307 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369428))))

(declare-fun b!233451 () Bool)

(declare-fun lt!369424 () (_ BitVec 64))

(assert (=> b!233451 (= e!160858 (bvsle lt!369428 (bvmul lt!369424 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233451 (or (= lt!369424 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369424 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369424)))))

(assert (=> b!233451 (= lt!369424 ((_ sign_extend 32) (size!5292 (buf!5833 b1!101))))))

(assert (= (and d!78648 res!195306) b!233450))

(assert (= (and b!233450 res!195307) b!233451))

(assert (=> d!78648 m!356041))

(declare-fun m!356055 () Bool)

(assert (=> d!78648 m!356055))

(assert (=> b!233435 d!78648))

(declare-fun d!78650 () Bool)

(assert (=> d!78650 (= (array_inv!5033 (buf!5833 b1!101)) (bvsge (size!5292 (buf!5833 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!233434 d!78650))

(declare-fun d!78652 () Bool)

(assert (=> d!78652 (= (inv!12 b1!101) (invariant!0 (currentBit!10853 b1!101) (currentByte!10858 b1!101) (size!5292 (buf!5833 b1!101))))))

(declare-fun bs!19374 () Bool)

(assert (= bs!19374 d!78652))

(assert (=> bs!19374 m!356055))

(assert (=> start!49144 d!78652))

(declare-fun d!78654 () Bool)

(assert (=> d!78654 (= (inv!12 b2!99) (invariant!0 (currentBit!10853 b2!99) (currentByte!10858 b2!99) (size!5292 (buf!5833 b2!99))))))

(declare-fun bs!19375 () Bool)

(assert (= bs!19375 d!78654))

(assert (=> bs!19375 m!356053))

(assert (=> start!49144 d!78654))

(declare-fun d!78656 () Bool)

(assert (=> d!78656 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5292 (buf!5833 b1!101))) ((_ sign_extend 32) (currentByte!10858 b1!101)) ((_ sign_extend 32) (currentBit!10853 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5292 (buf!5833 b1!101))) ((_ sign_extend 32) (currentByte!10858 b1!101)) ((_ sign_extend 32) (currentBit!10853 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19376 () Bool)

(assert (= bs!19376 d!78656))

(assert (=> bs!19376 m!356041))

(assert (=> b!233429 d!78656))

(push 1)

(assert (not d!78646))

(assert (not d!78648))

(assert (not d!78642))

(assert (not d!78652))

(assert (not d!78656))

(assert (not d!78654))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

