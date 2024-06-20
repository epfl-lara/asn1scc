; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49236 () Bool)

(assert start!49236)

(declare-fun res!195704 () Bool)

(declare-fun e!161257 () Bool)

(assert (=> start!49236 (=> (not res!195704) (not e!161257))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!12097 0))(
  ( (array!12098 (arr!6295 (Array (_ BitVec 32) (_ BitVec 8))) (size!5308 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9712 0))(
  ( (BitStream!9713 (buf!5849 array!12097) (currentByte!10892 (_ BitVec 32)) (currentBit!10887 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9712)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9712)

(assert (=> start!49236 (= res!195704 (and (= (size!5308 (buf!5849 b1!101)) (size!5308 (buf!5849 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49236 e!161257))

(declare-fun e!161258 () Bool)

(declare-fun inv!12 (BitStream!9712) Bool)

(assert (=> start!49236 (and (inv!12 b1!101) e!161258)))

(declare-fun e!161266 () Bool)

(assert (=> start!49236 (and (inv!12 b2!99) e!161266)))

(assert (=> start!49236 true))

(declare-fun b!233940 () Bool)

(declare-fun array_inv!5049 (array!12097) Bool)

(assert (=> b!233940 (= e!161258 (array_inv!5049 (buf!5849 b1!101)))))

(declare-fun b!233941 () Bool)

(declare-fun e!161262 () Bool)

(assert (=> b!233941 (= e!161257 e!161262)))

(declare-fun res!195708 () Bool)

(assert (=> b!233941 (=> (not res!195708) (not e!161262))))

(declare-fun lt!369721 () (_ BitVec 64))

(assert (=> b!233941 (= res!195708 (bvsle bits!86 lt!369721))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233941 (= lt!369721 (bitIndex!0 (size!5308 (buf!5849 b2!99)) (currentByte!10892 b2!99) (currentBit!10887 b2!99)))))

(declare-fun b!233942 () Bool)

(declare-fun res!195702 () Bool)

(declare-fun e!161267 () Bool)

(assert (=> b!233942 (=> (not res!195702) (not e!161267))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233942 (= res!195702 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5308 (buf!5849 b1!101))) ((_ sign_extend 32) (currentByte!10892 b1!101)) ((_ sign_extend 32) (currentBit!10887 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!233943 () Bool)

(declare-fun res!195703 () Bool)

(assert (=> b!233943 (=> (not res!195703) (not e!161267))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233943 (= res!195703 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5308 (buf!5849 b1!101))) ((_ sign_extend 32) (currentByte!10892 b1!101)) ((_ sign_extend 32) (currentBit!10887 b1!101)) bytes!19))))

(declare-fun b!233944 () Bool)

(declare-fun e!161264 () Bool)

(declare-fun e!161263 () Bool)

(assert (=> b!233944 (= e!161264 e!161263)))

(declare-fun res!195711 () Bool)

(assert (=> b!233944 (=> (not res!195711) (not e!161263))))

(declare-fun lt!369724 () (_ BitVec 64))

(declare-fun lt!369723 () (_ BitVec 64))

(assert (=> b!233944 (= res!195711 (and (= lt!369721 lt!369723) (= (bvsub lt!369721 bits!86) lt!369724)))))

(assert (=> b!233944 (= lt!369723 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10892 b2!99))) ((_ sign_extend 32) (currentBit!10887 b2!99))))))

(declare-fun b!233945 () Bool)

(assert (=> b!233945 (= e!161262 e!161267)))

(declare-fun res!195707 () Bool)

(assert (=> b!233945 (=> (not res!195707) (not e!161267))))

(declare-fun lt!369720 () (_ BitVec 32))

(assert (=> b!233945 (= res!195707 (bvsle lt!369720 bytes!19))))

(declare-fun lt!369725 () (_ BitVec 64))

(assert (=> b!233945 (= lt!369720 ((_ extract 31 0) lt!369725))))

(assert (=> b!233945 (= lt!369725 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!233946 () Bool)

(declare-fun e!161261 () Bool)

(declare-fun e!161265 () Bool)

(assert (=> b!233946 (= e!161261 e!161265)))

(declare-fun res!195706 () Bool)

(assert (=> b!233946 (=> (not res!195706) (not e!161265))))

(declare-fun lt!369726 () (_ BitVec 32))

(assert (=> b!233946 (= res!195706 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5308 (buf!5849 b2!99))) ((_ sign_extend 32) (currentByte!10892 b2!99)) ((_ sign_extend 32) (currentBit!10887 b2!99)) lt!369726))))

(assert (=> b!233946 (= lt!369726 (bvsub bytes!19 lt!369720))))

(declare-fun b!233947 () Bool)

(assert (=> b!233947 (= e!161263 e!161261)))

(declare-fun res!195710 () Bool)

(assert (=> b!233947 (=> (not res!195710) (not e!161261))))

(declare-fun lt!369722 () (_ BitVec 64))

(assert (=> b!233947 (= res!195710 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!369722 (bvsub lt!369723 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!369722 lt!369723) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369725))))))

