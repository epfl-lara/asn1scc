; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48578 () Bool)

(assert start!48578)

(declare-fun b!230167 () Bool)

(declare-fun e!158053 () Bool)

(declare-datatypes ((array!11725 0))(
  ( (array!11726 (arr!6127 (Array (_ BitVec 32) (_ BitVec 8))) (size!5140 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9376 0))(
  ( (BitStream!9377 (buf!5681 array!11725) (currentByte!10635 (_ BitVec 32)) (currentBit!10630 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9376)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!230167 (= e!158053 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10630 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10635 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!5140 (buf!5681 b2!99)))))))))

(declare-fun b!230168 () Bool)

(declare-fun e!158050 () Bool)

(declare-fun e!158058 () Bool)

(assert (=> b!230168 (= e!158050 e!158058)))

(declare-fun res!192944 () Bool)

(assert (=> b!230168 (=> (not res!192944) (not e!158058))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b1!101 () BitStream!9376)

(declare-fun lt!367883 () (_ BitVec 64))

(assert (=> b!230168 (= res!192944 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5140 (buf!5681 b1!101)))) lt!367883) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230168 (= lt!367883 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10635 b1!101))) ((_ sign_extend 32) (currentBit!10630 b1!101))))))

(declare-fun b!230169 () Bool)

(declare-fun res!192938 () Bool)

(assert (=> b!230169 (=> (not res!192938) (not e!158050))))

(declare-fun lt!367881 () (_ BitVec 64))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230169 (= res!192938 (= lt!367881 (bvadd (bitIndex!0 (size!5140 (buf!5681 b1!101)) (currentByte!10635 b1!101) (currentBit!10630 b1!101)) bits!86)))))

(declare-fun b!230171 () Bool)

(declare-fun res!192940 () Bool)

(assert (=> b!230171 (=> (not res!192940) (not e!158050))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230171 (= res!192940 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5140 (buf!5681 b1!101))) ((_ sign_extend 32) (currentByte!10635 b1!101)) ((_ sign_extend 32) (currentBit!10630 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!230172 () Bool)

(declare-fun res!192946 () Bool)

(assert (=> b!230172 (=> (not res!192946) (not e!158053))))

(assert (=> b!230172 (= res!192946 (and (bvsle ((_ sign_extend 32) (size!5140 (buf!5681 b2!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10635 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10630 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5140 (buf!5681 b2!99))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!10635 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!10630 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!230173 () Bool)

(declare-fun res!192937 () Bool)

(assert (=> b!230173 (=> (not res!192937) (not e!158053))))

(declare-fun lt!367879 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230173 (= res!192937 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5140 (buf!5681 b2!99))) ((_ sign_extend 32) (currentByte!10635 b2!99)) ((_ sign_extend 32) (currentBit!10630 b2!99)) (bvsub bytes!19 lt!367879)))))

(declare-fun b!230174 () Bool)

(declare-fun e!158056 () Bool)

(declare-fun e!158051 () Bool)

(assert (=> b!230174 (= e!158056 e!158051)))

(declare-fun res!192945 () Bool)

(assert (=> b!230174 (=> (not res!192945) (not e!158051))))

(assert (=> b!230174 (= res!192945 (bvsle bits!86 lt!367881))))

(assert (=> b!230174 (= lt!367881 (bitIndex!0 (size!5140 (buf!5681 b2!99)) (currentByte!10635 b2!99) (currentBit!10630 b2!99)))))

(declare-fun b!230175 () Bool)

(declare-fun e!158052 () Bool)

(assert (=> b!230175 (= e!158058 e!158052)))

(declare-fun res!192943 () Bool)

(assert (=> b!230175 (=> (not res!192943) (not e!158052))))

(declare-fun lt!367884 () (_ BitVec 64))

(assert (=> b!230175 (= res!192943 (and (= lt!367881 lt!367884) (= (bvsub lt!367881 bits!86) lt!367883)))))

(assert (=> b!230175 (= lt!367884 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10635 b2!99))) ((_ sign_extend 32) (currentBit!10630 b2!99))))))

(declare-fun b!230176 () Bool)

(assert (=> b!230176 (= e!158052 e!158053)))

(declare-fun res!192942 () Bool)

(assert (=> b!230176 (=> (not res!192942) (not e!158053))))

(declare-fun lt!367882 () (_ BitVec 64))

