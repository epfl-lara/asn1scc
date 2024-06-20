; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48706 () Bool)

(assert start!48706)

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun e!158412 () Bool)

(declare-fun lt!368201 () (_ BitVec 64))

(declare-fun lt!368202 () (_ BitVec 64))

(declare-datatypes ((array!11768 0))(
  ( (array!11769 (arr!6144 (Array (_ BitVec 32) (_ BitVec 8))) (size!5157 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9410 0))(
  ( (BitStream!9411 (buf!5698 array!11768) (currentByte!10681 (_ BitVec 32)) (currentBit!10676 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9410)

(declare-fun b!230624 () Bool)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9410)

(assert (=> b!230624 (= e!158412 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5157 (buf!5698 b1!101)))) lt!368201) #b0000000000000000000000000000000000000000000000000000000000001000)) (= lt!368202 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10681 b2!99))) ((_ sign_extend 32) (currentBit!10676 b2!99)))) (not (= (bvsub lt!368202 bits!86) lt!368201))))))

(assert (=> b!230624 (= lt!368201 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10681 b1!101))) ((_ sign_extend 32) (currentBit!10676 b1!101))))))

(declare-fun b!230625 () Bool)

(declare-fun e!158417 () Bool)

(declare-fun array_inv!4898 (array!11768) Bool)

(assert (=> b!230625 (= e!158417 (array_inv!4898 (buf!5698 b1!101)))))

(declare-fun b!230626 () Bool)

(declare-fun res!193295 () Bool)

