; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17636 () Bool)

(assert start!17636)

(declare-fun b!85082 () Bool)

(declare-fun e!56717 () Bool)

(declare-datatypes ((array!4039 0))(
  ( (array!4040 (arr!2462 (Array (_ BitVec 32) (_ BitVec 8))) (size!1825 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3212 0))(
  ( (BitStream!3213 (buf!2215 array!4039) (currentByte!4403 (_ BitVec 32)) (currentBit!4398 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3212)

(assert (=> b!85082 (= e!56717 (and (bvsle ((_ sign_extend 32) (size!1825 (buf!2215 thiss!1152))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4403 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4398 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1825 (buf!2215 thiss!1152))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4403 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4398 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!85083 () Bool)

(declare-fun res!69806 () Bool)

(assert (=> b!85083 (=> (not res!69806) (not e!56717))))

(declare-fun thiss!1151 () BitStream!3212)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85083 (= res!69806 (= (bitIndex!0 (size!1825 (buf!2215 thiss!1152)) (currentByte!4403 thiss!1152) (currentBit!4398 thiss!1152)) (bvadd (bitIndex!0 (size!1825 (buf!2215 thiss!1151)) (currentByte!4403 thiss!1151) (currentBit!4398 thiss!1151)) ((_ sign_extend 32) i!576))))))

(declare-fun res!69807 () Bool)

(assert (=> start!17636 (=> (not res!69807) (not e!56717))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> start!17636 (= res!69807 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17636 e!56717))

(assert (=> start!17636 true))

(declare-fun e!56715 () Bool)

(declare-fun inv!12 (BitStream!3212) Bool)

(assert (=> start!17636 (and (inv!12 thiss!1151) e!56715)))

(declare-fun e!56718 () Bool)

(assert (=> start!17636 (and (inv!12 thiss!1152) e!56718)))

(declare-fun b!85084 () Bool)

(declare-fun res!69805 () Bool)

(assert (=> b!85084 (=> (not res!69805) (not e!56717))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85084 (= res!69805 (invariant!0 (currentBit!4398 thiss!1152) (currentByte!4403 thiss!1152) (size!1825 (buf!2215 thiss!1152))))))

(declare-fun b!85085 () Bool)

(declare-fun res!69811 () Bool)

(assert (=> b!85085 (=> (not res!69811) (not e!56717))))

(assert (=> b!85085 (= res!69811 (invariant!0 (currentBit!4398 thiss!1151) (currentByte!4403 thiss!1151) (size!1825 (buf!2215 thiss!1151))))))

(declare-fun b!85086 () Bool)

(declare-fun res!69808 () Bool)

(assert (=> b!85086 (=> (not res!69808) (not e!56717))))

(assert (=> b!85086 (= res!69808 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!85087 () Bool)

(declare-fun array_inv!1671 (array!4039) Bool)

(assert (=> b!85087 (= e!56718 (array_inv!1671 (buf!2215 thiss!1152)))))

(declare-fun b!85088 () Bool)

(declare-fun res!69810 () Bool)

(assert (=> b!85088 (=> (not res!69810) (not e!56717))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85088 (= res!69810 (validate_offset_bits!1 ((_ sign_extend 32) (size!1825 (buf!2215 thiss!1151))) ((_ sign_extend 32) (currentByte!4403 thiss!1151)) ((_ sign_extend 32) (currentBit!4398 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!85089 () Bool)

(assert (=> b!85089 (= e!56715 (array_inv!1671 (buf!2215 thiss!1151)))))

(declare-fun b!85090 () Bool)

(declare-fun res!69809 () Bool)

(assert (=> b!85090 (=> (not res!69809) (not e!56717))))

(assert (=> b!85090 (= res!69809 (and (bvsle i!576 nBits!336) (= (size!1825 (buf!2215 thiss!1152)) (size!1825 (buf!2215 thiss!1151)))))))

(assert (= (and start!17636 res!69807) b!85088))

(assert (= (and b!85088 res!69810) b!85085))

(assert (= (and b!85085 res!69811) b!85086))

(assert (= (and b!85086 res!69808) b!85084))

(assert (= (and b!85084 res!69805) b!85090))

(assert (= (and b!85090 res!69809) b!85083))

(assert (= (and b!85083 res!69806) b!85082))

(assert (= start!17636 b!85089))

(assert (= start!17636 b!85087))

(declare-fun m!131375 () Bool)

(assert (=> b!85083 m!131375))

(declare-fun m!131377 () Bool)

(assert (=> b!85083 m!131377))

(declare-fun m!131379 () Bool)

(assert (=> start!17636 m!131379))

(declare-fun m!131381 () Bool)

(assert (=> start!17636 m!131381))

(declare-fun m!131383 () Bool)

(assert (=> b!85089 m!131383))

(declare-fun m!131385 () Bool)

(assert (=> b!85088 m!131385))

(declare-fun m!131387 () Bool)

(assert (=> b!85084 m!131387))

(declare-fun m!131389 () Bool)

(assert (=> b!85085 m!131389))

(declare-fun m!131391 () Bool)

(assert (=> b!85087 m!131391))

(push 1)

(assert (not b!85088))

(assert (not b!85083))

(assert (not b!85087))

(assert (not b!85084))

(assert (not start!17636))

(assert (not b!85085))

(assert (not b!85089))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27270 () Bool)

(declare-fun e!56729 () Bool)

(assert (=> d!27270 e!56729))

(declare-fun res!69833 () Bool)

(assert (=> d!27270 (=> (not res!69833) (not e!56729))))

(declare-fun lt!134619 () (_ BitVec 64))

(declare-fun lt!134622 () (_ BitVec 64))

(declare-fun lt!134617 () (_ BitVec 64))

(assert (=> d!27270 (= res!69833 (= lt!134622 (bvsub lt!134617 lt!134619)))))

(assert (=> d!27270 (or (= (bvand lt!134617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134619 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134617 lt!134619) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27270 (= lt!134619 (remainingBits!0 ((_ sign_extend 32) (size!1825 (buf!2215 thiss!1152))) ((_ sign_extend 32) (currentByte!4403 thiss!1152)) ((_ sign_extend 32) (currentBit!4398 thiss!1152))))))

(declare-fun lt!134618 () (_ BitVec 64))

(declare-fun lt!134620 () (_ BitVec 64))

(assert (=> d!27270 (= lt!134617 (bvmul lt!134618 lt!134620))))

(assert (=> d!27270 (or (= lt!134618 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134620 (bvsdiv (bvmul lt!134618 lt!134620) lt!134618)))))

(assert (=> d!27270 (= lt!134620 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27270 (= lt!134618 ((_ sign_extend 32) (size!1825 (buf!2215 thiss!1152))))))

(assert (=> d!27270 (= lt!134622 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4403 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4398 thiss!1152))))))

(assert (=> d!27270 (invariant!0 (currentBit!4398 thiss!1152) (currentByte!4403 thiss!1152) (size!1825 (buf!2215 thiss!1152)))))

(assert (=> d!27270 (= (bitIndex!0 (size!1825 (buf!2215 thiss!1152)) (currentByte!4403 thiss!1152) (currentBit!4398 thiss!1152)) lt!134622)))

(declare-fun b!85111 () Bool)

(declare-fun res!69832 () Bool)

(assert (=> b!85111 (=> (not res!69832) (not e!56729))))

(assert (=> b!85111 (= res!69832 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134622))))

(declare-fun b!85112 () Bool)

(declare-fun lt!134621 () (_ BitVec 64))

(assert (=> b!85112 (= e!56729 (bvsle lt!134622 (bvmul lt!134621 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!85112 (or (= lt!134621 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134621 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134621)))))

(assert (=> b!85112 (= lt!134621 ((_ sign_extend 32) (size!1825 (buf!2215 thiss!1152))))))

(assert (= (and d!27270 res!69833) b!85111))

(assert (= (and b!85111 res!69832) b!85112))

(declare-fun m!131401 () Bool)

(assert (=> d!27270 m!131401))

(assert (=> d!27270 m!131387))

(assert (=> b!85083 d!27270))

(declare-fun d!27286 () Bool)

(declare-fun e!56730 () Bool)

(assert (=> d!27286 e!56730))

(declare-fun res!69835 () Bool)

(assert (=> d!27286 (=> (not res!69835) (not e!56730))))

(declare-fun lt!134625 () (_ BitVec 64))

(declare-fun lt!134623 () (_ BitVec 64))

(declare-fun lt!134628 () (_ BitVec 64))

(assert (=> d!27286 (= res!69835 (= lt!134628 (bvsub lt!134623 lt!134625)))))

(assert (=> d!27286 (or (= (bvand lt!134623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134625 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134623 lt!134625) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27286 (= lt!134625 (remainingBits!0 ((_ sign_extend 32) (size!1825 (buf!2215 thiss!1151))) ((_ sign_extend 32) (currentByte!4403 thiss!1151)) ((_ sign_extend 32) (currentBit!4398 thiss!1151))))))

(declare-fun lt!134624 () (_ BitVec 64))

(declare-fun lt!134626 () (_ BitVec 64))

(assert (=> d!27286 (= lt!134623 (bvmul lt!134624 lt!134626))))

(assert (=> d!27286 (or (= lt!134624 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134626 (bvsdiv (bvmul lt!134624 lt!134626) lt!134624)))))

(assert (=> d!27286 (= lt!134626 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27286 (= lt!134624 ((_ sign_extend 32) (size!1825 (buf!2215 thiss!1151))))))

(assert (=> d!27286 (= lt!134628 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4403 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4398 thiss!1151))))))

(assert (=> d!27286 (invariant!0 (currentBit!4398 thiss!1151) (currentByte!4403 thiss!1151) (size!1825 (buf!2215 thiss!1151)))))

(assert (=> d!27286 (= (bitIndex!0 (size!1825 (buf!2215 thiss!1151)) (currentByte!4403 thiss!1151) (currentBit!4398 thiss!1151)) lt!134628)))

(declare-fun b!85113 () Bool)

(declare-fun res!69834 () Bool)

(assert (=> b!85113 (=> (not res!69834) (not e!56730))))

(assert (=> b!85113 (= res!69834 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134628))))

(declare-fun b!85114 () Bool)

(declare-fun lt!134627 () (_ BitVec 64))

(assert (=> b!85114 (= e!56730 (bvsle lt!134628 (bvmul lt!134627 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!85114 (or (= lt!134627 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134627 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134627)))))

(assert (=> b!85114 (= lt!134627 ((_ sign_extend 32) (size!1825 (buf!2215 thiss!1151))))))

(assert (= (and d!27286 res!69835) b!85113))

(assert (= (and b!85113 res!69834) b!85114))

(declare-fun m!131403 () Bool)

(assert (=> d!27286 m!131403))

(assert (=> d!27286 m!131389))

(assert (=> b!85083 d!27286))

(declare-fun d!27294 () Bool)

(assert (=> d!27294 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1825 (buf!2215 thiss!1151))) ((_ sign_extend 32) (currentByte!4403 thiss!1151)) ((_ sign_extend 32) (currentBit!4398 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1825 (buf!2215 thiss!1151))) ((_ sign_extend 32) (currentByte!4403 thiss!1151)) ((_ sign_extend 32) (currentBit!4398 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6754 () Bool)

(assert (= bs!6754 d!27294))

(assert (=> bs!6754 m!131403))

(assert (=> b!85088 d!27294))

(declare-fun d!27296 () Bool)

(assert (=> d!27296 (= (array_inv!1671 (buf!2215 thiss!1151)) (bvsge (size!1825 (buf!2215 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!85089 d!27296))

(declare-fun d!27298 () Bool)

(assert (=> d!27298 (= (invariant!0 (currentBit!4398 thiss!1152) (currentByte!4403 thiss!1152) (size!1825 (buf!2215 thiss!1152))) (and (bvsge (currentBit!4398 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4398 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4403 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4403 thiss!1152) (size!1825 (buf!2215 thiss!1152))) (and (= (currentBit!4398 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4403 thiss!1152) (size!1825 (buf!2215 thiss!1152)))))))))

(assert (=> b!85084 d!27298))

(declare-fun d!27300 () Bool)

(assert (=> d!27300 (= (invariant!0 (currentBit!4398 thiss!1151) (currentByte!4403 thiss!1151) (size!1825 (buf!2215 thiss!1151))) (and (bvsge (currentBit!4398 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4398 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4403 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4403 thiss!1151) (size!1825 (buf!2215 thiss!1151))) (and (= (currentBit!4398 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4403 thiss!1151) (size!1825 (buf!2215 thiss!1151)))))))))

(assert (=> b!85085 d!27300))

(declare-fun d!27302 () Bool)

(assert (=> d!27302 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4398 thiss!1151) (currentByte!4403 thiss!1151) (size!1825 (buf!2215 thiss!1151))))))

(declare-fun bs!6756 () Bool)

(assert (= bs!6756 d!27302))

(assert (=> bs!6756 m!131389))

(assert (=> start!17636 d!27302))

(declare-fun d!27304 () Bool)

(assert (=> d!27304 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4398 thiss!1152) (currentByte!4403 thiss!1152) (size!1825 (buf!2215 thiss!1152))))))

(declare-fun bs!6757 () Bool)

(assert (= bs!6757 d!27304))

(assert (=> bs!6757 m!131387))

(assert (=> start!17636 d!27304))

(declare-fun d!27306 () Bool)

(assert (=> d!27306 (= (array_inv!1671 (buf!2215 thiss!1152)) (bvsge (size!1825 (buf!2215 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!85087 d!27306))

(push 1)

(assert (not d!27294))

(assert (not d!27270))

(assert (not d!27304))

(assert (not d!27286))

(assert (not d!27302))

(check-sat)

(pop 1)

(push 1)

(check-sat)

