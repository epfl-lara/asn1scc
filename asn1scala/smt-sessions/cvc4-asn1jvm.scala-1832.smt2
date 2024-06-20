; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49198 () Bool)

(assert start!49198)

(declare-fun res!195559 () Bool)

(declare-fun e!161125 () Bool)

(assert (=> start!49198 (=> (not res!195559) (not e!161125))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!12086 0))(
  ( (array!12087 (arr!6291 (Array (_ BitVec 32) (_ BitVec 8))) (size!5304 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9704 0))(
  ( (BitStream!9705 (buf!5845 array!12086) (currentByte!10879 (_ BitVec 32)) (currentBit!10874 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9704)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9704)

(assert (=> start!49198 (= res!195559 (and (= (size!5304 (buf!5845 b1!101)) (size!5304 (buf!5845 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49198 e!161125))

(declare-fun e!161123 () Bool)

(declare-fun inv!12 (BitStream!9704) Bool)

(assert (=> start!49198 (and (inv!12 b1!101) e!161123)))

(declare-fun e!161130 () Bool)

(assert (=> start!49198 (and (inv!12 b2!99) e!161130)))

(assert (=> start!49198 true))

(declare-fun b!233772 () Bool)

(declare-fun array_inv!5045 (array!12086) Bool)

(assert (=> b!233772 (= e!161123 (array_inv!5045 (buf!5845 b1!101)))))

(declare-fun b!233773 () Bool)

(assert (=> b!233773 (= e!161130 (array_inv!5045 (buf!5845 b2!99)))))

(declare-fun b!233774 () Bool)

(declare-fun e!161129 () Bool)

(declare-fun e!161131 () Bool)

(assert (=> b!233774 (= e!161129 e!161131)))

(declare-fun res!195564 () Bool)

(assert (=> b!233774 (=> (not res!195564) (not e!161131))))

(declare-fun lt!369574 () (_ BitVec 64))

(assert (=> b!233774 (= res!195564 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5304 (buf!5845 b1!101)))) lt!369574) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233774 (= lt!369574 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10879 b1!101))) ((_ sign_extend 32) (currentBit!10874 b1!101))))))

(declare-fun b!233775 () Bool)

(declare-fun res!195566 () Bool)

(assert (=> b!233775 (=> (not res!195566) (not e!161129))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233775 (= res!195566 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5304 (buf!5845 b1!101))) ((_ sign_extend 32) (currentByte!10879 b1!101)) ((_ sign_extend 32) (currentBit!10874 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!233776 () Bool)

(declare-fun e!161128 () Bool)

(assert (=> b!233776 (= e!161128 e!161129)))

(declare-fun res!195567 () Bool)

(assert (=> b!233776 (=> (not res!195567) (not e!161129))))

(declare-fun lt!369576 () (_ BitVec 32))

(assert (=> b!233776 (= res!195567 (bvsle lt!369576 bytes!19))))

(declare-fun lt!369579 () (_ BitVec 64))

(assert (=> b!233776 (= lt!369576 ((_ extract 31 0) lt!369579))))

(assert (=> b!233776 (= lt!369579 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!233777 () Bool)

(declare-fun res!195565 () Bool)

(declare-fun e!161124 () Bool)

(assert (=> b!233777 (=> (not res!195565) (not e!161124))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233777 (= res!195565 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5304 (buf!5845 b2!99))) ((_ sign_extend 32) (currentByte!10879 b2!99)) ((_ sign_extend 32) (currentBit!10874 b2!99)) (bvsub bytes!19 lt!369576)))))

(declare-fun b!233778 () Bool)

(assert (=> b!233778 (= e!161125 e!161128)))

(declare-fun res!195563 () Bool)

(assert (=> b!233778 (=> (not res!195563) (not e!161128))))

(declare-fun lt!369578 () (_ BitVec 64))

(assert (=> b!233778 (= res!195563 (bvsle bits!86 lt!369578))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233778 (= lt!369578 (bitIndex!0 (size!5304 (buf!5845 b2!99)) (currentByte!10879 b2!99) (currentBit!10874 b2!99)))))

(declare-fun b!233779 () Bool)

(declare-fun res!195562 () Bool)

(assert (=> b!233779 (=> (not res!195562) (not e!161129))))

(assert (=> b!233779 (= res!195562 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5304 (buf!5845 b1!101))) ((_ sign_extend 32) (currentByte!10879 b1!101)) ((_ sign_extend 32) (currentBit!10874 b1!101)) bytes!19))))