(declare-fun lt!367880 () (_ BitVec 64))

(assert (=> b!230176 (= res!192942 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!367882 (bvsub lt!367884 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!367882 lt!367884) #b0000000000000000000000000000000000000000000000000000000000001000) lt!367880))))))

(assert (=> b!230176 (= lt!367882 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5140 (buf!5681 b2!99)))))))

(declare-fun b!230177 () Bool)

(declare-fun e!158049 () Bool)

(declare-fun array_inv!4881 (array!11725) Bool)

(assert (=> b!230177 (= e!158049 (array_inv!4881 (buf!5681 b1!101)))))

(declare-fun res!192941 () Bool)

(assert (=> start!48578 (=> (not res!192941) (not e!158056))))

(assert (=> start!48578 (= res!192941 (and (= (size!5140 (buf!5681 b1!101)) (size!5140 (buf!5681 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48578 e!158056))

(declare-fun inv!12 (BitStream!9376) Bool)

(assert (=> start!48578 (and (inv!12 b1!101) e!158049)))

(declare-fun e!158054 () Bool)

(assert (=> start!48578 (and (inv!12 b2!99) e!158054)))

(assert (=> start!48578 true))

(declare-fun b!230170 () Bool)

(assert (=> b!230170 (= e!158054 (array_inv!4881 (buf!5681 b2!99)))))

(declare-fun b!230178 () Bool)

(assert (=> b!230178 (= e!158051 e!158050)))

(declare-fun res!192939 () Bool)

(assert (=> b!230178 (=> (not res!192939) (not e!158050))))

(assert (=> b!230178 (= res!192939 (bvsle lt!367879 bytes!19))))

(assert (=> b!230178 (= lt!367879 ((_ extract 31 0) lt!367880))))

(assert (=> b!230178 (= lt!367880 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!230179 () Bool)

(declare-fun res!192947 () Bool)

(assert (=> b!230179 (=> (not res!192947) (not e!158050))))

(assert (=> b!230179 (= res!192947 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5140 (buf!5681 b1!101))) ((_ sign_extend 32) (currentByte!10635 b1!101)) ((_ sign_extend 32) (currentBit!10630 b1!101)) bytes!19))))

(assert (= (and start!48578 res!192941) b!230174))

(assert (= (and b!230174 res!192945) b!230178))

(assert (= (and b!230178 res!192939) b!230179))

(assert (= (and b!230179 res!192947) b!230169))

(assert (= (and b!230169 res!192938) b!230171))

(assert (= (and b!230171 res!192940) b!230168))

(assert (= (and b!230168 res!192944) b!230175))

(assert (= (and b!230175 res!192943) b!230176))

(assert (= (and b!230176 res!192942) b!230173))

(assert (= (and b!230173 res!192937) b!230172))

(assert (= (and b!230172 res!192946) b!230167))

(assert (= start!48578 b!230177))

(assert (= start!48578 b!230170))

(declare-fun m!353569 () Bool)

(assert (=> b!230177 m!353569))

(declare-fun m!353571 () Bool)

(assert (=> b!230179 m!353571))

(declare-fun m!353573 () Bool)

(assert (=> b!230167 m!353573))

(declare-fun m!353575 () Bool)

(assert (=> b!230170 m!353575))

(declare-fun m!353577 () Bool)

(assert (=> b!230169 m!353577))

(declare-fun m!353579 () Bool)

(assert (=> start!48578 m!353579))

(declare-fun m!353581 () Bool)

(assert (=> start!48578 m!353581))

(declare-fun m!353583 () Bool)

(assert (=> b!230173 m!353583))

(declare-fun m!353585 () Bool)

(assert (=> b!230171 m!353585))

(declare-fun m!353587 () Bool)

(assert (=> b!230174 m!353587))

(push 1)

(assert (not b!230174))

(assert (not b!230173))

(assert (not b!230179))

(assert (not b!230170))

(assert (not start!48578))

(assert (not b!230167))

(assert (not b!230177))

(assert (not b!230171))

(assert (not b!230169))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78116 () Bool)

(declare-fun e!158125 () Bool)

(assert (=> d!78116 e!158125))

(declare-fun res!193026 () Bool)

(assert (=> d!78116 (=> (not res!193026) (not e!158125))))

(declare-fun lt!367959 () (_ BitVec 64))

(declare-fun lt!367958 () (_ BitVec 64))

(declare-fun lt!367961 () (_ BitVec 64))

(assert (=> d!78116 (= res!193026 (= lt!367958 (bvsub lt!367959 lt!367961)))))

(assert (=> d!78116 (or (= (bvand lt!367959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367961 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367959 lt!367961) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78116 (= lt!367961 (remainingBits!0 ((_ sign_extend 32) (size!5140 (buf!5681 b1!101))) ((_ sign_extend 32) (currentByte!10635 b1!101)) ((_ sign_extend 32) (currentBit!10630 b1!101))))))

(declare-fun lt!367957 () (_ BitVec 64))

(declare-fun lt!367962 () (_ BitVec 64))

(assert (=> d!78116 (= lt!367959 (bvmul lt!367957 lt!367962))))

(assert (=> d!78116 (or (= lt!367957 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367962 (bvsdiv (bvmul lt!367957 lt!367962) lt!367957)))))

(assert (=> d!78116 (= lt!367962 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78116 (= lt!367957 ((_ sign_extend 32) (size!5140 (buf!5681 b1!101))))))

(assert (=> d!78116 (= lt!367958 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10635 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10630 b1!101))))))

(assert (=> d!78116 (invariant!0 (currentBit!10630 b1!101) (currentByte!10635 b1!101) (size!5140 (buf!5681 b1!101)))))

(assert (=> d!78116 (= (bitIndex!0 (size!5140 (buf!5681 b1!101)) (currentByte!10635 b1!101) (currentBit!10630 b1!101)) lt!367958)))

(declare-fun b!230270 () Bool)

(declare-fun res!193027 () Bool)

(assert (=> b!230270 (=> (not res!193027) (not e!158125))))

(assert (=> b!230270 (= res!193027 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367958))))

(declare-fun b!230271 () Bool)

(declare-fun lt!367960 () (_ BitVec 64))

(assert (=> b!230271 (= e!158125 (bvsle lt!367958 (bvmul lt!367960 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230271 (or (= lt!367960 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367960 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367960)))))

(assert (=> b!230271 (= lt!367960 ((_ sign_extend 32) (size!5140 (buf!5681 b1!101))))))

(assert (= (and d!78116 res!193026) b!230270))

(assert (= (and b!230270 res!193027) b!230271))

(assert (=> d!78116 m!353585))

(declare-fun m!353635 () Bool)

(assert (=> d!78116 m!353635))

(assert (=> b!230169 d!78116))

(declare-fun d!78118 () Bool)

(declare-fun e!158126 () Bool)

(assert (=> d!78118 e!158126))

(declare-fun res!193028 () Bool)

(assert (=> d!78118 (=> (not res!193028) (not e!158126))))

(declare-fun lt!367967 () (_ BitVec 64))

(declare-fun lt!367964 () (_ BitVec 64))

(declare-fun lt!367965 () (_ BitVec 64))

(assert (=> d!78118 (= res!193028 (= lt!367964 (bvsub lt!367965 lt!367967)))))

(assert (=> d!78118 (or (= (bvand lt!367965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367967 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367965 lt!367967) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78118 (= lt!367967 (remainingBits!0 ((_ sign_extend 32) (size!5140 (buf!5681 b2!99))) ((_ sign_extend 32) (currentByte!10635 b2!99)) ((_ sign_extend 32) (currentBit!10630 b2!99))))))

(declare-fun lt!367963 () (_ BitVec 64))

(declare-fun lt!367968 () (_ BitVec 64))

(assert (=> d!78118 (= lt!367965 (bvmul lt!367963 lt!367968))))

(assert (=> d!78118 (or (= lt!367963 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367968 (bvsdiv (bvmul lt!367963 lt!367968) lt!367963)))))

(assert (=> d!78118 (= lt!367968 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78118 (= lt!367963 ((_ sign_extend 32) (size!5140 (buf!5681 b2!99))))))

(assert (=> d!78118 (= lt!367964 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10635 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10630 b2!99))))))

(assert (=> d!78118 (invariant!0 (currentBit!10630 b2!99) (currentByte!10635 b2!99) (size!5140 (buf!5681 b2!99)))))

(assert (=> d!78118 (= (bitIndex!0 (size!5140 (buf!5681 b2!99)) (currentByte!10635 b2!99) (currentBit!10630 b2!99)) lt!367964)))

(declare-fun b!230272 () Bool)

(declare-fun res!193029 () Bool)

(assert (=> b!230272 (=> (not res!193029) (not e!158126))))

(assert (=> b!230272 (= res!193029 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367964))))

(declare-fun b!230273 () Bool)

(declare-fun lt!367966 () (_ BitVec 64))

(assert (=> b!230273 (= e!158126 (bvsle lt!367964 (bvmul lt!367966 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230273 (or (= lt!367966 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367966 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367966)))))

(assert (=> b!230273 (= lt!367966 ((_ sign_extend 32) (size!5140 (buf!5681 b2!99))))))

(assert (= (and d!78118 res!193028) b!230272))

(assert (= (and b!230272 res!193029) b!230273))

(declare-fun m!353637 () Bool)

(assert (=> d!78118 m!353637))

(declare-fun m!353639 () Bool)

(assert (=> d!78118 m!353639))

(assert (=> b!230174 d!78118))

(declare-fun d!78120 () Bool)

(assert (=> d!78120 (= (array_inv!4881 (buf!5681 b2!99)) (bvsge (size!5140 (buf!5681 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230170 d!78120))

(declare-fun d!78122 () Bool)

(assert (=> d!78122 (= (remainingBits!0 ((_ sign_extend 32) (size!5140 (buf!5681 b1!101))) ((_ sign_extend 32) (currentByte!10635 b1!101)) ((_ sign_extend 32) (currentBit!10630 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5140 (buf!5681 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10635 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10630 b1!101)))))))

(assert (=> b!230171 d!78122))

(declare-fun d!78124 () Bool)

(assert (=> d!78124 (= (inv!12 b1!101) (invariant!0 (currentBit!10630 b1!101) (currentByte!10635 b1!101) (size!5140 (buf!5681 b1!101))))))

(declare-fun bs!19140 () Bool)

(assert (= bs!19140 d!78124))

(assert (=> bs!19140 m!353635))

(assert (=> start!48578 d!78124))

(declare-fun d!78126 () Bool)

(assert (=> d!78126 (= (inv!12 b2!99) (invariant!0 (currentBit!10630 b2!99) (currentByte!10635 b2!99) (size!5140 (buf!5681 b2!99))))))

(declare-fun bs!19141 () Bool)

(assert (= bs!19141 d!78126))

(assert (=> bs!19141 m!353639))

(assert (=> start!48578 d!78126))

(declare-fun d!78128 () Bool)

(assert (=> d!78128 (= (array_inv!4881 (buf!5681 b1!101)) (bvsge (size!5140 (buf!5681 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230177 d!78128))

(declare-fun d!78130 () Bool)

(assert (=> d!78130 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10630 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10635 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!5140 (buf!5681 b2!99))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10630 b2!99))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10630 b2!99))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10635 b2!99))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10635 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!5140 (buf!5681 b2!99))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10630 b2!99))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10635 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!5140 (buf!5681 b2!99)))))))))))