(assert (=> b!233947 (= lt!369722 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5308 (buf!5849 b2!99)))))))

(declare-fun b!233948 () Bool)

(assert (=> b!233948 (= e!161266 (array_inv!5049 (buf!5849 b2!99)))))

(declare-fun b!233949 () Bool)

(assert (=> b!233949 (= e!161267 e!161264)))

(declare-fun res!195709 () Bool)

(assert (=> b!233949 (=> (not res!195709) (not e!161264))))

(assert (=> b!233949 (= res!195709 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5308 (buf!5849 b1!101)))) lt!369724) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233949 (= lt!369724 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10892 b1!101))) ((_ sign_extend 32) (currentBit!10887 b1!101))))))

(declare-fun b!233950 () Bool)

(declare-fun res!195705 () Bool)

(assert (=> b!233950 (=> (not res!195705) (not e!161267))))

(assert (=> b!233950 (= res!195705 (= lt!369721 (bvadd (bitIndex!0 (size!5308 (buf!5849 b1!101)) (currentByte!10892 b1!101) (currentBit!10887 b1!101)) bits!86)))))

(declare-fun b!233951 () Bool)

(assert (=> b!233951 (= e!161265 (and (not (= (bvand bytes!19 #b10000000000000000000000000000000) (bvand lt!369720 #b10000000000000000000000000000000))) (not (= (bvand bytes!19 #b10000000000000000000000000000000) (bvand lt!369726 #b10000000000000000000000000000000)))))))

(assert (= (and start!49236 res!195704) b!233941))

(assert (= (and b!233941 res!195708) b!233945))

(assert (= (and b!233945 res!195707) b!233943))

(assert (= (and b!233943 res!195703) b!233950))

(assert (= (and b!233950 res!195705) b!233942))

(assert (= (and b!233942 res!195702) b!233949))

(assert (= (and b!233949 res!195709) b!233944))

(assert (= (and b!233944 res!195711) b!233947))

(assert (= (and b!233947 res!195710) b!233946))

(assert (= (and b!233946 res!195706) b!233951))

(assert (= start!49236 b!233940))

(assert (= start!49236 b!233948))

(declare-fun m!356327 () Bool)

(assert (=> b!233950 m!356327))

(declare-fun m!356329 () Bool)

(assert (=> b!233941 m!356329))

(declare-fun m!356331 () Bool)

(assert (=> b!233943 m!356331))

(declare-fun m!356333 () Bool)

(assert (=> b!233948 m!356333))

(declare-fun m!356335 () Bool)

(assert (=> b!233940 m!356335))

(declare-fun m!356337 () Bool)

(assert (=> start!49236 m!356337))

(declare-fun m!356339 () Bool)

(assert (=> start!49236 m!356339))

(declare-fun m!356341 () Bool)

(assert (=> b!233942 m!356341))

(declare-fun m!356343 () Bool)

(assert (=> b!233946 m!356343))

(push 1)

(assert (not b!233941))

(assert (not b!233950))

(assert (not b!233943))

(assert (not start!49236))

(assert (not b!233948))

(assert (not b!233942))

(assert (not b!233940))

(assert (not b!233946))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78760 () Bool)

(declare-fun e!161340 () Bool)

(assert (=> d!78760 e!161340))

(declare-fun res!195784 () Bool)

(assert (=> d!78760 (=> (not res!195784) (not e!161340))))

(declare-fun lt!369808 () (_ BitVec 64))

(declare-fun lt!369805 () (_ BitVec 64))

(declare-fun lt!369807 () (_ BitVec 64))

(assert (=> d!78760 (= res!195784 (= lt!369805 (bvsub lt!369807 lt!369808)))))

(assert (=> d!78760 (or (= (bvand lt!369807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369808 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369807 lt!369808) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78760 (= lt!369808 (remainingBits!0 ((_ sign_extend 32) (size!5308 (buf!5849 b1!101))) ((_ sign_extend 32) (currentByte!10892 b1!101)) ((_ sign_extend 32) (currentBit!10887 b1!101))))))

(declare-fun lt!369810 () (_ BitVec 64))

(declare-fun lt!369806 () (_ BitVec 64))

(assert (=> d!78760 (= lt!369807 (bvmul lt!369810 lt!369806))))

(assert (=> d!78760 (or (= lt!369810 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369806 (bvsdiv (bvmul lt!369810 lt!369806) lt!369810)))))

(assert (=> d!78760 (= lt!369806 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78760 (= lt!369810 ((_ sign_extend 32) (size!5308 (buf!5849 b1!101))))))

(assert (=> d!78760 (= lt!369805 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10892 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10887 b1!101))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78760 (invariant!0 (currentBit!10887 b1!101) (currentByte!10892 b1!101) (size!5308 (buf!5849 b1!101)))))

(assert (=> d!78760 (= (bitIndex!0 (size!5308 (buf!5849 b1!101)) (currentByte!10892 b1!101) (currentBit!10887 b1!101)) lt!369805)))

(declare-fun b!234036 () Bool)

(declare-fun res!195785 () Bool)

(assert (=> b!234036 (=> (not res!195785) (not e!161340))))

(assert (=> b!234036 (= res!195785 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369805))))

(declare-fun b!234037 () Bool)

(declare-fun lt!369809 () (_ BitVec 64))

(assert (=> b!234037 (= e!161340 (bvsle lt!369805 (bvmul lt!369809 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!234037 (or (= lt!369809 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369809 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369809)))))

(assert (=> b!234037 (= lt!369809 ((_ sign_extend 32) (size!5308 (buf!5849 b1!101))))))

(assert (= (and d!78760 res!195784) b!234036))

(assert (= (and b!234036 res!195785) b!234037))

(assert (=> d!78760 m!356341))

(declare-fun m!356387 () Bool)

(assert (=> d!78760 m!356387))

(assert (=> b!233950 d!78760))

(declare-fun d!78762 () Bool)

(assert (=> d!78762 (= (array_inv!5049 (buf!5849 b1!101)) (bvsge (size!5308 (buf!5849 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!233940 d!78762))

(declare-fun d!78764 () Bool)

(declare-fun e!161341 () Bool)

(assert (=> d!78764 e!161341))

(declare-fun res!195786 () Bool)

(assert (=> d!78764 (=> (not res!195786) (not e!161341))))

(declare-fun lt!369814 () (_ BitVec 64))

(declare-fun lt!369813 () (_ BitVec 64))

(declare-fun lt!369811 () (_ BitVec 64))

(assert (=> d!78764 (= res!195786 (= lt!369811 (bvsub lt!369813 lt!369814)))))

(assert (=> d!78764 (or (= (bvand lt!369813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369814 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369813 lt!369814) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78764 (= lt!369814 (remainingBits!0 ((_ sign_extend 32) (size!5308 (buf!5849 b2!99))) ((_ sign_extend 32) (currentByte!10892 b2!99)) ((_ sign_extend 32) (currentBit!10887 b2!99))))))

(declare-fun lt!369816 () (_ BitVec 64))

(declare-fun lt!369812 () (_ BitVec 64))

(assert (=> d!78764 (= lt!369813 (bvmul lt!369816 lt!369812))))

(assert (=> d!78764 (or (= lt!369816 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369812 (bvsdiv (bvmul lt!369816 lt!369812) lt!369816)))))

(assert (=> d!78764 (= lt!369812 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78764 (= lt!369816 ((_ sign_extend 32) (size!5308 (buf!5849 b2!99))))))

(assert (=> d!78764 (= lt!369811 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10892 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10887 b2!99))))))

(assert (=> d!78764 (invariant!0 (currentBit!10887 b2!99) (currentByte!10892 b2!99) (size!5308 (buf!5849 b2!99)))))

(assert (=> d!78764 (= (bitIndex!0 (size!5308 (buf!5849 b2!99)) (currentByte!10892 b2!99) (currentBit!10887 b2!99)) lt!369811)))

(declare-fun b!234038 () Bool)

(declare-fun res!195787 () Bool)

(assert (=> b!234038 (=> (not res!195787) (not e!161341))))

(assert (=> b!234038 (= res!195787 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369811))))

(declare-fun b!234039 () Bool)

(declare-fun lt!369815 () (_ BitVec 64))

(assert (=> b!234039 (= e!161341 (bvsle lt!369811 (bvmul lt!369815 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!234039 (or (= lt!369815 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369815 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369815)))))

(assert (=> b!234039 (= lt!369815 ((_ sign_extend 32) (size!5308 (buf!5849 b2!99))))))

(assert (= (and d!78764 res!195786) b!234038))

(assert (= (and b!234038 res!195787) b!234039))

(declare-fun m!356389 () Bool)

(assert (=> d!78764 m!356389))

(declare-fun m!356391 () Bool)

(assert (=> d!78764 m!356391))

(assert (=> b!233941 d!78764))

(declare-fun d!78766 () Bool)

(assert (=> d!78766 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5308 (buf!5849 b2!99))) ((_ sign_extend 32) (currentByte!10892 b2!99)) ((_ sign_extend 32) (currentBit!10887 b2!99)) lt!369726) (bvsle ((_ sign_extend 32) lt!369726) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5308 (buf!5849 b2!99))) ((_ sign_extend 32) (currentByte!10892 b2!99)) ((_ sign_extend 32) (currentBit!10887 b2!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19415 () Bool)

(assert (= bs!19415 d!78766))

(assert (=> bs!19415 m!356389))

(assert (=> b!233946 d!78766))

(declare-fun d!78768 () Bool)

(assert (=> d!78768 (= (inv!12 b1!101) (invariant!0 (currentBit!10887 b1!101) (currentByte!10892 b1!101) (size!5308 (buf!5849 b1!101))))))

(declare-fun bs!19416 () Bool)

(assert (= bs!19416 d!78768))

(assert (=> bs!19416 m!356387))

(assert (=> start!49236 d!78768))

(declare-fun d!78770 () Bool)

(assert (=> d!78770 (= (inv!12 b2!99) (invariant!0 (currentBit!10887 b2!99) (currentByte!10892 b2!99) (size!5308 (buf!5849 b2!99))))))

(declare-fun bs!19417 () Bool)

(assert (= bs!19417 d!78770))

(assert (=> bs!19417 m!356391))

(assert (=> start!49236 d!78770))

(declare-fun d!78772 () Bool)

(assert (=> d!78772 (= (remainingBits!0 ((_ sign_extend 32) (size!5308 (buf!5849 b1!101))) ((_ sign_extend 32) (currentByte!10892 b1!101)) ((_ sign_extend 32) (currentBit!10887 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5308 (buf!5849 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10892 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10887 b1!101)))))))

(assert (=> b!233942 d!78772))

(declare-fun d!78774 () Bool)

(assert (=> d!78774 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5308 (buf!5849 b1!101))) ((_ sign_extend 32) (currentByte!10892 b1!101)) ((_ sign_extend 32) (currentBit!10887 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5308 (buf!5849 b1!101))) ((_ sign_extend 32) (currentByte!10892 b1!101)) ((_ sign_extend 32) (currentBit!10887 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19418 () Bool)

(assert (= bs!19418 d!78774))

(assert (=> bs!19418 m!356341))

(assert (=> b!233943 d!78774))

(declare-fun d!78776 () Bool)

(assert (=> d!78776 (= (array_inv!5049 (buf!5849 b2!99)) (bvsge (size!5308 (buf!5849 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!233948 d!78776))

(push 1)

(assert (not d!78760))

(assert (not d!78766))

(assert (not d!78774))

(assert (not d!78770))

(assert (not d!78768))

(assert (not d!78764))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