(declare-fun b!233780 () Bool)

(assert (=> b!233780 (= e!161124 (bvsge lt!369579 #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun b!233781 () Bool)

(declare-fun res!195561 () Bool)

(assert (=> b!233781 (=> (not res!195561) (not e!161129))))

(assert (=> b!233781 (= res!195561 (= lt!369578 (bvadd (bitIndex!0 (size!5304 (buf!5845 b1!101)) (currentByte!10879 b1!101) (currentBit!10874 b1!101)) bits!86)))))

(declare-fun b!233782 () Bool)

(declare-fun e!161126 () Bool)

(assert (=> b!233782 (= e!161126 e!161124)))

(declare-fun res!195558 () Bool)

(assert (=> b!233782 (=> (not res!195558) (not e!161124))))

(declare-fun lt!369577 () (_ BitVec 64))

(declare-fun lt!369575 () (_ BitVec 64))

(assert (=> b!233782 (= res!195558 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!369575 (bvsub lt!369577 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!369575 lt!369577) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369579))))))

(assert (=> b!233782 (= lt!369575 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5304 (buf!5845 b2!99)))))))

(declare-fun b!233783 () Bool)

(assert (=> b!233783 (= e!161131 e!161126)))

(declare-fun res!195560 () Bool)

(assert (=> b!233783 (=> (not res!195560) (not e!161126))))

(assert (=> b!233783 (= res!195560 (and (= lt!369578 lt!369577) (= (bvsub lt!369578 bits!86) lt!369574)))))

(assert (=> b!233783 (= lt!369577 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10879 b2!99))) ((_ sign_extend 32) (currentBit!10874 b2!99))))))

(assert (= (and start!49198 res!195559) b!233778))

(assert (= (and b!233778 res!195563) b!233776))

(assert (= (and b!233776 res!195567) b!233779))

(assert (= (and b!233779 res!195562) b!233781))

(assert (= (and b!233781 res!195561) b!233775))

(assert (= (and b!233775 res!195566) b!233774))

(assert (= (and b!233774 res!195564) b!233783))

(assert (= (and b!233783 res!195560) b!233782))

(assert (= (and b!233782 res!195558) b!233777))

(assert (= (and b!233777 res!195565) b!233780))

(assert (= start!49198 b!233772))

(assert (= start!49198 b!233773))

(declare-fun m!356237 () Bool)

(assert (=> b!233773 m!356237))

(declare-fun m!356239 () Bool)

(assert (=> b!233777 m!356239))

(declare-fun m!356241 () Bool)

(assert (=> b!233778 m!356241))

(declare-fun m!356243 () Bool)

(assert (=> b!233779 m!356243))

(declare-fun m!356245 () Bool)

(assert (=> b!233781 m!356245))

(declare-fun m!356247 () Bool)

(assert (=> start!49198 m!356247))

(declare-fun m!356249 () Bool)

(assert (=> start!49198 m!356249))

(declare-fun m!356251 () Bool)

(assert (=> b!233772 m!356251))

(declare-fun m!356253 () Bool)

(assert (=> b!233775 m!356253))

(push 1)

(assert (not start!49198))

(assert (not b!233778))

(assert (not b!233772))

(assert (not b!233777))

(assert (not b!233779))

(assert (not b!233775))

(assert (not b!233781))

