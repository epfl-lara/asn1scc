; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48646 () Bool)

(assert start!48646)

(declare-fun b!230460 () Bool)

(declare-fun e!158285 () Bool)

(declare-datatypes ((array!11751 0))(
  ( (array!11752 (arr!6138 (Array (_ BitVec 32) (_ BitVec 8))) (size!5151 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9398 0))(
  ( (BitStream!9399 (buf!5692 array!11751) (currentByte!10661 (_ BitVec 32)) (currentBit!10656 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9398)

(declare-fun array_inv!4892 (array!11751) Bool)

(assert (=> b!230460 (= e!158285 (array_inv!4892 (buf!5692 b2!99)))))

(declare-fun b!230461 () Bool)

(declare-fun e!158290 () Bool)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b1!101 () BitStream!9398)

(assert (=> b!230461 (= e!158290 (bvsgt ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5151 (buf!5692 b1!101)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10661 b1!101))) ((_ sign_extend 32) (currentBit!10656 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!193167 () Bool)

(declare-fun e!158288 () Bool)

(assert (=> start!48646 (=> (not res!193167) (not e!158288))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> start!48646 (= res!193167 (and (= (size!5151 (buf!5692 b1!101)) (size!5151 (buf!5692 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48646 e!158288))

(declare-fun e!158286 () Bool)

(declare-fun inv!12 (BitStream!9398) Bool)

(assert (=> start!48646 (and (inv!12 b1!101) e!158286)))

(assert (=> start!48646 (and (inv!12 b2!99) e!158285)))

(assert (=> start!48646 true))

(declare-fun b!230462 () Bool)

(declare-fun res!193165 () Bool)

(assert (=> b!230462 (=> (not res!193165) (not e!158290))))

(declare-fun lt!368061 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230462 (= res!193165 (= lt!368061 (bvadd (bitIndex!0 (size!5151 (buf!5692 b1!101)) (currentByte!10661 b1!101) (currentBit!10656 b1!101)) bits!86)))))

(declare-fun b!230463 () Bool)

(declare-fun res!193164 () Bool)

(assert (=> b!230463 (=> (not res!193164) (not e!158290))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230463 (= res!193164 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5151 (buf!5692 b1!101))) ((_ sign_extend 32) (currentByte!10661 b1!101)) ((_ sign_extend 32) (currentBit!10656 b1!101)) bytes!19))))

(declare-fun b!230464 () Bool)

(assert (=> b!230464 (= e!158288 e!158290)))

(declare-fun res!193166 () Bool)

(assert (=> b!230464 (=> (not res!193166) (not e!158290))))

(assert (=> b!230464 (= res!193166 (and (bvsle bits!86 lt!368061) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!230464 (= lt!368061 (bitIndex!0 (size!5151 (buf!5692 b2!99)) (currentByte!10661 b2!99) (currentBit!10656 b2!99)))))

(declare-fun b!230465 () Bool)

(assert (=> b!230465 (= e!158286 (array_inv!4892 (buf!5692 b1!101)))))

(declare-fun b!230466 () Bool)

(declare-fun res!193168 () Bool)

(assert (=> b!230466 (=> (not res!193168) (not e!158290))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230466 (= res!193168 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5151 (buf!5692 b1!101))) ((_ sign_extend 32) (currentByte!10661 b1!101)) ((_ sign_extend 32) (currentBit!10656 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!48646 res!193167) b!230464))

(assert (= (and b!230464 res!193166) b!230463))

(assert (= (and b!230463 res!193164) b!230462))

(assert (= (and b!230462 res!193165) b!230466))

(assert (= (and b!230466 res!193168) b!230461))

(assert (= start!48646 b!230465))

(assert (= start!48646 b!230460))

(declare-fun m!353775 () Bool)

(assert (=> b!230463 m!353775))

(declare-fun m!353777 () Bool)

(assert (=> b!230465 m!353777))

(declare-fun m!353779 () Bool)

(assert (=> start!48646 m!353779))

(declare-fun m!353781 () Bool)

(assert (=> start!48646 m!353781))

(declare-fun m!353783 () Bool)

(assert (=> b!230462 m!353783))

(declare-fun m!353785 () Bool)

(assert (=> b!230460 m!353785))

(declare-fun m!353787 () Bool)

(assert (=> b!230466 m!353787))

(declare-fun m!353789 () Bool)

(assert (=> b!230464 m!353789))

(push 1)

(assert (not b!230465))

(assert (not b!230462))

(assert (not b!230464))

(assert (not b!230460))

(assert (not b!230466))

(assert (not start!48646))

(assert (not b!230463))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78208 () Bool)

(assert (=> d!78208 (= (array_inv!4892 (buf!5692 b1!101)) (bvsge (size!5151 (buf!5692 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230465 d!78208))

(declare-fun d!78210 () Bool)

(assert (=> d!78210 (= (array_inv!4892 (buf!5692 b2!99)) (bvsge (size!5151 (buf!5692 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230460 d!78210))

(declare-fun d!78212 () Bool)

(assert (=> d!78212 (= (remainingBits!0 ((_ sign_extend 32) (size!5151 (buf!5692 b1!101))) ((_ sign_extend 32) (currentByte!10661 b1!101)) ((_ sign_extend 32) (currentBit!10656 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5151 (buf!5692 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10661 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10656 b1!101)))))))

(assert (=> b!230466 d!78212))

(declare-fun d!78214 () Bool)

(declare-fun e!158301 () Bool)

(assert (=> d!78214 e!158301))

(declare-fun res!193190 () Bool)

(assert (=> d!78214 (=> (not res!193190) (not e!158301))))

(declare-fun lt!368123 () (_ BitVec 64))

(declare-fun lt!368127 () (_ BitVec 64))

(declare-fun lt!368126 () (_ BitVec 64))

(assert (=> d!78214 (= res!193190 (= lt!368123 (bvsub lt!368127 lt!368126)))))

(assert (=> d!78214 (or (= (bvand lt!368127 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368126 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368127 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368127 lt!368126) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78214 (= lt!368126 (remainingBits!0 ((_ sign_extend 32) (size!5151 (buf!5692 b1!101))) ((_ sign_extend 32) (currentByte!10661 b1!101)) ((_ sign_extend 32) (currentBit!10656 b1!101))))))

(declare-fun lt!368125 () (_ BitVec 64))

(declare-fun lt!368124 () (_ BitVec 64))

(assert (=> d!78214 (= lt!368127 (bvmul lt!368125 lt!368124))))

(assert (=> d!78214 (or (= lt!368125 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368124 (bvsdiv (bvmul lt!368125 lt!368124) lt!368125)))))

(assert (=> d!78214 (= lt!368124 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78214 (= lt!368125 ((_ sign_extend 32) (size!5151 (buf!5692 b1!101))))))

(assert (=> d!78214 (= lt!368123 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10661 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10656 b1!101))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78214 (invariant!0 (currentBit!10656 b1!101) (currentByte!10661 b1!101) (size!5151 (buf!5692 b1!101)))))

(assert (=> d!78214 (= (bitIndex!0 (size!5151 (buf!5692 b1!101)) (currentByte!10661 b1!101) (currentBit!10656 b1!101)) lt!368123)))

(declare-fun b!230487 () Bool)

(declare-fun res!193189 () Bool)

(assert (=> b!230487 (=> (not res!193189) (not e!158301))))

(assert (=> b!230487 (= res!193189 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368123))))

(declare-fun b!230488 () Bool)

(declare-fun lt!368122 () (_ BitVec 64))

(assert (=> b!230488 (= e!158301 (bvsle lt!368123 (bvmul lt!368122 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230488 (or (= lt!368122 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368122 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368122)))))

(assert (=> b!230488 (= lt!368122 ((_ sign_extend 32) (size!5151 (buf!5692 b1!101))))))

(assert (= (and d!78214 res!193190) b!230487))

(assert (= (and b!230487 res!193189) b!230488))

(assert (=> d!78214 m!353787))

(declare-fun m!353803 () Bool)

(assert (=> d!78214 m!353803))

(assert (=> b!230462 d!78214))

(declare-fun d!78216 () Bool)

(assert (=> d!78216 (= (inv!12 b1!101) (invariant!0 (currentBit!10656 b1!101) (currentByte!10661 b1!101) (size!5151 (buf!5692 b1!101))))))

(declare-fun bs!19165 () Bool)

(assert (= bs!19165 d!78216))

(assert (=> bs!19165 m!353803))

(assert (=> start!48646 d!78216))

(declare-fun d!78218 () Bool)

(assert (=> d!78218 (= (inv!12 b2!99) (invariant!0 (currentBit!10656 b2!99) (currentByte!10661 b2!99) (size!5151 (buf!5692 b2!99))))))

(declare-fun bs!19166 () Bool)

(assert (= bs!19166 d!78218))

(declare-fun m!353805 () Bool)

(assert (=> bs!19166 m!353805))

(assert (=> start!48646 d!78218))

(declare-fun d!78220 () Bool)

(assert (=> d!78220 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5151 (buf!5692 b1!101))) ((_ sign_extend 32) (currentByte!10661 b1!101)) ((_ sign_extend 32) (currentBit!10656 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5151 (buf!5692 b1!101))) ((_ sign_extend 32) (currentByte!10661 b1!101)) ((_ sign_extend 32) (currentBit!10656 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19167 () Bool)

(assert (= bs!19167 d!78220))

(assert (=> bs!19167 m!353787))

(assert (=> b!230463 d!78220))

(declare-fun d!78222 () Bool)

(declare-fun e!158302 () Bool)

(assert (=> d!78222 e!158302))

(declare-fun res!193192 () Bool)

(assert (=> d!78222 (=> (not res!193192) (not e!158302))))

(declare-fun lt!368132 () (_ BitVec 64))

(declare-fun lt!368133 () (_ BitVec 64))

(declare-fun lt!368129 () (_ BitVec 64))

(assert (=> d!78222 (= res!193192 (= lt!368129 (bvsub lt!368133 lt!368132)))))

(assert (=> d!78222 (or (= (bvand lt!368133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368132 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368133 lt!368132) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78222 (= lt!368132 (remainingBits!0 ((_ sign_extend 32) (size!5151 (buf!5692 b2!99))) ((_ sign_extend 32) (currentByte!10661 b2!99)) ((_ sign_extend 32) (currentBit!10656 b2!99))))))

(declare-fun lt!368131 () (_ BitVec 64))

(declare-fun lt!368130 () (_ BitVec 64))

(assert (=> d!78222 (= lt!368133 (bvmul lt!368131 lt!368130))))

(assert (=> d!78222 (or (= lt!368131 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368130 (bvsdiv (bvmul lt!368131 lt!368130) lt!368131)))))

(assert (=> d!78222 (= lt!368130 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78222 (= lt!368131 ((_ sign_extend 32) (size!5151 (buf!5692 b2!99))))))

(assert (=> d!78222 (= lt!368129 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10661 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10656 b2!99))))))

(assert (=> d!78222 (invariant!0 (currentBit!10656 b2!99) (currentByte!10661 b2!99) (size!5151 (buf!5692 b2!99)))))

(assert (=> d!78222 (= (bitIndex!0 (size!5151 (buf!5692 b2!99)) (currentByte!10661 b2!99) (currentBit!10656 b2!99)) lt!368129)))

(declare-fun b!230489 () Bool)

(declare-fun res!193191 () Bool)

(assert (=> b!230489 (=> (not res!193191) (not e!158302))))

(assert (=> b!230489 (= res!193191 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368129))))

(declare-fun b!230490 () Bool)

(declare-fun lt!368128 () (_ BitVec 64))

(assert (=> b!230490 (= e!158302 (bvsle lt!368129 (bvmul lt!368128 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230490 (or (= lt!368128 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368128 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368128)))))

(assert (=> b!230490 (= lt!368128 ((_ sign_extend 32) (size!5151 (buf!5692 b2!99))))))

(assert (= (and d!78222 res!193192) b!230489))

(assert (= (and b!230489 res!193191) b!230490))

(declare-fun m!353807 () Bool)

(assert (=> d!78222 m!353807))

(assert (=> d!78222 m!353805))

(assert (=> b!230464 d!78222))

(push 1)

(assert (not d!78220))

(assert (not d!78218))

(assert (not d!78214))

(assert (not d!78216))

(assert (not d!78222))

(check-sat)

(pop 1)

(push 1)

(check-sat)

