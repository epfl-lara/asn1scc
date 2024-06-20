; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48616 () Bool)

(assert start!48616)

(declare-fun b!230358 () Bool)

(declare-fun e!158204 () Bool)

(declare-datatypes ((array!11741 0))(
  ( (array!11742 (arr!6134 (Array (_ BitVec 32) (_ BitVec 8))) (size!5147 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9390 0))(
  ( (BitStream!9391 (buf!5688 array!11741) (currentByte!10650 (_ BitVec 32)) (currentBit!10645 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9390)

(declare-fun array_inv!4888 (array!11741) Bool)

(assert (=> b!230358 (= e!158204 (array_inv!4888 (buf!5688 b1!101)))))

(declare-fun b!230359 () Bool)

(declare-fun res!193087 () Bool)

(declare-fun e!158202 () Bool)

(assert (=> b!230359 (=> (not res!193087) (not e!158202))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230359 (= res!193087 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5147 (buf!5688 b1!101))) ((_ sign_extend 32) (currentByte!10650 b1!101)) ((_ sign_extend 32) (currentBit!10645 b1!101)) bytes!19))))

(declare-fun res!193086 () Bool)

(declare-fun e!158203 () Bool)

(assert (=> start!48616 (=> (not res!193086) (not e!158203))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9390)

(assert (=> start!48616 (= res!193086 (and (= (size!5147 (buf!5688 b1!101)) (size!5147 (buf!5688 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48616 e!158203))

(declare-fun inv!12 (BitStream!9390) Bool)

(assert (=> start!48616 (and (inv!12 b1!101) e!158204)))

(declare-fun e!158207 () Bool)

(assert (=> start!48616 (and (inv!12 b2!99) e!158207)))

(assert (=> start!48616 true))

(declare-fun b!230360 () Bool)

(declare-fun res!193089 () Bool)

(assert (=> b!230360 (=> (not res!193089) (not e!158202))))

(declare-fun lt!367983 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230360 (= res!193089 (= lt!367983 (bvadd (bitIndex!0 (size!5147 (buf!5688 b1!101)) (currentByte!10650 b1!101) (currentBit!10645 b1!101)) bits!86)))))

(declare-fun b!230361 () Bool)

(assert (=> b!230361 (= e!158207 (array_inv!4888 (buf!5688 b2!99)))))

(declare-fun b!230362 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230362 (= e!158202 (bvsgt ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5147 (buf!5688 b1!101))) ((_ sign_extend 32) (currentByte!10650 b1!101)) ((_ sign_extend 32) (currentBit!10645 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!230363 () Bool)

(assert (=> b!230363 (= e!158203 e!158202)))

(declare-fun res!193088 () Bool)

(assert (=> b!230363 (=> (not res!193088) (not e!158202))))

(assert (=> b!230363 (= res!193088 (and (bvsle bits!86 lt!367983) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!230363 (= lt!367983 (bitIndex!0 (size!5147 (buf!5688 b2!99)) (currentByte!10650 b2!99) (currentBit!10645 b2!99)))))

(assert (= (and start!48616 res!193086) b!230363))

(assert (= (and b!230363 res!193088) b!230359))

(assert (= (and b!230359 res!193087) b!230360))

(assert (= (and b!230360 res!193089) b!230362))

(assert (= start!48616 b!230358))

(assert (= start!48616 b!230361))

(declare-fun m!353699 () Bool)

(assert (=> b!230363 m!353699))

(declare-fun m!353701 () Bool)

(assert (=> b!230359 m!353701))

(declare-fun m!353703 () Bool)

(assert (=> b!230362 m!353703))

(declare-fun m!353705 () Bool)

(assert (=> b!230358 m!353705))

(declare-fun m!353707 () Bool)

(assert (=> b!230361 m!353707))

(declare-fun m!353709 () Bool)

(assert (=> start!48616 m!353709))

(declare-fun m!353711 () Bool)

(assert (=> start!48616 m!353711))

(declare-fun m!353713 () Bool)

(assert (=> b!230360 m!353713))

(check-sat (not b!230361) (not b!230359) (not b!230362) (not b!230360) (not b!230358) (not b!230363) (not start!48616))
(check-sat)
(get-model)

(declare-fun d!78140 () Bool)

(assert (=> d!78140 (= (array_inv!4888 (buf!5688 b1!101)) (bvsge (size!5147 (buf!5688 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230358 d!78140))

(declare-fun d!78142 () Bool)

(assert (=> d!78142 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5147 (buf!5688 b1!101))) ((_ sign_extend 32) (currentByte!10650 b1!101)) ((_ sign_extend 32) (currentBit!10645 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5147 (buf!5688 b1!101))) ((_ sign_extend 32) (currentByte!10650 b1!101)) ((_ sign_extend 32) (currentBit!10645 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19150 () Bool)

(assert (= bs!19150 d!78142))

(assert (=> bs!19150 m!353703))

(assert (=> b!230359 d!78142))

(declare-fun d!78144 () Bool)

(declare-fun e!158228 () Bool)

(assert (=> d!78144 e!158228))

(declare-fun res!193106 () Bool)

(assert (=> d!78144 (=> (not res!193106) (not e!158228))))

(declare-fun lt!368000 () (_ BitVec 64))

(declare-fun lt!368002 () (_ BitVec 64))

(declare-fun lt!368004 () (_ BitVec 64))

(assert (=> d!78144 (= res!193106 (= lt!368004 (bvsub lt!368000 lt!368002)))))

(assert (=> d!78144 (or (= (bvand lt!368000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368002 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368000 lt!368002) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78144 (= lt!368002 (remainingBits!0 ((_ sign_extend 32) (size!5147 (buf!5688 b1!101))) ((_ sign_extend 32) (currentByte!10650 b1!101)) ((_ sign_extend 32) (currentBit!10645 b1!101))))))

(declare-fun lt!368003 () (_ BitVec 64))

(declare-fun lt!367999 () (_ BitVec 64))

(assert (=> d!78144 (= lt!368000 (bvmul lt!368003 lt!367999))))

(assert (=> d!78144 (or (= lt!368003 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367999 (bvsdiv (bvmul lt!368003 lt!367999) lt!368003)))))

(assert (=> d!78144 (= lt!367999 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78144 (= lt!368003 ((_ sign_extend 32) (size!5147 (buf!5688 b1!101))))))

(assert (=> d!78144 (= lt!368004 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10650 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10645 b1!101))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78144 (invariant!0 (currentBit!10645 b1!101) (currentByte!10650 b1!101) (size!5147 (buf!5688 b1!101)))))

(assert (=> d!78144 (= (bitIndex!0 (size!5147 (buf!5688 b1!101)) (currentByte!10650 b1!101) (currentBit!10645 b1!101)) lt!368004)))

(declare-fun b!230386 () Bool)

(declare-fun res!193107 () Bool)

(assert (=> b!230386 (=> (not res!193107) (not e!158228))))

(assert (=> b!230386 (= res!193107 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368004))))

(declare-fun b!230387 () Bool)

(declare-fun lt!368001 () (_ BitVec 64))

(assert (=> b!230387 (= e!158228 (bvsle lt!368004 (bvmul lt!368001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230387 (or (= lt!368001 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368001 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368001)))))

(assert (=> b!230387 (= lt!368001 ((_ sign_extend 32) (size!5147 (buf!5688 b1!101))))))

(assert (= (and d!78144 res!193106) b!230386))

(assert (= (and b!230386 res!193107) b!230387))

(assert (=> d!78144 m!353703))

(declare-fun m!353731 () Bool)

(assert (=> d!78144 m!353731))

(assert (=> b!230360 d!78144))

(declare-fun d!78146 () Bool)

(assert (=> d!78146 (= (inv!12 b1!101) (invariant!0 (currentBit!10645 b1!101) (currentByte!10650 b1!101) (size!5147 (buf!5688 b1!101))))))

(declare-fun bs!19151 () Bool)

(assert (= bs!19151 d!78146))

(assert (=> bs!19151 m!353731))

(assert (=> start!48616 d!78146))

(declare-fun d!78148 () Bool)

(assert (=> d!78148 (= (inv!12 b2!99) (invariant!0 (currentBit!10645 b2!99) (currentByte!10650 b2!99) (size!5147 (buf!5688 b2!99))))))

(declare-fun bs!19152 () Bool)

(assert (= bs!19152 d!78148))

(declare-fun m!353733 () Bool)

(assert (=> bs!19152 m!353733))

(assert (=> start!48616 d!78148))

(declare-fun d!78150 () Bool)

(assert (=> d!78150 (= (array_inv!4888 (buf!5688 b2!99)) (bvsge (size!5147 (buf!5688 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230361 d!78150))

(declare-fun d!78152 () Bool)

(assert (=> d!78152 (= (remainingBits!0 ((_ sign_extend 32) (size!5147 (buf!5688 b1!101))) ((_ sign_extend 32) (currentByte!10650 b1!101)) ((_ sign_extend 32) (currentBit!10645 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5147 (buf!5688 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10650 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10645 b1!101)))))))

(assert (=> b!230362 d!78152))

(declare-fun d!78154 () Bool)

(declare-fun e!158229 () Bool)

(assert (=> d!78154 e!158229))

(declare-fun res!193108 () Bool)

(assert (=> d!78154 (=> (not res!193108) (not e!158229))))

(declare-fun lt!368010 () (_ BitVec 64))

(declare-fun lt!368006 () (_ BitVec 64))

(declare-fun lt!368008 () (_ BitVec 64))

(assert (=> d!78154 (= res!193108 (= lt!368010 (bvsub lt!368006 lt!368008)))))

(assert (=> d!78154 (or (= (bvand lt!368006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368008 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368006 lt!368008) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78154 (= lt!368008 (remainingBits!0 ((_ sign_extend 32) (size!5147 (buf!5688 b2!99))) ((_ sign_extend 32) (currentByte!10650 b2!99)) ((_ sign_extend 32) (currentBit!10645 b2!99))))))

(declare-fun lt!368009 () (_ BitVec 64))

(declare-fun lt!368005 () (_ BitVec 64))

(assert (=> d!78154 (= lt!368006 (bvmul lt!368009 lt!368005))))

(assert (=> d!78154 (or (= lt!368009 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368005 (bvsdiv (bvmul lt!368009 lt!368005) lt!368009)))))

(assert (=> d!78154 (= lt!368005 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78154 (= lt!368009 ((_ sign_extend 32) (size!5147 (buf!5688 b2!99))))))

(assert (=> d!78154 (= lt!368010 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10650 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10645 b2!99))))))

(assert (=> d!78154 (invariant!0 (currentBit!10645 b2!99) (currentByte!10650 b2!99) (size!5147 (buf!5688 b2!99)))))

(assert (=> d!78154 (= (bitIndex!0 (size!5147 (buf!5688 b2!99)) (currentByte!10650 b2!99) (currentBit!10645 b2!99)) lt!368010)))

(declare-fun b!230388 () Bool)

(declare-fun res!193109 () Bool)

(assert (=> b!230388 (=> (not res!193109) (not e!158229))))

(assert (=> b!230388 (= res!193109 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368010))))

(declare-fun b!230389 () Bool)

(declare-fun lt!368007 () (_ BitVec 64))

(assert (=> b!230389 (= e!158229 (bvsle lt!368010 (bvmul lt!368007 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230389 (or (= lt!368007 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368007 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368007)))))

(assert (=> b!230389 (= lt!368007 ((_ sign_extend 32) (size!5147 (buf!5688 b2!99))))))

(assert (= (and d!78154 res!193108) b!230388))

(assert (= (and b!230388 res!193109) b!230389))

(declare-fun m!353735 () Bool)

(assert (=> d!78154 m!353735))

(assert (=> d!78154 m!353733))

(assert (=> b!230363 d!78154))

(check-sat (not d!78142) (not d!78154) (not d!78146) (not d!78144) (not d!78148))