(assert (not b!233773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78720 () Bool)

(assert (=> d!78720 (= (array_inv!5045 (buf!5845 b2!99)) (bvsge (size!5304 (buf!5845 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!233773 d!78720))

(declare-fun d!78722 () Bool)

(declare-fun e!161143 () Bool)

(assert (=> d!78722 e!161143))

(declare-fun res!195588 () Bool)

(assert (=> d!78722 (=> (not res!195588) (not e!161143))))

(declare-fun lt!369641 () (_ BitVec 64))

(declare-fun lt!369643 () (_ BitVec 64))

(declare-fun lt!369640 () (_ BitVec 64))

(assert (=> d!78722 (= res!195588 (= lt!369643 (bvsub lt!369641 lt!369640)))))

(assert (=> d!78722 (or (= (bvand lt!369641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369640 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369641 lt!369640) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78722 (= lt!369640 (remainingBits!0 ((_ sign_extend 32) (size!5304 (buf!5845 b2!99))) ((_ sign_extend 32) (currentByte!10879 b2!99)) ((_ sign_extend 32) (currentBit!10874 b2!99))))))

(declare-fun lt!369645 () (_ BitVec 64))

(declare-fun lt!369642 () (_ BitVec 64))

(assert (=> d!78722 (= lt!369641 (bvmul lt!369645 lt!369642))))

(assert (=> d!78722 (or (= lt!369645 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369642 (bvsdiv (bvmul lt!369645 lt!369642) lt!369645)))))

(assert (=> d!78722 (= lt!369642 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78722 (= lt!369645 ((_ sign_extend 32) (size!5304 (buf!5845 b2!99))))))

(assert (=> d!78722 (= lt!369643 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10879 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10874 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78722 (invariant!0 (currentBit!10874 b2!99) (currentByte!10879 b2!99) (size!5304 (buf!5845 b2!99)))))

(assert (=> d!78722 (= (bitIndex!0 (size!5304 (buf!5845 b2!99)) (currentByte!10879 b2!99) (currentBit!10874 b2!99)) lt!369643)))

(declare-fun b!233804 () Bool)

(declare-fun res!195589 () Bool)

(assert (=> b!233804 (=> (not res!195589) (not e!161143))))

(assert (=> b!233804 (= res!195589 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369643))))

(declare-fun b!233805 () Bool)

(declare-fun lt!369644 () (_ BitVec 64))

(assert (=> b!233805 (= e!161143 (bvsle lt!369643 (bvmul lt!369644 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233805 (or (= lt!369644 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369644 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369644)))))

(assert (=> b!233805 (= lt!369644 ((_ sign_extend 32) (size!5304 (buf!5845 b2!99))))))

(assert (= (and d!78722 res!195588) b!233804))

(assert (= (and b!233804 res!195589) b!233805))

(declare-fun m!356267 () Bool)

(assert (=> d!78722 m!356267))

(declare-fun m!356269 () Bool)

(assert (=> d!78722 m!356269))

(assert (=> b!233778 d!78722))

(declare-fun d!78724 () Bool)

(assert (=> d!78724 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5304 (buf!5845 b1!101))) ((_ sign_extend 32) (currentByte!10879 b1!101)) ((_ sign_extend 32) (currentBit!10874 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5304 (buf!5845 b1!101))) ((_ sign_extend 32) (currentByte!10879 b1!101)) ((_ sign_extend 32) (currentBit!10874 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19401 () Bool)

(assert (= bs!19401 d!78724))

(assert (=> bs!19401 m!356253))

(assert (=> b!233779 d!78724))

(declare-fun d!78726 () Bool)

(declare-fun e!161144 () Bool)

(assert (=> d!78726 e!161144))

(declare-fun res!195590 () Bool)

(assert (=> d!78726 (=> (not res!195590) (not e!161144))))

(declare-fun lt!369646 () (_ BitVec 64))

(declare-fun lt!369649 () (_ BitVec 64))

(declare-fun lt!369647 () (_ BitVec 64))

(assert (=> d!78726 (= res!195590 (= lt!369649 (bvsub lt!369647 lt!369646)))))

(assert (=> d!78726 (or (= (bvand lt!369647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369646 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369647 lt!369646) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78726 (= lt!369646 (remainingBits!0 ((_ sign_extend 32) (size!5304 (buf!5845 b1!101))) ((_ sign_extend 32) (currentByte!10879 b1!101)) ((_ sign_extend 32) (currentBit!10874 b1!101))))))

(declare-fun lt!369651 () (_ BitVec 64))

(declare-fun lt!369648 () (_ BitVec 64))

(assert (=> d!78726 (= lt!369647 (bvmul lt!369651 lt!369648))))

(assert (=> d!78726 (or (= lt!369651 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369648 (bvsdiv (bvmul lt!369651 lt!369648) lt!369651)))))

(assert (=> d!78726 (= lt!369648 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78726 (= lt!369651 ((_ sign_extend 32) (size!5304 (buf!5845 b1!101))))))

(assert (=> d!78726 (= lt!369649 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10879 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10874 b1!101))))))

(assert (=> d!78726 (invariant!0 (currentBit!10874 b1!101) (currentByte!10879 b1!101) (size!5304 (buf!5845 b1!101)))))

(assert (=> d!78726 (= (bitIndex!0 (size!5304 (buf!5845 b1!101)) (currentByte!10879 b1!101) (currentBit!10874 b1!101)) lt!369649)))

(declare-fun b!233806 () Bool)

(declare-fun res!195591 () Bool)

(assert (=> b!233806 (=> (not res!195591) (not e!161144))))

(assert (=> b!233806 (= res!195591 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369649))))

(declare-fun b!233807 () Bool)

(declare-fun lt!369650 () (_ BitVec 64))

(assert (=> b!233807 (= e!161144 (bvsle lt!369649 (bvmul lt!369650 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233807 (or (= lt!369650 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369650 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369650)))))

(assert (=> b!233807 (= lt!369650 ((_ sign_extend 32) (size!5304 (buf!5845 b1!101))))))

(assert (= (and d!78726 res!195590) b!233806))

(assert (= (and b!233806 res!195591) b!233807))

(assert (=> d!78726 m!356253))

(declare-fun m!356271 () Bool)

(assert (=> d!78726 m!356271))

(assert (=> b!233781 d!78726))

(declare-fun d!78728 () Bool)

(assert (=> d!78728 (= (inv!12 b1!101) (invariant!0 (currentBit!10874 b1!101) (currentByte!10879 b1!101) (size!5304 (buf!5845 b1!101))))))

(declare-fun bs!19402 () Bool)

(assert (= bs!19402 d!78728))

(assert (=> bs!19402 m!356271))

(assert (=> start!49198 d!78728))

(declare-fun d!78730 () Bool)

(assert (=> d!78730 (= (inv!12 b2!99) (invariant!0 (currentBit!10874 b2!99) (currentByte!10879 b2!99) (size!5304 (buf!5845 b2!99))))))

(declare-fun bs!19403 () Bool)

(assert (= bs!19403 d!78730))

(assert (=> bs!19403 m!356269))

(assert (=> start!49198 d!78730))

(declare-fun d!78732 () Bool)

(assert (=> d!78732 (= (remainingBits!0 ((_ sign_extend 32) (size!5304 (buf!5845 b1!101))) ((_ sign_extend 32) (currentByte!10879 b1!101)) ((_ sign_extend 32) (currentBit!10874 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5304 (buf!5845 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10879 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10874 b1!101)))))))

(assert (=> b!233775 d!78732))

(declare-fun d!78734 () Bool)

(assert (=> d!78734 (= (array_inv!5045 (buf!5845 b1!101)) (bvsge (size!5304 (buf!5845 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!233772 d!78734))

(declare-fun d!78736 () Bool)

(assert (=> d!78736 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5304 (buf!5845 b2!99))) ((_ sign_extend 32) (currentByte!10879 b2!99)) ((_ sign_extend 32) (currentBit!10874 b2!99)) (bvsub bytes!19 lt!369576)) (bvsle ((_ sign_extend 32) (bvsub bytes!19 lt!369576)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5304 (buf!5845 b2!99))) ((_ sign_extend 32) (currentByte!10879 b2!99)) ((_ sign_extend 32) (currentBit!10874 b2!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19404 () Bool)

(assert (= bs!19404 d!78736))

(assert (=> bs!19404 m!356267))

(assert (=> b!233777 d!78736))

(push 1)

(assert (not d!78726))

(assert (not d!78730))

(assert (not d!78724))

(assert (not d!78736))

(assert (not d!78728))

(assert (not d!78722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

