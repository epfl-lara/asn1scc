; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48402 () Bool)

(assert start!48402)

(declare-fun b!229436 () Bool)

(declare-fun res!192345 () Bool)

(declare-fun e!157466 () Bool)

(assert (=> b!229436 (=> (not res!192345) (not e!157466))))

(declare-datatypes ((array!11668 0))(
  ( (array!11669 (arr!6104 (Array (_ BitVec 32) (_ BitVec 8))) (size!5117 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9330 0))(
  ( (BitStream!9331 (buf!5658 array!11668) (currentByte!10569 (_ BitVec 32)) (currentBit!10564 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9330)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229436 (= res!192345 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5117 (buf!5658 b1!101))) ((_ sign_extend 32) (currentByte!10569 b1!101)) ((_ sign_extend 32) (currentBit!10564 b1!101)) bytes!19))))

(declare-fun b!229437 () Bool)

(declare-fun res!192344 () Bool)

(assert (=> b!229437 (=> (not res!192344) (not e!157466))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367374 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229437 (= res!192344 (= lt!367374 (bvadd (bitIndex!0 (size!5117 (buf!5658 b1!101)) (currentByte!10569 b1!101) (currentBit!10564 b1!101)) bits!86)))))

(declare-fun b!229438 () Bool)

(declare-fun b2!99 () BitStream!9330)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229438 (= e!157466 (not (invariant!0 (currentBit!10564 b2!99) (currentByte!10569 b2!99) (size!5117 (buf!5658 b2!99)))))))

(declare-fun b!229439 () Bool)

(declare-fun e!157469 () Bool)

(declare-fun array_inv!4858 (array!11668) Bool)

(assert (=> b!229439 (= e!157469 (array_inv!4858 (buf!5658 b1!101)))))

(declare-fun b!229440 () Bool)

(declare-fun res!192349 () Bool)

