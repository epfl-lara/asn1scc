; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48288 () Bool)

(assert start!48288)

(declare-fun b!229118 () Bool)

(declare-fun e!157208 () Bool)

(declare-datatypes ((array!11633 0))(
  ( (array!11634 (arr!6091 (Array (_ BitVec 32) (_ BitVec 8))) (size!5104 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9304 0))(
  ( (BitStream!9305 (buf!5645 array!11633) (currentByte!10530 (_ BitVec 32)) (currentBit!10525 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9304)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229118 (= e!157208 (not (invariant!0 (currentBit!10525 b1!101) (currentByte!10530 b1!101) (size!5104 (buf!5645 b1!101)))))))

(declare-fun b!229119 () Bool)

(declare-fun res!192105 () Bool)

(assert (=> b!229119 (=> (not res!192105) (not e!157208))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!229119 (= res!192105 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!229120 () Bool)

(declare-fun res!192106 () Bool)

(assert (=> b!229120 (=> (not res!192106) (not e!157208))))

(declare-fun b2!99 () BitStream!9304)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229120 (= res!192106 (bvsle bits!86 (bitIndex!0 (size!5104 (buf!5645 b2!99)) (currentByte!10530 b2!99) (currentBit!10525 b2!99))))))

(declare-fun b!229121 () Bool)

(declare-fun res!192103 () Bool)

(assert (=> b!229121 (=> (not res!192103) (not e!157208))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229121 (= res!192103 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5104 (buf!5645 b1!101))) ((_ sign_extend 32) (currentByte!10530 b1!101)) ((_ sign_extend 32) (currentBit!10525 b1!101)) bytes!19))))

(declare-fun b!229122 () Bool)

(declare-fun e!157206 () Bool)

(declare-fun array_inv!4845 (array!11633) Bool)

(assert (=> b!229122 (= e!157206 (array_inv!4845 (buf!5645 b1!101)))))

(declare-fun res!192104 () Bool)

(assert (=> start!48288 (=> (not res!192104) (not e!157208))))

(assert (=> start!48288 (= res!192104 (and (= (size!5104 (buf!5645 b1!101)) (size!5104 (buf!5645 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48288 e!157208))

(declare-fun inv!12 (BitStream!9304) Bool)

(assert (=> start!48288 (and (inv!12 b1!101) e!157206)))

(declare-fun e!157209 () Bool)

(assert (=> start!48288 (and (inv!12 b2!99) e!157209)))

(assert (=> start!48288 true))

(declare-fun b!229117 () Bool)

(assert (=> b!229117 (= e!157209 (array_inv!4845 (buf!5645 b2!99)))))

(assert (= (and start!48288 res!192104) b!229120))

(assert (= (and b!229120 res!192106) b!229119))

(assert (= (and b!229119 res!192105) b!229121))

(assert (= (and b!229121 res!192103) b!229118))

(assert (= start!48288 b!229122))

(assert (= start!48288 b!229117))

(declare-fun m!352867 () Bool)

(assert (=> b!229121 m!352867))

(declare-fun m!352869 () Bool)

(assert (=> b!229122 m!352869))

(declare-fun m!352871 () Bool)

(assert (=> start!48288 m!352871))

(declare-fun m!352873 () Bool)

(assert (=> start!48288 m!352873))

(declare-fun m!352875 () Bool)

(assert (=> b!229120 m!352875))

(declare-fun m!352877 () Bool)

(assert (=> b!229118 m!352877))

(declare-fun m!352879 () Bool)

(assert (=> b!229117 m!352879))

(push 1)

(assert (not start!48288))

(assert (not b!229121))

(assert (not b!229122))

(assert (not b!229120))

(assert (not b!229117))

(assert (not b!229118))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77736 () Bool)

(declare-fun e!157246 () Bool)

(assert (=> d!77736 e!157246))

(declare-fun res!192141 () Bool)

(assert (=> d!77736 (=> (not res!192141) (not e!157246))))

(declare-fun lt!367177 () (_ BitVec 64))

(declare-fun lt!367174 () (_ BitVec 64))

(declare-fun lt!367175 () (_ BitVec 64))

(assert (=> d!77736 (= res!192141 (= lt!367175 (bvsub lt!367177 lt!367174)))))

(assert (=> d!77736 (or (= (bvand lt!367177 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367174 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367177 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367177 lt!367174) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77736 (= lt!367174 (remainingBits!0 ((_ sign_extend 32) (size!5104 (buf!5645 b2!99))) ((_ sign_extend 32) (currentByte!10530 b2!99)) ((_ sign_extend 32) (currentBit!10525 b2!99))))))

(declare-fun lt!367176 () (_ BitVec 64))

(declare-fun lt!367179 () (_ BitVec 64))

(assert (=> d!77736 (= lt!367177 (bvmul lt!367176 lt!367179))))

(assert (=> d!77736 (or (= lt!367176 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367179 (bvsdiv (bvmul lt!367176 lt!367179) lt!367176)))))

(assert (=> d!77736 (= lt!367179 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77736 (= lt!367176 ((_ sign_extend 32) (size!5104 (buf!5645 b2!99))))))

(assert (=> d!77736 (= lt!367175 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10530 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10525 b2!99))))))

(assert (=> d!77736 (invariant!0 (currentBit!10525 b2!99) (currentByte!10530 b2!99) (size!5104 (buf!5645 b2!99)))))

(assert (=> d!77736 (= (bitIndex!0 (size!5104 (buf!5645 b2!99)) (currentByte!10530 b2!99) (currentBit!10525 b2!99)) lt!367175)))

(declare-fun b!229169 () Bool)

(declare-fun res!192142 () Bool)

(assert (=> b!229169 (=> (not res!192142) (not e!157246))))

(assert (=> b!229169 (= res!192142 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367175))))

(declare-fun b!229170 () Bool)

(declare-fun lt!367178 () (_ BitVec 64))

(assert (=> b!229170 (= e!157246 (bvsle lt!367175 (bvmul lt!367178 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229170 (or (= lt!367178 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367178 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367178)))))

(assert (=> b!229170 (= lt!367178 ((_ sign_extend 32) (size!5104 (buf!5645 b2!99))))))

(assert (= (and d!77736 res!192141) b!229169))

(assert (= (and b!229169 res!192142) b!229170))

(declare-fun m!352915 () Bool)

(assert (=> d!77736 m!352915))

(declare-fun m!352917 () Bool)

(assert (=> d!77736 m!352917))

(assert (=> b!229120 d!77736))

(declare-fun d!77740 () Bool)

(assert (=> d!77740 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5104 (buf!5645 b1!101))) ((_ sign_extend 32) (currentByte!10530 b1!101)) ((_ sign_extend 32) (currentBit!10525 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5104 (buf!5645 b1!101))) ((_ sign_extend 32) (currentByte!10530 b1!101)) ((_ sign_extend 32) (currentBit!10525 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19041 () Bool)

(assert (= bs!19041 d!77740))

(declare-fun m!352919 () Bool)

(assert (=> bs!19041 m!352919))

(assert (=> b!229121 d!77740))

(declare-fun d!77744 () Bool)

(assert (=> d!77744 (= (array_inv!4845 (buf!5645 b1!101)) (bvsge (size!5104 (buf!5645 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!229122 d!77744))

(declare-fun d!77748 () Bool)

(assert (=> d!77748 (= (array_inv!4845 (buf!5645 b2!99)) (bvsge (size!5104 (buf!5645 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!229117 d!77748))

(declare-fun d!77750 () Bool)

(assert (=> d!77750 (= (invariant!0 (currentBit!10525 b1!101) (currentByte!10530 b1!101) (size!5104 (buf!5645 b1!101))) (and (bvsge (currentBit!10525 b1!101) #b00000000000000000000000000000000) (bvslt (currentBit!10525 b1!101) #b00000000000000000000000000001000) (bvsge (currentByte!10530 b1!101) #b00000000000000000000000000000000) (or (bvslt (currentByte!10530 b1!101) (size!5104 (buf!5645 b1!101))) (and (= (currentBit!10525 b1!101) #b00000000000000000000000000000000) (= (currentByte!10530 b1!101) (size!5104 (buf!5645 b1!101)))))))))

(assert (=> b!229118 d!77750))

(declare-fun d!77756 () Bool)

(assert (=> d!77756 (= (inv!12 b1!101) (invariant!0 (currentBit!10525 b1!101) (currentByte!10530 b1!101) (size!5104 (buf!5645 b1!101))))))

(declare-fun bs!19045 () Bool)

(assert (= bs!19045 d!77756))

(assert (=> bs!19045 m!352877))

(assert (=> start!48288 d!77756))

(declare-fun d!77762 () Bool)

(assert (=> d!77762 (= (inv!12 b2!99) (invariant!0 (currentBit!10525 b2!99) (currentByte!10530 b2!99) (size!5104 (buf!5645 b2!99))))))

(declare-fun bs!19046 () Bool)

(assert (= bs!19046 d!77762))

(assert (=> bs!19046 m!352917))

(assert (=> start!48288 d!77762))

(push 1)

(assert (not d!77736))

(assert (not d!77762))

(assert (not d!77756))

(assert (not d!77740))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

