; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48510 () Bool)

(assert start!48510)

(declare-fun b!229795 () Bool)

(declare-fun e!157755 () Bool)

(declare-fun e!157752 () Bool)

(assert (=> b!229795 (= e!157755 e!157752)))

(declare-fun res!192634 () Bool)

(assert (=> b!229795 (=> (not res!192634) (not e!157752))))

(declare-fun lt!367638 () (_ BitVec 64))

(declare-datatypes ((array!11699 0))(
  ( (array!11700 (arr!6116 (Array (_ BitVec 32) (_ BitVec 8))) (size!5129 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9354 0))(
  ( (BitStream!9355 (buf!5670 array!11699) (currentByte!10609 (_ BitVec 32)) (currentBit!10604 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9354)

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!229795 (= res!192634 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5129 (buf!5670 b1!101)))) lt!367638) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229795 (= lt!367638 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10609 b1!101))) ((_ sign_extend 32) (currentBit!10604 b1!101))))))

(declare-fun b!229796 () Bool)

(declare-fun res!192632 () Bool)

(assert (=> b!229796 (=> (not res!192632) (not e!157755))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229796 (= res!192632 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5129 (buf!5670 b1!101))) ((_ sign_extend 32) (currentByte!10609 b1!101)) ((_ sign_extend 32) (currentBit!10604 b1!101)) bytes!19))))

(declare-fun b!229797 () Bool)

(declare-fun e!157748 () Bool)

(declare-fun b2!99 () BitStream!9354)

(declare-fun array_inv!4870 (array!11699) Bool)

(assert (=> b!229797 (= e!157748 (array_inv!4870 (buf!5670 b2!99)))))

(declare-fun b!229798 () Bool)

(declare-fun e!157749 () Bool)

(assert (=> b!229798 (= e!157749 (array_inv!4870 (buf!5670 b1!101)))))

(declare-fun b!229799 () Bool)

(declare-fun e!157753 () Bool)

(declare-fun e!157750 () Bool)

(assert (=> b!229799 (= e!157753 e!157750)))

(declare-fun res!192635 () Bool)

(assert (=> b!229799 (=> (not res!192635) (not e!157750))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367634 () (_ BitVec 64))

(assert (=> b!229799 (= res!192635 (bvsle bits!86 lt!367634))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229799 (= lt!367634 (bitIndex!0 (size!5129 (buf!5670 b2!99)) (currentByte!10609 b2!99) (currentBit!10604 b2!99)))))

(declare-fun b!229800 () Bool)

(declare-fun res!192631 () Bool)

(assert (=> b!229800 (=> (not res!192631) (not e!157755))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!229800 (= res!192631 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5129 (buf!5670 b1!101))) ((_ sign_extend 32) (currentByte!10609 b1!101)) ((_ sign_extend 32) (currentBit!10604 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!229801 () Bool)

(declare-fun e!157756 () Bool)

(assert (=> b!229801 (= e!157752 e!157756)))

(declare-fun res!192633 () Bool)

(assert (=> b!229801 (=> (not res!192633) (not e!157756))))

(declare-fun lt!367637 () (_ BitVec 64))

(assert (=> b!229801 (= res!192633 (and (= lt!367634 lt!367637) (= (bvsub lt!367634 bits!86) lt!367638)))))

(assert (=> b!229801 (= lt!367637 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10609 b2!99))) ((_ sign_extend 32) (currentBit!10604 b2!99))))))

(declare-fun res!192636 () Bool)

(assert (=> start!48510 (=> (not res!192636) (not e!157753))))