(assert (=> b!229440 (=> (not res!192349) (not e!157466))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!229440 (= res!192349 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5117 (buf!5658 b1!101))) ((_ sign_extend 32) (currentByte!10569 b1!101)) ((_ sign_extend 32) (currentBit!10564 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!229442 () Bool)

(declare-fun e!157467 () Bool)

(assert (=> b!229442 (= e!157467 e!157466)))

(declare-fun res!192346 () Bool)

(assert (=> b!229442 (=> (not res!192346) (not e!157466))))

(assert (=> b!229442 (= res!192346 (and (bvsle bits!86 lt!367374) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!229442 (= lt!367374 (bitIndex!0 (size!5117 (buf!5658 b2!99)) (currentByte!10569 b2!99) (currentBit!10564 b2!99)))))

(declare-fun b!229443 () Bool)

(declare-fun e!157468 () Bool)

(assert (=> b!229443 (= e!157468 (array_inv!4858 (buf!5658 b2!99)))))

(declare-fun res!192348 () Bool)

(assert (=> start!48402 (=> (not res!192348) (not e!157467))))

(assert (=> start!48402 (= res!192348 (and (= (size!5117 (buf!5658 b1!101)) (size!5117 (buf!5658 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48402 e!157467))

(declare-fun inv!12 (BitStream!9330) Bool)

(assert (=> start!48402 (and (inv!12 b1!101) e!157469)))

(assert (=> start!48402 (and (inv!12 b2!99) e!157468)))

(assert (=> start!48402 true))

(declare-fun b!229441 () Bool)

(declare-fun res!192347 () Bool)

(assert (=> b!229441 (=> (not res!192347) (not e!157466))))

(assert (=> b!229441 (= res!192347 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5117 (buf!5658 b1!101)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10569 b1!101))) ((_ sign_extend 32) (currentBit!10564 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!48402 res!192348) b!229442))

(assert (= (and b!229442 res!192346) b!229436))

(assert (= (and b!229436 res!192345) b!229437))

(assert (= (and b!229437 res!192344) b!229440))

(assert (= (and b!229440 res!192349) b!229441))

(assert (= (and b!229441 res!192347) b!229438))

(assert (= start!48402 b!229439))

(assert (= start!48402 b!229443))

(declare-fun m!353125 () Bool)

(assert (=> b!229442 m!353125))

(declare-fun m!353127 () Bool)

(assert (=> b!229439 m!353127))

(declare-fun m!353129 () Bool)

(assert (=> b!229440 m!353129))

(declare-fun m!353131 () Bool)

(assert (=> b!229443 m!353131))

(declare-fun m!353133 () Bool)

(assert (=> b!229438 m!353133))

(declare-fun m!353135 () Bool)

(assert (=> b!229436 m!353135))

(declare-fun m!353137 () Bool)

(assert (=> b!229437 m!353137))

(declare-fun m!353139 () Bool)

(assert (=> start!48402 m!353139))

(declare-fun m!353141 () Bool)

(assert (=> start!48402 m!353141))

(check-sat (not b!229440) (not b!229443) (not b!229437) (not b!229436) (not b!229439) (not b!229438) (not start!48402) (not b!229442))
(check-sat)
(get-model)

(declare-fun d!77872 () Bool)

(assert (=> d!77872 (= (inv!12 b1!101) (invariant!0 (currentBit!10564 b1!101) (currentByte!10569 b1!101) (size!5117 (buf!5658 b1!101))))))

(declare-fun bs!19077 () Bool)

(assert (= bs!19077 d!77872))

(declare-fun m!353161 () Bool)

(assert (=> bs!19077 m!353161))

(assert (=> start!48402 d!77872))

(declare-fun d!77874 () Bool)

(assert (=> d!77874 (= (inv!12 b2!99) (invariant!0 (currentBit!10564 b2!99) (currentByte!10569 b2!99) (size!5117 (buf!5658 b2!99))))))

(declare-fun bs!19078 () Bool)

(assert (= bs!19078 d!77874))

(assert (=> bs!19078 m!353133))

(assert (=> start!48402 d!77874))

(declare-fun d!77876 () Bool)

(assert (=> d!77876 (= (array_inv!4858 (buf!5658 b2!99)) (bvsge (size!5117 (buf!5658 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!229443 d!77876))

(declare-fun d!77878 () Bool)

(assert (=> d!77878 (= (invariant!0 (currentBit!10564 b2!99) (currentByte!10569 b2!99) (size!5117 (buf!5658 b2!99))) (and (bvsge (currentBit!10564 b2!99) #b00000000000000000000000000000000) (bvslt (currentBit!10564 b2!99) #b00000000000000000000000000001000) (bvsge (currentByte!10569 b2!99) #b00000000000000000000000000000000) (or (bvslt (currentByte!10569 b2!99) (size!5117 (buf!5658 b2!99))) (and (= (currentBit!10564 b2!99) #b00000000000000000000000000000000) (= (currentByte!10569 b2!99) (size!5117 (buf!5658 b2!99)))))))))

(assert (=> b!229438 d!77878))

(declare-fun d!77880 () Bool)

(declare-fun e!157492 () Bool)

(assert (=> d!77880 e!157492))

(declare-fun res!192372 () Bool)

(assert (=> d!77880 (=> (not res!192372) (not e!157492))))

(declare-fun lt!367395 () (_ BitVec 64))

(declare-fun lt!367391 () (_ BitVec 64))

(declare-fun lt!367394 () (_ BitVec 64))

(assert (=> d!77880 (= res!192372 (= lt!367391 (bvsub lt!367395 lt!367394)))))

(assert (=> d!77880 (or (= (bvand lt!367395 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367394 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367395 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367395 lt!367394) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77880 (= lt!367394 (remainingBits!0 ((_ sign_extend 32) (size!5117 (buf!5658 b1!101))) ((_ sign_extend 32) (currentByte!10569 b1!101)) ((_ sign_extend 32) (currentBit!10564 b1!101))))))

(declare-fun lt!367392 () (_ BitVec 64))

(declare-fun lt!367393 () (_ BitVec 64))

(assert (=> d!77880 (= lt!367395 (bvmul lt!367392 lt!367393))))

(assert (=> d!77880 (or (= lt!367392 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367393 (bvsdiv (bvmul lt!367392 lt!367393) lt!367392)))))

(assert (=> d!77880 (= lt!367393 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77880 (= lt!367392 ((_ sign_extend 32) (size!5117 (buf!5658 b1!101))))))

(assert (=> d!77880 (= lt!367391 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10569 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10564 b1!101))))))

(assert (=> d!77880 (invariant!0 (currentBit!10564 b1!101) (currentByte!10569 b1!101) (size!5117 (buf!5658 b1!101)))))

(assert (=> d!77880 (= (bitIndex!0 (size!5117 (buf!5658 b1!101)) (currentByte!10569 b1!101) (currentBit!10564 b1!101)) lt!367391)))

(declare-fun b!229472 () Bool)

(declare-fun res!192373 () Bool)

(assert (=> b!229472 (=> (not res!192373) (not e!157492))))

(assert (=> b!229472 (= res!192373 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367391))))

(declare-fun b!229473 () Bool)

(declare-fun lt!367390 () (_ BitVec 64))

(assert (=> b!229473 (= e!157492 (bvsle lt!367391 (bvmul lt!367390 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229473 (or (= lt!367390 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367390 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367390)))))

(assert (=> b!229473 (= lt!367390 ((_ sign_extend 32) (size!5117 (buf!5658 b1!101))))))

(assert (= (and d!77880 res!192372) b!229472))

(assert (= (and b!229472 res!192373) b!229473))

(assert (=> d!77880 m!353129))

(assert (=> d!77880 m!353161))

(assert (=> b!229437 d!77880))

(declare-fun d!77882 () Bool)

(declare-fun e!157493 () Bool)

(assert (=> d!77882 e!157493))

(declare-fun res!192374 () Bool)

(assert (=> d!77882 (=> (not res!192374) (not e!157493))))

(declare-fun lt!367397 () (_ BitVec 64))

(declare-fun lt!367401 () (_ BitVec 64))

(declare-fun lt!367400 () (_ BitVec 64))

(assert (=> d!77882 (= res!192374 (= lt!367397 (bvsub lt!367401 lt!367400)))))

(assert (=> d!77882 (or (= (bvand lt!367401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367400 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367401 lt!367400) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77882 (= lt!367400 (remainingBits!0 ((_ sign_extend 32) (size!5117 (buf!5658 b2!99))) ((_ sign_extend 32) (currentByte!10569 b2!99)) ((_ sign_extend 32) (currentBit!10564 b2!99))))))

(declare-fun lt!367398 () (_ BitVec 64))

(declare-fun lt!367399 () (_ BitVec 64))

(assert (=> d!77882 (= lt!367401 (bvmul lt!367398 lt!367399))))

(assert (=> d!77882 (or (= lt!367398 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367399 (bvsdiv (bvmul lt!367398 lt!367399) lt!367398)))))

(assert (=> d!77882 (= lt!367399 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77882 (= lt!367398 ((_ sign_extend 32) (size!5117 (buf!5658 b2!99))))))

(assert (=> d!77882 (= lt!367397 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10569 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10564 b2!99))))))

(assert (=> d!77882 (invariant!0 (currentBit!10564 b2!99) (currentByte!10569 b2!99) (size!5117 (buf!5658 b2!99)))))

(assert (=> d!77882 (= (bitIndex!0 (size!5117 (buf!5658 b2!99)) (currentByte!10569 b2!99) (currentBit!10564 b2!99)) lt!367397)))

(declare-fun b!229474 () Bool)

(declare-fun res!192375 () Bool)

(assert (=> b!229474 (=> (not res!192375) (not e!157493))))

(assert (=> b!229474 (= res!192375 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367397))))

(declare-fun b!229475 () Bool)

(declare-fun lt!367396 () (_ BitVec 64))

(assert (=> b!229475 (= e!157493 (bvsle lt!367397 (bvmul lt!367396 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229475 (or (= lt!367396 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367396 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367396)))))

(assert (=> b!229475 (= lt!367396 ((_ sign_extend 32) (size!5117 (buf!5658 b2!99))))))

(assert (= (and d!77882 res!192374) b!229474))

(assert (= (and b!229474 res!192375) b!229475))

(declare-fun m!353163 () Bool)

(assert (=> d!77882 m!353163))

(assert (=> d!77882 m!353133))

(assert (=> b!229442 d!77882))

(declare-fun d!77884 () Bool)

(assert (=> d!77884 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5117 (buf!5658 b1!101))) ((_ sign_extend 32) (currentByte!10569 b1!101)) ((_ sign_extend 32) (currentBit!10564 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5117 (buf!5658 b1!101))) ((_ sign_extend 32) (currentByte!10569 b1!101)) ((_ sign_extend 32) (currentBit!10564 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19079 () Bool)

(assert (= bs!19079 d!77884))

(assert (=> bs!19079 m!353129))

(assert (=> b!229436 d!77884))

(declare-fun d!77886 () Bool)

(assert (=> d!77886 (= (remainingBits!0 ((_ sign_extend 32) (size!5117 (buf!5658 b1!101))) ((_ sign_extend 32) (currentByte!10569 b1!101)) ((_ sign_extend 32) (currentBit!10564 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5117 (buf!5658 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10569 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10564 b1!101)))))))

(assert (=> b!229440 d!77886))

(declare-fun d!77888 () Bool)

(assert (=> d!77888 (= (array_inv!4858 (buf!5658 b1!101)) (bvsge (size!5117 (buf!5658 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!229439 d!77888))

(check-sat (not d!77872) (not d!77884) (not d!77874) (not d!77880) (not d!77882))