(assert (=> b!230167 d!78130))

(declare-fun d!78132 () Bool)

(assert (=> d!78132 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5140 (buf!5681 b2!99))) ((_ sign_extend 32) (currentByte!10635 b2!99)) ((_ sign_extend 32) (currentBit!10630 b2!99)) (bvsub bytes!19 lt!367879)) (bvsle ((_ sign_extend 32) (bvsub bytes!19 lt!367879)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5140 (buf!5681 b2!99))) ((_ sign_extend 32) (currentByte!10635 b2!99)) ((_ sign_extend 32) (currentBit!10630 b2!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19142 () Bool)

(assert (= bs!19142 d!78132))

(assert (=> bs!19142 m!353637))

(assert (=> b!230173 d!78132))

(declare-fun d!78134 () Bool)

(assert (=> d!78134 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5140 (buf!5681 b1!101))) ((_ sign_extend 32) (currentByte!10635 b1!101)) ((_ sign_extend 32) (currentBit!10630 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5140 (buf!5681 b1!101))) ((_ sign_extend 32) (currentByte!10635 b1!101)) ((_ sign_extend 32) (currentBit!10630 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19143 () Bool)

(assert (= bs!19143 d!78134))

(assert (=> bs!19143 m!353585))

(assert (=> b!230179 d!78134))

(push 1)

(assert (not d!78134))

(assert (not d!78116))

(assert (not d!78126))

(assert (not d!78118))

(assert (not d!78124))

(assert (not d!78132))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