(assert (=> start!48510 (= res!192636 (and (= (size!5129 (buf!5670 b1!101)) (size!5129 (buf!5670 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48510 e!157753))

(declare-fun inv!12 (BitStream!9354) Bool)

(assert (=> start!48510 (and (inv!12 b1!101) e!157749)))

(assert (=> start!48510 (and (inv!12 b2!99) e!157748)))

(assert (=> start!48510 true))

(declare-fun b!229802 () Bool)

(declare-fun e!157754 () Bool)

(assert (=> b!229802 (= e!157756 e!157754)))

(declare-fun res!192638 () Bool)

(assert (=> b!229802 (=> (not res!192638) (not e!157754))))

(declare-fun lt!367636 () (_ BitVec 64))

(declare-fun lt!367635 () (_ BitVec 64))

(assert (=> b!229802 (= res!192638 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!367636 (bvsub lt!367637 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!367636 lt!367637) #b0000000000000000000000000000000000000000000000000000000000001000) lt!367635)) (bvsle ((_ sign_extend 32) (size!5129 (buf!5670 b2!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10609 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10604 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5129 (buf!5670 b2!99))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!10609 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!10604 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!229802 (= lt!367636 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5129 (buf!5670 b2!99)))))))

(declare-fun b!229803 () Bool)

(assert (=> b!229803 (= e!157750 e!157755)))

(declare-fun res!192639 () Bool)

(assert (=> b!229803 (=> (not res!192639) (not e!157755))))

(assert (=> b!229803 (= res!192639 (bvsle ((_ extract 31 0) lt!367635) bytes!19))))

(assert (=> b!229803 (= lt!367635 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!229804 () Bool)

(declare-fun res!192637 () Bool)

(assert (=> b!229804 (=> (not res!192637) (not e!157755))))

(assert (=> b!229804 (= res!192637 (= lt!367634 (bvadd (bitIndex!0 (size!5129 (buf!5670 b1!101)) (currentByte!10609 b1!101) (currentBit!10604 b1!101)) bits!86)))))

(declare-fun b!229805 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229805 (= e!157754 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10604 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10609 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!5129 (buf!5670 b2!99)))))))))

(assert (= (and start!48510 res!192636) b!229799))

(assert (= (and b!229799 res!192635) b!229803))

(assert (= (and b!229803 res!192639) b!229796))

(assert (= (and b!229796 res!192632) b!229804))

(assert (= (and b!229804 res!192637) b!229800))

(assert (= (and b!229800 res!192631) b!229795))

(assert (= (and b!229795 res!192634) b!229801))

(assert (= (and b!229801 res!192633) b!229802))

(assert (= (and b!229802 res!192638) b!229805))

(assert (= start!48510 b!229798))

(assert (= start!48510 b!229797))

(declare-fun m!353359 () Bool)

(assert (=> start!48510 m!353359))

(declare-fun m!353361 () Bool)

(assert (=> start!48510 m!353361))

(declare-fun m!353363 () Bool)

(assert (=> b!229797 m!353363))

(declare-fun m!353365 () Bool)

(assert (=> b!229804 m!353365))

(declare-fun m!353367 () Bool)

(assert (=> b!229805 m!353367))

(declare-fun m!353369 () Bool)

(assert (=> b!229798 m!353369))

(declare-fun m!353371 () Bool)

(assert (=> b!229800 m!353371))

(declare-fun m!353373 () Bool)

(assert (=> b!229796 m!353373))

(declare-fun m!353375 () Bool)

(assert (=> b!229799 m!353375))

(check-sat (not b!229804) (not start!48510) (not b!229797) (not b!229798) (not b!229805) (not b!229800) (not b!229799) (not b!229796))
(check-sat)
(get-model)

(declare-fun d!78010 () Bool)

(assert (=> d!78010 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5129 (buf!5670 b1!101))) ((_ sign_extend 32) (currentByte!10609 b1!101)) ((_ sign_extend 32) (currentBit!10604 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5129 (buf!5670 b1!101))) ((_ sign_extend 32) (currentByte!10609 b1!101)) ((_ sign_extend 32) (currentBit!10604 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19110 () Bool)

(assert (= bs!19110 d!78010))

(assert (=> bs!19110 m!353371))

(assert (=> b!229796 d!78010))

(declare-fun d!78012 () Bool)

(assert (=> d!78012 (= (array_inv!4870 (buf!5670 b1!101)) (bvsge (size!5129 (buf!5670 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!229798 d!78012))

(declare-fun d!78014 () Bool)

(assert (=> d!78014 (= (inv!12 b1!101) (invariant!0 (currentBit!10604 b1!101) (currentByte!10609 b1!101) (size!5129 (buf!5670 b1!101))))))

(declare-fun bs!19111 () Bool)

(assert (= bs!19111 d!78014))

(declare-fun m!353395 () Bool)

(assert (=> bs!19111 m!353395))

(assert (=> start!48510 d!78014))

(declare-fun d!78016 () Bool)

(assert (=> d!78016 (= (inv!12 b2!99) (invariant!0 (currentBit!10604 b2!99) (currentByte!10609 b2!99) (size!5129 (buf!5670 b2!99))))))

(declare-fun bs!19112 () Bool)

(assert (= bs!19112 d!78016))

(declare-fun m!353397 () Bool)

(assert (=> bs!19112 m!353397))

(assert (=> start!48510 d!78016))

(declare-fun d!78018 () Bool)

(assert (=> d!78018 (= (array_inv!4870 (buf!5670 b2!99)) (bvsge (size!5129 (buf!5670 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!229797 d!78018))

(declare-fun d!78020 () Bool)

(declare-fun e!157790 () Bool)

(assert (=> d!78020 e!157790))

(declare-fun res!192672 () Bool)

(assert (=> d!78020 (=> (not res!192672) (not e!157790))))

(declare-fun lt!367666 () (_ BitVec 64))

(declare-fun lt!367671 () (_ BitVec 64))

(declare-fun lt!367670 () (_ BitVec 64))

(assert (=> d!78020 (= res!192672 (= lt!367671 (bvsub lt!367670 lt!367666)))))

(assert (=> d!78020 (or (= (bvand lt!367670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367666 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367670 lt!367666) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78020 (= lt!367666 (remainingBits!0 ((_ sign_extend 32) (size!5129 (buf!5670 b2!99))) ((_ sign_extend 32) (currentByte!10609 b2!99)) ((_ sign_extend 32) (currentBit!10604 b2!99))))))

(declare-fun lt!367669 () (_ BitVec 64))

(declare-fun lt!367667 () (_ BitVec 64))

(assert (=> d!78020 (= lt!367670 (bvmul lt!367669 lt!367667))))

(assert (=> d!78020 (or (= lt!367669 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367667 (bvsdiv (bvmul lt!367669 lt!367667) lt!367669)))))

(assert (=> d!78020 (= lt!367667 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78020 (= lt!367669 ((_ sign_extend 32) (size!5129 (buf!5670 b2!99))))))

(assert (=> d!78020 (= lt!367671 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10609 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10604 b2!99))))))

(assert (=> d!78020 (invariant!0 (currentBit!10604 b2!99) (currentByte!10609 b2!99) (size!5129 (buf!5670 b2!99)))))

(assert (=> d!78020 (= (bitIndex!0 (size!5129 (buf!5670 b2!99)) (currentByte!10609 b2!99) (currentBit!10604 b2!99)) lt!367671)))

(declare-fun b!229843 () Bool)

(declare-fun res!192671 () Bool)

(assert (=> b!229843 (=> (not res!192671) (not e!157790))))

(assert (=> b!229843 (= res!192671 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367671))))

(declare-fun b!229844 () Bool)

(declare-fun lt!367668 () (_ BitVec 64))

(assert (=> b!229844 (= e!157790 (bvsle lt!367671 (bvmul lt!367668 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229844 (or (= lt!367668 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367668 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367668)))))

(assert (=> b!229844 (= lt!367668 ((_ sign_extend 32) (size!5129 (buf!5670 b2!99))))))

(assert (= (and d!78020 res!192672) b!229843))

(assert (= (and b!229843 res!192671) b!229844))

(declare-fun m!353399 () Bool)

(assert (=> d!78020 m!353399))

(assert (=> d!78020 m!353397))

(assert (=> b!229799 d!78020))

(declare-fun d!78022 () Bool)

(declare-fun e!157791 () Bool)

(assert (=> d!78022 e!157791))

(declare-fun res!192674 () Bool)

(assert (=> d!78022 (=> (not res!192674) (not e!157791))))

(declare-fun lt!367676 () (_ BitVec 64))

(declare-fun lt!367677 () (_ BitVec 64))

(declare-fun lt!367672 () (_ BitVec 64))

(assert (=> d!78022 (= res!192674 (= lt!367677 (bvsub lt!367676 lt!367672)))))

(assert (=> d!78022 (or (= (bvand lt!367676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367672 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367676 lt!367672) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78022 (= lt!367672 (remainingBits!0 ((_ sign_extend 32) (size!5129 (buf!5670 b1!101))) ((_ sign_extend 32) (currentByte!10609 b1!101)) ((_ sign_extend 32) (currentBit!10604 b1!101))))))

(declare-fun lt!367675 () (_ BitVec 64))

(declare-fun lt!367673 () (_ BitVec 64))

(assert (=> d!78022 (= lt!367676 (bvmul lt!367675 lt!367673))))

(assert (=> d!78022 (or (= lt!367675 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367673 (bvsdiv (bvmul lt!367675 lt!367673) lt!367675)))))

(assert (=> d!78022 (= lt!367673 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78022 (= lt!367675 ((_ sign_extend 32) (size!5129 (buf!5670 b1!101))))))

(assert (=> d!78022 (= lt!367677 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10609 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10604 b1!101))))))

(assert (=> d!78022 (invariant!0 (currentBit!10604 b1!101) (currentByte!10609 b1!101) (size!5129 (buf!5670 b1!101)))))

(assert (=> d!78022 (= (bitIndex!0 (size!5129 (buf!5670 b1!101)) (currentByte!10609 b1!101) (currentBit!10604 b1!101)) lt!367677)))

(declare-fun b!229845 () Bool)

(declare-fun res!192673 () Bool)

(assert (=> b!229845 (=> (not res!192673) (not e!157791))))

(assert (=> b!229845 (= res!192673 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367677))))

(declare-fun b!229846 () Bool)

(declare-fun lt!367674 () (_ BitVec 64))

(assert (=> b!229846 (= e!157791 (bvsle lt!367677 (bvmul lt!367674 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229846 (or (= lt!367674 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367674 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367674)))))

(assert (=> b!229846 (= lt!367674 ((_ sign_extend 32) (size!5129 (buf!5670 b1!101))))))

(assert (= (and d!78022 res!192674) b!229845))

(assert (= (and b!229845 res!192673) b!229846))

(assert (=> d!78022 m!353371))

(assert (=> d!78022 m!353395))

(assert (=> b!229804 d!78022))

(declare-fun d!78024 () Bool)

(assert (=> d!78024 (= (remainingBits!0 ((_ sign_extend 32) (size!5129 (buf!5670 b1!101))) ((_ sign_extend 32) (currentByte!10609 b1!101)) ((_ sign_extend 32) (currentBit!10604 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5129 (buf!5670 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10609 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10604 b1!101)))))))

(assert (=> b!229800 d!78024))

(declare-fun d!78026 () Bool)

(assert (=> d!78026 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10604 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10609 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!5129 (buf!5670 b2!99))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10604 b2!99))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10604 b2!99))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10609 b2!99))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10609 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!5129 (buf!5670 b2!99))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10604 b2!99))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10609 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!5129 (buf!5670 b2!99)))))))))))

(assert (=> b!229805 d!78026))

(check-sat (not d!78016) (not d!78014) (not d!78010) (not d!78022) (not d!78020))