(assert (=> b!230626 (=> (not res!193295) (not e!158412))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230626 (= res!193295 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5157 (buf!5698 b1!101))) ((_ sign_extend 32) (currentByte!10681 b1!101)) ((_ sign_extend 32) (currentBit!10676 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!230627 () Bool)

(declare-fun e!158416 () Bool)

(assert (=> b!230627 (= e!158416 e!158412)))

(declare-fun res!193293 () Bool)

(assert (=> b!230627 (=> (not res!193293) (not e!158412))))

(assert (=> b!230627 (= res!193293 (and (bvsle bits!86 lt!368202) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230627 (= lt!368202 (bitIndex!0 (size!5157 (buf!5698 b2!99)) (currentByte!10681 b2!99) (currentBit!10676 b2!99)))))

(declare-fun res!193292 () Bool)

(assert (=> start!48706 (=> (not res!193292) (not e!158416))))

(assert (=> start!48706 (= res!193292 (and (= (size!5157 (buf!5698 b1!101)) (size!5157 (buf!5698 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48706 e!158416))

(declare-fun inv!12 (BitStream!9410) Bool)

(assert (=> start!48706 (and (inv!12 b1!101) e!158417)))

(declare-fun e!158414 () Bool)

(assert (=> start!48706 (and (inv!12 b2!99) e!158414)))

(assert (=> start!48706 true))

(declare-fun b!230628 () Bool)

(declare-fun res!193296 () Bool)

(assert (=> b!230628 (=> (not res!193296) (not e!158412))))

(assert (=> b!230628 (= res!193296 (= lt!368202 (bvadd (bitIndex!0 (size!5157 (buf!5698 b1!101)) (currentByte!10681 b1!101) (currentBit!10676 b1!101)) bits!86)))))

(declare-fun b!230629 () Bool)

(declare-fun res!193294 () Bool)

(assert (=> b!230629 (=> (not res!193294) (not e!158412))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230629 (= res!193294 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5157 (buf!5698 b1!101))) ((_ sign_extend 32) (currentByte!10681 b1!101)) ((_ sign_extend 32) (currentBit!10676 b1!101)) bytes!19))))

(declare-fun b!230630 () Bool)

(assert (=> b!230630 (= e!158414 (array_inv!4898 (buf!5698 b2!99)))))

(assert (= (and start!48706 res!193292) b!230627))

(assert (= (and b!230627 res!193293) b!230629))

(assert (= (and b!230629 res!193294) b!230628))

(assert (= (and b!230628 res!193296) b!230626))

(assert (= (and b!230626 res!193295) b!230624))

(assert (= start!48706 b!230625))

(assert (= start!48706 b!230630))

(declare-fun m!353899 () Bool)

(assert (=> b!230625 m!353899))

(declare-fun m!353901 () Bool)

(assert (=> b!230628 m!353901))

(declare-fun m!353903 () Bool)

(assert (=> start!48706 m!353903))

(declare-fun m!353905 () Bool)

(assert (=> start!48706 m!353905))

(declare-fun m!353907 () Bool)

(assert (=> b!230627 m!353907))

(declare-fun m!353909 () Bool)

(assert (=> b!230626 m!353909))

(declare-fun m!353911 () Bool)

(assert (=> b!230629 m!353911))

(declare-fun m!353913 () Bool)

(assert (=> b!230630 m!353913))

(push 1)

(assert (not start!48706))

(assert (not b!230628))

(assert (not b!230629))

(assert (not b!230626))

(assert (not b!230625))

(assert (not b!230630))

(assert (not b!230627))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78276 () Bool)

(assert (=> d!78276 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5157 (buf!5698 b1!101))) ((_ sign_extend 32) (currentByte!10681 b1!101)) ((_ sign_extend 32) (currentBit!10676 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5157 (buf!5698 b1!101))) ((_ sign_extend 32) (currentByte!10681 b1!101)) ((_ sign_extend 32) (currentBit!10676 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19185 () Bool)

(assert (= bs!19185 d!78276))

(assert (=> bs!19185 m!353909))

(assert (=> b!230629 d!78276))

(declare-fun d!78282 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78282 (= (inv!12 b1!101) (invariant!0 (currentBit!10676 b1!101) (currentByte!10681 b1!101) (size!5157 (buf!5698 b1!101))))))

(declare-fun bs!19186 () Bool)

(assert (= bs!19186 d!78282))

(declare-fun m!353927 () Bool)

(assert (=> bs!19186 m!353927))

(assert (=> start!48706 d!78282))

(declare-fun d!78284 () Bool)

(assert (=> d!78284 (= (inv!12 b2!99) (invariant!0 (currentBit!10676 b2!99) (currentByte!10681 b2!99) (size!5157 (buf!5698 b2!99))))))

(declare-fun bs!19187 () Bool)

(assert (= bs!19187 d!78284))

(declare-fun m!353929 () Bool)

(assert (=> bs!19187 m!353929))

(assert (=> start!48706 d!78284))

(declare-fun d!78286 () Bool)

(declare-fun e!158428 () Bool)

(assert (=> d!78286 e!158428))

(declare-fun res!193317 () Bool)

(assert (=> d!78286 (=> (not res!193317) (not e!158428))))

(declare-fun lt!368266 () (_ BitVec 64))

(declare-fun lt!368263 () (_ BitVec 64))

(declare-fun lt!368265 () (_ BitVec 64))

(assert (=> d!78286 (= res!193317 (= lt!368263 (bvsub lt!368266 lt!368265)))))

(assert (=> d!78286 (or (= (bvand lt!368266 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368265 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368266 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368266 lt!368265) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78286 (= lt!368265 (remainingBits!0 ((_ sign_extend 32) (size!5157 (buf!5698 b1!101))) ((_ sign_extend 32) (currentByte!10681 b1!101)) ((_ sign_extend 32) (currentBit!10676 b1!101))))))

(declare-fun lt!368264 () (_ BitVec 64))

(declare-fun lt!368268 () (_ BitVec 64))

(assert (=> d!78286 (= lt!368266 (bvmul lt!368264 lt!368268))))

(assert (=> d!78286 (or (= lt!368264 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368268 (bvsdiv (bvmul lt!368264 lt!368268) lt!368264)))))

(assert (=> d!78286 (= lt!368268 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78286 (= lt!368264 ((_ sign_extend 32) (size!5157 (buf!5698 b1!101))))))

(assert (=> d!78286 (= lt!368263 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10681 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10676 b1!101))))))

(assert (=> d!78286 (invariant!0 (currentBit!10676 b1!101) (currentByte!10681 b1!101) (size!5157 (buf!5698 b1!101)))))

(assert (=> d!78286 (= (bitIndex!0 (size!5157 (buf!5698 b1!101)) (currentByte!10681 b1!101) (currentBit!10676 b1!101)) lt!368263)))

(declare-fun b!230651 () Bool)

(declare-fun res!193318 () Bool)

(assert (=> b!230651 (=> (not res!193318) (not e!158428))))

(assert (=> b!230651 (= res!193318 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368263))))

(declare-fun b!230652 () Bool)

(declare-fun lt!368267 () (_ BitVec 64))

(assert (=> b!230652 (= e!158428 (bvsle lt!368263 (bvmul lt!368267 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230652 (or (= lt!368267 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368267 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368267)))))

(assert (=> b!230652 (= lt!368267 ((_ sign_extend 32) (size!5157 (buf!5698 b1!101))))))

(assert (= (and d!78286 res!193317) b!230651))

(assert (= (and b!230651 res!193318) b!230652))

(assert (=> d!78286 m!353909))

(assert (=> d!78286 m!353927))

(assert (=> b!230628 d!78286))

(declare-fun d!78296 () Bool)

(declare-fun e!158429 () Bool)

(assert (=> d!78296 e!158429))

(declare-fun res!193319 () Bool)

(assert (=> d!78296 (=> (not res!193319) (not e!158429))))

(declare-fun lt!368269 () (_ BitVec 64))

(declare-fun lt!368272 () (_ BitVec 64))

(declare-fun lt!368271 () (_ BitVec 64))

(assert (=> d!78296 (= res!193319 (= lt!368269 (bvsub lt!368272 lt!368271)))))

(assert (=> d!78296 (or (= (bvand lt!368272 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368271 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368272 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368272 lt!368271) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78296 (= lt!368271 (remainingBits!0 ((_ sign_extend 32) (size!5157 (buf!5698 b2!99))) ((_ sign_extend 32) (currentByte!10681 b2!99)) ((_ sign_extend 32) (currentBit!10676 b2!99))))))

(declare-fun lt!368270 () (_ BitVec 64))

(declare-fun lt!368274 () (_ BitVec 64))

(assert (=> d!78296 (= lt!368272 (bvmul lt!368270 lt!368274))))

(assert (=> d!78296 (or (= lt!368270 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368274 (bvsdiv (bvmul lt!368270 lt!368274) lt!368270)))))

(assert (=> d!78296 (= lt!368274 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78296 (= lt!368270 ((_ sign_extend 32) (size!5157 (buf!5698 b2!99))))))

(assert (=> d!78296 (= lt!368269 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10681 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10676 b2!99))))))

(assert (=> d!78296 (invariant!0 (currentBit!10676 b2!99) (currentByte!10681 b2!99) (size!5157 (buf!5698 b2!99)))))

(assert (=> d!78296 (= (bitIndex!0 (size!5157 (buf!5698 b2!99)) (currentByte!10681 b2!99) (currentBit!10676 b2!99)) lt!368269)))

(declare-fun b!230653 () Bool)

(declare-fun res!193320 () Bool)

(assert (=> b!230653 (=> (not res!193320) (not e!158429))))

(assert (=> b!230653 (= res!193320 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368269))))

(declare-fun b!230654 () Bool)

(declare-fun lt!368273 () (_ BitVec 64))

(assert (=> b!230654 (= e!158429 (bvsle lt!368269 (bvmul lt!368273 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230654 (or (= lt!368273 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368273 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368273)))))

(assert (=> b!230654 (= lt!368273 ((_ sign_extend 32) (size!5157 (buf!5698 b2!99))))))

(assert (= (and d!78296 res!193319) b!230653))

(assert (= (and b!230653 res!193320) b!230654))

(declare-fun m!353931 () Bool)

(assert (=> d!78296 m!353931))

(assert (=> d!78296 m!353929))

(assert (=> b!230627 d!78296))

(declare-fun d!78298 () Bool)

(assert (=> d!78298 (= (remainingBits!0 ((_ sign_extend 32) (size!5157 (buf!5698 b1!101))) ((_ sign_extend 32) (currentByte!10681 b1!101)) ((_ sign_extend 32) (currentBit!10676 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5157 (buf!5698 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10681 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10676 b1!101)))))))

(assert (=> b!230626 d!78298))

(declare-fun d!78300 () Bool)

(assert (=> d!78300 (= (array_inv!4898 (buf!5698 b1!101)) (bvsge (size!5157 (buf!5698 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230625 d!78300))

(declare-fun d!78302 () Bool)

(assert (=> d!78302 (= (array_inv!4898 (buf!5698 b2!99)) (bvsge (size!5157 (buf!5698 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230630 d!78302))

(push 1)

(assert (not d!78296))

(assert (not d!78284))

(assert (not d!78282))

(assert (not d!78276))

(assert (not d!78286))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

