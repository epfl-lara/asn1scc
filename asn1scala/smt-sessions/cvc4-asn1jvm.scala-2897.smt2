; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69392 () Bool)

(assert start!69392)

(declare-fun b!312070 () Bool)

(declare-fun e!224417 () Bool)

(declare-datatypes ((array!19094 0))(
  ( (array!19095 (arr!9360 (Array (_ BitVec 32) (_ BitVec 8))) (size!8280 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13664 0))(
  ( (BitStream!13665 (buf!7893 array!19094) (currentByte!14579 (_ BitVec 32)) (currentBit!14574 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13664)

(declare-fun array_inv!7832 (array!19094) Bool)

(assert (=> b!312070 (= e!224417 (array_inv!7832 (buf!7893 b1!97)))))

(declare-fun b!312072 () Bool)

(declare-fun res!255626 () Bool)

(declare-fun e!224418 () Bool)

(assert (=> b!312072 (=> (not res!255626) (not e!224418))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312072 (= res!255626 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8280 (buf!7893 b1!97))) ((_ sign_extend 32) (currentByte!14579 b1!97)) ((_ sign_extend 32) (currentBit!14574 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312073 () Bool)

(declare-fun res!255628 () Bool)

(assert (=> b!312073 (=> (not res!255628) (not e!224418))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13664)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312073 (= res!255628 (bvsle (bitIndex!0 (size!8280 (buf!7893 b2!97)) (currentByte!14579 b2!97) (currentBit!14574 b2!97)) (bvadd (bitIndex!0 (size!8280 (buf!7893 b1!97)) (currentByte!14579 b1!97) (currentBit!14574 b1!97)) advancedAtMostBits!9)))))

(declare-fun res!255629 () Bool)

(assert (=> start!69392 (=> (not res!255629) (not e!224418))))

(assert (=> start!69392 (= res!255629 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8280 (buf!7893 b1!97)) (size!8280 (buf!7893 b2!97)))))))

(assert (=> start!69392 e!224418))

(assert (=> start!69392 true))

(declare-fun inv!12 (BitStream!13664) Bool)

(assert (=> start!69392 (and (inv!12 b1!97) e!224417)))

(declare-fun e!224419 () Bool)

(assert (=> start!69392 (and (inv!12 b2!97) e!224419)))

(declare-fun b!312071 () Bool)

(assert (=> b!312071 (= e!224419 (array_inv!7832 (buf!7893 b2!97)))))

(declare-fun b!312074 () Bool)

(declare-fun res!255627 () Bool)

(assert (=> b!312074 (=> (not res!255627) (not e!224418))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312074 (= res!255627 (validate_offset_bits!1 ((_ sign_extend 32) (size!8280 (buf!7893 b1!97))) ((_ sign_extend 32) (currentByte!14579 b1!97)) ((_ sign_extend 32) (currentBit!14574 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312075 () Bool)

(assert (=> b!312075 (= e!224418 (bvslt (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8280 (buf!7893 b1!97)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14579 b1!97))) ((_ sign_extend 32) (currentBit!14574 b1!97)))) b1ValidateOffsetBits!10))))

(assert (= (and start!69392 res!255629) b!312074))

(assert (= (and b!312074 res!255627) b!312073))

(assert (= (and b!312073 res!255628) b!312072))

(assert (= (and b!312072 res!255626) b!312075))

(assert (= start!69392 b!312070))

(assert (= start!69392 b!312071))

(declare-fun m!449797 () Bool)

(assert (=> b!312073 m!449797))

(declare-fun m!449799 () Bool)

(assert (=> b!312073 m!449799))

(declare-fun m!449801 () Bool)

(assert (=> b!312074 m!449801))

(declare-fun m!449803 () Bool)

(assert (=> b!312072 m!449803))

(declare-fun m!449805 () Bool)

(assert (=> start!69392 m!449805))

(declare-fun m!449807 () Bool)

(assert (=> start!69392 m!449807))

(declare-fun m!449809 () Bool)

(assert (=> b!312071 m!449809))

(declare-fun m!449811 () Bool)

(assert (=> b!312070 m!449811))

(push 1)

(assert (not start!69392))

(assert (not b!312070))

(assert (not b!312072))

(assert (not b!312073))

(assert (not b!312071))

(assert (not b!312074))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103598 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103598 (= (inv!12 b1!97) (invariant!0 (currentBit!14574 b1!97) (currentByte!14579 b1!97) (size!8280 (buf!7893 b1!97))))))

(declare-fun bs!26806 () Bool)

(assert (= bs!26806 d!103598))

(declare-fun m!449825 () Bool)

(assert (=> bs!26806 m!449825))

(assert (=> start!69392 d!103598))

(declare-fun d!103604 () Bool)

(assert (=> d!103604 (= (inv!12 b2!97) (invariant!0 (currentBit!14574 b2!97) (currentByte!14579 b2!97) (size!8280 (buf!7893 b2!97))))))

(declare-fun bs!26807 () Bool)

(assert (= bs!26807 d!103604))

(declare-fun m!449827 () Bool)

(assert (=> bs!26807 m!449827))

(assert (=> start!69392 d!103604))

(declare-fun d!103606 () Bool)

(declare-fun e!224430 () Bool)

(assert (=> d!103606 e!224430))

(declare-fun res!255651 () Bool)

(assert (=> d!103606 (=> (not res!255651) (not e!224430))))

(declare-fun lt!441700 () (_ BitVec 64))

(declare-fun lt!441704 () (_ BitVec 64))

(declare-fun lt!441702 () (_ BitVec 64))

(assert (=> d!103606 (= res!255651 (= lt!441704 (bvsub lt!441702 lt!441700)))))

(assert (=> d!103606 (or (= (bvand lt!441702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441700 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441702 lt!441700) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103606 (= lt!441700 (remainingBits!0 ((_ sign_extend 32) (size!8280 (buf!7893 b2!97))) ((_ sign_extend 32) (currentByte!14579 b2!97)) ((_ sign_extend 32) (currentBit!14574 b2!97))))))

(declare-fun lt!441701 () (_ BitVec 64))

(declare-fun lt!441699 () (_ BitVec 64))

(assert (=> d!103606 (= lt!441702 (bvmul lt!441701 lt!441699))))

(assert (=> d!103606 (or (= lt!441701 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441699 (bvsdiv (bvmul lt!441701 lt!441699) lt!441701)))))

(assert (=> d!103606 (= lt!441699 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103606 (= lt!441701 ((_ sign_extend 32) (size!8280 (buf!7893 b2!97))))))

(assert (=> d!103606 (= lt!441704 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14579 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14574 b2!97))))))

(assert (=> d!103606 (invariant!0 (currentBit!14574 b2!97) (currentByte!14579 b2!97) (size!8280 (buf!7893 b2!97)))))

(assert (=> d!103606 (= (bitIndex!0 (size!8280 (buf!7893 b2!97)) (currentByte!14579 b2!97) (currentBit!14574 b2!97)) lt!441704)))

(declare-fun b!312096 () Bool)

(declare-fun res!255650 () Bool)

(assert (=> b!312096 (=> (not res!255650) (not e!224430))))

(assert (=> b!312096 (= res!255650 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441704))))

(declare-fun b!312097 () Bool)

(declare-fun lt!441703 () (_ BitVec 64))

(assert (=> b!312097 (= e!224430 (bvsle lt!441704 (bvmul lt!441703 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312097 (or (= lt!441703 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441703 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441703)))))

(assert (=> b!312097 (= lt!441703 ((_ sign_extend 32) (size!8280 (buf!7893 b2!97))))))

(assert (= (and d!103606 res!255651) b!312096))

(assert (= (and b!312096 res!255650) b!312097))

(declare-fun m!449829 () Bool)

(assert (=> d!103606 m!449829))

(assert (=> d!103606 m!449827))

(assert (=> b!312073 d!103606))

(declare-fun d!103610 () Bool)

(declare-fun e!224431 () Bool)

(assert (=> d!103610 e!224431))

(declare-fun res!255653 () Bool)

(assert (=> d!103610 (=> (not res!255653) (not e!224431))))

(declare-fun lt!441708 () (_ BitVec 64))

(declare-fun lt!441710 () (_ BitVec 64))

(declare-fun lt!441706 () (_ BitVec 64))

(assert (=> d!103610 (= res!255653 (= lt!441710 (bvsub lt!441708 lt!441706)))))

(assert (=> d!103610 (or (= (bvand lt!441708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441706 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441708 lt!441706) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103610 (= lt!441706 (remainingBits!0 ((_ sign_extend 32) (size!8280 (buf!7893 b1!97))) ((_ sign_extend 32) (currentByte!14579 b1!97)) ((_ sign_extend 32) (currentBit!14574 b1!97))))))

(declare-fun lt!441707 () (_ BitVec 64))

(declare-fun lt!441705 () (_ BitVec 64))

(assert (=> d!103610 (= lt!441708 (bvmul lt!441707 lt!441705))))

(assert (=> d!103610 (or (= lt!441707 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441705 (bvsdiv (bvmul lt!441707 lt!441705) lt!441707)))))

(assert (=> d!103610 (= lt!441705 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103610 (= lt!441707 ((_ sign_extend 32) (size!8280 (buf!7893 b1!97))))))

(assert (=> d!103610 (= lt!441710 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14579 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14574 b1!97))))))

(assert (=> d!103610 (invariant!0 (currentBit!14574 b1!97) (currentByte!14579 b1!97) (size!8280 (buf!7893 b1!97)))))

(assert (=> d!103610 (= (bitIndex!0 (size!8280 (buf!7893 b1!97)) (currentByte!14579 b1!97) (currentBit!14574 b1!97)) lt!441710)))

(declare-fun b!312098 () Bool)

(declare-fun res!255652 () Bool)

(assert (=> b!312098 (=> (not res!255652) (not e!224431))))

(assert (=> b!312098 (= res!255652 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441710))))

(declare-fun b!312099 () Bool)

(declare-fun lt!441709 () (_ BitVec 64))

(assert (=> b!312099 (= e!224431 (bvsle lt!441710 (bvmul lt!441709 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312099 (or (= lt!441709 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441709 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441709)))))

(assert (=> b!312099 (= lt!441709 ((_ sign_extend 32) (size!8280 (buf!7893 b1!97))))))

(assert (= (and d!103610 res!255653) b!312098))

(assert (= (and b!312098 res!255652) b!312099))

(assert (=> d!103610 m!449803))

(assert (=> d!103610 m!449825))

(assert (=> b!312073 d!103610))

(declare-fun d!103612 () Bool)

(assert (=> d!103612 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8280 (buf!7893 b1!97))) ((_ sign_extend 32) (currentByte!14579 b1!97)) ((_ sign_extend 32) (currentBit!14574 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8280 (buf!7893 b1!97))) ((_ sign_extend 32) (currentByte!14579 b1!97)) ((_ sign_extend 32) (currentBit!14574 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26809 () Bool)

(assert (= bs!26809 d!103612))

(assert (=> bs!26809 m!449803))

(assert (=> b!312074 d!103612))

(declare-fun d!103614 () Bool)

(assert (=> d!103614 (= (array_inv!7832 (buf!7893 b1!97)) (bvsge (size!8280 (buf!7893 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!312070 d!103614))

(declare-fun d!103616 () Bool)

(assert (=> d!103616 (= (array_inv!7832 (buf!7893 b2!97)) (bvsge (size!8280 (buf!7893 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!312071 d!103616))

(declare-fun d!103618 () Bool)

(assert (=> d!103618 (= (remainingBits!0 ((_ sign_extend 32) (size!8280 (buf!7893 b1!97))) ((_ sign_extend 32) (currentByte!14579 b1!97)) ((_ sign_extend 32) (currentBit!14574 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8280 (buf!7893 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14579 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14574 b1!97)))))))

(assert (=> b!312072 d!103618))

(push 1)

(assert (not d!103610))

(assert (not d!103604))

(assert (not d!103598))

(assert (not d!103612))

(assert (not d!103606))

(check-sat)

(pop 1)

(push 1)

(check-sat)

